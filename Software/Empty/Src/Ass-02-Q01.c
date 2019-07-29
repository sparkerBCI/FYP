/*        $Id: Ass-02-Q01.c 1592 2019-02-05 14:38:48Z Peter $
 *  $Revision: 1592 $
 *      $Date: 2019-02-06 01:38:48 +1100 (Wed, 06 Feb 2019) $
 *    $Author: Peter $
 */

#include "Ass-02.h"
#include <string.h>
#ifdef STM32F407xx
#include "usart.h"
#endif


/* A function to print some info at the start of the terminal session.
 *
 * Inputs: void
 *
 * Outputs: Void
 */
void
CommandLineParserInit (void)
{

  printf ("\n");																						/* Print a new line character */
  printf ("%s\n", ASS_STRING);																			/* Print the name of the assignment */
  printf ("%s\n", VER_STRING);																			/* Print the version number */
  printf ("Command Line Parser Example\n");																/* Print some information about the assignment */
}


/* A function to get input over the serial connection. Serial connection is UART, Baud Rate 115200, 8 data bits, 1 stop bit
 *
 * Inputs: void
 *
 * Outputs: void
 */
void
CommandLineParserProcess (void)
{
#ifdef STM32F407xx																						/* If we are running on the STM */
  uint8_t c = 'a';																						/* The character the data is saved to. Arbitrarily assigned 'a' */
															/* The string the input characters are saved to. Max size defined by MAX_COMMAND_SIZE */
  static int num_chars = 0;																				/* Count the number of characters received over serial */
	  if (HAL_UART_Receive (&huart2, &c, 1, 0x0) == HAL_OK)
	  {
		  printf("%c", c);
		  HAL_GPIO_TogglePin (GPIOD, LD4_Pin); 																// Toggle LED4
	  }



#else																									/* Otherwise, we are running on Windows */
  /* Do something if running on windows */
#endif
}
