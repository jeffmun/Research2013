using System;
using System.Collections;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Configuration;
using System.IO;
using uwac;

public partial class DataEntryForms_Common_MIND_IntHx_v2stack : System.Web.UI.Page
{
	public DataTable dt = new DataTable();
	public string _sortDirection;
	public string id;


	/// SQL TABLES USED:
	///  t1) ALL_MIND_IntHx_vers2_stacked 
	/// 
	/// 
	/// SQL PROCS USED:
	/// 
	/// **Editing/Viewing a single subject**
	///     page: /dataentryforms/common/MIND_IntHx_v2stack/MIND_IntHx_v2stack.aspx
	/// 
	/// 1) Load data for display
	///     spALL_MIND_IntHx_vers2_stacked_for_display  (t1)
	///     spHaveUWmethodRawScan
	///     vwALL_MIND_IntHx_vers2_Stacked__IDlist   (t1)       get ID's to select a new subject
	///      
	/// 2) Display the Chart
	/// 
	///     -- just displays the chart images already created
	///     
	/// 
	/// 3) Modify Data
	///     spSCORE_All_Mind_IntHx_vers2_STACKED
	///		  -- this proc calls "spSCORE_All_Mind_IntHx_vers2_STACKED__Process" at the end of it, for the person and TYPE
	///       -- when data is modified, charts are automatically updated by code called by this page
	///     
	/// ----------------------------------------------------------------------------
	/// 
	/// **Displaying charts for a whole study**
	///    page:   /stats/IntHxCharts.aspx
	/// 
	/// A) Load the data for creating the chart
	///     spSCORE_ALL_MIND_IntHx_vers2_STACKED__getdata_for_CHARTS                {gets the raw data (dataset with 6 tables & admin dates & color info)}
	/// 
	///     spSCORE_ALL_MIND_IntHx_vers2_STACKED__getdata_for_DESCSTATS
	///
	/// B) Recreate Charts / Rescore Data
	/// 
	///     -- Recreate all the charts for the whole study
	/// 
	///     -- Rescore all the weekly data and then aggregate
	///         spSCORE_All_Mind_IntHx_vers2_STACKED__Process     {includes a parameter which allows you to rescore by record, ID, or WHOLESTUDY
	/// 
	/// ----------------------------------------------------------------------------
	/// 
	/// **Exporting data**
	/// 
	/// dp.spALL_MIND_IntHx_vers2_STACKED__getdata_for_EXPORT
	///  





	#region 0) Page events
	//raise events on content page for the buttons on master page
	protected void Page_Init(object sender, EventArgs e)
	{
		Master.DDL_Master_SelectStudyID.SelectedIndexChanged += new EventHandler(Master_Study_Changed);
	}

	//If the master page default study is changed, update the Measure DDL
	protected void Master_Study_Changed(object sender, EventArgs e)
	{
		//string mappath = Server.MapPath("~/dataentryforms/common/MIND_IntHx_v2stack/MIND_IntHx_v2stack.aspx");

		Response.Redirect("MIND_IntHx_v2stack.aspx");

		if (Master.Master_studyIDfull == 90000) rblPeriodType.Visible = true;
		else rblPeriodType.Visible = false;
	}


	protected void Page_Load(object sender, EventArgs e)
	{
		string id = "";
		string intvwr = Request.QueryString["ihintervwr"];
		string date = Request.QueryString["ihdate"];

		if (Master.Master_studyIDfull == 90000) rblPeriodType.Visible = true;
		else rblPeriodType.Visible = false;

		if (!IsPostBack)
		{
			//Load the studymeas DDL
			PopulateStudymeasDDL();

			//Load the ID's for selecting a new subject
			PopulateNewIDDDL();

			if (ViewState["mode"] == null) ViewState["mode"] = "AddNew";

			if (ViewState["id"] != null)
			{
				id = ViewState["id"].ToString();
			}
			else if (!string.IsNullOrEmpty(Request.QueryString["id"]))
			{
				id = Request.QueryString["id"];
			}

			
			if (id != "")
			{
				//Get the IntHx data for the GridView
				PopulateGV(id);

				//PopulateChart(id);
				DisplayIntHxCharts(Master.Master_studyID, id);

				ddlNewID.SelectedValue = id;

				lblID.Text = id;

			}

			ddlMS.DataBind();
			ddlMSD.DataBind();
			ddlMSD.Items.FindByValue("51").Selected = true;


		}
		else
		{
			if(ViewState["dt"]!=null)
			{
				dt = (DataTable)ViewState["dt"];
				gvRawData.DataSource = dt;
				gvRawData.DataBind();
			}
		}

		if(intvwr!=null)
		{
			txtInterviewer.Text = intvwr;
		}
		if(date!=null)
		{
			txtDate.Text = date;
		}

	}
	#endregion 
	//0



