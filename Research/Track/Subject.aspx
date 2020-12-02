<%@ Page Language="c#"   Debug="true" MasterPageFile="~/UWAC.master" CodeFile="Subject.aspx.cs" AutoEventWireup="true" EnableEventValidation="true"
 Inherits="Track_Subject" Title="Subject Info"      %>   <%--Theme="Skin1" EnableEventValidation="true"--%>
<%@ MasterType VirtualPath="~/UWAC.master" %>

<%@ Register Assembly="DevExpress.Web.v19.2, Version=19.2.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>


<asp:Content ID="HeadContent" runat="server" ContentPlaceHolderID="headContent" Visible="true">
<%--    <link href="Content/bootstrap.min.css" rel="stylesheet" />
	<link href="css/bootstrap-slider.min.css" rel="stylesheet" />
	<style>
		#ex1Slider .slider-selection {
			background: #BABABA;
		}
	</style>
	<script src="Scripts/bootstrap-slider.min.js"></script>

	<script type='text/javascript'>
		$(document).ready(function () {
			$('#ex1').slider({
				formatter: function (value) {
					return 'Current value: ' + value;
				}
			});
		});
	</script>--%>



<%--    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link href="css/bootstrap-slider.min.css" rel="stylesheet" />
	<script src="Scripts/bootstrap-slider.min.js"></script>--%>

<%--    <link href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css" rel="stylesheet" />
	<script src='http://code.jquery.com/ui/1.12.1/jquery-ui.min.js' type='text/javascript'></script>  --%>


</asp:Content>

<asp:Content ID="Content1"  ContentPlaceHolderID="oBodyPlaceHolder" runat="server">
	<asp:ScriptManager ID="ScriptManager1" runat="server" EnablePageMethods="true"  EnablePartialRendering="true"></asp:ScriptManager>



<%--Slider stuff--%>

<style>
  #custom-handle {
	width: 2em;
	height: 1.6em;
	top: 50%;
	margin-top: -.8em;
	text-align: center;
	line-height: 1.6em;
  }

  .right {
  position: absolute;
	right: 15px;
	width: 20%;
}
</style>


<%--<script type="text/javascript">


	$(document).ready(function () {

		$(function () {
			var hid = hidSlider;
			var handle = $("#custom-handle");

			var hidValue = document.getElementById('<%=sliderValue.ClientID %>');

			//Read value form hidden field and set to slider.
			//$("#slider").slider({ value: hid.value() });

			//Define the methods for the slider
			$("#slider").slider({
				value: hidValue.value, 
				create: function () {
					handle.text($(this).slider("value"));
				},
				slide: function (event, ui) {
					handle.text(ui.value);
				},
				stop: function (event, ui) {
					hid.Set('hidden_value', ui.value);
					hidValue.value = ui.value;
					PageMethods.SetColorLevel(ui.value);
					location.reload();
				}
			});

		});
	});

	//function SetSessionColorLevel(x) {
	//    var colorlev = x;
	//    PageMethods.SetColorLevel(x);
	//}
  
</script>--%>
	

	<%--Edit Subject Status--%>
	<script type="text/javascript">

	var lastSS = null;
	function OnSSChanged(cboSS, e) {
		var val = cboSS.GetSelectedItem().value.toString();

		if (cboSS.InCallback())
			//lastSS = cboSS.GetValue().toString();
			lastSS = val;
		else
			cboSSD.PerformCallback(val);
	}

	function OnSSEndCallback(s, e) {
		if (lastSS) {
			cboSSD.PerformCallback(lastSS);
			lastSS = null;
		}
	}

	function EditSS(s, e) {
		ShowEditControls(true);
	}
	function SaveSS(s, e) {
		ShowEditControls(false);
	}
	function CancelSS(s, e) {
		ASPxClientEdit.ClearEditorsInContainerById("vsValidationSummary1");
		ShowEditControls(false);
	}

	function ShowEditControls(state)
	{
		//when editing HIDE these 
		lblnotes.SetVisible(!state);
		btneditss.SetVisible(!state);

		//when editing SHOW these 
		cboSS.SetVisible(state);
		cboSSD.SetVisible(state);
		txtnotes.SetVisible(state);
		btnsavess.SetVisible(state);
		btncancelss.SetVisible(state);
	}

	function newID(s, e)
	{
		var id = s.GetValue();
		window.location.href = "Subject.aspx?ID=" + id;
	}
 


