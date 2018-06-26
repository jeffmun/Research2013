<%@ Register TagPrefix="def" Namespace="DataEntryFramework3" %> 
<%@ Page language="c#" MasterPageFile="~/UWAC.master"  Title="DASII Data Entry"
CodeFile="DASII.aspx.cs" Inherits="DataEntryForms_Common_DASII_DASII" Debug="true" %>
<asp:Content ID="Content1" ContentPlaceHolderID="oBodyPlaceHolder" runat="server">

<def:dataentrycontroller id="DataEntryController1" runat="server" DatabaseTable="ALL_DASII_Final" PrimaryKeyField = "dasii_pk">
</def:dataentrycontroller>

<table border = "0" >
<tr>
<td width="250px">
<def:datafieldcontrol runat="server" id="id" DatabaseField="id" IsInsertField="true" FieldLabelWidth="100px" FieldTextBoxWidth="80px" FieldTextBoxMaxLength="15"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="indexnum" DatabaseField="indexnum" IsInsertField="true" FieldTextBoxTextDefault="1" FieldLabelWidth="100px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<br/>
<%--  
<def:datafieldcontrol runat="server" id="DASIIform" DatabaseField="DASIIform" IsEntryField="true"  IsDoubleEntryField="false"  FieldLabelWidth="300px" FieldTextBoxWidth="80px" FieldTextBoxMaxLength="20"></def:datafieldcontrol>
--%>
</td>
<td >
<def:datafieldcontrol runat="server" id="Examiners_LastName" DatabaseField="Examiners_LastName" ShowFieldLabel="true" IsInsertField="true" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="170px" FieldTextBoxWidth="150px" FieldTextBoxMaxLength="50"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="DasIIdate" DatabaseField="DasIIdate" IsInsertField="true" IsEntryField="true"  IsDoubleEntryField="false"  FieldLabelWidth="170px" FormatString="{0:d}"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="DasIIageym" DatabaseField="DasIIageym" ShowFieldLabel="true"   IsReadonly="true" RenderReadOnlyAsDiv="true"  FieldLabelWidth="200px"></def:datafieldcontrol>
</td>
</tr>
</table>

<asp:Panel  ID="panel1" runat="server" Visible="true">
<table style="border: 1px solid #C0C0C0">
<tr>
<td width = "70px">DAS-II Level:<def:datafieldcontrol runat="server" id="DASIIlevel" DatabaseField="DASIIlevel" ShowFieldLabel="false" IsInsertField="true" IsEntryField="true"  IsDoubleEntryField="false"  FieldTextBoxWidth="40px" FieldTextBoxMaxLength="10"></def:datafieldcontrol></td>
<%-- 
<td width = "280px" ><def:ValueSetLabel CssClass="valuesetlabelStyle"  Width="250" ID="ValueSetLabel_DASIIlevel" runat="server"  DatabaseField="DASIIlevel"></def:ValueSetLabel> </td>
--%>
<td width = "140px"><font color="blue" size="1">
1=EY Lower<br/>
2=EY Upper<br/>
3=School Age<br/>
4=EY Lower - Out of level<br/>

</font>
</td>
<td width = "230px"><font color="blue" size="0.5">
5=EY Upper - Out of level<br/>
6=School Age - Out of level<br/>
7=EYL - Over Out of Level (CA > 109 mos)<br/>
8=EYU - Over Out of Level (CA > 109 mos)<br/>
</font>
</td>

<%--
	<td>Home Language:<br/><def:datafieldcontrol runat="server" id="HomeLanguage" DatabaseField="HomeLanguage" ShowFieldLabel="false" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
	<td><def:ValueSetLabel ID="ValueSetLabel_HomeLanguage" runat="server"  DatabaseField="HomeLanguage"></def:ValueSetLabel></td>

 <td>Grade:<br/><def:datafieldcontrol runat="server" id="Grade" DatabaseField="Grade" IsEntryField="true" ShowFieldLabel="false" IsDoubleEntryField="true" FieldLabelWidth="120px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
 <td><def:ValueSetLabel ID="ValueSetLabel_Grade" runat="server"  DatabaseField="Grade"></def:ValueSetLabel></td>
--%>
<td style="border: 1px solid #C0C0C0">
		<table id="tableClusterToUse" runat="server" visible="false">
			<tr >
			<td>
			<def:datafieldcontrol runat="server" id="DASIIvclustused" DatabaseField="DASIIvclustused" ShowFieldLabel="true"  IsEntryField="true"  IsDoubleEntryField="false" FieldLabelWidth="170px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
			<def:datafieldcontrol runat="server" id="DASIInvclustused" DatabaseField="DASIInvclustused" ShowFieldLabel="true"  IsEntryField="true"  IsDoubleEntryField="false" FieldLabelWidth="170px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
			</td>
			<td ><font color="blue"><def:ValueSetLabel ID="ValueSetLabel_DASIIvclustused" runat="server"  DatabaseField="DASIIvclustused" ></def:ValueSetLabel> </font></td>
			</tr>
		</table>
</td>
</tr>
</table>
<table id="tableValidity" runat="server" style="border: 1px solid #C0C0C0" visible="false">
<tr >
<td width="140px"><def:datafieldcontrol runat="server" id="DASIIvld" DatabaseField="DASIIvld" ShowFieldLabel="true"  IsEntryField="true"  IsDoubleEntryField="false" FieldLabelWidth="80px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td ><font color="blue"><def:ValueSetLabel ID="ValueSetLabel_DASIIvld" runat="server"  DatabaseField="DASIIvld"></def:ValueSetLabel> </font></td>
<td colspan="2"><def:datafieldcontrol runat="server" id="DASIInotes" DatabaseField="DASIInotes" ShowFieldLabel="true"  IsEntryField="true"  IsDoubleEntryField="false" FieldLabelWidth="80px" FieldTextBoxWidth="370px" FieldTextBoxHeight="60px" FieldTextBoxTextMode="multiline" FieldTextBoxMaxLength="250"></def:datafieldcontrol>
</td>
</tr>

<tr>
	
	<td width="140px"><def:datafieldcontrol runat="server" id="DASIIsettofloor" DatabaseField="DASIIsettofloor" ShowFieldLabel="true"  IsEntryField="true"  IsDoubleEntryField="false" FieldLabelWidth="80px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
	<td ><font color="blue"><def:ValueSetLabel ID="ValueSetLabel_DASIIsettofloor" runat="server"  DatabaseField="DASIIsettofloor"></def:ValueSetLabel> </font></td>
<td></td>
</tr>
</table>
</asp:Panel>


<br/>


<asp:Panel id="mainPanel" CssClass="mainPanel" runat="server">
<div class="main">

<def:datafieldcontrol runat="server" id="DASIIscrmsg" DatabaseField="DASIIscrmsg" ShowFieldLabel="true"   IsReadonly="true" RenderReadOnlyAsDiv="true"  FieldLabelWidth="120px" FieldTextBoxWidth="400px" FieldTextBoxHeight="40px" FieldTextBoxTextMode="multiline" FieldTextBoxMaxLength="250"></def:datafieldcontrol>
<br/>
<asp:Panel ID="EYL_title" runat="server" ><b><font size="medium">Early Years Lower</font></b></asp:Panel>
<asp:Panel ID="EYU_title" runat="server" ><b><font size="medium">Early Years Upper</font></b></asp:Panel>
<asp:Panel ID="SA_title" runat="server" ><b><font size="medium">School Age</font></b></asp:Panel>

<asp:Panel ID="ClusterScores_panel" runat="server">
<table>

<tr>
	<td><b>Cluster</b></td><td><u>Std Score</u></td>
</tr>
<tr>
	<td>Verbal</td>
	<td><def:datafieldcontrol runat="server" id="VerbalClust_StdScr" DatabaseField="VerbalClust_StdScr" ShowFieldLabel="false"   IsEntryField="true"  IsDoubleEntryField="false" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
</tr>

<tr>
	<td>Nonverbal</td>
	<td><def:datafieldcontrol runat="server" id="NonverbalClust_StdScr" DatabaseField="NonverbalClust_StdScr" ShowFieldLabel="false"   IsEntryField="true"  IsDoubleEntryField="false" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
</tr>

<tr>
	<td>Spatial</td>
	<td><def:datafieldcontrol runat="server" id="SpatialClust_StdScr" DatabaseField="SpatialClust_StdScr" ShowFieldLabel="false"   IsEntryField="true"  IsDoubleEntryField="false" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
</tr>

<tr>
	<td>GCA</td>
	<td><def:datafieldcontrol runat="server" id="GCAcomp_StdScr" DatabaseField="GCAcomp_StdScr" ShowFieldLabel="false"   IsEntryField="true"  IsDoubleEntryField="false" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
</tr>
<tr></tr>
<tr>
	<td>Special Nonverbal Comp</td>
	<td><def:datafieldcontrol runat="server" id="SpecNonverbalcomp_StdScr" DatabaseField="SpecNonverbalcomp_StdScr" ShowFieldLabel="false"   IsEntryField="true"  IsDoubleEntryField="false" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
