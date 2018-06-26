using System;
using System.Drawing;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using AutismCenterBase.Utilities;

/* TODO:  calculate age field 
 * 1) make face page report for printing
 * 2) make dropdowns for site, service, status
 * 3) include clients redundantly if any requested services match the category
 * 4) have filtered and whole version of report
 * 5) be able to click person in report & see info 
 * 6) save changes should be automatic/safer
 * 7) if archive get reasons by prompting?
 * 8) make dropdown enums for statuses, services
 * 9) keep colors on gridview
 * 10) research header is irrelevant, hide in web.sitemap nodes, make waitlist group, make other menus research group
 * 11) study design has edit buttons in gridview as example 
 * 12) 
 */

public partial class Waitlist_Waitlist_Reports : System.Web.UI.Page
{
    private SqlConnection oConn = new SqlConnection();
    //private SqlConnection oConnData = new SqlConnection();
    private ReadConfig oConfig = new ReadConfig();


    protected void Page_Load(object sender, EventArgs e)
    {

        oConn.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["waitlistConnectionString"].ConnectionString;
        oConn.Open();

        if (!IsPostBack)
        {

            populate_DropDownList1();
            populate_DropDownList2();
            populate_DropDownList3();
            populate_Gridview1();
        }
    }

    protected void GridView1_Sorting(object sender, GridViewSortEventArgs e)
    {
        string sortingDirection = string.Empty;
        if (direction == SortDirection.Ascending)
        {
            direction = SortDirection.Descending;
            sortingDirection = "Desc";
        }
        else
        {
            direction = SortDirection.Ascending;
            sortingDirection = "Asc";
        }
        DataView sortedView = new DataView(populate_Gridview1());
        sortedView.Sort = e.SortExpression + " " + sortingDirection;
        Session["objects"] = sortedView;
        GridView1.DataSource = sortedView;
        GridView1.DataBind();

    }

    public SortDirection direction
    {
        get
        {
            if (ViewState["directionState"] == null)
            {
                ViewState["directionState"] = SortDirection.Ascending;
            }
            return (SortDirection)ViewState["directionState"];
        }
        set
        { ViewState["directionState"] = value; }
    }

