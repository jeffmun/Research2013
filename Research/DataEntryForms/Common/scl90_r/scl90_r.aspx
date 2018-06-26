

<%@ Register TagPrefix="def" Namespace="DataEntryFramework3" %> 
<%@ Page language="c#" MasterPageFile="~/UWAC.master"  Title="SCL90_R Data Entry" %>
<asp:Content ID="Content1" ContentPlaceHolderID="oBodyPlaceHolder" runat="server">

<def:dataentrycontroller id="DataEntryController1" runat="server" DatabaseTable="ALL_SCL90_R" PrimaryKeyField="scl90_pk">
</def:dataentrycontroller>

<def:datafieldcontrol runat="server" id="id" DatabaseField="id" IsInsertField="true" FieldLabelWidth="100px" FieldTextBoxWidth="100px" FieldTextBoxMaxLength="15"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="indexnum" DatabaseField="indexnum" IsInsertField="true" FieldTextBoxTextDefault="1" FieldLabelWidth="100px" FieldTextBoxWidth="40px"></def:datafieldcontrol>



<asp:panel id="mainPanel" CssClass="mainPanel" runat="server">
<div class="main">
<def:datafieldcontrol runat="server" id="scl90_Date" DatabaseField="scl90_Date" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="scl90_resp" DatabaseField="scl90_resp" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="scl90_respt" DatabaseField="scl90_respt" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="300px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="50"></def:datafieldcontrol>
<br/><font color="blue">
<def:ValueSetLabel ID="ValueSetLabel_scl90_sex" runat="server"  DatabaseField="scl90_sex"></def:ValueSetLabel>
 </font>
<def:datafieldcontrol runat="server" id="scl90_sex" DatabaseField="scl90_sex" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="scl90_agemos" DatabaseField="scl90_agemos" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
</div>
 

<div class="main">
<br/>
<br/>
<table>
<tr><td><b>Scores</b></td></tr>
<tr><td></td><td><u>Subscales</u></td><td><u>Raw score</u></td><td><u>T score</u></td></tr>

