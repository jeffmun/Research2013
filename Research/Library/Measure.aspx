<%@ Page Language="c#"   Debug="true" MasterPageFile="~/UWAC.master" CodeFile="Measure.aspx.cs" AutoEventWireup="true"
 Inherits="Library_Measure" Title="Measure Info"      %>  

<%@ MasterType VirtualPath="~/UWAC.master" %>

<%@ Register Assembly="DevExpress.Web.v18.1, Version=18.1.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<asp:Content ID="HeadContent" runat="server" ContentPlaceHolderID="headContent" Visible="true">
 
<script type="text/javascript">
    var isDirty = false;
var state = { };
function onControlsInitialized() {
    ASPxClientEdit.AttachEditorModificationListener(onEditorsChanged, function(control) {
            return control.GetParentControl() === FormLayout // Gets standalone editors nested inside the form layout control
        });
    ASPxClientUtils.AttachEventToElement(window, "beforeunload", onBeforeUnload);
    state = ASPxClientUtils.GetEditorValuesInContainer(FormLayout.GetMainElement());
}
function onEditorsChanged(s, e) {
    SaveButton.SetEnabled(true);
    CancelButton.SetEnabled(true);
    isDirty = true;
}

function restoreEditorsState() {
    for(var controlName in state) {
        var trackedControl = ASPxClientControl.GetControlCollection().Get(controlName);
        var setValueMethod = trackedControl.SetTokenCollection || trackedControl.SelectValues || trackedControl.SetValue;
        if(setValueMethod === trackedControl.SelectValues)
            trackedControl.UnselectAll();
        setValueMethod.call(trackedControl, state[controlName]);
    }
}
function cancelChanges(s, e) {
    restoreEditorsState();
    isDirty = false;
    SaveButton.SetEnabled(false);
    CancelButton.SetEnabled(false);
}
function onBeforeUnload(e) {
    if(!isDirty)
        return;
    var confirmMessage = "Are you sure you want to close the form? Any unsaved data will be lost.";
    e.returnValue = confirmMessage;
    return confirmMessage;
}
function onSubmitForm() {
    isDirty = false;
}
</script>

</asp:Content>



