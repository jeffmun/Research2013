<%@ Register TagPrefix="def" Namespace="DataEntryFramework3" %> 
<%@ Page language="c#" MasterPageFile="~/UWAC.master"  Title="FIF-Pathways Data Entry" %>
<asp:Content ID="Content1" ContentPlaceHolderID="oBodyPlaceHolder" runat="server">

<def:dataentrycontroller id="DataEntryController1" runat="server" DatabaseTable="ALL_FIF_Pathways" >
</def:dataentrycontroller>
<div class="main">
  <def:datafieldcontrol runat="server" id="id" DatabaseField="id"  IsInsertField="true"   FieldLabelWidth="300px "></def:datafieldcontrol>
  <def:datafieldcontrol runat="server" id="indexnum" DatabaseField="indexnum"  IsInsertField="true"  FieldTextBoxTextDefault="1" FieldLabelWidth="300px "></def:datafieldcontrol>
  <def:datafieldcontrol runat="server" id="Date" DatabaseField="Date" FieldLabelText="Date" IsInsertField="true"  FieldLabelWidth="300px "></def:datafieldcontrol>
</div>
<div class="collection">
  <div class="main">
    <def:datafieldcontrol runat="server" id="Relation" DatabaseField="Relation" FieldLabelText="Relationship to participating child" IsInsertField="true"  FieldLabelWidth="300px " FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="RelationSp" DatabaseField="RelationSp" FieldLabelText="Specify other relationship" IsInsertField="true"  FieldLabelWidth="300px " FieldTextBoxWidth="200px" FieldTextBoxMaxLength="50"></def:datafieldcontrol>
  </div>
  <div class="key"><def:ValueSetLabel ID="ValueSetLabel_Relation" runat="server"  DatabaseField="Relation"></def:ValueSetLabel></div>
</div>
<asp:panel id="mainPanel" CssClass="mainPanel" runat="server">
<h3>A. General Family Information</h3>
<div class="main">
  <def:datafieldcontrol runat="server" id="A1" DatabaseField="A1"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px " FieldTextBoxWidth="40px"></def:datafieldcontrol>
  <def:datafieldcontrol runat="server" id="A2" DatabaseField="A2"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px " FieldTextBoxWidth="80px"></def:datafieldcontrol>
  <def:datafieldcontrol runat="server" id="A3" DatabaseField="A3"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px " FieldTextBoxWidth="80px"></def:datafieldcontrol>
  <def:datafieldcontrol runat="server" id="A4" DatabaseField="A4"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px " FieldTextBoxWidth="80px"></def:datafieldcontrol>
