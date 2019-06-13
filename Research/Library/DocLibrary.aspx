<%@ Page Language="c#"   Debug="true" MasterPageFile="~/UWAC.master" CodeFile="DocLibrary.aspx.cs" AutoEventWireup="true"
 Inherits="Library_DocLibrary" Title="Document Library"      %>   

<%@ MasterType VirtualPath="~/UWAC.master" %>

<%@ Register Assembly="DevExpress.Web.v19.1, Version=19.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.ASPxPivotGrid.v19.1, Version=19.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxPivotGrid" TagPrefix="dx" %> 

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



    
    <dx:ASPxLabel ID="lbl1" runat="server" Text="Document Library" Font-Size="Medium" Font-Bold="true" Width="600px"></dx:ASPxLabel>

    <br />
    <dx:ASPxLabel ID="ASPxLabel1" runat="server" Text="To Do: add more search methods, etc.  For now you can use the filter boxes in the grid." Font-Size="Small" FOnt-Italic="true" Width="600px"></dx:ASPxLabel>

    <br />
    
    <br />
    <dx:ASPxGridView ID="gridlkupDocs" ClientInstanceName="gridlkupDocs" runat="server"  DataSourceID="sqlDocs" KeyFieldName="docversID"
         GridViewProperties-Settings-ShowFilterRow="true" Settings-ShowFilterRow="true"  Settings-ShowGroupPanel="true" >
        <SettingsPager PageSize="20" Position="TopAndBottom"  >
             <PageSizeItemSettings Visible="true" Items="20,50,100" ShowAllItem="true" />
        </SettingsPager>
        <SettingsBehavior AllowGroup="true" />
        
        <Columns>

            <dx:GridViewDataHyperLinkColumn FieldName="doctitle" Caption="Doc Title">
                <DataItemTemplate>
                    <dx:ASPxHyperLink ID="ASPxHyperLink_DE" runat="server" Text='<%# Eval("DocTitle") %>' NavigateUrl='<%# "~/Library/Doc.aspx?dvID=" + Eval("docversID") %>' 
                        Target="_blank" Font-Bold="true">
                    </dx:ASPxHyperLink>
                </DataItemTemplate>
            </dx:GridViewDataHyperLinkColumn>


            <dx:GridViewDataColumn FieldName="DocType" Caption="Doc Type"></dx:GridViewDataColumn>
            <dx:GridViewDataColumn FieldName="DocStatus" Caption="Doc Status"></dx:GridViewDataColumn>
            <dx:GridViewDataColumn FieldName="DocDesc" Caption="Description"></dx:GridViewDataColumn>
            <dx:GridViewDataColumn FieldName="ChangesDesc" Caption="Description of changes"></dx:GridViewDataColumn>

            <dx:GridViewDataColumn FieldName="DocID" Caption="docID" CellStyle-ForeColor="Silver" Width="50px"></dx:GridViewDataColumn>
            <dx:GridViewDataColumn FieldName="docversID" Caption="docversID" CellStyle-ForeColor="Silver" Width="50px"></dx:GridViewDataColumn>
       </Columns>
    </dx:ASPxGridView>



    <br />
    <br />

<%--                <dx:ASPxLabel ID="lblMeasName" runat="server"  Font-Size="Medium" Font-Bold="true"></dx:ASPxLabel>
                <dx:ASPxLabel ID="lblMeasFullName" runat="server"  Font-Size="Medium" Font-Bold="false"></dx:ASPxLabel>
                <br />

   --%>


    <asp:SqlDataSource ID="sqlDocs" runat="server" SelectCommandType="Text"  
        SelectCommand="exec  trk.spDocList_for_Library  "
        ConnectionString="<%$ ConnectionStrings:TRACKING_CONN_STRING %>" >
    </asp:SqlDataSource>



</asp:Content>
