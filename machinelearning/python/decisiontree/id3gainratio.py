import re
import math
import sys
if sys.version > '3':
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

using_date=True

lines = list(map(lambda x: list(filter(lambda y: y != '',
                             re.split(' +', x)))[0 if using_date else 1:],  # drop first item "Example"
            list(filter(lambda x: x != '', re.split('\n', input_string)))))
names, data = lines[0], lines[0:]
data_lines = list(map(lambda x: dict(zip(names, x)), data))
values = dict(zip(names,
                  reduce(lambda x, y:
                         list(map(lambda z:
                             z[0] | set([z[1]]) if type(z[0]) is set else set(z),
                             zip(x, y))),
                         lines[1:])))
names, target = names[:-1], names[-1]  # the last item is target
P = 'Yes'
N = 'No'


def pncount (indices):
    p = 0
    n = 0
    majority = "unknown"
    for i in indices:
        if data_lines[i][target] == P :
            p = p + 1
        else:
            n = n + 1
    if p > n : majority = P
    elif n > p :  majority = N
    return p, n, majority

def entropy(indices):
    p,n,majority=pncount(indices)
    p=float(p)
    n=float(n)
    if p*n!=0 :
        return -p/len(indices)*math.log(p/len(indices))/math.log(2)-n/len(indices)*math.log(n/len(indices))/math.log(2)
    else: return 0

power_on_split=2

def gainratio(indices,name):
    gain=entropy(indices)
    split_information=0.0;
    for v in (values[name]):
       indices_v=subindices(indices,name,v)
       gain=gain-float(len(indices_v))/len(indices)*entropy(indices_v)
       s=float(len(indices_v))/len(indices)
       split_information=split_information-s*math.log(s if s>0 else 1)/math.log(2)
    return gain/(split_information ** power_on_split)

def bestattribute(indices,attributes):
    maxgain = -1
    A = None
    for a in attributes:
        newgain = gainratio(indices, a)
        if newgain > maxgain :
            A = a
            maxgain = newgain
    return A

def subindices(indices,name,v):
    return list(filter(lambda x: data_lines[x][name]==v,indices))

def id3(indices,attributes):
    p,n,majority=pncount(indices)
    if p==0 : return {'label':N, 'p':p,'n':n}
    if n==0 : return {'label':P, 'p':p,'n':n}
    if len(attributes)==0 : return {'label':majority ,'p':p,'n':n}

    node={'decision' : bestattribute(indices,attributes),'p':p,'n':n}
    for v in values[node['decision']]:
        indices_v=subindices(indices,node['decision'],v)
        if len(indices_v) ==0 :
            node[v]={'label':majority,'p':0,'n':0}
        else:
            attributes_v=list(attributes)
            attributes_v.remove(node['decision'])
            node[v]=id3(indices_v,attributes_v)
    return node



tree=id3(range(14),names)
def prettytreeview(tree,space):
    if not "label" in tree:
        print(space + "|--" + "decision : " + tree["decision"] +  '['+str(tree['p'])+'+,'+str(tree['n'])+'-]')
        for v in values[tree["decision"]]:
            print( space + "|--" + v)
            prettytreeview(tree[v] , space + ":       ")
    else:
        print(space +"" + "label : " + tree["label"] + '['+str(tree['p'])+'+,'+str(tree['n'])+'-]')
prettytreeview(tree,"")
