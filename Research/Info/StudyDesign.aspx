<%@ Page Language="c#" Debug="true" MasterPageFile="~/UWAC.master" CodeFile="StudyDesign.aspx.cs" AutoEventWireup="true"
 Inherits="Info_StudyDesign" Title="Study Design"  EnableEventValidation="false" %>
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


    <asp:Label ID="testlabel1" runat="server" Text="TestLabel 1" Visible="false"></asp:Label>
   <asp:ScriptManager ID="ScriptManager1" runat="server" EnablePartialRendering="true"      >
    </asp:ScriptManager>
    


<br />
    <asp:Label ID="lblINTRO_studyname" runat="server" Text=" " Font-Size="Medium" Font-Bold="false"></asp:Label>
    <asp:Label ID="lblStudyname_ContentPage" runat="server" Text=" " Font-Size="Medium" Font-Bold="true"></asp:Label>

    <br />


<asp:Panel ID="PanelButtons" runat="server">

    <br />

    <table>
    <tr>
    <td width="150px"  style="vertical-align:top">
        <asp:CheckBox ID="chkGroups" runat="server" Checked="false" Text="Groups" /><br />
        <asp:CheckBox ID="chkTimepoints" runat="server" Checked="false" Text="Timepoints"/><br />
    </td>
    <td width="150px"  style="vertical-align:top">
        <asp:CheckBox ID="chkActions" runat="server" Checked="false" Text="Actions" /><br />
        <asp:CheckBox ID="chkMeasures" runat="server" Checked="false" Text="Measures"/><br />
        <asp:CheckBox ID="chkConsents" runat="server" Checked="false" Text="Consents"/><br />
    </td>

    <td width="180px"  style="vertical-align:top">
        <asp:CheckBox ID="chkAM" runat="server" Checked="false" Text="Actions > Measures"/><br />
        <asp:CheckBox ID="chkAC" runat="server" Checked="false" Text="Actions > Consents"/><br />
    </td>

    <td width="180px" style="vertical-align:top">
        <asp:CheckBox ID="chkTriggers" runat="server" Checked="false" Text="Triggers"/><br />
        <asp:CheckBox ID="chkProblems" runat="server" Checked="false" Text="Problems to fix"/><br />
    </td>
    <td style="vertical-align:top">       
     <asp:Button ID="Button15" runat="server" Text="Load Study Design" OnClick="cmdLoadGrids" CssClass="ButtonText" />&nbsp;&nbsp;&nbsp;&nbsp;

    </td>
    <td style="vertical-align:top">  
          <asp:Button ID="Button20" runat="server" Text="Clear Logs" OnClick="ClearLogs" CssClass="ButtonText" /><br />
          <asp:Button ID="Button5" runat="server" Text="Reset Action Sort Order" OnClick="ResetActionSortOrder" CssClass="ButtonText" /><br />
          <asp:Button ID="Button6" runat="server" Text="Reset Measure Sort Order" OnClick="ResetMeasSortOrder" CssClass="ButtonText" />
     </td>
    <td style="vertical-align:top">  
          <%--<asp:Button ID="btn_CreateNewMeasure" runat="server" Text="Create new measure" OnClick="CreateNewMeasure_Begin" CssClass="ButtonText" /><br />--%>
         </td>

    </tr>

    </table>
 </asp:Panel>
    
    <br />


 
 <table id="Table9" runat="server" width="100%">
 <tr>
 <td style="vertical-align:top"  bgcolor="#E8E8E4" >

    <asp:UpdatePanel ID="UpdatePanel_Info" runat="server" UpdateMode="Conditional" ChildrenAsTriggers="true"   >
        <ContentTemplate>
            <asp:Label ID="lblUpdateInfo" runat="server" Text="" ForeColor="Black"></asp:Label>
            <asp:Label ID="lblUpdateError" runat="server" Text="" ForeColor="DarkRed"></asp:Label><br />              
        </ContentTemplate>
        
    </asp:UpdatePanel>
    <br />

</td></tr>
 </table>   



