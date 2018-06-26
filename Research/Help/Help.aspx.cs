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

namespace Help
{
	public partial class Help : System.Web.UI.Page
	{
		private void Page_Load(object sender, System.EventArgs e)
		{
            string ap = Request.ApplicationPath;

			if (Request["Section"] != null)
			{
				string sHelpPage = Request["Section"].ToString();

				switch (sHelpPage.ToUpper())
				{
					case "REPORTS":
						oIFrame.Attributes["src"] = ap + "/Help/ReportsHelp.aspx";
						break;
					case "MEASURES":
                        oIFrame.Attributes["src"] = ap + "/Help/MeasuresHelp.aspx";
						break;
					case "NOTES":
                        oIFrame.Attributes["src"] = ap + "/Help/NotesHelp.html";
						break;
					case "DATABASETERMS":
                        oIFrame.Attributes["src"] = ap + "/Help/DatabaseTermsHelp.aspx";
						break;
					case "DOCUMENTS":
                        oIFrame.Attributes["src"] = ap + "/Help/DocumentsHelp.aspx";
						break;
					default:
						break;
				}
			}
		}
	}
}