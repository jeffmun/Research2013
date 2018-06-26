<%@ register tagprefix="def" namespace="DataEntryFramework3" %> 
<%@ page language="c#" masterpagefile="~/UWAC.master"  title="KSADS data entry" %>
<asp:content id="content1" contentplaceholderid="obodyplaceholder" runat="server">
<link rel="stylesheet" type="text/css" href="/research/dataentry/dataentryform.css" />
<def:dataentrycontroller id="dataentrycontroller1" runat="server" databasetable="ALL_KSADS" primarykeyfield="ksads_pk">
</def:dataentrycontroller>
   <asp:scriptmanager id="scriptmanager1" runat="server">    </asp:scriptmanager>
<asp:updatepanel id="updatepanel1" runat="server">
  <contenttemplate>
<table>
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="id" databasefield="id" isinsertfield="true" fieldlabelwidth="300px" fieldtextboxwidth="250px" fieldtextboxmaxlength="15"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="indexnum" databasefield="indexnum" isinsertfield="true" fieldtextboxtextdefault="1" fieldlabelwidth="300px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="ksads_date" databasefield="ksads_date" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="300px" formatstring="{0:d}" ></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="ksads_agemo" databasefield="ksads_agemo" isreadonly="true" renderreadonlyasdiv="true" fieldlabelwidth="300px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="ksads_exmnr" databasefield="ksads_exmnr" isentryfield="true" isdoubleentryfield="false" fieldlabelwidth="300px" fieldtextboxwidth="250px" fieldtextboxmaxlength="20"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="ksads_resp" databasefield="ksads_resp" isentryfield="true" isdoubleentryfield="false" fieldlabelwidth="300px" fieldtextboxwidth="250px" fieldtextboxmaxlength="50"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="ksads_cmnt" databasefield="ksads_cmnt" isentryfield="true" isdoubleentryfield="false" fieldlabelwidth="300px" fieldtextboxwidth="460px" fieldtextboxheight="40px" fieldtextboxtextmode="multiline" fieldtextboxmaxlength="250"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="ksads_scrmsg" databasefield="ksads_scrmsg" isreadonly="true" renderreadonlyasdiv="true" fieldlabelwidth="300px" fieldtextboxwidth="460px" fieldtextboxheight="40px" fieldtextboxtextmode="multiline" fieldtextboxmaxlength="250"></def:datafieldcontrol></td>
<td></td></tr>
	</table>


<table>
	<tr><td align="right"><b><u>P</u>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</b></td><td align="right"><b><u>C</u>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</b></td><td align="right"><b><u>S</u>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</b></td></tr>

<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="depr_1p" databasefield="depr_1p" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="460px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
 <td style="vertical-align:top"><def:datafieldcontrol runat="server" id="depr_1c" databasefield="depr_1c" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="32px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
 <td style="vertical-align:top"><def:datafieldcontrol runat="server" id="depr_1s" databasefield="depr_1s" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="32px" fieldtextboxwidth="40px"></def:datafieldcontrol></td></tr>

	<tr>
 <td style="vertical-align:top"><def:datafieldcontrol runat="server" id="depr_1p_past" databasefield="depr_1p_past" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="460px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
 <td style="vertical-align:top"><def:datafieldcontrol runat="server" id="depr_1c_past" databasefield="depr_1c_past" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="32px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
 <td style="vertical-align:top"><def:datafieldcontrol runat="server" id="depr_1s_past" databasefield="depr_1s_past" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="32px" fieldtextboxwidth="40px"></def:datafieldcontrol></td></tr>

<tr><td style="vertical-align:top" colspan="3"><def:datafieldcontrol runat="server" id="depr_1dc" databasefield="depr_1dc" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="460px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>

<tr><td style="vertical-align:top" colspan="3"><def:datafieldcontrol runat="server" id="depr_1dmsp" databasefield="depr_1dmsp" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="460px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>

<tr><td><br/></td/></tr>
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="depr_2p" databasefield="depr_2p" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="460px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
 <td style="vertical-align:top"><def:datafieldcontrol runat="server" id="depr_2c" databasefield="depr_2c" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="32px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
 <td style="vertical-align:top"><def:datafieldcontrol runat="server" id="depr_2s" databasefield="depr_2s" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="32px" fieldtextboxwidth="40px"></def:datafieldcontrol></td></tr>

 <tr>
 <td style="vertical-align:top"><def:datafieldcontrol runat="server" id="depr_2p_past" databasefield="depr_2p_past" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="460px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
 <td style="vertical-align:top"><def:datafieldcontrol runat="server" id="depr_2c_past" databasefield="depr_2c_past" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="32px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
 <td style="vertical-align:top"><def:datafieldcontrol runat="server" id="depr_2s_past" databasefield="depr_2s_past" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="32px" fieldtextboxwidth="40px"></def:datafieldcontrol></td></tr>

<tr><td style="vertical-align:top" colspan="3"><def:datafieldcontrol runat="server" id="depr_2dc" databasefield="depr_2dc" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="460px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>

<tr><td style="vertical-align:top" colspan="3"><def:datafieldcontrol runat="server" id="depr_2dmsp" databasefield="depr_2dmsp" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="460px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>

<tr><td><br/></td/></tr>
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="depr_3p" databasefield="depr_3p" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="460px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
 <td style="vertical-align:top"><def:datafieldcontrol runat="server" id="depr_3c" databasefield="depr_3c" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="32px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
 <td style="vertical-align:top"><def:datafieldcontrol runat="server" id="depr_3s" databasefield="depr_3s" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="32px" fieldtextboxwidth="40px"></def:datafieldcontrol></td></tr>

	<tr>
 <td style="vertical-align:top"><def:datafieldcontrol runat="server" id="depr_3p_past" databasefield="depr_3p_past" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="460px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
 <td style="vertical-align:top"><def:datafieldcontrol runat="server" id="depr_3c_past" databasefield="depr_3c_past" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="32px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
 <td style="vertical-align:top"><def:datafieldcontrol runat="server" id="depr_3s_past" databasefield="depr_3s_past" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="32px" fieldtextboxwidth="40px"></def:datafieldcontrol></td></tr>

<tr><td style="vertical-align:top" colspan="3"><def:datafieldcontrol runat="server" id="depr_3dc" databasefield="depr_3dc" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="460px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>

<tr><td style="vertical-align:top" colspan="3"><def:datafieldcontrol runat="server" id="depr_3d" databasefield="depr_3d" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="460px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>

<tr><td><br/></td/></tr>
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="suic_4ap" databasefield="suic_4ap" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="460px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
 <td style="vertical-align:top"><def:datafieldcontrol runat="server" id="suic_4ac" databasefield="suic_4ac" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="32px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
 <td style="vertical-align:top"><def:datafieldcontrol runat="server" id="suic_4as" databasefield="suic_4as" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="32px" fieldtextboxwidth="40px"></def:datafieldcontrol></td></tr>

    	 <tr>
 <td style="vertical-align:top"><def:datafieldcontrol runat="server" id="suic_4ap_past" databasefield="suic_4ap_past" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="460px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
 <td style="vertical-align:top"><def:datafieldcontrol runat="server" id="suic_4ac_past" databasefield="suic_4ac_past" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="32px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
 <td style="vertical-align:top"><def:datafieldcontrol runat="server" id="suic_4as_past" databasefield="suic_4as_past" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="32px" fieldtextboxwidth="40px"></def:datafieldcontrol></td></tr>

<tr><td><br/></td/></tr>
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="suic_4bp" databasefield="suic_4bp" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="460px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
 <td style="vertical-align:top"><def:datafieldcontrol runat="server" id="suic_4bc" databasefield="suic_4bc" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="32px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
 <td style="vertical-align:top"><def:datafieldcontrol runat="server" id="suic_4bs" databasefield="suic_4bs" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="32px" fieldtextboxwidth="40px"></def:datafieldcontrol></td></tr>

    <tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="suic_4bp_past" databasefield="suic_4bp_past" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="460px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
    <td style="vertical-align:top"><def:datafieldcontrol runat="server" id="suic_4bc_past" databasefield="suic_4bc_past" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="32px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
    <td style="vertical-align:top"><def:datafieldcontrol runat="server" id="suic_4bs_past" databasefield="suic_4bs_past" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="32px" fieldtextboxwidth="40px"></def:datafieldcontrol></td></tr>

<tr><td><br/></td/></tr>
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="suic_4cp" databasefield="suic_4cp" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="460px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
 <td style="vertical-align:top"><def:datafieldcontrol runat="server" id="suic_4cc" databasefield="suic_4cc" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="32px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
 <td style="vertical-align:top"><def:datafieldcontrol runat="server" id="suic_4cs" databasefield="suic_4cs" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="32px" fieldtextboxwidth="40px"></def:datafieldcontrol></td></tr>

    <tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="suic_4cp_past" databasefield="suic_4cp_past" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="460px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
    <td style="vertical-align:top"><def:datafieldcontrol runat="server" id="suic_4cc_past" databasefield="suic_4cc_past" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="32px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
    <td style="vertical-align:top"><def:datafieldcontrol runat="server" id="suic_4cs_past" databasefield="suic_4cs_past" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="32px" fieldtextboxwidth="40px"></def:datafieldcontrol></td></tr>


<tr><td style="vertical-align:top" colspan="3"><def:datafieldcontrol runat="server" id="suic_4c_numattepmts" databasefield="suic_4c_numattepmts" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="460px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>

<tr><td><br/></td/></tr>
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="suic_4dp" databasefield="suic_4dp" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="460px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
 <td style="vertical-align:top"><def:datafieldcontrol runat="server" id="suic_4dc" databasefield="suic_4dc" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="32px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
 <td style="vertical-align:top"><def:datafieldcontrol runat="server" id="suic_4ds" databasefield="suic_4ds" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="32px" fieldtextboxwidth="40px"></def:datafieldcontrol></td></tr>
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="suic_4dp_past" databasefield="suic_4dp_past" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="460px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
    <td style="vertical-align:top"><def:datafieldcontrol runat="server" id="suic_4dc_past" databasefield="suic_4dc_past" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="32px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
    <td style="vertical-align:top"><def:datafieldcontrol runat="server" id="suic_4ds_past" databasefield="suic_4ds_past" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="32px" fieldtextboxwidth="40px"></def:datafieldcontrol></td></tr>

<tr><td><br/></td/></tr>
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="suic_4ep" databasefield="suic_4ep" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="460px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
 <td style="vertical-align:top"><def:datafieldcontrol runat="server" id="suic_4ec" databasefield="suic_4ec" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="32px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
 <td style="vertical-align:top"><def:datafieldcontrol runat="server" id="suic_4es" databasefield="suic_4es" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="32px" fieldtextboxwidth="40px"></def:datafieldcontrol></td></tr>
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="suic_4ep_past" databasefield="suic_4ep_past" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="460px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
    <td style="vertical-align:top"><def:datafieldcontrol runat="server" id="suic_4ec_past" databasefield="suic_4ec_past" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="32px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
    <td style="vertical-align:top"><def:datafieldcontrol runat="server" id="suic_4es_past" databasefield="suic_4es_past" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="32px" fieldtextboxwidth="40px"></def:datafieldcontrol></td></tr>

<tr><td><br/></td/></tr>
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="mani_1p" databasefield="mani_1p" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="460px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
 <td style="vertical-align:top"><def:datafieldcontrol runat="server" id="mani_1c" databasefield="mani_1c" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="32px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
 <td style="vertical-align:top"><def:datafieldcontrol runat="server" id="mani_1s" databasefield="mani_1s" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="32px" fieldtextboxwidth="40px"></def:datafieldcontrol></td></tr>
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="mani_1p_past" databasefield="mani_1p_past" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="460px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
    <td style="vertical-align:top"><def:datafieldcontrol runat="server" id="mani_1c_past" databasefield="mani_1c_past" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="32px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
    <td style="vertical-align:top"><def:datafieldcontrol runat="server" id="mani_1s_past" databasefield="mani_1s_past" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="32px" fieldtextboxwidth="40px"></def:datafieldcontrol></td></tr>

<tr><td><br/></td/></tr>
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="mani_2p" databasefield="mani_2p" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="460px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
 <td style="vertical-align:top"><def:datafieldcontrol runat="server" id="mani_2c" databasefield="mani_2c" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="32px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
 <td style="vertical-align:top"><def:datafieldcontrol runat="server" id="mani_2s" databasefield="mani_2s" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="32px" fieldtextboxwidth="40px"></def:datafieldcontrol></td></tr>
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="mani_2p_past" databasefield="mani_2p_past" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="460px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
    <td style="vertical-align:top"><def:datafieldcontrol runat="server" id="mani_2c_past" databasefield="mani_2c_past" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="32px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
    <td style="vertical-align:top"><def:datafieldcontrol runat="server" id="mani_2s_past" databasefield="mani_2s_past" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="32px" fieldtextboxwidth="40px"></def:datafieldcontrol></td></tr>

<tr><td><br/></td/></tr>
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="mani_3p" databasefield="mani_3p" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="460px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
 <td style="vertical-align:top"><def:datafieldcontrol runat="server" id="mani_3c" databasefield="mani_3c" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="32px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
 <td style="vertical-align:top"><def:datafieldcontrol runat="server" id="mani_3s" databasefield="mani_3s" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="32px" fieldtextboxwidth="40px"></def:datafieldcontrol></td></tr>
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="mani_3p_past" databasefield="mani_3p_past" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="460px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
    <td style="vertical-align:top"><def:datafieldcontrol runat="server" id="mani_3c_past" databasefield="mani_3c_past" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="32px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
    <td style="vertical-align:top"><def:datafieldcontrol runat="server" id="mani_3s_past" databasefield="mani_3s_past" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="32px" fieldtextboxwidth="40px"></def:datafieldcontrol></td></tr>

