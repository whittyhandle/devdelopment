from termcolor import colored
from random import choice
import pyfiglet
import requests

# ascii art message and color
msg = ("Dad Jokes  3000")
color = ("red")

ascii_art = pyfiglet.figlet_format(msg)
colored_ascii = colored(ascii_art, color=color)
print(colored_ascii)


print("Let me tell you a joke!")
# get user input  expected input string
joke_topic = input("Give me a topic: ")


url = "https://icanhazdadjoke.com/search"

response = requests.get(
    url,
    headers={"Accept": "application/json"},
    params={"term": joke_topic,}
).json()

total_num_of_jokes = response["total_jokes"]
rand_joke = response['results']


if total_num_of_jokes == 0:
    print(f"I don't have any jokes about {joke_topic} ")
elif total_num_of_jokes > 0:
    print(f"I have {total_num_of_jokes} jokes about {joke_topic}")
    print(choice(rand_joke)['joke'])
else:
    print('Sorry no jokes')



