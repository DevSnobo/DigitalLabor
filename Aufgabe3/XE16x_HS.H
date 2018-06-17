//****************************************************************************
// Description
//       Register Definition File for Infineon XE16x devices
//  => Keil3\C166\inc\*
//  ------------------------------------------------------------------------
// History:
//
//       Rev.             Date        Description
//       ---------------------------------------------------------------------
//       1.0              13.04.07    Initial version
//       Modifiziert für Digitallabor 
//
//
//****************************************************************************


#ifndef _XE16X_HS_REGS_H_
#define _XE16X_HS_REGS_H_

//****************************************************************************
// @Declaration of SFRs
//****************************************************************************


// Kernel State Configuration Register
#define ADC0_KSCFG             (*((unsigned int volatile sdata *) 0xE00C))


// Register Bank Selection Reg. 0
#define BNKSEL0                (*((unsigned int volatile sdata *) 0xEC20))

// Register Bank Selection Reg. 1
#define BNKSEL1                (*((unsigned int volatile sdata *) 0xEC22))

// Register Bank Selection Reg. 2
#define BNKSEL2                (*((unsigned int volatile sdata *) 0xEC24))

// Register Bank Selection Reg. 3
#define BNKSEL3                (*((unsigned int volatile sdata *) 0xEC26))	 

// Monitor target ADdress register
sfr	CMADR 							  = 0xF0F8;

// Monitor Control and Break Level register
sfr  CMCTR                            = 0xF0FA;

// COMDATA in Monitor Controlled Tracing Mode
sfr  COMDATA                          = 0xF068;

// Data Register in Communication Mode
sfr  COMDATA                          = 0xF068;

// Context Pointer
sfr  CP                               = 0xFE10;

// CPU Control Register 1
sfr  CPUCON1                          = 0xFE18;

// CPU Control Register 2
sfr  CPUCON2                          = 0xFE1A;

// Code Segment Pointer
sfr  CSP                              = 0xFE08;

// Debug Status Register
sfr  DBGSR                            = 0xF0FC;

// Data Compare Data Programming register
sfr  DCMPDP                           = 0xF0EE;

// Data Compare Select Programming register
sfr  DCMPSP                           = 0xF0EC;

// Break Pin Event Control Register
sfr  DEXEVT                           = 0xF0F2;

// Data Page Pointer 0
sfr  DPP0                             = 0xFE00;

// Data Page Pointer 1
sfr  DPP1                             = 0xFE02;

// Data Page Pointer 2
sfr  DPP2                             = 0xFE04;

// Data Page Pointer 3
sfr  DPP3                             = 0xFE06;

// Software Debug Event Control Register
sfr  DSWEVT                           = 0xF0F4;

// Task ID Register
sfr  DTIDR                            = 0xF0D8;			  

// Hardware Trigger Event Control Register
sfr  DTREVT                           = 0xF0F0;

// Address Range/Size for CS1
#define EBC_ADDRSEL1           (*((unsigned int volatile sdata *) 0xEE1E))

// Address Range/Size for CS2
#define EBC_ADDRSEL2           (*((unsigned int volatile sdata *) 0xEE26))

// Address Range/Size for CS3
#define EBC_ADDRSEL3           (*((unsigned int volatile sdata *) 0xEE2E))

// Address Range/Size for CS4
#define EBC_ADDRSEL4           (*((unsigned int volatile sdata *) 0xEE36))

// Address Range/Size for CS7
#define EBC_ADDRSEL7           (*((unsigned int volatile sdata *) 0xEE4E))

// EBC Mode Register 0
#define EBC_EBCMOD0            (*((unsigned int volatile sdata *) 0xEE00))

// EBC Mode Register 1
#define EBC_EBCMOD1            (*((unsigned int volatile sdata *) 0xEE02))

// Function Cfg. Reg. for CS0
#define EBC_FCONCS0            (*((unsigned int volatile sdata *) 0xEE12))

// Function Cfg. Reg. for CS1
#define EBC_FCONCS1            (*((unsigned int volatile sdata *) 0xEE1A))

// Function Cfg. Reg. for CS2
#define EBC_FCONCS2            (*((unsigned int volatile sdata *) 0xEE22))

// Function Cfg. Reg. for CS3
#define EBC_FCONCS3            (*((unsigned int volatile sdata *) 0xEE2A))

// Function Cfg. Reg. for CS4
#define EBC_FCONCS4            (*((unsigned int volatile sdata *) 0xEE32))

// Function Cfg. Reg. for CSx
#define EBC_FCONCS7            (*((unsigned int volatile sdata *) 0xEE4A))

// Timing Cfg. Reg. for CS0
#define EBC_TCONCS0            (*((unsigned int volatile sdata *) 0xEE10))

// Timing Cfg. Reg. for CS1
#define EBC_TCONCS1            (*((unsigned int volatile sdata *) 0xEE18))

// Timing Cfg. Reg. for CS2
#define EBC_TCONCS2            (*((unsigned int volatile sdata *) 0xEE20))

// Timing Cfg. Reg. for CS3
#define EBC_TCONCS3            (*((unsigned int volatile sdata *) 0xEE28))

// Timing Cfg. Reg. for CS4
#define EBC_TCONCS4            (*((unsigned int volatile sdata *) 0xEE30))

// Timing Cfg. Reg. for CS7
#define EBC_TCONCS7            (*((unsigned int volatile sdata *) 0xEE48))

// EOP Interrupt Control Reg.
sfr  EOPIC                            = 0xF19E;
sbit EOPIC_EOPIE                    = EOPIC^6;
sbit EOPIC_EOPIR                    = EOPIC^7;
sbit EOPIC_GPX                      = EOPIC^8;

// Fast Interrupt Address Reg. 0
#define FINT0ADDR              (*((unsigned int volatile sdata *) 0xEC02))

// Fast Interrupt Control Reg. 0
#define FINT0CSP               (*((unsigned int volatile sdata *) 0xEC00))

// Fast Interrupt Address Reg. 1
#define FINT1ADDR              (*((unsigned int volatile sdata *) 0xEC06))

// Fast Interrupt Control Reg. 1
#define FINT1CSP               (*((unsigned int volatile sdata *) 0xEC04))

// Flash Kernel State Con. Register
sfr  FL_KSCCFG                        = 0xFE22;

// Capture/Reload Register
sfr  GPT12E_CAPREL                    = 0xFE4A;

// GPT12 CAPREL IC
sfr  GPT12E_CRIC                      = 0xFF6A;
sbit GPT12E_CRIC_GPX                      = GPT12E_CRIC^8;
sbit GPT12E_CRIC_IE                       = GPT12E_CRIC^6;
sbit GPT12E_CRIC_IR                       = GPT12E_CRIC^7;

// GPT12E Kernel State Con. Register
sfr  GPT12E_KSCCFG                    = 0xFE1C;

// Timer 2
sfr  T2                        = 0xFE40;

// Timer 2 Control Register
sfr  T2CON                     = 0xFF40;
sbit T2CON_T2CHDIR                  = T2CON^14;
sbit T2CON_T2EDGE                   = T2CON^13;
sbit T2CON_T2IRDIS                  = T2CON^12;
sbit T2CON_T2R                      = T2CON^6;
sbit T2CON_T2RC                     = T2CON^9;
sbit T2CON_T2RDIR                   = T2CON^15;
sbit T2CON_T2UD                     = T2CON^7;
sbit T2CON_T2UDE                    = T2CON^8;

// GPT12 TIMER 2 IC
sfr  T2IC                      = 0xFF60;
sbit T2IC_GPX                      = T2IC^8;
sbit T2IC_IE                       = T2IC^6;
sbit T2IC_IR                       = T2IC^7;

// Timer 3
sfr  T3                        = 0xFE42;

// Timer 3 Control Register
sfr  T3CON                    = 0xFF42;
sbit T3CHDIR                  = T3CON^14;
sbit T3EDGE                   = T3CON^13;
sbit T3OE                     = T3CON^9;
sbit T3OTL                    = T3CON^10;
sbit T3R                      = T3CON^6;
sbit T3RDIR                   = T3CON^15;
sbit T3UD                     = T3CON^7;
sbit T3UDE                    = T3CON^8;

// GPT12 TIMER 3 IC
sfr  T3IC                      = 0xFF62;
sbit T3IC_GPX                      = T3IC^8;
sbit T3IC_IE                       = T3IC^6;
sbit T3IC_IR                       = T3IC^7;

// Timer 4
sfr  T4                        = 0xFE44;

// Timer 4 Control Register
sfr  T4CON                     = 0xFF44;
sbit T4CON_T4CHDIR                  = T4CON^14;
sbit T4CON_T4EDGE                   = T4CON^13;
sbit T4CON_T4IRDIS                  = T4CON^12;
sbit T4CON_T4R                      = T4CON^6;
sbit T4CON_T4RC                     = T4CON^9;
sbit T4CON_T4RDIR                   = T4CON^15;
sbit T4CON_T4UD                     = T4CON^7;
sbit T4CON_T4UDE                    = T4CON^8;

// GPT12 TIMER 4 IC
sfr  T4IC                      = 0xFF64;
sbit T4IC_GPX                      = T4IC^8;
sbit T4IC_IE                       = T4IC^6;
sbit T4IC_IR                       = T4IC^7;

// Timer 5
sfr  GPT12E_T5                        = 0xFE46;

// Timer 5 Control Register
sfr  GPT12E_T5CON                     = 0xFF46;
sbit GPT12E_T5CON_CT3                      = GPT12E_T5CON^10;
sbit GPT12E_T5CON_T5CC                     = GPT12E_T5CON^11;
sbit GPT12E_T5CON_T5CLR                    = GPT12E_T5CON^14;
sbit GPT12E_T5CON_T5R                      = GPT12E_T5CON^6;
sbit GPT12E_T5CON_T5RC                     = GPT12E_T5CON^9;
sbit GPT12E_T5CON_T5SC                     = GPT12E_T5CON^15;
sbit GPT12E_T5CON_T5UD                     = GPT12E_T5CON^7;
sbit GPT12E_T5CON_T5UDE                    = GPT12E_T5CON^8;

// GPT12 TIMER 5 IC
sfr  GPT12E_T5IC                      = 0xFF66;
sbit GPT12E_T5IC_GPX                      = GPT12E_T5IC^8;
sbit GPT12E_T5IC_IE                       = GPT12E_T5IC^6;
sbit GPT12E_T5IC_IR                       = GPT12E_T5IC^7;

