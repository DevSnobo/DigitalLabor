#include "XE164F_HS.h"

#ifndef __t3power__
#define __t3power__


void t3power(void)
{
  unsigned int PWD, temp;
 
    SCU_SLC = 0xAAAA;            
    SCU_SLC = 0x5554;              

    PWD = SCU_SLS & 0x00FF;
    PWD = (~PWD) & 0x00FF;

    SCU_SLC = 0x9600 | PWD;    
    SCU_SLC = 0x0000;                

		
	GPT12E_KSCCFG = 3;
	temp = GPT12E_KSCCFG;

}

#endif