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
	public partial class EditDataTableSpecialFields : System.Web.UI.Page
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
				Form.Attributes["onsubmit"] = "return(DoSubmitEditSpecialFields());";

				int nTableID = Convert.ToInt32(Request["TableID"].ToString());
				hidTableID.Value = nTableID.ToString();

				oConn.Open();
				oDBLookup = new DBLookup(oConn);

				oDBLookup.BindDropDownList(ref selFieldID, "EXEC spGetFieldsByTableID " + nTableID.ToString(), "Name", "FieldID", "", "--Add New Field--");
				oDBLookup.BindDropDownList(ref selFieldCodeID, "EXEC spGetAllFieldCodes", "FieldCode", "FieldCodeID", "", "--Select Field Code--");

				oConn.Close();
			}
		}

		#region Save Changes
		protected void SaveChanges(object sender, System.EventArgs e)
		{
			int nFieldID = Convert.ToInt32(selFieldID.SelectedValue);
			int nTableID = Convert.ToInt32(hidTableID.Value);

			oConn.Open();
			oDBLookup = new DBLookup(oConn);

			SqlCommand oCmd = new SqlCommand();
			oCmd.Connection = oConn;
			oCmd.CommandTimeout = 90;
			oCmd.CommandType = CommandType.StoredProcedure;

			if (chkDelete.Checked)
			{
				oCmd.CommandText = "spDeleteSpecialField";

				oCmd.Parameters.AddWithValue("@FieldID", nFieldID);

				txtFieldName.Text = "";
				selFieldCodeID.SelectedIndex = 0;
				chkIsIDField.Checked = false;
				chkDelete.Checked = false;
			}
			else
			{
				oCmd.CommandText = "spUpdateSpecialField";

                //oCmd.Parameters.Add("@FieldID", nFieldID);
                //oCmd.Parameters.Add("@TableID", nTableID);
                //oCmd.Parameters.Add("@FieldName", txtFieldName.Text);
                //oCmd.Parameters.Add("@FieldCodeID", selFieldCodeID.SelectedValue);
                //oCmd.Parameters.Add("@IsIDField", chkIsIDField.Checked);

                oCmd.Parameters.AddWithValue("@FieldID", nFieldID);
                oCmd.Parameters.AddWithValue("@TableID", nTableID);
                oCmd.Parameters.AddWithValue("@FieldName", txtFieldName.Text);
                oCmd.Parameters.AddWithValue("@FieldCodeID", int.Parse(selFieldCodeID.SelectedValue));
                oCmd.Parameters.AddWithValue("@IsIDField", chkIsIDField.Checked);

                oCmd.Parameters["@FieldID"].Direction = ParameterDirection.InputOutput;

				if (nFieldID <= 0)
                {
                    oCmd.Parameters["@FieldID"].Value = DBNull.Value;

                    //not sure why I have to do this but setting to dbnull.value appears to reset sqldbtype to nvarchar
                    oCmd.Parameters["@FieldID"].SqlDbType = SqlDbType.Int;
                }
			}

			oCmd.ExecuteNonQuery();

			selFieldID.Items.Clear();
			oDBLookup.BindDropDownList(ref selFieldID, "EXEC spGetFieldsByTableID " + nTableID.ToString(), "Name", "FieldID", oCmd.Parameters["@FieldID"].Value.ToString(), "--Add New Field--");

			oConn.Close();
		}
		#endregion
	}
}