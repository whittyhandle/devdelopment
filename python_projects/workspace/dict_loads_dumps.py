import json


d1 = {"('Hello',)": 6, "('Hi',)": 5}
print(type(d1))
s1 = json.dumps(d1)
print(type(s1))
d2 = json.loads(s1)
print(type(d2))




	