<%-- ADD GROUP  &  ADD TIMEPOINT--%>
 <table id="Table1" runat="server">
    <tr>
        <td style="vertical-align:top" > 
             <asp:Button ID="btnAddGroup" runat="server" Text="Add Group" OnClick="show_Panel_AddGroup" Visible="true"  CssClass="ButtonText"/>&nbsp&nbsp&nbsp&nbsp<br />
                         
           <asp:Panel ID="PanelR1C1" runat="server" Width="400px">        </asp:Panel> 
                    <asp:Panel ID="Panel_AddGroup" runat="server" Visible ="false"  BackColor="LightSkyBlue">            
                      <asp:Label ID="Label46" runat="server" Text="Adding Group..." Font-Size="Smaller"  ForeColor="BlueViolet" CssClass="ButtonText"></asp:Label><br />
                        <asp:Label ID="Label3" runat="server"   CssClass="ButtonText" Text="Name:"></asp:Label><asp:TextBox ID="txt_groupname" runat="server"  CssClass="ButtonText" Width="100px"></asp:TextBox>
                        <asp:Label ID="Label4" runat="server"  CssClass="ButtonText" Text="Goal N:"></asp:Label><asp:TextBox ID="txt_goaln" runat="server"  CssClass="ButtonText" Width="40px"></asp:TextBox><br/>
                        <asp:Label ID="Label5" runat="server"  CssClass="ButtonText" Text="Desc:"></asp:Label><asp:TextBox ID="txt_groupdesc" runat="server"  CssClass="ButtonText" Width="150px"></asp:TextBox><br/>
                     <asp:Label ID="Label42" runat="server"  CssClass="ButtonText" Text="Site:"></asp:Label>
                        <asp:DropDownList ID="ddlSite" runat="server" DataSourceID="sql_sites" DataTextField="SiteName" DataValueField="siteID">
                        </asp:DropDownList>

                     <br />
                        <asp:Button ID="Button1" runat="server" Text="Insert Group" OnClick="AddGroup_Submit"   Font-Size="X-Small" CssClass="ButtonText"/>&nbsp&nbsp&nbsp
                        <asp:Button ID="Button2" runat="server" Text="Cancel"  OnClick="CancelEditing"   Font-Size="X-Small" CssClass="ButtonText"/>
                        <br />
                        <br />
                    </asp:Panel>

                        <asp:Panel ID="Panel_EditGroup" runat="server" Visible ="false"  BackColor="LightSkyBlue">            
                      <asp:Label ID="Label48" runat="server" Text="Editing Group..." Font-Size="Smaller"  ForeColor="BlueViolet" CssClass="ButtonText"></asp:Label>
                       <asp:Label ID="lblGroupID" runat="server" Text="" Font-Size = "Smaller" Font-Bold="true" ForeColor="BlueViolet"></asp:Label>
                      <br />
                        <asp:Label ID="Label49" runat="server"   CssClass="ButtonText" Text="Name:"></asp:Label><asp:TextBox ID="etxt_groupname" runat="server"  CssClass="ButtonText" Width="100px"></asp:TextBox>
                        <asp:Label ID="Label50" runat="server"  CssClass="ButtonText" Text="Goal N:"></asp:Label><asp:TextBox ID="etxt_goaln" runat="server"  CssClass="ButtonText" Width="40px"></asp:TextBox><br/>
                        <asp:Label ID="Label51" runat="server"  CssClass="ButtonText" Text="Desc:"></asp:Label><asp:TextBox ID="etxt_groupdesc" runat="server"  CssClass="ButtonText" Width="150px"></asp:TextBox><br/>
                     <asp:Label ID="Label52" runat="server"  CssClass="ButtonText" Text="Site:"></asp:Label>

                        <asp:DropDownList ID="eddlSite" runat="server" DataSourceID="sql_sites" DataTextField="SiteName" DataValueField="siteID"></asp:DropDownList>

                     <br />
                        <asp:DropDownList ID="ddlCopyGroup" runat="server"  DataTextField="groupName" DataValueField="groupID"></asp:DropDownList>

                     <br />
                        <asp:Button ID="Button7" runat="server" Text="Submit Group Edits" OnClick="EditGroup_Submit"   Font-Size="X-Small" CssClass="ButtonText"/>&nbsp&nbsp&nbsp
                        <asp:Button ID="Button8" runat="server" Text="Cancel"  OnClick="CancelEditing"  Font-Size="X-Small"  CssClass="ButtonText"/>
                        <br />
                        <br />
                    </asp:Panel>


                    <asp:Panel ID="Panel_AddTimepoint" runat="server" Visible ="false"  BackColor="LightSkyBlue">   
                        <asp:Label ID="Label47" runat="server" Text="Adding Timepoint..." Font-Size="Smaller"  ForeColor="BlueViolet" CssClass="ButtonText"></asp:Label><br />
 
                        <asp:Label ID="Label6" runat="server" Text="#:"  CssClass="ButtonText"></asp:Label><asp:TextBox ID="txt_tpnumber" runat="server" CssClass="ButtonText" Width="30px"></asp:TextBox>&nbsp&nbsp&nbsp
                        <asp:Label ID="Label7" runat="server" Text="Name:"  CssClass="ButtonText"></asp:Label><asp:TextBox ID="txt_tpname" runat="server" CssClass="ButtonText" Width="60px"></asp:TextBox>

                        <asp:Label ID="Label8" runat="server" CssClass="ButtonText" Text="Var Rename Pattern:"/>
                         <asp:DropDownList ID="ddl_vrp" runat="server" DataSourceID="sql_vrp" DataTextField="ddl_label" DataValueField="vrpID"  width="100px" CssClass="ButtonText" ></asp:DropDownList>
                            <br/>            

                        <asp:Button ID="Button3" runat="server" Text="Insert Time point" OnClick="AddTimepoint_Submit"  Font-Size="X-Small" CssClass="ButtonText"/>&nbsp&nbsp&nbsp
                        <asp:Button ID="Button4" runat="server" Text="Cancel"  OnClick="CancelEditing"  Font-Size="X-Small" CssClass="ButtonText"/>
                        <br /><br />
                    </asp:Panel>


                    <asp:Panel ID="Panel_EditTimepoint" runat="server" Visible ="false"  BackColor="LightSkyBlue">   
                        <asp:Label ID="Label53" runat="server" Text="Editing Timepoint..." Font-Size="Smaller"  ForeColor="BlueViolet" CssClass="ButtonText"></asp:Label>
                         <asp:Label ID="edit_lblTimepointID" runat="server" Text="" Font-Size = "Smaller" Font-Bold="true" ForeColor="BlueViolet"></asp:Label>
                         <br />
 
                        <asp:Label ID="Label54" runat="server" Text="#:"  CssClass="ButtonText"></asp:Label><asp:TextBox ID="etxt_tpnumber" runat="server" CssClass="ButtonText" Width="30px"></asp:TextBox>&nbsp&nbsp&nbsp
                        <asp:Label ID="Label55" runat="server" Text="Name:"  CssClass="ButtonText"></asp:Label><asp:TextBox ID="etxt_tpname" runat="server" CssClass="ButtonText" Width="60px"></asp:TextBox>

                        <asp:Label ID="Label56" runat="server" CssClass="ButtonText" Text="Var Rename Pattern:"/>
                         <asp:DropDownList ID="eddl_vrp" runat="server" DataSourceID="sql_vrp" DataTextField="ddl_label" DataValueField="vrpID"  width="100px" CssClass="ButtonText" ></asp:DropDownList>
                            <br/>            

                        <asp:Button ID="Button9" runat="server" Text="Submit Time point edits" OnClick="EditTimepoint_Submit" Font-Size="X-Small"  CssClass="ButtonText"/>&nbsp&nbsp&nbsp
                        <asp:Button ID="Button10" runat="server" Text="Cancel"  OnClick="CancelEditing"   Font-Size="X-Small" CssClass="ButtonText"/>
                        <br /><br />
                    </asp:Panel>


</td>
        <td style="vertical-align:top" > 
         <asp:Button ID="btnAddTimepoint" runat="server" Text="Add Time Point" OnClick="show_Panel_AddTimepoint"  Visible="true"  CssClass="ButtonText"/><br />

          <asp:Panel ID="PanelR1C2" runat="server">        </asp:Panel>  

</td>
    <td style="vertical-align:top">
    <br/>


    </td>
    </tr>

 </table>


<table>
<tr>
<%-- PLACE EDITING PANELS HERE--%>
<td style="vertical-align:top"  bgcolor="#87cefa" >



    
<asp:UpdatePanel ID="Panel_AddAction" runat="server"  Visible="false" UpdateMode="Conditional" >
    <ContentTemplate>
<table>
        <tr><td style="vertical-align:top">

            <asp:Label ID="lblAddAction_Header" runat="server" Text="Adding Action..." Font-Size="Smaller"  ForeColor="BlueViolet" CssClass="ButtonText"></asp:Label>
            
            <br />
          <asp:Label ID="lblTimepointID" runat="server" Text="" Font-Size="Small" Font-Bold="true" CssClass="ButtonText"></asp:Label>
            <br/>          
        
        <asp:DropDownList ID="ddl_AddAction_TimePoint" runat="server" DataSourceID= "sql_TimePoints" DataValueField="timepointID" DataTextField="timepoint_text"  >    </asp:DropDownList>
        &nbsp;&nbsp;&nbsp;  <asp:Label ID="Label1" runat="server" Text="Action Type:" Font-Size="Small" Width="120px" CssClass="ButtonText"></asp:Label>
             <asp:DropDownList ID="ddl_AddAction_ActionType" runat="server" DataSourceID="sql_ActionTypes" DataTextField="ActionType" DataValueField="actiontypeID"   Font-Size="Small" CssClass="ButtonText"></asp:DropDownList>
<br />
            <asp:Label ID="Label9" runat="server" Text="Action Name:" Font-Size="Small" Width="150px" CssClass="ButtonText"></asp:Label><br />
            <asp:TextBox ID="txt_AddAction_actiontext" runat="server"   CssClass="ButtonText" Width="200px"></asp:TextBox>
        <asp:Label ID="Label29" runat="server" Text="SortOrder:"></asp:Label>
        <asp:TextBox ID="txt_AddAction_SortOrder" runat="server"   Width="60px"></asp:TextBox>
           <br />     <br />
  
                     <asp:Button ID="btn_AddAction_Submit" runat="server" Text="Insert Action" OnClick="AddAction_Submit"  CssClass="ButtonText" />&nbsp&nbsp&nbsp
                        <asp:Button ID="btn_AddAction_Cancel" runat="server" Text="Cancel"  OnClick="CancelEditing"  CssClass="ButtonText"/>
                        <br />
        </td>
        <td style="vertical-align:top">     
                
        
        </td> 
        <td>
        </td>
        </tr>
        </table>
        </ContentTemplate>
        <Triggers>
        <asp:PostBackTrigger ControlID="btn_AddAction_Submit" />
        <asp:PostBackTrigger ControlID="btn_AddAction_Cancel" />
        </Triggers>
</asp:UpdatePanel>