</tr>
<tr>
	<td>Working Memory</td>
	<td><def:datafieldcontrol runat="server" id="WorkMemClust_StdScr" DatabaseField="WorkMemClust_StdScr" ShowFieldLabel="false"   IsEntryField="true"  IsDoubleEntryField="false" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
</tr>
<tr>
	<td>Processing Speed</td>
	<td><def:datafieldcontrol runat="server" id="ProcSpeedClust_StdScr" DatabaseField="ProcSpeedClust_StdScr" ShowFieldLabel="false"   IsEntryField="true"  IsDoubleEntryField="false" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
</tr>
<tr>
	<td>School-Readiness</td>
	<td><def:datafieldcontrol runat="server" id="SchReadyClust_StdScr" DatabaseField="SchReadyClust_StdScr" ShowFieldLabel="false"   IsEntryField="true"  IsDoubleEntryField="false" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>

</tr>


</table>
</asp:Panel>
<br/>

<br/>


<table runat="server" class="tblInputSmall">
<tr>
<td halign="right" width = "200px"><b><u>EYL Cluster Scores</u></b></td>
<td halign="right" width = "200px"><b><u>EYU Cluster Scores</u></b></td>
<td halign="right" width = "200px"><b><u>SA Cluster Scores</u></b></td>
</tr>

<tr>
<td style="vertical-align:top">
<asp:Panel ID="EYL_ClusterScores_panel" runat="server">
<table id="EYLscores" runat="server">
<tr style="vertical-align:top">
	<td width = "150px"><b>Cluster</b></td><td width = "60px"><u>Std Score</u></td><td width = "40px"><u>Pctile</u></td><td width = "75px"><u>Class</u></td>
</tr>
<tr  id="EYLverb" runat="server">
	<td>Verbal</td>
	<td><def:datafieldcontrol runat="server" id="EYL_VerbalClust_StdScr" DatabaseField="EYL_VerbalClust_StdScr" ShowFieldLabel="false"   IsReadOnly="true" FieldDataType="int"  RenderReadOnlyAsDiv="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
	<td><def:datafieldcontrol runat="server" id="EYL_VerbalClust_pct" DatabaseField="EYL_VerbalClust_pct" ShowFieldLabel="false"   IsReadOnly="true" FieldDataType="int"  RenderReadOnlyAsDiv="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
	<td><def:datafieldcontrol runat="server" id="EYL_VerbalClust_class" DatabaseField="EYL_VerbalClust_class" ShowFieldLabel="false"   IsReadOnly="true" FieldDataType="int"  RenderReadOnlyAsDiv="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
</tr>

<tr  id="EYLnverb" runat="server">
	<td>Nonverbal</td>
	<td><def:datafieldcontrol runat="server" id="EYL_NonverbalClust_StdScr" DatabaseField="EYL_NonverbalClust_StdScr" ShowFieldLabel="false"   IsReadOnly="true" FieldDataType="int"  RenderReadOnlyAsDiv="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
	<td><def:datafieldcontrol runat="server" id="EYL_NonverbalClust_pct" DatabaseField="EYL_NonverbalClust_pct" ShowFieldLabel="false"   IsReadOnly="true" FieldDataType="int"  RenderReadOnlyAsDiv="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
	<td><def:datafieldcontrol runat="server" id="EYL_NonverbalClust_class" DatabaseField="EYL_NonverbalClust_class" ShowFieldLabel="false"   IsReadOnly="true" FieldDataType="int"  RenderReadOnlyAsDiv="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
</tr>

<tr>
	<td>Spatial</td>
	<td>NA</td>
	<td>NA</td>
	<td>NA</td>
</tr>

<tr>
	<td>GCA</td>
	<td><def:datafieldcontrol runat="server" id="EYL_GCAcomp_StdScr" DatabaseField="EYL_GCAcomp_StdScr" ShowFieldLabel="false"   IsReadOnly="true" FieldDataType="int"  RenderReadOnlyAsDiv="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
	<td><def:datafieldcontrol runat="server" id="EYL_GCAcomp_pct" DatabaseField="EYL_GCAcomp_pct" ShowFieldLabel="false"   IsReadOnly="true" FieldDataType="int"  RenderReadOnlyAsDiv="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
	<td><def:datafieldcontrol runat="server" id="EYL_GCAcomp_class" DatabaseField="EYL_GCAcomp_class" ShowFieldLabel="false"   IsReadOnly="true" FieldDataType="int"  RenderReadOnlyAsDiv="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
</tr>

<tr>
	<td>Special Nonverbal Comp</td>
	<td>NA</td>
	<td>NA</td>
	<td>NA</td>
</tr>


<tr>
	<td><b><u><br/>Cluster Sig. Differences</u></b></td>
	<td> <u><br/>Sig. Diff.</u> </td>
	<td colspan="2"> <u><br/>Base rate</u> </td>
</tr>

<tr>
	<td>Verbal vs. NV</td>
	<td><def:datafieldcontrol runat="server" id="EYL_Verb_NV_diff" DatabaseField="EYL_Verb_NV_diff" ShowFieldLabel="false"   IsReadOnly="true" FieldDataType="int"  RenderReadOnlyAsDiv="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
	<td colspan="2"><def:datafieldcontrol runat="server" id="EYL_Verb_NV_baserate" DatabaseField="EYL_Verb_NV_baserate" ShowFieldLabel="false"   IsReadOnly="true" FieldDataType="int"  RenderReadOnlyAsDiv="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
</tr>
<tr>
	<td>Verbal vs. Spatial</td>
	<td>NA</td>
	<td colspan="2">NA</td>
</tr>

<tr>
	<td>NVR vs. Spatial</td>
	<td>NA</td>
	<td colspan="2">NA</td>
</tr>



<tr>
	<td><b><u>Within-Cluster Sig. Differences</u></b></td>
	<td> <u>Sig. Diff.</u> </td>
	<td colspan="2"> <u>Base rate</u> </td>
</tr>

<tr>
	<td>VERB: VerbComp vs. NameVoc</td>
	<td><def:datafieldcontrol runat="server" id="EYL_Verb_Vcom_Nvoc_diff" DatabaseField="EYL_Verb_Vcom_Nvoc_diff" ShowFieldLabel="false"   IsReadOnly="true" FieldDataType="int"  RenderReadOnlyAsDiv="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
	<td colspan="2"><def:datafieldcontrol runat="server" id="EYL_Verb_Vcom_Nvoc_baserate" DatabaseField="EYL_Verb_Vcom_Nvoc_baserate" ShowFieldLabel="false"   IsReadOnly="true" FieldDataType="int"  RenderReadOnlyAsDiv="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
</tr>
<tr>
	<td>NV: PictSim vs. PattConStd</td>
	<td><def:datafieldcontrol runat="server" id="EYL_NV_Psim_Pcon_diff" DatabaseField="EYL_NV_Psim_Pcon_diff" ShowFieldLabel="false"   IsReadOnly="true" FieldDataType="int"  RenderReadOnlyAsDiv="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
	<td colspan="2"><def:datafieldcontrol runat="server" id="EYL_NV_Psim_Pcon_baserate" DatabaseField="EYL_NV_Psim_Pcon_baserate" ShowFieldLabel="false"   IsReadOnly="true" FieldDataType="int"  RenderReadOnlyAsDiv="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
</tr>

<tr>
	<td>NV: PictSim vs. PattConAlt</td>
	<td><def:datafieldcontrol runat="server" id="EYL_NV_Psim_PConAlt_diff" DatabaseField="EYL_NV_Psim_PConAlt_diff" ShowFieldLabel="false"   IsReadOnly="true" FieldDataType="int"  RenderReadOnlyAsDiv="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
	<td colspan="2"><def:datafieldcontrol runat="server" id="EYL_NV_Psim_PConAlt_baserate" DatabaseField="EYL_NV_Psim_PConAlt_baserate" ShowFieldLabel="false"   IsReadOnly="true" FieldDataType="int"  RenderReadOnlyAsDiv="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
</tr>





</table>
</asp:Panel>


</td>

<td style="vertical-align:top">

<asp:Panel ID="EYU_ClusterScores_panel" runat="server">
<table id="EYUscores" runat="server">
<tr>
	<td width = "150px"><b>Cluster</b></td><td width = "60px"><u>Std Score</u></td><td width = "40px"><u>Pctile</u></td><td width = "75px"><u>Class</u></td>
</tr>
<tr  id="EYUverb" runat="server">
	<td>Verbal</td>
	<td><def:datafieldcontrol runat="server" id="EYU_VerbalClust_StdScr" DatabaseField="EYU_VerbalClust_StdScr" ShowFieldLabel="false"   IsReadOnly="true" FieldDataType="int"  RenderReadOnlyAsDiv="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
	<td><def:datafieldcontrol runat="server" id="EYU_VerbalClust_pct" DatabaseField="EYU_VerbalClust_pct" ShowFieldLabel="false"   IsReadOnly="true" FieldDataType="int"  RenderReadOnlyAsDiv="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
	<td><def:datafieldcontrol runat="server" id="EYU_VerbalClust_class" DatabaseField="EYU_VerbalClust_class" ShowFieldLabel="false"   IsReadOnly="true" FieldDataType="int"  RenderReadOnlyAsDiv="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
