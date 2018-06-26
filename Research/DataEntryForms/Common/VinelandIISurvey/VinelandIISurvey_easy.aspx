

<%@ Register TagPrefix="def" Namespace="DataEntryFramework3" %> 
<%@ Page language="c#" MasterPageFile="~/UWAC.master"  Title="Vineland II Survey Data Entry" %>
<asp:Content ID="Content1" ContentPlaceHolderID="oBodyPlaceHolder" runat="server">

<def:dataentrycontroller id="DataEntryController1" runat="server" DatabaseTable="ALL_VinelandIISurvey" >
</def:dataentrycontroller>
<div class="main">
  <def:datafieldcontrol runat="server" id="id" DatabaseField="id" IsInsertField="true" FieldLabelWidth="200px" FieldTextBoxWidth="150px" FieldTextBoxMaxLength="15"></def:datafieldcontrol>
  <def:datafieldcontrol runat="server" id="indexnum" DatabaseField="indexnum" IsInsertField="true" FieldTextBoxTextDefault="1" FieldLabelWidth="200px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
  <def:datafieldcontrol runat="server" id="TEST_DATE" DatabaseField="TEST_DATE" FieldLabelText="Interview Date" FormatString="{0:d}" IsInsertField="true" FieldLabelWidth="200px" FieldTextBoxWidth="150px" ></def:datafieldcontrol>
  <def:datafieldcontrol runat="server" id="EXAMINER" DatabaseField="EXAMINER" FieldLabelText="Examiner" IsInsertField="true" FieldLabelWidth="200px" FieldTextBoxWidth="150px" FieldTextBoxMaxLength="50"></def:datafieldcontrol>
  <def:datafieldcontrol runat="server" id="FORM" DatabaseField="FORM" FieldLabelText="Form Version (Survey Interview, Parent/Caregiver Rating)" IsInsertField="true" FieldTextBoxWidth="150px" FieldTextBoxTextDefault="Survey Interview" FieldLabelWidth="200px" FieldTextBoxMaxLength="50"></def:datafieldcontrol>
  <def:datafieldcontrol runat="server" id="RESPONDENT_SEX" DatabaseField="RESPONDENT_SEX" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="200px" FieldTextBoxWidth="40px" FieldTextBoxMaxLength="50"></def:datafieldcontrol>
  <def:datafieldcontrol runat="server" id="RELATIONSHIP" DatabaseField="RELATIONSHIP" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="200px" FieldTextBoxWidth="150px" FieldTextBoxMaxLength="50"></def:datafieldcontrol>
</div>

<asp:panel id="mainPanel" CssClass="mainPanel" runat="server">
<div class="main">
  <def:datafieldcontrol runat="server" id="v2sex" DatabaseField="v2sex" IsReadOnly="true" RenderReadOnlyAsDiv = "true"  FieldLabelWidth="200px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="50"></def:datafieldcontrol>
  <def:datafieldcontrol runat="server" id="v2AGE" DatabaseField="v2AGE" IsReadOnly="true" RenderReadOnlyAsDiv = "true"  FieldLabelWidth="200px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="50"></def:datafieldcontrol>
  <def:datafieldcontrol runat="server" id="v2AGEmos" DatabaseField="v2AGEmos" IsReadOnly="true" RenderReadOnlyAsDiv = "true"  FieldLabelWidth="200px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
</div>


<div class="main">

<br/><b><font color="darkblue">
<h5><u>Summary Scores:</u></b></h5></font>

<table border="1px">
<tr>
<td><u>Domain</u></td>
<td><u>Raw score</u></td>
<td><u>V scaled score<br/><b>Std Score</b></u></td>
<td><u>Pctile</u></td>
<td><u>Adapt. Level</u></td>
<td><u>Age Equiv</u></td>
<td><u>Age Equiv (mos)</u></td>
<td><u>Stanine</u></td>

</tr>
<tr>
<td>Receptive</td>
<td> <def:datafieldcontrol runat="server" id="REC_RAW" DatabaseField="REC_RAW" IsReadOnly="true"  ShowFieldLabel="false"    FieldLabelWidth="50px" FieldTextBoxWidth="40px" RenderReadOnlyAsDiv = "true" ></def:datafieldcontrol> </td> 
<td> <def:datafieldcontrol runat="server" id="REC_VSCALE" DatabaseField="REC_VSCALE" IsReadOnly="true"  ShowFieldLabel="false"    FieldLabelWidth="50px" FieldTextBoxWidth="40px" RenderReadOnlyAsDiv = "true" ></def:datafieldcontrol> </td> 
<td> -- </td> 
<td> <def:datafieldcontrol runat="server" id="REC_ADAPT_LEVEL" DatabaseField="REC_ADAPT_LEVEL" IsReadOnly="true"  ShowFieldLabel="false"    FieldLabelWidth="50px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="50" RenderReadOnlyAsDiv = "true" ></def:datafieldcontrol> </td> 
<td> <def:datafieldcontrol runat="server" id="REC_AGE_EQUIV" DatabaseField="REC_AGE_EQUIV" IsReadOnly="true"  ShowFieldLabel="false"    FieldLabelWidth="50px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="50" RenderReadOnlyAsDiv = "true" ></def:datafieldcontrol> </td> 
<td> <def:datafieldcontrol runat="server" id="REC_AGE_EQUIV_mos" DatabaseField="REC_AGE_EQUIV_mos" IsReadOnly="true"  ShowFieldLabel="false"    FieldLabelWidth="50px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="50" RenderReadOnlyAsDiv = "true" ></def:datafieldcontrol> </td> 
</tr>
<tr>
<td>Expressive</td>
<td> <def:datafieldcontrol runat="server" id="EXP_RAW" DatabaseField="EXP_RAW" IsReadOnly="true"  ShowFieldLabel="false"    FieldLabelWidth="50px" FieldTextBoxWidth="40px" RenderReadOnlyAsDiv = "true" ></def:datafieldcontrol> </td> 
<td> <def:datafieldcontrol runat="server" id="EXP_VSCALE" DatabaseField="EXP_VSCALE" IsReadOnly="true"  ShowFieldLabel="false"    FieldLabelWidth="50px" FieldTextBoxWidth="40px" RenderReadOnlyAsDiv = "true" ></def:datafieldcontrol> </td> 
<td> -- </td> 
<td> <def:datafieldcontrol runat="server" id="EXP_ADAPT_LEVEL" DatabaseField="EXP_ADAPT_LEVEL" IsReadOnly="true"  ShowFieldLabel="false"    FieldLabelWidth="50px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="50" RenderReadOnlyAsDiv = "true" ></def:datafieldcontrol> </td> 
<td> <def:datafieldcontrol runat="server" id="EXP_AGE_EQUIV" DatabaseField="EXP_AGE_EQUIV" IsReadOnly="true"  ShowFieldLabel="false"    FieldLabelWidth="50px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="50" RenderReadOnlyAsDiv = "true" ></def:datafieldcontrol> </td> 
<td> <def:datafieldcontrol runat="server" id="EXP_AGE_EQUIV_mos" DatabaseField="EXP_AGE_EQUIV_mos" IsReadOnly="true"  ShowFieldLabel="false"    FieldLabelWidth="50px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="50" RenderReadOnlyAsDiv = "true" ></def:datafieldcontrol> </td> 
</tr>
<tr>
<td>Written</td>
<td> <def:datafieldcontrol runat="server" id="WRN_RAW" DatabaseField="WRN_RAW" IsReadOnly="true"  ShowFieldLabel="false"    FieldLabelWidth="50px" FieldTextBoxWidth="40px" RenderReadOnlyAsDiv = "true" ></def:datafieldcontrol> </td> 
<td> <def:datafieldcontrol runat="server" id="WRN_VSCALE" DatabaseField="WRN_VSCALE" IsReadOnly="true"  ShowFieldLabel="false"    FieldLabelWidth="50px" FieldTextBoxWidth="40px" RenderReadOnlyAsDiv = "true" ></def:datafieldcontrol> </td> 
<td> -- </td> 
<td> <def:datafieldcontrol runat="server" id="WRN_ADAPT_LEVEL" DatabaseField="WRN_ADAPT_LEVEL" IsReadOnly="true"  ShowFieldLabel="false"    FieldLabelWidth="50px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="50" RenderReadOnlyAsDiv = "true" ></def:datafieldcontrol> </td> 
<td> <def:datafieldcontrol runat="server" id="WRN_AGE_EQUIV" DatabaseField="WRN_AGE_EQUIV" IsReadOnly="true"  ShowFieldLabel="false"    FieldLabelWidth="50px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="50" RenderReadOnlyAsDiv = "true" ></def:datafieldcontrol> </td> 
<td> <def:datafieldcontrol runat="server" id="WRN_AGE_EQUIV_mos" DatabaseField="WRN_AGE_EQUIV_mos" IsReadOnly="true"  ShowFieldLabel="false"    FieldLabelWidth="50px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="50" RenderReadOnlyAsDiv = "true" ></def:datafieldcontrol> </td> 
</tr>
<tr>
<td><b>COMMUNICATION</b></td>
<td> <b><def:datafieldcontrol runat="server" id="COM_SUM_VSCALES_FOR_DOMAIN" DatabaseField="COM_SUM_VSCALES_FOR_DOMAIN" IsReadOnly="true"  ShowFieldLabel="false"    FieldLabelWidth="50px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="50" RenderReadOnlyAsDiv = "true" ></def:datafieldcontrol> </b></td> 
<td> <b><def:datafieldcontrol runat="server" id="COM_STD_SCORE" DatabaseField="COM_STD_SCORE" IsReadOnly="true"  ShowFieldLabel="false"    FieldLabelWidth="50px" FieldTextBoxWidth="40px" RenderReadOnlyAsDiv = "true" ></def:datafieldcontrol> </b></td> 
<td> <b><def:datafieldcontrol runat="server" id="COM_PCTILE_RANK" DatabaseField="COM_PCTILE_RANK" IsReadOnly="true"  ShowFieldLabel="false"    FieldLabelWidth="50px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="50" RenderReadOnlyAsDiv = "true" ></def:datafieldcontrol> </b></td> 
<td> <b><def:datafieldcontrol runat="server" id="COM_ADAPT_LEVEL" DatabaseField="COM_ADAPT_LEVEL" IsReadOnly="true"  ShowFieldLabel="false"    FieldLabelWidth="50px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="50" RenderReadOnlyAsDiv = "true" ></def:datafieldcontrol> </b></td> 
<td> <b><def:datafieldcontrol runat="server" id="COM_AGE_EQUIV" DatabaseField="COM_AGE_EQUIV" IsReadOnly="true"  ShowFieldLabel="false"    FieldLabelWidth="50px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="50" RenderReadOnlyAsDiv = "true" ></def:datafieldcontrol> </b></td> 
<td></td><td> <b><def:datafieldcontrol runat="server" id="COM_STANINE" DatabaseField="COM_STANINE" IsReadOnly="true"  ShowFieldLabel="false"    FieldLabelWidth="50px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="50" RenderReadOnlyAsDiv = "true" ></def:datafieldcontrol> </b></td> 

