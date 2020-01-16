<%@ Page Title="" Language="C#" MasterPageFile="~/UWAC.master" AutoEventWireup="true" CodeFile="NDARview.aspx.cs" Inherits="NDAR_NDARview"
      %>
<%--EnableEventValidation="false"--%> 
<%@ MasterType VirtualPath="~/UWAC.master" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Grid" Assembly="obout_Grid_NET" %>


<%@ Register Assembly="DevExpress.Web.v19.1, Version=19.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>


<asp:Content ID="Content1" ContentPlaceHolderID="oBodyPlaceHolder" Runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server" EnablePartialRendering="true"  ></asp:ScriptManager>

     <script src="https://google-code-prettify.googlecode.com/svn/loader/run_prettify.js?lang=sql"></script>

    <br />
    <br />
    <table>
        <tr>
            <td width ="400">
                <asp:Hyperlink ID="Hyperlink1" runat="server" NavigateUrl="~/NDAR/NDARapi.aspx" Target="_blank" Text="Return to List of NDAR Measures"></asp:Hyperlink>
            </td>
            <td width ="400">
                <asp:Hyperlink ID="Hyperlink2" runat="server" NavigateUrl="" Target="_blank" Text="Go to Data Dictionary for this measure"></asp:Hyperlink>
            </td>
            <td>
                <asp:CheckBox ID="chkShowSQLsyntax" runat="server" Visible="false" Text="show SQL syntax" Checked="true" AutoPostBack="true" EnableViewState="true" />
            </td>
        </tr>
    </table>
    <br />
    <asp:Label ID="lblInfo" runat="server" Text=""></asp:Label>
    <asp:Button ID="btnSaveCSV" runat="server" Text="Save To CSV" OnClick="btnSaveCSV_Click" Visible="false" />
    <br />

    <table>
        <tr>
<%--            NDAR fields--%>
            <td style="vertical-align:top">
    <asp:Panel ID="Panel_Details" runat="server" Visible="true">
    <table>
        <tr>
            <td style="width:130px"><asp:Label ID="l0" runat="server" Text ="Study:"></asp:Label></td>
            <td><asp:Label ID="v0" runat="server"  Font-Bold="true" Font-Size="Large"></asp:Label></td>
        </tr>
        <tr>
            <td><asp:Label ID="l1" runat="server" Text ="shortName:"></asp:Label></td>
            <td><asp:Label ID="v1" runat="server"  Font-Bold="true" Font-Size="Large"></asp:Label></td>
        </tr>
        <tr>
            <td><asp:Label ID="l2" runat="server" Text ="Title:"></asp:Label></td>
            <td width="400px"><asp:Label ID="v2" runat="server" Font-Bold="true" Font-Size="Small"></asp:Label></td>
        </tr>
        <tr>
            <td><asp:Label ID="l3" runat="server" Text ="N Elements (vars):"></asp:Label></td>
            <td><asp:Label ID="v3" runat="server"  Font-Bold="true" Font-Size="Medium"></asp:Label></td>
        </tr>
        <tr>
            <td><asp:Label ID="l4" runat="server" Text ="DataDict Source:"></asp:Label></td>
            <td><asp:Label ID="v4" runat="server"  Font-Bold="true" Font-Size="Small"></asp:Label></td>
        </tr>
        <tr>
            <td><asp:Label ID="l5" runat="server" Text ="N Total Records:"></asp:Label></td>
            <td><asp:Label ID="v5" runat="server"  Font-Bold="true" Font-Size="Small"></asp:Label></td>
        </tr>
         <tr>
            <td><asp:Label ID="l6" runat="server" Text ="N Recs valid:"></asp:Label></td>
            <td><asp:Label ID="v6" runat="server"  Font-Bold="true" Font-Size="Small"></asp:Label></td>
        </tr>
        <tr>
            <td><asp:Label ID="l7" runat="server" Text ="N Recs w/Reason Excl:"></asp:Label></td>
            <td><asp:Label ID="v7" runat="server"  Font-Bold="true" Font-Size="Small"></asp:Label></td>
        </tr>
    </table>
        </asp:Panel>


            </td>
            <td style="vertical-align:top; padding:10px">
<%--                OnClick="btnRetrieveData_Click"--%>
                <asp:Button ID="btnRetrieveData" runat="server" Text="Load Data"  CommandName="LoadData" CommandArgument="x" OnCommand="Process_Button_Command"   />
                <asp:Button ID="btnSaveNDARCSV" runat="server" Text="Save NDAR CSV" OnClick="btnSaveNDARCSV_Click" />
                <br />
                ID's to exclude:<br /><asp:TextBox ID="txtIDexclude" runat="server" Text=""></asp:TextBox>
                <br /> <br />
<%--                Dest folder: <asp:TextBox ID="txtDestFolder" runat="server" Text="C:\NDAR\todo\"></asp:TextBox>--%>
            </td>
            <td style="vertical-align:top; padding:10px; width: 200px">
                <asp:Panel ID="panelStudymeas" runat="server"></asp:Panel>
                <asp:Label ID="lblPleaseSelect" runat="server" Text="Select study measures to include." ForeColor="Red" Font-Bold="true"
                    Visible="false"></asp:Label>
            </td>
            <td style="vertical-align:top">
                <p style="color:Navy;">
                    <b>Instructions:</b>
                    <br />1. Check the measures to include
                    <br />2. <b>Load Data</b> - this will display the data transformed into the NDAR format
                    <br />3. Review the data & look at the 'reason_exclude' column for cases that will not be in the NDAR dataset.
                    <br />4. <b>Save NDAR CSV</b> - this will download the file you will validate with the NDAR Validation Tool.
                    <br />5. The SQL syntax used to create this data is displayed at the bottom.  If you get errors when validating
                    <br />&nbsp;&nbsp;&nbsp;you may need to adjust the definition for a given variable.
                </p>

            </td>
        </tr>
    </table>


    
    <asp:GridView ID="gvNDARview" runat="server" OnRowDataBound="gvNDARview_RowDataBound"></asp:GridView>

<%--    OnRowDataBound="gridNDARview_RowDataBound"--%>
    <dx:ASPxGridView ID="gridNDARview" ClientInstanceName="gridNDARview" runat="server" KeyFieldName="databasepk" 
          Visible="false" AutoGenerateColumns="true" Width="95%"  SettingsBehavior-AllowSelectByRowClick="true"
           Settings-HorizontalScrollBarMode="Visible" OnLoad="gridNDARview_OnLoad" OnHtmlDataCellPrepared="gridNDARview_OnHtmlDataCellPrepared" >
        <SettingsPager PageSize="20" Summary-Visible="true" AlwaysShowPager="true" >
            <PageSizeItemSettings Visible="true" Items="20,50,100,200" ShowAllItem="true" />
        </SettingsPager>
        <Columns>
<%--            <dx:GridViewDataHyperLinkColumn FieldName="rownum"  >
             <DataItemTemplate>
                    <dx:ASPxHyperLink ID="ASPxHyperLink_DE" runat="server" Text='<%# Eval("rownum") %>' NavigateUrl='<%# Eval("rownum") %>'>
                    </dx:ASPxHyperLink>
                </DataItemTemplate>
                </dx:GridViewDataHyperLinkColumn>--%>
        </Columns>
    </dx:ASPxGridView>

    <br />
    <br />


    <pre class="prettyprint"><code class="language-sql">
            <asp:Literal ID="lblSQLsyntax" runat="server" ></asp:Literal>
    </pre>
    


</asp:Content>

