using System;
using System.Collections;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Configuration;
using System.Web.Services;
using uwac;
using Obout.Grid;
using Obout.ListBox;
using Obout.Interface;
using SelectPdf;
using iTextSharp.text;
using iTextSharp.text.xml;
using iTextSharp.text.pdf;
using iTextSharp.text.factories;



/*
 * to do
 * 
 * take stuff from descstats.aspx 
 *   - select groups
 *   - select measures
 *     but include measures from all full studies
 *     
 * save these selected things to the "dp" tables
 * 
 * 
 * */

public partial class stats_DataProject_Add : System.Web.UI.Page
{
	//DataTable dt_studymeas = new DataTable();

	//raise events on content page for the buttons on master page
	protected void Page_Init(object sender, EventArgs e)
	{
		Master.DDL_Master_SelectStudyID.SelectedIndexChanged += new EventHandler(Master_Study_Changed);
	}

	//If the master page default study is changed, update the Measure DDL
	protected void Master_Study_Changed(object sender, EventArgs e)
	{
		Response.Redirect("~/stats/DataProject.aspx");
	}

	//public override void VerifyRenderingInServerForm(Control control)
	//{
	//    /* Verifies that the control is rendered */
	//}



	protected void Page_Load(object sender, EventArgs e)
	{
		int dataproj_pk;

		if (IsPostBack)
		{
			//Load the ViewState - this populates the GridViews with the checkboxes
			if (ViewState["dt_group_by_subjstatus"] != null)
			{
				gvSubjects.DataSource = (DataTable)ViewState["dt_group_by_subjstatus"];
				gvSubjects.DataBind();
			}
		}

		if (!IsPostBack)
		{
			if (gridProjects.SelectedRecords != null)
			{
				int pk = 0;
				foreach (Hashtable oRecord in gridProjects.SelectedRecords)
				{
					foreach (DictionaryEntry d in oRecord)
					{
						if (d.Key.ToString() == "dataproj_pk")
						{
							pk = Convert.ToInt16(d.Value);
						}
					}
				}

				LoadProjects(pk);
				btnBackToAll.Visible = false;
				btnDeleteProject.Enabled = false;
				btnDeleteProject.Visible = false;

			}


			else if (Request.QueryString["pk"] != null)
			{
				dataproj_pk = Convert.ToInt16(Request.QueryString["pk"].ToString());
				LoadProjects(dataproj_pk);

				btnBackToAll.Visible = true;
				if (Master.AutismLogin.LoginID.ToString() == "jeffmun")
				{ 
					btnDeleteProject.Enabled = true;
					btnDeleteProject.Visible = true;

					btnPDF.Visible = true;

				}
			}
			else
			{
				LoadProjects(0);
				btnBackToAll.Visible = false;
				btnDeleteProject.Enabled = false;
				btnDeleteProject.Visible = false;

				btnPDF.Visible = false;
			}

			LoadTimepointDDL();
		}

		else
		{
			LoadTimepointDDL();
			LoadMeasureDDL();

			if (hidMeasureID.Value != "")
			{
				if (ddlMeasure.Items.Count > 1)
				{
					ddlMeasure.SelectedValue = hidMeasureID.Value;
				}
			}
		}
	}


	#region LOAD data
	protected void LoadProjects(int dataproj_pk)
	{
		SQL_utils sql = new SQL_utils();
		DataTable dt = new DataTable();
		if (dataproj_pk == 0)
		{
			dt = sql.DataTable_from_SQLstring("select * from dp.vwDataProject where studyID = " + Master.Master_studyID.ToString());
			gridProjects.DataSource = dt;
			gridProjects.DataBind();
			gridProjects.Visible = true;
			panelDetails.Visible = false;

		}
		else if (dataproj_pk > 0)
		{
			dt = sql.DataTable_from_SQLstring("select dataproj_pk, projTitle, coalesce(projSummary,'** To Complete **') projSummary from dp.vwDataProject where dataproj_pk = " + dataproj_pk.ToString());

			editor.Content = dt.Rows[0].Field<string>("projSummary");

			lblTitle.Text = dt.Rows[0].Field<string>("projTitle");
			litSummary.Text = dt.Rows[0].Field<string>("projSummary");

			LoadSubjects(dataproj_pk, sql);
			//LoadApprovers(dataproj_pk, sql);
			LoadStaff(dataproj_pk, sql);
			LoadHypoth(dataproj_pk, sql);

			panelDetails.Visible = true;
			gridProjects.Visible = false;

			panelVIEWproj.Visible = true;
			panelEDITproj.Visible = false;

		}

		//Load the ViewState - this populates the GridViews with the checkboxes
		if (ViewState["dt_group_by_subjstatus"] != null)
		{
			gvSubjects.DataSource = (DataTable)ViewState["dt_group_by_subjstatus"];
			gvSubjects.DataBind();
		}

		if (!IsPostBack)
		{
			//LoadRadioButtonLists();
			ShowSubjects(Master.Master_studyID);
			//ShowStudyMeas(Master.Master_studyID);
		}


		sql.Close();
	}


