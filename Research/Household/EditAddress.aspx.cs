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

namespace Household
{
	public partial class EditAddress : System.Web.UI.Page
	{
		private ReadConfig oConfig = new ReadConfig();
		private DBLookup oDBLookup;

		private void Page_Load(object sender, System.EventArgs e)
		{
			oDBLookup = new DBLookup(Master.SqlConn);

			Form.Attributes["onsubmit"] = "return(DoSubmitEditAddress());";

			int nHouseholdID = Convert.ToInt32(Request["HouseholdID"].ToString());
			hidHouseholdID.Value = nHouseholdID.ToString();
			DataSet oDataSet;
			string sHouseholdName = oDBLookup.GetHouseholdName(nHouseholdID);

            //DF: 4/10 add app path
			btnBack.Attributes["onclick"] = "document.location = '" + Request.ApplicationPath + "/Household/EditHousehold.aspx?HouseholdID=" + nHouseholdID.ToString() + "';";
			HtmlInputButton oButton;
			HtmlTable oTable;
			HtmlTableRow oTr;
			HtmlTableCell oTd;
			string sJSArray = "";
			bool bDisplayedFirstAddress = false;
			string sAddressIDs = "";

			if (IsPostBack)
			{

                //Next line gives NULL reference error after .NET 4.5 upgrade
                //string[] sAddressID = Request[hidAddressID.ClientID.Replace("_", "$")].ToString().Replace(", ", ",").Split(',');
                string[] sAddressID = lbl_hidAddressID.Text.Replace("_", "$").ToString().Replace(", ", ",").Split(',');

                string[] sAddress1 = Request["txtAddress1"].ToString().Replace(", ", ",").Split(',');
				string[] sAddress2 = Request["txtAddress2"].ToString().Replace(", ", ",").Split(',');
				string[] sCity = Request["txtCity"].ToString().Replace(", ", ",").Split(',');
				string[] sState = Request["txtState"].ToString().Replace(", ", ",").Split(',');
				string[] sRegion = Request["txtRegion"].ToString().Replace(", ", ",").Split(',');
				string[] sCountry = Request["txtCountry"].ToString().Replace(", ", ",").Split(',');
				string[] sZip = Request["txtZip"].ToString().Replace(", ", ",").Split(',');
				string[] sNotes = Request["txtNotes"].ToString().Replace(", ", ",").Split(',');

				UpdateAddress(nHouseholdID, sAddressID, sAddress1, sAddress2, sCity, sState, sRegion, sCountry, sZip, sNotes);
			}

			tdTitle.InnerHtml = "Edit Addresses";

			if (sHouseholdName != null && sHouseholdName != "") {tdTitle.InnerHtml += " for " + sHouseholdName + " Household";}

			oDataSet = GetAddresses(nHouseholdID);
			DataTable tblAddresses = oDataSet.Tables["tblAddresses"];

			sJSArray += "\n<script type=\"text/javascript\">\n";
			sJSArray += "var aAddresses = new Array(" + tblAddresses.Rows.Count.ToString() + ");\n\n";

			for (int i=0;i<tblAddresses.Rows.Count;i++)
			{
				#region Display Address Tables
				sAddressIDs += tblAddresses.Rows[i]["AddressID"].ToString() + ",";
				oTable = new HtmlTable();
				oTable.Attributes["class"] = "tblAddress";
				oTable.Attributes["id"] = "tblAddress" + tblAddresses.Rows[i]["AddressID"].ToString();
				oTable.Attributes["name"] = "tblAddress";
				oTable.CellSpacing = 0;

				if (!bDisplayedFirstAddress)
					bDisplayedFirstAddress = true;
				else
					oTable.Style["display"] = " none";

				oTr = new HtmlTableRow();
				oTd = new HtmlTableCell();
				oTr.Attributes["class"] = "trHeader";
				oTd.ColSpan = 2;
				oTd.InnerHtml = "Address ID: " + tblAddresses.Rows[i]["AddressID"].ToString();
				oTr.Cells.Add(oTd);
				oTable.Rows.Add(oTr);
				

				oTr = new HtmlTableRow();
				oTd = new HtmlTableCell();
				oTd.Attributes["class"] = "tdLabel";
				oTd.InnerHtml = "Address 1:";
				oTr.Cells.Add(oTd);
				oTd = new HtmlTableCell();
				oTd.Attributes["name"] = "td" + tblAddresses.Rows[i]["AddressID"].ToString();
				oTd.InnerHtml += "<input type=\"text\" name=\"txtAddress1\" value=\"" + tblAddresses.Rows[i]["Address1"].ToString() + "\" />";
				oTr.Cells.Add(oTd);
				oTable.Rows.Add(oTr);

				oTr = new HtmlTableRow();
				oTd = new HtmlTableCell();
				oTd.Attributes["class"] = "tdLabel";
				oTd.InnerHtml = "Address 2:";
				oTr.Cells.Add(oTd);
				oTd = new HtmlTableCell();
				oTd.Attributes["name"] = "td" + tblAddresses.Rows[i]["AddressID"].ToString();
				oTd.InnerHtml += "<input type=\"text\" name=\"txtAddress2\" value=\"" + tblAddresses.Rows[i]["Address2"].ToString() + "\" />";
				oTr.Cells.Add(oTd);
				oTable.Rows.Add(oTr);

				oTr = new HtmlTableRow();
				oTd = new HtmlTableCell();
				oTd.Attributes["class"] = "tdLabel";
				oTd.InnerHtml = "City:";
				oTr.Cells.Add(oTd);
				oTd = new HtmlTableCell();
				oTd.Attributes["name"] = "td" + tblAddresses.Rows[i]["AddressID"].ToString();
				oTd.InnerHtml += "<input type=\"text\" name=\"txtCity\" value=\"" + tblAddresses.Rows[i]["City"].ToString() + "\" />";
				oTr.Cells.Add(oTd);
				oTable.Rows.Add(oTr);

				oTr = new HtmlTableRow();
				oTd = new HtmlTableCell();
				oTd.Attributes["class"] = "tdLabel";
				oTd.InnerHtml = "State:";
				oTr.Cells.Add(oTd);
				oTd = new HtmlTableCell();
				oTd.Attributes["name"] = "td" + tblAddresses.Rows[i]["AddressID"].ToString();
				oTd.InnerHtml += "<input type=\"text\" name=\"txtState\" value=\"" + tblAddresses.Rows[i]["State"].ToString() + "\" />";
				oTr.Cells.Add(oTd);
				oTable.Rows.Add(oTr);

				oTr = new HtmlTableRow();
				oTd = new HtmlTableCell();
				oTd.Attributes["class"] = "tdLabel";
				oTd.InnerHtml = "Region:";
				oTr.Cells.Add(oTd);
				oTd = new HtmlTableCell();
				oTd.Attributes["name"] = "td" + tblAddresses.Rows[i]["AddressID"].ToString();
				oTd.InnerHtml += "<input type=\"text\" name=\"txtRegion\" value=\"" + tblAddresses.Rows[i]["Region"].ToString() + "\" />";
				oTr.Cells.Add(oTd);
				oTable.Rows.Add(oTr);

				oTr = new HtmlTableRow();
				oTd = new HtmlTableCell();
				oTd.Attributes["class"] = "tdLabel";
				oTd.InnerHtml = "Country:";
				oTr.Cells.Add(oTd);
				oTd = new HtmlTableCell();
				oTd.Attributes["name"] = "td" + tblAddresses.Rows[i]["AddressID"].ToString();
				oTd.InnerHtml += "<input type=\"text\" name=\"txtCountry\" value=\"" + tblAddresses.Rows[i]["Country"].ToString() + "\" />";
				oTr.Cells.Add(oTd);
				oTable.Rows.Add(oTr);

				oTr = new HtmlTableRow();
				oTd = new HtmlTableCell();
				oTd.Attributes["class"] = "tdLabel";
				oTd.InnerHtml = "Postal Code:";
				oTr.Cells.Add(oTd);
				oTd = new HtmlTableCell();
				oTd.Attributes["name"] = "td" + tblAddresses.Rows[i]["AddressID"].ToString();
				oTd.InnerHtml += "<input type=\"text\" name=\"txtZip\" value=\"" + tblAddresses.Rows[i]["Zip"].ToString() + "\" />";
				oTr.Cells.Add(oTd);
				oTable.Rows.Add(oTr);

				oTr = new HtmlTableRow();
				oTd = new HtmlTableCell();
				oTd.Attributes["class"] = "tdLabel";
				oTd.InnerHtml = "Notes:";
				oTr.Cells.Add(oTd);
				oTd = new HtmlTableCell();
				oTd.Attributes["name"] = "td" + tblAddresses.Rows[i]["AddressID"].ToString();
				oTd.InnerHtml += "<textarea name=\"txtNotes\" rows=\"4\" style=\"width: 350px;\">" + tblAddresses.Rows[i]["Notes"].ToString() + "</textarea>";
				oTr.Cells.Add(oTd);
				oTable.Rows.Add(oTr);

				#region Add Next/Prev Buttons
				oTr = new HtmlTableRow();
				oTd = new HtmlTableCell();
				oTd.InnerHtml = "&nbsp;";
				oTr.Cells.Add(oTd);
				oTd = new HtmlTableCell();

				oButton = new HtmlInputButton();
				oButton.Value = "< Prev";
				oButton.Style["width"] = "100px";
				oButton.Attributes["onclick"] = "SynchListBoxWithAddress(-1);";
				oTd.Controls.Add(oButton);

				HtmlGenericControl oSpan = new HtmlGenericControl("span");
				oSpan.Attributes["style"] = "padding: 10px; font-weight: bold;";
				oSpan.InnerHtml = "Address 1 of " + tblAddresses.Rows.Count.ToString();
				oSpan.Attributes["id"] = "spnAddressCount" + tblAddresses.Rows[i]["AddressID"].ToString();
				oTd.Controls.Add(oSpan);

				oButton = new HtmlInputButton();
				oButton.Value = "Next >";
				oButton.Style["width"] = "100px";
				oButton.Attributes["onclick"] = "SynchListBoxWithAddress(1);";
				oTd.Controls.Add(oButton);

				oTr.Cells.Add(oTd);
				oTable.Rows.Add(oTr);
				#endregion

				tdAddress.Controls.Add(oTable);

				sJSArray += "aAddresses[" + i.ToString() + "] = " + tblAddresses.Rows[i]["AddressID"].ToString() + ";\n";
				#endregion
			}

			sJSArray += "</script>\n";
			spnScript.InnerHtml = sJSArray;

			if (sAddressIDs.Length > 0) {sAddressIDs = sAddressIDs.Substring(0, sAddressIDs.Length - 1);}
			hidAddressID.Value = sAddressIDs;

            lbl_hidAddressID.Text = sAddressIDs;
		}

