/*        $Id: Ass-02-Q02.c 1592 2019-02-05 14:38:48Z Peter $
 *  $Revision: 1592 $
 *      $Date: 2019-02-06 01:38:48 +1100 (Wed, 06 Feb 2019) $
 *    $Author: Peter $
 */

#include "Ass-02.h"



//
// REPLACE THE EXAMPLE CODE WITH YOUR CODE
//

void
CalculatorInit (void)
{

	// STEPIEN: Assume horizontal display

	// Initialize and turn on LCD and calibrate the touch panel
	BSP_LCD_Init ();
	BSP_LCD_DisplayOn ();
	BSP_TP_Init ();


}





void
CalculatorProcess (void)
{
	// STEPIEN: Assume horizontal display



	if (BSP_TP_GetDisplayPoint (&display) == 0)
	{
		printf("Screen Pressed!\n");
	}
	else
	{

	}

}
