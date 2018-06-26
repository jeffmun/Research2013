<%@ Register TagPrefix="def" Namespace="DataEntryFramework3" %> 
<%@ Page language="c#" MasterPageFile="~/UWAC.master"  Title="FIF-ADS Data Entry" %>
<asp:Content ID="Content1" ContentPlaceHolderID="oBodyPlaceHolder" runat="server">

<def:dataentrycontroller id="DataEntryController1" runat="server" DatabaseTable="ALL_FIF_ADS" >
</def:dataentrycontroller>
<div class="main">
<def:datafieldcontrol runat="server" id="id" DatabaseField="id"  IsInsertField="true"   FieldLabelWidth="300px "></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="indexnum" DatabaseField="indexnum"  IsInsertField="true" FieldTextBoxTextDefault="1" FieldLabelWidth="300px "></def:datafieldcontrol>
</div>
<asp:panel id="mainPanel" CssClass="mainPanel" runat="server">
<h3>For Ongoing (Longitudinal) Participants:</h3>
<div class="collection">
  <div class="main"><def:datafieldcontrol runat="server" id="FIF01a" DatabaseField="FIF01a"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="50px"></def:datafieldcontrol></div>
  <div class="key"><def:ValueSetLabel ID="ValueSetLabel_FIF01a" runat="server"  DatabaseField="FIF01a"></def:ValueSetLabel></div>
</div>
<table class="main" cellpadding="5" cellspacing="0" border="1">
  <thead>
    <td>Diagnosis</td>
    <td>Date of Change</td>
    <td>By Whom</td>
  </thead>
  <tr>
    <td><def:datafieldcontrol runat="server" id="FIF01b1" DatabaseField="FIF01b1"  IsEntryField="true" IsDoubleEntryField="false"  FieldLabelWidth="0px" FieldTextBoxMaxLength="100"></def:datafieldcontrol></td>  
    <td><def:datafieldcontrol runat="server" id="FIF01b2" DatabaseField="FIF01b2"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="0px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="FIF01b3" DatabaseField="FIF01b3"  IsEntryField="true" IsDoubleEntryField="false"  FieldLabelWidth="0px" FieldTextBoxMaxLength="100"></def:datafieldcontrol></td>
  </tr>
  <tr>
    <td><def:datafieldcontrol runat="server" id="FIF01c1" DatabaseField="FIF01c1"  IsEntryField="true" IsDoubleEntryField="false"  FieldLabelWidth="0px" FieldTextBoxMaxLength="100"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="FIF01c2" DatabaseField="FIF01c2"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="0px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="FIF01c3" DatabaseField="FIF01c3"  IsEntryField="true" IsDoubleEntryField="false"  FieldLabelWidth="0px" FieldTextBoxMaxLength="100"></def:datafieldcontrol></td>
  </tr>
  <tr>
    <td><def:datafieldcontrol runat="server" id="FIF01d1" DatabaseField="FIF01d1"  IsEntryField="true" IsDoubleEntryField="false"  FieldLabelWidth="0px" FieldTextBoxMaxLength="100"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="FIF01d2" DatabaseField="FIF01d2"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="0px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="FIF01d3" DatabaseField="FIF01d3"  IsEntryField="true" IsDoubleEntryField="false"  FieldLabelWidth="0px" FieldTextBoxMaxLength="100"></def:datafieldcontrol></td>
  </tr>
</table>
<h3>For New Participants or TD Children</h3>
<div class="collection">
  <div class="main"><def:datafieldcontrol runat="server" id="FIF02a" DatabaseField="FIF02a"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px " FieldTextBoxWidth="50px"></def:datafieldcontrol></div>
  <div class="key"><def:ValueSetLabel ID="ValueSetLabel_FIF02a" runat="server"  DatabaseField="FIF02a"></def:ValueSetLabel></div>
