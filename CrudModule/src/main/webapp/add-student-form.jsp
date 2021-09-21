<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add Form</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css"
	integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l"
	crossorigin="anonymous">
<style type="text/css">
.form{
margin-top: 20px;
margin-left: 40px;
}
</style>
</head>
<body>
	<form action="StudentControllerServlet" method="get" class="form">

		<input type="hidden" name="command" value="ADD">

		<table>
			<tr>
				<td><label>Name:</label></td>
				<td><input type="text" class="form-control col-sm-12"
					name="name" placeholder="Name" autocomplete="off"></td>
			</tr><br>
			<br>
			<tr>
				<td><label>Email:</label></td>
				<td><input type="text" class="form-control col-sm-12"
					name="email" placeholder="Email" autocomplete="off"></td>
			</tr><br>
			<br>
			<tr>
				<td><label>City:</label></td>
				<td><input type="text" class="form-control col-sm-12"
					name="city" placeholder="City" autocomplete="off"></td>
			</tr>
			<br>
			<tr>
				<td><label></label></td>
				<td><input type="submit" value="save" class="btn btn-outline-primary"></td>
			</tr>
		</table>

	</form>
</body>
</html>