# flesh out intersection pleaseeeee
def intersection(list1, list2):
    in_common = []
    for i in list1:
        if i in list2:
            in_common.append(i)
    return in_common




print(intersection([1,2,3], [2,3,4]))