'''
frequency([1,2,3,4,4,4], 4) # 3
frequency([True, False, True, True], False) # 1
'''

def frequency(my_list, my_value):
    return my_list.count(my_value)



print(frequency([1,2,3,4,5,4,4,4,4], 4))