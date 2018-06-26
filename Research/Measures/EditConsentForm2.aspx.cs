using System;
using System.Configuration;
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

namespace Measures
{
	public partial class EditConsentForm2 : System.Web.UI.Page
	{
		private SqlConnection oConn = new SqlConnection();
		private TextFormatter oFormat = new TextFormatter();
		private ReadConfig oConfig = new ReadConfig();
		private DBLookup oDBLookup;


		protected void Page_Init(object sender, EventArgs e)
		{
			oConn.ConnectionString = ConfigurationManager.ConnectionStrings["TRACKING_CONN_STRING"].ToString();
			oConn.Open();
		}

		private void Page_Load(object sender, System.EventArgs e)
		{
			Form.Attributes["onsubmit"] = "return(DoSubmitConsentForms());";

			if (!IsPostBack)
			{
				int nSubjConsentID = Convert.ToInt32(Request["SubjConsentID"].ToString());
				hidSubjConsentID.Value = nSubjConsentID.ToString();

				oDBLookup = new DBLookup();
				//bool bShowConsentItems = false;

				int nSubjID = oDBLookup.GetSubjectIDFromSubjConsentID(nSubjConsentID);
				string sSubjID = oDBLookup.GetIDBySubjID(nSubjID);
				int nHouseholdID = oDBLookup.GetHouseholdIDBySubjID(nSubjID);
				tdTitle.InnerHtml = oDBLookup.GetConsentFormNameBySubjConsentID(nSubjConsentID) + "<br/>Subject " + sSubjID;

				SqlCommand oCmd = new SqlCommand();
				oCmd.Connection = oConn;
				oCmd.CommandTimeout = 90;
				oCmd.CommandType = CommandType.StoredProcedure;
				oCmd.CommandText = "spGetSubjConsentBySubjConsentID";
				oCmd.Parameters.AddWithValue("@SubjConsentID", nSubjConsentID);

				SqlDataReader oReader = oCmd.ExecuteReader();

				if (oReader.Read())
				{
					//bool bShowConsentItems = true;

					oDBLookup.BindDropDownList(ref selConsentFormVersionID, "EXEC spGetConsentFormVersionsByConsentFormID " + oReader["ConsentFormID"].ToString(), "ConsentFormAndVersionName", "ConsentFormVersionID", oReader["ConsentFormVersionID"].ToString(), "--Select a Version--");
					txtDateSigned.Text = oReader["DateSigned"].ToString();
					txtTimeSigned.Text = oReader["TimeSigned"].ToString();
					oDBLookup.BindDropDownList(ref selConsentFormStatusID, "EXEC spGetAllConsentStatus", "ConsentStatus", "ConsentStatusID", oReader["ConsentStatusID"].ToString(), "--Select Consent Status--");
					txtNotes.Text = oReader["Notes"].ToString();

					//SetupConsentItems(nSubjConsentID);

					tdInfo.InnerHtml += "<div style=\"padding: 4px;\"><a href=\"" + Request.ApplicationPath + "/Measures/EditSubject.aspx?SubjID=" + nSubjID.ToString() + "\" class=\"smalltext\">Edit Subject - " + sSubjID.ToString() + "</a></div>";
					tdInfo.InnerHtml += "<div style=\"padding: 4px;\"><a href=\"" + Request.ApplicationPath + "/Measures/ActionsBySubject.aspx?SubjectID=" + nSubjID.ToString() + "\" class=\"smalltext\">Action Summary - " + sSubjID.ToString() + "</a></div>";
					tdInfo.InnerHtml += "<div style=\"padding: 4px;\"><a href=\"" + Request.ApplicationPath + "/Measures/MeasuresBySubject.aspx?SubjectID=" + nSubjID.ToString() + "\" class=\"smalltext\">Measure Summary - " + sSubjID.ToString() + "</a></div>";
					tdInfo.InnerHtml += "<div style=\"padding: 4px;\"><a href=\"" + Request.ApplicationPath + "/Household/ViewHousehold.aspx?HouseholdID=" + nHouseholdID.ToString() + "\" class=\"smalltext\">View Household - " + sSubjID.ToString() + "</a></div>";
					tdInfo.InnerHtml += "<div style=\"padding: 4px;\"><a href=\"" + Request.ApplicationPath + "/Household/EditHousehold.aspx?HouseholdID=" + nHouseholdID.ToString() + "\" class=\"smalltext\">Edit Household - " + sSubjID.ToString() + "</a></div>";

					#region Display Links to any Existing Documents for the Subject and/or Consent Form
					DataTable tblSubjDocs = oDBLookup.GetDocsByEntityIDAndEntityTypeID(4, nSubjID);
					DataTable tblCFDocs = oDBLookup.GetDocsByEntityIDAndEntityTypeID(3, Convert.ToInt32(oReader["ConsentFormVersionID"].ToString()));

					if (tblCFDocs.Rows.Count <= 0 && tblSubjDocs.Rows.Count <= 0)
						tdDocuments.InnerHtml = "&nbsp;";
					else
					{
						if (tblSubjDocs.Rows.Count > 0)
						{
							for (int i = 0; i < tblSubjDocs.Rows.Count; i++)
								tdDocuments.InnerHtml += "<div style=\"padding: 4px;\"><a href=\"" + Request.ApplicationPath + "/Documents/UploadDocument.aspx?DocID=" + tblSubjDocs.Rows[i]["DocID"].ToString() + "&amp;DocVersID=" + tblSubjDocs.Rows[i]["DocVersID"].ToString() + "&amp;EntityTypeID=" + tblSubjDocs.Rows[i]["EntityTypeID"].ToString() + "&amp;EntityID=" + tblSubjDocs.Rows[i]["EntityID"].ToString() + "\"><img src=\"" + Request.ApplicationPath + "/images/edit_small.gif\" alt=\"Edit Document\" /></a><a href=\"" + Request.ApplicationPath + "/WebDocs/" + tblSubjDocs.Rows[i]["DocFileName"].ToString() + "\" class=\"smalltext\">" + tblSubjDocs.Rows[i]["DocTitle"].ToString() + "</a></div>";
						}

						if (tblCFDocs.Rows.Count > 0)
						{
							for (int i = 0; i < tblCFDocs.Rows.Count; i++)
								tdDocuments.InnerHtml += "<div style=\"padding: 4px;\"><a href=\"" + Request.ApplicationPath + "/Documents/UploadDocument.aspx?DocID=" + tblCFDocs.Rows[i]["DocID"].ToString() + "&amp;DocVersID=" + tblCFDocs.Rows[i]["DocVersID"].ToString() + "&amp;EntityTypeID=" + tblCFDocs.Rows[i]["EntityTypeID"].ToString() + "&amp;EntityID=" + tblCFDocs.Rows[i]["EntityID"].ToString() + "\"><img src=\"" + Request.ApplicationPath + "/images/edit_small.gif\" alt=\"Edit Document\" /></a><a href=\"" + Request.ApplicationPath + "/WebDocs/" + tblCFDocs.Rows[i]["DocFileName"].ToString() + "\" class=\"smalltext\">" + tblCFDocs.Rows[i]["DocTitle"].ToString() + "</a></div>";
						}
					}
					#endregion
				}

				oReader.Close();

				SetupConsentItems(nSubjConsentID);

				//if (bShowConsentItems)
				//    RenderConsentItems(nSubjConsentID);

				//oConn.Close();
			}
		}