	#region 1) Load data for display
	protected void PopulateGV(string id)
	{
		int getall = 1;  //adjust this if needed.

		SQL_utils sql = new SQL_utils();
		DataTable dt = sql.DataTable_from_SQLstring("exec spALL_MIND_IntHx_vers2_stacked_for_display " + Master.Master_studyID.ToString() + ",'" + id + "'," + getall.ToString());
		sql.Close();

		ViewState["dt"] = dt;
		gvRawData.DataSource = dt;
		gvRawData.DataBind();

		lblRawData_nrecs.Text = dt.Rows.Count.ToString() + " records.";


		SQL_utils sql1 = new SQL_utils("backend");
		string groupname = sql1.StringScalar_from_SQLstring("select groupname from vwMasterStatus_S where studyID=" + Master.Master_studyID.ToString() + " and ID='" + id + "'");
		lblGroup.Text = groupname;


		int hasscan = sql1.IntScalar_from_SQLstring("exec uwautism_research_data.dbo.spHaveUWmethodRawScan '" + id + "'");

		if (hasscan == 1)
		{
			linkRawData.NavigateUrl = "~/dataentryforms/common/MIND_IntHx_v2stack/scans/UW_method_" + id + "_reduced.pdf";
			linkRawData.Visible = true;
		}

		LoadSMS(sql1, id);
		sql1.Close();

	}



	protected void LoadSMS(SQL_utils sql, string id)
	{
		//Get the Tracking info
		string sqlSMS = "select studymeassubjID, studyname, studymeasname, measstatus, measstatusdetail, convert(varchar,measuredatedone,101) as date from vwMasterStatus_M " +
			" where studymeasID in " +
			" (select studymeasID from tblstudymeas where measureID=749) " +
			" and personID = (select personID from vwMasterStatus_S where studyID=" + Master.Master_studyID.ToString() + " and ID='" + id + "') order by studyID, sortorder ";

		DataTable dtSMS = sql.DataTable_from_SQLstring(sqlSMS);

		ogridSMS.DataSource = dtSMS;
		ogridSMS.DataBind();
	}



	protected void ddlMS_OnSelectedIndexChanged(object sender, EventArgs e)
	{
		ddlMSD.DataBind();
	}

	protected void btnUpdateSMS_OnClick(object sender, EventArgs e)
	{
		int numselected = ogridSMS.SelectedRecords.Count;

		ArrayList sel = ogridSMS.SelectedRecords;


		List<string> pks = new List<string>();

		if (numselected > 0)
		{
			for(int i=0; i < numselected; i++)
			{
				Hashtable vals = (Hashtable)sel[i];
				pks.Add(vals["studymeassubjID"].ToString());
			}
		}

		string sqlcode = String.Format("update tblstudymeassubj set measstatusID={0}, measstatusdetailID={1}, date='{2}' where studymeassubjID in ({3})",
				ddlMS.SelectedValue.ToString(), ddlMSD.SelectedValue.ToString(), txtSMSdate.Text, String.Join(",", pks.AsEnumerable()));

		SQL_utils sql = new SQL_utils("backend");
		sql.NonQuery_from_SQLstring(sqlcode);

		LoadSMS(sql, Request.QueryString["id"]);
		sql.Close();

	}


