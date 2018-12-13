using System;
using System.Collections.Generic;
using System.Drawing;
using System.Data;
using System.Linq;
using System.IO;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DataEntryFramework4;
using uwac;


public partial class DataEntryForms_enterdata : System.Web.UI.Page
{
	protected void Page_Init(object sender, EventArgs e)
	{

		Master.DDL_Master_SelectStudyID.SelectedIndexChanged += new EventHandler(Master_Study_Changed);


		string mID = Request.QueryString["mid"];
		string pk = Request.QueryString["pk"];
		string smID = Request.QueryString["studymeasID"];

		DataEntryController1.StudyID = Master.Master_studyID;


		if (string.IsNullOrEmpty(mID) & string.IsNullOrEmpty(smID))
		{
			LoadMeas();

			DataEntryController1.DatabaseTable = "ALL_blank";
			DataEntryController1.PrimaryKeyField = "pk";
			
			//DataEntryController1.StudyMeasLinkButtonText = "foo";
			//DataEntryController1.Subjects_for_StudyMeasLinkButtonText = "fum";
			
			Panel_selector.Visible = true;
			btnEditLayout.Visible = false;

			panelDEMainBody.Visible = false;
		}
		else
		{
			SQL_utils sql = new SQL_utils("data");

			//TOFIX: combine into 1 proc 

			if(string.IsNullOrEmpty(mID) & !string.IsNullOrEmpty(smID))
			{
				mID = sql.StringScalar_from_SQLstring("select cast(measureID as varchar) mID from uwautism_research_backend..tblstudymeas where studymeasID=" + smID);
			}



			string tbl = sql.StringScalar_from_SQLstring("select tblname from def.Tbl where measureID=" + mID );
			string pkfld = sql.StringScalar_from_SQLstring("select fldname from def.Fld where fieldcodeID=10 and tblpk = (select tblpk from  def.Tbl e where measureID=" + mID + ")");
			string measname = sql.StringScalar_from_SQLstring("select measname from uwautism_research_backend..tblMeasure where measureID=" + mID  );
			DataEntryController1.DatabaseTable = tbl;
			DataEntryController1.PrimaryKeyField = pkfld;
			DataEntryController1.MeasureName = measname;

			if (pk != null)
			{
				DataEntryController1.LookupPKVal = pk;
			}

			AutoLayout.LoadFields_for_layout(mID, panelDEMainBody, "DataEntry", panelDEInsert);

			int ncontrols = panelDEMainBody.ContentTemplateContainer.Controls.Count;
			//int ncontrols = panelDEMainBody.Controls.Count;

			if (ncontrols == 0)
			{
				lblNotReady.Text = "Layout for '" + measname + "' not yet definied.<br/>Use the original data entry form.";
				
				btnEditLayout.PostBackUrl = "~/dataentryforms/editlayout.aspx?mid=" + Request.QueryString["mid"];
				btnEditLayout.Visible = true;

				LoadMeas();
				Panel_selector.Visible = true;
				panelDEMainBody.Visible = false;

			}
			else
			{
				Panel_selector.Visible = false;
				panelDEMainBody.Visible = true;
			}
			
		}



	}

	protected void Master_Study_Changed(object sender, EventArgs e)
	{

		Response.Redirect("~/DataEntryForms/enterdata.aspx");
	}


	protected void Page_Load(object sender, EventArgs e)
	{


	}


	protected void LoadMeas()
	{
		SQL_utils sql = new SQL_utils("backend");

		DataTable dt = sql.DataTable_from_SQLstring("select measureID, measname from tblMeasure where measureID in " +
			" (select measureID from tblStudymeas where studyID=" + Master.Master_studyID + ") order by measname");

		ddlMeas.DataSource = dt;
		ddlMeas.DataValueField = "measureID";
		ddlMeas.DataTextField = "measname";
		ddlMeas.DataBind();

	}

	protected void btnButton_Command(object sender, CommandEventArgs e)
	{
		if(e.CommandName=="LoadMeas")
		{
			int mid = 0;
			mid = Convert.ToInt32(ddlMeas.SelectedValue.ToString());

			if (mid > 0)
			{
				Response.Redirect("~/dataentryforms/enterdata.aspx?mid=" + ddlMeas.SelectedValue);
			}
		}

	}
}
