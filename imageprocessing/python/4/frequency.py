import matplotlib.pyplot as plt
import numpy as np
from skimage import io,color,data,filters,exposure,util

#plt.switch_backend('qt5agg')


def periodic_noise():
    im=data.coins()
    io.imsave('coins.png',im)
    
    imf=np.fft.fft2(im)
    a=50  # noise frequency
    m=50  # noise amplitude
    imf[0,a]=imf[0,a]*m
    imf[a,0]=imf[a,0]*m
    imf[a,a]=imf[a,a]*m
    imf[imf.shape[0]-a,imf.shape[1]-a]=imf[imf.shape[0]-a,imf.shape[1]-a]*m
    
    im1=np.uint8(np.abs(np.fft.ifft2(imf)))
    io.imsave('coins_periodic_noise.png',im1)
    
    m=0
    imf[0,a]=imf[0,a]*m
    imf[a,0]=imf[a,0]*m
    imf[a,a]=imf[a,a]*m
    imf[imf.shape[0]-a,imf.shape[1]-a]=imf[imf.shape[0]-a,imf.shape[1]-a]*m
    im2=np.uint8(np.abs(np.fft.ifft2(imf)))
    io.imsave('coins_periodic_filted.png',im2)

def only_phase():
    im=data.coins()
    
    imf=np.fft.fft2(im)
    amp=np.abs(imf)
    phase=np.angle(imf)
    
    onlyample=np.uint8(np.abs(np.fft.ifft2(amp)))
    io.imsave('onlyample.png',onlyample)
    onlyphase=np.uint8(np.mean(amp)*np.abs(np.fft.ifft2(np.exp(1j*phase))))
    io.imsave('onlyphase.png',onlyphase)

def shift2(im):
    w,h=im.shape
    w2=np.uint8(w/2)
    h2=np.uint8(h/2)
    im1=np.vstack((im[w2:,:],im[:w2,:]))
    im2=np.hstack((im1[:,h2:],im1[:,:h2]))
    return im2
    
def ringingeffect():
    a=np.zeros((500,500),dtype=np.uint8)
    a[245:255,245:255]=255
    f=np.fft.ifft2(a)
    f[10:490,:]=0
    f[:,10:490]=0
    a1=np.abs(np.fft.ifft2(f))
    a1=np.uint8(a1*255/np.max(a1))
    io.imsave('ringeffect_pulse.png',a)
    io.imsave('ringeffect_ring.png',a1)