</div>
<h3>B. Medical History Update</h3>
<div class="legend">0=Blank,1=Checked</div>
<table class="main" border="1" cellpadding="5" cellspacing="0">
  <thead>
    <td align="right">Child</td>
    <td>Father</td>
    <td>Mother</td>
    <td>Sibling 1<br />
    <def:datafieldcontrol runat="server" id="BS1" DatabaseField="BS1"  IsEntryField="true" IsDoubleEntryField="false"  FieldLabelWidth="0px "></def:datafieldcontrol></td>
    <td>Sibling 2<br />
    <def:datafieldcontrol runat="server" id="BS2" DatabaseField="BS2"  IsEntryField="true" IsDoubleEntryField="false"  FieldLabelWidth="0px "></def:datafieldcontrol></td>
    <td>Sibling 3<br />
    <def:datafieldcontrol runat="server" id="BS3" DatabaseField="BS3"  IsEntryField="true" IsDoubleEntryField="false"  FieldLabelWidth="0px "></def:datafieldcontrol></td>
  </thead>
  <tr>
    <td class="subhead" colspan="6">Social/Developmental</td>
  </tr>
  <tr>
    <td><def:datafieldcontrol runat="server" id="BaCh" DatabaseField="BaCh"  IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0"  FieldLabelWidth="200px " FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="BaFa" DatabaseField="BaFa"  IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0"  FieldLabelWidth="0px " FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="BaMo" DatabaseField="BaMo"  IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0"  FieldLabelWidth="0px " FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="BaS1" DatabaseField="BaS1"  IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0"  FieldLabelWidth="0px " FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="BaS2" DatabaseField="BaS2"  IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0"  FieldLabelWidth="0px " FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="BaS3" DatabaseField="BaS3"  IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0"  FieldLabelWidth="0px " FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
  </tr>
  <tr>
    <td><def:datafieldcontrol runat="server" id="BbCh" DatabaseField="BbCh"  IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0"  FieldLabelWidth="200px " FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="BbFa" DatabaseField="BbFa"  IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0"  FieldLabelWidth="0px " FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="BbMo" DatabaseField="BbMo"  IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0"  FieldLabelWidth="0px " FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="BbS1" DatabaseField="BbS1"  IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0"  FieldLabelWidth="0px " FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="BbS2" DatabaseField="BbS2"  IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0"  FieldLabelWidth="0px " FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="BbS3" DatabaseField="BbS3"  IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0"  FieldLabelWidth="0px " FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
  </tr>
  <tr>
    <td><def:datafieldcontrol runat="server" id="BcCh" DatabaseField="BcCh"  IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0"  FieldLabelWidth="200px " FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="BcFa" DatabaseField="BcFa"  IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0"  FieldLabelWidth="0px " FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="BcMo" DatabaseField="BcMo"  IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0"  FieldLabelWidth="0px " FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="BcS1" DatabaseField="BcS1"  IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0"  FieldLabelWidth="0px " FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="BcS2" DatabaseField="BcS2"  IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0"  FieldLabelWidth="0px " FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="BcS3" DatabaseField="BcS3"  IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0"  FieldLabelWidth="0px " FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
  </tr>
  <tr>
    <td><def:datafieldcontrol runat="server" id="BdCh" DatabaseField="BdCh"  IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0"  FieldLabelWidth="200px " FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="BdFa" DatabaseField="BdFa"  IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0"  FieldLabelWidth="0px " FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="BdMo" DatabaseField="BdMo"  IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0"  FieldLabelWidth="0px " FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="BdS1" DatabaseField="BdS1"  IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0"  FieldLabelWidth="0px " FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="BdS2" DatabaseField="BdS2"  IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0"  FieldLabelWidth="0px " FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="BdS3" DatabaseField="BdS3"  IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0"  FieldLabelWidth="0px " FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
  </tr>
  <tr>
    <td><def:datafieldcontrol runat="server" id="BeCh" DatabaseField="BeCh"  IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0"  FieldLabelWidth="200px " FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="BeFa" DatabaseField="BeFa"  IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0"  FieldLabelWidth="0px " FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="BeMo" DatabaseField="BeMo"  IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0"  FieldLabelWidth="0px " FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="BeS1" DatabaseField="BeS1"  IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0"  FieldLabelWidth="0px " FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="BeS2" DatabaseField="BeS2"  IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0"  FieldLabelWidth="0px " FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="BeS3" DatabaseField="BeS3"  IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0"  FieldLabelWidth="0px " FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
  </tr>
  <tr>
    <td class="subhead" colspan="6">Medical/Health</td>
  </tr>
  <tr>
    <td><def:datafieldcontrol runat="server" id="BfCh" DatabaseField="BfCh"  IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0"  FieldLabelWidth="200px " FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="BfFa" DatabaseField="BfFa"  IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0"  FieldLabelWidth="0px " FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="BfMo" DatabaseField="BfMo"  IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0"  FieldLabelWidth="0px " FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="BfS1" DatabaseField="BfS1"  IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0"  FieldLabelWidth="0px " FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="BfS2" DatabaseField="BfS2"  IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0"  FieldLabelWidth="0px " FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="BfS3" DatabaseField="BfS3"  IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0"  FieldLabelWidth="0px " FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
  </tr>
  <tr>
    <td><def:datafieldcontrol runat="server" id="BgCh" DatabaseField="BgCh"  IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0"  FieldLabelWidth="200px " FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="BgFa" DatabaseField="BgFa"  IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0"  FieldLabelWidth="0px " FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="BgMo" DatabaseField="BgMo"  IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0"  FieldLabelWidth="0px " FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="BgS1" DatabaseField="BgS1"  IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0"  FieldLabelWidth="0px " FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="BgS2" DatabaseField="BgS2"  IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0"  FieldLabelWidth="0px " FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="BgS3" DatabaseField="BgS3"  IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0"  FieldLabelWidth="0px " FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
  </tr>
  <tr>
    <td><def:datafieldcontrol runat="server" id="BhCh" DatabaseField="BhCh"  IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0"  FieldLabelWidth="200px " FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="BhFa" DatabaseField="BhFa"  IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0"  FieldLabelWidth="0px " FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="BhMo" DatabaseField="BhMo"  IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0"  FieldLabelWidth="0px " FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="BhS1" DatabaseField="BhS1"  IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0"  FieldLabelWidth="0px " FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="BhS2" DatabaseField="BhS2"  IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0"  FieldLabelWidth="0px " FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="BhS3" DatabaseField="BhS3"  IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0"  FieldLabelWidth="0px " FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
  </tr>
  <tr>
    <td><def:datafieldcontrol runat="server" id="BiCh" DatabaseField="BiCh"  IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0"  FieldLabelWidth="200px " FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="BiFa" DatabaseField="BiFa"  IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0"  FieldLabelWidth="0px " FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="BiMo" DatabaseField="BiMo"  IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0"  FieldLabelWidth="0px " FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="BiS1" DatabaseField="BiS1"  IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0"  FieldLabelWidth="0px " FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="BiS2" DatabaseField="BiS2"  IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0"  FieldLabelWidth="0px " FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="BiS3" DatabaseField="BiS3"  IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0"  FieldLabelWidth="0px " FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
  </tr>
  <tr>
    <td><def:datafieldcontrol runat="server" id="BjCh" DatabaseField="BjCh"  IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0"  FieldLabelWidth="200px " FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="BjFa" DatabaseField="BjFa"  IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0"  FieldLabelWidth="0px " FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="BjMo" DatabaseField="BjMo"  IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0"  FieldLabelWidth="0px " FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="BjS1" DatabaseField="BjS1"  IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0"  FieldLabelWidth="0px " FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="BjS2" DatabaseField="BjS2"  IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0"  FieldLabelWidth="0px " FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="BjS3" DatabaseField="BjS3"  IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0"  FieldLabelWidth="0px " FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
  </tr>
  <tr>
    <td><def:datafieldcontrol runat="server" id="BkCh" DatabaseField="BkCh"  IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0"  FieldLabelWidth="200px " FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="BkFa" DatabaseField="BkFa"  IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0"  FieldLabelWidth="0px " FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="BkMo" DatabaseField="BkMo"  IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0"  FieldLabelWidth="0px " FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="BkS1" DatabaseField="BkS1"  IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0"  FieldLabelWidth="0px " FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="BkS2" DatabaseField="BkS2"  IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0"  FieldLabelWidth="0px " FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="BkS3" DatabaseField="BkS3"  IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0"  FieldLabelWidth="0px " FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
  </tr>
  <tr>
    <td><def:datafieldcontrol runat="server" id="BlCh" DatabaseField="BlCh"  IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0"  FieldLabelWidth="200px " FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="BlFa" DatabaseField="BlFa"  IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0"  FieldLabelWidth="0px " FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="BlMo" DatabaseField="BlMo"  IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0"  FieldLabelWidth="0px " FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="BlS1" DatabaseField="BlS1"  IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0"  FieldLabelWidth="0px " FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="BlS2" DatabaseField="BlS2"  IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0"  FieldLabelWidth="0px " FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="BlS3" DatabaseField="BlS3"  IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0"  FieldLabelWidth="0px " FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
  </tr>
  <tr>
    <td><def:datafieldcontrol runat="server" id="BmCh" DatabaseField="BmCh"  IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0"  FieldLabelWidth="200px " FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="BmFa" DatabaseField="BmFa"  IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0"  FieldLabelWidth="0px " FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="BmMo" DatabaseField="BmMo"  IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0"  FieldLabelWidth="0px " FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="BmS1" DatabaseField="BmS1"  IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0"  FieldLabelWidth="0px " FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="BmS2" DatabaseField="BmS2"  IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0"  FieldLabelWidth="0px " FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="BmS3" DatabaseField="BmS3"  IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0"  FieldLabelWidth="0px " FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
  </tr>
  <tr>
    <td><def:datafieldcontrol runat="server" id="BnCh" DatabaseField="BnCh"  IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0"  FieldLabelWidth="200px " FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="BnFa" DatabaseField="BnFa"  IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0"  FieldLabelWidth="0px " FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="BnMo" DatabaseField="BnMo"  IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0"  FieldLabelWidth="0px " FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="BnS1" DatabaseField="BnS1"  IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0"  FieldLabelWidth="0px " FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="BnS2" DatabaseField="BnS2"  IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0"  FieldLabelWidth="0px " FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="BnS3" DatabaseField="BnS3"  IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0"  FieldLabelWidth="0px " FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
  </tr>
  <tr>
    <td><def:datafieldcontrol runat="server" id="BoCh" DatabaseField="BoCh"  IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0"  FieldLabelWidth="200px " FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="BoFa" DatabaseField="BoFa"  IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0"  FieldLabelWidth="0px " FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="BoMo" DatabaseField="BoMo"  IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0"  FieldLabelWidth="0px " FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="BoS1" DatabaseField="BoS1"  IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0"  FieldLabelWidth="0px " FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="BoS2" DatabaseField="BoS2"  IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0"  FieldLabelWidth="0px " FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="BoS3" DatabaseField="BoS3"  IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0"  FieldLabelWidth="0px " FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
  </tr>
  <tr>
    <td><def:datafieldcontrol runat="server" id="BpCh" DatabaseField="BpCh"  IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0"  FieldLabelWidth="200px " FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="BpFa" DatabaseField="BpFa"  IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0"  FieldLabelWidth="0px " FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="BpMo" DatabaseField="BpMo"  IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0"  FieldLabelWidth="0px " FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="BpS1" DatabaseField="BpS1"  IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0"  FieldLabelWidth="0px " FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="BpS2" DatabaseField="BpS2"  IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0"  FieldLabelWidth="0px " FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="BpS3" DatabaseField="BpS3"  IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0"  FieldLabelWidth="0px " FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
  </tr>
  <tr>
    <td><def:datafieldcontrol runat="server" id="BqCh" DatabaseField="BqCh"  IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0"  FieldLabelWidth="200px " FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="BqFa" DatabaseField="BqFa"  IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0"  FieldLabelWidth="0px " FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="BqMo" DatabaseField="BqMo"  IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0"  FieldLabelWidth="0px " FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="BqS1" DatabaseField="BqS1"  IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0"  FieldLabelWidth="0px " FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="BqS2" DatabaseField="BqS2"  IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0"  FieldLabelWidth="0px " FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="BqS3" DatabaseField="BqS3"  IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0"  FieldLabelWidth="0px " FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
  </tr>
  <tr>
    <td><def:datafieldcontrol runat="server" id="BrCh" DatabaseField="BrCh"  IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0"  FieldLabelWidth="200px " FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="BrFa" DatabaseField="BrFa"  IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0"  FieldLabelWidth="0px " FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="BrMo" DatabaseField="BrMo"  IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0"  FieldLabelWidth="0px " FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="BrS1" DatabaseField="BrS1"  IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0"  FieldLabelWidth="0px " FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="BrS2" DatabaseField="BrS2"  IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0"  FieldLabelWidth="0px " FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="BrS3" DatabaseField="BrS3"  IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0"  FieldLabelWidth="0px " FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
  </tr>
  <tr>
    <td class="subhead" colspan="6">Psychological/Psychiatric</td>
  </tr>
  <tr>
    <td><def:datafieldcontrol runat="server" id="BsCh" DatabaseField="BsCh"  IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0"  FieldLabelWidth="200px " FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="BsFa" DatabaseField="BsFa"  IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0"  FieldLabelWidth="0px " FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="BsMo" DatabaseField="BsMo"  IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0"  FieldLabelWidth="0px " FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="BsS1" DatabaseField="BsS1"  IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0"  FieldLabelWidth="0px " FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="BsS2" DatabaseField="BsS2"  IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0"  FieldLabelWidth="0px " FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="BsS3" DatabaseField="BsS3"  IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0"  FieldLabelWidth="0px " FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
  </tr>
  <tr>
    <td><def:datafieldcontrol runat="server" id="BtCh" DatabaseField="BtCh"  IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0"  FieldLabelWidth="200px " FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="BtFa" DatabaseField="BtFa"  IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0"  FieldLabelWidth="0px " FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="BtMo" DatabaseField="BtMo"  IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0"  FieldLabelWidth="0px " FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="BtS1" DatabaseField="BtS1"  IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0"  FieldLabelWidth="0px " FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="BtS2" DatabaseField="BtS2"  IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0"  FieldLabelWidth="0px " FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="BtS3" DatabaseField="BtS3"  IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0"  FieldLabelWidth="0px " FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
  </tr>
  <tr>
    <td><def:datafieldcontrol runat="server" id="BuCh" DatabaseField="BuCh"  IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0"  FieldLabelWidth="200px " FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="BuFa" DatabaseField="BuFa"  IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0"  FieldLabelWidth="0px " FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="BuMo" DatabaseField="BuMo"  IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0"  FieldLabelWidth="0px " FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="BuS1" DatabaseField="BuS1"  IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0"  FieldLabelWidth="0px " FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="BuS2" DatabaseField="BuS2"  IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0"  FieldLabelWidth="0px " FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="BuS3" DatabaseField="BuS3"  IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0"  FieldLabelWidth="0px " FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
  </tr>
  <tr>
    <td><def:datafieldcontrol runat="server" id="BvCh" DatabaseField="BvCh"  IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0"  FieldLabelWidth="200px " FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="BvFa" DatabaseField="BvFa"  IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0"  FieldLabelWidth="0px " FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="BvMo" DatabaseField="BvMo"  IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0"  FieldLabelWidth="0px " FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="BvS1" DatabaseField="BvS1"  IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0"  FieldLabelWidth="0px " FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="BvS2" DatabaseField="BvS2"  IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0"  FieldLabelWidth="0px " FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="BvS3" DatabaseField="BvS3"  IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0"  FieldLabelWidth="0px " FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
  </tr>
  <tr>
    <td><def:datafieldcontrol runat="server" id="BwCh" DatabaseField="BwCh"  IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0"  FieldLabelWidth="200px " FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="BwFa" DatabaseField="BwFa"  IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0"  FieldLabelWidth="0px " FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="BwMo" DatabaseField="BwMo"  IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0"  FieldLabelWidth="0px " FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="BwS1" DatabaseField="BwS1"  IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0"  FieldLabelWidth="0px " FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="BwS2" DatabaseField="BwS2"  IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0"  FieldLabelWidth="0px " FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="BwS3" DatabaseField="BwS3"  IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0"  FieldLabelWidth="0px " FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
  </tr>
  <tr>
    <td><def:datafieldcontrol runat="server" id="BxCh" DatabaseField="BxCh"  IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0"  FieldLabelWidth="200px " FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="BxFa" DatabaseField="BxFa"  IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0"  FieldLabelWidth="0px " FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="BxMo" DatabaseField="BxMo"  IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0"  FieldLabelWidth="0px " FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="BxS1" DatabaseField="BxS1"  IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0"  FieldLabelWidth="0px " FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="BxS2" DatabaseField="BxS2"  IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0"  FieldLabelWidth="0px " FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="BxS3" DatabaseField="BxS3"  IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0"  FieldLabelWidth="0px " FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
  </tr>
  <tr>
    <td><def:datafieldcontrol runat="server" id="ByCh" DatabaseField="ByCh"  IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0"  FieldLabelWidth="200px " FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="ByFa" DatabaseField="ByFa"  IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0"  FieldLabelWidth="0px " FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="ByMo" DatabaseField="ByMo"  IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0"  FieldLabelWidth="0px " FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="ByS1" DatabaseField="ByS1"  IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0"  FieldLabelWidth="0px " FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="ByS2" DatabaseField="ByS2"  IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0"  FieldLabelWidth="0px " FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="ByS3" DatabaseField="ByS3"  IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0"  FieldLabelWidth="0px " FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
  </tr>
