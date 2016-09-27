import numpy as np
import os
n=10000
m=10000
bins=50

#---- means of samples from  binominal distribution 
samples=np.sum(np.random.randint(0,2,m*n).reshape((m,n)),0)*1.0/m
s=(samples-0.5)/0.5*np.sqrt(m)
h,b=np.histogram(s,bins=bins)
h=1.0*h/sum(h)
delta=b[1]-b[0]

#-----  samples from normal distribution
g1=np.random.randn(len(s))
h1,b1=np.histogram(g1,bins=bins)
h1=1.0*h1/sum(h1)

#----- probability from density function
g=h*0
f=open("central_tmp.txt","w")
for i in range(len(b)-1):
	g[i]=np.exp(-0.5*(b[i])**2)/np.sqrt(2*np.pi)*delta
	f.write(str(h[i])+" "+str(h1[i])+" "+str(g[i])+"\n")
f.close()
os.system('gnuplot -e \'plot "central_tmp.txt" using ($0):($3) w l lt rgb "red","central_tmp.txt" using ($0):($1) w l lt rgb "green" , "central_tmp.txt" using ($0):($2) w l lt rgb "blue";pause -1;\'')
