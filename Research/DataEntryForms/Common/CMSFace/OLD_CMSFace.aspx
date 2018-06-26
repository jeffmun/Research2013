<%@ Register TagPrefix="def" Namespace="DataEntryFramework3" %> 
<%@ Page language="c#" MasterPageFile="~/UWAC.master"  Title="CMS Faces Data Entry" %>
<asp:Content ID="Content1" ContentPlaceHolderID="oBodyPlaceHolder" runat="server">

<def:dataentrycontroller id="DataEntryController1" runat="server" DatabaseTable="ALL_CMSFace" >
</def:dataentrycontroller>
<div class="main">
  <def:datafieldcontrol runat="server" id="id" DatabaseField="id" IsInsertField="true" FieldLabelWidth="300px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="15"></def:datafieldcontrol>
  <def:datafieldcontrol runat="server" id="indexnum" DatabaseField="indexnum" IsInsertField="true" FieldTextBoxTextDefault="1" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
  <def:datafieldcontrol runat="server" id="FDate" DatabaseField="FDate" FieldLabelText="Date" IsInsertField="true" FieldLabelWidth="300px"></def:datafieldcontrol>
  <def:datafieldcontrol runat="server" id="FInter" DatabaseField="FInter" FieldLabelText="Interviewer" IsInsertField="true" FieldLabelWidth="300px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="50"></def:datafieldcontrol>
