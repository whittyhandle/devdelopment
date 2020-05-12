class Pet:

    allowed = ['cat', 'dog', 'fish', 'rat'] # class attribute

    def __init__(self, name, species):
        if species not in Pet.allowed:
            raise ValueError(f"You can't have a {species} pet!") # validations
        self.name = name
        self.species = species

    def set_species(self, species): # checks to make sure the Pet.species hasn't been changes  //  validations
        if species not in Pet.allowed:
            raise ValueError(f"You can't have a {species} pet!")
        self.species = species

cat = Pet("Blue", "cat")
dog = Pet("Wyatt", "dog")
print(Pet.allowed) # ['cat', 'dog', 'fish', 'rat']
print(cat.species) # cat
print(cat.set_species('rat')) # changes to rat
print(cat.species) # rat
# print(Pet("Tony", "tiger")) # raise ValueError(f"You can't have a {species} pet!") ValueError: You can't have a tiger pet!
print(Pet("kitty", "cat")) # <__main__.Pet object at 0x103e5c588>
Pet.allowed.append("hampster")
print(Pet.allowed) # ['cat', 'dog', 'fish', 'rat', 'hampster']



