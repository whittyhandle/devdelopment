/**
 * 
 */
package edu.cvtc.web;

import java.io.File;
import java.io.IOException;
import java.util.List;

import org.apache.poi.openxml4j.exceptions.InvalidFormatException;
import org.apache.poi.ss.util.WorkbookUtil;

import edu.cvtc.web.model.Person;
import edu.cvtc.web.util.WorkbookUtility;

/**
 * @author david.kittle
 *
 */
public class JavaIOExample {
	
	private static final String INPUT_FILE = "WebContent/assets/JavaWebProgramming.xlsx";
	
	/**
	 * @param args
	 */
	public static void main(String[] args) {
		// Notes: Use an input file to print a list of people to the console 
		
		final File inputFile = new File(INPUT_FILE);
		
		try {
			final List<Person> people = WorkbookUtility.retrievePeopleFromWorkBook(inputFile);
			
			for (final Person person : people) {
				// System.out.println(person.getFavoriteColor());
				if (person.getFavoriteColor().equals("Green")) {
					System.out.println(person);
				}
			}
			
		} catch(InvalidFormatException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		

	}

}
