


<%@ Register TagPrefix="def" Namespace="DataEntryFramework3" %> 
<%@ Page language="c#" MasterPageFile="~/UWAC.master"  Title="DASII Data Entry" %>
<asp:Content ID="Content1" ContentPlaceHolderID="oBodyPlaceHolder" runat="server">

<def:dataentrycontroller id="DataEntryController1" runat="server" DatabaseTable="ALL_DASII" PrimaryKeyField = "pk">
</def:dataentrycontroller>


<def:datafieldcontrol runat="server" id="id" DatabaseField="id" IsInsertField="true" FieldLabelWidth="100px" FieldTextBoxWidth="80px" FieldTextBoxMaxLength="15"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="indexnum" DatabaseField="indexnum" IsInsertField="true" FieldTextBoxTextDefault="1" FieldLabelWidth="100px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="DASIIform" DatabaseField="DASIIform" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="300px" FieldTextBoxWidth="80px" FieldTextBoxMaxLength="20"></def:datafieldcontrol>


<asp:panel id="mainPanel" CssClass="mainPanel" runat="server">
<div class="main">

<table border = 1>
<tr>
<td><def:datafieldcontrol runat="server" id="DASIIlevel" DatabaseField="DASIIlevel" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="120px" FieldTextBoxWidth="40px" FieldTextBoxMaxLength="10"></def:datafieldcontrol></td>
<td><font color="blue"><def:ValueSetLabel ID="ValueSetLabel_DASIIlevel" runat="server"  DatabaseField="DASIIlevel"></def:ValueSetLabel> </font></td>
</tr>
<tr>
<td><def:datafieldcontrol runat="server" id="DASIIvld" DatabaseField="DASIIvld" ShowFieldLabel="true"  IsEntryField="true"  IsDoubleEntryField="true" FieldLabelWidth="120px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td><font color="blue"><def:ValueSetLabel ID="ValueSetLabel_DASIIvld" runat="server"  DatabaseField="DASIIvld"></def:ValueSetLabel> </font></td>
</tr>
</table>

</div>



<div class="main">



<br/>
<br/>

<def:datafieldcontrol runat="server" id="DASIInotes" DatabaseField="DASIInotes" ShowFieldLabel="true"  IsEntryField="true"  IsDoubleEntryField="false" FieldLabelWidth="120px" FieldTextBoxWidth="400px" FieldTextBoxHeight="80px" FieldTextBoxTextMode="multiline" FieldTextBoxMaxLength="250"></def:datafieldcontrol>

<br/>
<def:datafieldcontrol runat="server" id="DASIIscrmsg" DatabaseField="DASIIscrmsg" ShowFieldLabel="true"   IsReadonly="true" RenderReadOnlyAsDiv="true"  FieldLabelWidth="1200px" FieldTextBoxWidth="400px" FieldTextBoxHeight="40px" FieldTextBoxTextMode="multiline" FieldTextBoxMaxLength="250"></def:datafieldcontrol>
________________________________________________________________________________

<br/>
<br/>
<table  >
<tr>
    
    <td align="right"><u>Sum T</u></td>
    <td align="right" width = "60"><u>StdScore</u></td>
 </tr>

<tr> <td> <b>Early Years Lower</b></td></tr>

<tr>
<td><def:datafieldcontrol runat="server" id="EYL_VerbalClust_SumT" DatabaseField="EYL_VerbalClust_SumT" FieldLabelWidth="250px"    IsReadOnly="true"  RenderReadOnlyAsDiv="true"   FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td><def:datafieldcontrol runat="server" id="EYL_VerbalClust_StdScr" DatabaseField="EYL_VerbalClust_StdScr"  ShowFieldLabel="false" FieldLabelWidth="250px"    IsReadOnly="true"  RenderReadOnlyAsDiv="true"   FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
</tr>
<tr>
<td><def:datafieldcontrol runat="server" id="EYL_NonverbalClust_SumT" DatabaseField="EYL_NonverbalClust_SumT" FieldLabelWidth="250px"    IsReadOnly="true"  RenderReadOnlyAsDiv="true"   FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td><def:datafieldcontrol runat="server" id="EYL_NonverbalClust_StdScr" DatabaseField="EYL_NonverbalClust_StdScr"  ShowFieldLabel="false" FieldLabelWidth="250px"    IsReadOnly="true"  RenderReadOnlyAsDiv="true"   FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
</tr>
<tr>
<td><def:datafieldcontrol runat="server" id="EYL_GCAcomp_SumT" DatabaseField=" EYL_GCAcomp_SumT" FieldLabelWidth="250px"    IsReadOnly="true"  RenderReadOnlyAsDiv="true"   FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td><def:datafieldcontrol runat="server" id="EYL_GCAcomp_StdScr" DatabaseField=" EYL_GCAcomp_StdScr"  ShowFieldLabel="false" FieldLabelWidth="250px"    IsReadOnly="true"  RenderReadOnlyAsDiv="true"   FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
</tr>

<tr> <td> <b>Early Years Upper</b></td></tr>


