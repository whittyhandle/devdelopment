/**
 * 
 */
package edu.cvtc.java;

/**
 * @author david.kittle
 *
 */
public class Geometry {
	
	public static double area(double radius) {
		return Math.PI * Math.pow(radius, 2);
	}
	
	public static double area(double length, double width) {
		return length * width;
	}
	
	public static double area(float base, float height) {
		return base * height * .05;
	}
}
