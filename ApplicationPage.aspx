<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ApplicationPage.aspx.cs" Inherits="Prototype_University_IS_.ApplicationPage" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Application Page - Howark University</title>
    <style type="text/css">
        /* Your CSS styles */
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
            text-align: center;
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
        }
        .form-section {
            background-color: #ffffff;
            border: 1px solid #ddd;
            border-radius: 15px;
            padding: 20px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
            margin-bottom: 20px;
            transition: box-shadow 0.3s ease;
        }
        .form-section:hover {
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.2);
        }
        .form-section h2 {
            border-bottom: 2px solid #1abc9c;
            padding-bottom: 10px;
            margin-bottom: 10px;
            font-size: 1.8em;
            transition: color 0.3s ease;
        }
        .form-section:hover h2 {
            color: #1abc9c;
        }
        .form-group {
            margin-bottom: 15px;
        }
        .form-group label {
            display: block;
            margin-bottom: 5px;
            font-size: 1.1em;
        }
        .form-group input, .form-group select, .form-group button {
            width: 100%;
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 8px;
            transition: border-color 0.3s ease, box-shadow 0.3s ease;
        }
        .form-group input:focus, .form-group select:focus {
            border-color: #1abc9c;
            box-shadow: 0 0 5px rgba(26, 188, 156, 0.3);
        }
        .form-group button {
            background-color: #1abc9c;
            color: white;
            border: none;
            cursor: pointer;
            font-size: 1.1em;
            padding: 12px;
            transition: background-color 0.3s ease, transform 0.3s ease;
        }
        .form-group button:hover {
            background-color: #16a085;
            transform: scale(1.05);
        }
        .confirmation, .error-message {
            padding: 15px;
            margin: 20px 0;
            border-radius: 8px;
            transition: opacity 0.3s ease;
        }
        .confirmation {
            background-color: #d4edda;
            border: 1px solid #c3e6cb;
            color: #155724;
        }
        .error-message {
            background-color: #f8d7da;
            border: 1px solid #f5c6cb;
            color: #721c24;
        }
        .footer {
            padding: 15px 0;
            box-shadow: 0 -4px 10px rgba(0, 0, 0, 0.2);
        }
        .auto-style1 {
            margin-left: 0px;
        }
        .marks-table {
            width: 100%;
            border-collapse: collapse;
        }
        .marks-table th, .marks-table td {
            border: 1px solid #ddd;
            padding: 10px;
            transition: background-color 0.3s ease;
        }
        .marks-table th {
            background-color: #f2f2f2;
        }
        .marks-table tr:hover {
            background-color: #f9f9f9;
        }
        .upload-section {
            margin-top: 20px;
        }
        .auto-style2 {
            width: 177px;
        }
    </style>
    <script type="text/javascript">
        function updateCourses() {
            var faculty = document.getElementById('<%= lstfaculties.ClientID %>').value;
            var courses = {
                "Faculty of Humanities and Art": [
                    "Bachelor of Arts (BA) – General or with majors in: English Literature, History, Philosophy, Sociology, Cultural Studies",
                    "Bachelor of Fine Arts (BFA) – Specializations in: Painting, Sculpture, Graphic Design, Photography",
                    "Bachelor of Performing Arts (BPA) – Majors in: Drama, Dance, Music",
                    "Bachelor of Design (BDes) – Majors in: Graphic Design, Interior Design, Fashion Design",
                    "Bachelor of Music (BMus) – Specializations in: Performance, Composition, Music Theory",
                    "Bachelor of Arts (Honours) (BA Hons) – Advanced study in: English Literature, History, Philosophy",
                    "Bachelor of Fine Arts (Honours) (BFA Hons) – Advanced study in: Visual Arts",
                    "Bachelor of Music (Honours) (BMus Hons) – Advanced study in: Music Performance, Music Composition",
                    "Master of Arts (MA) – Specializations in: Literature, History, Philosophy, Sociology, Cultural Studies",
                    "Master of Fine Arts (MFA) – Advanced study in: Visual Arts, Design",
                    "Master of Music (MMus) – Advanced study in: Performance, Composition",
                    "Master of Performing Arts (MPA) – Specializations in: Theatre, Dance, Music",
                    "Doctor of Philosophy (PhD) – Research-focused programs in: Humanities (various disciplines), Fine Arts, Music",
                    "Diploma in Fine Arts – Specializations in: Painting, Sculpture, Photography",
                    "Diploma in Graphic Design",
                    "Diploma in Interior Design",
                    "Diploma in Performing Arts – Majors in: Theatre, Dance",
                    "Diploma in Film and Media Studies",
                    "Postgraduate Diploma in Arts – Specializations in: Cultural Studies, Creative Writing",
                    "Postgraduate Diploma in Fine Arts – Advanced studies in: Visual Arts",
                    "Postgraduate Diploma in Design – Specializations in: Graphic Design, Fashion Design"

                    // ... Other programs
                ],
                "Faculty of Health Science": [
                    "Bachelor of Medicine and Bachelor of Surgery (MBChB)",
                    "Bachelor of Nursing (BNurs)",
                    "Bachelor of Pharmacy (BPharm)",
                    "Bachelor of Physiotherapy (BPT)",
                    "Bachelor of Occupational Therapy (BOT)",
                    "Bachelor of Clinical Nutrition and Dietetics (BSc)",
                    "Bachelor of Radiography (BSc)",
                    "Bachelor of Public Health (BPH)",
                    "Bachelor of Health Sciences (BHS) – General or with majors in: Health Promotion, Healthcare Management",
                    "Bachelor of Health Sciences (Honours) (BHS Hons)",
                    "Bachelor of Nursing (Honours) (BNurs Hons)",
                    "Bachelor of Pharmacy (Honours) (BPharm Hons)",
                    "Bachelor of Physiotherapy (Honours) (BPT Hons)",
                    "Master of Medicine (MMed) – Specializations in: Internal Medicine, Surgery, Pediatrics, Psychiatry",
                    "Master of Nursing (MNurs) – Specializations in: Advanced Practice, Nursing Education, Clinical Nursing",
                    "Master of Pharmacy (MPharm)",
                    "Master of Physiotherapy (MPT)",
                    "Master of Occupational Therapy (MOT)",
                    "Master of Public Health (MPH)",
                    "Master of Clinical Nutrition and Dietetics (MSc)",
                    "Doctor of Philosophy (PhD) – Research-focused programs in: Medicine, Nursing, Pharmacy, Public Health, Physiotherapy, Occupational Therapy",
                    "Diploma in Nursing – Specializations in: General Nursing, Midwifery",
                    "Diploma in Pharmacy – Pharmacy Technician",
                    "Diploma in Physiotherapy",
                    "Diploma in Occupational Therapy",
                    "Diploma in Clinical Nutrition and Dietetics",
                    "Diploma in Radiography",
                    "Postgraduate Diploma in Public Health",
                    "Postgraduate Diploma in Advanced Clinical Practice",
                    "Postgraduate Diploma in Healthcare Management",
                    "Postgraduate Diploma in Advanced Nursing Practice"

                    // ... Other programs
                ],
                "Faculty of Engineering and the Built Environment": [
                    "Bachelor of Engineering (BEng) – Specializations in: Civil Engineering, Mechanical Engineering, Electrical Engineering, Chemical Engineering, Industrial Engineering, Aerospace Engineering",
                    "Bachelor of Architecture (BArch)",
                    "Bachelor of Quantity Surveying (BQS)",
                    "Bachelor of Construction Management (BConM)",
                    "Bachelor of Urban and Regional Planning (BURP)",
                    "Bachelor of Environmental Engineering (BEnvEng)",
                    "Bachelor of Computer Engineering (BCompEng)",
                    "Bachelor of Engineering (Honours) (BEng Hons) – Advanced study in: Civil Engineering, Mechanical Engineering, Electrical Engineering, Chemical Engineering",
                    "Bachelor of Architecture (Honours) (BArch Hons)",
                    "Bachelor of Quantity Surveying (Honours) (BQS Hons)",
                    "Bachelor of Construction Management (Honours) (BConM Hons)",
                    "Bachelor of Urban and Regional Planning (Honours) (BURP Hons)",
                    "Master of Engineering (MEng) – Specializations in: Civil Engineering, Mechanical Engineering, Electrical Engineering, Chemical Engineering, Industrial Engineering",
                    "Master of Architecture (MArch)",
                    "Master of Quantity Surveying (MSc QS)",
                    "Master of Construction Management (MSc ConM)",
                    "Master of Urban and Regional Planning (MURP)",
                    "Master of Environmental Engineering (MSc EnvEng)",
                    "Master of Computer Engineering (MCompEng)",
                    "Doctor of Philosophy (PhD) – Research-focused programs in: Engineering (various disciplines), Architecture, Construction Management, Urban and Regional Planning",
                    "Diploma in Engineering – Specializations in: Civil Engineering, Mechanical Engineering, Electrical Engineering, Chemical Engineering",
                    "Diploma in Architecture",
                    "Diploma in Quantity Surveying",
                    "Diploma in Construction Management",
                    "Diploma in Urban and Regional Planning",
                    "Postgraduate Diploma in Engineering Management",
                    "Postgraduate Diploma in Environmental Engineering",
                    "Postgraduate Diploma in Urban and Regional Planning",
                    "Postgraduate Diploma in Project Management"

                    // ... Other programs
                ],
                "Faculty of Natural and Agriculture Sciences": [
                    "Bachelor of Science (BSc) – Specializations in: Biology, Chemistry, Physics, Mathematics, Environmental Science, Geology, Statistics",
                    "Bachelor of Science in Information Technology (BSc IT)",
                    "Bachelor of Science in Computer Science (BSc CS)",
                    "Bachelor of Agriculture (BAgri) – Specializations in: Crop Science, Animal Science, Soil Science, Agricultural Economics",
                    "Bachelor of Horticulture (BHort)",
                    "Bachelor of Environmental Science (BEnvSci)",
                    "Bachelor of Forestry (BF)",
                    "Bachelor of Science (Honours) (BSc Hons) – Advanced study in: Biology, Chemistry, Physics, Environmental Science",
                    "Bachelor of Science in Information Technology (Honours) (BSc IT Hons)",
                    "Bachelor of Science in Computer Science (Honours) (BSc CS Hons)",
                    "Bachelor of Agriculture (Honours) (BAgri Hons) – Advanced study in: Crop Science, Animal Science",
                    "Bachelor of Environmental Science (Honours) (BEnvSci Hons)",
                    "Master of Science (MSc) – Specializations in: Biology, Chemistry, Physics, Environmental Science, Geology, Statistics",
                    "Master of Science in Information Technology (MSc IT)",
                    "Master of Science in Computer Science (MSc CS)",
                    "Master of Agriculture (MScAgri) – Specializations in: Crop Science, Animal Science, Soil Science",
                    "Master of Horticulture (MSc Hort)",
                    "Master of Environmental Science (MSc EnvSci)",
                    "Master of Forestry (MSc For)",
                    "Doctor of Philosophy (PhD) – Research-focused programs in: Natural Sciences (various disciplines), Computer Science, Information Technology",
                    "Doctor of Philosophy in Environmental Science (PhD EnvSci)",
                    "Doctor of Philosophy (PhD) – Research-focused programs in: Agriculture, Horticulture, Forestry",
                    "Diploma in Information Technology (IT)",
                    "Diploma in Computer Science",
                    "Diploma in Environmental Science",
                    "Diploma in Geology",
                    "Diploma in Agricultural Science – Specializations in: Crop Production, Animal Production",
                    "Diploma in Horticulture",
                    "Diploma in Forestry",
                    "Diploma in Soil Science",
                    "Postgraduate Diploma in Environmental Management",
                    "Postgraduate Diploma in Information Technology (ICT Management)",
                    "Postgraduate Diploma in Computer Science",
                    "Postgraduate Diploma in Agricultural Economics"

                    // ... Other programs
                ]
            };

            var coursesList = document.getElementById('<%= lstprogram.ClientID %>');
            coursesList.options.length = 0; // Clear existing options

            if (faculty in courses) {
                courses[faculty].forEach(function (course) {
                    var option = document.createElement('option');
                    option.text = course;
                    option.value = course;
                    coursesList.add(option);
                });
            }
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <!-- Header Section -->
        <div class="header">
            <asp:Image ID="Image1" runat="server" ImageUrl="~/Properties/Navy White University Elegant Logo.png" Height="152px" CssClass="auto-style1" Width="259px" />
            <h1>Howark University - Application Page</h1>
            <div class="nav-bar">
                <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/DefaultPage.aspx">Back to Home Page</asp:HyperLink>
            </div>
        </div>

        

        <!-- Container for Main Content -->
        <div class="container">
            <!-- Enrollment Form Section -->
            <div class="form-section">
                <h2>Apply for Courses/Programs</h2>
                <div class="form-container">
                    <div class="form-group">
                        <label for="txtFirstName">First Name:</label>
                        <asp:TextBox ID="txtFirstName" runat="server" MaxLength="100" CssClass="form-control" />
                        <asp:RequiredFieldValidator ID="rfvFirstName" runat="server" ControlToValidate="txtFirstName" ErrorMessage="First Name is required." CssClass="error-message" Display="Dynamic" />
                    </div>
                    <div class="form-group">
                        <label for="txtMiddleName">Middle Name (Optional):</label>
                        <asp:TextBox ID="txtMiddleName" runat="server" MaxLength="100" CssClass="form-control" />
                    </div>
                    <div class="form-group">
                        <label for="txtLastName">Last Name:</label>
                        <asp:TextBox ID="txtLastName" runat="server" MaxLength="100" CssClass="form-control" />
                        <asp:RequiredFieldValidator ID="rfvLastName" runat="server" ControlToValidate="txtLastName" ErrorMessage="Last Name is required." CssClass="error-message" Display="Dynamic" />
                    </div>
                    <div class="form-group">
                        <label for="txtDateOfBirth">Date of Birth:</label>
                        <asp:TextBox ID="txtDateOfBirth" runat="server" TextMode="Date" CssClass="form-control" />
                        <asp:RequiredFieldValidator ID="rfvDateOfBirth" runat="server" ControlToValidate="txtDateOfBirth" ErrorMessage="Date of Birth is required." CssClass="error-message" Display="Dynamic" />
                        <asp:RegularExpressionValidator ID="revDateOfBirth" runat="server" ControlToValidate="txtDateOfBirth" ErrorMessage="Invalid Date format." CssClass="error-message" Display="Dynamic" ValidationExpression="\d{4}-\d{2}-\d{2}" />
                    </div>
                    <div class="form-group">
                        <label for="txtAge">Age:</label>
                        <asp:TextBox ID="txtAge" runat="server" MaxLength="3" CssClass="form-control" />
                        <asp:RequiredFieldValidator ID="rfvAge" runat="server" ControlToValidate="txtAge" ErrorMessage="Age is required." CssClass="error-message" Display="Dynamic" />
                        <asp:RangeValidator ID="rvAge" runat="server" ControlToValidate="txtAge" MinimumValue="1" MaximumValue="120" Type="Integer" ErrorMessage="Age must be between 1 and 120." CssClass="error-message" Display="Dynamic" />
                    </div>
                    <div class="form-group">
                        <label for="txtAddress">Address:</label>
                        <asp:TextBox ID="txtAddress" runat="server" TextMode="MultiLine" MaxLength="255" CssClass="form-control" />
                    </div>
                    <div class="form-group">
                        <label for="txtYearOfMatriculation">Year of Matriculation:</label>
                        <asp:TextBox ID="txtYearOfMatriculation" runat="server" MaxLength="4" CssClass="form-control" />
                        <asp:RequiredFieldValidator ID="rfvYearOfMatriculation" runat="server" ControlToValidate="txtYearOfMatriculation" ErrorMessage="Year of Matriculation is required." CssClass="error-message" Display="Dynamic" />
                        <asp:RangeValidator ID="rvYearOfMatriculation" runat="server" ControlToValidate="txtYearOfMatriculation" MinimumValue="1900" MaximumValue="2100" Type="Integer" ErrorMessage="Year must be between 1900 and 2100." CssClass="error-message" Display="Dynamic" />
                    </div>
                    <div class="form-group">
                        <label for="txtPhoneNumber">Phone Number:</label>
                        <asp:TextBox ID="txtPhoneNumber" runat="server" MaxLength="15" CssClass="form-control" />
                        <asp:RequiredFieldValidator ID="rfvPhoneNumber" runat="server" ControlToValidate="txtPhoneNumber" ErrorMessage="Phone Number is required." CssClass="error-message" Display="Dynamic" />
                        <asp:RegularExpressionValidator ID="revPhoneNumber" runat="server" ControlToValidate="txtPhoneNumber" ErrorMessage="Invalid Phone Number format." CssClass="error-message" Display="Dynamic" ValidationExpression="^\+?\d{10,15}$" />
                    </div>
                    <div class="form-group">
                        <label for="txtEmailAddress">Email Address:</label>
                        <asp:TextBox ID="txtEmailAddress" runat="server" MaxLength="100" CssClass="form-control" />
                        <asp:RequiredFieldValidator ID="rfvEmailAddress" runat="server" ControlToValidate="txtEmailAddress" ErrorMessage="Email Address is required." CssClass="error-message" Display="Dynamic" />
                        <asp:RegularExpressionValidator ID="revEmailAddress" runat="server" ControlToValidate="txtEmailAddress" ErrorMessage="Invalid Email Address format." CssClass="error-message" Display="Dynamic" ValidationExpression="^[^@\s]+@[^@\s]+\.[^@\s]+$" />
                    </div>
                    <div class="form-group">
                        <label for="ddlGender">Gender:</label>
                        <asp:DropDownList ID="ddlGender" runat="server">
                            <asp:ListItem Value="M">Male</asp:ListItem>
                            <asp:ListItem Value="F">Female</asp:ListItem>
                            <asp:ListItem Value="O">Other</asp:ListItem>
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="rfvGender" runat="server" ControlToValidate="ddlGender" InitialValue="" ErrorMessage="Gender is required." CssClass="error-message" Display="Dynamic" />
                    </div>
                    <div class="form-group">
                        <label for="txtNationality">Nationality:</label>
                        <asp:TextBox ID="txtNationality" runat="server" MaxLength="50" CssClass="form-control" />
                    </div>
                    <div class="form-group">
                        <label for="txtHighSchoolName">High School Name:</label>
                        <asp:TextBox ID="txtHighSchoolName" runat="server" MaxLength="100" CssClass="form-control" />
                        <asp:RequiredFieldValidator ID="rfvHighSchoolName" runat="server" ControlToValidate="txtHighSchoolName" ErrorMessage="High School Name is required." CssClass="error-message" Display="Dynamic" />
                    </div>
                    <div class="form-group">
                        <label for="txtHighSchoolAddress">High School Address (Optional):</label>
                        <asp:TextBox ID="txtHighSchoolAddress" runat="server" TextMode="MultiLine" MaxLength="255" CssClass="form-control" />
                    </div>
                    <div class="form-group">
                        <label for="lstfaculties">Select Faculty:</label>
                        <asp:DropDownList ID="lstfaculties" runat="server" CssClass="form-control" AutoPostBack="true" OnSelectedIndexChanged="lstfaculties_SelectedIndexChanged">
                            <asp:ListItem>Select Faculty</asp:ListItem>
                            <asp:ListItem>Faculty of Humanities and Art</asp:ListItem>
                            <asp:ListItem>Faculty of Health Science</asp:ListItem>
                            <asp:ListItem>Faculty of Engineering and the Built Environment</asp:ListItem>
                            <asp:ListItem>Faculty of Natural and Agriculture Sciences</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                    <div class="form-group">
                        <label for="lstprogram">Select Program:</label>
                        <asp:DropDownList ID="lstprogram" runat="server" CssClass="form-control">
                        </asp:DropDownList>
                    </div>

                    <!-- File Upload for Matric Results -->
                    <div class="form-group upload-section">
                        <label for="fileupload">Upload Results (PDF format):</label>
                        <asp:FileUpload ID="fileupload" runat="server" CssClass="form-control" />
                        <asp:RequiredFieldValidator ID="rfvFileUpload" runat="server" ControlToValidate="fileupload" ErrorMessage="Matric results file is required." CssClass="error-message" Display="Dynamic" />
                    </div>

                    <div class="form-section">
                        <script type="text/javascript">
                            function addRow() {
                                var tableBody = document.getElementById("marksTableBody");
                                var rowCount = tableBody.rows.length;
                                var row = tableBody.insertRow(rowCount);

                                var cell1 = row.insertCell(0);
                                var cell2 = row.insertCell(1);
                                var cell3 = row.insertCell(2);
                                var cell4 = row.insertCell(3);

                                cell1.innerHTML = '<input type="text" name="txtSubject' + (rowCount + 1) + '" class="form-control" />';
                                cell2.innerHTML = '<input type="text" name="txtMark' + (rowCount + 1) + '" class="form-control" />';
                                cell3.innerHTML = '<input type="text" name="txtPercentage' + (rowCount + 1) + '" class="form-control" />';
                                cell4.innerHTML = '<select name="ddlSymbol' + (rowCount + 1) + '" class="form-control"><option value="Fail">Fail</option><option value="Pass">Pass</option><option value="Pass with Distinction">Pass with Distinction</option></select>';
                            }

                            function submitForm() {
                                var form = document.getElementById('form1');
                                var formData = new FormData(form);
                                var xhr = new XMLHttpRequest();
                                xhr.open('POST', 'ApplicationPage.aspx', true); // Adjust URL if necessary
                                xhr.onload = function () {
                                    if (xhr.status === 200) {
                                        alert('Form submitted successfully!');
                                    } else {
                                        alert('Error submitting form.');
                                    }
                                };
                                xhr.send(formData);
                            }
                        </script>

                        <div>
                            <h2>Enter Your Marks</h2>
                            <table class="marks-table" id="marksTable">
                                <thead>
                                    <tr>
                                        <th>Subject</th>
                                        <th>Mark</th>
                                        <th>Percentage</th>
                                        <th>Symbol</th>
                                    </tr>
                                </thead>
                                <tbody id="marksTableBody">
                                    <!-- Rows will be added dynamically here -->
                                </tbody>
                            </table>
                            <div class="form-group">
                                <button type="button" onclick="addRow()">Add Row</button>
                            </div>
                        </div>

                        <!-- Submit Button -->
                        <div class="form-group">
                            <asp:Button ID="btnSubmit" runat="server" Text="Submit" OnClientClick="submitForm(); return false;" CssClass="form-control" OnClick="btnSubmit_Click" />
                        </div>
                        <!-- Confirmation or Error Messages -->
                        <div id="confirmation" class="confirmation" style="display:none;">
                            Your application has been submitted successfully!
                        </div>
                        <div id="error-message" class="error-message" style="display:none;">
                            There was an error submitting your application. Please try again.
                        </div>
                    </div>
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