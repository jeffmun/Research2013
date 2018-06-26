<%@ Register TagPrefix="def" Namespace="DataEntryFramework3" %> 
<%@ Page language="c#" MasterPageFile="~/UWAC.master"  Title="TRF Data Entry" %>
<asp:Content ID="Content1" ContentPlaceHolderID="oBodyPlaceHolder" runat="server">

<def:dataentrycontroller id="DataEntryController1" runat="server" DatabaseTable="ALL_TRF" PrimaryKeyField="trf_pk">
</def:dataentrycontroller>
<def:datafieldcontrol runat="server" id="id" DatabaseField="id" IsInsertField="true" FieldLabelWidth="300px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="15"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="indexnum" DatabaseField="indexnum" IsInsertField="true" FieldTextBoxTextDefault="1" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>

<br/>
<br/>

<asp:Panel   id="mainPanel" Runat="server">

<table border = "0">
<tr><td>
<def:datafieldcontrol runat="server" id="trdate" DatabaseField="trdate" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FormatString="{0:d}"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="trsex" DatabaseField="trsex" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="300px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="50"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="trgrade" DatabaseField="trgrade" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="trageyr" DatabaseField="trageyr" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="tragemos" DatabaseField="tragemos" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="trageym" DatabaseField="trageym" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="300px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="50"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="trclin" DatabaseField="trclin" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="300px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="50"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="trgen" DatabaseField="trgen" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="trfawork" DatabaseField="trfawork" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="300px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="50"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="trmowork" DatabaseField="trmowork" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="300px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="50"></def:datafieldcontrol>
</td>
</tr>

<tr>
<td><def:datafieldcontrol runat="server" id="trrole" DatabaseField="trrole" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td><font color="blue"><def:ValueSetLabel ID="ValueSetLabel_trrole" runat="server"  DatabaseField="trrole"></def:ValueSetLabel></font>
</td>
</tr> 
<tr>
<def:datafieldcontrol runat="server" id="trrole_desc" DatabaseField="trrole_desc" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="300px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="50"></def:datafieldcontrol>
</tr> 

</table>


<br/>

<br/>
<br/>
<table >
<tr>
<td bgcolor="#BBD1FF">

<table  >
<tr valign="bottom">
<td width="130px"><b><u>Syndrome Scales</u></b></td>
<td width="90px"><u>I. Anxious/ Depressed</u></td>
<td width="90px"><u>II. Withdrawn/ Depressed</u></td>  
<td width="90px"><u>III. Somatic Complaints</u></td>
<td width="90px"><u>IV. Social Problems</u></td>
<td width="90px"><u>V. Thought Problems</u></td>
<td width="90px"><u>VI. Attention Problems</u></td>  
<td width="90px"><u>VII. Rule-Breaking Behavior</u></td>  
<td width="90px"><u>VIII. Aggressive Behavior</u></td>
</tr>

<tr>
<td>Raw score</td>
<td><def:datafieldcontrol runat="server" id="trS1Tot" DatabaseField="trS1Tot" ShowFieldLabel="false" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td><def:datafieldcontrol runat="server" id="trS2Tot" DatabaseField="trS2Tot" ShowFieldLabel="false" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td><def:datafieldcontrol runat="server" id="trS3Tot" DatabaseField="trS3Tot" ShowFieldLabel="false" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td><def:datafieldcontrol runat="server" id="trS4Tot" DatabaseField="trS4Tot" ShowFieldLabel="false" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td><def:datafieldcontrol runat="server" id="trS5Tot" DatabaseField="trS5Tot" ShowFieldLabel="false" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td><def:datafieldcontrol runat="server" id="trS6Tot" DatabaseField="trS6Tot" ShowFieldLabel="false" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td><def:datafieldcontrol runat="server" id="trS7Tot" DatabaseField="trS7Tot" ShowFieldLabel="false" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td><def:datafieldcontrol runat="server" id="trS8Tot" DatabaseField="trS8Tot" ShowFieldLabel="false" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>

</tr>

