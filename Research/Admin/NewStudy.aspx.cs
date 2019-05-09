using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
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


public partial class Admin_NewStudy: BasePage  
{
	private List<string> entities;


	protected void Page_Init(object sender, EventArgs e)
	{
		
		if (!IsPostBack)
		{
			//LoadTimepoints();
		}

	}
	//If the master page default study is changed, update the Measure DDL
	protected void Master_Study_Changed(object sender, EventArgs e)
	{
		//lblStudyname.Text = Master.Master_studyname;

		//sql_Group.DataBind();
		//LoadEntities();

		Response.Redirect(Request.Url.ToString());


	}

	protected void Page_Load(object sender, EventArgs e)
	{
		//CHeck who this is:

		GetLabs();


		if (!IsPostBack)
		{
			//lblStudyname.Text = Master.Master_studyname;

		}

	}

	protected void GetLabs()
	{
		SQL_utils sql = new SQL_utils("backend");
		DataTable dt = sql.DataTable_from_SQLstring("select * from tbllab where labID in (select * from dbo.fn_AllowedLabs_by_User())");

		cboLab.DataSource = dt;
		cboLab.DataBind();
	}

	protected void btnNew_OnCLick(object sender, EventArgs e)
	{

		
		SQL_utils sql = new SQL_utils("backend");

		try
		{

			//string code = String.Format(String.Format("exec spSEC_StudyDesign__BeginNewStudy '{0}', '{1}' ", txtName.Value, txtNameFull.Value));

			int newstudyID = sql.IntScalar_from_SQLstring("select max(studyID) + 1 from tblStudy");
			int newgroupID = sql.IntScalar_from_SQLstring("select max(groupID) + 1 from tblGroup");

			//int labID = sql.IntScalar_from_SQLstring("select coalesce(defaultlabid, 1) from tblstaff where staffID = sec.systemuser_staffID()");
			int labID = Convert.ToInt32(cboLab.SelectedItem.Value.ToString());

			string studyname = txtName.Value.ToString();
			string studyfullname = txtNameFull.Value.ToString();

			if (newstudyID > 0 & labID > 0)
			{
				string code0 = String.Format("insert into dbo.tblstudy(studyID, studyname, studyfullname, active, labID) values({0}, '{1}', '{2}', 1, {3});", newstudyID, studyname, studyfullname, labID);
				string code1 = String.Format("insert into dbo.tblgroup(groupID, studyID, groupname, groupabbr, goaln, siteID, sortorder) values({0}, {1}, 'Group 1', 'Grp1', 0, 3, 1);", newgroupID, newstudyID);
				string code2 = String.Format("insert into dbo.tblLabGroup(groupid, labid, labgroup_enabled)  values({0}, {1}, 1 )", newgroupID, labID);

				string code3 = String.Format("insert into dbo.tblLabGroup_staff(staffid, dbroleid, labgroupid) select sec.systemuser_staffID(), 1, max(labgroupID)  from tbllabgroup where groupID={0};", newgroupID);

				string code4 = String.Format("insert into dbo.tblTimepoint(studyID, timepoint, timepoint_text) values ({0}, 1, 'T1');", newstudyID);


				string code = String.Format("{0} {1} {2} {3} {4}", code0, code1, code2, code3, code4);

				var result1 = sql.NonQuery_from_SQLstring_withRollback(code);
				

				if (result1 == "success")
				{
					try
					{
						sql.NonQuery_from_SQLstring(String.Format("update tblStaff set defaultstudyID={0}", newstudyID));

						Response.Redirect("StudyDesign.aspx");
					}
					catch(Exception ex) { }
				}
			}
		}

		catch (Exception ex)
		{

		}

		sql.Close();
		

	}
}

