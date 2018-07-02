<%@ Page Language="c#"   Debug="true" MasterPageFile="~/UWAC.master" CodeFile="Measures.aspx.cs" AutoEventWireup="true"
 Inherits="Tracking_Measures" Title="Measure Info"      %>
  <%--Theme="Skin1" EnableEventValidation="true"--%>
<%@ MasterType VirtualPath="~/UWAC.master" %>

<%@ Register Assembly="DevExpress.Web.v17.2, Version=17.2.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.ASPxPivotGrid.v17.2, Version=17.2.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxPivotGrid" TagPrefix="dx" %> 



<asp:Content ID="HeadContent" runat="server" ContentPlaceHolderID="headContent" Visible="true">
    <link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css"  />
    <script type='text/javascript' src='https://code.jquery.com/ui/1.12.1/jquery-ui.min.js' ></script> 
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



    <script type="text/javascript">

    //slider stuff

    $(document).ready(function () {

        $(function () {
            var hid = hidSlider;
            var handle = $("#custom-handle");

            var hidValue = document.getElementById('<%=sliderValue.ClientID %>');

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



    function OnSelectedIndexChanged_M(s, e, visibleIndex) {
        var cboMSD = eval('cboMSD_' + visibleIndex);

        //var val = s.GetSelectedItem().value.toString();
        var val = s.GetValue();

        if (s.InCallback())
            //lastSS = cboSS.GetValue().toString();
            lastMS = val;
        else
            cboMSD.PerformCallback(val);

    }


         function SomeSelected(s, e) {
             btnLoad.SetText("Load Selected Measures");
         }

         function ClearSelected() {

             gridLkupMeas.SetValue(null);
             tokTimepoint.ClearTokenCollection();
             tokGroup.ClearTokenCollection();
             tokMeasStatus.ClearTokenCollection();
             tokSubjStatus.ClearTokenCollection();
             btnLoad.SetText("Load Measures");
             window.location.href = "Measure.aspx";
         }
</script>




<dx:ASPxHiddenField ID="hidSlider" runat="server" ClientInstanceName="hidSlider"></dx:ASPxHiddenField>
<dx:ASPxHiddenField ID="hidNumSelected" runat="server" ClientInstanceName="hidnumselected"></dx:ASPxHiddenField>
<asp:HiddenField ID="sliderValue" runat="server"  />
    

<br />
    <div class="right">
        <table style="width: 100%">
            <tr>
                <td style="text-align: right; padding-right: 25px;">
                    <asp:Label ID="lblCB" runat="server" Text="Color brightness" ForeColor="Silver" Font-Size="XX-Small" Visible="true"></asp:Label>
                    <asp:TextBox ID="txtColorLevel" runat="server" ForeColor="Silver" Font-Size="XX-Small" ></asp:TextBox>
                    <div id="slider" style="width: 100px" class="right">
                        <div id="custom-handle" class="ui-slider-handle"></div>
                    </div>

                </td>
            </tr>
            <tr>
                <td style="text-align: right; padding-right: 20px;">
                    <br />
                    <br />
                    <dx:ASPxButton ID="btnHelp" runat="server" Text="Help" OnClick="btnHelp_Click" Width="70px"></dx:ASPxButton>
                </td>
            </tr>
        </table>
    </div>


<br />

    <dx:ASPxLabel ID="lblTest" runat="server" Text="" ForeColor="Magenta" />

    <dx:ASPxComboBox ID="ddlEntity" runat="server" Font-Bold="true" Font-Size="16" OnSelectedIndexChanged="ddlEntity_OnSelectedIndexChanged" AutoPostBack="true" >
        <Items>
            <dx:ListEditItem Value="Subjects" />
            <dx:ListEditItem Value="Actions" />
            <dx:ListEditItem Value="Measures" Selected="true"/>
            <%--<dx:ListEditItem Value="Consents" />--%>
        </Items>
    </dx:ASPxComboBox>
        <table>
        <tr>
            <td style="width: 450px; vertical-align: top">
                Select Measures:
                <dx:ASPxGridLookup ID="gridLkupMeas" runat="server" DataSourceID="sqlMeas" 
                    KeyFieldName="measureID" SelectionMode="Multiple" MultiTextSeparator=", " Caption=""
                                    TextFormatString="{0}" Width="400px" ClientInstanceName="gridLkupMeas"
                    IncrementalFilteringMode="None">
                    <ClearButton DisplayMode="OnHover"></ClearButton>
                    <ClientSideEvents ValueChanged="SomeSelected" />
                    <Columns>
                        <dx:GridViewCommandColumn ShowSelectCheckbox="True" />
                        <dx:GridViewDataTextColumn FieldName="measname" Caption="Measure" />
                        <dx:GridViewDataTextColumn FieldName="meascat" Caption="Category"/>
                    </Columns>
                    <GridViewProperties>
                       <%-- <Templates>
                            <StatusBar>
                                <table class="OptionsTable" style="float: right">
                                    <tr>
                                        <td>
                                            <% --<dx:ASPxButton ID="Close" runat="server" AutoPostBack="false"
                                                Text="Close" ClientSideEvents-Click="CloseGridLookup" />-- %>
                                        </td>
                                    </tr>
                                </table>
                            </StatusBar>
                        </Templates>--%>
                        <Settings ShowFilterRow="true" ShowFilterRowMenu="true" ShowFilterRowMenuLikeItem="true"  ShowStatusBar="Visible"  />
                        <SettingsBehavior AllowDragDrop="False" EnableRowHotTrack="True" />
                        <SettingsPager NumericButtonCount="3"  PageSize="40" Summary-Visible="true" />
                    </GridViewProperties>
                </dx:ASPxGridLookup>

                <table>
                    <tr>
                        <td>
                            Select Measure Status:
                            <dx:ASPxTokenBox ID="tokMeasStatus" runat="server" ItemValueType="System.String" DataSourceID="sqlMS" ClientInstanceName="tokMeasStatus"
                                    TextField="MeasStatus" ValueField="MeasStatusID"   >
                                <ClientSideEvents ValueChanged="SomeSelected" />
                            </dx:ASPxTokenBox>
                        </td>
                        <td style="width: 10px"></td>
                        <td>
                            Select DE Status:
                            <dx:ASPxTokenBox ID="tokDEStatus" runat="server" ItemValueType="System.String" DataSourceID="sqlDEstatus" ClientInstanceName="tokDEStatus"
                                    TextField="sms_dd_status" ValueField="smsdd_pk"     
                                    OnItemRowPrepared="tokDEStatus_ItemRowPrepared" >
                                <ClientSideEvents ValueChanged="SomeSelected" />
                            </dx:ASPxTokenBox>
<%--                            OnItemTextCellPrepared="tokDEStatus_ItemTextCellPrepared"  EnableCallbackMode="true" --%>

                        </td>
                    </tr>
                </table>
                <dx:ASPxRadioButtonList ID="rblREL" runat="server" Font-Size="8" Border-BorderStyle="None" RepeatDirection="Horizontal" >
                    <Items>
                        <dx:ListEditItem Text="No REL" Value="No REL" Selected="true" />
                        <dx:ListEditItem Text="Yes REL" Value="Yes REL" Selected="false" />
                        <dx:ListEditItem Text="Only REL" Value="Only REL" Selected="false" />
                    </Items>
                </dx:ASPxRadioButtonList>
 

                

            </td>
            <td style="vertical-align: top">
                Select Timepoints:
                <dx:ASPxTokenBox ID="tokTimepoint" runat="server" ItemValueType="System.String" DataSourceID="sqlTP" ClientInstanceName="tokTimepoint"
                     TextField="timepoint_text" ValueField="timepointID"   >
                    <ClientSideEvents ValueChanged="SomeSelected" />
                </dx:ASPxTokenBox>
                Select Groups:
                <dx:ASPxTokenBox ID="tokGroup" runat="server" ItemValueType="System.String" DataSourceID="sqlGroup" ClientInstanceName="tokGroup"
                     TextField="groupname" ValueField="groupID"   >
                    <ClientSideEvents ValueChanged="SomeSelected" />
                </dx:ASPxTokenBox>
                Select Subject Status:
                <dx:ASPxTokenBox ID="tokSubjStatus" runat="server" ItemValueType="System.String" DataSourceID="sqlSS" ClientInstanceName="tokSubjStatus"
                     TextField="SubjStatus" ValueField="subjstatusID"   >
                    <ClientSideEvents ValueChanged="SomeSelected" />
                </dx:ASPxTokenBox>


            </td>
            <td style="vertical-align: top; width: 50px;"></td>
            <td style="vertical-align: top">
                <dx:ASPxButton ID="btnLoad" runat="server" Text="Load Measures" OnClick="btnLoad_OnClick" AutoPostBack="false" ClientInstanceName="btnLoad" >
                     <%--<ClientSideEvents Click="foo" />--%>
                </dx:ASPxButton>
                <dx:ASPxButton ID="btnClear" runat="server" Text="Clear" Width="30px" Font-Size="X-Small" ForeColor="Silver" BackColor="WhiteSmoke" AutoPostBack="false" >
                    <ClientSideEvents Click="ClearSelected"    />
                </dx:ASPxButton>
                <br />
                <dx:ASPxRadioButtonList ID="rblObj" runat="server" Font-Size="9" Border-BorderStyle="None" >
                    <Items>
                        <dx:ListEditItem Text="Edit in Table" Value="Table" Selected="false" />
                        <dx:ListEditItem Text="Display Details in Grid" Value="Grid Details" Selected="true" />
                        <dx:ListEditItem Text="Display Counts in Grid" Value="Grid Counts" Selected="false" />
                    </Items>
                </dx:ASPxRadioButtonList>

            </td>
        </tr>
    </table>
    
<br />



<%-- Measures --%>
    <table>
        <tr>
            <td style="vertical-align:top">
                    <dx:ASPxHint ID="ASPxHint1" runat="server" TargetSelector=".dx-ellipsis"></dx:ASPxHint>
                    <dx:ASPxLabel ID="lblM" runat="server" Text="Measures:"  Font-Size="10" Font-Bold="true"  ForeColor="Silver"></dx:ASPxLabel>
                    <dx:ASPxLabel ID="Mstatus" runat="server" Text=""  Font-Size="10" Font-Bold="true" ForeColor="Silver"></dx:ASPxLabel>
                    <br />
                    <asp:HiddenField ID="hidEditingPk" runat="server"></asp:HiddenField>
                    <dx:ASPxGridView ID="gvM" runat="server"    AutoGenerateColumns="false"  ClientInstanceName="gvm" Visible="false" DataSourceID="sql__sms"
                         KeyFieldName="StudyMeasSubjID"  OnHtmlDataCellPrepared="gvM_HtmlDataCellPrepared" OnStartRowEditing="gvM_OnStartRowEditing" 
                        OnRowUpdating="gvM_OnRowUpdating" OnDataBinding="gvM_DataBinding" OnBeforeColumnSortingGrouping="gvM_OnBeforeColumnSortingGrouping" 
                         >
                        <ClientSideEvents  EndCallback="function(s, e) {ASPxClientHint.Update();}"   />
                        <SettingsExport EnableClientSideExportAPI="true" FileName="Measures"></SettingsExport>
                        <Settings ShowFilterBar="Visible" ShowHeaderFilterButton="true"  />
                        <SettingsFilterControl ViewMode="Visual" ShowAllDataSourceColumns="true" ></SettingsFilterControl>
                        <SettingsPager PageSize="20"></SettingsPager>
                      <Toolbars>
                        <dx:GridViewToolbar EnableAdaptivity="true">
                            <Items>
                                <dx:GridViewToolbarItem Text="Export" Image-IconID="export_export_16x16">
                                    <Items>
                                        <dx:GridViewToolbarItem Command="ExportToPdf" />
                                        <dx:GridViewToolbarItem Command="ExportToXls" />
                                        <dx:GridViewToolbarItem Command="ExportToXlsx" />
                                        <dx:GridViewToolbarItem Command="ExportToDocx" />
                                        <dx:GridViewToolbarItem Command="ExportToRtf" />
                                        <dx:GridViewToolbarItem Command="ExportToCsv" />
                                    </Items>
                                </dx:GridViewToolbarItem>
                                <dx:GridViewToolbarItem Command="ShowCustomizationWindow" />
                             </Items>
                        </dx:GridViewToolbar>
                    </Toolbars>
                        <Columns>
                            <dx:GridViewDataColumn FieldName="timepoint_text" Caption="TimePoint" ReadOnly="true"  VisibleIndex="0" Width="50"></dx:GridViewDataColumn>
                            <dx:GridViewDataColumn FieldName="StudyMeasName" Caption="Study Meas" ReadOnly="true" VisibleIndex="1"></dx:GridViewDataColumn>
                            <dx:GridViewDataColumn FieldName="ID"  ReadOnly="true" VisibleIndex="2"></dx:GridViewDataColumn>
                            <dx:GridViewDataColumn FieldName="GroupName" Caption="Group"  ReadOnly="true" VisibleIndex="3"></dx:GridViewDataColumn>
                            <dx:GridViewDataColumn FieldName="SubjStatus" Caption="Subject Status"  ReadOnly="true" VisibleIndex="4"></dx:GridViewDataColumn>
                            <dx:GridViewDataColumn FieldName="MeasStatusID" Caption="Status" VisibleIndex="5">
                                <DataItemTemplate>
                                    <dx:ASPxLabel ID="lblMeasStatus" runat="server" Text='<%# Eval("MeasStatus") %>' ></dx:ASPxLabel>
                                </DataItemTemplate>
                            </dx:GridViewDataColumn>
                            <dx:GridViewDataColumn FieldName="MeasStatusDetailID" Caption="Status Detail" VisibleIndex="6">
                                <DataItemTemplate>
                                    <dx:ASPxLabel ID="lblMeasStatusDetail" runat="server" Text='<%# Eval("MeasStatusDetail") %>' ></dx:ASPxLabel>
                                </DataItemTemplate>
                                <EditFormSettings VisibleIndex="0" />
                            </dx:GridViewDataColumn>

                            <dx:GridViewDataDateColumn FieldName="Date" Caption="Date" VisibleIndex="7"></dx:GridViewDataDateColumn>
                            <dx:GridViewDataColumn FieldName="Clinician" Caption="Clinican" VisibleIndex="8">
                                <DataItemTemplate>
                                    <dx:ASPxLabel ID="lblClin" runat="server" Text='<%# Eval("staffname") %>' ></dx:ASPxLabel>
                                </DataItemTemplate>
                            </dx:GridViewDataColumn>
                            <dx:GridViewDataColumn FieldName="sms_dd_status" Caption="DE status"  VisibleIndex="9">
                                <DataItemTemplate>
                                    <dx:ASPxHyperLink ID="delink" runat="server"  ForeColor="Black"
                                        NavigateUrl='<%# Eval("DataEntryURL") %>' Text='<%# Eval("sms_dd_status") %>' Target="blank" />
                                </DataItemTemplate>
                                <EditFormSettings VisibleIndex="1" />
                            </dx:GridViewDataColumn>
                        
                            <dx:GridViewDataColumn FieldName="ActionText" Caption="Action" ReadOnly="true" VisibleIndex="10">
                                <DataItemTemplate>
                                    <dx:ASPxLabel ID="lblClin" runat="server" Text='<%# Eval("ActionText") %>' ToolTip='<%# Eval("ID") + Environment.NewLine + Eval("ActionText") + Environment.NewLine + Eval("ActionStatus") + Environment.NewLine + Eval("action_datedone")  %>' ></dx:ASPxLabel>
                                </DataItemTemplate>
                            </dx:GridViewDataColumn>
                            <dx:GridViewDataColumn FieldName="Notes" VisibleIndex="11" Width="100"></dx:GridViewDataColumn>                             
                            <dx:GridViewDataColumn FieldName="StudyMeasID" ReadOnly="true" Visible="true"></dx:GridViewDataColumn>                             
                            <dx:GridViewDataColumn FieldName="StudyMeasSubjID" ReadOnly="true" Visible="false"></dx:GridViewDataColumn>                             
                            <dx:GridViewDataColumn FieldName="ActionID" ReadOnly="true" Visible="false"></dx:GridViewDataColumn>                             
                            <dx:GridViewCommandColumn ShowEditButton="true" ShowCancelButton="true"  ></dx:GridViewCommandColumn>

                        </Columns>
                         <%--VerticalScrollBarMode="Auto" --%>
                    
                        <Settings ShowGroupPanel="true" ShowGroupedColumns="True" />   
                        <SettingsBehavior AllowGroup="true" AutoExpandAllGroups="true" EnableCustomizationWindow="true" AllowSelectByRowClick="true"  AllowEllipsisInText="True"  />
                        <SettingsDataSecurity AllowEdit="true" />
                        <SettingsEditing Mode="PopupEditForm"    />
                        <SettingsLoadingPanel Mode="ShowOnStatusBar"  />
                        <SettingsPager PageSize="50" Summary-Visible="true" AlwaysShowPager="true" >
                            <PageSizeItemSettings Visible="true" Items="20,50,100,500" ShowAllItem="true" />
                        </SettingsPager>

                        <SettingsPopup  >
                            <EditForm Width="600" Modal="true" CloseOnEscape="true"    />
                        </SettingsPopup>
                        <SettingsText PopupEditFormCaption="Edit Measure"/>
                        <EditFormLayoutProperties ColCount="3" >
                            
                            <Items>
                                <dx:GridViewColumnLayoutItem Caption=" " ColSpan="3" RowSpan="1" VerticalAlign="Top">
                                    <Template>
                                        <dx:ASPxLabel ID="popupTitle" runat="server" Font-Bold="true" Font-Size="12" OnInit="popupTitle_OnInit"></dx:ASPxLabel>
                                    </Template>
                                </dx:GridViewColumnLayoutItem> 
                                <dx:GridViewColumnLayoutItem Caption="Measure Status:" RowSpan="1" VerticalAlign="Top">
                                    <Template>
                                        <dx:ASPxComboBox ID="CboMS" runat="server" ValueType="System.Int32" OnInit="CboMS_Init" DropDownStyle="DropDown" ></dx:ASPxComboBox>
                                        <dx:ASPxCheckBox ID="CboMS_DoNotUpdate" runat="server" Text="Do Not Update" ForeColor="Silver"></dx:ASPxCheckBox>
                                    </Template>
                                </dx:GridViewColumnLayoutItem>
                                <dx:GridViewColumnLayoutItem Caption="Measure Status Detail:" RowSpan="1" VerticalAlign="Top">
                                    <Template>
                                        <dx:ASPxComboBox ID="CboMSD" runat="server" ValueType="System.Int32" OnInit="CboMSD_Init"  DropDownStyle="DropDown" >
                                            <ClientSideEvents EndCallback="OnMSDEndCallback"/>
                                        </dx:ASPxComboBox>
                                        <dx:ASPxCheckBox ID="CboMSD_DoNotUpdate" runat="server" Text="Do Not Update" ForeColor="Silver"></dx:ASPxCheckBox>
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
                                        <dx:ASPxCheckBox ID="DateCalendar_DoNotUpdate" runat="server" Text="Do Not Update" ForeColor="Silver"></dx:ASPxCheckBox>
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
                                        <dx:ASPxCheckBox ID="CboClin_DoNotUpdate" runat="server" Text="Do Not Update" ForeColor="Silver"></dx:ASPxCheckBox>
                                    </Template>
                                </dx:GridViewColumnLayoutItem>
                                <dx:GridViewColumnLayoutItem Caption="Measure Notes:" ColSpan="2" VerticalAlign="Top">
                                    <Template>
                                        <dx:ASPxMemo runat="server" ID="notesEditor" Text='<%# Eval("Notes")%>' Width="100%" Height="70px"/>        
                                        <dx:ASPxCheckBox ID="notesEditor_DoNotUpdate" runat="server" Text="Do Not Update" ForeColor="Silver"></dx:ASPxCheckBox>
                                    </Template>
                                </dx:GridViewColumnLayoutItem>
                                <dx:GridViewColumnLayoutItem  Caption="" RowSpan="1" ColSpan="3" HorizontalAlign="Right" VerticalAlign="Top">
                                    <Template>
                                        <dx:ASPxCheckBox ID="chkUpdateAllSelected" runat="server" Text="Update additional selected measures?" Checked="false" TextAlign="Right"></dx:ASPxCheckBox>   
                                        <dx:ASPxLabel ID="lblNumSelected" runat="server" Text="..." OnInit="CountNumSelectedRecords" Font-Bold="true" ForeColor="Tomato"></dx:ASPxLabel>
                                    </Template>
                                </dx:GridViewColumnLayoutItem>
                                <dx:EditModeCommandLayoutItem ColSpan="3" HorizontalAlign="Right" Paddings-Padding="10px"  />
                            </Items>
                        </EditFormLayoutProperties>

                    </dx:ASPxGridView>

             
            </td>
        </tr>
        </table>



                <dx:ASPxPivotGrid ID="pivotM" runat="server" OnDataBinding="pivotM_DataBinding"   Visible="false"  Width="95%" DataSourceID="sql__sms"
                     OnCustomCellDisplayText="pivotM_CustomCellDisplayText"  OnCustomCellStyle="pivotM_CustomCellStyle"
                     OnBeginRefresh="pivotM_OnBeginRefresh"   
                     EnableCallbackAnimation="true">
                    <Fields>
                        <dx:PivotGridField Area="RowArea" AreaIndex="0" FieldName="timepoint_text" ID="fldtimepoint_text" Caption="Timepoint" />
                        <dx:PivotGridField Area="RowArea" AreaIndex="1" FieldName="StudyMeasName" ID="fldStudyMeasName" Caption="Study Meas" />
                        <dx:PivotGridField Area="ColumnArea" AreaIndex="0" FieldName="ID" ID="fldID" Caption="ID"  />
                        <dx:PivotGridField Area="ColumnArea" AreaIndex="1" FieldName="GroupName" ID="fldGroupName" Caption="Group"  />
                        <dx:PivotGridField Area="ColumnArea" AreaIndex="2" FieldName="SubjStatus" ID="fldSubjStatus" Caption="Subj Status" />
                        <dx:PivotGridField Area="DataArea" AreaIndex="0" FieldName="sms_dd_status" ID="fldsms_dd_status" Caption="DE Status" SummaryType="Min"  />
                        <dx:PivotGridField Area="FilterArea" AreaIndex="0" FieldName="sms_dd_status" ID="fldsms_dd_status2" Caption="DE Status" SummaryType="Min"  />
                        
                    </Fields>
                    
                    <OptionsData DataProcessingEngine="Default"    />   <%--LockDataRefreshOnCustomCallback="true"--%>
                    <OptionsFilter NativeCheckBoxes="False" />
                    
                    <OptionsPager  ColumnsPerPage="15"  ShowNumericButtons="false" >
                        <PageSizeItemSettings Visible="true" ShowAllItem="true"></PageSizeItemSettings>
                    </OptionsPager>
                    <OptionsView HorizontalScrollBarMode="Auto" VerticalScrollBarMode="Auto" 
                        HorizontalScrollingMode="Standard" VerticalScrollingMode="Standard" 
                        ShowColumnTotals="false" ShowRowTotals="false" ShowRowGrandTotals="false" ShowColumnGrandTotals="false" />
                </dx:ASPxPivotGrid>



    <%--SQL Data Sources--%>
 

    <%--Main Data--%>
    <%-- Include all measures because all subjects get them assigned even if they are NA --%>
    <asp:SqlDataSource ID="sql__sms" runat="server" SelectCommandType="Text"  
        SelectCommand="Select * from trk.vwMasterStatus_M  where studyID = @studyID  "
        ConnectionString="<%$ ConnectionStrings:TRACKING_CONN_STRING %>" >
        <SelectParameters>
            <asp:SessionParameter SessionField="studyID" Name="studyID" DbType="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>



    <asp:SqlDataSource ID="sqlMeas" runat="server" SelectCommandType="Text"  
        SelectCommand="select * from vwMeasure where measureID in (Select measureID from tblStudyMeas where studyID = @studyID ) order by meascat, measname"
        ConnectionString="<%$ ConnectionStrings:TRACKING_CONN_STRING %>" >
        <SelectParameters>
            <asp:SessionParameter SessionField="studyID" Name="studyID" DbType="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>


    <%--PAGE SPECIFIC for TokenBoxes--%>

    <asp:SqlDataSource ID="sqlMS" runat="server" SelectCommandType="StoredProcedure"  
        SelectCommand="trk.spTracking_GetMeasStatus"
        ConnectionString="<%$ ConnectionStrings:TRACKING_CONN_STRING %>" >
    </asp:SqlDataSource>

    <asp:SqlDataSource ID="sqlDEstatus" runat="server" SelectCommandType="StoredProcedure"  
        SelectCommand="trk.spTracking_GetDEstatus"
        ConnectionString="<%$ ConnectionStrings:TRACKING_CONN_STRING %>" >
        <SelectParameters>
            <asp:SessionParameter SessionField="studyid" Name="studyID" DbType="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>

    <asp:SqlDataSource ID="sqlMSD" runat="server" SelectCommandType="StoredProcedure"  
        SelectCommand="trk.spTracking_GetMeasStatusDetail"
        ConnectionString="<%$ ConnectionStrings:TRACKING_CONN_STRING %>" >
        <SelectParameters>
            <asp:Parameter Name="measstatusID"  DbType="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>




    <%--COMMON fOR TokenBoxes--%>     
    <asp:SqlDataSource ID="sqlSS" runat="server" SelectCommandType="StoredProcedure"  
        SelectCommand="trk.spTracking_GetSubjStatus_byStudy"
        ConnectionString="<%$ ConnectionStrings:TRACKING_CONN_STRING %>" >
        <SelectParameters>
            <asp:SessionParameter SessionField="studyID" Name="studyID" DbType="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>


    <asp:SqlDataSource ID="sqlTP" runat="server" SelectCommandType="Text"  
        SelectCommand="select timepointID, timepoint_text from tblTimePoint where studyID=@studyID"
        ConnectionString="<%$ ConnectionStrings:TRACKING_CONN_STRING %>" >
        <SelectParameters>
            <asp:SessionParameter SessionField="studyid" Name="studyID" DbType="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>


    <asp:SqlDataSource ID="sqlGroup" runat="server" SelectCommandType="Text"  
        SelectCommand="select * from tblGroup where studyID = @studyID and groupID in (select groupID from trk.fnSEC_Allowed_TRACKING_Groups_by_User())  "
        ConnectionString="<%$ ConnectionStrings:TRACKING_CONN_STRING %>" >
        <SelectParameters>
            <asp:SessionParameter SessionField="studyID" Name="studyID" DbType="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>


    <asp:SqlDataSource ID="sqlStaff" runat="server" SelectCommandType="StoredProcedure"  
        SelectCommand="trk.Tracking_GetActiveStaff"
        ConnectionString="<%$ ConnectionStrings:TRACKING_CONN_STRING %>" >
        <SelectParameters>
            <asp:SessionParameter SessionField="studyID" Name="studyID" DbType="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>

    



</asp:Content>
