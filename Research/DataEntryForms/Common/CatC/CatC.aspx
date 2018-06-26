<%@ Register TagPrefix="def" Namespace="DataEntryFramework3" %> 
<%@ Page language="c#" MasterPageFile="~/UWAC.master"  Title="CatC Data Entry" %>
<asp:Content ID="Content1" ContentPlaceHolderID="oBodyPlaceHolder" runat="server">
<def:dataentrycontroller id="DataEntryController1" runat="server" DatabaseTable="ALL_CatC" >
</def:dataentrycontroller>
<def:datafieldcontrol runat="server" id="id" DatabaseField="id"  IsInsertField="true"   FieldLabelWidth="300px "></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="indexnum" DatabaseField="indexnum"  IsInsertField="true"   FieldLabelWidth="300px "></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="timepoint" DatabaseField="timepoint"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px "></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="catcdate" DatabaseField="catcdate"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px "></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="catcclin" DatabaseField="catcclin"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px "></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="catc01cu" DatabaseField="catc01cu"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px "></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="catc01ev" DatabaseField="catc01ev"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px "></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="catc02cu" DatabaseField="catc02cu"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px "></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="catc02ev" DatabaseField="catc02ev"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px "></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="catc03cu" DatabaseField="catc03cu"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px "></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="catc03ev" DatabaseField="catc03ev"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px "></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="catc04cu" DatabaseField="catc04cu"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px "></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="catc04ev" DatabaseField="catc04ev"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px "></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="catc05cu" DatabaseField="catc05cu"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px "></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="catc05ev" DatabaseField="catc05ev"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px "></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="catc06cu" DatabaseField="catc06cu"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px "></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="catc06ev" DatabaseField="catc06ev"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px "></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="catc07cu" DatabaseField="catc07cu"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px "></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="catc07ev" DatabaseField="catc07ev"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px "></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="catc08cu" DatabaseField="catc08cu"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px "></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="catc08ev" DatabaseField="catc08ev"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px "></def:datafieldcontrol>

<br />
<br />
<def:ValueSetLabel ID="ValueSetLabel_catc10" runat="server"  DatabaseField="catc10"></def:ValueSetLabel>

<def:datafieldcontrol runat="server" id="catc10" DatabaseField="catc10"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px "></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="catc11" DatabaseField="catc11"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px "></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="catc12" DatabaseField="catc12"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px "></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="catc13" DatabaseField="catc13"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px "></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="catccmt" DatabaseField="catccmt"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px "></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="validity" DatabaseField="validity"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px "></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="created" DatabaseField="created"  IsReadOnly="true" RenderReadOnlyAsDiv="true"   FieldLabelWidth="300px "></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="createdBy" DatabaseField="createdBy"  IsReadOnly="true" RenderReadOnlyAsDiv="true"   FieldLabelWidth="300px "></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="updated" DatabaseField="updated"  IsReadOnly="true" RenderReadOnlyAsDiv="true"   FieldLabelWidth="300px "></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="updatedBy" DatabaseField="updatedBy"  IsReadOnly="true" RenderReadOnlyAsDiv="true"   FieldLabelWidth="300px "></def:datafieldcontrol>
</asp:Content>
