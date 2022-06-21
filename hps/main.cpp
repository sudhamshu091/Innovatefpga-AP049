#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <fcntl.h>
#include <sys/mman.h>
#include <string.h>
#include <iostream>
#include <cstdio>
#include <math.h>

#define ALT_STM_OFST        0xfc000000 /* From socal/hps.h */
#define ALT_LWFPGASLVS_OFST 0xff200000 /* From socal/hps.h */
#define HW_REGS_SPAN 		( 0x04000000 )
#define HW_REGS_BASE 		( ALT_STM_OFST )
#define HW_REGS_MASK 		( HW_REGS_SPAN - 1 )
#define ALT_LWFPGASLVS_OFST 0xff200000
/*
 * Macros for device 'adc_ltc2308', class 'adc_ltc2308'
 * The macros are prefixed with 'ADC_LTC2308_'.
 * The prefix is the slave descriptor.
 */
#define ADC_LTC2308_COMPONENT_TYPE adc_ltc2308
#define ADC_LTC2308_COMPONENT_NAME adc_ltc2308
#define ADC_LTC2308_BASE 0x43020
#define ADC_LTC2308_SPAN 8
#define ADC_LTC2308_END 0x43027

int main(void){
	int ch = 0;
	const int nReadNum = 10; // max 1024
	int i, Value=0;
	float R1 = 10000;
	float c1 = 0.001129148, c2 = 0.000234125, c3 = 0.0000000876741;
	float logR2, R2, T;
	unsigned int SYSTEM_BUS_WIDTH = 32;	
	void* h2p_base_addr_adc;

	void *virtual_base;
	int fd;

	if( ( fd = open( "/dev/mem", ( O_RDWR | O_SYNC ) ) ) == -1 ) {
		printf( "ERROR: could not open \"/dev/mem\"...\n" );
		return( 1 );
	}

	virtual_base = mmap( NULL, HW_REGS_SPAN, ( PROT_READ | PROT_WRITE ), MAP_SHARED, fd, HW_REGS_BASE );

	if( virtual_base == MAP_FAILED ) {
		printf( "ERROR: mmap() failed...\n" );
		close( fd );
		return( 1 );
	}

//ADC Access
	h2p_base_addr_adc = virtual_base + ( ( unsigned long  )( ALT_LWFPGASLVS_OFST + ADC_LTC2308_BASE ) & ( unsigned long)( HW_REGS_MASK ) );
	void* LTC_0X00_ADDR = h2p_base_addr_adc + (0X00000000) * (SYSTEM_BUS_WIDTH / 8);
	void* LTC_0X01_ADDR = h2p_base_addr_adc + (0X00000001) * (SYSTEM_BUS_WIDTH / 8);

	while(1){
		// start measure
		*(uint32_t *)LTC_0X00_ADDR = ((ch << 1) | 0x00);
		*(uint32_t *)LTC_0X00_ADDR = ((ch << 1) | 0x01);
		*(uint32_t *)LTC_0X00_ADDR = ((ch << 1) | 0x00);
		usleep(1);

		// wait measure done
			int test_read = *(uint32_t *)LTC_0X00_ADDR;
			while ((test_read & 0x01) == 0x00)
			{
				test_read = *(uint32_t *)LTC_0X00_ADDR;
			}

		// read adc value
		for(i=0;i<nReadNum;i++){
			Value = *(uint32_t *)LTC_0X01_ADDR;
			if(ch==1){
			R2 = R1 * (1023.0 / (((float)Value/1000.0)*198.75) - 1.0);
			logR2 = log(R2);
			T = (1.0 / (c1 + c2*logR2 + c3*logR2*logR2*logR2));
			T = T - 273.15;
			printf("%.3fC\n",T);
			}
			if(ch==2){
				printf("%.3fV\n",((float)Value)*205/1000.0);
			}
			if(ch==3){
				printf("%.3fppm\n",((float)Value*179.64)/1000.0);
			}
			if(ch==4){
				if((float)Value/1000.0 > 1.2216){
				printf("%.3f\n",((float)Value*16.5)/1000.0);
				}
				else{
				printf("%.3f\n",((float)Value*-16.5)/1000.0);
				}
			}
		usleep(200*1000);
	} // while
}
	// clean up our memory mapping and exit
	if( munmap( virtual_base, HW_REGS_SPAN ) != 0 ) {
		printf( "ERROR: munmap() failed...\n" );
		close( fd );
		return( 1 );
	}

	close( fd );

	return( 0 );
}
