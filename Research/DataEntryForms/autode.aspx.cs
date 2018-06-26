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
using DataEntryFramework3;
using uwac;

public partial class DataEntryForms_autode : OboutInc.oboutAJAXPage  //System.Web.UI.Page
{

	protected void Page_Init(object sender, EventArgs e)
	{
		Master.DDL_Master_SelectStudyID.SelectedIndexChanged += new EventHandler(Master_Study_Changed);
	}

	//If the master page default study is changed, update the Measure DDL
	protected void Master_Study_Changed(object sender, EventArgs e)
	{
		LoadMeasures();
		updatepanel_Sections.Visible = false;
		Grid1.Visible = false;
		panel1.Visible = false;
	}


	protected void Page_Load(object sender, EventArgs e)
	{

		if (!IsPostBack)
		{
			LoadMeasures();
		}

	}


	protected void ddlMeas_SelectedIndexChanged(object sender, EventArgs e)
	{
		//LoadFields(ddlMeas.SelectedValue);
		updatepanel_Sections.Visible = false;
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


	protected void LoadFields_for_layout(string str_measureID)
	{

		SQL_utils sql = new SQL_utils();

		DataTable dt = sql.DataTable_from_SQLstring("exec spDEF_AutoLayout " + str_measureID);

		BuildTables(dt);
		sql.Close();
		panel1.Visible = true;
		
	}





	protected void LoadSections(string str_measureID)
	{

		SQL_utils sql = new SQL_utils();

		//Sections
		DataTable dt_sections = GetSectionText(str_measureID);

		GridSections1.DataSource = dt_sections;
		GridSections1.DataBind();

		updatepanel_Sections.Visible = true;

		sql.Close();
	}

	protected void LoadColumns(string sectionID)
	{
		SQL_utils sql = new SQL_utils();

		DataTable dt_columns = sql.DataTable_from_SQLstring("select * from datTable_Section_Column where sectionID = " + sectionID);

		GridColumns.DataSource = dt_columns;
		GridColumns.DataBind();
		GridColumns.Visible = true;

		sql.Close();
	}

	protected void LoadFields(string str_measureID)
	{
		SQL_utils sql = new SQL_utils();

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
				orderby_clause = "order by ord_pos, databasefield";
				break;
			case "FieldName":
				orderby_clause = "order by databasefield ";
				break;
		}


		sql.NonQuery_from_SQLstring("exec spDEF_Delete_Unneeded_Layout_Sections_Columns " + ddlMeas.SelectedValue.ToString());


		//TOFIX
		//Fields
		DataTable dt_fields = sql.DataTable_from_SQLstring("select pk, ord_pos, databasefield, layout_section, layout_row, layout_col " +
			" , width_label, width_box, fieldlabel, aspxfieldlabeltext, isReadOnly, DoubleEntryRequired , fieldvaluesetID " +
			" from datfieldinfo where databasetable = " +
			"(select name from datTable where tableID = (select tableID from datTable_measure where measureID = " + str_measureID + ")) " +
			orderby_clause);


		Grid1.DataSource = dt_fields;
		Grid1.DataBind();
		Grid1.Visible = true;

		sql.Close();

	}


	protected DataTable GetSectionText(string str_measureID)
	{
		SQL_utils sql = new SQL_utils();

		DataTable dt_sectiontext =  sql.DataTable_from_SQLstring("select sectionID, tableID, sectionnum, sectionheadertext" +
			" from datTable_Section where tableID = " +
			"(select tableID from datTable_measure where measureID = " + str_measureID + ") " +
			" order by sectionnum");

		sql.Close();
		return dt_sectiontext;
	}

	

