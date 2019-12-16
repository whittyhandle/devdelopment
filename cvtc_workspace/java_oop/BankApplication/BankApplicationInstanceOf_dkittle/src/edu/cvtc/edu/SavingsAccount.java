/**
 * 
 */
package edu.cvtc.edu;

/**
 * @author david.kittle
 *
 */
public class SavingsAccount extends BankAccount implements AccruesInterest{
	// Variables
	private double MIN_BALANCE = 5.0;
	

	//Constructor 
	public SavingsAccount(double balance) {
		super(balance);
		
	}
	
	
	public void withdraw(double amount) {
		double balance = getBalance();
		if ((balance - amount) < MIN_BALANCE) {
			System.out.println("NSF - SavingsAccount"); 
		} else {
			balance -= amount;
			System.out.println("Withdraw amount " + amount + " from SavingsAccount ");
		}
	}
	
	
	@Override
	public String toString() {
		return "SavingsAccount [MIN_BALANCE=" + MIN_BALANCE + "]";
	}

	@Override
	public void deposit(double amount) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void accruesInterest() {
		System.out.println("Interest - SavingsAccount");
		
	}
	
	
	

}
