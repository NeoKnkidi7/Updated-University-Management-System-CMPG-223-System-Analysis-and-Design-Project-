<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LecturerPage.aspx.cs" Inherits="Prototype_University_IS_.LecturerPage" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Lecturer Portal - Howark University</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" />
    <style type="text/css">
        body {
            font-family: 'Roboto', Arial, sans-serif;
            background-color: #f0f2f5;
            margin: 0;
            padding: 0;
            overflow-x: hidden;
            scroll-behavior: smooth;
        }
        .header, .footer {
            background-color: #2c3e50;
            color: white;
            text-align: center;
            padding: 20px 0;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
            transition: background-color 0.3s ease;
        }
        .header:hover {
            background-color: #34495e;
        }
        .header img {
            height: 120px;
            margin-bottom: 10px;
        }
        .header h1 {
            margin: 0;
            font-size: 2.5em;
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
        .tab-container {
            display: flex;
        }
        .tab-links {
            display: flex;
            flex-direction: column;
            border-right: 2px solid #ddd;
            padding-right: 20px;
        }
        .tab-links button {
            background-color: #ffffff;
            border: 1px solid #ddd;
            border-radius: 8px;
            padding: 10px 20px;
            cursor: pointer;
            font-size: 1.1em;
            margin-bottom: 10px;
            transition: background-color 0.3s ease, color 0.3s ease, transform 0.3s ease;
        }
        .tab-links button:hover {
            background-color: #1abc9c;
            color: #ffffff;
            transform: scale(1.05);
        }
        .tab-content {
            flex: 1;
            display: none;
            padding: 20px;
        }
        .tab-content.active {
            display: block;
        }
        .module-details {
            margin-top: 10px;
            border-top: 2px solid #1abc9c;
            padding-top: 10px;
        }
        .module-details div {
            margin-bottom: 20px;
        }
        .module-details h4 {
            border-bottom: 2px solid #1abc9c;
            padding-bottom: 5px;
            margin-bottom: 10px;
            font-size: 1.3em;
            color: #1abc9c;
        }
        .module-details p {
            margin: 0;
            font-size: 1em;
            color: #34495e;
        }
        .lecturer-info-right {
            position: fixed;
            top: 20px;
            right: 20px;
            background-color: #ffffff;
            border: 1px solid #ddd;
            border-radius: 15px;
            padding: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
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
        .lecturer-info-right p {
            margin: 5px 0;
            font-size: 1em;
        }
        .lecturer-info-right a {
            color: #1abc9c;
            text-decoration: none;
            font-weight: bold;
        }
        .lecturer-info-right a:hover {
            text-decoration: underline;
        }
        .footer {
            padding: 15px 0;
            box-shadow: 0 -4px 10px rgba(0, 0, 0, 0.2);
        }
    </style>
    <script type="text/javascript">
        document.addEventListener("DOMContentLoaded", function () {
            function openTab(tabName) {
                var i;
                var x = document.getElementsByClassName("tab-content");
                for (i = 0; i < x.length; i++) {
                    x[i].classList.remove("active");
                }
                document.getElementById(tabName).classList.add("active");
            }

            document.querySelectorAll(".tab-links button").forEach(button => {
                button.addEventListener("click", function () {
                    openTab(this.dataset.tab);
                });
            });
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
            <h1>Howark University - Lecturer Portal</h1>
        </div>
        
        <!-- Navigation Bar -->
        <div class="nav-bar">
            <a href="DefualtPage.aspx">Home</a>
            <a href="LecturerPage.aspx">Lecturer Portal</a>
        </div>

        <!-- Container for Main Content -->
        <div class="container">
            <!-- Maintain Students -->
            <div class="section">
                <h2>Maintain Students</h2>
                <asp:Button ID="btnAddStudent" runat="server" Text="Add Student" CssClass="button" OnClick="btnAddStudent_Click" />
                <asp:Button ID="btnEditStudent" runat="server" Text="Edit Student" CssClass="button" OnClick="btnEditStudent_Click" />
                <asp:Button ID="btnRemoveStudent" runat="server" Text="Remove Student" CssClass="button" OnClick="btnRemoveStudent_Click" />
            </div>

            <!-- Upload Documents -->
            <div class="section">
                <h2>Upload Documents</h2>
                <asp:FileUpload ID="fileUploadDocument" runat="server" />
                <asp:Button ID="btnUploadDocument" runat="server" Text="Upload" CssClass="button" OnClick="btnUploadDocument_Click" />
            </div>

            <!-- Create Online Tests -->
            <div class="section">
                <h2>Create Online Tests</h2>
                <asp:TextBox ID="txtTestName" runat="server" Placeholder="Test Name"></asp:TextBox><br />
                <div id="questionsContainer">
                    <div class="question">
                        <asp:TextBox ID="txtQuestion1" runat="server" Placeholder="Enter question"></asp:TextBox><br />
                        <asp:TextBox ID="txtOption1_1" runat="server" Placeholder="Option 1"></asp:TextBox><br />
                        <asp:TextBox ID="txtOption1_2" runat="server" Placeholder="Option 2"></asp:TextBox><br />
                        <asp:TextBox ID="txtOption1_3" runat="server" Placeholder="Option 3"></asp:TextBox><br />
                        <asp:TextBox ID="txtOption1_4" runat="server" Placeholder="Option 4"></asp:TextBox><br />
                        <asp:DropDownList ID="ddlCorrectOption1" runat="server">
                            <asp:ListItem Text="Select Correct Option" Value="" />
                            <asp:ListItem Text="Option 1" Value="1" />
                            <asp:ListItem Text="Option 2" Value="2" />
                            <asp:ListItem Text="Option 3" Value="3" />
                            <asp:ListItem Text="Option 4" Value="4" />
                        </asp:DropDownList><br />
                    </div>
                </div>
                <asp:Button ID="btnAddQuestion" runat="server" Text="Add Another Question" CssClass="button" OnClick="btnAddQuestion_Click" />
                <asp:DropDownList ID="ddlDocumentFormat" runat="server">
                    <asp:ListItem Text="Select Document Format" Value="" />
                    <asp:ListItem Text="PDF" Value="pdf" />
                    <asp:ListItem Text="Word Document" Value="docx" />
                </asp:DropDownList><br />
                <asp:Button ID="btnCreateTest" runat="server" Text="Create Test" CssClass="button" OnClick="btnCreateTest_Click" />
                <asp:Label ID="lblTestStatus" runat="server" ForeColor="Green"></asp:Label>
            </div>

            <!-- Provide Announcements -->
            <div class="section">
                <h2>Provide Announcements</h2>
                <asp:TextBox ID="announcementHeading" runat="server" Placeholder="Announcement Heading"></asp:TextBox><br />
                <asp:TextBox ID="announcementDescription" runat="server" TextMode="MultiLine" Placeholder="Announcement Description" Height="100px"></asp:TextBox><br />
                <asp:Button ID="btnPostAnnouncement" runat="server" Text="Post Announcement" CssClass="button" OnClick="btnPostAnnouncement_Click1" />
            </div>

            <!-- Module Details Section -->
            <div class="tab-container">
                <div class="tab-links">
                    <button data-tab="moduleDetails" class="active">Module Details</button>
                </div>
                <div id="moduleDetails" class="tab-content active">
                    <div class="module-details">
                        <div>
                            <h4>Module Overview</h4>
                            <p>Details about the module...</p>
                        </div>
                        <div>
                            <h4>Lecturer Details</h4>
                            <p>Information about the lecturer...</p>
                        </div>
                        <div>
                            <h4>Study Material</h4>
                            <p>Available study materials...</p>
                        </div>
                        <div>
                            <h4>Tests</h4>
                            <p>Test information...</p>
                        </div>
                        <div>
                            <h4>Assignments</h4>
                            <p>Details about assignments...</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Lecturer Info Right Section -->
        <div class="lecturer-info-right">
            <div class="profile-header">
                <asp:Image ID="lecturerProfilePic" runat="server" ImageUrl="~/Images/lecturer-profile.jpg" CssClass="profile-pic" />
                <p><strong>Lecturer Name:</strong> <asp:Label ID="lblLecturerName" runat="server" Text="John Doe"></asp:Label></p>
                <p><strong>Email:</strong> <asp:Label ID="lblLecturerEmail" runat="server" Text="john.doe@howark.edu"></asp:Label></p>
                <p><strong>Department:</strong> <asp:Label ID="lblDepartment" runat="server" Text="Computer Science"></asp:Label></p>
                <a href="LogInSystemPage.aspx" onclick="logout()">Logout</a>
            </div>
        </div>

        <!-- Footer Section -->
        <div class="footer">
            <p>&copy; 2024 Howark University. All rights reserved.</p>
        </div>
    </form>
</body>
</html>