<%@ Register TagPrefix="def" Namespace="DataEntryFramework3" %> 
<%@ Page language="c#" MasterPageFile="~/UWAC.master"  Title="SAGEmeasures Data Entry" %>
<asp:Content ID="Content1" ContentPlaceHolderID="oBodyPlaceHolder" runat="server">

<def:dataentrycontroller id="DataEntryController1" runat="server" DatabaseTable="ALL_SAGEmeasures" PrimaryKeyField="sagemeasPK">
</def:dataentrycontroller>
<def:datafieldcontrol runat="server" id="ID" DatabaseField="ID" IsInsertField="true" FieldLabelWidth="180px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="15"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="indexnum" DatabaseField="indexnum" IsInsertField="true" FieldTextBoxTextDefault="1" FieldLabelWidth="180px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="sagemeasDate" DatabaseField="sagemeasDate" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="180px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="ADOS" DatabaseField="ADOS" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="180px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="ADI" DatabaseField="ADI" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="180px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="Cognitive" DatabaseField="Cognitive" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="180px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="PPVT" DatabaseField="PPVT" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="180px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="MotorTask" DatabaseField="MotorTask" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="180px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="SRS" DatabaseField="SRS" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="180px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="CCC" DatabaseField="CCC" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="180px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="MedHx" DatabaseField="MedHx" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="180px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="BAPQ" DatabaseField="BAPQ" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="180px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="ABC" DatabaseField="ABC" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="180px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="CBCL" DatabaseField="CBCL" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="180px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="Dysmorphology" DatabaseField="Dysmorphology" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="180px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="Pedigree" DatabaseField="Pedigree" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="180px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="TreatmentHx" DatabaseField="TreatmentHx" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="180px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="Vineland" DatabaseField="Vineland" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="180px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="Diagnosis" DatabaseField="Diagnosis" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="180px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="50"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="Notes" DatabaseField="Notes" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="180px" FieldTextBoxWidth="400px" FieldTextBoxHeight="40px" FieldTextBoxTextMode="multiline" FieldTextBoxMaxLength="250"></def:datafieldcontrol>
<br/>
<br/>
<def:datafieldcontrol runat="server" id="created" DatabaseField="created" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="180px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="createdBy" DatabaseField="createdBy" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="180px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="50"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="updated" DatabaseField="updated" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="180px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="updatedBy" DatabaseField="updatedBy" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="180px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="50"></def:datafieldcontrol>
</asp:Content>
