/*
 * cosine_transform.h
 *
 *  Created on: Feb 4, 2020
 *      Author: Willie
 */

#ifndef COSINE_TRANSFORM_H_
#define COSINE_TRANSFORM_H_

double *r8vec_uniform_01_new ( int n, int *seed );
double *cosine_transform_data ( int n, double d[] );
double *cosine_transform_inverse ( int n, double c[] );
void timestamp ( );



#endif /* COSINE_TRANSFORM_H_ */
