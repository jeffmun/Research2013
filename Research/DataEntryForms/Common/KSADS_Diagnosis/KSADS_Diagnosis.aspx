<%@ register tagprefix="def" namespace="DataEntryFramework3" %> 
<%@ page language="c#" masterpagefile="~/UWAC.master"  title="KSADS Dx data entry" %>
<asp:content id="content1" contentplaceholderid="obodyplaceholder" runat="server">
<link rel="stylesheet" type="text/css" href="/research/dataentry/dataentryform.css" />
<def:dataentrycontroller id="dataentrycontroller1" runat="server" databasetable="ALL_KSADS_Diagnosis" primarykeyfield="kdx_pk">
</def:dataentrycontroller>
   <asp:scriptmanager id="scriptmanager1" runat="server">    </asp:scriptmanager>



<asp:updatepanel id="updatepanel1" runat="server">
  <contenttemplate>
<table>
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="id" databasefield="id" isinsertfield="true" fieldlabelwidth="300px" fieldtextboxwidth="250px" fieldtextboxmaxlength="15"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="indexnum" databasefield="indexnum" isinsertfield="true" fieldtextboxtextdefault="1" fieldlabelwidth="300px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="kdx_date" databasefield="kdx_date" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="300px" formatstring="{0:d}" ></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="kdx_agemo" databasefield="kdx_agemo" isreadonly="true" renderreadonlyasdiv="true" fieldlabelwidth="300px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="kdx_exmnr" databasefield="kdx_exmnr" isentryfield="true" isdoubleentryfield="false" fieldlabelwidth="300px" fieldtextboxwidth="250px" fieldtextboxmaxlength="20"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="kdx_resp" databasefield="kdx_resp" isentryfield="true" isdoubleentryfield="false" fieldlabelwidth="300px" fieldtextboxwidth="250px" fieldtextboxmaxlength="50"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="kdx_cmnt" databasefield="kdx_cmnt" isentryfield="true" isdoubleentryfield="false" fieldlabelwidth="300px" fieldtextboxwidth="400px" fieldtextboxheight="40px" fieldtextboxtextmode="multiline" fieldtextboxmaxlength="250"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="kdx_scrmsg" databasefield="kdx_scrmsg" isreadonly="true" renderreadonlyasdiv="true" fieldlabelwidth="300px" fieldtextboxwidth="400px" fieldtextboxheight="40px" fieldtextboxtextmode="multiline" fieldtextboxmaxlength="250"></def:datafieldcontrol></td>
<td></td></tr>
 </table>

      <br /><br />




<table>
    <tr>
        <td>
                  <table>
          <tr><td align="right" ><b><u>MSP Dx</u></b></td><td align="right" ><b><u>MSP Age<br/>Onset (yrs)</u></b></td></tr>
          <tr><td width="360px" style="vertical-align:top" align="right"> <def:ValueSetLabel ID="v1" runat="server" DatabaseField="kdx01mspdx" /></td><td></td></tr>
          <tr>
              <td width="360px" style="vertical-align:top">
<def:datafieldcontrol runat="server" id="kdx01mspdx" databasefield="kdx01mspdx" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="300px" fieldtextboxwidth="50px" ></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="kdx02mspdx" databasefield="kdx02mspdx" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="300px" fieldtextboxwidth="50px" ></def:datafieldcontrol> 
<def:datafieldcontrol runat="server" id="kdx03mspdx" databasefield="kdx03mspdx" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="300px" fieldtextboxwidth="50px" ></def:datafieldcontrol> 
<def:datafieldcontrol runat="server" id="kdx04mspdx" databasefield="kdx04mspdx" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="300px" fieldtextboxwidth="50px" ></def:datafieldcontrol> 
<def:datafieldcontrol runat="server" id="kdx05mspdx" databasefield="kdx05mspdx" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="300px" fieldtextboxwidth="50px" ></def:datafieldcontrol> 
<def:datafieldcontrol runat="server" id="kdx06mspdx" databasefield="kdx06mspdx" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="300px" fieldtextboxwidth="50px" ></def:datafieldcontrol> 
<def:datafieldcontrol runat="server" id="kdx07mspdx" databasefield="kdx07mspdx" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="300px" fieldtextboxwidth="50px" ></def:datafieldcontrol> 
<def:datafieldcontrol runat="server" id="kdx08mspdx" databasefield="kdx08mspdx" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="300px" fieldtextboxwidth="50px" ></def:datafieldcontrol> 
<def:datafieldcontrol runat="server" id="kdx09mspdx" databasefield="kdx09mspdx" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="300px" fieldtextboxwidth="50px" ></def:datafieldcontrol> 
<def:datafieldcontrol runat="server" id="kdx10mspdx" databasefield="kdx10mspdx" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="300px" fieldtextboxwidth="50px" ></def:datafieldcontrol> 
<def:datafieldcontrol runat="server" id="kdx11mspdx" databasefield="kdx11mspdx" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="300px" fieldtextboxwidth="50px" ></def:datafieldcontrol> 
<def:datafieldcontrol runat="server" id="kdx12mspdx" databasefield="kdx12mspdx" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="300px" fieldtextboxwidth="50px" ></def:datafieldcontrol> 
<def:datafieldcontrol runat="server" id="kdx13mspdx" databasefield="kdx13mspdx" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="300px" fieldtextboxwidth="50px" ></def:datafieldcontrol> 
<def:datafieldcontrol runat="server" id="kdx14mspdx" databasefield="kdx14mspdx" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="300px" fieldtextboxwidth="50px" ></def:datafieldcontrol> 
<def:datafieldcontrol runat="server" id="kdx15mspdx" databasefield="kdx15mspdx" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="300px" fieldtextboxwidth="50px" ></def:datafieldcontrol> 
<def:datafieldcontrol runat="server" id="kdx16mspdx" databasefield="kdx16mspdx" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="300px" fieldtextboxwidth="50px" ></def:datafieldcontrol> 
<def:datafieldcontrol runat="server" id="kdx17mspdx" databasefield="kdx17mspdx" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="300px" fieldtextboxwidth="50px" ></def:datafieldcontrol> 
<def:datafieldcontrol runat="server" id="kdx18mspdx" databasefield="kdx18mspdx" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="300px" fieldtextboxwidth="50px" ></def:datafieldcontrol> 

              </td>
              <td width="100px" style="vertical-align:top">
