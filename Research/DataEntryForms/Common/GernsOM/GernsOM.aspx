<%@ Register TagPrefix="def" Namespace="DataEntryFramework3" %> 
<%@ Page language="c#" MasterPageFile="~/UWAC.master"  Title="GernsOM Data Entry" %>
<asp:Content ID="Content1" ContentPlaceHolderID="oBodyPlaceHolder" runat="server">

<def:dataentrycontroller id="DataEntryController1" runat="server" DatabaseTable="ALL_GernsOM" >
</def:dataentrycontroller>
<div class="main">
  <def:datafieldcontrol runat="server" id="id" DatabaseField="id" IsInsertField="true" FieldLabelWidth="220px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="15"></def:datafieldcontrol>
  <def:datafieldcontrol runat="server" id="indexnum" DatabaseField="indexnum" IsInsertField="true" FieldTextBoxTextDefault="1" FieldLabelWidth="220px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
  <def:datafieldcontrol runat="server" id="GOMDate" DatabaseField="GOMDate" FieldLabelText="Date Administered" IsInsertField="true" FieldLabelWidth="220px"></def:datafieldcontrol>
</div>
<asp:panel id="mainPanel" CssClass="mainPanel" runat="server">
<h4>At six months</h4>
<div class="collection">
  <div class="main"><def:datafieldcontrol runat="server" id="GOMMonth" DatabaseField="GOMMonth" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="120px" FieldTextBoxWidth="40px" CallOnBlur="GernsOM_onBlur"></def:datafieldcontrol></div>
  <div class="key"><def:datafieldcontrol runat="server" id="GOM6mo" DatabaseField="GOM6mo" IsEntryField="false" IsReadOnly="true" FieldLabelWidth="100px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
</div>
<div class="main"><def:datafieldcontrol runat="server" id="GOM01" DatabaseField="GOM01" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="100px" FieldTextBoxWidth="400px" FieldTextBoxHeight="40px" FieldTextBoxTextMode="multiline" FieldTextBoxMaxLength="500"></def:datafieldcontrol></div>
<div class="collection">
  <div class="main"><def:datafieldcontrol runat="server" id="GOM02" DatabaseField="GOM02" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="220px" FieldTextBoxWidth="40px" CallOnBlur="GernsOM_onBlur"></def:datafieldcontrol></div>
  <div class="key"><def:ValueSetLabel ID="ValueSetLabel_GOM02" runat="server"  DatabaseField="GOM02"></def:ValueSetLabel></div>
</div> 
<div class="collection">
  <div class="indent"><def:datafieldcontrol runat="server" id="GOM03" DatabaseField="GOM03" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="220px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
  <div class="key"><def:ValueSetLabel ID="ValueSetLabel_GOM03" runat="server"  DatabaseField="GOM03"></def:ValueSetLabel></div>
</div>
<div class="collection">
  <div class="indent"><def:datafieldcontrol runat="server" id="GOM04" DatabaseField="GOM04" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="220px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
  <div class="key"><def:ValueSetLabel ID="ValueSetLabel_GOM04" runat="server"  DatabaseField="GOM04"></def:ValueSetLabel></div>
</div>
<div class="collection">
  <div class="main"><def:datafieldcontrol runat="server" id="GOM05" DatabaseField="GOM05" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="220px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
  <div class="key"><def:ValueSetLabel ID="ValueSetLabel_GOM05" runat="server"  DatabaseField="GOM05"></def:ValueSetLabel></div>
</div>
<div class="collection">
  <div class="main"><def:datafieldcontrol runat="server" id="GOM06" DatabaseField="GOM06" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="220px" FieldTextBoxWidth="40px" CallOnBlur="GernsOM_onBlur"></def:datafieldcontrol></div>
  <div class="key"><def:ValueSetLabel ID="ValueSetLabel_GOM06" runat="server"  DatabaseField="GOM06"></def:ValueSetLabel></div>
</div>
<div class="collection">
  <div class="indent"><def:datafieldcontrol runat="server" id="GOM07" DatabaseField="GOM07" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="220px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
  <div class="key"><def:ValueSetLabel ID="ValueSetLabel_GOM07" runat="server"  DatabaseField="GOM07"></def:ValueSetLabel></div>