</tr>

<tr>
	<td>Nonverbal</td>
	<td><def:datafieldcontrol runat="server" id="EYU_NonverbalClust_StdScr" DatabaseField="EYU_NonverbalClust_StdScr" ShowFieldLabel="false"   IsReadOnly="true" FieldDataType="int"  RenderReadOnlyAsDiv="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
	<td><def:datafieldcontrol runat="server" id="EYU_NonverbalClust_pct" DatabaseField="EYU_NonverbalClust_pct" ShowFieldLabel="false"   IsReadOnly="true" FieldDataType="int"  RenderReadOnlyAsDiv="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
	<td><def:datafieldcontrol runat="server" id="EYU_NonverbalClust_class" DatabaseField="EYU_NonverbalClust_class" ShowFieldLabel="false"   IsReadOnly="true" FieldDataType="int"  RenderReadOnlyAsDiv="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
</tr>

<tr>
	<td>Spatial</td>
	<td><def:datafieldcontrol runat="server" id="EYU_SpatialClust_StdScr" DatabaseField="EYU_SpatialClust_StdScr" ShowFieldLabel="false"   IsReadOnly="true" FieldDataType="int"  RenderReadOnlyAsDiv="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
	<td><def:datafieldcontrol runat="server" id="EYU_SpatialClust_pct" DatabaseField="EYU_SpatialClust_pct" ShowFieldLabel="false"   IsReadOnly="true" FieldDataType="int"  RenderReadOnlyAsDiv="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
	<td><def:datafieldcontrol runat="server" id="EYU_SpatialClust_class" DatabaseField="EYU_SpatialClust_class" ShowFieldLabel="false"   IsReadOnly="true" FieldDataType="int"  RenderReadOnlyAsDiv="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
</tr>

<tr>
	<td>GCA</td>
	<td><def:datafieldcontrol runat="server" id="EYU_GCAcomp_StdScr" DatabaseField="EYU_GCAcomp_StdScr" ShowFieldLabel="false"   IsReadOnly="true" FieldDataType="int"  RenderReadOnlyAsDiv="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
	<td><def:datafieldcontrol runat="server" id="EYU_GCAcomp_pct" DatabaseField="EYU_GCAcomp_pct" ShowFieldLabel="false"   IsReadOnly="true" FieldDataType="int"  RenderReadOnlyAsDiv="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
	<td><def:datafieldcontrol runat="server" id="EYU_GCAcomp_class" DatabaseField="EYU_GCAcomp_class" ShowFieldLabel="false"   IsReadOnly="true" FieldDataType="int"  RenderReadOnlyAsDiv="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
</tr>

<tr  id="EYUnverb" runat="server">
	<td>Special Nonverbal Comp</td>
	<td><def:datafieldcontrol runat="server" id="EYU_SpecNonverbalcomp_StdScr" DatabaseField="EYU_SpecNonverbalcomp_StdScr" ShowFieldLabel="false"   IsReadOnly="true" FieldDataType="int"  RenderReadOnlyAsDiv="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
	<td><def:datafieldcontrol runat="server" id="EYU_SpecNonverbalcomp_pct" DatabaseField="EYU_SpecNonverbalcomp_pct" ShowFieldLabel="false"   IsReadOnly="true" FieldDataType="int"  RenderReadOnlyAsDiv="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
	<td><def:datafieldcontrol runat="server" id="EYU_SpecNonverbalcomp_class" DatabaseField="EYU_SpecNonverbalcomp_class" ShowFieldLabel="false"   IsReadOnly="true" FieldDataType="int"  RenderReadOnlyAsDiv="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
</tr>




<tr>
	<td><b><u><br/>Cluster Sig. Differences</u></b></td>
	<td> <u><br/>Sig. Diff.</u> </td>
	<td colspan="2"> <u><br/>Base rate</u> </td>

</tr>

<tr>
	<td>Verbal vs. NVR</td>
	<td><def:datafieldcontrol runat="server" id="EYU_Verb_NVR_diff" DatabaseField="EYU_Verb_NVR_diff" ShowFieldLabel="false"   IsReadOnly="true" FieldDataType="int"  RenderReadOnlyAsDiv="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
	<td colspan="2"><def:datafieldcontrol runat="server" id="EYU_Verb_NVR_baserate" DatabaseField="EYU_Verb_NVR_baserate" ShowFieldLabel="false"   IsReadOnly="true" FieldDataType="int"  RenderReadOnlyAsDiv="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
</tr>

<tr>
	<td>Verbal vs. Spatial</td>
	<td><def:datafieldcontrol runat="server" id="EYU_Verb_Spat_diff" DatabaseField="EYU_Verb_Spat_diff" ShowFieldLabel="false"   IsReadOnly="true" FieldDataType="int"  RenderReadOnlyAsDiv="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
	<td colspan="2"><def:datafieldcontrol runat="server" id="EYU_Verb_Spat_baserate" DatabaseField="EYU_Verb_Spat_baserate" ShowFieldLabel="false"   IsReadOnly="true" FieldDataType="int"  RenderReadOnlyAsDiv="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
</tr>

<tr>
	<td>NVR vs. Spatial</td>
	<td><def:datafieldcontrol runat="server" id="EYU_NVR_Spat_diff" DatabaseField="EYU_NVR_Spat_diff" ShowFieldLabel="false"   IsReadOnly="true" FieldDataType="int"  RenderReadOnlyAsDiv="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
	<td colspan="2"><def:datafieldcontrol runat="server" id="EYU_NVR_Spat_baserate" DatabaseField="EYU_NVR_Spat_baserate" ShowFieldLabel="false"   IsReadOnly="true" FieldDataType="int"  RenderReadOnlyAsDiv="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
</tr>




<tr>
	<td><b><u>Within-Cluster Sig. Differences</u></b></td>
	<td> <u>Sig. Diff.</u> </td>
	<td colspan="2"> <u>Base rate</u> </td>
</tr>

<tr>
	<td>VERB: VerbComp vs. NameVoc</td>
	<td><def:datafieldcontrol runat="server" id="EYU_Verb_Vcom_Nvoc_diff" DatabaseField="EYU_Verb_Vcom_Nvoc_diff" ShowFieldLabel="false"   IsReadOnly="true" FieldDataType="int"  RenderReadOnlyAsDiv="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
	<td colspan="2"><def:datafieldcontrol runat="server" id="EYU_Verb_Vcom_Nvoc_baserate" DatabaseField="EYU_Verb_Vcom_Nvoc_baserate" ShowFieldLabel="false"   IsReadOnly="true" FieldDataType="int"  RenderReadOnlyAsDiv="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
</tr>
<tr>
	<td>NVR: PictSim vs. Matrices</td>
	<td><def:datafieldcontrol runat="server" id="EYU_NVR_Psim_Mat_diff" DatabaseField="EYU_NVR_Psim_Mat_diff" ShowFieldLabel="false"   IsReadOnly="true" FieldDataType="int"  RenderReadOnlyAsDiv="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
	<td colspan="2"><def:datafieldcontrol runat="server" id="EYU_NVR_Psim_Mat_baserate" DatabaseField="EYU_NVR_Psim_Mat_baserate" ShowFieldLabel="false"   IsReadOnly="true" FieldDataType="int"  RenderReadOnlyAsDiv="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
</tr>

<tr>
	<td>SPAT: PattConStd vs. Copying</td>
	<td><def:datafieldcontrol runat="server" id="EYU_Spat_Pcon_Copy_diff" DatabaseField="EYU_Spat_Pcon_Copy_diff" ShowFieldLabel="false"   IsReadOnly="true" FieldDataType="int"  RenderReadOnlyAsDiv="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
	<td colspan="2"><def:datafieldcontrol runat="server" id="EYU_Spat_Pcon_Copy_baserate" DatabaseField="EYU_Spat_Pcon_Copy_baserate" ShowFieldLabel="false"   IsReadOnly="true" FieldDataType="int"  RenderReadOnlyAsDiv="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
</tr>

<tr>
	<td>SPAT: PattConAlt vs. Copying</td>
	<td><def:datafieldcontrol runat="server" id="EYU_Spat_PconAlt_Copy_diff" DatabaseField="EYU_Spat_PconAlt_Copy_diff" ShowFieldLabel="false"   IsReadOnly="true" FieldDataType="int"  RenderReadOnlyAsDiv="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
	<td colspan="2"><def:datafieldcontrol runat="server" id="EYU_Spat_PconAlt_Copy_baserate" DatabaseField="EYU_Spat_PconAlt_Copy_baserate" ShowFieldLabel="false"   IsReadOnly="true" FieldDataType="int"  RenderReadOnlyAsDiv="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
</tr>



</table>
</asp:Panel>


</td>

<td style="vertical-align:top">

