<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="buyme.ApplicationDB" %>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Earning Per Item</title>
<link rel="stylesheet"
        href="https://cdn.jsdelivr.net/gh/kognise/water.css@latest/dist/dark.min.css">
</head>
<body>
    <button onclick="window.location.href='generateSalesReport.jsp';">Return to Generate Sales Report Page</button>

    <%             
    ApplicationDB db = new ApplicationDB();    
    Connection con = db.getConnection();
    PreparedStatement ps = null;
    ResultSet result = null;
    try {
        out.print("<b>Earning per Item: </b>");

        String str = "SELECT p.product_id, p.brand, p.category, p.color, p.gender, SUM(a.current_bid) as total_earnings FROM product p JOIN auction a ON p.product_id = a.product_id WHERE a.status = 'close' AND a.current_bid >= a.min_price GROUP BY p.product_id, p.brand, p.category, p.color, p.gender";
        ps = con.prepareStatement(str);
        result = ps.executeQuery();
        out.print("<table>");
        out.print("<tr><th>Product ID</th><th>Category</th><th>Brand</th><th>Color</th><th>Gender</th><th>Earning Per Item</th></tr>");
        
        while (result.next()) {
            out.print("<tr><td>" + result.getInt("product_id") + "</td><td>" + result.getString("category") + "</td><td>" + result.getString("brand") + "</td><td>" + result.getString("color") + "</td><td>" + result.getString("gender") + "</td><td>$" + result.getFloat("total_earnings") + "</td></tr>");
        }
        out.print("</table>");
        out.print("<br/>");
    }
    catch (Exception e) {
        out.print("Error: " + e.getMessage());
        e.printStackTrace();
    }
    finally {
        if (result != null) try { result.close(); } catch (SQLException ex) {}
        if (ps != null) try { ps.close(); } catch (SQLException ex) {}
        if (con != null) try { con.close(); } catch (SQLException ex) {}
    }
    %>

</body>
</html>
