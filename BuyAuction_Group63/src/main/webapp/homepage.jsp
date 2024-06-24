<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>BuyMe - Homepage</title>
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
    <style>
        body {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0; /* Removes default margin */
            background: #16213e; /* Sets the background color */
            color: #e0e1dd; /* Sets the text color */
            font-family: 'Arial', sans-serif;
        }
        .main-container {
            width: 100%;
            max-width: 600px;
            padding: 20px;
            border-radius: 10px;
            background: #1a1a2e;
            box-shadow: 0 10px 25px rgba(0,0,0,0.2);
            text-align: center; /* Ensures that the text is centered within the container */
        }
        h2, h4 {
            margin-bottom: 20px; /* Adds space below the headings */
        }
        a {
            display: block;
            margin: 10px auto; /* Centers the link blocks horizontally */
            padding: 10px 20px;
            background: #0f3460;
            color: white;
            border-radius: 5px;
            text-decoration: none;
            width: 80%; /* Makes links 80% of their container's width */
            max-width: 300px; /* Ensures the links are not too wide on larger screens */
        }
        a:hover {
            background: #16213e;
            transform: scale(1.05);
        }
    </style>
</head>
<body>
    <div class="main-container">
        <h2>Welcome to the Auction!</h2>
        <h4>Select an account type and login:</h4>
        <a href="login.jsp" class="hover:underline">User</a>
        <a href="customerRepLogin.jsp" class="hover:underline">Customer Representation</a>
        <a href="adminLogin.jsp" class="hover:underline">Admin</a>
    </div>
</body>
</html>
