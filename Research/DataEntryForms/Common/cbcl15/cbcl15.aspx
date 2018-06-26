<%@ Register TagPrefix="def" Namespace="DataEntryFramework3" %> 
<%@ Page language="c#" MasterPageFile="~/UWAC.master"  Title="CBCL15 Data Entry" %>
<asp:Content ID="Content1" ContentPlaceHolderID="oBodyPlaceHolder" runat="server">

<def:dataentrycontroller id="DataEntryController1" runat="server" DatabaseTable="ALL_CBCL15" PrimaryKeyField = "cbcl15_pk">
</def:dataentrycontroller>


<def:datafieldcontrol runat="server" id="id" DatabaseField="id" IsInsertField="true" FieldLabelWidth="300px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="15"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="indexnum" DatabaseField="indexnum" IsInsertField="true" FieldTextBoxTextDefault="1" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<br/>

<asp:Panel   id="mainPanel" Runat="server">

<def:datafieldcontrol runat="server" id="CBCL15_date" DatabaseField="CBCL15_date" IsEntryField="true" ShowFieldLabel="true"  IsDoubleEntryField="true" FieldLabelWidth="300px" FormatString="{0:d}"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="CBCL15_sex" DatabaseField="CBCL15_sex" IsReadOnly="true" ShowFieldLabel="true"  RenderReadOnlyAsDiv="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="CBCL15_agemos" DatabaseField="CBCL15_agemos" IsReadOnly="true" ShowFieldLabel="true"   RenderReadOnlyAsDiv="true"   FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="CBCL15_ageym" DatabaseField="CBCL15_ageym" IsReadOnly="true" ShowFieldLabel="true"   RenderReadOnlyAsDiv="true"   FieldLabelWidth="300px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="10"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="CBCL15_resp" DatabaseField="CBCL15_resp" IsEntryField="true" ShowFieldLabel="true"  IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<br/>
<br/>

<table runat="server"  border="1"  bgcolor="#EEEEEE" style="border-style: solid; border-color: #C0C0C0">

<tr>
<td align="center" width = "85px"><b>Narrow Band<br/>Scales</b></td>
<td align="center" width = "85px"><u>1. Emotionally Reactive</u></td>
<td align="center" width = "85px"><u>2. Anxious / Depressed</u></td>
<td align="center" width = "85px"><u>3. Somatic Complaints</u></td>
<td align="center" width = "85px"><u>4. Withdrawn</u></td>
<td align="center" width = "85px"><u>5. Sleep Problems</u></td>
<td align="center" width = "85px"><u>6. Attention Problems</u></td>
<td align="center" width = "85px"><u>7. Aggressive Behavior</u></td>
</tr>

<tr>
<td align="center">Raw score</td>
<td align="center"><def:datafieldcontrol runat="server" id="CBCL15_s1raw" DatabaseField="CBCL15_s1raw" IsReadOnly="true" ShowFieldLabel="False"  RenderReadOnlyAsDiv="true" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td align="center"><def:datafieldcontrol runat="server" id="CBCL15_s2raw" DatabaseField="CBCL15_s2raw" IsReadOnly="true" ShowFieldLabel="False"  RenderReadOnlyAsDiv="true" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td align="center"><def:datafieldcontrol runat="server" id="CBCL15_s3raw" DatabaseField="CBCL15_s3raw" IsReadOnly="true" ShowFieldLabel="False"  RenderReadOnlyAsDiv="true" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td align="center"><def:datafieldcontrol runat="server" id="CBCL15_s4raw" DatabaseField="CBCL15_s4raw" IsReadOnly="true" ShowFieldLabel="False"  RenderReadOnlyAsDiv="true" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td align="center"><def:datafieldcontrol runat="server" id="CBCL15_s5raw" DatabaseField="CBCL15_s5raw" IsReadOnly="true" ShowFieldLabel="False"  RenderReadOnlyAsDiv="true" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td align="center"><def:datafieldcontrol runat="server" id="CBCL15_s6raw" DatabaseField="CBCL15_s6raw" IsReadOnly="true" ShowFieldLabel="False"  RenderReadOnlyAsDiv="true" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td align="center"><def:datafieldcontrol runat="server" id="CBCL15_s7raw" DatabaseField="CBCL15_s7raw" IsReadOnly="true" ShowFieldLabel="False"  RenderReadOnlyAsDiv="true" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
</tr>

<tr>
<td align="center">T score</td>
<td align="center"><def:datafieldcontrol runat="server" id="CBCL15_s1t" DatabaseField="CBCL15_s1t" IsReadOnly="true" ShowFieldLabel="False"  RenderReadOnlyAsDiv="true" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td align="center"><def:datafieldcontrol runat="server" id="CBCL15_s2t" DatabaseField="CBCL15_s2t" IsReadOnly="true" ShowFieldLabel="False"  RenderReadOnlyAsDiv="true" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td align="center"><def:datafieldcontrol runat="server" id="CBCL15_s3t" DatabaseField="CBCL15_s3t" IsReadOnly="true" ShowFieldLabel="False"  RenderReadOnlyAsDiv="true" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td align="center"><def:datafieldcontrol runat="server" id="CBCL15_s4t" DatabaseField="CBCL15_s4t" IsReadOnly="true" ShowFieldLabel="False"  RenderReadOnlyAsDiv="true" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td align="center"><def:datafieldcontrol runat="server" id="CBCL15_s5t" DatabaseField="CBCL15_s5t" IsReadOnly="true" ShowFieldLabel="False"  RenderReadOnlyAsDiv="true" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td align="center"><def:datafieldcontrol runat="server" id="CBCL15_s6t" DatabaseField="CBCL15_s6t" IsReadOnly="true" ShowFieldLabel="False"  RenderReadOnlyAsDiv="true" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td align="center"><def:datafieldcontrol runat="server" id="CBCL15_s7t" DatabaseField="CBCL15_s7t" IsReadOnly="true" ShowFieldLabel="False"  RenderReadOnlyAsDiv="true" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
</tr>

