using System;
using System.Collections;
using System.ComponentModel;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Security.Principal;
using System.Web;
using System.Web.SessionState;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;

using AutismCenterBase.Utilities;
using uwac;

namespace Documents
{
	public partial class UploadDocument : System.Web.UI.Page
	{
		private DBLookup oDBLookup;

		//DF: 4/13 new page_load


		public void Process_QueryString()
		{
			if (Page.Request.QueryString["entitytypeID"] != null & Page.Request.QueryString["entityID"] != null)
			{
				//if (debugprint) tblmyinfo.Rows[0].Cells[0].InnerHtml += "----------> Process_QueryString <br/>";

				int entitytypeID = int.Parse(Page.Request.QueryString["entitytypeID"]);
				int entityID = int.Parse(Page.Request.QueryString["entityID"]);

				hidEntityValue.Value = entityID.ToString();

				//DropDownList selEntityType = (DropDownList)panel1.FindControl("selEntityType");
				//selEntityType.SelectedValue = entitytypeID.ToString();
				//selEntityType.Enabled = false;


				SQL_utils sql = new SQL_utils("backend");

				string entityinfo = sql.StringScalar_from_SQLstring("exec spGetEntityInfoText " + entitytypeID.ToString() + " , " + entityID.ToString() );

				lblEntityInfo.Text = "<br/>Upload document for: " + entityinfo;


				sql.Close();


				////Subjects
				//if(entitytypeID==4)
				//{
				//    int subjID = int.Parse(Page.Request.QueryString["subjID"]);

				//    PopulateEntityValues();


				//    if (subjID > 0)
				//    {
				//        HtmlTableCell tdEntityValue = (HtmlTableCell)panel1.FindControl("tdEntityValue");
				//        HtmlSelect selEntityValue = (HtmlSelect)panel1.FindControl("selEntityValue");
				//        if (selEntityValue != null)
				//        {
				//            selEntityValue.SelectedValue = subjID.ToString();
				//        }
				//    }
				//}
				//SqlCommand sqlCmd = new System.Data.SqlClient.SqlCommand("select measureID, measname, studyID, studyname from vwstudymeas where studymeasID= " + studymeasID.ToString(), oConn);
				//DataTable dt = new DataTable();
				//SqlDataAdapter sqlAdapter = new SqlDataAdapter(sqlCmd);
				//sqlAdapter.Fill(dt);

				//foreach (DataRow row in dt.Rows)
				//{
				//    measureID = Convert.ToInt16(row["measureID"]);
				//    measurename = "Data Dictionary for " + Convert.ToString(row["measname"]);
				//    measurename_nameonly = "Data Dictionary for " + Convert.ToString(row["measname"]);
				//    qs_studyID = Convert.ToInt16(row["studyID"]);
				//    qs_studyname = Convert.ToString(row["studyname"]);
				//}

				//if (_content_studyID != qs_studyID)
				//{
				//    Populate_DDL_SelectMeasureID(qs_studyID);
				//    lblStudyname_ContentPage.Text = qs_studyname;
				//}
				//else
				//{
				//    Populate_DDL_SelectMeasureID(0);
				//}
				//DDL_SelectMeasureID.SelectedIndex = DDL_SelectMeasureID.Items.IndexOf(DDL_SelectMeasureID.Items.FindByValue(measureID.ToString()));

				//page_state = "viewing_both";

			}

			//No querystring parameter    
			else
			{
				//Populate_DDL_SelectMeasureID(0);
			}

			//Show_Buttons_By_MeasureID();

		}



