import numpy as np
# KNN regress and weighted KNN regress

N=10
data1=np.random.rand(N,1)
target1=np.sin(data1*10)

def regress(data,target,x):
        data=np.hstack((data,np.ones((data.shape[0],1))))
        w=np.zeros((data.shape[1],1))
        for i in range(100):
            dw=0.2*data.transpose()*(target-data*w)
            if np.linalg.norm(dw)<0.001:
                break
            w=w+dw
        return w


def weightedregress(data,target,x):
        data=np.hstack((data,np.ones((data.shape[0],1))))
        x=np.hstack((x,1))
        w=np.zeros((data.shape[1],1))
        for i in range(100):
            weight=np.diag(np.exp(-np.sum(np.array(data-x)**2,1)))
            dw=0.2*data.transpose()*weight*(target-data*w)
            if np.linalg.norm(dw)<0.001:
                break
            w=w+dw
        return w


def train(data,target,k,f=regress):
        for x in data:
                index=sorted(range(data.shape[0]),key=lambda i:np.linalg.norm(data[i,:]-x))[0:k]
                localdata=data[index,:]
                localtarget=target[index,0].reshape(k,1)
                w=f(np.matrix(localdata),np.matrix(localtarget),x)
                print (x,np.matrix([x[0],1])*w)


def test(data,target,k,f=regress):
        for t in range(10):
                x=1.0*t/10
                index=sorted(range(data.shape[0]),key=lambda i:np.linalg.norm(data[i,:]-x))[0:k]
                localdata=data[index,:]
                localtarget=target[index,0].reshape(k,1)
                w=f(np.matrix(localdata),np.matrix(localtarget),x)
                print (x,np.matrix([x,1])*w)




print (" training samples ")
print (" | data | target |")
print (np.hstack((data1,target1)))
print ("regression performance in train set")
print (" | truth | prediction |")
train(data1,target1,3)
print ("regression performance in test set")
print (" | truth | prediction |")
test(data1,target1,3)
print ("weighted regression performance in train set")
print (" | input | prediction |")
train(data1,target1,3,weightedregress)
print ("weighted regression performance in test set")
print (" | input | prediction |")
test(data1,target1,3,weightedregress)
