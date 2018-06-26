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
using System.Data.SqlClient;
using System.Text;

namespace gen_ados_wps
{

	public partial class gen_ados_lookup : System.Web.UI.Page
	{
		protected System.Data.SqlClient.SqlConnection sqlDataConnection;
		protected System.Data.SqlClient.SqlCommand sqlGetGenericADOSMod;
	
		protected void Page_Load(object sender, System.EventArgs e)
		{
			//hide error label
			this.lblErrors.Visible = false;

			try 
			{
				if (!this.IsPostBack)
				{

					//setup studymeas ddl
					SetupDDL(this.ddlStudyMeasID);

					//default indexnum to 1
					txtIndexnum.Text = "1";

					// process request for form if id and studymeasid passed in querystring
					if (Request["id"] != null && Request["id"] != string.Empty && 
						Request["indexnum"] != null && Request["indexnum"] != string.Empty &&
						Request["studymeasid"] != null && Request["studymeasid"] != string.Empty
						
						)
					{
						Lookup(Request["id"], int.Parse(Request["indexnum"]), int.Parse(Request["studymeasid"]));					
					}
				}

				else
				{

					// process lookup button click
					if (this.ddlStudyMeasID.SelectedValue == "-1")
						throw new Exception("Select a Study Measure to Lookup.");
					else if (this.txtID.Text.Trim() == string.Empty)
						throw new Exception("Enter Subject ID to Lookup.");
					else if (this.txtIndexnum.Text.Trim() == string.Empty)
						throw new Exception("Enter Indexnum to Lookup.");
					else
					{	
						int testindexnum;
						try 
						{
							testindexnum = int.Parse(this.txtIndexnum.Text.Trim());
						}
						catch
						{
							throw new Exception("Indexnum should be an integer.");
						}
						Lookup(txtID.Text, testindexnum, int.Parse(ddlStudyMeasID.SelectedValue));
					}
				}

			}
			catch (Exception e1)
			{
				this.lblErrors.Text = e1.Message;
				this.lblErrors.Visible = true;
			}
		}


		private void SetupDDL(DropDownList ddl)
		{

			SqlConnection conn = null;
			SqlCommand cmd = null;

			try
			{
				conn = new SqlConnection(System.Configuration.ConfigurationManager.AppSettings["sqlDataConnection.ConnectionString"]);
				cmd = new SqlCommand();
				string sql = "select studymeasid,studyname + ': ' + studymeasname as studymeasure ";
				sql += "from uwautism_research_backend..tblstudy s join uwautism_research_backend..tblstudymeas sm on s.studyid=sm.studyid ";
				sql += "where studymeasid in (" + txtAllowedStudyMeasures.Text + ") ";
				sql += "union all ";
				sql += "select -1, '-Study Measures-' ";
				sql += "order by studymeasure";
				cmd.CommandText = sql;
				cmd.CommandType = System.Data.CommandType.Text;
				cmd.Connection = conn;
				
				ddl.DataTextField = "studymeasure";
				ddl.DataValueField = "studymeasid";
				conn.Open();
				SqlDataReader r = cmd.ExecuteReader();
				ddl.DataSource = r;
				ddl.DataBind();

			}
			catch{}
			finally
			{
				if (conn != null) conn.Close();
			}
			
		}

		/*
		 * All 4 ados modules of both the WPS and G versions are saved in the same table. Each module type 
		 * and version has it's own form.
		 * 
		 * Lookup() must determine the module and version of the desired record so that it can be openned using the correct form.
		 * 
		 * If @id, @indexnum, and @studymeasid identify 1 record than that record is openned.  If more
		 * than one record matches, a list is displayed allowing user to pick.
		 * 
		 */
		private void Lookup(string id, int indexnum, int studymeasid)
		{
			
			try 
			{
				
				SqlCommand com = new SqlCommand();
				com.Connection = sqlDataConnection;
				com.CommandType = CommandType.Text;
				
				string sql = "select s.studyname + ': ' + sm.studymeasname studymeas, ados.* from all_ados ados "
					+ "join uwautism_research_backend..tblstudymeas sm on sm.studymeasid=ados.studymeasid "
					+ "join uwautism_research_backend..tblstudy s on s.studyid=sm.studyid "
					+ "where ados.id=@id and ados.indexnum=@indexnum and ados.studymeasid=@studymeasid";

				com.CommandText = sql;
				
				com.Parameters.Add("@id",SqlDbType.VarChar, 15);
				com.Parameters.Add("@indexnum", SqlDbType.Int, 4);
				com.Parameters.Add("@studymeasid", SqlDbType.Int, 4);

				com.Parameters["@id"].Value = id;
				com.Parameters["@indexnum"].Value = indexnum;
				com.Parameters["@studymeasid"].Value = studymeasid;


				SqlDataAdapter adp = new SqlDataAdapter(com);
				DataSet ds = new DataSet();
				int recordCount = adp.Fill(ds, "results");

				LookupResults.Text = string.Empty;

				if (recordCount == 0)
				{
					throw new Exception(string.Format("ADOS with ID={0}, indexnum={1}, studymeasid={2} not found.", id, indexnum, studymeasid));
				}
				else if (recordCount == 1)
				{
					//get module and version and open it
					string adosver = ds.Tables["results"].Rows[0]["adosver"].ToString();
					short adosmod = (short)(ds.Tables["results"].Rows[0]["adosmod"]);
					string form = string.Format("ADOS_{0}_MOD{1}.aspx", adosver, adosmod);

					// redirect user to correct form
					this.Response.Redirect(string.Format(form + "?id={0}&indexnum={1}&studymeasid={2}", id, indexnum, studymeasid));

				}
				else
				{
					//use an HTML table to display matches with links to allow user to pick one
					LookupResults.Text = MakeLookupTable(ds.Tables["results"]);
				}

			}
			catch 
			{
				// re throw any exceptions
				throw;			
			}

			finally
			{
				this.sqlDataConnection.Close();
			}


		}

