using System;
using System.Collections;
using System.ComponentModel;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Web;
using System.Web.SessionState;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;

using AutismCenterBase.Utilities;

namespace StudyDesign.DataTableInfo
{
	public partial class EditDataTableRenameFields : System.Web.UI.Page
	{
		private SqlConnection oConn = new SqlConnection(ConfigurationManager.ConnectionStrings["DATA_CONN_STRING"].ToString());
		private DBLookup oDBLookup;

		private void Page_Load(object sender, System.EventArgs e)
		{
			if (!Master.AutismLogin.CheckGroupPermissions("IT Staff Group".Split(',')))
			{
				tblMaster.Rows.Clear();
				tblMaster.Attributes["class"] = "";

				HtmlTableRow oTr = new HtmlTableRow();
				HtmlTableCell oTd = new HtmlTableCell();
				oTd.Attributes["class"] = "error";
				oTd.InnerHtml = "You do not have permission to view this page.";
				oTr.Cells.Add(oTd);
				tblMaster.Rows.Add(oTr);
			}
			else if (!IsPostBack)
			{
				oConn.Open();

				hidTableID.Value = Request["TableID"].ToString();

				DisplayFields(Convert.ToInt32(Request["TableID"].ToString()));

				oConn.Close();
			}
			else
				btnAddRenameField.Style["display"] = "inline";
		}

		#region Save Changes
		protected void SaveChanges(object sender, System.EventArgs e)
		{
			string[] aPKs = Request["hidFieldRenameID"].Replace(", ", ",").Split(',');
			string[] aDatabaseField = Request["selFieldID"].Replace(", ", ",").Split(',');
			string[] aFieldNameFinal = Request["txtFieldNameFinal"].Replace(", ", ",").Split(',');

			SqlCommand oCmd = new SqlCommand();
			oCmd.Connection = oConn;
			oCmd.CommandTimeout = 90;
			oCmd.CommandType = CommandType.StoredProcedure;
			oCmd.CommandText = "spUpdateRenameFieldInfo";

			oCmd.Parameters.Add("@PK", SqlDbType.Int, 4);
			oCmd.Parameters.Add("@TableID", SqlDbType.Int, 4);
			oCmd.Parameters.Add("@DatabaseField", SqlDbType.VarChar, 50);
			oCmd.Parameters.Add("@FieldNameFinal", SqlDbType.VarChar, 50);
			oCmd.Parameters["@PK"].Direction = ParameterDirection.InputOutput;

			oConn.Open();

			for (int i=0;i<aPKs.Length;i++)
			{
				oCmd.Parameters["@PK"].Value = aPKs[i];
				oCmd.Parameters["@TableID"].Value = hidTableID.Value;
				oCmd.Parameters["@DatabaseField"].Value = aDatabaseField[i];
				oCmd.Parameters["@FieldNameFinal"].Value = aFieldNameFinal[i];

				if (oCmd.Parameters["@PK"].Value.ToString() == "") {oCmd.Parameters["@PK"].Value = DBNull.Value;}

				oCmd.ExecuteNonQuery();
			}

			if (Request["chkDelete"] != null)
			{
				oCmd.Parameters.Clear();
				oCmd.CommandText = "spDeleteMultipleRenameFields";
				oCmd.Parameters.AddWithValue("@PKs", Request["chkDelete"].ToString());

				oCmd.ExecuteNonQuery();
			}

			DisplayFields(Convert.ToInt32(hidTableID.Value));

			oConn.Close();

			btnAddRenameField.Style["display"] = "inline";
		}
		#endregion

		#region Add Rename Field
		protected void AddRenameField(object sender, System.EventArgs e)
		{
			oConn.Open();
			oDBLookup = new DBLookup(oConn);

			DisplayFields(Convert.ToInt32(Request["TableID"].ToString()));

			HtmlTableRow oTr;
			HtmlTableCell oTd;

			for (int i=0;i<Convert.ToInt32(hidFieldsToAdd.Value);i++)
			{
				oTr = new HtmlTableRow();

				oTd = new HtmlTableCell();
				oTd.InnerHtml = "&nbsp;";
				oTr.Cells.Add(oTd);

				oTd = new HtmlTableCell();
				oTd.InnerHtml = oDBLookup.BindDropDownList("selFieldID", "EXEC uwautism_research_data.dbo.spGetFieldInfoByDataTableID " + hidTableID.Value, "DatabaseField", "DatabaseField", "", "--Select Field--", "width: 250px;");
				oTr.Cells.Add(oTd);

				oTd = new HtmlTableCell();
				oTd.InnerHtml = "<input type=\"text\" name=\"txtFieldNameFinal\" value=\"\" />";
				oTd.InnerHtml += "<input type=\"hidden\" name=\"hidFieldRenameID\" value=\"\" />";
				oTr.Cells.Add(oTd);

				tblMaster.Rows.Insert(tblMaster.Rows.Count-1, oTr);
			}

			oConn.Close();

			btnAddRenameField.Style["display"] = "none";
		}
		#endregion

		#region Display Fields
		private void DisplayFields(int nTableID)
		{
			oDBLookup = new DBLookup();
			SqlCommand oCmd = new SqlCommand();
			oCmd.Connection = oConn;
			oCmd.CommandTimeout = 90;
			oCmd.CommandType = CommandType.StoredProcedure;
			oCmd.CommandText = "spGetRenameFieldInfoByTableID";
			oCmd.Parameters.AddWithValue("@TableID", nTableID);

			SqlDataReader oReader = oCmd.ExecuteReader();

			HtmlTableRow oTr;
			HtmlTableCell oTd;

			while (oReader.Read())
			{
				oTr = new HtmlTableRow();

				oTd = new HtmlTableCell();
				oTd.Style["text-align"] = "center";
				oTd.InnerHtml = "<input type=\"checkbox\" name=\"chkDelete\" value=\"" + oReader["PK"].ToString() + "\" />";
				oTr.Cells.Add(oTd);

				oTd = new HtmlTableCell();
				oTd.InnerHtml = oDBLookup.BindDropDownList("selFieldID", "EXEC uwautism_research_data.dbo.spGetFieldInfoByDataTableID " + hidTableID.Value, "DatabaseField", "DatabaseField", oReader["DatabaseField"].ToString(), "--Select Field--", "width: 250px;");
				oTr.Cells.Add(oTd);

				oTd = new HtmlTableCell();
				oTd.InnerHtml = "<input type=\"text\" name=\"txtFieldNameFinal\" value=\"" + oReader["FieldNameFinal"].ToString() + "\" />";
				oTd.InnerHtml += "<input type=\"hidden\" name=\"hidFieldRenameID\" value=\"" + oReader["PK"].ToString() + "\" />";
				oTr.Cells.Add(oTd);

				tblMaster.Rows.Insert(tblMaster.Rows.Count-1, oTr);
			}
		}
		#endregion
	}
}