</div>
<table class="main" cellpadding="5" cellspacing="0" border="1">
  <thead>
    <td>Illness</td>
    <td>Age (years)</td>
    <td>Length of Illness</td>
    <td>High Fever<br />
    <def:ValueSetLabel ID="ValueSetLabel_FIF02b4" runat="server"  DatabaseField="FIF02b4"></def:ValueSetLabel></td>
    <td>Treatment/Aftereffects</td>
  </thead>
  <tr>
    <td><def:datafieldcontrol runat="server" id="FIF02b1" DatabaseField="FIF02b1"  IsEntryField="true" IsDoubleEntryField="false"  FieldLabelWidth="0px" FieldTextBoxMaxLength="100"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="FIF02b2" DatabaseField="FIF02b2"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="0px" FieldTextBoxWidth="50px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="FIF02b3" DatabaseField="FIF02b3"  IsEntryField="true" IsDoubleEntryField="false"  FieldLabelWidth="0px" FieldTextBoxMaxLength="100"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="FIF02b4" DatabaseField="FIF02b4"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="0px" FieldTextBoxWidth="50px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="FIF02b5" DatabaseField="FIF02b5"  IsEntryField="true" IsDoubleEntryField="false"  FieldLabelWidth="0px" FieldTextBoxMaxLength="500"></def:datafieldcontrol></td>
  </tr>
  <tr>
    <td><def:datafieldcontrol runat="server" id="FIF02c1" DatabaseField="FIF02c1"  IsEntryField="true" IsDoubleEntryField="false"  FieldLabelWidth="0px" FieldTextBoxMaxLength="100"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="FIF02c2" DatabaseField="FIF02c2"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="0px" FieldTextBoxWidth="50px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="FIF02c3" DatabaseField="FIF02c3"  IsEntryField="true" IsDoubleEntryField="false"  FieldLabelWidth="0px" FieldTextBoxMaxLength="100"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="FIF02c4" DatabaseField="FIF02c4"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="0px" FieldTextBoxWidth="50px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="FIF02c5" DatabaseField="FIF02c5"  IsEntryField="true" IsDoubleEntryField="false"  FieldLabelWidth="0px" FieldTextBoxMaxLength="500"></def:datafieldcontrol></td>
  </tr>
  <tr>
    <td><def:datafieldcontrol runat="server" id="FIF02d1" DatabaseField="FIF02d1"  IsEntryField="true" IsDoubleEntryField="false"  FieldLabelWidth="0px" FieldTextBoxMaxLength="100"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="FIF02d2" DatabaseField="FIF02d2"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="0px" FieldTextBoxWidth="50px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="FIF02d3" DatabaseField="FIF02d3"  IsEntryField="true" IsDoubleEntryField="false"  FieldLabelWidth="0px" FieldTextBoxMaxLength="100"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="FIF02d4" DatabaseField="FIF02d4"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="0px" FieldTextBoxWidth="50px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="FIF02d5" DatabaseField="FIF02d5"  IsEntryField="true" IsDoubleEntryField="false"  FieldLabelWidth="0px" FieldTextBoxMaxLength="500"></def:datafieldcontrol></td>
  </tr>
</table>
<table class="main" cellpadding="5" cellspacing="0" border="1">
  <thead>
    <td>Operations</td>
    <td>Age (years)</td>
    <td>Length of Time in Hospital</td>
    <td>Aftereffects</td>
  </thead>
  <tr>
    <td><def:datafieldcontrol runat="server" id="FIF02e1" DatabaseField="FIF02e1"  IsEntryField="true" IsDoubleEntryField="false"  FieldLabelWidth="0px" FieldTextBoxMaxLength="100"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="FIF02e2" DatabaseField="FIF02e2"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="0px" FieldTextBoxWidth="50px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="FIF02e3" DatabaseField="FIF02e3"  IsEntryField="true" IsDoubleEntryField="false"  FieldLabelWidth="0px" FieldTextBoxMaxLength="100"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="FIF02e4" DatabaseField="FIF02e4"  IsEntryField="true" IsDoubleEntryField="false"  FieldLabelWidth="0px" FieldTextBoxMaxLength="500"></def:datafieldcontrol></td>
  </tr>
  <tr>
    <td><def:datafieldcontrol runat="server" id="FIF02f1" DatabaseField="FIF02f1"  IsEntryField="true" IsDoubleEntryField="false"  FieldLabelWidth="0px" FieldTextBoxMaxLength="100"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="FIF02f2" DatabaseField="FIF02f2"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="0px" FieldTextBoxWidth="50px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="FIF02f3" DatabaseField="FIF02f3"  IsEntryField="true" IsDoubleEntryField="false"  FieldLabelWidth="0px" FieldTextBoxMaxLength="100"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="FIF02f4" DatabaseField="FIF02f4"  IsEntryField="true" IsDoubleEntryField="false"  FieldLabelWidth="0px" FieldTextBoxMaxLength="500"></def:datafieldcontrol></td>
  </tr>
  <tr>
    <td><def:datafieldcontrol runat="server" id="FIF02g1" DatabaseField="FIF02g1"  IsEntryField="true" IsDoubleEntryField="false"  FieldLabelWidth="0px" FieldTextBoxMaxLength="100"></def:datafieldcontrol></td>  
    <td><def:datafieldcontrol runat="server" id="FIF02g2" DatabaseField="FIF02g2"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="0px" FieldTextBoxWidth="50px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="FIF02g3" DatabaseField="FIF02g3"  IsEntryField="true" IsDoubleEntryField="false"  FieldLabelWidth="0px" FieldTextBoxMaxLength="100"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="FIF02g4" DatabaseField="FIF02g4"  IsEntryField="true" IsDoubleEntryField="false"  FieldLabelWidth="0px" FieldTextBoxMaxLength="500"></def:datafieldcontrol></td>
  </tr>
