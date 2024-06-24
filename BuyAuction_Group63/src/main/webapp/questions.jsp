<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="buyme.ApplicationDB" %>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Frequently Asked Questions</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/gh/kognise/water.css@latest/dist/dark.min.css">
</head>
<body>
    <button onclick="window.location.href='askQuestion.jsp';">Go back to ask a question page</button>

    <h3> View all Questions</h3>
    <%
    PreparedStatement ps = null;
    ResultSet result = null;
    ApplicationDB db = new ApplicationDB();
    Connection conn = db.getConnection();
    try {

        String username = (session.getAttribute("user")).toString();
        String questionsQuery = "SELECT * FROM questions";
        String check = "Customer rep hasn't answered yet";

        ps = conn.prepareStatement(questionsQuery);
        result = ps.executeQuery();
        out.print("<table>");
        out.print("<tr>");
        out.print("<th>Question ID</th>");
        out.print("<th>Question</th>");
        out.print("<th>Answer</th>");
        out.print("<th>Answered By Customer Rep Username</th>");

        while (result.next()) {
            out.print("<tr>");
            out.print("<td>" + result.getInt("question_id") + "</td>");
            out.print("<td>" + result.getString("question") + "</td>");
            out.print("<td>" + result.getString("answer") + "</td>");
            out.print("<td>" + result.getString("customerrep_username") + "</td>");
            out.print("</tr>");
        }

        out.print("</table>");

    } catch (SQLException e) {
        out.print("<p>Error</p>");
        e.printStackTrace();
    } finally {
        try {
            if (result != null) result.close();
        } catch (Exception e) { }
        try {
            if (conn != null) conn.close();
        } catch (Exception e) { }
    }
    %>
</body>
</html>