</div>
<div class="collection">
  <div class="main"><def:datafieldcontrol runat="server" id="GOM08" DatabaseField="GOM08" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="220px" FieldTextBoxWidth="40px" CallOnBlur="GernsOM_onBlur"></def:datafieldcontrol></div>
  <div class="key"><def:ValueSetLabel ID="ValueSetLabel_GOM08" runat="server"  DatabaseField="GOM08"></def:ValueSetLabel></div>
</div>
<div class="collection">
  <div class="indent"><def:datafieldcontrol runat="server" id="GOM09" DatabaseField="GOM09" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="220px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
  <div class="key"><def:ValueSetLabel ID="ValueSetLabel_GOM09" runat="server"  DatabaseField="GOM09"></def:ValueSetLabel></div>
</div>
<div class="collection">
  <div class="indent"><def:datafieldcontrol runat="server" id="GOM10" DatabaseField="GOM10" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="220px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
  <div class="key"><def:ValueSetLabel ID="ValueSetLabel_GOM10" runat="server"  DatabaseField="GOM10"></def:ValueSetLabel></div>
</div>
<div class="collection">
  <div class="indent"><def:datafieldcontrol runat="server" id="GOM11" DatabaseField="GOM11" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="220px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
  <div class="key"><def:ValueSetLabel ID="ValueSetLabel_GOM11" runat="server"  DatabaseField="GOM11"></def:ValueSetLabel></div>
</div>
<div class="collection">
  <div class="main"><def:datafieldcontrol runat="server" id="GOM12" DatabaseField="GOM12" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="220px" FieldTextBoxWidth="40px" CallOnBlur="GernsOM_onBlur"></def:datafieldcontrol></div>
  <div class="key"><def:ValueSetLabel ID="ValueSetLabel_GOM12" runat="server"  DatabaseField="GOM12"></def:ValueSetLabel></div>
</div>
<div class="collection">
  <div class="indent"><def:datafieldcontrol runat="server" id="GOM13" DatabaseField="GOM13" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="220px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
  <div class="key"><def:ValueSetLabel ID="ValueSetLabel_GOM13" runat="server"  DatabaseField="GOM13"></def:ValueSetLabel></div>
</div>
<div class="collection">
  <div class="main"><def:datafieldcontrol runat="server" id="GOM14" DatabaseField="GOM14" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="220px" FieldTextBoxWidth="40px" CallOnBlur="GernsOM_onBlur"></def:datafieldcontrol></div>
  <div class="key"><def:ValueSetLabel ID="ValueSetLabel_GOM14" runat="server"  DatabaseField="GOM14"></def:ValueSetLabel></div>
</div>
<div class="collection">
  <div class="indent"><def:datafieldcontrol runat="server" id="GOM15" DatabaseField="GOM15" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="220px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
  <div class="key"><def:ValueSetLabel ID="ValueSetLabel_GOM15" runat="server"  DatabaseField="GOM15"></def:ValueSetLabel></div>
</div>
<h4>At twelve months</h4>
<div class="collection">
  <div class="main"><def:datafieldcontrol runat="server" id="GOM16" DatabaseField="GOM16" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="220px" FieldTextBoxWidth="40px" CallOnBlur="GernsOM_onBlur"></def:datafieldcontrol></div>
  <div class="key"><def:ValueSetLabel ID="ValueSetLabel_GOM16" runat="server"  DatabaseField="GOM16"></def:ValueSetLabel></div>
</div>
<div class="indent"><def:datafieldcontrol runat="server" id="GOM17" DatabaseField="GOM17" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="100px" FieldTextBoxWidth="400px" FieldTextBoxHeight="40px" FieldTextBoxTextMode="multiline" FieldTextBoxMaxLength="500"></def:datafieldcontrol></div>
<div class="collection">
  <div class="indent"><def:datafieldcontrol runat="server" id="GOM18" DatabaseField="GOM18" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="220px" FieldTextBoxWidth="40px" CallOnBlur="GernsOM_onBlur"></def:datafieldcontrol></div>
  <div class="key"><def:ValueSetLabel ID="ValueSetLabel_GOM18" runat="server"  DatabaseField="GOM18"></def:ValueSetLabel></div>
