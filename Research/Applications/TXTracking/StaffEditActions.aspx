<%@ Page Language="c#" Inherits="EditableWeeklyCalendar.StaffEditActions" CodeFile="StaffEditActions.aspx.cs"
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
    <span style="font-weight: bold">Show actions assigned to:</span>
    <asp:DropDownList ID="ddlShowActionsFor" runat="server" OnSelectedIndexChanged="ddlShowActionsFor_SelectedIndexChanged"
        AutoPostBack="True" /><br>
    <asp:CheckBox ID="chkShowCompleted" Checked="False" AutoPostBack="True" Text="Show Completed Actions"
        runat="server" OnCheckedChanged="chkShowCompleted_CheckedChanged" Font-Size="8" /><br>
    <asp:Label ID="lblError" runat="server" ForeColor="Red" Visible="false" EnableViewState="false" /><br>
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
    <asp:Repeater ID="rpAssigned" runat="server">
        <HeaderTemplate>
            <table class="txMainTable" style="width: 100%">
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
        </HeaderTemplate>
        <ItemTemplate>
            <tr>
                <td>
                    <asp:CheckBox ID="chkEdit" runat="server" Checked="False" OnCheckedChanged="chkEdit_CheckedChanged" />
                    <input type="hidden" id="txtActionID" runat="server" value='<%# DataBinder.Eval(Container.DataItem, "actionid") %>'
                        name="txtActionID" />
                </td>
                <td>
                    <%# DataBinder.Eval(Container.DataItem, "duedate3") %>
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
    <br>
</asp:Content>