<tr>
<td><def:datafieldcontrol runat="server" id="EYU_VerbalClust_SumT" DatabaseField="EYU_VerbalClust_SumT" FieldLabelWidth="250px"  IsReadOnly="true"  RenderReadOnlyAsDiv="true"   FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td><def:datafieldcontrol runat="server" id="EYU_VerbalClust_StdScr" DatabaseField="EYU_VerbalClust_StdScr"   ShowFieldLabel="false" FieldLabelWidth="250px"  IsReadOnly="true"  RenderReadOnlyAsDiv="true"   FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
</tr>
<tr>
<td><def:datafieldcontrol runat="server" id="EYU_NonverbalClust_SumT" DatabaseField="EYU_NonverbalClust_SumT" FieldLabelWidth="250px"    IsReadOnly="true"  RenderReadOnlyAsDiv="true"   FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td><def:datafieldcontrol runat="server" id="EYU_NonverbalClust_StdScr" DatabaseField="EYU_NonverbalClust_StdScr"  ShowFieldLabel="false" FieldLabelWidth="250px"    IsReadOnly="true"  RenderReadOnlyAsDiv="true"   FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
</tr>
<tr>
<td><def:datafieldcontrol runat="server" id="EYU_SpatialClust_SumT" DatabaseField="EYU_SpatialClust_SumT" FieldLabelWidth="250px"    IsReadOnly="true"  RenderReadOnlyAsDiv="true"   FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td><def:datafieldcontrol runat="server" id="EYU_SpatialClust_StdScr" DatabaseField="EYU_SpatialClust_StdScr"  ShowFieldLabel="false" FieldLabelWidth="250px"    IsReadOnly="true"  RenderReadOnlyAsDiv="true"   FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
</tr>
<tr>
<td><def:datafieldcontrol runat="server" id="EYU_GCAcomp_SumT" DatabaseField=" EYU_GCAcomp_SumT" FieldLabelWidth="250px"    IsReadOnly="true"  RenderReadOnlyAsDiv="true"   FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td><def:datafieldcontrol runat="server" id="EYU_GCAcomp_StdScr" DatabaseField=" EYU_GCAcomp_StdScr"  ShowFieldLabel="false" FieldLabelWidth="250px"    IsReadOnly="true"  RenderReadOnlyAsDiv="true"   FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
</tr>
<tr>
<td><def:datafieldcontrol runat="server" id="EYU_SpecNonverbalComp_SumT" DatabaseField=" EYU_SpecNonverbalComp_SumT" FieldLabelWidth="250px"    IsReadOnly="true"  RenderReadOnlyAsDiv="true"   FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td><def:datafieldcontrol runat="server" id="EYU_SpecNonverbalComp_StdScr" DatabaseField=" EYU_SpecNonverbalComp_StdScr" ShowFieldLabel="false"  FieldLabelWidth="250px"    IsReadOnly="true"  RenderReadOnlyAsDiv="true"   FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
</tr>

<tr> <td> <b>School Age</b></td></tr>

<tr>
<td><def:datafieldcontrol runat="server" id="SA_VerbalClust_SumT" DatabaseField="SA_VerbalClust_SumT" FieldLabelWidth="250px"    IsReadOnly="true"  RenderReadOnlyAsDiv="true"   FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td><def:datafieldcontrol runat="server" id="SA_VerbalClust_StdScr" DatabaseField="SA_VerbalClust_StdScr"  ShowFieldLabel="false" FieldLabelWidth="250px"    IsReadOnly="true"  RenderReadOnlyAsDiv="true"   FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
</tr>
<tr>
<td><def:datafieldcontrol runat="server" id="SA_NonverbalClust_SumT" DatabaseField="SA_NonverbalClust_SumT" FieldLabelWidth="250px"    IsReadOnly="true"  RenderReadOnlyAsDiv="true"   FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td><def:datafieldcontrol runat="server" id="SA_NonverbalClust_StdScr" DatabaseField="SA_NonverbalClust_StdScr" ShowFieldLabel="false"  FieldLabelWidth="250px"    IsReadOnly="true"  RenderReadOnlyAsDiv="true"   FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
</tr>
<tr>
<td><def:datafieldcontrol runat="server" id="SA_SpatialClust_SumT" DatabaseField="SA_SpatialClust_SumT" FieldLabelWidth="250px"    IsReadOnly="true"  RenderReadOnlyAsDiv="true"   FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td><def:datafieldcontrol runat="server" id="SA_SpatialClust_StdScr" DatabaseField="SA_SpatialClust_StdScr" ShowFieldLabel="false"  FieldLabelWidth="250px"    IsReadOnly="true"  RenderReadOnlyAsDiv="true"   FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
</tr>
<tr>
<td><def:datafieldcontrol runat="server" id="SA_GCAcomp_SumT" DatabaseField=" SA_GCAcomp_SumT" FieldLabelWidth="250px"    IsReadOnly="true"  RenderReadOnlyAsDiv="true"   FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td><def:datafieldcontrol runat="server" id="SA_GCAcomp_StdScr" DatabaseField=" SA_GCAcomp_StdScr" ShowFieldLabel="false"  FieldLabelWidth="250px"    IsReadOnly="true"  RenderReadOnlyAsDiv="true"   FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
</tr>
<tr>
<td><def:datafieldcontrol runat="server" id="SA_SpecNonverbalComp_SumT" DatabaseField=" SA_SpecNonverbalComp_SumT" FieldLabelWidth="250px"    IsReadOnly="true"  RenderReadOnlyAsDiv="true"   FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td><def:datafieldcontrol runat="server" id="SA_SpecNonverbalComp_StdScr" DatabaseField=" SA_SpecNonverbalComp_StdScr"  ShowFieldLabel="false" FieldLabelWidth="250px"    IsReadOnly="true"  RenderReadOnlyAsDiv="true"   FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
</tr>



</table>


________________________________________________________________________________

<br/>
<br/>
<b><i>Early Yrs</i></b>
<table  >
<tr>
	<td width ="150px"><b>Core</b></td><td><u>Item Set</u></td><td><u>Raw</u></td><td><u>Ability Score</u></td><td><u><b>T Score</b></u></td><td><u>Age Equiv</u></td><td  width="150px"><u>Age Equiv (text)</u></td>

</tr>

<tr>
	<td>Verbal Comp</td>

<td><def:datafieldcontrol runat="server" id="VerbComp_ItmSet" DatabaseField="VerbComp_ItmSet" ShowFieldLabel="false" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td><def:datafieldcontrol runat="server" id="VerbComp_Raw" DatabaseField="VerbComp_Raw" ShowFieldLabel="false" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td><def:datafieldcontrol runat="server" id="VerbComp_Ability" DatabaseField="VerbComp_Ability" ShowFieldLabel="false" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td><def:datafieldcontrol runat="server" id="VerbComp_Tscr" DatabaseField="VerbComp_Tscr" ShowFieldLabel="false"   IsReadOnly="true"  RenderReadOnlyAsDiv="true"   FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td><def:datafieldcontrol runat="server" id="VerbComp_AE" DatabaseField="VerbComp_AE" ShowFieldLabel="false"   IsReadOnly="true"  RenderReadOnlyAsDiv="true"   FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td><def:datafieldcontrol runat="server" id="VerbComp_AEtxt" DatabaseField="VerbComp_AEtxt" ShowFieldLabel="false"   IsReadOnly="true"  RenderReadOnlyAsDiv="true"   FieldTextBoxWidth="80px"></def:datafieldcontrol></td>
</tr>
<tr>
	<td>Pict Sim</td>
