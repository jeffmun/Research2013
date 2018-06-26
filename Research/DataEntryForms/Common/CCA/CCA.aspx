<%@ Register TagPrefix="def" Namespace="DataEntryFramework3" %> 
<%@ Page language="c#" MasterPageFile="~/UWAC.master"  Title="CCA Data Entry" %>
<asp:Content ID="Content1" ContentPlaceHolderID="oBodyPlaceHolder" runat="server">

<def:dataentrycontroller id="DataEntryController1" runat="server" DatabaseTable="ALL_CCA" >
</def:dataentrycontroller>
<div class="main">
  <def:datafieldcontrol runat="server" id="id" DatabaseField="id" IsInsertField="true" FieldLabelWidth="300px" FieldTextBoxWidth="200" FieldTextBoxMaxLength="15"></def:datafieldcontrol>
  <def:datafieldcontrol runat="server" id="indexnum" DatabaseField="indexnum" IsInsertField="true" FieldTextBoxTextDefault="1" FieldLabelWidth="300px" FieldTextBoxWidth="40"></def:datafieldcontrol>
  <def:datafieldcontrol runat="server" id="ComplDate" DatabaseField="ComplDate" FieldLabelText="Completion Date" IsInsertField="true" FieldLabelWidth="300px"></def:datafieldcontrol>
  <def:datafieldcontrol runat="server" id="RespName" DatabaseField="RespName" FieldLabelText="Respondent Name" IsInsertField="true" FieldLabelWidth="300px" FieldTextBoxWidth="200" FieldTextBoxMaxLength="50"></def:datafieldcontrol>
  <def:datafieldcontrol runat="server" id="CCAcompby" DatabaseField="CCAcompby" FieldLabelText="Informant's relationship to individual" IsInsertField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
  <font color="blue"><def:ValueSetLabel ID="ValueSetLabel_CCAcompby" runat="server"  DatabaseField="CCAcompby"></def:ValueSetLabel></font>
  <def:datafieldcontrol runat="server" id="CCAcompby_txt" DatabaseField="CCAcompby_txt" FieldLabelText="Describe relationship if needed:" IsEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="200px"></def:datafieldcontrol>
  <def:datafieldcontrol runat="server" id="LengthRel" DatabaseField="LengthRel" FieldLabelText="How long have you known this person?" IsInsertField="true" IsInsertValueRequired="false" FieldLabelWidth="300px" FieldTextBoxWidth="200" FieldTextBoxMaxLength="100"></def:datafieldcontrol>
</div>

</div>
<asp:panel id="mainPanel" CssClass="mainPanel" runat="server">
<div class="collection">
  <div class="main">
    <def:datafieldcontrol runat="server" id="Hearing" DatabaseField="Hearing" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="Physical" DatabaseField="Physical" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="Language" DatabaseField="Language" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="Sentence" DatabaseField="Sentence" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40"></def:datafieldcontrol>
  </div>
  <div class="key"><def:ValueSetLabel ID="ValueSetLabel_Hearing" runat="server"  DatabaseField="Hearing"></def:ValueSetLabel></div>  
