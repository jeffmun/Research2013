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

 <table id="tblmyinfo" runat="server" width="100%">
 <tr><td font-color="red"></td></tr>
 </table>


    <br /> <br />
    <asp:Label ID="lbl" runat="server" Text="Tadpole TX Log List of Entered Data" Font-Size="Medium" Font-Bold="True"></asp:Label>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:HyperLink ID="HyperLink1" runat="server" Text="Go to Summary Report" Font-Size="Smaller" NavigateUrl="https://uwac.autism.washington.edu/research/Info/TadpoleTXlog_REPORT.aspx"></asp:HyperLink>
    


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
        <HeaderTemplate># rows<br />Missing ApptType</HeaderTemplate>
        <ItemTemplate>
        <asp:Label ID="lbl_miss_appttype" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "N_rows_Missing_ApptType") %>'  ></asp:Label>
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


    
<asp:SqlDataSource ID="sql_TXlog" runat="server" SelectCommandType="StoredProcedure"  
    SelectCommand="spTadpoleTXlog_list"  
    ConnectionString="<%$ ConnectionStrings: TRACKING_CONN_STRING %>">
   </asp:SqlDataSource>  
   

</asp:Content>


