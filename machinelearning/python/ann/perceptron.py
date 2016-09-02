import numpy as np

def gradient_descent_linear_perceptron(training_examples,eta):
	length=len(training_examples[0][0])
	w=np.random.random(length)-0.5
	for n in range(100):
		dw=np.zeros(length)
		e=0
		for (x,t) in training_examples:
			o=sum(w*x)
			e+=(t-o)**2
			dw+=eta*(t-o)*np.array(x)
		wnew=w+dw
		if np.linalg.norm(wnew-w)<0.001 :
		   break 
		w=wnew
		print(w)
training_examples=[([1,1,1],1),([-1,-1,1],-1),([1,-1,1],-1),([-1,1,1],-1)]
#print("gradient descent method for linear perceptron ")
#gradient_descent_linear_perceptron(training_examples,0.1)



def gradient_descent_sigmoid(training_examples,eta):
	length=len(training_examples[0][0])
	w=np.random.random(length)-0.5
	for n in range(100):
		dw=np.zeros(length)
		e=0
		for (x,t) in training_examples:
			o=1/(1+np.exp(-sum(w*x)))
			e+=(t-o)**2
			dw+=eta*(t-o)*o*(1-o)*np.array(x)
			# dw+=eta*(t-o)*np.array(x)   #maximum likelihood
		wnew=w+dw
		if np.linalg.norm(wnew-w)<0.001 :
		   break 
		w=wnew
		print(w)
training_examples=[([1,1,1],1),([-1,-1,1],0),([1,-1,1],0),([-1,1,1],0)]
print("gradient descent method for sigmoid perceptron ")
gradient_descent_sigmoid(training_examples,0.1)



def gradient_descent_sigmoid_like(training_examples,eta):
	length=len(training_examples[0][0])
	w=np.random.random(length)-0.5
	for n in range(100):
		dw=np.zeros(length)
		e=0
		for (x,t) in training_examples:
			o1=1/(1+np.exp(-sum(w*x)))
			o2=2*(o1-0.5)
			e+=(t-o2)**2
			dw+=eta*(t-o2)*o1*(1-o1)*np.array(x)
		wnew=w+dw
		if np.linalg.norm(wnew-w)<0.001 :
		   break 
		w=wnew
		print(w)
training_examples=[([1,1,1],1),([-1,-1,1],-1),([1,-1,1],-1),([-1,1,1],-1)]
#print("gradient descent method for sigmoid like perceptron ")
#gradient_descent_sigmoid_like(training_examples,0.1)
