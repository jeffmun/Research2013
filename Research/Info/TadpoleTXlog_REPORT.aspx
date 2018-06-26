<%@ Page Language="c#" Debug="true" MasterPageFile="~/UWAC.master" CodeFile="TadpoleTXlog_REPORT.aspx.cs" AutoEventWireup="true"
 Inherits="Info_TadpoleTXlog_REPORT" Title="Tadpole Tx Log Report" %>
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


    <br /> <br />
    <asp:Label ID="Label1" runat="server" Text="Tadpole Tx Log Summary Report" Font-Size="Medium" Font-Bold="true" Font-Underline="true" ></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:LinkButton ID="LinkButton1" runat="server" PostBackUrl="https://uwac.autism.washington.edu/research/DataEntryForms/Common/TadpoleTXlog/TadpoleTXlog.aspx">Go to Data Entry page</asp:LinkButton>

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:LinkButton ID="LinkButton2" runat="server" PostBackUrl="https://uwac.autism.washington.edu/research/DataEntryForms/Common/TadpoleTXlog/TadpoleTXlog_list.aspx">Go to List of Entered Weeks</asp:LinkButton>
    <br />
    <br />
    <br/><br/>

    
    <table>
    <tr><td><b>Introduction to the tables.</b>  <br /><i>These tables are based on the currently entered data from the Tadpole Treatment Log forms.  These forms contain data for 1 therapist for 1 week.
    <br />The data from this form is resaved to a table organized by subject.  The treatment hours are aggregated by each day, then by each week.
    <br />The values presented in this table are based on the weekly totals of treatment hours for each subject.  If no data is entered for a week,
    <br />this does not affect the values here.  We should discuss how to handle weeks with zero as seen in the plots below.
        </i></td>

    <td>
        <asp:GridView ID="gv_LoggingStatus" runat="server" DataSourceID="Sql_EntryStatus" AutoGenerateColumns="true" ForeColor="DarkBlue">
        </asp:GridView>
    </td>        
        
        <td>   
    </td>
        
        </tr>
    </table>
    <br />
    <asp:Panel ID="Panel0" runat="server">
    </asp:Panel>

    <br />
    <asp:Panel ID="Panel1" runat="server">
    </asp:Panel>
    
        <br/><br/>
    <asp:Panel ID="Panel2" runat="server">
    </asp:Panel>
        <br/><br/>
    <asp:Panel ID="Panel3" runat="server">
    </asp:Panel>
        <br/><br/><br/>

    <asp:Label ID="lbl_ID" runat="server" Text="ID:"></asp:Label><asp:DropDownList ID="ddlID" runat="server" DataSourceID="sqlID" DataTextField="ID" DataValueField="ID"/>
    &nbsp;&nbsp;&nbsp;<asp:Button ID="btnShowByID" runat="server" Text="Load details for this ID" Visible="true" OnClick="ShowDetailsByID" Font-Size="Smaller" /> 
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Button ID="btnHidePanel4" runat="server" Text="Hide details by ID" Visible="false" OnClick="HidePanel4" /> 

    <br /><br />

    <asp:Panel ID="Panel4" runat="server" Visible="false">
    </asp:Panel>    

    <br /><br />
    <asp:Panel ID="Panel4b" runat="server">
    </asp:Panel>
    <br /><br />


    <asp:Label ID="Label2" runat="server" Text=""></asp:Label>

    <asp:Panel ID="Panel_graphs" runat="server" Visible="false">

    <table>
    <tr><td><b>Introduction to the plots.</b>  <br /><i>These plots begin with the earliest week for which treatment hours have been logged.  The week in which their assignment was made is noted by the orange line.</i></td></tr>

    <tr>    <td style="vertical-align:top">#1. Dates of Assignment and Beginning of Treatment.</td></tr>
    <tr><td><asp:Image ID="Image5" runat="server" ImageUrl="txbegP1.png" /></td></tr>

    <tr>    <td style="vertical-align:top">#2. "Missed" hours for the week are summed according to the reason missed (Staff, Family, or Holiday).</td></tr>
    <tr><td><asp:Image ID="Image11" runat="server" ImageUrl="w1_mis.png" /></td></tr>


    <tr><td style="vertical-align:top">#3. All treatment hours for each location are summed for each week.  These include Home, Clinic, School, and Other locations.<br />
     Zeroes likely represent weeks for which no data has been entered yet.</td></tr>

    <tr><td><asp:Image ID="Image1" runat="server" ImageUrl="wks.png" /></td></tr>

    <tr><td>
        <table><tr>
                    <td><asp:Image ID="Image2" runat="server" ImageUrl="hist.png" /></td>
                    <td><asp:Image ID="Image3" runat="server" ImageUrl="box.png" /></td></tr></table>
        </td>
    </tr>

