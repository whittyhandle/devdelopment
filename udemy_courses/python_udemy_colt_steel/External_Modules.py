#need to import SDK for the right projecrt
from termcolor import colored
from pyfiglet import figlet_format
from termcolor import colored
import pyfiglet


text = colored("HI THERE!", color="magenta", on_color="on_cyan", attrs=["blink"])
print(text)



msg = input("what would you like to print? ")
color = input("what color? ")

ascii_art = pyfiglet.figlet_format(msg)
#colored_ascii = colored(ascii_art, color="green") # only prints one color
colored_ascii = colored(ascii_art, color=color) # only print what is predefined in termcolor
print(colored_ascii)




def print_art(msg, color):
    valid_colors = ("red", "green", "yellow", "blue", "magenta", "cyan", "white")

    if color not in valid_colors:
        color = "magenta"

    ascii_art = figlet_format(msg)
    colored_ascii = colored(ascii_art, color=color)
    print(colored_ascii)

msg = input("What would you like to print? ")
color = input("What color? ")
print_art(msg, color)