	protected void LoadSubjects(int dataproj_pk, SQL_utils sql)
	{
		DataTable dt = sql.DataTable_from_SQLstring("select [Group], N from dp.vwDataProject_Group_Ns where dataproj_pk = " + dataproj_pk.ToString());
		gvViewSubjects.DataSource = dt;
		gvViewSubjects.DataBind();

	}
	protected void LoadApprovers(int dataproj_pk, SQL_utils sql)
	{
		//SQL_utils sql = new SQL_utils();
		DataTable dt = new DataTable();
		if (dataproj_pk > 0)
		{

			List<SqlParameter> p = new List<SqlParameter>();
			p.Add(sql.CreateParam("studyID", Master.Master_studyID.ToString(), "int"));
			p.Add(sql.CreateParam("dataproj_pk", dataproj_pk.ToString(), "int"));


			dt = sql.DataTable_from_ProcName("dp.spGetApprovers", p);

			

			gridApprover.DataSource = dt;
			gridApprover.DataBind();

			//dt = sql.DataTable_from_SQLstring("select a.*, firstname + ' ' + lastname as apprName from dp.Approver a join " + 
			//    " uwautism_research_backend..tblstaff b ON a.staffID = b.staffID where  dataproj_pk = " + dataproj_pk.ToString());
		}

		//sql.Close();
	}

	protected void LoadStaff(int dataproj_pk, SQL_utils sql)
	{
		//SQL_utils sql = new SQL_utils();
		DataTable dt = new DataTable();
		if (dataproj_pk > 0)
		{
			dt = sql.DataTable_from_SQLstring("select dpstaff_pk, a.staffID, firstname + ' ' + lastname staffname, Role, RoleComments, PctComplete " +
				" from dp.Staff a join uwautism_research_backend..tblstaff b ON a.staffID = b.staffID" + 
				" where  dataproj_pk = " + dataproj_pk.ToString());
		}


		gridStaff.DataSource = dt;
		gridStaff.DataBind();
		//sql.Close();
	}

	protected void LoadHypoth(int dataproj_pk, SQL_utils sql)
	{
		//SQL_utils sql = new SQL_utils();
		DataTable dt = new DataTable();
		if (dataproj_pk > 0)
		{
			dt = sql.DataTable_from_SQLstring("select * from dp.Hypoth where   dataproj_pk = " + dataproj_pk.ToString());
		}

		gridHypoth.DataSource = dt;
		gridHypoth.DataBind();
		//sql.Close();
	}

	protected void LoadVars(int measureID)
	{
		//int studymeasID = Convert.ToInt16(ddlStudyMeas.SelectedValue);
		if (measureID > 0)
		{

			int zeroforall = (chkAllVars.Checked) ? 0 : 1;

			SQL_utils sql = new SQL_utils();
			DataTable dt = sql.DataTable_from_SQLstring("exec dp.spGetVars_for_meas " + measureID.ToString() + ", " + zeroforall.ToString());

			gridStudymeasVars.DataSource = dt;
			gridStudymeasVars.DataBind();

			btnSaveVars.Enabled = true;
		}

	}

	protected void LoadTimepointDDL()
	{
		SQL_utils sql = new SQL_utils();
		DataTable dt = sql.DataTable_from_SQLstring("exec dp.spGetTimepoints_by_Study " + Master.Master_studyID.ToString());


		lstTimepoint.Items.Clear();

		lstTimepoint.DataSource = dt;
		lstTimepoint.DataTextField = "timepoint_text";
		lstTimepoint.DataValueField = "timepointID";
		lstTimepoint.DataBind();


		sql.Close();
	}

	//protected void LoadMeasureDDL()
	//{

	//    //if(int.Parse(hidTimepointID.Value.ToString())>0)
	//    //{


	//    if (Master.Master_studyID > 0)
	//    {

	//        SQL_utils sql = new SQL_utils();
	//        DataTable dt = sql.DataTable_from_SQLstring("select 0 measureID, 'Select measure...' measname union select measureID, measname from uwautism_research_backend..tblMeasure " +
	//            " where measureID in (select measureID from uwautism_research_backend..tblStudyMeas where studyID = " + Master.Master_studyID.ToString() +
	//            " ) order by measname");

	//        ddlMeasure.DataSource = dt;
	//        ddlMeasure.DataTextField = "measname";
	//        ddlMeasure.DataValueField = "measureID";
	//        ddlMeasure.SelectedValue = "0";
	//        ddlMeasure.DataBind();
	//        sql.Close();
	//    }
	//}

	protected void LoadMeasureDDL()
	{

		//if(int.Parse(hidTimepointID.Value.ToString())>0)
		//{


		if (Master.Master_studyID > 0)
		{

			SQL_utils sql = new SQL_utils();
			DataTable dt = sql.DataTable_from_SQLstring("select 0 measureID, 'Select measure...' measname union select measureID, measname from uwautism_research_backend..tblMeasure " +
				" where measureID in (select measureID from uwautism_research_backend..tblStudyMeas where studyID = " + Master.Master_studyID.ToString() +
				" ) order by measname");

			ddlMeasure.DataSource = dt;
			ddlMeasure.DataTextField = "measname";
			ddlMeasure.DataValueField = "measureID";
			ddlMeasure.SelectedValue = "0";
			ddlMeasure.DataBind();
			sql.Close();
		}
	}

	
	#endregion  //LOAD data


	#region INSERT data
	protected void gridProject_InsertCommand(object sender, Obout.Grid.GridRecordEventArgs e)
	{
		
		int studyID = Master.Master_studyID;
		
		SQL_utils sql = new SQL_utils();
		sql.NonQuery_from_SQLstring("insert into dp.DataProject(studyID, projTitle, projSummary, isDeleted,created,createdBy)" +
			" values(" + studyID.ToString() + ",'" + e.Record["projTitle"].ToString() + "','** to edit **', 0,getdate(), system_user)");


		int newdataproj_pk = sql.IntScalar_from_SQLstring("select max(dataproj_pk) from dp.DataProject");

		List<SqlParameter> p = new List<SqlParameter>();
		p.Add(sql.CreateParam("studyID", studyID.ToString(), "int"));
		p.Add(sql.CreateParam("dataproj_pk", newdataproj_pk.ToString(), "int"));

		sql.NonQuery_from_ProcName("dp.spAddApprovers", p);

		sql.Close();

	}