	#region Build the Layout 
	public void BuildTables(DataTable dt)
	{
		string mode = rbl1.SelectedValue.ToString();
		string display_the = rbl2.SelectedValue.ToString();

		if (display_the == "Code") mode = "DE Form";

		if(mode=="DE Form" | mode=="Text")
		{

			//Add the Legend

			Label l = new Label();
			Label l0 = new Label();
			Label l1 = new Label();
			Label l2 = new Label();
			Label l3 = new Label();
			l.Text = "<hr/><br/>Data Entry Form<br/>"; l.Font.Size = 12; l.Font.Bold = true;
			l0.Text = "Key:<br/>"; l0.ForeColor = Color.Black;
			l1.Text = "Entry Field"; l1.ForeColor = Color.Black; l1.BackColor = Color.LightYellow;
			l2.Text = "Calc Field<br/>"; l2.ForeColor = Color.Black; l2.BackColor = Color.SkyBlue;
			l3.Text = "Fld name in red = NOT to be double-entered<br/><br/>"; l3.ForeColor = Color.Red;

			panel1.Controls.Add(l);
			panel1.Controls.Add(l0);
			panel1.Controls.Add(l1);
			panel1.Controls.Add(l2);
			panel1.Controls.Add(l3);


			DataEntryController dec = new DataEntryController();

			//These need to be set to something, but doesn't really impact the
			//page.
			dec.DatabaseTable = "ALL_ADOS1";
			dec.PrimaryKeyField = "ados1_pk";
			
			panel1.Controls.Add(dec);
		}

		var var_numtables = dt.AsEnumerable().Max(row => row.Field<int?>("layout_section"));

		if (var_numtables != null)
		{
			int? numtables = Convert.ToInt16(var_numtables.ToString());


			SQL_utils sql = new SQL_utils();
			DataTable dt_sections = GetSectionText( ddlMeas.SelectedValue.ToString() );

			//var numtables = dt.AsEnumerable().Max(row => row["layout_tbl"]); int
			//numtables = 3;

			if (numtables > 0)
			{
				string code_header = "";
				string code_body = "";
				string code_footer = "";
				string deformname = "";
				string tblname = "";
				string measname = "";
				string pkname = "";

				if (rbl2.SelectedValue == "Code")   //Add the header
				{
					DataTable dt_forminfo = sql.DataTable_from_SQLstring("exec spDEF__GetFormInfo " + ddlMeas.SelectedValue.ToString());

					measname = dt_forminfo.AsEnumerable().Select(f => f.Field<string>("measname")).First();
					tblname = dt_forminfo.AsEnumerable().Select(f => f.Field<string>("tblname")).First();
					deformname = dt_forminfo.AsEnumerable().Select(f => f.Field<string>("deformname")).First();
					pkname = dt_forminfo.AsEnumerable().Select(f => f.Field<string>("pkname")).First();

					if(string.IsNullOrEmpty(deformname))
					{
						deformname = tblname.Replace("ALL_", "");
					}

					code_header =
						"<%@ Register TagPrefix=\"def\" Namespace=\"DataEntryFramework3\" %> " + Environment.NewLine +
						"<%@ Page language=\"c#\" MasterPageFile=\"~/UWAutism.master\"  Title=\"" + deformname + " Data Entry\" " + Environment.NewLine +
						"CodeFile=\"" + measname + ".aspx.cs\" Inherits=\"DataEntryForms_Common_" + deformname + "_" + deformname + "\" Debug=\"true\"%>" + Environment.NewLine +
						"<asp:Content ID=\"Content1\" ContentPlaceHolderID=\"oBodyPlaceHolder\" runat=\"server\">" + Environment.NewLine +
						"<def:dataentrycontroller id=\"DataEntryController1\" runat=\"server\" DatabaseTable=\"" + tblname + "\" PrimaryKeyField=\"" + pkname + "\" ></def:dataentrycontroller>" + Environment.NewLine +
						"<def:datafieldcontrol runat=\"server\" id=\"id\" DatabaseField=\"id\" IsInsertField=\"true\"  IsEntryField=\"true\" IsDoubleEntryField=\"true\" FieldLabelWidth=\"100px\" FieldTextBoxWidth=\"80px\" FieldTextBoxMaxLength=\"15\"></def:datafieldcontrol>" + Environment.NewLine +
						"<def:datafieldcontrol runat=\"server\" id=\"indexnum\" DatabaseField=\"indexnum\" IsInsertField=\"true\" FieldTextBoxTextDefault=\"1\"  IsEntryField=\"true\" IsDoubleEntryField=\"true\" FieldLabelWidth=\"100px\" FieldTextBoxWidth=\"40px\"></def:datafieldcontrol>" + Environment.NewLine +
						"<br/><br/>" + Environment.NewLine;

					Label lbl_header_code = new Label();
					lbl_header_code.Text = code_header;

					panel1.Controls.Add(lbl_header_code);

				}


				//Build the body
				for (int t = 1; t <= numtables; t++)
				{
					// Now create a DataView based on the DataTable.
					// Sort and filter the data.
					DataView view_tbl = dt.DefaultView;
					view_tbl.Sort = "layout_section, layout_row, layout_col";
					view_tbl.RowFilter = "layout_section=" + t.ToString();


					Label t_label = new Label();
					string section_header_text = "";
					DataTable dt_colheader = null;
					int sectionID;

					if (dt_sections != null)
					{
						try
						{
							section_header_text = dt_sections.AsEnumerable().Where(r => r.Field<int>("sectionnum") == t).Select(r => r.Field<string>("sectionheadertext")).First();
							sectionID = dt_sections.AsEnumerable().Where(r => r.Field<int>("sectionnum") == t).Select(r => r.Field<int>("sectionID")).First();
							//Get the column header data
							dt_colheader = sql.DataTable_from_SQLstring("select * from datTable_Section_Column where sectionID=" + sectionID.ToString());

						}
						catch(Exception ex)
						{
							string x = ex.Message;
						}

					}

					
					Table tbl = BuildTable(view_tbl, dt_colheader , mode, display_the);


					tbl.BorderWidth = 2;
					tbl.BorderColor = System.Drawing.ColorTranslator.FromHtml("#9EC0E0"); ;

					if(rbl2.SelectedValue=="Code")
					{
						//Add the section header label.
						// Do not add the section number to the header text
						t_label.Text = section_header_text;
						
						
						StringBuilder sb = new StringBuilder();
						StringWriter tw = new StringWriter(sb);
						HtmlTextWriter hw = new HtmlTextWriter(tw);


						//Render the Section Header
						t_label.RenderControl(hw);
						//Render the Table
						tbl.RenderControl(hw);


						var html = sb.ToString();
 
						Label lbl_code = new Label();
						lbl_code.Text = Server.HtmlEncode(html.ToString());

						panel1.Controls.Add(lbl_code);


						code_body += Server.HtmlEncode(html.ToString());

					}

					else if (rbl2.SelectedValue == "Layout")
					{
						//Add the section and column
						//numbers to the header text
						t_label.Text = "<br/>" + section_header_text + " <span style=\"background-color: #dddddd\">[section " + t.ToString() + "]</span>";

						//Add the section header label
						panel1.Controls.Add(t_label);

						panel1.Controls.Add(tbl);
					}

				}

				if (rbl2.SelectedValue == "Code")   //Add the footer
				{
					code_footer = "<br/><br/> " + Environment.NewLine +
						"<def:datafieldcontrol runat=\"server\" id=\"created\" DatabaseField=\"created\" IsReadOnly=\"true\" RenderReadOnlyAsDiv=\"true\"   FieldLabelWidth=\"100px\"></def:datafieldcontrol>" + Environment.NewLine +
						"<def:datafieldcontrol runat=\"server\" id=\"createdBy\" DatabaseField=\"createdBy\" IsReadOnly=\"true\" RenderReadOnlyAsDiv=\"true\"   FieldLabelWidth=\"100px\" FieldTextBoxWidth=\"250px\" FieldTextBoxMaxLength=\"50\"></def:datafieldcontrol>" + Environment.NewLine +
						"<def:datafieldcontrol runat=\"server\" id=\"updated\" DatabaseField=\"updated\" IsReadOnly=\"true\" RenderReadOnlyAsDiv=\"true\"   FieldLabelWidth=\"100px\"></def:datafieldcontrol>" + Environment.NewLine +
						"<def:datafieldcontrol runat=\"server\" id=\"updatedBy\" DatabaseField=\"updatedBy\" IsReadOnly=\"true\" RenderReadOnlyAsDiv=\"true\"  FieldLabelWidth=\"100px\" FieldTextBoxWidth=\"250px\" FieldTextBoxMaxLength=\"50\"></def:datafieldcontrol>" + Environment.NewLine +
						"<def:datafieldcontrol runat=\"server\" id=\"scored\" DatabaseField=\"scored\" IsReadOnly=\"true\" RenderReadOnlyAsDiv=\"true\"  FieldLabelWidth=\"100px\"></def:datafieldcontrol>" + Environment.NewLine +
						"<def:datafieldcontrol runat=\"server\" id=\"scoredBy\" DatabaseField=\"scoredBy\" IsReadOnly=\"true\" RenderReadOnlyAsDiv=\"true\"   FieldLabelWidth=\"100px\" FieldTextBoxWidth=\"250px\" FieldTextBoxMaxLength=\"50\"></def:datafieldcontrol>" + Environment.NewLine + 
						"</asp:Content>";

					Label lbl_footer_code = new Label();
					lbl_footer_code.Text = code_footer;

					panel1.Controls.Add(lbl_footer_code);


					string code_all = code_header + code_body + code_footer;
					code_all = code_all.Replace("&gt;", ">");
					code_all = code_all.Replace("&lt;", "<");
					code_all = code_all.Replace("&quot;", "\"");

					string code_cs = "using System;" + Environment.NewLine +
									"using System.Collections.Generic;" + Environment.NewLine +
									"using System.Linq;" + Environment.NewLine +
									"using System.Web;" + Environment.NewLine +
									"using System.Web.UI;" + Environment.NewLine +
									"using System.Web.UI.WebControls;" + Environment.NewLine +
									"" + Environment.NewLine +
									"public partial class DataEntryForms_Common_SSP2_SSP2 : System.Web.UI.Page" + Environment.NewLine +
									"{" + Environment.NewLine +
									"    protected void Page_Load(object sender, EventArgs e)" + Environment.NewLine +
									"    {" + Environment.NewLine +
									"" + Environment.NewLine +
									"    }" + Environment.NewLine +
									"}" + Environment.NewLine;

					File.WriteAllText(Server.MapPath("~/App_Data/DEforms/" + deformname + ".aspx.txt"), code_all, Encoding.ASCII);
					File.WriteAllText(Server.MapPath("~/App_Data/DEforms/" + deformname + ".aspx.cs.txt"), code_cs, Encoding.ASCII);
				}

			}
		}

	}



