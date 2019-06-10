<%@ Page Title="IntHx Weeks >= 40 hrs" Language="C#" MasterPageFile="~/UWAC.master" AutoEventWireup="true" CodeFile="WeeksGTE40.aspx.cs" Inherits="DataEntryForms_Common_MIND_IntHx_v2stack_WeeksGTE40" %>

<%@ MasterType VirtualPath="~/UWAC.master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="oBodyPlaceHolder" Runat="Server">

    <br />
    <asp:Label ID="Label1" runat="server" Text="Intervention Hx - Weeks with 40+ hours of intervention" Font-Bold="true" Font-Size="Medium"></asp:Label>
        <br />
    <br />

    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="false">
        <Columns>
            <asp:TemplateField HeaderText="ID">
                <ItemTemplate>
                    <asp:Hyperlink ID="hyplink1" runat="server"   Text='<%#  DataBinder.Eval(Container.DataItem, "[ID]") %>' 
                         Target="_blank" NavigateUrl='<%#  DataBinder.Eval(Container.DataItem, "[link]") %>' ></asp:Hyperlink>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField ItemStyle-HorizontalAlign="Center" HeaderText="# Weeks" DataField="Nwks" />
            <asp:BoundField ItemStyle-HorizontalAlign="Center" HeaderText="# Weeks >= 40 hrs" DataField="NwksGTE40" />
            <asp:BoundField ItemStyle-HorizontalAlign="Center" HeaderText="# Weeks >= 60 hrs" DataField="NwksGTE60" />
            <asp:BoundField ItemStyle-HorizontalAlign="Center" HeaderText="% Weeks >= 40 hrs" DataField="PctNwksGTE40" DataFormatString="{0:p}" />
            <asp:BoundField ItemStyle-HorizontalAlign="Center" HeaderText="% Weeks >= 60 hrs" DataField="PctNwksGTE60" DataFormatString="{0:p}" />
            <asp:BoundField ItemStyle-HorizontalAlign="Center" HeaderText="Avg hrs/wk" DataField="AvgHrsPerWk" />
            <asp:BoundField ItemStyle-HorizontalAlign="Center" HeaderText="Range hrs/wk" DataField="RangeHrsPerWk" />
        </Columns>
    </asp:GridView>



    
    <br />
    <br />
    <asp:Label ID="Label2" runat="server" Text="Intervention Hx - Weeks with < 40 hours of intervention" Font-Bold="true" Font-Size="Medium"></asp:Label>
        <br />
    <br />

    <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="false">
        <Columns>
            <asp:TemplateField HeaderText="ID">
                <ItemTemplate>
                    <asp:LinkButton ID="LinkButton1" runat="server"   Text='<%#  DataBinder.Eval(Container.DataItem, "[ID]") %>' 
                        PostBackUrl='<%#  DataBinder.Eval(Container.DataItem, "[link]") %>' ></asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField ItemStyle-HorizontalAlign="Center" HeaderText="# Weeks" DataField="Nwks" />
            <asp:BoundField ItemStyle-HorizontalAlign="Center" HeaderText="# Weeks >= 40 hrs" DataField="NwksGTE40" />
            <asp:BoundField ItemStyle-HorizontalAlign="Center" HeaderText="# Weeks >= 60 hrs" DataField="NwksGTE60" />
            <asp:BoundField ItemStyle-HorizontalAlign="Center" HeaderText="Avg hrs/wk" DataField="AvgHrsPerWk" />
            <asp:BoundField ItemStyle-HorizontalAlign="Center" HeaderText="Range hrs/wk" DataField="RangeHrsPerWk" />
        </Columns>
    </asp:GridView>


</asp:Content>

