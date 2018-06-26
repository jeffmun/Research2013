<%@ Register TagPrefix="def" Namespace="DataEntryFramework3" %> 
<%@ Page language="c#" MasterPageFile="~/UWAC.master"  Title="EC_Caregiv Data Entry" %>
<asp:Content ID="Content1" ContentPlaceHolderID="oBodyPlaceHolder" runat="server">

<def:dataentrycontroller id="DataEntryController1" runat="server" DatabaseTable="ALL_EC_Caregiver" >
</def:dataentrycontroller>
<def:datafieldcontrol runat="server" id="id" DatabaseField="id" IsInsertField="true" FieldLabelWidth="100px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="15"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="indexnum" DatabaseField="indexnum" IsInsertField="true" FieldTextBoxTextDefault="1" FieldLabelWidth="100px" FieldTextBoxWidth="40px"></def:datafieldcontrol>


<asp:Panel Runat="server" ID="mainPanel">

<def:datafieldcontrol runat="server" id="adults_date" DatabaseField="adults_date" IsEntryField="true" IsEntryValueRequired="true" IsDoubleEntryField="true" FieldLabelWidth="100px" FieldTextBoxWidth="150px"></def:datafieldcontrol>

<br/>
<font color="blue">
<def:ValueSetLabel ID="ValueSetLabel_deffamily" runat="server"  DatabaseField="deffamily"></def:ValueSetLabel>
 </font>
<def:datafieldcontrol runat="server" id="deffamily" DatabaseField="deffamily" IsEntryField="true" IsEntryValueRequired="true" IsDoubleEntryField="true" FieldLabelWidth="100px" FieldTextBoxWidth="150px"></def:datafieldcontrol>
 
<br/> 
<br/> 

<font color="red">
<b>If not default, enter details below.</b>
</font>

 
<br/>
<br/>

<br/>
<font color="blue">
<def:ValueSetLabel ID="ValueSetLabel_adult1" runat="server"  DatabaseField="adult1"></def:ValueSetLabel>
 </font>


<def:datafieldcontrol runat="server" id="adult1" DatabaseField="adult1" FieldTextBoxTextDefault="1" IsEntryField="true" IsEntryValueRequired="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="adult1_desc" DatabaseField="adult1_desc" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="150px"></def:datafieldcontrol>
 
<br/> 
<font color="blue">
<def:ValueSetLabel ID="ValueSetLabel_adult1_pcg" runat="server"  DatabaseField="adult1_pcg"></def:ValueSetLabel>
</font>


 
<def:datafieldcontrol runat="server" id="adult1_pcg" DatabaseField="adult1_pcg" FieldTextBoxTextDefault="1" IsEntryField="true" IsEntryValueRequired="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="adult1_notes" DatabaseField="adult1_notes" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="300px" FieldTextBoxWidth="400px" FieldTextBoxHeight="80px"></def:datafieldcontrol>

</hr>
<br/>
<br/>
<br/>

<br/>
<font color="blue">
<def:ValueSetLabel ID="ValueSetLabel_adult2" runat="server"  DatabaseField="adult1"></def:ValueSetLabel>
 </font>

<def:datafieldcontrol runat="server" id="adult2" DatabaseField="adult2" FieldTextBoxTextDefault="2" IsEntryField="true" IsEntryValueRequired="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="adult2_desc" DatabaseField="adult2_desc" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="150px"></def:datafieldcontrol>

<br/>
<font color="blue">
<def:ValueSetLabel ID="ValueSetLabel_adult2_pcg" runat="server"  DatabaseField="adult1_pcg"></def:ValueSetLabel>
</font>
<def:datafieldcontrol runat="server" id="adult2_pcg" DatabaseField="adult2_pcg" FieldTextBoxTextDefault="0" IsEntryField="true" IsEntryValueRequired="true"  IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="adult2_notes" DatabaseField="adult2_notes" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="300px" FieldTextBoxWidth="400px" FieldTextBoxHeight="80px"></def:datafieldcontrol>
 
<br/> 
<font color="blue">
<def:ValueSetLabel ID="ValueSetLabel_PCGQPchild" runat="server"  DatabaseField="PCGQPchild"></def:ValueSetLabel>
</font>
 
<def:datafieldcontrol runat="server" id="PCGQPchild" DatabaseField="PCGQPchild" FieldTextBoxTextDefault="1" IsEntryField="true" IsEntryValueRequired="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>

<br/> 
<font color="blue">
<def:ValueSetLabel ID="ValueSetLabel_PCGQPself" runat="server"  DatabaseField="PCGQPself"></def:ValueSetLabel>
</font>

 
<def:datafieldcontrol runat="server" id="PCGQPself" DatabaseField="PCGQPself" FieldTextBoxTextDefault="1" IsEntryField="true" IsEntryValueRequired="true"  IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="SpQPself" DatabaseField="SpQPself" FieldTextBoxTextDefault="2" IsEntryField="true" IsEntryValueRequired="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>

<br/> 
<br/> 
<def:datafieldcontrol runat="server" id="created" DatabaseField="created" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="300px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="createdBy" DatabaseField="createdBy" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="300px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="50"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="updated" DatabaseField="updated" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="300px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="updatedBy" DatabaseField="updatedBy" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="300px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="50"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="scored" DatabaseField="scored" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="300px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="scoredBy" DatabaseField="scoredBy" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="300px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="50"></def:datafieldcontrol>

</asp:Panel>

</asp:Content>
