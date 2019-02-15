using System;
using System.Collections.Generic;
using System.Drawing;
using System.Data;
using System.Linq;
using System.IO;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DataEntryFramework4;
using uwac;



namespace DataEntryFramework4
{

	/// <summary>
	/// Summary description for AutoLayout
	/// </summary>
	public class AutoLayout
	{

		string str_measureID;
		Panel panel1;

		public AutoLayout()
		{
			//
			// TODO: Add constructor logic here
			//
		}


		//Start here and retrieve the meta data that defines the fields for data
		//entry.  
		public static void LoadFields_for_layout(string str_measureID, UpdatePanel panelDEMainBody, string mode, Panel panelDEInsert) //, Panel popupPanel)
		{

			SQL_utils sql = new SQL_utils();

			DataTable dt = sql.DataTable_from_SQLstring("exec def.spAutoLayout " + str_measureID);

			BuildTables(dt, str_measureID, panelDEMainBody, mode, panelDEInsert);  //, popupPanel);
			sql.Close();

		}

	


		public static DataTable GetSectionText(string str_measureID)
		{
			SQL_utils sql = new SQL_utils();

			DataTable dt_sectiontext = sql.DataTable_from_SQLstring("select  tblpk, layout_section, sectionheadertext" +
				" from def.Tbl_Section where tblpk = " +
				"(select tblpk from def.tbl where measureID = " + str_measureID + ") " +
				" order by layout_section");

			sql.Close();
			return dt_sectiontext;
		}




