<%@ register tagprefix="def" namespace="DataEntryFramework3" %> 
<%@ page language="c#" masterpagefile="~/UWAC.master"  title="MRItracking data entry" %>
<asp:content id="content1" contentplaceholderid="obodyplaceholder" runat="server">
<link rel="stylesheet" type="text/css" href="/research/dataentry/dataentryform.css" />
<def:dataentrycontroller id="dataentrycontroller1" runat="server" databasetable="ALL_MRItracking" primarykeyfield="mritrk_pk">
</def:dataentrycontroller>
   <asp:scriptmanager id="scriptmanager1" runat="server">    </asp:scriptmanager>
<asp:updatepanel id="updatepanel1" runat="server">
  <contenttemplate>
<table>
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="id" databasefield="id" isinsertfield="true" fieldlabelwidth="300px" fieldtextboxwidth="250px" fieldtextboxmaxlength="15"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="indexnum" databasefield="indexnum" isinsertfield="true" fieldtextboxtextdefault="1" fieldlabelwidth="300px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="mritrk_date" databasefield="mritrk_date" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="300px" formatstring="{0:d}" ></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="mritrk_agemo" databasefield="mritrk_agemo" isreadonly="true" renderreadonlyasdiv="true" fieldlabelwidth="300px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="mritrk_exmnr" databasefield="mritrk_exmnr" isentryfield="true" isdoubleentryfield="false" fieldlabelwidth="300px" fieldtextboxwidth="250px" fieldtextboxmaxlength="20"></def:datafieldcontrol></td>
<td></td></tr>
  
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="mritrk_scrmsg" databasefield="mritrk_scrmsg" isreadonly="true" renderreadonlyasdiv="true" fieldlabelwidth="300px" fieldtextboxwidth="400px" fieldtextboxheight="40px" fieldtextboxtextmode="multiline" fieldtextboxmaxlength="250"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="expvers" databasefield="expvers" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="300px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="scanvers" databasefield="scanvers" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="300px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="handedness" databasefield="handedness" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="300px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="arrivetime" databasefield="arrivetime" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="300px" fieldtextboxwidth="40px"  ></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="behtrainA" databasefield="behtrainA" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="300px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="behtrainB" databasefield="behtrainB" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="300px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="mritrk_cmnt" databasefield="mritrk_cmnt" isentryfield="true" isdoubleentryfield="false" fieldlabelwidth="300px" fieldtextboxwidth="400px" fieldtextboxheight="40px" fieldtextboxtextmode="multiline" fieldtextboxmaxlength="250"></def:datafieldcontrol></td>
<td></td></tr>
 
    </table>

      <br /><br />
      <table>
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="ScannerTime" databasefield="ScannerTime" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="150px" fieldtextboxwidth="100px"  ></def:datafieldcontrol></td>
<td></td><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="ScannerDur" databasefield="ScannerDur" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="150px" fieldtextboxwidth="100px"></def:datafieldcontrol></td>
<td></td></tr>
 
     </table>
      <br /><br />
      <table>

<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="SpectStart" databasefield="SpectStart" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="150px" fieldtextboxwidth="100px"></def:datafieldcontrol></td>
<td></td><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="SpectStop" databasefield="SpectStop" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="150px" fieldtextboxwidth="100px"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="fMRIStart" databasefield="fMRIStart" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="150px" fieldtextboxwidth="100px"></def:datafieldcontrol></td>
<td></td><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="fMRIStop" databasefield="fMRIStop" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="150px" fieldtextboxwidth="100px"></def:datafieldcontrol></td>
<td></td></tr>
      </table>
      <br /><br />
      <table>
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="ScanCompleted" databasefield="ScanCompleted" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="300px" fieldtextboxwidth="100px"></def:datafieldcontrol></td>
<td>
</td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="CompleteSniffSticks" databasefield="CompleteSniffSticks" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="300px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
<td>
        <def:ValueSetLabel runat="server" DatabaseField="CompleteSniffSticks"></def:ValueSetLabel>

