<%@ Page Language="c#"  Debug="true" MasterPageFile="~/UWAC.master" CodeFile="CreateSubject.aspx.cs" AutoEventWireup="True" Inherits="Household.CreateSubject" %>
<%@ MasterType VirtualPath="~/UWAC.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="oBodyPlaceHolder" runat="server">

<table cellspacing="0" class="tblInput" id="tblMaster" runat="server">
	<tr class="trTitle">
		<td colspan="2" id="tdTitle" runat="server">Create Subject: </td>
	</tr>
	<tr>
		<td colspan="2">
			<label for="txtPersonName">Person Name:</label><br/>
			<input type="text" name="txtPersonName" readonly="true" style="width: 450px;" id="txtPersonName" runat="server" />
			<input type="hidden" name="hidPersonID" id="hidPersonID" runat="server" />
		</td>
	</tr>
	<tr>
		<td colspan="2">
			<label for="selStudyID">Study:</label><br/>
			<asp:DropDownList id="selStudyID" runat="server" style="width: 450px;" autopostback="true"              OnSelectedIndexChanged="LoadGroups" />
		<%--OnChange="DoSyncDropDowns(this.options[this.selectedIndex].value, null, 'group', 'selGroupID'); DisplayMaxID(this.options[this.selectedIndex].value);"--%>
        </td>
	</tr>
	<tr>
		<td  colspan="2">

        <br />
            <label for="selGroupID">Group:</label>
<%--			<select name="selGroupID" id="selGroupID" style="width: 450px;">
				<option value="-1">--Select a Group--</option>
			</select>--%>
        <br />
            <asp:DropDownList ID="ddlGroupID" runat="server">
            </asp:DropDownList>
<%--            <asp:Button ID="ddlLoadGroups" runat="server" Text="Load Groups" OnClick="LoadGroups" />--%>
		</td>
	</tr>
	<tr>
		<td  style="vertical-align:top">
			<label for="txtSubjectID">Subject ID:</label><br/>
			<input type="text" name="txtSubjectID" style="width: 250px;" id="txtSubjectID" runat="server" />
			<span id="spnMaxID"></span>
			<span id="spnJS" runat="server"></span>
		</td>
        <td align="left" style="vertical-align:top">
            <asp:Panel ID="Panel_maxID" runat="server">
            </asp:Panel>
        </td>
	</tr>
	<tr>
		<td colspan="2">
			<%--<input type="submit" name="btnSubmit" value="Create Subject" id="btnSubmit" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;--%>
            <asp:Button ID="Button1" runat="server" Text="Create Subject" OnClick="MovePersonIntoStudy" />
		</td>
	</tr>
</table>
   <br />
   <br />
    <asp:Label ID="lblInfo" runat="server" Text=""></asp:Label>
</asp:Content>