</table>
<h3>C. Neurological Update</h3>
<div class="main">1. Since your child was 4 years old</div>
<div class="collection">
  <div class="main">
    <def:datafieldcontrol runat="server" id="C1a1" DatabaseField="C1a1"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px " FieldTextBoxWidth="40px"></def:datafieldcontrol>
  </div>
  <div class="key"><def:ValueSetLabel ID="ValueSetLabel_C1a1" runat="server"  DatabaseField="C1a1"></def:ValueSetLabel></div>
</div>
<div class="indent">
  <def:datafieldcontrol runat="server" id="C1a2" DatabaseField="C1a2"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px " FieldTextBoxWidth="40px"></def:datafieldcontrol>
  <def:datafieldcontrol runat="server" id="C1a3" DatabaseField="C1a3"  IsEntryField="true" IsDoubleEntryField="false"  FieldLabelWidth="300px "></def:datafieldcontrol>
</div>
<div class="collection">
  <div class="main">
    <def:datafieldcontrol runat="server" id="C1b" DatabaseField="C1b"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px " FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="C1c" DatabaseField="C1c"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px " FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="C1d" DatabaseField="C1d"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px " FieldTextBoxWidth="40px"></def:datafieldcontrol>
  </div>
  <div class="key"><def:ValueSetLabel ID="ValueSetLabel_C1b" runat="server"  DatabaseField="C1b"></def:ValueSetLabel></div>
