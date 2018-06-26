<%@ Page Language="C#" Debug="true" MasterPageFile="~/UWAC.master" AutoEventWireup="true" CodeFile="GeneEvents_upload.aspx.cs" Inherits="Genetics_GeneEvents_upload"
    EnableEventValidation="false" Title="Gene Events Upload" %>
 <%@ MasterType VirtualPath="~/UWAC.master" %>

<asp:Content ID="Content1"  ContentPlaceHolderID="oBodyPlaceHolder" runat="server" >

           <asp:ScriptManager ID="ScriptManager1" runat="server" EnablePartialRendering="true"      >
    </asp:ScriptManager>

    <br />

<%--        <form id="form1" runat="server">--%>
    <asp:Panel ID="Panel1" runat="server">
        <asp:Label ID="dbinfo" runat="server"></asp:Label>
        <br />
        <asp:FileUpload ID="FileUpload1" runat="server" />
        <asp:Button ID="btnUpload" runat="server" Text="Upload" OnClick="btnUpload_Click" />
        <br />
        <asp:Label ID="lblMessage" runat="server" Text=""></asp:Label>
    </asp:Panel>

    <asp:Panel ID="Panel2" runat="server" Visible = "false"  >
        <asp:Label ID="Label5" runat="server" Text="File Name"/>
        <asp:Label ID="lblFileName" runat="server" Text=""/>
        <br />
        <asp:Label ID="Label2" runat="server" Text="Select Sheet" />
        <asp:DropDownList ID="ddlSheets" runat="server" AppendDataBoundItems = "true"></asp:DropDownList>
        <br />
        <asp:Label ID="Label3" runat="server" Text="Enter Source Table Name"/>
        <asp:TextBox ID="txtTable" runat="server"></asp:TextBox>
        <br />
        <asp:Label ID="Label1" runat="server" Text="Has Header Row?"></asp:Label>
        <br />
        <asp:RadioButtonList ID="rbHDR" runat="server">
            <asp:ListItem Text = "Yes" Value = "Yes" Selected = "True" ></asp:ListItem>
            <asp:ListItem Text = "No" Value = "No"></asp:ListItem>
        </asp:RadioButtonList>
        <br />
        <asp:Button ID="btnSave" runat="server" Text="Save" OnClick="btnSave_Click" />
        <asp:Button ID="btnCancel" runat="server" Text="Cancel" OnClick="btnCancel_Click" />        
     </asp:Panel>
   <%-- </form>--%>
    
    </asp:Content>