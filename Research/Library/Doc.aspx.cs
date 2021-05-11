using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using DevExpress.Office.API;
using uwac;
using DevExpress.Web;
using DevExpress.Compression;
using System.Data;
using DevExpress.Web.ASPxHtmlEditor;
using System.Data.SqlClient;

public partial class Library_Doc : BasePage
{


	protected void Page_Load(object sender, EventArgs e)
	{

		List<string> ok_to_delete = new List<string>() { "NETID\\jeffmun", "NETID\\adamsk" };

		string user = Master.Master_netid;
		string user2 = this.User.Identity.Name;
		var machine = HttpContext.Current.Server.MachineName.ToString();


		if (ok_to_delete.Contains(user2) | machine == "JEFFHOMEPC2020")
		{
			btnDelete.Visible = true;
		}


		Debug.WriteLine(String.Format("IsCallback {0}   IsPostback {1}", IsCallback, IsPostBack));

		if (!IsPostBack)
		{


			dxricheditDoc.WorkDirectory = Server.MapPath("~/webdocs/");

			if (Request.QueryString["dvID"] != null)
			{
				int docversID = Convert.ToInt32(Request.QueryString["dvID"]);

				if (docversID > 0)
				{
					bool isLoaded = LoadDoc(docversID);

					//richeditDoc.Visible = isLoaded;
					lblLoadError.Visible = !isLoaded;

					//// now we display the splitter even if the file can't be found
					//if(!isLoaded)
					//{
					//	Splitter1.Visible = false;
					//}

					SQL_utils sql = new SQL_utils("backend");

					ASPxHtmlEditor htmledit_docdesc = (ASPxHtmlEditor)this.FindControlRecursive("htmledit_docdesc");

					if (htmledit_docdesc != null)
					{
						string docdesc = sql.StringScalar_from_SQLstring(String.Format("select docdesc from tblDoc where docid=(select docid from tblDocvers where docversid={0})", docversID));
						htmledit_docdesc.Html = docdesc;
						htmledit_docdesc.ActiveView = HtmlEditorView.Preview;
					}
					sql.Close();

				}
			}
			else
			{
				//richeditDoc.Visible = false;
			}
		}
		else
		{

			if (Session["zip_contents"] != null)
			{
				gvZip.DataSource = (DataTable)Session["zip_contents"];
			}
		}
	}

