<%@ Page Language="C#" MasterPageFile="~/UWAC.master" AutoEventWireup="true" 
CodeFile="ChangeMeasActionAssignments.aspx.cs" 
Inherits="Measures_ChangeMeasActionAssignments" Title="Move Measure" %>
<asp:Content ID="Content1" ContentPlaceHolderID="oBodyPlaceHolder" Runat="Server">

<table cellspacing="0" class="tblInput">
	<tr class="trTitle">
		<td id="tdTitle" runat="server">Change Measure/Action Assignment</td>
	</tr>
	<tr>
		<td id="tdMessage" runat="server"></td>
	</tr>
	<tr>
		<td>
			<label for="selActionID">Assigned to Action</label><br/>
			<asp:DropDownList ID="selActionID" Runat="server" />
		</td>
	</tr>
	<tr>
		<td>
			<input type="submit" name="btnSubmit" value=" Save Changes " />
			<input type="button" name="btnReturn" value=" Return to Edit Measure " id="btnReturn" runat="server" />
			<input type="hidden" name="hidStudyMeasSubjID" id="hidStudyMeasSubjID" runat="server" />
		</td>
	</tr>
</table>

</asp:Content>

