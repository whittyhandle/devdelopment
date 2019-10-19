file = raw_input("Input Filename: ")
outputFile = raw_input("Output Filename: ")

f = open(file)
text = f.read()

text = text.replace('%2E', '.')
text = text.replace('%5F', ' -')
text = text.replace('%20', ' ')
text = text.replace('%2D', '/')
text = text.replace('%28', '(')
text = text.replace('%29', ')') 
text = text.replace('%2F', '/')

split_list = text.split('&');

of = open(outputFile, 'w+')

for lines in split_list:
	of.write(lines + "\n")
	print lines
