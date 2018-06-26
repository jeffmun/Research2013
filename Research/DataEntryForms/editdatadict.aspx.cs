using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.IO;
using System.Text;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using Obout.Grid;
using Obout.Ajax.UI.HTMLEditor;
using DataEntryFramework4;
using uwac;

public partial class DataEntryForms_editdatadict: OboutInc.oboutAJAXPage  //System.Web.UI.Page
{

	protected void Page_Init(object sender, EventArgs e)
	{
		Master.DDL_Master_SelectStudyID.SelectedIndexChanged += new EventHandler(Master_Study_Changed);
	}

	//If the master page default study is changed, update the Measure DDL
	protected void Master_Study_Changed(object sender, EventArgs e)
	{
		LoadMeasures();
		Grid1.Visible = false;
		panel1.Visible = false;
	}


	protected void Page_Load(object sender, EventArgs e)
	{

		string mid = Request.QueryString["mid"];

		if (!IsPostBack)
		{
			LoadMeasures();
		}

		if(mid != null)
		{
			ddlMeas.SelectedValue = mid;
		}

	}


	protected void ddlMeas_SelectedIndexChanged(object sender, EventArgs e)
	{
		//LoadFields(ddlMeas.SelectedValue);
		Grid1.Visible = false;
		panel1.Visible = false;
	}



	protected void LoadMeasures()
	{

		SQL_utils sql = new SQL_utils("backend");

		DataTable dt = sql.DataTable_from_SQLstring("select measureID, measname from tblMeasure where measureID in " +
			" (select measureID from tblstudymeas where studyID = " + Master.Master_studyID.ToString() + ") order by measname ");

		ddlMeas.DataSource = dt;
		ddlMeas.DataBind();
		sql.Close();
	}


	//protected void LoadFields_for_layout(string str_measureID)
	//{

	//    SQL_utils sql = new SQL_utils();

	//    DataTable dt = sql.DataTable_from_SQLstring("exec spDEF_AutoLayout " + str_measureID);

	//    BuildTables(dt);
	//    sql.Close();
	//    panel1.Visible = true;
		
	//}






	protected void LoadFields(string str_measureID)
	{
		SQL_utils sql = new SQL_utils();

		string orderby_clause = "";

		switch (rblSort.SelectedValue.ToString())
		{

			case "Position":
				orderby_clause = "order by ord_pos, fldname";
				break;
			case "FieldName":
				orderby_clause = "order by fldname ";
				break;
			case "FieldNameREV":
				orderby_clause = "order by reverse(fldname), ord_pos ";
				break;
			case "Label":
				orderby_clause = "order by fieldlabel ";
				break;
			case "LabelREV":
				orderby_clause = "order by reverse(fieldlabel), ord_pos ";
				break;
			case "InAnalysis DESC, Position":
				orderby_clause = "order by a.InAnalysis DESC, ord_pos ";
				break;
			case "InAnalysis DESC, FieldName":
				orderby_clause = "order by a.InAnalysis DESC, fldname ";
				break;
		}

									//        <asp:ListItem Text="*No Filter*" Value="None" Selected="True" ></asp:ListItem>
									//<asp:ListItem Text="InAnalysis > 1" Value="InAnalysis>1"  ></asp:ListItem>
									//<asp:ListItem Text="With a Label" Value="WithLabel"  ></asp:ListItem>
									//<asp:ListItem Text="With No Label" Value="NoLabel"  ></asp:ListItem>


		string str_where2 = "";
		switch (rblFilterBy.SelectedValue.ToString())
		{

			case "None":
				str_where2 = "";
				break;
			case "InAnalysis>0":
				str_where2 = " and a.InAnalysis > 0 ";
				break;
			case "NoLabel":
				orderby_clause = " and (fieldlabel is null or fieldlabel = '') ";
				break;
			case "WithLabel":
				orderby_clause = " and (fieldlabel is not null ) ";
				break;
			case "WithColor":
				orderby_clause = " and (a.InAnalysis > 0  OR a.fldtypepk>1 ) ";
				break;
			case "NoColor":
				orderby_clause = " and (a.InAnalysis = 0  and  a.fldtypepk=1 ) ";
				break;
			case "RelItems":
				orderby_clause = " and (relitem is not null ) ";
				break;

		}



		
		//Fields
		string fldstring = "select fldpk, ord_pos, fldname " +
			" , fieldlabel, aspxfieldlabeltext, a.fldtypepk, a.fldtype_backcolor, a.fieldvaluesetID, ValueLabels " +
			" , missval, minval, maxval, validlist, regex, regexdescription, a.InAnalysis, InAnalysis_color, RelItem, RelAgreeThreshold " +
			" from def.vwfld a " + 
			" join def.fld_type b ON a.fldtypepk=b.fldtypepk " + 
			" left join vwValueSets_with_Items2 d ON a.fieldvaluesetID = d.fieldvaluesetID " +
			" left join def.Fld_InAnalysis e ON a.InAnalysis =  e.InAnalysis" +
			" where  measureID = " + str_measureID + str_where2 + 
			" and fldname not in ('personID','id','studymeasID','indexnum','verified','created','createdBy','updated','updatedBy','scored','scoredBy') " +
			" and  ( a.fieldcodeID<>10 or a.fieldcodeID is null) " +
			orderby_clause;

		DataTable dt_fields = sql.DataTable_from_SQLstring(fldstring);


		Grid1.DataSource = dt_fields;
		Grid1.DataBind();
		Grid1.Visible = true;


		DataTable dt_fldtype = sql.DataTable_from_SQLstring("select fldtypepk, fldtype, fldtype_backcolor from def.Fld_type order by fldtypepk");
		gvFldtype.DataSource = dt_fldtype;
		gvFldtype.DataBind();

		DataTable dt_InAnalysis = sql.DataTable_from_SQLstring("select InAnalysis, InAnalysis_Desc, InAnalysis_color from def.Fld_InAnalysis order by 1");
		gvInAnalysis.DataSource = dt_InAnalysis;
		gvInAnalysis.DataBind();


		lblFldtype.Visible = true;
		lblInAnalysis.Visible = true;

		sql.Close();

	}

