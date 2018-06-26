using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Data.Common;
using System.Data.SqlClient;
using System.Drawing;
using System.Security.Principal;
using System.Web;
using System.Web.Security;
using System.Web.SessionState;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Text;
using System.IO;

using AutismCenterBase.Utilities;

namespace Documents
{

    public partial class ViewDoc : System.Web.UI.Page
    {
        protected System.Web.UI.HtmlControls.HtmlControl frame1;


        protected void Page_Load(object sender, EventArgs e)
        {
            DisplayDoc_Button.Text = "Hide Document";
        }


        protected void Page_PreRender(Object o, EventArgs e)
        {
            if (Request.Params["DocVersID"] != null)
            {
                /* NEED TO TRAP WHEN AN INCORRECT DocVersID IS RECEIVED */
                HtmlControl frame1 = new System.Web.UI.HtmlControls.HtmlGenericControl("iframe");

                HtmlTitle title = (HtmlTitle)this.Master.FindControl("oTitle");
                String dv_title = "";

                if (FormView1.CurrentMode == FormViewMode.ReadOnly)
                {
                    try
                    {
                        dv_title = ((Label)this.FormView1.FindControl("DocTitleLabel")).Text;
                    }
                    catch (Exception ex)
                    {
                        try
                        { dv_title = ViewState["doctitle"].ToString(); }
                        catch (Exception ex2)
                        { dv_title = ""; }
                    }

                    title.Text = "(#" + Request.Params["DocVersID"] + ") " + dv_title;
                    
                    //ReadOnly or Itemtemplate mode
                    DisplayDoc_Button.Visible = true;

                    try
                    {
                        frame1.Attributes["src"] = ((Label)this.FormView1.FindControl("DocLinkLabel")).Text;
                    }
                    catch (Exception ex)
                    {
                        if (ViewState["doclink"] != null)
                        { frame1.Attributes["src"] = ViewState["doclink"].ToString(); }
                        else
                        { frame1.Attributes["src"] = ""; }
                    }


                    frame1.Attributes["style"] = "width:100%; height:800px";
                    frame1.Attributes["frameborder"] = "1";
                    frame1.Attributes["scrolling"] = "auto";
                    frame1.Attributes["align"] = "top";

                    theFrameHolder.Controls.Add(frame1);

                    Label_Error.Text = "";

                }
                if (FormView1.CurrentMode == FormViewMode.Insert)
                { 
                    DisplayDoc_Button.Visible = false;
                    title.Text = "(#" + Request.Params["DocVersID"] + ") New Version";
                }
                if (FormView1.CurrentMode == FormViewMode.Edit)
                {
                    DisplayDoc_Button.Visible = false;
                    title.Text = "(#" + Request.Params["DocVersID"] + ") Edit Doc";
                }


            }
            else
            {
                Label_Error.Text = "ERROR: Value for DocVersID parameter was not provided.";
                //this should be provided in the query string
            }

        }


        protected void FormView1_Insert(object sender, EventArgs e)
        { }

