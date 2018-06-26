<%@ register tagprefix="def" namespace="DataEntryFramework3" %> 
<%@ page language="c#" masterpagefile="~/UWAC.master"  title="CCCSM data entry" %>
<asp:content id="content1" contentplaceholderid="obodyplaceholder" runat="server">
<link rel="stylesheet" type="text/css" href="/research/dataentry/dataentryform.css" />
<def:dataentrycontroller id="dataentrycontroller1" runat="server" databasetable="ALL_CCSM" primarykeyfield="ccsm_pk">
</def:dataentrycontroller>
   <asp:scriptmanager id="scriptmanager1" runat="server">    </asp:scriptmanager>
<asp:updatepanel id="updatepanel1" runat="server">
  <contenttemplate>
<table>
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="id" databasefield="id" isinsertfield="true" fieldlabelwidth="200px" fieldtextboxwidth="250px" fieldtextboxmaxlength="15"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="indexnum" databasefield="indexnum" isinsertfield="true" fieldtextboxtextdefault="1" fieldlabelwidth="200px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="ccsm_date" databasefield="ccsm_date" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="200px" formatstring="{0:d}" ></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="ccsm_agemo" databasefield="ccsm_agemo" isreadonly="true" renderreadonlyasdiv="true" fieldlabelwidth="200px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="ccsm_resp" databasefield="ccsm_resp" isentryfield="true" isdoubleentryfield="false" fieldlabelwidth="200px" fieldtextboxwidth="250px" fieldtextboxmaxlength="50"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="ccsm_cmnt" databasefield="ccsm_cmnt" isentryfield="true" isdoubleentryfield="false" fieldlabelwidth="200px" fieldtextboxwidth="400px" fieldtextboxheight="40px" fieldtextboxtextmode="multiline" fieldtextboxmaxlength="250"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="ccsm_scrmsg" databasefield="ccsm_scrmsg" isreadonly="true" renderreadonlyasdiv="true" fieldlabelwidth="200px" fieldtextboxwidth="400px" fieldtextboxheight="40px" fieldtextboxtextmode="multiline" fieldtextboxmaxlength="250"></def:datafieldcontrol></td>
<td></td></tr>
</table>

      <br />
      <br />

<table>
    <%--HEADER--%>
    <tr>
        <td width="700px">
            
            <asp:Label ID="Label1" runat="server" Text="In the past two weeks, has much (or how often) has your child..." Font-Bold="true" Font-Underline="true"></asp:Label>

        </td>
        <td>
            <asp:Label ID="lblscores" runat="server" Text="Symptom Domain Scores" Font-Bold="true" Font-Underline="true" Font-Size="Small"></asp:Label>
        </td>
    </tr>
    <%--DETAILS--%>
    <tr>
        <td>
        <%--ITEMS--%>
          <table>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="ccsm01" databasefield="ccsm01" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="380px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
 
<td style="vertical-align:top"><def:valuesetlabel id="valuesetlabel_ccsm01" runat="server"  databasefield="ccsm01"></def:valuesetlabel></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="ccsm02" databasefield="ccsm02" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="380px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="ccsm03" databasefield="ccsm03" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="380px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="ccsm04" databasefield="ccsm04" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="380px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="ccsm05" databasefield="ccsm05" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="380px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="ccsm06" databasefield="ccsm06" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="380px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="ccsm07" databasefield="ccsm07" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="380px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="ccsm08" databasefield="ccsm08" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="380px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="ccsm09" databasefield="ccsm09" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="380px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="ccsm10" databasefield="ccsm10" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="380px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="ccsm11" databasefield="ccsm11" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="380px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="ccsm12" databasefield="ccsm12" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="380px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="ccsm13" databasefield="ccsm13" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="380px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="ccsm14" databasefield="ccsm14" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="380px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="ccsm15" databasefield="ccsm15" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="380px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="ccsm16" databasefield="ccsm16" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="380px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="ccsm17" databasefield="ccsm17" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="380px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="ccsm18" databasefield="ccsm18" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="380px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="ccsm19" databasefield="ccsm19" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="380px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 <tr><td>
     <br />
     <asp:Label ID="lbl2wks2" runat="server" Text="In the past two weeks, has your child..." Font-Bold="true" Font-Underline="true"></asp:Label>
     </td><td></td></tr>
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="ccsm20" databasefield="ccsm20" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="380px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
 
