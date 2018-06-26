<%@ Page Language="C#" Debug="true" MasterPageFile="~/UWAC.master" AutoEventWireup="true" 
CodeFile="SubjectSummary.aspx.cs" Inherits="Data_GetData" Title="Subject Summary" %>
<asp:Content ID="Content1" ContentPlaceHolderID="oBodyPlaceHolder" Runat="Server">

<div id="divError" runat="server" class="error" style="display: none; margin: 20px;"></div>


 <style type="text/css">
    .hiddencol
    {
        display:none;
    }
    .viscol
    {
        display:block;
    }
    
         a:link
{
    text-decoration: none;
}

</style>  
          
<table border = "1" width="100%" cellspacing="0" class="tblInputSmall" id="tblMaster" runat="server">
	<tr class="trTitle">
		<td colspan="3" id="tdTitle" runat="server">Subject Summary</td>
	</tr>

    <tr>
	    <td width = "575" style="vertical-align:top">
            <asp:Panel ID="panelddlStudy" runat="server" Visible="false" >
	        <asp:DropDownList id="ddlStudy" runat="server" AutoPostBack="false"  Font-Size="Small" Width="350" OnTextChanged="Event_ddlStudyChange" ></asp:DropDownList> 
            <asp:Button ID="btnRefreshStudy" runat="server" Text="Load Study" OnClick="LoadMeasures" />
            <br/><br/>
            </asp:Panel>
            
      <br/>

           <br/>
         <asp:Panel ID="panelToggleVisibiltyButtons" runat="server" Visible="false">
                        <asp:CheckBox ID="chkShowDemog" runat="server" Text="Show Demographics" ForeColor="Green" Checked="false" AutoPostBack="false"   CssClass="smalltext" /> 
            <br/>       <asp:CheckBox ID="chkShowConsents" runat="server" Text="Show Consents" BackColor="Magenta" Checked="false" AutoPostBack="false"  CssClass="smalltext" />
            <br/>       <asp:CheckBox ID="chkShowActionTime" runat="server" Text="Show Action Dates" ForeColor="#663300" Checked="false" AutoPostBack="false"  CssClass="smalltext" />
            <br/>       <asp:CheckBox ID="chkShowDataEntryInfo" runat="server" Text="Show Data Entry" ForeColor="#6600CC" Checked="false" AutoPostBack="false"  CssClass="smalltext" />
            <br/>       <asp:CheckBox ID="chkShowValidationInfo" runat="server" Text="Show Validation" ForeColor="Maroon" Checked="false" AutoPostBack="false"  CssClass="smalltext"  />
            <br/>       <asp:CheckBox ID="chkShowLinks" Visible = "false" runat="server" Text="Show Links (in progress...)" ForeColor="#BBBBBB" Checked="true" AutoPostBack="false"  CssClass="smalltext" />
            <br/>
            <br/> No links from the cells yet...
        </asp:Panel>

        </td>
        
        <td rowspan="2" style="vertical-align:top">
        
           
       
	    <asp:Panel ID="panelTimePoint" runat="server" Visible="false">
            <br/>
                <asp:GridView ID="GridView_TimePoint" runat="server" AutoGenerateColumns="False"  RowStyle-HorizontalAlign="Center" RowStyle-VerticalAlign="Bottom"  
                AllowSorting ="False"  RowStyle-Height="6"   CellPadding="0"  HeaderStyle-VerticalAlign="Bottom" OnRowDataBound="GridView_TimePoint__RowDataBound" PagerStyle-HorizontalAlign="NotSet" Font-Size="Smaller" CellSpacing="0">
                
                <Columns >
                 <asp:TemplateField HeaderText="Show" ItemStyle-CssClass="TACenter" ItemStyle-Font-Size="Smaller"  >
                        <ItemTemplate>        
                        <asp:CheckBox ID="chkShowTimePoint" Runat="server" AutoPostBack="false" />       
                        </ItemTemplate>       
                        </asp:TemplateField>
          
               <asp:TemplateField Visible="true"  HeaderText="Time Point" ItemStyle-CssClass="TACenter">
                    <ItemTemplate>          <asp:Label id="lblTP" runat ="server" text='<%# Eval("timepoint_text")%>' Font-Size="Smaller"></asp:Label>         </ItemTemplate>
                    </asp:TemplateField>
                    
                    
                </Columns>
                
                </asp:GridView>
                <br/>
            
            </asp:Panel>
      
      
           
        </td>

        <td rowspan="2" style="vertical-align:top">

 	    <asp:Panel ID="panelSubjStatus" runat="server" Visible="false">
            <br/>
            <asp:Button ID="btnUpdateVisibility" runat="server" Text="Update Visibility" OnClick="UpdateVisibility" CssClass="smalltext"  />

            <br/>
            <br/>
            

        
                <asp:GridView ID="GridView_SubjStatus" runat="server" AutoGenerateColumns="False"  RowStyle-HorizontalAlign="Left" RowStyle-VerticalAlign="Middle"  HeaderStyle-VerticalAlign="Bottom"
                AllowSorting ="False" OnDataBound="DataBound_GridView_SubjStatus"   OnRowDataBound="GridView_SubjStatus__RowDataBound" PagerStyle-HorizontalAlign="NotSet" Font-Size="Smaller" CellSpacing="0" CellPadding="0" BorderStyle="Solid" BorderColor="Gray" BorderWidth="1" RowStyle-BorderStyle="Solid" RowStyle-BorderWidth="1" RowStyle-BorderColor="Gray" RowStyle-CssClass="smalltext">
                
                <Columns >
                <asp:TemplateField HeaderText="Show" ItemStyle-CssClass="TACenter"  >
                        <ItemTemplate>  <asp:CheckBox ID="chkShowGroup" Runat="server" AutoPostBack="false"  />       
                        </ItemTemplate>       
                        </asp:TemplateField>
          
          
              <asp:TemplateField Visible="true"  HeaderText="Group"   ControlStyle-Font-Size="Smaller" ItemStyle-CssClass="TACenter">
                    <ItemTemplate>          <asp:Label id="lblGroup" runat ="server" text='<%# Eval("groupname")%>' ></asp:Label>         </ItemTemplate>
                    </asp:TemplateField>

              <asp:TemplateField Visible="true"  HeaderText="Total"   ControlStyle-Font-Size="Smaller" ItemStyle-CssClass="TACenter">
                    <ItemTemplate>          <asp:Label id="lblTotal" runat ="server" text='<%# Eval("Total")%>' ></asp:Label>         </ItemTemplate>
                    </asp:TemplateField>
                    
                <asp:BoundField DataField="Sex" HeaderText="Sex" ItemStyle-CssClass="smalltext" />
                
                
                     
                                    
                <asp:TemplateField Visible="true"   ControlStyle-Font-Size="Smaller" ItemStyle-CssClass="TACenter">
                    <HeaderTemplate>       <asp:Checkbox ID="chkSSC_fin"  runat="server" Autopostback="false" Text="Finished" Checked="true"  OnCheckedChanged="Change_chkSSC_fin" /> </HeaderTemplate>
                    <ItemTemplate>          <asp:Label id="lblSSC_fin" runat ="server" text='<%# Eval("Finished")%>'  ></asp:Label>         </ItemTemplate>
                    </asp:TemplateField>
                    
                    
                <asp:TemplateField Visible="true"   ControlStyle-Font-Size="Smaller" ItemStyle-CssClass="TACenter">
                    <HeaderTemplate>       <asp:Checkbox ID="chkSSC_act"  runat="server" Autopostback="false" Text="Active"  Checked="true" OnCheckedChanged="Change_chkSSC_act"/> </HeaderTemplate>
                    <ItemTemplate>          <asp:Label id="lblSSC_act" runat ="server" text='<%# Eval("Active")%>' ></asp:Label>         </ItemTemplate>
                    </asp:TemplateField>                          

                    
                  <asp:TemplateField Visible="true"   ControlStyle-Font-Size="Smaller" ItemStyle-CssClass="TACenter">
                    <HeaderTemplate>       <asp:Checkbox ID="chkSSC_tbs"  runat="server" Autopostback="false" Text="ToBeSched"  Checked="true" OnCheckedChanged="Change_chkSSC_tbs"/> </HeaderTemplate>
                    <ItemTemplate>          <asp:Label id="lblSSC_tbs" runat ="server" text='<%# Eval("ToBeSched")%>' ></asp:Label>         </ItemTemplate>
                    </asp:TemplateField>   
                    

                <asp:TemplateField Visible="true"   ControlStyle-Font-Size="Smaller" ItemStyle-CssClass="TACenter">
                    <HeaderTemplate>       <asp:Checkbox ID="chkSSC_ina"  runat="server" Autopostback="false" Text="Inactive"  Checked="true" OnCheckedChanged="Change_chkSSC_ina"/> </HeaderTemplate>
                    <ItemTemplate  >          <asp:Label id="lblSSC_ina" runat ="server" text='<%# Eval("Inactive")%>'  ></asp:Label>         </ItemTemplate>
                    </asp:TemplateField>   
                    
                    
                <asp:TemplateField Visible="true"   ControlStyle-Font-Size="Smaller" ItemStyle-CssClass="TACenter">
                    <HeaderTemplate>       <asp:Checkbox ID="chkSSC_oos"  runat="server" Autopostback="false" Text="Out Of Study"   Checked="true" OnCheckedChanged="Change_chkSSC_oos"/> </HeaderTemplate>
                    <ItemTemplate>          <asp:Label id="lblSSC_oos" runat ="server" text='<%# Eval("OutOfStudy")%>' ></asp:Label>         </ItemTemplate>
                    </asp:TemplateField>   
                    
                <asp:TemplateField Visible="true"   ControlStyle-Font-Size="Smaller" ItemStyle-CssClass="TACenter">
                    <HeaderTemplate>       <asp:Checkbox ID="chkSSC_dq"  runat="server" Autopostback="false" Text="DQ"  Checked="true" OnCheckedChanged="Change_chkSSC_dq"/> </HeaderTemplate>
                    <ItemTemplate>          <asp:Label id="lblSSC_dq" runat ="server" text='<%# Eval("DQ")%>' ></asp:Label>         </ItemTemplate>
                    </asp:TemplateField>   
                        
                <asp:TemplateField Visible="true"   ControlStyle-Font-Size="Smaller" ItemStyle-CssClass="TACenter">
                    <HeaderTemplate>       <asp:Checkbox ID="chkSSC_npt"  runat="server" Autopostback="false" Text="Not Partic"  Checked="true" OnCheckedChanged="Change_chkSSC_npt"/> </HeaderTemplate>
                    <ItemTemplate>          <asp:Label id="lblSSC_npt" runat ="server" text='<%# Eval("NotPart")%>' ></asp:Label>         </ItemTemplate>
                    </asp:TemplateField>   

                <asp:TemplateField Visible="true"   ControlStyle-Font-Size="Smaller" ItemStyle-CssClass="TACenter">
                    <HeaderTemplate>       <asp:Checkbox ID="chkSSC_nis"  runat="server" Autopostback="false" Text="Not in study"  Checked="true" OnCheckedChanged="Change_chkSSC_nis"/> </HeaderTemplate>
                    <ItemTemplate>          <asp:Label id="lblSSC_nis" runat ="server" text='<%# Eval("NotInStudy")%>' ></asp:Label>         </ItemTemplate>
                    </asp:TemplateField>   

                <asp:TemplateField Visible="true"   ControlStyle-Font-Size="Smaller" ItemStyle-CssClass="TACenter">
                    <HeaderTemplate>       <asp:Checkbox ID="chkSSC_nen"  runat="server" Autopostback="false" Text="Not Enrolled"  Checked="true" OnCheckedChanged="Change_chkSSC_nen" /> </HeaderTemplate>
                    <ItemTemplate>          <asp:Label id="lblSSC_nen" runat ="server" text='<%# Eval("NotEnrolled")%>' ></asp:Label>         </ItemTemplate>
                    </asp:TemplateField>   

                        
                   
                
                </Columns>
                
                </asp:GridView>
            </asp:Panel>
 		    
 
        </td>
	        </tr>


	<tr>
		<td style="vertical-align:top"  width = "575">
		
    
            <asp:Panel ID="panelOutput" runat="server" Visible="false">
            
            <asp:Label ID="lblOutput1" runat="server" Text="Label" Visible="true" ForeColor="#990000"></asp:Label>
            <br/>
            <asp:Label ID="lblOutput1a" runat="server" Text="Label" Visible="true" ForeColor="#990000"></asp:Label>
            <br/>
            <asp:Label ID="lblOutput2" runat="server" Text="Label" Visible="true" ForeColor="#999999"></asp:Label>
            
            <br/>
            </asp:Panel>
    

		</td>
	
	
