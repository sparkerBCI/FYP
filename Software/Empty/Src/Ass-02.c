/*        $Id: Ass-02.c 1592 2019-02-05 14:38:48Z Peter $
 *  $Revision: 1592 $
 *      $Date: 2019-02-06 01:38:48 +1100 (Wed, 06 Feb 2019) $
 *    $Author: Peter $
 */

#include "Ass-02.h"
//
// REPLACE THE EXAMPLE CODE WITH YOUR CODE 
//

void
Ass_02_Main (void)
{

#ifdef STM32F407xx
  uint16_t i = 0;
#endif

  // Initialise
  CommandLineParserInit ();
#ifdef STM32F407xx
  CalculatorInit ();
#endif

  // Loop indefinitely
  while (1)
  {
    CommandLineParserProcess ();
#ifdef STM32F407xx
    CalculatorProcess ();
#endif

#ifdef STM32F407xx
    if (i++ > 10000)
    {
      HAL_GPIO_TogglePin (GPIOD, LD3_Pin); // Toggle LED3
      i = 0;
    }
#endif
  }
}