</div>
<div class="indent">
  <div class="collection">
    <div class="indent"><def:datafieldcontrol runat="server" id="GOM19" DatabaseField="GOM19" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="220px" FieldTextBoxWidth="40px" CallOnBlur="GernsOM_onBlur"></def:datafieldcontrol></div>
    <div class="key"><def:ValueSetLabel ID="ValueSetLabel_GOM19" runat="server"  DatabaseField="GOM19"></def:ValueSetLabel></div>
  </div>
</div>
<div class="indent">
  <div class="indent">
    <div class="collection">
      <div class="indent"><def:datafieldcontrol runat="server" id="GOM20" DatabaseField="GOM20" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="220px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
      <div class="key"><def:ValueSetLabel ID="ValueSetLabel_GOM20" runat="server"  DatabaseField="GOM20"></def:ValueSetLabel></div>
    </div>
  </div>
</div>
<div class="indent"><def:datafieldcontrol runat="server" id="GOM21" DatabaseField="GOM21" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="100px" FieldTextBoxWidth="400px" FieldTextBoxHeight="40px" FieldTextBoxTextMode="multiline" FieldTextBoxMaxLength="500"></def:datafieldcontrol></div>
<div class="collection">
  <div class="main"><def:datafieldcontrol runat="server" id="GOM22" DatabaseField="GOM22" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="220px" FieldTextBoxWidth="40px" CallOnBlur="GernsOM_onBlur"></def:datafieldcontrol></div>
  <div class="key"><def:ValueSetLabel ID="ValueSetLabel_GOM22" runat="server"  DatabaseField="GOM22"></def:ValueSetLabel></div>
</div>
<div class="collection">
  <div class="indent"><def:datafieldcontrol runat="server" id="GOM23" DatabaseField="GOM23" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="220px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
  <div class="key"><def:ValueSetLabel ID="ValueSetLabel_GOM23" runat="server"  DatabaseField="GOM23"></def:ValueSetLabel></div>
</div> 
<div class="collection">
  <div class="main"><def:datafieldcontrol runat="server" id="GOM24" DatabaseField="GOM24" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="220px" FieldTextBoxWidth="40px" CallOnBlur="GernsOM_onBlur"></def:datafieldcontrol></div>
  <div class="key"><def:ValueSetLabel ID="ValueSetLabel_GOM24" runat="server"  DatabaseField="GOM24"></def:ValueSetLabel></div>
</div>
<div class="collection">
  <div class="indent"><def:datafieldcontrol runat="server" id="GOM25" DatabaseField="GOM25" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="220px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
  <div class="key"><def:ValueSetLabel ID="ValueSetLabel_GOM25" runat="server"  DatabaseField="GOM25"></def:ValueSetLabel></div>
</div>
<div class="collection">
  <div class="main"><def:datafieldcontrol runat="server" id="GOM26" DatabaseField="GOM26" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="220px" FieldTextBoxWidth="40px" CallOnBlur="GernsOM_onBlur"></def:datafieldcontrol></div>
  <div class="key"><def:ValueSetLabel ID="ValueSetLabel_GOM26" runat="server"  DatabaseField="GOM26"></def:ValueSetLabel></div>
</div>
<div class="collection">
  <div class="indent"><def:datafieldcontrol runat="server" id="GOM27" DatabaseField="GOM27" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="220px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
  <div class="key"><def:ValueSetLabel ID="ValueSetLabel_GOM27" runat="server"  DatabaseField="GOM27"></def:ValueSetLabel></div>
</div>
<div class="collection">
  <div class="indent"><def:datafieldcontrol runat="server" id="GOM28" DatabaseField="GOM28" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="220px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
  <div class="key"><def:ValueSetLabel ID="ValueSetLabel_GOM28" runat="server"  DatabaseField="GOM28"></def:ValueSetLabel></div>
</div>
<div class="collection">
  <div class="main"><def:datafieldcontrol runat="server" id="GOM29" DatabaseField="GOM29" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="220px" FieldTextBoxWidth="40px" CallOnBlur="GernsOM_onBlur"></def:datafieldcontrol></div>
  <div class="key"><def:ValueSetLabel ID="ValueSetLabel_GOM29" runat="server"  DatabaseField="GOM29"></def:ValueSetLabel></div>
