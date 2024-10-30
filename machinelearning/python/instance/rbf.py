import numpy as np
#  RBF kernel regression
# half of the samples are selected to construct basis

N=10
#data1=np.random.rand(N,1)
data1=np.array(range(N)).reshape(N,1)*1.0/N
print(data1.reshape([10,1,1]).shape)
#target1=np.sin(data1)
target1=data1
k=2
base=data1[::k,:]

def rbfkernel(data,base):
        sigma=np.ones((data.shape[0]));
        f=np.zeros((data.shape[0],base.shape[0]))
        for i in range(data.shape[0]):
                for j in range(base.shape[0]):
                        f[i,j]= np.exp(-np.sum((data[i,:]-base[j,:])**2)/2/sigma[i]**2)
        #using broadcast
        #d1=data.reshape([data.shape[0]]+[1]+list(data.shape)[1:])
        #b1=base.reshape([1]+list(base.shape))
        #f1= np.exp(-np.sum((d1-b1)**2,2)/2/sigma.reshape([-1,1])**2)
        #print(np.sum(f1-f))
        return f
def train(data,target,base):
        f=np.matrix(np.hstack((rbfkernel(data,base),np.ones((data.shape[0],1)))))
#        print (f)
        w=np.matrix(np.zeros((f.shape[1],1)))
        for i in range(10000):
            dw=0.02*f.transpose()*(np.matrix(target)-f*w)
            if np.linalg.norm(dw)<0.0001:
                break
            w=w+dw
            e=np.matrix(target)-f*w
#            print   sum(np.array(e)**2)
        return w


def predict(base,w):
        for t in range(10):
                x=1.0*t/10
                sigma=np.ones(base.shape[0]);
                f= np.matrix(np.exp(-np.sum(np.array(base-x)**2,1)/2/sigma**2))
                o=np.hstack((f,[[1]]))*w
                print (x,o)




print ("data is")
print("| input  |  target |")
print (np.hstack((data1,target1)))
w=train(data1,target1,base)
print ("radial basis function  performance in test set")
print("| input  |  predict |")
predict(base,w)
