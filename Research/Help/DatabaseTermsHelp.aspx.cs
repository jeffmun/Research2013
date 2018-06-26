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

namespace Help
{
	public partial class DatabaseTermsHelp : System.Web.UI.Page
	{
		private SqlConnection oConn = new SqlConnection(ConfigurationManager.ConnectionStrings["TRACKING_CONN_STRING"].ToString());

		private void Page_Load(object sender, System.EventArgs e)
		{
			oConn.Open();

			HtmlGenericControl olOuter = new HtmlGenericControl("ol");
			HtmlGenericControl olInner = new HtmlGenericControl("ol");
			HtmlGenericControl liOuter;
			HtmlGenericControl liInner;
			SqlDataReader oReader;
			string sStatusID = "";

			oReader = GetStatusDefs(oConn, "subject");
			while (oReader.Read())
			{
				if (sStatusID != oReader["SubjStatusID"].ToString())
				{
					pSubject.Controls.Add(olOuter);
					sStatusID = oReader["SubjStatusID"].ToString();

					liOuter = new HtmlGenericControl("li");
					liOuter.InnerHtml = "<b>" + oReader["SubjStatus"].ToString() + "</b> - " + oReader["SSDef"].ToString();

					olOuter.Controls.Add(liOuter);

					if (oReader["SubjStatusDetailID"].ToString() != "")
					{
						olInner = new HtmlGenericControl("ol");
						olInner.Attributes["type"] = "a";
						liOuter.Controls.Add(olInner);
					}
				}

				if (oReader["SubjStatusDetailID"].ToString() != "")
				{
					liInner = new HtmlGenericControl("li");
					liInner.InnerHtml = "<b>" + oReader["SubjStatusDetail"].ToString() + "</b> - " + oReader["SSDDef"].ToString();;
					olInner.Controls.Add(liInner);
				}
			}

			sStatusID = "0";
			olOuter = new HtmlGenericControl("ol");
			oReader.Close();

			oReader = GetStatusDefs(oConn, "action");
			while (oReader.Read())
			{
				if (sStatusID != oReader["ActionTypeID"].ToString())
				{
					pAction.Controls.Add(olOuter);
					sStatusID = oReader["ActionTypeID"].ToString();

					liOuter = new HtmlGenericControl("li");
					liOuter.InnerHtml = "<b>" + oReader["ActionType"].ToString() + "</b>";

					olOuter.Controls.Add(liOuter);

					if (oReader["ActionTypeID"].ToString() != "")
					{
						olInner = new HtmlGenericControl("ol");
						olInner.Attributes["type"] = "a";
						liOuter.Controls.Add(olInner);
					}
				}

				if (oReader["ActionTypeID"].ToString() != "")
				{
					liInner = new HtmlGenericControl("li");
					liInner.InnerHtml = "<b>" + oReader["ActionStatus"].ToString() + "</b> - " + oReader["Definition"].ToString();;
					olInner.Controls.Add(liInner);
				}
			}

			sStatusID = "0";
			olOuter = new HtmlGenericControl("ol");
			oReader.Close();

			oReader = GetStatusDefs(oConn, "measure");
			while (oReader.Read())
			{
				if (sStatusID != oReader["MeasStatusID"].ToString())
				{
					pMeasure.Controls.Add(olOuter);
					sStatusID = oReader["MeasStatusID"].ToString();

					liOuter = new HtmlGenericControl("li");
					liOuter.InnerHtml = "<b>" + oReader["MeasStatus"].ToString() + "</b> - " + oReader["MSDef"].ToString();

					olOuter.Controls.Add(liOuter);

					if (oReader["MeasStatusDetailID"].ToString() != "")
					{
						olInner = new HtmlGenericControl("ol");
						olInner.Attributes["type"] = "a";
						liOuter.Controls.Add(olInner);
					}
				}

				if (oReader["MeasStatusDetailID"].ToString() != "")
				{
					liInner = new HtmlGenericControl("li");
					liInner.InnerHtml = "<b>" + oReader["MeasStatusDetail"].ToString() + "</b> - " + oReader["MSDDef"].ToString();;
					olInner.Controls.Add(liInner);
				}
			}

			oReader.Close();
			oConn.Close();
		}