	protected void ogridSMS_OnRowDataBound(object sender, Obout.Grid.GridRowEventArgs e)
	{
		if (e.Row.RowType == Obout.Grid.GridRowType.DataRow)
		{
			string txt = e.Row.Cells[4].Text;
			bool b1 = txt.Contains("Valid");
			bool b2 = txt.Contains("Checked");
			if (txt.Contains("Valid" ) && txt.Contains( "Checked"))
			{
				e.Row.Cells[4].BackColor = Color.MediumPurple;
			}
		}
	}


		protected void gvRawData_RowDataBound(object sender, GridViewRowEventArgs e)
	{
		if (e.Row.RowType == DataControlRowType.DataRow)
		{
			Label pk = (Label)e.Row.FindControlRecursive("mindinthxv2stackPK");


			DataRowView dr = (DataRowView)e.Row.DataItem;
			string txtypecolor = "#" + dr["txtypecolor"].ToString();

			string studyname = dr["studyname"].ToString();

			if(studyname != Master.Master_studyname)
			{
				Button btn = (Button)e.Row.Cells[4].FindControl("btnEdit");
				btn.Enabled = false;
			}

			e.Row.Cells[7].BackColor = System.Drawing.ColorTranslator.FromHtml(txtypecolor);


			//lblInfo.Text += pk.Text + " ";
			if (pk.Text != "" & pk.Text != null)
			{
				if (pk.Text == txtpk.Text)
				{
					e.Row.BackColor = Color.Honeydew;
				}
			}

			Button b = (Button)e.Row.FindControlRecursive("btnEdit");

			if (ViewState["mode"] == "Edit")
			{
				b.Visible = false;
			}
			else
			{
				b.Visible = true;
			}
		}
	}


	protected void PopulateNewIDDDL()
	{
		SQL_utils sql = new SQL_utils("data");
		string s;

		s = "select '' as ID, '--Select New ID--' IDtxt union select ID, IDtxt from vwALL_MIND_IntHx_vers2_Stacked__IDlist where studyID = " + Master.Master_studyID.ToString();

		DataTable dtIDs = sql.DataTable_from_SQLstring(s);

		ddlNewID.DataSource = dtIDs;
		ddlNewID.DataBind();
	}

	protected void PopulateStudymeasDDL()
	{
		SQL_utils sql = new SQL_utils("data");

		//string s = "select studymeasID, studymeasname from uwautism_research_backend..tblstudymeas  " +
		//    " where measureID = 749 and studyID = " + Master.Master_studyID.ToString();

		string s = "select studymeasID, studymeasname from " +
		" (select coalesce(fullstudyID * 10000, studyID) as studyIDfull, * from uwautism_research_backend..vwStudymeas a" +
		" where measureID = 749 and coalesce(fullstudyID * 10000, studyID) =" +
		" (select coalesce(fullstudyID * 10000, studyID) as studyIDfull" +
		" from uwautism_research_backend..tblstudy where studyID=" + Master.Master_studyID.ToString() + ") " +
		" ) b order by studyID, timepoint, studymeasname";


		DataTable dt = sql.DataTable_from_SQLstring(s);

		ddlStudymeas.DataSource = dt;
		ddlStudymeas.DataBind();

		sql.Close();
	}
	#endregion  1)
	//1 


	#region 2) Display the Chart
	
	protected void DisplayIntHxCharts(int studyID, string id)
	{

		if (id == null | id == "")
		{
			id = Request.QueryString["id"];
		}

		id = id.ToLower();


		List<string> selectedCharts = cblCHARTS.Items.Cast<System.Web.UI.WebControls.ListItem>()
					   .Where(li => li.Selected)
					   .Select(li => li.Value)
					   .ToList();

		string path = ("~/stats/Charts/");


		string periodtype = rblPeriodType.SelectedValue;

		if (periodtype == "Timepoint" | periodtype == "Both")
		{
			utilIntHx.DisplayIntHxCharts(path, studyID, id, selectedCharts, "Timepoint", panelChart);
		}
		if (periodtype == "TxStart" | periodtype == "Both")
		{
			utilIntHx.DisplayIntHxCharts(path, studyID, id, selectedCharts, "TxStart", panelChart2);
		}

	}