	protected void gridStaff_InsertCommand(object sender, Obout.Grid.GridRecordEventArgs e)
	{
		oboutGrid_utils o = new oboutGrid_utils();
		e.Record.Add("dataproj_pk", Request.QueryString["pk"].ToString());
		string x = o.oGrid_InsertData(e.Record, "Staff", "data", "dp", "dpstaff_pk", 0);

	}

	protected void gridHypoth_InsertCommand(object sender, Obout.Grid.GridRecordEventArgs e)
	{
		oboutGrid_utils o = new oboutGrid_utils();
		e.Record.Add("dataproj_pk", Request.QueryString["pk"].ToString());
		string x = o.oGrid_InsertData(e.Record, "Hypoth", "data", "dp", "hypoth_pk", 0);

	}

	#endregion // INSERT data


	#region UPDATE data

	protected void gridProject_UpdateCommand(object sender, Obout.Grid.GridRecordEventArgs e)
	{
		string x="";
		if (e.RecordsCollection != null)
		{
			foreach (Hashtable rec in e.RecordsCollection)
			{
				oboutGrid_utils o = new oboutGrid_utils();
				x = o.oGrid_UpdateData(rec, "DataProject", "data", "dp", "dataproj_pk");
			}
		}
		else if (e.Record != null)
		{
			oboutGrid_utils o = new oboutGrid_utils();
			x = o.oGrid_UpdateData(e.Record, "DataProject", "data", "dp", "dataproj_pk");

		}
	}


	protected void gridStaff_UpdateCommand(object sender, Obout.Grid.GridRecordEventArgs e)
	{
		string x = "";
		if (e.RecordsCollection != null)
		{
			foreach (Hashtable rec in e.RecordsCollection)
			{
				oboutGrid_utils o = new oboutGrid_utils();
				x = o.oGrid_UpdateData(rec, "Staff", "data", "dp", "dpstaff_pk");
			}
		}
		else if (e.Record != null)
		{
			int pkval = Convert.ToInt16(e.Record["dpstaff_pk"]);

			oboutGrid_utils o = new oboutGrid_utils();
			x = o.oGrid_UpdateData(e.Record, "Staff", "data", "dp", "dpstaff_pk");

		}
	}


	protected void gridApprover_UpdateCommand(object sender, Obout.Grid.GridRecordEventArgs e)
	{
		string x;
		//int pkval = Convert.ToInt16(e.Record["appr_pk"]);

		e.Record["updated"] = DateTime.Now.ToString();


		e.Record["updatedBy"] = Master.AutismLogin.LoginID.ToString();

		oboutGrid_utils o = new oboutGrid_utils();
		x = o.oGrid_UpdateData(e.Record, "Approver", "data", "dp", "appr_pk");

	}

	protected void gridHypoth_UpdateCommand(object sender, Obout.Grid.GridRecordEventArgs e)
	{
		string x;

		oboutGrid_utils o = new oboutGrid_utils();
		x = o.oGrid_UpdateData(e.Record, "Hypoth", "data", "dp", "hypoth_pk");

	}

	#endregion //UPDATE data


	#region DELETE data

	protected void gridStaff_DeleteCommand(object sender, Obout.Grid.GridRecordEventArgs e)
	{
		
		int pkval = Convert.ToInt16(e.Record["dpstaff_pk"]);

		oboutGrid_utils o = new oboutGrid_utils();
		string x = o.oGrid_DeleteData("Staff", "data", "dp", "dpstaff_pk", pkval);
	}


	protected void gridHypoth_DeleteCommand(object sender, Obout.Grid.GridRecordEventArgs e)
	{
		int pkval = Convert.ToInt16(e.Record["hypoth_pk"]);
		
		//delete the vars first
		SQL_utils sql = new SQL_utils();
		sql.NonQuery_from_SQLstring("delete from dp.Var where hypoth_pk=" + pkval.ToString() );
		sql.Close();

		oboutGrid_utils o = new oboutGrid_utils();
		string x = o.oGrid_DeleteData("Hypoth", "data", "dp", "hypoth_pk", pkval);

	}


	protected void gridVars_DeleteCommand(object sender, Obout.Grid.GridRecordEventArgs e)
	{
		int pkval = Convert.ToInt16(e.Record["hypoth_pk"]);
		string varname = e.Record["varname"].ToString();

		SQL_utils sql = new SQL_utils();
		sql.NonQuery_from_SQLstring("delete from dp.Var where hypoth_pk=" + pkval.ToString() + " and varname ='" + varname + "'");
		sql.Close();

	}


	protected void btnDeleteProject_Click(object sender, EventArgs e)
	{
		SQL_utils sql = new SQL_utils();
		string dataproj_pk = Request.QueryString["pk"];
		sql.NonQuery_from_SQLstring("exec dp.spDataProject_DELETE " + dataproj_pk);
		sql.Close();

		Response.Redirect("~/stats/DataProject.aspx");
	}
	
	#endregion //DELETE data

	#region Rebind objects
	protected void gridProject_Rebind(object sender, EventArgs e)
	{
		LoadProjects(0);
	}
	protected void gridStaff_Rebind(object sender, EventArgs e)
	{
		int dataproj_pk = Convert.ToInt16(Request.QueryString["pk"].ToString());
		SQL_utils sql = new SQL_utils();
		LoadStaff(dataproj_pk, sql);
		sql.Close();
	}
	protected void gridApprover_Rebind(object sender, EventArgs e)
	{
		int dataproj_pk = 9;

		if (Request.QueryString["pk"] != null)
		{
			dataproj_pk = Convert.ToInt16(Request.QueryString["pk"].ToString());
		}
		SQL_utils sql = new SQL_utils();
		LoadApprovers(dataproj_pk, sql);
		sql.Close();
	}

