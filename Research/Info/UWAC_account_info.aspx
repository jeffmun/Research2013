<%@ Page Language="C#" Debug="true" MasterPageFile="~/UWAC.master" AutoEventWireup="true" CodeFile="UWAC_account_info.aspx.cs" 
Inherits="AutismCenterResearch_Info_UWAC_account_info" Title="UWAC Account Info"%>



<asp:Content ID="Content1"  ContentPlaceHolderID="oBodyPlaceHolder" runat="server">

<br />
<br />
    <asp:GridView ID="GridView1" runat="server" DataSourceID="sql_LastUpdated"  AutoGenerateColumns="true" BorderStyle="None" BorderColor="Silver">
    </asp:GridView>

<br />
<br />

    <asp:GridView ID="GridView2" runat="server" DataSourceID="sql_UWACaccountinfo"  AutoGenerateColumns="true" BorderStyle="Solid" BorderWidth="1pt"  BorderColor="Silver"
     RowStyle-BorderWidth="0.5pt" RowStyle-BorderColor="Silver">
    </asp:GridView>

 <asp:SqlDataSource ID="sql_UWACaccountinfo" runat="server"  SelectCommandType="Text" 
    SelectCommand="    select firstname,lastname,emailaddress,accountname,lastLogon,TimeSinceLastLogon from vwUWAC_AD_Unique_users where lastname is not null and lastname <> '' and firstname <> '499'  " 
    ConnectionString="<%$ ConnectionStrings: TRACKING_CONN_STRING %>" >
    </asp:SqlDataSource>


 <asp:SqlDataSource ID="sql_LastUpdated" runat="server" SelectCommandType="Text"
    SelectCommand="select cast(max(updated) as varchar) LastUpdated from UWAC_AD_Users" 
    ConnectionString="<%$ ConnectionStrings: TRACKING_CONN_STRING %>" >
    </asp:SqlDataSource>









</asp:Content>