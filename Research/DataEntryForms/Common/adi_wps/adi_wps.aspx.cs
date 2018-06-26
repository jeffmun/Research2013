using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

public partial class DataEntryForms_Common_adi_wps_adi_wps : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (this.DataEntryController1.PrimaryKeyVal > 0
            && this.DataEntryController1.FormState != DataEntryFramework3.FormStates.ENTERING
            && this.DataEntryController1.FormState != DataEntryFramework3.FormStates.INSERTING)
        {
            this.hlnkReport.Visible = true;
            this.hlnkReport.NavigateUrl = string.Format("adi_wps_report.aspx?pk={0}", DataEntryController1.PrimaryKeyVal);
        }
        else
            this.hlnkReport.Visible = false;
    }
}

