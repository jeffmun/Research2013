using System;
using System.Collections.Generic;
//using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Text;
using System.Configuration;
using AutismCenterBase.Utilities;
using uwac;


public partial class stats_graph_test : System.Web.UI.Page
{

    /// <summary>
    /// STEPS:
    /// 1. select options
    /// 2. select vars
    /// 3. retrive vars datatable (variable, group, timepoint, mean, sd, n, min, max)
    /// 4. pivot into dt_mean, dt_sd, dt_n
    /// 5. create chart
    /// </summary>

    private SqlConnection oConn = new SqlConnection();
    private SqlConnection oConnData = new SqlConnection();

    private ReadConfig oConfig = new ReadConfig();
    private AutismCenterBase.Security.Login oLogin = new AutismCenterBase.Security.Login();
    

    StringBuilder str = new StringBuilder();
    //Get connection string from web.config
    //SqlConnection conn = new SqlConnection("Data source=SPIDER; Initial catalog=Demo; Integrated security=true");

    //needed for using the DefaultStudyID
    private int _content_studyID;
    private string _content_studyname;
    private bool debugprint = false;

    //raise events on content page for the buttons on master page
    protected void Page_Init(object sender, EventArgs e)
    {
        Master.DDL_Master_SelectStudyID.SelectedIndexChanged += new EventHandler(Master_Study_Changed);
    }


    //If the master page default study is changed, update the Measure DDL
    protected void Master_Study_Changed(object sender, EventArgs e)
    {
        GetCurrentDefaultStudyID();
        populate_ListBoxes();
        populate_DropDowns();
    }


    protected void GetCurrentDefaultStudyID()
    {

        SqlCommand sqlCmd = new System.Data.SqlClient.SqlCommand("exec spSEC_Get_Default_StudyID_for_User", oConn);
        DataTable dt = new DataTable();
        SqlDataAdapter sqlAdapter = new SqlDataAdapter(sqlCmd);
        sqlAdapter.Fill(dt);

        foreach (DataRow row in dt.Rows)
        {
            _content_studyID = Convert.ToInt16(row["defaultstudyID"]);
            _content_studyname = Convert.ToString(row["studyname"]);
        }


        lblINTRO_studyname.Text = "Study: ";
        lblStudyname_ContentPage.Text = _content_studyname;
    }

    
    protected void Page_Load(object sender, EventArgs e)
    {
        GetCurrentDefaultStudyID();

        if (!IsPostBack)
        {
            populate_ListBoxes();
            populate_DropDowns();
        }

    }

    #region ===== Populate ListBoxes =====
    protected void populate_ListBoxes()
    {
        ListBox lstGroup = (ListBox)updatePanel_Selections.ContentTemplateContainer.FindControl("lstGroup");
        ListBox lstSubjStatus = (ListBox)updatePanel_Selections.ContentTemplateContainer.FindControl("lstSubjStatus");
        ListBox lstTimePoints = (ListBox)updatePanel_Selections.ContentTemplateContainer.FindControl("lstTimePoint");
        ListBox lstMeasure = (ListBox)updatePanel_Selections.ContentTemplateContainer.FindControl("lstMeasure");


        string sql1 = "select groupname, groupname + ' (N=' + cast(count(*) as varchar) + ')' as txt from vwMasterStatus_S where studyID=" + _content_studyID.ToString() + " group by groupname ";
        string sql2 = "select subjstatus, subjstatus + ' (N=' + cast(count(*) as varchar) + ')' as txt from vwMasterStatus_S where studyID=" + _content_studyID.ToString() + " group by subjstatus ";
        string sql3 = "select timepoint_text, cast(timepoint as varchar) + '. ' + timepoint_text as txt from tblTimePoint where studyID=" + _content_studyID.ToString() + " group by timepoint, timepoint_text ";
        string sql4 = "select tbl, measname as txt from vwMeasures_with_VARS where studyID=" + _content_studyID.ToString() + "  group by tbl, measname order by measname";

        populate_ListBox(oConn, sql1, lstGroup, "groupname", "txt");
        populate_ListBox(oConn, sql2, lstSubjStatus, "subjstatus", "txt");
        populate_ListBox(oConn, sql3, lstTimePoint, "timepoint_text", "txt");
        populate_ListBox(oConnData, sql4, lstMeasure, "tbl", "txt");


        updatePanel_Selections.Update();
       


    }

