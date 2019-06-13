<%@ Page Language="c#"   Debug="true" MasterPageFile="~/UWAC.master" CodeFile="Actions.aspx.cs" AutoEventWireup="true"
 Inherits="Tracking_Actions" Title="Actions Info"      %>   <%--Theme="Skin1" EnableEventValidation="true"--%>

<%@ MasterType VirtualPath="~/UWAC.master" %>

<%@ Register Assembly="DevExpress.Web.v19.1, Version=19.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.ASPxPivotGrid.v19.1, Version=19.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxPivotGrid" TagPrefix="dx" %> 

<asp:Content ID="HeadContent" runat="server" ContentPlaceHolderID="headContent" Visible="true">

    <link href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css" rel="stylesheet" />
    <script src='https://code.jquery.com/ui/1.12.1/jquery-ui.min.js' type='text/javascript'></script>  

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
    //function OnMSChanged(cboMS, e) {
    //    var val = cboMS.GetSelectedItem().value.toString();

    //    if (cboAS.InCallback())
    //        //lastSS = cboSS.GetValue().toString();
    //        lastMS = val;
    //    else
    //        cboAS.PerformCallback(val);
    //}


    function OnASEndCallback(s, e) {
        if (lastMS) {
            cboAS.PerformCallback(lastMS);
            lastMS = null;
        }
    }



    function OnSelectedIndexChanged(s, e, visibleIndex) {
        var cboAS = eval('cboAS_' + visibleIndex);

        //var val = s.GetSelectedItem().value.toString();
        var val = s.GetValue();

        if (s.InCallback())
            //lastSS = cboSS.GetValue().toString();
            lastMS = val;
        else
            cboAS.PerformCallback(val);

    }

    function SomeSelected(s, e) {
        btnLoad.SetText("Load Selected Actions");
    }

    function ClearSelected() {

        gridLkupAction.SetValue(null);
        tokTimepoint.ClearTokenCollection();
        tokGroup.ClearTokenCollection();
        tokActionStatus.ClearTokenCollection();
        tokSubjStatus.ClearTokenCollection();
        btnLoad.SetText("Load Actions");
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
        <dx:ASPxComboBox ID="ddlEntity" runat="server" Font-Bold="true" Font-Size="16"  OnSelectedIndexChanged="ddlEntity_OnSelectedIndexChanged" AutoPostBack="true" >
        <Items>
            <dx:ListEditItem Value="Subjects" />
            <dx:ListEditItem Value="Actions" Selected="true"/>
            <dx:ListEditItem Value="Measures" />
            <%--<dx:ListEditItem Value="Consents" />--%>
        </Items>
    </dx:ASPxComboBox>
<%-- Select Controls --%>
        <table>
        <tr>
            <td style="width: 450px; vertical-align: top">
   <%-- <dx:ASPxLabel ID="GridLookupCaptionLabel" runat="server" Text="" AssociatedControlID="GridLookup" />--%>
    Select Actions:
    <dx:ASPxGridLookup ID="gridLkupAction" runat="server" DataSourceID="sqlAction" 
        KeyFieldName="studyactionID" SelectionMode="Multiple" MultiTextSeparator=", " Caption=""
                        TextFormatString="{0}" Width="400px" ClientInstanceName="gridLkupAction"
        IncrementalFilteringMode="None">
        <ClearButton DisplayMode="OnHover"></ClearButton>
        <ClientSideEvents ValueChanged="SomeSelected" />
        <Columns>
            <dx:GridViewCommandColumn ShowSelectCheckbox="True" />
            <dx:GridViewDataTextColumn FieldName="actiontext" Caption="Action" />
            <dx:GridViewDataTextColumn FieldName="actiontype" Caption="Type"/>
        </Columns>
        <GridViewProperties>
            <Templates>
                <StatusBar>
                    <table class="OptionsTable" style="float: right">
                        <tr>
                            <td>
                                <%--<dx:ASPxButton ID="Close" runat="server" AutoPostBack="false"
                                    Text="Close" ClientSideEvents-Click="CloseGridLookup" />--%>
                            </td>
                        </tr>
                    </table>
                </StatusBar>
            </Templates>
            <Settings ShowFilterRow="true" ShowFilterRowMenu="true" ShowFilterRowMenuLikeItem="true"  ShowStatusBar="Visible"  />
            <SettingsBehavior AllowDragDrop="False" EnableRowHotTrack="True" />
            <SettingsPager NumericButtonCount="3"  PageSize="40" Summary-Visible="true" />
        </GridViewProperties>
    </dx:ASPxGridLookup>
                                Select Action Status:
                <dx:ASPxTokenBox ID="tokActionStatus" runat="server" ItemValueType="System.String" DataSourceID="sqlAS" ClientInstanceName="tokActionStatus"
                     TextField="ActionStatus" ValueField="ActionStatusID"   >
                    <ClientSideEvents ValueChanged="SomeSelected" />
                </dx:ASPxTokenBox>


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
                <dx:ASPxButton ID="btnLoad" runat="server" Text="Load Actions" OnClick="btnLoad_OnClick" AutoPostBack="false" ClientInstanceName="btnLoad" >
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




<%-- Actions --%>
    <table>
        <tr>
            <td style="vertical-align:top">
                <dx:ASPxHint ID="ASPxHint1" runat="server" TargetSelector=".dx-ellipsis"></dx:ASPxHint>
                <dx:ASPxLabel ID="lblENT" runat="server" Text="Actions:"  Font-Size="10" Font-Bold="true"  ForeColor="Silver"></dx:ASPxLabel>
                <dx:ASPxLabel ID="gvENTstatus" runat="server" Text=""   Font-Size="10" Font-Bold="true"  ForeColor="Silver"></dx:ASPxLabel>
                <br />

                <dx:ASPxGridView ID="gvENT" runat="server"  Visible="false" AutoGenerateColumns="false"   KeyFieldName="ActionID" ClientInstanceName="gva"
                     OnRowUpdating="gvENT_OnRowUpdating" OnDataBinding="gvENT_DataBinding"  OnHtmlDataCellPrepared="gvENT_HtmlDataCellPrepared"   >  
                    <ClientSideEvents EndCallback="function(s, e) {ASPxClientHint.Update();}" />
                                        <SettingsExport EnableClientSideExportAPI="true" FileName="Actions"></SettingsExport>
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
                        <dx:GridViewDataColumn FieldName="timepoint_text" Caption="TimePoint" ReadOnly="true"  VisibleIndex="0" Width="80px"  ></dx:GridViewDataColumn>
                        <dx:GridViewDataColumn FieldName="ID" Caption="ID" ReadOnly="true" VisibleIndex="1" Width="100px"></dx:GridViewDataColumn>
                        <dx:GridViewDataColumn FieldName="GroupName" Caption="Group" ReadOnly="true" VisibleIndex="2"></dx:GridViewDataColumn>
                        <dx:GridViewDataColumn FieldName="ActionType" Caption="Type" ReadOnly="true" VisibleIndex="3"></dx:GridViewDataColumn>
                        <dx:GridViewDataColumn FieldName="ActionText" Caption="Action" ReadOnly="true" VisibleIndex="4"></dx:GridViewDataColumn>
                        <dx:GridViewDataColumn FieldName="ActionStatus" Caption="Status"  VisibleIndex="5"></dx:GridViewDataColumn>
                        <dx:GridViewDataDateColumn FieldName="DateDone"  VisibleIndex="6"></dx:GridViewDataDateColumn>
                        <dx:GridViewDataDateColumn FieldName="Notes"  VisibleIndex="7"></dx:GridViewDataDateColumn>
                        <dx:GridViewDataColumn FieldName="ActionID" Caption="ActionID" ReadOnly="true"  Visible="false"></dx:GridViewDataColumn>
                        <dx:GridViewCommandColumn ShowEditButton="true" VisibleIndex="8" ></dx:GridViewCommandColumn>
<%--                        <dx:GridViewCommandColumn ShowSelectCheckbox="True" Caption="Select Measures" VisibleIndex="9"></dx:GridViewCommandColumn>--%>
                        <dx:GridViewDataColumn FieldName="ActionTypeID" ReadOnly="true" Visible="false"></dx:GridViewDataColumn>   
                        <dx:GridViewDataColumn FieldName="ActionStatusID" ReadOnly="true" Visible="false"></dx:GridViewDataColumn>   
                    </Columns>
<%--                    <ClientSideEvents SelectionChanged="gvA_SelectionChanged"  />--%>
                    <Settings ShowGroupPanel="true" ShowGroupedColumns="True" />   
                    <SettingsBehavior AllowGroup="true" AutoExpandAllGroups="true" EnableCustomizationWindow="true" AllowSelectByRowClick="true"  AllowEllipsisInText="True" />
                    <SettingsDataSecurity AllowEdit="true" />
                    <SettingsEditing Mode="PopupEditForm"  />
                    <SettingsLoadingPanel Mode="ShowOnStatusBar"  />
                    <SettingsPager PageSize="50" Summary-Visible="true" AlwaysShowPager="true" >
                        <PageSizeItemSettings Visible="true" Items="20,50,100,500" ShowAllItem="true" />
                    </SettingsPager>
                    <SettingsPopup >
                        <EditForm Width="600" Modal="true" CloseOnEscape="true" />
                    </SettingsPopup>
     
                    <EditFormLayoutProperties ColCount="3"  >
                        
                        <Items>
<%--                            <dx:GridViewColumnLayoutItem Caption="Action Status:" RowSpan="1" VerticalAlign="Top">
                                <Template>
                                    <dx:ASPxComboBox ID="CboAS" runat="server" ValueType="System.Int32" OnInit="CboAS_Init" DropDownStyle="DropDown" ></dx:ASPxComboBox>
                                </Template>
                            </dx:GridViewColumnLayoutItem>--%>
                            <dx:GridViewColumnLayoutItem Caption="Action Status:" RowSpan="1" VerticalAlign="Top">
                                <Template>
                                    <dx:ASPxComboBox ID="CboAS" runat="server" ValueType="System.Int32" OnInit="CboAS_Init"  DropDownStyle="DropDown" >
                                        <ClientSideEvents EndCallback="OnASEndCallback"/>
                                    </dx:ASPxComboBox>
                                    <asp:SqlDataSource ID="sqlAS_by_AT" runat="server" SelectCommandType="StoredProcedure"  
                                        SelectCommand="trk.spGetActionStatus_by_ActionType"
                                        ConnectionString="<%$ ConnectionStrings:TRACKING_CONN_STRING %>" >
                                        <SelectParameters>
                                            <asp:Parameter  Name="actiontypeID"  DbType="Int32" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                </Template>
                            </dx:GridViewColumnLayoutItem>
                            <dx:GridViewColumnLayoutItem Caption="Date Done" RowSpan="2"   VerticalAlign="Top">
                                <Template>
                                    <dx:ASPxCalendar ID="DateCalendar" runat="server" Value='<%# Bind("DateDone") %>' />
                                </Template>
                            </dx:GridViewColumnLayoutItem> 
                            <dx:GridViewColumnLayoutItem Caption="Action Notes:" ColSpan="2" VerticalAlign="Top">
                                <Template>
                                    <dx:ASPxMemo runat="server" ID="notesEditor" Text='<%# Eval("Notes")%>' Width="100%" Height="70px"/>                            
                                </Template>
                            </dx:GridViewColumnLayoutItem>
                            <dx:GridViewColumnLayoutItem  Caption="" RowSpan="1" ColSpan="3" HorizontalAlign="Right" VerticalAlign="Top">
                                <Template>
                                    <dx:ASPxCheckBox ID="chkUpdateAllSelected" runat="server" Text="Update all selected actions?" Checked="false" TextAlign="Right"></dx:ASPxCheckBox>   
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


                    <dx:ASPxPivotGrid ID="pivotENT" runat="server" OnDataBinding="pivotENT_DataBinding"   Visible="false"  Width="95%" 
                     OnCustomCellDisplayText="pivotENT_CustomCellDisplayText"  OnCustomCellStyle="pivotENT_CustomCellStyle"
                     OnBeginRefresh="pivotENT_OnBeginRefresh"   
                     EnableCallbackAnimation="true">
                    <Fields>
                        <dx:PivotGridField Area="RowArea" AreaIndex="0" FieldName="timepoint_text" ID="fldtimepoint_text" Caption="Timepoint" />
                        <dx:PivotGridField Area="RowArea" AreaIndex="1" FieldName="ActionText" ID="fldActionText" Caption="Action" />
                        <dx:PivotGridField Area="ColumnArea" AreaIndex="0" FieldName="ID" ID="fldID" Caption="ID"  />
                        <dx:PivotGridField Area="ColumnArea" AreaIndex="1" FieldName="GroupName" ID="fldGroupName" Caption="Group"  />
                        <dx:PivotGridField Area="ColumnArea" AreaIndex="2" FieldName="SubjStatus" ID="fldSubjStatus" Caption="Subj Status" />
                        <dx:PivotGridField Area="DataArea" AreaIndex="0" FieldName="ActionStatus" ID="fldActionStatus" Caption="Action Status" SummaryType="Min"  />
                        
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



        <%--Main Data--%>


    <asp:SqlDataSource ID="sqlAction" runat="server" SelectCommandType="StoredProcedure"  
        SelectCommand="trk.spTracking_GetStudyAction"
        ConnectionString="<%$ ConnectionStrings:TRACKING_CONN_STRING %>" >
        <SelectParameters>
            <asp:SessionParameter SessionField="studyID" Name="studyID" DbType="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>


    <%--PAGE SPECIFIC for TokenBoxes--%>

    <asp:SqlDataSource ID="sqlAS" runat="server" SelectCommandType="Text"  
        SelectCommand="select * from tblActionStatus_lkup where actionstatusID in (select actionstatusID from trk.vwMasterStatus_A where studyID=@studyID)"
        ConnectionString="<%$ ConnectionStrings:TRACKING_CONN_STRING %>" >
        <SelectParameters>
            <asp:SessionParameter SessionField="studyID" Name="studyID" DbType="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>


    <asp:SqlDataSource ID="sqlActionType" runat="server" SelectCommandType="Text"  
        SelectCommand="select * from tblActionType_lkup"
        ConnectionString="<%$ ConnectionStrings:TRACKING_CONN_STRING %>" >
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



</asp:Content>
