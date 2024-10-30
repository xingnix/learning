import numpy as np
# knn demo

N=3
data1=np.hstack((np.vstack((np.random.normal(0,1,3),np.zeros((1,3)))),np.vstack((np.random.normal(1,1,3),np.ones((1,3)))))).transpose()
data2=np.vstack((np.hstack((np.random.normal(0,1,(N,2)),np.zeros((N,1)))),np.hstack((np.random.normal(1,1,(N,2)),np.ones((3,1))))))

def predict(data,x,k):
	return round(1.0*sum(data[sorted(range(data.shape[0]),key=lambda i:np.linalg.norm(data[i,:-1]-x))[0:k],-1])/k)

print ("| input | target |")
print (data1)
print("input=",1,"  predict=",predict(data1,1,3))
print("input=",2,"  predict=",predict(data1,2,3))
print("input=",3,"  predict=",predict(data1,3,3))
print("input=",0,"  predict=",predict(data1,0,3))

print ("| input | target |")
print (data2)
print("input= ", [1,1], " predict= ",predict(data2,np.array([1,1]),3))
print("input= ", [0,0], " predict= ",predict(data2,np.array([0,0]),3))
