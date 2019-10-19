l = [1,2,3,4]

# filter needs to return True or False
evens = list(filter(lambda x: x % 2 == 0, l))
print(evens)

names = ["austin", "anthony", "angel", "billy"]
a_names = filter(lambda n: n[0]=='a', names)
print(a_names) # gets <filter object at 0x10c9bf278>
a_names = list(filter(lambda n: n[0]=='a', names))
print(a_names) # need to cast to a list


users = [
    {"username": "Sam", "tweets": ["I love cakes", "I love pir"]},
    {"username": "kate", 'tweets': ["I love my cat"]},
    {"username": "jeff", "tweets": []},
    {"username": "bob123", "tweets": []},
    {"username": "doggo_luvr", "tweets": ["dogs are the best", "I'm hungry"]},
    {"username": "guitar_gal", "tweets": []}
]

inactive_users = list(filter(lambda u: len(u['tweets']) == 0, users)) #users is the 1st parameter // looking if len of tweets is 0
print(inactive_users)

# can take advantage that's and empty string or 0 is  inherently false
inactive_users = list(filter(lambda u: u['tweets'], users)) # returns active users
print(inactive_users)


inactive_users = list(filter(lambda u: not u['tweets'], users)) # negated using NOT
print(inactive_users)