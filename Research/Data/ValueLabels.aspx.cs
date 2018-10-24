using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
// Imports needed for R
using System.Threading;
using System.IO;
using System.Threading.Tasks;
using System.Web.Script.Serialization;
using Newtonsoft.Json;
//using RDotNet;
//using RDotNet.NativeLibrary;
using uwac;
using System.Configuration;
using System.Drawing;
using System.Diagnostics;


public partial class Data_ValueLabels : BasePage
	{
	protected void Page_Load(object sender, EventArgs e)
	{
		int fieldvaluesetID;
		var pk = Request.QueryString["pk"];
		bool success = Int32.TryParse(pk, out fieldvaluesetID);
		if(success)
		{
			hidFieldValueSetID.Value = fieldvaluesetID.ToString();
			LoadValueset(fieldvaluesetID);
		}


		if (!IsPostBack)
		{

		}

	}

	protected void LoadValueset(int fieldvaluesetID)
	{
		SQL_utils sql = new SQL_utils("data");

		DataTable dt = sql.DataTable_from_SQLstring("select * from datfieldvaluesetitem where fieldvaluesetID = " + fieldvaluesetID.ToString());

		string name = sql.StringScalar_from_SQLstring("select fieldvaluesetdesc from datfieldvalueset where  fieldvaluesetID = " + fieldvaluesetID.ToString());

		gridVallabels.DataSource = dt;
		gridVallabels.DataBind();

		lblName.Text = name;

	}

	protected void gridVallabels_BatchUpdate(object sender, DevExpress.Web.Data.ASPxDataBatchUpdateEventArgs e)
	{
		if(e.InsertValues.Count > 0)
		{
			foreach (var args in e.InsertValues)
			{
				var x = hidFieldValueSetID.Value;
				args.NewValues.Add("fieldvaluesetID", x);
			}
		}
		string results = DxGridView.ProcessBatch(e, "datFieldValueSetItem", "data", "dbo");
		e.Handled = true;
	}


	//protected void gridVallabels_CustomCallback(object sender, DevExpress.Web.ASPxGridViewCustomCallbackEventArgs e)
	//{
	//	int fieldvaluesetID;
	//	var x = hidFieldValueSetID.Value;

	//	bool success = Int32.TryParse(x, out fieldvaluesetID);
	//	if (success)
	//	{
	//		LoadValueset(fieldvaluesetID);
	//	}

	//}
}