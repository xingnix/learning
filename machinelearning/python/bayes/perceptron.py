import numpy as np
import re

def gradient_descent_linear_perceptron(training_examples,eta):
        length=len(training_examples[0][0])
        w=np.random.random(length)-0.5
        for n in range(100):
                dw=np.zeros(length)
                e=0
                for (x,d) in training_examples:
                        # h=sum(w*x)
                        h=1/(1+np.exp(-sum(w*x)))
                        e+=(d-h)**2
                        dw+=eta*(d-h)/h/(1-h)*np.array(x)
                wnew=w+dw
                if np.linalg.norm(wnew-w)<0.001 :
                   break 
                w=wnew
                print(re.sub('[\[\]]','',str(w)))
training_examples=[([1,1,1],1),([-1,-1,1],0),([1,-1,1],0),([-1,1,1],0)]
#print("gradient descent method for linear perceptron ")
gradient_descent_linear_perceptron(training_examples,0.1)



def gradient_descent_sigmoid(training_examples,eta):
        length=len(training_examples[0][0])
        w=np.random.random(length)-0.5
        for n in range(100):
                dw=np.zeros(length)
                e=0
                for (x,d) in training_examples:
                        h=1/(1+np.exp(-sum(w*x)))
                        e+=(d-h)**2
                        dw+=eta*(d-h)*np.array(x)
                wnew=w+dw
                if np.linalg.norm(wnew-w)<0.001 :
                   break 
                w=wnew
                print(w)
training_examples=[([1,1,1],1),([-1,-1,1],0),([1,-1,1],0),([-1,1,1],0)]
#print("gradient descent method for sigmoid perceptron ")
#gradient_descent_sigmoid(training_examples,0.1)


