<%@ Page Language="c#" Debug="true" MasterPageFile="~/UWAC.master" CodeFile="StudyDesign2.aspx.cs" AutoEventWireup="true"
 Inherits="Info_StudyDesign2" Title="Study Design" %>
 <%@ MasterType VirtualPath="~/UWAC.master" %>



<asp:Content ID="Content1"  ContentPlaceHolderID="oBodyPlaceHolder" runat="server">
<style> .styleTBD   {   font: 8pt verdana;   font-weight:100;   color:SteelBlue;   outline-color:gray;}  </style>
<style> .styleData   {   font: 8pt verdana;   font-weight:100;   color:Green;   outline-color:gray;}  </style>
<style> .styleNA   {   font: 8pt verdana;   font-weight:100;   color:gray; outline-color:gray;    }  </style>
<style> .rowstyleAction   {   background-color:gray;  } </style>  
<style> .right_align { text-align: right; }  </style>
<style> .DataDictCell   { border-color:Gray;   font: 8pt verdana;   font-weight:100; border-width:thin;  color:black; outline-color:gray;    }  </style>
<style type="text/css"> .ErrorCell   { border-color:White;   font: 8pt verdana;   font-weight:100; border-width:thin;  color:red; }  </style>
<style type="text/css"> .InfoCell   { border-color:White;   font: 8pt verdana;   font-weight:100; border-width:thin;  color:Navy; }  </style>
<style type="text/css"> .ButtonText {font: 8pt verdana; color:Navy }</style>



    <br /> <br />
    <asp:Label ID="lblINTRO_studyname" runat="server" Text=" " Font-Size="Medium" Font-Bold="false"></asp:Label>
    <asp:Label ID="lblStudyname_ContentPage" runat="server" Text=" " Font-Size="Medium" Font-Bold="true"></asp:Label>
        <asp:Panel ID="PanelButtons" runat="server">
        <asp:Button ID="btnShowHideActions" runat="server" Text="Hide Actions" OnClick="ShowHideActions" CssClass="ButtonText" />&nbsp;&nbsp;
        <asp:Button ID="btnShowHideMeasures" runat="server" Text="Hide Measures" OnClick="ShowHideMeasures"  CssClass="ButtonText" />&nbsp;&nbsp;
        <asp:Button ID="btnShowHideConsents" runat="server" Text="Hide Consents" OnClick="ShowHideConsents"  CssClass="ButtonText" />&nbsp;&nbsp;
        <asp:Button ID="btnShowHideAM" runat="server" Text="Hide Act>Meas" OnClick="ShowHideAM"  CssClass="ButtonText" />&nbsp;&nbsp;
        <asp:Button ID="btnShowHideAC" runat="server" Text="Hide Act>Cons" OnClick="ShowHideAC"  CssClass="ButtonText" />&nbsp;&nbsp;
        <asp:Button ID="btnShowHideProblems" runat="server" Text="Hide Problems to fix" OnClick="ShowHideProblems"  CssClass="ButtonText" Visible="false"/>
  
    <!--
            <asp:CheckBox ID="chkShow_Actions" runat="server" Text="Actions" />
            <asp:CheckBox ID="chkShow_Meas" runat="server" Text="Measures" />
            <asp:CheckBox ID="chkShow_Consents" runat="server" Text="Consents" />
            <asp:CheckBox ID="chkShow_StudyAction_StudyMeas" runat="server" Text="Actions > Measures" />
            <asp:CheckBox ID="chkShow_StudyAction_StudyConsent" runat="server" Text="Actions > Consents" />
    -->

   </asp:Panel>
    <br />
    <br />
    <br />


 <table id="tblmyinfo" runat="server" width="100%">
 <tr><td font-color="red"></td></tr>
 </table>
 <table id="tblmyerror" runat="server" width="100%">
 <tr><td>
     <asp:Label ID="lblMyError" runat="server" Text="" CssClass="ErrorCell" ></asp:Label>
     <asp:Label ID="lblMyInfo" runat="server" Text="" CssClass="InfoCell" ></asp:Label>
 </td></tr>
 </table>


 <table id="Table1" runat="server">
    <tr>
        <td style="vertical-align:top" > 
           <asp:Panel ID="PanelR1C1" runat="server" Width="400px">        </asp:Panel> 
            <asp:Button ID="btnAddGroup" runat="server" Text="Add Group" OnClick="show_Panel_AddGroup"  CssClass="ButtonText"/>&nbsp&nbsp&nbsp&nbsp

            <asp:Button ID="btnAddTimepoint" runat="server" Text="Add Time Point" OnClick="show_Panel_AddTimepoint"  CssClass="ButtonText"/><br />

                    <asp:Panel ID="Panel_AddGroup" runat="server" Visible ="false">            
                        <asp:Label ID="Label3" runat="server"   CssClass="ButtonText" Text="Name:"></asp:Label><asp:TextBox ID="txt_groupname" runat="server"  CssClass="ButtonText" Width="100px"></asp:TextBox>
                        <asp:Label ID="Label4" runat="server"  CssClass="ButtonText" Text="Goal N:"></asp:Label><asp:TextBox ID="txt_goaln" runat="server"  CssClass="ButtonText" Width="40px"></asp:TextBox><br/>
                        <asp:Label ID="Label5" runat="server"  CssClass="ButtonText" Text="Desc:"></asp:Label><asp:TextBox ID="txt_groupdesc" runat="server"  CssClass="ButtonText" Width="150px"></asp:TextBox><br/>
                        <asp:Button ID="Button1" runat="server" Text="Insert Group" OnClick="Edit_AddGroup"   CssClass="ButtonText"/>&nbsp&nbsp&nbsp
                        <asp:Button ID="Button2" runat="server" Text="Cancel"  OnClick="HideAll_AddPanels"   CssClass="ButtonText"/>
                    </asp:Panel>

                    <asp:Panel ID="Panel_AddTimepoint" runat="server" Visible ="false">            
                        <asp:Label ID="Label6" runat="server" Text="#:"  CssClass="ButtonText"></asp:Label><asp:TextBox ID="txt_tpnumber" runat="server" CssClass="ButtonText" Width="30px"></asp:TextBox>&nbsp&nbsp&nbsp
                        <asp:Label ID="Label7" runat="server" Text="Name:"  CssClass="ButtonText"></asp:Label><asp:TextBox ID="txt_tpname" runat="server" CssClass="ButtonText" Width="60px"></asp:TextBox>

                        <asp:Label ID="Label8" runat="server" CssClass="ButtonText" Text="Var Rename Pattern:"/>
                         <asp:DropDownList ID="ddl_vrp" runat="server" DataSourceID="sql_vrp" DataTextField="ddl_label" DataValueField="vrpID"  width="100px" CssClass="ButtonText" ></asp:DropDownList>
                            <br/>            

                        <asp:Button ID="Button3" runat="server" Text="Insert Time point" OnClick="Edit_AddTimepoint"  CssClass="ButtonText"/>&nbsp&nbsp&nbsp
                        <asp:Button ID="Button4" runat="server" Text="Cancel"  OnClick="HideAll_AddPanels"  CssClass="ButtonText"/>
                    </asp:Panel>


