<%@ Page Language="c#" Debug="true" MasterPageFile="~/UWAC.master" CodeFile="TadpoleTXlog_list.aspx.cs" AutoEventWireup="true"
 Inherits="TadpoleTXlog_list" Title="Tadpole TX Log List" %>
 <%@ MasterType VirtualPath="~/UWAC.master" %>



<asp:Content ID="Content1"  ContentPlaceHolderID="oBodyPlaceHolder" runat="server">
<style> .styleTBD   {   font: 8pt verdana;   font-weight:100;   color:SteelBlue;   outline-color:gray;}  </style>
<style> .styleData   {   font: 8pt verdana;   font-weight:100;   color:Green;   outline-color:gray;}  </style>
<style> .styleNA   {   font: 8pt verdana;   font-weight:100;   color:gray; outline-color:gray;    }  </style>
<style> .rowstyleAction   {   background-color:gray;  } </style>  
<style> .right_align { text-align: right; }  </style>
<style> .DataDictCell   { border-color:Gray;   font: 8pt verdana;   font-weight:100; border-width:thin;  color:black; outline-color:gray;    }  </style>

    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

 <table id="tblmyinfo" runat="server" width="100%">
 <tr><td font-color="red"></td></tr>
 </table>

     <br /><br />
    <asp:Label ID="lbl1" runat="server" Text = "Check Totals between Weekly Records by Therapist & those Restructured By Subject" Font-Size="Medium" ForeColor="Navy" Font-Bold="true"></asp:Label>
    <br />
    <asp:Panel ID="Panel1" runat="server">
    </asp:Panel>  


    <br /> <br />
    <asp:Label ID="lbl" runat="server" Text="Tadpole TX Log List of Entered Data" Font-Size="Medium" Font-Bold="True"></asp:Label>

    <br />
   


    <br/><br/>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
    <ContentTemplate>
        <asp:Label ID="lblSortLabel" runat="server" Text="Sort by:" ></asp:Label>
    <asp:DropDownList ID="ddlSort" runat="server" OnSelectedIndexChanged="ResortGrid" AutoPostBack="true">
        <asp:ListItem Text = "1) Clin, Date DESC" Value="1) Clin, Date DESC"></asp:ListItem>
       <asp:ListItem Text = "2) Clin, Date ASC"  Value="2) Clin, Date ASC" ></asp:ListItem>
       <asp:ListItem Text = "3) Date DESC, Clin" Value="3) Date DESC, Clin"></asp:ListItem>
       <asp:ListItem Text = "4) Date ASC, Clin"  Value="4) Date ASC, Clin" ></asp:ListItem>
    </asp:DropDownList>

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Label ID="Label1" runat="server" Text="Select site:" ></asp:Label>
    <asp:DropDownList ID="ddlSite" runat="server" OnSelectedIndexChanged="ResortGrid" AutoPostBack="true">
        <asp:ListItem Text = "All sites" Value="All sites"></asp:ListItem>
       <asp:ListItem Text = "MIND"  Value="MIND" ></asp:ListItem>
       <asp:ListItem Text = "UW" Value="UW"></asp:ListItem>
       <asp:ListItem Text = "VU"  Value="VU" ></asp:ListItem>
    </asp:DropDownList>


    </ContentTemplate>
    <Triggers>
    <asp:PostBackTrigger ControlID="ddlSort" />
    <asp:PostBackTrigger ControlID="ddlSite" />
    </Triggers>
    </asp:UpdatePanel>


    <br/><br/>

    <asp:GridView ID="GridView1" runat="server" AllowSorting="true" AutoGenerateColumns="false" DataSourceID="sql_TXlog" Font-Size="Smaller" OnRowDataBound="gv_RowDataBound" OnRowCommand="gv_RowCommand"  
     >
    <Columns>
    <asp:HyperLinkField DataNavigateUrlFields="DElink" Text="Edit" ItemStyle-Width = "100px" />
    <asp:TemplateField SortExpression>
        <HeaderTemplate>ttl_pk</HeaderTemplate>
        <ItemTemplate>
                    <asp:Label ID="lbl_ttl_pk" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "ttl_pk") %>' ForeColor="Gray"></asp:Label>
        </ItemTemplate></asp:TemplateField>
    <asp:BoundField DataField="ID"  HeaderText="ID"/>

        <asp:TemplateField ItemStyle-HorizontalAlign="Center">
        <HeaderTemplate>Missing Info</HeaderTemplate>
        <ItemTemplate>
        <asp:Label ID="lbl_ttl_scrmsg" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "ttl_scrmsg") %>' ForeColor="Gray"></asp:Label>
    </ItemTemplate></asp:TemplateField>

    <asp:BoundField DataField="ClinName" HeaderText="ClinName"/>
    <asp:BoundField DataField="TxLog_Date" HeaderText="TxLog_Date"/>
    
    <asp:TemplateField ItemStyle-HorizontalAlign="Center">
        <HeaderTemplate># Days since<br />prev entry</HeaderTemplate>
        <ItemTemplate>
        <asp:Label ID="lbl_days_since_prev" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "days_since_prev") %>'  ></asp:Label>
    </ItemTemplate></asp:TemplateField>
    

    <asp:BoundField DataField="Tot_TX_Hrs_for_Wk" HeaderText="Tot TX Hrs for wk" ItemStyle-BackColor="AliceBlue"  ItemStyle-HorizontalAlign="Center" ItemStyle-Font-Bold="true"/>

        <asp:TemplateField ItemStyle-HorizontalAlign="Center">
        <HeaderTemplate>Reason Zero Hrs</HeaderTemplate>
        <ItemTemplate>
        <asp:Label ID="lbl_zero" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "ttl_ZeroHrs") %>'  ></asp:Label>
    </ItemTemplate></asp:TemplateField>
    
        
        <asp:TemplateField ItemStyle-HorizontalAlign="Center">
        <HeaderTemplate>STAFF<br />Missed Hrs</HeaderTemplate>
        <ItemTemplate>
        <asp:Label ID="lbl_miss1" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "Staff_MISSED_Hrs_for_Wk") %>'  ></asp:Label>
    </ItemTemplate></asp:TemplateField>
    
    
        <asp:TemplateField ItemStyle-HorizontalAlign="Center">
        <HeaderTemplate>FAMILY<br />Missed Hrs</HeaderTemplate>
        <ItemTemplate>
        <asp:Label ID="lbl_miss2" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "Family_MISSED_Hrs_for_Wk") %>' ></asp:Label>
    </ItemTemplate></asp:TemplateField>
    
    
        <asp:TemplateField ItemStyle-HorizontalAlign="Center">
        <HeaderTemplate>HOLIDAY<br />Missed Hrs</HeaderTemplate>
        <ItemTemplate>
        <asp:Label ID="lbl_miss3" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "Holiday_MISSED_Hrs_for_Wk") %>'  ></asp:Label>
    </ItemTemplate></asp:TemplateField>
    

    <asp:TemplateField ItemStyle-HorizontalAlign="Center">
        <HeaderTemplate>Subject Logging Status</HeaderTemplate>
        <ItemTemplate>
        <asp:Label ID="lbl_status" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "SubjectLoggingStatus") %>' ></asp:Label>
    </ItemTemplate></asp:TemplateField>



