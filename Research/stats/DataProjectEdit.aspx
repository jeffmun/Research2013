<%@ Page Title="" Language="C#" EnableEventValidation="false" MasterPageFile="~/UWAC.master" AutoEventWireup="true" CodeFile="DataProjectEdit.aspx.cs" Inherits="stats_DataProject_Add" %>
<%@ MasterType VirtualPath="~/UWAC.master" %>

<%@ Register Assembly="Obout.Ajax.UI" Namespace="Obout.Ajax.UI.HTMLEditor.ToolbarButton" TagPrefix="obout" %>
<%@ Register Assembly="Obout.Ajax.UI" Namespace="Obout.Ajax.UI.HTMLEditor" TagPrefix="obout" %> 
<%@ Register TagPrefix="obout" Namespace="Obout.SuperForm" Assembly="obout_SuperForm" %> 
<%@ Register TagPrefix="obout" Namespace="Obout.ListBox" Assembly="obout_ListBox" %> 

<asp:Content ID="Content1" ContentPlaceHolderID="oBodyPlaceHolder" Runat="Server">
	<asp:ScriptManager ID="ScriptManager1" runat="server" EnablePartialRendering="true"></asp:ScriptManager>


	<asp:Label ID="Label1" runat="server" Text="Data Viewer:" Font-Size="10pt" Font-Bold="true" ></asp:Label>&nbsp;&nbsp;&nbsp;
	<asp:Label ID="lblStudyName" runat="server" Text="Data Viewer" Font-Size="12pt" Font-Bold="true" ForeColor="Navy" ></asp:Label>
	<br />

	<br />
	<br />
	 
	<table width="90%">
		<tr>
			<td align="right">
			<obout:OboutButton ID="btnBackToAll" runat="server" Text="Back to all projects" OnClick="btnBackToAll_Click"></obout:OboutButton>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<obout:OboutButton ID="btnPDF" runat="server" Text="PDF" OnClick="btnPDF_Click"></obout:OboutButton>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<obout:OboutButton ID="btnDeleteProject" runat="server" Text="Delete this project" OnClick="btnDeleteProject_Click"></obout:OboutButton>

			</td>
		</tr>
	</table>


			<obout:Grid ID="gridProjects" runat="server" CallbackMode="true" AllowAddingRecords="true" AllowRecordSelection="true"  
				 AutoGenerateColumns="false" EnableRecordHover="true" 
				 AutoPostBackOnSelect="true" KeepSelectedRecords="true"
				OnSelect="gridProject_Select"   OnRowCreated="gridProject_RowCreated"
				 OnInsertCommand="gridProject_InsertCommand" OnUpdateCommand="gridProject_UpdateCommand" OnRebind="gridProject_Rebind"
				FolderStyle="~/App_Obout/Grid/styles/gray_glass">
				<Columns>
					<obout:Column DataField="dataproj_pk" HeaderText="ID" ReadOnly="true" Visible="false"></obout:Column>
					<obout:Column DataField="projTitle" HeaderText="Title" Width="200" Wrap="true"></obout:Column>
					<obout:Column DataField="nStaff" HeaderText="# Staff" ReadOnly="true" Width="80" AllowSorting="false">
					</obout:Column>
					<obout:Column DataField="nHyp" HeaderText="# Hypoths" ReadOnly="true" Width="80" AllowSorting="false"></obout:Column>
					<obout:Column DataField="TimePoints" HeaderText="TimePoints" ReadOnly="true" Width="120"></obout:Column>
					<obout:Column DataField="nMeas" HeaderText="# Measures" ReadOnly="true" Width="80" AllowSorting="false"></obout:Column>
					<obout:Column DataField="nUnqVars" HeaderText="# Unq Vars" ReadOnly="true" Width="80" AllowSorting="false"></obout:Column>
					<obout:Column DataField="createdBy" HeaderText="Created By" ReadOnly="true" ></obout:Column>
					<obout:Column DataField="created" HeaderText="Created On" ReadOnly="true"></obout:Column>
				</Columns>
				<TemplateSettings HeadingTemplateId="tmpDataProject1Header" />
			<Templates>
			<obout:GridTemplate runat="server" ID="tmpDataProject1Header">
				<Template>
					<asp:Label ID="Label0" runat="server" Text="Data Projects" Font-Bold="true" Font-Size="Medium"/>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<asp:Label ID="Label4" runat="server" Text="Click row for details." Font-Size="X-small"/>
				</Template>
			</obout:GridTemplate>
			</Templates>
			</obout:Grid>


	<br />
	<asp:Panel ID="panelDetails" runat="server" Visible="false">
				
