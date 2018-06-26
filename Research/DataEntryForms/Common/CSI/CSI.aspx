<%@ Register TagPrefix="def" Namespace="DataEntryFramework3" %> 
<%@ Page language="c#" MasterPageFile="~/UWAC.master"  Title="CSI Data Entry" %>
<asp:Content ID="Content1" ContentPlaceHolderID="oBodyPlaceHolder" runat="server">

<def:dataentrycontroller id="DataEntryController1" runat="server" DatabaseTable="ALL_CSI" >
</def:dataentrycontroller>
<div class="main">
<def:datafieldcontrol runat="server" id="id" DatabaseField="id"  IsInsertField="true"   FieldLabelWidth="300px "></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="indexnum" DatabaseField="indexnum"  IsInsertField="true" FieldTextBoxTextDefault="1"  FieldLabelWidth="300px "></def:datafieldcontrol>
</div>
<asp:panel id="mainPanel" CssClass="mainPanel" runat="server">
<div class="main">
<def:datafieldcontrol runat="server" id="CSIvers" DatabaseField="CSIvers"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="150" FieldTextBoxMaxLength="50"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="CSIRela" DatabaseField="CSIRela"  IsEntryField="true" IsDoubleEntryField="false"  FieldLabelWidth="300px" FieldTextBoxWidth="150" FieldTextBoxMaxLength="50"></def:datafieldcontrol>

</div>

<h3>Summary</h3>

<table>
<tr><td align="right"><b><u>Symptom Count</u></b></td><td align="right"><b><u>Severity</u></b></td><td align="right"><b><u>Cutoff</u></b></td><td align="right"><b><u>T score</u></b></td></tr>


<tr>

