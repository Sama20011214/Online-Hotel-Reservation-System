<%@ page import="java.util.List" %>
<%@ page import="com.example.hms.Room" %>
<%@ page import="com.example.hms.DBHandler" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.ArrayList" %>
<link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
<!-- Custom CSS -->

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

<%
    List<Room> availableRooms = new ArrayList<>();

    try (Connection conn = DBHandler.getConnection();
         PreparedStatement ps = conn.prepareStatement("SELECT * FROM room WHERE is_available = 1")) {

        ResultSet rs = ps.executeQuery();

        while(rs.next()) {
            Room room = new Room();
            room.setId(rs.getInt("room_id"));
            room.setType(rs.getString("room_type"));
            room.setDescription(rs.getString("description"));
            room.setPrice(rs.getDouble("price"));
            room.setAvailable(rs.getBoolean("is_available"));
            availableRooms.add(room);
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
<div class="container booking-container">
    <h2 class="text-center mb-4">Book a Room</h2>
    <form action="BookRoomHandlerServlet" method="post">
        <div class="form-group">
            <label for="guest_name">Name:</label>
            <input type="text" class="form-control" id="guest_name" name="guest_name" required>
        </div>

        <div class="form-group">
            <label for="room_id">Room:</label>
            <select name="room_id" id="room_id" class="form-control" required>
                <% for(Room room : availableRooms) { %>
                <option value="<%= room.getId() %>">
                    Room<%= room.getId() %> - <%= room.getType() %>
                </option>
                <% } %>
            </select>
        </div>

        <div class="form-group">
            <label for="check_in_date">Check-in Date:</label>
            <input type="date" class="form-control" id="check_in_date" name="check_in_date" required>
        </div>
        <div class="form-group">
            <label for="check_out_date">Check-out Date:</label>
            <input type="date" class="form-control" id="check_out_date" name="check_out_date" required>
        </div>
        <button type="submit" class="btn mt-3">Book Now</button>
    </form>
</div>
