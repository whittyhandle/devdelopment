package edu.cvtc.web.servlets;

import java.io.File;
import java.io.IOException;
import java.util.Collections;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.openxml4j.exceptions.InvalidFormatException;

import edu.cvtc.web.comparators.AgeComparator;
import edu.cvtc.web.comparators.FavoriteColorComparator;
import edu.cvtc.web.comparators.FirstNameComparator;
import edu.cvtc.web.comparators.LastNameComparator;
import edu.cvtc.web.model.Person;
import edu.cvtc.web.util.WorkbookUtility;

/**
 * Servlet implementation class ViewAllController
 */
@WebServlet("/ViewAll")
public class ViewAllController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// Get the path to the student data in excel spreadsheet with the correct context for our servlet 
		final String fileName = getServletContext().getRealPath(WorkbookUtility.INPUT_FILE); 
		
		
		// Create a file object using the path to the student data excel spreadsheet
		final File inputFile = new File(fileName);
		
		// Set up a variable named target. This variable will hold the name of the View that we want out 
		// controller to return.
		String target = "view-all.jsp";
		
		
		try {
			
			// fetch the data from the student data spreadsheet
			// this is populating our Model since we are creating a list of Person objects
			final List<Person> people = WorkbookUtility.retrievePeopleFromWorkBook(inputFile);
			
			final String sortType = request.getParameter("sortType");
			
			
			// function to sort people based on navigation.jsp 
			// needed a way to determine if the sory type was being passed (unsorted)
			if (sortType != null) {
				sortPeople(people, sortType);	
			}

			
			// attach our list of people the the request object
			// This attaches our Model to the request object so that it will be available to our View
			request.setAttribute("people", people);
			
		} catch (InvalidFormatException e) {
			e.printStackTrace();
			throw new IOException("The workbook file has an invalid format"); 
		}
		
		// All the necessary processing has been done, the Model has been populated, so now we return the View
		// Technically we are forwarding the request object to the target we specified. This mean
		// we are essentially repacking the request we received and sending a new request for "view-all.jsp"
		request.getRequestDispatcher(target).forward(request, response);
	}

	private void sortPeople(final List<Person> people, final String sortType) {
		switch (sortType) {
		case "lastName":
			Collections.sort(people, new LastNameComparator());
			break;
		case "age":
			Collections.sort(people, new AgeComparator());
			break;
		case "favoriteColor":
			Collections.sort(people, new FavoriteColorComparator());
			break;
		case "firstName":
			Collections.sort(people, new FirstNameComparator());
		default:
			break;
		}
	}
	
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}