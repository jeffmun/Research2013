﻿<%@ Page Language="C#" Debug="true"  MasterPageFile="~/UWAC.master"  AutoEventWireup="true" CodeFile="otherID.aspx.cs" Inherits="Track_otherID" 
	 EnableEventValidation="false" Title="Other IDs"%>
 <%@ MasterType VirtualPath="~/UWAC.master" %>

<%@ Register Assembly="DevExpress.Web.v19.2, Version=19.2.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.ASPxPivotGrid.v19.2, Version=19.2.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxPivotGrid" TagPrefix="dx" %> 


<asp:Content ID="HeadContent" runat="server" ContentPlaceHolderID="headContent" Visible="true">
	<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css"  />
	<script type='text/javascript' src='https://code.jquery.com/ui/1.12.1/jquery-ui.min.js' ></script> 
</asp:Content>

<asp:Content ID="Content1"  ContentPlaceHolderID="oBodyPlaceHolder" runat="server" >
		<asp:ScriptManager ID="ScriptManager1" runat="server" EnablePageMethods="true"  EnablePartialRendering="true"></asp:ScriptManager>

	<br />
	<br />

<%--        OnValueChanged="gridLkupMeas_OnValueChanged" 
		OnDataBound="gridLkupMeas_OnDataBound" 
		OnDataBinding="gridLkupMeas_DataBinding"--%>
	
	<dx:ASPxLabel ID="t1" runat="server" Text="Select studies:"></dx:ASPxLabel>
	<table>
		<tr>
			<td>
	<dx:ASPxGridLookup ID="gridLkupStudy" runat="server"  GridViewProperties-EnableRowsCache="true" ClientInstanceName="gridLkupMeas" IncrementalFilteringMode="None" 
		KeyFieldName="studyID" SelectionMode="Multiple" MultiTextSeparator=", " Caption="" TextFormatString="{0}" Width="400px" 
		>
					<Columns>
						<dx:GridViewCommandColumn SelectAllCheckboxMode="AllPages" ShowSelectCheckbox="True" VisibleIndex="0" />
						<dx:GridViewDataTextColumn FieldName="studyname" Caption="Study" />
					</Columns>
					<GridViewProperties>
						<Settings ShowFilterRow="true" AutoFilterCondition="Contains"  ShowFilterRowMenu="true"   ShowFilterRowMenuLikeItem="true"  ShowStatusBar="Visible"  />
						<SettingsBehavior AllowDragDrop="False"  />
						<SettingsPager NumericButtonCount="3"  PageSize="40" Summary-Visible="true" />
					</GridViewProperties>
					<ValidationSettings SetFocusOnError="False" ErrorText="You must select some studies" Display="Dynamic"  ErrorTextPosition="Top">
						<RequiredField IsRequired="true" ErrorText="Select studies" />
					</ValidationSettings>
				</dx:ASPxGridLookup>
			</td>
			<td style="width: 50px"></td>
			<td>
				<dx:ASPxButton ID="btnLoadSubj" runat="server" Text="Load Subjects" OnClick="btnLoadSubj_OnClick"></dx:ASPxButton>
			</td>
		</tr>
	</table>


	

	<br /><br />

	<h3>Other ID's by Person</h3>
	<h4>one row per 'otherID' per person</h4>
    <dx:ASPxCheckBox ID="chkIncludeAll" runat="server" Text="Include All? (includes those without an OtherID)"></dx:ASPxCheckBox>
 <dx:ASPxGridView ID="otherID_by_person" ClientInstanceName="grid" runat="server" Width="100%" AutoGenerateColumns="False">
		<Toolbars>
			<dx:GridViewToolbar >
				<Items>
					<dx:GridViewToolbarItem Command="ExportToXls" />
					<dx:GridViewToolbarItem Command="ExportToXlsx" />
					<dx:GridViewToolbarItem Command="ExportToCsv" />
				</Items>
			</dx:GridViewToolbar>
		</Toolbars>
		<Columns>
			<dx:GridViewDataColumn Caption="Last" FieldName="lastname"  />
			<dx:GridViewDataColumn Caption="First" FieldName="firstname"  />
			<dx:GridViewDataColumn Caption="Code6" FieldName="code6" />
			<dx:GridViewDataColumn Caption="OtherID" FieldName="otherID" />
			<dx:GridViewDataColumn Caption="Other Source" FieldName="sitename" />
			<dx:GridViewDataColumn Caption="Sex" FieldName="sex"  />
			<dx:GridViewDataColumn Caption="Race" FieldName="race"  />
			<dx:GridViewDataColumn Caption="Ethnicity" FieldName="ethnicity"  />
            <dx:GridViewDataColumn Caption="Role" FieldName="personRole"  />

		</Columns>
		<Settings ShowGroupPanel="True" ShowFooter="True" ShowFilterRow="True" ShowFilterRowMenu="true"  />
	 <SettingsExport EnableClientSideExportAPI="true" ExcelExportMode="WYSIWYG" />
		<SettingsPager EnableAdaptivity="true" />
	</dx:ASPxGridView>


	<br /><br />
	<h3>Other ID's by Subject</h3>
	<h4>one row per 'otherID' per subject (thus multiple per person)</h4>
	
 <dx:ASPxGridView ID="otherID_by_subject" ClientInstanceName="grid" runat="server" Width="100%" AutoGenerateColumns="False">
		<Toolbars>
			<dx:GridViewToolbar >
				<Items>
					<dx:GridViewToolbarItem Command="ExportToXls" />
					<dx:GridViewToolbarItem Command="ExportToXlsx" />
					<dx:GridViewToolbarItem Command="ExportToCsv" />
				</Items>
			</dx:GridViewToolbar>
		</Toolbars>
		<Columns>
			<dx:GridViewDataColumn Caption="Study" FieldName="studyname"  />
			<dx:GridViewDataColumn Caption="ID" FieldName="ID"  />
			<dx:GridViewDataColumn Caption="Last" FieldName="lastname"  />
			<dx:GridViewDataColumn Caption="First" FieldName="firstname"  />
			<dx:GridViewDataColumn Caption="Code6" FieldName="code6" />
			<dx:GridViewDataColumn Caption="OtherID" FieldName="otherID" />
			<dx:GridViewDataColumn Caption="Other Source" FieldName="sitename" />
			<dx:GridViewDataColumn Caption="Sex" FieldName="sex"  />
			<dx:GridViewDataColumn Caption="Race" FieldName="race"  />
			<dx:GridViewDataColumn Caption="Ethnicity" FieldName="ethnicity"  />
			<dx:GridViewDataColumn Caption="Role" FieldName="personRole"  />
		</Columns>
		<Settings ShowGroupPanel="True" ShowFooter="True" ShowFilterRow="True" ShowFilterRowMenu="true"  />
	 <SettingsExport EnableClientSideExportAPI="true" ExcelExportMode="WYSIWYG" />
		<SettingsPager EnableAdaptivity="true" />
	</dx:ASPxGridView>



</asp:Content>