<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Room</title>
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
<div class="container">
    <h2>Add a Room</h2>

    <form action="AddRoomServlet" method="POST">
        <label for="room_type">Room Type:</label>
        <select name="room_type" id="room_type" required>
            <option value="single">Single</option>
            <option value="double">Double</option>
            <option value="suite">Suite</option>
        </select>

        <label for="price">Price (in USD):</label>
        <input type="number" name="price" id="price" required min="0" step="0.01">

        <label for="description">Description:</label>
        <input type="text" name="description" id="description" required>

        <input type="submit" value="Add Room">
    </form>
</div>
</body>
</html>