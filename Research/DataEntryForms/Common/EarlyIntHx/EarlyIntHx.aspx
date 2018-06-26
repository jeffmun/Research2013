<%@ Register TagPrefix="def" Namespace="DataEntryFramework3" %> 
<%@ Page language="c#" MasterPageFile="~/UWAC.master"  Title="EarlyIntHx Data Entry" %>
<asp:Content ID="Content1" ContentPlaceHolderID="oBodyPlaceHolder" runat="server">
<def:dataentrycontroller id="DataEntryController1" runat="server" DatabaseTable="ALL_EarlyIntHx" >
</def:dataentrycontroller>
<def:datafieldcontrol runat="server" id="id" DatabaseField="id"  IsInsertField="true"   FieldLabelWidth="300px "></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="indexnum" DatabaseField="indexnum"  IsInsertField="true"   FieldLabelWidth="300px "></def:datafieldcontrol>
<p>Please mark missing values with a -9.</p>
<table cellpadding="5" border="1">
    <tr>
        <td style="width:200px">Type of Service</td>
        <td style="width:200px">What age did your child first begin this service?</td>
        <td style="width:200px">Child '0' Has or '1' Never received this type of service.</td>
    </tr>
    <tr>
        <td>Speech/Language Therapy</td>
        <td>
        <def:datafieldcontrol runat="server" id="EISPLGYR" DatabaseField="EISPLGYR"  IsEntryField="true" IsDoubleEntryField="true"  FieldTextBoxWidth="30px"></def:datafieldcontrol>
        <def:datafieldcontrol runat="server" id="EISPLGMO" DatabaseField="EISPLGMO"  IsEntryField="true" IsDoubleEntryField="true"  FieldTextBoxWidth="30px"></def:datafieldcontrol>
        </td>
        <td>
        <def:datafieldcontrol runat="server" id="EISPLGNV" DatabaseField="EISPLGNV"  IsEntryField="true" IsDoubleEntryField="true"  FieldTextBoxWidth="30px"></def:datafieldcontrol>
        </td>
    </tr>
    <tr>
        <td>Special Education School program</td>
        <td>
        <def:datafieldcontrol runat="server" id="EISPEDYR" DatabaseField="EISPEDYR"  IsEntryField="true" IsDoubleEntryField="true"  FieldTextBoxWidth="30px"></def:datafieldcontrol>
        <def:datafieldcontrol runat="server" id="EISPEDMO" DatabaseField="EISPEDMO"  IsEntryField="true" IsDoubleEntryField="true"  FieldTextBoxWidth="30px"></def:datafieldcontrol>
        </td>
        <td>
        <def:datafieldcontrol runat="server" id="EISPEDNV" DatabaseField="EISPEDNV"  IsEntryField="true" IsDoubleEntryField="true"  FieldTextBoxWidth="30px"></def:datafieldcontrol>
        </td>
    </tr>
    <tr>
        <td>Behavioral Home Intervention Program</td>
        <td>
        <def:datafieldcontrol runat="server" id="EIBEHHYR" DatabaseField="EIBEHHYR"  IsEntryField="true" IsDoubleEntryField="true"  FieldTextBoxWidth="30px"></def:datafieldcontrol>
        <def:datafieldcontrol runat="server" id="EIBEHHMO" DatabaseField="EIBEHHMO"  IsEntryField="true" IsDoubleEntryField="true"  FieldTextBoxWidth="30px"></def:datafieldcontrol>
        </td>
        <td>
        <def:datafieldcontrol runat="server" id="EIBEHHNV" DatabaseField="EIBEHHNV"  IsEntryField="true" IsDoubleEntryField="true"  FieldTextBoxWidth="30px"></def:datafieldcontrol>
        </td>
    </tr>
</table>
<p>For each year, mark according to the key on the right to indicate average number of <strong>hours per week</strong> of intervention services:</p>
<table border="0" cellpadding="5" cellspacing="0">
    <tr>
        <td>
        <def:datafieldcontrol runat="server" id="EIHRS1" DatabaseField="EIHRS1"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="200px " FieldTextBoxWidth="30px"></def:datafieldcontrol>
        <def:datafieldcontrol runat="server" id="EIHRS2" DatabaseField="EIHRS2"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="200px " FieldTextBoxWidth="30px"></def:datafieldcontrol>
        <def:datafieldcontrol runat="server" id="EIHRS3" DatabaseField="EIHRS3"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="200px " FieldTextBoxWidth="30px"></def:datafieldcontrol>
        <def:datafieldcontrol runat="server" id="EIHRS4" DatabaseField="EIHRS4"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="200px " FieldTextBoxWidth="30px"></def:datafieldcontrol>
        <def:datafieldcontrol runat="server" id="EIHRS5" DatabaseField="EIHRS5"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="200px " FieldTextBoxWidth="30px"></def:datafieldcontrol>
        <def:datafieldcontrol runat="server" id="EIHRS6" DatabaseField="EIHRS6"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="200px " FieldTextBoxWidth="30px"></def:datafieldcontrol>
        </td>
        <td style="padding-left:20px">
        <def:ValueSetLabel ID="ValueSetLabel_EIHRS1" runat="server"  DatabaseField="EIHRS1"></def:ValueSetLabel>
        </td>
    </tr>
</table>
<br />
<def:datafieldcontrol runat="server" id="created" DatabaseField="created"  IsReadOnly="true" RenderReadOnlyAsDiv="true"   FieldLabelWidth="300px "></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="createdBy" DatabaseField="createdBy"  IsReadOnly="true" RenderReadOnlyAsDiv="true"   FieldLabelWidth="300px "></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="updated" DatabaseField="updated"  IsReadOnly="true" RenderReadOnlyAsDiv="true"   FieldLabelWidth="300px "></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="updatedBy" DatabaseField="updatedBy"  IsReadOnly="true" RenderReadOnlyAsDiv="true"   FieldLabelWidth="300px "></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="scored" DatabaseField="scored"  IsReadOnly="true" RenderReadOnlyAsDiv="true"   FieldLabelWidth="300px "></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="scoredBy" DatabaseField="scoredBy"  IsReadOnly="true" RenderReadOnlyAsDiv="true"   FieldLabelWidth="300px "></def:datafieldcontrol>
</asp:Content>
