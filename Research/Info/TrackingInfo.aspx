<%@ Page Language="c#" Debug="true" MasterPageFile="~/UWAC.master" CodeFile="TrackingInfo.aspx.cs" AutoEventWireup="true"
 Inherits="Info_TrackingInfo" Title="Tracking Info" %>
  <%@ MasterType VirtualPath="~/UWAC.master" %>

<asp:Content ID="Content1"  ContentPlaceHolderID="oBodyPlaceHolder" runat="server">
<style> .styleTBD   {   font: 8pt verdana;   font-weight:100;   color:SteelBlue;   outline-color:gray;}  </style>
<style> .styleData   {   font: 8pt verdana;   font-weight:100;   color:Green;   outline-color:gray;}  </style>
<style> .styleNA   {   font: 8pt verdana;   font-weight:100;   color:gray; outline-color:gray;    }  </style>
<style> .rowstyleAction   {   background-color:gray;  } </style>  
<style> .right_align { text-align: right; }  </style>
<style>  p {color: DarkBlue; }
  .fs14 {    font-size: 12px;  }
</style>


<%--from :  http://stackoverflow.com/questions/14746564/asp-net-get-screen-width?rq=1--%>
    <input type="hidden" value=""
   name="clientScreenHeight" id="clientScreenHeight" />
<input type="hidden" value=""
   name="clientScreenWidth" id="clientScreenWidth" />



 
 <table id="tblmyinfo" runat="server" width="100%">
 <tr><td font-color="red"></td></tr>
 </table>

<table>
<tr><td colspan="4">
    <asp:Label ID="lblINTRO_studyname" runat="server" Text=" " Font-Size="Medium" Font-Bold="false"></asp:Label>
    <asp:Label ID="lblStudyname_ContentPage" runat="server" Text=" " Font-Size="Medium" Font-Bold="true"></asp:Label>

</td>  </tr>

<%--<tr><td colspan="4">
    <asp:Label ID="Label3" runat="server" Text="Limit to these IDs (sep with commas):" Font-Size="Smaller" Font-Bold="false"></asp:Label>
    <asp:TextBox ID="txtIDlist" runat="server" Text="" Font-Size="Smaller" Width = "200px" Font-Bold="true"></asp:TextBox>