		private void Page_Load(object sender, System.EventArgs e)
		{
			if (Master.AutismLogin.CheckGroupPermissions("Autism Research Group|IT Staff Group".Split('|')))
			{
				oDBLookup = new DBLookup(Master.SqlConn);

				if (!IsPostBack)
				{
					string sEntityTypeID = "";
					string sEntityID = "";
					int nDocTypeID = 0;
					int nDocStatusID = 0;

					////CONSIDER ADDED QUERY STRING PARAMETERS
					//if (Page.Request.QueryString["EntityTypeID"] != null & Page.Request.QueryString["EntityID"] != null )
					//{
					//    int entitytypeID = int.Parse(Page.Request.QueryString["EntityTypeID"]);
					//    DropDownList selEntityType = (DropDownList)FindControl("selEntityType");
					//    selEntityType.SelectedValue = entitytypeID.ToString();

					//    int entityID = int.Parse(Page.Request.QueryString["EntityID"]);
					//    DropDownList selEntityType = (DropDownList)FindControl("selEntityType");
					//    selEntityType.SelectedValue = entitytypeID.ToString();

					//    sEntityTypeID = entitytypeID;
					//    sEntityID = entityID;
					//}



					if (Request["EntityTypeID"] != null && Request["EntityID"] != null)
					{
						sEntityTypeID = Request["EntityTypeID"].ToString();
						sEntityID = Request["EntityID"].ToString();

						trEntity.Style["display"] = "none";
						//tdError.Style["display"] = "inline";
						//tdError.Style["color"] = "#000000;";
						//tdError.InnerHtml = "<br/>Upload Document for " + oDBLookup.FormatEntityType(Convert.ToInt32(sEntityTypeID), Convert.ToInt32(sEntityID));
						tdError.InnerHtml += "<input type=\"hidden\" name=\"selEntityValue\" value=\"" + sEntityID + "\" />";

						//Populat the types of items that can be uploaded
						selDocumentType.Items.Clear();

						oDBLookup.BindDropDownList(ref selDocumentType, "EXEC spGetAllDocumentTypes " + sEntityTypeID, "DocType", "DocTypeID", "", "--Select a Document Type--");

					}

					if (Request["DocID"] != null)
					{
						SqlCommand oCmd = new SqlCommand("spGetDocByDocID", Master.SqlConn);
						oCmd.CommandType = CommandType.StoredProcedure;
						oCmd.Parameters.AddWithValue("@DocID", Request["DocID"].ToString());

						SqlDataReader oReader = oCmd.ExecuteReader();

						if (oReader.Read())
						{
							nDocTypeID = Convert.ToInt32(oReader["DocTypeID"].ToString());
							nDocStatusID = Convert.ToInt32(oReader["DocStatusID"].ToString());
							txtDocTitle.Text = oReader["DocTitle"].ToString();
						}

						oReader.Close();

						hidDocID.Value = Request["DocID"].ToString();

						if (Request["DocVersID"] != null)
							hidDocVersID.Value = Request["DocVersID"].ToString();
						else
							hidDocVersID.Value = "-1";
					}
					else
					{
						hidDocID.Value = "-1";
						hidDocVersID.Value = "-1";
					}

					oDBLookup.BindDropDownList(ref selEntityType, "EXEC spGetAllEntityTypes", "EntityType", "EntityTypeID", sEntityTypeID, "--Select an Entity Type--");
					oDBLookup.BindDropDownList(ref selDocumentStatus, "EXEC spGetAllDocumentStatuses", "DocStatus", "DocStatusID", nDocStatusID.ToString(), "--Select a Document Status--");


					Process_QueryString();
				}

				//oConn.Close();
			}
			else
			{
				HtmlGenericControl pMessage = new HtmlGenericControl("p");
				
				this.panel1.Controls.Clear();
				this.panel1.Controls.Add(pMessage);

				pMessage.Attributes["class"] = "error";
				pMessage.InnerHtml = "You do not have permission to view this page.";
			}
		}

		//DF: 4/13 original Page_Load        
		//private void Page_Load(object sender, System.EventArgs e)
		//{


		//    if (Master.AutismLogin.CheckGroupPermissions("Autism Research Group|IT Staff Group".Split('|')))
		//    {
		//        Form.Attributes["onsubmit"] = "return (DoSubmitDocument(event));";

		//        oDBLookup = new DBLookup(Master.SqlConn);

		//        if (!IsPostBack)
		//        {
		//            string sEntityTypeID = "";
		//            string sEntityID = "";
		//            int nDocTypeID = 0;
		//            int nDocStatusID = 0;

