<%@ Page Language="c#" Inherits="EditableWeeklyCalendar.WeeklyActions" CodeFile="WeeklyActions.aspx.cs"
    MasterPageFile="~/UWAC.master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="oBodyPlaceHolder" runat="server">
    <table class="layout">
        <tr>
            <td width="100px">
                <a href="IntakeActions.aspx">Intake Actions</a></td>
            <td width="100px">
                <a href="WeeklyActions.aspx">Weekly Actions</a></td>
            <td width="100px">
                <a href="PastDueActions.aspx">Past Due Actions</a></td>
            <td width="100px">
                <a href="StaffEditActions.aspx">Assigned Actions</a></td>
        </tr>
    </table>
    <br>
    <asp:Label ID="lblError" runat="server" ForeColor="Red" Visible="false" EnableViewState="false" /><br>
    <span style="font-weight: bold; font-size: 12pt">Weekly Actions</span><br>
    <table class="layout">
        <tr>
            <td>
                Date Start:</td>
            <td>
                <asp:TextBox ID="txtDateStart" runat="server" Width="100px" />
            </td>
            <td>
                Containing Action Text:</td>
            <td>
                <asp:TextBox ID="txtActionText" runat="server" Width="100px" />
            </td>
        </tr>
        <tr>
            <td>
                Date End:</td>
            <td>
                <asp:TextBox ID="txtDateEnd" runat="server" Width="100px" />
            </td>
            <td>
                Filter by ID (eg. TX01, TX09)<br>
                Leave blank for all:</td>
            <td>
                <asp:TextBox ID="txtIDs" runat="server" Width="100px" />
            </td>
        </tr>
        <tr>
            <td>
                Within a week sort by:</td>
            <td>
                <asp:DropDownList ID="ddlSortBy" runat="server">
                    <asp:ListItem Selected="True" Value="subject">Subject</asp:ListItem>
                    <asp:ListItem Value="respfor">Responsible For</asp:ListItem>
                    <asp:ListItem Value="duedate">Date Due/Done</asp:ListItem>
                    <asp:ListItem Value="status">Status</asp:ListItem>
                    <asp:ListItem Value="action">Action</asp:ListItem>
                </asp:DropDownList>
            </td>
            <td>
            </td>
            <td>
                <asp:Button ID="btnRefresh" runat="server" Text="Refresh" OnClick="btnRefresh_Click" /></td>
        </tr>
    </table>
    <table class="grid">
        <tr>
            <td width="200px" class="heading">
                Use the check boxes to select all of the actions you want to mark as complete.<br>
                <br>
                Set the desired values for Date Done and Completed By then click the 'Set to Complete'
                button.
            </td>
            <td>
                Date Done<br>
                <asp:TextBox ID="txtDateDone" runat="server" /><br>
                Completed By<br>
                <asp:DropDownList ID="ddlCompletedBy" runat="server" /><br>
                <br>
                <asp:Button ID="btnSetComplete" runat="server" Text="Set to Complete" OnClick="btnSetComplete_Click" />
            </td>
    </table>
    <br>
    <table class="grid">
        <tr>
            <td width="200px" class="heading">
                Use the check boxes to select all of the actions you want to assign.<br>
                <br>
                Set the desired value for Responsible For then click the 'Assign' button.
            </td>
            <td>
                Responsible For<br>
                <asp:DropDownList ID="ddlRespFor" runat="server" /><br>
                <br>
                <asp:Button ID="btnAssign" runat="server" Text="Assign" OnClick="btnAssign_Click" />
            </td>
    </table>
    <br>
    <asp:Repeater ID="rpActions" runat="server">
        <HeaderTemplate>
            <table class="txMainTable" style="width: 100%">
        </HeaderTemplate>
        <ItemTemplate>
            <asp:PlaceHolder ID="phNewWeekOf" runat="server">
                <tr>
                    <td colspan="8" class="majorheading" align="center">
                        <%# DataBinder.Eval(Container.DataItem, "weekof", "Week Of: {0:ddd M/d/yy}") %>
                    </td>
                </tr>
                <tr>
                    <td class="heading">
                        Select</td>
                    <td class="heading">
                        Date Due/Done</td>
                    <td class="heading">
                        Resp. For</td>
                    <td class="heading">
                        Comp. By</td>
                    <td class="heading" width="80px">
                        Status</td>
                    <td class="heading">
                        Subject<br>
                        <span style="font-weight: normal">(click to edit)</span></td>
                    <td class="heading">
                        Action<br>
                        <span style="font-weight: normal">(click to edit)</span></td>
                    <td class="heading">
                        Notes</td>
                </tr>
            </asp:PlaceHolder>
            <tr>
                <td>
                    <asp:CheckBox ID="chkEdit" runat="server" Checked="False" OnCheckedChanged="chkEdit_CheckedChanged" />
                    <input type="hidden" id="txtActionID" runat="server" value='<%# DataBinder.Eval(Container.DataItem, "actionid") %>'
                        name="txtActionID" />
                </td>
                <td>
                    <%# DataBinder.Eval(Container.DataItem, "duedate4") %>
                </td>
                <td>
                    <%# DataBinder.Eval(Container.DataItem, "staffshortname") %>
                </td>
                <td>
                    <%# DataBinder.Eval(Container.DataItem, "completedby_staffshortname") %>
                </td>
                <td>
                    <%# DataBinder.Eval(Container.DataItem, "actionstatus") %>
                </td>
                <td>
                    <a href='<%# Request.ApplicationPath + "/Household/ViewHousehold.aspx?HouseholdID=" + DataBinder.Eval(Container.DataItem, "householdid") %>'>
                        <%# DataBinder.Eval(Container.DataItem, "id") %>
                    </a>
                </td>
                <td>
                    <a href='<%# Request.ApplicationPath + "/measures/EditAction.aspx?ActionID=" + DataBinder.Eval(Container.DataItem, "actionid") %>'>
                        <%# DataBinder.Eval(Container.DataItem, "actiontype") + " - " + DataBinder.Eval(Container.DataItem, "actiontext") %>
                    </a>
                </td>
                <td>
                    <%# DataBinder.Eval(Container.DataItem, "notes") %>
                </td>
            </tr>
        </ItemTemplate>
        <FooterTemplate>
            </table>
        </FooterTemplate>
    </asp:Repeater>
</asp:Content>
