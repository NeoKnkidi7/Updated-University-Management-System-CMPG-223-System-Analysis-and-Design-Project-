<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdministratorPage.aspx.cs" Inherits="Prototype_University_IS_.AdministratorPage" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Administrator Page - Howark University</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" />
    <style type="text/css">
        body {
            font-family: 'Roboto', Arial, sans-serif;
            background-color: #f0f2f5;
            margin: 0;
            padding: 0;
            overflow-x: hidden;
            scroll-behavior: smooth;
            transition: background-color 0.3s ease;
        }
        body.dark-mode {
            background-color: #2c3e50;
            color: #ecf0f1;
        }
        .header, .footer {
            background-color: #2c3e50;
            color: white;
            text-align: center;
            padding: 20px 0;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
            transition: background-color 0.3s ease;
        }
        .header img {
            height: 120px;
            margin-bottom: 10px;
        }
        .header h1 {
            margin: 0;
            font-size: 2.5em;
        }
        .header:hover {
            background-color: #34495e;
        }
        .nav-bar {
            background-color: #34495e;
            color: white;
            padding: 15px 0;
            display: flex;
            justify-content: center;
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
        }
        .nav-bar a:hover {
            background-color: #1abc9c;
            transform: scale(1.05);
        }
        .container {
            padding: 20px;
            max-width: 1200px;
            margin: auto;
            display: flex;
            flex-direction: column;
            gap: 20px;
        }
        .section {
            background-color: #ffffff;
            border-radius: 15px;
            padding: 20px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
            transition: box-shadow 0.3s ease, transform 0.3s ease;
        }
        .section:hover {
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.2);
            transform: scale(1.02);
        }
        .section h2 {
            border-bottom: 2px solid #1abc9c;
            padding-bottom: 10px;
            margin-bottom: 10px;
            font-size: 1.8em;
            color: #1abc9c;
        }
        .form-group {
            margin-bottom: 15px;
        }
        .form-group label {
            display: block;
            margin-bottom: 5px;
            font-weight: bold;
        }
        .form-group input, .form-group select, .form-group textarea, .form-group button {
            width: 100%;
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 8px;
            transition: all 0.3s ease;
        }
        .form-group button {
            background-color: #1abc9c;
            color: white;
            cursor: pointer;
        }
        .form-group button:hover {
            background-color: #16a085;
        }
        .admin-info-right {
            position: fixed;
            top: 20px;
            right: 20px;
            background-color: #ffffff;
            border: 1px solid #ddd;
            border-radius: 15px;
            padding: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            transition: background-color 0.3s ease, color 0.3s ease;
        }
        .admin-info-right.dark-mode {
            background-color: #34495e;
            color: #ecf0f1;
        }
        .profile-header {
            text-align: center;
        }
        .profile-pic {
            width: 80px;
            height: 80px;
            border-radius: 50%;
            object-fit: cover;
            margin-bottom: 10px;
        }
        .admin-info-right p {
            margin: 5px 0;
            font-size: 1em;
        }
        .admin-info-right a {
            color: #1abc9c;
            text-decoration: none;
            font-weight: bold;
        }
        .admin-info-right a:hover {
            text-decoration: underline;
        }
        .footer {
            padding: 15px 0;
            box-shadow: 0 -4px 10px rgba(0, 0, 0, 0.2);
            transition: background-color 0.3s ease;
        }
        .footer.dark-mode {
            background-color: #34495e;
        }

        .dark-mode-toggle {
    position: absolute;
    top: 10px;
    right: 20px;
    background-color: #1abc9c;
    color: white;
    padding: 10px;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    transition: background-color 0.3s ease;
}
.dark-mode .dark-mode-toggle {
    background-color: #e74c3c;
        .dark-mode-toggle {
            position: fixed;
            bottom: 20px;
            right: 20px;
            background-color: #1abc9c;
            color: white;
            border: none;
            padding: 10px 15px;
            border-radius: 50px;
            font-size: 1.1em;
            cursor: pointer;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
            transition: background-color 0.3s ease;
        }
        .dark-mode-toggle:hover {
            background-color: #16a085;
        }
    </style>
    <script type="text/javascript">
        document.addEventListener("DOMContentLoaded", function () {
            function openTab(tabName) {
                const tabs = document.querySelectorAll(".tab-content");
                tabs.forEach(tab => tab.classList.remove("active"));
                document.getElementById(tabName).classList.add("active");
            }

            document.querySelectorAll(".tab-links button").forEach(button => {
                button.addEventListener("click", function () {
                    openTab(this.dataset.tab);
                });
            });

            // Dark Mode Toggle
            const toggleDarkMode = () => {
                document.body.classList.toggle("dark-mode");
                document.querySelector(".admin-info-right").classList.toggle("dark-mode");
                document.querySelector(".footer").classList.toggle("dark-mode");
                const icon = document.querySelector(".dark-mode-toggle i");
                icon.classList.toggle("fa-moon");
                icon.classList.toggle("fa-sun");
            };

            document.querySelector(".dark-mode-toggle").addEventListener("click", toggleDarkMode);
        });

        function logout() {
            if (confirm("Are you sure you want to logout?")) {
                window.location.href = "LogInSystemPage.aspx";
            }
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <!-- Header Section -->
        <div class="header">
            <asp:Image ID="Image1" runat="server" ImageUrl="~/Properties/Navy White University Elegant Logo.png" Height="120px" Width="180px" />
            <h1>Howark University - Administrator Portal</h1>
        </div>

        <!-- Dark Mode Toggle -->
<button class="dark-mode-toggle" type="button" onclick="toggleDarkMode()">Switch Mode</button>

        <!-- Navigation Bar -->
        <div class="nav-bar">
            <a href="HomePage.aspx">Home</a>
            <a href="AdministratorPage.aspx">Administrator Portal</a>
        </div>

        <!-- Container for Main Content -->
        <div class="container">
            <!-- Maintain Professors -->
            <div class="section">
                <h2>Maintain Professors</h2>
                <asp:Button ID="btnAddProfessor" runat="server" Text="Add Professor" CssClass="form-group" OnClick="btnAddProfessor_Click" />
                <asp:Button ID="btnEditProfessor" runat="server" Text="Edit Professor" CssClass="form-group" OnClick="btnEditProfessor_Click" />
                <asp:Button ID="btnDeleteProfessor" runat="server" Text="Delete Professor" CssClass="form-group" OnClick="btnDeleteProfessor_Click" />
            </div>

            <!-- Manage Courses -->
            <div class="section">
                <h2>Manage Courses</h2>
                <asp:Button ID="btnAddCourse" runat="server" Text="Add Course" CssClass="form-group" OnClick="btnAddCourse_Click" />
                <asp:Button ID="btnEditCourse" runat="server" Text="Edit Course" CssClass="form-group" OnClick="btnEditCourse_Click" />
                <asp:Button ID="btnDeleteCourse" runat="server" Text="Delete Course" CssClass="form-group" OnClick="btnDeleteCourse_Click" />
            </div>

            <!-- Manage Modules -->
            <div class="section">
                <h2>Manage Modules</h2>
                <asp:Button ID="btnAddModule" runat="server" Text="Add Module" CssClass="form-group" OnClick="btnAddModule_Click" />
                <asp:Button ID="btnEditModule" runat="server" Text="Edit Module" CssClass="form-group" OnClick="btnEditModule_Click" />
                <asp:Button ID="btnDeleteModule" runat="server" Text="Delete Module" CssClass="form-group" OnClick="btnDeleteModule_Click" />
            </div>
        </div>

        <!-- Right-side Panel with Admin Info -->
        <div class="admin-info-right">
            <div class="profile-header">
                <asp:Image ID="adminProfilePic" runat="server" ImageUrl="~/default-profile.png" CssClass="profile-pic" />
                <p><strong><asp:Label ID="lblAdminName" runat="server" Text="Admin Name" /></strong></p>
            </div>
            <p>Admin ID: <asp:Label ID="lblAdminID" runat="server" Text="12345" /></p>
            <p>Email: <asp:Label ID="lblAdminEmail" runat="server" Text="admin@example.com" /></p>
            <p>Phone: <asp:Label ID="lblAdminPhone" runat="server" Text="(123) 456-7890" /></p>
            <asp:Button ID="btnLogout" runat="server" Text="Logout" CssClass="form-group" OnClientClick="logout(); return false;" />
        </div>

        <!-- Footer Section -->
        <div class="footer">
            <p>&copy; 2024 Howark University. All Rights Reserved.</p>
        </div>

        <!-- Dark Mode Toggle Button -->
        <button class="dark-mode-toggle"><i class="fas fa-moon"></i></button>
    </form>

    
    <script type="text/javascript">
        function toggleDarkMode() {
            document.body.classList.toggle("dark-mode");
        }
    </script>
</body>
</html>