#OOP Classes and objects
# creates things that exist in the real word
# classes and objects
# class = blueprint for objects
# instance = objects that are constructed from a class

#simplest possible class

class User: # keyword is class
    pass

user1 = User()
print(user1) # <__main__.User object at 0x10d36e438>
print(type(user1)) # <class '__main__.User'>

class User:
    def __init__(self):
        print("a new user has been made")

user1 = User()
print(user1) # a new user has been made runs despite not calling __init__ // runs automatically

class User:
    def __init__(self, first):
        self.name = first # think of this as a dict with a value name:first

user1 = User("Joe")
user2 = User("Blanca")
print(user1.name, user2.name) # Joe Blanca // to access the specific attribute we run instance.attribute_name

class User:
    def __init__(self, first, last, age):
        self.first = first
        self.last = last
        self.age = age

user1 = User("Joe", "Smith", 68)
user2 = User("Blanca", "Lopez", 41)
print(user1.first, user1.last, user1.age)
print(user2.first, user2.last, user2.age)

class Comment:
    def __init__(self, username, text, likes=0):
        self.username = username
        self.text = text
        self.likes = likes

c = Comment("Dave123", "lol you're so silly")
print(c.username, c.text, c.likes)

# underscore
#_name =  private // purely conventional
#__ name = name mangle // in this case it would print _Person_something to access the item you need to Person_something__name
#__name__ = pre- existing

# Instance Attributes and Methods
# class with 3 instaces attributes but no instance methods(aside for __init__)
class User:
    def __init__(self, first, last, age):
        self.first = first
        self.last = last
        self.age = age

    def full_name(self):
        return f"{self.first} {self.last}"

    def intials(self):
        return f"{self.first[0]}.{self.last[0]}."

    def likes(self, thing):
        return f"{self.first} likes {thing}"

    def is_senior(self):
        return self.age >= 65

    def birthday(self):
        self.age += 1
        return f"Happy {self.age}th, {self.first}"

user1 = User("Joe", "Smith", 68)
user2 = User("Blanca", "Lopez", 41)
print(user2.full_name())
print(user1.intials())
print(user1.likes("chips"))
print(user2.is_senior())
print(user1.age)
print(user1.birthday())
print(user1.age)





