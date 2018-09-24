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

		if (!IsPostBack)
		{
			//LoadTimepoints();
		}

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
			//Bind();
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


	protected void pivotENT_CustomSummary(object sender, PivotGridCustomSummaryEventArgs e)
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
		Bind();
	}


	protected void Bind()
	{

		pivotENT.Fields["fsaID"].Visible = false;
		pivotENT.Fields["fsmID"].Visible = false;
		pivotENT.Fields["ftimepoint_text"].Visible = false;
		pivotENT.Fields["factiontype"].Visible = false;
		pivotENT.Fields["factiontext"].Visible = false;

		pivotENT.Fields["fgroupname"].Visible = false;
		pivotENT.Fields["fmeasname"].Visible = false;
		pivotENT.Fields["fstudymeasname"].Visible = false;


		

		var cbl = cblItems.SelectedValues;
		int numrowfields = 0;

		if (cbl.Contains("Actions")) Debug.WriteLine("Actions");
		if (cbl.Contains("Measures")) Debug.WriteLine("Measures");
		if (cbl.Contains("Consents")) Debug.WriteLine("Consents");


		pivotENT.Fields["fsmID"].SetAreaPosition(PivotArea.DataArea, 0);
		pivotENT.Fields["fsmID"].SummaryType = DevExpress.Data.PivotGrid.PivotSummaryType.Custom;
		pivotENT.Fields["fgroupname"].SetAreaPosition(PivotArea.ColumnArea, 0);
		pivotENT.Fields["ftimepoint_text"].SetAreaPosition(PivotArea.RowArea, numrowfields);
		numrowfields++;

		if (cbl.Contains("Actions"))
		{
			pivotENT.DataSourceID = "sql_StudyDesign_A";
			pivotENT.Fields["factiontext"].SetAreaPosition(PivotArea.RowArea, numrowfields);
			numrowfields++;
		}

		if (cbl.Contains("Measures"))
		{
			pivotENT.DataSourceID = "sql_StudyDesign_M";
			pivotENT.Fields["fstudymeasname"].SetAreaPosition(PivotArea.RowArea, numrowfields);
			numrowfields++;
		}

		//if (cbl.Contains("Consents"))
		//{
		//	pivotENT.Fields["fconsentformname"].SetAreaPosition(PivotArea.RowArea, numrowfields);
		//	numrowfields++;
		//}




		pivotENT.DataBind();
		pivotENT.Visible = true;

	}

}