<asp:UpdatePanel ID="Panel_EditAction" runat="server" Visible="false" EnableViewState="true" UpdateMode="Conditional" ChildrenAsTriggers="true" >
<ContentTemplate>
        <table>
        <tr><td style="vertical-align:top">
         <asp:Label ID="Label44" runat="server" Text="Editing Action..." Font-Size = "Smaller" ForeColor="BlueViolet"></asp:Label>&nbsp;&nbsp;
        <asp:Label ID="lbl_EditAction_studyactionID" runat="server" Text="" Font-Size = "Smaller" Font-Bold="true" ForeColor="BlueViolet"></asp:Label>
        <br />
        <asp:Label ID="Label17" runat="server" Text="TimePoint:"></asp:Label>
        <asp:DropDownList ID="ddl_EditAction_TimePoint" runat="server" DataSourceID= "sql_TimePoints" DataValueField="timepointID" DataTextField="timepoint_text"  >    </asp:DropDownList>
        &nbsp;&nbsp;&nbsp;
        <asp:Label ID="Label19" runat="server" Text="Type:"></asp:Label>
        <asp:DropDownList ID="ddl_EditAction_ActionType" runat="server" DataSourceID= "sql_ActionTypes" DataValueField="actiontypeID" DataTextField="ActionType" 
            OnSelectedIndexChanged="ChangeActionType"  >    </asp:DropDownList>
        &nbsp;&nbsp;&nbsp;
        <br />
        <asp:Label ID="Label18" runat="server" Text="Action Text:"></asp:Label>
        <asp:TextBox ID="txt_EditAction_ActionText" runat="server" OnTextChanged="ChangeIn_EditAction" AutoPostBack="true"  EnableViewState="true"  ></asp:TextBox>
    <%----%>
        <asp:Label ID="Label20" runat="server" Text="SortOrder:"></asp:Label>
        <asp:TextBox ID="txt_EditAction_SortOrder" runat="server"  Width="60px"></asp:TextBox>
        <br />
        <asp:Button ID="btnEditAction_Submit" runat="server" Text="Submit" CssClass="ButtonText"  OnClick="EditAction_Submit" />&nbsp;&nbsp;&nbsp;
        <asp:Button ID="btnEditAction_Cancel" runat="server" Text="Cancel" CssClass="ButtonText" OnClick="CancelEditing" />
        <asp:Label ID="EditAction_IsDirty" runat="server" Text="" EnableViewState="true"></asp:Label>


        </td>
        </td>
        <td valign="bottom">           <asp:Button ID="btnDeleteAction_Submit" runat="server" Text="Delete" CssClass="ButtonText"  ForeColor="Red" 
        OnClick="DeleteAction_Submit"   />   </td> 
        <td style="vertical-align:top">     </td> 
        </tr>
        </table>
        </ContentTemplate>
        <Triggers>
        <asp:AsyncPostBackTrigger ControlID="ddl_EditAction_ActionType" EventName="SelectedIndexChanged"  />
        <asp:AsyncPostBackTrigger ControlID="txt_EditAction_ActionText" EventName="TextChanged"  />
        <asp:PostBackTrigger ControlID="btnDeleteAction_Submit" />
        <asp:PostBackTrigger ControlID="btnEditAction_Submit" />
        <asp:PostBackTrigger ControlID="btnEditAction_Cancel" />
        </Triggers>
    </asp:UpdatePanel>


<asp:UpdatePanel ID="Panel_AddMeas" runat="server" Visible="false" UpdateMode="Conditional"  >
<ContentTemplate>
     <table>
    <tr><td style="vertical-align:top">  
            <asp:Label ID="Label43" runat="server" Text="Adding Measure Into..." ForeColor="BlueViolet"></asp:Label>

          <asp:Label ID="lblAddMeas_Header" runat="server" Text="" Font-Size="Smaller" ForeColor="BlueViolet" Font-Bold="true" CssClass="ButtonText"></asp:Label>
          <asp:Label ID="lblStudyactionID" runat="server" Text="" Font-Size="Small" Font-Bold="true"  ForeColor="BlueViolet"  Visible="false" CssClass="ButtonText"></asp:Label>
            <br/>            <br/>
            <asp:Label ID="Label2" runat="server" Text="New Measure:" Font-Size="Small" Width="120px"  CssClass="ButtonText"></asp:Label>
            <asp:DropDownList ID="ddl_Meas" runat="server" DataSourceID="sql_Meas" DataTextField="MeasName" DataValueField="measureID" 
                OnSelectedIndexChanged="ChangeMeas" AutoPostBack="true"  Font-Size="Small" CssClass="ButtonText"></asp:DropDownList>
          <br />
          <asp:Label ID="Label26" runat="server" Text="Name:" Font-Size="Small" Font-Bold="true" CssClass="ButtonText"></asp:Label>
            <asp:TextBox ID="txt_AddMeas_studymeasname" runat="server" Width = "250px"></asp:TextBox>

            <br />
          <asp:Label ID="Label40" runat="server" Text="SortOrder:" Font-Size="Small" Font-Bold="true" CssClass="ButtonText"></asp:Label>
            <asp:TextBox ID="txt_AddMeas_SortOrder" runat="server" Width = "50px"></asp:TextBox>

            <asp:Label ID="Label23" runat="server" Text="Var Rename Pattern:" Font-Size="Small" Width="120px"  CssClass="ButtonText"></asp:Label>
            <asp:DropDownList ID="ddl_AddMeas_vrp" runat="server" DataSourceID="sql_vrp" DataTextField="ddl_label" DataValueField="vrpID"  Font-Size="Small" CssClass="ButtonText"></asp:DropDownList>

            <br/><br/><br/>
                        <asp:Button ID="btnAddMeas_Submit" runat="server" Text="Insert Measure" OnClick="AddMeas_Submit"  CssClass="ButtonText"/>&nbsp&nbsp&nbsp
                        <asp:Button ID="btnAddMeas_Cancel" runat="server" Text="Cancel"  OnClick="CancelEditing"  CssClass="ButtonText"/>
    </td>
<%--    <td style="vertical-align:top">     <asp:Panel ID="Panel_AddMeas_Groups_for_Editing" runat="server" Visible="true" BackColor="LightSkyBlue"></asp:Panel></td> --%>    
    </tr>
    </table>
    </ContentTemplate>
     <Triggers>
        <asp:AsyncPostBackTrigger ControlID="ddl_Meas" EventName="SelectedIndexChanged"  />
        <asp:AsyncPostBackTrigger ControlID="txt_AddMeas_studymeasname" EventName="TextChanged"  />
        <asp:PostBackTrigger ControlID="btnAddMeas_Submit" />
        <asp:PostBackTrigger ControlID="btnAddMeas_Cancel" />
        </Triggers>
