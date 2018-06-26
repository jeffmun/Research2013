<%@ Page Title="" Language="C#" MasterPageFile="~/UWAC.master" AutoEventWireup="true" CodeFile="NDARdict.aspx.cs" Inherits="NDAR_NDARdict"
    EnableEventValidation="false"  %>
 <%@ MasterType VirtualPath="~/UWAC.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="oBodyPlaceHolder" Runat="Server">

    <style type="text/css">
        .smalltxt {
            font: 8pt verdana;
            font-weight: 100;
            color: red;
            border-color:gainsboro; 
             border-width:thin; 
        }
    </style>

<%--    <style type="text/css"> .ErrorCell   { border-color:White;   font: 8pt verdana;   font-weight:100; border-width:thin;  color:red; }  </style>--%>
    <br />
    <br />
        <asp:Hyperlink ID="LinkButton1" runat="server" NavigateUrl="~/NDAR/NDARapi.aspx" Target="_blank" Text="Return to List of NDAR Measures"></asp:Hyperlink>
<br />
    <asp:Label ID="lblInfo" runat="server" Text=""></asp:Label>
    <asp:Button ID="btnSaveCSV" runat="server" Text="Save To CSV" OnClick="btnSaveCSV_Click" Visible="false" />
    <br />

    <table>
        <tr>