		#region Build the Layout
		public static void BuildTables(DataTable dt, string str_measureID, UpdatePanel panelDEMainBody, string mode, Panel panelDEInsert) //, Panel popupPanel)
		{

			var var_numtables = dt.AsEnumerable().Max(row => row.Field<int?>("layout_section"));

			if (var_numtables != null)
			{
				int? numtables = Convert.ToInt16(var_numtables.ToString());


				SQL_utils sql = new SQL_utils();
				DataTable dt_sections = GetSectionText(str_measureID);

				//var numtables = dt.AsEnumerable().Max(row => row["layout_tbl"]); int
				//numtables = 3;

				if (numtables > 0)
				{
				   
					//Add ID and indexnum
					Literal litID = new Literal();
					litID.Text = "<br/>";

					DataFieldControl dfcID = new DataFieldControl();
					dfcID.FldName = "ID"; dfcID.IsInsertField = true; dfcID.FieldLabelWidth = 100; dfcID.FieldTextBoxWidth = 100; dfcID.FieldTextBoxMaxLength = 15;
					dfcID.FieldLabelText = "ID"; dfcID.ID = "ID";
					DataFieldControl dfcIndexnum = new DataFieldControl();
					dfcIndexnum.FldName = "indexnum"; dfcIndexnum.IsInsertField = true; dfcIndexnum.FieldLabelWidth = 100; dfcIndexnum.FieldTextBoxWidth = 100; dfcIndexnum.FieldTextBoxMaxLength = 15;
					dfcIndexnum.FieldLabelText = "indexnum"; dfcIndexnum.ID = "indexnum";

					dfcID.FieldDataType = FieldDataType.TEXT;
					dfcIndexnum.FieldDataType = FieldDataType.INT;


					//dfcID.ToolTip = "This is the ID field.";
					//dfcIndexnum.ToolTip = "This is the indexnum field.";

					panelDEInsert.Controls.Add(litID);
					panelDEInsert.Controls.Add(dfcID);
					panelDEInsert.Controls.Add(dfcIndexnum);



					//Build the body
					// start at 1 for now
					for (int t = 1; t <= numtables; t++)
					{
						// Now create a DataView based on the DataTable.
						// Sort and filter the data.
						DataView view_tbl = dt.DefaultView;
						view_tbl.Sort = "layout_section, layout_row, layout_col";
						view_tbl.RowFilter = "layout_section=" + t.ToString();


						Label t_label = new Label();
						LinkButton t_linkbtn = new LinkButton();
						string section_header_text = "";
						DataTable dt_rowheader = null; 
						DataTable dt_colheader = null;

						if (dt_sections != null)
						{
							if (dt_sections.Rows.Count > 0)
							{
								try
								{
									section_header_text = dt_sections.AsEnumerable().Where(r => r.Field<int>("layout_section") == t).Select(r => r.Field<string>("sectionheadertext")).First();
									//int sectionID = dt_sections.AsEnumerable().Where(r => r.Field<int>("sectionnum") == t).Select(r => r.Field<int>("sectionID")).First();
									

									//Get the row header data
									dt_rowheader = sql.DataTable_from_SQLstring("select * from def.Tbl_SectionRow where tblpk=(select tblpk from def.Tbl where measureID=" + str_measureID + ") and layout_section=" + t.ToString());

									//Get the column header data
									dt_colheader = sql.DataTable_from_SQLstring("select * from def.Tbl_SectionCol where tblpk=(select tblpk from def.Tbl where measureID=" + str_measureID + ") and layout_section=" + t.ToString());
								}
								catch (Exception ex)
								{
									string x = ex.Message;
									//no section with this number yet
								}
							}
						}
						else  // No section text yet
						{
							//section_header_text = "[Section " + t.ToString();
						}



						Table tbl = BuildTable(view_tbl, dt_rowheader, dt_colheader, mode, t);


						tbl.BorderWidth = 2;
						//tbl.BorderColor =
						//System.Drawing.ColorTranslator.FromHtml("#9EC0E0"); ;
						tbl.BorderColor = Color.White;
						AjaxControlToolkit.ModalPopupExtender popupext = new AjaxControlToolkit.ModalPopupExtender();

						if (mode == "Layout")
						{
							// This LinkButton is given an onclick event so that it can trigger a modal popup to edit the contents of the section header

							//Add the section and column
							//numbers to the header text
							t_label.Text = "<br/>" + section_header_text + " <span style=\"color: grey; background-color: #eeeeee;\">[sect " + t.ToString() + "]</span>";

							t_linkbtn.Text = "<br/>" + section_header_text + " <span style=\"color: grey; background-color: #eeeeee;\">[sect " + t.ToString() + "]</span>";
							t_linkbtn.Font.Underline = false;
							t_linkbtn.ID = "section" + t.ToString();
							t_linkbtn.ClientIDMode = ClientIDMode.Static;
							t_linkbtn.ForeColor = Color.Black;
							t_linkbtn.Attributes.Add("runat", "server");
							


							//t_linkbtn.ValidateRequestMode = ValidateRequestMode.Disabled;

							panelDEMainBody.ContentTemplateContainer.Controls.Add(t_linkbtn);
							//panelDEMainBody.Controls.Add(t_linkbtn);
							t_linkbtn.OnClientClick = "return ShowModalPopup('" + section_header_text + "'," + t.ToString() + ", -1, 'section')";

							
						}
						else
						{
							t_label.Text = "<br/>" + section_header_text;
							panelDEMainBody.ContentTemplateContainer.Controls.Add(t_label);
							//panelDEMainBody.Controls.Add(t_label);

						}


						panelDEMainBody.ContentTemplateContainer.Controls.Add(tbl);
						//panelDEMainBody.Controls.Add(tbl);

					}

				}
			}

		}

		//static void btnCommand_dynamic(object sender, CommandEventArgs e)
		//{
			
		//    //LoadControls(e.CommandName.ToString(), ddlMeas.SelectedValue.ToString(), e.CommandArgument.ToString());
		//}



