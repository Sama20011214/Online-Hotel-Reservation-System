<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
    <!-- Bootstrap CSS -->
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <!-- Custom CSS -->
    <style>
        body {
            background-color: #f7f7f9;
        }
        .login-container {
            max-width: 400px;
            margin: 5% auto;
            padding: 20px 30px;
            background-color: #fff;
            box-shadow: 0 4px 15px rgba(0,0,0,.05);
        }
        button {
            width: 100%;
            background-color: #333;
            border: none;
            color: #fff;  /* Text color is white for better readability against the dark background */
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
        #button_class {
            width: 100%;
            background-color: #333;
            border: none;
            color: white;
        }
    </style>
</head>
<body>
<nav>
    <a href="index.jsp">Home</a>
    <a href="#">Bookings</a>
    <a href="#">Reviews</a>

    <a href="#">Login</a>
</nav>

<div class="container login-container">
    <h2 class="text-center mb-4">Register</h2>
    <form action="RegisterHandlerServlet" method="post">
        <div class="form-group">
            <label for="username">Username:</label>
            <input type="text" class="form-control" id="username" name="username" required>
        </div>
        <div class="form-group">
            <label for="email">email:</label>
            <input type="text" class="form-control" id="email" name="email" required>
        </div>
        <div class="form-group">
            <label for="password">Password:</label>
            <input type="password" class="form-control" id="password" name="password" required>
        </div>
        <button type="submit" class="btn mt-3" id = "button_class">Register</button>
    </form>
    <div class="text-center mt-3">
        <p><a href="login.jsp">login</a></p>
    </div>
</div>


<!-- Bootstrap JS and jQuery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