<asp:Content ID="Content1"  ContentPlaceHolderID="oBodyPlaceHolder" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server" EnablePageMethods="true"  EnablePartialRendering="true"></asp:ScriptManager>
    <dx:ASPxGlobalEvents ID="ASPxGlobalEvents1" runat="server" ClientSideEvents-ControlsInitialized="onControlsInitialized"></dx:ASPxGlobalEvents>
        <dx:ASPxLabel ID="ASPxLabel2" runat="server" Font-Size="Medium" Text="Measure Information" Font-Bold="true"></dx:ASPxLabel>

    <br />
        <div class="buttonContainer">
            <table>
                <tr>
                    <td style="width: 700px;"></td>
                    <td style="width: 150px;">
                        <div class="buttonContent">
                            <dx:ASPxButton ID="SaveButton" ClientInstanceName="SaveButton" runat="server"
                                Text="Save Changes" Width="80px" CssClass="buttonWidth" ClientEnabled="false">
                                <ClientSideEvents Click="onSubmitForm" />
                            </dx:ASPxButton>
                        </div>

                    </td>
                    <td>
                        <div class="buttonContent leftPadding topPadding">
                            <dx:ASPxButton ID="CancelButton" ClientInstanceName="CancelButton" runat="server"
                                Text="Cancel Changes" Width="80px" CssClass="buttonWidth" AutoPostBack="false" ClientEnabled="false">
                                <ClientSideEvents Click="cancelChanges" />
                            </dx:ASPxButton>
                        </div>
                    </td>
                </tr>
            </table>
    </div>

    <dx:ASPxFormLayout ID="FormLayout" ClientInstanceName="FormLayout" runat="server"  AlignItemCaptionsInAllGroups="True" UseDefaultPaddings="false">
        <SettingsAdaptivity AdaptivityMode="SingleColumnWindowLimit" SwitchToSingleColumnAtWindowInnerWidth="600" />
            <Items>
                
                <dx:LayoutItem Caption="Measure" FieldName="measname">
                    <LayoutItemNestedControlCollection>
                        <dx:LayoutItemNestedControlContainer runat="server" SupportsDisabledAttribute="True">
                            <dx:ASPxTextBox ID="measNameTextBox" runat="server" Width="50%" Font-Size="Medium" Font-Bold="true" />
                        </dx:LayoutItemNestedControlContainer>
                    </LayoutItemNestedControlCollection>
                </dx:LayoutItem>
                <dx:LayoutItem Caption="Measure Full Name" FieldName="measfullname">
                    <LayoutItemNestedControlCollection>
                        <dx:LayoutItemNestedControlContainer runat="server" SupportsDisabledAttribute="True">
                            <dx:ASPxTextBox ID="measFullNameTextBox" runat="server" Width="80%" Font-Size="Medium" />
                        </dx:LayoutItemNestedControlContainer>
                    </LayoutItemNestedControlCollection>
                </dx:LayoutItem>
                
                <dx:LayoutGroup Caption="Measure Information" ColCount="2">
                    <Items>
                        <dx:LayoutGroup Caption="Details" ColCount="1" Width="60%">
                            <Items>

                                <dx:LayoutItem Caption="Description" FieldName="DescriptionText" >
                                    <LayoutItemNestedControlCollection>
                                        <dx:LayoutItemNestedControlContainer runat="server" SupportsDisabledAttribute="True">
                                            <dx:ASPxMemo ID="ASPxMemo1" runat="server" Height="80px" Width="100%" Rows="10" />
                                        </dx:LayoutItemNestedControlContainer>
                                    </LayoutItemNestedControlCollection>
                                </dx:LayoutItem>
                                <dx:LayoutItem Caption="Citation" FieldName="CitationText"  >
                                    <LayoutItemNestedControlCollection>
                                        <dx:LayoutItemNestedControlContainer runat="server" SupportsDisabledAttribute="True">
                                            <dx:ASPxMemo ID="ASPxMemo2" runat="server" Height="50px" Width="100%" Rows="5" />
                                        </dx:LayoutItemNestedControlContainer>
                                    </LayoutItemNestedControlCollection>
                                </dx:LayoutItem>

                                <dx:LayoutItem Caption="Copyright Info" Width="100%" FieldName="CopyrightInfo">
                                    <LayoutItemNestedControlCollection>
                                        <dx:LayoutItemNestedControlContainer runat="server" SupportsDisabledAttribute="True">
                                            <dx:ASPxMemo ID="notesMemo" runat="server" Height="25px" Width="100%" Rows="3" />
                                        </dx:LayoutItemNestedControlContainer>
                                    </LayoutItemNestedControlCollection>
                                </dx:LayoutItem>
                                <dx:LayoutItem Caption="Ordering Info" Width="100%" FieldName="orderinginfo">
                                    <LayoutItemNestedControlCollection>
                                        <dx:LayoutItemNestedControlContainer runat="server" SupportsDisabledAttribute="True">
                                            <dx:ASPxMemo ID="ASPxMemo3" runat="server" Height="25px" Width="100%" Rows="3" />
                                        </dx:LayoutItemNestedControlContainer>
                                    </LayoutItemNestedControlCollection>
                                </dx:LayoutItem>

                            </Items>
                        </dx:LayoutGroup>
                        <dx:LayoutGroup Caption="Data Information" ColCount="1" Width="38%">
                            <Items>

                            <dx:LayoutGroup Caption="Describe the measure" ColCount="1" >
                                <Items>
                                    <dx:LayoutItem Caption="Category" FieldName="MeasCatID">
                                        <LayoutItemNestedControlCollection>
                                            <dx:LayoutItemNestedControlContainer runat="server" SupportsDisabledAttribute="True">
                                                <dx:ASPxComboBox ID="cboMeasCat" runat="server" DataSourceID="sqlMeasCat" TextField="meascat" ValueField="meascatID"
                                                    ValueType="System.Int32" AutoPostBack="false" ></dx:ASPxComboBox>
                                            </dx:LayoutItemNestedControlContainer>
                                        </LayoutItemNestedControlCollection>
                                    </dx:LayoutItem>

                                    <dx:LayoutItem Caption="Focus" FieldName="FocusPerson">
                                        <LayoutItemNestedControlCollection>
                                            <dx:LayoutItemNestedControlContainer runat="server" SupportsDisabledAttribute="True">
                                                <dx:ASPxComboBox ID="cboMeasFocus" runat="server" DataSourceID="sqlMeasFocus" TextField="measfocus" ValueField="measfocusID"
                                                    ValueType="System.Int32" AutoPostBack="false"  ></dx:ASPxComboBox>
                                            </dx:LayoutItemNestedControlContainer>
                                        </LayoutItemNestedControlCollection>
                                    </dx:LayoutItem>

                                     <dx:LayoutItem Caption="Method" FieldName="Method">
                                        <LayoutItemNestedControlCollection>
                                            <dx:LayoutItemNestedControlContainer runat="server" SupportsDisabledAttribute="True">
                                                <dx:ASPxComboBox ID="cboMeasMeth" runat="server" DataSourceID="sqlMeasMethod" TextField="measmethod" ValueField="measmethodID"
                                                    ValueType="System.Int32" AutoPostBack="false" ></dx:ASPxComboBox>
                                            </dx:LayoutItemNestedControlContainer>
                                        </LayoutItemNestedControlCollection>
                                    </dx:LayoutItem>

                                    <dx:LayoutItem Caption="Respondent" FieldName="Respondant">
                                        <LayoutItemNestedControlCollection>
                                            <dx:LayoutItemNestedControlContainer runat="server" SupportsDisabledAttribute="True">
                                                <dx:ASPxComboBox ID="cboMeasResp" runat="server" DataSourceID="sqlMeasResp" TextField="measresp" ValueField="measrespID"
                                                    ValueType="System.Int32" AutoPostBack="false" ></dx:ASPxComboBox>
                                            </dx:LayoutItemNestedControlContainer>
                                        </LayoutItemNestedControlCollection>
                                    </dx:LayoutItem>

                                    <dx:LayoutItem Caption="Source" FieldName="MeasSourceID">
                                        <LayoutItemNestedControlCollection>
                                            <dx:LayoutItemNestedControlContainer runat="server" SupportsDisabledAttribute="True">
                                                <dx:ASPxComboBox ID="ASPxComboBox4" runat="server" DataSourceID="sqlMeasSource" TextField="meassource" ValueField="meassourceID"
                                                    ValueType="System.Int32" AutoPostBack="false" ></dx:ASPxComboBox>
                                            </dx:LayoutItemNestedControlContainer>
                                        </LayoutItemNestedControlCollection>
                                    </dx:LayoutItem>

                                </Items>
                            </dx:LayoutGroup>
                            <dx:EmptyLayoutItem />
                            <dx:LayoutGroup Caption="Database Information" ColCount="1" >
                                <Items>
                                     <dx:LayoutItem Caption="DB table pk" FieldName="tblpk">
                                        <LayoutItemNestedControlCollection>
                                            <dx:LayoutItemNestedControlContainer runat="server" SupportsDisabledAttribute="True">
                                                <dx:ASPxLabel ID="ASPxTextBox2" runat="server"  Font-Bold="true" ReadOnly="true" />
                                            </dx:LayoutItemNestedControlContainer>
                                        </LayoutItemNestedControlCollection>
                                    </dx:LayoutItem>
                                     <dx:LayoutItem Caption="DB table" FieldName="tblname">
                                        <LayoutItemNestedControlCollection>
                                            <dx:LayoutItemNestedControlContainer runat="server" SupportsDisabledAttribute="True">
                                                <dx:ASPxLabel ID="ASPxTextBox1" runat="server"  Font-Bold="true" />
                                            </dx:LayoutItemNestedControlContainer>
                                        </LayoutItemNestedControlCollection>
                                    </dx:LayoutItem>
                                     <dx:LayoutItem Caption="Scoring proc" FieldName="spname">
                                        <LayoutItemNestedControlCollection>
                                            <dx:LayoutItemNestedControlContainer runat="server" SupportsDisabledAttribute="True">
                                                <dx:ASPxLabel ID="ASPxLabel1" runat="server"  Font-Bold="false" />
                                            </dx:LayoutItemNestedControlContainer>
                                        </LayoutItemNestedControlCollection>
                                    </dx:LayoutItem>
                                </Items>
                            </dx:LayoutGroup>
                            </Items>
                        </dx:LayoutGroup>

                    </Items>
                </dx:LayoutGroup>
                