</div>
<div class="main">2. Has this child ever...</div>
<div class="collection">
  <div class="main">
    <def:datafieldcontrol runat="server" id="C2a" DatabaseField="C2a"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px " FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="C2b" DatabaseField="C2b"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px " FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="C2c" DatabaseField="C2c"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px " FieldTextBoxWidth="40px"></def:datafieldcontrol>
  </div>
  <div class="key"><def:ValueSetLabel ID="ValueSetLabel_C2a" runat="server"  DatabaseField="C2a"></def:ValueSetLabel></div>
</div>
<div class="main">At what age(s) did this child lose consciousness?</div>
<div class="collection">
  <div class="main"><def:datafieldcontrol runat="server" id="D1y" DatabaseField="D1y"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="200px " FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
  <div class="continue"><def:datafieldcontrol runat="server" id="D1m" DatabaseField="D1m"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="50px " FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
</div>
<div class="collection">
  <div class="main"><def:datafieldcontrol runat="server" id="D2y" DatabaseField="D2y"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="200px " FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
  <div class="continue"><def:datafieldcontrol runat="server" id="D2m" DatabaseField="D2m"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="50px " FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
</div>
<div class="collection">
  <div class="main"><def:datafieldcontrol runat="server" id="D3y" DatabaseField="D3y"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="200px " FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
  <div class="continue"><def:datafieldcontrol runat="server" id="D3m" DatabaseField="D3m"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="50px " FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
