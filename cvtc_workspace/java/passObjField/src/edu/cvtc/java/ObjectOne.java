/**
 * 
 */
package edu.cvtc.java;

/**
 * @author david.kittle
 *
 */
public class ObjectOne {

  Integer testOne;
  Integer testTwo;

  public ObjectOne(Integer testOne, Integer testTwo) {
      this.testOne = testOne;
      this.testTwo = testTwo;
  }


  public Integer getTestOne() {
      return testOne;
  }

  public void setTestOne(Integer testOne) {
      if (testOne < 1){
          System.out.println("Invalid - testOne");
      } else{
          this.testOne = testOne;
      }

  }

  public Integer getTestTwo() {
      return testTwo;
  }

  public void setTestTwo(Integer testTwo) {
      if (testTwo < 1){
          System.out.println("Invalid - testTwo");
      } else{
          this.testTwo = testTwo;
      }

  }
}
