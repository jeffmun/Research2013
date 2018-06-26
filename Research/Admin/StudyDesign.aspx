<%@ Page Title="" Language="C#" MasterPageFile="~/UWAC.master" AutoEventWireup="true" CodeFile="StudyDesign.aspx.cs" Inherits="Admin_StudyDesign" %>
<%@ MasterType VirtualPath="~/UWAC.master" %>

<%--<%@ Register TagPrefix="obout" Namespace="Obout.Grid" Assembly="obout_Grid_NET" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Interface" Assembly="Obout_Interface" %>
<%@ Register TagPrefix="obout" Namespace="Obout.ListBox" Assembly="obout_ListBox" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Ajax.UI.TreeView" Assembly="Obout.Ajax.UI" %>--%>

<%@ Register TagPrefix="oajax" Namespace="OboutInc" Assembly="obout_AJAXPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="oBodyPlaceHolder" Runat="Server">
	<asp:ScriptManager ID="ScriptManager1" runat="server" EnablePageMethods="true" EnablePartialRendering="true" EnableViewState="true"></asp:ScriptManager>


	<style type="text/css">
		tr.ob_gR
		{
		background-image:url('image url')!important;
		}

		tr.ob_gRA
		{
		background-image:url('image url')!important;
		}


.ob_gRETpl
{
	font-family: Verdana;
	font-size: 11px;
	color: #196585;
	padding: 0px;
	border-top: 1px solid #7BB8D9;
	background-color:#ff00ea;

	border-bottom:1px solid #dbdbe1;
	border-top:1px solid #dbdbe1;
	position: relative;
	z-index: 11;
}
	</style>


	<script type="text/javascript" src="../../js/obout_custom.js"></script>  

	<script type="text/javascript">
		$(document).ready(function () {
			$(".example_select2").select2();
		});
	</script>

	<script type="text/javascript">
		function ddlMeasure_Change(sender, index) {
			//used to prepopulate the studymeasname withe the measname
			var x = sender.options[index].text;
			var ddl = document.getElementById('<%= GetControlIdFromTemplate("tblstudymeas","ddlMeasure", 0, "unique") %>');
		var txt = document.getElementById('<%= GetControlIdFromTemplate("tblstudymeas","txt_studymeasname", 0, "unique") %>');


		txt.value = x;
	}


	function onBeforeClientEdit_tblstudyaction(sender, index) {
		selectByValues(lst_group_studyaction, index.groupIDs);
	}

	function Select2_to_Hid(sender, record, f, f2)
	{
		var x = 1;
	}


	function onBeforeClientEdit_tblstudymeas(sender, record) {
		//set the selected items on the select2 control based on the groupIDs field
		var groupIDs = record["groupIDs"];
		$("#<%= GetControlIdFromTemplate("tblstudymeas","selStudyMeasGroup", 0, "client") %>").val(groupIDs.split(",")).trigger("change");
	}
		

		//function onBeforeClientEdit_tblstudymeas(sender, record, ctlname, fld_with_vals) {
		//	//set the selected items on the select2 control based on the groupIDs field
		//	var IDs = record[fld_with_vals];
		//	$(ctlname).val(IDs.split(",")).trigger("change");
		//}