<%--    <tr><td><asp:Image ID="Image7" runat="server" ImageUrl="w1c.png" /></td></tr> --%>

  
    <tr>    <td style="vertical-align:top">#4. Treatment hours taking place at HOME.</td></tr>
    <tr><td><asp:Image ID="Image8" runat="server" ImageUrl="w1h.png" /></td></tr>
    
    <tr>    <td style="vertical-align:top">#5. Treatment hours taking place at the CLINIC.</td></tr>
    <tr><td><asp:Image ID="Image9" runat="server" ImageUrl="w1cl.png" /></td></tr>
    
    <tr>    <td style="vertical-align:top">#6. Treatment hours taking place at SCHOOL.</td></tr>
    <tr><td><asp:Image ID="Image10" runat="server" ImageUrl="w1s.png" /></td></tr>

    <tr>    <td style="vertical-align:top">#7. Treatment hours - OTHER (or Location is NULL).</td></tr>
    <tr><td><asp:Image ID="Image4" runat="server" ImageUrl="w1o.png" /></td></tr>
    
    
<%--    <tr>    <td style="vertical-align:top">#6. This plot displays the number of days each week that have at least some treatment hours recorded.  Zeroes likely represent weeks for which no data has been entered yet.</td></tr>
    <tr><td><asp:Image ID="Image12" runat="server" ImageUrl="w1_ndays.png" /></td></tr>
--%>

    
    </table>

      </asp:Panel>



<%--    <asp:Label ID="lblINTRO_studyname" runat="server" Text=" " Font-Size="Medium" Font-Bold="false" Visible="false"></asp:Label>
    <asp:Label ID="lblStudyname_ContentPage" runat="server" Text=" " Font-Size="Medium" Font-Bold="true" Visible="false"></asp:Label>--%>    


<br />
<br />

    <asp:Panel ID="Panel5" runat="server">

        <asp:Label ID="Label3" runat="server" Text="Individuals in the 'Tadpole Tx Logs group':" Font-Underline="true"></asp:Label>
        <asp:GridView ID="GridView1" runat="server" DataSourceID="Sql_TxlogsGroup" AutoGenerateColumns="true" >
        </asp:GridView>

    </asp:Panel>


    <%-- 
<asp:SqlDataSource ID="Sql_Studies" runat="server" SelectCommandType="StoredProcedure"  
    SelectCommand="spSEC_GetStudies_CanView_by_User__Short__with_SelectStudy"  
    ConnectionString="<%$ ConnectionStrings: TRACKING_CONN_STRING %>">
   </asp:SqlDataSource>  
   --%>


<asp:SqlDataSource ID="Sql_TxlogsGroup" runat="server" SelectCommandType="Text"  
    SelectCommand="select * from vwTadpoleTXLogs_members"  
    ConnectionString="<%$ ConnectionStrings: TRACKING_CONN_STRING %>">
   </asp:SqlDataSource>  

   
<asp:SqlDataSource ID="Sql_EntryStatus" runat="server" SelectCommandType="Text"  
    SelectCommand="select SubjectLoggingStatus as [Logging Status] , COUNT(*) as [# Therapist-Weeks] 
        from uwautism_research_backend..vwTadpoleTXlog_list group by SubjectLoggingStatus"  
    ConnectionString="<%$ ConnectionStrings: TRACKING_CONN_STRING %>">
   </asp:SqlDataSource>  

   sqlID
<asp:SqlDataSource ID="sqlID" runat="server" SelectCommandType="Text"  
    SelectCommand="select ' select ID:' as ID union select ID from vwMasterStatus_S where studyID=1076 order by ID"  
    ConnectionString="<%$ ConnectionStrings: TRACKING_CONN_STRING %>">
   </asp:SqlDataSource>  



<br />
<br />
<br />
        <asp:Button ID="btn_LogPending" runat="server" Text="Log Pending Weeks" OnClick="LogPending_submit" Font-Size="X-Small" />

</asp:Content>


