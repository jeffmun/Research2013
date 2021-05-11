<%@ Page Title="NDAR API" Language="C#" MasterPageFile="~/UWAC.master" AutoEventWireup="true" CodeFile="NDARapi.aspx.cs" Inherits="NDAR_NDARapi"
	EnableEventValidation="false"  %>
 <%@ MasterType VirtualPath="~/UWAC.master" %>


<%@ Register Assembly="DevExpress.Web.v19.2, Version=19.2.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>


<asp:Content ID="Content1" ContentPlaceHolderID="oBodyPlaceHolder" Runat="Server">

	<style type="text/css">
	.invisible {
		display: none;
	}
</style>

	<script>
		function SaveAll_Click(s, e) {

			lblSaveResults.SetText("");
			if(cbPanel.InCallback())
				postponedCallbackRequired = true;
			else
				cbPanel.PerformCallback();
		}

		function PerformCallback(command) {
			cbPanel.PerformCallback(cbPanel.cpResults + ':' + command);
		}
		function UpdateResults() {
			var results = cbPanel.cpResults;
			
			lblSaveResults.SetText(results );

		}
	</script>

	<br />    
	<br />    
	<asp:Label ID="lblInfo" runat="server" Text="" ForeColor="Magenta"></asp:Label>
	<br />
	<table>
		<tr>
			<td>
				<asp:Label ID="Label1" runat="server" Text="Search:"></asp:Label>
				<asp:TextBox ID="txtWhere" runat="server" Text=""></asp:TextBox>
			</td>
			<td>
				<asp:Button ID="btnSearchDS" runat="server" Text="Search" OnClick="btnSearchDS_Click" />
			</td>
			<td style="width: 300px">
				<asp:CheckBox ID="chkUWview" runat="server" Checked="true" Text="Only those with UW table" /><br />
				<asp:CheckBox ID="chkInStudy" runat="server" Checked="true" Text="Only those this study" />
			</td>
			<td style="width: 250px; padding:10px">
					<asp:Button ID="btnSave" runat="server" Text="Re-import NDAR Data Structures" OnClick="btnSave_Click" Enabled="false"  Visible="false"/>
				<dx:ASPxTextBox ID="txtShortName" runat="server" Caption="NDAR Short Name:" CaptionSettings-Position="Top" Text=""></dx:ASPxTextBox>
					<asp:Button ID="btnManualImport" runat="server" Text="Import NDAR Data Structure" OnClick="btnManualImport_Click" Enabled="true" />
				<dx:ASPxLabel ID="lblManualImport_results" runat="server" Text="" ForeColor="Blue"></dx:ASPxLabel>
			</td>
			<td>
				<asp:Label ID="lblInstructions" runat="server" Text="Instructions:" Font-Bold="true" Font-Size="XX-Small"></asp:Label>
				<br />
				<asp:Label ID="lblInstructions2" runat="server" Width="400"  Font-Size="XX-Small"
					Text="These are the measures to be submitted to NDAR.<br/>The <b>View Data</b> link will display & create the data files.<br/>The <b>Define flds</b> link is where you create the definitions that will convert our data to NDAR-compliant format." ></asp:Label>
				<br />
				<asp:Label ID="lblInstructions3" runat="server" Width="400"  Font-Size="XX-Small" Font-Italic="true"
					Text="The NDAR data files are produced dynamically based on information that defines how fields in this DB are to be transformed for NDAR."></asp:Label>
			</td>
		</tr>
	</table>

	<br /><br />
	<asp:Panel ID="Panel_DataStructureList" runat="server">
		<table>
			<tr>
				<td>
					<asp:Label ID="lblN" runat="server" Text="" Font-Bold="true" Font-Size="Medium"></asp:Label> &nbsp;&nbsp;&nbsp;&nbsp;

				</td>
				<td style="padding: 10px">
					<dx:ASPxButton ID="btnSaveAll" runat="server" Text="Save NDAR CSV's for All Selected Measures" 
						OnClick="btnSaveAll_click" Font-Size="Smaller" AutoPostBack="true" Visible="true"  EnableClientSideAPI="true"  >
					<ClientSideEvents Click="SaveAll_Click"   />
					</dx:ASPxButton>

				</td>
				<td style="padding: 10px">
					<dx:ASPxTokenBox ID="tokTimepts" runat="server" Caption="Timepoints:" ValueField="timepointID" TextField="timepoint_text" DataSourceID="sqlTimepts"></dx:ASPxTokenBox>
				</td>
				<td style="padding: 10px">
					<dx:ASPxTextBox ID="txtIDexclude" runat="server" Caption="ID's to exclude" Text=""></dx:ASPxTextBox>
				</td>
			</tr>
			</table>
			<br />
						<dx:ASPxLabel ID="lblSaveResults2" ClientInstanceName="lblSaveResults2" runat="server" Text="" EncodeHtml="false" EnableClientSideAPI="true" Font-Italic="true" >
						</dx:ASPxLabel>
			<br />
			<dx:ASPxCallbackPanel ID="cbPanel" ClientInstanceName="cbPanel" runat="server"
				OnCallback="cbPanel_Callback" OnCustomJSProperties="cbPanel_CustomJSProperties">
				<PanelCollection>
					<dx:PanelContent>
						<dx:ASPxLabel ID="lblSaveResults" ClientInstanceName="lblSaveResults" runat="server" Text="" EncodeHtml="false" EnableClientSideAPI="true" >
						</dx:ASPxLabel>
					</dx:PanelContent>
				</PanelCollection>
				<%--Init="function(s, e) { UpdateResults(); }"--%>
				<ClientSideEvents  EndCallback="function(s, e){ UpdateResults(); }"></ClientSideEvents>
			</dx:ASPxCallbackPanel>


			<br />



		 <dx:ASPxGridView ID="grid" runat="server"  Width="80%" AutoGenerateColumns="false" SettingsDataSecurity-AllowEdit="true" 
			  KeyFieldName="shortName"  OnRowUpdating="dxgrid_OnRowUpdating" OnDataBound="grid_DataBound"  
			  OnCustomButtonInitialize="grid_CustomButtonInitialize"   OnCustomButtonCallback="grid_CustomButtonCallback" 
			 >
		
			 <SettingsPager PageSize="20"></SettingsPager>
			 <Columns>
				 <dx:GridViewCommandColumn SelectAllCheckboxMode="AllPages" ShowSelectCheckbox="true"></dx:GridViewCommandColumn>
				 <dx:GridViewDataColumn FieldName="n_flds" Caption="# Flds" EditFormSettings-Visible="false"> </dx:GridViewDataColumn>
				 <dx:GridViewDataColumn FieldName="n_uwflds" Caption="# UW Flds"  EditFormSettings-Visible="false"></dx:GridViewDataColumn>
				 
				<dx:GridViewDataColumn  Caption="UW Table" FieldName="uwtable"  ></dx:GridViewDataColumn>

				
				 <dx:GridViewDataHyperLinkColumn FieldName="shortName" Caption="View Data" EditFormSettings-Visible="false"
								 PropertiesHyperLinkEdit-Text="View Data"
								PropertiesHyperLinkEdit-NavigateUrlFormatString="NDARview.aspx?shortName={0}" ></dx:GridViewDataHyperLinkColumn>

				 <dx:GridViewDataHyperLinkColumn FieldName="shortName" Caption="Define Flds" EditFormSettings-Visible="false"
								 PropertiesHyperLinkEdit-Text="Define Flds"
								PropertiesHyperLinkEdit-NavigateUrlFormatString="NDARdict.aspx?shortName={0}" ></dx:GridViewDataHyperLinkColumn>


				<dx:GridViewDataColumn  Caption="shortName" FieldName="shortName" ReadOnly="true"/>
				<dx:GridViewDataColumn  Caption="Title" FieldName="title"  EditFormSettings-Visible="false" />
				<dx:GridViewDataColumn  Caption="Data Type" FieldName="dataType"  EditFormSettings-Visible="false" />
				<dx:GridViewDataColumn  Caption="Status" FieldName="status"  EditFormSettings-Visible="false"/>
				<dx:GridViewDataColumn  Caption="Published" FieldName="publishDate"  EditFormSettings-Visible="false"/>
				 <dx:GridViewCommandColumn ShowEditButton="true"></dx:GridViewCommandColumn>
			 </Columns>

		</dx:ASPxGridView>



		<br /><br />
			<asp:Label ID="Label2" runat="server" Text="Measures in this Study with No NDAR Link:" Font-Bold="true" Font-Size="Medium"></asp:Label>
		 <dx:ASPxGridView ID="gridNoNDAR" runat="server"   AutoGenerateColumns="false" 
			  KeyFieldName="measureID"  >
		
			<SettingsPager Mode="ShowAllRecords"></SettingsPager>	 
			<Columns>
				 <dx:GridViewDataColumn FieldName="measureID" Caption="mID"  CellStyle-ForeColor="Silver"> </dx:GridViewDataColumn>
				 <dx:GridViewDataColumn FieldName="measname" Caption="Measure" > </dx:GridViewDataColumn>
				 <dx:GridViewDataHyperLinkColumn FieldName="measureID" Caption="Data Dictionary"
					 PropertiesHyperLinkEdit-Text="View data dictionary" PropertiesHyperLinkEdit-Target="blank"
					 PropertiesHyperLinkEdit-NavigateUrlFormatString="~/Data/Dictionary.aspx?mID={0}"></dx:GridViewDataHyperLinkColumn>
			</Columns>
			</dx:ASPxGridView>

	</asp:Panel>


	<asp:Panel ID="Panel_Details" runat="server" Visible="false">
	<table>
		<tr>
			<td><asp:Label ID="l1" runat="server" Text ="shortName:"></asp:Label></td>
			<td><asp:Label ID="v1" runat="server"  Font-Bold="true" Font-Size="Large"></asp:Label></td>
		</tr>
		<tr>
			<td><asp:Label ID="l2" runat="server" Text ="Title:"></asp:Label></td>
			<td><asp:Label ID="v2" runat="server" Font-Bold="true" Font-Size="Medium"></asp:Label></td>
		</tr>
		<tr>
			<td><asp:Label ID="l3" runat="server" Text ="N Elements:"></asp:Label></td>
			<td><asp:Label ID="v3" runat="server"  Font-Bold="true" Font-Size="Medium"></asp:Label></td>
		</tr>

	</table>

	</asp:Panel>

		<br /><br />
	<asp:Panel ID="Panel_dataElements" runat="server"></asp:Panel>  


			<asp:SqlDataSource ID="sqlTimepts" runat="server" SelectCommandType="Text" ConnectionString="<%$ ConnectionStrings:TRACKING_CONN_STRING %>"
			SelectCommand="select * from tblTimepoint where studyID=@studyID order by timepoint">
			<SelectParameters>
				<asp:SessionParameter SessionField="master_studyID" Name="studyID" Type="Int32" />
			</SelectParameters>
	</asp:SqlDataSource>


</asp:Content>