<tr><td><br/></td/></tr>
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="mani_4p" databasefield="mani_4p" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="460px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
 <td style="vertical-align:top"><def:datafieldcontrol runat="server" id="mani_4c" databasefield="mani_4c" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="32px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
 <td style="vertical-align:top"><def:datafieldcontrol runat="server" id="mani_4s" databasefield="mani_4s" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="32px" fieldtextboxwidth="40px"></def:datafieldcontrol></td></tr>
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="mani_4p_past" databasefield="mani_4p_past" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="460px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
    <td style="vertical-align:top"><def:datafieldcontrol runat="server" id="mani_4c_past" databasefield="mani_4c_past" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="32px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
    <td style="vertical-align:top"><def:datafieldcontrol runat="server" id="mani_4s_past" databasefield="mani_4s_past" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="32px" fieldtextboxwidth="40px"></def:datafieldcontrol></td></tr>

<tr><td><br/></td/></tr>
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="mani_5p" databasefield="mani_5p" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="460px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
 <td style="vertical-align:top"><def:datafieldcontrol runat="server" id="mani_5c" databasefield="mani_5c" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="32px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
 <td style="vertical-align:top"><def:datafieldcontrol runat="server" id="mani_5s" databasefield="mani_5s" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="32px" fieldtextboxwidth="40px"></def:datafieldcontrol></td></tr>
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="mani_5p_past" databasefield="mani_5p_past" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="460px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
    <td style="vertical-align:top"><def:datafieldcontrol runat="server" id="mani_5c_past" databasefield="mani_5c_past" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="32px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
    <td style="vertical-align:top"><def:datafieldcontrol runat="server" id="mani_5s_past" databasefield="mani_5s_past" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="32px" fieldtextboxwidth="40px"></def:datafieldcontrol></td></tr>

<tr><td><br/></td/></tr>
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="dmrd_1p" databasefield="dmrd_1p" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="460px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
 <td style="vertical-align:top"><def:datafieldcontrol runat="server" id="dmrd_1c" databasefield="dmrd_1c" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="32px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
 <td style="vertical-align:top"><def:datafieldcontrol runat="server" id="dmrd_1s" databasefield="dmrd_1s" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="32px" fieldtextboxwidth="40px"></def:datafieldcontrol></td></tr>

<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="dmrd_1p_past" databasefield="dmrd_1p_past" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="460px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
    <td style="vertical-align:top"><def:datafieldcontrol runat="server" id="dmrd_1c_past" databasefield="dmrd_1c_past" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="32px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
    <td style="vertical-align:top"><def:datafieldcontrol runat="server" id="dmrd_1s_past" databasefield="dmrd_1s_past" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="32px" fieldtextboxwidth="40px"></def:datafieldcontrol></td></tr>


<tr><td><br/></td/></tr>
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="dmrd_2p" databasefield="dmrd_2p" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="460px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
 <td style="vertical-align:top"><def:datafieldcontrol runat="server" id="dmrd_2c" databasefield="dmrd_2c" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="32px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
 <td style="vertical-align:top"><def:datafieldcontrol runat="server" id="dmrd_2s" databasefield="dmrd_2s" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="32px" fieldtextboxwidth="40px"></def:datafieldcontrol></td></tr>
    <tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="dmrd_2p_past" databasefield="dmrd_2p_past" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="460px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
    <td style="vertical-align:top"><def:datafieldcontrol runat="server" id="dmrd_2c_past" databasefield="dmrd_2c_past" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="32px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
    <td style="vertical-align:top"><def:datafieldcontrol runat="server" id="dmrd_2s_past" databasefield="dmrd_2s_past" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="32px" fieldtextboxwidth="40px"></def:datafieldcontrol></td></tr>

<tr><td><br/></td/></tr>
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="psyc_1p" databasefield="psyc_1p" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="460px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
 <td style="vertical-align:top"><def:datafieldcontrol runat="server" id="psyc_1c" databasefield="psyc_1c" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="32px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
 <td style="vertical-align:top"><def:datafieldcontrol runat="server" id="psyc_1s" databasefield="psyc_1s" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="32px" fieldtextboxwidth="40px"></def:datafieldcontrol></td></tr>
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="psyc_1p_past" databasefield="psyc_1p_past" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="460px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
    <td style="vertical-align:top"><def:datafieldcontrol runat="server" id="psyc_1c_past" databasefield="psyc_1c_past" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="32px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
    <td style="vertical-align:top"><def:datafieldcontrol runat="server" id="psyc_1s_past" databasefield="psyc_1s_past" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="32px" fieldtextboxwidth="40px"></def:datafieldcontrol></td></tr>

<tr><td><br/></td/></tr>
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="psyc_2p" databasefield="psyc_2p" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="460px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
 <td style="vertical-align:top"><def:datafieldcontrol runat="server" id="psyc_2c" databasefield="psyc_2c" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="32px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
 <td style="vertical-align:top"><def:datafieldcontrol runat="server" id="psyc_2s" databasefield="psyc_2s" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="32px" fieldtextboxwidth="40px"></def:datafieldcontrol></td></tr>
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="psyc_2p_past" databasefield="psyc_2p_past" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="460px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
    <td style="vertical-align:top"><def:datafieldcontrol runat="server" id="psyc_2c_past" databasefield="psyc_2c_past" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="32px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
    <td style="vertical-align:top"><def:datafieldcontrol runat="server" id="psyc_2s_past" databasefield="psyc_2s_past" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="32px" fieldtextboxwidth="40px"></def:datafieldcontrol></td></tr>

<tr><td><br/></td/></tr>
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="pani_1p" databasefield="pani_1p" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="460px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
 <td style="vertical-align:top"><def:datafieldcontrol runat="server" id="pani_1c" databasefield="pani_1c" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="32px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
 <td style="vertical-align:top"><def:datafieldcontrol runat="server" id="pani_1s" databasefield="pani_1s" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="32px" fieldtextboxwidth="40px"></def:datafieldcontrol></td></tr>
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="pani_1p_past" databasefield="pani_1p_past" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="460px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
    <td style="vertical-align:top"><def:datafieldcontrol runat="server" id="pani_1c_past" databasefield="pani_1c_past" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="32px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
    <td style="vertical-align:top"><def:datafieldcontrol runat="server" id="pani_1s_past" databasefield="pani_1s_past" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="32px" fieldtextboxwidth="40px"></def:datafieldcontrol></td></tr>

<tr><td><br/></td/></tr>
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="agor_1p" databasefield="agor_1p" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="460px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
 <td style="vertical-align:top"><def:datafieldcontrol runat="server" id="agor_1c" databasefield="agor_1c" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="32px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
 <td style="vertical-align:top"><def:datafieldcontrol runat="server" id="agor_1s" databasefield="agor_1s" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="32px" fieldtextboxwidth="40px"></def:datafieldcontrol></td></tr>
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="agor_1p_past" databasefield="agor_1p_past" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="460px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
    <td style="vertical-align:top"><def:datafieldcontrol runat="server" id="agor_1c_past" databasefield="agor_1c_past" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="32px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
    <td style="vertical-align:top"><def:datafieldcontrol runat="server" id="agor_1s_past" databasefield="agor_1s_past" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="32px" fieldtextboxwidth="40px"></def:datafieldcontrol></td></tr>

<tr><td><br/></td/></tr>
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="agor_2p" databasefield="agor_2p" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="460px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
 <td style="vertical-align:top"><def:datafieldcontrol runat="server" id="agor_2c" databasefield="agor_2c" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="32px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
 <td style="vertical-align:top"><def:datafieldcontrol runat="server" id="agor_2s" databasefield="agor_2s" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="32px" fieldtextboxwidth="40px"></def:datafieldcontrol></td></tr>
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="agor_2p_past" databasefield="agor_2p_past" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="460px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
    <td style="vertical-align:top"><def:datafieldcontrol runat="server" id="agor_2c_past" databasefield="agor_2c_past" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="32px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
    <td style="vertical-align:top"><def:datafieldcontrol runat="server" id="agor_2s_past" databasefield="agor_2s_past" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="32px" fieldtextboxwidth="40px"></def:datafieldcontrol></td></tr>

<tr><td><br/></td/></tr>
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="sepa_1p" databasefield="sepa_1p" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="460px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
 <td style="vertical-align:top"><def:datafieldcontrol runat="server" id="sepa_1c" databasefield="sepa_1c" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="32px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
 <td style="vertical-align:top"><def:datafieldcontrol runat="server" id="sepa_1s" databasefield="sepa_1s" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="32px" fieldtextboxwidth="40px"></def:datafieldcontrol></td></tr>
    <tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="sepa_1p_past" databasefield="sepa_1p_past" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="460px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
    <td style="vertical-align:top"><def:datafieldcontrol runat="server" id="sepa_1c_past" databasefield="sepa_1c_past" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="32px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
    <td style="vertical-align:top"><def:datafieldcontrol runat="server" id="sepa_1s_past" databasefield="sepa_1s_past" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="32px" fieldtextboxwidth="40px"></def:datafieldcontrol></td></tr>

<tr><td><br/></td/></tr>
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="sepa_2p" databasefield="sepa_2p" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="460px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
 <td style="vertical-align:top"><def:datafieldcontrol runat="server" id="sepa_2c" databasefield="sepa_2c" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="32px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
 <td style="vertical-align:top"><def:datafieldcontrol runat="server" id="sepa_2s" databasefield="sepa_2s" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="32px" fieldtextboxwidth="40px"></def:datafieldcontrol></td></tr>
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="sepa_2p_past" databasefield="sepa_2p_past" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="460px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
    <td style="vertical-align:top"><def:datafieldcontrol runat="server" id="sepa_2c_past" databasefield="sepa_2c_past" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="32px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
    <td style="vertical-align:top"><def:datafieldcontrol runat="server" id="sepa_2s_past" databasefield="sepa_2s_past" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="32px" fieldtextboxwidth="40px"></def:datafieldcontrol></td></tr>

<tr><td><br/></td/></tr>
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="sepa_3p" databasefield="sepa_3p" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="460px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
 <td style="vertical-align:top"><def:datafieldcontrol runat="server" id="sepa_3c" databasefield="sepa_3c" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="32px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
 <td style="vertical-align:top"><def:datafieldcontrol runat="server" id="sepa_3s" databasefield="sepa_3s" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="32px" fieldtextboxwidth="40px"></def:datafieldcontrol></td></tr>
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="sepa_3p_past" databasefield="sepa_3p_past" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="460px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
    <td style="vertical-align:top"><def:datafieldcontrol runat="server" id="sepa_3c_past" databasefield="sepa_3c_past" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="32px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
    <td style="vertical-align:top"><def:datafieldcontrol runat="server" id="sepa_3s_past" databasefield="sepa_3s_past" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="32px" fieldtextboxwidth="40px"></def:datafieldcontrol></td></tr>

<tr><td><br/></td/></tr>
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="sepa_4p" databasefield="sepa_4p" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="460px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
 <td style="vertical-align:top"><def:datafieldcontrol runat="server" id="sepa_4c" databasefield="sepa_4c" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="32px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
 <td style="vertical-align:top"><def:datafieldcontrol runat="server" id="sepa_4s" databasefield="sepa_4s" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="32px" fieldtextboxwidth="40px"></def:datafieldcontrol></td></tr>
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="sepa_4p_past" databasefield="sepa_4p_past" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="460px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
    <td style="vertical-align:top"><def:datafieldcontrol runat="server" id="sepa_4c_past" databasefield="sepa_4c_past" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="32px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
    <td style="vertical-align:top"><def:datafieldcontrol runat="server" id="sepa_4s_past" databasefield="sepa_4s_past" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="32px" fieldtextboxwidth="40px"></def:datafieldcontrol></td></tr>

<tr><td><br/></td/></tr>
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="sepa_5p" databasefield="sepa_5p" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="460px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
 <td style="vertical-align:top"><def:datafieldcontrol runat="server" id="sepa_5c" databasefield="sepa_5c" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="32px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
 <td style="vertical-align:top"><def:datafieldcontrol runat="server" id="sepa_5s" databasefield="sepa_5s" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="32px" fieldtextboxwidth="40px"></def:datafieldcontrol></td></tr>
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="sepa_5p_past" databasefield="sepa_5p_past" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="460px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
    <td style="vertical-align:top"><def:datafieldcontrol runat="server" id="sepa_5c_past" databasefield="sepa_5c_past" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="32px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
    <td style="vertical-align:top"><def:datafieldcontrol runat="server" id="sepa_5s_past" databasefield="sepa_5s_past" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="32px" fieldtextboxwidth="40px"></def:datafieldcontrol></td></tr>

<tr><td><br/></td/></tr>
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="sanx_1p" databasefield="sanx_1p" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="460px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
 <td style="vertical-align:top"><def:datafieldcontrol runat="server" id="sanx_1c" databasefield="sanx_1c" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="32px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
 <td style="vertical-align:top"><def:datafieldcontrol runat="server" id="sanx_1s" databasefield="sanx_1s" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="32px" fieldtextboxwidth="40px"></def:datafieldcontrol></td></tr>
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="sanx_1p_past" databasefield="sanx_1p_past" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="460px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
    <td style="vertical-align:top"><def:datafieldcontrol runat="server" id="sanx_1c_past" databasefield="sanx_1c_past" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="32px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
    <td style="vertical-align:top"><def:datafieldcontrol runat="server" id="sanx_1s_past" databasefield="sanx_1s_past" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="32px" fieldtextboxwidth="40px"></def:datafieldcontrol></td></tr>

