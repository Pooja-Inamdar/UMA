<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.PreparedStatement"%>
<%@ page import="java.sql.ResultSet"%>
<html>
<head>
<title>User Management Application</title>

<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script> -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<!-- <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.css" />
    <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.js"></script> -->
<script>
	function Function() {
		location.replace("list")
	}
</script>
</head>
<body>

	<header>
		<nav class="navbar navbar-expand-sm navbar-dark"
			style="background-color: blue">
			<div>
				<h3 class="navbar-brand">User Management Application</h3>
			</div>

			<%-- <ul class="navbar-nav">
				<li><a href="<%=request.getContextPath()%>/list"
					class="nav-link">Users</a></li>
			</ul> --%>
		</nav>
	</header>
	<br>
	<div class="container col-md-5">
		<div class="card">
			<div class="card-body">
				<c:if test="${user != null}">
					<form action="update" method="post">
				</c:if>

				<caption>
					<h2>
						<c:if test="${user != null}">
            			Edit User
						</c:if>
					</h2>
				</caption>

				<c:if test="${user != null}">
					<input type="hidden" name="id" value="<c:out value='${user.id}' />" />
				</c:if>

				<fieldset class="form-group">
					<label>User Name</label> <input type="text"
						value="<c:out value='${user.name}' />" class="form-control"
						name="name" pattern="[A-Za-z]{1,255}" required="required"
						maxlength="10">
				</fieldset>

				<fieldset class="form-group">
					<label>User Email</label> <input type="text"
						pattern=[a-zA-Z0-9.!#$%&’*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*
						value="<c:out value='${user.email}' />" class="form-control"
						name="email" required="required" maxlength="22">
				</fieldset>
				<fieldset class="form-group">
					<label>User Country</label>
					<%-- <input list="country" type="text"
						value="<c:out value='${user.country}' />" class="form-control"
						name="country" required="required"> --%>
					<select name="country" class="form-control">
						<!-- <option value="-1">Select Country</option> -->
						<%
						try {
							String query = "select * from country";
							String jdbcURL = "jdbc:oracle:thin:@localhost:1521:XE";
							String jdbcUsername = "hr";
							String jdbcPassword = "hr";
							Connection connection = null;
							String country = "${user.country}";

							Class.forName("oracle.jdbc.driver.OracleDriver");
							connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
							PreparedStatement st = connection.prepareStatement(query);
							ResultSet rs = st.executeQuery();
							while (rs.next()) {
								if (rs.getString(2) == country) {
						%>

						<option value="<%=rs.getString(2)%>"><%=rs.getString(2)%></option>

						<%
						} else {
						%>

						<option value="<%=rs.getString(2)%>"><%=rs.getString(2)%></option>

						<%
						}
						}

						} catch (Exception ex) {
						ex.printStackTrace();
						out.println("Error" + ex.getMessage());
						}
						%>

					</select>



					<%-- <select name="country" class="form-control"onchange="getSelectValue();"required="required">
						<option value="<c:out value='${user.country}'/>"></option>
						<option value="Afganisthan">Afganisthan</option>
						<option value="Brazil">Brazil</option>
						<option value="Canada">Canada</option>
						<option value="Egypt">Egypt</option>
						<option value="France">France</option>
						<option value="Germany">Germany</option>
						<option value="India">India</option>
						<option value="Japan">Japan</option>
						<option value="Malaysia">Malaysia</option>
						<option value="Switzerland">Switzerland</option>
						<option value="USA">USA</option>
					</select> --%>
				</fieldset>
				<fieldset class="form-group">
					<label>User Role</label>
					<c:set var='role' scope="session" value="${role}" />
					<c:choose>
						<c:when test="${role=='Checker'}">
							<input class="form-control" name="role" type="text" readonly
								value='${user.role}'>
							<%-- <select name="role" class="form-control">
								<option value="<c:out value='${user.role}'/>"></option>
								<option value="Checker">Checker</option>
								<option value="Maker">Maker</option>
							</select> --%>
							<!-- <div class="dropdown">
							<button class="btn btn-outline-primary dropdown-toggle" data-toggle="dropdown">
							user role
							</button>
							<ul class="dropdown-menu">
							<li><a href="#">Checker</a></li>
							<li class="disabled"><a href="#">Maker</a></li>
							</ul>
							
							</div> -->
						</c:when>
						<c:otherwise>
							<%-- <input class="form-control" name="role" type="text" readonly
								value='${user.role}'> --%>
							<select name="role" class="form-control" required="required">
								<option value="<c:out value='${user.role}'/>"></option>
								<option value="Checker">Checker</option>
								<option value="Maker">Maker</option>
								<%-- <%
						try {
							String query = "select * from role";
							String jdbcURL = "jdbc:oracle:thin:@localhost:1521:XE";
							String jdbcUsername = "hr";
							String jdbcPassword = "hr";
							Connection connection = null;
							String role = "${user.role}";

							Class.forName("oracle.jdbc.driver.OracleDriver");
							connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
							PreparedStatement st = connection.prepareStatement(query);
							ResultSet rs = st.executeQuery();
							while (rs.next()) {
								if (rs.getString(2) == role) {
						%>

						<option value="<%=rs.getString(2)%>"><%=rs.getString(2)%></option>
						

						<%
						}else{
							%>

							<option value="<%=rs.getInt(1)%>"><%=rs.getString(2)%></option>

							<%
							
						}
						}
							
						} catch (Exception ex) {
						ex.printStackTrace();
						out.println("Error" + ex.getMessage());
						}
						%> --%>

								<%-- <option value="<c:out value='${user.role}'/>"></option>
								<option value="Checker">Checker</option>
								<option value="Maker">Maker</option> --%>
							</select>
						</c:otherwise>
					</c:choose>
					<%-- <select name="role" class="form-control" required="required">
						<option value="<c:out value='${user.role}'/>"></option>
						<option value="Checker">Checker</option>
						<option value="Maker">Maker</option>
					</select> --%>
				</fieldset>

				<button type="submit" value="Submit" class="btn btn-primary">Save</button>
				<button type="reset" onclick="Function()" class="btn btn-success">Cancel</button>

			</div>
		</div>

	</div>
</body>
</html>