	protected void gridHypoth_Rebind(object sender, EventArgs e)
	{
		int dataproj_pk = Convert.ToInt16(Request.QueryString["pk"].ToString());
		SQL_utils sql = new SQL_utils(); 
		LoadHypoth(dataproj_pk, sql);
		sql.Close();
	}
	#endregion


	#region GRID ROW events
	protected void gridApprover_RowDataBound(object sender, Obout.Grid.GridRowEventArgs e)
	{
		if(e.Row.RowType == Obout.Grid.GridRowType.DataRow)
		{
			//Hashtable hash = e.Row.ToHashtable();

			//if (hash["canedit"].ToString().StartsWith("edit" ))
			//{
			//    e.Row.
			//}

			}

	}


	protected void gridProject_RowCreated(object sender, Obout.Grid.GridRowEventArgs e)
	{
		if (e.Row.RowType == GridRowType.Header)
		{
			Grid currentGrid = (Grid)sender;

			foreach (Column column in currentGrid.Columns)
			{
				if (!column.AllowSorting)
				{
					e.Row.Cells[column.Index].CssClass += " no-sort";
				}
			}
		}

	}
	#endregion //ROW DATA BOUND events


	#region NAVIGATION events

	protected void gridProject_Select(object sender, Obout.Grid.GridRecordEventArgs e)
	{

		Hashtable hash = (Hashtable)e.RecordsCollection[0];

		int dataproj_pk = Convert.ToInt16(hash["dataproj_pk"].ToString());

		Response.Redirect("~/stats/DataProject.aspx?pk=" + dataproj_pk.ToString());

		//LoadProjects(dataproj_pk);
	}


	protected void btnBackToAll_Click(object sender, EventArgs e)
	{
		Response.Redirect("~/stats/DataProject.aspx");
	}

	#endregion //NAVIGATION events 


	#region Control CHANGE events
	protected void ddlMeasure_SelectedIndexChanged(object sender, EventArgs e)
	{
		 int measureID = int.Parse(ddlMeasure.SelectedValue);
		 if (measureID > 0)
		 {
			 //hidMeasureID.Value = measureID.ToString();
			 //ViewState["studymeasID"] = studymeasID.ToString();

			 LoadVars(measureID);
		 }

		 gridStudymeasVars.Visible = true;

		 lblVarError.Text = "";
	}

	protected void chkAllVars_CheckedChanged(object sender, EventArgs e)
	{
		int measureID = int.Parse(ddlMeasure.SelectedValue);
		LoadVars(measureID);
	}


	protected void gridHypoth_Select(object sender, Obout.Grid.GridRecordEventArgs e)
	{
		panelVars.Visible = true;
	}


	protected void btnCancel_Click(object sender, EventArgs e)
	{
		panelVars.Visible = false;

		//reload the page
		int dataproj_pk = Convert.ToInt16(Request.QueryString["pk"].ToString());

		Response.Redirect("~/stats/DataProject.aspx?pk=" + dataproj_pk.ToString());

	}

	#endregion //Control CHANGE events



	protected void btnSaveVars_Click(object sender, EventArgs e)
	{

		if (gridStudymeasVars.SelectedRecords != null & lstTimepoint.SelectedValue.ToString()!="")
		{
			//measures
			DataTable dt = new DataTable();
			dt.Columns.Add("hypoth_pk", typeof(int));
			dt.Columns.Add("measureID", typeof(int));
			dt.Columns.Add("varname", typeof(string));

			//timepoints
			DataTable dt_tp = new DataTable();
			dt_tp.Columns.Add("value", typeof(int));

			//Get the selected hypoths
			if (gridHypoth.SelectedRecords != null)
			{
					
				//loop through the selected hypotheses
				foreach (Hashtable oHyp in gridHypoth.SelectedRecords)
				{
					int hypoth_pk = int.Parse(oHyp["hypoth_pk"].ToString());
					//loop through the selected vars
					foreach (Hashtable oRecord in gridStudymeasVars.SelectedRecords)
					{
						DataRow row = dt.NewRow();
						row["hypoth_pk"] = hypoth_pk;
						row["measureID"] = int.Parse(ddlMeasure.SelectedValue);
						row["varname"] = oRecord["databasefield"];
						dt.Rows.Add(row);

					}
				}

				//foreach (ListBoxItem item in lstTimepoint.Items)
				//{
				//    if (item.Selected)
				//    {
				//        DataRow row = dt_tp.NewRow();
				//        row["value"] = item.Value;
				//        dt_tp.Rows.Add(row);

				//    }
				//}

			
				SQL_utils sql = new SQL_utils();

				List<SqlParameter> p = new List<SqlParameter>();
				p.Add( sql.CreateParam("tbl", dt));
				p.Add(sql.CreateParam("tp", lstTimepoint.SelectedValue.ToString(), "text"));

				sql.NonQuery_from_ProcName("dp.spAddVars_to_Hypoth", p);

				int totvars = sql.IntScalar_from_SQLstring("select count(*) from dp.Var where hypoth_pk in " +
						" (select hypoth_pk from dp.Hypoth where dataproj_pk=" + Request.QueryString["pk"] + ")");

				sql.Close();

				lblVarMsg.Text = "Variables added (Total in project = " + totvars.ToString() + ")";
				lblVarError.Text = "";
				panelVarErrors.Update();
			}

		}
		else
		{
			string errmsg = "";
			if (lstTimepoint.SelectedValue.ToString() == "")
			{
				errmsg += "Select some timepoints.";
			}
			if (gridStudymeasVars.SelectedRecords == null)
			{
				errmsg += " Select some variables.";
			}

			lblVarMsg.Text = "";
			lblVarError.Text = errmsg;
			panelVarErrors.Update();
		}


	}


