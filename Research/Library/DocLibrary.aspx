<%@ Page Language="c#"   Debug="true" MasterPageFile="~/UWAC.master" CodeFile="DocLibrary.aspx.cs" AutoEventWireup="true"
 Inherits="Library_DocLibrary" Title="Document Library"      %>   

<%@ MasterType VirtualPath="~/UWAC.master" %>

<%@ Register Assembly="DevExpress.Web.v19.2, Version=19.2.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.ASPxPivotGrid.v19.2, Version=19.2.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxPivotGrid" TagPrefix="dx" %> 

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


    //Show DocUpload Popup and Refresh grid when closed
    function ShowDocUploadPopup(qs1, qs2) {
        const urlParams_search = new URLSearchParams(location.search);
        var urlParams = "&" + urlParams_search;
        //alert(urlParams);
        urlParams = urlParams.replace(qs1, qs2)
        //alert(urlParams);
        var baseurl = popUpload.GetContentUrl();
        //alert(baseurl);
        baseurl = baseurl.replace(urlParams, "");
        var url = baseurl + urlParams;
        //Make this replace specific to the page
        // first, remove

        var url = url.replace(qs1, qs2)
        //alert(url);
        popUpload.SetContentUrl(url);
        popUpload.Show();
    }

    var doc_command = ""
    function RefreshDocs(s, e) {
        gridDocs.PerformCallback();
    }
    function OnBeginCallback_Docs(s, e) {
        doc_command = e.command;
    }
    function OnEndCallback_Docs(s, e) {
        if (doc_command == "CUSTOMCALLBACK") {
            s.Refresh();
        }
    }

</script>


    <table>
        <tr>
            <td>
                    <dx:ASPxLabel ID="lbl1" runat="server" Text="Document Library" Font-Size="Medium" Font-Bold="true" Width="600px"></dx:ASPxLabel>
                    <br />
                    <dx:ASPxLabel ID="ASPxLabel1" runat="server" Text="To Do: add more search methods, etc.  For now you can use the filter boxes in the grid." Font-Size="Small" FOnt-Italic="true" Width="600px"></dx:ASPxLabel>
            </td>
            <td style="padding-left:50px">
		        <dx:ASPxButton ID="btnShowDocUploadPopup" runat="server" Text="Upload Document for Study" AutoPostBack="false" Font-Size="small">
		            <ClientSideEvents Click="function(s, e) { ShowDocUploadPopup('studyid','entityid'); }" />
	            </dx:ASPxButton>
            </td>
            <td style="padding-left:5px">
                <dx:ASPxLabel ID="lblnote" runat="server" Text="To upload docs for a specific subject, please do so on the Subject Details page."></dx:ASPxLabel>
            </td>
        </tr>
    </table>
    

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

    	<dx:ASPxPopupControl ID="popUpload" runat="server" Width="1100px" Height="500px" CloseAction="CloseButton" CloseOnEscape="true" Modal="True"  
        PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter" ClientInstanceName="popUpload"  ContentUrl="~/Docs/DocsUploadPopup.aspx?entitytypeid=6"
        HeaderText="Upload Document" AllowDragging="True" PopupAnimationType="None" EnableViewState="False" AutoUpdatePosition="true">
        <ClientSideEvents CloseUp="RefreshDocs" />
        <ContentStyle>
            <Paddings PaddingBottom="5px" />
        </ContentStyle>
    </dx:ASPxPopupControl>

    <br />
    <br />

<%--                <dx:ASPxLabel ID="lblMeasName" runat="server"  Font-Size="Medium" Font-Bold="true"></dx:ASPxLabel>
                <dx:ASPxLabel ID="lblMeasFullName" runat="server"  Font-Size="Medium" Font-Bold="false"></dx:ASPxLabel>
                <br />

   --%>


    <asp:SqlDataSource ID="sqlDocs" runat="server" SelectCommandType="Text"  
        SelectCommand="select * from vwDocList where availableallstudies=1 or entity_studyID in (select studyID from dbo.fnMySelectedStudies()) order by docversid desc"
        ConnectionString="<%$ ConnectionStrings:TRACKING_CONN_STRING %>" >
    </asp:SqlDataSource>



</asp:Content>
