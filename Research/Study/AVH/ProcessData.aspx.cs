using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Diagnostics;
using System.Drawing;
using System.Linq;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using DevExpress.Web;
using DevExpress.Web.Data;
using DevExpress.Web.Rendering;
using uwac;


public partial class Study_AVH_ProcessData : BasePage
{
	//If the master page default study is changed, update the Measure DDL
	protected void Master_Study_Changed(object sender, EventArgs e)
	{
		//lblStudyname.Text = Master.Master_studyname;
		Response.Redirect(Request.Url.ToString());
	}

	protected void Page_Load(object sender, EventArgs e)
	{

		if (!IsPostBack)
		{
			//lblStudyname.Text = Master.Master_studyname;
		}
		//LoadData();

	}



	protected void btnProcessSurvey_OnCLick(object sender, EventArgs e)
	{

	}

	protected void LoadData()
	{ 
		SQL_utils sql = new SQL_utils("data");

		List<SqlParameter> ps = new List<SqlParameter>();


		DataTable dt_elig = sql.DataTable_from_SQLstring("select * from avh.eligibility");
		DataTable dt_survey = sql.DataTable_from_SQLstring("select * from avh.survey");
		DataTable dt_surveyflds = sql.DataTable_from_SQLstring("select q_id, b.tblpk, b.fldpk, fldname, stem, fieldlabel from avh.questions_def_flds a join def.fld b ON a.tblpk=b.tblpk and a.fldpk=b.fldpk");

		DataTable dt730 = sql.DataTable_from_SQLstring("select * from all_sds");
		sql.Close();


		int n_elig = dt_elig.Rows.Count;
		int n_survey = dt_survey.Rows.Count;
		int n_flds = dt_surveyflds.Rows.Count;

		grid.DataSource = dt_surveyflds;
		grid.DataBind();

		List<int> tblpks = dt_surveyflds.AsEnumerable().Select(f => f.Field<int>("tblpk")).Distinct().ToList();

		foreach(int tblpk in tblpks)
		{
			Debug.WriteLine("/***************************************************************************/");
			Debug.WriteLine("/***************************************************************************/");
			//CreateViewSyntax(tblpk);

			//if(tblpk==731) 
			BulkInsert(tblpk);
		}


	}



		protected void ProcessConcatField(DataTable dt, string colname, char separator, Type datatype)
	{
		
		foreach(DataRow row in dt.Rows)
		{
			string val = row[colname].ToString();
			List<string> vals = val.Split(separator).ToList();
			List<string> update_sql = new List<string>();
			foreach(string s in vals)
			{
				update_sql.Add(String.Format("{0} = 1", s));
			}

		}
	}


	protected void CreateViewSyntax(int tblpk)
	{
		SQL_utils sql = new SQL_utils("data");
		string tblname = sql.StringScalar_from_SQLstring("select tblname from def.tbl where tblpk=" + tblpk.ToString());

		int studymeasID = sql.IntScalar_from_SQLstring("select studymeasID from uwautism_research_backend..tblstudymeas where studyID=1110 and " +
			"measureID = (select measureID from def.tbl where tblpk=" + tblpk.ToString() + ")");

		DataTable dt_surveyflds = sql.DataTable_from_SQLstring("select q_id, b.tblpk, b.fldpk, fldname, stem, fieldlabel from avh.questions_def_flds a join def.fld b ON a.tblpk=b.tblpk and a.fldpk=b.fldpk where a.tblpk="+tblpk.ToString());
		DataTable dt = sql.DataTable_from_SQLstring("select * from " + tblname);

		List<string> flds = new List<string>();

		//Loop through rows of the surveyflds
		foreach (DataRow row in dt_surveyflds.Rows)
		{
			string fldname = row["fldname"].ToString();
			string surveyname = row["q_id"].ToString().Replace("-","_");
			string fld = String.Format(", {0} as {1}", surveyname, fldname);
			flds.Add(fld);
		}


		List<string> syntax = new List<string>();


		syntax.Add( String.Format("create view avh.vw{0} as ", tblpk));
		syntax.Add(String.Format("select {0} studymeasID, 1 indexnum, account_id id ", studymeasID));
		syntax.AddRange(flds);
		syntax.Add(", getdate() created, sec.systemuser() createdBy");
		syntax.Add("from avh.survey");
		syntax.Add("GO");
		syntax.Add(" ");

		//sql.NonQuery_from_SQLstring(String.Join(Environment.NewLine, syntax));

		sql.Close();

		foreach (string s in syntax)
		{
			Debug.WriteLine(s);
		}

	}

