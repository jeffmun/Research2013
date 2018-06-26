using System;
using System.Collections;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Web;
using System.Web.SessionState;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using DataEntryFramework;
using System.Data.SqlClient;
using uwac;

namespace gen_adi
{

	public partial class gen_adi : System.Web.UI.Page
	{
		protected System.Data.SqlClient.SqlConnection sqlDataConnection;
		protected System.Data.SqlClient.SqlCommand sqlScoreMullen;
		protected System.Data.SqlClient.SqlCommand sqlScoreADIGeneric;
		protected System.Data.SqlClient.SqlCommand sqlScoreADI;
	
		protected void Page_Load(object sender, System.EventArgs e)
		{

			/*
			// create an instance of event handler so I can 
			// set insertsqlcommandtext
			// Need to do this do I can use the value of the indid field to set both indid and id
			DefaultFormEventHandler handler = new DefaultFormEventHandler();
			handler.InsertSqlCommandText = "INSERT INTO gen_adi (indid, [ID], Adsex,  Addate, Adint, Adinf, verified) VALUES (@indid, cast(@indid AS varchar(12)), @Adsex,  @Addate,  @Adint, @Adinf, @verified); SELECT * FROM gen_adi WHERE adi_pk = @@IDENTITY;";
			DataEntryController1.FormEventHandler = handler;
		*/


			//add onload event to body tag
			HtmlControl body = (HtmlControl)Master.FindControl("oBody");
			body.Attributes["onload"] = "gen_adi_onLoad()";


		}




		#region Web Form Designer generated code
		override protected void OnInit(EventArgs e)
		{
			//
			// CODEGEN: This call is required by the ASP.NET Web Form Designer.
			//
			InitializeComponent();
			base.OnInit(e);
		}
		
		/// <summary>
		/// Required method for Designer support - do not modify
		/// the contents of this method with the code editor.
		/// </summary>
		private void InitializeComponent()
		{    
			System.Configuration.AppSettingsReader configurationAppSettings = new System.Configuration.AppSettingsReader();
			this.sqlDataConnection = new System.Data.SqlClient.SqlConnection();
			this.sqlScoreADI = new System.Data.SqlClient.SqlCommand();
			this.sqlScoreADIGeneric = new System.Data.SqlClient.SqlCommand();
			// 
			// sqlDataConnection
			// 
			this.sqlDataConnection.ConnectionString = ((string)(configurationAppSettings.GetValue("sqlDataConnection.ConnectionString", typeof(string))));
			// 
			// sqlScoreADI
			// 
			this.sqlScoreADI.CommandText = "dbo.[spScoreADI]";
			this.sqlScoreADI.CommandType = System.Data.CommandType.StoredProcedure;
			this.sqlScoreADI.Connection = this.sqlDataConnection;
			this.sqlScoreADI.Parameters.Add(new System.Data.SqlClient.SqlParameter("@RETURN_VALUE", System.Data.SqlDbType.Int, 4, System.Data.ParameterDirection.ReturnValue, false, ((System.Byte)(0)), ((System.Byte)(0)), "", System.Data.DataRowVersion.Current, null));
			this.sqlScoreADI.Parameters.Add(new System.Data.SqlClient.SqlParameter("@adi_pk", System.Data.SqlDbType.Int, 4));
			this.sqlScoreADI.Parameters.Add(new System.Data.SqlClient.SqlParameter("@studyid", System.Data.SqlDbType.Int, 4));
			// 
			// sqlScoreADIGeneric
			// 
			this.sqlScoreADIGeneric.CommandText = "dbo.[spScoreADI_sh]";
			this.sqlScoreADIGeneric.CommandType = System.Data.CommandType.StoredProcedure;
			this.sqlScoreADIGeneric.Connection = this.sqlDataConnection;
			this.sqlScoreADIGeneric.Parameters.Add(new System.Data.SqlClient.SqlParameter("@RETURN_VALUE", System.Data.SqlDbType.Int, 4, System.Data.ParameterDirection.ReturnValue, false, ((System.Byte)(0)), ((System.Byte)(0)), "", System.Data.DataRowVersion.Current, null));
			this.sqlScoreADIGeneric.Parameters.Add(new System.Data.SqlClient.SqlParameter("@adi_pk", System.Data.SqlDbType.Int, 4));

		}
		#endregion


		protected void DataEntryController1_DoScore(object sender, System.EventArgs e)
		{
			try 
			{
				//set parameters for score sp call
				this.sqlScoreADIGeneric.Parameters["@adi_pk"].Value = DataEntryController1.PrimaryKeyVal;

				this.sqlDataConnection.Open();

				// this statement can throw an SqlException if any errors occur in spScoreMullen
				this.sqlScoreADIGeneric.ExecuteNonQuery();

			}
			catch (Exception ex)
			{
				DataEntryController1.AddNotification(string.Format("An exception ocurred while scoring: {0}", ex.Message));
				DataEntryController1.FormError = true;
			}
			finally 
			{
				this.sqlDataConnection.Close();
			}
		}


		protected void btnViewSummary_Click(object sender, EventArgs e)
		{
			int x = 0;

			//DataFieldControl smID = (DataFieldControl) FindControl("studymeasid");
			//TextBox tb = (TextBox)smID.Controls[1];

			string str_studymeasid = DataEntryController1.StudyMeasID.ToString();
			x = 2;
			RenderADIReport();
		}




