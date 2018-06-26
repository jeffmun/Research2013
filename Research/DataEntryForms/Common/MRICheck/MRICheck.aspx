<%@ Register TagPrefix="def" Namespace="DataEntryFramework3" %> 
<%@ Page language="c#" MasterPageFile="~/UWAC.master"  Title="MRI Checklist Data Entry" %>
<asp:Content ID="Content1" ContentPlaceHolderID="oBodyPlaceHolder" runat="server">

<def:dataentrycontroller id="DataEntryController1" runat="server" DatabaseTable="ALL_MRICheck" >
</def:dataentrycontroller>
<div class="main">
  <def:datafieldcontrol runat="server" id="id" DatabaseField="id"  IsInsertField="true"   FieldLabelWidth="200px"></def:datafieldcontrol>
  <def:datafieldcontrol runat="server" id="indexnum" DatabaseField="indexnum"  IsInsertField="true" FieldTextBoxTextDefault="1"  FieldLabelWidth="200px"></def:datafieldcontrol>
  <def:datafieldcontrol runat="server" id="MRIDate" DatabaseField="MRIDate" FieldLabelText="Date of MRI Scan"  IsInsertField="true"  FieldLabelWidth="200px"></def:datafieldcontrol>
</div>
<asp:panel id="mainPanel" CssClass="mainPanel" runat="server">
<div class="collection">
  <div class="main"><def:datafieldcontrol runat="server" id="MRIHand" DatabaseField="MRIHand" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="200px" FieldTextBoxWidth="50px"></def:datafieldcontrol></div>
  <div class="key"><def:ValueSetLabel ID="ValueSetLabel_MRIHand" runat="server"  DatabaseField="MRIHand"></def:ValueSetLabel><br /></div> 
</div>
<div class="collection">
  <div class="main">
    <def:datafieldcontrol runat="server" id="MRISed" DatabaseField="MRISed" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="200px" FieldTextBoxWidth="50px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="MRIHxSe" DatabaseField="MRIHxSe" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="200px" FieldTextBoxWidth="50px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="MRIRx" DatabaseField="MRIRx" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="200px" FieldTextBoxWidth="50px"></def:datafieldcontrol>
  </div>
  <div class="key"><def:ValueSetLabel ID="ValueSetLabel_MRISed" runat="server"  DatabaseField="MRISed"></def:ValueSetLabel></div>
</div>
<div class="main"><def:datafieldcontrol runat="server" id="MRIRxS" DatabaseField="MRIRxS" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="200px" FieldTextBoxWidth="400px" FieldTextBoxMaxLength="500"></def:datafieldcontrol></div>
<div class="collection">
  <div class="main"><span style="padding-left:200px;font-weight:bold">Attempted</span></div>
  <div class="continue"><span style="padding-left:30px;font-weight:bold">Completed</span></div>
</div>
<div class="collection">
  <div class="main">
    <div class="collection">
      <div class="main"><def:datafieldcontrol runat="server" id="MRIT1a" DatabaseField="MRIT1a" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="200px" FieldTextBoxWidth="50px"></def:datafieldcontrol></div>
      <div class="continue"><def:datafieldcontrol runat="server" id="MRIT1" DatabaseField="MRIT1"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="30px" FieldTextBoxWidth="50px"></def:datafieldcontrol></div>
    </div>
    <div class="collection">
      <div class="main"><def:datafieldcontrol runat="server" id="MRIT2a" DatabaseField="MRIT2a" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="200px" FieldTextBoxWidth="50px"></def:datafieldcontrol></div>
      <div class="continue"><def:datafieldcontrol runat="server" id="MRIT2" DatabaseField="MRIT2"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="30px" FieldTextBoxWidth="50px"></def:datafieldcontrol></div>
    </div>
    <div class="collection">
      <div class="main"><def:datafieldcontrol runat="server" id="MRIDTIa" DatabaseField="MRIDTIa" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="200px" FieldTextBoxWidth="50px"></def:datafieldcontrol></div>
      <div class="continue"><def:datafieldcontrol runat="server" id="MRIDTI" DatabaseField="MRIDTI"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="30px" FieldTextBoxWidth="50px"></def:datafieldcontrol></div>
    </div>
  </div>
  <div class="key"><def:ValueSetLabel ID="ValueSetLabel_MRIT1" runat="server"  DatabaseField="MRIT1"></def:ValueSetLabel></div>
</div>
<div class="collection">
  <div class="main"><def:datafieldcontrol runat="server" id="MRIS19S" DatabaseField="MRIS19S"  IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="19" FieldLabelWidth="107px" FieldTextBoxWidth="50px"></def:datafieldcontrol></div>
  <div class="continue"><def:datafieldcontrol runat="server" id="MRIS19a" DatabaseField="MRIS19a" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="30px" FieldTextBoxWidth="50px"></def:datafieldcontrol></div>
  <div class="continue"><def:datafieldcontrol runat="server" id="MRIS19" DatabaseField="MRIS19"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="30px" FieldTextBoxWidth="50px"></def:datafieldcontrol></div>