</table>
<table class="main" cellpadding="5" cellspacing="0" border="1">
  <thead>
    <td>Other Hospitalizations</td>
    <td>Age (years)</td>
    <td>Length of Time in Hospital</td>
    <td>Aftereffects</td>
  </thead>
  <tr>
    <td><def:datafieldcontrol runat="server" id="FIF02h1" DatabaseField="FIF02h1"  IsEntryField="true" IsDoubleEntryField="false"  FieldLabelWidth="0px" FieldTextBoxMaxLength="100"></def:datafieldcontrol></td>  
    <td><def:datafieldcontrol runat="server" id="FIF02h2" DatabaseField="FIF02h2"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="0px" FieldTextBoxWidth="50px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="FIF02h3" DatabaseField="FIF02h3"  IsEntryField="true" IsDoubleEntryField="false"  FieldLabelWidth="0px" FieldTextBoxMaxLength="100"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="FIF02h4" DatabaseField="FIF02h4"  IsEntryField="true" IsDoubleEntryField="false"  FieldLabelWidth="0px" FieldTextBoxMaxLength="500"></def:datafieldcontrol></td>
  </tr>
  <tr>
    <td><def:datafieldcontrol runat="server" id="FIF02i1" DatabaseField="FIF02i1"  IsEntryField="true" IsDoubleEntryField="false"  FieldLabelWidth="0px" FieldTextBoxMaxLength="100"></def:datafieldcontrol></td>  
    <td><def:datafieldcontrol runat="server" id="FIF02i2" DatabaseField="FIF02i2"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="0px" FieldTextBoxWidth="50px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="FIF02i3" DatabaseField="FIF02i3"  IsEntryField="true" IsDoubleEntryField="false"  FieldLabelWidth="0px" FieldTextBoxMaxLength="100"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="FIF02i4" DatabaseField="FIF02i4"  IsEntryField="true" IsDoubleEntryField="false"  FieldLabelWidth="0px" FieldTextBoxMaxLength="500"></def:datafieldcontrol></td>
  </tr>
  <tr>
    <td><def:datafieldcontrol runat="server" id="FIF02j1" DatabaseField="FIF02j1"  IsEntryField="true" IsDoubleEntryField="false"  FieldLabelWidth="0px" FieldTextBoxMaxLength="100"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="FIF02j2" DatabaseField="FIF02j2"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="0px" FieldTextBoxWidth="50px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="FIF02j3" DatabaseField="FIF02j3"  IsEntryField="true" IsDoubleEntryField="false"  FieldLabelWidth="0px" FieldTextBoxMaxLength="100"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="FIF02j4" DatabaseField="FIF02j4"  IsEntryField="true" IsDoubleEntryField="false"  FieldLabelWidth="0px" FieldTextBoxMaxLength="500"></def:datafieldcontrol></td>
  </tr>
</table>
<h3>For All Participants</h3>
<div class="collection">
  <div class="main"><def:datafieldcontrol runat="server" id="FIF03a1" DatabaseField="FIF03a1"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="200px" FieldTextBoxWidth="50px"></def:datafieldcontrol></div>
  <div class="key"><def:ValueSetLabel ID="ValueSetLabel_FIF03a1" runat="server"  DatabaseField="FIF03a1"></def:ValueSetLabel></div>
</div>
<div class="main"><def:datafieldcontrol runat="server" id="FIF03a2" DatabaseField="FIF03a2"  IsEntryField="true" IsDoubleEntryField="false"  FieldLabelWidth="200px" FieldTextBoxWidth="300px" FieldTextBoxMaxLength="100"></def:datafieldcontrol></div>
<div class="collection">
  <div class="main"><def:datafieldcontrol runat="server" id="FIF03b1" DatabaseField="FIF03b1"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="200px" FieldTextBoxWidth="50px"></def:datafieldcontrol></div>
  <div class="key"><def:ValueSetLabel ID="ValueSetLabel_FIF03b1" runat="server"  DatabaseField="FIF03b1"></def:ValueSetLabel></div>
</div>
<div class="main"><def:datafieldcontrol runat="server" id="FIF03b2" DatabaseField="FIF03b2"  IsEntryField="true" IsDoubleEntryField="false"  FieldLabelWidth="200px" FieldTextBoxWidth="300px" FieldTextBoxMaxLength="100"></def:datafieldcontrol></div>
<div class="collection">
  <div class="main"><def:datafieldcontrol runat="server" id="FIF03c1" DatabaseField="FIF03c1"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="200px" FieldTextBoxWidth="50px"></def:datafieldcontrol></div>
  <div class="key"><def:ValueSetLabel ID="ValueSetLabel_FIF03c1" runat="server"  DatabaseField="FIF03c1"></def:ValueSetLabel></div>
