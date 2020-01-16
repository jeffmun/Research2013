<%@ Page Language="c#" Debug="true" MasterPageFile="../UWAC.master"
    CodeFile="MobileDeviceInventory.aspx.cs" AutoEventWireup="true" Inherits="MobileDeviceInventory" Title="Mobile Device Inventory" %>

<%--EnableEventValidation="false"--%>

<%@ MasterType VirtualPath="../UWAC.master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="oBodyPlaceHolder" runat="server">

    <br />
    <asp:Label ID="lblInfo" runat="server"> </asp:Label>

    <asp:GridView ID="GridView1" runat="server" AllowSorting="True"
        AutoGenerateColumns="False" DataSourceID="SqlDataSource1" ShowFooter="True" >
        <%--        OnRowDataBound="GridView1_RowDataBound"--%>
        <Columns>

            <asp:CommandField ShowDeleteButton="False" ShowEditButton="True" />
                       <asp:TemplateField HeaderText="Device Description" SortExpression="Device_Description">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("Device_Description") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("Device_Description") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>

            <asp:TemplateField HeaderText="Device SN" SortExpression="Device_SN">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("Device_SN") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label4" runat="server" Text='<%# Bind("Device_SN") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
           

            <asp:TemplateField HeaderText="User" SortExpression="User_Name">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox10" runat="server" Text='<%# Bind("User_Name") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label10" runat="server" Text='<%# Bind("User_Name") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>

            <asp:TemplateField HeaderText="Email" SortExpression="Email">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox2a" runat="server" Text='<%# Bind("Email") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label2a" runat="server" Text='<%# Bind("Email") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>

            <asp:TemplateField HeaderText="User Type" SortExpression="User_Type" Visible ="False">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("User_Type") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("User_Type") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>



            
            <asp:TemplateField HeaderText="Checkout Date" SortExpression="Checkout_Date">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Checkout_Date") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("Checkout_Date") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>


            <asp:TemplateField HeaderText="Last Confirmed" SortExpression="Last_Confirmed" >
                <EditItemTemplate >
                    <asp:TextBox ID="TextBoxEight"  runat="server" Text='<%# Bind("Last_Confirmed") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="LabelEight" runat="server" Text='<%# Bind("Last_Confirmed") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>

               <asp:TemplateField HeaderText="Overdue" SortExpression="Overdue" >
                <EditItemTemplate>
                    <asp:TextBox ID="TextBoxEightp" runat="server" Text='<%# Bind("Overdue") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="LabelEightp" runat="server" Text='<%# Bind("Overdue") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>

            <asp:TemplateField HeaderText="Device ID" SortExpression="Device_ID" Visible="false">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox4z" runat="server" Text='<%# Bind("Device_ID") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label4z" runat="server" Text='<%# Bind("Device_ID") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>

          

        </Columns>

    </asp:GridView>

    <%--  <asp:ValidationSummary ValidationGroup="INSERT" ID="ValidationSummary1" runat="server" ForeColor="Red" />
    <asp:ValidationSummary ID="ValidationSummary2" runat="server" ForeColor="Red" />--%>

    <asp:SqlDataSource ID="SqlDataSource1" runat="server"
        ConnectionString="<%$ ConnectionStrings: mobileDeviceConnectionString%>"
        SelectCommand="SELECT [Overdue?] as Overdue,[Last Confirmed] as Last_Confirmed             ,[Checkout Date] as Checkout_Date               ,[User Name] as User_Name                      ,[User/Nav. Email] as Email                   ,[User Type] as User_Type                     ,[Device Description] as Device_Description    ,[Device Model] as Device_Model                ,[Device SN] as Device_SN    , [Device ID] as Device_ID                 
        FROM [mobile_devices].[dbo].[vwAll]"

        UpdateCommand="INSERT INTO [mobile_devices].[dbo].[checkouts] 
        ( [device]
        , [date]
        , [name] 
        , [email]   
        , [usergroup] )
        values
        ( @Device_ID
        , getdate()
        , @User_Name
        , @Email 
        , 1 ) ">                              
  
       
        <UpdateParameters>
            <asp:Parameter Name="User_Name" Type="String" />
            <asp:Parameter Name="Email" Type="String" />
            <asp:Parameter Name="Device_ID" Type="Int32" />
        </UpdateParameters>

    </asp:SqlDataSource>

</asp:Content>