</td>
        <td style="vertical-align:top" >   <asp:Panel ID="PanelR1C2" runat="server">        </asp:Panel>  

</td>
    <td style="vertical-align:top">
    <br/>


    </td>
    </tr>

 </table>
<br/><br/>


        <asp:Panel ID="Panel_AddAction" runat="server" Visible="false" BackColor="LightSkyBlue">
            <asp:Label ID="lblAddAction_Header" runat="server" Text="" Font-Size="Small" Font-Bold="true" CssClass="ButtonText"></asp:Label>
          <asp:Label ID="lblTimepointID" runat="server" Text="" Font-Size="Small" Font-Bold="true" CssClass="ButtonText"></asp:Label>
            <br/>            <br/>
            <asp:Label ID="Label1" runat="server" Text="New Action Type:" Font-Size="Small" Width="120px" CssClass="ButtonText"></asp:Label>
             <asp:DropDownList ID="ddl_ActionType" runat="server" DataSourceID="sql_ActionTypes" DataTextField="ActionType" DataValueField="actiontypeID"   Font-Size="Small" CssClass="ButtonText"></asp:DropDownList>
           <br />     <br />
            <asp:Label ID="Label9" runat="server" Text="New Action Name:" Font-Size="Small" Width="150px" CssClass="ButtonText"></asp:Label><br />
            <asp:TextBox ID="txt_actiontext" runat="server"  CssClass="ButtonText" Width="200px"></asp:TextBox>
           <br />     <br />
                        <asp:Button ID="Button5" runat="server" Text="Insert Action" OnClick="Edit_AddAction"  CssClass="ButtonText"/>&nbsp&nbsp&nbsp
                        <asp:Button ID="Button6" runat="server" Text="Cancel"  OnClick="HideAll_AddPanels"  CssClass="ButtonText"/>

         </asp:Panel>

            <br/>
    
        <asp:Panel ID="Panel_AddMeas" runat="server" Visible="false" BackColor="LightSkyBlue">
          <asp:Label ID="lblAddMeas_Header" runat="server" Text="" Font-Size="Small" Font-Bold="true" CssClass="ButtonText"></asp:Label>
          <asp:Label ID="lblStudyactionID" runat="server" Text="" Font-Size="Small" Font-Bold="true" CssClass="ButtonText"></asp:Label>
            <br/>            <br/>
            <asp:Label ID="Label2" runat="server" Text="New Measure:" Font-Size="Small" Width="120px"  CssClass="ButtonText"></asp:Label>
            <asp:DropDownList ID="ddl_Meas" runat="server" DataSourceID="sql_Meas" DataTextField="MeasName" DataValueField="measureID"  Font-Size="Small" CssClass="ButtonText"></asp:DropDownList><br/>
          
            <asp:Label ID="Label23" runat="server" Text="Var Rename Pattern:" Font-Size="Small" Width="120px"  CssClass="ButtonText"></asp:Label>
            <asp:DropDownList ID="ddl_AddMeas_vrp" runat="server" DataSourceID="sql_vrp" DataTextField="ddl_label" DataValueField="vrpID"  Font-Size="Small" CssClass="ButtonText"></asp:DropDownList>
            
            <br/><br/>
                        <asp:Button ID="Button7" runat="server" Text="Insert Measure" OnClick="Edit_AddMeas"  CssClass="ButtonText"/>&nbsp&nbsp&nbsp
                        <asp:Button ID="Button8" runat="server" Text="Cancel"  OnClick="HideAll_AddPanels"  CssClass="ButtonText"/>

        </asp:Panel>

        <asp:Panel ID="Panel_AddConsent" runat="server" Visible = "false" BackColor="LightSkyBlue">
                    <asp:Label ID="lblAddConsent_Header" runat="server" Text="" Font-Size="Small" Font-Bold="true" CssClass="ButtonText"></asp:Label>
                    <asp:Label ID="lblStudyactionID_consent" runat="server" Text="" Font-Size="Small" Font-Bold="true" CssClass="ButtonText"></asp:Label>
   
                        <br/>            <br/>
                        <asp:Label ID="Label13" runat="server" Text="Consent Form Name:" Font-Size="Small" Width="150px" CssClass="ButtonText"></asp:Label>
                        <asp:TextBox ID="txtNewConsentFormName" runat="server"  CssClass="ButtonText" Width="200px"></asp:TextBox>
                        <br />
                        <asp:Label ID="Label10" runat="server" Text="Effective date:" Font-Size="Small" Width="150px" CssClass="ButtonText"></asp:Label>
                        <asp:TextBox ID="effdate" runat="server"  CssClass="ButtonText" Width="200px"></asp:TextBox>
                        <br/><br/>
                        <asp:Button ID="Button11" runat="server" Text="Insert New Consent" OnClick="Edit_AddNewConsent"  CssClass="ButtonText"/>&nbsp&nbsp&nbsp
                        <br />
                        <asp:Button ID="Button10" runat="server" Text="Cancel"  OnClick="HideAll_AddPanels"  CssClass="ButtonText"/>
            </asp:Panel>




    <asp:Panel ID="Panel_EditAction" runat="server" Visible="false" BackColor="LightSkyBlue">
        <asp:Label ID="lbl_EditAction_studyactionID" runat="server" Text="" ForeColor="BlueViolet"></asp:Label>&nbsp;&nbsp;
        <asp:Label ID="Label17" runat="server" Text="TimePoint:"></asp:Label>
        <asp:DropDownList ID="ddl_EditAction_TimePoint" runat="server" DataSourceID= "sql_TimePoints" DataValueField="timepointID" DataTextField="timepoint_text"  >    </asp:DropDownList>
        &nbsp;&nbsp;&nbsp;
        <asp:Label ID="Label19" runat="server" Text="Type:"></asp:Label>
        <asp:DropDownList ID="ddl_EditAction_ActionType" runat="server" DataSourceID= "sql_ActionTypes" DataValueField="actiontypeID" DataTextField="ActionType"  >    </asp:DropDownList>
        &nbsp;&nbsp;&nbsp;

        <asp:Label ID="Label18" runat="server" Text="Action Text:"></asp:Label>
        <asp:TextBox ID="txt_EditAction_ActionText" runat="server"></asp:TextBox>
    
        <asp:Label ID="Label20" runat="server" Text="SortOrder:"></asp:Label>
        <asp:TextBox ID="txt_EditAction_SortOrder" runat="server"  Width="60px"></asp:TextBox>
    
        <asp:Button ID="btnEditAction_Submit" runat="server" Text="Submit" CssClass="ButtonText" OnClick="EditAction_Submit"/>&nbsp;&nbsp;&nbsp;
        <asp:Button ID="btnEditAction_Cancel" runat="server" Text="Cancel" CssClass="ButtonText" OnClick="EditAction_Cancel" />

    </asp:Panel>
 <table id="Table2" runat="server" width="100%">