	struct GridInfo
	{
		public Grid grid;
		public string gridTitle;
	}


	protected void btnPDF_Click(object sender, EventArgs e)
	{
		//selectpdf();

		List<GridInfo> grids = new List<GridInfo>();

		grids.Add(new GridInfo() { grid = gridApprover, gridTitle = "Approvers" } );
		grids.Add(new GridInfo() { grid = gridStaff, gridTitle = "Staff" });


		MemoryStream ms = ExportDataProjectToPDF(grids);


		// Send the data and the appropriate headers to the browser
		Response.Clear();
		Response.AddHeader("content-disposition", "attachment;filename=oboutGrid.pdf");
		Response.ContentType = "application/pdf";

		Response.BinaryWrite(ms.ToArray());
		Response.End();

	}


   

	private MemoryStream ExportDataProjectToPDF(List<GridInfo> Grids)
	{
		// Stream which will be used to render the data
		MemoryStream fileStream = new MemoryStream();

		Document doc = new Document(iTextSharp.text.PageSize.LETTER, 10, 10, 30, 20);
		try
		{
			//Create Document class object and set its size to letter and give space left, right, Top, Bottom Margin
			PdfWriter wri = iTextSharp.text.pdf.PdfWriter.GetInstance(doc, fileStream);

			doc.Open();//Open Document to write

			iTextSharp.text.Font font8 = iTextSharp.text.FontFactory.GetFont("Arial", 8f);
			iTextSharp.text.Font font8Bold = iTextSharp.text.FontFactory.GetFont("Arial", 8f);
			font8Bold.SetStyle("bold");

			iTextSharp.text.Font font7 = iTextSharp.text.FontFactory.GetFont("Arial", 7f);
			iTextSharp.text.Font font7Bold = iTextSharp.text.FontFactory.GetFont("Arial", 7f);
			font7Bold.SetStyle("bold");


			//Header 
			Chunk headerc1 = new Chunk("UW Autism Center: Data Project Proposal                                     ", font8);
			Chunk headerc2 = new Chunk("          Printed: " + DateTime.Now.ToString(), font8);
			Phrase header = new Phrase();
			header.Add(headerc1);header.Add(headerc2);

			iTextSharp.text.Font linkfont = iTextSharp.text.FontFactory.GetFont("Arial", 7f, new BaseColor(Color.DarkBlue));
			Anchor link = new Anchor("Click here to view on the web.\n\n", linkfont);
			link.Reference = "https://uwac.autism.washington.edu/research/stats/DataProject.aspx?pk=15";

			doc.Add(new Paragraph(header));
			doc.Add(link);


			#region  Project Info 
			SQL_utils sql = new SQL_utils();

			DataTable dt_proj = sql.DataTable_from_SQLstring("select projTitle, projSummary, created, createdBy from dp.DataProject where dataproj_pk=" +
				Request.QueryString["pk"].ToString());

			foreach(DataRow row in dt_proj.Rows)
			{
				Paragraph p1 = new Paragraph("Title: " + row["projTitle"].ToString());
				doc.Add(p1);

				//XMLWorker also reads from a TextReader and not directly from a string
				using (var srHtml = new StringReader(row["projSummary"].ToString()))
				{
					//Parse the HTML
					iTextSharp.tool.xml.XMLWorkerHelper.GetInstance().ParseXHtml(wri, doc, srHtml);
				}

			}
			#endregion //Project Info

			List<GridInfo> grids = new List<GridInfo>();
			grids.Add(new GridInfo() { grid = gridStaff, gridTitle = "Staff" });
			//grids.Add(new GridInfo() { grid = gridGroups, gridTitle = "Subjects" });
			//grids.Add(new GridInfo() { grid = gridMeas, gridTitle = "Measures" });


			//Add the Grids
			foreach(GridInfo Grid1 in Grids)
			{
				//Write the title
				Paragraph gridTitle = new Paragraph(Grid1.gridTitle);
				doc.Add(gridTitle);

				//Write the table
				PdfPTable pdf_tbl =  utilPDF.AddGridToPDF(Grid1.grid, font8, font8Bold);
				doc.Add(pdf_tbl);
			}


			#region Add the Hypoths

			DataTable dt_hypoth = sql.DataTable_from_SQLstring("select hypoth_pk, hypothTitle, coalesce(hypothText, '**none entered**') hypothText, coalesce(analysismethod, '**none entered**') AnalysisMethod from dp.Hypoth where dataproj_pk=" +
				Request.QueryString["pk"].ToString());

			int hypoth_num = 1;
			foreach (DataRow row in dt_hypoth.Rows)
			{
				//Hypoth header
				Paragraph p1 = new Paragraph("Hypothesis " + hypoth_num.ToString() );
				doc.Add(p1);

				//Hypoth text
				doc.Add(utilPDF.Paragraph_fromKeyValue("Title: ", row["hypothTitle"].ToString(), font8Bold, font8));
				doc.Add(utilPDF.Paragraph_fromKeyValue("Text: ", row["hypothText"].ToString(), font8Bold, font8));
				doc.Add(utilPDF.Paragraph_fromKeyValue("Analysis Method: ", row["AnalysisMethod"].ToString(), font8Bold, font8));


				//Write the table of Hypoth Vars
				int hypoth_pk = int.Parse(row["hypoth_pk"].ToString());

				DataTable dt_hypothvars = sql.DataTable_from_SQLstring("select measname as Measure, VarName, fieldlabel as VarLabel, TimePoints from dp.vwHypoth_Vars " +
					" where hypoth_pk = " + hypoth_pk.ToString());

				if(dt_hypothvars.Rows.Count==0)
				{
					iTextSharp.text.Font font8Red = iTextSharp.text.FontFactory.GetFont("Arial", 8f, BaseColor.RED);
					doc.Add(new Paragraph(new Chunk("No variables yet added to this hypothesis.", font8Red)));
				}
				else
				{
					PdfPTable tbl_vars = utilPDF.AddDataTableToPDF(dt_hypothvars, font7, font7Bold);
					doc.Add(tbl_vars);
				}

				hypoth_num++;
			}
			#endregion // Hypoth




			sql.Close();

		}
		catch (DocumentException docEx)
		{
			string x = docEx.Message;
			//handle pdf document exception if any
		}
		catch (IOException ioEx)
		{
			string x = ioEx.Message;
			// handle IO exception
		}
		catch (Exception ex)
		{
			string x = ex.Message;
			// ahndle other exception if occurs
		}
		finally
		{
			//Close document and writer
			doc.Close();
		}

		return (fileStream);

	}