		private DataSet _consentData = new DataSet();
		private void SetupConsentItems(int SubjConsentID)
		{
			//fill a dataset with data tables.  The first one holds
			//assigned consent items.  The second holds allowed consent item options.

			try
			{
			 string sql = "select sci.SubjConsentItemID, sci.SubjConsentID, sci.cioID, sci.ItemDateSigned,  " +
							"sci.ItemTimeSigned, sci.SubjConsentItemNotes, cfvci.ConsentFormVersion_ConsentItemID, cfvci.ConsentItemText  " +
							"from tblSubjConsentItem sci  " +
							"join tblConsentFormVersion_ConsentItem cfvci on cfvci.ConsentFormVersion_ConsentItemID=sci.ConsentFormVersion_ConsentItemID  " +
							"join tblConsentFormVersion_ConsentItemOption cio on cfvci.ConsentFormVersion_ConsentItemID = cio.ConsentFormVersion_ConsentItemID and sci.cioID = cio.cioID " +
							"where sci.SubjConsentID = @SubjConsentID  " +
							"order by cfvci.ConsentItemText;  " +
							"select sci.ConsentFormVersion_ConsentItemID, cio.cioID, cio.OptionText " +
							"from tblSubjConsentItem sci " +
							"join tblConsentFormVersion_ConsentItem cfvci on cfvci.ConsentFormVersion_ConsentItemID=sci.ConsentFormVersion_ConsentItemID " +
							"join tblConsentFormVersion_ConsentItemOption cio on cfvci.ConsentFormVersion_ConsentItemID = cio.ConsentFormVersion_ConsentItemID " +
							"where sci.SubjConsentID = @SubjConsentID " +
							"order by ConsentItemText;";

			 #region old sql command
			 //string sql = "select sci.SubjConsentItemID, sci.SubjConsentID, sci.ConsentItemOptionID, sci.ItemDateSigned, " +
			//    "sci.ItemTimeSigned, sci.SubjConsentItemNotes, ci.ConsentItemID, ci.ConsentItemText " +
			//    "from tblSubjConsentItem sci " +
			//    "join tblConsentFormVersion_ConsentItem cfvci on cfvci.ConsentFormVersion_ConsentItemID=sci.ConsentFormVersion_ConsentItemID " +
			//    "join tblConsentItem ci on ci.ConsentItemID=cfvci.ConsentItemID " +
			//    "where sci.SubjConsentID = @SubjConsentID " +
			//    "order by ci.ConsentItemText; " +
			//    "select ci.ConsentItemID, cio.ConsentItemOptionID, cio.OptionText " +
			//    "from tblSubjConsentItem sci " +
			//    "join tblConsentFormVersion_ConsentItem cfvci on cfvci.ConsentFormVersion_ConsentItemID=sci.ConsentFormVersion_ConsentItemID " +
			//    "join tblConsentItem ci on ci.ConsentItemID=cfvci.ConsentItemID " +
			//    "join tblConsentItemOption cio on cio.ConsentItemID=ci.ConsentItemID " +
			//    "where sci.SubjConsentID = @SubjConsentID " +
			//    "order by ci.ConsentItemText, cio.sortorder;";
			#endregion



			SqlCommand cmd = new SqlCommand();
			cmd.Connection = oConn;
			cmd.CommandText = sql;
			cmd.CommandType = CommandType.Text;
			cmd.Parameters.AddWithValue("@SubjConsentID", SubjConsentID);

			SqlDataAdapter da = new SqlDataAdapter(cmd);

			da.Fill(_consentData);
			

			//databind
			rpConsentItems.DataSource = _consentData.Tables[0];
			rpConsentItems.DataBind();
			}
			

			
			catch (SqlException exc) 
			{
				jmError.Text = exc.Message;
			}

		}

