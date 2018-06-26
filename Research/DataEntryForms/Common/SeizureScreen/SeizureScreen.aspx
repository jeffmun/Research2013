<%@ Register TagPrefix="def" Namespace="DataEntryFramework3" %> 
<%@ Page language="c#" MasterPageFile="~/UWAC.master"  Title="Seizure Screen Data Entry" %>
<asp:Content ID="Content1" ContentPlaceHolderID="oBodyPlaceHolder" runat="server">

<def:dataentrycontroller id="DataEntryController1" runat="server" DatabaseTable="ALL_SeizureScreen" >
</def:dataentrycontroller>
<div class="main">
    <def:datafieldcontrol runat="server" id="id" DatabaseField="id" IsInsertField="true" FieldLabelWidth="150px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="15"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="indexnum" DatabaseField="indexnum" IsInsertField="true" FieldTextBoxTextDefault="1" FieldLabelWidth="150px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="SSDate" DatabaseField="SSDate" FieldLabelText="Questionnaire Date" IsInsertField="true" FieldLabelWidth="150px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="SSInterviewer" DatabaseField="SSInterviewer" FieldLabelText="Interviewer" IsInsertField="true" FieldLabelWidth="150px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="50"></def:datafieldcontrol>
</div>
<asp:panel id="mainPanel" CssClass="mainPanel" runat="server">
<div class="collection">
    <div class="main"><def:datafieldcontrol runat="server" id="SS1Choice" DatabaseField="SS1Choice" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
    <div class="key"><def:ValueSetLabel ID="ValueSetLabel_SS1Choice" runat="server"  DatabaseField="SS1Choice"></def:ValueSetLabel></div>
</div>
<div class="main"><def:datafieldcontrol runat="server" id="SS1Note" DatabaseField="SS1Note" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="300px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="200"></def:datafieldcontrol></div>
<div class="collection">
    <div class="main"><def:datafieldcontrol runat="server" id="SS2Choice" DatabaseField="SS2Choice" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px" CallOnBlur="SeizureScreen_onBlur"></def:datafieldcontrol></div>
    <div class="key"><def:ValueSetLabel ID="ValueSetLabel_SS2Choice" runat="server"  DatabaseField="SS2Choice"></def:ValueSetLabel></div>
</div>
<div class="main"><def:datafieldcontrol runat="server" id="SS2Note" DatabaseField="SS2Note" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="300px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="200"></def:datafieldcontrol></div>
<div class="collection">
    <div class="main"><def:datafieldcontrol runat="server" id="SS3aChoice" DatabaseField="SS3aChoice" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
    <div class="key"><def:ValueSetLabel ID="ValueSetLabel_SS3aChoice" runat="server"  DatabaseField="SS3aChoice"></def:ValueSetLabel></div>
</div>
<div class="main"><def:datafieldcontrol runat="server" id="SS3aNote" DatabaseField="SS3aNote" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="300px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="200"></def:datafieldcontrol></div>
<div class="collection">
    <div class="main"><def:datafieldcontrol runat="server" id="SS3bChoice" DatabaseField="SS3bChoice" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
    <div class="key"><def:ValueSetLabel ID="ValueSetLabel_SS3bChoice" runat="server"  DatabaseField="SS3bChoice"></def:ValueSetLabel></div>
</div>
<div class="main"><def:datafieldcontrol runat="server" id="SS3bNote" DatabaseField="SS3bNote" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="300px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="200"></def:datafieldcontrol></div>
<div class="collection">
    <div class="main"><def:datafieldcontrol runat="server" id="SS3cChoice" DatabaseField="SS3cChoice" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
    <div class="key"><def:ValueSetLabel ID="ValueSetLabel_SS3cChoice" runat="server"  DatabaseField="SS3cChoice"></def:ValueSetLabel></div>
</div>
<div class="main"><def:datafieldcontrol runat="server" id="SS3cNote" DatabaseField="SS3cNote" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="300px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="200"></def:datafieldcontrol></div>
<div class="collection">
    <div class="main"><def:datafieldcontrol runat="server" id="SS3dChoice" DatabaseField="SS3dChoice" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
    <div class="key"><def:ValueSetLabel ID="ValueSetLabel_SS3dChoice" runat="server"  DatabaseField="SS3dChoice"></def:ValueSetLabel></div>
</div>
<div class="main"><def:datafieldcontrol runat="server" id="SS3dNote" DatabaseField="SS3dNote" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="300px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="200"></def:datafieldcontrol></div>
<div class="collection">
    <div class="main"><def:datafieldcontrol runat="server" id="SS3eChoice" DatabaseField="SS3eChoice" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
    <div class="key"><def:ValueSetLabel ID="ValueSetLabel_SS3eChoice" runat="server"  DatabaseField="SS3eChoice"></def:ValueSetLabel></div>
</div>
<div class="main"><def:datafieldcontrol runat="server" id="SS3eNote" DatabaseField="SS3eNote" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="300px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="200"></def:datafieldcontrol></div>
<div class="collection">
    <div class="main"><def:datafieldcontrol runat="server" id="SS3fChoice" DatabaseField="SS3fChoice" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
    <div class="key"><def:ValueSetLabel ID="ValueSetLabel_SS3fChoice" runat="server"  DatabaseField="SS3fChoice"></def:ValueSetLabel></div>
</div>
<div class="main"><def:datafieldcontrol runat="server" id="SS3fNote" DatabaseField="SS3fNote" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="300px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="200"></def:datafieldcontrol></div>
<div class="collection">
    <div class="main"><def:datafieldcontrol runat="server" id="SS3gChoice" DatabaseField="SS3gChoice" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
    <div class="key"><def:ValueSetLabel ID="ValueSetLabel_SS3gChoice" runat="server"  DatabaseField="SS3gChoice"></def:ValueSetLabel></div>
</div>
<div class="main"><def:datafieldcontrol runat="server" id="SS3gNote" DatabaseField="SS3gNote" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="300px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="200"></def:datafieldcontrol></div>
<div class="collection">
    <div class="main"><def:datafieldcontrol runat="server" id="SS4Choice" DatabaseField="SS4Choice" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
    <div class="key"><def:ValueSetLabel ID="ValueSetLabel_SS4Choice" runat="server"  DatabaseField="SS4Choice"></def:ValueSetLabel></div>
</div>
<div class="main">
    <def:datafieldcontrol runat="server" id="SS4Note" DatabaseField="SS4Note" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="300px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="200"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="SSMed" DatabaseField="SSMed" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="300px" FieldTextBoxWidth="400px" FieldTextBoxHeight="40px" FieldTextBoxTextMode="multiline" FieldTextBoxMaxLength="500"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="SSComment" DatabaseField="SSComment" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="300px" FieldTextBoxWidth="400px" FieldTextBoxHeight="40px" FieldTextBoxTextMode="multiline" FieldTextBoxMaxLength="500"></def:datafieldcontrol>
</div>
</asp:Panel>
<div class="main">
    <br>
    <def:datafieldcontrol runat="server" id="created" DatabaseField="created" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="300px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="createdBy" DatabaseField="createdBy" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="300px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="50"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="updated" DatabaseField="updated" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="300px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="updatedBy" DatabaseField="updatedBy" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="300px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="50"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="scored" DatabaseField="scored" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="300px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="scoredBy" DatabaseField="scoredBy" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="300px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="50"></def:datafieldcontrol>
</div>
</asp:Content>
