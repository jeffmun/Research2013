<%@ Register TagPrefix="def" Namespace="DataEntryFramework3" %> 
<%@ Page language="c#" MasterPageFile="~/UWAC.master"  Title="DNMS_TAP3 Data Entry" %>
<asp:Content ID="Content1" ContentPlaceHolderID="oBodyPlaceHolder" runat="server">
<def:dataentrycontroller id="DataEntryController1" runat="server" DatabaseTable="ALL_DNMS_TAP3" >
</def:dataentrycontroller>
<def:datafieldcontrol runat="server" id="id" DatabaseField="id"  IsInsertField="true"   FieldLabelWidth="300px "></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="indexnum" DatabaseField="indexnum"  IsInsertField="true"   FieldLabelWidth="300px "></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="TestDate" DatabaseField="dsdate"  IsInsertField="true"  FieldLabelWidth="300px "></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="Experimenter" DatabaseField="dsclin"  IsInsertField="true"  FieldLabelWidth="300px "></def:datafieldcontrol>
<br />
<asp:panel id="mainPanel" runat="server">
<table border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td>
      <def:datafieldcontrol runat="server" id="dscolor" DatabaseField="dscolor"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px "></def:datafieldcontrol>
    </td>
    <td style="padding-left:20px">
      <def:ValueSetLabel ID="ValueSetLabel_dscolor" runat="server"  DatabaseField="dscolor"></def:ValueSetLabel>
    </td>
  </tr>