</script>


	
<%--Edit Measure Status--%>
<script type="text/javascript">
	var lastMS = null;
	function OnMSChanged(cboMS, e) {
		var val = cboMS.GetSelectedItem().value.toString();

		if (cboMS.InCallback())
			//lastSS = cboSS.GetValue().toString();
			lastMS = val;
		else
			cboMSD.PerformCallback(val);
	}


	function OnMSDEndCallback(s, e) {
		if (lastMS) {
			cboMSD.PerformCallback(lastMS);
			lastMS = null;
		}
	}

	//function OnEndCallback_gvM(s, e) {

	//    if (s.gvM_IsUpdated) {
	//        gvm.PerfromCallback();
	//    }

	//}


	function OnSelectedIndexChanged(s, e, visibleIndex) {
		var cboMSD = eval('cboMSD_' + visibleIndex);

		//var val = s.GetSelectedItem().value.toString();
		var val = s.GetValue();

		if (s.InCallback())
			//lastSS = cboSS.GetValue().toString();
			lastMS = val;
		else
			cboMSD.PerformCallback(val);

	}

</script>



<%--To Preselect all items in a TokenBox--%>
<script type="text/javascript">
	function OnclientComboBox_Init(s, e) {
		var itemCount = tkb.GetItemCount();
		for (var i = 0; i < itemCount; i++) {
			tkb.AddToken(tkb.GetItem(i).text);
		}
	}
</script>
	 


<%--To Select stuff--%>
<script type="text/javascript">
	function gvA_SelectionChanged(s, e) {
		s.GetSelectedFieldValues("ActionID", SelectMeasuresByActionID);
	}

	function SelectMeasuresByActionID(id) {
		gvm.PerformCallback(id);
	}
</script>

<dx:ASPxHiddenField ID="hidSlider" runat="server" ClientInstanceName="hidSlider"></dx:ASPxHiddenField>
<asp:HiddenField ID="sliderValue" runat="server"  />
	
	<div class="right">
		<table style="width:100%">
			<tr><td>
			<div id="slider" style="width: 100px" class="right" >
				<div id="custom-handle" class="ui-slider-handle"></div>
			</div>   

				</td></tr>
		</table>
	</div>




	
	<dx:ASPxHiddenField ID="hidNumSelected" runat="server" ClientInstanceName="hidnumselected"></dx:ASPxHiddenField>


