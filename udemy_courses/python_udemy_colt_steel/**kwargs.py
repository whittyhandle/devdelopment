def fav_colors(**kwargs): # random numnber of keywords pairs
    print(kwargs) # comes in as dictionary

fav_colors(colt="purple", ruby="red", ethel="teal") # keyword and value


# to loop through a dictionary you need to use .items()
def fav_colors(**kwargs):
    for person, colors in kwargs.items():
        print(f"{person}'s fav color is {colors}")

fav_colors(colt="purple", ruby="red", ethel="teal") # keyword and value

# conditional logic
def special_greeting(**kwargs):
    if "David" in kwargs and kwargs["David"] == "special": # checks in kwargs if the David Key exits and checks if the value of david is special
        return "You get a special greeting David!"
    elif "David" in kwargs:
        return f"{kwargs["David"]} David!"# checks for the key David and retuns the value assigned

    return "Not sure who this is..." # all other possibilities

print(special_greeting(David="hello"))
print(special_greeting(Bon="hello"))
print(special_greeting(David='special'))
print(special_greeting(Heather="hello", David="special")) # doesn't do anything with heather


#** Kwargs exercises
# Define combine_words below:

def combine_words(word, **kwargs):
    if "prefix" in kwargs:
        return kwargs["prefix"] + word
    elif "suffix" in kwargs:
        return word + kwargs["suffix"]
    else:
        return word

print(combine_words("test", prefix="p"))
print(combine_words("test", suffix="s"))
print(combine_words("test"))