<tr>
<td align="center">Percentile</td>
<td align="center"><def:datafieldcontrol runat="server" id="CBCL15_s1pct" DatabaseField="CBCL15_s1pct" IsReadOnly="true" ShowFieldLabel="False"  RenderReadOnlyAsDiv="true" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td align="center"><def:datafieldcontrol runat="server" id="CBCL15_s2pct" DatabaseField="CBCL15_s2pct" IsReadOnly="true" ShowFieldLabel="False"  RenderReadOnlyAsDiv="true" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td align="center"><def:datafieldcontrol runat="server" id="CBCL15_s3pct" DatabaseField="CBCL15_s3pct" IsReadOnly="true" ShowFieldLabel="False"  RenderReadOnlyAsDiv="true" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td align="center"><def:datafieldcontrol runat="server" id="CBCL15_s4pct" DatabaseField="CBCL15_s4pct" IsReadOnly="true" ShowFieldLabel="False"  RenderReadOnlyAsDiv="true" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td align="center"><def:datafieldcontrol runat="server" id="CBCL15_s5pct" DatabaseField="CBCL15_s5pct" IsReadOnly="true" ShowFieldLabel="False"  RenderReadOnlyAsDiv="true" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td align="center"><def:datafieldcontrol runat="server" id="CBCL15_s6pct" DatabaseField="CBCL15_s6pct" IsReadOnly="true" ShowFieldLabel="False"  RenderReadOnlyAsDiv="true" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td align="center"><def:datafieldcontrol runat="server" id="CBCL15_s7pct" DatabaseField="CBCL15_s7pct" IsReadOnly="true" ShowFieldLabel="False"  RenderReadOnlyAsDiv="true" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
</tr>

</table>

<br/>
<br/>

<table  runat="server"  border="1"  bgcolor="#EEEEEE" style="border-style: solid; border-color: #C0C0C0">
<tr>
<td align="center" width = "85px"><b>Broad Band<br/>Scales</b></td>
<td align="center" width = "85px"><u>Internalizing Problems</u></td>
<td align="center" width = "85px"><u>Externalizing Problems</u></td>
<td align="center" width = "85px"><u>Total Behavior Problems</u></td>
</tr>

<tr>
<td align="center">Raw score</td>
<td align="center"><def:datafieldcontrol runat="server" id="CBCL15_intraw" DatabaseField="CBCL15_intraw" IsReadOnly="true" ShowFieldLabel="False"  RenderReadOnlyAsDiv="true" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td align="center"><def:datafieldcontrol runat="server" id="CBCL15_extraw" DatabaseField="CBCL15_extraw" IsReadOnly="true" ShowFieldLabel="False"  RenderReadOnlyAsDiv="true" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td align="center"><def:datafieldcontrol runat="server" id="CBCL15_totraw" DatabaseField="CBCL15_totraw" IsReadOnly="true" ShowFieldLabel="False"  RenderReadOnlyAsDiv="true" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
</tr>

<tr>
<td align="center">T score</td>
<td align="center"><def:datafieldcontrol runat="server" id="CBCL15_intt" DatabaseField="CBCL15_intt" IsReadOnly="true" ShowFieldLabel="False"  RenderReadOnlyAsDiv="true" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td align="center"><def:datafieldcontrol runat="server" id="CBCL15_extt" DatabaseField="CBCL15_extt" IsReadOnly="true" ShowFieldLabel="False"  RenderReadOnlyAsDiv="true" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td align="center"><def:datafieldcontrol runat="server" id="CBCL15_tott" DatabaseField="CBCL15_tott" IsReadOnly="true" ShowFieldLabel="False"  RenderReadOnlyAsDiv="true" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
</tr>

<tr>
<td align="center">Percentile</td>
<td align="center"><def:datafieldcontrol runat="server" id="CBCL15_intpct" DatabaseField="CBCL15_intpct" IsReadOnly="true" ShowFieldLabel="False"  RenderReadOnlyAsDiv="true" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td align="center"><def:datafieldcontrol runat="server" id="CBCL15_extpct" DatabaseField="CBCL15_extpct" IsReadOnly="true" ShowFieldLabel="False"  RenderReadOnlyAsDiv="true" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td align="center"><def:datafieldcontrol runat="server" id="CBCL15_totpct" DatabaseField="CBCL15_totpct" IsReadOnly="true" ShowFieldLabel="False"  RenderReadOnlyAsDiv="true" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
</tr>

</table>

<br/>
<br/>

<table id="Table1" runat="server"  border="1"  bgcolor="#EEEEEE" style="border-style: solid; border-color: #C0C0C0">

<tr>
<td align="center" width = "85px"><b>DSM-Oriented<br/>Scales</b></td>
<td align="center" width = "85px"><u>1. Affective</u></td>
<td align="center" width = "85px"><u>2. Anxiety</u></td>
<td align="center" width = "85px"><u>3. Pervasive Developmental Disorder</u></td>
<td align="center" width = "85px"><u>4. ADHD</u></td>
<td align="center" width = "85px"><u>5. Oppositional Defiant Disorder</u></td>
</tr>

<tr>
<td align="center">Raw score</td>
<td align="center"><def:datafieldcontrol runat="server" id="CBCL15_dsmaffraw"  DatabaseField="CBCL15_dsmaffraw" IsReadOnly="true" ShowFieldLabel="False"  RenderReadOnlyAsDiv="true" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td align="center"><def:datafieldcontrol runat="server" id="CBCL15_dsmanxraw"  DatabaseField="CBCL15_dsmanxraw" IsReadOnly="true" ShowFieldLabel="False"  RenderReadOnlyAsDiv="true" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td align="center"><def:datafieldcontrol runat="server" id="CBCL15_dsmpddraw"  DatabaseField="CBCL15_dsmpddraw" IsReadOnly="true" ShowFieldLabel="False"  RenderReadOnlyAsDiv="true" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td align="center"><def:datafieldcontrol runat="server" id="CBCL15_dsmadhdraw" DatabaseField="CBCL15_dsmadhdraw" IsReadOnly="true" ShowFieldLabel="False"  RenderReadOnlyAsDiv="true" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td align="center"><def:datafieldcontrol runat="server" id="CBCL15_dsmoddraw"  DatabaseField="CBCL15_dsmoddraw" IsReadOnly="true" ShowFieldLabel="False"  RenderReadOnlyAsDiv="true" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
</tr>

