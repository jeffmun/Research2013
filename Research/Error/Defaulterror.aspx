<%@ Page Language="c#"   Debug="true" MasterPageFile="~/UWAC.master" CodeFile="Defaulterror.aspx.cs" AutoEventWireup="true"
 Inherits="Error_Defaulterror" Title="Error"      %>  

<%@ MasterType VirtualPath="~/UWAC.master" %>


<asp:Content ID="Content1"  ContentPlaceHolderID="oBodyPlaceHolder" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server" EnablePageMethods="true"  EnablePartialRendering="true"></asp:ScriptManager>

    <br />
    <asp:Label id="lbl1" runat="server" Text="Unfortunately, there has been an error.  :(" Font-Size="Large" ></asp:Label>  <br /><br />

        <asp:Label id="lbl2" runat="server" Text="An email has been sent to both of us that contains all the ugly details.<br/><br />However, I want to help ASAP (if at all possible, right now)"
             Font-Size="Medium"></asp:Label>
    <br />
    <asp:Label id="lbl3" runat="server" Text="so feel free to call or text me at 425-478-0920." Font-Size="Medium" Font-Bold="true"></asp:Label><br />
    <asp:Label id="Label1" runat="server" Text="  If at all possible I will answer right away!" Font-Size="Medium" Font-Bold="false"></asp:Label>
    
    </br>
    - Jeff Munson

    </br>
    </br>


</asp:Content>