<%--    <asp:TemplateField>
    <ItemTemplate>
        <asp:Button ID="btnLogIt" runat="server" Font-Size="X-Small" Text="Log it"  CommandName="LogTo_BySubj" CommandArgument='<%# DataBinder.Eval(Container.DataItem, "ttl_pk") %>' />
    </ItemTemplate>
    </asp:TemplateField>--%>

    </Columns>
    </asp:GridView>



    <br />
    <br />



         <br /><br />
 <%--   <asp:Label ID="Label1" runat="server" Text = "All Individual Records Restructured By Subject" Font-Size="Medium" Font-Bold="true" Font-Underline="true"></asp:Label>
    <br />
    <br />--%>
    

    
<%--    <br/><br/>
    <asp:UpdatePanel ID="UpdatePanel2" runat="server">
    <ContentTemplate>
        <asp:Label ID="Label2" runat="server" Text="Sort by:" ></asp:Label>
    <asp:DropDownList ID="ddlSort2" runat="server" OnSelectedIndexChanged="ResortGrid2" AutoPostBack="true">
        <asp:ListItem Text = "1) Clin, Date DESC" Value="1) Clin, Date DESC"></asp:ListItem>
       <asp:ListItem Text = "2) Clin, Date ASC"  Value="2) Clin, Date ASC" ></asp:ListItem>
       <asp:ListItem Text = "3) Date DESC, Clin" Value="3) Date DESC, Clin"></asp:ListItem>
       <asp:ListItem Text = "4) Date ASC, Clin"  Value="4) Date ASC, Clin" ></asp:ListItem>
    </asp:DropDownList>

    </ContentTemplate>
    <Triggers>
    <asp:PostBackTrigger ControlID="ddlSort2" />
    </Triggers>
    </asp:UpdatePanel>--%>


    <asp:Panel ID="Panel2" runat="server">
    </asp:Panel>  


<asp:SqlDataSource ID="sql_TXlog" runat="server" SelectCommandType="StoredProcedure"  
    SelectCommand="spTadpoleTXlog_list"  
    ConnectionString="<%$ ConnectionStrings: TRACKING_CONN_STRING %>" >
    <SelectParameters>
    <asp:ControlParameter ControlID="ddlSort" Name="sort_method" PropertyName="SelectedValue" />
    <asp:ControlParameter ControlID="ddlSite" Name="ID" PropertyName="SelectedValue" />
    </SelectParameters>
   </asp:SqlDataSource>  
   

</asp:Content>