<tr>
<td align="center">T score</td>
<td align="center"><def:datafieldcontrol runat="server" id="CBCL15_dsmafft" DatabaseField="CBCL15_dsmafft" IsReadOnly="true" ShowFieldLabel="False"  RenderReadOnlyAsDiv="true" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td align="center"><def:datafieldcontrol runat="server" id="CBCL15_dsmanxt" DatabaseField="CBCL15_dsmanxt" IsReadOnly="true" ShowFieldLabel="False"  RenderReadOnlyAsDiv="true" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td align="center"><def:datafieldcontrol runat="server" id="CBCL15_dsmpddt" DatabaseField="CBCL15_dsmpddt" IsReadOnly="true" ShowFieldLabel="False"  RenderReadOnlyAsDiv="true" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td align="center"><def:datafieldcontrol runat="server" id="CBCL15_dsmadhdt" DatabaseField="CBCL15_dsmadhdt" IsReadOnly="true" ShowFieldLabel="False"  RenderReadOnlyAsDiv="true" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td align="center"><def:datafieldcontrol runat="server" id="CBCL15_dsmoddt" DatabaseField="CBCL15_dsmoddt" IsReadOnly="true" ShowFieldLabel="False"  RenderReadOnlyAsDiv="true" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
</tr>

<tr>
<td align="center">Percentile</td>
<td align="center"><def:datafieldcontrol runat="server" id="CBCL15_dsmaffpct" DatabaseField="CBCL15_dsmaffpct" IsReadOnly="true" ShowFieldLabel="False"  RenderReadOnlyAsDiv="true" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td align="center"><def:datafieldcontrol runat="server" id="CBCL15_dsmanxpct" DatabaseField="CBCL15_dsmanxpct" IsReadOnly="true" ShowFieldLabel="False"  RenderReadOnlyAsDiv="true" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td align="center"><def:datafieldcontrol runat="server" id="CBCL15_dsmpddpct" DatabaseField="CBCL15_dsmpddpct" IsReadOnly="true" ShowFieldLabel="False"  RenderReadOnlyAsDiv="true" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td align="center"><def:datafieldcontrol runat="server" id="CBCL15_dsmadhdpct" DatabaseField="CBCL15_dsmadhdpct" IsReadOnly="true" ShowFieldLabel="False"  RenderReadOnlyAsDiv="true" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td align="center"><def:datafieldcontrol runat="server" id="CBCL15_dsmoddpct" DatabaseField="CBCL15_dsmoddpct" IsReadOnly="true" ShowFieldLabel="False"  RenderReadOnlyAsDiv="true" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
</tr>

</table>

<%--  
<table border = "1">
<tr>
<td align="right"><b><u>Raw score</u></b></td>
<td align="center"><b><u>T-score</u></b></td>
</tr>
<tr><td><br/><u>Narrow-band Scales</u></td></tr><br/>
<tr>
<td><def:datafieldcontrol runat="server" id="CBCL15_s1raw" DatabaseField="CBCL15_s1raw" IsReadOnly="true" ShowFieldLabel="true"  RenderReadOnlyAsDiv="true" FieldLabelWidth="400px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td align="center"><def:datafieldcontrol runat="server" id="CBCL15_s1t" DatabaseField="CBCL15_s1t" IsReadOnly="true" ShowFieldLabel="false"  RenderReadOnlyAsDiv="true" FieldLabelWidth="400px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
</tr>

<tr>
<td><def:datafieldcontrol runat="server" id="CBCL15_s2raw" DatabaseField="CBCL15_s2raw" IsReadOnly="true" ShowFieldLabel="true"  RenderReadOnlyAsDiv="true" FieldLabelWidth="400px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
</td><td align="center"><def:datafieldcontrol runat="server" id="CBCL15_s2t" DatabaseField="CBCL15_s2t" IsReadOnly="true" ShowFieldLabel="false"  RenderReadOnlyAsDiv="true" FieldLabelWidth="400px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
</td></tr>
<tr>
<td><def:datafieldcontrol runat="server" id="CBCL15_s3raw" DatabaseField="CBCL15_s3raw" IsReadOnly="true" ShowFieldLabel="true"  RenderReadOnlyAsDiv="true" FieldLabelWidth="400px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
</td><td align="center"><def:datafieldcontrol runat="server" id="CBCL15_s3t" DatabaseField="CBCL15_s3t" IsReadOnly="true" ShowFieldLabel="false"  RenderReadOnlyAsDiv="true" FieldLabelWidth="400px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
</td></tr>
<tr>
<td><def:datafieldcontrol runat="server" id="CBCL15_s4raw" DatabaseField="CBCL15_s4raw" IsReadOnly="true" ShowFieldLabel="true"  RenderReadOnlyAsDiv="true" FieldLabelWidth="400px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
</td><td align="center"><def:datafieldcontrol runat="server" id="CBCL15_s4t" DatabaseField="CBCL15_s4t" IsReadOnly="true" ShowFieldLabel="false"  RenderReadOnlyAsDiv="true" FieldLabelWidth="400px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
</td></tr>

<tr>
<td><def:datafieldcontrol runat="server" id="CBCL15_s5raw" DatabaseField="CBCL15_s5raw" IsReadOnly="true" ShowFieldLabel="true"  RenderReadOnlyAsDiv="true" FieldLabelWidth="400px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
</td><td align="center"><def:datafieldcontrol runat="server" id="CBCL15_s5t" DatabaseField="CBCL15_s5t" IsReadOnly="true" ShowFieldLabel="false"  RenderReadOnlyAsDiv="true" FieldLabelWidth="400px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
</td></tr>

