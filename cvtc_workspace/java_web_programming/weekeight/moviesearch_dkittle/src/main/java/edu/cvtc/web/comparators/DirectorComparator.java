/**
 * 
 */
package edu.cvtc.web.comparators;

import java.util.Comparator;

import edu.cvtc.web.model.Movie;

/**
 * @author david.kittle
 *
 */
public class DirectorComparator implements Comparator<Movie> {

	@Override
	public int compare(final Movie movie1, final Movie movie2) {
		return movie1.getDirector().compareTo(movie2.getDirector());
	}

}