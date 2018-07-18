using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Data.SqlClient;
using System.Web.Configuration;
using DataEntryFramework4;
using System.ComponentModel;

namespace DataEntryFramework4
{
    public class ValueSetLabel : Label
    {
        private string _fldname = string.Empty;
        private string _separator = "<br>";
        private string _textcolor = "RoyalBlue";

        public string FldName
        {
            get { return _fldname; }
            set { _fldname = value.Trim(); }
        }

        public string Separator
        {
            get { return _separator; }
            set { _separator = value; }
        }

        public string Textcolor
        {
            get { return _textcolor; }
            set { _textcolor = value; }
        }

        private string _databaseTable = string.Empty;

        [Browsable(false)]
        public string DatabaseTable
        {
            get { return _databaseTable; }
            set { _databaseTable = value; }
        }

        protected override void OnLoad(EventArgs e)
        {
            //Need to get DatabaseTable from DataEntryController tag
            //so find it on the page.  
            Control ctl = null;

            Utility.FindControlByTypeRecursive(typeof(DataEntryFramework4.DataEntryController), Page, ref ctl);

            if (ctl == null)
            {
                throw new Exception("Can't find DataEntryController Tag.");
            }
            else
            {
                _databaseTable = ((DataEntryFramework4.DataEntryController)ctl).DatabaseTable;
            }

            //Raise error if either databasetable or fldname are missing
            if (string.IsNullOrEmpty(FldName))
            {
                throw new Exception("Value for the fldname attribute of ValueSetLabel is required.");
            }

            if (string.IsNullOrEmpty(DatabaseTable))
            {
                throw new Exception("The ValueSetLabel control gets the value for DatabaseTable from the DataEntryController tag.  This value appears to be missing.");
            }



            //Set label text to Value set from database
            this.Text = GetValueSet();
            this.ForeColor = System.Drawing.ColorTranslator.FromHtml(Textcolor);


            base.OnLoad(e);
        }

        private string GetValueSet()
        {
            string result = string.Empty;

            try
            {
                using (SqlConnection conn = new SqlConnection(WebConfigurationManager.ConnectionStrings["DATA_CONN_STRING"].ConnectionString))
                {
                    SqlCommand cmd = new SqlCommand();
                    cmd.Connection = conn;
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.CommandText = "def.spGetValueset";
                    cmd.Parameters.AddWithValue("@tblname", DatabaseTable);
                    cmd.Parameters.AddWithValue("@fldname", FldName);

                    conn.Open();

                    SqlDataReader r = cmd.ExecuteReader();

                    while (r.Read())
                    {
                        result += string.Format("{0}={1}{2}", r["FieldValue"], r["FieldValueLabel"], Separator);
                    }
                }
            }
            catch (Exception e)
            {
                result = e.Message;
            }

            return result;
        }
    }
}