<%@ Page Language="C#"   Debug="true" MasterPageFile="~/UWAC.master" CodeFile="ProcessActigraphy.aspx.cs" AutoEventWireup="true" EnableEventValidation="true"
 Inherits="Data_ProcessActigraphy" Title="Process Actigraphy"      %>   <%--Theme="Skin1" EnableEventValidation="true"--%>
<%@ MasterType VirtualPath="~/UWAC.master" %>

<%@ Register Assembly="DevExpress.Web.v19.2, Version=19.2.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>


<asp:Content ID="HeadContent" runat="server" ContentPlaceHolderID="headContent" Visible="true">
</asp:Content>


<asp:Content ID="Content1"  ContentPlaceHolderID="oBodyPlaceHolder" runat="server">
	<asp:ScriptManager ID="ScriptManager1" runat="server" EnablePageMethods="true"  EnablePartialRendering="true"></asp:ScriptManager>


	<br />
	<table>
		<tr>
			<td style="vertical-align:top">
				<dx:ASPxTextBox ID="txtdocversid" runat="server" Text="1549" Caption="DocversID"></dx:ASPxTextBox> 
				<dx:ASPxButton ID="btnProcess" runat="server" Text="Process Actigraphy file" OnClick="btnProcess_Click"></dx:ASPxButton>
				<br />
				<dx:ASPxLabel ID="lbl" runat="server" EncodeHtml="false" ></dx:ASPxLabel>

			</td>
			<td style="vertical-align:top; padding-left:50px">
				<dx:ASPxTextBox ID="txtmins" runat="server" Caption="Mins"></dx:ASPxTextBox> 
				<dx:ASPxButton ID="btn" runat="server" Text="Convert to DateTime" OnClick="btn_Click"></dx:ASPxButton>
				<dx:ASPxLabel ID="lbldt" runat="server" EncodeHtml="false" ></dx:ASPxLabel>
			</td>
		</tr>
	</table>

	<dx:ASPxPanel ID="panel" runat="server">
		<PanelCollection>
			<dx:PanelContent>
			</dx:PanelContent>
		</PanelCollection>
	</dx:ASPxPanel>

</asp:Content>