<tr>
<td style="vertical-align:top" >    <asp:Panel ID="PanelR2C1" runat="server"></asp:Panel></td>
<td width = "30px"></td>
<td style="vertical-align:top" >    <asp:Panel ID="PanelR2C2" runat="server"></asp:Panel></td>
</tr> 
</table>




<br/>
<br/>


    <asp:Panel ID="Panel_EditSM" runat="server" Visible="false" BackColor="LightSkyBlue">
        <asp:Label ID="lbl_EditSM_studymeasID" runat="server" Text="" ForeColor="BlueViolet"></asp:Label>&nbsp;&nbsp;
        <asp:Label ID="Label22" runat="server" Text="TimePoint:"></asp:Label>
        <asp:DropDownList ID="ddl_EditSM_TimePoint" runat="server" DataSourceID= "sql_TimePoints" DataValueField="timepointID" DataTextField="timepoint_text"  >    </asp:DropDownList>
        &nbsp;&nbsp;&nbsp;

        <asp:Label ID="Label24" runat="server" Text="Name:"></asp:Label>
        <asp:TextBox ID="txt_EditSM_studymeasname" runat="server"></asp:TextBox>
        &nbsp;&nbsp;&nbsp;
    
        <asp:Label ID="Label21" runat="server" Text="VRP:"></asp:Label>
        <asp:DropDownList ID="ddl_EditSM_vrp" runat="server" DataSourceID="sql_vrp" DataTextField="ddl_label" DataValueField="vrpID"  Font-Size="Small" CssClass="ButtonText"></asp:DropDownList>
         
        <asp:Label ID="Label25" runat="server" Text="SortOrder:" Visible="false"></asp:Label>
        <asp:TextBox ID="txt_EditSM_SortOrder" runat="server"  Width="60px"  Visible="false"></asp:TextBox>
    
        <asp:Button ID="Button16" runat="server" Text="Submit" CssClass="ButtonText" OnClick="EditSM_Submit"/>&nbsp;&nbsp;&nbsp;
        <asp:Button ID="Button17" runat="server" Text="Cancel" CssClass="ButtonText" OnClick="EditSM_Cancel" />

    </asp:Panel>
    <br/>

 <table id="Table3" runat="server" width="100%">
