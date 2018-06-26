<%@ Page Language="c#" Debug="true" MasterPageFile="~/UWAC.master" CodeFile="StudyMeasInfo.aspx.cs" AutoEventWireup="True"
 Inherits="Info_StudyMeasInfo" Title="Study Measures" %>


<asp:Content ID="Content1"  ContentPlaceHolderID="oBodyPlaceHolder" runat="server">
<style> .styleTBD   {   font: 9pt verdana;   font-weight:100;   color:Aqua;   outline-color:gray;}  </style>
<style> .styleData   {   font: 9pt verdana;   font-weight:100;   color:Green;   outline-color:gray;}  </style>
<style> .styleNA   {   font: 9pt verdana;   font-weight:100;   color:gray; outline-color:gray;    }  </style>

 
 <table id="tblmyinfo" runat="server" width="100%">
 <tr><td></td></tr>
 </table>

<table border = "0" width="100%" cellspacing="0" class="tblinputsmall_white" id="tblMaster" runat="server">
	<tr class="trTitle">
		<td colspan="1" id="tdTitle" runat="server"><b>Study Measures</b></td>
	</tr>
    <tr><td>    
        <asp:Label ID="Label1" runat="server" Text="Select Study:"></asp:Label>
        <asp:DropDownList ID="DDL_SelectStudyID" runat="server" DataSourceID="Sql_Studies" 
             DataTextField="StudyName" DataValueField="studyID" Width="200px" 
             OnSelectedIndexChanged="DDL_SelectStudyID_SelectedIndexChanged"  AutoPostBack="true" >
        </asp:DropDownList><br />
        </td></tr>

<tr><td id="tdNotes" runat="server">
 <br/>
    <asp:PlaceHolder ID="PlaceHolder1" runat="server"></asp:PlaceHolder>
</td></tr>

</table>


<asp:SqlDataSource ID="Sql_Studies" runat="server" SelectCommandType="StoredProcedure"  
    SelectCommand="spSEC_GetStudies_CanView_by_User__Short"  
    ConnectionString="<%$ ConnectionStrings: TRACKING_CONN_STRING %>">
   </asp:SqlDataSource>  


<%--
<td>
    <asp:Label ID="Label1" runat="server" Text="Select Lab:"></asp:Label>
        <asp:DropDownList ID="DDL_SelectLabID" runat="server" DataSourceID="Sql_Labs" 
             DataTextField="LabName" DataValueField="labID" Width="200px" OnSelectedIndexChanged="DDL_SelectLabID_SelectedIndexChanged"  AutoPostBack=true >
        </asp:DropDownList><br />


<br/>
    <asp:Label ID="Lbl_StaffIDDetails" runat="server" Text="" Visible="false"></asp:Label>
<asp:GridView ID="Gridview1"  class="tblInputSmall" runat="server" DataSoureceID="SqlDataSource1" AutoGenerateColumns="true" Visible="true" 
   width="600px"   >
    <Columns>
        <asp:TemplateField HeaderText="View/Edit Details">
            <ItemTemplate>
                <asp:LinkButton ID="LinkButton1" runat="server" >Edit</asp:LinkButton>

            </ItemTemplate>
        </asp:TemplateField>
    </Columns>
</asp:GridView>


<br/>

<asp:GridView ID="Gridview_StaffDetails"  class="tblInputSmall" runat="server" DataSoureceID="SqlDataSource1" AutoGenerateColumns="true" Visible="true" 
  >
</asp:GridView>

<br/>
<br/>

    <asp:Label ID="Label2" runat="server" Text="The following staff are also in additional labs:"></asp:Label>
<asp:GridView ID="Gridview2"  class="tblInputSmall" runat="server" DataSoureceID="Sql_MultipleLabs" AutoGenerateColumns="true" Visible="true" 
   width="600px"   >
</asp:GridView>
</td>
</tr>
</table>

<asp:SqlDataSource ID="SqlDataSource1" runat="server" SelectCommandType="StoredProcedure"  SelectCommand="spSEC_PIVOT__Lab_and_AllStaffInLab_by_Studies"   
   ConnectionString="<%$ ConnectionStrings: TRACKING_CONN_STRING %>">
   <SelectParameters>    <asp:ControlParameter ControlID="DDL_SelectLabID" PropertyName="SelectedValue" Name="labID" />    </SelectParameters>
   </asp:SqlDataSource>    

<asp:SqlDataSource ID="Sql_StaffDetails" runat="server" SelectCommandType="Text"  SelectCommand="select LabName, StaffName, StudyName, DBrole, AllowedGroups from vwSEC_AllowedGroups_By_StaffID where staffID = @staffID_details"  
   ConnectionString="<%$ ConnectionStrings: TRACKING_CONN_STRING %>">
   <SelectParameters>    <asp:ControlParameter  ControlID="Lbl_StaffIDDetails" Name="staffID_details" />    </SelectParameters>
   </asp:SqlDataSource>    


<asp:SqlDataSource ID="Sql_MultipleLabs" runat="server" SelectCommandType="Text"  
    SelectCommand="select StaffName, LabName, Studies from vwSEC_Staff_in_MultipleLabs where staffID in (select staffID from vwSEC_Staff_in_MultipleLabs where labID = @labID)
         AND labID <> @labID"   
   ConnectionString="<%$ ConnectionStrings: TRACKING_CONN_STRING %>">
   <SelectParameters>     <asp:ControlParameter ControlID="DDL_SelectLabID" PropertyName="SelectedValue" Name="labID" />   </SelectParameters>
   </asp:SqlDataSource>    



<%-- 
<asp:SqlDataSource ID="SqlDataSource2" runat="server" SelectCommandType="StoredProcedure"  SelectCommand="spUWAC_ADgroups_by_User"  
   ConnectionString="<%$ ConnectionStrings: TRACKING_CONN_STRING %>">
   </asp:SqlDataSource>    

<asp:SqlDataSource ID="SqlDataSource3" runat="server" SelectCommandType="StoredProcedure"  SelectCommand="spSEC_GetGroups_CanView_by_User"  
   ConnectionString="<%$ ConnectionStrings: TRACKING_CONN_STRING %>">
   </asp:SqlDataSource>    

<asp:SqlDataSource ID="SqlDataSource4" runat="server" SelectCommandType="Text"  SelectCommand="select * from vwDBroles"  
   ConnectionString="<%$ ConnectionStrings: TRACKING_CONN_STRING %>">
   </asp:SqlDataSource>  
   --%>  
   
</asp:Content>
