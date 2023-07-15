import re
import math
from functools import reduce

input_string = """
Day Outlook   Temperature  Humidity   Wind   PlayTennis
D1  Sunny     Hot          High       Weak   No
D2  Sunny     Hot          High       Strong No
D3  Overcast  Hot          High       Weak   Yes
D4  Rain      Mild         High       Weak   Yes
D5  Rain      Cool         Normal     Weak   Yes
D6  Rain      Cool         Normal     Strong No
D7  Overcast  Cool         Normal     Strong Yes
D8  Sunny     Mild         High       Weak   No
D9  Sunny     Cool         Normal     Weak   Yes
D10 Rain      Mild         Normal     Weak   Yes
D11 Sunny     Mild         Normal     Strong Yes
D12 Overcast  Mild         High       Strong Yes
D13 Overcast  Hot          Normal     Weak   Yes
D14 Rain      Mild         High       Strong No"""

lines = list(map(lambda x: list(filter(lambda y: y != '',
                             re.split(' +', x)))[1:],  # drop first item "Example"
            filter(lambda x: x != '', re.split('\n', input_string))))
names, data = lines[0], lines[1:]
data_lines = list(map(lambda x: dict(zip(names, x)), data))
values = dict(zip(names,
                  reduce(lambda x, y:
                         map(lambda z:
                             z[0] | set([z[1]]) if type(z[0]) is set else set(z),
                             zip(x, y)),
                         lines[1:])))
names, target = names[:-1], names[-1]  # the last item is target
P = 'Yes'
N = 'No'

# initialize probability table
def init(names,values):
    p={}
    for t in [P,N]:
        p[t]={}
        for name in names:
            p[t][name]={}
            for v in values[name]:
                p[t][name][v]=0
    return p

def init_alt(names,values):
    return dict(map(lambda t: 
                     [t,dict(map(lambda name:
                                [name,dict(map(lambda v: 
                                                [v,0],
                                               values[name]))],
                              names))],
                     [P,N]))

# counting occurrance
def count(prob,data_lines,names,values):
    for sample in data_lines:
        for name in names:
            prob[sample[target]][name][sample[name]]+=1.0
    return prob.copy()

def classifier(data_lines,target,names,values):
    prob=init_alt(names,values)
    nums=init_alt(names,values)
    nums=count(nums,data_lines,names,values)
    p_n={P:0,N:0}
    for sample in data_lines:
        p_n[sample[target]]+=1
    for t in [P,N]:
        for name in names:
            for v in values[name]:
                k=len(values[name])
                m=k*0.1
                nc=nums[t][name][v]
                if nc>0:
                   prob[t][name][v]=(nc+m/k)/(sum(nums[t][name].values())+m)
                else:
                   prob[t][name][v]=1.0/(len(values[name]))
    prob[target]={P:float(p_n[P])/(p_n[P]+p_n[N]),N:float(p_n[N])/(p_n[P]+p_n[N])}

    return prob

def predict(prob,sample,names,target):
        r={P:1,N:1};
        for t in [P,N]:
            r[t]*=prob[target][t]
            for name in names:
                r[t]*=prob[t][name][sample[name]]
        return {P:r[P]/(r[P]+r[N]),N:r[N]/(r[P]+r[N])}

prob=classifier(data_lines[5:9],target,names,values)
for sample in data_lines[5:9]:
  r=predict(prob,sample,names,target)
  print ([r[sample[target]]])
