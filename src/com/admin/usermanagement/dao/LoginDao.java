package com.admin.usermanagement.dao;

import java.sql.Connection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.admin.usermanagement.bean.LoginBean;

public class LoginDao {

	public static boolean validate(LoginBean loginBean) throws SQLException {

		UserDao userdao = new UserDao();
		Connection connection = userdao.getConnection();
		boolean status = false;

		try (PreparedStatement preparedStatement = connection
				.prepareStatement("select * from user_table where username=? and password=?")) {

			preparedStatement.setString(1, loginBean.getUsername());
			preparedStatement.setString(2, loginBean.getPassword());

			System.out.println(preparedStatement);
			ResultSet rs = preparedStatement.executeQuery();

			if (rs.next())
				status = true;

			// connection.close();
		} catch (SQLException e) {

			printSQLException(e);
		}
		return status;
	}

	private static void printSQLException(SQLException ex) {
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

	public static String getUserRole(String username1) {
		UserDao userdao = new UserDao();
		Connection connection = userdao.getConnection();
		String status = "";

		try {
			PreparedStatement preparedStatement = connection
					.prepareStatement("select * from users where name=?");

			preparedStatement.setString(1,username1);
		
			System.out.println(preparedStatement);
			ResultSet rs = preparedStatement.executeQuery();

			if (rs.next()) {
				status = rs.getString(5);
				System.out.println(status);
			}
			// connection.close();
		} catch (SQLException e) {

			printSQLException(e);
		}
		return status;
		
	}

}