		//            if (Request["EntityTypeID"] != null && Request["EntityID"] != null)
		//            {
		//                sEntityTypeID = Request["EntityTypeID"].ToString();
		//                sEntityID = Request["EntityID"].ToString();

		//                trEntity.Style["display"] = "none";
		//                tdError.Style["display"] = "inline";
		//                tdError.Style["color"] = "#000000;";
		//                tdError.InnerHtml = "Upload Document for " + oDBLookup.FormatEntityType(Convert.ToInt32(sEntityTypeID), Convert.ToInt32(sEntityID));
		//                tdError.InnerHtml += "<input type=\"hidden\" name=\"selEntityValue\" value=\"" + sEntityID + "\" />";
		//            }

		//            if (Request["DocID"] != null)
		//            {
		//                SqlCommand oCmd = new SqlCommand("spGetDocByDocID", Master.SqlConn);
		//                oCmd.CommandType = CommandType.StoredProcedure;
		//                oCmd.Parameters.Add("@DocID", Request["DocID"].ToString());

		//                SqlDataReader oReader = oCmd.ExecuteReader();

		//                if (oReader.Read())
		//                {
		//                    nDocTypeID = Convert.ToInt32(oReader["DocTypeID"].ToString());
		//                    nDocStatusID = Convert.ToInt32(oReader["DocStatusID"].ToString());
		//                    txtDocTitle.Text = oReader["DocTitle"].ToString();
		//                }

		//                oReader.Close();

		//                hidDocID.Value = Request["DocID"].ToString();

		//                if (Request["DocVersID"] != null)
		//                    hidDocVersID.Value = Request["DocVersID"].ToString();
		//                else
		//                    hidDocVersID.Value = "-1";
		//            }
		//            else
		//            {
		//                hidDocID.Value = "-1";
		//                hidDocVersID.Value = "-1";
		//            }

		//            oDBLookup.BindDropDownList(ref selEntityType, "EXEC spGetAllEntityTypes", "EntityType", "EntityTypeID", sEntityTypeID, "--Select an Entity Type--");
		//            oDBLookup.BindDropDownList(ref selDocumentType, "EXEC spGetAllDocumentTypes", "DocType", "DocTypeID", nDocTypeID.ToString(), "--Select a Document Type--");
		//            oDBLookup.BindDropDownList(ref selDocumentStatus, "EXEC spGetAllDocumentStatuses", "DocStatus", "DocStatusID", nDocStatusID.ToString(), "--Select a Document Status--");
		//        }
		//    }
		//    else
		//    {
		//    }
		//}