    protected void populate_ListBox(SqlConnection con, string sqltext, ListBox lst, string valuefld, string textfld)
    {

        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandType = CommandType.Text;
        cmd.CommandText = sqltext;

        DataTable dt = new DataTable();
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        da.Fill(dt);

        lst.DataSource = dt;
        lst.DataValueField = valuefld;
        lst.DataTextField = textfld;

        lst.DataBind();

        foreach(ListItem i in lst.Items)
        {
            if (i.Text.StartsWith("DQ") | i.Text.StartsWith("NOT") | i.Text.StartsWith("To Be Sched")) i.Selected = false;
            else i.Selected = true;
        }
    }

    protected void populate_VarsToSelectFrom()
    {

        DataTable dt_meas = DataTable_from_ListBox(lstMeasure, "value");

        SqlCommand sqlCmd = new SqlCommand("spVars_for_Selecting", oConnData);
        sqlCmd.CommandType = CommandType.StoredProcedure;

        SqlParameter param1 = sqlCmd.Parameters.AddWithValue("@tbl", dt_meas);

        param1.SqlDbType = SqlDbType.Structured; //tells ADO.NET we are passing TVP

        SqlDataAdapter da = new SqlDataAdapter(sqlCmd);
        DataTable dt = new DataTable();
        da.Fill(dt);

        //string results = "Query returned " + dt.Rows.Count.ToString() + " records.";

        lstVars.DataSource = dt;
        lstVars.DataValueField= "value";
        lstVars.DataTextField = "text";
        lstVars.DataBind();

        foreach(ListItem i in lstVars.Items)
        {
            i.Selected = true;
        }
    }
    #endregion


    #region ===== Populate DropDowns =====

        //        <asp:ListItem Value="groupname" Text="Group"></asp:ListItem>
        //<asp:ListItem Value="timepoint_text" Text="Timepoint"></asp:ListItem>
        //<asp:ListItem Value="variable" Text="variable"></asp:ListItem>
    protected void populate_DropDowns()
    {
        ListItemCollection items = new ListItemCollection();

        ListItem item0 = new ListItem("--select--", "--select--");
        ListItem item1 = new ListItem("Group", "groupname");
        ListItem item2 = new ListItem("Timepoint", "timepoint_text");
        ListItem item3 = new ListItem("Variable", "variable");

        ddlX1.Items.Add(item0);
        ddlX1.Items.Add(item1);
        ddlX1.Items.Add(item2);
        ddlX1.Items.Add(item3);
        ddlX1.SelectedIndex = 3;

        ddlX2.Items.Add(item0);
        ddlX2.Items.Add(item1);
        ddlX2.Items.Add(item2);
        ddlX2.Items.Add(item3);
        ddlX2.SelectedIndex = 1;

        ddlLimit.Items.Add(item0);
        ddlLimit.Items.Add(item1);
        ddlLimit.Items.Add(item2);
        ddlLimit.Items.Add(item3);
        ddlLimit.SelectedIndex = 0;


    }


    #endregion


