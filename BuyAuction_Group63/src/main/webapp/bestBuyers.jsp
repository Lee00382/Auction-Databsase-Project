<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="buyme.ApplicationDB" %>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Best Buyers</title>
<link rel="stylesheet"
        href="https://cdn.jsdelivr.net/gh/kognise/water.css@latest/dist/dark.min.css">
</head>
<body>
    <button onclick="window.location.href='generateSalesReport.jsp';">Return to Generate Sales Report Page</button>
    <h2>List of Top Buyers</h2>

    <p>Best Buyers are based on how much money they spent.</p>
    <%
    ApplicationDB db = new ApplicationDB();
    Connection con = db.getConnection();
    Statement stmt = null;
    ResultSet result = null;
    try {
        stmt = con.createStatement();
        String str = "SELECT a.winner, SUM(a.current_bid) AS total_spent FROM auction a WHERE a.status='close' AND a.current_bid >= a.min_price GROUP BY a.winner ORDER BY SUM(a.current_bid) DESC LIMIT 5";
        result = stmt.executeQuery(str);
        out.print("<b>Top Buyers</b><br/>");
        out.print("<table>");
        out.print("<tr><th>Buyer Username</th><th>Total Bid</th></tr>");

        while (result.next()) {
            out.print("<tr><td>" + result.getString("winner") + "</td><td>$" + result.getFloat("total_spent") + "</td></tr>");
        }
        out.print("</table><br/>");
    } catch (Exception e) {
        out.print("Error: " + e.getMessage());
        e.printStackTrace();
    } finally {
        if (result != null) try { result.close(); } catch (SQLException ex) {}
        if (stmt != null) try { stmt.close(); } catch (SQLException ex) {}
        if (con != null) try { con.close(); } catch (SQLException ex) {}
    }
    %>

</body>
</html>
