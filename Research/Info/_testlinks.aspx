<%@ Page Language="c#" Debug="true" MasterPageFile="~/UWAC.master" CodeFile="_testlinks.aspx.cs" AutoEventWireup="true"
 Inherits="Info__testlinks" Title="_Test Links" %>
 <%@ MasterType VirtualPath="~/UWAC.master" %>


<asp:Content ID="Content1"  ContentPlaceHolderID="oBodyPlaceHolder" runat="server">
 <script src="https://google-code-prettify.googlecode.com/svn/loader/run_prettify.js?lang=sql"></script>

  <table id="tblmyinfo" runat="server" width="100%">
 <tr><td font-color="red"></td></tr>
 </table>

 <table>
<tr><td >
    <asp:Label ID="lblINTRO_studyname" runat="server" Text=" " Font-Size="Medium" Font-Bold="false"></asp:Label>
    <asp:Label ID="lblStudyname_ContentPage" runat="server" Text=" " Font-Size="Medium" Font-Bold="true"></asp:Label>

</td>  </tr>

<tr>
<td>
</td>
</tr>
</table>


    <asp:Panel ID="Panel_gv" runat="server" Visible="true">
    <br />
    <br />
            
    </asp:Panel>



</asp:Content>