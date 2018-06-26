<%@ Page Language="c#" Debug="true" MasterPageFile="~/UWAC.master" CodeFile="IBIS_Vinelands.aspx.cs" AutoEventWireup="true"
 Inherits="IBIS_Vinelands" Title="IBIS Vinelands" %>
 <%@ MasterType VirtualPath="~/UWAC.master" %>



<asp:Content ID="Content1"  ContentPlaceHolderID="oBodyPlaceHolder" runat="server">


<br /><br />

    <table>
        <tr>
            <td>
                <asp:Label ID="Label3" runat="server"  Text = "Create new DCC ID for:" Font-Bold="true" Font-Size="Smaller" Font-Underline="false"></asp:Label>
                <br/>
                <asp:DropDownList ID="ddlID" runat="server" DataSourceID="SQL_IBIS_DCCID_missing" DataTextField="IDlabel" DataValueField="subjID" />
            </td>
            <td>
                <asp:Label ID="Label1" runat="server"  Text = "Enter new DCC ID:" Font-Bold="true" Font-Size="Smaller" Font-Underline="false"></asp:Label>
                <br/>
                <asp:TextBox ID="txtDCCID" runat="server" />
            </td>
            <td>
                <br />
                <asp:Button ID="btnUpdateOtherID" runat="server" Text="Insert DCC ID" OnClick = "UpdateDCCID" /><br />

            </td>
            <td style="width: 30px">

            </td>
            <td>
                <asp:Label ID="Label2" runat="server"  Text = "Export Vineland:" Font-Bold="true" Font-Size="Smaller" Font-Underline="false"></asp:Label>
                <br />
                <asp:DropDownList ID="ddlID2" runat="server" DataSourceID="SQL_IBIS_ID" DataTextField="IDlabel" DataValueField="ID" 
                    OnSelectedIndexChanged="ddlID2_SelectedIndexChanged" AutoPostBack="true"/>
                <br />
                <asp:DropDownList ID="ddlStudymeasID" runat="server" ></asp:DropDownList>

            </td>
            <td>
                 <asp:Button ID="btnExport" runat="server" Text="Export to CSV" OnClick="btnExport_Click" Visible="false"/><br />
                <asp:Label ID="lblNoData" runat="server"  Text = ""  Font-Size="Smaller"  ForeColor="Red"></asp:Label>

            </td>
        </tr>
    </table>


<asp:Label ID="lblSqlInfo" runat="server" Text="" ForeColor="Red" />




    <br /><br />


<asp:Label ID="lblIbis2" runat="server"  Text = "IBIS-2 Vinelands" Font-Bold="true" Font-Size="Medium" Font-Underline="true"></asp:Label>
<br />
<br />
    <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="false" DataSourceID="SqlDataSource2" OnRowDataBound="GridView2_RowDataBound"  >
    <Columns>
    <asp:BoundField HeaderText="ID"          DataField="ID"          />
    <asp:BoundField HeaderText="IBIS_DCC_ID" DataField="IBIS_DCC_ID" />
    <asp:BoundField HeaderText="GroupName"   DataField="GroupName"   />
    <asp:BoundField HeaderText="SubjStatus"  DataField="SubjStatus"  />

    <asp:TemplateField HeaderText="Proband"><ItemTemplate> <asp:Label runat="server" ID="Proband" Text='<%# Eval("Proband") %>'   /></ItemTemplate></asp:TemplateField>
    <asp:TemplateField HeaderText="Proband_03"><ItemTemplate> <asp:Label runat="server" ID="Proband_03" Text='<%# Eval("Proband_03") %>'   /></ItemTemplate></asp:TemplateField>
    <asp:TemplateField HeaderText="Proband_06"><ItemTemplate> <asp:Label runat="server" ID="Proband_06" Text='<%# Eval("Proband_06") %>'   /></ItemTemplate></asp:TemplateField>
    <asp:TemplateField HeaderText="Subj_03"   ><ItemTemplate> <asp:Label runat="server" ID="Subj_03"    Text='<%# Eval("Subj_03")    %>'   /></ItemTemplate></asp:TemplateField>
    <asp:TemplateField HeaderText="Subj_06"   ><ItemTemplate> <asp:Label runat="server" ID="Subj_06"    Text='<%# Eval("Subj_06")    %>'   /></ItemTemplate></asp:TemplateField>
    <asp:TemplateField HeaderText="Subj_09"   ><ItemTemplate> <asp:Label runat="server" ID="Subj_09"    Text='<%# Eval("Subj_09")    %>'   /></ItemTemplate></asp:TemplateField>
    <asp:TemplateField HeaderText="Subj_12"   ><ItemTemplate> <asp:Label runat="server" ID="Subj_12"    Text='<%# Eval("Subj_12")    %>'   /></ItemTemplate></asp:TemplateField>
    <asp:TemplateField HeaderText="Subj_15"   ><ItemTemplate> <asp:Label runat="server" ID="Subj_15"    Text='<%# Eval("Subj_15")    %>'   /></ItemTemplate></asp:TemplateField>
    <asp:TemplateField HeaderText="Subj_24"   ><ItemTemplate> <asp:Label runat="server" ID="Subj_24"    Text='<%# Eval("Subj_24")    %>'   /></ItemTemplate></asp:TemplateField>
    <asp:TemplateField HeaderText="Subj_36"   ><ItemTemplate> <asp:Label runat="server" ID="Subj_36"    Text='<%# Eval("Subj_36")    %>'   /></ItemTemplate></asp:TemplateField>
                                                                                                                                                                                                                      


    </Columns>
    </asp:GridView>


