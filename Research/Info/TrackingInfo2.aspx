<%@ Page Language="c#" Debug="true" MasterPageFile="~/UWAC.master" CodeFile="TrackingInfo2.aspx.cs" AutoEventWireup="true"
 Inherits="Info_TrackingInfo2" Title="Tracking Info 2" %>
  <%@ MasterType VirtualPath="~/UWAC.master" %>

<asp:Content ID="Content1"  ContentPlaceHolderID="oBodyPlaceHolder" runat="server">
<style> .styleTBD   {   font: 8pt verdana;   font-weight:100;   color:SteelBlue;   outline-color:gray;}  </style>
<style> .styleData   {   font: 8pt verdana;   font-weight:100;   color:Green;   outline-color:gray;}  </style>
<style> .styleNA   {   font: 8pt verdana;   font-weight:100;   color:gray; outline-color:gray;    }  </style>
<style> .rowstyleAction   {   background-color:gray;  } </style>  
<style> .right_align { text-align: right; }  </style>

 
 <table id="tblmyinfo" runat="server" width="100%">
 <tr><td font-color="red"></td></tr>
 </table>

<table>
<tr><td>
    <asp:Label ID="lblINTRO_studyname" runat="server" Text=" " Font-Size="Medium" Font-Bold="false"></asp:Label>
    <asp:Label ID="lblStudyname_ContentPage" runat="server" Text=" " Font-Size="Medium" Font-Bold="true"></asp:Label>
</td>    
<td>
        <asp:Panel  ID="PlaceHolder_WhereClauseControls" runat="server">
            <asp:Label ID="lblSubjStatus" runat="server" Text="Status:" CssClass = "right_align" Width="80px"></asp:Label>
            <asp:CheckBox ID="chkSS_TBS" runat="server"      AutoPostBack="false" Checked="false" Visible="false" Text="ToBeSched"  />
            <asp:CheckBox ID="chkSS_ACT" runat="server"      AutoPostBack="false" Checked="false" Visible="false" Text="Active"  />
            <asp:CheckBox ID="chkSS_FIN" runat="server"      AutoPostBack="false" Checked="false" Visible="false" Text="Finished"  />
            <asp:CheckBox ID="chkSS_DQ" runat="server"       AutoPostBack="false" Checked="false" Visible="false" Text="DQ"  />
            <asp:CheckBox ID="chkSS_OOS" runat="server"      AutoPostBack="false" Checked="false" Visible="false" Text="OOS"  />
            <asp:CheckBox ID="chkSS_INACT" runat="server"    AutoPostBack="false" Checked="false" Visible="false" Text="Inactive"  />
            <asp:CheckBox ID="chkSS_NOTIN" runat="server"    AutoPostBack="false" Checked="false" Visible="false" Text="NotInStudy"  />
            <asp:CheckBox ID="chkSS_NOTPART" runat="server"  AutoPostBack="false" Checked="false" Visible="false" Text="NotPartic"  />
            <asp:CheckBox ID="chkSS_NOTENR" runat="server"   AutoPostBack="false" Checked="false" Visible="false" Text="NotEnroll"  />

            <asp:Label ID="lblSex" runat="server" Text="Sex:" CssClass = "right_align" Width="80px"></asp:Label>
            <asp:CheckBox ID="chkM" runat="server"           AutoPostBack="False" Checked="true" Text="M" />
            <asp:CheckBox ID="chkF" runat="server"           AutoPostBack="False" Checked="true" Text="F" />        
        </asp:Panel>
        
        <asp:Panel ID="PlaceHolder_WhereClauseControls_Groups" runat="server">
            <asp:Label ID="lblGroups" runat="server" Text="Groups:" CssClass = "right_align" Width="80px"></asp:Label>

            <asp:CheckBox ID="chkGRP_1" runat="server" AutoPostBack="false"  Checked="false" Text="g1" />
            <asp:CheckBox ID="chkGRP_2" runat="server" AutoPostBack="false"  Checked="false" Text="g2" />
            <asp:CheckBox ID="chkGRP_3" runat="server" AutoPostBack="false" Checked="false" Text="g3" />
            <asp:CheckBox ID="chkGRP_4" runat="server" AutoPostBack="false" Checked="false" Text="g4" />
            <asp:CheckBox ID="chkGRP_5" runat="server" AutoPostBack="false" Checked="false" Text="g5" />
            <asp:CheckBox ID="chkGRP_6" runat="server" AutoPostBack="false" Checked="false" Text="g6" />
            <asp:CheckBox ID="chkGRP_7" runat="server" AutoPostBack="false" Checked="false" Text="g7" />
            <asp:CheckBox ID="chkGRP_8" runat="server" AutoPostBack="false" Checked="false" Text="g8" />
        </asp:Panel>


        <asp:Panel ID="PlaceHolder_WhereClauseControls_Timepoints" runat="server">
            <asp:Label ID="lblTP" runat="server" Text="TimePoints:" CssClass = "right_align" Width="80px"></asp:Label>

            <asp:CheckBox ID="chkTP_1" runat="server" AutoPostBack="false" Checked="false" Text="tp1"  />
            <asp:CheckBox ID="chkTP_2" runat="server" AutoPostBack="false" Checked="false" Text="tp2"  />
            <asp:CheckBox ID="chkTP_3" runat="server" AutoPostBack="false" Checked="false" Text="tp3"  />
            <asp:CheckBox ID="chkTP_4" runat="server" AutoPostBack="false" Checked="false" Text="tp4"  />
            <asp:CheckBox ID="chkTP_5" runat="server" AutoPostBack="false" Checked="false" Text="tp5"  />
            <asp:CheckBox ID="chkTP_6" runat="server" AutoPostBack="false" Checked="false" Text="tp6"  />
            <asp:CheckBox ID="chkTP_7" runat="server" AutoPostBack="false" Checked="false" Text="tp7"  />
            <asp:CheckBox ID="chkTP_8" runat="server" AutoPostBack="false" Checked="false" Text="tp8"  />
        </asp:Panel>