<td style="vertical-align:top" ><def:datafieldcontrol runat="server" id="CSIA1cnt" DatabaseField="CSIA1cnt" IsReadOnly = "true"  RenderReadOnlyAsDiv="true" FieldLabelWidth="250px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="CSIA2cnt" DatabaseField="CSIA2cnt" IsReadOnly = "true"  RenderReadOnlyAsDiv="true" FieldLabelWidth="250px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="CSIA3cnt" DatabaseField="CSIA3cnt" IsReadOnly = "true"  RenderReadOnlyAsDiv="true" FieldLabelWidth="250px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="CSIBcnt" DatabaseField="CSIBcnt" IsReadOnly = "true"  RenderReadOnlyAsDiv="true" FieldLabelWidth="250px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="CSICcnt" DatabaseField="CSICcnt" IsReadOnly = "true"  RenderReadOnlyAsDiv="true" FieldLabelWidth="250px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="CSIDcnt" DatabaseField="CSIDcnt" IsReadOnly = "true"  RenderReadOnlyAsDiv="true" FieldLabelWidth="250px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="CSIE1cnt" DatabaseField="CSIE1cnt" IsReadOnly = "true"  RenderReadOnlyAsDiv="true" FieldLabelWidth="250px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="CSIE2cnt" DatabaseField="CSIE2cnt" IsReadOnly = "true"  RenderReadOnlyAsDiv="true" FieldLabelWidth="250px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="CSIE3cnt" DatabaseField="CSIE3cnt" IsReadOnly = "true"  RenderReadOnlyAsDiv="true" FieldLabelWidth="250px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="CSIE4cnt" DatabaseField="CSIE4cnt" IsReadOnly = "true"  RenderReadOnlyAsDiv="true" FieldLabelWidth="250px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="CSIFcnt" DatabaseField="CSIFcnt" IsReadOnly = "true"  RenderReadOnlyAsDiv="true" FieldLabelWidth="250px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="CSIGcnt" DatabaseField="CSIGcnt" IsReadOnly = "true"  RenderReadOnlyAsDiv="true" FieldLabelWidth="250px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="CSIG2cnt" DatabaseField="CSIG2cnt" IsReadOnly = "true"  RenderReadOnlyAsDiv="true" FieldLabelWidth="250px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="CSIHcnt" DatabaseField="CSIHcnt" IsReadOnly = "true"  RenderReadOnlyAsDiv="true" FieldLabelWidth="250px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="CSIH2cnt" DatabaseField="CSIH2cnt" IsReadOnly = "true"  RenderReadOnlyAsDiv="true" FieldLabelWidth="250px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="CSIIcnt" DatabaseField="CSIIcnt" IsReadOnly = "true"  RenderReadOnlyAsDiv="true" FieldLabelWidth="250px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="CSIJcnt" DatabaseField="CSIJcnt" IsReadOnly = "true"  RenderReadOnlyAsDiv="true" FieldLabelWidth="250px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="CSIK1cnt" DatabaseField="CSIK1cnt" IsReadOnly = "true"  RenderReadOnlyAsDiv="true" FieldLabelWidth="250px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="CSIK2cnt" DatabaseField="CSIK2cnt" IsReadOnly = "true"  RenderReadOnlyAsDiv="true" FieldLabelWidth="250px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
</td>
  <td style="vertical-align:top" align="center"><def:datafieldcontrol runat="server" id="CSIA1sev" DatabaseField="CSIA1sev" IsReadOnly = "true"  RenderReadOnlyAsDiv="true" FieldLabelWidth="30px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="CSIA2sev" DatabaseField="CSIA2sev" IsReadOnly = "true"  RenderReadOnlyAsDiv="true" FieldLabelWidth="30px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="CSIA3sev" DatabaseField="CSIA3sev" IsReadOnly = "true"  RenderReadOnlyAsDiv="true" FieldLabelWidth="30px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="CSIBsev" DatabaseField="CSIBsev" IsReadOnly = "true"  RenderReadOnlyAsDiv="true" FieldLabelWidth="30px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="CSICsev" DatabaseField="CSICsev" IsReadOnly = "true"  RenderReadOnlyAsDiv="true" FieldLabelWidth="30px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="CSIDsev" DatabaseField="CSIDsev" IsReadOnly = "true"  RenderReadOnlyAsDiv="true" FieldLabelWidth="30px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="CSIE1sev" DatabaseField="CSIE1sev" IsReadOnly = "true"  RenderReadOnlyAsDiv="true" FieldLabelWidth="30px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="CSIE2sev" DatabaseField="CSIE2sev" IsReadOnly = "true"  RenderReadOnlyAsDiv="true" FieldLabelWidth="30px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="CSIE3sev" DatabaseField="CSIE3sev" IsReadOnly = "true"  RenderReadOnlyAsDiv="true" FieldLabelWidth="30px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="CSIE4sev" DatabaseField="CSIE4sev" IsReadOnly = "true"  RenderReadOnlyAsDiv="true" FieldLabelWidth="30px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="CSIFsev" DatabaseField="CSIFsev" IsReadOnly = "true"  RenderReadOnlyAsDiv="true" FieldLabelWidth="30px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="CSIGsev" DatabaseField="CSIGsev" IsReadOnly = "true"  RenderReadOnlyAsDiv="true" FieldLabelWidth="30px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="CSIG2sev" DatabaseField="CSIG2sev" IsReadOnly = "true"  RenderReadOnlyAsDiv="true" FieldLabelWidth="30px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="CSIHsev" DatabaseField="CSIHsev" IsReadOnly = "true"  RenderReadOnlyAsDiv="true" FieldLabelWidth="30px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="CSIH2sev" DatabaseField="CSIH2sev" IsReadOnly = "true"  RenderReadOnlyAsDiv="true" FieldLabelWidth="30px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="CSIIsev" DatabaseField="CSIIsev" IsReadOnly = "true"  RenderReadOnlyAsDiv="true" FieldLabelWidth="30px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="CSIJsev" DatabaseField="CSIJsev" IsReadOnly = "true"  RenderReadOnlyAsDiv="true" FieldLabelWidth="30px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="CSIK1sev" DatabaseField="CSIK1sev" IsReadOnly = "true"  RenderReadOnlyAsDiv="true" FieldLabelWidth="30px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="CSIK2sev" DatabaseField="CSIK2sev" IsReadOnly = "true"  RenderReadOnlyAsDiv="true" FieldLabelWidth="30px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