</div>
<div class="indent"><def:datafieldcontrol runat="server" id="GOM30" DatabaseField="GOM30" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="220px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="100"></def:datafieldcontrol></div>
<div class="collection">
  <div class="indent"><def:datafieldcontrol runat="server" id="GOM31" DatabaseField="GOM31" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="220px" FieldTextBoxWidth="40px" CallOnBlur="GernsOM_onBlur"></def:datafieldcontrol></div>
  <div class="key"><def:ValueSetLabel ID="ValueSetLabel_GOM31" runat="server"  DatabaseField="GOM31"></def:ValueSetLabel></div>
</div>
<div class="indent">
  <div class="collection">
    <div class="indent"><def:datafieldcontrol runat="server" id="GOM32" DatabaseField="GOM32" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="220px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
    <div class="key"><def:ValueSetLabel ID="ValueSetLabel_GOM32" runat="server"  DatabaseField="GOM32"></def:ValueSetLabel></div>
  </div>
</div>
<div class="collection">
  <div class="indent"><def:datafieldcontrol runat="server" id="GOM33" DatabaseField="GOM33" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="220px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
  <div class="key"><def:ValueSetLabel ID="ValueSetLabel_GOM33" runat="server"  DatabaseField="GOM33"></def:ValueSetLabel></div>
</div>
<div class="collection">
  <div class="main"><def:datafieldcontrol runat="server" id="GOM34" DatabaseField="GOM34" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="220px" FieldTextBoxWidth="40px" CallOnBlur="GernsOM_onBlur"></def:datafieldcontrol></div>
  <div class="key"><def:ValueSetLabel ID="ValueSetLabel_GOM34" runat="server"  DatabaseField="GOM34"></def:ValueSetLabel></div>
</div>
<div class="collection">
  <div class="indent"><def:datafieldcontrol runat="server" id="GOM35" DatabaseField="GOM35" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="220px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
  <div class="key"><def:ValueSetLabel ID="ValueSetLabel_GOM35" runat="server"  DatabaseField="GOM35"></def:ValueSetLabel></div>
</div>
<div class="collection">
  <div class="main"><def:datafieldcontrol runat="server" id="GOM36" DatabaseField="GOM36" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="220px" FieldTextBoxWidth="40px" CallOnBlur="GernsOM_onBlur"></def:datafieldcontrol></div>
  <div class="key"><def:ValueSetLabel ID="ValueSetLabel_GOM36" runat="server"  DatabaseField="GOM36"></def:ValueSetLabel></div>
</div>
<div class="collection">
  <div class="indent"><def:datafieldcontrol runat="server" id="GOM37" DatabaseField="GOM37" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="220px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
  <div class="key"><def:ValueSetLabel ID="ValueSetLabel_GOM37" runat="server"  DatabaseField="GOM37"></def:ValueSetLabel></div>
</div>
<div class="collection">
  <div class="indent"><def:datafieldcontrol runat="server" id="GOM38" DatabaseField="GOM38" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="220px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
  <div class="key"><def:ValueSetLabel ID="ValueSetLabel_GOM38" runat="server"  DatabaseField="GOM38"></def:ValueSetLabel></div>
</div>
<div class="collection">
  <div class="indent"><def:datafieldcontrol runat="server" id="GOM39" DatabaseField="GOM39" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="220px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
  <div class="key"><def:ValueSetLabel ID="ValueSetLabel_GOM39" runat="server"  DatabaseField="GOM39"></def:ValueSetLabel></div>
</div>
<div class="collection">
  <div class="main"><def:datafieldcontrol runat="server" id="GOM40" DatabaseField="GOM40" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="220px" FieldTextBoxWidth="40px" CallOnBlur="GernsOM_onBlur"></def:datafieldcontrol></div>
  <div class="key"><def:ValueSetLabel ID="ValueSetLabel_GOM40" runat="server"  DatabaseField="GOM40"></def:ValueSetLabel></div>
</div>
<div class="collection">
  <div class="indent"><def:datafieldcontrol runat="server" id="GOM41" DatabaseField="GOM41" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="220px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
  <div class="key"><def:ValueSetLabel ID="ValueSetLabel_GOM41" runat="server"  DatabaseField="GOM41"></def:ValueSetLabel></div>