<asp:Panel ID="SA_ClusterScores_panel" runat="server">
<table id="SAscores" runat="server" >
<tr style="vertical-align:top">
	<td width = "150px"><b>Cluster</b></td><td width = "60px"><u>Std Score</u></td><td width = "40px"><u>Pctile</u></td><td width = "75px"><u>Class</u></td>
</tr>
<tr id="SAverb" runat="server">
	<td>Verbal</td>
	<td><def:datafieldcontrol runat="server" id="SA_VerbalClust_StdScr" DatabaseField="SA_VerbalClust_StdScr" ShowFieldLabel="false"   IsReadOnly="true" FieldDataType="int"  RenderReadOnlyAsDiv="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
	<td><def:datafieldcontrol runat="server" id="SA_VerbalClust_pct" DatabaseField="SA_VerbalClust_pct" ShowFieldLabel="false"   IsReadOnly="true" FieldDataType="int"  RenderReadOnlyAsDiv="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
	<td><def:datafieldcontrol runat="server" id="SA_VerbalClust_class" DatabaseField="SA_VerbalClust_class" ShowFieldLabel="false"   IsReadOnly="true" FieldDataType="int"  RenderReadOnlyAsDiv="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
</tr>

<tr>
	<td>Nonverbal</td>
	<td><def:datafieldcontrol runat="server" id="SA_NonverbalClust_StdScr" DatabaseField="SA_NonverbalClust_StdScr" ShowFieldLabel="false"   IsReadOnly="true" FieldDataType="int"  RenderReadOnlyAsDiv="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
	<td><def:datafieldcontrol runat="server" id="SA_NonverbalClust_pct" DatabaseField="SA_NonverbalClust_pct" ShowFieldLabel="false"   IsReadOnly="true" FieldDataType="int"  RenderReadOnlyAsDiv="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
	<td><def:datafieldcontrol runat="server" id="SA_NonverbalClust_class" DatabaseField="SA_NonverbalClust_class" ShowFieldLabel="false"   IsReadOnly="true" FieldDataType="int"  RenderReadOnlyAsDiv="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
</tr>

<tr>
	<td>Spatial</td>
	<td><def:datafieldcontrol runat="server" id="SA_SpatialClust_StdScr" DatabaseField="SA_SpatialClust_StdScr" ShowFieldLabel="false"   IsReadOnly="true" FieldDataType="int"  RenderReadOnlyAsDiv="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
	<td><def:datafieldcontrol runat="server" id="SA_SpatialClust_pct" DatabaseField="SA_SpatialClust_pct" ShowFieldLabel="false"   IsReadOnly="true" FieldDataType="int"  RenderReadOnlyAsDiv="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
	<td><def:datafieldcontrol runat="server" id="SA_SpatialClust_class" DatabaseField="SA_SpatialClust_class" ShowFieldLabel="false"   IsReadOnly="true" FieldDataType="int"  RenderReadOnlyAsDiv="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
</tr>

<tr>
	<td>GCA</td>
	<td><def:datafieldcontrol runat="server" id="SA_GCAcomp_StdScr" DatabaseField="SA_GCAcomp_StdScr" ShowFieldLabel="false"   IsReadOnly="true" FieldDataType="int"  RenderReadOnlyAsDiv="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
	<td><def:datafieldcontrol runat="server" id="SA_GCAcomp_pct" DatabaseField="SA_GCAcomp_pct" ShowFieldLabel="false"   IsReadOnly="true" FieldDataType="int"  RenderReadOnlyAsDiv="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
	<td><def:datafieldcontrol runat="server" id="SA_GCAcomp_class" DatabaseField="SA_GCAcomp_class" ShowFieldLabel="false"   IsReadOnly="true" FieldDataType="int"  RenderReadOnlyAsDiv="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
</tr>

<tr   id="SAnverb" runat="server">
	<td>Special Nonverbal Comp</td>
	<td><def:datafieldcontrol runat="server" id="SA_SpecNonverbalcomp_StdScr" DatabaseField="SA_SpecNonverbalcomp_StdScr" ShowFieldLabel="false"   IsReadOnly="true" FieldDataType="int"  RenderReadOnlyAsDiv="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
	<td><def:datafieldcontrol runat="server" id="SA_SpecNonverbalcomp_pct" DatabaseField="SA_SpecNonverbalcomp_pct" ShowFieldLabel="false"   IsReadOnly="true" FieldDataType="int"  RenderReadOnlyAsDiv="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
	<td><def:datafieldcontrol runat="server" id="SA_SpecNonverbalcomp_class" DatabaseField="SA_SpecNonverbalcomp_class" ShowFieldLabel="false"   IsReadOnly="true" FieldDataType="int"  RenderReadOnlyAsDiv="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
</tr>


<tr>
	<td><b><u><br/>Cluster Sig. Differences</u></b></td>
	<td> <u><br/>Sig. Diff.</u> </td>
	<td colspan="2"> <u><br/>Base rate</u> </td>

</tr>

<tr>
	<td>Verbal vs. NVR</td>
	<td><def:datafieldcontrol runat="server" id="SA_Verb_NVR_diff" DatabaseField="SA_Verb_NVR_diff" ShowFieldLabel="false"   IsReadOnly="true" FieldDataType="int"  RenderReadOnlyAsDiv="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
	<td colspan="2"><def:datafieldcontrol runat="server" id="SA_Verb_NVR_baserate" DatabaseField="SA_Verb_NVR_baserate" ShowFieldLabel="false"   IsReadOnly="true" FieldDataType="int"  RenderReadOnlyAsDiv="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
</tr>

<tr>
	<td>Verbal vs. Spatial</td>
	<td><def:datafieldcontrol runat="server" id="SA_Verb_Spat_diff" DatabaseField="SA_Verb_Spat_diff" ShowFieldLabel="false"   IsReadOnly="true" FieldDataType="int"  RenderReadOnlyAsDiv="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
	<td colspan="2"><def:datafieldcontrol runat="server" id="SA_Verb_Spat_baserate" DatabaseField="SA_Verb_Spat_baserate" ShowFieldLabel="false"   IsReadOnly="true" FieldDataType="int"  RenderReadOnlyAsDiv="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
</tr>

<tr>
	<td>NVR vs. Spatial</td>
	<td><def:datafieldcontrol runat="server" id="SA_NVR_Spat_diff" DatabaseField="SA_NVR_Spat_diff" ShowFieldLabel="false"   IsReadOnly="true" FieldDataType="int"  RenderReadOnlyAsDiv="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
	<td colspan="2"><def:datafieldcontrol runat="server" id="SA_NVR_Spat_baserate" DatabaseField="SA_NVR_Spat_baserate" ShowFieldLabel="false"   IsReadOnly="true" FieldDataType="int"  RenderReadOnlyAsDiv="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
</tr>



<tr>
	<td><b><u>Within-Cluster Sig. Differences</u></b></td>
	<td> <u>Sig. Diff.</u> </td>
	<td colspan="2"> <u>Base rate</u> </td>
</tr>

<tr>
	<td>VERB: WordDef vs. VerbSim</td>
	<td><def:datafieldcontrol runat="server" id="SA_Verb_Wdef_Vsim_diff" DatabaseField="SA_Verb_Wdef_Vsim_diff" ShowFieldLabel="false"   IsReadOnly="true" FieldDataType="int"  RenderReadOnlyAsDiv="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
	<td colspan="2"><def:datafieldcontrol runat="server" id="SA_Verb_Wdef_Vsim_baserate" DatabaseField="SA_Verb_Wdef_Vsim_baserate" ShowFieldLabel="false"   IsReadOnly="true" FieldDataType="int"  RenderReadOnlyAsDiv="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
</tr>
<tr>
	<td>NVR: Matrices vs. SeqQuant</td>
	<td><def:datafieldcontrol runat="server" id="SA_NVR_Mat_SQR_diff" DatabaseField="SA_NVR_Mat_SQR_diff" ShowFieldLabel="false"   IsReadOnly="true" FieldDataType="int"  RenderReadOnlyAsDiv="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
	<td colspan="2"><def:datafieldcontrol runat="server" id="SA_NVR_Mat_SQR_baserate" DatabaseField="SA_NVR_Mat_SQR_baserate" ShowFieldLabel="false"   IsReadOnly="true" FieldDataType="int"  RenderReadOnlyAsDiv="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
</tr>

<tr>
	<td>SPAT: RecallDesign vs. PattConStd</td>
	<td><def:datafieldcontrol runat="server" id="SA_Spat_Rdes_Pcon_diff" DatabaseField="SA_Spat_Rdes_Pcon_diff" ShowFieldLabel="false"   IsReadOnly="true" FieldDataType="int"  RenderReadOnlyAsDiv="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
	<td colspan="2"><def:datafieldcontrol runat="server" id="SA_Spat_Rdes_Pcon_baserate" DatabaseField="SA_Spat_Rdes_Pcon_baserate" ShowFieldLabel="false"   IsReadOnly="true" FieldDataType="int"  RenderReadOnlyAsDiv="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
