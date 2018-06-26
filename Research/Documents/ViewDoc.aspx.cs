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
using uwac;
//using Gnostice.Core;
//using Gnostice.Documents;

public partial class Documents_ViewDoc : System.Web.UI.Page
{

	private SqlConnection oConn = new SqlConnection();
	private ReadConfig oConfig = new ReadConfig();

	protected System.Web.UI.HtmlControls.HtmlControl frame1;

	public String[] allowedExtensions = { ".docx", ".xlsx", ".pptx", ".doc", ".xls", ".ppt", ".pdf", ".rtf" , ".txt", ".csv", 
											 ".wmv", ".mp3", ".wav", ".avi", ".mov", ".mpeg", ".mpg",  ".gif", ".png", ".jpeg", ".jpg", ".bmp", 
											 ".sps", ".sav", ".spo", ".R", ".Rmd", ".Rdata", ".Rnw", ".zip"};


	protected void Page_Init(object sender, EventArgs e)
	{
	}

	protected void Page_PreRender(Object o, EventArgs e)
	{
		if (Request.Params["DocVersID"] != null)
		{
			if (!IsPostBack) LoadDoc();
			//LoadDoc();

		}
		else
		{
			Label_Error.Text = "ERROR: Value for DocVersID parameter was not provided.";
			//this should be provided in the query string
		}

	}


	protected void Page_Load(object sender, EventArgs e)
	{
		//Gnostice.Documents.Framework.ActivateLicense("EA5C-F03E-2C86-3193-B918-C0A2-EEC4-D2D4-13EF-101D-E879-7B97");

		oConn.ConnectionString = ConfigurationManager.ConnectionStrings["TRACKING_CONN_STRING"].ToString();
		oConn.Open();

		DisplayDoc_Button.Text = "Hide Document";
		DisplayDoc_Button.Visible = false;
	}


	protected void LoadDoc()
	{
		theFrameHolder.Controls.Clear();

		Literal frame1 = new Literal();

		//// NEED TO TRAP WHEN AN INCORRECT DocVersID IS RECEIVED 

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
				string x = ex.Message;
				try
				{ dv_title = ViewState["doctitle"].ToString(); }
				catch (Exception ex2)
				{ dv_title = "";
					string x2 = ex2.Message;
				}
			}

			title.Text = "(#" + Request.Params["DocVersID"] + ") " + dv_title;

			//ReadOnly or Itemtemplate mode
			DisplayDoc_Button.Visible = false;


			SqlCommand cmd = new SqlCommand();
			cmd.CommandType = CommandType.StoredProcedure;
			cmd.CommandText = "spGet_FileExt_for_DocVersID";
			cmd.Connection = oConn;
			if (oConn.State == ConnectionState.Closed) oConn.Open();

			cmd.Parameters.Add("@docversID", SqlDbType.Int);
			cmd.Parameters["@docversID"].Direction = ParameterDirection.Input;
			cmd.Parameters["@docversID"].Value = Convert.ToInt32(Request.Params["DocVersID"]);

			cmd.Parameters.Add("@ext", SqlDbType.VarChar, 20);
			cmd.Parameters["@ext"].Direction = ParameterDirection.Output;
			cmd.Parameters["@ext"].Value = "";

			cmd.ExecuteNonQuery();


			string fileext_output = cmd.Parameters["@ext"].Value.ToString();

			//jmInfo.Text = cmd.Parameters["@ext"].Value.ToString();

			if (fileext_output.ToLower() == ".jpg" ||
				fileext_output.ToLower() == ".jpeg" ||
			   fileext_output.ToLower() == ".png" ||
			   fileext_output.ToLower() == ".bmp" ||
			   fileext_output.ToLower() == ".gif" ||
			   fileext_output.ToLower() == ".txt" ||
			   fileext_output.ToLower() == ".pdf" ||
			   fileext_output.ToLower() == ".R"  
				)
			{

				try
				{

					string txt = "https://shs1.autism.washington.edu" + Request.ApplicationPath.ToString() + ((Label)this.FormView1.FindControl("DocLinkLabel")).Text;

					string fullfilename = HttpContext.Current.Server.MapPath( ViewState["doclink"].ToString());
					//string fullfilename = HttpContext.Current.Server.MapPath("~/webdocs/" + ViewState["doclink"].ToString());

					lblFilePath.Text = fullfilename;
					frame1.Text = "<embed src=\"" + fullfilename + "\" width=\"990\" height=\"800\">"; // "<embed src=\"" + ((Label)this.FormView1.FindControl("DocLinkLabel")).Text + "\" width=\"990\" height=\"800\">";
					//frame1.Attributes["src"] = ((Label)this.FormView1.FindControl("DocLinkLabel")).Text;
				}
				catch (Exception ex)
				{
					string x = ex.Message;
					if (ViewState["doclink"] != null)
					{
						frame1.Text = "<embed src=\"" + ViewState["doclink"].ToString() + "\" width=\"990\" height=\"800\">";
						//frame1.Attributes["src"] = ViewState["doclink"].ToString(); 
					}
					else
					{
						frame1.Text = "PDF here.";
						//frame1.Attributes["src"] = ""; 
					}
				}


				//frame1.Attributes["style"] = "width:100%; height:800px";
				//frame1.Attributes["frameborder"] = "1";
				//frame1.Attributes["scrolling"] = "auto";
				//frame1.Attributes["align"] = "top";

				theFrameHolder.Controls.Add(frame1);

				Label_Error.Text = "";
			}

		   
			else
			{
				Label_Error.Text = "This is a " + fileext_output + " document that cannot be opened in a browser.<br/>Your browser may prompt you to save the file locally before opening it.";

				//linkDownloadFile.Visible = true;
				//linkDownloadFile.NavigateUrl = ViewState["doclink"].ToString();

				//Label_Error.Text = "Not a supported filetype: " + fileext_output;
			}


