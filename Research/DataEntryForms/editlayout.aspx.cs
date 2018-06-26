using System;
using System.Collections;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Data;
using System.Data.SqlClient;
using System.Diagnostics;
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
using Obout.Ajax.UI.HTMLEditor.ToolbarButton;
using DataEntryFramework4;
using uwac;




public partial class DataEntryForms_editlayout : OboutInc.oboutAJAXPage  //System.Web.UI.Page
{
	private string qs_measureID;
	private string qs_mode;

	protected void Page_Init(object sender, EventArgs e)
	{
		Master.DDL_Master_SelectStudyID.SelectedIndexChanged += new EventHandler(Master_Study_Changed);


		if (Request.QueryString["measureID"] != null)
		{
			qs_measureID = Request.QueryString["measureID"];
		}
		if (Request.QueryString["mode"] != null)
		{
			qs_mode = Request.QueryString["mode"];
		}

		if (!IsPostBack)
		{
			if (qs_mode == "load" & qs_measureID != null)
			{
				ddlMeas.SelectedValue = qs_measureID;
				
				LoadLayout( qs_measureID);
			}
		}

		//
	}

	//If the master page default study is changed, update the Measure DDL
	protected void Master_Study_Changed(object sender, EventArgs e)
	{
		LoadMeasures();
		Grid1.Visible = false;
		panelDEMainBody.Visible = false;
	}


	protected void Page_Load(object sender, EventArgs e)
	{

		string mid = Request.QueryString["mid"];

		if (!IsPostBack)
		{
			LoadMeasures();
		}
		else
		{
			//ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "EditorResponse", "alert('Submitted:\\n\\n" + Editor.EditPanel.Content.Replace("\"", "\\\"").Replace("\n", "\\n").Replace("\r", "").Replace("'", "\\'") + "');", true);
		}


		//if(rblMode.SelectedValue=="Edit Layout")
		//{
		//    panelLayoutControls.Visible = true;
		//}
		//else
		//{
		//    panelLayoutControls.Visible = false;
		//}

	}


	protected void ddlMeas_SelectedIndexChanged(object sender, EventArgs e)
	{
		//LoadFields(ddlMeas.SelectedValue);
		Grid1.Visible = false;
		panelDEMainBody.Visible = false;

		lnkEnterData.Visible = true;
		lnkEnterData.NavigateUrl = "~/DataEntryForms/enterdata.aspx?mid=" + ddlMeas.SelectedValue.ToString();

	}



	protected void LoadMeasures()
	{

		SQL_utils sql = new SQL_utils("backend");

		DataTable dt = sql.DataTable_from_SQLstring("select -1 measureID, '--select measure--' measname union select measureID, measname from tblMeasure where measureID in " +
			" (select measureID from tblstudymeas where studyID = " + Master.Master_studyID.ToString() + ") order by measname ");

		ddlMeas.DataSource = dt;
		ddlMeas.DataBind();
		sql.Close();
	}

