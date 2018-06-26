using System;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;

namespace DataEntryFramework.Old
{
	public class DataEntryIssueTemplate : ITemplate
	{
		ListItemType templateType;

		public DataEntryIssueTemplate(ListItemType type)
		{
			templateType = type;
		}

		public void InstantiateIn(System.Web.UI.Control container)
		{
			switch( templateType )
			{
				case ListItemType.Header:
					//System.Web.UI.WebControls.Button btnAdd = new System.Web.UI.WebControls.Button();
					LinkButton btnAdd = new LinkButton();
					btnAdd.CommandName = "_AddIssue";
					btnAdd.Text = "Add&nbsp;New&nbsp;Issue";
					btnAdd.Font.Size = 8;

					LinkButton btnRefresh = new LinkButton();
					btnRefresh.CommandName = "_RefreshIssueList";
					btnRefresh.Text = "Refresh&nbsp;List";
					btnRefresh.Font.Size = 8;

					Literal lcH1 = new Literal();
					lcH1.Text = "<TABLE class=\"CompactTable\"  style=\"BACKGROUND-COLOR: gainsboro\" cellpadding=\"0\" cellspacing=\"0\"><tr><th colspan=\"5\">Data&nbsp;Issues&nbsp;&nbsp;";
					Literal lcH2 = new Literal();
					lcH2.Text = "</th></TR>";
					Literal lcH3 = new Literal();
					lcH3.Text = "&nbsp;&nbsp;";

					container.Controls.Add(lcH1);
					container.Controls.Add(btnAdd);
					container.Controls.Add(lcH3);
					container.Controls.Add(btnRefresh);
					container.Controls.Add(lcH2);
					break;
				case ListItemType.Item:
				case ListItemType.AlternatingItem:

					System.Web.UI.WebControls.TextBox txtEntry = new System.Web.UI.WebControls.TextBox();
					txtEntry.ID = "txtEntry";
					txtEntry.CssClass = "IssueTxtEntry";
					txtEntry.TextMode = TextBoxMode.MultiLine;
					txtEntry.MaxLength = 1000;
					txtEntry.Rows = 3;
					txtEntry.DataBinding += new EventHandler(TemplateControl_DataBinding);
					txtEntry.Font.Size = 8;

					//System.Web.UI.WebControls.Button btnSave = new System.Web.UI.WebControls.Button();
					LinkButton btnSave = new LinkButton();
					btnSave.CommandName = "_SaveIssue";
					btnSave.Text = "Save";
					btnSave.Font.Size = 8;

					//System.Web.UI.WebControls.Button btnDelete = new System.Web.UI.WebControls.Button();
					LinkButton btnDelete = new LinkButton();
					btnDelete.CommandName = "_DeleteIssue";
					btnDelete.Text = "Delete";
					btnDelete.Font.Size = 8;

					System.Web.UI.WebControls.DropDownList lbStatus = new DropDownList();
					lbStatus.ID = "lbStatus";
					/*
					lbStatus.Items.Add(new ListItem("-none-","0"));
					lbStatus.Items.Add(new ListItem("Unresolved","1"));
					lbStatus.Items.Add(new ListItem("Resolved","2"));
					lbStatus.Items.Add(new ListItem("Note","3"));
					*/
					lbStatus.DataBinding += new EventHandler(TemplateControl_DataBinding);
					lbStatus.Font.Size = 8;

					HtmlInputHidden hiddenIssueID = new HtmlInputHidden();
					hiddenIssueID.ID = "hiddenIssueID";
					hiddenIssueID.DataBinding += new EventHandler(TemplateControl_DataBinding);
					
					/*
					Literal lcCreateUpdate = new Literal();
					lcCreateUpdate.ID = "lcCreateUpdate";
					lcCreateUpdate.DataBinding += new EventHandler(TemplateControl_DataBinding);
					*/
					Label lbCreateUpdate = new Label();
					lbCreateUpdate.ID = "lbCreateUpdate";
					lbCreateUpdate.DataBinding += new EventHandler(TemplateControl_DataBinding);
					lbCreateUpdate.Font.Size = 8;

					Literal lc1 = new Literal();
					Literal lc2 = new Literal();
					Literal lc3 = new Literal();
					Literal lc4 = new Literal();
					Literal lc5 = new Literal();
					Literal lc6 = new Literal();

					lc1.Text = "<tr class=\"CompactTableRow\"><td class=\"CompactTableCell\">";
					lc2.Text = "</td></tr>";
					lc3.Text = "</td><td class=\"CompactTableCell\">";
					lc4.Text = "</td><td class=\"CompactTableCell\">";
					lc5.Text = "</td><td class=\"CompactTableCell\">";
					lc6.Text = "&nbsp;";
					
					// add all controls to container--determines order of output
					container.Controls.Add(lc1);
					container.Controls.Add(hiddenIssueID);
					container.Controls.Add(lbStatus);
					container.Controls.Add(lc3);
					container.Controls.Add(txtEntry);
					container.Controls.Add(lc4);
					//container.Controls.Add(lcCreateUpdate);
					container.Controls.Add(lbCreateUpdate);
					container.Controls.Add(lc5);
					container.Controls.Add(btnSave);
					container.Controls.Add(lc6);
					container.Controls.Add(btnDelete);
					container.Controls.Add(lc2);
					break;
				case ListItemType.Footer:
					Literal lcF = new Literal();
					lcF.Text = "</TABLE>";
					container.Controls.Add(lcF);
					break;
			}
		}

		private void TemplateControl_DataBinding(object sender, EventArgs e)
		{
			string sID = ((Control)sender).ID;
			RepeaterItem container = (RepeaterItem)((Control)sender).NamingContainer;
			switch (sID)
			{
				case "txtEntry":
					System.Web.UI.WebControls.TextBox tb = (System.Web.UI.WebControls.TextBox)sender;
					tb.Text = DataBinder.Eval(container.DataItem, "entrytxt").ToString();  

					break;

				case "hiddenIssueID":
					HtmlInputHidden hih = (HtmlInputHidden)sender;
					hih.Value = DataBinder.Eval(container.DataItem, "dataEntryIssueID").ToString();  
					
					break;

				case "lbStatus":
					DropDownList ddl = (DropDownList)sender;
					ddl.DataSource = ((CustomRepeater)container.Parent).IssueStatus;
					ddl.DataValueField = "statusID";
					ddl.DataTextField = "status";
					ddl.SelectedValue = DataBinder.Eval(container.DataItem, "statusID").ToString();  
			
					break;

				/*
				case "lcCreateUpdate":
					Literal l = (Literal)sender;
					string s = string.Format("created: {0:d} {1}<br>", DataBinder.Eval(container.DataItem, "created").ToString(), DataBinder.Eval(container.DataItem, "createdBy").ToString());
					s += string.Format("updated: {0:d} {1}", DataBinder.Eval(container.DataItem, "updated").ToString(), DataBinder.Eval(container.DataItem, "updatedBy").ToString());
					l.Text = s;

					break;
				*/
				case "lbCreateUpdate":
					Label l = (Label)sender;
					string s = string.Format("created: {0:d} {1}<br>", DataBinder.Eval(container.DataItem, "created").ToString(), DataBinder.Eval(container.DataItem, "createdBy").ToString());
					s += string.Format("updated: {0:d} {1}", DataBinder.Eval(container.DataItem, "updated").ToString(), DataBinder.Eval(container.DataItem, "updatedBy").ToString());
					l.Text = s;

					break;
			}




		}
	}

}