<tr><td>SOM</td><td>Somatization </td><td><def:datafieldcontrol runat="server" id="scl90_raw_SOM"  DatabaseField="scl90_raw_SOM"  IsReadOnly="true" RenderReadOnlyAsDiv="true" ShowFieldLabel="false" FieldTextBoxWidth="40px"></def:datafieldcontrol></td><td><def:datafieldcontrol runat="server" id="scl90_T_SOM"    DatabaseField="scl90_T_SOM"    IsReadOnly="true" RenderReadOnlyAsDiv="true" ShowFieldLabel="false" FieldTextBoxWidth="40px"></def:datafieldcontrol></td></tr>
<tr><td>OC</td><td>Obsessive-Compulsive </td><td><def:datafieldcontrol runat="server" id="scl90_raw_OC"   DatabaseField="scl90_raw_OC"   IsReadOnly="true" RenderReadOnlyAsDiv="true" ShowFieldLabel="false" FieldTextBoxWidth="40px"></def:datafieldcontrol></td><td><def:datafieldcontrol runat="server" id="scl90_T_OC"     DatabaseField="scl90_T_OC"     IsReadOnly="true" RenderReadOnlyAsDiv="true" ShowFieldLabel="false" FieldTextBoxWidth="40px"></def:datafieldcontrol></td></tr>
<tr><td>IS</td><td>Interpersonal Sensitivity </td><td><def:datafieldcontrol runat="server" id="scl90_raw_IS"   DatabaseField="scl90_raw_IS"   IsReadOnly="true" RenderReadOnlyAsDiv="true" ShowFieldLabel="false" FieldTextBoxWidth="40px"></def:datafieldcontrol></td><td><def:datafieldcontrol runat="server" id="scl90_T_IS"     DatabaseField="scl90_T_IS"     IsReadOnly="true" RenderReadOnlyAsDiv="true" ShowFieldLabel="false" FieldTextBoxWidth="40px"></def:datafieldcontrol></td></tr>
<tr><td>DEP</td><td>Depression </td><td><def:datafieldcontrol runat="server" id="scl90_raw_DEP"  DatabaseField="scl90_raw_DEP"  IsReadOnly="true" RenderReadOnlyAsDiv="true" ShowFieldLabel="false" FieldTextBoxWidth="40px"></def:datafieldcontrol></td><td><def:datafieldcontrol runat="server" id="scl90_T_DEP"    DatabaseField="scl90_T_DEP"    IsReadOnly="true" RenderReadOnlyAsDiv="true" ShowFieldLabel="false" FieldTextBoxWidth="40px"></def:datafieldcontrol></td></tr>
<tr><td>ANX</td><td>Anxiety </td><td><def:datafieldcontrol runat="server" id="scl90_raw_ANX"  DatabaseField="scl90_raw_ANX"  IsReadOnly="true" RenderReadOnlyAsDiv="true" ShowFieldLabel="false" FieldTextBoxWidth="40px"></def:datafieldcontrol></td><td><def:datafieldcontrol runat="server" id="scl90_T_ANX"    DatabaseField="scl90_T_ANX"    IsReadOnly="true" RenderReadOnlyAsDiv="true" ShowFieldLabel="false" FieldTextBoxWidth="40px"></def:datafieldcontrol></td></tr>
<tr><td>HOS</td><td>Hostility </td><td><def:datafieldcontrol runat="server" id="scl90_raw_HOS"  DatabaseField="scl90_raw_HOS"  IsReadOnly="true" RenderReadOnlyAsDiv="true" ShowFieldLabel="false" FieldTextBoxWidth="40px"></def:datafieldcontrol></td><td><def:datafieldcontrol runat="server" id="scl90_T_HOS"    DatabaseField="scl90_T_HOS"    IsReadOnly="true" RenderReadOnlyAsDiv="true" ShowFieldLabel="false" FieldTextBoxWidth="40px"></def:datafieldcontrol></td></tr>
<tr><td>PHO</td><td>Phobic Anxiety </td><td><def:datafieldcontrol runat="server" id="scl90_raw_PHOB" DatabaseField="scl90_raw_PHOB" IsReadOnly="true" RenderReadOnlyAsDiv="true" ShowFieldLabel="false" FieldTextBoxWidth="40px"></def:datafieldcontrol></td><td><def:datafieldcontrol runat="server" id="scl90_T_PHOB"   DatabaseField="scl90_T_PHOB"   IsReadOnly="true" RenderReadOnlyAsDiv="true" ShowFieldLabel="false" FieldTextBoxWidth="40px"></def:datafieldcontrol></td></tr>
<tr><td>PAR</td><td>Paranoid Ideation </td><td><def:datafieldcontrol runat="server" id="scl90_raw_PAR"  DatabaseField="scl90_raw_PAR"  IsReadOnly="true" RenderReadOnlyAsDiv="true" ShowFieldLabel="false" FieldTextBoxWidth="40px"></def:datafieldcontrol></td><td><def:datafieldcontrol runat="server" id="scl90_T_PAR"    DatabaseField="scl90_T_PAR"    IsReadOnly="true" RenderReadOnlyAsDiv="true" ShowFieldLabel="false" FieldTextBoxWidth="40px"></def:datafieldcontrol></td></tr>
<tr><td>PSY</td><td>Psychoticism </td><td><def:datafieldcontrol runat="server" id="scl90_raw_PSY"  DatabaseField="scl90_raw_PSY"  IsReadOnly="true" RenderReadOnlyAsDiv="true" ShowFieldLabel="false" FieldTextBoxWidth="40px"></def:datafieldcontrol></td><td><def:datafieldcontrol runat="server" id="scl90_T_PSY"    DatabaseField="scl90_T_PSY"    IsReadOnly="true" RenderReadOnlyAsDiv="true" ShowFieldLabel="false" FieldTextBoxWidth="40px"></def:datafieldcontrol></td></tr>
<tr><td></td><td><u>Index scales</u></td><td><u>Raw score</u></td><td><u>T score</u></td></tr>
<tr><td>GSI</td><td>Global Severity Index </td><td><def:datafieldcontrol runat="server" id="scl90_raw_GSI"  DatabaseField="scl90_raw_GSI"  IsReadOnly="true" RenderReadOnlyAsDiv="true" ShowFieldLabel="false" FieldTextBoxWidth="40px"></def:datafieldcontrol></td><td><def:datafieldcontrol runat="server" id="scl90_T_GSI"    DatabaseField="scl90_T_GSI"    IsReadOnly="true" RenderReadOnlyAsDiv="true" ShowFieldLabel="false" FieldTextBoxWidth="40px"></def:datafieldcontrol></td></tr>
<tr><td>PSDI</td><td>Positive Symptom Distress Index </td><td><def:datafieldcontrol runat="server" id="scl90_raw_PSDI" DatabaseField="scl90_raw_PSDI" IsReadOnly="true" RenderReadOnlyAsDiv="true" ShowFieldLabel="false" FieldTextBoxWidth="40px"></def:datafieldcontrol></td><td><def:datafieldcontrol runat="server" id="scl90_T_PSDI"   DatabaseField="scl90_T_PSDI"   IsReadOnly="true" RenderReadOnlyAsDiv="true" ShowFieldLabel="false" FieldTextBoxWidth="40px"></def:datafieldcontrol></td></tr>
<tr><td>PST</td><td>Positive Symptom Total </td><td><def:datafieldcontrol runat="server" id="scl90_raw_PST"  DatabaseField="scl90_raw_PST"  IsReadOnly="true" RenderReadOnlyAsDiv="true" ShowFieldLabel="false" FieldTextBoxWidth="40px"></def:datafieldcontrol></td><td><def:datafieldcontrol runat="server" id="scl90_T_PST"    DatabaseField="scl90_T_PST"    IsReadOnly="true" RenderReadOnlyAsDiv="true" ShowFieldLabel="false" FieldTextBoxWidth="40px"></def:datafieldcontrol></td></tr>

