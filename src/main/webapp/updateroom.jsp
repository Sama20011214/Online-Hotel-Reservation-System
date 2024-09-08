<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*, com.example.hms.DBHandler" %>
<!DOCTYPE html>
<html>
<head>
    <title>Update Room</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <!-- Optional: Bootstrap JS and Popper.js for some components -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</head>
<style>

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

    body {
        font-family: Arial, sans-serif;
        margin: 0;
        padding: 0;
        background-color: #f4f4f4;
    }

    .container {
        width: 60%;
        margin: 50px auto;
        background-color: #fff;
        padding: 20px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    }

    .container h2 {
        text-align: center;
        border-bottom: 1px solid #e4e4e4;
        padding-bottom: 10px;
        margin-bottom: 20px;
    }

    form {
        display: flex;
        flex-direction: column;
    }

    label {
        margin-bottom: 8px;
        font-weight: bold;
    }

    input[type="text"], input[type="number"], select {
        padding: 10px;
        margin-bottom: 20px;
        border: 1px solid #e4e4e4;
        border-radius: 4px;
    }

    input[type="submit"] {
        padding: 10px 15px;
        background-color: #333;
        color: #fff;
        border: none;
        border-radius: 4px;
        cursor: pointer;
        transition: background-color 0.3s;
    }

    input[type="submit"]:hover {
        background-color: #444;
    }
</style>
<body>
<nav>
    <a href="../index.jsp">Home</a>
    <a href="add.jsp">Add room</a>
    <a href="managebooking.jsp">Manege booking</a>
    <a href="../showrooms.jsp">Manege Room</a>
    <a href="allreview.jsp">View Reviews</a>

    <a href="logout">Logout</a>
</nav>
<div class="container mt-5">
    <h2>Update Room Details</h2>
    <form action="UpdateRoomHandlerServlet" method="post">
        <%
            int roomID = Integer.parseInt(request.getParameter("room_id"));
            Connection conn = null;
            PreparedStatement stmt = null;
            try {
                conn = DBHandler.getConnection();
                stmt = conn.prepareStatement("SELECT * FROM room WHERE room_id = ?");
                stmt.setInt(1, roomID);
                ResultSet rs = stmt.executeQuery();
                if(rs.next()) {
        %>
        <!-- Hidden input to hold the room ID -->
        <input type="hidden" name="room_id" value="<%= roomID %>">

        <div class="form-group">
            <label for="room_type">Room Type:</label>
            <select name="room_type" id="room_type" class="form-control" required>
                <option value="single" <%= rs.getString("room_type").equals("single") ? "selected" : "" %>>Single</option>
                <option value="double" <%= rs.getString("room_type").equals("double") ? "selected" : "" %>>Double</option>
                <option value="suite"  <%= rs.getString("room_type").equals("suite")  ? "selected" : "" %>>Suite</option>
            </select>
        </div>

        <div class="form-group">
            <label for="price">Price:</label>
            <input type="text" class="form-control" id="price" name="price" value="<%= rs.getBigDecimal("price") %>" required>
        </div>
        <div class="form-group">
            <label for="description">Description:</label>
            <textarea class="form-control" id="description" name="description" required><%= rs.getString("description") %></textarea>
        </div>
        <button type="submit" class="btn btn-primary">Update Room</button>
        <%
                }
                rs.close();
            } catch(SQLException se) {
                se.printStackTrace();
            } finally {
                DBHandler.closeConnection(conn);
            }
        %>
    </form>
</div>
</body>
</html>
