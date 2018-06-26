<%@ Page Language="C#" AutoEventWireup="true" CodeFile="EditOtherID.aspx.cs" Inherits="EditOtherID" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Untitled Page</title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <span style="font-family: Arial"><strong>
            UW Autism Center - Links to ID's from Other Sites</strong></span><br />
            <br />
            <table>
                <tr>
                    <td style="width: 176px">
                        <span style="font-family: Arial">
                        Select UW study:</span></td>
                    <td style="width: 210px">
                        <span style="font-family: Arial">
                        Select Other Site:</span></td>
                </tr>
                <tr>
                    <td style="width: 176px; height: 25px;">
                        <asp:DropDownList ID="DropDownList_UWstudies" runat="server" Width="163px" 
                            DataSourceID="Sql_CanView_Studies_in_OtherID"
                            DataTextField="studyname" DataValueField="studyID" >
                        </asp:DropDownList></td>
                    <td style="width: 210px; height: 25px;">
                        <asp:DropDownList ID="DropDownList_OtherSites" runat="server" DataSourceID="Sql_OtherSites"
                            DataTextField="sitename" DataValueField="siteID" Width="150px">
                        </asp:DropDownList></td>
                </tr>
            </table>
            <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Display ID links"
                Width="144px" Height="26px" /><br />
            <br />
            <asp:FormView ID="FormView1" runat="server" DataSourceID="Sql_InsertOtherID" Height="63px"
                Width="215px" OnItemInserted="FormView1_ItemInserted" BackColor="CornflowerBlue"  >
                <InsertItemTemplate>
                    <table style="width: 298px">
                        <tr>
                            <td style="width: 188px; font-size: 10pt; font-family: Arial;">
                                UW ID</td>
                            <td style="font-size: 10pt; font-family: Arial">
                                Other Site ID</td>
                            <td style="font-size: 10pt; font-family: Arial;">
                                Other Site Family ID</td>
                        </tr>
                        <tr>
                            <td style="width: 188px; height: 26px;">
                                <asp:DropDownList ID="SubjID_DropDownList" runat="server" DataSourceID="Sql_SubjID"
                                    DataTextField="ID" DataValueField="subjID"  >
                                </asp:DropDownList></td>
                            <td style="height: 26px">
                                <asp:TextBox ID="otherID_insert" runat="server" Width="94px"></asp:TextBox></td>
                            <td style="width: 3px; height: 26px;">
                                <asp:TextBox ID="otherFamilyID_insert" runat="server" Width="120px"></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td style="width: 188px; height: 26px;">
                                <asp:Button ID="Button2" runat="server" Text="Insert" CommandName="Insert" OnClick="Button2_Click"     /></td>
                            <td style="height: 26px">
                                <asp:Button ID="Button4" runat="server" CausesValidation="False" CommandName="Cancel"
                                    Text="Cancel" /></td>
                            <td style="width: 3px; height: 26px;">
                            </td>
                        </tr>
                    </table>
                    
                </InsertItemTemplate>
                <ItemTemplate>
                    <span style="font-size: 10pt; font-family: Arial"> </span>
                    <asp:Button ID="Button3" runat="server" Text="Insert new ID link" CommandName="New"
                        Width="136px" />
                </ItemTemplate>
                <HeaderTemplate>
                    <span style="font-size: 9pt; font-family: Arial">Sort
                        list of subjects:</span><br />
                    <asp:RadioButtonList ID="RadioList_SortBy" runat="server" AutoPostBack="True" Font-Names="Arial"
                        Font-Size="9pt" OnSelectedIndexChanged="RadioButtonList1_SelectedIndexChanged" RepeatDirection="Horizontal" Width="221px" BackColor="CornflowerBlue">
                        <asp:ListItem Selected="True" Value="ID">by ID</asp:ListItem>
                        <asp:ListItem Value="Lastname">by Last Name</asp:ListItem>
                    </asp:RadioButtonList>
                </HeaderTemplate>
                
            </asp:FormView>
            <br />
            <br />
            <asp:SqlDataSource ID="Sql_CanView_Studies_in_OtherID" runat="server" ConnectionString="<%$ ConnectionStrings:TRACKING_CONN_STRING %>"
                SelectCommand="select * from vwStudies_with_OtherID order by studyname"></asp:SqlDataSource>
            <asp:SqlDataSource ID="Sql_CanViewStudies" runat="server" ConnectionString="<%$ ConnectionStrings:TRACKING_CONN_STRING %>"
                SelectCommand="spGetStudies_CanView_by_User" SelectCommandType="StoredProcedure">
            </asp:SqlDataSource>

            <asp:SqlDataSource ID="Sql_SubjID" runat="server" ConnectionString="<%$ ConnectionStrings:TRACKING_CONN_STRING %>"
                SelectCommand="spGetSubjID_Sorted" SelectCommandType=StoredProcedure>
                    <SelectParameters>
                        <asp:ControlParameter ControlID="DropDownList_UWstudies" PropertyName="SelectedValue" Name="studyID" Type=Int32 />
                        <asp:ControlParameter ControlID="FormView1$RadioList_SortBy" PropertyName="SelectedValue" Name="sortby" Type=String/>
                    </SelectParameters>
            </asp:SqlDataSource>


            <asp:SqlDataSource ID="Sql_InsertOtherID" runat="server" ConnectionString="<%$ ConnectionStrings:TRACKING_CONN_STRING %>"
                InsertCommand="spInsertOtherID" InsertCommandType="StoredProcedure" SelectCommand="select 1">
                <InsertParameters>
                    <asp:ControlParameter ControlID="FormView1$SubjID_DropDownList" PropertyName="SelectedValue" Name="subjID"  Type="Int32" />
                    <asp:ControlParameter ControlID="FormView1$otherID_insert" PropertyName="Text" Name="otherID" Type="String" />
                    <asp:ControlParameter ControlID="FormView1$otherFamilyID_insert" PropertyName="Text" Name="otherFamilyID" Type="String" />
                    <asp:ControlParameter ControlID="DropDownList_OtherSites" PropertyName="SelectedValue" Name="otherIDsiteID" Type="Int32" />
                </InsertParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="Sql_OtherID" runat="server" ConnectionString="<%$ ConnectionStrings:TRACKING_CONN_STRING %>"
                SelectCommand="spOtherID" SelectCommandType="StoredProcedure" 
                UpdateCommand="UPDATE tblOtherID set otherID=@otherID, otherFamilyID=@otherFamilyID, otherIDsiteID=@otherIDsiteID where otherID_pk = @otherID_pk"
                DeleteCommand="DELETE FROM tblOtherID where otherID_pk = @otherID_pk">
                <UpdateParameters>
                    <asp:Parameter Name="otherID" Type=String/>
                    <asp:Parameter Name="otherFamilyID"  Type=String/>
                    <asp:Parameter Name="otherIDsiteID" Type="Int32" />
                    <asp:Parameter Name="otherID_pk" Type="Int32" />
                </UpdateParameters>
                <SelectParameters>
                    <asp:ControlParameter ControlID="DropDownList_UWstudies" DefaultValue="0" Name="studyID"
                        PropertyName="SelectedValue" Type="Int32" />
                    <asp:ControlParameter ControlID="DropDownList_OtherSites" DefaultValue="0" Name="otherIDsiteID"
                        PropertyName="SelectedValue" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="Sql_OtherSites" runat="server" ConnectionString="<%$ ConnectionStrings:TRACKING_CONN_STRING %>"
                SelectCommand="select * from vwOtherID_Sites"></asp:SqlDataSource>
            <span style="font-size: 8pt; font-family: Arial"><span style="color: #336699">(Click
                column headers to sort)</span><br />
            </span>
            <asp:GridView ID="GridView1" runat="server" CellPadding="4" DataSourceID="Sql_OtherID"
                DataKeyNames="otherID_pk" Font-Names="Arial" Font-Size="9pt" ForeColor="#333333"
                GridLines="None" AutoGenerateColumns="False" EditRowStyle-Width="20px" AllowSorting="True" OnRowUpdated="GridView1_RowUpdated">
                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <Columns>
                    <asp:TemplateField HeaderText="otherID_pk" SortExpression="otherID_pk" Visible="False">
                        <EditItemTemplate>
                            <asp:Label ID="TextBox3" runat="server" Text='<%# Bind("otherID_pk") %>'></asp:Label>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label4" runat="server" Text='<%# Bind("otherID_pk") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="lastname" SortExpression="lastname">
                        <EditItemTemplate>
                            <asp:Label ID="TextBox1" runat="server" Text='<%# Bind("lastname") %>'></asp:Label>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label2" runat="server" Text='<%# Bind("lastname") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="firstname" SortExpression="firstname">
                        <EditItemTemplate>
                            <asp:Label ID="TextBox2" runat="server" Text='<%# Bind("firstname") %>'></asp:Label>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label3" runat="server" Text='<%# Bind("firstname") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="UW study" SortExpression="firstname">
                        <EditItemTemplate>
                            <asp:Label ID="TextBox_UWstudy" runat="server" Text='<%# Bind("studyname") %>'></asp:Label>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label_UWstudy" runat="server" Text='<%# Bind("studyname") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="UW ID" SortExpression="IDsort">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("ID") %>' Width="60px"></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label5" runat="server" Text='<%# Bind("ID") %>' Width="60px"></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="otherID" SortExpression="otherID">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("otherID") %>' Width="60px"></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label6" runat="server" Text='<%# Bind("otherID") %>' Width="60px"></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="otherFamilyID" SortExpression="otherFamilyID">
                        <EditItemTemplate>
                            <asp:TextBox ID="otherFamilyID_edit" runat="server" Text='<%# Bind("otherFamilyID") %>' Width="60px"></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label7" runat="server" Text='<%# Bind("otherFamilyID") %>' Width="60px"></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Site" SortExpression="otherIDsiteID">
                        <EditItemTemplate>
                            <asp:DropDownList ID="othersiteID" DataSourceID="Sql_OtherSites" runat="server" Text='<%# Bind("otherIDsiteID") %>'
                                DataTextField="sitename" DataValueField="siteID">
                            </asp:DropDownList>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("sitename") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    
                    <asp:CommandField ShowEditButton="True" ButtonType=Button>
                        <ControlStyle Font-Size="8pt" ForeColor="#507CD1" />
                    </asp:CommandField>
                    <asp:CommandField ShowDeleteButton="True" ButtonType=Button>
                        <ControlStyle Font-Size="8pt" ForeColor="#507CD1" />
                    </asp:CommandField>
                </Columns>
                <RowStyle BackColor="#EFF3FB" />
                <EditRowStyle BackColor="#FF8000" Width="20px" />
                <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" HorizontalAlign="Left" />
                <AlternatingRowStyle BackColor="White" />
                <EmptyDataTemplate>
                    <span style="color: #cc0000">No records for this UW Study / Other Site combination.</span>
                </EmptyDataTemplate>
            </asp:GridView>
        </div>
    </form>
</body>
</html>
