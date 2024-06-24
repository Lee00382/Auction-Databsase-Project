<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="buyme.ApplicationDB" %>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<!DOCTYPE html>
<html>
<head>
<title>Delete Customer Representative</title>
<link rel="stylesheet"
        href="https://cdn.jsdelivr.net/gh/kognise/water.css@latest/dist/dark.min.css">
</head>
<body>
<%
String username = request.getParameter("username");
if (username == null || username.trim().isEmpty()) {
    out.println("<p>No username provided or username is invalid.</p>");
} else {
    ApplicationDB db = new ApplicationDB();
    Connection con = null;
    PreparedStatement pstmt = null;
    try {
        con = db.getConnection();
        String sql = "DELETE FROM customerrep WHERE username = ?";
        pstmt = con.prepareStatement(sql);
        pstmt.setString(1, username);
        int rowsAffected = pstmt.executeUpdate();
        if (rowsAffected > 0) {
            out.println("<p>Customer representative '" + username + "' deleted successfully.</p>");
        } else {
            out.println("<p>No customer representative found with username '" + username + "' or unable to delete.</p>");
        }
    } catch (SQLException e) {
        out.println("<p>Error deleting customer representative: " + e.getMessage() + "</p>");
    } finally {
        if (pstmt != null) try { pstmt.close(); } catch (SQLException ignore) {}
        if (con != null) try { con.close(); } catch (SQLException ignore) {}
    }
}
out.println("<a href='manageCustomerRep.jsp'>Back to Manage Customer Representatives</a>");
%>
</body>
</html>

