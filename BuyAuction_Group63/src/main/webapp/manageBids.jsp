<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="buyme.ApplicationDB" %>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Manage Bids</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/gh/kognise/water.css@latest/dist/dark.min.css">
</head>
<body>
    <button onclick="window.location.href='manageAuctionsCustomerRep.jsp';">Return to View All Auctions</button>
    <h3>View All Bids</h3>

    <%
    ApplicationDB db = new ApplicationDB();
    Connection con = db.getConnection();
    Statement stmt = null;
    ResultSet result = null;
    PreparedStatement ps = null;
    try {
        String auctionIdString = request.getParameter("auction_id");
        if (auctionIdString != null && !auctionIdString.isEmpty()) {
            int auction_id = Integer.parseInt(auctionIdString);
            session.setAttribute("auction_id", auction_id);

            PreparedStatement ps1 = con.prepareStatement("SELECT status FROM auction WHERE auction_id = ?");
            ps1.setInt(1, auction_id);
            ResultSet rs = ps1.executeQuery();

            String viewBid = "SELECT * FROM bid JOIN auction USING (auction_id) WHERE auction_id = ? ORDER BY amount DESC";
            ps = con.prepareStatement(viewBid);
            ps.setInt(1, auction_id);
            result = ps.executeQuery();

            out.print("<table>");
            out.print("<tr><th>Bid ID</th><th>Buyer</th><th>Amount</th><th>Auto Bid: On or Off?</th><th>Bid Increment</th><th>Upper Limit</th></tr>");

            while (result.next()) {
                out.print("<tr><td>" + result.getInt("bid_id") + "</td><td>" + (result.getString("buyer") != null ? result.getString("buyer") : "Deleted User") + "</td><td>$" + result.getFloat("amount") + "</td><td>" + result.getBoolean("is_autobid") + "</td><td>" + (result.getFloat("bid_increment") != -1 ? result.getFloat("bid_increment") : "no bid increment since auto bid is not on") + "</td><td>" + (result.getFloat("upper_limit") != -1 ? result.getFloat("upper_limit") : "no upper limit since auto bid is not on") + "</td></tr>");
            }
            out.print("</table>");
        } else {
            out.print("<p>Error: Auction ID is required to view bids.</p>");
        }
    } catch (NumberFormatException e) {
        out.print("<p>Error: Invalid auction ID format.</p>");
    } catch (SQLException e) {
        out.print("<p>Error: " + e.getMessage() + "</p>");
        e.printStackTrace();
    } finally {
        if (result != null) try { result.close(); } catch (SQLException ex) {}
        if (ps != null) try { ps.close(); } catch (SQLException ex) {}
        if (stmt != null) try { stmt.close(); } catch (SQLException ex) {}
        if (con != null) try { con.close(); } catch (SQLException ex) {}
    }
    %>

</body>
</html>