</div>
<div class="main"><def:datafieldcontrol runat="server" id="FIF03c2" DatabaseField="FIF03c2"  IsEntryField="true" IsDoubleEntryField="false"  FieldLabelWidth="200px" FieldTextBoxWidth="300px" FieldTextBoxMaxLength="100"></def:datafieldcontrol></div>
<div class="collection">
  <div class="main"><def:datafieldcontrol runat="server" id="FIF03d1" DatabaseField="FIF03d1"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="200px" FieldTextBoxWidth="50px"></def:datafieldcontrol></div>
  <div class="key"><def:ValueSetLabel ID="ValueSetLabel_FIF03d1" runat="server"  DatabaseField="FIF03d1"></def:ValueSetLabel></div>
</div>
<div class="main"><def:datafieldcontrol runat="server" id="FIF03d2" DatabaseField="FIF03d2"  IsEntryField="true" IsDoubleEntryField="false"  FieldLabelWidth="200px" FieldTextBoxWidth="300px" FieldTextBoxMaxLength="100"></def:datafieldcontrol></div>
<div class="collection">
  <div class="main"><def:datafieldcontrol runat="server" id="FIF03e1" DatabaseField="FIF03e1"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="200px" FieldTextBoxWidth="50px"></def:datafieldcontrol></div>
  <div class="key"><def:ValueSetLabel ID="ValueSetLabel_FIF03e1" runat="server"  DatabaseField="FIF03e1"></def:ValueSetLabel></div>
</div>
<div class="main"><def:datafieldcontrol runat="server" id="FIF03e2" DatabaseField="FIF03e2"  IsEntryField="true" IsDoubleEntryField="false"  FieldLabelWidth="200px" FieldTextBoxWidth="300px" FieldTextBoxMaxLength="100"></def:datafieldcontrol></div>
<div class="collection">
  <div class="main"><def:datafieldcontrol runat="server" id="FIF03f1" DatabaseField="FIF03f1"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="200px" FieldTextBoxWidth="50px"></def:datafieldcontrol></div>
  <div class="key"><def:ValueSetLabel ID="ValueSetLabel_FIF03f1" runat="server"  DatabaseField="FIF03f1"></def:ValueSetLabel></div>
</div>
<div class="main"><def:datafieldcontrol runat="server" id="FIF03f2" DatabaseField="FIF03f2"  IsEntryField="true" IsDoubleEntryField="false"  FieldLabelWidth="200px" FieldTextBoxWidth="300px" FieldTextBoxMaxLength="100"></def:datafieldcontrol></div>
<div class="collection">
  <div class="main"><def:datafieldcontrol runat="server" id="FIF03g1" DatabaseField="FIF03g1"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="200px" FieldTextBoxWidth="50px"></def:datafieldcontrol></div>
  <div class="key"><def:ValueSetLabel ID="ValueSetLabel_FIF03g1" runat="server"  DatabaseField="FIF03g1"></def:ValueSetLabel></div>
</div>
<div class="main"><def:datafieldcontrol runat="server" id="FIF03g2" DatabaseField="FIF03g2"  IsEntryField="true" IsDoubleEntryField="false"  FieldLabelWidth="200px" FieldTextBoxWidth="300px" FieldTextBoxMaxLength="100"></def:datafieldcontrol></div>
<div class="collection">
  <div class="main"><def:datafieldcontrol runat="server" id="FIF03h1" DatabaseField="FIF03h1"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="200px" FieldTextBoxWidth="50px"></def:datafieldcontrol></div>
  <div class="key"><def:ValueSetLabel ID="ValueSetLabel_FIF03h1" runat="server"  DatabaseField="FIF03h1"></def:ValueSetLabel></div>
</div>
<div class="main"><def:datafieldcontrol runat="server" id="FIF03h2" DatabaseField="FIF03h2"  IsEntryField="true" IsDoubleEntryField="false"  FieldLabelWidth="200px" FieldTextBoxWidth="300px" FieldTextBoxMaxLength="100"></def:datafieldcontrol></div>
<div class="collection">
  <div class="main"><def:datafieldcontrol runat="server" id="FIF03i1" DatabaseField="FIF03i1"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="200px" FieldTextBoxWidth="50px"></def:datafieldcontrol></div>
  <div class="key"><def:ValueSetLabel ID="ValueSetLabel_FIF03i1" runat="server"  DatabaseField="FIF03i1"></def:ValueSetLabel></div>
</div>
<div class="main"><def:datafieldcontrol runat="server" id="FIF03i2" DatabaseField="FIF03i2"  IsEntryField="true" IsDoubleEntryField="false"  FieldLabelWidth="200px" FieldTextBoxWidth="300px" FieldTextBoxMaxLength="100"></def:datafieldcontrol></div>
<div class="collection">
  <div class="main"><def:datafieldcontrol runat="server" id="FIF03j1" DatabaseField="FIF03j1"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="200px" FieldTextBoxWidth="50px"></def:datafieldcontrol></div>
  <div class="key"><def:ValueSetLabel ID="ValueSetLabel_FIF03j1" runat="server"  DatabaseField="FIF03j1"></def:ValueSetLabel></div>