</td>
<td width = "100px"></td>
<td>
    <asp:Panel ID="Panel_SubjStatus_Totals" runat="server">
    </asp:Panel>
</td>
</tr>
</table>

<br/>  
    <asp:Label ID="Label1" runat="server" Text="View details" Font-Size="Smaller"></asp:Label>
 <br/>  
        <asp:Button ID="ButtonAM" runat="server" Text="Actions>Measures, Consents" OnClick="setdata_AM" Font-Size="Smaller" Width = "150px" />
        <asp:Button ID="ButtonA" runat="server" Text="Actions" OnClick="setdata_A" Font-Size="Smaller"/>
        <asp:Button ID="ButtonM" runat="server" Text="Measures" OnClick="setdata_M" Font-Size="Smaller" />
        <asp:Button ID="ButtonC" runat="server" Text="Consents" OnClick="setdata_C" Font-Size="Smaller"/>
        <asp:Button ID="ButtonS" runat="server" Text="Subjects" OnClick="setdata_S" Font-Size="Smaller"/>
        <br/>

        <br/><br/>
        <asp:Label ID="LabelAM" runat="server" Text="Actions > Measures, Consents"  Visible="false" Font-Bold="true" Font-Size="Medium"></asp:Label>
        <asp:Label ID="LabelM" runat="server" Text="Measures" Visible="false" Font-Bold="true" Font-Size="Medium"></asp:Label>
        <asp:Label ID="LabelA" runat="server" Text="Actions" Visible="false" Font-Bold="true" Font-Size="Medium"></asp:Label>
        <asp:Label ID="LabelC" runat="server" Text="Consents" Visible="false" Font-Bold="true" Font-Size="Medium"></asp:Label>
        <asp:Label ID="LabelS" runat="server" Text="Subjects" Visible="false" Font-Bold="true" Font-Size="Medium"></asp:Label>





<table border = "0" width="100%" cellspacing="0" class="tblinputsmall_white" id="tblMaster" runat="server">
<tr><td id="tdNotes" runat="server">
 <br/>
    <asp:PlaceHolder ID="PlaceHolder1" runat="server"></asp:PlaceHolder>
</td></tr>

</table>
    
    <asp:Panel ID="Panel_SubjectDetails" runat="server">
    </asp:Panel>
    
<asp:SqlDataSource ID="Sql_Studies" runat="server" SelectCommandType="StoredProcedure"  
    SelectCommand="spSEC_GetStudies_CanView_by_User__Short__with_SelectStudy"  
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
