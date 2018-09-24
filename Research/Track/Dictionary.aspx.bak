<%@ Page Language="c#"   Debug="true" MasterPageFile="~/UWAC.master" CodeFile="Dictionary.aspx.cs" AutoEventWireup="true"
 Inherits="Track_Dictionary" Title="Data Dictionary"      %>   <%--Theme="Skin1" EnableEventValidation="true"--%>

<%@ MasterType VirtualPath="~/UWAC.master" %>

<%@ Register Assembly="DevExpress.Web.v17.2, Version=17.2.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.ASPxPivotGrid.v17.2, Version=17.2.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxPivotGrid" TagPrefix="dx" %> 

<asp:Content ID="HeadContent" runat="server" ContentPlaceHolderID="headContent" Visible="true">
 

</asp:Content>



<asp:Content ID="Content1"  ContentPlaceHolderID="oBodyPlaceHolder" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server" EnablePageMethods="true"  EnablePartialRendering="true"></asp:ScriptManager>


<script type="text/javascript">
    function NewMeas(s, e)
    {
        var grid = gridlkupMeas.GetGridView();
        grid.GetRowValues(grid.GetFocusedRowIndex(), "measureID", GotSelectedValues);
  }

    function GotSelectedValues(selectedValues)
    {
        gridDict.PerformCallback(selectedValues);

    }

</script>



    <br />
    <dx:ASPxLabel ID="lbl1" runat="server" Text="Data Dictionary" Font-Size="Medium" Font-Bold="true"></dx:ASPxLabel>
    <dx:ASPxGridLookup ID="gridlkupMeas" ClientInstanceName="gridlkupMeas" runat="server"  DataSourceID="sqlMeas" KeyFieldName="measureID"
         GridViewProperties-Settings-ShowFilterRow="true" Width="400px" NullText="--Search for a Measure --" TextFormatString="{0}"
         OnValueChanged="gridlkupMeas_ValueChanged" AutoPostBack="true">
        <ClientSideEvents ValueChanged="NewMeas" />
        <GridViewProperties>
          <SettingsPager PageSize="20"></SettingsPager>
        </GridViewProperties>
        <Columns>
            <dx:GridViewDataColumn FieldName="measureID" Caption="mID" CellStyle-ForeColor="Silver"></dx:GridViewDataColumn>
            <dx:GridViewDataColumn FieldName="instudy" Caption="In Study?" ></dx:GridViewDataColumn>
            <dx:GridViewDataColumn FieldName="measname" Caption="Measure"></dx:GridViewDataColumn>
            <dx:GridViewDataColumn FieldName="measfullname" Caption="Measure Full Name"></dx:GridViewDataColumn>
            <dx:GridViewDataColumn FieldName="meascat" Caption="Category"></dx:GridViewDataColumn>
            <dx:GridViewDataColumn FieldName="measmethod" Caption="Method"></dx:GridViewDataColumn>
            <dx:GridViewDataColumn FieldName="measfocus" Caption="Focus Person"></dx:GridViewDataColumn>
       </Columns>
    </dx:ASPxGridLookup>



    <br />
    <br />

                <dx:ASPxLabel ID="lblMeasName" runat="server"  Font-Size="Medium" Font-Bold="true"></dx:ASPxLabel>
                <dx:ASPxLabel ID="lblMeasFullName" runat="server"  Font-Size="Medium" Font-Bold="false"></dx:ASPxLabel>
                <br />

                <dx:ASPxGridView ID="gridDict" ClientInstanceName="gridDict" runat="server" KeyFieldName="fldpk" 
                    Settings-ShowFilterRow="true"  Settings-ShowFilterRowMenu="true"
                    OnCustomCallback="gridDict_CustomCallback"  
                    OnDataBinding="gridDict_DataBinding" OnHtmlRowPrepared="gridDict_HtmlRowPrepared">
                    <Styles>
                        <AlternatingRow BackColor="WhiteSmoke"></AlternatingRow>
                    </Styles>
                    <SettingsPager PageSize="50" Summary-Visible="true" AlwaysShowPager="true" >
                        <PageSizeItemSettings Visible="true" Items="20,50,100,200" ShowAllItem="true" />
                    </SettingsPager>
                <Columns>
                    <dx:GridViewDataColumn FieldName="fldpk" CellStyle-ForeColor="Silver" Visible="false" ReadOnly="true"></dx:GridViewDataColumn>
                    <dx:GridViewDataColumn FieldName="ord_pos" Caption="Position"  CellStyle-ForeColor="Silver" Width="70px"></dx:GridViewDataColumn>
                    <dx:GridViewDataColumn FieldName="fldname" Caption="Field Name" CellStyle-Font-Bold="true"></dx:GridViewDataColumn>
                    <dx:GridViewDataColumn FieldName="datatype" Caption="Data Type" Width="100px"></dx:GridViewDataColumn>
                    <dx:GridViewDataColumn FieldName="fielddatatype" Visible="false"></dx:GridViewDataColumn>
                    <dx:GridViewDataColumn FieldName="fielddatatypelength" Visible="false"></dx:GridViewDataColumn>
                    <dx:GridViewDataColumn FieldName="fieldlabel" Caption="Label"></dx:GridViewDataColumn>
                    <dx:GridViewDataColumn FieldName="missval" Caption="Missing<br/>Values" Width="50px"></dx:GridViewDataColumn>
                    <dx:GridViewDataColumn FieldName="fieldvaluesetID" Caption="fvsID" Visible="false"  CellStyle-ForeColor="Silver"></dx:GridViewDataColumn>
                    <dx:GridViewDataTextColumn FieldName="valuelabels" Caption="Value Labels" PropertiesTextEdit-EncodeHtml="false" CellStyle-ForeColor="Gray"></dx:GridViewDataTextColumn>
                    
                </Columns>
            </dx:ASPxGridView>




    <asp:SqlDataSource ID="sqlMeas" runat="server" SelectCommandType="Text"  
        SelectCommand="exec  trk.spMeasureList_for_Dictionary @studyID"
        ConnectionString="<%$ ConnectionStrings:TRACKING_CONN_STRING %>" >
        <SelectParameters>
            <asp:SessionParameter SessionField="studyID" Name="studyID" DbType="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>



<%--    <asp:SqlDataSource ID="sqlDict" runat="server" SelectCommandType="Text"  
        SelectCommand="select fldpk, tblpk, fldname, fielddatatype, fielddatatypelength, 
             fielddatatype + (coalesce('(' + cast(fielddatatypelength as varchar)+')','') datatype, fieldlabel from def.Fld where tblpk = (select tblpk from def.tbl where measureID = @measureID) order by ord_pos"
        ConnectionString="<%$ ConnectionStrings:DATA_CONN_STRING %>" >
        <SelectParameters>
            <asp:QueryStringParameter QueryStringField="measureID" Name="measureID" DbType="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>--%>


</asp:Content>