// Timer 6
sfr  GPT12E_T6                        = 0xFE48;

// Timer 6 Control Register
sfr  GPT12E_T6CON                     = 0xFF48;
sbit GPT12E_T6CON_T6CLR                    = GPT12E_T6CON^14;
sbit GPT12E_T6CON_T6OE                     = GPT12E_T6CON^9;
sbit GPT12E_T6CON_T6OTL                    = GPT12E_T6CON^10;
sbit GPT12E_T6CON_T6R                      = GPT12E_T6CON^6;
sbit GPT12E_T6CON_T6SR                     = GPT12E_T6CON^15;
sbit GPT12E_T6CON_T6UD                     = GPT12E_T6CON^7;
sbit GPT12E_T6CON_T6UDE                    = GPT12E_T6CON^8;

// GPT12 TIMER 6 IC
sfr  GPT12E_T6IC                      = 0xFF68;
sbit GPT12E_T6IC_GPX                      = GPT12E_T6IC^8;
sbit GPT12E_T6IC_IE                       = GPT12E_T6IC^6;
sbit GPT12E_T6IC_IR                       = GPT12E_T6IC^7;

// Address Pointer
sfr  IDX0                             = 0xFF08;

// Address Pointer
sfr  IDX1                             = 0xFF0A;

// Flash State Busy
#define IMB_FSR_BUSY           (*((unsigned int volatile huge *) 0xFFFF06))

// Flash State Operations
#define IMB_FSR_OP             (*((unsigned int volatile huge *) 0xFFFF08))

// Flash State Protection
#define IMB_FSR_PROT           (*((unsigned int volatile huge *) 0xFFFF0A))

// IMB Control High
#define IMB_IMBCTRH            (*((unsigned int volatile huge *) 0xFFFF02))

// IMB Control Low
#define IMB_IMBCTRL            (*((unsigned int volatile huge *) 0xFFFF00))

// Interrupt Control
#define IMB_INTCTR             (*((unsigned int volatile huge *) 0xFFFF04))

// Margin Control
#define IMB_MAR                (*((unsigned int volatile huge *) 0xFFFF0C))

// Protection Configuration 0.
#define IMB_PROCON0            (*((unsigned int volatile huge *) 0xFFFF10))

// Protection Configuration 1.
#define IMB_PROCON1            (*((unsigned int volatile huge *) 0xFFFF12))

// Protection Configuration 2.
#define IMB_PROCON2            (*((unsigned int volatile huge *) 0xFFFF14))

// Status and Control Register
sfr  IOSR                             = 0xF06C;

// Accumulator High Word
sfr  MAH                              = 0xFE5E;

// Accumulator Low Word
sfr  MAL                              = 0xFE5C;

// MultiCAN Kernel State Con. Register
sfr  MCAN_KSCCFG                      = 0xFE1E;

// MAC Control Word
sfr  MCW                              = 0xFFDC;
sbit MCW_MP                       = MCW^10;
sbit MCW_MS                       = MCW^9;

// Multiply Divide Control
sfr  MDC                              = 0xFF0E;
sbit MDC_MDRIU                    = MDC^4;

// Multiply Divide High Word
sfr  MDH                              = 0xFE0C;

// Multiply Divide Low Word
sfr  MDL                              = 0xFE0E;

// London Subsystem Kernel State Control Register
sfr  MEM_KSCCFG                       = 0xF012;

// MAC Repeat Word
sfr  MRW                              = 0xFFDA;

// MAC Status Word
sfr  MSW                              = 0xFFDE;
sbit MSW_MC                       = MSW^10;
sbit MSW_ME                       = MSW^12;
sbit MSW_MN                       = MSW^8;
sbit MSW_MSL                      = MSW^13;
sbit MSW_MSV                      = MSW^11;
sbit MSW_MV                       = MSW^14;
sbit MSW_MZ                       = MSW^9;

// Constant Ones Register
sfr  ONES                             = 0xFF1E;

// Port 0 Input Register
sfr  P0_IN                            = 0xFF80;
sbit P0_IN_P0                       = P0_IN^0;
sbit P0_IN_P1                       = P0_IN^1;
sbit P0_IN_P10                      = P0_IN^10;
sbit P0_IN_P11                      = P0_IN^11;
sbit P0_IN_P12                      = P0_IN^12;
sbit P0_IN_P13                      = P0_IN^13;
sbit P0_IN_P14                      = P0_IN^14;
sbit P0_IN_P15                      = P0_IN^15;
sbit P0_IN_P2                       = P0_IN^2;
sbit P0_IN_P3                       = P0_IN^3;
sbit P0_IN_P4                       = P0_IN^4;
sbit P0_IN_P5                       = P0_IN^5;
sbit P0_IN_P6                       = P0_IN^6;
sbit P0_IN_P7                       = P0_IN^7;
sbit P0_IN_P8                       = P0_IN^8;
sbit P0_IN_P9                       = P0_IN^9;

// Port 0 Input/Output Control Register 00
#define P0_IOCR00              (*((unsigned int volatile sdata *) 0xE800))

// Port 0 Input/Output Control Register 01
#define P0_IOCR01              (*((unsigned int volatile sdata *) 0xE802))

// Port 0 Input/Output Control Register 02
#define P0_IOCR02              (*((unsigned int volatile sdata *) 0xE804))

// Port 0 Input/Output Control Register 03
#define P0_IOCR03              (*((unsigned int volatile sdata *) 0xE806))

// Port 0 Input/Output Control Register 04
#define P0_IOCR04              (*((unsigned int volatile sdata *) 0xE808))

// Port 0 Input/Output Control Register 05
#define P0_IOCR05              (*((unsigned int volatile sdata *) 0xE80A))

// Port 0 Input/Output Control Register 06
#define P0_IOCR06              (*((unsigned int volatile sdata *) 0xE80C))

// Port 0 Input/Output Control Register 07
#define P0_IOCR07              (*((unsigned int volatile sdata *) 0xE80E))

// Port 0 Output Modification Register Low
#define P0_OMRL                (*((unsigned int volatile sdata *) 0xE9C0))

// Port 0 Output Register
sfr  P0_OUT                           = 0xFFA2;
sbit P0_OUT_P0                       = P0_OUT^0;
sbit P0_OUT_P1                       = P0_OUT^1;
sbit P0_OUT_P10                      = P0_OUT^10;
sbit P0_OUT_P11                      = P0_OUT^11;
sbit P0_OUT_P12                      = P0_OUT^12;
sbit P0_OUT_P13                      = P0_OUT^13;
sbit P0_OUT_P14                      = P0_OUT^14;
sbit P0_OUT_P15                      = P0_OUT^15;
sbit P0_OUT_P2                       = P0_OUT^2;
sbit P0_OUT_P3                       = P0_OUT^3;
sbit P0_OUT_P4                       = P0_OUT^4;
sbit P0_OUT_P5                       = P0_OUT^5;
sbit P0_OUT_P6                       = P0_OUT^6;
sbit P0_OUT_P7                       = P0_OUT^7;
sbit P0_OUT_P8                       = P0_OUT^8;
sbit P0_OUT_P9                       = P0_OUT^9;

// Port 0 Output Control Register
#define P0_POCON               (*((unsigned int volatile sdata *) 0xE8A0))

// Port 10 Input Register
sfr  P10_IN                           = 0xFF94;
sbit P10_IN_P0                       = P10_IN^0;
sbit P10_IN_P1                       = P10_IN^1;
sbit P10_IN_P10                      = P10_IN^10;
sbit P10_IN_P11                      = P10_IN^11;
sbit P10_IN_P12                      = P10_IN^12;
sbit P10_IN_P13                      = P10_IN^13;
sbit P10_IN_P14                      = P10_IN^14;
sbit P10_IN_P15                      = P10_IN^15;
sbit P10_IN_P2                       = P10_IN^2;
sbit P10_IN_P3                       = P10_IN^3;
sbit P10_IN_P4                       = P10_IN^4;
sbit P10_IN_P5                       = P10_IN^5;
sbit P10_IN_P6                       = P10_IN^6;
sbit P10_IN_P7                       = P10_IN^7;
sbit P10_IN_P8                       = P10_IN^8;
sbit P10_IN_P9                       = P10_IN^9;

// Port 10 Input/Output Control Register 00
#define P10_IOCR00             (*((unsigned int volatile sdata *) 0xE940))

// Port 10 Input/Output Control Register 01
#define P10_IOCR01             (*((unsigned int volatile sdata *) 0xE942))

// Port 10 Input/Output Control Register 02
#define P10_IOCR02             (*((unsigned int volatile sdata *) 0xE944))

// Port 10 Input/Output Control Register 03
#define P10_IOCR03             (*((unsigned int volatile sdata *) 0xE946))

// Port 10 Input/Output Control Register 04
#define P10_IOCR04             (*((unsigned int volatile sdata *) 0xE948))

// Port 10 Input/Output Control Register 05
#define P10_IOCR05             (*((unsigned int volatile sdata *) 0xE94A))

// Port 10 Input/Output Control Register 06
#define P10_IOCR06             (*((unsigned int volatile sdata *) 0xE94C))

// Port 10 Input/Output Control Register 07
#define P10_IOCR07             (*((unsigned int volatile sdata *) 0xE94E))

// Port 10 Input/Output Control Register 08
#define P10_IOCR08             (*((unsigned int volatile sdata *) 0xE950))

// Port 10 Input/Output Control Register 09
#define P10_IOCR09             (*((unsigned int volatile sdata *) 0xE952))

// Port 10 Input/Output Control Register 10
#define P10_IOCR10             (*((unsigned int volatile sdata *) 0xE954))

// Port 10 Input/Output Control Register 11
#define P10_IOCR11             (*((unsigned int volatile sdata *) 0xE956))

// Port 10 Input/Output Control Register 12
#define P10_IOCR12             (*((unsigned int volatile sdata *) 0xE958))

// Port 10 Input/Output Control Register 13
#define P10_IOCR13             (*((unsigned int volatile sdata *) 0xE95A))

// Port 10 Input/Output Control Register 14
#define P10_IOCR14             (*((unsigned int volatile sdata *) 0xE95C))

// Port 10 Input/Output Control Register 15
#define P10_IOCR15             (*((unsigned int volatile sdata *) 0xE95E))

// Port 10 Output Modification Register High
#define P10_OMRH               (*((unsigned int volatile sdata *) 0xE9EA))

