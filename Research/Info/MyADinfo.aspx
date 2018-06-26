<%@ Page Language="c#" Debug="true" MasterPageFile="~/UWAC.master" CodeFile="MyADinfo.aspx.cs" AutoEventWireup="True"
 Inherits="Info_MyADinfo" Title="Info" %>


<asp:Content ID="Content1"  ContentPlaceHolderID="oBodyPlaceHolder" runat="server">


<asp:GridView ID="Gridview1"  class="tblInputSmall" runat="server" DataSoureceID="SqlDataSource1" AutoGenerateColumns="true" Visible="true" 
   width="600px"   >
</asp:GridView>


<br/>
<br/>
<table>
<tr>
<td>You are in the following Active Directory<br/>distribution groups:
</td>
<td>You have permissions to view the following groups:</td>
</tr>
<tr>
<td style="vertical-align:top">
<asp:GridView ID="Gridview2" CssClass = "tblInputSmall" runat="server" DataSoureceID="SqlDataSource2" AutoGenerateColumns="true" Visible="true" 
   width="250px"   >  </asp:GridView>
<br/>
<br/>
<b>KEY to DBrole:</b>
<asp:GridView ID="Gridview4" CssClass = "tblInputSmall_green" runat="server" DataSoureceID="SqlDataSource2" AutoGenerateColumns="true" Visible="true" 
   width="250px"   >  </asp:GridView>
</td>
<td  style="vertical-align:top" >
<asp:GridView ID="Gridview3" CssClass = "tblInputSmall" runat="server" DataSoureceID="SqlDataSource3" AutoGenerateColumns="true" Visible="true" 
   width="600px"   >
</asp:GridView>
</td>
</tr>
<tr>
<td> </td></tr>
</table>

<asp:SqlDataSource ID="SqlDataSource1" runat="server" SelectCommandType="StoredProcedure"  SelectCommand="spUWAC_AD_by_User"  
   ConnectionString="<%$ ConnectionStrings: TRACKING_CONN_STRING %>">
   </asp:SqlDataSource>    
<asp:SqlDataSource ID="SqlDataSource2" runat="server" SelectCommandType="StoredProcedure"  SelectCommand="spUWAC_ADgroups_by_User"  
   ConnectionString="<%$ ConnectionStrings: TRACKING_CONN_STRING %>">
   </asp:SqlDataSource>    

<asp:SqlDataSource ID="SqlDataSource3" runat="server" SelectCommandType="StoredProcedure"  SelectCommand="spSEC_GetGroups_CanView_by_User"  
   ConnectionString="<%$ ConnectionStrings: TRACKING_CONN_STRING %>">
   </asp:SqlDataSource>    

<asp:SqlDataSource ID="SqlDataSource4" runat="server" SelectCommandType="Text"  SelectCommand="select * from vwDBroles"  
   ConnectionString="<%$ ConnectionStrings: TRACKING_CONN_STRING %>">
   </asp:SqlDataSource>    
   
</asp:Content>