	public Table BuildTable(DataView dv, DataTable dt_colheader, string mode, string display_the)
	{
		Table t = new Table();
		DataTable dt = dv.ToTable();
		var var_numrows = dt.AsEnumerable().Max(row => row.Field<int?>("layout_row"));

		int numrows = 0;
		if (var_numrows != null) numrows = Convert.ToInt32(var_numrows.ToString());


		if (numrows > 0)
		{
			//Build the rows
			for (int r = 0; r <= numrows; r++)
			{
				#region Build Col headers
				if(r==0)
				{
					var var_numcols_max = dt.AsEnumerable().Max(col => col.Field<int?>("layout_col"));

					int numcols_max = 0;
					if (var_numcols_max != null) numcols_max = Convert.ToInt32(var_numcols_max.ToString());

					if (numcols_max > 0)
					{
						TableRow headerrow = new TableRow();
						for (int m=1; m <= numcols_max; m++)
						{
							string col_header_text = ""; 
							if (dt_colheader != null)
							{
								try
								{
									col_header_text = dt_colheader.AsEnumerable().Where(f => f.Field<int>("colnum") == m).Select(f => f.Field<string>("colheadertext")).First();
								}
								catch(Exception ex)
								{
									string x = ex.Message;
								}
							}

							TableCell cell = new TableCell();

							if (rbl2.SelectedValue == "Layout")
							{
								//Include the section number when rendering for
								//layout
								cell.Text = col_header_text + " <span style=\"background-color: #dddddd\">[col " + m.ToString() + "]</span>";
							}
							else
							{
								//Do not include the section number when
								//rendering for code
								cell.Text = col_header_text;
							}
							cell.HorizontalAlign = HorizontalAlign.Right;
							headerrow.Cells.Add(cell);
						}
						t.Rows.Add(headerrow);
					}
				}
				#endregion

				DataTable tbl_row = dv.ToTable();

				DataView view_row = tbl_row.DefaultView;
				view_row.Sort = "layout_row, layout_col";
				view_row.RowFilter = "layout_row=" + r.ToString();


				TableRow row = BuildRow(view_row, mode, display_the);

				t.Rows.Add(row);

			}
		}
		else
		{
			// ???

		}

		return t;

	}



