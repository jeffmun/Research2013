<%@ Page Language="c#" Debug="true" MasterPageFile="~/UWAC.master"
    CodeFile="Waitlist.aspx.cs" AutoEventWireup="true" Inherits="Info_Waitlist" Title="Waitlist" %>

<%--EnableEventValidation="false"--%>

<%@ MasterType VirtualPath="~/UWAC.master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="oBodyPlaceHolder" runat="server">


    <br />
    <asp:Label ID="lblInfo" runat="server"> </asp:Label>

    <table>

        <tr>
            <td></td>
        </tr>

    </table>
<%-- 
    <asp:Label ID="Label1" runat="server" Text="Task description" Width="100px" />
    <asp:TextBox ID="txt1" runat="server" Text=""></asp:TextBox><br />

    <asp:Label ID="Label13" runat="server" Text="Task type" Width="100px" />
    <asp:TextBox ID="txt13" runat="server" Text="0"></asp:TextBox><br />

    <asp:Label ID="Label2" runat="server" Text="Requester" Width="100px" />
    <asp:DropDownList ID="ddlRequester" runat="server" Width="185px"></asp:DropDownList><br />

    <asp:Label ID="Label3" runat="server" Text="Request date" Width="100px" />
    <asp:TextBox ID="txt3" runat="server" Text="01/01/2001"></asp:TextBox><br />

    <asp:Label ID="Label4" runat="server" Text="Response date" Width="100px" />
    <asp:TextBox ID="txt4" runat="server" Text="01/01/2001"></asp:TextBox><br />

    <asp:Label ID="Label5" runat="server" Text="Date closed" Width="100px" />
    <asp:TextBox ID="txt5" runat="server" Text="01/01/2001"></asp:TextBox><br />

    <asp:Label ID="Label9" runat="server" Text="Hours taken" Width="100px" />
    <asp:TextBox ID="txt9" runat="server" Text="0"></asp:TextBox><br />

    <asp:Label ID="Label10" runat="server" Text="Budget #" Width="100px" />
    <asp:DropDownList ID="ddlBudget" runat="server" Width="185px"></asp:DropDownList><br />

    <asp:Label ID="Label11" runat="server" Text="Budget name" Width="100px" />
    <asp:TextBox ID="txt11" runat="server" Text="-"></asp:TextBox><br />

    <asp:Label ID="Label12" runat="server" Text="Comments" Width="100px" />
    <asp:TextBox ID="txt12" runat="server" Text="-"></asp:TextBox><br />

    <asp:Button ID="btnInsert" runat="server" Text="Insert" OnClick="btnInsert_Click" Width="270px"></asp:Button>

    <br />
    <br />
    <br />
--%>


    <asp:GridView ID="GridView1" runat="server" AllowSorting="True"
        AutoGenerateColumns="False" DataSourceID="SqlDataSource5" ShowFooter="True"
        onrowdatabound="GridView1_RowDataBound" >
        <Columns>
            <asp:CheckBoxField DataField="Archive" HeaderText="Archive" SortExpression="Archive" />
            <asp:BoundField DataField="Site" HeaderText="Site" SortExpression="Site" />
            <asp:BoundField DataField="SvcReq" HeaderText="SvcReq" SortExpression="SvcReq" />
            <asp:BoundField DataField="SvcStatus" HeaderText="SvcStatus" SortExpression="SvcStatus" />
            <asp:BoundField DataField="DOB" HeaderText="DOB" SortExpression="DOB" />
            <asp:BoundField DataField="LName" HeaderText="LName" SortExpression="LName" />
            <asp:BoundField DataField="SvcReq2" HeaderText="SvcReq2" SortExpression="SvcReq2" />
            <asp:BoundField DataField="Ins" HeaderText="Ins" SortExpression="Ins" />
            <asp:BoundField DataField="InfoRtn" HeaderText="InfoRtn" SortExpression="InfoRtn" />
        </Columns>

    </asp:GridView>

    <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:waitlistConnectionString %>" SelectCommand="SELECT DISTINCT * FROM [vw_getWaitlist] WHERE (([Site] IS NOT NULL) AND ([SvcStatus] NOT LIKE '%' + @SvcStatus + '%')) ORDER BY [Site], [SvcReq], [SvcStatus]">
        <SelectParameters>
            <asp:Parameter DefaultValue="No Paperwork" Name="SvcStatus" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
    <%-- 
    <asp:SqlDataSource ID="SqlDataSource4" runat="server"></asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource3" runat="server"></asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server"></asp:SqlDataSource>

    <asp:SqlDataSource ID="SqlDataSource1" runat="server"
        ConnectionString="<%$ ConnectionStrings: TRACKING_CONN_STRING %>"
        SelectCommand="SELECT a.*, coalesce( b.requester,  a.requester ) as req2 FROM [WorkOrders] a left join [WorkOrders_requester] b ON a.requesterID=b.requesterID order by WorkOrder desc"
        UpdateCommand="UPDATE [WorkOrders] SET [TaskDescription] = @TaskDescription, [TaskType] = @TaskType, [RequesterID] = @RequesterID, [Requester] = @Requester, [RequestDate] = @RequestDate, [ResponseDate] = @ResponseDate, [DateClosed] = @DateClosed, [AppxHoursTaken] = @AppxHoursTaken, [BudgetNumber] = @BudgetNumber, [Comments] = @Comments WHERE [WorkOrder] = @WorkOrder">

        <UpdateParameters>
            <asp:Parameter Name="WorkOrder" Type="Int32" />
            <asp:Parameter Name="TaskDescription" Type="String" />
            <asp:Parameter Name="TaskType" Type="Int32" />
            <asp:Parameter Name="RequesterID" Type="String" />
            <asp:Parameter Name="Requester" Type="String" />
            <asp:Parameter Name="RequestDate" Type="DateTime" />
            <asp:Parameter Name="ResponseDate" Type="DateTime" />
            <asp:Parameter Name="DateClosed" Type="DateTime" />
            <asp:Parameter Name="AppxHoursTaken" Type="Double" />
            <asp:Parameter Name="BudgetNumber" Type="String" />
            <asp:Parameter Name="Comments" Type="String" />
        </UpdateParameters>

    </asp:SqlDataSource>
    --%>
</asp:Content>

