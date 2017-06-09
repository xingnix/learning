import matplotlib.pyplot as plt
import numpy as np
from skimage import io,color,data,filters,exposure,util

#plt.switch_backend('qt5agg')

def pseudocolor():
    image=io.imread('timg.jpeg')
    imagergb=image.copy()
    imagergb[:,:,0]=np.interp(image[:,:,0],[0,50,100,150,200,255],[0,0,0,55,155,255])
    imagergb[:,:,1]=np.interp(image[:,:,0],[0,50,100,150,200,255],[0,155,255,155,0,0])
    imagergb[:,:,2]=np.interp(image[:,:,0],[0,50,100,150,200,255],[255,155,55,0,0,0])
    io.imsave('timgcolor.png',imagergb)
    
    #plt.plot(range(256),lutr,'r',np.array(range(256)),lutg,'g',range(256),lutb,'b')
    
    lutr=np.uint8(np.interp(range(256),[0,50,100,150,200,255],[0,0,0,55,155,255]))
    lutg=np.uint8(np.interp(range(256),[0,50,100,150,200,255],[0,155,255,155,0,0]))
    lutb=np.uint8(np.interp(range(256),[0,50,100,150,200,255],[255,155,55,0,0,0]))

    #shuffled gray scale but the rgb image is not affected because look up table is changed
    
    lutgray=np.array(range(256))
    lutshuffle=lutgray.copy()
    np.random.shuffle(lutshuffle)
    shuffledlutr=lutr.copy()
    shuffledlutr[lutshuffle]=lutr
    shuffledlutg=lutg.copy()
    shuffledlutg[lutshuffle]=lutg
    shuffledlutb=lutb.copy()
    shuffledlutb[lutshuffle]=lutb
    
    shuffled=np.uint8(np.interp(image[:,:,0],lutgray,lutshuffle))
    io.imsave('shuffled.png',shuffled)
    
    shuffledrgb=image.copy()
    shuffledrgb[:,:,0]=np.interp(shuffled,lutgray,shuffledlutr)
    shuffledrgb[:,:,1]=np.interp(shuffled,lutgray,shuffledlutg)
    shuffledrgb[:,:,2]=np.interp(shuffled,lutgray,shuffledlutb)


def color_transformation():
    # 彩色变换
    image=data.coffee()
    brighter=np.uint8(image*0.5+255*0.5)
    darker=np.uint8(image*0.5)
    io.imshow(brighter)
    io.show()
    io.imshow(darker)
    io.show()
    
def color_complements():
    # 补色
    image=data.coffee()
    invert=255-image
    io.imshow(invert)
    io.show()

def color_slicing():
    # 彩色分层
    image=io.imread('trafficlight.png')
    segred=image.copy()
    seggreen=image.copy()
    segyellow=image.copy()
    maskred=(image[:,:,0]>100) & (image[:,:,1]<50 ) & (image[:,:,2]<50)
    maskgreen=(image[:,:,0]<100) & (image[:,:,1]>100 ) & (image[:,:,2]<100)
    maskyellow=(image[:,:,0]>100) & (image[:,:,1]>100 ) & (image[:,:,2]<70)
    segred[:,:,0]*=maskred
    segred[:,:,1]*=maskred
    segred[:,:,2]*=maskred
    io.imshow(segred)
    io.imsave('lightred.png',segred)
    io.show()
    seggreen[:,:,0]*=maskgreen
    seggreen[:,:,1]*=maskgreen
    seggreen[:,:,2]*=maskgreen
    io.imshow(seggreen)
    io.imsave('lightgreen.png',seggreen)
    io.show()
    segyellow[:,:,0]*=maskyellow
    segyellow[:,:,1]*=maskyellow
    segyellow[:,:,2]*=maskyellow
    io.imshow(segyellow)
    io.imsave('lightyellow.png',segyellow)
    #io.show()