</div>
<h3>E. Health Issues Update</h3>
<div class="collection">
  <div class="main"><def:datafieldcontrol runat="server" id="E1" DatabaseField="E1"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px " FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
  <div class="key"><def:ValueSetLabel ID="ValueSetLabel_E1" runat="server"  DatabaseField="E1"></def:ValueSetLabel></div>
</div>
<div class="main"><def:datafieldcontrol runat="server" id="E1a" DatabaseField="E1a"  IsEntryField="true" IsDoubleEntryField="false"  FieldLabelWidth="300px " FieldTextBoxWidth="200px" FieldTextBoxMaxLength="50"></def:datafieldcontrol></div>
<div class="collection">
  <div class="indent"><def:datafieldcontrol runat="server" id="E1a1" DatabaseField="E1a1" FieldTextBoxTextDefault="-1" IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px " FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
  <div class="key"><def:ValueSetLabel ID="ValueSetLabel_E1a1" runat="server"  DatabaseField="E1a1"></def:ValueSetLabel></div>
</div>
<div class="main"><def:datafieldcontrol runat="server" id="E1b" DatabaseField="E1b"  IsEntryField="true" IsDoubleEntryField="false"  FieldLabelWidth="300px " FieldTextBoxWidth="200px" FieldTextBoxMaxLength="50"></def:datafieldcontrol></div>
<div class="collection">
  <div class="indent"><def:datafieldcontrol runat="server" id="E1b1" DatabaseField="E1b1" FieldTextBoxTextDefault="-1" IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px " FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
  <div class="key"><def:ValueSetLabel ID="ValueSetLabel_E1b1" runat="server"  DatabaseField="E1b1"></def:ValueSetLabel></div>