// Port 10 Output Modification Register Low
#define P10_OMRL               (*((unsigned int volatile sdata *) 0xE9E8))

// Port 10 Output Register
sfr  P10_OUT                          = 0xFFB6;
sbit P10_OUT_P0                       = P10_OUT^0;
sbit P10_OUT_P1                       = P10_OUT^1;
sbit P10_OUT_P10                      = P10_OUT^10;
sbit P10_OUT_P11                      = P10_OUT^11;
sbit P10_OUT_P12                      = P10_OUT^12;
sbit P10_OUT_P13                      = P10_OUT^13;
sbit P10_OUT_P14                      = P10_OUT^14;
sbit P10_OUT_P15                      = P10_OUT^15;
sbit P10_OUT_P2                       = P10_OUT^2;
sbit P10_OUT_P3                       = P10_OUT^3;
sbit P10_OUT_P4                       = P10_OUT^4;
sbit P10_OUT_P5                       = P10_OUT^5;
sbit P10_OUT_P6                       = P10_OUT^6;
sbit P10_OUT_P7                       = P10_OUT^7;
sbit P10_OUT_P8                       = P10_OUT^8;
sbit P10_OUT_P9                       = P10_OUT^9;

// Port 10 Output Control Register
#define P10_POCON              (*((unsigned int volatile sdata *) 0xE8B4))

// Port 11 Input Register
sfr  P11_IN                           = 0xFF96;
sbit P11_IN_P0                       = P11_IN^0;
sbit P11_IN_P1                       = P11_IN^1;
sbit P11_IN_P10                      = P11_IN^10;
sbit P11_IN_P11                      = P11_IN^11;
sbit P11_IN_P12                      = P11_IN^12;
sbit P11_IN_P13                      = P11_IN^13;
sbit P11_IN_P14                      = P11_IN^14;
sbit P11_IN_P15                      = P11_IN^15;
sbit P11_IN_P2                       = P11_IN^2;
sbit P11_IN_P3                       = P11_IN^3;
sbit P11_IN_P4                       = P11_IN^4;
sbit P11_IN_P5                       = P11_IN^5;
sbit P11_IN_P6                       = P11_IN^6;
sbit P11_IN_P7                       = P11_IN^7;
sbit P11_IN_P8                       = P11_IN^8;
sbit P11_IN_P9                       = P11_IN^9;

// Port 11 Input/Output Control Register 00
#define P11_IOCR00             (*((unsigned int volatile sdata *) 0xE960))

// Port 11 Input/Output Control Register 01
#define P11_IOCR01             (*((unsigned int volatile sdata *) 0xE962))

// Port 11 Input/Output Control Register 02
#define P11_IOCR02             (*((unsigned int volatile sdata *) 0xE964))

// Port 11 Input/Output Control Register 03
#define P11_IOCR03             (*((unsigned int volatile sdata *) 0xE966))

// Port 11 Input/Output Control Register 04
#define P11_IOCR04             (*((unsigned int volatile sdata *) 0xE968))

// Port 11 Input/Output Control Register 05
#define P11_IOCR05             (*((unsigned int volatile sdata *) 0xE96A))

// Port 11 Output Modification Register Low
#define P11_OMRL               (*((unsigned int volatile sdata *) 0xE9EC))

// Port 11 Output Register
sfr  P11_OUT                          = 0xFFB8;
sbit P11_OUT_P0                       = P11_OUT^0;
sbit P11_OUT_P1                       = P11_OUT^1;
sbit P11_OUT_P10                      = P11_OUT^10;
sbit P11_OUT_P11                      = P11_OUT^11;
sbit P11_OUT_P12                      = P11_OUT^12;
sbit P11_OUT_P13                      = P11_OUT^13;
sbit P11_OUT_P14                      = P11_OUT^14;
sbit P11_OUT_P15                      = P11_OUT^15;
sbit P11_OUT_P2                       = P11_OUT^2;
sbit P11_OUT_P3                       = P11_OUT^3;
sbit P11_OUT_P4                       = P11_OUT^4;
sbit P11_OUT_P5                       = P11_OUT^5;
sbit P11_OUT_P6                       = P11_OUT^6;
sbit P11_OUT_P7                       = P11_OUT^7;
sbit P11_OUT_P8                       = P11_OUT^8;
sbit P11_OUT_P9                       = P11_OUT^9;

// Port 11 Output Control Register
#define P11_POCON              (*((unsigned int volatile sdata *) 0xE8B6))

// Port 15 Digital Input Disable Register
sfr  P15_DIDIS                        = 0xFE9E;

// Port 15 Input Register
sfr  P15_IN                           = 0xFF9E;
sbit P15_IN_P0                       = P15_IN^0;
sbit P15_IN_P1                       = P15_IN^1;
sbit P15_IN_P10                      = P15_IN^10;
sbit P15_IN_P11                      = P15_IN^11;
sbit P15_IN_P12                      = P15_IN^12;
sbit P15_IN_P13                      = P15_IN^13;
sbit P15_IN_P14                      = P15_IN^14;
sbit P15_IN_P15                      = P15_IN^15;
sbit P15_IN_P2                       = P15_IN^2;
sbit P15_IN_P3                       = P15_IN^3;
sbit P15_IN_P4                       = P15_IN^4;
sbit P15_IN_P5                       = P15_IN^5;
sbit P15_IN_P6                       = P15_IN^6;
sbit P15_IN_P7                       = P15_IN^7;
sbit P15_IN_P8                       = P15_IN^8;
sbit P15_IN_P9                       = P15_IN^9;

// Port 1 Input Register
sfr  P1_IN                            = 0xFF82;
sbit P1_IN_P0                       = P1_IN^0;
sbit P1_IN_P1                       = P1_IN^1;
sbit P1_IN_P10                      = P1_IN^10;
sbit P1_IN_P11                      = P1_IN^11;
sbit P1_IN_P12                      = P1_IN^12;
sbit P1_IN_P13                      = P1_IN^13;
sbit P1_IN_P14                      = P1_IN^14;
sbit P1_IN_P15                      = P1_IN^15;
sbit P1_IN_P2                       = P1_IN^2;
sbit P1_IN_P3                       = P1_IN^3;
sbit P1_IN_P4                       = P1_IN^4;
sbit P1_IN_P5                       = P1_IN^5;
sbit P1_IN_P6                       = P1_IN^6;
sbit P1_IN_P7                       = P1_IN^7;
sbit P1_IN_P8                       = P1_IN^8;
sbit P1_IN_P9                       = P1_IN^9;

// Port 1 Input/Output Control Register 00
#define P1_IOCR00              (*((unsigned int volatile sdata *) 0xE820))

// Port 1 Input/Output Control Register 01
#define P1_IOCR01              (*((unsigned int volatile sdata *) 0xE822))

// Port 1 Input/Output Control Register 02
#define P1_IOCR02              (*((unsigned int volatile sdata *) 0xE824))

// Port 1 Input/Output Control Register 03
#define P1_IOCR03              (*((unsigned int volatile sdata *) 0xE826))

// Port 1 Input/Output Control Register 04
#define P1_IOCR04              (*((unsigned int volatile sdata *) 0xE828))

// Port 1 Input/Output Control Register 05
#define P1_IOCR05              (*((unsigned int volatile sdata *) 0xE82A))

// Port 1 Input/Output Control Register 06
#define P1_IOCR06              (*((unsigned int volatile sdata *) 0xE82C))

// Port 1 Input/Output Control Register 07
#define P1_IOCR07              (*((unsigned int volatile sdata *) 0xE82E))

// Port 1 Output Modification Register Low
#define P1_OMRL                (*((unsigned int volatile sdata *) 0xE9C4))

// Port 1 Output Register
sfr  P1_OUT                           = 0xFFA4;
sbit P1_OUT_P0                       = P1_OUT^0;
sbit P1_OUT_P1                       = P1_OUT^1;
sbit P1_OUT_P10                      = P1_OUT^10;
sbit P1_OUT_P11                      = P1_OUT^11;
sbit P1_OUT_P12                      = P1_OUT^12;
sbit P1_OUT_P13                      = P1_OUT^13;
sbit P1_OUT_P14                      = P1_OUT^14;
sbit P1_OUT_P15                      = P1_OUT^15;
sbit P1_OUT_P2                       = P1_OUT^2;
sbit P1_OUT_P3                       = P1_OUT^3;
sbit P1_OUT_P4                       = P1_OUT^4;
sbit P1_OUT_P5                       = P1_OUT^5;
sbit P1_OUT_P6                       = P1_OUT^6;
sbit P1_OUT_P7                       = P1_OUT^7;
sbit P1_OUT_P8                       = P1_OUT^8;
sbit P1_OUT_P9                       = P1_OUT^9;

// Port 1 Output Control Register
#define P1_POCON               (*((unsigned int volatile sdata *) 0xE8A2))

// Port 2 Input Register
sfr  P2_IN                            = 0xFF84;
sbit P2_IN_P0                       = P2_IN^0;
sbit P2_IN_P1                       = P2_IN^1;
sbit P2_IN_P10                      = P2_IN^10;
sbit P2_IN_P11                      = P2_IN^11;
sbit P2_IN_P12                      = P2_IN^12;
sbit P2_IN_P13                      = P2_IN^13;
sbit P2_IN_P14                      = P2_IN^14;
sbit P2_IN_P15                      = P2_IN^15;
sbit P2_IN_P2                       = P2_IN^2;
sbit P2_IN_P3                       = P2_IN^3;
sbit P2_IN_P4                       = P2_IN^4;
sbit P2_IN_P5                       = P2_IN^5;
sbit P2_IN_P6                       = P2_IN^6;
sbit P2_IN_P7                       = P2_IN^7;
sbit P2_IN_P8                       = P2_IN^8;
sbit P2_IN_P9                       = P2_IN^9;

// Port 2 Input/Output Control Register 00
#define P2_IOCR00              (*((unsigned int volatile sdata *) 0xE840))

// Port 2 Input/Output Control Register 01
#define P2_IOCR01              (*((unsigned int volatile sdata *) 0xE842))

// Port 2 Input/Output Control Register 02
#define P2_IOCR02              (*((unsigned int volatile sdata *) 0xE844))

// Port 2 Input/Output Control Register 03
#define P2_IOCR03              (*((unsigned int volatile sdata *) 0xE846))

// Port 2 Input/Output Control Register 04
#define P2_IOCR04              (*((unsigned int volatile sdata *) 0xE848))

// Port 2 Input/Output Control Register 05
#define P2_IOCR05              (*((unsigned int volatile sdata *) 0xE84A))

