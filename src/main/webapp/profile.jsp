<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Profile Update</title>
  <!-- Bootstrap CSS -->
  <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">

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
</head>
<body>

<div class="container profile-container">
  <h2 class="text-center mb-4">Update Profile</h2>

  <form action="ProfileUpdate" method="post">
    <div class="form-group">
      <label for="username">Username:</label>
      <input type="text" class="form-control" id="username" name="username" required value="<%= session.getAttribute("username") %>" readonly>
    </div>
    <div class="form-group">
      <label for="password">New Password:</label>
      <input type="password" class="form-control" id="password" name="password" required placeholder="Enter new password">
    </div>
    <div class="form-group">
      <label for="confirmPassword">Confirm New Password:</label>
      <input type="password" class="form-control" id="confirmPassword" name="confirmPassword" required placeholder="Confirm new password">
    </div>
    <button type="submit" class="btn mt-3" id="update-button">Update</button>
  </form>

  <!-- Delete Button with Confirmation -->
  <button class="btn btn-danger mt-3" id="delete-button" onclick="confirmDelete()">Delete Account</button>

  <script>
    function confirmDelete() {
      var isConfirmed = confirm("Are you sure you want to delete your account?");
      if (isConfirmed) {
        // You can redirect the user to the delete account servlet or perform an AJAX call
        window.location.href = "DeleteAccountServlet"; // Replace "DeleteAccountServlet" with the correct URL
      }
    }
  </script>
</div>

<!-- Bootstrap JS and jQuery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
