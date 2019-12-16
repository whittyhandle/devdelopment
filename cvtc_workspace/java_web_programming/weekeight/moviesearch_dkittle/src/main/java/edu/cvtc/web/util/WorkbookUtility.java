/**
 * 
 */
package edu.cvtc.web.util;

import java.util.ArrayList;
import java.util.List;
import java.io.File;
import java.io.IOException;

import edu.cvtc.web.model.Movie;

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

	public static void main(String[] args) {
		

		final File inputFile = new File(INPUT_FILE);
		
		try {
			  final List<Movie> movie = WorkbookUtility.retrieveMovieFromWorkBook(inputFile);
			  
			  for (final Movie myMovie : movie) {
			      System.out.println(myMovie);
			    }
			  
			} catch(InvalidFormatException e) {
			  e.printStackTrace();
			} catch (IOException e) {
			  e.printStackTrace();
			}
			  
	}
	
	public static final String INPUT_FILE = "assests/movies.xlsx";
	
	public static List<Movie> retrieveMovieFromWorkBook(final File inputFile) throws InvalidFormatException, IOException {
		
			final List<Movie> movie = new ArrayList<>();
			
			final Workbook workbook = WorkbookFactory.create(inputFile);
	 		
			final Sheet sheet = workbook.getSheetAt(0);
			
			for (final Row row : sheet) {
				final Cell titelCell = row.getCell(0);
				final Cell directorCell = row.getCell(1);
				final Cell lengthInMinutesCell = row.getCell(2);
	
			
				final Movie movies = new Movie(
						titelCell.getStringCellValue().trim(),
						directorCell.getStringCellValue().trim(),
						(int) lengthInMinutesCell.getNumericCellValue());
				
			movie.add(movies);
			
		
		}
			return movie;

	}
}

