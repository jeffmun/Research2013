using System;
using System.IO;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using DevExpress.Web;
using DevExpress.Utils;
using System.Web.UI.WebControls;

using uwac;

using System.Text.RegularExpressions;
using System.Globalization;
using System.Data;
using System.Diagnostics;

public partial class Data_Uploaded : BasePage
{
	protected void Page_Load(object sender, EventArgs e)
	{

		if (!IsPostBack)
		{
			Webdoc_files();

			GetUploadedFiles();
		}


		gvA.KeyFieldName = "docversid";
		gvA.DataSource = (DataTable)Session["dt_uploads_A"];
		gvA.DataBind();

		gvB.KeyFieldName = "docversid";
		gvB.DataSource = (DataTable)Session["dt_uploads_B"];
		gvB.DataBind();

		gvC.KeyFieldName = "docversid";
		gvC.DataSource = (DataTable)Session["dt_uploads_C"];
		gvC.DataBind();

	}


	protected void GetUploadedFiles()
	{
		SQL_utils sql = new SQL_utils("backend");

		DataTable dt_uploads_C = sql.DataTable_from_SQLstring("select * from vwUploadedDataFiles where processing_status like 'C.%' order by doctype, origfilename ");
		DataTable dt_uploads_A = sql.DataTable_from_SQLstring("select * from vwUploadedDataFiles where processing_status like 'A.%' order by doctype, origfilename ");

		DataTable dt_uploads_B = sql.DataTable_from_SQLstring("select * from vwUploadedDataFiles where processing_status like 'B.%' order by doctype, origfilename ");


		lblA.Text = String.Format("Uploaded Not Yet Processed (n={0})", dt_uploads_A.Rows.Count);
		lblB.Text = String.Format("Uploaded with ERRORS when Processed (n={0})", dt_uploads_B.Rows.Count);
		lblC.Text = String.Format("Uploaded and Processed (n={0})", dt_uploads_C.Rows.Count);

		Session["dt_uploads_A"] = dt_uploads_A;
		Session["dt_uploads_B"] = dt_uploads_B;
		Session["dt_uploads_C"] = dt_uploads_C;


		//gv.DataSource = dt_uploads;
		//gv.DataBind();

	}


	public void Webdoc_files()
	{
		var x = HttpContext.Current.Server.MachineName.ToString();

		if (x != "JEFFHOMEPC2020")
		{
			SQL_utils sql = new SQL_utils("backend");

			int max_loggedwebdoc = sql.IntScalar_from_SQLstring("select max(docversid) from webdocfile ");
			int max_docversid = sql.IntScalar_from_SQLstring("select max(docversid) from tbldocvers ");

			//Log the contents of the webdocs folder only if there are more recent docs that have been uploaded
			if (max_docversid > max_loggedwebdoc)
			{

				DataTable dt = new DataTable();
				DataColumn c1 = new DataColumn("docversid", System.Type.GetType("System.Int32"));
				DataColumn c2 = new DataColumn("filename", System.Type.GetType("System.String"));
				DataColumn c3 = new DataColumn("filesize", System.Type.GetType("System.Double"));
				dt.Columns.Add(c1);
				dt.Columns.Add(c2);
				dt.Columns.Add(c3);


				string[] filePaths = Directory.GetFiles(Server.MapPath("~/webdocs/"));
				string mappath = Server.MapPath("~/webdocs/");
				foreach (string s in filePaths)
				{
					string file = s.Replace(mappath, "");
					DataRow row = dt.NewRow();
					row["filename"] = file;
					row["filesize"] = 0;
					int docversid = 0;

					string[] numbers = Regex.Split(file, @"\D+");
					foreach (string value in numbers)
					{
						if (!string.IsNullOrEmpty(value))
						{
							int i = int.Parse(value);
							Console.WriteLine("Number: {0}", i);
							docversid = i;
						}
					}

					if (docversid > 0)
					{


						//Delete from file
						//string filename = Server.MapPath(String.Format("~/webdocs/{0}", s));

						if (File.Exists(s))
						{
							FileInfo fileInfo = new FileInfo(s);
							float size = fileInfo.Length;
							row["filesize"] = size;
						}



						row["docversid"] = docversid;
						dt.Rows.Add(row);
					}


				}

				sql.NonQuery_from_ProcName("spLogWebdocFiles", sql.CreateParam("tmpwebdocfiles", dt));
			}

			sql.Close();
		}
	}




	protected void gv_CustomButtonCallback(object sender, ASPxGridViewCustomButtonCallbackEventArgs e)
	{

		ASPxGridView grid = sender as ASPxGridView;


		int docversid = Convert.ToInt32(grid.GetRowValues(e.VisibleIndex, "docversid"));
		string fileext = grid.GetRowValues(e.VisibleIndex, "fileext").ToString();

		if (docversid > 0)
		{
			SQL_utils sql = new SQL_utils("kawdata");

			if (e.ButtonID == "btnDel" | e.ButtonID == "btnDel2")
			{
				string result = sql.NonQuery_from_SQLstring_withReturnMsg(String.Format("exec def.spDeleteDocVers_and_Data {0}", docversid));

				try
				{
					//Delete from file
					string file_to_delete = Server.MapPath(String.Format("~/webdocs/DocVersID_{0}{1}", docversid, fileext));

					if (File.Exists(file_to_delete))
					{
						File.Delete(file_to_delete);
					}
					else
					{
						Debug.WriteLine("DELETE FILE: ERROR - File Not Found.");
					}
				}
				catch (IOException ioex)
				{
					Debug.WriteLine(ioex.Message);
				}
			}
			else if (e.ButtonID == "btnZip" | e.ButtonID == "btnZip2")
			{


			}
		}

		//
	}


	protected void gv_CustomButtonInitialize(object sender, ASPxGridViewCustomButtonEventArgs e)
	{
		ASPxGridView grid = sender as ASPxGridView;
		if (e.ButtonID == "btnDel" | e.ButtonID == "btnDel2")
		{
			int rows_of_valid_data = Convert.ToInt32(grid.GetRowValues(e.VisibleIndex, "rows_of_valid_data"));
			e.Enabled = (rows_of_valid_data > 0) ? false : true;
		}
		else if (e.ButtonID == "btnZip" | e.ButtonID == "btnZip2")
		{
			string fileext = grid.GetRowValues(e.VisibleIndex, "fileext").ToString();
			e.Enabled = (fileext == ".zip") ? false : false;
		}
	}

	protected void btnLogWebdocs_Click(object sender, EventArgs e)
	{
		Webdoc_files();
	}



	protected void callbackPanel_Callback(object source, DevExpress.Web.CallbackEventArgsBase e)
	{
		SQL_utils sql = new SQL_utils();
		string x = sql.StringScalar_from_SQLstring(String.Format("select processing_results from tblDocVers_ProcessingResults where docversid={0}", e.Parameter.ToString()));
		litText.Text = x;
	}


}