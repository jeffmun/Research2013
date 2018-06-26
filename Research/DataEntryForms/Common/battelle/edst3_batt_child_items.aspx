
<%--

The batt-soc-child has it's own studymeasid (309) for tracking purposes.
However, child items should be added to the same record as the batt-soc (studymeasid=190).

This page redirects requests for the child battelle to the battelle page using 
the correct studymeasid of 190.

--%>
<script  language="C#" runat="server">
private void Page_Load(object sender, System.EventArgs e)
{
	if (Request["id"] != string.Empty && Request["id"] != null)
		Response.Redirect("battelle.aspx?id=" + Request["id"] + "&studymeasid=190&indexnum=1", true);
	else
		Response.Redirect("battelle.aspx", true);
}

</script>
