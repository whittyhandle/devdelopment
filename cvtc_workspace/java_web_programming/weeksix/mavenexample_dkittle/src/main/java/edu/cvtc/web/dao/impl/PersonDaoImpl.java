/**
 * 
 */
package edu.cvtc.web.dao.impl;

import java.io.File;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import org.apache.poi.openxml4j.exceptions.InvalidFormatException;

import edu.cvtc.web.dao.PersonDao;
import edu.cvtc.web.model.Person;
import edu.cvtc.web.util.DBUtility;
import edu.cvtc.web.util.WorkbookUtility;

/**
 * @author david.kittle
 *
 */
public class PersonDaoImpl implements PersonDao {
	
	private static final String DROP_TABLE_PERSON = "drop table if exists person;";
	private static final String CREATE_TABLE_PERSON = "create table person "
			+ "(id integer primary key autoincrement, firstName text, lastName text, age integer, favoriteColor text);";
	private static final String SELECT_ALL_FROM_PERSON = "select * from person;";

	@Override
	public void populate(final String filePath) throws PersonDaoException {
		// Note Populate the database 
		Connection connection = null; 
		Statement statement = null; 
		
		try {
			connection = DBUtility.createConnection();
			statement = connection.createStatement();
			
			statement .setQueryTimeout(DBUtility.TIMEOUT);
			
			statement.executeUpdate(DROP_TABLE_PERSON);
			statement.executeUpdate(CREATE_TABLE_PERSON);
			
			// Populate Person table using WorkbookUtility
			final File inputFile = new File(filePath);
			final List<Person> people = WorkbookUtility.retrievePeopleFromWorkBook(inputFile);
			
			
			for (final Person person : people) {
				final String insertValues = "insert into person (firstName, lastName, age, favoriteColor) "
						+ "values ('" + person.getFirstName() + "', "
								+ "'" + person.getLastName() + "', "
										+ person.getAge() + ","
												+ "'" + person.getFavoriteColor() + "');";
				
				System.out.println(insertValues); // Notes: Log a message to the console so we can see the data being added to the database.
				
				statement.executeUpdate(insertValues);
			}
			
		} catch (ClassNotFoundException | SQLException | InvalidFormatException | IOException e) {
			e.printStackTrace();	
			throw new PersonDaoException("Error unable to populate the database. ");
		} finally {
			DBUtility.closeConnection(connection, statement);
		}
	}

	@Override
	public List<Person> retrievePeople() throws PersonDaoException {
		// Note  retrieve List of Person Object from the database
		
		// Create the list of people that will populate and then return
		final List<Person> people = new ArrayList<>();
		
		Connection connection = null; 
		Statement statement = null; 
		
		try {
			
			// Create the database connection
			connection = DBUtility.createConnection();
			
			// Create an executable statement using the db connection
			statement = connection.createStatement();
			
			statement.setQueryTimeout(DBUtility.TIMEOUT);
			
			// Execute the select all SQL statement 
			final ResultSet resultSet = statement.executeQuery(SELECT_ALL_FROM_PERSON);
			
			// loop through our result set (a collection of rows from the person databse table)
			
			while(resultSet.next()) {
				
				// get the data necessary to create the Person object from our result set
				final String firstName = resultSet.getString("firstName");
				final String lastName = resultSet.getString("lastName");
				final int age = resultSet.getInt("age");
				final String favoriteColor = resultSet.getString("favoriteColor");
				
				// create a new Person object and add it to our list of people 
				people.add(new Person(firstName, lastName, age, favoriteColor));
				
				
			}
			
			
			
			
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
			throw new PersonDaoException("Error: Unable to retrieve people");
		}
		
		// return the list of people 
		return people; 
		
	}

	@Override
	public void insertPerson(Person person) throws PersonDaoException {
		// Note insert a new Person object in the database
		Connection connection = null;
		PreparedStatement insertStatement = null; 
		
		try {
			
			connection = DBUtility.createConnection();
			
			// create a SQL string to insert a row into the person table.
			// the question marks are parameter stand-ins for data that will be provided for later 
			
			final String sqlStatement = "insert into person (fistName, lastName, age, favoriteColor) values (?, ?, ?, ?)";
			
			// prepare the sql as a statement 
			insertStatement = connection.prepareStatement(sqlStatement);
			
			// get the data from the Person object and assign it to our prepared statement 
			// the numbers specify the order these parameters will be assigned in the statemtent 
			// 1 will go the first question make, 2 to the second and so on 
			insertStatement.setString(1, person.getFirstName());
			insertStatement.setString(2, person.getLastName());
			insertStatement.setInt(3, person.getAge());
			insertStatement.setString(4, person.getFavoriteColor());
			
			insertStatement.setQueryTimeout(DBUtility.TIMEOUT);
			
			insertStatement.executeQuery();
			
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
			throw new PersonDaoException("Error: Unable to add person the the databse ");
			
		}

	}

}
