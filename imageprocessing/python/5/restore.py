import matplotlib.pyplot as plt
import numpy as np
from skimage import io,color,data,filters,exposure,util

#plt.switch_backend('qt5agg')


def inverse_filter():
    im=data.coins()
    imf=np.fft.fft2(im)

    kernel=np.ones((1,20))
    kernel=kernel/np.sum(kernel)
    kf=np.fft.fft2(kernel,(im.shape[0],im.shape[1]))
    
    g=imf*kf
    im_g=np.uint8(np.abs(np.fft.ifft2(g)))
    h=np.fft.fft2(im_g)/(0.01+kf)
    
    io.imsave('coins.png',im)
    io.imsave('coins-blur.png',im_g)
    io.imsave('coins-deblur.png',np.uint8(np.abs(np.fft.ifft2(h))))
    
    im_gn=np.uint8(util.noise.random_noise(im_g,var=0.00001)*255)
    h=np.fft.fft2(im_gn)/(0.01+kf)
    
    io.imsave('coins-blur-noise.png',im_gn)
    io.imsave('coins-deblur-noise.png',np.uint8(np.abs(np.fft.ifft2(h))))

def wiener_filter():
    im=data.coins()
    imf=np.fft.fft2(im)

    kernel=np.ones((1,20))
    kernel=kernel/np.sum(kernel)
    kf=np.fft.fft2(kernel,(im.shape[0],im.shape[1]))
    
    g=imf*kf
    im_g=np.uint8(np.abs(np.fft.ifft2(g)))
    h=np.fft.fft2(im_g)*np.conj(kf)/(0.001+np.abs(kf)**2)
    
    io.imsave('coins-wiener.png',np.uint8(np.abs(np.fft.ifft2(h))))
    
    im_gn=np.uint8(util.noise.random_noise(im_g,var=0.00001)*255)
    h=np.fft.fft2(im_gn)*np.conj(kf)/(0.001+np.abs(kf)**2)
    
    io.imsave('coins-wiener-noise.png',np.uint8(np.abs(np.fft.ifft2(h))))
    
def geometry_transform():
    im=data.coins()
    imtf=np.zeros(im.shape,dtype=np.uint8)
    x,y=im.shape
    s=y/2
    for i in range(x):
        for j in range(y):
            newj=s+np.sign(j-s)*(np.abs(j-s)/s)**2*s
            if newj>=0 and newj<y:
                imtf[i,j]=im[i,np.int(newj)]
    io.imsave('coins-tf.png',imtf)
    
    iminv=np.zeros(im.shape,dtype=np.uint8)
    for i in range(x):
        for j in range(y):
            newj=s+np.sign(j-s)*np.sqrt(np.abs(j-s)/s)*s
            if newj>=0 and newj<y:
                iminv[i,j]=imtf[i,np.int(newj)]
    io.imsave('coins-inverse-tf.png',iminv)
    
    