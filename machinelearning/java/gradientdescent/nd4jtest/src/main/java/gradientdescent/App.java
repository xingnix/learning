package gradientdescent;

import org.nd4j.linalg.api.ndarray.INDArray;
import org.nd4j.linalg.factory.Nd4j;

import java.util.ArrayList;

/**
 * Java demo for gradient descent algorithm
 *
 */
class Quadratic{
    private   INDArray W;
    private   INDArray b;

    Quadratic(INDArray W,INDArray b) {
        this.W = W;
        this.b=b;
    }

    INDArray gradient(INDArray X){
        return X.sub(b).transpose().mmul(W);
    }
    INDArray f(INDArray X){
        return X.sub(b).transpose().mmul(W).mmul(X.sub(b));
    }
}
public class App 
{
    public static void main( String[] args ) {

        INDArray W = Nd4j.create(new double[]{1, 0, 0, 1}, new int[]{2, 2});
        INDArray b = Nd4j.create(new double[]{1, 1}, new int[]{2, 1});
        Quadratic M = new Quadratic(W,b);
        ArrayList<INDArray> X = new ArrayList<INDArray>();
        X.add(Nd4j.create(new double[]{0,3},new int[]{2,1}));
        double eta=0.5,eps=0.001;
        for (int i = 0; i < 100; i++) {
            INDArray x=X.get(i);
            INDArray y=x.sub(M.gradient(x).mul(eta));
            if(x.sub(y).norm2(0).getDouble(0,0)<eps) break;
            X.add(y);
        }
        System.out.println(X);
        /*
        for (INDArray x:X) {
            System.out.println(x);
        }
        //*/
    }
}
