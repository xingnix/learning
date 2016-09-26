import org.apache.commons.math3.linear.MatrixUtils;
import org.apache.commons.math3.linear.RealMatrix;

import java.util.ArrayList;

/**
 *  test matrix tools in apache commons math
 * Created by xing on 9/6/16.
 */

class Quadratic{
    private   RealMatrix W;
    private   RealMatrix b;

    Quadratic(RealMatrix W,RealMatrix b) {
        this.W = W;
        this.b=b;
    }

    RealMatrix gradient(RealMatrix X){
        return X.subtract(b).transpose().multiply(W);
    }
    RealMatrix f(RealMatrix X){
        return X.subtract(b).transpose().multiply(W).multiply(X.subtract(b));
    }
}


public class GradientDescent {
    public static void main(String[] args) {
        //matrixtest();
        RealMatrix W = MatrixUtils.createRealMatrix(new double[][]{{1, 0},{0,1}});
        RealMatrix b = MatrixUtils.createRealMatrix(new double[][]{{1},{1}});
        Quadratic M = new Quadratic(W,b);
        ArrayList<RealMatrix> X = new ArrayList<>();
        X.add(MatrixUtils.createRealMatrix(new double[][]{{0},{3}}));
        double eta=0.5,eps=0.001;
        for (int i = 0; i < 100; i++) {
            RealMatrix x=X.get(i);
            RealMatrix y=x.subtract(M.gradient(x).scalarMultiply(eta).transpose());
            if(x.subtract(y).getNorm()<eps) break;
            X.add(y);
        }
        System.out.println(X);
        /*
        for (RealMatrix x:X) {
            System.out.println(x);
        }
        //*/

    }

    // below is the first time test code for learning apache common math library
    // which is no use for gradient descent algorithm
    private static void matrixtest() {
        double[][] testData = {
                { 1.0, 2.0, 3.0},
                { 2.0, 5.0, 3.0},
                { 1.0, 0.0, 8.0}
        };

        RealMatrix a = MatrixUtils.createRealMatrix(testData);
        RealMatrix b = MatrixUtils.createRealMatrix(new double[][] {
                { 1, 0 }, { 2, -5 }, { 3, 1 }
        });
        System.out.println("a="+a);
        System.out.println("b="+b);
        System.out.println("a*b="+a.multiply(b));
        System.out.println("inverse(a)="+MatrixUtils.inverse(a));
        System.out.println("I="+a.multiply(MatrixUtils.inverse(a)));
    }

}
