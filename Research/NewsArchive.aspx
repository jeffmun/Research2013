<%@ Page Language="C#" MasterPageFile="~/UWAC.master" AutoEventWireup="true" CodeFile="NewsArchive.aspx.cs" Inherits="NewsArchive" %>

<asp:Content ID="oBody" ContentPlaceHolderID="oBodyPlaceHolder" runat="server">
<asp:DataGrid	ID="tblNews"
				Runat="server"
				AutoGenerateColumns="False"
				CssClass="tblInput"
				GridLines="None"
				BorderStyle="Solid"
				BorderColor="#000000"
				BorderWidth="1px"
				AlternatingItemStyle-CssClass="trDark">
	<Columns>
		<asp:BoundColumn DataField="StartDate" HeaderText="Start Date" HeaderStyle-CssClass="tdHeader" ItemStyle-BorderWidth="1px" HeaderStyle-BorderWidth="1px" />
		<asp:BoundColumn DataField="EndDate" HeaderText="End Date" HeaderStyle-CssClass="tdHeader" ItemStyle-BorderWidth="1px" HeaderStyle-BorderWidth="1px" />
		<asp:BoundColumn DataField="NewsTitle" HeaderText="Title" HeaderStyle-CssClass="tdHeader" ItemStyle-BorderWidth="1px" HeaderStyle-BorderWidth="1px" />
		<asp:BoundColumn DataField="NewsText" HeaderText="News Text" HeaderStyle-CssClass="tdHeader" ItemStyle-CssClass="tdWrap" ItemStyle-BorderWidth="1px" HeaderStyle-BorderWidth="1px" />
	</Columns>
</asp:DataGrid>
</asp:Content>