</asp:UpdatePanel>

 <asp:UpdatePanel ID="Panel_EditMeas" runat="server" Visible="false"  EnableViewState="true" UpdateMode="Conditional" ChildrenAsTriggers="true">
 <ContentTemplate>
        <table>
        <tr><td style="vertical-align:top">
        <asp:Label ID="Label41" runat="server" Text="Editing Study Measure..." ForeColor="BlueViolet"></asp:Label>
        
        <asp:Label ID="lbl_EditSM_studymeasID" runat="server" Text="" ForeColor="BlueViolet"></asp:Label>&nbsp;&nbsp;<br />
        <asp:Label ID="Label22" runat="server" Text="TimePoint:"></asp:Label>
        <asp:DropDownList ID="ddl_EditSM_TimePoint" runat="server" DataSourceID= "sql_TimePoints" DataValueField="timepointID" DataTextField="timepoint_text"  >    </asp:DropDownList>
        &nbsp;&nbsp;&nbsp;

        <asp:Label ID="Label24" runat="server" Text="Name:"></asp:Label>
        <asp:TextBox ID="txt_EditSM_studymeasname" runat="server" Width = "250px"></asp:TextBox>
        <br />

        <asp:Label ID="Label25" runat="server" Text="SortOrder:" Visible="true"></asp:Label>
        <asp:TextBox ID="txt_EditSM_SortOrder" runat="server"  Width="60px"  Visible="true"></asp:TextBox> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

    
        <asp:Label ID="Label21" runat="server" Text="VRP:"></asp:Label>
        <asp:DropDownList ID="ddl_EditSM_vrp" runat="server" DataSourceID="sql_vrp" DataTextField="ddl_label" DataValueField="vrpID"  Font-Size="Small" CssClass="ButtonText"></asp:DropDownList>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Label ID="Label10" runat="server" Text="Data table NA (0=No,1=Yes):"></asp:Label>
        <asp:TextBox ID="txt_EditSM_FlagSQLtable_isNA" runat="server"  Width="60px"  Visible="true"></asp:TextBox> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;




         <br /><br />    
        <asp:Button ID="btn_EditMeas_Submit" runat="server" Text="Submit" CssClass="ButtonText" OnClick="EditMeas_Submit"/>&nbsp;&nbsp;&nbsp;
        <asp:Button ID="btn_EditMeas_Cancel" runat="server" Text="Cancel" CssClass="ButtonText" OnClick="CancelEditing" />
        </td>
        <td valign="bottom">           <asp:Button ID="btn_DeleteMeas_Submit" runat="server" Text="Delete" CssClass="ButtonText" ForeColor="Red" OnClick="DeleteMeas_Submit"/>  </td> 
        </tr>
        </table>
        </ContentTemplate>
        <Triggers>
        <asp:AsyncPostBackTrigger ControlID="ddl_EditSM_TimePoint" EventName="SelectedIndexChanged"  />
        <asp:AsyncPostBackTrigger ControlID="ddl_EditSM_vrp" EventName="SelectedIndexChanged"  />
        <asp:AsyncPostBackTrigger ControlID="txt_EditSM_studymeasname" EventName="TextChanged"  />

        <asp:PostBackTrigger ControlID="btn_DeleteMeas_Submit" />
        <asp:PostBackTrigger ControlID="btn_EditMeas_Submit" />
        <asp:PostBackTrigger ControlID="btn_EditMeas_Cancel" />
        </Triggers>
    </asp:UpdatePanel>


<%--
<asp:UpdatePanel ID="Panel_AddConsent" runat="server" Visible = "false" >
<ContentTemplate>
        <table>
        <tr><td style="vertical-align:top">  
        <asp:Label ID="Label45" runat="server" Text="Adding Consent..." ForeColor="BlueViolet"></asp:Label>
                    <asp:Label ID="lblAddConsent_Header" runat="server" Text="" Font-Size="Small" Font-Bold="true" CssClass="ButtonText"></asp:Label>
                    <asp:Label ID="lblStudyactionID_consent" runat="server" Text="" Font-Size="Small" Font-Bold="true" CssClass="ButtonText"></asp:Label>
   
                        <br/>            <br/>
                        <asp:Label ID="Label13" runat="server" Text="Consent Form Name:" Font-Size="Small" Width="150px" CssClass="ButtonText"></asp:Label>
                        <asp:TextBox ID="txtNewConsentFormName" runat="server"  CssClass="ButtonText" Width="200px"></asp:TextBox>
                        <br />
                        <asp:Label ID="Label58" runat="server" Text="Consent Form Name Short:" Font-Size="Small" Width="150px" CssClass="ButtonText"></asp:Label>
                        <asp:TextBox ID="txtNewConsentFormNameShort" runat="server"  CssClass="ButtonText" Width="200px"></asp:TextBox>
                        <br />
                        <asp:Label ID="Label10" runat="server" Text="Effective date:" Font-Size="Small" Width="150px" CssClass="ButtonText"></asp:Label>
                        <asp:TextBox ID="effdate" runat="server"  CssClass="ButtonText" Width="200px"></asp:TextBox>
                        <br/><br/>
                        <asp:Button ID="btn_AddConsent_SubmitOLD" runat="server" Text="Insert New Consent" OnClick="AddConsent_submit"  CssClass="ButtonText"/>&nbsp&nbsp&nbsp
                        <br />
                        <asp:Button ID="btn_AddConsent_Cancel" runat="server" Text="Cancel"  OnClick="CancelEditing"  CssClass="ButtonText"/>

        </td>
        <td style="vertical-align:top">     <asp:Panel ID="Panel_AddConsent_Groups_for_Editing" runat="server" Visible="true" BackColor="LightSkyBlue"></asp:Panel></td> 
        </tr>
        </table>
        </ContentTemplate>
        <Triggers>
                <asp:PostBackTrigger ControlID="btn_AddConsent_SubmitOLD" />
        <asp:PostBackTrigger ControlID="btn_AddConsent_Cancel" />
        </Triggers>
</asp:UpdatePanel>

--%>
<%--<asp:UpdatePanel ID="Panel_EditConsent" runat="server" Visible = "false" >
<ContentTemplate>
        <table>
        <tr><td style="vertical-align:top">  
        <asp:Label ID="lblEditConsent_Header" runat="server" Text="Editing Consent..." ForeColor="BlueViolet"></asp:Label>
                    <asp:Label ID="editlblStudyactionID_consent" runat="server" Text="" Visible="false"></asp:Label>
   
                        <br/>            <br/>
                        <asp:Label ID="Label60" runat="server" Text="Consent Form Name:" Font-Size="Small" Width="150px" CssClass="ButtonText"></asp:Label>
                        <asp:TextBox ID="edittxtNewConsentFormName" runat="server"  CssClass="ButtonText" Width="200px"></asp:TextBox>
                        <br/><br/>
                        <asp:Button ID="btn_EditConsent_Submit" runat="server" Text="Submit Changes to Consent" OnClick="EditConsent_Submit"  CssClass="ButtonText"/>&nbsp&nbsp&nbsp
                        <br />
                        <asp:Button ID="btn_EditConsent_Cancel" runat="server" Text="Cancel"  OnClick="CancelEditing"  CssClass="ButtonText"/>

        </td>
        <td style="vertical-align:top">     <asp:Panel ID="Panel_EditConsent_Groups_for_Editing" runat="server" Visible="true" BackColor="LightSkyBlue"></asp:Panel></td> 
        </tr>
        </table>
        </ContentTemplate>
        <Triggers>
                <asp:PostBackTrigger ControlID="btn_EditConsent_Submit" />
        <asp:PostBackTrigger ControlID="btn_EditConsent_Cancel" />
        </Triggers>
</asp:UpdatePanel>--%>



<%-- <asp:UpdatePanel ID="Panel_AddConsentVersion" runat="server" Visible="false">
 <ContentTemplate>
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
                            ...add items here...
                          <br />
                          <asp:Button ID="Button12" runat="server" Text="Add New Version" OnClick="AddCFV_submit"  CssClass="ButtonText"/>&nbsp&nbsp&nbsp
                        <asp:Button ID="Button13" runat="server" Text="Cancel"  OnClick="HideAll_AddPanels"  CssClass="ButtonText"/>
                        <br />
</ContentTemplate>
        </asp:UpdatePanel>

