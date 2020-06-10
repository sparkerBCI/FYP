/*
 * DCT.cpp
 *
 *  Created on: Jun 7, 2020
 *      Author: c3256228
 */

#include "DCT.h"
#include <math.h>
#include <stdlib.h>
#include <string.h>

int  power_of_two(int i) {
	int j = 1;
	while (j<i)
		j = j << 1;
	return j;
}



static int bit_reverse(int N, int l) {
	int ans = 0, i;
	for (i = 0; i<l; ++i)
		if (N & (1 << i))    ans |= (1 << l - 1 - i);
	return(ans);
}


void FFTcore(int Nr, int Nc, double* Ar, int Ldr, double* Ai, int Ldi, char tran, char flag) {

	int N, M, d, K = 0, k = 0, l = 1, L = 0;
	double Wr, Wi, C1r, C1i, C2r, C2i, Dr, Di;

	if (tran == 't') {
		d = N = Nc;
		M = Nr;
	}
	else if (tran == 'n') {
		d = N = Nr;
		M = Nc;
	}
	else {
		//("tran can be either 'n' or 't'\n");
		exit(1);
	}

	do
	{
		d /= 2;
		K = 0;
		while (K<N) {
			k = 0;
			while (k<d) {
				int it, Ind1 = K + k, Ind2 = K + k + d;
				Wr = cos(2 * M_PI*k*l / N);
				Wi = (flag == 'f') ? -sin(2 * M_PI*k*l / N) : sin(2 * M_PI*k*l / N);

				for (it = 0; it<M; ++it) {
					int rind1 = (tran == 't') ? Ind1 * Ldr + it : Ind1 + Ldr * it;
					int iind1 = (tran == 't') ? Ind1 * Ldi + it : Ind1 + Ldi * it;
					int rind2 = (tran == 't') ? Ind2 * Ldr + it : Ind2 + Ldr * it;
					int iind2 = (tran == 't') ? Ind2 * Ldi + it : Ind2 + Ldi * it;

					C1r = Ar[rind1] + Ar[rind2];
					C1i = Ai[iind1] + Ai[iind2];
					Dr = Ar[rind1] - Ar[rind2];
					Di = Ai[iind1] - Ai[iind2];
					C2r = Dr * Wr - Di * Wi;
					C2i = Dr * Wi + Di * Wr;
					Ar[rind1] = C1r;
					Ai[iind1] = C1i;
					Ar[rind2] = C2r;
					Ai[iind2] = C2i;
				}
				++k;
			}
			K += 2 * d;
		}
		l *= 2;
		++L;
	} while (d>1);

	for (d = 0; d<N; ++d) {
		k = bit_reverse(d, L);
		if (d < k) {
			int it;
			for (it = 0; it<M; ++it) {
				int ind1 = (tran == 't') ? d * Ldr + it : d + Ldr * it;
				int ind2 = (tran == 't') ? k * Ldr + it : k + Ldr * it;
				double temp = Ar[ind1];
				Ar[ind1] = Ar[ind2];
				Ar[ind2] = temp;

				ind1 = (tran == 't') ? d * Ldi + it : d + Ldi * it;
				ind2 = (tran == 't') ? k * Ldi + it : k + Ldi * it;
				temp = Ai[ind1];
				Ai[ind1] = Ai[ind2];
				Ai[ind2] = temp;
			}
		}
	}
}

void DCT2(int N, double* x) {
	double* Ar = (double*)malloc(4 * N * sizeof(double));
	//assert(Ar != NULL);
	double* Ai = Ar + 2 * N;
	memset(Ar, 0, 4 * N * sizeof(double));
	int n;
	for (n = 0; n<N; ++n) Ar[n] = x[n];
	for (n = N; n<2 * N; ++n) Ar[n] = x[2 * N - 1 - n];
	FFTcore(2 * N, 1, Ar, 2 * n, Ai, 2 * n, 'n', 'f');
	double g = M_PI / (2 * N), p = sqrt(2.0 / N), po = sqrt(1.0 / N);
	for (n = 0; n<N; ++n) {
		double z = (Ar[n] * cos(n*g) + Ai[n] * sin(n*g)) / 2;
		if (n == 0) x[n] = po * z;
		else     x[n] = p * z;
	}
	free(Ar);
}


extern void dct_test(double * z, long * data, int m) {

	int i;
	for (i = 0; i < m; ++i) z[i] =  data[i];

	DCT2(m, z);
}
