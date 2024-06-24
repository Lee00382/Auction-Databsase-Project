<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Create Rep Account</title>
<link rel="stylesheet"
        href="https://cdn.jsdelivr.net/gh/kognise/water.css@latest/dist/dark.min.css">
</head>
<body>
    <button onclick="window.location.href='adminPage.jsp';">Return to Homepage</button>
    <h3> Create a New Customer Representative Account</h3>
    <form action="checkCreateRepAccount.jsp" method="POST">
        <label for="username">Enter username:</label>
        <input type="text" id="username" name="username" required /> <br />
        <label for="password">Enter password:</label>
        <input type="password" id="password" name="password" required /> <br />
        <label for="email">Enter email:</label>
        <input type="email" id="email" name="email" required /> <br />
        <label for="name">Enter full name:</label>
        <input type="text" id="name" name="name" required /> <br />
        <label for="address">Enter address:</label>
        <input type="text" id="address" name="address" /> <br />
        <input type="submit" value="Submit" />
    </form>
</body>
</html>
