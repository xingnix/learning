# linear regression demo
import numpy as np
import os
import sys
import re
if sys.version > '3':
    from functools import reduce
    


class model:
    def __init__ (self, samples, target):
        self.samples=samples
        self.target=target
    def f(self,x):
        return np.transpose(self.samples*x-self.target)*(self.samples*x-self.target)

    def gradient(self,x):
        return 2*np.transpose(self.samples)*(self.samples*x-self.target)

samples=np.matrix([[3,0],[2,0],[0,1],[0.1,1]])
target=np.matrix([[1],[1],[0],[0]])
m=model(samples,target)
direct=(np.transpose(samples)*samples)**-2*np.transpose(samples)*target
def train(m,samples,target):
    x=np.matrix([[1],[1]]);
    for i in range(1000):
         print(reduce(lambda x ,y :
                        str(x)+" "*(30-len(str(x)))+str(y)+" ",
                np.array(x)[:,-1]))
         x=np.hstack((x,x[:,-1]-m.gradient(x[:,-1])*0.05))
         if np.linalg.norm(x[:,-1]-x[:,-2])<0.0001:
             break
    return x


def run_train_file(filename='./train_process.txt'):
   x=train(m,samples,target)
   f=open(filename,'w')
   f.write(re.sub("[\[\]]",' ',re.sub('],',"\n",str(x.transpose().tolist()))))
   f.close()
   os.system("gnuplot -e \"set grid;plot '"+filename+"' using 0:1 w lp , '' using 0:2 w lp ; pause -1\"")
def surface_line_string(x_interval,y_interval,resolution):
        for i in range(resolution):
                s=' '
                for j in range(resolution):
                        x=x_interval[0]+1.0*i*(x_interval[1]-x_interval[0])/resolution
                        y=y_interval[0]+1.0*j*(y_interval[1]-y_interval[0])/resolution
                        s=s+str( m.f(np.matrix([[x],[y]]))[0,0])+' '
                print(s)
def error(m,x_interval,y_interval,resolution,output='./error_surface_index.txt'):
        x,y=np.meshgrid(np.linspace(x_interval[0],x_interval[1],resolution),
                    np.linspace(y_interval[0],y_interval[1],resolution))
        z=np.zeros([resolution,resolution])
        f=open(output,'w')
        for i in range(resolution):
                for j in range(resolution):
                        z[i,j]= m.f(np.matrix([[x[i,j]],[y[i][j]]]))
                        f.write(str(x[i,j])+" "+str(y[i,j])+" "+str(z[i,j])+"\n")
                f.write("\n")
        f.close()
        return z
def run_error_file(filename='./error_surface.txt'):
    z=error(m,[-9,9],[-9,9],50)
    f=open(filename,'w')
    f.write(re.sub("[\[\]]"," ",re.sub('],',"\n",str(z.tolist()))))
    f.close()
    os.system('gnuplot -e \'set grid;splot "'+filename+'" matrix w l; pause -1;\'')

def run_trace_file(filename1='./error_surface_index.txt',filename2='./train_process_index.txt'):
    x_interval=[-1,2]
    y_interval=[-1,2]
    resolution=50
    x,y=np.meshgrid(np.linspace(x_interval[0],x_interval[1],resolution),
                    np.linspace(y_interval[0],y_interval[1],resolution))
    f=open(filename1,'w')
    for i in range(resolution):
        for j in range(resolution):
                z= m.f(np.matrix([[x[i,j]],[y[i][j]]]))
                f.write(str(x[i,j])+" "+str(y[i,j])+" "+str(z[0,0])+"\n")
        f.write("\n")
    f.close()

    x=train(m,samples,target)
    f=open(filename2,'w')
    for i in x.transpose():
       f.write(str(i[0,0])+" "+str(i[0,1])+" "+str(m.f(i.transpose())[0,0]) +" \n")
    f.close()
    os.system('gnuplot -e \'set contour base;set pm3d at bs;set cntrparam levels incremental  0,0.9,8;splot "'+filename1+'" w l, "'+filename2+'" w lp lt rgb "white";pause -1;\'')

def usage():
        print("usage:\n python linearregression.py train \n or \n python linearregression.py errorspace")

if len(sys.argv)==2:
    if sys.argv[1]=='train' :
        run_train_file()
    elif sys.argv[1]=='errorspace':
        run_error_file()
    elif sys.argv[1]=='trace':
        run_trace_file()
    else:
        usage()
else:
    usage()
