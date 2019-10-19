# returns a reversed iterator 

nums = [1, 2, 3, 4]
nums.reverse()  # inplace list method
print(nums)

print(reversed("hello"))

# can use a slice on strings, list, etc
print("hello" [::-1])

for char in reversed("hello world"):
	print(char)

list(reversed("hello"))  # make it a list 
''.join(list(reversed("hello")))

print(''.join(list(reversed("hello"))))  # long way to do a slice 

# use reverse when you are iterating something 

for x in reversed(range(0, 10)):
	print(x)

#len

len('awsome')  # 7
len((1, 2, 3, 4))  # 4
len([1, 2, 3, 4])  # 4
len(range(0, 10))  # 10
len({1, 2, 3, 4})  # 4
len({'a': 1, 'b': 2, 'c': 2})  # 3 num of key:value pairs 


#abs absolute value int only 

abs(-5) # 5
abs(5) # 5

#fabs 

import math

math.fabs(4) # 4.0

#sum 
#iterable optional start 
#returns sum of start and items of an iterable goes left to right 