<td><def:datafieldcontrol runat="server" id="PictSim_ItmSet" DatabaseField="PictSim_ItmSet" ShowFieldLabel="false" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td><def:datafieldcontrol runat="server" id="PictSim_Raw" DatabaseField="PictSim_Raw" ShowFieldLabel="false" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td><def:datafieldcontrol runat="server" id="PictSim_Ability" DatabaseField="PictSim_Ability" ShowFieldLabel="false" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td><def:datafieldcontrol runat="server" id="PictSim_Tscr" DatabaseField="PictSim_Tscr" ShowFieldLabel="false"   IsReadOnly="true"  RenderReadOnlyAsDiv="true"   FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td><def:datafieldcontrol runat="server" id="PictSim_AE" DatabaseField="PictSim_AE" ShowFieldLabel="false"   IsReadOnly="true"  RenderReadOnlyAsDiv="true"   FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td><def:datafieldcontrol runat="server" id="PictSim_AEtxt" DatabaseField="PictSim_AEtxt" ShowFieldLabel="false"   IsReadOnly="true"  RenderReadOnlyAsDiv="true"   FieldTextBoxWidth="80px"></def:datafieldcontrol></td>

</tr>
<tr>
	<td>Naming Vocab</td>
<td><def:datafieldcontrol runat="server" id="NameVoc_ItmSet" DatabaseField="NameVoc_ItmSet" ShowFieldLabel="false" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td><def:datafieldcontrol runat="server" id="NameVoc_Raw" DatabaseField="NameVoc_Raw" ShowFieldLabel="false" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td><def:datafieldcontrol runat="server" id="NameVoc_Ability" DatabaseField="NameVoc_Ability" ShowFieldLabel="false"  IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td><def:datafieldcontrol runat="server" id="NameVoc_Tscr" DatabaseField="NameVoc_Tscr" ShowFieldLabel="false"   IsReadOnly="true"  RenderReadOnlyAsDiv="true"   FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td><def:datafieldcontrol runat="server" id="NameVoc_AE" DatabaseField="NameVoc_AE" ShowFieldLabel="false"   IsReadOnly="true"  RenderReadOnlyAsDiv="true"   FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td><def:datafieldcontrol runat="server" id="NameVoc_AEtxt" DatabaseField="NameVoc_AEtxt" ShowFieldLabel="false"   IsReadOnly="true"  RenderReadOnlyAsDiv="true"   FieldTextBoxWidth="80px"></def:datafieldcontrol></td>
</tr>

<tr>
<td>Patt Con</td>
<td><def:datafieldcontrol runat="server" id="PattConStd_ItmSet" DatabaseField="PattConStd_ItmSet" ShowFieldLabel="false" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td><def:datafieldcontrol runat="server" id="PattConStd_Raw" DatabaseField="PattConStd_Raw" ShowFieldLabel="false" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td><def:datafieldcontrol runat="server" id="PattConStd_Ability" DatabaseField="PattConStd_Ability" ShowFieldLabel="false" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td><def:datafieldcontrol runat="server" id="PattConStd_Tscr" DatabaseField="PattConStd_Tscr" ShowFieldLabel="false"   IsReadOnly="true"  RenderReadOnlyAsDiv="true"   FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td><def:datafieldcontrol runat="server" id="PattConStd_AE" DatabaseField="PattConStd_AE" ShowFieldLabel="false"   IsReadOnly="true"  RenderReadOnlyAsDiv="true"   FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td><def:datafieldcontrol runat="server" id="PattConStd_AEtxt" DatabaseField="PattConStd_AEtxt" ShowFieldLabel="false"   IsReadOnly="true"  RenderReadOnlyAsDiv="true"   FieldTextBoxWidth="80px"></def:datafieldcontrol></td>
</tr>

<tr>
<td>Patt Con (Alt)</td>
<td><def:datafieldcontrol runat="server" id="PattConAlt_ItmSet" DatabaseField="PattConAlt_ItmSet" ShowFieldLabel="false" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td><def:datafieldcontrol runat="server" id="PattConAlt_Raw" DatabaseField="PattConAlt_Raw" ShowFieldLabel="false" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td><def:datafieldcontrol runat="server" id="PattConAlt_Ability" DatabaseField="PattConAlt_Ability" ShowFieldLabel="false" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td><def:datafieldcontrol runat="server" id="PattConAlt_Tscr" DatabaseField="PattConAlt_Tscr" ShowFieldLabel="false"   IsReadOnly="true"  RenderReadOnlyAsDiv="true"   FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td><def:datafieldcontrol runat="server" id="PattConAlt_AE" DatabaseField="PattConAlt_AE" ShowFieldLabel="false"   IsReadOnly="true"  RenderReadOnlyAsDiv="true"   FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td><def:datafieldcontrol runat="server" id="PattConAlt_AEtxt" DatabaseField="PattConAlt_AEtxt" ShowFieldLabel="false"   IsReadOnly="true"  RenderReadOnlyAsDiv="true"   FieldTextBoxWidth="80px"></def:datafieldcontrol></td>
</tr>

<tr>
<td>Matrices</td>

<td><def:datafieldcontrol runat="server" id="Matrices_ItmSet" DatabaseField="Matrices_ItmSet" ShowFieldLabel="false" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td><def:datafieldcontrol runat="server" id="Matrices_Raw" DatabaseField="Matrices_Raw" ShowFieldLabel="false" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td><def:datafieldcontrol runat="server" id="Matrices_Ability" DatabaseField="Matrices_Ability" ShowFieldLabel="false" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td><def:datafieldcontrol runat="server" id="Matrices_Tscr" DatabaseField="Matrices_Tscr" ShowFieldLabel="false"   IsReadOnly="true"  RenderReadOnlyAsDiv="true"   FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td><def:datafieldcontrol runat="server" id="Matrices_AE" DatabaseField="Matrices_AE" ShowFieldLabel="false"   IsReadOnly="true"  RenderReadOnlyAsDiv="true"   FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td><def:datafieldcontrol runat="server" id="Matrices_AEtxt" DatabaseField="Matrices_AEtxt" ShowFieldLabel="false"   IsReadOnly="true"  RenderReadOnlyAsDiv="true"   FieldTextBoxWidth="80px"></def:datafieldcontrol></td>
</tr>

