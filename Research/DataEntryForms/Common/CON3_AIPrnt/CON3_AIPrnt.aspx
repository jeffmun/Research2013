<%@ Register TagPrefix="def" Namespace="DataEntryFramework3" %> 
<%@ Page language="c#" MasterPageFile="~/UWAC.master"  Title="CON3_AIPrn Data Entry" %>
<asp:Content ID="Content1" ContentPlaceHolderID="oBodyPlaceHolder" runat="server">
<def:dataentrycontroller id="DataEntryController1" runat="server" DatabaseTable="ALL_CON3_AIPrnt" >
</def:dataentrycontroller>
<def:datafieldcontrol runat="server" id="id" DatabaseField="id"  IsInsertField="true"   FieldLabelWidth="300px "></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="indexnum" DatabaseField="indexnum"  IsInsertField="true"   FieldLabelWidth="300px "></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="C3AIPDate" DatabaseField="C3AIPDate" FieldLabelText="Date of Administration" IsInsertField="true"  FieldLabelWidth="300px "></def:datafieldcontrol>
<br />
<asp:panel id="mainPanel" runat="server">
<def:ValueSetLabel ID="ValueSetLabel_C3AIP1" runat="server"  DatabaseField="C3AIP1"></def:ValueSetLabel>
<br />
<def:datafieldcontrol runat="server" id="C3AIP1" DatabaseField="C3AIP1"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="60px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="C3AIP2" DatabaseField="C3AIP2"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="60px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="C3AIP3" DatabaseField="C3AIP3"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="60px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="C3AIP4" DatabaseField="C3AIP4"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="60px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="C3AIP5" DatabaseField="C3AIP5"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="60px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="C3AIP6" DatabaseField="C3AIP6"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="60px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="C3AIP7" DatabaseField="C3AIP7"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="60px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="C3AIP8" DatabaseField="C3AIP8"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="60px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="C3AIP9" DatabaseField="C3AIP9"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="60px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="C3AIP10" DatabaseField="C3AIP10"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="60px"></def:datafieldcontrol>
</asp:panel>
<br />
<def:datafieldcontrol runat="server" id="created" DatabaseField="created"  IsReadOnly="true" RenderReadOnlyAsDiv="true"   FieldLabelWidth="300px "></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="createdBy" DatabaseField="createdBy"  IsReadOnly="true" RenderReadOnlyAsDiv="true"   FieldLabelWidth="300px "></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="updated" DatabaseField="updated"  IsReadOnly="true" RenderReadOnlyAsDiv="true"   FieldLabelWidth="300px "></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="updatedBy" DatabaseField="updatedBy"  IsReadOnly="true" RenderReadOnlyAsDiv="true"   FieldLabelWidth="300px "></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="scored" DatabaseField="scored"  IsReadOnly="true" RenderReadOnlyAsDiv="true"   FieldLabelWidth="300px "></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="scoredBy" DatabaseField="scoredBy"  IsReadOnly="true" RenderReadOnlyAsDiv="true"   FieldLabelWidth="300px "></def:datafieldcontrol>
</asp:Content>
