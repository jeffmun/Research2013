using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

using AutismCenterBase.Utilities;
using AutismCenterBase.Security;

namespace AutismCenterBase.Reports
{
	public class ReportWriter
	{
		private SqlConnection oConn;
		private DBLookup oDBLookup;
		private Report oReport;

        public ReportWriter(SqlConnection SqlConn)
        {
            oConn = SqlConn;
        }

		public Report Report
		{
			get {return oReport;}
			set {oReport = value;}
		}

		//This method will render the report.
		public void RenderReport(ref HtmlTable tblMaster)
		{
            string webRoot = ConfigurationManager.AppSettings["WEB_ROOT"];

			HtmlTableRow oTr;
			HtmlTableCell oTd;
			int i;

			//If no Report property was set for this ReportWriter, display an error and exit.
			if (oReport == null)
			{
				oTr = new HtmlTableRow();
				oTd = new HtmlTableCell("td");

				oTd.Attributes.Add("class", "error");
				oTd.InnerHtml = "There was an error: No report object was identified for the report writer.";
				oTr.Cells.Add(oTd);
				tblMaster.Rows.Add(oTr);
				return;
			}

			//If the report is a Crystal Report, we need to do things a little differently
            //than if we're getting the raw SQL.
            #region If the Report is a Crystal Report
            /*
			if (oReport.Type == Report.ReportTypes.CrystalReport)
			{
				#region Render Crystal Report
				try
				{
					ReportDocument crReport = new ReportDocument();
					CrystalReportViewer crViewer = new CrystalReportViewer();

					crReport.Load(HttpContext.Current.Server.MapPath(oReport.Source));
					crReport.SetDatabaseLogon("crystal_reports", "fatoni*99");

					if (oReport.Parameters.Count > 0)
					{
						ParameterFields oParamFields = new ParameterFields();
						ParameterDiscreteValue oDiscreteValue;
						ParameterField oParamField;

						foreach (Parameter oParam in oReport.Parameters)
						{
							oDiscreteValue = new ParameterDiscreteValue();
							oParamField = new ParameterField();

							oDiscreteValue.Value = oParam.Value;
							oParamField.ParameterFieldName = oParam.Name;
							oParamField.CurrentValues.Add(oDiscreteValue);

							oParamFields.Add(oParamField);
						}

						crViewer.ParameterFieldInfo = oParamFields;
					}

					crViewer.ReportSource = crReport;
					crViewer.SeparatePages = false;
					crViewer.CssClass = "tblCrystalReport";
					crViewer.ClientTarget = "Downlevel";
					crViewer.DisplayGroupTree = false;
					crViewer.DisplayToolbar = false;

					oTr = new HtmlTableRow();
					oTd = new HtmlTableCell();
					oTd.Attributes["style"] = "font-size: 16px; font-weight: bold; text-align: center; padding: 4px; background-color: #a1b5cf;";
					oTd.InnerHtml = oReport.Name;
					oTd.InnerHtml += "<span class=\"verysmalltext\"><br/>" + DateTime.Now.ToString("MM/dd/yyyy hh:mm tt") + "</span>";
					if (oReport.Description.ToString() != "") {oTd.InnerHtml += "<span class=\"DoNotPrint\"><br/><a href=\"javascript:PopUpWindow('/Help/ReportsHelp.aspx#" + oReport.Name + oReport.ID.ToString() + "', 'wdwHelp', 'toolbars=no,statusbar=no,addressbar=no,scrollbars=yes,width=600,height=400');\" class=\"smalltext\">Help</a></span>";}

					oTr.Cells.Add(oTd);
					tblMaster.Rows.Add(oTr);

					oTr = new HtmlTableRow();
					oTd = new HtmlTableCell();

					oTd.Controls.Add(crViewer);
					oTd.Style["padding"] = "0px";
					oTd.Style["margin"] = "0px";
					oTr.Cells.Add(oTd);
					tblMaster.Rows.Add(oTr);

					tblMaster.Attributes["class"] = "tblCrystalReport";
				}
				catch
				{
					
				}
				#endregion
			}
			//If the report is a custom report, simply redirect them to the report passing
			//the parameters in the report object.
			else*/
            #endregion

            if (oReport.Type == Report.ReportTypes.CustomReport)
			{
				#region Redirect to Custom Report
				string sParams = "?";

				foreach (Parameter oParam in oReport.Parameters)
				{
					sParams = sParams + oParam.Name.Replace("@", "") + "=" + HttpContext.Current.Server.UrlEncode(oParam.Value) + "&";
				}

				HttpContext.Current.Response.Redirect(ConfigurationManager.AppSettings["WEB_ROOT"] + oReport.Source + sParams, true);
				#endregion
			}
			else if (oReport.Type == Report.ReportTypes.SQLReport)
			{
				#region Redirect to Container for SQL Reporting Services Report
				oTr = new HtmlTableRow();
				oTd = new HtmlTableCell();
				oTr.Attributes.Add("class", "trTitle");
				oTd.InnerHtml = oReport.Name;
				oTr.Cells.Add(oTd);
				tblMaster.Rows.Add(oTr);

				oTr = new HtmlTableRow();
				oTd = new HtmlTableCell();
				oTd.Attributes["style"] = "padding: 0px; margin: 0px; height: 650px;";
				oTd.InnerHtml = "<iframe src=\"" + ConfigurationManager.AppSettings["SQL_REPORT_SERVER_URL"] + HttpContext.Current.Server.UrlEncode(oReport.Source) + "\" frameBorder=\"none\" width=\"100%\" height=\"100%\" scrolling=\"auto\"></iframe>";
				oTr.Cells.Add(oTd);
				tblMaster.Rows.Add(oTr);
				#endregion
			}
			//Getting data straight from SQL Server.
			else
			{
				oDBLookup = new DBLookup(oConn);

				#region Render HTML Report from SQL database.
				//First, get the data from the database.
				DataSet oDataSet = GetSourceData(oReport);

				//Set the Sort Order if one is specified.
				string sSortOrder = "";
				int nColSpan = 0;

                //if (HttpContext.Current.Request["hidSortField"] != null)
                //    sSortOrder = HttpContext.Current.Request["hidSortField"].ToString();

                if (HttpContext.Current.Request["ctl00$oBodyPlaceHolder$hidSortField"] != null)
                    sSortOrder = HttpContext.Current.Request["ctl00$oBodyPlaceHolder$hidSortField"].ToString();
                
                
                //Get the proper data from the data set.
				DataTable oTable = oDataSet.Tables["tblReport"];
				DataRow[] oRows = oTable.Select("", sSortOrder);
				bool bDarkBG = false;

                #region Render the Table Header for the Report
                HtmlTableRow oTrHeader = new HtmlTableRow();
				HtmlTableCell oTdHeader = new HtmlTableCell();
				HtmlAnchor oAnchor;
				string sHref;
				LinkedReference oLinkedRef;

				oTdHeader.InnerHtml = oReport.Name;
				oTrHeader.Attributes.Add("class", "trTitle");

				//If there is a study ID parameter for this report, get the study name for it
				//and add it to the report header.
				if (oReport.GetParameter("@StudyID") != null)
				{
					Parameter oParam = oReport.GetParameter("@StudyID");
					oTdHeader.InnerHtml += " - " + oDBLookup.GetStudyName(Convert.ToInt32(oParam.Value), false);
				}
				else if (oReport.GetParameter("StudyID") != null)
				{
					Parameter oParam = oReport.GetParameter("StudyID");
                    oTdHeader.InnerHtml += " - " + oDBLookup.GetStudyName(Convert.ToInt32(oParam.Value), false);
				}

                oTdHeader.InnerHtml += "<span class=\"VeryVerySmallFont\"><br/>" + oRows.Length.ToString() + " Records - " + DateTime.Now.ToString("MM/dd/yyyy hh:mm tt") + "</span>";
				if (oReport.Description != "") {oTdHeader.InnerHtml += "<span class=\"DoNotPrint\"><br/><a href=\"javascript:PopUpWindow('" + webRoot + "/Help/ReportsHelp.aspx#" + oReport.Name + oReport.ID + "', 'wdwHelp', 'toolbars=no,statusbar=no,addressbar=no,scrollbars=yes,width=600,height=400');\" class=\"smalltext\">Help</a></span>";}

				oTrHeader.Cells.Add(oTdHeader);
				tblMaster.Rows.Add(oTrHeader);

				//Create an instance of a new table row. This will be the header for
				//the table, listing the field names on the report.
				oTr = new HtmlTableRow();
				oTr.Attributes.Add("class", "trHeader");
                #endregion

                //For each column in the result set, create a new table cell and put
				//the name of the column into the cell. Then, add the cell to the row.
				for (i=0;i<oTable.Columns.Count;i++)
				{
					if (!oTable.Columns[i].ToString().StartsWith("_"))
					{
						oTd = new HtmlTableCell("td");
						oTd.InnerHtml += oTable.Columns[i].ToString() + "\n";
						oTd.InnerHtml += "<a href=\"javascript:DoSubmitSort2('" + oTable.Columns[i].ToString() + " ASC');\"><img src=\"" + webRoot + "/images/sort-az.gif\" alt=\"Sort Ascending\" /></a>\n";
                        oTd.InnerHtml += "<a href=\"javascript:DoSubmitSort2('" + oTable.Columns[i].ToString() + " DESC');\"><img src=\"" + webRoot + "/images/sort-za.gif\" alt=\"Sort Descending\" /></a>\n";

						oTr.Cells.Add(oTd);
						nColSpan++;
					}
				}

				oTdHeader.ColSpan = nColSpan;

				//Add the row to the table.
				tblMaster.Rows.Add(oTr);

                //Now, do the same thing for each of the rows of data in the table.
                #region Loop Over Each Row in the Data Table
                for (i=0;i<oRows.Length;i++)
				{
					//Create new row.
					oTr = new HtmlTableRow();

					//Check the flag to see if we should apply the alternating style
					//to the row. Also, set the flag to the opposite of what it is
					//this time through the loop.
					if (bDarkBG)
						oTr.Attributes.Add("class", "trDark");

					oTr.Attributes.Add("onclick", "HighlightRow(this)");

					bDarkBG = !bDarkBG;

                    //Generate each cell in the row.
                    #region Loop Over Each Column in the Data Table
                    for (int j=0;j<oTable.Columns.Count;j++)
					{
						if (!oTable.Columns[j].ToString().StartsWith("_"))
						{
							oTd = new HtmlTableCell("td");

							//Check for any linked references that we need to display.
							oLinkedRef = oReport.GetLinkedReference(oTable.Columns[j].ToString());

							//If the current field is marked as a linked reference, display the link.
							if (oLinkedRef != null)
							{
								oAnchor = new HtmlAnchor();

                                if (oLinkedRef.URL != "mailto:")
                                {
                                    //Set the HREF variable to the URL of the linked reference.
                                    sHref = ConfigurationManager.AppSettings["WEB_ROOT"] + oLinkedRef.URL;

                                    //If there are parameters for this linked reference and there is not
                                    //a question mark at the end of the URL, add one.
                                    if (oLinkedRef.URLParams.Count > 0 && sHref.IndexOf("?") <= 0)
                                        sHref = sHref + "?";

                                    //If the link is to be opened in a new window, specify it.
                                    if (oLinkedRef.OpenInNewWindow)
                                        oAnchor.Attributes["target"] = "_new";

                                    //Add a key/value pair to the URL for each parameter that is passed in.
                                    foreach (string sURLParam in oLinkedRef.URLParams)
                                        sHref += CleanQueryString(sURLParam) + "=" + HttpContext.Current.Server.UrlEncode(oRows[i][sURLParam].ToString()) + "&amp;";
                                }
                                else
                                {
                                    sHref = oLinkedRef.URL;

                                    foreach (string sURLParam in oLinkedRef.URLParams)
                                        sHref += oRows[i][sURLParam].ToString();
                                }

								//Set the inner HTHML of the anchor tag and then set the href attribute.
								if (oTable.Columns[j].DataType == System.Type.GetType("System.DateTime") && oRows[i][j].ToString() != "")
									oAnchor.InnerHtml = Convert.ToDateTime(oRows[i][j].ToString()).ToString("MM/dd/yyyy");
								else
									oAnchor.InnerHtml = oRows[i][j].ToString();

								oAnchor.HRef = sHref;

								//Add the anchor tag to the table cell.
								oTd.Controls.Add(oAnchor);
							}
							else
							{
                                //if (oTable.Rows[i][j].ToString() == "")
                                if (oRows[i][j].ToString() == "")
                                    oTd.InnerHtml = "&nbsp;";
                                else
                                {
                                    if (oTable.Columns[j].DataType == System.Type.GetType("System.DateTime") && oRows[i][j].ToString() != "")
                                        oTd.InnerHtml = Convert.ToDateTime(oRows[i][j]).ToString("MM/dd/yyyy");
                                    else
                                        oTd.InnerHtml = oRows[i][j].ToString();
                                }
							}

							oTr.Cells.Add(oTd);
						}
                    }
                    #endregion

                    //Add the row to the table.
					tblMaster.Rows.Add(oTr);
                }
                #endregion
                #endregion
            }
		}

