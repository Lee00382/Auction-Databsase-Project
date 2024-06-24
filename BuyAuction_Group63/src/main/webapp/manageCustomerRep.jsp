<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="buyme.ApplicationDB" %>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html>
<html>
<head>
<title>Manage Customer Representative Accounts</title>
<link rel="stylesheet"
        href="https://cdn.jsdelivr.net/gh/kognise/water.css@latest/dist/dark.min.css">
</head>
<body>
    <button onclick="window.location.href='adminPage.jsp';">Return to account page</button><br>
    <h3>Manage Customer Representative Accounts</h3>
    <form method="get">
        <input type="text" name="search" placeholder="username">
        <button type="submit">Search</button>
    </form>

    <%
    try {
        ApplicationDB db = new ApplicationDB();
        Connection con = db.getConnection();
        String searchQuery = request.getParameter("search");
        PreparedStatement pstmt;
        String sql = "SELECT a.username, a.name, a.email FROM account a JOIN customerrep c ON a.username = c.username WHERE a.username LIKE ?";

        if (searchQuery != null && !searchQuery.isEmpty()) {
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1, "%" + searchQuery + "%");
        } else {
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1, "%");
        }
        
        ResultSet result = pstmt.executeQuery();

        out.print("<table>");
        out.print("<tr>");
        out.print("<th>Username</th>");
        out.print("<th>Name</th>");
        out.print("<th>Email</th>");
        out.print("<th>Actions</th>");
        out.print("</tr>");

        while (result.next()) {
            out.print("<tr>");
            out.print("<td>" + result.getString("username") + "</td>");
            out.print("<td>" + result.getString("name") + "</td>");
            out.print("<td>" + result.getString("email") + "</td>");
            out.print("<td><form action='editUser.jsp' method='post'><button name='username' type='submit' value='"
            + result.getString("username") + "'>Edit User</button></form></td>");
            out.print("<td><form action='deleteCustomerRep.jsp' method='post'><button name = 'username' type = 'submit' value='"
                    + result.getString("username") + "'>Delete User</button></form></td>");
            out.print("</tr>");
        }

        out.print("</table>");
        result.close();
        pstmt.close();
        con.close();

    } catch (SQLException se) {
        out.println("<p>Error: " + se.getMessage() + "</p>");
        se.printStackTrace();
    } catch (Exception e) {
        out.println("<p>Error: " + e.getMessage() + "</p>");
        e.printStackTrace();
    }
    %>

</body>
</html>
