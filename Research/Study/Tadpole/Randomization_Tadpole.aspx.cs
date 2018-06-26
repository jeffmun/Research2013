using System;
using System.Configuration;
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
using uwac;

public partial class Study_Tadpole_Randomization_Tadpole : System.Web.UI.Page
{


	private SqlConnection oConn = new SqlConnection();
	private ReadConfig oConfig = new ReadConfig();
	DBLookup oDBLookup = new DBLookup();

	private AutismCenterBase.Security.Login oLogin = new AutismCenterBase.Security.Login();


	#region PAGE STUFF: Init / Load ============================
	//raise events on content page for the buttons on master page
	protected void Page_Init(object sender, EventArgs e)
	{
		//Label lblError = (Label)Master.FindControl("lblInfoLog_Error");
		//lblError.Text += "<br/>==PageInit";

		//Load_TadpoleRandomization();

		
	}


	protected void Page_Prerender(object sender, EventArgs e)
	{
		//Label lblError = (Label)Master.FindControl("lblInfoLog_Error");
		//lblError.Text += "<br/>==PagePrerender";
	}

	protected void Page_Load(object sender, EventArgs e)
	{

		oConn.ConnectionString = ConfigurationManager.ConnectionStrings["TRACKING_CONN_STRING"].ToString();
		oConn.Open();

	   // Label lblError = (Label)Master.FindControl("lblInfoLog_Error");

		//if (oLogin.CheckGroupPermissions("TadpoleTXlogs".Split(',')))
		if (1==1)
		//if (oLogin.LoginID.ToString() == "jeffmun" | oLogin.LoginID.ToString() == "nlange")
		{           //enable editing here 

			Load_DescStats();
			//gv_tbl_Randomization_Tadpole.Visible = true;
			btnDownload_file.Visible = true;
			//btnShowInsertForm.Visible = true;
		}
		else
		{

			Label lbl = new Label();
			lbl.Text = "You have not been granted access to view Tadpole Randomization information.";
			lbl.ForeColor = Color.Red;
			Panel_info.Controls.Add(lbl);

			//gv_tbl_Randomization_Tadpole.Visible = false;

			btnDownload_file.Visible = false;
			btnShowInsertForm.Visible = false;

		}







		if (IsPostBack) { 
			//lblError.Text += "<br/>==PageLoad: IsPostBack"; 
		}

		if (!IsPostBack)
		{
			//lblError.Text += "<br/>==PageLoad: !IsPostBack";
		}


	}

	#endregion


	#region LOAD DATA ====================================================


	protected void Load_DescStats()
	{
		//Label lblError = (Label)Master.FindControl("lblInfoLog_Error");
		//lblError.Text += "<br/>********* Load_TadpoleRandomization()<br/>";
		GridView gv0 = new AutoGridView("backend", "vwTadpole_Sites__Crosstabs order by site", "gv_Cross", false, "", "");
		Panel_Cross.Controls.Clear();
		Panel_Cross.Controls.Add(gv0);

		GridView gv0b = new AutoGridView("backend", "vwTadpole_Sites__Crosstabs2 order by txgroup", "gv_Cross2", false, "", "");
		Panel_Cross2.Controls.Clear();
		Panel_Cross2.Controls.Add(gv0b);


		GridView gv1 = new AutoGridView("backend", "vwTadpole_Sites__DescStats order by site", "gv_Sites", false,"","");
		Panel_Sites.Controls.Clear();
		Panel_Sites.Controls.Add(gv1);

		GridView gv2 = new AutoGridView("backend", "vwTadpole_Groups__DescStats order by TxGroup", "gv_Groups", false, "", "");
		Panel_Groups.Controls.Clear();
		Panel_Groups.Controls.Add(gv2);

		GridView gv3a = new AutoGridView("backend", "vwTadpole_Groups__DescStats_SiteByGroup order by Site,TxGroup", "gv_3a", false, "", "");
		Panel3a.Controls.Clear();
		Panel3a.Controls.Add(gv3a);

		GridView gv3b = new AutoGridView("backend", "vwTadpole_Groups__DescStats_SiteByGroup order by TxGroup, Site", "gv_3b", false, "", "");
		Panel3b.Controls.Clear();
		Panel3b.Controls.Add(gv3b);


		//DETAILS
		SQL_utils sql = new SQL_utils();
		int n1 = sql.IntScalar_from_SQLstring("select count(*) as n from uwautism_research_backend..vw_Randomization_Tadpole where TxGroup is not null");
		int n2 = sql.IntScalar_from_SQLstring("select count(*) as n from uwautism_research_backend..vw_Randomization_Tadpole where TxGroup is  null");

		GridView gvDetails = new AutoGridView("backend", "vw_Randomization_Tadpole where TxGroup is not null order by Site, ID", "gvDetails", false, "", "");
		Label lbl1 = new Label();
		lbl1.Text = "Randomized Subjects (N = " + n1.ToString() + ")<br/>";
		lbl1.Font.Bold = true; lbl1.Font.Size = 12;

		
		Panel_Details.Controls.Clear();
		Panel_Details.Controls.Add(lbl1);
		Panel_Details.Controls.Add(gvDetails);

		GridView gvDetails2 = new AutoGridView("backend", "vw_Randomization_Tadpole where TxGroup is null order by Site, ID", "gvDetails2", false, "", "");
		Label lbl2 = new Label();

		lbl2.Text = "Subjects Not Randomized (N = " + n2.ToString() + ")<br/>";
		lbl2.Font.Bold = true; lbl2.Font.Size = 12;

		Panel_Details2.Controls.Clear();
		Panel_Details2.Controls.Add(lbl2);
		Panel_Details2.Controls.Add(gvDetails2);


	}