		#region Perform the Upload of the Document
		protected void DoUploadDocument(Object sender, EventArgs e)
		{
			//Debug.WriteLine("Passed Checkpoint 1");

			if (oDocument.PostedFile != null && oDocument.PostedFile.ContentLength > 0)
			{

				int nDocID = Convert.ToInt32(hidDocID.Value.ToString());
				int nDocVersID = Convert.ToInt32(hidDocVersID.Value.ToString());
				string sDocumentTitle = txtDocTitle.Text.ToString();
				string sDocumentDesc = txtDocDesc.Text.ToString();
				int nDocumentType = Convert.ToInt32(selDocumentType.SelectedValue);
				int nDocumentStatus = Convert.ToInt32(selDocumentStatus.SelectedValue);
				int nEntityType = Convert.ToInt32(selEntityType.SelectedValue);
				string sEntityValue = Request["selEntityValue"];

				//int nDocID = Convert.ToInt32(Request["hidDocID"].ToString());
				//int nDocVersID = Convert.ToInt32(Request["hidDocVersID"].ToString());
				//string sDocumentTitle = Request["txtDocTitle"].ToString();
				//int nDocumentType = Convert.ToInt32(Request["selDocumentType"]);
				//int nDocumentStatus = Convert.ToInt32(Request["selDocumentStatus"]);
				//int nEntityType = Convert.ToInt32(Request["selEntityType"]);
				//string sEntityValue = Request["selEntityValue"];
				string sFileExt = oDocument.PostedFile.FileName.Substring(oDocument.PostedFile.FileName.LastIndexOf("."));
				string sOrigFileName = oDocument.PostedFile.FileName;

				string sFilePath = ConfigurationManager.AppSettings["DOCUMENT_LOCATION"];
				string sFilePathWeb = ConfigurationManager.AppSettings["DOCUMENT_LOCATION"];                
				//string sFilePath = oConfig.ReadWebDocsLocation;
				//string sFilePathWeb = oConfig.ReadWebDocsLocation;
				string sFileName;



				//Debug.WriteLine("Passed Checkpoint 2");

				//NEW file-naming convention based on DocVersID - the pk of the table
				if (nDocVersID > 0)
				{
					//Debug.WriteLine("Passed Checkpoint 3");

					sFileName = "DocVersID_" + Convert.ToString(nDocVersID) + sFileExt; //selDocumentType.SelectedItem.Text.Replace(" ", "") + "-" + selEntityType.SelectedItem.Text.Replace(" ", "") + "-" + sEntityValue + sFileExt;
				}
				else
				{
					//Debug.WriteLine("Passed Checkpoint 4");

					//GetDocVersID(oConn);
					sFileName = "DocVersID_" + Convert.ToString(GetDocVersID()) + sFileExt; //selDocumentType.SelectedItem.Text.Replace(" ", "") + "-" + selEntityType.SelectedItem.Text.Replace(" ", "") + "-" + sEntityValue + sFileExt;
				}



				//OLD file-naming convention
				//string sFileName = selDocumentType.SelectedItem.Text.Replace(" ", "") + "-" + selEntityType.SelectedItem.Text.Replace(" ", "") + "-" + sEntityValue + sFileExt;

				if (!sFilePath.EndsWith("\\"))
				{
					sFilePath += "\\" + sFileName;
					sFilePathWeb += "/" + sFileName;
				}
				else
				{
					sFilePath += sFileName;
					sFilePathWeb += sFileName;
				}

				try
				{
					string myfilepath = Server.MapPath("~/webdocs/");

					
					//oDocument.PostedFile.SaveAs(sFilePath);
					oDocument.PostedFile.SaveAs(myfilepath + sFileName);

					UpdateDB(nDocID, nDocVersID, sDocumentTitle, sDocumentDesc, sFileName, nDocumentType, nDocumentStatus, nEntityType, sEntityValue, sOrigFileName);

					tdError.InnerHtml = "You have successfully upload this document.";
					tdError.Style["display"] = "";
					tdError.Style["color"] = "#008800;";
				}
				catch (Exception oErr)
				{
					tdError.InnerHtml = "Error: " + oErr.Message;
					tdError.Style["display"] = "";
					tdError.Style["color"] = "#ff0000;";
				}
			}

			//oConn.Close();
		}
		#endregion


		//#region Perform the Upload of the Document
		//protected void DoUploadDocument(Object sender, EventArgs e)
		//{
		//    if (oDocument.PostedFile != null && oDocument.PostedFile.ContentLength > 0)
		//    {
		//        int nDocID = Convert.ToInt32(hidDocID.Value.ToString());
		//        int nDocVersID = Convert.ToInt32(hidDocVersID.Value.ToString());
		//        string sDocumentTitle = txtDocTitle.Text.ToString();
		//        int nDocumentType = Convert.ToInt32(selDocumentType.SelectedValue);
		//        int nDocumentStatus = Convert.ToInt32(selDocumentStatus.SelectedValue);
		//        int nEntityType = Convert.ToInt32(selEntityType.SelectedValue);
		//        string sEntityValue = Request["selEntityValue"];
		//        string sFileExt = oDocument.PostedFile.FileName.Substring(oDocument.PostedFile.FileName.LastIndexOf("."));
		//        string sFilePath = ConfigurationManager.AppSettings["DOCUMENT_LOCATION"];
		//        string sFilePathWeb = ConfigurationManager.AppSettings["DOCUMENT_LOCATION"];
		//        string sFileName = selDocumentType.SelectedItem.Text.Replace(" ", "") + "-" + selEntityType.SelectedItem.Text.Replace(" ", "") + "-" + sEntityValue + sFileExt;