<tr>
<td><def:datafieldcontrol runat="server" id="CBCL15_s6raw" DatabaseField="CBCL15_s6raw" IsReadOnly="true" ShowFieldLabel="true"  RenderReadOnlyAsDiv="true" FieldLabelWidth="400px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
</td><td align="center"><def:datafieldcontrol runat="server" id="CBCL15_s6t" DatabaseField="CBCL15_s6t" IsReadOnly="true" ShowFieldLabel="false"  RenderReadOnlyAsDiv="true" FieldLabelWidth="400px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
</td></tr>

<tr>
<td><def:datafieldcontrol runat="server" id="CBCL15_s7raw" DatabaseField="CBCL15_s7raw" IsReadOnly="true" ShowFieldLabel="true"  RenderReadOnlyAsDiv="true" FieldLabelWidth="400px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
</td><td align="center"><def:datafieldcontrol runat="server" id="CBCL15_s7t" DatabaseField="CBCL15_s7t" IsReadOnly="true" ShowFieldLabel="false"  RenderReadOnlyAsDiv="true" FieldLabelWidth="400px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
</td></tr>

<tr><td><br/><u>Broad-band Scales</u></td></tr><br/>

<tr>
<td><def:datafieldcontrol runat="server" id="CBCL15_intraw" DatabaseField="CBCL15_intraw" IsReadOnly="true" ShowFieldLabel="true"  RenderReadOnlyAsDiv="true" FieldLabelWidth="400px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td align="center"><def:datafieldcontrol runat="server" id="CBCL15_intt" DatabaseField="CBCL15_intt" IsReadOnly="true" ShowFieldLabel="false"  RenderReadOnlyAsDiv="true" FieldLabelWidth="400px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
</tr>

<tr>
<td><def:datafieldcontrol runat="server" id="CBCL15_extraw" DatabaseField="CBCL15_extraw" IsReadOnly="true" ShowFieldLabel="true"  RenderReadOnlyAsDiv="true" FieldLabelWidth="400px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td align="center"><def:datafieldcontrol runat="server" id="CBCL15_extt" DatabaseField="CBCL15_extt" IsReadOnly="true" ShowFieldLabel="false"  RenderReadOnlyAsDiv="true" FieldLabelWidth="400px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
</tr>

<tr>
<td><def:datafieldcontrol runat="server" id="CBCL15_totraw" DatabaseField="CBCL15_totraw" IsReadOnly="true" ShowFieldLabel="true"  RenderReadOnlyAsDiv="true" FieldLabelWidth="400px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td align="center"><def:datafieldcontrol runat="server" id="CBCL15_tott" DatabaseField="CBCL15_tott" IsReadOnly="true" ShowFieldLabel="false"  RenderReadOnlyAsDiv="true" FieldLabelWidth="400px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
</tr>

</table>
--%>
<def:datafieldcontrol runat="server" id="CBCL15_scrmsg" DatabaseField="CBCL15_scrmsg" IsReadOnly="true" ShowFieldLabel="true"  RenderReadOnlyAsDiv="true" FieldLabelWidth="200px" FieldTextBoxWidth="400px"></def:datafieldcontrol>

<br/>

<br/>
<br/>

<font color="blue"><def:ValueSetLabel ID="CBCL15_001_VS" runat="server"  DatabaseField="CBCL15_001"></def:ValueSetLabel>
</font>
<table>
<tr>
<td style="vertical-align:top">
<def:datafieldcontrol runat="server" id="CBCL15_001" DatabaseField="CBCL15_001" IsEntryField="true" ShowFieldLabel="true"  IsDoubleEntryField="true" FieldLabelWidth="400px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="CBCL15_002" DatabaseField="CBCL15_002" IsEntryField="true" ShowFieldLabel="true"  IsDoubleEntryField="true" FieldLabelWidth="400px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="CBCL15_003" DatabaseField="CBCL15_003" IsEntryField="true" ShowFieldLabel="true"  IsDoubleEntryField="true" FieldLabelWidth="400px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="CBCL15_004" DatabaseField="CBCL15_004" IsEntryField="true" ShowFieldLabel="true"  IsDoubleEntryField="true" FieldLabelWidth="400px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="CBCL15_005" DatabaseField="CBCL15_005" IsEntryField="true" ShowFieldLabel="true"  IsDoubleEntryField="true" FieldLabelWidth="400px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="CBCL15_006" DatabaseField="CBCL15_006" IsEntryField="true" ShowFieldLabel="true"  IsDoubleEntryField="true" FieldLabelWidth="400px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="CBCL15_007" DatabaseField="CBCL15_007" IsEntryField="true" ShowFieldLabel="true"  IsDoubleEntryField="true" FieldLabelWidth="400px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="CBCL15_008" DatabaseField="CBCL15_008" IsEntryField="true" ShowFieldLabel="true"  IsDoubleEntryField="true" FieldLabelWidth="400px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="CBCL15_009" DatabaseField="CBCL15_009" IsEntryField="true" ShowFieldLabel="true"  IsDoubleEntryField="true" FieldLabelWidth="400px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="CBCL15_010" DatabaseField="CBCL15_010" IsEntryField="true" ShowFieldLabel="true"  IsDoubleEntryField="true" FieldLabelWidth="400px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="CBCL15_011" DatabaseField="CBCL15_011" IsEntryField="true" ShowFieldLabel="true"  IsDoubleEntryField="true" FieldLabelWidth="400px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="CBCL15_012" DatabaseField="CBCL15_012" IsEntryField="true" ShowFieldLabel="true"  IsDoubleEntryField="true" FieldLabelWidth="400px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="CBCL15_013" DatabaseField="CBCL15_013" IsEntryField="true" ShowFieldLabel="true"  IsDoubleEntryField="true" FieldLabelWidth="400px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="CBCL15_014" DatabaseField="CBCL15_014" IsEntryField="true" ShowFieldLabel="true"  IsDoubleEntryField="true" FieldLabelWidth="400px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="CBCL15_015" DatabaseField="CBCL15_015" IsEntryField="true" ShowFieldLabel="true"  IsDoubleEntryField="true" FieldLabelWidth="400px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="CBCL15_016" DatabaseField="CBCL15_016" IsEntryField="true" ShowFieldLabel="true"  IsDoubleEntryField="true" FieldLabelWidth="400px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="CBCL15_017" DatabaseField="CBCL15_017" IsEntryField="true" ShowFieldLabel="true"  IsDoubleEntryField="true" FieldLabelWidth="400px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="CBCL15_018" DatabaseField="CBCL15_018" IsEntryField="true" ShowFieldLabel="true"  IsDoubleEntryField="true" FieldLabelWidth="400px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="CBCL15_019" DatabaseField="CBCL15_019" IsEntryField="true" ShowFieldLabel="true"  IsDoubleEntryField="true" FieldLabelWidth="400px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="CBCL15_020" DatabaseField="CBCL15_020" IsEntryField="true" ShowFieldLabel="true"  IsDoubleEntryField="true" FieldLabelWidth="400px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="CBCL15_021" DatabaseField="CBCL15_021" IsEntryField="true" ShowFieldLabel="true"  IsDoubleEntryField="true" FieldLabelWidth="400px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="CBCL15_022" DatabaseField="CBCL15_022" IsEntryField="true" ShowFieldLabel="true"  IsDoubleEntryField="true" FieldLabelWidth="400px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="CBCL15_023" DatabaseField="CBCL15_023" IsEntryField="true" ShowFieldLabel="true"  IsDoubleEntryField="true" FieldLabelWidth="400px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="CBCL15_024" DatabaseField="CBCL15_024" IsEntryField="true" ShowFieldLabel="true"  IsDoubleEntryField="true" FieldLabelWidth="400px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="CBCL15_025" DatabaseField="CBCL15_025" IsEntryField="true" ShowFieldLabel="true"  IsDoubleEntryField="true" FieldLabelWidth="400px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="CBCL15_026" DatabaseField="CBCL15_026" IsEntryField="true" ShowFieldLabel="true"  IsDoubleEntryField="true" FieldLabelWidth="400px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="CBCL15_027" DatabaseField="CBCL15_027" IsEntryField="true" ShowFieldLabel="true"  IsDoubleEntryField="true" FieldLabelWidth="400px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="CBCL15_028" DatabaseField="CBCL15_028" IsEntryField="true" ShowFieldLabel="true"  IsDoubleEntryField="true" FieldLabelWidth="400px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="CBCL15_029" DatabaseField="CBCL15_029" IsEntryField="true" ShowFieldLabel="true"  IsDoubleEntryField="true" FieldLabelWidth="400px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
</td>

