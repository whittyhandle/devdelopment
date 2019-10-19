# need mass in kg
# need weight in newtons 
# if you know mass in Kg  use weight = mass * 9.8 to weight in newtons 

#
mass = input('enter the total mass: ')
flo_mass = float(mass)

weight_newtons = flo_mass * 9.8

if weight_newtons > 500:
    print("to heavy")
elif weight_newtons < 100:
    print("to light")
else:
    print(f" the weight in newtons is {weight_newtons}")
