<%@ Register TagPrefix="def" Namespace="DataEntryFramework3" %> 
<%@ Page language="c#" MasterPageFile="~/UWAC.master"  Title="PFRTxEval Data Entry" %>
<asp:Content ID="Content1" ContentPlaceHolderID="oBodyPlaceHolder" runat="server">

<def:dataentrycontroller id="DataEntryController1" runat="server" DatabaseTable="ALL_PFRTxEval" >
</def:dataentrycontroller>
<div class="main">
  <def:datafieldcontrol runat="server" id="id" DatabaseField="id" IsInsertField="true" FieldLabelWidth="150px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="15"></def:datafieldcontrol>
  <def:datafieldcontrol runat="server" id="indexnum" DatabaseField="indexnum" IsInsertField="true" FieldTextBoxTextDefault="1" FieldLabelWidth="150px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
  <def:datafieldcontrol runat="server" id="Date" DatabaseField="Date" FieldLabelText="Date Completed" IsInsertField="true" FieldLabelWidth="150px"></def:datafieldcontrol>
</div> 
<div class="collection">
  <div class="main"><def:datafieldcontrol runat="server" id="Parent" DatabaseField="Parent" FieldLabelText="Completed By" IsInsertField="true" FieldLabelWidth="150px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
  <div class="key"><def:ValueSetLabel ID="ValueSetLabel_Parent" runat="server"  DatabaseField="Parent"></def:ValueSetLabel></div>
</div>
<div class="main"><def:datafieldcontrol runat="server" id="ParentOth" DatabaseField="ParentOth" IsEntryField="true" IsInsertField="true" FieldLabelWidth="150px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="200"></def:datafieldcontrol></div>
<asp:panel id="mainPanel" CssClass="mainPanel" runat="server"> 
<div class="collection">
  <div class="main"><def:datafieldcontrol runat="server" id="PFR1" DatabaseField="PFR1" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
  <div class="key"><def:ValueSetLabel ID="ValueSetLabel_PFR1" runat="server"  DatabaseField="PFR1"></def:ValueSetLabel></div>
</div>
<div class="collection">
  <div class="main"><def:datafieldcontrol runat="server" id="PFR2" DatabaseField="PFR2" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
  <div class="key"><def:ValueSetLabel ID="ValueSetLabel_PFR2" runat="server"  DatabaseField="PFR2"></def:ValueSetLabel></div>
</div> 
<div class="collection">
  <div class="main"><def:datafieldcontrol runat="server" id="PFR3" DatabaseField="PFR3" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
  <div class="key"><def:ValueSetLabel ID="ValueSetLabel_PFR3" runat="server"  DatabaseField="PFR3"></def:ValueSetLabel></div>
</div> 
<div class="collection">
  <div class="main"><def:datafieldcontrol runat="server" id="PFR4" DatabaseField="PFR4" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
  <div class="key"><def:ValueSetLabel ID="ValueSetLabel_PFR4" runat="server"  DatabaseField="PFR4"></def:ValueSetLabel></div>
</div> 
<div class="collection">
  <div class="main"><def:datafieldcontrol runat="server" id="PFR5" DatabaseField="PFR5" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
  <div class="key"><def:ValueSetLabel ID="ValueSetLabel_PFR5" runat="server"  DatabaseField="PFR5"></def:ValueSetLabel></div>
</div> 
<div class="collection">
  <div class="main"><def:datafieldcontrol runat="server" id="PFR6" DatabaseField="PFR6" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
  <div class="key"><def:ValueSetLabel ID="ValueSetLabel_PFR6" runat="server"  DatabaseField="PFR6"></def:ValueSetLabel></div>
</div> 
<div class="collection">
  <div class="main"><def:datafieldcontrol runat="server" id="PFR7" DatabaseField="PFR7" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
  <div class="key"><def:ValueSetLabel ID="ValueSetLabel_PFR7" runat="server"  DatabaseField="PFR7"></def:ValueSetLabel></div>
</div> 
<div class="collection">
  <div class="main">
    <div class="main">8) Were there any barriers to your participation in this program?</div>
    <div class="indent"><def:datafieldcontrol runat="server" id="PFR8a" DatabaseField="PFR8a" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
  </div>
  <div class="key"><def:ValueSetLabel ID="ValueSetLabel_PFR8a" runat="server"  DatabaseField="PFR8a"></def:ValueSetLabel></div>
</div>
<div class="indent">
  <def:datafieldcontrol runat="server" id="PFR8an" DatabaseField="PFR8an" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="50px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="200"></def:datafieldcontrol>
  <def:datafieldcontrol runat="server" id="PFR8b" DatabaseField="PFR8b" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
  <def:datafieldcontrol runat="server" id="PFR8bn" DatabaseField="PFR8bn" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="50px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="200"></def:datafieldcontrol>
  <def:datafieldcontrol runat="server" id="PFR8c" DatabaseField="PFR8c" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
  <def:datafieldcontrol runat="server" id="PFR8cn" DatabaseField="PFR8cn" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="50px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="200"></def:datafieldcontrol>
  <def:datafieldcontrol runat="server" id="PFR8d" DatabaseField="PFR8d" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
  <def:datafieldcontrol runat="server" id="PFR8dn" DatabaseField="PFR8dn" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="50px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="200"></def:datafieldcontrol>
  <def:datafieldcontrol runat="server" id="PFR8e" DatabaseField="PFR8e" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
  <def:datafieldcontrol runat="server" id="PFR8en" DatabaseField="PFR8en" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="50px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="200"></def:datafieldcontrol>
  <def:datafieldcontrol runat="server" id="PFR8f" DatabaseField="PFR8f" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
  <def:datafieldcontrol runat="server" id="PFR8fn" DatabaseField="PFR8fn" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="50px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="200"></def:datafieldcontrol>
  <def:datafieldcontrol runat="server" id="PFR8g" DatabaseField="PFR8g" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
  <def:datafieldcontrol runat="server" id="PFR8gn" DatabaseField="PFR8gn" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="50px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="200"></def:datafieldcontrol>
</div>
<div class="main"><def:datafieldcontrol runat="server" id="PFR9" DatabaseField="PFR9" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="300px" FieldTextBoxWidth="400px" FieldTextBoxHeight="40px" FieldTextBoxTextMode="multiline" FieldTextBoxMaxLength="1000"></def:datafieldcontrol></div>
</asp:panel>
<div class="main">
  <def:datafieldcontrol runat="server" id="created" DatabaseField="created" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="150px"></def:datafieldcontrol>
  <def:datafieldcontrol runat="server" id="createdBy" DatabaseField="createdBy" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="150px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="50"></def:datafieldcontrol>
  <def:datafieldcontrol runat="server" id="updated" DatabaseField="updated" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="150px"></def:datafieldcontrol>
  <def:datafieldcontrol runat="server" id="updatedBy" DatabaseField="updatedBy" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="150px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="50"></def:datafieldcontrol>
  <def:datafieldcontrol runat="server" id="scored" DatabaseField="scored" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="150px"></def:datafieldcontrol>
  <def:datafieldcontrol runat="server" id="scoredBy" DatabaseField="scoredBy" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="150px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="50"></def:datafieldcontrol>
</div>
</asp:Content>