</tr>
<tr>
<td>Personal</td>
<td> <def:datafieldcontrol runat="server" id="PER_RAW" DatabaseField="PER_RAW" IsReadOnly="true"  ShowFieldLabel="false"    FieldLabelWidth="50px" FieldTextBoxWidth="40px" RenderReadOnlyAsDiv = "true" ></def:datafieldcontrol> </td> 
<td> <def:datafieldcontrol runat="server" id="PER_VSCALE" DatabaseField="PER_VSCALE" IsReadOnly="true"  ShowFieldLabel="false"    FieldLabelWidth="50px" FieldTextBoxWidth="40px" RenderReadOnlyAsDiv = "true" ></def:datafieldcontrol> </td> 
<td> -- </td> 
<td> <def:datafieldcontrol runat="server" id="PER_ADAPT_LEVEL" DatabaseField="PER_ADAPT_LEVEL" IsReadOnly="true"  ShowFieldLabel="false"    FieldLabelWidth="50px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="50" RenderReadOnlyAsDiv = "true" ></def:datafieldcontrol> </td> 
<td> <def:datafieldcontrol runat="server" id="PER_AGE_EQUIV" DatabaseField="PER_AGE_EQUIV" IsReadOnly="true"  ShowFieldLabel="false"    FieldLabelWidth="50px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="50" RenderReadOnlyAsDiv = "true" ></def:datafieldcontrol> </td> 
<td> <def:datafieldcontrol runat="server" id="PER_AGE_EQUIV_mos" DatabaseField="PER_AGE_EQUIV_mos" IsReadOnly="true"  ShowFieldLabel="false"    FieldLabelWidth="50px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="50" RenderReadOnlyAsDiv = "true" ></def:datafieldcontrol> </td> 
</tr>
<tr>
<td>Domestic</td>
<td> <def:datafieldcontrol runat="server" id="DOM_RAW" DatabaseField="DOM_RAW" IsReadOnly="true"  ShowFieldLabel="false"    FieldLabelWidth="50px" FieldTextBoxWidth="40px" RenderReadOnlyAsDiv = "true" ></def:datafieldcontrol> </td> 
<td> <def:datafieldcontrol runat="server" id="DOM_VSCALE" DatabaseField="DOM_VSCALE" IsReadOnly="true"  ShowFieldLabel="false"    FieldLabelWidth="50px" FieldTextBoxWidth="40px" RenderReadOnlyAsDiv = "true" ></def:datafieldcontrol> </td> 
<td> -- </td> 
<td> <def:datafieldcontrol runat="server" id="DOM_ADAPT_LEVEL" DatabaseField="DOM_ADAPT_LEVEL" IsReadOnly="true"  ShowFieldLabel="false"    FieldLabelWidth="50px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="50" RenderReadOnlyAsDiv = "true" ></def:datafieldcontrol> </td> 
<td> <def:datafieldcontrol runat="server" id="DOM_AGE_EQUIV" DatabaseField="DOM_AGE_EQUIV" IsReadOnly="true"  ShowFieldLabel="false"    FieldLabelWidth="50px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="50" RenderReadOnlyAsDiv = "true" ></def:datafieldcontrol> </td> 
<td> <def:datafieldcontrol runat="server" id="DOM_AGE_EQUIV_mos" DatabaseField="DOM_AGE_EQUIV_mos" IsReadOnly="true"  ShowFieldLabel="false"    FieldLabelWidth="50px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="50" RenderReadOnlyAsDiv = "true" ></def:datafieldcontrol> </td> 
</tr>
<tr>
<td>Community</td>
<td> <def:datafieldcontrol runat="server" id="CMM_RAW" DatabaseField="CMM_RAW" IsReadOnly="true"  ShowFieldLabel="false"    FieldLabelWidth="50px" FieldTextBoxWidth="40px" RenderReadOnlyAsDiv = "true" ></def:datafieldcontrol> </td> 
<td> <def:datafieldcontrol runat="server" id="CMM_VSCALE" DatabaseField="CMM_VSCALE" IsReadOnly="true"  ShowFieldLabel="false"    FieldLabelWidth="50px" FieldTextBoxWidth="40px" RenderReadOnlyAsDiv = "true" ></def:datafieldcontrol> </td> 
<td> -- </td> 
<td> <def:datafieldcontrol runat="server" id="CMM_ADAPT_LEVEL" DatabaseField="CMM_ADAPT_LEVEL" IsReadOnly="true"  ShowFieldLabel="false"    FieldLabelWidth="50px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="50" RenderReadOnlyAsDiv = "true" ></def:datafieldcontrol> </td> 
<td> <def:datafieldcontrol runat="server" id="CMM_AGE_EQUIV" DatabaseField="CMM_AGE_EQUIV" IsReadOnly="true"  ShowFieldLabel="false"    FieldLabelWidth="50px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="50" RenderReadOnlyAsDiv = "true" ></def:datafieldcontrol> </td> 
<td> <def:datafieldcontrol runat="server" id="CMM_AGE_EQUIV_mos" DatabaseField="CMM_AGE_EQUIV_mos" IsReadOnly="true"  ShowFieldLabel="false"    FieldLabelWidth="50px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="50" RenderReadOnlyAsDiv = "true" ></def:datafieldcontrol> </td> 
</tr>
<tr>
<td><b>DAILY LIVING SKILLS</b></td>
<td> <b><def:datafieldcontrol runat="server" id="DLS_SUM_VSCALES_FOR_DOMAIN" DatabaseField="DLS_SUM_VSCALES_FOR_DOMAIN" IsReadOnly="true"  ShowFieldLabel="false"    FieldLabelWidth="50px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="50" RenderReadOnlyAsDiv = "true" ></def:datafieldcontrol> </b></td> 
<td> <b><def:datafieldcontrol runat="server" id="DLS_STD_SCORE" DatabaseField="DLS_STD_SCORE" IsReadOnly="true"  ShowFieldLabel="false"    FieldLabelWidth="50px" FieldTextBoxWidth="40px" RenderReadOnlyAsDiv = "true" ></def:datafieldcontrol> </b></td> 
<td> <b><def:datafieldcontrol runat="server" id="DLS_PCTILE_RANK" DatabaseField="DLS_PCTILE_RANK" IsReadOnly="true"  ShowFieldLabel="false"    FieldLabelWidth="50px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="50" RenderReadOnlyAsDiv = "true" ></def:datafieldcontrol> </b></td> 
<td> <b><def:datafieldcontrol runat="server" id="DLS_ADAPT_LEVEL" DatabaseField="DLS_ADAPT_LEVEL" IsReadOnly="true"  ShowFieldLabel="false"    FieldLabelWidth="50px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="50" RenderReadOnlyAsDiv = "true" ></def:datafieldcontrol> </b></td> 
<td> <b><def:datafieldcontrol runat="server" id="DLS_AGE_EQUIV" DatabaseField="DLS_AGE_EQUIV" IsReadOnly="true"  ShowFieldLabel="false"    FieldLabelWidth="50px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="50" RenderReadOnlyAsDiv = "true" ></def:datafieldcontrol> </b></td> 
<td></td><td> <b><def:datafieldcontrol runat="server" id="DLS_STANINE" DatabaseField="DLS_STANINE" IsReadOnly="true"  ShowFieldLabel="false"    FieldLabelWidth="50px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="50" RenderReadOnlyAsDiv = "true" ></def:datafieldcontrol> </b></td> 
</tr>
<tr>
<td>Interpersonal Relationships</td>
<td> <def:datafieldcontrol runat="server" id="IPR_RAW" DatabaseField="IPR_RAW" IsReadOnly="true"  ShowFieldLabel="false"    FieldLabelWidth="50px" FieldTextBoxWidth="40px" RenderReadOnlyAsDiv = "true" ></def:datafieldcontrol> </td> 
<td> <def:datafieldcontrol runat="server" id="IPR_VSCALE" DatabaseField="IPR_VSCALE" IsReadOnly="true"  ShowFieldLabel="false"    FieldLabelWidth="50px" FieldTextBoxWidth="40px" RenderReadOnlyAsDiv = "true" ></def:datafieldcontrol> </td> 
<td> -- </td> 
<td> <def:datafieldcontrol runat="server" id="IPR_ADAPT_LEVEL" DatabaseField="IPR_ADAPT_LEVEL" IsReadOnly="true"  ShowFieldLabel="false"    FieldLabelWidth="50px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="50" RenderReadOnlyAsDiv = "true" ></def:datafieldcontrol> </td> 
<td> <def:datafieldcontrol runat="server" id="IPR_AGE_EQUIV" DatabaseField="IPR_AGE_EQUIV" IsReadOnly="true"  ShowFieldLabel="false"    FieldLabelWidth="50px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="50" RenderReadOnlyAsDiv = "true" ></def:datafieldcontrol> </td> 
<td> <def:datafieldcontrol runat="server" id="IPR_AGE_EQUIV_mos" DatabaseField="IPR_AGE_EQUIV_mos" IsReadOnly="true"  ShowFieldLabel="false"    FieldLabelWidth="50px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="50" RenderReadOnlyAsDiv = "true" ></def:datafieldcontrol> </td> 
</tr>
<tr>
<td>Play/Leisure</td>
<td> <def:datafieldcontrol runat="server" id="PL_RAW" DatabaseField="PL_RAW" IsReadOnly="true"  ShowFieldLabel="false"    FieldLabelWidth="50px" FieldTextBoxWidth="40px" RenderReadOnlyAsDiv = "true" ></def:datafieldcontrol> </td> 
<td> <def:datafieldcontrol runat="server" id="PL_VSCALE" DatabaseField="PL_VSCALE" IsReadOnly="true"  ShowFieldLabel="false"    FieldLabelWidth="50px" FieldTextBoxWidth="40px" RenderReadOnlyAsDiv = "true" ></def:datafieldcontrol> </td> 
<td> -- </td> 
<td> <def:datafieldcontrol runat="server" id="PL_ADAPT_LEVEL" DatabaseField="PL_ADAPT_LEVEL" IsReadOnly="true"  ShowFieldLabel="false"    FieldLabelWidth="50px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="50" RenderReadOnlyAsDiv = "true" ></def:datafieldcontrol> </td> 
<td> <def:datafieldcontrol runat="server" id="PL_AGE_EQUIV" DatabaseField="PL_AGE_EQUIV" IsReadOnly="true"  ShowFieldLabel="false"    FieldLabelWidth="50px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="50" RenderReadOnlyAsDiv = "true" ></def:datafieldcontrol> </td> 
<td> <def:datafieldcontrol runat="server" id="PL_AGE_EQUIV_mos" DatabaseField="PL_AGE_EQUIV_mos" IsReadOnly="true"  ShowFieldLabel="false"    FieldLabelWidth="50px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="50" RenderReadOnlyAsDiv = "true" ></def:datafieldcontrol> </td> 
</tr>
<tr>
<td>Coping Skills</td>
<td> <def:datafieldcontrol runat="server" id="CS_RAW" DatabaseField="CS_RAW" IsReadOnly="true"  ShowFieldLabel="false"    FieldLabelWidth="50px" FieldTextBoxWidth="40px" RenderReadOnlyAsDiv = "true" ></def:datafieldcontrol> </td> 
<td> <def:datafieldcontrol runat="server" id="CS_VSCALE" DatabaseField="CS_VSCALE" IsReadOnly="true"  ShowFieldLabel="false"    FieldLabelWidth="50px" FieldTextBoxWidth="40px" RenderReadOnlyAsDiv = "true" ></def:datafieldcontrol> </td> 
<td> -- </td> 
<td> <def:datafieldcontrol runat="server" id="CS_ADAPT_LEVEL" DatabaseField="CS_ADAPT_LEVEL" IsReadOnly="true"  ShowFieldLabel="false"    FieldLabelWidth="50px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="50" RenderReadOnlyAsDiv = "true" ></def:datafieldcontrol> </td> 
<td> <def:datafieldcontrol runat="server" id="CS_AGE_EQUIV" DatabaseField="CS_AGE_EQUIV" IsReadOnly="true"  ShowFieldLabel="false"    FieldLabelWidth="50px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="50" RenderReadOnlyAsDiv = "true" ></def:datafieldcontrol> </td> 
<td> <def:datafieldcontrol runat="server" id="CS_AGE_EQUIV_mos" DatabaseField="CS_AGE_EQUIV_mos" IsReadOnly="true"  ShowFieldLabel="false"    FieldLabelWidth="50px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="50" RenderReadOnlyAsDiv = "true" ></def:datafieldcontrol> </td> 
</tr>
<tr>
<td><b>SOCIALIZATION</b></td>
<td><b> <def:datafieldcontrol runat="server" id="SOC_SUM_VSCALES_FOR_DOMAIN" DatabaseField="SOC_SUM_VSCALES_FOR_DOMAIN" IsReadOnly="true"  ShowFieldLabel="false"    FieldLabelWidth="50px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="50" RenderReadOnlyAsDiv = "true" ></def:datafieldcontrol> </b></td> 
<td> <b><def:datafieldcontrol runat="server" id="SOC_STD_SCORE" DatabaseField="SOC_STD_SCORE" IsReadOnly="true"  ShowFieldLabel="false"    FieldLabelWidth="50px" FieldTextBoxWidth="40px" RenderReadOnlyAsDiv = "true" ></def:datafieldcontrol> </b></td> 
<td> <b><def:datafieldcontrol runat="server" id="SOC_PCTILE_RANK" DatabaseField="SOC_PCTILE_RANK" IsReadOnly="true"  ShowFieldLabel="false"    FieldLabelWidth="50px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="50" RenderReadOnlyAsDiv = "true" ></def:datafieldcontrol> </b></td> 
<td> <b><def:datafieldcontrol runat="server" id="SOC_ADAPT_LEVEL" DatabaseField="SOC_ADAPT_LEVEL" IsReadOnly="true"  ShowFieldLabel="false"    FieldLabelWidth="50px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="50" RenderReadOnlyAsDiv = "true" ></def:datafieldcontrol> </b></td> 
<td> <b><def:datafieldcontrol runat="server" id="SOC_AGE_EQUIV" DatabaseField="SOC_AGE_EQUIV" IsReadOnly="true"  ShowFieldLabel="false"    FieldLabelWidth="50px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="50" RenderReadOnlyAsDiv = "true" ></def:datafieldcontrol> </b></td> 
<td></td><td> <b><def:datafieldcontrol runat="server" id="SOC_STANINE" DatabaseField="SOC_STANINE" IsReadOnly="true"  ShowFieldLabel="false"    FieldLabelWidth="50px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="50" RenderReadOnlyAsDiv = "true" ></def:datafieldcontrol> </b></td> 
</tr>
<tr>
<td>Gross Motor</td>
<td> <def:datafieldcontrol runat="server" id="GMS_RAW" DatabaseField="GMS_RAW" IsReadOnly="true"  ShowFieldLabel="false"    FieldLabelWidth="50px" FieldTextBoxWidth="40px" RenderReadOnlyAsDiv = "true" ></def:datafieldcontrol> </td> 
<td> <def:datafieldcontrol runat="server" id="GMS_VSCALE" DatabaseField="GMS_VSCALE" IsReadOnly="true"  ShowFieldLabel="false"    FieldLabelWidth="50px" FieldTextBoxWidth="40px" RenderReadOnlyAsDiv = "true" ></def:datafieldcontrol> </td> 
<td> -- </td> 
<td> <def:datafieldcontrol runat="server" id="GMS_ADAPT_LEVEL" DatabaseField="GMS_ADAPT_LEVEL" IsReadOnly="true"  ShowFieldLabel="false"    FieldLabelWidth="50px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="50" RenderReadOnlyAsDiv = "true" ></def:datafieldcontrol> </td> 
<td> <def:datafieldcontrol runat="server" id="GMS_AGE_EQUIV" DatabaseField="GMS_AGE_EQUIV" IsReadOnly="true"  ShowFieldLabel="false"    FieldLabelWidth="50px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="50" RenderReadOnlyAsDiv = "true" ></def:datafieldcontrol> </td> 
<td> <def:datafieldcontrol runat="server" id="GMS_AGE_EQUIV_mos" DatabaseField="GMS_AGE_EQUIV_mos" IsReadOnly="true"  ShowFieldLabel="false"    FieldLabelWidth="50px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="50" RenderReadOnlyAsDiv = "true" ></def:datafieldcontrol> </td> 
</tr>
<tr>
<td>Fine Motor</td>
<td> <def:datafieldcontrol runat="server" id="FMS_RAW" DatabaseField="FMS_RAW" IsReadOnly="true"  ShowFieldLabel="false"    FieldLabelWidth="50px" FieldTextBoxWidth="40px" RenderReadOnlyAsDiv = "true" ></def:datafieldcontrol> </td> 
<td> <def:datafieldcontrol runat="server" id="FMS_VSCALE" DatabaseField="FMS_VSCALE" IsReadOnly="true"  ShowFieldLabel="false"    FieldLabelWidth="50px" FieldTextBoxWidth="40px" RenderReadOnlyAsDiv = "true" ></def:datafieldcontrol> </td> 
<td> -- </td> 
<td> <def:datafieldcontrol runat="server" id="FMS_ADAPT_LEVEL" DatabaseField="FMS_ADAPT_LEVEL" IsReadOnly="true"  ShowFieldLabel="false"    FieldLabelWidth="50px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="50" RenderReadOnlyAsDiv = "true" ></def:datafieldcontrol> </td> 
<td> <def:datafieldcontrol runat="server" id="FMS_AGE_EQUIV" DatabaseField="FMS_AGE_EQUIV" IsReadOnly="true"  ShowFieldLabel="false"    FieldLabelWidth="50px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="50" RenderReadOnlyAsDiv = "true" ></def:datafieldcontrol> </td> 
<td> <def:datafieldcontrol runat="server" id="FMS_AGE_EQUIV_mos" DatabaseField="FMS_AGE_EQUIV_mos" IsReadOnly="true"  ShowFieldLabel="false"    FieldLabelWidth="50px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="50" RenderReadOnlyAsDiv = "true" ></def:datafieldcontrol> </td> 
</tr>
<tr>
<td><b>MOTOR SKILLS</b></td>
<td> <b> <def:datafieldcontrol runat="server" id="MS_SUM_VSCALES_FOR_DOMAIN" DatabaseField="MS_SUM_VSCALES_FOR_DOMAIN" IsReadOnly="true"  ShowFieldLabel="false"    FieldLabelWidth="50px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="50" RenderReadOnlyAsDiv = "true" ></def:datafieldcontrol> </b></td> 
<td> <b><def:datafieldcontrol runat="server" id="MS_STD_SCORE" DatabaseField="MS_STD_SCORE" IsReadOnly="true"  ShowFieldLabel="false"    FieldLabelWidth="50px" FieldTextBoxWidth="40px" RenderReadOnlyAsDiv = "true" ></def:datafieldcontrol> </b></td> 
<td> <b><def:datafieldcontrol runat="server" id="MS_PCTILE_RANK" DatabaseField="MS_PCTILE_RANK" IsReadOnly="true"  ShowFieldLabel="false"    FieldLabelWidth="50px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="50" RenderReadOnlyAsDiv = "true" ></def:datafieldcontrol> </b></td> 
<td> <b><def:datafieldcontrol runat="server" id="MS_ADAPT_LEVEL" DatabaseField="MS_ADAPT_LEVEL" IsReadOnly="true"  ShowFieldLabel="false"    FieldLabelWidth="50px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="50" RenderReadOnlyAsDiv = "true" ></def:datafieldcontrol> </b></td> 
<td> <b><def:datafieldcontrol runat="server" id="MS_AGE_EQUIV" DatabaseField="MS_AGE_EQUIV" IsReadOnly="true"  ShowFieldLabel="false"    FieldLabelWidth="50px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="50" RenderReadOnlyAsDiv = "true" ></def:datafieldcontrol> </b></td> 
<td></td><td> <b><def:datafieldcontrol runat="server" id="MS_STANINE" DatabaseField="MS_STANINE" IsReadOnly="true"  ShowFieldLabel="false"    FieldLabelWidth="50px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="50" RenderReadOnlyAsDiv = "true" ></def:datafieldcontrol> </b></td> 
</tr>
<tr>
</tr>
<tr>
</tr>
<tr>
</tr>
<tr>
<td><b>ADAPTIVE BEHAV COMPOSITE</b></td>
<td> <b><def:datafieldcontrol runat="server" id="ABC_SUM_ALL_DOM_STD_SCORES" DatabaseField="ABC_SUM_ALL_DOM_STD_SCORES" IsReadOnly="true"  ShowFieldLabel="false"    FieldLabelWidth="50px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="50" RenderReadOnlyAsDiv = "true" ></def:datafieldcontrol> </b></td> 
<td> <b><def:datafieldcontrol runat="server" id="ABC_STD_SCORE" DatabaseField="ABC_STD_SCORE" IsReadOnly="true"  ShowFieldLabel="false"    FieldLabelWidth="50px" FieldTextBoxWidth="40px" RenderReadOnlyAsDiv = "true" ></def:datafieldcontrol> </b></td> 
<td> <b><def:datafieldcontrol runat="server" id="ABC_PCTILE_RANK" DatabaseField="ABC_PCTILE_RANK" IsReadOnly="true"  ShowFieldLabel="false"    FieldLabelWidth="50px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="50" RenderReadOnlyAsDiv = "true" ></def:datafieldcontrol> </b></td> 
<td> <b><def:datafieldcontrol runat="server" id="ABC_ADAPT_LEVEL" DatabaseField="ABC_ADAPT_LEVEL" IsReadOnly="true"  ShowFieldLabel="false"    FieldLabelWidth="50px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="50" RenderReadOnlyAsDiv = "true" ></def:datafieldcontrol> </b></td> 
<td> <b><def:datafieldcontrol runat="server" id="ABC_AGE_EQUIV" DatabaseField="ABC_AGE_EQUIV" IsReadOnly="true"  ShowFieldLabel="false"    FieldLabelWidth="50px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="50" RenderReadOnlyAsDiv = "true" ></def:datafieldcontrol> </b></td> 
<td></td><td> <b><def:datafieldcontrol runat="server" id="ABC_STANINE" DatabaseField="ABC_STANINE" IsReadOnly="true"  ShowFieldLabel="false"    FieldLabelWidth="50px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="50" RenderReadOnlyAsDiv = "true" ></def:datafieldcontrol> </b></td> 
</tr>

</table>
</div>


<div class="main">
<h5><b><font color="darkblue">
<u>Domain significant differences:</u></h5></b></font>
<table border = "1px">
<tr> <td> <b><u>Domains</b></u></td><td> <b><u>Significant differences (blank if NS)</b></u></td></tr>
<tr> <td> COM vs. DLS</td><td> <def:datafieldcontrol runat="server" id="DomD_COM_DLS" DatabaseField="DomD_COM_DLS" IsReadOnly="true"  ShowFieldLabel="false"    FieldTextBoxWidth="40px" RenderReadOnlyAsDiv = "true" ></def:datafieldcontrol> </td> </tr> 
<tr> <td> COM vs. SOC</td><td> <def:datafieldcontrol runat="server" id="DomD_COM_SOC" DatabaseField="DomD_COM_SOC" IsReadOnly="true"  ShowFieldLabel="false"    FieldTextBoxWidth="40px" RenderReadOnlyAsDiv = "true" ></def:datafieldcontrol> </td> </tr> 
<tr> <td> COM vs. MS</td><td> <def:datafieldcontrol runat="server" id="DomD_COM_MS"  DatabaseField="DomD_COM_MS"  IsReadOnly="true"  ShowFieldLabel="false"    FieldTextBoxWidth="40px" RenderReadOnlyAsDiv = "true" ></def:datafieldcontrol> </td> </tr> 
<tr> <td> DLS vs. SOC</td><td> <def:datafieldcontrol runat="server" id="DomD_DLS_SOC" DatabaseField="DomD_DLS_SOC" IsReadOnly="true"  ShowFieldLabel="false"    FieldTextBoxWidth="40px" RenderReadOnlyAsDiv = "true" ></def:datafieldcontrol> </td> </tr> 
<tr> <td> DLS vs. MS</td><td> <def:datafieldcontrol runat="server" id="DomD_DLS_MS"  DatabaseField="DomD_DLS_MS"  IsReadOnly="true"  ShowFieldLabel="false"    FieldTextBoxWidth="40px" RenderReadOnlyAsDiv = "true" ></def:datafieldcontrol> </td> </tr> 
<tr> <td> SOC vs. MS</td><td> <def:datafieldcontrol runat="server" id="DomD_SOC_MS"  DatabaseField="DomD_SOC_MS"  IsReadOnly="true"  ShowFieldLabel="false"    FieldTextBoxWidth="40px" RenderReadOnlyAsDiv = "true" ></def:datafieldcontrol> </td> </tr> 
</table>
</div>