<tr>
<td>T score</td>
<td><def:datafieldcontrol runat="server" id="trS1t" DatabaseField="trS1T" ShowFieldLabel="false" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td><def:datafieldcontrol runat="server" id="trS2t" DatabaseField="trS2T" ShowFieldLabel="false" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td><def:datafieldcontrol runat="server" id="trS3t" DatabaseField="trS3T" ShowFieldLabel="false" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td><def:datafieldcontrol runat="server" id="trS4t" DatabaseField="trS4T" ShowFieldLabel="false" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td><def:datafieldcontrol runat="server" id="trS5t" DatabaseField="trS5T" ShowFieldLabel="false" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td><def:datafieldcontrol runat="server" id="trS6t" DatabaseField="trS6T" ShowFieldLabel="false" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td><def:datafieldcontrol runat="server" id="trS7t" DatabaseField="trS7T" ShowFieldLabel="false" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td><def:datafieldcontrol runat="server" id="trS8t" DatabaseField="trS8T" ShowFieldLabel="false" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>

</tr>

<tr>
<td>Percetile</td>
<td><def:datafieldcontrol runat="server" id="trS1Pct" DatabaseField="trS1Pct" ShowFieldLabel="false" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td><def:datafieldcontrol runat="server" id="trS2Pct" DatabaseField="trS2Pct" ShowFieldLabel="false" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td><def:datafieldcontrol runat="server" id="trS3Pct" DatabaseField="trS3Pct" ShowFieldLabel="false" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td><def:datafieldcontrol runat="server" id="trS4Pct" DatabaseField="trS4Pct" ShowFieldLabel="false" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td><def:datafieldcontrol runat="server" id="trS5Pct" DatabaseField="trS5Pct" ShowFieldLabel="false" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td><def:datafieldcontrol runat="server" id="trS6Pct" DatabaseField="trS6Pct" ShowFieldLabel="false" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td><def:datafieldcontrol runat="server" id="trS7Pct" DatabaseField="trS7Pct" ShowFieldLabel="false" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td><def:datafieldcontrol runat="server" id="trS8Pct" DatabaseField="trS8Pct" ShowFieldLabel="false" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
</tr>


<tr>
<td>Range</td>
<td><def:datafieldcontrol runat="server" id="trS1R" DatabaseField="trS1R" ShowFieldLabel="false" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td><def:datafieldcontrol runat="server" id="trS2R" DatabaseField="trS2R" ShowFieldLabel="false" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td><def:datafieldcontrol runat="server" id="trS3R" DatabaseField="trS3R" ShowFieldLabel="false" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td><def:datafieldcontrol runat="server" id="trS4R" DatabaseField="trS4R" ShowFieldLabel="false" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td><def:datafieldcontrol runat="server" id="trS5R" DatabaseField="trS5R" ShowFieldLabel="false" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td><def:datafieldcontrol runat="server" id="trS6R" DatabaseField="trS6R" ShowFieldLabel="false" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td><def:datafieldcontrol runat="server" id="trS7R" DatabaseField="trS7R" ShowFieldLabel="false" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td><def:datafieldcontrol runat="server" id="trS8R" DatabaseField="trS8R" ShowFieldLabel="false" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>

</tr>

</table>

<br/>

<table  >
<tr valign="bottom">
<td width="130px"><b><u>Summary Scales</u></b></td>
<td  width="90px"><u>Internalizing</u></td>
<td  width="90px"><u>Externalizing</u></td>  
<td  width="90px"><u>Total Problems</u></td>
</tr>             
                  
<tr>              
<td>Raw score</td>
<td><def:datafieldcontrol runat="server" id="trIntTot" DatabaseField="trIntTot" ShowFieldLabel="false" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td><def:datafieldcontrol runat="server" id="trExtTot" DatabaseField="trExtTot" ShowFieldLabel="false" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td><def:datafieldcontrol runat="server" id="trTotTot" DatabaseField="trTotTot" ShowFieldLabel="false" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
</tr>

<tr>
<td>T score</td>
<td><def:datafieldcontrol runat="server" id="trIntt" DatabaseField="trIntT" ShowFieldLabel="false" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td><def:datafieldcontrol runat="server" id="trExtt" DatabaseField="trExtT" ShowFieldLabel="false" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td><def:datafieldcontrol runat="server" id="trTott" DatabaseField="trTotT" ShowFieldLabel="false" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
</tr>

<tr>
<td>Percetile</td>
<td><def:datafieldcontrol runat="server" id="trIntPct" DatabaseField="trIntPct" ShowFieldLabel="false" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td><def:datafieldcontrol runat="server" id="trExtPct" DatabaseField="trExtPct" ShowFieldLabel="false" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td><def:datafieldcontrol runat="server" id="trTotPct" DatabaseField="trTotPct" ShowFieldLabel="false" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
</tr>