</td>


  <td style="vertical-align:top" align="center"><def:datafieldcontrol runat="server" id="CSIA1coff" DatabaseField="CSIA1coff" IsReadOnly = "true"  RenderReadOnlyAsDiv="true" FieldLabelWidth="30px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="CSIA2coff" DatabaseField="CSIA2coff" IsReadOnly = "true"  RenderReadOnlyAsDiv="true" FieldLabelWidth="30px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="CSIA3coff" DatabaseField="CSIA3coff" IsReadOnly = "true"  RenderReadOnlyAsDiv="true" FieldLabelWidth="30px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="CSIBcoff" DatabaseField="CSIBcoff" IsReadOnly = "true"  RenderReadOnlyAsDiv="true" FieldLabelWidth="30px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="CSICcoff" DatabaseField="CSICcoff" IsReadOnly = "true"  RenderReadOnlyAsDiv="true" FieldLabelWidth="30px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="CSIDcoff" DatabaseField="CSIDcoff" IsReadOnly = "true"  RenderReadOnlyAsDiv="true" FieldLabelWidth="30px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="CSIE1coff" DatabaseField="CSIE1coff" IsReadOnly = "true"  RenderReadOnlyAsDiv="true" FieldLabelWidth="30px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="CSIE2coff" DatabaseField="CSIE2coff" IsReadOnly = "true"  RenderReadOnlyAsDiv="true" FieldLabelWidth="30px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="CSIE3coff" DatabaseField="CSIE3coff" IsReadOnly = "true"  RenderReadOnlyAsDiv="true" FieldLabelWidth="30px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="CSIE4coff" DatabaseField="CSIE4coff" IsReadOnly = "true"  RenderReadOnlyAsDiv="true" FieldLabelWidth="30px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="CSIFcoff" DatabaseField="CSIFcoff" IsReadOnly = "true"  RenderReadOnlyAsDiv="true" FieldLabelWidth="30px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="CSIGcoff" DatabaseField="CSIGcoff" IsReadOnly = "true"  RenderReadOnlyAsDiv="true" FieldLabelWidth="30px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="CSIG2coff" DatabaseField="CSIG2coff" IsReadOnly = "true"  RenderReadOnlyAsDiv="true" FieldLabelWidth="30px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="CSIHcoff" DatabaseField="CSIHcoff" IsReadOnly = "true"  RenderReadOnlyAsDiv="true" FieldLabelWidth="30px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="CSIH2coff" DatabaseField="CSIH2coff" IsReadOnly = "true"  RenderReadOnlyAsDiv="true" FieldLabelWidth="30px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="CSIIcoff" DatabaseField="CSIIcoff" IsReadOnly = "true"  RenderReadOnlyAsDiv="true" FieldLabelWidth="30px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="CSIJcoff" DatabaseField="CSIJcoff" IsReadOnly = "true"  RenderReadOnlyAsDiv="true" FieldLabelWidth="30px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="CSIK1coff" DatabaseField="CSIK1coff" IsReadOnly = "true"  RenderReadOnlyAsDiv="true" FieldLabelWidth="30px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="CSIK2coff" DatabaseField="CSIK2coff" IsReadOnly = "true"  RenderReadOnlyAsDiv="true" FieldLabelWidth="30px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
</td>


  <td style="vertical-align:top" align="center">
<def:datafieldcontrol runat="server" id="CSIA1_T" DatabaseField="CSIA1_T" IsReadOnly = "true"  RenderReadOnlyAsDiv="true" FieldLabelWidth="30px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="CSIA2_T" DatabaseField="CSIA2_T" IsReadOnly = "true"  RenderReadOnlyAsDiv="true" FieldLabelWidth="30px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="CSIA3_T" DatabaseField="CSIA3_T" IsReadOnly = "true"  RenderReadOnlyAsDiv="true" FieldLabelWidth="30px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="CSIB_T" DatabaseField="CSIB_T" IsReadOnly = "true"  RenderReadOnlyAsDiv="true" FieldLabelWidth="30px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="CSIC_T" DatabaseField="CSIC_T" IsReadOnly = "true"  RenderReadOnlyAsDiv="true" FieldLabelWidth="30px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="CSID_T" DatabaseField="CSID_T" IsReadOnly = "true"  RenderReadOnlyAsDiv="true" FieldLabelWidth="30px" FieldTextBoxWidth="40px"></def:datafieldcontrol>

