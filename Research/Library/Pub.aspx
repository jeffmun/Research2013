<%@ Page Language="C#" Debug="true" AutoEventWireup="true" MasterPageFile="~/UWAC.master"
    CodeFile="Pub.aspx.cs" Inherits="Library_Pub"   Title ="Publications"  %>

<%@ MasterType VirtualPath="~/UWAC.master" %>

<%@ Register Assembly="DevExpress.Web.v19.2, Version=19.2.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<%--<%@ Register Assembly="Microsoft.R.Host.Client, Version=18.1.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"  Namespace="Microsoft.R.Host.Client" TagPrefix="r"  %>--%>



<asp:Content ID="HeadContent" runat="server" ContentPlaceHolderID="headContent" Visible="true"></asp:Content>

<asp:Content ID="Content1"  ContentPlaceHolderID="oBodyPlaceHolder" runat="server">
	<asp:ScriptManager ID="ScriptManager1" runat="server" EnablePageMethods="true"  EnablePartialRendering="true"></asp:ScriptManager>

    <br />
    <dx:ASPxLabel ID="lbl" runat="server" Text="Publications" Fornt-Bold="true" Font-Size="Medium"></dx:ASPxLabel>
    <br />
    <br />
    <dx:ASPxGridView ID="gv_pubs" runat="server" DataSourceID="sql_pubs" KeyFieldName="pubid"
         SettingsDataSecurity-AllowEdit="true" SettingsDataSecurity-AllowInsert="true" Width="90%"
        OnRowInserting="gv_pubs_RowInserting" OnRowUpdating="gv_pubs_RowUpdating" OnRowDeleting="gv_pubs_RowDeleting">
        <Columns>
            <dx:GridViewCommandColumn ShowEditButton="true" ShowDeleteButton="true" ShowNewButtonInHeader="true" Width="80"></dx:GridViewCommandColumn>
            <dx:GridViewDataColumn FieldName="pubid" Width="80"></dx:GridViewDataColumn>
            <dx:GridViewDataColumn FieldName="pubyr" Width="50"></dx:GridViewDataColumn>
<%--            <dx:GridViewDataTextColumn FieldName="pubtitle" Width="250" CellStyle-Wrap="True"></dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn  FieldName="pubauthors" Width="250" CellStyle-Wrap="True"></dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn  FieldName="pubjournal" Width="250" CellStyle-Wrap="True"></dx:GridViewDataTextColumn>--%>
            <dx:GridViewDataTextColumn  FieldName="fullcitation" Width="500" CellStyle-Wrap="True"></dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn  FieldName="notes" Width="200" CellStyle-Wrap="True"></dx:GridViewDataTextColumn>

        </Columns>

    </dx:ASPxGridView>


    <br />
    <br />
    <br />
        <dx:ASPxLabel ID="lbl2" runat="server" Text="Publication Variables" Fornt-Bold="true" Font-Size="Medium"></dx:ASPxLabel>


        <dx:ASPxGridView ID="gv_pubvar" runat="server" DataSourceID="sql_pubvar" KeyFieldName="pubvarid"
         SettingsDataSecurity-AllowEdit="true" SettingsDataSecurity-AllowInsert="true" 
        OnRowInserting="gv_pubvar_RowInserting" OnRowUpdating="gv_pubvar_RowUpdating" OnRowDeleting="gv_pubvar_RowDeleting">
        <Columns>
            <dx:GridViewCommandColumn ShowEditButton="true" ShowDeleteButton="true" ShowNewButtonInHeader="true"></dx:GridViewCommandColumn>
            <dx:GridViewDataColumn FieldName="pubvarid" ReadOnly="true" CellStyle-ForeColor="Silver" ></dx:GridViewDataColumn>
            <dx:GridViewDataColumn FieldName="pubid" ></dx:GridViewDataColumn>
            <dx:GridViewDataTextColumn FieldName="pubvar_construct" Caption="Variable Construct from Pub" Width="250" CellStyle-Wrap="True"></dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn  FieldName="pubvar_description" Caption="Variable Description from Pub" Width="250" CellStyle-Wrap="True"></dx:GridViewDataTextColumn>
              <dx:GridViewDataComboBoxColumn FieldName="measureid" Caption="Measure" ReadOnly="false" >
														<PropertiesComboBox DataSourceID="sql_meas" TextField="measname_and_full" ValueField="measureid"
															></PropertiesComboBox>
													</dx:GridViewDataComboBoxColumn>
            <dx:GridViewDataTextColumn  FieldName="fldname" Caption="Field Name" Width="100" CellStyle-Wrap="True"></dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn  FieldName="fieldlabel" Caption="Field Label" ReadOnly="true" Width="200" CellStyle-Wrap="True"></dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn  FieldName="pubvar_notes" Width="250" CellStyle-Wrap="True"></dx:GridViewDataTextColumn>

        </Columns>
            <SettingsEditing Mode="Inline"></SettingsEditing>
    </dx:ASPxGridView>





    <asp:SqlDataSource ID="sql_pubs" runat="server" SelectCommandType="Text"  
		SelectCommand="select * from tblPub "
		ConnectionString="<%$ ConnectionStrings:TRACKING_CONN_STRING %>" >        
	</asp:SqlDataSource>

    
    <asp:SqlDataSource ID="sql_pubvar" runat="server" SelectCommandType="Text"  
		SelectCommand="select * from vwPubVar "
		ConnectionString="<%$ ConnectionStrings:TRACKING_CONN_STRING %>" >        
	</asp:SqlDataSource>

    <asp:SqlDataSource ID="sql_meas" runat="server" SelectCommandType="Text"  
		SelectCommand="select measureid, measname, measfullname, measname + ' (' + measfullname +')' measname_and_full from tblMeasure order by measname"
		ConnectionString="<%$ ConnectionStrings:TRACKING_CONN_STRING %>" >        
	</asp:SqlDataSource>


    </asp:Content>