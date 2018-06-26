<%@ Register TagPrefix="def" Namespace="DataEntryFramework3" %> 
<%@ Page language="c#" MasterPageFile="~/UWAC.master"  Title="SSC_Screen Data Entry" %>
<asp:Content ID="Content1" ContentPlaceHolderID="oBodyPlaceHolder" runat="server">
<def:dataentrycontroller id="DataEntryController1" runat="server" DatabaseTable="ALL_SSC_Screen" >
</def:dataentrycontroller>
<def:datafieldcontrol runat="server" id="id" DatabaseField="id"  IsInsertField="true"   FieldLabelWidth="300px "></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="indexnum" DatabaseField="indexnum"  IsInsertField="true"   FieldLabelWidth="300px" FieldTextBoxText="1"></def:datafieldcontrol>
<br />
<asp:Panel id="mainPanel" runat="server">
<!-- Insert proband age and gender -->
<div style="padding-left:300px">
<def:ValueSetLabel ID="ValueSetLabel_SScrSource" runat="server"  DatabaseField="SScrSource"></def:ValueSetLabel>
</div>
<def:datafieldcontrol runat="server" id="SScrSource" DatabaseField="SScrSource"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="50px" FieldTextBoxMaxLength="2"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="SScrSpecSo" DatabaseField="SScrSpecSo"  IsEntryField="true" IsDoubleEntryField="false"  FieldLabelWidth="300px" FieldTextBoxWidth="500px" FieldTextBoxMaxLength="500" FieldTextBoxHeight="60px" FieldTextBoxTextMode="MultiLine"></def:datafieldcontrol>
<br />
<div style="padding-left:300px">
<def:ValueSetLabel ID="ValueSetLabel_SScrProbDx" runat="server"  DatabaseField="SScrProbDx"></def:ValueSetLabel>
</div>
<def:datafieldcontrol runat="server" id="SScrProbDx" DatabaseField="SScrProbDx"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="50px" FieldTextBoxMaxLength="2"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="SScrSpecPD" DatabaseField="SScrSpecPD"  IsEntryField="true" IsDoubleEntryField="false"  FieldLabelWidth="300px" FieldTextBoxWidth="500px" FieldTextBoxMaxLength="500" FieldTextBoxHeight="60px" FieldTextBoxTextMode="MultiLine"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="SScrDxWhen" DatabaseField="SScrDxWhen"  IsEntryField="true" IsDoubleEntryField="false"  FieldLabelWidth="300px" FieldTextBoxWidth="500px" FieldTextBoxMaxLength="100"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="SScrDxFWho" DatabaseField="SScrDxFWho"  IsEntryField="true" IsDoubleEntryField="false"  FieldLabelWidth="300px" FieldTextBoxWidth="500px" FieldTextBoxMaxLength="500" FieldTextBoxHeight="60px" FieldTextBoxTextMode="MultiLine"></def:datafieldcontrol>
<table border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td>
      <def:datafieldcontrol runat="server" id="SScrVerbal" DatabaseField="SScrVerbal"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="50px" FieldTextBoxMaxLength="2"></def:datafieldcontrol>
    </td>
    <td style="padding-left:50px">
      <def:ValueSetLabel ID="ValueSetLabel_SScrVerbal" runat="server"  DatabaseField="SScrVerbal"></def:ValueSetLabel>
    </td>
  </tr>
</table>
<def:datafieldcontrol runat="server" id="SScrSpecVe" DatabaseField="SScrSpecVe"  IsEntryField="true" IsDoubleEntryField="false"  FieldLabelWidth="300px" FieldTextBoxWidth="500px" FieldTextBoxMaxLength="500" FieldTextBoxHeight="60px" FieldTextBoxTextMode="MultiLine"></def:datafieldcontrol>
<br />
<div style="padding-left:300px">
<def:ValueSetLabel ID="ValueSetLabel_SScrVeType" runat="server"  DatabaseField="SScrVeType"></def:ValueSetLabel>
</div>
<def:datafieldcontrol runat="server" id="SScrVeType" DatabaseField="SScrVeType"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="50px" FieldTextBoxMaxLength="2"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="SScrServcs" DatabaseField="SScrServcs"  IsEntryField="true" IsDoubleEntryField="false"  FieldLabelWidth="300px" FieldTextBoxWidth="500px" FieldTextBoxMaxLength="1000" FieldTextBoxHeight="120px" FieldTextBoxTextMode="MultiLine"></def:datafieldcontrol>
<table border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td>
      <def:datafieldcontrol runat="server" id="SScrIQTest" DatabaseField="SScrIQTest"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="50px" FieldTextBoxMaxLength="2"></def:datafieldcontrol>
    </td>
    <td style="padding-left:50px">
      <def:ValueSetLabel ID="ValueSetLabel_SScrIQTest" runat="server"  DatabaseField="SScrIQTest"></def:ValueSetLabel>
    </td>
  </tr>
