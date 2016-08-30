import numpy as np
class model:
    def __init__ (self, samples, target):
	self.samples=samples
	self.target=target
    def f(self,x):
	return np.transpose(self.samples*x-self.target)*(self.samples*x-self.target)

    def gradient(self,x):
	return 2*np.transpose(self.samples)*(self.samples*x-self.target)
samples=np.matrix([[1,0],[0.9,0],[0,1],[0.1,1]])
target=np.matrix([[1],[1],[0],[0]])
m=model(samples,target)
x=np.matrix([[0],[0]]);
for i in range(1000):
#        print x[:,-1]
	x=np.hstack((x,x[:,-1]-m.gradient(x[:,-1])*0.1))
	if np.linalg.norm(x[:,-1]-x[:,-2])<0.0001:
	     break
direct=(np.transpose(samples)*samples)**-1*np.transpose(samples)*target

def surface(x_interval,y_interval,resolution):
	for i in range(resolution):
		s=' '
		for j in range(resolution):
			x=x_interval[0]+1.0*i*(x_interval[1]-x_interval[0])/resolution
			y=y_interval[0]+1.0*j*(y_interval[1]-y_interval[0])/resolution
			s=s+str( m.f(np.matrix([[x],[y]]))[0,0])+' '
		print s
surface([-2,2],[-2,2],100)
