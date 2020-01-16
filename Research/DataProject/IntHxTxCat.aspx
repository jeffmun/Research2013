<%@ Page Language="C#" Debug="true"  MasterPageFile="~/UWAC.master"  AutoEventWireup="true" CodeFile="IntHxTxCat.aspx.cs" Inherits="DataProject_IntHxTxCat" 
	 EnableEventValidation="false" Title="Edit Data Project"%>
 <%@ MasterType VirtualPath="~/UWAC.master" %>

<%@ Register Assembly="DevExpress.Web.v19.1, Version=19.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.ASPxPivotGrid.v19.1, Version=19.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxPivotGrid" TagPrefix="dx" %> 
<%@ Register Assembly="DevExpress.Web.ASPxHtmlEditor.v19.1, Version=19.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxHtmlEditor" TagPrefix="dx" %> 


<asp:Content ID="HeadContent" runat="server" ContentPlaceHolderID="headContent" Visible="true">
	<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css"  />
	<%--<script type='text/javascript' src='https://code.jquery.com/ui/1.12.1/jquery-ui.min.js' ></script> --%>

	<script type="text/javascript" src="<% =HttpContext.Current.Request.Url.GetLeftPart(UriPartial.Authority) + HttpContext.Current.Request.ApplicationPath %>/js/jquery-1.9.0.min.js"></script>
	<script type="text/javascript" src="<% =HttpContext.Current.Request.Url.GetLeftPart(UriPartial.Authority) + HttpContext.Current.Request.ApplicationPath %>/js/jquery-ui.min.js"></script>


</asp:Content>

<asp:Content ID="Content1"  ContentPlaceHolderID="oBodyPlaceHolder" runat="server" >
		<asp:ScriptManager ID="ScriptManager1" runat="server" EnablePageMethods="true"  EnablePartialRendering="true"></asp:ScriptManager>


	<br />
	<asp:Label ID="Label1" runat="server" Text="Intervention History: Tx Types and Categories" Font-Bold="true" Font-Size="Medium"></asp:Label>
	<br />
	<br />
	<asp:Label ID="lbl" runat="server" Text="The following tables display the various treatment types recorded in the Intervention History measure. The ~27 types are categorized at various levels of granularity.  When creating a Data Project you have the ability to select any of the TxCat vars that you wish to use."
		width ="700px"></asp:Label>
	<br />
	<br />
	<asp:Label ID="Label2" runat="server" Text="For example, you may want the broadest category (A1_) as well as just the Child Education types by themselves (A3c)."
		width ="700px"></asp:Label>
	<br />
	<asp:Label ID="Label3" runat="server" Text="Note that A2b & A3c as well as B1_, B2_, & B3_ will yield the same values" Font-Italic="true"></asp:Label>
	<br />
	<br />
<table>
	<tr>
		<td><b>Tx Types</b></td>
		<td></td>
		<td><b>Tx Categories</b></td>
	</tr>
	<tr>
		<td style="vertical-align: top">
			<dx:ASPxGridView ID="gridTxType" runat="server"    AutoGenerateColumns="false" ClientInstanceName="gridTxType"
					KeyFieldName="txcatID" EnableViewState="true"  >
				<SettingsPager PageSize="30"></SettingsPager>
				<Columns>
					<dx:GridViewDataColumn FieldName="txtypeID" Caption="txtypeID" VisibleIndex="0" Visible="true" Width="50px"></dx:GridViewDataColumn>
					<dx:GridViewDataColumn FieldName="txcat1" Caption="TxCat1" VisibleIndex="1" Width="40px"></dx:GridViewDataColumn>
					<dx:GridViewDataColumn FieldName="txcat2" Caption="TxCat2" VisibleIndex="1" Width="40px"></dx:GridViewDataColumn>
					<dx:GridViewDataColumn FieldName="txcat3" Caption="TxCat3" VisibleIndex="1" Width="40px"></dx:GridViewDataColumn>
					<dx:GridViewDataColumn FieldName="txcat4" Caption="TxCat4" VisibleIndex="1" Width="40px"></dx:GridViewDataColumn>
					<dx:GridViewDataColumn FieldName="txtype" Caption="TxType" VisibleIndex="1" Width="220px"></dx:GridViewDataColumn>
				</Columns>
			</dx:ASPxGridView>
		</td>
		<td style="width: 30px"></td>
		<td style="vertical-align: top">
			<dx:ASPxGridView ID="gridTxCat" runat="server"   AutoGenerateColumns="false" ClientInstanceName="gridTxCat"
					KeyFieldName="txcatID" >
				<SettingsPager PageSize="15"></SettingsPager>
				<Columns>
					<dx:GridViewDataColumn FieldName="txcat1" Caption="TxCat1" VisibleIndex="0" Width="160px"></dx:GridViewDataColumn>
					<dx:GridViewDataColumn FieldName="txcat2" Caption="TxCat2" VisibleIndex="1" Width="160px"></dx:GridViewDataColumn>
					<dx:GridViewDataColumn FieldName="txcat3" Caption="TxCat3" VisibleIndex="2" Width="160px"></dx:GridViewDataColumn>
					<dx:GridViewDataColumn FieldName="txcat4" Caption="TxCat4" VisibleIndex="3" Width="160px"></dx:GridViewDataColumn>
				</Columns>
			</dx:ASPxGridView>
		</td>
	</tr>
</table>


	<br />
	<br />
	<b>TO DO: these grids could be updated to allow editing, including colors using ASPXColorEdit</b>
	<table>
		<tr>
			<td style="vertical-align:top; padding:10px">
				<dx:ASPxGridView ID="gType" runat="server" DataSourceID="sqlTYPE" AutoGenerateColumns="true" ClientInstanceName="gType"
					KeyFieldName="txtypeID" >
					</dx:ASPxGridView>
			</td>
			<td style="vertical-align:top; padding:10px">
				<dx:ASPxGridView ID="gCat" runat="server"  DataSourceID="sqlCAT" AutoGenerateColumns="true" ClientInstanceName="gCat"
					KeyFieldName="txcatID" >
					</dx:ASPxGridView>
			
			</td>
		</tr>
	</table>



	<asp:SqlDataSource ID="sqlTYPE" runat="server" SelectCommandType="Text"   
		SelectCommand="select * from const_MIND_IntHXv2_TxType"
		ConnectionString="<%$ ConnectionStrings:DATA_CONN_STRING %>" >
	</asp:SqlDataSource>
	<asp:SqlDataSource ID="sqlCAT" runat="server" SelectCommandType="Text"   
		SelectCommand="select * from const_MIND_IntHXv2_TxCat"
		ConnectionString="<%$ ConnectionStrings:DATA_CONN_STRING %>" >
	</asp:SqlDataSource>

</asp:Content>