</div>
<div class="main"><def:datafieldcontrol runat="server" id="E1c" DatabaseField="E1c"  IsEntryField="true" IsDoubleEntryField="false"  FieldLabelWidth="300px " FieldTextBoxWidth="200px" FieldTextBoxMaxLength="50"></def:datafieldcontrol></div>
<div class="collection">
  <div class="indent"><def:datafieldcontrol runat="server" id="E1c1" DatabaseField="E1c1" FieldTextBoxTextDefault="-1"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px " FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
  <div class="key"><def:ValueSetLabel ID="ValueSetLabel_E1c1" runat="server"  DatabaseField="E1c1"></def:ValueSetLabel></div>
</div>
<div class="collection">
  <div class="main"><def:datafieldcontrol runat="server" id="E2" DatabaseField="E2"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px " FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
  <div class="key"><def:ValueSetLabel ID="ValueSetLabel_E2" runat="server"  DatabaseField="E2"></def:ValueSetLabel></div>
</div>
<table class="main" cellpadding="5" cellspacing="0" border="1">
  <thead>
    <td>Name of Medication</td>
    <td>Reason</td>
    <td>Date Began</td>
    <td>Currently Taking</td>
  </thead>
  <tr>
    <td><def:datafieldcontrol runat="server" id="E2a1" DatabaseField="E2a1"  IsEntryField="true" IsDoubleEntryField="false"  FieldLabelWidth="0px " FieldTextBoxMaxLength="100"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="E2a2" DatabaseField="E2a2"  IsEntryField="true" IsDoubleEntryField="false"  FieldLabelWidth="0px " FieldTextBoxMaxLength="200"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="E2a3" DatabaseField="E2a3"  IsEntryField="true" IsDoubleEntryField="false"  FieldLabelWidth="0px "></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="E2a4" DatabaseField="E2a4"  IsEntryField="true" IsDoubleEntryField="false"  FieldLabelWidth="0px " FieldTextBoxMaxLength="100"></def:datafieldcontrol></td>
  </tr>
  <tr>
    <td><def:datafieldcontrol runat="server" id="E2b1" DatabaseField="E2b1"  IsEntryField="true" IsDoubleEntryField="false"  FieldLabelWidth="0px " FieldTextBoxMaxLength="100"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="E2b2" DatabaseField="E2b2"  IsEntryField="true" IsDoubleEntryField="false"  FieldLabelWidth="0px " FieldTextBoxMaxLength="200"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="E2b3" DatabaseField="E2b3"  IsEntryField="true" IsDoubleEntryField="false"  FieldLabelWidth="0px "></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="E2b4" DatabaseField="E2b4"  IsEntryField="true" IsDoubleEntryField="false"  FieldLabelWidth="0px " FieldTextBoxMaxLength="100"></def:datafieldcontrol></td>
  </tr>
  <tr>
    <td><def:datafieldcontrol runat="server" id="E2c1" DatabaseField="E2c1"  IsEntryField="true" IsDoubleEntryField="false"  FieldLabelWidth="0px " FieldTextBoxMaxLength="100"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="E2c2" DatabaseField="E2c2"  IsEntryField="true" IsDoubleEntryField="false"  FieldLabelWidth="0px " FieldTextBoxMaxLength="200"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="E2c3" DatabaseField="E2c3"  IsEntryField="true" IsDoubleEntryField="false"  FieldLabelWidth="0px "></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="E2c4" DatabaseField="E2c4"  IsEntryField="true" IsDoubleEntryField="false"  FieldLabelWidth="0px " FieldTextBoxMaxLength="100"></def:datafieldcontrol></td>
  </tr>
  <tr>
    <td><def:datafieldcontrol runat="server" id="E2d1" DatabaseField="E2d1"  IsEntryField="true" IsDoubleEntryField="false"  FieldLabelWidth="0px " FieldTextBoxMaxLength="100"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="E2d2" DatabaseField="E2d2"  IsEntryField="true" IsDoubleEntryField="false"  FieldLabelWidth="0px " FieldTextBoxMaxLength="200"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="E2d3" DatabaseField="E2d3"  IsEntryField="true" IsDoubleEntryField="false"  FieldLabelWidth="0px "></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="E2d4" DatabaseField="E2d4"  IsEntryField="true" IsDoubleEntryField="false"  FieldLabelWidth="0px " FieldTextBoxMaxLength="100"></def:datafieldcontrol></td>
  </tr>
  <tr>
    <td><def:datafieldcontrol runat="server" id="E2e1" DatabaseField="E2e1"  IsEntryField="true" IsDoubleEntryField="false"  FieldLabelWidth="0px " FieldTextBoxMaxLength="100"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="E2e2" DatabaseField="E2e2"  IsEntryField="true" IsDoubleEntryField="false"  FieldLabelWidth="0px " FieldTextBoxMaxLength="200"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="E2e3" DatabaseField="E2e3"  IsEntryField="true" IsDoubleEntryField="false"  FieldLabelWidth="0px "></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="E2e4" DatabaseField="E2e4"  IsEntryField="true" IsDoubleEntryField="false"  FieldLabelWidth="0px " FieldTextBoxMaxLength="100"></def:datafieldcontrol></td>
  </tr>
