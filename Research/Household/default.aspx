<%@ Page Language="C#" MasterPageFile="~/UWAC.master" AutoEventWireup="true"  CodeFile="default.aspx.cs" Inherits="Household._default" %>
<%@ MasterType VirtualPath="~/UWAC.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="oBodyPlaceHolder" runat="server">

	<script type="text/javascript">
		function DoSubmitSearchHouseholds2()
		{
			var txtLastName = GetReferenceToASPNETControl('txtLastName');
			var txtFirstName = GetReferenceToASPNETControl('txtFirstName');
			var txtSubjectID = GetReferenceToASPNETControl('txtSubjectID');
			var selStudyID = GetReferenceToASPNETControl('selStudyID');
			var selState = GetReferenceToASPNETControl('selState');
			var txtCity = GetReferenceToASPNETControl('txtCity');
			var txtPhone = GetReferenceToASPNETControl('txtPhone');
			var sErr = '';

			if (IsBlank(txtLastName.value) && IsBlank(txtFirstName.value) &&
				selState.options[selState.selectedIndex].value == -1 && IsBlank(txtCity.value) &&
				IsBlank(txtSubjectID.value) && selStudyID.options[selStudyID.selectedIndex].value == -1 && IsBlank(txtPhone.value))
				sErr += 'You must enter one of the following:\n\n\t-Last Name\n\t-First Name\n\t-Study\n\t-Subject ID and Study\n\t-Locale\n\t-City\n\tPhone Number';

			//	if (!IsBlank(txtSubjectID.value) && selStudyID.options[selStudyID.selectedIndex].value == -1)
			//		sErr += 'If you search by Subject ID, you must select a Study.\n'; 

			if (!IsBlank(sErr))
			{
				alert(sErr);
				return false;
			}
			else
				return true;
		}

	</script>

<table cellspacing="0" class="tblInput" id="tblInput" runat="server">
	<tr class="trTitle">
		<td colspan="2">Find Persons/Households v.2</td>
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
			<asp:Label AssociatedControlID="txtSubjectID" runat="server">Subject ID</asp:Label><asp:Label ID="l2" runat="server" Text=" (partial matches now included)" Font-Italic="true" Font-Size="smaller" ForeColor="Gray" ></asp:Label><br/>
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
		<td style="width: 50%;">
			<asp:Label AssociatedControlID="txtPhone" runat="server">Phone Number</asp:Label><br/>
			<asp:TextBox id="txtPhone" runat="server"></asp:TextBox>
		</td>
		<td style="width: 50%;">
			
		</td>
	</tr>

	<tr>
		<td colspan="2">
			<input type="submit" name="btnSubmit" value=" Submit " />
		</td>
	</tr>
	<tr><td>
		<br /><br /> 
		<asp:Label ID="Label1" runat="server" Text="Results returned include only individuals who are in households that contain subjects you have permission to access." Font-Size="Smaller" Font-Italic="true"></asp:Label> 
		<br /><br /> 
		<asp:Label ID="lblNoResults" runat="server" Text="" Font-Size="Medium" ></asp:Label>
		<br />
		</td></tr>
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
		<asp:HyperLinkColumn HeaderText="Household Name" DataNavigateUrlFormatString="~/Tracking/Household2.aspx?hhID={0}" DataNavigateUrlField="HouseholdID" DataTextField="HouseholdName" />
		<asp:BoundColumn HeaderText="Person Name" DataField="FullName" />
		<asp:BoundColumn HeaderText="DOB" DataField="DOB" />
		<asp:BoundColumn HeaderText="Gender" DataField="Sex" />
		<asp:BoundColumn HeaderText="Locality" DataField="State" />
		<asp:BoundColumn HeaderText="# Studies" DataField="StudyCount" />
		<asp:BoundColumn HeaderText="min ID" DataField="ID1" />
		<asp:BoundColumn HeaderText="max ID" DataField="ID2" />
<%--		<asp:HyperLinkColumn HeaderText="&nbsp;" DataNavigateUrlFormatString="~/Measures/ActionsByHousehold.aspx?HouseholdID={0}" DataNavigateUrlField="HouseholdID" Text="Actions" />
		<asp:HyperLinkColumn HeaderText="&nbsp;" DataNavigateUrlFormatString="~/Household/AppendLog.aspx?HouseholdID={0}" DataNavigateUrlField="HouseholdID" Text="Append Log" />
		<asp:HyperLinkColumn HeaderText="&nbsp;" DataNavigateUrlFormatString="~/Household/CreateSubject.aspx?PersonID={0}" DataNavigateUrlField="PersonID" Text="Create Subject" />--%>
	</Columns>
</asp:DataGrid>

</asp:Content>