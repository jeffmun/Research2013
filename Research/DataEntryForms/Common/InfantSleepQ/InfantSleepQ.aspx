<%@ Register TagPrefix="def" Namespace="DataEntryFramework3" %> 
<%@ Page language="c#" MasterPageFile="~/UWAC.master"  Title="InfantSleepQ Data Entry" %>
<asp:Content ID="Content1" ContentPlaceHolderID="oBodyPlaceHolder" runat="server">

<def:dataentrycontroller id="DataEntryController1" runat="server" DatabaseTable="ALL_InfantSleepQ" PrimaryKeyField="isq_pk" >
</def:dataentrycontroller>
<div class="main">
    <def:datafieldcontrol runat="server" id="id" DatabaseField="id" IsInsertField="true" FieldLabelWidth="300px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="15"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="indexnum" DatabaseField="indexnum" IsInsertField="true" FieldTextBoxTextDefault="1" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
</div>
<asp:panel id="mainPanel" CssClass="mainPanel" runat="server">
<div class="collection">
  <div class="main"><def:datafieldcontrol runat="server" id="ISQ01" DatabaseField="ISQ01" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
  <div class="key"><def:ValueSetLabel ID="ValueSetLabel_ISQ01" runat="server"  DatabaseField="ISQ01"></def:ValueSetLabel></div>
</div>
<p />
<div class="collection">
  <div class="main"><def:datafieldcontrol runat="server" id="ISQ02" DatabaseField="ISQ02" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
  <div class="key"><def:ValueSetLabel ID="ValueSetLabel_ISQ02" runat="server"  DatabaseField="ISQ02"></def:ValueSetLabel></div>
</div>
<p />
<div class="collection">
  <div class="main"><def:datafieldcontrol runat="server" id="ISQ03" DatabaseField="ISQ03" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
 
</div>
<p />
<div class="collection">
  <div class="main"><def:datafieldcontrol runat="server" id="ISQ04" DatabaseField="ISQ04" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
  <div class="key"><def:ValueSetLabel ID="ValueSetLabel_ISQ04" runat="server"  DatabaseField="ISQ04"></def:ValueSetLabel></div>
</div>
<p />
<div class="collection">
  <div class="main"><def:datafieldcontrol runat="server" id="ISQ05" DatabaseField="ISQ05" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
  <div class="key"><def:ValueSetLabel ID="ValueSetLabel_ISQ05" runat="server"  DatabaseField="ISQ05"></def:ValueSetLabel></div>
</div>
<p />
<div class="collection">
  <div class="main"><def:datafieldcontrol runat="server" id="ISQ06" DatabaseField="ISQ06" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
  <div class="key"><def:ValueSetLabel ID="ValueSetLabel_ISQ06" runat="server"  DatabaseField="ISQ06"></def:ValueSetLabel></div>
</div>
<p />
<div class="collection">
  <div class="main"><def:datafieldcontrol runat="server" id="ISQ07" DatabaseField="ISQ07" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>

</div>
<p />
<div class="collection">
  <div class="main"><def:datafieldcontrol runat="server" id="ISQ08" DatabaseField="ISQ08" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
  <div class="key"><def:ValueSetLabel ID="ValueSetLabel_ISQ08" runat="server"  DatabaseField="ISQ08"></def:ValueSetLabel></div>
</div>
<p />
<div class="collection">
  <div class="main"><def:datafieldcontrol runat="server" id="ISQ09" DatabaseField="ISQ09" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>

</div>
<p />
<div class="collection">
  <div class="main"><def:datafieldcontrol runat="server" id="ISQ10" DatabaseField="ISQ10" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
  <div class="key"><def:ValueSetLabel ID="ValueSetLabel_ISQ10" runat="server"  DatabaseField="ISQ10"></def:ValueSetLabel></div>
</div>
</asp:Panel>
<div class="main">
    <def:datafieldcontrol runat="server" id="created" DatabaseField="created" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="300px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="createdBy" DatabaseField="createdBy" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="300px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="50"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="updated" DatabaseField="updated" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="300px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="updatedBy" DatabaseField="updatedBy" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="300px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="50"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="scored" DatabaseField="scored" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="300px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="scoredBy" DatabaseField="scoredBy" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="300px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="50"></def:datafieldcontrol>
</div>
</asp:Content>
