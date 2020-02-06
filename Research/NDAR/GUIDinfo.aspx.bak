<%@ Page Language="c#" Debug="true" MasterPageFile="~/UWAC.master" CodeFile="GUIDinfo.aspx.cs" AutoEventWireup="true"
 Inherits="NDAR_GUIDinfo" Title="NDAR GUID Info" %>
 <%@ MasterType VirtualPath="~/UWAC.master" %>


<%@ Register Assembly="DevExpress.Web.v19.1, Version=19.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>


<asp:Content ID="Content1"  ContentPlaceHolderID="oBodyPlaceHolder" runat="server">
	<asp:ScriptManager ID="ScriptManager1" runat="server" EnablePartialRendering="true"></asp:ScriptManager>
 <script src="https://google-code-prettify.googlecode.com/svn/loader/run_prettify.js?lang=sql"></script>

  <table id="tblmyinfo" runat="server" width="100%">
 <tr><td ></td></tr>
 </table>

 <table>
	<tr>
		<td style="width:500px"  >
			<asp:Label ID="lblINTRO_studyname" runat="server" Text=" " Font-Size="Medium" Font-Bold="false"></asp:Label>
			<asp:Label ID="lblStudyname_ContentPage" runat="server" Text=" " Font-Size="Medium" Font-Bold="true"></asp:Label>
		</td>  
	</tr>
	<tr>
		<td></td>
		<td style="vertical-align:top">
			<asp:Button ID="btnDisplayGUIDFileInfo" runat="server" Text="Display File Info" OnClick="btnDisplayGUIDFileInfo_Click" />
			<asp:Button ID="btnCreateGUIDfile" runat="server" Text="Create File" OnClick="btnCreateGUIDfile_Click" Visible="false" />
			<br />
			<asp:Button ID="btnCancel" runat="server" Text="Cancel" OnClick="btnCancel_Click" ForeColor="DarkRed" Visible="false" />
			</td>
		<td style="vertical-align:top">
			<asp:RadioButtonList ID="rblMode" runat="server" >
				<asp:ListItem Value="new" Text="new GUID" Selected="True"></asp:ListItem>
				<asp:ListItem Value="convert" Text="convert Invalid GUID"></asp:ListItem>
			</asp:RadioButtonList>
		</td>
		<td style="vertical-align:top; width: 200px">
			<asp:CheckBox  ID="chkConsent" runat="server" Text ="Use consent info" />
		</td>
		<td>
			<asp:DropDownList ID="ddlPotentialINVALID" runat="server" OnSelectedIndexChanged="ddlPotentialINVALID_SelectedIndexChanged" AutoPostBack="true" ></asp:DropDownList>
			<asp:Button ID="btnAssignINVALID" runat="server" Text="Assign Invalid GUID" OnClick="btnAssignINVALID_Click" Visible="false" />
			<br />
			<asp:Label ID="lbl_nINVleft" runat="server" Text="" Font-Size="XX-Small" Font-Italic="true"></asp:Label>
		</td>
	</tr>
</table>

	<asp:UpdatePanel ID="panelGuidFileInfo" runat="server" UpdateMode="Conditional"></asp:UpdatePanel>

	<br /><br />

	<asp:Panel ID="Panel_gv" runat="server" Visible="true">
	<br />
		<asp:Label ID="lblguid" runat="server" Text="NDAR GUID Info" ForeColor="Navy" Font-Bold="true"></asp:Label>
	<br />
			
		<dx:ASPxGridView ID="gridGuid"  runat="server" ClientInstanceName="gridGuid" DataSourceID="sql_guid" SettingsBehavior-AllowGroup="true" 
			 Settings-ShowHeaderFilterButton="true">
			<SettingsPager PageSizeItemSettings-Visible="true" PageSize="50"></SettingsPager>
			<Settings ShowGroupPanel="true" />
			<Columns>
				<dx:GridViewDataColumn FieldName="GUID_status"></dx:GridViewDataColumn>
				<dx:GridViewDataColumn FieldName="GUID"></dx:GridViewDataColumn>
				<dx:GridViewDataColumn FieldName="ID"></dx:GridViewDataColumn>
				<dx:GridViewDataColumn FieldName="src_subject_id"></dx:GridViewDataColumn>
				<dx:GridViewDataColumn FieldName="subjstatus"></dx:GridViewDataColumn>
				<dx:GridViewDataColumn FieldName="groupname"></dx:GridViewDataColumn>
				<dx:GridViewDataHyperLinkColumn FieldName="householdID" Caption="View Household" 
					PropertiesHyperLinkEdit-NavigateUrlFormatString="~/Tracking/Household2.aspx?hhID={0}"
					PropertiesHyperLinkEdit-TextField="view"></dx:GridViewDataHyperLinkColumn>
				<dx:GridViewDataColumn FieldName="FirstName"></dx:GridViewDataColumn>
				<dx:GridViewDataColumn FieldName="MiddleName"></dx:GridViewDataColumn>
				<dx:GridViewDataColumn FieldName="LastName"></dx:GridViewDataColumn>
				<dx:GridViewDataColumn FieldName="LastNameOnBC"></dx:GridViewDataColumn>

				<dx:GridViewDataColumn FieldName="COB"></dx:GridViewDataColumn>
				<dx:GridViewDataColumn FieldName="DOB"></dx:GridViewDataColumn>
				<dx:GridViewDataColumn FieldName="SEX"></dx:GridViewDataColumn>

			</Columns>
		</dx:ASPxGridView>

	</asp:Panel>

		<asp:SqlDataSource ID="sql_guid" runat="server" SelectCommandType="Text" ConnectionString="<%$ ConnectionStrings:TRACKING_CONN_STRING %>"
			SelectCommand="exec spSEC__GUIDstatus_by_studyID @studyID">
			<SelectParameters>
				<asp:SessionParameter SessionField="guid_studyID" Name="studyID" />
			</SelectParameters>
	</asp:SqlDataSource>


</asp:Content>