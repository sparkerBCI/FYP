/*
 * svm_predict.h
 *
 *  Created on: Jun 12, 2020
 *      Author: S.Parker
 */

#ifndef INC_SVM_PREDICT_H_
#define INC_SVM_PREDICT_H_

typedef struct Linear_SVM_Model {
	double* weight_vector;
	double offset;
	double scale;
	int dimension;
} Linear_SVM_Model;

double Linear_SVM_Predict(Linear_SVM_Model* model, double* observation);

double* SVM_dot_product(double* Vect_A, double* Vect_B);

#endif /* INC_SVM_PREDICT_H_ */
