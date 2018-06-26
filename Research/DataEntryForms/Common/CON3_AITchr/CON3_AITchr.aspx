<%@ Register TagPrefix="def" Namespace="DataEntryFramework3" %> 
<%@ Page language="c#" MasterPageFile="~/UWAC.master"  Title="CON3_AITch Data Entry" %>
<asp:Content ID="Content1" ContentPlaceHolderID="oBodyPlaceHolder" runat="server">
<def:dataentrycontroller id="DataEntryController1" runat="server" DatabaseTable="ALL_CON3_AITchr" >
</def:dataentrycontroller>
<def:datafieldcontrol runat="server" id="id" DatabaseField="id"  IsInsertField="true"   FieldLabelWidth="300px "></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="indexnum" DatabaseField="indexnum"  IsInsertField="true"   FieldLabelWidth="300px "></def:datafieldcontrol>
<br />
<asp:panel id="mainPanel" runat="server">
<def:datafieldcontrol runat="server" id="C3AITTime" DatabaseField="C3AITTime"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px "></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="C3AITClas" DatabaseField="C3AITClas"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="400px" FieldTextBoxMaxLength="100"></def:datafieldcontrol>
<br />
<def:ValueSetLabel ID="ValueSetLabel_C3AIT1" runat="server"  DatabaseField="C3AIT1"></def:ValueSetLabel>
<br />
<def:datafieldcontrol runat="server" id="C3AIT1" DatabaseField="C3AIT1"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="60px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="C3AIT2" DatabaseField="C3AIT2"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="60px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="C3AIT3" DatabaseField="C3AIT3"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="60px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="C3AIT4" DatabaseField="C3AIT4"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="60px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="C3AIT5" DatabaseField="C3AIT5"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="60px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="C3AIT6" DatabaseField="C3AIT6"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="60px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="C3AIT7" DatabaseField="C3AIT7"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="60px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="C3AIT8" DatabaseField="C3AIT8"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="60px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="C3AIT9" DatabaseField="C3AIT9"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="60px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="C3AIT10" DatabaseField="C3AIT10"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="60px"></def:datafieldcontrol>
</asp:panel>
<br />
<def:datafieldcontrol runat="server" id="created" DatabaseField="created"  IsReadOnly="true" RenderReadOnlyAsDiv="true"   FieldLabelWidth="300px "></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="createdBy" DatabaseField="createdBy"  IsReadOnly="true" RenderReadOnlyAsDiv="true"   FieldLabelWidth="300px "></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="updated" DatabaseField="updated"  IsReadOnly="true" RenderReadOnlyAsDiv="true"   FieldLabelWidth="300px "></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="updatedBy" DatabaseField="updatedBy"  IsReadOnly="true" RenderReadOnlyAsDiv="true"   FieldLabelWidth="300px "></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="scored" DatabaseField="scored"  IsReadOnly="true" RenderReadOnlyAsDiv="true"   FieldLabelWidth="300px "></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="scoredBy" DatabaseField="scoredBy"  IsReadOnly="true" RenderReadOnlyAsDiv="true"   FieldLabelWidth="300px "></def:datafieldcontrol>
</asp:Content>
