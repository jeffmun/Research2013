<%@ Page Language="C#"  MasterPageFile="~/UWAC.master" AutoEventWireup="true" CodeFile="readspss.aspx.cs" Inherits="_test_readspss" %>


<%@ MasterType VirtualPath="~/UWAC.master" %>

<%@ Register Assembly="DevExpress.Web.v19.1, Version=19.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<%--<%@ Register Assembly="Microsoft.R.Host.Client, Version=18.1.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"  Namespace="Microsoft.R.Host.Client" TagPrefix="r"  %>--%>



<asp:Content ID="HeadContent" runat="server" ContentPlaceHolderID="headContent" Visible="true"></asp:Content>

<asp:Content ID="Content1"  ContentPlaceHolderID="oBodyPlaceHolder" runat="server">
	<asp:ScriptManager ID="ScriptManager1" runat="server" EnablePageMethods="true"  EnablePartialRendering="true"></asp:ScriptManager>

	<br />
	<br />
	<asp:Label ID="lbl" runat="server" Font-Bold="true" Font-Size="Medium"></asp:Label>
	<br />
	<asp:Panel ID="panel" runat="server">
		<dx:ASPxGridView ID="gv" runat="server" AutoGenerateColumns="true" >
			<SettingsPager  Mode="ShowPager"></SettingsPager>
		</dx:ASPxGridView>
	</asp:Panel>
	</asp:Content>