</tr>

<tr>
	<td>SPAT: RecallDesign vs. PattConAlt</td>
	<td><def:datafieldcontrol runat="server" id="SA_Spat_Rdes_PconAlt_diff" DatabaseField="SA_Spat_Rdes_PconAlt_diff" ShowFieldLabel="false"   IsReadOnly="true" FieldDataType="int"  RenderReadOnlyAsDiv="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
	<td colspan="2"><def:datafieldcontrol runat="server" id="SA_Spat_Rdes_PconAlt_baserate" DatabaseField="SA_Spat_Rdes_PconAlt_baserate" ShowFieldLabel="false"   IsReadOnly="true" FieldDataType="int"  RenderReadOnlyAsDiv="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
</tr>




</table>
</asp:Panel>

</td>

</tr>
</table>



<br/>


<asp:Panel    ID = "tblHeader_panel" runat="server" width = "720px" >
<table width = "720px" cellspacing="0" border="0">
<tr halign = "left">
	<td halign = "left" width ="150px"><b>Diagnostic subtest</b></td >
	<td halign = "left"  width = "80px"><u>Item Set</u></td >
	<td halign = "left"  width = "80px"><u>Raw</u></>
	<td halign = "left"  width = "80px"><u>Ability Score</u></td>
	<td halign = "left"  width = "80px"><u><b>T Score</b></u></td>
	<td halign = "left"  width = "80px"><u><b>Pctile</b></u></td>
	<td halign = "left"  width = "80px"><u>Age Equiv</u></td>
	<td halign = "left"  width="150px"><u>Age Equiv (text)</u></td>
	<td halign = "left"  width="150px"><u>Class</u></td>
</tr>
</table>
</asp:Panel>



	
<asp:Panel    ID = "VerbComp_panel" runat="server" width = "720px">

<table width = "720px" cellspacing="0" border="0">
<tr>
	<td width ="150px">Verbal Comp</td>

<td width = "80px"><def:datafieldcontrol runat="server" id="VerbComp_ItmSet" DatabaseField="VerbComp_ItmSet" ShowFieldLabel="false" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td width = "80px"><def:datafieldcontrol runat="server" id="VerbComp_Raw" DatabaseField="VerbComp_Raw" ShowFieldLabel="false" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<%--
 %><td width = "80px"><def:datafieldcontrol runat="server" id="VerbComp_Ability" DatabaseField="VerbComp_Ability" ShowFieldLabel="false"  IsReadOnly="true" RenderReadOnlyAsDiv="true"  FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td width = "80px"><def:datafieldcontrol runat="server" id="VerbComp_Tscr" DatabaseField="VerbComp_Tscr" ShowFieldLabel="false"   IsReadOnly="true"  RenderReadOnlyAsDiv="true"   FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
--%>
<td width = "80px"><def:datafieldcontrol runat="server" id="VerbComp_Ability_calc" DatabaseField="VerbComp_Ability_calc" ShowFieldLabel="false"  IsReadOnly="true" RenderReadOnlyAsDiv="true"  FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td width = "80px"><def:datafieldcontrol runat="server" id="VerbComp_Tscr_calc" DatabaseField="VerbComp_Tscr_calc" ShowFieldLabel="false"   IsReadOnly="true"  RenderReadOnlyAsDiv="true"   FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td width = "80px"><def:datafieldcontrol runat="server" id="VerbComp_pct" DatabaseField="VerbComp_pct" ShowFieldLabel="false"   IsReadOnly="true"  RenderReadOnlyAsDiv="true"   FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td width = "80px"><def:datafieldcontrol runat="server" id="VerbComp_AE" DatabaseField="VerbComp_AE" ShowFieldLabel="false"   IsReadOnly="true"  RenderReadOnlyAsDiv="true"   FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td width ="150px"><def:datafieldcontrol runat="server" id="VerbComp_AEtxt" DatabaseField="VerbComp_AEtxt" ShowFieldLabel="false"   IsReadOnly="true"  RenderReadOnlyAsDiv="true"   FieldTextBoxWidth="80px"></def:datafieldcontrol></td>
<td width ="150px"><def:datafieldcontrol runat="server" id="VerbComp_class" DatabaseField="VerbComp_class" ShowFieldLabel="false"   IsReadOnly="true"  RenderReadOnlyAsDiv="true"   FieldTextBoxWidth="80px"></def:datafieldcontrol></td>
</tr>
</table>
</asp:Panel>
   
   
<asp:Panel ID="PictSim_panel"   runat="server" width = "720px">
<table width = "720px" cellspacing="0" border="0">

<tr>
	<td width ="150px">Pict Sim</td>
<td width = "80px"><def:datafieldcontrol runat="server" id="PictSim_ItmSet" DatabaseField="PictSim_ItmSet" ShowFieldLabel="false" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td width = "80px"><def:datafieldcontrol runat="server" id="PictSim_Raw" DatabaseField="PictSim_Raw" ShowFieldLabel="false" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<%--
<td width = "80px"><def:datafieldcontrol runat="server" id="PictSim_Ability" DatabaseField="PictSim_Ability" ShowFieldLabel="false" IsReadOnly="true" RenderReadOnlyAsDiv="true"   FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td width = "80px"><def:datafieldcontrol runat="server" id="PictSim_Tscr" DatabaseField="PictSim_Tscr" ShowFieldLabel="false"   IsReadOnly="true"  RenderReadOnlyAsDiv="true"   FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
--%>
<td width = "80px"><def:datafieldcontrol runat="server" id="PictSim_Ability_calc" DatabaseField="PictSim_Ability_calc" ShowFieldLabel="false" IsReadOnly="true" RenderReadOnlyAsDiv="true"   FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td width = "80px"><def:datafieldcontrol runat="server" id="PictSim_Tscr_calc" DatabaseField="PictSim_Tscr_calc" ShowFieldLabel="false"   IsReadOnly="true"  RenderReadOnlyAsDiv="true"   FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td width = "80px"><def:datafieldcontrol runat="server" id="PictSim_pct" DatabaseField="PictSim_pct" ShowFieldLabel="false"   IsReadOnly="true"  RenderReadOnlyAsDiv="true"   FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td width = "80px"><def:datafieldcontrol runat="server" id="PictSim_AE" DatabaseField="PictSim_AE" ShowFieldLabel="false"   IsReadOnly="true"  RenderReadOnlyAsDiv="true"   FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td width ="150px"><def:datafieldcontrol runat="server" id="PictSim_AEtxt" DatabaseField="PictSim_AEtxt" ShowFieldLabel="false"   IsReadOnly="true"  RenderReadOnlyAsDiv="true"   FieldTextBoxWidth="80px"></def:datafieldcontrol></td>
<td width ="150px"><def:datafieldcontrol runat="server" id="PictSim_class" DatabaseField="PictSim_class" ShowFieldLabel="false"   IsReadOnly="true"  RenderReadOnlyAsDiv="true"   FieldTextBoxWidth="80px"></def:datafieldcontrol></td>

</tr>
</table>
</asp:Panel>

<asp:Panel ID="NameVoc_panel" runat="server" width = "720px">
<table width = "720px" cellspacing="0" border="0">

<tr>
	<td width ="150px">Naming Vocab</td>
<td width = "80px"><def:datafieldcontrol runat="server" id="NameVoc_ItmSet" DatabaseField="NameVoc_ItmSet" ShowFieldLabel="false" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td width = "80px"><def:datafieldcontrol runat="server" id="NameVoc_Raw" DatabaseField="NameVoc_Raw" ShowFieldLabel="false" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<%--
<td width = "80px"><def:datafieldcontrol runat="server" id="NameVoc_Ability" DatabaseField="NameVoc_Ability" ShowFieldLabel="false"  IsReadOnly="true" RenderReadOnlyAsDiv="true"   FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td width = "80px"><def:datafieldcontrol runat="server" id="NameVoc_Tscr" DatabaseField="NameVoc_Tscr" ShowFieldLabel="false"   IsReadOnly="true"  RenderReadOnlyAsDiv="true"   FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
--%>
<td width = "80px"><def:datafieldcontrol runat="server" id="NameVoc_Ability_calc" DatabaseField="NameVoc_Ability_calc" ShowFieldLabel="false"  IsReadOnly="true" RenderReadOnlyAsDiv="true"   FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td width = "80px"><def:datafieldcontrol runat="server" id="NameVoc_Tscr_calc" DatabaseField="NameVoc_Tscr_calc" ShowFieldLabel="false"   IsReadOnly="true"  RenderReadOnlyAsDiv="true"   FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td width = "80px"><def:datafieldcontrol runat="server" id="NameVoc_pct" DatabaseField="NameVoc_pct" ShowFieldLabel="false"   IsReadOnly="true"  RenderReadOnlyAsDiv="true"   FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td width = "80px"><def:datafieldcontrol runat="server" id="NameVoc_AE" DatabaseField="NameVoc_AE" ShowFieldLabel="false"   IsReadOnly="true"  RenderReadOnlyAsDiv="true"   FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td width ="150px"><def:datafieldcontrol runat="server" id="NameVoc_AEtxt" DatabaseField="NameVoc_AEtxt" ShowFieldLabel="false"   IsReadOnly="true"  RenderReadOnlyAsDiv="true"   FieldTextBoxWidth="80px"></def:datafieldcontrol></td>
<td width ="150px"><def:datafieldcontrol runat="server" id="NameVoc_class" DatabaseField="NameVoc_class" ShowFieldLabel="false"   IsReadOnly="true"  RenderReadOnlyAsDiv="true"   FieldTextBoxWidth="80px"></def:datafieldcontrol></td>
</tr>
</table>
</asp:Panel>


