using System;
using System.Data;
using System.Configuration;
using System.Collections;
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


public partial class Info_StudyMeasInfo : System.Web.UI.Page
{
	private SqlConnection oConn = new SqlConnection();
	private SqlConnection oConnData = new SqlConnection();

	private ReadConfig oConfig = new ReadConfig();
	private AutismCenterBase.Security.Login oLogin = new AutismCenterBase.Security.Login();
	
	private DBLookup oDBLookup;
	private string[] _colnames;
	private string[] _url1;


	protected void Page_Load(object sender, EventArgs e)
	{

		//if (!oLogin.CheckGroupPermissions("AUTISM\\Permissions Group".Split(',')))
		//{

		//    tblMaster.Rows[1].Cells[0].Controls.Clear();
		//    //tblMaster.Rows.RemoveAt(1);

		//    tblMaster.Rows[1].Cells[0].Attributes["style"] = "color: #B22222;";
		//    tblMaster.Rows[1].Cells[0].InnerHtml = "Only those in the 'Permissions group' Active Directory group are authorized to view this page.";

		//    Label1.Visible = false;
		//    DDL_SelectLabID.Visible = false;
		//    Label2.Visible = false;
		//}

		
		//BindTheData();
	}


	protected void DDL_SelectStudyID_SelectedIndexChanged(object sender, EventArgs e)
	{
		Populate_MyGridView();
	}

	protected void Populate_MyGridView()
	{

		oConn.ConnectionString = ConfigurationManager.ConnectionStrings["TRACKING_CONN_STRING"].ToString();
		oConn.Open();

		oDBLookup = new DBLookup(oConn);

		int studyID = Convert.ToInt16(DDL_SelectStudyID.SelectedValue);


		//SqlCommand SqlCmd = new System.Data.SqlClient.SqlCommand("exec spSEC_PIVOT__RowEQ_Subject_ColEQ_StudyMeas 1065", oConn);
		SqlCommand SqlCmd = new System.Data.SqlClient.SqlCommand("exec spSEC_PIVOT__RowEQ_StudyMeas_ColEQ_Subject " + studyID.ToString(), oConn);
		SqlDataReader SqlReader = SqlCmd.ExecuteReader();
		

		//Get the Columnnames 
		Int32 _columncount = SqlReader.FieldCount;
		 _colnames = new string[_columncount];
		 _url1 = new string[_columncount];

		bool[] _colvisible = new bool[_columncount];

		for (int iCol = 0; iCol < _columncount; iCol++)
			{
				_colnames[iCol] = SqlReader.GetName(iCol).ToString();

			switch (SqlReader.GetName(iCol).ToString() )
			{
				case "x":
					_colvisible[iCol] = false;
					break;
				case "sortorder":
					_colvisible[iCol] = false;
					break;
				case "studymeasID":
					_colvisible[iCol] = false;
					break;
				case "url1":
					{
						_colvisible[iCol] = false;
						_url1[iCol] = SqlReader.GetName(iCol).ToString();
						break;
					}
				default:
					_colvisible[iCol] = true;
					break;
			}

		}

		//Fill the data table
		DataTable dt = new DataTable();
		dt.Load(SqlReader);

		Int32 _rowcount = dt.Rows.Count;

		//build the Gridview & columns

		GridView mygridview = new GridView();
		mygridview.ID = "mygridview";
		mygridview.AutoGenerateColumns = false;
		mygridview.CssClass = "tblinputsmall_blue";
		mygridview.RowDataBound += new GridViewRowEventHandler(mygridview_RowDataBound);
		
		TemplateField tf = null;




		for (int c = 0; c < _columncount; c++){

		
			tf = new TemplateField();
			if (_colnames[c]=="StudyMeasName")
			{
				tf.HeaderTemplate = new DynamicGridViewTextTemplate(_colnames[c], DataControlRowType.Header);
				//tf.ItemTemplate = new DynamicGridViewTextTemplate(_colnames[c], DataControlRowType.DataRow);
				tf.ItemTemplate = new DynamicGridViewURLTemplate(_colnames[c], "url1", DataControlRowType.DataRow);
			}
			else
			{
				int subjID = oDBLookup.GetSubjIDFromID(_colnames[c], studyID);  //TO DO: get the studyID


				string myurl = @"~/Measures/MeasuresBySubject.aspx?subjectID=" + subjID.ToString();

				tf.HeaderTemplate = new DynamicGridViewURLTemplate(_colnames[c], myurl, DataControlRowType.Header);
				//tf.HeaderTemplate = new DynamicGridViewTextTemplate(_colnames[c], DataControlRowType.Header);
				tf.ItemTemplate = new DynamicGridViewTextTemplate(_colnames[c], DataControlRowType.DataRow);
			}
			tf.Visible = _colvisible[c];
			//footer
			mygridview.Columns.Add(tf);
		}

		//Bind the data
		mygridview.DataSource = dt;
		mygridview.DataBind();
		PlaceHolder1.Controls.Add(mygridview);

	   

	}



