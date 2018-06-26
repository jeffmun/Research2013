using System;
using System.Collections.Generic;
using System.Linq;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.IO;
using System.Net;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Newtonsoft.Json;
//using Newtonsoft.Json.Schema;
using uwac;
using uwac_controls;
using Obout.Grid;
using Obout.Interface;
using Obout.ComboBox;
using Obout.SuperForm;



public partial class NDAR_NDARview : System.Web.UI.Page
{
	string shortName;
	SQL_utils sql = new SQL_utils("data");
	
	protected void Page_Init(object sender, EventArgs e)
	{
		shortName = Request.QueryString["shortName"];


		Hyperlink2.NavigateUrl = "~/NDAR/NDARdict.aspx?shortName=" + shortName;
	}

	protected void Page_Load(object sender, EventArgs e)
	{
		int DatStructureInfo_isOK = LoadDataStructureInfo(shortName);
		if (DatStructureInfo_isOK == 0)
		{
			LoadStudymeas();
			btnSaveNDARCSV.Visible = false;
		}

		//if (chkShowSQLsyntax.Checked) {
		//    string sqlout = NDAR.GetSQL_for_NDAR_view(shortName, Master.Master_studyID, "/* NONE SELECTED */");
		//    lblSQLsyntax.Text = "<b><u>SQL syntax for creating NDAR data for '" + shortName + "':</u></b><br/><br/>" + sqlout;
		//}



		if(!IsPostBack)
		{
			//Only load when it is not a postback



			//LoadUWtable_names();

		}


	}



	protected void LoadStudymeas()
	{
		SQL_utils sql = new SQL_utils("backend");

		string sqltext = "select studymeasID, studymeasname from uwautism_research_backend..tblStudymeas where studyID= " + Master.Master_studyID.ToString() +
			   " and measureID = (select measureID from uwautism_research_data.def.Tbl where tblname = " +
				"	(select uwtable from uwautism_research_data..NDAR_ds where shortname='" + shortName + "')) order by studymeasname";

		DataTable dt = sql.DataTable_from_SQLstring(sqltext);

		if (dt.Rows.Count >= 1)
		{
			UpdatePanel_O_CheckBoxes p = new UpdatePanel_O_CheckBoxes(dt, "studymeasID", "Measure", "studymeasname", "studymeasID", "int", "0");
			p.ID = "studymeasID";
			panelStudymeas.Controls.Add(p);
		}

		sql.Close();

	}


	protected void LoadNDARview(string shortName, string studymeasIDs)
	{
		//SQL_utils sql = new SQL_utils("data");
		
		//Doesn't work
		//int studyID = master.Master_studyID ;
		int studyID = sql.GetUserStudyID();
		string IDexclude = txtIDexclude.Text;

		try
		{
			gvNDARview.DataSource = null;

			

			DataTable dt = NDAR.GetNDAR_view(shortName, studyID, IDexclude, studymeasIDs);
			if (dt.Rows.Count > 0)
			{
				gvNDARview.DataSource = dt;
				gvNDARview.DataBind();

				gvNDARview.Visible = true;
				v5.Text = dt.Rows.Count.ToString();
				v5.ForeColor = Color.Navy;
			}
			else
			{
				gvNDARview.Visible = false;

				v5.Text = "This query returned 0 records.";
				v5.ForeColor = Color.Red;
			}
		}
		catch(Exception ex)
		{
			//To show the query
			string sqlout = NDAR.GetSQL_for_NDAR_view(shortName, studyID, IDexclude, studymeasIDs);
			lblInfo.Text = ex.Message + "<br/><br/>" + sqlout;

			//string sqlout = NDAR.GetSQL_for_NDAR_studymeas_to_include(shortName, studyID, 0);
			//lblInfo.Text =  "<br/><br/>" + sqlout;

		}



	}


	protected int LoadDataStructureInfo(string shortName)
	{
		int return_value = 0;
		//Don't need to retrieve all the DSE yet.
		//DataTable dt = NDAR.NDAR_DSE_from_DB(shortName);

		//instead, just get the count of DSE
		int n_dse = NDAR.Get_Count_NDAR_DSE_from_DB(shortName);

		if (shortName != "")
		{
			string source = "UWAC DB";
			NDAR.NDAR_DataStructure ds = NDAR.GetNDARDataStructure(shortName);

			if (ds == null)
			{
				return_value++;
				lblInfo.Text = "**ERROR** '" + shortName + "' is inaccessible from the NDAR API.<br/>";
			}

			//Get the associated table
			string uwtable = sql.StringScalar_from_SQLstring("select coalesce(uwtable, 'NONE') uwtable from NDAR_DS where shortname = '" + shortName + "'");

			if (uwtable == null)
			{
				return_value++;
				lblInfo.Text += "**ERROR** No linked UW table found for '" + shortName + "'.<br/>";
			}


			v0.Text = sql.GetUserStudyName();
			v1.Text = shortName;
			v2.Text = (ds != null) ? ds.title : "";
			v3.Text = n_dse.ToString();
			v4.Text = source;


			return return_value;
		}
		else{
			return 0;
		}
	}