		//        if (!sFilePath.EndsWith("\\"))
		//        {
		//            sFilePath += "\\" + sFileName;
		//            sFilePathWeb += "/" + sFileName;
		//        }
		//        else
		//        {
		//            sFilePath += sFileName;
		//            sFilePathWeb += sFileName;
		//        }

		//        try
		//        {
		//            oDocument.PostedFile.SaveAs(sFilePath);

		//            UpdateDB(nDocID, nDocVersID, sDocumentTitle, sFileName, nDocumentType, nDocumentStatus, nEntityType, sEntityValue);

		//            tdError.InnerHtml = "You have successfully upload this document.";
		//            tdError.Style["display"] = "";
		//            tdError.Style["color"] = "#008800;";
		//        }
		//        catch(Exception oErr)
		//        {
		//            tdError.InnerHtml = "Error: " + oErr.Message;
		//            tdError.Style["display"] = "";
		//            tdError.Style["color"] = "#ff0000;";
		//        }
		//    }
		//}
		//#endregion





		#region Update the db w/ the Uploaded File Info
		private int UpdateDB(int nDocID, int nDocVersID, string sDocTitle, string sDocDesc, string sFileName, int nDocTypeID, int nDocStatusID, int nEntityTypeID, string sEntityTypeValue, string sOrigFileName)
		{
			SqlCommand oCmd = new SqlCommand();
			string sUser = "";

			if (Request.ServerVariables["AUTH_USER"].ToString() == "")
				sUser = Request.Cookies["UserProfile"].Values["StaffShortName"].ToString();
			else
				sUser = Request.ServerVariables["AUTH_USER"].ToString();

			oCmd.Connection = Master.SqlConn;
			oCmd.CommandType = CommandType.StoredProcedure;
			oCmd.CommandTimeout = 300;
			oCmd.CommandText = "spUpdateDocument";

			oCmd.Parameters.Add(new SqlParameter("@DocID", SqlDbType.Int, 4, ParameterDirection.InputOutput, true, 0, 0, "", DataRowVersion.Current, nDocID));
			oCmd.Parameters.Add(new SqlParameter("@DocTitle", SqlDbType.VarChar, 250, ParameterDirection.Input, true, 0, 0, "", DataRowVersion.Current, sDocTitle));
			oCmd.Parameters.Add(new SqlParameter("@DocDesc", SqlDbType.VarChar, 1500, ParameterDirection.Input, true, 0, 0, "", DataRowVersion.Current, sDocDesc));
			oCmd.Parameters.Add(new SqlParameter("@DocTypeID", SqlDbType.Int, 4, ParameterDirection.Input, true, 0, 0, "", DataRowVersion.Current, nDocTypeID));
			oCmd.Parameters.Add(new SqlParameter("@DocStatusID", SqlDbType.Int, 4, ParameterDirection.Input, true, 0, 0, "", DataRowVersion.Current, nDocStatusID));
			oCmd.Parameters.Add(new SqlParameter("@UpdateMainDoc", SqlDbType.Bit, 1, ParameterDirection.Input, true, 0, 0, "", DataRowVersion.Current, true));
			oCmd.Parameters.Add(new SqlParameter("@DocVersionID", SqlDbType.Int, 4, ParameterDirection.InputOutput, true, 0, 0, "", DataRowVersion.Current, nDocVersID));
			oCmd.Parameters.Add(new SqlParameter("@DocFileName", SqlDbType.VarChar, 1000, ParameterDirection.Input, true, 0, 0, "", DataRowVersion.Current, sFileName));
			oCmd.Parameters.Add(new SqlParameter("@Version", SqlDbType.Int, 4, ParameterDirection.Input, true, 0, 0, "", DataRowVersion.Current, 1));
			oCmd.Parameters.Add(new SqlParameter("@OrigFileName", SqlDbType.VarChar, 1000, ParameterDirection.Input, true, 0, 0, "", DataRowVersion.Current, sOrigFileName));
			oCmd.Parameters.Add(new SqlParameter("@UploadedBy", SqlDbType.VarChar, 50, ParameterDirection.Input, true, 0, 0, "", DataRowVersion.Current, sUser));

			if (Convert.ToInt32(oCmd.Parameters["@DocID"].Value.ToString()) <= 0) { oCmd.Parameters["@DocID"].Value = DBNull.Value; }
			if (Convert.ToInt32(oCmd.Parameters["@DocVersionID"].Value.ToString()) <= 0) { oCmd.Parameters["@DocVersionID"].Value = DBNull.Value; }
			if (Convert.ToInt32(oCmd.Parameters["@DocStatusID"].Value.ToString()) <= 0) { oCmd.Parameters["@DocStatusID"].Value = DBNull.Value; }

			oCmd.ExecuteNonQuery();

			nDocID = Convert.ToInt32(oCmd.Parameters["@DocID"].Value.ToString());

			if (nEntityTypeID > 0)
			{
				oCmd.Parameters.Clear();
				oCmd.CommandText = "spDeleteDocumentForeignKeysByDocID";
				oCmd.Parameters.Add(new SqlParameter("@DocID", SqlDbType.Int, 4, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Current, nDocID));

				oCmd.ExecuteNonQuery();

				oCmd.CommandText = "spInsertDocumentForeignKey";
				oCmd.Parameters.Add(new SqlParameter("@EntityTypeID", SqlDbType.Int, 4, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Current, nEntityTypeID));
				oCmd.Parameters.Add(new SqlParameter("@EntityID", SqlDbType.Int, 4, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Current, sEntityTypeValue));

				oCmd.ExecuteNonQuery();
			}

			return nDocID;
		}
		#endregion






