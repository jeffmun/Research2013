<%@ Page Language="c#" Debug="true" MasterPageFile="~/UWAC.master" CodeFile="DEhistory.aspx.cs" AutoEventWireup="true"
 Inherits="Info_DEhistory" Title="Data Entry History" %>
 <%@ MasterType VirtualPath="~/UWAC.master" %>



<asp:Content ID="Content1"  ContentPlaceHolderID="oBodyPlaceHolder" runat="server">
<style> .styleTBD   {   font: 8pt verdana;   font-weight:100;   color:SteelBlue;   outline-color:gray;}  </style>
<style> .styleData   {   font: 8pt verdana;   font-weight:100;   color:Green;   outline-color:gray;}  </style>
<style> .styleNA   {   font: 8pt verdana;   font-weight:100;   color:gray; outline-color:gray;    }  </style>
<style> .rowstyleAction   {   background-color:gray;  } </style>  
<style> .right_align { text-align: right; }  </style>
<style> .DataDictCell   { border-color:Gray;   font: 8pt verdana;   font-weight:100; border-width:thin;  color:black; outline-color:gray;    }  </style>

 <table id="tblmyinfo" runat="server" width="100%">
 <tr><td font-color="red"></td></tr>
 </table>

    <br />     <asp:Label ID="lblINTRO_studyname" runat="server" Text="Data Entry History by Staff" Font-Size="Medium" Font-Bold="false"></asp:Label>
    <br />
    <asp:DropDownList ID="ddlStaff" runat="server" DataSourceID="Sql_staff" DataValueField="staffID" DataTextField="staffname"></asp:DropDownList>
    
    <asp:Button ID="btnLoad" runat="server" OnClick="btnLoad_Click" Text="Load History" />
    <br/><br/>
    <asp:Panel ID="Panel1" runat="server">

        <asp:GridView ID="gv" runat="server" AutoGenerateColumns="false" AllowSorting="true">
            <Columns>
                <asp:BoundField HeaderText="Study" DataField="Study" />
                <asp:BoundField HeaderText="Study Meas" DataField="StudyMeas" />
                <asp:BoundField HeaderText="ID" DataField="ID" />
                <asp:BoundField HeaderText="Date data collected" DataField="DateDone" DataFormatString="{0:d}"  />
                <asp:BoundField HeaderText="Date data entry record Created" DataField="Created" />
                <asp:BoundField HeaderText="Created By" DataField="CreatedBy" />
                <asp:BoundField HeaderText="Date data entry record Updated" DataField="Updated" />
                <asp:BoundField HeaderText="Updated By" DataField="UpdatedBy" />
                <asp:HyperLinkField HeaderText="Data Entry Link" Text="link" DataNavigateUrlFields="DElink"   />
            
            </Columns>
        </asp:GridView>

    </asp:Panel>
    
    
<asp:SqlDataSource ID="Sql_staff" runat="server" SelectCommandType="Text"  
    SelectCommand="select 0 staffID, '--select staff--' staffname union select staffID, firstname + ' ' + lastname as staffname from tblstaff where active=1 order by staffname"  
    ConnectionString="<%$ ConnectionStrings: TRACKING_CONN_STRING %>">
   </asp:SqlDataSource>  


</asp:Content>

