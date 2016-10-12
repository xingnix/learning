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
    	print "\nepisode " + str(episode) + "  : \n "
    	s=np.int(np.random.random()*5)
    	while s!=sink:
    	     f=(R[s,:]+1).nonzero()[0]
    	     n=f[np.int(np.random.random()*len(f))]
    	     Q[s,n]=R[s,n]+Gamma*max(Q[n,R[n,:]>=0])
    	     print "\n", s, "   to   ",n,  "\n"
             prettyview(Q,P)
	     time.sleep(0.5)
    	     s=n

def prettyview(Q,P):
	def pad(s):
		width=10
	        pad=((width-len(s))/2)
		return " "*pad+s+" "*pad
	I,J=P.shape
	for i in range(I):
		s=""
		for j in range(J):
			s+=pad("{"+str(P[i,j])+"}")
			if (j!= J-1):
				s+=pad(str(Q[P[i,j],P[i,j+1]])+"/"+str(Q[P[i,j+1],P[i,j]]))
		print s
		s=""
		if (i!= I-1):
			for j in range(J):
				s+=pad(str(Q[P[i,j],P[i+1,j]])+"/"+str(Q[P[i+1,j],P[i,j]]))
				if(j != J-1):
					s+=pad("")
			print s


q()
