#ifndef MYHEAD
#define MYHEAD


#define P0_IOCR_0 (*((volatile unsigned short *) 0xE800))
#define P0_IOCR_1 (*((volatile unsigned short *) 0xE802))
#define P0_IOCR_2 (*((volatile unsigned short *) 0xE804))
#define P0_IOCR_3 (*((volatile unsigned short *) 0xE806))
#define P0_IOCR_4 (*((volatile unsigned short *) 0xE808))
#define P0_IOCR_5 (*((volatile unsigned short *) 0xE80A))
#define P0_IOCR_6 (*((volatile unsigned short *) 0xE80C))
#define P0_IOCR_7 (*((volatile unsigned short *) 0xE80E))

#define P0_IN  (*((volatile unsigned short *) 0xFF80 ))

#define P0_OUT (*((volatile unsigned short *) 0xFFA2 ))


#endif