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
    <a href="index.jsp">Home</a>
    <a href="add.jsp">Add room</a>
    <a href="managebooking.jsp">Manege booking</a>
    <a href="showrooms.jsp">Manege Room</a>
    <a href="allreview.jsp">View Reviews</a>

    <a href="#">Logout</a>
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
        </tr>
        </thead>
        <tbody>
        <%
            Connection conn = null;
            Statement stmt = null;
            ResultSet rs = null;

            try {
                // Replace this with your DB connection method
                conn = DBHandler.getConnection();
                stmt = conn.createStatement();
                String sql = "SELECT * FROM review ORDER BY submitted_date DESC";
                rs = stmt.executeQuery(sql);

                while(rs.next()) {
        %>
        <tr>
            <td><%= rs.getString("name") %></td>
            <td><%= rs.getInt("rating") %></td>
            <td><%= rs.getString("review") %></td>
            <td><%= rs.getTimestamp("submitted_date") %></td>
        </tr>
        <%
                }
            } catch (SQLException e) {
                e.printStackTrace();
            } finally {
                try {
                    if (rs != null) rs.close();
                    if (stmt != null) stmt.close();
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
