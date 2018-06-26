<%@ Register TagPrefix="def" Namespace="DataEntryFramework3" %> 
<%@ Page language="c#" MasterPageFile="~/UWAC.master"  Title="OMInven Data Entry" %>
<asp:Content ID="Content1" ContentPlaceHolderID="oBodyPlaceHolder" runat="server">

<def:dataentrycontroller id="DataEntryController1" runat="server" DatabaseTable="ALL_OMInven" >
</def:dataentrycontroller>
<div class="main">
  <def:datafieldcontrol runat="server" id="id" DatabaseField="id" IsInsertField="true" FieldLabelWidth="300px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="15"></def:datafieldcontrol>
  <def:datafieldcontrol runat="server" id="indexnum" DatabaseField="indexnum" IsInsertField="true" FieldTextBoxTextDefault="1" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
  <def:datafieldcontrol runat="server" id="OMDate" DatabaseField="OMDate" FieldLabelText="Date" IsInsertField="true" FieldLabelWidth="300px"></def:datafieldcontrol>
  <def:datafieldcontrol runat="server" id="OMClin" DatabaseField="OMClin" FieldLabelText="Clinician" IsInsertField="true" FieldLabelWidth="300px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="50"></def:datafieldcontrol>
</div>
<asp:panel id="mainPanel" CssClass="mainPanel" runat="server">
<div class="legend">
Codes:<br />
<def:ValueSetLabel ID="ValueSetLabel_OMFeed" runat="server"  DatabaseField="OMFeed"></def:ValueSetLabel>
</div>
<div class="main"><def:datafieldcontrol runat="server" id="OMFeed" DatabaseField="OMFeed" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="200px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
<div class="collection">
  <div class="main"><def:datafieldcontrol runat="server" id="OM01Age" DatabaseField="OM01Age" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="80px" FieldTextBoxWidth="40px" CallOnBlur="OMInven_onBlur"></def:datafieldcontrol></div>
  <div class="key"><def:datafieldcontrol runat="server" id="OM01Code" DatabaseField="OM01Code" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="80px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
</div>
<div class="collection">
  <div class="main"><def:datafieldcontrol runat="server" id="OM02Age" DatabaseField="OM02Age" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="80px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
  <div class="key"><def:datafieldcontrol runat="server" id="OM02Code" DatabaseField="OM02Code" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="80px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
</div>
<div class="collection">
  <div class="main"><def:datafieldcontrol runat="server" id="OM03Age" DatabaseField="OM03Age" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="80px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
  <div class="key"><def:datafieldcontrol runat="server" id="OM03Code" DatabaseField="OM03Code" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="80px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
</div>
<div class="collection">
  <div class="main"><def:datafieldcontrol runat="server" id="OM04Age" DatabaseField="OM04Age" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="80px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
  <div class="key"><def:datafieldcontrol runat="server" id="OM04Code" DatabaseField="OM04Code" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="80px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
</div>
<div class="collection">
  <div class="main"><def:datafieldcontrol runat="server" id="OM05Age" DatabaseField="OM05Age" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="80px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
  <div class="key"><def:datafieldcontrol runat="server" id="OM05Code" DatabaseField="OM05Code" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="80px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
</div>
<div class="collection">
  <div class="main"><def:datafieldcontrol runat="server" id="OM06Age" DatabaseField="OM06Age" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="80px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
  <div class="key"><def:datafieldcontrol runat="server" id="OM06Code" DatabaseField="OM06Code" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="80px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
</div>
<div class="collection">
  <div class="main"><def:datafieldcontrol runat="server" id="OM07Age" DatabaseField="OM07Age" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="80px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
  <div class="key"><def:datafieldcontrol runat="server" id="OM07Code" DatabaseField="OM07Code" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="80px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
</div>
<div class="collection">
  <div class="main"><def:datafieldcontrol runat="server" id="OM08Age" DatabaseField="OM08Age" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="80px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
  <div class="key"><def:datafieldcontrol runat="server" id="OM08Code" DatabaseField="OM08Code" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="80px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
</div>
<div class="collection">
  <div class="main"><def:datafieldcontrol runat="server" id="OM09Age" DatabaseField="OM09Age" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="80px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
  <div class="key"><def:datafieldcontrol runat="server" id="OM09Code" DatabaseField="OM09Code" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="80px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
</div>
<div class="collection">
  <div class="main"><def:datafieldcontrol runat="server" id="OM10Age" DatabaseField="OM10Age" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="80px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
  <div class="key"><def:datafieldcontrol runat="server" id="OM10Code" DatabaseField="OM10Code" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="80px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
</div>
<div class="collection">
  <div class="main"><def:datafieldcontrol runat="server" id="OM11Age" DatabaseField="OM11Age" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="80px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
  <div class="key"><def:datafieldcontrol runat="server" id="OM11Code" DatabaseField="OM11Code" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="80px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
</div>
<div class="collection">
  <div class="main"><def:datafieldcontrol runat="server" id="OM12Age" DatabaseField="OM12Age" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="80px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
  <div class="key"><def:datafieldcontrol runat="server" id="OM12Code" DatabaseField="OM12Code" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="80px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
</div>
<div class="collection">
  <div class="main"><def:datafieldcontrol runat="server" id="OM13Age" DatabaseField="OM13Age" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="80px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
  <div class="key"><def:datafieldcontrol runat="server" id="OM13Code" DatabaseField="OM13Code" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="80px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
</div>
<div class="collection">
  <div class="main"><def:datafieldcontrol runat="server" id="OM14Age" DatabaseField="OM14Age" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="80px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
  <div class="key"><def:datafieldcontrol runat="server" id="OM14Code" DatabaseField="OM14Code" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="80px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
</div>
<div class="collection">
  <div class="main"><def:datafieldcontrol runat="server" id="OM15Age" DatabaseField="OM15Age" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="80px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
  <div class="key"><def:datafieldcontrol runat="server" id="OM15Code" DatabaseField="OM15Code" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="80px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
</div>
<div class="collection">
  <div class="main"><def:datafieldcontrol runat="server" id="OM16Age" DatabaseField="OM16Age" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="80px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
  <div class="key"><def:datafieldcontrol runat="server" id="OM16Code" DatabaseField="OM16Code" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="80px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
</div>
<div class="main"><def:datafieldcontrol runat="server" id="OMNotes" DatabaseField="OMNotes" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="50px" FieldTextBoxWidth="400px" FieldTextBoxHeight="40px" FieldTextBoxTextMode="multiline" FieldTextBoxMaxLength="500"></def:datafieldcontrol></div>
</asp:panel>
<div class="main">
  <def:datafieldcontrol runat="server" id="created" DatabaseField="created" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="300px"></def:datafieldcontrol>
  <def:datafieldcontrol runat="server" id="createdBy" DatabaseField="createdBy" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="300px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="50"></def:datafieldcontrol>
  <def:datafieldcontrol runat="server" id="updated" DatabaseField="updated" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="300px"></def:datafieldcontrol>
  <def:datafieldcontrol runat="server" id="updatedBy" DatabaseField="updatedBy" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="300px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="50"></def:datafieldcontrol>
  <def:datafieldcontrol runat="server" id="scored" DatabaseField="scored" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="300px"></def:datafieldcontrol>
  <def:datafieldcontrol runat="server" id="scoredBy" DatabaseField="scoredBy" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="300px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="50"></def:datafieldcontrol>
</div>
</asp:Content>
