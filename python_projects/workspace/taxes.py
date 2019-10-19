present_value = input("what is the value of the account")
interest_rate = input("what is the expected interest rate")
total_months = input("how long do you plan to invest") 

P = float(present_value)
i = float(interest_rate)
t = float(total_months)

def account_value():
	F = P * (1 + i) ** i
	return F

print(account_value())


	


