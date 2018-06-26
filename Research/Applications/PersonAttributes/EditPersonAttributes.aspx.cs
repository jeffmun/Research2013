using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Web.Configuration;

public partial class EditPersonAttributes : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        txtLast.Focus();
    }
    
    protected void Page_PreRender(object sender, EventArgs e)
    {

        //hide attributes grid and detail view if nothing selected
        //or if no persons
        pnlAttributes.Visible = (gvPerson.SelectedIndex != -1 && gvPerson.Rows.Count > 0);
    }

    DataSet dsAttributes = new DataSet();

    DataRow[] GetAssignedAttributes(int personID)
    {
        return dsAttributes.Tables[0].Select(string.Format("personid = {0}", personID));
    }


    void RefreshPersonGrid()
    {

        SqlDataAdapter adp = new SqlDataAdapter();

        //DF: 4/12 use main web.config TRACKING_CONN_STRING connection string
        SqlConnection conn = new SqlConnection(WebConfigurationManager.ConnectionStrings["TRACKING_CONN_STRING"].ConnectionString);
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = conn;

        string sql2 = "select paa.personid, paa.personattributeid, pa.Attributename, paa.PersonAttributeText ";
        sql2 += "from tblperson p ";
        sql2 += "join tblPersonAttributeAssignment paa ";
        sql2 += "on paa.personid = p.personid ";
        sql2 += "join tblPersonAttribute pa on pa.personattributeid=paa.personattributeid ";
        sql2 += "where p.lastname like '" + EnsureValid(txtLast.Text) + "%' ";

        cmd.CommandText = sql2;
        adp.SelectCommand = cmd;
        adp.Fill(dsAttributes);



        string sql = "select h.householdid, personid, h.hhname, firstname, lastname,sex ,dob,  r.personrole ";
        sql += "from tblperson p ";
        sql += "join tblPersonRole_lkup r on r.personroleid = p.role ";
        sql += "join tblhousehold h on h.householdid = p.householdid ";
        sql += "where p.lastname like '" + EnsureValid(txtLast.Text) + "%' ";
        sql += "order by lastname";

        sdsSelectPerson.SelectCommand = sql;
        gvPerson.Visible = true;
        gvPerson.DataBind();


    }

    protected void btnFind_Click(object sender, EventArgs e)
    {
        if (IsValid)
        {
            RefreshPersonGrid();

            //unselect
            gvPerson.SelectedIndex = -1;
        }
    }

    private string EnsureValid(string s)
    {
        string validated = s.Replace("'", "''");
        return validated;
    }
    protected void gvPerson_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType ==  DataControlRowType.DataRow )
        {
            int personID = (int)((DataRowView)e.Row.DataItem)["personid"];

            DataRow[] attribs = GetAssignedAttributes(personID);
            //construct attribute string
            string s = string.Empty;
            foreach (DataRow row in attribs)
            {
                string sep = (s == string.Empty) ? "" : ",";
                s += sep + row["AttributeName"].ToString();
            }

            //set label text
            Label lblAttributes = (Label)e.Row.Cells[6].FindControl("lblAttributes");
            lblAttributes.Text = s;
        }

    }


    protected void gvAttributes_RowUpdated(object sender, GridViewUpdatedEventArgs e)
    {
        RefreshPersonGrid();
    }
    protected void gvAttributes_RowDeleted(object sender, GridViewDeletedEventArgs e)
    {
        RefreshPersonGrid();
    }
    protected void dvAddAttribute_ItemInserted(object sender, DetailsViewInsertedEventArgs e)
    {
        RefreshPersonGrid();

    }
}
