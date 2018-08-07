using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.IO;
using System.Web.UI.WebControls;
using NReco.PivotData;
using NReco.PivotData.Output;

using DevExpress.Web;
using DevExpress.Web.Internal;

using uwac;

public partial class Tracking_code6 : BasePage //System.Web.UI.Page
{

	const string UploadDirectory = "~/App_Data/DataUploads/";

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


			int numfail = sql.IntScalar_from_SQLstring("select coalesce(count(*),0) from tblOtherID_failed");

			lblNumFailed.Text = String.Format("# of failed otherID records: {0}", numfail);


			sql.Close();
		}
		else{
			if(Session["labstudies"] != null)
			{
				gridStudy.DataSource = (DataTable)Session["labstudies"];
				gridStudy.DataBind();
			}
		}
	}


	//protected void UploadToDB() {
	//	if (Path.GetExtension(Upload.FileName).Equals(".xlsx"))
	//	{
	//		var excel = new ExcelPackage(Upload.FileContent);
	//		var dt = excel.ToDataTable();
	//		var table = "Contacts";
	//		using (var conn = new SqlConnection("Server=.;Database=Test;Integrated Security=SSPI"))
	//		{
	//			var bulkCopy = new SqlBulkCopy(conn);
	//			bulkCopy.DestinationTableName = table;
	//			conn.Open();
	//			var schema = conn.GetSchema("Columns", new[] { null, null, table, null });
	//			foreach (DataColumn sourceColumn in dt.Columns)
	//			{
	//				foreach (DataRow row in schema.Rows)
	//				{
	//					if (string.Equals(sourceColumn.ColumnName, (string)row["COLUMN_NAME"], StringComparison.OrdinalIgnoreCase))
	//					{
	//						bulkCopy.ColumnMappings.Add(sourceColumn.ColumnName, (string)row["COLUMN_NAME"]);
	//						break;
	//					}
	//				}
	//			}
	//			bulkCopy.WriteToServer(dt);
	//		}
	//	}
	//}

	protected void LoadListBox_Study()
	{
		SQL_utils sql = new SQL_utils("backend");


		DataTable dt = sql.DataTable_from_SQLstring("select a.studyID, studyname from tblStudy a " +
			" join (select labID, studyID from vwLabGroup where labID = " + ddlLab.SelectedValue.ToString() + " group by labID, studyID) b ON a.studyID = b.studyID" +
			" order by a.studyname");


		//lstStudy.DataValueField = "studyID";
		//lstStudy.DataTextField = "studyname";

		//lstStudy.DataSource = dt;
		//lstStudy.DataBind();

		Session["labstudies"] = dt;
		gridStudy.DataSource = dt;
		gridStudy.DataBind();

		sql.Close();
	}


	protected void LoadListBox_Group(string grps)
	{

		string[] grp = grps.Split(',');

		SQL_utils sql = new SQL_utils("backend");

		DataTable dt = sql.DataTable_from_SQLstring("select groupID, '(' + studyname + ') ' + groupname  as groupname from tblgroup a join tblStudy b ON a.studyID = b.studyID " + 
			" where a.studyID in (" + grps + ") ");

		//lstGroup.DataValueField = "groupID";
		//lstGroup.DataTextField = "groupname";

		//lstGroup.DataSource = dt;
		//lstGroup.DataBind();



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
			//var x = lstStudy.SelectedValue;


			var x2 = gridStudy.GetSelectedFieldValues("studyID");

			if (x2.Count == 0)
			//if (lstStudy.SelectedValue == "")
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

				string study_csv = String.Join(",", x2);

				List<SqlParameter> ps = new List<SqlParameter>();
				ps.Add(sql.CreateParam("labID", labID.ToString(), "int"));
				//ps.Add(sql.CreateParam("study_csv", lstStudy.SelectedValue, "text"));
				ps.Add(sql.CreateParam("study_csv", study_csv, "text"));

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
		//LoadListBox_Group(lstStudy.SelectedValue);
	}
	protected void lstStudy_SelectedIndexChanged(object sender, Obout.ListBox.ListBoxItemEventArgs e)
	{
		//string x = lstStudy.SelectedValue;
	}
	protected void btnSingle_Click(object sender, EventArgs e)
	{
		ShowCode6_Single();
	}


	#region Upload files

	//protected void UploadControl_FileUploadComplete(object sender, FileUploadCompleteEventArgs e)
	//{
	//	string resultExtension = Path.GetExtension(e.UploadedFile.FileName);
	//	string resultFileName = Path.ChangeExtension(Path.GetRandomFileName(), resultExtension);
	//	string resultFileUrl = UploadDirectory + resultFileName;
	//	string resultFilePath = MapPath(resultFileUrl);
	//	e.UploadedFile.SaveAs(resultFilePath);

	//	//UploadingUtils.RemoveFileWithDelay(resultFileName, resultFilePath, 5);

	//	string name = e.UploadedFile.FileName;
	//	string url = ResolveClientUrl(resultFileUrl);
	//	long sizeInKilobytes = e.UploadedFile.ContentLength / 1024;
	//	string sizeText = sizeInKilobytes.ToString() + " KB";
	//	e.CallbackData = name + "|" + url + "|" + sizeText;
	//}

	protected void UploadControl_FilesUploadComplete(object sender, FilesUploadCompleteEventArgs e)
	{
		foreach (UploadedFile file in UploadControl.UploadedFiles)
		{
			if (!string.IsNullOrEmpty(file.FileName) && file.IsValid)
			{
				try
				{
					var savedfileinfo = SavePostedFiles(file);
					var uploadinfo = e.CallbackData;

					string outcome = ProcessOtherIDfile(file.FileName);

					e.CallbackData += "Success." + outcome;

				}
				catch (Exception ex)
				{
					//e.IsValid = false;
					e.ErrorText = ex.Message;
				}
			}
		}
	}

	protected string SavePostedFiles(UploadedFile uploadedFile)
	{
		string ret = "";
		if (uploadedFile.IsValid)
		{
			FileInfo fileInfo = new FileInfo(uploadedFile.FileName);
			string resFileName = MapPath(UploadDirectory) + fileInfo.Name;
			uploadedFile.SaveAs(resFileName);

			string fileLabel = fileInfo.Name;
			string fileType = uploadedFile.ContentType.ToString();
			string fileLength = uploadedFile.ContentLength / 1024 + "K";
			ret = string.Format("{0} <i>({1})</i> {2}|{3}",
				fileLabel, fileType, fileLength, fileInfo.Name);
		}
		return ret;
	}

	protected string ProcessOtherIDfile(string filename)
	{
		string result = "";
		string fullname = MapPath(UploadDirectory) + filename;
		DataSet ds = SpreadsheetGearUtils.GetDataSet(fullname, false);

		DataTable dt = ds.Tables[0];

		bool hasID = false;
		bool hasotherID = false;
		bool hassiteID = false;
		bool hasstudyID = false;
		foreach(DataColumn col in dt.Columns)
		{
			string colname = col.ColumnName.ToLower();
			col.ColumnName = colname;
			if (colname == "id") hasID = true;
			if (colname == "otherid") hasotherID = true;
			if (colname == "siteid") hassiteID = true;
			if (colname == "studyid") hasstudyID = true;
		}

		if (hasID && hasotherID && hassiteID && hasstudyID)
		{

			SQL_utils sql = new SQL_utils("data");

			int success_counter = 0;
			int insertfail_counter = 0;
			int cantfindID_counter = 0;
			for (int i = 0; i < dt.Rows.Count; i++)
			{
				DataRow row = dt.Rows[i];

				string otherID = row["otherid"].ToString();
				string siteID = row["siteid"].ToString();
				string studyID = row["studyid"].ToString();
				string ID = row["id"].ToString();

				int personID = 0;
				try
				{
					personID = sql.IntScalar_from_SQLstring(String.Format("select personID from uwautism_research_backend..vwMasterStatus_S where ID='{0}' and studyID={1}", ID, studyID));
				}
				catch(Exception ex)
				{
					string sqlcode2 = String.Format("insert into uwautism_research_backend..tblOtherID_failed(studyID, ID, otherID, otherIDsiteID, failreason, created, createdBy) values({0},'{1}','{2}', {3}, 'No personID',getdate(), sec.systemuser())"
							, studyID, ID, otherID, siteID);
					sql.NonQuery_from_SQLstring(sqlcode2);

					cantfindID_counter++;
				}


				if (personID > 0)
				{
					string sqlcode = String.Format("insert into uwautism_research_backend..tblOtherID(personID, otherID, otherIDsiteID, created, createdBy) values({0},'{1}',{2}, getdate(), sec.systemuser())"
							, personID, otherID, siteID);
					try
					{
						sql.NonQuery_from_SQLstring(sqlcode);
						success_counter++;
					}
					catch (Exception ex)
					{
						string sqlcode2 = String.Format("insert into uwautism_research_backend..tblOtherID_failed(studyID, ID, otherID, otherIDsiteID, failreason, created, createdBy) values({0},'{1}','{2}', {3}, 'failed insert',getdate(), sec.systemuser())"
									, studyID, ID, otherID, siteID);
						sql.NonQuery_from_SQLstring(sqlcode2);


						insertfail_counter++;
					}
				}
			}

			result = String.Format(" OtherID inserted for {0} records.", success_counter);
			if (cantfindID_counter > 0)
			{
				result += String.Format(" Cannot find ID for {0} records", cantfindID_counter);
			}
			if (insertfail_counter > 0)
			{
				result += String.Format(" Insert failed for {0} records", insertfail_counter);
			}
		}
		else{
			result = "File does not contain all the required fields: studyID, ID, otherID, siteID.  Check the file for the correct column names.";
		}


		return result;
	}
	#endregion
}