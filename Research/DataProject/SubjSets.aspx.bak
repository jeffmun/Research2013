<%@ Page Language="C#" Debug="true"  MasterPageFile="~/UWAC.master"  AutoEventWireup="true" CodeFile="SubjSets.aspx.cs" Inherits="DataProject_SubjSets" 
	 EnableEventValidation="false" Title="Subject Sets"%>
 <%@ MasterType VirtualPath="~/UWAC.master" %>

<%@ Register Assembly="DevExpress.Web.v19.1, Version=19.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.ASPxPivotGrid.v19.1, Version=19.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxPivotGrid" TagPrefix="dx" %> 

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
	</script>


	<dx:ASPxHiddenField ID="needBindVars" runat="server" ClientInstanceName="needBindVars">
	</dx:ASPxHiddenField>

	<br />
	<dx:ASPxLabel ID="lblTitle" runat="server" Text="Subject Sets" Font-Size="Medium" Font-Bold="true"></dx:ASPxLabel>
	<br />
				
	<br />
	

		<table>
		<tr>
			<td>
				<dx:ASPxButton ID="btnNew" runat="server" Text="Create New Subject Set" OnClick="btnNew_OnClick" ></dx:ASPxButton>
			</td>
			<td style="width: 400px">
			</td>
			<td>
				<dx:ASPxButton ID="btnProjects" runat="server" Text="View Data Projects" OnClick="btnProjects_OnClick" ></dx:ASPxButton>
			</td>
		</tr>
	</table>




	<br />	<br />	<br />
	

	<dx:ASPxGridView ID="gridSets" runat="server" AutoGenerateColumns="false" ClientInstanceName="gridSets"
		OnCommandButtonInitialize="gridSets_OnCommandButtonInitialize"  KeyFieldName="subjset_pk" SettingsDataSecurity-AllowDelete="true"
		 OnRowDeleting="gridSets_RowDeleting" OnRowDeleted="gridSets_RowDeleted">
								<Columns>
<%--									<dx:GridViewDataColumn FieldName="measname" Caption="Measure" GroupIndex="0"></dx:GridViewDataColumn>--%>
									<dx:GridViewDataHyperLinkColumn FieldName="subjset_pk" Caption="Edit" VisibleIndex="0" 
										PropertiesHyperLinkEdit-DisplayFormatString="Edit" 
										PropertiesHyperLinkEdit-NavigateUrlFormatString="SubjSet.aspx?subjset_pk={0}"></dx:GridViewDataHyperLinkColumn>
									<dx:GridViewCommandColumn  ShowDeleteButton="true" Caption="Delete" VisibleIndex="1" ></dx:GridViewCommandColumn>
									<dx:GridViewDataColumn FieldName="nsubj" Caption="# Subjects" VisibleIndex="2" ></dx:GridViewDataColumn>
									<dx:GridViewDataColumn FieldName="n_dataproj" Caption="Used in # Projects" VisibleIndex="3" ></dx:GridViewDataColumn>
									<dx:GridViewDataColumn FieldName="subjset" Caption="Subject Set Name" VisibleIndex="4" ></dx:GridViewDataColumn>
									<dx:GridViewDataColumn FieldName="subjsetdetails" Caption="Details" VisibleIndex="5"></dx:GridViewDataColumn>
									<dx:GridViewDataColumn FieldName="created" Caption="Created" VisibleIndex="6"></dx:GridViewDataColumn>
									<dx:GridViewDataColumn FieldName="createdBy" Caption="CreatedBy" VisibleIndex="7"></dx:GridViewDataColumn>
								</Columns>
								<Settings ShowGroupPanel="false"    />
								<SettingsPager Mode="ShowAllRecords" />
<%--								<SettingsBehavior AllowFixedGroups="true" AutoExpandAllGroups="true"  />
								<GroupSummary>
									<dx:ASPxSummaryItem FieldName="measname" SummaryType="Count" />
								</GroupSummary>--%>
							</dx:ASPxGridView>

	<br />


	<br />

</asp:Content>

   
