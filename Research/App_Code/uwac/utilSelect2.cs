using System;
using System.Collections;
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
    /// Summary description for utilSelect2
    /// </summary>
    public class utilSelect2
    {
        public utilSelect2()
        {
            //
            // TODO: Add constructor logic here
            //
        }


        public static bool anyselected(HtmlSelect ddl)
        {
            int numselected = 0;
            // GET SELECTED ITEMS
            for (int i = 0; i <= ddl.Items.Count - 1; i++)
            {
                if (ddl.Items[i].Selected)
                    numselected++;
            }

            bool result = false;
            if (numselected > 0) result = true;

            return result;
        }

        public static int numselected(HtmlSelect ddl)
        {
            int numselected = 0;
            // GET SELECTED ITEMS
            for (int i = 0; i <= ddl.Items.Count - 1; i++)
            {
                if (ddl.Items[i].Selected)
                    numselected++;
            }

            return numselected;
        }

        #region GET selected items
        public static List<string> getselected_List(HtmlSelect ddl)
        {
            List<string> result = new List<string>();
            // GET SELECTED ITEMS
            for (int i = 0; i <= ddl.Items.Count - 1; i++)
            {
                if (ddl.Items[i].Selected)
                    result.Add(ddl.Items[i].Text + " | " + ddl.Items[i].Value);
            }

            return result;
        }

        public static List<string> getselected_ListVal(HtmlSelect ddl)
        {
            List<string> result = new List<string>();
            // GET SELECTED ITEMS
            for (int i = 0; i <= ddl.Items.Count - 1; i++)
            {
                if (ddl.Items[i].Selected)
                    result.Add( ddl.Items[i].Value);
            }

            return result;
        }

        public static List<string> getselected_ListTxt(HtmlSelect ddl)
        {
            List<string> result = new List<string>();
            // GET SELECTED ITEMS
            for (int i = 0; i <= ddl.Items.Count - 1; i++)
            {
                if (ddl.Items[i].Selected)
                    result.Add(ddl.Items[i].Text );
            }

            return result;
        }



        public static List<KeyValuePair<string, int>> getselected_KVPList(HtmlSelect ddl)
        {
            var result = new List<KeyValuePair<string, int>>();
            
            // GET SELECTED ITEMS
            for (int i = 0; i <= ddl.Items.Count - 1; i++)
            {
                if (ddl.Items[i].Selected)
                    result.Add(new KeyValuePair<string, int>(ddl.Items[i].Text, Convert.ToInt16(ddl.Items[i].Value)));
            }

            return result;
        }


        public static string getselected_CSVval(HtmlSelect ddl)
        {
            string csv = getselected_CSVval(ddl, ",");
            return csv;
        }


        public static string getselected_CSVtxt(HtmlSelect ddl)
        {
               string csv = getselected_CSVtxt(ddl, ",");
               return csv;
        }



        public static string getselected_CSVval(HtmlSelect ddl, string separator)
        {
            List<string> result = new List<string>();
            // GET SELECTED ITEMS
            for (int i = 0; i <= ddl.Items.Count - 1; i++)
            {
                if (ddl.Items[i].Selected)
                    result.Add(ddl.Items[i].Value);
            }

            string csv = String.Join(separator, result.ToArray());

            return csv;
        }

        public static string getselected_CSVtxt(HtmlSelect ddl, string separator)
        {
            List<string> result = new List<string>();
            // GET SELECTED ITEMS
            for (int i = 0; i <= ddl.Items.Count - 1; i++)
            {
                if (ddl.Items[i].Selected)
                    result.Add(ddl.Items[i].Text);
            }

            string csv = String.Join(separator, result.ToArray());

            return csv;
        }


        public static DataTable getselected_DataTable(HtmlSelect ddl)
        {
            DataTable dt = new DataTable();
            DataColumn val = new DataColumn("val", typeof(int));
            DataColumn txt = new DataColumn("txt", typeof(string));
            dt.Columns.Add(val);
            dt.Columns.Add(txt);
            
            // GET SELECTED ITEMS
            for (int i = 0; i <= ddl.Items.Count - 1; i++)
            {
                DataRow row = dt.NewRow();

                if (ddl.Items[i].Selected)
                {
                    row["val"] = Convert.ToInt32(ddl.Items[i].Value);
                    row["txt"] = ddl.Items[i].Text ;

                    dt.Rows.Add(row);
                }
            }

            if (dt != null) return dt;
            else return null;
        }
        #endregion 


        #region LOAD items

        public static void loaditems(HtmlSelect ddl, DataTable dt, string fld_val, string fld_txt)
        {

            foreach (DataRow row in dt.Rows)
            //        for (int i = 0; i < 10; i++)
            {
                ListItem l = new ListItem(row[fld_txt].ToString(), row[fld_val].ToString());
                ddl.Items.Add(l);
            }

        }

        public static void loaditems(HtmlSelect ddl, DataTable dt, string fld_val, string fld_txt, bool selectall)
        {

            foreach (DataRow row in dt.Rows)
            //        for (int i = 0; i < 10; i++)
            {
                ListItem l = new ListItem(row[fld_txt].ToString(), row[fld_val].ToString());
                ddl.Items.Add(l);
                if (selectall) l.Selected = true;
            }

        }


        public static void loaditems(HtmlSelect ddl, List<string> list)
        {

            foreach (string s in list)
            //        for (int i = 0; i < 10; i++)
            {
                ListItem l = new ListItem(s, s);
                ddl.Items.Add(l);
            }

        }
        #endregion



        #region SELECT items
        public static void selectitems(HtmlSelect ddl, DataTable dt, string fld_val, string fld_txt)
        {

            string[] vals = dt.AsEnumerable().Select(f => f.Field<string>(fld_val)).ToArray();
            string[] txts = dt.AsEnumerable().Select(f => f.Field<string>(fld_txt)).ToArray();


            foreach (ListItem l in ddl.Items)
            {
                if (vals.Contains(l.Value.ToString()) | txts.Contains(l.Text))
                {
                    l.Selected = true;
                }
            }

        }

        public static void selectitems(HtmlSelect ddl, List<string> list)
        {

            foreach (ListItem l in ddl.Items)
            {

                if(list.Contains(l.Text) | list.Contains(l.Value.ToString()))
                {
                        l.Selected=true;
                }
            }

        }



        #endregion




    }


}