<def:datafieldcontrol runat="server" id="CSIE1_T" DatabaseField="CSIE1_T" IsReadOnly = "true"  RenderReadOnlyAsDiv="true" FieldLabelWidth="30px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="CSIE2_T" DatabaseField="CSIE2_T" IsReadOnly = "true"  RenderReadOnlyAsDiv="true" FieldLabelWidth="30px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="CSIE3_T" DatabaseField="CSIE3_T" IsReadOnly = "true"  RenderReadOnlyAsDiv="true" FieldLabelWidth="30px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="CSIE4_T" DatabaseField="CSIE4_T" IsReadOnly = "true"  RenderReadOnlyAsDiv="true" FieldLabelWidth="30px" FieldTextBoxWidth="40px"></def:datafieldcontrol>


<def:datafieldcontrol runat="server" id="CSIF_T" DatabaseField="CSIF_T" IsReadOnly = "true"  RenderReadOnlyAsDiv="true" FieldLabelWidth="30px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="CSIG_T" DatabaseField="CSIG_T" IsReadOnly = "true"  RenderReadOnlyAsDiv="true" FieldLabelWidth="30px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="CSIG2_T" DatabaseField="CSIG2_T" IsReadOnly = "true"  RenderReadOnlyAsDiv="true" FieldLabelWidth="30px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="CSIH_T" DatabaseField="CSIH_T" IsReadOnly = "true"  RenderReadOnlyAsDiv="true" FieldLabelWidth="30px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="CSIH2_T" DatabaseField="CSIH2_T" IsReadOnly = "true"  RenderReadOnlyAsDiv="true" FieldLabelWidth="30px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="CSII_T" DatabaseField="CSII_T" IsReadOnly = "true"  RenderReadOnlyAsDiv="true" FieldLabelWidth="30px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="CSIJ_T" DatabaseField="CSIJ_T" IsReadOnly = "true"  RenderReadOnlyAsDiv="true" FieldLabelWidth="30px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
</td>
</tr>
</table>


<h3>Category A</h3>
<div class="collection">
  <div class="main">
  <def:datafieldcontrol runat="server" id="CSIA01" DatabaseField="CSIA01"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
  <def:datafieldcontrol runat="server" id="CSIA02" DatabaseField="CSIA02"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
  <def:datafieldcontrol runat="server" id="CSIA03" DatabaseField="CSIA03"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
  <def:datafieldcontrol runat="server" id="CSIA04" DatabaseField="CSIA04"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
  <def:datafieldcontrol runat="server" id="CSIA05" DatabaseField="CSIA05"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
  <def:datafieldcontrol runat="server" id="CSIA06" DatabaseField="CSIA06"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
  <def:datafieldcontrol runat="server" id="CSIA07" DatabaseField="CSIA07"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
  <def:datafieldcontrol runat="server" id="CSIA08" DatabaseField="CSIA08"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
  <def:datafieldcontrol runat="server" id="CSIA09" DatabaseField="CSIA09"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
  <def:datafieldcontrol runat="server" id="CSIA10" DatabaseField="CSIA10"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
  <def:datafieldcontrol runat="server" id="CSIA11" DatabaseField="CSIA11"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
  <def:datafieldcontrol runat="server" id="CSIA12" DatabaseField="CSIA12"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
  <def:datafieldcontrol runat="server" id="CSIA13" DatabaseField="CSIA13"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
  <def:datafieldcontrol runat="server" id="CSIA14" DatabaseField="CSIA14"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
  <def:datafieldcontrol runat="server" id="CSIA15" DatabaseField="CSIA15"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
  <def:datafieldcontrol runat="server" id="CSIA16" DatabaseField="CSIA16"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
  <def:datafieldcontrol runat="server" id="CSIA17" DatabaseField="CSIA17"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
  <def:datafieldcontrol runat="server" id="CSIA18" DatabaseField="CSIA18"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
  </div>
  <div class="key"><def:ValueSetLabel ID="ValueSetLabel_CSIA01" runat="server"  DatabaseField="CSIA01"></def:ValueSetLabel></div>
