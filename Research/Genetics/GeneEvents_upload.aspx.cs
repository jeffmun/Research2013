using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Collections.Generic;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Data.SqlClient;
using AutismCenterBase.Utilities;
using System.IO;
using System.Drawing;
using System.Text;

using System.Data.OleDb;


public partial class Genetics_GeneEvents_upload : System.Web.UI.Page
{

	private SqlConnection oConn = new SqlConnection();
	private SqlConnection oConnData = new SqlConnection();
	private SqlConnection oConnGene = new SqlConnection();
	private SqlConnection conWS03Excel_Imports = new SqlConnection();

	private ReadConfig oConfig = new ReadConfig();
	private AutismCenterBase.Security.Login oLogin = new AutismCenterBase.Security.Login();


	protected void Page_Load(object sender, EventArgs e)
	{
		oConn.ConnectionString = ConfigurationManager.ConnectionStrings["TRACKING_CONN_STRING"].ToString();
		oConnData.ConnectionString = ConfigurationManager.ConnectionStrings["DATA_CONN_STRING"].ToString();


		conWS03Excel_Imports.ConnectionString = "Server=autism-ws03\\MSSQLSERVER;Database=Excel_Imports;User ID=Autism/jeffmun;Password=UNK;";


		if (!IsPostBack)
		{
			DisplayData();
		}
	}

	protected  void DisplayData()
	{
		var reader = OleDbEnumerator.GetRootEnumerator();
		Label dbinfo = (Label)Panel1.FindControl("dbinfo");

		var list = new List<String>();
		while (reader.Read())
		{
			for (var i = 0; i < reader.FieldCount; i++)
			{
				if (reader.GetName(i) == "SOURCES_NAME")
				{
					list.Add(reader.GetValue(i).ToString());
				}
			}

			dbinfo.Text += reader.GetName(0) + "=" + reader.GetValue(0) + "<br/>";
			//Console.WriteLine("{0} = {1}", reader.GetName(0), reader.GetValue(0));
		}
		reader.Close();
	}



	protected void btnUpload_Click(object sender, EventArgs e)
	{
		FileUpload FileUpload1 = (FileUpload)Panel1.FindControl("FileUpload1");
		if (FileUpload1.HasFile)
		{
			string FileName = Path.GetFileName(FileUpload1.PostedFile.FileName);
			string Extension = Path.GetExtension(FileUpload1.PostedFile.FileName);
			string FolderPath = ConfigurationManager.AppSettings["GeneEventsFolderPath"];
			string FilePath = Server.MapPath(FolderPath + FileName);
			FileUpload1.SaveAs(FilePath);
			GetExcelSheets(FilePath, Extension, "True");
		}
	}

	protected void GetExcelSheets(string FilePath, string Extension, string isHDR)
	{
		string conStr = "";
		dbinfo.Text += Extension + "<br/>";

		switch (Extension)
		{
			case ".xls": //Excel 97-03
				conStr = ConfigurationManager.ConnectionStrings["Excel03ConString"].ConnectionString;

				break;
			case ".xlsx": //Excel 07
				conStr = ConfigurationManager.ConnectionStrings["Excel07ConString"].ConnectionString;
				break;
		}

		dbinfo.Text += conStr + "<br/>";

		//Get the Sheets in Excel WorkBoo
		conStr = String.Format(conStr, FilePath, true);
		dbinfo.Text += "<br/>--- conStr = " + conStr + "<br/>";

		//try
		//{

			dbinfo.Text += "--- here we are at try() <br/>";
			OleDbConnection connExcel = new OleDbConnection(conStr);
			OleDbCommand cmdExcel = new OleDbCommand();
			OleDbDataAdapter oda = new OleDbDataAdapter();
			cmdExcel.Connection = connExcel;

			connExcel.Open();

			//Panel Panel1 = (Panel)FindControl("Panel1");
			//Panel Panel2 = (Panel)FindControl("Panel2");


			//Bind the Sheets to DropDownList
			//DropDownList ddlSheets = (DropDownList)FindControlRecursive(Panel2,"ddlSheets");
			//TextBox txtTable = (TextBox)FindControl("txtTable");
			//Label lblFileName = (Label)FindControl("lblFileName");


			ddlSheets.Items.Clear();
			ddlSheets.Items.Add(new ListItem("--Select Sheet--", ""));
			ddlSheets.DataSource = connExcel.GetOleDbSchemaTable(OleDbSchemaGuid.Tables, null);
			ddlSheets.DataTextField = "TABLE_NAME";
			ddlSheets.DataValueField = "TABLE_NAME";
			ddlSheets.DataBind();
			connExcel.Close();
			txtTable.Text = "";
			lblFileName.Text = Path.GetFileName(FilePath);
			Panel2.Visible = true;
			Panel1.Visible = false;


		//}

		//catch(Exception exc)
		//{
		//    dbinfo.Text += "<br/>" + exc.Source + "<br/>" + exc.Message + "<br/>" + exc.StackTrace;

		//}

	}

