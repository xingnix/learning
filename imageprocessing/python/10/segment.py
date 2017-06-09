import matplotlib.pyplot as plt
import numpy as np
import cv2
from skimage import io,color,data,filters,exposure,util,transform

#plt.switch_backend('qt5agg')


def otsu():
    im=data.coins()

    f=np.zeros(255)
    minf=0
    mini=0
    for i in range(100,200):
        c1=im[im<=i]
        c2=im[im>i]
        m1=np.mean(c1)
        m2=np.mean(c2)
        std1=np.std(c1)
        std2=np.std(c2)
        std3=np.std([m1,m2])
        f[i]=std3/(1+std1*std2)
        if f[i] > minf :
            minf=std3
            mini=i
    
    io.imsave('coins.png',im)
    io.imsave('coins-otsu.png',np.uint8(im>mini)*255)

def line_detect():
    im=data.text()
    seg=im<100
    r=transform.radon(seg)
    rho,theta=np.unravel_index(np.argmax(r),r.shape)
    rho=rho-r.shape[0]/2
    x=np.int(rho*np.cos((theta+90)*np.pi/180)+im.shape[0]/2)
    y=np.int(rho*np.sin((theta+90)*np.pi/180)+im.shape[1]/2)
    dx=np.cos((theta)*np.pi/180)
    dy=np.sin((theta)*np.pi/180)
    

    l=1000
    res=im.copy()
    cv2.line(res,(np.int(y-dy*l),np.int(x-dx*l)),(np.int(y+dy*l),np.int(x+dx*l)),255,2)
    
    io.imsave('text.png',im)
    io.imsave('text-line.png',res)