<div class="main">
<br/><b><font color="darkblue">
<h5><u>Subdomain significant differences:</u></b></h5></font>
<font color = "darkgreen">Above the diagonal = Table D.5: Bonferroni corrected comparisons (use when making 10 or more pairwise comparisons)<br/></font>
<font color = "darkred">Below the diagonal = Table D.3: Uncorrected comparisons <br/></font>
<table border = "1px">
<tr><font color = "darkgreen">
<td width = "105px">SUBdomains</td>
<td width = "105px"><font color = "darkgreen">REC</font></td>
<td width = "105px"><font color = "darkgreen">EXP</font></td>
<td width = "105px"><font color = "darkgreen">WRN</font></td>
<td width = "105px"><font color = "darkgreen">PER</font></td>
<td width = "105px"><font color = "darkgreen">DOM</font></td>
<td width = "105px"><font color = "darkgreen">CMM</font></td>
<td width = "105px"><font color = "darkgreen">IPR</font></td>
<td width = "105px"><font color = "darkgreen">PL</font></td>
<td width = "105px"><font color = "darkgreen">CS</font></td>
<td width = "105px"><font color = "darkgreen">GMS</font></td>
<td width = "105px"><font color = "darkgreen">FMS</font></td>
</tr>
<tr>
<td><font color = "darkred">REC</td>
<td>-</td>
<td> <font color = "darkgreen"><def:datafieldcontrol runat="server" id="SubD_rec_exp_Bonf" DatabaseField="SubD_rec_exp_Bonf" IsReadOnly="true"  ShowFieldLabel="false"    FieldTextBoxWidth="40px" RenderReadOnlyAsDiv = "true" ></def:datafieldcontrol> </td> 
<td> <font color = "darkgreen"><def:datafieldcontrol runat="server" id="SubD_rec_wrn_Bonf" DatabaseField="SubD_rec_wrn_Bonf" IsReadOnly="true"  ShowFieldLabel="false"    FieldTextBoxWidth="40px" RenderReadOnlyAsDiv = "true" ></def:datafieldcontrol> </td> 
<td> <font color = "darkgreen"><def:datafieldcontrol runat="server" id="SubD_rec_per_Bonf" DatabaseField="SubD_rec_per_Bonf" IsReadOnly="true"  ShowFieldLabel="false"    FieldTextBoxWidth="40px" RenderReadOnlyAsDiv = "true" ></def:datafieldcontrol> </td> 
<td> <font color = "darkgreen"><def:datafieldcontrol runat="server" id="SubD_rec_dom_Bonf" DatabaseField="SubD_rec_dom_Bonf" IsReadOnly="true"  ShowFieldLabel="false"    FieldTextBoxWidth="40px" RenderReadOnlyAsDiv = "true" ></def:datafieldcontrol> </td> 
<td> <font color = "darkgreen"><def:datafieldcontrol runat="server" id="SubD_rec_cmm_Bonf" DatabaseField="SubD_rec_cmm_Bonf" IsReadOnly="true"  ShowFieldLabel="false"    FieldTextBoxWidth="40px" RenderReadOnlyAsDiv = "true" ></def:datafieldcontrol> </td> 
<td> <font color = "darkgreen"><def:datafieldcontrol runat="server" id="SubD_rec_ipr_Bonf" DatabaseField="SubD_rec_ipr_Bonf" IsReadOnly="true"  ShowFieldLabel="false"    FieldTextBoxWidth="40px" RenderReadOnlyAsDiv = "true" ></def:datafieldcontrol> </td> 
<td> <font color = "darkgreen"><def:datafieldcontrol runat="server" id="SubD_rec_pl_Bonf" DatabaseField="SubD_rec_pl_Bonf" IsReadOnly="true"  ShowFieldLabel="false"    FieldTextBoxWidth="40px" RenderReadOnlyAsDiv = "true" ></def:datafieldcontrol> </td> 
<td> <font color = "darkgreen"><def:datafieldcontrol runat="server" id="SubD_rec_cs_Bonf" DatabaseField="SubD_rec_cs_Bonf" IsReadOnly="true"  ShowFieldLabel="false"    FieldTextBoxWidth="40px" RenderReadOnlyAsDiv = "true" ></def:datafieldcontrol> </td> 
<td> <font color = "darkgreen"><def:datafieldcontrol runat="server" id="SubD_rec_gms_Bonf" DatabaseField="SubD_rec_gms_Bonf" IsReadOnly="true"  ShowFieldLabel="false"    FieldTextBoxWidth="40px" RenderReadOnlyAsDiv = "true" ></def:datafieldcontrol> </td> 
<td> <font color = "darkgreen"><def:datafieldcontrol runat="server" id="SubD_rec_fms_Bonf" DatabaseField="SubD_rec_fms_Bonf" IsReadOnly="true"  ShowFieldLabel="false"    FieldTextBoxWidth="40px" RenderReadOnlyAsDiv = "true" ></def:datafieldcontrol> </td> 
</font></tr>
<tr>
<td><font color = "darkred">EXP</td>
<td> <font color = "darkred"><def:datafieldcontrol runat="server" id="SubD_rec_exp" DatabaseField="SubD_rec_exp" IsReadOnly="true"  ShowFieldLabel="false"    FieldTextBoxWidth="40px" RenderReadOnlyAsDiv = "true" ></def:datafieldcontrol> </td> 
<td>-</td>
<td> <font color = "darkgreen"><def:datafieldcontrol runat="server" id="SubD_exp_wrn_Bonf" DatabaseField="SubD_exp_wrn_Bonf" IsReadOnly="true"  ShowFieldLabel="false"    FieldTextBoxWidth="40px" RenderReadOnlyAsDiv = "true" ></def:datafieldcontrol> </td> 
<td> <font color = "darkgreen"><def:datafieldcontrol runat="server" id="SubD_exp_per_Bonf" DatabaseField="SubD_exp_per_Bonf" IsReadOnly="true"  ShowFieldLabel="false"    FieldTextBoxWidth="40px" RenderReadOnlyAsDiv = "true" ></def:datafieldcontrol> </td> 
<td> <font color = "darkgreen"><def:datafieldcontrol runat="server" id="SubD_exp_dom_Bonf" DatabaseField="SubD_exp_dom_Bonf" IsReadOnly="true"  ShowFieldLabel="false"    FieldTextBoxWidth="40px" RenderReadOnlyAsDiv = "true" ></def:datafieldcontrol> </td> 
<td> <font color = "darkgreen"><def:datafieldcontrol runat="server" id="SubD_exp_cmm_Bonf" DatabaseField="SubD_exp_cmm_Bonf" IsReadOnly="true"  ShowFieldLabel="false"    FieldTextBoxWidth="40px" RenderReadOnlyAsDiv = "true" ></def:datafieldcontrol> </td> 
<td> <font color = "darkgreen"><def:datafieldcontrol runat="server" id="SubD_exp_ipr_Bonf" DatabaseField="SubD_exp_ipr_Bonf" IsReadOnly="true"  ShowFieldLabel="false"    FieldTextBoxWidth="40px" RenderReadOnlyAsDiv = "true" ></def:datafieldcontrol> </td> 
<td> <font color = "darkgreen"><def:datafieldcontrol runat="server" id="SubD_exp_pl_Bonf" DatabaseField="SubD_exp_pl_Bonf" IsReadOnly="true"  ShowFieldLabel="false"    FieldTextBoxWidth="40px" RenderReadOnlyAsDiv = "true" ></def:datafieldcontrol> </td> 
<td> <font color = "darkgreen"><def:datafieldcontrol runat="server" id="SubD_exp_cs_Bonf" DatabaseField="SubD_exp_cs_Bonf" IsReadOnly="true"  ShowFieldLabel="false"    FieldTextBoxWidth="40px" RenderReadOnlyAsDiv = "true" ></def:datafieldcontrol> </td> 
<td> <font color = "darkgreen"><def:datafieldcontrol runat="server" id="SubD_exp_gms_Bonf" DatabaseField="SubD_exp_gms_Bonf" IsReadOnly="true"  ShowFieldLabel="false"    FieldTextBoxWidth="40px" RenderReadOnlyAsDiv = "true" ></def:datafieldcontrol> </td> 
<td> <font color = "darkgreen"><def:datafieldcontrol runat="server" id="SubD_exp_fms_Bonf" DatabaseField="SubD_exp_fms_Bonf" IsReadOnly="true"  ShowFieldLabel="false"    FieldTextBoxWidth="40px" RenderReadOnlyAsDiv = "true" ></def:datafieldcontrol> </td> 
</tr>
<tr>
<td><font color = "darkred">WRN</td>
<td> <font color = "darkred"><def:datafieldcontrol runat="server" id="SubD_rec_wrn" DatabaseField="SubD_rec_wrn" IsReadOnly="true"  ShowFieldLabel="false"    FieldTextBoxWidth="40px" RenderReadOnlyAsDiv = "true" ></def:datafieldcontrol> </td> 
<td> <font color = "darkred"><def:datafieldcontrol runat="server" id="SubD_exp_wrn" DatabaseField="SubD_exp_wrn" IsReadOnly="true"  ShowFieldLabel="false"    FieldTextBoxWidth="40px" RenderReadOnlyAsDiv = "true" ></def:datafieldcontrol> </td> 
<td>-</td>
<td> <font color = "darkgreen"><def:datafieldcontrol runat="server" id="SubD_wrn_per_Bonf" DatabaseField="SubD_wrn_per_Bonf" IsReadOnly="true"  ShowFieldLabel="false"    FieldTextBoxWidth="40px" RenderReadOnlyAsDiv = "true" ></def:datafieldcontrol> </td> 
<td> <font color = "darkgreen"><def:datafieldcontrol runat="server" id="SubD_wrn_dom_Bonf" DatabaseField="SubD_wrn_dom_Bonf" IsReadOnly="true"  ShowFieldLabel="false"    FieldTextBoxWidth="40px" RenderReadOnlyAsDiv = "true" ></def:datafieldcontrol> </td> 
<td> <font color = "darkgreen"><def:datafieldcontrol runat="server" id="SubD_wrn_cmm_Bonf" DatabaseField="SubD_wrn_cmm_Bonf" IsReadOnly="true"  ShowFieldLabel="false"    FieldTextBoxWidth="40px" RenderReadOnlyAsDiv = "true" ></def:datafieldcontrol> </td> 
<td> <font color = "darkgreen"><def:datafieldcontrol runat="server" id="SubD_wrn_ipr_Bonf" DatabaseField="SubD_wrn_ipr_Bonf" IsReadOnly="true"  ShowFieldLabel="false"    FieldTextBoxWidth="40px" RenderReadOnlyAsDiv = "true" ></def:datafieldcontrol> </td> 
<td> <font color = "darkgreen"><def:datafieldcontrol runat="server" id="SubD_wrn_pl_Bonf" DatabaseField="SubD_wrn_pl_Bonf" IsReadOnly="true"  ShowFieldLabel="false"    FieldTextBoxWidth="40px" RenderReadOnlyAsDiv = "true" ></def:datafieldcontrol> </td> 
<td> <font color = "darkgreen"><def:datafieldcontrol runat="server" id="SubD_wrn_cs_Bonf" DatabaseField="SubD_wrn_cs_Bonf" IsReadOnly="true"  ShowFieldLabel="false"    FieldTextBoxWidth="40px" RenderReadOnlyAsDiv = "true" ></def:datafieldcontrol> </td> 
<td> <font color = "darkgreen"><def:datafieldcontrol runat="server" id="SubD_wrn_gms_Bonf" DatabaseField="SubD_wrn_gms_Bonf" IsReadOnly="true"  ShowFieldLabel="false"    FieldTextBoxWidth="40px" RenderReadOnlyAsDiv = "true" ></def:datafieldcontrol> </td> 
<td> <font color = "darkgreen"><def:datafieldcontrol runat="server" id="SubD_wrn_fms_Bonf" DatabaseField="SubD_wrn_fms_Bonf" IsReadOnly="true"  ShowFieldLabel="false"    FieldTextBoxWidth="40px" RenderReadOnlyAsDiv = "true" ></def:datafieldcontrol> </td> 
</tr>
<tr>
<td><font color = "darkred">PER</td>
<td> <font color = "darkred"><def:datafieldcontrol runat="server" id="SubD_rec_per" DatabaseField="SubD_rec_per" IsReadOnly="true"  ShowFieldLabel="false"    FieldTextBoxWidth="40px" RenderReadOnlyAsDiv = "true" ></def:datafieldcontrol> </td> 
<td> <font color = "darkred"><def:datafieldcontrol runat="server" id="SubD_exp_per" DatabaseField="SubD_exp_per" IsReadOnly="true"  ShowFieldLabel="false"    FieldTextBoxWidth="40px" RenderReadOnlyAsDiv = "true" ></def:datafieldcontrol> </td> 
<td> <font color = "darkred"><def:datafieldcontrol runat="server" id="SubD_wrn_per" DatabaseField="SubD_wrn_per" IsReadOnly="true"  ShowFieldLabel="false"    FieldTextBoxWidth="40px" RenderReadOnlyAsDiv = "true" ></def:datafieldcontrol> </td> 
<td>-</td>
<td><font color = "darkgreen"> <def:datafieldcontrol runat="server" id="SubD_per_dom_Bonf" DatabaseField="SubD_per_dom_Bonf" IsReadOnly="true"  ShowFieldLabel="false"    FieldTextBoxWidth="40px" RenderReadOnlyAsDiv = "true" ></def:datafieldcontrol> </td> 
<td><font color = "darkgreen"> <def:datafieldcontrol runat="server" id="SubD_per_cmm_Bonf" DatabaseField="SubD_per_cmm_Bonf" IsReadOnly="true"  ShowFieldLabel="false"    FieldTextBoxWidth="40px" RenderReadOnlyAsDiv = "true" ></def:datafieldcontrol> </td> 
<td> <font color = "darkgreen"><def:datafieldcontrol runat="server" id="SubD_per_ipr_Bonf" DatabaseField="SubD_per_ipr_Bonf" IsReadOnly="true"  ShowFieldLabel="false"    FieldTextBoxWidth="40px" RenderReadOnlyAsDiv = "true" ></def:datafieldcontrol> </td> 
<td> <font color = "darkgreen"><def:datafieldcontrol runat="server" id="SubD_per_pl_Bonf" DatabaseField="SubD_per_pl_Bonf" IsReadOnly="true"  ShowFieldLabel="false"    FieldTextBoxWidth="40px" RenderReadOnlyAsDiv = "true" ></def:datafieldcontrol> </td> 
<td> <font color = "darkgreen"><def:datafieldcontrol runat="server" id="SubD_per_cs_Bonf" DatabaseField="SubD_per_cs_Bonf" IsReadOnly="true"  ShowFieldLabel="false"    FieldTextBoxWidth="40px" RenderReadOnlyAsDiv = "true" ></def:datafieldcontrol> </td> 
<td> <font color = "darkgreen"><def:datafieldcontrol runat="server" id="SubD_per_gms_Bonf" DatabaseField="SubD_per_gms_Bonf" IsReadOnly="true"  ShowFieldLabel="false"    FieldTextBoxWidth="40px" RenderReadOnlyAsDiv = "true" ></def:datafieldcontrol> </td> 
<td> <font color = "darkgreen"><def:datafieldcontrol runat="server" id="SubD_per_fms_Bonf" DatabaseField="SubD_per_fms_Bonf" IsReadOnly="true"  ShowFieldLabel="false"    FieldTextBoxWidth="40px" RenderReadOnlyAsDiv = "true" ></def:datafieldcontrol> </td> 
</tr>
<tr>
<td><font color = "darkred">DOM</td>
<td> <font color = "darkred"><def:datafieldcontrol runat="server" id="SubD_rec_dom" DatabaseField="SubD_rec_dom" IsReadOnly="true"  ShowFieldLabel="false"    FieldTextBoxWidth="40px" RenderReadOnlyAsDiv = "true" ></def:datafieldcontrol> </td> 
<td> <font color = "darkred"><def:datafieldcontrol runat="server" id="SubD_exp_dom" DatabaseField="SubD_exp_dom" IsReadOnly="true"  ShowFieldLabel="false"    FieldTextBoxWidth="40px" RenderReadOnlyAsDiv = "true" ></def:datafieldcontrol> </td> 
<td> <font color = "darkred"><def:datafieldcontrol runat="server" id="SubD_wrn_dom" DatabaseField="SubD_wrn_dom" IsReadOnly="true"  ShowFieldLabel="false"    FieldTextBoxWidth="40px" RenderReadOnlyAsDiv = "true" ></def:datafieldcontrol> </td> 
<td> <font color = "darkred"><def:datafieldcontrol runat="server" id="SubD_per_dom" DatabaseField="SubD_per_dom" IsReadOnly="true"  ShowFieldLabel="false"    FieldTextBoxWidth="40px" RenderReadOnlyAsDiv = "true" ></def:datafieldcontrol> </td> 
<td>-</td>
<td> <font color = "darkgreen"><def:datafieldcontrol runat="server" id="SubD_dom_cmm_Bonf" DatabaseField="SubD_dom_cmm_Bonf" IsReadOnly="true"  ShowFieldLabel="false"    FieldTextBoxWidth="40px" RenderReadOnlyAsDiv = "true" ></def:datafieldcontrol> </td> 
<td> <font color = "darkgreen"><def:datafieldcontrol runat="server" id="SubD_dom_ipr_Bonf" DatabaseField="SubD_dom_ipr_Bonf" IsReadOnly="true"  ShowFieldLabel="false"    FieldTextBoxWidth="40px" RenderReadOnlyAsDiv = "true" ></def:datafieldcontrol> </td> 
<td> <font color = "darkgreen"><def:datafieldcontrol runat="server" id="SubD_dom_pl_Bonf" DatabaseField="SubD_dom_pl_Bonf" IsReadOnly="true"  ShowFieldLabel="false"    FieldTextBoxWidth="40px" RenderReadOnlyAsDiv = "true" ></def:datafieldcontrol> </td> 
<td> <font color = "darkgreen"><def:datafieldcontrol runat="server" id="SubD_dom_cs_Bonf" DatabaseField="SubD_dom_cs_Bonf" IsReadOnly="true"  ShowFieldLabel="false"    FieldTextBoxWidth="40px" RenderReadOnlyAsDiv = "true" ></def:datafieldcontrol> </td> 
<td> <font color = "darkgreen"><def:datafieldcontrol runat="server" id="SubD_dom_gms_Bonf" DatabaseField="SubD_dom_gms_Bonf" IsReadOnly="true"  ShowFieldLabel="false"    FieldTextBoxWidth="40px" RenderReadOnlyAsDiv = "true" ></def:datafieldcontrol> </td> 
<td> <font color = "darkgreen"><def:datafieldcontrol runat="server" id="SubD_dom_fms_Bonf" DatabaseField="SubD_dom_fms_Bonf" IsReadOnly="true"  ShowFieldLabel="false"    FieldTextBoxWidth="40px" RenderReadOnlyAsDiv = "true" ></def:datafieldcontrol> </td> 
</tr>
<tr>
<td><font color = "darkred">CMM</td>
<td> <font color = "darkred"><def:datafieldcontrol runat="server" id="SubD_rec_cmm" DatabaseField="SubD_rec_cmm" IsReadOnly="true"  ShowFieldLabel="false"    FieldTextBoxWidth="40px" RenderReadOnlyAsDiv = "true" ></def:datafieldcontrol> </td> 
<td> <font color = "darkred"><def:datafieldcontrol runat="server" id="SubD_exp_cmm" DatabaseField="SubD_exp_cmm" IsReadOnly="true"  ShowFieldLabel="false"    FieldTextBoxWidth="40px" RenderReadOnlyAsDiv = "true" ></def:datafieldcontrol> </td> 
<td> <font color = "darkred"><def:datafieldcontrol runat="server" id="SubD_wrn_cmm" DatabaseField="SubD_wrn_cmm" IsReadOnly="true"  ShowFieldLabel="false"    FieldTextBoxWidth="40px" RenderReadOnlyAsDiv = "true" ></def:datafieldcontrol> </td> 
<td> <font color = "darkred"><def:datafieldcontrol runat="server" id="SubD_per_cmm" DatabaseField="SubD_per_cmm" IsReadOnly="true"  ShowFieldLabel="false"    FieldTextBoxWidth="40px" RenderReadOnlyAsDiv = "true" ></def:datafieldcontrol> </td> 
<td> <font color = "darkred"><def:datafieldcontrol runat="server" id="SubD_dom_cmm" DatabaseField="SubD_dom_cmm" IsReadOnly="true"  ShowFieldLabel="false"    FieldTextBoxWidth="40px" RenderReadOnlyAsDiv = "true" ></def:datafieldcontrol> </td> 
<td>-</td>
<td> <font color = "darkgreen"><def:datafieldcontrol runat="server" id="SubD_cmm_ipr_Bonf" DatabaseField="SubD_cmm_ipr_Bonf" IsReadOnly="true"  ShowFieldLabel="false"    FieldTextBoxWidth="40px" RenderReadOnlyAsDiv = "true" ></def:datafieldcontrol> </td> 
<td> <font color = "darkgreen"><def:datafieldcontrol runat="server" id="SubD_cmm_pl_Bonf" DatabaseField="SubD_cmm_pl_Bonf" IsReadOnly="true"  ShowFieldLabel="false"    FieldTextBoxWidth="40px" RenderReadOnlyAsDiv = "true" ></def:datafieldcontrol> </td> 
<td> <font color = "darkgreen"><def:datafieldcontrol runat="server" id="SubD_cmm_cs_Bonf" DatabaseField="SubD_cmm_cs_Bonf" IsReadOnly="true"  ShowFieldLabel="false"    FieldTextBoxWidth="40px" RenderReadOnlyAsDiv = "true" ></def:datafieldcontrol> </td> 
<td> <font color = "darkgreen"><def:datafieldcontrol runat="server" id="SubD_cmm_gms_Bonf" DatabaseField="SubD_cmm_gms_Bonf" IsReadOnly="true"  ShowFieldLabel="false"    FieldTextBoxWidth="40px" RenderReadOnlyAsDiv = "true" ></def:datafieldcontrol> </td> 
<td> <font color = "darkgreen"><def:datafieldcontrol runat="server" id="SubD_cmm_fms_Bonf" DatabaseField="SubD_cmm_fms_Bonf" IsReadOnly="true"  ShowFieldLabel="false"    FieldTextBoxWidth="40px" RenderReadOnlyAsDiv = "true" ></def:datafieldcontrol> </td> 
</tr>
<tr>
<td><font color = "darkred">IPR</td>
<td> <font color = "darkred"><def:datafieldcontrol runat="server" id="SubD_rec_ipr" DatabaseField="SubD_rec_ipr" IsReadOnly="true"  ShowFieldLabel="false"    FieldTextBoxWidth="40px" RenderReadOnlyAsDiv = "true" ></def:datafieldcontrol> </td> 
<td> <font color = "darkred"><def:datafieldcontrol runat="server" id="SubD_exp_ipr" DatabaseField="SubD_exp_ipr" IsReadOnly="true"  ShowFieldLabel="false"    FieldTextBoxWidth="40px" RenderReadOnlyAsDiv = "true" ></def:datafieldcontrol> </td> 
<td> <font color = "darkred"><def:datafieldcontrol runat="server" id="SubD_wrn_ipr" DatabaseField="SubD_wrn_ipr" IsReadOnly="true"  ShowFieldLabel="false"    FieldTextBoxWidth="40px" RenderReadOnlyAsDiv = "true" ></def:datafieldcontrol> </td> 
<td> <font color = "darkred"><def:datafieldcontrol runat="server" id="SubD_per_ipr" DatabaseField="SubD_per_ipr" IsReadOnly="true"  ShowFieldLabel="false"    FieldTextBoxWidth="40px" RenderReadOnlyAsDiv = "true" ></def:datafieldcontrol> </td> 
<td> <font color = "darkred"><def:datafieldcontrol runat="server" id="SubD_dom_ipr" DatabaseField="SubD_dom_ipr" IsReadOnly="true"  ShowFieldLabel="false"    FieldTextBoxWidth="40px" RenderReadOnlyAsDiv = "true" ></def:datafieldcontrol> </td> 
<td> <font color = "darkred"><def:datafieldcontrol runat="server" id="SubD_cmm_ipr" DatabaseField="SubD_cmm_ipr" IsReadOnly="true"  ShowFieldLabel="false"    FieldTextBoxWidth="40px" RenderReadOnlyAsDiv = "true" ></def:datafieldcontrol> </td> 
<td>-</td>
<td> <font color = "darkgreen"><def:datafieldcontrol runat="server" id="SubD_ipr_pl_Bonf" DatabaseField="SubD_ipr_pl_Bonf" IsReadOnly="true"  ShowFieldLabel="false"    FieldTextBoxWidth="40px" RenderReadOnlyAsDiv = "true" ></def:datafieldcontrol> </td> 
<td> <font color = "darkgreen"><def:datafieldcontrol runat="server" id="SubD_ipr_cs_Bonf" DatabaseField="SubD_ipr_cs_Bonf" IsReadOnly="true"  ShowFieldLabel="false"    FieldTextBoxWidth="40px" RenderReadOnlyAsDiv = "true" ></def:datafieldcontrol> </td> 
<td> <font color = "darkgreen"><def:datafieldcontrol runat="server" id="SubD_ipr_gms_Bonf" DatabaseField="SubD_ipr_gms_Bonf" IsReadOnly="true"  ShowFieldLabel="false"    FieldTextBoxWidth="40px" RenderReadOnlyAsDiv = "true" ></def:datafieldcontrol> </td> 
<td> <font color = "darkgreen"><def:datafieldcontrol runat="server" id="SubD_ipr_fms_Bonf" DatabaseField="SubD_ipr_fms_Bonf" IsReadOnly="true"  ShowFieldLabel="false"    FieldTextBoxWidth="40px" RenderReadOnlyAsDiv = "true" ></def:datafieldcontrol> </td> 
</tr>
<tr>
<td><font color = "darkred">PL</td>
<td> <font color = "darkred"><def:datafieldcontrol runat="server" id="SubD_rec_pl" DatabaseField="SubD_rec_pl" IsReadOnly="true"  ShowFieldLabel="false"    FieldTextBoxWidth="40px" RenderReadOnlyAsDiv = "true" ></def:datafieldcontrol> </td> 
<td> <font color = "darkred"><def:datafieldcontrol runat="server" id="SubD_exp_pl" DatabaseField="SubD_exp_pl" IsReadOnly="true"  ShowFieldLabel="false"    FieldTextBoxWidth="40px" RenderReadOnlyAsDiv = "true" ></def:datafieldcontrol> </td> 
<td> <font color = "darkred"><def:datafieldcontrol runat="server" id="SubD_wrn_pl" DatabaseField="SubD_wrn_pl" IsReadOnly="true"  ShowFieldLabel="false"    FieldTextBoxWidth="40px" RenderReadOnlyAsDiv = "true" ></def:datafieldcontrol> </td> 
<td> <font color = "darkred"><def:datafieldcontrol runat="server" id="SubD_per_pl" DatabaseField="SubD_per_pl" IsReadOnly="true"  ShowFieldLabel="false"    FieldTextBoxWidth="40px" RenderReadOnlyAsDiv = "true" ></def:datafieldcontrol> </td> 
<td> <font color = "darkred"><def:datafieldcontrol runat="server" id="SubD_dom_pl" DatabaseField="SubD_dom_pl" IsReadOnly="true"  ShowFieldLabel="false"    FieldTextBoxWidth="40px" RenderReadOnlyAsDiv = "true" ></def:datafieldcontrol> </td> 
<td> <font color = "darkred"><def:datafieldcontrol runat="server" id="SubD_cmm_pl" DatabaseField="SubD_cmm_pl" IsReadOnly="true"  ShowFieldLabel="false"    FieldTextBoxWidth="40px" RenderReadOnlyAsDiv = "true" ></def:datafieldcontrol> </td> 
<td> <font color = "darkred"><def:datafieldcontrol runat="server" id="SubD_ipr_pl" DatabaseField="SubD_ipr_pl" IsReadOnly="true"  ShowFieldLabel="false"    FieldTextBoxWidth="40px" RenderReadOnlyAsDiv = "true" ></def:datafieldcontrol> </td> 
<td>-</td>
<td> <font color = "darkgreen"><def:datafieldcontrol runat="server" id="SubD_pl_cs_Bonf" DatabaseField="SubD_pl_cs_Bonf" IsReadOnly="true"  ShowFieldLabel="false"    FieldTextBoxWidth="40px" RenderReadOnlyAsDiv = "true" ></def:datafieldcontrol> </td> 
<td> <font color = "darkgreen"><def:datafieldcontrol runat="server" id="SubD_pl_gms_Bonf" DatabaseField="SubD_pl_gms_Bonf" IsReadOnly="true"  ShowFieldLabel="false"    FieldTextBoxWidth="40px" RenderReadOnlyAsDiv = "true" ></def:datafieldcontrol> </td> 
<td> <font color = "darkgreen"><def:datafieldcontrol runat="server" id="SubD_pl_fms_Bonf" DatabaseField="SubD_pl_fms_Bonf" IsReadOnly="true"  ShowFieldLabel="false"    FieldTextBoxWidth="40px" RenderReadOnlyAsDiv = "true" ></def:datafieldcontrol> </td> 
</tr>
<tr>
<td><font color = "darkred">CS</td>
<td> <font color = "darkred"><def:datafieldcontrol runat="server" id="SubD_rec_cs" DatabaseField="SubD_rec_cs" IsReadOnly="true"  ShowFieldLabel="false"    FieldTextBoxWidth="40px" RenderReadOnlyAsDiv = "true" ></def:datafieldcontrol> </td> 
<td> <font color = "darkred"><def:datafieldcontrol runat="server" id="SubD_exp_cs" DatabaseField="SubD_exp_cs" IsReadOnly="true"  ShowFieldLabel="false"    FieldTextBoxWidth="40px" RenderReadOnlyAsDiv = "true" ></def:datafieldcontrol> </td> 
<td> <font color = "darkred"><def:datafieldcontrol runat="server" id="SubD_wrn_cs" DatabaseField="SubD_wrn_cs" IsReadOnly="true"  ShowFieldLabel="false"    FieldTextBoxWidth="40px" RenderReadOnlyAsDiv = "true" ></def:datafieldcontrol> </td> 
<td> <font color = "darkred"><def:datafieldcontrol runat="server" id="SubD_per_cs" DatabaseField="SubD_per_cs" IsReadOnly="true"  ShowFieldLabel="false"    FieldTextBoxWidth="40px" RenderReadOnlyAsDiv = "true" ></def:datafieldcontrol> </td> 
<td> <font color = "darkred"><def:datafieldcontrol runat="server" id="SubD_dom_cs" DatabaseField="SubD_dom_cs" IsReadOnly="true"  ShowFieldLabel="false"    FieldTextBoxWidth="40px" RenderReadOnlyAsDiv = "true" ></def:datafieldcontrol> </td> 
<td> <font color = "darkred"><def:datafieldcontrol runat="server" id="SubD_cmm_cs" DatabaseField="SubD_cmm_cs" IsReadOnly="true"  ShowFieldLabel="false"    FieldTextBoxWidth="40px" RenderReadOnlyAsDiv = "true" ></def:datafieldcontrol> </td> 
<td> <font color = "darkred"><def:datafieldcontrol runat="server" id="SubD_ipr_cs" DatabaseField="SubD_ipr_cs" IsReadOnly="true"  ShowFieldLabel="false"    FieldTextBoxWidth="40px" RenderReadOnlyAsDiv = "true" ></def:datafieldcontrol> </td> 
<td> <font color = "darkred"><def:datafieldcontrol runat="server" id="SubD_pl_cs" DatabaseField="SubD_pl_cs" IsReadOnly="true"  ShowFieldLabel="false"    FieldTextBoxWidth="40px" RenderReadOnlyAsDiv = "true" ></def:datafieldcontrol> </td> 
<td>-</td>
<td> <font color = "darkgreen"><def:datafieldcontrol runat="server" id="SubD_cs_gms_Bonf" DatabaseField="SubD_cs_gms_Bonf" IsReadOnly="true"  ShowFieldLabel="false"    FieldTextBoxWidth="40px" RenderReadOnlyAsDiv = "true" ></def:datafieldcontrol> </td> 
<td> <font color = "darkgreen"><def:datafieldcontrol runat="server" id="SubD_cs_fms_Bonf" DatabaseField="SubD_cs_fms_Bonf" IsReadOnly="true"  ShowFieldLabel="false"    FieldTextBoxWidth="40px" RenderReadOnlyAsDiv = "true" ></def:datafieldcontrol> </td> 
</tr>
<tr>
<td><font color = "darkred">GMS</td>
<td> <font color = "darkred"><def:datafieldcontrol runat="server" id="SubD_rec_gms" DatabaseField="SubD_rec_gms" IsReadOnly="true"  ShowFieldLabel="false"    FieldTextBoxWidth="40px" RenderReadOnlyAsDiv = "true" ></def:datafieldcontrol> </td> 
<td> <font color = "darkred"><def:datafieldcontrol runat="server" id="SubD_exp_gms" DatabaseField="SubD_exp_gms" IsReadOnly="true"  ShowFieldLabel="false"    FieldTextBoxWidth="40px" RenderReadOnlyAsDiv = "true" ></def:datafieldcontrol> </td> 
<td> <font color = "darkred"><def:datafieldcontrol runat="server" id="SubD_wrn_gms" DatabaseField="SubD_wrn_gms" IsReadOnly="true"  ShowFieldLabel="false"    FieldTextBoxWidth="40px" RenderReadOnlyAsDiv = "true" ></def:datafieldcontrol> </td> 
<td> <font color = "darkred"><def:datafieldcontrol runat="server" id="SubD_per_gms" DatabaseField="SubD_per_gms" IsReadOnly="true"  ShowFieldLabel="false"    FieldTextBoxWidth="40px" RenderReadOnlyAsDiv = "true" ></def:datafieldcontrol> </td> 
<td> <font color = "darkred"><def:datafieldcontrol runat="server" id="SubD_dom_gms" DatabaseField="SubD_dom_gms" IsReadOnly="true"  ShowFieldLabel="false"    FieldTextBoxWidth="40px" RenderReadOnlyAsDiv = "true" ></def:datafieldcontrol> </td> 
<td> <font color = "darkred"><def:datafieldcontrol runat="server" id="SubD_cmm_gms" DatabaseField="SubD_cmm_gms" IsReadOnly="true"  ShowFieldLabel="false"    FieldTextBoxWidth="40px" RenderReadOnlyAsDiv = "true" ></def:datafieldcontrol> </td> 
<td> <font color = "darkred"><def:datafieldcontrol runat="server" id="SubD_ipr_gms" DatabaseField="SubD_ipr_gms" IsReadOnly="true"  ShowFieldLabel="false"    FieldTextBoxWidth="40px" RenderReadOnlyAsDiv = "true" ></def:datafieldcontrol> </td> 
<td> <font color = "darkred"><def:datafieldcontrol runat="server" id="SubD_pl_gms" DatabaseField="SubD_pl_gms" IsReadOnly="true"  ShowFieldLabel="false"    FieldTextBoxWidth="40px" RenderReadOnlyAsDiv = "true" ></def:datafieldcontrol> </td> 
<td> <font color = "darkred"><def:datafieldcontrol runat="server" id="SubD_cs_gms" DatabaseField="SubD_cs_gms" IsReadOnly="true"  ShowFieldLabel="false"    FieldTextBoxWidth="40px" RenderReadOnlyAsDiv = "true" ></def:datafieldcontrol> </td> 
<td>-</td>
<td> <font color = "darkgreen"><def:datafieldcontrol runat="server" id="SubD_gms_fms_Bonf" DatabaseField="SubD_gms_fms_Bonf" IsReadOnly="true"  ShowFieldLabel="false"    FieldTextBoxWidth="40px" RenderReadOnlyAsDiv = "true" ></def:datafieldcontrol> </td> 
</tr>
<tr>
<td><font color = "darkred">FMS</td>
<td> <font color = "darkred"><def:datafieldcontrol runat="server" id="SubD_rec_fms" DatabaseField="SubD_rec_fms" IsReadOnly="true"  ShowFieldLabel="false"    FieldTextBoxWidth="40px" RenderReadOnlyAsDiv = "true" ></def:datafieldcontrol> </td> 
<td> <font color = "darkred"><def:datafieldcontrol runat="server" id="SubD_exp_fms" DatabaseField="SubD_exp_fms" IsReadOnly="true"  ShowFieldLabel="false"    FieldTextBoxWidth="40px" RenderReadOnlyAsDiv = "true" ></def:datafieldcontrol> </td> 
<td> <font color = "darkred"><def:datafieldcontrol runat="server" id="SubD_wrn_fms" DatabaseField="SubD_wrn_fms" IsReadOnly="true"  ShowFieldLabel="false"    FieldTextBoxWidth="40px" RenderReadOnlyAsDiv = "true" ></def:datafieldcontrol> </td> 
<td> <font color = "darkred"><def:datafieldcontrol runat="server" id="SubD_per_fms" DatabaseField="SubD_per_fms" IsReadOnly="true"  ShowFieldLabel="false"    FieldTextBoxWidth="40px" RenderReadOnlyAsDiv = "true" ></def:datafieldcontrol> </td> 
<td> <font color = "darkred"><def:datafieldcontrol runat="server" id="SubD_dom_fms" DatabaseField="SubD_dom_fms" IsReadOnly="true"  ShowFieldLabel="false"    FieldTextBoxWidth="40px" RenderReadOnlyAsDiv = "true" ></def:datafieldcontrol> </td> 
<td> <font color = "darkred"><def:datafieldcontrol runat="server" id="SubD_cmm_fms" DatabaseField="SubD_cmm_fms" IsReadOnly="true"  ShowFieldLabel="false"    FieldTextBoxWidth="40px" RenderReadOnlyAsDiv = "true" ></def:datafieldcontrol> </td> 
<td> <font color = "darkred"><def:datafieldcontrol runat="server" id="SubD_ipr_fms" DatabaseField="SubD_ipr_fms" IsReadOnly="true"  ShowFieldLabel="false"    FieldTextBoxWidth="40px" RenderReadOnlyAsDiv = "true" ></def:datafieldcontrol> </td> 
<td> <font color = "darkred"><def:datafieldcontrol runat="server" id="SubD_pl_fms" DatabaseField="SubD_pl_fms" IsReadOnly="true"  ShowFieldLabel="false"    FieldTextBoxWidth="40px" RenderReadOnlyAsDiv = "true" ></def:datafieldcontrol> </td> 
<td> <font color = "darkred"><def:datafieldcontrol runat="server" id="SubD_cs_fms" DatabaseField="SubD_cs_fms" IsReadOnly="true"  ShowFieldLabel="false"    FieldTextBoxWidth="40px" RenderReadOnlyAsDiv = "true" ></def:datafieldcontrol> </td> 
<td> <font color = "darkred"><def:datafieldcontrol runat="server" id="SubD_gms_fms" DatabaseField="SubD_gms_fms" IsReadOnly="true"  ShowFieldLabel="false"    FieldTextBoxWidth="40px" RenderReadOnlyAsDiv = "true" ></def:datafieldcontrol> </td> 
<td>-</td>
</tr>