</div> 
<div class="main"><def:datafieldcontrol runat="server" id="Detail" DatabaseField="Detail" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="150px" FieldTextBoxWidth="400" FieldTextBoxHeight="40" FieldTextBoxTextMode="multiline" FieldTextBoxMaxLength="1000"></def:datafieldcontrol></div>
<div class="legend"><p>Comment boxes are provided as per instruction "If you are really unable to make a judgement, please put an X against that item, and add a comment if you wish."  They may be left blank unless needed.</p></div>
<div class="collection">
  <div class="main">
    <div class="main"><def:datafieldcontrol runat="server" id="CCA01" DatabaseField="CCA01" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="400px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
    <div class="cont"><def:datafieldcontrol runat="server" id="CCA01s" DatabaseField="CCA01s" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxWidth="200px" FieldTextBoxMaxLength="100"></def:datafieldcontrol></div>
    <div class="main"><def:datafieldcontrol runat="server" id="CCA02" DatabaseField="CCA02" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="400px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
    <div class="cont"><def:datafieldcontrol runat="server" id="CCA02s" DatabaseField="CCA02s" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxWidth="200px" FieldTextBoxMaxLength="100"></def:datafieldcontrol></div>
    <div class="main"><def:datafieldcontrol runat="server" id="CCA03" DatabaseField="CCA03" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="400px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
    <div class="cont"><def:datafieldcontrol runat="server" id="CCA03s" DatabaseField="CCA03s" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxWidth="200px" FieldTextBoxMaxLength="100"></def:datafieldcontrol></div>
    <div class="main"><def:datafieldcontrol runat="server" id="CCA04" DatabaseField="CCA04" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="400px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
    <div class="cont"><def:datafieldcontrol runat="server" id="CCA04s" DatabaseField="CCA04s" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxWidth="200px" FieldTextBoxMaxLength="100"></def:datafieldcontrol></div>
    <div class="main"><def:datafieldcontrol runat="server" id="CCA05" DatabaseField="CCA05" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="400px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
    <div class="cont"><def:datafieldcontrol runat="server" id="CCA05s" DatabaseField="CCA05s" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxWidth="200px" FieldTextBoxMaxLength="100"></def:datafieldcontrol></div>
    <div class="main"><def:datafieldcontrol runat="server" id="CCA06" DatabaseField="CCA06" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="400px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
    <div class="cont"><def:datafieldcontrol runat="server" id="CCA06s" DatabaseField="CCA06s" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxWidth="200px" FieldTextBoxMaxLength="100"></def:datafieldcontrol></div>
    <div class="main"><def:datafieldcontrol runat="server" id="CCA07" DatabaseField="CCA07" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="400px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
    <div class="cont"><def:datafieldcontrol runat="server" id="CCA07s" DatabaseField="CCA07s" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxWidth="200px" FieldTextBoxMaxLength="100"></def:datafieldcontrol></div>
    <div class="main"><def:datafieldcontrol runat="server" id="CCA08" DatabaseField="CCA08" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="400px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
    <div class="cont"><def:datafieldcontrol runat="server" id="CCA08s" DatabaseField="CCA08s" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxWidth="200px" FieldTextBoxMaxLength="100"></def:datafieldcontrol></div>
    <div class="main"><def:datafieldcontrol runat="server" id="CCA09" DatabaseField="CCA09" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="400px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
    <div class="cont"><def:datafieldcontrol runat="server" id="CCA09s" DatabaseField="CCA09s" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxWidth="200px" FieldTextBoxMaxLength="100"></def:datafieldcontrol></div>
    <div class="main"><def:datafieldcontrol runat="server" id="CCA10" DatabaseField="CCA10" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="400px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
    <div class="cont"><def:datafieldcontrol runat="server" id="CCA10s" DatabaseField="CCA10s" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxWidth="200px" FieldTextBoxMaxLength="100"></def:datafieldcontrol></div>
    <div class="main"><def:datafieldcontrol runat="server" id="CCA11" DatabaseField="CCA11" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="400px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
    <div class="cont"><def:datafieldcontrol runat="server" id="CCA11s" DatabaseField="CCA11s" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxWidth="200px" FieldTextBoxMaxLength="100"></def:datafieldcontrol></div>
    <div class="main"><def:datafieldcontrol runat="server" id="CCA12" DatabaseField="CCA12" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="400px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
    <div class="cont"><def:datafieldcontrol runat="server" id="CCA12s" DatabaseField="CCA12s" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxWidth="200px" FieldTextBoxMaxLength="100"></def:datafieldcontrol></div>
    <div class="main"><def:datafieldcontrol runat="server" id="CCA13" DatabaseField="CCA13" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="400px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
    <div class="cont"><def:datafieldcontrol runat="server" id="CCA13s" DatabaseField="CCA13s" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxWidth="200px" FieldTextBoxMaxLength="100"></def:datafieldcontrol></div>
    <div class="main"><def:datafieldcontrol runat="server" id="CCA14" DatabaseField="CCA14" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="400px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
    <div class="cont"><def:datafieldcontrol runat="server" id="CCA14s" DatabaseField="CCA14s" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxWidth="200px" FieldTextBoxMaxLength="100"></def:datafieldcontrol></div>
    <div class="main"><def:datafieldcontrol runat="server" id="CCA15" DatabaseField="CCA15" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="400px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
    <div class="cont"><def:datafieldcontrol runat="server" id="CCA15s" DatabaseField="CCA15s" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxWidth="200px" FieldTextBoxMaxLength="100"></def:datafieldcontrol></div>
    <div class="main"><def:datafieldcontrol runat="server" id="CCA16" DatabaseField="CCA16" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="400px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
    <div class="cont"><def:datafieldcontrol runat="server" id="CCA16s" DatabaseField="CCA16s" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxWidth="200px" FieldTextBoxMaxLength="100"></def:datafieldcontrol></div>
    <div class="main"><def:datafieldcontrol runat="server" id="CCA17" DatabaseField="CCA17" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="400px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
    <div class="cont"><def:datafieldcontrol runat="server" id="CCA17s" DatabaseField="CCA17s" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxWidth="200px" FieldTextBoxMaxLength="100"></def:datafieldcontrol></div>
    <div class="main"><def:datafieldcontrol runat="server" id="CCA18" DatabaseField="CCA18" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="400px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
    <div class="cont"><def:datafieldcontrol runat="server" id="CCA18s" DatabaseField="CCA18s" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxWidth="200px" FieldTextBoxMaxLength="100"></def:datafieldcontrol></div>
    <div class="main"><def:datafieldcontrol runat="server" id="CCA19" DatabaseField="CCA19" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="400px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
    <div class="cont"><def:datafieldcontrol runat="server" id="CCA19s" DatabaseField="CCA19s" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxWidth="200px" FieldTextBoxMaxLength="100"></def:datafieldcontrol></div>
  </div>  
  <div class="key"><def:ValueSetLabel ID="ValueSetLabel_CCA01" runat="server"  DatabaseField="CCA01"></def:ValueSetLabel></div>
