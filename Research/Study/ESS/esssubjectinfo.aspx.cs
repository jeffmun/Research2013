using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Study_ESS_esssubjectinfo : System.Web.UI.Page
{

	bool bounded;
	protected void Page_Load(object sender, EventArgs e)
	{
		string columnIndexValue = ColumnIndex.Value, rowIndexValue = RowIndex.Value;
		if (!string.IsNullOrEmpty(columnIndexValue) && !string.IsNullOrEmpty(rowIndexValue) && ASPxPopupControl1.ShowOnPageLoad)
			BindGridView(columnIndexValue, rowIndexValue);
		ASPxPivotGrid1.ClientSideEvents.CellClick = GetJSCellClickHandler();
		ASPxPopupControl1.ClientSideEvents.Closing = GetJSPopupClosingHandler();

		if (ASPxGridView1.IsCallback && !string.IsNullOrEmpty(columnIndexValue) && !string.IsNullOrEmpty(rowIndexValue))
			ASPxGridView1.JSProperties.Add("cpShowDrillDownWindow", false);
	}
	protected void ASPxGridView1_CustomCallback(object sender, DevExpress.Web.ASPxGridViewCustomCallbackEventArgs e)
	{
		string[] param = e.Parameters.Split('|');
		if (param[0] != "D") return;
		BindGridView(ColumnIndex.Value, RowIndex.Value);
		ASPxGridView1.PageIndex = 0;

		if (e.Parameters == "D")
			ASPxGridView1.JSProperties["cpShowDrillDownWindow"] = true;
	}
	protected void BindGridView(string columnIndex, string rowIndex)
	{
		if (bounded) return;
		bounded = true;
		ASPxGridView1.DataSource = ASPxPivotGrid1.CreateDrillDownDataSource(Int32.Parse(columnIndex), Int32.Parse(rowIndex));
		ASPxGridView1.DataBind();
	}
	protected string GetJSCellClickHandler()
	{
		return string.Format(@"function (s, e) {{
	var columnIndex = document.getElementById('{0}'),
		rowIndex = document.getElementById('{1}');
	columnIndex.value = e.ColumnIndex;
	rowIndex.value = e.RowIndex;
	GridView.PerformCallback('D');
	ShowDrillDown();
}}", ColumnIndex.ClientID, RowIndex.ClientID);
	}
	protected string GetJSPopupClosingHandler()
	{
		return string.Format(@"function (s, e) {{
	var columnIndex = document.getElementById('{0}'),
		rowIndex = document.getElementById('{1}');
	columnIndex.value = '';
	rowIndex.value = '';
	GridView.SetVisible(false);

}}", ColumnIndex.ClientID, RowIndex.ClientID);
	}


}