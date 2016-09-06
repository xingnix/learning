//============================================================================
// Name        : armadillo_example.cpp
// Author      : Xing Chao
// Version     : 0
// Copyright   : GPL3
// Description : Gradient Descent Algorithm for Quadratic Form
//============================================================================

#include <iostream>
#include <armadillo>

using namespace std;
class quadratic_form {
public:
	arma::mat w;
	arma::mat b;
	arma::mat f(arma::mat x) {
		//arma::mat tmp= (x.t() * w * x);
		//return tmp(0,0);
		//return arma::mat(x.t() * w * x)(0,0);
		return x.t() * w * x;

	}
	arma::mat g(arma::mat x) {
		return w * (w * x - b);
	}
	quadratic_form(arma::mat w, arma::mat b) :
			w(w), b(b) {
	}
};

int main() {
	auto N = 1000;
	arma::mat w={{1,0},{0,1}};
	arma::mat b={1,1};
	b=b.t();
	auto m = quadratic_form(w,b);
	arma::mat x(2,N);
	for (auto i = 1; i < 100; i++) {
		std::cout << x.col(i-1).t() << std::endl;
		x.col(i) = x.col(i - 1) -  0.1*m.g(x.col(i - 1)) ;
		if (arma::norm(x.col(i) - x.col(i - 1),2) < 0.01)
			break;
	}
	return 0;
}
//g++ gradient_descent_quadratic_form_armadillo.cpp -larmadillo --std=c++11
