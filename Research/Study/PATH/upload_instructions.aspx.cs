using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using uwac;

public partial class Study_PATH_upload_instructions : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        LoadFiles();
    }

    protected void LoadFiles()
    {
        SQL_utils sql = new SQL_utils("backend");


        DataTable dt = sql.DataTable_from_SQLstring("select DocVersID, DocTitle, DocDesc, 'https://uwac.autism.washington.edu/research/webdocs/DocVersID_' " + 
                " + cast(docversID as varchar) + '.xlsx' as openlink " + 
                " from vwWebDocs " + 
                " where EntityTypeID = 9 and EntityID = 2513" );


        gv.DataSource = dt;
        gv.DataBind();

    }
}