<asp:Panel ID="RecallDesigns_panel" runat="server" width = "720px">
<table width = "720px" cellspacing="0" border="0">

<tr>

<td width ="150px">Recall Designs</td>

<td width = "80px"><def:datafieldcontrol runat="server" id="RecallDesign_ItmSet" DatabaseField="RecallDesign_ItmSet" ShowFieldLabel="false" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td width = "80px"><def:datafieldcontrol runat="server" id="RecallDesign_Raw" DatabaseField="RecallDesign_Raw" ShowFieldLabel="false" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<%--
<td width = "80px"><def:datafieldcontrol runat="server" id="RecallDesign_Ability" DatabaseField="RecallDesign_Ability" ShowFieldLabel="false" IsReadOnly="true" RenderReadOnlyAsDiv="true"   FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td width = "80px"><def:datafieldcontrol runat="server" id="RecallDesign_Tscr" DatabaseField="RecallDesign_Tscr" ShowFieldLabel="false"   IsReadOnly="true"  RenderReadOnlyAsDiv="true"   FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
--%>
<td width = "80px"><def:datafieldcontrol runat="server" id="RecallDesign_Ability_calc" DatabaseField="RecallDesign_Ability_calc" ShowFieldLabel="false" IsReadOnly="true" RenderReadOnlyAsDiv="true"   FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td width = "80px"><def:datafieldcontrol runat="server" id="RecallDesign_Tscr_calc" DatabaseField="RecallDesign_Tscr_calc" ShowFieldLabel="false"   IsReadOnly="true"  RenderReadOnlyAsDiv="true"   FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td width = "80px"><def:datafieldcontrol runat="server" id="RecallDesign_pct" DatabaseField="RecallDesign_pct" ShowFieldLabel="false"   IsReadOnly="true"  RenderReadOnlyAsDiv="true"   FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td width = "80px"><def:datafieldcontrol runat="server" id="RecallDesign_AE" DatabaseField="RecallDesign_AE" ShowFieldLabel="false"   IsReadOnly="true"  RenderReadOnlyAsDiv="true"   FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td width ="150px"><def:datafieldcontrol runat="server" id="RecallDesign_AEtxt" DatabaseField="RecallDesign_AEtxt" ShowFieldLabel="false"   IsReadOnly="true"  RenderReadOnlyAsDiv="true"   FieldTextBoxWidth="80px"></def:datafieldcontrol></td>
<td width ="150px"><def:datafieldcontrol runat="server" id="RecallDesign_class" DatabaseField="RecallDesign_class" ShowFieldLabel="false"   IsReadOnly="true"  RenderReadOnlyAsDiv="true"   FieldTextBoxWidth="80px"></def:datafieldcontrol></td>

</tr>
</table>
</asp:Panel>

<asp:Panel ID="WordDef_panel" runat="server" width = "720px">
<table width = "720px" cellspacing="0" border="0">
<tr>
<td width ="150px">Word Def</td>
<td width = "80px"><def:datafieldcontrol runat="server" id="WordDef_ItmSet" DatabaseField="WordDef_ItmSet" ShowFieldLabel="false" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td width = "80px"><def:datafieldcontrol runat="server" id="WordDef_Raw" DatabaseField="WordDef_Raw" ShowFieldLabel="false" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<%--
<td width = "80px"><def:datafieldcontrol runat="server" id="WordDef_Ability" DatabaseField="WordDef_Ability" ShowFieldLabel="false" IsReadOnly="true" RenderReadOnlyAsDiv="true"   FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td width = "80px"><def:datafieldcontrol runat="server" id="WordDef_Tscr" DatabaseField="WordDef_Tscr" ShowFieldLabel="false"   IsReadOnly="true"  RenderReadOnlyAsDiv="true"   FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
--%>
<td width = "80px"><def:datafieldcontrol runat="server" id="WordDef_Ability_calc" DatabaseField="WordDef_Ability_calc" ShowFieldLabel="false" IsReadOnly="true" RenderReadOnlyAsDiv="true"   FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td width = "80px"><def:datafieldcontrol runat="server" id="WordDef_Tscr_calc" DatabaseField="WordDef_Tscr_calc" ShowFieldLabel="false"   IsReadOnly="true"  RenderReadOnlyAsDiv="true"   FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td width = "80px"><def:datafieldcontrol runat="server" id="WordDef_pct" DatabaseField="WordDef_pct" ShowFieldLabel="false"   IsReadOnly="true"  RenderReadOnlyAsDiv="true"   FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td width = "80px"><def:datafieldcontrol runat="server" id="WordDef_AE" DatabaseField="WordDef_AE" ShowFieldLabel="false"   IsReadOnly="true"  RenderReadOnlyAsDiv="true"   FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td width ="150px"><def:datafieldcontrol runat="server" id="WordDef_AEtxt" DatabaseField="WordDef_AEtxt" ShowFieldLabel="false"   IsReadOnly="true"  RenderReadOnlyAsDiv="true"   FieldTextBoxWidth="80px"></def:datafieldcontrol></td>
<td width ="150px"><def:datafieldcontrol runat="server" id="WordDef_class" DatabaseField="WordDef_class" ShowFieldLabel="false"   IsReadOnly="true"  RenderReadOnlyAsDiv="true"   FieldTextBoxWidth="80px"></def:datafieldcontrol></td>
</tr>


</table>
</asp:Panel>


<asp:Panel ID="PattConStd_panel" runat="server" width = "720px">
<table width = "720px" cellspacing="0" border="0">

<tr>
<td width ="150px">Patt Con</td>
<td width = "80px"><def:datafieldcontrol runat="server" id="PattConStd_ItmSet" DatabaseField="PattConStd_ItmSet" ShowFieldLabel="false" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td width = "80px"><def:datafieldcontrol runat="server" id="PattConStd_Raw" DatabaseField="PattConStd_Raw" ShowFieldLabel="false" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<%--
<td width = "80px"><def:datafieldcontrol runat="server" id="PattConStd_Ability" DatabaseField="PattConStd_Ability" ShowFieldLabel="false" IsReadOnly="true" RenderReadOnlyAsDiv="true"   FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td width = "80px"><def:datafieldcontrol runat="server" id="PattConStd_Tscr" DatabaseField="PattConStd_Tscr" ShowFieldLabel="false"   IsReadOnly="true"  RenderReadOnlyAsDiv="true"   FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
--%><td width = "80px"><def:datafieldcontrol runat="server" id="PattConStd_Ability_calc" DatabaseField="PattConStd_Ability_calc" ShowFieldLabel="false" IsReadOnly="true" RenderReadOnlyAsDiv="true"   FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td width = "80px"><def:datafieldcontrol runat="server" id="PattConStd_Tscr_calc" DatabaseField="PattConStd_Tscr_calc" ShowFieldLabel="false"   IsReadOnly="true"  RenderReadOnlyAsDiv="true"   FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td width = "80px"><def:datafieldcontrol runat="server" id="PattConStd_pct" DatabaseField="PattConStd_pct" ShowFieldLabel="false"   IsReadOnly="true"  RenderReadOnlyAsDiv="true"   FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td width = "80px"><def:datafieldcontrol runat="server" id="PattConStd_AE" DatabaseField="PattConStd_AE" ShowFieldLabel="false"   IsReadOnly="true"  RenderReadOnlyAsDiv="true"   FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td width ="150px"><def:datafieldcontrol runat="server" id="PattConStd_AEtxt" DatabaseField="PattConStd_AEtxt" ShowFieldLabel="false"   IsReadOnly="true"  RenderReadOnlyAsDiv="true"   FieldTextBoxWidth="80px"></def:datafieldcontrol></td>
<td width ="150px"><def:datafieldcontrol runat="server" id="PattConStd_class" DatabaseField="PattConStd_class" ShowFieldLabel="false"   IsReadOnly="true"  RenderReadOnlyAsDiv="true"   FieldTextBoxWidth="80px"></def:datafieldcontrol></td>
</tr>
</table>
</asp:Panel>

<asp:Panel ID="PattConAlt_panel" runat="server" width = "720px">
<table width = "720px" cellspacing="0" border="0">

<tr>
<td width ="150px">Patt Con (Alt)</td>
<td width = "80px"><def:datafieldcontrol runat="server" id="PattConAlt_ItmSet" DatabaseField="PattConAlt_ItmSet" ShowFieldLabel="false" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>

