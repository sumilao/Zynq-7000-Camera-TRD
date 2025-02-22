/*
 * main.c
 *
 *  Created on: 2019��6��27��
 *      Author: yongw
 */

#include "xparameters.h"
#include "xil_printf.h"
#include "xstatus.h"
#include "stdlib.h"
#include "main.h"
#include "sleep.h"
#include "xdebug.h"
#include "xiicps.h"

#include "ov5640.h"
#include "xv_demosaic.h"

#include "display_ctrl/dynclk_ctrl.h"
#include "display_ctrl/vtc_ctrl.h"


#define CAM_DEV_ADDR 0x3C
#define IIC_ID XPAR_PS7_I2C_0_DEVICE_ID
#define IIC_SCLK_RATE 100000

#define DYNCLK_BASEADDR XPAR_AXI_DYNCLK_0_BASEADDR
#define VDMA_BASEADDR_0 XPAR_AXI_VDMA_0_BASEADDR
#define VDMA_BASEADDR_1 XPAR_AXI_VDMA_1_BASEADDR
#define DISP_VTC_ID XPAR_VTC_0_DEVICE_ID

int XIicPsInit(XIicPs *Iic, u16 DeviceId, u32 FsclHz);
int XIicPsSend(XIicPs *Iic, uint16_t addr, uint8_t data);

#include "xil_cache.h"
#include "xinner_ctrl.h"
#include "xsobel_ip.h"
#include "xresize_ip.h"

#define CHANNEL 3

XInner_ctrl inner_ctrl;

int main()
{
	xil_printf("\x1B[H"); //Set cursor to top left of terminal
	xil_printf("\x1B[2J"); //Clear terminal
	int Status;
	int Index;
	XIicPs *Iic = (XIicPs*)malloc(sizeof(XIicPs));
	Status = XIicPsInit(Iic, IIC_ID, IIC_SCLK_RATE);

	XV_demosaic *demosaicPtr = (XV_demosaic*)malloc(sizeof(XV_demosaic));
	XV_demosaic_Initialize(demosaicPtr, XPAR_V_DEMOSAIC_0_DEVICE_ID);

	xil_printf("mosaic init \r\n");
	XV_demosaic_Set_HwReg_width(demosaicPtr, 1280);
	XV_demosaic_Set_HwReg_height(demosaicPtr, 720);
	XV_demosaic_Set_HwReg_bayer_phase(demosaicPtr, 1);
	XV_demosaic_EnableAutoRestart(demosaicPtr);
	XV_demosaic_Start(demosaicPtr);

	int length = sizeof(ov5640_config)/sizeof(config_word_t);
	xil_printf("%d\r\n", length);

	for(Index = 0; Index < length; Index++)
		XIicPsSend(Iic, ov5640_config[Index].addr, ov5640_config[Index].data);

	xil_printf("IIC done!\r\n");
	VtcCtrl *vtcPtr = (VtcCtrl*)malloc(sizeof(VtcCtrl));
	DynclkCtrl *dynclkPtr= (DynclkCtrl*)malloc(sizeof(DynclkCtrl));

	xil_printf("Start\r\n");

	VideoMode vMode = VMODE_1280x720;

	Status = DynclkInitialize(dynclkPtr, DYNCLK_BASEADDR, vMode.freq);
	if (Status != XST_SUCCESS)
	{
		xil_printf("Dynclk Configuration Initialization failed %d\r\n", Status);
		return XST_FAILURE;
	}
	Status = DynclkStart(dynclkPtr, vMode.freq);
	if (Status != XST_SUCCESS)
	{
		xil_printf("Couldn't start dynclk %d\r\n", Status);
		return XST_FAILURE;
	}

	Status = VtcInitialize(vtcPtr, DISP_VTC_ID);
	if (Status != XST_SUCCESS)
	{
		xil_printf("Vtc Configuration Initialization failed %d\r\n", Status);
		return XST_FAILURE;
	}
	Status = VtcStart(vtcPtr);
	if (Status != XST_SUCCESS)
	{
		xil_printf("Couldn't start vtc %d\r\n", Status);
		return XST_FAILURE;
	}

	XInner_ctrl_Initialize(&inner_ctrl, 0);
	XInner_ctrl_EnableAutoRestart(&inner_ctrl);
	XInner_ctrl_Start(&inner_ctrl);
	XInner_ctrl_Set_output_V(&inner_ctrl, 0);
	xil_printf("inner ctrl %d\r\n", XInner_ctrl_Get_input_V(&inner_ctrl));

//	XFast_ip fast;
//	Status = XFast_ip_Initialize(&fast, 0);
//	xil_printf("fast init %d\r\n", Status);
//	XFast_ip_Set_height(&fast, 720);
//	XFast_ip_Set_width(&fast, 1280);
//	XFast_ip_Set_threshold(&fast, 10);
//	XFast_ip_InterruptGlobalDisable(&fast);
//	XFast_ip_EnableAutoRestart(&fast);
//	XFast_ip_Start(&fast);

	XSobel_ip sobel;
	Status = XSobel_ip_Initialize(&sobel, 0);
	xil_printf("fast init %d\r\n", Status);
	XSobel_ip_Set_height(&sobel, 720);
	XSobel_ip_Set_width(&sobel, 1280);
	XSobel_ip_InterruptGlobalDisable(&sobel);
	XSobel_ip_EnableAutoRestart(&sobel);
	XSobel_ip_Start(&sobel);


	XResize_ip resize;
	Status = XResize_ip_Initialize(&resize, 0);
	xil_printf("resize init %d\r\n", Status);
	XResize_ip_Set_src_height(&resize, 720);
	XResize_ip_Set_src_width(&resize, 1280);
	XResize_ip_Set_dst_height(&resize, 360);
	XResize_ip_Set_dst_width(&resize, 640);
	XResize_ip_InterruptGlobalDisable(&resize);
	XResize_ip_EnableAutoRestart(&resize);
	XResize_ip_Start(&resize);

	xil_printf("vdma starts\r\n");
	Xil_Out32((VDMA_BASEADDR_0 + 0x030),0x0108b);
	Xil_Out32((VDMA_BASEADDR_0 + 0x0AC), 0x01000000);
	Xil_Out32((VDMA_BASEADDR_0 + 0x0B0), 0x02000000);
	Xil_Out32((VDMA_BASEADDR_0 + 0x0B4), 0x03000000);
	Xil_Out32((VDMA_BASEADDR_0 + 0x0A8), (1280 * CHANNEL));
	Xil_Out32((VDMA_BASEADDR_0 + 0x0A4), (1280 * CHANNEL));
	Xil_Out32((VDMA_BASEADDR_0 + 0x0A0), 720);

	Xil_Out32((VDMA_BASEADDR_0 + 0x000), 0x008b);
	Xil_Out32((VDMA_BASEADDR_0 + 0x05c), 0x01000000);
	Xil_Out32((VDMA_BASEADDR_0 + 0x060), 0x02000000);
	Xil_Out32((VDMA_BASEADDR_0 + 0x064), 0x03000000);
	Xil_Out32((VDMA_BASEADDR_0 + 0x058), (1280 * CHANNEL));
	Xil_Out32((VDMA_BASEADDR_0 + 0x054), (1280 * CHANNEL));
	Xil_Out32((VDMA_BASEADDR_0 + 0x050), 720);

	Xil_Out32((VDMA_BASEADDR_1 + 0x030),0x0108b);
	Xil_Out32((VDMA_BASEADDR_1 + 0x0AC), 0x04000000);
	Xil_Out32((VDMA_BASEADDR_1 + 0x0B0), 0x05000000);
	Xil_Out32((VDMA_BASEADDR_1 + 0x0B4), 0x06000000);
	Xil_Out32((VDMA_BASEADDR_1 + 0x0A8), (1280 * CHANNEL));
	Xil_Out32((VDMA_BASEADDR_1 + 0x0A4), (1280 * CHANNEL));
	Xil_Out32((VDMA_BASEADDR_1 + 0x0A0), 720);

	Xil_Out32((VDMA_BASEADDR_1 + 0x000), 0x008b);
	Xil_Out32((VDMA_BASEADDR_1 + 0x05c), 0x04000000);
	Xil_Out32((VDMA_BASEADDR_1 + 0x060), 0x05000000);
	Xil_Out32((VDMA_BASEADDR_1 + 0x064), 0x06000000);
	Xil_Out32((VDMA_BASEADDR_1 + 0x058), (1280 * CHANNEL));
	Xil_Out32((VDMA_BASEADDR_1 + 0x054), (1280 * CHANNEL));
	Xil_Out32((VDMA_BASEADDR_1 + 0x050), 720);

	u8 *data;
	data = (u8 *)0x04000000;

	while(1)
	{
		XInner_ctrl_Set_output_V(&inner_ctrl, 0);
		sleep(3);

		XInner_ctrl_Set_output_V(&inner_ctrl, 1);
		for(u32 i = 0; i < 0x03000000; ++i)
			data[i] = 0;
		Xil_DCacheFlushRange(0x04000000, 0x03000000);
		sleep(3);

		XInner_ctrl_Set_output_V(&inner_ctrl, 2);
		sleep(3);

		XInner_ctrl_Set_output_V(&inner_ctrl, 3);
		sleep(3);
	}


	xil_printf("config done\r\n");
}

