using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Text;


namespace uwac
{


    /// <summary>
    /// Summary description for gvSelector
    /// </summary>
    public class gvSelector : GridView
    {
        private DataTable dt;


        public gvSelector(string gvname, int studyID) 
        {

            DataTable dt = LoadSubjects_for_Selection(studyID);
            this.ID = gvname;
            this.RowDataBound += new GridViewRowEventHandler(gvSelector_RowDataBound);
            this.EnableViewState = true;
            this.DataSource = dt;
            this.DataBind();
        }

        public gvSelector(DataTable dt)
        {
            //
            // TODO: Add constructor logic here
            //

            this.RowDataBound += new GridViewRowEventHandler(gvSelector_RowDataBound);
            this.EnableViewState = true;

            this.DataSource = dt;
            this.DataBind();

        }


        private DataTable LoadSubjects_for_Selection(int studyID)
        {
            DataTable dt = LoadSubjects_for_Selection(studyID, 0);
            return dt;
        }

        private DataTable LoadSubjects_for_Selection(int studyID, int pk)
        {
            SQL_utils sql = new SQL_utils();

            string s;

            s = "exec dp.spGroups_with_totals  " + studyID.ToString() + ", " + pk.ToString();

            DataTable dt = sql.DataTable_from_SQLstring(s);

            #region //Group by Group & Subjstatus
            var query = from r in dt.AsEnumerable()
                        let i = new
                        {
                            Group = r.Field<string>("Group"),
                            groupID = r.Field<int>("groupID"),
                            ColumnName = r.Field<string>("subjstatus"),
                            ColumnValue = r.Field<string>("groupID_and_subjstatusID")
                        }
                        group i by new { i.Group, i.groupID } into g
                        select g;


            DataTable dt_group_by_subjstatus = new DataTable();
            dt_group_by_subjstatus.Columns.Add("Group", typeof(string));
            dt_group_by_subjstatus.Columns.Add("groupID", typeof(int));

            foreach (var item in query)
            {
                var newRow = dt_group_by_subjstatus.NewRow();

                // static columns
                newRow["Group"] = item.Key.Group;
                newRow["groupID"] = item.Key.groupID;

                // dynamic columns
                foreach (var c in item)
                {
                    if (!dt_group_by_subjstatus.Columns.Contains(c.ColumnName))
                    {
                        dt_group_by_subjstatus.Columns.Add(new DataColumn(c.ColumnName, typeof(String)));
                    }

                    newRow[c.ColumnName] += c.ColumnValue.ToString() + "$";
                }

                dt_group_by_subjstatus.Rows.Add(newRow);
            }
            #endregion

            sql.Close();

            return dt_group_by_subjstatus;
        }



        protected void gvSelector_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            int starting_col = 2;
            int numhiddencols = 0;

            GridView gv = (GridView)sender;
            

            //HEADER
            if (e.Row.RowType == DataControlRowType.Header)
            {
                //
                //start in the 3rd cell 
                for (int i = starting_col; i < e.Row.Cells.Count; i++)
                {


                    //Add the column header text & checkbox
                    Label lbl = new Label();
                    lbl.Text = e.Row.Cells[i].Text + "<br/>";
                    lbl.Font.Size = 10;
                    lbl.ForeColor = Color.Navy;

                    CheckBox chk = new CheckBox();
                    chk.ID = i.ToString();
                    chk.Text = "";
                    e.Row.Cells[i].Controls.Add(chk);
                    e.Row.Cells[i].Controls.Add(lbl);

                    chk.Attributes.Add("onclick", "javascript:CheckAllColumn('" +
                       ((CheckBox)e.Row.FindControl(i.ToString())).ClientID + "','" + gv.ClientID + "'," + numhiddencols.ToString() + ")");

                }
            }


            //DATA ROWS
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                #region //ROW HEADER (or 1st column)
                CheckBox chkrow = new CheckBox();
                chkrow.Text = " ";
                chkrow.ID = "chkg" + e.Row.Cells[1].Text; //use the measureID
                e.Row.Cells[0].Controls.Add(chkrow);

                chkrow.Attributes.Add("onclick", "javascript:CheckAllRow('" +
                   ((CheckBox)e.Row.FindControl(chkrow.ID)).ClientID + "','" + gv.ClientID + "','" + e.Row.RowIndex.ToString() + "')");


                Label lblrow = new Label();
                lblrow.Text = e.Row.Cells[0].Text;
                lblrow.Font.Size = 10;
                lblrow.Font.Bold = true;
                lblrow.ForeColor = Color.Navy;
                e.Row.Cells[0].Controls.Add(lblrow);
                #endregion