<%--                <dx:LayoutGroup Caption="X" ColCount="3">
                    <Items>


                    </Items>
                </dx:LayoutGroup>--%>

            </Items>
        </dx:ASPxFormLayout>


    <br />
    <br />
    <dx:ASPxLabel ID="lblDocs" runat="server" Font-Size="Small" Text="Documents" Font-Bold="true"></dx:ASPxLabel>
    <br />

    <dx:ASPxGridView ID="gridDocs" ClientInstanceName="gridDocs" runat="server" KeyFieldName="DocVersID" PreviewFieldName="DocDesc" Width="90%">
        <Columns>
            <dx:GridViewDataColumn FieldName="DocTitle"></dx:GridViewDataColumn>
            <dx:GridViewDataColumn FieldName="Version"></dx:GridViewDataColumn>
            <dx:GridViewDataTextColumn Caption="Link">
                <DataItemTemplate>
                    <dx:ASPxHyperLink runat="server" ID="keyFieldLink" OnInit="keyFieldLink_Init"></dx:ASPxHyperLink>
                </DataItemTemplate>
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataColumn FieldName="ChangesDesc" Caption="Description of Changes"></dx:GridViewDataColumn>
            <dx:GridViewDataColumn FieldName="doctype" Caption="Document Type" GroupIndex="0"></dx:GridViewDataColumn>
            <dx:GridViewDataColumn FieldName="DocID" ReadOnly="true" Visible="false" Width="50px" CellStyle-ForeColor="Silver"></dx:GridViewDataColumn>
            <dx:GridViewDataColumn FieldName="DocVersID" ReadOnly="true" Visible="false" Width="50px" CellStyle-ForeColor="Silver"></dx:GridViewDataColumn>
        </Columns>
        <Settings ShowGroupPanel="true"  />
        <SettingsBehavior AllowFixedGroups="true" AutoExpandAllGroups="true" />
        <Settings ShowPreview="true" />
        <SettingsPager Mode="ShowAllRecords" />
    </dx:ASPxGridView>


        <asp:SqlDataSource ID="sqlMeasCat" runat="server" SelectCommandType="Text"  
        SelectCommand="select meascatID, meascat from tblMeasureCat_lkup order by meascat"
        ConnectionString="<%$ ConnectionStrings:TRACKING_CONN_STRING %>" >
    </asp:SqlDataSource>

        <asp:SqlDataSource ID="sqlMeasFocus" runat="server" SelectCommandType="Text"  
        SelectCommand="select measfocusID, measfocus from tblMeasFocus_lkup order by measfocus"
        ConnectionString="<%$ ConnectionStrings:TRACKING_CONN_STRING %>" >
    </asp:SqlDataSource>

    <asp:SqlDataSource ID="sqlMeasSource" runat="server" SelectCommandType="Text"  
        SelectCommand="select meassourceID, meassource from tblMeasSource_lkup order by meassource"
        ConnectionString="<%$ ConnectionStrings:TRACKING_CONN_STRING %>" >
    </asp:SqlDataSource>

    <asp:SqlDataSource ID="sqlMeasResp" runat="server" SelectCommandType="Text"  
        SelectCommand="select measrespID, measresp from tblMeasResp_lkup order by sortorder"
        ConnectionString="<%$ ConnectionStrings:TRACKING_CONN_STRING %>" >
    </asp:SqlDataSource>

    <asp:SqlDataSource ID="sqlMeasMethod" runat="server" SelectCommandType="Text"  
        SelectCommand="select measmethodID, measmethod from tblMeasMethod_lkup order by measmethod"
        ConnectionString="<%$ ConnectionStrings:TRACKING_CONN_STRING %>" >
    </asp:SqlDataSource>


</asp:Content>