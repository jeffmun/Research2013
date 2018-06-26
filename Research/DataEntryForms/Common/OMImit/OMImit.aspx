<%@ Register TagPrefix="def" Namespace="DataEntryFramework3" %> 
<%@ Page language="c#" MasterPageFile="~/UWAC.master"  Title="OMImit Data Entry" %>
<asp:Content ID="Content1" ContentPlaceHolderID="oBodyPlaceHolder" runat="server">

<def:dataentrycontroller id="DataEntryController1" runat="server" DatabaseTable="ALL_OMImit" >
</def:dataentrycontroller>
<div class="main">
  <def:datafieldcontrol runat="server" id="id" DatabaseField="id" IsInsertField="true" FieldLabelWidth="300px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="15"></def:datafieldcontrol>
  <def:datafieldcontrol runat="server" id="indexnum" DatabaseField="indexnum" IsInsertField="true" FieldTextBoxTextDefault="1" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
  <def:datafieldcontrol runat="server" id="OMDate" DatabaseField="OMDate" FieldLabelText="Date of Freeplay" IsInsertField="true" FieldLabelWidth="300px"></def:datafieldcontrol>
  <def:datafieldcontrol runat="server" id="OMClin" DatabaseField="OMClin" FieldLabelText="Freeplay Clinician" IsInsertField="true" FieldLabelWidth="300px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="50"></def:datafieldcontrol>
</div>
<asp:panel id="mainPanel" CssClass="mainPanel" runat="server">
 
<def:ValueSetLabel ID="ValueSetLabel_OM1At1" runat="server"  DatabaseField="OM1At1"></def:ValueSetLabel>

<table class="main" cellpadding="5" cellspacing="0" border="1">
  <tr>
    <td>Activity #</td>
    <td>Item/Activity</td>
    <td>Attempt 1</td>
    <td>Attempt 2</td>
    <td>Attempt 3</td>
  </tr>
  <tr>
    <td>1</td>
    <td><def:datafieldcontrol runat="server" id="OM1Item" DatabaseField="OM1Item" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="50"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="OM1At1" DatabaseField="OM1At1" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="OM1At2" DatabaseField="OM1At2" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="OM1At3" DatabaseField="OM1At3" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
  </tr>
  <tr>
    <td>2</td>
    <td><def:datafieldcontrol runat="server" id="OM2Item" DatabaseField="OM2Item" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="50"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="OM2At1" DatabaseField="OM2At1" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="OM2At2" DatabaseField="OM2At2" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="OM2At3" DatabaseField="OM2At3" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
  </tr>
  <tr>
    <td>3</td>
    <td><def:datafieldcontrol runat="server" id="OM3Item" DatabaseField="OM3Item" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="50"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="OM3At1" DatabaseField="OM3At1" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="OM3At2" DatabaseField="OM3At2" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="OM3At3" DatabaseField="OM3At3" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
  </tr>
</table>
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
