import re
from functools import reduce

input_string = """
Example Sky AirTemp Humidity Wind Water Forecast  EnjoySport
1       Sunny  Warm  Normal  Strong  Warm  Same   Yes
2       Sunny  Warm  High    Strong  Warm  Same   Yes
3       Rainy  Cold  High    Strong  Warm  Change No
4       Sunny  Warm  High    Strong  Cool  Change Yes"""
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
p = 'Yes'
n = 'No'



def consistant(sample,rule):
     passed=reduce(lambda x, y: x and y,
                     map(lambda name:
                            sample[name] == rule[name] or rule[name] == '?',
                         names))
     return passed if sample[target] == p else not passed

    
def remove_inconsistant(d,Rules):
        consistant_rules=[]
        inconsistant_rules=[]
        for r in Rules:
            if consistant(d,r):
                consistant_rules.append(r)
            else:
                inconsistant_rules.append(r)
        return consistant_rules,inconsistant_rules

def generalthan(Rules,h):
        for r in Rules:
             if reduce(lambda x,y : x and y,
                           [ r[name]== h[name] or r[name]=='?' for name in names],True):
                 return True
        return False


def duplicate(Rules,h):
        for r in Rules:
             if reduce(lambda x,y : x and y,
                           [ r[name]== h[name] for name in names],True):
                 return True
        return False

def specialthan(Rules,h):
        for r in Rules:
             if reduce(lambda x,y : x and y,
                           [ r[name]==None or h[name]== r[name] or h[name]=='?' for name in names],True):
                 return True
        return False

def minigeneralize(G,S,h,d):
    H=[]
    for name in names:
        if h[name]==None:
            h[name]=d[name]
        elif h[name]!=d[name]:
            h[name]='?'
    if generalthan(G,h) and not specialthan(S,h) and not duplicate(S,h):  H.append(h)
    return H

def minispecialize(S,G,g,d):
    H = []
    for name in names:
        if g[name]=='?':
            for value in values[name]:
                  if value!=d[name]:
                       h = g.copy()
                       h[name] = value
                       if not generalthan(G,h) and specialthan(S,h) and not duplicate(G,h):
                           H.append(h)
    return H


G=[dict(zip(names,map(lambda x: '?', names)))]
S=[dict(zip(names,map(lambda x: None, names)))]
for d in data_lines:
    if d[target]==p:
        G,_=remove_inconsistant(d,G)
        S,E=remove_inconsistant(d,S)
        for s in E:
            S.extend(minigeneralize(G,S,s,d))
    else:
        G,E=remove_inconsistant(d,G)
        S,_=remove_inconsistant(d,S)
        for g in E:
            G.extend(minispecialize(S,G,g,d))

def prettyprint(Rules):
    for g in Rules:
        print("--")
        for name in names:
             print( name+" : " +g[name])

print("_________ G _________")
prettyprint(G)
print("_________ S _________")
prettyprint(S)