</td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="IntervalSniffSticks_Odor" databasefield="IntervalSniffSticks_Odor" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="300px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 </table>

      <br />
      <br /><asp:Label ID="lblMed" runat="server" Text="Current Medications" Font-Bold="true"></asp:Label>
      <br />
      <table>
                    <tr>
              <td align="right"><b><u>Name</u></b></td>
              <td align="right"><b><u>Dosage</u></b></td>
              <td align="right"><b><u>Times/day</u></b></td>
              <td align="right"><b><u>Indication</u></b></td>


          </tr>

<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="med01name" databasefield="med01name" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="60px" fieldtextboxwidth="140px"></def:datafieldcontrol></td>
 
<td style="vertical-align:top"><def:datafieldcontrol runat="server" id="med01dosage" databasefield="med01dosage" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="60px" fieldtextboxwidth="140px"></def:datafieldcontrol></td>
 
<td style="vertical-align:top"><def:datafieldcontrol runat="server" id="med01timesperday" databasefield="med01timesperday" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="60px" fieldtextboxwidth="140px"  ></def:datafieldcontrol></td>
 
<td style="vertical-align:top"><def:datafieldcontrol runat="server" id="med01indication" databasefield="med01indication" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="60px" fieldtextboxwidth="140px"></def:datafieldcontrol></td>
</tr> 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="med02name" databasefield="med02name" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="60px" fieldtextboxwidth="140px"></def:datafieldcontrol></td>
 
<td style="vertical-align:top"><def:datafieldcontrol runat="server" id="med02dosage" databasefield="med02dosage" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="60px" fieldtextboxwidth="140px"></def:datafieldcontrol></td>

<td style="vertical-align:top"><def:datafieldcontrol runat="server" id="med02timesperday" databasefield="med02timesperday" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="60px" fieldtextboxwidth="140px"  ></def:datafieldcontrol></td>

<td style="vertical-align:top"><def:datafieldcontrol runat="server" id="med02indication" databasefield="med02indication" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="60px" fieldtextboxwidth="140px"></def:datafieldcontrol></td>
</tr> 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="med03name" databasefield="med03name" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="60px" fieldtextboxwidth="140px"></def:datafieldcontrol></td>

<td style="vertical-align:top"><def:datafieldcontrol runat="server" id="med03dosage" databasefield="med03dosage" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="60px" fieldtextboxwidth="140px"></def:datafieldcontrol></td>

<td style="vertical-align:top"><def:datafieldcontrol runat="server" id="med03timesperday" databasefield="med03timesperday" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="60px" fieldtextboxwidth="140px"  ></def:datafieldcontrol></td>

<td style="vertical-align:top"><def:datafieldcontrol runat="server" id="med03indication" databasefield="med03indication" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="60px" fieldtextboxwidth="140px"></def:datafieldcontrol></td>
</tr> 
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="med04name" databasefield="med04name" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="60px" fieldtextboxwidth="140px"></def:datafieldcontrol></td>
 
<td style="vertical-align:top"><def:datafieldcontrol runat="server" id="med04dosage" databasefield="med04dosage" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="60px" fieldtextboxwidth="140px"></def:datafieldcontrol></td>

<td style="vertical-align:top"><def:datafieldcontrol runat="server" id="med04timesperday" databasefield="med04timesperday" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="60px" fieldtextboxwidth="140px"  ></def:datafieldcontrol></td>

<td style="vertical-align:top"><def:datafieldcontrol runat="server" id="med04indication" databasefield="med04indication" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="60px" fieldtextboxwidth="140px"></def:datafieldcontrol></td>
</tr> 
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="med05name" databasefield="med05name" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="60px" fieldtextboxwidth="140px"></def:datafieldcontrol></td>
 
<td style="vertical-align:top"><def:datafieldcontrol runat="server" id="med05dosage" databasefield="med05dosage" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="60px" fieldtextboxwidth="140px"></def:datafieldcontrol></td>

