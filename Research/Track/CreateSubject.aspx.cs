using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

using AutismCenterBase.Utilities;
using Obout.Grid;
using Obout.Interface;
using uwac;

public partial class Track_CreateSubject : BasePage //System.Web.UI.Page
{
	private ReadConfig oConfig = new ReadConfig();
	private DBLookup oDBLookup;
	private SQL_utils sql ;

	private void Page_Load(object sender, System.EventArgs e)
	{
		sql = new SQL_utils("backend");

		int nPersonID = Convert.ToInt32(Request.QueryString["personID"].ToString());

		DataTable dt = sql.DataTable_from_ProcName("spGetPersonInfoByPersonID", sql.CreateParam("personID", nPersonID.ToString(), "int"));

		string sJSOutput = "";


		if (IsPostBack)
		{
			// MovePersonIntoStudy();
		}

	
		if (dt != null)
		{
			DataRow row = dt.Rows[0];
			string fullname = row["FullName"].ToString();
			//string fullname = dt.AsEnumerable().Select(f => f.Field<string>("FullName")).ToString();
			lblName.Text = fullname;
			tdTitle.InnerHtml = "Create Subject: " + fullname;
			//txtPersonName.Value = fullname;
			hidPersonID.Value = nPersonID.ToString();

		}
		else
		{
			//oReader.Close();
			tblMaster.Rows.Clear();

			HtmlTableRow oTr = new HtmlTableRow();
			HtmlTableCell oTd = new HtmlTableCell();
			tblMaster.Attributes["class"] = "";
			oTr.Cells.Add(oTd);
			tblMaster.Rows.Add(oTr);

			oTd.InnerHtml = "The Person ID you supplied is not valid.";
		}

		LoadMaxIDs();
//			LoadOtherIDs(nPersonID);

		//if (!IsPostBack)
		//{
		//	LoadGroups();
		//}


		//DropDownList ddlSite = gridOtherID.Templates[1].Container.FindControl("ddlSite") as DropDownList;
		//ddlSite.DataSource = sql_Site;
		//ddlSite.DataBind();

		sql.Close();
	}

	protected void MovePersonIntoStudy(object sender, EventArgs e)
	{
		MovePersonIntoStudy();
	}