		#region Populate the Entity Values Drop-Down List


		protected void PopulateEntityValues(Object sender, EventArgs e)
		{
			PopulateEntityValues();
		}


		protected void PopulateEntityValues()
		{
			//int nEntityTypeID = Convert.ToInt32(Request["selEntityType"]);
			//int nDocTypeID = Convert.ToInt32(Request["selDocType"]);

			int nEntityTypeID = Convert.ToInt32(selEntityType.SelectedValue);

			if (nEntityTypeID > 0)
			{

				SqlCommand oCmd = new SqlCommand();
				SqlDataReader oReader;
				string sEntityName = "";
				string sTableName = "";
				string sPKName = "";
				string sDescName = "";
				string sOptGroupName = "";
				string sOptGroupPK = "";
				string sSQL = "";
				string sDropDownList = "";
				string sAllowedDocTypes = "";  //Jeff

				oCmd.Connection = Master.SqlConn;
				oCmd.CommandTimeout = 90;
				oCmd.CommandType = CommandType.StoredProcedure;
				oCmd.CommandText = "spGetEntityTypeByEntityTypeID";

				oCmd.Parameters.Add(new SqlParameter("@EntityTypeID", SqlDbType.Int, 4, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Current, nEntityTypeID));

				oReader = oCmd.ExecuteReader();

				if (oReader.HasRows)
				{
					oReader.Read();

					sEntityName = oReader["EntityType"].ToString();
					sTableName = oReader["EntityTableName"].ToString();
					sPKName = oReader["EntityPKName"].ToString();
					sDescName = oReader["EntityDescName"].ToString();
					sOptGroupName = oReader["EntityOptGroupDesc"].ToString();
					sOptGroupPK = oReader["EntityOptGroupPK"].ToString();

					oReader.Close();

					if (sEntityName == "Consent Form (Version)")
					{
						sSQL = "select  '(#' + cast(version as varchar) + ') ' + coalesce(consentformversionname, '?') + ' ' + coalesce(ConsentFormNameShort, ConsentFormName, 'name?')  as  consentformversionname  " ;
						sSQL += ", consentformversionID, studyname  ";
						sSQL += "from vwStudyConsentForm where studyID = " + Master.Master_studyID.ToString() + " ";
						sSQL += "order by studyname, consentformnameshort, consentformname, version";
						sDropDownList = oDBLookup.BindDropDownList("selEntityValue", sSQL, sDescName, sPKName, sOptGroupName, "", "--Select " + sEntityName + "--", "");

					}
					else if (sEntityName == "Subject")
					{
						sSQL = "select * from vwMasterStatus_S where studyID = " + Master.Master_studyID.ToString() + " ";
						sSQL += "order by  replicate('0', 20 - len(ID)) + ID ";
						sDropDownList = oDBLookup.BindDropDownList("selEntityValue", sSQL, sDescName, sPKName, sOptGroupName, "", "--Select " + sEntityName + "--", "");

					}
					else if (sEntityName == "Study Measure")
					{
						sSQL = "select * from vwStudyMeas where studyID = " + Master.Master_studyID.ToString() + " ";
						sSQL += "order by  studymeasname ";
						sDropDownList = oDBLookup.BindDropDownList("selEntityValue", sSQL, sDescName, sPKName, sOptGroupName, "", "--Select " + sEntityName + "--", "");

					}
					else if (sEntityName == "Study Action")
					{
						sSQL = "select * from vwStudyAction where studyID = " + Master.Master_studyID.ToString() + " ";
						sDropDownList = oDBLookup.BindDropDownList("selEntityValue", sSQL, sDescName, sPKName, sOptGroupName, "", "--Select " + sEntityName + "--", "");

					}
					else if (sOptGroupName != "")
					{
						sSQL = "SELECT " + sDescName + ", " + sPKName + ", " + sOptGroupName + " FROM " + sTableName;
						sSQL += " WHERE " + sDescName + " IS NOT NULL AND LTRIM(RTRIM(" + sDescName + ")) <> ''";
						sSQL += " ORDER BY " + sOptGroupName + ", " + sDescName;
						sDropDownList = oDBLookup.BindDropDownList("selEntityValue", sSQL, sDescName, sPKName, sOptGroupName, "", "--Select " + sEntityName + "--", "");
					}
					else
					{
						sSQL = "SELECT " + sDescName + ", " + sPKName + " FROM " + sTableName;
						sSQL += " WHERE " + sDescName + " IS NOT NULL AND LTRIM(RTRIM(" + sDescName + ")) <> ''";
						sSQL += " ORDER BY " + sDescName;
						sDropDownList = oDBLookup.BindDropDownList("selEntityValue", sSQL, sDescName, sPKName, "", "--Select " + sEntityName + "--", "");
					}

					tdEntityValue.Style["display"] = "";
					tdEntityValue.InnerHtml = "<label for=\"selEntityValue\">" + sEntityName + "</label><br/>";
					tdEntityValue.InnerHtml += sDropDownList;
				}
				else
				{
					tdError.Style["display"] = "";
					tdError.InnerHtml = "There were no entities that matched your selection.";
				}


				//inserted by Jeff
				//Populate DocType only once an Entity has been chosen
				//SAMPLE sDropDownList = oDBLookup.BindDropDownList("selEntityValue", sSQL, sDescName, sPKName, "", "--Select " + sEntityName + "--", "");
				selDocumentType.Items.Clear();

				oDBLookup.BindDropDownList(ref selDocumentType, "EXEC spGetAllDocumentTypes " + nEntityTypeID.ToString(), "DocType", "DocTypeID", "", "--Select a Document Type--");
				//end insertion


				//oConn.Close();
			}
			else
			{
				tdEntityValue.Style["display"] = "none";
			}
		}
		#endregion



