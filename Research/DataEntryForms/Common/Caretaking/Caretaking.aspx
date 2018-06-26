<%@ Register TagPrefix="def" Namespace="DataEntryFramework3" %> 
<%@ Page language="c#" MasterPageFile="~/UWAC.master"  Title="Caretaking Data Entry" %>
<asp:Content ID="Content1" ContentPlaceHolderID="oBodyPlaceHolder" runat="server">

<def:dataentrycontroller id="DataEntryController1" runat="server" DatabaseTable="ALL_Caretaking" >
</def:dataentrycontroller>
<div class="main">
  <def:datafieldcontrol runat="server" id="id" DatabaseField="id" IsInsertField="true" FieldLabelWidth="175px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="15"></def:datafieldcontrol>
  <def:datafieldcontrol runat="server" id="indexnum" DatabaseField="indexnum" IsInsertField="true" FieldTextBoxTextDefault="1" FieldLabelWidth="175px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
  <def:datafieldcontrol runat="server" id="CaDate" DatabaseField="CaDate" FieldLabelText="Date" IsInsertField="true" FieldLabelWidth="175px"></def:datafieldcontrol>
</div> 
<asp:panel id="mainPanel" CssClass="mainPanel" runat="server">
<h3>Caretaking Activity (Diaper Change)</h3>
<div class="collection">
  <div class="main"><def:datafieldcontrol runat="server" id="CaComp" DatabaseField="CaComp" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="80px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
  <div class="key"><def:ValueSetLabel ID="ValueSetLabel_CaComp" runat="server"  DatabaseField="CaComp"></def:ValueSetLabel></div>
  <div class="key"><def:datafieldcontrol runat="server" id="CaValid" DatabaseField="CaValid" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="60px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
  <div class="key"><def:ValueSetLabel ID="ValueSetLabel_CaValid" runat="server"  DatabaseField="CaValid"></def:ValueSetLabel></div>
</div>
<div class="main"><def:datafieldcontrol runat="server" id="CaSpeV" DatabaseField="CaSpeV" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="175px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="200"></def:datafieldcontrol></div>
<div class="collection">
  <div class="main"><def:datafieldcontrol runat="server" id="CaGive" DatabaseField="CaGive" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="80px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
  <div class="key"><def:ValueSetLabel ID="ValueSetLabel_CaGive" runat="server"  DatabaseField="CaGive"></def:ValueSetLabel></div>
</div>
<div class="main">
  <def:datafieldcontrol runat="server" id="CaSpeG" DatabaseField="CaSpeG" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="175px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="200"></def:datafieldcontrol>
  <def:datafieldcontrol runat="server" id="CaBeha" DatabaseField="CaBeha" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="175px" FieldTextBoxWidth="400px" FieldTextBoxHeight="40px" FieldTextBoxTextMode="multiline" FieldTextBoxMaxLength="1000"></def:datafieldcontrol>
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