	protected void Load_TadpoleRandomization()
	{
		//need to build a Form View with the same # of fields that looks like the GridView
		// see:  http://forums.asp.net/t/1800561.aspx 
		//

	   // Label lblError = (Label)Master.FindControl("lblInfoLog_Error");
	   // lblError.Text += "<br/>********* Load_TadpoleRandomization()<br/>";

		GridView agv = new AutoGridView_withEdit("backend", "vw_Randomization_Tadpole order by site, ID", "gv_Randomization_Tadpole",  "",
			 ",,,,,,,,,gvGray,gvGray,gvGray,gvGray");
		//DataTable dt = oDBLookup.GetView("_AutoGrid_testtable");

		// Session["dataTable"] = dt;

		agv.RowEditing += new GridViewEditEventHandler(gv_Randomization_Tadpole_RowEditing);
		agv.RowUpdating += new GridViewUpdateEventHandler(gv_Randomization_Tadpole_RowUpdating);     /* <-- needs the buttons to have CausesValidation=false */
		agv.RowCancelingEdit += new GridViewCancelEditEventHandler(gv_Randomization_Tadpole_RowCancelingEdit);

		agv.RowCommand += new GridViewCommandEventHandler(gv_Randomization_Tadpole_RowCommand);
		agv.RowDataBound += new GridViewRowEventHandler(gv_Randomization_Tadpole_RowDataBound);

		agv.FooterRow.BackColor = Color.SlateBlue;

		agv.DataBind();
		//Panel1.Controls.Clear();
		//Panel1.Controls.Add(agv);

		//UpdatePanel1.ContentTemplateContainer.Controls.Clear();
		//UpdatePanel1.ContentTemplateContainer.Controls.Add(agv);


		//lblError.Text += "<br/> $$$  DataKeyNames = " + agv.DataKeyNames.ToString();
		//lblError.Text += "<br/> $$$  DataKeyNames = " + agv.DataKeyNames[0].ToString();


	}

	#endregion

	protected void gv_Randomization_Tadpole_RowDataBound(object sender, GridViewRowEventArgs e)
	{
		GridViewRow row = (GridViewRow)e.Row;

		//string x = row.DataItem["ID"].Value.ToString();

		//Label lblError = (Label)Master.FindControl("lblInfoLog_Error");
		//lblError.Text += "#" + e.Row.RowIndex.ToString() + "..";

	}
	


	#region INSERT NEW RECORD =============================================

	protected void ShowInsertForm(object sender, EventArgs e)
	{
		fv_NewRecord.Visible = true;
		btnShowInsertForm.Visible = false;
		btn_InsertRecord.Visible = true;
		btn_InsertRecord_Cancel.Visible = true;

		UpdatePanel_insert.Update();
	}

