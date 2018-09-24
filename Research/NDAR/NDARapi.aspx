<%@ Page Title="" Language="C#" MasterPageFile="~/UWAC.master" AutoEventWireup="true" CodeFile="NDARapi.aspx.cs" Inherits="NDAR_NDARapi"
	EnableEventValidation="false"  %>
 <%@ MasterType VirtualPath="~/UWAC.master" %>


<%@ Register Assembly="DevExpress.Web.v18.1, Version=18.1.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>


<asp:Content ID="Content1" ContentPlaceHolderID="oBodyPlaceHolder" Runat="Server">

	<style type="text/css">
	.invisible {
		display: none;
	}
</style>
	<br />    
	<br />    
	<asp:Label ID="lblInfo" runat="server" Text="" ForeColor="Magenta"></asp:Label>
	<br />
	<table>
		<tr>
			<td>
				<asp:Label ID="Label1" runat="server" Text="Search:"></asp:Label>
				<asp:TextBox ID="txtWhere" runat="server" Text=""></asp:TextBox>
			</td>
			<td>
				<asp:Button ID="btnSearchDS" runat="server" Text="Search" OnClick="btnSearchDS_Click" />
			</td>
			<td style="width: 300px">
				<asp:CheckBox ID="chkUWview" runat="server" Checked="true" Text="Only those with UW table" /><br />
				<asp:CheckBox ID="chkInStudy" runat="server" Checked="true" Text="Only those this study" />
			</td>
			<td style="width: 250px">
					<asp:Button ID="btnSave" runat="server" Text="Re-import NDAR Data Structures" OnClick="btnSave_Click" Enabled="false" />

			</td>
			<td>
				<asp:Label ID="lblInstructions" runat="server" Text="Instructions:" Font-Bold="true" Font-Size="XX-Small"></asp:Label>
				<br />
				<asp:Label ID="lblInstructions2" runat="server" Width="400"  Font-Size="XX-Small"
					Text="These are the measures to be submitted to NDAR.<br/>The <b>View Data</b> link will display & create the data files.<br/>The <b>Define flds</b> link is where you create the definitions that will convert our data to NDAR-compliant format." ></asp:Label>
				<br />
				<asp:Label ID="lblInstructions3" runat="server" Width="400"  Font-Size="XX-Small" Font-Italic="true"
					Text="The NDAR data files are produced dynamically based on information that defines how fields in this DB are to be transformed for NDAR."></asp:Label>
			</td>
		</tr>
	</table>

	<br /><br />
	<asp:Panel ID="Panel_DataStructureList" runat="server">
		<asp:Label ID="lblN" runat="server" Text="" Font-Bold="true" Font-Size="Medium"></asp:Label>
	<%--	 <asp:GridView ID="gvScroll" runat="server"  Width="80%" AutoGenerateColumns="false" OnRowCommand="gvScroll_RowCommand" OnRowDataBound="gvScroll_RowDataBound"  
		HeaderStyle-CssClass="GridviewScrollHeader" RowStyle-CssClass="GridviewScrollItem" PagerStyle-CssClass="GridviewScrollPager" >
			 <Columns>
				 <asp:BoundField  HeaderText="# Fields" DataField="n_flds" />
				 <asp:BoundField  HeaderText="# UW Fields" DataField="n_uwflds" />
				 <asp:TemplateField>
					 <HeaderTemplate>Import Fields</HeaderTemplate>
					 <ItemTemplate>                    
						 <asp:Button ID="btnImportFlds" runat="server" Text="Import flds" Font-Size="XX-Small" CommandName="Import flds"
							 CommandArgument='<%# Eval("shortName") %>'  />
					 </ItemTemplate>
				 </asp:TemplateField>
				 <asp:BoundField  HeaderText="UW Table" DataField="uwtable" />

				 <asp:TemplateField  HeaderText="View Data">
					 <ItemTemplate>
						 <asp:HyperLink ID="linkView" runat="server" NavigateUrl='<%# "NDARview.aspx?shortName=" + Eval("shortName")%>' Text="view" Target="_blank"></asp:HyperLink>
					 </ItemTemplate>                     
				 </asp:TemplateField>
				 <asp:TemplateField  HeaderText="Define flds">
					 <ItemTemplate>
						<asp:HyperLink ID="linkDict" runat="server" NavigateUrl='<%# "NDARdict.aspx?shortName=" + Eval("shortName")%>' Text="define" Target="_blank"></asp:HyperLink>

					 </ItemTemplate>                     
				 </asp:TemplateField>

				 <asp:BoundField  HeaderText="shortName" DataField="shortName" />
				 <asp:BoundField  HeaderText="Title" DataField="title" />
				 <asp:BoundField  HeaderText="Data Type" DataField="datatype" />
				 <asp:BoundField  HeaderText="Status" DataField="status" />
				 <asp:BoundField  HeaderText="Published" DataField="publishDate" />

			 </Columns>

		</asp:GridView>--%>



		 <dx:ASPxGridView ID="grid" runat="server"  Width="80%" AutoGenerateColumns="false" SettingsDataSecurity-AllowEdit="true" 
			  KeyFieldName="shortName"  OnRowUpdating="dxgrid_OnRowUpdating" OnDataBound="grid_DataBound"
			  OnCustomButtonInitialize="grid_CustomButtonInitialize">
		
			 <SettingsPager PageSize="20"></SettingsPager>
			 <Columns>
				 <dx:GridViewDataColumn FieldName="n_flds" Caption="# Flds" EditFormSettings-Visible="false"> </dx:GridViewDataColumn>
				 <dx:GridViewDataColumn FieldName="n_uwflds" Caption="# UW Flds"  EditFormSettings-Visible="false"></dx:GridViewDataColumn>
				 
