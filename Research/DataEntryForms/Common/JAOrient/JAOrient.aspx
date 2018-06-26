<%@ Register TagPrefix="def" Namespace="DataEntryFramework3" %> 
<%@ Page language="c#" MasterPageFile="~/UWAC.master"  Title="Joint Attention/Orient Data Entry" %>
<asp:Content ID="Content1" ContentPlaceHolderID="oBodyPlaceHolder" runat="server">
<def:dataentrycontroller id="DataEntryController1" runat="server" DatabaseTable="ALL_JAOrient" >
</def:dataentrycontroller>
<def:datafieldcontrol runat="server" id="id" DatabaseField="id"  IsInsertField="true"   FieldLabelWidth="200px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="indexnum" DatabaseField="indexnum"  IsInsertField="true"   FieldLabelWidth="200px"></def:datafieldcontrol>
<asp:panel id="mainPanel" runat="server">
<table border="0" cellpadding="0" cellspacing="10">
  <tr>
    <td>
      <def:datafieldcontrol runat="server" id="JAOTrained" DatabaseField="JAOTrained"  IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="200px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
    </td>
    <td style="padding-left:10px">
      <def:ValueSetLabel ID="ValueSetLabel_JAOTrained" runat="server"  DatabaseField="JAOTrained"></def:ValueSetLabel>
    </td>
  </tr>
  <tr>
    <td colspan="2">
      <em>Please code 0=No Orient, 1=Orient, -9=Missing Value</em>
    </td>
  </tr>
  <tr>
    <td align="right" style="padding-right:8px">
      <strong>Code</strong>
    </td>
    <td>
      <strong>Notes</strong>
    </td>
  </tr>
  <tr>
    <td>
      <def:datafieldcontrol runat="server" id="JAO1" DatabaseField="JAO1"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="200px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
    </td>
    <td>
      <def:datafieldcontrol runat="server" id="JAO1Notes" DatabaseField="JAO1Notes"  IsEntryField="true" IsDoubleEntryField="false"  FieldLabelWidth="0px"  FieldTextBoxWidth = "400px"></def:datafieldcontrol>
    </td>
  </tr>
  <tr>
    <td>
      <def:datafieldcontrol runat="server" id="JAO2" DatabaseField="JAO2"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="200px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
    </td>
    <td>
      <def:datafieldcontrol runat="server" id="JAO2Notes" DatabaseField="JAO2Notes"  IsEntryField="true" IsDoubleEntryField="false"  FieldLabelWidth="0px"  FieldTextBoxWidth = "400px"></def:datafieldcontrol>
    </td>
  </tr>
  <tr>
    <td>
      <def:datafieldcontrol runat="server" id="JAO3" DatabaseField="JAO3"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="200px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
    </td>
    <td>
      <def:datafieldcontrol runat="server" id="JAO3Notes" DatabaseField="JAO3Notes"  IsEntryField="true" IsDoubleEntryField="false"  FieldLabelWidth="0px"  FieldTextBoxWidth = "400px"></def:datafieldcontrol>
    </td>
  </tr>
  <tr>
   <td>
      <def:datafieldcontrol runat="server" id="JAO4" DatabaseField="JAO4"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="200px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
    </td>
    <td>
      <def:datafieldcontrol runat="server" id="JAO4Notes" DatabaseField="JAO4Notes"  IsEntryField="true" IsDoubleEntryField="false"  FieldLabelWidth="0px"  FieldTextBoxWidth = "400px"></def:datafieldcontrol>
    </td>
  </tr>
  <tr>
    <td>
      <def:datafieldcontrol runat="server" id="JAO5" DatabaseField="JAO5"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="200px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
    </td>
    <td>
      <def:datafieldcontrol runat="server" id="JAO5Notes" DatabaseField="JAO5Notes"  IsEntryField="true" IsDoubleEntryField="false"  FieldLabelWidth="0px"  FieldTextBoxWidth = "400px"></def:datafieldcontrol>
    </td>
  </tr>
  <tr>
    <td>
      <def:datafieldcontrol runat="server" id="JAO6" DatabaseField="JAO6"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="200px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
    </td>
    <td>
      <def:datafieldcontrol runat="server" id="JAO6Notes" DatabaseField="JAO6Notes"  IsEntryField="true" IsDoubleEntryField="false"  FieldLabelWidth="0px"  FieldTextBoxWidth = "400px"></def:datafieldcontrol>
    </td>
  </tr>
  <tr>
    <td>
      <def:datafieldcontrol runat="server" id="JAO7" DatabaseField="JAO7"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="200px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
    </td>
    <td>
      <def:datafieldcontrol runat="server" id="JAO7Notes" DatabaseField="JAO7Notes"  IsEntryField="true" IsDoubleEntryField="false"  FieldLabelWidth="0px"  FieldTextBoxWidth = "400px"></def:datafieldcontrol>
    </td>
  </tr>
  <tr>
    <td>
      <def:datafieldcontrol runat="server" id="JAO8" DatabaseField="JAO8"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="200px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
    </td>
    <td>
      <def:datafieldcontrol runat="server" id="JAO8Notes" DatabaseField="JAO8Notes"  IsEntryField="true" IsDoubleEntryField="false"  FieldLabelWidth="0px"  FieldTextBoxWidth = "400px"></def:datafieldcontrol>
    </td>
  </tr>
  <tr>
    <td>
      <def:datafieldcontrol runat="server" id="JAO9" DatabaseField="JAO9"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="200px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
    </td>
    <td>
      <def:datafieldcontrol runat="server" id="JAO9Notes" DatabaseField="JAO9Notes"  IsEntryField="true" IsDoubleEntryField="false"  FieldLabelWidth="0px"  FieldTextBoxWidth = "400px"></def:datafieldcontrol>
    </td>
  </tr>
  <tr>
    <td>
      <def:datafieldcontrol runat="server" id="JAO10" DatabaseField="JAO10"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="200px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
    </td>
    <td>
      <def:datafieldcontrol runat="server" id="JAO10Notes" DatabaseField="JAO10Notes"  IsEntryField="true" IsDoubleEntryField="false"  FieldLabelWidth="0px"  FieldTextBoxWidth = "400px"></def:datafieldcontrol>
    </td>
  </tr>
  <tr>
    <td>
      <def:datafieldcontrol runat="server" id="JAO11" DatabaseField="JAO11"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="200px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
    </td>
    <td>
      <def:datafieldcontrol runat="server" id="JAO11Notes" DatabaseField="JAO11Notes"  IsEntryField="true" IsDoubleEntryField="false"  FieldLabelWidth="0px"  FieldTextBoxWidth = "400px"></def:datafieldcontrol>
    </td>
  </tr>
  <tr>
    <td>
      <def:datafieldcontrol runat="server" id="JAO12" DatabaseField="JAO12"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="200px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
    </td>
    <td>
      <def:datafieldcontrol runat="server" id="JAO12Notes" DatabaseField="JAO12Notes"  IsEntryField="true" IsDoubleEntryField="false"  FieldLabelWidth="0px"  FieldTextBoxWidth = "400px"></def:datafieldcontrol>
    </td>
  </tr>
</table>
<br />
</asp:panel>
<def:datafieldcontrol runat="server" id="created" DatabaseField="created"  IsReadOnly="true" RenderReadOnlyAsDiv="true"   FieldLabelWidth="200px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="createdBy" DatabaseField="createdBy"  IsReadOnly="true" RenderReadOnlyAsDiv="true"   FieldLabelWidth="200px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="updated" DatabaseField="updated"  IsReadOnly="true" RenderReadOnlyAsDiv="true"   FieldLabelWidth="200px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="updatedBy" DatabaseField="updatedBy"  IsReadOnly="true" RenderReadOnlyAsDiv="true"   FieldLabelWidth="200px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="scored" DatabaseField="scored"  IsReadOnly="true" RenderReadOnlyAsDiv="true"   FieldLabelWidth="200px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="scoredBy" DatabaseField="scoredBy"  IsReadOnly="true" RenderReadOnlyAsDiv="true"   FieldLabelWidth="200px"></def:datafieldcontrol>
</asp:Content>
