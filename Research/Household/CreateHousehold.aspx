<%@ Page Language="c#" MasterPageFile="~/UWAC.master" CodeFile="CreateHousehold.aspx.cs" AutoEventWireup="True" Inherits="Household.CreateHousehold" %>
<%@ MasterType VirtualPath="~/UWAC.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="oBodyPlaceHolder" runat="server">

<table cellspacing="0" class="tblInput" id="tblMaster" runat="server">
	<tr class="trTitle">
		<td colspan="2">Create New Household</td>
	</tr>
	<tr>
		<td colspan="2">
			<label for="txtHouseholdName">Household Name</label><br/>
			<input type="text" name="txtHouseholdName" id="txtHouseholdName" />
		</td>
	</tr>
	<tr>
	  <td colspan="2" id="tdNDARNote"><span style="color:Red">* Starred items are required by the National Database for Autism Research (NDAR).</span></td>
	</tr>
	<tr>
		<td colspan="2">
		<table id="tblPersons" class="tblPersons" style="width: 100%;" cellspacing="0">
			<tr class="trTitle">
				<td colspan="5">Household's Main Contact</td>
			</tr>
			<tr>
				<td rowspan="3">
					<label for="radMainContact">Main</label><br/>
					<input type="radio" name="radMainContact" id="radMainContact" value="True" style="width: 20px;" checked="True" />
				</td>
				<td>
					<label for="txtFirstName">First Name</label><span style="color:Red">*</span><br/>
					<input type="hidden" name="hidPersonID" />
					<input type="text" name="txtFirstName" id="txtFirstName" style="width: 200px;" />
				</td>
				<td>
					<label for="txtLastName">Last Name</label><br/>
					<input type="text" name="txtLastName" id="txtLastName" style="width: 200px;" />
				</td>
				<td>
					<label for="txtNickName">Nick Name</label><br/>
					<input type="text" name="txtNickName" id="txtNickName" style="width: 200px;" />
				</td>
				<td>
					<label for="selSex">Sex</label><span style="color:Red">*</span><br/>
					<select name="selSex" id="selSex" style="width: 35px;">
						<option value="M">M</option>
						<option value="F">F</option>
					</select>
				</td>
			</tr>
			<tr>
				<td>
					<label for="txtMiddleName">Middle Name</label><span style="color:Red">*</span><br/>
					<input type="hidden" name="hidPersonID" />
					<input type="text" name="txtMiddleName" id="txtMiddleName" style="width: 200px;" />
				</td>
				<td>
					<label for="txtLastNameOnBC">Last Name on Birth Certificate</label><span style="color:Red">*</span><br/>
					<input type="text" name="txtLastNameOnBC" id="txtLastNameOnBC" style="width: 200px;" />
				</td>
				<td>
					<label for="txtCityOfBirth">City of Birth</label><span style="color:Red">*</span><br/>
					<input type="text" name="txtCityOfBirth" id="txtCityOfBirth" style="width: 200px;" />
				</td>
				<td>
					<label for="txtStateOfBirth">State of Birth</label><br/>
					<input type="text" name="txtStateOfBirth" id="txtStateOfBirth" style="width: 200px;" />
				</td>
			</tr>
			<tr>
				<td>
					<label for="txtDOB">DOB</label><span style="color:Red">*</span><br/>
					<input type="text" name="txtDOB" id="txtDOB" style="width: 175px;" />
					
					<%--DF: 4/9 converted to server tag, added ~ --%>
					<img runat="server" src="~/images/dlcalendar_2.gif" name="imgCalendar" style="margin-left: 4px;" />
				</td>
				<td>
					<label for="selRace">Race</label><br/>
					<asp:DropDownList id="selRace" runat="server" style="width: 200px;" />
				</td>
				<td>
					<label for="selEthnicity">Ethnicity</label><br/>
					<asp:DropDownList id="selEthnicity" runat="server" style="width: 200px;" />
				</td>
				<td>
					<label for="selRole">Role</label><br/>
					<asp:DropDownList id="selRole" runat="server" />
				</td>
			</tr>
		</table>
		</td>
	</tr>
	<tr>
		<td style="width: 50%;">
		<table cellspacing="0" class="tblPersons" style="width: 100%;" id="tblPhoneNumber">
			<tr class="trHeader">
				<td>Phone #</td>
				<td>Type</td>
				<td>Notes</td>
			</tr>
			<tr>
				<td style="width: 20%;"><input type="text" name="txtPhoneNumber" id="txtPhoneNumber" /></td>
				<td style="width: 20%;"><input type="text" name="txtPhoneNumberType" id="txtPhoneNumberType" /></td>
				<td><textarea rows="1" name="txtPhoneNumberNotes" style="width: 100%;" id="txtPhoneNumberNotes"></textarea></td>
			</tr>
		</table><br/>
		<table cellspacing="0" class="tblPersons" style="width: 100%;" id="tblEmailAddress">
			<tr class="trHeader">
				<td>Email</td>
				<td>Type</td>
				<td>Notes</td>
			</tr>
			<tr>
				<td style="width: 20%;"><input type="text" name="txtEmailAddress" id="txtEmailAddress" /></td>
				<td style="width: 20%;"><input type="text" name="txtEmailAddressType" id="txtEmailAddressType" /></td>
				<td><textarea rows="1" name="txtEmailAddressNotes" style="width: 100%;" id="txtEmailAddressNotes"></textarea></td>
			</tr>
		</table>
		</td>
		<td style="width: 50%;">
		<table cellspacing="0" class="tblPersons" style="width: 100%; border: solid 1px #26044a;" id="tblEmergency">
			<tr class="trHeader">
				<td colspan="2">Emergency Contact Info.</td>
			</tr>
			<tr>
				<td style="text-align: right; width: 30%; font-weight: bold; border: 0px;">Name</td>
				<td style="border: 0px;"><input type="text" name="txtEmerFirstName" style="width: 45%;" id="txtEmerFirstName" />&nbsp;<input type="text" name="txtEmerLastName" style="width: 45%;" id="txtEmerLastName" /></td>
			</tr>
			<tr>
				<td style="text-align: right; width: 30%; font-weight: bold; border: 0px;">Relationship</td>
				<td style="border: 0px;"><input type="text" name="txtRelationship" style="width: 100%;" id="txtRelationship" /></td>
			</tr>
			<tr>
				<td style="text-align: right; width: 30%; font-weight: bold; border: 0px;">Phone 1</td>
				<td style="border: 0px;"><input type="text" name="txtPhone1" style="width: 100%;" id="txtPhone1" /></td>
			</tr>
			<tr>
				<td style="text-align: right; width: 30%; font-weight: bold; border: 0px;">Phone 2</td>
				<td style="border: 0px;"><input type="text" name="txtPhone2" style="width: 100%;" id="txtPhone2" /></td>
			</tr>
			<tr>
				<td style="text-align: right; width: 30%; font-weight: bold; border: 0px;">Address 1</td>
				<td style="border: 0px;"><input type="text" name="txtAddress" style="width: 100%;" id="txtAddress" /></td>
			</tr>
			<tr>
				<td style="text-align: right; width: 30%; font-weight: bold; border: 0px;">City</td>
				<td style="border: 0px;"><input type="text" name="txtCity" style="width: 100%;" id="txtCity" /></td>
			</tr>
			<tr>
				<td style="text-align: right; width: 30%; font-weight: bold; border: 0px;">State</td>
				<td style="border: 0px;"><asp:DropDownList style="width: 100%;" id="selState" runat="server" /></td>
			</tr>
			<tr>
				<td style="text-align: right; width: 30%; font-weight: bold; border: 0px;">Postal Code</td>
				<td style="border: 0px;"><input type="text" name="txtZip" style="width: 100%;" id="txtZip" /></td>
			</tr>
			<tr>
				<td style="text-align: right; width: 30%; font-weight: bold; border: 0px;">Notes</td>
				<td style="border: 0px;"><textarea rows="2" name="txtEmergencyNotes" style="width: 100%;" id="txtEmergencyNotes"></textarea></td>
			</tr>
		</table>
		</td>
	</tr>
	<tr>
		<td colspan="2">
			<input type="submit" name="btnSubmit" value=" Submit " />
		</td>
	</tr>
</table>
<dlcalendar click_element_id="imgCalendar" input_element_id="txtDOB"></dlcalendar>

</asp:Content>