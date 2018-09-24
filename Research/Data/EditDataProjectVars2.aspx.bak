<%@ Page Title="Edit Data Project" Language="C#" EnableEventValidation="false" MasterPageFile="~/UWAC.master"
	 AutoEventWireup="true" CodeFile="EditDataProjectVars2.aspx.cs" Inherits="Data_EditDataProjectVars2" %>
<%@ MasterType VirtualPath="~/UWAC.master" %>

<%@ Register Assembly="Obout.Ajax.UI" Namespace="Obout.Ajax.UI.HTMLEditor.ToolbarButton" TagPrefix="obout" %>
<%@ Register Assembly="Obout.Ajax.UI" Namespace="Obout.Ajax.UI.HTMLEditor" TagPrefix="obout" %> 
<%@ Register TagPrefix="obout" Namespace="Obout.SuperForm" Assembly="obout_SuperForm" %> 
<%@ Register TagPrefix="obout" Namespace="Obout.ListBox" Assembly="obout_ListBox" %> 
<%@ Register Assembly="DevExpress.Web.v17.2, Version=17.2.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.ASPxPivotGrid.v17.2, Version=17.2.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxPivotGrid" TagPrefix="dx" %> 
<%@ Register Assembly="DevExpress.Web.ASPxHtmlEditor.v17.2, Version=17.2.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxHtmlEditor" TagPrefix="dx" %> 


<asp:Content ID="Content1" ContentPlaceHolderID="oBodyPlaceHolder" Runat="Server">
	<asp:ScriptManager ID="ScriptManager1" runat="server" EnablePartialRendering="true"></asp:ScriptManager>

	<script type="text/javascript">
		function ShowEdit_Subjects(s, e) {
			foo2.SetVisible(true);
			foo1.SetVisible(false);
		}
	</script>

	<br />

	<asp:Label ID="Label1" runat="server" Text="Data Project:" Font-Size="10pt" Font-Bold="true" ></asp:Label>&nbsp;&nbsp;&nbsp;
	<asp:Label ID="lblStudyName" runat="server" Text="..." Font-Size="12pt" Font-Bold="true" ForeColor="Navy" ></asp:Label>
	<br />
	<asp:Label ID="lblNoProjects" runat="server" Text="No projects yet defined.  Click the 'Add New' button within the grid, enter a title, and click 'Save' to create a new data project." Font-Size="10pt" Font-Bold="true" ForeColor="DarkRed" ></asp:Label>
	<br />

	<asp:Panel id="panel_DetailControls" runat="server" Visible="false">
	<table width="90%">
		<tr>
			<td align="right">
			<obout:OboutButton ID="btnBackToAll" runat="server" Text="Back to all projects" OnClick="btnBackToAll_Click"></obout:OboutButton>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<obout:OboutButton ID="btnPDF" runat="server" Text="Save PDF" OnClick="btnPDF_Click"></obout:OboutButton>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<obout:OboutButton ID="btnSubmit" runat="server" Text="Submit" OnClick="btnSubmit_Click"></obout:OboutButton>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<obout:OboutButton ID="btnDeleteProject" runat="server" Text="Delete this project" ForeColor="DarkRed" OnClick="btnDeleteProject_Click"></obout:OboutButton>

			</td>
		</tr>
		<tr>
			<td align="right">
				<obout:OboutButton ID="btnDownloadData" runat="server" Text="Create Excel Data File" OnClientClick="alertMessage()" OnClick="btnCreateDatafile_Click"></obout:OboutButton>

			</td>
		</tr>
	</table>
	</asp:Panel>


		

	<br />
	
				
<br />