</div>
<div class="main"><def:datafieldcontrol runat="server" id="FIF03j2" DatabaseField="FIF03j2"  IsEntryField="true" IsDoubleEntryField="false"  FieldLabelWidth="200px" FieldTextBoxWidth="300px" FieldTextBoxMaxLength="100"></def:datafieldcontrol></div>
<div class="collection">
  <div class="main"><def:datafieldcontrol runat="server" id="FIF03k1" DatabaseField="FIF03k1"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="200px" FieldTextBoxWidth="50px"></def:datafieldcontrol></div>
  <div class="key"><def:ValueSetLabel ID="ValueSetLabel_FIF03k1" runat="server"  DatabaseField="FIF03k1"></def:ValueSetLabel></div>
</div>
<div class="main"><def:datafieldcontrol runat="server" id="FIF03k2" DatabaseField="FIF03k2"  IsEntryField="true" IsDoubleEntryField="false"  FieldLabelWidth="200px" FieldTextBoxWidth="300px" FieldTextBoxMaxLength="100"></def:datafieldcontrol></div>
<div class="collection">
  <div class="main"><def:datafieldcontrol runat="server" id="FIF03l1" DatabaseField="FIF03l1"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="200px" FieldTextBoxWidth="50px"></def:datafieldcontrol></div>
  <div class="key"><def:ValueSetLabel ID="ValueSetLabel_FIF03l1" runat="server"  DatabaseField="FIF03l1"></def:ValueSetLabel></div>
</div>
<div class="main"><def:datafieldcontrol runat="server" id="FIF03l2" DatabaseField="FIF03l2"  IsEntryField="true" IsDoubleEntryField="false"  FieldLabelWidth="200px" FieldTextBoxWidth="300px" FieldTextBoxMaxLength="100"></def:datafieldcontrol></div>
<div class="collection">
  <div class="main"><def:datafieldcontrol runat="server" id="FIF03m1" DatabaseField="FIF03m1"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="200px" FieldTextBoxWidth="50px"></def:datafieldcontrol></div>
  <div class="key"><def:ValueSetLabel ID="ValueSetLabel_FIF03m1" runat="server"  DatabaseField="FIF03m1"></def:ValueSetLabel></div>
</div>
<div class="main"><def:datafieldcontrol runat="server" id="FIF03m2" DatabaseField="FIF03m2"  IsEntryField="true" IsDoubleEntryField="false"  FieldLabelWidth="200px" FieldTextBoxWidth="300px" FieldTextBoxMaxLength="100"></def:datafieldcontrol></div>
<div class="collection">
  <div class="main"><def:datafieldcontrol runat="server" id="FIF03n1" DatabaseField="FIF03n1"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="200px" FieldTextBoxWidth="50px"></def:datafieldcontrol></div>
  <div class="key"><def:ValueSetLabel ID="ValueSetLabel_FIF03n1" runat="server"  DatabaseField="FIF03n1"></def:ValueSetLabel></div>
</div>
<div class="main"><def:datafieldcontrol runat="server" id="FIF03n2" DatabaseField="FIF03n2"  IsEntryField="true" IsDoubleEntryField="false"  FieldLabelWidth="200px" FieldTextBoxWidth="300px" FieldTextBoxMaxLength="100"></def:datafieldcontrol></div>
<h3>TD and New Participants</h3>
<div class="collection">
  <div class="main"><def:datafieldcontrol runat="server" id="FIF04a1" DatabaseField="FIF04a1"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px " FieldTextBoxWidth="50px"></def:datafieldcontrol></div>
  <div class="key"><def:ValueSetLabel ID="ValueSetLabel_FIF04a1" runat="server"  DatabaseField="FIF04a1"></def:ValueSetLabel></div>