<td style="vertical-align:top"><def:datafieldcontrol runat="server" id="med05timesperday" databasefield="med05timesperday" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="60px" fieldtextboxwidth="140px"  ></def:datafieldcontrol></td>

<td style="vertical-align:top"><def:datafieldcontrol runat="server" id="med05indication" databasefield="med05indication" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="60px" fieldtextboxwidth="140px"></def:datafieldcontrol></td>
</tr> 
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="med06name" databasefield="med06name" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="60px" fieldtextboxwidth="140px"></def:datafieldcontrol></td>
 
<td style="vertical-align:top"><def:datafieldcontrol runat="server" id="med06dosage" databasefield="med06dosage" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="60px" fieldtextboxwidth="140px"></def:datafieldcontrol></td>

<td style="vertical-align:top"><def:datafieldcontrol runat="server" id="med06timesperday" databasefield="med06timesperday" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="60px" fieldtextboxwidth="140px"  ></def:datafieldcontrol></td>

<td style="vertical-align:top"><def:datafieldcontrol runat="server" id="med06indication" databasefield="med06indication" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="60px" fieldtextboxwidth="140px"></def:datafieldcontrol></td>
</tr> 
</table>
      
    
      <br />
      <br /><asp:Label ID="Label1" runat="server" Text="Medications Today" Font-Bold="true"></asp:Label>
      <br />
      <table>   
          <tr>
              <td align="right"><b><u>Name</u></b></td>
              <td align="right"><b><u>Dosage</u></b></td>
              <td align="right"><b><u>Times/day</u></b></td>
              <td align="right"><b><u>Indication</u></b></td>

          </tr>
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="medtoday01name" databasefield="medtoday01name" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="80px" fieldtextboxwidth="140px"></def:datafieldcontrol></td>
 
<td style="vertical-align:top"><def:datafieldcontrol runat="server" id="medtoday01dosage" databasefield="medtoday01dosage" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="60px" fieldtextboxwidth="140px"></def:datafieldcontrol></td>

<td style="vertical-align:top"><def:datafieldcontrol runat="server" id="medtoday01timesperday" databasefield="medtoday01timesperday" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="60px" fieldtextboxwidth="140px"  ></def:datafieldcontrol></td>

<td style="vertical-align:top"><def:datafieldcontrol runat="server" id="medtoday01indication" databasefield="medtoday01indication" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="60px" fieldtextboxwidth="140px"></def:datafieldcontrol></td>
</tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="medtoday02name" databasefield="medtoday02name" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="80px" fieldtextboxwidth="140px"></def:datafieldcontrol></td>
 
<td style="vertical-align:top"><def:datafieldcontrol runat="server" id="medtoday02dosage" databasefield="medtoday02dosage" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="60px" fieldtextboxwidth="140px"></def:datafieldcontrol></td>

<td style="vertical-align:top"><def:datafieldcontrol runat="server" id="medtoday02timesperday" databasefield="medtoday02timesperday" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="60px" fieldtextboxwidth="140px"  ></def:datafieldcontrol></td>

<td style="vertical-align:top"><def:datafieldcontrol runat="server" id="medtoday02indication" databasefield="medtoday02indication" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="60px" fieldtextboxwidth="140px"></def:datafieldcontrol></td>
</tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="medtoday03name" databasefield="medtoday03name" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="80px" fieldtextboxwidth="140px"></def:datafieldcontrol></td>
 
<td style="vertical-align:top"><def:datafieldcontrol runat="server" id="medtoday03dosage" databasefield="medtoday03dosage" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="60px" fieldtextboxwidth="140px"></def:datafieldcontrol></td>

<td style="vertical-align:top"><def:datafieldcontrol runat="server" id="medtoday03timesperday" databasefield="medtoday03timesperday" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="60px" fieldtextboxwidth="140px"  ></def:datafieldcontrol></td>

