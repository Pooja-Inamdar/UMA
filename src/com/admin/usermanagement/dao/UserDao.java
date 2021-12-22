
package com.admin.usermanagement.dao;

import java.sql.Connection;

import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.admin.usermanagement.bean.User;

public class UserDao {
	private String jdbcURL = "jdbc:oracle:thin:@localhost:1521:XE";
	private String jdbcUsername = "hr";
	private String jdbcPassword = "hr";

	private static final String INSERT_USERS_SQL = "INSERT INTO users" + "  (id , name, email, country , role) VALUES "
			+ " (UMP.NEXTVAL,?,?,?,?)";

	private static final String SELECT_USER_BY_ID = "select id,name,email,country , role from users where id =?";
	private static final String SELECT_ALL_USERS = "select * from users";
	private static final String DELETE_USERS_SQL = "delete from users where id = ?";
	private static final String UPDATE_USERS_SQL = "update users set name = ?,email= ?, country =? , role=? where id = ?";

	public UserDao() {
	}

	protected Connection getConnection() {
		Connection connection = null;
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		return connection;
	}

	public int insertUser(User user) throws SQLException {
		int flag = 0;
		System.out.println(INSERT_USERS_SQL);
		// try-with-resource statement will auto close the connection.
		try {
			Connection connection = getConnection();
			PreparedStatement ps = connection.prepareStatement("Select * from users where name=?");
			ps.setString(1, user.getName());
			ResultSet rs = ps.executeQuery();

			if (rs.next()) {
				flag = 1;
				System.out.println("User Exists!");
			} else {
				PreparedStatement preparedStatement = connection.prepareStatement(INSERT_USERS_SQL);
				preparedStatement.setString(1, user.getName());
				preparedStatement.setString(2, user.getEmail());
				preparedStatement.setString(3, user.getCountry());
				preparedStatement.setString(4, user.getRole());
				System.out.println(preparedStatement);
				preparedStatement.executeUpdate();
			}

			connection.close();
		} catch (SQLException e) {
			printSQLException(e);
		}
		return flag;
	}

	public User selectUser(int id) {
		User user = null;
		// Step 1: Establishing a Connection
		try (Connection connection = getConnection();
				// Step 2:Create a statement using connection object
				PreparedStatement preparedStatement = connection.prepareStatement(SELECT_USER_BY_ID);) {
			preparedStatement.setInt(1, id);
			System.out.println(preparedStatement);
			// Step 3: Execute the query or update query
			ResultSet rs = preparedStatement.executeQuery();

			// Step 4: Process the ResultSet object.
			while (rs.next()) {
				String name = rs.getString("name");
				String email = rs.getString("email");
				String country = rs.getString("country");
				String role = rs.getString("role");
				user = new User(id, name, email, country, role);
				// connection.close();
			}

		} catch (SQLException e) {
			printSQLException(e);
		}
		return user;
	}

	public List<User> selectAllUsers() {

		// using try-with-resources to avoid closing resources (boiler plate code)
		List<User> users = new ArrayList<>();
		// Step 1: Establishing a Connection
		try (Connection connection = getConnection();

				// Step 2:Create a statement using connection object
				PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_USERS);) {
			System.out.println(preparedStatement);
			// Step 3: Execute the query or update query
			ResultSet rs = preparedStatement.executeQuery();

			// Step 4: Process the ResultSet object.
			while (rs.next()) {
				int id = rs.getInt("id");
				String name = rs.getString("name");
				String email = rs.getString("email");
				String country = rs.getString("country");
				String role = rs.getString("role");
				users.add(new User(id, name, email, country, role));
				// connection.close();
			}
		} catch (SQLException e) {
			printSQLException(e);
		}
		return users;
	}

	public boolean deleteUser(int id) throws SQLException {
		boolean rowDeleted;
		try (Connection connection = getConnection();
				PreparedStatement statement = connection.prepareStatement(DELETE_USERS_SQL);) {
			statement.setInt(1, id);
			rowDeleted = statement.executeUpdate() > 0;
			// connection.close();
		}
		return rowDeleted;
	}

	public int updateUser(User user) throws SQLException {
		int rowUpdated = 0;
		int flag = 0;
		System.out.println(UPDATE_USERS_SQL);
		// try-with-resource statement will auto close the connection.
		try {
			Connection connection = getConnection();
			PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_USERS_SQL);

			preparedStatement.setString(1, user.getName());
			preparedStatement.setString(2, user.getEmail());
			preparedStatement.setString(3, user.getCountry());
			preparedStatement.setString(4, user.getRole());
			preparedStatement.setInt(5, user.getId());
			System.out.println(preparedStatement);
			rowUpdated = preparedStatement.executeUpdate();

			connection.close();
		} catch (SQLException e) {
			printSQLException(e);
		}
		return flag;

	}

	/*
	 * try (Connection connection = getConnection(); PreparedStatement statement =
	 * connection.prepareStatement(UPDATE_USERS_SQL);) {
	 * System.out.println("updated USer:" + statement); statement.setString(1,
	 * user.getName()); statement.setString(2, user.getEmail());
	 * statement.setString(3, user.getCountry()); statement.setString(4,
	 * user.getRole()); statement.setInt(5, user.getId());
	 * 
	 * rowUpdated = statement.executeUpdate() > 0; // connection.close(); }
	 */
	// return rowUpdated;

	private void printSQLException(SQLException ex) {
		for (Throwable e : ex) {
			if (e instanceof SQLException) {
				e.printStackTrace(System.err);
				System.err.println("SQLState: " + ((SQLException) e).getSQLState());
				System.err.println("Error Code: " + ((SQLException) e).getErrorCode());
				System.err.println("Message: " + e.getMessage());
				Throwable t = ex.getCause();
				while (t != null) {
					System.out.println("Cause: " + t);
					t = t.getCause();
				}
			}
		}
	}

	public int checkUser(User user) {
		Connection connection = getConnection();
		PreparedStatement ps;
		int flag = 0;
		try {
			ps = connection.prepareStatement("Select * from users where name=? and id != ?");
			ps.setString(1, user.getName());
			ps.setInt(2, user.getId());
			ResultSet rs = ps.executeQuery();

			if (rs.next()) {

				flag =1;
				System.out.println("User Already Exists!");
				
			}

		} catch (SQLException e) {

			e.printStackTrace();
		}
		return flag;
	}

}