<%@ Page Language="C#" %>

<%
	string STUDYID = "1014";
	string surl;

	if (Request["ID"] != String.Empty && Request["ID"] != null)
		surl = Request.ApplicationPath + "/Applications/PhysGrowth/PhysGrowth.aspx?StudyID=" + STUDYID + "&ID="  + Request["ID"];
    else
		surl = Request.ApplicationPath + "/Applications/PhysGrowth/PhysGrowth.aspx?StudyID=" + STUDYID;

	Response.Redirect(surl, true);		
	


%>			
