<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="buyme.ApplicationDB" %>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<!DOCTYPE html>
<html>
<head>
<title>Remove Bid</title>
<link rel="stylesheet"
        href="https://cdn.jsdelivr.net/gh/kognise/water.css@latest/dist/dark.min.css">
</head>
<body>
<h3>Delete a Bid</h3>
<form method="POST">
    Enter Bid ID: <input type="text" name="bid_id" required />
    <input type="submit" value="Delete Bid" />
</form>

<%
if ("POST".equalsIgnoreCase(request.getMethod())) {
    ApplicationDB db = new ApplicationDB();
    Connection con = null;
    PreparedStatement ps = null;
    try {
        con = db.getConnection();
        String bidIdParam = request.getParameter("bid_id");

        if (bidIdParam != null && !bidIdParam.trim().isEmpty()) {
            int bid_id = Integer.parseInt(bidIdParam);

            // Check if bid exists
            String checkSql = "SELECT COUNT(*) AS count FROM bid WHERE bid_id = ?";
            ps = con.prepareStatement(checkSql);
            ps.setInt(1, bid_id);
            ResultSet rs = ps.executeQuery();
            if (rs.next() && rs.getInt("count") > 0) {
                // Deleting the bid
                String deleteSql = "DELETE FROM bid WHERE bid_id = ?";
                ps.close(); // Close previous PreparedStatement
                ps = con.prepareStatement(deleteSql);
                ps.setInt(1, bid_id);
                int deleteCount = ps.executeUpdate();

                if (deleteCount > 0) {
                    out.println("<p>Bid successfully deleted.</p>");
                } else {
                    out.println("<p>Error: Bid could not be deleted.</p>");
                }
            } else {
                out.println("<p>No bid found with the specified ID.</p>");
            }
        } 
    } catch (NumberFormatException nfe) {
        out.println("<p>Error: Invalid number format for Bid ID.</p>");
    } catch (SQLException e) {
        out.println("<p>Error processing the request: " + e.getMessage() + "</p>");
    } finally {
        if (ps != null) try { ps.close(); } catch (SQLException ignore) {}
        if (con != null) try { con.close(); } catch (SQLException ignore) {}
    }
}
%>

</body>
</html>