</div>
<div class="main"><def:datafieldcontrol runat="server" id="GOM42" DatabaseField="GOM42" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="100px" FieldTextBoxWidth="400px" FieldTextBoxHeight="40px" FieldTextBoxTextMode="multiline" FieldTextBoxMaxLength="500"></def:datafieldcontrol></div>
<div class="collection">
  <div class="main"><def:datafieldcontrol runat="server" id="GOM43" DatabaseField="GOM43" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="220px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
  <div class="key"><def:ValueSetLabel ID="ValueSetLabel_GOM43" runat="server"  DatabaseField="GOM43"></def:ValueSetLabel></div>
</div>
<div class="collection">
  <div class="main"><def:datafieldcontrol runat="server" id="GOM44" DatabaseField="GOM44" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="220px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
  <div class="key"><def:ValueSetLabel ID="ValueSetLabel_GOM44" runat="server"  DatabaseField="GOM44"></def:ValueSetLabel></div>
</div>
<div class="collection">
  <div class="main"><def:datafieldcontrol runat="server" id="GOM45" DatabaseField="GOM45" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="220px" FieldTextBoxWidth="40px" CallOnBlur="GernsOM_onBlur"></def:datafieldcontrol></div>
  <div class="key"><def:ValueSetLabel ID="ValueSetLabel_GOM45" runat="server"  DatabaseField="GOM45"></def:ValueSetLabel></div>
</div>
<div class="collection">
  <div class="indent"><def:datafieldcontrol runat="server" id="GOM46" DatabaseField="GOM46" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="220px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
  <div class="key"><def:ValueSetLabel ID="ValueSetLabel_GOM46" runat="server"  DatabaseField="GOM46"></def:ValueSetLabel></div>
</div>
<div class="collection">
  <div class="indent"><def:datafieldcontrol runat="server" id="GOM47" DatabaseField="GOM47" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="220px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
  <div class="key"><def:ValueSetLabel ID="ValueSetLabel_GOM47" runat="server"  DatabaseField="GOM47"></def:ValueSetLabel></div>
</div>
<div class="main"><def:datafieldcontrol runat="server" id="GOM48" DatabaseField="GOM48" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="100px" FieldTextBoxWidth="400px" FieldTextBoxHeight="40px" FieldTextBoxTextMode="multiline" FieldTextBoxMaxLength="500"></def:datafieldcontrol></div>
<div class="collection">
  <div class="main"><def:datafieldcontrol runat="server" id="GOM49" DatabaseField="GOM49" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="220px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
  <div class="key"><def:ValueSetLabel ID="ValueSetLabel_GOM49" runat="server"  DatabaseField="GOM49"></def:ValueSetLabel></div>
</div>
<div class="indent"><def:datafieldcontrol runat="server" id="GOM50" DatabaseField="GOM50" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="100px" FieldTextBoxWidth="400px" FieldTextBoxHeight="40px" FieldTextBoxTextMode="multiline" FieldTextBoxMaxLength="500"></def:datafieldcontrol></div>
<div class="indent"><def:datafieldcontrol runat="server" id="GOM51" DatabaseField="GOM51" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="100px" FieldTextBoxWidth="400px" FieldTextBoxHeight="40px" FieldTextBoxTextMode="multiline" FieldTextBoxMaxLength="500"></def:datafieldcontrol></div>
<div class="collection">
  <div class="main"><def:datafieldcontrol runat="server" id="GOM52" DatabaseField="GOM52" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="220px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
  <div class="key"><def:ValueSetLabel ID="ValueSetLabel_GOM52" runat="server"  DatabaseField="GOM52"></def:ValueSetLabel></div>
</div>
<div class="collection">
  <div class="main"><def:datafieldcontrol runat="server" id="GOM53" DatabaseField="GOM53" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="220px" FieldTextBoxWidth="40px" CallOnBlur="GernsOM_onBlur"></def:datafieldcontrol></div>
  <div class="key"><def:ValueSetLabel ID="ValueSetLabel_GOM53" runat="server"  DatabaseField="GOM53"></def:ValueSetLabel></div>
</div>
<div class="collection">
  <div class="indent"><def:datafieldcontrol runat="server" id="GOM54" DatabaseField="GOM54" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="220px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
  <div class="key"><def:ValueSetLabel ID="ValueSetLabel_GOM54" runat="server"  DatabaseField="GOM54"></def:ValueSetLabel></div>