<tr>
	<td>Copying</td>

<td><def:datafieldcontrol runat="server" id="Copying_ItmSet" DatabaseField="Copying_ItmSet"  ShowFieldLabel="false" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td><def:datafieldcontrol runat="server" id="Copying_Raw" DatabaseField="Copying_Raw" ShowFieldLabel="false"  IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td><def:datafieldcontrol runat="server" id="Copying_Ability" DatabaseField="Copying_Ability" ShowFieldLabel="false"  IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td><def:datafieldcontrol runat="server" id="Copying_Tscr" DatabaseField="Copying_Tscr" ShowFieldLabel="false"   IsReadOnly="true"  RenderReadOnlyAsDiv="true"   FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td><def:datafieldcontrol runat="server" id="Copying_AE" DatabaseField="Copying_AE" ShowFieldLabel="false"   IsReadOnly="true"  RenderReadOnlyAsDiv="true"   FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td><def:datafieldcontrol runat="server" id="Copying_AEtxt" DatabaseField="Copying_AEtxt" ShowFieldLabel="false"   IsReadOnly="true"  RenderReadOnlyAsDiv="true"   FieldTextBoxWidth="80px"></def:datafieldcontrol></td>
</tr>
<tr>
	<td width ="150px"><b>Diagnostic</b></td><td><u>Item Set</u></td><td><u>Raw</u></td><td><u>Ability Score</u></td><td><u><b>T Score</b></u></td><td><u>Age Equiv</u></td><td width="150px"><u>Age Equiv (text)</u></td>
</tr>

<tr>
	<td>Recall Obj - Immed</td>
</tr>
<tr>
	<td>Recall Obj - Delay</td>
</tr>

<tr>
	<td>Recall Digit Forw</td>
</tr>
<tr>
	<td>Recog Pict</td>
</tr>
<tr>
	<td>Early Num Conc</td>
<td><def:datafieldcontrol runat="server" id="NumbCon_ItmSet" DatabaseField="NumbCon_ItmSet" ShowFieldLabel="false"   IsEntryField="true"  IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td><def:datafieldcontrol runat="server" id="NumbCon_Raw" DatabaseField="NumbCon_Raw" ShowFieldLabel="false"   IsEntryField="true"  IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td><def:datafieldcontrol runat="server" id="NumbCon_Ability" DatabaseField="NumbCon_Ability" ShowFieldLabel="false"   IsEntryField="true"  IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td><def:datafieldcontrol runat="server" id="NumbCon_Tscr" DatabaseField="NumbCon_Tscr" ShowFieldLabel="false"   IsReadOnly="true"  RenderReadOnlyAsDiv="true"   FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td><def:datafieldcontrol runat="server" id="NumbCon_AE" DatabaseField="NumbCon_AE" ShowFieldLabel="false"   IsReadOnly="true"  RenderReadOnlyAsDiv="true"   FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td><def:datafieldcontrol runat="server" id="NumbCon_AEtxt" DatabaseField="NumbCon_AEtxt" ShowFieldLabel="false"   IsReadOnly="true"  RenderReadOnlyAsDiv="true"   FieldTextBoxWidth="80px"></def:datafieldcontrol></td>
</tr>

<tr>
	<td>Match Letter forms</td>
<td><def:datafieldcontrol runat="server" id="MatchLet_ItmSet" DatabaseField="MatchLet_ItmSet" ShowFieldLabel="false"   IsEntryField="true"  IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td><def:datafieldcontrol runat="server" id="MatchLet_Raw" DatabaseField="MatchLet_Raw" ShowFieldLabel="false"   IsEntryField="true"  IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td><def:datafieldcontrol runat="server" id="MatchLet_Ability" DatabaseField="MatchLet_Ability" ShowFieldLabel="false"   IsEntryField="true"  IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td><def:datafieldcontrol runat="server" id="MatchLet_Tscr" DatabaseField="MatchLet_Tscr" ShowFieldLabel="false"   IsReadOnly="true"  RenderReadOnlyAsDiv="true"   FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td><def:datafieldcontrol runat="server" id="MatchLet_AE" DatabaseField="MatchLet_AE" ShowFieldLabel="false"   IsReadOnly="true"  RenderReadOnlyAsDiv="true"   FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td><def:datafieldcontrol runat="server" id="MatchLet_AEtxt" DatabaseField="MatchLet_AEtxt" ShowFieldLabel="false"   IsReadOnly="true"  RenderReadOnlyAsDiv="true"   FieldTextBoxWidth="80px"></def:datafieldcontrol></td>
</tr>
<tr>
<td>Recall Seq Order</td>
</tr>

<tr>
<td>Spd Info Proc</td>
</tr>

<tr>
<td>Recall Digit - Back</td>
</tr>

<tr>
<td>Phon Proc</td>
</tr>


</table>

_____________________________________________________________________

<br/>
<br/>
<b><i>School Age</i></b>
<table>
<tr>
	<td width ="150px"><b>Core</b></td><td><u>Item Set</u></td><td><u>Raw</u></td><td><u>Ability Score</u></td><td><u><b>T Score</b></u></td><td><u>Age Equiv</u></td><td  width="150px"><u>Age Equiv (text)</u></td>
</tr>
<tr>

<td>Recall Designs</td>

