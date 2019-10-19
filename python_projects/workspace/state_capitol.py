import random

capital_dicionary={
	'Alabama': 'Montgomery',
	'Alaska': 'Juneau',
	'Arizona':'Phoenix',
	'Arkansas':'Little Rock',
	'California': 'Sacramento',
	'Colorado':'Denver',
	'Connecticut':'Hartford',
	'Delaware':'Dover',
	'Florida': 'Tallahassee',
	'Georgia': 'Atlanta',
	'Hawaii': 'Honolulu',
	'Idaho': 'Boise',
	'Illinios': 'Springfield',
	'Indiana': 'Indianapolis',
	'Iowa': 'Des Monies',
	'Kansas': 'Topeka',
	'Kentucky': 'Frankfort',
	'Louisiana': 'Baton Rouge',
	'Maine': 'Augusta',
	'Maryland': 'Annapolis',
	'Massachusetts': 'Boston',
	'Michigan': 'Lansing',
	'Minnesota': 'St. Paul',
	'Mississippi': 'Jackson',
	'Missouri': 'Jefferson City',
	'Montana': 'Helena',
	'Nebraska': 'Lincoln',
	'Neveda': 'Carson City',
	'New Hampshire': 'Concord',
	'New Jersey': 'Trenton',
	'New Mexico': 'Santa Fe',
	'New York': 'Albany',
	'North Carolina': 'Raleigh',
	'North Dakota': 'Bismarck',
	'Ohio': 'Columbus',
	'Oklahoma': 'Oklahoma City',
	'Oregon': 'Salem',
	'Pennsylvania': 'Harrisburg',
	'Rhoda Island': 'Providence',
	'South Carolina': 'Columbia',
	'South Dakoda': 'Pierre',
	'Tennessee': 'Nashville',
	'Texas': 'Austin',
	'Utah': 'Salt Lake City',
	'Vermont': 'Montpelier',
	'Virginia': 'Richmond',
	'Washington': 'Olympia',
	'West Virginia': 'Charleston',
	'Wisconsin': 'Madison',
	'Wyoming': 'Cheyenne'  
}

correct_answers = 0
incorrect_answers = 0

random_state = random.choice(list(capital_dicionary.items()))
print(random_state[0])
print(random_state[1])
print("Whats the state capital for " + str(*random_state[0:1:])+ "?")
player_response = input()

if player_response.upper() == random_state[1].upper():
	correct_answers += 1
	print(f"Correct the state capital for {random_state[0]} is {player_response} !!" )
else:
	incorrect_answers += 1
	print(f"Incorrect the state capital of {random_state[0]} is NOT {player_response} !!" )


print(f"The number of correct choices is {correct_answers} and the number of incorrect choicesa are {incorrect_answers}")
	







