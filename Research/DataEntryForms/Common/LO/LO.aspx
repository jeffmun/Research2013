<%@ register tagprefix="def" namespace="DataEntryFramework3" %> 
<%@ page language="c#" masterpagefile="~/UWAC.master"  title="LO data entry" %>
<asp:content id="content1" contentplaceholderid="obodyplaceholder" runat="server">
<link rel="stylesheet" type="text/css" href="/research/dataentry/dataentryform.css" />
<def:dataentrycontroller id="dataentrycontroller1" runat="server" databasetable="ALL_LO" primarykeyfield="lo_pk">
</def:dataentrycontroller>
   <asp:scriptmanager id="scriptmanager1" runat="server">    </asp:scriptmanager>
<asp:updatepanel id="updatepanel1" runat="server">
  <contenttemplate>
<table>
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="ID" databasefield="ID" isinsertfield="true" fieldlabelwidth="300px" fieldtextboxwidth="250px" fieldtextboxmaxlength="15"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="indexnum" databasefield="indexnum" isinsertfield="true" fieldtextboxtextdefault="1" fieldlabelwidth="300px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="indexnum_all" databasefield="indexnum_all" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="300px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="LOnum" databasefield="LOnum" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="300px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="LOweeknum" databasefield="LOweeknum" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="300px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="week_label" databasefield="week_label" isentryfield="true" isdoubleentryfield="false" fieldlabelwidth="300px" fieldtextboxwidth="250px" fieldtextboxmaxlength="100"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="actual_week" databasefield="actual_week" isentryfield="true" isdoubleentryfield="false" fieldlabelwidth="300px" fieldtextboxwidth="250px" fieldtextboxmaxlength="100"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="letter" databasefield="letter" isentryfield="true" isdoubleentryfield="false" fieldlabelwidth="300px" fieldtextboxwidth="250px" fieldtextboxmaxlength="10"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="expected_date" databasefield="expected_date" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="300px" formatstring="{0:d}" ></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="date_recorded" databasefield="date_recorded" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="300px" formatstring="{0:d}" ></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="week_recorded" databasefield="week_recorded" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="300px"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="Coder" databasefield="Coder" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="300px" fieldtextboxwidth="400px" fieldtextboxheight="40px" fieldtextboxtextmode="multiline" fieldtextboxmaxlength="255"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="reliability" databasefield="reliability" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="300px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="activity_type" databasefield="activity_type" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="300px" fieldtextboxwidth="400px" fieldtextboxheight="40px" fieldtextboxtextmode="multiline" fieldtextboxmaxlength="255"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="scoring_code" databasefield="scoring_code" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="300px" fieldtextboxwidth="400px" fieldtextboxheight="40px" fieldtextboxtextmode="multiline" fieldtextboxmaxlength="255"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="plan_label" databasefield="plan_label" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="300px" fieldtextboxwidth="400px" fieldtextboxheight="40px" fieldtextboxtextmode="multiline" fieldtextboxmaxlength="255"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="plan_" databasefield="plan_" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="300px" fieldtextboxwidth="400px" fieldtextboxheight="40px" fieldtextboxtextmode="multiline" fieldtextboxmaxlength="255"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="shared" databasefield="shared" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="300px" fieldtextboxwidth="400px" fieldtextboxheight="40px" fieldtextboxtextmode="multiline" fieldtextboxmaxlength="255"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="notes" databasefield="notes" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="300px" fieldtextboxwidth="400px" fieldtextboxheight="40px" fieldtextboxtextmode="multiline" fieldtextboxmaxlength="255"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="codeable" databasefield="codeable" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="300px" fieldtextboxwidth="400px" fieldtextboxheight="40px" fieldtextboxtextmode="multiline" fieldtextboxmaxlength="255"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="duration" databasefield="duration" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="300px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="successes" databasefield="successes" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="300px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="fails" databasefield="fails" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="300px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="total" databasefield="total" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="300px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="ABC_raw" databasefield="ABC_raw" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="300px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="BC_raw" databasefield="BC_raw" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="300px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 
<br/><br/><tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="created" databasefield="created" isreadonly="true" renderreadonlyasdiv="true" fieldlabelwidth="300px"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="createdBy" databasefield="createdBy" isreadonly="true" renderreadonlyasdiv="true" fieldlabelwidth="300px" fieldtextboxwidth="250px" fieldtextboxmaxlength="50"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="updated" databasefield="updated" isreadonly="true" renderreadonlyasdiv="true" fieldlabelwidth="300px" formatstring="{0:d}" ></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="updatedBy" databasefield="updatedBy" isreadonly="true" renderreadonlyasdiv="true" fieldlabelwidth="300px" fieldtextboxwidth="250px" fieldtextboxmaxlength="50"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="scored" databasefield="scored" isreadonly="true" renderreadonlyasdiv="true" fieldlabelwidth="300px"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="scoredBy" databasefield="scoredBy" isreadonly="true" renderreadonlyasdiv="true" fieldlabelwidth="300px" fieldtextboxwidth="250px" fieldtextboxmaxlength="50"></def:datafieldcontrol></td>
<td></td></tr>
 
</table>
</contenttemplate>
<triggers></triggers>
</asp:updatepanel>
</asp:content>