</div>
<h3>Category B</h3>
<div class="collection">
  <div class="main">
  <def:datafieldcontrol runat="server" id="CSIB19" DatabaseField="CSIB19"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
  <def:datafieldcontrol runat="server" id="CSIB20" DatabaseField="CSIB20"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
  <def:datafieldcontrol runat="server" id="CSIB21" DatabaseField="CSIB21"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
  <def:datafieldcontrol runat="server" id="CSIB22" DatabaseField="CSIB22"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
  <def:datafieldcontrol runat="server" id="CSIB23" DatabaseField="CSIB23"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
  <def:datafieldcontrol runat="server" id="CSIB24" DatabaseField="CSIB24"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
  <def:datafieldcontrol runat="server" id="CSIB25" DatabaseField="CSIB25"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
  <def:datafieldcontrol runat="server" id="CSIB26" DatabaseField="CSIB26"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
  </div>
  <div class="key"><def:ValueSetLabel ID="ValueSetLabel_CSIB19" runat="server"  DatabaseField="CSIB19"></def:ValueSetLabel></div>
</div>
<h3>Category C</h3>
<div class="collection">
  <div class="main">
  <def:datafieldcontrol runat="server" id="CSIC27" DatabaseField="CSIC27"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
  <def:datafieldcontrol runat="server" id="CSIC28" DatabaseField="CSIC28"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
  <def:datafieldcontrol runat="server" id="CSIC29" DatabaseField="CSIC29"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
  <def:datafieldcontrol runat="server" id="CSIC30" DatabaseField="CSIC30"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
  <def:datafieldcontrol runat="server" id="CSIC31" DatabaseField="CSIC31"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
  <def:datafieldcontrol runat="server" id="CSIC32" DatabaseField="CSIC32"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
  <def:datafieldcontrol runat="server" id="CSIC33" DatabaseField="CSIC33"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
  <def:datafieldcontrol runat="server" id="CSIC34" DatabaseField="CSIC34"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
  <def:datafieldcontrol runat="server" id="CSIC35" DatabaseField="CSIC35"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
  <def:datafieldcontrol runat="server" id="CSIC36" DatabaseField="CSIC36"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
  <def:datafieldcontrol runat="server" id="CSIC37" DatabaseField="CSIC37"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
  <def:datafieldcontrol runat="server" id="CSIC38" DatabaseField="CSIC38"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
  <def:datafieldcontrol runat="server" id="CSIC39" DatabaseField="CSIC39"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
  <def:datafieldcontrol runat="server" id="CSIC40" DatabaseField="CSIC40"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
  <def:datafieldcontrol runat="server" id="CSIC41" DatabaseField="CSIC41"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
  </div>
  <div class="key"><def:ValueSetLabel ID="ValueSetLabel_CSIC27" runat="server"  DatabaseField="CSIC27"></def:ValueSetLabel></div>
</div>
<h3>Category D</h3>
<div class="collection">
  <div class="main">
  <def:datafieldcontrol runat="server" id="CSID42" DatabaseField="CSID42"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
  <def:datafieldcontrol runat="server" id="CSID43" DatabaseField="CSID43"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
  <def:datafieldcontrol runat="server" id="CSID44" DatabaseField="CSID44"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
  <def:datafieldcontrol runat="server" id="CSID45" DatabaseField="CSID45"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
  <def:datafieldcontrol runat="server" id="CSID46" DatabaseField="CSID46"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
  <def:datafieldcontrol runat="server" id="CSID47" DatabaseField="CSID47"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
  <def:datafieldcontrol runat="server" id="CSID48" DatabaseField="CSID48"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
  </div>
  <div class="key"><def:ValueSetLabel ID="ValueSetLabel_CSID42" runat="server"  DatabaseField="CSID42"></def:ValueSetLabel></div>