<td><def:datafieldcontrol runat="server" id="RecallDesign_ItmSet" DatabaseField="RecallDesign_ItmSet" ShowFieldLabel="false" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td><def:datafieldcontrol runat="server" id="RecallDesign_Raw" DatabaseField="RecallDesign_Raw" ShowFieldLabel="false" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td><def:datafieldcontrol runat="server" id="RecallDesign_Ability" DatabaseField="RecallDesign_Ability" ShowFieldLabel="false" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td><def:datafieldcontrol runat="server" id="RecallDesign_Tscr" DatabaseField="RecallDesign_Tscr" ShowFieldLabel="false"   IsReadOnly="true"  RenderReadOnlyAsDiv="true"   FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td><def:datafieldcontrol runat="server" id="RecallDesign_AE" DatabaseField="RecallDesign_AE" ShowFieldLabel="false"   IsReadOnly="true"  RenderReadOnlyAsDiv="true"   FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td><def:datafieldcontrol runat="server" id="RecallDesign_AEtxt" DatabaseField="RecallDesign_AEtxt" ShowFieldLabel="false"   IsReadOnly="true"  RenderReadOnlyAsDiv="true"   FieldTextBoxWidth="80px"></def:datafieldcontrol></td>

</tr>
<tr>
<td>Word Def</td>
<td><def:datafieldcontrol runat="server" id="WordDef_ItmSet" DatabaseField="WordDef_ItmSet" ShowFieldLabel="false" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td><def:datafieldcontrol runat="server" id="WordDef_Raw" DatabaseField="WordDef_Raw" ShowFieldLabel="false" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td><def:datafieldcontrol runat="server" id="WordDef_Ability" DatabaseField="WordDef_Ability" ShowFieldLabel="false" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td><def:datafieldcontrol runat="server" id="WordDef_Tscr" DatabaseField="WordDef_Tscr" ShowFieldLabel="false"   IsReadOnly="true"  RenderReadOnlyAsDiv="true"   FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td><def:datafieldcontrol runat="server" id="WordDef_AE" DatabaseField="WordDef_AE" ShowFieldLabel="false"   IsReadOnly="true"  RenderReadOnlyAsDiv="true"   FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td><def:datafieldcontrol runat="server" id="WordDef_AEtxt" DatabaseField="WordDef_AEtxt" ShowFieldLabel="false"   IsReadOnly="true"  RenderReadOnlyAsDiv="true"   FieldTextBoxWidth="80px"></def:datafieldcontrol></td>
</tr>


<tr>
	<td>Patt Con</td>

</tr>


<tr>
	<td>Patt Con (Alt)</td>
</tr>
<tr>
	<td>Matrices</td>
</tr>

<tr>
<td>Verbal Sim</td>

<td><def:datafieldcontrol runat="server" id="VerbSim_ItmSet" DatabaseField="VerbSim_ItmSet" ShowFieldLabel="false" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td><def:datafieldcontrol runat="server" id="VerbSim_Raw" DatabaseField="VerbSim_Raw" ShowFieldLabel="false" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td><def:datafieldcontrol runat="server" id="VerbSim_Ability" DatabaseField="VerbSim_Ability" ShowFieldLabel="false" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td><def:datafieldcontrol runat="server" id="VerbSim_Tscr" DatabaseField="VerbSim_Tscr" ShowFieldLabel="false"   IsReadOnly="true"  RenderReadOnlyAsDiv="true"   FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td><def:datafieldcontrol runat="server" id="VerbSim_AE" DatabaseField="VerbSim_AE" ShowFieldLabel="false"   IsReadOnly="true"  RenderReadOnlyAsDiv="true"   FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td><def:datafieldcontrol runat="server" id="VerbSim_AEtxt" DatabaseField="VerbSim_AEtxt" ShowFieldLabel="false"   IsReadOnly="true"  RenderReadOnlyAsDiv="true"   FieldTextBoxWidth="80px"></def:datafieldcontrol></td>
</tr>

<tr>
<td>Seq & Quant Reason</td>
<td><def:datafieldcontrol runat="server" id="SeqQuant_ItmSet" DatabaseField="SeqQuant_ItmSet" ShowFieldLabel="false" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td><def:datafieldcontrol runat="server" id="SeqQuant_Raw" DatabaseField="SeqQuant_Raw" ShowFieldLabel="false" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td><def:datafieldcontrol runat="server" id="SeqQuant_Ability" DatabaseField="SeqQuant_Ability" ShowFieldLabel="false" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td><def:datafieldcontrol runat="server" id="SeqQuant_Tscr" DatabaseField="SeqQuant_Tscr" ShowFieldLabel="false"   IsReadOnly="true"  RenderReadOnlyAsDiv="true"   FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td><def:datafieldcontrol runat="server" id="SeqQuant_AE" DatabaseField="SeqQuant_AE" ShowFieldLabel="false"   IsReadOnly="true"  RenderReadOnlyAsDiv="true"   FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td><def:datafieldcontrol runat="server" id="SeqQuant_AEtxt" DatabaseField="SeqQuant_AEtxt" ShowFieldLabel="false"   IsReadOnly="true"  RenderReadOnlyAsDiv="true"   FieldTextBoxWidth="80px"></def:datafieldcontrol></td>
</tr>

<tr>
	<td width ="150px"><b>Diagnostic</b></td><td><u>Item Set</u></td><td><u>Raw</u></td><td><u>Ability Score</u></td><td><u><b>T Score</b></u></td><td><u>Age Equiv</u></td><td width="150px"><u>Age Equiv (text)</u></td>
</tr>

<tr>
<td>Recall Obj - Immed</td>
<td><def:datafieldcontrol runat="server" id="RecallObjImm_ItmSet" DatabaseField="RecallObjImm_ItmSet" ShowFieldLabel="false"  IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td><def:datafieldcontrol runat="server" id="RecallObjImm_Raw" DatabaseField="RecallObjImm_Raw" ShowFieldLabel="false"  IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td><def:datafieldcontrol runat="server" id="RecallObjImm_Ability" DatabaseField="RecallObjImm_Ability" ShowFieldLabel="false"    IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td><def:datafieldcontrol runat="server" id="RecallObjImm_Tscr" DatabaseField="RecallObjImm_Tscr" ShowFieldLabel="false"   IsReadOnly="true"  RenderReadOnlyAsDiv="true"   FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td><def:datafieldcontrol runat="server" id="RecallObjImm_AE" DatabaseField="RecallObjImm_AE" ShowFieldLabel="false"   IsReadOnly="true"  RenderReadOnlyAsDiv="true"   FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td><def:datafieldcontrol runat="server" id="RecallObjImm_AEtxt" DatabaseField="RecallObjImm_AEtxt" ShowFieldLabel="false"   IsReadOnly="true"  RenderReadOnlyAsDiv="true"   FieldTextBoxWidth="80px"></def:datafieldcontrol></td>
</tr>

