/**
 * 
 */
package edu.cvtc.java;

/**
 * @author david.kittle
 *
 */
public class ShiftSupervisor extends Employee{
	// Variables 
	private Double supervisorAnnualSalary; 
	private Double supervisorAnnualBonus;
	
	// Default Constructor 
	public ShiftSupervisor() {
		
	}
	
	// Overloaded 
	public ShiftSupervisor(Double supervisorAnnualSalary, Double supervisorAnnualBonus) {
		super();
		this.supervisorAnnualSalary = supervisorAnnualSalary;
		this.supervisorAnnualBonus = supervisorAnnualBonus;
	}


	// Getters and Setters
	public Double getSupervisorAnnualSalary() {
		return supervisorAnnualSalary;
	}



	public void setSupervisorAnnualSalary(Double supervisorAnnualSalary) {
		this.supervisorAnnualSalary = supervisorAnnualSalary;
	}



	public Double getSupervisorAnnualBonus() {
		return supervisorAnnualBonus;
	}



	public void setSupervisorAnnualBonus(Double supervisorAnnualBonus) {
		this.supervisorAnnualBonus = supervisorAnnualBonus;
	} 
	
	
	
		

}
