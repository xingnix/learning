#include <iostream>
#include <eigen3/Eigen/Dense>

using namespace Eigen;
using namespace std;
extern "C" double quadratic( double w[],double x[],double b[],int i){
	Eigen::Map<MatrixXd>mx(x,i,1);
	Eigen::Map<MatrixXd>mb(b,i,1);
	Eigen::Map<MatrixXd>mw(w,i,i);
	return ((mx-mb).transpose()*mw*(mx-mb))(0,0);
}
extern "C" void gradient( double out[],double w[],double x[],double b[],int i){
	Eigen::Map<MatrixXd>mout(out,i,1);
	Eigen::Map<MatrixXd>mx(x,i,1);
	Eigen::Map<MatrixXd>mb(b,i,1);
	Eigen::Map<MatrixXd>mw(w,i,i);
	mout=mw*(mx-mb);
}

extern "C" void multiply(double out[], double x[],double y[],int i, int j, int k){
	Eigen::Map<MatrixXd>mout(out,i,k);
	Eigen::Map<MatrixXd>mx(x,i,j);
	Eigen::Map<MatrixXd>my(y,j,k);
	mout=mx*my;
	//cout << mx <<endl;
	//cout << my <<endl;
	//cout << mout << endl;
}
extern "C" double norm(double x[],int n){
	Eigen::Map<MatrixXd>mx(x,n,1);
	return mx.norm();
}

// only used for test 
int main(){
	double out[2];
	double x[4]={1,0,0,1};
	double y[2]={1,1};
	multiply(out,x,y,2,2,1);
	cout<< out[0] <<' '<<out[1]<<endl;
	cout<< norm(x,4)<<endl;
	return 0;
}

// In order to be invoked by LuaJIT:
// g++ matrix.cpp -fPIC -shared -o matrix.so
