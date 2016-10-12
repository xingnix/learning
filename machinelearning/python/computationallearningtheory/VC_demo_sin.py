import numpy as np
import time
"""
A demo for VC dimension of Sin/Cos function for 1D data classification problem.

The coordinates of x is choosen by using production of prime numbers which can divide peroid of sine or cosine function if they are in set "1" otherwise the remainder will make the value of function less than 1 and they can be classified into category "0"

Binary form of numbers can be used to help select prime numbers to represent the group of category "1".
In the binary of number "m", '1' in a bit means  the corresponding coordinate consists m'th prime number. e.g. 0b110 (6) means the x[1],x[2] consist of the 6th prime number as its componelts of the production.
"""
print "start..."
N=30000
n=5
print "data number = " , n
print "prepare prime numbers... "
prim=[2,3]+filter(lambda r:min(map(lambda x: r%x,range(2,int(np.sqrt(r)+1))))!=0,range(4,N))
print "compute axis..."
x=[[] for i in range(n)]
for i in range(0,2**n):
	b=bin(i)[2:]
	for j in range(0,len(b)):
		if(b[-j-1]=='1'):
			x[j].append(long(prim[i]))
index=[reduce(lambda m,n: m*n,i) for i in x]

print "random test..."
for i in range(5):
    data=(np.random.randint(0,2,n)-0.5)*2
    period=long(prim[int(sum(np.double(data==1)*2**np.array(range(len(data)))))])
    print "result  ", i  , "  :"
    result=np.sign(np.cos(np.array([i%period for i in index])/np.double(period) *2*np.pi)-1+np.spacing(1))
    s="sign(cos("+str(period)+"*x*2*pi))="
    print " "*(len(s)-len("x_i="))+"x_i=",index
    print " "*(len(s)-len("y_i="))+"y_i=",data
    print s,result
    print "  ^.^  "*5 +" Correct! :)"   if np.sum(np.abs(result-data))==0 else " Wrong  !  :(  "*3
    time.sleep(1.0)
