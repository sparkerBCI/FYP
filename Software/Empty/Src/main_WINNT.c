//     $Date: 2019-02-04 00:04:29 +1100 (Mon, 04 Feb 2019) $
// $Revision: 1589 $
//   $Author: Peter $

// Assignment 2 WINNT main entry point

#include "Ass-02.h"

int main(void)
{
  // STEPIEN: Set the buffer sizes to 1 
  //
  setvbuf(stdin, NULL, _IONBF, 0);
  setvbuf(stdout, NULL, _IONBF, 0);
  setvbuf(stderr, NULL, _IONBF, 0);

  Ass_02_Main();
}
