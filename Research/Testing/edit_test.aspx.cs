using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Collections.Generic;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Data.SqlClient;
using AutismCenterBase.Utilities;
using System.IO;
using System.Drawing;
using System.Text;


public partial class Testing_edit_test : System.Web.UI.Page
{

    private SqlConnection oConn = new SqlConnection();

    protected void Page_Load(object sender, EventArgs e)
    {
        oConn.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["uwac_ConnectionString"].ConnectionString;
        oConn.Open();
    }



    //INSERT CLIENT
    protected void btnInsert_Click(object sender, EventArgs e)
    {
        InsertClient(4);
    }

    protected void InsertClient(int personID)
    {

        Dictionary<string, string> dict = new Dictionary<string, string>();
        dict.Add("personID", personID.ToString());

        SqlCommand cmd = edit_uwac_data.sql_insert_from_dict("tClient", dict);
        //lblInfo.Text += output + "<br/>";

        cmd.Connection = oConn;
        cmd.ExecuteNonQuery();
    }


    //UPDATE PERSON
    protected void btnUpdate_Click(object sender, EventArgs e)
    {
        UpdatePerson(4);
    }

    protected void UpdatePerson(int personID)
    {
        //Build the dictionary that contains the fields that are to updated
        Dictionary<string, string> dict = new Dictionary<string, string>();
        dict.Add("ethnID", "3");
        dict.Add("raceID", "5");

        SqlCommand cmd = edit_uwac_data.sql_update_from_dict("tPerson", dict, "personID", personID);
        cmd.Connection = oConn;
        cmd.ExecuteNonQuery();

    }
}