        protected void UploadButton_Click(object sender, EventArgs e)
        {
            FileUpload FileUpload1 = (FileUpload)this.FormView1.FindControl("FileUpload1");
            Label FileUploadLabel1 = (Label)this.FormView1.FindControl("FileUploadLabel1");
            Label FileExtLabel1 = (Label)this.FormView1.FindControl("FileExtTextBox_Insert");
            Label NextDocVersIDLabel = (Label)this.FormView2.FindControl("NextDocVersIDLabel");
            //int New_or_Replace = this.FormView1.FindControl("RadioButtonList1");

            //        string path = ConfigurationManager.AppSettings["DOCUMENT_LOCATION"];

            string path = @"\\autism-fs01\d$\WebDocs\";
            bool fileOK;

            fileOK = false;
            // Before attempting to perform operations
            // on the file, verify that the FileUpload 
            // control contains a file.
            if (FileUpload1.HasFile)
            {
                String NextDocVersID = NextDocVersIDLabel.Text;
                String filePath = System.IO.Path.GetFullPath(FileUpload1.FileName);
                String fileExtension =
                    System.IO.Path.GetExtension(FileUpload1.FileName).ToLower();
                String[] allowedExtensions = 
                { ".doc", ".pdf", ".txt", ".xls", ".gif", ".png", ".jpeg", ".jpg" , ".bmp", ".sps", ".sav", ".spo", ".rtf" };
                for (int i = 0; i < allowedExtensions.Length; i++)
                {
                    if (fileExtension == allowedExtensions[i])   { fileOK = true; }
                }

                if (fileOK)
                {
                    try
                    {
                        ((Label)FormView1.FindControl("FileExtTextBox_Insert")).Text = fileExtension;
                        //((Label)FormView1.Row.Cells[0].FindControl("FileUploadLabel1")).Text = FileUpload1.FileName;

                        FileUpload1.PostedFile.SaveAs(path + "DocVersID_" + NextDocVersID + fileExtension);
                        MessageBox2.Show("File uploaded.");
                    }
                    catch (Exception ex)
                    {
                        //  ((Label)FormView1.Row.Cells[0].FindControl("FileUploadLabel1")).Text = "File could not be uploaded.";
                        MessageBox2.Show("ERROR: File could not be uploaded.");
                    }
                }
                else
                {
                    MessageBox2.Show("Cannot accept files of this type.");
                }
            }
        }

        protected void EditDocumentInfo(object sender, EventArgs e)
        {
            HtmlControl theframe1 = (HtmlControl)this.Master.FindControl("oBodyPlaceHolder").FindControl("frame1");



            //theframe1.Attributes["src"] = @"\\autism-fs01\d$\WebDocs\DocVersID__ReplacingFileNotice.htm";

            //HtmlControl frame1 = (HtmlControl)this.FindControl("frame1");

            // edit the following to replace the file //
            FileUpload FileUpload2 = (FileUpload)this.FormView1.FindControl("FileUpload2");
            Label FileUploadLabel2 = (Label)this.FormView1.FindControl("FileUploadLabel2");
            Label FileExtLabel2 = (Label)this.FormView1.FindControl("FileExtLabel2");
            Label DocVersIDLabel2 = (Label)this.FormView1.FindControl("DocVersIDTextbox");
            //int New_or_Replace = this.FormView1.FindControl("RadioButtonList1");

            //        string path = ConfigurationManager.AppSettings["DOCUMENT_LOCATION"];

            string path = @"\\autism-fs01\d$\WebDocs\";
            string path_replace = @"\\autism-fs01\d$\WebDocs\ReplacedDocs\";

            bool fileOK;

            fileOK = false;
            // Before attempting to perform operations
            // on the file, verify that the FileUpload 
            // control contains a file.
            if (FileUpload2.HasFile)
            {
                String DocVersID = DocVersIDLabel2.Text;
                String filePath = System.IO.Path.GetFullPath(FileUpload2.FileName);
                String fileExtension =
                    System.IO.Path.GetExtension(FileUpload2.FileName).ToLower();
                String[] allowedExtensions = 
                { ".doc", ".pdf", ".txt", ".xls", ".gif", ".png", ".jpeg", ".jpg", ".bmp", ".sps", ".sav", ".spo", ".rtf" };
                for (int i = 0; i < allowedExtensions.Length; i++)
                {
                    if (fileExtension == allowedExtensions[i]) { fileOK = true; }
                }

                if (fileOK)
                {
                    try
                    {
                        ((Label)FormView1.FindControl("FileExtLabel2")).Text = fileExtension;
                        ((Label)FormView1.FindControl("FileUploadLabel2")).Text = "DocVersID_" + DocVersID + fileExtension;
                        //((Label)FormView1.Row.Cells[0].FindControl("FileUploadLabel2")).Text = FileUpload2.FileName;


                        //copy the original to the "ReplacedDocs" folder
                        string oldfilename = @"\\autism-fs01\d$\WebDocs\DocVersID_" + DocVersID + ViewState["fileext"].ToString();
                        string newfilename = @"\\autism-fs01\d$\WebDocs\ReplacedDocs\DocVersID_" + DocVersID + "__" +
                            DateTime.Now.Year.ToString() + "_" + DateTime.Now.Month.ToString() + "_" + DateTime.Now.Day.ToString() + "__" +
                            DateTime.Now.Hour.ToString() + "hrs" + DateTime.Now.Minute.ToString() + "mins" + ViewState["fileext"].ToString();
                        File.Copy(oldfilename, newfilename);



                        FileUpload2.PostedFile.SaveAs(path + "DocVersID_" + DocVersID + fileExtension);
                        MessageBox2.Show("File uploaded.");
                    }
                    catch (Exception ex)
                    {
                        //  ((Label)FormView1.Row.Cells[0].FindControl("FileUploadLabel1")).Text = "File could not be uploaded.";
                        MessageBox2.Show("ERROR: File could not be uploaded. (" + ex.Message + ")");
                    }
                }
                else
                {
                    MessageBox2.Show("Cannot accept files of this type.");
                }
            }

        }


