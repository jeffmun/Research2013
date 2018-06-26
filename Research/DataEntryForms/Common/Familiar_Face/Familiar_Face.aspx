<%@ Register TagPrefix="def" Namespace="DataEntryFramework3" %> 
<%@ Page language="c#" MasterPageFile="~/UWAC.master"  Title="Familiar Face Data Entry" %>
<asp:Content ID="Content1" ContentPlaceHolderID="oBodyPlaceHolder" runat="server">

<def:dataentrycontroller id="DataEntryController1" runat="server" DatabaseTable="ALL_Familiar_Face" >
</def:dataentrycontroller>
<div class="main">
  <def:datafieldcontrol runat="server" id="id" DatabaseField="id" IsInsertField="true" FieldLabelWidth="100px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="15"></def:datafieldcontrol>
  <def:datafieldcontrol runat="server" id="indexnum" DatabaseField="indexnum" IsInsertField="true" FieldTextBoxTextDefault="1" FieldLabelWidth="100px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
</div>
<asp:panel id="mainPanel" CssClass="mainPanel" runat="server">
<div class="collection">
  <div class="main">
    <def:datafieldcontrol runat="server" id="FFTDATE1" DatabaseField="FFTDATE1" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="80px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="FFTEX1" DatabaseField="FFTEX1" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="80px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="50"></def:datafieldcontrol>
  </div>
  <div class="key">
    <def:datafieldcontrol runat="server" id="FFTDATE2" DatabaseField="FFTDATE2" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="80px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="FFTEX2" DatabaseField="FFTEX2" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="80px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="50"></def:datafieldcontrol>
  </div>
</div>
<h4>Test 1</h4>
<div class="collection">
  <div class="main">
    <div class="collection">
      <div class="main"><def:datafieldcontrol runat="server" id="FFT1P1P" DatabaseField="FFT1P1P" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="125px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
      <div class="key"><def:datafieldcontrol runat="server" id="FFT1P1C" DatabaseField="FFT1P1C" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="100px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
    </div>
    <div class="collection">
      <div class="main"><def:datafieldcontrol runat="server" id="FFT1P2P" DatabaseField="FFT1P2P" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="125px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
      <div class="key"><def:datafieldcontrol runat="server" id="FFT1P2C" DatabaseField="FFT1P2C" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="100px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
    </div>
    <div class="collection">
      <div class="main"><def:datafieldcontrol runat="server" id="FFT1P3P" DatabaseField="FFT1P3P" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="125px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
      <div class="key"><def:datafieldcontrol runat="server" id="FFT1P3C" DatabaseField="FFT1P3C" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="100px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
    </div>
    <div class="collection">
      <div class="main"><def:datafieldcontrol runat="server" id="FFT1P4P" DatabaseField="FFT1P4P" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="125px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
      <div class="key"><def:datafieldcontrol runat="server" id="FFT1P4C" DatabaseField="FFT1P4C" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="100px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
    </div>
    <div class="collection">
      <div class="main"><def:datafieldcontrol runat="server" id="FFT1P5P" DatabaseField="FFT1P5P" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="125px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
      <div class="key"><def:datafieldcontrol runat="server" id="FFT1P5C" DatabaseField="FFT1P5C" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="100px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
    </div>
    <div class="collection">
      <div class="main"><def:datafieldcontrol runat="server" id="FFT1P6P" DatabaseField="FFT1P6P" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="125px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
      <div class="key"><def:datafieldcontrol runat="server" id="FFT1P6C" DatabaseField="FFT1P6C" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="100px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
    </div>
  </div>
  <div class="key"><def:ValueSetLabel ID="ValueSetLabel_FFT1P1C" runat="server"  DatabaseField="FFT1P1C"></def:ValueSetLabel></div>
</div>
<h4>Test 2</h4>
<div class="collection">
  <div class="main">
    <div class="collection">
      <div class="main"><def:datafieldcontrol runat="server" id="FFT2P2P" DatabaseField="FFT2P2P" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="125px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
      <div class="key"><def:datafieldcontrol runat="server" id="FFT2P2C" DatabaseField="FFT2P2C" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="100px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
    </div>
    <div class="collection">
      <div class="main"><def:datafieldcontrol runat="server" id="FFT2P3P" DatabaseField="FFT2P3P" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="125px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
      <div class="key"><def:datafieldcontrol runat="server" id="FFT2P3C" DatabaseField="FFT2P3C" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="100px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
    </div>
    <div class="collection">
      <div class="main"><def:datafieldcontrol runat="server" id="FFT2P1P" DatabaseField="FFT2P1P" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="125px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
      <div class="key"><def:datafieldcontrol runat="server" id="FFT2P1C" DatabaseField="FFT2P1C" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="100px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
    </div>
    <div class="collection">
      <div class="main"><def:datafieldcontrol runat="server" id="FFT2P6P" DatabaseField="FFT2P6P" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="125px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
      <div class="key"><def:datafieldcontrol runat="server" id="FFT2P6C" DatabaseField="FFT2P6C" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="100px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
    </div>
    <div class="collection">
      <div class="main"><def:datafieldcontrol runat="server" id="FFT2P4P" DatabaseField="FFT2P4P" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="125px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
      <div class="key"><def:datafieldcontrol runat="server" id="FFT2P4C" DatabaseField="FFT2P4C" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="100px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
    </div>
    <div class="collection">
      <div class="main"><def:datafieldcontrol runat="server" id="FFT2P5P" DatabaseField="FFT2P5P" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="125px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
      <div class="key"><def:datafieldcontrol runat="server" id="FFT2P5C" DatabaseField="FFT2P5C" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="100px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
    </div>
  </div>
  <div class="key"><def:ValueSetLabel ID="ValueSetLabel_FFT2P2C" runat="server"  DatabaseField="FFT2P2C"></def:ValueSetLabel></div>
</div>
<div class="collection">
  <div class="main">
    <def:datafieldcontrol runat="server" id="FFTCOR13" DatabaseField="FFTCOR13" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="160px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="FFTCOM13" DatabaseField="FFTCOM13" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="160px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="FFTCOR46" DatabaseField="FFTCOR46" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="160px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="FFTCOM46" DatabaseField="FFTCOM46" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="160px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
  </div>
  <div class="key">-9=Missing Value</div>
</div>
<div class="collection">
  <div class="main">
    <def:datafieldcontrol runat="server" id="FFT1VAL" DatabaseField="FFT1VAL" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="100px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="FFT2VAL" DatabaseField="FFT2VAL" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="100px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
  </div>
  <div class="key"><def:ValueSetLabel ID="ValueSetLabel_FFT1VAL" runat="server"  DatabaseField="FFT1VAL"></def:ValueSetLabel></div>
</div> 
<div class="main"><def:datafieldcontrol runat="server" id="FFTNOTES" DatabaseField="FFTNOTES" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="50px" FieldTextBoxWidth="400px" FieldTextBoxHeight="40px" FieldTextBoxTextMode="multiline" FieldTextBoxMaxLength="500"></def:datafieldcontrol></div>
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