</table>
</div>




<div class="main">
<table>
<tr>
<td>Basal notes:</td>
<td width = "400px" > <def:datafieldcontrol runat="server" id="basal_notes" DatabaseField="basal_notes" IsReadOnly="true"  ShowFieldLabel="false"    FieldTextBoxWidth="250px" RenderReadOnlyAsDiv = "true" ></def:datafieldcontrol> </td> 
</tr>
<tr>
<td>Ceiling notes:</td>
<td width = "400px" > <def:datafieldcontrol runat="server" id="ceil_notes" DatabaseField="ceil_notes" IsReadOnly="true"  ShowFieldLabel="false"    FieldTextBoxWidth="250px" RenderReadOnlyAsDiv = "true" ></def:datafieldcontrol> </td> 
</tr>
<td>Scoring message:</td>
<td width = "400px" ><def:datafieldcontrol runat="server" id="v2scrmsg" DatabaseField="v2scrmsg" IsReadOnly="true"  ShowFieldLabel="false"    FieldTextBoxWidth="250px" RenderReadOnlyAsDiv = "true" ></def:datafieldcontrol> </td> 
</tr>
</table>
</div>

<div class="main">
<td> <def:datafieldcontrol runat="server" id="v2vld"  DatabaseField="v2vld"  IsEntryField="true" IsEntryValueRequired="true" IsDoubleEntryField="true"  ShowFieldLabel="true"    FieldLabelWidth="150px" FieldTextBoxWidth="40px" FieldTextBoxMaxLength="50" ></def:datafieldcontrol> </td> <br />

    <asp:Label ID="Label1" runat="server" Text="Enter 'raw_scores_only' (without the quotes) in the comments field to skip item entry and score using just hand-entered raw scores." ForeColor="GrayText"></asp:Label><br />
