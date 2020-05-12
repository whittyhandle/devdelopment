def display_info(a, b, *args, instructors="Colt", **kwargs):# in that order
    return  [a,b,args, instructors, kwargs]

print(display_info(1, 2, 3, last_name="Steele", job="Instructor"))

# expected output
# a - 1
# b - 2
# arg = (3) as a tuple // default to add comma
# instructors - "Colt" as a dictionary
#{'last_name': " Steele", "job":"Instructor"}