    protected DataTable getData_Vars_MSD()
    {
        if (oConnData.State != ConnectionState.Open) oConnData.Open();
        DataTable dt = new DataTable();
        try
        {
            DataTable dt_vars       = DataTable_from_ListBox(lstVars, "variable");
            DataTable dt_group      = DataTable_from_ListBox(lstGroup, "groupname");
            DataTable dt_subjstatus = DataTable_from_ListBox(lstSubjStatus, "subjstatus");
            DataTable dt_timepoint  = DataTable_from_ListBox(lstTimePoint, "timepoint_text");

            //lblInfo.Text += " studyID = " + _content_studyID.ToString();       
            //lblInfo.Text += " dt_vars       <b>" + dt_vars.Rows.Count.ToString() + "</b> recs.";
            //lblInfo.Text += " dt_group      <b>" + dt_group.Rows.Count.ToString() + "</b> recs.";
            //lblInfo.Text += " dt_subjstatus <b>" + dt_subjstatus.Rows.Count.ToString() + "</b> recs.";
            //lblInfo.Text += " dt_timepoint  <b>" + dt_timepoint.Rows.Count.ToString() + "</b> recs.";
            
            SqlCommand sqlCmd = new SqlCommand();
            sqlCmd.Connection = oConnData;
            sqlCmd.CommandType = CommandType.StoredProcedure;
            sqlCmd.CommandText = "spVars_MSD";

            SqlParameter param0 = sqlCmd.Parameters.AddWithValue("@studyID", _content_studyID);
            SqlParameter param1 = sqlCmd.Parameters.AddWithValue("@vars", dt_vars);
            SqlParameter param2 = sqlCmd.Parameters.AddWithValue("@groupnames", dt_group);
            SqlParameter param3 = sqlCmd.Parameters.AddWithValue("@subjstatus", dt_subjstatus);
            SqlParameter param4 = sqlCmd.Parameters.AddWithValue("@timepoints", dt_timepoint);

            param0.SqlDbType = SqlDbType.Int; //tells ADO.NET we are passing TVP
            param1.SqlDbType = SqlDbType.Structured; //tells ADO.NET we are passing TVP
            param2.SqlDbType = SqlDbType.Structured; //tells ADO.NET we are passing TVP
            param3.SqlDbType = SqlDbType.Structured; //tells ADO.NET we are passing TVP
            param4.SqlDbType = SqlDbType.Structured; //tells ADO.NET we are passing TVP

                      
            SqlDataAdapter da = new SqlDataAdapter(sqlCmd);
            da.FillError +=  new FillErrorEventHandler(da_FillError);

            da.Fill(dt);

            lblInfo.Text += "....Query returned " + dt.Rows.Count.ToString() + " records.<br/>";

        }
        catch(Exception exc)
        {
            lblInfo.Text += exc.Message + "<br/>" + exc.Source.ToString() + "<br/>" + exc.StackTrace; 
        }
        //string results = "Query returned " + dt.Rows.Count.ToString() + " records.";



        return (dt);
    }

    void da_FillError(object sender, FillErrorEventArgs e)
    {
        lblInfo.Text += "<br/><br/>" + e.Errors.Message;
        e.Continue = true;
        //throw new NotImplementedException();
    }





    protected DataTable DataTable_from_ListBox(ListBox lst, string fld)
    {
        DataTable dt = new DataTable();
        dt.Columns.Add("fld", typeof(string));
        dt.Columns.Add("value", typeof(string));
        foreach (ListItem i in lst.Items)
        {
            if (i.Selected)
            {
                //lblInfo.Text += "foo";
                dt.Rows.Add(fld, i.Value.ToString());
            }
            else
            {
                //lblInfo.Text += "fum";
            }
        }

        return (dt);
    }


    protected DataTable GetData()
    {
        if (oConnData.State != ConnectionState.Open) oConnData.Open();
        DataTable dt = new DataTable();
        //string cmd = "select variable, groupname, mean,  meanP1, meanM1, varlabel from vwTest_Vars";
        string cmd = "select variable, groupname, mean from vwTest_Vars";
        SqlCommand scmd = new SqlCommand();
        scmd.Connection = oConnData;
        scmd.CommandType = CommandType.Text;
        scmd.CommandText = cmd;

        //SqlDataAdapter adp = new SqlDataAdapter(scmd);
        //adp.Fill(dt);

        SqlDataReader rdr = scmd.ExecuteReader();


        dt = utilsPivot.Pivot(rdr, "variable", "groupname", "mean");

        return dt;
    }


