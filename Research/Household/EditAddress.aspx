<%@ Page Language="c#" MasterPageFile="~/UWAC.master" CodeFile="EditAddress.aspx.cs" AutoEventWireup="True" Inherits="Household.EditAddress" %>
<%@ MasterType VirtualPath="~/UWAC.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="oBodyPlaceHolder" runat="server">

<table cellspacing="0" class="tblInput" id="tblMaster" runat="server">
	<tr class="trTitle">
		<td id="tdTitle" runat="server"></td>
	</tr>
	<tr>
		<td id="tdAddress" runat="server" style="text-align: center;"></td>
	</tr>
	<tr>
		<td>
			<input type="submit" name="btnSubmit" value="Save Changes" />
			<input type="hidden" name="hidHouseholdID" id="hidHouseholdID" runat="server" />
            <asp:Label ID="lbl_hidAddressID" runat="server" Text="" Visible="false" ForeColor="SkyBlue"></asp:Label>
			<input type="hidden" name="hidAddressID" id="hidAddressID" runat="server" />
			<input type="button" name="btnBack" value="Back to Household Page" id="btnBack" runat="server" />
			<input type="button" name="btnAddAddress" value="Add New Address" id="btnAddAddress" onclick="AddNewAddress()" style="width: 200px;" />
		</td>
	</tr>
</table>
<span id="spnScript" runat="server"></span>

</asp:Content>