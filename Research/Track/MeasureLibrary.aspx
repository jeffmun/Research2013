<%@ Page Language="c#"   Debug="true" MasterPageFile="~/UWAC.master" CodeFile="MeasureLibrary.aspx.cs" AutoEventWireup="true"
 Inherits="Track_MeasureLibrary" Title="Measure Library"      %>   <%--Theme="Skin1" EnableEventValidation="true"--%>

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
    <dx:ASPxLabel ID="lbl1" runat="server" Text="Measure Library" Font-Size="Medium" Font-Bold="true" Width="600px"></dx:ASPxLabel>

    <asp:HyperLink ID="hyp1" runat="server" Text="Create a New Measure" Font-Bold="true" NavigateUrl="~/Admin/NewMeasure.aspx" ></asp:HyperLink>
    <br />
    
    <br />
    <dx:ASPxGridView ID="gridlkupMeas" ClientInstanceName="gridlkupMeas" runat="server"  DataSourceID="sqlMeas" KeyFieldName="measureID"
         GridViewProperties-Settings-ShowFilterRow="true" Settings-ShowFilterRow="true"  >
        <SettingsPager PageSize="20" Position="TopAndBottom"  >
             <PageSizeItemSettings Visible="true" Items="20,50,100" ShowAllItem="true" />
        </SettingsPager>
        
        <Columns>
            <dx:GridViewDataColumn FieldName="measureID" Caption="mID" CellStyle-ForeColor="Silver"></dx:GridViewDataColumn>

            <dx:GridViewDataHyperLinkColumn FieldName="measname" Caption="Measure">
                <DataItemTemplate>
                    <dx:ASPxHyperLink ID="ASPxHyperLink_DE" runat="server" Text='<%# Eval("MeasName") %>' NavigateUrl='<%# "~/info/MeasureInfo.aspx?measureID=" + Eval("measureID") %>' Font-Bold="true">
                    </dx:ASPxHyperLink>
                </DataItemTemplate>
            </dx:GridViewDataHyperLinkColumn>


            <dx:GridViewDataColumn FieldName="measfullname" Caption="Measure Full Name"></dx:GridViewDataColumn>
            <dx:GridViewDataColumn FieldName="meascat" Caption="Category"></dx:GridViewDataColumn>
            <dx:GridViewDataColumn FieldName="measmethod" Caption="Method"></dx:GridViewDataColumn>
            <dx:GridViewDataColumn FieldName="measfocus" Caption="Focus Person"></dx:GridViewDataColumn>

            <dx:GridViewDataColumn FieldName="n_studies" Caption="# studies using"></dx:GridViewDataColumn>
            <dx:GridViewDataColumn FieldName="HasDataTable" Caption="Has Data Table?"></dx:GridViewDataColumn>
       </Columns>
    </dx:ASPxGridView>



    <br />
    <br />

                <dx:ASPxLabel ID="lblMeasName" runat="server"  Font-Size="Medium" Font-Bold="true"></dx:ASPxLabel>
                <dx:ASPxLabel ID="lblMeasFullName" runat="server"  Font-Size="Medium" Font-Bold="false"></dx:ASPxLabel>
                <br />

   


    <asp:SqlDataSource ID="sqlMeas" runat="server" SelectCommandType="Text"  
        SelectCommand="exec  trk.spMeasureList_for_Library  "
        ConnectionString="<%$ ConnectionStrings:TRACKING_CONN_STRING %>" >
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