		// SubjConsentItemID, SubjConsentID, cioID, ItemDateSigned, ItemTimeSigned, SubjConsentItemNotes, ConsentFormVersion_ConsentItemID, ConsentItemText
		// ConsentFormVersion_ConsentItemID, cioID, OptionText



		protected void rpConsentItems_ItemDataBound(object sender, System.Web.UI.WebControls.RepeaterItemEventArgs e)
		{
			//if item type is an item setup the drop down list
			if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
			{
				Label l = (Label)e.Item.FindControl("lblConsentItem");
				l.Text = ((DataRowView)e.Item.DataItem)["ConsentItemText"].ToString();

				//setup drop down list
				DropDownList ddl = (DropDownList)e.Item.FindControl("ddlConsentItem");
				DataTable options = _consentData.Tables[1];
				string sConsentItemID = ((DataRowView)e.Item.DataItem)["ConsentFormVersion_ConsentItemID"].ToString();
				options.DefaultView.RowFilter = "ConsentFormVersion_ConsentItemID = " + sConsentItemID;

				ddl.DataSource = options.DefaultView;
				ddl.DataTextField = "OptionText";
				ddl.DataValueField = "cioID";
				ddl.DataBind();

				ddl.SelectedValue = ((DataRowView)e.Item.DataItem)["cioID"].ToString();

				//date, time, and note fields
				DateTime itemdate = new DateTime();
				TextBox d = (TextBox)e.Item.FindControl("txtItemDateSigned");
				if (DateTime.TryParse(((DataRowView)e.Item.DataItem)["ItemDateSigned"].ToString(), out itemdate))
					d.Text = itemdate.ToString("MM/dd/yyyy");
				else d.Text = "";
				TextBox t = (TextBox)e.Item.FindControl("txtItemTimeSigned");
				t.Text = ((DataRowView)e.Item.DataItem)["ItemTimeSigned"].ToString();
				TextBox n = (TextBox)e.Item.FindControl("txtSubjConsentItemNotes");
				n.Text = ((DataRowView)e.Item.DataItem)["SubjConsentItemNotes"].ToString();
				//save value of SubjConsentItemID. I'll use it later for updating
				HtmlInputHidden ht = (HtmlInputHidden)e.Item.FindControl("txtSubjConsentItemID");
				ht.Value = ((DataRowView)e.Item.DataItem)["SubjConsentItemID"].ToString();

			}
		}

