<%@ Page Language="c#" Debug="true" MasterPageFile="~/UWAC.master" CodeFile="LOedit.aspx.cs" AutoEventWireup="true"
 Inherits="DataEntryForms_Common_LO_LOedit" Title="LO Info"    %>
  <%@ MasterType VirtualPath="~/UWAC.master" %>
<%@ Register TagPrefix="obout" Namespace="OboutInc.Calendar2" Assembly="obout_Calendar2_Net" %>
<%@ Register TagPrefix="obout" Namespace="Obout.SuperForm" Assembly="obout_SuperForm" %>
<%@ Register TagPrefix="obout" Namespace="Obout.ComboBox" Assembly="obout_ComboBox" %>





<asp:Content ID="Content1"  ContentPlaceHolderID="oBodyPlaceHolder" runat="server">
<%--	<asp:ScriptManager ID="ScriptManager1" runat="server" EnablePageMethods="true" EnablePartialRendering="true"></asp:ScriptManager>--%>
	<asp:ScriptManager ID="ScriptManager2" runat="server"  ></asp:ScriptManager>


	<br />
	<br />
<asp:Label ID="l1" runat="server" Text="List of Learning Opportunities" Font-Bold="true" Font-Size="Medium"></asp:Label>
		<br />
		<br />

	<asp:GridView ID="gv" runat="server" DataSourceID="sql1" AutoGenerateColumns="false">
		<Columns>
			<asp:HyperLinkField HeaderText="ID" DataTextField="ID" DataNavigateURLFields="IDlink" />
			<asp:BoundField DataField="CheckRec"         HeaderText="Check"         ></asp:BoundField>
			<asp:BoundField DataField="LOnum"         HeaderText="LOnum"         ></asp:BoundField>
			<asp:BoundField DataField="week_label"    HeaderText="week_label"    ></asp:BoundField>
			<asp:BoundField DataField="actual_week"   HeaderText="actual_week"   ></asp:BoundField>
			<asp:BoundField DataField="LOweeknum"     HeaderText="LOweeknum"     > </asp:BoundField>
			<asp:BoundField DataField="week_recorded" HeaderText="week_recorded"  DataFormatString="{0:d}" ></asp:BoundField>
			<asp:BoundField DataField="date_recorded" HeaderText="date_recorded"  DataFormatString="{0:d}"   ></asp:BoundField>

		</Columns>

	</asp:GridView>
	
<%--    <obout:Grid ID="grid" runat="server"   DataSourceID="sql1" 
		CallbackMode="true" Serialize="true" ViewStateMode="Enabled" PageSize="-1"        
		AllowPageSizeSelection="false"  AllowAddingRecords="false"    AllowPaging="false"
		AllowFiltering="true"   	>
		<Columns>
			<obout:Column DataField="ID"  ></obout:Column>
			<obout:Column DataField="IDlink"  ParseHTML="true" >
				<TemplateSettings TemplateId="x"  />
				</obout:Column>


			<obout:Column DataField="LOnum"   ></obout:Column>
			<obout:Column DataField="week_label"   ></obout:Column>
			<obout:Column DataField="actual_week"   ></obout:Column>
			<obout:Column DataField="LOweeknum"   ></obout:Column>
			<obout:Column DataField="week_recorded"  DataFormatString="{0:d}" ></obout:Column>
			<obout:Column DataField="date_recorded"  DataFormatString="{0:d}"   ></obout:Column>
		</Columns>

		<Templates>
			<obout:GridTemplate ID="x">
				<asp:HyperLink ID="link" runat="server" NavigateUrl='<%#  DataBinder.Eval(Container, "IDlink") %>' ></asp:HyperLink>
			</obout:GridTemplate>
		</Templates>

		</obout:Grid>--%>



	<asp:SqlDataSource ID="sql1" runat="server" SelectCommandType="Text" ConnectionString="<%$ ConnectionStrings:DATA_CONN_STRING %>"
	SelectCommand="select * from vwLOedit order by ID, LOnum"></asp:SqlDataSource>


	</asp:Content>