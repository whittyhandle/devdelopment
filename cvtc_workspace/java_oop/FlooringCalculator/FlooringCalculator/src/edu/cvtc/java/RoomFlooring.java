/**
 * 
 */
package edu.cvtc.java;

/**
 * @author david.kittle
 *
 */
public class RoomFlooring {
	
	private float costPerFoot;
	private RoomDimension room;
	
	public RoomFlooring(float length, float width, float costPerFoot) {
		this.costPerFoot = costPerFoot; 
		this.room = new RoomDimension(length, width);
	}

	public float  getcostPerFoot() {
		return costPerFoot;
	}
	
	public void setcostPerFoot(float costPerFoot) {
		this.costPerFoot = costPerFoot;
	}
	
	public float gettotalCost(RoomDimension room) {
		return costPerFoot * room.getArea();
		
	}
	
		
}