// Port 2 Input/Output Control Register 06
#define P2_IOCR06              (*((unsigned int volatile sdata *) 0xE84C))

// Port 2 Input/Output Control Register 07
#define P2_IOCR07              (*((unsigned int volatile sdata *) 0xE84E))

// Port 2 Input/Output Control Register 08
#define P2_IOCR08              (*((unsigned int volatile sdata *) 0xE850))

// Port 2 Input/Output Control Register 09
#define P2_IOCR09              (*((unsigned int volatile sdata *) 0xE852))

// Port 2 Input/Output Control Register 10
#define P2_IOCR10              (*((unsigned int volatile sdata *) 0xE854))

// Port 2 Input/Output Control Register 11
#define P2_IOCR11              (*((unsigned int volatile sdata *) 0xE856))

// Port 2 Input/Output Control Register 12
#define P2_IOCR12              (*((unsigned int volatile sdata *) 0xE858))

// Port 2 Output Modification Register High
#define P2_OMRH                (*((unsigned int volatile sdata *) 0xE9CA))

// Port 2 Output Modification Register Low
#define P2_OMRL                (*((unsigned int volatile sdata *) 0xE9C8))

// Port 2 Output Register
sfr  P2_OUT                           = 0xFFA6;
sbit P2_OUT_P0                       = P2_OUT^0;
sbit P2_OUT_P1                       = P2_OUT^1;
sbit P2_OUT_P10                      = P2_OUT^10;
sbit P2_OUT_P11                      = P2_OUT^11;
sbit P2_OUT_P12                      = P2_OUT^12;
sbit P2_OUT_P13                      = P2_OUT^13;
sbit P2_OUT_P14                      = P2_OUT^14;
sbit P2_OUT_P15                      = P2_OUT^15;
sbit P2_OUT_P2                       = P2_OUT^2;
sbit P2_OUT_P3                       = P2_OUT^3;
sbit P2_OUT_P4                       = P2_OUT^4;
sbit P2_OUT_P5                       = P2_OUT^5;
sbit P2_OUT_P6                       = P2_OUT^6;
sbit P2_OUT_P7                       = P2_OUT^7;
sbit P2_OUT_P8                       = P2_OUT^8;
sbit P2_OUT_P9                       = P2_OUT^9;

// Port 2 Output Control Register
#define P2_POCON               (*((unsigned int volatile sdata *) 0xE8A4))

// Port 3 Input Register
sfr  P3_IN                            = 0xFF86;
sbit P3_IN_P0                       = P3_IN^0;
sbit P3_IN_P1                       = P3_IN^1;
sbit P3_IN_P10                      = P3_IN^10;
sbit P3_IN_P11                      = P3_IN^11;
sbit P3_IN_P12                      = P3_IN^12;
sbit P3_IN_P13                      = P3_IN^13;
sbit P3_IN_P14                      = P3_IN^14;
sbit P3_IN_P15                      = P3_IN^15;
sbit P3_IN_P2                       = P3_IN^2;
sbit P3_IN_P3                       = P3_IN^3;
sbit P3_IN_P4                       = P3_IN^4;
sbit P3_IN_P5                       = P3_IN^5;
sbit P3_IN_P6                       = P3_IN^6;
sbit P3_IN_P7                       = P3_IN^7;
sbit P3_IN_P8                       = P3_IN^8;
sbit P3_IN_P9                       = P3_IN^9;

// Port 3 Input/Output Control Register 00
#define P3_IOCR00              (*((unsigned int volatile sdata *) 0xE860))

// Port 3 Input/Output Control Register 01
#define P3_IOCR01              (*((unsigned int volatile sdata *) 0xE862))

// Port 3 Input/Output Control Register 02
#define P3_IOCR02              (*((unsigned int volatile sdata *) 0xE864))

// Port 3 Input/Output Control Register 03
#define P3_IOCR03              (*((unsigned int volatile sdata *) 0xE866))

// Port 3 Input/Output Control Register 04
#define P3_IOCR04              (*((unsigned int volatile sdata *) 0xE868))

// Port 3 Input/Output Control Register 05
#define P3_IOCR05              (*((unsigned int volatile sdata *) 0xE86A))

// Port 3 Input/Output Control Register 06
#define P3_IOCR06              (*((unsigned int volatile sdata *) 0xE86C))

// Port 3 Input/Output Control Register 07
#define P3_IOCR07              (*((unsigned int volatile sdata *) 0xE86E))

// Port 3 Output Modification Register Low
#define P3_OMRL                (*((unsigned int volatile sdata *) 0xE9CC))

// Port 3 Output Register
sfr  P3_OUT                           = 0xFFA8;
sbit P3_OUT_P0                       = P3_OUT^0;
sbit P3_OUT_P1                       = P3_OUT^1;
sbit P3_OUT_P10                      = P3_OUT^10;
sbit P3_OUT_P11                      = P3_OUT^11;
sbit P3_OUT_P12                      = P3_OUT^12;
sbit P3_OUT_P13                      = P3_OUT^13;
sbit P3_OUT_P14                      = P3_OUT^14;
sbit P3_OUT_P15                      = P3_OUT^15;
sbit P3_OUT_P2                       = P3_OUT^2;
sbit P3_OUT_P3                       = P3_OUT^3;
sbit P3_OUT_P4                       = P3_OUT^4;
sbit P3_OUT_P5                       = P3_OUT^5;
sbit P3_OUT_P6                       = P3_OUT^6;
sbit P3_OUT_P7                       = P3_OUT^7;
sbit P3_OUT_P8                       = P3_OUT^8;
sbit P3_OUT_P9                       = P3_OUT^9;

// Port 3 Output Control Register
#define P3_POCON               (*((unsigned int volatile sdata *) 0xE8A6))

// Port 4 Input Register
sfr  P4_IN                            = 0xFF88;
sbit P4_IN_P0                       = P4_IN^0;
sbit P4_IN_P1                       = P4_IN^1;
sbit P4_IN_P10                      = P4_IN^10;
sbit P4_IN_P11                      = P4_IN^11;
sbit P4_IN_P12                      = P4_IN^12;
sbit P4_IN_P13                      = P4_IN^13;
sbit P4_IN_P14                      = P4_IN^14;
sbit P4_IN_P15                      = P4_IN^15;
sbit P4_IN_P2                       = P4_IN^2;
sbit P4_IN_P3                       = P4_IN^3;
sbit P4_IN_P4                       = P4_IN^4;
sbit P4_IN_P5                       = P4_IN^5;
sbit P4_IN_P6                       = P4_IN^6;
sbit P4_IN_P7                       = P4_IN^7;
sbit P4_IN_P8                       = P4_IN^8;
sbit P4_IN_P9                       = P4_IN^9;

// Port 4 Input/Output Control Register 00
#define P4_IOCR00              (*((unsigned int volatile sdata *) 0xE880))

// Port 4 Input/Output Control Register 01
#define P4_IOCR01              (*((unsigned int volatile sdata *) 0xE882))

// Port 4 Input/Output Control Register 02
#define P4_IOCR02              (*((unsigned int volatile sdata *) 0xE884))

// Port 4 Input/Output Control Register 03
#define P4_IOCR03              (*((unsigned int volatile sdata *) 0xE886))

// Port 4 Input/Output Control Register 04
#define P4_IOCR04              (*((unsigned int volatile sdata *) 0xE888))

// Port 4 Input/Output Control Register 05
#define P4_IOCR05              (*((unsigned int volatile sdata *) 0xE88A))

// Port 4 Input/Output Control Register 06
#define P4_IOCR06              (*((unsigned int volatile sdata *) 0xE88C))

// Port 4 Input/Output Control Register 07
#define P4_IOCR07              (*((unsigned int volatile sdata *) 0xE88E))

// Port 4 Output Modification Register Low
#define P4_OMRL                (*((unsigned int volatile sdata *) 0xE9D0))

// Port 4 Output Register
sfr  P4_OUT                           = 0xFFAA;
sbit P4_OUT_P0                       = P4_OUT^0;
sbit P4_OUT_P1                       = P4_OUT^1;
sbit P4_OUT_P10                      = P4_OUT^10;
sbit P4_OUT_P11                      = P4_OUT^11;
sbit P4_OUT_P12                      = P4_OUT^12;
sbit P4_OUT_P13                      = P4_OUT^13;
sbit P4_OUT_P14                      = P4_OUT^14;
sbit P4_OUT_P15                      = P4_OUT^15;
sbit P4_OUT_P2                       = P4_OUT^2;
sbit P4_OUT_P3                       = P4_OUT^3;
sbit P4_OUT_P4                       = P4_OUT^4;
sbit P4_OUT_P5                       = P4_OUT^5;
sbit P4_OUT_P6                       = P4_OUT^6;
sbit P4_OUT_P7                       = P4_OUT^7;
sbit P4_OUT_P8                       = P4_OUT^8;
sbit P4_OUT_P9                       = P4_OUT^9;

// Port 4 Output Control Register
#define P4_POCON               (*((unsigned int volatile sdata *) 0xE8A8))

// Port 5 Digital Input Disable Register
sfr  P5_DIDIS                         = 0xFE8A;

// Port 5 Input Register
sfr  P5_IN                            = 0xFF8A;
sbit P5_IN_P0                       = P5_IN^0;
sbit P5_IN_P1                       = P5_IN^1;
sbit P5_IN_P10                      = P5_IN^10;
sbit P5_IN_P11                      = P5_IN^11;
sbit P5_IN_P12                      = P5_IN^12;
sbit P5_IN_P13                      = P5_IN^13;
sbit P5_IN_P14                      = P5_IN^14;
sbit P5_IN_P15                      = P5_IN^15;
sbit P5_IN_P2                       = P5_IN^2;
sbit P5_IN_P3                       = P5_IN^3;
sbit P5_IN_P4                       = P5_IN^4;
sbit P5_IN_P5                       = P5_IN^5;
sbit P5_IN_P6                       = P5_IN^6;
sbit P5_IN_P7                       = P5_IN^7;
sbit P5_IN_P8                       = P5_IN^8;
sbit P5_IN_P9                       = P5_IN^9;

