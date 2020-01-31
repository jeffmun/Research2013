<%@ Page Title="" Language="C#" MasterPageFile="~/UWAC.master" AutoEventWireup="true" CodeFile="NDARdict.aspx.cs" Inherits="NDAR_NDARdict"
    EnableEventValidation="false"  %>
 <%@ MasterType VirtualPath="~/UWAC.master" %>

<%@ Register Assembly="DevExpress.Web.v19.1, Version=19.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.ASPxPivotGrid.v19.1, Version=19.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxPivotGrid" TagPrefix="dx" %> 


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
                <asp:Panel ID="Panel_dataElements" runat="server"  >  
  


                        <dx:ASPxGridView ID="griddataElements" runat="server" AutoGenerateColumns="false" EnableViewState="true" OnHtmlRowPrepared="griddataElements_OnHtmlRowPrepared" 
                                  Settings-VerticalScrollBarMode="Visible" Settings-VerticalScrollableHeight="600" KeyFieldName="name"
                              Settings-HorizontalScrollBarMode="Visible" Width="1000">
                                 <SettingsPager Mode="ShowAllRecords"></SettingsPager>
                            <Columns>
                                <dx:GridViewDataColumn Caption="Required" FieldName="required" Width="50" FixedStyle="Left"/>
                                <dx:GridViewDataColumn Caption="Pos" FieldName="position" Width="40" FixedStyle="Left" />
                                <dx:GridViewDataColumn Caption="Name" FieldName="name"  FixedStyle="Left"/>
                                <dx:GridViewDataColumn Caption="UWfldpos" Width="40" FixedStyle="Left">
                                    <DataItemTemplate>
                                        <asp:TextBox ID="txtUWfld" runat="server" Width="30px" EnableViewState="true" ></asp:TextBox>
                                        
                                    </DataItemTemplate>
                                </dx:GridViewDataColumn>
                                <dx:GridViewDataColumn Caption="UW Fld" FieldName="uwfld" FixedStyle="Left"/>
                                <dx:GridViewDataColumn Caption="fx" FieldName="fx" />
                                <dx:GridViewDataColumn Caption="params" FieldName="params" />
                                <dx:GridViewDataColumn Caption="Type" FieldName="type" Width="60"/>
                                <dx:GridViewDataColumn Caption="Size" FieldName="size" Width="40" />
                                <dx:GridViewDataColumn Caption="Description" FieldName="description" Width="400px" />
                                <dx:GridViewDataColumn Caption="Value Range" FieldName="valueRange" />
                                <dx:GridViewDataColumn Caption="Notes" FieldName="notes" Width="400" />
                <%--                <asp:BoundField HeaderText="dataElementId" DataField="dataElementId" />--%>
                            </Columns>
                        </dx:ASPxGridView>   
                   </asp:Panel>
                </td>
                <td width="20px"></td>
            <td style="vertical-align:top" colspan="2">
                <asp:Panel ID="Panel_UWtable" runat="server" Visible ="false" >


                    <dx:ASPxGridView ID="gridUWtable" runat="server" AutoGenerateColumns="false" EnableViewState="true" OnHtmlRowPrepared="gridUWtable_OnHtmlRowPrepared"
                                   Settings-VerticalScrollBarMode="Visible" Settings-VerticalScrollableHeight="600">
                                 <SettingsPager Mode="ShowAllRecords"></SettingsPager>
                        <Columns>
                            <dx:GridViewDataColumn Caption="Pos" FieldName="ord_pos" Width="45" />
                            <dx:GridViewDataColumn Caption="Field" FieldName="fldname"  Width="100"/>
                            <dx:GridViewDataColumn Caption="DataType" FieldName="FieldDataType" Width="55"/>
                            <dx:GridViewDataColumn Caption="Label" FieldName="FieldLabel" Width="350px"/>
                            <dx:GridViewDataColumn Caption="Value Labels" FieldName="valuelabels"  Width="150"/>
                            <dx:GridViewDataColumn Caption="validlist" FieldName="ValidList" Width="100" />

                        </Columns>
                    </dx:ASPxGridView>


                </asp:Panel>

            </td>
            </tr>
        </table>


    </asp:Panel>


 


    <br /><br /><br />

    <asp:Label ID="lblmatched" runat="server" Font-Size="Medium" Text="Matched Fields" Font-Bold="true"></asp:Label>    <br />
    <dx:ASPXGridView ID="gridMatched" runat="server" ClientInstanceName="gridMatched" EnableViewState="true" Styles-AlternatingRow-BackColor="WhiteSmoke">
        <Columns>
            <dx:GridViewDataColumn FieldName="shortname"></dx:GridViewDataColumn>
            <dx:GridViewDataColumn FieldName="position"></dx:GridViewDataColumn>
            <dx:GridViewDataColumn FieldName="ndar_name"></dx:GridViewDataColumn>
            <dx:GridViewDataColumn FieldName="ndar_description"></dx:GridViewDataColumn>
            <dx:GridViewDataColumn FieldName="ord_pos"></dx:GridViewDataColumn>
            <dx:GridViewDataColumn FieldName="fldname"></dx:GridViewDataColumn>
            <dx:GridViewDataColumn FieldName="fieldlabel"></dx:GridViewDataColumn>
            <dx:GridViewDataColumn FieldName="diff_labels"></dx:GridViewDataColumn>
        </Columns>
        <SettingsPager Mode="ShowAllRecords"></SettingsPager>
    </dx:ASPXGridView>

    <asp:GridView ID="gvTest" runat="server" Visible="false"></asp:GridView>
    <br />

    

</asp:Content>

