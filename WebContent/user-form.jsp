<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<title>User Management Application</title>
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
				<%-- <c:if test="${user != null}">
					<form action="update" method="post">
				</c:if>  --%>
				<c:if test="${user == null}">
					<form action="insert" method="post">
				</c:if>

				<caption>
					<h2>
						<%-- <c:if test="${user != null}">
            			Edit User
						</c:if> --%>

						<c:if test="${user == null}">
            			Add New User
            			<%-- <c:set var="n" scope="session" value="${name}" /><c:choose>
            			<c:when test="${n=='name'}">
            			<span style='color:crimson; margin-left:25px;'>user exists!!</span>")
            			</c:when>
            			</c:choose> --%>
						</c:if>
					</h2>
				</caption>

				<%-- <c:if test="${user != null}">
					<input type="text" name="id" value="<c:out value='${user.id}' />" />
				</c:if> --%>

				<fieldset class="form-group">
					<label>User Name</label> <input type="text"
						value="<c:out value='${user.name}' />" class="form-control"
						name="name" pattern="[A-Za-z]{1,255}"required="required" maxlength = "6">
				</fieldset>

				<fieldset class="form-group">
					<label>User Email</label> <input id="emailAddress" type="email"
						pattern="[a-zA-Z0-9.!#$%&’*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*"
						value="<c:out value='${user.email}' />" class="form-control"
						name="email" required="required" maxlength = "20">
				</fieldset>
				<fieldset class="form-group">
					<label>User Country</label>
					<%-- <input list="country" type="text"
						value="<c:out value='${user.country}' />" class="form-control"
						name="country" required="required"> --%>
					<select name="country" class="form-control" required="required">
						<option value="<c:out value='${user.country}'/>"></option>
						<option value="India">India</option>
						<option value="Australia">Australia</option>
						<option value="USA">USA</option>
					</select>
				</fieldset>
				<fieldset class="form-group">
					<label>User Role</label>
						<%--  <c:set var='role' scope="session" value="${role}" />
							<c:choose>
								<c:when test="${role=='Checker'}">
									<select disabled="mode == 'auto'" name="role" class="form-control">
										<option value="<c:out value='${user.role}'/>"></option>
										<option value="Checker">Checker</option>
										<option value="Maker">Maker</option>
									</select>
								</c:when>
								<c:otherwise>
								<select name="role" class="form-control" required="required">
						<option value="<c:out value='${user.role}'/>"></option>
						<option value="Checker">Checker</option>
						<option value="Maker">Maker</option>
					</select>
					</c:otherwise>
							</c:choose>   --%>
					     <select name="role" class="form-control"required="required">
						<option value="<c:out value='${user.role}'/>"></option>
						<option value="Checker">Checker</option>
						<option value="Maker">Maker</option>
					</select>
				</fieldset>

				<button type="submit" class="btn btn-outline-primary">Save</button>
				<button type="reset" onclick="Function()" class="btn btn-success">Cancel</button>

			</div>
		</div>

	</div>
</body>
</html>






<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html
<head>
<title>User Management Application</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
</head>
<body>

	<header>
		<nav class="navbar navbar-expand-md navbar-dark"
			style="background-color: blue">
			<div>
				<p align = "center"><b> User Management Application</b>
			</div>

			<ul class="navbar-nav">
				<li><a href="<%=request.getContextPath()%>/list"
					class="nav-link">Users</a></li>
			</ul>
		</nav>
	</header>
	<br>
	<div class="container col-md-5">
		<div class="card">
			<div class="card-body">
				<c:if test="${user != null}">
					<form action="update" method="post">
				</c:if>
				<c:if test="${user == null}">
					<form action="insert" method="post">
				</c:if>

				<caption>
					<h2>
						<c:if test="${user != null}">
            			Edit User
            		</c:if>
						<c:if test="${user == null}">
            			Add New User
            		</c:if>
					</h2>
				</caption>

				<c:if test="${user != null}">
					<input type="hidden" name="id" value="<c:out value='${user.id}' />" />
				</c:if>

				<fieldset class="form-group">
					<label>User Name</label> <input type="text"
						value="<c:out value='${user.name}' />" class="form-control"
						name="name" required="required">
				</fieldset>

				<fieldset class="form-group">
					<label>User Email</label> <input type="text"
						value="<c:out value='${user.email}' />" class="form-control"
						name="email">
				</fieldset>

				<fieldset class="form-group">
					<label>User Country</label> <input list="country" type="text"
						value="<c:out value='${user.country}' />" class="form-control"
						name="country">
					<datalist id="country">

						<option value="Afganisthan" />
						<option value="Brazil" />
						<option value="Canada" />
						<option value="Egypt" />
						<option value="France" />
						<option value="Germany" />
						<option value="India" />
						<option value="Japan" />
						<option value="Malaysia" />
						<option value="Switzerland" />
						<option value="USA" />
					</datalist>




				</fieldset>

				<fieldset class="form-group">
					<label>User Role</label> <input list="roles" type="text"
						value="<c:out value='${user.role}' />" class="form-control"
						name="role">
					<datalist id="roles">
						<option value="Checker" />
						<option value="Maker" />
					</datalist>
				</fieldset>

				<button type="submit" class="btn btn-success">Save</button>
				<button onclick="Function()" class="btn btn-success">Cancel</button>
				<script>
					function Function() {
						location.replace("user-list.jsp")
					}
				</script>


				</form>
			</div>
		</div>
	</div>
</body>
</html> --%>