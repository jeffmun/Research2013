<%@ Register TagPrefix="def" Namespace="DataEntryFramework3" %> 
<%@ Page language="c#" MasterPageFile="~/UWAC.master"  Title="ABI_MRI Data Entry" %>
<asp:Content ID="Content1" ContentPlaceHolderID="oBodyPlaceHolder" runat="server">

<def:dataentrycontroller id="DataEntryController1" runat="server" DatabaseTable="ALL_ABI_MRI" primarykeyfield="abimri_pk"  >
</def:dataentrycontroller>
<def:datafieldcontrol runat="server" id="id" DatabaseField="id" IsInsertField="true" FieldLabelWidth="300px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="15"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="indexnum" DatabaseField="indexnum" IsInsertField="true" FieldTextBoxTextDefault="1" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>

<br/>

<asp:panel id="mainPanel" CssClass="mainPanel" runat="server">
<div class="main">

<def:datafieldcontrol runat="server" id="abimri_date" DatabaseField="abimri_date" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px"></def:datafieldcontrol>

<br/>
<font color="blue">R = right,  L = left, A = ambidextrous</font>
<br/>
<def:datafieldcontrol runat="server" id="handedness" DatabaseField="handedness" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<br/>
<def:datafieldcontrol runat="server" id="behpre_hit" DatabaseField="behpre_hit" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="behpre_miss" DatabaseField="behpre_miss" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="behpre_incor" DatabaseField="behpre_incor" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="behpre_false" DatabaseField="behpre_false" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<br/>
<def:datafieldcontrol runat="server" id="expversion" DatabaseField="expversion" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<br/>


<table>
<tr>

<td align="right"> <font color="blue"><def:ValueSetLabel   ID="ValueSetLabel_FaceHouseA_collected" runat="server"  DatabaseField="FaceHouseA_collected"></def:ValueSetLabel></font></td>
<td align="right"> <font color="blue"><def:ValueSetLabel ID="ValueSetLabel_FaceHouseA_valid" runat="server"  DatabaseField="FaceHouseA_valid"></def:ValueSetLabel></font></td>

</tr>
<tr>
<td><def:datafieldcontrol runat="server" id="FaceHouseA_collected" DatabaseField="FaceHouseA_collected" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="200px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td> <def:datafieldcontrol runat="server" id="FaceHouseA_valid" DatabaseField="FaceHouseA_valid" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="100px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td>
</tr>
<tr>
<td><def:datafieldcontrol runat="server" id="FaceHouseB_collected" DatabaseField="FaceHouseB_collected" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="200px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td><def:datafieldcontrol runat="server" id="FaceHouseB_valid" DatabaseField="FaceHouseB_valid" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="100px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td>
</tr>
<tr>
<td><def:datafieldcontrol runat="server" id="EGoNoGoA_collected" DatabaseField="EGoNoGoA_collected" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="200px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td><def:datafieldcontrol runat="server" id="EGoNoGoA_valid" DatabaseField="EGoNoGoA_valid" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="100px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td>
</tr>
<tr>
<td><def:datafieldcontrol runat="server" id="EGoNoGoB_collected" DatabaseField="EGoNoGoB_collected" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="200px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td><def:datafieldcontrol runat="server" id="EGoNoGoB_valid" DatabaseField="EGoNoGoB_valid" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="100px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td>
</tr>
<tr>
<td><def:datafieldcontrol runat="server" id="Rest_collected" DatabaseField="Rest_collected" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="200px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td><def:datafieldcontrol runat="server" id="Rest_valid" DatabaseField="Rest_valid" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="100px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td>
</tr>
<tr>
<td><def:datafieldcontrol runat="server" id="Language_collected" DatabaseField="Language_collected" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="200px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td><def:datafieldcontrol runat="server" id="Language_valid" DatabaseField="Language_valid" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="100px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td>
</tr>
<tr>
<td><def:datafieldcontrol runat="server" id="MRS_collected" DatabaseField="MRS_collected" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="200px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td><def:datafieldcontrol runat="server" id="MRS_valid" DatabaseField="MRS_valid" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="100px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td>
</tr>
<tr>
<td><def:datafieldcontrol runat="server" id="DTI_collected" DatabaseField="DTI_collected" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="200px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td><def:datafieldcontrol runat="server" id="DTI_valid" DatabaseField="DTI_valid" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="100px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td>
</tr>
<tr>
<td><def:datafieldcontrol runat="server" id="EyeTracking_collected" DatabaseField="EyeTracking_collected" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="200px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td><def:datafieldcontrol runat="server" id="EyeTracking_valid" DatabaseField="EyeTracking_valid" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="100px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td></tr>
<tr>
<td><def:datafieldcontrol runat="server" id="PhysMonitor_collected" DatabaseField="PhysMonitor_collected" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="200px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td><def:datafieldcontrol runat="server" id="PhysMonitor_valid" DatabaseField="PhysMonitor_valid" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="100px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td>
</tr>
</table>

<br/>
<br/>
<def:datafieldcontrol runat="server" id="EGoNoGoA_hit" DatabaseField="EGoNoGoA_hit" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="200px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="EGoNoGoA_miss" DatabaseField="EGoNoGoA_miss" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="200px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="EGoNoGoA_incor" DatabaseField="EGoNoGoA_incor" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="200px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="EGoNoGoA_false" DatabaseField="EGoNoGoA_false" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="200px" FieldTextBoxWidth="40px"></def:datafieldcontrol>

<br/>
<def:datafieldcontrol runat="server" id="EGoNoGoB_hit" DatabaseField="EGoNoGoB_hit" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="200px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="EGoNoGoB_miss" DatabaseField="EGoNoGoB_miss" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="200px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="EGoNoGoB_incor" DatabaseField="EGoNoGoB_incor" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="200px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="EGoNoGoB_false" DatabaseField="EGoNoGoB_false" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="200px" FieldTextBoxWidth="40px"></def:datafieldcontrol>


<br/>
<def:datafieldcontrol runat="server" id="CurrentMeds" DatabaseField="CurrentMeds" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="200px" FieldTextBoxWidth="400px" FieldTextBoxHeight="40px" FieldTextBoxTextMode="multiline" FieldTextBoxMaxLength="2000"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="ABI_MIR_notes" DatabaseField="ABI_MIR_notes" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="200px" FieldTextBoxWidth="400px" FieldTextBoxHeight="40px" FieldTextBoxTextMode="multiline" FieldTextBoxMaxLength="2000"></def:datafieldcontrol>

<br/>
<def:datafieldcontrol runat="server" id="created" DatabaseField="created" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="150px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="createdBy" DatabaseField="createdBy" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="150px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="50"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="updated" DatabaseField="updated" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="150px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="updatedBy" DatabaseField="updatedBy" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="150px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="50"></def:datafieldcontrol>


</asp:panel>
</asp:Content>