</td>  </tr>--%>
<tr>  
<td>

    <%------- START  Where Clause CheckBox Containers --------%>
    <table>
    <tr><td style="vertical-align:top">
         <asp:Panel  ID="Panel_WhereClauseControls_Subjstatus" runat="server">
        <table  cellpadding="0pt">
        <tr><td>  <asp:Label ID="lblSubjStatus" runat="server" Text="Subj Status:"  Width="80px"></asp:Label>     </td></tr>
        <tr><td>  <asp:CheckBox ID="chkSS_TBS" runat="server"       AutoPostBack="false" Checked="false" Visible="false" Font-Size="X-Small" Text="ToBeSched"  />     </td></tr>
        <tr><td>  <asp:CheckBox ID="chkSS_ACT" runat="server"       AutoPostBack="false" Checked="false" Visible="false" Font-Size="X-Small" Text="Active"  />     </td></tr>
        <tr><td>  <asp:CheckBox ID="chkSS_FIN" runat="server"       AutoPostBack="false" Checked="false" Visible="false" Font-Size="X-Small" Text="Finished"  />     </td></tr>
        <tr><td>  <asp:CheckBox ID="chkSS_DQ" runat="server"        AutoPostBack="false" Checked="false" Visible="false" Font-Size="X-Small" Text="DQ"  />     </td></tr>
        <tr><td>   <asp:CheckBox ID="chkSS_OOS" runat="server"      AutoPostBack="false" Checked="false" Visible="false" Font-Size="X-Small" Text="OOS"  />   </td></tr>
        <tr><td>   <asp:CheckBox ID="chkSS_INACT" runat="server"    AutoPostBack="false" Checked="false" Visible="false" Font-Size="X-Small" Text="Inactive"  />   </td></tr>
        <tr><td>   <asp:CheckBox ID="chkSS_NOTIN" runat="server"    AutoPostBack="false" Checked="false" Visible="false" Font-Size="X-Small" Text="NotInStudy"  />   </td></tr>
        <tr><td>   <asp:CheckBox ID="chkSS_NOTPART" runat="server"  AutoPostBack="false" Checked="false" Visible="false" Font-Size="X-Small" Text="NotPartic"  />   </td></tr>
        <tr><td>   <asp:CheckBox ID="chkSS_NOTENR" runat="server"   AutoPostBack="false" Checked="false" Visible="false" Font-Size="X-Small" Text="NotEnroll"  />   </td></tr>
        <tr><td>  <asp:CheckBox ID="chkSS_XGACT" runat="server"       AutoPostBack="false" Checked="false" Visible="false" Font-Size="X-Small" Text="XGen_Active"  />     </td></tr>
        <tr><td>  <asp:CheckBox ID="chkSS_XGFIN" runat="server"       AutoPostBack="false" Checked="false" Visible="false" Font-Size="X-Small" Text="XGen_Finished"  />     </td></tr>
        <tr><td>   <asp:CheckBox ID="chkSS_XGNOTPART" runat="server"  AutoPostBack="false" Checked="false" Visible="false" Font-Size="X-Small" Text="XGen_NotPartic"  />   </td></tr>
        <tr><td>   <asp:CheckBox ID="chkSS_FINDROP" runat="server"  AutoPostBack="false" Checked="false" Visible="false" Font-Size="X-Small" Text="Finished_DropOut"  />   </td></tr>


        </table>
        </asp:Panel>
        </td>

        <%---------- CheckBox  GROUPS -------------%>
        <td style="vertical-align:top">
        <asp:Panel ID="Panel_WhereClauseControls_Groups" runat="server">
        <table cellpadding="0pt">
        <tr><td>  <asp:Label ID="lblGroups" runat="server" Text="Groups:" Width="80px"></asp:Label>             </td></tr>
        <tr><td>  <asp:CheckBox ID="chkGRP_1" runat="server" AutoPostBack="false"  Checked="false" Text="g1" Font-Size="X-Small"  />             </td></tr>
        <tr><td>  <asp:CheckBox ID="chkGRP_2" runat="server" AutoPostBack="false"  Checked="false" Text="g2" Font-Size="X-Small"  />             </td></tr>
        <tr><td>  <asp:CheckBox ID="chkGRP_3" runat="server" AutoPostBack="false" Checked="false" Text="g3" Font-Size="X-Small"  />             </td></tr>
        <tr><td>  <asp:CheckBox ID="chkGRP_4" runat="server" AutoPostBack="false" Checked="false" Text="g4" Font-Size="X-Small"  />             </td></tr>
        <tr><td>  <asp:CheckBox ID="chkGRP_5" runat="server" AutoPostBack="false" Checked="false" Text="g5" Font-Size="X-Small"  />             </td></tr>
        <tr><td>  <asp:CheckBox ID="chkGRP_6" runat="server" AutoPostBack="false" Checked="false" Text="g6" Font-Size="X-Small"  />             </td></tr>
        <tr><td>  <asp:CheckBox ID="chkGRP_7" runat="server" AutoPostBack="false" Checked="false" Text="g7" Font-Size="X-Small"  />             </td></tr>
        <tr><td>  <asp:CheckBox ID="chkGRP_8" runat="server" AutoPostBack="false" Checked="false" Text="g8" Font-Size="X-Small"  />             </td></tr>

            </table>
        </asp:Panel>
        <br />
        <asp:Panel ID="Panel_WhereClauseControls_Sex" runat="server">
        <table cellpadding="0pt">
        <tr><td>  <asp:Label ID="lblSex" runat="server" Text="Sex:"  Width="30px"></asp:Label>  </td></tr>
        <tr><td>  <asp:CheckBox ID="chkM" runat="server"           AutoPostBack="False" Checked="true"  Font-Size="X-Small"  Text="M" />  </td></tr>
        <tr><td>  <asp:CheckBox ID="chkF" runat="server"           AutoPostBack="False" Checked="true"  Font-Size="X-Small"  Text="F" />    </td></tr>
               </table>
        </asp:Panel>
        </td>

            <%---------- CheckBox  TIMEPOINTS -------------%>
        <td style="vertical-align:top">
         <asp:Panel ID="Panel_WhereClauseControls_Timepoints" runat="server">
        <table cellpadding="0pt">
        <tr><td>  <asp:Label ID="lblTP" runat="server" Text="TimePoints:" Width="80px"/>  </td></tr>
        <tr><td>  <asp:CheckBox ID="chkTP_1" runat="server" AutoPostBack="false" Checked="false"  Text="tp1"  Font-Size="X-Small"  />   </td></tr>
        <tr><td>  <asp:CheckBox ID="chkTP_2" runat="server" AutoPostBack="false" Checked="false"  Text="tp2"  Font-Size="X-Small"  />   </td></tr>
        <tr><td>  <asp:CheckBox ID="chkTP_3" runat="server" AutoPostBack="false" Checked="false"  Text="tp3"  Font-Size="X-Small"  />   </td></tr>
        <tr><td>  <asp:CheckBox ID="chkTP_4" runat="server" AutoPostBack="false" Checked="false"  Text="tp4"  Font-Size="X-Small"  />   </td></tr>
        <tr><td>  <asp:CheckBox ID="chkTP_5" runat="server" AutoPostBack="false" Checked="false"  Text="tp5"  Font-Size="X-Small"  />   </td></tr>
        <tr><td>  <asp:CheckBox ID="chkTP_6" runat="server" AutoPostBack="false" Checked="false"  Text="tp6"  Font-Size="X-Small"  />   </td></tr>
        <tr><td>  <asp:CheckBox ID="chkTP_7" runat="server" AutoPostBack="false" Checked="false"  Text="tp7"  Font-Size="X-Small"   />   </td></tr>
        <tr><td>  <asp:CheckBox ID="chkTP_8" runat="server" AutoPostBack="false" Checked="false"  Text="tp8"  Font-Size="X-Small"   />   </td></tr>
        <tr><td>  <asp:CheckBox ID="chkTP_9" runat="server" AutoPostBack="false" Checked="false"  Text="tp9"  Font-Size="X-Small"   />   </td></tr>
        <tr><td>  <asp:CheckBox ID="chkTP_10" runat="server" AutoPostBack="false" Checked="false" Text="tp10" Font-Size="X-Small"   />   </td></tr>
        <tr><td>  <asp:CheckBox ID="chkTP_11" runat="server" AutoPostBack="false" Checked="false" Text="tp11" Font-Size="X-Small"   />   </td></tr>
        <tr><td>  <asp:CheckBox ID="chkTP_12" runat="server" AutoPostBack="false" Checked="false" Text="tp12" Font-Size="X-Small"   />   </td></tr>
        </table>
        </asp:Panel>
        </td>

        <%---------- CheckBox  ACTION TYPES -------------%>
        <td style="vertical-align:top">
        <asp:Panel ID="PlaceHolder_WhereClauseControls_ActionTypes" runat="server" Visible="false">
        <table cellpadding="0pt">
        <tr><td>   <asp:Label ID="lblAT" runat="server" Text="Action Types:" CssClass = "right_align" Width="80px"></asp:Label>   </td></tr>
        <tr><td>   <asp:CheckBox ID="chkAT_1"  runat="server" AutoPostBack="false" Checked="false" Font-Size="X-Small" Text="Session"  />   </td></tr>
        <tr><td>   <asp:CheckBox ID="chkAT_2"  runat="server" AutoPostBack="false" Checked="false" Font-Size="X-Small" Text="Phone Call"  />   </td></tr>
        <tr><td>   <asp:CheckBox ID="chkAT_3"  runat="server" AutoPostBack="false" Checked="false" Font-Size="X-Small" Text="Send Item"  />   </td></tr>
        <tr><td>   <asp:CheckBox ID="chkAT_4"  runat="server" AutoPostBack="false" Checked="false" Font-Size="X-Small" Text="Receive Item"  />   </td></tr>
        <tr><td>   <asp:CheckBox ID="chkAT_18" runat="server" AutoPostBack="false" Checked="false" Font-Size="X-Small" Text="Coding"  />   </td></tr>
        <tr><td>   <asp:CheckBox ID="chkAT_8"  runat="server" AutoPostBack="false" Checked="false" Font-Size="X-Small" Text="Recording"  />   </td></tr>
        <tr><td>   <asp:CheckBox ID="chkAT_9"  runat="server" AutoPostBack="false" Checked="false" Font-Size="X-Small" Text="Decision (Y/N)"  />   </td></tr>
        <tr><td>   <asp:CheckBox ID="chkAT_7"  runat="server" AutoPostBack="false" Checked="false" Font-Size="X-Small" Text="Misc"  />   </td></tr>
        <tr><td>   <asp:CheckBox ID="chkAT_6"  runat="server" AutoPostBack="false" Checked="false" Font-Size="X-Small" Text="Decision (P/F)"  />   </td></tr>
        <tr><td>   <asp:CheckBox ID="chkAT_25" runat="server" AutoPostBack="false" Checked="false" Font-Size="X-Small" Text="IBIS2 Activate TP"  />   </td></tr>
        <tr><td>   <asp:CheckBox ID="chkAT_14" runat="server" AutoPostBack="false" Checked="false" Font-Size="X-Small" Text="Decision (E/I)"  />   </td></tr>
        <tr><td>   <asp:CheckBox ID="chkAT_16" runat="server" AutoPostBack="false" Checked="false" Font-Size="X-Small" Text="Decision"  />   </td></tr>
        <tr><td>   <asp:CheckBox ID="chkAT_20" runat="server" AutoPostBack="false" Checked="false" Font-Size="X-Small" Text="TimePoint Status"  />   </td></tr>
        <tr><td>   <asp:CheckBox ID="chkAT_17" runat="server" AutoPostBack="false" Checked="false" Font-Size="X-Small" Text="PFR slot"  />   </td></tr>
        <tr><td>   <asp:CheckBox ID="chkAT_11" runat="server" AutoPostBack="false" Checked="false" Font-Size="X-Small" Text="Counterbalance"  />   </td></tr>
        <tr><td>   <asp:CheckBox ID="chkAT_5"  runat="server" AutoPostBack="false" Checked="false" Font-Size="X-Small" Text="Review"  />   </td></tr>
        <tr><td>   <asp:CheckBox ID="chkAT_19" runat="server" AutoPostBack="false" Checked="false" Font-Size="X-Small" Text="SubjectRequest"  />   </td></tr>
        <tr><td>   <asp:CheckBox ID="chkAT_22" runat="server" AutoPostBack="false" Checked="false" Font-Size="X-Small" Text="Family Type"  />   </td></tr>
        <tr><td>   <asp:CheckBox ID="chkAT_24" runat="server" AutoPostBack="false" Checked="false" Font-Size="X-Small" Text="IBIS2 Plan"  />   </td></tr>
        <tr><td>   <asp:CheckBox ID="chkAT_15" runat="server" AutoPostBack="false" Checked="false" Font-Size="X-Small" Text="Registry Contact Source"  />   </td></tr>
        <tr><td>   <asp:CheckBox ID="chkAT_26" runat="server" AutoPostBack="false" Checked="false" Font-Size="X-Small" Text="Desig. Adult Study Partcpnt"  />   </td></tr>
        <tr><td>   <asp:CheckBox ID="chkAT_21" runat="server" AutoPostBack="false" Checked="false" Font-Size="X-Small" Text="Dx Location"  />   </td></tr>
        </table>        	                                                                         
                                                                                                     
        </asp:Panel>
        </td>

        <%---------- CheckBox  ACTION STATUS -------------%>
        <td style="vertical-align:top">
        <asp:Panel ID="PlaceHolder_WhereClauseControls_ActionStatus" runat="server" Visible="false">
             <table cellpadding="0pt">
             <tr><td>   <asp:Label ID="Label2" runat="server" Text="Action Status:" CssClass = "right_align" Width="80px"></asp:Label>     </td></tr>
             <tr><td>   <asp:CheckBox ID="chkAS_1"  runat="server" AutoPostBack="false" Checked="false" Font-Size="X-Small"  Text="COMP"  />     </td></tr>
             <tr><td>   <asp:CheckBox ID="chkAS_2"  runat="server" AutoPostBack="false" Checked="false" Font-Size="X-Small"  Text="TBD"  />     </td></tr>
             <tr><td>   <asp:CheckBox ID="chkAS_3"  runat="server" AutoPostBack="false" Checked="false" Font-Size="X-Small"  Text="TBD?"  />     </td></tr>
             </table>
            </asp:Panel>
        </td>
 
         <%---------- CheckBox  MEAS STATUS -------------%>
        <td style="vertical-align:top">
        <asp:Panel ID="PlaceHolder_WhereClauseControls_MeasStatus" runat="server" Visible="false">
             <table cellpadding="0pt">
             <tr><td>   <asp:Label ID="Label3" runat="server" Text="Meas Status:" CssClass = "right_align" Width="80px"></asp:Label>     </td></tr>
             <tr><td>   <asp:CheckBox ID="CheckBox1"  runat="server" AutoPostBack="false" Checked="false" Font-Size="X-Small" Text="Data"   />     </td></tr>
             <tr><td>   <asp:CheckBox ID="CheckBox2"  runat="server" AutoPostBack="false" Checked="false" Font-Size="X-Small" Text="NoData"  />     </td></tr>
             <tr><td>   <asp:CheckBox ID="CheckBox3"  runat="server" AutoPostBack="false" Checked="false" Font-Size="X-Small" Text="TBD"  />     </td></tr>
             <tr><td>   <asp:CheckBox ID="CheckBox4"  runat="server" AutoPostBack="false" Checked="false" Font-Size="X-Small" Text="N/A"  />     </td></tr>
             </table>
            </asp:Panel>
        </td>

     </tr>
    </table> <%------- END    Where Clause CheckBox Containers --------%>


