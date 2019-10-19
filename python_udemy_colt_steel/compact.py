'''
compact([0,1,2,"",[], False, {}, None, "All done"]) # [1,2, "All done"]
'''

def compact(my_list):
    truthy_vals = []
    for val in my_list:
        if val:
            truthy_vals.append(val)
    return truthy_vals


print(compact([0,1,2,"",[], False, {}, None, "All done"]))