<td width = "80px"><def:datafieldcontrol runat="server" id="PattConAlt_Raw" DatabaseField="PattConAlt_Raw" ShowFieldLabel="false" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<%--<td width = "80px"><def:datafieldcontrol runat="server" id="PattConAlt_Ability" DatabaseField="PattConAlt_Ability" ShowFieldLabel="false" IsReadOnly="true" RenderReadOnlyAsDiv="true"   FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td width = "80px"><def:datafieldcontrol runat="server" id="PattConAlt_Tscr" DatabaseField="PattConAlt_Tscr" ShowFieldLabel="false"   IsReadOnly="true"  RenderReadOnlyAsDiv="true"   FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
--%>
<td width = "80px"><def:datafieldcontrol runat="server" id="PattConAlt_Ability_calc" DatabaseField="PattConAlt_Ability_calc" ShowFieldLabel="false" IsReadOnly="true" RenderReadOnlyAsDiv="true"   FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td width = "80px"><def:datafieldcontrol runat="server" id="PattConAlt_Tscr_calc" DatabaseField="PattConAlt_Tscr_calc" ShowFieldLabel="false"   IsReadOnly="true"  RenderReadOnlyAsDiv="true"   FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td width = "80px"><def:datafieldcontrol runat="server" id="PattConAlt_pct" DatabaseField="PattConAlt_pct" ShowFieldLabel="false"   IsReadOnly="true"  RenderReadOnlyAsDiv="true"   FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td width = "80px"><def:datafieldcontrol runat="server" id="PattConAlt_AE" DatabaseField="PattConAlt_AE" ShowFieldLabel="false"   IsReadOnly="true"  RenderReadOnlyAsDiv="true"   FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td width ="150px"><def:datafieldcontrol runat="server" id="PattConAlt_AEtxt" DatabaseField="PattConAlt_AEtxt" ShowFieldLabel="false"   IsReadOnly="true"  RenderReadOnlyAsDiv="true"   FieldTextBoxWidth="80px"></def:datafieldcontrol></td>
<td width ="150px"><def:datafieldcontrol runat="server" id="PattConAlt_class" DatabaseField="PattConAlt_class" ShowFieldLabel="false"   IsReadOnly="true"  RenderReadOnlyAsDiv="true"   FieldTextBoxWidth="80px"></def:datafieldcontrol></td>
</tr>
</table>
</asp:Panel>

<asp:Panel ID="Matrices_panel" runat="server" width = "720px">
<table width = "720px" cellspacing="0" border="0">

<tr>
<td width ="150px">Matrices</td>

<td width = "80px"><def:datafieldcontrol runat="server" id="Matrices_ItmSet" DatabaseField="Matrices_ItmSet" ShowFieldLabel="false" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td width = "80px"><def:datafieldcontrol runat="server" id="Matrices_Raw" DatabaseField="Matrices_Raw" ShowFieldLabel="false" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<%--
<td width = "80px"><def:datafieldcontrol runat="server" id="Matrices_Ability" DatabaseField="Matrices_Ability" ShowFieldLabel="false" IsReadOnly="true" RenderReadOnlyAsDiv="true"   FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td width = "80px"><def:datafieldcontrol runat="server" id="Matrices_Tscr" DatabaseField="Matrices_Tscr" ShowFieldLabel="false"   IsReadOnly="true"  RenderReadOnlyAsDiv="true"   FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
--%>
<td width = "80px"><def:datafieldcontrol runat="server" id="Matrices_Ability_calc" DatabaseField="Matrices_Ability_calc" ShowFieldLabel="false" IsReadOnly="true" RenderReadOnlyAsDiv="true"   FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td width = "80px"><def:datafieldcontrol runat="server" id="Matrices_Tscr_calc" DatabaseField="Matrices_Tscr_calc" ShowFieldLabel="false"   IsReadOnly="true"  RenderReadOnlyAsDiv="true"   FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td width = "80px"><def:datafieldcontrol runat="server" id="Matrices_pct" DatabaseField="Matrices_pct" ShowFieldLabel="false"   IsReadOnly="true"  RenderReadOnlyAsDiv="true"   FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td width = "80px"><def:datafieldcontrol runat="server" id="Matrices_AE" DatabaseField="Matrices_AE" ShowFieldLabel="false"   IsReadOnly="true"  RenderReadOnlyAsDiv="true"   FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td width ="150px"><def:datafieldcontrol runat="server" id="Matrices_AEtxt" DatabaseField="Matrices_AEtxt" ShowFieldLabel="false"   IsReadOnly="true"  RenderReadOnlyAsDiv="true"   FieldTextBoxWidth="80px"></def:datafieldcontrol></td>
<td width ="150px"><def:datafieldcontrol runat="server" id="Matrices_class" DatabaseField="Matrices_class" ShowFieldLabel="false"   IsReadOnly="true"  RenderReadOnlyAsDiv="true"   FieldTextBoxWidth="80px"></def:datafieldcontrol></td>
</tr>
</table>
</asp:Panel>

<asp:Panel ID="Copying_panel" runat="server" width = "720px">
<table width = "720px" cellspacing="0" border="0">

<tr>
	<td width ="150px">Copying</td>

<td width = "80px"><def:datafieldcontrol runat="server" id="Copying_ItmSet" DatabaseField="Copying_ItmSet"  ShowFieldLabel="false" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td width = "80px"><def:datafieldcontrol runat="server" id="Copying_Raw" DatabaseField="Copying_Raw" ShowFieldLabel="false"  IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<%--
<td width = "80px"><def:datafieldcontrol runat="server" id="Copying_Ability" DatabaseField="Copying_Ability" ShowFieldLabel="false"  IsReadOnly="true" RenderReadOnlyAsDiv="true"   FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td width = "80px"><def:datafieldcontrol runat="server" id="Copying_Tscr" DatabaseField="Copying_Tscr" ShowFieldLabel="false"   IsReadOnly="true"  RenderReadOnlyAsDiv="true"   FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
--%>
<td width = "80px"><def:datafieldcontrol runat="server" id="Copying_Ability_calc" DatabaseField="Copying_Ability_calc" ShowFieldLabel="false"  IsReadOnly="true" RenderReadOnlyAsDiv="true"   FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td width = "80px"><def:datafieldcontrol runat="server" id="Copying_Tscr_calc" DatabaseField="Copying_Tscr_calc" ShowFieldLabel="false"   IsReadOnly="true"  RenderReadOnlyAsDiv="true"   FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td width = "80px"><def:datafieldcontrol runat="server" id="Copying_pct" DatabaseField="Copying_pct" ShowFieldLabel="false"   IsReadOnly="true"  RenderReadOnlyAsDiv="true"   FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td width = "80px"><def:datafieldcontrol runat="server" id="Copying_AE" DatabaseField="Copying_AE" ShowFieldLabel="false"   IsReadOnly="true"  RenderReadOnlyAsDiv="true"   FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td width ="150px"><def:datafieldcontrol runat="server" id="Copying_AEtxt" DatabaseField="Copying_AEtxt" ShowFieldLabel="false"   IsReadOnly="true"  RenderReadOnlyAsDiv="true"   FieldTextBoxWidth="80px"></def:datafieldcontrol></td>
<td width ="150px"><def:datafieldcontrol runat="server" id="Copying_class" DatabaseField="Copying_class" ShowFieldLabel="false"   IsReadOnly="true"  RenderReadOnlyAsDiv="true"   FieldTextBoxWidth="80px"></def:datafieldcontrol></td>
</tr>
</table>
</asp:Panel>


<asp:Panel ID="VerbSim_panel" runat="server" width = "720px">
<table width = "720px" cellspacing="0" border="0">
<tr>
<td width ="150px">Verbal Sim</td>

<td width = "80px"><def:datafieldcontrol runat="server" id="VerbSim_ItmSet" DatabaseField="VerbSim_ItmSet" ShowFieldLabel="false" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td width = "80px"><def:datafieldcontrol runat="server" id="VerbSim_Raw" DatabaseField="VerbSim_Raw" ShowFieldLabel="false" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<%--
<td width = "80px"><def:datafieldcontrol runat="server" id="VerbSim_Ability" DatabaseField="VerbSim_Ability" ShowFieldLabel="false" IsReadOnly="true" RenderReadOnlyAsDiv="true"   FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td width = "80px"><def:datafieldcontrol runat="server" id="VerbSim_Tscr" DatabaseField="VerbSim_Tscr" ShowFieldLabel="false"   IsReadOnly="true"  RenderReadOnlyAsDiv="true"   FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
--%>
<td width = "80px"><def:datafieldcontrol runat="server" id="VerbSim_Ability_calc" DatabaseField="VerbSim_Ability_calc" ShowFieldLabel="false" IsReadOnly="true" RenderReadOnlyAsDiv="true"   FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td width = "80px"><def:datafieldcontrol runat="server" id="VerbSim_Tscr_calc" DatabaseField="VerbSim_Tscr_calc" ShowFieldLabel="false"   IsReadOnly="true"  RenderReadOnlyAsDiv="true"   FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td width = "80px"><def:datafieldcontrol runat="server" id="VerbSim_pct" DatabaseField="VerbSim_pct" ShowFieldLabel="false"   IsReadOnly="true"  RenderReadOnlyAsDiv="true"   FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td width = "80px"><def:datafieldcontrol runat="server" id="VerbSim_AE" DatabaseField="VerbSim_AE" ShowFieldLabel="false"   IsReadOnly="true"  RenderReadOnlyAsDiv="true"   FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td width ="150px"><def:datafieldcontrol runat="server" id="VerbSim_AEtxt" DatabaseField="VerbSim_AEtxt" ShowFieldLabel="false"   IsReadOnly="true"  RenderReadOnlyAsDiv="true"   FieldTextBoxWidth="80px"></def:datafieldcontrol></td>
<td width ="150px"><def:datafieldcontrol runat="server" id="VerbSim_class" DatabaseField="VerbSim_class" ShowFieldLabel="false"   IsReadOnly="true"  RenderReadOnlyAsDiv="true"   FieldTextBoxWidth="80px"></def:datafieldcontrol></td>
</tr>
</table>
</asp:Panel>