<br /><br />


<asp:Label ID="lblIbis" runat="server"  Text = "IBIS Vinelands" Font-Bold="true" Font-Size="Medium" Font-Underline="true"></asp:Label>
<br />
<br />
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="false" DataSourceID="SqlDataSource1" OnRowDataBound="GridView1_RowDataBound" >
    <Columns>
    <asp:BoundField HeaderText="ID"          DataField="ID"          />
    <asp:BoundField HeaderText="IBIS_DCC_ID" DataField="IBIS_DCC_ID" />
    <asp:BoundField HeaderText="GroupName"   DataField="GroupName"   />
    <asp:BoundField HeaderText="SubjStatus"  DataField="SubjStatus"  />

    <asp:TemplateField HeaderText="Subj_06"   ><ItemTemplate> <asp:Label runat="server" ID="Subj_06"    Text='<%# Eval("Subj_06")    %>'    /></ItemTemplate></asp:TemplateField>
    <asp:TemplateField HeaderText="Subj_12"   ><ItemTemplate> <asp:Label runat="server" ID="Subj_12"    Text='<%# Eval("Subj_12")    %>'    /></ItemTemplate></asp:TemplateField>
    <asp:TemplateField HeaderText="Subj_18"   ><ItemTemplate> <asp:Label runat="server" ID="Subj_18"    Text='<%# Eval("Subj_18")    %>'    /></ItemTemplate></asp:TemplateField>
    <asp:TemplateField HeaderText="Subj_24"   ><ItemTemplate> <asp:Label runat="server" ID="Subj_24"    Text='<%# Eval("Subj_24")    %>'    /></ItemTemplate></asp:TemplateField>
    <asp:TemplateField HeaderText="Subj_36"   ><ItemTemplate> <asp:Label runat="server" ID="Subj_36"    Text='<%# Eval("Subj_36")    %>'    /></ItemTemplate></asp:TemplateField>
                                                                                                                                                                                                                      


    </Columns>
    </asp:GridView>


    

   

        <asp:SqlDataSource ID="SQL_IBIS_DCCID_missing" runat="server" SelectCommandType="Text" 
    SelectCommand="select 0 as subjID, '[select ID]' as IDlabel union select a.subjID, (studyname + ': ' +  ID + '  ' + groupname) as IDlabel from vwMasterStatus_S a
        left join tblOtherID b ON a.subjID = b.subjID
        left join tblSite c ON b.otherIDsiteID = c.siteID
        where studyID in ( 1071)   and otherID is null order by 2"
    ConnectionString="<%$ ConnectionStrings: TRACKING_CONN_STRING %>">
    </asp:SqlDataSource>

    
        <asp:SqlDataSource ID="SQL_IBIS_ID" runat="server" SelectCommandType="Text" 
    SelectCommand="select '0' as ID, '[select ID]' as IDlabel union select ID, ID as IDlabel 
            from vwMasterStatus_S a 
            join tblOtherID b ON a.subjID = b.subjID
            where studyID in (1071) 
            and ID in (select ID from uwautism_research_data..all_vineii) order by ID"
    ConnectionString="<%$ ConnectionStrings: TRACKING_CONN_STRING %>">
    </asp:SqlDataSource>



    <asp:SqlDataSource ID="SqlDataSource1" runat="server" SelectCommandType="Text" SelectCommand="select top 1 * from vwIBIS__Vinelands_for_Upload order by ID"
    ConnectionString="<%$ ConnectionStrings: DATA_CONN_STRING %>">
    </asp:SqlDataSource>

        <asp:SqlDataSource ID="SqlDataSource2" runat="server" SelectCommandType="Text" SelectCommand="select   * from vwIBIS_2__Vinelands_for_Upload order by ID"
    ConnectionString="<%$ ConnectionStrings: DATA_CONN_STRING %>">
    </asp:SqlDataSource>



</asp:Content>