		private string MakeLookupTable(DataTable dt)
		{
			//a comma delimite list of fieldnames to include
			//with option format string
			string columns = "studymeas,id,indexnum,adosclin,adosdate{0:d},reliabilitydatedone{0:d}";

			//a comma delimited list of column names 
			//must have same number of items as colums
			string columnHeaders = "Measure,id,indexnum,clin,test date,rel. date";

			string[] colArr = columns.Split(new Char[] {','});
			string[] colHeaderArr = columnHeaders.Split(new Char[] {','});

			StringBuilder t = new StringBuilder();
			t.Append("Lookup returned multiple matching records:<br>");
			t.Append("<table class='grid'>");

			//add table headers
			t.Append("<tr><th></th>");

			foreach(string hdr in colHeaderArr)
			{
				t.Append("<th>" + hdr.Trim() + "</th>");
			}
			t.Append("</tr>");

			//add data rows
			foreach(DataRow r in dt.Rows)
			{
							
				t.Append("<tr>");

				string adosver = r["adosver"].ToString();
				short adosmod = (short)r["adosmod"];
				string form = string.Format("ADOS_{0}_MOD{1}.aspx", adosver, adosmod);

				//add link
				t.Append("<td><a href='" + form + "?pk=" + r["ados_pk"].ToString() + "'>Open</a></td>");
							
				//add data columns
				foreach(string col in colArr)
				{
					//split into fieldname and format string
					string fieldname = col.Trim();
					string formatSpec = string.Empty;

					//locate the format specifier, if any. It's the part in col 
					//that starts and ends with '{' and '}'.
					int leftbrace = col.Trim().IndexOf('{');
					if (leftbrace != -1)
					{
						int rightbrace = col.Trim().IndexOf('}');
						if (rightbrace != -1)
						{	
							fieldname = col.Substring(0, leftbrace);
							formatSpec = col.Substring(leftbrace, rightbrace-leftbrace+1);
						}
						else	
							//error
							throw new Exception("Bad format specifier in LookupColumns property.");
					}

					if (formatSpec == string.Empty)
						t.Append("<td>" + r[fieldname] + "</td>");
					else
						t.Append(string.Format("<td>" + formatSpec + "</td>", r[fieldname]));
				}
				t.Append("</tr>");
			}
			t.Append("</table>");

			return t.ToString();
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
			this.sqlGetGenericADOSMod = new System.Data.SqlClient.SqlCommand();
			// 
			// sqlDataConnection
			// 
			this.sqlDataConnection.ConnectionString = ((string)(configurationAppSettings.GetValue("sqlDataConnection.ConnectionString", typeof(string))));
			// 
			// sqlGetGenericADOSMod
			// 
			this.sqlGetGenericADOSMod.CommandText = "dbo.[spGetGenericADOSMod]";
			this.sqlGetGenericADOSMod.CommandType = System.Data.CommandType.StoredProcedure;
			this.sqlGetGenericADOSMod.Connection = this.sqlDataConnection;
			this.sqlGetGenericADOSMod.Parameters.Add(new System.Data.SqlClient.SqlParameter("@RETURN_VALUE", System.Data.SqlDbType.Int, 4, System.Data.ParameterDirection.ReturnValue, false, ((System.Byte)(0)), ((System.Byte)(0)), "", System.Data.DataRowVersion.Current, null));
			this.sqlGetGenericADOSMod.Parameters.Add(new System.Data.SqlClient.SqlParameter("@id", System.Data.SqlDbType.VarChar, 15));
			this.sqlGetGenericADOSMod.Parameters.Add(new System.Data.SqlClient.SqlParameter("@studymeasid", System.Data.SqlDbType.Int, 4));
			this.sqlGetGenericADOSMod.Parameters.Add(new System.Data.SqlClient.SqlParameter("@indexnum", System.Data.SqlDbType.Int, 4));
			this.sqlGetGenericADOSMod.Parameters.Add(new System.Data.SqlClient.SqlParameter("@ADOSver", System.Data.SqlDbType.VarChar, 50, System.Data.ParameterDirection.Output, false, ((System.Byte)(0)), ((System.Byte)(0)), "", System.Data.DataRowVersion.Current, null));
			this.sqlGetGenericADOSMod.Parameters.Add(new System.Data.SqlClient.SqlParameter("@ADOSMod", System.Data.SqlDbType.Int, 4, System.Data.ParameterDirection.Output, false, ((System.Byte)(0)), ((System.Byte)(0)), "", System.Data.DataRowVersion.Current, null));

		}
		#endregion
	}
}
