<%@ Page Language="C#"  MasterPageFile="~/UWAC.master" Title="FQS Data Entry" AutoEventWireup="true" CodeFile="FQS.aspx.cs" Inherits="DataEntryForms_Common_FQS_FQS" %>

<%@ Register TagPrefix="def" Namespace="DataEntryFramework3" %>


<asp:content id="Content1" contentplaceholderid="oBodyPlaceHolder" runat="server">

<def:dataentrycontroller id="DataEntryController1" runat="server" DatabaseTable="ALL_FQS" PrimaryKeyField="fqs_pk">
</def:dataentrycontroller>
   <asp:ScriptManager ID="ScriptManager1" runat="server">    </asp:ScriptManager>
<asp:UpdatePanel ID="UpdatePanel1" runat="server">
  <ContentTemplate>
<table>

 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="id" DatabaseField="id" IsInsertField="true" FieldLabelWidth="300px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="15"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="indexnum" DatabaseField="indexnum" IsInsertField="true" FieldTextBoxTextDefault="1" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="fqs_date" DatabaseField="fqs_date" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FormatString="{0:d}" ></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="fqs_agemo" DatabaseField="fqs_agemo" IsReadOnly="true" RenderReadOnlyAsDiv="true"  FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 
 
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="fqs_exmnr" DatabaseField="fqs_exmnr" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="300px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="20"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="fqs_resp" DatabaseField="fqs_resp" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="300px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="50"></def:datafieldcontrol></td>
<td></td></tr>

<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="fqs_cmnt" DatabaseField="fqs_cmnt" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="300px" FieldTextBoxWidth="400px" FieldTextBoxHeight="40px" FieldTextBoxTextMode="multiline" FieldTextBoxMaxLength="250"></def:datafieldcontrol></td>
<td></td></tr>


<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="fqs_scrmsg" DatabaseField="fqs_scrmsg" IsReadOnly="true" RenderReadOnlyAsDiv="true"  FieldLabelWidth="300px" FieldTextBoxWidth="400px" FieldTextBoxHeight="40px" FieldTextBoxTextMode="multiline" FieldTextBoxMaxLength="250"></def:datafieldcontrol></td>
<td></td></tr>
    </table>

<br /><br /><br />


      <table>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="fqs_bestfr" DatabaseField="fqs_bestfr" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="200px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td><def:datafieldcontrol runat="server" id="fqs_bestfrname" DatabaseField="fqs_bestfrname" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="200px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="200"></def:datafieldcontrol>
</td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="fqs_otherfr" DatabaseField="fqs_otherfr" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="200px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td><def:datafieldcontrol runat="server" id="fqs_otherfrname" DatabaseField="fqs_otherfrname" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="200px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="200"></def:datafieldcontrol></td></tr>
 
<td></td></tr>
 

              </table>

<br /><br /><br />
      <table>

<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="fqs_01" DatabaseField="fqs_01" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
 
<td style="vertical-align:top"><def:ValueSetLabel ID="ValueSetLabel_fqs_01" runat="server"  DatabaseField="fqs_01"></def:ValueSetLabel></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="fqs_02" DatabaseField="fqs_02" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="fqs_03" DatabaseField="fqs_03" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="fqs_04" DatabaseField="fqs_04" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="fqs_05" DatabaseField="fqs_05" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="fqs_06" DatabaseField="fqs_06" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="fqs_07" DatabaseField="fqs_07" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="fqs_08" DatabaseField="fqs_08" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="fqs_09" DatabaseField="fqs_09" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="fqs_10" DatabaseField="fqs_10" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="fqs_11" DatabaseField="fqs_11" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="fqs_12" DatabaseField="fqs_12" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="fqs_13" DatabaseField="fqs_13" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="fqs_14" DatabaseField="fqs_14" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="fqs_15" DatabaseField="fqs_15" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="fqs_16" DatabaseField="fqs_16" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="fqs_17" DatabaseField="fqs_17" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="fqs_18" DatabaseField="fqs_18" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="fqs_19" DatabaseField="fqs_19" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="fqs_20" DatabaseField="fqs_20" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="fqs_21" DatabaseField="fqs_21" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="fqs_22" DatabaseField="fqs_22" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="fqs_23" DatabaseField="fqs_23" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
     </table>

      <br />
      <br />

      <table>
          <tr><td align="right"><b><u>Total Score</u></b></td><td align="right"><b><u>Avg</u></b></td></tr>
<tr>
    <td style="vertical-align:top"><def:datafieldcontrol runat="server" id="fqs_tot" DatabaseField="fqs_tot" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="200px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td style="vertical-align:top"><def:datafieldcontrol runat="server" id="fqs_avg_tot" DatabaseField="fqs_avg_tot" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="50px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
</tr>
<tr>
    <td style="vertical-align:top"><def:datafieldcontrol runat="server" id="Datafieldcontrol1" DatabaseField="fqs_compan" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="200px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td style="vertical-align:top"><def:datafieldcontrol runat="server" id="Datafieldcontrol2" DatabaseField="fqs_avg_compan" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="50px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
</tr>
<tr>
    <td style="vertical-align:top"><def:datafieldcontrol runat="server" id="Datafieldcontrol3" DatabaseField="fqs_confl" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="200px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td style="vertical-align:top"><def:datafieldcontrol runat="server" id="Datafieldcontrol4" DatabaseField="fqs_avg_confl" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="50px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
</tr>
<tr>
    <td style="vertical-align:top"><def:datafieldcontrol runat="server" id="Datafieldcontrol5" DatabaseField="fqs_help" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="200px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td style="vertical-align:top"><def:datafieldcontrol runat="server" id="Datafieldcontrol6" DatabaseField="fqs_avg_help" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="50px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
</tr>
<tr>
    <td style="vertical-align:top"><def:datafieldcontrol runat="server" id="Datafieldcontrol7" DatabaseField="fqs_secure" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="200px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td style="vertical-align:top"><def:datafieldcontrol runat="server" id="Datafieldcontrol8" DatabaseField="fqs_avg_secure" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="50px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
</tr>
<tr>
    <td style="vertical-align:top"><def:datafieldcontrol runat="server" id="Datafieldcontrol9" DatabaseField="fqs_close" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="200px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td style="vertical-align:top"><def:datafieldcontrol runat="server" id="Datafieldcontrol10" DatabaseField="fqs_avg_close" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="50px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
</tr>
 
 
    </table>

      <br />
      <br />

      <table>
<br/><br/><tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="created" DatabaseField="created" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="300px"></def:datafieldcontrol></td>
<td></td></tr>

<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="createdBy" DatabaseField="createdBy" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="300px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="50"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="updated" DatabaseField="updated" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="300px" FormatString="{0:d}" ></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="updatedBy" DatabaseField="updatedBy" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="300px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="50"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="scored" DatabaseField="scored" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="300px"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="scoredBy" DatabaseField="scoredBy" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="300px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="50"></def:datafieldcontrol></td>
<td></td></tr>
 
</table>
</ContentTemplate>
<Triggers></Triggers>
</asp:UpdatePanel>
</asp:content>