		public void RenderADIReport()  //string id, string studymeasid)
		{
			SQL_utils sql = new SQL_utils("data");
			try
			{
				//conn = new SqlConnection(System.Configuration.ConfigurationManager.AppSettings["sqlDataConnection.ConnectionString"]);
				//SqlCommand cmd = new SqlCommand();
				//cmd.Connection = conn;
				
				//string sql = "select adi.*, s.studyname, sm.studymeasname from all_adi_sh adi ";
				//sql += "join uwautism_research_backend..tblstudymeas sm on sm.studymeasid=adi.studymeasid ";
				//sql += "join uwautism_research_backend..tblstudy s on s.studyid=sm.studyid ";
				//sql += "where adi.[id]=@id and adi.studymeasid=@studymeasid";

				//cmd.CommandText = sql;
				//cmd.CommandType = CommandType.Text;
			   

				//cmd.Parameters.Add(new SqlParameter("@adi_pk", SqlDbType.Int, 4));
				//cmd.Parameters["@adi_pk"].Value = pkval;
				//conn.Open();

				//SqlDataReader oReader = cmd.ExecuteReader();

				

				string sqltxt = "select adi.*, s.studyname, sm.studymeasname from all_adi_sh adi ";
				sqltxt += "join uwautism_research_backend..tblstudymeas sm on sm.studymeasid=adi.studymeasid ";
				sqltxt += "join uwautism_research_backend..tblstudy s on s.studyid=sm.studyid ";
				sqltxt += "where adi.adi_pk=@adi_pk";

				int pkval = DataEntryController1.PrimaryKeyVal;
				SqlParameter p = sql.CreateParam("adi_pk", pkval.ToString(), "int");

				SqlDataReader oReader = sql.Reader_from_SQLstring(sqltxt, p);



				if (oReader.HasRows)
				{
					oReader.Read();
					HtmlTableRow oTr;
					HtmlTableCell oTd;
					HtmlTable tblInner;
					HtmlTableRow trInner;
					HtmlTableCell tdInner;

					tblMaster.Rows.Clear();
					tblMaster.Attributes["class"] = "tblNonTableReport";

					#region First Major Row of Report
					oTr = new HtmlTableRow();
					oTd = new HtmlTableCell();
					oTd.ColSpan = 2;

					tblInner = new HtmlTable();
					tblInner.Style["width"] = " 100%";
					tblInner.CellSpacing = 0;
					trInner = new HtmlTableRow();

					tdInner = new HtmlTableCell();
					tdInner.ColSpan = 2;
					tdInner.Attributes["class"] = "tdTitle";
					tdInner.Style["border-bottom"] = " solid 1px #000000";
					tdInner.Style["border-right"] = " solid 1px #000000";
					tdInner.InnerHtml = "ADI (Short Form Version)";
					trInner.Cells.Add(tdInner);

					tdInner = new HtmlTableCell();
					tdInner.Attributes["class"] = "tdHeader";
					tdInner.InnerHtml = "Subject ID:";
					trInner.Cells.Add(tdInner);

					tdInner = new HtmlTableCell();
					tdInner.InnerHtml = oReader["ID"].ToString();
					trInner.Cells.Add(tdInner);

					tdInner = new HtmlTableCell();
					tdInner.Attributes["class"] = "tdHeader";
					tdInner.InnerHtml = "Date of ADI:";
					trInner.Cells.Add(tdInner);

					tdInner = new HtmlTableCell();
					tdInner.InnerHtml = Convert.ToDateTime(oReader["Addate"].ToString()).ToShortDateString();
					trInner.Cells.Add(tdInner);

					tdInner = new HtmlTableCell();
					tdInner.Attributes["class"] = "tdHeader";
					tdInner.InnerHtml = "Age (y:m):";
					trInner.Cells.Add(tdInner);

					tdInner = new HtmlTableCell();
					tdInner.InnerHtml = oReader["ADageym"].ToString() + " (" + oReader["ADagemos"].ToString() + ")";
					trInner.Cells.Add(tdInner);

					tdInner = new HtmlTableCell();
					tdInner.Attributes["class"] = "tdHeader";
					tdInner.InnerHtml = "Verified:";
					trInner.Cells.Add(tdInner);

					tdInner = new HtmlTableCell();
					tdInner.InnerHtml = oReader["verified"].ToString();
					trInner.Cells.Add(tdInner);

					tblInner.Rows.Add(trInner);

					trInner = new HtmlTableRow();

					tdInner = new HtmlTableCell();
					tdInner.Attributes["class"] = "tdHeader";
					tdInner.InnerHtml = "Study:";
					trInner.Cells.Add(tdInner);

					tdInner = new HtmlTableCell();
					tdInner.InnerHtml = oReader["studyname"].ToString();
					trInner.Cells.Add(tdInner);

					tdInner = new HtmlTableCell();
					tdInner.Attributes["class"] = "tdHeader";
					tdInner.InnerHtml = "Interviewer:";
					trInner.Cells.Add(tdInner);

					tdInner = new HtmlTableCell();
					tdInner.InnerHtml = oReader["ADint"].ToString();
					trInner.Cells.Add(tdInner);

					tdInner = new HtmlTableCell();
					tdInner.Attributes["class"] = "tdHeader";
					tdInner.InnerHtml = "Subject DOB:";
					trInner.Cells.Add(tdInner);

					tdInner = new HtmlTableCell();
					tdInner.InnerHtml = Convert.ToDateTime(oReader["AdDOB"].ToString()).ToShortDateString();
					trInner.Cells.Add(tdInner);

					tdInner = new HtmlTableCell();
					tdInner.ColSpan = 3;
					tdInner.Attributes["class"] = "tdHeader";
					tdInner.InnerHtml = "Date Algorithm report printed:";
					trInner.Cells.Add(tdInner);

					tdInner = new HtmlTableCell();
					tdInner.InnerHtml = DateTime.Today.ToString("MM/dd/yyyy");
					trInner.Cells.Add(tdInner);

					tblInner.Rows.Add(trInner);

					oTd.Controls.Add(tblInner);
					oTd.Style["border-bottom"] = " solid 3px #000000";
					oTr.Cells.Add(oTd);
					tblMaster.Rows.Add(oTr);
					#endregion

					#region Second Major Row of Report
					oTr = new HtmlTableRow();
					oTd = new HtmlTableCell();
					oTd.ColSpan = 2;

					tblInner = new HtmlTable();
					tblInner.Style["width"] = " 100%";
					tblInner.CellSpacing = 0;
					trInner = new HtmlTableRow();

					tdInner = new HtmlTableCell();
					tdInner.Style["width"] = " 15%";
					tdInner.Attributes["class"] = "tdHeader";
					tdInner.InnerHtml = "Scoring Errors:";
					trInner.Cells.Add(tdInner);

					tdInner = new HtmlTableCell();
					//tdInner.InnerHtml = oReader["scorcmnt"].ToString();
					tdInner.InnerText = oReader["scorcmnt"].ToString();
					trInner.Cells.Add(tdInner);

					tblInner.Rows.Add(trInner);

					oTd.Controls.Add(tblInner);
					oTd.Style["border-bottom"] = " solid 3px #000000";
					oTr.Cells.Add(oTd);
					tblMaster.Rows.Add(oTr);
					#endregion

					#region Third Major Row of Report
					oTr = new HtmlTableRow();
					oTd = new HtmlTableCell();
					oTd.ColSpan = 2;

					tblInner = new HtmlTable();
					tblInner.Style["width"] = " 100%";
					tblInner.CellSpacing = 0;
					trInner = new HtmlTableRow();

					tdInner = new HtmlTableCell();
					tdInner.ColSpan = 2;
					tdInner.Style["border"] = " solid 1px #000000";
					tdInner.Style["font-size"] = " 12pt";
					tdInner.Style["font-weight"] = " bold";
					tdInner.Style["padding"] = " 8px";
					tdInner.InnerHtml = "ADI Dx: " + oReader["adidx"];
					trInner.Cells.Add(tdInner);

					tdInner = new HtmlTableCell();
					tdInner.Style["font-size"] = " 12pt";
					tdInner.Style["font-weight"] = " bold";
					tdInner.Style["padding"] = " 8px";
					tdInner.ColSpan = 2;
					tdInner.InnerHtml = "&nbsp;"; //"UW ADI Dx: ";
					trInner.Cells.Add(tdInner);

					tdInner = new HtmlTableCell();
					tdInner.Style["font-size"] = " 12pt";
					tdInner.Style["font-weight"] = " bold";
					tdInner.Style["padding"] = " 8px";
					tdInner.ColSpan = 2;
					tdInner.InnerHtml = "&nbsp;"; //oReader["prelimdx"].ToString();
					trInner.Cells.Add(tdInner);

					tblInner.Rows.Add(trInner);

					trInner = new HtmlTableRow();

					tdInner = new HtmlTableCell();
					tdInner.Style["font-weight"] = "bold";
					tdInner.Style["vertical-align"] = "middle";
					tdInner.InnerHtml = "Section:<br/>Total:<br/>Cutoff met?:<br/>";
					tdInner.Style["border-bottom"] = " solid 1px #000000";
					trInner.Cells.Add(tdInner);

					tdInner = new HtmlTableCell();
					tdInner.Style["text-align"] = "center";
					tdInner.InnerHtml = "<b>Social</b><br/>";
					tdInner.InnerHtml += "<u>" + oReader["ADIsoc"].ToString() + "</u><br/>";
					tdInner.InnerHtml += ConvertToYesNo(oReader["autSocialCutoff"].ToString()) + "<br/>";
					tdInner.InnerHtml += "(>=10)";
					tdInner.Style["border-bottom"] = " solid 1px #000000";
					trInner.Cells.Add(tdInner);

					tdInner = new HtmlTableCell();
					tdInner.Style["text-align"] = "center";
					tdInner.InnerHtml = "<b>Communication</b><br/>";
					tdInner.InnerHtml += "<u>" + oReader["ADIcomLevel"].ToString() + " " + oReader["ADIcom"].ToString() + "</u><br/>";
					tdInner.InnerHtml += ConvertToYesNo(oReader["autCommCutoff"].ToString()) + "<br/>";
					tdInner.InnerHtml += "(V>=8, NV >=7)";
					tdInner.Style["border-bottom"] = " solid 1px #000000";
					trInner.Cells.Add(tdInner);

					tdInner = new HtmlTableCell();
					tdInner.Style["text-align"] = "center";
					tdInner.InnerHtml = "<b>Repetitive Bx</b><br/>";
					tdInner.InnerHtml += "<u>" + oReader["ADIrep"].ToString() + "</u><br/>";
					tdInner.InnerHtml += ConvertToYesNo(oReader["autRepetCutoff"].ToString()) + "<br/>";
					tdInner.InnerHtml += "(>=3)";
					tdInner.Style["border-bottom"] = " solid 1px #000000";
					trInner.Cells.Add(tdInner);

					tdInner = new HtmlTableCell();
					tdInner.Style["text-align"] = "center";
					tdInner.InnerHtml = "<b>Abnormality evident before 36 mos?</b><br/>";
					tdInner.InnerHtml += "<u>" + oReader["autabdevsum"].ToString() + "</u><br/>";
					tdInner.InnerHtml += ConvertToYesNo(oReader["autabdev"].ToString()) + "<br/>(>=1)";
					tdInner.Style["border-bottom"] = " solid 1px #000000";
					trInner.Cells.Add(tdInner);


					tblInner.Rows.Add(trInner);


					oTd.Controls.Add(tblInner);
					oTd.Style["border-bottom"] = " solid 3px #000000";
					oTr.Cells.Add(oTd);
					tblMaster.Rows.Add(oTr);
					#endregion

					#region Fourth Major Row of Report
					oTr = new HtmlTableRow();

					#region Left Side Cell
					//Begin Left Side Cell
					oTd = new HtmlTableCell();
					oTd.Style["width"] = " 50%";

					tblInner = new HtmlTable();
					tblInner.Style["width"] = " 100%";
					trInner = new HtmlTableRow();

					tdInner = new HtmlTableCell();
					tdInner.InnerHtml = "<b><u>Social</u></b>";
					trInner.Cells.Add(tdInner);

					tdInner = new HtmlTableCell();
					tdInner.ColSpan = 2;
					tdInner.Style["border"] = " solid 1px #000000";
					tdInner.InnerHtml = "*Items not labeled use the " + oReader["itemsused"] + " scores.";
					trInner.Cells.Add(tdInner);

					tblInner.Rows.Add(trInner);

					trInner = new HtmlTableRow();

					tdInner = new HtmlTableCell();
					tdInner.InnerHtml = "<b>b1: " + oReader["b1"].ToString() + "</b>";
					trInner.Cells.Add(tdInner);

					tdInner = new HtmlTableCell();
					tdInner.InnerHtml = "42. Direct gaze";
					trInner.Cells.Add(tdInner);

					tdInner = new HtmlTableCell();
					tdInner.Style["text-align"] = "left";
					tdInner.InnerHtml = "<b><u>" + oReader["use42"].ToString() + "</b></u>";
					trInner.Cells.Add(tdInner);

					tblInner.Rows.Add(trInner);

					trInner = new HtmlTableRow();

					tdInner = new HtmlTableCell();
					tdInner.InnerHtml = "&nbsp;";
					trInner.Cells.Add(tdInner);

					tdInner = new HtmlTableCell();
					tdInner.InnerHtml = "43. Social smiling";
					trInner.Cells.Add(tdInner);

					tdInner = new HtmlTableCell();
					tdInner.Style["text-align"] = "left";
					tdInner.InnerHtml = "<b><u>" + oReader["use43"].ToString() + "</b></u>";
					trInner.Cells.Add(tdInner);

					tblInner.Rows.Add(trInner);

					trInner = new HtmlTableRow();

					tdInner = new HtmlTableCell();
					tdInner.InnerHtml = "&nbsp;";
					trInner.Cells.Add(tdInner);

					tdInner = new HtmlTableCell();
					tdInner.InnerHtml = "52. Range of facial expr used to comm";
					trInner.Cells.Add(tdInner);

					tdInner = new HtmlTableCell();
					tdInner.Style["text-align"] = "left";
					tdInner.InnerHtml = "<b><u>" + oReader["use52"].ToString() + "</b></u>";
					trInner.Cells.Add(tdInner);

					tblInner.Rows.Add(trInner);

					tblInner.Rows.Add(trInner);

					trInner = new HtmlTableRow();

					tdInner = new HtmlTableCell();
					tdInner.InnerHtml = "<b>b2: " + oReader["b2"].ToString() + "</b>";
					trInner.Cells.Add(tdInner);

					tdInner = new HtmlTableCell();
					tdInner.InnerHtml = "64. Imaginitive play with peers (OVER 4yo only)";
					trInner.Cells.Add(tdInner);

					tdInner = new HtmlTableCell();
					tdInner.Style["text-align"] = "left";
					tdInner.InnerHtml = "<b><u>" + oReader["use64"].ToString() + "</b></u>";
					trInner.Cells.Add(tdInner);

					tblInner.Rows.Add(trInner);

					trInner = new HtmlTableRow();

					tdInner = new HtmlTableCell();
					tdInner.InnerHtml = "&nbsp;";
					trInner.Cells.Add(tdInner);

					tdInner = new HtmlTableCell();
					tdInner.InnerHtml = "66. Interest in children";
					trInner.Cells.Add(tdInner);

					tdInner = new HtmlTableCell();
					tdInner.Style["text-align"] = "left";
					tdInner.InnerHtml = "<b><u>" + oReader["use66"].ToString() + "</b></u>";
					trInner.Cells.Add(tdInner);

					//tblInner.Rows.Add(trInner);

					tblInner.Rows.Add(trInner);

					trInner = new HtmlTableRow();

					tdInner = new HtmlTableCell();
					tdInner.InnerHtml = "&nbsp;";
					trInner.Cells.Add(tdInner);

					tdInner = new HtmlTableCell();
					tdInner.InnerHtml = "67. Response to other children's approaches";
					trInner.Cells.Add(tdInner);

					tdInner = new HtmlTableCell();
					tdInner.Style["text-align"] = "left";
					tdInner.InnerHtml = "<b><u>" + oReader["use66"].ToString() + "</b></u>";
					trInner.Cells.Add(tdInner);

					//tblInner.Rows.Add(trInner);

					tblInner.Rows.Add(trInner);

					trInner = new HtmlTableRow();

					tdInner = new HtmlTableCell();
					tdInner.InnerHtml = "&nbsp;";
					trInner.Cells.Add(tdInner);

					tdInner = new HtmlTableCell();
					tdInner.InnerHtml = "68. Group play with peers (4-10yo) <br/><br/><b>OR (score either 68 or 69 based on age)</b>";
					trInner.Cells.Add(tdInner);

					tdInner = new HtmlTableCell();
					tdInner.Style["text-align"] = "left";
					tdInner.InnerHtml = "<b><u>" + oReader["use68"].ToString() + "</b></u>";
					trInner.Cells.Add(tdInner);

					//tblInner.Rows.Add(trInner);

					tblInner.Rows.Add(trInner);

					trInner = new HtmlTableRow();

					tdInner = new HtmlTableCell();
					tdInner.InnerHtml = "&nbsp;";
					trInner.Cells.Add(tdInner);

					tdInner = new HtmlTableCell();
					tdInner.InnerHtml = "69. Friendships (10-15yo)";
					trInner.Cells.Add(tdInner);

					tdInner = new HtmlTableCell();
					tdInner.Style["text-align"] = "left";
					tdInner.InnerHtml = "<b><u>" + oReader["use69"].ToString() + "</b></u>";
					trInner.Cells.Add(tdInner);

					tblInner.Rows.Add(trInner);

					trInner = new HtmlTableRow();

					tdInner = new HtmlTableCell();
					tdInner.InnerHtml = "<b>b3: " + oReader["b3"].ToString() + "</b>";
					trInner.Cells.Add(tdInner);

					tdInner = new HtmlTableCell();
					tdInner.InnerHtml = "45. Showing and directing attention";
					trInner.Cells.Add(tdInner);

					tdInner = new HtmlTableCell();
					tdInner.Style["text-align"] = "left";
					tdInner.InnerHtml = "<b><u>" + oReader["use45"].ToString() + "</b></u>";
					trInner.Cells.Add(tdInner);

					tblInner.Rows.Add(trInner);

					trInner = new HtmlTableRow();

					tdInner = new HtmlTableCell();
					tdInner.InnerHtml = "&nbsp;";
					trInner.Cells.Add(tdInner);

					tdInner = new HtmlTableCell();
					tdInner.InnerHtml = "46. Offering to share";
					trInner.Cells.Add(tdInner);

					tdInner = new HtmlTableCell();
					tdInner.Style["text-align"] = "left";
					tdInner.InnerHtml = "<b><u>" + oReader["use46"].ToString() + "</b></u>";
					trInner.Cells.Add(tdInner);

					tblInner.Rows.Add(trInner);

					trInner = new HtmlTableRow();

					tdInner = new HtmlTableCell();
					tdInner.InnerHtml = "&nbsp;";
					trInner.Cells.Add(tdInner);

					tdInner = new HtmlTableCell();
					tdInner.InnerHtml = "47. Seeking to share own enjoyment with others";
					trInner.Cells.Add(tdInner);

					tdInner = new HtmlTableCell();
					tdInner.Style["text-align"] = "left";
					tdInner.InnerHtml = "<b><u>" + oReader["use47"].ToString() + "</b></u>";
					trInner.Cells.Add(tdInner);

					tblInner.Rows.Add(trInner);

					trInner = new HtmlTableRow();

					tdInner = new HtmlTableCell();
					tdInner.InnerHtml = "<b>b4: " + oReader["b4"].ToString() + "</b>";
					trInner.Cells.Add(tdInner);

					tdInner = new HtmlTableCell();
					tdInner.InnerHtml = "49. Offers support";
					trInner.Cells.Add(tdInner);

					tdInner = new HtmlTableCell();
					tdInner.Style["text-align"] = "left";
					tdInner.InnerHtml = "<b><u>" + oReader["use49"].ToString() + "</b></u>";
					trInner.Cells.Add(tdInner);

					tblInner.Rows.Add(trInner);

					trInner = new HtmlTableRow();

					tdInner = new HtmlTableCell();
					tdInner.InnerHtml = "&nbsp;";
					trInner.Cells.Add(tdInner);

					tdInner = new HtmlTableCell();
					tdInner.InnerHtml = "11. Use of other's body to commun. (ever)";
					trInner.Cells.Add(tdInner);

					tdInner = new HtmlTableCell();
					tdInner.Style["text-align"] = "left";
					tdInner.InnerHtml = "<b><u>" + oReader["use11"].ToString() + "</b></u>";
					trInner.Cells.Add(tdInner);

					tblInner.Rows.Add(trInner);

					trInner = new HtmlTableRow();

					tdInner = new HtmlTableCell();
					tdInner.InnerHtml = "&nbsp;";
					trInner.Cells.Add(tdInner);

					tdInner = new HtmlTableCell();
					tdInner.InnerHtml = "51. Quality of social overtures";
					trInner.Cells.Add(tdInner);

					tdInner = new HtmlTableCell();
					tdInner.Style["text-align"] = "left";
					tdInner.InnerHtml = "<b><u>" + oReader["use51"].ToString() + "</b></u>";
					trInner.Cells.Add(tdInner);

					tblInner.Rows.Add(trInner);

					trInner = new HtmlTableRow();

					tdInner = new HtmlTableCell();
					tdInner.InnerHtml = "&nbsp;";
					trInner.Cells.Add(tdInner);

					tdInner = new HtmlTableCell();
					tdInner.InnerHtml = "53. Inappropriate facial expression (ever)";
					trInner.Cells.Add(tdInner);

					tdInner = new HtmlTableCell();
					tdInner.Style["text-align"] = "left";
					tdInner.InnerHtml = "<b><u>" + oReader["use53"].ToString() + "</b></u>";
					trInner.Cells.Add(tdInner);

					tblInner.Rows.Add(trInner);

					trInner = new HtmlTableRow();

					tdInner = new HtmlTableCell();
					tdInner.InnerHtml = "&nbsp;";
					trInner.Cells.Add(tdInner);

					tdInner = new HtmlTableCell();
					tdInner.InnerHtml = "57. Appropriateness of social responses";
					trInner.Cells.Add(tdInner);

					tdInner = new HtmlTableCell();
					tdInner.Style["text-align"] = "left";
					tdInner.InnerHtml = "<b><u>" + oReader["use57"].ToString() + "</b></u>";
					trInner.Cells.Add(tdInner);

					tblInner.Rows.Add(trInner);

					trInner = new HtmlTableRow();

					tdInner = new HtmlTableCell();
					tdInner.ColSpan = 3;
					tdInner.InnerHtml = "<b><u>Communication</b></u>";
					trInner.Cells.Add(tdInner);

					tblInner.Rows.Add(trInner);

					trInner = new HtmlTableRow();

					tdInner = new HtmlTableCell();
					tdInner.InnerHtml = "<b>c1: " + oReader["c1"].ToString() + "</b>";
					trInner.Cells.Add(tdInner);

					tdInner = new HtmlTableCell();
					tdInner.InnerHtml = "30. Pointing to express interest";
					trInner.Cells.Add(tdInner);

					tdInner = new HtmlTableCell();
					tdInner.Style["text-align"] = "left";
					tdInner.InnerHtml = "<b><u>" + oReader["use30"].ToString() + "</b></u>";
					trInner.Cells.Add(tdInner);

					tblInner.Rows.Add(trInner);

					trInner = new HtmlTableRow();

					tdInner = new HtmlTableCell();
					tdInner.InnerHtml = "&nbsp;";
					trInner.Cells.Add(tdInner);

					tdInner = new HtmlTableCell();
					tdInner.InnerHtml = "31. Conversational insturmental gestures";
					trInner.Cells.Add(tdInner);

					tdInner = new HtmlTableCell();
					tdInner.Style["text-align"] = "left";
					tdInner.InnerHtml = "<b><u>" + oReader["use31"].ToString() + "</b></u>";
					trInner.Cells.Add(tdInner);

					tblInner.Rows.Add(trInner);

					trInner = new HtmlTableRow();

					tdInner = new HtmlTableCell();
					tdInner.InnerHtml = "&nbsp;";
					trInner.Cells.Add(tdInner);

					tdInner = new HtmlTableCell();
					tdInner.InnerHtml = "32. Nodding";
					trInner.Cells.Add(tdInner);

					tdInner = new HtmlTableCell();
					tdInner.Style["text-align"] = "left";
					tdInner.InnerHtml = "<b><u>" + oReader["use32"].ToString() + "</b></u>";
					trInner.Cells.Add(tdInner);

					tblInner.Rows.Add(trInner);

					trInner = new HtmlTableRow();

					tdInner = new HtmlTableCell();
					tdInner.InnerHtml = "&nbsp;";
					trInner.Cells.Add(tdInner);

					tdInner = new HtmlTableCell();
					tdInner.InnerHtml = "33. Head shaking";
					trInner.Cells.Add(tdInner);

					tdInner = new HtmlTableCell();
					tdInner.Style["text-align"] = "left";
					tdInner.InnerHtml = "<b><u>" + oReader["use33"].ToString() + "</b></u>";
					trInner.Cells.Add(tdInner);

					tblInner.Rows.Add(trInner);

					trInner = new HtmlTableRow();

					tdInner = new HtmlTableCell();
					tdInner.InnerHtml = "<b>c4: " + oReader["c4"].ToString() + "</b>";
					trInner.Cells.Add(tdInner);

					tdInner = new HtmlTableCell();
					tdInner.InnerHtml = "29. Spontaneous imitation of actions";
					trInner.Cells.Add(tdInner);

					tdInner = new HtmlTableCell();
					tdInner.Style["text-align"] = "left";
					tdInner.InnerHtml = "<b><u>" + oReader["use29"].ToString() + "</b></u>";
					trInner.Cells.Add(tdInner);

					tblInner.Rows.Add(trInner);

					trInner = new HtmlTableRow();

					tdInner = new HtmlTableCell();
					tdInner.InnerHtml = "&nbsp;";
					trInner.Cells.Add(tdInner);

					tdInner = new HtmlTableCell();
					tdInner.InnerHtml = "63. Imaginitive play";
					trInner.Cells.Add(tdInner);

					tdInner = new HtmlTableCell();
					tdInner.Style["text-align"] = "left";
					tdInner.InnerHtml = "<b><u>" + oReader["use63"].ToString() + "</b></u>";
					trInner.Cells.Add(tdInner);

					tblInner.Rows.Add(trInner);

					trInner = new HtmlTableRow();

					tdInner = new HtmlTableCell();
					tdInner.InnerHtml = "&nbsp;";
					trInner.Cells.Add(tdInner);

					tdInner = new HtmlTableCell();
					tdInner.InnerHtml = "65. Imitative social play";
					trInner.Cells.Add(tdInner);

					tdInner = new HtmlTableCell();
					tdInner.Style["text-align"] = "left";
					tdInner.InnerHtml = "<b><u>" + oReader["use65"].ToString() + "</b></u>";
					trInner.Cells.Add(tdInner);

					tblInner.Rows.Add(trInner);

					trInner = new HtmlTableRow();

					tdInner = new HtmlTableCell();
					tdInner.InnerHtml = "<b>c2v: " + oReader["c2v"].ToString() + "</b>";
					trInner.Cells.Add(tdInner);

					tdInner = new HtmlTableCell();
					tdInner.InnerHtml = "20. Reciprocal conversation (current)";
					trInner.Cells.Add(tdInner);

					tdInner = new HtmlTableCell();
					tdInner.Style["text-align"] = "left";
					tdInner.InnerHtml = "<b><u>" + oReader["use20"].ToString() + "</b></u>";
					trInner.Cells.Add(tdInner);

					tblInner.Rows.Add(trInner);

					trInner = new HtmlTableRow();

					tdInner = new HtmlTableCell();
					tdInner.InnerHtml = "&nbsp;";
					trInner.Cells.Add(tdInner);

					tdInner = new HtmlTableCell();
					tdInner.InnerHtml = "16. Social vocalization / chat (current)";
					trInner.Cells.Add(tdInner);

					tdInner = new HtmlTableCell();
					tdInner.Style["text-align"] = "left";
					tdInner.InnerHtml = "<b><u>" + oReader["use16"].ToString() + "</b></u>";
					trInner.Cells.Add(tdInner);

					tblInner.Rows.Add(trInner);

					trInner = new HtmlTableRow();

					tdInner = new HtmlTableCell();
					tdInner.InnerHtml = "<b>c3v: " + oReader["c3v"].ToString() + "</b>";
					trInner.Cells.Add(tdInner);

					tdInner = new HtmlTableCell();
					tdInner.InnerHtml = "18. Stereotyped utterances (ever)";
					trInner.Cells.Add(tdInner);

					tdInner = new HtmlTableCell();
					tdInner.Style["text-align"] = "left";
					tdInner.InnerHtml = "<b><u>" + oReader["use18"].ToString() + "</b></u>";
					trInner.Cells.Add(tdInner);

					tblInner.Rows.Add(trInner);

					trInner = new HtmlTableRow();

					tdInner = new HtmlTableCell();
					tdInner.InnerHtml = "&nbsp;";
					trInner.Cells.Add(tdInner);

					tdInner = new HtmlTableCell();
					tdInner.InnerHtml = "22. Inappropriate questions (ever)";
					trInner.Cells.Add(tdInner);

					tdInner = new HtmlTableCell();
					tdInner.Style["text-align"] = "left";
					tdInner.InnerHtml = "<b><u>" + oReader["use22"].ToString() + "</b></u>";
					trInner.Cells.Add(tdInner);

					tblInner.Rows.Add(trInner);

					trInner = new HtmlTableRow();

					tdInner = new HtmlTableCell();
					tdInner.InnerHtml = "&nbsp;";
					trInner.Cells.Add(tdInner);

					tdInner = new HtmlTableCell();
					tdInner.InnerHtml = "23. Pronomial reversal (ever)";
					trInner.Cells.Add(tdInner);

					tdInner = new HtmlTableCell();
					tdInner.Style["text-align"] = "left";
					tdInner.InnerHtml = "<b><u>" + oReader["use23"].ToString() + "</b></u>";
					trInner.Cells.Add(tdInner);

					tblInner.Rows.Add(trInner);

					trInner = new HtmlTableRow();

					tdInner = new HtmlTableCell();
					tdInner.InnerHtml = "&nbsp;";
					trInner.Cells.Add(tdInner);

					tdInner = new HtmlTableCell();
					tdInner.InnerHtml = "24. Neologisms/Idiosyncratic language (ever)";
					trInner.Cells.Add(tdInner);

					tdInner = new HtmlTableCell();
					tdInner.Style["text-align"] = "left";
					tdInner.InnerHtml = "<b><u>" + oReader["use24"].ToString() + "</b></u>";
					trInner.Cells.Add(tdInner);

					tblInner.Rows.Add(trInner);

					oTd.Controls.Add(tblInner);
					oTr.Cells.Add(oTd);
					//End Left Side Cell
					#endregion

					#region Right Side Cell
					//Begin Right Side Cell
					oTd = new HtmlTableCell();
					oTd.Style["width"] = " 50%";
					oTd.InnerHtml = "&nbsp;<br/>";
					oTr.Controls.Add(oTd);

					tblInner = new HtmlTable();
					tblInner.Style["width"] = " 100%";

					trInner = new HtmlTableRow();

					tdInner = new HtmlTableCell();
					tdInner.ColSpan = 5;
					tdInner.InnerHtml = "<b><u>Repetitive Behavior</u></b>";

					trInner.Cells.Add(tdInner);

					tblInner.Rows.Add(trInner);

					trInner = new HtmlTableRow();

					tdInner = new HtmlTableCell();
					tdInner.Style["width"] = " 20%";
					tdInner.InnerHtml = "<b>d1: " + oReader["d1"].ToString() + "</b>";
					trInner.Cells.Add(tdInner);

					tdInner = new HtmlTableCell();
					tdInner.ColSpan = 2;
					tdInner.InnerHtml = "70. Circumscribed interests (ever) OVER 4yo ONLY";
					trInner.Cells.Add(tdInner);

					tdInner = new HtmlTableCell();
					tdInner.Style["text-align"] = "left";
					tdInner.ColSpan = 2;
					tdInner.InnerHtml = "<b><u>" + oReader["use70"].ToString() + "</b></u>";
					trInner.Cells.Add(tdInner);

					tblInner.Rows.Add(trInner);

					trInner = new HtmlTableRow();

					tdInner = new HtmlTableCell();
					tdInner.InnerHtml = "&nbsp;";
					trInner.Cells.Add(tdInner);

					tdInner = new HtmlTableCell();
					tdInner.ColSpan = 2;
					tdInner.InnerHtml = "71. Unusual preoccupations (ever)";
					trInner.Cells.Add(tdInner);

					tdInner = new HtmlTableCell();
					tdInner.Style["text-align"] = "left";
					tdInner.ColSpan = 2;
					tdInner.InnerHtml = "<b><u>" + oReader["use71"].ToString() + "</b></u>";
					trInner.Cells.Add(tdInner);

					tblInner.Rows.Add(trInner);

					trInner = new HtmlTableRow();

					tdInner = new HtmlTableCell();
					tdInner.InnerHtml = "<b>d2: " + oReader["d2"].ToString() + "</b>";
					trInner.Cells.Add(tdInner);

					tdInner = new HtmlTableCell();
					tdInner.ColSpan = 2;
					tdInner.InnerHtml = "25. Verbal rituals (ever)";
					trInner.Cells.Add(tdInner);

					tdInner = new HtmlTableCell();
					tdInner.Style["text-align"] = "left";
					tdInner.ColSpan = 2;
					tdInner.InnerHtml = "<b><u>" + oReader["use25"].ToString() + "</b></u>";
					trInner.Cells.Add(tdInner);

					tblInner.Rows.Add(trInner);

					trInner = new HtmlTableRow();

					tdInner = new HtmlTableCell();
					tdInner.InnerHtml = "&nbsp;";
					trInner.Cells.Add(tdInner);

					tdInner = new HtmlTableCell();
					tdInner.ColSpan = 2;
					tdInner.InnerHtml = "75. Compulsions/Rituals (ever)";
					trInner.Cells.Add(tdInner);

					tdInner = new HtmlTableCell();
					tdInner.Style["text-align"] = "left";
					tdInner.ColSpan = 2;
					tdInner.InnerHtml = "<b><u>" + oReader["use75"].ToString() + "</b></u>";
					trInner.Cells.Add(tdInner);

					tblInner.Rows.Add(trInner);

					trInner = new HtmlTableRow();

					tdInner = new HtmlTableCell();
					tdInner.Style["vertical-align"] = "top";
					tdInner.InnerHtml = "<b>d3: " + oReader["d3"].ToString() + "</b>";
					trInner.Cells.Add(tdInner);

					tdInner = new HtmlTableCell();
					tdInner.ColSpan = 2;
					tdInner.InnerHtml = "81. Hand and finger mannerisms <br/><br/><b>OR (score higher)</b>";
					trInner.Cells.Add(tdInner);

					tdInner = new HtmlTableCell();
					tdInner.Style["text-align"] = "left";
					tdInner.ColSpan = 2;
					tdInner.InnerHtml = "<b><u>" + oReader["use81"].ToString() + "</b></u>";
					trInner.Cells.Add(tdInner);

					tblInner.Rows.Add(trInner);

					trInner = new HtmlTableRow();

					tdInner = new HtmlTableCell();
					tdInner.InnerHtml = "&nbsp;";
					trInner.Cells.Add(tdInner);

					tdInner = new HtmlTableCell();
					tdInner.ColSpan = 2;
					tdInner.InnerHtml = "84. Other complex mannerisms (ever)";
					trInner.Cells.Add(tdInner);

					tdInner = new HtmlTableCell();
					tdInner.Style["text-align"] = "left";
					tdInner.ColSpan = 2;
					tdInner.InnerHtml = "<b><u>" + oReader["use84"].ToString() + "</b></u>";
					trInner.Cells.Add(tdInner);

					tblInner.Rows.Add(trInner);

					trInner = new HtmlTableRow();

					tdInner = new HtmlTableCell();
					tdInner.Style["vertical-align"] = "top";
					tdInner.InnerHtml = "<b>d4: " + oReader["d4"].ToString() + "</b>";
					trInner.Cells.Add(tdInner);

					tdInner = new HtmlTableCell();
					tdInner.ColSpan = 2;
					tdInner.InnerHtml = "72. Repetitive use of objects (ever) <br/><br/><b>OR (score higher)</b>";
					trInner.Cells.Add(tdInner);

					tdInner = new HtmlTableCell();
					tdInner.ColSpan = 2;
					tdInner.Style["text-align"] = "left";
					tdInner.InnerHtml = "<b><u>" + oReader["use72"].ToString() + "</b></u>";
					trInner.Cells.Add(tdInner);

					tblInner.Rows.Add(trInner);

					trInner = new HtmlTableRow();

					tdInner = new HtmlTableCell();
					tdInner.InnerHtml = "&nbsp;";
					trInner.Cells.Add(tdInner);

					tdInner = new HtmlTableCell();
					tdInner.ColSpan = 2;
					tdInner.InnerHtml = "77. Unusual sesory interests (ever)";
					trInner.Cells.Add(tdInner);

					tdInner = new HtmlTableCell();
					tdInner.ColSpan = 2;
					tdInner.Style["text-align"] = "left";
					tdInner.InnerHtml = "<b><u>" + oReader["use77"].ToString() + "</b></u>";
					trInner.Cells.Add(tdInner);

					tblInner.Rows.Add(trInner);

					trInner = new HtmlTableRow();

					tdInner = new HtmlTableCell();
					tdInner.ColSpan = 5;
					tdInner.InnerHtml = "&nbsp;";
					trInner.Cells.Add(tdInner);

					tblInner.Rows.Add(trInner);

					trInner = new HtmlTableRow();

					tdInner = new HtmlTableCell();
					tdInner.ColSpan = 5;
					tdInner.InnerHtml = "<b><u>Abnormality of development evident at or before 36 months</b></u>";
					trInner.Cells.Add(tdInner);

					tblInner.Rows.Add(trInner);

					trInner = new HtmlTableRow();

					tdInner = new HtmlTableCell();
					tdInner.ColSpan = 2;
					tdInner.InnerHtml = "Age parents 1st noticed (if < 36 mos, score 1)";
					trInner.Cells.Add(tdInner);

					tdInner = new HtmlTableCell();
					tdInner.Style["width"] = " 10%";
					tdInner.InnerHtml = oReader["AD002"].ToString();
					trInner.Cells.Add(tdInner);

					tdInner = new HtmlTableCell();
					tdInner.Style["width"] = " 10%";
					tdInner.InnerHtml = "(2):";
					trInner.Cells.Add(tdInner);

					tdInner = new HtmlTableCell();
					tdInner.Style["width"] = " 10%";
					tdInner.InnerHtml = oReader["itm2r"].ToString();
					trInner.Cells.Add(tdInner);

					tblInner.Rows.Add(trInner);

					trInner = new HtmlTableRow();

					tdInner = new HtmlTableCell();
					tdInner.ColSpan = 2;
					tdInner.InnerHtml = "Age when abnormally 1st evident (if 3 or 4, score 1)";
					trInner.Cells.Add(tdInner);

					tdInner = new HtmlTableCell();
					tdInner.Style["width"] = " 10%";
					tdInner.InnerHtml = oReader["AD093"].ToString();
					trInner.Cells.Add(tdInner);

					tdInner = new HtmlTableCell();
					tdInner.Style["width"] = " 10%";
					tdInner.InnerHtml = "(93):";
					trInner.Cells.Add(tdInner);

					tdInner = new HtmlTableCell();
					tdInner.Style["width"] = " 10%";
					tdInner.InnerHtml = oReader["itm93r"].ToString();
					trInner.Cells.Add(tdInner);

					tblInner.Rows.Add(trInner);

					trInner = new HtmlTableRow();

					tdInner = new HtmlTableCell();
					tdInner.ColSpan = 2;
					tdInner.InnerHtml = "Intvwr's judgement on age manifest (if < 36 mos, score 1)";
					trInner.Cells.Add(tdInner);

					tdInner = new HtmlTableCell();
					tdInner.Style["width"] = " 10%";
					tdInner.InnerHtml = oReader["AD094"].ToString();
					trInner.Cells.Add(tdInner);

					tdInner = new HtmlTableCell();
					tdInner.Style["width"] = " 10%";
					tdInner.InnerHtml = "(94):";
					trInner.Cells.Add(tdInner);

					tdInner = new HtmlTableCell();
					tdInner.Style["width"] = " 10%";
					tdInner.InnerHtml = oReader["itm94r"].ToString();
					trInner.Cells.Add(tdInner);

					tblInner.Rows.Add(trInner);

					trInner = new HtmlTableRow();

					tdInner = new HtmlTableCell();
					tdInner.ColSpan = 2;
					tdInner.InnerHtml = "Age at 1st single words (if > 24 mos, score 1)";
					trInner.Cells.Add(tdInner);

					tdInner = new HtmlTableCell();
					tdInner.Style["width"] = " 10%";
					tdInner.InnerHtml = oReader["AD012desc"].ToString();
					trInner.Cells.Add(tdInner);

					tdInner = new HtmlTableCell();
					tdInner.Style["width"] = " 10%";
					tdInner.InnerHtml = "(12):";
					trInner.Cells.Add(tdInner);

					tdInner = new HtmlTableCell();
					tdInner.Style["width"] = " 10%";
					tdInner.InnerHtml = oReader["itm12r"].ToString();
					trInner.Cells.Add(tdInner);

					tblInner.Rows.Add(trInner);

					trInner = new HtmlTableRow();

					tdInner = new HtmlTableCell();
					tdInner.ColSpan = 2;
					tdInner.InnerHtml = "Age 1st phases (if > 33 mos, score 1)";
					trInner.Cells.Add(tdInner);

					tdInner = new HtmlTableCell();
					tdInner.Style["width"] = " 10%";
					tdInner.InnerHtml = oReader["AD013desc"].ToString();
					trInner.Cells.Add(tdInner);

					tdInner = new HtmlTableCell();
					tdInner.Style["width"] = " 10%";
					tdInner.InnerHtml = "(13):";
					trInner.Cells.Add(tdInner);

					tdInner = new HtmlTableCell();
					tdInner.Style["width"] = " 10%";
					tdInner.InnerHtml = oReader["itm13r"].ToString();
					trInner.Cells.Add(tdInner);

					tblInner.Rows.Add(trInner);

					trInner = new HtmlTableRow();

					tdInner = new HtmlTableCell();
					tdInner.ColSpan = 5;
					tdInner.InnerHtml = "&nbsp;";
					trInner.Cells.Add(tdInner);

					tblInner.Rows.Add(trInner);

					trInner = new HtmlTableRow();

					tdInner = new HtmlTableCell();
					tdInner.InnerHtml = "&nbsp;";
					trInner.Cells.Add(tdInner);

					tdInner = new HtmlTableCell();
					tdInner.InnerHtml = "<b><u>Loss of Skills</b></u>";
					trInner.Cells.Add(tdInner);

					tdInner = new HtmlTableCell();
					tdInner.InnerHtml = "<b><u>Before 5</b></u>";
					trInner.Cells.Add(tdInner);

					tdInner = new HtmlTableCell();
					tdInner.ColSpan = 2;
					tdInner.InnerHtml = "<b><u>After 5</b></u>";
					trInner.Cells.Add(tdInner);

					tblInner.Rows.Add(trInner);

					trInner = new HtmlTableRow();

					tdInner = new HtmlTableCell();
					tdInner.InnerHtml = "&nbsp;";
					trInner.Cells.Add(tdInner);

					tdInner = new HtmlTableCell();
					tdInner.InnerHtml = "Loss of skills?";
					trInner.Cells.Add(tdInner);

					tdInner = new HtmlTableCell();
					tdInner.InnerHtml = oReader["AD095be"].ToString();
					trInner.Cells.Add(tdInner);

					tdInner = new HtmlTableCell();
					tdInner.ColSpan = 2;
					tdInner.InnerHtml = oReader["AD095af"].ToString();
					trInner.Cells.Add(tdInner);

					tblInner.Rows.Add(trInner);

					trInner = new HtmlTableRow();

					tdInner = new HtmlTableCell();
					tdInner.InnerHtml = "&nbsp;";
					trInner.Cells.Add(tdInner);

					tdInner = new HtmlTableCell();
					tdInner.InnerHtml = "Loss of skills due to illness?";
					trInner.Cells.Add(tdInner);

					tdInner = new HtmlTableCell();
					tdInner.InnerHtml = oReader["AD096be"].ToString();
					trInner.Cells.Add(tdInner);

					tdInner = new HtmlTableCell();
					tdInner.ColSpan = 2;
					tdInner.InnerHtml = oReader["AD096af"].ToString();
					trInner.Cells.Add(tdInner);

					tblInner.Rows.Add(trInner);

					trInner = new HtmlTableRow();

					tdInner = new HtmlTableCell();
					tdInner.InnerHtml = "&nbsp;";
					trInner.Cells.Add(tdInner);

					tdInner = new HtmlTableCell();
					tdInner.InnerHtml = "Loss of skills in communication?";
					trInner.Cells.Add(tdInner);

					tdInner = new HtmlTableCell();
					tdInner.InnerHtml = oReader["AD097be"].ToString();
					trInner.Cells.Add(tdInner);

					tdInner = new HtmlTableCell();
					tdInner.ColSpan = 2;
					tdInner.InnerHtml = oReader["AD097af"].ToString();
					trInner.Cells.Add(tdInner);

					tblInner.Rows.Add(trInner);

					trInner = new HtmlTableRow();

					tdInner = new HtmlTableCell();
					tdInner.InnerHtml = "&nbsp;";
					trInner.Cells.Add(tdInner);

					tdInner = new HtmlTableCell();
					tdInner.InnerHtml = "Loss of social interest/responsiveness?";
					trInner.Cells.Add(tdInner);

					tdInner = new HtmlTableCell();
					tdInner.InnerHtml = oReader["AD098be"].ToString();
					trInner.Cells.Add(tdInner);

					tdInner = new HtmlTableCell();
					tdInner.ColSpan = 2;
					tdInner.InnerHtml = oReader["AD098af"].ToString();
					trInner.Cells.Add(tdInner);

					tblInner.Rows.Add(trInner);

					trInner = new HtmlTableRow();

					tdInner = new HtmlTableCell();
					tdInner.InnerHtml = "&nbsp;";
					trInner.Cells.Add(tdInner);

					tdInner = new HtmlTableCell();
					tdInner.InnerHtml = "Loss of play and imagination?";
					trInner.Cells.Add(tdInner);

					tdInner = new HtmlTableCell();
					tdInner.InnerHtml = oReader["AD099be"].ToString();
					trInner.Cells.Add(tdInner);

					tdInner = new HtmlTableCell();
					tdInner.ColSpan = 2;
					tdInner.InnerHtml = oReader["AD099af"].ToString();
					trInner.Cells.Add(tdInner);

					tblInner.Rows.Add(trInner);

					trInner = new HtmlTableRow();

					tdInner = new HtmlTableCell();
					tdInner.InnerHtml = "&nbsp;";
					trInner.Cells.Add(tdInner);

					tdInner = new HtmlTableCell();
					tdInner.InnerHtml = "Loss of adaptive skills?";
					trInner.Cells.Add(tdInner);

					tdInner = new HtmlTableCell();
					tdInner.InnerHtml = oReader["AD100be"].ToString();
					trInner.Cells.Add(tdInner);

					tdInner = new HtmlTableCell();
					tdInner.ColSpan = 2;
					tdInner.InnerHtml = oReader["AD100af"].ToString();
					trInner.Cells.Add(tdInner);

					tblInner.Rows.Add(trInner);

					trInner = new HtmlTableRow();

					tdInner = new HtmlTableCell();
					tdInner.InnerHtml = "&nbsp;";
					trInner.Cells.Add(tdInner);

					tdInner = new HtmlTableCell();
					tdInner.InnerHtml = "Loss of preacad, acad, or voc. skills?";
					trInner.Cells.Add(tdInner);

					tdInner = new HtmlTableCell();
					tdInner.InnerHtml = oReader["AD101be"].ToString();
					trInner.Cells.Add(tdInner);

					tdInner = new HtmlTableCell();
					tdInner.ColSpan = 2;
					tdInner.InnerHtml = oReader["AD101af"].ToString();
					trInner.Cells.Add(tdInner);

					tblInner.Rows.Add(trInner);

					trInner = new HtmlTableRow();

					tdInner = new HtmlTableCell();
					tdInner.InnerHtml = "&nbsp;";
					trInner.Cells.Add(tdInner);

					tdInner = new HtmlTableCell();
					tdInner.InnerHtml = "Loss of motor skills?";
					trInner.Cells.Add(tdInner);

					tdInner = new HtmlTableCell();
					tdInner.InnerHtml = oReader["AD102be"].ToString();
					trInner.Cells.Add(tdInner);

					tdInner = new HtmlTableCell();
					tdInner.ColSpan = 2;
					tdInner.InnerHtml = oReader["AD102af"].ToString();
					trInner.Cells.Add(tdInner);

					tblInner.Rows.Add(trInner);

					trInner = new HtmlTableRow();

					tdInner = new HtmlTableCell();
					tdInner.InnerHtml = "&nbsp;";
					trInner.Cells.Add(tdInner);

					tdInner = new HtmlTableCell();
					tdInner.InnerHtml = "Age when main loss of skills apparent";
					trInner.Cells.Add(tdInner);

					tdInner = new HtmlTableCell();
					tdInner.ColSpan = 3;
					tdInner.InnerHtml = oReader["AD103"].ToString();
					trInner.Cells.Add(tdInner);

					tblInner.Rows.Add(trInner);

					oTd.Controls.Add(tblInner);
					//End Right Side Cell
					#endregion

					oTr.Cells.Add(oTd);
					tblMaster.Rows.Add(oTr);
					#endregion

				}


			}
			catch (Exception ex)
			{
				lblError.Text = ex.Message;
				lblError.Visible = true;
			}
			finally
			{
				sql.Close();
				//if (conn != null) conn.Close();
			}
		}

		private string ConvertToYesNo(string sVal)
		{
			string sRetval = string.Empty;
			if (sVal == "-1" || sVal == "1")
				sRetval = "Yes";
			else if (sVal == "0")
				sRetval = "No";
			return sRetval;
		}

}
}