<%--	    function Select2_to_Hid(sender, record, tbl, select2control, template_idx, idmode)
		{
			var x = $('#<%= GetControlIdFromTemplate(tbl ,select2control, 0, "client") %>');
			var opts = x[0].selectedOptions;

			var selopts = []
			for (i = 0; i < opts.length; i++) {
				selopts.push(opts[i].value);
			}

			var hid = document.getElementById('<%= hidfoo.ClientID %>');
			hid.value = selopts.join(",");
		}--%>

		


	function onBeforeClientUpdate_tblstudymeas(sender, record) {

		//Extract the selected objects from the selct2 control
		var x = $('#<%= GetControlIdFromTemplate("tblstudymeas","selStudyMeasGroup", 0, "client") %>');
		var opts = x[0].selectedOptions;

		var selopts = []
		for (i = 0; i < opts.length; i++ ){
			selopts.push(opts[i].value);
		}

		var hid = document.getElementById('<%= hidStudyMeasGroup.ClientID %>');
		hid.value = selopts.join(",");


		//record["groupIDs"] = selopts.join(",");

		//PageMethods.Update("tblStudyMeas","update", record);

		return true;
	}


	function onClientCancelEdit_tblstudymeas(sender, index) {
					
	}

		
	</script>


	<asp:HiddenField ID="hidStudyMeasGroup" runat="server" />


	<asp:Label ID="lblTitle" runat="server" Text="Study Design:" Font-size="Medium" ></asp:Label>
	<asp:Label ID="lblStudyname" runat="server" Font-size="Medium"  Font-Bold="true"></asp:Label>



	<br />
	<br />


	<table>
		<tr>
			<td  style="vertical-align:top"> 
				<asp:Label ID="lbl_tblgroup" runat="server" Text="Groups" Font-size="Medium"  Font-Bold="true"></asp:Label><br />
				<oajax:CallbackPanel runat="server" ID="callbackPanel_tblgroup">
					<content style="color: darkred;">
						<asp:Literal id="tblgroup_msg" runat="server" />
					</content>
				</oajax:CallbackPanel>

			</td>
			<td></td>
			<td style="vertical-align:top">
				<asp:Label ID="lbl_tbltimepoint" runat="server" Text="Timepoints" Font-size="Medium"  Font-Bold="true"></asp:Label><br />
				<oajax:CallbackPanel runat="server" ID="callbackPanel_tbltimepoint">
					<content style="color: darkred;">
						<asp:Literal id="tbltimepoint_msg" runat="server" />
					</content>
				</oajax:CallbackPanel>
				

			</td>
			<td></td>
			<td style="vertical-align:top">

				<asp:Label ID="lbl_study_subjstatus" runat="server" Text="Subject Status" Font-size="Medium"  Font-Bold="true"></asp:Label>
					&nbsp;&nbsp;&nbsp;&nbsp;
				<asp:HyperLink ID="hypSubjStatus" runat="server" BackColor="AliceBlue" ForeColor="Navy" Font-Size="XX-Small"
						Text="Create New Subj Status" Target="_blank"></asp:HyperLink>

				<oajax:CallbackPanel runat="server" ID="callbackPanel_tblstudy_subjstatus">
					<content style="color: darkred;">
						<asp:Literal id="tblstudy_subjstatus_msg" runat="server" />
					</content>
				</oajax:CallbackPanel>
				

			</td>
		</tr>
		<tr>
			<td style="vertical-align:top" style="width: 400px">
				<asp:Panel ID="panel_tblgroup" runat="server">
					<obout:Grid ID="grid_tblgroup" runat="server" AutoGenerateColumns="false" AllowAddingRecords="true"  AllowSorting="false"
						ShowFooter="false" FolderStyle="~/App_Obout/Grid/styles/gray_glass"
						OnInsertCommand="grid_tblgroup_InsertCommand" 
						OnUpdateCommand="grid_tblgroup_UpdateCommand" 
						OnDeleteCommand="grid_tblgroup_DeleteCommand">
						<AddEditDeleteSettings AddLinksPosition="Top"  NewRecordPosition="Top"/>
						<ClientSideEvents OnClientDelete="UpdateMsg" OnClientInsert="UpdateMsg" OnClientUpdate="UpdateMsg" ExposeSender="true" />
						<Columns>
							<obout:Column DataField="studyID" Width="80" ReadOnly="true" Visible="false"></obout:Column>
							<obout:Column DataField="groupID" HeaderText="gID" Width="60" ReadOnly="true"></obout:Column>
							<obout:Column DataField="groupname" HeaderText="Group" Width="150"></obout:Column>
							<obout:Column DataField="groupabbr" HeaderText="Abbr" Width="100"></obout:Column>
							<obout:Column DataField="sortorder" HeaderText="SortOrd" Width="70"></obout:Column>
							<obout:Column AllowDelete="true" AllowEdit="true" Width="100"></obout:Column>
						</Columns>
					</obout:Grid>



				</asp:Panel>

			</td>
			<td style="width: 50px"></td>
			<td style="vertical-align:top" style="width: 400px">
				<asp:Panel ID="panel_tbltimepoint" runat="server">
					<obout:Grid ID="grid_tbltimepoint" runat="server"  AutoGenerateColumns="false"  AllowAddingRecords="true" AllowSorting="false" ShowFooter="false" 
						OnInsertCommand="grid_tbltimepoint_InsertCommand"  
						OnDeleteCommand="grid_tbltimepoint_DeleteCommand" 
						OnUpdateCommand="grid_tbltimepoint_UpdateCommand" >
						<AddEditDeleteSettings AddLinksPosition="Top"  NewRecordPosition="Top"/>
						<ClientSideEvents OnClientDelete="UpdateMsg" OnClientInsert="UpdateMsg" OnClientUpdate="UpdateMsg" ExposeSender="true" />
						
						<Columns>
							<obout:Column DataField="objtype" Width="80" ReadOnly="true" Visible="false"></obout:Column>
							<obout:Column DataField="studyID" Width="80" ReadOnly="true" Visible="false"></obout:Column>
							<obout:Column DataField="timepointID" HeaderText="tpID" Width="60"  ReadOnly="true"></obout:Column>
							<obout:Column DataField="timepoint" Width="80"></obout:Column>
							<obout:Column DataField="timepoint_text" Width="120"></obout:Column>
							<obout:Column AllowDelete="true" AllowEdit="true" Width="100"></obout:Column>
						</Columns>
					</obout:Grid>
				</asp:Panel>

			</td>
			<td style="width: 50px"></td>
			<td style="vertical-align:top" style="width: 400px">
				<asp:Panel ID="panel1" runat="server">
					<obout:Grid ID="grid_tblsubjstatus" runat="server"  AutoGenerateColumns="false"  AllowAddingRecords="true" AllowSorting="false" ShowFooter="false" CallbackMode="true" 
						OnInsertCommand="grid_tblsubjstatus_InsertCommand"  
						OnDeleteCommand="grid_tblsubjstatus_DeleteCommand" 
						OnUpdateCommand="grid_tblsubjstatus_UpdateCommand" >
						<AddEditDeleteSettings AddLinksPosition="Top" NewRecordPosition="Top" />
						<ClientSideEvents OnClientDelete="UpdateMsg" OnClientInsert="UpdateMsg" OnClientUpdate="UpdateMsg" ExposeSender="true"  />
						 
						<Columns>
							<obout:Column DataField="objtype" Width="80" ReadOnly="true" Visible="false"></obout:Column>
							<obout:Column DataField="studyID" Width="80" ReadOnly="true" Visible="false"></obout:Column>
							<obout:Column DataField="ssID" HeaderText="ssID" Width="60" ReadOnly="true"  >
							</obout:Column>
							<obout:Column DataField="subjstatus" HeaderText="Subject Status" Width="150" >
								<TemplateSettings TemplateID="grid_tblsubjstatus_tmp0" EditTemplateId="grid_tblsubjstatus_tmp1" />
							</obout:Column>
							<obout:Column AllowDelete="true"  Width="80"></obout:Column>
						</Columns>
						<Templates>
							<obout:GridTemplate runat="server" ID="grid_tblsubjstatus_tmp0" > <%--ControlID="ddlSubjstatus" ControlPropertyName="value">--%>
								<Template>
									  <asp:Label ID="lbl2" runat="server" Text='<%#  DataBinder.Eval(Container.DataItem, "[subjstatus]") %>' ></asp:Label>
								</Template>
							</obout:GridTemplate>
							<obout:GridTemplate runat="server" ID="grid_tblsubjstatus_tmp1" ControlID="ddlSubjstatus" ControlPropertyName="value">
								<Template>
									<obout:OboutDropDownList runat="server" ID="ddlSubjstatus" ForeColor="Blue"
										DataSourceID="sql_SubjStatus" DataValueField="ssID" DataTextField="subjstatus" />

								</Template>
							</obout:GridTemplate>
						</Templates>
					</obout:Grid>
				</asp:Panel>

			</td>
		</tr>
	</table>




	<br /><br />

	
		<table>
		<tr>
			<td  style="vertical-align:top"> 
				<asp:Label ID="lbl_tblstudyaction" runat="server" Text="Actions" Font-size="Medium"  Font-Bold="true"></asp:Label>
					&nbsp;&nbsp;&nbsp;&nbsp;
				<asp:HyperLink ID="hypNEW_ActionType" runat="server" BackColor="AliceBlue" ForeColor="Navy" Font-Size="XX-Small"
						Text="Create New Action Type" Target="_blank"></asp:HyperLink>
				<oajax:CallbackPanel runat="server" ID="callbackPanel_tblstudyaction">
					<content style="color: darkred;">
						<asp:Literal id="tblstudyaction_msg" runat="server" />&nbsp;&nbsp;&nbsp;
						<asp:Button ID="btnOVERRIDE_tblstudyaction" runat="server" Text="Allow This Deletion" OnClick="btnOVERRIDE_tblstudyaction_Click" Font-Size="X-Small" ForeColor="red"  Visible="false" />
					</content>
				</oajax:CallbackPanel>

			</td>
			<td style="width: 50px"></td>
			<td style="vertical-align:top">
				<asp:Label ID="lbl_tblstudymeas" runat="server" Text="Measures" Font-size="Medium"  Font-Bold="true"></asp:Label>
					&nbsp;&nbsp;&nbsp;&nbsp;
				<asp:HyperLink ID="hypMeasure" runat="server" BackColor="AliceBlue" ForeColor="Navy" Font-Size="XX-Small"
						Text="Create New Measure" Target="_blank"></asp:HyperLink>

				<oajax:CallbackPanel runat="server" ID="callbackPanel_tblstudymeas">
					<content style="color: darkred;">
						<asp:Literal id="tblstudymeas_msg" runat="server"  />&nbsp;&nbsp;&nbsp;
						<asp:Button ID="btnOVERRIDE_tblstudymeas" runat="server" Text="Allow This Deletion" OnClick="btnOVERRIDE_tblstudymeas_Click" Font-Size="X-Small" ForeColor="red"  Visible="false" />
					</content>
				</oajax:CallbackPanel>
				<asp:HiddenField ID="hidstudymeasID_toDelete" runat="server" />

			</td>
		</tr>
			<tr>
				<td style="vertical-align:top" style="width: 400px">

