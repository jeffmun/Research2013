using System;
using System.Collections.Generic;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using uwac;

public partial class Tracking_ActionList : System.Web.UI.Page
{

    //raise events on content page for the buttons on master page
    protected void Page_Init(object sender, EventArgs e)
    {
        Master.DDL_Master_SelectStudyID.SelectedIndexChanged += new EventHandler(Master_Study_Changed);
    }

    //If the master page default study is changed, update the Measure DDL
    protected void Master_Study_Changed(object sender, EventArgs e)
    {
        populateListBox();
    }



    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            populateListBox();
        }

        lblStudy.Text = Master.Master_studyname;
    }


    protected void populateListBox()
    {
        SQL_utils sql = new SQL_utils("backend");


        DataTable dt = sql.DataTable_from_SQLstring("select ActionText + ' (' + actiontype + ')' actiontexttype, actiontext, studyactionID from vwstudyaction where studyID = " + Master.Master_studyID.ToString() );

        lstActions.DataSource = dt;
        lstActions.SelectionMode = ListSelectionMode.Multiple;
        lstActions.DataValueField = "studyactionID";
        lstActions.DataTextField = "actiontexttype";

        lstActions.DataBind();
        sql.Close();
    }

    protected DataTable GetActionsTables()
    {
        SQL_utils sql = new SQL_utils("backend");
        DataSet ds = new DataSet();

        List<string> lst_studyactionIDs = new List<string>();

        // GetSelectedIndices
        foreach (int i in lstActions.GetSelectedIndices())
        {
            lst_studyactionIDs.Add( lstActions.Items[i].Value.ToString() );
        }

        string studyactionIDs = string.Join(",", lst_studyactionIDs);


        DataTable dt = sql.DataTable_from_SQLstring("select  LastName, FirstName, a.Sex, ID, subjstatus " + 
        ", coalesce(replace(cast(round(dbo.fnDate_CurrAgeMosAsInt(a.dob, getdate()) / 12.0,1) as varchar), '00000','' ), '') CurrAge_yrs" +
        ", coalesce(replace(cast(round(dbo.fnDate_CurrAgeMosAsInt(datedone, getdate()) / 12.0,1) as varchar), '00000','' ), '') AgeYrs" +
        ", action_actiontext Action, ActionStatus, datedone " + 
        " from vwMasterStatus_A a" + 
        " join tblperson b ON a.PersonID = b.personID" + 
        " where studyactionID in (" + studyactionIDs + ")");

        string[] keepcols = new string[6] {"LastName","FirstName","Sex","ID","subjstatus", "CurrAge_yrs"};
        string[] pivotVals = new string[2] { "ActionStatus", "AgeYrs" };

        DataTable dt_pivot = utilsPivot.Pivot(dt, keepcols, "Action", pivotVals);


        sql.Close();
        return dt_pivot;
    }


    protected void OnDataBound(object sender, EventArgs e)
    {
        GridView gv = (GridView)sender;
        GridViewRow row = new GridViewRow(0, 0, DataControlRowType.Header, DataControlRowState.Normal);

        TableHeaderCell cell = new TableHeaderCell();        
        cell.Text = "";
        cell.ColumnSpan = 6;
        row.Controls.Add(cell);


        //List<string> lst_studyactions = new List<string>();

        // GetSelectedIndices
        foreach (int i in lstActions.GetSelectedIndices())
        {
            //lst_studyactions.Add(lstActions.Items[i].Text.ToString());

            cell = new TableHeaderCell();
            cell.ColumnSpan = 2;
            cell.Text = lstActions.Items[i].Text.ToString();
            row.Controls.Add(cell);
        }

        row.BackColor = Color.Silver;
        gv.HeaderRow.Parent.Controls.AddAt(0, row);
    }



    protected void btnView_Click(object sender, EventArgs e)
    {
        panelViewActions.Controls.Clear();

        DataTable dt = GetActionsTables();

        GridView gv = new GridView();

        gv.DataBound += new EventHandler(OnDataBound);

        gv.DataSource = dt;
        gv.DataBind(); 
        panelViewActions.Controls.Add(gv);


    }


    protected void btnDownload_Click(object sender, EventArgs e)
    {
        DataTable dt = GetActionsTables();

        SpreadsheetGearUtils.SaveDataTableToExcel(dt, "Actions_list_" + Master.Master_studyname);

    }





}