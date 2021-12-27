import numpy as np

N=100
s=2
x=np.random.rand(N,s)-0.5
t=np.ones(N)
w=np.ones(N)/N
#t[x[:,0]**2+x[:,1]**2<1/8]=-1
t[x[:,0]>0]=-1
t[x[:,1]>0]=-1

def linear_classifier(x,t,w):
    x=np.concatenate((x,np.ones((x.shape[0],1))),axis=1)
    k=np.random.rand(s+1)
    for i in range(1000):
        # simple perceptron
        #E=np.exp(-(w*t).dot(np.sign(x.dot(k))))
        #dk= -E * (w * t ).dot(np.sign(x))
        # sigmoid
        o1 = 1 / (1 + np.exp(-(x.dot(k))))
        o2 = 2 * (o1 - 0.5)
        dk = 5 * len(w) * x.transpose().dot(np.diag(w)).dot(o1 * (1 - o1) * (o2 - t))

        k-=0.1*dk
    def y(x):
        return np.sign(x.dot(k[:-1])+k[-1])
    return y

def train(weak,x,t):
    N=x.shape[0]
    w=np.ones(N)/N
    Y=[]
    Alpha=[]
    for i in range(3):
        y=weak(x,t,w)
        Y+=[y]
        n=np.sum(w*np.abs(t-y(x))/2)
        p=np.sum(w)-n
        Alpha+=[np.log((p/n))]
        w=w*np.exp(-1/2*Alpha[-1]*t*y(x))
        w=w/sum(w)
    def F(x):
        return np.sign(sum([alpha*y(x) for (y,alpha) in zip(Y,Alpha)]))
    return F
y=train(linear_classifier,x,t)
o=y(x)
#print(np.abs(t-o))
print(np.sum((np.abs(t-o)/2)))