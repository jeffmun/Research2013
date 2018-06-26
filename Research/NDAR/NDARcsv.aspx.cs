using System;
using System.Data;
using System.Data.Odbc;
using System.Data.OleDb;
using System.Configuration;
using System.Collections;
using System.Net;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Data.SqlClient;
using AutismCenterBase.Utilities;
using System.IO;

public partial class NDAR_NDARcsv : System.Web.UI.Page
{
	private SqlConnection oConn = new SqlConnection();
	private DBLookup oDBLookup;
	private ReadConfig oConfig = new ReadConfig();

	protected void Page_Init(object sender, EventArgs e)
	{
		oConn.ConnectionString = ConfigurationManager.ConnectionStrings["TRACKING_CONN_STRING"].ToString();
		oConn.Open();
	}

	protected void Page_Load(object sender, EventArgs e)
	{

		GetNDARcsvFilesAndFolders();


	}


	public void GetNDARcsvFilesAndFolders()
	{
		string subfolder = "";
		if (txtSubFolder.Text != null)
		{
			subfolder = "/" + txtSubFolder.Text;
		}

		DirectoryInfo dirInfo = new DirectoryInfo("//autism-sql.autism.washington.edu/ndarcsv" + subfolder);
		GetFilesAndFolders(dirInfo);

		TreeView1.Nodes.Clear();

		// output the directory into a node
		TreeNode RootNode = OutputDirectory(dirInfo, null);

		// add the output to the tree
		TreeView1.Nodes.Add(RootNode);
	}

	public void GetFilesAndFolders(DirectoryInfo dirInfo)  
   {  
	   //DirectoryInfo dirInfo = new DirectoryInfo(Server.MapPath("autism-sql.autism.washington.edu/ndarcsv"));
	   FileInfo[] fileInfo = dirInfo.GetFiles("*.*", SearchOption.AllDirectories);  
	   GridView1.DataSource = fileInfo;  
	   GridView1.DataBind();        
   }



	 TreeNode OutputDirectory(System.IO.DirectoryInfo directory, TreeNode parentNode)
	 {
		 // validate param
		 if (directory == null) return null;

		 // create a node for this directory
		 TreeNode DirNode = new TreeNode(directory.Name);

		 // get subdirectories of the current directory
		 System.IO.DirectoryInfo[] SubDirectories = directory.GetDirectories();

		 // output each subdirectory
		 for (int DirectoryCount = 0; DirectoryCount < SubDirectories.Length; DirectoryCount++)
		 {
			 OutputDirectory(SubDirectories[DirectoryCount], DirNode);
		 }

		 // output the current directories files
		 System.IO.FileInfo[] Files = directory.GetFiles();

		 for (int FileCount = 0; FileCount < Files.Length; FileCount++)
		 {
			 DirNode.ChildNodes.Add(new TreeNode(Files[FileCount].Name));
		 }

		 // if the parent node is null, return this node
		 // otherwise add this node to the parent and return the parent
		 if (parentNode == null)
		 {
			 return DirNode;
		 }
		 else
		 {
			 parentNode.ChildNodes.Add(DirNode);
			 return parentNode;
		 }
	 }




	protected void GridView1_RowCommand(object sender, CommandEventArgs e)
	{
		if (e.CommandName == "ViewNDARcsvTable")
		{
			LoadNDARcsv(e.CommandArgument.ToString());
			btnHideDataTable.Visible = true;
		}

		if (e.CommandName == "DeleteNDARcsv")
		{
			RemoveNDARcsv(e.CommandArgument.ToString());
		}

	}

	protected void LoadNDARcsv(string tbl)
	{
		string ndarcsv = "select ROW_NUMBER() over(order by datatable_pk) as rownum, * from " + tbl.Replace(".csv", "");

		GridView gv1 = new AutoGridView("ndar", ndarcsv, "gv_Sites", false, "", "");
		Panel_ndarcsv.Controls.Clear();
		Panel_ndarcsv.Controls.Add(gv1);

	}

	protected void HideDataTable(object sender, EventArgs e)
	{
		Panel_ndarcsv.Controls.Clear();
		btnHideDataTable.Visible = false;
	}


	protected void RemoveNDARcsv(string tbl)
	{
		SqlCommand cmd = new SqlCommand();
		cmd.Connection = oConn;
		cmd.CommandType = CommandType.StoredProcedure;
		cmd.CommandText = "spDeleteCSVfile_and_DBobj";
		cmd.Parameters.Add("@tbl", SqlDbType.VarChar, 100);

		TextBox txtTblToDelete = (TextBox)this.Page.FindControl("txtTblToDelete");
		cmd.Parameters["@tbl"].Value = tbl.Replace(".csv", "");

		try
		{
			cmd.ExecuteNonQuery();
		}
		catch (SqlException exc)
		{

		}

		GetNDARcsvFilesAndFolders();
	}

