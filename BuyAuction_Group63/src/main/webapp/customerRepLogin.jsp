<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Customer Representative Login</title>
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
    <style>
        body {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            background: #16213e;
            color: #ffffff;
        }
        .form-container {
            width: 100%;
            max-width: 320px;
            background: #1a1a2e;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 5px 15px rgba(0,0,0,0.5);
        }
        .form-input, .form-button {
            width: calc(100% - 20px);
            padding: 10px;
            margin: 10px 0;
            border: none;
            border-radius: 5px;
        }
        .form-input {
            background-color: #fff; /* Ensuring the background is white for better contrast */
            color: #000; /* Setting text color to black for visibility */
        }
        .form-button {
            background-color: #0f3460;
            color: white;
            cursor: pointer;
            border-radius: 5px;
        }
        .form-button:hover {
            background-color: #16213e;
        }
        h3 {
            text-align: center;
            color: #ffffff;
        }
        .text-center a {
            color: #76c7c0;
            text-decoration: none;
            margin-top: 10px;
            display: block;
            text-align: center;
        }
        .back-button {
            position: absolute;
            top: 20px;
            left: 20px;
            padding: 8px 16px;
            background: #334257;
            color: white;
            text-decoration: none;
            border-radius: 5px;
            box-shadow: 2px 2px 10px rgba(0,0,0,0.3);
        }
        .back-button:hover {
            background: #476072;
        }
    </style>
</head>
<body class="bg-gray-900 font-sans leading-normal tracking-normal">
    <a href="homepage.jsp" class="back-button">Return to Homepage</a>
    <div class="form-container">
        <h2>Customer Rep Login</h2>
        <form action="checkCustomerRepLogin.jsp" method="POST">
            Username: <input type="text" id="username" name="username" class="form-input" required>
            Password: <input type="password" id="password" name="password" class="form-input" required>
            <input type="submit" value="Submit" class="form-button">
        </form>
    </div>
</body>
</html>
