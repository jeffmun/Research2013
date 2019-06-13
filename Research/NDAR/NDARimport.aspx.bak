<%@ Page Title="NDAR Import" Language="C#" MasterPageFile="~/UWAC.master" AutoEventWireup="true" CodeFile="NDARimport.aspx.cs" Inherits="NDAR_NDARimport"
	EnableEventValidation="false"  %>
 <%@ MasterType VirtualPath="~/UWAC.master" %>


<%@ Register Assembly="DevExpress.Web.v18.2, Version=18.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>


<asp:Content ID="Content1" ContentPlaceHolderID="oBodyPlaceHolder" Runat="Server">

<br />
<%--					<dx:ASPxButton ID="btnLoadStructuresFromNDAR" runat="server" ClientInstanceName="btnLoadStructuresFromNDAR"  Text="Load Data Structures from NDAR" OnClick="btnLoadStructuresFromNDAR_OnClick"></dx:ASPxButton> --%>
	<dx:ASPxLabel ID="ASPxLabel1" runat="server" Text="List of Data Structures in NDAR" Font-Bold="true"></dx:ASPxLabel>
	<br />

	<dx:ASPxGridView ID="gridFullList" runat="server" ClientInstanceName="gridFullList" AutoGenerateColumns="false" 
		OnCustomCallback="gridFullList_CustomCallback" OnDataBinding="gridFullList_OnDataBinding">
		<Settings ShowFilterRow="true" />
		<SettingsBehavior  FilterRowMode="Auto" />
		
		<Columns>

		<dx:GridViewDataColumn FieldName="shortName" />
		<dx:GridViewDataColumn FieldName="title" />
		<dx:GridViewDataColumn FieldName="datatype" />
		<dx:GridViewDataColumn FieldName="status" />
		<dx:GridViewDataColumn FieldName="publicStatus" />
		<dx:GridViewDataColumn FieldName="publishDate" />
		<dx:GridViewDataColumn FieldName="modifiedDate" />


		</Columns>
	</dx:ASPxGridView>

	<br />    
	<br />    
		<br />   
	<table>
		<tr>
			<td style="width:300px">
				<dx:ASPXTextBox ID="txtNDAR_ShortName" runat="server" Caption="NDAR Short Name:" ></dx:ASPXTextBox>
			</td>
			<td style="width:300px">
				<dx:ASPxButton ID="btnDisplayFromNDAR" runat="server" ClientInstanceName="btnDisplayFromNDAR"  
					Text="Display Data Dictionary from NDAR" OnClick="btnDisplayFromNDAR_OnClick" EnableClientSideAPI="true">
					<ClientSideEvents />
				</dx:ASPxButton> 
			</td>
			<td>
				<dx:ASPxButton ID="btnImportFromNDAR" runat="server" ClientInstanceName="btnImportFromNDAR"  
					Text="Import into LocalDB" OnClick="btnImportFromNDAR_OnClick" ClientVisible="false"></dx:ASPxButton> 
			</td>
		</tr>
	</table>

	<br />
	<asp:Label ID="lblInfo" runat="server" Text="" ForeColor="Magenta"></asp:Label>
	<br />
	<dx:ASPxLabel ID="lbl2" runat="server" Text="Loaded Data Structure" Font-Bold="true"></dx:ASPxLabel>
	<br />

	<dx:ASPxGridView ID="gridDS" runat="server" ClientInstanceName="gridDS" AutoGenerateColumns="false" 
		OnCustomCallback="gridDS_CustomCallback" OnDataBinding="gridDS_OnDataBinding">
	
		
		<Columns>

		<dx:GridViewDataColumn FieldName="shortName" />
		<dx:GridViewDataColumn FieldName="id" />
		<dx:GridViewDataColumn FieldName="required" />
		<dx:GridViewDataColumn FieldName="position" />
		<dx:GridViewDataColumn FieldName="dataElementId" />
		<dx:GridViewDataColumn FieldName="name" />
		<dx:GridViewDataColumn FieldName="type" />
		<dx:GridViewDataColumn FieldName="size" />
		<dx:GridViewDataColumn FieldName="description" />
		<dx:GridViewDataColumn FieldName="valueRange" />
		<dx:GridViewDataColumn FieldName="notes" />
		<dx:GridViewDataColumn FieldName="uwfld" />
		<dx:GridViewDataColumn FieldName="fx" />
		<dx:GridViewDataColumn FieldName="param1" />
		<dx:GridViewDataColumn FieldName="param2" />


		</Columns>
	</dx:ASPxGridView>




</asp:Content>