<tr>
<td>Range</td>
<td><def:datafieldcontrol runat="server" id="trIntR" DatabaseField="trIntR" ShowFieldLabel="false" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td><def:datafieldcontrol runat="server" id="trExtR" DatabaseField="trExtR" ShowFieldLabel="false" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td><def:datafieldcontrol runat="server" id="trTotR" DatabaseField="trTotR" ShowFieldLabel="false" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
</tr>

</table>

<br/>
<br/>

<table  >
<tr valign="bottom">
<td width="130px"><b><u>DSM-oriented Scales</u></b></td>
<td width="90px"><u>Affective problems</u></td>
<td width="90px"><u>Anxiety problems</u></td>  
<td width="90px"><u>Somatic problems</u></td>  
<td width="90px"><u>ADHD</u></td>
<td width="90px"><u>Oppositional</u></td>
<td width="90px"><u>Conduct problems</u></td>
<td width="90px"><u>Inattentive</u></td>  
<td width="90px"><u>Hyperactive-Impulsive</u></td>  
</tr>

<tr>
<td>Raw score</td>
<td><def:datafieldcontrol runat="server" id="trDSMaffTot" DatabaseField="trDSMaffTot" ShowFieldLabel="false" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td><def:datafieldcontrol runat="server" id="trDSManxTot" DatabaseField="trDSManxTot" ShowFieldLabel="false" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td><def:datafieldcontrol runat="server" id="trDSMsomTot" DatabaseField="trDSMsomTot" ShowFieldLabel="false" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td><def:datafieldcontrol runat="server" id="trDSMadhdTot" DatabaseField="trDSMadhdTot" ShowFieldLabel="false" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td><def:datafieldcontrol runat="server" id="trDSMoppTot" DatabaseField="trDSMoppTot" ShowFieldLabel="false" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td><def:datafieldcontrol runat="server" id="trDSMcdTot" DatabaseField="trDSMcdTot" ShowFieldLabel="false" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td><def:datafieldcontrol runat="server" id="trDSMinatTot" DatabaseField="trDSMinatTot" ShowFieldLabel="false" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td><def:datafieldcontrol runat="server" id="trDSMhypTot" DatabaseField="trDSMhypTot" ShowFieldLabel="false" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>

</tr>

<tr>
<td>T score</td>
<td><def:datafieldcontrol runat="server" id="trDSMaffT" DatabaseField="trDSMaffT" ShowFieldLabel="false" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td><def:datafieldcontrol runat="server" id="trDSManxT" DatabaseField="trDSManxT" ShowFieldLabel="false" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td><def:datafieldcontrol runat="server" id="trDSMsomT" DatabaseField="trDSMsomT" ShowFieldLabel="false" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td><def:datafieldcontrol runat="server" id="trDSMadhdT" DatabaseField="trDSMadhdT" ShowFieldLabel="false" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td><def:datafieldcontrol runat="server" id="trDSMoppT" DatabaseField="trDSMoppT" ShowFieldLabel="false" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td><def:datafieldcontrol runat="server" id="trDSMcdT" DatabaseField="trDSMcdT" ShowFieldLabel="false" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td><def:datafieldcontrol runat="server" id="trDSMinatT" DatabaseField="trDSMinatT" ShowFieldLabel="false" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td><def:datafieldcontrol runat="server" id="trDSMhypT" DatabaseField="trDSMhypT" ShowFieldLabel="false" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>

</tr>

<tr>
<td>Percetile</td>
<td><def:datafieldcontrol runat="server" id="trDSMaffPct" DatabaseField="trDSMaffPct" ShowFieldLabel="false" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td><def:datafieldcontrol runat="server" id="trDSManxPct" DatabaseField="trDSManxPct" ShowFieldLabel="false" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td><def:datafieldcontrol runat="server" id="trDSMsomPct" DatabaseField="trDSMsomPct" ShowFieldLabel="false" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td><def:datafieldcontrol runat="server" id="trDSMadhdPct" DatabaseField="trDSMadhdPct" ShowFieldLabel="false" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td><def:datafieldcontrol runat="server" id="trDSMoppPct" DatabaseField="trDSMoppPct" ShowFieldLabel="false" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td><def:datafieldcontrol runat="server" id="trDSMcdPct" DatabaseField="trDSMcdPct" ShowFieldLabel="false" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td><def:datafieldcontrol runat="server" id="trDSMinatPct" DatabaseField="trDSMinatPct" ShowFieldLabel="false" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td><def:datafieldcontrol runat="server" id="trDSMhypPct" DatabaseField="trDSMhypPct" ShowFieldLabel="false" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
</tr>


