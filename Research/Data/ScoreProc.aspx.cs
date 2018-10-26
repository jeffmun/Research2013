using System;
using System.Collections.Generic;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Data.SqlClient;
using System.Data.OleDb;
using AutismCenterBase.Utilities;
using System.IO;
using System.Drawing;
using System.Text;
using uwac;
using System.Diagnostics;

public partial class Data_ScoreProc : BasePage
{

	//private SqlConnection oConn = new SqlConnection();
	//private SqlConnection oConnData = new SqlConnection();
	//private DBLookup oDBLookup;
	//private int tableID;
	//private int tblpk;

	//private ReadConfig oConfig = new ReadConfig();
	//private AutismCenterBase.Security.Login oLogin = new AutismCenterBase.Security.Login();


	protected void Page_Load(object sender, EventArgs e)
	{

		//oConn.ConnectionString = ConfigurationManager.ConnectionStrings["TRACKING_CONN_STRING"].ToString();
		//oConn.Open();
		//oConnData.ConnectionString = ConfigurationManager.ConnectionStrings["DATA_CONN_STRING"].ToString();


		//oDBLookup = new DBLookup(oConn);

		//if (Page.Request.QueryString["tableID"] != null)
		//{
		//    tableID = Convert.ToInt32(Page.Request.QueryString["tableID"]);
		//    Load_gv_ScoreProc(tableID);
		//}
		if (Page.Request.QueryString["tblpk"] != null & !IsPostBack)
		{
			int tblpk = Convert.ToInt32(Page.Request.QueryString["tblpk"]);
			Load_gv_ScoreProc(tblpk);
		}
	}


	protected void Load_gv_ScoreProc(int tblpk)
	{
		try
		{

			SQL_utils sql = new SQL_utils("data");
			List<SqlParameter> ps = new List<SqlParameter>();
			ps.Add(sql.CreateParam("tblpk", tblpk.ToString(), "int"));


			DataTable dt = sql.DataTable_from_ProcName("spDEF__spScore_by_tblpk", ps);


			int n1 = dt.Rows.Count;

			string proccode = "";
			string objcode = "";


			int i = 0;
			foreach (DataRow row in dt.Rows)
			{

				if (i == 0)
				{
					//get referenced objects 
					//string refobj_code = String.Format("exec spDEF_ReferencedObj_in_ScoringProc '{0}'", row["spName"].ToString());

					string refobj_code = "SELECT o.name AS ReferencingObject, o.type_desc ReferencingObject_type, sd.referenced_entity_name AS ReferencedObject, o2.type_desc ReferencedObject_type " + Environment.NewLine +
					" FROM sys.sql_expression_dependencies AS sd " + Environment.NewLine +
					" INNER JOIN sys.objects AS o ON o.object_id = sd.referencing_id " + Environment.NewLine +
					" INNER JOIN sys.objects AS o2 ON o2.object_id = sd.referenced_id " + Environment.NewLine +
					" WHERE o.name = '" + row["spName"].ToString() +  "'" + Environment.NewLine +
					" and(o2.type_desc like '%function%' or o2.type_desc like '%procedure%') " + Environment.NewLine +
					" and sd.referenced_entity_name != 'systemuser' ";




					Debug.WriteLine(refobj_code);

					Debug.WriteLine("[" + row["spName"].ToString() + "]");


					DataTable dt_refobj = sql.DataTable_from_SQLstring(refobj_code);

					lblTableName.Text = Convert.ToString(row["tblname"]);
					lblspName.Text = Convert.ToString(row["spName"]);
					lblLength.Text = Convert.ToString(row["spTextHTML_Length"]);

					int n = -1;
					if(dt_refobj != null)
					{
						n = dt_refobj.Rows.Count;
					}
					lblRefObj.Text = n.ToString(); // (dt_refobj != null) ? dt_refobj.Rows.Count.ToString() : "0";


					proccode = Convert.ToString(row["spTextHTML"]);
					Literal litproc = new Literal();
					litproc = FormatCodeOfObject(sql, row["spName"].ToString());

					placehold_proc.Controls.Add(litproc);

					//display referenced objects
					foreach (DataRow obj in dt_refobj.Rows)
					{

						string refobjname = obj["ReferencedObject"].ToString();

						Literal lit = new Literal();
						lit = FormatCodeOfObject(sql, refobjname);
						placehold_obj.Controls.Add(lit);


						//string myobjcode = sql.StringScalar_from_SQLstring("exec spRefObj_FullSQLtext " + refobjname);

						//DataTable dt_objcode = sql.DataTable_from_SQLstring("exec sp_helptext '" + refobjname + "'");

						//objcode = String.Format("<br/><br/><b><u>{0}</u></b><br/>", refobjname);
						//for(int c=0; c < dt_objcode.Rows.Count; c++)
						//{
						//	DataRow r = dt_objcode.Rows[c];
						//	string newline = String.Format("<span style=\"color:silver\">{0}.</span> {1}<br/>", c + 1, r["Text"]);
						//	objcode += newline;
						//}

						////objcode = String.Format("<b><u>{0}</u></b><br/>{1}<br/><br/>", refobjname, myobjcode);

						//lit.Text = objcode;

					}
				}

				i++;
			}


			//lit_ProcCode.Text = "<pre class=\"prettyprint\">" + proccode + "</pre>";
			//lit_ObjCode.Text = "<pre class=\"prettyprint\">" + objcode + "</pre>";

			//lit_ProcCode.Text = proccode ;
			//lit_ObjCode.Text =  objcode ;


			//gv_ScoreProc.DataSource = dt;

			//gv_ScoreProc.DataBind();

			sql.Close();


		}
		catch (SqlException)
		{

		}
	}



	protected Literal FormatCodeOfObject(SQL_utils sql, string refobjname)
	{
		
		Literal lit = new Literal();

		//string refobjname = obj["ReferencedObject"].ToString();

		////string myobjcode = sql.StringScalar_from_SQLstring("exec spRefObj_FullSQLtext " + refobjname);

		DataTable dt = sql.DataTable_from_SQLstring("exec sp_helptext '" + refobjname + "'");


		string objcode = String.Format("<br/><br/><b><u>{0}</u></b><br/>", refobjname);
		for (int c = 0; c < dt.Rows.Count; c++)
		{
			DataRow r = dt.Rows[c];
			string newline = String.Format("<span style=\"color:silver\">{0}.</span> {1}<br/>", c + 1, r["Text"]);
			objcode += newline;
		}

		//objcode = String.Format("<b><u>{0}</u></b><br/>{1}<br/><br/>", refobjname, myobjcode);

		//lit.Text = "<pre class=\"prettyprint\">" + objcode + "</pre>";
		lit.Text = objcode;
		return lit;
	}


}
