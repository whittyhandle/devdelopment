#error_handeling
#common errors

#SyntaxError
# Occurs when Python encounters incorrect syntax (something it doesn't parse).
# Usually due to typos or not knowing Python well enough
# def first: # SyntaxError
# None = 1 # SyntaxError
# return # SyntaxError

#NameError
# This occurs when a variable is not defined, i.e. it hasn't been assigned
# test
# # NameError: name 'test' is not defined

#TypeError
# Occues when: mismatch of datatypes
# An operation or function is applied to the wrong type
# Python cannot interpret an operation on two data types
# len(5)
# TypeError: object of type 'int' has no len()

# "awesome" + []
# TypeError: cannot concatenate 'str' and 'list' objects

# IndexError
# Occurs when you try to access an element in a list using an invalid index (i.e. one that is outside the range of the list or string):
#
# list = ["hello"]
# list[2]
# IndexError: list index out of range

# ValueError
# This occurs when a built-in operation or function receives an argument that has the right type but an inappropriate value:
#
# int("foo")
# ValueError: invalid literal for int() with base 10: 'foo

# KeyError
# This occurs when a dictionary does not have a specific key:
#
# d = {}
# d["foo"]
# KeyError: 'foo'

# AttributeError
# This occurs when a variable does not have an attribute:
#
# "awesome".foo
# AttributeError: 'str' object has no attribute 'foo'

#more in docs



#Rasing your own Exceptions

#raise ValueError('invalid value')

def colorize(text, color):
    colors = ("cyan", "yellow", "blue", "green", "magents")
    if type(color) is not str:
        raise TypeError("color must be instance of str")
    if type(text) is not str:
        raise TypeError("text must be instance of str")
    if color not in colors:
        raise ValueError("invalid color")
    print(f"print {text} in {color}")

# colorize('hello', 10) # TypeError: color must be instance of str
# colorize(1, 'red') # TypeError: text must be instace of str
# colorize("test", 'red') # ValueError: invalid color


# Handle Errors
# try and except

#foobar # NameError: name 'foobar' is not defined
try:
    foobar
except NameError as err:
    print("problem after the try")
    print(err)

#don't want to try and catch all the errors in one catch all
#be specific and catch an expected error


def get(d,key): # this functions mimics the dict function get d.get("name")
    try:
        return d[key]
    except KeyError:
        return None

d = {'name': 'dave'}
# d['city'] # KeyError: 'city'
print(get(d,'name')) # dave
print(get(d,'city')) # None

#else and finally
try:
    int(input("enter a number: "))
except:
    print("That's not a number ")
else: # else will run when except doesn't
    print("I'm in the else")
finally:
    print("Runs no matter what")

while True:
    try:
        int(input("enter a number: "))
    except ValueError:
        print("That's not a number ")
    else: # else will run when except doesn't
        print("Good Job you entered a number!")
        break
    finally:
        print("Runs no matter what")
print("Rest of game logic runs")

def divide(a,b):
    try:
        return a/b
    except ZeroDivisionError:
        print("don't divide by zero")
    except TypeError as err:
        print("a nd b must be ints or floats ")
        print(err)

print(divide(1,2))
print(divide(1,0))
print(divide(1,'a'))

# PDB Python Debugger

import pdb
first = "First"
second = "Second"
pdb.set_trace() # runs everything upto this point
result = first + second
third = "Third"
result += third
print(result)

# import pdb
# pdb.set_trace()
#
# Also commonly on one line
# import pdb; pdb.set_trace()
#
# Common PDB Commands:
# l (list)
# n (next lint)
# p (print)
# c (continue - finishes debuging)\

#PDB Gotchas

def add_numners(a,b,c,d):
    import pdb; pdb.set_trace()
    return (a+b+c+d)

add_numners(1,2,3,4)
# may need to p and the variable name
#examole p c # 3