// Port 6 Input Register
sfr  P6_IN                            = 0xFF8C;
sbit P6_IN_P0                       = P6_IN^0;
sbit P6_IN_P1                       = P6_IN^1;
sbit P6_IN_P10                      = P6_IN^10;
sbit P6_IN_P11                      = P6_IN^11;
sbit P6_IN_P12                      = P6_IN^12;
sbit P6_IN_P13                      = P6_IN^13;
sbit P6_IN_P14                      = P6_IN^14;
sbit P6_IN_P15                      = P6_IN^15;
sbit P6_IN_P2                       = P6_IN^2;
sbit P6_IN_P3                       = P6_IN^3;
sbit P6_IN_P4                       = P6_IN^4;
sbit P6_IN_P5                       = P6_IN^5;
sbit P6_IN_P6                       = P6_IN^6;
sbit P6_IN_P7                       = P6_IN^7;
sbit P6_IN_P8                       = P6_IN^8;
sbit P6_IN_P9                       = P6_IN^9;

// Port 6 Input/Output Control Register 00
#define P6_IOCR00              (*((unsigned int volatile sdata *) 0xE8C0))

// Port 6 Input/Output Control Register 01
#define P6_IOCR01              (*((unsigned int volatile sdata *) 0xE8C2))

// Port 6 Input/Output Control Register 02
#define P6_IOCR02              (*((unsigned int volatile sdata *) 0xE8C4))

// Port 6 Input/Output Control Register 03
#define P6_IOCR03              (*((unsigned int volatile sdata *) 0xE8C6))

// Port 6 Output Modification Register Low
#define P6_OMRL                (*((unsigned int volatile sdata *) 0xE9D8))

// Port 6 Output Register
sfr  P6_OUT                           = 0xFFAE;
sbit P6_OUT_P0                       = P6_OUT^0;
sbit P6_OUT_P1                       = P6_OUT^1;
sbit P6_OUT_P10                      = P6_OUT^10;
sbit P6_OUT_P11                      = P6_OUT^11;
sbit P6_OUT_P12                      = P6_OUT^12;
sbit P6_OUT_P13                      = P6_OUT^13;
sbit P6_OUT_P14                      = P6_OUT^14;
sbit P6_OUT_P15                      = P6_OUT^15;
sbit P6_OUT_P2                       = P6_OUT^2;
sbit P6_OUT_P3                       = P6_OUT^3;
sbit P6_OUT_P4                       = P6_OUT^4;
sbit P6_OUT_P5                       = P6_OUT^5;
sbit P6_OUT_P6                       = P6_OUT^6;
sbit P6_OUT_P7                       = P6_OUT^7;
sbit P6_OUT_P8                       = P6_OUT^8;
sbit P6_OUT_P9                       = P6_OUT^9;

// Port 6 Output Control Register
#define P6_POCON               (*((unsigned int volatile sdata *) 0xE8AC))

// Port 7 Input Register
sfr  P7_IN                            = 0xFF8E;
sbit P7_IN_P0                       = P7_IN^0;
sbit P7_IN_P1                       = P7_IN^1;
sbit P7_IN_P10                      = P7_IN^10;
sbit P7_IN_P11                      = P7_IN^11;
sbit P7_IN_P12                      = P7_IN^12;
sbit P7_IN_P13                      = P7_IN^13;
sbit P7_IN_P14                      = P7_IN^14;
sbit P7_IN_P15                      = P7_IN^15;
sbit P7_IN_P2                       = P7_IN^2;
sbit P7_IN_P3                       = P7_IN^3;
sbit P7_IN_P4                       = P7_IN^4;
sbit P7_IN_P5                       = P7_IN^5;
sbit P7_IN_P6                       = P7_IN^6;
sbit P7_IN_P7                       = P7_IN^7;
sbit P7_IN_P8                       = P7_IN^8;
sbit P7_IN_P9                       = P7_IN^9;

// Port 7 Input/Output Control Register 00
#define P7_IOCR00              (*((unsigned int volatile sdata *) 0xE8E0))

// Port 7 Input/Output Control Register 01
#define P7_IOCR01              (*((unsigned int volatile sdata *) 0xE8E2))

// Port 7 Input/Output Control Register 02
#define P7_IOCR02              (*((unsigned int volatile sdata *) 0xE8E4))

// Port 7 Input/Output Control Register 03
#define P7_IOCR03              (*((unsigned int volatile sdata *) 0xE8E6))

// Port 7 Input/Output Control Register 04
#define P7_IOCR04              (*((unsigned int volatile sdata *) 0xE8E8))

// Port 7 Output Modification Register Low
#define P7_OMRL                (*((unsigned int volatile sdata *) 0xE9DC))

// Port 7 Output Register
sfr  P7_OUT                           = 0xFFB0;
sbit P7_OUT_P0                       = P7_OUT^0;
sbit P7_OUT_P1                       = P7_OUT^1;
sbit P7_OUT_P10                      = P7_OUT^10;
sbit P7_OUT_P11                      = P7_OUT^11;
sbit P7_OUT_P12                      = P7_OUT^12;
sbit P7_OUT_P13                      = P7_OUT^13;
sbit P7_OUT_P14                      = P7_OUT^14;
sbit P7_OUT_P15                      = P7_OUT^15;
sbit P7_OUT_P2                       = P7_OUT^2;
sbit P7_OUT_P3                       = P7_OUT^3;
sbit P7_OUT_P4                       = P7_OUT^4;
sbit P7_OUT_P5                       = P7_OUT^5;
sbit P7_OUT_P6                       = P7_OUT^6;
sbit P7_OUT_P7                       = P7_OUT^7;
sbit P7_OUT_P8                       = P7_OUT^8;
sbit P7_OUT_P9                       = P7_OUT^9;

// Port 7 Output Control Register
#define P7_POCON               (*((unsigned int volatile sdata *) 0xE8AE))

// Port 8 Input Register
sfr  P8_IN                            = 0xFF90;
sbit P8_IN_P0                       = P8_IN^0;
sbit P8_IN_P1                       = P8_IN^1;
sbit P8_IN_P10                      = P8_IN^10;
sbit P8_IN_P11                      = P8_IN^11;
sbit P8_IN_P12                      = P8_IN^12;
sbit P8_IN_P13                      = P8_IN^13;
sbit P8_IN_P14                      = P8_IN^14;
sbit P8_IN_P15                      = P8_IN^15;
sbit P8_IN_P2                       = P8_IN^2;
sbit P8_IN_P3                       = P8_IN^3;
sbit P8_IN_P4                       = P8_IN^4;
sbit P8_IN_P5                       = P8_IN^5;
sbit P8_IN_P6                       = P8_IN^6;
sbit P8_IN_P7                       = P8_IN^7;
sbit P8_IN_P8                       = P8_IN^8;
sbit P8_IN_P9                       = P8_IN^9;

// Port 8 Input/Output Control Register 00
#define P8_IOCR00              (*((unsigned int volatile sdata *) 0xE900))

// Port 8 Input/Output Control Register 01
#define P8_IOCR01              (*((unsigned int volatile sdata *) 0xE902))

// Port 8 Input/Output Control Register 02
#define P8_IOCR02              (*((unsigned int volatile sdata *) 0xE904))

// Port 8 Input/Output Control Register 03
#define P8_IOCR03              (*((unsigned int volatile sdata *) 0xE906))

// Port 8 Input/Output Control Register 04
#define P8_IOCR04              (*((unsigned int volatile sdata *) 0xE908))

// Port 8 Input/Output Control Register 05
#define P8_IOCR05              (*((unsigned int volatile sdata *) 0xE90A))

// Port 8 Input/Output Control Register 06
#define P8_IOCR06              (*((unsigned int volatile sdata *) 0xE90C))

// Port 8 Output Modification Register Low
#define P8_OMRL                (*((unsigned int volatile sdata *) 0xE9E0))

// Port 8 Output Register
sfr  P8_OUT                           = 0xFFB2;
sbit P8_OUT_P0                       = P8_OUT^0;
sbit P8_OUT_P1                       = P8_OUT^1;
sbit P8_OUT_P10                      = P8_OUT^10;
sbit P8_OUT_P11                      = P8_OUT^11;
sbit P8_OUT_P12                      = P8_OUT^12;
sbit P8_OUT_P13                      = P8_OUT^13;
sbit P8_OUT_P14                      = P8_OUT^14;
sbit P8_OUT_P15                      = P8_OUT^15;
sbit P8_OUT_P2                       = P8_OUT^2;
sbit P8_OUT_P3                       = P8_OUT^3;
sbit P8_OUT_P4                       = P8_OUT^4;
sbit P8_OUT_P5                       = P8_OUT^5;
sbit P8_OUT_P6                       = P8_OUT^6;
sbit P8_OUT_P7                       = P8_OUT^7;
sbit P8_OUT_P8                       = P8_OUT^8;
sbit P8_OUT_P9                       = P8_OUT^9;

// Port 8 Output Control Register
#define P8_POCON               (*((unsigned int volatile sdata *) 0xE8B0))

// Port 9 Input Register
sfr  P9_IN                            = 0xFF92;
sbit P9_IN_P0                       = P9_IN^0;
sbit P9_IN_P1                       = P9_IN^1;
sbit P9_IN_P10                      = P9_IN^10;
sbit P9_IN_P11                      = P9_IN^11;
sbit P9_IN_P12                      = P9_IN^12;
sbit P9_IN_P13                      = P9_IN^13;
sbit P9_IN_P14                      = P9_IN^14;
sbit P9_IN_P15                      = P9_IN^15;
sbit P9_IN_P2                       = P9_IN^2;
sbit P9_IN_P3                       = P9_IN^3;
sbit P9_IN_P4                       = P9_IN^4;
sbit P9_IN_P5                       = P9_IN^5;
sbit P9_IN_P6                       = P9_IN^6;
sbit P9_IN_P7                       = P9_IN^7;
sbit P9_IN_P8                       = P9_IN^8;
sbit P9_IN_P9                       = P9_IN^9;

// Port 9 Input/Output Control Register 00
#define P9_IOCR00              (*((unsigned int volatile sdata *) 0xE920))

// Port 9 Input/Output Control Register 01
#define P9_IOCR01              (*((unsigned int volatile sdata *) 0xE922))

// Port 9 Input/Output Control Register 02
#define P9_IOCR02              (*((unsigned int volatile sdata *) 0xE924))

// Port 9 Input/Output Control Register 03
#define P9_IOCR03              (*((unsigned int volatile sdata *) 0xE926))

// Port 9 Input/Output Control Register 04
#define P9_IOCR04              (*((unsigned int volatile sdata *) 0xE928))

// Port 9 Input/Output Control Register 05
#define P9_IOCR05              (*((unsigned int volatile sdata *) 0xE92A))