<td style="vertical-align:top">

<def:datafieldcontrol runat="server" id="CBCL15_030" DatabaseField="CBCL15_030" IsEntryField="true" ShowFieldLabel="true"  IsDoubleEntryField="true" FieldLabelWidth="400px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="CBCL15_031" DatabaseField="CBCL15_031" IsEntryField="true" ShowFieldLabel="true"  IsDoubleEntryField="true" FieldLabelWidth="400px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="CBCL15_032" DatabaseField="CBCL15_032" IsEntryField="true" ShowFieldLabel="true"  IsDoubleEntryField="true" FieldLabelWidth="400px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="CBCL15_033" DatabaseField="CBCL15_033" IsEntryField="true" ShowFieldLabel="true"  IsDoubleEntryField="true" FieldLabelWidth="400px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="CBCL15_034" DatabaseField="CBCL15_034" IsEntryField="true" ShowFieldLabel="true"  IsDoubleEntryField="true" FieldLabelWidth="400px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="CBCL15_035" DatabaseField="CBCL15_035" IsEntryField="true" ShowFieldLabel="true"  IsDoubleEntryField="true" FieldLabelWidth="400px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="CBCL15_036" DatabaseField="CBCL15_036" IsEntryField="true" ShowFieldLabel="true"  IsDoubleEntryField="true" FieldLabelWidth="400px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="CBCL15_037" DatabaseField="CBCL15_037" IsEntryField="true" ShowFieldLabel="true"  IsDoubleEntryField="true" FieldLabelWidth="400px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="CBCL15_038" DatabaseField="CBCL15_038" IsEntryField="true" ShowFieldLabel="true"  IsDoubleEntryField="true" FieldLabelWidth="400px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="CBCL15_039" DatabaseField="CBCL15_039" IsEntryField="true" ShowFieldLabel="true"  IsDoubleEntryField="true" FieldLabelWidth="400px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="CBCL15_040" DatabaseField="CBCL15_040" IsEntryField="true" ShowFieldLabel="true"  IsDoubleEntryField="true" FieldLabelWidth="400px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="CBCL15_041" DatabaseField="CBCL15_041" IsEntryField="true" ShowFieldLabel="true"  IsDoubleEntryField="true" FieldLabelWidth="400px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="CBCL15_042" DatabaseField="CBCL15_042" IsEntryField="true" ShowFieldLabel="true"  IsDoubleEntryField="true" FieldLabelWidth="400px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="CBCL15_043" DatabaseField="CBCL15_043" IsEntryField="true" ShowFieldLabel="true"  IsDoubleEntryField="true" FieldLabelWidth="400px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="CBCL15_044" DatabaseField="CBCL15_044" IsEntryField="true" ShowFieldLabel="true"  IsDoubleEntryField="true" FieldLabelWidth="400px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="CBCL15_045" DatabaseField="CBCL15_045" IsEntryField="true" ShowFieldLabel="true"  IsDoubleEntryField="true" FieldLabelWidth="400px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="CBCL15_046" DatabaseField="CBCL15_046" IsEntryField="true" ShowFieldLabel="true"  IsDoubleEntryField="true" FieldLabelWidth="400px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="CBCL15_047" DatabaseField="CBCL15_047" IsEntryField="true" ShowFieldLabel="true"  IsDoubleEntryField="true" FieldLabelWidth="400px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="CBCL15_048" DatabaseField="CBCL15_048" IsEntryField="true" ShowFieldLabel="true"  IsDoubleEntryField="true" FieldLabelWidth="400px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="CBCL15_049" DatabaseField="CBCL15_049" IsEntryField="true" ShowFieldLabel="true"  IsDoubleEntryField="true" FieldLabelWidth="400px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="CBCL15_050" DatabaseField="CBCL15_050" IsEntryField="true" ShowFieldLabel="true"  IsDoubleEntryField="true" FieldLabelWidth="400px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="CBCL15_051" DatabaseField="CBCL15_051" IsEntryField="true" ShowFieldLabel="true"  IsDoubleEntryField="true" FieldLabelWidth="400px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="CBCL15_052" DatabaseField="CBCL15_052" IsEntryField="true" ShowFieldLabel="true"  IsDoubleEntryField="true" FieldLabelWidth="400px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="CBCL15_053" DatabaseField="CBCL15_053" IsEntryField="true" ShowFieldLabel="true"  IsDoubleEntryField="true" FieldLabelWidth="400px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="CBCL15_054" DatabaseField="CBCL15_054" IsEntryField="true" ShowFieldLabel="true"  IsDoubleEntryField="true" FieldLabelWidth="400px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
</td>
</tr>