<def:datafieldcontrol runat="server" id="kdx01mspage" databasefield="kdx01mspage" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="40px" fieldtextboxwidth="50px" ></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="kdx02mspage" databasefield="kdx02mspage" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="40px" fieldtextboxwidth="50px" ></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="kdx03mspage" databasefield="kdx03mspage" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="40px" fieldtextboxwidth="50px" ></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="kdx04mspage" databasefield="kdx04mspage" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="40px" fieldtextboxwidth="50px" ></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="kdx05mspage" databasefield="kdx05mspage" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="40px" fieldtextboxwidth="50px" ></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="kdx06mspage" databasefield="kdx06mspage" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="40px" fieldtextboxwidth="50px" ></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="kdx07mspage" databasefield="kdx07mspage" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="40px" fieldtextboxwidth="50px" ></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="kdx08mspage" databasefield="kdx08mspage" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="40px" fieldtextboxwidth="50px" ></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="kdx09mspage" databasefield="kdx09mspage" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="40px" fieldtextboxwidth="50px" ></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="kdx10mspage" databasefield="kdx10mspage" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="40px" fieldtextboxwidth="50px" ></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="kdx11mspage" databasefield="kdx11mspage" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="40px" fieldtextboxwidth="50px" ></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="kdx12mspage" databasefield="kdx12mspage" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="40px" fieldtextboxwidth="50px" ></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="kdx13mspage" databasefield="kdx13mspage" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="40px" fieldtextboxwidth="50px" ></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="kdx14mspage" databasefield="kdx14mspage" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="40px" fieldtextboxwidth="50px" ></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="kdx15mspage" databasefield="kdx15mspage" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="40px" fieldtextboxwidth="50px" ></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="kdx16mspage" databasefield="kdx16mspage" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="40px" fieldtextboxwidth="50px" ></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="kdx17mspage" databasefield="kdx17mspage" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="40px" fieldtextboxwidth="50px" ></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="kdx18mspage" databasefield="kdx18mspage" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="40px" fieldtextboxwidth="50px" ></def:datafieldcontrol>

              </td>
          </tr>
      </table>
        </td>
        <td width="40px"></td>
        <td>
                  <table>
          <tr><td align="right" ><b><u>Current Dx</u></b></td><td align="right" ><b><u>Current Age<br/>Onset (yrs)</u></b></td></tr>
          <tr><td width="360px" style="vertical-align:top" align="right"> <def:ValueSetLabel ID="ValueSetLabel1" runat="server" DatabaseField="kdx01curdx" /></td><td></td></tr>
          <tr>
              <td width="360px" style="vertical-align:top">
