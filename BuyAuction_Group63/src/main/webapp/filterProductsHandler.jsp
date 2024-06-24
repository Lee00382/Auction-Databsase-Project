<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="buyme.ApplicationDB" %>
<%@ page import="java.io.*, java.util.*, java.sql.*"%>
<%@ page import="javax.servlet.http.*, javax.servlet.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>search the list of items by various criteria</title>
<link rel="stylesheet"
        href="https://cdn.jsdelivr.net/gh/kognise/water.css@latest/dist/dark.min.css">
</head>
<body>
<button onclick="window.location.href='filterProducts.jsp';">Return to Filter Products Page</button><br>
    <%
    ApplicationDB db = new ApplicationDB();
    Connection con = db.getConnection();
    PreparedStatement ps = null;
    ResultSet result = null;
    try {
        List<Object> parameters = new ArrayList<>();
        StringBuilder query = new StringBuilder("SELECT product.*, auction.* FROM product JOIN auction ON product.product_id = auction.product_id WHERE 1=1");

        if (request.getParameter("category") != null && !request.getParameter("category").isEmpty()) {
            query.append(" AND category = ?");
            parameters.add(request.getParameter("category"));
        }
        if (request.getParameter("brand") != null && !request.getParameter("brand").isEmpty()) {
            query.append(" AND brand = ?");
            parameters.add(request.getParameter("brand"));
        }
        if (request.getParameter("color") != null && !request.getParameter("color").isEmpty()) {
            query.append(" AND color = ?");
            parameters.add(request.getParameter("color"));
        }
        if (request.getParameter("gender") != null && !request.getParameter("gender").isEmpty()) {
            query.append(" AND gender = ?");
            parameters.add(request.getParameter("gender"));
        }
        if (request.getParameter("seller") != null && !request.getParameter("seller").isEmpty()) {
            query.append(" AND seller = ?");
            parameters.add(request.getParameter("seller"));
        }
        if (request.getParameter("status") != null && !request.getParameter("status").equals("both")) {
            query.append(" AND status = ?");
            parameters.add(request.getParameter("status"));
        }
        if (request.getParameter("price") != null && !request.getParameter("price").isEmpty()) {
            query.append(" AND price < ?");
            parameters.add(Float.parseFloat(request.getParameter("price")));
        }

        ps = con.prepareStatement(query.toString());
        for (int i = 0; i < parameters.size(); i++) {
            ps.setObject(i + 1, parameters.get(i));
        }

        result = ps.executeQuery();
        out.print("<table border='1'>");
        out.print("<tr><th>Product ID</th><th>Category</th><th>Brand</th><th>Color</th><th>Gender</th><th>Price</th><th>Seller</th><th>Auction ID</th><th>Current Bid</th><th>Status</th></tr>");
        while (result.next()) {
            out.print("<tr>");
            out.print("<td>" + result.getInt("product_id") + "</td>");
            out.print("<td>" + result.getString("category") + "</td>");
            out.print("<td>" + result.getString("brand") + "</td>");
            out.print("<td>" + result.getString("color") + "</td>");
            out.print("<td>" + result.getString("gender") + "</td>");
            out.print("<td>" + result.getFloat("price") + "</td>");
            out.print("<td>" + result.getString("seller") + "</td>");
            out.print("<td>" + result.getInt("auction_id") + "</td>");
            out.print("<td>$" + result.getFloat("current_bid") + "</td>");
            out.print("<td>" + result.getString("status") + "</td>");
            out.print("</tr>");
        }
        out.print("</table>");
    } catch (Exception e) {
        out.print("Error: " + e.getMessage());
    } finally {
        if (result != null) result.close();
        if (ps != null) ps.close();
        if (con != null) con.close();
    }
    %>
</body>
</html>






