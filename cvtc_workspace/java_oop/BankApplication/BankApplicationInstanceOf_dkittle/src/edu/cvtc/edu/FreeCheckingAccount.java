/**
 * 
 */
package edu.cvtc.edu;

/**
 * @author david.kittle
 *
 */
public class FreeCheckingAccount extends BankAccount{
	
	// Variables 
	private double MIN_BALANCE = 100.0; 
	


	// Constructor 
	public FreeCheckingAccount(double balance) {
		super(balance);
		
	}
	
	
	public void withdraw(double amount) {
		double balance = getBalance();
		if ((balance - amount) < MIN_BALANCE) {
			System.out.println("NSF - FreeCheckingAccount"); 
		} else {
			balance -= amount;
			System.out.println("Withdraw amount " + amount + " from FreeCheckingAccount ");
		}
		
	}

	@Override
	public String toString() {
		return "FreeCheckingAccount [MIN_BALANCE=" + MIN_BALANCE + "]";
	}

	@Override
	public void deposit(double amount) {
		// TODO Auto-generated method stub
		
	}
	
	public void accruesInterest() {
		System.out.println("Interest - FreeCheckingAccount");
		
	}

	
	
}