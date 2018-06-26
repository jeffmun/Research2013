<%@ Register TagPrefix="def" Namespace="DataEntryFramework3" %> 
<%@ Page language="c#" MasterPageFile="~/UWAC.master"  Title="SRS_A Data Entry" %>
<asp:Content ID="Content1" ContentPlaceHolderID="oBodyPlaceHolder" runat="server">

<def:dataentrycontroller id="DataEntryController1" runat="server" DatabaseTable="ALL_SRS_A" >
</def:dataentrycontroller>
<div class="main">
  <def:datafieldcontrol runat="server" id="id" DatabaseField="id"  IsInsertField="true"   FieldLabelWidth="300px "></def:datafieldcontrol>
  <def:datafieldcontrol runat="server" id="indexnum" DatabaseField="indexnum"  IsInsertField="true" FieldTextBoxTextDefault="1"  FieldLabelWidth="300px "></def:datafieldcontrol>
  <def:datafieldcontrol runat="server" id="RespName" DatabaseField="RespName" FieldLabelText="Respondent Name" IsInsertField="true"  FieldLabelWidth="300px "></def:datafieldcontrol>
  <def:datafieldcontrol runat="server" id="AdminDate" DatabaseField="AdminDate" FieldLabelText="Administration Date" IsInsertField="true"  FieldLabelWidth="300px "></def:datafieldcontrol>
</div>
<div class="collection">
  <div class="main"><def:datafieldcontrol runat="server" id="RelChild" DatabaseField="RelChild" FieldLabelText="Relationship to Individual" IsInsertField="true"  FieldLabelWidth="300px " FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
  <div class="key"><def:ValueSetLabel ID="ValueSetLabel_RelChild" runat="server"  DatabaseField="RelChild"></def:ValueSetLabel></div>
</div>
<div class="main"><def:datafieldcontrol runat="server" id="RelChildSp" DatabaseField="RelChildSp" FieldLabelText="Specify Other relationship:" IsInsertField="true" IsInsertValueRequired="false" FieldLabelWidth="300px " FieldTextBoxWidth="400px" FieldTextBoxMaxLength="100"></def:datafieldcontrol></div>
<asp:panel id="mainPanel" CssClass="mainPanel" runat="server">
<br />
<div class="collection">
  <div class="main">
    <def:datafieldcontrol runat="server" id="SRS6mo01" DatabaseField="SRS6mo01"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px " FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="SRS6mo02" DatabaseField="SRS6mo02"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px " FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="SRS6mo03" DatabaseField="SRS6mo03"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px " FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="SRS6mo04" DatabaseField="SRS6mo04"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px " FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="SRS6mo05" DatabaseField="SRS6mo05"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px " FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="SRS6mo06" DatabaseField="SRS6mo06"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px " FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="SRS6mo07" DatabaseField="SRS6mo07"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px " FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="SRS6mo08" DatabaseField="SRS6mo08"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px " FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="SRS6mo09" DatabaseField="SRS6mo09"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px " FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="SRS6mo10" DatabaseField="SRS6mo10"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px " FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="SRS6mo11" DatabaseField="SRS6mo11"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px " FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="SRS6mo12" DatabaseField="SRS6mo12"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px " FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="SRS6mo13" DatabaseField="SRS6mo13"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px " FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="SRS6mo14" DatabaseField="SRS6mo14"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px " FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="SRS6mo15" DatabaseField="SRS6mo15"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px " FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="SRS6mo16" DatabaseField="SRS6mo16"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px " FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="SRS6mo17" DatabaseField="SRS6mo17"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px " FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="SRS6mo18" DatabaseField="SRS6mo18"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px " FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="SRS6mo19" DatabaseField="SRS6mo19"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px " FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="SRS6mo20" DatabaseField="SRS6mo20"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px " FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="SRS6mo21" DatabaseField="SRS6mo21"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px " FieldTextBoxWidth="40px"></def:datafieldcontrol>
  </div>
  <div class="key"><def:ValueSetLabel ID="ValueSetLabel_6mo01" runat="server"  DatabaseField="SRS6mo01"></def:ValueSetLabel></div>