	protected void btnSaveCSV_Click(object sender, EventArgs e)
	{
		string shortName = Request.QueryString["shortName"];
		NDAR.NDAR_DataStructure ds = NDAR.GetNDARDataStructure(shortName);
		DataTable dt = NDAR.NDARDataStructureElements_to_DataTable(ds);
		dt.TableName = "csv";

		SpreadsheetGearUtils.SaveDataTableToFile(dt, "testit", "csv");
	}


	protected void gv_dataElements_RowDataBound(object sender, GridViewRowEventArgs e)
	{
		if (e.Row.RowType == DataControlRowType.DataRow)
		{
			TextBox uwfldpos = (TextBox)e.Row.FindControlRecursive("txtUWfld");


			var data = e.Row.DataItem as DataRowView;

			// replace request name with a link
			if (data.DataView.Table.Columns["uwfld"] != null)
			{
				// get the request name
				string uwfld = data["uwfld"].ToString();
				// get the column index
				//int idx = data.Row.Table.Columns["Request Name"].Ordinal;

				if (uwfld == "" | uwfld == null)
				{
					uwfldpos.Visible = true;
				}
				else
				{
					uwfldpos.Visible = false;
				}
			}
		}
	}


	protected void btnSaveNDARCSV_Click(object sender, EventArgs e)
	{
		UpdatePanel_O_CheckBoxes p = (UpdatePanel_O_CheckBoxes)panelStudymeas.FindControlRecursive("studymeasID");

		string studymeasIDs = p.GetChecked_as_CSV();

		string shortName = Request.QueryString["shortName"];
		int studyID = sql.GetUserStudyID();
		string studyname = sql.GetUserStudyName();
		string IDexclude = txtIDexclude.Text;


		DataTable dt = NDAR.GetNDAR_view(shortName, studyID, 0, false, IDexclude, studymeasIDs);
		dt.TableName = shortName;

		string now = DateTime.Now.ToString("yyyyMMdd__HH_mm");

		string filename = studyname + "_" + shortName + "_" + now;
		SpreadsheetGearUtils.SaveDataTableToFile(dt, filename, "csv", true);

	}
	protected void gvNDARview_RowDataBound(object sender, GridViewRowEventArgs e)
	{

		if(e.Row.RowType == DataControlRowType.DataRow)
		{
			 //GetDataEntryURL
			string url = sql.GetDataEntryURL(shortName);

			HyperLink lnk = new HyperLink();
			lnk.Target = "_blank";
			lnk.NavigateUrl = url + "?pk=" + e.Row.Cells[2].Text;
			lnk.Text = e.Row.Cells[0].Text;
			e.Row.Cells[0].Controls.Add(lnk);

		}
	}



	protected void Process_Button_Command(object sender, CommandEventArgs e)
	{
		if (e.CommandName == "LoadData")
		{
			int DatStructureInfo_isOK = LoadDataStructureInfo(shortName);
			if (DatStructureInfo_isOK == 0)
			{
				//            UpdatePanel_O_CheckBoxes p = (UpdatePanel_O_CheckBoxes)panelStudymeas.FindControlRecursive("smID");

				try
				{
					UpdatePanel_O_CheckBoxes p = (UpdatePanel_O_CheckBoxes)panelStudymeas.FindControlRecursive("studymeasID");

					string studymeasIDs = p.GetChecked_as_CSV();

					if (studymeasIDs == "")
					{
							//string message = "alert('Please choose which study measures to include.');";
							//ScriptManager.RegisterClientScriptBlock(sender as Control, this.GetType(), "alert", message, true);
							lblPleaseSelect.Visible = true;
					}

					else
					{
						lblPleaseSelect.Visible = false;
						LoadNDARview(shortName, studymeasIDs);

						btnSaveNDARCSV.Visible = true;


						if (chkShowSQLsyntax.Checked)
						{
							string sqlout = NDAR.GetSQL_for_NDAR_view(shortName, Master.Master_studyID, studymeasIDs);
							lblSQLsyntax.Text = "<b><u>SQL syntax for creating NDAR data for '" + shortName + "':</u></b><br/><br/>" + sqlout;
						}

					}
				}
				catch (Exception )
				{ }

			}

		}

	}
}