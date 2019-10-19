
# prompt user to input value string 
rom_num = input(["enter a num 1 -6: "]) 

#DON'T CHANGE THIS DICTIONARY EITHER!
compare_stock = {
	"1": "I",
	"2": "II",
	"3": "III",
	"4": "IV",
	"5": "V",
	"6": 'VI'
}

# compares an prints 
if rom_num in compare_stock:
	print(f"{compare_stock.get(rom_num)} is equal to {rom_num}")
else:
	print("pick again")
	