<br />
	<asp:Panel ID="panelVIEWproj" runat="server" Visible="true">
		<table width="90%">
			<tr>
				<td width="100">Title:</td>
				<td>
					<asp:Label ID="lblTitle" Width="500" runat="server" Font-Size="Medium" Font-Bold="true" ></asp:Label>    
				</td>
				<td align="right">
					<obout:OboutButton ID="btnHTMLedit" runat="server" Text="Edit" OnClick="btnHTMLedit_Click" />    
				</td>
			</tr>
			<tr>
				<td style="vertical-align:top">
					<br />
					Subjects:
				</td>
				<td>
					<br />
					<asp:GridView ID="gvViewSubjects" runat="server" AutoGenerateColumns="true"></asp:GridView>
				</td>
			</tr>
			<tr>
				<td style="vertical-align:top">
					<br />
					Summary:
					</td>
				<td>
					<br />
					<asp:Literal ID="litSummary" runat="server" ></asp:Literal>
				</td>
			</tr>
		</table>
		</asp:Panel>

		<asp:Panel ID="panelEDITproj" runat="server" Visible="false">
			<table width="90%">
				<tr>
				<td>Title:</td>
				<td>
					<obout:OboutTextBox ID="txtTitle" Width="500" runat="server" ></obout:OboutTextBox>    
				</td>
				<td style="vertical-align:top" align="right">
					<obout:OboutButton ID="btnHTMLsave" runat="server" Text="Save" OnClick="btnHTMLsave_Click" />    
					<obout:OboutButton ID="btnHTMLcancel" runat="server" Text="Cancel" OnClick="btnHTMLcancel_Click" />    
				</td>
					</tr>
			</table>

<asp:Label ID="lblEditSubjects" runat="server" Text="Select Subjects:"></asp:Label>
<asp:GridView ID="gvSubjects" runat="server" OnRowDataBound="gvSubjects_RowDataBound" ></asp:GridView>
<br />
			<obout:Editor runat="server" Id="editor" Height="600px" Width="95%" >
	 <TopToolbar Appearance="Full" >
		<RemovePredefinedButtons>
			<obout:AnchorsToggle runat="server" />
			<obout:ImportDocument runat="server" />
			<obout:InsertAnchor runat="server" />
			<obout:InsertButton runat="server" />
			<obout:InsertCheckBox runat="server" />
			<obout:InsertDiv runat="server" />
			<obout:InsertFlash runat="server" />
			<obout:InsertFlashVideo runat="server" />
			<obout:InsertForm runat="server" />
			<obout:InsertHidden runat="server" />
			<obout:InsertIcon runat="server" />
			<obout:InsertImage runat="server" />
			<obout:InsertMedia runat="server" />
			<obout:InsertPassword runat="server" />
			<obout:InsertRadio runat="server" />
			<obout:InsertSpecialCharacter runat="server" />
			<obout:InsertSubmit runat="server" />
			<obout:InsertTextBox runat="server" />
			<obout:InsertReset runat="server" />
			<obout:Print runat="server" />
			<obout:RemoveDirection runat="server" />
			<obout:Rtl runat="server" />

		</RemovePredefinedButtons>
		<EditPredefinedButtons>
			<obout:FixedForeColor runat="server" DefaultColor="#0000FF" />
		</EditPredefinedButtons>
	</TopToolbar>
		<BottomToolbar ShowHtmlTextCounter="true" ShowPlainTextCounter="true" />
