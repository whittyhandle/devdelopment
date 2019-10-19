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
	private Double MIN_BALANCE = 100.0; 
	


	// Constructor 
	public FreeCheckingAccount(Double balance) {
		super(balance);
		
	}
	
	// Not Sure What Goes here
	public void withdraw(Double amount) {
		Double balance = getBalance();
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
	
	
}
