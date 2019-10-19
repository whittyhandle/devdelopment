'''
multiply_even_numbers([2,3,4,5,6]) # 48
'''

def multiply_even_numbers(my_list):
    total = 1
    for val in my_list:
        if val % 2 == 0:
            total = total * val
    return total



print(multiply_even_numbers([2,3,4,5,6]))