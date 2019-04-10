<%@ Page Language="C#" Debug="true"  MasterPageFile="~/UWAC.master"  AutoEventWireup="true" CodeFile="Index.aspx.cs" Inherits="DataProject_Index" 
	 EnableEventValidation="false" Title="Data Projects"%>
 <%@ MasterType VirtualPath="~/UWAC.master" %>

<%@ Register Assembly="DevExpress.Web.v18.2, Version=18.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.ASPxPivotGrid.v18.2, Version=18.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxPivotGrid" TagPrefix="dx" %> 

<asp:Content ID="HeadContent" runat="server" ContentPlaceHolderID="headContent" Visible="true">
	<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css"  />
	<script type='text/javascript' src='https://code.jquery.com/ui/1.12.1/jquery-ui.min.js' ></script> 
</asp:Content>

<asp:Content ID="Content1"  ContentPlaceHolderID="oBodyPlaceHolder" runat="server" >
		<asp:ScriptManager ID="ScriptManager1" runat="server" EnablePageMethods="true"  EnablePartialRendering="true"></asp:ScriptManager>


	<script type="text/javascript">
		function SubjSelectionChanged(s, e) {
			//btnLoad.SetVisible(true);

			var num = gridLkupSubj.GetGridView().GetSelectedRowCount();
			selsubj_n.SetText("(" + num + " selected)");

			pivotCallback.PerformCallback();
			//varCallback.PerformCallback();
		}E


		function OnVarCloseUp(s, e) {
			s.GetGridView().SortBy('IsSelected', 'DSC');
			s.GetGridView().SortBy('CoreVar', 'DSC');
			s.GetGridView().SortBy('measname', 'ASC');
			s.GetGridView().SortBy('fldname', 'ASC');
		}


		var keyValue;
		function OnMoreInfoClick(element, key) {
			callbackPanel.SetContentHtml("");
			popup.ShowAtElement(element);
			keyValue = key;
		}
		function popup_Shown(s, e) {
			callbackPanel.PerformCallback(keyValue);
		}
	</script>


	<dx:ASPxHiddenField ID="needBindVars" runat="server" ClientInstanceName="needBindVars">
	</dx:ASPxHiddenField>

	<br />
	<dx:ASPxLabel ID="lblTitle" runat="server" Text="Data Projects" Font-Size="Medium" Font-Bold="true"></dx:ASPxLabel>
	<br />
				
	<br />
	
	<table>
		<tr>
			<td>
				<dx:ASPxButton ID="btnNew" runat="server" Text="Create New Data Project" OnClick="btnNew_OnClick" >
					 <Image IconID="richedit_richeditnewtablestyle_16x16"></Image>
				</dx:ASPxButton>
			</td>
			<td style="width: 400px">
			</td>
			<td>
				<dx:ASPxButton ID="btnSubjSets" runat="server" Text="View Subject Sets" OnClick="btnSubjSets_OnClick" >
					  <Image IconID="people_team_16x16office2013"></Image>
				</dx:ASPxButton>
			</td>
		</tr>
	</table>

	<br />	<br />	<br />

	<dx:ASPxCheckBox ID="chkShowDeleted" runat="server" ClientInstanceName="chkShowDeleted" Text="Show deleted projects"
		 OnCheckedChanged="chkShowDeleted_CheckChanged" AutoPostBack="true"></dx:ASPxCheckBox>	

	<dx:ASPxGridView ID="gridProjects" runat="server" AutoGenerateColumns="false" ClientInstanceName="gridProjects" 
		KeyFieldName="dataproj_pk" OnRowCommand="gridProjects_OnRowCommand"
		 OnCustomButtonInitialize="gridProjects_OnCustomButtonInitialize"
		OnCustomButtonCallback="gridProjects_OnCustomButtonCallback" SettingsBehavior-ConfirmDelete="true"  
		OnHtmlDataCellPrepared="gridProjects_HtmlDataCellPrepared" >
								<Columns>
