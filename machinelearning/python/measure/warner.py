import numpy as np
P_T_A=0.1 # trueth value of answer 1
P_A=0.7  #probability selecting question 1
N=1000  # number of samples
m=0.0  # number of answer `
a=0.0 # truth number of answer ` of samples
am=0.0 # number of answer 1
for n in range(1,N):
        if np.random.random()<P_T_A:
            if np.random.random()<P_A:
                        a+=1
                        m+=1
                        am+=1
            else:
                        m+=0
                
        else:
            if np.random.random()<P_A:
                        a+=1
                        m+=0
            else:
                        m+=1
        p_e=(m/n-(1-P_A))/(2*P_A-1)
        print ("real p: ", P_T_A, "counted:" , am/max(1,a) ,"estimated:" , p_e)
