/**
 * 
 */
package edu.cvtc.java;

/**
 * @author david.kittle
 *
 */
public class ObjectTwo {

  Integer testThree;
  ObjectOne objPassed;

  public ObjectTwo(Integer testOne, Integer testTwo, Integer testThree) {
      this.testThree = testThree;
      this.objPassed = new ObjectOne (testOne, testTwo);

  }

  public Integer sumOfTest(Integer testOne, Integer testTwo, Integer testThree){
      return  testOne + testTwo + testThree;
  }
}
