using System;
using System.Collections;
using System.ComponentModel;
using System.Drawing;
using System.Web;
using System.Web.SessionState;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using System.Data;
using System.Data.SqlClient;

namespace GenericDataEntryForms.IntHx
{
	/// <summary>
	/// Summary description for IntHx.
	/// </summary>
	public partial class IntHx : System.Web.UI.Page
	{
		protected System.Data.SqlClient.SqlConnection sqlConnection1;
		protected System.Data.SqlClient.SqlConnection sqlDataConnection;
		protected System.Data.SqlClient.SqlCommand sqlCommand1;
	


		private string GetProgramsHTML()
		{

			string result = string.Empty;
			try
			{
				int pk = DataEntryController1.PrimaryKeyVal;
				int studymeasid = DataEntryController1.StudyMeasID;
				if (pk != -1 && studymeasid != -1 
					&& DataEntryController1.FormState != DataEntryFramework.FormStates.INSERTING)
					//&& DataEntryController1.FormState != DataEntryFramework.FormStates.ENTERING	)
				{
					sqlCommand1.Parameters["@pk"].Value = pk;
					sqlCommand1.Parameters["@studymeasid"].Value = studymeasid;
					sqlConnection1.Open();
					SqlDataReader r = sqlCommand1.ExecuteReader();

					result = "Existing programs  <a href='javascript:mainForm.submit()'>Refresh&nbsp;Program&nbsp;List</a><br><table class='grid'><tr><th></th><th>Program #</th><th>Date</th></tr>";
					while(r.Read())
					{
						if ((int)r["pk"] == -1)
						{
							result += "<tr><td colspan='3' class='heading'>" + r["program"].ToString()
								+ "&nbsp;&nbsp;<a href='" + r["formurl"].ToString() + "' target='_blank'>create new</a>";
						}
						else
						{
							result += "<tr>"
								+ "<td><a href='" + r["formurl"].ToString() + "?pk=" + r["pk"].ToString() + "' target='_blank'>open</a></td>"
								+ "<td>" + r["prognum"].ToString() + "</td>" 
								+ "<td>" + string.Format("{0:d}",r["date"]) + "</td>"
								+"</tr>";
						}
					}
					result += "</table>";
				}
			}
			catch(Exception ex)
			{
				result = ex.Message;
			}
			finally
			{
				sqlConnection1.Close();
			}
			return result;
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
			this.sqlConnection1 = new System.Data.SqlClient.SqlConnection();
			this.sqlDataConnection = new System.Data.SqlClient.SqlConnection();
			this.sqlCommand1 = new System.Data.SqlClient.SqlCommand();
			// 
			// sqlConnection1
			// 
			this.sqlConnection1.ConnectionString = ((string)(configurationAppSettings.GetValue("sqlDataConnection.ConnectionString", typeof(string))));
			// 
			// sqlDataConnection
			// 
			this.sqlDataConnection.ConnectionString = ((string)(configurationAppSettings.GetValue("sqlDataConnection.ConnectionString", typeof(string))));
			// 
			// sqlCommand1
			// 
			this.sqlCommand1.CommandText = "SELECT \'Education\' program, - 1 pk, cast(NULL AS varchar(15)) [id], - 1 indexnum," +
				" sm.studymeasid, - 1 prognum, NULL [date], sm.formurl FROM uwautism_research_bac" +
				"kend..tblstudymeas sm WHERE (sm.measureid = 308 OR sm.measureid = 311) AND sm.st" +
				"udyid = (SELECT studyid FROM uwautism_research_backend..tblstudymeas WHERE study" +
				"measid = @studymeasid) UNION ALL SELECT \'Home\' program, - 1 pk, cast(NULL AS var" +
				"char(15)) [id], - 1 indexnum, sm.studymeasid, - 1 prognum, NULL [date], sm.formu" +
				"rl FROM uwautism_research_backend..tblstudymeas sm WHERE sm.measureid = 309 AND " +
				"sm.studyid = (SELECT studyid FROM uwautism_research_backend..tblstudymeas WHERE " +
				"studymeasid = @studymeasid) UNION ALL SELECT \'Other Home\' program, - 1 pk, cast(" +
				"NULL AS varchar(15)) [id], - 1 indexnum, sm.studymeasid, - 1 prognum, NULL [date" +
				"], sm.formurl FROM uwautism_research_backend..tblstudymeas sm WHERE sm.measureid" +
				" = 310 AND sm.studyid = (SELECT studyid FROM uwautism_research_backend..tblstudy" +
				"meas WHERE studymeasid = @studymeasid) UNION ALL SELECT \'Education\' program, int" +
				"hx_ep_pk pk, p.id, p.indexnum, p.studymeasid, epprgnum prognum, epdate [date], s" +
				"m.formurl FROM all_inthx_educprog p JOIN uwautism_research_backend..tblstudymeas" +
				" sm ON sm.studymeasid = p.studymeasid JOIN all_inthx a ON a.id = p.id WHERE a.in" +
				"thx_pk = @pk AND a.studymeasid = @studymeasid AND sm.studyid = (SELECT studyid F" +
				"ROM uwautism_research_backend..tblstudymeas WHERE studymeasid = @studymeasid) UN" +
				"ION ALL SELECT \'Education\' program, inthx_ep_pk pk, p.id, p.indexnum, p.studymea" +
				"sid, epprgnum prognum, epdate [date], sm.formurl FROM all_inthx_edseducprog p JO" +
				"IN uwautism_research_backend..tblstudymeas sm ON sm.studymeasid = p.studymeasid " +
				"JOIN all_inthx a ON a.id = p.id WHERE a.inthx_pk = @pk AND a.studymeasid = @stud" +
				"ymeasid AND sm.studyid = (SELECT studyid FROM uwautism_research_backend..tblstud" +
				"ymeas WHERE studymeasid = @studymeasid) UNION ALL SELECT \'Home\' program, inthx_h" +
				"p_pk pk, p.id, p.indexnum, p.studymeasid, hpprgnum prognum, hpdate [date], sm.fo" +
				"rmurl FROM all_inthx_homeprog p JOIN uwautism_research_backend..tblstudymeas sm " +
				"ON sm.studymeasid = p.studymeasid JOIN all_inthx a ON a.id = p.id WHERE a.inthx_" +
				"pk = @pk AND a.studymeasid = @studymeasid AND sm.studyid = (SELECT studyid FROM " +
				"uwautism_research_backend..tblstudymeas WHERE studymeasid = @studymeasid) UNION " +
				"ALL SELECT \'Other Home\' program, inthx_op_pk pk, p.id, p.indexnum, p.studymeasid" +
				", opprgnum prognum, opdate [date], sm.formurl FROM all_inthx_otherprog p JOIN uw" +
				"autism_research_backend..tblstudymeas sm ON sm.studymeasid = p.studymeasid JOIN " +
				"all_inthx a ON a.id = p.id WHERE a.inthx_pk = @pk AND a.studymeasid = @studymeas" +
				"id AND sm.studyid = (SELECT studyid FROM uwautism_research_backend..tblstudymeas" +
				" WHERE studymeasid = @studymeasid) ORDER BY program, prognum";
			this.sqlCommand1.Connection = this.sqlConnection1;
			this.sqlCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@pk", System.Data.SqlDbType.Int, 4, "IntHx_pk"));
			this.sqlCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@studymeasid", System.Data.SqlDbType.Int, 4, "studymeasid"));
			this.Load += new System.EventHandler(this.IntHx_Load);

		}
		#endregion

		protected void IntHx_Load(object sender, System.EventArgs e)
		{
		}


		/*
		 * Override OnPreRender instead of subscribing delegate to make
		 * sure that GetProgramsHTML is called after Controller code that 
		 * processes query strings.
		 */
		protected override void OnPreRender(EventArgs e)
		{
			base.OnPreRender (e);
			litPrograms.Text = GetProgramsHTML();	
		}

	}
}