	protected bool LoadDoc(int docversID)
	{
		try
		{
			SQL_utils sql = new SQL_utils("backend");
			string fileext = sql.StringScalar_from_SQLstring("Select fileext from tbldocvers where docversID=" + docversID.ToString());
			string file = Server.MapPath(String.Format("~/webdocs/DocVersID_{0}{1}", docversID, fileext));
			string relative_file = String.Format("~/webdocs/DocVersID_{0}{1}", docversID, fileext);

			bool fileexists = File.Exists(file);

			dxSpreadsheet.Visible = false;
			dxricheditDoc.Visible = false;
			dxImage.Visible = false;
			gvZip.Visible = false;

			if (fileexists)
			{

				if (fileext.ToLower() == ".doc")
				{
					dxricheditDoc.Open(file, DevExpress.XtraRichEdit.DocumentFormat.Doc);
					dxricheditDoc.Visible = true;
				}
				else if (fileext.ToLower() == ".txt")
				{
					dxricheditDoc.Open(file, DevExpress.XtraRichEdit.DocumentFormat.PlainText);
					dxricheditDoc.Visible = true;
				}
				else if (fileext.ToLower() == ".docx")
				{
					dxricheditDoc.Open(file, DevExpress.XtraRichEdit.DocumentFormat.OpenXml);
					dxricheditDoc.Visible = true;
				}
				else if (fileext.ToLower() == ".jpg")
				{
					dxImage.ImageUrl = relative_file;
					dxImage.Visible = true;
					//Response.ContentType = "image/jpeg";
					//Response.WriteFile(file);
					//Response.End();
				}
				else if (fileext.ToLower() == ".png")
				{
					dxImage.ImageUrl = relative_file;
					dxImage.Visible = true;
					//Response.ContentType = "image/png";
					//Response.WriteFile(file);
					//Response.End();
				}
				else if (fileext.ToLower() == ".pdf")
				{

					Splitter1.GetPaneByName("ContentUrlPane").ContentUrl = relative_file;

				}
				else if (fileext.ToLower() == ".xlsx")
				{
					dxSpreadsheet.Open(file, DevExpress.Spreadsheet.DocumentFormat.Xlsx);
					dxSpreadsheet.Visible = true;
				}
				else if (fileext.ToLower() == ".xls")
				{
					dxSpreadsheet.Open(file, DevExpress.Spreadsheet.DocumentFormat.Xls);
					dxSpreadsheet.Visible = true;
				}
				else if (fileext.ToLower() == ".csv")
				{
					dxSpreadsheet.Open(file, DevExpress.Spreadsheet.DocumentFormat.Csv);
					dxSpreadsheet.Visible = true;
				}
				else if (fileext.ToLower() == ".pptx")
				{

					Response.ContentType = "application/vnd.openxmlformats-officedocument.presentationml.presentation";
					Response.WriteFile(file);
					Response.End();
				}
				else if (fileext.ToLower() == ".zip")
				{


					DataTable dt = new DataTable();
					DataColumn c0 = new DataColumn("index", typeof(int));
					DataColumn c1 = new DataColumn("type", typeof(string));
					DataColumn c2 = new DataColumn("name", typeof(string));
					DataColumn c3 = new DataColumn("uncompressed_size", typeof(int));
					dt.Columns.Add(c0);
					dt.Columns.Add(c1);
					dt.Columns.Add(c2);
					dt.Columns.Add(c3);

					string items = "";
					using (ZipArchive zip = ZipArchive.Read(file))
					{
						int counter = 0;
						foreach (ZipItem item in zip)
						{
							counter++;
							DataRow row = dt.NewRow();
							row["index"] = counter;
							row["type"] = item.Attributes;
							row["name"] = item.Name;
							row["uncompressed_size"] = item.UncompressedSize;
							string itm = String.Format("{0} {1} {2}", item.Attributes, item.Name, item.UncompressedSize);
							Debug.WriteLine(itm);
							items += itm + "<br/>";

							dt.Rows.Add(row);
						}
					}

					Session["zip_contents"] = dt;
					gvZip.DataSource = (DataTable)Session["zip_contents"];
					gvZip.DataBind();
					gvZip.Visible = true;
				}
			}

			//else
			//{
			//	richeditDoc.Open(file);
			//}
			sql.Close();
			return fileexists;
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



	protected void btnConfirmDelete_Click(object sender, EventArgs e)
	{
		string docversID = Request.QueryString["dvID"];

		//TODO!! need to add deletion to the DocVers class


		SQL_utils sql = new SQL_utils("backend");
		string fileext = sql.StringScalar_from_SQLstring("Select fileext from tbldocvers where docversID=" + docversID.ToString());
		string file = Server.MapPath(String.Format("~/webdocs/DocVersID_{0}{1}", docversID, fileext));
		string relative_file = String.Format("~/webdocs/DocVersID_{0}{1}", docversID, fileext);

		sql.NonQuery_from_SQLstring(String.Format("exec spDeleteDocVers_and_Data {0}", docversID));

		bool fileexists = File.Exists(file);

		//Delete the unzipped file
		if (fileexists)
		{
			//File.Delete(String.Format("{0}{1}", path, filename_to_use));
			File.Delete(file);
			//processingresults.Add(String.Format("Deleting '{0}'", filename_to_use));
		}




		sql.Close();

		Response.Redirect(Request.RawUrl);
	}



	protected void SaveButton_Click(object sender, EventArgs e)
	{
		//(fv.FindControl("form_docvers") as ASPxFormLayout).ForEach(SaveItem);

		//try
		//{
		//	sql_docvers.Update();
		//}
		//catch (Exception ex)
		//{
		//	var x = ex.Message;
		//}


		ASPxTextBox txt_doctitle = (ASPxTextBox)this.FindControlRecursive("txt_doctitle");
		ASPxComboBox cbo_docstatusid = (ASPxComboBox)this.FindControlRecursive("cbo_docstatusid");
		ASPxHtmlEditor htmledit_docdesc = (ASPxHtmlEditor)this.FindControlRecursive("htmledit_docdesc");


		string docdesc = htmledit_docdesc.Html.ToString();

		string doctitle = txt_doctitle.Value.ToString();
		string docstatusid = cbo_docstatusid.Value.ToString();

		//if (docdesc != "")
		//      {
		SQL_utils sql = new SQL_utils("backend");
		string code = String.Format("update tbldoc set docdesc = '{0}', doctitle='{1}', docstatusid={2} where docid=(select docid from tbldocvers where docversid={3})",
			docdesc, doctitle, docstatusid, Request.QueryString["dvID"]);
		sql.NonQuery_from_SQLstring(code);
		sql.Close();
		//}

	}



	private void SaveItem(LayoutItemBase item)
	{

		LayoutItem layoutItem = item as LayoutItem;
		if (layoutItem != null)
		{
			ASPxEdit editBase = layoutItem.GetNestedControl() as ASPxEdit;
			//Debug.WriteLine(String.Format("**** editBase.ID {0} ****", editBase.ID));

			if (editBase != null)
			{
				string fldname = layoutItem.FieldName;

				try
				{
					var val = editBase.Value.ToString();
					Debug.WriteLine(String.Format("save {0} = [{1}] ", editBase.ID, val));
					sql_docvers.UpdateParameters[layoutItem.FieldName].DefaultValue = val.ToString();
				}
				catch (Exception ex)
				{
					string txtval = "NULL"; // (editBase.Value.ToString() == null) ? "NULL" : editBase.Value.ToString();
					Debug.WriteLine(String.Format("save {0} = [{1}] : ERR [{2}]", editBase.ID, txtval, ex.Message));
					sql_docvers.UpdateParameters[layoutItem.FieldName].DefaultValue = null;
				}

			}


		}
	}





	protected void btnCreateNew_Click(object sender, EventArgs e)
	{
		SQL_utils sql = new SQL_utils("kawdata");

		int docid = sql.IntScalar_from_SQLstring(String.Format("select docid from tblDocVers where docversid={0}", Request.QueryString["dvID"]));
		int entitytypeid = sql.IntScalar_from_SQLstring(String.Format("select entitytypeid from vwDocVers where docversid={0}", Request.QueryString["dvID"]));
		int entityid = Convert.ToInt32(cbo_NewEntity.Value.ToString());

		string sqlcode = String.Format("insert into tbldocfk (docid, entitytypeid, entityid) values({0},{1},{2})"
					, docid, entitytypeid, entityid);
		sql.NonQuery_from_SQLstring(sqlcode);

		sql.Close();

	}


	protected string DownloadFile(string filename)
	{

		string result = "";

		try
		{
			Response.Redirect("~/Library/FileHandler.ashx?file=" + filename);
			result = "success";
		}
		catch (Exception ex)
		{
			string x = ex.Message;
			//lblInfo.Text += "#ERROR in DownloadFile: " + ex.Message;
			result = "error";
		}


		return result;
	}


	protected void LogDownload(string filename)
	{
		SQL_utils sql = new SQL_utils();

		//Log the Download
		List<SqlParameter> ps2 = new List<SqlParameter>();
		ps2.Add(sql.CreateParam("dataproj_pk", Request.QueryString["pk"], "int"));
		ps2.Add(sql.CreateParam("filename", filename, "text"));
		sql.NonQuery_from_ProcName("dp.spLogDownload", ps2);

		sql.Close();
	}

	protected void btnDownload_Click(object sender, EventArgs e)
	{
		int x = 0;

		string dvID = Request.QueryString["dvID"];

		SQL_utils sql = new SQL_utils("backend");

		string filename = sql.StringScalar_from_SQLstring(String.Format("select docfilename from vwDocVers where docversid={0}", dvID));



		if (File.Exists(HttpContext.Current.Server.MapPath("~/webdocs/" + filename)))
		{
			//LogDownload(filename);
			DownloadFile(filename);
		}
		else
		{

			if (File.Exists(HttpContext.Current.Server.MapPath("~/webdocs/" + filename)))
			{
				//convert to .xls here
				try
				{
					LogDownload(filename);
					DownloadFile(filename);

				}
				catch (Exception ex)
				{
					string msg = ex.Message;
					string result = "Sorry, the file [" + filename + "] was not found. We have tried to create it but an error occurred.";
					ClientScript.RegisterStartupScript(GetType(), "alert", "alert('" + result + "');", true);

				}
			}
			else
			{
				string result = "Sorry, the file [" + filename + "] was not found.";
				ClientScript.RegisterStartupScript(GetType(), "alert", "alert('" + result + "');", true);
			}

		}

	}
}