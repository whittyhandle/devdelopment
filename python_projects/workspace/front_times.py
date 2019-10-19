def front_times(str, n):
	if len(str) >= 3:
		return str[0: n] * 3
	else:
		return str * 3
	
print (front_times('te',3))
