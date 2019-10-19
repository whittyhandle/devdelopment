#modules
#built-in modules

import random # import first
print(random.choice(["apple", 'banana', 'cherry', 'durian'])) # choice
random.shuffle(["apple", 'banana', 'cherry', 'durian']) # shuffle

import random as rand # custom name rand

print(rand.choice(["apple", 'banana', 'cherry', 'durian']))

# import parts or just what you need
#  from MODULe import * pattern #note * is all not just part

from random import choice, randint
print(choice(["apple", 'banana', 'cherry', 'durian']))

#custom files

#file1.py

def fn():
    return  "do some stuff"

def other_fn():
    return "do some other stuff"

#file2.py

import file1 # need to be in the same dir or the correct path

file1.fn() # do some stuff
file2.fn() # do some other stuff


#auto pep8  -m pip install autopip8