		public static Table BuildTable(DataView dv, DataTable dt_rowheader, DataTable dt_colheader, string mode, int layout_section)
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
					if (r == 0)
					{
						var var_numcols_max = dt.AsEnumerable().Max(col => col.Field<int?>("layout_col"));

						int numcols_max = 0;
						if (var_numcols_max != null) numcols_max = Convert.ToInt32(var_numcols_max.ToString());

						if (numcols_max > 0)
						{
							string col_header_text = "";
							TableRow headerrow = new TableRow();

							//Add a blank cell for the row header.
							// For these columns this first cell has no
							// contents.
							TableCell uppercorner = new TableCell();
							uppercorner.Text = "";
							headerrow.Cells.Add(uppercorner);



							for (int m = 1; m <= numcols_max; m++)
							{
								if (dt_colheader != null)
								{
									try{
									col_header_text = dt_colheader.AsEnumerable().Where(f => f.Field<int>("layout_col") == m).Select(f => f.Field<string>("colheadertext")).First();
									}
									catch(Exception ex)
									{
										string x = ex.Message;
										col_header_text = "";
									}
								}
								else
								{
									//col_header_text = "[col " + m.ToString() +
									//"]";
								}

								TableCell cell = new TableCell();


								if (mode == "Layout")
								{
									//Include the section number when rendering
									//for layout
									//cell.Text = col_header_text + "<br/><span style=\"background-color: #dddddd\">[col " + m.ToString() + "]</span>";


									LinkButton l = new LinkButton();
									l.Text = col_header_text + "<br/><span style=\"color:grey; background-color: #eeeeee;\">[c" + m.ToString() + "]</span>";

									l.Font.Underline = false;
									l.ID = "col"  + layout_section.ToString() + "_" + m.ToString();
									l.ForeColor = Color.Black;
									l.Attributes.Add("runat", "server");

									//l.ValidateRequestMode = ValidateRequestMode.Disabled;
									l.OnClientClick = "return ShowModalPopup('" + col_header_text + "'," + layout_section.ToString() + "," + m.ToString() + ",'col')";

									
									//ImageButton b = new ImageButton();
									//b.ImageUrl = "~/images/tinypencil.gif";
									//b.Command += btnCommand_dynamic; 

									//further define the buttons here
									//b.OnClientClick OnCommand="btnCommand" CommandName="EditSectionHeaderText" CommandArgument='<%# Eval("layout_section") %>' />
									cell.Controls.Add(l);
									//cell.Controls.Add(b);
									
								}
								else
								{
									//Do not include the section number when
									//rendering for the data entry form or code
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


					string row_header_text = "";
					if (dt_rowheader != null)
					{
						try
						{
							row_header_text = dt_rowheader.AsEnumerable().Where(f => f.Field<int>("layout_row") == r).Select(f => f.Field<string>("rowheadertext")).First();
						}
						catch (Exception ex)
						{
							string x = ex.Message;
							row_header_text = "";
						}
					}

					TableRow row = BuildRow(view_row, row_header_text, mode, r, layout_section);

					t.Rows.Add(row);

				}
			}
			else
			{
				// ???

			}

			return t;

		}



		public static TableRow BuildRow(DataView dv, string row_header_text, string mode, int rownum, int layout_section)
		{
			TableRow trow = new TableRow();

			DataTable dt = dv.ToTable();

			string row_header_text_with_num = row_header_text;

			var var_numcols = dt.AsEnumerable().Max(col => col.Field<int?>("layout_col"));

			int numcols = 0;
			if (var_numcols != null) numcols = Convert.ToInt32(var_numcols.ToString());

			if (numcols > 0)
			{

				//Add the row header cell
				TableCell rowheadercell = new TableCell();
				
				if(mode=="Layout")
				{
					row_header_text_with_num += " <span style=\"color: grey; background-color: #eeeeee\">[r" + rownum.ToString() + "]</span>";

				}
				rowheadercell.Text = row_header_text;
				rowheadercell.VerticalAlign = VerticalAlign.Top;

				if (mode == "Layout")
				{
					
					LinkButton l = new LinkButton();
					l.Text = row_header_text_with_num;

					l.Font.Underline = false;
					l.ID = "row" + layout_section.ToString() + "_" + rownum.ToString();
					l.ForeColor = Color.Black;
					l.Attributes.Add("runat", "server");

					//l.ValidateRequestMode = ValidateRequestMode.Disabled;
					l.OnClientClick = "return ShowModalPopup('" + row_header_text + "'," + layout_section.ToString() + "," + rownum.ToString() + ",'row')";



					rowheadercell.Controls.Add(l);
					//rowheadercell.Controls.Add(b);
				}


				trow.Cells.Add(rowheadercell);

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
					TableCell cell = BuildCell(view_col, mode);
					//}
					trow.Cells.Add(cell);
				}
			}


			return trow;
		}