	protected void BulkInsert(int tblpk)
	{
		SQL_utils sql = new SQL_utils("data");
		string tblname = sql.StringScalar_from_SQLstring("select tblname from def.tbl where tblpk=" + tblpk.ToString());

		int studymeasID = sql.IntScalar_from_SQLstring("select studymeasID from uwautism_research_backend..tblstudymeas where studyID=1110 and " +
			"measureID = (select measureID from def.tbl where tblpk=" + tblpk.ToString() + ")");

		DataTable dt_surveyflds = sql.DataTable_from_SQLstring("select q_id, b.tblpk, b.fldpk, fldname, stem, fieldlabel from avh.questions_def_flds a join def.fld b ON a.tblpk=b.tblpk and a.fldpk=b.fldpk where a.tblpk=" + tblpk.ToString());
		

		string ids = "select id from uwautism_research_backend..vwmasterstatus_S where studyID=1110";

		DataTable dt_source = sql.DataTable_from_SQLstring(String.Format("select * from avh.vw{0} where id in ({1})", tblpk, ids));

		Debug.WriteLine(String.Format("{0} numrecs: {1}  going to {2}", tblpk, dt_source.Rows.Count, tblname));

		sql.BulkInsert(dt_source, tblname);

		sql.Close();

	}



	//protected void CreateInsertSyntax(DataTable dt_input, string db, string destination_table)
	//{
	//	SQL_utils sql = new SQL_utils(db);

	//	DataTable dt_flds = sql.DataTable_from_SQLstring("select lower(column_name) column_name, data_type from INFORMATION_SCHEMA.COLUMNS where table_name='" + destination_table + "'");
	//	List<string> dest_flds = dt_flds.AsEnumerable().Select(f => f.Field<string>("column_name")).ToList();


	//	List<string> insert_flds_syntax = new List<string>();

	//	//Build syntax
	//	//Loop through cols of the input to build the syntax
	//	foreach(DataColumn col in dt_input.Columns)
	//	{
	//		bool inDest = (dest_flds.Contains(col.ColumnName.ToLower())) ? true : false;
	//		string data_type = dt_flds.AsEnumerable().Where(f => f.Field<string>("column_name") == col.ColumnName.ToString()).Select(o => o.Field<string>("data_type")).First();

	//		if(inDest)
	//		{
	//			string addQuote = (SQL_utils.Texttypes.Contains(data_type)) ? "'" : "";

	//			insert_flds_syntax.Add(String.Format(" {0}={1}{2}{1}", col.ColumnName, addQuote, fld ))
	//		}
	//	}

	//	List<string> flds = new List<string>();
	//	//Loop through rows of the input data and insert them
	//	foreach (DataRow row in dt_input.Rows)
	//	{
	//		string fldname = row["fldname"].ToString();
	//		string surveyname = row["q_id"].ToString().Replace("-", "_");
	//		string fld = String.Format(", {0} as {1}", surveyname, fldname);
	//		flds.Add(fld);
	//	}

	//}




	//public List<SQL_utils.dbfield> DataRow_to_dbfields(DataRow row, string tbl, string db)
	//{
	//	SQL_utils sql = new SQL_utils(db);
	//	DataTable dt = new DataTable();
	//	DataTable dt_flds = sql.FieldDatatypes_for_table(tbl, db);

	//	List<SQL_utils.dbfield> flds = new List<SQL_utils.dbfield>();

	//	//foreach (DictionaryEntry d in hash)
	//	//{
	//	//	//Get the data type for the field from the db
	//	//	try
	//	//	{
	//	//		string fldtype = dt_flds.AsEnumerable().Where(r => r.Field<string>("column_name").ToLower() == d.Key.ToString().ToLower()).Select(r => r.Field<string>("data_type")).First();
	//	//		SQL_utils.dbfield fld = new SQL_utils.dbfield();
	//	//		fld.fieldname = d.Key.ToString();
	//	//		fld.value = d.Value.ToString();
	//	//		fld.sqldbtype = fldtype;
	//	//		flds.Add(fld);
	//	//	}
	//	//	catch (Exception ex)
	//	//	{
	//	//		string x = ex.Message;
	//	//		//field not in table
	//	//	}
	//	//}
	//	sql.Close();

	//	return flds;
	//}




}


