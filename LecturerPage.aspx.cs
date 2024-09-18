using System;
using System.IO;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using iTextSharp.text; // For iTextSharp PDF creation
using iTextSharp.text.pdf; // For iTextSharp PDF creation
using DocumentFormat.OpenXml.Packaging; // For OpenXML Word document creation
using DocumentFormat.OpenXml.Wordprocessing; // For OpenXML Word document creation
using System.Drawing; // For System.Drawing.Color
using System.Text; // For StringBuilder

namespace Prototype_University_IS_
{
    public partial class LecturerPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void btnCreateTest_Click(object sender, EventArgs e)
        {
            string testName = txtTestName.Text.Trim();
            string documentFormat = ddlDocumentFormat.SelectedValue;

            if (string.IsNullOrEmpty(testName))
            {
                lblTestStatus.Text = "Please enter a test name.";
                lblTestStatus.ForeColor = System.Drawing.Color.Red; // Use System.Drawing.Color
                return;
            }

            // Create test content
            string testContent = GenerateTestContent();

            if (documentFormat == "pdf")
            {
                CreatePDF(testName, testContent);
            }
            else if (documentFormat == "docx")
            {
                CreateWordDocument(testName, testContent);
            }
            else
            {
                lblTestStatus.Text = "Please select a document format.";
                lblTestStatus.ForeColor = System.Drawing.Color.Red; // Use System.Drawing.Color
            }
        }

        private string GenerateTestContent()
        {
            var sb = new StringBuilder();
            sb.AppendLine("Test Name: " + txtTestName.Text.Trim());
            sb.AppendLine();

            // Find the container for questions
            var questionsContainer = (System.Web.UI.HtmlControls.HtmlGenericControl)FindControl("questionsContainer");

            if (questionsContainer != null)
            {
                int questionNumber = 1;

                foreach (var control in questionsContainer.Controls)
                {
                    if (control is System.Web.UI.HtmlControls.HtmlGenericControl questionBlock)
                    {
                        // Initialize variables for controls
                        TextBox txtQuestion1 = null;
                        TextBox txtOption1_1 = null;
                        TextBox txtOption1_2 = null;
                        TextBox txtOption1_3 = null;
                        TextBox txtOption1_4 = null;
                        DropDownList ddlCorrectOption1 = null;

                        // Loop through controls within the questionBlock
                        foreach (var innerControl in questionBlock.Controls)
                        {
                            if (innerControl is TextBox textBox)
                            {
                                // Assign text boxes based on their position
                                if (txtQuestion1 == null && !string.IsNullOrEmpty(textBox.Text) && !textBox.Text.StartsWith("Option"))
                                {
                                    txtQuestion1 = textBox;
                                }
                                else if (txtOption1_1 == null && textBox.Text.StartsWith("Option 1"))
                                {
                                    txtOption1_1 = textBox;
                                }
                                else if (txtOption1_2 == null && textBox.Text.StartsWith("Option 2"))
                                {
                                    txtOption1_2 = textBox;
                                }
                                else if (txtOption1_3 == null && textBox.Text.StartsWith("Option 3"))
                                {
                                    txtOption1_3 = textBox;
                                }
                                else if (txtOption1_4 == null && textBox.Text.StartsWith("Option 4"))
                                {
                                    txtOption1_4 = textBox;
                                }
                            }
                            else if (innerControl is DropDownList ddl)
                            {
                                ddlCorrectOption1 = ddl;
                            }
                        }

                        // Check if all required controls are found
                        if (txtQuestion1 != null && txtOption1_1 != null && txtOption1_2 != null && txtOption1_3 != null && txtOption1_4 != null && ddlCorrectOption1 != null)
                        {
                            sb.AppendLine($"Question {questionNumber}: {txtQuestion1.Text}");
                            sb.AppendLine("1. " + txtOption1_1.Text);
                            sb.AppendLine("2. " + txtOption1_2.Text);
                            sb.AppendLine("3. " + txtOption1_3.Text);
                            sb.AppendLine("4. " + txtOption1_4.Text);
                            sb.AppendLine("Correct Answer: Option " + ddlCorrectOption1.SelectedValue);
                            sb.AppendLine();

                            questionNumber++;
                        }
                    }
                }
            }
                return sb.ToString();



            
        }

