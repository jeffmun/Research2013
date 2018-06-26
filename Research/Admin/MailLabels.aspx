<%@ Page Title="" Language="C#" MasterPageFile="~/UWAC.master" AutoEventWireup="true" CodeFile="MailLabels.aspx.cs" Inherits="Admin_MailLabels" %>
  <%@ MasterType VirtualPath="~/UWAC.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="oBodyPlaceHolder" Runat="Server">

    <br />
    <asp:Label ID="lbl1" runat="server" Text="Mailing Labels: " Font-Bold="true" Font-Size="12"></asp:Label>
    <asp:Label ID="lblStudy" runat="server" Text="" Font-Bold="true" Font-Size="14"></asp:Label>
        <br />
    <i>TO DO: Allow users to select options for groups, subject status, use MainContact or Subject names, etc. 
        <br />
        For now this returns the MainContact name and address information for all subjects in the selected study.
    </i>
    <br />
    <br />
    <table>
        <tr>
            <td style="width: 300px">
                <asp:Button ID="btnCreateLabels" runat="server" Text="Create Labels PDF" OnClick="btnCreateLabels_Click" />
                <br />
                <asp:Label ID="Label1" runat="server" Text="This will create a PDF file with 3 columns and 10 rows" Font-Size="9"></asp:Label>
            </td>
            <td style="width: 50px"></td>
            <td style="vertical-align:top">
                <asp:Button ID="btnCreateExcel" runat="server" Text="Create Excel File of Addresses" OnClick="btnCreateExcel_Click"/>
            </td>
        </tr>
    </table>



</asp:Content>

