# all reports True or False

# all([0,1,2,3]) # False because 0 is Falsey
#all([char for char in 'eio' if char in 'aeiou']) # True
#all([num for num in [4,2,10,6,8]] if num % 2 == 0)


people = ["Charlie", "Casey", "Cody", "Carly", "Christina"]
print([name[0]=="C" for name in people]) # list of all true
print(all([name[0]=="C" for name in people])) # one True looking to see if all in the list are true
people.append("Kristy") # add user with K
print([name[0]=="C" for name in people]) # list of all true and one false
print(all([name[0]=="C" for name in people])) # not all are true so retuns false


nums = [2,60,26,18]
print(all([num % 2 == 0 for num in nums])) # returns true


#any reports True or False

print(any([0,1,2,3])) # True because 1 is truthy
print(any([val for val in [1,2,3] if val > 2])) # true
print(any([val for val in [1,2,3] if val > 5])) # false

nums = [2,60,26,21]
print(any([num % 2 == 1 for num in nums]))


# don't need to use comprehension
people = ["Charlie", "Casey", "Cody", "Carly", "Christina"]
print(name[0]=="C" for name in people)  # generator function use when you don't want a list at the end


#sorted for items that are interable not just lists

more_items = [6,1,2,8]
sorted(more_items) #[1,2,6,8] returns a copy
print(more_items) # remains unsorted different than how sort works
nums = [4,6,1,30,55,23]
sorted(nums) # returns a copy
print(nums) # not changed
nums.sort() #sorts inplace
print(nums) # returns sorted

#changing driection
print(sorted(nums, reverse=True))
print(sorted((2,1,45,23,99))) # sorted on a Tuple returns a list



# more useful

users = [
    {"username": "Sam", "tweets": ["I love cakes", "I love pir"]},
    {"username": "kate", 'tweets': ["I love my cat"]},
    {"username": "jeff", "tweets": []},
    {"username": "bob123", "tweets": []},
    {"username": "doggo_luvr", "tweets": ["dogs are the best", "I'm hungry"]},
    {"username": "guitar_gal", "tweets": []}
]

# sorted(users) # not TypeError: '<' not supported between instances of 'dict' and 'dict' not supported can't just pass it in

print(sorted(users, key=len)) #dictionaries do have a length
print(sorted(users, key=lambda user: user['username'])) #sorting by key value using lambda
print(sorted(users, key=lambda user: len(user['tweets']))) #len or number of tweets


#max & min swap out max for min

print(max(3,67,99)) # prints max value of 99
print(max('c','d','e')) # returns e becuase how strings are weighted
print(max('awesome')) # returns w
print(max({1:'a', 3:'c', 2:'b'}))


name = ["Arya", "Samson", "Dora", "Tim", "Ollivander"]
print(len(max(name)))
print(max(name, key=lambda n:len(n))) # to get the longest name out


songs = [
    {"title": "happy birthday", "playcount": 1},
    {"title": "Survive", "playcount": 6},
    {"title": "YMCA", "playcount": 99},
    {"title": "Toxic", "playcount": 31}

]

print(min(songs, key=lambda s: s['playcount']))
print(min(songs, key=lambda s: s['playcount'])['title'])



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

math.fabs(4) # 4.0 float ablulute value

#sum
#iterable optional start
#returns sum of start and items of an iterable goes left to right

print(sum([1,2,3])) # add left to right
print(sum([1,2,3], 10)) # optional start value
print(sum((1.5, 2, 3.7))) # tuple with floats can also use sets
#print(sum(['hi', 'there'])) # will error unsupported type


#round returns the nearest interger
print(round(10.2)) #10
print(round(1.212121, 2)) #1.21
print(round(3.54)) # 4
print(round(3.54, 2)) # 3.54


#zip by default it returns a interable tuple
#goes left to right


first_zip = zip([1,2,3], [4,5,6])
print(list(first_zip)) # [(1, 4), (2, 5), (3, 6)]
print(dict(first_zip))


nums1 = [1,2,3,4,5]
nums2 = [6,7,8,9,10]
print(zip(nums1, nums2)) # <zip object at 0x10e419c08>
z = zip(nums1, nums2)
print(list(z)) # print the list of z [(1, 6), (2, 7), (3, 8), (4, 9), (5, 10)]
z = dict(zip(nums1, nums2))
print(z) # {1: 6, 2: 7, 3: 8, 4: 9, 5: 10}
words = ['hi', 'lol', 'haha', ':)']
print(list(zip(words, nums1,nums2))) # [('hi', 1, 6), ('lol', 2, 7), ('haha', 3, 8), (':)', 4, 9)]

# can use the * to unpack things
# more conplex examples

midterms = [80,91,78]
finals = [98, 89,53]
students = ['dan', 'ang', 'kate']

# looking to dynamically make a dict
#start by
#zip(midterms, finals)
# add a for loop
#for pair in zip(midterms, finals)
# using a dict comp
print([pair for pair in zip(midterms, finals)]) # [(80, 98), (91, 89), (78, 53)]
# same as list(midterm, finals)
# looking to the max score of
print([max(pair) for pair in zip(midterms, finals)]) # [98, 91, 78]
print({t[0]:max(t[1], t[2]) for t in zip(students, midterms, finals)})
# what happening above
# makeing a tuple (dan, 80,98)
# making a dict with tuple 0
# dan: and then the max of 80,98
#dan:98
# {'dan': 98, 'ang': 91, 'kate': 78}

# using lambda
#start by zip
zip(midterms, finals)
# next use map
scores = map(
    lambda pair: max(pair),
    zip(midterms, finals)
)

print(scores) # default return <map object at 0x107915cc0> need to cast
print(list(scores)) #[98, 91, 78]

# works by calling map and passing in a collection of tuples and only retuning the max and adding that to the iterable return from map

# using zip we can zip students and the lambda function from above

grades = zip(
    students,
    map(
        lambda pair: max(pair),
        zip(midterms, finals)
    )
)
print(grades) # <zip object at 0x105d2b888> need to change to the type
print(dict(grades)) # change to dict


# find the average
avg_grades = dict(
    zip(
        students,
        map(
            lambda pair: ((pair[0]+pair[1])/2),
            zip(midterms, finals)
        )
    )
)

print(avg_grades) # {'dan': 89.0, 'ang': 90.0, 'kate': 65.5}