	protected void btnCommand(object sender, CommandEventArgs e)
	{
		if (ddlMeas.SelectedValue.ToString() != "-1")
		{
			//Update metadata with any missing fields


			LoadControls(e.CommandName.ToString(), ddlMeas.SelectedValue.ToString(), e.CommandArgument.ToString());
		}
	}

	
	public void LoadControls(string commandname, string measID, string commandarg)
	{
		SQL_utils sql = new SQL_utils();

		sql.NonQuery_from_SQLstring("exec def.spUTIL_check_for_missing_flds " + ddlMeas.SelectedValue.ToString());

		if (commandname == "LoadLayout")
		{
			
			if (rblMode.SelectedValue == "Edit Layout")
			{
				LoadLayout(ddlMeas.SelectedValue);

				Grid1.Visible = true;
			
			}
			else
			{
				panelDEMainBody.Visible = false;
			}
			LoadFldtype_legend();

			LoadFields(measID);
		}
	  
		else if (commandname == "InsertLayoutDimension")
		{

			List<SqlParameter> ps = new List<SqlParameter>();
			ps.Add(sql.CreateParam("measureID", measID.ToString(), "int"));
			ps.Add(sql.CreateParam("layout_section", hid_layout_section.Value, "int"));
			ps.Add(sql.CreateParam("layout_dim", hid_layout_dim.Value, "text"));
			ps.Add(sql.CreateParam("dim_index", hid_dim_index.Value, "int"));
			ps.Add(sql.CreateParam("beforeafter", commandarg, "text"));


			sql.NonQuery_from_ProcName("def.spIncrement_Layout_Dimension", ps);

			
			ModalPopupExtender.Hide();

			LoadLayout(ddlMeas.SelectedValue);
			panelDEMainBody.Update();


			LoadFields(measID);

			

		}

		else if (commandname == "DeleteLayoutDimension")
		{

			int flag = 0;

			if (flag == 0)
			{

				List<SqlParameter> ps = new List<SqlParameter>();

				ps.Add(sql.CreateParam("measureID", measID.ToString(), "int"));
				ps.Add(sql.CreateParam("layout_section", hid_layout_section.Value, "int"));
				ps.Add(sql.CreateParam("layout_dim", hid_layout_dim.Value, "text"));
				ps.Add(sql.CreateParam("dim_index", hid_dim_index.Value, "int"));

				sql.NonQuery_from_ProcName("def.spDelete_Layout_Dimension", ps);

				sql.Close();
				ModalPopupExtender.Hide();

				LoadLayout(ddlMeas.SelectedValue);
				panelDEMainBody.Update();

			}


		}

			

		else if (commandname == "UpdateWidth")
		{
			//create proc spLayout_Update_Width
			//(@measureID int, @sectionnum int, @rownum int, @colnum int, @width_label int, @width_box int)

			//string txt_sectionnum = poptxt1.Text;
			//string txt_rownum = txtRow.Text;
			//string txt_colnum = txtCol.Text;
			//string txt_width_label = txtWidth_label.Text;
			//string txt_width_box = txtWidth_box.Text;

			int flag = 0;
			//if (string.IsNullOrEmpty(txt_sectionnum)) flag++;
			//if (string.IsNullOrEmpty(txt_rownum)) flag++;
			//if (string.IsNullOrEmpty(txt_colnum)) flag++;
			//if (string.IsNullOrEmpty(txt_width_label) & string.IsNullOrEmpty(txt_width_box)) flag++;


			//if (string.IsNullOrEmpty(txt_width_label)) txt_width_label = "0";
			//if (string.IsNullOrEmpty(txt_width_box)) txt_width_box = "0";


			if (flag == 0)
			{
				List<SqlParameter> ps = new List<SqlParameter>();

				//set to -1 if invalid dimension entered.  A value of -1 in the sproc will retain the entered value and make no change.
				int width_label = ToInt(poptxtWidth_label_WHOLE.Text, -1);
				int width_box = ToInt(poptxtWidth_box_WHOLE.Text, -1);

				ps.Add(sql.CreateParam("measureID", measID.ToString(), "int"));
				ps.Add(sql.CreateParam("layout_section", hid_layout_section.Value, "int"));
				ps.Add(sql.CreateParam("layout_dim", hid_layout_dim.Value, "text"));
				ps.Add(sql.CreateParam("dim_index", hid_dim_index.Value, "int"));
				ps.Add(sql.CreateParam("width_label", width_label.ToString(), "int"));
				ps.Add(sql.CreateParam("width_box", width_box.ToString(), "int"));


				sql.NonQuery_from_ProcName("def.spLayout_Update_Width", ps);

				ModalPopupExtender.Hide();

				LoadLayout(ddlMeas.SelectedValue);
				panelDEMainBody.Update();

			}


		}

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


	protected void LoadFields(string str_measureID)
	{

		SQL_utils sql = new SQL_utils();


		lbl_tblpk.Text = "tblpk: " + sql.StringScalar_from_SQLstring("select cast(tblpk as varchar) tblpk from def.tbl where measureID = " + str_measureID);
		lbl_measureID.Text = "measureID: " + str_measureID;


		string orderby_clause = "";

		switch (rblSort.SelectedValue.ToString())
		{
			case "SectionRowCol":
				orderby_clause = "order by layout_section, layout_row, layout_col, ord_pos";
				break;
			case "SectionColRow":
				orderby_clause = "order by layout_section, layout_col, layout_row, ord_pos";
				break;
			case "Position":
				orderby_clause = "order by ord_pos, fldname";
				break;
			case "FieldName":
				orderby_clause = "order by fldname ";
				break;
			case "FieldNameREV":

				orderby_clause = "order by  udf.dbo.UDF_ReverseString(fldname, 1) ";
				break;
			case "Special fields":
				orderby_clause = "order by (case when fieldcodeID > 0 then 'a' + fldname else 'b' + fldname end) ";
				break;
		}


		if(rblMode.SelectedValue=="Edit Reliability Items" & orderby_clause != "") 
		{
			orderby_clause = orderby_clause.Replace("order by ", "order by relitem desc, ");
		}


		#region  flds with FieldCodeID

		DataTable fldcodes = sql.DataTable_from_SQLstring("select fldname, fieldcode, a.fieldcodeID from def.Fld a " + 
		" join datFieldCode b ON a.FieldCodeID = b.FieldCodeID where tblpk = (Select tblpk from def.Tbl where measureID = " + ddlMeas.SelectedValue.ToString() + ")");

		GridView gv = new GridView();
		gv.DataSource = fldcodes;
		gv.DataBind();

		panelFieldCodes.Controls.Add(gv);


		#endregion




		List<SqlParameter> ps = new List<SqlParameter>();
		ps.Add(sql.CreateParam("measureID", str_measureID, "int"));
		ps.Add(sql.CreateParam("orderby", orderby_clause, "text"));


		DataTable dt_fields = sql.DataTable_from_ProcName("def.spFlds_for_Editing", ps);


		Grid1.DataSource = dt_fields;
		Grid1.DataBind();
		Grid1.Visible = true;
		
		
		
		List<int> cols_to_hide = new List<int>();

		List<int> reliability_cols = new List<int> { 10, 11, 12 };
		List<int> layout_cols = new List<int> {  5, 6, 7, 8, 9 };

		List<string> str_cols_to_show = new List<string> { "fldpk", "ord_pos", "fldname", "fieldlabel", "fieldcodeid", };

		List<string> str_datadict = new List<string> { "inanalysis", "missval", "fieldvaluesetid", "valuelabels", "validlist","minval","maxval" };
		List<string> str_reliability_cols = new List<string> { "fldtypepk", "relitem","relscore","relagreethreshold","inanalysis" };
		List<string> str_layout_cols = new List<string> { "fldtypepk", "showvaluelabels", "aspxfieldlabeltext", "layout_section", "layout_row", "layout_col", "width_label", "width_box" };



		if (rblMode.SelectedValue=="Edit Data Dictionary")
		{
			str_cols_to_show.AddRange(str_datadict);
			//cols_to_hide.AddRange(layout_cols);
			//cols_to_hide.AddRange(reliability_cols);
			Grid1.GroupBy = "";
		}
		else if (rblMode.SelectedValue == "Edit Reliability Items")
		{
			str_cols_to_show.AddRange(str_reliability_cols);
			//cols_to_hide.AddRange(layout_cols);

			Grid1.GroupBy = "";
		}
		else if (rblMode.SelectedValue == "Edit Layout")
		{
			//cols_to_hide.AddRange(reliability_cols);
			str_cols_to_show.AddRange(str_layout_cols);

			if (rblSort.SelectedValue == "Position" | rblSort.SelectedValue == "Field name")
			{
				Grid1.GroupBy = "";
			}
			else
			{
				Grid1.GroupBy = "layout_section";
				Grid1.ShowCollapsedGroups = true;
			}


		}


		int numcols_in_grid = Grid1.Columns.Count;


		for (int c = 0; c < numcols_in_grid; c++)
		{
			string colname = Grid1.Columns[c].DataField.ToString().ToLower();
			if (str_cols_to_show.Contains(colname))
			{
				Grid1.Columns[c].Visible = true;
			}
			else
			{
				Grid1.Columns[c].Visible = false;
			}
		}


		DataTable dt_fldtype = sql.DataTable_from_SQLstring("select fldtypepk, fldtype, fldtype_backcolor from def.Fld_type order by fldtypepk");

		gvFldtype.DataSource = dt_fldtype;
		gvFldtype.DataBind();

		
		sql.Close();

	}

	
	protected void LoadLayout(string measID)
	{

		//GridSections1.Visible = true;
		//LoadSections(measID);
		panelDEMainBody.Visible = true;

		LoadFldtype_legend();

		AutoLayout.LoadFields_for_layout(measID, panelDEMainBody, "Layout", panelDEInsert); //, popupPanel);

		DataEntryController dec = (DataEntryController)this.FindControlRecursive("DataEntryController1");


		if (dec != null)
		{
			dec.FormState = FormStates.EDITING_LAYOUT;
			dec.StudyMeasName = ddlMeas.SelectedItem.Text;
		
	

			foreach (Control ctl in dec.Controls)
			{
				Debug.Write(ctl.ID + "  " + ctl.GetType().ToString());
			}
		}
		//Grid1.Visible = false;

	}







	protected void Grid1_RowDataBound(object sender, GridRowEventArgs e)
	{
		if(e.Row.RowType == GridRowType.DataRow)
		{

			string fldtype_backcolor = Convert.ToString(DataBinder.Eval(e.Row.DataItem, "fldtype_backcolor"));

			if (fldtype_backcolor != "White") e.Row.Cells[3].BackColor = Color.FromName(fldtype_backcolor);

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
	protected void btnCopyColHeader_Click(object sender, EventArgs e)
	{
		int sectionnum2 = 0;
		int.TryParse(txtSectionNum2.Text.ToString(), out sectionnum2 );

		if (sectionnum2 > 0)
		{
			//SQL_utils sql = new SQL_utils();
			//sql.NonQuery_from_SQLstring("exec def.spCopy_ColHeaderText " + ddlMeas.SelectedValue.ToString() + ", " + hidSectionID.Value.ToString() + ", " + sectionnum2.ToString());
			//sql.Close();

		}


	}
	protected void rblMode_SelectedIndexChanged(object sender, EventArgs e)
	{

	}
	protected void GridInsert_InsertCommand(object sender, GridRecordEventArgs e)
	{
		//oboutGrid_utils o = new oboutGrid_utils();

		//Hashtable hash = e.Record;
		//string msg = o.oGrid_InsertData(hash, "Fld", "data", "def", "fldpk", 0);

		//int x = 0;

		AddColumnsToTable();

	}


	protected void AddColumnsToTable()
	{
		int measureID = Convert.ToInt32(ddlMeas.SelectedValue.ToString());

		if(measureID > 0)
		{
			SQL_utils sql = new SQL_utils("data");

			DataTable dt = sql.DataTable_from_SQLstring("select a.*, fielddatatype + (case when fielddatatypelength > 0 then '(' + cast(fielddatatypelength as varchar) + ')' else '' end) as fielddatatype_with_length " + 
				" from def.vwfld a left join information_schema.columns b " +
				" ON a.tblname = b.table_name and a.fldname = b.column_name " +
				" where b.table_name is null and a.tblpk in (select tblpk from def.Tbl where measureID=" + measureID.ToString() + ")");

			foreach(DataRow row in dt.Rows)
			{
				string tblname = row["tblname"].ToString();
				string fldname = row["fldname"].ToString();
				string datatype = row["fielddatatype_with_length"].ToString();


				sql.NonQuery_from_SQLstring("exec def.spAddColumn '" + tblname + "','" + fldname + "','" + datatype  + "'");

			}

			sql.Close();
		}


	}


	protected void btnNewFld_Click(object sender, EventArgs e)
	{
		panelNewFld.Visible = true;
		btnNewFld.Visible = false;
	}
	protected void btnNewFld_submit_Click(object sender, EventArgs e)
	{
		SQL_utils sql = new SQL_utils("data");

		List<SqlParameter> ps = new List<SqlParameter>();
		ps.Add(sql.CreateParam("measureID", ddlMeas.SelectedValue.ToString(), "int"));
		ps.Add(sql.CreateParam("ord_pos", newOrdpos.Text, "float"));
		ps.Add(sql.CreateParam("fldname", newFldname.Text, "text"));
		ps.Add(sql.CreateParam("fielddatatype", newFieldDatatype.SelectedValue, "text"));
		ps.Add(sql.CreateParam("fielddatatypelength", newFieldDatatypelength.Text, "int"));

		sql.NonQuery_from_ProcName("def.Fld_INSERT_from_web", ps);


	}
	protected void btnNewFld_cancel_Click(object sender, EventArgs e)
	{
		//newFieldDatatype.Text = "";
		newFldname.Text = "";
		newOrdpos.Text = "";

		panelNewFld.Visible = false;
		btnNewFld.Visible = true; ;
	}
	protected void newFieldDatatype_SelectedIndexChanged(object sender, EventArgs e)
	{
		if (newFieldDatatype.SelectedValue=="text")
		{
			newFieldDatatypelength.Enabled = true;
		}
		else
		{
			newFieldDatatypelength.Enabled = false;

		}
	}




	protected string GetEditor_UniqueID()
	{
		
		return Editor.UniqueID;
	}

	protected string GetEditor_ClientID()
	{

		return Editor.UniqueID;
	}



	protected void submit_Click(object sender, EventArgs e)
	{
		SQL_utils sql = new SQL_utils();

		string layout_section = hid_layout_section.Value;
		string layout_dim = hid_layout_dim.Value;
		string dim_index = hid_dim_index.Value;


		string sqlcode = "";
		string ctlname = "";

		if(layout_dim == "section")
		{
			sqlcode = "update def.Tbl_Section set sectionheadertext = '" + Editor.Content + "' where tblpk= (select tblpk from def.Tbl where measureID = " +
				ddlMeas.SelectedValue.ToString() + ") and layout_section=" + layout_section;
			ctlname = "section" + layout_section;
		}
		else if (layout_dim == "row")
		{
			sqlcode = "update def.Tbl_SectionRow set rowheadertext = '" + Editor.Content + "' where tblpk= (select tblpk from def.Tbl where measureID = " +
				ddlMeas.SelectedValue.ToString() + ") and layout_section=" + layout_section + " and layout_row=" + dim_index;
			ctlname = "section" + layout_section + "_" + dim_index;
		}
		else if (layout_dim == "col")
		{
			sqlcode = "update def.Tbl_SectionCol set colheadertext = '" + Editor.Content + "' where tblpk= (select tblpk from def.Tbl where measureID = " +
				ddlMeas.SelectedValue.ToString() + ") and layout_section=" + layout_section + " and layout_col=" + dim_index;
			ctlname = "section" + layout_section + "_" + dim_index;
		}

		sql.NonQuery_from_SQLstring(sqlcode);
		sql.Close();



		ModalPopupExtender.Hide();


		LoadLayout(ddlMeas.SelectedValue);
		panelDEMainBody.Update();

	}


	protected void UpdateSingleField(int fldpk, string fldname, int layout_section, int layout_row, int layout_col, string fieldlabel, string aspxfieldlabeltext,
			int fldtypepk, string missval, int width_label, int width_box)
	{

		Hashtable hash = new Hashtable();

		hash.Add("fldpk", fldpk);
		hash.Add("fldname", fldname);
		hash.Add("layout_section", layout_section);
		hash.Add("layout_row", layout_row);
		hash.Add("layout_col", layout_col);
		hash.Add("fieldlabel", fieldlabel);
		hash.Add("aspxfieldlabeltext", aspxfieldlabeltext);
		hash.Add("fldtypepk", fldtypepk);
		hash.Add("missval",missval);
		hash.Add("width_label", width_label);
		hash.Add("width_box", width_box);

		string result = "";
		if(fldpk > 0)
		{
			oboutGrid_utils o = new oboutGrid_utils();

			result = o.oGrid_UpdateData(hash, "Fld","data","def","fldpk");
		}


	}

	public static int ToInt (string x, int default_if_not_int)
	{
		int myint;
		if(Int32.TryParse(x, out myint))
		{
			return myint;
		}
		else        
		{
			return default_if_not_int;
		}
	}


	protected void submit_Click2(object sender, EventArgs e)
	{

		int fldpk = ToInt(hid_pop_fldpk.Value, -1);
		string fldname = hid_pop_fldname.Value;


		int layout_section = ToInt(poptxt1.Text, -1);
		int layout_row = ToInt(poptxt2.Text, -1);
		int layout_col = ToInt(poptxt3.Text, -1);

		string fieldlabel = poptxt4.Text;
		string aspxfieldlabeltext = poptxt5.Text;

		int fldtypepk = ToInt(poptxt6.Text, -1);
		string missval = poptxt7.Text;

		int width_box = ToInt(poptxtWidth_box.Text, 40);
		int width_label = ToInt(poptxtWidth_label.Text, 100);


		if(fldpk > 0)
		{
			UpdateSingleField(fldpk, fldname, layout_section, layout_row, layout_col, fieldlabel, aspxfieldlabeltext, fldtypepk, missval, width_label, width_box);
		}

		ModalPopupExtender2.Hide();

		LoadLayout(ddlMeas.SelectedValue);
		panelDEMainBody.Update();
	}



	// Edit Field Metadata
	public struct Myfield
	{
		public string fldpk;
		public string layout_section;
		public string layout_row;
		public string layout_col;

		public string width_label;
		public string width_box;
		public string fldtypepk;
		public string showValueLabels;


		public string aspxfieldlabeltext;
		public string fieldlabel;
		public string fieldvaluesetID;
		public string inAnalysis;
		public string fieldcodeID;

		public string relitem;
		public string relagreethreshold;

		public string validlist;
		public string minval;
		public string maxval;
	}


	[WebMethod]
	public static void UpdateField(Myfield field)
	{


		SQL_utils sql = new SQL_utils();

		string fldpk = field.fldpk;
		int? layout_section = ToInt(field.layout_section.ToString(), -9876);
		int? layout_row = ToInt(field.layout_row.ToString(), -9876);
		int? layout_col = ToInt(field.layout_col.ToString(), -9876);

		int? width_label = ToInt(field.width_label, -9876);
		int? width_box = ToInt(field.width_box, -9876);
		int fldtypepk = ToInt(field.fldtypepk, 1);
		int showValueLabels = ToInt(field.showValueLabels, 0);

		string aspxfieldlabeltext = field.aspxfieldlabeltext;
		string fieldlabel = field.fieldlabel;
		int fieldvaluesetID = ToInt(field.fieldvaluesetID, -9876);
		int inAnalysis = ToInt(field.inAnalysis, -9876);
		int fieldcodeID = ToInt(field.fieldcodeID, -9876);

		int relitem = ToInt(field.relitem, -9876);
		int relagreethreshold = ToInt(field.relagreethreshold, -9876);

		string validlist = field.validlist;
		int minval = ToInt(field.minval, -9876);
		int maxval = ToInt(field.maxval, -9876);



		//Either the section, row, and col are all > 0 else null
		if (layout_col <= 0 | layout_row <= 0 | layout_section <= 0)
		{
			layout_section = null;
			layout_row = null;
			layout_col = null;
			width_label = null;
			width_box = null;
		}



		List<SqlParameter> ps = new List<SqlParameter>();

		ps.Add(sql.CreateParam("fldpk", fldpk, "int"));
		ps.Add(sql.CreateParam("layout_section", layout_section.ToString(), "int"));
		ps.Add(sql.CreateParam("layout_row", layout_row.ToString(), "int"));
		ps.Add(sql.CreateParam("layout_col", layout_col.ToString(), "int"));

		ps.Add(sql.CreateParam("width_label", width_label.ToString(), "int"));
		ps.Add(sql.CreateParam("width_box", width_box.ToString(), "int"));
		ps.Add(sql.CreateParam("fldtypepk", fldtypepk.ToString(), "int"));
		ps.Add(sql.CreateParam("showValueLabels", showValueLabels.ToString(), "int"));

		ps.Add(sql.CreateParam("aspxfieldlabeltext", aspxfieldlabeltext, "text"));
		ps.Add(sql.CreateParam("fieldlabel", fieldlabel, "text"));
		ps.Add(sql.CreateParam("inAnalysis", inAnalysis.ToString(), "int"));
		ps.Add(sql.CreateParam("fieldvaluesetID", fieldvaluesetID.ToString(), "int"));
		ps.Add(sql.CreateParam("fieldcodeID", fieldcodeID.ToString(), "int"));

		ps.Add(sql.CreateParam("relitem", relitem.ToString(), "int"));
		ps.Add(sql.CreateParam("relagreethreshold", relagreethreshold.ToString(), "int"));

		ps.Add(sql.CreateParam("validlist", validlist, "text"));
		ps.Add(sql.CreateParam("minval", minval.ToString(), "int"));
		ps.Add(sql.CreateParam("maxval", maxval.ToString(), "int"));


		sql.NonQuery_from_ProcName("def.spEdit_Fld", ps);

		sql.Close();
	}

	[WebMethod]
	public static string GetHtml()
	{
		string layout_section = "1";

		string measID = "807";
		SQL_utils sql = new SQL_utils("data");
		string txt = sql.StringScalar_from_SQLstring("select coalesce(sectionheadertext,'') sectionheadertext from def.Tbl_Section where tblpk= " +
			" (select tblpk from def.Tbl where measureID=" + measID + ")  and layout_section=" + layout_section);
		sql.Close();


		return txt;
	}

	//protected void btnEnterData_Click(object sender, EventArgs e)
	//{
	//    string x = Request.Url.ToString();
	//    //string path = Server.MapPath(Request.Url).ToString();

	//    Response.Redirect("~/DataEntryForms/enterdata.aspx?mid=" + ddlMeas.SelectedValue.ToString());


	//}
}