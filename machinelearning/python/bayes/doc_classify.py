import numpy as np
import re
doc={}
doc['p']=" nice good good nice happy happy happy  laugh laugh cry"
doc['n']=" sad  sad  bad cry cry cry unhappy unhappy laugh cry cry"
doctest=" sad  sad  bad cry cry cry  happy happy  laugh laugh cry joy"

#----------- train
vocabulary=set()
N=0
for v in ['p','n']:
    doc[v]=filter(lambda x: x!='',re.split(' +',doc[v]))
    vocabulary=vocabulary|set(doc[v])
    N+=len(doc[v])
prior={}
conditional={}
for v in ['p','n']:
    prior[v]=1.0/2
    n=len(doc[v])
    conditional[v]={}
    for wk in vocabulary:
        nk=len(filter(lambda x :x==wk,doc[v]))
	conditional[v][wk]=1.0*(nk+1)/(n+len(vocabulary))

print "prior of classes :\n", prior
print "\n conditional probability of words :\n" ,conditional

#----------- test
r={}
doctest=filter(lambda x: x!='',re.split(' +',doctest))
for v in ['p','n']:
    r[v]=prior[v]
    for ai in doctest:
        r[v]*=conditional[v][ai] if conditional[v].has_key(ai) else 1
print "\n classificaiton of test doc :\n" , r