</div>
<asp:panel id="mainPanel" CssClass="mainPanel" runat="server"> 
<div class="collection">
  <div class="main">
    <div class="collection">
      <div class="main" style="padding-left:120px">
        <def:ValueSetLabel ID="ValueSetLabel_F101i" runat="server"  DatabaseField="F101i"></def:ValueSetLabel>
      </div>
      <div class="key"><def:ValueSetLabel ID="ValueSetLabel_F101s" runat="server"  DatabaseField="F101s"></def:ValueSetLabel></div>
    </div>
    <div class="collection">
      <div class="main"><def:datafieldcontrol runat="server" id="F101i" DatabaseField="F101i" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="120px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
      <div class="key"><def:datafieldcontrol runat="server" id="F101s" DatabaseField="F101s" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="50px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
    </div> 
    <div class="collection">
      <div class="main"><def:datafieldcontrol runat="server" id="F102i" DatabaseField="F102i" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="120px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
      <div class="key"><def:datafieldcontrol runat="server" id="F102s" DatabaseField="F102s" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="50px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
    </div> 
    <div class="collection">
      <div class="main"><def:datafieldcontrol runat="server" id="F103i" DatabaseField="F103i" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="120px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
      <div class="key"><def:datafieldcontrol runat="server" id="F103s" DatabaseField="F103s" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="50px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
    </div> 
    <div class="collection">
      <div class="main"><def:datafieldcontrol runat="server" id="F104i" DatabaseField="F104i" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="120px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
      <div class="key"><def:datafieldcontrol runat="server" id="F104s" DatabaseField="F104s" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="50px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
    </div> 
    <div class="collection">
      <div class="main"><def:datafieldcontrol runat="server" id="F105i" DatabaseField="F105i" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="120px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
      <div class="key"><def:datafieldcontrol runat="server" id="F105s" DatabaseField="F105s" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="50px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
    </div> 
    <div class="collection">
      <div class="main"><def:datafieldcontrol runat="server" id="F106i" DatabaseField="F106i" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="120px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
      <div class="key"><def:datafieldcontrol runat="server" id="F106s" DatabaseField="F106s" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="50px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
    </div> 
    <div class="collection">
      <div class="main"><def:datafieldcontrol runat="server" id="F107i" DatabaseField="F107i" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="120px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
      <div class="key"><def:datafieldcontrol runat="server" id="F107s" DatabaseField="F107s" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="50px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
    </div> 
    <div class="collection">
      <div class="main"><def:datafieldcontrol runat="server" id="F108i" DatabaseField="F108i" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="120px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
      <div class="key"><def:datafieldcontrol runat="server" id="F108s" DatabaseField="F108s" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="50px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
    </div> 
    <div class="collection">
      <div class="main"><def:datafieldcontrol runat="server" id="F109i" DatabaseField="F109i" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="120px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
      <div class="key"><def:datafieldcontrol runat="server" id="F109s" DatabaseField="F109s" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="50px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
    </div> 
    <div class="collection">
      <div class="main"><def:datafieldcontrol runat="server" id="F110i" DatabaseField="F110i" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="120px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
      <div class="key"><def:datafieldcontrol runat="server" id="F110s" DatabaseField="F110s" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="50px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
    </div> 
    <div class="collection">
      <div class="main"><def:datafieldcontrol runat="server" id="F111i" DatabaseField="F111i" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="120px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
      <div class="key"><def:datafieldcontrol runat="server" id="F111s" DatabaseField="F111s" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="50px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
    </div> 
    <div class="collection">
      <div class="main"><def:datafieldcontrol runat="server" id="F112i" DatabaseField="F112i" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="120px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
      <div class="key"><def:datafieldcontrol runat="server" id="F112s" DatabaseField="F112s" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="50px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
    </div> 
    <div class="collection">
      <div class="main"><def:datafieldcontrol runat="server" id="F113i" DatabaseField="F113i" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="120px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
      <div class="key"><def:datafieldcontrol runat="server" id="F113s" DatabaseField="F113s" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="50px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
    </div> 
    <div class="collection">
      <div class="main"><def:datafieldcontrol runat="server" id="F114i" DatabaseField="F114i" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="120px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
      <div class="key"><def:datafieldcontrol runat="server" id="F114s" DatabaseField="F114s" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="50px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
    </div> 
    <div class="collection">
      <div class="main"><def:datafieldcontrol runat="server" id="F115i" DatabaseField="F115i" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="120px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
      <div class="key"><def:datafieldcontrol runat="server" id="F115s" DatabaseField="F115s" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="50px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
    </div> 
    <div class="collection">
      <div class="main"><def:datafieldcontrol runat="server" id="F116i" DatabaseField="F116i" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="120px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
      <div class="key"><def:datafieldcontrol runat="server" id="F116s" DatabaseField="F116s" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="50px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
    </div> 
    <div class="collection">
      <div class="main"><def:datafieldcontrol runat="server" id="F117i" DatabaseField="F117i" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="120px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
      <div class="key"><def:datafieldcontrol runat="server" id="F117s" DatabaseField="F117s" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="50px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
    </div> 
    <div class="collection">
      <div class="main"><def:datafieldcontrol runat="server" id="F118i" DatabaseField="F118i" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="120px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
      <div class="key"><def:datafieldcontrol runat="server" id="F118s" DatabaseField="F118s" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="50px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
    </div> 
    <div class="collection">
      <div class="main"><def:datafieldcontrol runat="server" id="F119i" DatabaseField="F119i" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="120px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
      <div class="key"><def:datafieldcontrol runat="server" id="F119s" DatabaseField="F119s" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="50px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
    </div> 
    <div class="collection">
      <div class="main"><def:datafieldcontrol runat="server" id="F120i" DatabaseField="F120i" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="120px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
      <div class="key"><def:datafieldcontrol runat="server" id="F120s" DatabaseField="F120s" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="50px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
    </div> 
    <div class="collection">
      <div class="main"><def:datafieldcontrol runat="server" id="F121i" DatabaseField="F121i" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="120px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
      <div class="key"><def:datafieldcontrol runat="server" id="F121s" DatabaseField="F121s" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="50px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
    </div> 
    <div class="collection">
      <div class="main"><def:datafieldcontrol runat="server" id="F122i" DatabaseField="F122i" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="120px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
      <div class="key"><def:datafieldcontrol runat="server" id="F122s" DatabaseField="F122s" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="50px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
    </div> 
    <div class="collection">
      <div class="main"><def:datafieldcontrol runat="server" id="F123i" DatabaseField="F123i" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="120px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
      <div class="key"><def:datafieldcontrol runat="server" id="F123s" DatabaseField="F123s" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="50px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
    </div> 
    <div class="collection">
      <div class="main"><def:datafieldcontrol runat="server" id="F124i" DatabaseField="F124i" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="120px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
      <div class="key"><def:datafieldcontrol runat="server" id="F124s" DatabaseField="F124s" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="50px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
    </div> 
    <div class="collection">
      <div class="main"><def:datafieldcontrol runat="server" id="F125i" DatabaseField="F125i" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="120px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
      <div class="key"><def:datafieldcontrol runat="server" id="F125s" DatabaseField="F125s" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="50px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
    </div> 
    <div class="collection">
      <div class="main"><def:datafieldcontrol runat="server" id="F126i" DatabaseField="F126i" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="120px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
      <div class="key"><def:datafieldcontrol runat="server" id="F126s" DatabaseField="F126s" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="50px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
    </div> 
    <div class="collection">
      <div class="main"><def:datafieldcontrol runat="server" id="F127i" DatabaseField="F127i" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="120px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
      <div class="key"><def:datafieldcontrol runat="server" id="F127s" DatabaseField="F127s" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="50px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
    </div> 
    <div class="collection">
      <div class="main"><def:datafieldcontrol runat="server" id="F128i" DatabaseField="F128i" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="120px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
      <div class="key"><def:datafieldcontrol runat="server" id="F128s" DatabaseField="F128s" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="50px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
    </div> 
    <div class="collection">
      <div class="main"><def:datafieldcontrol runat="server" id="F129i" DatabaseField="F129i" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="120px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
      <div class="key"><def:datafieldcontrol runat="server" id="F129s" DatabaseField="F129s" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="50px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
    </div> 
    <div class="collection">
      <div class="main"><def:datafieldcontrol runat="server" id="F130i" DatabaseField="F130i" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="120px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
      <div class="key"><def:datafieldcontrol runat="server" id="F130s" DatabaseField="F130s" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="50px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
    </div> 
    <div class="collection">
      <div class="main"><def:datafieldcontrol runat="server" id="F131i" DatabaseField="F131i" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="120px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
      <div class="key"><def:datafieldcontrol runat="server" id="F131s" DatabaseField="F131s" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="50px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
    </div> 
    <div class="collection">
      <div class="main"><def:datafieldcontrol runat="server" id="F132i" DatabaseField="F132i" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="120px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
      <div class="key"><def:datafieldcontrol runat="server" id="F132s" DatabaseField="F132s" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="50px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
    </div> 
    <div class="collection">
      <div class="main"><def:datafieldcontrol runat="server" id="F133i" DatabaseField="F133i" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="120px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
      <div class="key"><def:datafieldcontrol runat="server" id="F133s" DatabaseField="F133s" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="50px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
    </div> 
    <div class="collection">
      <div class="main"><def:datafieldcontrol runat="server" id="F134i" DatabaseField="F134i" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="120px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
      <div class="key"><def:datafieldcontrol runat="server" id="F134s" DatabaseField="F134s" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="50px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
    </div> 
    <div class="collection">
      <div class="main"><def:datafieldcontrol runat="server" id="F135i" DatabaseField="F135i" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="120px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
      <div class="key"><def:datafieldcontrol runat="server" id="F135s" DatabaseField="F135s" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="50px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
    </div> 
    <div class="collection">
      <div class="main"><def:datafieldcontrol runat="server" id="F136i" DatabaseField="F136i" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="120px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
      <div class="key"><def:datafieldcontrol runat="server" id="F136s" DatabaseField="F136s" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="50px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
    </div> 
    <div class="main"><def:datafieldcontrol runat="server" id="F1Raw" DatabaseField="F1Raw" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="243px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
    <!-- <div class="main"><def:datafieldcontrol runat="server" id="F1Cal" DatabaseField="F1Cal" IsEntryField="false" IsReadOnly="true" FieldLabelWidth="243px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div> -->
    <div class="main"><def:datafieldcontrol runat="server" id="F1Note" DatabaseField="F1Note" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="100px" FieldTextBoxWidth="300px" FieldTextBoxHeight="57px" FieldTextBoxTextMode="multiline" FieldTextBoxMaxLength="1000"></def:datafieldcontrol></div>
  </div>
  <div class="key">
    <div class="collection">
      <div class="main" style="padding-left:120px">
        <def:ValueSetLabel ID="ValueSetLabel1" runat="server"  DatabaseField="F101i"></def:ValueSetLabel>
      </div>
      <div class="key"><def:ValueSetLabel ID="ValueSetLabel2" runat="server"  DatabaseField="F101s"></def:ValueSetLabel></div>
    </div>
    <div class="collection">
      <div class="main"><def:datafieldcontrol runat="server" id="F201i" DatabaseField="F201i" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="120px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
      <div class="key"><def:datafieldcontrol runat="server" id="F201s" DatabaseField="F201s" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="50px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
    </div> 
    <div class="collection">
      <div class="main"><def:datafieldcontrol runat="server" id="F202i" DatabaseField="F202i" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="120px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
      <div class="key"><def:datafieldcontrol runat="server" id="F202s" DatabaseField="F202s" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="50px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
    </div> 
    <div class="collection">
      <div class="main"><def:datafieldcontrol runat="server" id="F203i" DatabaseField="F203i" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="120px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
      <div class="key"><def:datafieldcontrol runat="server" id="F203s" DatabaseField="F203s" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="50px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
    </div> 
    <div class="collection">
      <div class="main"><def:datafieldcontrol runat="server" id="F204i" DatabaseField="F204i" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="120px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
      <div class="key"><def:datafieldcontrol runat="server" id="F204s" DatabaseField="F204s" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="50px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
    </div> 
    <div class="collection">
      <div class="main"><def:datafieldcontrol runat="server" id="F205i" DatabaseField="F205i" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="120px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
      <div class="key"><def:datafieldcontrol runat="server" id="F205s" DatabaseField="F205s" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="50px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
    </div> 
    <div class="collection">
      <div class="main"><def:datafieldcontrol runat="server" id="F206i" DatabaseField="F206i" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="120px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
      <div class="key"><def:datafieldcontrol runat="server" id="F206s" DatabaseField="F206s" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="50px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
    </div> 
    <div class="collection">
      <div class="main"><def:datafieldcontrol runat="server" id="F207i" DatabaseField="F207i" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="120px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
      <div class="key"><def:datafieldcontrol runat="server" id="F207s" DatabaseField="F207s" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="50px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
    </div> 
    <div class="collection">
      <div class="main"><def:datafieldcontrol runat="server" id="F208i" DatabaseField="F208i" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="120px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
      <div class="key"><def:datafieldcontrol runat="server" id="F208s" DatabaseField="F208s" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="50px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
    </div> 
    <div class="collection">
      <div class="main"><def:datafieldcontrol runat="server" id="F209i" DatabaseField="F209i" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="120px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
      <div class="key"><def:datafieldcontrol runat="server" id="F209s" DatabaseField="F209s" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="50px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
    </div> 
    <div class="collection">
      <div class="main"><def:datafieldcontrol runat="server" id="F210i" DatabaseField="F210i" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="120px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
      <div class="key"><def:datafieldcontrol runat="server" id="F210s" DatabaseField="F210s" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="50px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
    </div> 
    <div class="collection">
      <div class="main"><def:datafieldcontrol runat="server" id="F211i" DatabaseField="F211i" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="120px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
      <div class="key"><def:datafieldcontrol runat="server" id="F211s" DatabaseField="F211s" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="50px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
    </div> 
    <div class="collection">
      <div class="main"><def:datafieldcontrol runat="server" id="F212i" DatabaseField="F212i" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="120px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
      <div class="key"><def:datafieldcontrol runat="server" id="F212s" DatabaseField="F212s" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="50px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
    </div> 
    <div class="collection">
      <div class="main"><def:datafieldcontrol runat="server" id="F213i" DatabaseField="F213i" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="120px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
      <div class="key"><def:datafieldcontrol runat="server" id="F213s" DatabaseField="F213s" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="50px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
    </div> 
    <div class="collection">
      <div class="main"><def:datafieldcontrol runat="server" id="F214i" DatabaseField="F214i" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="120px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
      <div class="key"><def:datafieldcontrol runat="server" id="F214s" DatabaseField="F214s" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="50px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
    </div> 
    <div class="collection">
      <div class="main"><def:datafieldcontrol runat="server" id="F215i" DatabaseField="F215i" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="120px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
      <div class="key"><def:datafieldcontrol runat="server" id="F215s" DatabaseField="F215s" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="50px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
    </div> 
    <div class="collection">
      <div class="main"><def:datafieldcontrol runat="server" id="F216i" DatabaseField="F216i" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="120px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
      <div class="key"><def:datafieldcontrol runat="server" id="F216s" DatabaseField="F216s" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="50px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
    </div> 
    <div class="collection">
      <div class="main"><def:datafieldcontrol runat="server" id="F217i" DatabaseField="F217i" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="120px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
      <div class="key"><def:datafieldcontrol runat="server" id="F217s" DatabaseField="F217s" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="50px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
    </div> 
    <div class="collection">
      <div class="main"><def:datafieldcontrol runat="server" id="F218i" DatabaseField="F218i" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="120px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
      <div class="key"><def:datafieldcontrol runat="server" id="F218s" DatabaseField="F218s" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="50px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
    </div> 
    <div class="collection">
      <div class="main"><def:datafieldcontrol runat="server" id="F219i" DatabaseField="F219i" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="120px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
      <div class="key"><def:datafieldcontrol runat="server" id="F219s" DatabaseField="F219s" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="50px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
    </div> 
    <div class="collection">
      <div class="main"><def:datafieldcontrol runat="server" id="F220i" DatabaseField="F220i" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="120px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
      <div class="key"><def:datafieldcontrol runat="server" id="F220s" DatabaseField="F220s" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="50px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
    </div> 
    <div class="collection">
      <div class="main"><def:datafieldcontrol runat="server" id="F221i" DatabaseField="F221i" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="120px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
      <div class="key"><def:datafieldcontrol runat="server" id="F221s" DatabaseField="F221s" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="50px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
    </div> 
    <div class="collection">
      <div class="main"><def:datafieldcontrol runat="server" id="F222i" DatabaseField="F222i" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="120px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
      <div class="key"><def:datafieldcontrol runat="server" id="F222s" DatabaseField="F222s" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="50px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
    </div> 
    <div class="collection">
      <div class="main"><def:datafieldcontrol runat="server" id="F223i" DatabaseField="F223i" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="120px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
      <div class="key"><def:datafieldcontrol runat="server" id="F223s" DatabaseField="F223s" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="50px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
    </div> 
    <div class="collection">
      <div class="main"><def:datafieldcontrol runat="server" id="F224i" DatabaseField="F224i" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="120px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
      <div class="key"><def:datafieldcontrol runat="server" id="F224s" DatabaseField="F224s" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="50px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
    </div> 
    <div class="collection">
      <div class="main"><def:datafieldcontrol runat="server" id="F225i" DatabaseField="F225i" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="120px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
      <div class="key"><def:datafieldcontrol runat="server" id="F225s" DatabaseField="F225s" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="50px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
    </div> 
    <div class="collection">
      <div class="main"><def:datafieldcontrol runat="server" id="F226i" DatabaseField="F226i" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="120px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
      <div class="key"><def:datafieldcontrol runat="server" id="F226s" DatabaseField="F226s" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="50px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
    </div> 
    <div class="collection">
      <div class="main"><def:datafieldcontrol runat="server" id="F227i" DatabaseField="F227i" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="120px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
      <div class="key"><def:datafieldcontrol runat="server" id="F227s" DatabaseField="F227s" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="50px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
    </div> 
    <div class="collection">
      <div class="main"><def:datafieldcontrol runat="server" id="F228i" DatabaseField="F228i" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="120px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
      <div class="key"><def:datafieldcontrol runat="server" id="F228s" DatabaseField="F228s" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="50px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
    </div> 
    <div class="collection">
      <div class="main"><def:datafieldcontrol runat="server" id="F229i" DatabaseField="F229i" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="120px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
      <div class="key"><def:datafieldcontrol runat="server" id="F229s" DatabaseField="F229s" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="50px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
    </div> 
    <div class="collection">
      <div class="main"><def:datafieldcontrol runat="server" id="F230i" DatabaseField="F230i" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="120px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
      <div class="key"><def:datafieldcontrol runat="server" id="F230s" DatabaseField="F230s" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="50px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
    </div> 
    <div class="collection">
      <div class="main"><def:datafieldcontrol runat="server" id="F231i" DatabaseField="F231i" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="120px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
      <div class="key"><def:datafieldcontrol runat="server" id="F231s" DatabaseField="F231s" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="50px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
    </div> 
    <div class="collection">
      <div class="main"><def:datafieldcontrol runat="server" id="F232i" DatabaseField="F232i" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="120px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
      <div class="key"><def:datafieldcontrol runat="server" id="F232s" DatabaseField="F232s" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="50px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
    </div> 
    <div class="collection">
      <div class="main"><def:datafieldcontrol runat="server" id="F233i" DatabaseField="F233i" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="120px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
      <div class="key"><def:datafieldcontrol runat="server" id="F233s" DatabaseField="F233s" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="50px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
    </div> 
    <div class="collection">
      <div class="main"><def:datafieldcontrol runat="server" id="F234i" DatabaseField="F234i" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="120px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
      <div class="key"><def:datafieldcontrol runat="server" id="F234s" DatabaseField="F234s" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="50px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
    </div> 
    <div class="collection">
      <div class="main"><def:datafieldcontrol runat="server" id="F235i" DatabaseField="F235i" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="120px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
      <div class="key"><def:datafieldcontrol runat="server" id="F235s" DatabaseField="F235s" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="50px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
    </div> 
    <div class="collection">
      <div class="main"><def:datafieldcontrol runat="server" id="F236i" DatabaseField="F236i" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="120px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
      <div class="key"><def:datafieldcontrol runat="server" id="F236s" DatabaseField="F236s" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="50px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
    </div> 
    <div class="main"><def:datafieldcontrol runat="server" id="F2Raw" DatabaseField="F2Raw" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="243px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
    <!-- <div class="main"><def:datafieldcontrol runat="server" id="F2Cal" DatabaseField="F2Cal" IsEntryField="false" IsReadOnly="true" FieldLabelWidth="243px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div> -->
    <div class="main"><def:datafieldcontrol runat="server" id="F2Note" DatabaseField="F2Note" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="100px" FieldTextBoxWidth="300px" FieldTextBoxHeight="57px" FieldTextBoxTextMode="multiline" FieldTextBoxMaxLength="1000"></def:datafieldcontrol></div>
  </div>
</div>
<div class="collection">
  <div class="main"><def:datafieldcontrol runat="server" id="Validity" DatabaseField="Validity" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="120px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
  <div class="key"><def:ValueSetLabel ID="ValueSetLabel_Validity" runat="server"  DatabaseField="Validity"></def:ValueSetLabel></div>
</div>
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
