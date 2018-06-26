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

public partial class Info_Tadpole_Randomization : System.Web.UI.Page
{
	private SqlConnection oConn = new SqlConnection();
	private ReadConfig oConfig = new ReadConfig();
	DBLookup oDBLookup = new DBLookup();

	#region PAGE STUFF: Init / Load ============================
	//raise events on content page for the buttons on master page
	protected void Page_Init(object sender, EventArgs e)
	{
		Label lblError = (Label)Master.FindControl("lblInfoLog_Error");
		lblError.Text += "<br/>==PageInit";

		Load_TadpoleRandomization(); 
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

		Label lblError = (Label)Master.FindControl("lblInfoLog_Error");

		if (IsPostBack) { lblError.Text += "<br/>==PageLoad: IsPostBack"; }

		if (!IsPostBack) { lblError.Text += "<br/>==PageLoad: !IsPostBack";

		
		}


	}

	#endregion


	#region LOAD DATA ====================================================

	protected void Load_TadpoleRandomization()
	{
		//need to build a Form View with the same # of fields that looks like the GridView
		// see:  http://forums.asp.net/t/1800561.aspx 
		//

		Label lblError = (Label)Master.FindControl("lblInfoLog_Error");
		lblError.Text += "<br/>********* Load_TadpoleRandomization()"; 

	   GridView agv = new AutoGridView("backend", "vw_Randomization_Tadpole order by site, ID",  "gv_Randomization_Tadpole", true, "",
			",,,,,,,,,gvGray,gvGray,gvGray,gvGray"); 
			//DataTable dt = oDBLookup.GetView("_AutoGrid_testtable");

		   // Session["dataTable"] = dt;

	   agv.RowEditing += new GridViewEditEventHandler(gv_Randomization_Tadpole_RowEditing);
	   agv.RowUpdating += new GridViewUpdateEventHandler(gv_Randomization_Tadpole_RowUpdating);     /* <-- needs the buttons to have CausesValidation=false */
	   agv.RowCancelingEdit += new GridViewCancelEditEventHandler(gv_Randomization_Tadpole_RowCancelingEdit);

		agv.RowCommand += new GridViewCommandEventHandler(gv_Randomization_Tadpole_RowCommand);

		agv.FooterRow.BackColor = Color.SlateBlue;

		//Panel1.Controls.Clear();
		//Panel1.Controls.Add(agv);

		UpdatePanel1.ContentTemplateContainer.Controls.Clear();
		UpdatePanel1.ContentTemplateContainer.Controls.Add(agv);


		//lblError.Text += "<br/> $$$  DataKeyNames = " + agv.DataKeyNames.ToString();
		//lblError.Text += "<br/> $$$  DataKeyNames = " + agv.DataKeyNames[0].ToString();

	   
	}

	#endregion


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

		 TextBox txtTime1a_agemos   = (TextBox)fv_NewRecord.FindControl("txtTime1a_agemos");
		 TextBox txtFullScaleDQ     = (TextBox)fv_NewRecord.FindControl("txtFullScaleDQ");
		 TextBox txtTime1a_date     = (TextBox)fv_NewRecord.FindControl("txtTime1a_date");
		 TextBox txtAssignment_date = (TextBox)fv_NewRecord.FindControl("txtAssignment_date");
		 TextBox txtNotes           = (TextBox)fv_NewRecord.FindControl("txtNotes");
		
		 String valcheck = "";

		if (ddlSite.SelectedValue.StartsWith("-")) {
			valcheck += " Site";
		}
		if (ddlSex.SelectedValue.StartsWith("-")) {
			valcheck += " Sex";
		}

