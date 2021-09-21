<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Update Form</title>
</head>
<body>
	<form action="StudentControllerServlet" method="get">
	
	<input type="hidden" name="command" value="UPDATE">
	<input type="hidden" name="id" value="${student_inf.id }">
	<table>
	<tr>
		<td><label>Name:</label></td>
		<td><input type="text" name="name" value="${student_inf.name}"></td>
	</tr>
	<tr>
		<td><label>Email:</label></td>
		<td><input type="email" name="email" value="${student_inf.email }"></td>
	</tr>
	<tr>
		<td><label>City:</label></td>
		<td><input type="text" name="city" value="${student_inf.city }"></td>
	</tr>
	<tr>
		<td><label></label></td>
		<td><input type="submit" value="update"></td>
	</tr>
	</table>
	
	</form>
</body>
</html>