		//#region Populate the Entity Values Drop-Down List
		//protected void PopulateEntityValues(Object sender, EventArgs e)
		//{
		//    int nEntityTypeID = Convert.ToInt32(selEntityType.SelectedValue);

		//    if (nEntityTypeID > 0)
		//    {
		//        SqlCommand oCmd = new SqlCommand();
		//        SqlDataReader oReader;
		//        string sEntityName = "";
		//        string sTableName = "";
		//        string sPKName = "";
		//        string sDescName = "";
		//        string sOptGroupName = "";
		//        string sOptGroupPK = "";
		//        string sSQL = "";
		//        string sDropDownList = "";

		//        oCmd.Connection = Master.SqlConn;
		//        oCmd.CommandTimeout = 90;
		//        oCmd.CommandType = CommandType.StoredProcedure;
		//        oCmd.CommandText = "spGetEntityTypeByEntityTypeID";

		//        oCmd.Parameters.Add(new SqlParameter("@EntityTypeID", SqlDbType.Int, 4, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Current, nEntityTypeID));

		//        oReader = oCmd.ExecuteReader();

		//        if (oReader.HasRows)
		//        {
		//            oReader.Read();

		//            sEntityName = oReader["EntityType"].ToString();
		//            sTableName = oReader["EntityTableName"].ToString();
		//            sPKName = oReader["EntityPKName"].ToString();
		//            sDescName = oReader["EntityDescName"].ToString();
		//            sOptGroupName = oReader["EntityOptGroupDesc"].ToString();
		//            sOptGroupPK = oReader["EntityOptGroupPK"].ToString();

