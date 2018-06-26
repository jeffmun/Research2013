using System;
using System.Data;
using System.Data.Common;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Text;


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

            
            try {
                frame1.Attributes["src"] = ((Label)this.FormView1.FindControl("DocLinkLabel")).Text;
            }
            catch(Exception )
            {
                if (ViewState["doclink"] != null)
                    {frame1.Attributes["src"] = ViewState["doclink"].ToString();}
                else 
                    {frame1.Attributes["src"] = "";}
            }


            frame1.Attributes["style"] = "width:100%; height:800px";
            frame1.Attributes["frameborder"] = "1";
            frame1.Attributes["scrolling"] = "auto";

            theFrameHolder.Controls.Add(frame1);

            Label_Error.Text = "";
        }
        else
        {
            Label_Error.Text = "ERROR: Value for DocVersID parameter was not provided in the query string.";
        }
    }


    protected void FormView1_Insert(object sender, EventArgs e)
     {    }

    protected void UploadButton_Click(object sender, EventArgs e)
    {
        FileUpload FileUpload1 = (FileUpload)this.FormView1.FindControl("FileUpload1");
        Label FileUploadLabel1 = (Label)this.FormView1.FindControl("FileUploadLabel1");
        Label FileExtLabel1 =  (Label)this.FormView1.FindControl("FileExtLabel1");
        Label NextDocVersIDLabel = (Label)this.FormView2.FindControl("NextDocVersIDLabel");

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
                { ".doc", ".pdf", ".txt", ".xls", ".gif", ".png", ".jpeg", ".jpg" };
            for (int i = 0; i < allowedExtensions.Length; i++)
            {
                if (fileExtension == allowedExtensions[i])
                    {fileOK = true;}
            }


            if (fileOK)
            {
                try
                {
                     
                     ((Label)FormView1.FindControl("FileExtLabel1")).Text = fileExtension;
                     //((Label)FormView1.Row.Cells[0].FindControl("FileUploadLabel1")).Text = FileUpload1.FileName;


                    FileUpload1.PostedFile.SaveAs(path + "DocVersID_" + NextDocVersID + fileExtension);

                    MessageBox.Show("File uploaded.");

                    //((Label)FormView1.Row.Cells[0].FindControl("FileUploadLabel1")).Text = "File uploaded.";
                    //FileUploadLabel1.Text = "File uploaded!";

                


                }
                catch (Exception )
                {
                  //  ((Label)FormView1.Row.Cells[0].FindControl("FileUploadLabel1")).Text = "File could not be uploaded.";
                    MessageBox.Show("ERROR: File could not be uploaded.");

                    //FileUploadLabel1.Text = "File could not be uploaded.";
                    //FileUploadLabel1.Visible = true;
                }
            }
            else
            {
                MessageBox.Show("Cannot accept files of this type.");

                //((Label)FormView1.Row.Cells[0].FindControl("FileUploadLabel1")).Text = "Cannot accept files of this type.";
                //FileUploadLabel1.Text = "Cannot accept files of this type.";
            }


        }
    }

    protected void FormView1_ModeChanging(object sender, FormViewModeEventArgs e)
    {
       // ViewState["docid"] = ((DataRowView)FormView1.DataItem)["DocID"].ToString();
      
        
        //if (FormView1.CurrentMode == FormViewMode.Insert)
        //{
        //    theFrameHolder.Visible = false;
        //    DisplayDoc_Button.Visible = false;
        //    //((Label)FormView1.Row.Cells[0].FindControl("DocLinkLabel")).Text = ViewState["doclink"].ToString();
        //}
        //else
        //{
        //    theFrameHolder.Visible = true;
        //    DisplayDoc_Button.Text = "Display Document";
        //    DisplayDoc_Button.Visible = true;
        //}

    }
    protected void Button1_Click(object sender, EventArgs e)
    {

    }
    protected void FormView1_DataBound(object sender, EventArgs e)
    {

        if (FormView1.CurrentMode == FormViewMode.Insert)
        {
            ((Label)FormView1.Row.Cells[0].FindControl("DocIDTextBox_Insert")).Text = ViewState["docid"].ToString();
            ((Label)FormView1.Row.Cells[0].FindControl("DocTitleTextBox_Insert")).Text = ViewState["doctitle"].ToString();
            ((Label)FormView1.Row.Cells[0].FindControl("DocStatusTextBox_Insert")).Text = ViewState["docstatus"].ToString();
            ((Label)FormView1.Row.Cells[0].FindControl("DocTypeTextBox_Insert")).Text = ViewState["doctype"].ToString();

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
            }

           // ViewState["docid"] = ((Label)FormView1.FindControl("DocIDLabel")).Text.ToString();
        }

    }



    protected void FormView1_ItemInserting(object sender, FormViewInsertEventArgs e)
    {
        int z = 1;
        // DbParameter param 
    }


    public class MessageBox
    {
        private static Hashtable m_executingPages = new Hashtable();

        private MessageBox() { }

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
        { theFrameHolder.Visible = false;
        DisplayDoc_Button.Text = "Display Document";
    }
        else
        { theFrameHolder.Visible = true;
        DisplayDoc_Button.Text = "Hide Document";
    }
    }
    protected void FormView1_ModeChanged(object sender, EventArgs e)
    {

    }
    protected void SQL_Doc_info_Inserting(object sender, SqlDataSourceCommandEventArgs e)
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
  
}




