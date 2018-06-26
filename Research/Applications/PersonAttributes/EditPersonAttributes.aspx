<%@ Page Language="C#" AutoEventWireup="true" CodeFile="EditPersonAttributes.aspx.cs"
    Inherits="EditPersonAttributes"  MasterPageFile="~/UWAC.master"  %>
    <%@ MasterType VirtualPath="~/UWAC.master" %>



<asp:Content ID="Content1" ContentPlaceHolderID="oBodyPlaceHolder" runat="server">



    <span style="font-weight: bold; font-size: 14pt;">Person Attributes</span>
    <a href="https://autism.washington.edu/SQLReports/Pages/Report.aspx?ItemPath=%2fSubject+Info%2fPerson+Attributes" target="_blank">View Report</a><br />
        <%-- HACK extra text box fixes IE bug. Without it form won't fire Click event if submitted user enter key  --%>
        <asp:TextBox ID="TextBox2" runat="server" style="visibility:hidden;display:none;"></asp:TextBox>
        <asp:Panel ID="pnlAttributes" runat="server" Visible="false">
            <table style="width: 100%;">
            <tr>
                <td style="vertical-align:top" style="width: 100%;">
                    <asp:GridView ID="gvAttributes" runat="server" AutoGenerateColumns="False" CellPadding="4"
                        DataSourceID="sdsAttributes" ForeColor="#333333" GridLines="None" DataKeyNames="PersonAttributeAssignmentID" Caption="Existing Attributes" OnRowDeleted="gvAttributes_RowDeleted" OnRowUpdated="gvAttributes_RowUpdated">
                        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                        <Columns>
                            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                            <asp:TemplateField HeaderText="Attribute" SortExpression="AttributeName">
                                <EditItemTemplate>
                                    <asp:DropDownList ID="ddlAttributes" runat="server" Width="144px" DataSourceID="sdsAttributesForDDL"
                                        DataTextField="AttributeName" DataValueField="PersonAttributeID" SelectedValue='<%# Bind("PersonAttributeID") %>'>
                                    </asp:DropDownList>
                                    <asp:SqlDataSource ID="sdsAttributesForDDL" runat="server" ConnectionString="<%$ ConnectionStrings:TRACKING_CONN_STRING %>"
                                        SelectCommand="SELECT [PersonAttributeID], [AttributeName] FROM [tblPersonAttribute] ORDER BY [AttributeName]">
                                    </asp:SqlDataSource>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("AttributeName") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Notes" SortExpression="PersonAttributeText">
                                <EditItemTemplate>
                                    <asp:TextBox ID="txtNotes" runat="server" Text='<%# Bind("PersonAttributeText") %>'
                                        Height="79px" MaxLength="500" TextMode="MultiLine" Width="218px"></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("PersonAttributeText") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                        <RowStyle BackColor="#EFF3FB" />
                        <EditRowStyle BackColor="#2461BF" />
                        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                        <AlternatingRowStyle BackColor="White" />
                        <EmptyDataTemplate>
                            <asp:Label ID="Label3" runat="server" Font-Bold="True" Text="No Attributes"></asp:Label>
                        </EmptyDataTemplate>
                    </asp:GridView>
                </td>
                <td style="vertical-align:top" style="width: 292px">
                    <asp:DetailsView ID="dvAddAttribute" runat="server" AutoGenerateRows="False" CellPadding="4"
                        DataSourceID="sdsAttributes" DefaultMode="Insert" ForeColor="#333333" GridLines="None"
                        Height="50px" Width="125px" Caption="Add New Attribute" OnItemInserted="dvAddAttribute_ItemInserted">
                        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                        <CommandRowStyle BackColor="#D1DDF1" Font-Bold="True" />
                        <EditRowStyle BackColor="#2461BF" />
                        <RowStyle BackColor="#EFF3FB" />
                        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                        <Fields>
                            <asp:TemplateField HeaderText="Attribute">
                                <InsertItemTemplate>
                                    <asp:DropDownList ID="ddlAttributes" runat="server" Width="143px" DataSourceID="SqlDataSource1"
                                        DataTextField="AttributeName" DataValueField="PersonAttributeID" SelectedValue='<%# Bind("PersonAttributeID") %>'>
                                    </asp:DropDownList><asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:TRACKING_CONN_STRING %>"
                                        SelectCommand="SELECT [PersonAttributeID], [AttributeName] FROM [tblPersonAttribute] ORDER BY [AttributeDescription]">
                                    </asp:SqlDataSource>
                                </InsertItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Notes">
                                <InsertItemTemplate>
                                    <asp:TextBox ID="txtNotes" runat="server" Height="65px" Text='<%# Bind("PersonAttributeText") %>'
                                        TextMode="MultiLine" Width="211px"></asp:TextBox>
                                </InsertItemTemplate>
                            </asp:TemplateField>
                            <asp:CommandField ShowInsertButton="True" CancelText="" InsertText="Add" />
                        </Fields>
                        <FieldHeaderStyle BackColor="#DEE8F5" Font-Bold="True" />
                        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                        <AlternatingRowStyle BackColor="White" />
                    </asp:DetailsView>
                </td>
            </tr>
        </table></asp:Panel>
        <asp:SqlDataSource ID="sdsAttributes" runat="server" ConnectionString="<%$ ConnectionStrings:TRACKING_CONN_STRING %>"
            SelectCommand="SELECT paa.PersonAttributeAssignmentID,  paa.PersonID, paa.PersonAttributeID, 
            pa.AttributeName, paa.PersonAttributeText FROM tblPerson AS p INNER JOIN tblPersonAttributeAssignment AS paa 
            ON paa.PersonID = p.PersonID INNER JOIN tblPersonAttribute AS pa ON pa.PersonAttributeID = paa.PersonAttributeID 
            WHERE (p.PersonID = @personid) ORDER BY pa.AttributeName" DeleteCommand="DELETE FROM tblPersonAttributeAssignment WHERE (PersonAttributeAssignmentID = @PersonAttributeAssignmentID)"
            InsertCommand="INSERT INTO tblPersonAttributeAssignment(PersonAttributeID, PersonID, PersonAttributeText) 
            VALUES (@PersonAttributeID, @PersonID, @PersonAttributeText)" UpdateCommand="UPDATE tblPersonAttributeAssignment SET 
            PersonAttributeID = @PersonAttributeID, PersonAttributeText = @PersonAttributeText 
            WHERE (PersonAttributeAssignmentID = @PersonAttributeAssignmentID)">
            <SelectParameters>
                <asp:ControlParameter ControlID="gvPerson" Name="personid" PropertyName="SelectedValue" />
            </SelectParameters>
            <DeleteParameters>
                <asp:Parameter Name="PersonAttributeAssignmentID" />
            </DeleteParameters>
            <UpdateParameters>
                <asp:Parameter Name="PersonAttributeID" />
                <asp:Parameter Name="PersonAttributeText" />
                <asp:Parameter Name="PersonAttributeAssignmentID" />
            </UpdateParameters>
            <InsertParameters>
                <asp:Parameter Name="PersonAttributeID" />
                <asp:ControlParameter ControlID="gvPerson" Name="personid" PropertyName="SelectedValue" />
                <asp:Parameter Name="PersonAttributeText" />
            </InsertParameters>
        </asp:SqlDataSource>
        <asp:Label ID="Label1" runat="server" Text="Enter first characters of a  last name"></asp:Label>
        <asp:TextBox ID="txtLast" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtLast"
            Display="Dynamic" ErrorMessage="Required" EnableClientScript="False"></asp:RequiredFieldValidator>
        <asp:Button ID="btnFind" runat="server" OnClick="btnFind_Click" Text="Search" />
        <asp:GridView ID="gvPerson" runat="server" AutoGenerateColumns="False" DataKeyNames="personid"
            DataSourceID="sdsSelectPerson" Visible="False" OnRowDataBound="gvPerson_RowDataBound"
            AutoGenerateSelectButton="True" CellPadding="4" ForeColor="#333333" GridLines="None" Width="100%">
            <Columns>
                <asp:HyperLinkField DataNavigateUrlFields="householdid" DataNavigateUrlFormatString="~/Household/ViewHousehold.aspx?HouseholdID={0}"
                     Target="_blank" DataTextField="hhname"  HeaderText="Household&lt;br /&gt;(Click to View)" >
                    <HeaderStyle Width="100px" />
                </asp:HyperLinkField>
                <asp:BoundField DataField="firstname" HeaderText="First" SortExpression="firstname" />
                <asp:BoundField DataField="lastname" HeaderText="Last" SortExpression="lastname" />
                <asp:BoundField DataField="sex" HeaderText="Sex" SortExpression="sex" />
                <asp:TemplateField HeaderText="DOB" SortExpression="dob">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("dob") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("dob", "{0:d}") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="personrole" HeaderText="Role" SortExpression="personrole" />
                <asp:TemplateField HeaderText="Attributes">
                    <ItemTemplate>
                        <asp:Label ID="lblAttributes" runat="server"></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <RowStyle BackColor="#EFF3FB" />
            <EditRowStyle BackColor="#2461BF" />
            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <AlternatingRowStyle BackColor="White" />
            <EmptyDataTemplate>
                <asp:Label ID="Label4" runat="server" Text="No Matching Persons" Font-Bold="true"></asp:Label>
            </EmptyDataTemplate>
        </asp:GridView>
        <asp:SqlDataSource ID="sdsSelectPerson" runat="server" ConnectionString="<%$ ConnectionStrings:TRACKING_CONN_STRING %>"
            SelectCommand="select h.householdid, personid, h.hhname, firstname, lastname,sex ,dob,  r.personrole&#13;&#10;from tblperson p&#13;&#10;join tblPersonRole_lkup r on r.personroleid = p.role&#13;&#10;join tblhousehold h on h.householdid = p.householdid&#13;&#10;order by lastname">
        </asp:SqlDataSource>


</asp:Content>