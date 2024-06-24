<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="buyme.ApplicationDB" %>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Generate Report</title>
<link rel="stylesheet"
    href="https://cdn.jsdelivr.net/gh/kognise/water.css@latest/dist/dark.min.css">
</head>
<body>
    <button onclick="window.location.href='generateSalesReport.jsp';">Return
        to Generate Sales Report Page</button>

    <h2>Total Earnings</h2>
    <%
    ApplicationDB db = new ApplicationDB();
    Connection con = null;
    PreparedStatement ps = null;
    ResultSet result = null;
    try {
        con = db.getConnection();
        String str = "SELECT SUM(current_bid) AS total_earnings FROM auction WHERE status = 'close' AND current_bid >= min_price";
        ps = con.prepareStatement(str);
        result = ps.executeQuery();
        if (result.next()) {
            float totalEarnings = result.getFloat("total_earnings");
            if (!result.wasNull()) {
                out.print("<b>Total earnings: </b>" + totalEarnings);
            } else {
                out.print("<b>Total earnings: </b>0"); // Handling null case
            }
        } else {
            out.print("No data available.");
        }
    } catch (SQLException e) {
        out.print("SQL Error: " + e.getMessage());
    } catch (Exception e) {
        out.print("Error: " + e.getMessage());
    } finally {
        try {
            if (result != null) result.close();
            if (ps != null) ps.close();
            if (con != null) con.close();
        } catch (SQLException e) {
            out.print("Error closing resources: " + e.getMessage());
        }
    }
    %>

</body>
</html>