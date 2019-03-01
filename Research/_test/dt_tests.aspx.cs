using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using uwac;
using uwac.data;
using DevExpress.Web;


public partial class _test_dt_tests : BasePage
{
	protected void Page_Load(object sender, EventArgs e)
	{

	}

	protected void WidenTable()
	{
		SQL_utils sql = new SQL_utils("data");

		string sqlcode = "  select val, upper as up, '' isREL from const_INTs where val between 1 and 10 " +
			" union select val - 10, upper as up, 'REL' isREL from const_INTs where val between  11 and 20";

		DataTable dt = sql.DataTable_from_SQLstring(sqlcode);

		ASPxGridView g1 = new ASPxGridView();
		g1.DataSource = dt;
		g1.DataBind();
		panel1.Controls.Add(g1);
		


		//DataTable dtWide = dt.WidenRelData(dt, new List<string> { "up" }, "val"
		//	, "isREL", "", "REL", "REL_", "");

		//DataTable dt2 = dt.Wi



	}
}
