using DevExpress.Web;
using DevExpress.Web.Export;
using DevExpress.Web.ASPxPivotGrid;
using DevExpress.Web.Data;
using DevExpress.XtraPivotGrid;
using DevExpress.XtraGrid;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Diagnostics;
using System.Drawing;
using System.Linq;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Services;
using uwac;
using uwac.trk;


public partial class Library_Measure : System.Web.UI.Page
{
	protected void Page_Load(object sender, EventArgs e)
	{

		if(Request.QueryString["pk"] != null)
		{
			int measureID = Convert.ToInt32(Request.QueryString["pk"]);
			LoadMeasureInfo(measureID);
			LoadDocs(measureID);
		}

	}

	protected void updateButton_Click(object sender, EventArgs e)
	{

	}

	protected void LoadMeasureInfo(int measureID)
	{
		SQL_utils sql = new SQL_utils("backend");
		string code = String.Format("select a.*, tblname, tblpk, spname from tblmeasure a left join uwautism_research_data.def.tbl b ON a.measureID = b.measureID where a.measureID={0}"
			, measureID);

		DataTable dt = sql.DataTable_from_SQLstring(code);

		FormLayout.DataSource = dt;
		FormLayout.DataBind();
	}

	protected void LoadDocs(int measureID)
	{
		SQL_utils sql = new SQL_utils("backend");
		string code = String.Format("select DocID, DocTitle, DocDesc, DocVersID, Version, DocFileName, ChangesDesc, DateSubmitted, doctype, docstatus, DocLink, fileext from vwDocs_Meas where entityID = {0}"
			, measureID);
		
		DataTable dt = sql.DataTable_from_SQLstring(code);

		gridDocs.DataSource = dt;
		gridDocs.DataBind();
	}


	protected void keyFieldLink_Init(object sender, EventArgs e)
	{
		ASPxHyperLink link = sender as ASPxHyperLink;
		GridViewDataItemTemplateContainer container = link.NamingContainer as GridViewDataItemTemplateContainer;
		link.Text = "View"; // + container.KeyValue;
		link.Target = "_blank";
		link.NavigateUrl = "Doc.aspx?id=" + container.KeyValue;
	}

}