<%--Basic Subject Info--%>
<table>
	<tr>
		<td>
			<dx:ASPxLabel ID="ASPxLabel1" runat="server" Text="ID:"  Font-Size="8" Font-Bold="true" ForeColor="Silver"></dx:ASPxLabel>
		</td>
		<td>
			<dx:ASPxLabel ID="ASPxLabel2" runat="server" Text="Group:"  Font-Size="8" Font-Bold="true" ForeColor="Silver"></dx:ASPxLabel>
		</td>
		<td>
			<dx:ASPxLabel ID="ASPxLabel3" runat="server" Text="Subject Status:"  Font-Size="8" Font-Bold="true" ForeColor="Silver"></dx:ASPxLabel>
		</td>
		<td>
			<dx:ASPxLabel ID="ASPxLabel4" runat="server" Text="Subject Status Detail:"  Font-Size="8" Font-Bold="true" ForeColor="Silver"></dx:ASPxLabel>
		</td>
		<td>
			<dx:ASPxLabel ID="lblNotestitle" runat="server" Text="Subject Notes:"  Font-Size="8" Font-Bold="true"  ForeColor="Silver"></dx:ASPxLabel>
		</td>
		<td>
		</td>
	</tr>

	<tr>
		<td style="width: 220px; vertical-align:top">
			<dx:ASPxLabel ID="lblID" runat="server" Text=""  Font-Size="14" Font-Bold="true" Visible="true"></dx:ASPxLabel>
			<br />
			<dx:ASPxComboBox ID="cboID" runat="server" DataSourceID="sqlS" TextField="ID" ValueField="ID" Font-Size="12" Font-Bold="true" width="200px"
				  DropDownStyle="DropDownList" ForeColor="Silver" NullText="-select a subject-">
				<ClientSideEvents SelectedIndexChanged="newID"   />
			</dx:ASPxComboBox>
			<br />

			<asp:HiddenField ID="hidSubjID" runat="server" />
		</td>
		<td style="width: 150px; vertical-align:top">
			<dx:ASPxLabel ID="lblGroup" runat="server" Text=""  Font-Size="14" Font-Bold="true"></dx:ASPxLabel>
		</td>
		<td style="width: 200px; vertical-align:top">
			<dx:ASPxLabel ID="lblSS" runat="server" Text=""  Font-Size="12" Font-Bold="true" ClientInstanceName="lblss"></dx:ASPxLabel>
				<dx:ASPxComboBox ID="cboSS" runat="server" ValueType="System.String" ClientInstanceName="cboSS" Font-Size="Larger"  ClientVisible="false" 
					DataSourceID="sqlSS" TextField="subjstatus" ValueField="ssID" DropDownStyle="DropDown" >
					<ClientSideEvents SelectedIndexChanged="function(s, e) { OnSSChanged(s, e); }"></ClientSideEvents>
					<ValidationSettings>
						<RequiredField IsRequired="True" ErrorText="Subject Status is Required." />
					</ValidationSettings>
				</dx:ASPxComboBox>
		</td>
		<td style="width: 200px; vertical-align:top">
			<dx:ASPxLabel ID="lblSSD" runat="server" Text=""  Font-Size="12" Font-Bold="true" ClientInstanceName="lblssd"></dx:ASPxLabel>
				<dx:ASPxComboBox ID="cboSSD" runat="server" ValueType="System.String" ClientInstanceName="cboSSD"  Font-Size="Larger"  ClientVisible="false"
					DataSourceID="sqlSSD" TextField="subjstatusdetail" ValueField="ssdID" OnCallback="cboSSD_Callback" DropDownStyle="DropDown" >
					<ClientSideEvents EndCallback="OnSSEndCallback"/>
					<ValidationSettings>
						<RequiredField IsRequired="True" ErrorText="Subject Status Detail is Required." />
					</ValidationSettings>
				</dx:ASPxComboBox>
		</td>
		<td  style="width: 250px; vertical-align:top">
			<dx:ASPxLabel ID="lblNotes" runat="server" Text=""  Font-Size="10" Font-Bold="false" ClientInstanceName="lblnotes"></dx:ASPxLabel>
			<dx:ASPxMemo ID="txtNotes" runat="server" Text="" Width="240px" Height="100px" ClientVisible="false" Font-Size="10" Font-Bold="false" ClientInstanceName="txtnotes"></dx:ASPxMemo><br />

		</td>
		<td  style="width: 150px; vertical-align:top">
			<dx:ASPxButton ID="btnEditSS" runat="server" Text="Edit" AutoPostBack="false" ClientInstanceName="btneditss" >
				<ClientSideEvents Click="EditSS" />
			</dx:ASPxButton>
			<dx:ASPxButton ID="btnSaveSS" runat="server" Text="Save" AutoPostBack="true" ClientInstanceName="btnsavess" ClientVisible="false" OnClick="SaveSubject" 
				 Font-Bold="true">
			</dx:ASPxButton>  
			<br /><br />
			<dx:ASPxButton ID="btnCancelSS" runat="server" Text="Cancel" AutoPostBack="false" ClientInstanceName="btncancelss" ClientVisible="false"  >
				<ClientSideEvents Click="CancelSS" />
			</dx:ASPxButton>
			<br />
			<dx:ASPxValidationSummary ID="vsValidationSummary1" runat="server" RenderMode="BulletedList"
				Width="250px" ClientInstanceName="validationSummary">
			</dx:ASPxValidationSummary>
		</td>
		<td style="vertical-align: top">
			 <dx:ASPxButton ID="btnHousehold" runat="server" Text="Go to Household" AutoPostBack="true" OnClick="btnHousehold_Click"></dx:ASPxButton>
		</td>
	</tr>
</table>
	



	<dx:ASPxTokenBox ID="tokTimepoint" runat="server" ItemValueType="System.String" DataSourceID="sqlTP"
		 TextField="timepoint_text" ValueField="timepointID" ClientInstanceName="tkb" Visible="false">
		<ClientSideEvents Init="OnclientComboBox_Init" />
	</dx:ASPxTokenBox>
	<br />


