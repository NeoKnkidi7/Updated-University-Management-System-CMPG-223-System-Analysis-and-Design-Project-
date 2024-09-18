<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ApplicantPage.aspx.cs" Inherits="Prototype_University_IS_.ApplicantPage" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Track Your Application - Howark University</title>
    <style type="text/css">
        /* Modernized CSS */
        body {
            font-family: 'Roboto', Arial, sans-serif;
            background-color: #f0f2f5;
            margin: 0;
            padding: 0;
        }
        .header, .footer {
            background-color: #2c3e50;
            color: white;
            text-align: center;
            padding: 20px;
        }
        .nav-bar {
            background-color: #1abc9c;
            padding: 15px;
            text-align: center;
            position: sticky;
            top: 0;
            z-index: 1;
        }
        .nav-bar a {
            color: white;
            padding: 12px 20px;
            font-size: 1.2em;
            text-decoration: none;
        }
        .nav-bar a:hover {
            background-color: #16a085;
        }
        .container {
            max-width: 1200px;
            margin: auto;
            padding: 20px;
        }
        .status-tracker {
            display: flex;
            justify-content: space-between;
            margin-bottom: 20px;
        }
        .status-step {
            flex: 1;
            padding: 20px;
            background-color: #e9ecef;
            border-radius: 10px;
            text-align: center;
            margin: 0 10px;
        }
        .status-step.active {
            background-color: #1abc9c;
            color: white;
        }
        .form-section {
            background-color: #ffffff;
            border-radius: 10px;
            padding: 20px;
            margin-bottom: 20px;
        }
        .form-section h2 {
            border-bottom: 2px solid #1abc9c;
            padding-bottom: 10px;
        }
        .form-group {
            margin-bottom: 15px;
        }
        .form-group label {
            display: block;
            margin-bottom: 5px;
        }
        .form-group input, .form-group select, .form-group button {
            width: 100%;
            padding: 10px;
            border-radius: 8px;
            border: 1px solid #ddd;
        }
        .form-group button {
            background-color: #1abc9c;
            color: white;
            cursor: pointer;
        }
        .progress-bar {
            display: flex;
            justify-content: space-around;
            margin-top: 30px;
        }
        .progress-step {
            flex: 1;
            text-align: center;
            padding: 20px;
        }
        .progress-step.completed {
            background-color: #1abc9c;
            color: white;
        }
        .notification {
            background-color: #f9f9f9;
            border: 1px solid #ddd;
            padding: 15px;
            border-radius: 8px;
            margin-bottom: 20px;
        }
        .notification.success {
            border-color: #28a745;
            color: #28a745;
        }
        .notification.error {
            border-color: #dc3545;
            color: #dc3545;
        }
        .footer {
            margin-top: 40px;
            padding: 15px;
            background-color: #2c3e50;
            color: white;
            text-align: center;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="header">
            <h1>Howark University - Application Tracker</h1>
        </div>

        <div class="nav-bar">
            <a href="Home.aspx">Home</a>
            <a href="Profile.aspx">Profile</a>
            <a href="ApplicationPage.aspx">My Application</a>
            <a href="Support.aspx">Support</a>
        </div>

        <div class="container">
            <!-- Application Status -->
            <div class="status-tracker">
                <div class="status-step active">Application Submitted</div>
                <div class="status-step">Under Review</div>
                <div class="status-step">Decision Pending</div>
                <div class="status-step">Accepted/Rejected</div>
            </div>

            <!-- Personal Info -->
            <div class="form-section">
                <h2>Your Application Details</h2>
                <div class="form-group">
                    <label for="fullName">Full Name</label>
                    <input type="text" id="fullName" runat="server" placeholder="John Doe" disabled />
                </div>
                <div class="form-group">
                    <label for="appliedCourse">Applied Course</label>
                    <input type="text" id="appliedCourse" runat="server" placeholder="Bachelor of Science in Computer Science" disabled />
                </div>
            </div>

            <!-- Upload and Track Documents -->
            <div class="form-section">
                <h2>Document Upload and Verification</h2>
                <div class="form-group">
                    <label for="documentUpload">Upload Missing Documents</label>
                    <input type="file" id="documentUpload" runat="server" />
                </div>
                <div class="form-group">
                    <button type="submit" runat="server">Upload</button>
                </div>
            </div>

            <!-- Notifications Section -->
            <div class="notification success">
                Your application is currently under review. Please check back later for updates.
            </div>
        </div>

        <div class="footer">
            <p>&copy; 2024 Howark University. All Rights Reserved.</p>
        </div>
    </form>
</body>
</html>