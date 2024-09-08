<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="com.example.hms.DBHandler" %>
<%@ page import="java.sql.SQLException" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Submit Review</title>

    <!-- Include Bootstrap CSS -->
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
</head>

<style>
    body {
        font-family: Arial, sans-serif;
        margin: 0;
        padding: 0;
        background-color: #f4f4f4;
    }

    header {
        background-color: #333;
        color: #fff;
        padding: 20px;
        text-align: center;
    }

    nav {
        display: flex;
        justify-content: center;
        background-color: #444;
    }

    nav a {
        color: #fff;
        padding: 14px 20px;
        text-decoration: none;
        transition: background-color 0.3s;
    }

    nav a:hover {
        background-color: #555;
    }

    .container {
        width: 80%;
        margin: 20px auto;
        background-color: #fff;
        padding: 20px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    }

    footer {
        background-color: #333;
        color: #fff;
        text-align: center;
        padding: 20px 0;
        position: fixed;
        bottom: 0;
        width: 100%;
    }
</style>
<nav>
    <a href="guestBookings.jsp">Home</a>
    <a href="bookroom.jsp">Bookings</a>
    <a href="sendreview.jsp">Add Reviews</a>
    <a href="viewreviews.jsp">View Reviews</a>
    <a href="logout">Logout</a>
</nav>
<body>
<%
    int reviewId = Integer.parseInt(request.getParameter("review_id"));
    Connection conn = null;
    PreparedStatement stmt = null;
    ResultSet rs = null;
    try {
        conn = DBHandler.getConnection();  // Assuming DBHandler is your database connection class
        String sql = "SELECT * FROM review WHERE id = ?";
        stmt = conn.prepareStatement(sql);
        stmt.setInt(1, reviewId);
        rs = stmt.executeQuery();
        if (rs.next()) {
%>
<div class="container mt-5">
    <h2>Update Review</h2>
    <form action="UpdateReviewServlet" method="post" class="mt-4">
        <input type="hidden" name="review_id" value="<%= request.getParameter("review_id") %>">

        <div class="form-group">
            <label for="name">Name:</label>
            <input type="text" class="form-control" id="name" name="name" value="<%= rs.getString("name") %>">
        </div>

        <div class="form-group">
            <label for="rating">Rating:</label>
            <input type="number" class="form-control" id="rating" name="rating" value="<%= rs.getInt("rating") %>">
        </div>

        <div class="form-group">
            <label for="review">Review:</label>
            <textarea class="form-control" id="review" name="review" rows="3"><%= rs.getString("review") %></textarea>
        </div>

        <button type="submit" class="btn btn-primary">Update Review</button>
    </form>
</div>
<%
        }
    } catch (SQLException e) {
        e.printStackTrace();
    } finally {
        try {
            if(rs != null) rs.close();
            if(stmt != null) stmt.close();
            if(conn != null) conn.close();
        } catch (SQLException se) {
            se.printStackTrace();
        }
    }
%>

<!-- Include Bootstrap JS -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>

</html>