<%--            NDAR fields--%>
            <td style="vertical-align:top">
    <asp:Panel ID="Panel_Details" runat="server" Visible="true">

        <table>
            <tr>
                <td>
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
                        <tr>
                            <td><asp:Label ID="l4" runat="server" Text ="DataDict Source:"></asp:Label></td>
                            <td><asp:Label ID="v4" runat="server"  Font-Bold="true" Font-Size="Small"></asp:Label></td>
                        </tr>
                        <tr>
                            <td><asp:Label ID="l5" runat="server" Text ="NDAR DataDict Link:"></asp:Label></td>
                            <td><asp:DynamicHyperLink ID="dynLink" runat="server" Target="_blank" ></asp:DynamicHyperLink>
                        </tr>
                    </table>

                </td>
                <td>
                    <asp:Label ID="lblFx" runat="server" Text="Fx:" Width="90px"></asp:Label><asp:TextBox ID="txtFx" runat="server" CssClass="smalltxt"></asp:TextBox><br />
                    <asp:Label ID="lblParam1" runat="server" Text="Params:" Width="90px"></asp:Label><asp:TextBox ID="txtParams" runat="server"  CssClass="smalltxt"></asp:TextBox><br />
                    <asp:Label ID="lblFromTo" runat="server" Text="From(-To) Pos:" Width="90px"></asp:Label><asp:TextBox ID="txtFromToPos" runat="server" CssClass="smalltxt"></asp:TextBox><br />

                </td>
                <td>
                    <asp:Button ID="btnSaveFx" runat="server" Text="Save Fx" OnClick="btnSaveFx_Click" Font-Size="XX-Small" />
                    <br /><br />                    
                    <asp:Button ID="btnSaveUWfields" runat="server" Text="Save UW fields"  Font-Size="XX-Small" OnClick="btnSaveUWfields_Click"     />
                    <br /><br />
                    <asp:Button ID="btnClearUWinfo" runat="server" Text="Clear UW info" OnClick="btnClearUWinfo_Click" Font-Size="XX-Small" />
                    

                </td>
                <td width="20px"></td>
                <td>
                    <asp:DropDownList ID="ddlUWtables" runat="server"></asp:DropDownList>
                    <asp:Button ID="btnShowUWtable" runat="server" Text="Show UW Table" Font-Size="XX-Small" OnClick="btnShowUWtable_Click" EnableViewState="true" />
                    <asp:Button ID="btnLinkUWtable" runat="server" Text="Link it" Font-Size="XX-Small" OnClick="btnLinkUWtable_Click" EnableViewState="true" />
                    <br /><br />

                    <asp:Label ID="lblUWtable" runat="server"  Font-Bold="true" Font-Size="Medium"></asp:Label>

                    <%--   HeaderStyle-CssClass="GridviewScrollHeader" RowStyle-CssClass="GridviewScrollItem" PagerStyle-CssClass="GridviewScrollPager"--%>
                </td>
                <td>
                    <asp:Label ID="lblMatchingFields" runat="server"></asp:Label>
                    <asp:Panel ID="panel_UWfldsinfo" runat="server"></asp:Panel>
                    <asp:Button ID="btnLinkMatched" runat="server" Text="Link Matched Fields" OnClick="btnLinkMatched_Click" />
                </td>
            </tr>


                
            <tr>
                <td style="vertical-align:top" colspan="3">
                <asp:Panel ID="Panel_dataElements" runat="server" ScrollBars="Vertical" Height="700px"  >  
                        <asp:GridView ID="gv_dataElements" runat="server" AutoGenerateColumns="false" EnableViewState="true" OnRowDataBound="gv_dataElements_RowDataBound" >
                            <Columns>
                                <asp:BoundField HeaderText="Required" DataField="required" />
                                <asp:BoundField HeaderText="Pos" DataField="position" />
                                <asp:BoundField HeaderText="Name" DataField="name" />
                                <asp:TemplateField HeaderText="UW fld pos">
                                    <ItemTemplate>
                                        <asp:TextBox ID="txtUWfld" runat="server" Width="30px" EnableViewState="true" ></asp:TextBox>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField HeaderText="UW Fld" DataField="uwfld" />
                                <asp:BoundField HeaderText="fx" DataField="fx" />
                                <asp:BoundField HeaderText="params" DataField="params" />
                                <asp:BoundField HeaderText="Type" DataField="type" />
                                <asp:BoundField HeaderText="Size" DataField="size" />
                                <asp:BoundField HeaderText="Description" DataField="description" ItemStyle-Width="400px" />
                                <asp:BoundField HeaderText="Value Range" DataField="valueRange" />
                                <asp:BoundField HeaderText="Notes" DataField="notes" />
                <%--                <asp:BoundField HeaderText="dataElementId" DataField="dataElementId" />--%>
                            </Columns>
                        </asp:GridView>    
                   </asp:Panel>
                </td>
                <td width="20px"></td>
            <td style="vertical-align:top" colspan="2">
                <asp:Panel ID="Panel_UWtable" runat="server" Visible ="false" ScrollBars="Vertical" Height="700px">
                    <asp:GridView ID="gvUWtable" runat="server" AutoGenerateColumns="false" OnRowDataBound="gvUWtable_RowDataBound" >
                        <Columns>
                            <asp:BoundField HeaderText="Pos" DataField="ord_pos" />
                            <asp:BoundField HeaderText="Field" DataField="fldname" />
                            <asp:BoundField HeaderText="DataType" DataField="fielddatatype" />
                            <asp:BoundField HeaderText="Label" DataField="fieldlabel" ItemStyle-Width="350px"/>
                            <asp:BoundField HeaderText="fldvaluesetID" DataField="fieldvaluesetID" />
                            <asp:BoundField HeaderText="validlist" DataField="validlist" />

                        </Columns>
                    </asp:GridView>
                </asp:Panel>

            </td>
            </tr>
        </table>


    </asp:Panel>


    <br />
    <asp:GridView ID="gvTest" runat="server" Visible="false"></asp:GridView>
    <br />

    
    <%--    Added for GridViewScroll    see  http://gridviewscroll.aspcity.idv.tw/     
    Note that the other javascript refs are placed in UWAutism.master  --%>
<%--<script type="text/javascript">
    $(document).ready(function () {
        gridviewScroll1();
    });

    function gridviewScroll1() {
        $('#<%=gv_dataElements.ClientID%>').gridviewScroll({
            width: 1000,
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

        function gridviewScroll2() {
            $('#<%=gvUWtable.ClientID%>').gridviewScroll({
                width: 800,
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
--%>

    

</asp:Content>

