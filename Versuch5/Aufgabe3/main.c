#include <stdio.h>
#include "XE164F_HS.h"

void t3Init() {
		void t3power(void);
}

void portInit() {
    // INPUT setzen
    P0_IOCR00 = 0; //S1
    P0_IOCR01 = 0; //S2
    P0_IOCR02 = 0; //T1
    P0_IOCR03 = 0; //T2

    // OUTPUT setzen
    P0_IOCR04 = 1; //LED1
    P0_IOCR05 = 1; //LED2
    P0_IOCR06 = 1; //LED3
    P0_IOCR07 = 1; //LED4
}


void main(void) {
		t3Init();
    portInit();

    while (1) {
        if (P0_IOCR00) {
            if (P0_IOCR02) {
                P0_IOCR04 &= ~P0_IOCR04;
								//T3 in LED3 kopieren
            } else {
                P0_IOCR04 |= P0_IOCR04;
								//T3 in LED3 kopieren
            }
        }

        if (P0_IOCR01) {
            if (P0_IOCR03) {
                P0_IOCR05 &= ~P0_IOCR05;
								//T3 in LED3 kopieren
            } else {
                P0_IOCR05 |= P0_IOCR05;
								//T3 in LED3 kopieren
            }
        }
    }
}