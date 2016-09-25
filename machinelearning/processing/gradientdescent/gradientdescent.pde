

class Quadratic{
    private   double[][] W;
    private   double[] b;
    Quadratic(double[][] W,double[] b) {
        this.W = W;
        this.b=b;
    }
    double[] gradient(double[] X){
        double[] r=new double[X.length];
        for(int j=0;j<W[0].length;j++){
          for(int i=0;i<X.length;i++){
              r[j]+=(X[i]-b[i])*W[i][j];
          }
        }
        return r;
    }
    double f(double[] X){
      double r=0;
      for(int i=0;i<W.length;i++){
        for(int j=0;j<W[0].length;j++){
        r+=(X[i]-b[i])*W[i][j]*(X[j]-b[j]);
        }
      }
      return r;
    }
   double[] gradientdescent(double[] x,double eta){
    double[] r=new double[x.length];
    double[] g=gradient(x);
    for(int i=0;i<x.length;i++){
      r[i]=x[i]-eta*g[i];
    }
    return r;
  }
}

Quadratic M;
ArrayList<double[]> X;
PImage f;
float s=100;
float p=250;
int flag=0;      
int j=0;
double eta=0.35;

void setup(){
  size(500,500);
     double[][] W = new double[][]{{1, 0},{0,5}};
        double[] b = new double[]{0,0};
        Quadratic M = new Quadratic(W,b);
        X = new ArrayList<double[]>();
        //X.add(new double[]{0,3});
        X.add(new double[]{random(600)/100-3,random(600)/100-3});
        print(X.get(0)[0],X.get(0)[1],'\n');
      for (int i = 0; i < 100; i++) {
            double[] x=X.get(i);
            double[] y=M.gradientdescent(x,eta);
            X.add(y);
      }
        
      for(int i=1;i<X.size();i++){
        line((float)X.get(i-1)[0],(float)X.get(i-1)[1],(float)X.get(i)[0],(float)X.get(i)[1]);
      }
      f=createImage(width, height, RGB);
      for(int i=0;i<width;i++){
        for(int j=0;j<height;j++){
            f.set(i,j,color(255-(int)M.f(new double[]{((double)i-p)/s,((double)j-p)/s})*15));
        }
      }
      //set(0,0,f);
      image(f,0,0);
}
void draw(){
      j++;
      if(j==X.size()){
      setup();
      flag=255-flag;
        j=1;
      }
      stroke(color(flag,255-flag,0));
      int i=j;
      //for(int i=1;i<X.size();i++){
        line((float)(X.get(i-1)[0])*s+p,(float)(X.get(i-1)[1])*s+p,(float)(X.get(i)[0])*s+p,(float)(X.get(i)[1])*s+p);
      //}
      //*/
}