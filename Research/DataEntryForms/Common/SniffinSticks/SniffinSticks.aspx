<%@ register tagprefix="def" namespace="DataEntryFramework3" %> 
<%@ page language="c#" masterpagefile="~/UWAC.master"  title="SS data entry" %>
<asp:content id="content1" contentplaceholderid="obodyplaceholder" runat="server">
<link rel="stylesheet" type="text/css" href="/research/dataentry/dataentryform.css" />
<def:dataentrycontroller id="dataentrycontroller1" runat="server" databasetable="ALL_SniffinSticks" primarykeyfield="ss_pk">
</def:dataentrycontroller>
   <asp:scriptmanager id="scriptmanager1" runat="server">    </asp:scriptmanager>
<asp:updatepanel id="updatepanel1" runat="server">
  <contenttemplate>
<table>
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="id" databasefield="id" isinsertfield="true" fieldlabelwidth="300px" fieldtextboxwidth="250px" fieldtextboxmaxlength="15"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="indexnum" databasefield="indexnum" isinsertfield="true" fieldtextboxtextdefault="1" fieldlabelwidth="300px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="ss_agemo" databasefield="ss_agemo" isreadonly="true" renderreadonlyasdiv="true" fieldlabelwidth="300px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="ss_exmnr" databasefield="ss_exmnr" isentryfield="true" isdoubleentryfield="false" fieldlabelwidth="300px" fieldtextboxwidth="250px" fieldtextboxmaxlength="20"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="ss_scrmsg" databasefield="ss_scrmsg" isreadonly="true" renderreadonlyasdiv="true" fieldlabelwidth="300px" fieldtextboxwidth="400px" fieldtextboxheight="40px" fieldtextboxtextmode="multiline" fieldtextboxmaxlength="250"></def:datafieldcontrol></td>
<td></td></tr>
 </table>

      <br />

<table>
    <tr ><td align="center"><b><u>Roses</u></b></td>

        <td  align="center"><b><u>Vanilla</u></b></td>
    </tr>

    <tr>
        <td>
    <table>
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="ss_rdate" databasefield="ss_rdate" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="300px" formatstring="{0:d}" ></def:datafieldcontrol></td><td></td></tr>
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="ss_rosesorder" databasefield="ss_rosesorder" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="300px" fieldtextboxwidth="40px"></def:datafieldcontrol></td><td></td></tr>
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="ss_rosesstart" databasefield="ss_rosesstart" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="300px" fieldtextboxwidth="40px"></def:datafieldcontrol></td><td></td></tr>
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="ss_r01" databasefield="ss_r01" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="300px" fieldtextboxwidth="40px"></def:datafieldcontrol></td><td></td></tr>
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="ss_r02" databasefield="ss_r02" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="300px" fieldtextboxwidth="40px"></def:datafieldcontrol></td><td></td></tr>
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="ss_r03" databasefield="ss_r03" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="300px" fieldtextboxwidth="40px"></def:datafieldcontrol></td><td></td></tr>
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="ss_r04" databasefield="ss_r04" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="300px" fieldtextboxwidth="40px"></def:datafieldcontrol></td><td></td></tr>
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="ss_r05" databasefield="ss_r05" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="300px" fieldtextboxwidth="40px"></def:datafieldcontrol></td><td></td></tr>
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="ss_r06" databasefield="ss_r06" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="300px" fieldtextboxwidth="40px"></def:datafieldcontrol></td><td></td></tr>
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="ss_r07" databasefield="ss_r07" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="300px" fieldtextboxwidth="40px"></def:datafieldcontrol></td><td></td></tr>

<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="ss_rosesfinalscore" databasefield="ss_rosesfinalscore"  isreadonly="true" renderreadonlyasdiv="true" fieldlabelwidth="300px" fieldtextboxwidth="40px"></def:datafieldcontrol></td><td></td></tr>
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="ss_rosesvalidityconcern" databasefield="ss_rosesvalidityconcern" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="300px" fieldtextboxwidth="40px"></def:datafieldcontrol></td><td></td></tr>

<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="ss_rosescmnt" databasefield="ss_rosescmnt" isentryfield="true" isdoubleentryfield="false"  fieldlabelwidth="300px" fieldtextboxwidth="400px" fieldtextboxheight="40px" fieldtextboxtextmode="multiline" fieldtextboxmaxlength="250"></def:datafieldcontrol></td><td></td></tr>


</table>

        </td>

        <td>
            
<table>
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="ss_vdate" databasefield="ss_vdate" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="300px" formatstring="{0:d}" ></def:datafieldcontrol></td><td></td></tr>
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="ss_vanillaorder" databasefield="ss_vanillaorder" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="300px" fieldtextboxwidth="40px"></def:datafieldcontrol></td><td></td></tr>
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="ss_vanillastart" databasefield="ss_vanillastart" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="300px" fieldtextboxwidth="40px"></def:datafieldcontrol></td><td></td></tr>
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="ss_v01" databasefield="ss_v01" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="300px" fieldtextboxwidth="40px"></def:datafieldcontrol></td><td></td></tr>
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="ss_v02" databasefield="ss_v02" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="300px" fieldtextboxwidth="40px"></def:datafieldcontrol></td><td></td></tr> 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="ss_v03" databasefield="ss_v03" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="300px" fieldtextboxwidth="40px"></def:datafieldcontrol></td><td></td></tr>
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="ss_v04" databasefield="ss_v04" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="300px" fieldtextboxwidth="40px"></def:datafieldcontrol></td><td></td></tr>
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="ss_v05" databasefield="ss_v05" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="300px" fieldtextboxwidth="40px"></def:datafieldcontrol></td><td></td></tr>
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="ss_v06" databasefield="ss_v06" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="300px" fieldtextboxwidth="40px"></def:datafieldcontrol></td><td></td></tr>
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="ss_v07" databasefield="ss_v07" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="300px" fieldtextboxwidth="40px"></def:datafieldcontrol></td><td></td></tr>
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="ss_vanillafinalscore" databasefield="ss_vanillafinalscore"  isreadonly="true" renderreadonlyasdiv="true" fieldlabelwidth="300px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="ss_vanillavalidityconcern" databasefield="ss_vanillavalidityconcern" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="300px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 
 <tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="ss_vanillacmnt" databasefield="ss_vanillacmnt" isentryfield="true" isdoubleentryfield="false"  fieldlabelwidth="300px" fieldtextboxwidth="400px" fieldtextboxheight="40px" fieldtextboxtextmode="multiline" fieldtextboxmaxlength="250"></def:datafieldcontrol></td>
<td></td></tr>
 
 </table>

        </td>
    </tr>
 </table>

      <br/><br/>
      <def:datafieldcontrol runat="server" id="ss_smellroom" databasefield="ss_smellroom" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="160px" fieldtextboxwidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="ss_smellroses" databasefield="ss_smellroses" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="160px" fieldtextboxwidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="ss_smellvanilla" databasefield="ss_smellvanilla" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="160px" fieldtextboxwidth="40px"></def:datafieldcontrol>
 

<br/><br/>
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