</table>
<br />
<def:ValueSetLabel ID="ValueSetLabel_ds01" runat="server"  DatabaseField="ds01"></def:ValueSetLabel>
<br />
<table border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td>
      <def:datafieldcontrol runat="server" id="ds01" DatabaseField="ds01"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="40px" FieldTextBoxWidth="50px"></def:datafieldcontrol>
      <def:datafieldcontrol runat="server" id="ds02" DatabaseField="ds02"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="40px" FieldTextBoxWidth="50px"></def:datafieldcontrol>
      <def:datafieldcontrol runat="server" id="ds03" DatabaseField="ds03"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="40px" FieldTextBoxWidth="50px"></def:datafieldcontrol>
      <def:datafieldcontrol runat="server" id="ds04" DatabaseField="ds04"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="40px" FieldTextBoxWidth="50px"></def:datafieldcontrol>
      <def:datafieldcontrol runat="server" id="ds05" DatabaseField="ds05"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="40px" FieldTextBoxWidth="50px"></def:datafieldcontrol>
      <def:datafieldcontrol runat="server" id="ds06" DatabaseField="ds06"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="40px" FieldTextBoxWidth="50px"></def:datafieldcontrol>
      <def:datafieldcontrol runat="server" id="ds07" DatabaseField="ds07"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="40px" FieldTextBoxWidth="50px"></def:datafieldcontrol>
      <def:datafieldcontrol runat="server" id="ds08" DatabaseField="ds08"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="40px" FieldTextBoxWidth="50px"></def:datafieldcontrol>
      <def:datafieldcontrol runat="server" id="ds09" DatabaseField="ds09"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="40px" FieldTextBoxWidth="50px"></def:datafieldcontrol>
      <def:datafieldcontrol runat="server" id="ds10" DatabaseField="ds10"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="40px" FieldTextBoxWidth="50px"></def:datafieldcontrol>
      <def:datafieldcontrol runat="server" id="ds11" DatabaseField="ds11"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="40px" FieldTextBoxWidth="50px"></def:datafieldcontrol>
      <def:datafieldcontrol runat="server" id="ds12" DatabaseField="ds12"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="40px" FieldTextBoxWidth="50px"></def:datafieldcontrol>
      <def:datafieldcontrol runat="server" id="ds13" DatabaseField="ds13"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="40px" FieldTextBoxWidth="50px"></def:datafieldcontrol>
      <def:datafieldcontrol runat="server" id="ds14" DatabaseField="ds14"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="40px" FieldTextBoxWidth="50px"></def:datafieldcontrol>
      <def:datafieldcontrol runat="server" id="ds15" DatabaseField="ds15"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="40px" FieldTextBoxWidth="50px"></def:datafieldcontrol>
      <def:datafieldcontrol runat="server" id="ds16" DatabaseField="ds16"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="40px" FieldTextBoxWidth="50px"></def:datafieldcontrol>
      <def:datafieldcontrol runat="server" id="ds17" DatabaseField="ds17"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="40px" FieldTextBoxWidth="50px"></def:datafieldcontrol>
      <def:datafieldcontrol runat="server" id="ds18" DatabaseField="ds18"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="40px" FieldTextBoxWidth="50px"></def:datafieldcontrol>
    </td>
    <td style="padding-left:50px">
      <def:datafieldcontrol runat="server" id="ds19" DatabaseField="ds19"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="40px" FieldTextBoxWidth="50px"></def:datafieldcontrol>
      <def:datafieldcontrol runat="server" id="ds20" DatabaseField="ds20"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="40px" FieldTextBoxWidth="50px"></def:datafieldcontrol>
      <def:datafieldcontrol runat="server" id="ds21" DatabaseField="ds21"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="40px" FieldTextBoxWidth="50px"></def:datafieldcontrol>
      <def:datafieldcontrol runat="server" id="ds22" DatabaseField="ds22"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="40px" FieldTextBoxWidth="50px"></def:datafieldcontrol>
      <def:datafieldcontrol runat="server" id="ds23" DatabaseField="ds23"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="40px" FieldTextBoxWidth="50px"></def:datafieldcontrol>
      <def:datafieldcontrol runat="server" id="ds24" DatabaseField="ds24"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="40px" FieldTextBoxWidth="50px"></def:datafieldcontrol>
      <def:datafieldcontrol runat="server" id="ds25" DatabaseField="ds25"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="40px" FieldTextBoxWidth="50px"></def:datafieldcontrol>
      <def:datafieldcontrol runat="server" id="ds26" DatabaseField="ds26"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="40px" FieldTextBoxWidth="50px"></def:datafieldcontrol>
      <def:datafieldcontrol runat="server" id="ds27" DatabaseField="ds27"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="40px" FieldTextBoxWidth="50px"></def:datafieldcontrol>
      <def:datafieldcontrol runat="server" id="ds28" DatabaseField="ds28"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="40px" FieldTextBoxWidth="50px"></def:datafieldcontrol>
      <def:datafieldcontrol runat="server" id="ds29" DatabaseField="ds29"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="40px" FieldTextBoxWidth="50px"></def:datafieldcontrol>
      <def:datafieldcontrol runat="server" id="ds30" DatabaseField="ds30"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="40px" FieldTextBoxWidth="50px"></def:datafieldcontrol>
      <def:datafieldcontrol runat="server" id="ds31" DatabaseField="ds31"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="40px" FieldTextBoxWidth="50px"></def:datafieldcontrol>
      <def:datafieldcontrol runat="server" id="ds32" DatabaseField="ds32"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="40px" FieldTextBoxWidth="50px"></def:datafieldcontrol>
      <def:datafieldcontrol runat="server" id="ds33" DatabaseField="ds33"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="40px" FieldTextBoxWidth="50px"></def:datafieldcontrol>
      <def:datafieldcontrol runat="server" id="ds34" DatabaseField="ds34"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="40px" FieldTextBoxWidth="50px"></def:datafieldcontrol>
      <def:datafieldcontrol runat="server" id="ds35" DatabaseField="ds35"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="40px" FieldTextBoxWidth="50px"></def:datafieldcontrol>
      <def:datafieldcontrol runat="server" id="ds36" DatabaseField="ds36"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="40px" FieldTextBoxWidth="50px"></def:datafieldcontrol>
    </td>
    <td style="padding-left:40px">
      <table border="0px" cellpadding="0px" cellspacing="10px">
        <tr>
          <td>
            <def:datafieldcontrol runat="server" id="dsvalid" DatabaseField="dsvalid"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="100px" FieldTextBoxWidth="50px"></def:datafieldcontrol>
          </td>
          <td style="padding-left: 10px">
            <def:ValueSetLabel ID="ValueSetLabel_dsvalid" runat="server"  DatabaseField="dsvalid"></def:ValueSetLabel>
          </td>
        </tr>
        <tr>
          <td>
            <def:datafieldcontrol runat="server" id="dsvalqual" DatabaseField="dsvalqual"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="100px" FieldTextBoxWidth="50px"></def:datafieldcontrol>
          </td>
          <td style="padding-left: 10px">
            <def:ValueSetLabel ID="ValueSetLabel_dsvalqual" runat="server"  DatabaseField="dsvalqual"></def:ValueSetLabel>
          </td>
        </tr>
        <tr>
          <td colspan="2">
            <def:datafieldcontrol runat="server" id="dsvalcomm" DatabaseField="dsvalcomm"  IsEntryField="true" IsDoubleEntryField="false"  FieldLabelWidth="75px" FieldTextBoxWidth = "300px" FieldTextBoxHeight = "100px" FieldTextBoxTextMode="MultiLine"></def:datafieldcontrol>
          </td>
        </tr>
        <tr>
          <td>
            <def:datafieldcontrol runat="server" id="dsnoreach" DatabaseField="dsnoreach"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="100px" FieldTextBoxWidth="50px"></def:datafieldcontrol>
          </td>
          <td style="padding-left: 10px">
            <def:ValueSetLabel ID="ValueSetLabel_dsnoreach" runat="server"  DatabaseField="dsnoreach"></def:ValueSetLabel>
          </td>
        </tr>
        <tr>
          <td colspan="2">
            <def:datafieldcontrol runat="server" id="dsbehcomm" DatabaseField="dsbehcomm"  IsEntryField="true" IsDoubleEntryField="false"  FieldLabelWidth="75px" FieldTextBoxWidth = "300px" FieldTextBoxHeight = "100px" FieldTextBoxTextMode="MultiLine"></def:datafieldcontrol>
          </td>
        </tr>
      </table>
    </td>
  </tr>
