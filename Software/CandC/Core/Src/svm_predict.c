/*
 * svm_predict.c
 *
 *  Created on: Jun 12, 2020
 *      Author: Willie
 */

#include "svm_predict.h"

double Linear_SVM_Predict(Linear_SVM_Model* model, double* observation) {
	return (SVM_dot_product(model->weight_vector, observation, model->dimension) + model->offset);
}

double SVM_dot_product(double* Vect_A, double* Vect_B, int dimension) {
	double sum = 0.0;

	for (int i = 0; i < dimension; i++) {
		sum += (Vect_A[i] * Vect_B[i]);
	}

	return sum;
}
