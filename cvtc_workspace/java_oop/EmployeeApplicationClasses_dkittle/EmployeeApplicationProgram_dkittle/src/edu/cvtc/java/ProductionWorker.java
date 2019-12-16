/**
 * 
 */
package edu.cvtc.java;

/**
 * @author david.kittle
 *
 */
public class ProductionWorker extends Employee{
	// Variables
	private Integer workerShift;
	private Double workerPayRate; 
	
	
	
	// Default Constructor 
	public ProductionWorker() {
		
	}


	// Overloaded 
	public ProductionWorker(Integer workerShift, Double workerPayRate) {
		super();
		this.workerShift = workerShift;
		this.workerPayRate = workerPayRate;
	}
	
	
	// Getters and Setters 
	public Integer getWorkerShift() {
		return workerShift;
	}


	public void setWorkerShift(Integer workerShift) {
		this.workerShift = workerShift;
	}


	public Double getWorkerPayRate() {
		return workerPayRate;
	}


	public void setWorkerPayRate(Double workerPayRate) {
		this.workerPayRate = workerPayRate;
	}
	

	
	
	
	

}