    protected void GridView1_OnRowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName != "Edit") return;
        int id = Convert.ToInt32(e.CommandArgument);
        string url = "~/Waitlist/waitlist_edit_2.aspx?ID=" + id.ToString();

        //string script = string.Format("window.open('{0}');", url);

        //Page.ClientScript.RegisterStartupScript(this.GetType(), "newPage" + id.ToString(), script, true);
        //Response.Write(String.Format("window.open('{0}','_blank')", ResolveUrl(url)));
        //ScriptManager.RegisterStartupScript(Page, typeof(Page), "OpenWindow", "window.open('"+ url +"');", true);
        //ScriptManager.RegisterStartupScript(Page, Page.GetType(), "popup", "window.open('" + url + "','_blank')", true);
        Response.Redirect(url);
    }

    protected DataTable populate_Gridview1()
    {
        SqlCommand sqlCmd2 = new SqlCommand();
        sqlCmd2.Connection = oConn;
        sqlCmd2.CommandType = System.Data.CommandType.Text;
        sqlCmd2.CommandText =
        "SELECT DISTINCT * " +
        "FROM [vw_getWaitlistAllSvc]  " +
        "WHERE ( " +
        "([Site] IS NOT NULL)  " +
        "and len([Service]) > 0 and [Service] not like '%---%' " +
        "and [SvcStatus] not like 'Scheduled' and [SvcStatus] not like 'No Longer Interested' and [SvcStatus] not like 'DE Complete'";

        if (DropDownList3.SelectedItem.ToString() != "No Paperwork")
        {
            sqlCmd2.CommandText += "AND ([SvcStatus] NOT LIKE '%No Paperwork%') ";
        }

        if (DropDownList1.SelectedIndex > 0)
        {
            //sqlCmd2.Parameters.Add(new SqlParameter("@Site", DropDownList1.Text));
            sqlCmd2.CommandText += " AND (Site = 'Either' or Site = '" + DropDownList1.SelectedItem + "')";
        }
        if (DropDownList2.SelectedIndex > 0)
        {
            //sqlCmd2.Parameters.Add(new SqlParameter("@Service", DropDownList2.Text));
            sqlCmd2.CommandText += " AND LOWER([Service]) LIKE LOWER('%" + DropDownList2.SelectedValue + "%') ";
        }
        if (DropDownList3.SelectedIndex > 0)
        {
            //sqlCmd2.Parameters.Add(new SqlParameter("@Status", DropDownList3.Text));
            sqlCmd2.CommandText += " AND LOWER(SvcStatus) LIKE LOWER('%" + DropDownList3.SelectedValue + "%') ";
        }

        sqlCmd2.CommandText += ") ORDER BY [Site], [Service], [SvcStatus], City, InfoRtn ";

        lblInfo.Text = sqlCmd2.CommandText;

        DataTable dt2 = new DataTable();
        SqlDataAdapter sqlAdapter2 = new SqlDataAdapter(sqlCmd2);
        sqlAdapter2.Fill(dt2);

        GridView1.DataSource = dt2;
        GridView1.DataBind();

        return dt2;
    }

    protected void populate_DropDownList1()
    {
        SqlCommand sqlCmd2 = new SqlCommand();
        sqlCmd2.Connection = oConn;
        sqlCmd2.CommandType = System.Data.CommandType.Text;

        sqlCmd2.CommandText =

            "select 0 SiteID, '  *All*  ' Site union SELECT * FROM EnumSites ";

        DataTable dt2 = new DataTable();
        SqlDataAdapter sqlAdapter2 = new SqlDataAdapter(sqlCmd2);
        sqlAdapter2.Fill(dt2);

        DropDownList1.DataTextField = "Site";
        DropDownList1.DataValueField = "SiteID";
        DropDownList1.DataSource = dt2;
        DropDownList1.DataBind();
        //DropDownList1.SelectedIndex = index;
    }

    protected void populate_DropDownList2()
    {
        SqlCommand sqlCmd2 = new SqlCommand();
        sqlCmd2.Connection = oConn;
        sqlCmd2.CommandType = System.Data.CommandType.Text;

        sqlCmd2.CommandText =
            "select 0 ServiceTypeID, '  *All*  ' ServiceType, 'xxx' LikeSeed union SELECT * FROM EnumServiceTypes ";

        DataTable dt2 = new DataTable();
        SqlDataAdapter sqlAdapter2 = new SqlDataAdapter(sqlCmd2);
        sqlAdapter2.Fill(dt2);

        DropDownList2.DataTextField = "ServiceType";
        DropDownList2.DataValueField = "LikeSeed";
        DropDownList2.DataSource = dt2;
        DropDownList2.DataBind();
        //DropDownList2.SelectedIndex = index;
    }

    protected void populate_DropDownList3()
    {
        SqlCommand sqlCmd2 = new SqlCommand();
        sqlCmd2.Connection = oConn;
        sqlCmd2.CommandType = System.Data.CommandType.Text;

        sqlCmd2.CommandText =
            "select 0 StatusID, '  *All w/ Paperwork*  ' Status, 'xxx' LikeSeed union SELECT * from EnumStatuses";

        DataTable dt2 = new DataTable();
        SqlDataAdapter sqlAdapter2 = new SqlDataAdapter(sqlCmd2);
        sqlAdapter2.Fill(dt2);

        DropDownList3.DataTextField = "Status";
        DropDownList3.DataValueField = "LikeSeed";
        DropDownList3.DataSource = dt2;
        DropDownList3.DataBind();
        //DropDownList3.SelectedIndex = index;
    }

    protected int getClientID(string LName, string FName)
    {
        int ID = 0;
        SqlCommand sqlCmdID = new SqlCommand();
        SqlDataReader sqlReadID;
        sqlCmdID.Connection = oConn;
        sqlCmdID.CommandType = System.Data.CommandType.Text;

        sqlCmdID.CommandText = "SELECT ClientID FROM Clients WHERE (LName = '" + LName + "' AND FName = '" + FName + "')";

        sqlReadID = sqlCmdID.ExecuteReader();
        if (sqlReadID.Read())
        {
            ID = Convert.ToInt16(sqlReadID[0]);
        }
        sqlReadID.Close();
        return ID;
    }

    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        //#region color code rows
        //if (e.Row.Cells[2].Text.Contains("Eval"))
        //{
        //    e.Row.BackColor = Color.FromName("#FFC0FF");
        //    if (e.Row.Cells[3].Text.Contains("Pre"))
        //    {
        //        e.Row.BackColor = Color.FromName("#FF40FF");
        //    }
        //}
        //if (e.Row.Cells[2].Text.Contains("BEC"))
        //{
        //    e.Row.BackColor = Color.FromName("#FFD088");
        //    if (e.Row.Cells[3].Text.Contains("Pre"))
        //    {
        //        e.Row.BackColor = Color.FromName("#FF8000");
        //    }
        //}
        //if (e.Row.Cells[2].Text.Contains("Pediatric"))
        //{
        //    e.Row.BackColor = Color.FromName("#C0FFC0");
        //    if (e.Row.Cells[3].Text.Contains("Pre"))
        //    {
        //        e.Row.BackColor = Color.FromName("#00FF00");
        //    }
        //}
        //if (e.Row.Cells[2].Text.Contains("SP"))
        //{
        //    e.Row.BackColor = Color.FromName("#FFC0C0");
        //    if (e.Row.Cells[3].Text.Contains("Pre"))
        //    {
        //        e.Row.BackColor = Color.FromName("#FF8080");
        //    }
        //}
        //if (e.Row.Cells[2].Text.Contains("Sleep"))
        //{
        //    e.Row.BackColor = Color.FromName("#C0C0FF");
        //    if (e.Row.Cells[3].Text.Contains("Pre"))
        //    {
        //        e.Row.BackColor = Color.FromName("#4040FF");
        //    }
        //}
        //if (e.Row.Cells[2].Text.Contains("Therapy"))
        //{
        //    e.Row.BackColor = Color.FromName("#D0FFFF");
        //    if (e.Row.Cells[3].Text.Contains("Pre"))
        //    {
        //        e.Row.BackColor = Color.FromName("#00FFFF");
        //    }
        //}
        //if (e.Row.Cells[2].Text.Contains("Social"))
        //{
        //    e.Row.BackColor = Color.FromName("#D0B080");
        //    if (e.Row.Cells[3].Text.Contains("Pre"))
        //    {
        //        e.Row.BackColor = Color.FromName("#b09060");
        //    }
        //}
        //#endregion
    }

    protected void DropDowns_SelectedIndexChanged(object sender, EventArgs e)
    {
        lblInfo.Text = "";
        populate_Gridview1();
    }







}