<td style="vertical-align:top"><def:datafieldcontrol runat="server" id="medtoday03indication" databasefield="medtoday03indication" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="60px" fieldtextboxwidth="140px"></def:datafieldcontrol></td>
</tr>
</table>
      
      <br /><br />
      <table> 
          <tr><td align="center"><b><u>0=No,Unchecked, 1=Yes,Checked</u></b></td> <td></td> <td align="center"><b><u>Describe prolems, if any</u></b></td></tr>
             <tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="mprage" databasefield="mprage" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="150px" fieldtextboxwidth="40px"></def:datafieldcontrol></td><td></td>
   <td style="vertical-align:top"><def:datafieldcontrol runat="server" id="mprage_prob" databasefield="mprage_prob" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="300px" fieldtextboxwidth="400px"></def:datafieldcontrol></td> <td></td></tr>
 
 <tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="amyg_pressref" databasefield="amyg_pressref" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="150px" fieldtextboxwidth="40px"></def:datafieldcontrol></td> <td></td> 
   <td style="vertical-align:top"><def:datafieldcontrol runat="server" id="amyg_pressref_prob" databasefield="amyg_pressref_prob" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="300px" fieldtextboxwidth="400px"></def:datafieldcontrol></td> <td></td></tr>
   <tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="amyg_pressTE80MS" databasefield="amyg_pressTE80MS" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="150px" fieldtextboxwidth="40px"></def:datafieldcontrol></td> <td></td>
   <td style="vertical-align:top"><def:datafieldcontrol runat="server" id="amyg_pressTE80MS_prob" databasefield="amyg_pressTE80MS_prob" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="300px" fieldtextboxwidth="400px"></def:datafieldcontrol></td> <td></td></tr>
   <tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="amyg_water" databasefield="amyg_water" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="150px" fieldtextboxwidth="40px"></def:datafieldcontrol></td> <td></td>
   <td style="vertical-align:top"><def:datafieldcontrol runat="server" id="amyg_water_prob" databasefield="amyg_water_prob" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="300px" fieldtextboxwidth="400px"></def:datafieldcontrol></td> <td></td></tr>
   <tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="amyg_GABA" databasefield="amyg_GABA" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="150px" fieldtextboxwidth="40px"></def:datafieldcontrol></td> <td></td>
   <td style="vertical-align:top"><def:datafieldcontrol runat="server" id="amyg_GABA_prob" databasefield="amyg_GABA_prob" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="300px" fieldtextboxwidth="400px"></def:datafieldcontrol></td> <td></td></tr>

 <tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="cere_pressref" databasefield="cere_pressref" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="150px" fieldtextboxwidth="40px"></def:datafieldcontrol></td> <td></td>
   <td style="vertical-align:top"><def:datafieldcontrol runat="server" id="cere_pressref_prob" databasefield="cere_pressref_prob" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="300px" fieldtextboxwidth="400px"></def:datafieldcontrol></td> <td></td></tr>
   <tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="cere_pressTE80MS" databasefield="cere_pressTE80MS" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="150px" fieldtextboxwidth="40px"></def:datafieldcontrol></td> <td></td>
   <td style="vertical-align:top"><def:datafieldcontrol runat="server" id="cere_pressTE80MS_prob" databasefield="cere_pressTE80MS_prob" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="300px" fieldtextboxwidth="400px"></def:datafieldcontrol></td> <td></td></tr>
   <tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="cere_water" databasefield="cere_water" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="150px" fieldtextboxwidth="40px"></def:datafieldcontrol></td> <td></td>
   <td style="vertical-align:top"><def:datafieldcontrol runat="server" id="cere_water_prob" databasefield="cere_water_prob" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="300px" fieldtextboxwidth="400px"></def:datafieldcontrol></td> <td></td></tr>
   <tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="cere_GABA" databasefield="cere_GABA" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="150px" fieldtextboxwidth="40px"></def:datafieldcontrol></td> <td></td>
   <td style="vertical-align:top"><def:datafieldcontrol runat="server" id="cere_GABA_prob" databasefield="cere_GABA_prob" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="300px" fieldtextboxwidth="400px"></def:datafieldcontrol></td> <td></td></tr>

          </table>

      <br /><br />

      <table>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="breathingCycle" databasefield="breathingCycle" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="300px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="breathingDelay" databasefield="breathingDelay" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="300px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="B0" databasefield="B0" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="300px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="B0_prob" databasefield="B0_prob" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="300px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 

          </table>

      
 <br />
 <br />

 <br />
 <br />