	public TableRow BuildRow(DataView dv, string mode, string display_the)
	{
		TableRow trow = new TableRow();

		DataTable dt = dv.ToTable();

		var var_numcols = dt.AsEnumerable().Max(col => col.Field<int?>("layout_col"));

		int numcols = 0;
		if (var_numcols != null) numcols = Convert.ToInt32(var_numcols.ToString());

		if (numcols > 0)
		{
			for (int c = 1; c <= numcols; c++)
			{
				//TableCell cell; if (c == 0) {
				//    cell = new TableCell();
				//    cell.Text = "COL " + c.ToString();
				//}
				//else
				//{
				DataView view_col = dt.DefaultView;
				view_col.Sort = "layout_col";
				view_col.RowFilter = "layout_col=" + c.ToString();
				TableCell cell = BuildCell(view_col, mode, display_the);
				//}

				trow.Cells.Add(cell);
			}
		}


		return trow;
	}



	public TableCell BuildCell(DataView dv, string mode, string display_the)
	{
		TableCell cell = new TableCell();
		DataTable dt = dv.ToTable();

		foreach(DataRow row in dt.Rows)
		{
			int width_label = (row["width_label"].ToString() == "") ? 300 : Convert.ToInt16(row["width_label"].ToString());
			int width_box = (row["width_box"].ToString() == "") ? 120 : Convert.ToInt16(row["width_box"].ToString());


			//HERE!!!! check to see if mode is necessary anymore
			if (mode=="DE Form")
			{
				if (display_the == "Layout")
				{
					DataFieldControl dfc = new DataFieldControl();
					dfc.DatabaseField = row["databasefield"].ToString();
					dfc.FieldLabelText = row["aspxfieldlabeltext"].ToString();
					dfc.FieldLabelWidth = Unit.Pixel(width_label);

					width_box = (width_box < 120) ? 120 : width_box;
					dfc.FieldTextBoxWidth = Unit.Pixel(width_box);

					dfc.FieldTextBoxText = row["databasefield"].ToString();
					dfc.ToolTip = row["databasefield"].ToString();

					cell.Controls.Add(dfc);

					if(row["showValueLabels"].ToString() == "1" )
					{
						ValueSetLabel vs = new ValueSetLabel();
						vs.DatabaseField = row["databasefield"].ToString();
						vs.DatabaseTable = row["databasetable"].ToString();
						cell.Controls.Add(vs);
					}
				}
				else if (display_the=="Code")
				{
					string isReadonly = (row["isReadOnly"].ToString() == "0" | string.IsNullOrEmpty(row["isReadOnly"].ToString())  ) ? " IsEntryField=\"True\"" : " IsReadOnly=\"True\"";
					string isDoubleEntry = (row["DoubleEntryRequired"].ToString() == "0" | string.IsNullOrEmpty(row["isReadOnly"].ToString()) ) ? " IsDoubleEntryField=\"False\"" : " IsDoubleEntryField=\"True\"";

					cell.Text += "<def:datafieldcontrol runat=\"server\" ID=\"" + row["databasefield"].ToString() + "\" DatabaseField=\"" +
							row["databasefield"].ToString() + "\"" + isReadonly + isDoubleEntry + " />";

				}
			}
			else if(mode=="Text")
			{
				if (row["aspxfieldlabeltext"].ToString() != "" & row["aspxfieldlabeltext"].ToString() != " ")
				{
					Label l = new Label();
					l.Text = row["aspxfieldlabeltext"].ToString();
					l.Width = width_label;
					cell.Controls.Add(l);
				}
				TextBox t = new TextBox();
				t.Text = row["databasefield"].ToString();
				t.Font.Size = 8;
				t.Width = (width_box < 120) ? 120 : width_box; 
				t.ToolTip = row["databasefield"].ToString();

				if(row["isReadOnly"].ToString()=="1")
				{
					t.BackColor = Color.SkyBlue;
				}
				else
				{
					t.BackColor = Color.LightYellow;
				}


				if (row["DoubleEntryRequired"].ToString() == "1" | row["DoubleEntryRequired"].ToString() == "")
				{
					t.ForeColor= Color.Black;
				}
				else
				{
					t.ForeColor = Color.Red;
				}



				Literal lit = new Literal();
				lit.Text += "<br/>";
				
				cell.Controls.Add(t);
				cell.Controls.Add(lit);

				if (row["showValueLabels"].ToString() == "1")
				{
					ValueSetLabel vs = new ValueSetLabel();
					vs.DatabaseField = row["databasefield"].ToString();
					vs.DatabaseTable = row["databasetable"].ToString();
					cell.Controls.Add(vs);
				}


				//string lbl = row["aspxfieldlabeltext"].ToString(); string var
				//= row["databasefield"].ToString(); cell.Text += lbl.ToString()
				//+ "....<i><b>" + var + "</b></i><br/>";

			}


		}

		cell.VerticalAlign = VerticalAlign.Top;
		cell.BorderColor = Color.Silver;
		cell.BorderWidth = 1;

		return cell;
	}
	#endregion



