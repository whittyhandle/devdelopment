def sum_all_num(num1, num2, num3):
    return num1+num2+num3

print(sum_all_num(4,6,9))

#pass in any number of arguments

def sum_all_num(*args):
    print(args) # dont need the * when calling it


print(sum_all_num(4,5,6,7,8,9)) #outputs all of the arguments we pass in as a tuple
print(sum_all_num(4,6))

# loop through the random parameters
def sum_all_num(*args):
    total = 0
    for num in args: # loops through each element as an individual argument
        total += num
    return total


print(sum_all_num(4,5,6,7,8,9)) # returns the total of all the numbers
print(sum_all_num(4,6))

# can add another parameters
def sum_all_num(num1, *args):
    print(num1)
    total = 0
    for num in args: # loops through each element as an individual argument
        total += num
    return total


print(sum_all_num(4,5,6,7,8,9)) # returns the item on the item at index 0 then the rest sumed up
print(sum_all_num(4,6))  # no longer add in the item at index 0

#another example

def ensure_correct_info(*args):
    if "Colt" in args and "Steel" in args: # remember are are tuples checks to see if any item matches
        return "Welcome back Colt" # has to be Colt and Steel to print
    return "who are you"

print(ensure_correct_info())
print(ensure_correct_info(1, True, "Steel", "Colt"))

#*args exercise: The Purple Test
def contains_purple(*args):
    if "purple" in args:
        return True
    return False