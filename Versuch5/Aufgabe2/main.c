#include "MYHEAD.h"

#define LED1 (1 << 4)
#define LED2 (1 << 5)
#define T1 (1 << 2)
#define T2 (1 << 3)
#define S1 (1 << 0)
#define S2 (1 << 1)
#define T1_ON !(P0_IN & T1)
#define T2_ON !(P0_IN & T2)
#define S1_ON (P0_IN & S1)
#define S2_ON (P0_IN & S2)

void portInit(){
	// INPUT setzen
	P0_IOCR_0 =	0x20;
	P0_IOCR_1 =	0x20;		
	P0_IOCR_2 = 0x00;
	P0_IOCR_3 = 0x00;

	// OUTPUT setzen
	P0_IOCR_4 = 0x80;
	P0_IOCR_5 = 0x80;
	P0_OUT |= LED1;
	P0_OUT |= LED2;
}


void main(void) {
	portInit();

	while(1){
		if(S1_ON){		
			if(T1_ON){
				P0_OUT &= ~LED1;
			}else{
				P0_OUT |= LED1; 	
			}
		}
		
		if(S2_ON){
			if(T2_ON){
				P0_OUT &= ~LED2;
			}else{
				P0_OUT |= LED2;		 	
			}
		}
	}
}