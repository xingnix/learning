import numpy as np
import os
class quadraticform:
    def __init__ (self, w, b):
        self.w=w
        self.b=b
    def f(self,x):
        return np.transpose(x-self.b)*self.w*(x-self.b)
    def gradient(self,x):
        return self.w*(x-self.b)

m=quadraticform(np.matrix([[1,0],[0,1]]),np.matrix([[1],[1]]))
x=np.matrix([[0],[0]]);
for i in range(1000):
        print(x[:,-1])
        x=np.hstack((x,x[:,-1]-m.gradient(x[:,-1])*0.1))
        if np.linalg.norm(x[:,-1]-x[:,-2])<0.0001:
             break

def surface(x_interval,y_interval,resolution):
        surf=''
        for i in range(resolution):
                s=' '
                for j in range(resolution):
                        x=x_interval[0]+1.0*i*(x_interval[1]-x_interval[0])/resolution
                        y=y_interval[0]+1.0*j*(y_interval[1]-y_interval[0])/resolution
                        s=s+str( m.f(np.matrix([[x],[y]]))[0,0])+' '
                surf=surf+s+'\n'
        with open('surface.txt','w') as f:
            f.write(surf)
        os.system("gnuplot -e 'set grid;splot \"surface.txt\"  matrix w l; pause -1;'")

surface([-1,1],[-1,1],100)