// Port 9 Input/Output Control Register 06
#define P9_IOCR06              (*((unsigned int volatile sdata *) 0xE92C))

// Port 9 Input/Output Control Register 07
#define P9_IOCR07              (*((unsigned int volatile sdata *) 0xE92E))

// Port 9 Output Modification Register Low
#define P9_OMRL                (*((unsigned int volatile sdata *) 0xE9E4))

// Port 9 Output Register
sfr  P9_OUT                           = 0xFFB4;
sbit P9_OUT_P0                       = P9_OUT^0;
sbit P9_OUT_P1                       = P9_OUT^1;
sbit P9_OUT_P10                      = P9_OUT^10;
sbit P9_OUT_P11                      = P9_OUT^11;
sbit P9_OUT_P12                      = P9_OUT^12;
sbit P9_OUT_P13                      = P9_OUT^13;
sbit P9_OUT_P14                      = P9_OUT^14;
sbit P9_OUT_P15                      = P9_OUT^15;
sbit P9_OUT_P2                       = P9_OUT^2;
sbit P9_OUT_P3                       = P9_OUT^3;
sbit P9_OUT_P4                       = P9_OUT^4;
sbit P9_OUT_P5                       = P9_OUT^5;
sbit P9_OUT_P6                       = P9_OUT^6;
sbit P9_OUT_P7                       = P9_OUT^7;
sbit P9_OUT_P8                       = P9_OUT^8;
sbit P9_OUT_P9                       = P9_OUT^9;

// Port 9 Output Control Register
#define P9_POCON               (*((unsigned int volatile sdata *) 0xE8B2))


// Program Flash Interrupt
sfr  PFM_IC                           = 0xF19A;
sbit PFM_IC_GPX                      = PFM_IC^8;
sbit PFM_IC_IE                       = PFM_IC^6;
sbit PFM_IC_IR                       = PFM_IC^7;

// Processor Status Word
sfr  PSW                              = 0xFF10;
sbit PSW_C                        = PSW^1;
sbit PSW_E                        = PSW^4;
sbit PSW_HLDEN                    = PSW^10;
sbit PSW_IEN                      = PSW^11;
sbit PSW_MULIP                    = PSW^5;
sbit PSW_N                        = PSW^0;
sbit PSW_USR0                     = PSW^6;
sbit PSW_USR1                     = PSW^7;
sbit PSW_V                        = PSW^2;
sbit PSW_Z                        = PSW^3;

// Offset Register
sfr  QR0                              = 0xF004;

// Offset Register
sfr  QR1                              = 0xF006;

// Offset Register
sfr  QX0                              = 0xF000;

// Offset Register
sfr  QX1                              = 0xF002;

// Control Register
sfr  RTC_CON                          = 0xF110;
sbit RTC_CON_ACCPOS                   = RTC_CON^15;
sbit RTC_CON_PRE                      = RTC_CON^1;
sbit RTC_CON_REFCLK                   = RTC_CON^4;
sbit RTC_CON_RUN                      = RTC_CON^0;
sbit RTC_CON_T14DEC                   = RTC_CON^2;
sbit RTC_CON_T14INC                   = RTC_CON^3;

// Real Time Clock Interrupt
sfr  RTC_IC                           = 0xF19C;
sbit RTC_IC_GPX                      = RTC_IC^8;
sbit RTC_IC_IE                       = RTC_IC^6;
sbit RTC_IC_IR                       = RTC_IC^7;

// Interrupt Sub Node Control
sfr  RTC_ISNC                         = 0xF10C;
sbit RTC_ISNC_CNT0IE                   = RTC_ISNC^2;
sbit RTC_ISNC_CNT0IR                   = RTC_ISNC^3;
sbit RTC_ISNC_CNT1IE                   = RTC_ISNC^4;
sbit RTC_ISNC_CNT1IR                   = RTC_ISNC^5;
sbit RTC_ISNC_CNT2IE                   = RTC_ISNC^6;
sbit RTC_ISNC_CNT2IR                   = RTC_ISNC^7;
sbit RTC_ISNC_CNT3IE                   = RTC_ISNC^8;
sbit RTC_ISNC_CNT3IR                   = RTC_ISNC^9;
sbit RTC_ISNC_T14IE                    = RTC_ISNC^0;
sbit RTC_ISNC_T14IR                    = RTC_ISNC^1;

// RTC Kernel State Con. Register
sfr  RTC_KSCCFG                       = 0xF010;

// RTC Reload Register High
sfr  RTC_RELH                         = 0xF0CE;

// RTC Reload Register Low
sfr  RTC_RELL                         = 0xF0CC;

// RTC Count Register High
sfr  RTC_RTCH                         = 0xF0D6;

// RTC Count Register Low
sfr  RTC_RTCL                         = 0xF0D4;

// T14 Count Register
sfr  RTC_T14                          = 0xF0D2;

// T14 Reload Register
sfr  RTC_T14REL                       = 0xF0D0;

// RWDATA in Monitor Controlled Tracing Mode
sfr  RWDATA                           = 0xF06A;

// Data Register in RW Mode
sfr  RWDATA                           = 0xF06A;

// Data Register in RW Mode, Byte layout
sfr  RWDATA                           = 0xF06A;

// SBRAM Data Register 0
sfr  SBRAM_DATA0                      = 0xFEE0;

// SBRAM Data Register 1
sfr  SBRAM_DATA1                      = 0xFEE2;

// SBRAM Read Address Register
sfr  SBRAM_RADD                       = 0xFEDC;

// SBRAM Write Address Register
sfr  SBRAM_WADD                       = 0xFEDE;

// SCU 0
sfr  SCU_0IC                          = 0xF198;
sbit SCU_0IC_GPX                      = SCU_0IC^8;
sbit SCU_0IC_IE                       = SCU_0IC^6;
sbit SCU_0IC_IR                       = SCU_0IC^7;

// SCU 1
sfr  SCU_1IC                          = 0xF196;
sbit SCU_1IC_GPX                      = SCU_1IC^8;
sbit SCU_1IC_IE                       = SCU_1IC^6;
sbit SCU_1IC_IR                       = SCU_1IC^7;

// Debug Pin Routing Register
sfr  SCU_DBGPRR                       = 0xF06E;

// DMP_M Int. and Trap Trigger Register
sfr  SCU_DMPMIT                       = 0xFE96;

// DMP_M Int. and Trap Clear Register
sfr  SCU_DMPMITCLR                    = 0xFE98;

// ESR0 Configuration Register
sfr  SCU_ESRCFG0                      = 0xF100;
sbit SCU_ESRCFG0_DFEN                     = SCU_ESRCFG0^4;
sbit SCU_ESRCFG0_IN                       = SCU_ESRCFG0^6;
sbit SCU_ESRCFG0_OUT                      = SCU_ESRCFG0^5;

// ESR1 Configuration Register
sfr  SCU_ESRCFG1                      = 0xF102;
sbit SCU_ESRCFG1_DFEN                     = SCU_ESRCFG1^4;
sbit SCU_ESRCFG1_IN                       = SCU_ESRCFG1^6;
sbit SCU_ESRCFG1_OUT                      = SCU_ESRCFG1^5;

// ESR2 Configuration Register
sfr  SCU_ESRCFG2                      = 0xF104;
sbit SCU_ESRCFG2_DFEN                     = SCU_ESRCFG2^4;
sbit SCU_ESRCFG2_IN                       = SCU_ESRCFG2^6;
sbit SCU_ESRCFG2_OUT                      = SCU_ESRCFG2^5;

// ESR Data Register
sfr  SCU_ESRDAT                       = 0xF106;

// ESR1 External Control Register
sfr  SCU_ESREXCON1                    = 0xFF32;
sbit SCU_ESREXCON1_ESR1EN                   = SCU_ESREXCON1^0;
sbit SCU_ESREXCON1_P100EN                   = SCU_ESREXCON1^3;
sbit SCU_ESREXCON1_P10EN                    = SCU_ESREXCON1^4;
sbit SCU_ESREXCON1_P12EN                    = SCU_ESREXCON1^5;
sbit SCU_ESREXCON1_P21EN                    = SCU_ESREXCON1^6;
sbit SCU_ESREXCON1_P24EN                    = SCU_ESREXCON1^1;
sbit SCU_ESREXCON1_P30EN                    = SCU_ESREXCON1^2;

// ESR2 External Control Register
sfr  SCU_ESREXCON2                    = 0xFF34;
sbit SCU_ESREXCON2_ESR2EN                   = SCU_ESREXCON2^0;
sbit SCU_ESREXCON2_P1014EN                  = SCU_ESREXCON2^3;
sbit SCU_ESREXCON2_P11EN                    = SCU_ESREXCON2^4;
sbit SCU_ESREXCON2_P13EN                    = SCU_ESREXCON2^5;
sbit SCU_ESREXCON2_P22EN                    = SCU_ESREXCON2^6;
sbit SCU_ESREXCON2_P23EN                    = SCU_ESREXCON2^1;
sbit SCU_ESREXCON2_P70EN                    = SCU_ESREXCON2^2;

// EVR_1 Control 0 Register
sfr  SCU_EVR1CON0                     = 0xF088;

// EVR_1 Setting for 1.0 V Register
sfr  SCU_EVR1SET10V                   = 0xF098;

// EVR_1 Setting for 1.5 V HP Register
sfr  SCU_EVR1SET15VHP                 = 0xF09E;

// EVR_1 Setting for 1.5 V LP Register
sfr  SCU_EVR1SET15VLP                 = 0xF09C;

// EVR_1 Status Register
sfr  SCU_EVR1STAT                     = 0xF08E;

// EVR_M Control 0 Register
sfr  SCU_EVRMCON0                     = 0xF084;

// EVR_M Control 1 Register
sfr  SCU_EVRMCON1                     = 0xF086;

// EVR_M Setting for 1.0 V Register
sfr  SCU_EVRMSET10V                   = 0xF090;

// EVR_M Setting for 1.5 V HP Register
sfr  SCU_EVRMSET15VHP                 = 0xF096;

// EVR_M Setting for 1.5 V LP Register
sfr  SCU_EVRMSET15VLP                 = 0xF094;

// EVR_M Status Register
sfr  SCU_EVRMSTAT                     = 0xF08C;

// External Int. Trigger Control 0 Register
sfr  SCU_EXICON0                      = 0xF030;

// External Int. Trigger Control 1 Register
sfr  SCU_EXICON1                      = 0xF032;

