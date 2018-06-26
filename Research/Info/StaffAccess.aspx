<%@ Page Language="c#" Debug="true" MasterPageFile="~/UWAC.master" CodeFile="StaffAccess.aspx.cs" AutoEventWireup="True"
 Inherits="Info_StaffAccess" Title="Staff Access Info" %>


<asp:Content ID="Content1"  ContentPlaceHolderID="oBodyPlaceHolder" runat="server">


<asp:GridView ID="Gridview1"  class="tblInputSmall" runat="server" DataSoureceID="SqlDataSource1" AutoGenerateColumns="true" Visible="true" 
   width="600px"   >
</asp:GridView>


<br/><asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource5" DataValueField="staffID" DataTextField = "StaffName"  >
    </asp:DropDownList>
    <asp:Button ID="Button1" runat="server" Text="Refresh" OnClick="btnBindTheData" />
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:Button ID="btnUpdateAD" runat="server" Text="Update AD info" OnClick="btnUpdateADinfo" />

    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:Button ID="btnNewStaff" runat="server" Text="Insert New Staff" OnClick="InsertNewStaff" />


<br/><br/>
<table>
<tr>
<td>
    <asp:Label ID="lblStaffName" runat="server" Text="" Font-Bold="true"></asp:Label>&nbsp is in the following Active Directory<br/>distribution groups:
</td>
<td>Permission has been granted to view the following groups:</td>
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

<asp:SqlDataSource ID="SqlDataSource1" runat="server" SelectCommandType="StoredProcedure"  SelectCommand="spUWAC_AD_by_StaffID"  
   ConnectionString="<%$ ConnectionStrings: TRACKING_CONN_STRING %>">
   <SelectParameters>    <asp:ControlParameter ControlID="DropDownList1" Name="staffID" PropertyName="SelectedValue"  Type="Int16"/>  </SelectParameters>
   </asp:SqlDataSource>    
<asp:SqlDataSource ID="SqlDataSource2" runat="server" SelectCommandType="StoredProcedure"  SelectCommand="spUWAC_ADgroups_by_StaffID"  
   ConnectionString="<%$ ConnectionStrings: TRACKING_CONN_STRING %>">
   <SelectParameters>    <asp:ControlParameter ControlID="DropDownList1" Name="staffID" PropertyName="SelectedValue"  Type="Int16"/>  </SelectParameters>
   </asp:SqlDataSource>    

<asp:SqlDataSource ID="SqlDataSource3" runat="server" SelectCommandType="StoredProcedure"  SelectCommand="spSEC_GetGroups_CanView_by_StaffID"  
   ConnectionString="<%$ ConnectionStrings: TRACKING_CONN_STRING %>">
   <SelectParameters>    <asp:ControlParameter ControlID="DropDownList1" Name="staffID" PropertyName="SelectedValue"  Type="Int16"/>  </SelectParameters>
   </asp:SqlDataSource>    

<asp:SqlDataSource ID="SqlDataSource4" runat="server" SelectCommandType="Text"  SelectCommand="select * from vwDBroles"  
   ConnectionString="<%$ ConnectionStrings: TRACKING_CONN_STRING %>">
   </asp:SqlDataSource>    

<asp:SqlDataSource ID="SqlDataSource5" runat="server" SelectCommandType="Text"  SelectCommand="select * from vwUWAC_AD__list_of_users order by 2"  
   ConnectionString="<%$ ConnectionStrings: TRACKING_CONN_STRING %>">
   </asp:SqlDataSource>    
   
</asp:Content>
