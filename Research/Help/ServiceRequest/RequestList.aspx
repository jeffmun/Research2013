<%@ Page Language="C#" MasterPageFile="~/UWAC.master" CodeFile="RequestList.aspx.cs" AutoEventWireup="false" Inherits="Help.ServiceRequest.RequestList" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.SqlClient" %>
<%@ MasterType VirtualPath="~/UWAC.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="oBodyPlaceHolder" runat="server">

<asp:Button id="btnNewRequestTop" runat="server" Width="112px" Text="New Request"></asp:Button>
<br/>
<asp:DataGrid	ID="dgRequests"
				runat="server"
				CssClass="tblReport"
				AutoGenerateColumns="False"
				GridLines="None">
	<AlternatingItemStyle CssClass="trDark" />
	<HeaderStyle CssClass="trHeader" />
	<Columns>
		<asp:HyperLinkColumn Text="Edit" DataNavigateUrlField="requestID" DataNavigateUrlFormatString="request.aspx?ID={0}" />
		<asp:BoundColumn DataField="requestID" HeaderText="Request ID" />
		<asp:BoundColumn DataField="itpriority" HeaderText="IT Priority" />
		<asp:TemplateColumn HeaderText="IT Priority">
			<ItemTemplate>
				<asp:DropDownList id=ddlITPriority runat="server" Width="90px" SelectedValue='<%# ( ((IDataRecord)Container.DataItem)["ITPriority"]==DBNull.Value)?-1:((IDataRecord)Container.DataItem)["ITPriority"] %>' AutoPostBack="true" OnSelectedIndexChanged="List_SelectedIndexChanged">
					<asp:ListItem Value="-1" Selected="True">Pending</asp:ListItem>
					<asp:ListItem Value="1">1</asp:ListItem>
					<asp:ListItem Value="2">2</asp:ListItem>
					<asp:ListItem Value="3">3</asp:ListItem>
					<asp:ListItem Value="4">4</asp:ListItem>
					<asp:ListItem Value="5">5</asp:ListItem>
				</asp:DropDownList>
			</ItemTemplate>
		</asp:TemplateColumn>
		<asp:BoundColumn DataField="requestfrom" HeaderText="Request From" />
		<asp:BoundColumn DataField="studyname" HeaderText="Study" />
		<asp:TemplateColumn HeaderText="Priority">
			<ItemTemplate>
				<asp:DropDownList id="ddlPriority" runat="server" DataSource='<%# GetListDataSource("ddlPriority") %>' DataTextField="priority" DataValueField="priorityid" Width="116px" SelectedValue='<%# ((IDataRecord)Container.DataItem)["priorityID"] %>' AutoPostBack="true" OnSelectedIndexChanged="List_SelectedIndexChanged">
				</asp:DropDownList>
			</ItemTemplate>
		</asp:TemplateColumn>
		<asp:TemplateColumn HeaderText="Feature Type">
			<ItemTemplate>
				<asp:DropDownList id="ddlFeatureType" runat="server" DataSource='<%# GetListDataSource("ddlFeatureType") %>' DataTextField="featuretype" DataValueField="featuretypeid" Width="113px" SelectedValue='<%# ((IDataRecord)Container.DataItem)["featuretypeid"] %>' AutoPostBack="true" OnSelectedIndexChanged="List_SelectedIndexChanged">
				</asp:DropDownList>
			</ItemTemplate>
		</asp:TemplateColumn>
		<asp:BoundColumn DataField="description" HeaderText="Description" ItemStyle-CssClass="tdWrap" />
		<asp:BoundColumn DataField="submitdate" HeaderText="Submit Date" DataFormatString="{0:d}" />
		<asp:BoundColumn DataField="status" HeaderText="Status" />
		<asp:TemplateColumn HeaderText="Status">
			<ItemTemplate>
				<asp:DropDownList id="ddlStatus" runat="server" DataSource='<%# GetListDataSource("ddlStatus") %>' DataTextField="status" DataValueField="statusid" Width="124px" SelectedValue='<%# ((IDataRecord)Container.DataItem)["statusid"] %>' AutoPostBack="true" OnSelectedIndexChanged="List_SelectedIndexChanged">
				</asp:DropDownList>
			</ItemTemplate>
		</asp:TemplateColumn>
		<asp:BoundColumn DataField="assignedto" HeaderText="Assigned To" />
		<asp:TemplateColumn HeaderText="Assigned To">
			<ItemTemplate>
				<asp:DropDownList id="ddlAssignedTo" runat="server" DataSource='<%# GetListDataSource("ddlAssignedTo") %>' DataTextField="staffshortname" DataValueField="staffid" Width="105px" SelectedValue='<%# (((IDataRecord)Container.DataItem)["assignedtostaffid"]== DBNull.Value)?"-1":((IDataRecord)Container.DataItem)["assignedtostaffid"] %>' AutoPostBack="true" OnSelectedIndexChanged="List_SelectedIndexChanged">
				</asp:DropDownList>
			</ItemTemplate>
		</asp:TemplateColumn>
		<asp:BoundColumn DataField="esthours" HeaderText="Estimated Hours" />
		<asp:BoundColumn DataField="comment" HeaderText="Comments" ItemStyle-CssClass="tdWrap" />
	</Columns>
</asp:DataGrid><br/>
<asp:Button id="btnAddNew" runat="server" Text="New Request"></asp:button>

</asp:Content>