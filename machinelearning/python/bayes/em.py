import numpy as np
n1=3
n2=3
n=n1+n2
x1=np.random.randn(n1,1)
x2=np.random.randn(n2,1)+2
x=np.sort(np.vstack((x1,x2)))

k=2
mu=np.random.randn(1,2)
Ez=np.zeros((n,k))

for i in range(1000):
    p=np.exp(-(np.repeat(x,k,axis=1)-np.repeat(mu,n,axis=0))**2)
    Ez=p/np.repeat(np.sum(p,axis=1,keepdims=True),k,axis=1)

    mu=np.sum(Ez*np.repeat(x,k,axis=1),axis=0,keepdims=True)/np.sum(Ez,axis=0,keepdims=True)
