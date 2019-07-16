using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DevExpress.Office.API;
using uwac;


public partial class Library_Doc : BasePage
{


	protected void Page_Load(object sender, EventArgs e)
	{

		if (!IsPostBack)
		{
			richeditDoc.WorkDirectory = Server.MapPath("~/webdocs/");

			if (Request.QueryString["dvID"] != null)
			{
				int docversID = Convert.ToInt32(Request.QueryString["dvID"]);

				if (docversID > 0)
				{
					bool isLoaded = LoadDoc(docversID);

					//richeditDoc.Visible = isLoaded;
					lblLoadError.Visible = !isLoaded;


				}
			}
			else
			{
				//richeditDoc.Visible = false;
			}
		}

		//if (!IsPostBack)
		//{
		//	DemoRichEdit.WorkDirectory = DirectoryManagmentUtils.DocumentBrowsingFolderPath;
		//	DemoRichEdit.SettingsDocumentSelector.UploadSettings.Enabled = !Utils.IsSiteMode;
		//}
		//if (DemoRichEdit.WorkDirectory != DirectoryManagmentUtils.DocumentBrowsingFolderPath) DirectoryManagmentUtils.AssertTimeout();
	}
	protected bool LoadDoc(int docversID)
	{
		try
		{
			SQL_utils sql = new SQL_utils("backend");
			string fileext = sql.StringScalar_from_SQLstring("Select fileext from tbldocvers where docversID=" + docversID.ToString());
			string file = Server.MapPath(String.Format("~/webdocs/DocVersID_{0}{1}", docversID, fileext));

			Spreadsheet.Visible = false;
			richeditDoc.Visible = false;

			if (fileext == ".doc")
			{
				richeditDoc.Open(file, DevExpress.XtraRichEdit.DocumentFormat.Doc);
				richeditDoc.Visible = true;
			}
			else if (fileext == ".txt")
			{
				richeditDoc.Open(file, DevExpress.XtraRichEdit.DocumentFormat.PlainText);
				richeditDoc.Visible = true;
			}
			else if (fileext == ".docx")
			{
				richeditDoc.Open(file, DevExpress.XtraRichEdit.DocumentFormat.OpenXml);
				richeditDoc.Visible = true;
			}
			else if (fileext == ".pdf")
			{

				Response.ContentType = "application/pdf";
				Response.WriteFile(file);
				Response.End();
			}
			else if (fileext == ".xlsx")
			{
				Spreadsheet.Open(file, DevExpress.Spreadsheet.DocumentFormat.Xlsx);
				Spreadsheet.Visible = true;
			}
			else if (fileext == ".xls")
			{
				Spreadsheet.Open(file, DevExpress.Spreadsheet.DocumentFormat.Xls);
				Spreadsheet.Visible = true;
			}
			else if (fileext == ".pptx")
			{

				Response.ContentType = "application/vnd.openxmlformats-officedocument.presentationml.presentation";
				Response.WriteFile(file);
				Response.End();
			}
			//else
			//{
			//	richeditDoc.Open(file);
			//}
			sql.Close();
			return true;
		}
		catch (Exception ex)
		{
			return false;
		}
	}

	protected void Page_Init(object sender, EventArgs e)
	{
		//DemoHelper.Instance.ControlAreaMaxWidth = Unit.Percentage(100);
	}

}

#region old
//public partial class Library_Doc : BasePage
//{


//	protected void Page_Load(object sender, EventArgs e)
//	{

//		if (!IsPostBack)
//		{
//			richeditDoc.WorkDirectory = Server.MapPath("~/webdocs/");

//			if (Request.QueryString["dvID"] != null)
//			{
//				int docversID = Convert.ToInt32(Request.QueryString["dvID"]);

//				if (docversID > 0)
//				{
//					bool isLoaded = LoadDoc(docversID);

//					richeditDoc.Visible = isLoaded;
//					lblLoadError.Visible = !isLoaded;


//				}
//			}
//			else{
//				//richeditDoc.Visible = false;
//			}
//		}

//		//if (!IsPostBack)
//		//{
//		//	DemoRichEdit.WorkDirectory = DirectoryManagmentUtils.DocumentBrowsingFolderPath;
//		//	DemoRichEdit.SettingsDocumentSelector.UploadSettings.Enabled = !Utils.IsSiteMode;
//		//}
//		//if (DemoRichEdit.WorkDirectory != DirectoryManagmentUtils.DocumentBrowsingFolderPath) DirectoryManagmentUtils.AssertTimeout();
//	}
//	protected bool LoadDoc(int docversID)
//	{
//		try
//		{
//			SQL_utils sql = new SQL_utils("backend");
//			string fileext = sql.StringScalar_from_SQLstring("Select fileext from tbldocvers where docversID=" + docversID.ToString());
//			string file = Server.MapPath(String.Format("~/webdocs/DocVersID{0}{1}", docversID, fileext));

//			if(fileext == ".doc" )
//			{
//				richeditDoc.Open(file, DevExpress.XtraRichEdit.DocumentFormat.Doc);
//			}
//			else if (fileext == ".txt")
//			{
//				richeditDoc.Open(file, DevExpress.XtraRichEdit.DocumentFormat.PlainText);
//			}
//			else if (fileext == ".docx")
//			{

//				richeditDoc.Open(file, DevExpress.XtraRichEdit.DocumentFormat.OpenXml);
//			}
//			else if (fileext == ".pdf")
//			{

//				Response.ContentType = "application/pdf";
//				Response.WriteFile(file);
//				Response.End();
//			}
//			else
//			{
//				richeditDoc.Open(file);
//			}
//			sql.Close();
//			return true;
//		}
//		catch (Exception ex)
//		{
//			return false;
//		}
//	}

//	protected void Page_Init(object sender, EventArgs e)
//	{
//		//DemoHelper.Instance.ControlAreaMaxWidth = Unit.Percentage(100);
//	}

//}
#endregion