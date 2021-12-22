
package com.admin.usermanagement.web;

import java.io.IOException;


import java.sql.SQLException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.admin.usermanagement.bean.LoginBean;
import com.admin.usermanagement.dao.LoginDao;

@WebServlet("/LOGIN1")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/*
	 * private LoginDao loginDao;
	 * 
	 * public void init() { loginDao = new LoginDao(); }
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		LoginBean loginBean = new LoginBean();
		loginBean.setUsername(username);
		loginBean.setPassword(password);

		try {
			boolean isSuccess = LoginDao.validate(loginBean);
			if (isSuccess) {
				String username1 = request.getParameter("username");
				HttpSession session = request.getSession();
				session.setAttribute("username", username1);
				System.out.println(username1);

				String userRole = LoginDao.getUserRole(username1);
				
				String role = userRole;
				HttpSession session1 = request.getSession();
				session.setAttribute("role", role);
				response.sendRedirect("list");
			} else {

				request.getRequestDispatcher("LOGIN1.jsp").include(request, response);
				out.print("<span style='color:crimson; margin-left:25px;'>Invalid username or password!!</span>");

			}
		} catch (SQLException e) {
			e.printStackTrace();

		}

	}
}