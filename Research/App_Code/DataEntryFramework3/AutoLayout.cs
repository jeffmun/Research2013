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
using DataEntryFramework3;
using uwac;



namespace DataEntryFramework3
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
        public static void LoadFields_for_layout(string str_measureID, Panel panel1)
        {

            SQL_utils sql = new SQL_utils();

            DataTable dt = sql.DataTable_from_SQLstring("exec spDEF_AutoLayout " + str_measureID);

            BuildTables(dt, str_measureID, panel1);
            sql.Close();

        }




        public static DataTable GetSectionText(string str_measureID)
        {
            SQL_utils sql = new SQL_utils();

            DataTable dt_sectiontext = sql.DataTable_from_SQLstring("select sectionID, tableID, sectionnum, sectionheadertext" +
                " from datTable_Section where tableID = " +
                "(select tableID from datTable_measure where measureID = " + str_measureID + ") " +
                " order by sectionnum");

            sql.Close();
            return dt_sectiontext;
        }



        #region Build the Layout
        public static void BuildTables(DataTable dt, string str_measureID, Panel panel1)
        {
            string display_the = "Layout";

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
                    //string code_header = ""; string code_body = ""; string
                    //code_footer = ""; string deformname = ""; string tblname =
                    //""; string measname = ""; string pkname = "";

                    //if (display_the == "Code")   //Add the header
                    //{
                    //    DataTable dt_forminfo = sql.DataTable_from_SQLstring("exec spDEF__GetFormInfo " + str_measureID);

                    //    measname = dt_forminfo.AsEnumerable().Select(f => f.Field<string>("measname")).First();
                    //    tblname = dt_forminfo.AsEnumerable().Select(f => f.Field<string>("tblname")).First();
                    //    deformname = dt_forminfo.AsEnumerable().Select(f => f.Field<string>("deformname")).First();
                    //    pkname = dt_forminfo.AsEnumerable().Select(f => f.Field<string>("pkname")).First();

                    //    if (string.IsNullOrEmpty(deformname))
                    //    {
                    //        deformname = tblname.Replace("ALL_", "");
                    //    }

                    //    code_header =
                    //        "<%@ Register TagPrefix=\"def\" Namespace=\"DataEntryFramework3\" %> " + Environment.NewLine +
                    //        "<%@ Page language=\"c#\" MasterPageFile=\"~/UWAutism.master\"  Title=\"" + deformname + " Data Entry\" " + Environment.NewLine +
                    //        "CodeFile=\"" + measname + ".aspx.cs\" Inherits=\"DataEntryForms_Common_" + deformname + "_" + deformname + "\" Debug=\"true\"%>" + Environment.NewLine +
                    //        "<asp:Content ID=\"Content1\" ContentPlaceHolderID=\"oBodyPlaceHolder\" runat=\"server\">" + Environment.NewLine +
                    //        "<link rel=\"stylesheet\" type=\"text/css\" href=\"~/css/dataentryforms.css\" />" + Environment.NewLine +
                    //        "<def:dataentrycontroller id=\"DataEntryController1\" runat=\"server\" DatabaseTable=\"" + tblname + "\" PrimaryKeyField=\"" + pkname + "\" ></def:dataentrycontroller>" + Environment.NewLine +
                    //        "<def:datafieldcontrol runat=\"server\" id=\"id\" DatabaseField=\"id\" IsInsertField=\"true\"  IsEntryField=\"true\" IsDoubleEntryField=\"true\" FieldLabelWidth=\"100px\" FieldTextBoxWidth=\"80px\" FieldTextBoxMaxLength=\"15\"></def:datafieldcontrol>" + Environment.NewLine +
                    //        "<def:datafieldcontrol runat=\"server\" id=\"indexnum\" DatabaseField=\"indexnum\" IsInsertField=\"true\" FieldTextBoxTextDefault=\"1\"  IsEntryField=\"true\" IsDoubleEntryField=\"true\" FieldLabelWidth=\"100px\" FieldTextBoxWidth=\"40px\"></def:datafieldcontrol>" + Environment.NewLine +
                    //        "<br/><br/>" + Environment.NewLine;

                    //    Label lbl_header_code = new Label();
                    //    lbl_header_code.Text = code_header;

                    //    panel1.Controls.Add(lbl_header_code);

                    //}

                    //Add ID and indexnum
                    Literal litID = new Literal();
                    litID.Text = "<br/>";

                    DataFieldControl dfcID = new DataFieldControl();
                    dfcID.DatabaseField = "ID"; dfcID.IsInsertField = true; dfcID.FieldLabelWidth = 100; dfcID.FieldTextBoxWidth = 100; dfcID.FieldTextBoxMaxLength = 15;
                    dfcID.FieldLabelText = "ID"; dfcID.ID = "ID";
                    DataFieldControl dfcIndexnum = new DataFieldControl();
                    dfcIndexnum.DatabaseField = "indexnum"; dfcIndexnum.IsInsertField = true; dfcIndexnum.FieldLabelWidth = 100; dfcIndexnum.FieldTextBoxWidth = 100; dfcIndexnum.FieldTextBoxMaxLength = 15;
                    dfcIndexnum.FieldLabelText = "indexnum"; dfcIndexnum.ID = "indexnum";

                    dfcID.FieldDataType = FieldDataType.TEXT;
                    dfcIndexnum.FieldDataType = FieldDataType.INT;


                    dfcID.ToolTip = "This is the ID field.";
                    dfcIndexnum.ToolTip = "This is the indexnum field.";

                    panel1.Controls.Add(litID);
                    panel1.Controls.Add(dfcID);
                    panel1.Controls.Add(dfcIndexnum);



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

                        if (dt_sections != null)
                        {
                            if (dt_sections.Rows.Count > 0)
                            {
                                section_header_text = dt_sections.AsEnumerable().Where(r => r.Field<int>("sectionnum") == t).Select(r => r.Field<string>("sectionheadertext")).First();
                                int sectionID = dt_sections.AsEnumerable().Where(r => r.Field<int>("sectionnum") == t).Select(r => r.Field<int>("sectionID")).First();


                                //Get the column header data
                                dt_colheader = sql.DataTable_from_SQLstring("select * from datTable_Section_Column where sectionID=" + sectionID.ToString());
                            }
                        }
                        else  // No section text yet
                        {
                            //section_header_text = "[Section " + t.ToString();
                        }



                        Table tbl = BuildTable(view_tbl, dt_colheader, display_the);


                        tbl.BorderWidth = 2;
                        //tbl.BorderColor =
                        //System.Drawing.ColorTranslator.FromHtml("#9EC0E0"); ;
                        tbl.BorderColor = Color.White;


                        //if (display_the == "Layout") {
                        //    //Add the section and column
                        //    //numbers to the header text
                        //    t_label.Text = "<br/>" + section_header_text + " <span style=\"background-color: #dddddd\">[section " + t.ToString() + "]</span>";

                        //}

                        //Add the section header label
                        panel1.Controls.Add(t_label);

                        panel1.Controls.Add(tbl);

                    }

                }
            }

        }



        public static  Table BuildTable(DataView dv, DataTable dt_colheader, string display_the)
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
                            for (int m = 1; m <= numcols_max; m++)
                            {
                                if (dt_colheader != null)
                                {
                                    col_header_text = dt_colheader.AsEnumerable().Where(f => f.Field<int>("colnum") == m).Select(f => f.Field<string>("colheadertext")).First();
                                }
                                else
                                {
                                    //col_header_text = "[col " + m.ToString() +
                                    //"]";
                                }

                                TableCell cell = new TableCell();
                                cell.Text = col_header_text;


                                //if (display_the == "Layout") {
                                //    //Include the section number when rendering
                                //    //for layout
                                //    //cell.Text = col_header_text + " <span style=\"background-color: #dddddd\">[col " + m.ToString() + "]</span>";
                                //}
                                //else
                                //{
                                //    //Do not include the section number when
                                //    //rendering for code
                                //    //cell.Text = col_header_text;
                                //}
                                
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


                    TableRow row = BuildRow(view_row, display_the);

                    t.Rows.Add(row);

                }
            }
            else
            {
                // ???

            }

            return t;

        }



        public static TableRow BuildRow(DataView dv, string display_the)
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
                    TableCell cell = BuildCell(view_col, display_the);
                    //}

                    trow.Cells.Add(cell);
                }
            }


            return trow;
        }



        public static TableCell BuildCell(DataView dv, string display_the)
        {
            TableCell cell = new TableCell();
            DataTable dt = dv.ToTable();

            foreach (DataRow row in dt.Rows)
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
                        dfc.ID = row["databasefield"].ToString();
                        dfc.FieldDataType = fdt;
                        dfc.DatabaseField = row["databasefield"].ToString();
                        dfc.FieldLabelText = row["aspxfieldlabeltext"].ToString();
                        dfc.FieldLabelWidth = Unit.Pixel(width_label);
                        dfc.FieldTextBoxWidth = Unit.Pixel(width_box);
                        dfc.ToolTip = row["databasefield"].ToString();
                        

                        if (row["isReadOnly"].ToString() == "0" | string.IsNullOrEmpty(row["isReadOnly"].ToString()))
                        {
                            dfc.IsEntryField = true;
                        }
                        else
                        {
                            dfc.IsReadOnly = true;
                        }

                        if (row["DoubleEntryRequired"].ToString() == "0" | string.IsNullOrEmpty(row["isReadOnly"].ToString()))
                        {
                            dfc.IsDoubleEntryField = false;
                        }
                        else
                        {
                            dfc.IsDoubleEntryField = true;
                        }


                        dfc.FieldTextBoxText = row["databasefield"].ToString();
                        dfc.ToolTip = row["databasefield"].ToString();

                        cell.Controls.Add(dfc);

                        if (row["showValueLabels"].ToString() == "1")
                        {
                            ValueSetLabel vs = new ValueSetLabel();
                            vs.DatabaseField = row["databasefield"].ToString();
                            vs.DatabaseTable = row["databasetable"].ToString();
                            cell.Controls.Add(vs);
                        }
                //    }

                //}
                //else if (mode == "Text")
                //{
                //    if (row["aspxfieldlabeltext"] != "" & row["aspxfieldlabeltext"] != " ")
                //    {
                //        Label l = new Label();
                //        l.Text = row["aspxfieldlabeltext"].ToString();
                //        l.Width = width_label;
                //        cell.Controls.Add(l);
                //    }
                //    TextBox t = new TextBox();
                //    t.Text = row["databasefield"].ToString();
                //    t.Font.Size = 8;
                //    t.Width = width_box;
                //    t.ToolTip = row["databasefield"].ToString();

                //    if (row["isReadOnly"].ToString() == "1")
                //    {
                //        t.BackColor = Color.SkyBlue;
                //    }
                //    else
                //    {
                //        t.BackColor = Color.LightYellow;
                //    }


                //    if (row["DoubleEntryRequired"].ToString() == "1" | row["DoubleEntryRequired"].ToString() == "")
                //    {
                //        t.ForeColor = Color.Black;
                //    }
                //    else
                //    {
                //        t.ForeColor = Color.Red;
                //    }



                //    Literal lit = new Literal();
                //    lit.Text += "<br/>";

                //    cell.Controls.Add(t);
                //    cell.Controls.Add(lit);

                //    if (row["showValueLabels"].ToString() == "1")
                //    {
                //        ValueSetLabel vs = new ValueSetLabel();
                //        vs.DatabaseField = row["databasefield"].ToString();
                //        vs.DatabaseTable = row["databasetable"].ToString();
                //        cell.Controls.Add(vs);
                //    }


                //    //string lbl = row["aspxfieldlabeltext"].ToString(); string var
                //    //= row["databasefield"].ToString(); cell.Text += lbl.ToString()
                //    //+ "....<i><b>" + var + "</b></i><br/>";

                //}


            }

            cell.VerticalAlign = VerticalAlign.Top;
            cell.BorderColor = Color.White;
            cell.BorderWidth = 1;

            return cell;
        }
        #endregion


    }

}