<%@ Page Language="c#" Debug="true" MasterPageFile="../UWAC.master"
    CodeFile="ComputerReservations.aspx.cs" AutoEventWireup="true" Inherits="ComputerReservations" Title="Computer Reservations" %>

<%--EnableEventValidation="false"--%>

<%@ MasterType VirtualPath="../UWAC.master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="oBodyPlaceHolder" runat="server">

    <br />

    <table>

<tr>
    <asp:Label ID="lblInfo" runat="server"> </asp:Label>
                        <td>
                        <asp:Label ID="lblNewComputerName" runat="server" Text="New Computer Name"></asp:Label>
                        <asp:TextBox ID="TextBoxNewComputerName" AutoPostBack="True" runat="server" 
                            OnTextChanged="TextBoxNewComputerName_TextChanged" OnDataBinding="TextBoxNewComputerName_TextChanged"></asp:TextBox>
                    </td>
                    <td>
    <asp:Button ID="btnCreateNewComputer" runat="server" OnClick="btnCreateNewComputer_Click" Text="Create New Computer" />
</td>
    </tr>
        <tr>
   
    <asp:GridView ID="GridView1" runat="server" AllowSorting="True"
        AutoGenerateColumns="False" DataSourceID="SqlDataSource1" ShowFooter="True" DataKeyNames = "computer">
        <%--        OnRowDataBound="GridView1_RowDataBound"--%>
        <Columns>

            <asp:CommandField ShowDeleteButton="true" ShowEditButton="True" />

            <asp:TemplateField HeaderText="Computer" SortExpression="computer">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBoxafds" runat="server" Text='<%# Bind("computer") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Labelafds" runat="server" Text='<%# Bind("computer") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>

            <asp:TemplateField HeaderText="User Name" SortExpression="username">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBoxafds2" runat="server" Text='<%# Bind("username") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Labelafds2" runat="server" Text='<%# Bind("username") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
           
            
            <asp:TemplateField HeaderText="Location" SortExpression="location">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("location") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("location") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
           

        
            <asp:TemplateField HeaderText="Description" SortExpression="description">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("description") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("description") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
           

            <asp:TemplateField HeaderText="Notes" SortExpression="notes">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox10" runat="server" Text='<%# Bind("notes") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label10" runat="server" Text='<%# Bind("notes") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>

        </Columns>

    </asp:GridView>
            </tr>
        </table>

    <asp:SqlDataSource ID="SqlDataSource1" runat="server"
        ConnectionString="<%$ ConnectionStrings:TRACKING_CONN_STRING%>"
        SelectCommand="SELECT [computer], [username], [location], [description], [notes] FROM [uwautism_research_backend].[IT].[ComputerReservations]"

        DeleteCommand="if exists (select * from [IT].[ComputerReservations] where [computer] = @computer)
          begin
            delete from [IT].[ComputerReservations] where computer = @computer
          end"

        UpdateCommand="if exists (select * from [IT].[ComputerReservations] where [computer] = @computer)
          begin
            UPDATE [IT].[ComputerReservations]
            set [username] = @username, [notes] = @notes, [location] = @location, [description] = @description
            where [computer] = @computer
          end"
      > 
       
        <UpdateParameters>
            <asp:Parameter Name="computer" Type="String" />
            <asp:Parameter Name="username" Type="String" />
            <asp:Parameter Name="location" Type="String" />
            <asp:Parameter Name="description" Type="String" />
            <asp:Parameter Name="notes" Type="String" />
        </UpdateParameters>

    </asp:SqlDataSource>

  

</asp:Content>