<%--Title, Supervisor--%>

	<table width="90%">
		<tr>
			<td style="width: 100px">
				<dx:ASPxButton ID="btnEdit_Title" runat="server" Text="Title:  " ImagePosition="Right" Image-IconID="actions_edit_16x16devav" Paddings-PaddingBottom="1" Paddings-PaddingLeft="1" Paddings-PaddingRight="1" Paddings-PaddingTop="1" Font-Size="10" 
					ToolTip="Edit Title" OnCommand="btn_Edit_Command" CommandName="Edit" CommandArgument="Title"></dx:ASPxButton>

			</td>
			<td>
				<asp:Label ID="lblTitle" Width="700" runat="server" Font-Size="Medium" Font-Bold="true" ></asp:Label>    
			</td>
			<td align="right">
				<obout:OboutButton ID="btnProjEDIT" runat="server" Text="Edit" OnClick="btnProjEDIT_Click" />    
			</td>
		</tr>
		<tr>
			<td style="vertical-align:top">
				<br />
				Author:
			</td>
			<td>
				<br />
				<asp:Label ID="lblAuthor" runat="server" ></asp:Label> (<asp:Label ID="lblAuthor_email" runat="server" ></asp:Label>)
			</td>
		</tr>
		<tr>
			<td style="vertical-align:top">
				<br />
				Supervisor:
			</td>
			<td>
				<br />
				<asp:Label ID="lblSupervisor" runat="server" ></asp:Label> (<asp:Label ID="lblSupervisor_email" runat="server" ></asp:Label>)
				&nbsp;&nbsp;&nbsp;&nbsp;
				<asp:Label ID="lblApproved" runat="server" Text="" Font-Bold="true" ForeColor="Blue"></asp:Label>
				&nbsp;&nbsp;&nbsp;&nbsp;
				<obout:OboutButton ID="btnApprove" runat="server" Text="I APPROVE THIS PROPOSAL" Visible="false" OnClick="btnApprove_Click"></obout:OboutButton>
			</td>
		</tr>
	</table>


		<%--SUMMARY--%>
	<dx:ASPxPanel ID="panelSummary" runat="server" Visible ="true" >
		<PanelCollection>
			<dx:PanelContent>

		<table>
		<tr>
			<td style="vertical-align:top">
				<br />
				<dx:ASPxPanel ID="panelSummary_VIEW" runat="server" ClientVisible="true" ClientInstanceName="summary_view">
					<PanelCollection>
					<dx:PanelContent>
					<table>
						<tr>
							<td style="vertical-align: top">
								<asp:Label ID="Label9" runat="server" Text="Summary:" Font-Bold="true" Font-Size="10" />
								<br />
								<dx:ASPxButton ID="ASPxButton10" runat="server" Text="Edit" ImagePosition="Right" Image-IconID="actions_edit_16x16devav" Paddings-PaddingBottom="1" Paddings-PaddingLeft="1" Paddings-PaddingRight="1" Paddings-PaddingTop="1" Font-Size="10" ToolTip="Edit Subjects" 
									AutoPostBack="false" >
												<ClientSideEvents Click="function(s,e) {summary_edit.SetVisible(true); summary_view.SetVisible(false);}"  />
									</dx:ASPxButton>
							</td>
							<td style="width: 50px"></td>
							<td style="vertical-align: top">
								<asp:Literal ID="litSummary" runat="server"></asp:Literal>
							</td>


						</tr>
					</table>
					</dx:PanelContent>
					</PanelCollection>
					
				</dx:ASPxPanel>
				<dx:ASPxPanel ID="panelSummary_EDIT" runat="server" ClientVisible="false" ClientInstanceName="summary_edit">
					<PanelCollection>
					<dx:PanelContent>
   
					<table>
						<tr>
							
							<td style="vertical-align: top">
								<asp:Label ID="Label10" runat="server" Text="Summary:" Font-Bold="true" Font-Size="10" />
								<br />
								<dx:ASPxButton ID="ASPxButton12" runat="server" Text="Cancel" ImagePosition="Right" Image-IconID="actions_cancel_16x16" Paddings-PaddingBottom="1" Paddings-PaddingLeft="1" Paddings-PaddingRight="1" Paddings-PaddingTop="1" Font-Size="10" ToolTip="Edit Subjects" 
									AutoPostBack="false" >
										<ClientSideEvents Click="function(s,e) {summary_edit.SetVisible(false); summary_view.SetVisible(true);}"  />
								</dx:ASPxButton>
								<br /><br /><br /><br />
								<dx:ASPxButton ID="ASPxButton11" runat="server" Text="Save" ImagePosition="Right" Image-IconID="save_save_16x16gray" Paddings-PaddingBottom="1" Paddings-PaddingLeft="1" Paddings-PaddingRight="1" Paddings-PaddingTop="1" Font-Size="10" ToolTip="Edit Subjects" 
									OnCommand="btn_Edit_Command" CommandName="Save" CommandArgument="Summary"></dx:ASPxButton>

							</td>
							<td style="width: 50px"></td>
							<td>
								<dx:ASPxHtmlEditor ID="Summary_HtmlEditor" runat="server" Height="900px" ToolbarMode="Ribbon" Width="1200px" Border-BorderColor="Gray" Border-BorderWidth="1px">
									<SettingsDialogs>
									</SettingsDialogs>
								</dx:ASPxHtmlEditor>
							</td>
					



					
						</tr>
					</table>
					</dx:PanelContent>
					</PanelCollection>

				</dx:ASPxPanel>



				<br />

			</td>
		</tr>
	</table>
	<br /><br />
	</dx:PanelContent>
   </PanelCollection>


	</dx:ASPxPanel>

	<br /><br />
	<%--SUBJECTS--%>
	<table>
		<tr>
			<td style="vertical-align:top">
				<dx:ASPxPanel ID="panelSubjects_VIEW" runat="server" Visible="true" ClientEnabled="true" ClientInstanceName="subj_view"  >
					<PanelCollection>
						<dx:PanelContent>
							<table>
								<tr>
									<td style="vertical-align:top">
										<asp:Label ID="Label6" runat="server" Text="Subjects:" Font-Bold="true"  Font-Size="10" />
										<br />
										<dx:ASPxButton ID="btnEdit_Subjects" runat="server" Text="Edit" ImagePosition="Right" Image-IconID="actions_edit_16x16devav" Paddings-PaddingBottom="1" Paddings-PaddingLeft="1" Paddings-PaddingRight="1" Paddings-PaddingTop="1" Font-Size="10" ToolTip="Edit Subjects" 
											 AutoPostBack="false" >
											<ClientSideEvents Click="function(s,e) {subj_edit.SetVisible(true); subj_view.SetVisible(false);}"  />
										</dx:ASPxButton>
									</td>
									<td style="width: 50px"></td>
									<td style="vertical-align: top">
										<dx:ASPxGridView ID="gvViewSubjects" runat="server" AutoGenerateColumns="true" Visible="false" EmptyDataText="No subjects selected yet."></dx:ASPxGridView>
										
										<br />
										<br />
										<dx:ASPxPivotGrid ID="pivotSubjects1" runat="server" OptionsCustomization-AllowFilter="false" OptionsView-ShowFilterHeaders="false">
											
											<Fields>
												<dx:PivotGridField Area="RowArea" AreaIndex="0" FieldName="Group" ID="fldGroup" Caption="Group" Options-AllowFilter="false" Options-AllowSort="false" />
												<dx:PivotGridField Area="ColumnArea" AreaIndex="0" FieldName="subjstatus" ID="fldSubjStatus" Caption="Subject Status" Options-AllowFilter="false" Options-AllowSort="false"/>
												<dx:PivotGridField Area="DataArea" AreaIndex="0" FieldName="id" ID="fieldID" Caption="ID" SummaryType="Count" />

											</Fields>
										</dx:ASPxPivotGrid>

										
										<%--<asp:GridView ID="gvViewSubjects" runat="server" AutoGenerateColumns="true"  EmptyDataText="No subjects selected yet." 
										CellPadding="2" BorderStyle="Solid" BorderColor="Silver"></asp:GridView>--%>
									</td>
								</tr>
							</table>

						</dx:PanelContent>
					</PanelCollection>
				</dx:ASPxPanel>