<%--				 <asp:TemplateField>
					 <HeaderTemplate>Import Fields</HeaderTemplate>
					 <ItemTemplate>                    
						 <asp:Button ID="btnImportFlds" runat="server" Text="Import flds" Font-Size="XX-Small" CommandName="Import flds"
							 CommandArgument='<%# Eval("shortName") %>'  />
					 </ItemTemplate>
				 </asp:TemplateField>--%>
				<dx:GridViewDataColumn  Caption="UW Table" FieldName="uwtable"  ></dx:GridViewDataColumn>


<%--				 <asp:TemplateField  HeaderText="View Data">
					 <ItemTemplate>
						 <asp:HyperLink ID="linkView" runat="server" NavigateUrl='<%# "NDARview.aspx?shortName=" + Eval("shortName")%>' Text="view" Target="_blank"></asp:HyperLink>
					 </ItemTemplate>                     
				 </asp:TemplateField>
				 <asp:TemplateField  HeaderText="Define flds">
					 <ItemTemplate>
						<asp:HyperLink ID="linkDict" runat="server" NavigateUrl='<%# "NDARdict.aspx?shortName=" + Eval("shortName")%>' Text="define" Target="_blank"></asp:HyperLink>
					 </ItemTemplate>                     
				 </asp:TemplateField>--%>
				
				 <dx:GridViewDataHyperLinkColumn FieldName="shortName" Caption="View Data" EditFormSettings-Visible="false"
								 PropertiesHyperLinkEdit-Text="View Data"
								PropertiesHyperLinkEdit-NavigateUrlFormatString="NDARview.aspx?shortName={0}" ></dx:GridViewDataHyperLinkColumn>

				 <dx:GridViewDataHyperLinkColumn FieldName="shortName" Caption="Define Flds" EditFormSettings-Visible="false"
								 PropertiesHyperLinkEdit-Text="Define Flds"
								PropertiesHyperLinkEdit-NavigateUrlFormatString="NDARdict.aspx?shortName={0}" ></dx:GridViewDataHyperLinkColumn>


				<dx:GridViewDataColumn  Caption="shortName" FieldName="shortName" ReadOnly="true"/>
				<dx:GridViewDataColumn  Caption="Title" FieldName="title"  EditFormSettings-Visible="false" />
				<dx:GridViewDataColumn  Caption="Data Type" FieldName="dataType"  EditFormSettings-Visible="false" />
				<dx:GridViewDataColumn  Caption="Status" FieldName="status"  EditFormSettings-Visible="false"/>
				<dx:GridViewDataColumn  Caption="Published" FieldName="publishDate"  EditFormSettings-Visible="false"/>
				 <dx:GridViewCommandColumn ShowEditButton="true"></dx:GridViewCommandColumn>
			 </Columns>

		</dx:ASPxGridView>



		<br /><br />
			<asp:Label ID="Label2" runat="server" Text="Measures in this Study with No NDAR Link:" Font-Bold="true" Font-Size="Medium"></asp:Label>
		 <dx:ASPxGridView ID="gridNoNDAR" runat="server"   AutoGenerateColumns="false" 
			  KeyFieldName="measureID"  >
		
			 
			 <Columns>
				 <dx:GridViewDataColumn FieldName="measureID" Caption="mID"  CellStyle-ForeColor="Silver"> </dx:GridViewDataColumn>
				 <dx:GridViewDataColumn FieldName="measname" Caption="Measure" > </dx:GridViewDataColumn>
				 </Columns>
			 </dx:ASPxGridView>

	</asp:Panel>


	<asp:Panel ID="Panel_Details" runat="server" Visible="false">
	<table>
		<tr>
			<td><asp:Label ID="l1" runat="server" Text ="shortName:"></asp:Label></td>
			<td><asp:Label ID="v1" runat="server"  Font-Bold="true" Font-Size="Large"></asp:Label></td>
		</tr>
		<tr>
			<td><asp:Label ID="l2" runat="server" Text ="Title:"></asp:Label></td>
			<td><asp:Label ID="v2" runat="server" Font-Bold="true" Font-Size="Medium"></asp:Label></td>
		</tr>
		<tr>
			<td><asp:Label ID="l3" runat="server" Text ="N Elements:"></asp:Label></td>
			<td><asp:Label ID="v3" runat="server"  Font-Bold="true" Font-Size="Medium"></asp:Label></td>
		</tr>

	</table>

	</asp:Panel>

		<br /><br />
	<asp:Panel ID="Panel_dataElements" runat="server"></asp:Panel>  


	
	<%--    Added for GridViewScroll    see  http://gridviewscroll.aspcity.idv.tw/     
	Note that the other javascript refs are placed in UWAutism.master  --%>
<%--<script type="text/javascript">
	$(document).ready(function () {
		gridviewScroll();
	});

	function gridviewScroll() {
		$('#< %=gvScroll.ClientID%>').gridviewScroll({
			width: $(window).width() - 10,
			height: 800,
			freezesize: 2,
			railcolor: "#F0F0F0",
			barcolor: "#CDCDCD",
			barhovercolor: "#606060",
			bgcolor: "#F0F0F0",
			arrowsize: 30,
			varrowtopimg: "Images/arrowvt.png",
			varrowbottomimg: "Images/arrowvb.png",
			harrowleftimg: "Images/arrowhl.png",
			harrowrightimg: "Images/arrowhr.png",
			headerrowcount: 1,
			railsize: 16,
			barsize: 8

		});
	}
	</script>--%>
<%--end GridViewScroll--%>

</asp:Content>