<tr>
<td ><br/><b><u>Page 2</u></b></td><td></td>
</tr>
<tr>
<td style="vertical-align:top">
<def:datafieldcontrol runat="server" id="CBCL15_055" DatabaseField="CBCL15_055" IsEntryField="true" ShowFieldLabel="true"  IsDoubleEntryField="true" FieldLabelWidth="400px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="CBCL15_056" DatabaseField="CBCL15_056" IsEntryField="true" ShowFieldLabel="true"  IsDoubleEntryField="true" FieldLabelWidth="400px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="CBCL15_057" DatabaseField="CBCL15_057" IsEntryField="true" ShowFieldLabel="true"  IsDoubleEntryField="true" FieldLabelWidth="400px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="CBCL15_058" DatabaseField="CBCL15_058" IsEntryField="true" ShowFieldLabel="true"  IsDoubleEntryField="true" FieldLabelWidth="400px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="CBCL15_059" DatabaseField="CBCL15_059" IsEntryField="true" ShowFieldLabel="true"  IsDoubleEntryField="true" FieldLabelWidth="400px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="CBCL15_060" DatabaseField="CBCL15_060" IsEntryField="true" ShowFieldLabel="true"  IsDoubleEntryField="true" FieldLabelWidth="400px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="CBCL15_061" DatabaseField="CBCL15_061" IsEntryField="true" ShowFieldLabel="true"  IsDoubleEntryField="true" FieldLabelWidth="400px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="CBCL15_062" DatabaseField="CBCL15_062" IsEntryField="true" ShowFieldLabel="true"  IsDoubleEntryField="true" FieldLabelWidth="400px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="CBCL15_063" DatabaseField="CBCL15_063" IsEntryField="true" ShowFieldLabel="true"  IsDoubleEntryField="true" FieldLabelWidth="400px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="CBCL15_064" DatabaseField="CBCL15_064" IsEntryField="true" ShowFieldLabel="true"  IsDoubleEntryField="true" FieldLabelWidth="400px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="CBCL15_065" DatabaseField="CBCL15_065" IsEntryField="true" ShowFieldLabel="true"  IsDoubleEntryField="true" FieldLabelWidth="400px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="CBCL15_066" DatabaseField="CBCL15_066" IsEntryField="true" ShowFieldLabel="true"  IsDoubleEntryField="true" FieldLabelWidth="400px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="CBCL15_067" DatabaseField="CBCL15_067" IsEntryField="true" ShowFieldLabel="true"  IsDoubleEntryField="true" FieldLabelWidth="400px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="CBCL15_068" DatabaseField="CBCL15_068" IsEntryField="true" ShowFieldLabel="true"  IsDoubleEntryField="true" FieldLabelWidth="400px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="CBCL15_069" DatabaseField="CBCL15_069" IsEntryField="true" ShowFieldLabel="true"  IsDoubleEntryField="true" FieldLabelWidth="400px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="CBCL15_070" DatabaseField="CBCL15_070" IsEntryField="true" ShowFieldLabel="true"  IsDoubleEntryField="true" FieldLabelWidth="400px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="CBCL15_071" DatabaseField="CBCL15_071" IsEntryField="true" ShowFieldLabel="true"  IsDoubleEntryField="true" FieldLabelWidth="400px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="CBCL15_072" DatabaseField="CBCL15_072" IsEntryField="true" ShowFieldLabel="true"  IsDoubleEntryField="true" FieldLabelWidth="400px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="CBCL15_073" DatabaseField="CBCL15_073" IsEntryField="true" ShowFieldLabel="true"  IsDoubleEntryField="true" FieldLabelWidth="400px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="CBCL15_074" DatabaseField="CBCL15_074" IsEntryField="true" ShowFieldLabel="true"  IsDoubleEntryField="true" FieldLabelWidth="400px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="CBCL15_075" DatabaseField="CBCL15_075" IsEntryField="true" ShowFieldLabel="true"  IsDoubleEntryField="true" FieldLabelWidth="400px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="CBCL15_076" DatabaseField="CBCL15_076" IsEntryField="true" ShowFieldLabel="true"  IsDoubleEntryField="true" FieldLabelWidth="400px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="CBCL15_077" DatabaseField="CBCL15_077" IsEntryField="true" ShowFieldLabel="true"  IsDoubleEntryField="true" FieldLabelWidth="400px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="CBCL15_078" DatabaseField="CBCL15_078" IsEntryField="true" ShowFieldLabel="true"  IsDoubleEntryField="true" FieldLabelWidth="400px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
</td>
<td style="vertical-align:top">