// External Int. Trigger Control 2 Register
sfr  SCU_EXICON2                      = 0xF034;

// External Int. Trigger Control 3 Register
sfr  SCU_EXICON3                      = 0xF036;

// External Int. Input Select Register
sfr  SCU_EXISEL                       = 0xF1A0;

// External Output Trigger Control 0 Register
sfr  SCU_EXOCON0                      = 0xFE30;

// External Output Trigger Control 1 Register
sfr  SCU_EXOCON1                      = 0xFE32;

// External Output Trigger Control 2 Register
sfr  SCU_EXOCON2                      = 0xFE34;

// External Output Trigger Control 3 Register
sfr  SCU_EXOCON3                      = 0xFE36;

// External Clock Control Register
sfr  SCU_EXTCON                       = 0xFF5E;
sbit SCU_EXTCON_EN                       = SCU_EXTCON^0;
sbit SCU_EXTCON_FOEN                     = SCU_EXTCON^15;
sbit SCU_EXTCON_FOSS                     = SCU_EXTCON^14;
sbit SCU_EXTCON_FOTL                     = SCU_EXTCON^6;

// GSC Enable Register
sfr  SCU_GSCEN                        = 0xFF16;
sbit SCU_GSCEN_1                        = SCU_GSCEN^13;
sbit SCU_GSCEN_ESR0EN                   = SCU_GSCEN^5;
sbit SCU_GSCEN_ESR1EN                   = SCU_GSCEN^6;
sbit SCU_GSCEN_ESR2EN                   = SCU_GSCEN^7;
sbit SCU_GSCEN_GPTEN                    = SCU_GSCEN^10;
sbit SCU_GSCEN_ITCEN                    = SCU_GSCEN^9;
sbit SCU_GSCEN_OCDSENEN                 = SCU_GSCEN^14;
sbit SCU_GSCEN_OCDSEXEN                 = SCU_GSCEN^4;
sbit SCU_GSCEN_PSCAENEN                 = SCU_GSCEN^3;
sbit SCU_GSCEN_PSCAEXEN                 = SCU_GSCEN^2;
sbit SCU_GSCEN_PSCBENEN                 = SCU_GSCEN^1;
sbit SCU_GSCEN_PSCBEXEN                 = SCU_GSCEN^0;
sbit SCU_GSCEN_SW1EN                    = SCU_GSCEN^11;
sbit SCU_GSCEN_SW2EN                    = SCU_GSCEN^12;
sbit SCU_GSCEN_WUTEN                    = SCU_GSCEN^8;

// GSC Status Register
sfr  SCU_GSCSTAT                      = 0xFF18;
sbit SCU_GSCSTAT_ERR                      = SCU_GSCSTAT^8;
sbit SCU_GSCSTAT_PEN                      = SCU_GSCSTAT^9;

// GSC SW Request Register
sfr  SCU_GSCSWREQ                     = 0xFF14;
sbit SCU_GSCSWREQ_SWTRG1                   = SCU_GSCSWREQ^0;
sbit SCU_GSCSWREQ_SWTRG2                   = SCU_GSCSWREQ^1;

// High Precision OSC Control Register
sfr  SCU_HPOSCCON                     = 0xF1B4;
sbit SCU_HPOSCCON_EMCLKEN                  = SCU_HPOSCCON^9;
sbit SCU_HPOSCCON_EMFINDISEN               = SCU_HPOSCCON^10;
sbit SCU_HPOSCCON_OSC2L0                   = SCU_HPOSCCON^12;
sbit SCU_HPOSCCON_OSC2L1                   = SCU_HPOSCCON^11;
sbit SCU_HPOSCCON_OSCWDTRST                = SCU_HPOSCCON^1;
sbit SCU_HPOSCCON_PLLV                     = SCU_HPOSCCON^0;
sbit SCU_HPOSCCON_SHBY                     = SCU_HPOSCCON^8;
sbit SCU_HPOSCCON_X1D                      = SCU_HPOSCCON^6;
sbit SCU_HPOSCCON_X1DEN                    = SCU_HPOSCCON^7;

// Chip Identification Register
sfr  SCU_IDCHIP                       = 0xF07C;

// Manufacturer Identification Register
sfr  SCU_IDMANUF                      = 0xF07E;

// Program Memory Identification Register
sfr  SCU_IDMEM                        = 0xF07A;

// Programming Voltage Id. Register
sfr  SCU_IDPROG                       = 0xF078;

// Interrupt Clear Register
sfr  SCU_INTCLR                       = 0xFE82;

// Interrupt Disable Register
sfr  SCU_INTDIS                       = 0xFE84;

// Interrupt Node Pointer 0 Register
sfr  SCU_INTNP0                       = 0xFE86;

// Interrupt Node Pointer 1 Register
sfr  SCU_INTNP1                       = 0xFE88;

// Interrupt Set Register
sfr  SCU_INTSET                       = 0xFE80;

// Interrupt Status Register
sfr  SCU_INTSTAT                      = 0xFF00;
sbit SCU_INTSTAT_GSCI                     = SCU_INTSTAT^9;
sbit SCU_INTSTAT_PVC1I1                   = SCU_INTSTAT^4;
sbit SCU_INTSTAT_PVC1I2                   = SCU_INTSTAT^5;
sbit SCU_INTSTAT_PVCMI1                   = SCU_INTSTAT^2;
sbit SCU_INTSTAT_PVCMI2                   = SCU_INTSTAT^3;
sbit SCU_INTSTAT_SWDI1                    = SCU_INTSTAT^0;
sbit SCU_INTSTAT_SWDI2                    = SCU_INTSTAT^1;
sbit SCU_INTSTAT_WDTI                     = SCU_INTSTAT^8;
sbit SCU_INTSTAT_WUI                      = SCU_INTSTAT^7;
sbit SCU_INTSTAT_WUTI                     = SCU_INTSTAT^6;

// Interrupt Source Select Register
sfr  SCU_ISSR                         = 0xFF2E;
sbit SCU_ISSR_ISS0                     = SCU_ISSR^0;
sbit SCU_ISSR_ISS1                     = SCU_ISSR^1;
sbit SCU_ISSR_ISS10                    = SCU_ISSR^10;
sbit SCU_ISSR_ISS11                    = SCU_ISSR^11;
sbit SCU_ISSR_ISS12                    = SCU_ISSR^12;
sbit SCU_ISSR_ISS13                    = SCU_ISSR^13;
sbit SCU_ISSR_ISS14                    = SCU_ISSR^14;
sbit SCU_ISSR_ISS15                    = SCU_ISSR^15;
sbit SCU_ISSR_ISS2                     = SCU_ISSR^2;
sbit SCU_ISSR_ISS3                     = SCU_ISSR^3;
sbit SCU_ISSR_ISS4                     = SCU_ISSR^4;
sbit SCU_ISSR_ISS5                     = SCU_ISSR^5;
sbit SCU_ISSR_ISS6                     = SCU_ISSR^6;
sbit SCU_ISSR_ISS7                     = SCU_ISSR^7;
sbit SCU_ISSR_ISS8                     = SCU_ISSR^8;
sbit SCU_ISSR_ISS9                     = SCU_ISSR^9;

// Marker Memory 0 Register
sfr  SCU_MKMEM0                       = 0xFED0;

// Marker Memory 1 Register
sfr  SCU_MKMEM1                       = 0xFED2;

// Marker Memory 2 Register
sfr  SCU_MKMEM2                       = 0xFED4;

// Marker Memory 3 Register
sfr  SCU_MKMEM3                       = 0xFED6;

// PLL Configuration 0 Register
sfr  SCU_PLLCON0                      = 0xF1B8;
sbit SCU_PLLCON0_NACK                     = SCU_PLLCON0^15;
sbit SCU_PLLCON0_REGENCLR                 = SCU_PLLCON0^4;
sbit SCU_PLLCON0_REGENSET                 = SCU_PLLCON0^5;
sbit SCU_PLLCON0_VCOBY                    = SCU_PLLCON0^0;
sbit SCU_PLLCON0_VCOPWD                   = SCU_PLLCON0^1;

// PLL Configuration 1 Register
sfr  SCU_PLLCON1                      = 0xF1BA;
sbit SCU_PLLCON1_AOSCSEL                  = SCU_PLLCON1^3;
sbit SCU_PLLCON1_EMCLKEN                  = SCU_PLLCON1^5;
sbit SCU_PLLCON1_EMFINDISEN               = SCU_PLLCON1^6;
sbit SCU_PLLCON1_OSCSEL                   = SCU_PLLCON1^1;
sbit SCU_PLLCON1_PACK                     = SCU_PLLCON1^15;
sbit SCU_PLLCON1_PLLPWD                   = SCU_PLLCON1^0;
sbit SCU_PLLCON1_RESLD                    = SCU_PLLCON1^2;

// PLL Configuration 2 Register
sfr  SCU_PLLCON2                      = 0xF1BC;
sbit SCU_PLLCON2_K1ACK                    = SCU_PLLCON2^15;

// PLL Configuration 3 Register
sfr  SCU_PLLCON3                      = 0xF1BE;
sbit SCU_PLLCON3_K2ACK                    = SCU_PLLCON3^15;

// PLL OSC Configuration Register
sfr  SCU_PLLOSCCON                    = 0xF1B6;
sbit SCU_PLLOSCCON_OSCPD                    = SCU_PLLOSCCON^0;

// PLL Status Register
sfr  SCU_PLLSTAT                      = 0xF0BC;

// PSC Status Register
#define SCU_PSCSTAT            (*((unsigned int volatile sdata *) 0xFFE8))

// PVC_1 Control Step 0 Register
sfr  SCU_PVC1CON0                     = 0xF014;

// PVC_1 Control for Step 1Set A Register
sfr  SCU_PVC1CONA1                    = 0xF016;

// PVC_1 Control for Step 2 Set A Register
sfr  SCU_PVC1CONA2                    = 0xF018;

// PVC_1 Control for Step 3 Set A Register
sfr  SCU_PVC1CONA3                    = 0xF01A;

// PVC_1 Control for Step 4 Set A Register
sfr  SCU_PVC1CONA4                    = 0xF01C;

// PVC_1 Control for Step 5 Set A Register
sfr  SCU_PVC1CONA5                    = 0xF01E;

// PVC_1 Control for Step 6 Set A Register
sfr  SCU_PVC1CONA6                    = 0xF020;

// PVC_1 Control for Step 1 Set B Register
sfr  SCU_PVC1CONB1                    = 0xF024;

