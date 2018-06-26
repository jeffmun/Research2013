<%@ Register TagPrefix="def" Namespace="DataEntryFramework3" %> 
<%@ Page language="c#" MasterPageFile="~/UWAC.master"  Title="MRI_Struct Data Entry" %>
<asp:Content ID="Content1" ContentPlaceHolderID="oBodyPlaceHolder" runat="server">

<def:dataentrycontroller id="DataEntryController1" runat="server" DatabaseTable="ALL_MRI_Struct" >
</def:dataentrycontroller>
<div class="main">
  <def:datafieldcontrol runat="server" id="id" DatabaseField="id" IsInsertField="true" FieldLabelWidth="200px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="15"></def:datafieldcontrol>
  <def:datafieldcontrol runat="server" id="indexnum" DatabaseField="indexnum" IsInsertField="true" FieldTextBoxTextDefault="1" FieldLabelWidth="200px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
  <def:datafieldcontrol runat="server" id="MRIDate" DatabaseField="MRIDate" FieldLabelText="Date of MRI Scan" IsInsertField="true" FieldLabelWidth="200px"></def:datafieldcontrol>
</div>
<asp:panel id="mainPanel" CssClass="mainPanel" runat="server">
<div class="collection">
  <div class="main"><span style="padding-left:200px;font-weight:bold">Attempted</span></div>
  <div class="continue"><span style="padding-left:30px;font-weight:bold">Completed</span></div>
</div>
<div class="collection">
  <div class="main">
    <div class="collection">
      <div class="main"><def:datafieldcontrol runat="server" id="MRIT1a" DatabaseField="MRIT1a" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="200px" FieldTextBoxWidth="50px"></def:datafieldcontrol></div>
      <div class="continue"><def:datafieldcontrol runat="server" id="MRIT1" DatabaseField="MRIT1" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="30px" FieldTextBoxWidth="50px"></def:datafieldcontrol></div>
    </div>
    <div class="collection">
      <div class="main"><def:datafieldcontrol runat="server" id="MRIT2a" DatabaseField="MRIT2a" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="200px" FieldTextBoxWidth="50px"></def:datafieldcontrol></div>
      <div class="continue"><def:datafieldcontrol runat="server" id="MRIT2" DatabaseField="MRIT2" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="30px" FieldTextBoxWidth="50px"></def:datafieldcontrol></div>
    </div>
    <div class="collection">
      <div class="main"><def:datafieldcontrol runat="server" id="MRIBLa" DatabaseField="MRIBLa" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="200px" FieldTextBoxWidth="50px"></def:datafieldcontrol></div>
      <div class="continue"><def:datafieldcontrol runat="server" id="MRIBL" DatabaseField="MRIBL" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="30px" FieldTextBoxWidth="50px"></def:datafieldcontrol></div>
    </div>
    <div class="collection">
      <div class="main"><def:datafieldcontrol runat="server" id="MRIDTIa" DatabaseField="MRIDTIa" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="200px" FieldTextBoxWidth="50px"></def:datafieldcontrol></div>
      <div class="continue"><def:datafieldcontrol runat="server" id="MRIDTI" DatabaseField="MRIDTI" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="30px" FieldTextBoxWidth="50px"></def:datafieldcontrol></div>
    </div>
  </div>
  <div class="key"><def:ValueSetLabel ID="ValueSetLabel_MRIT1a" runat="server"  DatabaseField="MRIT1a"></def:ValueSetLabel></div>
</div>
<div class="collection">
  <div class="main"><def:datafieldcontrol runat="server" id="MRIP11S" DatabaseField="MRIP11S" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="11" FieldLabelWidth="107px" FieldTextBoxWidth="50px"></def:datafieldcontrol></div>
  <div class="continue"><def:datafieldcontrol runat="server" id="MRIP11a" DatabaseField="MRIP11a" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="30px" FieldTextBoxWidth="50px"></def:datafieldcontrol></div>
  <div class="continue"><def:datafieldcontrol runat="server" id="MRIP11" DatabaseField="MRIP11" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="30px" FieldTextBoxWidth="50px"></def:datafieldcontrol></div>
</div>
<div class="collection">
  <div class="main"><def:datafieldcontrol runat="server" id="MRIP136S" DatabaseField="MRIP136S" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="136" FieldLabelWidth="107px" FieldTextBoxWidth="50px"></def:datafieldcontrol></div>
  <div class="continue"><def:datafieldcontrol runat="server" id="MRIP136a" DatabaseField="MRIP136a" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="30px" FieldTextBoxWidth="50px"></def:datafieldcontrol></div>
  <div class="continue"><def:datafieldcontrol runat="server" id="MRIP136" DatabaseField="MRIP136" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="30px" FieldTextBoxWidth="50px"></def:datafieldcontrol></div>
</div>
<div class="collection">
  <div class="main"><def:datafieldcontrol runat="server" id="MRIPWSa" DatabaseField="MRIPWSa" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="200px" FieldTextBoxWidth="50px"></def:datafieldcontrol></div>
  <div class="continue"><def:datafieldcontrol runat="server" id="MRIPWS" DatabaseField="MRIPWS" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="30px" FieldTextBoxWidth="50px"></def:datafieldcontrol></div>
</div>
<div class="collection">
  <div class="main"><def:datafieldcontrol runat="server" id="MRIOSa" DatabaseField="MRIOSa" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="200px" FieldTextBoxWidth="50px"></def:datafieldcontrol></div>
  <div class="continue"><def:datafieldcontrol runat="server" id="MRIOS" DatabaseField="MRIOS" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="30px" FieldTextBoxWidth="50px"></def:datafieldcontrol></div>
</div>
<div class="main">
  <def:datafieldcontrol runat="server" id="MRISOS" DatabaseField="MRISOS" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="200px" FieldTextBoxWidth="400px" FieldTextBoxMaxLength="500"></def:datafieldcontrol>
  <def:datafieldcontrol runat="server" id="MRIDDS" DatabaseField="MRIDDS" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="200px" FieldTextBoxWidth="50px"></def:datafieldcontrol>
  <def:datafieldcontrol runat="server" id="MRIRDS" DatabaseField="MRIRDS" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="200px" FieldTextBoxWidth="50px"></def:datafieldcontrol>
  <def:datafieldcontrol runat="server" id="MRIN" DatabaseField="MRIN" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="200px" FieldTextBoxWidth="400px" FieldTextBoxHeight="40px" FieldTextBoxTextMode="multiline" FieldTextBoxMaxLength="1000"></def:datafieldcontrol>
</div>
</asp:panel>
<div class="main">
  <def:datafieldcontrol runat="server" id="created" DatabaseField="created" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="200px"></def:datafieldcontrol>
  <def:datafieldcontrol runat="server" id="createdBy" DatabaseField="createdBy" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="200px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="50"></def:datafieldcontrol>
  <def:datafieldcontrol runat="server" id="updated" DatabaseField="updated" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="200px"></def:datafieldcontrol>
  <def:datafieldcontrol runat="server" id="updatedBy" DatabaseField="updatedBy" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="200px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="50"></def:datafieldcontrol>
  <def:datafieldcontrol runat="server" id="scored" DatabaseField="scored" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="200px"></def:datafieldcontrol>
  <def:datafieldcontrol runat="server" id="scoredBy" DatabaseField="scoredBy" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="200px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="50"></def:datafieldcontrol>
</div>
</asp:Content>