                #region //CELLS
                //start in the 3rd cell, skipping measure and measureID
                //int startcol = 2;
                for (int i = starting_col; i < e.Row.Cells.Count; i++)
                {
                    //If there is some info in the cell then add checkboxes
                    if (e.Row.Cells[i].Text.Contains('$'))
                    {

                        //Create the checkboxes to be added to the cell
                        // ADD A NEW PARAM HERE TO ALTER THE TEXT OF THE CHECKBOX
                        //   - SHOULD THE ID OF THE CHECKBOX SERVE AS THE PARAMETER VALUE???????
                        List<CheckBox> chks = Control_utils.ListOCheckBoxes(e.Row.Cells[i].Text, "chk");  //Pass in the cell contents (csv) and get back a list of checkboxes


                        string[] txt = e.Row.Cells[i].Text.Split('|');
                        string[] txt2 = txt[0].Split('_');



                        //add hiddenfields to hold the values
                        HiddenField hidRowValue = new HiddenField();
                        HiddenField hidColValue = new HiddenField();

                        hidRowValue.ID = "hidrow" + i.ToString();
                        hidColValue.ID = "hidcol" + i.ToString();

                        hidRowValue.Value = txt2[0];
                        hidColValue.Value = txt2[1];
                        e.Row.Cells[i].Controls.Add(hidRowValue);
                        e.Row.Cells[i].Controls.Add(hidColValue);

                        foreach (CheckBox chk in chks)
                        {
                            LiteralControl lit = new LiteralControl(); lit.Text = "<br/>";  //Add a manual break between each checkbox

                            e.Row.Cells[i].Controls.Add(chk);
                            e.Row.Cells[i].Controls.Add(lit);

                            chk.Attributes.Add("onclick", "javascript:Checked('" +
                                ((CheckBox)e.Row.FindControl(chk.ID)).ClientID + "','" + gv.ClientID + "','" + e.Row.RowIndex.ToString() + "','" + i.ToString() + "'," + numhiddencols.ToString() + ")");

                            if (e.Row.Cells[i].Text.EndsWith("1$"))
                            {
                                chk.Checked = true;
                                e.Row.Cells[i].BackColor = Color.Yellow;
                            }

                            chk.Text = chk.Text.Substring(0, chk.Text.Length - 2);
                            //split the text by the ~ to see whether to precheck the box or not

                        }
                    }
                }
                #endregion

            }

            ////Hide the groupID column
            //e.Row.Cells[1].Visible = false;

        }





        public static DataTable DataTable_GetSelectedSubjects(GridView gv)
        {
            DataTable dt = DataTable_GetSelectedSubjects( gv,  "0");
            return dt;
        }

        public static DataTable DataTable_GetSelectedSubjects(GridView gv, string pk)
        {
            DataTable dt = new DataTable();
            dt.Columns.Add("dataproj_pk", typeof(int));
            dt.Columns.Add("groupID", typeof(int));
            dt.Columns.Add("subjstatusID", typeof(int));

            //GridView gv = this;

            //Loop though each row of the grid and collect the checked ones into a SQL where clause for group and subjstatus
            for (int r = 0; r < gv.Rows.Count; r++)
            {
                //start in column 2
                for (int c = 1; c < gv.Rows[r].Cells.Count; c++)
                {
                    int rowval = 0;
                    int colval = 0;
                    int numchecked = 0;
                    DataControlFieldCell cell = (DataControlFieldCell)gv.Rows[r].Cells[c];
                    foreach (Control ctl in cell.Controls)
                    {
                        if (ctl.GetType() == typeof(HiddenField))
                        {
                            HiddenField hid = (HiddenField)ctl;
                            if (ctl.ID.StartsWith("hidrow")) rowval = int.Parse(hid.Value.ToString());
                            if (ctl.ID.StartsWith("hidcol")) colval = int.Parse(hid.Value.ToString());
                        }
                        else if (ctl.GetType() == typeof(CheckBox))
                        {
                            CheckBox chk = (CheckBox)ctl;
                            if (chk.Checked)
                            {
                                numchecked++;
                                //string prefix = (s == "") ? "" : "$";
                                //s += prefix + ctl.ID.ToString().Replace("chk", "");
                            }
                        }
                    }
                    if (numchecked > 0)
                    {
                        //if(((HiddenField)cell.FindControl("hidRowValue")))

                        DataRow row = dt.NewRow();
                        row["dataproj_pk"] = int.Parse(pk);
                        row["groupID"] = rowval;
                        row["subjstatusID"] = colval;
                        //row[]
                        dt.Rows.Add(row);
                    }
                }
            }

            return dt;
        }

        public static string CSVpairs_GetSelectedSubjects(GridView gv)
        {
            DataTable dt = DataTable_GetSelectedSubjects(gv, "0");

            DataView dv = new DataView(dt);
            List<string> s = new List<string>();

            foreach (DataRowView row in dv)
            {
                s.Add(row["groupID"].ToString() + ',' + row["subjstatusID"].ToString());
            }

            string csvpair = String.Join(";", s);

            return csvpair;
        }



    }


}