/**
 * 
 */
package edu.cvtc.java;

/**
 * @author david.kittle
 *
 */
public class Customer {
	
	// Attributes 
	private String firstName;
	private String lastName; 
	private String address; 
	private String phoneNumber;
	private String emailAddress; 
	
	// Default Constructor 
	public Customer() {
		
	}
	
	// Methods Getters and Setters 
	public String getFirstName() {
		return this.firstName; 
	}
	
	public void setFirstName(String firstName) {
		this.firstName = firstName; 
	}
	
	public String getLastName() {
		return this.lastName;
	}

	public void setLasName(String lastName) {
		this.lastName = lastName; 
	}

	public String getAddres() {
		return this.address;
	}

	public void setAddress(String address) {
		this.address = address; 
	}

	public String getPhoneNumber() {
		return this.phoneNumber;
	}

	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber; 
	}
	
	public String getEmailAddress() {
		return this.emailAddress;
	}
	
	public void setEmailAddress(String emailAddress) {
		this.emailAddress = emailAddress; 
	}





}