<def:datafieldcontrol runat="server" id="kdx01curdx" databasefield="kdx01curdx" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="300px" fieldtextboxwidth="50px" ></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="kdx02curdx" databasefield="kdx02curdx" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="300px" fieldtextboxwidth="50px" ></def:datafieldcontrol> 
<def:datafieldcontrol runat="server" id="kdx03curdx" databasefield="kdx03curdx" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="300px" fieldtextboxwidth="50px" ></def:datafieldcontrol> 
<def:datafieldcontrol runat="server" id="kdx04curdx" databasefield="kdx04curdx" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="300px" fieldtextboxwidth="50px" ></def:datafieldcontrol> 
<def:datafieldcontrol runat="server" id="kdx05curdx" databasefield="kdx05curdx" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="300px" fieldtextboxwidth="50px" ></def:datafieldcontrol> 
<def:datafieldcontrol runat="server" id="kdx06curdx" databasefield="kdx06curdx" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="300px" fieldtextboxwidth="50px" ></def:datafieldcontrol> 
<def:datafieldcontrol runat="server" id="kdx07curdx" databasefield="kdx07curdx" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="300px" fieldtextboxwidth="50px" ></def:datafieldcontrol> 
<def:datafieldcontrol runat="server" id="kdx08curdx" databasefield="kdx08curdx" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="300px" fieldtextboxwidth="50px" ></def:datafieldcontrol> 
<def:datafieldcontrol runat="server" id="kdx09curdx" databasefield="kdx09curdx" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="300px" fieldtextboxwidth="50px" ></def:datafieldcontrol> 
<def:datafieldcontrol runat="server" id="kdx10curdx" databasefield="kdx10curdx" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="300px" fieldtextboxwidth="50px" ></def:datafieldcontrol> 
<def:datafieldcontrol runat="server" id="kdx11curdx" databasefield="kdx11curdx" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="300px" fieldtextboxwidth="50px" ></def:datafieldcontrol> 
<def:datafieldcontrol runat="server" id="kdx12curdx" databasefield="kdx12curdx" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="300px" fieldtextboxwidth="50px" ></def:datafieldcontrol> 
<def:datafieldcontrol runat="server" id="kdx13curdx" databasefield="kdx13curdx" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="300px" fieldtextboxwidth="50px" ></def:datafieldcontrol> 
<def:datafieldcontrol runat="server" id="kdx14curdx" databasefield="kdx14curdx" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="300px" fieldtextboxwidth="50px" ></def:datafieldcontrol> 
<def:datafieldcontrol runat="server" id="kdx15curdx" databasefield="kdx15curdx" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="300px" fieldtextboxwidth="50px" ></def:datafieldcontrol> 
<def:datafieldcontrol runat="server" id="kdx16curdx" databasefield="kdx16curdx" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="300px" fieldtextboxwidth="50px" ></def:datafieldcontrol> 
<def:datafieldcontrol runat="server" id="kdx17curdx" databasefield="kdx17curdx" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="300px" fieldtextboxwidth="50px" ></def:datafieldcontrol> 
<def:datafieldcontrol runat="server" id="kdx18curdx" databasefield="kdx18curdx" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="300px" fieldtextboxwidth="50px" ></def:datafieldcontrol> 

              </td>
              <td width="100px" style="vertical-align:top">
<def:datafieldcontrol runat="server" id="kdx01curage" databasefield="kdx01curage" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="40px" fieldtextboxwidth="50px" ></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="kdx02curage" databasefield="kdx02curage" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="40px" fieldtextboxwidth="50px" ></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="kdx03curage" databasefield="kdx03curage" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="40px" fieldtextboxwidth="50px" ></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="kdx04curage" databasefield="kdx04curage" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="40px" fieldtextboxwidth="50px" ></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="kdx05curage" databasefield="kdx05curage" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="40px" fieldtextboxwidth="50px" ></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="kdx06curage" databasefield="kdx06curage" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="40px" fieldtextboxwidth="50px" ></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="kdx07curage" databasefield="kdx07curage" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="40px" fieldtextboxwidth="50px" ></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="kdx08curage" databasefield="kdx08curage" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="40px" fieldtextboxwidth="50px" ></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="kdx09curage" databasefield="kdx09curage" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="40px" fieldtextboxwidth="50px" ></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="kdx10curage" databasefield="kdx10curage" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="40px" fieldtextboxwidth="50px" ></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="kdx11curage" databasefield="kdx11curage" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="40px" fieldtextboxwidth="50px" ></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="kdx12curage" databasefield="kdx12curage" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="40px" fieldtextboxwidth="50px" ></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="kdx13curage" databasefield="kdx13curage" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="40px" fieldtextboxwidth="50px" ></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="kdx14curage" databasefield="kdx14curage" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="40px" fieldtextboxwidth="50px" ></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="kdx15curage" databasefield="kdx15curage" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="40px" fieldtextboxwidth="50px" ></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="kdx16curage" databasefield="kdx16curage" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="40px" fieldtextboxwidth="50px" ></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="kdx17curage" databasefield="kdx17curage" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="40px" fieldtextboxwidth="50px" ></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="kdx18curage" databasefield="kdx18curage" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="40px" fieldtextboxwidth="50px" ></def:datafieldcontrol>

              </td>
          </tr>
      </table>
        </td>
    </tr>
</table>


<br />
<br />
<br />

<table>
    <tr>
        <td>
            
      <table>
          <tr><td align="right" ><b><u>MSP Dx</u></b></td><td align="right" ><b><u>MSP Age<br/>Onset (yrs)</u></b></td></tr>
          <tr>
              <td width="360px" style="vertical-align:top">
