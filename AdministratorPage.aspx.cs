using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;


namespace Prototype_University_IS_
{
    public partial class AdministratorPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string adminID = GetAdminIDFromSession();
                if (adminID != null)
                {
                    //DisplayAdministratorDetails(adminID);
                }
                else
                {
                    // Handle case where no valid admin ID is found (e.g., redirect to login page)
                    Response.Redirect("LogInSystemPage.aspx");
                }
            }


        }



        private string GetAdminIDFromSession()
        {
            return Session["AdminID"] as string;
        }

        /*private void DisplayAdministratorDetails(string adminID)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["University Information System DataBase"]?.ConnectionString;

            if (string.IsNullOrEmpty(connectionString))
            {
                // Handle missing connection string
                labelName.Text = "Error: Connection string is missing.";
                labelSurname.Text = "";
                return;
            }

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                string query = "SELECT Name, Surname FROM AdminTable WHERE administratorID = @AdministratorID";
                SqlCommand command = new SqlCommand(query, connection);
                command.Parameters.AddWithValue("@AdministratorID", adminID);

                try
                {
                    connection.Open();
                    SqlDataReader reader = command.ExecuteReader();

                    if (reader.Read())
                    {
                        string name = reader["Name"].ToString();
                        string surname = reader["Surname"].ToString();

                        // Set the text of the labels
                        labelName.Text = "Name: " + name;
                        labelSurname.Text = "\nSurname: " + surname;
                    }
                    else
                    {
                        // Handle case where no data is returned
                        labelName.Text = "Administrator not found.";
                        labelSurname.Text = "";
                    }
                }
                catch (Exception ex)
                {
                    // Handle the exception (e.g., log it and show an error message)
                    labelName.Text = "Error retrieving administrator details.";
                    labelSurname.Text = "";
                    // Log the exception
                    // Console.WriteLine(ex.Message); // Example logging
                }
            }
        }*/



        protected void btnAuthenticate_Click(object sender, EventArgs e)
        {
            /*// Implement user authentication logic
            // Example: Validate user credentials and handle authentication
            string username = txtUsername.Text;
            string password = txtPassword.Text;
            string securityQuestions = txtSecurityQuestions.Text;

            // Placeholder: Replace with actual authentication code
            if (AuthenticateUser(username, password, securityQuestions))
            {
                ShowMessage("User authenticated successfully!", true);
            }
            else
            {
                ShowMessage("Authentication failed. Please check your credentials.", false);
            }

        }*/

            /* protected void btnEnforceAccess_Click(object sender, EventArgs e)
             {
                 // Implement access control enforcement logic
                 string accessControlList = txtAccessControl.Text;

                 // Placeholder: Replace with actual access control code
                 EnforceAccessControl(accessControlList);
                 ShowMessage("Access control enforced successfully!", true);

             }

             protected void btnCalculateGPA_Click(object sender, EventArgs e)
             {
                 // Implement GPA calculation logic
                 string studentId = txtStudentID.Text;
                 string grades = txtGrades.Text;

                 // Placeholder: Replace with actual GPA calculation code
                 double gpa = CalculateGPA(studentId, grades);
                 ShowMessage($"GPA calculated: {gpa}", true);

             }

             protected void btnTrackProgress_Click(object sender, EventArgs e)
             {
                 // Implement academic progress tracking logic
                 string recordId = txtRecordID.Text;

                 // Placeholder: Replace with actual progress tracking code
                 TrackAcademicProgress(recordId);
                 ShowMessage("Academic progress tracked successfully!", true);
             }

             protected void btnUpdateProfessor_Click(object sender, EventArgs e)
             {
                 UpdateProfessor();
                 ShowMessage("Professor updated successfully!", true);

             }

             protected void btnRemoveProfessor_Click(object sender, EventArgs e)
             {
                 //Implement remove professor logic
                 // Placeholder: Replace with actual code to remove a professor
                 RemoveProfessor();
                 ShowMessage("Professor removed successfully!", true);

             }

             protected void btnAddStudent_Click(object sender, EventArgs e)
             {
                 // Implement add student logic
                 // Placeholder: Replace with actual code to add a student
                 AddStudent();
                 ShowMessage("Student added successfully!", true);
             }

             protected void btnUpdateStudent_Click(object sender, EventArgs e)
             {
                 // Implement update student logic
                 // Placeholder: Replace with actual code to update a student
                 UpdateStudent();
                 ShowMessage("Student updated successfully!", true);

             }

             protected void btnRemoveStudent_Click(object sender, EventArgs e)
             {
                 // Implement remove student logic
                 // Placeholder: Replace with actual code to remove a student
                 RemoveStudent();
                 ShowMessage("Student removed successfully!", true);

             }

             protected void btnAddCourse_Click(object sender, EventArgs e)
             {
                 // Implement add course logic
                 // Placeholder: Replace with actual code to add a course
                 AddCourse();
                 ShowMessage("Course added successfully!", true);

             }

             protected void btnUpdateCourse_Click(object sender, EventArgs e)
             {
                 // Implement update course logic
                 // Placeholder: Replace with actual code to update a course
                 UpdateCourse();
                 ShowMessage("Course updated successfully!", true);
             }

             protected void btnRemoveCourse_Click(object sender, EventArgs e)
             {
                 // Implement remove course logic
                 // Placeholder: Replace with actual code to remove a course
                 RemoveCourse();
                 ShowMessage("Course removed successfully!", true);

             }

             protected void btnAddTutor_Click(object sender, EventArgs e)
             {
                 // Implement add tutor logic
                 // Placeholder: Replace with actual code to add a tutor
                 AddTutor();
                 ShowMessage("Tutor added successfully!", true);

             }

             protected void btnUpdateTutor_Click(object sender, EventArgs e)
             {
                 // Implement update tutor logic
                 // Placeholder: Replace with actual code to update a tutor
                 UpdateTutor();
                 ShowMessage("Tutor updated successfully!", true);
             }

             protected void btnRemoveTutor_Click(object sender, EventArgs e)
             {
                 // Implement remove tutor logic
                 // Placeholder: Replace with actual code to remove a tutor
                 RemoveTutor();
                 ShowMessage("Tutor removed successfully!", true);
             }

             protected void btnBackupData_Click(object sender, EventArgs e)
             {
                 // Implement data backup logic
                 // Placeholder: Replace with actual code to backup data
                 BackupData();
                 ShowMessage("Data backed up successfully!", true);
             }

             protected void btnRequestReport_Click(object sender, EventArgs e)
             {
                 // Implement report request logic
                 // Placeholder: Replace with actual code to request a report
                 RequestReport();
                 ShowMessage("Report requested successfully!", true);
             }

             private void ShowMessage(string message, bool isSuccess)
             {
                 // Method to show success or error messages
                 var messageType = isSuccess ? "confirmation" : "error-message";
                 var div = new HtmlGenericControl("div")
                 {
                     InnerHtml = message,
                     Attributes = { ["class"] = messageType }
                 };
                 // Add the message div to the page (e.g., in a placeholder control)
                 //PlaceHolderMessages.Controls.Add(div);
             }*/

            // Placeholder methods for actual database or service operations
            //private bool AuthenticateUser(string username, string password, string securityQuestions) { /* Implementation here */ return true; }
            //private void EnforceAccessControl(string accessControlList) { /* Implementation here */ }
            //private double CalculateGPA(string studentId, string grades) { /* Implementation here */ return 4.0; }
            ///private void TrackAcademicProgress(string recordId) { /* Implementation here */ }
            //private void AddProfessor() { /* Implementation here */ }
            //private void UpdateProfessor() { /* Implementation here */ }
            //private void RemoveProfessor() { /* Implementation here */ }
            //private void AddStudent() { /* Implementation here */ }
            //private void UpdateStudent() { /* Implementation here */ }
            //private void RemoveStudent() { /* Implementation here */ }
            //private void AddCourse() { /* Implementation here */ }
            //private void UpdateCourse() { /* Implementation here */ }
            //private void RemoveCourse() { /* Implementation here */ }
            //private void AddTutor() { /* Implementation here */ }
            //private void UpdateTutor() { /* Implementation here */ }
            //private void RemoveTutor() { /* Implementation here */ }
            //private void BackupData() { /* Implementation here */ }
            //private void RequestReport() { /* Implementation here */ }
        }

        public void SaveAnnouncementByAdminToDatabase(string title, string content)
        {
            // Define the connection string (adjust as necessary for your environment)
            string connectionString = "Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=\"C:\\Users\\45979\\OneDrive\\Documents\\New folder\\Prototype(University IS)\\App_Data\\University Information System DataBase.mdf\";Integrated Security=True";

            // Define the SQL query for inserting the announcement
            string query = "INSERT INTO [dbo].[AnnouncementByAdminTable] (Title, Content) VALUES (@Title, @Content)";

            // Use a SqlConnection and SqlCommand to execute the query
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    // Add parameters to prevent SQL injection
                    command.Parameters.AddWithValue("@Title", title);
                    command.Parameters.AddWithValue("@Content", content);

                    // Open the connection and execute the query
                    try
                    {
                        connection.Open();
                        command.ExecuteNonQuery();
                    }
                    catch (SqlException sqlEx)
                    {
                        // Handle SQL exceptions (e.g., issues with query or connection)
                        string errorMessage = $"SQL Error: {sqlEx.Message}";
                        // Log or display the detailed SQL error message
                        throw new Exception(errorMessage, sqlEx);
                    }
                    catch (Exception ex)
                    {
                        // Handle general exceptions
                        string errorMessage = $"General Error: {ex.Message}";
                        // Log or display the detailed general error message
                        throw new Exception(errorMessage, ex);
                    }
                }
            }
        }

        protected void btnPostAnnouncement_Click(object sender, EventArgs e)
        {
            string title = txtAnnouncementTitle.Text;
            string content = txtAnnouncementContent.Text;

            if (!string.IsNullOrEmpty(title) && !string.IsNullOrEmpty(content))
            {
                // Add your database logic here to save the announcement
                // Example:
                SaveAnnouncementByAdminToDatabase(title, content);
                // SaveAnnouncementToDatabase(title, content);

                lblBackupStatus.Text = "Announcement posted successfully.";
                txtAnnouncementTitle.Text = "";
                txtAnnouncementContent.Text = "";
            }
            else
            {
                lblBackupStatus.Text = "Please fill in both title and content.";
                lblBackupStatus.ForeColor = System.Drawing.Color.Red;
            }
        }

        protected void btnAddProfessor_Click(object sender, EventArgs e)
        {

        }

        protected void btnEditProfessor_Click(object sender, EventArgs e)
        {

        }

        protected void btnDeleteProfessor_Click(object sender, EventArgs e)
        {

        }

        protected void btnAddCourse_Click(object sender, EventArgs e)
        {

        }

        protected void btnEditCourse_Click(object sender, EventArgs e)
        {

        }

        protected void btnDeleteCourse_Click(object sender, EventArgs e)
        {

        }

        protected void btnAddModule_Click(object sender, EventArgs e)
        {

        }

        protected void btnEditModule_Click(object sender, EventArgs e)
        {

        }

        protected void btnDeleteModule_Click(object sender, EventArgs e)
        {

        }
    }
}