</div>
<div class="collection">  
  <div class="main">
    <div class="main"><def:datafieldcontrol runat="server" id="CCA20" DatabaseField="CCA20" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="400px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
    <div class="cont"><def:datafieldcontrol runat="server" id="CCA20s" DatabaseField="CCA20s" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxWidth="200px" FieldTextBoxMaxLength="100"></def:datafieldcontrol></div>
    <div class="main"><def:datafieldcontrol runat="server" id="CCA21" DatabaseField="CCA21" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="400px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
    <div class="cont"><def:datafieldcontrol runat="server" id="CCA21s" DatabaseField="CCA21s" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxWidth="200px" FieldTextBoxMaxLength="100"></def:datafieldcontrol></div>
    <div class="main"><def:datafieldcontrol runat="server" id="CCA22" DatabaseField="CCA22" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="400px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
    <div class="cont"><def:datafieldcontrol runat="server" id="CCA22s" DatabaseField="CCA22s" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxWidth="200px" FieldTextBoxMaxLength="100"></def:datafieldcontrol></div>
    <div class="main"><def:datafieldcontrol runat="server" id="CCA23" DatabaseField="CCA23" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="400px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
    <div class="cont"><def:datafieldcontrol runat="server" id="CCA23s" DatabaseField="CCA23s" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxWidth="200px" FieldTextBoxMaxLength="100"></def:datafieldcontrol></div>
    <div class="main"><def:datafieldcontrol runat="server" id="CCA24" DatabaseField="CCA24" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="400px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
    <div class="cont"><def:datafieldcontrol runat="server" id="CCA24s" DatabaseField="CCA24s" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxWidth="200px" FieldTextBoxMaxLength="100"></def:datafieldcontrol></div>
    <div class="main"><def:datafieldcontrol runat="server" id="CCA25" DatabaseField="CCA25" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="400px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
    <div class="cont"><def:datafieldcontrol runat="server" id="CCA25s" DatabaseField="CCA25s" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxWidth="200px" FieldTextBoxMaxLength="100"></def:datafieldcontrol></div>
    <div class="main"><def:datafieldcontrol runat="server" id="CCA26" DatabaseField="CCA26" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="400px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
    <div class="cont"><def:datafieldcontrol runat="server" id="CCA26s" DatabaseField="CCA26s" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxWidth="200px" FieldTextBoxMaxLength="100"></def:datafieldcontrol></div>
    <div class="main"><def:datafieldcontrol runat="server" id="CCA27" DatabaseField="CCA27" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="400px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
    <div class="cont"><def:datafieldcontrol runat="server" id="CCA27s" DatabaseField="CCA27s" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxWidth="200px" FieldTextBoxMaxLength="100"></def:datafieldcontrol></div>
    <div class="main"><def:datafieldcontrol runat="server" id="CCA28" DatabaseField="CCA28" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="400px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
    <div class="cont"><def:datafieldcontrol runat="server" id="CCA28s" DatabaseField="CCA28s" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxWidth="200px" FieldTextBoxMaxLength="100"></def:datafieldcontrol></div>
    <div class="main"><def:datafieldcontrol runat="server" id="CCA29" DatabaseField="CCA29" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="400px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
    <div class="cont"><def:datafieldcontrol runat="server" id="CCA29s" DatabaseField="CCA29s" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxWidth="200px" FieldTextBoxMaxLength="100"></def:datafieldcontrol></div>
    <div class="main"><def:datafieldcontrol runat="server" id="CCA30" DatabaseField="CCA30" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="400px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
    <div class="cont"><def:datafieldcontrol runat="server" id="CCA30s" DatabaseField="CCA30s" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxWidth="200px" FieldTextBoxMaxLength="100"></def:datafieldcontrol></div>
    <div class="main"><def:datafieldcontrol runat="server" id="CCA31" DatabaseField="CCA31" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="400px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
    <div class="cont"><def:datafieldcontrol runat="server" id="CCA31s" DatabaseField="CCA31s" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxWidth="200px" FieldTextBoxMaxLength="100"></def:datafieldcontrol></div>
    <div class="main"><def:datafieldcontrol runat="server" id="CCA32" DatabaseField="CCA32" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="400px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
    <div class="cont"><def:datafieldcontrol runat="server" id="CCA32s" DatabaseField="CCA32s" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxWidth="200px" FieldTextBoxMaxLength="100"></def:datafieldcontrol></div>
    <div class="main"><def:datafieldcontrol runat="server" id="CCA33" DatabaseField="CCA33" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="400px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
    <div class="cont"><def:datafieldcontrol runat="server" id="CCA33s" DatabaseField="CCA33s" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxWidth="200px" FieldTextBoxMaxLength="100"></def:datafieldcontrol></div>
    <div class="main"><def:datafieldcontrol runat="server" id="CCA34" DatabaseField="CCA34" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="400px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
    <div class="cont"><def:datafieldcontrol runat="server" id="CCA34s" DatabaseField="CCA34s" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxWidth="200px" FieldTextBoxMaxLength="100"></def:datafieldcontrol></div>
    <div class="main"><def:datafieldcontrol runat="server" id="CCA35" DatabaseField="CCA35" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="400px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
    <div class="cont"><def:datafieldcontrol runat="server" id="CCA35s" DatabaseField="CCA35s" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxWidth="200px" FieldTextBoxMaxLength="100"></def:datafieldcontrol></div>
    <div class="main"><def:datafieldcontrol runat="server" id="CCA36" DatabaseField="CCA36" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="400px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
    <div class="cont"><def:datafieldcontrol runat="server" id="CCA36s" DatabaseField="CCA36s" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxWidth="200px" FieldTextBoxMaxLength="100"></def:datafieldcontrol></div>
    <div class="main"><def:datafieldcontrol runat="server" id="CCA37" DatabaseField="CCA37" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="400px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
    <div class="cont"><def:datafieldcontrol runat="server" id="CCA37s" DatabaseField="CCA37s" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxWidth="200px" FieldTextBoxMaxLength="100"></def:datafieldcontrol></div>
    <div class="main"><def:datafieldcontrol runat="server" id="CCA38" DatabaseField="CCA38" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="400px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
    <div class="cont"><def:datafieldcontrol runat="server" id="CCA38s" DatabaseField="CCA38s" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxWidth="200px" FieldTextBoxMaxLength="100"></def:datafieldcontrol></div>
    <div class="main"><def:datafieldcontrol runat="server" id="CCA39" DatabaseField="CCA39" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="400px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
    <div class="cont"><def:datafieldcontrol runat="server" id="CCA39s" DatabaseField="CCA39s" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxWidth="200px" FieldTextBoxMaxLength="100"></def:datafieldcontrol></div>
  </div>  
  <div class="key"><def:ValueSetLabel ID="ValueSetLabel_CCA20" runat="server"  DatabaseField="CCA20"></def:ValueSetLabel></div>