<%--									<dx:GridViewDataColumn FieldName="measname" Caption="Measure" GroupIndex="0"></dx:GridViewDataColumn>--%>
									<dx:GridViewDataHyperLinkColumn FieldName="dataproj_pk" Caption="Edit" VisibleIndex="0" PropertiesHyperLinkEdit-DisplayFormatString="Edit" PropertiesHyperLinkEdit-NavigateUrlFormatString="Edit.aspx?pk={0}"></dx:GridViewDataHyperLinkColumn>
									<dx:GridViewDataHyperLinkColumn FieldName="dataproj_pk" Caption="Explore" VisibleIndex="0" PropertiesHyperLinkEdit-DisplayFormatString="Explore" PropertiesHyperLinkEdit-NavigateUrlFormatString="Explore.aspx?pk={0}"></dx:GridViewDataHyperLinkColumn>
									<dx:GridViewDataHyperLinkColumn FieldName="dataproj_pk" Caption="Files" VisibleIndex="0" PropertiesHyperLinkEdit-DisplayFormatString="Files" PropertiesHyperLinkEdit-NavigateUrlFormatString="Files.aspx?pk={0}"></dx:GridViewDataHyperLinkColumn>
									<dx:GridViewDataColumn FieldName="dataproj_pk" Caption="Proj #" VisibleIndex="0" ></dx:GridViewDataColumn>
									<dx:GridViewDataColumn FieldName="projTitle" Caption="Title" VisibleIndex="1"  ></dx:GridViewDataColumn>
									<dx:GridViewDataColumn Caption="Details" VisibleIndex="2" >
										<DataItemTemplate>
											<a href="javascript:void(0);" onclick="OnMoreInfoClick(this, '<%# Container.KeyValue %>')">More Info...</a>
										</DataItemTemplate>
									</dx:GridViewDataColumn>
									<dx:GridViewDataColumn FieldName="nSubjects" Caption="# Subjects" VisibleIndex="3" ></dx:GridViewDataColumn>
									<dx:GridViewDataColumn FieldName="TimePoints" Caption="Time Points" VisibleIndex="4" ></dx:GridViewDataColumn>
									<dx:GridViewDataColumn FieldName="nMeas" Caption="# Measures" VisibleIndex="5"></dx:GridViewDataColumn>
									<dx:GridViewDataColumn FieldName="nVars" Caption="# Variables" VisibleIndex="6"></dx:GridViewDataColumn>
									<dx:GridViewDataColumn FieldName="nFiles" Caption="# Data Files" VisibleIndex="7"></dx:GridViewDataColumn>
									<dx:GridViewDataColumn FieldName="since_latestdatafile" Caption="Time since last data file created" VisibleIndex="7"  HeaderStyle-Wrap="true" Width="100px"></dx:GridViewDataColumn>
									<dx:GridViewDataColumn FieldName="created" Caption="Project Created" VisibleIndex="8"></dx:GridViewDataColumn>
									<dx:GridViewDataColumn FieldName="createdBy" Caption="Project CreatedBy" VisibleIndex="9"></dx:GridViewDataColumn>
									<dx:GridViewDataColumn FieldName="isDeleted" Caption="Is Deleted" Visible="false"  ></dx:GridViewDataColumn>
									


									<dx:GridViewCommandColumn >
										<CustomButtons>
											<dx:GridViewCommandColumnCustomButton ID="btnDelete" Text="Delete" ></dx:GridViewCommandColumnCustomButton>
											<dx:GridViewCommandColumnCustomButton ID="btnUndelete" Text="Undelete" ></dx:GridViewCommandColumnCustomButton>
										</CustomButtons>
									</dx:GridViewCommandColumn>

								</Columns>
							<%--	<ClientSideEvents CustomButtonClick="function (s, e) { if (e.buttonID == 'btnDelete') e.processOnServer = confirm('Do you really want to delete this project?'); }" />--%>

								<Settings ShowGroupPanel="false"    />
								<SettingsPager Mode="ShowAllRecords" />
								
		

<%--								<SettingsBehavior AllowFixedGroups="true" AutoExpandAllGroups="true"  />
								<GroupSummary>
									<dx:ASPxSummaryItem FieldName="measname" SummaryType="Count" />
								</GroupSummary>--%>
							</dx:ASPxGridView>
							<dx:ASPxPopupControl ID="popup" ClientInstanceName="popup" runat="server" AllowDragging="true"
								PopupHorizontalAlign="OutsideRight" HeaderText="Project Summary">
								<ContentCollection>
									<dx:PopupControlContentControl runat="server">
										<dx:ASPxCallbackPanel ID="callbackPanel" ClientInstanceName="callbackPanel" runat="server"
											Width="700px" Height="100px" OnCallback="callbackPanel_Callback" RenderMode="Table">
											<PanelCollection>
												<dx:PanelContent runat="server">
													<table class="InfoTable">
														<tr>
															<td>
																<asp:Literal ID="litText" runat="server" Text="" />
															</td>
														</tr>
													</table>
												</dx:PanelContent>
											</PanelCollection>
										</dx:ASPxCallbackPanel>
									</dx:PopupControlContentControl>
								</ContentCollection>
								<%--<SettingsAdaptivity Mode="OnWindowInnerWidth" SwitchAtWindowInnerWidth="800" />--%>
								<ClientSideEvents Shown="popup_Shown" />
							</dx:ASPxPopupControl>
	<br />


	<br />

</asp:Content>

   
