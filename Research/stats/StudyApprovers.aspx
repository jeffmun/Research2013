<%@ Page Title="" Language="C#" MasterPageFile="~/UWAC.master" AutoEventWireup="true" CodeFile="StudyApprovers.aspx.cs" Inherits="stats_DataProject_Add" %>
<%@ MasterType VirtualPath="~/UWAC.master" %>
<%--<%@ Register Assembly="Obout.Superform" Namespace="Obout.Superform" TagPrefix="obout" %>
<%@ Register Assembly="Obout.Ajax.UI" Namespace="Obout.Ajax.UI.ColorPicker" TagPrefix="obout" %>
<%@ Register Assembly="Obout.Grid" Namespace="Obout.Grid.NET" TagPrefix="obout" %>--%>


<%@ Register TagPrefix="obout" Namespace="Obout.SuperForm" Assembly="obout_SuperForm" %> 

<asp:Content ID="Content1" ContentPlaceHolderID="oBodyPlaceHolder" Runat="Server">
	<asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

	

<%--			<script type="text/javascript">

				// Client-Side Events for Add
				function OnBeforeAdd(record) {
					if (document.getElementById("chkConfBeforeAdd").checked == true) {
						if (confirm("Are you sure you want to add a new order?") == false) {
							return false;
						}
					}
					return true;
				}
				function OnAdd(record) {
					if (document.getElementById("chkConfAfterAdd").checked == true) {
						document.getElementById("txtEvents").value = "A new order was put in add mode.\n" + document.getElementById("txtEvents").value;
					}
					return true;
				}

				// Client-Side Events for cancelling Add
				function OnBeforeCancelAdd(record) {
					if (document.getElementById("chkConfBeforeCancelAdd").checked == true) {
						if (confirm("Are you sure you want to cancel the adding of a new order (for " + record.ShipName + ") ?") == false) {
							return false;
						}
					}
					return true;
				}
				function OnCancelAdd(record) {
					if (document.getElementById("chkConfAfterCancelAdd").checked == true) {
						document.getElementById("txtEvents").value = "The adding of a new order (for " + record.ShipName + ") was canceled.\n" + document.getElementById("txtEvents").value;
					}
					return true;
				}

				// Client-Side Events for Insert
				function OnBeforeInsert(record) {
					if (document.getElementById("chkConfBeforeInsert").checked == true) {
						if (confirm("Are you sure you want to insert this new order for " + record.ShipName + " ?") == false) {
							return false;
						}
					}
					return true;
				}
				function OnInsert(record) {
					if (document.getElementById("chkConfAfterInsert").checked == true) {
						document.getElementById("txtEvents").value = "A new order was created for " + record.ShipName + ".\n" + document.getElementById("txtEvents").value;
					}
				}

				// Client-Side Events for Edit
				function OnBeforeEdit(record) {
					if (document.getElementById("chkConfBeforeEdit").checked == true) {
						if (confirm("Are you sure you want to edit order " + record.OrderID + " (for " + record.ShipName + ") ?") == false) {
							return false;
						}
					}
					return true;
				}
				function OnEdit(record) {
					if (document.getElementById("chkConfAfterEdit").checked == true) {
						document.getElementById("txtEvents").value = "The order " + record.OrderID + " (for " + record.ShipName + ") was put in edit mode.\n" + document.getElementById("txtEvents").value;
					}
					return true;
				}

				// Client-Side Events for Canceling Edit
				function OnBeforeCancelEdit(record) {
					if (document.getElementById("chkConfBeforeCancelEdit").checked == true) {
						if (confirm("Are you sure you want to cancel the editing of order " + record.OrderID + " (for " + record.ShipName + ") ?") == false) {
							return false;
						}
					}
					return true;
				}
				function OnCancelEdit(record) {
					if (document.getElementById("chkConfAfterCancelEdit").checked == true) {
						document.getElementById("txtEvents").value = "The editing of order " + record.OrderID + " (for " + record.ShipName + ") was canceled.\n" + document.getElementById("txtEvents").value;
					}
					return true;
				}

				// Client-Side Events for Update
				function OnBeforeUpdate(record) {
					if (document.getElementById("chkConfBeforeUpdate").checked == true) {
						if (confirm("Are you sure you want to update order " + record.OrderID + " (for " + record.ShipName + ") ?") == false) {
							return false;
						}
					}
					return true;
				}
				function OnUpdate(record) {
					if (document.getElementById("chkConfAfterUpdate").checked == true) {
						document.getElementById("txtEvents").value = "The order " + record.OrderID + " (for " + record.ShipName + ") was updated.\n" + document.getElementById("txtEvents").value;
					}
				}

				// Client-Side Events for Delete
				function OnBeforeDeleteStaff(record) {
					if (confirm("Are you sure you want to delete " + record.staffID + " from this project?") == false) {
						return false;
					}

					return true;
				}
				function OnDelete(record) {
					if (document.getElementById("chkConfAfterDelete").checked == true) {
						document.getElementById("txtEvents").value = "The order " + record.OrderID + " (for " + record.ShipName + ") was deleted.\n" + document.getElementById("txtEvents").value;
					}
				}
		</script>	--%>


		<br />
	<br />
			<asp:Label ID="Label5" runat="server" Text="DB Statistics" Font-Bold="true" Font-Size="XX-Small" ForeColor="Navy"></asp:Label>
				<br />
				<asp:GridView ID="gvSTATS"   runat="server" ForeColor="Navy"></asp:GridView>


	<br />   <br />


	<table>
		<tr>
			<td align="center">
				<asp:Label ID="Label1" runat="server" Text="Single Studies" Font-Bold="true" Font-Size="Large"></asp:Label>
			</td>
			<td width="30px"></td>
			<td align="center">
				<asp:Label ID="Label2" runat="server" Text="Linked Studies" Font-Bold="true" Font-Size="Large"></asp:Label>
			</td>

		</tr>
		<tr>
			<td valign ="top">
				<asp:Label ID="lblYes1" runat="server" Text="Studies in which I DO approve data projects" Font-Bold="true" Font-Size="Medium"></asp:Label>
				<br />
				<asp:GridView ID="gvY1"   runat="server" EmptyDataText="*NONE*"></asp:GridView>

			</td>
			<td></td>

						<td valign ="top">
				<asp:Label ID="Label3" runat="server" Text="Studies in which I DO approve data projects" Font-Bold="true" Font-Size="Medium"></asp:Label>
				<br />
				<asp:GridView ID="gvY0"   runat="server" EmptyDataText="*NONE*"></asp:GridView>

			</td>


		</tr>
