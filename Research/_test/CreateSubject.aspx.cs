using System;
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

namespace Household
{
	public partial class CreateSubject : System.Web.UI.Page
	{
		private ReadConfig oConfig = new ReadConfig();
		private DBLookup oDBLookup;

		private void Page_Load(object sender, System.EventArgs e)
		{
			oDBLookup = new DBLookup(Master.SqlConn);

			//Form.Attributes["onsubmit"] = "return(DoSubmitCreateSubject());";

			int nPersonID = Convert.ToInt32(Request["PersonID"].ToString());
			string sJSOutput = "";


			if (IsPostBack)
			{
			   // MovePersonIntoStudy();
			}

			SqlDataReader oReader = GetPersonInfo(nPersonID);

			if (oReader.HasRows)
			{
				oReader.Read();

				tdTitle.InnerHtml += oReader["FullName"].ToString();
				txtPersonName.Value = oReader["FullName"].ToString();
				hidPersonID.Value = nPersonID.ToString();
				int i = 0;

				oReader.Close();

				if (selStudyID.Items.Count == 0)
					oDBLookup.BindDropDownList(ref selStudyID, "EXEC spGetActiveStudies", "StudyFullName", "StudyID", "", "--Select a Study--");

				oReader = GetMaxIDs(Master.SqlConn);

				sJSOutput = "<script type=\"text/javascript\">\n";
				sJSOutput += "var aSubjIDs = new Array();\n\n";

				while (oReader.Read())
				{
					sJSOutput += "aSubjIDs[" + i.ToString() + "] = new Array(2);\n";
					sJSOutput += "aSubjIDs[" + i.ToString() + "][0] = " + oReader["StudyID"].ToString() + ";\n";
					sJSOutput += "aSubjIDs[" + i.ToString() + "][1] = '" + CleanUpID(oReader["MaxID"].ToString()) + "';\n\n";

					i++;
				}

				sJSOutput += "</script>\n";
				spnJS.InnerHtml = sJSOutput;

				oReader.Close();
			}
			else
			{
				oReader.Close();
				tblMaster.Rows.Clear();

				HtmlTableRow oTr = new HtmlTableRow();
				HtmlTableCell oTd = new HtmlTableCell();
				tblMaster.Attributes["class"] = "";
				oTr.Cells.Add(oTd);
				tblMaster.Rows.Add(oTr);

				oTd.InnerHtml = "The Person ID you supplied is not valid.";
			}


			if (!IsPostBack)
			{
				LoadGroups();
				LoadMaxIDs();
			}
		}

		protected void MovePersonIntoStudy(object sender, EventArgs e)
		{
			MovePersonIntoStudy();
		}

