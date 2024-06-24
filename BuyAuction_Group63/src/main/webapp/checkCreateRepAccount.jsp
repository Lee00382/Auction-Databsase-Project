<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="buyme.ApplicationDB" %>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html>
<html>
<head>
<title>Create Rep Account</title>
<link rel="stylesheet"
        href="https://cdn.jsdelivr.net/gh/kognise/water.css@latest/dist/dark.min.css">
</head>
<body>
    <button onclick="window.location.href='adminPage.jsp';">Return to Homepage</button>
<h3> Create a New Customer Representative Account</h3>
    <%
    String name = request.getParameter("name");
    String username = request.getParameter("username");
    String password = request.getParameter("password");
    String email = request.getParameter("email");
    String address = request.getParameter("address");
    String account_type = "customerrep"; // Assuming the account type for customer reps is stored as 'customerrep'

    ApplicationDB db = new ApplicationDB();
    Connection con = db.getConnection();
    PreparedStatement ps = null;
    ResultSet rs = null;

    try {
        // Check if username already exists in the account table
        ps = con.prepareStatement("SELECT username FROM account WHERE username = ?");
        ps.setString(1, username);
        rs = ps.executeQuery();

        if (rs.next()) {
            out.println("<p>Username exists, please try another <a href='createRepAccount.jsp'>try again</a>.</p>");
        } else {
            // Insert into account table first
            ps = con.prepareStatement("INSERT INTO account (username, password, address, email, name, account_type) VALUES (?, ?, ?, ?, ?, ?)");
            ps.setString(1, username);
            ps.setString(2, password);
            ps.setString(3, address);
            ps.setString(4, email);
            ps.setString(5, name);
            ps.setString(6, account_type);
            ps.executeUpdate();

            // Then insert into customerrep table
            ps = con.prepareStatement("INSERT INTO customerrep (username, password) VALUES (?, ?)");
            ps.setString(1, username);
            ps.setString(2, password);
            int updateCount = ps.executeUpdate();

            if(updateCount > 0) {
                session.setAttribute("account_type", account_type);
                out.println("<p>Customer representative account created successfully. <a href='adminPage.jsp'>Go to Homepage</a></p>");
            } else {
                out.println("<p>Failed to create customer representative account. Please try again.</p>");
            }
        }
    } catch (SQLException e) {
        out.println("<p>Error: " + e.getMessage() + "</p>");
    } finally {
        if (rs != null) try { rs.close(); } catch (SQLException e) { }
        if (ps != null) try { ps.close(); } catch (SQLException e) { }
        if (con != null) try { con.close(); } catch (SQLException e) { }
    }
    %>
</body>
</html>