<tr>
	<td colspan="3"><br /></td>
</tr>
		<tr>
						<td valign ="top">
				<asp:Label ID="lbl1" runat="server" Text="Studies in which I DO NOT approve data projects" Font-Bold="true" Font-Size="Medium"></asp:Label>
				<br />
				<asp:GridView ID="gvN1"   runat="server" EmptyDataText="*NONE*"></asp:GridView>

			</td>

			<td></td>
			<td valign ="top">
				<asp:Label ID="Label4" runat="server" Text="Studies in which I DO NOT approve data projects" Font-Bold="true" Font-Size="Medium"></asp:Label>
				<br />
				<asp:GridView ID="gvN0"   runat="server" EmptyDataText="*NONE*"></asp:GridView>

			</td>

		</tr>


	</table>

	<br />
	<br />






<%--    OnInsertCommand="gridStudyAppr_InsertCommand"--%>
	<%--<table>
		<tr>
			<td  style="vertical-align:top">
			<obout:Grid ID="gridStudyAppr" runat="server"  AllowAddingRecords="true" AutoGenerateColumns="false"  AllowPaging="false"  AllowPageSizeSelection="false"
				FolderStyle="~/App_Obout/Grid/styles/black_glass" EnableTypeValidation="false"
			 OnInsertCommand="gridStudyAppr_InsertCommand" OnDeleteCommand="gridStudyAppr_DeleteCommand"
				OnRebind="gridStudyAppr_Rebind" PageSize="-1">
				<PagingSettings Position="Bottom" ShowRecordsCount="true" />
				<AddEditDeleteSettings AddLinksPosition="Bottom" />
				<ClientSideEvents OnBeforeClientDelete="OnBeforeDeleteStaff" />
				<Columns>
					<obout:Column DataField="studyappr_pk" HeaderText="pk" ReadOnly="true" Visible="false"></obout:Column>
					<obout:Column runat="server" DataField="studyID" HeaderText="Study"  ShowFilterCriterias="false"  >
						<TemplateSettings TemplateId="tmpStudy1"  EditTemplateId="tmpStudy1Edit"  />
					</obout:Column>
					<obout:Column runat="server" DataField="staffID" HeaderText="Staff"  ShowFilterCriterias="false"  >
						<TemplateSettings TemplateId="tmpStudyAppr1" EditTemplateId="tmpStudyAppr1Edit"  />
					</obout:Column>
					<obout:CheckBoxColumn runat="server" DataField="allowProxy" ApplyFormatInEditMode="true"  >
					</obout:CheckBoxColumn>
					<obout:Column DataField="" AllowDelete="true"></obout:Column>
				</Columns>
				<TemplateSettings HeadingTemplateId="tmpStudyAppr1Header" />
		<Templates>

		<obout:GridTemplate runat="server" ID="tmpStudy1" >
			<Template>
				<%# Container.DataItem["studyname"]%>
			</Template>
		</obout:GridTemplate>
		<obout:GridTemplate runat="server" ID="tmpStudy1Edit" ControlID="ddlstudyID" ControlPropertyName="value">
			<Template>
				<asp:DropDownList runat="server" ID="ddlstudyID" DataSourceID="sql_studyID"
					DataValueField="studyID" DataTextField="studyname" 
					CssClass="ob_gEC"/>
			</Template>
		</obout:GridTemplate>
			
			<obout:GridTemplate runat="server" ID="tmpStudyAppr1Header">
			<Template>
				<asp:Label ID="Label1" runat="server" Text="Study Approvers" Font-Bold="true" Font-Size="Medium"></asp:Label>
			</Template>
		</obout:GridTemplate>
		<obout:GridTemplate runat="server" ID="tmpStudyAppr1" >
			<Template>
				<%# Container.DataItem["staffname"]%>
			</Template>
		</obout:GridTemplate>
		<obout:GridTemplate runat="server" ID="tmpStudyAppr1Edit" ControlID="ddlstaffID" ControlPropertyName="value">
			<Template>
				<asp:DropDownList runat="server" ID="ddlstaffID" DataSourceID="sql_potentappr"
					DataValueField="staffID" DataTextField="staffname" 
					CssClass="ob_gEC"/>
			</Template>
		</obout:GridTemplate>
		
		</Templates>

			</obout:Grid>

			</td>
			<td style="vertical-align:top">

			<obout:Grid ID="gridPotentAppr" runat="server"  AllowAddingRecords="true" AutoGenerateColumns="false"  AllowPaging="false"  AllowPageSizeSelection="false"
				FolderStyle="~/App_Obout/Grid/styles/premiere_blue" EnableTypeValidation="false"
			 OnInsertCommand="gridPotentAppr_InsertCommand" OnDeleteCommand="gridPotentAppr_DeleteCommand"
				OnRebind="gridPotentAppr_Rebind" PageSize="-1"  >
				<PagingSettings Position="Bottom" ShowRecordsCount="true" />
				<AddEditDeleteSettings AddLinksPosition="Bottom" />
				<Columns>
					<obout:Column runat="server" DataField="staffID" HeaderText="Staff"  ShowFilterCriterias="false"  >
						<TemplateSettings TemplateId="tmpPotentAppr1" EditTemplateId="tmpPotentAppr1Edit"  />
					</obout:Column>
					<obout:Column DataField="" AllowDelete="true"></obout:Column>
				</Columns>
				<TemplateSettings HeadingTemplateId="tmpPotentAppr1Header" />
		<Templates>
			
 
			<obout:GridTemplate runat="server" ID="tmpPotentAppr1Header">
			<Template>
				<asp:Label ID="Label1" runat="server" Text="Potential Approvers" Font-Bold="true" Font-Size="Medium"></asp:Label>
			</Template>
		</obout:GridTemplate>
		<obout:GridTemplate runat="server" ID="tmpPotentAppr1" >
			<Template>
				<%# Container.DataItem["staffname"]%>
			</Template>
		</obout:GridTemplate>
		<obout:GridTemplate runat="server" ID="tmpPotentAppr1Edit" ControlID="ddlstaffID2" ControlPropertyName="value">
			<Template>
				<asp:DropDownList runat="server" ID="ddlstaffID2" DataSourceID="sql_staffID"
					DataValueField="staffID" DataTextField="staffname" 
					CssClass="ob_gEC"/>
			</Template>
		</obout:GridTemplate>
		
		</Templates>

			</obout:Grid>

			</td>
		</tr>
	</table>--%>


		<%--<asp:SqlDataSource ID="sql_staffID" runat="server" SelectCommandType="Text" ConnectionString="<%$ ConnectionStrings:TRACKING_CONN_STRING %>"
		 SelectCommand="select staffID, firstname + ' ' + lastname as staffname from tblStaff where active=1 or lastname in ('Dawson') order by 2">
	</asp:SqlDataSource>

		<asp:SqlDataSource ID="sql_studyID" runat="server" SelectCommandType="Text" ConnectionString="<%$ ConnectionStrings:TRACKING_CONN_STRING %>"
		 SelectCommand="select studyID, studyname from tblStudy where active=1 order by 2">
	</asp:SqlDataSource>

			<asp:SqlDataSource ID="sql_potentappr" runat="server" SelectCommandType="Text" ConnectionString="<%$ ConnectionStrings:DATA_CONN_STRING %>"
		 SelectCommand="select a.staffID, firstname + ' ' + lastname as staffname from dp.PotentialApprover a join uwautism_research_backend..tblStaff b ON a.staffID=b.staffID where active=1 or lastname in ('Dawson') order by 2">
	</asp:SqlDataSource>--%>

</asp:Content>

