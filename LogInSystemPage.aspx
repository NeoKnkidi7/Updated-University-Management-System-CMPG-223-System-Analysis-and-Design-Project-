<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LogInSystemPage.aspx.cs" Inherits="Prototype_University_IS_.LogInSystemPage" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login - Howark University</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" />
    <style type="text/css">
        body {
            font-family: 'Roboto', Arial, sans-serif;
            background: linear-gradient(135deg, #f0f2f5, #ffffff);
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 80vh;
            overflow: hidden;
        }
        .container {
            max-width: 420px;
            width: 100%;
            padding: 40px;
            background: #ffffff;
            border-radius: 15px;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.1);
            transition: box-shadow 0.3s ease, transform 0.3s ease;
            position: relative;
        }
        .container:hover {
            box-shadow: 0 8px 30px rgba(0, 0, 0, 0.2);
            transform: scale(1.03);
        }
        .header {
            text-align: center;
            margin-bottom: 30px;
        }
        .header h1 {
            color: #1abc9c;
            font-size: 2.2em;
            font-weight: 700;
            transition: color 0.3s ease;
        }
        .header h1:hover {
            color: #16a085;
        }
        .form-group {
            margin-bottom: 25px;
            position: relative;
        }
        .form-group label {
            display: block;
            margin-bottom: 8px;
            font-size: 1.1em;
            color: #2c3e50;
            font-weight: 500;
        }
        .form-group input[type="text"],
        .form-group input[type="password"],
        .form-group select {
            width: 100%;
            padding: 15px;
            border: 1px solid #ddd;
            border-radius: 10px;
            font-size: 1em;
            transition: border-color 0.3s ease, box-shadow 0.3s ease;
            margin-top: 5px;
        }
        .form-group input[type="text"]:focus,
        .form-group input[type="password"]:focus,
        .form-group select:focus {
            border-color: #1abc9c;
            box-shadow: 0 0 8px rgba(0, 0, 0, 0.2);
            outline: none;
        }
        .form-group input[type="submit"] {
            background-color: #1abc9c;
            color: white;
            border: none;
            padding: 15px;
            border-radius: 10px;
            cursor: pointer;
            font-size: 1.2em;
            font-weight: 600;
            transition: background-color 0.3s ease, transform 0.3s ease;
            width: 100%;
        }
        .form-group input[type="submit"]:hover {
            background-color: #16a085;
            transform: scale(1.05);
        }
        .form-group .error-message {
            color: #e74c3c;
            font-size: 0.9em;
            margin-top: 10px;
        }
        .footer {
            text-align: center;
            margin-top: 25px;
            color: #2c3e50;
            font-size: 0.9em;
        }
        .footer a {
            color: #1abc9c;
            text-decoration: none;
        }
        .footer a:hover {
            color: #16a085;
        }
        .form-group .show-password {
            position: absolute;
            right: 12px;
            top: 50%;
            transform: translateY(-50%);
            cursor: pointer;
            color: #1abc9c;
            font-size: 1.4em;
            transition: color 0.3s ease;
        }
        .form-group .show-password:hover {
            color: #16a085;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <div class="header">
                <h1>Login to Howark University</h1>
            </div>
            
            <div class="form-group">
                <label for="txtUsername">Username</label>
                <asp:TextBox ID="txtUsername" runat="server" CssClass="form-control" />
            </div>
            
            <div class="form-group">
                <label for="txtPassword">Password</label>
                <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" CssClass="form-control" />
                <i id="togglePassword" class="fas fa-eye show-password" onclick="togglePasswordVisibility()"></i>
            </div>

            <div class="form-group">
                <label for="ddlUserType">I am a</label>
                <asp:DropDownList ID="ddlUserType" runat="server" CssClass="form-control">
                    <asp:ListItem Value="Student">Student</asp:ListItem>
                    <asp:ListItem Value="Lecturer">Lecturer</asp:ListItem>
                    <asp:ListItem Value="Administrator">Administrator</asp:ListItem>
                    <asp:ListItem Value="Applicant">Applicant</asp:ListItem>
                </asp:DropDownList>
            </div>

            <div class="form-group">
                <asp:Button ID="btnLogin" runat="server" Text="Login" OnClick="btnLogin_Click" CssClass="form-control" />
                <asp:Label ID="lblInvalidLoginDetailsErrorMessage" runat="server" CssClass="error-message" Text="Invalid login details. Please try again."></asp:Label>
            </div>
            
            <div class="footer">
                <p>&copy; 2024 Howark University</p>
                <a href="ForgotPassword.aspx">Forgot Password?</a>
            </div>
        </div>
    </form>

    <script type="text/javascript">
        function togglePasswordVisibility() {
            var passwordField = document.getElementById('<%= txtPassword.ClientID %>');
            var toggleIcon = document.getElementById('togglePassword');
            if (passwordField.type === 'password') {
                passwordField.type = 'text';
                toggleIcon.classList.remove('fa-eye');
                toggleIcon.classList.add('fa-eye-slash');
            } else {
                passwordField.type = 'password';
                toggleIcon.classList.remove('fa-eye-slash');
                toggleIcon.classList.add('fa-eye');
            }
        }
    </script>
</body>
</html>