<def:datafieldcontrol runat="server" id="kdx19mspdx" databasefield="kdx19mspdx" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="300px" fieldtextboxwidth="50px" ></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="kdx20mspdx" databasefield="kdx20mspdx" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="300px" fieldtextboxwidth="50px" ></def:datafieldcontrol> 
<def:datafieldcontrol runat="server" id="kdx21mspdx" databasefield="kdx21mspdx" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="300px" fieldtextboxwidth="50px" ></def:datafieldcontrol> 
<def:datafieldcontrol runat="server" id="kdx22mspdx" databasefield="kdx22mspdx" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="300px" fieldtextboxwidth="50px" ></def:datafieldcontrol> 
<def:datafieldcontrol runat="server" id="kdx23mspdx" databasefield="kdx23mspdx" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="300px" fieldtextboxwidth="50px" ></def:datafieldcontrol> 
<def:datafieldcontrol runat="server" id="kdx24mspdx" databasefield="kdx24mspdx" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="300px" fieldtextboxwidth="50px" ></def:datafieldcontrol> 
<def:datafieldcontrol runat="server" id="kdx25mspdx" databasefield="kdx25mspdx" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="300px" fieldtextboxwidth="50px" ></def:datafieldcontrol> 
<def:datafieldcontrol runat="server" id="kdx26mspdx" databasefield="kdx26mspdx" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="300px" fieldtextboxwidth="50px" ></def:datafieldcontrol> 
<def:datafieldcontrol runat="server" id="kdx27mspdx" databasefield="kdx27mspdx" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="300px" fieldtextboxwidth="50px" ></def:datafieldcontrol> 
<def:datafieldcontrol runat="server" id="kdx28mspdx" databasefield="kdx28mspdx" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="300px" fieldtextboxwidth="50px" ></def:datafieldcontrol> 
<def:datafieldcontrol runat="server" id="kdx29mspdx" databasefield="kdx29mspdx" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="300px" fieldtextboxwidth="50px" ></def:datafieldcontrol> 
<def:datafieldcontrol runat="server" id="kdx30mspdx" databasefield="kdx30mspdx" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="300px" fieldtextboxwidth="50px" ></def:datafieldcontrol> 
<def:datafieldcontrol runat="server" id="kdx31mspdx" databasefield="kdx31mspdx" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="300px" fieldtextboxwidth="50px" ></def:datafieldcontrol> 
<def:datafieldcontrol runat="server" id="kdx32mspdx" databasefield="kdx32mspdx" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="300px" fieldtextboxwidth="50px" ></def:datafieldcontrol> 
<def:datafieldcontrol runat="server" id="kdx33mspdx" databasefield="kdx33mspdx" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="300px" fieldtextboxwidth="50px" ></def:datafieldcontrol> 
<def:datafieldcontrol runat="server" id="kdx34mspdx" databasefield="kdx34mspdx" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="300px" fieldtextboxwidth="50px" ></def:datafieldcontrol> 
<def:datafieldcontrol runat="server" id="kdx35mspdx" databasefield="kdx35mspdx" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="300px" fieldtextboxwidth="50px" ></def:datafieldcontrol> 
<def:datafieldcontrol runat="server" id="kdx36mspdx" databasefield="kdx36mspdx" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="300px" fieldtextboxwidth="50px" ></def:datafieldcontrol> 

              </td>
              <td width="100px" style="vertical-align:top">
<def:datafieldcontrol runat="server" id="kdx19mspage" databasefield="kdx19mspage" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="40px" fieldtextboxwidth="50px" ></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="kdx20mspage" databasefield="kdx20mspage" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="40px" fieldtextboxwidth="50px" ></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="kdx21mspage" databasefield="kdx21mspage" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="40px" fieldtextboxwidth="50px" ></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="kdx22mspage" databasefield="kdx22mspage" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="40px" fieldtextboxwidth="50px" ></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="kdx23mspage" databasefield="kdx23mspage" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="40px" fieldtextboxwidth="50px" ></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="kdx24mspage" databasefield="kdx24mspage" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="40px" fieldtextboxwidth="50px" ></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="kdx25mspage" databasefield="kdx25mspage" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="40px" fieldtextboxwidth="50px" ></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="kdx26mspage" databasefield="kdx26mspage" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="40px" fieldtextboxwidth="50px" ></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="kdx27mspage" databasefield="kdx27mspage" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="40px" fieldtextboxwidth="50px" ></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="kdx28mspage" databasefield="kdx28mspage" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="40px" fieldtextboxwidth="50px" ></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="kdx29mspage" databasefield="kdx29mspage" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="40px" fieldtextboxwidth="50px" ></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="kdx30mspage" databasefield="kdx30mspage" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="40px" fieldtextboxwidth="50px" ></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="kdx31mspage" databasefield="kdx31mspage" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="40px" fieldtextboxwidth="50px" ></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="kdx32mspage" databasefield="kdx32mspage" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="40px" fieldtextboxwidth="50px" ></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="kdx33mspage" databasefield="kdx33mspage" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="40px" fieldtextboxwidth="50px" ></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="kdx34mspage" databasefield="kdx34mspage" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="40px" fieldtextboxwidth="50px" ></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="kdx35mspage" databasefield="kdx35mspage" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="40px" fieldtextboxwidth="50px" ></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="kdx36mspage" databasefield="kdx36mspage" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="40px" fieldtextboxwidth="50px" ></def:datafieldcontrol>

              </td>
          </tr>
      </table>
        </td>
                <td width="40px"></td>

        <td>
                  <table>
          <tr><td align="right" ><b><u>Current Dx</u></b></td><td align="right" ><b><u>Current Age<br/>Onset (yrs)</u></b></td></tr>
          <tr>
              <td width="360px" style="vertical-align:top">