	protected void mygridview_RowDataBound(Object sender, GridViewRowEventArgs e)
	{
		if (e.Row.RowType == DataControlRowType.DataRow)  //if a data row
		
			//tblmyinfo.Rows[0].Cells[0].InnerHtml += "<br/>**R=";
			//tblmyinfo.Rows[0].Cells[0].InnerHtml += e.Row.Cells.Count.ToString() + "_";

		for (int c = 0; c < e.Row.Cells.Count; c++) {

			//Get the control  - NOT CLEAR WHY .Text DOES NOT GIVE THE LABEL TEXT??
			DataControlFieldCell celllabel = (DataControlFieldCell)e.Row.Controls[c];
			
			string cellval = Convert.ToString(DataBinder.Eval(e.Row.DataItem, _colnames[c]));

			//tblmyinfo.Rows[0].Cells[0].InnerHtml += e.Row.Controls[c].UniqueID.ToString() + "." + _colnames[c] + "__";

			switch (cellval)
			{
				case "TBD":
					celllabel.CssClass = "styleTBD";
					break;
				case "Data":
					celllabel.CssClass = "styleData";
					break;
				case "NA":
					celllabel.CssClass = "styleNA";
					break;

			}
			}
	}





	//protected void BindTheData()
	//{
	//    //Response.Write("<script>alert('Binding...')</script>");


	//    //2del DDL_SelectLabID.DataSource = Sql_Labs;
	//    //2del DDL_SelectLabID.DataBind();

	//    Gridview1.DataSource = SqlDataSource1;
	//    Gridview1.DataBind();

	//    Gridview2.DataSource = Sql_MultipleLabs;
	//    Gridview2.DataBind();


	//    //Gridview2.DataSource = SqlDataSource2;
	//    //Gridview2.DataBind();

	//    //Gridview3.DataSource = SqlDataSource3;
	//    //Gridview3.DataBind();
	
	//    //Gridview4.DataSource = SqlDataSource4;
	//    //Gridview4.DataBind();
	//}

	//protected void OnDataBound(Object sender, System.EventArgs e)
	//{
	//    //if (Gridview1.Rows.Count > 0)
	//    //{
	//    //    Response.Write("<script>alert('Gridview1.Rows.Count > 0')</script>");
	//    //}
	//    //else
	//    //{
	//    //    Response.Write("<script>alert('else')</script>");
	//    //}
	//}


	//protected void OnRowDataBound(Object sender, System.EventArgs e)
	//{
	//   //Response.Write("<script>alert('onRowDatabound')</script>");
		
	//}

	
	//protected void DDL_SelectLabID_SelectedIndexChanged(object sender, EventArgs e)
	//{
	//    this.Gridview1.DataBind();
	//}

	//protected void ViewStaffDetails(object sender, EventArgs e)
	//{

	//    this.Gridview_StaffDetails.DataBind();
	//    this.Gridview_StaffDetails.Visible = true;
	//}





}