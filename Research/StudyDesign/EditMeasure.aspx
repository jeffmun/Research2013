<%@ Page Language="C#" MasterPageFile="~/UWAC.master" CodeFile="EditMeasure.aspx.cs" Inherits="StudyDesign.EditMeasure" %>
<%@ MasterType VirtualPath="~/UWAC.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="oBodyPlaceHolder" runat="server">

<table cellspacing="0" class="tblInput" id="tblMaster" runat="server">
	<tr class="trTitle">
		<td>
			Edit Measure Information
		</td>
	</tr>
	<tr>
		<td id="tdError" runat="server" style="display: none;"></td>
	</tr>
	<tr>
		<td>
			<label for="selMeasureID">Measure</label><br/>
			<asp:DropDownList ID="selMeasureID" Runat="server" style="width: 600px;" OnSelectedIndexChanged="GetMeasureInfo" AutoPostBack="True" />
		</td>
	</tr>
	<tr>
		<td>
			<a id="oLink" runat="server"></a>
		</td>
	</tr>
	<tr>
		<td style="padding-left: 0px; padding-bottom: 0px; padding-right: 0px;">
		<table cellspacing="0">
			<tr>
				<td id="tdGeneral" style="background-color: #336699; border-right: solid 4px #efefef;"><a href="javascript:Measures_ChangeTab('<% =tblGeneral.ClientID %>', 'tdGeneral');">General Info.</a></td>
				<td id="tdAdminInfo" style="background-color: #a1b5cf; border-right: solid 4px #efefef;"><a href="javascript:Measures_ChangeTab('<% =tblAdminInfo.ClientID %>', 'tdAdminInfo');">Admin. Info.</a></td>
				<td id="tdAuthorInfo" style="background-color: #a1b5cf; border-right: solid 4px #efefef;"><a href="javascript:Measures_ChangeTab('<% =tblAuthorInfo.ClientID %>', 'tdAuthorInfo');">Author Info.</a></td>
				<td id="tdDocuments" style="background-color: #a1b5cf; border-right: solid 4px #efefef;"><a href="javascript:Measures_ChangeTab('<% =tblDocuments.ClientID %>', 'tdDocuments');">Documents</a></td>
				<td id="tdDataEntry" style="background-color: #a1b5cf; border-right: solid 4px #efefef;"><a href="javascript:Measures_ChangeTab('<% =tblDataEntry.ClientID %>', 'tdDataEntry');">Data Entry Info.</a></td>
			</tr>
		</table>
		</td>
	</tr>
	<tr>
		<td style="padding: 0px;">
		<table cellspacing="0" style="width: 100%;" id="tblGeneral" runat="server">
			<tr class="trTitle">
				<td colspan="2">General Info.</td>
			</tr>
			<tr>
				<td>
					<label for="txtMeasShortName">Measure Short Name</label><br/>
					<asp:TextBox ID="txtMeasShortName" Runat="server" style="width: 200px;" MaxLength="25" />
				</td>
				<td>
					<label for="txtMeasFullName">Measure Full Name</label><br/>
					<asp:TextBox ID="txtMeasFullName" Runat="server" style="width: 350px;" MaxLength="100" />
				</td>
			</tr>
			<tr>
				<td>
					<label for="selMeasCatID">Measure Category</label><br/>
					<asp:DropDownList ID="selMeasCatID" Runat="server" style="width: 200px;" />
				</td>
				<td>
					<label for="selStaffID">Staff Contact</label><br/>
					<asp:DropDownList ID="selStaffID" Runat="server" style="width: 200px;" />
				</td>
			</tr>
			<tr>
				<td>
					<label for="txtStartDate">Date Began Using</label><br/>
					<asp:TextBox ID="txtStartDate" Runat="server" style="width: 175px;" MaxLength="10" />
					<img src="<%= Request.ApplicationPath %>/images/dlcalendar_2.gif" id="imgCalendar1" alt="Select a Date" style="margin-left: 4px" />
				</td>
				<td>
					<label for="txtEndDate">Date End Using</label><br/>
					<asp:TextBox ID="txtEndDate" Runat="server" style="width: 175px;" MaxLength="10" />
					<img src="<%= Request.ApplicationPath %>/images/dlcalendar_2.gif" id="imgCalendar2" alt="Select a Date" style="margin-left: 4px" />
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<label for="txtNotes">Notes</label><br/>
					<asp:TextBox ID="txtNotes" Runat="server" TextMode="MultiLine" Rows="5" style="width: 550px;" />
				</td>
			</tr>
		</table>
		<table cellspacing="0" style="width: 100%;" id="tblAdminInfo" runat="server">
			<tr class="trTitle">
				<td colspan="2">Admin Info.</td>
			</tr>
			<tr>
				<td>
					<label for="selMeasRespondentID">Respondent</label><br/>
					<asp:DropDownList ID="selMeasRespondentID" Runat="server" style="width: 200px;" />
				</td>
				<td>
					<label for="selFocusPerson">Focus Person</label><br/>
					<asp:DropDownList ID="selFocusPerson" Runat="server" style="width: 200px;" />
				</td>
			</tr>
			<tr>
				<td>
					<label for="selMethodID">Admin. Method</label><br/>
					<asp:DropDownList ID="selMethodID" Runat="server" style="width: 200px;" />
				</td>
				<td>
					<label for="txtAdminTime">Admin. Time (min.)</label><br/>
					<asp:TextBox ID="txtAdminTime" Runat="server" style="width: 200px;" MaxLength="10" />
				</td>
			</tr>
		</table>
		<table cellspacing="0" style="width: 100%;" id="tblAuthorInfo" runat="server">
			<tr class="trTitle">
				<td>Author Info.</td>
			</tr>
			<tr>
				<td>
					<label for="txtDescription">Description</label><br/>
					<asp:TextBox ID="txtDescription" Runat="server" TextMode="MultiLine" Rows="10" style="width: 550px;" />
				</td>
			</tr>
			<tr>
				<td>
					<label for="txtCitation">Citation</label><br/>
					<asp:TextBox ID="txtCitation" Runat="server" TextMode="MultiLine" Rows="10" style="width: 550px;" />
				</td>
			</tr>
			<tr>
				<td>
					<label for="txtCopyright">Copyright</label><br/>
					<asp:TextBox ID="txtCopyright" Runat="server" TextMode="MultiLine" Rows="10" style="width: 550px;" />
				</td>
			</tr>
			<tr>
				<td>
					<label for="txtOrdering">Ordering Info.</label><br/>
					<asp:TextBox ID="txtOrdering" Runat="server" TextMode="MultiLine" Rows="10" style="width: 550px;" />
				</td>
			</tr>
		</table>
		<table cellspacing="0" style="width: 100%;" id="tblDocuments" runat="server">
			<tr class="trTitle">
				<td colspan="4">Associated Documents</td>
			</tr>
			<tr>
				<td class="tdHeaderAlt">Document Name</td>
				<td class="tdHeaderAlt">Document Type</td>
				<td class="tdHeaderAlt">Document Status</td>
				<td class="tdHeaderAlt">Uploaded By</td>
			</tr>
		</table>
		<table cellspacing="0" style="width: 100%;" id="tblDataEntry" runat="server">
			<tr class="trTitle">
				<td colspan="2">Data Entry Info.</td>
			</tr>
			<tr>
				<td>
					<label for="txtDEEstTime">DE Est. Time (minutes)</label><br/>
					<asp:TextBox ID="txtDEEstTime" Runat="server" style="width: 200px;" MaxLength="3" />
				</td>
				<td>
					<label for="txtDEScoringInfo">Scoring Info.</label><br/>
					<asp:TextBox ID="txtDEScoringInfo" Runat="server" TextMode="MultiLine" Rows="5" style="width: 400px;" />
				</td>
			</tr>
		</table>
		</td>
	</tr>
	<tr>
		<td style="border-top: solid 1px #336699;">
			<asp:Button ID="btnSubmit" Runat="server" Text="Save Changes" OnClick="UpdateMeasureInfo" />
			<input type="hidden" name="hidTab" id="hidTab" runat="server" />
		</td>
	</tr>
</table>

<dlcalendar click_element_id="imgCalendar1" input_element_id="<%= txtStartDate.ClientID%>"></dlcalendar>
<dlcalendar click_element_id="imgCalendar2" input_element_id="<%= txtEndDate.ClientID%>"></dlcalendar>

</asp:Content>