	protected void InsertRecord_Submit(object sender, EventArgs e)
	{
		GridView gv = (GridView)Panel1.FindControl("gv_Randomization_Tadpole");

		TextBox txtID = (TextBox)fv_NewRecord.FindControl("txtID");
		DropDownList ddlSite = (DropDownList)fv_NewRecord.FindControl("ddlSite");
		DropDownList ddlSex = (DropDownList)fv_NewRecord.FindControl("ddlSex");

		TextBox txtTime1a_agemos = (TextBox)fv_NewRecord.FindControl("txtTime1a_agemos");
		TextBox txtFullScaleDQ = (TextBox)fv_NewRecord.FindControl("txtFullScaleDQ");
		TextBox txtTime1a_date = (TextBox)fv_NewRecord.FindControl("txtTime1a_date");
		TextBox txtAssignment_date = (TextBox)fv_NewRecord.FindControl("txtAssignment_date");
		TextBox txtNotes = (TextBox)fv_NewRecord.FindControl("txtNotes");

		String valcheck = "";

		if (ddlSite.SelectedValue.StartsWith("-"))
		{
			valcheck += " Site";
		}
		if (ddlSex.SelectedValue.StartsWith("-"))
		{
			valcheck += " Sex";
		}

		if (valcheck != "")
		{
		   // Label lblError = (Label)Master.FindControl("lblInfoLog_Error");

			lblError.Text = "Select a value for: " + valcheck;
		}
		else
		{

			SqlCommand cmd = new SqlCommand();
			cmd.Connection = oConn;
			cmd.CommandType = CommandType.StoredProcedure;
			cmd.CommandText = "spINSERT_Randomization_Tadpole";

			cmd.Parameters.Add("ID", SqlDbType.VarChar, 15);
			cmd.Parameters.Add("Site", SqlDbType.VarChar, 4);
			cmd.Parameters.Add("Sex", SqlDbType.VarChar, 1);
			cmd.Parameters.Add("Time1a_agemos", SqlDbType.Float);
			cmd.Parameters.Add("FullScaleDQ", SqlDbType.Float);
			cmd.Parameters.Add("Time1a_date", SqlDbType.Date);
			cmd.Parameters.Add("Assignment_date", SqlDbType.Date);
			cmd.Parameters.Add("notes", SqlDbType.VarChar, 250);

			cmd.Parameters["ID"].Value = txtID.Text;
			cmd.Parameters["Site"].Value = ddlSite.SelectedValue;
			cmd.Parameters["Sex"].Value = ddlSex.SelectedValue;
			cmd.Parameters["Time1a_agemos"].Value = txtTime1a_agemos.Text;
			cmd.Parameters["FullScaleDQ"].Value = txtFullScaleDQ.Text;
			cmd.Parameters["Time1a_date"].Value = txtTime1a_date.Text;
			cmd.Parameters["Assignment_date"].Value = txtAssignment_date.Text;
			cmd.Parameters["notes"].Value = txtNotes.Text;

			try
			{
				cmd.ExecuteNonQuery();

				InsertRecord_Cancel();

			}
			catch (SqlException exc)
			{
				Label lblError = (Label)Master.FindControl("lblInfoLog_Error");

				lblError.Text = exc.Message;
			}
		}

		//gv_tbl_Randomization_Tadpole.DataBind();

		Load_DescStats();
	}

	protected void InsertRecord_Cancel(object sender, EventArgs e)
	{
		InsertRecord_Cancel();
	}

