import numpy as np

P_T_A=0.1 # truth probability of question `
P_A=0.7 # probability of selecting question `
P_T_B=0.5 # truth probability of question 1
N=1000 # number of samples
m=0.0 # numberr of answer 1
for n in range(1,N):
        if np.random.random()<P_T_A:
            if np.random.random()<P_A: 
                        m+=1       #answer question A honestly
            else:
                  if np.random.random()<P_T_B:
                        m+=1
                
        else:
            if np.random.random()<P_A: 
                        m+=0       #answer question A honestly
            else:
                  if np.random.random()<P_T_B:
                        m+=1
        p_e=(m/n-(1-P_A)*P_T_B)/P_A
        print( "real p: ", P_T_A, "estimated:" , p_e)