<tr><td><br/></td/></tr>
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="sanx_2p" databasefield="sanx_2p" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="460px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
 <td style="vertical-align:top"><def:datafieldcontrol runat="server" id="sanx_2c" databasefield="sanx_2c" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="32px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
 <td style="vertical-align:top"><def:datafieldcontrol runat="server" id="sanx_2s" databasefield="sanx_2s" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="32px" fieldtextboxwidth="40px"></def:datafieldcontrol></td></tr>
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="sanx_2p_past" databasefield="sanx_2p_past" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="460px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
    <td style="vertical-align:top"><def:datafieldcontrol runat="server" id="sanx_2c_past" databasefield="sanx_2c_past" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="32px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
    <td style="vertical-align:top"><def:datafieldcontrol runat="server" id="sanx_2s_past" databasefield="sanx_2s_past" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="32px" fieldtextboxwidth="40px"></def:datafieldcontrol></td></tr>

<tr><td><br/></td/></tr>
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="phob_1p" databasefield="phob_1p" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="460px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
 <td style="vertical-align:top"><def:datafieldcontrol runat="server" id="phob_1c" databasefield="phob_1c" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="32px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
 <td style="vertical-align:top"><def:datafieldcontrol runat="server" id="phob_1s" databasefield="phob_1s" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="32px" fieldtextboxwidth="40px"></def:datafieldcontrol></td></tr>
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="phob_1p_past" databasefield="phob_1p_past" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="460px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
    <td style="vertical-align:top"><def:datafieldcontrol runat="server" id="phob_1c_past" databasefield="phob_1c_past" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="32px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
    <td style="vertical-align:top"><def:datafieldcontrol runat="server" id="phob_1s_past" databasefield="phob_1s_past" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="32px" fieldtextboxwidth="40px"></def:datafieldcontrol></td></tr>

<tr><td><br/></td/></tr>
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="phob_2p" databasefield="phob_2p" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="460px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
 <td style="vertical-align:top"><def:datafieldcontrol runat="server" id="phob_2c" databasefield="phob_2c" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="32px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
 <td style="vertical-align:top"><def:datafieldcontrol runat="server" id="phob_2s" databasefield="phob_2s" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="32px" fieldtextboxwidth="40px"></def:datafieldcontrol></td></tr>
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="phob_2p_past" databasefield="phob_2p_past" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="460px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
    <td style="vertical-align:top"><def:datafieldcontrol runat="server" id="phob_2c_past" databasefield="phob_2c_past" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="32px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
    <td style="vertical-align:top"><def:datafieldcontrol runat="server" id="phob_2s_past" databasefield="phob_2s_past" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="32px" fieldtextboxwidth="40px"></def:datafieldcontrol></td></tr>

<tr><td style="vertical-align:top" colspan="3"><def:datafieldcontrol runat="server" id="phob_mostintense_specify" databasefield="phob_mostintense_specify" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="460px" fieldtextboxwidth="250px"></def:datafieldcontrol></td>

<tr><td style="vertical-align:top" colspan="3"><def:datafieldcontrol runat="server" id="phob_other_specify" databasefield="phob_other_specify" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="460px" fieldtextboxwidth="250px"></def:datafieldcontrol></td>

<tr><td><br/></td/></tr>
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="ganx_1p" databasefield="ganx_1p" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="460px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
 <td style="vertical-align:top"><def:datafieldcontrol runat="server" id="ganx_1c" databasefield="ganx_1c" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="32px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
 <td style="vertical-align:top"><def:datafieldcontrol runat="server" id="ganx_1s" databasefield="ganx_1s" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="32px" fieldtextboxwidth="40px"></def:datafieldcontrol></td></tr>
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="ganx_1p_past" databasefield="ganx_1p_past" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="460px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
    <td style="vertical-align:top"><def:datafieldcontrol runat="server" id="ganx_1c_past" databasefield="ganx_1c_past" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="32px" fieldtextboxwidth="40px"></def:datafieldcontrol></td> 
    <td style="vertical-align:top"><def:datafieldcontrol runat="server" id="ganx_1s_past" databasefield="ganx_1s_past" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="32px" fieldtextboxwidth="40px"></def:datafieldcontrol></td></tr>

<tr><td><br/></td/></tr>
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="ganx_2p" databasefield="ganx_2p" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="460px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
 <td style="vertical-align:top"><def:datafieldcontrol runat="server" id="ganx_2c" databasefield="ganx_2c" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="32px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
 <td style="vertical-align:top"><def:datafieldcontrol runat="server" id="ganx_2s" databasefield="ganx_2s" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="32px" fieldtextboxwidth="40px"></def:datafieldcontrol></td></tr>
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="ganx_2p_past" databasefield="ganx_2p_past" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="460px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
    <td style="vertical-align:top"><def:datafieldcontrol runat="server" id="ganx_2c_past" databasefield="ganx_2c_past" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="32px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
    <td style="vertical-align:top"><def:datafieldcontrol runat="server" id="ganx_2s_past" databasefield="ganx_2s_past" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="32px" fieldtextboxwidth="40px"></def:datafieldcontrol></td></tr>

<tr><td><br/></td/></tr>
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="ocd__1p" databasefield="ocd__1p" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="460px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
 <td style="vertical-align:top"><def:datafieldcontrol runat="server" id="ocd__1c" databasefield="ocd__1c" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="32px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
 <td style="vertical-align:top"><def:datafieldcontrol runat="server" id="ocd__1s" databasefield="ocd__1s" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="32px" fieldtextboxwidth="40px"></def:datafieldcontrol></td></tr>
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="ocd__1p_past" databasefield="ocd__1p_past" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="460px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
    <td style="vertical-align:top"><def:datafieldcontrol runat="server" id="ocd__1c_past" databasefield="ocd__1c_past" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="32px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
    <td style="vertical-align:top"><def:datafieldcontrol runat="server" id="ocd__1s_past" databasefield="ocd__1s_past" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="32px" fieldtextboxwidth="40px"></def:datafieldcontrol></td></tr> 

<tr><td><br/></td/></tr>
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="ocd__2p" databasefield="ocd__2p" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="460px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
 <td style="vertical-align:top"><def:datafieldcontrol runat="server" id="ocd__2c" databasefield="ocd__2c" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="32px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
 <td style="vertical-align:top"><def:datafieldcontrol runat="server" id="ocd__2s" databasefield="ocd__2s" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="32px" fieldtextboxwidth="40px"></def:datafieldcontrol></td></tr>
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="ocd__2p_past" databasefield="ocd__2p_past" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="460px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
    <td style="vertical-align:top"><def:datafieldcontrol runat="server" id="ocd__2c_past" databasefield="ocd__2c_past" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="32px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
    <td style="vertical-align:top"><def:datafieldcontrol runat="server" id="ocd__2s_past" databasefield="ocd__2s_past" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="32px" fieldtextboxwidth="40px"></def:datafieldcontrol></td></tr>


</table>
<br /><br /><br />

<table>
<tr><td align="right"><b><u>P</u>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</b></td><td align="right"><b><u>C</u>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</b></td><td align="right"><b><u>S</u>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</b></td></tr>

<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="enur_1ap" databasefield="enur_1ap" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="460px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
 <td style="vertical-align:top"><def:datafieldcontrol runat="server" id="enur_1ac" databasefield="enur_1ac" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="32px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
 <td style="vertical-align:top"><def:datafieldcontrol runat="server" id="enur_1as" databasefield="enur_1as" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="32px" fieldtextboxwidth="40px"></def:datafieldcontrol></td></tr>
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="enur_1ap_past" databasefield="enur_1ap_past" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="460px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
    <td style="vertical-align:top"><def:datafieldcontrol runat="server" id="enur_1ac_past" databasefield="enur_1ac_past" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="32px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
    <td style="vertical-align:top"><def:datafieldcontrol runat="server" id="enur_1as_past" databasefield="enur_1as_past" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="32px" fieldtextboxwidth="40px"></def:datafieldcontrol></td></tr>

<tr><td><br/></td/></tr>
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="enur_1bp" databasefield="enur_1bp" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="460px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
 <td style="vertical-align:top"><def:datafieldcontrol runat="server" id="enur_1bc" databasefield="enur_1bc" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="32px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
 <td style="vertical-align:top"><def:datafieldcontrol runat="server" id="enur_1bs" databasefield="enur_1bs" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="32px" fieldtextboxwidth="40px"></def:datafieldcontrol></td></tr>
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="enur_1bp_past" databasefield="enur_1bp_past" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="460px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
    <td style="vertical-align:top"><def:datafieldcontrol runat="server" id="enur_1bc_past" databasefield="enur_1bc_past" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="32px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
    <td style="vertical-align:top"><def:datafieldcontrol runat="server" id="enur_1bs_past" databasefield="enur_1bs_past" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="32px" fieldtextboxwidth="40px"></def:datafieldcontrol></td></tr>

<tr><td><br/></td/></tr>
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="enur_1cp" databasefield="enur_1cp" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="460px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
 <td style="vertical-align:top"><def:datafieldcontrol runat="server" id="enur_1cc" databasefield="enur_1cc" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="32px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
 <td style="vertical-align:top"><def:datafieldcontrol runat="server" id="enur_1cs" databasefield="enur_1cs" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="32px" fieldtextboxwidth="40px"></def:datafieldcontrol></td></tr>
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="enur_1cp_past" databasefield="enur_1cp_past" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="460px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
    <td style="vertical-align:top"><def:datafieldcontrol runat="server" id="enur_1cc_past" databasefield="enur_1cc_past" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="32px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
    <td style="vertical-align:top"><def:datafieldcontrol runat="server" id="enur_1cs_past" databasefield="enur_1cs_past" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="32px" fieldtextboxwidth="40px"></def:datafieldcontrol></td></tr>


<tr><td style="vertical-align:top" colspan="3"><def:datafieldcontrol runat="server" id="enur_react" databasefield="enur_react" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="460px" fieldtextboxwidth="250px"></def:datafieldcontrol></td>

<tr><td style="vertical-align:top" colspan="3"><def:datafieldcontrol runat="server" id="enur_impair" databasefield="enur_impair" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="460px" fieldtextboxwidth="250px"></def:datafieldcontrol></td>

<tr><td style="vertical-align:top" colspan="3"><def:datafieldcontrol runat="server" id="enur_dur" databasefield="enur_dur" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="460px" fieldtextboxwidth="250px"></def:datafieldcontrol></td>

<tr><td style="vertical-align:top" colspan="3"><def:datafieldcontrol runat="server" id="enur_2_current" databasefield="enur_2_current" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="460px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>

<tr><td style="vertical-align:top" colspan="3"><def:datafieldcontrol runat="server" id="enur_2_past" databasefield="enur_2_past" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="460px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>

<tr><td><br/></td/></tr>
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="encp_1ap" databasefield="encp_1ap" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="460px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
 <td style="vertical-align:top"><def:datafieldcontrol runat="server" id="encp_1ac" databasefield="encp_1ac" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="32px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
 <td style="vertical-align:top"><def:datafieldcontrol runat="server" id="encp_1as" databasefield="encp_1as" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="32px" fieldtextboxwidth="40px"></def:datafieldcontrol></td></tr>
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="encp_1ap_past" databasefield="encp_1ap_past" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="460px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
    <td style="vertical-align:top"><def:datafieldcontrol runat="server" id="encp_1ac_past" databasefield="encp_1ac_past" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="32px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
    <td style="vertical-align:top"><def:datafieldcontrol runat="server" id="encp_1as_past" databasefield="encp_1as_past" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="32px" fieldtextboxwidth="40px"></def:datafieldcontrol></td></tr>


<tr><td><br/></td/></tr>
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="encp_1bp" databasefield="encp_1bp" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="460px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
 <td style="vertical-align:top"><def:datafieldcontrol runat="server" id="encp_1bc" databasefield="encp_1bc" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="32px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
 <td style="vertical-align:top"><def:datafieldcontrol runat="server" id="encp_1bs" databasefield="encp_1bs" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="32px" fieldtextboxwidth="40px"></def:datafieldcontrol></td></tr>
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="encp_1bp_past" databasefield="encp_1bp_past" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="460px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
    <td style="vertical-align:top"><def:datafieldcontrol runat="server" id="encp_1bc_past" databasefield="encp_1bc_past" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="32px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
    <td style="vertical-align:top"><def:datafieldcontrol runat="server" id="encp_1bs_past" databasefield="encp_1bs_past" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="32px" fieldtextboxwidth="40px"></def:datafieldcontrol></td></tr>

<tr><td><br/></td/></tr>
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="encp_1cp" databasefield="encp_1cp" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="460px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
 <td style="vertical-align:top"><def:datafieldcontrol runat="server" id="encp_1cc" databasefield="encp_1cc" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="32px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
 <td style="vertical-align:top"><def:datafieldcontrol runat="server" id="encp_1cs" databasefield="encp_1cs" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="32px" fieldtextboxwidth="40px"></def:datafieldcontrol></td></tr>
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="encp_1cp_past" databasefield="encp_1cp_past" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="460px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
    <td style="vertical-align:top"><def:datafieldcontrol runat="server" id="encp_1cc_past" databasefield="encp_1cc_past" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="32px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
    <td style="vertical-align:top"><def:datafieldcontrol runat="server" id="encp_1cs_past" databasefield="encp_1cs_past" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="32px" fieldtextboxwidth="40px"></def:datafieldcontrol></td></tr>

<tr><td style="vertical-align:top" colspan="3"><def:datafieldcontrol runat="server" id="encp_react" databasefield="encp_react" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="460px" fieldtextboxwidth="250px"></def:datafieldcontrol></td>

<tr><td style="vertical-align:top" colspan="3"><def:datafieldcontrol runat="server" id="encp_impair" databasefield="encp_impair" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="460px" fieldtextboxwidth="250px"></def:datafieldcontrol></td>