	protected void InsertRecord_Cancel()
	{

		//set the txtbox to empty 
		TextBox txtID = (TextBox)fv_NewRecord.FindControl("txtID");
		DropDownList ddlSite = (DropDownList)fv_NewRecord.FindControl("ddlSite");
		DropDownList ddlSex = (DropDownList)fv_NewRecord.FindControl("ddlSex");

		TextBox txtTime1a_agemos = (TextBox)fv_NewRecord.FindControl("txtTime1a_agemos");
		TextBox txtFullScaleDQ = (TextBox)fv_NewRecord.FindControl("txtFullScaleDQ");
		TextBox txtTime1a_date = (TextBox)fv_NewRecord.FindControl("txtTime1a_date");
		TextBox txtAssignment_date = (TextBox)fv_NewRecord.FindControl("txtAssignment_date");
		TextBox txtNotes = (TextBox)fv_NewRecord.FindControl("txtNotes");

		txtID.Text = "";
		ddlSite.SelectedIndex = 0;
		ddlSex.SelectedIndex = 0;

		txtTime1a_agemos.Text = "";
		txtFullScaleDQ.Text = "";
		txtTime1a_date.Text = "";
		txtAssignment_date.Text = "";
		txtNotes.Text = "";

		UpdatePanel_insert.Update();

		fv_NewRecord.Visible = false;
		btnShowInsertForm.Visible = true;
		btn_InsertRecord.Visible = false;
		btn_InsertRecord_Cancel.Visible = false;

		//Label lblError = (Label)Master.FindControl("lblInfoLog_Error");
		lblError.Text = "";

	}


	#endregion


	#region UPDATE RECORD =========================================
	protected void gv_Randomization_Tadpole_RowEditing(object sender, GridViewEditEventArgs e)
	{
		GridView gv = (GridView)Panel1.FindControl("gv_Randomization_Tadpole");

		gv.EditIndex = e.NewEditIndex;
		gv.DataBind();
		Label lblError = (Label)Master.FindControl("lblInfoLog_Error");
		lblError.Text += "<br/><br/><br/>+++ here at gv_Randomization_Tadpole_RowEditing   newEditIndex = " + e.NewEditIndex.ToString() + "<br/>";

		GridViewRow row = gv.Rows[e.NewEditIndex];

		PrintRowControlsInfo(row);



	}


	protected void gv_Randomization_Tadpole_RowUpdating(object sender, GridViewUpdateEventArgs e)
	{
		GridView gv = (GridView)Panel1.FindControl("gv_Randomization_Tadpole");

		Label lblError = (Label)Master.FindControl("lblInfoLog_Error");
		lblError.Text += "<br/>+++here at gv_Randomization_Tadpole_RowUpdating  RowIndex = " + e.RowIndex.ToString() + "<br/><br/><br/>";

		lblError.Text += "<br/>  NUMKEYS = " + e.Keys.Count.ToString();

		//lblError.Text += "<br/>  DataKey for this row = " + gv.DataKeys[e.RowIndex].Value.ToString();



		//for (int i = 0; i < gv.Columns.Count; i++)
		//{
		//    lblError.Text += "<br/>loop A " + i.ToString();
		//    DataControlFieldCell cell = gv.Rows[e.RowIndex].Cells[i] as DataControlFieldCell;
		//    gv.Columns[i].ExtractValuesFromCell(e.NewValues, cell, DataControlRowState.Edit, true);
		//    lblError.Text += "<br/>loop A " + i.ToString() + "   len NewValues=" + e.NewValues.Count.ToString();

		//}


		//for (int j = 0; j < e.NewValues.Count; j++)
		//{
		//    lblError.Text += "<br/>loop B " + j.ToString();
		//    lblError.Text += "  >>>>  new=" + e.NewValues[j].ToString() + " old=" + e.OldValues[j].ToString() + "<br/>";
		//}


		lblError.Text += "<br/> ====== pre databind ======= ";
		GridViewRow row = gv.Rows[e.RowIndex];
		PrintRowControlsInfo(row);

		//foreach (TableCell cell in row.Cells)
		//{
		//    foreach (Control ctl in cell.Controls)
		//    {
		//        string theID = "noID";
		//        if (ctl.ID != null) theID = ctl.ID;
		//        lblError.Text += "<br/> ======>>>>>>>>>  " + ctl.GetType().ToString() + "        " + theID;
		//        if (ctl.ID == "TxGroup")
		//        {
		//            //TextBox txtbox = (TextBox)ctl;
		//            //lblError.Text += "<br/> ======>>>>>>>>>  " + ctl.GetType().ToString() + "        " + ctl.ID.ToString();
		//        }
		//    }
		//}


		//lblError.Text += "<br/> ======> ::::: " + ((TextBox)row.Cells[1].Controls[1]).Text;
		//lblError.Text += "<br/> ======> ::::: " + ((TextBox)row.Cells[2].Controls[1]).Text;
		//lblError.Text += "<br/> ======> ::::: " + ((TextBox)row.Cells[3].Controls[1]).Text;


		gv.EditIndex = -1;
		gv.DataBind();

		lblError.Text += "<br/> ====== post databind ======= ";
		//PrintRowControlsInfo(row);


		//for(int i=0; i < e.NewValues.Count; i++)
		//{
		//    lab1.Text += e.NewValues[i].ToString();
		//    lab2.Text += e.OldValues[i].ToString();
		//}

		//TextBox text = (TextBox)GridView1.Rows[e.RowIndex].FindControl("txtId");


		//Write code TO UPDATE YOUR DATABESE THEN WRITE BELOW CODE IN LAST
		// To Find Text of TextBox to get updated value....you get it in string like this.
		//string strName = ((TextBox)grdview1.Rows[e.RowIndex].Cells[YourColumnIndexInWhichTexBoxAppear].Controls[0]).Text;
		//GridView1.EditIndex = -1;
		//GridView1.DataBind();





	}


