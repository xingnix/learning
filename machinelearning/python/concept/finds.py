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

rule = reduce(lambda r, s:
              r if s[target] == n else
              dict(zip(names,
                       map(lambda name:
                           s[name] if r[name] is None else '?' if r[name] != s[name] else r[name],
                           names))),
              data_lines, dict.fromkeys(names, None))
print(rule)