</div>
<div class="main"><def:datafieldcontrol runat="server" id="FIF04a2" DatabaseField="FIF04a2"  IsEntryField="true" IsDoubleEntryField="false"  FieldLabelWidth="150px"></def:datafieldcontrol></div>
<div class="main"><def:datafieldcontrol runat="server" id="FIF04a3" DatabaseField="FIF04a3"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="150px"></def:datafieldcontrol></div>
<div class="collection">
  <div class="main">
  <def:datafieldcontrol runat="server" id="FIF04b" DatabaseField="FIF04b"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="200px" FieldTextBoxWidth="50px"></def:datafieldcontrol>
  <def:datafieldcontrol runat="server" id="FIF04c" DatabaseField="FIF04c"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="200px" FieldTextBoxWidth="50px"></def:datafieldcontrol>
  <def:datafieldcontrol runat="server" id="FIF04d" DatabaseField="FIF04d"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="200px" FieldTextBoxWidth="50px"></def:datafieldcontrol>
  <def:datafieldcontrol runat="server" id="FIF04e" DatabaseField="FIF04e"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="200px" FieldTextBoxWidth="50px"></def:datafieldcontrol>
  <def:datafieldcontrol runat="server" id="FIF04f" DatabaseField="FIF04f"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="200px" FieldTextBoxWidth="50px"></def:datafieldcontrol>
  <def:datafieldcontrol runat="server" id="FIF04g" DatabaseField="FIF04g"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="200px" FieldTextBoxWidth="50px"></def:datafieldcontrol>
  <def:datafieldcontrol runat="server" id="FIF04h" DatabaseField="FIF04h"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="200px" FieldTextBoxWidth="50px"></def:datafieldcontrol>
  <def:datafieldcontrol runat="server" id="FIF04i" DatabaseField="FIF04i"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="200px" FieldTextBoxWidth="50px"></def:datafieldcontrol>
  <def:datafieldcontrol runat="server" id="FIF04j" DatabaseField="FIF04j"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="200px" FieldTextBoxWidth="50px"></def:datafieldcontrol>
  <def:datafieldcontrol runat="server" id="FIF04k" DatabaseField="FIF04k"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="200px" FieldTextBoxWidth="50px"></def:datafieldcontrol>
  <def:datafieldcontrol runat="server" id="FIF04l" DatabaseField="FIF04l"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="200px" FieldTextBoxWidth="50px"></def:datafieldcontrol>
  <def:datafieldcontrol runat="server" id="FIF04m" DatabaseField="FIF04m"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="200px" FieldTextBoxWidth="50px"></def:datafieldcontrol>
  <def:datafieldcontrol runat="server" id="FIF04n" DatabaseField="FIF04n"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="200px" FieldTextBoxWidth="50px"></def:datafieldcontrol>
  <def:datafieldcontrol runat="server" id="FIF04o1" DatabaseField="FIF04o1"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="200px" FieldTextBoxWidth="50px"></def:datafieldcontrol>
  </div>
  <div class="key"><def:ValueSetLabel ID="ValueSetLabel_FIF04b" runat="server"  DatabaseField="FIF04b"></def:ValueSetLabel></div>
</div>
<div class="main"><def:datafieldcontrol runat="server" id="FIF04o2" DatabaseField="FIF04o2"  IsEntryField="true" IsDoubleEntryField="false"  FieldLabelWidth="200px" FieldTextBoxWidth="300px" FieldTextBoxMaxLength="100"></def:datafieldcontrol></div>
<div class="main"><def:datafieldcontrol runat="server" id="FIF04p" DatabaseField="FIF04p"  IsEntryField="true" IsDoubleEntryField="false"  FieldLabelWidth="200px" FieldTextBoxWidth="300px" FieldTextBoxMaxLength="100"></def:datafieldcontrol></div>
<h3>TD and New Participants</h3>
<div class="collection">
  <div class="main">
  <def:datafieldcontrol runat="server" id="FIF05a" DatabaseField="FIF05a"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px " FieldTextBoxWidth="50px"></def:datafieldcontrol>
  <def:datafieldcontrol runat="server" id="FIF05b" DatabaseField="FIF05b"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px " FieldTextBoxWidth="50px"></def:datafieldcontrol>
  <def:datafieldcontrol runat="server" id="FIF05c" DatabaseField="FIF05c"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px " FieldTextBoxWidth="50px"></def:datafieldcontrol>
  <def:datafieldcontrol runat="server" id="FIF05d" DatabaseField="FIF05d"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px " FieldTextBoxWidth="50px"></def:datafieldcontrol>
  </div>
  <div class="key"><def:ValueSetLabel ID="ValueSetLabel_FIF05a" runat="server"  DatabaseField="FIF05a"></def:ValueSetLabel></div>
</div>
<h3>All Participants</h3>
<div class="collection">
  <div class="main"><def:datafieldcontrol runat="server" id="FIF06a" DatabaseField="FIF06a"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px " FieldTextBoxWidth="50px"></def:datafieldcontrol></div>
  <div class="key"><def:ValueSetLabel ID="ValueSetLabel_FIF06a" runat="server"  DatabaseField="FIF06a"></def:ValueSetLabel></div>