<td style="vertical-align:top"><def:valuesetlabel id="valuesetlabel_ccsm20" runat="server"  databasefield="ccsm20"></def:valuesetlabel></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="ccsm21" databasefield="ccsm21" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="380px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="ccsm22" databasefield="ccsm22" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="380px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="ccsm23" databasefield="ccsm23" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="380px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="ccsm24" databasefield="ccsm24" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="380px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="ccsm25" databasefield="ccsm25" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="380px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 
 </table>
        </td>

        <td style="vertical-align:top">
 
            <br />
            <br />
            <%--SUMMARY SCORES--%>
            <table>
            <tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="ccsm_som" databasefield="ccsm_som"  isreadonly="true" renderreadonlyasdiv="true" fieldlabelwidth="300px" fieldtextboxwidth="40px"></def:datafieldcontrol></td><td></td></tr>
            <tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="ccsm_slp"   DatabaseField="ccsm_slp" isreadonly="true" renderreadonlyasdiv="true" fieldlabelwidth="300px" fieldtextboxwidth="40px"></def:datafieldcontrol></td><td></td></tr>
            <tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="ccsm_inatt" databasefield="ccsm_inatt" isreadonly="true" renderreadonlyasdiv="true" fieldlabelwidth="300px" fieldtextboxwidth="40px"></def:datafieldcontrol></td><td></td></tr>
            <tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="ccsm_dep"   databasefield="ccsm_dep" isreadonly="true" renderreadonlyasdiv="true" fieldlabelwidth="300px" fieldtextboxwidth="40px"></def:datafieldcontrol></td><td></td></tr>
            <tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="ccsm_ang"   databasefield="ccsm_ang" isreadonly="true" renderreadonlyasdiv="true" fieldlabelwidth="300px" fieldtextboxwidth="40px"></def:datafieldcontrol></td><td></td></tr>
            <tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="ccsm_mania" databasefield="ccsm_mania" isreadonly="true" renderreadonlyasdiv="true" fieldlabelwidth="300px" fieldtextboxwidth="40px"></def:datafieldcontrol></td><td></td></tr>
            <tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="ccsm_anx"   databasefield="ccsm_anx" isreadonly="true" renderreadonlyasdiv="true" fieldlabelwidth="300px" fieldtextboxwidth="40px"></def:datafieldcontrol></td><td></td></tr>
            <tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="ccsm_psy"   databasefield="ccsm_psy" isreadonly="true" renderreadonlyasdiv="true" fieldlabelwidth="300px" fieldtextboxwidth="40px"></def:datafieldcontrol></td><td></td></tr>
            <tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="ccsm_rep"   databasefield="ccsm_rep" isreadonly="true" renderreadonlyasdiv="true" fieldlabelwidth="300px" fieldtextboxwidth="40px"></def:datafieldcontrol></td><td></td></tr>
            <tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="ccsm_subuse" databasefield="ccsm_subuse" isreadonly="true" renderreadonlyasdiv="true" fieldlabelwidth="300px" fieldtextboxwidth="40px"></def:datafieldcontrol></td><td></td></tr>
            <tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="ccsm_suic"  databasefield="ccsm_suic"    isreadonly="true" renderreadonlyasdiv="true" fieldlabelwidth="300px" fieldtextboxwidth="40px"></def:datafieldcontrol></td><td></td></tr>
        </table>

        </td>
    </tr>

 
    </table>

<br />
<br />
<br />
<br />


<table>

<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="created" databasefield="created" isreadonly="true" renderreadonlyasdiv="true" fieldlabelwidth="300px"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="createdby" databasefield="createdby" isreadonly="true" renderreadonlyasdiv="true" fieldlabelwidth="300px" fieldtextboxwidth="250px" fieldtextboxmaxlength="50"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="updated" databasefield="updated" isreadonly="true" renderreadonlyasdiv="true" fieldlabelwidth="300px" formatstring="{0:d}" ></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="updatedby" databasefield="updatedby" isreadonly="true" renderreadonlyasdiv="true" fieldlabelwidth="300px" fieldtextboxwidth="250px" fieldtextboxmaxlength="50"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="scored" databasefield="scored" isreadonly="true" renderreadonlyasdiv="true" fieldlabelwidth="300px"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="scoredby" databasefield="scoredby" isreadonly="true" renderreadonlyasdiv="true" fieldlabelwidth="300px" fieldtextboxwidth="250px" fieldtextboxmaxlength="50"></def:datafieldcontrol></td>
<td></td></tr>
 
</table>
</contenttemplate>
<triggers></triggers>
</asp:updatepanel>
</asp:content>
