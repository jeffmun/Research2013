<%@ Page Language="c#"   Debug="true" MasterPageFile="~/UWAC.master" CodeFile="Subjects.aspx.cs" AutoEventWireup="true"
 Inherits="Tracking_Subjects" Title="Subjects Info"      %>   <%--Theme="Skin1" EnableEventValidation="true"--%>

<%@ MasterType VirtualPath="~/UWAC.master" %>

<%@ Register Assembly="DevExpress.Web.v18.2, Version=18.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.ASPxPivotGrid.v18.2, Version=18.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxPivotGrid" TagPrefix="dx" %> 

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

    
<%--Edit Subject Status--%>
<script type="text/javascript">
    var lastSS = null;
    function OnSSChanged(cboSS, e) {
        var val = cboSS.GetSelectedItem().value.toString();

        if (cboSS.InCallback())
            //lastSS = cboSS.GetValue().toString();
            lastSS = val;
        else
            cboSS.PerformCallback(val);
    }


    function OnSSDEndCallback(s, e) {
        if (lastSS) {
            cboSS.PerformCallback(lastSS);
            lastSS = null;
        }
    }



    function OnSelectedIndexChanged(s, e, visibleIndex) {
        var cboSSD = eval('cboSSD_' + visibleIndex);

        //var val = s.GetSelectedItem().value.toString();
        var val = s.GetValue();

        if (s.InCallback())
            //lastSS = cboSS.GetValue().toString();
            lastSS = val;
        else
            cboSSD.PerformCallback(val);

    }

    function SomeSelected(s, e) {
        btnLoad.SetText("Load Selected Subjects");
    }

    function ClearSelected() {

        tokGroup.ClearTokenCollection();
        tokSubjStatus.ClearTokenCollection();
        btnLoad.SetText("Load Subjects");
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
<%--                    <asp:Label ID="lblCB" runat="server" Text="Color brightness" ForeColor="Silver" Font-Size="XX-Small" Visible="true"></asp:Label>
                    <div id="slider" style="width: 100px" class="right">
                        <div id="custom-handle" class="ui-slider-handle"></div>
                    </div>--%>

                </td>
            </tr>
            <tr>
                <td style="text-align: right; padding-right: 20px;">
                    <br />
                    <br />
                    <dx:ASPxButton ID="ASPxButton1" runat="server" Text="Help" OnClick="btnHelp_Click" Width="70px"></dx:ASPxButton>
                </td>
            </tr>
        </table>
    </div>


<br />

   
<%-- Select Controls --%>
        <table>
        <tr>

            <td style="vertical-align: top">

                 <dx:ASPxLabel ID="lblTest" runat="server" Text="" ForeColor="Magenta" />
                    <dx:ASPxComboBox ID="ddlEntity" runat="server" Font-Bold="true" Font-Size="16"  OnSelectedIndexChanged="ddlEntity_OnSelectedIndexChanged" AutoPostBack="true" >
                    <Items>
                        <dx:ListEditItem Value="Subjects" Selected="true" />
                        <dx:ListEditItem Value="Actions" />
                        <dx:ListEditItem Value="Measures" />
                        <%--<dx:ListEditItem Value="Consents" />--%>
                    </Items>
                </dx:ASPxComboBox>

<%--                Select Timepoints:
                <dx:ASPxTokenBox ID="tokTimepoint" runat="server" ItemValueType="System.String" DataSourceID="sqlTP" ClientInstanceName="tokTimepoint"
                     TextField="timepoint_text" ValueField="timepointID"   >
                    <ClientSideEvents ValueChanged="SomeSelected" />
                </dx:ASPxTokenBox>--%>
<%--                Select Groups:
                <dx:ASPxTokenBox ID="tokGroup" runat="server" ItemValueType="System.String" DataSourceID="sqlGroup" ClientInstanceName="tokGroup"
                     TextField="groupname" ValueField="groupID"   >
                    <ClientSideEvents ValueChanged="SomeSelected" />
                </dx:ASPxTokenBox>
                Select Subject Status:
                <dx:ASPxTokenBox ID="tokSubjStatus" runat="server" ItemValueType="System.String" DataSourceID="sqlSS" ClientInstanceName="tokSubjStatus"
                     TextField="SubjStatus" ValueField="subjstatusID"   >
                    <ClientSideEvents ValueChanged="SomeSelected" />
                </dx:ASPxTokenBox>--%>


            </td>
            <td style="vertical-align: top; width: 50px;"></td>
            <td style="vertical-align: top">
                <dx:ASPxButton ID="btnLoad" runat="server" Text="Load Subjects" OnClick="btnLoad_OnClick" AutoPostBack="false" ClientInstanceName="btnLoad" >
                     <%--<ClientSideEvents Click="foo" />--%>
                </dx:ASPxButton>
                <dx:ASPxButton ID="btnClear" runat="server" Text="Clear" Width="30px" Font-Size="X-Small" ForeColor="Silver" BackColor="WhiteSmoke" AutoPostBack="false" >
                    <ClientSideEvents Click="ClearSelected"    />
                </dx:ASPxButton>
                <br />
                <dx:ASPxRadioButtonList ID="rblObj" runat="server" Font-Size="9" Border-BorderStyle="None" RepeatColumns="2" >
                    <Items>
                        <dx:ListEditItem Text="Edit in Table" Value="Table" Selected="true" />
<%--                        <dx:ListEditItem Text="Display Details in Grid" Value="Grid Details" Selected="true" />--%>
                        <dx:ListEditItem Text="Counts (Subj status & Group)" Value="Grid Counts" Selected="false" />
                        <dx:ListEditItem Text="Counts (Race)" Value="Grid Enroll Race" Selected="false" />
                        <dx:ListEditItem Text="Counts (Ethnicity)" Value="Grid Enroll Ethn" Selected="false" />
                        <dx:ListEditItem Text="Counts (Race & Ethnicity)" Value="Grid Enroll RaceEthn" Selected="false" />
                    </Items>
                </dx:ASPxRadioButtonList>

            </td>
        </tr>
    </table>
    
<br />




<%-- Subjects --%>
    <table>
        <tr>
            <td style="vertical-align:top">
                <dx:ASPxHint ID="ASPxHint1" runat="server" TargetSelector=".dx-ellipsis"></dx:ASPxHint>
                <dx:ASPxLabel ID="lblENT" runat="server" Text="Subjects:"  Font-Size="10" Font-Bold="true"  ForeColor="Silver"></dx:ASPxLabel>
                <dx:ASPxLabel ID="gvENTstatus" runat="server" Text=""   Font-Size="10" Font-Bold="true"  ForeColor="Silver"></dx:ASPxLabel>
                <br />

                <dx:ASPxGridView ID="gvENT" runat="server"  Visible="false" AutoGenerateColumns="false"   KeyFieldName="SubjID" ClientInstanceName="gva"
                    Settings-ShowHeaderFilterButton="true"  
                    OnRowUpdating="gvENT_OnRowUpdating" OnDataBinding="gvENT_DataBinding"  OnHtmlDataCellPrepared="gvENT_HtmlDataCellPrepared"   >  
                    <ClientSideEvents EndCallback="function(s, e) {ASPxClientHint.Update();}" />

                    <SettingsExport EnableClientSideExportAPI="true" FileName="Subjects"></SettingsExport>
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
<%--                        <dx:GridViewCommandColumn ShowEditButton="true" Caption="Edit" VisibleIndex="0" Width="60px" ></dx:GridViewCommandColumn>--%>
                        <dx:GridViewDataColumn FieldName="ID" Caption="ID" ReadOnly="true" VisibleIndex="2" Width="100px"></dx:GridViewDataColumn>
                        <dx:GridViewDataHyperLinkColumn FieldName="ID" Caption="Links" VisibleIndex="1">
                             <DataItemTemplate>
                                   <dx:ASPxHyperLink ID="ASPxHyperLink2" runat="server" Text="Details" NavigateUrl='<%#string.Format("subject.aspx?ID={0}",Eval("ID")) %>'>
                                   </dx:ASPxHyperLink>&nbsp;&nbsp;
                                   <dx:ASPxHyperLink ID="ASPxHyperLink1" runat="server" Text="Household" NavigateUrl='<%#string.Format("~/Tracking/Household2.aspx?hhID={0}",Eval("householdID")) %>'>
                                   </dx:ASPxHyperLink>
                             </DataItemTemplate>
                        </dx:GridViewDataHyperLinkColumn>
                        <dx:GridViewDataColumn FieldName="GroupName" Caption="Group" ReadOnly="true" VisibleIndex="2"></dx:GridViewDataColumn>
                        
                        <dx:GridViewDataColumn FieldName="SubjStatusID" Caption="Status" VisibleIndex="3">
                            <DataItemTemplate>
                                <dx:ASPxLabel ID="lblMeasStatus" runat="server" Text='<%# Eval("SubjStatus") %>' ></dx:ASPxLabel>
                            </DataItemTemplate>
                        </dx:GridViewDataColumn>
                        <dx:GridViewDataColumn FieldName="SubjStatusDetailID" Caption="Status Detail" VisibleIndex="4">
                            <DataItemTemplate>
                                <dx:ASPxLabel ID="lblMeasStatusDetail" runat="server" Text='<%# Eval("SubjStatusDetail") %>' ></dx:ASPxLabel>
                            </DataItemTemplate>
                            <EditFormSettings VisibleIndex="0" />
                        </dx:GridViewDataColumn>
                        
                        <dx:GridViewDataColumn FieldName="Sex" Caption="Sex" ReadOnly="true" Width="50px" VisibleIndex="5"></dx:GridViewDataColumn>
                        <dx:GridViewDataColumn FieldName="DOB" Caption="DOB" ReadOnly="true" Width="80px" VisibleIndex="6"></dx:GridViewDataColumn>
                        <dx:GridViewDataColumn FieldName="CurrAgeYM" Caption="Curr Age" ReadOnly="true" Width="80px" VisibleIndex="7"></dx:GridViewDataColumn>
                        <dx:GridViewDataColumn FieldName="EthnicityDesc" Caption="Race" ReadOnly="true"  Width="100px" VisibleIndex="8"></dx:GridViewDataColumn>
                        <dx:GridViewDataColumn FieldName="HispanicDesc" Caption="Ethnicity" ReadOnly="true"  Width="100px" VisibleIndex="9"></dx:GridViewDataColumn>
                        <dx:GridViewDataDateColumn FieldName="Notes"  VisibleIndex="10"></dx:GridViewDataDateColumn>
                        <dx:GridViewDataColumn FieldName="SubjID" ReadOnly="true" Visible="false"></dx:GridViewDataColumn>   
                        <dx:GridViewDataColumn FieldName="address1" Caption="Address" ReadOnly="true" Width="80px" VisibleIndex="11" Visible="false"></dx:GridViewDataColumn>
                        <dx:GridViewDataColumn FieldName="address2" Caption="Address2" ReadOnly="true" Width="80px" VisibleIndex="12" Visible="false"></dx:GridViewDataColumn>
                        <dx:GridViewDataColumn FieldName="city" Caption="City" ReadOnly="true" Width="80px" VisibleIndex="13" Visible="false"></dx:GridViewDataColumn>
                        <dx:GridViewDataColumn FieldName="state" Caption="State" ReadOnly="true" Width="80px" VisibleIndex="14" Visible="false"></dx:GridViewDataColumn>
                        <dx:GridViewDataColumn FieldName="zip" Caption="Zip" ReadOnly="true" Width="80px" VisibleIndex="15" Visible="false"></dx:GridViewDataColumn>
                        <dx:GridViewDataColumn FieldName="country" Caption="Country" ReadOnly="true" Width="80px" VisibleIndex="16" Visible="false"></dx:GridViewDataColumn>
                        <dx:GridViewDataColumn FieldName="address_notes" Caption="Address Notes" ReadOnly="true" Width="80px" VisibleIndex="17" Visible="false"></dx:GridViewDataColumn>
                        <dx:GridViewDataColumn FieldName="firstname" Caption="First Name" ReadOnly="true" Width="80px" VisibleIndex="18" Visible="false"></dx:GridViewDataColumn>
                        <dx:GridViewDataColumn FieldName="lastname" Caption="Last Name" ReadOnly="true" Width="80px" VisibleIndex="19" Visible="false"></dx:GridViewDataColumn>
                        
                    </Columns>
<%--                    <ClientSideEvents SelectionChanged="gvA_SelectionChanged"  />--%>
                    <Settings ShowGroupPanel="true" ShowGroupedColumns="True" />   
                    <SettingsBehavior AllowGroup="true" AutoExpandAllGroups="true" EnableCustomizationWindow="true" AllowSelectByRowClick="true"  AllowEllipsisInText="True" />
                    <SettingsDataSecurity AllowEdit="true" />
                    <SettingsEditing Mode="PopupEditForm"  />
                    <SettingsLoadingPanel Mode="ShowOnStatusBar"  />
                    <SettingsPager PageSize="100" Summary-Visible="true" AlwaysShowPager="true" >
                        <PageSizeItemSettings Visible="true" Items="20,50,100,500" ShowAllItem="true" />
                    </SettingsPager>
                    <SettingsPopup >
                        <EditForm Width="600" Modal="true" CloseOnEscape="true" />
                    </SettingsPopup>
     
                    <EditFormLayoutProperties ColCount="3"  >
                        
                        <Items>
                            <dx:GridViewColumnLayoutItem Caption="Subject Status:" RowSpan="1" VerticalAlign="Top">
                                <Template>
                                    <dx:ASPxComboBox ID="CboSS" runat="server" ValueType="System.Int32" OnInit="CboSS_Init" DropDownStyle="DropDown" ></dx:ASPxComboBox>
                                </Template>
                            </dx:GridViewColumnLayoutItem>
                            <dx:GridViewColumnLayoutItem Caption="Subject Status Detail:" RowSpan="1" VerticalAlign="Top">
                                <Template>
                                    <dx:ASPxComboBox ID="CboSSD" runat="server" ValueType="System.Int32" OnInit="CboSSD_Init"  DropDownStyle="DropDown" >
                                        <ClientSideEvents EndCallback="OnSSDEndCallback"/>
                                    </dx:ASPxComboBox>

                                        <asp:SqlDataSource ID="sqlSSD_by_SS" runat="server" SelectCommandType="StoredProcedure"  
                                            SelectCommand="trk.spTracking_GetSubjStatusDetail_byStudy"
                                            ConnectionString="<%$ ConnectionStrings:TRACKING_CONN_STRING %>" >
                                            <SelectParameters>
                                                <asp:SessionParameter SessionField="studyID" Name="studyID" DbType="Int32" />
                                                <asp:Parameter Name="subjstatusID"  DbType="Int32" />
                                            </SelectParameters>
                                        </asp:SqlDataSource>


                                </Template>
                            </dx:GridViewColumnLayoutItem>
                           <%-- <dx:GridViewColumnLayoutItem Caption="Date Done" RowSpan="2"   VerticalAlign="Top">
                                <Template>
                                    <dx:ASPxCalendar ID="DateCalendar" runat="server" Value='<%# Bind("DateDone") %>' />
                                </Template>
                            </dx:GridViewColumnLayoutItem> --%>
                            <dx:GridViewColumnLayoutItem Caption="Subject Notes:" ColSpan="2" VerticalAlign="Top">
                                <Template>
                                    <dx:ASPxMemo runat="server" ID="notesEditor" Text='<%# Eval("Notes")%>' Width="100%" Height="70px"/>                            
                                </Template>
                            </dx:GridViewColumnLayoutItem>
                            <dx:GridViewColumnLayoutItem  Caption="" RowSpan="1" ColSpan="3" HorizontalAlign="Right" VerticalAlign="Top">
                                <Template>
                                    <dx:ASPxCheckBox ID="chkUpdateAllSelected" runat="server" Text="Update all selected subjects?" Checked="false" TextAlign="Right"></dx:ASPxCheckBox>   
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
                        <dx:PivotGridField  FieldName="GroupName" ID="fldGroupName" Caption="Group"  />
                        <dx:PivotGridField  FieldName="SubjStatus" ID="fldSubjStatus" Caption="Subj Status" />
                        <dx:PivotGridField Area="DataArea" AreaIndex="0" FieldName="ID" ID="fldID" Caption="ID" SummaryType="Min"  />

                        <dx:PivotGridField  FieldName="Sex" ID="fldSex" Caption="Sex" />                        
                        <dx:PivotGridField  FieldName="EthnicityDesc" ID="fldEthnicityDesc" Caption="Race" />                        
                        <dx:PivotGridField  FieldName="HispanicDesc" ID="fldHispanicDesc" Caption="Ethnicity" />
                        <%--<dx:PivotGridField  FieldName="txgrp" ID="ftxgrp" Caption="TxGrp" />  --%>                      
                        
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


    <%--PAGE SPECIFIC for TokenBoxes--%>




    <%--COMMON fOR TokenBoxes--%>     
    <asp:SqlDataSource ID="sqlSS" runat="server" SelectCommandType="StoredProcedure"  
        SelectCommand="trk.spTracking_GetSubjStatus_byStudy"
        ConnectionString="<%$ ConnectionStrings:TRACKING_CONN_STRING %>" >
        <SelectParameters>
            <asp:SessionParameter SessionField="studyID" Name="studyID" DbType="Int32" />
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
