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
using System.Drawing;
using System.Text;
//using System.Threading;
//using System.Net;

public partial class _Default : System.Web.UI.Page 
{

    protected void Page_Load(object sender, EventArgs e)
    {
        
    }


    protected void DDL_SelectStudyID_SelectedIndexChanged(object sender, EventArgs e)
    {
        this.Sql_ReliabilityTracking_Totals.DataBind();
        this.GridView_Totals.SelectedIndex = -1;

    }
    protected void InsertButton_Click(object sender, EventArgs e)
    {
        this.Sql_ReliabilityTracking_Totals.DataBind();
    }
    protected void FormView_Insert_Random_ItemInserted(object sender, FormViewInsertedEventArgs e)
    {
        this.GridView_Totals.DataBind();
        this.GridView_Details.DataBind();

    }
    protected void GridView_Totals_SelectedIndexChanged(object sender, EventArgs e)
    {
        this.GridView_Details.DataBind();
        this.GridView_Details.Visible = true;
        this.Label_Detail_Caption.Visible = true;
        this.Button1.Visible = true;
        //only do this for rows where
        //this.GridView_Totals.Rows[this.GridView_Totals.SelectedIndex].Cells[10]
        
        
       

    }

    protected void FormView_Insert_single_ItemInserted(object sender, FormViewInsertedEventArgs e)
    {
        this.GridView_Totals.DataBind();
        this.GridView_Details.DataBind();

    }
    protected void GridView_Details_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        int z = 1;
    }



    protected void GridView_Totals_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        int y = 1;
        
    }

    
    protected void Sql_ReliabilityTracking_Totals_Updating(object sender, SqlDataSourceCommandEventArgs e)
    {
        e.Command.CommandTimeout = 300;
    }

    protected void GridView_Totals_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            // determine the value of the UnitsInStock field
            if (Convert.ToInt32(DataBinder.Eval(e.Row.DataItem, "NumRelsEntered_ALL")) >
               Convert.ToInt32(DataBinder.Eval(e.Row.DataItem, "NumRelsProcessed")))
            {
                // color the background of the row yellow
                //e.Row.BackColor = Color.Yellow;
                e.Row.Cells[10].Controls[0].Visible = true; //10th column contains the UPDATE STATS button
            }
            else { e.Row.Cells[10].Controls[0].Visible = false; } //10th column contains the UPDATE STATS button
        }
    }

    protected void GridView_Totals_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        //shows the messgae box but too late
        //MessageBox.Show("Reliability stats will now update.  This may take a few minutes.");
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        if (this.FormView_Insert_Random.Visible == false)
        {
            this.FormView_Insert_Random.Visible = true;
            this.FormView_Insert_single.Visible = true;
            this.Button1.Text = "Hide Insert controls";
        }
        else
        {
            this.FormView_Insert_Random.Visible = false;
            this.FormView_Insert_single.Visible = false;
            this.Button1.Text = "Insert new reliabilities";
        }



    }
}



public class MessageBox
{
    private static Hashtable m_executingPages = new Hashtable();

    private MessageBox() { }

    public static void Show(string sMessage)
    {
        // If this is the first time a page has called this method then
        if (!m_executingPages.Contains(HttpContext.Current.Handler))
        {
            // Attempt to cast HttpHandler as a Page.
            Page executingPage = HttpContext.Current.Handler as Page;

            if (executingPage != null)
            {
                // Create a Queue to hold one or more messages.
                Queue messageQueue = new Queue();

                // Add our message to the Queue
                messageQueue.Enqueue(sMessage);

                // Add our message queue to the hash table. Use our page reference
                // (IHttpHandler) as the key.
                m_executingPages.Add(HttpContext.Current.Handler, messageQueue);

                // Wire up Unload event so that we can inject 
                // some JavaScript for the alerts.
                executingPage.Unload += new EventHandler(ExecutingPage_Unload);
            }
        }
        else
        {
            // If were here then the method has allready been 
            // called from the executing Page.
            // We have allready created a message queue and stored a
            // reference to it in our hastable. 
            Queue queue = (Queue)m_executingPages[HttpContext.Current.Handler];

            // Add our message to the Queue
            queue.Enqueue(sMessage);
        }
    }


    // Our page has finished rendering so lets output the
    // JavaScript to produce the alert's
    private static void ExecutingPage_Unload(object sender, EventArgs e)
    {
        // Get our message queue from the hashtable
        Queue queue = (Queue)m_executingPages[HttpContext.Current.Handler];

        if (queue != null)
        {
            StringBuilder sb = new StringBuilder();

            // How many messages have been registered?
            int iMsgCount = queue.Count;

            // Use StringBuilder to build up our client slide JavaScript.
            sb.Append("<script language='javascript'>");

            // Loop round registered messages
            string sMsg;
            while (iMsgCount-- > 0)
            {
                sMsg = (string)queue.Dequeue();
                sMsg = sMsg.Replace("\n", "\\n");
                sMsg = sMsg.Replace("\"", "'");
                sb.Append(@"alert( """ + sMsg + @""" );");
            }

            // Close our JS
            sb.Append(@"</script>");

            // Were done, so remove our page reference from the hashtable
            m_executingPages.Remove(HttpContext.Current.Handler);

            // Write the JavaScript to the end of the response stream.
            HttpContext.Current.Response.Write(sb.ToString());
        }
    }
}