<td> <def:datafieldcontrol runat="server" id="v2comments"  DatabaseField="v2comments"  IsEntryField="true" IsEntryValueRequired="false" IsDoubleEntryField="false"  ShowFieldLabel="true"    FieldTextBoxWidth="400px" FieldTextBoxHeight="40px" FieldTextBoxTextMode="multiline" ></def:datafieldcontrol> </td> 
</div>






<h3><a name="raw">Raw Scores</a></h3>
<h5><font color="red">Enter raw scores here. </font> <font color="darkblue"><i>When no true basal was established enter "1" where indicated below to use the first valid item instead.</i></font></h5>
<font color="darkred">Enter -999 when subdomain not administered (or is invalid due to 3 or more DK), but 0 when child is too young for subdomain (e.g., Written). </font>
<div class="main">
<table border="1px">
<tr>
<td><u>Subdomain <br/><i><font color="blue">(click to jump to section)</font></i></u></td>
<td><u>Raw Score</u></td>
<td><u>Use 1st valid <br/>item for basal</u></td>
<td><u>Basal</u></td>
<td><u>Ceiling</u></td>
<td><u>Items ("b"=below basal, "p"=0 but below basal, "q"=1 but below basal)<br/>("c"=above ceiling, "x"=1 but above ceil, "y"=2 but above ceil)<br/>("r"=7(DNK), "s"=8(NoOpp), "t"=9(Missing/blank)</u></td>
<td><u>Compare raw scores<br/>(Hand entered vs. calculated)</u></td>

</tr>

<tr>
<td><a href="#rec"><font color="blue">Receptive</font></a></td>
<td> <def:datafieldcontrol runat="server" id="import_REC_raw"  DatabaseField="import_REC_raw"  IsEntryField="true" IsEntryValueRequired="true" IsDoubleEntryField="true"  ShowFieldLabel="false"    FieldLabelWidth="50px" FieldTextBoxWidth="40px" FieldTextBoxMaxLength="50"  ></def:datafieldcontrol> </td> 
<td> <def:datafieldcontrol runat="server" id="manual_basal_REC" DatabaseField="manual_basal_REC" IsEntryField="true"  IsDoubleEntryField="true"   ShowFieldLabel="false"    FieldLabelWidth="50px" FieldTextBoxWidth="40px" FieldTextBoxMaxLength="50"  ></def:datafieldcontrol> </td> 
<td> <def:datafieldcontrol runat="server" id="basal_REC" DatabaseField="basal_REC" IsReadOnly="true"  ShowFieldLabel="false"    FieldLabelWidth="50px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="50" RenderReadOnlyAsDiv = "true" ></def:datafieldcontrol> </td> 
<td> <def:datafieldcontrol runat="server" id="ceil_REC" DatabaseField="ceil_REC" IsReadOnly="true"  ShowFieldLabel="false"    FieldLabelWidth="50px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="50" RenderReadOnlyAsDiv = "true" ></def:datafieldcontrol> </td> 
<td> <def:datafieldcontrol runat="server" id="str_REC" DatabaseField="str_REC" IsReadOnly="true"  ShowFieldLabel="false"    FieldLabelWidth="50px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="50" RenderReadOnlyAsDiv = "true" ></def:datafieldcontrol> </td> 
<td> <def:datafieldcontrol runat="server" id="diff_REC" DatabaseField="diff_REC" IsReadOnly="true"  ShowFieldLabel="false"    FieldLabelWidth="50px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="50" RenderReadOnlyAsDiv = "true" ></def:datafieldcontrol> </td> 
</tr>

<tr>
<td><a href="#exp"><font color="blue">Expressive</font></a></td>
<td> <def:datafieldcontrol runat="server" id="import_EXP_raw"  DatabaseField="import_EXP_raw"  IsEntryField="true" IsEntryValueRequired="true"  IsDoubleEntryField="true"  ShowFieldLabel="false"    FieldLabelWidth="50px" FieldTextBoxWidth="40px" FieldTextBoxMaxLength="50" ></def:datafieldcontrol> </td> 
<td> <def:datafieldcontrol runat="server" id="manual_basal_EXP" DatabaseField="manual_basal_EXP" IsEntryField="true"  IsDoubleEntryField="true"  ShowFieldLabel="false"    FieldLabelWidth="50px" FieldTextBoxWidth="40px" FieldTextBoxMaxLength="50" RenderReadOnlyAsDiv = "true" ></def:datafieldcontrol> </td> 
<td> <def:datafieldcontrol runat="server" id="basal_EXP" DatabaseField="basal_EXP" IsReadOnly="true"  ShowFieldLabel="false"    FieldLabelWidth="50px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="50" RenderReadOnlyAsDiv = "true" ></def:datafieldcontrol> </td> 
<td> <def:datafieldcontrol runat="server" id="ceil_EXP" DatabaseField="ceil_EXP" IsReadOnly="true"  ShowFieldLabel="false"    FieldLabelWidth="50px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="50" RenderReadOnlyAsDiv = "true" ></def:datafieldcontrol> </td> 
<td> <def:datafieldcontrol runat="server" id="str_EXP" DatabaseField="str_EXP" IsReadOnly="true"  ShowFieldLabel="false"    FieldLabelWidth="50px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="50" RenderReadOnlyAsDiv = "true" ></def:datafieldcontrol> </td> 
<td> <def:datafieldcontrol runat="server" id="diff_EXP" DatabaseField="diff_EXP" IsReadOnly="true"  ShowFieldLabel="false"    FieldLabelWidth="50px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="50" RenderReadOnlyAsDiv = "true" ></def:datafieldcontrol> </td> 
</tr>

<tr>
<td><a href="#wrn"><font color="blue">Written</font></a></td>
<td> <def:datafieldcontrol runat="server" id="import_WRN_raw"  DatabaseField="import_WRN_raw"  IsEntryField="true" IsEntryValueRequired="true"  IsDoubleEntryField="true"  ShowFieldLabel="false"    FieldLabelWidth="50px" FieldTextBoxWidth="40px" FieldTextBoxMaxLength="50" ></def:datafieldcontrol> </td> 
<td> <def:datafieldcontrol runat="server" id="manual_basal_WRN" DatabaseField="manual_basal_WRN" IsEntryField="true"  IsDoubleEntryField="true"  ShowFieldLabel="false"    FieldLabelWidth="50px" FieldTextBoxWidth="40px" FieldTextBoxMaxLength="50" RenderReadOnlyAsDiv = "true" ></def:datafieldcontrol> </td> 
<td> <def:datafieldcontrol runat="server" id="basal_WRN" DatabaseField="basal_WRN" IsReadOnly="true"  ShowFieldLabel="false"    FieldLabelWidth="50px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="50" RenderReadOnlyAsDiv = "true" ></def:datafieldcontrol> </td> 
<td> <def:datafieldcontrol runat="server" id="ceil_WRN" DatabaseField="ceil_WRN" IsReadOnly="true"  ShowFieldLabel="false"    FieldLabelWidth="50px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="50" RenderReadOnlyAsDiv = "true" ></def:datafieldcontrol> </td> 
<td> <def:datafieldcontrol runat="server" id="str_WRN" DatabaseField="str_WRN" IsReadOnly="true"  ShowFieldLabel="false"    FieldLabelWidth="50px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="50" RenderReadOnlyAsDiv = "true" ></def:datafieldcontrol> </td> 
<td> <def:datafieldcontrol runat="server" id="diff_WRN" DatabaseField="diff_WRN" IsReadOnly="true"  ShowFieldLabel="false"    FieldLabelWidth="50px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="50" RenderReadOnlyAsDiv = "true" ></def:datafieldcontrol> </td> 
</tr>

<tr>
<td><a href="#per"><font color="blue">Personal</font></a></td>
<td> <def:datafieldcontrol runat="server" id="import_PER_raw"  DatabaseField="import_PER_raw"  IsEntryField="true" IsEntryValueRequired="true"  IsDoubleEntryField="true"  ShowFieldLabel="false"    FieldLabelWidth="50px" FieldTextBoxWidth="40px" FieldTextBoxMaxLength="50" ></def:datafieldcontrol> </td> 
<td> <def:datafieldcontrol runat="server" id="manual_basal_PER" DatabaseField="manual_basal_PER" IsEntryField="true"  IsDoubleEntryField="true"  ShowFieldLabel="false"    FieldLabelWidth="50px" FieldTextBoxWidth="40px" FieldTextBoxMaxLength="50" RenderReadOnlyAsDiv = "true" ></def:datafieldcontrol> </td> 
<td> <def:datafieldcontrol runat="server" id="basal_PER" DatabaseField="basal_PER" IsReadOnly="true"  ShowFieldLabel="false"    FieldLabelWidth="50px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="50" RenderReadOnlyAsDiv = "true" ></def:datafieldcontrol> </td> 
<td> <def:datafieldcontrol runat="server" id="ceil_PER" DatabaseField="ceil_PER" IsReadOnly="true"  ShowFieldLabel="false"    FieldLabelWidth="50px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="50" RenderReadOnlyAsDiv = "true" ></def:datafieldcontrol> </td> 
<td> <def:datafieldcontrol runat="server" id="str_PER" DatabaseField="str_PER" IsReadOnly="true"  ShowFieldLabel="false"    FieldLabelWidth="50px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="50" RenderReadOnlyAsDiv = "true" ></def:datafieldcontrol> </td> 
<td> <def:datafieldcontrol runat="server" id="diff_PER" DatabaseField="diff_PER" IsReadOnly="true"  ShowFieldLabel="false"    FieldLabelWidth="50px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="50" RenderReadOnlyAsDiv = "true" ></def:datafieldcontrol> </td> 
</tr>

<tr>
<td><a href="#dom"><font color="blue">Domestic</font></a></td>
<td> <def:datafieldcontrol runat="server" id="import_DOM_raw"  DatabaseField="import_DOM_raw"  IsEntryField="true" IsEntryValueRequired="true"  IsDoubleEntryField="true"  ShowFieldLabel="false"    FieldLabelWidth="50px" FieldTextBoxWidth="40px" FieldTextBoxMaxLength="50"  ></def:datafieldcontrol> </td> 
<td> <def:datafieldcontrol runat="server" id="manual_basal_DOM" DatabaseField="manual_basal_DOM" IsEntryField="true"  IsDoubleEntryField="true"  ShowFieldLabel="false"    FieldLabelWidth="50px" FieldTextBoxWidth="40px" FieldTextBoxMaxLength="50"  ></def:datafieldcontrol> </td> 
<td> <def:datafieldcontrol runat="server" id="basal_DOM" DatabaseField="basal_DOM" IsReadOnly="true"  ShowFieldLabel="false"    FieldLabelWidth="50px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="50" RenderReadOnlyAsDiv = "true" ></def:datafieldcontrol> </td> 
<td> <def:datafieldcontrol runat="server" id="ceil_DOM" DatabaseField="ceil_DOM" IsReadOnly="true"  ShowFieldLabel="false"    FieldLabelWidth="50px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="50" RenderReadOnlyAsDiv = "true" ></def:datafieldcontrol> </td> 
<td> <def:datafieldcontrol runat="server" id="str_DOM" DatabaseField="str_DOM" IsReadOnly="true"  ShowFieldLabel="false"    FieldLabelWidth="50px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="50" RenderReadOnlyAsDiv = "true" ></def:datafieldcontrol> </td> 
<td> <def:datafieldcontrol runat="server" id="diff_DOM" DatabaseField="diff_DOM" IsReadOnly="true"  ShowFieldLabel="false"    FieldLabelWidth="50px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="50" RenderReadOnlyAsDiv = "true" ></def:datafieldcontrol> </td> 
</tr>

<tr>
<td><a href="#cmm"><font color="blue">Community</font></a></td>
<td> <def:datafieldcontrol runat="server" id="import_CMM_raw"  DatabaseField="import_CMM_raw"  IsEntryField="true" IsEntryValueRequired="true"  IsDoubleEntryField="true"  ShowFieldLabel="false"    FieldLabelWidth="50px" FieldTextBoxWidth="40px" FieldTextBoxMaxLength="50" ></def:datafieldcontrol> </td> 
<td> <def:datafieldcontrol runat="server" id="manual_basal_CMM" DatabaseField="manual_basal_CMM" IsEntryField="true"  IsDoubleEntryField="true"  ShowFieldLabel="false"    FieldLabelWidth="50px" FieldTextBoxWidth="40px" FieldTextBoxMaxLength="50"  ></def:datafieldcontrol> </td> 
<td> <def:datafieldcontrol runat="server" id="basal_CMM" DatabaseField="basal_CMM" IsReadOnly="true"  ShowFieldLabel="false"    FieldLabelWidth="50px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="50" RenderReadOnlyAsDiv = "true" ></def:datafieldcontrol> </td> 
<td> <def:datafieldcontrol runat="server" id="ceil_CMM" DatabaseField="ceil_CMM" IsReadOnly="true"  ShowFieldLabel="false"    FieldLabelWidth="50px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="50" RenderReadOnlyAsDiv = "true" ></def:datafieldcontrol> </td> 
<td> <def:datafieldcontrol runat="server" id="str_CMM" DatabaseField="str_CMM" IsReadOnly="true"  ShowFieldLabel="false"    FieldLabelWidth="50px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="50" RenderReadOnlyAsDiv = "true" ></def:datafieldcontrol> </td> 
<td> <def:datafieldcontrol runat="server" id="diff_CMM" DatabaseField="diff_CMM" IsReadOnly="true"  ShowFieldLabel="false"    FieldLabelWidth="50px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="50" RenderReadOnlyAsDiv = "true" ></def:datafieldcontrol> </td> 
</tr>

<tr>
<td><a href="#ipr"><font color="blue">Interpersonal Relat.</font></a></td>
<td> <def:datafieldcontrol runat="server" id="import_IPR_raw"  DatabaseField="import_IPR_raw"  IsEntryField="true" IsEntryValueRequired="true"  IsDoubleEntryField="true"  ShowFieldLabel="false"    FieldLabelWidth="50px" FieldTextBoxWidth="40px" FieldTextBoxMaxLength="50" ></def:datafieldcontrol> </td> 
<td> <def:datafieldcontrol runat="server" id="manual_basal_IPR" DatabaseField="manual_basal_IPR" IsEntryField="true"  IsDoubleEntryField="true"  ShowFieldLabel="false"    FieldLabelWidth="50px" FieldTextBoxWidth="40px" FieldTextBoxMaxLength="50"  ></def:datafieldcontrol> </td> 
<td> <def:datafieldcontrol runat="server" id="basal_IPR" DatabaseField="basal_IPR" IsReadOnly="true"  ShowFieldLabel="false"    FieldLabelWidth="50px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="50" RenderReadOnlyAsDiv = "true" ></def:datafieldcontrol> </td> 
<td> <def:datafieldcontrol runat="server" id="ceil_IPR" DatabaseField="ceil_IPR" IsReadOnly="true"  ShowFieldLabel="false"    FieldLabelWidth="50px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="50" RenderReadOnlyAsDiv = "true" ></def:datafieldcontrol> </td> 
<td> <def:datafieldcontrol runat="server" id="str_IPR" DatabaseField="str_IPR" IsReadOnly="true"  ShowFieldLabel="false"    FieldLabelWidth="50px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="50" RenderReadOnlyAsDiv = "true" ></def:datafieldcontrol> </td> 
<td> <def:datafieldcontrol runat="server" id="diff_IPR" DatabaseField="diff_IPR" IsReadOnly="true"  ShowFieldLabel="false"    FieldLabelWidth="50px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="50" RenderReadOnlyAsDiv = "true" ></def:datafieldcontrol> </td> 
</tr>

<tr>
<td><a href="#pl"><font color="blue">Play/Leisure</font></a></td>
<td> <def:datafieldcontrol runat="server" id="import_PL_raw"  DatabaseField="import_PL_raw"  IsEntryField="true" IsEntryValueRequired="true"  IsDoubleEntryField="true"  ShowFieldLabel="false"    FieldLabelWidth="50px" FieldTextBoxWidth="40px" FieldTextBoxMaxLength="50" ></def:datafieldcontrol> </td> 
<td> <def:datafieldcontrol runat="server" id="manual_basal_PL" DatabaseField="manual_basal_PL" IsEntryField="true"  IsDoubleEntryField="true"  ShowFieldLabel="false"    FieldLabelWidth="50px" FieldTextBoxWidth="40px" FieldTextBoxMaxLength="50"  ></def:datafieldcontrol> </td> 
<td> <def:datafieldcontrol runat="server" id="basal_PL" DatabaseField="basal_PL" IsReadOnly="true"  ShowFieldLabel="false"    FieldLabelWidth="50px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="50" RenderReadOnlyAsDiv = "true" ></def:datafieldcontrol> </td> 
<td> <def:datafieldcontrol runat="server" id="ceil_PL" DatabaseField="ceil_PL" IsReadOnly="true"  ShowFieldLabel="false"    FieldLabelWidth="50px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="50" RenderReadOnlyAsDiv = "true" ></def:datafieldcontrol> </td> 
<td> <def:datafieldcontrol runat="server" id="str_PL" DatabaseField="str_PL" IsReadOnly="true"  ShowFieldLabel="false"    FieldLabelWidth="50px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="50" RenderReadOnlyAsDiv = "true" ></def:datafieldcontrol> </td> 
<td> <def:datafieldcontrol runat="server" id="diff_PL" DatabaseField="diff_PL" IsReadOnly="true"  ShowFieldLabel="false"    FieldLabelWidth="50px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="50" RenderReadOnlyAsDiv = "true" ></def:datafieldcontrol> </td> 
</tr>

<tr>
<td><a href="#cs"><font color="blue">Coping SKills</font></a></td>
<td> <def:datafieldcontrol runat="server" id="import_CS_raw"  DatabaseField="import_CS_raw"  IsEntryField="true" IsEntryValueRequired="true"  IsDoubleEntryField="true"  ShowFieldLabel="false"    FieldLabelWidth="50px" FieldTextBoxWidth="40px" FieldTextBoxMaxLength="50" ></def:datafieldcontrol> </td> 
<td> <def:datafieldcontrol runat="server" id="manual_basal_CS" DatabaseField="manual_basal_CS" IsEntryField="true"  IsDoubleEntryField="true"  ShowFieldLabel="false"    FieldLabelWidth="50px" FieldTextBoxWidth="40px" FieldTextBoxMaxLength="50"  ></def:datafieldcontrol> </td> 
<td> <def:datafieldcontrol runat="server" id="basal_CS" DatabaseField="basal_CS" IsReadOnly="true"  ShowFieldLabel="false"    FieldLabelWidth="50px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="50" RenderReadOnlyAsDiv = "true" ></def:datafieldcontrol> </td> 
<td> <def:datafieldcontrol runat="server" id="ceil_CS" DatabaseField="ceil_CS" IsReadOnly="true"  ShowFieldLabel="false"    FieldLabelWidth="50px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="50" RenderReadOnlyAsDiv = "true" ></def:datafieldcontrol> </td> 
<td> <def:datafieldcontrol runat="server" id="str_CS" DatabaseField="str_CS" IsReadOnly="true"  ShowFieldLabel="false"    FieldLabelWidth="50px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="50" RenderReadOnlyAsDiv = "true" ></def:datafieldcontrol> </td> 
<td> <def:datafieldcontrol runat="server" id="diff_CS" DatabaseField="diff_CS" IsReadOnly="true"  ShowFieldLabel="false"    FieldLabelWidth="50px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="50" RenderReadOnlyAsDiv = "true" ></def:datafieldcontrol> </td> 
</tr>

<tr>
<td><a href="#gms"><font color="blue">Gross Motor</font></a></td>
<td> <def:datafieldcontrol runat="server" id="import_GMS_raw"  DatabaseField="import_GMS_raw"  IsEntryField="true" IsEntryValueRequired="true"  IsDoubleEntryField="true"  ShowFieldLabel="false"    FieldLabelWidth="50px" FieldTextBoxWidth="40px" FieldTextBoxMaxLength="50" ></def:datafieldcontrol> </td> 
<td> <def:datafieldcontrol runat="server" id="manual_basal_GMS" DatabaseField="manual_basal_GMS" IsEntryField="true"  IsDoubleEntryField="true"  ShowFieldLabel="false"    FieldLabelWidth="50px" FieldTextBoxWidth="40px" FieldTextBoxMaxLength="50"  ></def:datafieldcontrol> </td> 
<td> <def:datafieldcontrol runat="server" id="basal_GMS" DatabaseField="basal_GMS" IsReadOnly="true"  ShowFieldLabel="false"    FieldLabelWidth="50px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="50" RenderReadOnlyAsDiv = "true" ></def:datafieldcontrol> </td> 
<td> <def:datafieldcontrol runat="server" id="ceil_GMS" DatabaseField="ceil_GMS" IsReadOnly="true"  ShowFieldLabel="false"    FieldLabelWidth="50px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="50" RenderReadOnlyAsDiv = "true" ></def:datafieldcontrol> </td> 
<td> <def:datafieldcontrol runat="server" id="str_GMS" DatabaseField="str_GMS" IsReadOnly="true"  ShowFieldLabel="false"    FieldLabelWidth="50px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="50" RenderReadOnlyAsDiv = "true" ></def:datafieldcontrol> </td> 
<td> <def:datafieldcontrol runat="server" id="diff_GMS" DatabaseField="diff_GMS" IsReadOnly="true"  ShowFieldLabel="false"    FieldLabelWidth="50px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="50" RenderReadOnlyAsDiv = "true" ></def:datafieldcontrol> </td> 
</tr>

<tr>
<td><a href="#fms"><font color="blue">Fine Motor</font></a></td>
<td> <def:datafieldcontrol runat="server" id="import_FMS_raw"  DatabaseField="import_FMS_raw"  IsEntryField="true" IsEntryValueRequired="true"  IsDoubleEntryField="true"  ShowFieldLabel="false"    FieldLabelWidth="50px" FieldTextBoxWidth="40px" FieldTextBoxMaxLength="50" ></def:datafieldcontrol> </td> 
<td> <def:datafieldcontrol runat="server" id="manual_basal_FMS" DatabaseField="manual_basal_FMS" IsEntryField="true"  IsDoubleEntryField="true"  ShowFieldLabel="false"    FieldLabelWidth="50px" FieldTextBoxWidth="40px" FieldTextBoxMaxLength="50" ></def:datafieldcontrol> </td> 
<td> <def:datafieldcontrol runat="server" id="basal_FMS" DatabaseField="basal_FMS" IsReadOnly="true"  ShowFieldLabel="false"    FieldLabelWidth="50px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="50" RenderReadOnlyAsDiv = "true" ></def:datafieldcontrol> </td> 
<td> <def:datafieldcontrol runat="server" id="ceil_FMS" DatabaseField="ceil_FMS" IsReadOnly="true"  ShowFieldLabel="false"    FieldLabelWidth="50px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="50" RenderReadOnlyAsDiv = "true" ></def:datafieldcontrol> </td> 
<td> <def:datafieldcontrol runat="server" id="str_FMS" DatabaseField="str_FMS" IsReadOnly="true"  ShowFieldLabel="false"    FieldLabelWidth="50px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="50" RenderReadOnlyAsDiv = "true" ></def:datafieldcontrol> </td> 
<td> <def:datafieldcontrol runat="server" id="diff_FMS" DatabaseField="diff_FMS" IsReadOnly="true"  ShowFieldLabel="false"    FieldLabelWidth="50px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="50" RenderReadOnlyAsDiv = "true" ></def:datafieldcontrol> </td> 
</tr>
</table>
</div>

<h5><font color="red">Enter item scores here. </font></h5>
<h3>Communication Domain</h3>

<!-- Support for jump links outside tab flow -->
<table border="0" cellpadding="0" cellspacing="0">
    <tr>
        <td rowspan="25">

<h4><a name="rec">Receptive</a></h4>
<div class="collection">
  <div class="main">
    <def:datafieldcontrol runat="server" id="REC_ITEM_1" DatabaseField="REC_ITEM_1" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="REC_ITEM_2" DatabaseField="REC_ITEM_2" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="REC_ITEM_3" DatabaseField="REC_ITEM_3" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="REC_ITEM_4" DatabaseField="REC_ITEM_4" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="REC_ITEM_5" DatabaseField="REC_ITEM_5" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="REC_ITEM_6" DatabaseField="REC_ITEM_6" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="REC_ITEM_7" DatabaseField="REC_ITEM_7" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="REC_ITEM_8" DatabaseField="REC_ITEM_8" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="REC_ITEM_9" DatabaseField="REC_ITEM_9" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="REC_ITEM_10" DatabaseField="REC_ITEM_10" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
  </div>
  <div class="key"><def:ValueSetLabel ID="ValueSetLabel_REC_ITEM_1" runat="server"  DatabaseField="REC_ITEM_1"></def:ValueSetLabel></div>
</div>
<div class="collection">
  <div class="main">
    <def:datafieldcontrol runat="server" id="REC_ITEM_11" DatabaseField="REC_ITEM_11" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="REC_ITEM_12" DatabaseField="REC_ITEM_12" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="REC_ITEM_13" DatabaseField="REC_ITEM_13" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="REC_ITEM_14" DatabaseField="REC_ITEM_14" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="REC_ITEM_15" DatabaseField="REC_ITEM_15" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="REC_ITEM_16" DatabaseField="REC_ITEM_16" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="REC_ITEM_17" DatabaseField="REC_ITEM_17" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="REC_ITEM_18" DatabaseField="REC_ITEM_18" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="REC_ITEM_19" DatabaseField="REC_ITEM_19" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="REC_ITEM_20" DatabaseField="REC_ITEM_20" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
  </div>
  <div class="key"><def:ValueSetLabel ID="ValueSetLabel_REC_ITEM_11" runat="server"  DatabaseField="REC_ITEM_11"></def:ValueSetLabel></div>
</div>
<h4><a name="exp">Expressive</a></h4>
<div class="collection">
  <div class="main">
    <def:datafieldcontrol runat="server" id="EXP_ITEM_1" DatabaseField="EXP_ITEM_1" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="EXP_ITEM_2" DatabaseField="EXP_ITEM_2" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="EXP_ITEM_3" DatabaseField="EXP_ITEM_3" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="EXP_ITEM_4" DatabaseField="EXP_ITEM_4" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="EXP_ITEM_5" DatabaseField="EXP_ITEM_5" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="EXP_ITEM_6" DatabaseField="EXP_ITEM_6" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="EXP_ITEM_7" DatabaseField="EXP_ITEM_7" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="EXP_ITEM_8" DatabaseField="EXP_ITEM_8" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="EXP_ITEM_9" DatabaseField="EXP_ITEM_9" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="EXP_ITEM_10" DatabaseField="EXP_ITEM_10" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
  </div>
  <div class="key"><def:ValueSetLabel ID="ValueSetLabel_EXP_ITEM_1" runat="server"  DatabaseField="EXP_ITEM_1"></def:ValueSetLabel></div>
</div>
<div class="collection">
  <div class="main">
    <def:datafieldcontrol runat="server" id="EXP_ITEM_11" DatabaseField="EXP_ITEM_11" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="EXP_ITEM_12" DatabaseField="EXP_ITEM_12" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="EXP_ITEM_13" DatabaseField="EXP_ITEM_13" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="EXP_ITEM_14" DatabaseField="EXP_ITEM_14" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="EXP_ITEM_15" DatabaseField="EXP_ITEM_15" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="EXP_ITEM_16" DatabaseField="EXP_ITEM_16" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="EXP_ITEM_17" DatabaseField="EXP_ITEM_17" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="EXP_ITEM_18" DatabaseField="EXP_ITEM_18" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="EXP_ITEM_19" DatabaseField="EXP_ITEM_19" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="EXP_ITEM_20" DatabaseField="EXP_ITEM_20" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
  </div>
  <div class="key"><def:ValueSetLabel ID="ValueSetLabel_EXP_ITEM_11" runat="server"  DatabaseField="EXP_ITEM_11"></def:ValueSetLabel></div>
</div>
<div class="collection">
  <div class="main">
    <def:datafieldcontrol runat="server" id="EXP_ITEM_21" DatabaseField="EXP_ITEM_21" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="EXP_ITEM_22" DatabaseField="EXP_ITEM_22" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="EXP_ITEM_23" DatabaseField="EXP_ITEM_23" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="EXP_ITEM_24" DatabaseField="EXP_ITEM_24" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="EXP_ITEM_25" DatabaseField="EXP_ITEM_25" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="EXP_ITEM_26" DatabaseField="EXP_ITEM_26" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="EXP_ITEM_27" DatabaseField="EXP_ITEM_27" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="EXP_ITEM_28" DatabaseField="EXP_ITEM_28" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="EXP_ITEM_29" DatabaseField="EXP_ITEM_29" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="EXP_ITEM_30" DatabaseField="EXP_ITEM_30" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
  </div>
  <div class="key"><def:ValueSetLabel ID="ValueSetLabel_EXP_ITEM_21" runat="server"  DatabaseField="EXP_ITEM_21"></def:ValueSetLabel></div>
</div>
<div class="collection">
  <div class="main">
    <def:datafieldcontrol runat="server" id="EXP_ITEM_31" DatabaseField="EXP_ITEM_31" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="EXP_ITEM_32" DatabaseField="EXP_ITEM_32" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="EXP_ITEM_33" DatabaseField="EXP_ITEM_33" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="EXP_ITEM_34" DatabaseField="EXP_ITEM_34" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="EXP_ITEM_35" DatabaseField="EXP_ITEM_35" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="EXP_ITEM_36" DatabaseField="EXP_ITEM_36" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="EXP_ITEM_37" DatabaseField="EXP_ITEM_37" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="EXP_ITEM_38" DatabaseField="EXP_ITEM_38" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="EXP_ITEM_39" DatabaseField="EXP_ITEM_39" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="EXP_ITEM_40" DatabaseField="EXP_ITEM_40" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
  </div>
  <div class="key"><def:ValueSetLabel ID="ValueSetLabel_EXP_ITEM_31" runat="server"  DatabaseField="EXP_ITEM_31"></def:ValueSetLabel></div>
</div>
<div class="collection">
  <div class="main">
    <def:datafieldcontrol runat="server" id="EXP_ITEM_41" DatabaseField="EXP_ITEM_41" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="EXP_ITEM_42" DatabaseField="EXP_ITEM_42" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="EXP_ITEM_43" DatabaseField="EXP_ITEM_43" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="EXP_ITEM_44" DatabaseField="EXP_ITEM_44" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="EXP_ITEM_45" DatabaseField="EXP_ITEM_45" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="EXP_ITEM_46" DatabaseField="EXP_ITEM_46" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="EXP_ITEM_47" DatabaseField="EXP_ITEM_47" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="EXP_ITEM_48" DatabaseField="EXP_ITEM_48" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="EXP_ITEM_49" DatabaseField="EXP_ITEM_49" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="EXP_ITEM_50" DatabaseField="EXP_ITEM_50" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
  </div>
  <div class="key"><def:ValueSetLabel ID="ValueSetLabel_EXP_ITEM_41" runat="server"  DatabaseField="EXP_ITEM_41"></def:ValueSetLabel></div>
</div>
<div class="collection">
  <div class="main">
    <def:datafieldcontrol runat="server" id="EXP_ITEM_51" DatabaseField="EXP_ITEM_51" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="EXP_ITEM_52" DatabaseField="EXP_ITEM_52" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="EXP_ITEM_53" DatabaseField="EXP_ITEM_53" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="EXP_ITEM_54" DatabaseField="EXP_ITEM_54" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
  </div>
  <div class="key"><def:ValueSetLabel ID="ValueSetLabel_EXP_ITEM_51" runat="server"  DatabaseField="EXP_ITEM_51"></def:ValueSetLabel></div>
</div>
<h4><a name="wrn">Written</a></h4>
<div class="collection">
  <div class="main">
    <def:datafieldcontrol runat="server" id="WRN_ITEM_1" DatabaseField="WRN_ITEM_1" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="WRN_ITEM_2" DatabaseField="WRN_ITEM_2" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="WRN_ITEM_3" DatabaseField="WRN_ITEM_3" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="WRN_ITEM_4" DatabaseField="WRN_ITEM_4" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="WRN_ITEM_5" DatabaseField="WRN_ITEM_5" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="WRN_ITEM_6" DatabaseField="WRN_ITEM_6" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="WRN_ITEM_7" DatabaseField="WRN_ITEM_7" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="WRN_ITEM_8" DatabaseField="WRN_ITEM_8" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="WRN_ITEM_9" DatabaseField="WRN_ITEM_9" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="WRN_ITEM_10" DatabaseField="WRN_ITEM_10" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
  </div>
  <div class="key"><def:ValueSetLabel ID="ValueSetLabel_WRN_ITEM_1" runat="server"  DatabaseField="WRN_ITEM_1"></def:ValueSetLabel></div>
</div>
<div class="collection">
  <div class="main">
    <def:datafieldcontrol runat="server" id="WRN_ITEM_11" DatabaseField="WRN_ITEM_11" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="WRN_ITEM_12" DatabaseField="WRN_ITEM_12" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="WRN_ITEM_13" DatabaseField="WRN_ITEM_13" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="WRN_ITEM_14" DatabaseField="WRN_ITEM_14" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="WRN_ITEM_15" DatabaseField="WRN_ITEM_15" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="WRN_ITEM_16" DatabaseField="WRN_ITEM_16" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="WRN_ITEM_17" DatabaseField="WRN_ITEM_17" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="WRN_ITEM_18" DatabaseField="WRN_ITEM_18" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="WRN_ITEM_19" DatabaseField="WRN_ITEM_19" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="WRN_ITEM_20" DatabaseField="WRN_ITEM_20" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
  </div>
  <div class="key"><def:ValueSetLabel ID="ValueSetLabel_WRN_ITEM_11" runat="server"  DatabaseField="WRN_ITEM_11"></def:ValueSetLabel></div>
</div>
<div class="collection">
  <div class="main">
    <def:datafieldcontrol runat="server" id="WRN_ITEM_21" DatabaseField="WRN_ITEM_21" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="WRN_ITEM_22" DatabaseField="WRN_ITEM_22" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="WRN_ITEM_23" DatabaseField="WRN_ITEM_23" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="WRN_ITEM_24" DatabaseField="WRN_ITEM_24" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="WRN_ITEM_25" DatabaseField="WRN_ITEM_25" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
  </div>
  <div class="key"><def:ValueSetLabel ID="ValueSetLabel_WRN_ITEM_21" runat="server"  DatabaseField="WRN_ITEM_21"></def:ValueSetLabel></div>
</div>
<h3>Daily Living Skills Domain</h3>
<h4><a name="per">Personal</a></h4>
<div class="collection">
  <div class="main">
    <def:datafieldcontrol runat="server" id="PER_ITEM_1" DatabaseField="PER_ITEM_1" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="PER_ITEM_2" DatabaseField="PER_ITEM_2" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="PER_ITEM_3" DatabaseField="PER_ITEM_3" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="PER_ITEM_4" DatabaseField="PER_ITEM_4" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="PER_ITEM_5" DatabaseField="PER_ITEM_5" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="PER_ITEM_6" DatabaseField="PER_ITEM_6" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="PER_ITEM_7" DatabaseField="PER_ITEM_7" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="PER_ITEM_8" DatabaseField="PER_ITEM_8" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="PER_ITEM_9" DatabaseField="PER_ITEM_9" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="PER_ITEM_10" DatabaseField="PER_ITEM_10" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
  </div>
  <div class="key"><def:ValueSetLabel ID="ValueSetLabel_PER_ITEM_1" runat="server"  DatabaseField="PER_ITEM_1"></def:ValueSetLabel></div>
</div>
<div class="collection">
  <div class="main">
    <def:datafieldcontrol runat="server" id="PER_ITEM_11" DatabaseField="PER_ITEM_11" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="PER_ITEM_12" DatabaseField="PER_ITEM_12" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="PER_ITEM_13" DatabaseField="PER_ITEM_13" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="PER_ITEM_14" DatabaseField="PER_ITEM_14" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="PER_ITEM_15" DatabaseField="PER_ITEM_15" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="PER_ITEM_16" DatabaseField="PER_ITEM_16" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="PER_ITEM_17" DatabaseField="PER_ITEM_17" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="PER_ITEM_18" DatabaseField="PER_ITEM_18" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="PER_ITEM_19" DatabaseField="PER_ITEM_19" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="PER_ITEM_20" DatabaseField="PER_ITEM_20" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
  </div>
  <div class="key"><def:ValueSetLabel ID="ValueSetLabel_PER_ITEM_11" runat="server"  DatabaseField="PER_ITEM_11"></def:ValueSetLabel></div>
</div>
<div class="collection">
  <div class="main">
    <def:datafieldcontrol runat="server" id="PER_ITEM_21" DatabaseField="PER_ITEM_21" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="PER_ITEM_22" DatabaseField="PER_ITEM_22" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="PER_ITEM_23" DatabaseField="PER_ITEM_23" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="PER_ITEM_24" DatabaseField="PER_ITEM_24" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="PER_ITEM_25" DatabaseField="PER_ITEM_25" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="PER_ITEM_26" DatabaseField="PER_ITEM_26" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="PER_ITEM_27" DatabaseField="PER_ITEM_27" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="PER_ITEM_28" DatabaseField="PER_ITEM_28" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="PER_ITEM_29" DatabaseField="PER_ITEM_29" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="PER_ITEM_30" DatabaseField="PER_ITEM_30" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
  </div>
  <div class="key"><def:ValueSetLabel ID="ValueSetLabel_PER_ITEM_21" runat="server"  DatabaseField="PER_ITEM_21"></def:ValueSetLabel></div>
</div>
<div class="collection">
  <div class="main">
    <def:datafieldcontrol runat="server" id="PER_ITEM_31" DatabaseField="PER_ITEM_31" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="PER_ITEM_32" DatabaseField="PER_ITEM_32" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="PER_ITEM_33" DatabaseField="PER_ITEM_33" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="PER_ITEM_34" DatabaseField="PER_ITEM_34" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="PER_ITEM_35" DatabaseField="PER_ITEM_35" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="PER_ITEM_36" DatabaseField="PER_ITEM_36" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="PER_ITEM_37" DatabaseField="PER_ITEM_37" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
  </div>
  <div class="key"><def:ValueSetLabel ID="ValueSetLabel_PER_ITEM_31" runat="server"  DatabaseField="PER_ITEM_31"></def:ValueSetLabel></div>
</div>
<div class="collection">
  <div class="main">
    <def:datafieldcontrol runat="server" id="PER_ITEM_38" DatabaseField="PER_ITEM_38" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="PER_ITEM_39" DatabaseField="PER_ITEM_39" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
  </div>
  <div class="key"><def:ValueSetLabel ID="ValueSetLabel_PER_ITEM_38" runat="server"  DatabaseField="PER_ITEM_38"></def:ValueSetLabel></div>
</div>
<div class="collection">
  <div class="main">
    <def:datafieldcontrol runat="server" id="PER_ITEM_40" DatabaseField="PER_ITEM_40" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="PER_ITEM_41" DatabaseField="PER_ITEM_41" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
  </div>
  <div class="key"><def:ValueSetLabel ID="ValueSetLabel_PER_ITEM_40" runat="server"  DatabaseField="PER_ITEM_40"></def:ValueSetLabel></div>
</div>
<h4><a name="dom">Domestic</a></h4>
<div class="collection">
  <div class="main">
    <def:datafieldcontrol runat="server" id="DOM_ITEM_1" DatabaseField="DOM_ITEM_1" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="DOM_ITEM_2" DatabaseField="DOM_ITEM_2" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="DOM_ITEM_3" DatabaseField="DOM_ITEM_3" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="DOM_ITEM_4" DatabaseField="DOM_ITEM_4" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="DOM_ITEM_5" DatabaseField="DOM_ITEM_5" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="DOM_ITEM_6" DatabaseField="DOM_ITEM_6" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="DOM_ITEM_7" DatabaseField="DOM_ITEM_7" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="DOM_ITEM_8" DatabaseField="DOM_ITEM_8" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="DOM_ITEM_9" DatabaseField="DOM_ITEM_9" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
  </div>
  <div class="key"><def:ValueSetLabel ID="ValueSetLabel_DOM_ITEM_1" runat="server"  DatabaseField="DOM_ITEM_1"></def:ValueSetLabel></div>
</div>
<div class="collection">
  <div class="main">
    <def:datafieldcontrol runat="server" id="DOM_ITEM_10" DatabaseField="DOM_ITEM_10" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
  </div>
  <div class="key"><def:ValueSetLabel ID="ValueSetLabel_DOM_ITEM_10" runat="server"  DatabaseField="DOM_ITEM_10"></def:ValueSetLabel></div>
</div>
<div class="collection">
  <div class="main">
    <def:datafieldcontrol runat="server" id="DOM_ITEM_11" DatabaseField="DOM_ITEM_11" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="DOM_ITEM_12" DatabaseField="DOM_ITEM_12" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="DOM_ITEM_13" DatabaseField="DOM_ITEM_13" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="DOM_ITEM_14" DatabaseField="DOM_ITEM_14" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="DOM_ITEM_15" DatabaseField="DOM_ITEM_15" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="DOM_ITEM_16" DatabaseField="DOM_ITEM_16" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="DOM_ITEM_17" DatabaseField="DOM_ITEM_17" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="DOM_ITEM_18" DatabaseField="DOM_ITEM_18" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="DOM_ITEM_19" DatabaseField="DOM_ITEM_19" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="DOM_ITEM_20" DatabaseField="DOM_ITEM_20" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
  </div>
  <div class="key"><def:ValueSetLabel ID="ValueSetLabel_DOM_ITEM_11" runat="server"  DatabaseField="DOM_ITEM_11"></def:ValueSetLabel></div>
</div>
<div class="collection">
  <div class="main">
    <def:datafieldcontrol runat="server" id="DOM_ITEM_21" DatabaseField="DOM_ITEM_21" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="DOM_ITEM_22" DatabaseField="DOM_ITEM_22" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="DOM_ITEM_23" DatabaseField="DOM_ITEM_23" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="DOM_ITEM_24" DatabaseField="DOM_ITEM_24" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
  </div>
  <div class="key"><def:ValueSetLabel ID="ValueSetLabel_DOM_ITEM_21" runat="server"  DatabaseField="DOM_ITEM_21"></def:ValueSetLabel></div>
</div>
<h4><a name="cmm">Community</a></h4>
<div class="collection">
  <div class="main">
    <def:datafieldcontrol runat="server" id="CMM_ITEM_1" DatabaseField="CMM_ITEM_1" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="CMM_ITEM_2" DatabaseField="CMM_ITEM_2" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
  </div>
  <div class="key"><def:ValueSetLabel ID="ValueSetLabel_CMM_ITEM_1" runat="server"  DatabaseField="CMM_ITEM_1"></def:ValueSetLabel></div>
</div>
<div class="collection">
  <div class="main">
    <def:datafieldcontrol runat="server" id="CMM_ITEM_3" DatabaseField="CMM_ITEM_3" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
  </div>
  <div class="key"><def:ValueSetLabel ID="ValueSetLabel_CMM_ITEM_3" runat="server"  DatabaseField="CMM_ITEM_3"></def:ValueSetLabel></div>
</div>
<div class="collection">
  <div class="main">
    <def:datafieldcontrol runat="server" id="CMM_ITEM_4" DatabaseField="CMM_ITEM_4" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="CMM_ITEM_5" DatabaseField="CMM_ITEM_5" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="CMM_ITEM_6" DatabaseField="CMM_ITEM_6" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="CMM_ITEM_7" DatabaseField="CMM_ITEM_7" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="CMM_ITEM_8" DatabaseField="CMM_ITEM_8" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="CMM_ITEM_9" DatabaseField="CMM_ITEM_9" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
  </div>
</div>
<div class="collection">
  <div class="main">
    <def:datafieldcontrol runat="server" id="CMM_ITEM_10" DatabaseField="CMM_ITEM_10" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
  </div>
  <div class="key"><def:ValueSetLabel ID="ValueSetLabel_CMM_ITEM_10" runat="server"  DatabaseField="CMM_ITEM_10"></def:ValueSetLabel></div>
</div>
<div class="collection">
  <div class="main">
    <def:datafieldcontrol runat="server" id="CMM_ITEM_11" DatabaseField="CMM_ITEM_11" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="CMM_ITEM_12" DatabaseField="CMM_ITEM_12" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="CMM_ITEM_13" DatabaseField="CMM_ITEM_13" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="CMM_ITEM_14" DatabaseField="CMM_ITEM_14" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="CMM_ITEM_15" DatabaseField="CMM_ITEM_15" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="CMM_ITEM_16" DatabaseField="CMM_ITEM_16" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="CMM_ITEM_17" DatabaseField="CMM_ITEM_17" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="CMM_ITEM_18" DatabaseField="CMM_ITEM_18" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="CMM_ITEM_19" DatabaseField="CMM_ITEM_19" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="CMM_ITEM_20" DatabaseField="CMM_ITEM_20" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
  </div>
  <div class="key"><def:ValueSetLabel ID="ValueSetLabel_CMM_ITEM_11" runat="server"  DatabaseField="CMM_ITEM_11"></def:ValueSetLabel></div>
</div>
<div class="collection">
  <div class="main">
    <def:datafieldcontrol runat="server" id="CMM_ITEM_21" DatabaseField="CMM_ITEM_21" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="CMM_ITEM_22" DatabaseField="CMM_ITEM_22" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="CMM_ITEM_23" DatabaseField="CMM_ITEM_23" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="CMM_ITEM_24" DatabaseField="CMM_ITEM_24" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
  </div>
  <div class="key"><def:ValueSetLabel ID="ValueSetLabel_CMM_ITEM_21" runat="server"  DatabaseField="CMM_ITEM_21"></def:ValueSetLabel></div>
</div>
<div class="collection">
  <div class="main">
    <def:datafieldcontrol runat="server" id="CMM_ITEM_25" DatabaseField="CMM_ITEM_25" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
  </div>
  <div class="key"><def:ValueSetLabel ID="ValueSetLabel_CMM_ITEM_25" runat="server"  DatabaseField="CMM_ITEM_25"></def:ValueSetLabel></div>
</div>
<div class="collection">
  <div class="main">
    <def:datafieldcontrol runat="server" id="CMM_ITEM_26" DatabaseField="CMM_ITEM_26" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="CMM_ITEM_27" DatabaseField="CMM_ITEM_27" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="CMM_ITEM_28" DatabaseField="CMM_ITEM_28" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
  </div>
  <div class="key"><def:ValueSetLabel ID="ValueSetLabel_CMM_ITEM_26" runat="server"  DatabaseField="CMM_ITEM_26"></def:ValueSetLabel></div>
</div>
<div class="collection">
  <div class="main">
    <def:datafieldcontrol runat="server" id="CMM_ITEM_29" DatabaseField="CMM_ITEM_29" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
  </div>
  <div class="key"><def:ValueSetLabel ID="ValueSetLabel_CMM_ITEM_29" runat="server"  DatabaseField="CMM_ITEM_29"></def:ValueSetLabel></div>
</div>
<div class="collection">
  <div class="main">
    <def:datafieldcontrol runat="server" id="CMM_ITEM_30" DatabaseField="CMM_ITEM_30" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
  </div>
  <div class="key"><def:ValueSetLabel ID="ValueSetLabel_CMM_ITEM_30" runat="server"  DatabaseField="CMM_ITEM_30"></def:ValueSetLabel></div>
</div>
<div class="collection">
  <div class="main">
    <def:datafieldcontrol runat="server" id="CMM_ITEM_31" DatabaseField="CMM_ITEM_31" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
  </div>
  <div class="key"><def:ValueSetLabel ID="ValueSetLabel_CMM_ITEM_31" runat="server"  DatabaseField="CMM_ITEM_31"></def:ValueSetLabel></div>
</div>
<div class="collection">
  <div class="main">
    <def:datafieldcontrol runat="server" id="CMM_ITEM_32" DatabaseField="CMM_ITEM_32" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="CMM_ITEM_33" DatabaseField="CMM_ITEM_33" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="CMM_ITEM_34" DatabaseField="CMM_ITEM_34" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="CMM_ITEM_35" DatabaseField="CMM_ITEM_35" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="CMM_ITEM_36" DatabaseField="CMM_ITEM_36" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="CMM_ITEM_37" DatabaseField="CMM_ITEM_37" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="CMM_ITEM_38" DatabaseField="CMM_ITEM_38" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
  </div>
  <div class="key"><def:ValueSetLabel ID="ValueSetLabel_CMM_ITEM_32" runat="server"  DatabaseField="CMM_ITEM_32"></def:ValueSetLabel></div>
</div>
<div class="collection">
  <div class="main">
    <def:datafieldcontrol runat="server" id="CMM_ITEM_39" DatabaseField="CMM_ITEM_39" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
  </div>
  <div class="key"><def:ValueSetLabel ID="ValueSetLabel_CMM_ITEM_39" runat="server"  DatabaseField="CMM_ITEM_39"></def:ValueSetLabel></div>
</div>
<div class="collection">
  <div class="main">
    <def:datafieldcontrol runat="server" id="CMM_ITEM_40" DatabaseField="CMM_ITEM_40" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
  </div>
  <div class="key"><def:ValueSetLabel ID="ValueSetLabel_CMM_ITEM_40" runat="server"  DatabaseField="CMM_ITEM_40"></def:ValueSetLabel></div>
</div>
<div class="collection">
  <div class="main">
    <def:datafieldcontrol runat="server" id="CMM_ITEM_41" DatabaseField="CMM_ITEM_41" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
  </div>
  <div class="key"><def:ValueSetLabel ID="ValueSetLabel_CMM_ITEM_41" runat="server"  DatabaseField="CMM_ITEM_41"></def:ValueSetLabel></div>
</div>
<div class="collection">
  <div class="main">
    <def:datafieldcontrol runat="server" id="CMM_ITEM_42" DatabaseField="CMM_ITEM_42" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
  </div>
  <div class="key"><def:ValueSetLabel ID="ValueSetLabel_CMM_ITEM_42" runat="server"  DatabaseField="CMM_ITEM_42"></def:ValueSetLabel></div>
</div>
<div class="collection">
  <div class="main">
    <def:datafieldcontrol runat="server" id="CMM_ITEM_43" DatabaseField="CMM_ITEM_43" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="CMM_ITEM_44" DatabaseField="CMM_ITEM_44" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
  </div>
  <div class="key"><def:ValueSetLabel ID="ValueSetLabel_CMM_ITEM_43" runat="server"  DatabaseField="CMM_ITEM_43"></def:ValueSetLabel></div>
</div>
<h3>Socialization Domain</h3>
<h4><a name="ipr">Interpersonal Relationships</a></h4>
<div class="collection">
  <div class="main">
    <def:datafieldcontrol runat="server" id="IPR_ITEM_1" DatabaseField="IPR_ITEM_1" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="IPR_ITEM_2" DatabaseField="IPR_ITEM_2" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="IPR_ITEM_3" DatabaseField="IPR_ITEM_3" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="IPR_ITEM_4" DatabaseField="IPR_ITEM_4" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="IPR_ITEM_5" DatabaseField="IPR_ITEM_5" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="IPR_ITEM_6" DatabaseField="IPR_ITEM_6" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="IPR_ITEM_7" DatabaseField="IPR_ITEM_7" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="IPR_ITEM_8" DatabaseField="IPR_ITEM_8" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="IPR_ITEM_9" DatabaseField="IPR_ITEM_9" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="IPR_ITEM_10" DatabaseField="IPR_ITEM_10" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
  </div>
  <div class="key"><def:ValueSetLabel ID="ValueSetLabel_IPR_ITEM_1" runat="server"  DatabaseField="IPR_ITEM_1"></def:ValueSetLabel></div>
</div>
<div class="collection">
  <div class="main">
    <def:datafieldcontrol runat="server" id="IPR_ITEM_11" DatabaseField="IPR_ITEM_11" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="IPR_ITEM_12" DatabaseField="IPR_ITEM_12" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="IPR_ITEM_13" DatabaseField="IPR_ITEM_13" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="IPR_ITEM_14" DatabaseField="IPR_ITEM_14" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="IPR_ITEM_15" DatabaseField="IPR_ITEM_15" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="IPR_ITEM_16" DatabaseField="IPR_ITEM_16" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="IPR_ITEM_17" DatabaseField="IPR_ITEM_17" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="IPR_ITEM_18" DatabaseField="IPR_ITEM_18" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="IPR_ITEM_19" DatabaseField="IPR_ITEM_19" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="IPR_ITEM_20" DatabaseField="IPR_ITEM_20" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
  </div>
  <div class="key"><def:ValueSetLabel ID="ValueSetLabel_IPR_ITEM_11" runat="server"  DatabaseField="IPR_ITEM_11"></def:ValueSetLabel></div>
</div>
<div class="collection">
  <div class="main">
    <def:datafieldcontrol runat="server" id="IPR_ITEM_21" DatabaseField="IPR_ITEM_21" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="IPR_ITEM_22" DatabaseField="IPR_ITEM_22" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="IPR_ITEM_23" DatabaseField="IPR_ITEM_23" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="IPR_ITEM_24" DatabaseField="IPR_ITEM_24" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="IPR_ITEM_25" DatabaseField="IPR_ITEM_25" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="IPR_ITEM_26" DatabaseField="IPR_ITEM_26" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="IPR_ITEM_27" DatabaseField="IPR_ITEM_27" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="IPR_ITEM_28" DatabaseField="IPR_ITEM_28" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="IPR_ITEM_29" DatabaseField="IPR_ITEM_29" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="IPR_ITEM_30" DatabaseField="IPR_ITEM_30" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
  </div>
  <div class="key"><def:ValueSetLabel ID="ValueSetLabel_IPR_ITEM_21" runat="server"  DatabaseField="IPR_ITEM_21"></def:ValueSetLabel></div>
</div>
<div class="collection">
  <div class="main">
    <def:datafieldcontrol runat="server" id="IPR_ITEM_31" DatabaseField="IPR_ITEM_31" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="IPR_ITEM_32" DatabaseField="IPR_ITEM_32" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="IPR_ITEM_33" DatabaseField="IPR_ITEM_33" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="IPR_ITEM_34" DatabaseField="IPR_ITEM_34" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="IPR_ITEM_35" DatabaseField="IPR_ITEM_35" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="IPR_ITEM_36" DatabaseField="IPR_ITEM_36" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="IPR_ITEM_37" DatabaseField="IPR_ITEM_37" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="IPR_ITEM_38" DatabaseField="IPR_ITEM_38" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
  </div>
  <div class="key"><def:ValueSetLabel ID="ValueSetLabel_IPR_ITEM_31" runat="server"  DatabaseField="IPR_ITEM_31"></def:ValueSetLabel></div>
</div>
<h4><a name="pl">Play and Leisure Time</a></h4>
<div class="collection">
  <div class="main">
    <def:datafieldcontrol runat="server" id="PL_ITEM_1" DatabaseField="PL_ITEM_1" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="PL_ITEM_2" DatabaseField="PL_ITEM_2" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="PL_ITEM_3" DatabaseField="PL_ITEM_3" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="PL_ITEM_4" DatabaseField="PL_ITEM_4" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="PL_ITEM_5" DatabaseField="PL_ITEM_5" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="PL_ITEM_6" DatabaseField="PL_ITEM_6" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="PL_ITEM_7" DatabaseField="PL_ITEM_7" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="PL_ITEM_8" DatabaseField="PL_ITEM_8" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="PL_ITEM_9" DatabaseField="PL_ITEM_9" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="PL_ITEM_10" DatabaseField="PL_ITEM_10" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
  </div>
  <div class="key"><def:ValueSetLabel ID="ValueSetLabel_PL_ITEM_1" runat="server"  DatabaseField="PL_ITEM_1"></def:ValueSetLabel></div>
</div>
<div class="collection">
  <div class="main">
    <def:datafieldcontrol runat="server" id="PL_ITEM_11" DatabaseField="PL_ITEM_11" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="PL_ITEM_12" DatabaseField="PL_ITEM_12" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="PL_ITEM_13" DatabaseField="PL_ITEM_13" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="PL_ITEM_14" DatabaseField="PL_ITEM_14" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="PL_ITEM_15" DatabaseField="PL_ITEM_15" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="PL_ITEM_16" DatabaseField="PL_ITEM_16" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="PL_ITEM_17" DatabaseField="PL_ITEM_17" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="PL_ITEM_18" DatabaseField="PL_ITEM_18" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="PL_ITEM_19" DatabaseField="PL_ITEM_19" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="PL_ITEM_20" DatabaseField="PL_ITEM_20" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
  </div>
  <div class="key"><def:ValueSetLabel ID="ValueSetLabel_PL_ITEM_11" runat="server"  DatabaseField="PL_ITEM_11"></def:ValueSetLabel></div>
</div>
<div class="collection">
  <div class="main">
    <def:datafieldcontrol runat="server" id="PL_ITEM_21" DatabaseField="PL_ITEM_21" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="PL_ITEM_22" DatabaseField="PL_ITEM_22" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="PL_ITEM_23" DatabaseField="PL_ITEM_23" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="PL_ITEM_24" DatabaseField="PL_ITEM_24" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="PL_ITEM_25" DatabaseField="PL_ITEM_25" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="PL_ITEM_26" DatabaseField="PL_ITEM_26" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="PL_ITEM_27" DatabaseField="PL_ITEM_27" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="PL_ITEM_28" DatabaseField="PL_ITEM_28" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="PL_ITEM_29" DatabaseField="PL_ITEM_29" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="PL_ITEM_30" DatabaseField="PL_ITEM_30" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="PL_ITEM_31" DatabaseField="PL_ITEM_31" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
  </div>
  <div class="key"><def:ValueSetLabel ID="ValueSetLabel_PL_ITEM_21" runat="server"  DatabaseField="PL_ITEM_21"></def:ValueSetLabel></div>
</div>
<h4><a name="cs">Coping Skills</a></h4>
<div class="collection">
  <div class="main">
    <def:datafieldcontrol runat="server" id="CS_ITEM_1" DatabaseField="CS_ITEM_1" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="CS_ITEM_2" DatabaseField="CS_ITEM_2" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="CS_ITEM_3" DatabaseField="CS_ITEM_3" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="CS_ITEM_4" DatabaseField="CS_ITEM_4" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="CS_ITEM_5" DatabaseField="CS_ITEM_5" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="CS_ITEM_6" DatabaseField="CS_ITEM_6" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="CS_ITEM_7" DatabaseField="CS_ITEM_7" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="CS_ITEM_8" DatabaseField="CS_ITEM_8" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="CS_ITEM_9" DatabaseField="CS_ITEM_9" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="CS_ITEM_10" DatabaseField="CS_ITEM_10" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
  </div>
  <div class="key"><def:ValueSetLabel ID="ValueSetLabel_CS_ITEM_1" runat="server"  DatabaseField="CS_ITEM_1"></def:ValueSetLabel></div>
</div>
<div class="collection">
  <div class="main">
    <def:datafieldcontrol runat="server" id="CS_ITEM_11" DatabaseField="CS_ITEM_11" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="CS_ITEM_12" DatabaseField="CS_ITEM_12" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="CS_ITEM_13" DatabaseField="CS_ITEM_13" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="CS_ITEM_14" DatabaseField="CS_ITEM_14" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="CS_ITEM_15" DatabaseField="CS_ITEM_15" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="CS_ITEM_16" DatabaseField="CS_ITEM_16" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="CS_ITEM_17" DatabaseField="CS_ITEM_17" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="CS_ITEM_18" DatabaseField="CS_ITEM_18" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="CS_ITEM_19" DatabaseField="CS_ITEM_19" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="CS_ITEM_20" DatabaseField="CS_ITEM_20" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
  </div>
  <div class="key"><def:ValueSetLabel ID="ValueSetLabel_CS_ITEM_11" runat="server"  DatabaseField="CS_ITEM_11"></def:ValueSetLabel></div>
</div>
<div class="collection">
  <div class="main">
    <def:datafieldcontrol runat="server" id="CS_ITEM_21" DatabaseField="CS_ITEM_21" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="CS_ITEM_22" DatabaseField="CS_ITEM_22" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="CS_ITEM_23" DatabaseField="CS_ITEM_23" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="CS_ITEM_24" DatabaseField="CS_ITEM_24" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="CS_ITEM_25" DatabaseField="CS_ITEM_25" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="CS_ITEM_26" DatabaseField="CS_ITEM_26" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="CS_ITEM_27" DatabaseField="CS_ITEM_27" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="CS_ITEM_28" DatabaseField="CS_ITEM_28" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="CS_ITEM_29" DatabaseField="CS_ITEM_29" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="CS_ITEM_30" DatabaseField="CS_ITEM_30" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
  </div>
  <div class="key"><def:ValueSetLabel ID="ValueSetLabel_CS_ITEM_21" runat="server"  DatabaseField="CS_ITEM_21"></def:ValueSetLabel></div>
</div>
<h3>Motor Skills Domain</h3>
<h4><a name="gms">Gross motor</a></h4>
<div class="collection">
  <div class="main">
    <def:datafieldcontrol runat="server" id="GMS_ITEM_1" DatabaseField="GMS_ITEM_1" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="GMS_ITEM_2" DatabaseField="GMS_ITEM_2" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="GMS_ITEM_3" DatabaseField="GMS_ITEM_3" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="GMS_ITEM_4" DatabaseField="GMS_ITEM_4" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="GMS_ITEM_5" DatabaseField="GMS_ITEM_5" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="GMS_ITEM_6" DatabaseField="GMS_ITEM_6" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="GMS_ITEM_7" DatabaseField="GMS_ITEM_7" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="GMS_ITEM_8" DatabaseField="GMS_ITEM_8" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="GMS_ITEM_9" DatabaseField="GMS_ITEM_9" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="GMS_ITEM_10" DatabaseField="GMS_ITEM_10" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
  </div>
  <div class="key"><def:ValueSetLabel ID="ValueSetLabel_GMS_ITEM_1" runat="server"  DatabaseField="GMS_ITEM_1"></def:ValueSetLabel></div>
</div>
<div class="collection">
  <div class="main">
    <def:datafieldcontrol runat="server" id="GMS_ITEM_11" DatabaseField="GMS_ITEM_11" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="GMS_ITEM_12" DatabaseField="GMS_ITEM_12" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="GMS_ITEM_13" DatabaseField="GMS_ITEM_13" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="GMS_ITEM_14" DatabaseField="GMS_ITEM_14" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="GMS_ITEM_15" DatabaseField="GMS_ITEM_15" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="GMS_ITEM_16" DatabaseField="GMS_ITEM_16" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="GMS_ITEM_17" DatabaseField="GMS_ITEM_17" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="GMS_ITEM_18" DatabaseField="GMS_ITEM_18" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="GMS_ITEM_19" DatabaseField="GMS_ITEM_19" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="GMS_ITEM_20" DatabaseField="GMS_ITEM_20" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
  </div>
  <div class="key"><def:ValueSetLabel ID="ValueSetLabel_GMS_ITEM_11" runat="server"  DatabaseField="GMS_ITEM_11"></def:ValueSetLabel></div>
</div>
<div class="collection">
  <div class="main">
    <def:datafieldcontrol runat="server" id="GMS_ITEM_21" DatabaseField="GMS_ITEM_21" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="GMS_ITEM_22" DatabaseField="GMS_ITEM_22" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="GMS_ITEM_23" DatabaseField="GMS_ITEM_23" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="GMS_ITEM_24" DatabaseField="GMS_ITEM_24" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="GMS_ITEM_25" DatabaseField="GMS_ITEM_25" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="GMS_ITEM_26" DatabaseField="GMS_ITEM_26" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="GMS_ITEM_27" DatabaseField="GMS_ITEM_27" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="GMS_ITEM_28" DatabaseField="GMS_ITEM_28" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
  </div>
  <div class="key"><def:ValueSetLabel ID="ValueSetLabel_GMS_ITEM_21" runat="server"  DatabaseField="GMS_ITEM_21"></def:ValueSetLabel></div>
</div>
<div class="collection">
  <div class="main">
    <def:datafieldcontrol runat="server" id="GMS_ITEM_29" DatabaseField="GMS_ITEM_29" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
  </div>
  <div class="key"><def:ValueSetLabel ID="ValueSetLabel_GMS_ITEM_29" runat="server"  DatabaseField="GMS_ITEM_29"></def:ValueSetLabel></div>
</div>
<div class="collection">
  <div class="main">
    <def:datafieldcontrol runat="server" id="GMS_ITEM_30" DatabaseField="GMS_ITEM_30" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="GMS_ITEM_31" DatabaseField="GMS_ITEM_31" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="GMS_ITEM_32" DatabaseField="GMS_ITEM_32" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="GMS_ITEM_33" DatabaseField="GMS_ITEM_33" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="GMS_ITEM_34" DatabaseField="GMS_ITEM_34" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
  </div>
  <div class="key"><def:ValueSetLabel ID="ValueSetLabel_GMS_ITEM_30" runat="server"  DatabaseField="GMS_ITEM_30"></def:ValueSetLabel></div>
</div>
<div class="collection">
  <div class="main">
    <def:datafieldcontrol runat="server" id="GMS_ITEM_35" DatabaseField="GMS_ITEM_35" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
  </div>
  <div class="key"><def:ValueSetLabel ID="ValueSetLabel_GMS_ITEM_35" runat="server"  DatabaseField="GMS_ITEM_35"></def:ValueSetLabel></div>
</div>
<div class="collection">
  <div class="main">
    <def:datafieldcontrol runat="server" id="GMS_ITEM_36" DatabaseField="GMS_ITEM_36" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="GMS_ITEM_37" DatabaseField="GMS_ITEM_37" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="GMS_ITEM_38" DatabaseField="GMS_ITEM_38" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="GMS_ITEM_39" DatabaseField="GMS_ITEM_39" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
  </div>
  <div class="key"><def:ValueSetLabel ID="ValueSetLabel_GMS_ITEM_36" runat="server"  DatabaseField="GMS_ITEM_36"></def:ValueSetLabel></div>
</div>
<div class="collection">
  <div class="main">
    <def:datafieldcontrol runat="server" id="GMS_ITEM_40" DatabaseField="GMS_ITEM_40" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
  </div>
  <div class="key"><def:ValueSetLabel ID="ValueSetLabel_GMS_ITEM_40" runat="server"  DatabaseField="GMS_ITEM_40"></def:ValueSetLabel></div>
</div>
<h4><a name="fms">Fine motor</a></h4>
<div class="collection">
  <div class="main">
<def:datafieldcontrol runat="server" id="FMS_ITEM_1" DatabaseField="FMS_ITEM_1" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="FMS_ITEM_2" DatabaseField="FMS_ITEM_2" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="FMS_ITEM_3" DatabaseField="FMS_ITEM_3" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="FMS_ITEM_4" DatabaseField="FMS_ITEM_4" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="FMS_ITEM_5" DatabaseField="FMS_ITEM_5" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="FMS_ITEM_6" DatabaseField="FMS_ITEM_6" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="FMS_ITEM_7" DatabaseField="FMS_ITEM_7" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="FMS_ITEM_8" DatabaseField="FMS_ITEM_8" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="FMS_ITEM_9" DatabaseField="FMS_ITEM_9" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="FMS_ITEM_10" DatabaseField="FMS_ITEM_10" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
  </div>
  <div class="key"><def:ValueSetLabel ID="ValueSetLabel_FMS_ITEM_1" runat="server"  DatabaseField="FMS_ITEM_1"></def:ValueSetLabel></div>
</div>
<div class="collection">
  <div class="main">
<def:datafieldcontrol runat="server" id="FMS_ITEM_11" DatabaseField="FMS_ITEM_11" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="FMS_ITEM_12" DatabaseField="FMS_ITEM_12" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="FMS_ITEM_13" DatabaseField="FMS_ITEM_13" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="FMS_ITEM_14" DatabaseField="FMS_ITEM_14" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="FMS_ITEM_15" DatabaseField="FMS_ITEM_15" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="FMS_ITEM_16" DatabaseField="FMS_ITEM_16" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="FMS_ITEM_17" DatabaseField="FMS_ITEM_17" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="FMS_ITEM_18" DatabaseField="FMS_ITEM_18" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="FMS_ITEM_19" DatabaseField="FMS_ITEM_19" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="FMS_ITEM_20" DatabaseField="FMS_ITEM_20" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
  </div>
  <div class="key"><def:ValueSetLabel ID="ValueSetLabel_FMS_ITEM_11" runat="server"  DatabaseField="FMS_ITEM_11"></def:ValueSetLabel></div>
</div>
<div class="collection">
  <div class="main">
<def:datafieldcontrol runat="server" id="FMS_ITEM_21" DatabaseField="FMS_ITEM_21" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="FMS_ITEM_22" DatabaseField="FMS_ITEM_22" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="FMS_ITEM_23" DatabaseField="FMS_ITEM_23" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="FMS_ITEM_24" DatabaseField="FMS_ITEM_24" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="FMS_ITEM_25" DatabaseField="FMS_ITEM_25" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="FMS_ITEM_26" DatabaseField="FMS_ITEM_26" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="FMS_ITEM_27" DatabaseField="FMS_ITEM_27" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="FMS_ITEM_28" DatabaseField="FMS_ITEM_28" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="FMS_ITEM_29" DatabaseField="FMS_ITEM_29" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="FMS_ITEM_30" DatabaseField="FMS_ITEM_30" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="FMS_ITEM_31" DatabaseField="FMS_ITEM_31" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
  </div>
  <div class="key"><def:ValueSetLabel ID="ValueSetLabel_FMS_ITEM_21" runat="server"  DatabaseField="FMS_ITEM_21"></def:ValueSetLabel></div>
</div>
<div class="collection">
  <div class="main">
<def:datafieldcontrol runat="server" id="FMS_ITEM_32" DatabaseField="FMS_ITEM_32" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="FMS_ITEM_33" DatabaseField="FMS_ITEM_33" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="FMS_ITEM_34" DatabaseField="FMS_ITEM_34" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="FMS_ITEM_35" DatabaseField="FMS_ITEM_35" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="FMS_ITEM_36" DatabaseField="FMS_ITEM_36" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
  </div>
  <div class="key"><def:ValueSetLabel ID="ValueSetLabel_FMS_ITEM_32" runat="server"  DatabaseField="FMS_ITEM_32"></def:ValueSetLabel></div>
</div>

<!-- Support for jump links outside tab flow: 25 rows -->
        </td>
        <td style="vertical-align:top; padding-left:15px">
            <a href="#raw">Jump to raw scores</a>
            <img src="./spacer.png" height="500" width="1" border="0" alt="" />
        </td>
    </tr>
    <tr>
        <td style="vertical-align:top; padding-left:15px">
            <a href="#raw">Jump to raw scores</a>
            <img src="./spacer.png" height="500" width="1" border="0" alt="" />
        </td>
    </tr>
    <tr>
        <td style="vertical-align:top; padding-left:15px">
            <a href="#raw">Jump to raw scores</a>
            <img src="./spacer.png" height="500" width="1" border="0" alt="" />
        </td>
    </tr>
    <tr>
        <td style="vertical-align:top; padding-left:15px">
            <a href="#raw">Jump to raw scores</a>
            <img src="./spacer.png" height="500" width="1" border="0" alt="" />
        </td>
    </tr>
    <tr>
        <td style="vertical-align:top; padding-left:15px">
            <a href="#raw">Jump to raw scores</a>
            <img src="./spacer.png" height="500" width="1" border="0" alt="" />
        </td>
    </tr>
    <tr>
        <td style="vertical-align:top; padding-left:15px">
            <a href="#raw">Jump to raw scores</a>
            <img src="./spacer.png" height="500" width="1" border="0" alt="" />
        </td>
    </tr>
    <tr>
        <td style="vertical-align:top; padding-left:15px">
            <a href="#raw">Jump to raw scores</a>
            <img src="./spacer.png" height="500" width="1" border="0" alt="" />
        </td>
    </tr>
    <tr>
        <td style="vertical-align:top; padding-left:15px">
            <a href="#raw">Jump to raw scores</a>
            <img src="./spacer.png" height="500" width="1" border="0" alt="" />
        </td>
    </tr>
    <tr>
        <td style="vertical-align:top; padding-left:15px">
            <a href="#raw">Jump to raw scores</a>
            <img src="./spacer.png" height="500" width="1" border="0" alt="" />
        </td>
    </tr>
    <tr>
        <td style="vertical-align:top; padding-left:15px">
            <a href="#raw">Jump to raw scores</a>
            <img src="./spacer.png" height="500" width="1" border="0" alt="" />
        </td>
    </tr>
    <tr>
        <td style="vertical-align:top; padding-left:15px">
            <a href="#raw">Jump to raw scores</a>
            <img src="./spacer.png" height="500" width="1" border="0" alt="" />
        </td>
    </tr>
    <tr>
        <td style="vertical-align:top; padding-left:15px">
            <a href="#raw">Jump to raw scores</a>
            <img src="./spacer.png" height="500" width="1" border="0" alt="" />
        </td>
    </tr>
    <tr>
        <td style="vertical-align:top; padding-left:15px">
            <a href="#raw">Jump to raw scores</a>
            <img src="./spacer.png" height="500" width="1" border="0" alt="" />
        </td>
    </tr>
    <tr>
        <td style="vertical-align:top; padding-left:15px">
            <a href="#raw">Jump to raw scores</a>
            <img src="./spacer.png" height="500" width="1" border="0" alt="" />
        </td>
    </tr>
    <tr>
        <td style="vertical-align:top; padding-left:15px">
            <a href="#raw">Jump to raw scores</a>
            <img src="./spacer.png" height="500" width="1" border="0" alt="" />
        </td>
    </tr>
    <tr>
        <td style="vertical-align:top; padding-left:15px">
            <a href="#raw">Jump to raw scores</a>
            <img src="./spacer.png" height="500" width="1" border="0" alt="" />
        </td>
    </tr>
    <tr>
        <td style="vertical-align:top; padding-left:15px">
            <a href="#raw">Jump to raw scores</a>
            <img src="./spacer.png" height="500" width="1" border="0" alt="" />
        </td>
    </tr>
    <tr>
        <td style="vertical-align:top; padding-left:15px">
            <a href="#raw">Jump to raw scores</a>
            <img src="./spacer.png" height="500" width="1" border="0" alt="" />
        </td>
    </tr>
    <tr>
        <td style="vertical-align:top; padding-left:15px">
            <a href="#raw">Jump to raw scores</a>
            <img src="./spacer.png" height="500" width="1" border="0" alt="" />
        </td>
    </tr>
    <tr>
        <td style="vertical-align:top; padding-left:15px">
            <a href="#raw">Jump to raw scores</a>
            <img src="./spacer.png" height="500" width="1" border="0" alt="" />
        </td>
    </tr>
    <tr>
        <td style="vertical-align:top; padding-left:15px">
            <a href="#raw">Jump to raw scores</a>
            <img src="./spacer.png" height="500" width="1" border="0" alt="" />
        </td>
    </tr>
    <tr>
        <td style="vertical-align:top; padding-left:15px">
            <a href="#raw">Jump to raw scores</a>
            <img src="./spacer.png" height="500" width="1" border="0" alt="" />
        </td>
    </tr>
    <tr>
        <td style="vertical-align:top; padding-left:15px">
            <a href="#raw">Jump to raw scores</a>
            <img src="./spacer.png" height="500" width="1" border="0" alt="" />
        </td>
    </tr>
    <tr>
        <td style="vertical-align:top; padding-left:15px">
            <a href="#raw">Jump to raw scores</a>
            <img src="./spacer.png" height="500" width="1" border="0" alt="" />
        </td>
    </tr>
    <tr>
        <td style="vertical-align:top; padding-left:15px">
            <a href="#raw">Jump to raw scores</a>
            <img src="./spacer.png" height="500" width="1" border="0" alt="" />
        </td>
    </tr>

</table>












<div class="main">
<br/>
<br/>
  <def:datafieldcontrol runat="server" id="created" DatabaseField="created" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="300px"></def:datafieldcontrol>
  <def:datafieldcontrol runat="server" id="createdBy" DatabaseField="createdBy" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="300px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="50"></def:datafieldcontrol>
  <def:datafieldcontrol runat="server" id="updated" DatabaseField="updated" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="300px"></def:datafieldcontrol>
  <def:datafieldcontrol runat="server" id="updatedBy" DatabaseField="updatedBy" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="300px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="50"></def:datafieldcontrol>
  <def:datafieldcontrol runat="server" id="scored" DatabaseField="scored" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="300px"></def:datafieldcontrol>
  <def:datafieldcontrol runat="server" id="scoredBy" DatabaseField="scoredBy" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="300px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="50"></def:datafieldcontrol>
</div>





</asp:panel>
</asp:Content>
