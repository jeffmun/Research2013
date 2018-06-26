using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DevExpress.Web;
using uwac;
using uwac.trk;

public partial class Track_otherID : System.Web.UI.Page
{
	protected void Page_Load(object sender, EventArgs e)
	{


		if(!IsPostBack)
		{
			Session["otherID"] = null;
			Session["studies"] = null;
			LoadStudies();
		}
		else
		{
			otherID_by_person.DataSource = (DataTable)Session["otherID_by_person"];
			otherID_by_person.DataBind();

			otherID_by_subject.DataSource = (DataTable)Session["otherID_by_subject"];
			otherID_by_subject.DataBind();

			gridLkupStudy.DataSource = (DataTable)Session["studies"];
			gridLkupStudy.DataBind();

		}

	}

	protected void 	btnLoadSubj_OnClick(object sender, EventArgs e)
	{

		LoadSubjects();
	}

	protected void LoadStudies()
	{
		SQL_utils sql = new SQL_utils("backend");

		DataTable dt_studies = sql.DataTable_from_SQLstring("exec spSEC_GetStudies_CanView_by_User");
		Session["studies"] = dt_studies;

		gridLkupStudy.DataSource = dt_studies;
		gridLkupStudy.DataBind();

		sql.Close();
	}


	protected void LoadSubjects()
	{

		var selstudies =  dataops.GetCSV(gridLkupStudy.GridView.GetSelectedFieldValues(gridLkupStudy.KeyFieldName));

		SQL_utils sql = new SQL_utils("backend");
		string sqlcode;

		bool includeAll = (chkIncludeAll.Checked) ? true : false;

		string addLEFTJOIN = (includeAll) ? "LEFT " : "";

		sqlcode = String.Format(" select otherID, sitename, a.personID, code6, a.lastname, a.firstname, a.sex, a.ethnicitydesc as race, a.hispanicdesc as ethnicity, a.personRole " +
		" from vwPerson a " +
		" {1} join vwOTherID2 b ON a.personID = b.personID " +
		" left join code6_person c ON a.PersonID = c.rownum" +
		" where a.personID in (select personID from vwMasterStatus_S where studyID in ({0})) order by a.lastname, a.firstname ", selstudies, addLEFTJOIN);



		//sqlcode = String.Format("select otherID, sitename, a.personID, code6, a.lastname, a.firstname, sex, ethnicitydesc as race, hispanicdesc as ethnicity, personRole " +
		//	" from vwOTherID2 a" +
		//	" {1} join vwPerson b ON a.personID = b.personID" +
		//	" left join code6_person c ON a.PersonID = c.rownum  " +
		//	" where a.personID in (select personID from vwMasterStatus_S where studyID in  ({0}))", selstudies);

		DataTable dt = sql.DataTable_from_SQLstring(sqlcode);

		otherID_by_person.DataSource = dt;
		otherID_by_person.DataBind();
		Session["otherID_by_person"] = dt;


		string sqlcode2 = String.Format("select studyname, ID, groupname, otherID, sitename, code6, a.personID, a.lastname, a.firstname, sex, ethnicitydesc as race, hispanicdesc as ethnicity, personRole " +
			" from vwOTherID2 a" +
			" join vwPerson a2 ON a.personID = a2.personID" +
			" join vwMasterStatus_S b ON a.personID = b.personID" +
			" left join code6_person c ON a.PersonID = c.rownum  " + 
			" where a.personID in (select personID from vwMasterStatus_S where studyID in  ({0})) order by a.lastname, a.firstname", selstudies);

		DataTable dt2 = sql.DataTable_from_SQLstring(sqlcode2);


		otherID_by_subject.DataSource = dt2;
		otherID_by_subject.DataBind();
		Session["otherID_by_subject"] = dt2;



		sql.Close();
	}

}