<tr>
<td>Range</td>
<td><def:datafieldcontrol runat="server" id="trDSMaffR" DatabaseField="trDSMaffR" ShowFieldLabel="false" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td><def:datafieldcontrol runat="server" id="trDSManxR" DatabaseField="trDSManxR" ShowFieldLabel="false" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td><def:datafieldcontrol runat="server" id="trDSMsomR" DatabaseField="trDSMsomR" ShowFieldLabel="false" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td><def:datafieldcontrol runat="server" id="trDSMadhdR" DatabaseField="trDSMadhdR" ShowFieldLabel="false" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td><def:datafieldcontrol runat="server" id="trDSMoppR" DatabaseField="trDSMoppR" ShowFieldLabel="false" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td><def:datafieldcontrol runat="server" id="trDSMcdR" DatabaseField="trDSMcdR" ShowFieldLabel="false" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td><def:datafieldcontrol runat="server" id="trDSMinatR" DatabaseField="trDSMinatR" ShowFieldLabel="false" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td><def:datafieldcontrol runat="server" id="trDSMhypR" DatabaseField="trDSMhypR" ShowFieldLabel="false" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>

</tr>

</table>


<br/>
<br/>


<table  >
<tr valign="bottom">
<td width="130px"><b><u>Adaptive Functioning Profile</u></b></td>
<td width="90px"><u>Academic performance</u></td>
<td width="90px"><u>Working hard</u></td>  
<td width="90px"><u>Behaving appropriately</u></td>  
<td width="90px"><u>Learning</u></td>
<td width="90px"><u>Happy</u></td>
<td width="90px"><u>Sum of items</u></td>
</tr>


<tr>
<td>Raw score</td>
<td><def:datafieldcontrol runat="server" id="TRAF_acadperf" DatabaseField="TRAF_acadperf" ShowFieldLabel="false" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px" FormatString="{0:F2}"></def:datafieldcontrol></td>
<td><def:datafieldcontrol runat="server" id="TRAF_workhard" DatabaseField="TRAF_workhard" ShowFieldLabel="false" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td><def:datafieldcontrol runat="server" id="TRAF_behavapp" DatabaseField="TRAF_behavapp" ShowFieldLabel="false" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td><def:datafieldcontrol runat="server" id="TRAF_learn" DatabaseField="TRAF_learn" ShowFieldLabel="false" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td><def:datafieldcontrol runat="server" id="TRAF_happy" DatabaseField="TRAF_happy" ShowFieldLabel="false" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td><def:datafieldcontrol runat="server" id="TRAF_sumitems" DatabaseField="TRAF_sumitems" ShowFieldLabel="false" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
</tr>

<tr>
<td>T score</td>
<td><def:datafieldcontrol runat="server" id="TRAF_acadperfT" DatabaseField="TRAF_acadperfT" ShowFieldLabel="false" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td><def:datafieldcontrol runat="server" id="TRAF_workhardT" DatabaseField="TRAF_workhardT" ShowFieldLabel="false" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td><def:datafieldcontrol runat="server" id="TRAF_behavappT" DatabaseField="TRAF_behavappT" ShowFieldLabel="false" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td><def:datafieldcontrol runat="server" id="TRAF_learnT" DatabaseField="TRAF_learnT" ShowFieldLabel="false" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td><def:datafieldcontrol runat="server" id="TRAF_happyT" DatabaseField="TRAF_happyT" ShowFieldLabel="false" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td><def:datafieldcontrol runat="server" id="TRAF_sumitemsT" DatabaseField="TRAF_sumitemsT" ShowFieldLabel="false" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>

</tr>