</div>
<div class="collection">  
  <div class="main">
    <div class="main"><def:datafieldcontrol runat="server" id="CCA40" DatabaseField="CCA40" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="400px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
    <div class="cont"><def:datafieldcontrol runat="server" id="CCA40s" DatabaseField="CCA40s" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxWidth="200px" FieldTextBoxMaxLength="100"></def:datafieldcontrol></div>
    <div class="main"><def:datafieldcontrol runat="server" id="CCA41" DatabaseField="CCA41" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="400px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
    <div class="cont"><def:datafieldcontrol runat="server" id="CCA41s" DatabaseField="CCA41s" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxWidth="200px" FieldTextBoxMaxLength="100"></def:datafieldcontrol></div>
    <div class="main"><def:datafieldcontrol runat="server" id="CCA42" DatabaseField="CCA42" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="400px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
    <div class="cont"><def:datafieldcontrol runat="server" id="CCA42s" DatabaseField="CCA42s" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxWidth="200px" FieldTextBoxMaxLength="100"></def:datafieldcontrol></div>
    <div class="main"><def:datafieldcontrol runat="server" id="CCA43" DatabaseField="CCA43" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="400px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
    <div class="cont"><def:datafieldcontrol runat="server" id="CCA43s" DatabaseField="CCA43s" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxWidth="200px" FieldTextBoxMaxLength="100"></def:datafieldcontrol></div>
    <div class="main"><def:datafieldcontrol runat="server" id="CCA44" DatabaseField="CCA44" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="400px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
    <div class="cont"><def:datafieldcontrol runat="server" id="CCA44s" DatabaseField="CCA44s" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxWidth="200px" FieldTextBoxMaxLength="100"></def:datafieldcontrol></div>
    <div class="main"><def:datafieldcontrol runat="server" id="CCA45" DatabaseField="CCA45" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="400px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
    <div class="cont"><def:datafieldcontrol runat="server" id="CCA45s" DatabaseField="CCA45s" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxWidth="200px" FieldTextBoxMaxLength="100"></def:datafieldcontrol></div>
    <div class="main"><def:datafieldcontrol runat="server" id="CCA46" DatabaseField="CCA46" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="400px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
    <div class="cont"><def:datafieldcontrol runat="server" id="CCA46s" DatabaseField="CCA46s" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxWidth="200px" FieldTextBoxMaxLength="100"></def:datafieldcontrol></div>
    <div class="main"><def:datafieldcontrol runat="server" id="CCA47" DatabaseField="CCA47" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="400px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
    <div class="cont"><def:datafieldcontrol runat="server" id="CCA47s" DatabaseField="CCA47s" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxWidth="200px" FieldTextBoxMaxLength="100"></def:datafieldcontrol></div>
    <div class="main"><def:datafieldcontrol runat="server" id="CCA48" DatabaseField="CCA48" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="400px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
    <div class="cont"><def:datafieldcontrol runat="server" id="CCA48s" DatabaseField="CCA48s" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxWidth="200px" FieldTextBoxMaxLength="100"></def:datafieldcontrol></div>
    <div class="main"><def:datafieldcontrol runat="server" id="CCA49" DatabaseField="CCA49" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="400px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
    <div class="cont"><def:datafieldcontrol runat="server" id="CCA49s" DatabaseField="CCA49s" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxWidth="200px" FieldTextBoxMaxLength="100"></def:datafieldcontrol></div>
    <div class="main"><def:datafieldcontrol runat="server" id="CCA50" DatabaseField="CCA50" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="400px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
    <div class="cont"><def:datafieldcontrol runat="server" id="CCA50s" DatabaseField="CCA50s" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxWidth="200px" FieldTextBoxMaxLength="100"></def:datafieldcontrol></div>
    <div class="main"><def:datafieldcontrol runat="server" id="CCA51" DatabaseField="CCA51" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="400px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
    <div class="cont"><def:datafieldcontrol runat="server" id="CCA51s" DatabaseField="CCA51s" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxWidth="200px" FieldTextBoxMaxLength="100"></def:datafieldcontrol></div>
    <div class="main"><def:datafieldcontrol runat="server" id="CCA52" DatabaseField="CCA52" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="400px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
    <div class="cont"><def:datafieldcontrol runat="server" id="CCA52s" DatabaseField="CCA52s" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxWidth="200px" FieldTextBoxMaxLength="100"></def:datafieldcontrol></div>
    <div class="main"><def:datafieldcontrol runat="server" id="CCA53" DatabaseField="CCA53" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="400px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
    <div class="cont"><def:datafieldcontrol runat="server" id="CCA53s" DatabaseField="CCA53s" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxWidth="200px" FieldTextBoxMaxLength="100"></def:datafieldcontrol></div>
    <div class="main"><def:datafieldcontrol runat="server" id="CCA54" DatabaseField="CCA54" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="400px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
    <div class="cont"><def:datafieldcontrol runat="server" id="CCA54s" DatabaseField="CCA54s" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxWidth="200px" FieldTextBoxMaxLength="100"></def:datafieldcontrol></div>
    <div class="main"><def:datafieldcontrol runat="server" id="CCA55" DatabaseField="CCA55" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="400px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
    <div class="cont"><def:datafieldcontrol runat="server" id="CCA55s" DatabaseField="CCA55s" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxWidth="200px" FieldTextBoxMaxLength="100"></def:datafieldcontrol></div>
    <div class="main"><def:datafieldcontrol runat="server" id="CCA56" DatabaseField="CCA56" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="400px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
    <div class="cont"><def:datafieldcontrol runat="server" id="CCA56s" DatabaseField="CCA56s" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxWidth="200px" FieldTextBoxMaxLength="100"></def:datafieldcontrol></div>
    <div class="main"><def:datafieldcontrol runat="server" id="CCA57" DatabaseField="CCA57" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="400px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
    <div class="cont"><def:datafieldcontrol runat="server" id="CCA57s" DatabaseField="CCA57s" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxWidth="200px" FieldTextBoxMaxLength="100"></def:datafieldcontrol></div>
    <div class="main"><def:datafieldcontrol runat="server" id="CCA58" DatabaseField="CCA58" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="400px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
    <div class="cont"><def:datafieldcontrol runat="server" id="CCA58s" DatabaseField="CCA58s" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxWidth="200px" FieldTextBoxMaxLength="100"></def:datafieldcontrol></div>
    <div class="main"><def:datafieldcontrol runat="server" id="CCA59" DatabaseField="CCA59" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="400px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
    <div class="cont"><def:datafieldcontrol runat="server" id="CCA59s" DatabaseField="CCA59s" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxWidth="200px" FieldTextBoxMaxLength="100"></def:datafieldcontrol></div>
  </div>  
  <div class="key"><def:ValueSetLabel ID="ValueSetLabel_CCA40" runat="server"  DatabaseField="CCA40"></def:ValueSetLabel></div>