<%-- Actions & Measures --%>
	<table>
		<tr>
			<td style="vertical-align:top">
				<dx:ASPxLabel ID="lblA" runat="server" Text="Actions:"  Font-Size="10" Font-Bold="true"  ForeColor="Silver"></dx:ASPxLabel>
				<dx:ASPxButton ID="btnShowAll_Act" runat="server" ClientInstanceName="btnShowAll_Act"  Text="+" AutoPostBack="false" Paddings-Padding="0">                                <ClientSideEvents Click="onShowAll" />
					<ClientSideEvents Click="function() { gvA.ExpandAll(); }" />
				</dx:ASPxButton>
				<dx:ASPxButton ID="btnCollapseAll_Act" runat="server" ClientInstanceName="btnCollapseAll_Act"  Text="-" AutoPostBack="false" Paddings-Padding="0">                                <ClientSideEvents Click="onShowAll" />
					<ClientSideEvents Click="function() { gvA.CollapseAll(); }" />
				</dx:ASPxButton>

				<dx:ASPxLabel ID="gvAstatus" runat="server" Text=""  Font-Size="10" ForeColor="DarkGreen"></dx:ASPxLabel>
				<br />
				<%--DataSourceID="sqlA"--%>
				<dx:ASPxGridView ID="gvA" runat="server"  DataSourceID="sqlA" AutoGenerateColumns="false"   KeyFieldName="ActionID" ClientInstanceName="gvA"
					 OnRowUpdating="gvA_OnRowUpdating" OnHtmlDataCellPrepared="gvA_HtmlDataCellPrepared"  Styles-Header-Wrap="true"   >  
					<Columns>
						<dx:GridViewDataColumn FieldName="timepoint_text" Caption="TimePoint" ReadOnly="true" GroupIndex="0" VisibleIndex="0"  Width="70" ></dx:GridViewDataColumn>
						<dx:GridViewDataColumn FieldName="ActionType" Caption="Type" ReadOnly="true" VisibleIndex="1" Width="70"></dx:GridViewDataColumn>
						<dx:GridViewDataColumn FieldName="ActionText" Caption="Action" ReadOnly="true" VisibleIndex="2" Width="90"></dx:GridViewDataColumn>
						<dx:GridViewDataColumn FieldName="ActionStatus" Caption="Status"  VisibleIndex="3" Width="70">
							<DataItemTemplate>
								<dx:ASPxLabel ID="lblActionStatus" runat="server" Text='<%# Eval("ActionStatus") %>' ></dx:ASPxLabel>
							</DataItemTemplate>
						</dx:GridViewDataColumn>
<%--                        <dx:GridViewDataComboBoxColumn FieldName="ActionStatusID" Caption="Status" VisibleIndex="3">
							<PropertiesComboBox DataSourceID="sqlAS" TextField="actionstatus" ValueField="actionstatusID"  DropDownStyle="DropDown"></PropertiesComboBox>
						</dx:GridViewDataComboBoxColumn>--%>
						<dx:GridViewDataDateColumn FieldName="DateDone"  VisibleIndex="4" Width="70"></dx:GridViewDataDateColumn>
						<dx:GridViewDataDateColumn FieldName="Notes"  VisibleIndex="5" Width="200"></dx:GridViewDataDateColumn>
						<dx:GridViewDataColumn FieldName="ActionID" Caption="ActionID" ReadOnly="true"  Visible="false"></dx:GridViewDataColumn>
						<dx:GridViewCommandColumn ShowEditButton="true" VisibleIndex="5" Width="70"></dx:GridViewCommandColumn>
						<dx:GridViewCommandColumn ShowSelectCheckbox="True" Caption="Select Meas" VisibleIndex="6" Width="60px"></dx:GridViewCommandColumn>
					</Columns>
					<ClientSideEvents SelectionChanged="gvA_SelectionChanged"  />
					<Settings ShowGroupPanel="True" ShowGroupedColumns="True"   VerticalScrollableHeight="650" VerticalScrollBarMode="Visible"    />
					<SettingsBehavior  AllowGroup="true" AutoExpandAllGroups="true" EnableCustomizationWindow="true" AllowSelectSingleRowOnly="true" ProcessSelectionChangedOnServer="false"   /> <%--for show/hide custom columns--%>

					<SettingsEditing Mode="PopupEditForm"  />
					<SettingsLoadingPanel Mode="ShowOnStatusBar"  />
					<SettingsPager  Mode="ShowAllRecords" />
					<SettingsPopup >
						<EditForm Width="600" Modal="true" CloseOnEscape="true" />
					</SettingsPopup>

					 <EditFormLayoutProperties ColCount="3"  >
						
						<Items>
							<dx:GridViewColumnLayoutItem Caption="Action Status:" RowSpan="1" VerticalAlign="Top">
								<Template>
									<dx:ASPxComboBox ID="CboAS" runat="server" ValueType="System.Int32" OnInit="CboAS_Init" DropDownStyle="DropDown" ></dx:ASPxComboBox>
								</Template>
							</dx:GridViewColumnLayoutItem>
							<dx:GridViewColumnLayoutItem Caption="Date Done" RowSpan="2"   VerticalAlign="Top">
								<Template>
									<dx:ASPxDateEdit ID="DateCalendarA" runat="server" Value='<%# Bind("DateDone") %>' />
								</Template>
							</dx:GridViewColumnLayoutItem> 
