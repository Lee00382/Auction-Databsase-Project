<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="buyme.ApplicationDB" %>
<%@ page import="java.io.*,java.util.*,java.sql.*" %>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Check Create Account Details</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/gh/kognise/water.css@latest/dist/dark.min.css">
</head>
<body>
    <jsp:include page="checkWinner.jsp" />
    <%
        String userid = request.getParameter("username");
        String pwd = request.getParameter("password");
        String email = request.getParameter("email");
        String name = request.getParameter("name");
        String address = request.getParameter("address");
        String account_type = request.getParameter("account_type");
        ApplicationDB db = new ApplicationDB();
        Connection con = db.getConnection();
        Statement stmt = con.createStatement();

        ResultSet rs = stmt.executeQuery("select * from account where username='" + userid + "'");
        if (rs.next()) {
            out.println("Username exists, please try another <a href='createAccount.jsp'>try again</a>");
        } else {
            int x = stmt.executeUpdate("insert into account values('" + userid + "', '" + pwd + "', '" + address + "', '" + email + "', '" + name + "', '" + account_type + "')");
            session.setAttribute("user", userid);
            out.println("<h3> Account Created Successfully </h3>");
            out.println("<form action='login.jsp'><input type='submit' value='Login'/></form>");
        }
    %>
</body>
</html>