		#region Save Changes
		protected void SaveChanges(object sender, System.EventArgs e)
		{

			oDBLookup = new DBLookup(Master.SqlConn);
			int nSubjConsentID = Convert.ToInt32(hidSubjConsentID.Value);
			int nSubjID = oDBLookup.GetSubjectIDFromSubjConsentID(nSubjConsentID);
			int nConsentFormVersionID = oDBLookup.GetConsentFormVersionIDBySubjConsentID(nSubjConsentID);
			string sConsentItemIDs = "";

			if (Request["chkConsentItemIDs"] != null)
				sConsentItemIDs = Request["chkConsentItemIDs"].ToString();

			SqlCommand oCmd = new SqlCommand();
			oCmd.Connection = Master.SqlConn;
			oCmd.CommandTimeout = 90;
			oCmd.CommandType = CommandType.StoredProcedure;
			oCmd.CommandText = "spUpdateConsentForm";

			oCmd.Parameters.AddWithValue("@SubjConsentID", nSubjConsentID);
			oCmd.Parameters.AddWithValue("@DateSigned", txtDateSigned.Text);
			oCmd.Parameters.AddWithValue("@TimeSigned", txtTimeSigned.Text);
			oCmd.Parameters.AddWithValue("@ConsentStatusID", selConsentFormStatusID.SelectedValue);
			oCmd.Parameters.AddWithValue("@ConsentFormVersionID", selConsentFormVersionID.SelectedValue);
			oCmd.Parameters.AddWithValue("@Notes", txtNotes.Text);
			oCmd.Parameters.AddWithValue("@UpdateVersion", true);

			if (oCmd.Parameters["@DateSigned"].Value.ToString() == "") { oCmd.Parameters["@DateSigned"].Value = DBNull.Value; }
			if (oCmd.Parameters["@ConsentFormVersionID"].Value.ToString() == "" || oCmd.Parameters["@ConsentFormVersionID"].Value.ToString() == "-1") { oCmd.Parameters["@ConsentFormVersionID"].Value = DBNull.Value; }
			if (oCmd.Parameters["@Notes"].Value.ToString() == "") { oCmd.Parameters["@Notes"].Value = DBNull.Value; }

			oCmd.ExecuteNonQuery();

			#region Loop over consent items and save

			foreach (RepeaterItem ri in rpConsentItems.Items)
			{
				DropDownList ddl = (DropDownList)ri.FindControl("ddlConsentItem");
				TextBox d = (TextBox)ri.FindControl("txtItemDateSigned");
				TextBox t = (TextBox)ri.FindControl("txtItemTimeSigned");
				TextBox n = (TextBox)ri.FindControl("txtSubjConsentItemNotes");
				HtmlInputHidden ht = (HtmlInputHidden)ri.FindControl("txtSubjConsentItemID");
				DateTime convd = new DateTime();

				oCmd.Parameters.Clear();
				oCmd.CommandType = CommandType.Text;
				oCmd.CommandText = "update tblSubjConsentItem " +
					"set ConsentItemOptionID = @ConsentItemOptionID, ItemDateSigned = @ItemDateSigned, " +
						 "ItemTimeSigned = @ItemTimeSigned, SubjConsentItemNotes = @SubjConsentItemNotes " +
					"where SubjConsentItemID = @SubjConsentItemID";

				if (DateTime.TryParse(d.Text, out convd))
				{
					oCmd.Parameters.AddWithValue("@ItemDateSigned", convd);
				}
				else
				{
					oCmd.Parameters.AddWithValue("@ItemDateSigned", DBNull.Value);
				}

				oCmd.Parameters.AddWithValue("@ConsentItemOptionID", int.Parse(ddl.SelectedValue));

				oCmd.Parameters.AddWithValue("@ItemTimeSigned", t.Text);
				oCmd.Parameters.AddWithValue("@SubjConsentItemNotes", n.Text);
				oCmd.Parameters.AddWithValue("@SubjConsentItemID", int.Parse(ht.Value));
				oCmd.ExecuteNonQuery();
			}

			////These not enabled - not sure what the tblSubjConsentItems_Excluded table tracks.
			//oCmd.Parameters.Clear();
			//oCmd.CommandText = "spDeleteConsentItemExclusions";
			//oCmd.Parameters.Add("@SubjID", nSubjID);
			//oCmd.Parameters.Add("@ConsentFormVersionID", nConsentFormVersionID);

			//oCmd.ExecuteNonQuery();

			//oCmd.Parameters.Clear();
			//oCmd.CommandText = "spInsertSubjectConsentExclusions";
			//oCmd.Parameters.Add("@ConsentItemIDs", sConsentItemIDs);
			//oCmd.Parameters.Add("@SubjConsentID", nSubjConsentID);

			//if (oCmd.Parameters["@ConsentItemIDs"].Value.ToString() == "")
			//    oCmd.Parameters["@ConsentItemIDs"].Value = DBNull.Value;

			//oCmd.ExecuteNonQuery();
			#endregion

			//tdConsentItems.InnerHtml = "";
			//RenderConsentItems(nSubjConsentID);

			//oConn.Close();
		}
		#endregion

