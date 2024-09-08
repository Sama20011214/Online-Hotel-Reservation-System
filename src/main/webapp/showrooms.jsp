<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*, com.example.hms.DBHandler" %>
<!DOCTYPE html>
<html>
<head>
    <title>Show All Rooms</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <!-- Custom CSS -->
    <style>
        /* Custom styles if needed, these will override Bootstrap's styles */
        th {
            background-color: #f2f2f2;
        }
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

    </style>
    <!-- Optional: Bootstrap JS and Popper.js for some components -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</head>
<body>
<nav>
    <a href="index.jsp">Home</a>
    <a href="add.jsp">Add room</a>
    <a href="managebooking.jsp">Manege booking</a>
    <a href="showrooms.jsp">Manege Room</a>
    <a href="allreview.jsp">View Reviews</a>

    <a href="#">Logout</a>
</nav>
<div class="container mt-5">
    <h2>All Rooms</h2>
    <table class="table table-striped">
        <thead>
        <tr>
            <th>Room ID</th>
            <th>Room Type</th>
            <th>Price</th>
            <th>Description</th>
            <th>Actions</th>
        </tr>
        </thead>
        <tbody>
        <%
            Connection conn = null;
            Statement stmt = null;
            try {
                conn = DBHandler.getConnection();
                stmt = conn.createStatement();
                String sql = "SELECT * FROM room";
                ResultSet rs = stmt.executeQuery(sql);
                while (rs.next()) {
        %>
        <tr>
            <td><%= rs.getInt("room_id") %></td>
            <td><%= rs.getString("room_type") %></td>
            <td><%= rs.getBigDecimal("price") %></td>
            <td><%= rs.getString("description") %></td>
            <td>
                <a href=" updateroom.jsp?room_id=<%= rs.getInt("room_id") %>" class="btn btn-success">Update</a>
                <a href="deleteroom?room_id=<%= rs.getInt("room_id") %>" class="btn btn-danger">Delete</a>


            </td>
        </tr>
        <%
                }
                rs.close();
            } catch(SQLException se) {
                se.printStackTrace();
            } finally {
                DBHandler.closeConnection(conn);
            }
        %>
        </tbody>
    </table>
</div>
</body>
</html>
