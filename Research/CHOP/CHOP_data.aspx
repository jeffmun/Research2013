<%@ Page Language="C#" MasterPageFile="~/UWAC.master" AutoEventWireup="true" CodeFile="CHOP_data.aspx.cs" Inherits="CHOP_CHOP_data" Title="CHOP phenotype data" %>
<asp:Content ID="Content1" ContentPlaceHolderID="oBodyPlaceHolder" Runat="Server">
    
    CHOP - Initial Phenotype Data
    <br />
    <br />
    <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" CellPadding="4"
        DataKeyNames="pk" DataSourceID="SqlDataSource1" Font-Names="Arial" ForeColor="#333333" GridLines="None"
         AutoGenerateEditButton="True">
        
        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <Columns>
            <asp:BoundField DataField="pk" HeaderText="pk" InsertVisible="False" ReadOnly="True"
                SortExpression="pk" />
            <asp:BoundField DataField="SITE" HeaderText="SITE" SortExpression="SITE" />
            <asp:BoundField DataField="siteID" HeaderText="siteID" SortExpression="siteID" />
            <asp:BoundField DataField="familyID" HeaderText="familyID" SortExpression="familyID" />
            <asp:BoundField DataField="famtype" HeaderText="famtype" SortExpression="famtype" />
            <asp:BoundField DataField="DNA" HeaderText="DNA" SortExpression="DNA" />
            <asp:BoundField DataField="ADI_dx" HeaderText="ADI_dx" SortExpression="ADI_dx" />
            <asp:BoundField DataField="ADOS_dx" HeaderText="ADOS_dx" SortExpression="ADOS_dx" />
            <asp:BoundField DataField="BEST_dx" HeaderText="BEST_dx" SortExpression="BEST_dx" />
            <asp:BoundField DataField="pop" HeaderText="pop" SortExpression="pop" />
            <asp:BoundField DataField="ADIage" HeaderText="ADIage" SortExpression="ADIage" />
            <asp:BoundField DataField="ADOSage" HeaderText="ADOSage" SortExpression="ADOSage" />
            <asp:BoundField DataField="sex" HeaderText="sex" SortExpression="sex" />
            <asp:BoundField DataField="IQage" HeaderText="IQage" SortExpression="IQage" />
            <asp:BoundField DataField="NVIQ" HeaderText="NVIQ" SortExpression="NVIQ" />
            <asp:BoundField DataField="VIQ" HeaderText="VIQ" SortExpression="VIQ" />
            <asp:BoundField DataField="FSIQ" HeaderText="FSIQ" SortExpression="FSIQ" />
            <asp:BoundField DataField="NVIQ_test" HeaderText="NVIQ_test" SortExpression="NVIQ_test" />
            <asp:BoundField DataField="VIQ_test" HeaderText="VIQ_test" SortExpression="VIQ_test" />
            <asp:BoundField DataField="FSIQ_test" HeaderText="FSIQ_test" SortExpression="FSIQ_test" />
            <asp:BoundField DataField="IQ_notes" HeaderText="IQ_notes" SortExpression="IQ_notes" />
            <asp:BoundField DataField="Misc_Site_notes" HeaderText="Misc_Site_notes" SortExpression="Misc_Site_notes" />
            <asp:BoundField DataField="DataCleaning_notes" HeaderText="DataCleaning_notes" SortExpression="DataCleaning_notes" />
        </Columns>
        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
        <EditRowStyle BackColor="#999999" />
        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConflictDetection="CompareAllValues"
        ConnectionString="<%$ ConnectionStrings:CHOPConnectionString %>" DeleteCommand="DELETE FROM [CHOP_phen] WHERE [pk] = @original_pk AND [SITE] = @original_SITE AND [siteID] = @original_siteID AND [familyID] = @original_familyID AND [famtype] = @original_famtype AND [DNA] = @original_DNA AND [ADI_dx] = @original_ADI_dx AND [ADOS_dx] = @original_ADOS_dx AND [BEST_dx] = @original_BEST_dx AND [pop] = @original_pop AND [ADIage] = @original_ADIage AND [ADOSage] = @original_ADOSage AND [sex] = @original_sex AND [IQage] = @original_IQage AND [NVIQ] = @original_NVIQ AND [VIQ] = @original_VIQ AND [FSIQ] = @original_FSIQ AND [NVIQ_test] = @original_NVIQ_test AND [VIQ_test] = @original_VIQ_test AND [FSIQ_test] = @original_FSIQ_test AND [IQ_notes] = @original_IQ_notes AND [Misc_Site_notes] = @original_Misc_Site_notes AND [DataCleaning_notes] = @original_DataCleaning_notes"
        InsertCommand="INSERT INTO [CHOP_phen] ([SITE], [siteID], [familyID], [famtype], [DNA], [ADI_dx], [ADOS_dx], [BEST_dx], [pop], [ADIage], [ADOSage], [sex], [IQage], [NVIQ], [VIQ], [FSIQ], [NVIQ_test], [VIQ_test], [FSIQ_test], [IQ_notes], [Misc_Site_notes], [DataCleaning_notes]) VALUES (@SITE, @siteID, @familyID, @famtype, @DNA, @ADI_dx, @ADOS_dx, @BEST_dx, @pop, @ADIage, @ADOSage, @sex, @IQage, @NVIQ, @VIQ, @FSIQ, @NVIQ_test, @VIQ_test, @FSIQ_test, @IQ_notes, @Misc_Site_notes, @DataCleaning_notes)"
        OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [CHOP_phen]"
        UpdateCommand="UPDATE [CHOP_phen] SET [SITE] = @SITE, [siteID] = @siteID, [familyID] = @familyID, [famtype] = @famtype, [DNA] = @DNA, [ADI_dx] = @ADI_dx, [ADOS_dx] = @ADOS_dx, [BEST_dx] = @BEST_dx, [pop] = @pop, [ADIage] = @ADIage, [ADOSage] = @ADOSage, [sex] = @sex, [IQage] = @IQage, [NVIQ] = @NVIQ, [VIQ] = @VIQ, [FSIQ] = @FSIQ, [NVIQ_test] = @NVIQ_test, [VIQ_test] = @VIQ_test, [FSIQ_test] = @FSIQ_test, [IQ_notes] = @IQ_notes, [Misc_Site_notes] = @Misc_Site_notes, [DataCleaning_notes] = @DataCleaning_notes WHERE [pk] = @original_pk AND [SITE] = @original_SITE AND [siteID] = @original_siteID AND [familyID] = @original_familyID AND [famtype] = @original_famtype AND [DNA] = @original_DNA AND [ADI_dx] = @original_ADI_dx AND [ADOS_dx] = @original_ADOS_dx AND [BEST_dx] = @original_BEST_dx AND [pop] = @original_pop AND [ADIage] = @original_ADIage AND [ADOSage] = @original_ADOSage AND [sex] = @original_sex AND [IQage] = @original_IQage AND [NVIQ] = @original_NVIQ AND [VIQ] = @original_VIQ AND [FSIQ] = @original_FSIQ AND [NVIQ_test] = @original_NVIQ_test AND [VIQ_test] = @original_VIQ_test AND [FSIQ_test] = @original_FSIQ_test AND [IQ_notes] = @original_IQ_notes AND [Misc_Site_notes] = @original_Misc_Site_notes AND [DataCleaning_notes] = @original_DataCleaning_notes">
        <DeleteParameters>
            <asp:Parameter Name="original_pk" Type="Int32" />
            <asp:Parameter Name="original_SITE" Type="String" />
            <asp:Parameter Name="original_siteID" Type="String" />
            <asp:Parameter Name="original_familyID" Type="String" />
            <asp:Parameter Name="original_famtype" Type="String" />
            <asp:Parameter Name="original_DNA" Type="String" />
            <asp:Parameter Name="original_ADI_dx" Type="String" />
            <asp:Parameter Name="original_ADOS_dx" Type="String" />
            <asp:Parameter Name="original_BEST_dx" Type="String" />
            <asp:Parameter Name="original_pop" Type="String" />
            <asp:Parameter Name="original_ADIage" Type="Int32" />
            <asp:Parameter Name="original_ADOSage" Type="Int32" />
            <asp:Parameter Name="original_sex" Type="String" />
            <asp:Parameter Name="original_IQage" Type="Int32" />
            <asp:Parameter Name="original_NVIQ" Type="Double" />
            <asp:Parameter Name="original_VIQ" Type="Double" />
            <asp:Parameter Name="original_FSIQ" Type="Double" />
            <asp:Parameter Name="original_NVIQ_test" Type="String" />
            <asp:Parameter Name="original_VIQ_test" Type="String" />
            <asp:Parameter Name="original_FSIQ_test" Type="String" />
            <asp:Parameter Name="original_IQ_notes" Type="String" />
            <asp:Parameter Name="original_Misc_Site_notes" Type="String" />
            <asp:Parameter Name="original_DataCleaning_notes" Type="String" />
        </DeleteParameters>
        <UpdateParameters>
            <asp:Parameter Name="SITE" Type="String" />
            <asp:Parameter Name="siteID" Type="String" />
            <asp:Parameter Name="familyID" Type="String" />
            <asp:Parameter Name="famtype" Type="String" />
            <asp:Parameter Name="DNA" Type="String" />
            <asp:Parameter Name="ADI_dx" Type="String" />
            <asp:Parameter Name="ADOS_dx" Type="String" />
            <asp:Parameter Name="BEST_dx" Type="String" />
            <asp:Parameter Name="pop" Type="String" />
            <asp:Parameter Name="ADIage" Type="Int32" />
            <asp:Parameter Name="ADOSage" Type="Int32" />
            <asp:Parameter Name="sex" Type="String" />
            <asp:Parameter Name="IQage" Type="Int32" />
            <asp:Parameter Name="NVIQ" Type="Double" />
            <asp:Parameter Name="VIQ" Type="Double" />
            <asp:Parameter Name="FSIQ" Type="Double" />
            <asp:Parameter Name="NVIQ_test" Type="String" />
            <asp:Parameter Name="VIQ_test" Type="String" />
            <asp:Parameter Name="FSIQ_test" Type="String" />
            <asp:Parameter Name="IQ_notes" Type="String" />
            <asp:Parameter Name="Misc_Site_notes" Type="String" />
            <asp:Parameter Name="DataCleaning_notes" Type="String" />
            <asp:Parameter Name="original_pk" Type="Int32" />
            <asp:Parameter Name="original_SITE" Type="String" />
            <asp:Parameter Name="original_siteID" Type="String" />
            <asp:Parameter Name="original_familyID" Type="String" />
            <asp:Parameter Name="original_famtype" Type="String" />
            <asp:Parameter Name="original_DNA" Type="String" />
            <asp:Parameter Name="original_ADI_dx" Type="String" />
            <asp:Parameter Name="original_ADOS_dx" Type="String" />
            <asp:Parameter Name="original_BEST_dx" Type="String" />
            <asp:Parameter Name="original_pop" Type="String" />
            <asp:Parameter Name="original_ADIage" Type="Int32" />
            <asp:Parameter Name="original_ADOSage" Type="Int32" />
            <asp:Parameter Name="original_sex" Type="String" />
            <asp:Parameter Name="original_IQage" Type="Int32" />
            <asp:Parameter Name="original_NVIQ" Type="Double" />
            <asp:Parameter Name="original_VIQ" Type="Double" />
            <asp:Parameter Name="original_FSIQ" Type="Double" />
            <asp:Parameter Name="original_NVIQ_test" Type="String" />
            <asp:Parameter Name="original_VIQ_test" Type="String" />
            <asp:Parameter Name="original_FSIQ_test" Type="String" />
            <asp:Parameter Name="original_IQ_notes" Type="String" />
            <asp:Parameter Name="original_Misc_Site_notes" Type="String" />
            <asp:Parameter Name="original_DataCleaning_notes" Type="String" />
        </UpdateParameters>
        <InsertParameters>
            <asp:Parameter Name="SITE" Type="String" />
            <asp:Parameter Name="siteID" Type="String" />
            <asp:Parameter Name="familyID" Type="String" />
            <asp:Parameter Name="famtype" Type="String" />
            <asp:Parameter Name="DNA" Type="String" />
            <asp:Parameter Name="ADI_dx" Type="String" />
            <asp:Parameter Name="ADOS_dx" Type="String" />
            <asp:Parameter Name="BEST_dx" Type="String" />
            <asp:Parameter Name="pop" Type="String" />
            <asp:Parameter Name="ADIage" Type="Int32" />
            <asp:Parameter Name="ADOSage" Type="Int32" />
            <asp:Parameter Name="sex" Type="String" />
            <asp:Parameter Name="IQage" Type="Int32" />
            <asp:Parameter Name="NVIQ" Type="Double" />
            <asp:Parameter Name="VIQ" Type="Double" />
            <asp:Parameter Name="FSIQ" Type="Double" />
            <asp:Parameter Name="NVIQ_test" Type="String" />
            <asp:Parameter Name="VIQ_test" Type="String" />
            <asp:Parameter Name="FSIQ_test" Type="String" />
            <asp:Parameter Name="IQ_notes" Type="String" />
            <asp:Parameter Name="Misc_Site_notes" Type="String" />
            <asp:Parameter Name="DataCleaning_notes" Type="String" />
        </InsertParameters>
    </asp:SqlDataSource>
    <br />
    <br />





</asp:Content>