</obout:Editor>  

		</asp:Panel>


		<br />
		<asp:Button ID="btnGetSubjects" runat="server" Text="Subj" OnClick="btnGetSubjects_Click" />
		<br />
		<asp:Label ID="lblSubj" runat="server" ForeColor="Purple"></asp:Label>
		<br />
			 <%--<obout:Grid ID="gvSubjects" runat="server" OnRowDataBound="gvSubjects_RowDataBound" ></obout:Grid>--%>
		<br />
		<br />


		<table>
			<tr>
				<td style="vertical-align:top"></td>
			</tr>
			<tr>
				<td style="vertical-align:top">
				   <obout:Grid ID="gridApprover" runat="server"  Visible="false" AutoGenerateColumns="false" AllowAddingRecords="false"  AllowPaging="false"  AllowPageSizeSelection="false"
							OnUpdateCommand="gridApprover_UpdateCommand"  AllowSorting="false"
							OnRebind="gridApprover_Rebind" PageSize="-1" Width="1000"
							FolderStyle="~/App_Obout/Grid/styles/gray_glass">
			<%--                <ClientSideEvents OnClientEdit="OnEdit" />--%>
							<TemplateSettings RowEditTemplateId="tmpApproverRowEdit" HeadingTemplateId="tmpAppr1Header" />
							<PagingSettings Position="Bottom" ShowRecordsCount="true" />
							<Columns>
								<obout:Column DataField="appr_pk" HeaderText="ID" ReadOnly="true" Visible="false"  ></obout:Column>
								<obout:Column DataField="apprName" HeaderText="Approver Name" Width="180px" ReadOnly="true"  ></obout:Column>
								<obout:Column DataField="apprStatus" HeaderText="Status" Width="110px" >
									<TemplateSettings RowEditTemplateControlId="ddlapprStatus" RowEditTemplateControlPropertyName="value" />
								</obout:Column>
								<obout:Column DataField="apprComments" HeaderText="Comments" Wrap="true" Width="300px"  >
									<TemplateSettings RowEditTemplateControlId="txt1" RowEditTemplateControlPropertyName="value" />
								</obout:Column>
								<obout:Column DataField="updatedBy" HeaderText="UpdatedBy" Width="100px" ReadOnly="true"    ></obout:Column>
								<obout:Column DataField="updated" HeaderText="Updated" Width="140px" ReadOnly="true"    ></obout:Column>
								<obout:Column DataField="" AllowEdit="true"  Width="100px" >
									<TemplateSettings  EditTemplateId="tmpApproverRowEdit" TemplateId="editBtnTemplate" />
								</obout:Column>

			<%--                    TemplateId="editBtnTemplate"--%>

							</Columns>
					<Templates>
						<obout:GridTemplate runat="server" ID="tmpApproverRowEdit">
							<Template>
								<table  class="rowEditTable">
									<tr>
										<td>Status:</td>
										<td>
											<asp:DropDownList runat="server" ID="ddlapprStatus" DataSourceID="sql_apprstatus"
											DataValueField="apprstatus" DataTextField="apprstatus" 
											CssClass="ob_gEC"/>
										</td>
									</tr>
									<tr>
										<td>Comments:</td>
										<td><obout:OboutTextBox runat="server" ID="txt1"  TextMode="MultiLine" Width="500px" Height="200px" /></td>
									</tr>
									<tr>
										<td>
												<input type="button" value="Save" onclick="gridApprover.save()" class="tdText" />
											</td>
										<td>
												<input type="button" value="Cancel" onclick="gridApprover.cancel()" class="tdText" /> 
										</td>
									</tr>

								</table>
							</Template>
						</obout:GridTemplate>
						<obout:GridTemplate runat="server" ID="tmpAppr1Header" >
							<Template>
								<asp:Label ID="Label2" runat="server" Text="Approvals" Font-Bold="true" Font-Size="Medium"></asp:Label>
							</Template>
						</obout:GridTemplate>


						<obout:GridTemplate runat="server" ID="editBtnTemplate">
								<Template>
									<%#Container.DataItem["canedit"].ToString().StartsWith("edit") ? "<input type=\"button\" id=\"btnEdit\" value=\"Edit\" onclick=\"gridApprover.edit_record(this)\"  class=\"tdText\"/>" : "<span class=\"btspace\">&nbsp;</span>"%>
								</Template>
							</obout:GridTemplate>
			<%--                <obout:GridTemplate runat="server" ID="updateBtnTemplate">
								<Template>
								</Template>
							</obout:GridTemplate>	--%>


					</Templates>
					</obout:Grid>
				</td>
			</tr>
		</table> 
		
		 
		<br />
		 
  <obout:Grid ID="gridStaff" runat="server" AllowAddingRecords="true" AllowSorting="false" AutoGenerateColumns="false"  AllowPaging="false"  AllowPageSizeSelection="false"
				OnInsertCommand="gridStaff_InsertCommand" OnUpdateCommand="gridStaff_UpdateCommand" OnDeleteCommand="gridStaff_DeleteCommand" 
				OnRebind="gridStaff_Rebind" >
		<PagingSettings Position="Bottom" ShowRecordsCount="true" />
		<AddEditDeleteSettings AddLinksPosition="Bottom" />
		<ClientSideEvents OnBeforeClientDelete="OnBeforeDeleteStaff" />
				<Columns>
					<obout:Column DataField="dpstaff_pk" HeaderText="ID" ReadOnly="true" Visible="false"></obout:Column>
					<obout:Column DataField="staffname" HeaderText="Staff Name" Width="100px" ReadOnly="true"   ></obout:Column>
					<obout:Column runat="server" DataField="staffID" HeaderText="Staff"  ShowFilterCriterias="false"  >
						<TemplateSettings TemplateId="tmpStaff1" EditTemplateId="tmpStaff1Edit"  />
					</obout:Column>
					<obout:Column DataField="Role" HeaderText="Role" Width="100px"  ></obout:Column>
					<obout:Column DataField=""  AllowEdit="true" AllowDelete="true" ></obout:Column>
				</Columns>
				<TemplateSettings HeadingTemplateId="tmpStaff1Header" />
		<Templates>
		<obout:GridTemplate runat="server" ID="tmpStaff1Header">
			<Template>
				<asp:Label ID="Label1" runat="server" Text="Data Project Staff" Font-Bold="true" Font-Size="Medium"></asp:Label>
			</Template>
		</obout:GridTemplate>
		<obout:GridTemplate runat="server" ID="tmpStaff1" >
			<Template>
				<asp:Label ID="foo" runat="server" Text='<%# Container.DataItem["staffname"]%>'></asp:Label>
			</Template>
		</obout:GridTemplate>
		<obout:GridTemplate runat="server" ID="tmpStaff1Edit" ControlID="ddlstaffID" ControlPropertyName="value">
			<Template>
				<asp:DropDownList runat="server" ID="ddlstaffID" DataSourceID="sql_staffID"
					DataValueField="staffID" DataTextField="staffname" 
					CssClass="ob_gEC"/>
			</Template>
		</obout:GridTemplate>
		</Templates>

			</obout:Grid>


   



		<table>
		<tr>
			<td style="vertical-align:top">
		<obout:Grid ID="gridHypoth" runat="server" AutoGenerateColumns="false" AllowSorting="false"
			AllowAddingRecords="true" AllowPaging="false" AllowPageSizeSelection="false"  AllowManualPaging="true"  
			OnUpdateCommand="gridHypoth_UpdateCommand" OnInsertCommand="gridHypoth_InsertCommand" 
			OnRebind="gridHypoth_Rebind" OnDeleteCommand="gridHypoth_DeleteCommand"
			OnSelect="gridHypoth_Select" AutoPostBackOnSelect="true"
			>
				<PagingSettings Position="Bottom" ShowRecordsCount="true" />
				<AddEditDeleteSettings AddLinksPosition="Bottom" />
			<Columns>
				<obout:Column DataField="hypoth_pk" HeaderText="ID" ReadOnly="true"  Visible="false"></obout:Column>
				<obout:Column DataField="hypothTitle" HeaderText="Hypoth Title" ></obout:Column>
				<obout:Column DataField="hypothText" HeaderText="Hypoth Text" Wrap="true" Width="250px" ></obout:Column>
				<obout:Column DataField="analysisMethod" HeaderText="Analysis Method" ></obout:Column>
				<obout:Column DataField="" AllowEdit="true" AllowDelete="true"  ></obout:Column>
				<obout:CheckBoxSelectColumn HeaderText="Add Vars" Width="120px" ShowHeaderCheckBox="false" >
				</obout:CheckBoxSelectColumn>
			</Columns>
			<MasterDetailSettings LoadingMode="OnLoad" State="Expanded" DetailsCountField="Num" />

			<TemplateSettings HeadingTemplateId="tmpHypoth1Header" />
			<Templates>
				<obout:GridTemplate runat="server" ID="tmpHypoth1Header">
					<Template>
						<asp:Label ID="Label3" runat="server" Text="Hypotheses" Font-Bold="true" Font-Size="Medium"></asp:Label>
					</Template>
				</obout:GridTemplate>
			</Templates>
			<DetailGrids>
				<obout:DetailGrid runat="server" ID="gridVars"   AutoGenerateColumns="false" AllowAddingRecords="false" ForeignKeys="hypoth_pk" 
					DataSourceID="sql_Hypoth_Vars"
					AllowPaging="false"  AllowPageSizeSelection="false" PageSize="-1" OnDeleteCommand="gridVars_DeleteCommand"
					>
					<Columns>
						<obout:Column DataField="hypoth_pk" HeaderText="ID" ReadOnly="true"  Visible="false"></obout:Column>
						<obout:Column DataField="measureID" HeaderText="measureID" ReadOnly="true"  Visible="false"></obout:Column>
						<obout:Column DataField="measname" HeaderText="Measure" ReadOnly="true"  ></obout:Column>
						<obout:Column DataField="timepoints" HeaderText="TimePoints" ReadOnly="true"  ></obout:Column>
						<obout:Column DataField="varname" HeaderText="Variable" ReadOnly="true" ></obout:Column>
						<obout:Column DataField="fieldlabel" HeaderText="Var Label" ReadOnly="true" Width="350" Wrap="true"></obout:Column>
						<obout:Column DataField="" AllowEdit="false" AllowDelete="true"  ></obout:Column>
					</Columns>
					<TemplateSettings HeadingTemplateId="tmpVarsHeader" />
					<Templates>
						<obout:GridTemplate runat="server" ID="tmpVarsHeader">
							<Template>
								<asp:Label ID="LabelVar0" runat="server" Text="Variables" Font-Bold="true" Font-Size="Small"></asp:Label>
							</Template>
						</obout:GridTemplate>
					</Templates>
				</obout:DetailGrid>
			</DetailGrids>

		</obout:Grid>
 
			</td>
			<td style="vertical-align:top">
			 
		 

		<asp:Panel ID="panelVars" runat="server" Visible="false">
			<table>
				<tr>
					<td style="vertical-align:top">
							<obout:ListBox runat="server" ID="lstTimepoint" Width="200" Height="150"
							SelectionMode="Multiple"></obout:ListBox>
						<br /><br />
						
						<obout:OboutDropDownList ID="ddlMeasure" runat="server" MenuWidth="200px"    Width="200px"
							OnSelectedIndexChanged="ddlMeasure_SelectedIndexChanged" AutoPostBack="true" >
							<ClientSideEvents OnSelectedIndexChanged="onChangeMeasure" />
						</obout:OboutDropDownList>
						<asp:CheckBox ID="chkAllVars" runat="server" Text="All vars" Font-Size="XX-Small" OnCheckedChanged="chkAllVars_CheckedChanged" AutoPostBack="true" />
						<br />
						<br />
							<obout:OboutButton ID="btnSaveVars" runat="server" Enabled="false" Text="Add variables to hypotheses" Font-Size="X-Small" OnClick="btnSaveVars_Click" />

							<obout:OboutButton ID="btnCancel" runat="server"  Text="Cancel" Font-Size="X-Small" OnClick="btnCancel_Click" />
						<br />
						<br />
						<asp:UpdatePanel ID="panelVarErrors" runat="server" UpdateMode="Conditional" >
							<ContentTemplate>
								<asp:Label ID="lblVarError" runat="server" ForeColor="DarkRed" Font-Size="X-Small"></asp:Label>
								<asp:Label ID="lblVarMsg" runat="server" ForeColor="ForestGreen" Font-Size="X-Small"></asp:Label>
							</ContentTemplate>
							<Triggers>
								<asp:AsyncPostBackTrigger ControlID="btnSaveVars" EventName="Click" />
							</Triggers>
						</asp:UpdatePanel>
						
					</td>
					<td  style="vertical-align:top">
						
		<obout:Grid ID="gridStudymeasVars" runat="server" AutoGenerateColumns="false" Visible="false" 
			AllowAddingRecords="false" AllowPaging="true" AllowPageSizeSelection="false"  AllowManualPaging="true"  
			PageSize="20">
				<PagingSettings Position="Bottom" ShowRecordsCount="true" />
			<Columns>
				<obout:CheckBoxSelectColumn ></obout:CheckBoxSelectColumn>
				<obout:Column DataField="databasefield" HeaderText="Variable" Width="140px" ></obout:Column>
				<obout:Column DataField="fieldlabel" HeaderText="Var Label" Width="240px" ></obout:Column>
				<obout:Column DataField="fielddatatype" HeaderText="Data Type" Width="100px" ></obout:Column>
			</Columns>
		 </obout:Grid>

					</td>
				</tr>
			   
			</table>
					<br />


				</asp:Panel>         

			</td>
		</tr>
	</table>
		</asp:Panel>


	<br />
	<br />
	<asp:GridView ID="gvtest" runat="server" AutoGenerateColumns="true"></asp:GridView>


		<asp:SqlDataSource ID="sql_staffID" runat="server" SelectCommandType="Text" ConnectionString="<%$ ConnectionStrings:TRACKING_CONN_STRING %>"
		 SelectCommand="select staffID, firstname + ' ' + lastname as staffname from tblStaff where active=1 order by 2">
		</asp:SqlDataSource>


			<asp:SqlDataSource ID="sql_apprstatus" runat="server" SelectCommandType="Text" ConnectionString="<%$ ConnectionStrings:DATA_CONN_STRING %>"
		 SelectCommand=" select apprStatus from dp.enumApprStatus order by sortorder">
		</asp:SqlDataSource>


		<asp:SqlDataSource ID="sql_Hypoth_Vars" runat="server" SelectCommandType="Text" ConnectionString="<%$ ConnectionStrings:DATA_CONN_STRING %>"
				SelectCommand="select * from dp.vwHypoth_Vars where hypoth_pk = @hypoth_pk">
			<SelectParameters>
				<asp:Parameter Name="hypoth_pk" Type="Int32" />
			</SelectParameters>
		</asp:SqlDataSource>