</div>
<div class="collection">
  <div class="main">
    <def:datafieldcontrol runat="server" id="SRS6mo22" DatabaseField="SRS6mo22"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px " FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="SRS6mo23" DatabaseField="SRS6mo23"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px " FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="SRS6mo24" DatabaseField="SRS6mo24"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px " FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="SRS6mo25" DatabaseField="SRS6mo25"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px " FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="SRS6mo26" DatabaseField="SRS6mo26"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px " FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="SRS6mo27" DatabaseField="SRS6mo27"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px " FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="SRS6mo28" DatabaseField="SRS6mo28"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px " FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="SRS6mo29" DatabaseField="SRS6mo29"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px " FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="SRS6mo30" DatabaseField="SRS6mo30"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px " FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="SRS6mo31" DatabaseField="SRS6mo31"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px " FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="SRS6mo32" DatabaseField="SRS6mo32"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px " FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="SRS6mo33" DatabaseField="SRS6mo33"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px " FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="SRS6mo34" DatabaseField="SRS6mo34"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px " FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="SRS6mo35" DatabaseField="SRS6mo35"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px " FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="SRS6mo36" DatabaseField="SRS6mo36"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px " FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="SRS6mo37" DatabaseField="SRS6mo37"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px " FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="SRS6mo38" DatabaseField="SRS6mo38"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px " FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="SRS6mo39" DatabaseField="SRS6mo39"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px " FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="SRS6mo40" DatabaseField="SRS6mo40"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px " FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="SRS6mo41" DatabaseField="SRS6mo41"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px " FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="SRS6mo42" DatabaseField="SRS6mo42"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px " FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="SRS6mo43" DatabaseField="SRS6mo43"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px " FieldTextBoxWidth="40px"></def:datafieldcontrol>
  </div>
  <div class="key"><def:ValueSetLabel ID="ValueSetLabel_6mo22" runat="server"  DatabaseField="SRS6mo22"></def:ValueSetLabel></div>
</div>
<div class="collection">
  <div class="main">
    <def:datafieldcontrol runat="server" id="SRS6mo44" DatabaseField="SRS6mo44"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px " FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="SRS6mo45" DatabaseField="SRS6mo45"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px " FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="SRS6mo46" DatabaseField="SRS6mo46"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px " FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="SRS6mo47" DatabaseField="SRS6mo47"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px " FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="SRS6mo48" DatabaseField="SRS6mo48"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px " FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="SRS6mo49" DatabaseField="SRS6mo49"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px " FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="SRS6mo50" DatabaseField="SRS6mo50"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px " FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="SRS6mo51" DatabaseField="SRS6mo51"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px " FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="SRS6mo52" DatabaseField="SRS6mo52"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px " FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="SRS6mo53" DatabaseField="SRS6mo53"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px " FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="SRS6mo54" DatabaseField="SRS6mo54"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px " FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="SRS6mo55" DatabaseField="SRS6mo55"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px " FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="SRS6mo56" DatabaseField="SRS6mo56"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px " FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="SRS6mo57" DatabaseField="SRS6mo57"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px " FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="SRS6mo58" DatabaseField="SRS6mo58"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px " FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="SRS6mo59" DatabaseField="SRS6mo59"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px " FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="SRS6mo60" DatabaseField="SRS6mo60"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px " FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="SRS6mo61" DatabaseField="SRS6mo61"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px " FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="SRS6mo62" DatabaseField="SRS6mo62"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px " FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="SRS6mo63" DatabaseField="SRS6mo63"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px " FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="SRS6mo64" DatabaseField="SRS6mo64"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px " FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="SRS6mo65" DatabaseField="SRS6mo65"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px " FieldTextBoxWidth="40px"></def:datafieldcontrol>
  </div>
  <div class="key"><def:ValueSetLabel ID="ValueSetLabel_6mo44" runat="server"  DatabaseField="SRS6mo44"></def:ValueSetLabel></div>
</div>
<br />
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