<asp:Panel ID="SeqQuant_panel" runat="server" width = "720px">
<table width = "720px" cellspacing="0" border="0">
<tr>
<td width ="150px">Seq & Quant Reason</td>
<td width = "80px"><def:datafieldcontrol runat="server" id="SeqQuant_ItmSet" DatabaseField="SeqQuant_ItmSet" ShowFieldLabel="false" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td width = "80px"><def:datafieldcontrol runat="server" id="SeqQuant_Raw" DatabaseField="SeqQuant_Raw" ShowFieldLabel="false" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<%--<td width = "80px"><def:datafieldcontrol runat="server" id="SeqQuant_Ability" DatabaseField="SeqQuant_Ability" ShowFieldLabel="false" IsReadOnly="true" RenderReadOnlyAsDiv="true"   FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td width = "80px"><def:datafieldcontrol runat="server" id="SeqQuant_Tscr" DatabaseField="SeqQuant_Tscr" ShowFieldLabel="false"   IsReadOnly="true"  RenderReadOnlyAsDiv="true"   FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
--%>
<td width = "80px"><def:datafieldcontrol runat="server" id="SeqQuant_Ability_calc" DatabaseField="SeqQuant_Ability_calc" ShowFieldLabel="false" IsReadOnly="true" RenderReadOnlyAsDiv="true"   FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td width = "80px"><def:datafieldcontrol runat="server" id="SeqQuant_Tscr_calc" DatabaseField="SeqQuant_Tscr_calc" ShowFieldLabel="false"   IsReadOnly="true"  RenderReadOnlyAsDiv="true"   FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td width = "80px"><def:datafieldcontrol runat="server" id="SeqQuant_pct" DatabaseField="SeqQuant_pct" ShowFieldLabel="false"   IsReadOnly="true"  RenderReadOnlyAsDiv="true"   FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td width = "80px"><def:datafieldcontrol runat="server" id="SeqQuant_AE" DatabaseField="SeqQuant_AE" ShowFieldLabel="false"   IsReadOnly="true"  RenderReadOnlyAsDiv="true"   FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td width ="150px"><def:datafieldcontrol runat="server" id="SeqQuant_AEtxt" DatabaseField="SeqQuant_AEtxt" ShowFieldLabel="false"   IsReadOnly="true"  RenderReadOnlyAsDiv="true"   FieldTextBoxWidth="80px"></def:datafieldcontrol></td>
<td width ="150px"><def:datafieldcontrol runat="server" id="SeqQuant_class" DatabaseField="SeqQuant_class" ShowFieldLabel="false"   IsReadOnly="true"  RenderReadOnlyAsDiv="true"   FieldTextBoxWidth="80px"></def:datafieldcontrol></td>
</tr>

</table>
</asp:Panel>




<br/>
<br/>


<asp:Panel ID="ValueLabels_panel" runat="server">

<b><u>Item Sets</u></b><br/>
<table id="Table1" runat="server" border = "1" halign = "left">
<tr>
	 <td id="ItemSet1_VerbComp"      ><b><u>Verb Comp </u></b>
</td><td id="ItemSet1_PictSim"      ><b><u>Pict Sim</u></b>
</td><td id="ItemSet1_NameVoc"      ><b><u>Name Vocab</u></b>
</td><td id="ItemSet1_RecallDesigns"><b><u>Recall Designs</u></b>
</td><td id="ItemSet1_WordDef"      ><b><u>WordDef </u></b>
</td><td id="ItemSet1_PattConStd"    ><b><u>PatConStd</u></b>
</td><td id="ItemSet1_PattConAlt"    ><b><u>PatConAlt</u></b>
</td><td id="ItemSet1_Matrices"     ><b><u>Matrices </u></b>
</td><td id="ItemSet1_Copying"      ><b><u>Copying</u></b>
</td><td id="ItemSet1_VerbSim"      ><b><u>VerbSim</u></b>
</td><td id="ItemSet1_SeqQuant"     ><b><u>SeqQuant </u></b>
</td>
</tr>

<tr style="vertical-align:top" halign = "left">

	 <td id="ItemSet2_VerbComp" ><def:ValueSetLabel ID="ValueSetLabel_ItemSet_VerbComp" runat="server"  DatabaseField="VerbComp_ItmSet"></def:ValueSetLabel> 
</td><td id="ItemSet2_PictSim" ><def:ValueSetLabel ID="ValueSetLabel_ItemSet_PictSim" runat="server"  DatabaseField="PictSim_ItmSet"></def:ValueSetLabel> 
</td><td id="ItemSet2_NameVoc" ><def:ValueSetLabel ID="ValueSetLabel_ItemSet_NameVoc" runat="server"  DatabaseField="NameVoc_ItmSet"></def:ValueSetLabel> 
</td><td id="ItemSet2_RecallDesigns"><def:ValueSetLabel ID="ValueSetLabel_ItemSet_RecallDesigns" runat="server"  DatabaseField="RecallDesign_ItmSet"></def:ValueSetLabel> 
</td><td id="ItemSet2_WordDef" ><def:ValueSetLabel ID="ValueSetLabel_ItemSet_WordDef" runat="server"  DatabaseField="WordDef_ItmSet"></def:ValueSetLabel> 
</td><td id="ItemSet2_PattConStd"><def:ValueSetLabel ID="ValueSetLabel_ItemSet_PattConStd" runat="server"  DatabaseField="PattConStd_ItmSet"></def:ValueSetLabel> 
</td><td id="ItemSet2_PattConAlt"><def:ValueSetLabel ID="ValueSetLabel_ItemSet_PattConAlt" runat="server"  DatabaseField="PattConAlt_ItmSet"></def:ValueSetLabel> 
</td><td id="ItemSet2_Matrices" ><def:ValueSetLabel ID="ValueSetLabel_ItemSet_Matrices" runat="server"  DatabaseField="Matrices_ItmSet"></def:ValueSetLabel> 
</td><td id="ItemSet2_Copying"><def:ValueSetLabel ID="ValueSetLabel_ItemSet_Copying" runat="server"  DatabaseField="Copying_ItmSet"></def:ValueSetLabel> 
</td><td id="ItemSet2_VerbSim" ><def:ValueSetLabel ID="ValueSetLabel_ItemSet_VerbSim" runat="server"  DatabaseField="VerbSim_ItmSet"></def:ValueSetLabel> 
</td><td id="ItemSet2_SeqQuant" ><def:ValueSetLabel ID="ValueSetLabel_ItemSet_SeqQuant" runat="server"  DatabaseField="SeqQuant_ItmSet"></def:ValueSetLabel> 
</td>


</tr>
</table>
</asp:Panel>
	   
	   


<%--   
<table>
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
	<td width ="150px"><b>Core</b></td><td><u>Item Set</u></td><td><u>Raw</u></td><td><u>Ability Score</u></td><td><u><b>T Score</b></u></td><td><u>Age Equiv</u></td><td  width="150px"><u>Age Equiv (text)</u></td>
</tr>
<tr>

<tr>
	<td width ="150px"><b>Diagnostic</b></td><td><u>Item Set</u></td><td><u>Raw</u></td><td><u>Ability Score</u></td><td><u><b>T Score</b></u></td><td><u>Age Equiv</u></td><td width="150px"><u>Age Equiv (text)</u></td>
</tr>


</table>

--%>










<br/>
<br/>



<%--
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
 --%>


<br/>
<br/>

<def:datafieldcontrol runat="server" id="created" DatabaseField="created" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="300px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="createdBy" DatabaseField="createdBy" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="300px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="50"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="updated" DatabaseField="updated" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="300px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="updatedBy" DatabaseField="updatedBy" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="300px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="50"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="scored" DatabaseField="scored" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="300px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="scoredBy" DatabaseField="scoredBy" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="300px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="50"></def:datafieldcontrol>
</div>

</asp:Panel>
</asp:Content>