    protected DataTable GetData(string x1, string x2, string yval)
    {
        if (oConnData.State != ConnectionState.Open) oConnData.Open();
        DataTable dt = new DataTable();
        //string cmd = "select variable, groupname, mean,  meanP1, meanM1, varlabel from vwTest_Vars";
        string cmd = "select " + x1 + ", " + x2 + ", " + yval + "  from vwTest_Vars order by " + x1 + ", " + x2;
        SqlCommand scmd = new SqlCommand();
        scmd.Connection = oConnData;
        scmd.CommandType = CommandType.Text;
        scmd.CommandText = cmd;

        //SqlDataAdapter adp = new SqlDataAdapter(scmd); 
        //adp.Fill(dt);

        SqlDataReader rdr = scmd.ExecuteReader();


        dt = utilsPivot.Pivot(rdr, x1, x2, yval);

        return dt;
    }







    protected void LoadGrid()
    {
        DataTable dt = new DataTable();

        dt = GetData();

        GridView gv = new GridView();
        gv.AutoGenerateColumns = true;
        gv.DataSource = dt;
        gv.DataBind();

        updatePanel01.ContentTemplateContainer.Controls.Add(gv);
        updatePanel01.Update();
    }
    
    protected void LoadGrid(string x1, string x2, string yval)
    {
        DataTable dt = new DataTable();

        dt = GetData(x1, x2, yval);

        GridView gv = new GridView();
        gv.AutoGenerateColumns = true;
        gv.DataSource = dt;
        gv.DataBind();

        updatePanel01.ContentTemplateContainer.Controls.Add(gv);
        updatePanel01.Update();
    }



    protected void AddGV(DataTable dt)
    {
        GridView gv = new GridView();
        gv.AutoGenerateColumns = true;
        gv.DataSource = dt;
        gv.DataBind();

        updatePanel01.ContentTemplateContainer.Controls.Add(gv);
        updatePanel01.Update();
    }



    protected void Chart_Vars_MSD() //(string div_name, int width, int height, string x1, string x2)
    {

        DataTable dt_vars = getData_Vars_MSD();
        AddGV(dt_vars);

        //DataTable dt_m1 = GetData("variable", "groupname", "mean");
        //DataTable dt_m2 = GetData("variable", "groupname", "n");

        //AddGV(dt_m1);
        //AddGV(dt_m2);

        //lblInfo.Text += "<br/><b>1</b>";
        //foreach (DataColumn c in dt_m1.Columns)
        //{
        //    lblInfo.Text += "<br/>" + c.ColumnName + " - " + c.DataType.ToString(); 
        //}

        //lblInfo.Text += "<br/><b>2</b>"; 
        //foreach (DataColumn c in dt_m2.Columns)
        //{
        //    lblInfo.Text += "<br/>" + c.ColumnName + " - " + c.DataType.ToString();
        //}

        ////dt_m1.Merge(dt_m2);
        //AddGV(dt_m1);


        foreach(DataColumn c in dt_vars.Columns)
        {
            lblInfo.Text += c.ColumnName + "...";
        }

        AddGV(DataUtilities.PivotLINQ(dt_vars, dt_vars.Columns[1], dt_vars.Columns[2], dt_vars.Columns[3]));
        AddGV(DataUtilities.PivotLINQ(dt_vars, dt_vars.Columns[1], dt_vars.Columns[3], dt_vars.Columns[2]));
    }