</td>

<td width = "100px"></td>
<td>

<%------- SubjectStatus N's Table --------%>
    <asp:Panel ID="Panel_SubjStatus_Totals" runat="server">
    </asp:Panel>
</td>
</tr>
</table>

<br/>  
<%-------------- BUTTONS ---------------%>
    <asp:Label ID="Label1" runat="server" Text="View details" Font-Size="Smaller"></asp:Label>
 <br/>  

<table>
    <tr>

     <td>  <asp:Button ID="ButtonAM" runat="server" Text="Actions>Measures, Consents" OnClick="setdata_AM" Font-Size="Smaller" Width = "160px" />  </td>
     <td>  <asp:Button ID="ButtonA" runat="server" Text="Actions" OnClick="setdata_A" Font-Size="Smaller"/>                                        </td>
     <td>  <asp:Button ID="ButtonM" runat="server" Text="Measures" OnClick="setdata_M" Font-Size="Smaller" />                                      </td>
     <td>  <asp:Button ID="ButtonC" runat="server" Text="Consents" OnClick="setdata_C" Font-Size="Smaller"/>                                       </td>
     <td>  <asp:Button ID="ButtonS" runat="server" Text="Subjects" OnClick="setdata_S" Font-Size="Smaller"/>                                       </td>
     <td>  <asp:Button ID="Button1" runat="server" Text="Enrollment Rpt" OnClick="setdata_EnrollmentRpt" Font-Size="Smaller"/>                     </td>
     <td>  <asp:Button ID="ButtonDEtotals" runat="server" Text="Data Entry Totals" OnClick="setdata_DEtotals" Font-Size="Smaller"/>                </td>
     <td>  <asp:Button ID="ButtonDEtotalsREL" runat="server" Text="Data Entry Totals REL" OnClick="setdata_DEtotalsREL" Font-Size="Smaller"/>      </td>

    </tr>
    <tr>
        <td></td><td></td>
        <td>  <asp:Button ID="Button2" runat="server" Text="Measures TE" OnClick="setdata_MTE" Font-Size="Smaller" />                                      </td>
        <td></td><td></td>
        <td></td><td></td>
        <td></td>

    </tr>