		//            oReader.Close();

		//            if (sOptGroupName != "")
		//            {
		//                sSQL = "SELECT " + sDescName + ", " + sPKName + ", " + sOptGroupName + " FROM " + sTableName;
		//                sSQL += " WHERE " + sDescName + " IS NOT NULL AND LTRIM(RTRIM(" + sDescName + ")) <> ''";
		//                sSQL += " ORDER BY " + sOptGroupName + ", " + sDescName;
		//                sDropDownList = oDBLookup.BindDropDownList("selEntityValue", sSQL, sDescName, sPKName, sOptGroupName, "", "--Select " + sEntityName + "--", "");
		//            }
		//            else
		//            {
		//                sSQL = "SELECT " + sDescName + ", " + sPKName + " FROM " + sTableName;
		//                sSQL += " WHERE " + sDescName + " IS NOT NULL AND LTRIM(RTRIM(" + sDescName + ")) <> ''";
		//                sSQL += " ORDER BY " + sDescName;
		//                sDropDownList = oDBLookup.BindDropDownList("selEntityValue", sSQL, sDescName, sPKName, "", "--Select " + sEntityName + "--", "");
		//            }

		//            tdEntityValue.Style["display"] = "";
		//            tdEntityValue.InnerHtml = "<label for=\"selEntityValue\">" + sEntityName + "</label><br/>";
		//            tdEntityValue.InnerHtml += sDropDownList;
		//        }
		//        else
		//        {
		//            tdError.Style["display"] = "";
		//            tdError.InnerHtml = "There were no entities that matched your selection.";
		//        }
		//    }
		//    else
		//    {
		//        tdEntityValue.Style["display"] = "none";
		//    }
		//}
		//#endregion


		#region Get the DocVersID when it is null
		private int GetDocVersID()
		{
			SqlCommand oCmd = new SqlCommand();
			string sUser = "";
			int nNewDocVersID;

			if (Request.ServerVariables["AUTH_USER"].ToString() == "")
				sUser = Request.Cookies["UserProfile"].Values["StaffShortName"].ToString();
			else
				sUser = Request.ServerVariables["AUTH_USER"].ToString();

			oCmd.Connection = Master.SqlConn;
			oCmd.CommandType = CommandType.StoredProcedure;
			oCmd.CommandTimeout = 90;

			//		oCmd.Parameters.Clear();
			oCmd.CommandText = "spReturnNextDocVersID";

			oCmd.Parameters.Add(new SqlParameter("@DocVersID", SqlDbType.Int, 4, ParameterDirection.Output, true, 0, 0, "", DataRowVersion.Current, "nNewDocVersID"));

			oCmd.ExecuteNonQuery();

			nNewDocVersID = Convert.ToInt32(oCmd.Parameters["@DocVersID"].Value.ToString());

			return nNewDocVersID;
		}
		#endregion
	}
}