	////to display local csv file
	//protected void testit2(string pathofcsv, string csvFileName)
	//{
	//    //string filename = fl.PostedFile.FileName.ToString();
	//    FileInfo file = new FileInfo(pathofcsv + @"\" + csvFileName);
	//    string ConnectionString = "Provider=Microsoft.Jet.OLEDB.4.0;" +
	//           "Data Source=\"" + file.DirectoryName +
	//           "\";Extended Properties='text;HDR=Yes;FMT=Delimited(,)';";
	//    OleDbConnection con = new OleDbConnection(ConnectionString);
	//    OleDbCommand cmd = new OleDbCommand(string.Format(
	//      "SELECT * FROM [" + file.Name + "]", file.Name), con);
	//    try
	//    {
	//        con.Open();
	//        OleDbDataAdapter oda = new OleDbDataAdapter(cmd);
	//        DataTable dt = new DataTable("CSVTable");
	//        oda.Fill(dt);
	//        gv_csv.DataSource = dt;
	//        gv_csv.DataBind();
	//    }
	//    catch (Exception ee)
	//    {
	//        lblMsg.Text = ee.Message;
	//    }
	//}



	////to display remote csv file
	//protected void testit3(string pathofcsv, string csvFileName)
	//{
	//    string URL = pathofcsv + csvFileName; //txtRemote.Text.Trim(); //URL of the remote csv

	//    try
	//    {
	//        System.Net.FileWebRequest WebRequest;
	//        Uri CSVUri = new Uri(URL);

	//        WebRequest = (System.Net.FileWebRequest)
	//                      System.Net.FileWebRequest.Create(CSVUri);
	//        if ((WebRequest.GetResponse().ContentLength > 0))
	//        {
	//            System.IO.StreamReader strReader =
	//              new System.IO.StreamReader(
	//              WebRequest.GetResponse().GetResponseStream());

	//            //create datatable with column names
	//            DataTable dt = CreateCSVTable(strReader.ReadLine());
	//            String SingleLine;
	//            while ((SingleLine = strReader.ReadLine()) != null)
	//            {
	//                AddRowCSVTable(dt, SingleLine);
	//                //adding rows to datatable
	//            }

	//            gv_csv.DataSource = dt;
	//            gv_csv.DataBind();

	//            if (strReader != null) strReader.Close();
	//        }
	//    }
	//    catch (System.Net.WebException ex)
	//    {
	//        lblMsg.Text = "File does not exist.<br/>";
	//        lblMsg.Text += ex.Message + "<br/>";
	//        lblMsg.Text += URL; 
	//    }
	//}


	////to create the data table with columns
	//public DataTable CreateCSVTable(string TableColumnList)
	//{
	//    DataTable CSVTable = new DataTable("CSVTable");
	//    DataColumn myDataColumn;
	//    string[] ColumnName = TableColumnList.Split(',');
	//    for (int i = 0; i < ColumnName.Length - 1; i++)
	//    {
	//        myDataColumn = new DataColumn();
	//        myDataColumn.DataType =
	//           Type.GetType("System.String");
	//        myDataColumn.ColumnName = ColumnName[i];
	//        CSVTable.Columns.Add(myDataColumn);
	//    }

	//    return CSVTable;
	//}

	////to add the rows to datatable
	//public void AddRowCSVTable(DataTable CSVTable, string RowValueList)
	//{
	//    string[] RowValue = RowValueList.Split(',');
	//    DataRow myDataRow;
	//    myDataRow = CSVTable.NewRow();
	//    for (int i = 0; i < RowValue.Length - 1; i++)
	//    {
	//        myDataRow[i] = RowValue[i];
	//    }
	//    CSVTable.Rows.Add(myDataRow);
	//}









	// private void CSVintoGridView(string pathofcsv, string csvFileName)
	// //private void CSVintoGridView()
	// {
	//     //Change this to your csv file name 
	//     //string csvFileName = "NDAR_ADS_T4_PSOC_2013_11_4__9hr_12min.csv";
	//     //Change this to your csv file path
	//     //string pathofcsv = @"\\autism-sql.autism.washington.edu\ndarcsv\todo";
	//     string conString = "Driver={Microsoft Text Driver (*.txt; *.csv)};Dbq=" + pathofcsv + ";Extensions=asc,csv,tab,txt";
	//     DataSet ds = new DataSet("MyDataSet");
	//     OdbcDataAdapter adp = new OdbcDataAdapter();
	//     OdbcConnection conn = new OdbcConnection(conString);

	//     OdbcCommand cmd = new OdbcCommand("SELECT * FROM " + csvFileName, conn);





	//     conn.Open();
	//     adp.SelectCommand = cmd;
	//     adp.Fill(ds);

	//     //using (OdbcConnection conn = new OdbcConnection(conString))
	//     //{
	//     //    using (OdbcCommand cmd = new OdbcCommand("SELECT * FROM " + csvFileName, conn))
	//     //    {
	//     //        conn.Open();
	//     //        adp.SelectCommand = cmd;
	//     //        adp.Fill(ds);
	//     //    }
	//     //}
	//     gv_csv.DataSource = ds;
	//     gv_csv.DataBind();
	// }  



}