<%--							<dx:GridViewColumnLayoutItem Caption="Completed By:" RowSpan="1" VerticalAlign="Top">
									<Template>
										<dx:ASPxComboBox ID="CboClin" runat="server" ValueType="System.Int32" OnInit="CboClin_Init" DropDownStyle="DropDown" ></dx:ASPxComboBox>
									</Template>
							</dx:GridViewColumnLayoutItem>--%>
							<dx:GridViewColumnLayoutItem Caption="Action Notes:" ColSpan="2" VerticalAlign="Top" >
								<Template>
									<dx:ASPxMemo runat="server" ID="notesEditorA" Text='<%# Eval("Notes")%>' Width="100%" Height="70px"/>                            
								</Template>
							</dx:GridViewColumnLayoutItem>
							<dx:GridViewColumnLayoutItem  Caption="" RowSpan="1" ColSpan="3" HorizontalAlign="Right" VerticalAlign="Top">
								<Template>
									<dx:ASPxCheckBox ID="chkUpdateAllSelected" runat="server" Text="Update all selected measures?" Checked="false" TextAlign="Right"></dx:ASPxCheckBox>   
									<dx:ASPxLabel ID="lblNumSelected" runat="server" Text="..." OnInit="CountNumSelectedRecords" Font-Bold="true" ForeColor="Tomato"></dx:ASPxLabel>
