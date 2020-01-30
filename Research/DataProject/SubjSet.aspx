<%@ Page Language="C#" Debug="true"  MasterPageFile="~/UWAC.master"  AutoEventWireup="true" CodeFile="SubjSet.aspx.cs" Inherits="DataProject_SubjSet" 
	 EnableEventValidation="false" Title="Subject Sets"%>
 <%@ MasterType VirtualPath="~/UWAC.master" %>

<%@ Register Assembly="DevExpress.Web.v19.1, Version=19.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.ASPxPivotGrid.v19.1, Version=19.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxPivotGrid" TagPrefix="dx" %> 

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
	<dx:ASPxLabel ID="lblTitle" runat="server" Text="Edit Subject Sets" Font-Size="Medium" Font-Bold="true"></dx:ASPxLabel>
	<br />
						

	<br />
	<table>
		<tr>
			<td style="vertical-align: top; width: 400px">
				Select Subjects:<dx:ASPxLabel ID="lblSubj" runat="server" Text="" Font-Bold="true"></dx:ASPxLabel>
				<dx:ASPxLabel  ID="selsubj_n" runat="server" Text="" Font-Bold="true" ForeColor="RoyalBlue" ClientInstanceName="selsubj_n"></dx:ASPxLabel>   
					<br />
				<dx:ASPxGridLookup ID="gridLkupSubj" runat="server"  
					KeyFieldName="subjID" SelectionMode="Multiple" MultiTextSeparator=", " Caption=""
									TextFormatString="{0}" Width="250px" ClientInstanceName="gridLkupSubj"
					IncrementalFilteringMode="None" OnValueChanged="gridLkupSubj_OnValueChanged" 
					OnDataBound="gridLkupSubj_OnDataBound" OnDataBinding="gridLkupSubj_DataBinding">
					<ClearButton DisplayMode="OnHover"></ClearButton>
					<ClientSideEvents ValueChanged="SubjSelectionChanged" />
					<Columns>
						<dx:GridViewCommandColumn SelectAllCheckboxMode="AllPages" ShowSelectCheckbox="True" VisibleIndex="0" />
						<dx:GridViewDataTextColumn FieldName="id" Caption="ID" />
						<dx:GridViewDataTextColumn FieldName="Group" Caption="Group" />
						<dx:GridViewDataTextColumn FieldName="txgrp" Caption="Tx Group" />
						<dx:GridViewDataTextColumn FieldName="subjstatus" Caption="Subject Status" />
						<dx:GridViewDataTextColumn FieldName="subjstatusdetail" Caption="Subject Status Detail" />
						<dx:GridViewDataTextColumn FieldName="sex" Caption="sex" />
					</Columns>
					<GridViewProperties>
						<Settings ShowFilterRow="true" AutoFilterCondition="Contains"  ShowFilterRowMenu="true" ShowFilterRowMenuLikeItem="true"  ShowStatusBar="Visible"  />
						<SettingsBehavior AllowDragDrop="False" EnableRowHotTrack="True" />
						<SettingsPager NumericButtonCount="3"  PageSize="20" Summary-Visible="true" />
					</GridViewProperties>
				</dx:ASPxGridLookup>

			</td>
			<td style="width: 40px"> </td>
			<td style="vertical-align: top;">
				<dx:ASPxLabel  ID="ASPxLabel1" runat="server" Text="Name:"  ></dx:ASPxLabel>   
					<br />
				<dx:ASPxTextBox ID="txtSubjset" runat="server" Width="500"></dx:ASPxTextBox>
				<br />


			</td>
		</tr>
		<tr>
			<td>
					<br />
		<br />
		<br />
		<dx:ASPxButton ID="btnSave" runat="server" Text="Save Subject Set" OnClick="btnSave_OnClick" ClientInstanceName="btnSave"></dx:ASPxButton>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<dx:ASPxButton ID="btnReturn" runat="server" Text="Return to Subject Sets" OnClick="btnReturn_OnClick" ClientInstanceName="btnReturn"></dx:ASPxButton>


			</td>
			<td style="width: 40px"> </td>
			<td>
								<br />
				<dx:ASPxLabel  ID="ASPxLabel2" runat="server" Text="Details:" ></dx:ASPxLabel>   
					<br />
				<dx:ASPxMemo ID="txtSubjsetdetails" runat="server" Width="500" Height="100" MaxLength="1000"></dx:ASPxMemo>

			</td>
		</tr>

	</table>



	<br />
	<br />
	<br />


	<dx:ASPxCallbackPanel ID="pivotCallback" runat="server" OnCallback="pivotCallback_OnCallback" ClientInstanceName="pivotCallback">
		<PanelCollection>
			<dx:PanelContent ID="content1" runat="server">

				<table>
					<tr>
						
						<td style="vertical-align: top;" >
							<dx:ASPxLabel ID="title_pivSubj" runat="server" Text="Selected Subjects" Font-Size="Medium" Font-Bold="true"></dx:ASPxLabel>
							<br />
							<dx:ASPxPivotGrid ID="PivotSelSubj" runat="server" OptionsCustomization-AllowFilter="false"  
								EncodeHtml="false" >
								<Fields>
									<dx:PivotGridField ID="field_subjstatus" Area="RowArea" AreaIndex="0"
										Caption="Subject Status" FieldName="subjstatus" Options-ShowTotals="false">
									</dx:PivotGridField>
									<dx:PivotGridField ID="field_TxGroup" Area="ColumnArea" AreaIndex="0"
										Caption="Tx Group" FieldName="txgrp" SortByAttribute="Tx Group">
									</dx:PivotGridField>
									<dx:PivotGridField ID="field_Group" Area="ColumnArea" AreaIndex="1"
										Caption="Group" FieldName="Group" SortByAttribute="Group">
									</dx:PivotGridField>
									<dx:PivotGridField ID="field_subjID" Area="DataArea" AreaIndex="0" 
										Caption="# Subjects" SummaryType="Count" FieldName="subjID">
									</dx:PivotGridField>
									<dx:PivotGridField ID="field_subjstatusdetail"  Caption="Subj Status Detail" FieldName="subjstatusdetail" Area="FilterArea" Visible="false"></dx:PivotGridField>
									<dx:PivotGridField ID="field_sex"  Caption="Sex" FieldName="sex" Area="FilterArea" Visible="false"></dx:PivotGridField>
									<dx:PivotGridField ID="field_race"  Caption="Race" FieldName="race"  Area="FilterArea" Visible="false"></dx:PivotGridField>
									<dx:PivotGridField ID="field_ethn"  Caption="Ethnicity" FieldName="ethnicity"  Area="FilterArea" Visible="false"></dx:PivotGridField>
								</Fields>
								<OptionsPager AlwaysShowPager="false" RowsPerPage="20" ></OptionsPager>
								<OptionsView ShowColumnTotals="true" ShowColumnGrandTotals="true" ShowRowGrandTotals="true" ShowFilterHeaders="false"  />
							</dx:ASPxPivotGrid>
						</td>
						<td style="min-width: 15px;"></td>
					
						<td style="vertical-align: top;" >
							<dx:ASPxLabel ID="ASPxLabel3" runat="server" Text="Unselected Subjects" Font-Size="Medium" Font-Bold="true"></dx:ASPxLabel>
							<br />
							<dx:ASPxPivotGrid ID="PivotUnselSubj" runat="server" OptionsCustomization-AllowFilter="false"  
								EncodeHtml="false" >
								<Fields>
									<dx:PivotGridField ID="unfield_subjstatus" Area="RowArea" AreaIndex="0"
										Caption="Subject Status" FieldName="subjstatus" Options-ShowTotals="false">
									</dx:PivotGridField>
									<dx:PivotGridField ID="unfield_TxGroup" Area="ColumnArea" AreaIndex="0"
										Caption="Tx Group" FieldName="txgrp" SortByAttribute="Tx Group">
									</dx:PivotGridField>
									<dx:PivotGridField ID="unfield_Group" Area="ColumnArea" AreaIndex="1"
										Caption="Group" FieldName="Group" SortByAttribute="Group">
									</dx:PivotGridField>
			<%--						<dx:PivotGridField ID="field_studyname" Area="ColumnArea" AreaIndex="1"
										Caption="Study" FieldName="studyname"  >
									</dx:PivotGridField>--%>
									<dx:PivotGridField ID="unfield_subjID" Area="DataArea" AreaIndex="0" 
										Caption="# Subjects" SummaryType="Count" FieldName="subjID">
									</dx:PivotGridField>
									<dx:PivotGridField ID="unfield_subjstatusdetail"  Caption="Subj Status Detail" FieldName="subjstatusdetail" Area="FilterArea" Visible="false"></dx:PivotGridField>
									<dx:PivotGridField ID="unfield_sex"  Caption="Sex" FieldName="sex"  Area="FilterArea" Visible="false"></dx:PivotGridField>
									<dx:PivotGridField ID="unfield_race"  Caption="Race" FieldName="race"  Area="FilterArea" Visible="false"></dx:PivotGridField>
									<dx:PivotGridField ID="unfield_ethn"  Caption="Ethnicity" FieldName="ethnicity"  Area="FilterArea" Visible="false"></dx:PivotGridField>

								</Fields>
								<OptionsPager AlwaysShowPager="false" RowsPerPage="20" ></OptionsPager>
								<OptionsView ShowColumnTotals="true" ShowColumnGrandTotals="true" ShowRowGrandTotals="true" ShowFilterHeaders="false"  />
							</dx:ASPxPivotGrid>
						</td>
					</tr>

				</table>



			</dx:PanelContent>
		</PanelCollection>
	</dx:ASPxCallbackPanel>
	
	<br />
	<br />

	<br />

   <table>
	   <tr>
		   <td style="vertical-align: top">
			   <asp:Panel ID ="panelL" runat="server"></asp:Panel>
		   </td>
		   <td style="vertical-align: top">
			   <asp:Panel ID ="panelR" runat="server"></asp:Panel>
		   </td>
	   </tr>
   </table>




	<%--SQL Data Sources--%>
 

	<%--Main Data--%>
	<%-- Include all measures because all subjects get them assigned even if they are NA --%>
<%--        SelectCommand="select * from vwMeasure where measureID in (Select measureID from tblStudyMeas where studyID = @studyID ) order by meascat, measname"--%>

<%--	<asp:SqlDataSource ID="sqlMeas" runat="server" SelectCommandType="Text"  
		SelectCommand="select studymeasID, timepoint_text, a.measname, studymeasname, meascat from vwStudyMeas a " + 
			"join vwMeasure b ON a.measureID = b.measureID " + 
			"where studyID = @studyID  " + 
			"and studymeasID not in (select reliabilityStudymeasID from tblstudymeas where reliabilitystudymeasID > 0) " + 
			"order by timepoint_text, a.measname"
		ConnectionString="<%$ ConnectionStrings:TRACKING_CONN_STRING %>" >
		<SelectParameters>
			<asp:SessionParameter SessionField="studyID" Name="studyID" DbType="Int32" />
		</SelectParameters>
	</asp:SqlDataSource>--%>





</asp:Content>

   
