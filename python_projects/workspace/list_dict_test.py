list_dict_test = {
'key1': 'test1', 
'key2':[{'key2.1': 'test2.1', 'key2.2':'test2.2', 'key2.3':'test2.3'}], 
'key3': 'test3', 
'key4.1':[{'2ndkey4.1.': 'test4.1.', '2ndkey4.2.':'test4.2.', '2ndkey4.3.':'test4.3.'}], 
'key5.1':[{'3rdkey5.1.': 'test5.1.', '3rdkey5.2.':'test5.2.', '3rdkey5.3.':'test5.3.'}], 
'totalCount': 243, 'status': 0}

def test(my_file):
	for key, value in my_file.items():  
		if isinstance(value, list):
			index_of_value = range(len(value))
			for i in index_of_value:
				nested_dict = value[i]
				for key,value in nested_dict.items():
					print(f"nested key: {key}")
					print(f"nested value: {value}")
	else:
		print(f"outer key: {key}")
		print(f"outer value: {value}")

test(list_dict_test)