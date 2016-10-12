import re
import numpy as np

input_string = """
Example Sky AirTemp Humidity Wind Water Forecast  EnjoySport
1       Sunny  Warm  Normal  Strong  Warm  Same   Yes
2       Sunny  Warm  High    Strong  Warm  Same   Yes
3       Rainy  Cold  High    Strong  Warm  Change No
4       Sunny  Warm  High    Strong  Cool  Change Yes"""

lines = map(lambda x: filter(lambda y: y != '',
                             re.split(' +', x))[1:],  # drop first item "Example"
            filter(lambda x: x != '', re.split('\n', input_string)))
names, data = lines[0], lines[1:]
data_lines = map(lambda x: dict(zip(names, x)), data)
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

def predict(h,sample):
	names=h.keys()
        p = 1 if (reduce(lambda x, y: x and y,
                      map(lambda name:
                             sample[name] == h[name] or h[name] == '?',
                          names))) else 0
	return {"Yes":p,"No": 1-p}

def weight(samples,names,values):
    beta=0.1
    w=np.ones(len(H))
    for sample in samples:
         p={"Yes":0,"No":0}
	 for i in range(len(H)):
	         a=predict(H[i],sample)
	         if a["Yes"]>a["No"]:
	             c="Yes"
		 else:
		     c="No"
                 if sample[target]!=c:
		     w[i]*=beta
    return w

def weightedmajorityclassifier(H,w,sample):
	p={"Yes":0,"No":0}
	for i in range(len(H)):
	      prediction= predict(H[i],sample)
	      for t in ["Yes","No"]:
		    p[t]+=prediction[t]*w[i]
	return p
H=listconcept(names, values)
w=weight(data_lines,names,values)
weightedmajorityclass=weightedmajorityclassifier(H,w,data_lines[0])
print "Weighted Majority Classification : \n  data: " ,data_lines[0], "\n class ",weightedmajorityclass 