<br />

						<obout:Grid ID="grid_tblstudyaction" runat="server"  AutoGenerateColumns="false"  AllowAddingRecords="true" AllowSorting="false" ShowFooter="false" 
							 AllowGrouping="true" GroupBy="timepoint_text"  HideColumnsWhenGrouping="true"
							 AllowPaging="false" PageSize="-1" FolderStyle="~/App_Obout/Grid/styles/gray_glass"
						OnInsertCommand="grid_tblstudyaction_InsertCommand"  
						OnDeleteCommand="grid_tblstudyaction_DeleteCommand" 
						OnUpdateCommand="grid_tblstudyaction_UpdateCommand" >
						<AddEditDeleteSettings AddLinksPosition="Top" NewRecordPosition="Top" />
							<GroupingSettings AllowChanges="true" />
						<ClientSideEvents OnClientDelete="UpdateMsg" OnClientInsert="UpdateMsg" OnClientUpdate="UpdateMsg" ExposeSender="true" 
							OnBeforeClientEdit="onBeforeClientEdit_tblstudyaction" />
						<TemplateSettings RowEditTemplateId="grid_tblstudyaction_rowedit" />
						<Columns>
							<obout:Column DataField="objtype" Width="80" ReadOnly="true" Visible="false"></obout:Column>
							<obout:Column DataField="groupIDs" Width="120"  Visible="false">
								 <TemplateSettings RowEditTemplateControlId="lst_group_studyaction"  RowEditTemplateControlPropertyName="value" /> 
							</obout:Column>
							<obout:Column DataField="groupabbrs" Width="120" ParseHTML="true" Visible="true"></obout:Column>
							<obout:Column DataField="studyID" Width="80" ReadOnly="true" Visible="false"></obout:Column>
							<obout:Column DataField="timepointID" HeaderText="tpID" Width="60" Visible="false" >
								<TemplateSettings RowEditTemplateControlId="ddlTimepoint" RowEditTemplateControlPropertyName="value" />
								<%--<TemplateSettings   EditTemplateId="grid_studyaction_tmpTP1" />--%>
							</obout:Column>
							<obout:Column DataField="timepoint_text" HeaderText="Timepoint" Width="60" ></obout:Column>
							<obout:Column DataField="studyactionID" HeaderText="saID" Width="60"  ReadOnly="true"></obout:Column>
							<obout:Column DataField="actiontypeID" HeaderText="Action Type" Width="150" >
								<TemplateSettings TemplateID="grid_studyaction_tmp0" RowEditTemplateControlId="ddlActiontype" RowEditTemplateControlPropertyName="value" />
								<%--<TemplateSettings TemplateID="grid_studyaction_tmp0" EditTemplateId="grid_studyaction_tmp1" />--%>
							</obout:Column>
							<obout:Column DataField="actiontext" HeaderText="Action" Width="120">
								<TemplateSettings RowEditTemplateControlId="txt_actiontext" RowEditTemplateControlPropertyName="value" />
							</obout:Column>
							
							<obout:Column AllowDelete="true" AllowEdit="true" Width="100"></obout:Column>
						</Columns>
						<Templates>
							<obout:GridTemplate runat="server" ID="grid_tblstudyaction_rowedit">
								<Template>
									<table>
										<tr>
											<td style="vertical-align:top">
												<obout:OboutDropDownList runat="server" ID="ddlTimepoint" ForeColor="Blue"
													DataSourceID="sql_Timepoint" DataValueField="timepointID" DataTextField="timepoint_text" />
											<br />
												Groups:<br />
												<select id="selStudyActionGroup" runat="server" multiple="true" style="width:200px" class="example_select2"     ></select>

											</td>
											<td style="vertical-align:top">
												<obout:OboutDropDownList runat="server" ID="ddlActiontype" ForeColor="Blue"
													DataSourceID="sql_Actiontype" DataValueField="actiontypeID" DataTextField="actiontype" />
												<br />
												Action:<br />
												<obout:OboutTextBox runat="server" ID="txt_actiontext" ></obout:OboutTextBox>
											</td>
										</tr>
									</table>
								</Template>
							</obout:GridTemplate>


							<obout:GridTemplate runat="server" ID="grid_tblstudyaction_tmp0" >
								<Template>
									  <asp:Label ID="lbl2" runat="server" Text='<%#  DataBinder.Eval(Container.DataItem, "[actiontype]") %>' ></asp:Label>
								</Template>
							</obout:GridTemplate>
						</Templates>
					</obout:Grid>
				</td>
				<td style="width: 50px"></td>
				<td style="vertical-align:top">