	protected void MovePersonIntoStudy()
	{
		#region Move Person Into Study
		int nPersonID = Convert.ToInt32(hidPersonID.Value);
		int nStudyID = Convert.ToInt32(cboStudyID.Value);
		int nGroupID = Convert.ToInt32(cboGroupID.Value);
		string sID = txtSubjectID.Value;
		string sReturnValue = "0";
		string sSubjectID = "0";

	

		//SqlCommand oCmd = new SqlCommand();

		//oCmd.Connection = Master.SqlConn;
		//oCmd.CommandText = "trk.spCreateSubject_WEB";
		//oCmd.CommandTimeout = 90;
		//oCmd.CommandType = CommandType.StoredProcedure;

		//oCmd.Parameters.Add(new SqlParameter("@PersonID", SqlDbType.Int, 4, ParameterDirection.Input, true, 0, 0, "", DataRowVersion.Current, nPersonID));
		//oCmd.Parameters.Add(new SqlParameter("@StudyID", SqlDbType.Int, 4, ParameterDirection.Input, true, 0, 0, "", DataRowVersion.Current, nStudyID));
		//oCmd.Parameters.Add(new SqlParameter("@GroupID", SqlDbType.Int, 4, ParameterDirection.Input, true, 0, 0, "", DataRowVersion.Current, nGroupID));
		//oCmd.Parameters.Add(new SqlParameter("@ID", SqlDbType.VarChar, 100, ParameterDirection.Input, true, 0, 0, "", DataRowVersion.Current, sID));
		//oCmd.Parameters.Add(new SqlParameter("@SubjectID", SqlDbType.Int, 4, ParameterDirection.Output, true, 0, 0, "", DataRowVersion.Current, DBNull.Value));
		//oCmd.Parameters.Add(new SqlParameter("@ReturnValue", SqlDbType.Int, 4, ParameterDirection.ReturnValue, true, 0, 0, "", DataRowVersion.Current, DBNull.Value));

		if (nGroupID > 0 & nStudyID > 0 & nPersonID > 0 & sID.Length > 0)
		{
			lblInfo.Text = "OK: " + nGroupID.ToString() + "  " + nStudyID.ToString() + "  " + nPersonID.ToString() + "  " + sID;

			try
			{
				//oCmd.ExecuteNonQuery();


				//NEW VERSION IF NEEDED
				SQL_utils sql = new SQL_utils("backend");

				List<SqlParameter> ps = new List<SqlParameter>();
				ps.Add(sql.CreateParam("PersonID", nPersonID.ToString(), "int"));
				ps.Add(sql.CreateParam("StudyID", nStudyID.ToString(), "int"));
				ps.Add(sql.CreateParam("GroupID", nGroupID.ToString(), "int"));
				ps.Add(sql.CreateParam("ID", sID, "text"));
				ps.Add(sql.CreateParam("SubjectID", "0", "int", "output"));

				int newsubjID = sql.NonQuery_from_ProcName("trk.spCreateSubject_WEB", ps, "SubjectID");

				sSubjectID = newsubjID.ToString();
			}
			catch (Exception) 
			{

			}
		}
		else
		{
			lblInfo.Text = nGroupID.ToString() + "  " + nStudyID.ToString() + "  " + nPersonID.ToString() + "  " + sID;
		}

		//sReturnValue = oCmd.Parameters["@ReturnValue"].Value.ToString();
		//sSubjectID = oCmd.Parameters["@SubjectID"].Value.ToString();

		//if (sReturnValue == "0")
		if(sSubjectID != "0")
			Response.Redirect(@"~/Track/Subject.aspx?subjID=" + sSubjectID);
		else
		{
			HtmlTableRow oTr = new HtmlTableRow();
			HtmlTableCell oTd = new HtmlTableCell();
			HtmlGenericControl oSpan = new HtmlGenericControl("span");
			oSpan.Attributes["class"] = "error";
			oTd.Controls.Add(oSpan);
			oTr.Cells.Add(oTd);
			tblMaster.Rows.Insert(1, oTr);

			switch (sReturnValue)
			{
				case "1":
					oSpan.InnerHtml = "The Person you selected is already a Subject in the Study you selected.";
					break;
				case "2":
					oSpan.InnerHtml = "The ID you entered already exists in the Study you selected.";
					break;
				case "3":
					oSpan.InnerHtml = "The Person you selected has an ID in other related Studies that is different than the ID you entered.";
					break;
				case "4":
					oSpan.InnerHtml = "The ID you entered has already been used to identify a subject in a related study. This ID number is reserved for the same person it was applied to in the related study. Please select a different ID number.";
					break;
				case "5":
					oSpan.InnerHtml = "A Parent-Main subject must first be added to this household.";
					break;
				case "6":
					oSpan.InnerHtml = "Only 1 Proband subject per household is allowed.";
					break;
				case "7":
					oSpan.InnerHtml = "Only 1 Parent-Main subject per household is allowed.";
					break;
				case "8":
					oSpan.InnerHtml = "An internal error occurred in creating the Subject.";
					break;
			}
		}
		#endregion

	}

	#region Get Max IDs
	private SqlDataReader GetMaxIDs(SqlConnection oConn)
	{
		SqlCommand oCmd = new SqlCommand();
		SqlDataReader oReader;

		oCmd.Connection = oConn;
		oCmd.CommandText = "spGetMaxIDs";
		oCmd.CommandTimeout = 90;
		oCmd.CommandType = CommandType.StoredProcedure;

		oReader = oCmd.ExecuteReader();

		return oReader;
	}
	#endregion

	#region Clean Up ID
	private string CleanUpID(string sID)
	{
		string sReturn = sID.Trim();

		for (int i=0;i<sReturn.Length;i++)
		{
			if (sReturn.Substring(i, 1) != "0")
			{
				sReturn = sReturn.Substring(i);
				break;
			}
		}

		return sReturn;
	}
	#endregion

	#region Get Person Info
	//private SqlDataReader GetPersonInfo(int nPersonID)
	//{
	//	SqlCommand oCmd = new SqlCommand();
	//	SqlDataReader oReader;

	//	oCmd.Connection = Master.SqlConn;
	//	oCmd.CommandText = "spGetPersonInfoByPersonID";
	//	oCmd.CommandTimeout = 90;
	//	oCmd.CommandType = CommandType.StoredProcedure;

	//	oCmd.Parameters.Add(new SqlParameter("@PersonID", SqlDbType.VarChar, 100, ParameterDirection.Input, true, 0, 0 , "", DataRowVersion.Current, nPersonID));

	//	oReader = oCmd.ExecuteReader();

	//	return oReader;
	//}
	#endregion