--%>

 <asp:UpdatePanel ID="Panel_EditConsentVersion" runat="server" Visible="false" UpdateMode="Conditional">
 <ContentTemplate>
         <table>
        <tr><td style="vertical-align:top">  

                         <asp:Label ID="editCSVID" runat="server" Text="" Visible="false"></asp:Label>
                         <asp:Label ID="editstudyactionID_for_newC" runat="server" Text="" Visible="false"></asp:Label>
                         
                        <asp:Label ID="lblEditConsentVersion_Header" runat="server" Text="" Font-Size="Smaller"  ForeColor="BlueViolet"></asp:Label>
                        <asp:Label ID="Label62" runat="server" Text="" Font-Size="Small" Font-Bold="true" CssClass="ButtonText"></asp:Label>
                        <br/>            
                        <asp:Label ID="Label66" runat="server" Text="Consent Name:" Font-Size="Small" Width="120px" CssClass="ButtonText"></asp:Label>
                        <asp:TextBox ID="edittxtConsentName" runat="server"  CssClass="ButtonText" Width="300px"></asp:TextBox>
                        <br />
                        <asp:Label ID="Label59" runat="server" Text="Consent Name (short):" Font-Size="Small" Width="150px" CssClass="ButtonText"></asp:Label>
                        <asp:TextBox ID="edittxtConsentNameShort" runat="server"  CssClass="ButtonText" Width="150px"></asp:TextBox>
                        <br />
                        <br />
                        <asp:Label ID="Label61" runat="server" Text="Version Number:" Font-Size="Small" Width="120px" CssClass="ButtonText"></asp:Label>
                        <asp:Label ID="edittxtCFVNumber" runat="server"  CssClass="ButtonText" Width="100px"></asp:Label>
                        <br />
                        <asp:Label ID="Label63" runat="server" Text="Version Name:" Font-Size="Small" Width="120px" CssClass="ButtonText"></asp:Label>
                        <asp:TextBox ID="edittxtCFVName" runat="server"  CssClass="ButtonText" Width="100px"></asp:TextBox>
                        <br />
                        <asp:Label ID="Label67" runat="server" Text="Approved date:" Font-Size="Small" Width="120px" CssClass="ButtonText"></asp:Label>
                        <asp:TextBox ID="edittxtCFVapprvdate" runat="server"  CssClass="ButtonText" Width="100px"></asp:TextBox>
                        <br />
                        <asp:Label ID="Label64" runat="server" Text="Effective date:" Font-Size="Small" Width="120px" CssClass="ButtonText"></asp:Label>
                        <asp:TextBox ID="edittxtCFVeffdate" runat="server"  CssClass="ButtonText" Width="100px"></asp:TextBox>
                        <br />
                        <asp:Label ID="Label57" runat="server" Text="Ending date:" Font-Size="Small" Width="120px" CssClass="ButtonText"></asp:Label>
                        <asp:TextBox ID="edittxtCFVenddate" runat="server"  CssClass="ButtonText" Width="100px"></asp:TextBox>
                        <br />
                        <asp:Label ID="Label65" runat="server" Text="Reason for change:" Font-Size="Small" Width="120px" CssClass="ButtonText"></asp:Label>
                        <asp:TextBox ID="edittxtReasonForChange" runat="server"  CssClass="ButtonText" TextMode="MultiLine" Width="400px" Height="70px"></asp:TextBox>
                          <br />

                          <br />
                          <asp:Button ID="btn_AddCFV_Submit" runat="server" Text="Insert New Consent Version" OnClick="AddCFV_submit"  CssClass="ButtonText"/>&nbsp&nbsp&nbsp
                          <asp:Button ID="btn_AddConsent_Submit" runat="server" Text="Insert New Consent" OnClick="AddConsent_submit"  CssClass="ButtonText"/>&nbsp&nbsp&nbsp
                          <asp:Button ID="btn_EditCFV_Submit" runat="server" Text="Submit Changes to Consent" OnClick="EditCFV_submit"  CssClass="ButtonText"/>&nbsp&nbsp&nbsp
                        <asp:Button ID="btn_EditCFV_Cancel" runat="server" Text="Cancel"  OnClick="CancelEditing"  CssClass="ButtonText" ForeColor="Black"/>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:Button ID="btn_EditCFV_Delete" runat="server" Text="Delete"  OnClick="DeleteCFV_submit"  CssClass="ButtonText" ForeColor="Red"/>
                        <br />
                        <asp:Label ID="editConsent_INFO" runat="server" Text="" ForeColor="DarkRed"></asp:Label>
                          </td>
        <td style="vertical-align:top">     
        <asp:Panel ID="Panel_EditCFV_Groups_for_Editing" runat="server" Visible="true" BackColor="LightSkyBlue"></asp:Panel>
        
        </td> 
        </tr>
        <tr><td colspan="2">
        <br />
        <asp:UpdatePanel ID="Panel_EditCFV_Items" runat="server" Visible="true" ChildrenAsTriggers="true" UpdateMode="Conditional" >
        <ContentTemplate>
        
            <asp:GridView ID="gv_EditCFV_Items" runat="server" BackColor="LightSkyBlue"   EnableViewState="true" 
            AutoGenerateColumns="false" AutoGenerateEditButton="true" 
             OnRowDataBound="gv_EditCFV_Items_RowDataBound" OnRowEditing="gv_EditCFV_Items_RowEditing" OnRowCancelingEdit="gv_EditCFV_Items_RowCancelingEdit" 
              OnRowUpdating="gv_EditCFV_Items_RowUpdating" OnRowUpdated="gv_EditCFV_Items_RowUpdated">
            <EmptyDataTemplate><br />No items are present on this consent form version.</EmptyDataTemplate>
            
            <Columns>
            <asp:TemplateField>
            <HeaderTemplate>  <asp:Label ID="lblCI_col1" runat="server" Text="cfv_ciID"></asp:Label></HeaderTemplate>
            <ItemTemplate>    <asp:Label ID="lblCI_cfv_ciID" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "cfv_ciID") %>'   ></asp:Label></ItemTemplate>
            <EditItemTemplate><asp:Label ID="txtCI_cfv_ciID" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "cfv_ciID") %>'   ></asp:Label></EditItemTemplate>
            
            </asp:TemplateField>

                       
            <asp:TemplateField>
            <HeaderTemplate>  <asp:Label ID="lblCI_col3" runat="server" Text="Item Text"></asp:Label></HeaderTemplate>
            <ItemTemplate>    <asp:Label ID="lblCI_ConsentItemText" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "ConsentItemText") %>'   ></asp:Label></ItemTemplate>
            <EditItemTemplate><asp:TextBox ID="txtCI_ConsentItemText" runat="server" Width="200px" Text='<%# DataBinder.Eval(Container.DataItem, "ConsentItemText") %>' Font-Size="X-Small"   ></asp:TextBox></EditItemTemplate>
            </asp:TemplateField>
            
            <asp:TemplateField>
            <HeaderTemplate>  <asp:Label ID="lblCI_col4" runat="server" Text="Item Text Long"></asp:Label></HeaderTemplate>
            <ItemTemplate>    <asp:Label ID="lblCI_ConsentItemText_long" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "ConsentItemText_long") %>'   ></asp:Label></ItemTemplate>
            <EditItemTemplate><asp:TextBox ID="txtCI_ConsentItemText_long" runat="server" TextMode="MultiLine" Height="100px" Width="600px" Text='<%# DataBinder.Eval(Container.DataItem, "ConsentItemText_long") %>' Font-Size="Small"   ></asp:TextBox></EditItemTemplate>
            </asp:TemplateField>
            
            <asp:TemplateField>
            <HeaderTemplate>  <asp:Label ID="lblCI_col5" runat="server" Text="Default Option"></asp:Label></HeaderTemplate>
            <ItemTemplate>    <asp:Label ID="lblCI_OptionText" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "DefaultOption") %>'   ></asp:Label></ItemTemplate>
            <EditItemTemplate><asp:DropDownList ID="ddlCI_OptionText" runat="server"  Font-Size="X-Small"   ></asp:DropDownList>
                <asp:HiddenField ID="hidCI_OptionText" runat="server" Value='<%# DataBinder.Eval(Container.DataItem, "DefaultOption") %>'   />
            </EditItemTemplate>
            </asp:TemplateField>
            
            <asp:TemplateField>
            <HeaderTemplate>  <asp:Label ID="lblCI_col6" runat="server" Text="Options"></asp:Label></HeaderTemplate>
            <ItemTemplate>    <asp:Label ID="lblCI_Options" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "Options") %>'   ></asp:Label></ItemTemplate>
            <EditItemTemplate><asp:Label ID="txtCI_Options" runat="server" Width="200px" Text='<%# DataBinder.Eval(Container.DataItem, "Options") %>' Font-Size="X-Small"   ></asp:Label></EditItemTemplate>
            </asp:TemplateField>

            </Columns>

            </asp:GridView>
            <br /><br />

            <asp:UpdatePanel ID="UpdatePanel_AddCI" runat="server" Visible="false" UpdateMode="Conditional">
            <ContentTemplate>
            <table>
            <tr>
            <td style="vertical-align:top">
            <asp:Label ID="lbladdCI_step1" runat="server" Text="Step 1: Define the item" Font-Underline="true"  /> <br />
                <asp:Label ID="lbladdCI_ConsentItemText" runat="server" Text="Item text:" Width="100px"/> <asp:TextBox ID="txtaddCI_ConsentItemText" runat="server" Width="200px"/><br />
                <asp:Label ID="lbladdCI_ConsentItemText_long" runat="server" Text="Item text - long:"  Width="100px"/> <asp:TextBox ID="txtaddCI_ConsentItemText_long" runat="server" Width = "300px" Height="100px" TextMode="MultiLine"/><br />

            </td>
            <td style="vertical-align:top">
            <asp:Label ID="lbladdCI_step2" runat="server" Text="Step 2: Define any new options" Font-Underline="true"  /> <br />
            <asp:Label ID="Label11" runat="server" Text="Yes,No,Unknown added by default" Font-Italic="true"/> <br /><br />
                <asp:Label ID="lbladdCIO_OptionText" runat="server" Text="Option text:"  Width="100px"/> <asp:TextBox ID="txtaddCIO_OptionText" runat="server" /><br />
                <asp:Label ID="lbladdCIO_OptionTextLong" runat="server" Text="Option text - long:"  Width="100px" /> <asp:TextBox ID="txtaddCIO_OptionTextLong" runat="server" Width = "250px" Height="40px" TextMode="MultiLine"/><br />
                <asp:Button ID="btn_AddCIO" runat="server" Text="Add option" OnClick="AddCIO" Font-Size="X-Small" /><br />
                <asp:Label ID="lblTempCIO" runat="server" Text="" Fore-Color="DarkBlue"/> 
            </td>
            <td style="vertical-align:top">
                <asp:Label ID="lbladdCI_step3" runat="server" Text="Step 3: Select the default option" Font-Underline="true"  /> <br />
                <asp:DropDownList ID="ddladdCI_DefaultOptionText" runat="server"  AppendDataBoundItems="true" Font-Size="Small"   >
