/**
 * 
 */
package edu.cvtc.java;

/**
 * @author david.kittle
 *
 */
public class RoomDimension {
	
	private float length; 
	private float width;  
	
	public RoomDimension(float lenght, float width) {
		this.length = 0;
		this.width = 0;
	}

	public float  getLength() {
		return length;
	}
	
	public void setLength(float length) {
		this.length = length;
	}
	
	public float getWidth() {
		return width;
	}
	
	public void setWidth(float width) {
		this.width = width;
	}
	
	
	public float getArea() {
		return length * width; 
	}
	

	
	

}