	protected void btnHTMLedit_Click(object sender, EventArgs e)
	{
		//lblTitle.Text = dt.Rows[0].Field<string>("projTitle");
		//litSummary.Text = dt.Rows[0].Field<string>("projSummary");

		txtTitle.Text = lblTitle.Text;
		editor.Content = litSummary.Text; 

		panelEDITproj.Visible = true;
		panelVIEWproj.Visible = false;
	}

	protected void btnHTMLcancel_Click(object sender, EventArgs e)
	{
		panelEDITproj.Visible = false;
		panelVIEWproj.Visible = true;

	}

	protected void btnHTMLsave_Click(object sender, EventArgs e)
	{
		SQL_utils sql = new SQL_utils();

		List<SqlParameter> p = new List<SqlParameter>();
		p.Add(sql.CreateParam("dataproj_pk", Request.QueryString["pk"], "int"));
		p.Add(sql.CreateParam("projSummary", editor.Content, "text"));
		p.Add(sql.CreateParam("projTitle", txtTitle.Text, "text"));


		sql.NonQuery_from_ProcName("dp.spDataProject_UPDATE", p);
		sql.Close();

		Response.Redirect("~/stats/DataProject.aspx?pk=" + Request.QueryString["pk"]);

		//panelEDITproj.Visible = false;
		//panelVIEWproj.Visible = true;

	}

	////the following sippet from: http://stackoverflow.com/questions/25164257/how-to-convert-html-to-pdf-using-itextsharp
	////see also: http://www.pavey.me/2015/04/aspnet-c-convert-html-to-pdf-using.html
	//protected void HTMLSTUFF()
	//{
	//    //Create a byte array that will eventually hold our final PDF
	//    Byte[] bytes;

	//    //Boilerplate iTextSharp setup here
	//    //Create a stream that we can write to, in this case a MemoryStream
	//    using (var ms = new MemoryStream())
	//    {

	//        //Create an iTextSharp Document which is an abstraction of a PDF but **NOT** a PDF
	//        using (var doc = new Document())
	//        {

	//            //Create a writer that's bound to our PDF abstraction and our stream
	//            using (var writer = PdfWriter.GetInstance(doc, ms))
	//            {

	//                //Open the document for writing
	//                doc.Open();

	//                //Our sample HTML and CSS
	//                var example_html = @"<p>This <em>is </em><span class=""headline"" style=""text-decoration: underline;"">some</span> <strong>sample <em> text</em></strong><span style=""color: red;"">!!!</span></p>";
	//                var example_css = @".headline{font-size:200%}";

	//                /**************************************************
	//                 * Example #1                                     *
	//                 *                                                *
	//                 * Use the built-in HTMLWorker to parse the HTML. *
	//                 * Only inline CSS is supported.                  *
	//                 * ************************************************/

	//                //Create a new HTMLWorker bound to our document
	//                using (var htmlWorker = new iTextSharp.text.html.simpleparser.HTMLWorker(doc))
	//                {

	//                    //HTMLWorker doesn't read a string directly but instead needs a TextReader (which StringReader subclasses)
	//                    using (var sr = new StringReader(example_html))
	//                    {

	//                        //Parse the HTML
	//                        htmlWorker.Parse(sr);
	//                    }
	//                }

	//                /**************************************************
	//                 * Example #2                                     *
	//                 *                                                *
	//                 * Use the XMLWorker to parse the HTML.           *
	//                 * Only inline CSS and absolutely linked          *
	//                 * CSS is supported                               *
	//                 * ************************************************/

	//                //XMLWorker also reads from a TextReader and not directly from a string
	//                using (var srHtml = new StringReader(example_html))
	//                {

	//                    //Parse the HTML
	//                    iTextSharp.tool.xml.XMLWorkerHelper.GetInstance().ParseXHtml(writer, doc, srHtml);
	//                }

	//                /**************************************************
	//                 * Example #3                                     *
	//                 *                                                *
	//                 * Use the XMLWorker to parse HTML and CSS        *
	//                 * ************************************************/

