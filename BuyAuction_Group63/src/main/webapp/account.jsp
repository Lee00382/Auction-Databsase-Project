<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Account Page</title>
<link rel="stylesheet"
		href="https://cdn.jsdelivr.net/gh/kognise/water.css@latest/dist/dark.min.css">
</head>
<body>
	<button onclick="window.location.href='homepage.jsp';">Return to Homepage</button><br>
	<button onclick="window.location.href='logout.jsp';">Logout</button><br>

<% out.println("Welcome: "+ session.getAttribute("user")); %>
	<div class="frontend">
		<h1>Account Page</h1>
		
		<h2>Search Functions</h2>
		<ul>
			<li><a href="filterProducts.jsp">Filter Items Based on Criteria</a></li>
			<li><a href="searchProducts.jsp">Search items Based on Keywords</a></li>
			<li><a href="searchAuctionsByUsers.jsp">Search Auctions By Users</a></li>
		</ul>
		<h2>Auction Functions</h2>	
		<ul>
			<li><a href="sortAuctions.jsp">View All Open Auctions</a></li>
			<li><a href="myAuctions.jsp">My Auctions</a></li>
			<li><a href="createItem.jsp">Create a new item</a></li>
			<li><a href="showAllItem.jsp">View Items</a></li>
		</ul>
		<h2>Account Functions</h2>
		<ul>
			<li><a href="viewAlerts.jsp">View My Alerts</a></li>
			<li><a href="viewMyBidHistory.jsp">View My Bid History</a></li>
		</ul>
		<h2>Customer Service</h2>	
		<ul>
			<li><a href="askQuestion.jsp">Ask Question to a Customer Representative</a></li>
		</ul>
	</div>
</body>
</html>