</div>
<table class="main" cellpadding="5" cellspacing="0" border="1">
  <thead>
    <td>Name of Medication</td>
    <td>Reason</td>
    <td>Date Began</td>
    <td>Currently Taking</td>
  </thead>
  <tr>
    <td><def:datafieldcontrol runat="server" id="FIF06b1" DatabaseField="FIF06b1"  IsEntryField="true" IsDoubleEntryField="false"  FieldLabelWidth="0px " FieldTextBoxMaxLength="100"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="FIF06b2" DatabaseField="FIF06b2"  IsEntryField="true" IsDoubleEntryField="false"  FieldLabelWidth="0px " FieldTextBoxMaxLength="200"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="FIF06b3" DatabaseField="FIF06b3"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="0px "></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="FIF06b4" DatabaseField="FIF06b4"  IsEntryField="true" IsDoubleEntryField="false"  FieldLabelWidth="0px " FieldTextBoxMaxLength="100"></def:datafieldcontrol></td>
  </tr>
  <tr>
    <td><def:datafieldcontrol runat="server" id="FIF06c1" DatabaseField="FIF06c1"  IsEntryField="true" IsDoubleEntryField="false"  FieldLabelWidth="0px " FieldTextBoxMaxLength="100"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="FIF06c2" DatabaseField="FIF06c2"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="0px " FieldTextBoxMaxLength="200"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="FIF06c3" DatabaseField="FIF06c3"  IsEntryField="true" IsDoubleEntryField="false"  FieldLabelWidth="0px "></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="FIF06c4" DatabaseField="FIF06c4"  IsEntryField="true" IsDoubleEntryField="false"  FieldLabelWidth="0px " FieldTextBoxMaxLength="100"></def:datafieldcontrol></td>
  </tr>
  <tr>
    <td><def:datafieldcontrol runat="server" id="FIF06d1" DatabaseField="FIF06d1"  IsEntryField="true" IsDoubleEntryField="false"  FieldLabelWidth="0px " FieldTextBoxMaxLength="100"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="FIF06d2" DatabaseField="FIF06d2"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="0px " FieldTextBoxMaxLength="200"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="FIF06d3" DatabaseField="FIF06d3"  IsEntryField="true" IsDoubleEntryField="false"  FieldLabelWidth="0px "></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="FIF06d4" DatabaseField="FIF06d4"  IsEntryField="true" IsDoubleEntryField="false"  FieldLabelWidth="0px " FieldTextBoxMaxLength="100"></def:datafieldcontrol></td>
  </tr>
  <tr>
    <td><def:datafieldcontrol runat="server" id="FIF06e1" DatabaseField="FIF06e1"  IsEntryField="true" IsDoubleEntryField="false"  FieldLabelWidth="0px " FieldTextBoxMaxLength="100"></def:datafieldcontrol></td>  
    <td><def:datafieldcontrol runat="server" id="FIF06e2" DatabaseField="FIF06e2"  IsEntryField="true" IsDoubleEntryField="false"  FieldLabelWidth="0px " FieldTextBoxMaxLength="200"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="FIF06e3" DatabaseField="FIF06e3"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="0px "></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="FIF06e4" DatabaseField="FIF06e4"  IsEntryField="true" IsDoubleEntryField="false"  FieldLabelWidth="0px " FieldTextBoxMaxLength="100"></def:datafieldcontrol></td>
  </tr>
</table>
<div class="collection">
  <div class="main"><def:datafieldcontrol runat="server" id="FIF07a" DatabaseField="FIF07a"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="150px " FieldTextBoxWidth="50px"></def:datafieldcontrol></div>
  <div class="key"><def:ValueSetLabel ID="ValueSetLabel_FIF07a" runat="server"  DatabaseField="FIF07a"></def:ValueSetLabel></div>
</div>
<div class="collection">
  <div class="main"><def:datafieldcontrol runat="server" id="FIF07b" DatabaseField="FIF07b"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="150px " FieldTextBoxWidth="50px"></def:datafieldcontrol></div>
  <div class="key"><def:ValueSetLabel ID="ValueSetLabel_FIF07b" runat="server"  DatabaseField="FIF07b"></def:ValueSetLabel></div>
</div>
<div class="collection">
  <div class="main"><def:datafieldcontrol runat="server" id="FIF07c1" DatabaseField="FIF07c1"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="150px " FieldTextBoxWidth="50px"></def:datafieldcontrol></div>
  <div class="key"><def:ValueSetLabel ID="ValueSetLabel_FIF07c1" runat="server"  DatabaseField="FIF07c1"></def:ValueSetLabel></div>
</div>
<div class="main">
<def:datafieldcontrol runat="server" id="FIF07c2" DatabaseField="FIF07c2"  IsEntryField="true" IsDoubleEntryField="false"  FieldLabelWidth="150px " FieldTextBoxWidth="400px" FieldTextBoxMaxLength="200"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="FIF08a1" DatabaseField="FIF08a1"  IsEntryField="true" IsDoubleEntryField="false"  FieldLabelWidth="300px " FieldTextBoxWidth="400px" FieldTextBoxMaxLength="200"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="FIF08a2" DatabaseField="FIF08a2"  IsEntryField="true" IsDoubleEntryField="false"  FieldLabelWidth="300px " FieldTextBoxWidth="400px" FieldTextBoxMaxLength="200"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="FIF08a3" DatabaseField="FIF08a3"  IsEntryField="true" IsDoubleEntryField="false"  FieldLabelWidth="300px " FieldTextBoxWidth="400px" FieldTextBoxMaxLength="200"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="FIF08b" DatabaseField="FIF08b"  IsEntryField="true" IsDoubleEntryField="false"  FieldLabelWidth="300px " FieldTextBoxWidth="400px" FieldTextBoxMaxLength="200"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="FIF08c" DatabaseField="FIF08c"  IsEntryField="true" IsDoubleEntryField="false"  FieldLabelWidth="300px " FieldTextBoxWidth="400px" FieldTextBoxMaxLength="200"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="FIF09" DatabaseField="FIF09"  IsEntryField="true" IsDoubleEntryField="false"  FieldLabelWidth="300px " FieldTextBoxWidth="400px" FieldTextBoxMaxLength="200"></def:datafieldcontrol>
</div>
<div class="collection">
  <div class="main"><def:datafieldcontrol runat="server" id="FIF10a1" DatabaseField="FIF10a1"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px " FieldTextBoxWidth="50px"></def:datafieldcontrol></div>
  <div class="key"><def:ValueSetLabel ID="ValueSetLabel_FIF10a1" runat="server"  DatabaseField="FIF10a1"></def:ValueSetLabel></div>
