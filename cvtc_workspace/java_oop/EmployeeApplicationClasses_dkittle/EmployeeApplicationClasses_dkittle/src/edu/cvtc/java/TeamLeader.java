/**
 * 
 */
package edu.cvtc.java;

/**
 * @author david.kittle
 *
 */
public class TeamLeader extends ProductionWorker{
	
	// Variables 
	private Double teamLeaderMonthlyBonus;
	private Double teamLeaderTrainingHours;
	private Double teamLeadertrainHoursAttended;
	
	
	
	// Default Constructor 
	public TeamLeader() {
		
	
	}

	// Overloaded 
	public TeamLeader(Double teamLeaderMonthlyBonus, Double teamLeaderTrainingHours,
			Double teamLeadertrainHoursAttended) {
		super();
		this.teamLeaderMonthlyBonus = teamLeaderMonthlyBonus;
		this.teamLeaderTrainingHours = teamLeaderTrainingHours;
		this.teamLeadertrainHoursAttended = teamLeadertrainHoursAttended;
	}
	
	// Getters and Setters 
	public Double getTeamLeaderMonthlyBonus() {
		return teamLeaderMonthlyBonus;
	}

	public void setTeamLeaderMonthlyBonus(Double teamLeaderMonthlyBonus) {
		this.teamLeaderMonthlyBonus = teamLeaderMonthlyBonus;
	}

	public Double getTeamLeaderTrainingHours() {
		return teamLeaderTrainingHours;
	}

	public void setTeamLeaderTrainingHours(Double teamLeaderTrainingHours) {
		this.teamLeaderTrainingHours = teamLeaderTrainingHours;
	}

	public Double getTeamLeadertrainHoursAttended() {
		return teamLeadertrainHoursAttended;
	}

	public void setTeamLeadertrainHoursAttended(Double teamLeadertrainHoursAttended) {
		this.teamLeadertrainHoursAttended = teamLeadertrainHoursAttended;
	}
	


	
	
	

}