<tr>
<td style="vertical-align:top" >    <asp:Panel ID="PanelR3C1" runat="server"></asp:Panel></td>
<td width = "30px"></td>
<td style="vertical-align:top" >    <asp:Panel ID="PanelR3C2" runat="server"></asp:Panel></td>
</tr> 
</table>

 <table id="Table4" runat="server" width="100%">
<tr>
<td style="vertical-align:top" >    <asp:Panel ID="PanelR4C1" runat="server"></asp:Panel></td>
<td width = "30px"></td>
<td style="vertical-align:top" >    <asp:Panel ID="PanelR4C2" runat="server"></asp:Panel></td>
</tr> 
</table>

<br />


    <asp:Panel ID="Panel_MoveSM" runat="server" Visible="false" BackColor="LightSkyBlue">
        <asp:Label ID="Label12" runat="server" Text="Moving studymeasID: "></asp:Label><asp:Label ID="lblSourceSM" runat="server" Text="Label"></asp:Label><br />
        <asp:Label ID="Label16" runat="server" Text="To studyactionID: "></asp:Label><asp:Label ID="lblDestSA" runat="server" Text="Label"></asp:Label><br />
        <asp:Button ID="Button9" runat="server" Text="Move it" OnClick="MoveSM"  CssClass="ButtonText"/>&nbsp;&nbsp;&nbsp;
        <asp:Button ID="Button14" runat="server" Text="Cancel" OnClick="Cancel_MoveSM" CssClass="ButtonText"/>
        <asp:CheckBox ID="chkAllowNewTimePoint" runat="server" Text="Allow move to new timepoint"/>
    </asp:Panel>

<br />
 <table id="Table5" runat="server" width="100%">
<tr>
<td style="vertical-align:top" >    <asp:Panel ID="PanelR5C1" runat="server"></asp:Panel></td>
<td width = "30px"></td>
<td style="vertical-align:top" >    <asp:Panel ID="PanelR5C2" runat="server"></asp:Panel></td>
</tr> 
</table>