</table>
<br />
<hr />
<table border="0px" cellpadding="5px" cellspacing="0px">
  <tr>
    <td>
      <def:datafieldcontrol runat="server" id="dslast" DatabaseField="dslast"   IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="200px"></def:datafieldcontrol>
    </td>
  </tr>
  <tr>
    <td>
      <table border="1px" cellpadding="5px" cellspacing="0px">
        <tr>
          <td>
            &nbsp;
          </td>
          <td>
            # Correct
          </td>
          <td>
            # Trials
          </td>
        </tr>
        <tr>
          <td>
            5 sec delay
          </td>
          <td>
            <def:datafieldcontrol runat="server" id="ds5corr" DatabaseField="ds5corr"   IsReadOnly="true" RenderReadOnlyAsDiv="true"   FieldLabelWidth="0px"></def:datafieldcontrol>
          </td>
          <td>
            <def:datafieldcontrol runat="server" id="ds5trials" DatabaseField="ds5trials"   IsReadOnly="true" RenderReadOnlyAsDiv="true"   FieldLabelWidth="0px"></def:datafieldcontrol>    
          </td>
        </tr>
        <tr>
          <td>
            30 sec delay
          </td>
          <td>
            <def:datafieldcontrol runat="server" id="ds30corr" DatabaseField="ds30corr"   IsReadOnly="true" RenderReadOnlyAsDiv="true"   FieldLabelWidth="0px"></def:datafieldcontrol>    
          </td>
          <td>
            <def:datafieldcontrol runat="server" id="ds30trials" DatabaseField="ds30trials"   IsReadOnly="true" RenderReadOnlyAsDiv="true"   FieldLabelWidth="0px"></def:datafieldcontrol>    
          </td>
        </tr>
      </table>
    </td>
  </tr>
  <tr>
    <td>
      <def:datafieldcontrol runat="server" id="ds5err" DatabaseField="ds5err"   IsReadOnly="true" RenderReadOnlyAsDiv="true"   FieldLabelWidth="200px "></def:datafieldcontrol>
    </td>
  </tr>
  <tr>
    <td>
      <def:datafieldcontrol runat="server" id="dsleft" DatabaseField="dsleft"   IsReadOnly="true" RenderReadOnlyAsDiv="true"   FieldLabelWidth="200px "></def:datafieldcontrol>
    </td>
  </tr>
  <tr>
    <td>
      <def:datafieldcontrol runat="server" id="dstotal" DatabaseField="dstotal"   IsReadOnly="true" RenderReadOnlyAsDiv="true"   FieldLabelWidth="200px "></def:datafieldcontrol>
    </td>
  </tr>
</table>
<br />
</asp:panel>
<def:datafieldcontrol runat="server" id="created" DatabaseField="created"  IsReadOnly="true" RenderReadOnlyAsDiv="true"   FieldLabelWidth="300px "></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="createdBy" DatabaseField="createdBy"  IsReadOnly="true" RenderReadOnlyAsDiv="true"   FieldLabelWidth="300px "></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="updated" DatabaseField="updated"  IsReadOnly="true" RenderReadOnlyAsDiv="true"   FieldLabelWidth="300px "></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="updatedBy" DatabaseField="updatedBy"  IsReadOnly="true" RenderReadOnlyAsDiv="true"   FieldLabelWidth="300px "></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="scored" DatabaseField="scored"  IsReadOnly="true" RenderReadOnlyAsDiv="true"   FieldLabelWidth="300px "></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="scoredBy" DatabaseField="scoredBy"  IsReadOnly="true" RenderReadOnlyAsDiv="true"   FieldLabelWidth="300px "></def:datafieldcontrol>
</asp:Content>