// PVC_1 Control for Step 2 Set B Register
sfr  SCU_PVC1CONB2                    = 0xF026;

// PVC_1 Control for Step 3 Set B Register
sfr  SCU_PVC1CONB3                    = 0xF028;

// PVC_1 Control for Step 4 Set B Register
sfr  SCU_PVC1CONB4                    = 0xF02A;

// PVC_1 Control for Step 5 Set B Register
sfr  SCU_PVC1CONB5                    = 0xF02C;

// PVC_1 Control for Step 6 Set B Register
sfr  SCU_PVC1CONB6                    = 0xF02E;

// PVC_M Control Step 0 Register
#define SCU_PVCMCON0           (*((unsigned int volatile sdata *) 0xF1E4))

// PVC_M Control for Step 1 Set A Register
#define SCU_PVCMCONA1          (*((unsigned int volatile sdata *) 0xF1E6))

// PVC_M Control for Step 2 Set A Register
#define SCU_PVCMCONA2          (*((unsigned int volatile sdata *) 0xF1E8))

// PVC_M Control for Step 3 Set A Register
#define SCU_PVCMCONA3          (*((unsigned int volatile sdata *) 0xF1EA))

// PVC_M Control for Step 4 Set A Register
#define SCU_PVCMCONA4          (*((unsigned int volatile sdata *) 0xF1EC))

// PVC_M Control for Step 5 Set A Register
#define SCU_PVCMCONA5          (*((unsigned int volatile sdata *) 0xF1EE))

// PVC_M Control for Step 6 Set A Register
#define SCU_PVCMCONA6          (*((unsigned int volatile sdata *) 0xF1F0))

// PVC_M Control for Step 1 Set B Register
#define SCU_PVCMCONB1          (*((unsigned int volatile sdata *) 0xF1F4))

// PVC_M Control for Step 2 Set B Register
#define SCU_PVCMCONB2          (*((unsigned int volatile sdata *) 0xF1F6))

// PVC_M Control for Step 3 Set B Register
#define SCU_PVCMCONB3          (*((unsigned int volatile sdata *) 0xF1F8))

// PVC_M Control for Step 4 Set B Register
#define SCU_PVCMCONB4          (*((unsigned int volatile sdata *) 0xF1FA))

// PVC_M Control for Step 5 Set B Register
#define SCU_PVCMCONB5          (*((unsigned int volatile sdata *) 0xF1FC))

// PVC_M Control for Step 6 Set B Register
#define SCU_PVCMCONB6          (*((unsigned int volatile sdata *) 0xF1FE))

// Reset Counter Control Register
sfr  SCU_RSTCNTCON                    = 0xF1B2;

// Reset Configuration 0 Register
sfr  SCU_RSTCON0                      = 0xF0B8;

// Reset Configuration 1 Register
sfr  SCU_RSTCON1                      = 0xF0BA;

// Reset Status 0 Register
sfr  SCU_RSTSTAT0                     = 0xF0B2;

// Reset Status 1 Register
sfr  SCU_RSTSTAT1                     = 0xF0B4;

// Reset Status 2 Register
sfr  SCU_RSTSTAT2                     = 0xF0B6;

// RTC Clock Control Register
sfr  SCU_RTCCLKCON                    = 0xFF4E;
sbit SCU_RTCCLKCON_RTCCM                    = SCU_RTCCLKCON^2;

// Sequence Step 1 for Set A Register
sfr  SCU_SEQASTEP1                    = 0xFEE6;

// Sequence Step 2 for Set A Register
sfr  SCU_SEQASTEP2                    = 0xFEE8;

// Sequence Step 3 for Set A Register
sfr  SCU_SEQASTEP3                    = 0xFEEA;

// Sequence Step 4 for Set A Register
sfr  SCU_SEQASTEP4                    = 0xFEEC;

// Sequence Step 5 for Set A Register
sfr  SCU_SEQASTEP5                    = 0xFEEE;

// Sequence Step 6 for Set A Register
sfr  SCU_SEQASTEP6                    = 0xFEF0;

// Sequence Step 1 for Set B Register
sfr  SCU_SEQBSTEP1                    = 0xFEF4;

// Sequence Step 2 for Set B Register
sfr  SCU_SEQBSTEP2                    = 0xFEF6;

// Sequence Step 3 for Set B Register
sfr  SCU_SEQBSTEP3                    = 0xFEF8;

// Sequence Step 4 for Set B Register
sfr  SCU_SEQBSTEP4                    = 0xFEFA;

// Sequence Step 5 for Set B Register
sfr  SCU_SEQBSTEP5                    = 0xFEFC;

// Sequence Step 6 for Set B Register
sfr  SCU_SEQBSTEP6                    = 0xFEFE;

// Sequence Control Register
sfr  SCU_SEQCON                       = 0xFEE4;

// Security Level Command Register
sfr  SCU_SLC                          = 0xF0C0;

// Security Level Status Register
sfr  SCU_SLS                          = 0xF0C2;

// Status Clear 0 Register
sfr  SCU_STATCLR0                     = 0xF0E0;

// Status Clear 1 Register
sfr  SCU_STATCLR1                     = 0xF0E2;

// Start-up Configuration Register
#define SCU_STCON              (*((unsigned int volatile sdata *) 0xF1E2))

// Step 0 Register
sfr  SCU_STEP0                        = 0xFEF2;

// Start-up Memory 0 Register
sfr  SCU_STMEM0                       = 0xF0A0;

// Start-up Status Register
#define SCU_STSTAT             (*((unsigned int volatile sdata *) 0xF1E0))

// SWD Control 0 Register
sfr  SCU_SWDCON0                      = 0xF080;

// SWD Control 1 Register
sfr  SCU_SWDCON1                      = 0xF082;

// SW Reset Control Register
sfr  SCU_SWRSTCON                     = 0xF0AE;

// System Control 0 Register
sfr  SCU_SYSCON0                      = 0xFF4A;
sbit SCU_SYSCON0_EMCLKSELEN               = SCU_SYSCON0^6;
sbit SCU_SYSCON0_EMSOSC                   = SCU_SYSCON0^12;
sbit SCU_SYSCON0_EMSPWR                   = SCU_SYSCON0^14;
sbit SCU_SYSCON0_EMSVCO                   = SCU_SYSCON0^13;
sbit SCU_SYSCON0_SELSTAT                  = SCU_SYSCON0^15;

// System Control 1 Register
sfr  SCU_SYSCON1                      = 0xFF4C;
sbit SCU_SYSCON1_GLCCST                   = SCU_SYSCON1^3;
sbit SCU_SYSCON1_OCDSEN                   = SCU_SYSCON1^2;
sbit SCU_SYSCON1_VRMDS                    = SCU_SYSCON1^1;
sbit SCU_SYSCON1_VRMPS                    = SCU_SYSCON1^0;

// Temperature Compensation Register
sfr  SCU_TCCR                         = 0xF1AC;
sbit SCU_TCCR_TCE                      = SCU_TCCR^7;

// Temperature Comp. Level Register
sfr  SCU_TCLR                         = 0xF0AC;

// Trap Clear Register
sfr  SCU_TRAPCLR                      = 0xFE8E;

// Trap Disable Register
sfr  SCU_TRAPDIS                      = 0xFE90;

// Trap Node Pointer Register
sfr  SCU_TRAPNP                       = 0xFE92;

// Trap Set Register
sfr  SCU_TRAPSET                      = 0xFE8C;

// Trap Status Register
sfr  SCU_TRAPSTAT                     = 0xFF02;
sbit SCU_TRAPSTAT_ESR0T                    = SCU_TRAPSTAT^1;
sbit SCU_TRAPSTAT_ESR1T                    = SCU_TRAPSTAT^2;
sbit SCU_TRAPSTAT_ESR2T                    = SCU_TRAPSTAT^3;
sbit SCU_TRAPSTAT_FAT                      = SCU_TRAPSTAT^0;
sbit SCU_TRAPSTAT_OSCWDTT                  = SCU_TRAPSTAT^4;
sbit SCU_TRAPSTAT_PET                      = SCU_TRAPSTAT^6;
sbit SCU_TRAPSTAT_RAT                      = SCU_TRAPSTAT^5;
sbit SCU_TRAPSTAT_VCOLCKT                  = SCU_TRAPSTAT^7;

// WDT Control and Status Register
sfr  SCU_WDTCS                        = 0xF0C6;

// WDT Reload Register
sfr  SCU_WDTREL                       = 0xF0C8;

// WDT Timer Register
sfr  SCU_WDTTIM                       = 0xF0CA;

// Wake-up Interval Count Register
sfr  SCU_WICR                         = 0xF0B0;

// Wake-up Control Register
sfr  SCU_WUCR                         = 0xF1B0;
sbit SCU_WUCR_AON                      = SCU_WUCR^9;
sbit SCU_WUCR_ASP                      = SCU_WUCR^10;
sbit SCU_WUCR_CLRTRG                   = SCU_WUCR^7;
sbit SCU_WUCR_RUN                      = SCU_WUCR^8;
sbit SCU_WUCR_TTSTAT                   = SCU_WUCR^14;
sbit SCU_WUCR_WUTRG                    = SCU_WUCR^15;

// Wake-up OSC Control Register
sfr  SCU_WUOSCCON                     = 0xF1AE;
sbit SCU_WUOSCCON_DIS                      = SCU_WUOSCCON^4;

// Stack Pointer
sfr  SP                               = 0xFE12;

// Stack Pointer Segment
sfr  SPSEG                            = 0xFF0C;


// Stack Overflow Pointer
sfr  STKOV                            = 0xFE14;

// Stack Underflow Pointer
sfr  STKUN                            = 0xFE16;

// Trap Flag Register
sfr  TFR                              = 0xFFAC;
sbit TFR_ACER                     = TFR^4;
sbit TFR_ILLOPA                   = TFR^2;
sbit TFR_PRTFLT                   = TFR^3;
sbit TFR_SOFTBRK                  = TFR^12;
sbit TFR_SR0                      = TFR^15;
sbit TFR_SR1                      = TFR^11;
sbit TFR_STKOF                    = TFR^14;
sbit TFR_STKUF                    = TFR^13;
sbit TFR_UNDOPC                   = TFR^7;


// Vector Segment Pointer
sfr  VECSEG                           = 0xFF12;

// Constant Zeros Register
sfr  ZEROS                            = 0xFF1C;


#endif  // ifndef _XE16XREGS_H_