	protected System.Web.UI.WebControls.Image GetIntHxChart(string chartfile)
	{
		int rand = new Random().Next(99999999);

		System.Web.UI.WebControls.Image img = new System.Web.UI.WebControls.Image();
		img.ImageUrl = string.Concat(chartfile, '?', rand);

		return img;
	}


	#endregion 
	//2


	#region 3) Modify Data

	protected void ModifyData(string mode, string stackpk)
	{
		lblValidate.Text = "";

		//Validate the data first:
		string dateA = txtihdatebeg.Text;
		string dateB = txtihdateend.Text;

		string valid_text= "";

		DateTime dA; DateTime dB;

		if (DateTime.TryParse(txtihdatebeg.Text, out dA))
		{
			if(dA  <  Convert.ToDateTime("1/1/1990"))
			{ valid_text = "Start must be after 1/1/1990. "; }
			else if  ( dA > System.DateTime.Now)
			{valid_text += "Start cannot be in the future. ";}
		}
		else { valid_text += "Start must be a valid date. ";  }

		if (DateTime.TryParse(txtihdateend.Text, out dB))
		{
			if (dB < Convert.ToDateTime("1/1/1990"))
			{ valid_text = "End must be after 1/1/1990. "; }
			else if (dB > System.DateTime.Now)
			{ valid_text += "End cannot be in the future. "; }
		}
		else { valid_text += "End must be a valid date. "; }

		if (dA > dB) { valid_text += "Start must be before End. "; }

		double units = 0;
		if(Double.TryParse(txtnumunits.Text, out units))
		{
			if(units <= 0)
			{ valid_text += "Units must be > 0"; }
		}
		else
		{
			valid_text += "Units must be > 0";
		}

		if (valid_text == "")
		{


			SQL_utils sql = new SQL_utils();
			List<SqlParameter> p = new List<SqlParameter>();

			string date1 = (txtDate.Text == "") ? "1/1/1900" : txtDate.Text;
			string intervwr = txtInterviewer.Text;
			string dtBeg = (txtihdatebeg.Text == "") ? "1/1/1900" : txtihdatebeg.Text;
			string dtEnd = (txtihdateend.Text == "") ? "1/1/1900" : txtihdateend.Text;
			string classa = (txtihclassa.Text == "") ? "-9" : txtihclassa.Text;
			string classc = (txtihclassc.Text == "") ? "-9" : txtihclassc.Text;
			string numunits = (txtnumunits.Text == "") ? "-9" : txtnumunits.Text;


			// create data values parameters
			p.Add(sql.CreateParam("studyID", Master.Master_studyID.ToString(), "int"));
			p.Add(sql.CreateParam("mode", mode, "text"));
			p.Add(sql.CreateParam("mindinthxv2stackPK", stackpk, "int"));

			p.Add(sql.CreateParam("id", Request.QueryString["id"], "text"));
			p.Add(sql.CreateParam("studymeasID", ddlStudymeas.SelectedValue, "int"));
			p.Add(sql.CreateParam("ihdate", date1, "date"));
			p.Add(sql.CreateParam("ihintervwr", intervwr, "text"));

			p.Add(sql.CreateParam("ihtypenum", ddl1.SelectedIndex.ToString(), "int"));
			p.Add(sql.CreateParam("ihname", txtihname.Text, "text"));
			p.Add(sql.CreateParam("ihsetting", txtihsetting.Text, "text"));
			p.Add(sql.CreateParam("ihdatebeg", dtBeg, "date"));
			p.Add(sql.CreateParam("ihdateend", dtEnd, "date"));
			p.Add(sql.CreateParam("ihnumunits", numunits, "float"));
			p.Add(sql.CreateParam("ihunits_code", ddl2.SelectedValue.ToString(), "int"));
			p.Add(sql.CreateParam("ihgrpind", ddl3.SelectedValue.ToString(), "text"));
			p.Add(sql.CreateParam("ihclassa", classa, "int"));
			p.Add(sql.CreateParam("ihclassc", classc, "int"));
			p.Add(sql.CreateParam("ihprovid", ddl4.SelectedValue.ToString(), "int"));
			p.Add(sql.CreateParam("ihdetails", txtdetails.Text, "text"));



			sql.NonQuery_from_ProcName("spSCORE_All_Mind_IntHx_vers2_STACKED", p);

			string id = ddlNewID.SelectedValue.ToString();
			utilIntHx.SaveIntHxCharts(sql, Master.Master_studyID, id, Server.MapPath("~/stats/charts/"), "Timepoint", 110);

			if (Master.Master_studyIDfull == 90000)
			{
				utilIntHx.SaveIntHxCharts(sql, Master.Master_studyID, id, Server.MapPath("~/stats/charts/"), "TxStart", 60);
			}

			sql.Close();

			ResetControls();


			string url = "~/dataentryforms/common/MIND_IntHx_v2stack/MIND_IntHx_v2stack.aspx?id=" + id +
				"&ihdate=" + date1 + "&ihintervwr=" + intervwr;

			Response.Redirect(url);
		}
		else
		{
			lblValidate.Text = valid_text;
		}

	}
	#endregion 
	//3

