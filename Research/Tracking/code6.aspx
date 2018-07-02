<%@ Page Title="" Language="C#" MasterPageFile="~/UWAC.master" AutoEventWireup="true" CodeFile="code6.aspx.cs" Inherits="Tracking_code6" %>


<%@ Register Assembly="DevExpress.Web.v17.2, Version=17.2.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>


<asp:Content ID="Content1" ContentPlaceHolderID="oBodyPlaceHolder" Runat="Server">

    <script type="text/javascript">
        function grid_SelectionChanged(s,e) {
            s.GetSelectedFieldValues("studyname",GetSelectedFieldValuesCallback);
        }
        function GetSelectedFieldValuesCallback(values) {
            selList.BeginUpdate();
            try {
                selList.ClearItems();
                for(var i=0;i<values.length;i++) {
                    selList.AddItem(values[i]);
                }
            } finally {
                selList.EndUpdate();
            }
            document.getElementById("selCount").innerHTML=gridStudy.GetSelectedRowCount();
        }
    </script>

    <br />
    <br />
    <asp:Label ID="lblTitle" runat="server" Text="Create 'code6' ID files" Font-Bold="true" Font-Size="Medium"></asp:Label>
    <br />
    <asp:DropDownList ID="ddlLab" runat="server" DataTextField="labname" DataValueField="labID" AutoPostBack="true" OnSelectedIndexChanged="ddlLab_SelectedIndexChanged" ></asp:DropDownList>
    <br />
    <br />

    <asp:Panel ID="panel_filters" runat="server" Visible ="false">

    <table>
        <tr>
            <td style="vertical-align:top; width:500px">

                <asp:Button ID="btnGetIDList" runat="server" OnClick="btnGetIDList_Click" Text="Download stacked code6 file (.csv)" />

            </td>
            <td style="vertical-align:top">
                <asp:Label ID="lblSingle" runat="server" Text="Enter single code6 to lookup:" Font-Size="XX-Small"></asp:Label><br />
                <asp:TextBox ID="txtCode6" runat="server" Width="100" ></asp:TextBox><br /><br />
                <asp:Button ID="btnSingle" runat="server" OnClick="btnSingle_Click" Text="Get Other ID's" /><br /><br />
                <asp:GridView ID="gvSingle" runat="server" AutoGenerateColumns="true"></asp:GridView>


            </td>
            <td style="vertical-align:top">
                <asp:Panel ID="panelDups" runat="server" Visible="false">
                <asp:Label ID="lblDups" runat="server" Text="Duplicates - same otherID is assigned to different people." Font-Size="Small" Font-Bold="true"   ></asp:Label>
                <br /><br />
                <asp:GridView ID="gvDups" runat="server" AutoGenerateColumns="true"></asp:GridView>
                    </asp:Panel>
            </td>

        </tr>
    </table>





    <br />
    <br />
    <table >
        <tr>
            <td></td>
            <td>Select Studies:</td>
<%--        <td><i>UNDER CONSTRUCTION</i><br />Select Groups:  <asp:Button ID="btnLoadGroups" runat="server" OnClick="btnLoadGroups_Click" Text="refresh" Font-Size="XX-Small" ></asp:Button></td>--%>
        </tr>
        <tr>
            <td style="vertical-align:top; padding:10px"> 
                <dx:ASPxListBox ID="selList" ClientInstanceName="selList" runat="server"  Height="350px" Width="100%" />&nbsp;&nbsp;&nbsp;
                <br />
                    Selected count: <span id="selCount" style="font-weight: bold">0</span>
                

            </td>
            <td style="vertical-align:top; padding:10px" >
                <dx:ASPxGridView id="gridStudy" runat="server" ClientInstanceName="gridStudy"
                     KeyFieldName="studyID">
                    <Columns>
                        <dx:GridViewCommandColumn ShowSelectCheckbox="true" SelectAllCheckboxMode="AllPages" />
                        <dx:GridViewDataColumn FieldName="studyname" Caption="Study"></dx:GridViewDataColumn>
                    </Columns>
                    <ClientSideEvents SelectionChanged="grid_SelectionChanged" />
                    <SettingsPager PageSize="15"></SettingsPager>
                </dx:ASPxGridView>
            </td>
            <td style="vertical-align:top">

            </td>
        </tr>

    </table>

        <br />

    <asp:Button ID="btnPivot" runat="server" OnClick="btnPivot_Click" Text="Create wide code6 file, with Filters" />

    <asp:CheckBox ID="chkXLSX" runat="server" Text="Save to .xlsx" ></asp:CheckBox>
    <asp:CheckBox ID="chkDisplayOnPage" runat="server" Text="Display on page" ></asp:CheckBox>

        <asp:Label ID="lblSelectOne" runat="server" Visible="false" Text="Select the output method." Font-Size="XX-Small" ForeColor="Red"></asp:Label>
        <br />
        <br />
    </asp:Panel>
    <asp:Panel ID="panel_wide" runat="server" >

    </asp:Panel>



</asp:Content>

