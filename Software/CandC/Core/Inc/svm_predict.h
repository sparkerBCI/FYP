/*
 * svm_predict.h
 *
 *  Created on: Jun 12, 2020
 *      Author: S.Parker
 */

#ifndef INC_SVM_PREDICT_H_
#define INC_SVM_PREDICT_H_

#ifndef EPOCH_LENGTH_SAMPLES
  #define EPOCH_LENGTH_SAMPLES 16
#endif

typedef struct Linear_SVM_Model {
	double weight_vector[EPOCH_LENGTH_SAMPLES];
	double offset;
	double scale;
	int dimension;
	int has_vector;
	int complete;
} Linear_SVM_Model;

double Linear_SVM_Predict(Linear_SVM_Model* model, double* observation);

double* SVM_dot_product(double* Vect_A, double* Vect_B);

#endif /* INC_SVM_PREDICT_H_ */
