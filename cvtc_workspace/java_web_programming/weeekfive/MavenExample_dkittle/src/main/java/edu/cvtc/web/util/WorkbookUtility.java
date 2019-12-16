/**
 * 
 */
package edu.cvtc.web.util;

import java.util.ArrayList;
import java.util.List;
import java.io.File;
import java.io.IOException;

import edu.cvtc.web.model.Person;

import org.apache.poi.openxml4j.exceptions.InvalidFormatException;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet; 
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.ss.usermodel.WorkbookFactory;

/**
 * @author david.kittle
 *
 */
public class WorkbookUtility {
	
	public static final String INPUT_FILE = "assets/JavaWebProgramming.xlsx";
	//public static final String INPUT_FILE = "WebContent/assets/JavaWebProgramming.xlsx";
	
	public static List<Person> retrievePeopleFromWorkBook( final File inputFile) throws InvalidFormatException, IOException{
		
		final List<Person> people = new ArrayList<>();
		
		//Notes: create a workbook from the input file 
		final Workbook workbook = WorkbookFactory.create(inputFile); 
		
		final Sheet sheet = workbook.getSheetAt(0);
		
		//Notes: iterate over each row in the worksheet from the workbook 
		
		for (final Row row : sheet) {
			final Cell firstNameCell = row.getCell(0);
			final Cell lastNameCell = row.getCell(1);
			final Cell ageCell = row.getCell(2);
			final Cell favoriteColorCell = row.getCell(3);
			
			//Notes: create a new person object for each row in the worksheet 
			final Person person = new Person(
									firstNameCell.getStringCellValue().trim(),
									lastNameCell.getStringCellValue().trim(),
									(int) ageCell.getNumericCellValue(), 
									favoriteColorCell.getStringCellValue().trim()); 
			
			//Notes: add each person the out list of people 
			people.add(person); 
			
		}
		
		
		
		return people; 
		
	}
	

}