<def:datafieldcontrol runat="server" id="kdx19curdx" databasefield="kdx19curdx" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="300px" fieldtextboxwidth="50px" ></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="kdx20curdx" databasefield="kdx20curdx" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="300px" fieldtextboxwidth="50px" ></def:datafieldcontrol> 
<def:datafieldcontrol runat="server" id="kdx21curdx" databasefield="kdx21curdx" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="300px" fieldtextboxwidth="50px" ></def:datafieldcontrol> 
<def:datafieldcontrol runat="server" id="kdx22curdx" databasefield="kdx22curdx" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="300px" fieldtextboxwidth="50px" ></def:datafieldcontrol> 
<def:datafieldcontrol runat="server" id="kdx23curdx" databasefield="kdx23curdx" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="300px" fieldtextboxwidth="50px" ></def:datafieldcontrol> 
<def:datafieldcontrol runat="server" id="kdx24curdx" databasefield="kdx24curdx" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="300px" fieldtextboxwidth="50px" ></def:datafieldcontrol> 
<def:datafieldcontrol runat="server" id="kdx25curdx" databasefield="kdx25curdx" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="300px" fieldtextboxwidth="50px" ></def:datafieldcontrol> 
<def:datafieldcontrol runat="server" id="kdx26curdx" databasefield="kdx26curdx" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="300px" fieldtextboxwidth="50px" ></def:datafieldcontrol> 
<def:datafieldcontrol runat="server" id="kdx27curdx" databasefield="kdx27curdx" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="300px" fieldtextboxwidth="50px" ></def:datafieldcontrol> 
<def:datafieldcontrol runat="server" id="kdx28curdx" databasefield="kdx28curdx" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="300px" fieldtextboxwidth="50px" ></def:datafieldcontrol> 
<def:datafieldcontrol runat="server" id="kdx29curdx" databasefield="kdx29curdx" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="300px" fieldtextboxwidth="50px" ></def:datafieldcontrol> 
<def:datafieldcontrol runat="server" id="kdx30curdx" databasefield="kdx30curdx" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="300px" fieldtextboxwidth="50px" ></def:datafieldcontrol> 
<def:datafieldcontrol runat="server" id="kdx31curdx" databasefield="kdx31curdx" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="300px" fieldtextboxwidth="50px" ></def:datafieldcontrol> 
<def:datafieldcontrol runat="server" id="kdx32curdx" databasefield="kdx32curdx" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="300px" fieldtextboxwidth="50px" ></def:datafieldcontrol> 
<def:datafieldcontrol runat="server" id="kdx33curdx" databasefield="kdx33curdx" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="300px" fieldtextboxwidth="50px" ></def:datafieldcontrol> 
<def:datafieldcontrol runat="server" id="kdx34curdx" databasefield="kdx34curdx" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="300px" fieldtextboxwidth="50px" ></def:datafieldcontrol> 
<def:datafieldcontrol runat="server" id="kdx35curdx" databasefield="kdx35curdx" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="300px" fieldtextboxwidth="50px" ></def:datafieldcontrol> 
<def:datafieldcontrol runat="server" id="kdx36curdx" databasefield="kdx36curdx" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="300px" fieldtextboxwidth="50px" ></def:datafieldcontrol> 

              </td>
              <td width="100px" style="vertical-align:top">
<def:datafieldcontrol runat="server" id="kdx19curage" databasefield="kdx19curage" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="40px" fieldtextboxwidth="50px" ></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="kdx20curage" databasefield="kdx20curage" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="40px" fieldtextboxwidth="50px" ></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="kdx21curage" databasefield="kdx21curage" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="40px" fieldtextboxwidth="50px" ></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="kdx22curage" databasefield="kdx22curage" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="40px" fieldtextboxwidth="50px" ></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="kdx23curage" databasefield="kdx23curage" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="40px" fieldtextboxwidth="50px" ></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="kdx24curage" databasefield="kdx24curage" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="40px" fieldtextboxwidth="50px" ></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="kdx25curage" databasefield="kdx25curage" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="40px" fieldtextboxwidth="50px" ></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="kdx26curage" databasefield="kdx26curage" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="40px" fieldtextboxwidth="50px" ></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="kdx27curage" databasefield="kdx27curage" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="40px" fieldtextboxwidth="50px" ></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="kdx28curage" databasefield="kdx28curage" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="40px" fieldtextboxwidth="50px" ></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="kdx29curage" databasefield="kdx29curage" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="40px" fieldtextboxwidth="50px" ></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="kdx30curage" databasefield="kdx30curage" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="40px" fieldtextboxwidth="50px" ></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="kdx31curage" databasefield="kdx31curage" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="40px" fieldtextboxwidth="50px" ></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="kdx32curage" databasefield="kdx32curage" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="40px" fieldtextboxwidth="50px" ></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="kdx33curage" databasefield="kdx33curage" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="40px" fieldtextboxwidth="50px" ></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="kdx34curage" databasefield="kdx34curage" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="40px" fieldtextboxwidth="50px" ></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="kdx35curage" databasefield="kdx35curage" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="40px" fieldtextboxwidth="50px" ></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="kdx36curage" databasefield="kdx36curage" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="40px" fieldtextboxwidth="50px" ></def:datafieldcontrol>

              </td>
          </tr>
      </table>

        </td>
    </tr>
</table>

