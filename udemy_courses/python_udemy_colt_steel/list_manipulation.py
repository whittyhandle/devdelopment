'''
list_manipulation([1,2,3], "remove", "end") # 3
list_manipulation([1,2,3], "remove", "beginning") #  1
list_manipulation([1,2,3], "add", "beginning", 20) #  [20,1,2,3]
list_manipulation([1,2,3], "add", "end", 30) #  [1,2,3,30]
'''

def list_manipulation(my_list, my_command, my_location, my_value = None):
    if my_command == "remove" and my_location == "end":
        return my_list.pop(-1)
    elif my_command == "remove" and my_location == "beginning":
        return my_list.pop(0)
    elif my_command == "add" and my_location == "beginning":
        my_list.insert(0, my_value)
        return my_list
    else:
        my_command == "add" and my_location == "end"
        my_list.append(my_value)
        return my_list
list_manipulation([1,2,3], "add", "end", 21)