<%@ Page Language="c#" Debug="true" MasterPageFile="~/UWAC.master" CodeFile="EditHousehold.aspx.cs" Inherits="Household.EditHousehold" %>
<%@ MasterType VirtualPath="~/UWAC.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="oBodyPlaceHolder" runat="server">

<table cellspacing="0" class="tblInput" id="tblMaster" runat="server" style="width: 100%">
	<tr class="trTitle">
		<td colspan="2" id="tdTitle" runat="server"></td>
	</tr>
	<tr>
		<td>
			<label for="txtHouseholdName">Household Name</label><br/>
			<input type="text" name="txtHouseholdName" id="txtHouseholdName" runat="server" />
			<input type="hidden" name="hidHouseholdID" id="hidHouseholdID" runat="server" />
		</td>
		<td align="right">
			<input type="button" name="btnMainHouseholdPage" id="btnMainHouseholdPage" value="Return to Household View" style="margin: 5px;" runat="server" />
		</td>
	</tr>
	<tr>
	  <td colspan="2" id="tdNDARNote"><span style="color:Red">* Starred items are required by the National Database for Autism Research (NDAR).</span></td>
	</tr>
	<tr>
		<td colspan="2" id="tdPersons" runat="server"></td>
	</tr>
	<tr>
		<td id="tdPhoneNumber" runat="server" style="width: 60%;"></td>
		<td id="tdAddress" runat="server" style="width: 40%;"></td>
	</tr>
	<tr>
		<td colspan="2">
			<input type="submit" name="btnSubmit" value="Save Changes" style="width: 125px; margin: 5px;" />
			<input type="button" name="btnEditAddresses" id="btnEditAddresses" value="Edit Addresses" runat="server" style="width: 125px; margin: 5px;" /><br/>
			<input type="button" name="btnAddPerson" id="btnAddPerson" value="Add Person" onclick="AddPerson();" style="width: 175px; margin: 5px;" />
			<input type="button" name="btnAddPhoneNumber" id="btnAddPhoneNumber" value="Add Phone Number" onclick="AddPhoneNumber();" style="width: 225px; margin: 5px;" />
			<input type="button" name="btnAddEmailAddress" id="btnAddEmailAddress" value="Add Email Address" onclick="AddEmailAddress();" style="width: 225px; margin: 5px;" />
			<input type="hidden" name="hidMainContact" value="" />
		</td>
	</tr>
</table>
<span id="spnCalendar" runat="server"></span>

</asp:Content>