	protected void LoadGroups(object sender, EventArgs e)
	{
		if (cboStudyID.Value.ToString() != "-1")
		{

			SQL_utils sql = new SQL_utils("backend");
			DataTable dt = sql.DataTable_from_ProcName("spSEC_GetGroups_by_StudyID", sql.CreateParam("studyID", cboStudyID.Value.ToString(), "int"));

			cboGroupID.DataSource = dt;
			cboGroupID.DataBind();
			cboGroupID.ValueField = "groupID";
			cboGroupID.TextField = "GroupName";
			cboGroupID.SelectedIndex = 0;
		}
	}

	protected void cboStudyID_OnInit(object sender, EventArgs e)
	{
		cboStudyID.SelectedIndex = 0;

	}


	protected void LoadMaxIDs()
	{
		try
		{
			string spSQL = "exec spGet_MaxID_by_Group " + Int32.Parse(cboStudyID.Value.ToString());
			GridView gv1 = new AutoGridView("backend", spSQL, "gv_maxID", false, "", "");
			Panel_maxID.Controls.Clear();
			Panel_maxID.Controls.Add(gv1);
		}
		catch (Exception ex) {
			string x = ex.Message;
		}
	}


		

	protected void LoadOtherIDs(int npersonID)
	{
		//SQL_utils sql = new SQL_utils("backend");

		//DataTable dt = sql.DataTable_from_SQLstring("select otherID_pk, personID, otherID, sitename from vwOtherID2 where personID=" + npersonID.ToString());

		////gvOtherID.DataSource = dt;
		////gvOtherID.DataBind();

		//gridOtherID.DataSource = dt;
		//gridOtherID.DataBind();

		//sql.Close();
	}

	//protected void btnInsertOtherID_Click(object sender, EventArgs e)
	//{

	//    string s = "insert into tblOtherID (personID, otherID, otherIDsiteID) values(" + Convert.ToInt32(Request["PersonID"].ToString()) +
	//        ", '" + txtOtherID.Text + "', " + ddlSite.SelectedValue.ToString() + ")";

	//    sql.NonQuery_from_SQLstring(s);

	//    LoadOtherIDs(Convert.ToInt32(Request["PersonID"].ToString()));

	//    txtOtherID.Text = "";
	//    ddlSite.SelectedIndex = 0;

	//}



	#region Web Form Designer generated code
	override protected void OnInit(EventArgs e)
	{
		InitializeComponent();
		base.OnInit(e);
	}
		
	private void InitializeComponent()
	{    
		this.Load += new System.EventHandler(this.Page_Load);
	}
	#endregion

	protected void gridOtherID_UpdateCommand(object sender, Obout.Grid.GridRecordEventArgs e)
	{
		try
		{
			string x = "";
			oboutGrid_utils o = new oboutGrid_utils();
			x = o.oGrid_UpdateData(e.Record, "tblOtherID", "backend", "dbo", "otherID_pk");
		}
		catch (Exception ) { }
	}

	protected void gridOtherID_InsertCommand(object sender, GridRecordEventArgs e)
	{

		int personID = Convert.ToInt32( Request.QueryString["personID"]);
		int otherIDsiteID = Convert.ToInt32(e.Record["otherIDsiteID"]);

		if (personID > 0 & otherIDsiteID > 0)
		{
			try
			{
				string x = "";
				oboutGrid_utils o = new oboutGrid_utils();

				e.Record["personID"] = personID;

				x = o.oGrid_InsertData(e.Record, "tblOtherID", "backend", "dbo");
			}
			catch (Exception ) { }
		}
	}


	protected void gridOtherID_Rebind(object sender, EventArgs e)
	{

		int personID = Convert.ToInt32(Request.QueryString["personID"]);

		if (personID > 0)
		{
			LoadOtherIDs(personID);
		}
	}
	//protected void gridOtherID_RowDataBound(object sender, Obout.Grid.GridRowEventArgs e)
	//{
	//    if (e.Row.RowType == GridRowType.DataRow)
	//    {

	//        DataRowView dv = (DataRowView)e.Row.DataItem;


	//            DropDownList ddlSite = (DropDownList)e.Row.FindControlRecursive("ddlSite");

	//        //foreach (GridDataControlFieldCell cell in e.Row.Cells)
	//        //{
	//        //    DropDownList ddlSite = (DropDownList)cell.FindControl("ddlSite");
	//        //    if (ddlSite != null)
	//        //    {
	//        //        ddlSite.SelectedValue = dv["sitename"].ToString();
	//        //    }
	//        //}
	//    }
	

	//}

}

