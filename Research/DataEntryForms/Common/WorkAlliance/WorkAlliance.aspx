<%@ Register TagPrefix="def" Namespace="DataEntryFramework3" %> 
<%@ Page language="c#" MasterPageFile="~/UWAC.master"  Title="Working Alliance Data Entry" %>
<asp:Content ID="Content1" ContentPlaceHolderID="oBodyPlaceHolder" runat="server">
<def:dataentrycontroller id="DataEntryController1" runat="server" DatabaseTable="ALL_WorkAlliance" >
</def:dataentrycontroller>
<def:datafieldcontrol runat="server" id="id" DatabaseField="id"  IsInsertField="true"   FieldLabelWidth="200px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="indexnum" DatabaseField="indexnum"  IsInsertField="true"   FieldLabelWidth="200px"></def:datafieldcontrol>
<asp:panel id="mainPanel" runat="server">
<br />
<table border="0" cellpadding="0" cellspacing="0" id="Parent">
  <tr>
    <td style="vertical-align:top">
      <br />    
      <big><strong>Parent Scale</strong></big><br />
      <small><a href="WorkAlliance.aspx#Therapist">Jump to Therapist Scale</a></small><br />
      <br />
      <def:datafieldcontrol runat="server" id="WAPdate" DatabaseField="WAPdate"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="200px" FieldTextBoxWidth="100px" FormatString="{0:d}"></def:datafieldcontrol>
      <def:datafieldcontrol runat="server" id="WAPCTime" DatabaseField="WAPCTime"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="200px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
      <def:datafieldcontrol runat="server" id="WAPRole" DatabaseField="WAPRole"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="200px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
    </td>
    <td vailign="bottom" style="padding-left:20px">
      <def:ValueSetLabel ID="ValueSetLabel_WAPRole" runat="server"  DatabaseField="WAPRole"></def:ValueSetLabel>
    </td>
  </tr>
  <tr>
    <td colspan="2">
      <def:datafieldcontrol runat="server" id="WAPRoleOther" DatabaseField="WAPRoleOther"  IsEntryField="true" IsDoubleEntryField="false"  FieldLabelWidth="200px" FieldTextBoxWidth="300px"></def:datafieldcontrol>
    </td>
  </tr>
</table>
<br />
<table border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td>
      <def:datafieldcontrol runat="server" id="WAPQ1" DatabaseField="WAPQ1"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
      <def:datafieldcontrol runat="server" id="WAPQ2" DatabaseField="WAPQ2"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
      <def:datafieldcontrol runat="server" id="WAPQ3" DatabaseField="WAPQ3"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
      <def:datafieldcontrol runat="server" id="WAPQ4" DatabaseField="WAPQ4"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
      <def:datafieldcontrol runat="server" id="WAPQ5" DatabaseField="WAPQ5"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
      <def:datafieldcontrol runat="server" id="WAPQ6" DatabaseField="WAPQ6"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
      <def:datafieldcontrol runat="server" id="WAPQ7" DatabaseField="WAPQ7"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
      <def:datafieldcontrol runat="server" id="WAPQ8" DatabaseField="WAPQ8"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
      <def:datafieldcontrol runat="server" id="WAPQ9" DatabaseField="WAPQ9"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
      <def:datafieldcontrol runat="server" id="WAPQ10" DatabaseField="WAPQ10"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
      <def:datafieldcontrol runat="server" id="WAPQ11" DatabaseField="WAPQ11"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
      <def:datafieldcontrol runat="server" id="WAPQ12" DatabaseField="WAPQ12"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
      <def:datafieldcontrol runat="server" id="WAPQ13" DatabaseField="WAPQ13"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
      <def:datafieldcontrol runat="server" id="WAPQ14" DatabaseField="WAPQ14"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
      <def:datafieldcontrol runat="server" id="WAPQ15" DatabaseField="WAPQ15"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
      <def:datafieldcontrol runat="server" id="WAPQ16" DatabaseField="WAPQ16"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
      <def:datafieldcontrol runat="server" id="WAPQ17" DatabaseField="WAPQ17"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
      <def:datafieldcontrol runat="server" id="WAPQ18" DatabaseField="WAPQ18"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
    </td>
    <td style="padding-left:20px">
      <def:ValueSetLabel ID="ValueSetLabel_WAPQ1" runat="server"  DatabaseField="WAPQ1"></def:ValueSetLabel>
    </td>
  </tr>
