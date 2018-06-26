using System;
using System.Collections;
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

namespace DataEntry.DataStorage
{
	public partial class EnterStorageUnit : System.Web.UI.Page
	{
		private SqlCommand oCmd;
		private SqlDataReader oReader;
		private DBLookup oDBLookup;

		private void Page_Load(object sender, System.EventArgs e)
		{
			Form.Attributes["onsubmit"] = "return(DoSubmitDataStorage());";

			oDBLookup = new DBLookup(Master.SqlConn);

			if (!IsPostBack)
			{
				oDBLookup.BindDropDownList(ref selStorageLocationID, "EXEC spGetAllStorageLocations", "StorageLocation", "StorageLocationID", selStorageLocationID.SelectedValue, "--Select Storage Location--");
				oDBLookup.BindDropDownList(ref selStorageUnitTypeID, "EXEC spGetAllStorageUnitTypes", "StorageUnitType", "StorageUnitTypeID", selStorageUnitTypeID.SelectedValue, "--Select Storage Unit Type--");
				oDBLookup.BindDropDownList(ref selStorageContentID, "EXEC spGetAllStorageContents", "StorageContent", "StorageContentID", selStorageContentID.SelectedValue, "--Select Storage Content Type--");
				oDBLookup.BindDropDownList(ref selStudyID, "EXEC spGetAllStudies", "StudyName", "StudyID", selStudyID.SelectedValue, "--Select Study--");

				#region Get Storage Unit if a Querystring Parameter is Passed
				if (Request["StorageUnitID"] != null)
				{
					hidStorageUnitID.Value = Request["StorageUnitID"].ToString();

					oCmd = new SqlCommand();
					oCmd.Connection = Master.SqlConn;
					oCmd.CommandTimeout = 90;
					oCmd.CommandType = CommandType.StoredProcedure;
					oCmd.CommandText = "spGetStorageUnitByStorageUnitID";

					oCmd.Parameters.AddWithValue("@StorageUnitID", hidStorageUnitID.Value);

					oReader = oCmd.ExecuteReader();

					if (oReader.HasRows)
					{
						while (oReader.Read())
						{
							selStudyID.SelectedValue = oReader["StudyID"].ToString();
							selStorageLocationID.SelectedValue = oReader["StorageLocationID"].ToString();
							selStorageUnitTypeID.SelectedValue = oReader["StorageUnitTypeID"].ToString();
							selStorageContentID.SelectedValue = oReader["StorageContentID"].ToString();
							txtStorageUnitNumber.Text = oReader["StorageUnitNumber"].ToString();
							txtDescription.Text = oReader["UnitDescription"].ToString();
							txtSubjects.Text += oReader["ID"].ToString() + "\n";
						}

						txtSubjects.Text = txtSubjects.Text.Remove(txtSubjects.Text.LastIndexOf("\n"), 1);
					}

					oReader.Close();
				}
				#endregion

				#region Create a CLient-Side Script Block for Getting the Next Storage Unit Number
				HtmlGenericControl oScript = new HtmlGenericControl("script");
				oCmd = new SqlCommand();
				int nCount = 0;

				oScript.Attributes["type"] = "text/javascript";

				oCmd.Connection = Master.SqlConn;
				oCmd.CommandTimeout = 90;
				oCmd.CommandType = CommandType.StoredProcedure;
				oCmd.CommandText = "spGetMaxStorageUnitNumbers";

				oReader = oCmd.ExecuteReader();

				oScript.InnerHtml += "\nvar aMaxStorageUnits = new Array();\n\n";

				while (oReader.Read())
				{
					oScript.InnerHtml += "aMaxStorageUnits[" + nCount.ToString() + "] = new Array(2);\n";
					oScript.InnerHtml += "aMaxStorageUnits[" + nCount.ToString() + "][0] = " + oReader["StudyID"].ToString() + ";\n";
					oScript.InnerHtml += "aMaxStorageUnits[" + nCount.ToString() + "][1] = '" + oReader["MaxStorageUnitNumber"].ToString() + "';\n\n";

					nCount++;
				}

				oScriptHolder.Controls.Add(oScript);

				oReader.Close();
				#endregion
			}

			if (hidStorageUnitID.Value != "")
			{
				tdTitle.InnerHtml = "Update Storage Unit ID: " + hidStorageUnitID.Value;
				btnAddNew.Style["display"] = "inline";
			}

		}

		protected void SaveChanges(object sender, EventArgs e)
		{
			string[] aSubjects = txtSubjects.Text.Split('\n');

			oCmd = new SqlCommand();

			oCmd.Connection = Master.SqlConn;
			oCmd.CommandTimeout = 90;
			oCmd.CommandType = CommandType.StoredProcedure;
			oCmd.CommandText = "spUpdateStorageUnit";

			oCmd.Parameters.AddWithValue("@StorageUnitID", hidStorageUnitID.Value);
			oCmd.Parameters.AddWithValue("@StorageLocationID", selStorageLocationID.SelectedValue);
			oCmd.Parameters.AddWithValue("@StorageUnitTypeID", selStorageUnitTypeID.SelectedValue);
			oCmd.Parameters.AddWithValue("@StorageContentID", selStorageContentID.SelectedValue);
			oCmd.Parameters.AddWithValue("@StudyID", selStudyID.SelectedValue);
			oCmd.Parameters.AddWithValue("@StorageUnitNumber", txtStorageUnitNumber.Text);
			oCmd.Parameters.AddWithValue("@UnitDescription", txtDescription.Text);

			oCmd.Parameters["@StorageUnitID"].Direction = ParameterDirection.InputOutput;
			oCmd.Parameters["@StorageUnitID"].SqlDbType = SqlDbType.Int;

			if (oCmd.Parameters["@StorageUnitID"].Value.ToString() == "") { oCmd.Parameters["@StorageUnitID"].Value = DBNull.Value; }
			if (oCmd.Parameters["@UnitDescription"].Value.ToString() == "") { oCmd.Parameters["@UnitDescription"].Value = DBNull.Value; }

			oCmd.ExecuteNonQuery();

			int nStorageUnitID = Convert.ToInt32(oCmd.Parameters["@StorageUnitID"].Value);
			oCmd.Parameters.Clear();

			#region Delete the old storage unit items for this storage unit.
			oCmd.CommandText = "spDeleteStorageUnitItemsByStorageUnitID";
			oCmd.Parameters.AddWithValue("@StorageUnitID", nStorageUnitID);
			oCmd.ExecuteNonQuery();
			oCmd.Parameters.Clear();
			#endregion

			#region Add the new storage unit items for this storage unit.
			oCmd.CommandText = "spInsertStorageUnitItem";
			oCmd.Parameters.AddWithValue("@StorageUnitID", nStorageUnitID);
			oCmd.Parameters.AddWithValue("@Notes", DBNull.Value);
			oCmd.Parameters.Add("@ID", SqlDbType.VarChar, 25);

			for (int i = 0; i < aSubjects.Length; i++)
			{
				if (aSubjects[i].Trim() != "")
				{
					oCmd.Parameters["@ID"].Value = aSubjects[i].Replace("\r", "");
					oCmd.ExecuteNonQuery();
				}
			}
			#endregion

			tdMsg.Style["display"] = "inline";
			tdMsg.Style["color"] = "#008800";
			tdMsg.InnerHtml = "Your changes have been saved.";
		}
	}
}