	#region Edit Field Metadata
	public struct Myfield
	{
		public string pk;
		public string layout_section;
		public string layout_row;
		public string layout_col;

		public string width_label;
		public string width_box;
		public string isReadOnly;
		public string DoubleEntryRequired;
		public string showValueLabels;


		public string aspxfieldlabeltext;
		public string fieldlabel;
	}


	[WebMethod]
	public static void UpdateField(Myfield field)
	{


		SQL_utils sql = new SQL_utils();

		string pk = field.pk;
		string layout_section = field.layout_section;
		string layout_row = field.layout_row;
		string layout_col = field.layout_col;


		string width_label = field.width_label;
		string width_box = field.width_box;
		string isReadOnly = field.isReadOnly;
		string DoubleEntryRequired = field.DoubleEntryRequired;
		string showValueLabels = field.showValueLabels;

		string aspxfieldlabeltext = field.aspxfieldlabeltext;
		string fieldlabel = field.fieldlabel;


		if (layout_section == "") layout_section = "0";
		if (layout_row == "") layout_row = "0";
		if (layout_col == "") layout_col = "0";
		if (isReadOnly == "") isReadOnly = "0";
		if (DoubleEntryRequired == "") DoubleEntryRequired = "1";

		if (showValueLabels == "") showValueLabels = "0";

		if (width_label == "") width_label = "300";
		if (width_box == "") width_box = "50";


		List<SqlParameter> ps = new List<SqlParameter>();

		ps.Add(sql.CreateParam("pk", pk, "int"));
		ps.Add(sql.CreateParam("layout_section", layout_section, "int"));
		ps.Add(sql.CreateParam("layout_row", layout_row, "int"));
		ps.Add(sql.CreateParam("layout_col", layout_col, "int"));

		ps.Add(sql.CreateParam("width_label", width_label, "int"));
		ps.Add(sql.CreateParam("width_box", width_box, "int"));
		ps.Add(sql.CreateParam("isReadOnly", isReadOnly, "int"));
		ps.Add(sql.CreateParam("DoubleEntryRequired", DoubleEntryRequired, "int"));
		ps.Add(sql.CreateParam("showValueLabels", showValueLabels, "int"));

		ps.Add(sql.CreateParam("aspxfieldlabeltext", aspxfieldlabeltext, "text"));
		ps.Add(sql.CreateParam("fieldlabel", fieldlabel, "text"));

		sql.NonQuery_from_ProcName("spDEF_Edit_FieldInfo", ps);

		sql.Close();
	}
	#endregion 



