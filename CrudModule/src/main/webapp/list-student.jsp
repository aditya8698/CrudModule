<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css"
	integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l"
	crossorigin="anonymous">
<title>List page</title>
<style type="text/css">
.out {
	margin-left: 1250px;
}
</style>
</head>
<body>
	<div id="wrapper">
		<h2>Details Table</h2>
	</div>
	<form method="post" action="Logout" class="out">
		<input type="submit" value="logout" class="btn btn-outline-primary">
	</form>
	<div id="content">
		<input type="button" value="Add info"
			onclick="window.location.href='add-student-form.jsp';return false;"><br>
		<br>
		<table border="1">
			<tr>
				<th>ID</th>
				<th>Name</th>
				<th>Email</th>
				<th>City</th>
				<th>Action</th>
			</tr>

			<c:forEach var="tempStud" items="${STUDENT_LIST }">

				<c:url var="tempUrl" value="StudentControllerServlet">
					<c:param name="command" value="LOAD" />
					<c:param name="id" value="${tempStud.id}" />
				</c:url>

				<c:url var="deleteUrl" value="StudentControllerServlet">
					<c:param name="command" value="DELETE" />
					<c:param name="id" value="${tempStud.id}" />
				</c:url>

				<tr>
					<td><c:out value="${tempStud.id}" /></td>
					<td><c:out value="${tempStud.name}" /></td>
					<td><c:out value="${tempStud.email}" /></td>
					<td><c:out value="${tempStud.city}" /></td>
					<td><a href="${tempUrl }">Update</a> | <a href="${deleteUrl }">Delete</a>
					</td>
				</tr>
			</c:forEach>
		</table>
	</div>
</body>
</html>