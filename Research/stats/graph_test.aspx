<%@ Page Language="C#" Debug="true" MasterPageFile="~/UWAC.master" AutoEventWireup="true" CodeFile="graph_test.aspx.cs" Inherits="stats_graph_test"
    EnableEventValidation="false" Title="Graph test" %>
 <%@ MasterType VirtualPath="~/UWAC.master" %>

<asp:Content ID="Content1"  ContentPlaceHolderID="oBodyPlaceHolder" runat="server" >

           <asp:ScriptManager ID="ScriptManager1" runat="server" EnablePartialRendering="true"      ></asp:ScriptManager>
    
    
     <asp:Label ID="lblINTRO_studyname" runat="server" Text=" " Font-Size="Medium" Font-Bold="false"></asp:Label>
    <asp:Label ID="lblStudyname_ContentPage" runat="server" Text=" " Font-Size="Medium" Font-Bold="true"></asp:Label>
    <br />
    <br />


    <asp:UpdatePanel ID="updatePanel_Selections" runat="server" UpdateMode="Conditional" >
    <ContentTemplate>
        <table>
            <tr>
                <td><b><u>Groups</u></b></td>
                <td><b><u>Subject Status</u></b></td>
                <td><b><u>Time Points</u></b></td>
                <td><b><u>Measures</u></b></td>
                <td><b><u>Variables</u></b></td>
            </tr>
            <tr>
                <td style="vertical-align:top">
                    <asp:ListBox ID="lstGroup" runat="server" SelectionMode="Multiple" Font-Size="X-Small" Rows="8"></asp:ListBox>
                </td>
                <td style="vertical-align:top">
                    <asp:ListBox ID="lstSubjStatus" runat="server" SelectionMode="Multiple" Font-Size="X-Small" Rows="8"></asp:ListBox>
                </td>
                <td style="vertical-align:top">
                    <asp:ListBox ID="lstTimePoint" runat="server" SelectionMode="Multiple" Font-Size="X-Small" Rows="8"></asp:ListBox>
                </td>
                <td style="vertical-align:top">
                    <asp:ListBox ID="lstMeasure" runat="server" SelectionMode="Multiple" Font-Size="X-Small" Rows="12"></asp:ListBox>
                </td>
                <td rowspan="3" style="vertical-align:top">
                    <asp:Button ID="btnLoadVars" runat="server" OnClick="btnLoadVars_Click" Text="Load vars" Font-Size="X-Small" /><br />
                    <asp:ListBox ID="lstVars" runat="server" SelectionMode="Multiple" Font-Size="X-Small" Rows="24"></asp:ListBox>
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <asp:Label ID="lblXaxis" runat="server" Text="X-axis:" Width="90px"></asp:Label>
                    <asp:DropDownList ID="ddlX1" runat="server" >
                    </asp:DropDownList>
                    <br />
                    <asp:Label ID="lblXaxis2" runat="server" Text="Subgroups:" Width="90px"></asp:Label>
                    <asp:DropDownList ID="ddlX2" runat="server" >
                    </asp:DropDownList>
                    <br />
                    <asp:Label ID="Label1" runat="server" Text="Limit data to:" Width="90px"></asp:Label>
                    <asp:DropDownList ID="ddlLimit" runat="server" >
                    </asp:DropDownList>
                </td>
                <td colspan="2">
                </td>

            </tr>
            <tr>
                <td>
                    <asp:Button ID="btnGetCharts" runat="server" OnClick="btnGetCharts_Click" Text="Get Charts" />
                </td>
            </tr>
        </table>

        </ContentTemplate>
        <Triggers>
            <asp:PostBackTrigger ControlID="btnLoadVars" />
            <asp:PostBackTrigger ControlID="btnGetCharts" />
        </Triggers>
        </asp:UpdatePanel>

    <br /><br />

<%--    <div>--%>
    <asp:UpdatePanel ID="updatePanel01" runat="server" UpdateMode="Conditional" >
        <ContentTemplate>
        <asp:Literal ID="lit01" runat="server"></asp:Literal>   
        <div id="chart1"></div>  
            <br />
        <div id="chart2"></div>  
            <br />
            <asp:Label ID="lblInfo" runat="server" Text=""></asp:Label>
            <br />
        </ContentTemplate>
    </asp:UpdatePanel>
<%--       <div id="chart_div"></div>    
     </div>  --%>
    
    </asp:Content>