		#region Update Address
		private void UpdateAddress(int nHouseholdID, string[] sAddressID, string[] sAddress1, string[] sAddress2, string[] sCity, string[] sState, string[] sRegion, string[] sCountry, string[] sZip, string[] sNotes)
		{
			SqlCommand oCmd = new SqlCommand();

			oCmd.Connection = Master.SqlConn;
			oCmd.CommandText = "spUpdateAddress";
			oCmd.CommandTimeout = 90;
			oCmd.CommandType = CommandType.StoredProcedure;

			for (int i=0;i<sAddressID.Length;i++)
			{
				oCmd.Parameters.Clear();

				oCmd.Parameters.AddWithValue("@HouseholdID", nHouseholdID);
				oCmd.Parameters.AddWithValue("@AddressID", sAddressID[i]);
				oCmd.Parameters.AddWithValue("@Address1", sAddress1[i]);
				oCmd.Parameters.AddWithValue("@Address2", sAddress2[i]);
				oCmd.Parameters.AddWithValue("@City", sCity[i]);
				oCmd.Parameters.AddWithValue("@State", sState[i]);
				oCmd.Parameters.AddWithValue("@Region", sRegion[i]);
				oCmd.Parameters.AddWithValue("@Country", sCountry[i]);
				oCmd.Parameters.AddWithValue("@Zip", sZip[i]);
				oCmd.Parameters.AddWithValue("@Notes", sNotes[i]);

				if (oCmd.Parameters["@AddressID"].Value.ToString() == "" || Convert.ToInt32(oCmd.Parameters["@AddressID"].Value.ToString()) <= 0) {oCmd.Parameters["@AddressID"].Value = DBNull.Value;}
				if (oCmd.Parameters["@Address2"].Value.ToString() == "") {oCmd.Parameters["@Address2"].Value = DBNull.Value;}
				if (oCmd.Parameters["@State"].Value.ToString() == "") {oCmd.Parameters["@State"].Value = DBNull.Value;}
				if (oCmd.Parameters["@Region"].Value.ToString() == "") {oCmd.Parameters["@Region"].Value = DBNull.Value;}
				if (oCmd.Parameters["@Country"].Value.ToString() == "") {oCmd.Parameters["@Country"].Value = DBNull.Value;}
				if (oCmd.Parameters["@Zip"].Value.ToString() == "") {oCmd.Parameters["@Zip"].Value = DBNull.Value;}
				if (oCmd.Parameters["@Notes"].Value.ToString() == "") {oCmd.Parameters["@Notes"].Value = DBNull.Value;}

				oCmd.ExecuteNonQuery();
			}
		}
		#endregion

		#region Get Addresses
		private DataSet GetAddresses(int nHouseholdID)
		{
			SqlCommand oCmd = new SqlCommand();
			DataSet oDataSet = new DataSet();
			SqlDataAdapter oDataAdapter;

			oCmd.Connection = Master.SqlConn;
			oCmd.CommandTimeout = 90;
			oCmd.CommandType = CommandType.StoredProcedure;

			oCmd.Parameters.AddWithValue("@HouseholdID", nHouseholdID);

			//Add a table to the DataSet object for the email address information.
			oCmd.CommandText = "spGetAddressesByHouseholdID";
			oDataAdapter = new SqlDataAdapter(oCmd);
			oDataAdapter.Fill(oDataSet, "tblAddresses");

			return oDataSet;
		}
		#endregion
	}
}
