import numpy as np
import time



def q():
    #    0         1             2
    #    3         4             5
    #
    P=np.array([[0,1,2],
                [3,4,5]])
    R=np.array([[-1,0,-1,0, -1,-1],
                [0,-1,100, -1,0,-1],
                [-1,-1,0,-1,-1,-1 ],
                [0, -1, -1,-1, 0,-1],
                [-1,0,-1,0,-1,0],
                [-1,-1, 100,-1, 0,-1]])
    Q=np.zeros((6,6))
    sink=2
    Gamma=0.9
    episodes=20
    for episode in range(episodes):
            print ("\n"+"="*20 +   "   episode " + str(episode) +"  "+ "="*20 +"\n")
            s=int(np.random.random()*5)
            while s!=sink:
                 f=(R[s,:]+1).nonzero()[0]
                 n=f[int(np.random.random()*len(f))]
                 Q[s,n]=R[s,n]+Gamma*max(Q[n,R[n,:]>=0])
                 print ("\n", s, "   to   ",n,  "\n")
                 prettyview(Q,P,s,n)
                 time.sleep(1.0)
                 s=n

def prettyview(Q,P,s=None,n=None):
        def pad(s):
                width=16
                pad=((width-len(s))/2)
                return " "*int(pad)+s+" "*int(pad)
        def indicator(i1,j1,i2,j2):
                if(s==None and n==None):
                        return ""
                if P[i1,j1]==s and P[i2,j2]==n :
                    if j1<j2:
                         return " > "
                    elif i1<i2 :
                         return " v "
                elif P[i1,j1]==n and P[i2,j2]==s :
                    if j1<j2:
                         return " < "
                    elif i1<i2 :
                         return " ^ "
                else:
                    return ""
        I,J=P.shape
        for i in range(I):
                output=""
                for j in range(J):
                        if P[i,j]==s :
                            output+=pad("[["+str(P[i,j])+"]]")
                        elif P[i,j]==n:
                            output+=pad("(("+str(P[i,j])+"))")
                        else:
                            output+=pad(""+str(P[i,j])+"")
                        if (j!= J-1):
                                f=indicator(i,j,i,j+1)
                                output+=pad(f+str(Q[P[i,j],P[i,j+1]])+"/"+str(Q[P[i,j+1],P[i,j]])+f)
                print (output)
                output=""
                if (i!= I-1):
                        for j in range(J):
                                f=indicator(i,j,i+1,j)
                                output+=pad(f+str(Q[P[i,j],P[i+1,j]])+"/"+str(Q[P[i+1,j],P[i,j]])+f)
                                if(j != J-1):
                                        output+=pad("")
                        print (output)


q()
