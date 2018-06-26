using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Web;
using System.Web.SessionState;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;

using AutismCenterBase.Utilities;
using uwac;

namespace DataEntry.DataStorage
{
	public partial class SearchStorageUnits : System.Web.UI.Page
	{
		private DataTable oTable;
		private DBLookup oDBLookup;

		private void Page_Load(object sender, System.EventArgs e)
		{
			Form.Attributes["onsubmit"] = "return(DoSubmitSearchStorageUnit());";

			//oDBLookup = new DBLookup(Master.SqlConn);
			oDBLookup = new DBLookup("backend");

			if (!IsPostBack)
			{
				oDBLookup.BindDropDownList(ref selStudyID, "EXEC spGetActiveStudies", "StudyFullName", "StudyID", "", "--Select a Study--");
				oDBLookup.BindDropDownList(ref selStorageLocationID, "EXEC spGetStorageLocations", "StorageLocation", "StorageLocationID", "", "--Select Location--");
				oDBLookup.BindDropDownList(ref selStorageContent, "EXEC spGetStorageContents", "StorageContent", "StorageContentID", "", "--Select Contents--");
			}
		}

		protected void FindStorageUnits(object sender, System.EventArgs e)
		{
			//SqlCommand oCmd = new SqlCommand();
			//SqlDataAdapter oAdapter = new SqlDataAdapter(oCmd);
			//oTable = new DataTable();

			//oCmd.Connection = Master.SqlConn;
			//oCmd.CommandTimeout = 90;
			//oCmd.CommandType = CommandType.StoredProcedure;
			//oCmd.CommandText = "spSearchStorageUnits";

			//oCmd.Parameters.AddWithValue("@StudyID", selStudyID.SelectedValue);
			//oCmd.Parameters.AddWithValue("@ID", txtSubjID.Text.Trim());
			//oCmd.Parameters.AddWithValue("@StorageLocationID", selStorageLocationID.SelectedValue);
			//oCmd.Parameters.AddWithValue("@StorageContentID", selStorageContent.SelectedValue);

			//if (oCmd.Parameters["@ID"].Value.ToString() == "") {oCmd.Parameters["@ID"].Value = DBNull.Value;}
			//if (oCmd.Parameters["@StorageLocationID"].Value.ToString() == "-1") {oCmd.Parameters["@StorageLocationID"].Value = DBNull.Value;}
			//if (oCmd.Parameters["@StorageContentID"].Value.ToString() == "-1") {oCmd.Parameters["@StorageContentID"].Value = DBNull.Value;}

			//oAdapter.Fill(oTable);

			SQL_utils sql = new SQL_utils("backend");

			List<SqlParameter> ps = new List<SqlParameter>();

			ps.Add(sql.CreateParam("StudyID", selStudyID.SelectedValue, "int"));
			ps.Add(sql.CreateParam("ID", txtSubjID.Text.Trim(), "text"));
			ps.Add(sql.CreateParam("StorageLocationID", selStorageLocationID.SelectedValue, "int"));
			ps.Add(sql.CreateParam("StorageContentID", selStorageContent.SelectedValue, "int"));



			DataTable oTable = sql.DataTable_from_ProcName("spSearchStorageUnits", ps);


			if (oTable.Rows.Count > 0)
			{
				tblSearchResults.DataSource = oTable;
				tblSearchResults.DataBind();

				tblSearchResults.Style["display"] = "inline";
				tdErrMsg.Style["display"] = "none";
			}
			else
			{
				tblSearchResults.Style["display"] = "none";
				tdErrMsg.Style["display"] = "inline";
				tdErrMsg.Style["color"] = "#ff0000";
				tdErrMsg.InnerHtml = "There were no results that matched your search.";
			}
		}

		protected void Item_Bound(object sender, DataGridItemEventArgs e)
		{
			string sStaffID = Request.Cookies["UserProfile"].Values["StaffID"].ToString();

			if (e.Item.DataSetIndex >= 0)
			{
				e.Item.Attributes["onclick"] = "HighlightRow(this);";

				HtmlAnchor oLink = new HtmlAnchor();
				oLink.Attributes["id"] = "aStatus" + oTable.Rows[e.Item.DataSetIndex]["StorageUnitID"].ToString();

				if (oTable.Rows[e.Item.DataSetIndex]["StaffShortName"].ToString() != "")
				{
					oLink.InnerHtml = oTable.Rows[e.Item.DataSetIndex]["StaffShortName"].ToString() + " - " + oTable.Rows[e.Item.DataSetIndex]["CheckOutDate"].ToString();
					oLink.HRef = "javascript:CheckOutStorageUnit(" + oTable.Rows[e.Item.DataSetIndex]["StorageUnitID"].ToString() + ", " + sStaffID + ", 2);";
					oLink.Style["color"] = "#ff0000";
				}
				else
				{
					oLink.InnerHtml = "Check Out Now";
					oLink.HRef = "javascript:CheckOutStorageUnit(" + oTable.Rows[e.Item.DataSetIndex]["StorageUnitID"].ToString() + ", " + sStaffID + ", 1);";
					oLink.Style["color"] = "#008800";
				}

				e.Item.Cells[5].Controls.Add(oLink);
			}
		}
	}
}