		#region Get Status Definitions
		private SqlDataReader GetStatusDefs(SqlConnection oConn, string sType)
		{
			SqlCommand oCmd = new SqlCommand();
			SqlDataReader oReader;

			oCmd.Connection = oConn;
			oCmd.CommandTimeout = 90;
			oCmd.CommandType = CommandType.Text;

			switch (sType.ToLower())
			{
				case "subject":
					oCmd.CommandText = "SELECT tblsubjectstatus_lkup.sortorder, tblsubjstatusanddetail.ssdsortorder, tblsubjectstatus_lkup.subjstatus, tblsubjstatusdetail_lkup.subjstatusdetail, tblsubjectstatus_lkup.subjstatusID, tblsubjstatusdetail_lkup.subjstatusdetailID, tblsubjectstatus_definition.definition AS SSdef, tblsubjstatusdetail_definition.definition AS SSDdef FROM (((tblsubjectstatus_lkup LEFT JOIN tblsubjstatusanddetail ON tblsubjectstatus_lkup.subjstatusID=tblsubjstatusanddetail.subjstatusID) LEFT JOIN tblsubjstatusdetail_lkup ON tblsubjstatusanddetail.subjstatusdetailID=tblsubjstatusdetail_lkup.subjstatusdetailID) LEFT JOIN tblsubjectstatus_definition ON tblsubjectstatus_lkup.subjstatusID=tblsubjectstatus_definition.subjstatusID) LEFT JOIN tblsubjstatusdetail_definition ON tblsubjstatusanddetail.subjstatusanddetailID=tblsubjstatusdetail_definition.subjstatusanddetailID ORDER BY tblsubjectstatus_lkup.sortorder, tblsubjstatusanddetail.ssdsortorder";
					break;

				case "action":
					oCmd.CommandText = "SELECT tblactiontypestatus.actiontypestatusID, tblactiontype_lkup.actiontypeID, tblactiontype_lkup.actiontype, tblactionstatus_lkup.actionstatusID, tblactiontypestatus.sortorder, tblactionstatus_lkup.actionstatus, tblactionstatusdetail_lkup.actionstatusdetailID, tblactionstatusdetail_lkup.actionstatusdetail, tblactiontypestatus_definition.definition FROM ((((tblactionstatus_lkup LEFT JOIN tblactionstatusanddetail ON tblactionstatus_lkup.actionstatusID=tblactionstatusanddetail.actionstatusID) LEFT JOIN tblactionstatusdetail_lkup ON tblactionstatusanddetail.actionstatusdetailID=tblactionstatusdetail_lkup.actionstatusdetailID) INNER JOIN tblactiontypestatus ON tblactionstatus_lkup.actionstatusID=tblactiontypestatus.actionstatusID) INNER JOIN tblactiontype_lkup ON tblactiontypestatus.actiontypeID=tblactiontype_lkup.actiontypeID) LEFT JOIN tblactiontypestatus_definition ON tblactiontypestatus.actiontypestatusID=tblactiontypestatus_definition.actiontypestatusID ORDER BY tblactiontype_lkup.actiontypeID, tblactiontypestatus.sortorder, tblactionstatusdetail_lkup.actionstatusdetailID";
					break;

				case "measure":
					oCmd.CommandText = "SELECT tblmeasstatus_lkup.measstatusID, tblmeasstatus_lkup.measstatus, tblmeasstatus_lkup.sortorder AS sortorder1, tblmeasstatusdetail_lkup.measstatusdetailID, tblmeasstatusdetail_lkup.measstatusdetail, tblmeasstatusanddetail.sortorder AS sortorder2, tblmeasstatus_definition.definition AS MSdef, tblmeasstatusdetail_definition.definition AS MSDdef, tblmeasstatusanddetail.measstatusanddetailID FROM (((tblmeasstatus_lkup LEFT JOIN tblmeasstatusanddetail ON tblmeasstatus_lkup.measstatusID=tblmeasstatusanddetail.measstatusID) LEFT JOIN tblmeasstatusdetail_lkup ON tblmeasstatusanddetail.measstatusdetailID=tblmeasstatusdetail_lkup.measstatusdetailID) LEFT JOIN tblmeasstatus_definition ON tblmeasstatus_lkup.measstatusID=tblmeasstatus_definition.measstatusID) LEFT JOIN tblmeasstatusdetail_definition ON tblmeasstatusanddetail.measstatusanddetailID=tblmeasstatusdetail_definition.measstatusanddetailID";
					break;

				default:
					oCmd.CommandText = "SELECT tblsubjectstatus_lkup.sortorder, tblsubjstatusanddetail.ssdsortorder, tblsubjectstatus_lkup.subjstatus, tblsubjstatusdetail_lkup.subjstatusdetail, tblsubjectstatus_lkup.subjstatusID, tblsubjstatusdetail_lkup.subjstatusdetailID, tblsubjectstatus_definition.definition AS SSdef, tblsubjstatusdetail_definition.definition AS SSDdef FROM (((tblsubjectstatus_lkup LEFT JOIN tblsubjstatusanddetail ON tblsubjectstatus_lkup.subjstatusID=tblsubjstatusanddetail.subjstatusID) LEFT JOIN tblsubjstatusdetail_lkup ON tblsubjstatusanddetail.subjstatusdetailID=tblsubjstatusdetail_lkup.subjstatusdetailID) LEFT JOIN tblsubjectstatus_definition ON tblsubjectstatus_lkup.subjstatusID=tblsubjectstatus_definition.subjstatusID) LEFT JOIN tblsubjstatusdetail_definition ON tblsubjstatusanddetail.subjstatusanddetailID=tblsubjstatusdetail_definition.subjstatusanddetailID ORDER BY tblsubjectstatus_lkup.sortorder, tblsubjstatusanddetail.ssdsortorder";
					break;
			}

			oReader = oCmd.ExecuteReader();

			return oReader;
		}
		#endregion
	}
}