def ton_and_color_corrections():
    #色调和彩色校正
    image=data.astronaut()
    h1=color.rgb2hsv(image)
    h2=h1.copy()
    h1[:,:,1]=h1[:,:,1]*0.5
    image1=color.hsv2rgb(h1)
    h2[:,:,1]=h2[:,:,1]*0.5+0.5
    image2=color.hsv2rgb(h2)
    io.imshow(image)
    io.imsave('astronaut.png',image)
    io.imshow(image1)
    io.imsave('astronautlight.png',image1)
    io.imshow(image2)
    io.imsave('astronautdark.png',image2)
    
    imagered=image.copy()
    imagered[:,:,0]=image[:,:,0]*127.0/255+128
    io.imsave('astronautred.png',imagered)
    imageblue=image.copy()
    imageblue[:,:,2]=image[:,:,2]*127.0/255+128
    io.imsave('astronautblue.png',imageblue)
    imageyellow=image.copy()
    imageyellow[:,:,0]=image[:,:,0]*127.0/255+128
    imageyellow[:,:,1]=image[:,:,1]*127.0/255+128
    io.imsave('astronautyellow.png',imageyellow)
    io.imshow(imageyellow)

    
def hsi_equalize_hist():
    image=data.astronaut()
    h=color.rgb2hsv(image)
    h[:,:,2]=exposure.equalize_hist(h[:,:,2])
    image_equal=color.hsv2rgb(h)
    io.imshow(image_equal)
    io.imsave('astronautequal.png',image_equal)
    
def smoothe_and_sharp():
    image=data.astronaut()
    g3=filters.gaussian(image,3)
    io.imsave('astronautgaussian3.png',g3)
    g9=filters.gaussian(image,9)
    io.imsave('astronautgaussian9.png',g9)
    g15=filters.gaussian(image,15)
    io.imsave('astronautgaussian15.png',g15)
    
    image=io.imread('astronautgaussian3.png')
    sharprgb=image.copy()
    for i in range(3):
        l=np.abs(filters.laplace(image[:,:,i]))
        sharprgb[:,:,i]=np.uint8(np.minimum(image[:,:,i]+l/l.max()*55,255))
    io.imsave('astronautsharprgb.png',sharprgb)
    
    sharphsv=color.rgb2hsv(image)
    l=np.abs(filters.laplace(sharphsv[:,:,2]))
    sharphsv[:,:,2]=np.minimum(l/l.max()*0.5+sharphsv[:,:,2],1)
    io.imsave('astronautsharphsv.png',color.hsv2rgb(sharphsv))

def color_segment():
        image=data.astronaut()
        r=np.uint8((image[:,:,0]>100 ) & (image[:,:,1]<100) & (image[:,:,2]<100))
        io.imsave('astronautsegr.png',r*255)
        g=np.uint8((image[:,:,0]<100 ) & (image[:,:,1]>100) & (image[:,:,2]<100))
        io.imsave('astronautsegg.png',g*255)
        b=np.uint8((image[:,:,0]<100 ) & (image[:,:,1]<100) & (image[:,:,2]>100))
        io.imsave('astronautsegb.png',b*255)


def color_edge():
        image=data.astronaut()
        r=np.abs(filters.sobel(image[:,:,0]))
        r=np.uint8(r/r.max()*255)
        io.imsave('astronautedger.png',r)
        g=np.abs(filters.sobel(image[:,:,1]))
        g=np.uint8(g/g.max()*255)
        io.imsave('astronautedgeg.png',g)
        b=np.abs(filters.sobel(image[:,:,2]))
        b=np.uint8(b/b.max()*255)
        io.imsave('astronautedgeb.png',b)

def color_noise():
        image=data.astronaut()
        noiseg=util.noise.random_noise(image,'gaussian')

        io.imsave('astronautnoiseg.png',noiseg)
        io.imsave('astronautnoisegr.png',noiseg[:,:,0])
        io.imsave('astronautnoisegg.png',noiseg[:,:,1])
        io.imsave('astronautnoisegb.png',noiseg[:,:,2])

        noiseghsv=color.rgb2hsv(noiseg)        
        io.imsave('astronautnoisegh.png',noiseghsv[:,:,0])
        io.imsave('astronautnoisegs.png',noiseghsv[:,:,1])
        io.imsave('astronautnoisegv.png',noiseghsv[:,:,2])
        
        noisei=util.noise.random_noise(image,'s&p')
        io.imsave('astronautnoisei.png',noisei)
        io.imsave('astronautnoiseir.png',noisei[:,:,0])
        io.imsave('astronautnoiseig.png',noisei[:,:,1])
        io.imsave('astronautnoiseib.png',noisei[:,:,2])

        noiseihsv=color.rgb2hsv(noisei)
        io.imsave('astronautnoiseih.png',noiseihsv[:,:,0])
        io.imsave('astronautnoiseis.png',noiseihsv[:,:,1])
        io.imsave('astronautnoiseiv.png',noiseihsv[:,:,2])
