<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="com.example.hms.Booking" %>
<%@ page import="com.example.hms.DBHandler" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Manage Bookings</title>
    <!-- Bootstrap CSS -->
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .btn-update {
            background-color: #f0ad4e;
            color: #fff;
            border: none;
        }
        .btn-delete {
            background-color: #d9534f;
            color: #fff;
            border: none;
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
</head>
<body>
<nav>
    <a href="index.jsp">Home</a>
    <a href="add.jsp">Add room</a>
    <a href="managebooking.jsp">Manage booking</a>
    <a href="showrooms.jsp">Manage Room</a>
    <a href="allreview.jsp">View Reviews</a>

    <a href="#">Logout</a>
</nav>
<div class="container mt-5">
    <h2 class="mb-4">Manage Bookings</h2>
    <table class="table table-striped">
        <thead>
        <tr>
            <th>Booking ID</th>
            <th>Guest Name</th>
            <th>Room ID</th>
            <th>Check-in Date</th>
            <th>Check-out Date</th>

            <th>Actions</th>
        </tr>
        </thead>
        <tbody>
        <%
            List<Booking> bookings = new ArrayList<>();

            try (Connection conn = DBHandler.getConnection();
                 PreparedStatement ps = conn.prepareStatement("SELECT * FROM booking")) {
                ResultSet rs = ps.executeQuery();
                while(true) {
                    try {
                        if (!rs.next()) break;
                    } catch (SQLException e) {
                        throw new RuntimeException(e);
                    }
                    Booking booking = new Booking();
                    booking.setBookingId(rs.getInt("booking_id"));
                    booking.setRoomId(rs.getInt("room_id"));
                    booking.setCheckIn(rs.getDate("check_in"));
                    booking.setCheckOut(rs.getDate("check_out"));
                    booking.setStatus(rs.getString("status"));
                    bookings.add(booking);
                }
            } catch (SQLException e) {
                e.printStackTrace();
                // handle the exception accordingly
            }

            for(Booking booking : bookings) {
        %>
        <tr>
            <td><%= booking.getBookingId() %></td>
            <td><%= booking.getRoomId() %></td>
            <td><%= booking.getCheckIn() %></td>
            <td><%= booking.getCheckOut() %></td>
            <td><%= booking.getStatus() %></td>
            <td>
                <a href="updateBooking.jsp?booking_id=<%= booking.getBookingId() %>" class="btn btn-update">Update</a>
                <a href="Deletebooking?booking_id=<%= booking.getBookingId() %>" class="btn btn-delete">Delete</a>
            </td>
        </tr>
        <%
            }
        %>
        </tbody>
    </table>
</div>

<!-- Bootstrap JS & jQuery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