</div>
<div class="collection">
  <div class="main"><def:datafieldcontrol runat="server" id="GOM55" DatabaseField="GOM55" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="220px" FieldTextBoxWidth="40px" CallOnBlur="GernsOM_onBlur"></def:datafieldcontrol></div>
  <div class="key"><def:ValueSetLabel ID="ValueSetLabel_GOM55" runat="server"  DatabaseField="GOM55"></def:ValueSetLabel></div>
</div>
<div class="collection">
  <div class="indent"><def:datafieldcontrol runat="server" id="GOM56" DatabaseField="GOM56" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="220px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
  <div class="key"><def:ValueSetLabel ID="ValueSetLabel_GOM56" runat="server"  DatabaseField="GOM56"></def:ValueSetLabel></div>
</div>
<div class="collection">
  <div class="main"><def:datafieldcontrol runat="server" id="GOM57" DatabaseField="GOM57" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="220px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
  <div class="key"><def:ValueSetLabel ID="ValueSetLabel_GOM57" runat="server"  DatabaseField="GOM57"></def:ValueSetLabel></div>
</div>
<div class="collection">
  <div class="main"><def:datafieldcontrol runat="server" id="GOM58" DatabaseField="GOM58" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="220px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
  <div class="key"><def:ValueSetLabel ID="ValueSetLabel_GOM58" runat="server"  DatabaseField="GOM58"></def:ValueSetLabel></div>
</div>
<div class="collection">
  <div class="main"><def:datafieldcontrol runat="server" id="GOM59" DatabaseField="GOM59" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="220px" FieldTextBoxWidth="40px" CallOnBlur="GernsOM_onBlur"></def:datafieldcontrol></div>
  <div class="key"><def:ValueSetLabel ID="ValueSetLabel_GOM59" runat="server"  DatabaseField="GOM59"></def:ValueSetLabel></div>
</div>
<div class="collection">
  <div class="indent"><def:datafieldcontrol runat="server" id="GOM60" DatabaseField="GOM60" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="220px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
  <div class="key"><def:ValueSetLabel ID="ValueSetLabel_GOM60" runat="server"  DatabaseField="GOM60"></def:ValueSetLabel></div>
</div>
<div class="collection">
  <div class="main"><def:datafieldcontrol runat="server" id="GOM61" DatabaseField="GOM61" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="220px" FieldTextBoxWidth="40px" CallOnBlur="GernsOM_onBlur"></def:datafieldcontrol></div>
  <div class="key"><def:ValueSetLabel ID="ValueSetLabel_GOM61" runat="server"  DatabaseField="GOM61"></def:ValueSetLabel></div>
</div>
<div class="collection">
  <div class="indent"><def:datafieldcontrol runat="server" id="GOM62" DatabaseField="GOM62" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="220px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
  <div class="key"><def:ValueSetLabel ID="ValueSetLabel_GOM62" runat="server"  DatabaseField="GOM62"></def:ValueSetLabel></div>
</div>
<div class="collection">
  <div class="main"><def:datafieldcontrol runat="server" id="GOM63" DatabaseField="GOM63" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="220px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
  <div class="key"><def:ValueSetLabel ID="ValueSetLabel_GOM63" runat="server"  DatabaseField="GOM63"></def:ValueSetLabel></div>
</div>
</asp:panel>
<div class="main">
  <def:datafieldcontrol runat="server" id="created" DatabaseField="created" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="220px"></def:datafieldcontrol>
  <def:datafieldcontrol runat="server" id="createdBy" DatabaseField="createdBy" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="220px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="50"></def:datafieldcontrol>
  <def:datafieldcontrol runat="server" id="updated" DatabaseField="updated" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="220px"></def:datafieldcontrol>
  <def:datafieldcontrol runat="server" id="updatedBy" DatabaseField="updatedBy" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="220px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="50"></def:datafieldcontrol>
  <def:datafieldcontrol runat="server" id="scored" DatabaseField="scored" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="220px"></def:datafieldcontrol>
  <def:datafieldcontrol runat="server" id="scoredBy" DatabaseField="scoredBy" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="220px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="50"></def:datafieldcontrol>
</div>
</asp:Content>
