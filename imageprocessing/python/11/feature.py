import matplotlib.pyplot as plt
import numpy as np
import cv2
from skimage import io,color,data,filters,exposure,util,transform,measure

#plt.switch_backend('qt5agg')

def hu():
    im=data.coins()[220:,:]
    l=measure.label(im>100)
    [measure.moments_hu(l==i) for i in range(np.max(l))]

def pca():
    im=data.coins();
    l=measure.label(im>120);
    s=[]
    for i in range(1,l.max()):
        t=np.int8(l==i)
        if np.sum(t)>50 :
            x,y=np.nonzero(t)
            x1,x2,y1,y2=min(x),max(x),min(y),max(y)
            if np.abs((x2-x1)-(y2-y1))<10:
                s.append(transform.resize(im[x1:(x2+1),y1:(y2+1)],(50,50)))

    x=np.zeros((2500,len(s)))
    for i in range(len(s)):
        x[:,i]=np.reshape(s[i],2500)-s[i].mean()
        
    xx=x.dot(x.T)
    w,v=np.linalg.eig(xx)
    
    f=[]
    for i in range(len(s)):
        f.append(v[:,1:50].T.dot(np.reshape(s[i]-s[i].mean(),2500)))
    
    io.imsave('original.png',s[20])
    
    m=np.abs(np.reshape(v[:,0],(50,50)))
    io.imsave('maxeigen.png',np.uint8(m/m.max()*255))
    result=(np.uint8(100+300*np.reshape(np.abs(v[:,1:50].dot(f[20])),(50,50))))
    io.imsave('pca.png',result)