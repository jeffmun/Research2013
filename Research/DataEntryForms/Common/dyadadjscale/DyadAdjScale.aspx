<%@ Register TagPrefix="def" Namespace="DataEntryFramework3" %> 
<%@ Page language="c#" MasterPageFile="~/UWAC.master"  Title="Dyadic Adjustment Data Entry" %>
<asp:Content ID="Content1" ContentPlaceHolderID="oBodyPlaceHolder" runat="server">

<def:dataentrycontroller id="DataEntryController1" runat="server" DatabaseTable="ALL_DYADICADJUSTSCALE" PrimaryKeyField="das_pk">
</def:dataentrycontroller>
<def:datafieldcontrol runat="server" id="id" DatabaseField="id" IsInsertField="true" FieldLabelWidth="150px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="15"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="indexnum" DatabaseField="indexnum" IsInsertField="true" FieldTextBoxTextDefault="1" FieldLabelWidth="150px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="DASDATE" DatabaseField="DASDATE" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px"   FormatString="{0:d}"></def:datafieldcontrol>
 
<br/>
<table>
<tr>
<td>
<font color="blue"><def:ValueSetLabel ID="ValueSetLabel_DASresp" runat="server"  DatabaseField="DASresp"></def:ValueSetLabel></font>
 
<def:datafieldcontrol runat="server" id="DASresp" DatabaseField="DASresp" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="DASrespt" DatabaseField="DASrespt" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="300px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="50"></def:datafieldcontrol>
 
<br/>
<font color="blue"><def:ValueSetLabel ID="ValueSetLabel_DAS1MS1A" runat="server"  DatabaseField="DAS1MS1A"></def:ValueSetLabel></font>
 
<def:datafieldcontrol runat="server" id="DAS1MS1A" DatabaseField="DAS1MS1A" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="DAS1MS2" DatabaseField="DAS1MS2" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="DAS1MS3" DatabaseField="DAS1MS3" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="DAS1MS4A" DatabaseField="DAS1MS4A" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="DAS1MS4B" DatabaseField="DAS1MS4B" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="DAS1MS4C" DatabaseField="DAS1MS4C" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px"></def:datafieldcontrol>
 
<br/>
</td>
<td style="border-style: solid; border-color: #C0C0C0"  > <b>New Fields</b>
<br/>

<font color="blue"><def:ValueSetLabel ID="ValueSetLabel_DASrespondparent" runat="server"  DatabaseField="DASrespondparent"></def:ValueSetLabel></font>
<def:datafieldcontrol runat="server" id="DASrespondparent" DatabaseField="DASrespondparent" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="DASpartparent" DatabaseField="DASpartparent" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>

</td>
</tr>
</table>



<br/>
<br/>

<font color="darkred">
<table border = "1pk">
<tr>
<td align="right"><b><u>Subscale Raw score</u></b></td>
<td align="middle"><u>Number missing items</u></td>
<td align="middle"><u><i>Max # of missing <br/>items allowed</i></u></td>
<td align="middle"><u><i>Items (R=recoded values)</i></u></td>
</tr>
<tr>
<td><b><def:datafieldcontrol runat="server" id="DASdcon" DatabaseField="DASdcon" IsReadOnly = "true"  RenderReadOnlyAsDiv = "true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></b></td>
<td align="middle"><def:datafieldcontrol runat="server" id="DASdcon_nmis" DatabaseField="DASdcon_nmis" ShowFieldLabel="false" IsReadOnly = "true"  RenderReadOnlyAsDiv = "true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td align="middle"><i>6</i></td>
<td><i> [13 items] 1R,2R,3R,5R,7R,8R,9R,10R,11R,12R,13R,14R,15R</i></td>
</tr>
<tr>
<td><b><def:datafieldcontrol runat="server" id="DASae" DatabaseField="DASae" IsReadOnly = "true"  RenderReadOnlyAsDiv = "true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></b></td>
<td align="middle"><def:datafieldcontrol runat="server" id="DASae_nmis" DatabaseField="DASae_nmis" ShowFieldLabel="false" IsReadOnly = "true"  RenderReadOnlyAsDiv = "true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td align="middle"><i>2</i></td>
<td><i> [ 4 items] 4R,6R,29,30</i></td>
</tr>
<tr>
<td><b><def:datafieldcontrol runat="server" id="DASdsat" DatabaseField="DASdsat" IsReadOnly = "true"  RenderReadOnlyAsDiv = "true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></b></td>
<td align="middle"><def:datafieldcontrol runat="server" id="DASdsat_nmis" DatabaseField="DASdsat_nmis" ShowFieldLabel="false" IsReadOnly = "true"  RenderReadOnlyAsDiv = "true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td align="middle"><i>5</i></td>
<td><i> [10 items] 16,17,18R,19R,20,21,22,23R,31,32R</i></td>
</tr>
<tr>
<td><b><def:datafieldcontrol runat="server" id="DASdcoh" DatabaseField="DASdcoh" IsReadOnly = "true"  RenderReadOnlyAsDiv = "true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></b></td>
<td align="middle"><def:datafieldcontrol runat="server" id="DASdcoh_nmis" DatabaseField="DASdcoh_nmis" ShowFieldLabel="false" IsReadOnly = "true"  RenderReadOnlyAsDiv = "true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td align="middle"><i>2</i></td>
<td><i> [ 5 items] 24R,25,26,27,28</i></td>
</tr>
<tr>
<td><b><def:datafieldcontrol runat="server" id="DAStot" DatabaseField="DAStot" IsReadOnly = "true"  RenderReadOnlyAsDiv = "true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></b></td>
<td align="middle"><def:datafieldcontrol runat="server" id="DAStot_nmis" DatabaseField="DAStot_nmis" ShowFieldLabel="false" IsReadOnly = "true"  RenderReadOnlyAsDiv = "true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td align="middle"><i>15</i></td>
<td><i> [32 items]</i></td>
</tr>
</table>