<br />
<br />
<br />










      <table>
          <tr>
              <td>
                  
            <table>
                <tr><td align="right" ><b><u>MSP Dx</u></b></td><td align="right" ><b><u>MSP Age<br/>Onset (yrs)</u></b></td></tr>
                <tr>
                <td width="360px" style="vertical-align:top"  align="right">
                    <def:datafieldcontrol runat="server" id="kdx37mspdx" databasefield="kdx37mspdx" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="300px" fieldtextboxwidth="50px" ></def:datafieldcontrol>
                    <def:datafieldcontrol runat="server" id="kdx37msptype" databasefield="kdx37msptype" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="300px" fieldtextboxwidth="50px" ></def:datafieldcontrol>
                    <def:ValueSetLabel ID="vkdx37msptype" runat="server" DatabaseField="kdx37msptype"></def:ValueSetLabel>
                </td>
                <td style="vertical-align:top">
                    <def:datafieldcontrol runat="server" id="kdx37mspage" databasefield="kdx37mspage" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="40px" fieldtextboxwidth="50px" ></def:datafieldcontrol>
                </td>

                    </tr>
            </table>

                  </td>
              <td width="40px"></td>

              <td>
                              <table>
                <tr><td align="right" ><b><u>Current Dx</u></b></td><td align="right" ><b><u>Current Age<br/>Onset (yrs)</u></b></td></tr>
                <tr>
                <td width="360px" style="vertical-align:top" align="right">
                    <def:datafieldcontrol runat="server" id="kdx37curdx" databasefield="kdx37curdx" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="300px" fieldtextboxwidth="50px" ></def:datafieldcontrol>
                    <def:datafieldcontrol runat="server" id="kdx37curtype" databasefield="kdx37curtype" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="300px" fieldtextboxwidth="50px" ></def:datafieldcontrol>
                    <def:ValueSetLabel ID="vkdx37curtype" runat="server" DatabaseField="kdx37curtype"></def:ValueSetLabel>
                </td>
                <td style="vertical-align:top">
                    <def:datafieldcontrol runat="server" id="vkdx37curage" databasefield="kdx37curage" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="40px" fieldtextboxwidth="50px" ></def:datafieldcontrol>
                </td>

                    </tr>
            </table>
              </td>
              </tr>
          </table>


<br />



      <table>
          <tr>
              <td>
                  
      <table>
          <tr><td align="right" ><b><u>MSP Dx</u></b></td><td align="right" ><b><u>MSP Age<br/>Onset (yrs)</u></b></td></tr>
          <tr>
              <td width="360px" style="vertical-align:top">
<def:datafieldcontrol runat="server" id="kdx38mspdx" databasefield="kdx38mspdx" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="300px" fieldtextboxwidth="50px" ></def:datafieldcontrol> 
<def:datafieldcontrol runat="server" id="kdx39mspdx" databasefield="kdx39mspdx" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="300px" fieldtextboxwidth="50px" ></def:datafieldcontrol> 
<def:datafieldcontrol runat="server" id="kdx40mspdx" databasefield="kdx40mspdx" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="300px" fieldtextboxwidth="50px" ></def:datafieldcontrol> 
<def:datafieldcontrol runat="server" id="kdx41mspdx" databasefield="kdx41mspdx" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="300px" fieldtextboxwidth="50px" ></def:datafieldcontrol> 
<def:datafieldcontrol runat="server" id="kdx42mspdx" databasefield="kdx42mspdx" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="300px" fieldtextboxwidth="50px" ></def:datafieldcontrol> 
<def:datafieldcontrol runat="server" id="kdx43mspdx" databasefield="kdx43mspdx" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="300px" fieldtextboxwidth="50px" ></def:datafieldcontrol> 
<def:datafieldcontrol runat="server" id="kdx44mspdx" databasefield="kdx44mspdx" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="300px" fieldtextboxwidth="50px" ></def:datafieldcontrol> 
<def:datafieldcontrol runat="server" id="kdx45mspdx" databasefield="kdx45mspdx" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="300px" fieldtextboxwidth="50px" ></def:datafieldcontrol> 
<def:datafieldcontrol runat="server" id="kdx46mspdx" databasefield="kdx46mspdx" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="300px" fieldtextboxwidth="50px" ></def:datafieldcontrol> 
<def:datafieldcontrol runat="server" id="kdx47mspdx" databasefield="kdx47mspdx" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="300px" fieldtextboxwidth="50px" ></def:datafieldcontrol> 
<def:datafieldcontrol runat="server" id="kdx48mspdx" databasefield="kdx48mspdx" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="300px" fieldtextboxwidth="50px" ></def:datafieldcontrol> 
<def:datafieldcontrol runat="server" id="kdx49mspdx" databasefield="kdx49mspdx" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="300px" fieldtextboxwidth="50px" ></def:datafieldcontrol> 
<def:datafieldcontrol runat="server" id="kdx50mspdx" databasefield="kdx50mspdx" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="300px" fieldtextboxwidth="50px" ></def:datafieldcontrol> 
<def:datafieldcontrol runat="server" id="kdx51mspdx" databasefield="kdx51mspdx" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="300px" fieldtextboxwidth="50px" ></def:datafieldcontrol> 

              </td>
              <td width="100px" style="vertical-align:top">
