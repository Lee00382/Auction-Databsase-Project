<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="buyme.ApplicationDB" %>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Check Admin Login</title>
<link rel="stylesheet"
		href="https://cdn.jsdelivr.net/gh/kognise/water.css@latest/dist/dark.min.css">
</head>
<body>
	<jsp:include page="checkWinner.jsp" />
	<%
	String userid = request.getParameter("username");
	String pwd = request.getParameter("password");
	ApplicationDB db = new ApplicationDB();
	Connection con = db.getConnection();
	Statement stmt = con.createStatement();
	ResultSet rs = null;
	rs = stmt.executeQuery("select * from admin where username='" + userid + "'");
	if (rs.next()) {
		ResultSet rs1;
		rs1 = stmt.executeQuery("select * from admin where username='" + userid + "' and password='" + pwd + "'");
		if (rs1.next()) {
			session.setAttribute("admin", userid); 
			response.sendRedirect("adminPage.jsp");
			out.println("welcome " + userid);
			out.println("<a href='logout.jsp'>Log out</a>");
		} else {
			out.println("Invalid password <a href='adminLogin.jsp'>try again</a>");
		}
	} else {
		out.println("Invalid username <a href='adminLogin.jsp'>try again</a>");
	}
	%>

</body>
</html>