<tr>
<td>Percetile</td>
<td><def:datafieldcontrol runat="server" id="TRAF_acadperfPct" DatabaseField="TRAF_acadperfPct" ShowFieldLabel="false" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td><def:datafieldcontrol runat="server" id="TRAF_workhardPct" DatabaseField="TRAF_workhardPct" ShowFieldLabel="false" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td><def:datafieldcontrol runat="server" id="TRAF_behavappPct" DatabaseField="TRAF_behavappPct" ShowFieldLabel="false" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td><def:datafieldcontrol runat="server" id="TRAF_learnPct" DatabaseField="TRAF_learnPct" ShowFieldLabel="false" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td><def:datafieldcontrol runat="server" id="TRAF_happyPct" DatabaseField="TRAF_happyPct" ShowFieldLabel="false" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td><def:datafieldcontrol runat="server" id="TRAF_sumitemsPct" DatabaseField="TRAF_sumitemsPct" ShowFieldLabel="false" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
</tr>


<tr>
<td>Range</td>
<td><def:datafieldcontrol runat="server" id="TRAF_acadperfR" DatabaseField="TRAF_acadperfR" ShowFieldLabel="false" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td><def:datafieldcontrol runat="server" id="TRAF_workhardR" DatabaseField="TRAF_workhardR" ShowFieldLabel="false" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td><def:datafieldcontrol runat="server" id="TRAF_behavappR" DatabaseField="TRAF_behavappR" ShowFieldLabel="false" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td><def:datafieldcontrol runat="server" id="TRAF_learnR" DatabaseField="TRAF_learnR" ShowFieldLabel="false" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td><def:datafieldcontrol runat="server" id="TRAF_happyR" DatabaseField="TRAF_happyR" ShowFieldLabel="false" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td><def:datafieldcontrol runat="server" id="TRAF_sumitemsR" DatabaseField="TRAF_sumitemsR" ShowFieldLabel="false" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>

</tr>

</table>


</table>


<br/>


<table>


</table>

</font>

<br/>
<font color="darkred">
<def:datafieldcontrol runat="server" id="trscrmsg" DatabaseField="trscrmsg" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="200px" FieldTextBoxWidth="300px" FieldTextBoxMaxLength="50"></def:datafieldcontrol>
</font>

</td>
</tr>
</table>


<br/>

<br/>
<br/>

<b><u>Begin Data Entry:</u></b>
<br/>


<table>
<tr>
<td><def:datafieldcontrol runat="server" id="TRF_I" DatabaseField="TRF_I" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
</td>
<td>
</td>
</tr>

 

<tr>
<td><def:datafieldcontrol runat="server" id="TRF_II" DatabaseField="TRF_II" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
</td>
<td><font color="blue"><def:ValueSetLabel ID="ValueSetLabel_TRF_II" runat="server"  DatabaseField="TRF_II"></def:ValueSetLabel></font>
</td>
</tr>


<tr>
<td><def:datafieldcontrol runat="server" id="TRF_III" DatabaseField="TRF_III" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
</td>
<td><font color="blue"><def:ValueSetLabel ID="ValueSetLabel_TRF_III" runat="server"  DatabaseField="TRF_III"></def:ValueSetLabel></font>

</td>
</tr>



<tr>
<td><def:datafieldcontrol runat="server" id="TRF_IV" DatabaseField="TRF_IV" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="300px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="50"></def:datafieldcontrol>
</td>
<td>
</td>
</tr>


<tr>
<td><def:datafieldcontrol runat="server" id="TRF_V" DatabaseField="TRF_V" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
</td>
<td><font color="blue"><def:ValueSetLabel ID="ValueSetLabel_TRF_V" runat="server"  DatabaseField="TRF_V"></def:ValueSetLabel></font>
</td>
</tr>
 
 <tr>
<td><def:datafieldcontrol runat="server" id="TRF_VI" DatabaseField="TRF_VI" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>

</td>
<td><font color="blue"><def:ValueSetLabel ID="ValueSetLabel_TRF_VI" runat="server"  DatabaseField="TRF_VI"></def:ValueSetLabel></font>
</td>
</tr>

</table>

<br />

<table border = "0">
<tr>
<td align="right"><b><u>Subject Name</u></b></td>
<td ><b><u>Rating</u></b></td>
<td></td>
</tr>
 <tr>
<td><def:datafieldcontrol runat="server" id="TRF_VII1subj" DatabaseField="TRF_VII1subj" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="300px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="50"></def:datafieldcontrol>

