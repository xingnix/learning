import numpy as np
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
        print x[:,-1]
	x=np.hstack((x,x[:,-1]-m.gradient(x[:,-1])*0.1))
	if np.linalg.norm(x[:,-1]-x[:,-2])<0.0001:
	     break