</table>
<div class="main"><br />24. Medical information only for events that have occurred since your child was 4 years old.</div>
<table class="main" cellpadding="5" cellspacing="0" border="1">
  <thead>
    <td>Illness</td>
    <td>Age (years)</td>
    <td>Length of Illness</td>
    <td nowrap>High Fever<br />
    <def:ValueSetLabel ID="ValueSetLabel_24Ia4" runat="server"  DatabaseField="F24Ia4"></def:ValueSetLabel></td>
    <td>Treatment/Aftereffects</td>
  </thead>
  <tr>
    <td><def:datafieldcontrol runat="server" id="F24Ia1" DatabaseField="F24Ia1"  IsEntryField="true" IsDoubleEntryField="false"  FieldLabelWidth="0px " FieldTextBoxMaxLength="100"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="F24Ia2" DatabaseField="F24Ia2"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="0px " FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="F24Ia3" DatabaseField="F24Ia3"  IsEntryField="true" IsDoubleEntryField="false"  FieldLabelWidth="0px " FieldTextBoxMaxLength="100"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="F24Ia4" DatabaseField="F24Ia4"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="0px " FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="F24Ia5" DatabaseField="F24Ia5"  IsEntryField="true" IsDoubleEntryField="false"  FieldLabelWidth="0px " FieldTextBoxMaxLength="500"></def:datafieldcontrol></td>
  </tr>
  <tr>
    <td><def:datafieldcontrol runat="server" id="F24Ib1" DatabaseField="F24Ib1"  IsEntryField="true" IsDoubleEntryField="false"  FieldLabelWidth="0px " FieldTextBoxMaxLength="100"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="F24Ib2" DatabaseField="F24Ib2"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="0px " FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="F24Ib3" DatabaseField="F24Ib3"  IsEntryField="true" IsDoubleEntryField="false"  FieldLabelWidth="0px " FieldTextBoxMaxLength="100"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="F24Ib4" DatabaseField="F24Ib4"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="0px " FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="F24Ib5" DatabaseField="F24Ib5"  IsEntryField="true" IsDoubleEntryField="false"  FieldLabelWidth="0px " FieldTextBoxMaxLength="500"></def:datafieldcontrol></td>
  </tr>
  <tr>
    <td><def:datafieldcontrol runat="server" id="F24Ic1" DatabaseField="F24Ic1"  IsEntryField="true" IsDoubleEntryField="false"  FieldLabelWidth="0px " FieldTextBoxMaxLength="100"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="F24Ic2" DatabaseField="F24Ic2"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="0px " FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="F24Ic3" DatabaseField="F24Ic3"  IsEntryField="true" IsDoubleEntryField="false"  FieldLabelWidth="0px " FieldTextBoxMaxLength="100"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="F24Ic4" DatabaseField="F24Ic4"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="0px " FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="F24Ic5" DatabaseField="F24Ic5"  IsEntryField="true" IsDoubleEntryField="false"  FieldLabelWidth="0px " FieldTextBoxMaxLength="500"></def:datafieldcontrol></td>
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
    <td><def:datafieldcontrol runat="server" id="F24Oa1" DatabaseField="F24Oa1"  IsEntryField="true" IsDoubleEntryField="false"  FieldLabelWidth="0px " FieldTextBoxMaxLength="100"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="F24Oa2" DatabaseField="F24Oa2"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="0px " FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="F24Oa3" DatabaseField="F24Oa3"  IsEntryField="true" IsDoubleEntryField="false"  FieldLabelWidth="0px " FieldTextBoxMaxLength="100"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="F24Oa4" DatabaseField="F24Oa4"  IsEntryField="true" IsDoubleEntryField="false"  FieldLabelWidth="0px " FieldTextBoxMaxLength="500"></def:datafieldcontrol></td>
  </tr>
  <tr>
    <td><def:datafieldcontrol runat="server" id="F24Ob1" DatabaseField="F24Ob1"  IsEntryField="true" IsDoubleEntryField="false"  FieldLabelWidth="0px " FieldTextBoxMaxLength="100"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="F24Ob2" DatabaseField="F24Ob2"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="0px " FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="F24Ob3" DatabaseField="F24Ob3"  IsEntryField="true" IsDoubleEntryField="false"  FieldLabelWidth="0px " FieldTextBoxMaxLength="100"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="F24Ob4" DatabaseField="F24Ob4"  IsEntryField="true" IsDoubleEntryField="false"  FieldLabelWidth="0px " FieldTextBoxMaxLength="500"></def:datafieldcontrol></td>
  </tr>
  <tr>
    <td><def:datafieldcontrol runat="server" id="F24Oc1" DatabaseField="F24Oc1"  IsEntryField="true" IsDoubleEntryField="false"  FieldLabelWidth="0px " FieldTextBoxMaxLength="100"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="F24Oc2" DatabaseField="F24Oc2"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="0px " FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="F24Oc3" DatabaseField="F24Oc3"  IsEntryField="true" IsDoubleEntryField="false"  FieldLabelWidth="0px " FieldTextBoxMaxLength="100"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="F24Oc4" DatabaseField="F24Oc4"  IsEntryField="true" IsDoubleEntryField="false"  FieldLabelWidth="0px " FieldTextBoxMaxLength="500"></def:datafieldcontrol></td>
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
    <td><def:datafieldcontrol runat="server" id="F24Ha1" DatabaseField="F24Ha1"  IsEntryField="true" IsDoubleEntryField="false"  FieldLabelWidth="0px " FieldTextBoxMaxLength="100"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="F24Ha2" DatabaseField="F24Ha2"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="0px " FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="F24Ha3" DatabaseField="F24Ha3"  IsEntryField="true" IsDoubleEntryField="false"  FieldLabelWidth="0px " FieldTextBoxMaxLength="100"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="F24Ha4" DatabaseField="F24Ha4"  IsEntryField="true" IsDoubleEntryField="false"  FieldLabelWidth="0px " FieldTextBoxMaxLength="500"></def:datafieldcontrol></td>
  </tr>
  <tr>
    <td><def:datafieldcontrol runat="server" id="F24Hb1" DatabaseField="F24Hb1"  IsEntryField="true" IsDoubleEntryField="false"  FieldLabelWidth="0px " FieldTextBoxMaxLength="100"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="F24Hb2" DatabaseField="F24Hb2"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="0px " FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="F24Hb3" DatabaseField="F24Hb3"  IsEntryField="true" IsDoubleEntryField="false"  FieldLabelWidth="0px " FieldTextBoxMaxLength="100"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="F24Hb4" DatabaseField="F24Hb4"  IsEntryField="true" IsDoubleEntryField="false"  FieldLabelWidth="0px " FieldTextBoxMaxLength="500"></def:datafieldcontrol></td>
  </tr>
  <tr>
    <td><def:datafieldcontrol runat="server" id="F24Hc1" DatabaseField="F24Hc1"  IsEntryField="true" IsDoubleEntryField="false"  FieldLabelWidth="0px " FieldTextBoxMaxLength="100"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="F24Hc2" DatabaseField="F24Hc2"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="0px " FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="F24Hc3" DatabaseField="F24Hc3"  IsEntryField="true" IsDoubleEntryField="false"  FieldLabelWidth="0px " FieldTextBoxMaxLength="100"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="F24Hc4" DatabaseField="F24Hc4"  IsEntryField="true" IsDoubleEntryField="false"  FieldLabelWidth="0px " FieldTextBoxMaxLength="500"></def:datafieldcontrol></td>
  </tr>