	protected void btnCommand(object sender, CommandEventArgs e)
	{
		if(e.CommandName=="LoadLayout")
		{
			if (rbl2.SelectedValue == "Layout")
			{
				updatepanel_Sections.Visible = true;
				GridSections1.Visible = true;
				LoadSections(ddlMeas.SelectedValue);
			}

			LoadFields_for_layout(ddlMeas.SelectedValue);
			Grid1.Visible = false;
		}
		else if (e.CommandName == "LoadFields")
		{
			Grid1.Visible = true;

			updatepanel_Sections.Visible = true;
			GridSections1.Visible = true;
			LoadSections(ddlMeas.SelectedValue);

			LoadFields(ddlMeas.SelectedValue);
		}
		else if (e.CommandName == "LoadSections")
		{
			updatepanel_Sections.Visible = true;
			GridSections1.Visible = true;
			LoadSections(ddlMeas.SelectedValue);
		}        
		else if (e.CommandName == "InsertSection")
		{
			SQL_utils sql = new SQL_utils();

			string str_sql = "exec spDEF_Increment_LayoutSection " + ddlMeas.SelectedValue.ToString() + ", " + txtSection.Text;
			sql.NonQuery_from_SQLstring(str_sql);

			LoadFields(ddlMeas.SelectedValue);

			sql.Close();

		}
		else if (e.CommandName == "DeleteSection")
		{
			SQL_utils sql = new SQL_utils();

			//TOFIX
			int n = sql.IntScalar_from_SQLstring("select count(*) from datfieldinfo where databasetable in " + 
					" (select name from datTable where tableID in " +
					" (select tableID from datTable_Measure where measureID = " + ddlMeas.SelectedValue.ToString() + ")) and " + 
					" layout_section = " + txtSection.Text);

			if (n==0)
			{
				string str_sql2 = "exec spDEF_Delete_LayoutSection " + ddlMeas.SelectedValue.ToString() + ", " + txtSection.Text;
				sql.NonQuery_from_SQLstring(str_sql2);
			}
			else{

			}
			//LoadFields(ddlMeas.SelectedValue);

			txtSection.Text = "";

			sql.Close();

		}



		else if (e.CommandName == "EditSectionHeaderText")
		{
			SQL_utils sql = new SQL_utils();

			string txt = sql.StringScalar_from_SQLstring("select coalesce(sectionheadertext,'') sectionheadertext from datTable_Section where sectionID=" + e.CommandArgument.ToString());

			Editor.Content = txt;
			Editor.Visible = true;
			btnSaveSectionText.Visible = true;
			btnSaveColumnText.Visible = false;

			hidSectionID.Value = e.CommandArgument.ToString();
			lblEditor_Contents.Text = "Currently editing: SectionID " + e.CommandArgument.ToString();

			HighlightSectionRow(e.CommandArgument.ToString());

			LoadColumns(e.CommandArgument.ToString());

			sql.Close();
		}
		else if (e.CommandName == "EditColumnHeaderText")
		{
			SQL_utils sql = new SQL_utils();

			string txt = sql.StringScalar_from_SQLstring("select coalesce(colheadertext,'') colheadertext from datTable_Section_Column where columnID=" + e.CommandArgument.ToString());

			Editor.Content = txt;
			Editor.Visible = true;
			btnSaveSectionText.Visible = false;
			btnSaveColumnText.Visible = true;

			HighlightSectionRow(hidSectionID.Value.ToString());
			HighlightColumnRow(e.CommandArgument.ToString());


			hidColumnID.Value = e.CommandArgument.ToString();
			lblEditor_Contents.Text = "Currently editing: ColumnID " + e.CommandArgument.ToString();


			sql.Close();
		}
		else if (e.CommandName=="UpdateWidth")
		{
			//create proc spLayout_Update_Width
			//(@measureID int, @sectionnum int, @rownum int, @colnum int, @width_label int, @width_box int)

			string txt_sectionnum = txtSection.Text;
			string txt_rownum = txtRow.Text;
			string txt_colnum = txtCol.Text;
			string txt_width_label = txtWidth_label.Text;
			string txt_width_box = txtWidth_box.Text;

			int flag = 0;
			if(string.IsNullOrEmpty( txt_sectionnum))  flag++;
			if(string.IsNullOrEmpty( txt_rownum ))  flag++;
			if(string.IsNullOrEmpty( txt_colnum ))  flag++;
			if (string.IsNullOrEmpty(txt_width_label) & string.IsNullOrEmpty(txt_width_box)) flag++;


			if (string.IsNullOrEmpty(txt_width_label)) txt_width_label = "0";
			if (string.IsNullOrEmpty(txt_width_box)) txt_width_box = "0";


			if (flag==0 )
			{
				SQL_utils sql = new SQL_utils();

				List<SqlParameter> ps = new List<SqlParameter>();

				ps.Add(sql.CreateParam("measureID", ddlMeas.SelectedValue.ToString(), "int"));
				ps.Add(sql.CreateParam("sectionnum", txt_sectionnum, "int"));
				ps.Add(sql.CreateParam("rownum", txt_rownum, "int"));
				ps.Add(sql.CreateParam("colnum", txt_colnum, "int"));
				ps.Add(sql.CreateParam("width_label", txt_width_label, "int"));
				ps.Add(sql.CreateParam("width_box", txt_width_box, "int"));

				sql.NonQuery_from_ProcName("spLayout_Update_Width", ps);

				sql.Close();

				LoadFields_for_layout(ddlMeas.SelectedValue.ToString());
			}


		}

	}
	
	

