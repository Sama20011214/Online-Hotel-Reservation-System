<%@ page import="java.sql.*, java.util.ArrayList" %>
<%@ page import="com.example.hms.DBHandler" %>
<%@ page import="com.example.hms.Booking" %>
<%@ page import="java.util.List" %> <%-- Replace with your actual package name --%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Guest Bookings</title>
    <!-- Adding Bootstrap CSS -->
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
<body>

<%
    // Assuming you have the user's ID stored in the session after they log in
    int userId = 1;
userId = ((Integer) session.getAttribute("user_id"));
    System.out.println(userId);
    List<Booking> bookings = new ArrayList<>();
    try (Connection conn = DBHandler.getConnection();
         PreparedStatement ps = conn.prepareStatement("SELECT * FROM booking WHERE user_id = ?")) {

        ps.setInt(1, userId);
        ResultSet rs = ps.executeQuery();

        while (rs.next()) {
            Booking booking = new Booking();
            booking.setBookingId(rs.getInt("booking_id"));
            booking.setUserId(rs.getInt("user_id"));
            booking.setRoomId(rs.getInt("room_id"));
            booking.setCheckIn(rs.getDate("check_in"));
            booking.setCheckOut(rs.getDate("check_out"));
            booking.setStatus(rs.getString("status"));
            bookings.add(booking);
        }
    } catch (SQLException e) {
        e.printStackTrace();
    }
%>
<nav>
    <a href="guestBookings.jsp">Home</a>
    <a href="bookroom.jsp">Bookings</a>
    <a href="sendreview.jsp">Add Reviews</a>
    <a href="viewreviews.jsp">View Reviews</a>
    <a href="profile.jsp">Profile</a>

    <a href="logout">Logout</a>
</nav>
<div class="container mt-5">
    <h2 class="text-center mb-4">Your Bookings</h2>
    <table class="table table-bordered">
        <thead>
        <tr>
            <th>Booking ID</th>
            <th>Room ID</th>
            <th>Check-in Date</th>
            <th>Check-out Date</th>
            <th>Status</th>

        </tr>
        </thead>
        <tbody>
        <% for(Booking booking : bookings) { %>
        <tr>
            <td><%= booking.getBookingId() %></td>
            <td>Room <%= booking.getRoomId() %></td> <%-- You might want to fetch more details about the room from the rooms table --%>
            <td><%= booking.getCheckIn() %></td>
            <td><%= booking.getCheckOut() %></td>
            <td><span class="badge <%= booking.getStatus().equals("confirmed") ? "badge-success" : booking.getStatus().equals("pending") ? "badge-warning" : "badge-danger" %>"><%= booking.getStatus() %></span></td>

        </tr>
        <% } %>
        </tbody>
    </table>
</div>

<!-- Adding Bootstrap JS and jQuery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

</body>
</html>
