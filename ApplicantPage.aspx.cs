using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Web.UI;

namespace Prototype_University_IS_
{
    public partial class ApplicantPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Ensure the user is logged in
                if (Session["ID"] != null)
                {
                    lblApplicantID.Text = Session["ID"].ToString();
                    lblName.Text = Session["Name"].ToString();
                    lblSurname.Text = Session["Surname"].ToString();

                    // Display additional details
                    DisplayDetails(Session["ID"].ToString());
                }
                else
                {
                    // Redirect to login page if session variables are not set
                    Response.Redirect("LogInSystemPage.aspx");
                }
            }
        }

        private void DisplayDetails(string adminID)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["University Information System DataBase"]?.ConnectionString;

            if (string.IsNullOrEmpty(connectionString))
            {
                // Handle missing connection string
                lblName.Text = "Error: Connection string is missing.";
                lblSurname.Text = "";
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
                        lblName.Text = reader["Name"].ToString();
                        lblSurname.Text = reader["Surname"].ToString();
                    }
                    else
                    {
                        // Handle case where no data is returned
                        lblName.Text = "Administrator not found.";
                        lblSurname.Text = "";
                    }
                }
                catch (Exception ex)
                {
                    // Handle the exception (e.g., log it and show an error message)
                    lblName.Text = "Error retrieving administrator details.";
                    lblSurname.Text = "";
                    // Log the exception (this would be better done using a logging framework)
                    Console.WriteLine(ex.Message); // Example logging
                }
            }
        }
    }
}