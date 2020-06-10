/*
 * DCT.h
 *
 *  Created on: Jun 7, 2020
 *      Author: c3256228
 */

#ifndef INC_DCT_H_
#define INC_DCT_H_

int  power_of_two(int i);

static int bit_reverse(int N, int l);

void FFTcore(int Nr, int Nc, double* Ar, int Ldr, double* Ai, int Ldi, char tran, char flag);

void DCT2(int N, double* x);

extern void dct_test(double* z, int m);


#endif /* INC_DCT_H_ */