			Button btnDownloadFile = (Button)FormView1.FindControlRecursive("btnDownloadFile");

			btnDownloadFile.Visible = true;
			btnDownloadFile.Text = "Download " + ViewState["doclink"].ToString().Replace("/webdocs/", "");
			btnDownloadFile.CommandArgument = ViewState["doclink"].ToString();

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








	protected void FormView1_Insert(object sender, EventArgs e)
	{ }




	protected void UploadButton_Click(object sender, EventArgs e)
	{
		FileUpload FileUpload1 = (FileUpload)this.FormView1.FindControl("FileUpload1");
		Label FileUploadLabel1 = (Label)this.FormView1.FindControl("FileUploadLabel1");
		//Label FileExtLabel1 = (Label)this.FormView1.FindControl("FileExtTextBox_Insert");
		Label NextDocVersIDLabel = (Label)this.FormView2.FindControl("NextDocVersIDLabel");
		//int New_or_Replace = this.FormView1.FindControl("RadioButtonList1");

		string path = ConfigurationManager.AppSettings["DOCUMENT_LOCATION"];

		//string path = @"\\autism-fs01\d$\WebDocs\";
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
			for (int i = 0; i < allowedExtensions.Length; i++)
			{
				if (fileExtension == allowedExtensions[i]) { fileOK = true; }
			}

			if (fileOK)
			{
				try
				{
					((Label)FormView1.FindControl("FileExtTextBox_Insert")).Text = fileExtension;
					//((Label)FormView1.Row.Cells[0].FindControl("FileUploadLabel1")).Text = FileUpload1.FileName;


					//FileUpload_Doc.PostedFile.SaveAs(sFilePath);
					string myfilepath = Server.MapPath("~/webdocs/") ;

					FileUpload1.PostedFile.SaveAs(myfilepath + "DocVersID_" + NextDocVersID + fileExtension);
					//MessageBox2.Show("File uploaded.");
				}
				catch (Exception ex)
				{
					//  ((Label)FormView1.Row.Cells[0].FindControl("FileUploadLabel1")).Text = "File could not be uploaded.";
					jmError.Text = "ERROR: File could not be uploaded. <br/>" + ex.Message;
				}
			}
			else
			{
				// MessageBox2.Show("Cannot accept files of this type.");
			}
		}
	}

	protected void EditDocumentInfo_Cancel(object sender, EventArgs e)
	{
		//LoadDoc();
		Response.Redirect(this.Request.Url.ToString());

	}


	protected void EditDocumentInfo_Submit(object sender, EventArgs e)
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

		//string path = ConfigurationManager.AppSettings["DOCUMENT_LOCATION"];
		//string path_replace = path + @"ReplacedDocs\";

		string path = Server.MapPath("~/webdocs/");
		string path_replace = path + "/ReplacedDocs/";


		
		bool fileOK;

		fileOK = false;
		// Before attempting to perform operations
		// on the file, verify that the FileUpload 
		// control contains a file.
		if (FileUpload2.HasFile)
		{
			Label DocVersIDLabel_Edit = (Label)FormView1.FindControl("DocVersIDLabel_Edit");

			String DocVersID = DocVersIDLabel_Edit.Text;
			String filePath = System.IO.Path.GetFullPath(FileUpload2.FileName);
			String fileExtension =
				System.IO.Path.GetExtension(FileUpload2.FileName).ToLower();
			//String[] allowedExtensions = { ".docx", ".xlsx", ".pptx", ".ppt", ".doc", ".pdf", ".txt", ".xls", ".gif", ".png", ".jpeg", ".jpg", ".bmp", ".sps", ".sav", ".spo", ".rtf" };
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
					string oldfilename = path + "DocVersID_" + DocVersID + ViewState["fileext"].ToString();
					string newfilename = path_replace + "DocVersID_" + DocVersID + "__" +
						DateTime.Now.Year.ToString() + "_" + DateTime.Now.Month.ToString() + "_" + DateTime.Now.Day.ToString() + "__" +
						DateTime.Now.Hour.ToString() + "hrs" + DateTime.Now.Minute.ToString() + "mins" + ViewState["fileext"].ToString();
					//string oldfilename = @"\\autism-fs01\d$\WebDocs\DocVersID_" + DocVersID + ViewState["fileext"].ToString();
					//string newfilename = @"\\autism-fs01\d$\WebDocs\ReplacedDocs\DocVersID_" + DocVersID + "__" +
					//    DateTime.Now.Year.ToString() + "_" + DateTime.Now.Month.ToString() + "_" + DateTime.Now.Day.ToString() + "__" +
					//    DateTime.Now.Hour.ToString() + "hrs" + DateTime.Now.Minute.ToString() + "mins" + ViewState["fileext"].ToString();
					File.Copy(oldfilename, newfilename);

					File.Delete(oldfilename);

					FileUpload2.PostedFile.SaveAs(path + "DocVersID_" + DocVersID + fileExtension);
					MessageBox2.Show("File copied.");

					//jmError.Text = oldfilename + "   " + newfilename;
				}
				catch (Exception ex)
				{
					//  ((Label)FormView1.Row.Cells[0].FindControl("FileUploadLabel1")).Text = "File could not be uploaded.";
					jmError.Text = "ERROR: File could not be uploaded. (" + ex.Message + ")";
				}

				//HtmlControl frame1 = (HtmlControl)theFrameHolder.FindControl("frame1");
				//frame1.Attributes["src"] = "";

				//LoadDoc();

			}
			else
			{
				// MessageBox2.Show("Cannot accept files of this type.");
			}
		}

	}


	protected void FormView1_ModeChanging(object sender, FormViewModeEventArgs e)
	{
	}


	protected void FormView1_DataBound(object sender, EventArgs e)
	{

		if (FormView1.CurrentMode == FormViewMode.Insert)
		{
			//populate the controls with the info needed for the Insert in SQL
			((Label)FormView1.Row.Cells[0].FindControl("DocIDTextBox_Insert")).Text = ViewState["docid"].ToString();
			((Label)FormView1.Row.Cells[0].FindControl("DocDescLabel_Insert")).Text = ViewState["docdesc"].ToString();
			((Label)FormView1.Row.Cells[0].FindControl("DocTitleLabel_Insert")).Text = ViewState["doctitle"].ToString();
			((Label)FormView1.Row.Cells[0].FindControl("DocStatusLabel_Insert")).Text = ViewState["docstatus"].ToString();
			((Label)FormView1.Row.Cells[0].FindControl("DocTypeLabel_Insert")).Text = ViewState["doctype"].ToString();
			((Label)FormView1.Row.Cells[0].FindControl("FileExtTextBox_Insert")).Text = ViewState["fileext"].ToString();


		}

		else
		{

			if (FormView1.DataItem != null)
			{
				ViewState["docid"] = ((DataRowView)FormView1.DataItem)["DocID"].ToString();
				ViewState["doctitle"] = ((DataRowView)FormView1.DataItem)["DocTitle"].ToString();
				ViewState["docstatus"] = ((DataRowView)FormView1.DataItem)["DocStatus"].ToString();
				ViewState["docdesc"] = ((DataRowView)FormView1.DataItem)["DocDesc"].ToString();
				ViewState["changesdesc"] = ((DataRowView)FormView1.DataItem)["ChangesDesc"].ToString();
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
		//jmInfo.Text = "Save click";

		if (Request.Params["DocVersID"] != null)
		{

			//Response.TransmitFile("\\autism-fs01\d$\WebDocs\DocVersID_" + DocVersID + ViewState["fileext"].ToString());



			String serverfilenameandpath = (@"\\autism-fs01\d$\WebDocs\DocVersID_" + Request.Params["DocVersID"] + ViewState["fileext"].ToString());
			String localfilename = "DocVersID_" + Request.Params["DocVersID"] + ViewState["fileext"].ToString();

			string contenttype = "application/octet-stream";
			bool xtype = false;

			switch (ViewState["fileext"].ToString())
			{
				case ".zip":
					contenttype = "application/x-zip-compressed";
					break;
				case ".doc":
					contenttype = "application/msword";
					break;
				case ".xls":
					contenttype = "application/msexcel";
					break;
				case ".docx":
					contenttype = "application/vnd.openxmlformats-officedocument.wordprocessingml.document";
					xtype = true;
					break;
				case ".xlsx":
					contenttype = "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet";
					xtype = true;
					break;
				case ".pptx":
					contenttype = "application/vnd.openxmlformats-officedocument.presentationml.presentation";
					xtype = true;
					break;


			}

			if (xtype)
			{
				//try
				//{
				//    //string filePath = Server.MapPath("File/Test.docx"); // Specify the location of the .docx file
				using (FileStream fileStream = File.OpenRead(serverfilenameandpath))
				{
					MemoryStream memStream = new MemoryStream();
					memStream.SetLength(fileStream.Length);
					fileStream.Read(memStream.GetBuffer(), 0, (int)fileStream.Length);

					Response.Clear();
					Response.ContentType = "application/vnd.openxmlformats-officedocument.wordprocessingml.document";
					Response.AddHeader("Content-Disposition", "attachment; filename=" + localfilename);
					Response.BinaryWrite(memStream.ToArray());
					Response.Flush();
					Response.Close();
					Response.End();
				}
				//}
				//catch (Exception exc1)
				//{
				//}
			}
			else
			{
				try
				{
					Response.Clear();
					Response.ContentType = contenttype;
					Response.AppendHeader("Content-Disposition", "attachment; filename=" + localfilename);
					Response.WriteFile(serverfilenameandpath);
					Response.End();
					Response.Flush();
				}
				catch (Exception ex)
				{
					jmInfo.Text = ex.Message;
					//  ((Label)FormView1.Row.Cells[0].FindControl("FileUploadLabel1")).Text = "File could not be uploaded.";
					//MessageBox2.Show("ERROR: File could not be saved. (" + ex.Message + ")");
				}
			}
		}
	}

	protected void Show_Confrim_Panel(object sender, EventArgs e)
	{
		UpdatePanel p = (UpdatePanel)FormView1.FindControl("UpdatePanel_ConfirmDelete");
		p.Visible = true;
		p.Update();
	}


	protected void FormView1_ItemDeleted(object sender, EventArgs e)
	{
		UpdatePanel p = (UpdatePanel)FormView1.FindControl("UpdatePanel_ConfirmDelete");
		p.Visible = false;
		p.Update();

		SQL_utils sql = new SQL_utils("backend");

		int prev_docversID = sql.IntScalar_from_SQLstring("select max(docversID) from tblDocVers where docID = " +
				" (select docID from tbl_deleted_from_web_docvers where docversID=" + Request.QueryString["DocVersID"] + ")");

		sql.Close();

		Response.Redirect(this.Request.Url.ToString().Replace(Request.QueryString["DocVersID"], prev_docversID.ToString()));

	}

	protected void CancelDelete_Click(object sender, EventArgs e)
	{
		UpdatePanel p = (UpdatePanel)FormView1.FindControl("UpdatePanel_ConfirmDelete");
		p.Visible = false;
		p.Update();

		Response.Redirect(this.Request.Url.ToString());

	}


	protected void FormView1_ModeChanged(object sender, EventArgs e)
	{

	}
	protected void SQL_Doc_info_Inserting(object sender, SqlDataSourceCommandEventArgs e)
	{
		try
		{
			DbParameterCollection parameters_ins = e.Command.Parameters;

			//was used to check why too many parameters were being sent - cause was too many controls using the "Bind" method in the InsertTemplate
			//foreach (DbParameter p in parameters_ins)
			//{
			//    jmInfo.Text += p.ParameterName;
			//}
		}
		catch (Exception exc) 
		{
			jmError.Text = exc.Message;
		}

	}



	protected void SQL_Doc_info_Updating(object sender, SqlDataSourceCommandEventArgs e)
	{
		DbParameterCollection parameters = e.Command.Parameters;




	}

	protected void SQL_Doc_info_Updated(object sender, SqlDataSourceStatusEventArgs e)
	{
		Response.Redirect(this.Request.Url.ToString());
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




	protected void btnDownloadFile_Command(object sender, CommandEventArgs e)
	{
		if(e.CommandName=="DownloadFile")
		{
			string filename = e.CommandArgument.ToString();
			filename = filename.Replace("/webdocs/", "");

			string fullfilename = HttpContext.Current.Server.MapPath("~/webdocs/" + filename);

			if (File.Exists(HttpContext.Current.Server.MapPath("~/webdocs/" + filename)))
			{
				DownloadWebdoc(filename);
			}
			else
			{
				string result = "Sorry, the file [" + filename + "] was not found.";
				ClientScript.RegisterStartupScript(GetType(), "alert", "alert('" + result + "');", true);
			}
		}
	}

	protected string DownloadWebdoc(string filename)
	{

		string result = "";

		try
		{
			Response.Redirect("~/Documents/WebdocFileHandler.ashx?file=" + filename);
			result = "success";
		}
		catch (Exception) 
		{
			//lblInfo.Text += "#ERROR in DownloadFile: " + exc.Message;
			result = "error";
		}


		return result;
	}

}






