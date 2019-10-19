# name = input("please enter your name")
# age = int(input("How old are you, {0}?" .format(name)))
# print(age)
#
# if age >= 18:
#     print("you are old enogh to vote")
#     print("Please put an x in the box")
# else:
#     print("Please com back in 0} years" .format(18 -age))

print("please guess a number between 11 and 10: ")
guess = int(input())

if guess < 5:
    print("higher")
    guess = int(input())
    if guess == 5:
        print("you got it")
else:
    print("nope")
elif guess > 5:
    print("lower")
    guess = int(input())
    if guess == 5:
        print("yes")
    else:
        print("nope")
    else:
        print("yes")