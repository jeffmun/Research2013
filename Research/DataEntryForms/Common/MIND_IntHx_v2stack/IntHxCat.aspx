<%@ Page Language="c#" validateRequest="false"  Debug="true" MasterPageFile="~/UWAC.master" CodeFile="IntHxCat.aspx.cs" AutoEventWireup="True" Inherits="DataEntryForms_Common_IntHxCat"
	 Title="MIND_IntHx v2 Categories"   EnableEventValidation="false"  %>
<%@ MasterType VirtualPath="~/UWAC.master" %>

<%@ Register Assembly="Obout.Ajax.UI" Namespace="Obout.Ajax.UI.ColorPicker" TagPrefix="obout" %>


<asp:Content ID="Content1" ContentPlaceHolderID="oBodyPlaceHolder" runat="server">

<asp:ScriptManager ID="ScriptManager1" runat="server" ></asp:ScriptManager>


	<asp:Label ID="Label1" runat="server" Text="Intervention History - Categorization" Font-Bold="true" Font-Size="12"></asp:Label>
	<br /><br />
		<br /><br />

	<asp:Label ID="Label4" runat="server" Text="All Tx" Font-Bold="true" Font-Size="10"></asp:Label>
		<br />

				<obout:Grid ID="GridTxAll" runat="server" DataSourceID="sqlTxAll" AutoGenerateColumns="true" OnRebind="GridTxAll_Rebind" 
				AllowEdit="true" OnUpdateCommand="UpdateRecordAll" OnRowDataBound="GridTxAll_RowDataBound" 
				AllowPaging="false"  FolderStyle="~/App_Obout/Grid/styles/premiere_blue" PageSize="-1" Width="500px" >
				<Columns>
					<obout:Column AllowEdit="true" AllowDelete="false" HeaderText="Edit" Width="100" runat="server" />
				</Columns>
			</obout:Grid>

	<br /><br />
	<asp:Label ID="Label2" runat="server" Text="Tx Categories" Font-Bold="true" Font-Size="10"></asp:Label>
	<table>
		<tr>
			<td>
			<obout:Grid ID="GridTxCat" runat="server" DataSourceID="sqlTxCat" AutoGenerateColumns="true" OnRebind="GridTxCat_Rebind" 
				AllowEdit="true" OnUpdateCommand="UpdateRecord" OnRowDataBound="GridTxCat_RowDataBound" 
				AllowPaging="false"  FolderStyle="~/App_Obout/Grid/styles/premiere_blue" PageSize="-1" Width="500px" >
				<Columns>
					<obout:Column AllowEdit="true" AllowDelete="false" HeaderText="Edit" Width="100" runat="server" />
				</Columns>
			</obout:Grid>
			</td>

			<td align="center">
			<asp:TextBox runat="server" Text="Pick Color" id="textbox" style="cursor: pointer; background-color: #FFFFFF" Width="80px" Height="40px" />
			
			<table>
				<tr>
					<td><asp:Label ID="l1" runat="server" Text=" "></asp:Label></td>
					<td><asp:Label ID="l2" runat="server" Text=" "></asp:Label></td>
					<td><asp:Label ID="l3" runat="server" Text=" "></asp:Label></td>
					<td><asp:Label ID="l4" runat="server" Text=" "></asp:Label></td>
					<td><asp:Label ID="l5" runat="server" Text=" "></asp:Label></td>
					<td><asp:Label ID="l6" runat="server" Text=" "></asp:Label></td>
					<td><asp:Label ID="l7" runat="server" Text=" "></asp:Label></td>
					<td><asp:Label ID="l8" runat="server" Text=" "></asp:Label></td>
					<td><asp:Label ID="l9" runat="server" Text=" "></asp:Label></td>
				</tr>
			</table> 
	
	
		   <obout:ColorPickerExtender runat="server" ID="colpick" OnClientOpen="onClientOpen" 
				OnColorPostBack="color_postback" PickButton="false"
				AutoPostBack="true" TargetProperty="style.backgroundColor"
				PopupButtonID="textbox" TargetControlID="textbox"/>
			</td>
		</tr>
	</table>

	<asp:SqlDataSource ID="sqlTxCat" runat="server" ConnectionString="<%$ ConnectionStrings:DATA_CONN_STRING %>"
		 SelectCommand="select a.*, txall, txallcolor from const_MIND_IntHXv2_TxCat a join const_MIND_IntHXv2_TxAll b ON a.txallid = b.txallid">
	</asp:SqlDataSource>

	<asp:SqlDataSource ID="sqlTxAll" runat="server" ConnectionString="<%$ ConnectionStrings:DATA_CONN_STRING %>"
		 SelectCommand="select * from const_MIND_IntHXv2_TxAll">
	</asp:SqlDataSource>


	<asp:Label ID="lblInfo" runat="server" Text="" ></asp:Label>
	<br />
	<br />


	<br />
	<br />
		<asp:Label ID="Label3" runat="server" Text="Tx Types" Font-Bold="true" Font-Size="10"></asp:Label>