		//#region Render Consent Items
		//private void RenderConsentItems(int nSubjConsentID)
		//{
		//    SqlCommand oCmd = new SqlCommand();
		//    oCmd.Connection = Master.SqlConn;
		//    oCmd.CommandTimeout = 90;
		//    oCmd.CommandType = CommandType.StoredProcedure;
		//    oCmd.CommandText = "spGetSubjConsentItemsBySubjConsentID";
		//    oCmd.Parameters.Add("@SubjConsentID", nSubjConsentID);

		//    SqlDataReader oReader = oCmd.ExecuteReader();

		//    if (oReader.HasRows)
		//    {
		//        tdConsentItems.InnerHtml += "<p class=\"pHeader\" style=\"width: 100%;\">Consent Items</p>";

		//        while (oReader.Read())
		//        {
		//            tdConsentItems.InnerHtml += "<input type=\"checkbox\" id=\"chkConsentItem" + oReader["ConsentItemID"].ToString() + "\" name=\"chkConsentItemIDs\" value=\"" + oReader["ConsentItemID"].ToString() + "\"";
		//            if (oReader["IsConsented"].ToString() == "1") {tdConsentItems.InnerHtml += " checked=\"checked\"";}
		//            tdConsentItems.InnerHtml += " /> <label for=\"chkConsentItem" + oReader["ConsentItemID"].ToString() + "\" style=\"font-weight: normal;\">" + oReader["ConsentItemText"].ToString() + "</label><br/>";
		//        }
		//    }
		//    else
		//        tdConsentItems.InnerHtml = "&nbsp;";

		//    oReader.Close();
		//}
		//#endregion
	}
}

