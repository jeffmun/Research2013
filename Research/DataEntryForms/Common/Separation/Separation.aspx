<%@ Register TagPrefix="def" Namespace="DataEntryFramework3" %> 
<%@ Page language="c#" MasterPageFile="~/UWAC.master"  Title="Separation Data Entry" %>
<asp:Content ID="Content1" ContentPlaceHolderID="oBodyPlaceHolder" runat="server">

<def:dataentrycontroller id="DataEntryController1" runat="server" DatabaseTable="ALL_Separation" >
</def:dataentrycontroller>
<div class="main">
  <def:datafieldcontrol runat="server" id="id" DatabaseField="id" IsInsertField="true" FieldLabelWidth="175px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="15"></def:datafieldcontrol>
  <def:datafieldcontrol runat="server" id="indexnum" DatabaseField="indexnum" IsInsertField="true" FieldTextBoxTextDefault="1" FieldLabelWidth="175px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
  <def:datafieldcontrol runat="server" id="SepDate" DatabaseField="SepDate" FieldLabelText="Date" IsInsertField="true" FieldLabelWidth="175px"></def:datafieldcontrol>
</div> 
<asp:panel id="mainPanel" CssClass="mainPanel" runat="server">
<h3>Separation (Strange Situation)</h3>
<div class="collection">
  <div class="main"><def:datafieldcontrol runat="server" id="SepComp" DatabaseField="SepComp" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="80px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
  <div class="key"><def:ValueSetLabel ID="ValueSetLabel_SepComp" runat="server"  DatabaseField="SepComp"></def:ValueSetLabel></div>
  <div class="key"><def:datafieldcontrol runat="server" id="SepValid" DatabaseField="SepValid" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="60px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
  <div class="key"><def:ValueSetLabel ID="ValueSetLabel_SepValid" runat="server"  DatabaseField="SepValid"></def:ValueSetLabel></div>
</div>
<div class="main"><def:datafieldcontrol runat="server" id="SepSpeV" DatabaseField="SepSpeV" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="175px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="200"></def:datafieldcontrol></div>
<div class="collection">
  <div class="main"><def:datafieldcontrol runat="server" id="SepGive" DatabaseField="SepGive" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="80px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
  <div class="key"><def:ValueSetLabel ID="ValueSetLabel_SepGive" runat="server"  DatabaseField="SepGive"></def:ValueSetLabel></div>
</div>
<div class="main">
  <def:datafieldcontrol runat="server" id="SepSpeG" DatabaseField="SepSpeG" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="175px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="200"></def:datafieldcontrol>
  <def:datafieldcontrol runat="server" id="SepExam" DatabaseField="SepExam" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="175px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="50"></def:datafieldcontrol>
  <def:datafieldcontrol runat="server" id="SepStra" DatabaseField="SepStra" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="175px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="50"></def:datafieldcontrol>
  <def:datafieldcontrol runat="server" id="SepLeng" DatabaseField="SepLeng" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="175px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
  <def:datafieldcontrol runat="server" id="SepBeha" DatabaseField="SepBeha" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="175px" FieldTextBoxWidth="400px" FieldTextBoxHeight="40px" FieldTextBoxTextMode="multiline" FieldTextBoxMaxLength="1000"></def:datafieldcontrol>
</div>
</asp:panel>
<div class="main">
  <def:datafieldcontrol runat="server" id="created" DatabaseField="created" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="175px"></def:datafieldcontrol>
  <def:datafieldcontrol runat="server" id="createdBy" DatabaseField="createdBy" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="175px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="50"></def:datafieldcontrol>
  <def:datafieldcontrol runat="server" id="updated" DatabaseField="updated" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="175px"></def:datafieldcontrol>
  <def:datafieldcontrol runat="server" id="updatedBy" DatabaseField="updatedBy" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="175px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="50"></def:datafieldcontrol>
  <def:datafieldcontrol runat="server" id="scored" DatabaseField="scored" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="175px"></def:datafieldcontrol>
  <def:datafieldcontrol runat="server" id="scoredBy" DatabaseField="scoredBy" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="175px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="50"></def:datafieldcontrol>
</div>
</asp:Content>