</div>
<div class="collection">
  <div class="main"><def:datafieldcontrol runat="server" id="MRIB0MS" DatabaseField="MRIB0MS"  IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="20" FieldLabelWidth="107px" FieldTextBoxWidth="50px"></def:datafieldcontrol></div>
  <div class="continue"><def:datafieldcontrol runat="server" id="MRIB0Ma" DatabaseField="MRIB0Ma" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="30px" FieldTextBoxWidth="50px"></def:datafieldcontrol></div>
  <div class="continue"><def:datafieldcontrol runat="server" id="MRIB0M" DatabaseField="MRIB0M"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="30px" FieldTextBoxWidth="50px"></def:datafieldcontrol></div>
</div>
<div class="collection">
  <div class="main"><def:datafieldcontrol runat="server" id="MRIS80S" DatabaseField="MRIS80S"  IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="80" FieldLabelWidth="107px" FieldTextBoxWidth="50px"></def:datafieldcontrol></div>
  <div class="continue"><def:datafieldcontrol runat="server" id="MRIS80a" DatabaseField="MRIS80a" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="30px" FieldTextBoxWidth="50px"></def:datafieldcontrol></div>
  <div class="continue"><def:datafieldcontrol runat="server" id="MRIS80" DatabaseField="MRIS80"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="30px" FieldTextBoxWidth="50px"></def:datafieldcontrol></div>
</div>
<div class="collection">
  <div class="main"><def:datafieldcontrol runat="server" id="MRIJSVa" DatabaseField="MRIJSVa" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="200px" FieldTextBoxWidth="50px"></def:datafieldcontrol></div>
  <div class="continue"><def:datafieldcontrol runat="server" id="MRIJSV" DatabaseField="MRIJSV"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="30px" FieldTextBoxWidth="50px"></def:datafieldcontrol></div>
</div>
<div class="collection">
  <div class="main"><def:datafieldcontrol runat="server" id="MRIfRSa" DatabaseField="MRIfRSa" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="200px" FieldTextBoxWidth="50px"></def:datafieldcontrol></div>
  <div class="continue"><def:datafieldcontrol runat="server" id="MRIfRS" DatabaseField="MRIfRS"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="30px" FieldTextBoxWidth="50px"></def:datafieldcontrol></div>
  <div class="continue"><def:datafieldcontrol runat="server" id="MRIfNS" DatabaseField="MRIfNS"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="100px" FieldTextBoxWidth="50px"></def:datafieldcontrol></div>
</div>
<div class="collection">
  <div class="main"><def:datafieldcontrol runat="server" id="MRIfLa" DatabaseField="MRIfLa" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="200px" FieldTextBoxWidth="50px"></def:datafieldcontrol></div>
  <div class="continue"><def:datafieldcontrol runat="server" id="MRIfL" DatabaseField="MRIfL"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="30px" FieldTextBoxWidth="50px"></def:datafieldcontrol></div>
</div>
<div class="collection">
  <div class="main"><def:datafieldcontrol runat="server" id="MRIOSa" DatabaseField="MRIOSa" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="200px" FieldTextBoxWidth="50px"></def:datafieldcontrol></div>
  <div class="continue"><def:datafieldcontrol runat="server" id="MRIOS" DatabaseField="MRIOS"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="30px" FieldTextBoxWidth="50px"></def:datafieldcontrol></div>
</div>
<div class="main">
  <def:datafieldcontrol runat="server" id="MRISOS" DatabaseField="MRISOS"  IsEntryField="true" IsDoubleEntryField="false"  FieldLabelWidth="200px" FieldTextBoxWidth="400px" FieldTextBoxMaxLength="500"></def:datafieldcontrol>
  <def:datafieldcontrol runat="server" id="MRIN" DatabaseField="MRIN"  IsEntryField="true" IsDoubleEntryField="false"  FieldLabelWidth="200px" FieldTextBoxWidth="400px" FieldTextBoxHeight="40px" FieldTextBoxTextMode="MultiLine" FieldTextBoxMaxLength="1000"></def:datafieldcontrol>
</div>
</asp:Panel>
<div class="main">
  <def:datafieldcontrol runat="server" id="created" DatabaseField="created"  IsReadOnly="true" RenderReadOnlyAsDiv="true"   FieldLabelWidth="200px"></def:datafieldcontrol>
  <def:datafieldcontrol runat="server" id="createdBy" DatabaseField="createdBy"  IsReadOnly="true" RenderReadOnlyAsDiv="true"   FieldLabelWidth="200px"></def:datafieldcontrol>
  <def:datafieldcontrol runat="server" id="updated" DatabaseField="updated"  IsReadOnly="true" RenderReadOnlyAsDiv="true"   FieldLabelWidth="200px"></def:datafieldcontrol>
  <def:datafieldcontrol runat="server" id="updatedBy" DatabaseField="updatedBy"  IsReadOnly="true" RenderReadOnlyAsDiv="true"   FieldLabelWidth="200px"></def:datafieldcontrol>
  <def:datafieldcontrol runat="server" id="scored" DatabaseField="scored"  IsReadOnly="true" RenderReadOnlyAsDiv="true"   FieldLabelWidth="200px"></def:datafieldcontrol>
  <def:datafieldcontrol runat="server" id="scoredBy" DatabaseField="scoredBy"  IsReadOnly="true" RenderReadOnlyAsDiv="true"   FieldLabelWidth="200px"></def:datafieldcontrol>
</div>
</asp:Content>