	#region 4) Respond to user controls
	protected void btnUpdate_Click(object sender, EventArgs e)
	{
		ModifyData("UPDATE", txtpk.Text);
	}
	
	protected void btnAddNew_Click(object sender, EventArgs e)
	{
		ModifyData("INSERT", "0");
	}

	protected void btnCancel_Click(object sender, EventArgs e)
	{
		ResetControls();
		ViewState["mode"] = "AddNew";
	}


	protected void btnEdit_Command(object sender, CommandEventArgs e)
	{
		SQL_utils sql = new SQL_utils();

		if (e.CommandName == "Delete")
		{
			int pk = Convert.ToInt32(e.CommandArgument);

			if (pk > 0)
			{
				List<SqlParameter> ps = new List<SqlParameter>();
				ps.Add(sql.CreateParam("mindinthxv2stackPK", e.CommandArgument.ToString(), "int"));
				sql.NonQuery_from_ProcName("spDELETE_All_Mind_IntHx_vers2_STACKED", ps);

				//ModifyData("DELETE", e.CommandArgument.ToString());

				string id = ddlNewID.SelectedValue.ToString();
				utilIntHx.SaveIntHxCharts(sql, Master.Master_studyID, id, Server.MapPath("~/stats/charts/"), "Timepoint", 60);

				if (Master.Master_studyIDfull == 90000)
				{
					utilIntHx.SaveIntHxCharts(sql, Master.Master_studyID, id, Server.MapPath("~/stats/charts/"), "TxStart", 60);
				}


				string url = "~/dataentryforms/common/MIND_IntHx_v2stack/MIND_IntHx_v2stack.aspx?id=" + id;

				Response.Redirect(url);

			}
		}
		else if(e.CommandName=="Edit")
		{
			ViewState["mode"] = "Edit";

			//Populate the controls for editing
			DataTable dt = sql.DataTable_from_SQLstring("select * from vwALL_MIND_IntHx_vers2_stacked_for_display " + 
				" where mindinthxv2stackPK = " + e.CommandArgument.ToString());

			txtpk.Text = dt.Rows[0]["mindinthxv2stackPK"].ToString();
			//txtihtype.Text = dt.Rows[0]["ihtype"].ToString();


			ddl1.SelectedIndex = Convert.ToInt16(dt.Rows[0]["ihtypenum"].ToString()) ;
			txtihname.Text = dt.Rows[0]["ihname"].ToString();
			txtihsetting.Text = dt.Rows[0]["ihsetting"].ToString();
			txtihdatebeg.Text = dt.Rows[0]["ihdatebeg"].ToString().Replace(" 12:00:00 AM", "");
			txtihdateend.Text = dt.Rows[0]["ihdateend"].ToString().Replace(" 12:00:00 AM", "");

			txtnumunits.Text = dt.Rows[0]["ihnumunits"].ToString();

			ddl2.SelectedValue = (dt.Rows[0]["ihunits_code"].ToString()) ;
			ddl3.SelectedValue = (dt.Rows[0]["ihgrpind"].ToString()) ;

			txtihclassa.Text = dt.Rows[0]["ihclassa"].ToString();
			txtihclassc.Text = dt.Rows[0]["ihclassc"].ToString();
			ddl4.SelectedValue = (dt.Rows[0]["ihprovid"].ToString()) ;

			txtdetails.Text = dt.Rows[0]["ihdetails"].ToString();


			PanelHeader.Visible = false;

			Panel1.BackColor = Color.Honeydew;
			btnUpdate.Visible = true;
			btnCancel.Visible = true;
			btnAddNew.Visible = false;

			gvRawData.DataBind();

		}
	}