</div>
<h3>Category E</h3>
<div class="collection">
  <div class="main">
  <def:datafieldcontrol runat="server" id="CSIE49" DatabaseField="CSIE49"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
  <def:datafieldcontrol runat="server" id="CSIE50" DatabaseField="CSIE50"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
  <def:datafieldcontrol runat="server" id="CSIE51" DatabaseField="CSIE51"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
  <def:datafieldcontrol runat="server" id="CSIE52" DatabaseField="CSIE52"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
  <def:datafieldcontrol runat="server" id="CSIE53" DatabaseField="CSIE53"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
  <def:datafieldcontrol runat="server" id="CSIE54" DatabaseField="CSIE54"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
  </div>
  <div class="key"><def:ValueSetLabel ID="ValueSetLabel_CSIE49" runat="server"  DatabaseField="CSIE49"></def:ValueSetLabel></div>
</div>
<h3>Category F</h3>
<div class="collection">
  <div class="main">
  <def:datafieldcontrol runat="server" id="CSIF55" DatabaseField="CSIF55"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
  <def:datafieldcontrol runat="server" id="CSIF56" DatabaseField="CSIF56"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
  <def:datafieldcontrol runat="server" id="CSIF57" DatabaseField="CSIF57"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
  <def:datafieldcontrol runat="server" id="CSIF58" DatabaseField="CSIF58"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
  <def:datafieldcontrol runat="server" id="CSIF59" DatabaseField="CSIF59"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
  </div>
  <div class="key"><def:ValueSetLabel ID="ValueSetLabel_CSIF55" runat="server"  DatabaseField="CSIF55"></def:ValueSetLabel></div>
</div>
<h3>Category G</h3>
<div class="collection">
  <div class="main">
  <def:datafieldcontrol runat="server" id="CSIG60" DatabaseField="CSIG60"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
  <def:datafieldcontrol runat="server" id="CSIG61" DatabaseField="CSIG61"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
  <def:datafieldcontrol runat="server" id="CSIG62" DatabaseField="CSIG62"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
  <def:datafieldcontrol runat="server" id="CSIG63" DatabaseField="CSIG63"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
  <def:datafieldcontrol runat="server" id="CSIG64" DatabaseField="CSIG64"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
  <def:datafieldcontrol runat="server" id="CSIG65" DatabaseField="CSIG65"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
  <def:datafieldcontrol runat="server" id="CSIG66" DatabaseField="CSIG66"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
  </div>
  <div class="key"><def:ValueSetLabel ID="ValueSetLabel_CSIG60" runat="server"  DatabaseField="CSIG60"></def:ValueSetLabel></div>
</div>
<div class="collection">
  <div class="main">
  <def:datafieldcontrol runat="server" id="CSIG67" DatabaseField="CSIG67"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
  <def:datafieldcontrol runat="server" id="CSIG68" DatabaseField="CSIG68"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
  <def:datafieldcontrol runat="server" id="CSIG69" DatabaseField="CSIG69"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
  <def:datafieldcontrol runat="server" id="CSIG70" DatabaseField="CSIG70"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
  <def:datafieldcontrol runat="server" id="CSIG71" DatabaseField="CSIG71"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
  </div>
  <div class="key"><def:ValueSetLabel ID="ValueSetLabel_CSIG67" runat="server"  DatabaseField="CSIG67"></def:ValueSetLabel></div>
