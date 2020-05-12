nums = [2,4,6,8,10]

# two arguments // nums // and a function
# takes lambda x: x*2
# and iterates it through nums
doubles = map(lambda x: x*2 , nums)
print(type(doubles)) # map object // is iterable
for num in doubles:
    print(num)

list(doubles) # casts to a list

# typically done
doubles = list(map(lambda x: x*2, nums))


people = ("Denise", "Ivorie", "Izal", "Iris",)

peeps = map(lambda name: name.upper, people)
list(peeps) # should print a list in all CAPS


# map in action
l = [1,2,3,4]

doubles = list(map(lambda x: x*2, l))
print(doubles)

names = [
    {'first':'Rusty', 'last':'Steele'},
    {'first':'Colt', 'last':'Steels'},
    {'first':'Blue', 'last':'Steele'}
]

first_name = list(map(lambda x: x['first'], names))
print(first_name)