<%--            <asp:SqlDataSource ID="sql_StudyVars" runat="server" SelectCommandType="Text" ConnectionString="<%$ ConnectionStrings:DATA_CONN_STRING %>"
				SelectCommand="exec spGetStudyMeasures_by_Study @studyID"
				InsertCommand="insert into dp.Vars(hypoth_pk, studymeasID, varname, varcomments) values(@hypoth_pk, @studymeasID, @varname, @varcomments)">
				<SelectParameters>
					<
				</SelectParameters>
		</asp:SqlDataSource>--%>


		<asp:SqlDataSource ID="sql_DataProjects" runat="server" 
		ConnectionString="<%$ ConnectionStrings:DATA_CONN_STRING %>"
		SelectCommand="SELECT dataproj_pk, projTitle, projSummary, created, createdBy, updated, updatedBy FROM dp.DataProject where dataproj_pk = @dataproj_pk and isDeleted=0"
		UpdateCommand="UPDATE  dp.DataProject SET projTitle = @projTitle, projSummary = @projSummary, updated=getdate(), updatedBy=system_user
					   WHERE dataproj_pk=@dataproj_pk">
			<SelectParameters>
				<asp:QueryStringParameter Name="dataproj_pk" QueryStringField="pk" />
			</SelectParameters>
			
	</asp:SqlDataSource>


	
			<script type="text/javascript">

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
		</script>	