    protected void Chart_MSD(string div_name, int width, int height, string x1, string x2)
    {

        DataTable dt_m = new DataTable();
        DataTable dt_sd = new DataTable();
        DataTable dt_n = new DataTable();

        dt_m  = GetData(x1, x2, "mean");
        dt_sd = GetData(x1, x2, "sd");
        dt_n  = GetData(x1, x2, "n");

        //AddGV(dt_m);
        //AddGV(dt_sd);
        //AddGV(dt_n);

        try
        {

            //google.setOnLoadCallback(drawTrendlines);


            str.Append(@"<script type=*text/javascript*> google.load( *visualization*, *1*, {packages:[*corechart*]});
                       google.setOnLoadCallback(drawChart);
                       function drawChart() {
                           var data = new google.visualization.DataTable();");

            str.Append(@"data.addColumn({type: 'string', id: '" + x1 + "', role: 'domain'});");

            int numcols = dt_m.Columns.Count - 1;
            int numcols_per_value = 4;   //increase as needed when adding tooltips, etc.

            //Add the data columns 
            for (int i = 1; i <= numcols; i++)
            {
                //str.Append(@"data.addColumn({type: 'number', id: '" + dt_m.Columns[i].ColumnName + "', role: 'data' });");
                str.Append(@"data.addColumn({type: 'number', id: '" + dt_m.Columns[i].ColumnName + "',  role: 'data', label: '" + dt_m.Columns[i].ColumnName + "' });");
                str.Append(@"data.addColumn({type: 'number', id: '" + dt_m.Columns[i].ColumnName + "', role: 'interval' });");
                str.Append(@"data.addColumn({type: 'number', id: '" + dt_m.Columns[i].ColumnName + "', role: 'interval' });");
                str.Append(@"data.addColumn({type: 'string', id: '" + dt_m.Columns[i].ColumnName + "', role: 'annotation' });");
            }

            //Add the columns for intervals, tooltips, etc.
            str.Append(@"data.addRows(" + dt_m.Rows.Count + ");");


            for (int i = 0; i <= dt_m.Rows.Count - 1; i++)
            {
                str.Append("data.setValue(" + i + "," + 0 + "," + "'" + dt_m.Rows[i][x1].ToString() + "');");

                for (int j = 1; j <= dt_m.Columns.Count - 1; j++)
                {
                    //mean value
                    str.Append("data.setValue(" + i + "," + (((j - 1) * numcols_per_value) + 1) + "," + dt_m.Rows[i][dt_m.Columns[j].ColumnName].ToString() + ") ;");

                    //sd 
                    double m1 = Convert.ToDouble(dt_m.Rows[i][dt_m.Columns[j].ColumnName]) - Convert.ToDouble(dt_sd.Rows[i][dt_sd.Columns[j].ColumnName]);
                    double p1 = Convert.ToDouble(dt_m.Rows[i][dt_m.Columns[j].ColumnName]) + Convert.ToDouble(dt_sd.Rows[i][dt_sd.Columns[j].ColumnName]);
                    str.Append("data.setValue(" + i + "," + (((j - 1) * numcols_per_value) + 2) + "," + m1.ToString() + ") ;");
                    str.Append("data.setValue(" + i + "," + (((j - 1) * numcols_per_value) + 3) + "," + p1.ToString() + ") ;");

                    //n
                    str.Append("data.setValue(" + i + "," + (((j - 1) * numcols_per_value) + 4) + ",'n=" + dt_n.Rows[i][dt_n.Columns[j].ColumnName].ToString() + "') ;");

                }

                //str.Append("data.setValue(" + i + "," + 0 + "," + "'" + dt.Rows[i]["variable"].ToString() + "');");
                //str.Append("data.setValue(" + i + "," + 1 + "," + dt.Rows[i]["ASD"].ToString() + ") ;");
                //str.Append("data.setValue(" + i + "," + 2 + "," + dt.Rows[i]["DD"].ToString() + ") ;");
                //str.Append("data.setValue(" + i + "," + 3 + "," + dt.Rows[i]["TYP"].ToString() + ") ;");

            }

            str.Append(" var chart = new google.visualization.ColumnChart(document.getElementById('");
            str.Append(div_name);
            str.Append("'));");

            str.Append("var options = {");
            str.Append(" width: " + width.ToString() + ", height: " + height.ToString() + ", title: '"  + x1 + " by " + x2 + "'");
            str.Append(", tooltip: {isHtml: true}");
            str.Append(", legend: { position: 'right',  textStyle: {fontSize: 9} }");
//            str.Append(", chartArea:{width:'70%', height:'80%'} ");
            str.Append(", hAxis: {title: '" + x1 + "',  textStyle: {fontSize: 11}, titleTextStyle: {color: 'black'}}");
            str.Append(", annotations: { textStyle: { fontSize: 9, opacity: 0.8}}");

            //str.Append(", trendlines: {");
            //str.Append("               0: {type: 'linear', lineWidth: 5, opacity: .3},");
            //str.Append("               1: {type: 'exponential', lineWidth: 10, opacity: .3}}");

            str.Append("};");


            str.Append("chart.draw(data, options); ");
            str.Append("}");
            str.Append("</script>");

            //Literal lit01 = (Literal)updatePanel01.ContentTemplateContainer.FindControl("lit01");
            lit01.Text = str.ToString().Replace('*', '"');

            //lblInfo.Text += str.ToString();//dt.Rows.Count.ToString();

        }

        catch (Exception exc) 
        {
            lblInfo.Text += str.ToString() + "</script> <br/>" + exc.Message.ToString() + "<br/>" + exc.Source + "<br/>" + exc.StackTrace;//dt.Rows.Count.ToString();
        }

        //lblInfo.Text += str.ToString();//dt.Rows.Count.ToString();

        updatePanel01.Update();

    }



    protected void BindChart(string div_name, int width, int height, string x1, string x2, string yval)
    {

        DataTable dt = new DataTable();
        dt = GetData(x1, x2, yval);
//        AddGV(dt); 

        try
        {


            str.Append(@"<script type=*text/javascript*> google.load( *visualization*, *1*, {packages:[*corechart*]});
                       google.setOnLoadCallback(drawChart);
                       function drawChart() {
                           var data = new google.visualization.DataTable();");

            str.Append(@"data.addColumn({type: 'string', id: '" + x1 + "', role: 'domain'});");

            //Add the data columns 
            for (int i = 1; i <= dt.Columns.Count - 1; i++)
            {
                str.Append(@"data.addColumn({type: 'number', id: '" + dt.Columns[i].ColumnName + "', role: 'data' });");
            }
            
            //Add the columns for intervals, tooltips, etc.

            str.Append(@"data.addRows(" + dt.Rows.Count + ");");


            for (int i = 0; i <= dt.Rows.Count - 1; i++)
            {
                str.Append("data.setValue(" + i + "," + 0 + "," + "'" + dt.Rows[i][x1].ToString() + "');");

                for (int j = 1; j <= dt.Columns.Count-1 ; j++)
                {
                    str.Append("data.setValue(" + i + "," + j + "," + dt.Rows[i][dt.Columns[j].ColumnName].ToString() + ") ;");
                }

                //str.Append("data.setValue(" + i + "," + 0 + "," + "'" + dt.Rows[i]["variable"].ToString() + "');");
                //str.Append("data.setValue(" + i + "," + 1 + "," + dt.Rows[i]["ASD"].ToString() + ") ;");
                //str.Append("data.setValue(" + i + "," + 2 + "," + dt.Rows[i]["DD"].ToString() + ") ;");
                //str.Append("data.setValue(" + i + "," + 3 + "," + dt.Rows[i]["TYP"].ToString() + ") ;");

            }

            str.Append(" var chart = new google.visualization.ColumnChart(document.getElementById('");
            str.Append(div_name);
            str.Append("'));");

            str.Append("var options = {");
            str.Append(" width: " + width.ToString() + ", height: " + height.ToString() + ", title: 'Graph Test'");
            str.Append(", tooltip: {isHtml: true}");
            str.Append(", legend: 'none'");
            str.Append(", hAxis: {title: 'variable', titleTextStyle: {color: 'green'}}");
            str.Append("};");


            str.Append("chart.draw(data, options); ");
            str.Append("}");
            str.Append("</script>");

            //Literal lit01 = (Literal)updatePanel01.ContentTemplateContainer.FindControl("lit01");
            lit01.Text = str.ToString().Replace('*', '"');

            //lblInfo.Text += str.ToString();//dt.Rows.Count.ToString();

        }

        catch
        {
            //            lblInfo.Text += str.ToString();//dt.Rows.Count.ToString();
        }

        //lblInfo.Text += str.ToString();//dt.Rows.Count.ToString();

        updatePanel01.Update();

    }



    protected void btnLoadVars_Click(object sender, EventArgs e)
    {
        populate_VarsToSelectFrom();
    }

    protected void btnGetCharts_Click(object sender, EventArgs e)
    {
        Chart_Vars_MSD();
    }
}

// See more at: http://www.dotnetfox.com/articles/create-google-multi-series-column-chart-from-database-in-Asp-Net-1065.aspx#sthash.kcsMVchw.dpuf