</tr>

    <tr>
        <td id="zipLink">
     
        </td>
        <td id="UtiltyErrors" style="vertical-align:top">
        </td>      
    </tr>


    <tr>
        <td id="errorLink1"> 
        <asp:Label ID="lblOutputRequest" runat="server" Text = "" ForeColor="Red" Font-Bold="true" Visible="true"></asp:Label>
        <asp:Label ID="lblOutputGrant" runat="server"  Text = "" ForeColor="Red" Font-Bold="true" Visible="true"></asp:Label>

        </td>
        <td id="errorLink2" style="vertical-align:top"></td>  
          
    </tr>
    <tr>
        <td id="outputInfo1"></td>
        <td id="outputInfo2" ><font color="green"></font></td>      
    </tr>



</table>


<asp:Panel ID="panelSubjects" runat="server" Visible="false">


	<table class="tblInputSmall" id="tblGridView">    
    <br/><br/>
    
    
	<asp:GridView ID="GridView_Subjects" runat="server" AutoGenerateColumns="False"  RowStyle-HorizontalAlign="Center" RowStyle-VerticalAlign="Bottom"  
	     OnSorting = "GridView_Subjects_Sorting" AllowSorting ="True"   RowStyle-Height="10" CellPadding="1" HeaderStyle-VerticalAlign="Bottom" PagerStyle-HorizontalAlign="NotSet" Font-Size="Smaller">
        
        <Columns>

              <asp:TemplateField Visible="true"  HeaderText="studyID"  ItemStyle-CssClass="TACenter" SortExpression="studyID">          <ItemTemplate>           <asp:Label id="lblstudyID" runat ="server" text='<%# Eval("studyID")%>'></asp:Label>             </ItemTemplate>    </asp:TemplateField>
              <asp:TemplateField Visible="true"  HeaderText="groupID"  ItemStyle-CssClass="TACenter" SortExpression="groupID">          <ItemTemplate>           <asp:Label id="lblgroupID" runat ="server" text='<%# Eval("groupID")%>'></asp:Label>             </ItemTemplate>    </asp:TemplateField>
              
              <asp:TemplateField Visible="true"  HeaderText="ID"  ItemStyle-CssClass="TACenter" SortExpression="ID">                    <ItemTemplate>           <asp:Label id="lblID" runat ="server" text='<%# Eval("ID")%>'></asp:Label>             </ItemTemplate>    </asp:TemplateField>
              <asp:TemplateField Visible="true"  HeaderText="Group"  ItemStyle-CssClass="TACenter" SortExpression="groupname">      <ItemTemplate>           <asp:Label id="lblgroupname" runat ="server" text='<%# Eval("groupname")%>'></asp:Label>             </ItemTemplate>    </asp:TemplateField>
              <asp:TemplateField Visible="true"  HeaderText="Subj Status"  ItemStyle-CssClass="TACenter" SortExpression="subjstatus">    <ItemTemplate>           <asp:Label id="lblsubjstatusshort" runat ="server" text='<%# Eval("subjstatusshort")%>'></asp:Label>             </ItemTemplate>    </asp:TemplateField>
              <asp:TemplateField Visible="true"  HeaderText="Subj Status Detail"  ItemStyle-CssClass="TACenter" SortExpression="subjstatusdetail">   <ItemTemplate>           <asp:Label id="lblsubjstatusdetail" runat ="server" text='<%# Eval("subjstatusdetail")%>'></asp:Label>             </ItemTemplate>    </asp:TemplateField>
              
              <asp:TemplateField Visible="true"  HeaderText="Sex"  ItemStyle-CssClass="TACenter" SortExpression="sex" ItemStyle-ForeColor="Green" HeaderStyle-ForeColor="Green">                  <ItemTemplate>           <asp:Label id="lblsex" runat ="server" text='<%# Eval("sex")%>'  ></asp:Label>             </ItemTemplate>    </asp:TemplateField>
              <asp:TemplateField Visible="true"  HeaderText="Current Age"  ItemStyle-CssClass="TACenter" SortExpression="dob" ItemStyle-ForeColor="Green" HeaderStyle-ForeColor="Green">    <ItemTemplate>           <asp:Label id="lblcurr_ageym" runat ="server" text='<%# Eval("curr_ageym")%>'  ></asp:Label>             </ItemTemplate>    </asp:TemplateField>
              <asp:TemplateField Visible="true"  HeaderText="Race"  ItemStyle-CssClass="TACenter" SortExpression="ethnicitydesc" ItemStyle-ForeColor="Green" HeaderStyle-ForeColor="Green">   <ItemTemplate>           <asp:Label id="lblethnicitydesc" runat ="server" text='<%# Eval("ethnicitydesc")%>'  ></asp:Label>             </ItemTemplate>    </asp:TemplateField>
              <asp:TemplateField Visible="true"  HeaderText="Ethnicity"  ItemStyle-CssClass="TACenter" SortExpression="hispanicdesc" ItemStyle-ForeColor="Green" HeaderStyle-ForeColor="Green">   <ItemTemplate>           <asp:Label id="lblhispanicdesc" runat ="server" text='<%# Eval("hispanicdesc")%>'  ></asp:Label>             </ItemTemplate>    </asp:TemplateField>
             
             <asp:TemplateField Visible="true"  HeaderText="# Assigned of Total"  ItemStyle-CssClass="TACenter" SortExpression="N_consents_assigned" ItemStyle-ForeColor="Magenta" HeaderStyle-ForeColor="Magenta">  <ItemTemplate>  <asp:Label id="lblN_consents_assigned" runat ="server" text='<%# Eval("N_consents_assigned")%>'  ></asp:Label>             </ItemTemplate>    </asp:TemplateField>
             <asp:TemplateField Visible="true"  HeaderText="# Signed of Assigned"  ItemStyle-CssClass="TACenter" SortExpression="N_signed_consents_of_assigned" ItemStyle-ForeColor="Magenta" HeaderStyle-ForeColor="Magenta">  <ItemTemplate>  <asp:Label id="lblN_signed_consents_of_assigned" runat ="server" text='<%# Eval("N_signed_consents_of_assigned")%>'  ></asp:Label>             </ItemTemplate>    </asp:TemplateField>
             <asp:TemplateField Visible="true"  HeaderText="# Latest Assigned of Total"  ItemStyle-CssClass="TACenter" SortExpression="N_latest_consents_assigned" ItemStyle-ForeColor="Magenta" HeaderStyle-ForeColor="Magenta">  <ItemTemplate>  <asp:Label id="lblN_latest_consents_assigned" runat ="server" text='<%# Eval("N_latest_consents_assigned")%>'  ></asp:Label>             </ItemTemplate>    </asp:TemplateField>
             <asp:TemplateField Visible="true"  HeaderText="# Signed of Latest Assigned "  ItemStyle-CssClass="TACenter" SortExpression="N_signed_latest_consents_of_assigned" ItemStyle-ForeColor="Magenta" HeaderStyle-ForeColor="Magenta">  <ItemTemplate>  <asp:Label id="lblN_signed_latest_consents_of_assigned" runat ="server" text='<%# Eval("N_signed_latest_consents_of_assigned")%>'  ></asp:Label>             </ItemTemplate>    </asp:TemplateField>
            
             <asp:TemplateField Visible="true"  HeaderText="Time since 1st session"  ItemStyle-CssClass="TACenter" SortExpression="time_since_1st_session" ItemStyle-ForeColor="#663300" HeaderStyle-ForeColor="#663300">  <ItemTemplate>  <asp:Label id="lbltime_since_1st_session" runat ="server" text='<%# Eval("time_since_1st_session")%>'  ></asp:Label>             </ItemTemplate>    </asp:TemplateField>
             <asp:TemplateField Visible="true"  HeaderText="Date 1st session"  ItemStyle-CssClass="TACenter" SortExpression="datedone_1st_session" ItemStyle-ForeColor="#663300" HeaderStyle-ForeColor="#663300">  <ItemTemplate>  <asp:Label id="lbldatedone_1st_session" runat ="server" text='<%# Eval("datedone_1st_session", "{0:d}")%>'  ></asp:Label>             </ItemTemplate>    </asp:TemplateField>
             <asp:TemplateField Visible="true"  HeaderText="Time since last session"  ItemStyle-CssClass="TACenter" SortExpression="time_since_last_session" ItemStyle-ForeColor="#663300" HeaderStyle-ForeColor="#663300">  <ItemTemplate>  <asp:Label id="lbltime_since_last_session" runat ="server" text='<%# Eval("time_since_last_session")%>'  ></asp:Label>             </ItemTemplate>    </asp:TemplateField>
             <asp:TemplateField Visible="true"  HeaderText="Date last session"  ItemStyle-CssClass="TACenter" SortExpression="datedone_last_session" ItemStyle-ForeColor="#663300" HeaderStyle-ForeColor="#663300">  <ItemTemplate>  <asp:Label id="lbldatedone_last_session" runat ="server" text='<%# Eval("datedone_last_session", "{0:d}")%>'  ></asp:Label>             </ItemTemplate>    </asp:TemplateField>
             <asp:TemplateField Visible="true"  HeaderText="Span 1st to last"  ItemStyle-CssClass="TACenter" SortExpression="span_from_1st_to_last_session" ItemStyle-ForeColor="#663300" HeaderStyle-ForeColor="#663300">  <ItemTemplate>  <asp:Label id="lblspan_from_1st_to_last_session" runat ="server" text='<%# Eval("span_from_1st_to_last_session")%>'  ></asp:Label>             </ItemTemplate>    </asp:TemplateField>
             <asp:TemplateField Visible="true"  HeaderText="Days from 1st to last"  ItemStyle-CssClass="TACenter" SortExpression="days_from_1st_to_last_session" ItemStyle-ForeColor="#663300" HeaderStyle-ForeColor="#663300">  <ItemTemplate>  <asp:Label id="lbldays_from_1st_to_last_session" runat ="server" text='<%# Eval("days_from_1st_to_last_session")%>'  ></asp:Label>             </ItemTemplate>    </asp:TemplateField>
  
             
              <asp:TemplateField Visible="true"  HeaderText="Entered: # recs"  ItemStyle-CssClass="TACenter" SortExpression="nrecs" ItemStyle-ForeColor="Indigo" HeaderStyle-ForeColor="Indigo">              <ItemTemplate>           <asp:Label id="lblnrecs" runat ="server" text='<%# Eval("nrecs")%>'  ></asp:Label>             </ItemTemplate>    </asp:TemplateField>
              <asp:TemplateField Visible="true"  HeaderText="Entered: % Dbl"  ItemStyle-CssClass="TACenter" SortExpression="pct_dblent" ItemStyle-ForeColor="Indigo" HeaderStyle-ForeColor="Indigo">   <ItemTemplate>           <asp:Label id="lblpct_dblent" runat ="server" text='<%# Eval("pct_dblent" ,"{0:p0}")%>'   ></asp:Label>             </ItemTemplate>    </asp:TemplateField>

              <asp:TemplateField Visible="true"  HeaderText="Entered: # Score Errors"  ItemStyle-CssClass="TACenter" SortExpression="nrecs_ScrError" ItemStyle-ForeColor="Maroon" HeaderStyle-ForeColor="Maroon">   <ItemTemplate>           <asp:Label id="lblnrecs_ScrError" runat ="server" text='<%# Eval("nrecs_ScrError")%>' ></asp:Label>             </ItemTemplate>    </asp:TemplateField>
              <asp:TemplateField Visible="true"  HeaderText="Entered: # Vio"  ItemStyle-CssClass="TACenter" SortExpression="nrecs_vio" ItemStyle-ForeColor="Maroon" HeaderStyle-ForeColor="Maroon">      <ItemTemplate>           <asp:Label id="lblnrecs_vio" runat ="server" text='<%# Eval("nrecs_vio")%>'  ></asp:Label>             </ItemTemplate>    </asp:TemplateField>
              <asp:TemplateField Visible="true"  HeaderText="Entered: # Missing"  ItemStyle-CssClass="TACenter" SortExpression="nrecs_missing" ItemStyle-ForeColor="Maroon" HeaderStyle-ForeColor="Maroon">   <ItemTemplate>           <asp:Label id="lblnrecs_missing" runat ="server" text='<%# Eval("nrecs_missing")%>'  ></asp:Label>             </ItemTemplate>    </asp:TemplateField>
              <asp:TemplateField Visible="true"  HeaderText="Entered: # NULL"  ItemStyle-CssClass="TACenter" SortExpression="nrecs_null" ItemStyle-ForeColor="Maroon" HeaderStyle-ForeColor="Maroon">    <ItemTemplate>           <asp:Label id="lblnrecs_null" runat ="server" text='<%# Eval("nrecs_null")%>'  ></asp:Label>             </ItemTemplate>    </asp:TemplateField>
              <asp:TemplateField Visible="true"  HeaderText="Entered: # Invalid"  ItemStyle-CssClass="TACenter" SortExpression="nrecs_invalid" ItemStyle-ForeColor="Maroon" HeaderStyle-ForeColor="Maroon">   <ItemTemplate>           <asp:Label id="lblnrecs_invalid" runat ="server" text='<%# Eval("nrecs_invalid")%>'  ></asp:Label>             </ItemTemplate>    </asp:TemplateField>


              <asp:TemplateField Visible="true"  HeaderText="# with Data (A)"                   ItemStyle-CssClass="TACenter" SortExpression="n_DATA">            <ItemTemplate>           <asp:Label id="lbln_DATA" runat ="server" text='<%# Eval("n_DATA")%>'></asp:Label>             </ItemTemplate>    </asp:TemplateField>
              <asp:TemplateField Visible="true"  HeaderText="# with NO Data (B)"                ItemStyle-CssClass="TACenter" SortExpression="n_NODATA">        <ItemTemplate>           <asp:Label id="lbln_NODATA" runat ="server" text='<%# Eval("n_NODATA")%>'></asp:Label>             </ItemTemplate>    </asp:TemplateField>
              <asp:TemplateField Visible="true"  HeaderText="# To Be Done (C)"                  ItemStyle-CssClass="TACenter" SortExpression="n_TBD">              <ItemTemplate>           <asp:Label id="lbln_TBD" runat ="server" text='<%# Eval("n_TBD")%>'></asp:Label>             </ItemTemplate>    </asp:TemplateField>
              <asp:TemplateField Visible="true"  HeaderText="# NA (D)"                          ItemStyle-CssClass="TACenter" SortExpression="n_NA">                <ItemTemplate>           <asp:Label id="lbln_NA" runat ="server" text='<%# Eval("n_NA")%>'></asp:Label>             </ItemTemplate>    </asp:TemplateField>
              <asp:TemplateField Visible="true"  HeaderText="# TP1 with Data (A)"               ItemStyle-CssClass="TACenter" HeaderStyle-BackColor="#BBDAFF"   ItemStyle-BackColor="#BBDAFF" SortExpression="n_DATA1">          <ItemTemplate>           <asp:Label id="lbln_DATA1" runat ="server" text='<%# Eval("n_DATA1")%>'></asp:Label>             </ItemTemplate>    </asp:TemplateField>
              <asp:TemplateField Visible="true"  HeaderText="# TP1 with NO Data (B)"            ItemStyle-CssClass="TACenter" HeaderStyle-BackColor="#BBDAFF"   ItemStyle-BackColor="#BBDAFF" SortExpression="n_NODATA1">      <ItemTemplate>           <asp:Label id="lbln_NODATA1" runat ="server" text='<%# Eval("n_NODATA1")%>'></asp:Label>             </ItemTemplate>    </asp:TemplateField>
              <asp:TemplateField Visible="true"  HeaderText="# TP1 To Be Done (C) "             ItemStyle-CssClass="TACenter" HeaderStyle-BackColor="#BBDAFF"   ItemStyle-BackColor="#BBDAFF" SortExpression="n_TBD1">            <ItemTemplate>           <asp:Label id="lbln_TBD1" runat ="server" text='<%# Eval("n_TBD1")%>'></asp:Label>             </ItemTemplate>    </asp:TemplateField>
              <asp:TemplateField Visible="true"  HeaderText="# TP1 NA (D)"                      ItemStyle-CssClass="TACenter" HeaderStyle-BackColor="#BBDAFF"   ItemStyle-BackColor="#BBDAFF" SortExpression="n_NA1">              <ItemTemplate>           <asp:Label id="lbln_NA1" runat ="server" text='<%# Eval("n_NA1")%>'></asp:Label>             </ItemTemplate>    </asp:TemplateField>
              <asp:TemplateField Visible="true"  HeaderText="# TP2 with Data (A)"               ItemStyle-CssClass="TACenter" HeaderStyle-BackColor="#DBEBFF"   ItemStyle-BackColor="#DBEBFF" SortExpression="n_DATA2">           <ItemTemplate>           <asp:Label id="lbln_DATA2" runat ="server" text='<%# Eval("n_DATA2")%>'></asp:Label>             </ItemTemplate>    </asp:TemplateField>
              <asp:TemplateField Visible="true"  HeaderText="# TP2 with NO Data (B)"            ItemStyle-CssClass="TACenter" HeaderStyle-BackColor="#DBEBFF"   ItemStyle-BackColor="#DBEBFF" SortExpression="n_NODATA2">   <ItemTemplate>           <asp:Label id="lbln_NODATA2" runat ="server" text='<%# Eval("n_NODATA2")%>'></asp:Label>             </ItemTemplate>    </asp:TemplateField>
              <asp:TemplateField Visible="true"  HeaderText="# TP2 To Be Done (C)"              ItemStyle-CssClass="TACenter" HeaderStyle-BackColor="#DBEBFF"   ItemStyle-BackColor="#DBEBFF" SortExpression="n_TBD2">   <ItemTemplate>           <asp:Label id="lbln_TBD2" runat ="server" text='<%# Eval("n_TBD2")%>'></asp:Label>             </ItemTemplate>    </asp:TemplateField>
              <asp:TemplateField Visible="true"  HeaderText="# TP2 NA (D)"                      ItemStyle-CssClass="TACenter" HeaderStyle-BackColor="#DBEBFF"   ItemStyle-BackColor="#DBEBFF" SortExpression="n_NA2">   <ItemTemplate>           <asp:Label id="lbln_NA2" runat ="server" text='<%# Eval("n_NA2")%>'></asp:Label>             </ItemTemplate>    </asp:TemplateField>
              <asp:TemplateField Visible="true"  HeaderText="# TP3 with Data (A)"               ItemStyle-CssClass="TACenter" HeaderStyle-BackColor="#F9FCFF"   ItemStyle-BackColor="#F9FCFF" SortExpression="n_DATA3">   <ItemTemplate>           <asp:Label id="lbln_DATA3" runat ="server" text='<%# Eval("n_DATA3")%>'></asp:Label>             </ItemTemplate>    </asp:TemplateField>
              <asp:TemplateField Visible="true"  HeaderText="# TP3 with NO Data (B)"            ItemStyle-CssClass="TACenter" HeaderStyle-BackColor="#F9FCFF"   ItemStyle-BackColor="#F9FCFF" SortExpression="n_NODATA3">   <ItemTemplate>           <asp:Label id="lbln_NODATA3" runat ="server" text='<%# Eval("n_NODATA3")%>'></asp:Label>             </ItemTemplate>    </asp:TemplateField>
              <asp:TemplateField Visible="true"  HeaderText="# TP3 To Be Done (C)"              ItemStyle-CssClass="TACenter" HeaderStyle-BackColor="#F9FCFF"   ItemStyle-BackColor="#F9FCFF" SortExpression="n_TBD3">   <ItemTemplate>           <asp:Label id="lbln_TBD3" runat ="server" text='<%# Eval("n_TBD3")%>'></asp:Label>             </ItemTemplate>    </asp:TemplateField>
              <asp:TemplateField Visible="true"  HeaderText="# TP3 NA (D)"                      ItemStyle-CssClass="TACenter" HeaderStyle-BackColor="#F9FCFF"   ItemStyle-BackColor="#F9FCFF" SortExpression="n_NA3">   <ItemTemplate>           <asp:Label id="lbln_NA3" runat ="server" text='<%# Eval("n_NA3")%>'></asp:Label>             </ItemTemplate>    </asp:TemplateField>
              <asp:TemplateField Visible="true"  HeaderText="# TP4 with Data (A)"               ItemStyle-CssClass="TACenter" HeaderStyle-BackColor="#C9DECB"   ItemStyle-BackColor="#C9DECB" SortExpression="n_DATA4">   <ItemTemplate>           <asp:Label id="lbln_DATA4" runat ="server" text='<%# Eval("n_DATA4")%>'></asp:Label>             </ItemTemplate>    </asp:TemplateField>
              <asp:TemplateField Visible="true"  HeaderText="# TP4 with NO Data (B)"            ItemStyle-CssClass="TACenter" HeaderStyle-BackColor="#C9DECB"   ItemStyle-BackColor="#C9DECB" SortExpression="n_NODATA4">   <ItemTemplate>           <asp:Label id="lbln_NODATA4" runat ="server" text='<%# Eval("n_NODATA4")%>'></asp:Label>             </ItemTemplate>    </asp:TemplateField>
              <asp:TemplateField Visible="true"  HeaderText="# TP4 To Be Done (C)"              ItemStyle-CssClass="TACenter" HeaderStyle-BackColor="#C9DECB"   ItemStyle-BackColor="#C9DECB" SortExpression="n_TBD4">   <ItemTemplate>           <asp:Label id="lbln_TBD4" runat ="server" text='<%# Eval("n_TBD4")%>'></asp:Label>             </ItemTemplate>    </asp:TemplateField>
              <asp:TemplateField Visible="true"  HeaderText="# TP4 NA (D)"                      ItemStyle-CssClass="TACenter" HeaderStyle-BackColor="#C9DECB"   ItemStyle-BackColor="#C9DECB" SortExpression="n_NA4">   <ItemTemplate>           <asp:Label id="lbln_NA4" runat ="server" text='<%# Eval("n_NA4")%>'></asp:Label>             </ItemTemplate>    </asp:TemplateField>
              <asp:TemplateField Visible="true"  HeaderText="# TP5 with Data (A)"               ItemStyle-CssClass="TACenter" HeaderStyle-BackColor="#E9F1EA"   ItemStyle-BackColor="#E9F1EA" SortExpression="n_DATA5">   <ItemTemplate>           <asp:Label id="lbln_DATA5" runat ="server" text='<%# Eval("n_DATA5")%>'></asp:Label>             </ItemTemplate>    </asp:TemplateField>
              <asp:TemplateField Visible="true"  HeaderText="# TP5 with NO Data (B)"            ItemStyle-CssClass="TACenter" HeaderStyle-BackColor="#E9F1EA"   ItemStyle-BackColor="#E9F1EA" SortExpression="n_NODATA5">   <ItemTemplate>           <asp:Label id="lbln_NODATA5" runat ="server" text='<%# Eval("n_NODATA5")%>'></asp:Label>             </ItemTemplate>    </asp:TemplateField>
              <asp:TemplateField Visible="true"  HeaderText="# TP5 To Be Done (C)"              ItemStyle-CssClass="TACenter" HeaderStyle-BackColor="#E9F1EA"   ItemStyle-BackColor="#E9F1EA" SortExpression="n_TBD5">   <ItemTemplate>           <asp:Label id="lbln_TBD5" runat ="server" text='<%# Eval("n_TBD5")%>'></asp:Label>             </ItemTemplate>    </asp:TemplateField>
              <asp:TemplateField Visible="true"  HeaderText="# TP5 NA (D)"                      ItemStyle-CssClass="TACenter" HeaderStyle-BackColor="#E9F1EA"   ItemStyle-BackColor="#E9F1EA" SortExpression="n_NA5">   <ItemTemplate>           <asp:Label id="lbln_NA5" runat ="server" text='<%# Eval("n_NA5")%>'></asp:Label>             </ItemTemplate>    </asp:TemplateField>
              <asp:TemplateField Visible="true"  HeaderText="# TP6 with Data (A)"               ItemStyle-CssClass="TACenter" HeaderStyle-BackColor="#FBFDFB"   ItemStyle-BackColor="#FBFDFB" SortExpression="n_DATA6">   <ItemTemplate>           <asp:Label id="lbln_DATA6" runat ="server" text='<%# Eval("n_DATA6")%>'></asp:Label>             </ItemTemplate>    </asp:TemplateField>
              <asp:TemplateField Visible="true"  HeaderText="# TP6 with NO Data (B)"            ItemStyle-CssClass="TACenter" HeaderStyle-BackColor="#FBFDFB"   ItemStyle-BackColor="#FBFDFB" SortExpression="n_NODATA6">   <ItemTemplate>           <asp:Label id="lbln_NODATA6" runat ="server" text='<%# Eval("n_NODATA6")%>'></asp:Label>             </ItemTemplate>    </asp:TemplateField>
              <asp:TemplateField Visible="true"  HeaderText="# TP6 To Be Done (C)"              ItemStyle-CssClass="TACenter" HeaderStyle-BackColor="#FBFDFB"   ItemStyle-BackColor="#FBFDFB" SortExpression="n_TBD6">   <ItemTemplate>           <asp:Label id="lbln_TBD6" runat ="server" text='<%# Eval("n_TBD6")%>'></asp:Label>             </ItemTemplate>    </asp:TemplateField>
              <asp:TemplateField Visible="true"  HeaderText="# TP6 NA (D)"                      ItemStyle-CssClass="TACenter" HeaderStyle-BackColor="#FBFDFB"   ItemStyle-BackColor="#FBFDFB" SortExpression="n_NA6">   <ItemTemplate>           <asp:Label id="lbln_NA6" runat ="server" text='<%# Eval("n_NA6")%>'></asp:Label>             </ItemTemplate>    </asp:TemplateField>
              <asp:TemplateField Visible="true"  HeaderText="# TP7 with Data (A)"               ItemStyle-CssClass="TACenter" HeaderStyle-BackColor="#B8E2EF"   ItemStyle-BackColor="#B8E2EF" SortExpression="n_DATA7">   <ItemTemplate>           <asp:Label id="lbln_DATA7" runat ="server" text='<%# Eval("n_DATA7")%>'></asp:Label>             </ItemTemplate>    </asp:TemplateField>
              <asp:TemplateField Visible="true"  HeaderText="# TP7 with NO Data (B)"            ItemStyle-CssClass="TACenter" HeaderStyle-BackColor="#B8E2EF"   ItemStyle-BackColor="#B8E2EF" SortExpression="n_NODATA7">   <ItemTemplate>           <asp:Label id="lbln_NODATA7" runat ="server" text='<%# Eval("n_NODATA7")%>'></asp:Label>             </ItemTemplate>    </asp:TemplateField>
              <asp:TemplateField Visible="true"  HeaderText="# TP7 To Be Done (C)"              ItemStyle-CssClass="TACenter" HeaderStyle-BackColor="#B8E2EF"   ItemStyle-BackColor="#B8E2EF" SortExpression="n_TBD7">   <ItemTemplate>           <asp:Label id="lbln_TBD7" runat ="server" text='<%# Eval("n_TBD7")%>'></asp:Label>             </ItemTemplate>    </asp:TemplateField>
              <asp:TemplateField Visible="true"  HeaderText="# TP7 NA (D)"                      ItemStyle-CssClass="TACenter" HeaderStyle-BackColor="#B8E2EF"   ItemStyle-BackColor="#B8E2EF" SortExpression="n_NA7">   <ItemTemplate>           <asp:Label id="lbln_NA7" runat ="server" text='<%# Eval("n_NA7")%>'></asp:Label>             </ItemTemplate>    </asp:TemplateField>
			 
 

        
        </Columns>
        
        
    </asp:GridView>
    
    



</table>
		
    

<br/>		
<br/>	
<%--  
	<asp:ListBox ID="selDataTablesNoAccess" Runat="server" Rows="16" visible="false" SelectionMode="Multiple" style="width: 450px;" font-name="Courier" /><br/>
	--%>
			
<br/>		
<br/>


</td>
		
   	<td width = "100" id="tdLinks" runat="server"></td>

		
<td rowspan="1" halign="left" style="vertical-align:top">

</td>

</tr>
<tr>
<td id="tdChk"></td></tr>
</table>     

</asp:Panel>

<br/>
<br/>
<asp:Button ID="btnShowDebug" runat="server" Visible = "false" OnClick="ShowDebug" Text="Toggle debug info" Font-Size="Smaller" />
<br/>
<asp:Panel ID="panelDebug" runat="server" Visible="false" >
<br/>
<table id="tableDebug"  runat="server">
    <tr>
        <td id="debugInfo1"></td>
    </tr>

</table>

</asp:Panel>

</asp:Content>

