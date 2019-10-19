def string_bits(str):
	result = ''
	for letter in range(len(str)):
		if letter % 2 == 0:
			result += str[letter]
	return result

print(string_bits('qwerty'))
