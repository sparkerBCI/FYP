/*        $Id: Ass-02.h 1592 2019-02-05 14:38:48Z Peter $
 *  $Revision: 1592 $
 *      $Date: 2019-02-06 01:38:48 +1100 (Wed, 06 Feb 2019) $
 *    $Author: Peter $
 */

// Assignment 2 include file

#ifndef ASS_02_H_
#define ASS_02_H_

// Token Types
#define TPLUS 0
#define	TMINS 1
#define	TDIVI 2
#define	TMULT 3
#define	TINT  4
#define	TREAL 5
#define	TLBRK 6
#define	TRBRK 7
#define	TEND  8
#define	THEAD 9
#define TCART 10


// Standard includes
#ifdef STM32F407xx
#include "stm32f4xx_hal.h"
#include "openx07v_c_lcd.h"
#include "touch_panel.h"
#include "main.h"
#else
#include <windows.h>
#endif
#include <stdio.h>
#include <stdint.h>
#include <malloc.h>
#include <string.h>
#include <stdlib.h>





struct Button;
typedef struct Button Button;

typedef void (*onClick)(Button *button);
struct Button
{
	int x_TopLeft;
	int y_TopLeft;
	int x_BottomRight;
	int y_BottomRight;
	onClick onClick;
	int colour;
	char *buttonText;
	int textLength;
	int textColour;
};

// Assignment and version strings
#define ASS_STRING "ELEC3730-2019t1 Assignment 2"
#define VER_STRING "Ver: 01 $Rev: 1592 $"
#define BUTTON_START_X 25
#define BUTTON_START_Y 50
#define BUTTON_WIDTH 35
#define BUTTON_HEIGHT 35
#define BUTTON_SPACING_Y 15
#define BUTTON_SPACING_X 10
#define BUTTON_COUNT 20
#define MIN_NO_CLICK 2000

// Assignment main
extern void
Ass_02_Main (void);

//
// REPLACE THE EXAMPLE CODE WITH YOUR CODE 
//

// Question 1
extern void
CommandLineParserInit (void);
extern void
CommandLineParserProcess (void);

// Question 2
extern void
CalculatorInit (void);
extern void
CalculatorProcess (void);

// Library functions
void drawButton(Button *button);
void defineButton(Button *button, int x_TopLeft, int y_TopLeft, int x_BottomRight, int y_BottomRight, void (*onClick)(), int colour, char *buttonText,  int textLength, int textColour);

#ifdef STM32F407xx
extern uint8_t
BSP_TP_Init (void);
extern uint8_t
BSP_TP_GetDisplayPoint (Coordinate *pDisplay);
#endif

#endif /* ASS_02_H_ */
