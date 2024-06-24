<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="buyme.ApplicationDB" %>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>Answers Questions</title>
<link rel="stylesheet"
		href="https://cdn.jsdelivr.net/gh/kognise/water.css@latest/dist/dark.min.css">
</head>
<body>
    <button onclick="window.location.href='customerRepHomepage.jsp';">Return to homepage</button>

    <h2>View Questions</h2>
    <p> Answer any unanswered questions</p>

    <%
    PreparedStatement ps = null;
    ResultSet result = null;
    ApplicationDB db = new ApplicationDB();
    Connection conn = db.getConnection();
    try {
        String questionsQuery = "SELECT * FROM questions";
        ps = conn.prepareStatement(questionsQuery);
        result = ps.executeQuery();
        out.print("<table class='highlight'>"); 
        out.print("<tr>");
        out.print("<th>Question ID</th>");
        out.print("<th>Question</th>");
        out.print("<th>Answer</th>");
        out.print("<th>Answered By Customer Rep Username</th>");
        out.print("</tr>");

        while (result.next()) {
            out.print("<tr>");
            out.print("<td>" + result.getInt("question_id") + "</td>");
            out.print("<td>" + result.getString("question") + "</td>");

            if (result.getString("answer") == null || result.getString("answer").isEmpty()) {
                out.print("<td><form action='answersHandler.jsp?question_id=" + result.getInt("question_id") + "' method='POST'>");
                out.print("<textarea name='answer'></textarea> <input type='submit' value='Submit Answer' class='btn'>");
                out.print("</form></td>");
            } else {
                out.print("<td>" + result.getString("answer") + "</td>");
            }

            out.print("<td>" + result.getString("customerrep_username") + "</td>");
            out.print("</tr>");
        }
        out.print("</table>");
    } catch (SQLException e) {
        out.print("<p>Error: " + e.getMessage() + "</p>");
        e.printStackTrace();
    } finally {
        try { if (result != null) result.close(); } catch (Exception e) { }
        try { if (conn != null) conn.close(); } catch (Exception e) { }
    }
    %>
</body>
</html>