<%--                                    <dx:ASPxCheckBox ID="chkUpdateAllInAction" runat="server" Text="All measures in this Action?" Checked="false" TextAlign="Right"></dx:ASPxCheckBox>   --%>
								</Template>
							</dx:GridViewColumnLayoutItem>
							<dx:EditModeCommandLayoutItem ColSpan="3" HorizontalAlign="Right" Paddings-Padding="10px"  />
						</Items>
					</EditFormLayoutProperties>
				</dx:ASPxGridView>
			</td>
			<td style="width: 50px">

			</td>
			<td style="vertical-align:top">
				<dx:ASPxLabel ID="lblM" runat="server" Text="Measures:"  Font-Size="10" Font-Bold="true"  ForeColor="Silver"></dx:ASPxLabel>
				<dx:ASPxButton ID="btnShowAll_M" runat="server" ClientInstanceName="btnShowAll_M"  Text="+" AutoPostBack="false" Paddings-Padding="0">                                <ClientSideEvents Click="onShowAll" />
					<ClientSideEvents Click="function() { gvM.ExpandAll(); }" />
				</dx:ASPxButton>
				<dx:ASPxButton ID="btnCollapseAll_M" runat="server" ClientInstanceName="btnCollapseAll_M"  Text="-" AutoPostBack="false" Paddings-Padding="0">                                <ClientSideEvents Click="onShowAll" />
					<ClientSideEvents Click="function() { gvM.CollapseAll(); }" />
				</dx:ASPxButton>
				<dx:ASPxLabel ID="gvMstatus" runat="server" Text=""  Font-Size="10" ForeColor="DarkGreen"></dx:ASPxLabel>
				<br />


				<dx:ASPxGridView ID="gvM" runat="server" DataSourceID="sqlM" AutoGenerateColumns="false"  ClientInstanceName="gvM"
					 KeyFieldName="StudyMeasSubjID"  OnHtmlDataCellPrepared="gvM_HtmlDataCellPrepared"  
					OnRowUpdating="gvM_OnRowUpdating" OnCustomCallback="gvM_CustomCallback"    >
					
					<Columns>
						<dx:GridViewDataColumn FieldName="timepoint_text" Caption="TimePoint" ReadOnly="true" GroupIndex="0" VisibleIndex="0" Width="60" ></dx:GridViewDataColumn>
						<dx:GridViewDataColumn FieldName="StudyMeasName" Caption="Study Meas" ReadOnly="true" VisibleIndex="1" Width="110"></dx:GridViewDataColumn>
						<dx:GridViewDataColumn FieldName="MeasStatusID" Caption="Status" VisibleIndex="2" Width="90">
							<DataItemTemplate>
								<dx:ASPxLabel ID="lblMeasStatus" runat="server" Text='<%# Eval("MeasStatus") %>' ></dx:ASPxLabel>
							</DataItemTemplate>
						</dx:GridViewDataColumn>
						<dx:GridViewDataColumn FieldName="MeasStatusDetailID" Caption="Status Detail" VisibleIndex="3" Width="90">
							<DataItemTemplate>
								<dx:ASPxLabel ID="lblMeasStatusDetail" runat="server" Text='<%# Eval("MeasStatusDetail") %>' ></dx:ASPxLabel>
							</DataItemTemplate>
							<EditFormSettings VisibleIndex="0" />

						</dx:GridViewDataColumn>
						 <dx:GridViewDataColumn FieldName="Clinician" Caption="Clinican" VisibleIndex="8" Width="90">
								<DataItemTemplate>
									<dx:ASPxLabel ID="lblClin" runat="server" Text='<%# Eval("staffname") %>' ></dx:ASPxLabel>
								</DataItemTemplate>
							</dx:GridViewDataColumn>
						<dx:GridViewDataDateColumn FieldName="Date" Caption="Date" VisibleIndex="4" Width="80"></dx:GridViewDataDateColumn>
						<dx:GridViewDataColumn FieldName="sms_dd_status" Caption="DE status"  VisibleIndex="5" Width="60">
							<DataItemTemplate>
								<dx:ASPxHyperLink ID="delink" runat="server"  ForeColor="Black"
									NavigateUrl='<%# Eval("DataEntryURL") %>' Text='<%# Eval("sms_dd_status") %>' Target="blank" />
							</DataItemTemplate>
							<EditFormSettings VisibleIndex="1" />
						</dx:GridViewDataColumn>
						
						<dx:GridViewDataColumn FieldName="ActionText" Caption="Action" ReadOnly="true" VisibleIndex="6" Width="120"></dx:GridViewDataColumn>
						<dx:GridViewDataColumn FieldName="Notes" VisibleIndex="7" Width="100"></dx:GridViewDataColumn>                             
						<dx:GridViewDataColumn FieldName="StudyMeasSubjID" ReadOnly="true" Visible="false"></dx:GridViewDataColumn>                             
						<dx:GridViewDataColumn FieldName="ActionID" ReadOnly="true" Visible="false"></dx:GridViewDataColumn>                             
						<dx:GridViewCommandColumn ShowEditButton="true" ShowCancelButton="true" Width="70"></dx:GridViewCommandColumn>

					</Columns>
					 <%--VerticalScrollBarMode="Auto" --%>
					
					<Settings ShowGroupPanel="true" ShowGroupedColumns="True" VerticalScrollableHeight="650" VerticalScrollBarMode="Visible" />   <%--ShowPreview="true" --%>
					<SettingsBehavior AllowGroup="true" AutoExpandAllGroups="true" EnableCustomizationWindow="true" AllowSelectByRowClick="true" />
					<SettingsDataSecurity AllowEdit="true" />
					<SettingsEditing Mode="PopupEditForm"  />
					<SettingsLoadingPanel Mode="ShowOnStatusBar"  />
					<SettingsPager Mode="ShowAllRecords" />
					<SettingsPopup >
						<EditForm Width="600" Modal="true" CloseOnEscape="true" />
					</SettingsPopup>
					<EditFormLayoutProperties ColCount="3"  >
						
						<Items>
							<dx:GridViewColumnLayoutItem Caption="Measure Status:" RowSpan="1" VerticalAlign="Top">
								<Template>
									<dx:ASPxComboBox ID="CboMS" runat="server" ValueType="System.Int32" OnInit="CboMS_Init" DropDownStyle="DropDown" ></dx:ASPxComboBox>
								</Template>
							</dx:GridViewColumnLayoutItem>
							<dx:GridViewColumnLayoutItem Caption="Measure Status Detail:" RowSpan="1" VerticalAlign="Top">
								<Template>
									<dx:ASPxComboBox ID="CboMSD" runat="server" ValueType="System.Int32" OnInit="CboMSD_Init"  DropDownStyle="DropDown" >
										<ClientSideEvents EndCallback="OnMSDEndCallback"/>
									</dx:ASPxComboBox>
									<asp:SqlDataSource ID="sqlMSD2" runat="server" SelectCommandType="StoredProcedure"  
										SelectCommand="trk.spTracking_GetMeasStatusDetail"
										ConnectionString="<%$ ConnectionStrings:TRACKING_CONN_STRING %>" >
										<SelectParameters>
											<asp:Parameter  Name="measstatusID"  DbType="Int32" />
										</SelectParameters>
									</asp:SqlDataSource>
								</Template>
							</dx:GridViewColumnLayoutItem>
								<dx:GridViewColumnLayoutItem Caption="Date Done" RowSpan="2"   VerticalAlign="Top">
									<Template>
										<dx:ASPxDateEdit ID="DateCalendar" runat="server" Value='<%# Bind("Date") %>' />
										<dx:ASPxRadioButtonList ID="rblDate" runat="server" Font-Size="8pt" >
											<Items>
												<dx:ListEditItem Text="Use Action Date" Value="action_datedone"/>
												<dx:ListEditItem Text="Use Entered Data Date" Value="data_datedone" />
											</Items>
										</dx:ASPxRadioButtonList>
									</Template>
								</dx:GridViewColumnLayoutItem> 
							<dx:GridViewColumnLayoutItem Caption="Completed By:" RowSpan="1" VerticalAlign="Top">
									<Template>
										<dx:ASPxComboBox ID="CboClin" runat="server" ValueType="System.Int32" OnInit="CboClin_Init" DropDownStyle="DropDown" ></dx:ASPxComboBox>
									</Template>
								</dx:GridViewColumnLayoutItem>
							<dx:GridViewColumnLayoutItem Caption="Measure Notes:" ColSpan="2" VerticalAlign="Top">
								<Template>
									<dx:ASPxMemo runat="server" ID="notesEditor" Text='<%# Eval("Notes")%>' Width="100%" Height="70px"/>                            
								</Template>
							</dx:GridViewColumnLayoutItem>
							<dx:GridViewColumnLayoutItem  Caption="" RowSpan="1" ColSpan="3" HorizontalAlign="Right" VerticalAlign="Top">
								<Template>
									<dx:ASPxCheckBox ID="chkUpdateAllSelected" runat="server" Text="Update all selected measures?" Checked="false" TextAlign="Right"></dx:ASPxCheckBox>   
									<dx:ASPxLabel ID="lblNumSelected" runat="server" Text="..." OnInit="CountNumSelectedRecords" Font-Bold="true" ForeColor="Tomato"></dx:ASPxLabel>