</table>
<def:datafieldcontrol runat="server" id="SScrSpecIQ" DatabaseField="SScrSpecIQ"  IsEntryField="true" IsDoubleEntryField="false"  FieldLabelWidth="300px" FieldTextBoxWidth="500px" FieldTextBoxMaxLength="500" FieldTextBoxHeight="60px" FieldTextBoxTextMode="MultiLine"></def:datafieldcontrol>
<table border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td>
      <def:datafieldcontrol runat="server" id="SScrOthFam" DatabaseField="SScrOthFam"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="50px" FieldTextBoxMaxLength="2"></def:datafieldcontrol>
    </td>
    <td style="padding-left:50px">
      <def:ValueSetLabel ID="ValueSetLabel_SScrOthFam" runat="server"  DatabaseField="SScrOthFam"></def:ValueSetLabel>
    </td>
  </tr>
</table>
<def:datafieldcontrol runat="server" id="SScrWhoFam" DatabaseField="SScrWhoFam"  IsEntryField="true" IsDoubleEntryField="false"  FieldLabelWidth="300px" FieldTextBoxWidth="500px" FieldTextBoxMaxLength="500" FieldTextBoxHeight="60px" FieldTextBoxTextMode="MultiLine"></def:datafieldcontrol>
<table border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td>
      <def:datafieldcontrol runat="server" id="SScrBloodD" DatabaseField="SScrBloodD"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="50px" FieldTextBoxMaxLength="2"></def:datafieldcontrol>
    </td>
    <td style="padding-left:50px">
      <def:ValueSetLabel ID="ValueSetLabel_SScrBloodD" runat="server"  DatabaseField="SScrBloodD"></def:ValueSetLabel>
    </td>
  </tr>
</table>
<def:datafieldcontrol runat="server" id="SScrSpecBD" DatabaseField="SScrSpecBD"  IsEntryField="true" IsDoubleEntryField="false"  FieldLabelWidth="300px" FieldTextBoxWidth="500px" FieldTextBoxMaxLength="500" FieldTextBoxHeight="60px" FieldTextBoxTextMode="MultiLine"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="SScrDietRs" DatabaseField="SScrDietRs"  IsEntryField="true" IsDoubleEntryField="false"  FieldLabelWidth="300px" FieldTextBoxWidth="500px" FieldTextBoxMaxLength="500" FieldTextBoxHeight="60px" FieldTextBoxTextMode="MultiLine"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="SScrTabTop" DatabaseField="SScrTabTop"  IsEntryField="true" IsDoubleEntryField="false"  FieldLabelWidth="300px" FieldTextBoxWidth="500px" FieldTextBoxMaxLength="500" FieldTextBoxHeight="60px" FieldTextBoxTextMode="MultiLine"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="SScrMotiva" DatabaseField="SScrMotiva"  IsEntryField="true" IsDoubleEntryField="false"  FieldLabelWidth="300px" FieldTextBoxWidth="500px" FieldTextBoxMaxLength="500" FieldTextBoxHeight="60px" FieldTextBoxTextMode="MultiLine"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="SScrBreaks" DatabaseField="SScrBreaks"  IsEntryField="true" IsDoubleEntryField="false"  FieldLabelWidth="300px" FieldTextBoxWidth="500px" FieldTextBoxMaxLength="500" FieldTextBoxHeight="60px" FieldTextBoxTextMode="MultiLine"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="SScrVisSch" DatabaseField="SScrVisSch"  IsEntryField="true" IsDoubleEntryField="false"  FieldLabelWidth="300px" FieldTextBoxWidth="500px" FieldTextBoxMaxLength="500" FieldTextBoxHeight="60px" FieldTextBoxTextMode="MultiLine"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="SScrParInR" DatabaseField="SScrParInR"  IsEntryField="true" IsDoubleEntryField="false"  FieldLabelWidth="300px" FieldTextBoxWidth="500px" FieldTextBoxMaxLength="500" FieldTextBoxHeight="60px" FieldTextBoxTextMode="MultiLine"></def:datafieldcontrol>
<table border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td>
      <def:datafieldcontrol runat="server" id="SScrOthStu" DatabaseField="SScrOthStu"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="50px" FieldTextBoxMaxLength="2"></def:datafieldcontrol>
    </td>
    <td style="padding-left:50px">
      <def:ValueSetLabel ID="ValueSetLabel_SScrOthStu" runat="server"  DatabaseField="SScrOthStu"></def:ValueSetLabel>
    </td>
  </tr>
</table>
</asp:Panel>
<br />
<def:datafieldcontrol runat="server" id="created" DatabaseField="created"  IsReadOnly="true" RenderReadOnlyAsDiv="true"   FieldLabelWidth="300px "></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="createdBy" DatabaseField="createdBy"  IsReadOnly="true" RenderReadOnlyAsDiv="true"   FieldLabelWidth="300px "></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="updated" DatabaseField="updated"  IsReadOnly="true" RenderReadOnlyAsDiv="true"   FieldLabelWidth="300px "></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="updatedBy" DatabaseField="updatedBy"  IsReadOnly="true" RenderReadOnlyAsDiv="true"   FieldLabelWidth="300px "></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="scored" DatabaseField="scored"  IsReadOnly="true" RenderReadOnlyAsDiv="true"   FieldLabelWidth="300px "></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="scoredBy" DatabaseField="scoredBy"  IsReadOnly="true" RenderReadOnlyAsDiv="true"   FieldLabelWidth="300px "></def:datafieldcontrol>
</asp:Content>