	protected void gv_tbl_Randomization_Tadpole_RowDeleted(object sender, GridViewDeletedEventArgs e)
	{
		Load_DescStats();
	}

	protected void gv_tbl_Randomization_Tadpole_RowUpdated(object sender, GridViewUpdatedEventArgs e)
	{
		Load_DescStats();
	}


	protected void gv_Randomization_Tadpole_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
	{
		GridView gv = (GridView)Panel1.FindControl("gv_Randomization_Tadpole");

		Label lblError = (Label)Master.FindControl("lblInfoLog_Error");
		lblError.Text += "<br/><br/><br/>+++here at gv_Randomization_Tadpole_RowCancelingEdit  RowIndex = " + e.RowIndex.ToString() + "<br/>";

		e.Cancel = true;
		gv.EditIndex = -1;
		gv.DataBind();

	}

	#endregion



	protected void gv_Randomization_Tadpole_RowCommand(object sender, GridViewCommandEventArgs e)
	{
		GridView gv = (GridView)Panel1.FindControl("gv_Randomization_Tadpole");
		
		////When manually creating the buttons
		//GridViewRow gvr = (GridViewRow)(((Button)e.CommandSource).NamingContainer);
		//int index = gvr.RowIndex;

		int index = Int16.Parse(e.CommandArgument.ToString());

		Label lblError = (Label)Master.FindControl("lblInfoLog_Error");
		lblError.Text += "<br/><br/><br/>+++ here at RowCommand   cmd = " + e.CommandName + "......... arg = " + e.CommandArgument.ToString() + " ..... index=" + index.ToString() + "<br/>";

		switch (e.CommandName)
		{
			case "Edit":
				lblError.Text += "<br/>EDIT!!!";
				break;
			case "Update":
				lblError.Text += "<br/>UPDATE!!!";
				break;
			case "Cancel":
				lblError.Text += "<br/>CANCEL!!!";
				break;

		}


		//int index = Int16.Parse(e.CommandArgument.ToString());

		GridViewRow row = gv.Rows[index];
		PrintRowControlsInfo(row);

	}