</div>
<div class="collection">  
  <div class="main">
    <div class="main"><def:datafieldcontrol runat="server" id="CCA60" DatabaseField="CCA60" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="400px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
    <div class="cont"><def:datafieldcontrol runat="server" id="CCA60s" DatabaseField="CCA60s" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxWidth="200px" FieldTextBoxMaxLength="100"></def:datafieldcontrol></div>
    <div class="main"><def:datafieldcontrol runat="server" id="CCA61" DatabaseField="CCA61" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="400px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
    <div class="cont"><def:datafieldcontrol runat="server" id="CCA61s" DatabaseField="CCA61s" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxWidth="200px" FieldTextBoxMaxLength="100"></def:datafieldcontrol></div>
    <div class="main"><def:datafieldcontrol runat="server" id="CCA62" DatabaseField="CCA62" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="400px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
    <div class="cont"><def:datafieldcontrol runat="server" id="CCA62s" DatabaseField="CCA62s" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxWidth="200px" FieldTextBoxMaxLength="100"></def:datafieldcontrol></div>
    <div class="main"><def:datafieldcontrol runat="server" id="CCA63" DatabaseField="CCA63" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="400px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
    <div class="cont"><def:datafieldcontrol runat="server" id="CCA63s" DatabaseField="CCA63s" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxWidth="200px" FieldTextBoxMaxLength="100"></def:datafieldcontrol></div>
    <div class="main"><def:datafieldcontrol runat="server" id="CCA64" DatabaseField="CCA64" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="400px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
    <div class="cont"><def:datafieldcontrol runat="server" id="CCA64s" DatabaseField="CCA64s" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxWidth="200px" FieldTextBoxMaxLength="100"></def:datafieldcontrol></div>
    <div class="main"><def:datafieldcontrol runat="server" id="CCA65" DatabaseField="CCA65" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="400px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
    <div class="cont"><def:datafieldcontrol runat="server" id="CCA65s" DatabaseField="CCA65s" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxWidth="200px" FieldTextBoxMaxLength="100"></def:datafieldcontrol></div>
    <div class="main"><def:datafieldcontrol runat="server" id="CCA66" DatabaseField="CCA66" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="400px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
    <div class="cont"><def:datafieldcontrol runat="server" id="CCA66s" DatabaseField="CCA66s" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxWidth="200px" FieldTextBoxMaxLength="100"></def:datafieldcontrol></div>
    <div class="main"><def:datafieldcontrol runat="server" id="CCA67" DatabaseField="CCA67" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="400px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
    <div class="cont"><def:datafieldcontrol runat="server" id="CCA67s" DatabaseField="CCA67s" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxWidth="200px" FieldTextBoxMaxLength="100"></def:datafieldcontrol></div>
    <div class="main"><def:datafieldcontrol runat="server" id="CCA68" DatabaseField="CCA68" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="400px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
    <div class="cont"><def:datafieldcontrol runat="server" id="CCA68s" DatabaseField="CCA68s" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxWidth="200px" FieldTextBoxMaxLength="100"></def:datafieldcontrol></div>
    <div class="main"><def:datafieldcontrol runat="server" id="CCA69" DatabaseField="CCA69" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="400px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
    <div class="cont"><def:datafieldcontrol runat="server" id="CCA69s" DatabaseField="CCA69s" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxWidth="200px" FieldTextBoxMaxLength="100"></def:datafieldcontrol></div>
    <div class="main"><def:datafieldcontrol runat="server" id="CCA70" DatabaseField="CCA70" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="400px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
    <div class="cont"><def:datafieldcontrol runat="server" id="CCA70s" DatabaseField="CCA70s" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxWidth="200px" FieldTextBoxMaxLength="100"></def:datafieldcontrol></div>
  </div>
  <div class="key"><def:ValueSetLabel ID="ValueSetLabel_CCA60" runat="server"  DatabaseField="CCA60"></def:ValueSetLabel></div>
</div>
</asp:panel>
<div class="main">
  <def:datafieldcontrol runat="server" id="created" DatabaseField="created" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="300px"></def:datafieldcontrol>
  <def:datafieldcontrol runat="server" id="createdBy" DatabaseField="createdBy" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="300px" FieldTextBoxWidth="200" FieldTextBoxMaxLength="50"></def:datafieldcontrol>
  <def:datafieldcontrol runat="server" id="updated" DatabaseField="updated" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="300px"></def:datafieldcontrol>
  <def:datafieldcontrol runat="server" id="updatedBy" DatabaseField="updatedBy" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="300px" FieldTextBoxWidth="200" FieldTextBoxMaxLength="50"></def:datafieldcontrol>
  <def:datafieldcontrol runat="server" id="scored" DatabaseField="scored" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="300px"></def:datafieldcontrol>
  <def:datafieldcontrol runat="server" id="scoredBy" DatabaseField="scoredBy" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="300px" FieldTextBoxWidth="200" FieldTextBoxMaxLength="50"></def:datafieldcontrol>
</div>
</asp:Content>
