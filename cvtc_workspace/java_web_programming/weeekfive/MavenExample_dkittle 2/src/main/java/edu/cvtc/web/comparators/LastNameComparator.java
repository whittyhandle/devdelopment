/**
 * 
 */
package edu.cvtc.web.comparators;

import java.util.Comparator;

import edu.cvtc.web.model.Person;

/**
 * @author david.kittle
 *
 */
public class LastNameComparator implements Comparator<Person> {

	@Override
	public int compare(final Person person1, final Person person2) {
		// Notes One Method: 
		// make 2 stings variable and compare 
		//String firstPersonsLastName = person1.getLastName();
		//String secondPersonsLastName = person2.getLastName();
		
		// Notes: if first person comes before the second person it returns a negative integer 
		// If second person comes before first person it returns a positive integer 
		// If equal then it will return a zero 
		//return firstPersonsLastName.compareTo(secondPersonsLastName);
		
		// Notes: shortcut 
		return person1.getLastName().compareTo(person2.getLastName());
	}

}
