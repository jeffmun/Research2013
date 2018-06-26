<%@ Register TagPrefix="def" Namespace="DataEntryFramework3" %> 
<%@ Page language="c#" MasterPageFile="~/UWAC.master"  Title="Nonword Repitition Data Entry" %>
<asp:Content ID="Content1" ContentPlaceHolderID="oBodyPlaceHolder" runat="server">

<def:dataentrycontroller id="DataEntryController1" runat="server" DatabaseTable="ALL_NonwordRep" >
</def:dataentrycontroller>
<div class="main">
  <def:datafieldcontrol runat="server" id="id" DatabaseField="id"  IsInsertField="true"   FieldLabelWidth="250px"></def:datafieldcontrol>
  <def:datafieldcontrol runat="server" id="indexnum" DatabaseField="indexnum"  IsInsertField="true" FieldTextBoxTextDefault="1" FieldLabelWidth="250px"></def:datafieldcontrol>
  <def:datafieldcontrol runat="server" id="CTOPdate" DatabaseField="CTOPdate"  IsInsertField="true" FieldLabelText="Test Date" FieldLabelWidth="250px"></def:datafieldcontrol>
  <def:datafieldcontrol runat="server" id="CTOPclin" DatabaseField="CTOPclin"  IsInsertField="true" FieldLabelText="Clinician" FieldLabelWidth="250px"></def:datafieldcontrol>
</div>
<asp:panel id="mainPanel" CssClass="mainPanel" runat="server">
<div class="collection">
  <div class="main">
    <def:datafieldcontrol runat="server" id="Test01" DatabaseField="Test01"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="200px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="Test02" DatabaseField="Test02"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="200px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="Test03" DatabaseField="Test03"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="200px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="Test04" DatabaseField="Test04"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="200px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="Test05" DatabaseField="Test05"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="200px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="Test06" DatabaseField="Test06"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="200px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="Test07" DatabaseField="Test07"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="200px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="Test08" DatabaseField="Test08"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="200px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="Test09" DatabaseField="Test09"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="200px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="Test10" DatabaseField="Test10"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="200px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="Test11" DatabaseField="Test11"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="200px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="Test12" DatabaseField="Test12"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="200px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="Test13" DatabaseField="Test13"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="200px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="Test14" DatabaseField="Test14"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="200px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="Test15" DatabaseField="Test15"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="200px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="Test16" DatabaseField="Test16"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="200px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="Test17" DatabaseField="Test17"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="200px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="Test18" DatabaseField="Test18"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="200px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
  </div>
  <div class="key"><def:ValueSetLabel ID="ValueSetLabel_Test01" runat="server"  DatabaseField="Test01"></def:ValueSetLabel></div>
</div>

<br />
<div class="collection">
  <div class="main"><def:datafieldcontrol runat="server" id="CTOPVld" DatabaseField="CTOPVld" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="100px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
  <div class="key"><def:ValueSetLabel ID="ValueSetLabel_CTOPVld" runat="server"  DatabaseField="CTOPVld"></def:ValueSetLabel></div>
</div>
<div class="main"><def:datafieldcontrol runat="server" id="CTOPcmnt" DatabaseField="CTOPcmnt"  IsEntryField="true" IsDoubleEntryField="false"  FieldLabelWidth="100px" FieldTextBoxWidth="400px" FieldTextBoxHeight="40px" FieldTextBoxTextMode="MultiLine" FieldTextBoxMaxLength="1000"></def:datafieldcontrol></div>
</asp:Panel>

<div class="main"><def:datafieldcontrol runat="server" id="NR_raw" DatabaseField="NR_raw"  IsReadOnly="true"  RenderReadOnlyAsDiv="true" FieldLabelWidth="200px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
<div class="main"><def:datafieldcontrol runat="server" id="NR_SS" DatabaseField="NR_SS"  IsReadOnly="true"  RenderReadOnlyAsDiv="true" FieldLabelWidth="200px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
<div class="main"><def:datafieldcontrol runat="server" id="NR_AE" DatabaseField="NR_AE"  IsReadOnly="true"  RenderReadOnlyAsDiv="true" FieldLabelWidth="200px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
<div class="main"><def:datafieldcontrol runat="server" id="NR_AEym" DatabaseField="NR_AEym"  IsReadOnly="true"  RenderReadOnlyAsDiv="true" FieldLabelWidth="200px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
<div class="main"><def:datafieldcontrol runat="server" id="NR_scrmsg" DatabaseField="NR_scrmsg"  IsReadOnly="true"  RenderReadOnlyAsDiv="true" FieldLabelWidth="200px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>

<br/>
<br/>

<div class="main">
  <def:datafieldcontrol runat="server" id="created" DatabaseField="created"  IsReadOnly="true" RenderReadOnlyAsDiv="true"   FieldLabelWidth="250px"></def:datafieldcontrol>
  <def:datafieldcontrol runat="server" id="createdBy" DatabaseField="createdBy"  IsReadOnly="true" RenderReadOnlyAsDiv="true"   FieldLabelWidth="250px"></def:datafieldcontrol>
  <def:datafieldcontrol runat="server" id="updated" DatabaseField="updated"  IsReadOnly="true" RenderReadOnlyAsDiv="true"   FieldLabelWidth="250px"></def:datafieldcontrol>
  <def:datafieldcontrol runat="server" id="updatedBy" DatabaseField="updatedBy"  IsReadOnly="true" RenderReadOnlyAsDiv="true"   FieldLabelWidth="250px"></def:datafieldcontrol>
  <def:datafieldcontrol runat="server" id="scored" DatabaseField="scored"  IsReadOnly="true" RenderReadOnlyAsDiv="true"   FieldLabelWidth="250px"></def:datafieldcontrol>
  <def:datafieldcontrol runat="server" id="scoredBy" DatabaseField="scoredBy"  IsReadOnly="true" RenderReadOnlyAsDiv="true"   FieldLabelWidth="250px"></def:datafieldcontrol>
</div>
</asp:Content>
