using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using NReco.PivotData;
using NReco.PivotData.Output;
using uwac;
using uwac.trk;

public partial class Track_SubjectMatrix : BasePage
{
	protected void Page_Load(object sender, EventArgs e)
	{

		if (!IsPostBack)
		{
			LoadStudies();
		}

	}

	protected void LoadStudies()
	{

		SQL_utils sql = new SQL_utils("backend");

		DataTable dt = sql.DataTable_from_SQLstring("select groupID, studyname + ' (' + groupname + ')' as studygroup from tblStudy a JOIN tblGroup b ON a.studyID=b.studyID where active in (1,2) order by studyname");

		sql.Close();

		gridStudies.DataSource = dt;
		gridStudies.DataBind();
		gridStudies.Visible = true;


		gridStudies2.DataSource = dt;
		gridStudies2.DataBind();
		gridStudies2.Visible = true;


	}


	protected void LoadMatrix()
	{
		panel.Controls.Clear();
		List<string> studies = dataops.GetListString(gridStudies.GridView.GetSelectedFieldValues("groupID"));
		List<string> studygroups = dataops.GetListString(gridStudies.GridView.GetSelectedFieldValues("studygroup"));

		List<string> studies2 = dataops.GetListString(gridStudies2.GridView.GetSelectedFieldValues("groupID"));
		List<string> studygroups2 = dataops.GetListString(gridStudies2.GridView.GetSelectedFieldValues("studygroup"));


		string csv_studies = String.Join(",", studies);
		string csv_studies2 = String.Join(",", studies2);

		//string csv_studies = "foo";

		//only those selected
		//string code1 = String.Format("select firstname, lastname, a.*, ad.address1, ad.city, ad.state, ad.zip " + Environment.NewLine +
		//	", ID + '|' + cast(subjID as varchar)+ '|' + cast(p.householdID as varchar) as IDinfo " + Environment.NewLine +
		//	"from " + Environment.NewLine +
		//	"(select personID, householdID, firstname, lastname, addressID from tblperson) p " + Environment.NewLine +
		//	"join (select personID, subjID, sex, EthnicityDesc race, HispanicDesc ethnicity, studyname, ID, groupname, subjstatus " + Environment.NewLine +
		//	"from trk.vwMasterStatus_S where groupID in ({0})) a ON p.personID = a.personID " + Environment.NewLine +
		//	"left join tblAddress ad ON p.AddressID = ad.addressID", csv_studies);

		string code1 = String.Format("select firstname, lastname, a.*, ad.address1, ad.city, ad.state, ad.zip " + Environment.NewLine +
			", ID + '|' + cast(subjID as varchar)+ '|' + cast(p.householdID as varchar) as IDinfo " + Environment.NewLine +
			", (case when groupID in ({0}) then 'step 1' else 'step 2: limited' end) as Selection " + Environment.NewLine +
			"from " + Environment.NewLine +
			"(select personID, householdID, firstname, lastname, addressID from tblperson" +
			"	where personID in (select personID from tblsubject where groupID in ({0}))	) p " + Environment.NewLine +
			"join (select personID, groupID, subjID, sex, EthnicityDesc race, HispanicDesc ethnicity, studyname, ID, groupname, subjstatus " + Environment.NewLine +
			"from trk.vwMasterStatus_S where groupID in ({0},{1}) ) a ON p.personID = a.personID " + Environment.NewLine +
			"left join tblAddress ad ON p.AddressID = ad.addressID", csv_studies, csv_studies2);



		//all others
		string code2 = String.Format("select firstname, lastname, a.*, ad.address1, ad.city, ad.state, ad.zip " + Environment.NewLine +
			", ID + '|' + cast(subjID as varchar)+ '|' + cast(p.householdID as varchar) as IDinfo " + Environment.NewLine +
			", (case when groupID in ({0}) then 'step 1' else 'step 2: all' end) as Selection " + Environment.NewLine +
			"from " + Environment.NewLine +
			"(select personID, householdID, firstname, lastname, addressID from tblperson" +
		   "	where personID in (select personID from tblsubject where groupID in ({0}))	) p " + Environment.NewLine +
			"join (select personID, groupID, subjID, sex, EthnicityDesc race, HispanicDesc ethnicity, studyname, ID, groupname, subjstatus " + Environment.NewLine +
			"from trk.vwMasterStatus_S ) a ON p.personID = a.personID " + Environment.NewLine +
			"left join tblAddress ad ON p.AddressID = ad.addressID", csv_studies);

		string code = (studies2.Count > 0) ? code1 : code2;

		SQL_utils sql = new SQL_utils("backend");

		DataTable dt = sql.DataTable_from_SQLstring(code);


		string code_n = String.Format("select count(distinct(personID)) n from ({0} ) z", code);
		int npersons = sql.IntScalar_from_SQLstring(code_n);

		sql.Close();


		//pivotENT.DataSource = dt;
		//pivotENT.DataBind();

		//pivotENT.Visible = true;
		if (studies2.Count > 0)
		{
			Literal lbl = new Literal();
			lbl.Text = String.Format("There are {0} persons in the selected groups:<br/> {1}", npersons, String.Join("<br/> ", studygroups));
			panel.Controls.Add(lbl);
		}
		else
		{
			Literal lbl = new Literal();
			lbl.Text = String.Format("There are {0} persons in the selected groups:<br/> {1}", npersons, String.Join("<br/> ", studygroups));
			panel.Controls.Add(lbl);
		}
		NRecoPivot(dt);

	}

