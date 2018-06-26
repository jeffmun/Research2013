<%@ Page Language="c#" Debug="true" MasterPageFile="~/UWAC.master" CodeFile="IBIS2_Vinelands.aspx.cs" AutoEventWireup="true"
 Inherits="IBIS2_Vinelands" Title="IBIS-2 Vinelands" %>
 <%@ MasterType VirtualPath="~/UWAC.master" %>



<asp:Content ID="Content1"  ContentPlaceHolderID="oBodyPlaceHolder" runat="server">


<br /><br />
    <table>
<tr>
    <td style="vertical-align:top">
        <asp:Label ID="Label3" runat="server"  Text = "Create new DCC ID:" Font-Bold="true" Font-Size="Smaller" Font-Underline="false"></asp:Label><br/>

        <asp:DropDownList ID="ddlID" runat="server" DataSourceID="SQL_IBIS_DCCID_missing" DataTextField="IDlabel" DataValueField="subjID" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;


        <asp:Label ID="lblDCCID" runat="server" Text="DCC ID :"></asp:Label><asp:TextBox ID="txtDCCID" runat="server"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="btnUpdateOtherID" runat="server" Text="Insert DCC ID" OnClick = "UpdateDCCID" /><br />
        <asp:Label ID="lblSqlInfo" runat="server" Text="" ForeColor="Red" />

    </td>
    <td width="100px"></td>
    <td style="vertical-align:top">
        <asp:Label ID="Label1" runat="server"  Text = "ID:" Font-Bold="true" Font-Size="Smaller" Font-Underline="false"></asp:Label><br/>
        <asp:DropDownList ID="DDL_ID" runat="server" DataTextField="ID" DataValueField="ID" Width="120px"></asp:DropDownList>
        
    </td>
    <td style="vertical-align:top">
        <asp:Label ID="Label2" runat="server"  Text = "studymeasID:" Font-Bold="true" Font-Size="Smaller" Font-Underline="false"></asp:Label><br/>
        <asp:DropDownList ID="DDLstudymeasID" runat="server" DataTextField="studymeasname" DataValueField="studymeasID"></asp:DropDownList>
        
    </td>
    <td style="vertical-align:top">
        <asp:Label ID="Label4" runat="server"  Text = " " Font-Bold="true" Font-Size="Smaller" Font-Underline="false"></asp:Label><br/>
        <asp:Button ID="btnSaveToText" runat="server" Text="Save Text File" OnClick="btnSaveToText_Click" />
        <br />
        <br />
        <asp:Button ID="btnSaveAll" runat="server" Text="Save ALL to Text Files" OnClick="btnSaveAll_Click"/>

    </td>
</tr>
    </table>


<br /><br />

    <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="false" DataSourceID="SQL_IBIS_DCCID" Visible="false"  >
    <Columns>
    <asp:BoundField HeaderText="subjID"          DataField="subjID"   Visible="false"        />

    <asp:BoundField HeaderText="Study"   DataField="StudyName"   />
    <asp:BoundField HeaderText="Group"   DataField="GroupName"   />
    <asp:BoundField HeaderText="Subj Status"  DataField="SubjStatus"  />
    <asp:BoundField HeaderText="ID" DataField="ID" />
    <asp:BoundField HeaderText="IBIS_DCC_ID" DataField="otherID" />
    <asp:BoundField HeaderText="Site" DataField="sitename" />


    </Columns>
    </asp:GridView>



<br /><br />


<asp:Label ID="lblIbis2" runat="server"  Text = "IBIS-2 Vinelands" Font-Bold="true" Font-Size="Medium" Font-Underline="true"></asp:Label>
<br />
<br />
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="false" DataSourceID="SqlDataSource1" OnRowDataBound="GridView1_RowDataBound"  >
    <Columns>
    <asp:BoundField HeaderText="ID"          DataField="ID"          />
    <asp:BoundField HeaderText="IBIS_DCC_ID" DataField="IBIS_DCC_ID" />
    <asp:BoundField HeaderText="GroupName"   DataField="GroupName"   />
    <asp:BoundField HeaderText="SubjStatus"  DataField="SubjStatus"  />

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


        <asp:SqlDataSource ID="SQL_IBIS_DCCID" runat="server" SelectCommandType="Text" 
    SelectCommand="select a.subjID, studyname, ID, groupname, subjstatus, otherID, otherIDsiteID , sitename from vwMasterStatus_S a
        left join tblOtherID b ON a.subjID = b.subjID
        left join tblSite c ON b.otherIDsiteID = c.siteID
        where studyID in ( 1071) order by studyname, ID"
    ConnectionString="<%$ ConnectionStrings: TRACKING_CONN_STRING %>"  >
    </asp:SqlDataSource>



        <asp:SqlDataSource ID="SQL_IBIS_DCCID_missing" runat="server" SelectCommandType="Text" 
    SelectCommand="select 0 as subjID, '[select ID]' as IDlabel union select a.subjID, (studyname + ': ' +  ID + '  ' + groupname) as IDlabel from vwMasterStatus_S a
        left join tblOtherID b ON a.subjID = b.subjID
        left join tblSite c ON b.otherIDsiteID = c.siteID
        where studyID in (1071) and ID not like '%pr' and otherID is null order by 2"
    ConnectionString="<%$ ConnectionStrings: TRACKING_CONN_STRING %>">
    </asp:SqlDataSource>




    <asp:SqlDataSource ID="SqlDataSource1" runat="server" SelectCommandType="Text" SelectCommand="select * from vwIBIS_2__Vinelands_for_Upload order by ID"
    ConnectionString="<%$ ConnectionStrings: DATA_CONN_STRING %>">
    </asp:SqlDataSource>



</asp:Content>