<br />

 <table id="Table6" runat="server" width="100%">
<tr>
<td style="vertical-align:top" >    <asp:Panel ID="PanelR6C1" runat="server"></asp:Panel></td>
<td width = "30px"></td>
<td style="vertical-align:top" >    <asp:Panel ID="PanelR6C2" runat="server"></asp:Panel></td>
</tr> 
</table>

<br />

 <table id="Table7" runat="server" width="100%">
<tr>
<td style="vertical-align:top" >    <asp:Panel ID="PanelR7C1" runat="server"></asp:Panel></td>
<td width = "30px"></td>
<td style="vertical-align:top" >    <asp:Panel ID="PanelR7C2" runat="server"></asp:Panel></td>
</tr> 
</table>


        <asp:Panel ID="Panel_AddConsentVersion" runat="server" Visible="false">
                        <asp:Label ID="lblAddConsentVersion_Header" runat="server" Text="" Font-Size="Small" Font-Bold="true" CssClass="ButtonText"></asp:Label>
                        <asp:Label ID="lblConsentFormID_CFV" runat="server" Text="" Font-Size="Small" Font-Bold="true" CssClass="ButtonText"></asp:Label>
                                            <br/>            <br/>
                        <asp:Label ID="Label11" runat="server" Text="Version Name:" Font-Size="Small" Width="150px" CssClass="ButtonText"></asp:Label>
                        <asp:TextBox ID="txtCFVName" runat="server"  CssClass="ButtonText" Width="200px"></asp:TextBox>
                        <br />
                        <asp:Label ID="Label14" runat="server" Text="Effective date:" Font-Size="Small" Width="150px" CssClass="ButtonText"></asp:Label>
                        <asp:TextBox ID="txtCFVeffdate" runat="server"  CssClass="ButtonText" Width="200px"></asp:TextBox>
                        <br />
                        <asp:Label ID="Label15" runat="server" Text="Reason for change:" Font-Size="Small" Width="150px" CssClass="ButtonText"></asp:Label>
                        <asp:TextBox ID="txtReasonForChange" runat="server"  CssClass="ButtonText" Width="300px" Height="50px"></asp:TextBox>
                          <br />
                          <br />
                          <asp:Button ID="Button12" runat="server" Text="Add New Version" OnClick="Edit_AddCFV"  CssClass="ButtonText"/>&nbsp&nbsp&nbsp
                        <asp:Button ID="Button13" runat="server" Text="Cancel"  OnClick="HideAll_AddPanels"  CssClass="ButtonText"/>
                        <br />

        </asp:Panel>


       
<asp:SqlDataSource ID="sql_ActionTypes" runat="server" SelectCommandType="Text"  
    SelectCommand="select 0 as actiontypeID, '<select action type>' as ActionType union select actiontypeID, ActionType from tblActionType_lkup"  
    ConnectionString="<%$ ConnectionStrings: TRACKING_CONN_STRING %>">
   </asp:SqlDataSource>  

<asp:SqlDataSource ID="sql_Meas" runat="server" SelectCommandType="Text"  
    SelectCommand="select 0 as measureID, '<select measure>' as MeasName union Select * from (select top 100 percent measureID, MeasName from tblMeasure order by measname) x order by MeasName"  
    ConnectionString="<%$ ConnectionStrings: TRACKING_CONN_STRING %>">
   </asp:SqlDataSource>  

   <asp:SqlDataSource ID="sql_Consent" runat="server" SelectCommandType="Text"  
    SelectCommand="select 0 as consentformID, '<select consent>' as ConsentFormName union Select * from (select top 100 percent consentformID, ConsentFormName from vwStudyDesign_Studyconsents_1 order by ConsentFormName) x"  
    ConnectionString="<%$ ConnectionStrings: TRACKING_CONN_STRING %>">
   </asp:SqlDataSource>  

<asp:SqlDataSource ID="sql_vrp" runat="server" SelectCommandType="Text"  
    SelectCommand="select vrpID, ddl_label from tblVar_rename_pattern"  
    ConnectionString="<%$ ConnectionStrings: TRACKING_CONN_STRING %>">
   </asp:SqlDataSource>  


<asp:SqlDataSource ID="sql_TimePoints" runat="server" SelectCommandType="Text"  
    SelectCommand="select timepointID , timepoint_text 
            from tblTimepoint where studyID = (select dbo.fnSEC_Get_Default_StudyID_for_User())  order by timepoint"  
    ConnectionString="<%$ ConnectionStrings: TRACKING_CONN_STRING %>">
   </asp:SqlDataSource>  



</asp:Content>


