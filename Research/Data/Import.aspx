﻿<%@ Page Language="c#"   Debug="true" MasterPageFile="~/UWAC.master" AutoEventWireup="true" EnableEventValidation="true"
  CodeFile="Import.aspx.cs" Inherits="Data_Import"  Title ="Import data"    %>  
<%@ MasterType VirtualPath="~/UWAC.master" %>

<%@ Register Assembly="DevExpress.Web.v18.1, Version=18.1.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<%--<%@ Register Assembly="Microsoft.R.Host.Client, Version=18.1.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"  Namespace="Microsoft.R.Host.Client" TagPrefix="r"  %>--%>



<asp:Content ID="HeadContent" runat="server" ContentPlaceHolderID="headContent" Visible="true"></asp:Content>

<asp:Content ID="Content1"  ContentPlaceHolderID="oBodyPlaceHolder" runat="server">
	<asp:ScriptManager ID="ScriptManager1" runat="server" EnablePageMethods="true"  EnablePartialRendering="true"></asp:ScriptManager>

	<script type="text/javascript">

		function ShowUpload() {
			btn1.SetVisible(true);
			btn2.SetVisible(true);
		}

	</script>

	<asp:Panel ID="panel" runat="server">

	</asp:Panel>

	<asp:Label ID="lbl1" runat="server" Text="Import Data" Font-Size="Medium" Font-Bold="true"></asp:Label>


	<table>
		<tr>
			<td style="vertical-align: top; padding: 5px">
				<dx:ASPxComboBox ID="cboSubject" ClientInstanceName="cboSubject" runat="server" Caption="Subject:" CaptionCellStyle-Width="90px" NullText="select subject"></dx:ASPxComboBox>

				<dx:ASPxComboBox ID="cboStudymeas" ClientInstanceName="cboStudymeas" runat="server" Caption="Measure:" CaptionCellStyle-Width="90px" NullText="select measure"
						 AutoPostBack="true" OnSelectedIndexChanged="cboStudymeas_OnSelectedIndexChanged"></dx:ASPxComboBox>

				<dx:ASPxLabel ID="lblNrecs" ClientInstanceName="lblNrecs" runat="server" ></dx:ASPxLabel>
				<br />
				<dx:ASPxButton ID="btnDelete" ClientInstanceName="btnDelete" runat="server" AutoPostBack="true" Text="Delete these records" OnClick="DeleteRecs" Native="true" Visible="false"/>

				
			</td>
			<td style="vertical-align: top; padding: 5px">
	 
				<%--<asp:Label ID="Label52" runat="server" Text="Select file:" Font-Size="X-Small"></asp:Label><br />--%>
				<%--onchange="this.form.submit()" --%>
				<asp:FileUpload ID="FileUpload_Doc" runat="server" Font-Size="Small" Width="400px" 
						onchange="ShowUpload()"   Visible ="false" />
				<br /><br />
				
				<%--<asp:Button ID="btnUploadDoc" runat="server" AutoPostBack="true" Text="Upload Document" OnClick="UploadDoc" Visible="false"/>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<asp:Button ID="btnUploadDoc_Cancel" runat="server" AutoPostBack="true" Text="Cancel" OnClick="UploadDoc_Cancel" ForeColor="Red" Visible="false" />--%>
				<br />
				<br />

				<%--<asp:Label ID="lblDocUploadInfo" runat="server" Text="" Font-Size="Smaller"></asp:Label>--%>
				<dx:ASPxLabel ID="lblDocUploadInfo" runat="server" Text="" Font-Size="Smaller" EncodeHtml="false"></dx:ASPxLabel>


			</td>

			<td style="vertical-align: top; padding: 5px">
				<dx:ASPxButton ID="btn1" ClientInstanceName="btn1" runat="server" AutoPostBack="true" Text="Upload Document" OnClick="UploadDoc" Native="true" ClientVisible="false"/>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<dx:ASPxButton ID="btn2" ClientInstanceName="btn2" runat="server" AutoPostBack="true" Text="Cancel" OnClick="UploadDoc_Cancel" Native="true" ForeColor="Red" ClientVisible="false" />
				<br />
				<br />

			</td>
		</tr>
	</table>




</asp:Content>