</table>
<br />

<%-- 
<table border="0" cellpadding="0" cellspacing="0" id="Therapist">
  <tr>
    <td style="vertical-align:top">
      <br />
      <big><strong>Therapist Scale</strong></big><br />
      <small><a href="WorkAlliance.aspx#Parent">Jump to Parent Scale</a></small><br />
      <br />
      <def:datafieldcontrol runat="server" id="WATPTime" DatabaseField="WATPTime"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="200px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
      <def:datafieldcontrol runat="server" id="WATCTime" DatabaseField="WATCTime"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="200px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
      <def:datafieldcontrol runat="server" id="WATRole" DatabaseField="WATRole"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="200px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
    </td>
    <td valign="bottom" style="padding-left:20px">
      <def:ValueSetLabel ID="ValueSetLabel_WATRole" runat="server"  DatabaseField="WATRole"></def:ValueSetLabel>
    </td>
  </tr>
  <tr>
    <td colspan="2">
      <def:datafieldcontrol runat="server" id="WATRoleOther" DatabaseField="WATRoleOther"  IsEntryField="true" IsDoubleEntryField="false"  FieldLabelWidth="200px" FieldTextBoxWidth="300px"></def:datafieldcontrol>
    </td>
  </tr>
</table>
<br />

<table border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td>
      <def:datafieldcontrol runat="server" id="WATQ1" DatabaseField="WATQ1"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
      <def:datafieldcontrol runat="server" id="WATQ2" DatabaseField="WATQ2"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
      <def:datafieldcontrol runat="server" id="WATQ3" DatabaseField="WATQ3"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
      <def:datafieldcontrol runat="server" id="WATQ4" DatabaseField="WATQ4"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
      <def:datafieldcontrol runat="server" id="WATQ5" DatabaseField="WATQ5"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
      <def:datafieldcontrol runat="server" id="WATQ6" DatabaseField="WATQ6"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
      <def:datafieldcontrol runat="server" id="WATQ7" DatabaseField="WATQ7"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
      <def:datafieldcontrol runat="server" id="WATQ8" DatabaseField="WATQ8"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
      <def:datafieldcontrol runat="server" id="WATQ9" DatabaseField="WATQ9"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
      <def:datafieldcontrol runat="server" id="WATQ10" DatabaseField="WATQ10"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
      <def:datafieldcontrol runat="server" id="WATQ11" DatabaseField="WATQ11"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
      <def:datafieldcontrol runat="server" id="WATQ12" DatabaseField="WATQ12"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
      <def:datafieldcontrol runat="server" id="WATQ13" DatabaseField="WATQ13"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
      <def:datafieldcontrol runat="server" id="WATQ14" DatabaseField="WATQ14"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
      <def:datafieldcontrol runat="server" id="WATQ15" DatabaseField="WATQ15"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
      <def:datafieldcontrol runat="server" id="WATQ16" DatabaseField="WATQ16"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
    </td>
    <td style="padding-left:20px">
      <def:ValueSetLabel ID="ValueSetLabel_WATQ1" runat="server"  DatabaseField="WATQ1"></def:ValueSetLabel>
    </td>
  </tr>
</table> --%>
<br />
</asp:panel>
<def:datafieldcontrol runat="server" id="created" DatabaseField="created"  IsReadOnly="true" RenderReadOnlyAsDiv="true"   FieldLabelWidth="200px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="createdBy" DatabaseField="createdBy"  IsReadOnly="true" RenderReadOnlyAsDiv="true"   FieldLabelWidth="200px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="updated" DatabaseField="updated"  IsReadOnly="true" RenderReadOnlyAsDiv="true"   FieldLabelWidth="200px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="updatedBy" DatabaseField="updatedBy"  IsReadOnly="true" RenderReadOnlyAsDiv="true"   FieldLabelWidth="200px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="scored" DatabaseField="scored"  IsReadOnly="true" RenderReadOnlyAsDiv="true"   FieldLabelWidth="200px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="scoredBy" DatabaseField="scoredBy"  IsReadOnly="true" RenderReadOnlyAsDiv="true"   FieldLabelWidth="200px"></def:datafieldcontrol>
</asp:Content>
