<%@ Register TagPrefix="def" Namespace="DataEntryFramework3" %> 
<%@ Page language="c#" MasterPageFile="~/UWAC.master"  Title="ProblemBeh Data Entry" %>
<asp:Content ID="Content1" ContentPlaceHolderID="oBodyPlaceHolder" runat="server">

<def:dataentrycontroller id="DataEntryController1" runat="server" DatabaseTable="ALL_ProblemBehaviors" PrimaryKeyField="probbeh_pk" >
</def:dataentrycontroller>
<def:datafieldcontrol runat="server" id="id" DatabaseField="id" IsInsertField="true" FieldLabelWidth="300px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="15"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="indexnum" DatabaseField="indexnum" IsInsertField="true" FieldTextBoxTextDefault="1" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="probbeh_date" DatabaseField="probbeh_date" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px"  FormatString="{0:d}"></def:datafieldcontrol>


<table>
<tr>
    <td><def:datafieldcontrol runat="server" id="parent" DatabaseField="parent" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:ValueSetLabel ID="ValueSetLabel0" runat="server"  DatabaseField="parent"></def:ValueSetLabel></td>
</tr>
</table>

<def:datafieldcontrol runat="server" id="therapist" DatabaseField="therapist" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="300px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="50"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="probbeh_agemos" DatabaseField="probbeh_agemos" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
 
 <br/>
 <br/>
<table>
<tr><td style="width:400px"></td><td align="left"><b><u>Frequency</u></b></td><td align="left"><b><u>Duration</u></b></td><td align="left"><b><u>How problematic?</u></b></td></tr>


<tr><td style="width:400px"></td><td align="left"><def:ValueSetLabel ID="ValueSetLabel1" runat="server"  DatabaseField="tantrums1"></def:ValueSetLabel></td>
    <td style="width:120px" align="left"><def:ValueSetLabel ID="ValueSetLabel2" runat="server"  DatabaseField="tantrums3"></def:ValueSetLabel></td>
    <td style="width:180px" align="left"><def:ValueSetLabel ID="ValueSetLabel3" runat="server"  DatabaseField="tantrums2"></def:ValueSetLabel></td></tr>



<tr><td colspan=2>
<def:datafieldcontrol runat="server" id="tantrums1" DatabaseField="tantrums1" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="400px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
</td><td>
<def:datafieldcontrol runat="server" id="tantrums3" DatabaseField="tantrums3" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="10px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
</td><td>
<def:datafieldcontrol runat="server" id="tantrums2" DatabaseField="tantrums2" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="10px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
</td></tr>
<tr><td colspan=2>
<def:datafieldcontrol runat="server" id="aggression1" DatabaseField="aggression1" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="400px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
</td><td>
<def:datafieldcontrol runat="server" id="aggression3" DatabaseField="aggression3" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="10px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
</td><td>
<def:datafieldcontrol runat="server" id="aggression2" DatabaseField="aggression2" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="10px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
</td></tr>
<tr><td colspan=2>
<def:datafieldcontrol runat="server" id="selfinjury1" DatabaseField="selfinjury1" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="400px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
</td><td>
<def:datafieldcontrol runat="server" id="selfinjury3" DatabaseField="selfinjury3" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="10px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
</td><td>
<def:datafieldcontrol runat="server" id="selfinjury2" DatabaseField="selfinjury2" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="10px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
</td></tr>
<tr><td colspan=2>
<def:datafieldcontrol runat="server" id="sleeping1" DatabaseField="sleeping1" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="400px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
</td><td></td><td>
<def:datafieldcontrol runat="server" id="sleeping2" DatabaseField="sleeping2" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="10px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
</td></tr>
<tr><td colspan=2>
<def:datafieldcontrol runat="server" id="eating1" DatabaseField="eating1" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="400px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
</td><td></td><td>
<def:datafieldcontrol runat="server" id="eating2" DatabaseField="eating2" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="10px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
</td>
</tr>
</table>

<br/>
<br/>
<def:datafieldcontrol runat="server" id="probbeh_scrmsg" DatabaseField="probbeh_scrmsg"  IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="300px" FieldTextBoxWidth="400px" FieldTextBoxHeight="40px" FieldTextBoxTextMode="multiline" FieldTextBoxMaxLength="250"></def:datafieldcontrol>

<br/>
<br/>

<def:datafieldcontrol runat="server" id="created" DatabaseField="created" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="300px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="createdBy" DatabaseField="createdBy" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="300px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="50"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="updated" DatabaseField="updated" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="300px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="updatedBy" DatabaseField="updatedBy" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="300px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="50"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="scored" DatabaseField="scored" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="300px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="scoredBy" DatabaseField="scoredBy" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="300px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="50"></def:datafieldcontrol>
</asp:Content>