	protected void GetTabDelimData(object sender, EventArgs e)
	{
		string setpk_with_zeroes = "";

		DateTime time = DateTime.Now;              // Use current time
		string dateformat = "yyyy_MM_dd";    // Use this format
		string thedate = (time.ToString(dateformat));  // Write to console

		string label_for_data_on_page;

		#region //Log the request
		//try
		//{
		//    oConn.Close();



		//    if (oConn.State == ConnectionState.Closed)
		//    {
		//        oConn.ConnectionString = oConfig.ReadConnectio n String(ReadConfig.ConnectionStringType.Data);
		//        oConn.Open();
		//    }
		//    SqlCommand oCmdLogRun = new SqlCommand();
		//    oCmdLogRun.CommandTimeout = 90;

		//    oCmdLogRun.CommandType = CommandType.StoredProcedure;
		//    oCmdLogRun.CommandText = "spAUTOSET__LogRun";

		//    oCmdLogRun.Parameters.Add(new SqlParameter("@setpk", SqlDbType.Int));
		//    oCmdLogRun.Parameters["@setpk"].Direction = ParameterDirection.Input;
		//    oCmdLogRun.Parameters["@setpk"].Value = setpk;

		//    oCmdLogRun.Parameters.Add(new SqlParameter("@runfrom", SqlDbType.VarChar));
		//    oCmdLogRun.Parameters["@runfrom"].Direction = ParameterDirection.Input;
		//    oCmdLogRun.Parameters["@runfrom"].Value = "web";

		//    oCmdLogRun.Parameters.Add(new SqlParameter("@format", SqlDbType.VarChar));
		//    oCmdLogRun.Parameters["@format"].Direction = ParameterDirection.Input;
		//    oCmdLogRun.Parameters["@format"].Value = format;

		//    oCmdLogRun.Parameters.Add(new SqlParameter("@contents", SqlDbType.VarChar));
		//    oCmdLogRun.Parameters["@contents"].Direction = ParameterDirection.Input;
		//    oCmdLogRun.Parameters["@contents"].Value = contents;

		//    oCmdLogRun.Connection = this.oConn;
		//    oCmdLogRun.ExecuteNonQuery();

		//}
		//catch (SqlException oException)
		//{
		//    //errorLink1.InnerHtml += oException.Message;  //new with full study
		//    foreach (SqlError oErr in oException.Errors)
		//    {
		//        errorLink1.InnerHtml += oErr.Message;
		//    }
		//}
		#endregion




		#region // Get the data
		try
		{
			oConn.Close();



			if (oConn.State == ConnectionState.Closed)
			{
				oConn.ConnectionString = ConfigurationManager.ConnectionStrings["TRACKING_CONN_STRING"].ToString();
				oConn.Open();
			}
			SqlCommand oCmdTabDelim = new SqlCommand();
			oCmdTabDelim.CommandTimeout = 90;


				oCmdTabDelim.CommandType = CommandType.Text;
				oCmdTabDelim.CommandText = "select *, getdate() as date_retrieved from vw_Randomization_Tadpole order by ID";

			//errorLink1.InnerHtml += " @@@@@ THESORTEXPIS->" + sortExp;

			oCmdTabDelim.Connection = this.oConn;
			SqlDataAdapter daTabDelim = new SqlDataAdapter(oCmdTabDelim);

			DataSet dsTabDelim = new DataSet();

			daTabDelim.Fill(dsTabDelim);

			DataTable dtTabDelim = dsTabDelim.Tables[0];
			string attachment;


			attachment = "attachment; filename=Tadpole_Randomization.txt";
			
				Response.ClearContent();
				Response.AddHeader("content-disposition", attachment);
				Response.ContentType = "application/vnd.ms-TabDelim";
				string tab = "";
				foreach (DataColumn dc in dtTabDelim.Columns)
				{
					Response.Write(tab + dc.ColumnName);
					tab = "\t";
				}
				Response.Write("\n");

				int i;
				foreach (DataRow dr in dtTabDelim.Rows)
				{
					tab = "";
					for (i = 0; i < dtTabDelim.Columns.Count; i++)
					{
						Response.Write(tab + dr[i].ToString());
						tab = "\t";
					}
					Response.Write("\n");
				}
				Response.End();

			//}


		}
		catch (SqlException oException)
		{
			//errorLink1.InnerHtml += oException.Message;  //new with full study
			foreach (SqlError oErr in oException.Errors)
			{
				//errorLink1.InnerHtml += oErr.Message;
			}
		}
		#endregion


	}





	protected void PrintRowControlsInfo(GridViewRow row)
	{
		Label lblError = (Label)Master.FindControl("lblInfoLog_Error");

		for (int i = 0; i < row.Cells.Count; i++)
		{
			foreach (Control c in row.Cells[i].Controls)
			{
				if (1 == 1)
				{
					//if (c.GetType() == typeof(TextBox)){
					string strText;
					try { strText = ((TextBox)c).Text; }
					catch { strText = "---"; }
					lblError.Text += " ..." + c.ID + " [" + strText + "]";
				}
			}
		}
	}


}