	//                //In order to read CSS as a string we need to switch to a different constructor
	//                //that takes Streams instead of TextReaders.
	//                //Below we convert the strings into UTF8 byte array and wrap those in MemoryStreams
	//                using (var msCss = new MemoryStream(System.Text.Encoding.UTF8.GetBytes(example_css)))
	//                {
	//                    using (var msHtml = new MemoryStream(System.Text.Encoding.UTF8.GetBytes(example_html)))
	//                    {

	//                        //Parse the HTML
	//                        iTextSharp.tool.xml.XMLWorkerHelper.GetInstance().ParseXHtml(writer, doc, msHtml, msCss);
	//                    }
	//                }


	//                doc.Close();
	//            }
	//        }

	//        //After all of the PDF "stuff" above is done and closed but **before** we
	//        //close the MemoryStream, grab all of the active bytes from the stream
	//        bytes = ms.ToArray();
	//    }
	//}



	#region LOAD SUBJECTS
	protected void ShowSubjects(int studyID)
	{
		SQL_utils sql = new SQL_utils();
		lblStudyName.Text = Master.Master_studyname;

		string s;

		int pk = 0;
		if (Request.QueryString["pk"] != null) pk = int.Parse(Request.QueryString["pk"]);

		s = "exec dp.spGroups_with_totals  " + studyID.ToString() + ", " + pk.ToString() ;

		DataTable dt = sql.DataTable_from_SQLstring(s);

		#region //Group by Group & Subjstatus
		var query = from r in dt.AsEnumerable()
					let i = new
					{
						Group = r.Field<string>("Group"),
						groupID = r.Field<int>("groupID"),
						ColumnName = r.Field<string>("subjstatus"),
						ColumnValue = r.Field<string>("groupID_and_subjstatusID")
					}
					group i by new { i.Group, i.groupID } into g
					select g;


		DataTable dt_group_by_subjstatus = new DataTable();
		dt_group_by_subjstatus.Columns.Add("Group", typeof(string));
		dt_group_by_subjstatus.Columns.Add("groupID", typeof(int));

		foreach (var item in query)
		{
			var newRow = dt_group_by_subjstatus.NewRow();

			// static columns
			newRow["Group"] = item.Key.Group;
			newRow["groupID"] = item.Key.groupID;

			// dynamic columns
			foreach (var c in item)
			{
				if (!dt_group_by_subjstatus.Columns.Contains(c.ColumnName))
				{
					dt_group_by_subjstatus.Columns.Add(new DataColumn(c.ColumnName, typeof(String)));
				}

				newRow[c.ColumnName] += c.ColumnValue.ToString() + "$";
			}

			dt_group_by_subjstatus.Rows.Add(newRow);
		}
		#endregion


		gvSubjects.DataSource = dt_group_by_subjstatus;
		gvSubjects.DataBind();

		ViewState["dt_group_by_subjstatus"] = dt_group_by_subjstatus;

		sql.Close();
	}

	protected void gvSubjects_RowDataBound(object sender, GridViewRowEventArgs e)
	{
		int starting_col = 2;
		int numhiddencols = 0;

		//HEADER
		if (e.Row.RowType ==  DataControlRowType.Header)
		{
			//
			//start in the 3rd cell 
			for (int i = starting_col; i < e.Row.Cells.Count; i++)
			{


				//Add the column header text & checkbox
				Label lbl = new Label();
				lbl.Text = e.Row.Cells[i].Text + "<br/>";
				lbl.Font.Size = 10;
				lbl.ForeColor = Color.Navy;

				CheckBox chk = new CheckBox();
				chk.ID = i.ToString();
				chk.Text = "";
				e.Row.Cells[i].Controls.Add(chk);
				e.Row.Cells[i].Controls.Add(lbl);

				chk.Attributes.Add("onclick", "javascript:CheckAllColumn('" +
				   ((CheckBox)e.Row.FindControl(i.ToString())).ClientID + "','" + gvSubjects.ClientID + "'," + numhiddencols.ToString() + ")");

			}
		}


		//DATA ROWS
		if (e.Row.RowType ==   DataControlRowType.DataRow)
		{
			#region //ROW HEADER (or 1st column)
			CheckBox chkrow = new CheckBox();
			chkrow.Text = " ";
			chkrow.ID = "chkg" + e.Row.Cells[1].Text; //use the measureID
			e.Row.Cells[0].Controls.Add(chkrow);

			chkrow.Attributes.Add("onclick", "javascript:CheckAllRow('" +
			   ((CheckBox)e.Row.FindControl(chkrow.ID)).ClientID + "','" + gvSubjects.ClientID + "','" + e.Row.RowIndex.ToString() + "')");


			Label lblrow = new Label();
			lblrow.Text = e.Row.Cells[0].Text;
			lblrow.Font.Size = 10;
			lblrow.Font.Bold = true;
			lblrow.ForeColor = Color.Navy;
			e.Row.Cells[0].Controls.Add(lblrow);
			#endregion


			#region //CELLS
			//start in the 3rd cell, skipping measure and measureID
			//int startcol = 2;
			for (int i = starting_col; i < e.Row.Cells.Count; i++)
			{
				//If there is some info in the cell then add checkboxes
				if (e.Row.Cells[i].Text.Contains('$'))
				{

					//Create the checkboxes to be added to the cell
					// ADD A NEW PARAM HERE TO ALTER THE TEXT OF THE CHECKBOX
					//   - SHOULD THE ID OF THE CHECKBOX SERVE AS THE PARAMETER VALUE???????
					List<CheckBox> chks = Control_utils.ListOCheckBoxes(e.Row.Cells[i].Text, "chk");  //Pass in the cell contents (csv) and get back a list of checkboxes


					string[] txt = e.Row.Cells[i].Text.Split('|');
					string[] txt2 = txt[0].Split('_');



					//add hiddenfields to hold the values
					HiddenField hidRowValue = new HiddenField();
					HiddenField hidColValue = new HiddenField();

					hidRowValue.ID = "hidrow" + i.ToString();
					hidColValue.ID = "hidcol" + i.ToString();

					hidRowValue.Value = txt2[0];
					hidColValue.Value = txt2[1];
					e.Row.Cells[i].Controls.Add(hidRowValue);
					e.Row.Cells[i].Controls.Add(hidColValue);

					foreach (CheckBox chk in chks)
					{
						LiteralControl lit = new LiteralControl(); lit.Text = "<br/>";  //Add a manual break between each checkbox



						e.Row.Cells[i].Controls.Add(chk);
						e.Row.Cells[i].Controls.Add(lit);

						chk.Attributes.Add("onclick", "javascript:Checked('" +
							((CheckBox)e.Row.FindControl(chk.ID)).ClientID + "','" + gvSubjects.ClientID + "','" + e.Row.RowIndex.ToString() + "','" + i.ToString() + "'," + numhiddencols.ToString() + ")");

						if(e.Row.Cells[i].Text.EndsWith("1$"))
						{
							chk.Checked = true;
							e.Row.Cells[i].BackColor = Color.Yellow;
						}

						chk.Text = chk.Text.Substring(0, chk.Text.Length - 2);
						//split the text by the ~ to see whether to precheck the box or not

					}
				}


			}
			#endregion



		}

		////Hide the groupID column
		//e.Row.Cells[1].Visible = false;

	}
	#endregion  //SUBJECTS


