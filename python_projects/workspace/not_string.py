def not_string(my_string):
	if my_string.split()[0] == "not":
		 return my_string
	else: 
		return f" not {my_string}"
	
	
print(not_string("test "))