		#region Get Source Data for the Report
		private DataSet GetSourceData(Report oReport)
		{
			string sAuthUser = HttpContext.Current.Request.ServerVariables.Get("AUTH_USER");
			SqlCommand oCmd = new SqlCommand();
			DataSet oDataSet;

			oCmd.Connection = oConn;

			if (oReport.Type == Report.ReportTypes.StoredProcedure)
			{
				oCmd.CommandText = oReport.Source;
				oCmd.CommandType = System.Data.CommandType.StoredProcedure;
				oCmd.Parameters.Clear();

				foreach (Parameter oParam in oReport.Parameters)
				{
					SqlParameter oSqlParam = new SqlParameter();

					oSqlParam.Direction = System.Data.ParameterDirection.Input;
					oSqlParam.Size = oParam.Length;
					oSqlParam.ParameterName = oParam.Name;

					if (oParam.Value != "" && oParam.Value != "0" && oParam.Value != "-1")
						oSqlParam.Value = oParam.Value;
					else
						oSqlParam.Value = DBNull.Value;

					switch (oParam.DataType)
					{
						case "int":
							oSqlParam.SqlDbType = System.Data.SqlDbType.Int;
							break;

						case "datetime":
							oSqlParam.SqlDbType = System.Data.SqlDbType.DateTime;
							break;

						default:
							oSqlParam.SqlDbType = System.Data.SqlDbType.VarChar;
							break;
					}

					oCmd.Parameters.Add(oSqlParam);
				}

				oCmd.Parameters.AddWithValue("@StaffID", sAuthUser);
			}
			else
			{
				oCmd.CommandType = System.Data.CommandType.Text;

				foreach (Parameter oParam in oReport.Parameters)
				{
					if (oParam.Value != "" && oParam.Value != "0" && oParam.Value != "-1")
					{
						int nOrderByPosition;

						if (oReport.Source.IndexOf("GROUP BY") > 0)
							nOrderByPosition = oReport.Source.IndexOf("GROUP BY");
						else
							nOrderByPosition = oReport.Source.IndexOf("ORDER BY");

						if (nOrderByPosition > 0)
						{
							if (oParam.DataType == "int")
								oReport.Source = oReport.Source.Insert(nOrderByPosition, " AND " + oParam.Name + " = " + oParam.Value + " ");
							else
								oReport.Source = oReport.Source.Insert(nOrderByPosition, " AND " + oParam.Name + " = '" + oParam.Value + "' ");
						}
						else
						{
							if (oParam.DataType == "int")
								oReport.Source = oReport.Source += " AND " + oParam.Name + " = " + oParam.Value + " ";
							else
								oReport.Source = oReport.Source += " AND " + oParam.Name + " = '" + oParam.Value + "' ";
						}
					}
				}

				oCmd.CommandText = oReport.Source;
			}

			SqlDataAdapter oDataAdapter = new SqlDataAdapter(oCmd);
			oDataSet = new DataSet();
			oDataAdapter.Fill(oDataSet, "tblReport");

			return oDataSet;
		}
		#endregion

		#region Clean Query String
		private string CleanQueryString(string str)
		{
			str = str.Replace(".", "");
			str = str.Replace(" ", "");

			if (str.StartsWith("_"))
				str = str.Remove(0, 1);

			return str;
		}
		#endregion
	}
}