	//protected List<subjectSubset> GetSelectedSubjects(GridView gv)
	protected string GetSelectedSubjects(GridView gv, string test)
	{
		string info = "";
		string g_ss_csv = "";

		//Loop though each row of the grid and collect the checked ones into a SQL where clause for group and subjstatus
		for (int r = 0; r < gv.Rows.Count; r++)
		{
			string stuff = "";
			stuff = Control_utils.GetAllCheckedInRow_string(gv, r);

			if (stuff != "")
			{
				string[] gss_groups = stuff.Split('$');
				info += "{stuff=" + stuff + "}{" + gss_groups.Length.ToString() + "}";
				for (int k = 0; k < gss_groups.Length; k++) { info += "{" + k.ToString() + ":" + gss_groups[k] + "}"; }

				for (int s = 0; s < gss_groups.Length; s++)
				{
					string[] elements = gss_groups[s].Split('_');
					string prefix = (g_ss_csv == "") ? "" : " OR ";

					g_ss_csv += prefix + " (groupID=" + elements[0] + " and subjstatusID=" + elements[1] + ") ";
				}
			}
		}

		info += " g_ss_csv= [" + g_ss_csv + "]";

		if (test == "test") return info;
		else return g_ss_csv;
	}


	protected DataTable DataTable_GetSelectedSubjects(GridView gv, string test)
	{
		DataTable dt = new DataTable();
		dt.Columns.Add("dataproj_pk", typeof(int));
		dt.Columns.Add("groupID", typeof(int));
		dt.Columns.Add("subjstatusID", typeof(int));


		//Loop though each row of the grid and collect the checked ones into a SQL where clause for group and subjstatus
		for (int r = 0; r < gv.Rows.Count; r++)
		{
			//start in column 2
			for (int c = 1; c < gv.Rows[r].Cells.Count; c++)
			{
				int rowval = 0;
				int colval = 0;
				int numchecked = 0;
				DataControlFieldCell cell = (DataControlFieldCell)gv.Rows[r].Cells[c];
				foreach (Control ctl in cell.Controls)
				{
					if (ctl.GetType() == typeof(HiddenField))
					{
						HiddenField hid = (HiddenField)ctl;
						if (ctl.ID.StartsWith("hidrow")) rowval = int.Parse(hid.Value.ToString());
						if (ctl.ID.StartsWith("hidcol")) colval = int.Parse(hid.Value.ToString());
					}
					else if (ctl.GetType() == typeof(CheckBox))
					{
						CheckBox chk = (CheckBox)ctl;
						if (chk.Checked)
						{
							numchecked++;
							//string prefix = (s == "") ? "" : "$";
							//s += prefix + ctl.ID.ToString().Replace("chk", "");
						}
					}
				}
				if (numchecked > 0)
				{
					//if(((HiddenField)cell.FindControl("hidRowValue")))

					DataRow row = dt.NewRow();
					row["dataproj_pk"] = int.Parse(Request.QueryString["pk"]);
					row["groupID"] = rowval;
					row["subjstatusID"] = colval;
					//row[]
					dt.Rows.Add(row);
				}
			}
		}

		return dt;
	}




	protected void btnGetSubjects_Click(object sender, EventArgs e)
	{
		
		DataTable dt = DataTable_GetSelectedSubjects(gvSubjects, "");

	}




	public static string GetAllCheckedInRow_string(GridView gv, int rowidx)
	{
		string s = "";

		for (int c = 1; c < gv.Rows[rowidx].Cells.Count; c++)
		//foreach (DataControlFieldCell cell in gv.Rows[rowidx].Cells)
		{
			DataControlFieldCell cell = (DataControlFieldCell)gv.Rows[rowidx].Cells[c];
			foreach (Control ctl in cell.Controls)
			{
				if (ctl.GetType() == typeof(CheckBox))
				{
					CheckBox chk = (CheckBox)ctl;
					if (chk.Checked)
					{
						string prefix = (s == "") ? "" : "$";
						s += prefix + ctl.ID.ToString().Replace("chk", "");
					}
				}
			}
		}

		return s;
	}




}