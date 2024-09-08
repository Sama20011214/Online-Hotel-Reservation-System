<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Update Booking</title>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
</head>    <style>
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
<body>
<nav>
    <a href="index.jsp">Home</a>
    <a href="add.jsp">Add room</a>
    <a href="managebooking.jsp">Manege booking</a>
    <a href="showrooms.jsp">Manege Room</a>
    <a href="allreview.jsp">View Reviews</a>

    <a href="#">Logout</a>
</nav>
<%=request.getParameter("booking_id")%>

<div class="container">
    <h2 class="text-center">Update Booking</h2>

    <form action="updatebook" method="post">
        <input type="hidden" name="booking_id" value="<%=request.getParameter("booking_id")%>"/>

        <div class="form-group">
            <label for="status">Status:</label>
            <select class="form-control" id="status" name="status">
                <option value="confirmed">Confirmed</option>
                <option value="cancelled">Cancelled</option>
                <option value="pending">Pending</option>
            </select>
        </div>

        <div class="form-group">
            <label for="check_in">Check-in Date:</label>
            <input type="date" class="form-control" id="check_in" name="check_in" value="<%=request.getAttribute("checkIn")%>"/>
        </div>

        <div class="form-group">
            <label for="check_out">Check-out Date:</label>
            <input type="date" class="form-control" id="check_out" name="check_out" value="<%=request.getAttribute("checkOut")%>"/>
        </div>

        <button type="submit" class="btn btn-primary">Update Booking</button>
    </form>
</div>

</body>
</html>
