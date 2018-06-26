<%@ Register TagPrefix="def" Namespace="DataEntryFramework3" %> 
<%@ Page language="c#" MasterPageFile="~/UWAC.master"  Title="AS09 Data Entry" %>
<asp:Content ID="Content1" ContentPlaceHolderID="oBodyPlaceHolder" runat="server">

<def:dataentrycontroller id="DataEntryController1" runat="server" DatabaseTable="ALL_AS09" >
</def:dataentrycontroller>
<div class="main">
  <def:datafieldcontrol runat="server" id="id" DatabaseField="id" IsInsertField="true" FieldLabelWidth="100px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="15"></def:datafieldcontrol>
  <def:datafieldcontrol runat="server" id="indexnum" DatabaseField="indexnum" IsInsertField="true" FieldTextBoxTextDefault="1" FieldLabelWidth="100px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
  <def:datafieldcontrol runat="server" id="EEGDate" DatabaseField="EEGDate" FieldLabelText="Date of EEG" IsInsertField="true" FieldLabelWidth="100px"></def:datafieldcontrol>
  <def:datafieldcontrol runat="server" id="EEGExam" DatabaseField="EEGExam" FieldLabelText="EEG Clinician" IsInsertField="true" FieldLabelWidth="100px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="50"></def:datafieldcontrol>
</div>
<asp:panel id="mainPanel" CssClass="mainPanel" runat="server">
<h5>1. EJ_Memory</h5>
<div class="collection">
  <div class="indent"><def:datafieldcontrol runat="server" id="EEG1r" DatabaseField="EEG1r" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="30px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
  <div class="key"><def:ValueSetLabel ID="ValueSetLabel_EEG1r" runat="server"  DatabaseField="EEG1r"></def:ValueSetLabel></div>
  <div class="key"><def:datafieldcontrol runat="server" id="EEG1v" DatabaseField="EEG1v" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="50px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
  <div class="key"><def:ValueSetLabel ID="ValueSetLabel_EEG1v" runat="server"  DatabaseField="EEG1v"></def:ValueSetLabel></div>
</div>
<div class="indent"><def:datafieldcontrol runat="server" id="EEG1c" DatabaseField="EEG1c" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="60px" FieldTextBoxWidth="400px" FieldTextBoxHeight="40px" FieldTextBoxTextMode="multiline" FieldTextBoxMaxLength="500"></def:datafieldcontrol></div>
<h5>2. Visual Imagery</h5>
<div class="collection">
  <div class="indent"><def:datafieldcontrol runat="server" id="EEG2r" DatabaseField="EEG2r" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="30px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
  <div class="key"><def:ValueSetLabel ID="ValueSetLabel_EEG2r" runat="server"  DatabaseField="EEG2r"></def:ValueSetLabel></div>
  <div class="key"><def:datafieldcontrol runat="server" id="EEG2v" DatabaseField="EEG2v" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="50px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
  <div class="key"><def:ValueSetLabel ID="ValueSetLabel_EEG2v" runat="server"  DatabaseField="EEG2v"></def:ValueSetLabel></div>
</div>
<div class="indent"><def:datafieldcontrol runat="server" id="EEG2c" DatabaseField="EEG2c" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="60px" FieldTextBoxWidth="400px" FieldTextBoxHeight="40px" FieldTextBoxTextMode="multiline" FieldTextBoxMaxLength="500"></def:datafieldcontrol></div>
<h5>3. Mental Rotation</h5>
<div class="collection">
  <div class="indent"><def:datafieldcontrol runat="server" id="EEG3r" DatabaseField="EEG3r" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="30px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
  <div class="key"><def:ValueSetLabel ID="ValueSetLabel_EEG3r" runat="server"  DatabaseField="EEG3r"></def:ValueSetLabel></div>
  <div class="key"><def:datafieldcontrol runat="server" id="EEG3v" DatabaseField="EEG3v" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="50px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
  <div class="key"><def:ValueSetLabel ID="ValueSetLabel_EEG3v" runat="server"  DatabaseField="EEG3v"></def:ValueSetLabel></div>
</div>
<div class="indent"><def:datafieldcontrol runat="server" id="EEG3c" DatabaseField="EEG3c" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="60px" FieldTextBoxWidth="400px" FieldTextBoxHeight="40px" FieldTextBoxTextMode="multiline" FieldTextBoxMaxLength="500"></def:datafieldcontrol></div>
<h5>4. Audio Imagery</h5>
<div class="collection">
  <div class="indent"><def:datafieldcontrol runat="server" id="EEG4r" DatabaseField="EEG4r" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="30px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
  <div class="key"><def:ValueSetLabel ID="ValueSetLabel_EEG4r" runat="server"  DatabaseField="EEG4r"></def:ValueSetLabel></div>
  <div class="key"><def:datafieldcontrol runat="server" id="EEG4v" DatabaseField="EEG4v" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="50px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
  <div class="key"><def:ValueSetLabel ID="ValueSetLabel_EEG4v" runat="server"  DatabaseField="EEG4v"></def:ValueSetLabel></div>
</div>
<div class="indent"><def:datafieldcontrol runat="server" id="EEG4c" DatabaseField="EEG4c" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="60px" FieldTextBoxWidth="400px" FieldTextBoxHeight="40px" FieldTextBoxTextMode="multiline" FieldTextBoxMaxLength="500"></def:datafieldcontrol></div>
<h5>5. AS09spont</h5>
<div class="collection">
  <div class="indent"><def:datafieldcontrol runat="server" id="EEG5r" DatabaseField="EEG5r" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="30px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
  <div class="key"><def:ValueSetLabel ID="ValueSetLabel_EEG5r" runat="server"  DatabaseField="EEG5r"></def:ValueSetLabel></div>
  <div class="key"><def:datafieldcontrol runat="server" id="EEG5v" DatabaseField="EEG5v" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="50px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
  <div class="key"><def:ValueSetLabel ID="ValueSetLabel_EEG5v" runat="server"  DatabaseField="EEG5v"></def:ValueSetLabel></div>
</div>
<div class="indent"><def:datafieldcontrol runat="server" id="EEG5c" DatabaseField="EEG5c" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="60px" FieldTextBoxWidth="400px" FieldTextBoxHeight="40px" FieldTextBoxTextMode="multiline" FieldTextBoxMaxLength="500"></def:datafieldcontrol></div>
</asp:panel>
<div class="main">
  <def:datafieldcontrol runat="server" id="created" DatabaseField="created" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="100px"></def:datafieldcontrol>
  <def:datafieldcontrol runat="server" id="createdBy" DatabaseField="createdBy" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="100px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="50"></def:datafieldcontrol>
  <def:datafieldcontrol runat="server" id="updated" DatabaseField="updated" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="100px"></def:datafieldcontrol>
  <def:datafieldcontrol runat="server" id="updatedBy" DatabaseField="updatedBy" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="100px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="50"></def:datafieldcontrol>
  <def:datafieldcontrol runat="server" id="scored" DatabaseField="scored" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="100px"></def:datafieldcontrol>
  <def:datafieldcontrol runat="server" id="scoredBy" DatabaseField="scoredBy" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="100px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="50"></def:datafieldcontrol>
</div>
</asp:Content>