        private void CreatePDF(string fileName, string content)
        {
            iTextSharp.text.Document pdfDocument = new iTextSharp.text.Document(); // Use iTextSharp.text.Document
            try
            {
                string directoryPath = Server.MapPath("~/Tests/");
                if (!Directory.Exists(directoryPath))
                {
                    Directory.CreateDirectory(directoryPath);
                }

                string filePath = Path.Combine(directoryPath, $"{fileName}.pdf");

                using (FileStream fs = new FileStream(filePath, FileMode.Create, FileAccess.Write, FileShare.None))
                {
                    PdfWriter.GetInstance(pdfDocument, fs);
                    pdfDocument.Open();
                    pdfDocument.Add(new iTextSharp.text.Paragraph(content)); // Use iTextSharp.text.Paragraph
                    pdfDocument.Close();
                }

                lblTestStatus.Text = "Test created successfully as PDF.";
                lblTestStatus.ForeColor = System.Drawing.Color.Green; // Use System.Drawing.Color
            }
            catch (Exception ex)
            {
                lblTestStatus.Text = "Error creating PDF: " + ex.Message;
                lblTestStatus.ForeColor = System.Drawing.Color.Red; // Use System.Drawing.Color
            }
            finally
            {
                if (pdfDocument.IsOpen())
                {
                    pdfDocument.Close(); // Ensure the document is closed
                }
            }
        }

        private void CreateWordDocument(string fileName, string content)
        {
            try
            {
                string directoryPath = Server.MapPath("~/Tests/");
                if (!Directory.Exists(directoryPath))
                {
                    Directory.CreateDirectory(directoryPath);
                }

                string filePath = Path.Combine(directoryPath, $"{fileName}.docx");

                using (WordprocessingDocument wordDoc = WordprocessingDocument.Create(filePath, DocumentFormat.OpenXml.WordprocessingDocumentType.Document))
                {
                    MainDocumentPart mainPart = wordDoc.AddMainDocumentPart();
                    mainPart.Document = new DocumentFormat.OpenXml.Wordprocessing.Document(
                        new Body(
                            new DocumentFormat.OpenXml.Wordprocessing.Paragraph(
                                new DocumentFormat.OpenXml.Wordprocessing.Run(
                                    new DocumentFormat.OpenXml.Wordprocessing.Text(content)
                                )
                            )
                        )
                    );
                }

                lblTestStatus.Text = "Test created successfully as Word document.";
                lblTestStatus.ForeColor = System.Drawing.Color.Green; // Use System.Drawing.Color
            }
            catch (Exception ex)
            {
                lblTestStatus.Text = "Error creating Word document: " + ex.Message;
                lblTestStatus.ForeColor = System.Drawing.Color.Red; // Use System.Drawing.Color
            }
        }

        private TextBox CreateTextBox(string initialText)
        {
            var textBox = new TextBox
            {
                TextMode = TextBoxMode.SingleLine,
                CssClass = "textbox",
                Text = initialText // Set initial text instead of Placeholder
            };
            return textBox;
        }

        protected void btnAddQuestion_Click(object sender, EventArgs e)
        {
            // Find the container where questions are added
            var questionsContainer = (System.Web.UI.HtmlControls.HtmlGenericControl)FindControl("questionsContainer");

            if (questionsContainer != null)
            {
                // Create a new question block
                var questionBlock = new System.Web.UI.HtmlControls.HtmlGenericControl("div");
                questionBlock.Attributes.Add("class", "question");

                // Add new question and options
                questionBlock.Controls.Add(CreateTextBox("Enter question"));
                questionBlock.Controls.Add(CreateTextBox("Option 1"));
                questionBlock.Controls.Add(CreateTextBox("Option 2"));
                questionBlock.Controls.Add(CreateTextBox("Option 3"));
                questionBlock.Controls.Add(CreateTextBox("Option 4"));

                // Create a DropDownList for selecting the correct option
                var ddlCorrectOption = new DropDownList
                {
                    ID = "ddlCorrectOption" + (questionsContainer.Controls.Count + 1),
                };
                ddlCorrectOption.Items.Add(new System.Web.UI.WebControls.ListItem("Select Correct Option", ""));
                ddlCorrectOption.Items.Add(new System.Web.UI.WebControls.ListItem("Option 1", "1"));
                ddlCorrectOption.Items.Add(new System.Web.UI.WebControls.ListItem("Option 2", "2"));
                ddlCorrectOption.Items.Add(new System.Web.UI.WebControls.ListItem("Option 3", "3"));
                ddlCorrectOption.Items.Add(new System.Web.UI.WebControls.ListItem("Option 4", "4"));
                questionBlock.Controls.Add(ddlCorrectOption);

                // Add the new question block to the container
                questionsContainer.Controls.Add(questionBlock);
            }
        }

       

        protected void btnPostAnnouncement_Click1(object sender, EventArgs e)
        {

        }

        protected void btnAddStudent_Click(object sender, EventArgs e)
        {

        }

        protected void btnEditStudent_Click(object sender, EventArgs e)
        {

        }

        protected void btnRemoveStudent_Click(object sender, EventArgs e)
        {

        }

        protected void btnUploadDocument_Click(object sender, EventArgs e)
        {

        }
    }
}