</td>
<td><def:datafieldcontrol runat="server" id="TRF_VII1rate" DatabaseField="TRF_VII1rate" ShowFieldLabel="false" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>

</td>
<td rowspan="6"><font color="blue"><def:ValueSetLabel ID="ValueSetLabel_TRF_VII1rate" runat="server"  DatabaseField="TRF_VII1rate"></def:ValueSetLabel></font>
</td>
</tr>

 
<tr>
<td><def:datafieldcontrol runat="server" id="TRF_VII2subj" DatabaseField="TRF_VII2subj" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="300px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="50"></def:datafieldcontrol>

</td>
<td><def:datafieldcontrol runat="server" id="TRF_VII2rate" DatabaseField="TRF_VII2rate" ShowFieldLabel="false" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
</td>

</tr>

<tr>
<td><def:datafieldcontrol runat="server" id="TRF_VII3subj" DatabaseField="TRF_VII3subj" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="300px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="50"></def:datafieldcontrol>
</td>
<td><def:datafieldcontrol runat="server" id="TRF_VII3rate" DatabaseField="TRF_VII3rate"  ShowFieldLabel="false" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
</td>
</tr>

<tr>
<td><def:datafieldcontrol runat="server" id="TRF_VII4subj" DatabaseField="TRF_VII4subj" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="300px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="50"></def:datafieldcontrol>
</td>
<td><def:datafieldcontrol runat="server" id="TRF_VII4rate" DatabaseField="TRF_VII4rate" ShowFieldLabel="false" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
</td>
</tr>

<tr>
<td><def:datafieldcontrol runat="server" id="TRF_VII5subj" DatabaseField="TRF_VII5subj" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="300px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="50"></def:datafieldcontrol>
</td>
<td><def:datafieldcontrol runat="server" id="TRF_VII5rate" DatabaseField="TRF_VII5rate" ShowFieldLabel="false" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
</td>
</tr>

<tr>
<td><def:datafieldcontrol runat="server" id="TRF_VII6subj" DatabaseField="TRF_VII6subj" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="300px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="50"></def:datafieldcontrol>
</td>
<td><def:datafieldcontrol runat="server" id="TRF_VII6rate" DatabaseField="TRF_VII6rate" ShowFieldLabel="false" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
</td>
</tr>
</table>

<br/>
<br/>


<table>

<tr>
<td><def:datafieldcontrol runat="server" id="TRF_VIII1" DatabaseField="TRF_VIII1" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<td rowspan="4"><font color="blue"><def:ValueSetLabel ID="ValueSetLabel_TRF_VIII1" runat="server"  DatabaseField="TRF_VIII1"></def:ValueSetLabel></font></td>
</tr>


<tr>
<td><def:datafieldcontrol runat="server" id="TRF_VIII2" DatabaseField="TRF_VIII2" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
</td>
</tr>

<tr>
<td><def:datafieldcontrol runat="server" id="TRF_VIII3" DatabaseField="TRF_VIII3" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
</td>
</tr>

<tr>
<td><def:datafieldcontrol runat="server" id="TRF_VIII4" DatabaseField="TRF_VIII4" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
</td>
</tr>

 
<tr>
<td colspan="2">
<br/>
<br/>
<def:datafieldcontrol runat="server" id="TRF_IX1" DatabaseField="TRF_IX1" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="300px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="50"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="TRF_IX2" DatabaseField="TRF_IX2" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="300px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="50"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="TRF_IX3" DatabaseField="TRF_IX3" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="300px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="50"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="TRF_IX4" DatabaseField="TRF_IX4" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="300px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="50"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="TRF_IX5" DatabaseField="TRF_IX5" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="300px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="50"></def:datafieldcontrol>
<br/>
<br/>

<def:datafieldcontrol runat="server" id="TRF_X1" DatabaseField="TRF_X1" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="300px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="50"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="TRF_X2" DatabaseField="TRF_X2" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="300px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="50"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="TRF_X3" DatabaseField="TRF_X3" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="300px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="50"></def:datafieldcontrol>
</td>
</tr> 
</table>
 
 <br/>
<br/>

 <table>
<tr>
<td><def:datafieldcontrol runat="server" id="TRF_Disability" DatabaseField="TRF_Disability" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
</td>
<td><font color="blue"><def:ValueSetLabel ID="ValueSetLabel_TRF_Disability" runat="server"  DatabaseField="TRF_Disability"></def:ValueSetLabel></font>
</td></tr>

