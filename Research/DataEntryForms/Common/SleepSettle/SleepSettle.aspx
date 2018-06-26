<%@ Register TagPrefix="def" Namespace="DataEntryFramework3" %> 
<%@ Page language="c#" MasterPageFile="~/UWAC.master"  Title="SleepSettl Data Entry" %>
<asp:Content ID="Content1" ContentPlaceHolderID="oBodyPlaceHolder" runat="server">

<def:dataentrycontroller id="DataEntryController1" runat="server" DatabaseTable="ALL_SleepSettle" >
</def:dataentrycontroller>
<div class="main">
  <def:datafieldcontrol runat="server" id="id" DatabaseField="id" IsInsertField="true" FieldLabelWidth="300px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="15"></def:datafieldcontrol>
  <def:datafieldcontrol runat="server" id="indexnum" DatabaseField="indexnum" IsInsertField="true" FieldTextBoxTextDefault="1" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
</div>
<asp:panel id="mainPanel" CssClass="mainPanel" runat="server">
<div class="main">1. Over the past week, on average how long did your baby sleep?</div>
<div class="indent">
  <def:datafieldcontrol runat="server" id="ams116w" DatabaseField="ams116w" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
  <def:datafieldcontrol runat="server" id="pms116w" DatabaseField="pms116w" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
  <def:datafieldcontrol runat="server" id="evs116w" DatabaseField="evs116w" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
  <def:datafieldcontrol runat="server" id="nts116w" DatabaseField="nts116w" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
</div>
<div class="main">
  <def:datafieldcontrol runat="server" id="slpdy6w" DatabaseField="slpdy6w" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="500px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
  <def:datafieldcontrol runat="server" id="ntslw6w" DatabaseField="ntslw6w" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="500px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
</div>
<div class="main">4. Over the past week, how long on average did it take you to get your baby to settle at sleep time?</div>
<div class="indent">
  <def:datafieldcontrol runat="server" id="dyset6w" DatabaseField="dyset6w" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
  <def:datafieldcontrol runat="server" id="pmset6w" DatabaseField="pmset6w" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
  <def:datafieldcontrol runat="server" id="ntset6w" DatabaseField="ntset6w" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
</div>
<div class="main">5.</div>
<div class="indent">
  <def:datafieldcontrol runat="server" id="dycry6w" DatabaseField="dycry6w" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="500px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
  <def:datafieldcontrol runat="server" id="pmcry6w" DatabaseField="pmcry6w" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="500px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
  <def:datafieldcontrol runat="server" id="ntcry6w" DatabaseField="ntcry6w" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="500px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
</div> 
<div class="collection">
  <div class="main"><def:datafieldcontrol runat="server" id="condy6w" DatabaseField="condy6w" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
  <div class="key"><def:ValueSetLabel ID="ValueSetLabel_condy6w" runat="server"  DatabaseField="condy6w"></def:ValueSetLabel><br /></div>
</div>
<div class="collection">
  <div class="main"><def:datafieldcontrol runat="server" id="ntatn6w" DatabaseField="ntatn6w" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
  <div class="key"><def:ValueSetLabel ID="ValueSetLabel_ntatn6w" runat="server"  DatabaseField="ntatn6w"></def:ValueSetLabel><br /></div> 
</div>
<div class="main">8. Over the past week how much were you bothered by</div>
<div class="collection">
  <div class="indent">
    <def:datafieldcontrol runat="server" id="setdy6w" DatabaseField="setdy6w" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="amset6w" DatabaseField="amset6w" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="reset6w" DatabaseField="reset6w" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="amlng6w" DatabaseField="amlng6w" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="ntsp6w" DatabaseField="ntsp6w" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="dycra6w" DatabaseField="dycra6w" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="evcra6w" DatabaseField="evcra6w" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="ntcra6w" DatabaseField="ntcra6w" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
  </div>
  <div class="key"><def:ValueSetLabel ID="ValueSetLabel_setdy6w" runat="server"  DatabaseField="setdy6w"></def:ValueSetLabel><br /></div> 
</div>
<div class="collection">
  <div class="main"><def:datafieldcontrol runat="server" id="wkhw6w" DatabaseField="wkhw6w" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="400px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
  <div class="key"><def:ValueSetLabel ID="ValueSetLabel_wkhw6w" runat="server"  DatabaseField="wkhw6w"></def:ValueSetLabel><br /></div>
</div>
<div class="main">10.</div>
<div class="collection">
  <div class="indent">
    <def:datafieldcontrol runat="server" id="conf6w" DatabaseField="conf6w" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="500px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="confp6w" DatabaseField="confp6w" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="500px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
  </div>
  <div class="key"><def:ValueSetLabel ID="ValueSetLabel_conf6w" runat="server"  DatabaseField="conf6w"></def:ValueSetLabel></div>
</div>
<div class="main">11. Over the last week when your baby was unsettled, what do you think caused this?</div>
<div class="collection">
  <div class="indent">
    <def:datafieldcontrol runat="server" id="unshg6w" DatabaseField="unshg6w" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="unspa6w" DatabaseField="unspa6w" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="unsch6w" DatabaseField="unsch6w" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="unsti6w" DatabaseField="unsti6w" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="unssu6w" DatabaseField="unssu6w" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="unsju6w" DatabaseField="unsju6w" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="unswr6w" DatabaseField="unswr6w" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="unsdi6w" DatabaseField="unsdi6w" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="unsot6w" DatabaseField="unsot6w" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
  </div>
  <div class="key"><def:ValueSetLabel ID="ValueSetLabel_unshg6w" runat="server"  DatabaseField="unshg6w"></def:ValueSetLabel></div>
</div>    
<div class="indent"><def:datafieldcontrol runat="server" id="unsod6w" DatabaseField="unsod6w" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="300px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="200"></def:datafieldcontrol></div>
<div class="main"><def:datafieldcontrol runat="server" id="spoth6w" DatabaseField="spoth6w" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="300px" FieldTextBoxWidth="400px" FieldTextBoxHeight="40px" FieldTextBoxTextMode="multiline" FieldTextBoxMaxLength="500"></def:datafieldcontrol></div>
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
