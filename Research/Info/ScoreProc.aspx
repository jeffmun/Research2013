<%@ Page Language="c#" Debug="true" MasterPageFile="~/UWAC.master" CodeFile="ScoreProc.aspx.cs" AutoEventWireup="true"
 Inherits="Info_ScoreProc" Title="Score Proc" %>
 <%@ MasterType VirtualPath="~/UWAC.master" %>


<asp:Content ID="Content1"  ContentPlaceHolderID="oBodyPlaceHolder" runat="server">
 <script src="https://google-code-prettify.googlecode.com/svn/loader/run_prettify.js?lang=sql"></script>


    <asp:Panel ID="Panel_gv" runat="server" Visible="true">
    <br />
    <br />
            <asp:Label ID="Label1" runat="server" Text="Table Name:" Font-Size="Smaller"  ></asp:Label>
            <asp:Label ID="lblTableName" runat="server" Text="" Font-Size="Medium" Font-Bold="true"></asp:Label>
        <br /><br />
            <asp:Label ID="Label2" runat="server" Text="Scoring Proc Name:" Font-Size="Smaller"  ></asp:Label>
            <asp:Label ID="lblspName" runat="server" Text="" Font-Size="Small" Font-Bold="true"></asp:Label>
        <br /><br />    
            <asp:Label ID="Label3" runat="server" Text="Length:" Font-Size="Smaller"  ></asp:Label>
            <asp:Label ID="lblLength" runat="server" Text="" Font-Size="Small" Font-Bold="true"></asp:Label>
<br />
<br />

        <asp:GridView ID="gv_ScoreProc" runat="server" AutoGenerateColumns="false" GridLines="None">
        <Columns>
        <asp:TemplateField>

        <HeaderTemplate>
            
        
        </HeaderTemplate>

        <ItemTemplate><pre class="prettyprint"><code class="language-r">
            <asp:Literal ID="lbl_spText" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "spTextHTML")  %>'   ></asp:Literal>
            </pre>
        </ItemTemplate>
        </asp:TemplateField>
        </Columns>
        </asp:GridView>
    </asp:Panel>



</asp:Content>