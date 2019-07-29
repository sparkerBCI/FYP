/*        $Id: Ass-02-Lib.c 1592 2019-02-05 14:38:48Z Peter $
 *  $Revision: 1592 $
 *      $Date: 2019-02-06 01:38:48 +1100 (Wed, 06 Feb 2019) $
 *    $Author: Peter $
 */

#include "Ass-02.h"

//
// PLACE YOUR COMMON CODE HERE 
//

// STEPIEN: Added two touch panel functions to make the interface more
//          consistent with the LCD BSP.

#ifdef STM32F407xx

//int string_parser(char *inp, char **array_of_words_p[]);

uint8_t
BSP_TP_Init (void)
{
  // Initialise the interface and calibrate
  TP_Init (); // This is an empty function since done by STM32CubeMX
  TouchPanel_Calibrate ();

  return 0;
}


uint8_t
BSP_TP_GetDisplayPoint (Coordinate *pDisplay)
{
  Coordinate *pScreen;

  pScreen = Read_Ads7846 ();
  if (pScreen == NULL)
  {
    return 1; // Error reading the touch panel
  }
  if (getDisplayPoint (pDisplay, pScreen, &matrix) == DISABLE)
  {
    return 1; // Error in LCD
  }
  return 0;
}



#endif
