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
using DataEntryFramework3;

namespace DataEntryFramework3
{

    /*
     * Manages functionality for hiding the Save
     * button when a measure has been double entered.
     * 
     * Save button for a double entered measure is only shown when
     * a record with matching DatabaseTable and DatabaseTablePk
     * is inserted into datOverrideEdit table with OverrideCode == 'ALLOW'.
     * 
     */
    public class OverrideEditManager
    {
        public OverrideEditManager(DataEntryController dec)
        {
            _dec = dec;
        }

        private DataEntryController _dec;
        public DataEntryController DEC
        {
            get { return _dec; }
        }


        private bool _initialized = false;

        //values from datOverrideEdit
        private int _overrideEditID = -1;
        public int OverrideEditID
        {
            get { return _overrideEditID; }
        }

        private string _overrideCode = string.Empty;
        public string OverrideCode
        {
            get { return _overrideCode; }
        }

        //Call to determine if current record is editable.
        //
        //The PrimaryKeyVal on the DataEntryController must be set
        //or an error is raised.
        //
        //Called by DataEntryFramework.SetupUI()
        public bool IsEditable()
        {
            if (!_initialized)
            {
                Initialize();
            }

            if (OverrideCode == "ALLOW")
            {
                return true;
            }
            else
            {
                return false;
            }
        }

        //Call after successfully updating record.
        //
        //This resets the OverrideCode from 'ALLOW' to 'CHANGED'
        //
        //Called by DataEntryController.Controller() after any successful
        //save of a double entered measure.
        public void Updated()
        {
            try
            {
                if (!_initialized)
                {
                    Initialize();
                }


                using (SqlConnection conn = new SqlConnection(WebConfigurationManager.ConnectionStrings["DATA_CONN_STRING"].ConnectionString))
                {
                    SqlCommand cmd = new SqlCommand();
                    cmd.Connection = conn;
                    cmd.CommandText = "update	datOverrideEdit " +
                                        "       set OverrideCode = 'CHANGED' " +
                                        "where  OverrideEditID = @OverrideEditID";
                    cmd.Parameters.AddWithValue("@OverrideEditID", OverrideEditID);

                    conn.Open();

                    cmd.ExecuteNonQuery();

                    //set initialize to false to guarantee re-read from database
                    _initialized = false;

                }
            }
            catch (Exception e)
            {
                throw new Exception("Error in OverrideEditManager.Updated: " + e.Message, e);
            }
        }


        //get values from datOverrideEdit for current DatabaseTable, PK
        //Raise an error if required values are missing
        private void Initialize()
        {

            try
            {
                if (string.IsNullOrEmpty(DEC.DatabaseTable))
                {
                    throw new InvalidOperationException("Missing DatabaseTable.");
                }

                if (DEC.PrimaryKeyVal < 0)
                {
                    throw new InvalidOperationException("Missing PrimaryKeyVal.");
                }

                using (SqlConnection conn = new SqlConnection(WebConfigurationManager.ConnectionStrings["DATA_CONN_STRING"].ConnectionString))
                {
                    SqlCommand cmd = new SqlCommand();
                    cmd.Connection = conn;
                    cmd.CommandText = "select	OverrideEditID, " +
                                        "		OverrideCode, " +
                                        "		notes " +
                                        "from	datOverrideEdit " +
                                        "where	DatabaseTable = @DatabaseTable " +
                                        "		and DatabaseTablePK = @DatabaseTablePK ";
                    cmd.Parameters.AddWithValue("@DatabaseTable", DEC.DatabaseTable);
                    cmd.Parameters.AddWithValue("@DatabaseTablePK", DEC.PrimaryKeyVal);

                    conn.Open();

                    SqlDataReader r = cmd.ExecuteReader();

                    while (r.Read())
                    {
                        _overrideEditID = (int)r["OverrideEditID"];
                        _overrideCode = r["OverrideCode"].ToString().Trim();
                    }

                    _initialized = true;
                }

            }
            catch (Exception e)
            {
                throw new Exception("Error in OverrideEditManager.Initialize():" + e.Message, e);
            }
        }
    }
}