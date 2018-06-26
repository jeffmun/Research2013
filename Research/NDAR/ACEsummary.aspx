<%@ Page Language="c#" Debug="true"  EnableEventValidation="false" MasterPageFile="~/UWAC.master" CodeFile="ACEsummary.aspx.cs" AutoEventWireup="true"
 Inherits="NDAR_ACEsummary" Title="NDAR: ACE Summary"  %>
 <%@ MasterType VirtualPath="~/UWAC.master" %>



<asp:Content ID="Content1"  ContentPlaceHolderID="oBodyPlaceHolder" runat="server">
<br /><br />
    <asp:Label ID="Label1" runat="server" Text="NDAR: ACE Summary" Font-Bold="true" Font-Size="Medium" Font-Underline="true"></asp:Label>
<br /><br />
    <asp:GridView ID="GridView1" runat="server" DataSourceID="sqlACEsummary" AutoGenerateColumns="true" CssClass="tblInput" BorderColor="Silver">
    </asp:GridView>

    <asp:SqlDataSource ID="sqlACEsummary" runat="server" SelectCommandType="text"  
    SelectCommand="select * from vwNDAR_ACE_SUMMARY order by studyname, ndar_view_status"  
    ConnectionString="<%$ ConnectionStrings: DATA_CONN_STRING %>">
   </asp:SqlDataSource>  


</asp:Content>