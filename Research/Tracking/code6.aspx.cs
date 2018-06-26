using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using NReco.PivotData;
using NReco.PivotData.File;
using NReco.PivotData.Output;
using OfficeOpenXml;


using uwac;

public partial class Tracking_code6 : System.Web.UI.Page
{


	protected void Page_Load(object sender, EventArgs e)
	{
		if (!IsPostBack)
		{
			panelDups.Visible = false;

			SQL_utils sql = new SQL_utils("backend");

			DataTable dt = sql.DataTable_from_SQLstring("select -1 labID, '--select lab--' labname union " +
					" select a.labID, labname from fn_AllowedLabs_by_User() a join tblLab b ON a.labID = b.labID");

			ddlLab.DataSource = dt;
			ddlLab.DataBind();

			

			sql.Close();
		}
	}


	protected void LoadListBox_Study()
	{
		SQL_utils sql = new SQL_utils("backend");


		DataTable dt = sql.DataTable_from_SQLstring("select a.studyID, studyname from tblStudy a " +
			" join (select labID, studyID from vwLabGroup where labID = " + ddlLab.SelectedValue.ToString() + " group by labID, studyID) b ON a.studyID = b.studyID" +
			" order by a.studyname");


		lstStudy.DataValueField = "studyID";
		lstStudy.DataTextField = "studyname";

		lstStudy.DataSource = dt;
		lstStudy.DataBind();



		sql.Close();
	}


	protected void LoadListBox_Group(string grps)
	{

		string[] grp = grps.Split(',');

		SQL_utils sql = new SQL_utils("backend");

		DataTable dt = sql.DataTable_from_SQLstring("select groupID, '(' + studyname + ') ' + groupname  as groupname from tblgroup a join tblStudy b ON a.studyID = b.studyID " + 
			" where a.studyID in (" + grps + ") ");

		lstGroup.DataValueField = "groupID";
		lstGroup.DataTextField = "groupname";

		lstGroup.DataSource = dt;
		lstGroup.DataBind();



		sql.Close();

	}

	protected void LoadDups()
	{
		SQL_utils sql = new SQL_utils("backend");

		DataTable dtDups = sql.DataTable_from_SQLstring("exec spCode6_person_by_Lab_DUPS " + ddlLab.SelectedValue.ToString());

		if (dtDups.Rows.Count > 0)
		{
			gvDups.DataSource = dtDups;
			gvDups.DataBind();

			panelDups.Visible = true;
		}
		else
		{
			panelDups.Visible = false;
		}

		sql.Close();
	}

	protected void btnGetIDList_Click(object sender, EventArgs e)
	{

		int labID = Convert.ToInt32(ddlLab.SelectedValue.ToString());

		if(labID > 0)
		{
			SQL_utils sql = new SQL_utils("backend");
			List<SqlParameter> ps = new List<SqlParameter>();
			ps.Add(sql.CreateParam("labID", labID.ToString(), "int"));
			ps.Add(sql.CreateParam("study_csv", "all", "text"));

			DataTable dt = sql.DataTable_from_ProcName("spCode6_person_by_Lab",ps);

			string filename = "code6_IDs_" + SpreadsheetGearUtils.DateTime_for_filename();
			SpreadsheetGearUtils.SaveDataTableToExcel(dt, filename, true, "csv");


			sql.Close();
		}

	}
	protected void ddlLab_SelectedIndexChanged(object sender, EventArgs e)
	{
		panelDups.Visible = false;
		LoadDups();

		panel_filters.Visible = true;
		LoadListBox_Study();

	}


	protected void ShowCode6_Single()
	{
		int labID = Convert.ToInt32(ddlLab.SelectedValue.ToString());

		if (labID > 0)
		{
			SQL_utils sql = new SQL_utils("backend");

			List<SqlParameter> ps = new List<SqlParameter>();
			ps.Add(sql.CreateParam("labID", labID.ToString(), "int"));
			ps.Add(sql.CreateParam("code6", txtCode6.Text, "text"));

			DataTable dt = sql.DataTable_from_ProcName("spCode6_all_IDs_for_single_code6", ps);

			gvSingle.DataSource = dt;
			gvSingle.DataBind();

			gvSingle.Visible = true;
			sql.Close();

		}
	}


	protected void ShowCode6Wide ()
	{
		int labID = Convert.ToInt32(ddlLab.SelectedValue.ToString());

		if (labID > 0)
		{
			var x = lstStudy.SelectedValue;

			if (lstStudy.SelectedValue == "")
			{
				lblSelectOne.Text = "Select some studies.";
				lblSelectOne.Visible = true;
			}
			else if (chkDisplayOnPage.Checked == false && chkXLSX.Checked == false)
			{
				lblSelectOne.Text = "Select the output method.";
				lblSelectOne.Visible = true;
			}

			else
			{
				SQL_utils sql = new SQL_utils("backend");

				List<SqlParameter> ps = new List<SqlParameter>();
				ps.Add(sql.CreateParam("labID", labID.ToString(), "int"));
				ps.Add(sql.CreateParam("study_csv", lstStudy.SelectedValue, "text"));

				DataTable dt = sql.DataTable_from_ProcName("spCode6_person_by_Lab", ps);


				PivotTable pivotTable = utilPivotTable.DataTable_to_PivotTable(dt, new List<string> { "code6" }, new List<string> { "source_of_ID" }, "ID",
					new List<utilPivotTable.AggrFx> { utilPivotTable.AggrFx.Concat2 });

				lblSelectOne.Visible = false;

				if (chkDisplayOnPage.Checked == true)
				{
					//Write back to page
					var htmlResult = new StringWriter();
					var pvtHtmlWr = new PivotTableHtmlWriter(htmlResult);

					pvtHtmlWr.TotalsColumn = false;
					pvtHtmlWr.TotalsRow = false;
					pvtHtmlWr.GrandTotal = false;

					pvtHtmlWr.Write(pivotTable);

					Literal xtab = new Literal();
					xtab.Text = htmlResult.ToString();
					panel_wide.Controls.Add(xtab);
				}

				if (chkXLSX.Checked == true)
				{
					var dataTblWr = new PivotTableDataTableWriter("Test"); //.Write(pivotTable);
					var tbl = dataTblWr.Write(pivotTable);
					string filename = "code6_IDs_wide_" + SpreadsheetGearUtils.DateTime_for_filename();
					SpreadsheetGearUtils.SaveDataTableToExcel(tbl, filename, true, "xlsx");
				}

				sql.Close();
			}


			
		}

	}


	protected void btnPivot_Click(object sender, EventArgs e)
	{
		ShowCode6Wide();
	}
	protected void btnLoadGroups_Click(object sender, EventArgs e)
	{

		
		LoadListBox_Group(lstStudy.SelectedValue);



	}
	protected void lstStudy_SelectedIndexChanged(object sender, Obout.ListBox.ListBoxItemEventArgs e)
	{
		string x = lstStudy.SelectedValue;
	}
	protected void btnSingle_Click(object sender, EventArgs e)
	{
		ShowCode6_Single();
	}
}