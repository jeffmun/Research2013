using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using uwac;


public partial class AC_EditValantCats : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        string vtj = utilCrypt.Encrypt("vtj");
        string enumAccountingCode = utilCrypt.Encrypt("enumAccountingCode");
        string enumDetailTxCode = utilCrypt.Encrypt("enumDetailTxCode");

        string url = "~/Admin/EditEntity.aspx?tbl=" + enumAccountingCode + "&detail=" + enumDetailTxCode + "&schema=" + vtj;

        hyp1.NavigateUrl = url;

    }
}