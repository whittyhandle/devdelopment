package edu.cvtc.web.servlets;

import java.io.IOException;
import java.util.Collections;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import edu.cvtc.web.comparators.DirectorComparator;
import edu.cvtc.web.comparators.LengthInMinutesComparator;
import edu.cvtc.web.comparators.TitleComparator;
import edu.cvtc.web.dao.MovieDao;
import edu.cvtc.web.dao.impl.MovieDaoException;
import edu.cvtc.web.dao.impl.MovieDaoImpl;
import edu.cvtc.web.model.Movie;

/**
 * Servlet implementation class ViewAllController
 */
@WebServlet("/ViewAll")
public class ViewAllController extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String target = null;
		List<Movie> movie = null;
		
		final MovieDao movieDao = new MovieDaoImpl();
		  
		try {
			movie = movieDao.retrieveMovie();
		} catch (MovieDaoException e) {
			e.printStackTrace();	
		}

		  
		  final String sortType = request.getParameter("sortType");
		  
		  if (sortType != null) {
			  sortMovie(movie, sortType);
		  }
		  
		  request.setAttribute("movie", movie);
		  
		  target ="view-all.jsp";
		
		request.getRequestDispatcher(target).forward(request, response);
		
	}

	private void sortMovie(final List<Movie> movie, final String sortType) {
		switch (sortType) {
		  
			case "title":
				Collections.sort(movie, new TitleComparator());
				break;
			case "director":
				Collections.sort(movie, new DirectorComparator());
				break;
			case "lengthInMinutes":
				Collections.sort(movie, new LengthInMinutesComparator());
				break;
			default:
				break;
		  
		  }
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doGet(request, response);
	}

}