<tr><td style="vertical-align:top" colspan="3"><def:datafieldcontrol runat="server" id="encp_dur" databasefield="encp_dur" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="460px" fieldtextboxwidth="250px"></def:datafieldcontrol></td>

<tr><td style="vertical-align:top" colspan="3"><def:datafieldcontrol runat="server" id="encp_2_current" databasefield="encp_2_current" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="460px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>

<tr><td style="vertical-align:top" colspan="3"><def:datafieldcontrol runat="server" id="encp_2_past" databasefield="encp_2_past" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="460px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>

<tr><td><br/></td/></tr>
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="eatd_1p" databasefield="eatd_1p" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="460px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
 <td style="vertical-align:top"><def:datafieldcontrol runat="server" id="eatd_1c" databasefield="eatd_1c" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="32px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
 <td style="vertical-align:top"><def:datafieldcontrol runat="server" id="eatd_1s" databasefield="eatd_1s" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="32px" fieldtextboxwidth="40px"></def:datafieldcontrol></td></tr>
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="eatd_1p_past" databasefield="eatd_1p_past" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="460px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
    <td style="vertical-align:top"><def:datafieldcontrol runat="server" id="eatd_1c_past" databasefield="eatd_1c_past" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="32px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
    <td style="vertical-align:top"><def:datafieldcontrol runat="server" id="eatd_1s_past" databasefield="eatd_1s_past" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="32px" fieldtextboxwidth="40px"></def:datafieldcontrol></td></tr>

<tr><td><br/></td/></tr>
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="eatd_2p" databasefield="eatd_2p" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="460px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
 <td style="vertical-align:top"><def:datafieldcontrol runat="server" id="eatd_2c" databasefield="eatd_2c" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="32px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
 <td style="vertical-align:top"><def:datafieldcontrol runat="server" id="eatd_2s" databasefield="eatd_2s" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="32px" fieldtextboxwidth="40px"></def:datafieldcontrol></td></tr>
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="eatd_2p_past" databasefield="eatd_2p_past" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="460px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
    <td style="vertical-align:top"><def:datafieldcontrol runat="server" id="eatd_2c_past" databasefield="eatd_2c_past" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="32px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
    <td style="vertical-align:top"><def:datafieldcontrol runat="server" id="eatd_2s_past" databasefield="eatd_2s_past" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="32px" fieldtextboxwidth="40px"></def:datafieldcontrol></td></tr>

	</table>

	<br />    <br />    <br />


	<%--Eating Disorders--%>
	  <table>
		<tr>
			<td align="right"  width="500px"><b><u>P curr</u></b></td>
			<td align="right"><b><u>P msp</u></b></td>
			<td align="right"><b><u>C curr</u></b></td>
			<td align="right"><b><u>C msp</u></b></td>
			<td align="right"><b><u>S curr</u></b></td>
			<td align="right"><b><u>S msp</u></b></td>
		</tr>

<tr><td style="vertical-align:top" colspan="1"><def:datafieldcontrol runat="server" id="eatd_3ap_ce" databasefield="eatd_3ap_ce" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="460px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
	<td style="vertical-align:top" colspan="1"><def:datafieldcontrol runat="server" id="eatd_3ap_msp" databasefield="eatd_3ap_msp" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="4px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
	<td style="vertical-align:top" colspan="1"><def:datafieldcontrol runat="server" id="eatd_3ac_ce" databasefield="eatd_3ac_ce" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="40px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
	<td style="vertical-align:top" colspan="1"><def:datafieldcontrol runat="server" id="eatd_3ac_msp" databasefield="eatd_3ac_msp" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="4px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
	<td style="vertical-align:top" colspan="1"><def:datafieldcontrol runat="server" id="eatd_3as_ce" databasefield="eatd_3as_ce" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="40px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
	<td style="vertical-align:top" colspan="1"><def:datafieldcontrol runat="server" id="eatd_3as_msp" databasefield="eatd_3as_msp" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="4px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>

</tr>
<tr>
	<td style="vertical-align:top" colspan="1"><def:datafieldcontrol runat="server" id="eatd_3bp_ce"  databasefield="eatd_3bp_ce"  isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="460px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
	<td style="vertical-align:top" colspan="1"><def:datafieldcontrol runat="server" id="eatd_3bp_msp" databasefield="eatd_3bp_msp" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="4px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
	<td style="vertical-align:top" colspan="1"><def:datafieldcontrol runat="server" id="eatd_3bc_ce"  databasefield="eatd_3bc_ce"  isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="40px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
	<td style="vertical-align:top" colspan="1"><def:datafieldcontrol runat="server" id="eatd_3bc_msp" databasefield="eatd_3bc_msp" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="4px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
	<td style="vertical-align:top" colspan="1"><def:datafieldcontrol runat="server" id="eatd_3bs_ce"  databasefield="eatd_3bs_ce"  isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="40px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
	<td style="vertical-align:top" colspan="1"><def:datafieldcontrol runat="server" id="eatd_3bs_msp" databasefield="eatd_3bs_msp" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="4px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
</tr>

<tr>
	<td style="vertical-align:top" colspan="1"><def:datafieldcontrol runat="server" id="eatd_3cp_ce"  databasefield="eatd_3cp_ce"  isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="460px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
	<td style="vertical-align:top" colspan="1"><def:datafieldcontrol runat="server" id="eatd_3cp_msp" databasefield="eatd_3cp_msp" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="4px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
	<td style="vertical-align:top" colspan="1"><def:datafieldcontrol runat="server" id="eatd_3cc_ce"  databasefield="eatd_3cc_ce"  isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="40px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
	<td style="vertical-align:top" colspan="1"><def:datafieldcontrol runat="server" id="eatd_3cc_msp" databasefield="eatd_3cc_msp" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="4px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
	<td style="vertical-align:top" colspan="1"><def:datafieldcontrol runat="server" id="eatd_3cs_ce"  databasefield="eatd_3cs_ce"  isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="40px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
	<td style="vertical-align:top" colspan="1"><def:datafieldcontrol runat="server" id="eatd_3cs_msp" databasefield="eatd_3cs_msp" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="4px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
</tr>
<tr>
	<td style="vertical-align:top" colspan="1"><def:datafieldcontrol runat="server" id="eatd_3dp_ce"  databasefield="eatd_3dp_ce"  isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="460px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
	<td style="vertical-align:top" colspan="1"><def:datafieldcontrol runat="server" id="eatd_3dp_msp" databasefield="eatd_3dp_msp" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="4px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
	<td style="vertical-align:top" colspan="1"><def:datafieldcontrol runat="server" id="eatd_3dc_ce"  databasefield="eatd_3dc_ce"  isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="40px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
	<td style="vertical-align:top" colspan="1"><def:datafieldcontrol runat="server" id="eatd_3dc_msp" databasefield="eatd_3dc_msp" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="4px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
	<td style="vertical-align:top" colspan="1"><def:datafieldcontrol runat="server" id="eatd_3ds_ce"  databasefield="eatd_3ds_ce"  isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="40px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
	<td style="vertical-align:top" colspan="1"><def:datafieldcontrol runat="server" id="eatd_3ds_msp" databasefield="eatd_3ds_msp" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="4px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
</tr>
<tr>
	<td style="vertical-align:top" colspan="1"><def:datafieldcontrol runat="server" id="eatd_3ep_ce"  databasefield="eatd_3ep_ce"  isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="460px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
	<td style="vertical-align:top" colspan="1"><def:datafieldcontrol runat="server" id="eatd_3ep_msp" databasefield="eatd_3ep_msp" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="4px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
	<td style="vertical-align:top" colspan="1"><def:datafieldcontrol runat="server" id="eatd_3ec_ce"  databasefield="eatd_3ec_ce"  isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="40px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
	<td style="vertical-align:top" colspan="1"><def:datafieldcontrol runat="server" id="eatd_3ec_msp" databasefield="eatd_3ec_msp" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="4px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
	<td style="vertical-align:top" colspan="1"><def:datafieldcontrol runat="server" id="eatd_3es_ce"  databasefield="eatd_3es_ce"  isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="40px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
	<td style="vertical-align:top" colspan="1"><def:datafieldcontrol runat="server" id="eatd_3es_msp" databasefield="eatd_3es_msp" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="4px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
</tr>
<tr>
	<td style="vertical-align:top" colspan="1"><def:datafieldcontrol runat="server" id="eatd_3fp_ce"  databasefield="eatd_3fp_ce"  isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="460px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
	<td style="vertical-align:top" colspan="1"><def:datafieldcontrol runat="server" id="eatd_3fp_msp" databasefield="eatd_3fp_msp" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="4px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
	<td style="vertical-align:top" colspan="1"><def:datafieldcontrol runat="server" id="eatd_3fc_ce"  databasefield="eatd_3fc_ce"  isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="40px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
	<td style="vertical-align:top" colspan="1"><def:datafieldcontrol runat="server" id="eatd_3fc_msp" databasefield="eatd_3fc_msp" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="4px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
	<td style="vertical-align:top" colspan="1"><def:datafieldcontrol runat="server" id="eatd_3fs_ce"  databasefield="eatd_3fs_ce"  isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="40px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
	<td style="vertical-align:top" colspan="1"><def:datafieldcontrol runat="server" id="eatd_3fs_msp" databasefield="eatd_3fs_msp" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="4px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
</tr>
<tr>
	<td style="vertical-align:top" colspan="1"><def:datafieldcontrol runat="server" id="eatd_3gp_ce"  databasefield="eatd_3gp_ce"  isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="460px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
	<td style="vertical-align:top" colspan="1"><def:datafieldcontrol runat="server" id="eatd_3gp_msp" databasefield="eatd_3gp_msp" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="4px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
	<td style="vertical-align:top" colspan="1"><def:datafieldcontrol runat="server" id="eatd_3gc_ce"  databasefield="eatd_3gc_ce"  isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="40px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
	<td style="vertical-align:top" colspan="1"><def:datafieldcontrol runat="server" id="eatd_3gc_msp" databasefield="eatd_3gc_msp" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="4px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
	<td style="vertical-align:top" colspan="1"><def:datafieldcontrol runat="server" id="eatd_3gs_ce"  databasefield="eatd_3gs_ce"  isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="40px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
	<td style="vertical-align:top" colspan="1"><def:datafieldcontrol runat="server" id="eatd_3gs_msp" databasefield="eatd_3gs_msp" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="4px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
</tr>

</table>

	<br />

<table>
	<tr><td align="right"><b><u>P</u>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</b></td><td align="right"><b><u>C</u>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</b></td><td align="right"><b><u>S</u>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</b></td></tr>
<tr>
	<td style="vertical-align:top"><def:datafieldcontrol runat="server" id="eatd_4p" databasefield="eatd_4p" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="460px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
	<td style="vertical-align:top"><def:datafieldcontrol runat="server" id="eatd_4c" databasefield="eatd_4c" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="32px"  fieldtextboxwidth="40px"></def:datafieldcontrol></td>
	<td style="vertical-align:top"><def:datafieldcontrol runat="server" id="eatd_4s" databasefield="eatd_4s" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="32px"  fieldtextboxwidth="40px"></def:datafieldcontrol></td>

</tr>
    <tr>
   	<td style="vertical-align:top"><def:datafieldcontrol runat="server" id="eatd_4p_past" databasefield="eatd_4p_past" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="460px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
	<td style="vertical-align:top"><def:datafieldcontrol runat="server" id="eatd_4c_past" databasefield="eatd_4c_past" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="32px"  fieldtextboxwidth="40px"></def:datafieldcontrol></td>
	<td style="vertical-align:top"><def:datafieldcontrol runat="server" id="eatd_4s_past" databasefield="eatd_4s_past" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="32px"  fieldtextboxwidth="40px"></def:datafieldcontrol></td>

    </tr>
	</table>

	<br />
	<br />

<table>
	<tr><td align="right"><b><u>P</u>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</b></td><td align="right"><b><u>C</u>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</b></td><td align="right"><b><u>S</u>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</b></td></tr>

<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="adhd_1p" databasefield="adhd_1p" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="460px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
 <td style="vertical-align:top"><def:datafieldcontrol runat="server" id="adhd_1c" databasefield="adhd_1c" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="32px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
 <td style="vertical-align:top"><def:datafieldcontrol runat="server" id="adhd_1s" databasefield="adhd_1s" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="32px" fieldtextboxwidth="40px"></def:datafieldcontrol></td></tr>
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="adhd_1p_past" databasefield="adhd_1p_past" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="460px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
    <td style="vertical-align:top"><def:datafieldcontrol runat="server" id="adhd_1c_past" databasefield="adhd_1c_past" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="32px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
    <td style="vertical-align:top"><def:datafieldcontrol runat="server" id="adhd_1s_past" databasefield="adhd_1s_past" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="32px" fieldtextboxwidth="40px"></def:datafieldcontrol></td></tr>
<tr><td><br/></td/></tr>
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="adhd_2p" databasefield="adhd_2p" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="460px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
 <td style="vertical-align:top"><def:datafieldcontrol runat="server" id="adhd_2c" databasefield="adhd_2c" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="32px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
 <td style="vertical-align:top"><def:datafieldcontrol runat="server" id="adhd_2s" databasefield="adhd_2s" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="32px" fieldtextboxwidth="40px"></def:datafieldcontrol></td></tr>
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="adhd_2p_past" databasefield="adhd_2p_past" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="460px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
    <td style="vertical-align:top"><def:datafieldcontrol runat="server" id="adhd_2c_past" databasefield="adhd_2c_past" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="32px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
    <td style="vertical-align:top"><def:datafieldcontrol runat="server" id="adhd_2s_past" databasefield="adhd_2s_past" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="32px" fieldtextboxwidth="40px"></def:datafieldcontrol></td></tr>

