<%@ Page Language="c#" Inherits="EditableWeeklyCalendar.IntakeActions" CodeFile="IntakeActions.aspx.cs"
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
    <span style="font-weight: bold; font-size: 12pt">Intake Actions</span><br>
    <asp:Label ID="lblTitle" runat="server" Font-Size="12" Font-Bold="true" /><br>
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
                <asp:Button ID="btnUpdate" runat="server" Text="Set to Complete" OnClick="btnUpdate_Click" />
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
    <asp:Repeater ID="rpIntake" runat="server">
        <HeaderTemplate>
            <table class="txMainTable" style="width: 100%">
                <tr>
                    <td colspan="8" class="majorheading" align="center">
                        Intake Actions</td>
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
        </HeaderTemplate>
        <ItemTemplate>
            <tr>
                <td>
                    <asp:CheckBox ID="chkEdit" runat="server" Checked="False" OnCheckedChanged="chkEdit_CheckedChanged" />
                    <input type="hidden" id="txtActionID" runat="server" value='<%# DataBinder.Eval(Container.DataItem, "actionid") %>' />
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
