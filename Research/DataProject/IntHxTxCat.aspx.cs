using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using uwac;

public partial class DataProject_IntHxTxCat : System.Web.UI.Page
{
	protected void Page_Load(object sender, EventArgs e)
	{

		LoadIntHxCategories();

	}

	protected void LoadIntHxCategories()
	{
		SQL_utils sql = new SQL_utils("data");
		DataTable dt1 = sql.DataTable_from_SQLstring("select  txcat1, txcat2, txcat3, txcat4 from vwconst_MIND_IntHXv2_TxTypeCat group by  txcat1, txcat2, txcat3, txcat4 order by txcat1, txcat2, txcat3 ");
		DataTable dt2 = sql.DataTable_from_SQLstring("select txtypeID, left(txcat1,3) txcat1, left(txcat2,3) txcat2, left(txcat3,3) txcat3, left(txcat4,3) txcat4, txtype from vwconst_MIND_IntHXv2_TxTypeCat order by txcat4, txtype");

		gridTxCat.DataSource = dt1;
		gridTxType.DataSource = dt2;

		gridTxCat.DataBind();
		gridTxType.DataBind();
	}

}