	protected void LoadFldtype_legend()
	{
		SQL_utils sql = new SQL_utils();
		DataTable dt_fldtype = sql.DataTable_from_SQLstring("select fldtypepk, fldtype, fldtype_backcolor from def.Fld_type order by fldtypepk");

		gvFldtype.DataSource = dt_fldtype;
		gvFldtype.DataBind();


		sql.Close();
	}



	// Edit Field Metadata
	public struct Myfield
	{
		public string fldpk;
		public string fldtypepk;


		public string fieldlabel;
		public string fieldvaluesetID;
		public string missval;
		public string minval;
		public string maxval;
		public string regex;
		public string regexdesc;
		public string validlist;
		public string InAnalysis;
		public string RelItem;
		public string RelAgreeThreshold;
	}


	[WebMethod]
	public static void UpdateField(Myfield field)
	{


		SQL_utils sql = new SQL_utils();

		string fldpk = field.fldpk;

		string fldtypepk = field.fldtypepk;
		string fieldlabel = field.fieldlabel;
		string fieldvaluesetID = field.fieldvaluesetID;

		
		string missval = field.missval;
		string minval = field.minval;
		string maxval = field.maxval;
		string regex = field.regex;
		string regexdesc = field.regexdesc;
		string validlist = field.validlist;
		string InAnalysis = field.InAnalysis;
		string RelItem = field.RelItem;
		string RelAgreeThreshold = field.RelAgreeThreshold;



		List<SqlParameter> ps = new List<SqlParameter>();

		ps.Add(sql.CreateParam("fldpk", fldpk, "int"));
		ps.Add(sql.CreateParam("fldtypepk", fldtypepk, "int"));
		ps.Add(sql.CreateParam("fieldlabel", fieldlabel, "text"));

		ps.Add(sql.CreateParam("missval", missval, "text"));
		ps.Add(sql.CreateParam("minval", minval, "int"));
		ps.Add(sql.CreateParam("maxval", maxval, "int"));
		ps.Add(sql.CreateParam("regex", regex, "text"));
		ps.Add(sql.CreateParam("regexdesc", regexdesc, "text"));
		ps.Add(sql.CreateParam("validlist", validlist, "text"));
		ps.Add(sql.CreateParam("InAnalysis", InAnalysis, "int"));

		ps.Add(sql.CreateParam("RelItem" , RelItem, "int"));
		ps.Add(sql.CreateParam("RelAgreeThreshold", RelAgreeThreshold, "text"));



		if (fieldvaluesetID == "")
		{
			ps.Add(sql.CreateParam("fieldvaluesetID", "-999", "int"));            
		}
		else
		{
			ps.Add(sql.CreateParam("fieldvaluesetID", fieldvaluesetID, "int"));
		}

		sql.NonQuery_from_ProcName("def.spEdit_Fld2", ps);

		sql.Close();
	}
 



	protected void btnCommand(object sender, CommandEventArgs e)
	{
		if(e.CommandName=="LoadFields")
		{

			LoadFields(ddlMeas.SelectedValue.ToString());
		}


	}




	protected void Grid1_RowDataBound(object sender, GridRowEventArgs e)
	{
		if(e.Row.RowType == GridRowType.DataRow)
		{
			string fldtype_backcolor = Convert.ToString(DataBinder.Eval(e.Row.DataItem, "fldtype_backcolor"));
			if (fldtype_backcolor != "White") e.Row.Cells[3].BackColor = Color.FromName(fldtype_backcolor);

			string InAnalysis_color = Convert.ToString(DataBinder.Eval(e.Row.DataItem, "InAnalysis_color"));
			if (InAnalysis_color != "White") e.Row.Cells[5].BackColor = Color.FromName(InAnalysis_color);

		}
	}
	protected void gvFldtype_RowDataBound(object sender, GridViewRowEventArgs e)
	{
		if (e.Row.RowType == DataControlRowType.DataRow)
		{

			string fldtype_backcolor = Convert.ToString(DataBinder.Eval(e.Row.DataItem, "fldtype_backcolor"));

			e.Row.Cells[0].BackColor = Color.FromName(fldtype_backcolor);
			e.Row.Cells[1].BackColor = Color.FromName(fldtype_backcolor);
			e.Row.Cells[2].Visible = false;

		}
		else 		if (e.Row.RowType == DataControlRowType.Header)
		{
			e.Row.Cells[2].Visible = false;
		}

	}

	protected void gvInAnalysis_RowDataBound(object sender, GridViewRowEventArgs e)
	{
		if (e.Row.RowType == DataControlRowType.DataRow)
		{

			string inanalysis_color = Convert.ToString(DataBinder.Eval(e.Row.DataItem, "InAnalysis_color"));

			e.Row.Cells[0].BackColor = Color.FromName(inanalysis_color);
			e.Row.Cells[1].BackColor = Color.FromName(inanalysis_color);
			e.Row.Cells[2].Visible = false;

		}
		else if (e.Row.RowType == DataControlRowType.Header)
		{
			e.Row.Cells[2].Visible = false;
		}

	}


}