	protected void ddlNewID_SelectedIndexChanged(object sender, EventArgs e)
	{
		string id = ddlNewID.SelectedValue.ToString();

		ViewState["id"] = id;

		if (id != "--select ID--")
		{
			Response.Redirect("~/dataentryforms/common/MIND_IntHx_v2stack/MIND_IntHx_v2stack.aspx?id=" + id);

			//PopulateGV(id);
			//PopulateChart(id);
		}
	}

	#endregion 
	//4



	protected void ResetControls()
	{

		txtpk.Text = "";
		ddl1.SelectedIndex = 0;
		txtihname.Text = "";
		txtihsetting.Text = "";
		txtihdatebeg.Text = "";
		txtihdateend.Text = "";
		txtnumunits.Text = "";
		ddl2.SelectedIndex = 0;
		ddl3.SelectedIndex = 0;
		txtihclassa.Text = "";
		txtihclassc.Text = "";
		ddl4.SelectedIndex = 0;

		txtdetails.Text = "";

		PanelHeader.Visible = true;
		Panel1.BackColor = Color.AliceBlue;

		btnUpdate.Visible = false;
		btnCancel.Visible = false;
		btnAddNew.Visible = true;

		Response.Redirect(Request.RawUrl);
	}

	

	#region sorting
	protected void gvRawData_Sorting(object sender, GridViewSortEventArgs e)
	{
		string sortExpression = e.SortExpression;
		string direction = string.Empty;

		if (setSortDirection == SortDirection.Ascending)
		{
			setSortDirection = SortDirection.Descending;
			direction = " DESC";
		}

		else
		{
			setSortDirection = SortDirection.Ascending;
			direction = " ASC";
		}


		if (sortExpression.Contains(','))
		{
			dt.DefaultView.Sort = sortExpression.Replace(",", direction + " , ") + direction;
		}
		else
		{
			dt.DefaultView.Sort = sortExpression + direction;
		}

		gvRawData.DataBind();
		//BindToGrid(table);

		string id = ddlNewID.SelectedValue.ToString();
		DisplayIntHxCharts(Master.Master_studyID, id);
	}


	public SortDirection setSortDirection
	{
		get
		{
			if (ViewState["SortDirection"] == null)
			{
				ViewState["SortDirection"] = SortDirection.Ascending;
			}
			return (SortDirection)ViewState["SortDirection"];
		}
		set
		{
			ViewState["SortDirection"] = value;
		}
	}
	#endregion




	protected void btnRefreshCharts_Click(object sender, EventArgs e)
	{
		string id = ddlNewID.SelectedValue.ToString();
		DisplayIntHxCharts(Master.Master_studyID, id);
	}

	protected void btnRecreateCharts_Click(object sender, EventArgs e)
	{
		SQL_utils sql = new SQL_utils();
		string id = ddlNewID.SelectedValue.ToString();

		string path = Server.MapPath("~/stats/charts/");
		utilIntHx.SaveIntHxCharts(sql, Master.Master_studyID, id, Server.MapPath("~/stats/charts/"), "Timepoint", 65);

		if(Master.Master_studyIDfull==90000)
		{
			utilIntHx.SaveIntHxCharts(sql, Master.Master_studyID, id, Server.MapPath("~/stats/charts/"), "TxStart", 60);
		}

		DisplayIntHxCharts(Master.Master_studyID, id);
		sql.Close();

		string url = "~/dataentryforms/common/MIND_IntHx_v2stack/MIND_IntHx_v2stack.aspx?id=" + id;

		Response.Redirect(url);

	}


}