        protected void FormView1_ModeChanging(object sender, FormViewModeEventArgs e)
        {
        }
        protected void Button1_Click(object sender, EventArgs e)
        {
        }
        protected void FormView1_DataBound(object sender, EventArgs e)
        {

            if (FormView1.CurrentMode == FormViewMode.Insert)
            {
                   //populate the controls with the info needed for the Insert in SQL
                ((Label)FormView1.Row.Cells[0].FindControl("DocIDTextBox_Insert")).Text = ViewState["docid"].ToString();
                
                // !!! need to find these controls !!!
                ((Label)FormView1.Row.Cells[0].FindControl("DocTitleTextBox_Insert")).Text = ViewState["doctitle"].ToString();
                ((Label)FormView1.Row.Cells[0].FindControl("DocStatusTextBox_Insert")).Text = ViewState["docstatus"].ToString();
                ((Label)FormView1.Row.Cells[0].FindControl("DocTypeTextBox_Insert")).Text = ViewState["doctype"].ToString();
                ((Label)FormView1.Row.Cells[0].FindControl("FileExtTextBox_Insert")).Text = ViewState["fileext"].ToString();
            }

            else
            {

                if (FormView1.DataItem != null)
                {
                    ViewState["docid"] = ((DataRowView)FormView1.DataItem)["DocID"].ToString();
                    ViewState["doctitle"] = ((DataRowView)FormView1.DataItem)["DocTitle"].ToString();
                    ViewState["docstatus"] = ((DataRowView)FormView1.DataItem)["DocStatus"].ToString();
                    ViewState["doctype"] = ((DataRowView)FormView1.DataItem)["DocType"].ToString();
                    ViewState["doclink"] = ((DataRowView)FormView1.DataItem)["DocLink"].ToString();
                    ViewState["fileext"] = ((DataRowView)FormView1.DataItem)["FileExt"].ToString();

                }

                // ViewState["docid"] = ((Label)FormView1.FindControl("DocIDLabel")).Text.ToString();
            }

        }



        protected void FormView1_ItemInserting(object sender, FormViewInsertEventArgs e)
        {
            int z = 1;
            // DbParameter param 
        }


        public class MessageBox2
        {
            private static Hashtable m_executingPages = new Hashtable();

            private MessageBox2() { }

            public static void Show(string sMessage)
            {
                // If this is the first time a page has called this method then
                if (!m_executingPages.Contains(HttpContext.Current.Handler))
                {
                    // Attempt to cast HttpHandler as a Page.
                    Page executingPage = HttpContext.Current.Handler as Page;

                    if (executingPage != null)
                    {
                        // Create a Queue to hold one or more messages.
                        Queue messageQueue = new Queue();

                        // Add our message to the Queue
                        messageQueue.Enqueue(sMessage);

                        // Add our message queue to the hash table. Use our page reference
                        // (IHttpHandler) as the key.
                        m_executingPages.Add(HttpContext.Current.Handler, messageQueue);

                        // Wire up Unload event so that we can inject 
                        // some JavaScript for the alerts.
                        executingPage.Unload += new EventHandler(ExecutingPage_Unload);
                    }
                }
                else
                {
                    // If were here then the method has allready been 
                    // called from the executing Page.
                    // We have allready created a message queue and stored a
                    // reference to it in our hastable. 
                    Queue queue = (Queue)m_executingPages[HttpContext.Current.Handler];

                    // Add our message to the Queue
                    queue.Enqueue(sMessage);
                }
            }


