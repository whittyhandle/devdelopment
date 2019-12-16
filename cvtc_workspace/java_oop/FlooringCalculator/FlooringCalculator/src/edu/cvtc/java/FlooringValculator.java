/**
 * 
 */
package edu.cvtc.java;

import java.util.Scanner;

/**
 * @author david.kittle
 *
 */
public class FlooringValculator {

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		float length; 
		float width; 
		float costPerFoot; 
		
		// Create Scanner object for keyboard input 
		Scanner input = new Scanner(System.in);
				
		// Get the length,width and cost per foot form the user	
		System.out.print("Enter the length: ");
		length = input.nextFloat();
		System.out.print("Enter the width: ");
		width = input.nextFloat();	
		System.out.print("Enter the cost: ");
		costPerFoot = input.nextFloat();
		RoomDimension room = new RoomDimension(length, width);
		RoomFlooring roomFlooring = new RoomFlooring(length, width, costPerFoot);
		
		
		// Pass the length, width, and cost to the setter methods for  each object 
		room.setLength(length);
		room.setWidth(width);
		
		//Display the length, width, area and total cost		
		System.out.println("Room Length " + room.getLength());
		System.out.println("Room Width " + room.getWidth());
		System.out.println("Room Area 1 " + room.getArea());
		System.out.println("Cost per foot " + roomFlooring.getcostPerFoot());
		System.out.println("Total Cost " + roomFlooring.gettotalCost(room));

	}
	

}
