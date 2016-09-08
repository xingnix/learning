import numpy as np
N=10
#data1=np.random.rand(N,1)
data1=np.matrix(range(N)).transpose()*1.0/N
#target1=np.sin(data1)
target1=data1
k=2
def rbf(data):
	sigma=np.ones((data.shape[0]));
	f=np.zeros((data.shape[0],data.shape[0]/k))
	for i in range(data.shape[0]):
		for j in range(data.shape[0]/k):
			f[i,j]= np.exp(-np.sum((data[i,:]-data[2*j,:])**2)/2/sigma[i]**2)
	return f
def rbfregress(data,target):
	f=np.matrix(np.hstack((rbf(np.array(data)),np.ones((data.shape[0],1)))))
	print f
	w=np.matrix(np.zeros((f.shape[1],1)))
	for i in range(10000):
	    dw=0.02*f.transpose()*(np.matrix(target)-f*w)
	    if np.linalg.norm(dw)<0.0001:
	        break
	    w=w+dw
	    e=np.matrix(target)-f*w
#	    print   sum(np.array(e)**2)
        return w


def train(data,target):
        return rbfregress(data,target)


def test(data,target,w):
	for t in range(10):
		x=1.0*t/10
		sigma=np.ones((data.shape[0]/k));
		f= np.matrix(np.exp(-np.sum(np.array(data[::k,:]-x)**2,1)/2/sigma**2))
	        o=np.hstack((f,[[1]]))*w
		print x,o




print "data is"
print np.hstack((data1,target1))
w=train(data1,target1)
print "radial basis function  performance in test set"
test(data1,target1,w)
