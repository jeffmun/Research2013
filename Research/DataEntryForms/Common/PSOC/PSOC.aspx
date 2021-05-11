<%@ Register TagPrefix="def" Namespace="DataEntryFramework3" %> 
<%@ Page language="c#" MasterPageFile="~/UWAC.master"  Title="PSOC Data Entry" %>
<asp:Content ID="Content1" ContentPlaceHolderID="oBodyPlaceHolder" runat="server">
<def:dataentrycontroller id="DataEntryController1" runat="server" DatabaseTable="ALL_PSOC" >
</def:dataentrycontroller>
<def:datafieldcontrol runat="server" id="Subject_ID" DatabaseField="id"  IsInsertField="true"   FieldLabelWidth="125px "></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="indexnum" DatabaseField="indexnum"  IsInsertField="true"   FieldLabelWidth="125px "></def:datafieldcontrol>
<table border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td>
      <def:datafieldcontrol runat="server" id="PSOC_Form" DatabaseField="psoc_form"  IsInsertField="true" FieldTextBoxWidth="50px" FieldLabelWidth="125px "></def:datafieldcontrol>
    </td>
    <td>
      <def:ValueSetLabel ID="ValueSetLabel_psoc_form" runat="server"  DatabaseField="psoc_form"></def:ValueSetLabel>
    </td>
  </tr>
</table>
<def:datafieldcontrol runat="server" id="Date_Administered" DatabaseField="psocdate" IsInsertField="true" IsEntryField="true" FieldLabelWidth="125px "></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="Timepoint" DatabaseField="visit" IsInsertField="true" IsEntryField="true" FieldTextBoxWidth="50px" FieldLabelWidth="125px "></def:datafieldcontrol>
<br />
<asp:panel id="mainPanel" runat="server">

    <br />
<def:datafieldcontrol runat="server" id="psocsat" DatabaseField="psocsat"  IsReadOnly="true" RenderReadOnlyAsDiv="true"  FieldTextBoxWidth="50px" FieldLabelWidth="300px "></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="psoceff" DatabaseField="psoceff"  IsReadOnly="true" RenderReadOnlyAsDiv="true"  FieldTextBoxWidth="50px" FieldLabelWidth="300px "></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="psocscrmsg" DatabaseField="psocscrmsg"  IsReadOnly="true" RenderReadOnlyAsDiv="true"   FieldLabelWidth="300px "></def:datafieldcontrol>
<br /><br />

<def:ValueSetLabel ID="ValueSetLabel_psoc01" runat="server"  DatabaseField="psoc01"></def:ValueSetLabel>
<br />
<def:datafieldcontrol runat="server" id="psoc01" DatabaseField="psoc01"  IsEntryField="true" IsDoubleEntryField="true"  FieldTextBoxWidth="50px" FieldLabelWidth="300px "></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="psoc02" DatabaseField="psoc02"  IsEntryField="true" IsDoubleEntryField="true"  FieldTextBoxWidth="50px" FieldLabelWidth="300px "></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="psoc03" DatabaseField="psoc03"  IsEntryField="true" IsDoubleEntryField="true"  FieldTextBoxWidth="50px" FieldLabelWidth="300px "></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="psoc04" DatabaseField="psoc04"  IsEntryField="true" IsDoubleEntryField="true"  FieldTextBoxWidth="50px" FieldLabelWidth="300px "></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="psoc05" DatabaseField="psoc05"  IsEntryField="true" IsDoubleEntryField="true"  FieldTextBoxWidth="50px" FieldLabelWidth="300px "></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="psoc06" DatabaseField="psoc06"  IsEntryField="true" IsDoubleEntryField="true"  FieldTextBoxWidth="50px" FieldLabelWidth="300px "></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="psoc07" DatabaseField="psoc07"  IsEntryField="true" IsDoubleEntryField="true"  FieldTextBoxWidth="50px" FieldLabelWidth="300px "></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="psoc08" DatabaseField="psoc08"  IsEntryField="true" IsDoubleEntryField="true"  FieldTextBoxWidth="50px" FieldLabelWidth="300px "></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="psoc09" DatabaseField="psoc09"  IsEntryField="true" IsDoubleEntryField="true"  FieldTextBoxWidth="50px" FieldLabelWidth="300px "></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="psoc10" DatabaseField="psoc10"  IsEntryField="true" IsDoubleEntryField="true"  FieldTextBoxWidth="50px" FieldLabelWidth="300px "></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="psoc11" DatabaseField="psoc11"  IsEntryField="true" IsDoubleEntryField="true"  FieldTextBoxWidth="50px" FieldLabelWidth="300px "></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="psoc12" DatabaseField="psoc12"  IsEntryField="true" IsDoubleEntryField="true"  FieldTextBoxWidth="50px" FieldLabelWidth="300px "></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="psoc13" DatabaseField="psoc13"  IsEntryField="true" IsDoubleEntryField="true"  FieldTextBoxWidth="50px" FieldLabelWidth="300px "></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="psoc14" DatabaseField="psoc14"  IsEntryField="true" IsDoubleEntryField="true"  FieldTextBoxWidth="50px" FieldLabelWidth="300px "></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="psoc15" DatabaseField="psoc15"  IsEntryField="true" IsDoubleEntryField="true"  FieldTextBoxWidth="50px" FieldLabelWidth="300px "></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="psoc16" DatabaseField="psoc16"  IsEntryField="true" IsDoubleEntryField="true"  FieldTextBoxWidth="50px" FieldLabelWidth="300px "></def:datafieldcontrol>
</asp:panel>
<br />
<def:datafieldcontrol runat="server" id="created" DatabaseField="created"  IsReadOnly="true" RenderReadOnlyAsDiv="true"   FieldLabelWidth="300px "></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="createdBy" DatabaseField="createdBy"  IsReadOnly="true" RenderReadOnlyAsDiv="true"   FieldLabelWidth="300px "></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="updated" DatabaseField="updated"  IsReadOnly="true" RenderReadOnlyAsDiv="true"   FieldLabelWidth="300px "></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="updatedBy" DatabaseField="updatedBy"  IsReadOnly="true" RenderReadOnlyAsDiv="true"   FieldLabelWidth="300px "></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="scored" DatabaseField="scored"  IsReadOnly="true" RenderReadOnlyAsDiv="true"   FieldLabelWidth="300px "></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="scoredBy" DatabaseField="scoredBy"  IsReadOnly="true" RenderReadOnlyAsDiv="true"   FieldLabelWidth="300px "></def:datafieldcontrol>
</asp:Content>