<%--				<asp:Panel ID="panelSubjects_VIEW" runat="server">

				</asp:Panel>--%>

				<dx:ASPxPanel ID="panelSubjects_EDIT" runat="server" ClientVisible="false"  ClientEnabled="true" ClientInstanceName="subj_edit">
					<PanelCollection>
						<dx:PanelContent>
							<table>
								<tr>                            
									<td style="vertical-align:top">
										<asp:Label ID="Label7" runat="server" Text="Subjects:" Font-Bold="true"  Font-Size="10" />
										<br />
										
										<dx:ASPxButton ID="ASPxButton2" runat="server" Text="Cancel" ImagePosition="Right" Image-IconID="actions_cancel_16x16" Paddings-PaddingBottom="1" Paddings-PaddingLeft="1" Paddings-PaddingRight="1" Paddings-PaddingTop="1" Font-Size="10" ToolTip="Edit Subjects" 
											AutoPostBack="false" >
												<ClientSideEvents Click="function(s,e) {subj_edit.SetVisible(false); subj_view.SetVisible(true);}"  />
										</dx:ASPxButton>                                            
										<br /><br /><br />
										<dx:ASPxButton ID="ASPxButton1" runat="server" Text="Save" ImagePosition="Right" Image-IconID="save_save_16x16gray" Paddings-PaddingBottom="1" Paddings-PaddingLeft="1" Paddings-PaddingRight="1" Paddings-PaddingTop="1" Font-Size="10" ToolTip="Edit Subjects" 
											OnCommand="btn_Edit_Command" CommandName="Save" CommandArgument="Subjects"></dx:ASPxButton>

									</td>
									<td style="width: 50px"></td>
									<td style="vertical-align: top">
										<asp:GridView ID="gvSubjects" runat="server" OnRowDataBound="gvSubjects_RowDataBound" ></asp:GridView>
									</td>
								</tr>
							</table>
						</dx:PanelContent>
					</PanelCollection>
				</dx:ASPxPanel>
			</td>
		</tr>
	</table>
	<br /><br />

	<%--MEASURES--%>
	<table>
	<tr>
		<td style="vertical-align:top">
			<dx:ASPxPanel ID="panelMeasures_VIEW" runat="server"  ClientInstanceName="meas_view">
				<PanelCollection>
					<dx:PanelContent>
						<table>
							<tr>
								<td style="vertical-align: top">
									<asp:Label ID="meas" runat="server" Text="Measures:" Font-Bold="true" Font-Size="10" />
									<br />
									<dx:ASPxButton ID="ASPxButton3" runat="server" Text="Edit" ImagePosition="Right" Image-IconID="actions_edit_16x16devav" Paddings-PaddingBottom="1" Paddings-PaddingLeft="1" Paddings-PaddingRight="1" Paddings-PaddingTop="1" Font-Size="10" ToolTip="Edit Subjects" 
									   AutoPostBack="false" >
												<ClientSideEvents Click="function(s,e) {meas_edit.SetVisible(true); meas_view.SetVisible(false);}"  />
									</dx:ASPxButton>
								</td>
								<td style="width: 50px"></td>
								<td style="vertical-align: top">
									<asp:GridView ID="gvViewMeas" runat="server" AutoGenerateColumns="false"  EmptyDataText="No measures selected yet."
										CellPadding="3" BorderStyle="Solid" BorderColor="Silver" OnRowDataBound="gvViewMeas_RowDataBound">
										<Columns>
											<asp:BoundField HeaderText="Category" DataField="Category" />
											<asp:BoundField HeaderText="Measure" DataField="Measure"	/>
											<asp:BoundField HeaderText="Include REL?" DataField="hasREL"	/>
											<asp:BoundField HeaderText="Time Points" DataField="TimePoints"	/>
											<asp:BoundField HeaderText="Measure Added" DataField="MeasureAdded" DataFormatString="{0:g}" />
											<asp:BoundField HeaderText="Time since meas added" DataField="TimeSinceMeasAdded" ItemStyle-HorizontalAlign="Center" />
											<asp:BoundField HeaderText="Vars last edited" DataField="VarsLastEdited" DataFormatString="{0:g}"/>
											<asp:BoundField HeaderText="Time since vars last edited" DataField="TimeSinceLastEdited" ItemStyle-HorizontalAlign="Center" />
								
											<asp:TemplateField ItemStyle-HorizontalAlign="Center" HeaderText="Select Vars">
												<ItemTemplate>
													<asp:Button ID="btnEditVars" runat="server" Text='<%#  "N=" + DataBinder.Eval(Container.DataItem, "[N_Vars]") %>'  Font-Size="XX-Small"  OnCommand="btnEditVars_Command" 
															CommandName="EditVars"  CommandArgument='<%#  DataBinder.Eval(Container.DataItem, "[measureID]") %>' />
												</ItemTemplate>
											</asp:TemplateField>
										</Columns>
									</asp:GridView>
									<br />
									<dx:ASPxPivotGrid ID="pivotMeasures1" runat="server" OptionsCustomization-AllowFilter="false" OptionsView-ShowFilterHeaders="false">
											
										<Fields>
											<dx:PivotGridField Area="RowArea" AreaIndex="0" FieldName="Category" ID="fldMeasCat" Caption="Category" Options-AllowFilter="false" Options-AllowSort="false" />
											<dx:PivotGridField Area="RowArea" AreaIndex="1" FieldName="Measure" ID="fldMeas" Caption="Measure" Options-AllowFilter="false" Options-AllowSort="false" />
											<dx:PivotGridField Area="ColumnArea" AreaIndex="0" FieldName="timepoint_text" ID="fldTimepoint" Caption="Time Point" Options-AllowFilter="false" Options-AllowSort="false"/>
											<dx:PivotGridField Area="DataArea" AreaIndex="0" FieldName="studymeasID" ID="fldstudymeasID" Caption="studymeasID" SummaryType="Count" />

										</Fields>
									</dx:ASPxPivotGrid>

								</td>
							</tr>
						</table>
					</dx:PanelContent>
				</PanelCollection>
			</dx:ASPxPanel>

			<dx:ASPxPanel ID="panelMeasures_EDIT" runat="server" ClientVisible="false" ClientInstanceName="meas_edit">
				<PanelCollection>
					<dx:PanelContent>

						<table>
							<tr>

								<td style="vertical-align: top">
									<asp:Label ID="Label2" runat="server" Text="Measures:" Font-Bold="true"  Font-Size="10" />
									<br />
									<br />
									<asp:CheckBox ID="chkShowREL" runat="server" Text="Include Reliability measures" />  
									<br />
									<dx:ASPxButton ID="ASPxButton6" runat="server" Text="Refresh" ImagePosition="Right" Image-IconID="actions_refresh2_16x16" Paddings-PaddingBottom="1" Paddings-PaddingLeft="1" Paddings-PaddingRight="1" Paddings-PaddingTop="1" Font-Size="10" ToolTip="Edit Subjects" 
										OnCommand="btn_Edit_Command" CommandName="Refresh" CommandArgument="Measures"></dx:ASPxButton>
									<br /><br /><br />

									<dx:ASPxButton ID="ASPxButton5" runat="server" Text="Cancel" ImagePosition="Right" Image-IconID="actions_cancel_16x16" Paddings-PaddingBottom="1" Paddings-PaddingLeft="1" Paddings-PaddingRight="1" Paddings-PaddingTop="1" Font-Size="10" ToolTip="Edit Subjects" 
									   AutoPostBack="false" >
												<ClientSideEvents Click="function(s,e) {meas_edit.SetVisible(false); meas_view.SetVisible(true);}"  />
									</dx:ASPxButton>                                            


									<br /><br /><br />

									<dx:ASPxButton ID="ASPxButton4" runat="server" Text="Save" ImagePosition="Right" Image-IconID="save_save_16x16gray" Paddings-PaddingBottom="1" Paddings-PaddingLeft="1" Paddings-PaddingRight="1" Paddings-PaddingTop="1" Font-Size="10" ToolTip="Edit Subjects" 
										OnCommand="btn_Edit_Command" CommandName="Save" CommandArgument="Measures"></dx:ASPxButton>

									<br /><br /><br />
									<obout:OboutButton ID="btnRefresh" runat="server" Font-Size="XX-Small" Text="Refresh" OnClick="btnRefresh_Click"></obout:OboutButton>


								</td>
								<td style="width: 50px"></td>
								<td style="vertical-align: top">

									<asp:GridView ID="gvMeasures" runat="server" OnRowDataBound="gvMeasures_RowDataBound" OnDataBound="gvMeasures_DataBound" EnableViewState="true"  ></asp:GridView>
								</td>
							</tr>
						</table>
				   </dx:PanelContent>
				</PanelCollection>			

									
			</dx:ASPxPanel>

		</td>
	</tr>
	</table>
	<br /><br />

	<%--INT HX--%>
	<dx:ASPxPanel ID="panelIntHx" runat="server" Visible ="true" >
		<PanelCollection>
			<dx:PanelContent>

		<table>
		<tr>
			<td style="vertical-align:top">
				<br />
				<dx:ASPxPanel ID="panel_IntHx_VIEW" runat="server" ClientVisible="true" ClientInstanceName="inthx_view">
					<PanelCollection>
					<dx:PanelContent>
					<table>
						<tr>
							<td style="vertical-align: top">
								<asp:Label ID="Label8" runat="server" Text="IntHx Data:" Font-Bold="true" Font-Size="10" />
								<br />
								<dx:ASPxButton ID="ASPxButton7" runat="server" Text="Edit" ImagePosition="Right" Image-IconID="actions_edit_16x16devav" Paddings-PaddingBottom="1" Paddings-PaddingLeft="1" Paddings-PaddingRight="1" Paddings-PaddingTop="1" Font-Size="10" ToolTip="Edit Subjects" 
									AutoPostBack="false" >
												<ClientSideEvents Click="function(s,e) {inthx_edit.SetVisible(true); inthx_view.SetVisible(false);}"  />
									</dx:ASPxButton>
							</td>
							<td style="width: 50px"></td>
							<td style="vertical-align: top">
								<dx:ASPxGridView ID="gridViewIntHx" runat="server" DataSourceID="sqlIntHxParams" AutoGenerateColumns="False" Width="100%" KeyFieldName="dataproj_pk" >
								<Columns>
		<%--							<dx:GridViewDataCheckColumn  FieldName="includeWeeks" Caption="By Weeks"   VisibleIndex="1"></dx:GridViewDataCheckColumn>
									<dx:GridViewDataCheckColumn  FieldName="includeType" Caption="By Type"   VisibleIndex="2"></dx:GridViewDataCheckColumn>
									<dx:GridViewDataCheckColumn  FieldName="includeCat" Caption="By Category"  VisibleIndex="3"></dx:GridViewDataCheckColumn>--%>
									<dx:GridViewDataTokenBoxColumn FieldName="periods" Caption="Included Periods" VisibleIndex="4">
										<PropertiesTokenBox DataSourceID="sqlPERIOD" TextField="period" ValueField="period" AllowCustomTokens="false"></PropertiesTokenBox>
									</dx:GridViewDataTokenBoxColumn>
									<dx:GridViewDataTokenBoxColumn FieldName="types"  Caption="Included TxTypes" VisibleIndex="5">
										<PropertiesTokenBox DataSourceID="sqlTYPE" TextField="txtypetext" ValueField="txtypeID" AllowCustomTokens="false"></PropertiesTokenBox>
									</dx:GridViewDataTokenBoxColumn>
									<dx:GridViewDataTokenBoxColumn FieldName="cats"  Caption="Included TxCategories" VisibleIndex="6">
										<PropertiesTokenBox DataSourceID="sqlCAT" TextField="txcat" ValueField="txcatID" AllowCustomTokens="false"></PropertiesTokenBox>
									</dx:GridViewDataTokenBoxColumn>
									<dx:GridViewDataCheckColumn  FieldName="dataproj_pk" ReadOnly="true" Visible="false"   ></dx:GridViewDataCheckColumn>
								</Columns>
							</dx:ASPxGridView>


							</td>


						</tr>
					</table>
					</dx:PanelContent>
					</PanelCollection>
					
				</dx:ASPxPanel>
				<dx:ASPxPanel ID="panel_IntHx_EDIT" runat="server" ClientVisible="false" ClientInstanceName="inthx_edit">
					<PanelCollection>
					<dx:PanelContent>
   
					<table>
						<tr>
							
							<td style="vertical-align: top">
								<asp:Label ID="Label5" runat="server" Text="IntHx Data:" Font-Bold="true" Font-Size="10" />
								<br />
							</td>
							<td style="width: 50px"></td>
							<td>
								<asp:Label ID="lblIntHxSettings" runat="server" Text="Settings for Int Hx Data" Font-Bold="true" Font-Size="Medium" ></asp:Label>					
								<br />
								<asp:Label ID="lblIntHxSettings_info" runat="server" Text="Use the table below to edit IntHx data settings." Font-Bold="true" Font-Size="X-Small" ></asp:Label>					

								<table style="border: solid; border-collapse: separate; border-color: silver; padding: 3px; text-align: center">
										<tr style="background-color:silver;">
											<td></td>
											<td><b>By Weeks</b></td>
											<td><b>By Type</b></td>
											<td><b>By Category</b></td>
										</tr>
										<tr>
											<td  style="background-color:silver;"><b><i>Time Dimension</i></b></td>
											<td>Weekly</td>
											<td>by Period</td>
											<td>by Period</td>
										</tr>
										<tr>
											<td style="background-color:silver;"><b><i>Content Dimension</i></b></td>
											<td>Each Tx Type<br />(~25 different types)</td>
											<td>Each Tx Type<br />(~25 different types)</td>
											<td>Each Tx Category<br />(~8 different categories)</td>
										</tr>
						
								</table>
							</td>
							<td style="width: 50px"></td>
							<td>
								<asp:GridView ID="gvIntHx" runat="server" AutoGenerateColumns="false" OnRowDataBound="gvMeasuresIntHx_RowDataBound" EnableViewState="true"  >
									<Columns>
										<asp:BoundField DataField="measname" HeaderText="Measure" />
										<asp:BoundField DataField="nvars" HeaderText="Nvars" />
										<asp:BoundField DataField="nrecords" HeaderText="Nrecords" />
										<%--<asp:TemplateField HeaderText="Include">
											<ItemTemplate>
												<asp:CheckBox ID="chkIntHx" runat="server"  />
												<asp:HiddenField ID="hidMeasureID" runat="server" EnableViewState="true" />
												<asp:Label ID="lblMeasureID" runat="server" Visible="false" />
											</ItemTemplate>
										</asp:TemplateField>--%>
										<asp:BoundField DataField="measureID" Visible="false" />
										<asp:BoundField DataField="studymeasID" Visible="false" />
									</Columns>
								</asp:GridView>

							</td>
						</tr>
						<tr>
							<td>    </td>
							<td style="width: 50px">    </td>
							<td>    
					<dx:ASPxGridView ID="gridIntHx" runat="server" DataSourceID="sqlIntHxParams" AutoGenerateColumns="False" Width="100%" KeyFieldName="dataproj_pk" 
						OnHtmlDataCellPrepared="gridIntHx_OnHtmlDataCellPrepared"  >
						<Columns>
								<dx:GridViewCommandColumn ShowEditButton="true" VisibleIndex="0" />
							<dx:GridViewDataCheckColumn  FieldName="includeWeeks" Caption="By Weeks"   VisibleIndex="1"></dx:GridViewDataCheckColumn>
							<dx:GridViewDataCheckColumn  FieldName="includeType" Caption="By Type"   VisibleIndex="2"></dx:GridViewDataCheckColumn>
							<dx:GridViewDataCheckColumn  FieldName="includeCat" Caption="By Category"  VisibleIndex="3"></dx:GridViewDataCheckColumn>
							<dx:GridViewDataTokenBoxColumn FieldName="periods" Caption="Included Periods" VisibleIndex="4">
								<PropertiesTokenBox DataSourceID="sqlPERIOD" TextField="period" ValueField="period" AllowCustomTokens="false"></PropertiesTokenBox>
							</dx:GridViewDataTokenBoxColumn>
							<dx:GridViewDataTokenBoxColumn FieldName="types" Caption="Included TxTypes" VisibleIndex="5">
								<PropertiesTokenBox DataSourceID="sqlTYPE" TextField="txtypetext" ValueField="txtypeID" AllowCustomTokens="false"></PropertiesTokenBox>
							</dx:GridViewDataTokenBoxColumn>
							<dx:GridViewDataTokenBoxColumn FieldName="cats" Caption="Included TxCategories" VisibleIndex="6">
								<PropertiesTokenBox DataSourceID="sqlCAT" TextField="txcat" ValueField="txcatID" AllowCustomTokens="false"></PropertiesTokenBox>
							</dx:GridViewDataTokenBoxColumn>
							<dx:GridViewDataCheckColumn  FieldName="dataproj_pk" ReadOnly="true" Visible="false"   ></dx:GridViewDataCheckColumn>
						</Columns>
					</dx:ASPxGridView>
					<br />
					<br />
						
					<dx:ASPxButton ID="ASPxButton8" runat="server" Text="Save" ImagePosition="Right" Image-IconID="save_save_16x16gray" Paddings-PaddingBottom="1" Paddings-PaddingLeft="1" Paddings-PaddingRight="1" Paddings-PaddingTop="1" Font-Size="10" ToolTip="Edit Subjects" 
						OnCommand="btn_Edit_Command" CommandName="Save" CommandArgument="IntHx"></dx:ASPxButton>
					<br /><br />

					<dx:ASPxButton ID="ASPxButton9" runat="server" Text="Cancel" ImagePosition="Right" Image-IconID="actions_cancel_16x16" Paddings-PaddingBottom="1" Paddings-PaddingLeft="1" Paddings-PaddingRight="1" Paddings-PaddingTop="1" Font-Size="10" ToolTip="Edit Subjects" 
						AutoPostBack="false" >
												<ClientSideEvents Click="function(s,e) {inthx_edit.SetVisible(false); inthx_view.SetVisible(true);}"  />
									</dx:ASPxButton>

							</td>
					



					
						</tr>
					</table>
					</dx:PanelContent>
					</PanelCollection>

				</dx:ASPxPanel>



				<br />

			</td>
		</tr>
	</table>
	<br /><br />
	</dx:PanelContent>
   </PanelCollection>


	</dx:ASPxPanel>

	<br />
	<br />
	<br />
	<br />
	<br />

	<table>
			<tr>
				<td style="vertical-align:top">
					<br />
					Data files:
				</td>
				<td>
					<br />
					<asp:GridView ID="gvViewDatafiles" runat="server" AutoGenerateColumns="false" CellPadding="3" BorderStyle="Solid" BorderColor="Silver" EmptyDataText="No data files created yet." >
						<Columns>
							<asp:TemplateField ItemStyle-HorizontalAlign="Center" HeaderText="Download Data File">
								<ItemTemplate>
									<asp:Button ID="btnDownloadExistingFile" runat="server" Text=".xlsx" Font-Size="XX-Small" OnCommand="btnDownloadExistingFile_Command" 
										  CommandName="DownloadExistingFile"  CommandArgument='<%#  DataBinder.Eval(Container.DataItem, "[filename]") %>' />
									<asp:Button ID="Button1" runat="server" Text=".xls" Font-Size="XX-Small" OnCommand="btnDownloadExistingFile_Command" 
										  CommandName="DownloadExistingFile_xls"  CommandArgument='<%#  DataBinder.Eval(Container.DataItem, "[filename]") %>' Visible="false" />
								</ItemTemplate>
							</asp:TemplateField>
							<asp:TemplateField ItemStyle-HorizontalAlign="Center" HeaderText="Download Desc Stats" Visible="true">
								<ItemTemplate>
									<asp:Button ID="btnDownloadDescstats" runat="server" Text=".xlsx" Font-Size="XX-Small" OnCommand="btnDownloadExistingFile_Command" 
										  CommandName="DownloadExistingFile"  CommandArgument='<%#  DataBinder.Eval(Container.DataItem, "[filename]").ToString().Replace("Data","DescStats") %>' />
								</ItemTemplate>
							</asp:TemplateField>
							<asp:TemplateField ItemStyle-HorizontalAlign="Center" HeaderText="View Desc Stats" Visible="true">
								<ItemTemplate>
									<asp:Button ID="btnViewSummary" runat="server" Text="View" Font-Size="XX-Small" OnCommand="btnDownloadExistingFile_Command" 
										  CommandName="ViewSummary"  CommandArgument='<%#  DataBinder.Eval(Container.DataItem, "[filename]").ToString().Replace("Data","DescStats") %>' />
								</ItemTemplate>
							</asp:TemplateField>

									<asp:BoundField HeaderText="File Name" DataField="filename" />
									<asp:BoundField HeaderText="N_subjects" DataField="N_subjects" />
									<asp:BoundField HeaderText="N_measures" DataField="N_measures" />
									<asp:BoundField HeaderText="N_studymeas" DataField="N_studymeas" />
									<asp:BoundField HeaderText="N_datarows" DataField="N_datarows" />
									<asp:BoundField HeaderText="N_datacols" DataField="N_datacols" />

									<asp:BoundField HeaderText="created" DataField="created" DataFormatString="{0:g}" />
									<asp:BoundField HeaderText="Time since created" DataField="TimeSinceCreated" />
									<asp:BoundField HeaderText="createdBy" DataField="createdBy" />

							<asp:TemplateField HeaderText="Delete file">
								<ItemTemplate>
									<asp:Button ID="btnDeleteDatafile" runat="server" Text="Delete" Font-Size="XX-Small" OnCommand="btnDeleteDatafile_Command"
										  CommandName="DeleteDatafile"  CommandArgument='<%#  DataBinder.Eval(Container.DataItem, "[filename]") %>' />
								</ItemTemplate>
							</asp:TemplateField>
							
						</Columns>
					</asp:GridView>
				</td>
			</tr>
		</table>



		<asp:Panel ID="Panel_EditVars" runat="server" Visible="false">

			<br />
			<br />
			<br />
			<asp:Label ID="lblEditVars" runat="server" Text="Select Variables" Font-Bold="true" Font-Underline="true" Font-Size="Medium"></asp:Label>
								<table>
						<tr>
							<td style="width: 300px">
								<asp:Label ID="lbl_gvVars_measname" runat="server" Font-Size="10pt" Font-Bold="true"></asp:Label>
								<asp:Label ID="lbl_gvVars" runat="server" Font-Size="10pt" Font-Bold="true" Visible="false"></asp:Label>
							</td>
							<td style="width: 200px">
								<asp:Button ID="btn_CancelVars" runat="server" Text="Cancel" Font-Size="8pt" OnCommand="btn_Command" CommandName="CancelVars" CommandArgument="CancelVars" />    
							</td>
							<td>
								<asp:Button ID="btn_UpdateVars" runat="server" Text="Update Vars" Font-Size="8pt" OnCommand="btn_Command" CommandName="UpdateVars"   />  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  
								<asp:Button ID="btn_UpdateDefaults" runat="server" Text="Update Defaults" Font-Size="8pt" OnCommand="btn_Command" CommandName="UpdateDefaults" ForeColor="Green" Visible="true"  />    

							</td>
						</tr>
						<tr>
							<td colspan="3">
								<asp:Label ID="lbl_instruct1" runat="server" Text="Select the vars you wish to include. 1st col = Desc Stats for Continuous Vars, 2 = Desc Stats for Discrete Vars, 3 = No stats, but in data"
									Font-Size="7pt"></asp:Label>
							</td>
						</tr>
					</table>
				
					<br /><br />
					<asp:Label ID="Label4" runat="server" Text="Numeric variables" Font-Bold="true" ForeColor="Navy" Font-Size="9pt"></asp:Label>

					<asp:GridView ID="gvVars" runat="server" AutoGenerateColumns="false" OnRowDataBound="gvVars_RowDataBound">
					<Columns>
						<asp:TemplateField>
							<HeaderTemplate>
								<asp:Label ID="l1C" runat="server" Text="Stats Cont.<br/>" Font-Size="7pt"></asp:Label>
								<asp:CheckBox ID="chkAllVar2" runat="server" Text ="" AutoPostBack="true" OnCheckedChanged="chkAllVar2_CheckedChanged" />
								<asp:HiddenField ID="fldpk_numeric" runat="server" Value='<%#  DataBinder.Eval(Container.DataItem, "[fldpk]") %>'  />
							</HeaderTemplate>
							<ItemTemplate>
								<asp:CheckBox ID="chkVar2" runat="server" Text =""   />
							</ItemTemplate>
						</asp:TemplateField>
						<asp:TemplateField>
							<HeaderTemplate>
								<asp:Label ID="l1D" runat="server" Text="Stats Disc.<br/>" Font-Size="7pt"></asp:Label>
								<asp:CheckBox ID="chkAllVar3" runat="server" Text ="" AutoPostBack="true" OnCheckedChanged="chkAllVar3_CheckedChanged" />
							</HeaderTemplate>
							<ItemTemplate>
								<asp:CheckBox ID="chkVar3" runat="server" Text ="" />
							</ItemTemplate>
						</asp:TemplateField>
						<asp:TemplateField>
							<HeaderTemplate>
								<asp:Label ID="l4" runat="server" Text="In Data<br/>" Font-Size="7pt"></asp:Label>
								<asp:CheckBox ID="chkAllVar4" runat="server" Text ="" AutoPostBack="true" OnCheckedChanged="chkAllVar4_CheckedChanged" />
							</HeaderTemplate>
							<ItemTemplate>
								<asp:CheckBox ID="chkVar4" runat="server" Text ="" />
							</ItemTemplate>
						</asp:TemplateField>
						<asp:BoundField HeaderText="Var" DataField="fldname" />
						<asp:BoundField HeaderText="Default InAnal" DataField="Default_InAnalysis"  Visible="true"/>
						<asp:BoundField HeaderText="Label" DataField="fieldlabel" />
						<asp:BoundField HeaderText="Value Labels" DataField="valuelabels" />
						<asp:TemplateField>
							<HeaderTemplate>
								<asp:Label ID="lblMV" runat="server" Text="Missing Values" Font-Size="7pt"></asp:Label>
							</HeaderTemplate>
							<ItemTemplate>
								<asp:TextBox ID="txtmissval" runat="server" Width="100px"  Text='<%#  DataBinder.Eval(Container.DataItem, "[missval]") %>'  Font-Size="7pt"
									 BorderColor="Thistle" BorderStyle="Solid" BorderWidth="1" />
							</ItemTemplate>
						</asp:TemplateField>
						<asp:BoundField HeaderText="pk" DataField="fldpk" Visible="true"/>




					</Columns>
				</asp:GridView>

					<br />
					<asp:Label ID="lblTxt" runat="server" Text="Text variables" Font-Bold="true" ForeColor="Navy" Font-Size="9pt"></asp:Label>
					<asp:GridView ID="gvVars_text" runat="server" AutoGenerateColumns="false" OnRowDataBound="gvVarsT_RowDataBound">
					<Columns>
						<asp:TemplateField>
							<HeaderTemplate>
								<asp:Label ID="l1C" runat="server" Text="Stats Cont.<br/>" Font-Size="7pt"></asp:Label>
								<asp:CheckBox ID="chkAllVarT2" runat="server" Text ="" AutoPostBack="true" OnCheckedChanged="chkAllVar2T_CheckedChanged" />
								<asp:HiddenField ID="fldpk_text" runat="server" Value='<%#  DataBinder.Eval(Container.DataItem, "[fldpk]") %>'  />

							</HeaderTemplate>
							<ItemTemplate>
								<asp:CheckBox ID="chkVar2" runat="server" Text ="" Visible="false" />
							</ItemTemplate>
						</asp:TemplateField>
						<asp:TemplateField>
							<HeaderTemplate>
								<asp:Label ID="l1D" runat="server" Text="Stats Disc.<br/>" Font-Size="7pt"></asp:Label>
								<asp:CheckBox ID="chkAllVarT3" runat="server" Text ="" AutoPostBack="true" OnCheckedChanged="chkAllVar3T_CheckedChanged" />
							</HeaderTemplate>
							<ItemTemplate>
								<asp:CheckBox ID="chkVar3" runat="server" Text ="" />
							</ItemTemplate>
						</asp:TemplateField>
						<asp:TemplateField>
							<HeaderTemplate>
								<asp:Label ID="l4" runat="server" Text="In Data<br/>" Font-Size="7pt"></asp:Label>
								<asp:CheckBox ID="chkAllVarT4" runat="server" Text ="" AutoPostBack="true" OnCheckedChanged="chkAllVar4T_CheckedChanged" />
							</HeaderTemplate>
							<ItemTemplate>
								<asp:CheckBox ID="chkVar4" runat="server" Text ="" />
							</ItemTemplate>
						</asp:TemplateField>
						<asp:BoundField HeaderText="Var" DataField="fldname" />
						<asp:BoundField HeaderText="Default InAnal" DataField="Default_InAnalysis"  Visible="true"/>
						<asp:BoundField HeaderText="Label" DataField="fieldlabel" />
						<asp:BoundField HeaderText="pk" DataField="fldpk" Visible="true"/>

					</Columns>
				</asp:GridView>

				 <br />
					<asp:Label ID="Label3" runat="server" Text="Date variables" Font-Bold="true" ForeColor="Navy" Font-Size="9pt"></asp:Label>
					<asp:GridView ID="gvVars_date" runat="server" AutoGenerateColumns="false" OnRowDataBound="gvVarsD_RowDataBound">
					<Columns>
						<asp:TemplateField>
							<HeaderTemplate>
								<asp:Label ID="l1C" runat="server" Text="Stats Cont.<br/>" Font-Size="7pt"></asp:Label>
								<asp:CheckBox ID="chkAllVarD2" runat="server" Text ="" AutoPostBack="true" OnCheckedChanged="chkAllVar2D_CheckedChanged" />
								<asp:HiddenField ID="fldpk_date" runat="server" Value='<%#  DataBinder.Eval(Container.DataItem, "[fldpk]") %>'  />

							</HeaderTemplate>
							<ItemTemplate>
								<asp:CheckBox ID="chkVar2" runat="server" Text ="" Visible="false" />
							</ItemTemplate>
						</asp:TemplateField>
						<asp:TemplateField>
							<HeaderTemplate>
								<asp:Label ID="l1D" runat="server" Text="Stats Disc.<br/>" Font-Size="7pt"></asp:Label>
								<asp:CheckBox ID="chkAllVarD3" runat="server" Text ="" AutoPostBack="true" OnCheckedChanged="chkAllVar3D_CheckedChanged" />
							</HeaderTemplate>
							<ItemTemplate>
								<asp:CheckBox ID="chkVar3" runat="server" Text ="" Visible="false" />
							</ItemTemplate>
						</asp:TemplateField>
						<asp:TemplateField>
							<HeaderTemplate>
								<asp:Label ID="l4" runat="server" Text="In Data<br/>" Font-Size="7pt"></asp:Label>
								<asp:CheckBox ID="chkAllVarD4" runat="server" Text ="" AutoPostBack="true" OnCheckedChanged="chkAllVar4D_CheckedChanged" />
							</HeaderTemplate>
							<ItemTemplate>
								<asp:CheckBox ID="chkVar4" runat="server" Text ="" />
							</ItemTemplate>
						</asp:TemplateField>
						<asp:BoundField HeaderText="Var" DataField="fldname" />
						<asp:BoundField HeaderText="Default InAnal" DataField="Default_InAnalysis"  Visible="true"/>
						<asp:BoundField HeaderText="Label" DataField="fieldlabel" />
						<asp:BoundField HeaderText="pk" DataField="fldpk" Visible="true"/>


					</Columns>
				</asp:GridView>
		</asp:Panel>




			<table>
				<tr>
					<td colspan="2" style="vertical-align:top; text-align:right">
						<obout:OboutButton ID="btnProjSAVE" runat="server" Text="Save" />    
						<obout:OboutButton ID="btnProjCANCEL" runat="server" Text="Cancel" OnClick="btnProjCANCEL_Click" />    
						<br />
					<obout:OboutButton ID="btnHide" runat="server" Text="Hide Subjects & Measures" ForeColor="Blue" Font-Size="X-Small" OnClick="btnHide_Click"  Visible="true"/>
					<obout:OboutButton ID="btnShow" runat="server" Text="Show Subjects & Measures" ForeColor="Blue" Font-Size="X-Small" OnClick="btnShow_Click"  Visible="false" />

					</td>
				</tr>
				<tr>
					<td>Title:</td>
					<td>
						<asp:TextBox ID="txtTitle" Width="900" runat="server" Font-size="Medium" Font-Bold="true" ></asp:TextBox>    
					</td>
				</tr>
				<tr>
					<td style="vertical-align:top">
						<br />
						Supervisor:
					</td>
					<td>
						<br />
						<asp:DropDownList ID="ddlSupervisor" runat="server" ></asp:DropDownList>
					</td>
				</tr>
				<tr>
					<td style="vertical-align:top"><br />Subjects:</td>
					<td>
						<br />view subj
					</td>
				</tr>

				<%--MEASURES  IntHx--%>
				<tr>
					<td style="vertical-align:top"><br />IntHx Measures:</td>
					<td>
						<br />
						</td>
					</tr>

				<%--MEASURES--%>
				<tr>
					<td style="vertical-align:top"><br />Measures:</td>
					<td>
						<br />
				<asp:Panel ID="Panel_Measures" runat="server" Visible="true">


				</asp:Panel>

					</td>
				</tr>