<tr>
<td>Recall Obj - Delay</td>
<td><def:datafieldcontrol runat="server" id="RecallObjDel_ItmSet" DatabaseField="RecallObjDel_ItmSet"  ShowFieldLabel="false" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td><def:datafieldcontrol runat="server" id="RecallObjDel_Raw" DatabaseField="RecallObjDel_Raw"  ShowFieldLabel="false" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td><def:datafieldcontrol runat="server" id="RecallObjDel_Ability" DatabaseField="RecallObjDel_Ability" ShowFieldLabel="false"  IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td><def:datafieldcontrol runat="server" id="RecallObjDel_Tscr" DatabaseField="RecallObjDel_Tscr" ShowFieldLabel="false"   IsReadOnly="true"  RenderReadOnlyAsDiv="true"   FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td><def:datafieldcontrol runat="server" id="RecallObjDel_AE" DatabaseField="RecallObjDel_AE" ShowFieldLabel="false"   IsReadOnly="true"  RenderReadOnlyAsDiv="true"   FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td><def:datafieldcontrol runat="server" id="RecallObjDel_AEtxt" DatabaseField="RecallObjDel_AEtxt" ShowFieldLabel="false"   IsReadOnly="true"  RenderReadOnlyAsDiv="true"   FieldTextBoxWidth="80px"></def:datafieldcontrol></td>
</tr>

<tr>
<td>Recall Digit - Forw</td>
<td><def:datafieldcontrol runat="server" id="RecallDigFor_ItmSet" DatabaseField="RecallDigFor_ItmSet" ShowFieldLabel="false"  IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td><def:datafieldcontrol runat="server" id="RecallDigFor_Raw" DatabaseField="RecallDigFor_Raw" ShowFieldLabel="false"  IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td><def:datafieldcontrol runat="server" id="RecallDigFor_Ability" DatabaseField="RecallDigFor_Ability" ShowFieldLabel="false"  IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td><def:datafieldcontrol runat="server" id="RecallDigFor_Tscr" DatabaseField="RecallDigFor_Tscr" ShowFieldLabel="false"   IsReadOnly="true"  RenderReadOnlyAsDiv="true"   FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td><def:datafieldcontrol runat="server" id="RecallDigFor_AE" DatabaseField="RecallDigFor_AE" ShowFieldLabel="false"   IsReadOnly="true"  RenderReadOnlyAsDiv="true"   FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td><def:datafieldcontrol runat="server" id="RecallDigFor_AEtxt" DatabaseField="RecallDigFor_AEtxt" ShowFieldLabel="false"   IsReadOnly="true"  RenderReadOnlyAsDiv="true"   FieldTextBoxWidth="80px"></def:datafieldcontrol></td>

</tr>

<tr>
<td>Recog Pict</td>
<td><def:datafieldcontrol runat="server" id="RecogPict_ItmSet" DatabaseField="RecogPict_ItmSet"  ShowFieldLabel="false" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td><def:datafieldcontrol runat="server" id="RecogPict_Raw" DatabaseField="RecogPict_Raw"  ShowFieldLabel="false" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td><def:datafieldcontrol runat="server" id="RecogPict_Ability" DatabaseField="RecogPict_Ability" ShowFieldLabel="false"  IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td><def:datafieldcontrol runat="server" id="RecogPict_Tscr" DatabaseField="RecogPict_Tscr" ShowFieldLabel="false"   IsReadOnly="true"  RenderReadOnlyAsDiv="true"   FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td><def:datafieldcontrol runat="server" id="RecogPict_AE" DatabaseField="RecogPict_AE" ShowFieldLabel="false"   IsReadOnly="true"  RenderReadOnlyAsDiv="true"   FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td><def:datafieldcontrol runat="server" id="RecogPict_AEtxt" DatabaseField="RecogPict_AEtxt" ShowFieldLabel="false"   IsReadOnly="true"  RenderReadOnlyAsDiv="true"   FieldTextBoxWidth="80px"></def:datafieldcontrol></td>
</tr>

<tr>
<td>Recall Seq Order</td>
<td><def:datafieldcontrol runat="server" id="RecallSeqOrd_ItmSet" DatabaseField="RecallSeqOrd_ItmSet" ShowFieldLabel="false"  IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td><def:datafieldcontrol runat="server" id="RecallSeqOrd_Raw" DatabaseField="RecallSeqOrd_Raw" ShowFieldLabel="false"  IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td><def:datafieldcontrol runat="server" id="RecallSeqOrd_Ability" DatabaseField="RecallSeqOrd_Ability"  ShowFieldLabel="false" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td><def:datafieldcontrol runat="server" id="RecallSeqOrd_Tscr" DatabaseField="RecallSeqOrd_Tscr" ShowFieldLabel="false"   IsReadOnly="true"  RenderReadOnlyAsDiv="true"   FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td><def:datafieldcontrol runat="server" id="RecallSeqOrd_AE" DatabaseField="RecallSeqOrd_AE" ShowFieldLabel="false"   IsReadOnly="true"  RenderReadOnlyAsDiv="true"   FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td><def:datafieldcontrol runat="server" id="RecallSeqOrd_AEtxt" DatabaseField="RecallSeqOrd_AEtxt" ShowFieldLabel="false"   IsReadOnly="true"  RenderReadOnlyAsDiv="true"   FieldTextBoxWidth="80px"></def:datafieldcontrol></td>
</tr>

