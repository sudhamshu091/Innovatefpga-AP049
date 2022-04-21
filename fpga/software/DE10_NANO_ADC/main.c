#include <stdio.h>
#include <io.h>
#include <unistd.h>
#include <math.h>

#include "system.h"

void main(void){
	int ch = 0;
	const int nReadNum = 10; // max 1024
	int i, Value=0;
	float R1 = 10000;
	float c1 = 0.001129148, c2 = 0.000234125, c3 = 0.0000000876741;
	float logR2, R2, T;
	printf("Enter the sensor value, 1 for temp sensor, 2 for GSR, 3 for Gas, 4 for Light");
	scanf("%d", &a);

	while(1){
		ch = IORD(SW_BASE, 0x00) & 0x07;

		IOWR(ADC_LTC2308_BASE, 0x01, nReadNum);


		// start measure
		IOWR(ADC_LTC2308_BASE, 0x00, (ch << 1) | 0x00);
		IOWR(ADC_LTC2308_BASE, 0x00, (ch << 1) | 0x01);
		IOWR(ADC_LTC2308_BASE, 0x00, (ch << 1) | 0x00);
		usleep(1);

		// wait measure done
		while ((IORD(ADC_LTC2308_BASE,0x00) & 0x01) == 0x00);

		// read adc value
		for(i=0;i<nReadNum;i++){
			Value = IORD(ADC_LTC2308_BASE, 0x01);
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
}