		if (valcheck != "")
		{
			Label lblError = (Label)Master.FindControl("lblInfoLog_Error");

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
			cmd.Parameters.Add("Time1a_agemos", SqlDbType.Int);
			cmd.Parameters.Add("FullScaleDQ", SqlDbType.Float);
			cmd.Parameters.Add("Time1a_date", SqlDbType.VarChar, 10);
			cmd.Parameters.Add("Assignment_date", SqlDbType.VarChar, 10);
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


				Load_TadpoleRandomization();
				InsertRecord_Cancel();
		
			}
			catch (SqlException exc)
			{
				Label lblError = (Label)Master.FindControl("lblInfoLog_Error");

				lblError.Text = exc.Message;
			}
		}




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

		Label lblError = (Label)Master.FindControl("lblInfoLog_Error");
		lblError.Text = "";

	}


	#endregion


	#region UPDATE RECORD =========================================
	protected void gv_Randomization_Tadpole_RowEditing (object sender, GridViewEditEventArgs e)
	{
		GridView gv = (GridView)Panel1.FindControl("gv_Randomization_Tadpole");

		gv.EditIndex = e.NewEditIndex;
		gv.DataBind();
		Label lblError = (Label)Master.FindControl("lblInfoLog_Error");
		lblError.Text += "<br/>+++ here at gv_Randomization_Tadpole_RowEditing   newEditIndex = " + e.NewEditIndex.ToString() + "<br/><br/><br/>";

		GridViewRow row = gv.Rows[e.NewEditIndex];

	   // PrintRowControlsInfo(row);

 

	}


	protected void gv_Randomization_Tadpole_RowUpdating(object sender, GridViewUpdateEventArgs e)
	{
		GridView gv = (GridView)Panel1.FindControl("gv_Randomization_Tadpole");
		
		Label lblError = (Label)Master.FindControl("lblInfoLog_Error");
		lblError.Text += "<br/>+++here at gv_Randomization_Tadpole_RowUpdating  RowIndex = " + e.RowIndex.ToString() + "<br/><br/><br/>";

		lblError.Text += "<br/>  NUMKEYS = " + e.Keys.Count.ToString();

		//lblError.Text += "<br/>  DataKey for this row = " + gv.DataKeys[e.RowIndex].Value.ToString();



		for (int i = 0; i < gv.Columns.Count; i++)
		{
			lblError.Text += "<br/>loop A " + i.ToString();
			DataControlFieldCell cell = gv.Rows[e.RowIndex].Cells[i] as DataControlFieldCell;
			gv.Columns[i].ExtractValuesFromCell(e.NewValues, cell, DataControlRowState.Edit, true);
			lblError.Text += "<br/>loop A " + i.ToString() + "   len NewValues=" + e.NewValues.Count.ToString();

		}


		for (int j = 0; j < e.NewValues.Count; j++)
		{
			lblError.Text += "<br/>loop B " + j.ToString();
			lblError.Text += "  >>>>  new=" + e.NewValues[j].ToString() + " old=" + e.OldValues[j].ToString() + "<br/>";
		}


		lblError.Text += "<br/> ====== pre databind ======= ";
		GridViewRow row = gv.Rows[e.RowIndex];
		//PrintRowControlsInfo(row);

		foreach (TableCell cell in row.Cells)
		{
			foreach (Control ctl in cell.Controls)
			{
				string theID = "noID";
				if (ctl.ID != null) theID = ctl.ID;
				lblError.Text += "<br/> ======>>>>>>>>>  " + ctl.GetType().ToString() + "        " + theID;
				if (ctl.ID == "TxGroup")
				{
					//TextBox txtbox = (TextBox)ctl;
					//lblError.Text += "<br/> ======>>>>>>>>>  " + ctl.GetType().ToString() + "        " + ctl.ID.ToString();
				}
			}
		}


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

	protected void gv_Randomization_Tadpole_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
	{
		GridView gv = (GridView)Panel1.FindControl("gv_Randomization_Tadpole");
		
		Label lblError = (Label)Master.FindControl("lblInfoLog_Error");
		lblError.Text += "<br/>+++here at gv_Randomization_Tadpole_RowCancelingEdit  RowIndex = " + e.RowIndex.ToString() + "<br/>";

		e.Cancel = true;
		gv.EditIndex = -1;
		gv.DataBind();

	}

	#endregion



	protected void gv_Randomization_Tadpole_RowCommand(object sender, GridViewCommandEventArgs e)
	{
		GridView gv = (GridView)Panel1.FindControl("gv_Randomization_Tadpole");
		//GridViewRow gvr = (GridViewRow)(((LinkButton)e.CommandSource).NamingContainer);
		GridViewRow gvr = (GridViewRow)(((Button)e.CommandSource).NamingContainer);
		int index = gvr.RowIndex;

		Label lblError = (Label)Master.FindControl("lblInfoLog_Error");
		lblError.Text += "<br/>+++ here at RowCommand   cmd = " + e.CommandName + "......... arg = " + e.CommandArgument.ToString() + " ..... index=" + index.ToString() + "<br/><br/><br/>";

		switch (e.CommandName)
		{
			case "Edit":
				gv.EditIndex = index;
				break;

		}


		//int index = Int16.Parse(e.CommandArgument.ToString());

		//GridViewRow row = gv.Rows[index];
		//PrintRowControlsInfo(row);

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
					lblError.Text += "..... " + c.ID + "  " + c.GetType().ToString() + "       text=" + strText + "<br/>";
				}
			}
		}
	}


}