<tr><td><br/></td/></tr>
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="adhd_3p" databasefield="adhd_3p" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="460px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
 <td style="vertical-align:top"><def:datafieldcontrol runat="server" id="adhd_3c" databasefield="adhd_3c" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="32px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
 <td style="vertical-align:top"><def:datafieldcontrol runat="server" id="adhd_3s" databasefield="adhd_3s" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="32px" fieldtextboxwidth="40px"></def:datafieldcontrol></td></tr>
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="adhd_3p_past" databasefield="adhd_3p_past" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="460px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
    <td style="vertical-align:top"><def:datafieldcontrol runat="server" id="adhd_3c_past" databasefield="adhd_3c_past" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="32px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
    <td style="vertical-align:top"><def:datafieldcontrol runat="server" id="adhd_3s_past" databasefield="adhd_3s_past" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="32px" fieldtextboxwidth="40px"></def:datafieldcontrol></td></tr>

<tr><td><br/></td/></tr>
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="adhd_4p" databasefield="adhd_4p" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="460px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
 <td style="vertical-align:top"><def:datafieldcontrol runat="server" id="adhd_4c" databasefield="adhd_4c" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="32px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
 <td style="vertical-align:top"><def:datafieldcontrol runat="server" id="adhd_4s" databasefield="adhd_4s" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="32px" fieldtextboxwidth="40px"></def:datafieldcontrol></td></tr>
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="adhd_4p_past" databasefield="adhd_4p_past" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="460px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
    <td style="vertical-align:top"><def:datafieldcontrol runat="server" id="adhd_4c_past" databasefield="adhd_4c_past" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="32px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
    <td style="vertical-align:top"><def:datafieldcontrol runat="server" id="adhd_4s_past" databasefield="adhd_4s_past" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="32px" fieldtextboxwidth="40px"></def:datafieldcontrol></td></tr>

<tr><td><br/></td/></tr>
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="oppd_1p" databasefield="oppd_1p" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="460px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
 <td style="vertical-align:top"><def:datafieldcontrol runat="server" id="oppd_1c" databasefield="oppd_1c" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="32px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
 <td style="vertical-align:top"><def:datafieldcontrol runat="server" id="oppd_1s" databasefield="oppd_1s" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="32px" fieldtextboxwidth="40px"></def:datafieldcontrol></td></tr>
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="oppd_1p_past" databasefield="oppd_1p_past" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="460px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
    <td style="vertical-align:top"><def:datafieldcontrol runat="server" id="oppd_1c_past" databasefield="oppd_1c_past" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="32px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
    <td style="vertical-align:top"><def:datafieldcontrol runat="server" id="oppd_1s_past" databasefield="oppd_1s_past" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="32px" fieldtextboxwidth="40px"></def:datafieldcontrol></td></tr>

<tr><td><br/></td/></tr>
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="oppd_2p" databasefield="oppd_2p" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="460px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
 <td style="vertical-align:top"><def:datafieldcontrol runat="server" id="oppd_2c" databasefield="oppd_2c" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="32px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
 <td style="vertical-align:top"><def:datafieldcontrol runat="server" id="oppd_2s" databasefield="oppd_2s" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="32px" fieldtextboxwidth="40px"></def:datafieldcontrol></td></tr>
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="oppd_2p_past" databasefield="oppd_2p_past" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="460px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
    <td style="vertical-align:top"><def:datafieldcontrol runat="server" id="oppd_2c_past" databasefield="oppd_2c_past" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="32px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
    <td style="vertical-align:top"><def:datafieldcontrol runat="server" id="oppd_2s_past" databasefield="oppd_2s_past" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="32px" fieldtextboxwidth="40px"></def:datafieldcontrol></td></tr>

<tr><td><br/></td/></tr>
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="oppd_3p" databasefield="oppd_3p" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="460px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
 <td style="vertical-align:top"><def:datafieldcontrol runat="server" id="oppd_3c" databasefield="oppd_3c" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="32px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
 <td style="vertical-align:top"><def:datafieldcontrol runat="server" id="oppd_3s" databasefield="oppd_3s" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="32px" fieldtextboxwidth="40px"></def:datafieldcontrol></td></tr>
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="oppd_3p_past" databasefield="oppd_3p_past" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="460px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
    <td style="vertical-align:top"><def:datafieldcontrol runat="server" id="oppd_3c_past" databasefield="oppd_3c_past" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="32px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
    <td style="vertical-align:top"><def:datafieldcontrol runat="server" id="oppd_3s_past" databasefield="oppd_3s_past" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="32px" fieldtextboxwidth="40px"></def:datafieldcontrol></td></tr>

<tr><td><br/></td/></tr>
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="cond_1p" databasefield="cond_1p" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="460px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
 <td style="vertical-align:top"><def:datafieldcontrol runat="server" id="cond_1c" databasefield="cond_1c" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="32px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
 <td style="vertical-align:top"><def:datafieldcontrol runat="server" id="cond_1s" databasefield="cond_1s" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="32px" fieldtextboxwidth="40px"></def:datafieldcontrol></td></tr>
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="cond_1p_past" databasefield="cond_1p_past" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="460px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
    <td style="vertical-align:top"><def:datafieldcontrol runat="server" id="cond_1c_past" databasefield="cond_1c_past" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="32px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
    <td style="vertical-align:top"><def:datafieldcontrol runat="server" id="cond_1s_past" databasefield="cond_1s_past" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="32px" fieldtextboxwidth="40px"></def:datafieldcontrol></td></tr>

<tr><td><br/></td/></tr>
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="cond_2p" databasefield="cond_2p" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="460px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
 <td style="vertical-align:top"><def:datafieldcontrol runat="server" id="cond_2c" databasefield="cond_2c" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="32px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
 <td style="vertical-align:top"><def:datafieldcontrol runat="server" id="cond_2s" databasefield="cond_2s" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="32px" fieldtextboxwidth="40px"></def:datafieldcontrol></td></tr>
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="cond_2p_past" databasefield="cond_2p_past" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="460px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
    <td style="vertical-align:top"><def:datafieldcontrol runat="server" id="cond_2c_past" databasefield="cond_2c_past" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="32px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
    <td style="vertical-align:top"><def:datafieldcontrol runat="server" id="cond_2s_past" databasefield="cond_2s_past" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="32px" fieldtextboxwidth="40px"></def:datafieldcontrol></td></tr>

<tr><td><br/></td/></tr>
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="cond_3p" databasefield="cond_3p" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="460px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
 <td style="vertical-align:top"><def:datafieldcontrol runat="server" id="cond_3c" databasefield="cond_3c" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="32px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
 <td style="vertical-align:top"><def:datafieldcontrol runat="server" id="cond_3s" databasefield="cond_3s" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="32px" fieldtextboxwidth="40px"></def:datafieldcontrol></td></tr>
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="cond_3p_past" databasefield="cond_3p_past" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="460px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
    <td style="vertical-align:top"><def:datafieldcontrol runat="server" id="cond_3c_past" databasefield="cond_3c_past" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="32px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
    <td style="vertical-align:top"><def:datafieldcontrol runat="server" id="cond_3s_past" databasefield="cond_3s_past" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="32px" fieldtextboxwidth="40px"></def:datafieldcontrol></td></tr>

<tr><td style="vertical-align:top" colspan="3"><def:datafieldcontrol runat="server" id="cond_3_gang" databasefield="cond_3_gang" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="460px" fieldtextboxwidth="250px"></def:datafieldcontrol></td>

<tr><td style="vertical-align:top" colspan="3"><def:datafieldcontrol runat="server" id="cond_3_homi" databasefield="cond_3_homi" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="460px" fieldtextboxwidth="250px"></def:datafieldcontrol></td>

<tr><td><br/></td/></tr>
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="cond_4p" databasefield="cond_4p" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="460px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
 <td style="vertical-align:top"><def:datafieldcontrol runat="server" id="cond_4c" databasefield="cond_4c" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="32px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
 <td style="vertical-align:top"><def:datafieldcontrol runat="server" id="cond_4s" databasefield="cond_4s" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="32px" fieldtextboxwidth="40px"></def:datafieldcontrol></td></tr>
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="cond_4p_past" databasefield="cond_4p_past" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="460px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
    <td style="vertical-align:top"><def:datafieldcontrol runat="server" id="cond_4c_past" databasefield="cond_4c_past" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="32px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
    <td style="vertical-align:top"><def:datafieldcontrol runat="server" id="cond_4s_past" databasefield="cond_4s_past" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="32px" fieldtextboxwidth="40px"></def:datafieldcontrol></td></tr>

<tr><td><br/></td/></tr>
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="cond_5p" databasefield="cond_5p" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="460px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
 <td style="vertical-align:top"><def:datafieldcontrol runat="server" id="cond_5c" databasefield="cond_5c" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="32px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
 <td style="vertical-align:top"><def:datafieldcontrol runat="server" id="cond_5s" databasefield="cond_5s" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="32px" fieldtextboxwidth="40px"></def:datafieldcontrol></td></tr>
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="cond_5p_past" databasefield="cond_5p_past" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="460px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
    <td style="vertical-align:top"><def:datafieldcontrol runat="server" id="cond_5c_past" databasefield="cond_5c_past" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="32px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
    <td style="vertical-align:top"><def:datafieldcontrol runat="server" id="cond_5s_past" databasefield="cond_5s_past" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="32px" fieldtextboxwidth="40px"></def:datafieldcontrol></td></tr>

<tr><td><br/></td/></tr>
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="ticd_1p" databasefield="ticd_1p" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="460px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
 <td style="vertical-align:top"><def:datafieldcontrol runat="server" id="ticd_1c" databasefield="ticd_1c" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="32px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
 <td style="vertical-align:top"><def:datafieldcontrol runat="server" id="ticd_1s" databasefield="ticd_1s" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="32px" fieldtextboxwidth="40px"></def:datafieldcontrol></td></tr>
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="ticd_1p_past" databasefield="ticd_1p_past" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="460px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
    <td style="vertical-align:top"><def:datafieldcontrol runat="server" id="ticd_1c_past" databasefield="ticd_1c_past" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="32px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
    <td style="vertical-align:top"><def:datafieldcontrol runat="server" id="ticd_1s_past" databasefield="ticd_1s_past" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="32px" fieldtextboxwidth="40px"></def:datafieldcontrol></td></tr>

<tr><td><br/></td/></tr>
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="ticd_2p" databasefield="ticd_2p" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="460px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
 <td style="vertical-align:top"><def:datafieldcontrol runat="server" id="ticd_2c" databasefield="ticd_2c" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="32px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
 <td style="vertical-align:top"><def:datafieldcontrol runat="server" id="ticd_2s" databasefield="ticd_2s" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="32px" fieldtextboxwidth="40px"></def:datafieldcontrol></td></tr>
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="ticd_2p_past" databasefield="ticd_2p_past" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="460px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
    <td style="vertical-align:top"><def:datafieldcontrol runat="server" id="ticd_2c_past" databasefield="ticd_2c_past" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="32px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
    <td style="vertical-align:top"><def:datafieldcontrol runat="server" id="ticd_2s_past" databasefield="ticd_2s_past" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="32px" fieldtextboxwidth="40px"></def:datafieldcontrol></td></tr>


<tr><td><br/></td/></tr>
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="asd__1p" databasefield="asd__1p" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="460px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
 <td style="vertical-align:top"><def:datafieldcontrol runat="server" id="asd__1c" databasefield="asd__1c" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="32px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
 <td style="vertical-align:top"><def:datafieldcontrol runat="server" id="asd__1s" databasefield="asd__1s" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="32px" fieldtextboxwidth="40px"></def:datafieldcontrol></td></tr>
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="asd__1p_past" databasefield="asd__1p_past" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="460px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
    <td style="vertical-align:top"><def:datafieldcontrol runat="server" id="asd__1c_past" databasefield="asd__1c_past" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="32px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
    <td style="vertical-align:top"><def:datafieldcontrol runat="server" id="asd__1s_past" databasefield="asd__1s_past" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="32px" fieldtextboxwidth="40px"></def:datafieldcontrol></td></tr>

<tr><td><br/></td/></tr>
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="asd__2p" databasefield="asd__2p" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="460px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
 <td style="vertical-align:top"><def:datafieldcontrol runat="server" id="asd__2c" databasefield="asd__2c" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="32px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
 <td style="vertical-align:top"><def:datafieldcontrol runat="server" id="asd__2s" databasefield="asd__2s" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="32px" fieldtextboxwidth="40px"></def:datafieldcontrol></td></tr>
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="asd__2p_past" databasefield="asd__2p_past" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="460px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
    <td style="vertical-align:top"><def:datafieldcontrol runat="server" id="asd__2c_past" databasefield="asd__2c_past" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="32px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
    <td style="vertical-align:top"><def:datafieldcontrol runat="server" id="asd__2s_past" databasefield="asd__2s_past" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="32px" fieldtextboxwidth="40px"></def:datafieldcontrol></td></tr>

<tr><td><br/></td/></tr>
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="asd__3p" databasefield="asd__3p" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="460px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
 <td style="vertical-align:top"><def:datafieldcontrol runat="server" id="asd__3c" databasefield="asd__3c" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="32px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
 <td style="vertical-align:top"><def:datafieldcontrol runat="server" id="asd__3s" databasefield="asd__3s" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="32px" fieldtextboxwidth="40px"></def:datafieldcontrol></td></tr>
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="asd__3p_past" databasefield="asd__3p_past" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="460px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
    <td style="vertical-align:top"><def:datafieldcontrol runat="server" id="asd__3c_past" databasefield="asd__3c_past" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="32px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
    <td style="vertical-align:top"><def:datafieldcontrol runat="server" id="asd__3s_past" databasefield="asd__3s_past" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="32px" fieldtextboxwidth="40px"></def:datafieldcontrol></td></tr>

