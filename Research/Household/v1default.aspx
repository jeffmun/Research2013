<%@ Page Language="C#" MasterPageFile="~/UWAC.master" AutoEventWireup="true"  CodeFile="v1default.aspx.cs" Inherits="Household._default" %>
<%@ MasterType VirtualPath="~/UWAC.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="oBodyPlaceHolder" runat="server">

<table cellspacing="0" class="tblInput" id="tblInput" runat="server">
	<tr class="trTitle">
		<td colspan="2">Find Persons/Households</td>
	</tr>
	<tr>
		<td style="width: 50%;">
			<asp:Label AssociatedControlID="txtLastName" runat="server">Last Name</asp:Label><br/>
			<asp:TextBox ID="txtLastName" runat="server" style="width: 200px;" />
		</td>
		<td style="width: 50%;">
			<asp:Label AssociatedControlID="txtFirstName" runat="server">First Name</asp:Label><br/>
			<asp:TextBox ID="txtFirstName" runat="server" style="width: 200px;" />
		</td>
	</tr>
	<tr>
		<td style="width: 50%;">
			<asp:Label AssociatedControlID="txtSubjectID" runat="server">Subject ID</asp:Label><br/>
			<asp:TextBox ID="txtSubjectID" runat="server" style="width: 200px;" />
		</td>
		<td style="width: 50%;">
			<asp:Label AssociatedControlID="selStudyID" runat="server">Study</asp:Label><br/>
			<asp:DropDownList id="selStudyID" runat="server"  Font-Names="Courier New"  />
		</td>
	</tr>
	<tr>
		<td style="width: 50%;">
			<asp:Label AssociatedControlID="selSex" runat="server">Sex</asp:Label><br/>
			<asp:DropDownList ID="selSex" runat="server" style="width: 200px;">
				<asp:ListItem Text="--Select Gender--" Value="-1" />
				<asp:ListItem Text="Male" Value="M" />
				<asp:ListItem Text="Female" Value="F" />
			</asp:DropDownList>
		</td>
		<td style="width: 50%;">
			<asp:Label AssociatedControlID="selEthnicity" runat="server">Ethnicity</asp:Label><br/>
			<asp:DropDownList id="selEthnicity" runat="server"></asp:DropDownList>
		</td>
	</tr>
	<tr>
		<td style="width: 50%;">
			<asp:Label AssociatedControlID="selState" runat="server">Locale</asp:Label><br/>
			<asp:DropDownList id="selState" runat="server"></asp:dropdownlist>
		</td>
		<td style="width: 50%;">
			<asp:Label AssociatedControlID="txtCity" runat="server">City</asp:Label><br/>
			<asp:TextBox ID="txtCity" runat="server" style="width: 200px;" />
		</td>
	</tr>
	<tr>
		<td colspan="2">
			<input type="submit" name="btnSubmit" value=" Submit " />
			
			<%--DF: 4/9 add app path--%>
			<%--<input type="button" name="btnAddNew" value="Create New Household" onclick="document.location = '/Household/CreateHousehold.aspx?HouseholdID=0';" />--%>
		    <input type="button" name="btnAddNew" value="Create New Household" onclick="document.location = '<% =Request.ApplicationPath %>/Household/CreateHousehold.aspx?HouseholdID=0';" />
		</td>
	</tr>
</table>

<asp:DataGrid	ID="tblResults"
				runat="server"
				CssClass="tblReport"
				GridLines="None"
				AutoGenerateColumns="False"
				style="display: none;"
				OnItemDataBound="Item_Bound">
	<HeaderStyle CssClass="trHeader" />
	<Columns>
	<%--DF: 4/9 added ~ --%>
		<asp:HyperLinkColumn HeaderText="&nbsp;" DataNavigateUrlFormatString="~/Household/EditHousehold.aspx?HouseholdID={0}" DataNavigateUrlField="HouseholdID" Text="Edit" />
		<asp:HyperLinkColumn HeaderText="Household Name" DataNavigateUrlFormatString="~/Household/ViewHousehold.aspx?HouseholdID={0}" DataNavigateUrlField="HouseholdID" DataTextField="HouseholdName" />
		<asp:BoundColumn HeaderText="Person Name" DataField="FullName" />
		<asp:BoundColumn HeaderText="DOB" DataField="DOB" />
		<asp:BoundColumn HeaderText="Gender" DataField="Sex" />
		<asp:BoundColumn HeaderText="Locality" DataField="State" />
		<asp:BoundColumn HeaderText="# Studies" DataField="StudyCount" />
		<asp:HyperLinkColumn HeaderText="&nbsp;" DataNavigateUrlFormatString="~/Measures/ActionsByHousehold.aspx?HouseholdID={0}" DataNavigateUrlField="HouseholdID" Text="Actions" />
		<asp:HyperLinkColumn HeaderText="&nbsp;" DataNavigateUrlFormatString="~/Household/AppendLog.aspx?HouseholdID={0}" DataNavigateUrlField="HouseholdID" Text="Append Log" />
		<asp:HyperLinkColumn HeaderText="&nbsp;" DataNavigateUrlFormatString="~/Household/CreateSubject.aspx?PersonID={0}" DataNavigateUrlField="PersonID" Text="Create Subject" />
	</Columns>
</asp:DataGrid>

</asp:Content>