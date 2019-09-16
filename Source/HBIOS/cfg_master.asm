;
;==================================================================================================
;   ROMWBW 2.X CONFIGURATION MASTER
;==================================================================================================
;
; THIS FILE IS *NOT* A REAL CONFIGURATION FILE.	 IT IS A MASTER TEMPLATE FILE
; CONTAINING ALL POSSIBLE CONFIGURATION SETTINGS ACROSS ALL PLATFORMS.	IT IS
; USED ONLY AS A REFERENCE TO HELP MANAGE THE FULL SET OF POSSIBLE SETTINGS AND
; KEEP THINGS CONSISTENT.
;
#DEFINE PLATFORM_NAME "ROMWBW"
;
PLATFORM	.EQU	PLT_SBC		; PLT_[SBC|ZETA|ZETA2|N8|MK4|UNA|RCZ80|RCZ180|EZZ80|SC126]
CPUFAM		.EQU	CPU_Z80		; CPU FAMILY: CPU_[Z80|Z180]
BIOS		.EQU	BIOS_WBW	; HARDWARE BIOS: BIOS_[WBW|UNA]
BATCOND		.EQU	FALSE		; ENABLE LOW BATTERY WARNING MESSAGE
;
BOOTTYPE	.EQU	BT_MENU		; BT_[MENU|AUTO], IF AUTO, BOOT DEFAULT AFTER TIMEOUT
BOOT_TIMEOUT	.EQU	20		; AUTO BOOT TIMEOUT IN SECONDS, 0 FOR IMMEDIATE BOOT
BOOT_DEFAULT	.EQU	'Z'		; AUTO BOOT SELECTION TO INVOKE AT TIMEOUT
;
CPUOSC		.EQU	8000000		; CPU OSC FREQ IN MHZ
INTMODE		.EQU	0		; INTERRUPTS: 0=NONE, 1=MODE 1, 2=MODE 2
DEFSERCFG	.EQU	SER_38400_8N1	; DEFAULT SERIAL LINE CONFIG (SEE STD.ASM)
;
RAMSIZE		.EQU	512		; SIZE OF RAM IN KB (MUST MATCH YOUR HARDWARE!!!)
MEMMGR		.EQU	MM_NONE		; MEMORY MANAGER: MM_[SBC|Z2|N8|Z180]
RAMBIAS		.EQU	0		; OFFSET OF START OF RAM IN PHYSICAL ADDRESS SPACE
MPCL_RAM	.EQU	$78		; SBC MEM MGR RAM PAGE SELECT REG (WRITE ONLY)
MPCL_ROM	.EQU	$7C		; SBC MEM MGR ROM PAGE SELECT REG (WRITE ONLY)
MPGSEL_0	.EQU	$78		; Z2 MEM MGR BANK 0 PAGE SELECT REG (WRITE ONLY)
MPGSEL_1	.EQU	$79		; Z2 MEM MGR BANK 1 PAGE SELECT REG (WRITE ONLY)
MPGSEL_2	.EQU	$7A		; Z2 MEM MGR BANK 2 PAGE SELECT REG (WRITE ONLY)
MPGSEL_3	.EQU	$7B		; Z2 MEM MGR BANK 3 PAGE SELECT REG (WRITE ONLY)
MPGENA		.EQU	$7C		; Z2 MEM MGR PAGING ENABLE REGISTER (BIT 0, WRITE ONLY)
;
Z180_BASE	.EQU	$40		; Z180: I/O BASE ADDRESS FOR INTERNAL REGISTERS
Z180_CLKDIV	.EQU	1		; Z180: CHK DIV: 0=OSC/2, 1=OSC, 2=OSC*2
Z180_MEMWAIT	.EQU	0		; Z180: MEMORY WAIT STATES (0-3)
Z180_IOWAIT	.EQU	1		; Z180: I/O WAIT STATES TO ADD ABOVE 1 W/S BUILT-IN (0-3)
;
N8_PPI0		.EQU	$80		; N8: FIRST PARALLEL PORT REGISTERS BASE ADR
N8_PPI1		.EQU	$84		; N8: SECOND PARALLEL PORT REGISTERS BASE ADR
N8_RTC		.EQU	$88		; N8: RTC LATCH REGISTER ADR
N8_ACR		.EQU	$94		; N8: AUXILLARY CONTROL REGISTER (ACR) ADR
N8_RMAP		.EQU	$96		; N8: ROM PAGE REGISTER ADR
N8_DEFACR	.EQU	$1B		; N8: AUX CTL REGISTER DEFAULT VALUE (QUIESCIENT STATE)
;
MK4_IDE		.EQU	$80		; MK4: IDE REGISTERS BASE ADR
MK4_XAR		.EQU	$88		; MK4: EXTERNAL ADDRESS REGISTER (XAR) ADR
MK4_SD		.EQU	$89		; MK4: SD CARD CONTROL REGISTER ADR
MK4_RTC		.EQU	$8A		; MK4: RTC LATCH REGISTER ADR
;
RTCIO		.EQU	$70		; RTC LATCH REGISTER ADR
WDOGIO		.EQU	$6F		; WATCHDOG REGISTER ADR
PPIBASE		.EQU	$60		; PRIMARY PARALLEL PORT REGISTERS BASE ADR
;
KIOENABLE	.EQU	FALSE		; ENABLE ZILOG KIO SUPPORT
KIOBASE		.EQU	$80		; KIO BASE I/O ADDRESS
;
CTCENABLE	.EQU	FALSE		; ENABLE ZILOG CTC SUPPORT
CTCBASE		.EQU	$20		; CTC BASE I/O ADDRESS
;
DIAGENABLE	.EQU	FALSE		; ENABLES OUTPUT TO 8 BIT LED DIAGNOSTIC PORT
DIAGPORT	.EQU	$00		; DIAGNOSTIC PORT ADDRESS
;
DSKYENABLE	.EQU	FALSE		; ENABLES DSKY (DO NOT COMBINE WITH PPIDE)
;
CRTACT		.EQU	FALSE		; ACTIVATE CRT (VDU,CVDU,PROPIO,ETC) AT STARTUP
VDAEMU		.EQU	EMUTYP_ANSI	; VDA EMULATION: EMUTYP_[TTY|ANSI]
ANSITRACE	.EQU	1		; ANSI DRIVER TRACE LEVEL (0=NO,1=ERRORS,2=ALL)
PPKTRACE	.EQU	1		; PPK DRIVER TRACE LEVEL (0=NO,1=ERRORS,2=ALL)
KBDTRACE	.EQU	1		; KBD DRIVER TRACE LEVEL (0=NO,1=ERRORS,2=ALL)
PPKKBLOUT	.EQU	KBD_US		; PPK KEYBOARD LANGUAGE: KBD_[US|DE]
KBDKBLOUT	.EQU	KBD_US		; KBD KEYBOARD LANGUAGE: KBD_[US|DE]
;
HTIMENABLE	.EQU	FALSE		; ENABLE SIMH TIMER SUPPORT
SIMRTCENABLE	.EQU	FALSE		; ENABLE SIMH CLOCK DRIVER (SIMRTC.ASM)
;
DSRTCENABLE	.EQU	FALSE		; DSRTC: ENABLE DS-1302 CLOCK DRIVER (DSRTC.ASM)
DSRTCMODE	.EQU	DSRTCMODE_STD	; DSRTC: OPERATING MODE: DSRTC_[STD|MFPIC]
DSRTCCHG	.EQU	FALSE		; DSRTC: FORCE BATTERY CHARGE ON (USE WITH CAUTION!!!)
;
UARTENABLE	.EQU	FALSE		; UART: ENABLE 8250/16550-LIKE SERIAL DRIVER (UART.ASM)
UARTOSC		.EQU	1843200		; UART: OSC FREQUENCY IN MHZ
UARTSBC		.EQU	FALSE		; UART: AUTO-DETECT SBC/ZETA ONBOARD UART
UARTCAS		.EQU	FALSE		; UART: AUTO-DETECT ECB CASSETTE UART
UARTMFP		.EQU	FALSE		; UART: AUTO-DETECT MF/PIC UART
UART4		.EQU	FALSE		; UART: AUTO-DETECT 4UART UART
;
ASCIENABLE	.EQU	FALSE		; ASCI: ENABLE Z180 ASCI SERIAL DRIVER (ASCI.ASM)
ASCI0CFG	.EQU	DEFSERCFG	; ASCI 0: SERIAL LINE CONFIG
ASCI1CFG	.EQU	DEFSERCFG	; ASCI 1: SERIAL LINE CONFIG
;
ACIAENABLE	.EQU	FALSE		; ACIA: ENABLE MOTOROLA 6850 ACIA DRIVER (ACIA.ASM)
ACIADEBUG	.EQU	FALSE		; ACIA: ENABLE DEBUG OUTPUT
ACIACNT		.EQU	1		; ACIA: NUMBER OF CHIPS TO DETECT (1-2)
ACIA0BASE	.EQU	$80		; ACIA 0: REGISTERS BASE ADR
ACIA0CLK	.EQU	CPUOSC		; ACIA 0: OSC FREQ IN HZ
ACIA0DIV	.EQU	1		; ACIA 0: SERIAL CLOCK DIVIDER
ACIA0CFG	.EQU	DEFSERCFG	; ACIA 0: SERIAL LINE CONFIG  (SEE STD.ASM)
ACIA1BASE	.EQU	$40		; ACIA 1: REGISTERS BASE ADR
ACIA1CLK	.EQU	CPUOSC		; ACIA 1: OSC FREQ IN HZ
ACIA1DIV	.EQU	1		; ACIA 1: SERIAL CLOCK DIVIDER
ACIA1CFG	.EQU	DEFSERCFG	; ACIA 1: SERIAL LINE CONFIG  (SEE STD.ASM)
;
SIOENABLE	.EQU	FALSE		; SIO: ENABLE ZILOG SIO SERIAL DRIVER (SIO.ASM)
SIODEBUG	.EQU	FALSE		; SIO: ENABLE DEBUG OUTPUT
SIOCNT		.EQU	2		; SIO: NUMBER OF CHIPS TO DETECT (1-2), 2 CHANNELS PER CHIP
SIO0MODE	.EQU	SIOMODE_RC	; SIO 0: CHIP TYPE: SIOMODE_[RC|SMB|ZP|EZZ80]
SIO0BASE	.EQU	$80		; SIO 0: REGISTERS BASE ADR
SIO0ACLK	.EQU	CPUOSC		; SIO 0A: OSC FREQ IN HZ, ZP=2457600/4915200, RC/SMB=7372800
SIO0ADIV	.EQU	1		; SIO 0A: SERIAL CLOCK DIVIDER, RC2014/SMB=1, ZP=2/4/8/16/32/64/128/256 (X5)
SIO0ACFG	.EQU	DEFSERCFG	; AIO 0A: SERIAL LINE CONFIG
SIO0BCLK	.EQU	CPUOSC		; SIO 0B: OSC FREQ IN HZ, ZP=2457600/4915200, RC/SMB=7372800
SIO0BDIV	.EQU	1		; SIO 0B: SERIAL CLOCK DIVIDER, RC2014/SMB=1, ZP=2/4/8/16/32/64/128/256 (X5)
SIO0BCFG	.EQU	DEFSERCFG	; SIO 0B: SERIAL LINE CONFIG
SIO1MODE	.EQU	SIOMODE_RC	; SIO 1: CHIP TYPE: SIOMODE_[RC|SMB|ZP|EZZ80]
SIO1BASE	.EQU	$84		; SIO 1: REGISTERS BASE ADR
SIO1ACLK	.EQU	CPUOSC		; SIO 1A: OSC FREQ IN HZ, ZP=2457600/4915200, RC/SMB=7372800
SIO1ADIV	.EQU	1		; SIO 1A: SERIAL CLOCK DIVIDER, RC2014/SMB=1, ZP=2/4/8/16/32/64/128/256 (X5)
SIO1ACFG	.EQU	DEFSERCFG	; AIO 1A: SERIAL LINE CONFIG
SIO1BCLK	.EQU	CPUOSC		; SIO 1B: OSC FREQ IN HZ, ZP=2457600/4915200, RC/SMB=7372800
SIO1BDIV	.EQU	1		; SIO 1B: SERIAL CLOCK DIVIDER, RC2014/SMB=1, ZP=2/4/8/16/32/64/128/256 (X5)
SIO1BCFG	.EQU	DEFSERCFG	; SIO 1B: SERIAL LINE CONFIG
;
VDUENABLE	.EQU	FALSE		; VDU: ENABLE VDU VIDEO/KBD DRIVER (VDU.ASM)
VDUSIZ		.EQU	V80X25		; VDU: DISPLAY FORMAT [V80X24|V80X25|V80X30]
CVDUENABLE	.EQU	FALSE		; CVDU: ENABLE CVDU VIDEO/KBD DRIVER (CVDU.ASM)
NECENABLE	.EQU	FALSE		; NEC: ENABLE NEC UPD7220 VIDEO/KBD DRIVER (NEC.ASM)
TMSENABLE	.EQU	FALSE		; TMS: ENABLE TMS9918 VIDEO/KBD DRIVER (TMS.ASM)
TMSMODE		.EQU	TMSMODE_NONE	; TMS: DRIVER MODE: TMSMODE_[SCG/N8]
VGAENABLE	.EQU	FALSE		; VGA: ENABLE VGA VIDEO/KBD DRIVER (VGA.ASM)
;
SPKENABLE	.EQU	FALSE		; SPK: ENABLE RTC LATCH IOBIT SOUND DRIVER (SPK.ASM)
;
AYENABLE	.EQU	FALSE		; AY: ENABLE AY PSG SOUND DRIVER
AYMODE		.EQU	AYMODE_NONE	; AY: DRIVER MODE: AYMODE_[SCG/N8/RCZ80/RCZ180]
;
MDENABLE	.EQU	TRUE		; MD: ENABLE MEMORY (ROM/RAM) DISK DRIVER (MD.ASM)
MDTRACE		.EQU	1		; MD: TRACE LEVEL (0=NO,1=ERRORS,2=ALL)
;
FDENABLE	.EQU	FALSE		; FD: ENABLE FLOPPY DISK DRIVER (FD.ASM)
FDMODE		.EQU	FDMODE_NONE	; FD: DRIVER MODE: FDMODE_[DIO|ZETA|DIDE|N8|DIO3]
FDTRACE		.EQU	1		; FD: TRACE LEVEL (0=NO,1=FATAL,2=ERRORS,3=ALL)
FDMEDIA		.EQU	FDM144		; FD: DEFAULT MEDIA FORMAT FDM[720|144|360|120|111]
FDMEDIAALT	.EQU	FDM720		; FD: ALTERNATE MEDIA FORMAT FDM[720|144|360|120|111]
FDMAUTO		.EQU	TRUE		; FD: AUTO SELECT DEFAULT/ALTERNATE MEDIA FORMATS
;
RFENABLE	.EQU	FALSE		; RF: ENABLE RAM FLOPPY DRIVER
RFCNT		.EQU	1		; RF: NUMBER OF RAM FLOPPY UNITS (1-2)
;
IDEENABLE	.EQU	FALSE		; IDE: ENABLE IDE DISK DRIVER (IDE.ASM)
IDEMODE		.EQU	IDEMODE_NONE	; IDE: DRIVER MODE: IDEMODE_[DIO|DIDE]
IDETRACE	.EQU	1		; IDE: TRACE LEVEL (0=NO,1=ERRORS,2=ALL)
IDE8BIT		.EQU	FALSE		; IDE: USE 8-BIT TRANSFERS (CF CARDS MOSTLY)
;
PPIDEENABLE	.EQU	FALSE		; PPIDE: ENABLE PARALLEL PORT IDE DISK DRIVER (PPIDE.ASM)
PPIDEMODE	.EQU	PPIDEMODE_NONE	; PPIDE: DRIVER MODE: PPIDEMODE_[SBC|DIO3|MFP|N8|RC]
PPIDETRACE	.EQU	1		; PPIDE: TRACE LEVEL (0=NO,1=ERRORS,2=ALL)
PPIDE8BIT	.EQU	FALSE		; PPIDE: USE 8-BIT TRANSFERS (CF CARDS MOSTLY)
;
SDENABLE	.EQU	FALSE		; SD: ENABLE SD CARD DISK DRIVER (SD.ASM)
SDMODE		.EQU	SDMODE_NONE	; SD: DRIVER MODE: SDMODE_[JUHA|N8|CSIO|PPI|UART|DSD|MK4|SC126]
SDTRACE		.EQU	1		; SD: TRACE LEVEL (0=NO,1=ERRORS,2=ALL)
SDCSIOFAST	.EQU	FALSE		; SD: ENABLE TABLE-DRIVEN BIT INVERTER IN CSIO MODE
;
PRPENABLE	.EQU	FALSE		; PRP: ENABLE ECB PROPELLER IO BOARD DRIVER (PRP.ASM)
PRPSDENABLE	.EQU	TRUE		; PRP: ENABLE PROPIO DRIVER SD CARD SUPPORT
PRPSDTRACE	.EQU	1		; PRP: SD CARD TRACE LEVEL (0=NO,1=ERRORS,2=ALL)
PRPCONENABLE	.EQU	TRUE		; PRP: ENABLE PROPIO DRIVER VIDEO/KBD SUPPORT
;
PPPENABLE	.EQU	FALSE		; PPP: ENABLE ZETA PARALLEL PORT PROPELLER BOARD DRIVER (PPP.ASM)
PPPSDENABLE	.EQU	TRUE		; PPP: ENABLE PPP DRIVER SD CARD SUPPORT
PPPSDTRACE	.EQU	1		; PPP: SD CARD TRACE LEVEL (0=NO,1=ERRORS,2=ALL)
PPPCONENABLE	.EQU	TRUE		; PPP: ENABLE PPP DRIVER VIDEO/KBD SUPPORT
;
HDSKENABLE	.EQU	FALSE		; HDSK: ENABLE SIMH HDSK DISK DRIVER (HDSK.ASM)
HDSKTRACE	.EQU	1		; HDSK: TRACE LEVEL (0=NO,1=ERRORS,2=ALL)
;
PIO_4P		.EQU	FALSE		; PIO: ENABLE PARALLEL PORT DRIVER FOR ECB 4P BOARD
PIO4BASE	.EQU	$90		; PIO: PIO REGISTERS BASE ADR FOR ECB 4P BOARD
PIO_ZP		.EQU	FALSE		; PIO: ENABLE PARALLEL PORT DRIVER FOR ECB ZILOG PERIPHERALS BOARD (PIO.ASM)
PIOZBASE	.EQU	$88		; PIO: PIO REGISTERS BASE ADR FOR ECB ZP BOARD
PPI_SBC		.EQU	FALSE		; PIO: ENABLE PARALLEL PORT DRIVER FOR 8255 CHIP
;
UFENABLE	.EQU	FALSE		; UF: ENABLE ECB USB FIFO DRIVER (UF.ASM)
UFBASE		.EQU	$0C		; UF: REGISTERS BASE ADR
