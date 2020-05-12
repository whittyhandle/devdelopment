names = ["Lassie", "Colt", "Rusty"]

list(map(lambda name: f" Your instructors is {name}",
         filter(lambda value: len(value) < 5, names)))

# print Your instructor is Colt


users = [
    {"username": "Sam", "tweets": ["I love cakes", "I love pir"]},
    {"username": "kate", 'tweets': ["I love my cat"]},
    {"username": "jeff", "tweets": []},
    {"username": "bob123", "tweets": []},
    {"username": "doggo_luvr", "tweets": ["dogs are the best", "I'm hungry"]},
    {"username": "guitar_gal", "tweets": []}

]
inactive_users = list(map(lambda user: user["username"].upper(),
    filter(lambda u: not u['tweets'], users)))

print(inactive_users)