</div>
<h3>Category H</h3>
<div class="collection">
  <div class="main">
  <def:datafieldcontrol runat="server" id="CSIH72" DatabaseField="CSIH72"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
  <def:datafieldcontrol runat="server" id="CSIH73" DatabaseField="CSIH73"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
  <def:datafieldcontrol runat="server" id="CSIH74" DatabaseField="CSIH74"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
  <def:datafieldcontrol runat="server" id="CSIH75" DatabaseField="CSIH75"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
  <def:datafieldcontrol runat="server" id="CSIH76" DatabaseField="CSIH76"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
  <def:datafieldcontrol runat="server" id="CSIH77" DatabaseField="CSIH77"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
  <def:datafieldcontrol runat="server" id="CSIH78" DatabaseField="CSIH78"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
  <def:datafieldcontrol runat="server" id="CSIH79" DatabaseField="CSIH79"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
  <def:datafieldcontrol runat="server" id="CSIH80" DatabaseField="CSIH80"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
  <def:datafieldcontrol runat="server" id="CSIH81" DatabaseField="CSIH81"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
  <def:datafieldcontrol runat="server" id="CSIH82" DatabaseField="CSIH82"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
  <def:datafieldcontrol runat="server" id="CSIH83" DatabaseField="CSIH83"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
  </div>
  <div class="key"><def:ValueSetLabel ID="ValueSetLabel_CSIH72" runat="server"  DatabaseField="CSIH72"></def:ValueSetLabel></div>
</div>
<h3>Category I</h3>
<div class="collection">
  <div class="main">
  <def:datafieldcontrol runat="server" id="CSII84" DatabaseField="CSII84"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
  <def:datafieldcontrol runat="server" id="CSII85" DatabaseField="CSII85"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
  <def:datafieldcontrol runat="server" id="CSII86" DatabaseField="CSII86"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
  <def:datafieldcontrol runat="server" id="CSII87" DatabaseField="CSII87"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
  </div>
  <div class="key"><def:ValueSetLabel ID="ValueSetLabel_CSII84" runat="server"  DatabaseField="CSII84"></def:ValueSetLabel></div>
</div>
<h3>Category J</h3>
<div class="collection">
  <div class="main">
  <def:datafieldcontrol runat="server" id="CSIJ88" DatabaseField="CSIJ88"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
  <def:datafieldcontrol runat="server" id="CSIJ89" DatabaseField="CSIJ89"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
  <def:datafieldcontrol runat="server" id="CSIJ90" DatabaseField="CSIJ90"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
  <def:datafieldcontrol runat="server" id="CSIJ91" DatabaseField="CSIJ91"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
  <def:datafieldcontrol runat="server" id="CSIJ92" DatabaseField="CSIJ92"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
  <def:datafieldcontrol runat="server" id="CSIJ93" DatabaseField="CSIJ93"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
  <def:datafieldcontrol runat="server" id="CSIJ94" DatabaseField="CSIJ94"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
  <def:datafieldcontrol runat="server" id="CSIJ95" DatabaseField="CSIJ95"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
  <def:datafieldcontrol runat="server" id="CSIJ96" DatabaseField="CSIJ96"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
  <def:datafieldcontrol runat="server" id="CSIJ97" DatabaseField="CSIJ97"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
  </div>
  <div class="key"><def:ValueSetLabel ID="ValueSetLabel_CSIJ88" runat="server"  DatabaseField="CSIJ88"></def:ValueSetLabel></div>
</div>
</asp:panel>
<div class="main">
<def:datafieldcontrol runat="server" id="created" DatabaseField="created"  IsReadOnly="true" RenderReadOnlyAsDiv="true"   FieldLabelWidth="300px "></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="createdBy" DatabaseField="createdBy"  IsReadOnly="true" RenderReadOnlyAsDiv="true"   FieldLabelWidth="300px "></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="updated" DatabaseField="updated"  IsReadOnly="true" RenderReadOnlyAsDiv="true"   FieldLabelWidth="300px "></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="updatedBy" DatabaseField="updatedBy"  IsReadOnly="true" RenderReadOnlyAsDiv="true"   FieldLabelWidth="300px "></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="scored" DatabaseField="scored"  IsReadOnly="true" RenderReadOnlyAsDiv="true"   FieldLabelWidth="300px "></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="scoredBy" DatabaseField="scoredBy"  IsReadOnly="true" RenderReadOnlyAsDiv="true"   FieldLabelWidth="300px "></def:datafieldcontrol>
</div>
</asp:Content>
