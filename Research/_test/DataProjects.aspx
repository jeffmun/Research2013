﻿<%@ Page Language="C#" Debug="true"  MasterPageFile="~/UWAC.master"  AutoEventWireup="true" CodeFile="DataProjects.aspx.cs" Inherits="_test_DataProjects" 
	 EnableEventValidation="false" Title="Data Projects"%>
 <%@ MasterType VirtualPath="~/UWAC.master" %>

<%@ Register Assembly="DevExpress.Web.v18.1, Version=18.1.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.ASPxPivotGrid.v18.1, Version=18.1.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxPivotGrid" TagPrefix="dx" %> 

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
		}


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
				<dx:ASPxButton ID="btnNew" runat="server" Text="Create New Data Project" OnClick="btnNew_OnClick" ></dx:ASPxButton>
			</td>
			<td style="width: 400px">
			</td>
			<td>
				<dx:ASPxButton ID="btnSubjSets" runat="server" Text="View Subject Sets" OnClick="btnSubjSets_OnClick" ></dx:ASPxButton>
			</td>
		</tr>
	</table>

	<br />	<br />	<br />
	

	<dx:ASPxGridView ID="gridProjects" runat="server" AutoGenerateColumns="false" ClientInstanceName="gridProjects" 
		OnHtmlDataCellPrepared="gridProjects_HtmlDataCellPrepared" KeyFieldName="dataproj_pk" >
								<Columns>
<%--									<dx:GridViewDataColumn FieldName="measname" Caption="Measure" GroupIndex="0"></dx:GridViewDataColumn>--%>
									<dx:GridViewDataHyperLinkColumn FieldName="dataproj_pk" Caption="Edit" VisibleIndex="0" PropertiesHyperLinkEdit-DisplayFormatString="Edit" PropertiesHyperLinkEdit-NavigateUrlFormatString="DataProject.aspx?pk={0}"></dx:GridViewDataHyperLinkColumn>
									<dx:GridViewDataHyperLinkColumn FieldName="dataproj_pk" Caption="Explore" VisibleIndex="0" PropertiesHyperLinkEdit-DisplayFormatString="Explore" PropertiesHyperLinkEdit-NavigateUrlFormatString="DataProjectExplore.aspx?pk={0}"></dx:GridViewDataHyperLinkColumn>
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
									<dx:GridViewDataColumn FieldName="created" Caption="Created" VisibleIndex="7"></dx:GridViewDataColumn>
									<dx:GridViewDataColumn FieldName="createdBy" Caption="CreatedBy" VisibleIndex="8"></dx:GridViewDataColumn>
								</Columns>
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

   
