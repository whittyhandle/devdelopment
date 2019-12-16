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
public class AgeComparator implements Comparator<Person>{
	
	@Override
	public int compare(final Person person1, final Person person2) {
		return person1.getAge().compareTo(person2.getAge());
		
	}

}
