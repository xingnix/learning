# simulation for a ball bouncing in a box
import numpy as np
class box:
    def __init__(self,w=1,h=1,c=np.array([0,0])):

        self.p=np.array([c,c+[w,0],c+[w,h],c+[0,h]])
        self.seg=[]
        for i in range(4):
            self.seg.append([self.p[i %4 ],self.p[(i+1)%4]])
        self.v=np.array([[0,1],[-1,0],[0,-1],[1,0]])

    def bounce(self,p,v,t=100):
        P=[p]
        V=[v]
        for t in range(t):
            for i in range(4):
                p=P[-1]
                v=V[-1]
                bv=self.v[i]
                # cross point:  (k*(x2-x1)+x1-p) X v = 0
                x1,x2=self.seg[i]
                w=x2-x1
                q=p-x1
                k=(q[0]*v[1]-q[1]*v[0])/(w[0]*v[1]-w[1]*v[0])
                plength=v[0]*bv[0]+v[1]*bv[1]
                if k>=0 and k<=1 and plength<0:
                    P.append(x1+k*(x2-x1))
                    # mirror the vector
                    vert=v-plength*bv
                    V.append(vert-plength*bv)
                    break
        for i in range(t):
            print(P[i],V[i])

b=box()
b.bounce(np.array([0.5,0]),np.array([1,1]))