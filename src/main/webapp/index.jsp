<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Hotel Management System</title>  <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>About Us</title>
    <!-- Bootstrap CSS -->
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Lato:wght@300;400;700&display=swap" rel="stylesheet">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css">
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



        .about-image {
            width: 100%;      /* Setting the width to 100% makes it responsive */
            max-width: 500px; /* Maximum width of the image */
            margin: 20px 0;   /* Adding some margin for spacing */
            display: block;   /* Makes it easier to center */
            margin-left: auto;
            margin-right: auto;
        }
    </style>
</head>
<body>
<header>
    <h1>Hotel Management System</h1>
</header>

<nav>
    <a href="index.jsp">Home</a>
    <a href="bookroom.jsp">Bookings</a>

    <a href="login.jsp">Login</a>
</nav>
<div class="container mt-5">
    <h1 class="display-4 mb-4 text-center">About Us</h1>

    <div class="row">
        <div class="col-md-6">
            <img src="https://as2.ftcdn.net/v2/jpg/00/09/21/15/1000_F_9211505_d4hxfNtPeTfgt7AeGmoO7u79P2hwxkoQ.jpg" alt="Description of Image" class="img-fluid rounded mb-4">
        </div>
        <div class="col-md-6">
            <p class="lead">Welcome to our Hotel Management System. We aim to provide the best services and make your experience seamless. From booking rooms to leaving reviews, we have got everything covered for you.</p>
        </div>
    </div>

    <div class="card bg-light mb-4 p-4">
        <h2 class="mb-4"><i class="fas fa-bed mr-2"></i>Our Rooms</h2>
        <p>We offer a variety of rooms to suit your needs. Whether you're looking for a single room, a double room, or a suite, we have options available for you. Check our bookings page for more details.</p>
    </div>

    <div class="card bg-light p-4">
        <h2 class="mb-4"><i class="fas fa-envelope mr-2"></i>Contact Us</h2>
        <p>If you have any questions or would like to get in touch, please contact us at <a href="mailto:info@hotelmanagement.com">info@hotelmanagement.com</a>.</p>
    </div>
</div>


<!-- Start of the Footer -->
<footer class="mt-5 bg-dark text-white">
    <div class="container py-4">
        <div class="row">
            <div class="col-lg-4 col-md-6 mb-4 mb-lg-0">
                <h4 class="text-uppercase font-weight-bold">About Sri Lanka</h4>
                <p>Sri Lanka, the pearl of the Indian Ocean, is known for its rich cultural heritage, breathtaking beaches, diverse wildlife, and exquisite tea plantations.</p>
            </div>
            <div class="col-lg-2 col-md-6 mb-4 mb-lg-0">
                <h4 class="text-uppercase font-weight-bold">Quick Links</h4>
                <ul class="list-unstyled mb-0">
                    <li><a href="#" class="text-white">Tourist Attractions</a></li>
                    <li><a href="#" class="text-white">Cuisine</a></li>
                    <li><a href="#" class="text-white">Festivals</a></li>
                    <li><a href="#" class="text-white">Contact Us</a></li>
                </ul>
            </div>
            <div class="col-lg-3 col-md-6 mb-4 mb-lg-0">
                <h4 class="text-uppercase font-weight-bold">Contact</h4>
                <ul class="list-unstyled mb-0">
                    <li><i class="fa fa-home mr-2"></i> Colombo, Sri Lanka</li>
                    <li><i class="fa fa-envelope mr-2"></i> info@hotelmanagement.com</li>
                    <li><i class="fa fa-phone mr-2"></i> +94 11 234 5678</li>
                </ul>
            </div>
            <div class="col-lg-3 col-md-6">
                <h4 class="text-uppercase font-weight-bold">Follow Us</h4>
                <ul class="list-inline mt-4">
                    <li class="list-inline-item"><a href="#" target="_blank" title="twitter"><i class="fab fa-twitter-square fa-2x text-white mr-2"></i></a></li>
                    <li class="list-inline-item"><a href="#" target="_blank" title="facebook"><i class="fab fa-facebook-square fa-2x text-white mr-2"></i></a></li>
                    <li class="list-inline-item"><a href="#" target="_blank" title="instagram"><i class="fab fa-instagram-square fa-2x text-white"></i></a></li>
                </ul>
            </div>
        </div>
    </div>

    <div class="text-center bg-secondary py-3">
        <p class="mb-0">© 2023 Hotel Management. All rights reserved.</p>
    </div>
</footer>
<!-- End of the Footer -->

<!-- Font Awesome -->
<script src="https://kit.fontawesome.com/a076d05399.js"></script>


</body>
</html>