<%--                    FolderStyle="~/App_Obout/Grid/styles/gray_glass"--%>
					<%--OnUpdateCommand="grid_studymeas_UpdateCommand" --%>

<%--                    							OnBeforeClientUpdate="function(sender, record) {Select2_to_Hid(sender, record, 'selStudyMeasGroup', 'hidStudyMeasGroup');}" --%>


					<obout:Grid ID="grid_tblstudymeas" runat="server"   AutoGenerateColumns="false"  AllowAddingRecords="true" AllowSorting="true" ShowFooter="false" 
							 AllowGrouping="true" GroupBy="timepoint_text" HideColumnsWhenGrouping="true"
							 AllowPaging="false" PageSize="-1"  OnRowDataBound="grid_tblstudymeas_RowDataBound"  CallbackMode="true"
						OnInsertCommand="grid_tblstudymeas_InsertCommand"  
						OnUpdateCommand="grid_tblstudymeas_UpdateCommand"  
						OnDeleteCommand="grid_tblstudymeas_DeleteCommand" 
						>
						<AddEditDeleteSettings AddLinksPosition="Top"  NewRecordPosition="Top"/>
						<CssSettings CSSRowEditTemplate="rowedittemplate_css" />
						<GroupingSettings AllowChanges="true" />
						<ClientSideEvents OnClientDelete="UpdateMsg" OnClientInsert="UpdateMsg" OnClientUpdate="UpdateMsg" ExposeSender="true"  
							OnBeforeClientEdit="onBeforeClientEdit_tblstudymeas"
							OnBeforeClientUpdate="onBeforeClientUpdate_tblstudymeas"
							OnClientCancelEdit="onClientCancelEdit_tblstudymeas"     />
						<TemplateSettings RowEditTemplateId="grid_tblstudymeas_rowedit"   />
						<Columns>
							<obout:Column DataField="objtype" Width="80" ReadOnly="true" Visible="false"></obout:Column>
							<obout:Column DataField="groupIDs" Width="120"  Visible="false">
								<TemplateSettings RowEditTemplateControlId="hidStudyMeasGroup_tpl" RowEditTemplateControlPropertyName="value" />
							</obout:Column>
							<obout:Column DataField="groupabbrs" Width="120"  Visible="true" ParseHTML="true"></obout:Column>
							<obout:Column DataField="studyID" Width="80" ReadOnly="true" Visible="false"></obout:Column>
							<obout:Column DataField="timepointID" HeaderText="tpID" Width="60" Visible="false">
								<TemplateSettings RowEditTemplateControlId="ddlTimepoint2" RowEditTemplateControlPropertyName="value"  />
							</obout:Column>
							<obout:Column DataField="timepoint_text" HeaderText="Timepoint" Width="120"  ReadOnly="true"></obout:Column>
							<obout:Column DataField="measureID" HeaderText="mID" Width="60">
								<TemplateSettings RowEditTemplateControlId="ddlMeasure" RowEditTemplateControlPropertyName="value" />
							</obout:Column>
							<obout:Column DataField="studymeasID" HeaderText="smID" Width="60"  ReadOnly="true"></obout:Column>
							<obout:Column DataField="studymeasname" HeaderText="StudyMeas" Width="140">
								<TemplateSettings  RowEditTemplateControlId="txt_studymeasname" RowEditTemplateControlPropertyName="value" />
							</obout:Column>
							<obout:Column AllowDelete="true" AllowEdit="true" Width="100"></obout:Column>
						</Columns>
						<Templates>
							<obout:GridTemplate runat="server" ID="grid_tblstudymeas_rowedit" >
								<Template   >
												
									<table style="background-color: mintcream;" width="100%">
										<tr>
											<td style="vertical-align:top">
												Time point:<br />
												<obout:OboutDropDownList runat="server" ID="ddlTimepoint2" ForeColor="Blue"
													DataSourceID="sql_Timepoint" DataValueField="timepointID" DataTextField="timepoint_text" />
												<br />
												Groups:<br />
												<select id="selStudyMeasGroup" runat="server" multiple="true" style="width:200px" class="example_select2"     ></select>
												<asp:HiddenField ID="hidStudyMeasGroup_tpl" runat="server" />
											</td>
											<td style="vertical-align:top">
												Measure:<br />
												<obout:OboutDropDownList runat="server" ID="ddlMeasure" ForeColor="Blue" Height="300"
													DataSourceID="sql_Measure" DataValueField="measureID" DataTextField="measname"  >
													<ClientSideEvents OnSelectedIndexChanged="ddlMeasure_Change" />
												</obout:OboutDropDownList>
												<br />
												Studymeas name:<br />
												<obout:OboutTextBox runat="server" ID="txt_studymeasname" ></obout:OboutTextBox>
												<br />
												Inside Action:<br />
												<obout:OboutDropDownList runat="server" ID="ddlstudymeas_ParentAction" ForeColor="Blue" Height="300"
													 DataSourceID="sql_ParentStudyaction" DataValueField="studyactionID" DataTextField="actiontext"  >
													<%--<ClientSideEvents OnSelectedIndexChanged="ddlstudymeas_ParentAction_Change" />--%>
												</obout:OboutDropDownList>											</td>
										</tr>
									</table>


								</Template>
							</obout:GridTemplate>


							<obout:GridTemplate runat="server" ID="GridTemplate2" >
								<Template>
									  <asp:Label ID="lbl2" runat="server" Text='<%#  DataBinder.Eval(Container.DataItem, "[actiontype]") %>' ></asp:Label>
								</Template>
							</obout:GridTemplate>
						</Templates>
					</obout:Grid>
				</td>
			</tr>
			</table>

	<br /><br />

	<asp:PlaceHolder ID="TreePlaceholder" runat="server"></asp:PlaceHolder>

