<%@ Page Language="c#"   Debug="true" MasterPageFile="~/UWAC.master" AutoEventWireup="true" EnableEventValidation="true"
  CodeFile="Import.aspx.cs" Inherits="DataImport_Import"  Title ="Import stuff"    %>  
<%@ MasterType VirtualPath="~/UWAC.master" %>

<%@ Register Assembly="DevExpress.Web.v18.1, Version=18.1.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<%--<%@ Register Assembly="Microsoft.R.Host.Client, Version=18.1.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"  Namespace="Microsoft.R.Host.Client" TagPrefix="r"  %>--%>



<asp:Content ID="HeadContent" runat="server" ContentPlaceHolderID="headContent" Visible="true"></asp:Content>

<asp:Content ID="Content1"  ContentPlaceHolderID="oBodyPlaceHolder" runat="server">
	<asp:ScriptManager ID="ScriptManager1" runat="server" EnablePageMethods="true"  EnablePartialRendering="true"></asp:ScriptManager>


	<asp:Panel ID="panel" runat="server">

	</asp:Panel>


<%--	<dx:ASPxUploadControl runat="server" ID="DocumentsUploadControl" ClientInstanceName="DocumentsUploadControl" Width="100%"
												AutoStartUpload="true" ShowProgressPanel="True" ShowTextBox="false" BrowseButton-Text="Add documents" FileUploadMode="OnPageLoad"
												OnFileUploadComplete="DocumentsUploadControl_FileUploadComplete">
												<AdvancedModeSettings EnableMultiSelect="false" EnableDragAndDrop="true" ExternalDropZoneID="dropZone" />
												<ValidationSettings
													AllowedFileExtensions=".csv, .xls, .xlsx"
													MaxFileSize="103809024">
												</ValidationSettings>
												<ClientSideEvents
													FileUploadComplete="onFileUploadComplete"
													FilesUploadComplete="onFilesUploadComplete"
													FilesUploadStart="onFileUploadStart" />
											</dx:ASPxUploadControl>--%>


</asp:Content>