<table  style="border-style:solid; border-color:gray" >
<tr>
    <td style="vertical-align:top"><def:datafieldcontrol runat="server" id="olf1scannum" databasefield="olf1scannum" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="60px" fieldtextboxwidth="40px"></def:datafieldcontrol>
    <br />
<def:datafieldcontrol runat="server" id="olf1scannum_prob" databasefield="olf1scannum_prob" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="60px" fieldtextboxwidth="300px"></def:datafieldcontrol></td>


<td style="vertical-align:top"><def:datafieldcontrol runat="server" id="olf2scannum" databasefield="olf2scannum" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="60px" fieldtextboxwidth="40px"></def:datafieldcontrol>
<br /> 
 
<def:datafieldcontrol runat="server" id="olf2scannum_prob" databasefield="olf2scannum_prob" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="60px" fieldtextboxwidth="300px"></def:datafieldcontrol></td>
</tr>
 

    <tr>

        <td>
    <def:datafieldcontrol runat="server" id="face1scannum" databasefield="face1scannum" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="60px" fieldtextboxwidth="40px"></def:datafieldcontrol>
            <br />
            <table>
                <tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="face1hits" databasefield="face1hits" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="60px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
                <td style="vertical-align:top"><def:datafieldcontrol runat="server" id="face1misses" databasefield="face1misses" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="60px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
                </tr>
                <tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="face1incorrect" databasefield="face1incorrect" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="60px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
                <td style="vertical-align:top"><def:datafieldcontrol runat="server" id="face1falsealarms" databasefield="face1falsealarms" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="60px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
                </tr>

            </table>
            <br />
            
    <def:datafieldcontrol runat="server" id="face1_prob" databasefield="face1_prob" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="60px" fieldtextboxwidth="300px"></def:datafieldcontrol>

        </td>
 
        <td>
            <def:datafieldcontrol runat="server" id="face2scannum" databasefield="face2scannum" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="60px" fieldtextboxwidth="40px"></def:datafieldcontrol>
            <br />

        <table>
            <tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="face2hits" databasefield="face2hits" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="60px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
<td style="vertical-align:top"><def:datafieldcontrol runat="server" id="face2misses" databasefield="face2misses" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="60px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
</tr>
 
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="face2incorrect" databasefield="face2incorrect" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="60px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
<td style="vertical-align:top"><def:datafieldcontrol runat="server" id="face2falsealarms" databasefield="face2falsealarms" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="60px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
</tr>

        </table>
      <br />
            <def:datafieldcontrol runat="server" id="face2_prob" databasefield="face2_prob" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="60px" fieldtextboxwidth="300px"></def:datafieldcontrol>
        </td>

    </tr>

</table>

 <br />
 <br />

<table>
    <tr>
        <td>
<def:datafieldcontrol runat="server" id="mritrk_smellroom" databasefield="mritrk_smellroom" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="300px" fieldtextboxwidth="40px"></def:datafieldcontrol>

        </td>
        <td>
           
        </td>

    </tr>
    <tr>
        <td>
<def:datafieldcontrol runat="server" id="mritrk_smellodor1" databasefield="mritrk_smellodor1" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="300px" fieldtextboxwidth="40px"></def:datafieldcontrol>

        </td>
        <td>

        </td>

    </tr>
    <tr>
        <td>
<def:datafieldcontrol runat="server" id="mritrk_smellodor2" databasefield="mritrk_smellodor2" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="300px" fieldtextboxwidth="40px"></def:datafieldcontrol>

        </td>
        <td>

        </td>

    </tr>
</table>
 
 <br />
 <br />

<table> 
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
