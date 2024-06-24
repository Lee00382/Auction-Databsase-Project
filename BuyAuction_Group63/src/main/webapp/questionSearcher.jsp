<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="buyme.ApplicationDB" %>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html>
<html>
<head>
<title>Search Questions</title>
<link rel="stylesheet"
        href="https://cdn.jsdelivr.net/gh/kognise/water.css@latest/dist/dark.min.css">
</head>
<body>
    <a href="askQuestion.jsp">Return to questions dashboard.</a>
    <h3>Search Questions based on Keywords</h3>
    <form method="get"> <!-- Ensure method is specified as 'get' for data retrieval -->
        <input type="text" name="search" placeholder="question">
        <button type="submit">Search</button>
    </form>

    <%
    try {
        ApplicationDB db = new ApplicationDB();
        Connection con = db.getConnection();
        String searchQuery = request.getParameter("search");
        PreparedStatement pstmt;
        String sql = "SELECT question, answer, customerrep_username FROM questions WHERE question LIKE ? OR answer LIKE ?";

        if (searchQuery != null && !searchQuery.isEmpty()) {
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1, "%" + searchQuery + "%");
            pstmt.setString(2, "%" + searchQuery + "%");
        } else {
            pstmt = con.prepareStatement("SELECT question, answer, customerrep_username FROM questions");
        }

        ResultSet result = pstmt.executeQuery();
        out.print("<table>");
        out.print("<tr><th>Question</th><th>Answer</th><th>Answered By Customer Rep Username</th></tr>");

        while (result.next()) {
            out.print("<tr>");
            out.print("<td>" + result.getString("question") + "</td>");
            out.print("<td>" + result.getString("answer") + "</td>");
            out.print("<td>" + result.getString("customerrep_username") + "</td>");
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