<%--SUMMARY--%>
				<tr>
					<td style="vertical-align:top"><br />Summary:</td>
					<td>
						<br />
					<%--<obout:Editor runat="server" Id="editor" Height="600px" Width="95%" >
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
		</obout:Editor>  --%>

					</td>
				</tr>



			</table>


 


		<asp:SqlDataSource ID="sqlDataProjects" runat="server" 
			SelectCommandType="Text"  SelectCommand="select * from dp.vwDataProject where studyID = @studyID"
		 InsertCommandType="Text" InsertCommand="insert into dp.DataProject (projTitle, studyID, isDeleted) values (@projTitle, @studyID, 0)"
		ConnectionString="<%$ ConnectionStrings:DATA_CONN_STRING %>" >
		<SelectParameters>
			<asp:SessionParameter SessionField="studyID" Name="studyID" DbType="Int32" />
		</SelectParameters>
		<InsertParameters>
			<asp:Parameter  Name="projTitle" DbType="string" />
			<asp:SessionParameter SessionField="studyID" Name="studyID" DbType="Int32" />
		</InsertParameters>
	</asp:SqlDataSource>



	<asp:SqlDataSource ID="sqlIntHxParams" runat="server" 
		SelectCommandType="Text"  SelectCommand="select * from dp.IntHxPARAMS where dataproj_pk=@dataproj_pk"
		UpdateCommandType="Text" UpdateCommand="update dp.IntHxPARAMS set includeWeeks=@includeWeeks, includeType=@includeType, includeCat=@includeCat
			, periods=@periods, types=@types, cats=@cats where dataproj_pk=@dataproj_pk"
		ConnectionString="<%$ ConnectionStrings:DATA_CONN_STRING %>" >
		<SelectParameters>
			<asp:QueryStringParameter QueryStringField="pk" Name="dataproj_pk" DbType="Int32" />
		</SelectParameters>
	</asp:SqlDataSource>




	<asp:SqlDataSource ID="sqlPERIOD" runat="server" SelectCommandType="Text"  
		SelectCommand="select distinct(period) period from vwTimepointSubj_with_ObservedTP_and_ALL where studyIDfull=@studyIDfull"
		ConnectionString="<%$ ConnectionStrings:DATA_CONN_STRING %>" >
		<SelectParameters>
			<asp:SessionParameter SessionField="studyIDfull" Name="studyIDfull" DbType="Int32" />
		</SelectParameters>
	</asp:SqlDataSource>


	<asp:SqlDataSource ID="sqlTYPE" runat="server" SelectCommandType="Text"  
		SelectCommand="select a.*, txcat, substring(txcat, 1,3) + txtype as txtypetext  from const_MIND_IntHXv2_TxType a
	join const_MIND_IntHXv2_TxCat b ON a.txcatID = b.txcatID  order by a.txcatID" ConnectionString="<%$ ConnectionStrings:DATA_CONN_STRING %>" >
	</asp:SqlDataSource>


	<asp:SqlDataSource ID="sqlCAT" runat="server" SelectCommandType="Text"  
		SelectCommand="select * from const_MIND_IntHXv2_TxCat" ConnectionString="<%$ ConnectionStrings:DATA_CONN_STRING %>" >
	</asp:SqlDataSource>

	


<asp:HiddenField ID="hidMeasureID" runat="server" />
<asp:HiddenField ID="hidStudymeasID" runat="server" />
<asp:HiddenField ID="hidTimepointID" runat="server" />

	<script type="text/javascript">
		function alertMessage() {
			alert('This may take a minute or two to create the data file.  Links to download the file will be provided on the page.');
		}
	</script>


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

		<%--    function disableStuff() {

				var btnSave = document.getElementById('<%=btnSaveVars.ClientID%>');
				btnSave.disabled = true;
			}--%>

	</script>


	<script type="text/javascript" src="<%# Request.ApplicationPath %>/js/checkbox.js"></script>

</asp:Content>

