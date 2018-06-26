<%@ Page Title="" Language="C#" EnableEventValidation="false" MasterPageFile="~/UWAC.master" AutoEventWireup="true" CodeFile="v1.aspx.cs" Inherits="Valent_v1" %>
<%@ MasterType VirtualPath="~/UWAC.master" %>

<%@ Register Assembly="Obout.Ajax.UI" Namespace="Obout.Ajax.UI.HTMLEditor.ToolbarButton" TagPrefix="obout" %>
<%@ Register Assembly="Obout.Ajax.UI" Namespace="Obout.Ajax.UI.HTMLEditor" TagPrefix="obout" %> 
<%@ Register TagPrefix="obout" Namespace="Obout.SuperForm" Assembly="obout_SuperForm" %> 
<%@ Register TagPrefix="obout" Namespace="Obout.ListBox" Assembly="obout_ListBox" %> 

<asp:Content ID="Content1" ContentPlaceHolderID="oBodyPlaceHolder" Runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server" EnablePartialRendering="true"></asp:ScriptManager>

    <br />

    <table>
        <tr>
            <td>
    <obout:Grid ID="gridCPT" runat="server" AutoGenerateColumns="false"  CallbackMode="true" AllowAddingRecords="true" 
         AutoPostBackOnSelect="true" KeepSelectedRecords="true" AllowPaging="false"
         AllowPageSizeSelection="false" OnRebind="gridCPT_Rebind"
         OnUpdateCommand="gridCPT_UpdateCommand" OnInsertCommand="gridCPT_InsertCommand" PageSize="-1">
        <AddEditDeleteSettings AddLinksPosition="Bottom" />
        <Columns>
            <obout:Column DataField="pk" Visible="false"></obout:Column>
            <obout:Column DataField="CPTcode" AllowEdit="false" ></obout:Column>
            <obout:Column DataField="ServiceTypeID" >
                <TemplateSettings TemplateId="t0" EditTemplateId="t1" />
            </obout:Column>
            <obout:CheckBoxColumn DataField="isVisit" ></obout:CheckBoxColumn>
            <obout:Column DataField=""  AllowEdit="true" AllowDelete="true" ></obout:Column>
        </Columns>
        <Templates>
        <obout:GridTemplate runat="server" ID="t0" >
            <Template>
                <asp:Label ID="foo" runat="server" Text='<%# Container.DataItem["ServiceType"]%>'></asp:Label>
            </Template>
        </obout:GridTemplate>

            <obout:GridTemplate ID="t1" runat="server" ControlID="ddlServiceTypeID" ControlPropertyName="value" >
		        <Template>
			        <asp:DropDownList runat="server" ID="ddlServiceTypeID" DataSourceID="servicetype"
			            DataValueField="servicetypeID" DataTextField="servicetype" 
			            CssClass="ob_gEC"/>
                </Template>



            </obout:GridTemplate>
        </Templates>
    </obout:Grid>

            </td>
    <td style="vertical-align:top">


    <obout:Grid ID="gridServiceType" runat="server" AllowAddingRecords="true" 
        AutoGenerateColumns="false" DataSourceID="servicetype" AllowPageSizeSelection="false" PageSize="-1"
         OnInsertCommand="gridServiceType_InsertCommand">
        
        <Columns>
            <obout:Column DataField="servicetypeID" ReadOnly="true"></obout:Column>
            <obout:Column DataField="servicetype"></obout:Column>
        </Columns>

    </obout:Grid>
        
    </td>
    </tr>
    </table>



        <asp:SqlDataSource ID="cpt" runat="server" SelectCommandType="Text" 
             ConnectionString="<%$ ConnectionStrings:TRACKING_CONN_STRING %>"
                SelectCommand="select * from ac.enumCPT">
        </asp:SqlDataSource>

            <asp:SqlDataSource ID="servicetype" runat="server" SelectCommandType="Text" 
             ConnectionString="<%$ ConnectionStrings:TRACKING_CONN_STRING %>"
                SelectCommand="select * from ac.enumServiceType"
                >
        </asp:SqlDataSource>



    </asp:Content>