</table>
        <br/>

        <br/><br/>
        <asp:Label ID="LabelAM" runat="server" Text="Actions > Measures, Consents"  Visible="false" Font-Bold="true" Font-Size="Medium"></asp:Label>
        <asp:Label ID="LabelM" runat="server" Text="Measures" Visible="false" Font-Bold="true" Font-Size="Medium"></asp:Label>
        <asp:Label ID="LabelA" runat="server" Text="Actions" Visible="false" Font-Bold="true" Font-Size="Medium"></asp:Label>
        <asp:Label ID="LabelC" runat="server" Text="Consents" Visible="false" Font-Bold="true" Font-Size="Medium"></asp:Label>
        <asp:Label ID="LabelS" runat="server" Text="Subjects" Visible="false" Font-Bold="true" Font-Size="Medium"></asp:Label>
        <asp:Label ID="LabelDEtotals" runat="server" Text="Data Entry Totals" Visible="false" Font-Bold="true" Font-Size="Medium"></asp:Label>




<table border = "0"  cellspacing="0" id="Table2" runat="server">

<%--<table border = "0" width="100%" cellspacing="0" class="tblinputsmall_white" id="tblMaster" runat="server">--%>
<tr><td id="tdNotes" runat="server">
 <br/>
    <asp:PlaceHolder ID="PlaceHolder1" runat="server"></asp:PlaceHolder>