		public static TableCell BuildCell(DataView dv, string mode)
		{
			TableCell cell = new TableCell();
			cell.VerticalAlign = VerticalAlign.Top;
			cell.BorderColor = Color.White;
			cell.BorderWidth = 1;

			DataTable dt = dv.ToTable();

			foreach (DataRow row in dt.Rows)
			{
				if (!string.IsNullOrEmpty(row["fldname"].ToString()) )
				{
					int width_label = (row["width_label"].ToString() == "") ? 300 : Convert.ToInt16(row["width_label"].ToString());
					int width_box = (row["width_box"].ToString() == "") ? 50 : Convert.ToInt16(row["width_box"].ToString());


					////HERE!!!! check to see if mode is necessary anymore
					//if (mode == "DE Form")
					//{
					//    if (display_the == "Layout")
					//    {

					FieldDataType fdt = new FieldDataType();

					switch (row["fielddatatype"].ToString())
					{
						case "int":
							fdt = FieldDataType.INT;
							break;
						case "float":
							fdt = FieldDataType.FLOAT;
							break;
						case "nvarchar":
							fdt = FieldDataType.TEXT;
							break;
						case "varchar":
							fdt = FieldDataType.TEXT;
							break;
						case "char":
							fdt = FieldDataType.TEXT;
							break;
						case "date":
							fdt = FieldDataType.DATE;
							break;
						case "datetime":
							fdt = FieldDataType.DATE;
							break;
					}



					DataFieldControl dfc = new DataFieldControl();
					dfc.ID = row["fldname"].ToString();
					dfc.FieldDataType = fdt;
					dfc.FldName = row["fldname"].ToString();
					dfc.FieldLabelText = row["aspxfieldlabeltext"].ToString();
					dfc.FieldLabelWidth = Unit.Pixel(width_label);
					dfc.FieldTextBoxWidth = Unit.Pixel(width_box);



					if (fdt == FieldDataType.DATE) dfc.FormatString = "{0:d}";

					if (row["def_ReadOnly"].ToString() == "0" | string.IsNullOrEmpty(row["def_ReadOnly"].ToString()))
					{
						dfc.IsEntryField = true;
					}
					else
					{
						dfc.IsReadOnly = true;
					}

					if (row["def_DoubleEntryRequired"].ToString() == "0" | string.IsNullOrEmpty(row["def_ReadOnly"].ToString()))
					{
						dfc.IsDoubleEntryField = false;
					}
					else
					{
						dfc.IsDoubleEntryField = true;
					}


					dfc.FieldTextBoxText = row["fldname"].ToString();
					//dfc.ToolTip = row["fieldnameandlabel"].ToString();

					if(mode=="DataEntry")
					{
						TextBox txtbox = (TextBox)dfc.Controls[1];
						txtbox.Enabled = true;
						txtbox.ToolTip = row["fieldnameandlabel"].ToString();
					}

					else if (mode == "Layout")
					{

						TextBox txtbox = (TextBox)dfc.Controls[1];

						//Read-only textboxes are Enabled=false; so that users cannot make changes to them when entering data.
						// However, here we need to enable all fields so that the click event can be processed since we are in editing mode. 
						txtbox.Enabled = true;

						txtbox.BackColor = Color.FromName(row["fldtype_backcolor"].ToString());

						txtbox.ToolTip = row["fieldnameandlabel"].ToString();

						string javascript_text = "javascript:ShowModalPopup2(" + row["fldpk"].ToString() + ",'" + row["fldname"].ToString() +
							"','" + row["fieldlabel"].ToString() + "','" + row["aspxfieldlabeltext"].ToString() +
							"'," + row["layout_section"].ToString() + "," + row["layout_row"].ToString() + "," + row["layout_col"].ToString() +
							"," + row["fldtypepk"].ToString() + ",'" + row["missval"].ToString() + "'" + "," + row["width_label"] + "," + row["width_box"] +
							" );return false;";

						txtbox.Attributes.Add("onclick", javascript_text);

						//dfc.BackColor = Color.FromName(row["fldtype_backcolor"].ToString());
					}



					cell.Controls.Add(dfc);

					if (row["showValueLabels"].ToString() == "1")
					{
						ValueSetLabel vs = new ValueSetLabel();
						vs.FldName = row["fldname"].ToString();
						vs.DatabaseTable = row["tblname"].ToString();
						cell.Controls.Add(vs);
					}


				}


				else
				{
					if (mode == "Layout")
					{
						Literal blankcell = new Literal();
						blankcell.Text = "**empty_cell**";
						cell.Controls.Add(blankcell);
					}
				}

			}


			return cell;
		}
		#endregion


		#region Build the value sets


		#endregion 



	}

}