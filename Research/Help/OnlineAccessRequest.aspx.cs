using System;
using System.Collections;
using System.ComponentModel;
using System.Configuration;
using System.Data;
using System.Drawing;
using System.Web;
using System.Net;
using System.Net.Mail;
using System.Web.SessionState;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;

using AutismCenterBase.Utilities;

namespace Help
{
	public partial class OnlineAccessRequest : System.Web.UI.Page
	{
		private void Page_Load(object sender, System.EventArgs e)
		{
			if (!IsPostBack)
			{
				HttpCookie oCookie = Request.Cookies["UserProfile"];
				txtDateRequired.Text = DateTime.Today.AddDays(7).ToString("MM/dd/yyyy");

				if (oCookie != null)
				{
					txtRequestor.Text = oCookie.Values["StaffShortName"].ToString();
					txtEmailAddress.Text = oCookie.Values["EmailAddress"].ToString();
					txtPhoneNumber.Text = oCookie.Values["PhoneNumber"].ToString();
				}
			}
		}

		protected void SendMail(object sender, EventArgs e)
		{
			string sError = "";
			string sName = txtRequestor.Text;
			string sEmailAddress = txtEmailAddress.Text;
			string sPhoneNumber = txtPhoneNumber.Text;
			string sAccessFor = txtAccessFor.Text;
			string sDateRequired = txtDateRequired.Text;
			string sSupervisor = txtSupervisor.Text;
			string sTypeOfAccess = txtTypeOfAccess.Text;
			string sComments = txtComments.Text;

			MailMessage oMail = new MailMessage(sEmailAddress, ConfigurationManager.AppSettings["ONLINE_ACCESS_REQUEST_EMAIL"]);
            SmtpClient oSmtp = new SmtpClient("smtp.washington.edu");

			oSmtp.UseDefaultCredentials = false;
			//oSmtp.Credentials = new NetworkCredential("seactsa", "3pULderp#");
            oSmtp.Credentials = new NetworkCredential(ConfigurationManager.AppSettings["EmailCredentialUserName"],
                ConfigurationManager.AppSettings["EmailCredentialPassword"]);
            oSmtp.DeliveryMethod = SmtpDeliveryMethod.Network;
			oSmtp.EnableSsl = true;
			oSmtp.Timeout = 100000;

			oMail.Subject = "WEB REQUEST: Online Access";
			oMail.Body += "Requestor: " + sName + "\n\n";
			oMail.Body += "Phone Number: " + sPhoneNumber + "\n\n";
			oMail.Body += "Access For: " + sAccessFor + "\n\n";
			oMail.Body += "Supervisor: " + sSupervisor + "\n\n";
			oMail.Body += "Date Required: " + sDateRequired + "\n\n";
			oMail.Body += "Type of Access: " + sTypeOfAccess + "\n\n";
			oMail.Body += "Comments:\n" + sComments;

			try
			{
				oSmtp.Send(oMail);
			}
			catch (Exception oErr)
			{
				sError = "There was an error processing your request: " + oErr.Source + " " + oErr.Message;
			}

			tblMaster.Rows.Clear();
			tblMaster.Attributes["class"] = "";
			HtmlTableRow oTr;
			HtmlTableCell oTd;

			if (sError != "")
			{
				oTr = new HtmlTableRow();
				oTd = new HtmlTableCell();
				oTd.InnerHtml = "<span class=\"\">" + sError + "</span>";
				oTr.Cells.Add(oTd);
				tblMaster.Rows.Add(oTr);
			}
			else
			{
				oTr = new HtmlTableRow();
				oTd = new HtmlTableCell();
				oTd.InnerHtml = "Your request has been sent.";
				oTr.Cells.Add(oTd);
				tblMaster.Rows.Add(oTr);
			}
		}
	}
}