</td></tr>

</table>


    <asp:Panel id="Panel_Enrollment_Rpt_Header" runat="server" visible="false">    </asp:Panel>
    <asp:Panel id="Panel_Enrollment_Rpt0" runat="server" visible="false">    
        <asp:GridView ID="gv_Enrollment_Rpt0" runat="server" Visible="true" AutoGenerateColumns="false">
            <Columns>

            <asp:TemplateField> <HeaderTemplate>Racial Categories </HeaderTemplate><ItemTemplate> <asp:Label ID="x1" runat="server" Text='<%# Eval("RacialCategories") %>'></asp:Label></ItemTemplate></asp:TemplateField>
            <asp:TemplateField> <HeaderTemplate>Not Hispanic:<br/>Females </HeaderTemplate><ItemTemplate> <asp:Label ID="x2" runat="server" Text='<%# Eval("NotHispanic_F"   ) %>'></asp:Label></ItemTemplate></asp:TemplateField>
            <asp:TemplateField> <HeaderTemplate>Not Hispanic:<br/>Males </HeaderTemplate><ItemTemplate> <asp:Label ID="x3" runat="server" Text='<%# Eval("NotHispanic_M"   ) %>'></asp:Label></ItemTemplate></asp:TemplateField>
            <asp:TemplateField> <HeaderTemplate>Not Hispanic:<br/>Unknown </HeaderTemplate><ItemTemplate> <asp:Label ID="x4" runat="server" Text='<%# Eval("NotHispanic_Unk" ) %>'></asp:Label></ItemTemplate></asp:TemplateField>
            <asp:TemplateField HeaderStyle-BackColor="WhiteSmoke" ItemStyle-BackColor="WhiteSmoke"> <HeaderTemplate>Hispanic:<br/>Females </HeaderTemplate><ItemTemplate> <asp:Label ID="x5" runat="server" Text='<%# Eval("Hispanic_F"      ) %>'></asp:Label></ItemTemplate></asp:TemplateField>
            <asp:TemplateField HeaderStyle-BackColor="WhiteSmoke" ItemStyle-BackColor="WhiteSmoke"> <HeaderTemplate>Hispanic:<br/>Males </HeaderTemplate><ItemTemplate> <asp:Label ID="x6" runat="server" Text='<%# Eval("Hispanic_M"      ) %>'></asp:Label></ItemTemplate></asp:TemplateField>
            <asp:TemplateField HeaderStyle-BackColor="WhiteSmoke" ItemStyle-BackColor="WhiteSmoke"> <HeaderTemplate>Hispanic:<br/>Unknown </HeaderTemplate><ItemTemplate> <asp:Label ID="x7" runat="server" Text='<%# Eval("Hispanic_Unk"    ) %>'></asp:Label></ItemTemplate></asp:TemplateField>
            <asp:TemplateField> <HeaderTemplate>Unknown:<br/>Females </HeaderTemplate><ItemTemplate> <asp:Label ID="x8" runat="server" Text='<%# Eval("Unk_F"           ) %>'></asp:Label></ItemTemplate></asp:TemplateField>
            <asp:TemplateField> <HeaderTemplate>Unknown:<br/>Males   </HeaderTemplate><ItemTemplate> <asp:Label ID="x9" runat="server" Text='<%# Eval("Unk_M"           ) %>'></asp:Label></ItemTemplate></asp:TemplateField>
            <asp:TemplateField> <HeaderTemplate>Unknown:<br/>Unknown </HeaderTemplate><ItemTemplate> <asp:Label ID="x10" runat="server" Text='<%# Eval("Unk_Unk"         ) %>'></asp:Label></ItemTemplate></asp:TemplateField>
            <asp:TemplateField HeaderStyle-BackColor="WhiteSmoke" ItemStyle-BackColor="WhiteSmoke"> <HeaderTemplate>** Total **</HeaderTemplate><ItemTemplate> <asp:Label ID="x11" runat="server" Text='<%# Eval("Total"           ) %>'></asp:Label></ItemTemplate></asp:TemplateField>

            </Columns>
        </asp:GridView>
    </asp:Panel>


    <asp:Panel id="Panel_Enrollment_Rpt1" runat="server" visible="false">    </asp:Panel>

    <asp:Panel id="Panel_SubjectDetails" runat="server">       </asp:Panel>

    <asp:Panel id="Panel_Consents" runat="server" Visible="false">       
        <asp:GridView ID="gvScroll" runat="server"  Width="100%" AutoGenerateColumns="false" OnRowDataBound="mygridview_RowDataBound"
        HeaderStyle-CssClass="GridviewScrollHeader" RowStyle-CssClass="GridviewScrollItem" PagerStyle-CssClass="GridviewScrollPager" >

        </asp:GridView>
    </asp:Panel>


    <asp:Panel ID="Panel_Consents_Denied" runat="server">    </asp:Panel>
    
    <asp:Panel ID="Panel_DataEntryTotals" runat="server" Visible="false">    
          
        <asp:GridView ID="GV_TimePoint" runat="server" AutoGenerateColumns="false" Font-Size="Smaller">
            <Columns>
            <asp:BoundField DataField="timepoint_text" HeaderText="Time Point" />
            <asp:BoundField DataField="nID" HeaderText="# Subjects" />
            <asp:BoundField DataField="nNotNA" HeaderText="# Attempted" />
            <asp:BoundField DataField="nTBC" HeaderText="TBC"  HeaderStyle-BackColor="CornflowerBlue" />
            <asp:BoundField DataField="nNA" HeaderText="NA"   HeaderStyle-BackColor="Gray" />
            <asp:BoundField DataField="txtnD2" HeaderText="Dbl Ent"  HeaderStyle-BackColor="DarkGreen"  />
            <asp:BoundField DataField="txtnD1" HeaderText="Sng Ent"  HeaderStyle-BackColor="ForestGreen" />
            <asp:BoundField DataField="txtnTE" HeaderText="To Enter"  HeaderStyle-BackColor="Lime" />
            <asp:BoundField DataField="txtnDE_chk" HeaderText="Ent-to chk"  HeaderStyle-BackColor="Yellow" />
            <asp:BoundField DataField="txtnCHK" HeaderText="Check"  HeaderStyle-BackColor="Orange" />
            <asp:BoundField DataField="txtnNoData1" HeaderText="NoData 1"  HeaderStyle-BackColor="Red" />
            <asp:BoundField DataField="txtnNoData2" HeaderText="NoData 2"  HeaderStyle-BackColor="DarkRed" />
     
        
            <asp:TemplateField>
            <HeaderTemplate><asp:Label ID="Label4" runat="server" Text="Data Entry % (of those collected)"></asp:Label></HeaderTemplate>
            <ItemTemplate>
            <asp:Literal ID="x" runat="server" Text='<%# Eval("entered_table") %>'></asp:Literal>
            </ItemTemplate>
            </asp:TemplateField>

            <asp:TemplateField>
            <HeaderTemplate><asp:Label ID="Label4" runat="server" Text="Data Collection % (of those expected)"></asp:Label></HeaderTemplate>
            <ItemTemplate>
            <asp:Literal ID="x" runat="server" Text='<%# Eval("collected_table") %>'></asp:Literal>
            </ItemTemplate>
            </asp:TemplateField>

            </Columns>
        </asp:GridView>


        <br /><br />


        <asp:GridView ID="GV_StudyMeas" runat="server" AutoGenerateColumns="false" Font-Size="X-Small">
        <Columns>
             <asp:BoundField DataField="timepoint_text" HeaderText="Time Point" />
             <asp:BoundField DataField="studymeasname" HeaderText="Measure" />
             <asp:BoundField DataField="nID" HeaderText="# Subjects" />
             <asp:BoundField DataField="nNotNA" HeaderText="# Attempted" />
             <asp:BoundField DataField="nTBC" HeaderText="TBC"  HeaderStyle-BackColor="CornflowerBlue" />
             <asp:BoundField DataField="nNA" HeaderText="NA"  HeaderStyle-BackColor="Gray" />

             <asp:BoundField DataField="txtnD2" HeaderText="Dbl Ent"  HeaderStyle-BackColor="DarkGreen"  />
             <asp:BoundField DataField="txtnD1" HeaderText="Sng Ent"  HeaderStyle-BackColor="ForestGreen" />
             <asp:BoundField DataField="txtnTE" HeaderText="To Enter"  HeaderStyle-BackColor="Lime" />
             <asp:BoundField DataField="txtnDE_chk" HeaderText="Ent-to chk"  HeaderStyle-BackColor="Yellow" />
             <asp:BoundField DataField="txtnCHK" HeaderText="Check"  HeaderStyle-BackColor="Orange" />
             <asp:BoundField DataField="txtnNoData1" HeaderText="NoData 1"  HeaderStyle-BackColor="Red" />
             <asp:BoundField DataField="txtnNoData2" HeaderText="NoData 2"  HeaderStyle-BackColor="DarkRed" />
     

             <asp:TemplateField>
                 <HeaderTemplate><asp:Label ID="Label4" runat="server" Text="Data Entry % (of those collected)"></asp:Label></HeaderTemplate>
                 <ItemTemplate>
                 <asp:Literal ID="x" runat="server" Text='<%# Eval("entered_table") %>'></asp:Literal>
                 </ItemTemplate>
             </asp:TemplateField>

             <asp:TemplateField>
                 <HeaderTemplate><asp:Label ID="Label4" runat="server" Text="Data Collection % (of those expected)"></asp:Label></HeaderTemplate>
                 <ItemTemplate>
                 <asp:Literal ID="x" runat="server" Text='<%# Eval("collected_table") %>'></asp:Literal>
                 </ItemTemplate>
             </asp:TemplateField>
        </Columns>
        </asp:GridView>
    </asp:Panel>
    

