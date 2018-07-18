using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;
//using Newtonsoft.Json.Schema;
using DevExpress.Web;
using uwac;


public partial class NDAR_NDARimport : System.Web.UI.Page
{

	protected void Page_Init(object sender, EventArgs e)
	{
		gridFullList.DataBind();
		Master.DDL_Master_SelectStudyID.SelectedIndexChanged += new EventHandler(Master_Study_Changed);
	}

	protected void Page_Load(object sender, EventArgs e)
	{
		if (!IsPostBack)
		{
			
		}
	}

	//If the master page default study is changed, update the Measure DDL
	protected void Master_Study_Changed(object sender, EventArgs e)
	{
		 
	}





	//protected void btnSave_Click(object sender, EventArgs e)
	//{
	//	DataTable dt = NDAR.LoadFullDataStructureList("NDAR");

	//	SaveAllDataStructures(dt);
	//}


	//protected void SaveAllDataStructures(DataTable dt)
	//{
	//	SQL_utils sql = new SQL_utils();
	//	SqlParameter p = sql.CreateParam("NDAR_DS", dt);
	//	sql.NonQuery_from_ProcName("spNDAR_Insert_DS", p);
	//}


	protected void gvScroll_RowCommand(object sender, GridViewCommandEventArgs e)
	{
		//save DSE here
		if(e.CommandName == "Import flds")
		{
			NDAR.NDAR_DataStructure ds = NDAR.GetNDARDataStructure(e.CommandArgument.ToString());

			DataTable dse = NDAR.NDARDataStructureElements_to_DataTable(ds);

			//lblInfo.Text = "nrow = {" + dse.Rows.Count.ToString() + "}";

			SQL_utils sql = new SQL_utils();
			SqlParameter p = sql.CreateParam("NDAR_DSE", dse);
			sql.NonQuery_from_ProcName("spNDAR_Insert_DSE", p);


			//GridView gv_Fields = new GridView();
			//gv_Fields.DataSource = dse;
			//gv_Fields.DataBind();

			//Panel_dataElements.Controls.Add(gv_Fields);
			//Panel_dataElements.Visible = true;
		}


	
	}



	protected void gvScroll_RowDataBound(object sender, GridViewRowEventArgs e)
	{

		if (e.Row.RowType == DataControlRowType.DataRow)
		{
			string txt_n_flds = e.Row.Cells[0].Text;
			int n_flds = Convert.ToInt16(txt_n_flds);

			string txt_n_uwflds = e.Row.Cells[1].Text;
			int n_uwflds = Convert.ToInt16(txt_n_uwflds);

			if (n_flds > 0)
			{
				Button b = (Button)e.Row.FindControl("btnImportFlds");
				b.Visible = false;
				HyperLink lnkDict = (HyperLink)e.Row.FindControl("linkDict");
			}

			if(n_uwflds == 0)
			{
				HyperLink lnkView = (HyperLink)e.Row.FindControl("linkView");
				lnkView.Visible = false;
			}


			//LinkButton lnk1 = (LinkButton)e.Row.FindControl("linkView");
			//LinkButton lnk2 = (LinkButton)e.Row.FindControl("linkDict");

			//var data = e.Row.DataItem as DataRowView;
			//string shortName = data["shortName"].ToString();

			////string shortName = e.Row.DataItem["shortName"].ToString();

			//lnk1.Attributes.Add("href", "NDARview.aspx?shortName=" + shortName);
			//lnk1.Attributes.Add("href", "NDARdict.aspx?shortName=" + shortName);

			//lnk1.Attributes.Add("target", "_blank");
			//lnk2.Attributes.Add("target", "_blank");

		}
	}


	protected void btnDisplayFromNDAR_OnClick(object sender, EventArgs e)
	{

		string shortname = txtNDAR_ShortName.Value.ToString();

		DataTable dt = NDAR.LoadDataStructure(shortname);
		int n = dt.Rows.Count;

		Session["shortname"] = shortname;
		Session["StructureFromNDAR"] = dt;

		gridDS.DataBind();

		btnImportFromNDAR.Visible = true;
		btnImportFromNDAR.ClientVisible = true;

	}


	protected void btnImportFromNDAR_OnClick(object sender, EventArgs e)
	{

		SQL_utils sql = new SQL_utils("data");

		SqlParameter p = sql.CreateParam("NDAR_DSE", (DataTable)Session["LoadStructureFromNDAR"]);
		sql.NonQuery_from_ProcName("spNDAR_Insert_DSE", p);

		sql.Close();

	}

	//protected void btnLoadStructuresFromNDAR_OnClick(object sender, EventArgs e)
	//{
	//	LoadStructuresFromNDAR();
	//}


	//protected void SaveAllDataStructures(DataTable dt)
	//{
	//	SQL_utils sql = new SQL_utils();
	//	SqlParameter p = sql.CreateParam("NDAR_DS", dt);
	//	sql.NonQuery_from_ProcName("spNDAR_Insert_DS", p);

	//}


	protected void gridDS_CustomCallback(object sender, ASPxGridViewCustomCallbackEventArgs e)
	{
		Session["StructureFromNDAR"] = Int32.Parse(e.Parameters);
		gridDS.DataBind();
	}
	protected void gridFullList_CustomCallback(object sender, ASPxGridViewCustomCallbackEventArgs e)
	{
		Session["StructuresFromNDAR"] = Int32.Parse(e.Parameters);
		gridFullList.DataBind();
	}

	protected void gridFullList_OnDataBinding(object sender, EventArgs e)
	{
		(sender as ASPxGridView).DataSource = LoadStructuresFromNDAR();
	}
	protected void gridDS_OnDataBinding(object sender, EventArgs e)
	{
		(sender as ASPxGridView).DataSource = LoadStructureFromNDAR(Session["shortname"].ToString());
	}

	protected DataTable LoadStructuresFromNDAR()
	{
		DataTable dt_fulllist;
		object o = Session["StructuresFromNDAR"];

		if (o != null)
		{
			dt_fulllist = (DataTable)o;
		}
		else
		{
			dt_fulllist = NDAR.LoadFullDataStructureList("NDAR");
		}

		return dt_fulllist;
	}

	protected DataTable LoadStructureFromNDAR(string shortname)
	{
		DataTable dt_ds;
		object o = Session["StructureFromNDAR"];

		if (o != null)
		{
			dt_ds = (DataTable)o;
		}
		else
		{
			dt_ds = NDAR.LoadDataStructure(shortname);
		}

		return dt_ds;
	}



}