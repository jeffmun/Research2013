<%@ Page Language="c#" Debug="true" MasterPageFile="~/UWAC.master" CodeFile="GUIDinfo.aspx.cs" AutoEventWireup="true"
 Inherits="NDAR_GUIDinfo" Title="NDAR GUID Info" %>
 <%@ MasterType VirtualPath="~/UWAC.master" %>


<asp:Content ID="Content1"  ContentPlaceHolderID="oBodyPlaceHolder" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server" EnablePartialRendering="true"></asp:ScriptManager>
 <script src="https://google-code-prettify.googlecode.com/svn/loader/run_prettify.js?lang=sql"></script>

  <table id="tblmyinfo" runat="server" width="100%">
 <tr><td font-color="red"></td></tr>
 </table>

 <table>
    <tr>
        <td width="500px"  >
            <asp:Label ID="lblINTRO_studyname" runat="server" Text=" " Font-Size="Medium" Font-Bold="false"></asp:Label>
            <asp:Label ID="lblStudyname_ContentPage" runat="server" Text=" " Font-Size="Medium" Font-Bold="true"></asp:Label>
        </td>  
    </tr>
    <tr>
        <td></td>
        <td style="vertical-align:top">
            <asp:Button ID="btnDisplayGUIDFileInfo" runat="server" Text="Display File Info" OnClick="btnDisplayGUIDFileInfo_Click" />
            <asp:Button ID="btnCreateGUIDfile" runat="server" Text="Create File" OnClick="btnCreateGUIDfile_Click" Visible="false" />
            <br />
            <asp:Button ID="btnCancel" runat="server" Text="Cancel" OnClick="btnCancel_Click" ForeColor="DarkRed" Visible="false" />
            </td>
        <td style="vertical-align:top">
            <asp:RadioButtonList ID="rblMode" runat="server" >
                <asp:ListItem Value="new" Text="new GUID" Selected="True"></asp:ListItem>
                <asp:ListItem Value="convert" Text="convert Invalid GUID"></asp:ListItem>
            </asp:RadioButtonList>
        </td>
        <td style="vertical-align:top" style="width: 200px">
            <asp:CheckBox  ID="chkConsent" runat="server" Text ="Use consent info" />
        </td>
        <td>
            <asp:DropDownList ID="ddlPotentialINVALID" runat="server" OnSelectedIndexChanged="ddlPotentialINVALID_SelectedIndexChanged" AutoPostBack="true" ></asp:DropDownList>
            <asp:Button ID="btnAssignINVALID" runat="server" Text="Assign Invalid GUID" OnClick="btnAssignINVALID_Click" Visible="false" />
            <br />
            <asp:Label ID="lbl_nINVleft" runat="server" Text="" Font-Size="XX-Small" Font-Italic="true"></asp:Label>
        </td>
    </tr>
</table>

    <asp:UpdatePanel ID="panelGuidFileInfo" runat="server" UpdateMode="Conditional"></asp:UpdatePanel>

    <br /><br />

    <asp:Panel ID="Panel_gv" runat="server" Visible="true">
    <br />
    <br />
            
    </asp:Panel>



</asp:Content>