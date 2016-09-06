//============================================================================
// Name        : eigen_example.cpp
// Author      : Xing Chao
// Version     : 0
// Copyright   : GPL3
// Description : Gradient Descent Algorithm for Quadratic Form
//============================================================================

#include <iostream>
#include <eigen3/Eigen/Dense>

using namespace std;
using namespace Eigen;
class quadratic_form {
public:
	Eigen::MatrixXd w;
	Eigen::MatrixXd b;
	double f(Eigen::MatrixXd x) {
		return (x.transpose() * w * x)(0,0);
	}
	Eigen::MatrixXd g(Eigen::MatrixXd x) {
		return w * (w * x - b);
	}
	quadratic_form(Eigen::MatrixXd w, Eigen::MatrixXd b) :
			w(w), b(b) {
	}
};

int main() {
	auto N = 1000;
	Eigen::MatrixXd w(2,2);
	Eigen::MatrixXd b(2, 1);
	w<<1,0,
	   0,1;
	b<<1,
	   1;
	auto m = quadratic_form(w,b);
	Eigen::MatrixXd x(2,N);
	for (auto i = 1; i < 100; i++) {
		std::cout << x.col(i-1).transpose() << std::endl;
		x.col(i) = x.col(i - 1) -  0.1*m.g(x.col(i - 1)) ;
		if ((x.col(i) - x.col(i - 1)).norm() < 0.01)
			break;
	}
	return 0;
}
