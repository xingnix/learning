import numpy as np

def createnetwork(n_in,n_out,n_hidden):
	return [{"w":np.random.random((n_hidden,n_in+1))-0.5,
	 	    "o":np.zeros(n_hidden),
		    "delta":np.zeros(n_hidden)},
	          {"w":np.random.random((n_out,n_hidden+1))-0.5,
		    "o":np.zeros(n_out),
		    "delta":np.zeros(n_out)}]

def forward(L,x):
	def sigmoid(y):
		return 1.0/(1.0+np.exp(-y))
	L[0]['o']=sigmoid(L[0]['w'].dot(x))
	L[1]['o']=sigmoid(L[1]['w'][:,:-1].dot(L[0]['o'])+L[1]['w'][:,-1])
	return L[1]['o']

def backpropogation(training_examples,eta,n_in,n_out,n_hidden):
	L=createnetwork(n_in,n_out,n_hidden)
	for n in range(1000):
		for (x,t) in training_examples:
			o=forward(L,x)
			L[1]['delta']=o*(1-o)*(t-o)
			L[0]['delta']=L[0]['o']*(1-L[0]['o'])*L[1]['delta'].dot(L[1]['w'][:,:-1])
			L[1]['w'][:,:-1]+=eta*np.outer(L[1]['delta'],L[0]['o'])
			L[1]['w'][:,-1]+=eta*L[1]['delta']
			L[0]['w']+=eta*np.outer(L[0]['delta'],x)
	for (x,t) in training_examples:
#		print(map(round,L[0]['o']))
		print(x,t,int(round(forward(L,x)[0])))
training_examples=[([1,1,1],1),([-1,-1,1],0),([1,-1,1],0),([-1,1,1],0)]
#backpropogation(training_examples,0.1,2,1,3)
training_examples=[([1,1,1],0),([-1,-1,1],0),([1,-1,1],1),([-1,1,1],1)]
#backpropogation(training_examples,0.5,2,1,2)

a=np.eye(8)
b=np.ones((8,9))
b[:,:-1]=a
training_examples=[]
for i in range(8):
    training_examples.append((b[i,:],a[i,:]))
backpropogation(training_examples,0.5,8,8,3)
