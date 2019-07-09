using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DevExpress.Web;
using DevExpress.Spreadsheet;
using SpreadsheetGear;

public partial class AC_testbal : System.Web.UI.Page
{
	protected void Page_Load(object sender, EventArgs e)
	{

		string file = @"c:\_tmp\test2.xlsx";
		spreadsheet.Open(file, DocumentFormat.Xlsx);

		//DataSet ds = SpreadsheetGearUtils.GetDataSet(file, false);

//			DataSet dset = SpreadsheetGear.Factory.GetWorkbook()



	}
}