<tr><td><br/></td/></tr>
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="asd__4p" databasefield="asd__4p" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="460px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
 <td style="vertical-align:top"><def:datafieldcontrol runat="server" id="asd__4c" databasefield="asd__4c" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="32px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
 <td style="vertical-align:top"><def:datafieldcontrol runat="server" id="asd__4s" databasefield="asd__4s" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="32px" fieldtextboxwidth="40px"></def:datafieldcontrol></td></tr>
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="asd__4p_past" databasefield="asd__4p_past" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="460px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
    <td style="vertical-align:top"><def:datafieldcontrol runat="server" id="asd__4c_past" databasefield="asd__4c_past" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="32px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
    <td style="vertical-align:top"><def:datafieldcontrol runat="server" id="asd__4s_past" databasefield="asd__4s_past" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="32px" fieldtextboxwidth="40px"></def:datafieldcontrol></td></tr>


<tr><td style="vertical-align:top" colspan="3"><def:datafieldcontrol runat="server" id="asd__4_probarea" databasefield="asd__4_probarea" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="460px" fieldtextboxwidth="250px"></def:datafieldcontrol></td>

	</table>

	<br />
	<br />

<table>
	<tr><td align="right"><b><u>P</u>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</b></td><td align="right"><b><u>C</u>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</b></td><td align="right"><b><u>S</u>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</b></td></tr>

<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="tobu_1ap" databasefield="tobu_1ap" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="460px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
 <td style="vertical-align:top"><def:datafieldcontrol runat="server" id="tobu_1ac" databasefield="tobu_1ac" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="32px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
 <td style="vertical-align:top"><def:datafieldcontrol runat="server" id="tobu_1as" databasefield="tobu_1as" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="32px" fieldtextboxwidth="40px"></def:datafieldcontrol></td></tr>

<tr><td><br/></td/></tr>
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="tobu_1bp" databasefield="tobu_1bp" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="460px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
 <td style="vertical-align:top"><def:datafieldcontrol runat="server" id="tobu_1bc" databasefield="tobu_1bc" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="32px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
 <td style="vertical-align:top"><def:datafieldcontrol runat="server" id="tobu_1bs" databasefield="tobu_1bs" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="32px" fieldtextboxwidth="40px"></def:datafieldcontrol></td></tr>

<tr><td><br/></td/></tr>
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="tobu_1cp" databasefield="tobu_1cp" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="460px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
 <td style="vertical-align:top"><def:datafieldcontrol runat="server" id="tobu_1cc" databasefield="tobu_1cc" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="32px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
 <td style="vertical-align:top"><def:datafieldcontrol runat="server" id="tobu_1cs" databasefield="tobu_1cs" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="32px" fieldtextboxwidth="40px"></def:datafieldcontrol></td></tr>

<tr><td><br/></td/></tr>
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="tobu_2ap" databasefield="tobu_2ap" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="460px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
 <td style="vertical-align:top"><def:datafieldcontrol runat="server" id="tobu_2ac" databasefield="tobu_2ac" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="32px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
 <td style="vertical-align:top"><def:datafieldcontrol runat="server" id="tobu_2as" databasefield="tobu_2as" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="32px" fieldtextboxwidth="40px"></def:datafieldcontrol></td></tr>

<tr><td><br/></td/></tr>
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="tobu_2bp" databasefield="tobu_2bp" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="460px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
 <td style="vertical-align:top"><def:datafieldcontrol runat="server" id="tobu_2bc" databasefield="tobu_2bc" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="32px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
 <td style="vertical-align:top"><def:datafieldcontrol runat="server" id="tobu_2bs" databasefield="tobu_2bs" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="32px" fieldtextboxwidth="40px"></def:datafieldcontrol></td></tr>


	<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="tobu_2bp_age" databasefield="tobu_2bp_age" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="460px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
 <td style="vertical-align:top"><def:datafieldcontrol runat="server" id="tobu_2bc_age" databasefield="tobu_2bc_age" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="32px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
 <td style="vertical-align:top"><def:datafieldcontrol runat="server" id="tobu_2bs_age" databasefield="tobu_2bs_age" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="32px" fieldtextboxwidth="40px"></def:datafieldcontrol></td></tr>


<tr><td><br/></td/></tr>
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="tobu_3p" databasefield="tobu_3p" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="460px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
 <td style="vertical-align:top"><def:datafieldcontrol runat="server" id="tobu_3c" databasefield="tobu_3c" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="32px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
 <td style="vertical-align:top"><def:datafieldcontrol runat="server" id="tobu_3s" databasefield="tobu_3s" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="32px" fieldtextboxwidth="40px"></def:datafieldcontrol></td></tr>


<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="tobu_3p_age" databasefield="tobu_3p_age" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="460px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
 <td style="vertical-align:top"><def:datafieldcontrol runat="server" id="tobu_3c_age" databasefield="tobu_3c_age" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="32px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
 <td style="vertical-align:top"><def:datafieldcontrol runat="server" id="tobu_3s_age" databasefield="tobu_3s_age" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="32px" fieldtextboxwidth="40px"></def:datafieldcontrol></td></tr>



<tr><td><br/></td/></tr>
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="tobu_4p" databasefield="tobu_4p" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="460px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
 <td style="vertical-align:top"><def:datafieldcontrol runat="server" id="tobu_4c" databasefield="tobu_4c" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="32px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
 <td style="vertical-align:top"><def:datafieldcontrol runat="server" id="tobu_4s" databasefield="tobu_4s" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="32px" fieldtextboxwidth="40px"></def:datafieldcontrol></td></tr>

<tr><td><br/></td/></tr>
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="tobu_5p" databasefield="tobu_5p" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="460px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
 <td style="vertical-align:top"><def:datafieldcontrol runat="server" id="tobu_5c" databasefield="tobu_5c" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="32px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
 <td style="vertical-align:top"><def:datafieldcontrol runat="server" id="tobu_5s" databasefield="tobu_5s" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="32px" fieldtextboxwidth="40px"></def:datafieldcontrol></td></tr>


<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="tobu_5p_nummos" databasefield="tobu_5p_nummos" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="460px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
 <td style="vertical-align:top"><def:datafieldcontrol runat="server" id="tobu_5c_nummos" databasefield="tobu_5c_nummos" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="32px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
 <td style="vertical-align:top"><def:datafieldcontrol runat="server" id="tobu_5s_nummos" databasefield="tobu_5s_nummos" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="32px" fieldtextboxwidth="40px"></def:datafieldcontrol></td></tr>


<tr><td><br/></td/></tr>
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="alcu_1ap" databasefield="alcu_1ap" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="460px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
 <td style="vertical-align:top"><def:datafieldcontrol runat="server" id="alcu_1ac" databasefield="alcu_1ac" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="32px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
 <td style="vertical-align:top"><def:datafieldcontrol runat="server" id="alcu_1as" databasefield="alcu_1as" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="32px" fieldtextboxwidth="40px"></def:datafieldcontrol></td></tr>



 <tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="alcu_1bp_age" databasefield="alcu_1bp_age" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="460px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
 <td style="vertical-align:top"><def:datafieldcontrol runat="server" id="alcu_1bc_age" databasefield="alcu_1bc_age" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="32px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
 <td style="vertical-align:top"><def:datafieldcontrol runat="server" id="alcu_1bs_age" databasefield="alcu_1bs_age" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="32px" fieldtextboxwidth="40px"></def:datafieldcontrol></td></tr>

<td style="vertical-align:top"><def:datafieldcontrol runat="server" id="alcu_1cp_curruse" databasefield="alcu_1cp_curruse" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="460px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
 <td style="vertical-align:top"><def:datafieldcontrol runat="server" id="alcu_1cc_curruse" databasefield="alcu_1cc_curruse" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="32px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
 <td style="vertical-align:top"><def:datafieldcontrol runat="server" id="alcu_1cs_curruse" databasefield="alcu_1cs_curruse" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="32px" fieldtextboxwidth="40px"></def:datafieldcontrol></td></tr>

 
<tr><td><br/></td/></tr>
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="alcu_1dp" databasefield="alcu_1dp" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="460px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
 <td style="vertical-align:top"><def:datafieldcontrol runat="server" id="alcu_1dc" databasefield="alcu_1dc" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="32px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
 <td style="vertical-align:top"><def:datafieldcontrol runat="server" id="alcu_1ds" databasefield="alcu_1ds" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="32px" fieldtextboxwidth="40px"></def:datafieldcontrol></td></tr>

<tr><td><br/></td/></tr>
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="alcu_2p" databasefield="alcu_2p" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="460px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
 <td style="vertical-align:top"><def:datafieldcontrol runat="server" id="alcu_2c" databasefield="alcu_2c" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="32px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
 <td style="vertical-align:top"><def:datafieldcontrol runat="server" id="alcu_2s" databasefield="alcu_2s" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="32px" fieldtextboxwidth="40px"></def:datafieldcontrol></td></tr>

<tr><td><br/></td/></tr>
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="alcu_3p" databasefield="alcu_3p" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="460px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
 <td style="vertical-align:top"><def:datafieldcontrol runat="server" id="alcu_3c" databasefield="alcu_3c" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="32px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
 <td style="vertical-align:top"><def:datafieldcontrol runat="server" id="alcu_3s" databasefield="alcu_3s" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="32px" fieldtextboxwidth="40px"></def:datafieldcontrol></td></tr>

<tr><td><br/></td/></tr>
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="alcd_1ap" databasefield="alcd_1ap" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="460px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
 <td style="vertical-align:top"><def:datafieldcontrol runat="server" id="alcd_1ac" databasefield="alcd_1ac" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="32px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
 <td style="vertical-align:top"><def:datafieldcontrol runat="server" id="alcd_1as" databasefield="alcd_1as" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="32px" fieldtextboxwidth="40px"></def:datafieldcontrol></td></tr>
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="alcd_1ap_past" databasefield="alcd_1ap_past" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="460px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
    <td style="vertical-align:top"><def:datafieldcontrol runat="server" id="alcd_1ac_past" databasefield="alcd_1ac_past" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="32px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
    <td style="vertical-align:top"><def:datafieldcontrol runat="server" id="alcd_1as_past" databasefield="alcd_1as_past" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="32px" fieldtextboxwidth="40px"></def:datafieldcontrol></td></tr>

<tr><td><br/></td/></tr>
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="alcd_1bp" databasefield="alcd_1bp" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="460px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
 <td style="vertical-align:top"><def:datafieldcontrol runat="server" id="alcd_1bc" databasefield="alcd_1bc" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="32px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
 <td style="vertical-align:top"><def:datafieldcontrol runat="server" id="alcd_1bs" databasefield="alcd_1bs" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="32px" fieldtextboxwidth="40px"></def:datafieldcontrol></td></tr>
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="alcd_1bp_past" databasefield="alcd_1bp_past" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="460px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
    <td style="vertical-align:top"><def:datafieldcontrol runat="server" id="alcd_1bc_past" databasefield="alcd_1bc_past" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="32px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
    <td style="vertical-align:top"><def:datafieldcontrol runat="server" id="alcd_1bs_past" databasefield="alcd_1bs_past" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="32px" fieldtextboxwidth="40px"></def:datafieldcontrol></td></tr>

<tr><td><br/></td/></tr>
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="alcd_2p" databasefield="alcd_2p" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="460px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
 <td style="vertical-align:top"><def:datafieldcontrol runat="server" id="alcd_2c" databasefield="alcd_2c" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="32px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
 <td style="vertical-align:top"><def:datafieldcontrol runat="server" id="alcd_2s" databasefield="alcd_2s" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="32px" fieldtextboxwidth="40px"></def:datafieldcontrol></td></tr>
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="alcd_2p_past" databasefield="alcd_2p_past" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="460px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
    <td style="vertical-align:top"><def:datafieldcontrol runat="server" id="alcd_2c_past" databasefield="alcd_2c_past" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="32px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
    <td style="vertical-align:top"><def:datafieldcontrol runat="server" id="alcd_2s_past" databasefield="alcd_2s_past" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="32px" fieldtextboxwidth="40px"></def:datafieldcontrol></td></tr>

<tr><td><br/></td/></tr>
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="alcd_3p" databasefield="alcd_3p" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="460px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
 <td style="vertical-align:top"><def:datafieldcontrol runat="server" id="alcd_3c" databasefield="alcd_3c" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="32px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
 <td style="vertical-align:top"><def:datafieldcontrol runat="server" id="alcd_3s" databasefield="alcd_3s" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="32px" fieldtextboxwidth="40px"></def:datafieldcontrol></td></tr>
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="alcd_3p_past" databasefield="alcd_3p_past" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="460px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
    <td style="vertical-align:top"><def:datafieldcontrol runat="server" id="alcd_3c_past" databasefield="alcd_3c_past" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="32px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
    <td style="vertical-align:top"><def:datafieldcontrol runat="server" id="alcd_3s_past" databasefield="alcd_3s_past" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="32px" fieldtextboxwidth="40px"></def:datafieldcontrol></td></tr>

<tr><td><br/></td/></tr>
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="subu_1ap" databasefield="subu_1ap" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="460px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
 <td style="vertical-align:top"><def:datafieldcontrol runat="server" id="subu_1ac" databasefield="subu_1ac" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="32px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
 <td style="vertical-align:top"><def:datafieldcontrol runat="server" id="subu_1as" databasefield="subu_1as" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="32px" fieldtextboxwidth="40px"></def:datafieldcontrol></td></tr>

