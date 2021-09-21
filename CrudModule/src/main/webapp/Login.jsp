<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<title>Login form</title>
<script>
	function validateForm() {
		var x = document.forms["myForm"]["uname"].value;
		if (x != "Admin") {
			alert("Enter correct username or password");
			return false;
		}
	}
</script>

<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css"
	integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l"
	crossorigin="anonymous">

<style type="text/css">
h2 {
	text-decoration: underline;
}
.log {
	margin-left: 480px;
	margin-top: 120px;
}
</style>
</head>
<body>
	<br>
	<form method="post" action="LoginServlet" name="myForm"
		onsubmit="return validateForm()" class="log">
		<h2>Login</h2>
		<br>
		<div class="input-group input-group-sm">
			<br> <span class="input-group-addon" id="sizing-addon3">Enter
				Username:&nbsp&nbsp</span> <input type="text" id="login"
				class="form-control col-sm-4" name="uname" placeholder="Username"
				autocomplete="off">
		</div>
		<br>
		<div class="input-group input-group-sm">
			<span class="input-group-addon" id="sizing-addon3">Enter
				Password:&nbsp&nbsp&nbsp</span> <input type="text" id="login"
				class="form-control col-sm-4" name="passw" placeholder="Password"
				autocomplete="off">
		</div>
		<br> <input type="submit" value="Login"
			class="btn btn-outline-primary">
	</form>

</body>
</html>