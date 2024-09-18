 <%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DefualtPage.aspx.cs" Inherits="Prototype_University_IS_.DefualtPage" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Howark University</title>
    <style type="text/css">
        body {
            font-family: 'Roboto', Arial, sans-serif;
            background-color: #f0f2f5;
            margin: 0;
            padding: 0;
            overflow-x: hidden;
            scroll-behavior: smooth;
        }
        .header {
            background-color: #2c3e50;
            color: white;
            text-align: center;
            padding: 30px 0;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
            transition: background-color 0.3s ease;
        }
        .header:hover {
            background-color: #34495e;
            animation: pulse 1s infinite;
        }
        .header img {
            height: 120px;
            margin-bottom: 20px;
            transition: transform 0.3s ease;
        }
        .header img:hover {
            transform: scale(1.1) rotate(5deg);
        }
        .header h1 {
            margin: 0;
            font-size: 3.5em;
            letter-spacing: 1px;
            animation: fadeIn 2s ease-out;
        }
        .nav-bar {
            background-color: #34495e;
            color: white;
            padding: 15px 0;
            text-align: center;
            position: sticky;
            top: 0;
            z-index: 2;
            transition: background-color 0.3s ease;
        }
        .nav-bar a {
            color: white;
            text-decoration: none;
            padding: 12px 25px;
            display: inline-block;
            font-size: 1.1em;
            transition: background-color 0.3s ease, transform 0.3s ease;
            border-radius: 5px;
            margin: 0 10px;
            position: relative;
        }
        .nav-bar a:hover {
            background-color: #1abc9c;
            transform: scale(1.05);
            animation: bounce 0.5s;
        }
        .nav-bar a::after {
            content: attr(title);
            position: absolute;
            bottom: -30px;
            left: 50%;
            transform: translateX(-50%);
            background-color: #333;
            color: white;
            padding: 5px;
            border-radius: 3px;
            font-size: 0.9em;
            white-space: nowrap;
            opacity: 0;
            transition: opacity 0.3s ease;
            pointer-events: none;
            z-index: 1;
        }
        .nav-bar a:hover::after {
            opacity: 1;
        }
        .hero {
            background-image: url('images/hero-bg.jpg');
            background-size: cover;
            background-position: center;
            color: white;
            text-align: center;
            padding: 80px 20px;
            margin-bottom: 20px;
            box-shadow: inset 0 0 0 2000px rgba(0, 0, 0, 0.4);
            animation: slideIn 2s ease-out;
        }
        .hero h2 {
            font-size: 3em;
            margin: 0;
            animation: fadeInUp 2s ease-out;
        }
        .hero p {
            font-size: 1.5em;
            margin: 10px 0;
            animation: fadeInUp 2s 0.5s ease-out;
        }
        .hero .btn {
            display: inline-block;
            background-color: #1abc9c;
            color: white;
            padding: 12px 25px;
            border-radius: 30px;
            text-decoration: none;
            font-weight: bold;
            margin-top: 10px;
            transition: background-color 0.3s ease, transform 0.3s ease;
            animation: fadeInUp 2s 1s ease-out;
            position: relative;
        }
        .hero .btn:hover {
            background-color: #16a085;
            transform: scale(1.05);
        }
        .hero .btn::after {
            content: attr(title);
            position: absolute;
            bottom: -30px;
            left: 50%;
            transform: translateX(-50%);
            background-color: #333;
            color: white;
            padding: 5px;
            border-radius: 3px;
            font-size: 0.9em;
            white-space: nowrap;
            opacity: 0;
            transition: opacity 0.3s ease;
            pointer-events: none;
            z-index: 1;
        }
        .hero .btn:hover::after {
            opacity: 1;
        }
        .main-content {
            display: flex;
            flex-wrap: wrap;
            padding: 20px;
            max-width: 1200px;
            margin: auto;
        }
        .sidebar {
            flex: 1 1 300px;
            padding: 20px;
            position: -webkit-sticky;
            position: sticky;
            top: 20px;
            background-color: #ffffff;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
            margin-right: 20px;
            transition: transform 0.3s ease;
        }
        .sidebar:hover {
            transform: translateY(-10px) rotate(-2deg);
            animation: wiggle 1s infinite;
        }
        .sidebar h3 {
            margin-top: 0;
            color: #2c3e50;
        }
        .sidebar ul {
            list-style: none;
            padding: 0;
        }
        .sidebar ul li {
            margin: 10px 0;
        }
        .sidebar ul li a {
            color: #1abc9c;
            text-decoration: none;
            font-weight: bold;
            transition: color 0.3s ease;
            position: relative;
        }
        .sidebar ul li a:hover {
            color: #16a085;
            text-decoration: underline;
        }
        .sidebar ul li a::after {
            content: attr(title);
            position: absolute;
            right: -120px;
            top: 50%;
            transform: translateY(-50%);
            background-color: #333;
            color: white;
            padding: 5px;
            border-radius: 3px;
            font-size: 0.9em;
            white-space: nowrap;
            opacity: 0;
            transition: opacity 0.3s ease;
            pointer-events: none;
            z-index: 1;
        }
        .sidebar ul li a:hover::after {
            opacity: 1;
        }
        .main-content-content {
            flex: 3 1 0;
        }
        .announcements, .apply-info, .contact-info {
            background-color: #ffffff;
            border: 1px solid #ddd;
            border-radius: 15px;
            padding: 20px;
            margin-bottom: 20px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
            transition: box-shadow 0.3s ease, transform 0.3s ease;
        }
        .announcements:hover, .apply-info:hover, .contact-info:hover {
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.2);
            transform: translateY(-5px);
        }
        .footer {
            background-color: #2c3e50;
            color: white;
            text-align: center;
            padding: 15px 0;
            box-shadow: 0 -4px 10px rgba(0, 0, 0, 0.2);
        }
        .apply-info a, .nav-bar a {
            display: inline-block;
            margin: 10px;
            padding: 10px 20px;
            background-color: #1abc9c;
            color: white;
            text-decoration: none;
            border-radius: 5px;
            transition: background-color 0.3s ease;
        }
        .apply-info a:hover, .nav-bar a:hover {
            background-color: #16a085;
        }

        /* Animations */
        @keyframes fadeIn {
            from { opacity: 0; }
            to { opacity: 1; }
        }
        @keyframes fadeInUp {
            from { opacity: 0; transform: translateY(20px); }
            to { opacity: 1; transform: translateY(0); }
        }
        @keyframes slideIn {
            from { opacity: 0; transform: translateY(-50px); }
            to { opacity: 1; transform: translateY(0); }
        }
        @keyframes pulse {
            0% { transform: scale(1); }
            50% { transform: scale(1.05); }
            100% { transform: scale(1); }
        }
        @keyframes bounce {
            0% { transform: scale(1); }
            50% { transform: scale(1.1); }
            100% { transform: scale(1); }
        }
        @keyframes wiggle {
            0% { transform: translateY(-10px) rotate(-2deg); }
            50% { transform: translateY(10px) rotate(2deg); }
            100% { transform: translateY(-10px) rotate(-2deg); }
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <!-- Header Section -->
        <div class="header">
            <asp:Image ID="Image1" runat="server" ImageUrl="~/Properties/Navy White University Elegant Logo.png" Height="135px" Width="256px" />
            <h1>Welcome to Howark University</h1>
            <p>Harnessing Hope’s Horizons</p>
        </div>

        <!-- Navigation Bar -->
        <div class="nav-bar">
            <a href="DefualtPage.aspx" title="Go to Home">Home</a>
            <a href="AboutUsPage.aspx" title="Learn About Us">About Us</a>
            <a href="WhatToStudyPage.aspx" title="Explore What to Study">What to Study</a>
            <a href="FacultiesPage.aspx" title="Discover Our Faculties">Faculties</a>
            <a href="LogInSystemPage.aspx" title="Log In">Log In</a>
        </div>

        <!-- Hero Section -->
        <div class="hero">
            <h2>Discover Howark University</h2>
            <p>Explore our programs and opportunities to shape your future.</p>
            <a href="#apply" class="btn" title="Apply Now">Apply Now</a>
        </div>

        <!-- Main Content Section -->
        <div class="main-content">
            <!-- Sidebar -->
            <div class="sidebar">
                <h3>Quick Links</h3>
                <ul>
                    <li><a href="#apply" title="Apply for Programs">Apply for Programs</a></li>
                    <li><a href="#contact" title="Contact Us">Contact Us</a></li>
                    <li><a href="#announcements" title="Latest Announcements">Latest Announcements</a></li>
                </ul>
            </div>
            
            <!-- Main Content -->
            <div class="main-content-content">
                <div id="announcements" class="announcements">
                    <h2>Latest Announcements</h2>
                    <p>Check out the latest updates and news from Howark University.</p>
                    <!-- Add dynamic content for announcements here -->
                </div>

                <!-- Apply for Courses Section -->
                <div id="apply" class="apply-info">
                    <h2>Apply for Courses or Programs</h2>
                    <p>Interested in joining Howark University? Click below to apply for our programs.</p>
                    <asp:LinkButton ID="btnApplyNow" runat="server" PostBackUrl="~/ApplicationPage.aspx" OnClick="btnApplyNow_Click" title="Apply for Courses">Apply Now</asp:LinkButton>
                </div>

                <!-- Contact Info Section -->
                <div id="contact" class="contact-info">
                    <h2>Contact Us</h2>
                    <p>For inquiries, please contact us at:</p>
                    <p>Email: <a href="mailto:info@howark.edu" title="Email Us">info@howark.edu</a></p>
                    <p>Phone: (123) 456-7890</p>
                </div>
            </div>
        </div>

        <!-- Footer Section -->
        <div class="footer">
            <p>&copy; 2024 Howark University. All Rights Reserved.</p>
        </div>
    </form>
</body>
</html>