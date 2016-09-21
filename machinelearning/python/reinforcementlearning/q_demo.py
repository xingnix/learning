import numpy as np

R=np.array([[-1,-1,-1,-1, 0,-1],
	    [-1,-1,-1, 0,-1,100],
	    [-1,-1,-1, 0,-1,-1 ],
	    [-1, 0, 0,-1, 0,-1],
	    [ 0,-1,-1, 0,-1,100],
	    [-1, 0,-1,-1, 0,100]])
Q=np.zeros((6,6))

Gamma=0.8
episodes=20
for episode in range(episodes):
	s=np.int(np.random.random()*5)
	while s!=5:
	     f=(R[s,:]+1).nonzero()[0]
	     n=f[np.int(np.random.random()*len(f))]
	     Q[s,n]=R[s,n]+Gamma*max(Q[n,R[n,:]>=0])
	     s=n


