<%@ Page Title="" Language="C#" MasterPageFile="~/UWAC.master" AutoEventWireup="true" CodeFile="NDARapi.aspx.cs" Inherits="NDAR_NDARapi"
    EnableEventValidation="false"  %>
 <%@ MasterType VirtualPath="~/UWAC.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="oBodyPlaceHolder" Runat="Server">


    <br />    
    <asp:Label ID="lblInfo" runat="server" Text="" ForeColor="Magenta"></asp:Label>
    <br />
    <table>
        <tr>
            <td>
                <asp:Label ID="Label1" runat="server" Text="Search:"></asp:Label>
                <asp:TextBox ID="txtWhere" runat="server" Text=""></asp:TextBox>
            </td>
            <td>
                <asp:Button ID="btnSearchDS" runat="server" Text="Search" OnClick="btnSearchDS_Click" />
            </td>
            <td style="width: 300px">
                <asp:CheckBox ID="chkUWview" runat="server" Checked="true" Text="Only those with UW view" /><br />
                <asp:CheckBox ID="chkInStudy" runat="server" Checked="true" Text="Only those this study" />
            </td>
            <td style="width: 250px">
                    <asp:Button ID="btnSave" runat="server" Text="Re-import NDAR Data Structures" OnClick="btnSave_Click" Enabled="false" />

            </td>
            <td>
                <asp:Label ID="lblInstructions" runat="server" Text="Instructions:" Font-Bold="true" Font-Size="XX-Small"></asp:Label>
                <br />
                <asp:Label ID="lblInstructions2" runat="server" Width="400"  Font-Size="XX-Small"
                    Text="These are the measures to be submitted to NDAR.<br/>The <b>View Data</b> link will display & create the data files.<br/>The <b>Define flds</b> link is where you create the definitions that will convert our data to NDAR-compliant format." ></asp:Label>
                <br />
                <asp:Label ID="lblInstructions3" runat="server" Width="400"  Font-Size="XX-Small" Font-Italic="true"
                    Text="The NDAR data files are produced dynamically based on information that defines how fields in this DB are to be transformed for NDAR."></asp:Label>
            </td>
        </tr>
    </table>

    <br /><br />
    <asp:Panel ID="Panel_DataStructureList" runat="server">
        <asp:Label ID="lblN" runat="server" Text="" Font-Bold="true" Font-Size="Medium"></asp:Label>
         <asp:GridView ID="gvScroll" runat="server"  Width="80%" AutoGenerateColumns="false" OnRowCommand="gvScroll_RowCommand" OnRowDataBound="gvScroll_RowDataBound"  
        HeaderStyle-CssClass="GridviewScrollHeader" RowStyle-CssClass="GridviewScrollItem" PagerStyle-CssClass="GridviewScrollPager" >
             <Columns>
                 <asp:BoundField  HeaderText="# Fields" DataField="n_flds" />
                 <asp:BoundField  HeaderText="# UW Fields" DataField="n_uwflds" />
                 <asp:TemplateField>
                     <HeaderTemplate>Import Fields</HeaderTemplate>
                     <ItemTemplate>                    
                         <asp:Button ID="btnImportFlds" runat="server" Text="Import flds" Font-Size="XX-Small" CommandName="Import flds"
                             CommandArgument='<%# Eval("shortName") %>'  />
                     </ItemTemplate>
                 </asp:TemplateField>
                 <asp:BoundField  HeaderText="UW Table" DataField="uwtable" />
<%--                 <asp:HyperLinkField HeaderText="Short Name (click to view)" DataNavigateUrlFields='<%# "NDARdict.aspx?shortName=" + Eval("shortName")%>'
                       DataTextField="shortName" Target="_blank" />
                 <asp:HyperLinkField HeaderText="View" DataNavigateUrlFields='<%# "NDARview.aspx?shortName=" + Eval("shortName")%>'
                       Text="view" Target="_blank" />--%>
<%--                 <asp:HyperLinkField HeaderText="View def" DataNavigateUrlFields="dict_url"  DataTextField="shortName" Target="_blank" />--%>

                 <asp:TemplateField  HeaderText="View Data">
                     <ItemTemplate>
                         <asp:HyperLink ID="linkView" runat="server" NavigateUrl='<%# "NDARview.aspx?shortName=" + Eval("shortName")%>' Text="view" Target="_blank"></asp:HyperLink>
<%--                         <asp:LinkButton ID="linkView" runat="server" PostBackUrl='<%# "NDARview.aspx?shortName=" + Eval("shortName")%>' Text="view" ></asp:LinkButton>--%>
                     </ItemTemplate>                     
                 </asp:TemplateField>
                 <asp:TemplateField  HeaderText="Define flds">
                     <ItemTemplate>
                        <asp:HyperLink ID="linkDict" runat="server" NavigateUrl='<%# "NDARdict.aspx?shortName=" + Eval("shortName")%>' Text="define" Target="_blank"></asp:HyperLink>

<%--                         <asp:LinkButton ID="linkDict" runat="server" PostBackUrl='<%# "NDARdict.aspx?shortName=" + Eval("shortName")%>' Text="define"></asp:LinkButton>--%>
                     </ItemTemplate>                     
                 </asp:TemplateField>

                 <asp:BoundField  HeaderText="shortName" DataField="shortName" />
                 <asp:BoundField  HeaderText="Title" DataField="title" />
                 <asp:BoundField  HeaderText="Data Type" DataField="datatype" />
                 <asp:BoundField  HeaderText="Status" DataField="status" />
                 <asp:BoundField  HeaderText="Published" DataField="publishDate" />

             </Columns>

        </asp:GridView>

    </asp:Panel>


    <asp:Panel ID="Panel_Details" runat="server" Visible="false">
    <table>
        <tr>
            <td><asp:Label ID="l1" runat="server" Text ="shortName:"></asp:Label></td>
            <td><asp:Label ID="v1" runat="server"  Font-Bold="true" Font-Size="Large"></asp:Label></td>
        </tr>
        <tr>
            <td><asp:Label ID="l2" runat="server" Text ="Title:"></asp:Label></td>
            <td><asp:Label ID="v2" runat="server" Font-Bold="true" Font-Size="Medium"></asp:Label></td>
        </tr>
        <tr>
            <td><asp:Label ID="l3" runat="server" Text ="N Elements:"></asp:Label></td>
            <td><asp:Label ID="v3" runat="server"  Font-Bold="true" Font-Size="Medium"></asp:Label></td>
        </tr>

    </table>

    </asp:Panel>

        <br /><br />
    <asp:Panel ID="Panel_dataElements" runat="server"></asp:Panel>  


    
    <%--    Added for GridViewScroll    see  http://gridviewscroll.aspcity.idv.tw/     
    Note that the other javascript refs are placed in UWAutism.master  --%>
<script type="text/javascript">
    $(document).ready(function () {
        gridviewScroll();
    });

    function gridviewScroll() {
        $('#<%=gvScroll.ClientID%>').gridviewScroll({
            width: $(window).width() - 10,
            height: 800,
            freezesize: 2,
            railcolor: "#F0F0F0",
            barcolor: "#CDCDCD",
            barhovercolor: "#606060",
            bgcolor: "#F0F0F0",
            arrowsize: 30,
            varrowtopimg: "Images/arrowvt.png",
            varrowbottomimg: "Images/arrowvb.png",
            harrowleftimg: "Images/arrowhl.png",
            harrowrightimg: "Images/arrowhr.png",
            headerrowcount: 1,
            railsize: 16,
            barsize: 8

        });
    }
    </script>
<%--end GridViewScroll--%>

</asp:Content>

