<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Create Account</title>
<link rel="stylesheet"
		href="https://cdn.jsdelivr.net/gh/kognise/water.css@latest/dist/dark.min.css">
</head>
<body>
	<a href="login.jsp" style="text-decoration: none;">
		<button type="button">Return to Login</button>
	</a>
<h3> Create a New Account</h3>
	<form action="checkCreateAccount.jsp" method="POST">
		Enter name: <input type="text" name="name" /> <br /> Enter username: <input
			type="text" name="username" /> <br /> Enter password: <input
			type="password" name="password" /> <br /> Enter address: <input
			type="text" name="address" /> <br /> Enter email: <input type="text"
			name="email" /> <br /> <input type="radio" name="account_type"
			value="buyer" checked> Buyer<br> <input type="radio"
			name="account_type" value="seller"> Seller<br> <input
			type="submit" value="Submit" />
	</form>
</body>
</html>