<%--                                    <dx:ASPxCheckBox ID="chkUpdateAllInAction" runat="server" Text="All measures in this Action?" Checked="false" TextAlign="Right"></dx:ASPxCheckBox>   --%>
								</Template>
							</dx:GridViewColumnLayoutItem>
							<dx:EditModeCommandLayoutItem ColSpan="3" HorizontalAlign="Right" Paddings-Padding="10px"  />
						</Items>
					</EditFormLayoutProperties>

				</dx:ASPxGridView>
			</td>
		</tr>
	</table>


	



	<%--SQL Data Sources--%>
	<asp:SqlDataSource ID="sqlS" runat="server" SelectCommandType="Text"  
		SelectCommand="select ID from trk.vwMasterStatus_S2 where studyID=@studyID order by 1"
		ConnectionString="<%$ ConnectionStrings:TRACKING_CONN_STRING %>" >
		<SelectParameters>
			<asp:SessionParameter SessionField="studyID" Name="studyID" DbType="Int32" />
		</SelectParameters>
	</asp:SqlDataSource>

		<asp:SqlDataSource ID="sqlSS" runat="server" SelectCommandType="Text" ConnectionString="<%$ ConnectionStrings:TRACKING_CONN_STRING %>"
				SelectCommand="select ssID, subjstatus, ss, sortorder from tblSS where studyID = @studyID order by sortorder">
			<SelectParameters>
				<asp:SessionParameter SessionField="master_studyID" Name="studyID" Type="Int32" />
			</SelectParameters> 
	</asp:SqlDataSource>

		<asp:SqlDataSource ID="sqlSSD" runat="server" SelectCommandType="Text" ConnectionString="<%$ ConnectionStrings:TRACKING_CONN_STRING %>"
				SelectCommand="select ssID, ssdID, subjstatusdetail, sortorder from tblSSD where studyID = @studyID and ssID=@ssID order by sortorder">
			<SelectParameters>
				<asp:SessionParameter SessionField="master_studyID" Name="studyID" Type="Int32" />
				<asp:SessionParameter SessionField="ssID" Name="ssID" Type="Int32" />
			</SelectParameters> 
	</asp:SqlDataSource>

