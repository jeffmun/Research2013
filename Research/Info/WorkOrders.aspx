<%@ Page Language="c#" Debug="true" MasterPageFile="~/UWAC.master"
    CodeFile="WorkOrders.aspx.cs" AutoEventWireup="true" Inherits="Info_WorkOrders" Title="WorkOrders" %>

<%--EnableEventValidation="false"--%>

<%@ MasterType VirtualPath="~/UWAC.master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="oBodyPlaceHolder" runat="server">


    <br />
    <asp:Label ID="lblInfo" runat="server"> </asp:Label>




    <%-- 
        button show/hide panel1

        panel1
            lab1 txt1  --list the fields to populate
            lab2 txt2
        
        button "submit"
    --%>

    <table>

        <tr>
            <td></td>
        </tr>

    </table>

    <asp:Label ID="Label1" runat="server" Text="Task description" Width="100px" />
    <asp:TextBox ID="txt1" runat="server" Text=""></asp:TextBox>
        <%--
    <asp:RequiredFieldValidator ID="rfvTaskDescription" runat="server"
        ErrorMessage="TaskDescription is a required field."
        ControlToValidate="txt1" Text="*** Required Field ***" ForeColor="Red">
    </asp:RequiredFieldValidator>
        --%>
    
    <br />

    <asp:Label ID="Label13" runat="server" Text="Task type" Width="100px" />
    <asp:TextBox ID="txt13" runat="server" Text="0"></asp:TextBox>

    <br />

    <asp:Label ID="Label2" runat="server" Text="Requester" Width="100px" />
    <asp:DropDownList ID="ddlRequester" runat="server" Width="165px"></asp:DropDownList>

    <br />

    <asp:Label ID="Label3" runat="server" Text="Request date" Width="100px" />
    <asp:TextBox ID="txt3" runat="server" Text="01/01/2001"></asp:TextBox>

    <br />

    <asp:Label ID="Label4" runat="server" Text="Response date" Width="100px" />
    <asp:TextBox ID="txt4" runat="server" Text="01/01/2001"></asp:TextBox><br />

    <asp:Label ID="Label5" runat="server" Text="Date closed" Width="100px" />
    <asp:TextBox ID="txt5" runat="server" Text="01/01/2001"></asp:TextBox><br />

    <asp:Label ID="Label9" runat="server" Text="Hours taken" Width="100px" />
    <asp:TextBox ID="txt9" runat="server" Text="0"></asp:TextBox><br />

    <asp:Label ID="Label10" runat="server" Text="Budget #" Width="100px" />
    <asp:TextBox ID="txt10" runat="server" Text="-"></asp:TextBox><br />

    <asp:Label ID="Label11" runat="server" Text="Budget name" Width="100px" />
    <asp:TextBox ID="txt11" runat="server" Text="-"></asp:TextBox><br />

    <asp:Label ID="Label12" runat="server" Text="Comments" Width="100px" />
    <asp:TextBox ID="txt12" runat="server" Text="-"></asp:TextBox><br />



    <asp:Button ID="btnInsert" runat="server" Text="Insert" OnClick="btnInsert_Click" Width ="270px"></asp:Button>

    <br />
    <br />    <br />



    <asp:GridView ID="GridView1" runat="server" AllowSorting="True"
        AutoGenerateColumns="False" DataSourceID="SqlDataSource1" ShowFooter="True">

        <Columns>

            <asp:CommandField ShowDeleteButton="False" ShowEditButton="True" />

            <asp:TemplateField HeaderText="WorkOrder" SortExpression="WorkOrder">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBoxEight" runat="server" Text='<%# Bind("WorkOrder") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="LabelEight" runat="server" Text='<%# Bind("WorkOrder") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>

            <asp:TemplateField HeaderText="TaskDescription" SortExpression="TaskDescription">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("TaskDescription") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("TaskDescription") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>

            <asp:TemplateField HeaderText="TaskType" SortExpression="TaskType">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox10" runat="server" Text='<%# Bind("TaskType") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label10" runat="server" Text='<%# Bind("TaskType") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>

            <asp:TemplateField HeaderText="RequesterID" SortExpression="RequesterID">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox2a" runat="server" Text='<%# Bind("RequesterID") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label2a" runat="server" Text='<%# Bind("RequesterID") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>

            <asp:TemplateField HeaderText="Requester" SortExpression="Requester">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("Requester") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("req2") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>

            <asp:TemplateField HeaderText="RequestDate" SortExpression="RequestDate">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("RequestDate") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("RequestDate") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>

            <asp:TemplateField HeaderText="ResponseDate" SortExpression="ResponseDate">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("ResponseDate") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label4" runat="server" Text='<%# Bind("ResponseDate") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>

            <asp:TemplateField HeaderText="DateClosed" SortExpression="DateClosed">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("DateClosed") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label5" runat="server" Text='<%# Bind("DateClosed") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>

            <asp:TemplateField HeaderText="AppxHoursTaken" SortExpression="AppxHoursTaken">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("AppxHoursTaken") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label6" runat="server" Text='<%# Bind("AppxHoursTaken") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>

             <asp:TemplateField HeaderText="BudgetNumber" SortExpression="BudgetNumber">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox8" runat="server" Text='<%# Bind("BudgetNumber") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="LabelEight" runat="server" Text='<%# Bind("BudgetNumber") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>

            <asp:TemplateField HeaderText="BudgetName" SortExpression="BudgetName">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox9" runat="server" Text='<%# Bind("BudgetName") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label9" runat="server" Text='<%# Bind("BudgetName") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>

            <asp:TemplateField HeaderText="Comments" SortExpression="Comments">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox7" runat="server" Text='<%# Bind("Comments") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label7" runat="server" Text='<%# Bind("Comments") %>'></asp:Label>
                </ItemTemplate>

            </asp:TemplateField>

        </Columns>

    </asp:GridView>

    <%--  <asp:ValidationSummary ValidationGroup="INSERT" ID="ValidationSummary1" runat="server" ForeColor="Red" />
    <asp:ValidationSummary ID="ValidationSummary2" runat="server" ForeColor="Red" />--%>

    <asp:SqlDataSource ID="SqlDataSource1" runat="server"
        ConnectionString="<%$ ConnectionStrings: TRACKING_CONN_STRING %>"
        SelectCommand="SELECT a.*, coalesce( b.requester,  a.requester ) as req2 FROM [WorkOrders] a left join [WorkOrders_requester] b ON a.requesterID=b.requesterID order by requestdate desc"
        UpdateCommand="UPDATE [WorkOrders] SET [TaskDescription] = @TaskDescription, [TaskType] = @TaskType, [RequesterID] = @RequesterID, [Requester] = @Requester, [RequestDate] = @RequestDate, [ResponseDate] = @ResponseDate, [DateClosed] = @DateClosed, [AppxHoursTaken] = @AppxHoursTaken, [BudgetNumber] = @BudgetNumber, [BudgetName] = @BudgetName, [Comments] = @Comments WHERE [WorkOrder] = @WorkOrder">
       
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
            <asp:Parameter Name="BudgetName" Type="String" />
            <asp:Parameter Name="Comments" Type="String" />
        </UpdateParameters>

    </asp:SqlDataSource>

</asp:Content>


<%-- InsertCommand="INSERT INTO [WorkOrders] ([WorkOrder], [TaskDescription], [Requester], [RequestDate], [ResponseDate], [DateClosed], [AppxHoursTaken], [Comments]) VALUES (@WorkOrder, @TaskDescription, @Requester, @RequestDate, @ResponseDate, @DateClosed, @AppxHoursTaken, @Comments)"--%>
        
 <%-- 
        <InsertParameters>
            <asp:Parameter Name="WorkOrder" Type="Int32" />
            <asp:Parameter Name="TaskDescription" Type="String" />
            <asp:Parameter Name="Requester" Type="String" />
            <asp:Parameter Name="RequestDate" Type="DateTime" />
            <asp:Parameter Name="ResponseDate" Type="DateTime" />
            <asp:Parameter Name="DateClosed" Type="DateTime" />
            <asp:Parameter Name="AppxHoursTaken" Type="Double" />
            <asp:Parameter Name="Comments" Type="String" />
        </InsertParameters>
        --%>