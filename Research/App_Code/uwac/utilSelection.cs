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
/// Summary description for utilSelection
/// </summary>
    public class utilSelection
    {
        public utilSelection()
        {
            //
            // TODO: Add constructor logic here
            //
        }

        public static DataTable LoadSubjects_for_Selection(int studyID)
        {
            DataTable dt = LoadSubjects_for_Selection(studyID, 0);
            return dt;
        }

        public static DataTable LoadSubjects_for_Selection(int studyID, int pk)
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




        public  void gvFOOSubjects_RowDataBound(GridView gv, GridViewRowEventArgs e)
        {
            int starting_col = 2;
            int numhiddencols = 0;


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
        }


        public static DataTable DataTable_GetSelectedSubjects(GridView gv, string test)
        {
            DataTable dt = DataTable_GetSelectedSubjects(gv, test, "0");
            return dt;
        }

        public static DataTable DataTable_GetSelectedSubjects(GridView gv, string test, string pk)
        {
            DataTable dt = new DataTable();
            dt.Columns.Add("dataproj_pk", typeof(int));
            dt.Columns.Add("groupID", typeof(int));
            dt.Columns.Add("subjstatusID", typeof(int));


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

        public static DataTable DataTable_GetSelectedMeasures(GridView gv)
        {
            DataTable dt = DataTable_GetSelectedMeasures(gv, "0");
            return dt;
        }

        public static DataTable DataTable_GetSelectedMeasures(GridView gv, string pk)
        {
            DataTable dt = new DataTable();
            dt.Columns.Add("dataproj_pk", typeof(int));
            dt.Columns.Add("studymeasID", typeof(int));

            //Loop though each row of the grid and collect the checked ones into a DataTable
            for (int r = 0; r < gv.Rows.Count; r++)
            {
                for (int c = 1; c < gv.Rows[r].Cells.Count; c++)
                {
                    DataControlFieldCell cell = (DataControlFieldCell)gv.Rows[r].Cells[c];
                    foreach (Control ctl in cell.Controls)
                    {
                        if (ctl.GetType() == typeof(CheckBox))
                        {
                            CheckBox chk = (CheckBox)ctl;
                            if (chk.Checked)
                            {
                                string studymeasID = ctl.ID.ToString().Replace("chk", "");

                                DataRow row = dt.NewRow();
                                row["dataproj_pk"] = int.Parse(pk);
                                row["studymeasID"] = int.Parse(studymeasID);
                                dt.Rows.Add(row);
                            }
                        }
                    }
                }
            }

            return dt;
        }

    }


}