</table>


<br/><font color="darkred">
<def:datafieldcontrol runat="server" id="scl90_scrmsg" DatabaseField="scl90_scrmsg"  IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="220px" FieldTextBoxWidth="400px" FieldTextBoxHeight="40px" FieldTextBoxTextMode="multiline" FieldTextBoxMaxLength="250"></def:datafieldcontrol>
</font>
</div>

<div class="main">
<br/>
<br/><font color="blue">
<def:ValueSetLabel ID="ValueSetLabel_scl90_01" runat="server"  DatabaseField="scl90_01"></def:ValueSetLabel>
 </font>
<def:datafieldcontrol runat="server" id="scl90_01" DatabaseField="scl90_01" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="scl90_02" DatabaseField="scl90_02" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="scl90_03" DatabaseField="scl90_03" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="scl90_04" DatabaseField="scl90_04" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="scl90_05" DatabaseField="scl90_05" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="scl90_06" DatabaseField="scl90_06" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="scl90_07" DatabaseField="scl90_07" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="scl90_08" DatabaseField="scl90_08" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="scl90_09" DatabaseField="scl90_09" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="scl90_10" DatabaseField="scl90_10" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="scl90_11" DatabaseField="scl90_11" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="scl90_12" DatabaseField="scl90_12" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="scl90_13" DatabaseField="scl90_13" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="scl90_14" DatabaseField="scl90_14" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="scl90_15" DatabaseField="scl90_15" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="scl90_16" DatabaseField="scl90_16" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="scl90_17" DatabaseField="scl90_17" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="scl90_18" DatabaseField="scl90_18" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="scl90_19" DatabaseField="scl90_19" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="scl90_20" DatabaseField="scl90_20" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="scl90_21" DatabaseField="scl90_21" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="scl90_22" DatabaseField="scl90_22" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="scl90_23" DatabaseField="scl90_23" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="scl90_24" DatabaseField="scl90_24" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="scl90_25" DatabaseField="scl90_25" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="scl90_26" DatabaseField="scl90_26" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="scl90_27" DatabaseField="scl90_27" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="scl90_28" DatabaseField="scl90_28" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="scl90_29" DatabaseField="scl90_29" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="scl90_30" DatabaseField="scl90_30" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>