<%--                <asp:ListItem Text="--Select default--" Value="--Select default--" ></asp:ListItem>
                <asp:ListItem Text="Unknown" Value="Unknown" ></asp:ListItem>--%>
                </asp:DropDownList>
                <br /><br /><br /><br />
                <asp:Button ID="btn_AddCI_submit" runat="server" Text="Submit new consent item" Font-Size="Smaller"   OnClick="AddCI_submit" />
               <br /><br />
<asp:Button ID="btn_AddCI_cancel" runat="server" Text="Cancel" Font-Size="Smaller" ForeColor="Red"   OnClick="AddCI_cancel" />
               <br />
                <asp:Label ID="lbladdCIO_Error" runat="server" Text=""  />
              
            </td>
            </tr>
            </table>
            <br />
            
                </ContentTemplate>
                <Triggers>
                <asp:AsyncPostBackTrigger ControlID="btn_AddCIO" EventName="Click"/>
                <asp:PostBackTrigger ControlID="btn_AddCI_submit"   />
                </Triggers>
            </asp:UpdatePanel>


              <asp:Button ID="btn_AddCI" runat="server" Text="Add item to this consent" OnClick="AddCI" Font-Size="Smaller" />
              
        </ContentTemplate>
        <Triggers>
            <asp:PostBackTrigger ControlID="gv_EditCFV_Items" />

        </Triggers>
        </asp:UpdatePanel>
        
        </td></tr>
        </table>

</ContentTemplate>
<Triggers>
<asp:PostBackTrigger ControlID="btn_EditCFV_Submit" />
<asp:PostBackTrigger ControlID="btn_AddConsent_Submit" />
<asp:PostBackTrigger ControlID="btn_AddCFV_Submit" />
<asp:PostBackTrigger ControlID="btn_EditCFV_Cancel" />
<asp:PostBackTrigger ControlID="btn_EditCFV_Delete" />
</Triggers>
        </asp:UpdatePanel>

<asp:UpdatePanel ID="Panel_AddTrigger" runat="server" Visible="false" >
<ContentTemplate>
     <table>
    <tr><td style="vertical-align:top"> 
                <asp:Label ID="lblAddTrigger_StudyactionID" runat="server" Text="" Font-Size="Smaller" Font-Bold="false" ForeColor="Purple" CssClass="ButtonText"></asp:Label>
            <asp:Label ID="lblAddTrigger_Header" runat="server" Text="" Font-Size="Small" Font-Bold="true" CssClass="ButtonText"></asp:Label>
             
            <br/> 
            <asp:Label ID="Label34" runat="server" Text="Trigger Description:" Font-Size="Smaller" CssClass="ButtonText"></asp:Label><br />
            <asp:TextBox ID="txt_AddTrigger_TriggerDesc" runat="server" Width ="300px"></asp:TextBox>
            <br/>
            <asp:Label ID="Label28" runat="server" Text="Trigger will fire when this studyaction is set to: " Font-Size="Smaller" Width="200px"  CssClass="ButtonText"></asp:Label>
            <br />
            <asp:DropDownList ID="ddl_AddTrigger_actionstatus" runat="server" Font-Size="Small" CssClass="ButtonText"></asp:DropDownList>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
             <br />
            <asp:Button ID="btn_AddTrigger_Submit" runat="server" Text="Create Trigger" OnClick="AddTrigger_Submit"  CssClass="ButtonText"/>&nbsp&nbsp&nbsp
            <asp:Button ID="btn_AddTrigger_Canel" runat="server" Text="Cancel"  OnClick="CancelEditing"  CssClass="ButtonText"/>
            <br />
    </td>
    <td style="vertical-align:top">     <asp:Panel ID="Panel_AddTrigger_Groups_for_Editing" runat="server" Visible="true" BackColor="LightSkyBlue"></asp:Panel></td> 
    </tr>
    </table>
    </ContentTemplate>
    <Triggers>
                    <asp:PostBackTrigger ControlID="btn_AddTrigger_Submit" />
        <asp:PostBackTrigger ControlID="btn_AddTrigger_Canel" />
    </Triggers>
</asp:UpdatePanel>



<asp:UpdatePanel ID="Panel_EditTrigger" runat="server" Visible="false" >
<ContentTemplate>
     <table>
    <tr><td style="vertical-align:top">  
            <asp:Label ID="lblEditTrigger_TriggerID" runat="server" Text="" Font-Size="Smaller" Font-Bold="false" ForeColor="Purple" CssClass="ButtonText"></asp:Label>  &nbsp; &nbsp; &nbsp; &nbsp;
            <asp:Label ID="lblEditTrigger_StudyactionID" runat="server" Text="" Font-Size="Smaller" Font-Bold="false" ForeColor="Purple" CssClass="ButtonText"></asp:Label>
            <asp:Label ID="lblEditTrigger_Header" runat="server" Text="" Font-Size="Smaller" Font-Bold="true" CssClass="ButtonText"></asp:Label>
            
            <br/>
            <asp:Label ID="Label30" runat="server" Text="Trigger Description:" Font-Size="Smaller" CssClass="ButtonText"></asp:Label><br />
            <asp:TextBox ID="txt_EditTrigger_TriggerDesc" runat="server" Width ="300px"></asp:TextBox>
            <br/>
            <asp:Label ID="Label35" runat="server" Text="Trigger will fire when this studyaction is set to: " Font-Size="Smaller" Width="300px"  CssClass="ButtonText"></asp:Label>
            <br />
            <asp:DropDownList ID="ddl_EditTrigger_actionstatus" runat="server" Font-Size="Small" CssClass="ButtonText"></asp:DropDownList>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
             <br />
            <asp:Button ID="Button18" runat="server" Text="Update Trigger" OnClick="EditTrigger_Submit"  CssClass="ButtonText"/>&nbsp;&nbsp;&nbsp;
            <asp:Button ID="Button21" runat="server" Text="Cancel"  OnClick="CancelEditing"  CssClass="ButtonText"/>
            <br /><br />
    </td>
    <td style="vertical-align:top">     <asp:Panel ID="Panel_EditTrigger_Groups_for_Editing" runat="server" Visible="true" BackColor="LightSkyBlue"></asp:Panel></td> 
    <td style="vertical-align:top">    
        <br />
        <asp:Button ID="Button22" runat="server" Text="Add Due Date"  OnClick="show_Panel_AddTrigger_DueDate"  CssClass="ButtonText"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <br />
        <br />
        <asp:Button ID="Button23" runat="server" Text="Add Other"  OnClick="Cancel_AddDueDate"  CssClass="ButtonText"/> 
        <br />       
    </td>
        <td style="vertical-align:top">    
        <br />
        <asp:Button ID="Button25" runat="server" Text="Delete Trigger"  OnClick="DeleteTrigger_Submit"  Forecolor="Red" CssClass="ButtonText"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    </td>
    </tr>
    </table>
    </ContentTemplate>
