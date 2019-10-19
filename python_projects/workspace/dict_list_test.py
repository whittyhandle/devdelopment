list_dict_test = {'key1': 'test1', 'key2':[{'key2.1': 'test2.1', 'key2.2':'test2.2'}]}

for key,value in list_dict_test.items(): # iterate through key and values in a dictionary
	if isinstance(value, list): # if value is a list
		for index_of_value in range(len(value[0].items())): # grabs index values in the list
			for i in range(index_of_value + 1): # iterate index from above 
				print("x") # should print x twice
		else:
			pass
			#print(key)
			#print(value)
		
#		
#for x in (list_dict_test['key2'][0].items()):
#	print(type(x))
#	print(x)
#	pass

#
# for i in range(len(iTunesData)):
#					print(i)
#				return iTunesData['assets'][0]['adamIdStr']
#				return app_count
				
				