<br/>
<def:datafieldcontrol runat="server" id="DASscrmsg" DatabaseField="DASscrmsg"  IsReadOnly="true" IsDoubleEntryField="false" RenderReadOnlyAsDiv = "true" FieldLabelWidth="220px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="200"></def:datafieldcontrol>
</font>


<br/>
<br/>

<font color="blue"><def:ValueSetLabel ID="ValueSetLabel_DAS101" runat="server"  DatabaseField="DAS101"></def:ValueSetLabel></font>
 
<def:datafieldcontrol runat="server" id="DAS101" DatabaseField="DAS101" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="DAS102" DatabaseField="DAS102" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="DAS103" DatabaseField="DAS103" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="DAS104" DatabaseField="DAS104" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="DAS105" DatabaseField="DAS105" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="DAS106" DatabaseField="DAS106" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="DAS107" DatabaseField="DAS107" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="DAS108" DatabaseField="DAS108" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="DAS109" DatabaseField="DAS109" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="DAS110" DatabaseField="DAS110" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="DAS111" DatabaseField="DAS111" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="DAS112" DatabaseField="DAS112" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="DAS113" DatabaseField="DAS113" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="DAS114" DatabaseField="DAS114" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="DAS115" DatabaseField="DAS115" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
 
<br/>
<font color="blue"><def:ValueSetLabel ID="ValueSetLabel_DAS116" runat="server"  DatabaseField="DAS116"></def:ValueSetLabel></font>
 
<def:datafieldcontrol runat="server" id="DAS116" DatabaseField="DAS116" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="DAS117" DatabaseField="DAS117" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="DAS118" DatabaseField="DAS118" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="DAS119" DatabaseField="DAS119" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="DAS120" DatabaseField="DAS120" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="DAS121" DatabaseField="DAS121" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="DAS122" DatabaseField="DAS122" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
 
<br/>
<font color="blue"><def:ValueSetLabel ID="ValueSetLabel_DAS123" runat="server"  DatabaseField="DAS123"></def:ValueSetLabel></font>
 
<def:datafieldcontrol runat="server" id="DAS123" DatabaseField="DAS123" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
 
<br/>
<font color="blue"><def:ValueSetLabel ID="ValueSetLabel_DAS124" runat="server"  DatabaseField="DAS124"></def:ValueSetLabel></font>
 
<def:datafieldcontrol runat="server" id="DAS124" DatabaseField="DAS124" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
 
<br/>
<font color="blue"><def:ValueSetLabel ID="ValueSetLabel_DAS125" runat="server"  DatabaseField="DAS125"></def:ValueSetLabel></font>
 
<def:datafieldcontrol runat="server" id="DAS125" DatabaseField="DAS125" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="DAS126" DatabaseField="DAS126" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="DAS127" DatabaseField="DAS127" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="DAS128" DatabaseField="DAS128" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
 
<br/>
<font color="blue"><def:ValueSetLabel ID="ValueSetLabel_DAS129" runat="server"  DatabaseField="DAS129"></def:ValueSetLabel></font>
 
<def:datafieldcontrol runat="server" id="DAS129" DatabaseField="DAS129" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="DAS130" DatabaseField="DAS130" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
 
<br/>
<font color="blue"><def:ValueSetLabel ID="ValueSetLabel_DAS131" runat="server"  DatabaseField="DAS131"></def:ValueSetLabel></font>
 
<def:datafieldcontrol runat="server" id="DAS131" DatabaseField="DAS131" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
 
<br/>
<font color="blue"><def:ValueSetLabel ID="ValueSetLabel_DAS132" runat="server"  DatabaseField="DAS132"></def:ValueSetLabel></font>
 
<def:datafieldcontrol runat="server" id="DAS132" DatabaseField="DAS132" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
 


<br/>
<br/>
<def:datafieldcontrol runat="server" id="created" DatabaseField="created" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="300px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="createdBy" DatabaseField="createdBy" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="300px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="50"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="updated" DatabaseField="updated" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="300px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="updatedBy" DatabaseField="updatedBy" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="300px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="50"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="scored" DatabaseField="scored" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="300px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="scoredBy" DatabaseField="scoredBy" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="300px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="50"></def:datafieldcontrol>
</asp:Content>
