<%@ Page Language="C#"  MasterPageFile="~/UWAC.master" Title="FII Data Entry" AutoEventWireup="true" CodeFile="FII.aspx.cs" Inherits="DataEntryForms_Common_FII_FII" %>


<%@ Register TagPrefix="def" Namespace="DataEntryFramework3" %>

<asp:content id="content2" contentplaceholderid="obodyplaceholder" runat="server">
<link rel="stylesheet" type="text/css" href="/research/dataentry/dataentryform.css" />
<def:dataentrycontroller id="dataentrycontroller1" runat="server" databasetable="ALL_FII" primarykeyfield="fii_pk">
</def:dataentrycontroller>
   <asp:scriptmanager id="scriptmanager1" runat="server">    </asp:scriptmanager>
<asp:updatepanel id="updatepanel1" runat="server">
  <contenttemplate>
<table>
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="id" databasefield="id" isinsertfield="true" fieldlabelwidth="300px" fieldtextboxwidth="250px" fieldtextboxmaxlength="15"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="indexnum" databasefield="indexnum" isinsertfield="true" fieldtextboxtextdefault="1" fieldlabelwidth="300px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="fii_date" databasefield="fii_date" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="300px" formatstring="{0:d}" ></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="fii_agemo" databasefield="fii_agemo" isreadonly="true" renderreadonlyasdiv="true" fieldlabelwidth="300px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="fii_exmnr" databasefield="fii_exmnr" isentryfield="true" isdoubleentryfield="false" fieldlabelwidth="300px" fieldtextboxwidth="250px" fieldtextboxmaxlength="20"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="fii_resp" databasefield="fii_resp" isentryfield="true" isdoubleentryfield="false" fieldlabelwidth="300px" fieldtextboxwidth="250px" fieldtextboxmaxlength="50"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="fii_cmnt" databasefield="fii_cmnt" isentryfield="true" isdoubleentryfield="false" fieldlabelwidth="300px" fieldtextboxwidth="400px" fieldtextboxheight="40px" fieldtextboxtextmode="multiline" fieldtextboxmaxlength="250"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="fii_scrmsg" databasefield="fii_scrmsg" isreadonly="true" renderreadonlyasdiv="true" fieldlabelwidth="300px" fieldtextboxwidth="400px" fieldtextboxheight="40px" fieldtextboxtextmode="multiline" fieldtextboxmaxlength="250"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="fii01" databasefield="fii01" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="300px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
 
<td style="vertical-align:top"><def:valuesetlabel id="valuesetlabel_fii01" runat="server"  databasefield="fii01"></def:valuesetlabel></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="fii01a" databasefield="fii01a" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="300px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
 
<td style="vertical-align:top"><def:valuesetlabel id="valuesetlabel_fii01a" runat="server"  databasefield="fii01a"></def:valuesetlabel></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="fii02" databasefield="fii02" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="300px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="fii03" databasefield="fii03" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="300px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
 
<td style="vertical-align:top"><def:valuesetlabel id="valuesetlabel_fii03" runat="server"  databasefield="fii03"></def:valuesetlabel></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="fii04" databasefield="fii04" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="300px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="fii05" databasefield="fii05" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="300px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="fii06" databasefield="fii06" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="300px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
 
<td style="vertical-align:top"><def:valuesetlabel id="valuesetlabel_fii06" runat="server"  databasefield="fii06"></def:valuesetlabel></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="fii07" databasefield="fii07" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="300px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="fii08" databasefield="fii08" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="300px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
 
<td style="vertical-align:top"><def:valuesetlabel id="valuesetlabel_fii08" runat="server"  databasefield="fii08"></def:valuesetlabel></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="fii09" databasefield="fii09" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="300px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="fii10" databasefield="fii10" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="300px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
 
<td style="vertical-align:top"><def:valuesetlabel id="valuesetlabel_fii10" runat="server"  databasefield="fii10"></def:valuesetlabel></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="fii11" databasefield="fii11" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="300px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="fii12" databasefield="fii12" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="300px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
 
<td style="vertical-align:top"><def:valuesetlabel id="valuesetlabel_fii12" runat="server"  databasefield="fii12"></def:valuesetlabel></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="fii13" databasefield="fii13" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="300px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
 
<td style="vertical-align:top"><def:valuesetlabel id="valuesetlabel_fii13" runat="server"  databasefield="fii13"></def:valuesetlabel></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="fii13specify" databasefield="fii13specify" isentryfield="true" isdoubleentryfield="false" fieldlabelwidth="300px" fieldtextboxwidth="400px" fieldtextboxheight="40px" fieldtextboxtextmode="multiline" fieldtextboxmaxlength="250"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="fii14" databasefield="fii14" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="300px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
 
<td style="vertical-align:top"><def:valuesetlabel id="valuesetlabel_fii14" runat="server"  databasefield="fii14"></def:valuesetlabel></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="fii14specify" databasefield="fii14specify" isentryfield="true" isdoubleentryfield="false" fieldlabelwidth="300px" fieldtextboxwidth="400px" fieldtextboxheight="40px" fieldtextboxtextmode="multiline" fieldtextboxmaxlength="250"></def:datafieldcontrol></td>
<td></td></tr>


<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="fii15" databasefield="fii15" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="300px" fieldtextboxwidth="200px"></def:datafieldcontrol></td>
 
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="fii15specify" databasefield="fii15specify" isentryfield="true" isdoubleentryfield="false" fieldlabelwidth="300px" fieldtextboxwidth="400px" fieldtextboxheight="40px" fieldtextboxtextmode="multiline" fieldtextboxmaxlength="250"></def:datafieldcontrol></td>
<td></td></tr>

<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="fii16" databasefield="fii16" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="300px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
 
<td></td></tr>


 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="fiinotes" databasefield="fiinotes" isentryfield="true" isdoubleentryfield="false" fieldlabelwidth="300px" fieldtextboxwidth="400px" fieldtextboxheight="40px" fieldtextboxtextmode="multiline" fieldtextboxmaxlength="500"></def:datafieldcontrol></td>
<td></td></tr>
 
<br/><br/><tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="created" databasefield="created" isreadonly="true" renderreadonlyasdiv="true" fieldlabelwidth="300px"></def:datafieldcontrol></td>
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

