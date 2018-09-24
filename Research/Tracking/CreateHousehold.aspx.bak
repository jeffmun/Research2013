
<%@ Page Language="C#" Debug="true"  MasterPageFile="~/UWAC.master"  AutoEventWireup="true" CodeFile="CreateHousehold.aspx.cs" Inherits="Tracking_CreateHousehold" 
	 EnableEventValidation="false" Title="Create Household"%>
 <%@ MasterType VirtualPath="~/UWAC.master" %>

<%@ Register Assembly="DevExpress.Web.v17.2, Version=17.2.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<asp:Content ID="HeadContent" runat="server" ContentPlaceHolderID="headContent" Visible="true">
	<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css"  />
	<%--<script type='text/javascript' src='https://code.jquery.com/ui/1.12.1/jquery-ui.min.js' ></script> --%>

	<script type="text/javascript" src="<% =HttpContext.Current.Request.Url.GetLeftPart(UriPartial.Authority) + HttpContext.Current.Request.ApplicationPath %>/js/jquery-1.9.0.min.js"></script>
	<script type="text/javascript" src="<% =HttpContext.Current.Request.Url.GetLeftPart(UriPartial.Authority) + HttpContext.Current.Request.ApplicationPath %>/js/jquery-ui.min.js"></script>


</asp:Content>

<asp:Content ID="Content1"  ContentPlaceHolderID="oBodyPlaceHolder" runat="server" >
		<asp:ScriptManager ID="ScriptManager1" runat="server" EnablePageMethods="true"  EnablePartialRendering="true"></asp:ScriptManager>

<script type="text/javascript">
	function onNameValidation(s, e) {
		var name = e.value;
		if (name == null)
			return;
		if (name.length < 2)
			e.isValid = false;
	}
</script>



	<br />
	<h4>Create New Household</h4>
	<br />
	Enter new household name:
				<dx:ASPxTextBox runat="server" EnableClientSideAPI="True" Width="300px" ID="NameTextBox" EncodeHtml="false"
					ClientInstanceName="Name" OnValidation="NameTextBox_Validation" >
					<ValidationSettings SetFocusOnError="True" ErrorText="Name must be at least <br /> two characters long" Display="Dynamic" ErrorTextPosition="Bottom">
						<RequiredField IsRequired="True" ErrorText="Name is required" />
					</ValidationSettings>
					<ClientSideEvents Validation="onNameValidation" />
					<InvalidStyle BackColor="LightPink" />
				</dx:ASPxTextBox>

	<br />

	<dx:ASPxButton ID="btnCreate" runat="server"  Text="Submit"></dx:ASPxButton>


</asp:Content>