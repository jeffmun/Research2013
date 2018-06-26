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

namespace StudyDesign
{
	public partial class WebForm1 : System.Web.UI.Page
	{
		private void Page_Load(object sender, System.EventArgs e)
		{
			
		}



        protected void Page_PreRender(Object o, EventArgs e)
        {
            string viewrpt =  Request.Params["viewrpt"];
           
            HtmlControl frame1 = new System.Web.UI.HtmlControls.HtmlGenericControl("iframe");

            
            //if (Request.Params["tableID"] != null)
            if (viewrpt != null)
            {

                //DropDownList DDL_studyID =  ((DropDownList)this.FindControl("DDL_studyID")).SelectedValue; ;
                //string studyID = DDL_studyID.SelectedValue;

                //                    ViewState["studyID"] = ((DataRowView)FormView1.DataItem)["DocID"].ToString();
                //                ((Label)FormView1.Row.Cells[0].FindControl("DocTitleTextBox_Insert")).Text = ViewState["doctitle"].ToString();

                string studyID = "";

                try
                {
                    studyID = "&studyID=" + ViewState["studyID"].ToString();
                    //studyID = "&studyID=1017";
                }
                catch
                {
                    //ViewState["studyID"] = ((Label)this.FormView1.FindControl("Label_DefaultStudyID")).Text.ToString();
                    //ViewState["studyID"] = ((DropDownList)this.FindControl("DDL_studyID")).SelectedValue.ToString();
                }

                //((DropDownList)this.FindControl("DDL_studyID")).SelectedValue; ;

                Label lblDefaultStudyID = (Label)this.FormView1.FindControl("Label_DefaultStudyID");

                string studyIDtext;

                if (ViewState["studyID"] != null)
                { studyID = ViewState["studyID"].ToString(); }
                else
                {
                    try {studyID = lblDefaultStudyID.Text;}
                    catch { }
                }

                switch (viewrpt)
                {
                    case "1":
                        studyIDtext = "&MainStudy=" + studyID;
                        frame1.Attributes["src"] = "https://autism.washington.edu/SQLReportServer/Pages/ReportViewer.aspx?%2fStudy+Design%2fStudy+Design_-_FULL_REPORT" + studyIDtext + "&rs%3aCommand=Render";
                        break;
                    case "2":
                        studyIDtext = "&studyID=" + studyID;
                        frame1.Attributes["src"] = "https://autism.washington.edu/SQLReportServer/Pages/ReportViewer.aspx?%2fStudy+Design%2fStudy_Design_-_Measures" + studyIDtext + "&rs%3aCommand=Render";
                        break;
                    case "3":
                        studyIDtext = "&studyID1=" + studyID;
                        frame1.Attributes["src"] = "https://autism.washington.edu/SQLReportServer/Pages/ReportViewer.aspx?%2fStudy+Design%2fCompare_Measures_Across_Studies" + studyIDtext + "&rs:Command=Render";
                        break;
                    case "4":
                        studyIDtext = "&studyID=" + studyID;
                        frame1.Attributes["src"] = "https://autism.washington.edu/SQLReportServer/Pages/ReportViewer.aspx?%2fStudy+Design%2fStudyDesign__Problems_to_fix_single_study" + studyIDtext + "&rs:Command=Render";
                        break;
                    case "5":
                        studyIDtext = "&EntityID=" + studyID;
                        frame1.Attributes["src"] = "https://autism.washington.edu/SQLReportServer/Pages/ReportViewer.aspx?%2fDocuments%2fDocs_Search_by_Entity&EntityTypeID=6" + studyIDtext + "&rs:Command=Render";
                        break;
                    case "6":
                        studyIDtext = "&studyID=" + studyID;
                        frame1.Attributes["src"] = "https://autism.washington.edu/SQLReportServer/Pages/ReportViewer.aspx?%2fStudy+Design%2fStudy_Design_-_Measures_with_DataTable_info" + studyIDtext + "&rs%3aCommand=Render";
                        break;
                    case "7":
                        studyIDtext = "&studyID=" + studyID;
                        frame1.Attributes["src"] = "https://autism.washington.edu/SQLReportServer/Pages/ReportViewer.aspx?%2fStudy+Design%2fProjections_v1&rs:Command=Render";
                        break;
                    case "8":
                        studyIDtext = "&studyID=" + studyID;
                        frame1.Attributes["src"] = "https://autism.washington.edu/SQLReportServer/Pages/ReportViewer.aspx?%2fData+Documentation%2fDocuments+-+Measures+by+Study"+ studyIDtext + "&rs%3aCommand=Render";
                        break;
                    default:
                        frame1.Attributes["src"] = "";
                        break;
                }

                frame1.Attributes["style"] = "width:100%; height:800px";
                frame1.Attributes["frameborder"] = "1";
                frame1.Attributes["scrolling"] = "auto";
                frame1.Attributes["align"] = "top";

                theFrameHolder.Controls.Add(frame1);



            }
            


        }

        protected void DDL_studyID_SelectedIndexChanged(object sender, EventArgs e)
        {
//            int x = 1;
            ViewState["studyID"] = DDL_studyID.SelectedValue.ToString();
        }
        protected void DDL_studyID_DataBound(object sender, EventArgs e)
        {
            DropDownList DDL_StudyID = (DropDownList)this.FindControl("DDL_studyID");

           // if (DDL_StudyID.DataItem != null)
            {

                //if (DDL_StudyID.SelectedValue > 0)
                {

                    try
                    {
                        ViewState["studyID"] = ((DropDownList)this.FindControl("DDL_studyID")).SelectedValue.ToString();
                    }
                    catch
                    {
                    }
                }
            }
        }
        protected void DDL_studyID_TextChanged(object sender, EventArgs e)
        {
//            int x = 1;
            ViewState["studyID"] = DDL_studyID.SelectedValue.ToString();

        }

        protected void CheckViewState(object sender, EventArgs e)
        {
            if (ViewState["studyID"] == null)
            {
                try { ViewState["studyID"] = "&MainStudy=" + ((Label)this.FormView1.FindControl("Label_DefaultStudyID")).Text.ToString(); }
                catch { }

            }

        }
}
}