</table>
</asp:panel>
<div class="main">
  <def:datafieldcontrol runat="server" id="created" DatabaseField="created"  IsReadOnly="true" RenderReadOnlyAsDiv="true"   FieldLabelWidth="300px "></def:datafieldcontrol>
  <def:datafieldcontrol runat="server" id="createdBy" DatabaseField="createdBy"  IsReadOnly="true" RenderReadOnlyAsDiv="true"   FieldLabelWidth="300px "></def:datafieldcontrol>
  <def:datafieldcontrol runat="server" id="updated" DatabaseField="updated"  IsReadOnly="true" RenderReadOnlyAsDiv="true"   FieldLabelWidth="300px "></def:datafieldcontrol>
  <def:datafieldcontrol runat="server" id="updatedBy" DatabaseField="updatedBy"  IsReadOnly="true" RenderReadOnlyAsDiv="true"   FieldLabelWidth="300px "></def:datafieldcontrol>
  <def:datafieldcontrol runat="server" id="scored" DatabaseField="scored"  IsReadOnly="true" RenderReadOnlyAsDiv="true"   FieldLabelWidth="300px "></def:datafieldcontrol>
  <def:datafieldcontrol runat="server" id="scoredBy" DatabaseField="scoredBy"  IsReadOnly="true" RenderReadOnlyAsDiv="true"   FieldLabelWidth="300px "></def:datafieldcontrol>
</div>
</asp:Content>