<%--	<asp:SqlDataSource ID="sqlSS" runat="server" SelectCommandType="StoredProcedure"  
		SelectCommand="trk.spTracking_GetSubjStatus_byStudy"
		ConnectionString="<%$ ConnectionStrings:TRACKING_CONN_STRING %>" >
		<SelectParameters>
			<asp:SessionParameter SessionField="studyID" Name="studyID" DbType="Int32" />
		</SelectParameters>
	</asp:SqlDataSource>--%>

<%--	<asp:SqlDataSource ID="sqlSSD" runat="server" SelectCommandType="StoredProcedure"  
		SelectCommand="trk.spTracking_GetSubjStatusDetail_byStudy"
		ConnectionString="<%$ ConnectionStrings:TRACKING_CONN_STRING %>" >
		<SelectParameters>
			<asp:SessionParameter SessionField="studyID" Name="studyID" DbType="Int32" />
			<asp:Parameter Name="subjstatusID"  DbType="Int32" />
		</SelectParameters>
	</asp:SqlDataSource>--%>

	<asp:SqlDataSource ID="sqlAS" runat="server" SelectCommandType="Text"  
		SelectCommand="select * from tblActionStatus_lkup"
		ConnectionString="<%$ ConnectionStrings:TRACKING_CONN_STRING %>" >
	</asp:SqlDataSource>

	<asp:SqlDataSource ID="sqlMS" runat="server" SelectCommandType="StoredProcedure"  
		SelectCommand="trk.spTracking_GetMeasStatus"
		ConnectionString="<%$ ConnectionStrings:TRACKING_CONN_STRING %>" >
	</asp:SqlDataSource>

	<asp:SqlDataSource ID="sqlMSD" runat="server" SelectCommandType="StoredProcedure"  
		SelectCommand="trk.spTracking_GetMeasStatusDetail"
		ConnectionString="<%$ ConnectionStrings:TRACKING_CONN_STRING %>" >
		<SelectParameters>
			<asp:Parameter Name="measstatusID"  DbType="Int32" />
		</SelectParameters>
	</asp:SqlDataSource>


	<asp:SqlDataSource ID="sqlA" runat="server" SelectCommandType="Text"  
		SelectCommand="Select * from trk.vwMasterStatus_A where subjID = @subjID"
		ConnectionString="<%$ ConnectionStrings:TRACKING_CONN_STRING %>" >
		<SelectParameters>
			<asp:ControlParameter ControlID="hidSubjID" Name="subjID" DbType="Int32" />
		</SelectParameters>
	</asp:SqlDataSource>

	<asp:SqlDataSource ID="sqlM" runat="server" SelectCommandType="Text"  
		SelectCommand="Select * from trk.vwMasterStatus_M where studyID = @studyID and ID = @ID"
		ConnectionString="<%$ ConnectionStrings:TRACKING_CONN_STRING %>" >
		<SelectParameters>
			<asp:SessionParameter SessionField="studyID" Name="studyID" DbType="Int32" />
			<asp:SessionParameter SessionField="ID" Name="ID" DbType="String" />
		</SelectParameters>
	</asp:SqlDataSource>

	
	<asp:SqlDataSource ID="sqlTP" runat="server" SelectCommandType="Text"  
		SelectCommand="select timepointID, timepoint_text from tblTimePoint where studyID=@studyID"
		ConnectionString="<%$ ConnectionStrings:TRACKING_CONN_STRING %>" >
		<SelectParameters>
			<asp:SessionParameter SessionField="studyid" Name="studyID" DbType="Int32" />
		</SelectParameters>
	</asp:SqlDataSource>

	<asp:SqlDataSource ID="sqlStaff" runat="server" SelectCommandType="Text"  
		SelectCommand="exec trk.Tracking_GetActiveStaff @studyID"
		ConnectionString="<%$ ConnectionStrings:TRACKING_CONN_STRING %>" >
		<SelectParameters>
			<asp:SessionParameter SessionField="studyID" Name="studyID" DbType="Int32" />
		</SelectParameters>
	</asp:SqlDataSource>

	

</asp:Content>
