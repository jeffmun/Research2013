<%@ Page Language="c#"  Debug="true" MasterPageFile="~/UWAC.master" CodeFile="CreateSubject.aspx.cs" AutoEventWireup="True" Inherits="Track_CreateSubject" %>
<%@ MasterType VirtualPath="~/UWAC.master" %>

<%@ Register Assembly="DevExpress.Web.v19.2, Version=19.2.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>


<asp:Content ID="Content1" ContentPlaceHolderID="oBodyPlaceHolder" runat="server">

<table cellspacing="0" class="tblInput" id="tblMaster" runat="server">
	<tr class="trTitle">
		<td colspan="2" id="tdTitle" runat="server">Create Subject: </td>
	</tr>
	<tr>
		<td colspan="1" style="vertical-align:top">
			<label for="txtPersonName">Person Name:</label><br/>
			<dx:ASPxLabel ID="lblName" runat="server" ></dx:ASPxLabel>
<%--			<input type="text" name="txtPersonName" readonly="true" style="width: 450px;" id="txtPersonName" runat="server" />--%>
			<input type="hidden" name="hidPersonID" id="hidPersonID" runat="server" />

			<br /><br />
			<label for="selStudyID">Study:</label><br/>
			<%--<asp:DropDownList id="selStudyID" runat="server" style="width: 450px;" autopostback="true"              OnSelectedIndexChanged="LoadGroups" />--%>

			<dx:ASPxComboBox ID="cboStudyID" runat="server" DataSourceID="sql_Studies" TextField="studyname"  Width="450px"
				ValueField="studyID"  OnValueChanged="LoadGroups" AutoPostBack="true" OnInit="cboStudyID_OnInit"  >
			</dx:ASPxComboBox>

		<%--OnChange="DoSyncDropDowns(this.options[this.selectedIndex].value, null, 'group', 'selGroupID'); DisplayMaxID(this.options[this.selectedIndex].value);"--%>

			
		<br />
		<br />
			<label for="selGroupID">Group:</label>
		<br />
<%--			<asp:DropDownList ID="ddlGroupID" runat="server"></asp:DropDownList>--%>
					<dx:ASPxComboBox ID="cboGroupID" runat="server"  TextField="groupname" ValueField="groupID" Width="450px"  ></dx:ASPxComboBox>

		<br />
		<br />
						<label for="txtSubjectID">Subject ID:</label><br/>
			<input type="text" name="txtSubjectID" style="width: 250px;" id="txtSubjectID" runat="server" />
			<span id="spnMaxID"></span>
			<span id="spnJS" runat="server"></span>

		<br />
		<br />
		<br />
			<asp:Button ID="Button1" runat="server" Text="Create Subject" OnClick="MovePersonIntoStudy" />

		</td>
		<td>

			<asp:Label ID="lblHeader" runat="server" Text="Other ID's for this person" Font-Bold="true" Font-Size="Small"></asp:Label>


			<dx:ASPxGridView id="dxgridOtherID" runat="server" ClientInstanceName="dxgridOtherID"
				DataSourceID="sql_Other" KeyFieldName="otherID_pk" 
					SettingsDataSecurity-AllowEdit="true" SettingsDataSecurity-AllowInsert="true">
					<SettingsPager Mode="ShowAllRecords" />
				<Columns>
					<dx:GridViewDataColumn FieldName="personID" Caption="" Visible="false" ></dx:GridViewDataColumn>
					<dx:GridViewDataColumn FieldName="otherID" Caption="otherID" Visible="true" ></dx:GridViewDataColumn>

					<dx:GridViewDataComboBoxColumn FieldName="otherIDsiteID" Caption="Site name"  >
						<PropertiesComboBox TextField="sitename" ValueField="siteID" DataSourceID='sql_Site'  />
					</dx:GridViewDataComboBoxColumn>

				</Columns>
			</dx:ASPxGridView>