<def:datafieldcontrol runat="server" id="kdx38mspage" databasefield="kdx38mspage" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="40px" fieldtextboxwidth="50px" ></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="kdx39mspage" databasefield="kdx39mspage" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="40px" fieldtextboxwidth="50px" ></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="kdx40mspage" databasefield="kdx40mspage" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="40px" fieldtextboxwidth="50px" ></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="kdx41mspage" databasefield="kdx41mspage" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="40px" fieldtextboxwidth="50px" ></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="kdx42mspage" databasefield="kdx42mspage" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="40px" fieldtextboxwidth="50px" ></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="kdx43mspage" databasefield="kdx43mspage" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="40px" fieldtextboxwidth="50px" ></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="kdx44mspage" databasefield="kdx44mspage" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="40px" fieldtextboxwidth="50px" ></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="kdx45mspage" databasefield="kdx45mspage" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="40px" fieldtextboxwidth="50px" ></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="kdx46mspage" databasefield="kdx46mspage" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="40px" fieldtextboxwidth="50px" ></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="kdx47mspage" databasefield="kdx47mspage" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="40px" fieldtextboxwidth="50px" ></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="kdx48mspage" databasefield="kdx48mspage" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="40px" fieldtextboxwidth="50px" ></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="kdx49mspage" databasefield="kdx49mspage" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="40px" fieldtextboxwidth="50px" ></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="kdx50mspage" databasefield="kdx50mspage" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="40px" fieldtextboxwidth="50px" ></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="kdx51mspage" databasefield="kdx51mspage" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="40px" fieldtextboxwidth="50px" ></def:datafieldcontrol>

              </td>
          </tr>
      </table>
              </td>
        <td width="40px"></td>
              <td>
                        <table>
          <tr><td align="right" ><b><u>Current Dx</u></b></td><td align="right" ><b><u>Current Age<br/>Onset (yrs)</u></b></td></tr>
          <tr>
              <td width="360px" style="vertical-align:top">
<def:datafieldcontrol runat="server" id="kdx38curdx" databasefield="kdx38curdx" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="300px" fieldtextboxwidth="50px" ></def:datafieldcontrol> 
<def:datafieldcontrol runat="server" id="kdx39curdx" databasefield="kdx39curdx" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="300px" fieldtextboxwidth="50px" ></def:datafieldcontrol> 
<def:datafieldcontrol runat="server" id="kdx40curdx" databasefield="kdx40curdx" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="300px" fieldtextboxwidth="50px" ></def:datafieldcontrol> 
<def:datafieldcontrol runat="server" id="kdx41curdx" databasefield="kdx41curdx" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="300px" fieldtextboxwidth="50px" ></def:datafieldcontrol> 
<def:datafieldcontrol runat="server" id="kdx42curdx" databasefield="kdx42curdx" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="300px" fieldtextboxwidth="50px" ></def:datafieldcontrol> 
<def:datafieldcontrol runat="server" id="kdx43curdx" databasefield="kdx43curdx" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="300px" fieldtextboxwidth="50px" ></def:datafieldcontrol> 
<def:datafieldcontrol runat="server" id="kdx44curdx" databasefield="kdx44curdx" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="300px" fieldtextboxwidth="50px" ></def:datafieldcontrol> 
<def:datafieldcontrol runat="server" id="kdx45curdx" databasefield="kdx45curdx" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="300px" fieldtextboxwidth="50px" ></def:datafieldcontrol> 
<def:datafieldcontrol runat="server" id="kdx46curdx" databasefield="kdx46curdx" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="300px" fieldtextboxwidth="50px" ></def:datafieldcontrol> 
<def:datafieldcontrol runat="server" id="kdx47curdx" databasefield="kdx47curdx" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="300px" fieldtextboxwidth="50px" ></def:datafieldcontrol> 
<def:datafieldcontrol runat="server" id="kdx48curdx" databasefield="kdx48curdx" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="300px" fieldtextboxwidth="50px" ></def:datafieldcontrol> 
<def:datafieldcontrol runat="server" id="kdx49curdx" databasefield="kdx49curdx" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="300px" fieldtextboxwidth="50px" ></def:datafieldcontrol> 
<def:datafieldcontrol runat="server" id="kdx50curdx" databasefield="kdx50curdx" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="300px" fieldtextboxwidth="50px" ></def:datafieldcontrol> 
<def:datafieldcontrol runat="server" id="kdx51curdx" databasefield="kdx51curdx" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="300px" fieldtextboxwidth="50px" ></def:datafieldcontrol> 

              </td>
              <td width="100px" style="vertical-align:top">
<def:datafieldcontrol runat="server" id="kdx38curage" databasefield="kdx38curage" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="40px" fieldtextboxwidth="50px" ></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="kdx39curage" databasefield="kdx39curage" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="40px" fieldtextboxwidth="50px" ></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="kdx40curage" databasefield="kdx40curage" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="40px" fieldtextboxwidth="50px" ></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="kdx41curage" databasefield="kdx41curage" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="40px" fieldtextboxwidth="50px" ></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="kdx42curage" databasefield="kdx42curage" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="40px" fieldtextboxwidth="50px" ></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="kdx43curage" databasefield="kdx43curage" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="40px" fieldtextboxwidth="50px" ></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="kdx44curage" databasefield="kdx44curage" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="40px" fieldtextboxwidth="50px" ></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="kdx45curage" databasefield="kdx45curage" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="40px" fieldtextboxwidth="50px" ></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="kdx46curage" databasefield="kdx46curage" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="40px" fieldtextboxwidth="50px" ></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="kdx47curage" databasefield="kdx47curage" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="40px" fieldtextboxwidth="50px" ></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="kdx48curage" databasefield="kdx48curage" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="40px" fieldtextboxwidth="50px" ></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="kdx49curage" databasefield="kdx49curage" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="40px" fieldtextboxwidth="50px" ></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="kdx50curage" databasefield="kdx50curage" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="40px" fieldtextboxwidth="50px" ></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="kdx51curage" databasefield="kdx51curage" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="40px" fieldtextboxwidth="50px" ></def:datafieldcontrol>

              </td>
          </tr>
      </table>
              </td>
          </tr>
      </table>



      <br /><br />


      <table>
          <tr>
              <td>

            <table>
          <tr><td align="right" ><b><u>MSP Dx</u></b></td><td align="right" ><b><u>MSP Age<br/>Onset (yrs)</u></b></td></tr>
          <tr>
              <td width="360px" style="vertical-align:top">

