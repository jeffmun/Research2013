using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


namespace uwac
{
    /// <summary>
    /// Summary description for Control_utils
    /// </summary>

    public static class Control_utils
    {


        public static DataTable GetAllCheckedInRow(GridView gv, int rowidx)
        {
            DataTable dt = new DataTable();
            dt.Columns.Add("value", typeof(string));

            foreach(Control ctl in gv.Rows[rowidx].Controls)
            {
                if(ctl.GetType() == typeof(CheckBox))
                {
                    DataRow row = dt.NewRow();
                    row["value"] = ctl.ID;
                }
            }

            return dt;
        }


        public static string GetAllCheckedInRow_string(GridView gv, int rowidx)
        {
            string s = "";

            for (int c = 1; c < gv.Rows[rowidx].Cells.Count; c++)
            //foreach (DataControlFieldCell cell in gv.Rows[rowidx].Cells)
            {
                DataControlFieldCell cell = (DataControlFieldCell)gv.Rows[rowidx].Cells[c];
                foreach (Control ctl in cell.Controls)
                {
                    if (ctl.GetType() == typeof(CheckBox))
                    {
                        CheckBox chk = (CheckBox)ctl;
                        if (chk.Checked)
                        {
                            string prefix = (s == "") ? "" : "$";
                            s += prefix + ctl.ID.ToString().Replace("chk", "");
                        }
                    }
                }
            }

            return s;
        }


        public static List<CheckBox> ListOCheckBoxes(string names_csv, string prefix)
        {
            List<CheckBox> lst = new List<CheckBox>();

            string[] names = names_csv.Split('$');
            string[] labels = names_csv.Split('$');

            for (int c = 0; c < names.Length - 1; c++)
            {
                string[] txt = names[c].Split('|');
                CheckBox chk = new CheckBox();
                chk.ID = prefix + txt[0];
                //chk.ID = "chk" + c.ToString() + "_" + e.Row.Cells[1].Text ;
                chk.Text = txt[1];
                chk.Attributes["style"] = "font-weight:normal; font-size:xx-small;";
                lst.Add(chk);
            }

            return lst;
        }


        // Example: HtmlForm form = ControlHelper.FindControlRecursive(this.Master, "form1") as HtmlForm;
        /// <summary>
        /// Finds a Control recursively. Note finds the first match and exits
        /// </summary>
        /// <param name="ContainerCtl"></param>
        /// <param name="IdToFind"></param>
        /// <returns></returns>
        public static Control FindControlRecursive(this Control Root, string Id)
        {
            if (Root.ID == Id)
                return Root;

            foreach (Control Ctl in Root.Controls)
            {
                Control FoundCtl = FindControlRecursive(Ctl, Id);
                if (FoundCtl != null)
                    return FoundCtl;
            }

            return null;
        }

        //ModifyControl<TextBox>(this, tb => tb.Text = "test");
        public static void ModifyControl<T>(this Control root, Action<T> action) where T : Control
        {
            if (root is T)
                action((T)root);
            foreach (Control control in root.Controls)
                ModifyControl<T>(control, action);
        }
    }



}