<asp:HiddenField ID="hidMeasureID" runat="server" />
<asp:HiddenField ID="hidStudymeasID" runat="server" />
<asp:HiddenField ID="hidTimepointID" runat="server" />

		<script type="text/javascript">

			function onChangeTimepoint(sender, index) {
				document.getElementById('<%=hidTimepointID.ClientID%>').value = sender._value;
				disableStuff();
			}

			function onChangeStudymeas(sender, index) {
				document.getElementById('<%=hidStudymeasID.ClientID%>').value = sender._value;
				disableStuff();
			}
			function onChangeMeasure(sender, index) {
				document.getElementById('<%=hidMeasureID.ClientID%>').value = sender._value;
				disableStuff();
			}

			function disableStuff() {

				var btnSave = document.getElementById('<%=btnSaveVars.ClientID%>');
				btnSave.disabled = true;
			}

	</script>


	<style type="text/css">
	 .no-sort .ob_gHSI {
		 display: none;
	 }
	 </style>


			<style type="text/css">
			.tdText {
				font:11px Verdana;
				color:#333333;
			}
			.option2{
				font:11px Verdana;
				color:#0033cc;				
				padding-left:4px;
				padding-right:4px;
			}
			a {
				font:11px Verdana;
				color:#315686;
				text-decoration:underline;
			}

			a:hover {
				color:crimson;
			}
			.rowEditTable td {
				font-family: Verdana;
				font-size: 10px;
				color: #4B555E;
			}
			.ob_cbContainer {
			background-color:#FFFFFF;
			border:1px solid #000000;
			overflow:auto;
			text-align:left;
			z-index:999;
		</style>


</asp:Content>

