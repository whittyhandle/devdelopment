'''
is_palindrome('testing') # False
is_palindrome('tacocat') # True
is_palindrome('hannah') # True
is_palindrome('robert') # False
is_palindrome('amanaplanacanalpanama') # True
'''

def is_palindrome(my_string):
    if my_string[::-1] == my_string:
        return True
    else:
        return False

is_palindrome("amanaplanacanalpanama")