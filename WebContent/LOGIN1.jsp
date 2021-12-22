
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Login Page</title>
<!-- <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.css" />
    <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.js"></script> -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js">
	
</script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js">
	
</script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js">
	
</script>

</head>
<body>
	<nav class="navbar navbar-expand-sm bg-dark-blue"
			style="background-color: blue">
		<h3 style="color: white">
			<b>User Management Application</b>
		</h3>
	</nav>

	</br>
	<div class="row">
		<div class="col-sm-4">
			<div class="container">

				<form action="LOGIN1" method="post">

					<div class="form-group">
						<label> <b>User Name </b></label> <input type="text"
							name="username" id="username" class="form-control"
							placeholder="username" size="10px" required>

					</div>
					</br>

					<div class="form-group">
						<label><b>Password </b></label> <input type="password"
							name="password" id="password" class="form-control"
							placeholder="password" size="10px" required><br />

					</div>

					<div class="form-group">
						<p>
							<b><input type="submit" value="SUBMIT"
								style="background-color: lightblue"></b>
						</p>


					</div>



				</form>

			</div>
		</div>
	</div>


	<!-- <form method="get" action="user-list.jsp">
				Enter Username : <b><input type="text" name="user" required></b><br />
				<br /> Enter Password : <b><input type="password" name="pass"
					pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}"
					title="Must contain at least one number and one uppercase and lowercase letter, and at least 8 or more characters"
					required></b><br />
				<p>
					<input type="submit" value="SUBMIT" style="background-color: green">
				</p>

			</form>
 -->


</body>
</html>








<%-- <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<div align="center">
		<h1>Employee Login Form</h1>
		<form action="<%=request.getContextPath()%>/user-list.jsp" method="post">
			<table style="with: 100%">
				<tr>
					<td>UserName</td>
					<td><input type="text" name="username" /></td>
				</tr>
				<tr>
					<td>Password</td>
					<td><input type="password" name="password" /></td>
				</tr>

			</table>
			<input type="submit" value="Submit" />
		</form>
	</div>
</body>
</html> --%>