<br/><font color="blue">
<def:ValueSetLabel ID="ValueSetLabel_scl90_31" runat="server"  DatabaseField="scl90_31"></def:ValueSetLabel>
</font>
<def:datafieldcontrol runat="server" id="scl90_31" DatabaseField="scl90_31" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="scl90_32" DatabaseField="scl90_32" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="scl90_33" DatabaseField="scl90_33" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="scl90_34" DatabaseField="scl90_34" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="scl90_35" DatabaseField="scl90_35" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="scl90_36" DatabaseField="scl90_36" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="scl90_37" DatabaseField="scl90_37" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="scl90_38" DatabaseField="scl90_38" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="scl90_39" DatabaseField="scl90_39" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="scl90_40" DatabaseField="scl90_40" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="scl90_41" DatabaseField="scl90_41" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="scl90_42" DatabaseField="scl90_42" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="scl90_43" DatabaseField="scl90_43" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="scl90_44" DatabaseField="scl90_44" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="scl90_45" DatabaseField="scl90_45" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="scl90_46" DatabaseField="scl90_46" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="scl90_47" DatabaseField="scl90_47" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="scl90_48" DatabaseField="scl90_48" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="scl90_49" DatabaseField="scl90_49" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="scl90_50" DatabaseField="scl90_50" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="scl90_51" DatabaseField="scl90_51" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="scl90_52" DatabaseField="scl90_52" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="scl90_53" DatabaseField="scl90_53" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="scl90_54" DatabaseField="scl90_54" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="scl90_55" DatabaseField="scl90_55" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="scl90_56" DatabaseField="scl90_56" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="scl90_57" DatabaseField="scl90_57" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="scl90_58" DatabaseField="scl90_58" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="scl90_59" DatabaseField="scl90_59" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="scl90_60" DatabaseField="scl90_60" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>

<br/><font color="blue">
<def:ValueSetLabel ID="ValueSetLabel_scl90_61" runat="server"  DatabaseField="scl90_61"></def:ValueSetLabel>
</font>

<def:datafieldcontrol runat="server" id="scl90_61" DatabaseField="scl90_61" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="scl90_62" DatabaseField="scl90_62" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="scl90_63" DatabaseField="scl90_63" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="scl90_64" DatabaseField="scl90_64" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="scl90_65" DatabaseField="scl90_65" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="scl90_66" DatabaseField="scl90_66" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="scl90_67" DatabaseField="scl90_67" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="scl90_68" DatabaseField="scl90_68" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="scl90_69" DatabaseField="scl90_69" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="scl90_70" DatabaseField="scl90_70" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="scl90_71" DatabaseField="scl90_71" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="scl90_72" DatabaseField="scl90_72" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="scl90_73" DatabaseField="scl90_73" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="scl90_74" DatabaseField="scl90_74" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="scl90_75" DatabaseField="scl90_75" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="scl90_76" DatabaseField="scl90_76" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="scl90_77" DatabaseField="scl90_77" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="scl90_78" DatabaseField="scl90_78" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="scl90_79" DatabaseField="scl90_79" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="scl90_80" DatabaseField="scl90_80" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="scl90_81" DatabaseField="scl90_81" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="scl90_82" DatabaseField="scl90_82" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="scl90_83" DatabaseField="scl90_83" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="scl90_84" DatabaseField="scl90_84" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="scl90_85" DatabaseField="scl90_85" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="scl90_86" DatabaseField="scl90_86" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="scl90_87" DatabaseField="scl90_87" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="scl90_88" DatabaseField="scl90_88" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="scl90_89" DatabaseField="scl90_89" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="scl90_90" DatabaseField="scl90_90" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>

</div>

<div class="main">

<br/>
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

