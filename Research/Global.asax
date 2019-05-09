<%@ Application Language="C#" %>

<script runat="server">

	void Application_Start(object sender, EventArgs e)
	{
		// Code that runs on application startup

	}

	void Application_End(object sender, EventArgs e)
	{
		//  Code that runs on application shutdown

	}

	//void Application_Error(object sender, EventArgs e)
	//{
	//    // Code that runs when an unhandled error occurs

	//}

	void Session_Start(object sender, EventArgs e)
	{
		// Code that runs when a new session is started

	}

	void Session_End(object sender, EventArgs e)
	{
		// Code that runs when a session ends. 
		// Note: The Session_End event is raised only when the sessionstate mode
		// is set to InProc in the Web.config file. If session mode is set to StateServer 
		// or SQLServer, the event is not raised.

	}

	protected void Application_PreRequestHandlerExecute(object sender, System.EventArgs e) {
		Page page = HttpContext.Current.CurrentHandler as Page;
		if (page != null) {
			page.PreInit += new EventHandler(page_PreInit);
		}
	}

	void page_PreInit(object sender, EventArgs e) {
		Page page = HttpContext.Current.CurrentHandler as Page;
		if (page != null && page.Request.Cookies["theme"] != null)
		{
			DevExpress.Web.ASPxWebControl.GlobalTheme = page.Request.Cookies["theme"].Value;
		}
	}


	// Code that runs when an unhandled error occurs
	void Application_Error(object sender, EventArgs e)
	{
		// Get the error details
		HttpException lastErrorWrapper =
			Server.GetLastError() as HttpException;

		Exception lastError = lastErrorWrapper;
		if (lastErrorWrapper.InnerException != null)
			lastError = lastErrorWrapper.InnerException;

		string lastErrorTypeName = lastError.GetType().ToString();
		string lastErrorMessage = lastError.Message;
		string lastErrorStackTrace = lastError.StackTrace;

		const string ToAddress = "jeffmun@uw.edu";
		const string FromAddress = "authelp@u.washington.edu";
		const string Subject = "UWAC DB ERROR!";

		string user = HttpContext.Current.User.Identity.Name;

		string user_netid = String.Format("{0}@uw.edu",user.Replace(@"NETID\", ""));

		////
		System.Net.Mail.MailMessage msg = new System.Net.Mail.MailMessage(FromAddress, ToAddress);

		msg.Subject = Subject;
		msg.CC.Add(user_netid);
		msg.IsBodyHtml = true;
		msg.Priority = System.Net.Mail.MailPriority.High;
		msg.Body = string.Format(@"
			<html>
			<body>
			  <h1>An Error Has Occurred!</h1>
			  <table cellpadding=""5"" cellspacing=""0"" border=""1"">
			  <tr>
			  <tdtext-align: right;font-weight: bold"">URL:</td>
			  <td>{0}</td>
			  </tr>
			  <tr>
			  <tdtext-align: right;font-weight: bold"">User:</td>
			  <td>{1}</td>
			  </tr>
			  <tr>
			  <tdtext-align: right;font-weight: bold"">Exception Type:</td>
			  <td>{2}</td>
			  </tr>
			  <tr>
			  <tdtext-align: right;font-weight: bold"">Message:</td>
			  <td>{3}</td>
			  </tr>
			  <tr>
			  <tdtext-align: right;font-weight: bold"">Stack Trace:</td>
			  <td>{4}</td>
			  </tr> 
			  </table>
			</body>
			</html>",
			Request.RawUrl,
			user,
			lastErrorTypeName,
			lastErrorMessage,
			lastErrorStackTrace.Replace(Environment.NewLine, "<br />"));

		// Attach the Yellow Screen of Death for this error   
		string YSODmarkup = lastErrorWrapper.GetHtmlErrorMessage();
		if (!string.IsNullOrEmpty(YSODmarkup))
		{
			System.Net.Mail.Attachment YSOD =
				System.Net.Mail.Attachment.CreateAttachmentFromString(YSODmarkup, "YSOD.htm");
			msg.Attachments.Add(YSOD);
		}

		// Send the email


		System.Net.Mail.SmtpClient smtp = new System.Net.Mail.SmtpClient();
		//smtp.Host = "smtp.gmail.com";
		//NetworkCredential networkCredential = new NetworkCredential("jeffmunson@gmail.com", "swerty!1");
		smtp.Host = "smtp.uw.edu";
		System.Net.NetworkCredential networkCredential = new System.Net.NetworkCredential("jeffmun@u.washington.edu", "0987!@KLm");
		smtp.EnableSsl = true;
		smtp.UseDefaultCredentials = true;
		smtp.Credentials = networkCredential;
		smtp.Port = 587;
		smtp.Send(msg);


		smtp.Dispose();
		msg.Dispose();



	}


</script>
