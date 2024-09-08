<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.sql.*" %>
<%@ page import="com.example.hms.DBHandler" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>View Reviews</title>
    <!-- Adding Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>

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
    <a href="profile.jsp">Profile</a>

    <a href="logout">Logout</a>
</nav>
<div class="container mt-5">
    <h2 class="mb-4">Guest Reviews</h2>
    <table class="table table-striped">
        <thead>
        <tr>
            <th>Name</th>
            <th>Rating</th>
            <th>Review</th>
            <th>Submitted Date</th>
            <th>Action</th> <!-- Additional column for Update & Delete buttons -->
        </tr>
        </thead>
        <tbody>
        <%
            Connection conn = null;
            PreparedStatement ps = null;
            ResultSet rs = null;
            int userId = 1;
            userId = ((Integer) session.getAttribute("user_id"));
            try {
                // Your DB connection method
                conn = DBHandler.getConnection();
                String sql = "SELECT * FROM review WHERE userid = ? ORDER BY submitted_date DESC";
                ps = conn.prepareStatement(sql);
                ps.setInt(1, userId);  // Setting the value for the placeholder

                rs = ps.executeQuery();

                while(rs.next()) {
        %>
        <tr>
            <td><%= rs.getString("name") %></td>
            <td><%= rs.getInt("rating") %></td>
            <td><%= rs.getString("review") %></td>
            <td><%= rs.getTimestamp("submitted_date") %></td>
            <td>
                <!-- Update and Delete buttons -->
                <a href="updatereview.jsp?review_id=<%= rs.getInt("id") %>" class="btn btn-success">Update</a>
                <a href="DeleteReview?review_id=<%= rs.getInt("id") %>" class="btn btn-danger">Delete</a>
            </td>
        </tr>
        <%
                }
            } catch (SQLException e) {
                e.printStackTrace();
            } finally {
                try {
                    if (rs != null) rs.close();
                    if (ps != null) ps.close();
                    if (conn != null) conn.close();
                } catch (SQLException se) {
                    se.printStackTrace();
                }
            }
        %>
        </tbody>
    </table>

</div>

<!-- Optional Bootstrap JS -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
