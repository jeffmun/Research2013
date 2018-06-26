<%@ Page Language="c#" Debug="true" MasterPageFile="../UWAC.master"
    CodeFile="ReviewScheduleLog.aspx.cs" AutoEventWireup="true" Inherits="AC_ReviewScheduleLog" Title="Review Schedule Log" %>

<%--EnableEventValidation="false"--%>

<%@ MasterType VirtualPath="../UWAC.master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="oBodyPlaceHolder" runat="server">


    <br />
    <asp:Label ID="lblInfo" runat="server"> </asp:Label>





    <asp:GridView ID="GridView1" runat="server" AllowSorting="True"
        AutoGenerateColumns="False" DataSourceID="SqlDataSource1" ShowFooter="True" OnRowDataBound="GridView1_RowDataBound">

        <Columns>

            <asp:CommandField ShowDeleteButton="False" ShowEditButton="True" />

             <asp:TemplateField HeaderText="TaskID" SortExpression="TaskID" >
                <EditItemTemplate>
                    <asp:TextBox ID="TextBoxEightp" runat="server" Text='<%# Bind("TaskID") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="LabelEightp" runat="server" Text='<%# Bind("TaskID") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>

            <asp:TemplateField HeaderText="Assign. Date" SortExpression="AssignmentDate" >
                <EditItemTemplate >
                    <asp:TextBox ID="TextBoxEight"  runat="server" Text='<%# Bind("AssignmentDate") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="LabelEight" runat="server" Text='<%# Bind("AssignmentDate") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>

            <asp:TemplateField HeaderText="Task" SortExpression="Task">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Task") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("Task") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>

            <asp:TemplateField HeaderText="Pt. Person Email" SortExpression="PPEmail">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox10" runat="server" Text='<%# Bind("PPEmail") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label10" runat="server" Text='<%# Bind("PPEmail") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>

            <asp:TemplateField HeaderText="ETA (Days)" SortExpression="TimeEstimateInDays">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox2a" runat="server" Text='<%# Bind("TimeEstimateInDays") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label2a" runat="server" Text='<%# Bind("TimeEstimateInDays") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>

            <asp:TemplateField HeaderText="Completed By" SortExpression="CompletedBy">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("CompletedBy") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("CompletedBy") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>

            <asp:TemplateField HeaderText="Compl. Date" SortExpression="CompletionDate">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("CompletionDate") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("CompletionDate") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>

            <asp:TemplateField HeaderText="Notes" SortExpression="Notes">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("Notes") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label4" runat="server" Text='<%# Bind("Notes") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>

          

        </Columns>

    </asp:GridView>

    <%--  <asp:ValidationSummary ValidationGroup="INSERT" ID="ValidationSummary1" runat="server" ForeColor="Red" />
    <asp:ValidationSummary ID="ValidationSummary2" runat="server" ForeColor="Red" />--%>

    <asp:SqlDataSource ID="SqlDataSource1" runat="server"
        ConnectionString="<%$ ConnectionStrings: reviewScheduleConnectionString%>"
        SelectCommand="SELECT 
        TaskID, 
        Task,
        CONVERT(nvarchar(50), AssignmentDate, 111) as AssignmentDate,
        PPEmail, 
        TimeEstimateInDays, 
        CompletedBy, 
        CONVERT(nvarchar(50), CompletionDate, 111) as CompletionDate,
        Notes
        
        FROM [ac].[tReviewScheduleLog] where Archived = 0 order by TaskID desc"

        UpdateCommand="UPDATE [ac].[tReviewScheduleLog] SET [Task] = @Task, [AssignmentDate] = @AssignmentDate, 
        [PPEmail] = @PPEmail, [TimeEstimateInDays] = @TimeEstimateInDays, [CompletedBy] = @CompletedBy, 
        [CompletionDate] = @CompletionDate, [Notes] = @Notes WHERE [TaskID] = @TaskID; 
        INSERT INTO [ac].[tReviewScheduleLogUpdateLog] (TaskID, Task,AssignmentDate,PPEmail,TimeEstimateInDays,CompletedBy ,CompletionDate, Notes) values ( @TaskID, @Task,@AssignmentDate,@PPEmail,@TimeEstimateInDays,@CompletedBy ,@CompletionDate, @Notes);">
       
        <UpdateParameters>
            <asp:Parameter Name="Task" Type="String" />
            <asp:Parameter Name="AssignmentDate" Type="DateTime" />
            <asp:Parameter Name="PPEmail" Type="String" />
            <asp:Parameter Name="TimeEstimateInDays" Type="Int32" />
            <asp:Parameter Name="CompletedBy" Type="String" />
            <asp:Parameter Name="CompletionDate" Type="DateTime" />
            <asp:Parameter Name="Notes" Type="String" />
        </UpdateParameters>

    </asp:SqlDataSource>

</asp:Content>