</asp:UpdatePanel>



<asp:Panel ID="Panel_AddTrigger_DueDate" runat="server" Visible="false" BackColor="LightSkyBlue">
            <asp:Label ID="lblAddTrigger_DueDate_triggerID" runat="server" Text="" Font-Size="Smaller" Forecolor="Purple" CssClass="ButtonText"></asp:Label>&nbsp;&nbsp;&nbsp;
            <asp:Label ID="lblAddTrigger_DueDate_triggerdateID" runat="server" Text="" Font-Size="Smaller" Forecolor="Purple" CssClass="ButtonText"></asp:Label>
            <asp:Label ID="Label16" runat="server" Text="" Font-Size="Small" Font-Bold="true" CssClass="ButtonText"></asp:Label>
            <br/> 
            <br/>
            <asp:Label ID="Label31" runat="server" Text="Set due date for " Font-Size="Small" Width="130px"  Font-Bold="true" CssClass="ButtonText"></asp:Label>
            <asp:DropDownList ID="ddlSA_for_DueDate" runat="server" DataSourceID="sql_SA_for_DueDates" DataTextField="action_label" DataValueField="studyactionID"  Font-Size="Small" CssClass="ButtonText"></asp:DropDownList>
            &nbsp;
            <asp:Label ID="Label32" runat="server" Text=" to be between " Font-Size="Small" Font-Bold="true" CssClass="ButtonText"></asp:Label>
            <asp:TextBox ID="txt_numtoaddstart" runat="server" Width = "40px"></asp:TextBox>
            &nbsp;
            <asp:Label ID="Label32a" runat="server" Text=" and " Font-Size="Small" Font-Bold="true" CssClass="ButtonText"></asp:Label>
            <asp:TextBox ID="txt_numtoaddend" runat="server" Width = "40px"></asp:TextBox>
            <asp:DropDownList ID="ddl_Dateunits" runat="server" DataSourceID="sql_DateUnits" DataTextField="unitsname" DataValueField="dateunitsID"  Font-Size="Small" CssClass="ButtonText"></asp:DropDownList>
            <asp:Label ID="Label33" runat="server" Text=" from " Font-Size="Small" Width="40px"  Font-Bold="true" CssClass="ButtonText"></asp:Label>
            <asp:DropDownList ID="ddl_Datebase" runat="server" DataSourceID="sql_DateBase" DataTextField="datebase" DataValueField="datebaseID"  Font-Size="Small" CssClass="ButtonText"></asp:DropDownList>

            
            <br/><br/>
            
            <asp:Button ID="btn_AddTrigger_DueDate_Submit" runat="server" Text="Insert Due Date Trigger" OnClick="AddTrigger_DueDate_Submit"  CssClass="ButtonText"/>&nbsp&nbsp&nbsp
            <asp:Button ID="Button19" runat="server" Text="Cancel"  OnClick="CancelEditing"  CssClass="ButtonText"/>
            <br />
        </asp:Panel>



<asp:Panel ID="Panel_EditTrigger_DueDate" runat="server" Visible="false" BackColor="LightSkyBlue">
            <asp:Label ID="lblEditTrigger_DueDate_triggerdateID" runat="server" Text="" Font-Size="Smaller" Forecolor="Purple" CssClass="ButtonText"></asp:Label>&nbsp;&nbsp;&nbsp;
            <asp:Label ID="Label12" runat="server" Text="" Font-Size="Small" Font-Bold="true" CssClass="ButtonText"></asp:Label>
            <br/> 
            <br/>
            <asp:Label ID="Label36" runat="server" Text="Set due date for " Font-Size="Small" Width="130px"  Font-Bold="true" CssClass="ButtonText"></asp:Label>
            <asp:DropDownList ID="ddlSA_for_DueDate_Edit" runat="server" DataSourceID="sql_SA_for_DueDates" DataTextField="action_label" DataValueField="studyactionID"  Font-Size="Small" CssClass="ButtonText"></asp:DropDownList>
            &nbsp;
            <asp:Label ID="Label37" runat="server" Text=" to be between " Font-Size="Small" Font-Bold="true" CssClass="ButtonText"></asp:Label>
            <asp:TextBox ID="txt_numtoaddstart_Edit" runat="server" Width = "40px"></asp:TextBox>
            &nbsp;
            <asp:Label ID="Label38" runat="server" Text=" and " Font-Size="Small" Font-Bold="true" CssClass="ButtonText"></asp:Label>
            <asp:TextBox ID="txt_numtoaddend_Edit" runat="server" Width = "40px"></asp:TextBox>
            <asp:DropDownList ID="ddl_Dateunits_Edit" runat="server" DataSourceID="sql_DateUnits" DataTextField="unitsname" DataValueField="dateunitsID"  Font-Size="Small" CssClass="ButtonText"></asp:DropDownList>
            <asp:Label ID="Label39" runat="server" Text=" from " Font-Size="Small" Width="40px"  Font-Bold="true" CssClass="ButtonText"></asp:Label>
            <asp:DropDownList ID="ddl_Datebase_Edit" runat="server" DataSourceID="sql_DateBase" DataTextField="datebase" DataValueField="datebaseID"  Font-Size="Small" CssClass="ButtonText"></asp:DropDownList>

            
            <br/><br/>
            
            <asp:Button ID="btn_EditTrigger_DueDate_Submit" runat="server" Text="Update Due Date Trigger!!!" OnClick="EditTrigger_DueDate_Submit"  CssClass="ButtonText"/>&nbsp&nbsp&nbsp
            <asp:Button ID="Button24" runat="server" Text="Cancel"  OnClick="CancelEditing"  CssClass="ButtonText"/>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="Button26" runat="server" Text="Delete" OnClick="DeleteTrigger_DueDate_Submit"  Forecolor="Red" CssClass="ButtonText"/>
            <br />
            <br />

        </asp:Panel>


</td>

<%--PLACE GROUP BUTTONS AND LABELS HERE--%>
<td style="vertical-align:top" bgcolor="#87cefa" >

<asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional" ChildrenAsTriggers="true"  EnableViewState="true">
        <ContentTemplate>

        </ContentTemplate>

        <Triggers>

        </Triggers>
    </asp:UpdatePanel>

</td>
</tr>
</table>


 <%--ACTION--%>
 <table id="Table2" runat="server" width="100%">
<tr>
<td style="vertical-align:top" >    <asp:Panel ID="PanelR2C1" runat="server" EnableViewState="true"></asp:Panel></td>
<td width = "30px"></td>
<td style="vertical-align:top" >    <asp:Panel ID="PanelR2C2" runat="server"></asp:Panel></td>
</tr> 
</table>