            // Our page has finished rendering so lets output the
            // JavaScript to produce the alert's
            private static void ExecutingPage_Unload(object sender, EventArgs e)
            {
                // Get our message queue from the hashtable
                Queue queue = (Queue)m_executingPages[HttpContext.Current.Handler];

                if (queue != null)
                {
                    StringBuilder sb = new StringBuilder();

                    // How many messages have been registered?
                    int iMsgCount = queue.Count;

                    // Use StringBuilder to build up our client slide JavaScript.
                    sb.Append("<script language='javascript'>");

                    // Loop round registered messages
                    string sMsg;
                    while (iMsgCount-- > 0)
                    {
                        sMsg = (string)queue.Dequeue();
                        sMsg = sMsg.Replace("\n", "\\n");
                        sMsg = sMsg.Replace("\"", "'");
                        sb.Append(@"alert( """ + sMsg + @""" );");
                    }

                    // Close our JS
                    sb.Append(@"</script>");

                    // Were done, so remove our page reference from the hashtable
                    m_executingPages.Remove(HttpContext.Current.Handler);

                    // Write the JavaScript to the end of the response stream.
                    HttpContext.Current.Response.Write(sb.ToString());
                }
            }
        }
        protected void DisplayDoc_Button_Click(object sender, EventArgs e)
        {
            if (theFrameHolder.Visible)
            {
                theFrameHolder.Visible = false;
                DisplayDoc_Button.Text = "Display Document";
            }
            else
            {
                theFrameHolder.Visible = true;
                DisplayDoc_Button.Text = "Hide Document";
            }
        }


        protected void SaveLocal_Button_Click(object sender, EventArgs e)
        {
            if (Request.Params["DocVersID"] != null)
            {

                //Response.TransmitFile("\\autism-fs01\d$\WebDocs\DocVersID_" + DocVersID + ViewState["fileext"].ToString());
                String serverfilenameandpath = (@"\\autism-fs01\d$\WebDocs\DocVersID_" + Request.Params["DocVersID"] + ViewState["fileext"].ToString());
                String localfilename = "DocVersID_" + Request.Params["DocVersID"] + ViewState["fileext"].ToString();

                try
                {
                    Response.TransmitFile(serverfilenameandpath);
                    Response.AppendHeader("Content-Disposition", "attachment; filename=" + localfilename);
                    Response.End();
                }
                catch (Exception ex)
                {
                    //  ((Label)FormView1.Row.Cells[0].FindControl("FileUploadLabel1")).Text = "File could not be uploaded.";
                    MessageBox2.Show("ERROR: File could not be saved. (" + ex.Message + ")");
                }
            }
        }


        protected void FormView1_ModeChanged(object sender, EventArgs e)
        {

        }
        protected void SQL_Doc_info_Inserting(object sender, SqlDataSourceCommandEventArgs e)
        {
            DbParameterCollection parameters_ins = e.Command.Parameters;
        }



        protected void SQL_Doc_info_Updating(object sender, SqlDataSourceCommandEventArgs e)
        {
            DbParameterCollection parameters = e.Command.Parameters;
        }



        protected void GridView2_SelectedIndexChanged(object sender, EventArgs e)
        {
        }
        protected void FormView1_ItemUpdated(object sender, FormViewUpdatedEventArgs e)
        {
            GridView1.DataBind();
        }
        protected void FormView1_ItemInserted(object sender, FormViewInsertedEventArgs e)
        {
            GridView1.DataBind();
        }


        protected void ReplaceDoc(object sender, EventArgs e)
        {

        }
}

}