</div>
<div class="main">
<def:datafieldcontrol runat="server" id="FIF10a2" DatabaseField="FIF10a2"  IsEntryField="true" IsDoubleEntryField="false"  FieldLabelWidth="300px " FieldTextBoxWidth="400px" FieldTextBoxMaxLength="200"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="FIF10b" DatabaseField="FIF10b"  IsEntryField="true" IsDoubleEntryField="false"  FieldLabelWidth="300px " FieldTextBoxWidth="400px" FieldTextBoxMaxLength="200"></def:datafieldcontrol>
</div>
<h3>Rating of Family Motivation/Availability to Participate</h3>
<div class="collection">
  <div class="main"><def:datafieldcontrol runat="server" id="FIF11a" DatabaseField="FIF11a"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="250px " FieldTextBoxWidth="50px"></def:datafieldcontrol></div>
  <div class="key"><def:ValueSetLabel ID="ValueSetLabel_FIF11a" runat="server"  DatabaseField="FIF11a"></def:ValueSetLabel></div>
</div>
<div class="main"><def:datafieldcontrol runat="server" id="FIF11b" DatabaseField="FIF11b"  IsEntryField="true" IsDoubleEntryField="false"  FieldLabelWidth="250px " FieldTextBoxWidth="400px" FieldTextBoxHeight="40px" FieldTextBoxTextMode="MultiLine" FieldTextBoxMaxLength="1000"></def:datafieldcontrol></div>
<h3>Typicals and New Subjects</h3>
<div class="collection">
    <div class="main"> 
        <def:datafieldcontrol runat="server" id="TypNewA" DatabaseField="TypNewA" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
        <def:datafieldcontrol runat="server" id="TypNewB" DatabaseField="TypNewB" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="300px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="100"></def:datafieldcontrol>
        <def:datafieldcontrol runat="server" id="TypNewC" DatabaseField="TypNewC" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
        <def:datafieldcontrol runat="server" id="TypNewD" DatabaseField="TypNewD" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="300px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="100"></def:datafieldcontrol>
    </div>
    <div class="key"><def:ValueSetLabel ID="ValueSetLabel_TypNewA" runat="server"  DatabaseField="TypNewA"></def:ValueSetLabel></div>
</div>
<div class="collection">
    <div class="main"><def:datafieldcontrol runat="server" id="TypNewE" DatabaseField="TypNewE" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
    <div class="key"><def:ValueSetLabel ID="ValueSetLabel_TypNewE" runat="server"  DatabaseField="TypNewE"></def:ValueSetLabel></div>
</div>
<div class="main">
    <def:datafieldcontrol runat="server" id="TypNewEb" DatabaseField="TypNewEb" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="300px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="50"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="TypNewEo" DatabaseField="TypNewEo" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="300px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="50"></def:datafieldcontrol>
</div> 
<div class="collection">
    <div class="main"><def:datafieldcontrol runat="server" id="TypNewF" DatabaseField="TypNewF" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
    <div class="key"><def:ValueSetLabel ID="ValueSetLabel_TypNewF" runat="server"  DatabaseField="TypNewF"></def:ValueSetLabel></div>
</div>
</asp:Panel>
<div class="main">
<def:datafieldcontrol runat="server" id="created" DatabaseField="created"  IsReadOnly="true" RenderReadOnlyAsDiv="true"   FieldLabelWidth="300px "></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="createdBy" DatabaseField="createdBy"  IsReadOnly="true" RenderReadOnlyAsDiv="true"   FieldLabelWidth="300px "></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="updated" DatabaseField="updated"  IsReadOnly="true" RenderReadOnlyAsDiv="true"   FieldLabelWidth="300px "></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="updatedBy" DatabaseField="updatedBy"  IsReadOnly="true" RenderReadOnlyAsDiv="true"   FieldLabelWidth="300px "></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="scored" DatabaseField="scored"  IsReadOnly="true" RenderReadOnlyAsDiv="true"   FieldLabelWidth="300px "></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="scoredBy" DatabaseField="scoredBy"  IsReadOnly="true" RenderReadOnlyAsDiv="true"   FieldLabelWidth="300px "></def:datafieldcontrol>
</div>
</asp:Content>