<%--MEAS--%>
 <table id="Table3" runat="server" width="100%">
<tr>
<td style="vertical-align:top" >   


<asp:Panel ID="PanelR3C1_sorter" runat="server" Visible="false">     
        <asp:Label ID="Label27" runat="server" Text="Sort measures by:"></asp:Label>
        <asp:DropDownList ID="DDL_StudyMeasSort" runat="Server"    AutoPostBack="true" >
                <asp:ListItem Text="TimePoint, Category, Measure" Value="1" ></asp:ListItem>
                <asp:ListItem Text="Measure, TimePoint" Value="2"></asp:ListItem>
                <asp:ListItem Text="Category, TimePoint, Measure" Value="3"></asp:ListItem>
        </asp:DropDownList>
    </asp:Panel>
<asp:Panel ID="PanelR3C1" runat="server">

</asp:Panel></td>
<td width = "30px"></td>
<td style="vertical-align:top" >    <asp:Panel ID="PanelR3C2" runat="server"></asp:Panel></td>
</tr> 
</table>


<%--CONSENT--%>
 <table id="Table4" runat="server" width="100%">
<tr>
<td style="vertical-align:top" >    <asp:Panel ID="PanelR4C1" runat="server"></asp:Panel></td>
<td width = "30px"></td>
<td style="vertical-align:top" >    <asp:Panel ID="PanelR4C2" runat="server"></asp:Panel></td>
</tr> 
</table>


<%--STUDYACTION > STUDYMEAS--%>
 <table id="Table5" runat="server" width="100%">
<tr>
<td style="vertical-align:top" >    <asp:Panel ID="PanelR5C1" runat="server"></asp:Panel></td>
<td width = "30px"></td>
<td style="vertical-align:top" >    <asp:Panel ID="PanelR5C2" runat="server"></asp:Panel></td>
</tr> 
</table>


<%--STUDYACTION > STUDYCONSENT--%>
 <table id="Table6" runat="server" width="100%">
<tr>
<td style="vertical-align:top" >    <asp:Panel ID="PanelR6C1" runat="server"></asp:Panel></td>
<td width = "30px"></td>
<td style="vertical-align:top" >    <asp:Panel ID="PanelR6C2" runat="server"></asp:Panel></td>
</tr> 
</table>




<%--TRIGGER--%>
 <table id="Table7" runat="server" width="100%">
<tr>
<td style="vertical-align:top" >    <asp:Panel ID="PanelR7C1" runat="server"></asp:Panel></td>
<td width = "30px"></td>
<td style="vertical-align:top" >    <asp:Panel ID="PanelR7C2" runat="server"></asp:Panel></td>
</tr> 
</table>


<%--PROBLEMS TO FIX--%>
 <table id="Table8" runat="server" width="100%">
<tr>
<td style="vertical-align:top" >    <asp:Panel ID="PanelR8C1" runat="server"></asp:Panel></td>
<td width = "30px"></td>
<td style="vertical-align:top" >    <asp:Panel ID="PanelR8C2" runat="server"></asp:Panel></td>
</tr> 
</table>


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



    <asp:UpdatePanel ID="UpdatePanel_hid" runat="server" UpdateMode="Conditional">
        <ContentTemplate>
        <asp:HiddenField ID="hidEntity" runat="server" Value="none"/>
        <asp:HiddenField ID="hidEntityID" runat="server" Value="none"/>
        <asp:HiddenField ID="hidEdittype" runat="server" Value="none"/>
        <asp:HiddenField ID="hidMode" runat="server" Value="none"/>

        <asp:Label ID="lblhidEntity" runat="server" Text="none" ForeColor="Silver"/><br />
        <asp:Label ID="lblhidEntityID" runat="server" Text="none" ForeColor="Silver"/><br />
        <asp:Label ID="lblhidEdittype" runat="server" Text="none" ForeColor="Silver"/><br />
        <asp:Label ID="lblhidMode" runat="server" Text="none" ForeColor="Silver"/>
        </ContentTemplate>
<%--        <Triggers>
        <asp:AsyncPostBackTrigger ControlID="btnEditAction_Cancel" EventName="Click" />
        </Triggers>
--%>
    </asp:UpdatePanel>


    <br />    <br />



<%--SQL Data Sources--%>       
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

<asp:SqlDataSource ID="sql_DateUnits" runat="server" SelectCommandType="Text"  
    SelectCommand="select dateunitsID , unitsname from tblDateUnits"  
    ConnectionString="<%$ ConnectionStrings: TRACKING_CONN_STRING %>">
</asp:SqlDataSource>  

<asp:SqlDataSource ID="sql_sites" runat="server" SelectCommandType="Text"  
    SelectCommand="select siteID , sitename from tblSite order by site_sortorder"  
    ConnectionString="<%$ ConnectionStrings: TRACKING_CONN_STRING %>">
</asp:SqlDataSource>  

<asp:SqlDataSource ID="sql_DateBase" runat="server" SelectCommandType="Text"  
    SelectCommand="select datebaseID , datebase from tblDatebase order by datebase"  
    ConnectionString="<%$ ConnectionStrings: TRACKING_CONN_STRING %>">
</asp:SqlDataSource>  

   <asp:SqlDataSource ID="sql_SAcontainers" runat="server" SelectCommandType="Text"  
    SelectCommand="select studyactionID, action_label from vwStudyActions 
    where actiontypeID in (1,2,4) and studyID = (select dbo.fnSEC_Get_Default_StudyID_for_User())  order by action_label"  
    ConnectionString="<%$ ConnectionStrings: TRACKING_CONN_STRING %>">
   </asp:SqlDataSource>  

   <asp:SqlDataSource ID="sql_SA_for_DueDates" runat="server" SelectCommandType="Text"  
    SelectCommand="select studyactionID, action_label from vwStudyActions 
    where studyID = (select dbo.fnSEC_Get_Default_StudyID_for_User())  order by action_label"  
    ConnectionString="<%$ ConnectionStrings: TRACKING_CONN_STRING %>">
   </asp:SqlDataSource> 

   <asp:HiddenField ID="hidDeleteSM" runat="server" Value="x" />
   <asp:HiddenField ID="hidDeleteSA" runat="server" Value="x" />
   <asp:HiddenField ID="hidSA_moving_to" runat="server" Value="x" />


    <script type = "text/javascript" language = "javascript">
        function confirm_SMdelete() {
            var hiddenField = document.getElementById('<%= hidDeleteSM.ClientID %>');

            if (confirm("Are you sure you want to delete this study measure?  Tracking information for individual subjects will be removed and saved to 'tbl_DeletedFromWeb_StudyMeasSubj'.") == true) {
                    hiddenField.value = "true";
                }
                else {
                    hiddenField.value = "false";
                }
            }

 </script> 

    <script type = "text/javascript" language = "javascript">
        function confirm_SAdelete() {
            var hiddenField = document.getElementById('<%= hidDeleteSA.ClientID %>');

            if (confirm("Are you sure you want to delete this action?  Tracking information for individual subjects will be removed and saved to 'tbl_DeletedFromWeb_action'.  Note that some study measures may no longer be associated with an action.") == true) {
                hiddenField.value = "true";
            }
            else {
                hiddenField.value = "false";
            }
        }

 </script> 

<%--   <script type = "text/javascript">
       function Confirm() {
           var confirm_value = document.createElement("INPUT");
           confirm_value.type = "hidden";
           confirm_value.name = "confirm_value";
           if (confirm("Do you want to save data?")) {
               confirm_value.value = "Yes";
           } else {
               confirm_value.value = "No";
           }
           document.forms[0].appendChild(confirm_value);
       }
    </script>--%>


</asp:Content>
