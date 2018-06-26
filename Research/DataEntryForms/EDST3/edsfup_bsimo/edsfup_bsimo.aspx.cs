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

namespace EDST3DataEntryForms.edsfup_bsimo
{
	/// <summary>
	/// Summary description for edsfup_bsimo.
	/// </summary>
	public partial class edsfup_bsimo : System.Web.UI.Page
	{
	
		protected void Page_Load(object sender, System.EventArgs e)
		{
			// Put user code to initialize the page here
		}

		#region Web Form Designer generated code
		override protected void OnInit(EventArgs e)
		{
			//
			// CODEGEN: This call is required by the ASP.NET Web Form Designer.
			//
			InitializeComponent();
			base.OnInit(e);
		}
		
		/// <summary>
		/// Required method for Designer support - do not modify
		/// the contents of this method with the code editor.
		/// </summary>
		private void InitializeComponent()
		{    
			this.PreRender += new System.EventHandler(this.edsfup_bsimo_PreRender);

		}
		#endregion

		protected void edsfup_bsimo_PreRender(object sender, System.EventArgs e)
		{
			if (!this.IsPostBack && this.Request.QueryString["id"] != null && this.Request.QueryString["IndexNum"] != null)
			{
				DataEntryController1.LookupTextBox1Text = this.Request.QueryString["id"];
				DataEntryController1.LookupTextBox2Text = this.Request.QueryString["indexnum"];
				DataEntryController1.ParameterLookup();
			}
		}
	}
}
