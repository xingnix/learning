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


def listconcept(names, values):
    # rules=dict.fromkeys(names,'?')
    rules = [{}]
    newrules = []
    for name in names:
        for rule in rules:
            for value in values[name]:
                r = rule.copy()
                r[name] = value
                newrules.append(r)
            rule[name] = '?'
            newrules.append(rule)
        rules = newrules
        newrules = []
    return rules


def listconcept(names, values):
    # rules=dict.fromkeys(names,'?')
    rules = [{}]
    newrules = []
    for name in names:
        for rule in rules:
            for value in values[name] | set(['?']):
                r = rule.copy()
                r[name] = value
                newrules.append(r)
        rules = newrules
        newrules = []
    return rules


def eliminate(rules, samples, names):
    return filter(lambda rule:
                  reduce(lambda s1, s2:
                         s1 and
                         (s2[0] if s2[1] else not s2[0]),
                         map(lambda sample:
                             (reduce(lambda x, y: x and y,
                                     map(lambda name:
                                         sample[name] == rule[name] or rule[name] == '?',
                                         names)), sample[target] == p),
                             samples),True),
                  rules)


rules=eliminate(listconcept(names, values),data_lines,names)

for r in list(rules):
    print(r)
