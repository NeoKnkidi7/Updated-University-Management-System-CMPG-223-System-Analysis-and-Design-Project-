using System;
using System.Data.SqlClient;
using System.IO;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Prototype_University_IS_
{
    public partial class ApplicationPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Ensure DropDownList2 is cleared on initial load
                //DropDownList2.Items.Clear();
            }
        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            // Call JavaScript function to update courses
            ScriptManager.RegisterStartupScript(this, GetType(), "updateCourses", "updateCourses();", true);
        }

        protected void lstfaculties_SelectedIndexChanged(object sender, EventArgs e)
        {
            // Get the selected faculty from the dropdown list
            string selectedFaculty = lstfaculties.SelectedValue;

            // Clear the existing items in the program dropdown list
            lstprogram.Items.Clear();

            // Populate the program dropdown list based on the selected faculty
            if (selectedFaculty == "Faculty of Humanities and Art")
            {
                lstprogram.Items.Add(new ListItem("Bachelor of Arts (BA) – General or with majors in: English Literature, History, Philosophy, Sociology, Cultural Studies"));
                lstprogram.Items.Add(new ListItem("Bachelor of Fine Arts (BFA) – Specializations in: Painting, Sculpture, Graphic Design, Photography"));
                lstprogram.Items.Add(new ListItem("Bachelor of Performing Arts (BPA) – Majors in: Drama, Dance, Music"));
                lstprogram.Items.Add(new ListItem("Bachelor of Design (BDes) – Majors in: Graphic Design, Interior Design, Fashion Design"));
                lstprogram.Items.Add(new ListItem("Bachelor of Music (BMus) – Specializations in: Performance, Composition, Music Theory"));
                lstprogram.Items.Add(new ListItem("Bachelor of Arts (Honours) (BA Hons) – Advanced study in: English Literature, History, Philosophy"));
                lstprogram.Items.Add(new ListItem("Bachelor of Fine Arts (Honours) (BFA Hons) – Advanced study in: Visual Arts"));
                lstprogram.Items.Add(new ListItem("Bachelor of Music (Honours) (BMus Hons) – Advanced study in: Music Performance, Music Composition"));
                lstprogram.Items.Add(new ListItem("Master of Arts (MA) – Specializations in: Literature, History, Philosophy, Sociology, Cultural Studies"));
                lstprogram.Items.Add(new ListItem("Master of Fine Arts (MFA) – Advanced study in: Visual Arts, Design"));
                lstprogram.Items.Add(new ListItem("Master of Music (MMus) – Advanced study in: Performance, Composition"));
                lstprogram.Items.Add(new ListItem("Master of Performing Arts (MPA) – Specializations in: Theatre, Dance, Music"));
                lstprogram.Items.Add(new ListItem("Doctor of Philosophy (PhD) – Research-focused programs in: Humanities (various disciplines), Fine Arts, Music"));
                lstprogram.Items.Add(new ListItem("Diploma in Fine Arts – Specializations in: Painting, Sculpture, Photography"));
                lstprogram.Items.Add(new ListItem("Diploma in Graphic Design"));
                lstprogram.Items.Add(new ListItem("Diploma in Interior Design"));
                lstprogram.Items.Add(new ListItem("Diploma in Performing Arts – Majors in: Theatre, Dance"));
                lstprogram.Items.Add(new ListItem("Diploma in Film and Media Studies"));
                lstprogram.Items.Add(new ListItem("Postgraduate Diploma in Arts – Specializations in: Cultural Studies, Creative Writing"));
                lstprogram.Items.Add(new ListItem("Postgraduate Diploma in Fine Arts – Advanced studies in: Visual Arts"));
                lstprogram.Items.Add(new ListItem("Postgraduate Diploma in Design – Specializations in: Graphic Design, Fashion Design"));
                // Add more programs here
            }
            else if (selectedFaculty == "Faculty of Health Science")
            {
                lstprogram.Items.Add(new ListItem("Bachelor of Medicine and Bachelor of Surgery (MBChB)"));
                lstprogram.Items.Add(new ListItem("Bachelor of Nursing (BNurs)"));
                lstprogram.Items.Add(new ListItem("Bachelor of Pharmacy (BPharm)"));
                lstprogram.Items.Add(new ListItem("Bachelor of Physiotherapy (BPT)"));
                lstprogram.Items.Add(new ListItem("Bachelor of Occupational Therapy (BOT)"));
                lstprogram.Items.Add(new ListItem("Bachelor of Clinical Nutrition and Dietetics (BSc)"));
                lstprogram.Items.Add(new ListItem("Bachelor of Radiography (BSc)"));
                lstprogram.Items.Add(new ListItem("Bachelor of Public Health (BPH)"));
                lstprogram.Items.Add(new ListItem("Bachelor of Health Sciences (BHS) – General or with majors in: Health Promotion, Healthcare Management"));
                lstprogram.Items.Add(new ListItem("Bachelor of Health Sciences (Honours) (BHS Hons)"));
                lstprogram.Items.Add(new ListItem("Bachelor of Nursing (Honours) (BNurs Hons)"));
                lstprogram.Items.Add(new ListItem("Bachelor of Pharmacy (Honours) (BPharm Hons)"));
                lstprogram.Items.Add(new ListItem("Bachelor of Physiotherapy (Honours) (BPT Hons)"));
                lstprogram.Items.Add(new ListItem("Master of Medicine (MMed) – Specializations in: Internal Medicine, Surgery, Pediatrics, Psychiatry"));
                lstprogram.Items.Add(new ListItem("Master of Nursing (MNurs) – Specializations in: Advanced Practice, Nursing Education, Clinical Nursing"));
                lstprogram.Items.Add(new ListItem("Master of Pharmacy (MPharm)"));
                lstprogram.Items.Add(new ListItem("Master of Physiotherapy (MPT)"));
                lstprogram.Items.Add(new ListItem("Master of Occupational Therapy (MOT)"));
                lstprogram.Items.Add(new ListItem("Master of Public Health (MPH)"));
                lstprogram.Items.Add(new ListItem("Master of Clinical Nutrition and Dietetics (MSc)"));
                lstprogram.Items.Add(new ListItem("Doctor of Philosophy (PhD) – Research-focused programs in: Medicine, Nursing, Pharmacy, Public Health, Physiotherapy, Occupational Therapy"));
                lstprogram.Items.Add(new ListItem("Diploma in Nursing – Specializations in: General Nursing, Midwifery"));
                lstprogram.Items.Add(new ListItem("Diploma in Pharmacy – Pharmacy Technician"));
                lstprogram.Items.Add(new ListItem("Diploma in Physiotherapy"));
                lstprogram.Items.Add(new ListItem("Diploma in Occupational Therapy"));
                lstprogram.Items.Add(new ListItem("Diploma in Clinical Nutrition and Dietetics"));
                lstprogram.Items.Add(new ListItem("Diploma in Radiography"));
                lstprogram.Items.Add(new ListItem("Postgraduate Diploma in Public Health"));
                lstprogram.Items.Add(new ListItem("Postgraduate Diploma in Advanced Clinical Practice"));
                lstprogram.Items.Add(new ListItem("Postgraduate Diploma in Healthcare Management"));
                lstprogram.Items.Add(new ListItem("Postgraduate Diploma in Advanced Nursing Practice"));
                // Add more programs here
            }
            else if (selectedFaculty == "Faculty of Engineering and the Built Environment")
            {
                lstprogram.Items.Add(new ListItem("Bachelor of Engineering (BEng) – Specializations in: Civil Engineering, Mechanical Engineering, Electrical Engineering, Chemical Engineering, Industrial Engineering, Aerospace Engineering"));
                lstprogram.Items.Add(new ListItem("Bachelor of Architecture (BArch)"));
                lstprogram.Items.Add(new ListItem("Bachelor of Quantity Surveying (BQS)"));
                lstprogram.Items.Add(new ListItem("Bachelor of Construction Management (BConM)"));
                lstprogram.Items.Add(new ListItem("Bachelor of Urban and Regional Planning (BURP)"));
                lstprogram.Items.Add(new ListItem("Bachelor of Environmental Engineering (BEnvEng)"));
                lstprogram.Items.Add(new ListItem("Bachelor of Computer Engineering (BCompEng)"));
                lstprogram.Items.Add(new ListItem("Bachelor of Engineering (Honours) (BEng Hons) – Advanced study in: Civil Engineering, Mechanical Engineering, Electrical Engineering, Chemical Engineering"));
                lstprogram.Items.Add(new ListItem("Bachelor of Architecture (Honours) (BArch Hons)"));
                lstprogram.Items.Add(new ListItem("Bachelor of Quantity Surveying (Honours) (BQS Hons)"));
                lstprogram.Items.Add(new ListItem("Bachelor of Construction Management (Honours) (BConM Hons)"));
                lstprogram.Items.Add(new ListItem("Bachelor of Urban and Regional Planning (Honours) (BURP Hons)"));
                lstprogram.Items.Add(new ListItem("Master of Engineering (MEng) – Specializations in: Civil Engineering, Mechanical Engineering, Electrical Engineering, Chemical Engineering, Industrial Engineering"));
                lstprogram.Items.Add(new ListItem("Master of Architecture (MArch)"));
                lstprogram.Items.Add(new ListItem("Master of Quantity Surveying (MSc QS)"));
                lstprogram.Items.Add(new ListItem("Master of Construction Management (MSc ConM)"));
                lstprogram.Items.Add(new ListItem("Master of Urban and Regional Planning (MURP)"));
                lstprogram.Items.Add(new ListItem("Master of Environmental Engineering (MSc EnvEng)"));
                lstprogram.Items.Add(new ListItem("Master of Computer Engineering (MCompEng)"));
                lstprogram.Items.Add(new ListItem("Doctor of Philosophy (PhD) – Research-focused programs in: Engineering (various disciplines), Architecture, Construction Management, Urban and Regional Planning"));
                lstprogram.Items.Add(new ListItem("Diploma in Engineering – Specializations in: Civil Engineering, Mechanical Engineering, Electrical Engineering, Chemical Engineering"));
                lstprogram.Items.Add(new ListItem("Diploma in Architecture"));
                lstprogram.Items.Add(new ListItem("Diploma in Quantity Surveying"));
                lstprogram.Items.Add(new ListItem("Diploma in Construction Management"));
                lstprogram.Items.Add(new ListItem("Diploma in Urban and Regional Planning"));
                lstprogram.Items.Add(new ListItem("Postgraduate Diploma in Engineering Management"));
                lstprogram.Items.Add(new ListItem("Postgraduate Diploma in Environmental Engineering"));
                lstprogram.Items.Add(new ListItem("Postgraduate Diploma in Urban and Regional Planning"));
                lstprogram.Items.Add(new ListItem("Postgraduate Diploma in Project Management"));
                // Add more programs here
            }
            else if (selectedFaculty == "Faculty of Natural and Agriculture Sciences")
            {
                lstprogram.Items.Add(new ListItem("Bachelor of Science (BSc) – Specializations in: Biology, Chemistry, Physics, Mathematics, Environmental Science, Geology, Statistics"));
                lstprogram.Items.Add(new ListItem("Bachelor of Science in Information Technology (BSc IT)"));
                lstprogram.Items.Add(new ListItem("Bachelor of Science in Computer Science (BSc CS)"));
                lstprogram.Items.Add(new ListItem("Bachelor of Agriculture (BAgri) – Specializations in: Crop Science, Animal Science, Soil Science, Agricultural Economics"));
                lstprogram.Items.Add(new ListItem("Bachelor of Horticulture (BHort)"));
                lstprogram.Items.Add(new ListItem("Bachelor of Environmental Science (BEnvSci)"));
                lstprogram.Items.Add(new ListItem("Bachelor of Forestry (BF)"));
                lstprogram.Items.Add(new ListItem("Bachelor of Science (Honours) (BSc Hons) – Advanced study in: Biology, Chemistry, Physics, Environmental Science"));
                lstprogram.Items.Add(new ListItem("Bachelor of Science in Information Technology (Honours) (BSc IT Hons)"));
                lstprogram.Items.Add(new ListItem("Bachelor of Science in Computer Science (Honours) (BSc CS Hons)"));
                lstprogram.Items.Add(new ListItem("Bachelor of Agriculture (Honours) (BAgri Hons) – Advanced study in: Crop Science, Animal Science"));
                lstprogram.Items.Add(new ListItem("Bachelor of Environmental Science (Honours) (BEnvSci Hons)"));
                lstprogram.Items.Add(new ListItem("Master of Science (MSc) – Specializations in: Biology, Chemistry, Physics, Environmental Science, Geology, Statistics"));
                lstprogram.Items.Add(new ListItem("Master of Science in Information Technology (MSc IT)"));
                lstprogram.Items.Add(new ListItem("Master of Science in Computer Science (MSc CS)"));
                lstprogram.Items.Add(new ListItem("Master of Agriculture (MScAgri) – Specializations in: Crop Science, Animal Science, Soil Science"));
                lstprogram.Items.Add(new ListItem("Master of Horticulture (MSc Hort)"));
                lstprogram.Items.Add(new ListItem("Master of Environmental Science (MSc EnvSci)"));
                lstprogram.Items.Add(new ListItem("Master of Forestry (MSc For)"));
                lstprogram.Items.Add(new ListItem("Doctor of Philosophy (PhD) – Research-focused programs in: Natural Sciences (various disciplines), Computer Science, Information Technology"));
                lstprogram.Items.Add(new ListItem("Doctor of Philosophy in Environmental Science (PhD EnvSci)"));
                lstprogram.Items.Add(new ListItem("Doctor of Philosophy (PhD) – Research-focused programs in: Agriculture, Horticulture, Forestry"));
                lstprogram.Items.Add(new ListItem("Diploma in Information Technology (IT)"));
                lstprogram.Items.Add(new ListItem("Diploma in Computer Science"));
                lstprogram.Items.Add(new ListItem("Diploma in Environmental Science"));
                lstprogram.Items.Add(new ListItem("Diploma in Geology"));
                lstprogram.Items.Add(new ListItem("Diploma in Agricultural Science – Specializations in: Crop Production, Animal Production"));
                lstprogram.Items.Add(new ListItem("Diploma in Horticulture"));
                lstprogram.Items.Add(new ListItem("Diploma in Forestry"));
                lstprogram.Items.Add(new ListItem("Diploma in Soil Science"));
                lstprogram.Items.Add(new ListItem("Postgraduate Diploma in Environmental Management"));
                lstprogram.Items.Add(new ListItem("Postgraduate Diploma in Information Technology (ICT Management)"));
                lstprogram.Items.Add(new ListItem("Postgraduate Diploma in Computer Science"));
                lstprogram.Items.Add(new ListItem("Postgraduate Diploma in Agricultural Economics"));
                // Add more programs here
            }
            else
            {
                lstprogram.Items.Add(new ListItem("Select a Program"));
            }
        }



        protected void btnAddRow_Click(object sender, EventArgs e)
        {
            // Create a new row
            TableRow newRow = new TableRow();

            // Create and add cells for Subject, Mark, Percentage, and Symbol
            TableCell subjectCell = new TableCell();
            TextBox txtSubject = new TextBox { ID = "txtSubject" + (rowCount + 1), CssClass = "form-control" };
            subjectCell.Controls.Add(txtSubject);

            TableCell markCell = new TableCell();
            TextBox txtMark = new TextBox { ID = "txtMark" + (rowCount + 1), CssClass = "form-control" };
            markCell.Controls.Add(txtMark);

            TableCell percentageCell = new TableCell();
            TextBox txtPercentage = new TextBox { ID = "txtPercentage" + (rowCount + 1), CssClass = "form-control" };
            percentageCell.Controls.Add(txtPercentage);

            TableCell symbolCell = new TableCell();
            DropDownList ddlSymbol = new DropDownList { ID = "ddlSymbol" + (rowCount + 1), CssClass = "form-control" };
            ddlSymbol.Items.Add(new ListItem("Fail", "Fail"));
            ddlSymbol.Items.Add(new ListItem("Pass", "Pass"));
            ddlSymbol.Items.Add(new ListItem("Pass with Distinction", "Distinction"));
            symbolCell.Controls.Add(ddlSymbol);

            // Add cells to the new row
            newRow.Cells.Add(subjectCell);
            newRow.Cells.Add(markCell);
            newRow.Cells.Add(percentageCell);
            newRow.Cells.Add(symbolCell);

            // Add the new row to the table
            tblMarks.Rows.Add(newRow);

        }

        protected void btnGenerateRows_Click(object sender, EventArgs e)
        {
        }


        private void SaveToDataBase(
        string firstName,
        string middleName,
        string lastName,
        DateTime dateOfBirth,
        int age,
        string address,
        int yearOfMatriculation,
        string phoneNumber,
        string emailAddress,
        string gender,
        string nationality,
        string highSchoolName,
        string highSchoolAddress)
        {
            // Connection string to your database
            string connectionString = "Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=\"C:\\Users\\45979\\OneDrive\\Documents\\New folder\\Prototype(University IS)\\App_Data\\University Information System DataBase.mdf\";Integrated Security=True";

            // SQL query to insert data
            string query = @"
        INSERT INTO ApplicantInformationTable
        (
            FirstName,
            MiddleName,
            LastName,
            DateOfBirth,
            Age,
            Address,
            YearOfMatriculation,
            PhoneNumber,
            EmailAddress,
            Gender,
            Nationality,
            HighSchoolName,
            HighSchoolAddress,
            ApplicationDate
        )
        VALUES
        (
            @FirstName,
            @MiddleName,
            @LastName,
            @DateOfBirth,
            @Age,
            @Address,
            @YearOfMatriculation,
            @PhoneNumber,
            @EmailAddress,
            @Gender,
            @Nationality,
            @HighSchoolName,
            @HighSchoolAddress,
            GETDATE()
        )";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                SqlCommand command = new SqlCommand(query, connection);
                command.Parameters.AddWithValue("@FirstName", firstName);
                command.Parameters.AddWithValue("@MiddleName", string.IsNullOrEmpty(middleName) ? (object)DBNull.Value : middleName);
                command.Parameters.AddWithValue("@LastName", lastName);
                command.Parameters.AddWithValue("@DateOfBirth", dateOfBirth);
                command.Parameters.AddWithValue("@Age", age);
                command.Parameters.AddWithValue("@Address", address);
                command.Parameters.AddWithValue("@YearOfMatriculation", yearOfMatriculation);
                command.Parameters.AddWithValue("@PhoneNumber", phoneNumber);
                command.Parameters.AddWithValue("@EmailAddress", emailAddress);
                command.Parameters.AddWithValue("@Gender", gender);
                command.Parameters.AddWithValue("@Nationality", nationality);
                command.Parameters.AddWithValue("@HighSchoolName", highSchoolName);
                command.Parameters.AddWithValue("@HighSchoolAddress", highSchoolAddress);

                connection.Open();
                command.ExecuteNonQuery();
            }

        }

        protected void btnSubmit_Click1(object sender, EventArgs e)
        {



        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            // Handle form submission
            //lblConfirmation.Text = "Application submitted successfully!";
            //lblConfirmation.Visible = true;

            if (fileupload.HasFile)
            {
                try
                {
                    string resultsPDF = Path.GetFileName(fileupload.PostedFile.FileName);
                    string savePath = Server.MapPath("~/UploadedResults/") + resultsPDF;
                    fileupload.SaveAs(savePath);
                }
                catch (Exception ex)
                {
                    // Handle the exception
                }

                



            }

            // Retrieve the values from the form controls
            string firstName = txtFirstName.Text;
            string middleName = txtMiddleName.Text;
            string lastName = txtLastName.Text;
            DateTime dateOfBirth;
            int age;
            int yearOfMatriculation;

            if (DateTime.TryParse(txtDateOfBirth.Text, out dateOfBirth))
            {
                // Process dateOfBirth
            }

            if (int.TryParse(txtAge.Text, out age))
            {
                // Process age
            }

            if (int.TryParse(txtYearOfMatriculation.Text, out yearOfMatriculation))
            {
                // Process yearOfMatriculation
            }

            string address = txtAddress.Text;
            string phoneNumber = txtPhoneNumber.Text;
            string emailAddress = txtEmailAddress.Text;
            string gender = ddlGender.SelectedValue;
            string nationality = txtNationality.Text;
            string highSchoolName = txtHighSchoolName.Text;
            string highSchoolAddress = txtHighSchoolAddress.Text;

            // Insert data into database
            SaveToDataBase(firstName, middleName, lastName, dateOfBirth, age, address, yearOfMatriculation, phoneNumber, emailAddress, gender, nationality, highSchoolName, highSchoolAddress);
        }
    }
}









 