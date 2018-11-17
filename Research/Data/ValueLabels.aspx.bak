<%@ Page Language="c#"   Debug="true" MasterPageFile="~/UWAC.master" CodeFile="ValueLabels.aspx.cs" AutoEventWireup="true"
 Inherits="Data_ValueLabels" Title="Value Labels"      %>  

<%@ MasterType VirtualPath="~/UWAC.master" %>

<%@ Register Assembly="DevExpress.Web.v18.1, Version=18.1.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.ASPxPivotGrid.v18.1, Version=18.1.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxPivotGrid" TagPrefix="dx" %> 

<asp:Content ID="HeadContent" runat="server" ContentPlaceHolderID="headContent" Visible="true">
 
</asp:Content>



<asp:Content ID="Content1"  ContentPlaceHolderID="oBodyPlaceHolder" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server" EnablePageMethods="true"  EnablePartialRendering="true"></asp:ScriptManager>

    <script type="text/javascript">
        var command = "";
        function OnBeginCallbackGridVarlabels(s,e) {
            command = e.command;
        } 

        function OnEndCallbackGridVarlabels(s, e) {
            if (command == "UPDATEEDIT")
                gridVallabels.Refresh();            
        }

    </script>

    <asp:HiddenField ID="hidFieldValueSetID" runat="server" />

    <br />

    <dx:ASPxLabel ID="lblVarlabels" runat="server" Text="Value labels: " Font-Bold="false" Font-Size="Small"></dx:ASPxLabel>
    <dx:ASPxLabel ID="lblName" runat="server" Text="Value labels" Font-Bold="true" Font-Size="Small"></dx:ASPxLabel>
    <br />

<%--    OnCustomCallback="gridVallabels_CustomCallback"--%>

     <dx:ASPxGridView ID="gridVallabels" ClientInstanceName="gridVallabels" runat="server" KeyFieldName="pk"
          SettingsDataSecurity-AllowEdit="true"  SettingsDataSecurity-AllowDelete="true" SettingsDataSecurity-AllowInsert="true"
         OnBatchUpdate="gridVallabels_BatchUpdate" >
         <SettingsEditing Mode="Batch" BatchEditSettings-StartEditAction="Click" />
         <ClientSideEvents BeginCallback="OnBeginCallbackGridVarlabels" EndCallback="OnEndCallbackGridVarlabels" />
         <Columns>
               <dx:GridViewCommandColumn ShowNewButtonInHeader="true" ShowDeleteButton="true" Width="50" />
            <dx:GridViewDataColumn FieldName="pk" ReadOnly="true" Visible="false"></dx:GridViewDataColumn>
            <dx:GridViewDataColumn FieldName="FieldValueSetID" ReadOnly="true" Visible="false"></dx:GridViewDataColumn>
            <dx:GridViewDataColumn FieldName="FieldValue" Caption="Value" Width="50px" ></dx:GridViewDataColumn>
            <dx:GridViewDataColumn FieldName="FieldValueLabel" Caption="Label" Width="200px"></dx:GridViewDataColumn>

         </Columns>
     </dx:ASPxGridView>



</asp:Content>



