def display_names(first, second):
    print(f"{first} says hello to {second}")

names = {"first": "Colt", "second": "Rusty"}

#display_names(names) #nope ...
display_names(**names)





def add_and_myltiply_number(a,b,c,**kwargs):
    print(a + b * c)
    print("other stuff.....")
    print(kwargs)

data = dict(a=1,b=2,c=3, name="Tony")

#add_and_myltiply_number(data)# type error
add_and_myltiply_number(**data, CAT="BLUE") # should return 7 // can pass other arguments "CAT"