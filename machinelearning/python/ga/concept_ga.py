import numpy as np
from functools import reduce
import re

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
                             z[0] | set([z[1]]) if type(
                                 z[0]) is set else set(z),
                             zip(x, y)),
                         lines[1:])))
names, target = names[:-1], names[-1]  # the last item is target
p = 'Yes'
n = 'No'


def init(names, values, n):
    # rules=dict.fromkeys(names,'?')
    rules = []
    for i in range(n):
        r = {}
        for name in names:
                    # s = list(values[name] | set(['?']))
                    s = ['?']+list(values[name])
                    r[name] = s[i % len(s)]
        rules.append(r)
    return rules


def compute_cost(rules, samples):
    names = rules[0].keys()
    n = len(samples)
    return map(lambda rule:
               sum(np.double(map(lambda sample:
                                   reduce(lambda x, y: x and y,
                                            map(lambda name:
                                                  sample[name] == rule[name] or rule[name] == '?',
                                                names)) == (sample[target] == p),
                                 samples)))/n,
        rules)


def select(rules, cost, n):
    cost = map(lambda x: x+0.1, cost)
    c = sum(cost)
    newrules = []
    for i in range(n):
        r = np.random.random()*c
        for j in range(len(cost)):
            r = r-cost[j]
            if r < 0:
                newrules.append(rules[j])
                break
    return newrules


def crossover(rules):
    names = rules[0].keys()
    l = len(names)
    n = len(rules)
    newrules = []
    for i in range(np.int(np.floor(n/2))):
        r = np.floor(np.random.random()*(l-1))+0.5
        x1 = {}
        x2 = {}
        for j in range(l):
            x1[names[j]] = rules[i][names[j]] if j < r else rules[i*2][names[j]]
            x2[names[j]] = rules[i][names[j]] if j > r else rules[i*2][names[j]]
        newrules.append(x1)
        newrules.append(x2)
    return newrules


def mutate(rules):
    names = rules[0].keys()
    l = len(names)
    n = len(rules)
    for i in range(n):
        if np.random.random() < 0.2:
            k=np.int(np.random.random()*l)
            rules[i][names[k]]=list(values[names[k]])[np.int(np.random.random()*len(values[names[k]]))]
    return rules
            

size=5
rules=init(names, values,size)
for t in range(20):
    cost=compute_cost(rules, data_lines)
    print(max(cost))
    rules=select(rules,cost,size)
    rules=crossover(rules)
    rules=mutate(rules)