	protected void btnSave_Click(object sender, EventArgs e)
	{
		//DropDownList ddlSheets = (DropDownList)FindControl("ddlSheets");
		//TextBox txtTable = (TextBox)FindControl("txtTable");
		//Label lblFileName = (Label)FindControl("lblFileName");
		//Label lblMessage = (Label)FindControl("lblMessage");
		//Panel Panel1 = (Panel)FindControl("Panel1");
		//Panel Panel2 = (Panel)FindControl("Panel2");
		//RadioButton rbHDR = (RadioButton)FindControl("rbHDR");

		string FileName = lblFileName.Text;
		string Extension = Path.GetExtension(FileName);
		string FolderPath = Server.MapPath(ConfigurationManager.AppSettings["FolderPath"]);
		string CommandText = "";
		//switch (Extension)
		//{
		//    case ".xls": //Excel 97-03
		//        CommandText = "sp_ImportFromExcel03";
		//        break;
		//    case ".xlsx": //Excel 07
		//        CommandText = "sp_ImportFromExcel07";
		//        break;
		//}
		CommandText = "sp_ImportFromExcel";

		//Read Excel Sheet using Stored Procedure
		//And import the data into Database Table
		String strConnString = ConfigurationManager.ConnectionStrings["ws03_Excel_Imports_ConnectionString"].ConnectionString;

		
		//JM SqlConnection con = new SqlConnection(strConnString);


		//conWS03Excel_Imports.ConnectionString = strConnString;



		SqlCommand cmd = new SqlCommand();
		cmd.Connection = conWS03Excel_Imports;
		cmd.CommandType = CommandType.StoredProcedure;
		cmd.CommandText = CommandText;
		cmd.Parameters.Add("@SheetName", SqlDbType.VarChar).Value = ddlSheets.SelectedItem.Text;
		cmd.Parameters.Add("@FilePath", SqlDbType.VarChar).Value = FolderPath + FileName;
		cmd.Parameters.Add("@context", SqlDbType.VarChar).Value = "geneevent";
		//        cmd.Parameters.Add("@HDR", SqlDbType.VarChar).Value =   rbHDR.SelectedItem.Text;
//        cmd.Parameters.Add("@TableName", SqlDbType.VarChar).Value = txtTable.Text;
		//cmd.Connection = con;
		//try
		//{
			//con.Open();
			if (conWS03Excel_Imports.State == ConnectionState.Closed) conWS03Excel_Imports.Open();
			object count = cmd.ExecuteNonQuery();
			lblMessage.ForeColor = System.Drawing.Color.Green;
			lblMessage.Text = count.ToString() + " records inserted.";
		//}
		//catch (Exception ex)
		//{
		//    lblMessage.ForeColor = System.Drawing.Color.Red;
		//    lblMessage.Text = ex.Message + "<br/>" + ex.StackTrace;
		//}
		//finally
		//{
		//    //con.Close();
		//    //con.Dispose();
		//    Panel1.Visible = true;
		//    Panel2.Visible = false;

		//}
	}
	protected void btnCancel_Click(object sender, EventArgs e)
	{
		Panel Panel1 = (Panel)FindControl("Panel1");
		Panel Panel2 = (Panel)FindControl("Panel2");
		Panel1.Visible = true;
		Panel2.Visible = false;
	}


	//Use to find controls in other controls
	private Control FindControlRecursive(Control rootControl, string controlID)
	{
		if (rootControl.ID == controlID) return rootControl;

		foreach (Control controlToSearch in rootControl.Controls)
		{
			Control controlToReturn =
				FindControlRecursive(controlToSearch, controlID);
			if (controlToReturn != null) return controlToReturn;
		}
		return null;
	}


}