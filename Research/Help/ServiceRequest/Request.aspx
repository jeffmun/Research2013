<%@ Page Language="C#" MasterPageFile="~/UWAC.master" CodeFile="Request.aspx.cs" Inherits="Help.ServiceRequest.Request" %>
<%@ MasterType VirtualPath="~/UWAC.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="oBodyPlaceHolder" runat="server">

<asp:Label id="lblErrors" runat="server" style="width: 280px" ForeColor="Red" Visible="False"></asp:Label>
<table class="tblInput" cellspacing="0">
	<tr class="trTitle">
		<td colspan="2">Submit Service Request</td>
	</tr>
	<tr>
		<td><asp:Label id="lblRequestID" runat="server" style="width: 96px">Request ID:</asp:Label></td>
		<td><asp:TextBox id="txtRequestID" runat="server"></asp:TextBox></td>
	</tr>
	<tr>
		<td><asp:Label id="lblEditITPriority" runat="server">IT Priority:</asp:Label></td>
		<td><asp:DropDownList id="ddlEditITPriority" runat="server" style="width: 80px">
				<asp:ListItem Value="-1">Pending</asp:ListItem>
				<asp:ListItem Value="1">1</asp:ListItem>
				<asp:ListItem Value="2">2</asp:ListItem>
				<asp:ListItem Value="3">3</asp:ListItem>
				<asp:ListItem Value="4">4</asp:ListItem>
				<asp:ListItem Value="5">5</asp:ListItem>
			</asp:DropDownList></td>
	</tr>
	<tr>
		<td><asp:Label id="lblSubmitDate" runat="server" style="width: 120px">Submit Date:</asp:Label></td>
		<td><asp:TextBox id="txtSubmitDate" runat="server"></asp:TextBox></td>
	</tr>
	<tr>
		<td>Request from:</td>
		<td><asp:dropdownlist id="ddlRequestFrom" runat="server" style="width: 168px"></asp:dropdownlist></td>
	</tr>
	<tr>
		<td>Study:</td>
		<td>
			<asp:DropDownList id="ddlStudy" runat="server" style="width: 168px"></asp:DropDownList></td>
	</tr>
	<tr>
		<td>Feature Type:</td>
		<td><asp:dropdownlist id="ddlFeatureType" runat="server" style="width: 168px"></asp:dropdownlist></td>
	</tr>
	<tr>
		<td>Priority:</td>
		<td>
			<asp:DropDownList id="ddlPriority" runat="server" style="width: 152px"></asp:DropDownList>
			<p>
				<b>Critical</b> = Can't Accomplish any other way.<br/>
				<b>Important</b> = Current inefficient solution exists.<br/>
				<b>Nice</b> = Would be nice to have.
			</p>
		</td>
	</tr>
	<tr>
		<td>Description:</td>
		<td><asp:textbox id="txtDescription" runat="server" style="width: 568px" TextMode="MultiLine" Height="216px"></asp:textbox></td>
	</tr>
	<tr>
		<td><asp:Label id="lblStatus" runat="server" style="width: 88px">Status:</asp:Label></td>
		<td><asp:DropDownList id="ddlStatus" runat="server" style="width: 176px"></asp:DropDownList></td>
	</tr>
	<tr>
		<td><asp:Label id="lblAssignedTo" runat="server">Assigned To:</asp:Label></td>
		<td><asp:DropDownList id="ddlAssignedTo" runat="server" style="width: 120px"></asp:DropDownList></td>
	</tr>
	<tr>
		<td><asp:Label id="lblEstHours" runat="server" style="width: 120px">Estimated Hours:</asp:Label></td>
		<td><asp:TextBox id="txtEstHours" runat="server"></asp:TextBox></td>
	</tr>
	<tr>
		<td><asp:Label id="lblComments" runat="server">Comments:</asp:Label></td>
		<td><asp:TextBox id="txtComments" runat="server" style="width: 432px; height: 102px" TextMode="MultiLine"></asp:TextBox></td>
	</tr>
	<tr>
		<td colspan="2">
			<asp:Button id="btnSubmit" runat="server" Text="Submit"></asp:Button>
			<asp:Button id="btnCancel" runat="server" Text="Cancel"></asp:Button>
			<asp:Button id="btnViewList" runat="server" Text="View List"></asp:Button>
		</td>
	</tr>
</table>

</asp:Content>