<asp:SqlDataSource ID="Sql_Studies" runat="server" SelectCommandType="StoredProcedure"  
    SelectCommand="spSEC_GetStudies_CanView_by_User__Short__with_SelectStudy"  
    ConnectionString="<%$ ConnectionStrings: TRACKING_CONN_STRING %>">
   </asp:SqlDataSource>  


   <br /> <br /> <br /> <br /> <br /> <br /> <br /> <br /> <br /> <br /> <br /> <br /> <br /> <br /> <br /> <br /> <br /> <br /> <br /> <br />  <br />

    <table id="Table1" runat="server" width="100%" >
 <tr><td style="color: Red"></td></tr>
 </table>
  <table id="tblmyerror" runat="server" width="100%">
 <tr><td>
     <asp:Label ID="lblMyError" runat="server" Text="" CssClass="ErrorCell" ></asp:Label>
     <asp:Label ID="lblMyInfo" runat="server" Text="" CssClass="InfoCell" ></asp:Label>
 </td></tr>
 </table>

           <asp:Button ID="ButtonA_duedate" runat="server" Text="Actions - color by Due date" OnClick="setdata_A_duedate" Font-Size="Smaller"/>

           <br />
    <asp:Label ID="lblCheckSql" runat="server" Text="" ForeColor="Gray"></asp:Label>

  
    <%--    Added for GridViewScroll    see  http://gridviewscroll.aspcity.idv.tw/     
    Note that the other javascript refs are placed in UWAutism.master  --%>
<script type="text/javascript">
    $(document).ready(function () {
        gridviewScroll();
    });

    function gridviewScroll() {
        $('#<%=gvScroll.ClientID%>').gridviewScroll({
            width: $(window).width() - 10,
            height: 800,
            freezesize: 2,
            railcolor: "#F0F0F0",
            barcolor: "#CDCDCD",
            barhovercolor: "#606060",
            bgcolor: "#F0F0F0",
            arrowsize: 30,
            varrowtopimg: "Images/arrowvt.png",
            varrowbottomimg: "Images/arrowvb.png",
            harrowleftimg: "Images/arrowhl.png",
            harrowrightimg: "Images/arrowhr.png",
            headerrowcount: 1,
            railsize: 16,
            barsize: 8

        });
    }
    </script>
<%--end GridViewScroll--%>
 
</asp:Content>