<tr>
<td>Spd Info Proc</td>
<td><def:datafieldcontrol runat="server" id="SpdInfoProc_ItmSet" DatabaseField="SpdInfoProc_ItmSet"  ShowFieldLabel="false" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td><def:datafieldcontrol runat="server" id="SpdInfoProc_Raw" DatabaseField="SpdInfoProc_Raw" ShowFieldLabel="false"  IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td><def:datafieldcontrol runat="server" id="SpdInfoProc_Ability" DatabaseField="SpdInfoProc_Ability" ShowFieldLabel="false"  IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td><def:datafieldcontrol runat="server" id="SpdInfoProc_Tscr" DatabaseField="SpdInfoProc_Tscr" ShowFieldLabel="false"   IsReadOnly="true"  RenderReadOnlyAsDiv="true"   FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td><def:datafieldcontrol runat="server" id="SpdInfoProc_AE" DatabaseField="SpdInfoProc_AE" ShowFieldLabel="false"   IsReadOnly="true"  RenderReadOnlyAsDiv="true"   FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td><def:datafieldcontrol runat="server" id="SpdInfoProc_AEtxt" DatabaseField="SpdInfoProc_AEtxt" ShowFieldLabel="false"   IsReadOnly="true"  RenderReadOnlyAsDiv="true"   FieldTextBoxWidth="80px"></def:datafieldcontrol></td>
</tr>

<tr>
<td>Recall Digit - Back</td>


<td><def:datafieldcontrol runat="server" id="RecallDigBack_ItmSet" DatabaseField="RecallDigBack_ItmSet" ShowFieldLabel="false"  IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td><def:datafieldcontrol runat="server" id="RecallDigBack_Raw" DatabaseField="RecallDigBack_Raw" ShowFieldLabel="false"  IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td><def:datafieldcontrol runat="server" id="RecallDigBack_Ability" DatabaseField="RecallDigBack_Ability"  ShowFieldLabel="false" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td><def:datafieldcontrol runat="server" id="RecallDigBack_Tscr" DatabaseField="RecallDigBack_Tscr" ShowFieldLabel="false"   IsReadOnly="true"  RenderReadOnlyAsDiv="true"   FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td><def:datafieldcontrol runat="server" id="RecallDigBack_AE" DatabaseField="RecallDigBack_AE" ShowFieldLabel="false"   IsReadOnly="true"  RenderReadOnlyAsDiv="true"   FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td><def:datafieldcontrol runat="server" id="RecallDigBack_AEtxt" DatabaseField="RecallDigBack_AEtxt" ShowFieldLabel="false"   IsReadOnly="true"  RenderReadOnlyAsDiv="true"   FieldTextBoxWidth="80px"></def:datafieldcontrol></td>
</tr>

<tr>
<td>Phon Proc</td>
<td><def:datafieldcontrol runat="server" id="PhonProc_ItmSet" DatabaseField="PhonProc_ItmSet" ShowFieldLabel="false"   IsEntryField="true"  IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td><def:datafieldcontrol runat="server" id="PhonProc_Raw" DatabaseField="PhonProc_Raw" ShowFieldLabel="false"   IsEntryField="true"  IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td><def:datafieldcontrol runat="server" id="PhonProc_Ability" DatabaseField="PhonProc_Ability" ShowFieldLabel="false"   IsEntryField="true"  IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td><def:datafieldcontrol runat="server" id="PhonProc_Tscr" DatabaseField="PhonProc_Tscr" ShowFieldLabel="false"   IsReadOnly="true"  RenderReadOnlyAsDiv="true"   FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td><def:datafieldcontrol runat="server" id="PhonProc_AE" DatabaseField="PhonProc_AE" ShowFieldLabel="false"   IsReadOnly="true"  RenderReadOnlyAsDiv="true"   FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td><def:datafieldcontrol runat="server" id="PhonProc_AEtxt" DatabaseField="PhonProc_AEtxt" ShowFieldLabel="false"   IsReadOnly="true"  RenderReadOnlyAsDiv="true"   FieldTextBoxWidth="80px"></def:datafieldcontrol></td>
</tr>

<tr>
<td>Rapid Naming</td>
<td><def:datafieldcontrol runat="server" id="RapidName_ItmSet" DatabaseField="RapidName_ItmSet" ShowFieldLabel="false"   IsEntryField="true"  IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td><def:datafieldcontrol runat="server" id="RapidName_Raw" DatabaseField="RapidName_Raw" ShowFieldLabel="false"   IsEntryField="true"  IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td><def:datafieldcontrol runat="server" id="RapidName_Ability" DatabaseField="RapidName_Ability" ShowFieldLabel="false"   IsEntryField="true"  IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td><def:datafieldcontrol runat="server" id="RapidName_Tscr" DatabaseField="RapidName_Tscr" ShowFieldLabel="false"   IsReadOnly="true"  RenderReadOnlyAsDiv="true"   FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td><def:datafieldcontrol runat="server" id="RapidName_AE" DatabaseField="RapidName_AE" ShowFieldLabel="false"   IsReadOnly="true"  RenderReadOnlyAsDiv="true"   FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td><def:datafieldcontrol runat="server" id="RapidName_AEtxt" DatabaseField="RapidName_AEtxt" ShowFieldLabel="false"   IsReadOnly="true"  RenderReadOnlyAsDiv="true"   FieldTextBoxWidth="80px"></def:datafieldcontrol></td>
</tr>

</table>












<br/>
<br/>
<b><i>School Age</i></b>
<table>
<tr>
	<td><b>Cluster</b></td><td><u>Std Score</u></td>
</tr>
<tr>
	<td>Verbal</td>
	<td><def:datafieldcontrol runat="server" id="VerbalClust_StdScr" DatabaseField="VerbalClust_StdScr" ShowFieldLabel="false"   IsEntryField="true"  IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
</tr>

<tr>
	<td>Nonverbal</td>
	<td><def:datafieldcontrol runat="server" id="NonverbalClust_StdScr" DatabaseField="NonverbalClust_StdScr" ShowFieldLabel="false"   IsEntryField="true"  IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
</tr>

<tr>
	<td>Spatial</td>
	<td><def:datafieldcontrol runat="server" id="SpatialClust_StdScr" DatabaseField="SpatialClust_StdScr" ShowFieldLabel="false"   IsEntryField="true"  IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
