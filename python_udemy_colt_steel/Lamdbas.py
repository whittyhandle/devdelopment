def square(num):
    return num * num
print(square(9))


def square(num): return num * num #same as above
print(square(9))

# syntax
# lambda num: num * num #think of it of a function that doesn't have a name
# can save to a variable
# square2 = lambda num: num * num
# can only be one line
# automatically returns

square2 = lambda num: num * num
print(square2(7))
add = lambda a,b: a + b
print(add(7,2))

print(square.__name__) # name property
print(square2.__name__)
print(add.__name__) # no names

# common use case: don't need to make a function for one time use 