/**
 * 
 */
package edu.cvtc.java;

/**
 * @author david.kittle
 *
 */
public class LawnAndGardenTestProgram {

	public static void main(String[] args) {
		
		// Declare our objects 
		// Customer Objects 
		Customer james = new Customer();
		Customer amber = new Customer();
		Customer hannah = new Customer();
		Customer ryan = new Customer();
		Customer chris = new Customer();
		
		// Service Objects 
		Service hedgeCutting = new Service();
		Service mowing = new Service();
		Service planting = new Service();
		Service weedKilling = new Service();
		
		// SignupSheet Object 
		SignupSheet jamesList = new SignupSheet();
		SignupSheet amberList = new SignupSheet();
		SignupSheet hannahList = new SignupSheet();
		SignupSheet ryanList = new SignupSheet();
		SignupSheet chrisList = new SignupSheet();
		
		
		// Fill the object with information 
		james.setFirstName("James");
		james.setLasName("Thomas");
		james.setAddress("123 Internet St");
		james.setPhoneNumber("(715) 555 1213");
		james.setEmailAddress("jthomas@cvtc.edu");
		
		amber.setFirstName("Amber");
		amber.setLasName("Taylor");
		amber.setAddress("124 Internet St");
		amber.setPhoneNumber("(715) 555 1214");
		amber.setEmailAddress("ataylor@cvtc.edu");
		
		hannah.setFirstName("Hannah");
		hannah.setLasName("Clark");
		hannah.setAddress("125 Internet St");
		hannah.setPhoneNumber("(715) 555 1215");
		hannah.setEmailAddress("hclark@cvtc.edu");
		
		ryan.setFirstName("Ryan");
		ryan.setLasName("Brooks");
		ryan.setAddress("126 Internet St");
		ryan.setPhoneNumber("(715) 555 1216");
		ryan.setEmailAddress("rbrooksr@cvtc.edu");
		
		chris.setFirstName("Chris");
		chris.setLasName("Martin");
		chris.setAddress("127 Internet St");
		chris.setPhoneNumber("(715) 555 1217");
		chris.setEmailAddress("cmartin@cvtc.edu");
		
		// Fill out service information 
		hedgeCutting.setServiceName("Hedge Cutting");
		hedgeCutting.setServiceDescription("Cutting the hedges. ");
		hedgeCutting.setServiceCost(5.00);

		mowing.setServiceName("Lawn Mowing");
		mowing.setServiceDescription("Mowing your lawn. ");
		mowing.setServiceCost(10.00);
		
		planting.setServiceName("Planting");
		planting.setServiceDescription("Planting Flowers. ");
		planting.setServiceCost(20.00);
		
		weedKilling.setServiceName("Weed Killing");
		weedKilling.setServiceDescription("Killing weeds");
		weedKilling.setServiceCost(30.00);
		
		
		// Set Service for each Customer
		Service[] jamesService = {hedgeCutting};
		Service[] amberService = {mowing};
		Service[] hannahService = {planting};
		Service[] ryanService = {weedKilling};
		Service[] chrisService = {hedgeCutting, mowing, planting, weedKilling};
		
		// Fill in SighupSheet Objects
		jamesList.setCustomer(james);
		jamesList.setService(jamesService);
		
		amberList.setCustomer(amber);
		amberList.setService(amberService);
		
		hannahList.setCustomer(hannah);
		hannahList.setService(hannahService);
		
		ryanList.setCustomer(ryan);
		ryanList.setService(ryanService);
		
		chrisList.setCustomer(chris);
		chrisList.setService(chrisService);
		
		
		// Build an Signup array for looping
		SignupSheet[] signUpSheet = {jamesList, amberList, hannahList, ryanList, chrisList}; 
		
		// Show services listed for each custommer
		for (int j = 0; j < signUpSheet.length; j++) {
			
			System.out.println("\n-- Customer --"); 
			
			System.out.println("Customer Name: " + signUpSheet[j].getCustomer().getFirstName() + " " 
																					 + signUpSheet[j].getCustomer().getLastName()); 
			
			System.out.println("Address: " + signUpSheet[j].getCustomer().getAddres());
			
			System.out.println("Phone Number: " + signUpSheet[j].getCustomer().getPhoneNumber());
			
			System.out.println("Email Address: " + signUpSheet[j].getCustomer().getEmailAddress());
			
			System.out.println("\n-- Services --"); 
			
			for (int i = 0; i < signUpSheet[j].getService().length; i++) {
				
				System.out.println("Service # " + (i + 1));
				System.out.println("Sertvice Name: "+ signUpSheet[j].getService()[i].getServiceName());
				System.out.println("Sertvice Description: "+ signUpSheet[j].getService()[i].getServiceDescription());
				System.out.println("Sertvice Cost: $"+ signUpSheet[j].getService()[i].getServiceCost());
				System.out.println(" ");
				
			}
		}
	
		
	}

}
