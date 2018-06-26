<%@ Register TagPrefix="def" Namespace="DataEntryFramework3" %> 
<%@ Page language="c#" MasterPageFile="~/UWAC.master"  Title="ImitSeq Data Entry" %>
<asp:Content ID="Content1" ContentPlaceHolderID="oBodyPlaceHolder" runat="server">
<def:dataentrycontroller id="DataEntryController1" runat="server" DatabaseTable="ALL_ImitSeq" >
</def:dataentrycontroller>
<def:datafieldcontrol runat="server" id="id" DatabaseField="id"  IsInsertField="true"   FieldLabelWidth="300px "></def:datafieldcontrol>

<def:datafieldcontrol runat="server" id="visit" DatabaseField="visit"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px "></def:datafieldcontrol>
<def:ValueSetLabel ID="ValueSetLabel_visit" runat="server"  DatabaseField="visit"></def:ValueSetLabel>
<br />
<def:datafieldcontrol runat="server" id="coder" DatabaseField="coder"   IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px " FieldTextBoxWidth = "100px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="experimenter" DatabaseField="experimenter"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px " FieldTextBoxWidth = "100px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="isdate" DatabaseField="isdate"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px " FieldTextBoxWidth = "100px"></def:datafieldcontrol>
<br />
<br />
<b> Enter the following value codes:
<br />
<def:ValueSetLabel ID="ValueSetLabel_pt1" runat="server"  DatabaseField="pt1"></def:ValueSetLabel>
</b>
<br />
<def:datafieldcontrol runat="server" id="pt1" DatabaseField="pt1"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px " FieldTextBoxWidth = "50px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="bb1" DatabaseField="bb1"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px " FieldTextBoxWidth = "50px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="ch1" DatabaseField="ch1"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px " FieldTextBoxWidth = "50px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="och1" DatabaseField="och1"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px " FieldTextBoxWidth = "50px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="pb1" DatabaseField="pb1"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px " FieldTextBoxWidth = "50px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="osm1" DatabaseField="osm1"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px " FieldTextBoxWidth = "50px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="ppc1" DatabaseField="ppc1"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px " FieldTextBoxWidth = "50px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="wt1" DatabaseField="wt1"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px " FieldTextBoxWidth = "50px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="voc1" DatabaseField="voc1"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px " FieldTextBoxWidth = "50px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="voctxt" DatabaseField="voctxt"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px " FieldTextBoxWidth = "50px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="dd1" DatabaseField="dd1"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px " FieldTextBoxWidth = "50px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="r1" DatabaseField="r1"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px " FieldTextBoxWidth = "50px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="tc1" DatabaseField="tc1"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px " FieldTextBoxWidth = "50px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="w11" DatabaseField="w11"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px " FieldTextBoxWidth = "50px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="w1txt" DatabaseField="w1txt"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px " FieldTextBoxWidth = "50px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="w21" DatabaseField="w21"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px " FieldTextBoxWidth = "50px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="w2txt" DatabaseField="w2txt"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px " FieldTextBoxWidth = "50px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="zb1" DatabaseField="zb1"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px " FieldTextBoxWidth = "50px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="dt1" DatabaseField="dt1"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px " FieldTextBoxWidth = "50px"></def:datafieldcontrol>
<br />
<br />

<def:datafieldcontrol runat="server" id="created" DatabaseField="created"  IsReadOnly="true" RenderReadOnlyAsDiv="true"   FieldLabelWidth="300px " ></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="createdBy" DatabaseField="createdBy"  IsReadOnly="true" RenderReadOnlyAsDiv="true"   FieldLabelWidth="300px " ></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="updated" DatabaseField="updated"  IsReadOnly="true" RenderReadOnlyAsDiv="true"   FieldLabelWidth="300px " ></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="updatedBy" DatabaseField="updatedBy"  IsReadOnly="true" RenderReadOnlyAsDiv="true"   FieldLabelWidth="300px " ></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="scored" DatabaseField="scored"  IsReadOnly="true" RenderReadOnlyAsDiv="true"   FieldLabelWidth="300px " ></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="scoredBy" DatabaseField="scoredBy"  IsReadOnly="true" RenderReadOnlyAsDiv="true"   FieldLabelWidth="300px " ></def:datafieldcontrol>
</asp:Content>