<def:datafieldcontrol runat="server" id="CBCL15_079" DatabaseField="CBCL15_079" IsEntryField="true" ShowFieldLabel="true"  IsDoubleEntryField="true" FieldLabelWidth="400px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="CBCL15_080" DatabaseField="CBCL15_080" IsEntryField="true" ShowFieldLabel="true"  IsDoubleEntryField="true" FieldLabelWidth="400px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="CBCL15_081" DatabaseField="CBCL15_081" IsEntryField="true" ShowFieldLabel="true"  IsDoubleEntryField="true" FieldLabelWidth="400px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="CBCL15_082" DatabaseField="CBCL15_082" IsEntryField="true" ShowFieldLabel="true"  IsDoubleEntryField="true" FieldLabelWidth="400px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="CBCL15_083" DatabaseField="CBCL15_083" IsEntryField="true" ShowFieldLabel="true"  IsDoubleEntryField="true" FieldLabelWidth="400px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="CBCL15_084" DatabaseField="CBCL15_084" IsEntryField="true" ShowFieldLabel="true"  IsDoubleEntryField="true" FieldLabelWidth="400px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="CBCL15_085" DatabaseField="CBCL15_085" IsEntryField="true" ShowFieldLabel="true"  IsDoubleEntryField="true" FieldLabelWidth="400px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="CBCL15_086" DatabaseField="CBCL15_086" IsEntryField="true" ShowFieldLabel="true"  IsDoubleEntryField="true" FieldLabelWidth="400px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="CBCL15_087" DatabaseField="CBCL15_087" IsEntryField="true" ShowFieldLabel="true"  IsDoubleEntryField="true" FieldLabelWidth="400px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="CBCL15_088" DatabaseField="CBCL15_088" IsEntryField="true" ShowFieldLabel="true"  IsDoubleEntryField="true" FieldLabelWidth="400px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="CBCL15_089" DatabaseField="CBCL15_089" IsEntryField="true" ShowFieldLabel="true"  IsDoubleEntryField="true" FieldLabelWidth="400px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="CBCL15_090" DatabaseField="CBCL15_090" IsEntryField="true" ShowFieldLabel="true"  IsDoubleEntryField="true" FieldLabelWidth="400px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="CBCL15_091" DatabaseField="CBCL15_091" IsEntryField="true" ShowFieldLabel="true"  IsDoubleEntryField="true" FieldLabelWidth="400px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="CBCL15_092" DatabaseField="CBCL15_092" IsEntryField="true" ShowFieldLabel="true"  IsDoubleEntryField="true" FieldLabelWidth="400px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="CBCL15_093" DatabaseField="CBCL15_093" IsEntryField="true" ShowFieldLabel="true"  IsDoubleEntryField="true" FieldLabelWidth="400px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="CBCL15_094" DatabaseField="CBCL15_094" IsEntryField="true" ShowFieldLabel="true"  IsDoubleEntryField="true" FieldLabelWidth="400px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="CBCL15_095" DatabaseField="CBCL15_095" IsEntryField="true" ShowFieldLabel="true"  IsDoubleEntryField="true" FieldLabelWidth="400px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="CBCL15_096" DatabaseField="CBCL15_096" IsEntryField="true" ShowFieldLabel="true"  IsDoubleEntryField="true" FieldLabelWidth="400px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="CBCL15_097" DatabaseField="CBCL15_097" IsEntryField="true" ShowFieldLabel="true"  IsDoubleEntryField="true" FieldLabelWidth="400px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="CBCL15_098" DatabaseField="CBCL15_098" IsEntryField="true" ShowFieldLabel="true"  IsDoubleEntryField="true" FieldLabelWidth="400px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="CBCL15_099" DatabaseField="CBCL15_099" IsEntryField="true" ShowFieldLabel="true"  IsDoubleEntryField="true" FieldLabelWidth="400px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="CBCL15_100" DatabaseField="CBCL15_100" IsEntryField="true" ShowFieldLabel="true"  IsDoubleEntryField="true" FieldLabelWidth="400px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="CBCL15_100des" DatabaseField="CBCL15_100des" IsEntryField="true" ShowFieldLabel="true"  IsDoubleEntryField="true" FieldLabelWidth="400px" FieldTextBoxWidth="150px"></def:datafieldcontrol>
</td>
</tr>
</table>
<br/>
<br/>

<table>

<tr><td><b><u>Language Development Survey for ages 18-35 months</u></b></td></tr>

<tr>
<td>
<def:datafieldcontrol runat="server" id="CBCL15_dev1" DatabaseField="CBCL15_dev1" IsEntryField="true" ShowFieldLabel="true"  IsDoubleEntryField="true" FieldLabelWidth="400px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
</td>
<td><font color="blue"><def:ValueSetLabel ID="CBCL15_dev1_VS" runat="server"  DatabaseField="CBCL15_dev1"></font></def:ValueSetLabel></td>
</tr>
<tr>
<td>
<def:datafieldcontrol runat="server" id="CBCL15_dev1wks" DatabaseField="CBCL15_dev1wks" IsEntryField="true" ShowFieldLabel="true"  IsDoubleEntryField="true" FieldLabelWidth="400px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
</td>
</tr>
<tr border = "1">
<td>
<br/>
<br/>
<def:datafieldcontrol runat="server" id="CBCL15_dev2lbs" DatabaseField="CBCL15_dev2lbs" IsEntryField="true" ShowFieldLabel="true"  IsDoubleEntryField="true" FieldLabelWidth="400px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="CBCL15_dev2oz" DatabaseField="CBCL15_dev2oz" IsEntryField="true" ShowFieldLabel="true"  IsDoubleEntryField="true" FieldLabelWidth="400px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="CBCL15_dev2grams" DatabaseField="CBCL15_dev2grams" IsEntryField="true" ShowFieldLabel="true"  IsDoubleEntryField="true" FieldLabelWidth="400px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
</td>
<td></td>
</tr>
<td>
<br/>
<br/>
<def:datafieldcontrol runat="server" id="CBCL15_dev3" DatabaseField="CBCL15_dev3" IsEntryField="true" ShowFieldLabel="true"  IsDoubleEntryField="true" FieldLabelWidth="400px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
</td>
<td><font color="blue">
<def:ValueSetLabel ID="CBCL15_dev3_VS" runat="server"  DatabaseField="CBCL15_dev3"></font></def:ValueSetLabel>
</td>
</tr>
<tr>
    <td>