	protected void btnSaveSectionText_Click(object sender, EventArgs e)
	{
		SQL_utils sql = new SQL_utils();

		sql.NonQuery_from_SQLstring("update datTable_Section set sectionheadertext = '" + Editor.Content + "' where sectionID=" + hidSectionID.Value.ToString());
		
		sql.Close();

		Editor.Visible = false;
		btnSaveSectionText.Visible = false;
		btnSaveColumnText.Visible = false;


		LoadSections(ddlMeas.SelectedValue.ToString());
		
		updatepanel_Sections.Update();
		sql.Close();

	}

	protected void btnSaveColumnText_Click(object sender, EventArgs e)
	{
		SQL_utils sql = new SQL_utils();

		sql.NonQuery_from_SQLstring("update datTable_Section_Column set colheadertext = '" + Editor.Content + "' where columnID=" + hidColumnID.Value.ToString());

		sql.Close();

		Editor.Visible = false;
		btnSaveSectionText.Visible = false;
		btnSaveColumnText.Visible = false;

		//LoadSections(ddlMeas.SelectedValue.ToString());

		LoadColumns(hidSectionID.Value.ToString());

		lblEditor_Contents.Text = "";

		updatepanel_Sections.Update();
		sql.Close();

	}


	protected void HighlightSectionRow(string sectionID)
	{

		foreach(GridViewRow row in GridSections1.Rows)
		{
			if (row.RowType == DataControlRowType.DataRow)
			{
				if (row.Cells[0].Text == sectionID)
				{
					row.BackColor = Color.SkyBlue;
				}
				else
				{
					row.BackColor = Color.White;
				}
			}
		}

	}

	protected void HighlightColumnRow(string columnID)
	{

		foreach (GridViewRow row in GridColumns.Rows)
		{
			if (row.RowType == DataControlRowType.DataRow)
			{
				if (row.Cells[0].Text == columnID)
				{
					row.BackColor = Color.SkyBlue;
				}
				else
				{
					row.BackColor = Color.White;
				}

			}
		}

	}
	protected void Grid1_RowDataBound(object sender, GridRowEventArgs e)
	{
		if(e.Row.RowType == GridRowType.DataRow)
		{
			
			string DoubleEntryRequired = Convert.ToString(DataBinder.Eval(e.Row.DataItem, "DoubleEntryRequired"));
			string IsReadOnly = Convert.ToString(DataBinder.Eval(e.Row.DataItem, "IsReadOnly"));


			if (IsReadOnly == "1")
			{
				e.Row.Cells[8].BackColor = Color.SkyBlue;
			}
			if (DoubleEntryRequired == "0")
			{
				e.Row.Cells[9].BackColor = Color.Red;
			}
		}
	}
}