</tr>

<tr>
	<td>GCA</td>
	<td><def:datafieldcontrol runat="server" id="GCAcomp_StdScr" DatabaseField="GCAcomp_StdScr" ShowFieldLabel="false"   IsEntryField="true"  IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
</tr>
<tr></tr>
<tr>
	<td>Special Nonverbal Comp</td>
	<td><def:datafieldcontrol runat="server" id="SpecNonverbalcomp_StdScr" DatabaseField="SpecNonverbalcomp_StdScr" ShowFieldLabel="false"   IsEntryField="true"  IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
</tr>
<tr>
	<td>Working Memory</td>
	<td><def:datafieldcontrol runat="server" id="WorkMemClust_StdScr" DatabaseField="WorkMemClust_StdScr" ShowFieldLabel="false"   IsEntryField="true"  IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
</tr>
<tr>
	<td>Processing Speed</td>
	<td><def:datafieldcontrol runat="server" id="ProcSpeedClust_StdScr" DatabaseField="ProcSpeedClust_StdScr" ShowFieldLabel="false"   IsEntryField="true"  IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
</tr>
<tr>
	<td>School-Readiness</td>
	<td><def:datafieldcontrol runat="server" id="SchReadyClust_StdScr" DatabaseField="SchReadyClust_StdScr" ShowFieldLabel="false"   IsEntryField="true"  IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>

</tr>


</table>



<br/>
<br/>
<br/>


_____________________________________________________________________


<td><def:datafieldcontrol runat="server" id="PhonProcTsk1_Raw" DatabaseField="PhonProcTsk1_Raw" ShowFieldLabel="true"  IsEntryField="true"  IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td><def:datafieldcontrol runat="server" id="PhonProcTsk1_Ability" DatabaseField="PhonProcTsk1_Ability" ShowFieldLabel="true"  IsEntryField="true"  IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td><def:datafieldcontrol runat="server" id="PhonProcTsk2_Raw" DatabaseField="PhonProcTsk2_Raw" ShowFieldLabel="true"  IsEntryField="true"  IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td><def:datafieldcontrol runat="server" id="PhonProcTsk2_Ability" DatabaseField="PhonProcTsk2_Ability" ShowFieldLabel="true"  IsEntryField="true"  IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td><def:datafieldcontrol runat="server" id="PhonProcTsk3_Raw" DatabaseField="PhonProcTsk3_Raw" ShowFieldLabel="true"  IsEntryField="true"  IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td><def:datafieldcontrol runat="server" id="PhonProcTsk3_Ability" DatabaseField="PhonProcTsk3_Ability" ShowFieldLabel="true"  IsEntryField="true"  IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td><def:datafieldcontrol runat="server" id="PhonProcTsk4_Raw" DatabaseField="PhonProcTsk4_Raw" ShowFieldLabel="true"  IsEntryField="true"  IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td><def:datafieldcontrol runat="server" id="PhonProcTsk4_Ability" DatabaseField="PhonProcTsk4_Ability" ShowFieldLabel="true"  IsEntryField="true"  IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>


<td><def:datafieldcontrol runat="server" id="SimpleName_Raw" DatabaseField="SimpleName_Raw" ShowFieldLabel="true"  IsEntryField="true"  IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td><def:datafieldcontrol runat="server" id="SimpleName_Ability" DatabaseField="SimpleName_Ability" ShowFieldLabel="true"  IsEntryField="true"  IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td><def:datafieldcontrol runat="server" id="ComplexName_Raw" DatabaseField="ComplexName_Raw" ShowFieldLabel="true"  IsEntryField="true"  IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td><def:datafieldcontrol runat="server" id="ComplexName_Ability" DatabaseField="ComplexName_Ability" ShowFieldLabel="true"  IsEntryField="true"  IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>

_____________________________________________________________________

</div>




<div class="main">

<def:datafieldcontrol runat="server" id="DOB" DatabaseField="DOB" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px"></def:datafieldcontrol>
 
<def:ValueSetLabel ID="ValueSetLabel_Gender" runat="server"  DatabaseField="Gender"></def:ValueSetLabel>
 
<def:datafieldcontrol runat="server" id="Gender" DatabaseField="Gender" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
 
<def:ValueSetLabel ID="ValueSetLabel_Race" runat="server"  DatabaseField="Race"></def:ValueSetLabel>
 
<def:datafieldcontrol runat="server" id="Race" DatabaseField="Race" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
 
<def:ValueSetLabel ID="ValueSetLabel_Handedness" runat="server"  DatabaseField="Handedness"></def:ValueSetLabel>
 
<def:datafieldcontrol runat="server" id="Handedness" DatabaseField="Handedness" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
 
<def:ValueSetLabel ID="ValueSetLabel_HomeLanguage" runat="server"  DatabaseField="HomeLanguage"></def:ValueSetLabel>
 
<def:datafieldcontrol runat="server" id="HomeLanguage" DatabaseField="HomeLanguage" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
 
<def:ValueSetLabel ID="ValueSetLabel_Grade" runat="server"  DatabaseField="Grade"></def:ValueSetLabel>
 
<def:datafieldcontrol runat="server" id="Grade" DatabaseField="Grade" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="AssessmentDate" DatabaseField="AssessmentDate" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="Examiners_LastName" DatabaseField="Examiners_LastName" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="300px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="50"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="Examiners_FirstName" DatabaseField="Examiners_FirstName" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="300px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="50"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="Examiners_MiddleName" DatabaseField="Examiners_MiddleName" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="300px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="50"></def:datafieldcontrol>

</div>


<div class="main">
<def:datafieldcontrol runat="server" id="created" DatabaseField="created" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="300px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="createdBy" DatabaseField="createdBy" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="300px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="50"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="updated" DatabaseField="updated" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="300px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="updatedBy" DatabaseField="updatedBy" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="300px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="50"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="scored" DatabaseField="scored" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="300px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="scoredBy" DatabaseField="scoredBy" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="300px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="50"></def:datafieldcontrol>
</div>


</asp:panel>
</asp:Content>