<def:datafieldcontrol runat="server" id="kdx52mspdx" databasefield="kdx52mspdx" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="300px" fieldtextboxwidth="50px" ></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="kdx53mspdx" databasefield="kdx53mspdx" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="300px" fieldtextboxwidth="50px" ></def:datafieldcontrol>

              </td>
              <td  style="vertical-align:top">

<def:datafieldcontrol runat="server" id="kdx52mspage" databasefield="kdx52mspage" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="40px" fieldtextboxwidth="50px" ></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="kdx53mspage" databasefield="kdx53mspage" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="40px" fieldtextboxwidth="50px" ></def:datafieldcontrol>

              </td>
          </tr>
                <tr>
                    <td align="right">
                              <def:datafieldcontrol runat="server" id="kdx52mood"  databasefield="kdx52mood" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="300px" fieldtextboxwidth="50px" ></def:datafieldcontrol>
                        <def:ValueSetLabel ID="v2" runat="server" DatabaseField="kdx52mood" />
                    </td>
                </tr>
      </table>



              </td>
        <td width="40px"></td>

        <td style="vertical-align:top">

            <table>
          <tr><td align="right" ><b><u>Current Dx</u></b></td><td align="right" ><b><u>Current Age<br/>Onset (yrs)</u></b></td></tr>
          <tr>
              <td width="360px" style="vertical-align:top">

<def:datafieldcontrol runat="server" id="kdx52curdx" databasefield="kdx52curdx" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="300px" fieldtextboxwidth="50px" ></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="kdx53curdx" databasefield="kdx53curdx" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="300px" fieldtextboxwidth="50px" ></def:datafieldcontrol>

              </td>
              <td  style="vertical-align:top">

<def:datafieldcontrol runat="server" id="kdx52curage" databasefield="kdx52curage" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="40px" fieldtextboxwidth="50px" ></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="kdx53curage" databasefield="kdx53curage" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="40px" fieldtextboxwidth="50px" ></def:datafieldcontrol>

              </td>
          </tr>
      </table>

              </td>

          </tr>
      </table>


<br />
<br />




      <table>
          <tr>
              <td align="right"><b><u>Outpatient Tx</u></b></td>
              <td width="40px"></td>
              <td align="right"><b><u>Psychiatric Hospitalization</u></b></td>
          </tr>
          <tr>
              <td align="right"><def:ValueSetLabel ID="v4" runat="server" DatabaseField="kdxoutpt" /></td>
              <td width="40px"></td>
              <td> </td>
          </tr>

          <tr>
              <td style="vertical-align:top">
<def:datafieldcontrol runat="server" id="kdxoutpt"  databasefield="kdxoutpt" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="300px" fieldtextboxwidth="50px" ></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="kdxoutptage" databasefield="kdxoutptage" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="300px" fieldtextboxwidth="50px" ></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="kdxoutptwks" databasefield="kdxoutptwks" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="300px" fieldtextboxwidth="50px" ></def:datafieldcontrol>


              </td>
              <td width="40px"></td>
              <td style="vertical-align:top">
<def:datafieldcontrol runat="server" id="kdxhosp"   databasefield="kdxhosp"   IsEntryField="true" isdoubleentryfield="true" fieldlabelwidth="300px" fieldtextboxwidth="50px" ></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="kdxhospage" databasefield="kdxhospage" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="300px" fieldtextboxwidth="50px" ></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="kdxhospnum" databasefield="kdxhospnum" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="300px" fieldtextboxwidth="50px" ></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="kdxhospwks" databasefield="kdxhospwks" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="300px" fieldtextboxwidth="50px" ></def:datafieldcontrol>

              </td>
          </tr>
      </table>



      <br /><br />
<table>
    <tr>
        <td>
<def:datafieldcontrol runat="server" id="kdxsuicidea" databasefield="kdxsuicidea" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="300px" fieldtextboxwidth="50px" ></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="kdxsuicgest" databasefield="kdxsuicgest" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="300px" fieldtextboxwidth="50px" ></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="kdxsuicatt" databasefield="kdxsuicatt" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="300px" fieldtextboxwidth="50px" ></def:datafieldcontrol>

        </td>
        <td rowspan="3">
            <def:ValueSetLabel ID="v6" runat="server" DatabaseField="kdxsuicidea" />
        </td>
    </tr>
</table>

      <br /><br />


      <table>
    <tr>
        <td>
      <def:datafieldcontrol runat="server" id="kdxrelinfo" databasefield="kdxrelinfo" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="300px" fieldtextboxwidth="50px" ></def:datafieldcontrol>
        </td>
        <td  >
                  <def:ValueSetLabel ID="v5" runat="server" DatabaseField="kdxrelinfo" />
        </td>
    </tr>
</table>




      
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
    </asp:updatepanel>


    </asp:content>


