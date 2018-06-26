using System;
using System.Collections;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Web;
using System.Web.SessionState;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;

using AutismCenterBase.Measures;
using AutismCenterBase.Utilities;

namespace DataSummary.SingleSubject
{
	public partial class FPAADI : System.Web.UI.Page
	{
		private DBLookup oDBLookup;

		private void Page_Load(object sender, System.EventArgs e)
		{
			if (!IsPostBack)
			{
				oDBLookup = new DBLookup(Master.SqlConn);
				oDBLookup.BindDropDownList(ref selSubjectID, "EXEC spGetSubjectsByStudy 7", "ID", "ID", "", "--Select Subject--");
			}
		}

		protected void GetADI(object sender, EventArgs e)
		{
			if (selSubjectID.SelectedValue != "-1")
			{
				ADI oADI = new ADI();
				oADI.Study = ADI.Studies.FeatureProcessingInAutism;
				oADI.SubjectID = selSubjectID.SelectedValue;

				if (!oADI.RenderADIReport(ref tblMaster))
				{

					tdMsg.InnerHtml = "The subject you selected does not have entered data.";
					tdMsg.Style["display"] = "inline";
				}
				else
					tdMsg.Style["display"] = "none";

			}
		}
	}
}
