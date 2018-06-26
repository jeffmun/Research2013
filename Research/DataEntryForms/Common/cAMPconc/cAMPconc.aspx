<%@ register tagprefix="def" namespace="DataEntryFramework3" %> 
<%@ page language="c#" masterpagefile="~/UWAC.master"  title="cAMPconc data entry" %>
<asp:content id="content1" contentplaceholderid="obodyplaceholder" runat="server">
<link rel="stylesheet" type="text/css" href="/research/dataentry/dataentryform.css" />
<def:dataentrycontroller id="dataentrycontroller1" runat="server" databasetable="ALL_campconc" primarykeyfield="campc_pk">
</def:dataentrycontroller>
   <asp:scriptmanager id="scriptmanager1" runat="server">    </asp:scriptmanager>
<asp:updatepanel id="updatepanel1" runat="server">
  <contenttemplate>
<table>
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="id" databasefield="id" isinsertfield="true" fieldlabelwidth="300px" fieldtextboxwidth="250px" fieldtextboxmaxlength="15"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="indexnum" databasefield="indexnum" isinsertfield="true" fieldtextboxtextdefault="1" fieldlabelwidth="300px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="campc_date" databasefield="campc_date" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="300px" formatstring="{0:d}" ></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="campc_agemo" databasefield="campc_agemo" isreadonly="true" renderreadonlyasdiv="true" fieldlabelwidth="300px" fieldtextboxwidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="campc_exmnr" databasefield="campc_exmnr" isentryfield="true" isdoubleentryfield="false" fieldlabelwidth="300px" fieldtextboxwidth="250px" fieldtextboxmaxlength="20"></def:datafieldcontrol></td>
<td></td></tr>
  
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="campc_cmnt" databasefield="campc_cmnt" isentryfield="true" isdoubleentryfield="false" fieldlabelwidth="300px" fieldtextboxwidth="400px" fieldtextboxheight="40px" fieldtextboxtextmode="multiline" fieldtextboxmaxlength="250"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="campc_scrmsg" databasefield="campc_scrmsg" isreadonly="true" renderreadonlyasdiv="true" fieldlabelwidth="300px" fieldtextboxwidth="400px" fieldtextboxheight="40px" fieldtextboxtextmode="multiline" fieldtextboxmaxlength="250"></def:datafieldcontrol></td>
<td></td></tr>
 </table>


      <br />
      <br />
            <br />
      <br />
      <asp:Label ID="Label1" runat="server" Text="Sample 1" Font-Bold="true" Font-Underline="true"></asp:Label>


      <table>

          <tr>
              <td align="right"><b>cAMP</b>&nbsp;&nbsp;&nbsp;</td>
              <td width="50px"></td>
              <td align="right"><b>Protein</b>&nbsp;&nbsp;&nbsp;</td>
          </tr>
<tr>
    <td>
<table>
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="base1_camp01" databasefield="base1_camp01" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="300px" fieldtextboxwidth="80px"></def:datafieldcontrol></td>
<td></td></tr>
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="base2_camp01" databasefield="base2_camp01" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="300px" fieldtextboxwidth="80px"></def:datafieldcontrol></td>
<td></td></tr>
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="odor_camp01" databasefield="odor_camp01" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="300px" fieldtextboxwidth="80px"></def:datafieldcontrol></td>
<td></td></tr>
</table>


    </td>

    <td width="50px"></td>

    <td>

        <table>

<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="base1_prot01" databasefield="base1_prot01" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="300px" fieldtextboxwidth="80px"></def:datafieldcontrol></td>
<td></td></tr>
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="base2_prot01" databasefield="base2_prot01" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="300px" fieldtextboxwidth="80px"></def:datafieldcontrol></td>
<td></td></tr>
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="odor_prot01" databasefield="odor_prot01" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="300px" fieldtextboxwidth="80px"></def:datafieldcontrol></td>
<td></td></tr>

        </table>

    </td>
</tr>           
</table>

      <br />
      <br />
      <asp:Label ID="l1" runat="server" Text="Sample 2" Font-Bold="true" Font-Underline="true"></asp:Label>

<table>

<tr>
    <td>
<table>
     
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="base1_camp02" databasefield="base1_camp02" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="300px" fieldtextboxwidth="80px"></def:datafieldcontrol></td>
<td></td></tr>
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="base2_camp02" databasefield="base2_camp02" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="300px" fieldtextboxwidth="80px"></def:datafieldcontrol></td>
<td></td></tr>
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="odor_camp02" databasefield="odor_camp02" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="300px" fieldtextboxwidth="80px"></def:datafieldcontrol></td>
<td></td></tr>

</table>


    </td>

    <td width="50px"></td>

    <td>

        <table>

<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="base1_prot02" databasefield="base1_prot02" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="300px" fieldtextboxwidth="80px"></def:datafieldcontrol></td>
<td></td></tr>
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="base2_prot02" databasefield="base2_prot02" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="300px" fieldtextboxwidth="80px"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="odor_prot02" databasefield="odor_prot02" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="300px" fieldtextboxwidth="80px"></def:datafieldcontrol></td>
<td></td></tr>


        </table>

    </td>
</tr>           

 </table>

      <br />
      <br />
      <asp:Label ID="Label2" runat="server" Text="Sample 3" Font-Bold="true" Font-Underline="true"></asp:Label>

<table>
    <tr>

    <td>
<table>
     <tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="base1_camp03" databasefield="base1_camp03" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="300px" fieldtextboxwidth="80px"></def:datafieldcontrol></td>
<td></td></tr>
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="base2_camp03" databasefield="base2_camp03" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="300px" fieldtextboxwidth="80px"></def:datafieldcontrol></td>
<td></td></tr>
 <tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="odor_camp03" databasefield="odor_camp03" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="300px" fieldtextboxwidth="80px"></def:datafieldcontrol></td>
<td></td></tr>



</table>


    </td>

    <td width="50px"></td>

    <td>

        <table>

            <tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="base1_prot03" databasefield="base1_prot03" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="300px" fieldtextboxwidth="80px"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="base2_prot03" databasefield="base2_prot03" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="300px" fieldtextboxwidth="80px"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="odor_prot03" databasefield="odor_prot03" isentryfield="true" isdoubleentryfield="true" fieldlabelwidth="300px" fieldtextboxwidth="80px"></def:datafieldcontrol></td>
<td></td></tr>


        </table>

    </td>
</tr>           



          </table>




 
<br/><br/>
    
    
 </table>
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

