import numpy as np



def am(a,x,y):
    I=a.shape[0]
    J=a.shape[1]
    windowsize=3
    Smax=7
    while(windowsize<Smax):
        d=np.int((windowsize-1)/2)
        s=a[max(0,x-d):min(I,x+d+1),max(0,y-d):min(J,y+d+1)]
        zmin=np.min(s)
        zmed=np.median(s)
        zmax=np.max(s)
        zxy=a[x,y]
        A1=zmed-zmin
        A2=zmed-zmax
        if A1 > 0 and A2 < 0:
            B1=zxy-zmin
            B2=zxy-zmax
            if B1 > 0 and B2 < 0:
                return zxy
            else: 
                return zmed
        else:
            windowsize=windowsize+2
    return zmed

a=np.uint8(np.random.rand(9,9)*128+128)
b=a.copy()
print(a)
a=np.float64(a)
I=a.shape[0]
J=a.shape[1]
for i in range(I):
    for j in range(J):
        b[i,j]=am(a,i,j)
print(b)