		protected void MovePersonIntoStudy()
		{
			#region Move Person Into Study
			int nPersonID = Convert.ToInt32(hidPersonID.Value);
			int nStudyID = Convert.ToInt32(selStudyID.SelectedValue);
			int nGroupID = Convert.ToInt32(ddlGroupID.SelectedValue);
			string sID = txtSubjectID.Value;
			string sReturnValue = "0";
			string sSubjectID = "0";

			SqlCommand oCmd = new SqlCommand();

			oCmd.Connection = Master.SqlConn;
			oCmd.CommandText = "spCreateSubject_WEB";
			oCmd.CommandTimeout = 90;
			oCmd.CommandType = CommandType.StoredProcedure;

			oCmd.Parameters.Add(new SqlParameter("@PersonID", SqlDbType.Int, 4, ParameterDirection.Input, true, 0, 0, "", DataRowVersion.Current, nPersonID));
			oCmd.Parameters.Add(new SqlParameter("@StudyID", SqlDbType.Int, 4, ParameterDirection.Input, true, 0, 0, "", DataRowVersion.Current, nStudyID));
			oCmd.Parameters.Add(new SqlParameter("@GroupID", SqlDbType.Int, 4, ParameterDirection.Input, true, 0, 0, "", DataRowVersion.Current, nGroupID));
			oCmd.Parameters.Add(new SqlParameter("@ID", SqlDbType.VarChar, 100, ParameterDirection.Input, true, 0, 0, "", DataRowVersion.Current, sID));
			oCmd.Parameters.Add(new SqlParameter("@SubjectID", SqlDbType.Int, 4, ParameterDirection.Output, true, 0, 0, "", DataRowVersion.Current, DBNull.Value));
			oCmd.Parameters.Add(new SqlParameter("@ReturnValue", SqlDbType.Int, 4, ParameterDirection.ReturnValue, true, 0, 0, "", DataRowVersion.Current, DBNull.Value));

			if (nGroupID > 0 & nStudyID > 0 & nPersonID > 0 & sID.Length > 0)
			{
				lblInfo.Text = "OK: " + nGroupID.ToString() + "  " + nStudyID.ToString() + "  " + nPersonID.ToString() + "  " + sID;

				try
				{
					oCmd.ExecuteNonQuery();
				}
				catch (Exception) 
				{

				}
			}
			else
			{
				lblInfo.Text = nGroupID.ToString() + "  " + nStudyID.ToString() + "  " + nPersonID.ToString() + "  " + sID;
			}

			sReturnValue = oCmd.Parameters["@ReturnValue"].Value.ToString();
			sSubjectID = oCmd.Parameters["@SubjectID"].Value.ToString();

			if (sReturnValue == "0")
				Response.Redirect(@"~/Measures/EditSubject.aspx?SubjID=" + sSubjectID);
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
		private SqlDataReader GetPersonInfo(int nPersonID)
		{
			SqlCommand oCmd = new SqlCommand();
			SqlDataReader oReader;

			oCmd.Connection = Master.SqlConn;
			oCmd.CommandText = "spGetPersonInfoByPersonID";
			oCmd.CommandTimeout = 90;
			oCmd.CommandType = CommandType.StoredProcedure;

			oCmd.Parameters.Add(new SqlParameter("@PersonID", SqlDbType.VarChar, 100, ParameterDirection.Input, true, 0, 0 , "", DataRowVersion.Current, nPersonID));

			oReader = oCmd.ExecuteReader();

			return oReader;
		}
		#endregion


		protected void LoadGroups(object sender, EventArgs e)
		{
			LoadGroups();
		}

		protected void LoadGroups ()
		{
			SqlCommand cmd = new SqlCommand();
			SqlConnection conn = new SqlConnection();
			if (conn.State == ConnectionState.Closed)
			{
				conn.ConnectionString = ConfigurationManager.ConnectionStrings["TRACKING_CONN_STRING"].ToString();
				conn.Open();
			}
			cmd.Connection = conn;
			cmd.CommandText = "spSEC_GetGroups_by_StudyID";
			cmd.CommandTimeout = 90;
			cmd.CommandType = CommandType.StoredProcedure;

			cmd.Parameters.Add("@studyID", SqlDbType.Int);
			cmd.Parameters["@studyID"].Value = Int32.Parse(selStudyID.SelectedValue.ToString());

			SqlDataReader dataReader = cmd.ExecuteReader();

			DataTable dt = new DataTable();
			dt.Load(dataReader);

			ddlGroupID.DataSource = dt;
			ddlGroupID.DataBind();
			ddlGroupID.DataValueField = "groupID";
			ddlGroupID.DataTextField = "GroupName";
			


		}


		protected void LoadMaxIDs()
		{            
			string spSQL = "exec spGet_MaxID_by_Group " +  Int32.Parse(selStudyID.SelectedValue.ToString());
			GridView gv1 = new AutoGridView("backend", spSQL, "gv_maxID", false, "", "");
			Panel_maxID.Controls.Clear();
			Panel_maxID.Controls.Add(gv1);
		}



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
	}
}
