using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Diagnostics;
using System.Drawing;
using System.Linq;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
//using Obout.Grid;
//using Obout.Interface;
//using Obout.ListBox; 
//using Obout.Ajax.UI.TreeView;
using DevExpress.Web;
using DevExpress.Web.ASPxPivotGrid;
using DevExpress.Web.Data;
using DevExpress.Web.Rendering;
using DevExpress.XtraPivotGrid;
using uwac;


public partial class Admin_StudyDesignViewer : BasePage // OboutInc.oboutAJAXPage //System.Web.UI.Page
{


	protected void Page_Init(object sender, EventArgs e)
	{
		
		Master.DDL_Master_SelectStudyID.SelectedIndexChanged += new EventHandler(Master_Study_Changed);

		

	}
	//If the master page default study is changed, update the Measure DDL
	protected void Master_Study_Changed(object sender, EventArgs e)
	{
		lblStudyname.Text = Master.Master_studyname;

		//sql_Group.DataBind();
		//LoadEntities();

		Response.Redirect(Request.Url.ToString());


	}

	protected void Page_Load(object sender, EventArgs e)
	{
		
		if (!IsPostBack)
		{
			lblStudyname.Text = Master.Master_studyname;
			LoadStudydesign();
			Bind();
		}
		else
		{
			Bind();
		}
		//if (Session["proj_meas"] != null)
		//{
		//	PivotSelMeas.DataSource = Session["proj_meas"];
		//	PivotSelMeas.DataBind();
		//	PivotSelMeas.Visible = true;
		//}

	}

	protected void pivotENT_CustomCellDisplayText(object sender, DevExpress.Web.ASPxPivotGrid.PivotCellDisplayTextEventArgs e)
	{
		var x = 0;

	}

	//'DevExpress.Web.ASPxPivotGrid.PivotGridCustomSummaryEventArgs' and 'DevExpress.XtraPivotGrid.PivotGridCustomSummaryEventArgs
	protected void pivotENT_CustomSummary(object sender, DevExpress.Web.ASPxPivotGrid.PivotGridCustomSummaryEventArgs e)
	{
		var x = e.DataField;

		if (e.DataField.FieldName != "studyactionID" && e.DataField.FieldName != "studymeasID") return;

		// Get the record set corresponding to the current cell.
		PivotDrillDownDataSource ds = e.CreateDrillDownDataSource();

		// Calculate the percentage.
		if (ds.RowCount > 0)
		{
			e.CustomValue = "X";
		}
	}

	protected void btnLoad_OnClick(object sender, EventArgs e)
	{
		Debug.WriteLine("CLICK!!");
		LoadStudydesign();
		Bind();
	}


	protected void LoadStudydesign()
	{
		Debug.WriteLine("LoadStudydesign!!");
		SQL_utils sql = new SQL_utils("backend");

		DataTable dt_studydesign = sql.DataTable_from_SQLstring("select * from vwStudyDesign_GTM  where studyID = " + Master.Master_studyID);

		Session["dt_studydesign"] = dt_studydesign;
	}


	protected void Bind()
	{
		Debug.WriteLine("BIND!!");
		//pivotENT.Fields["fsaID"].Visible = false;
		//pivotENT.Fields["fsmID"].Visible = false;
		//pivotENT.Fields["ftimepoint_text"].Visible = false;
		//pivotENT.Fields["factiontype"].Visible = false;
		//pivotENT.Fields["factiontext"].Visible = false;

		//pivotENT.Fields["fgroupname"].Visible = false;
		//pivotENT.Fields["fmeasname"].Visible = false;
		//pivotENT.Fields["fstudymeasname"].Visible = false;

		pivotENT.DataSource = (DataTable)Session["dt_studydesign"];

		pivotENT.DataBind();
		pivotENT.Visible = true;


		var cbl = cblItems.SelectedValues;
		int numrowfields = 0;

		if (cbl.Contains("Actions")) Debug.WriteLine("Actions");
		if (cbl.Contains("Measures")) Debug.WriteLine("Measures");
		if (cbl.Contains("Consents")) Debug.WriteLine("Consents");


		//pivotENT.Fields["fsmID"].SetAreaPosition(PivotArea.DataArea, 0);
		//pivotENT.Fields["fsmID"].SummaryType = DevExpress.Data.PivotGrid.PivotSummaryType.Count;
		//pivotENT.Fields["fgroupname"].SetAreaPosition(PivotArea.ColumnArea, 0);
		//pivotENT.Fields["ftimepoint_text"].SetAreaPosition(PivotArea.RowArea, 0);
		//pivotENT.Fields["factiontext"].SetAreaPosition(PivotArea.RowArea, 1);
		//pivotENT.Fields["fstudymeasname"].SetAreaPosition(PivotArea.RowArea, 2);
		numrowfields++;

		//if (cbl.Contains("Actions"))
		//{
		//	//pivotENT.DataSourceID = "sql_StudyDesign_A";

		//	DataTable dt = sql.DataTable_from_SQLstring("select* from vwStudyDesign_GTA where studyID = " + Master.Master_studyID);
		//	pivotENT.DataSource = dt;

		//	pivotENT.Fields["factiontext"].SetAreaPosition(PivotArea.RowArea, numrowfields);
		//	numrowfields++;
		//}

		//if (cbl.Contains("Measures"))
		//{
		//	//pivotENT.DataSourceID = "sql_StudyDesign_M";
		//	DataTable dt = sql.DataTable_from_SQLstring("select * from vwStudyDesign_GTM  where studyID = " + Master.Master_studyID);
		//	pivotENT.DataSource = dt;

		//	pivotENT.Fields["fstudymeasname"].SetAreaPosition(PivotArea.RowArea, numrowfields);
		//	numrowfields++;
		//}

		//if (cbl.Contains("Consents"))
		//{
		//	pivotENT.Fields["fconsentformname"].SetAreaPosition(PivotArea.RowArea, numrowfields);
		//	numrowfields++;
		//}


	}



	protected void Cell_Concat(object sender, DevExpress.Web.ASPxPivotGrid.PivotGridCustomSummaryEventArgs e)
	{
		//		Debug.Print("ENTER PivotSelMeas_Concat");
		var x = e.DataField;
		//if (e.DataField != field_meas) return;
		if (e.DataField.Name != "fstudymeasname") return;

		// Get the record set corresponding to the current cell.
		PivotDrillDownDataSource ds = e.CreateDrillDownDataSource();

		string concat = "";
		// Iterate through the records and count the orders.
		for (int i = 0; i < ds.RowCount; i++)
		{
			PivotDrillDownDataRow row = ds[i];
			string sep = (i == 0) ? "" : "<br>";

			string newtext = row["studymeasname"].ToString();
			//string isREL = row["isREL"].ToString();

			if (newtext.Contains("(REL)"))
			{
				newtext = String.Format(@"<p style=""background-color: gold; display:inline; text-align: right;"">{0}</p>", newtext);
			}

			concat = String.Format("{0}{1}{2}", concat, sep, newtext);
		}

		if (ds.RowCount > 0)
		{
			e.CustomValue = concat;
		}

	}


}