<br/>
<br/>
    <def:datafieldcontrol runat="server" id="CBCL15_dev4" DatabaseField="CBCL15_dev4" IsEntryField="true" ShowFieldLabel="true"  IsDoubleEntryField="true" FieldLabelWidth="400px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    </td>
    <td><font color="blue"><def:ValueSetLabel ID="CBCL15_dev4_VS" runat="server"  DatabaseField="CBCL15_dev4"></font></def:ValueSetLabel>
</td>
</tr>
<tr>
<td>
<def:datafieldcontrol runat="server" id="CBCL15_dev4lang1" DatabaseField="CBCL15_dev4lang1" IsEntryField="true" ShowFieldLabel="true"  IsDoubleEntryField="false" FieldLabelWidth="200px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="50"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="CBCL15_dev4lang2" DatabaseField="CBCL15_dev4lang2" IsEntryField="true" ShowFieldLabel="true"  IsDoubleEntryField="false" FieldLabelWidth="200px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="50"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="CBCL15_dev4lang3" DatabaseField="CBCL15_dev4lang3" IsEntryField="true" ShowFieldLabel="true"  IsDoubleEntryField="false" FieldLabelWidth="200px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="50"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="CBCL15_dev4lang4" DatabaseField="CBCL15_dev4lang4" IsEntryField="true" ShowFieldLabel="true"  IsDoubleEntryField="false" FieldLabelWidth="200px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="50"></def:datafieldcontrol>
</td>
</tr>
<tr>
<td>
<br/>
<br/>
<def:datafieldcontrol runat="server" id="CBCL15_dev5" DatabaseField="CBCL15_dev5" IsEntryField="true" ShowFieldLabel="true"  IsDoubleEntryField="true" FieldLabelWidth="400px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
</td>
<td><font color="blue"><def:ValueSetLabel ID="CBCL15_dev5_VS" runat="server"  DatabaseField="CBCL15_dev5"></font></def:ValueSetLabel>
</td>
</tr>
<tr>
<td><def:datafieldcontrol runat="server" id="CBCL15_dev5relat" DatabaseField="CBCL15_dev5relat" IsEntryField="true" ShowFieldLabel="true"  IsDoubleEntryField="true" FieldLabelWidth="200px" FieldTextBoxWidth="200px"></def:datafieldcontrol>
</td>
</tr>

<tr>
<td>
<br/>
<br/>
<def:datafieldcontrol runat="server" id="CBCL15_dev6" DatabaseField="CBCL15_dev6" IsEntryField="true" ShowFieldLabel="true"  IsDoubleEntryField="true" FieldLabelWidth="400px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
</td>
<td><font color="blue"><def:ValueSetLabel ID="CBCL15_dev6_VS" runat="server"  DatabaseField="CBCL15_dev6"></font></def:ValueSetLabel>
</td>
</tr>
<tr>
</td>
<td><def:datafieldcontrol runat="server" id="CBCL15_dev6why" DatabaseField="CBCL15_dev6why" IsEntryField="true" ShowFieldLabel="true"  IsDoubleEntryField="false" FieldLabelWidth="200px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="200"></def:datafieldcontrol>
</td>
</tr>


<tr>
<td>
<br/>
<br/>
<def:datafieldcontrol runat="server" id="CBCL15_dev7" DatabaseField="CBCL15_dev7" IsEntryField="true" ShowFieldLabel="true"  IsDoubleEntryField="true" FieldLabelWidth="400px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
</td>
<td><font color="blue"><def:ValueSetLabel ID="CBCL15_dev7_VS" runat="server"  DatabaseField="CBCL15_dev7"></font></def:ValueSetLabel>

</td>
</tr>

<tr>
<td>
<br/>
<br/>
<def:datafieldcontrol runat="server" id="CBCL15_dev8" DatabaseField="CBCL15_dev8" IsEntryField="true" ShowFieldLabel="true"  IsDoubleEntryField="true" FieldLabelWidth="400px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
</td>
<td><font color="blue"><def:ValueSetLabel ID="CBCL15_dev8_VS" runat="server"  DatabaseField="CBCL15_dev8"></font></def:ValueSetLabel>

</td>
</tr>

</tr>

<tr border = "1">
<td colspan="3">
<def:datafieldcontrol runat="server" id="CBCL15_dev8phr1" DatabaseField="CBCL15_dev8phr1" IsEntryField="true" ShowFieldLabel="true"  IsDoubleEntryField="true" FieldLabelWidth="200px" FieldTextBoxWidth="300px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="CBCL15_dev8phr2" DatabaseField="CBCL15_dev8phr2" IsEntryField="true" ShowFieldLabel="true"  IsDoubleEntryField="true" FieldLabelWidth="200px" FieldTextBoxWidth="300px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="CBCL15_dev8phr3" DatabaseField="CBCL15_dev8phr3" IsEntryField="true" ShowFieldLabel="true"  IsDoubleEntryField="true" FieldLabelWidth="200px" FieldTextBoxWidth="300px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="CBCL15_dev8phr4" DatabaseField="CBCL15_dev8phr4" IsEntryField="true" ShowFieldLabel="true"  IsDoubleEntryField="true" FieldLabelWidth="200px" FieldTextBoxWidth="300px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="CBCL15_dev8phr5" DatabaseField="CBCL15_dev8phr5" IsEntryField="true" ShowFieldLabel="true"  IsDoubleEntryField="true" FieldLabelWidth="200px" FieldTextBoxWidth="300px"></def:datafieldcontrol>
</td>

</tr>
</table>

<br/>
<br/>
<br/>


<def:datafieldcontrol runat="server" id="created" DatabaseField="created" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="400px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="createdBy" DatabaseField="createdBy" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="400px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="50"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="updated" DatabaseField="updated" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="400px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="updatedBy" DatabaseField="updatedBy" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="400px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="50"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="scored" DatabaseField="scored" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="400px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="scoredBy" DatabaseField="scoredBy" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="400px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="50"></def:datafieldcontrol>
</asp:Panel>

</asp:Content>