<tr><td><br/></td/></tr>
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="subu_1bp" databasefield="subu_1bp" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="460px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
 <td style="vertical-align:top"><def:datafieldcontrol runat="server" id="subu_1bc" databasefield="subu_1bc" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="32px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
 <td style="vertical-align:top"><def:datafieldcontrol runat="server" id="subu_1bs" databasefield="subu_1bs" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="32px" fieldtextboxwidth="40px"></def:datafieldcontrol></td></tr>

<tr><td><br/></td/></tr>
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="subu_1cp" databasefield="subu_1cp" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="460px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
 <td style="vertical-align:top"><def:datafieldcontrol runat="server" id="subu_1cc" databasefield="subu_1cc" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="32px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
 <td style="vertical-align:top"><def:datafieldcontrol runat="server" id="subu_1cs" databasefield="subu_1cs" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="32px" fieldtextboxwidth="40px"></def:datafieldcontrol></td></tr>

<tr><td><br/></td/></tr>
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="subu_1dp" databasefield="subu_1dp" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="460px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
 <td style="vertical-align:top"><def:datafieldcontrol runat="server" id="subu_1dc" databasefield="subu_1dc" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="32px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
 <td style="vertical-align:top"><def:datafieldcontrol runat="server" id="subu_1ds" databasefield="subu_1ds" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="32px" fieldtextboxwidth="40px"></def:datafieldcontrol></td></tr>

<tr><td><br/></td/></tr>
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="subu_1ep" databasefield="subu_1ep" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="460px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
 <td style="vertical-align:top"><def:datafieldcontrol runat="server" id="subu_1ec" databasefield="subu_1ec" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="32px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
 <td style="vertical-align:top"><def:datafieldcontrol runat="server" id="subu_1es" databasefield="subu_1es" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="32px" fieldtextboxwidth="40px"></def:datafieldcontrol></td></tr>

<tr><td><br/></td/></tr>
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="subu_1fp" databasefield="subu_1fp" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="460px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
 <td style="vertical-align:top"><def:datafieldcontrol runat="server" id="subu_1fc" databasefield="subu_1fc" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="32px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
 <td style="vertical-align:top"><def:datafieldcontrol runat="server" id="subu_1fs" databasefield="subu_1fs" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="32px" fieldtextboxwidth="40px"></def:datafieldcontrol></td></tr>

<tr><td><br/></td/></tr>
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="subu_1gp" databasefield="subu_1gp" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="460px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
 <td style="vertical-align:top"><def:datafieldcontrol runat="server" id="subu_1gc" databasefield="subu_1gc" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="32px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
 <td style="vertical-align:top"><def:datafieldcontrol runat="server" id="subu_1gs" databasefield="subu_1gs" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="32px" fieldtextboxwidth="40px"></def:datafieldcontrol></td></tr>

<tr><td><br/></td/></tr>
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="subu_1hp" databasefield="subu_1hp" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="460px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
 <td style="vertical-align:top"><def:datafieldcontrol runat="server" id="subu_1hc" databasefield="subu_1hc" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="32px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
 <td style="vertical-align:top"><def:datafieldcontrol runat="server" id="subu_1hs" databasefield="subu_1hs" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="32px" fieldtextboxwidth="40px"></def:datafieldcontrol></td></tr>

<tr><td><br/></td/></tr>
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="subu_1ip" databasefield="subu_1ip" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="460px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
 <td style="vertical-align:top"><def:datafieldcontrol runat="server" id="subu_1ic" databasefield="subu_1ic" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="32px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
 <td style="vertical-align:top"><def:datafieldcontrol runat="server" id="subu_1is" databasefield="subu_1is" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="32px" fieldtextboxwidth="40px"></def:datafieldcontrol></td></tr>

<tr><td style="vertical-align:top" colspan="3"><def:datafieldcontrol runat="server" id="subu_1i_specify" databasefield="subu_1i_specify" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="460px" fieldtextboxwidth="250px"></def:datafieldcontrol></td>

<tr><td><br/></td/></tr>
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="subu_1jp" databasefield="subu_1jp" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="460px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
 <td style="vertical-align:top"><def:datafieldcontrol runat="server" id="subu_1jc" databasefield="subu_1jc" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="32px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
 <td style="vertical-align:top"><def:datafieldcontrol runat="server" id="subu_1js" databasefield="subu_1js" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="32px" fieldtextboxwidth="40px"></def:datafieldcontrol></td></tr>


		</table>

	<br />
	  <table>
		<tr>
			<td align="right" width="500px"><b><u>P curr</u></b></td>
			<td align="right"><b><u>P msp</u></b></td>
			<td align="right"><b><u>C curr</u></b></td>
			<td align="right"><b><u>C msp</u></b></td>
			<td align="right"><b><u>S curr</u></b></td>
			<td align="right"><b><u>S msp</u></b></td>
		</tr>

		  
<tr>
	<td style="vertical-align:top" colspan="1"><def:datafieldcontrol runat="server" id="subd_1ap_ce"  databasefield="subd_1ap_ce" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="460px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
	<td style="vertical-align:top" colspan="1"><def:datafieldcontrol runat="server" id="subd_1ap_msp" databasefield="subd_1ap_msp" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="4px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
	<td style="vertical-align:top" colspan="1"><def:datafieldcontrol runat="server" id="subd_1ac_ce"  databasefield="subd_1ac_ce" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="40px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
	<td style="vertical-align:top" colspan="1"><def:datafieldcontrol runat="server" id="subd_1ac_msp" databasefield="subd_1ac_msp" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="4px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
	<td style="vertical-align:top" colspan="1"><def:datafieldcontrol runat="server" id="subd_1as_ce"  databasefield="subd_1as_ce" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="40px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
	<td style="vertical-align:top" colspan="1"><def:datafieldcontrol runat="server" id="subd_1as_msp" databasefield="subd_1as_msp" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="4px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
</tr>


<tr>
	<td style="vertical-align:top" colspan="1"><def:datafieldcontrol runat="server" id="subd_1bp_ce"  databasefield="subd_1bp_ce" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="460px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
	<td style="vertical-align:top" colspan="1"><def:datafieldcontrol runat="server" id="subd_1bp_msp" databasefield="subd_1bp_msp" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="4px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
	<td style="vertical-align:top" colspan="1"><def:datafieldcontrol runat="server" id="subd_1bc_ce"  databasefield="subd_1bc_ce" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="40px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
	<td style="vertical-align:top" colspan="1"><def:datafieldcontrol runat="server" id="subd_1bc_msp" databasefield="subd_1bc_msp" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="4px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
	<td style="vertical-align:top" colspan="1"><def:datafieldcontrol runat="server" id="subd_1bs_ce"  databasefield="subd_1bs_ce" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="40px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
	<td style="vertical-align:top" colspan="1"><def:datafieldcontrol runat="server" id="subd_1bs_msp" databasefield="subd_1bs_msp" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="4px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
</tr>
<tr>
	<td style="vertical-align:top" colspan="1"><def:datafieldcontrol runat="server" id="subd_1cp_ce"  databasefield="subd_1cp_ce" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="460px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
	<td style="vertical-align:top" colspan="1"><def:datafieldcontrol runat="server" id="subd_1cp_msp" databasefield="subd_1cp_msp" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="4px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
	<td style="vertical-align:top" colspan="1"><def:datafieldcontrol runat="server" id="subd_1cc_ce"  databasefield="subd_1cc_ce" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="40px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
	<td style="vertical-align:top" colspan="1"><def:datafieldcontrol runat="server" id="subd_1cc_msp" databasefield="subd_1cc_msp" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="4px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
	<td style="vertical-align:top" colspan="1"><def:datafieldcontrol runat="server" id="subd_1cs_ce"  databasefield="subd_1cs_ce" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="40px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
	<td style="vertical-align:top" colspan="1"><def:datafieldcontrol runat="server" id="subd_1cs_msp" databasefield="subd_1cs_msp" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="4px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
</tr>
<tr>
	<td style="vertical-align:top" colspan="1"><def:datafieldcontrol runat="server" id="subd_1dp_ce"  databasefield="subd_1dp_ce" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="460px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
	<td style="vertical-align:top" colspan="1"><def:datafieldcontrol runat="server" id="subd_1dp_msp" databasefield="subd_1dp_msp" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="4px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
	<td style="vertical-align:top" colspan="1"><def:datafieldcontrol runat="server" id="subd_1dc_ce"  databasefield="subd_1dc_ce" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="40px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
	<td style="vertical-align:top" colspan="1"><def:datafieldcontrol runat="server" id="subd_1dc_msp" databasefield="subd_1dc_msp" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="4px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
	<td style="vertical-align:top" colspan="1"><def:datafieldcontrol runat="server" id="subd_1ds_ce"  databasefield="subd_1ds_ce" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="40px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
	<td style="vertical-align:top" colspan="1"><def:datafieldcontrol runat="server" id="subd_1ds_msp" databasefield="subd_1ds_msp" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="4px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
</tr>
<tr>
	<td style="vertical-align:top" colspan="1"><def:datafieldcontrol runat="server" id="subd_1ep_ce"  databasefield="subd_1ep_ce" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="460px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
	<td style="vertical-align:top" colspan="1"><def:datafieldcontrol runat="server" id="subd_1ep_msp" databasefield="subd_1ep_msp" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="4px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
	<td style="vertical-align:top" colspan="1"><def:datafieldcontrol runat="server" id="subd_1ec_ce"  databasefield="subd_1ec_ce" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="40px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
	<td style="vertical-align:top" colspan="1"><def:datafieldcontrol runat="server" id="subd_1ec_msp" databasefield="subd_1ec_msp" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="4px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
	<td style="vertical-align:top" colspan="1"><def:datafieldcontrol runat="server" id="subd_1es_ce"  databasefield="subd_1es_ce" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="40px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
	<td style="vertical-align:top" colspan="1"><def:datafieldcontrol runat="server" id="subd_1es_msp" databasefield="subd_1es_msp" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="4px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
</tr>
<tr>
	<td style="vertical-align:top" colspan="1"><def:datafieldcontrol runat="server" id="subd_1fp_ce"  databasefield="subd_1fp_ce" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="460px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
	<td style="vertical-align:top" colspan="1"><def:datafieldcontrol runat="server" id="subd_1fp_msp" databasefield="subd_1fp_msp" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="4px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
	<td style="vertical-align:top" colspan="1"><def:datafieldcontrol runat="server" id="subd_1fc_ce"  databasefield="subd_1fc_ce" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="40px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
	<td style="vertical-align:top" colspan="1"><def:datafieldcontrol runat="server" id="subd_1fc_msp" databasefield="subd_1fc_msp" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="4px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
	<td style="vertical-align:top" colspan="1"><def:datafieldcontrol runat="server" id="subd_1fs_ce"  databasefield="subd_1fs_ce" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="40px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
	<td style="vertical-align:top" colspan="1"><def:datafieldcontrol runat="server" id="subd_1fs_msp" databasefield="subd_1fs_msp" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="4px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
</tr>
<tr>
	<td style="vertical-align:top" colspan="1"><def:datafieldcontrol runat="server" id="subd_1gp_ce"  databasefield="subd_1gp_ce" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="460px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
	<td style="vertical-align:top" colspan="1"><def:datafieldcontrol runat="server" id="subd_1gp_msp" databasefield="subd_1gp_msp" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="4px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
	<td style="vertical-align:top" colspan="1"><def:datafieldcontrol runat="server" id="subd_1gc_ce"  databasefield="subd_1gc_ce" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="40px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
	<td style="vertical-align:top" colspan="1"><def:datafieldcontrol runat="server" id="subd_1gc_msp" databasefield="subd_1gc_msp" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="4px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
	<td style="vertical-align:top" colspan="1"><def:datafieldcontrol runat="server" id="subd_1gs_ce"  databasefield="subd_1gs_ce" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="40px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
	<td style="vertical-align:top" colspan="1"><def:datafieldcontrol runat="server" id="subd_1gs_msp" databasefield="subd_1gs_msp" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="4px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
</tr>
<tr>
	<td style="vertical-align:top" colspan="1"><def:datafieldcontrol runat="server" id="subd_1hp_ce"  databasefield="subd_1hp_ce" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="460px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
	<td style="vertical-align:top" colspan="1"><def:datafieldcontrol runat="server" id="subd_1hp_msp" databasefield="subd_1hp_msp" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="4px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
	<td style="vertical-align:top" colspan="1"><def:datafieldcontrol runat="server" id="subd_1hc_ce"  databasefield="subd_1hc_ce" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="40px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
	<td style="vertical-align:top" colspan="1"><def:datafieldcontrol runat="server" id="subd_1hc_msp" databasefield="subd_1hc_msp" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="4px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
	<td style="vertical-align:top" colspan="1"><def:datafieldcontrol runat="server" id="subd_1hs_ce"  databasefield="subd_1hs_ce" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="40px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
	<td style="vertical-align:top" colspan="1"><def:datafieldcontrol runat="server" id="subd_1hs_msp" databasefield="subd_1hs_msp" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="4px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
</tr>
<tr>
	<td style="vertical-align:top" colspan="1"><def:datafieldcontrol runat="server" id="subd_1ip_ce"  databasefield="subd_1ip_ce" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="460px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
	<td style="vertical-align:top" colspan="1"><def:datafieldcontrol runat="server" id="subd_1ip_msp" databasefield="subd_1ip_msp" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="4px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
	<td style="vertical-align:top" colspan="1"><def:datafieldcontrol runat="server" id="subd_1ic_ce"  databasefield="subd_1ic_ce" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="40px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
	<td style="vertical-align:top" colspan="1"><def:datafieldcontrol runat="server" id="subd_1ic_msp" databasefield="subd_1ic_msp" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="4px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
	<td style="vertical-align:top" colspan="1"><def:datafieldcontrol runat="server" id="subd_1is_ce"  databasefield="subd_1is_ce" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="40px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
	<td style="vertical-align:top" colspan="1"><def:datafieldcontrol runat="server" id="subd_1is_msp" databasefield="subd_1is_msp" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="4px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
