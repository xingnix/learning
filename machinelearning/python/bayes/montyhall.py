import numpy as np

win_notswitch=0.0
win_switch=0.0
N=100
for n in range(1,N):
	car=np.random.randint(3)
	pick=np.random.randint(3)
	opendoors=list(set([0,1,2])-set([pick])-set([car]))
	opendoor=opendoors[np.random.randint(len(opendoors))]
	left=list(set((0,1,2))-set([pick])-set([opendoor]))[0]

        if car==pick:
	    win_notswitch+=1
	elif car==left:
	    win_switch+=1
	print "don't switch : ",np.int(win_notswitch/n *100), "%  switch : ",np.int(win_switch/n*100),"%"
