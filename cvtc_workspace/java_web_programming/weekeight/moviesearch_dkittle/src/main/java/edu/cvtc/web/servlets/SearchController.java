package edu.cvtc.web.servlets;

import java.io.IOException;
import java.util.List;
import java.util.stream.Collectors;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import edu.cvtc.web.dao.MovieDao;
import edu.cvtc.web.dao.impl.MovieDaoException;
import edu.cvtc.web.dao.impl.MovieDaoImpl;
import edu.cvtc.web.model.Movie;

/**
 * Servlet implementation class SearchController
 */
@WebServlet("/Search")
public class SearchController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String target = null; 
		

		
		final MovieDao movieDao = new MovieDaoImpl(); 
		  List<Movie> movie = null;
		try {
			movie = movieDao.retrieveMovie();
		} catch (MovieDaoException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		  
		  
		  final String title = request.getParameter("title");
		  final String director = request.getParameter("director");
		  
		  
		  final List<Movie> filteredMovies = movie
				  							.stream()
				  							.filter((movies) -> movies.getTitle().equalsIgnoreCase(title) 
				  									|| movies.getDirector().equalsIgnoreCase(director) )
				  							
				  							.collect(Collectors.toList());
		  
		  request.setAttribute("movie", filteredMovies);
		  
		  target ="view-all.jsp";
		
		request.getRequestDispatcher(target).forward(request, response);

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