int XIicPsInit(XIicPs *Iic, u16 DeviceId, u32 FsclHz)
{
	int Status;
	XIicPs_Config *Config;
	Config = XIicPs_LookupConfig(DeviceId);
	if (NULL == Config) {
		xdbg_printf(XDBG_DEBUG_GENERAL, "lookup config failed %d\r\n", Status);
		return XST_FAILURE;
	}
	Status = XIicPs_CfgInitialize(Iic, Config, Config->BaseAddress);
	if (Status != XST_SUCCESS) {
		xdbg_printf(XDBG_DEBUG_GENERAL, "Initialize failed %d\r\n", Status);
		return XST_FAILURE;
	}
	/*
	 * Perform a self-test to ensure that the hardware was built correctly.
	 */
	Status = XIicPs_SelfTest(Iic);
	if (Status != XST_SUCCESS) {
		xdbg_printf(XDBG_DEBUG_GENERAL, "SelfTest failed %d\r\n", Status);
		return XST_FAILURE;
	}
	/*
	 * Set the IIC serial clock rate.
	 */
	XIicPs_SetSClk(Iic, FsclHz);
	return XST_SUCCESS;
}

int XIicPsSend(XIicPs *Iic, uint16_t addr, uint8_t data)
{
	u8 SendBuffer[3];
	SendBuffer[0] = (addr >> 8) & 0xff;
	SendBuffer[1] = addr & 0xff;
	SendBuffer[2] = data & 0xff;
	XIicPs_MasterSendPolled(Iic, SendBuffer,
				 3, CAM_DEV_ADDR);
	return XST_SUCCESS;
}
