<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Booking Success</title>
    <!-- Bootstrap CSS -->
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f4f4f4;
            font-family: 'Arial', sans-serif;
        }
        .confirmation-container {
            margin-top: 100px;
            padding: 60px;
            border-radius: 10px;
            background-color: #ffffff;
            box-shadow: 0px 0px 15px rgba(0, 0, 0, 0.1);
        }
        .confirmation-container h2 {
            color: #333;
            margin-bottom: 30px;
        }
        .confirmation-container p {
            font-size: 18px;
        }
        .btn-success {
            background-color: #333;
            border: none;
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
<body><nav>
    <a href="guestBookings.jsp">Home</a>
    <a href="bookroom.jsp">Bookings</a>
    <a href="sendreview.jsp">Add Reviews</a>
    <a href="viewreviews.jsp">View Reviews</a>
    <a href="profile.jsp">Profile</a>

    <a href="logout">Logout</a>
</nav>
<div class="container confirmation-container">
    <h2 class="text-center">Booking Successful!</h2>
    <p class="text-center">
        Thank you for choosing us. Your room has been successfully booked.
        Our team will get in touch with you shortly for further details.
    </p>
    <div class="text-center mt-4">
        <a href="guestBookings.jsp" class="btn btn-success">Back to Home</a>
    </div>
</div>


<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