<tr>
<td><tr></tr><def:datafieldcontrol runat="server" id="TRF_Disability_desc" DatabaseField="TRF_Disability_desc" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="300px" FieldTextBoxWidth="400px" FieldTextBoxHeight="40px" FieldTextBoxTextMode="multiline" FieldTextBoxMaxLength="250"></def:datafieldcontrol>
</td>
</tr>

<tr>
<td>
<br/><def:datafieldcontrol runat="server" id="TRF_Concerns" DatabaseField="TRF_Concerns" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="300px" FieldTextBoxWidth="400px" FieldTextBoxHeight="40px" FieldTextBoxTextMode="multiline" FieldTextBoxMaxLength="250"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="TRF_Best" DatabaseField="TRF_Best" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="300px" FieldTextBoxWidth="400px" FieldTextBoxHeight="40px" FieldTextBoxTextMode="multiline" FieldTextBoxMaxLength="250"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="TRF_Comments" DatabaseField="TRF_Comments" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="300px" FieldTextBoxWidth="400px" FieldTextBoxHeight="40px" FieldTextBoxTextMode="multiline" FieldTextBoxMaxLength="250"></def:datafieldcontrol>

</td>
</tr> 

</table>



<br/>
<br/>
<br/>
<br/>


 
<font color="blue"><def:ValueSetLabel ID="ValueSetLabel_tr01" runat="server"  DatabaseField="tr01"></def:ValueSetLabel></font>
 
 
 <table>
 <tr>
 <td>
 <def:datafieldcontrol runat="server" id="tr01" DatabaseField="tr01" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="tr02" DatabaseField="tr02" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="tr03" DatabaseField="tr03" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="tr04" DatabaseField="tr04" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="tr05" DatabaseField="tr05" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="tr06" DatabaseField="tr06" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="tr07" DatabaseField="tr07" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="tr08" DatabaseField="tr08" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="tr09" DatabaseField="tr09" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="tr09des" DatabaseField="tr09des" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="300px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="50"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="tr10" DatabaseField="tr10" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="tr11" DatabaseField="tr11" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="tr12" DatabaseField="tr12" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="tr13" DatabaseField="tr13" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="tr14" DatabaseField="tr14" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="tr15" DatabaseField="tr15" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="tr16" DatabaseField="tr16" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="tr17" DatabaseField="tr17" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="tr18" DatabaseField="tr18" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="tr19" DatabaseField="tr19" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="tr20" DatabaseField="tr20" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="tr21" DatabaseField="tr21" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="tr22" DatabaseField="tr22" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="tr23" DatabaseField="tr23" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="tr24" DatabaseField="tr24" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="tr25" DatabaseField="tr25" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="tr26" DatabaseField="tr26" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="tr27" DatabaseField="tr27" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="tr28" DatabaseField="tr28" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="tr29" DatabaseField="tr29" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="tr29des" DatabaseField="tr29des" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="300px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="50"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="tr30" DatabaseField="tr30" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="tr31" DatabaseField="tr31" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="tr32" DatabaseField="tr32" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="tr33" DatabaseField="tr33" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>

 </td>
 
 <td><def:datafieldcontrol runat="server" id="tr34" DatabaseField="tr34" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="tr35" DatabaseField="tr35" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="tr36" DatabaseField="tr36" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="tr37" DatabaseField="tr37" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="tr38" DatabaseField="tr38" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="tr39" DatabaseField="tr39" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="tr40" DatabaseField="tr40" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="tr40des" DatabaseField="tr40des" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="300px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="50"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="tr41" DatabaseField="tr41" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="tr42" DatabaseField="tr42" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="tr43" DatabaseField="tr43" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="tr44" DatabaseField="tr44" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="tr45" DatabaseField="tr45" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="tr46" DatabaseField="tr46" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="tr46des" DatabaseField="tr46des" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="300px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="50"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="tr47" DatabaseField="tr47" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="tr48" DatabaseField="tr48" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="tr49" DatabaseField="tr49" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="tr50" DatabaseField="tr50" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="tr51" DatabaseField="tr51" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="tr52" DatabaseField="tr52" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="tr53" DatabaseField="tr53" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="tr54" DatabaseField="tr54" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="tr55" DatabaseField="tr55" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="tr56a" DatabaseField="tr56a" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="tr56b" DatabaseField="tr56b" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="tr56c" DatabaseField="tr56c" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="tr56d" DatabaseField="tr56d" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="tr56ddes" DatabaseField="tr56ddes" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="300px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="50"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="tr56e" DatabaseField="tr56e" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="tr56f" DatabaseField="tr56f" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="tr56g" DatabaseField="tr56g" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="tr56h" DatabaseField="tr56h" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="tr56hdes" DatabaseField="tr56hdes" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="300px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="50"></def:datafieldcontrol>

 </td>
 </tr>