</tr>
<tr>
	<td style="vertical-align:top" colspan="1"><def:datafieldcontrol runat="server" id="subd_1jp_ce"  databasefield="subd_1jp_ce" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="460px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
	<td style="vertical-align:top" colspan="1"><def:datafieldcontrol runat="server" id="subd_1jp_msp" databasefield="subd_1jp_msp" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="4px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
	<td style="vertical-align:top" colspan="1"><def:datafieldcontrol runat="server" id="subd_1jc_ce"  databasefield="subd_1jc_ce" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="40px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
	<td style="vertical-align:top" colspan="1"><def:datafieldcontrol runat="server" id="subd_1jc_msp" databasefield="subd_1jc_msp" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="4px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
	<td style="vertical-align:top" colspan="1"><def:datafieldcontrol runat="server" id="subd_1js_ce"  databasefield="subd_1js_ce" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="40px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
	<td style="vertical-align:top" colspan="1"><def:datafieldcontrol runat="server" id="subd_1js_msp" databasefield="subd_1js_msp" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="4px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
</tr>



	</table>


	<table>
<tr><td align="right"><b><u>P</u>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</b></td><td align="right"><b><u>C</u>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</b></td><td align="right"><b><u>S</u>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</b></td></tr>

<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="subd_2p" databasefield="subd_2p" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="460px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
 <td style="vertical-align:top"><def:datafieldcontrol runat="server" id="subd_2c" databasefield="subd_2c" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="32px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
 <td style="vertical-align:top"><def:datafieldcontrol runat="server" id="subd_2s" databasefield="subd_2s" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="32px" fieldtextboxwidth="40px"></def:datafieldcontrol></td></tr>

<tr><td><br/></td/></tr>
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="ptsd_1ap" databasefield="ptsd_1ap" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="460px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
 <td style="vertical-align:top"><def:datafieldcontrol runat="server" id="ptsd_1ac" databasefield="ptsd_1ac" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="32px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
 <td style="vertical-align:top"><def:datafieldcontrol runat="server" id="ptsd_1as" databasefield="ptsd_1as" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="32px" fieldtextboxwidth="40px"></def:datafieldcontrol></td></tr>

<tr><td><br/></td/></tr>
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="ptsd_1bp" databasefield="ptsd_1bp" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="460px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
 <td style="vertical-align:top"><def:datafieldcontrol runat="server" id="ptsd_1bc" databasefield="ptsd_1bc" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="32px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
 <td style="vertical-align:top"><def:datafieldcontrol runat="server" id="ptsd_1bs" databasefield="ptsd_1bs" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="32px" fieldtextboxwidth="40px"></def:datafieldcontrol></td></tr>

<tr><td><br/></td/></tr>
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="ptsd_1cp" databasefield="ptsd_1cp" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="460px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
 <td style="vertical-align:top"><def:datafieldcontrol runat="server" id="ptsd_1cc" databasefield="ptsd_1cc" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="32px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
 <td style="vertical-align:top"><def:datafieldcontrol runat="server" id="ptsd_1cs" databasefield="ptsd_1cs" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="32px" fieldtextboxwidth="40px"></def:datafieldcontrol></td></tr>

<tr><td><br/></td/></tr>
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="ptsd_1dp" databasefield="ptsd_1dp" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="460px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
 <td style="vertical-align:top"><def:datafieldcontrol runat="server" id="ptsd_1dc" databasefield="ptsd_1dc" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="32px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
 <td style="vertical-align:top"><def:datafieldcontrol runat="server" id="ptsd_1ds" databasefield="ptsd_1ds" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="32px" fieldtextboxwidth="40px"></def:datafieldcontrol></td></tr>

<tr><td><br/></td/></tr>
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="ptsd_1ep" databasefield="ptsd_1ep" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="460px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
 <td style="vertical-align:top"><def:datafieldcontrol runat="server" id="ptsd_1ec" databasefield="ptsd_1ec" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="32px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
 <td style="vertical-align:top"><def:datafieldcontrol runat="server" id="ptsd_1es" databasefield="ptsd_1es" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="32px" fieldtextboxwidth="40px"></def:datafieldcontrol></td></tr>

<tr><td><br/></td/></tr>
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="ptsd_1fp" databasefield="ptsd_1fp" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="460px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
 <td style="vertical-align:top"><def:datafieldcontrol runat="server" id="ptsd_1fc" databasefield="ptsd_1fc" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="32px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
 <td style="vertical-align:top"><def:datafieldcontrol runat="server" id="ptsd_1fs" databasefield="ptsd_1fs" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="32px" fieldtextboxwidth="40px"></def:datafieldcontrol></td></tr>

<tr><td><br/></td/></tr>
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="ptsd_1gp" databasefield="ptsd_1gp" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="460px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
 <td style="vertical-align:top"><def:datafieldcontrol runat="server" id="ptsd_1gc" databasefield="ptsd_1gc" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="32px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
 <td style="vertical-align:top"><def:datafieldcontrol runat="server" id="ptsd_1gs" databasefield="ptsd_1gs" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="32px" fieldtextboxwidth="40px"></def:datafieldcontrol></td></tr>

<tr><td><br/></td/></tr>
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="ptsd_1hp" databasefield="ptsd_1hp" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="460px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
 <td style="vertical-align:top"><def:datafieldcontrol runat="server" id="ptsd_1hc" databasefield="ptsd_1hc" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="32px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
 <td style="vertical-align:top"><def:datafieldcontrol runat="server" id="ptsd_1hs" databasefield="ptsd_1hs" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="32px" fieldtextboxwidth="40px"></def:datafieldcontrol></td></tr>

<tr><td><br/></td/></tr>
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="ptsd_1ip" databasefield="ptsd_1ip" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="460px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
 <td style="vertical-align:top"><def:datafieldcontrol runat="server" id="ptsd_1ic" databasefield="ptsd_1ic" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="32px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
 <td style="vertical-align:top"><def:datafieldcontrol runat="server" id="ptsd_1is" databasefield="ptsd_1is" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="32px" fieldtextboxwidth="40px"></def:datafieldcontrol></td></tr>

<tr><td style="vertical-align:top" colspan="3"><def:datafieldcontrol runat="server" id="ptsd_1i_protserv" databasefield="ptsd_1i_protserv" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="460px" fieldtextboxwidth="250px"></def:datafieldcontrol></td>

<tr><td><br/></td/></tr>
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="ptsd_1jp" databasefield="ptsd_1jp" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="460px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
 <td style="vertical-align:top"><def:datafieldcontrol runat="server" id="ptsd_1jc" databasefield="ptsd_1jc" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="32px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
 <td style="vertical-align:top"><def:datafieldcontrol runat="server" id="ptsd_1js" databasefield="ptsd_1js" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="32px" fieldtextboxwidth="40px"></def:datafieldcontrol></td></tr>

<tr><td><br/></td/></tr>
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="ptsd_1kp" databasefield="ptsd_1kp" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="460px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
 <td style="vertical-align:top"><def:datafieldcontrol runat="server" id="ptsd_1kc" databasefield="ptsd_1kc" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="32px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
 <td style="vertical-align:top"><def:datafieldcontrol runat="server" id="ptsd_1ks" databasefield="ptsd_1ks" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="32px" fieldtextboxwidth="40px"></def:datafieldcontrol></td></tr>

<tr><td><br/></td/></tr>
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="ptsd_1lp" databasefield="ptsd_1lp" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="460px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
 <td style="vertical-align:top"><def:datafieldcontrol runat="server" id="ptsd_1lc" databasefield="ptsd_1lc" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="32px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
 <td style="vertical-align:top"><def:datafieldcontrol runat="server" id="ptsd_1ls" databasefield="ptsd_1ls" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="32px" fieldtextboxwidth="40px"></def:datafieldcontrol></td></tr>

<tr><td><br/></td/></tr>
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="ptsd_1mp" databasefield="ptsd_1mp" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="460px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
 <td style="vertical-align:top"><def:datafieldcontrol runat="server" id="ptsd_1mc" databasefield="ptsd_1mc" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="32px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
 <td style="vertical-align:top"><def:datafieldcontrol runat="server" id="ptsd_1ms" databasefield="ptsd_1ms" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="32px" fieldtextboxwidth="40px"></def:datafieldcontrol></td></tr>


   
</table>

<br/>
<br/>

<table>
	<tr>
		<td align="right">Parent CE</td>
		<td align="right">Parent MSP</td>
		<td align="right">Child CE</td>
		<td align="right">Child MSP</td>
		<td align="right">Summary CE</td>
		<td align="right">Summary MSP</td>
	</tr>
<tr>
 <td style="vertical-align:top"><def:datafieldcontrol runat="server" id="ptsd_1p_ce"  databasefield="ptsd_1p_ce"  isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="460px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
 <td style="vertical-align:top"><def:datafieldcontrol runat="server" id="ptsd_1p_msp" databasefield="ptsd_1p_msp" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="32px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
 <td style="vertical-align:top"><def:datafieldcontrol runat="server" id="ptsd_1c_ce"  databasefield="ptsd_1c_ce"  isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="32px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
 <td style="vertical-align:top"><def:datafieldcontrol runat="server" id="ptsd_1c_msp" databasefield="ptsd_1c_msp" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="32px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
 <td style="vertical-align:top"><def:datafieldcontrol runat="server" id="ptsd_1s_ce"  databasefield="ptsd_1s_ce"  isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="32px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
 <td style="vertical-align:top"><def:datafieldcontrol runat="server" id="ptsd_1s_msp" databasefield="ptsd_1s_msp" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="32px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
 </tr>

<tr>
 <td style="vertical-align:top"><def:datafieldcontrol runat="server" id="ptsd_2p_ce"  databasefield="ptsd_2p_ce"  isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="460px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
 <td style="vertical-align:top"><def:datafieldcontrol runat="server" id="ptsd_2p_msp" databasefield="ptsd_2p_msp" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="32px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
 <td style="vertical-align:top"><def:datafieldcontrol runat="server" id="ptsd_2c_ce"  databasefield="ptsd_2c_ce"  isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="32px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
 <td style="vertical-align:top"><def:datafieldcontrol runat="server" id="ptsd_2c_msp" databasefield="ptsd_2c_msp" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="32px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
 <td style="vertical-align:top"><def:datafieldcontrol runat="server" id="ptsd_2s_ce"  databasefield="ptsd_2s_ce"  isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="32px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
 <td style="vertical-align:top"><def:datafieldcontrol runat="server" id="ptsd_2s_msp" databasefield="ptsd_2s_msp" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="32px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
 </tr>

<tr>
 <td style="vertical-align:top"><def:datafieldcontrol runat="server" id="ptsd_3p_ce"  databasefield="ptsd_3p_ce"  isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="460px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
 <td style="vertical-align:top"><def:datafieldcontrol runat="server" id="ptsd_3p_msp" databasefield="ptsd_3p_msp" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="32px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
 <td style="vertical-align:top"><def:datafieldcontrol runat="server" id="ptsd_3c_ce"  databasefield="ptsd_3c_ce"  isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="32px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
 <td style="vertical-align:top"><def:datafieldcontrol runat="server" id="ptsd_3c_msp" databasefield="ptsd_3c_msp" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="32px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
 <td style="vertical-align:top"><def:datafieldcontrol runat="server" id="ptsd_3s_ce"  databasefield="ptsd_3s_ce"  isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="32px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
 <td style="vertical-align:top"><def:datafieldcontrol runat="server" id="ptsd_3s_msp" databasefield="ptsd_3s_msp" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="32px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
 </tr>
<tr>
 <td style="vertical-align:top"><def:datafieldcontrol runat="server" id="ptsd_4p_ce"  databasefield="ptsd_4p_ce"  isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="460px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
 <td style="vertical-align:top"><def:datafieldcontrol runat="server" id="ptsd_4p_msp" databasefield="ptsd_4p_msp" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="32px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
 <td style="vertical-align:top"><def:datafieldcontrol runat="server" id="ptsd_4c_ce"  databasefield="ptsd_4c_ce"  isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="32px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
 <td style="vertical-align:top"><def:datafieldcontrol runat="server" id="ptsd_4c_msp" databasefield="ptsd_4c_msp" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="32px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
 <td style="vertical-align:top"><def:datafieldcontrol runat="server" id="ptsd_4s_ce"  databasefield="ptsd_4s_ce"  isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="32px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
 <td style="vertical-align:top"><def:datafieldcontrol runat="server" id="ptsd_4s_msp" databasefield="ptsd_4s_msp" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="32px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
 </tr>
<tr>
 <td style="vertical-align:top"><def:datafieldcontrol runat="server" id="ptsd_5p_ce"  databasefield="ptsd_5p_ce"  isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="460px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
 <td style="vertical-align:top"><def:datafieldcontrol runat="server" id="ptsd_5p_msp" databasefield="ptsd_5p_msp" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="32px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
 <td style="vertical-align:top"><def:datafieldcontrol runat="server" id="ptsd_5c_ce"  databasefield="ptsd_5c_ce"  isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="32px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
 <td style="vertical-align:top"><def:datafieldcontrol runat="server" id="ptsd_5c_msp" databasefield="ptsd_5c_msp" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="32px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
 <td style="vertical-align:top"><def:datafieldcontrol runat="server" id="ptsd_5s_ce"  databasefield="ptsd_5s_ce"  isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="32px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
 <td style="vertical-align:top"><def:datafieldcontrol runat="server" id="ptsd_5s_msp" databasefield="ptsd_5s_msp" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="32px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
 </tr>
</table>
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
