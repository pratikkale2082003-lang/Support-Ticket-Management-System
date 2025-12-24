<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Support Ticket System</title>

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

    <style>
        body {
            font-family: Arial, sans-serif;
        }

       /* hero overlay*/
        .hero {
            background:
                linear-gradient(
                    rgba(13, 110, 253, 0.80),
                    rgba(13, 110, 253, 0.80)
                ),
                url("https://images.unsplash.com/photo-1521791136064-7986c2920216");
            background-size: cover;
            background-position: center;
            background-repeat: no-repeat;
            color: white;
            padding: 100px 20px;
            text-align: center;
        }

        .feature-box {
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
            height: 100%;
            background: white;
        }

        footer {
            background: #212529;
            color: white;
            padding: 30px 0;
        }

        footer a {
            color: #adb5bd;
            text-decoration: none;
        }

        footer a:hover {
            color: white;
        }

        .footer-title {
            font-weight: bold;
        }

        .footer-links {
            list-style: none;
            padding: 0;
        }

        .footer-links li {
            margin-bottom: 8px;
        }

        .footer-line {
            border-color: #444;
        }
    </style>
</head>
<body>

<!-- NAVBAR -->
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    <div class="container">
        <a class="navbar-brand" href="#">Support Ticket System</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav ms-auto">
                <li class="nav-item"><a class="nav-link active" href="#">Home</a></li>
                <li class="nav-item"><a class="nav-link" href="/login2">Login</a></li>
                <li class="nav-item">
                    <a class="nav-link btn btn-primary text-white ms-2" href="/register3">Sign Up</a>
                </li>
            </ul>
        </div>
    </div>
</nav>

<!-- HERO SECTION -->
<section class="hero">
    <h1>Get the Right Support. Stress-Free.</h1>
    <p class="mt-3">
        Raise issues easily, track progress transparently, and get faster resolutions.
    </p>
    <div class="mt-4">
        <a href="/register3" class="btn btn-light btn-lg me-2">Register Customer</a>
        <a href="/login2" class="btn btn-outline-light btn-lg">Login</a>
    </div>
</section>

<!-- FEATURES -->
<section class="container my-5">
    <div class="row text-center mb-4">
        <h2>Why Choose Our System?</h2>
        <p class="text-muted">Simple, fast, and reliable support management</p>
    </div>

    <div class="row g-4">
        <div class="col-md-3">
            <div class="feature-box">
                <h5>Stress-Free Resolution</h5>
                <p>Get instant updates and notifications on ticket progress.</p>
            </div>
        </div>

        <div class="col-md-3">
            <div class="feature-box">
                <h5>Powerful Ticket Management</h5>
                <p>Create tickets with priority, category, and attachments.</p>
            </div>
        </div>

        <div class="col-md-3">
            <div class="feature-box">
                <h5>Easy Tracking</h5>
                <p>Track ticket status: Open, In Progress, or Closed.</p>
            </div>
        </div>

        <div class="col-md-3">
            <div class="feature-box">
                <h5>Smart Assignment</h5>
                <p>Tickets assigned to the right support staff automatically.</p>
            </div>
        </div>
    </div>
</section>

<!-- USER ROLES -->
<section class="bg-light py-5">
    <div class="container">
        <div class="row text-center mb-4">
            <h2>User Roles</h2>
        </div>

        <div class="row g-4">
            <div class="col-md-4">
                <div class="feature-box">
                    <h5>User</h5>
                    <ul class="text-start">
                        <li>Raise tickets</li>
                        <li>Track ticket status</li>
                        <li>View ticket history</li>
                    </ul>
                </div>
            </div>

            <div class="col-md-4">
                <div class="feature-box">
                    <h5>Support Staff</h5>
                    <ul class="text-start">
                        <li>View assigned tickets</li>
                        <li>Update ticket status</li>
                        <li>Respond to users</li>
                    </ul>
                </div>
            </div>

            <div class="col-md-4">
                <div class="feature-box">
                    <h5>Admin</h5>
                    <ul class="text-start">
                        <li>Manage users & staff</li>
                        <li>Assign tickets</li>
                        <li>Generate reports</li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</section>

<!-- FOOTER -->
<footer class="mt-5">
    <div class="container">
        <div class="row">

            <div class="col-md-4 mb-4">
                <h5 class="footer-title">Support Ticket System</h5>
                <p>
                    A smart platform to raise, track, and resolve customer issues efficiently
                    with transparency and speed.
                </p>
            </div>

            <div class="col-md-4 mb-4">
                <h5 class="footer-title">Quick Links</h5>
                <ul class="footer-links">
                    <li><a href="/">Home</a></li>
                    <li><a href="/register3">Register</a></li>
                    <li><a href="/login2">Login</a></li>
                    <li><a href="#">Help Center</a></li>
                </ul>
            </div>

            <div class="col-md-4 mb-4">
                <h5 class="footer-title">Contact</h5>
                <p>📧 pratikkale@gmail.com</p>
                <p>📍 Pune, India</p>
            </div>
        </div>

        <hr class="footer-line">

        <div class="text-center">
            © 2024–25 Support Ticket System | All Rights Reserved
        </div>
    </div>
</footer>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