	protected void NRecoPivot(DataTable dt)
	{

		PivotTable pivotTable = utilPivotTable.DataTable_to_PivotTable(dt
			, new List<string> { "lastname", "firstname",  "sex" }, new List<string> { "Selection", "studyname", "groupname" }, "IDinfo",
			new List<utilPivotTable.AggrFx> { utilPivotTable.AggrFx.Min });

		var htmlResult = new StringWriter();
		var pvtHtmlWr = new MyHtmlWriter3(htmlResult);

		pvtHtmlWr.TotalsColumn = false;
		pvtHtmlWr.TotalsRow = false;
		pvtHtmlWr.GrandTotal = false;

		pvtHtmlWr.Write(pivotTable);

		Literal xtab = new Literal();
		xtab.Text = htmlResult.ToString();

		panel.Controls.Add(xtab);

	}

	protected void btnLoad_Click(object sender, EventArgs e)
	{
		LoadMatrix();
	}




	public class MyHtmlWriter3 : NReco.PivotData.Output.PivotTableHtmlWriter
	{

		public MyHtmlWriter3(TextWriter writer)
			: base(writer)
		{

			this.AllowHtml = true;

		}

		protected override void OnWriteValueCell(NReco.PivotData.Output.PivotTableHtmlWriter.ValueCellContext valueContext)
		{

			try
			{
				string[] vals = valueContext.FormattedValue.Split('|');
				string ID = vals[0];
				string subjID = vals[1];
				string hhID = vals[2];


				string link1 =("https://uwac.autism.washington.edu/Research/Track/Subject.aspx");
				string link2 = ("https://uwac.autism.washington.edu/Research/Tracking/Household2.aspx");

				string newval = String.Format("<a href='{0}?subjID={1}'>{2}</a> <a href='{3}?hhID={4}'>HH</a> "
					, link1, subjID, ID, link2, hhID);

				valueContext.FormattedValue = newval;


				//if (valueContext.RowKey.DimKeys.Contains("EQUIPMENT"))
				//{
				//	valueContext.AddCssClass("cssDirectTotal");
				//}
				//if (valueContext.ColumnKey.DimKeys.Contains("Projected"))
				//{
				//	valueContext.AddCssClass("cssProjected");
				//}


			}
			catch (Exception ex)
			{
				string x = ex.Message;
			}
		}


		protected override void OnWriteKeyCell(NReco.PivotData.Output.PivotTableHtmlWriter.KeyCellContext keyContext)
		{
			//if (keyContext.Dimension == "FacilityName")
			//{
			//	if ("Projected".Equals(keyContext.DimensionKey))
			//		keyContext.AddCssClass("cssProjected");
			//}
		}

	}




}