<%--	<obout:Tree ID="ObClassicTree" CssClass="vista"  runat="server"
			OnTreeNodeDataBound="ObClassicTree_TreeNodeDataBound">
			<DataBindings>
				<obout:NodeBinding DataSourceColumnID="studymeasID" DataSourceColumnParentID="timepointID"
					Expanded="true" />
			</DataBindings>
		</obout:Tree>--%>


	<asp:Panel ID="panel_action" runat="server"></asp:Panel>

	<br /><br />

	<asp:Panel ID="panel_measure" runat="server"></asp:Panel>


	<asp:SqlDataSource ID="sql_Group" runat="server" SelectCommandType="Text" ConnectionString="<%$ ConnectionStrings:TRACKING_CONN_STRING %>"
				SelectCommand="select groupID, groupname from uwautism_research_backend..tblgroup  where studyID= (select dbo.fnDefaultStudyIDByCurrentUser())">
	</asp:SqlDataSource>

	<asp:SqlDataSource ID="sql_SubjStatus" runat="server" SelectCommandType="Text" ConnectionString="<%$ ConnectionStrings:TRACKING_CONN_STRING %>"
				SelectCommand="select ssID, subjstatus from uwautism_research_backend..tblSS where studyID =  dbo.fnDefaultStudyIDByCurrentUser()">
	</asp:SqlDataSource>


	<asp:SqlDataSource ID="sql_Actiontype" runat="server" SelectCommandType="Text" ConnectionString="<%$ ConnectionStrings:TRACKING_CONN_STRING %>"
				SelectCommand="select actiontypeID, actiontype from uwautism_research_backend..tblactiontype_lkup">
	</asp:SqlDataSource>

	<asp:SqlDataSource ID="sql_Timepoint" runat="server" SelectCommandType="Text" ConnectionString="<%$ ConnectionStrings:TRACKING_CONN_STRING %>"
				SelectCommand="select timepointID, timepoint_text from uwautism_research_backend..tblTimepoint where studyID= (select dbo.fnDefaultStudyIDByCurrentUser())">
	</asp:SqlDataSource>

	<asp:SqlDataSource ID="sql_Measure" runat="server" SelectCommandType="Text" ConnectionString="<%$ ConnectionStrings:TRACKING_CONN_STRING %>"
				SelectCommand="select 0 measureID, '--select measure--' measname, '' measfullname  union select measureID, measname, measfullname from uwautism_research_backend..tblMeasure where measname not like '2del%' order by measname">
	</asp:SqlDataSource>

	<asp:SqlDataSource ID="sql_ParentStudyaction" runat="server" SelectCommandType="Text" ConnectionString="<%$ ConnectionStrings:TRACKING_CONN_STRING %>"
				SelectCommand="select 0 studyactionID, '--select action--' actiontext union select studyactionID, actiontext from uwautism_research_backend..tblStudyaction where actiontypeID in (1,2,4) and studyID= (select dbo.fnDefaultStudyIDByCurrentUser()) order by actiontext">
	</asp:SqlDataSource>





</asp:Content>

