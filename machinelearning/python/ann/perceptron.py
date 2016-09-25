import numpy as np
import sys

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
		precision=correct(training_examples,w,'+-')
		print "precision: ", np.int(precision*100) , "%"
		if np.linalg.norm(wnew-w)<0.001 or precision==1:
		   break 
		w=wnew


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
		precision=correct(training_examples,w,'01')
		print "precision: ", np.int(precision*100) , "%"
		if np.linalg.norm(wnew-w)<0.001 or precision==1:
		   break 
		w=wnew

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
		precision=correct(training_examples,w,'+-')
		print "precision: ", np.int(precision*100) , "%"
		if np.linalg.norm(wnew-w)<0.001 or precision==1:
		   break 
		w=wnew
		

def correct(training_examples,w,flag):
	if flag=='+-':
 	    return sum(map(lambda xt : 1.0 if (w.dot(xt[0])*xt[1])>0 else 0, 
  			    training_examples))/len(training_examples)
	elif flag=='01':
 	    return sum(map(lambda xt:1.0 if np.abs(1/(1+np.exp(-w.dot(xt[0])))-xt[1])<0.5 else 0, 
 			    training_examples))/len(training_examples)
		    


def run_linear():
    training_examples=[([1,1,1],1),([-1,-1,1],-1),([1,-1,1],-1),([-1,1,1],-1)]
    print("gradient descent method for linear perceptron ")
    gradient_descent_linear_perceptron(training_examples,0.1)

def run_sigmoid():
    training_examples=[([1,1,1],1),([-1,-1,1],0),([1,-1,1],0),([-1,1,1],0)]
    print("gradient descent method for sigmoid perceptron ")
    gradient_descent_sigmoid(training_examples,0.1)

def run_sigmoid_like():
    training_examples=[([1,1,1],1),([-1,-1,1],-1),([1,-1,1],-1),([-1,1,1],-1)]
    print("gradient descent method for sigmoid like perceptron ")
    gradient_descent_sigmoid_like(training_examples,0.1)
 
def usage():
    print "usage: \n python  perception.py  <arg> \n  arg:  linear, sigmoid, sigmoid_like"

if len(sys.argv)==2:
      if sys.argv[1]=='linear' :
          run_linear()
      elif sys.argv[1]=='sigmoid':
          run_sigmoid()
      elif sys.argv[1]=='sigmoid_like':
          run_sigmoid_like()
      else:
          usage()
else:
      usage()