<obout:Grid ID="GridTxType" runat="server" AutoGenerateColumns="false" AllowPaging="false" AllowAddingRecords="true" AllowFiltering="true" 
	CallbackMode="true"  OnRowDataBound="Grid1_RowDataBound"
	FolderStyle="~/App_Obout/Grid/styles/premiere_blue" PageSize="-1" OnUpdateCommand="GridTxType_UpdateCommand" OnRebind="GridTxType_Rebind"  >
	<AddEditDeleteSettings AddLinksPosition="Top" NewRecordPosition="Top" />
	<PagingSettings Position="Top" />
	<Columns>
		<obout:Column runat="server" DataField="txtypeID" ></obout:Column>
		<obout:Column runat="server" DataField="txtype" ></obout:Column>
		<obout:Column runat="server" DataField="txcatID" HeaderText="Category"  ShowFilterCriterias="false"  >
			<TemplateSettings TemplateId="Template1" EditTemplateId="Template1Edit" FilterTemplateId="Template1Filter" />
		</obout:Column>
		<obout:Column runat="server" DataField="txtypecolor" ></obout:Column>
		<obout:Column runat="server" DataField="txtype_sortorder" ></obout:Column>
		<obout:Column runat="server" AllowEdit="true"   HeaderText="Edit" Width="60" runat="server" />
	</Columns>
	<Templates>
		<obout:GridTemplate runat="server" ID="Template1" >
			<Template>
				<%# Container.DataItem["txcat"]%>
			</Template>
		</obout:GridTemplate>
		<obout:GridTemplate runat="server" ID="Template1Filter" ControlID="ddltxcatID_filter" ControlPropertyName="value" >
			<Template>
				<asp:DropDownList runat="server" ID="ddltxcatID_filter" DataSourceID="sql_txcatID"
					DataValueField="txcatID" DataTextField="txcat" 
					CssClass="ob_gEC"/>
			</Template>
		</obout:GridTemplate>

		<obout:GridTemplate runat="server" ID="Template1Edit" ControlID="ddltxcatID" ControlPropertyName="value">
			<Template>
				<asp:DropDownList runat="server" ID="ddltxcatID" DataSourceID="sql_txcatID"
					DataValueField="txcatID" DataTextField="txcat" 
					CssClass="ob_gEC"/>
			</Template>
		</obout:GridTemplate>
	</Templates>
</obout:Grid>
<%--        <obout:OboutButton ID="OboutButton1" runat="server"></obout:OboutButton>--%>
<%--    <obout:OboutCheckBox ID="ChkGroupBy1" runat="server" AutoPostBack="true" Text="ihtype" Checked="true" />
	<obout:OboutCheckBox ID="ChkGroupBy2" runat="server" AutoPostBack="true" Text="ihsetting" />
	<br />
	<obout:Grid ID="Grid1" runat="server" ></obout:Grid>--%>
	<br />
	<br />

	<asp:Panel ID="panelChart" runat="server" ViewStateMode="Enabled" EnableViewState="true"></asp:Panel>

<%--    <asp:SqlDataSource ID="sql_txcat" runat="server" SelectCommandType="Text" ConnectionString="<%$ ConnectionStrings:DATA_CONN_STRING %>"
		 SelectCommand="select * from const_MIND_IntHXv2_TxCat">
	</asp:SqlDataSource>

		<asp:SqlDataSource ID="sql_txtype" runat="server" SelectCommandType="Text" ConnectionString="<%$ ConnectionStrings:DATA_CONN_STRING %>"
		 SelectCommand="select * from const_MIND_IntHXv2_TxType">
	</asp:SqlDataSource>
	--%>

		<asp:SqlDataSource ID="sql_txcatID" runat="server" SelectCommandType="Text" ConnectionString="<%$ ConnectionStrings:DATA_CONN_STRING %>"
		 SelectCommand="select txcatID, txcat from const_MIND_IntHXv2_TxCat">
	</asp:SqlDataSource>



		<script type="text/JavaScript">
	function onClientOpen(sender, args) {
		sender.setColor(sender.get_targetElement().style.backgroundColor);
	}
		</script>	


</asp:Content>