<br/>
<br/>

<tr style="vertical-align:top">
<td>
<br/>
<br/>
<br/>
<br/>
<def:datafieldcontrol runat="server" id="tr57" DatabaseField="tr57" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="tr58" DatabaseField="tr58" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="tr58des" DatabaseField="tr58des" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="300px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="50"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="tr59" DatabaseField="tr59" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="tr60" DatabaseField="tr60" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="tr61" DatabaseField="tr61" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="tr62" DatabaseField="tr62" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="tr63" DatabaseField="tr63" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="tr64" DatabaseField="tr64" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="tr65" DatabaseField="tr65" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="tr66" DatabaseField="tr66" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="tr66des" DatabaseField="tr66des" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="300px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="50"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="tr67" DatabaseField="tr67" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="tr68" DatabaseField="tr68" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="tr69" DatabaseField="tr69" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="tr70" DatabaseField="tr70" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="tr70des" DatabaseField="tr70des" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="300px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="50"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="tr71" DatabaseField="tr71" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="tr72" DatabaseField="tr72" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="tr73" DatabaseField="tr73" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="tr73des" DatabaseField="tr73des" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="300px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="50"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="tr74" DatabaseField="tr74" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="tr75" DatabaseField="tr75" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="tr76" DatabaseField="tr76" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="tr77" DatabaseField="tr77" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="tr78" DatabaseField="tr78" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="tr79" DatabaseField="tr79" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="tr79des" DatabaseField="tr79des" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="300px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="50"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="tr80" DatabaseField="tr80" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="tr81" DatabaseField="tr81" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="tr82" DatabaseField="tr82" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="tr83" DatabaseField="tr83" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="tr83des" DatabaseField="tr83des" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="300px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="50"></def:datafieldcontrol>

</td>

<td>
<br/>
<br/>
<br/>
<br/>
<def:datafieldcontrol runat="server" id="tr84" DatabaseField="tr84" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="tr84des" DatabaseField="tr84des" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="300px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="50"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="tr85" DatabaseField="tr85" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="tr85des" DatabaseField="tr85des" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="300px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="50"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="tr86" DatabaseField="tr86" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="tr87" DatabaseField="tr87" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="tr88" DatabaseField="tr88" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="tr89" DatabaseField="tr89" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="tr90" DatabaseField="tr90" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="tr91" DatabaseField="tr91" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="tr92" DatabaseField="tr92" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="tr93" DatabaseField="tr93" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="tr94" DatabaseField="tr94" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="tr95" DatabaseField="tr95" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="tr96" DatabaseField="tr96" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="tr97" DatabaseField="tr97" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="tr98" DatabaseField="tr98" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="tr99" DatabaseField="tr99" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="tr100" DatabaseField="tr100" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="tr101" DatabaseField="tr101" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="tr102" DatabaseField="tr102" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="tr103" DatabaseField="tr103" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="tr104" DatabaseField="tr104" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="tr105" DatabaseField="tr105" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="tr105des" DatabaseField="tr105des" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="300px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="50"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="tr106" DatabaseField="tr106" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="tr107" DatabaseField="tr107" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="tr108" DatabaseField="tr108" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="tr109" DatabaseField="tr109" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="tr110" DatabaseField="tr110" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="tr111" DatabaseField="tr111" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="tr112" DatabaseField="tr112" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="tr113a" DatabaseField="tr113a" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="tr113ades" DatabaseField="tr113ades" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="300px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="50"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="tr113b" DatabaseField="tr113b" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="tr113bdes" DatabaseField="tr113bdes" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="300px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="50"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="tr113c" DatabaseField="tr113c" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="tr113cdes" DatabaseField="tr113cdes" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="300px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="50"></def:datafieldcontrol>

</td>

</tr>


 </table>






<br/>
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