<%--			<obout:Grid ID="gridOtherID" runat="server" AllowAddingRecords="true" ShowFooter="true" AllowSorting="false" AllowGrouping="false"  
				DataSourceID="sql_Other" ShowTotalNumberOfPages="false" AllowPageSizeSelection="false" PageSize="-1" AllowPaging="false"  
				FolderStyle="~/App_Obout/Grid/styles/gray_glass"  Width="450px" CallbackMode="true" Serialize="true" AutoGenerateColumns="false"
				 OnUpdateCommand="gridOtherID_UpdateCommand" OnInsertCommand="gridOtherID_InsertCommand" OnRebind="gridOtherID_Rebind" >
				<Columns>
					<obout:Column AllowEdit="true"  Width="25%" runat="server"></obout:Column>
					<obout:Column DataField="otherID"  Width="30%" runat="server"></obout:Column>
					<obout:Column DataField="otherIDsiteID" Width="45%" runat="server" HeaderText="Site name" Visible="true" >
						<TemplateSettings TemplateId="tpl_site"  EditTemplateId="tpl_edit_site"   />
					</obout:Column>
					<obout:Column DataField="personID" runat="server" Visible="false" ></obout:Column>
					<obout:Column DataField="otherID_pk" runat="server" Visible="false" ></obout:Column>
				</Columns>
				<Templates>
					<obout:GridTemplate ID="tpl_site" runat="server" ControlID="txtSite" ControlPropertyName="value">
						<Template>
							<asp:Label ID="txtSite" runat="server" Text='<%# Container.DataItem["sitename"] %>' />
						</Template>
					</obout:GridTemplate>
					<obout:GridTemplate ID="tpl_edit_site" runat="server"  ControlID="ddlSite"  ControlPropertyName="value">
						<Template>
							<asp:DropDownList runat="server" ID="ddlSite" DataValueField="siteID" DataTextField="sitename" CssClass="ob_gEC"  ></asp:DropDownList>
						</Template>
					</obout:GridTemplate>
				</Templates>
			</obout:Grid>--%>
		</td>
	</tr>

	<tr>
		<td  style="vertical-align:top">
		</td>
		<td align="left" style="vertical-align:top">
			<asp:Panel ID="Panel_maxID" runat="server">
			</asp:Panel>
		</td>
	</tr>
</table>


   <br />
   <br />
	<asp:Label ID="lblInfo" runat="server" Text=""></asp:Label>


		<asp:SqlDataSource ID="sql_Studies" runat="server" SelectCommandType="Text" ConnectionString="<%$ ConnectionStrings:TRACKING_CONN_STRING %>"
			SelectCommand="select -1 studyID, '-- Select Study --' studyname  UNION select studyID, studyname from tblStudy where active=1 and studyID not in (select studyID from vwMasterStatus_S where personID=@personID) order by studyname">
			<SelectParameters>
				<asp:QueryStringParameter Name="personID" QueryStringField="personID"  />
			</SelectParameters>
		</asp:SqlDataSource>

			<asp:SqlDataSource ID="sql_Groups" runat="server" SelectCommandType="Text" ConnectionString="<%$ ConnectionStrings:TRACKING_CONN_STRING %>"
			SelectCommand="select * from tblGroup where studyID=@studyID">
				<SelectParameters>
					<asp:ControlParameter ControlID="cboStudyID" PropertyName="Value" Name="studyID" />
				</SelectParameters>
		</asp:SqlDataSource>


		<asp:SqlDataSource ID="sql_Site" runat="server" SelectCommandType="Text" ConnectionString="<%$ ConnectionStrings:TRACKING_CONN_STRING %>"
			SelectCommand="select siteID, sitename from tblSite where siteID in (select siteID from tbllabsite where labID in (select labID from fn_AllowedLabs_by_User()))">
		</asp:SqlDataSource>

		<asp:SqlDataSource ID="sql_Other" runat="server" SelectCommandType="Text" ConnectionString="<%$ ConnectionStrings:TRACKING_CONN_STRING %>"
			SelectCommand="select otherID_pk, personID, otherID, sitename, otherIDsiteID from vwOtherID2 where personID=@personID">
			<SelectParameters>
				<asp:QueryStringParameter Name="personID" QueryStringField="personID"  />
			</SelectParameters>
		</asp:SqlDataSource>


</asp:Content>