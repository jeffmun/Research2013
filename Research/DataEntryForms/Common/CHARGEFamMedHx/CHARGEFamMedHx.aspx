<%@ Register TagPrefix="def" Namespace="DataEntryFramework3" %> 
<%@ Page language="c#" MasterPageFile="~/UWAC.master"  Title="Modified CHARGE Family MedHx Data Entry" %>
<asp:Content ID="Content1" ContentPlaceHolderID="oBodyPlaceHolder" runat="server">

<def:dataentrycontroller id="DataEntryController1" runat="server" DatabaseTable="ALL_CHARGE_FamMedHx_Mod" >
</def:dataentrycontroller>
<div class="main">
    <def:datafieldcontrol runat="server" id="id" DatabaseField="id" IsInsertField="true" FieldLabelWidth="150px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="15"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="indexnum" DatabaseField="indexnum" IsInsertField="true" FieldTextBoxTextDefault="1" FieldLabelWidth="150px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="CFMH_interview_date" DatabaseField="CFMH_interview_date" IsInsertField="true" FieldLabelText="Interview Date" FieldLabelWidth="150px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="CFMH_interview_age" DatabaseField="CFMH_interview_age" IsInsertField="true" FieldLabelText="Age at Interview" FieldLabelWidth="150px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="CFMH_interviewer" DatabaseField="CFMH_interviewer" IsInsertField="true" FieldLabelText="Interviewer" FieldLabelWidth="150px" FieldTextBoxMaxLength="20"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="CFMH_respondent" DatabaseField="CFMH_respondent" IsInsertField="true" FieldLabelText="Respondent" FieldLabelWidth="150px" FieldTextBoxMaxLength="20"></def:datafieldcontrol>
</div>
<asp:panel id="mainPanel" CssClass="mainPanel" runat="server">
<div class="collection">
  <div class="main"><def:datafieldcontrol runat="server" id="Charge_familymedhist_Header_1" DatabaseField="Charge_familymedhist_Header_1" IsEntryField="true" IsDoubleEntryField="false" FieldLabelText="Relationship to Subject" FieldLabelWidth="250px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
  <div class="key"><def:ValueSetLabel ID="ValueSetLabel_Charge_familymedhist_Header_1" runat="server"  DatabaseField="Charge_familymedhist_Header_1"></def:ValueSetLabel></div>
</div>
<div class="main"><def:datafieldcontrol runat="server" id="Charge_familymedhist_Header_2" DatabaseField="Charge_familymedhist_Header_2" IsEntryField="true" IsDoubleEntryField="false" FieldLabelText="Specify Relationship to Subject, if Other:" FieldLabelWidth="250px" FieldTextBoxMaxLength="50"></def:datafieldcontrol></div>
<div class="main"><def:datafieldcontrol runat="server" id="CFMH_comments_misc" DatabaseField="CFMH_comments_misc" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="300px" FieldTextBoxWidth="400px" FieldTextBoxHeight="40px" FieldTextBoxTextMode="multiline" FieldTextBoxMaxLength="255"></def:datafieldcontrol></div>
<br />
<table width=95% align="center" cellpadding="5" cellspacing="0" border="1">
<tr id="alle">
    <td>Condition</td>
    <td>Child</td>
    <td colspan="3" align="center">Biological Mother</td>
    <td>Biological Father</td>
    <td>Siblings, Aunts, Uncles and Grandparents</td>
</tr>
<tr>
    <td>&nbsp;</td>
    <td><def:ValueSetLabel ID="ValueSetLabel_Charge_familymedhist_child_foodallergy" runat="server"  DatabaseField="Charge_familymedhist_child_foodallergy"></def:ValueSetLabel></td>
    <td><def:ValueSetLabel ID="ValueSetLabel_Charge_familymedhist_mother_foodallergy" runat="server"  DatabaseField="Charge_familymedhist_mother_foodallergy"></def:ValueSetLabel></td>
    <td>Onset Age</td>
    <td>During pregnancy?<br />
    <def:ValueSetLabel ID="ValueSetLabel_Charge_familymedhist_mother_foodallergy_preg" runat="server"  DatabaseField="Charge_familymedhist_mother_foodallergy_preg"></def:ValueSetLabel></td>
    <td><def:ValueSetLabel ID="ValueSetLabel_Charge_familymedhist_father_foodallergy" runat="server"  DatabaseField="Charge_familymedhist_father_foodallergy"></def:ValueSetLabel></td>
    <td><def:ValueSetLabel ID="ValueSetLabel_Charge_familymedhist_othmem_foodallergy" runat="server"  DatabaseField="Charge_familymedhist_othmem_foodallergy"></def:ValueSetLabel>
    If Yes, indicate Family Member Code</td>
</tr>
<tr>
    <td colspan="2">ALLERGIES</td>
    <td colspan="5" align="right"><a href="#aspnetForm">Top</a>|<a href="#alle">Allergies</a>|<a href="#auti">Autism</a>|<a href="#neur">Neuro</a>|<a href="#sens">Sensory</a>|<a href="#ment">Mental</a>|<a href="#othe">Other</a>|<a href="#code">Codes</a></td>
</tr>
<tr>
    <td>1. Food Allergy (specify type)</td>
    <td>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_child_foodallergy" DatabaseField="Charge_familymedhist_child_foodallergy" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxTextDefault="0" FieldTextBoxWidth="40px" FieldTextBoxMaxLength="10"></def:datafieldcontrol>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_child_foodallergy_cmt" DatabaseField="Charge_familymedhist_child_foodallergy_cmt" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxMaxLength="255"></def:datafieldcontrol>
    </td>
    <td>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_mother_foodallergy" DatabaseField="Charge_familymedhist_mother_foodallergy" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxTextDefault="0" FieldTextBoxWidth="40px" FieldTextBoxMaxLength="10"></def:datafieldcontrol>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_mother_foodallergy_cmt" DatabaseField="Charge_familymedhist_mother_foodallergy_cmt" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxMaxLength="255"></def:datafieldcontrol>
    </td>
    <td>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_mother_foodallergy_age" DatabaseField="Charge_familymedhist_mother_foodallergy_age" FieldTextBoxTextDefault="-9" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    </td>
    <td>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_mother_foodallergy_preg" DatabaseField="Charge_familymedhist_mother_foodallergy_preg" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxTextDefault="0" FieldTextBoxWidth="40px" FieldTextBoxMaxLength="10"></def:datafieldcontrol>
    </td>
    <td>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_father_foodallergy" DatabaseField="Charge_familymedhist_father_foodallergy" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxTextDefault="0" FieldTextBoxWidth="40px" FieldTextBoxMaxLength="10"></def:datafieldcontrol>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_father_foodallergy_cmt" DatabaseField="Charge_familymedhist_father_foodallergy_cmt" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxMaxLength="255"></def:datafieldcontrol>
    </td>
    <td>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_othmem_foodallergy" DatabaseField="Charge_familymedhist_othmem_foodallergy" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxTextDefault="0" FieldTextBoxWidth="40px" FieldTextBoxMaxLength="10"></def:datafieldcontrol>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_othmem_foodallergy_cmt" DatabaseField="Charge_familymedhist_othmem_foodallergy_cmt" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="60px" FieldTextBoxMaxLength="255"></def:datafieldcontrol>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_othmem_foodallergy_type" DatabaseField="Charge_familymedhist_othmem_foodallergy_type" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="60px" FieldTextBoxMaxLength="100"></def:datafieldcontrol>
    </td>
</tr>
<tr>
    <td>2. Skin Allergy (specify type)</td>
    <td>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_child_skinallergy" DatabaseField="Charge_familymedhist_child_skinallergy" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxTextDefault="0" FieldTextBoxWidth="40px" FieldTextBoxMaxLength="10"></def:datafieldcontrol>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_child_allergy_skinallergy_cmt" DatabaseField="Charge_familymedhist_child_allergy_skinallergy_cmt" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxMaxLength="255"></def:datafieldcontrol>
    </td>
    <td>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_mother_skinallergy" DatabaseField="Charge_familymedhist_mother_skinallergy" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxTextDefault="0" FieldTextBoxWidth="40px" FieldTextBoxMaxLength="10"></def:datafieldcontrol>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_mother_skinallergy_cmt" DatabaseField="Charge_familymedhist_mother_skinallergy_cmt" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxMaxLength="255"></def:datafieldcontrol>
    </td>
    <td>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_mother_skinallergy_age" DatabaseField="Charge_familymedhist_mother_skinallergy_age" FieldTextBoxTextDefault="-9" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    </td>
    <td>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_mother_skinallergy_preg" DatabaseField="Charge_familymedhist_mother_skinallergy_preg" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxTextDefault="0" FieldTextBoxWidth="40px" FieldTextBoxMaxLength="10"></def:datafieldcontrol>
    </td>
    <td>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_father_skinallergy" DatabaseField="Charge_familymedhist_father_skinallergy" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxTextDefault="0" FieldTextBoxWidth="40px" FieldTextBoxMaxLength="10"></def:datafieldcontrol>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_father_skinallergy_cmt" DatabaseField="Charge_familymedhist_father_skinallergy_cmt" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxMaxLength="255"></def:datafieldcontrol>
    </td>
    <td>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_othmem_skinallergy" DatabaseField="Charge_familymedhist_othmem_skinallergy" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxTextDefault="0" FieldTextBoxWidth="40px" FieldTextBoxMaxLength="10"></def:datafieldcontrol>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_othmem_skinallergy_cmt" DatabaseField="Charge_familymedhist_othmem_skinallergy_cmt" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="60px" FieldTextBoxMaxLength="255"></def:datafieldcontrol>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_othmem_skinallergy_type" DatabaseField="Charge_familymedhist_othmem_skinallergy_type" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="60px" FieldTextBoxMaxLength="100"></def:datafieldcontrol>
    </td>
</tr>
<tr>
    <td>3. Eczema</td>
    <td>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_child_eczema" DatabaseField="Charge_familymedhist_child_eczema" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxTextDefault="0" FieldTextBoxWidth="40px" FieldTextBoxMaxLength="10"></def:datafieldcontrol>
    </td>
    <td>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_mother_eczema" DatabaseField="Charge_familymedhist_mother_eczema" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxTextDefault="0" FieldTextBoxWidth="40px" FieldTextBoxMaxLength="10"></def:datafieldcontrol>
    </td>
    <td>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_mother_eczema_age" DatabaseField="Charge_familymedhist_mother_eczema_age" FieldTextBoxTextDefault="-9" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    </td>
    <td>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_mother_eczema_preg" DatabaseField="Charge_familymedhist_mother_eczema_preg" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxTextDefault="0" FieldTextBoxWidth="40px" FieldTextBoxMaxLength="10"></def:datafieldcontrol>
    </td>
    <td>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_father_eczema" DatabaseField="Charge_familymedhist_father_eczema" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxTextDefault="0" FieldTextBoxWidth="40px" FieldTextBoxMaxLength="10"></def:datafieldcontrol>
    </td>
    <td>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_othmem_eczema" DatabaseField="Charge_familymedhist_othmem_eczema" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxTextDefault="0" FieldTextBoxWidth="40px" FieldTextBoxMaxLength="10"></def:datafieldcontrol>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_othmem_eczema_type" DatabaseField="Charge_familymedhist_othmem_eczema_type" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="60px" FieldTextBoxMaxLength="100"></def:datafieldcontrol>
    </td>
</tr>
<tr>
    <td>4. Environmental (specify type)</td>
    <td>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_child_envallergy" DatabaseField="Charge_familymedhist_child_envallergy" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxTextDefault="0" FieldTextBoxWidth="40px" FieldTextBoxMaxLength="10"></def:datafieldcontrol>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_child_envallergy_cmt" DatabaseField="Charge_familymedhist_child_envallergy_cmt" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxMaxLength="255"></def:datafieldcontrol>
    </td>
    <td>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_mother_envallergy" DatabaseField="Charge_familymedhist_mother_envallergy" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxTextDefault="0" FieldTextBoxWidth="40px" FieldTextBoxMaxLength="10"></def:datafieldcontrol>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_mother_envallergy_cmt" DatabaseField="Charge_familymedhist_mother_envallergy_cmt" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxMaxLength="255"></def:datafieldcontrol>
    </td>
    <td>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_mother_envallergy_age" DatabaseField="Charge_familymedhist_mother_envallergy_age" FieldTextBoxTextDefault="-9" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    </td>
    <td>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_mother_envallergy_preg" DatabaseField="Charge_familymedhist_mother_envallergy_preg" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxTextDefault="0" FieldTextBoxWidth="40px" FieldTextBoxMaxLength="10"></def:datafieldcontrol>
    </td>
    <td>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_father_envallergy" DatabaseField="Charge_familymedhist_father_envallergy" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxTextDefault="0" FieldTextBoxWidth="40px" FieldTextBoxMaxLength="10"></def:datafieldcontrol>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_father_envallergy_cmt" DatabaseField="Charge_familymedhist_father_envallergy_cmt" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxMaxLength="255"></def:datafieldcontrol>
    </td>
    <td>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_othmem_envallergy" DatabaseField="Charge_familymedhist_othmem_envallergy" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxTextDefault="0" FieldTextBoxWidth="40px" FieldTextBoxMaxLength="10"></def:datafieldcontrol>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_othmem_envallergy_cmt" DatabaseField="Charge_familymedhist_othmem_envallergy_cmt" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="60px" FieldTextBoxMaxLength="255"></def:datafieldcontrol>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_othmem_envallergy_type" DatabaseField="Charge_familymedhist_othmem_envallergy_type" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="60px" FieldTextBoxMaxLength="100"></def:datafieldcontrol>
    </td>
</tr>
<tr>
    <td>5. Medication (specify type)</td>
    <td>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_child_medallergy" DatabaseField="Charge_familymedhist_child_medallergy" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxTextDefault="0" FieldTextBoxWidth="40px" FieldTextBoxMaxLength="10"></def:datafieldcontrol>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_child_medallergy_cmt" DatabaseField="Charge_familymedhist_child_medallergy_cmt" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxMaxLength="255"></def:datafieldcontrol>
    </td>
    <td>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_mother_medallergy" DatabaseField="Charge_familymedhist_mother_medallergy" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxTextDefault="0" FieldTextBoxWidth="40px" FieldTextBoxMaxLength="10"></def:datafieldcontrol>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_mother_medallergy_cmt" DatabaseField="Charge_familymedhist_mother_medallergy_cmt" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxMaxLength="255"></def:datafieldcontrol>
    </td>
    <td>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_mother_medallergy_age" DatabaseField="Charge_familymedhist_mother_medallergy_age" FieldTextBoxTextDefault="-9" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    </td>
    <td>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_mother_medallergy_preg" DatabaseField="Charge_familymedhist_mother_medallergy_preg" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxTextDefault="0" FieldTextBoxWidth="40px" FieldTextBoxMaxLength="10"></def:datafieldcontrol>
    </td>
    <td>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_father_medallergy" DatabaseField="Charge_familymedhist_father_medallergy" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxTextDefault="0" FieldTextBoxWidth="40px" FieldTextBoxMaxLength="10"></def:datafieldcontrol>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_father_medallergy_cmt" DatabaseField="Charge_familymedhist_father_medallergy_cmt" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxMaxLength="255"></def:datafieldcontrol>
    </td>
    <td>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_othmem_medallergy" DatabaseField="Charge_familymedhist_othmem_medallergy" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxTextDefault="0" FieldTextBoxWidth="40px" FieldTextBoxMaxLength="10"></def:datafieldcontrol>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_othmem_medallergy_cmt" DatabaseField="Charge_familymedhist_othmem_medallergy_cmt" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="60px" FieldTextBoxMaxLength="255"></def:datafieldcontrol>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_othmem_medallergy_type" DatabaseField="Charge_familymedhist_othmem_medallergy_type" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="60px" FieldTextBoxMaxLength="100"></def:datafieldcontrol>
    </td>
</tr>
<tr>
    <td>6. Other Allergy (specify type)</td>
    <td>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_child_otherallergy" DatabaseField="Charge_familymedhist_child_otherallergy" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxTextDefault="0" FieldTextBoxWidth="40px" FieldTextBoxMaxLength="10"></def:datafieldcontrol>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_child_otherallergy_cmt" DatabaseField="Charge_familymedhist_child_otherallergy_cmt" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxMaxLength="255"></def:datafieldcontrol>
    </td>
    <td>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_mother_otherallergy" DatabaseField="Charge_familymedhist_mother_otherallergy" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxTextDefault="0" FieldTextBoxWidth="40px" FieldTextBoxMaxLength="10"></def:datafieldcontrol>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_mother_otherallergy_cmt" DatabaseField="Charge_familymedhist_mother_otherallergy_cmt" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxMaxLength="255"></def:datafieldcontrol>
    </td>
    <td>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_mother_otherallergy_age" DatabaseField="Charge_familymedhist_mother_otherallergy_age" FieldTextBoxTextDefault="-9" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    </td>
    <td>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_mother_otherallergy_preg" DatabaseField="Charge_familymedhist_mother_otherallergy_preg" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxTextDefault="0" FieldTextBoxWidth="40px" FieldTextBoxMaxLength="10"></def:datafieldcontrol>
    </td>
    <td>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_father_otherallergy" DatabaseField="Charge_familymedhist_father_otherallergy" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxTextDefault="0" FieldTextBoxWidth="40px" FieldTextBoxMaxLength="10"></def:datafieldcontrol>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_father_otherallergy_cmt" DatabaseField="Charge_familymedhist_father_otherallergy_cmt" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxMaxLength="255"></def:datafieldcontrol>
    </td>
    <td>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_othmem_otherallergy" DatabaseField="Charge_familymedhist_othmem_otherallergy" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxTextDefault="0" FieldTextBoxWidth="40px" FieldTextBoxMaxLength="10"></def:datafieldcontrol>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_othmem_otherallergy_cmt" DatabaseField="Charge_familymedhist_othmem_otherallergy_cmt" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="60px" FieldTextBoxMaxLength="255"></def:datafieldcontrol>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_othmem_otherallergy_type" DatabaseField="Charge_familymedhist_othmem_otherallergy_type" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="60px" FieldTextBoxMaxLength="100"></def:datafieldcontrol>
    </td>
</tr>
<tr id="auti">
    <td>Condition</td>
    <td>Child</td>
    <td colspan="3" align="center">Biological Mother</td>
    <td>Biological Father</td>
    <td>Siblings, Aunts, Uncles and Grandparents</td>
</tr>
<tr>
    <td>&nbsp;</td>
    <td><def:ValueSetLabel ID="ValueSetLabel_Charge_familymedhist_child_autism" runat="server"  DatabaseField="Charge_familymedhist_child_autism"></def:ValueSetLabel></td>
    <td><def:ValueSetLabel ID="ValueSetLabel_Charge_familymedhist_mother_autism" runat="server"  DatabaseField="Charge_familymedhist_mother_autism"></def:ValueSetLabel></td>
    <td>Onset Age</td>
    <td>During pregnancy?<br />
    <def:ValueSetLabel ID="ValueSetLabel_Charge_familymedhist_mother_autism_preg" runat="server"  DatabaseField="Charge_familymedhist_mother_autism_preg"></def:ValueSetLabel></td>
    <td><def:ValueSetLabel ID="ValueSetLabel_Charge_familymedhist_father_autism" runat="server"  DatabaseField="Charge_familymedhist_father_autism"></def:ValueSetLabel></td>
    <td><def:ValueSetLabel ID="ValueSetLabel_Charge_familymedhist_othmem_autism" runat="server"  DatabaseField="Charge_familymedhist_othmem_autism"></def:ValueSetLabel>
    If Yes, indicate Family Member Code</td>
</tr>
<tr>
    <td colspan="2">AUTISM SPECTRUM DISORDERS</td>
    <td colspan="5" align="right"><a href="#aspnetForm">Top</a>|<a href="#alle">Allergies</a>|<a href="#auti">Autism</a>|<a href="#neur">Neuro</a>|<a href="#sens">Sensory</a>|<a href="#ment">Mental</a>|<a href="#othe">Other</a>|<a href="#code">Codes</a></td>
</tr>
<tr>
    <td>7. Autism</td>
    <td>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_child_autism" DatabaseField="Charge_familymedhist_child_autism" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxTextDefault="0" FieldTextBoxWidth="40px" FieldTextBoxMaxLength="10"></def:datafieldcontrol>
    </td>
    <td>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_mother_autism" DatabaseField="Charge_familymedhist_mother_autism" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxTextDefault="0" FieldTextBoxWidth="40px" FieldTextBoxMaxLength="10"></def:datafieldcontrol>
    </td>
    <td>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_mother_autism_age" DatabaseField="Charge_familymedhist_mother_autism_age" FieldTextBoxTextDefault="-9" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    </td>
    <td>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_mother_autism_preg" DatabaseField="Charge_familymedhist_mother_autism_preg" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxTextDefault="0" FieldTextBoxWidth="40px" FieldTextBoxMaxLength="10"></def:datafieldcontrol>
    </td>
    <td>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_father_autism" DatabaseField="Charge_familymedhist_father_autism" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxTextDefault="0" FieldTextBoxWidth="40px" FieldTextBoxMaxLength="10"></def:datafieldcontrol>
    </td>
    <td>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_othmem_autism" DatabaseField="Charge_familymedhist_othmem_autism" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxTextDefault="0" FieldTextBoxWidth="40px" FieldTextBoxMaxLength="10"></def:datafieldcontrol>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_othmem_autism_type" DatabaseField="Charge_familymedhist_othmem_autism_type" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="60px" FieldTextBoxMaxLength="100"></def:datafieldcontrol>
    </td>
</tr>
<tr>
    <td>8. Asperger's Syndrome</td>
    <td>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_child_aspergers" DatabaseField="Charge_familymedhist_child_aspergers" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxTextDefault="0" FieldTextBoxWidth="40px" FieldTextBoxMaxLength="10"></def:datafieldcontrol>
    </td>
    <td>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_mother_aspergers" DatabaseField="Charge_familymedhist_mother_aspergers" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxTextDefault="0" FieldTextBoxWidth="40px" FieldTextBoxMaxLength="10"></def:datafieldcontrol>
    </td>
    <td>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_mother_aspergers_age" DatabaseField="Charge_familymedhist_mother_aspergers_age" FieldTextBoxTextDefault="-9" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    </td>
    <td>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_mother_aspergers_preg" DatabaseField="Charge_familymedhist_mother_aspergers_preg" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxTextDefault="0" FieldTextBoxWidth="40px" FieldTextBoxMaxLength="10"></def:datafieldcontrol>
    </td>
    <td>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_father_aspergers" DatabaseField="Charge_familymedhist_father_aspergers" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxTextDefault="0" FieldTextBoxWidth="40px" FieldTextBoxMaxLength="10"></def:datafieldcontrol>
    </td>
    <td>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_othmem_aspergers" DatabaseField="Charge_familymedhist_othmem_aspergers" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxTextDefault="0" FieldTextBoxWidth="40px" FieldTextBoxMaxLength="10"></def:datafieldcontrol>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_othmem_aspergers_type" DatabaseField="Charge_familymedhist_othmem_aspergers_type" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="60px" FieldTextBoxMaxLength="100"></def:datafieldcontrol>
    </td>
</tr>
<tr>
    <td>9. Rett's Syndrome</td>
    <td>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_child_retts" DatabaseField="Charge_familymedhist_child_retts" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxTextDefault="0" FieldTextBoxWidth="40px" FieldTextBoxMaxLength="10"></def:datafieldcontrol>
    </td>
    <td>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_mother_retts" DatabaseField="Charge_familymedhist_mother_retts" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxTextDefault="0" FieldTextBoxWidth="40px" FieldTextBoxMaxLength="10"></def:datafieldcontrol>
    </td>
    <td>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_mother_retts_age" DatabaseField="Charge_familymedhist_mother_retts_age" FieldTextBoxTextDefault="-9" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    </td>
    <td>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_mother_retts_preg" DatabaseField="Charge_familymedhist_mother_retts_preg" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxTextDefault="0" FieldTextBoxWidth="40px" FieldTextBoxMaxLength="10"></def:datafieldcontrol>
    </td>
    <td>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_father_retts" DatabaseField="Charge_familymedhist_father_retts" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxTextDefault="0" FieldTextBoxWidth="40px" FieldTextBoxMaxLength="10"></def:datafieldcontrol>
    </td>
    <td>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_othmem_retts" DatabaseField="Charge_familymedhist_othmem_retts" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxTextDefault="0" FieldTextBoxWidth="40px" FieldTextBoxMaxLength="10"></def:datafieldcontrol>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_othmem_retts_type" DatabaseField="Charge_familymedhist_othmem_retts_type" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="60px" FieldTextBoxMaxLength="100"></def:datafieldcontrol>
    </td>
</tr>
<tr>
    <td>10. PDD-NOS (specify)</td>
    <td>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_child_pddnos" DatabaseField="Charge_familymedhist_child_pddnos" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxTextDefault="0" FieldTextBoxWidth="40px" FieldTextBoxMaxLength="10"></def:datafieldcontrol>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_child_pddnos_cmt" DatabaseField="Charge_familymedhist_child_pddnos_cmt" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxMaxLength="255"></def:datafieldcontrol>
    </td>
    <td>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_mother_pddnos" DatabaseField="Charge_familymedhist_mother_pddnos" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxTextDefault="0" FieldTextBoxWidth="40px" FieldTextBoxMaxLength="10"></def:datafieldcontrol>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_mother_pddnos_cmt" DatabaseField="Charge_familymedhist_mother_pddnos_cmt" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxMaxLength="255"></def:datafieldcontrol>
    </td>
    <td>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_mother_pddnos_age" DatabaseField="Charge_familymedhist_mother_pddnos_age" FieldTextBoxTextDefault="-9" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    </td>
    <td>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_mother_pddnos_preg" DatabaseField="Charge_familymedhist_mother_pddnos_preg" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxTextDefault="0" FieldTextBoxWidth="40px" FieldTextBoxMaxLength="10"></def:datafieldcontrol>
    </td>
    <td>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_father_pddnos" DatabaseField="Charge_familymedhist_father_pddnos" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxTextDefault="0" FieldTextBoxWidth="40px" FieldTextBoxMaxLength="10"></def:datafieldcontrol>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_father_pddnos_cmt" DatabaseField="Charge_familymedhist_father_pddnos_cmt" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxMaxLength="255"></def:datafieldcontrol>
    </td>
    <td>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_othmem_pddnos" DatabaseField="Charge_familymedhist_othmem_pddnos" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxTextDefault="0" FieldTextBoxWidth="40px" FieldTextBoxMaxLength="10"></def:datafieldcontrol>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_othmem_pddnos_cmt" DatabaseField="Charge_familymedhist_othmem_pddnos_cmt" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="60px" FieldTextBoxMaxLength="255"></def:datafieldcontrol>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_othmem_pddnos_type" DatabaseField="Charge_familymedhist_othmem_pddnos_type" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="60px" FieldTextBoxMaxLength="100"></def:datafieldcontrol>
    </td>
</tr>
<tr id="neur">
    <td>Condition</td>
    <td>Child</td>
    <td colspan="3" align="center">Biological Mother</td>
    <td>Biological Father</td>
    <td>Siblings, Aunts, Uncles and Grandparents</td>
</tr>
<tr>
    <td>&nbsp;</td>
    <td><def:ValueSetLabel ID="ValueSetLabel_Charge_familymedhist_child_speechdelay" runat="server"  DatabaseField="Charge_familymedhist_child_speechdelay"></def:ValueSetLabel></td>
    <td><def:ValueSetLabel ID="ValueSetLabel_Charge_familymedhist_mother_speechdelay" runat="server"  DatabaseField="Charge_familymedhist_mother_speechdelay"></def:ValueSetLabel></td>
    <td>Onset Age</td>
    <td>During pregnancy?<br />
    <def:ValueSetLabel ID="ValueSetLabel_Charge_familymedhist_mother_speechdelay_preg" runat="server"  DatabaseField="Charge_familymedhist_mother_speechdelay_preg"></def:ValueSetLabel></td>
    <td><def:ValueSetLabel ID="ValueSetLabel_Charge_familymedhist_father_speechdelay" runat="server"  DatabaseField="Charge_familymedhist_father_speechdelay"></def:ValueSetLabel></td>
    <td><def:ValueSetLabel ID="ValueSetLabel_Charge_familymedhist_othmem_speechdelay" runat="server"  DatabaseField="Charge_familymedhist_othmem_speechdelay"></def:ValueSetLabel>
    If Yes, indicate Family Member Code</td>
</tr>
<tr>
    <td colspan="2">NEURODEVELOPMENTAL DISORDERS</td>
    <td colspan="5" align="right"><a href="#aspnetForm">Top</a>|<a href="#alle">Allergies</a>|<a href="#auti">Autism</a>|<a href="#neur">Neuro</a>|<a href="#sens">Sensory</a>|<a href="#ment">Mental</a>|<a href="#othe">Other</a>|<a href="#code">Codes</a></td>
</tr>
<tr>
    <td>11. Speech/Language Delay</td>
    <td>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_child_speechdelay" DatabaseField="Charge_familymedhist_child_speechdelay" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxTextDefault="0" FieldTextBoxWidth="40px" FieldTextBoxMaxLength="10"></def:datafieldcontrol>
    </td>
    <td>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_mother_speechdelay" DatabaseField="Charge_familymedhist_mother_speechdelay" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxTextDefault="0" FieldTextBoxWidth="40px" FieldTextBoxMaxLength="10"></def:datafieldcontrol>
    </td>
    <td>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_mother_speechdelay_age" DatabaseField="Charge_familymedhist_mother_speechdelay_age" FieldTextBoxTextDefault="-9" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    </td>
    <td>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_mother_speechdelay_preg" DatabaseField="Charge_familymedhist_mother_speechdelay_preg" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxTextDefault="0" FieldTextBoxWidth="40px" FieldTextBoxMaxLength="10"></def:datafieldcontrol>
    </td>
    <td>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_father_speechdelay" DatabaseField="Charge_familymedhist_father_speechdelay" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxTextDefault="0" FieldTextBoxWidth="40px" FieldTextBoxMaxLength="10"></def:datafieldcontrol>
    </td>
    <td>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_othmem_speechdelay" DatabaseField="Charge_familymedhist_othmem_speechdelay" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxTextDefault="0" FieldTextBoxWidth="40px" FieldTextBoxMaxLength="10"></def:datafieldcontrol>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_othmem_speechdelay_type" DatabaseField="Charge_familymedhist_othmem_speechdelay_type" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="60px" FieldTextBoxMaxLength="100"></def:datafieldcontrol>
    </td>
</tr>
<tr>
    <td>12. Developmental Delay</td>
    <td>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_child_devdelay" DatabaseField="Charge_familymedhist_child_devdelay" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxTextDefault="0" FieldTextBoxWidth="40px" FieldTextBoxMaxLength="10"></def:datafieldcontrol>
    </td>
    <td>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_mother_devdelay" DatabaseField="Charge_familymedhist_mother_devdelay" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxTextDefault="0" FieldTextBoxWidth="40px" FieldTextBoxMaxLength="10"></def:datafieldcontrol>
    </td>
    <td>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_mother_devdelay_age" DatabaseField="Charge_familymedhist_mother_devdelay_age" FieldTextBoxTextDefault="-9" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    </td>
    <td>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_mother_devdelay_preg" DatabaseField="Charge_familymedhist_mother_devdelay_preg" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxTextDefault="0" FieldTextBoxWidth="40px" FieldTextBoxMaxLength="10"></def:datafieldcontrol>
    </td>
    <td>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_father_devdelay" DatabaseField="Charge_familymedhist_father_devdelay" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxTextDefault="0" FieldTextBoxWidth="40px" FieldTextBoxMaxLength="10"></def:datafieldcontrol>
    </td>
    <td>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_othmem_devdelay" DatabaseField="Charge_familymedhist_othmem_devdelay" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxTextDefault="0" FieldTextBoxWidth="40px" FieldTextBoxMaxLength="10"></def:datafieldcontrol>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_othmem_devdelay_type" DatabaseField="Charge_familymedhist_othmem_devdelay_type" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="60px" FieldTextBoxMaxLength="100"></def:datafieldcontrol>
    </td>
</tr>
<tr>
    <td>13. Learning Disability</td>
    <td>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_child_learndis" DatabaseField="Charge_familymedhist_child_learndis" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxTextDefault="0" FieldTextBoxWidth="40px" FieldTextBoxMaxLength="10"></def:datafieldcontrol>
    </td>
    <td>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_mother_learndis" DatabaseField="Charge_familymedhist_mother_learndis" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxTextDefault="0" FieldTextBoxWidth="40px" FieldTextBoxMaxLength="10"></def:datafieldcontrol>
    </td>
    <td>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_mother_learndis_age" DatabaseField="Charge_familymedhist_mother_learndis_age" FieldTextBoxTextDefault="-9" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    </td>
    <td>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_mother_learndis_preg" DatabaseField="Charge_familymedhist_mother_learndis_preg" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxTextDefault="0" FieldTextBoxWidth="40px" FieldTextBoxMaxLength="10"></def:datafieldcontrol>
    </td>
    <td>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_father_learndis" DatabaseField="Charge_familymedhist_father_learndis" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxTextDefault="0" FieldTextBoxWidth="40px" FieldTextBoxMaxLength="10"></def:datafieldcontrol>
    </td>
    <td>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_othmem_learndis" DatabaseField="Charge_familymedhist_othmem_learndis" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxTextDefault="0" FieldTextBoxWidth="40px" FieldTextBoxMaxLength="10"></def:datafieldcontrol>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_othmem_learndis_type" DatabaseField="Charge_familymedhist_othmem_learndis_type" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="60px" FieldTextBoxMaxLength="100"></def:datafieldcontrol>
    </td>
</tr>
<tr>
    <td>14. Seizure disorder/Epilepsy</td>
    <td>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_child_seizure" DatabaseField="Charge_familymedhist_child_seizure" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxTextDefault="0" FieldTextBoxWidth="40px" FieldTextBoxMaxLength="10"></def:datafieldcontrol>
    </td>
    <td>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_mother_seizure" DatabaseField="Charge_familymedhist_mother_seizure" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxTextDefault="0" FieldTextBoxWidth="40px" FieldTextBoxMaxLength="10"></def:datafieldcontrol>
    </td>
    <td>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_mother_seizure_age" DatabaseField="Charge_familymedhist_mother_seizure_age" FieldTextBoxTextDefault="-9" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    </td>
    <td>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_mother_seizure_preg" DatabaseField="Charge_familymedhist_mother_seizure_preg" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxTextDefault="0" FieldTextBoxWidth="40px" FieldTextBoxMaxLength="10"></def:datafieldcontrol>
    </td>
    <td>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_father_seizure" DatabaseField="Charge_familymedhist_father_seizure" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxTextDefault="0" FieldTextBoxWidth="40px" FieldTextBoxMaxLength="10"></def:datafieldcontrol>
    </td>
    <td>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_othmem_seizure" DatabaseField="Charge_familymedhist_othmem_seizure" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxTextDefault="0" FieldTextBoxWidth="40px" FieldTextBoxMaxLength="10"></def:datafieldcontrol>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_othmem_seizure_type" DatabaseField="Charge_familymedhist_othmem_seizure_type" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="60px" FieldTextBoxMaxLength="100"></def:datafieldcontrol>
    </td>
</tr>
<tr>
    <td>15. Cerebral Palsy</td>
    <td>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_child_cerpalsy" DatabaseField="Charge_familymedhist_child_cerpalsy" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxTextDefault="0" FieldTextBoxWidth="40px" FieldTextBoxMaxLength="10"></def:datafieldcontrol>
    </td>
    <td>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_mother_cerpalsy" DatabaseField="Charge_familymedhist_mother_cerpalsy" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxTextDefault="0" FieldTextBoxWidth="40px" FieldTextBoxMaxLength="10"></def:datafieldcontrol>
    </td>
    <td>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_mother_cerpalsy_age" DatabaseField="Charge_familymedhist_mother_cerpalsy_age" FieldTextBoxTextDefault="-9" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    </td>
    <td>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_mother_cerpalsy_preg" DatabaseField="Charge_familymedhist_mother_cerpalsy_preg" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxTextDefault="0" FieldTextBoxWidth="40px" FieldTextBoxMaxLength="10"></def:datafieldcontrol>
    </td>
    <td>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_father_cerpalsy" DatabaseField="Charge_familymedhist_father_cerpalsy" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxTextDefault="0" FieldTextBoxWidth="40px" FieldTextBoxMaxLength="10"></def:datafieldcontrol>
    </td>
    <td>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_othmem_cerpalsy" DatabaseField="Charge_familymedhist_othmem_cerpalsy" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxTextDefault="0" FieldTextBoxWidth="40px" FieldTextBoxMaxLength="10"></def:datafieldcontrol>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_othmem_cerpalsy_type" DatabaseField="Charge_familymedhist_othmem_cerpalsy_type" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="60px" FieldTextBoxMaxLength="100"></def:datafieldcontrol>
    </td>
</tr>
<tr>
    <td>16. Down's Syndrome</td>
    <td>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_child_downssynd" DatabaseField="Charge_familymedhist_child_downssynd" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxTextDefault="0" FieldTextBoxWidth="40px" FieldTextBoxMaxLength="10"></def:datafieldcontrol>
    </td>
    <td>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_mother_downssynd" DatabaseField="Charge_familymedhist_mother_downssynd" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxTextDefault="0" FieldTextBoxWidth="40px" FieldTextBoxMaxLength="10"></def:datafieldcontrol>
    </td>
    <td>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_mother_downssynd_age" DatabaseField="Charge_familymedhist_mother_downssynd_age" FieldTextBoxTextDefault="-9" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    </td>
    <td>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_mother_downssynd_preg" DatabaseField="Charge_familymedhist_mother_downssynd_preg" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxTextDefault="0" FieldTextBoxWidth="40px" FieldTextBoxMaxLength="10"></def:datafieldcontrol>
    </td>
    <td>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_father_downssynd" DatabaseField="Charge_familymedhist_father_downssynd" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxTextDefault="0" FieldTextBoxWidth="40px" FieldTextBoxMaxLength="10"></def:datafieldcontrol>
    </td>
    <td>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_othmem_downssynd" DatabaseField="Charge_familymedhist_othmem_downssynd" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxTextDefault="0" FieldTextBoxWidth="40px" FieldTextBoxMaxLength="10"></def:datafieldcontrol>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_othmem_downssynd_type" DatabaseField="Charge_familymedhist_othmem_downssynd_type" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="60px" FieldTextBoxMaxLength="100"></def:datafieldcontrol>
    </td>
</tr>
<tr>
    <td>17. Mental Retardation</td>
    <td>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_child_mentalret" DatabaseField="Charge_familymedhist_child_mentalret" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxTextDefault="0" FieldTextBoxWidth="40px" FieldTextBoxMaxLength="10"></def:datafieldcontrol>
    </td>
    <td>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_mother_mentalret" DatabaseField="Charge_familymedhist_mother_mentalret" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxTextDefault="0" FieldTextBoxWidth="40px" FieldTextBoxMaxLength="10"></def:datafieldcontrol>
    </td>
    <td>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_mother_mentalret_age" DatabaseField="Charge_familymedhist_mother_mentalret_age" FieldTextBoxTextDefault="-9" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    </td>
    <td>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_mother_mentalret_preg" DatabaseField="Charge_familymedhist_mother_mentalret_preg" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxTextDefault="0" FieldTextBoxWidth="40px" FieldTextBoxMaxLength="10"></def:datafieldcontrol>
    </td>
    <td>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_father_mentalret" DatabaseField="Charge_familymedhist_father_mentalret" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxTextDefault="0" FieldTextBoxWidth="40px" FieldTextBoxMaxLength="10"></def:datafieldcontrol>
    </td>
    <td>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_othmem_mentalret" DatabaseField="Charge_familymedhist_othmem_mentalret" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxTextDefault="0" FieldTextBoxWidth="40px" FieldTextBoxMaxLength="10"></def:datafieldcontrol>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_othmem_mentalret_type" DatabaseField="Charge_familymedhist_othmem_mentalret_type" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="60px" FieldTextBoxMaxLength="100"></def:datafieldcontrol>
    </td>
</tr>
<tr>
    <td>18. Tuberous Sclerosis</td>
    <td>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_child_tuberscl" DatabaseField="Charge_familymedhist_child_tuberscl" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxTextDefault="0" FieldTextBoxWidth="40px" FieldTextBoxMaxLength="10"></def:datafieldcontrol>
    </td>
    <td>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_mother_tuberscl" DatabaseField="Charge_familymedhist_mother_tuberscl" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxTextDefault="0" FieldTextBoxWidth="40px" FieldTextBoxMaxLength="10"></def:datafieldcontrol>
    </td>
    <td>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_mother_tuberscl_age" DatabaseField="Charge_familymedhist_mother_tuberscl_age" FieldTextBoxTextDefault="-9" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    </td>
    <td>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_mother_tuberscl_preg" DatabaseField="Charge_familymedhist_mother_tuberscl_preg" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxTextDefault="0" FieldTextBoxWidth="40px" FieldTextBoxMaxLength="10"></def:datafieldcontrol>
    </td>
    <td>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_father_tuberscl" DatabaseField="Charge_familymedhist_father_tuberscl" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxTextDefault="0" FieldTextBoxWidth="40px" FieldTextBoxMaxLength="10"></def:datafieldcontrol>
    </td>
    <td>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_othmem_tuberscl" DatabaseField="Charge_familymedhist_othmem_tuberscl" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxTextDefault="0" FieldTextBoxWidth="40px" FieldTextBoxMaxLength="10"></def:datafieldcontrol>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_othmem_tuberscl_type" DatabaseField="Charge_familymedhist_othmem_tuberscl_type" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="60px" FieldTextBoxMaxLength="100"></def:datafieldcontrol>
    </td>
</tr>
<tr>
    <td>19. Fragile X</td>
    <td>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_child_fragilex" DatabaseField="Charge_familymedhist_child_fragilex" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxTextDefault="0" FieldTextBoxWidth="40px" FieldTextBoxMaxLength="10"></def:datafieldcontrol>
    </td>
    <td>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_mother_fragilex" DatabaseField="Charge_familymedhist_mother_fragilex" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxTextDefault="0" FieldTextBoxWidth="40px" FieldTextBoxMaxLength="10"></def:datafieldcontrol>
    </td>
    <td>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_mother_fragilex_age" DatabaseField="Charge_familymedhist_mother_fragilex_age" FieldTextBoxTextDefault="-9" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    </td>
    <td>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_mother_fragilex_preg" DatabaseField="Charge_familymedhist_mother_fragilex_preg" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxTextDefault="0" FieldTextBoxWidth="40px" FieldTextBoxMaxLength="10"></def:datafieldcontrol>
    </td>
    <td>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_father_fragilex" DatabaseField="Charge_familymedhist_father_fragilex" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxTextDefault="0" FieldTextBoxWidth="40px" FieldTextBoxMaxLength="10"></def:datafieldcontrol>
    </td>
    <td>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_othmem_fragilex" DatabaseField="Charge_familymedhist_othmem_fragilex" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxTextDefault="0" FieldTextBoxWidth="40px" FieldTextBoxMaxLength="10"></def:datafieldcontrol>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_othmem_fragilex_type" DatabaseField="Charge_familymedhist_othmem_fragilex_type" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="60px" FieldTextBoxMaxLength="100"></def:datafieldcontrol>
    </td>
</tr>
<tr>
    <td>20. Neuromuscular disorder</td>
    <td>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_child_neuromuscdis" DatabaseField="Charge_familymedhist_child_neuromuscdis" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxTextDefault="0" FieldTextBoxWidth="40px" FieldTextBoxMaxLength="10"></def:datafieldcontrol>
    </td>
    <td>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_mother_neuromuscdis" DatabaseField="Charge_familymedhist_mother_neuromuscdis" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxTextDefault="0" FieldTextBoxWidth="40px" FieldTextBoxMaxLength="10"></def:datafieldcontrol>
    </td>
    <td>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_mother_neuromuscdis_age" DatabaseField="Charge_familymedhist_mother_neuromuscdis_age" FieldTextBoxTextDefault="-9" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    </td>
    <td>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_mother_neuromuscdis_preg" DatabaseField="Charge_familymedhist_mother_neuromuscdis_preg" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxTextDefault="0" FieldTextBoxWidth="40px" FieldTextBoxMaxLength="10"></def:datafieldcontrol>
    </td>
    <td>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_father_neuromuscdis" DatabaseField="Charge_familymedhist_father_neuromuscdis" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxTextDefault="0" FieldTextBoxWidth="40px" FieldTextBoxMaxLength="10"></def:datafieldcontrol>
    </td>
    <td>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_othmem_neuromuscdis" DatabaseField="Charge_familymedhist_othmem_neuromuscdis" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxTextDefault="0" FieldTextBoxWidth="40px" FieldTextBoxMaxLength="10"></def:datafieldcontrol>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_othmem_neuromuscdis_type" DatabaseField="Charge_familymedhist_othmem_neuromuscdis_type" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="60px" FieldTextBoxMaxLength="100"></def:datafieldcontrol>
    </td>
</tr>
<tr>
    <td>21. Known Genetic Disorder (specify)</td>
    <td>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_child_geneticdis" DatabaseField="Charge_familymedhist_child_geneticdis" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxTextDefault="0" FieldTextBoxWidth="40px" FieldTextBoxMaxLength="10"></def:datafieldcontrol>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_child_geneticdis_cmt" DatabaseField="Charge_familymedhist_child_geneticdis_cmt" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxMaxLength="255"></def:datafieldcontrol>
    </td>
    <td>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_mother_geneticdis" DatabaseField="Charge_familymedhist_mother_geneticdis" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxTextDefault="0" FieldTextBoxWidth="40px" FieldTextBoxMaxLength="10"></def:datafieldcontrol>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_mother_geneticdis_cmt" DatabaseField="Charge_familymedhist_mother_geneticdis_cmt" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxMaxLength="255"></def:datafieldcontrol>
    </td>
    <td>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_mother_geneticdis_age" DatabaseField="Charge_familymedhist_mother_geneticdis_age" FieldTextBoxTextDefault="-9" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    </td>
    <td>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_mother_geneticdis_preg" DatabaseField="Charge_familymedhist_mother_geneticdis_preg" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxTextDefault="0" FieldTextBoxWidth="40px" FieldTextBoxMaxLength="10"></def:datafieldcontrol>
    </td>
    <td>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_father_geneticdis" DatabaseField="Charge_familymedhist_father_geneticdis" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxTextDefault="0" FieldTextBoxWidth="40px" FieldTextBoxMaxLength="10"></def:datafieldcontrol>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_father_geneticdis_cmt" DatabaseField="Charge_familymedhist_father_geneticdis_cmt" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxMaxLength="255"></def:datafieldcontrol>
    </td>
    <td>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_othmem_geneticdis" DatabaseField="Charge_familymedhist_othmem_geneticdis" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxTextDefault="0" FieldTextBoxWidth="40px" FieldTextBoxMaxLength="10"></def:datafieldcontrol>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_othmem_geneticdis_cmt" DatabaseField="Charge_familymedhist_othmem_geneticdis_cmt" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="60px" FieldTextBoxMaxLength="255"></def:datafieldcontrol>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_othmem_geneticdis_type" DatabaseField="Charge_familymedhist_othmem_geneticdis_type" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="60px" FieldTextBoxMaxLength="100"></def:datafieldcontrol>
    </td>
</tr>
<tr>
    <td style="padding-left:20px">21a. Genetic Testing (specify)</td>
    <td>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_child_geneticdistest" DatabaseField="Charge_familymedhist_child_geneticdistest" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxTextDefault="0" FieldTextBoxWidth="40px" FieldTextBoxMaxLength="10"></def:datafieldcontrol>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_child_geneticdistest_cmt" DatabaseField="Charge_familymedhist_child_geneticdistest_cmt" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxMaxLength="255"></def:datafieldcontrol>
    </td>
    <td>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_mother_geneticdistest" DatabaseField="Charge_familymedhist_mother_geneticdistest" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxTextDefault="0" FieldTextBoxWidth="40px" FieldTextBoxMaxLength="10"></def:datafieldcontrol>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_mother_geneticdistest_cmt" DatabaseField="Charge_familymedhist_mother_geneticdistest_cmt" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxMaxLength="255"></def:datafieldcontrol>
    </td>
    <td>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_mother_geneticdistest_age" DatabaseField="Charge_familymedhist_mother_geneticdistest_age" FieldTextBoxTextDefault="-9" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    </td>
    <td>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_mother_geneticdistest_preg" DatabaseField="Charge_familymedhist_mother_geneticdistest_preg" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxTextDefault="0" FieldTextBoxWidth="40px" FieldTextBoxMaxLength="10"></def:datafieldcontrol>
    </td>
    <td>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_father_geneticdistest" DatabaseField="Charge_familymedhist_father_geneticdistest" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxTextDefault="0" FieldTextBoxWidth="40px" FieldTextBoxMaxLength="10"></def:datafieldcontrol>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_father_geneticdistest_cmt" DatabaseField="Charge_familymedhist_father_geneticdistest_cmt" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxMaxLength="255"></def:datafieldcontrol>
    </td>
    <td>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_othmem_geneticdistest" DatabaseField="Charge_familymedhist_othmem_geneticdistest" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxTextDefault="0" FieldTextBoxWidth="40px" FieldTextBoxMaxLength="10"></def:datafieldcontrol>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_othmem_geneticdistest_cmt" DatabaseField="Charge_familymedhist_othmem_geneticdistest_cmt" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="60px" FieldTextBoxMaxLength="255"></def:datafieldcontrol>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_othmem_geneticdistest_type" DatabaseField="Charge_familymedhist_othmem_geneticdistest_type" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="60px" FieldTextBoxMaxLength="100"></def:datafieldcontrol>
    </td>
</tr>
<tr id="sens">
    <td>Condition</td>
    <td>Child</td>
    <td colspan="3" align="center">Biological Mother</td>
    <td>Biological Father</td>
    <td>Siblings, Aunts, Uncles and Grandparents</td>
</tr>
<tr>
    <td>&nbsp;</td>
    <td><def:ValueSetLabel ID="ValueSetLabel_Charge_familymedhist_child_visionimp" runat="server"  DatabaseField="Charge_familymedhist_child_visionimp"></def:ValueSetLabel></td>
    <td><def:ValueSetLabel ID="ValueSetLabel_Charge_familymedhist_mother_visionimp" runat="server"  DatabaseField="Charge_familymedhist_mother_visionimp"></def:ValueSetLabel></td>
    <td>Onset Age</td>
    <td>During pregnancy?<br />
    <def:ValueSetLabel ID="ValueSetLabel_Charge_familymedhist_mother_visionimp_preg" runat="server"  DatabaseField="Charge_familymedhist_mother_visionimp_preg"></def:ValueSetLabel></td>
    <td><def:ValueSetLabel ID="ValueSetLabel_Charge_familymedhist_father_visionimp" runat="server"  DatabaseField="Charge_familymedhist_father_visionimp"></def:ValueSetLabel></td>
    <td><def:ValueSetLabel ID="ValueSetLabel_Charge_familymedhist_othmem_visionimp" runat="server"  DatabaseField="Charge_familymedhist_othmem_visionimp"></def:ValueSetLabel>
    If Yes, indicate Family Member Code</td>
</tr>
<tr>
    <td colspan="2">SENSORY</td>
    <td colspan="5" align="right"><a href="#aspnetForm">Top</a>|<a href="#alle">Allergies</a>|<a href="#auti">Autism</a>|<a href="#neur">Neuro</a>|<a href="#sens">Sensory</a>|<a href="#ment">Mental</a>|<a href="#othe">Other</a>|<a href="#code">Codes</a></td>
</tr>
<tr>
    <td>22. Vision impairment</td>
    <td>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_child_visionimp" DatabaseField="Charge_familymedhist_child_visionimp" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxTextDefault="0" FieldTextBoxWidth="40px" FieldTextBoxMaxLength="10"></def:datafieldcontrol>
    </td>
    <td>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_mother_visionimp" DatabaseField="Charge_familymedhist_mother_visionimp" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxTextDefault="0" FieldTextBoxWidth="40px" FieldTextBoxMaxLength="10"></def:datafieldcontrol>
    </td>
    <td>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_mother_visionimp_age" DatabaseField="Charge_familymedhist_mother_visionimp_age" FieldTextBoxTextDefault="-9" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    </td>
    <td>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_mother_visionimp_preg" DatabaseField="Charge_familymedhist_mother_visionimp_preg" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxTextDefault="0" FieldTextBoxWidth="40px" FieldTextBoxMaxLength="10"></def:datafieldcontrol>
    </td>
    <td>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_father_visionimp" DatabaseField="Charge_familymedhist_father_visionimp" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxTextDefault="0" FieldTextBoxWidth="40px" FieldTextBoxMaxLength="10"></def:datafieldcontrol>
    </td>
    <td>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_othmem_visionimp" DatabaseField="Charge_familymedhist_othmem_visionimp" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxTextDefault="0" FieldTextBoxWidth="40px" FieldTextBoxMaxLength="10"></def:datafieldcontrol>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_othmem_visionimp_type" DatabaseField="Charge_familymedhist_othmem_visionimp_type" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="60px" FieldTextBoxMaxLength="100"></def:datafieldcontrol>
    </td>
</tr>
<tr>
    <td style="padding-left:20px">22a. Vision corrected?</td>
    <td>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_child_visioncor" DatabaseField="Charge_familymedhist_child_visioncor" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxTextDefault="0" FieldTextBoxWidth="40px" FieldTextBoxMaxLength="10"></def:datafieldcontrol>
    </td>
    <td>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_mother_visioncor" DatabaseField="Charge_familymedhist_mother_visioncor" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxTextDefault="0" FieldTextBoxWidth="40px" FieldTextBoxMaxLength="10"></def:datafieldcontrol>
    </td>
    <td>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_mother_visioncor_age" DatabaseField="Charge_familymedhist_mother_visioncor_age" FieldTextBoxTextDefault="-9" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    </td>
    <td>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_mother_visioncor_preg" DatabaseField="Charge_familymedhist_mother_visioncor_preg" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxTextDefault="0" FieldTextBoxWidth="40px" FieldTextBoxMaxLength="10"></def:datafieldcontrol>
    </td>
    <td>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_father_visioncor" DatabaseField="Charge_familymedhist_father_visioncor" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxTextDefault="0" FieldTextBoxWidth="40px" FieldTextBoxMaxLength="10"></def:datafieldcontrol>
    </td>
    <td>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_othmem_visioncor" DatabaseField="Charge_familymedhist_othmem_visioncor" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxTextDefault="0" FieldTextBoxWidth="40px" FieldTextBoxMaxLength="10"></def:datafieldcontrol>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_othmem_visioncor_type" DatabaseField="Charge_familymedhist_othmem_visioncor_type" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="60px" FieldTextBoxMaxLength="100"></def:datafieldcontrol>
    </td>
</tr>
<tr>
    <td>23. Hearing impairment</td>
    <td>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_child_hearingimp" DatabaseField="Charge_familymedhist_child_hearingimp" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxTextDefault="0" FieldTextBoxWidth="40px" FieldTextBoxMaxLength="10"></def:datafieldcontrol>
    </td>
    <td>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_mother_hearingimp" DatabaseField="Charge_familymedhist_mother_hearingimp" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxTextDefault="0" FieldTextBoxWidth="40px" FieldTextBoxMaxLength="10"></def:datafieldcontrol>
    </td>
    <td>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_mother_hearingimp_age" DatabaseField="Charge_familymedhist_mother_hearingimp_age" FieldTextBoxTextDefault="-9" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    </td>
    <td>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_mother_hearingimp_preg" DatabaseField="Charge_familymedhist_mother_hearingimp_preg" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxTextDefault="0" FieldTextBoxWidth="40px" FieldTextBoxMaxLength="10"></def:datafieldcontrol>
    </td>
    <td>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_father_hearingimp" DatabaseField="Charge_familymedhist_father_hearingimp" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxTextDefault="0" FieldTextBoxWidth="40px" FieldTextBoxMaxLength="10"></def:datafieldcontrol>
    </td>
    <td>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_othmem_hearingimp" DatabaseField="Charge_familymedhist_othmem_hearingimp" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxTextDefault="0" FieldTextBoxWidth="40px" FieldTextBoxMaxLength="10"></def:datafieldcontrol>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_othmem_hearingimp_type" DatabaseField="Charge_familymedhist_othmem_hearingimp_type" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="60px" FieldTextBoxMaxLength="100"></def:datafieldcontrol>
    </td>
</tr>
<tr>
    <td style="padding-left:20px">23a. Hearing corrected?</td>
    <td>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_child_hearingcor" DatabaseField="Charge_familymedhist_child_hearingcor" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxTextDefault="0" FieldTextBoxWidth="40px" FieldTextBoxMaxLength="10"></def:datafieldcontrol>
    </td>
    <td>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_mother_hearingcor" DatabaseField="Charge_familymedhist_mother_hearingcor" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxTextDefault="0" FieldTextBoxWidth="40px" FieldTextBoxMaxLength="10"></def:datafieldcontrol>
    </td>
    <td>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_mother_hearingcor_age" DatabaseField="Charge_familymedhist_mother_hearingcor_age" FieldTextBoxTextDefault="-9" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    </td>
    <td>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_mother_hearingcor_preg" DatabaseField="Charge_familymedhist_mother_hearingcor_preg" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxTextDefault="0" FieldTextBoxWidth="40px" FieldTextBoxMaxLength="10"></def:datafieldcontrol>
    </td>
    <td>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_father_hearingcor" DatabaseField="Charge_familymedhist_father_hearingcor" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxTextDefault="0" FieldTextBoxWidth="40px" FieldTextBoxMaxLength="10"></def:datafieldcontrol>
    </td>
    <td>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_othmem_hearingcor" DatabaseField="Charge_familymedhist_othmem_hearingcor" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxTextDefault="0" FieldTextBoxWidth="40px" FieldTextBoxMaxLength="10"></def:datafieldcontrol>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_othmem_hearingcor_type" DatabaseField="Charge_familymedhist_othmem_hearingcor_type" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="60px" FieldTextBoxMaxLength="100"></def:datafieldcontrol>
    </td>
</tr>
<tr id="ment">
    <td>Condition</td>
    <td>Child</td>
    <td colspan="3" align="center">Biological Mother</td>
    <td>Biological Father</td>
    <td>Siblings, Aunts, Uncles and Grandparents</td>
</tr>
<tr>
    <td>&nbsp;</td>
    <td><def:ValueSetLabel ID="ValueSetLabel_Charge_familymedhist_child_bipolar" runat="server"  DatabaseField="Charge_familymedhist_child_bipolar"></def:ValueSetLabel></td>
    <td><def:ValueSetLabel ID="ValueSetLabel_Charge_familymedhist_mother_bipolar" runat="server"  DatabaseField="Charge_familymedhist_mother_bipolar"></def:ValueSetLabel></td>
    <td>Onset Age</td>
    <td>During pregnancy?<br />
    <def:ValueSetLabel ID="ValueSetLabel_Charge_familymedhist_mother_bipolar_preg" runat="server"  DatabaseField="Charge_familymedhist_mother_bipolar_preg"></def:ValueSetLabel></td>
    <td><def:ValueSetLabel ID="ValueSetLabel_Charge_familymedhist_father_bipolar" runat="server"  DatabaseField="Charge_familymedhist_father_bipolar"></def:ValueSetLabel></td>
    <td><def:ValueSetLabel ID="ValueSetLabel_Charge_familymedhist_othmem_bipolar" runat="server"  DatabaseField="Charge_familymedhist_othmem_bipolar"></def:ValueSetLabel>
    If Yes, indicate Family Member Code</td>
</tr>
<tr>
    <td colspan="2">MENTAL HEALTH</td>
    <td colspan="5" align="right"><a href="#aspnetForm">Top</a>|<a href="#alle">Allergies</a>|<a href="#auti">Autism</a>|<a href="#neur">Neuro</a>|<a href="#sens">Sensory</a>|<a href="#ment">Mental</a>|<a href="#othe">Other</a>|<a href="#code">Codes</a></td>
</tr>
<tr>
    <td>24. Bipolar disorder</td>
    <td>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_child_bipolar" DatabaseField="Charge_familymedhist_child_bipolar" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxTextDefault="0" FieldTextBoxWidth="40px" FieldTextBoxMaxLength="10"></def:datafieldcontrol>
    </td>
    <td>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_mother_bipolar" DatabaseField="Charge_familymedhist_mother_bipolar" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxTextDefault="0" FieldTextBoxWidth="40px" FieldTextBoxMaxLength="10"></def:datafieldcontrol>
    </td>
    <td>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_mother_bipolar_age" DatabaseField="Charge_familymedhist_mother_bipolar_age" FieldTextBoxTextDefault="-9" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    </td>
    <td>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_mother_bipolar_preg" DatabaseField="Charge_familymedhist_mother_bipolar_preg" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxTextDefault="0" FieldTextBoxWidth="40px" FieldTextBoxMaxLength="10"></def:datafieldcontrol>
    </td>
    <td>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_father_bipolar" DatabaseField="Charge_familymedhist_father_bipolar" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxTextDefault="0" FieldTextBoxWidth="40px" FieldTextBoxMaxLength="10"></def:datafieldcontrol>
    </td>
    <td>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_othmem_bipolar" DatabaseField="Charge_familymedhist_othmem_bipolar" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxTextDefault="0" FieldTextBoxWidth="40px" FieldTextBoxMaxLength="10"></def:datafieldcontrol>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_othmem_bipolar_type" DatabaseField="Charge_familymedhist_othmem_bipolar_type" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="60px" FieldTextBoxMaxLength="100"></def:datafieldcontrol>
    </td>
</tr>
<tr>
    <td>25. Depression</td>
    <td>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_child_depression" DatabaseField="Charge_familymedhist_child_depression" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxTextDefault="0" FieldTextBoxWidth="40px" FieldTextBoxMaxLength="10"></def:datafieldcontrol>
    </td>
    <td>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_mother_depression" DatabaseField="Charge_familymedhist_mother_depression" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxTextDefault="0" FieldTextBoxWidth="40px" FieldTextBoxMaxLength="10"></def:datafieldcontrol>
    </td>
    <td>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_mother_depression_age" DatabaseField="Charge_familymedhist_mother_depression_age" FieldTextBoxTextDefault="-9" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    </td>
    <td>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_mother_depression_preg" DatabaseField="Charge_familymedhist_mother_depression_preg" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxTextDefault="0" FieldTextBoxWidth="40px" FieldTextBoxMaxLength="10"></def:datafieldcontrol>
    </td>
    <td>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_father_depression" DatabaseField="Charge_familymedhist_father_depression" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxTextDefault="0" FieldTextBoxWidth="40px" FieldTextBoxMaxLength="10"></def:datafieldcontrol>
    </td>
    <td>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_othmem_depression" DatabaseField="Charge_familymedhist_othmem_depression" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxTextDefault="0" FieldTextBoxWidth="40px" FieldTextBoxMaxLength="10"></def:datafieldcontrol>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_othmem_depression_type" DatabaseField="Charge_familymedhist_othmem_depression_type" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="60px" FieldTextBoxMaxLength="100"></def:datafieldcontrol>
    </td>
</tr>
<tr>
    <td>26. Anxiety disorder</td>
    <td>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_child_anxiety" DatabaseField="Charge_familymedhist_child_anxiety" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxTextDefault="0" FieldTextBoxWidth="40px" FieldTextBoxMaxLength="10"></def:datafieldcontrol>
    </td>
    <td>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_mother_anxiety" DatabaseField="Charge_familymedhist_mother_anxiety" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxTextDefault="0" FieldTextBoxWidth="40px" FieldTextBoxMaxLength="10"></def:datafieldcontrol>
    </td>
    <td>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_mother_anxiety_age" DatabaseField="Charge_familymedhist_mother_anxiety_age" FieldTextBoxTextDefault="-9" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    </td>
    <td>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_mother_anxiety_preg" DatabaseField="Charge_familymedhist_mother_anxiety_preg" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxTextDefault="0" FieldTextBoxWidth="40px" FieldTextBoxMaxLength="10"></def:datafieldcontrol>
    </td>
    <td>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_father_anxiety" DatabaseField="Charge_familymedhist_father_anxiety" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxTextDefault="0" FieldTextBoxWidth="40px" FieldTextBoxMaxLength="10"></def:datafieldcontrol>
    </td>
    <td>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_othmem_anxiety" DatabaseField="Charge_familymedhist_othmem_anxiety" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxTextDefault="0" FieldTextBoxWidth="40px" FieldTextBoxMaxLength="10"></def:datafieldcontrol>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_othmem_anxiety_type" DatabaseField="Charge_familymedhist_othmem_anxiety_type" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="60px" FieldTextBoxMaxLength="100"></def:datafieldcontrol>
    </td>
</tr>
<tr>
    <td>27. Obsessive compulsive disorder</td>
    <td>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_child_ocd" DatabaseField="Charge_familymedhist_child_ocd" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxTextDefault="0" FieldTextBoxWidth="40px" FieldTextBoxMaxLength="10"></def:datafieldcontrol>
    </td>
    <td>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_mother_ocd" DatabaseField="Charge_familymedhist_mother_ocd" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxTextDefault="0" FieldTextBoxWidth="40px" FieldTextBoxMaxLength="10"></def:datafieldcontrol>
    </td>
    <td>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_mother_ocd_age" DatabaseField="Charge_familymedhist_mother_ocd_age" FieldTextBoxTextDefault="-9" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    </td>
    <td>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_mother_ocd_preg" DatabaseField="Charge_familymedhist_mother_ocd_preg" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxTextDefault="0" FieldTextBoxWidth="40px" FieldTextBoxMaxLength="10"></def:datafieldcontrol>
    </td>
    <td>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_father_ocd" DatabaseField="Charge_familymedhist_father_ocd" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxTextDefault="0" FieldTextBoxWidth="40px" FieldTextBoxMaxLength="10"></def:datafieldcontrol>
    </td>
    <td>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_othmem_ocd" DatabaseField="Charge_familymedhist_othmem_ocd" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxTextDefault="0" FieldTextBoxWidth="40px" FieldTextBoxMaxLength="10"></def:datafieldcontrol>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_othmem_ocd_type" DatabaseField="Charge_familymedhist_othmem_ocd_type" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="60px" FieldTextBoxMaxLength="100"></def:datafieldcontrol>
    </td>
</tr>
<tr>
    <td>28. Schizophrenia</td>
    <td>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_child_schizophrenia" DatabaseField="Charge_familymedhist_child_schizophrenia" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxTextDefault="0" FieldTextBoxWidth="40px" FieldTextBoxMaxLength="10"></def:datafieldcontrol>
    </td>
    <td>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_mother_schizophrenia" DatabaseField="Charge_familymedhist_mother_schizophrenia" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxTextDefault="0" FieldTextBoxWidth="40px" FieldTextBoxMaxLength="10"></def:datafieldcontrol>
    </td>
    <td>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_mother_schizophrenia_age" DatabaseField="Charge_familymedhist_mother_schizophrenia_age" FieldTextBoxTextDefault="-9" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    </td>
    <td>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_mother_schizophrenia_preg" DatabaseField="Charge_familymedhist_mother_schizophrenia_preg" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxTextDefault="0" FieldTextBoxWidth="40px" FieldTextBoxMaxLength="10"></def:datafieldcontrol>
    </td>
    <td>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_father_schizophrenia" DatabaseField="Charge_familymedhist_father_schizophrenia" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxTextDefault="0" FieldTextBoxWidth="40px" FieldTextBoxMaxLength="10"></def:datafieldcontrol>
    </td>
    <td>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_othmem_schizophrenia" DatabaseField="Charge_familymedhist_othmem_schizophrenia" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxTextDefault="0" FieldTextBoxWidth="40px" FieldTextBoxMaxLength="10"></def:datafieldcontrol>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_othmem_schizophrenia_type" DatabaseField="Charge_familymedhist_othmem_schizophrenia_type" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="60px" FieldTextBoxMaxLength="100"></def:datafieldcontrol>
    </td>
</tr>
<tr>
    <td>29. Personality disorder (specify)</td>
    <td>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_child_persondis" DatabaseField="Charge_familymedhist_child_persondis" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxTextDefault="0" FieldTextBoxWidth="40px" FieldTextBoxMaxLength="10"></def:datafieldcontrol>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_child_persondis_cmt" DatabaseField="Charge_familymedhist_child_persondis_cmt" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxMaxLength="255"></def:datafieldcontrol>
    </td>
    <td>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_mother_persondis" DatabaseField="Charge_familymedhist_mother_persondis" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxTextDefault="0" FieldTextBoxWidth="40px" FieldTextBoxMaxLength="10"></def:datafieldcontrol>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_mother_persondis_cmt" DatabaseField="Charge_familymedhist_mother_persondis_cmt" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxMaxLength="255"></def:datafieldcontrol>
    </td>
    <td>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_mother_persondis_age" DatabaseField="Charge_familymedhist_mother_persondis_age" FieldTextBoxTextDefault="-9" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    </td>
    <td>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_mother_persondis_preg" DatabaseField="Charge_familymedhist_mother_persondis_preg" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxTextDefault="0" FieldTextBoxWidth="40px" FieldTextBoxMaxLength="10"></def:datafieldcontrol>
    </td>
    <td>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_father_persondis" DatabaseField="Charge_familymedhist_father_persondis" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxTextDefault="0" FieldTextBoxWidth="40px" FieldTextBoxMaxLength="10"></def:datafieldcontrol>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_father_persondis_cmt" DatabaseField="Charge_familymedhist_father_persondis_cmt" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxMaxLength="255"></def:datafieldcontrol>
    </td>
    <td>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_othmem_persondis" DatabaseField="Charge_familymedhist_othmem_persondis" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxTextDefault="0" FieldTextBoxWidth="40px" FieldTextBoxMaxLength="10"></def:datafieldcontrol>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_othmem_persondis_cmt" DatabaseField="Charge_familymedhist_othmem_persondis_cmt" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="60px" FieldTextBoxMaxLength="255"></def:datafieldcontrol>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_othmem_persondis_type" DatabaseField="Charge_familymedhist_othmem_persondis_type" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="60px" FieldTextBoxMaxLength="100"></def:datafieldcontrol>
    </td>
</tr>
<tr>
    <td>30. Self-injuring behavior</td>
    <td>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_child_selfinj" DatabaseField="Charge_familymedhist_child_selfinj" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxTextDefault="0" FieldTextBoxWidth="40px" FieldTextBoxMaxLength="10"></def:datafieldcontrol>
    </td>
    <td>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_mother_selfinj" DatabaseField="Charge_familymedhist_mother_selfinj" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxTextDefault="0" FieldTextBoxWidth="40px" FieldTextBoxMaxLength="10"></def:datafieldcontrol>
    </td>
    <td>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_mother_selfinj_age" DatabaseField="Charge_familymedhist_mother_selfinj_age" FieldTextBoxTextDefault="-9" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    </td>
    <td>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_mother_selfinj_preg" DatabaseField="Charge_familymedhist_mother_selfinj_preg" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxTextDefault="0" FieldTextBoxWidth="40px" FieldTextBoxMaxLength="10"></def:datafieldcontrol>
    </td>
    <td>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_father_selfinj" DatabaseField="Charge_familymedhist_father_selfinj" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxTextDefault="0" FieldTextBoxWidth="40px" FieldTextBoxMaxLength="10"></def:datafieldcontrol>
    </td>
    <td>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_othmem_selfinj" DatabaseField="Charge_familymedhist_othmem_selfinj" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxTextDefault="0" FieldTextBoxWidth="40px" FieldTextBoxMaxLength="10"></def:datafieldcontrol>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_othmem_selfinj_type" DatabaseField="Charge_familymedhist_othmem_selfinj_type" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="60px" FieldTextBoxMaxLength="100"></def:datafieldcontrol>
    </td>
</tr>
<tr>
    <td>31. Suicide attempt/suicide</td>
    <td>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_child_suicideatt" DatabaseField="Charge_familymedhist_child_suicideatt" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxTextDefault="0" FieldTextBoxWidth="40px" FieldTextBoxMaxLength="10"></def:datafieldcontrol>
    </td>
    <td>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_mother_suicideatt" DatabaseField="Charge_familymedhist_mother_suicideatt" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxTextDefault="0" FieldTextBoxWidth="40px" FieldTextBoxMaxLength="10"></def:datafieldcontrol>
    </td>
    <td>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_mother_suicideatt_age" DatabaseField="Charge_familymedhist_mother_suicideatt_age" FieldTextBoxTextDefault="-9" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    </td>
    <td>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_mother_suicideatt_preg" DatabaseField="Charge_familymedhist_mother_suicideatt_preg" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxTextDefault="0" FieldTextBoxWidth="40px" FieldTextBoxMaxLength="10"></def:datafieldcontrol>
    </td>
    <td>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_father_suicideatt" DatabaseField="Charge_familymedhist_father_suicideatt" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxTextDefault="0" FieldTextBoxWidth="40px" FieldTextBoxMaxLength="10"></def:datafieldcontrol>
    </td>
    <td>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_othmem_suicideatt" DatabaseField="Charge_familymedhist_othmem_suicideatt" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxTextDefault="0" FieldTextBoxWidth="40px" FieldTextBoxMaxLength="10"></def:datafieldcontrol>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_othmem_suicideatt_type" DatabaseField="Charge_familymedhist_othmem_suicideatt_type" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="60px" FieldTextBoxMaxLength="100"></def:datafieldcontrol>
    </td>
</tr>
<tr>
    <td>32. Other psychiatric disorder (specify)</td>
    <td>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_child_otherpsychdis" DatabaseField="Charge_familymedhist_child_otherpsychdis" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxTextDefault="0" FieldTextBoxWidth="40px" FieldTextBoxMaxLength="10"></def:datafieldcontrol>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_child_otherpsychdis_cmt" DatabaseField="Charge_familymedhist_child_otherpsychdis_cmt" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxMaxLength="255"></def:datafieldcontrol>
    </td>
    <td>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_mother_psychdis" DatabaseField="Charge_familymedhist_mother_psychdis" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxTextDefault="0" FieldTextBoxWidth="40px" FieldTextBoxMaxLength="10"></def:datafieldcontrol>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_mother_psychdis_cmt" DatabaseField="Charge_familymedhist_mother_psychdis_cmt" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxMaxLength="255"></def:datafieldcontrol>
    </td>
    <td>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_mother_psychdis_age" DatabaseField="Charge_familymedhist_mother_psychdis_age" FieldTextBoxTextDefault="-9" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    </td>
    <td>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_mother_psychdis_preg" DatabaseField="Charge_familymedhist_mother_psychdis_preg" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxTextDefault="0" FieldTextBoxWidth="40px" FieldTextBoxMaxLength="10"></def:datafieldcontrol>
    </td>
    <td>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_father_otherpsychdis" DatabaseField="Charge_familymedhist_father_otherpsychdis" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxTextDefault="0" FieldTextBoxWidth="40px" FieldTextBoxMaxLength="10"></def:datafieldcontrol>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_father_otherpsychdis_cmt" DatabaseField="Charge_familymedhist_father_otherpsychdis_cmt" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxMaxLength="255"></def:datafieldcontrol>
    </td>
    <td>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_othmem_otherpsychdis" DatabaseField="Charge_familymedhist_othmem_otherpsychdis" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxTextDefault="0" FieldTextBoxWidth="40px" FieldTextBoxMaxLength="10"></def:datafieldcontrol>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_othmem_otherpsychdis_cmt" DatabaseField="Charge_familymedhist_othmem_otherpsychdis_cmt" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="60px" FieldTextBoxMaxLength="255"></def:datafieldcontrol>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_othmem_otherpsychdis_type" DatabaseField="Charge_familymedhist_othmem_otherpsychdis_type" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="60px" FieldTextBoxMaxLength="100"></def:datafieldcontrol>
    </td>
</tr>
<tr>
    <td>33. Attention deficit hyperactivity disorder</td>
    <td>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_child_adhd" DatabaseField="Charge_familymedhist_child_adhd" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxTextDefault="0" FieldTextBoxWidth="40px" FieldTextBoxMaxLength="10"></def:datafieldcontrol>
    </td>
    <td>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_mother_adhd" DatabaseField="Charge_familymedhist_mother_adhd" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxTextDefault="0" FieldTextBoxWidth="40px" FieldTextBoxMaxLength="10"></def:datafieldcontrol>
    </td>
    <td>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_mother_adhd_age" DatabaseField="Charge_familymedhist_mother_adhd_age" FieldTextBoxTextDefault="-9" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    </td>
    <td>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_mother_adhd_preg" DatabaseField="Charge_familymedhist_mother_adhd_preg" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxTextDefault="0" FieldTextBoxWidth="40px" FieldTextBoxMaxLength="10"></def:datafieldcontrol>
    </td>
    <td>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_father_adhd" DatabaseField="Charge_familymedhist_father_adhd" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxTextDefault="0" FieldTextBoxWidth="40px" FieldTextBoxMaxLength="10"></def:datafieldcontrol>
    </td>
    <td>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_othmem_adhd" DatabaseField="Charge_familymedhist_othmem_adhd" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxTextDefault="0" FieldTextBoxWidth="40px" FieldTextBoxMaxLength="10"></def:datafieldcontrol>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_othmem_adhd_type" DatabaseField="Charge_familymedhist_othmem_adhd_type" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="60px" FieldTextBoxMaxLength="100"></def:datafieldcontrol>
    </td>
</tr>
<tr>
    <td>34. Eating disorder (specify)</td>
    <td>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_child_eatingdis" DatabaseField="Charge_familymedhist_child_eatingdis" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxTextDefault="0" FieldTextBoxWidth="40px" FieldTextBoxMaxLength="10"></def:datafieldcontrol>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_child_eatingdis_cmt" DatabaseField="Charge_familymedhist_child_eatingdis_cmt" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxMaxLength="255"></def:datafieldcontrol>
    </td>
    <td>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_mother_eatingdis" DatabaseField="Charge_familymedhist_mother_eatingdis" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxTextDefault="0" FieldTextBoxWidth="40px" FieldTextBoxMaxLength="10"></def:datafieldcontrol>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_mother_eatingdis_cmt" DatabaseField="Charge_familymedhist_mother_eatingdis_cmt" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxMaxLength="255"></def:datafieldcontrol>
    </td>
    <td>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_mother_eatingdis_age" DatabaseField="Charge_familymedhist_mother_eatingdis_age" FieldTextBoxTextDefault="-9" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    </td>
    <td>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_mother_eatingdis_preg" DatabaseField="Charge_familymedhist_mother_eatingdis_preg" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxTextDefault="0" FieldTextBoxWidth="40px" FieldTextBoxMaxLength="10"></def:datafieldcontrol>
    </td>
    <td>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_father_eatingdis" DatabaseField="Charge_familymedhist_father_eatingdis" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxTextDefault="0" FieldTextBoxWidth="40px" FieldTextBoxMaxLength="10"></def:datafieldcontrol>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_father_eatingdis_cmt" DatabaseField="Charge_familymedhist_father_eatingdis_cmt" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxMaxLength="255"></def:datafieldcontrol>
    </td>
    <td>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_othmem_eatingdis" DatabaseField="Charge_familymedhist_othmem_eatingdis" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxTextDefault="0" FieldTextBoxWidth="40px" FieldTextBoxMaxLength="10"></def:datafieldcontrol>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_othmem_eatingdis_cmt" DatabaseField="Charge_familymedhist_othmem_eatingdis_cmt" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="60px" FieldTextBoxMaxLength="255"></def:datafieldcontrol>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_othmem_eatingdis_type" DatabaseField="Charge_familymedhist_othmem_eatingdis_type" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="60px" FieldTextBoxMaxLength="100"></def:datafieldcontrol>
    </td>
</tr>
<tr>
    <td>35. Sleep disorder (specify)</td>
    <td>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_child_sleepdis" DatabaseField="Charge_familymedhist_child_sleepdis" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxTextDefault="0" FieldTextBoxWidth="40px" FieldTextBoxMaxLength="10"></def:datafieldcontrol>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_child_sleepdis_cmt" DatabaseField="Charge_familymedhist_child_sleepdis_cmt" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxMaxLength="255"></def:datafieldcontrol>
    </td>
    <td>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_mother_sleepdis" DatabaseField="Charge_familymedhist_mother_sleepdis" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxTextDefault="0" FieldTextBoxWidth="40px" FieldTextBoxMaxLength="10"></def:datafieldcontrol>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_mother_sleepdis_cmt" DatabaseField="Charge_familymedhist_mother_sleepdis_cmt" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxMaxLength="255"></def:datafieldcontrol>
    </td>
    <td>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_mother_sleepdis_age" DatabaseField="Charge_familymedhist_mother_sleepdis_age" FieldTextBoxTextDefault="-9" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    </td>
    <td>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_mother_sleepdis_preg" DatabaseField="Charge_familymedhist_mother_sleepdis_preg" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxTextDefault="0" FieldTextBoxWidth="40px" FieldTextBoxMaxLength="10"></def:datafieldcontrol>
    </td>
    <td>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_father_sleepdis" DatabaseField="Charge_familymedhist_father_sleepdis" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxTextDefault="0" FieldTextBoxWidth="40px" FieldTextBoxMaxLength="10"></def:datafieldcontrol>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_father_sleepdis_cmt" DatabaseField="Charge_familymedhist_father_sleepdis_cmt" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxMaxLength="50"></def:datafieldcontrol>
    </td>
    <td>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_othmem_sleepdis" DatabaseField="Charge_familymedhist_othmem_sleepdis" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxTextDefault="0" FieldTextBoxWidth="40px" FieldTextBoxMaxLength="10"></def:datafieldcontrol>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_othmem_sleepdis_cmt" DatabaseField="Charge_familymedhist_othmem_sleepdis_cmt" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="60px" FieldTextBoxMaxLength="255"></def:datafieldcontrol>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_othmem_sleepdis_type" DatabaseField="Charge_familymedhist_othmem_sleepdis_type" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="60px" FieldTextBoxMaxLength="100"></def:datafieldcontrol>
    </td>
</tr>
<tr>
    <td>36. Victim of abuse</td>
    <td>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_child_abusevic" DatabaseField="Charge_familymedhist_child_abusevic" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxTextDefault="0" FieldTextBoxWidth="40px" FieldTextBoxMaxLength="10"></def:datafieldcontrol>
    </td>
    <td>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_mother_abusevic" DatabaseField="Charge_familymedhist_mother_abusevic" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxTextDefault="0" FieldTextBoxWidth="40px" FieldTextBoxMaxLength="10"></def:datafieldcontrol>
    </td>
    <td>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_mother_abusevic_age" DatabaseField="Charge_familymedhist_mother_abusevic_age" FieldTextBoxTextDefault="-9" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    </td>
    <td>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_mother_abusevic_preg" DatabaseField="Charge_familymedhist_mother_abusevic_preg" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxTextDefault="0" FieldTextBoxWidth="40px" FieldTextBoxMaxLength="10"></def:datafieldcontrol>
    </td>
    <td>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_father_abusevic" DatabaseField="Charge_familymedhist_father_abusevic" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxTextDefault="0" FieldTextBoxWidth="40px" FieldTextBoxMaxLength="10"></def:datafieldcontrol>
    </td>
    <td>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_othmem_abusevic" DatabaseField="Charge_familymedhist_othmem_abusevic" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxTextDefault="0" FieldTextBoxWidth="40px" FieldTextBoxMaxLength="10"></def:datafieldcontrol>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_othmem_abusevic_type" DatabaseField="Charge_familymedhist_othmem_abusevic_type" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="60px" FieldTextBoxMaxLength="100"></def:datafieldcontrol>
    </td>
</tr>
<tr>
    <td>37. Substance abuse (specify)</td>
    <td>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_child_subabuse" DatabaseField="Charge_familymedhist_child_subabuse" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxTextDefault="0" FieldTextBoxWidth="40px" FieldTextBoxMaxLength="10"></def:datafieldcontrol>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_child_subabuse_cmt" DatabaseField="Charge_familymedhist_child_subabuse_cmt" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxMaxLength="255"></def:datafieldcontrol>
    </td>
    <td>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_mother_subabuse" DatabaseField="Charge_familymedhist_mother_subabuse" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxTextDefault="0" FieldTextBoxWidth="40px" FieldTextBoxMaxLength="10"></def:datafieldcontrol>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_mother_subabuse_cmt" DatabaseField="Charge_familymedhist_mother_subabuse_cmt" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxMaxLength="255"></def:datafieldcontrol>
    </td>
    <td>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_mother_subabuse_age" DatabaseField="Charge_familymedhist_mother_subabuse_age" FieldTextBoxTextDefault="-9" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    </td>
    <td>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_mother_subabuse_preg" DatabaseField="Charge_familymedhist_mother_subabuse_preg" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxTextDefault="0" FieldTextBoxWidth="40px" FieldTextBoxMaxLength="10"></def:datafieldcontrol>
    </td>
    <td>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_father_subabuse" DatabaseField="Charge_familymedhist_father_subabuse" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxTextDefault="0" FieldTextBoxWidth="40px" FieldTextBoxMaxLength="10"></def:datafieldcontrol>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_father_subabuse_cmt" DatabaseField="Charge_familymedhist_father_subabuse_cmt" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxMaxLength="255"></def:datafieldcontrol>
    </td>
    <td>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_othmem_subabuse" DatabaseField="Charge_familymedhist_othmem_subabuse" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxTextDefault="0" FieldTextBoxWidth="40px" FieldTextBoxMaxLength="10"></def:datafieldcontrol>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_othmem_subabuse_cmt" DatabaseField="Charge_familymedhist_othmem_subabuse_cmt" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="60px" FieldTextBoxMaxLength="255"></def:datafieldcontrol>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_othmem_subabuse_type" DatabaseField="Charge_familymedhist_othmem_subabuse_type" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="60px" FieldTextBoxMaxLength="100"></def:datafieldcontrol>
    </td>
</tr>
<tr id="othe">
    <td>Condition</td>
    <td>Child</td>
    <td colspan="3" align="center">Biological Mother</td>
    <td>Biological Father</td>
    <td>Siblings, Aunts, Uncles and Grandparents</td>
</tr>
<tr>
    <td>&nbsp;</td>
    <td><def:ValueSetLabel ID="ValueSetLabel_Charge_familymedhist_child_migraine" runat="server"  DatabaseField="Charge_familymedhist_child_migraine"></def:ValueSetLabel></td>
    <td><def:ValueSetLabel ID="ValueSetLabel_Charge_familymedhist_mother_migraine" runat="server"  DatabaseField="Charge_familymedhist_mother_migraine"></def:ValueSetLabel></td>
    <td>Onset Age</td>
    <td>During pregnancy?<br />
    <def:ValueSetLabel ID="ValueSetLabel_Charge_familymedhist_mother_migraine_preg" runat="server"  DatabaseField="Charge_familymedhist_mother_migraine_preg"></def:ValueSetLabel></td>
    <td><def:ValueSetLabel ID="ValueSetLabel_Charge_familymedhist_father_migraine" runat="server"  DatabaseField="Charge_familymedhist_father_migraine"></def:ValueSetLabel></td>
    <td><def:ValueSetLabel ID="ValueSetLabel_Charge_familymedhist_othmem_migraine" runat="server"  DatabaseField="Charge_familymedhist_othmem_migraine"></def:ValueSetLabel>
    If Yes, indicate Family Member Code</td>
</tr>
<tr>
    <td colspan="2">OTHER CONDITIONS</td>
    <td colspan="5" align="right"><a href="#aspnetForm">Top</a>|<a href="#alle">Allergies</a>|<a href="#auti">Autism</a>|<a href="#neur">Neuro</a>|<a href="#sens">Sensory</a>|<a href="#ment">Mental</a>|<a href="#othe">Other</a>|<a href="#code">Codes</a></td>
</tr>
<tr>
    <td>38. Migraine headaches</td>
    <td>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_child_migraine" DatabaseField="Charge_familymedhist_child_migraine" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxTextDefault="0" FieldTextBoxWidth="40px" FieldTextBoxMaxLength="10"></def:datafieldcontrol>
    </td>
    <td>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_mother_migraine" DatabaseField="Charge_familymedhist_mother_migraine" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxTextDefault="0" FieldTextBoxWidth="40px" FieldTextBoxMaxLength="10"></def:datafieldcontrol>
    </td>
    <td>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_mother_migraine_age" DatabaseField="Charge_familymedhist_mother_migraine_age" FieldTextBoxTextDefault="-9" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    </td>
    <td>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_mother_migraine_preg" DatabaseField="Charge_familymedhist_mother_migraine_preg" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxTextDefault="0" FieldTextBoxWidth="40px" FieldTextBoxMaxLength="10"></def:datafieldcontrol>
    </td>
    <td>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_father_migraine" DatabaseField="Charge_familymedhist_father_migraine" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxTextDefault="0" FieldTextBoxWidth="40px" FieldTextBoxMaxLength="10"></def:datafieldcontrol>
    </td>
    <td>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_othmem_migraine" DatabaseField="Charge_familymedhist_othmem_migraine" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxTextDefault="0" FieldTextBoxWidth="40px" FieldTextBoxMaxLength="10"></def:datafieldcontrol>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_othmem_migraine_type" DatabaseField="Charge_familymedhist_othmem_migraine_type" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="60px" FieldTextBoxMaxLength="100"></def:datafieldcontrol>
    </td>
</tr>
<tr>
    <td>39. Irritable bowel syndrome</td>
    <td>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_child_ibs" DatabaseField="Charge_familymedhist_child_ibs" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxTextDefault="0" FieldTextBoxWidth="40px" FieldTextBoxMaxLength="10"></def:datafieldcontrol>
    </td>
    <td>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_mother_ibs" DatabaseField="Charge_familymedhist_mother_ibs" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxTextDefault="0" FieldTextBoxWidth="40px" FieldTextBoxMaxLength="10"></def:datafieldcontrol>
    </td>
    <td>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_mother_ibs_age" DatabaseField="Charge_familymedhist_mother_ibs_age" FieldTextBoxTextDefault="-9" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    </td>
    <td>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_mother_ibs_preg" DatabaseField="Charge_familymedhist_mother_ibs_preg" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxTextDefault="0" FieldTextBoxWidth="40px" FieldTextBoxMaxLength="10"></def:datafieldcontrol>
    </td>
    <td>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_father_ibs" DatabaseField="Charge_familymedhist_father_ibs" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxTextDefault="0" FieldTextBoxWidth="40px" FieldTextBoxMaxLength="10"></def:datafieldcontrol>
    </td>
    <td>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_othmem_ibs" DatabaseField="Charge_familymedhist_othmem_ibs" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxTextDefault="0" FieldTextBoxWidth="40px" FieldTextBoxMaxLength="10"></def:datafieldcontrol>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_othmem_ibstype" DatabaseField="Charge_familymedhist_othmem_ibstype" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="60px" FieldTextBoxMaxLength="50"></def:datafieldcontrol>
    </td>
</tr>
<tr>
    <td>40. Other Gastrointestinal disorders</td>
    <td>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_child_othergidis" DatabaseField="Charge_familymedhist_child_othergidis" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxTextDefault="0" FieldTextBoxWidth="40px" FieldTextBoxMaxLength="10"></def:datafieldcontrol>
    </td>
    <td>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_mother_gidis" DatabaseField="Charge_familymedhist_mother_gidis" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxTextDefault="0" FieldTextBoxWidth="40px" FieldTextBoxMaxLength="10"></def:datafieldcontrol>
    </td>
    <td>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_mother_gidiss_age" DatabaseField="Charge_familymedhist_mother_gidiss_age" FieldTextBoxTextDefault="-9" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    </td>
    <td>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_mother_gidiss_preg" DatabaseField="Charge_familymedhist_mother_gidiss_preg" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxTextDefault="0" FieldTextBoxWidth="40px" FieldTextBoxMaxLength="10"></def:datafieldcontrol>
    </td>
    <td>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_father_othergidis" DatabaseField="Charge_familymedhist_father_othergidis" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxTextDefault="0" FieldTextBoxWidth="40px" FieldTextBoxMaxLength="10"></def:datafieldcontrol>
    </td>
    <td>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_othmem_othergidis" DatabaseField="Charge_familymedhist_othmem_othergidis" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxTextDefault="0" FieldTextBoxWidth="40px" FieldTextBoxMaxLength="10"></def:datafieldcontrol>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_othmem_othergidis_type" DatabaseField="Charge_familymedhist_othmem_othergidis_type" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="60px" FieldTextBoxMaxLength="100"></def:datafieldcontrol>
    </td>
</tr>
<tr>
    <td>41. Cancer (specify)</td>
    <td>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_child_cancer" DatabaseField="Charge_familymedhist_child_cancer" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxTextDefault="0" FieldTextBoxWidth="40px" FieldTextBoxMaxLength="10"></def:datafieldcontrol>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_child_cancer_cmt" DatabaseField="Charge_familymedhist_child_cancer_cmt" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxMaxLength="255"></def:datafieldcontrol>
    </td>
    <td>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_mother_cancer" DatabaseField="Charge_familymedhist_mother_cancer" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxTextDefault="0" FieldTextBoxWidth="40px" FieldTextBoxMaxLength="10"></def:datafieldcontrol>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_mother_cancer_cmt" DatabaseField="Charge_familymedhist_mother_cancer_cmt" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxMaxLength="255"></def:datafieldcontrol>
    </td>
    <td>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_mother_cancer_age" DatabaseField="Charge_familymedhist_mother_cancer_age" FieldTextBoxTextDefault="-9" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    </td>
    <td>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_mother_cancer_preg" DatabaseField="Charge_familymedhist_mother_cancer_preg" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxTextDefault="0" FieldTextBoxWidth="40px" FieldTextBoxMaxLength="10"></def:datafieldcontrol>
    </td>
    <td>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_father_cancer" DatabaseField="Charge_familymedhist_father_cancer" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxTextDefault="0" FieldTextBoxWidth="40px" FieldTextBoxMaxLength="10"></def:datafieldcontrol>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_father_cancer_cmt" DatabaseField="Charge_familymedhist_father_cancer_cmt" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxMaxLength="255"></def:datafieldcontrol>
    </td>
    <td>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_othmem_cancer" DatabaseField="Charge_familymedhist_othmem_cancer" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxTextDefault="0" FieldTextBoxWidth="40px" FieldTextBoxMaxLength="10"></def:datafieldcontrol>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_othmem_cancer_cmt" DatabaseField="Charge_familymedhist_othmem_cancer_cmt" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="60px" FieldTextBoxMaxLength="255"></def:datafieldcontrol>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_othmem_cancer_type" DatabaseField="Charge_familymedhist_othmem_cancer_type" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="60px" FieldTextBoxMaxLength="100"></def:datafieldcontrol>
    </td>
</tr>
<tr>
    <td>42. Congenital Defect (specify)</td>
    <td>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_child_congenitaldef" DatabaseField="Charge_familymedhist_child_congenitaldef" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxTextDefault="0" FieldTextBoxWidth="40px" FieldTextBoxMaxLength="10"></def:datafieldcontrol>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_child_congenitaldef_cmt" DatabaseField="Charge_familymedhist_child_congenitaldef_cmt" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxMaxLength="255"></def:datafieldcontrol>
    </td>
    <td>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_mother_congenitaldef" DatabaseField="Charge_familymedhist_mother_congenitaldef" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxTextDefault="0" FieldTextBoxWidth="40px" FieldTextBoxMaxLength="10"></def:datafieldcontrol>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_mother_congenitaldef_cmt" DatabaseField="Charge_familymedhist_mother_congenitaldef_cmt" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxMaxLength="255"></def:datafieldcontrol>
    </td>
    <td>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_mother_congenitaldef_age" DatabaseField="Charge_familymedhist_mother_congenitaldef_age" FieldTextBoxTextDefault="-9" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    </td>
    <td>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_mother_congenitaldef_preg" DatabaseField="Charge_familymedhist_mother_congenitaldef_preg" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxTextDefault="0" FieldTextBoxWidth="40px" FieldTextBoxMaxLength="10"></def:datafieldcontrol>
    </td>
    <td>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_father_congenitaldef" DatabaseField="Charge_familymedhist_father_congenitaldef" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxTextDefault="0" FieldTextBoxWidth="40px" FieldTextBoxMaxLength="10"></def:datafieldcontrol>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_father_congenitaldef_cmt" DatabaseField="Charge_familymedhist_father_congenitaldef_cmt" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxMaxLength="255"></def:datafieldcontrol>
    </td>
    <td>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_othmem_congenitaldef" DatabaseField="Charge_familymedhist_othmem_congenitaldef" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxTextDefault="0" FieldTextBoxWidth="40px" FieldTextBoxMaxLength="10"></def:datafieldcontrol>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_othmem_congenitaldef_cmt" DatabaseField="Charge_familymedhist_othmem_congenitaldef_cmt" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="60px" FieldTextBoxMaxLength="255"></def:datafieldcontrol>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_othmem_congenitaldef_type" DatabaseField="Charge_familymedhist_othmem_congenitaldef_type" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="60px" FieldTextBoxMaxLength="100"></def:datafieldcontrol>
    </td>
</tr>
<tr>
    <td>43. Obesity</td>
    <td>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_child_obesity" DatabaseField="Charge_familymedhist_child_obesity" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxTextDefault="0" FieldTextBoxWidth="40px" FieldTextBoxMaxLength="10"></def:datafieldcontrol>
    </td>
    <td>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_mother_obesity" DatabaseField="Charge_familymedhist_mother_obesity" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxTextDefault="0" FieldTextBoxWidth="40px" FieldTextBoxMaxLength="10"></def:datafieldcontrol>
    </td>
    <td>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_mother_obesity_age" DatabaseField="Charge_familymedhist_mother_obesity_age" FieldTextBoxTextDefault="-9" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    </td>
    <td>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_mother_obesity_preg" DatabaseField="Charge_familymedhist_mother_obesity_preg" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxTextDefault="0" FieldTextBoxWidth="40px" FieldTextBoxMaxLength="10"></def:datafieldcontrol>
    </td>
    <td>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_father_obesity" DatabaseField="Charge_familymedhist_father_obesity" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxTextDefault="0" FieldTextBoxWidth="40px" FieldTextBoxMaxLength="10"></def:datafieldcontrol>
    </td>
    <td>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_othmem_obesity" DatabaseField="Charge_familymedhist_othmem_obesity" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxTextDefault="0" FieldTextBoxWidth="40px" FieldTextBoxMaxLength="10"></def:datafieldcontrol>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_othmem_obesity_type" DatabaseField="Charge_familymedhist_othmem_obesity_type" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="60px" FieldTextBoxMaxLength="100"></def:datafieldcontrol>
    </td>
</tr>
<tr>
    <td>44. Sickle cell anemia</td>
    <td>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_child_sicklecell" DatabaseField="Charge_familymedhist_child_sicklecell" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxTextDefault="0" FieldTextBoxWidth="40px" FieldTextBoxMaxLength="10"></def:datafieldcontrol>
    </td>
    <td>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_mother_sicklecell" DatabaseField="Charge_familymedhist_mother_sicklecell" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxTextDefault="0" FieldTextBoxWidth="40px" FieldTextBoxMaxLength="10"></def:datafieldcontrol>
    </td>
    <td>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_mother_sicklecell_age" DatabaseField="Charge_familymedhist_mother_sicklecell_age" FieldTextBoxTextDefault="-9" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    </td>
    <td>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_mother_sicklecell_preg" DatabaseField="Charge_familymedhist_mother_sicklecell_preg" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxTextDefault="0" FieldTextBoxWidth="40px" FieldTextBoxMaxLength="10"></def:datafieldcontrol>
    </td>
    <td>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_father_sicklecell" DatabaseField="Charge_familymedhist_father_sicklecell" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxTextDefault="0" FieldTextBoxWidth="40px" FieldTextBoxMaxLength="10"></def:datafieldcontrol>
    </td>
    <td>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_othmem_sicklecell" DatabaseField="Charge_familymedhist_othmem_sicklecell" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxTextDefault="0" FieldTextBoxWidth="40px" FieldTextBoxMaxLength="10"></def:datafieldcontrol>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_othmem_sicklecell_type" DatabaseField="Charge_familymedhist_othmem_sicklecell_type" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="60px" FieldTextBoxMaxLength="100"></def:datafieldcontrol>
    </td>
</tr>
<tr>
    <td>45. Thyroid Disease</td>
    <td>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_child_thyroiddis" DatabaseField="Charge_familymedhist_child_thyroiddis" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxTextDefault="0" FieldTextBoxWidth="40px" FieldTextBoxMaxLength="10"></def:datafieldcontrol>
    </td>
    <td>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_mother_thyroiddis" DatabaseField="Charge_familymedhist_mother_thyroiddis" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxTextDefault="0" FieldTextBoxWidth="40px" FieldTextBoxMaxLength="10"></def:datafieldcontrol>
    </td>
    <td>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_mother_thyroiddis_age" DatabaseField="Charge_familymedhist_mother_thyroiddis_age" FieldTextBoxTextDefault="-9" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    </td>
    <td>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_mother_thyroiddis_preg" DatabaseField="Charge_familymedhist_mother_thyroiddis_preg" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxTextDefault="0" FieldTextBoxWidth="40px" FieldTextBoxMaxLength="10"></def:datafieldcontrol>
    </td>
    <td>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_father_thyroiddis" DatabaseField="Charge_familymedhist_father_thyroiddis" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxTextDefault="0" FieldTextBoxWidth="40px" FieldTextBoxMaxLength="10"></def:datafieldcontrol>
    </td>
    <td>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_othmem_thyroiddis" DatabaseField="Charge_familymedhist_othmem_thyroiddis" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxTextDefault="0" FieldTextBoxWidth="40px" FieldTextBoxMaxLength="10"></def:datafieldcontrol>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_othmem_thyroiddis_type" DatabaseField="Charge_familymedhist_othmem_thyroiddis_type" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="60px" FieldTextBoxMaxLength="100"></def:datafieldcontrol>
    </td>
</tr>
<tr>
    <td colspan="7">46. Other (specify)</td>
</tr>
<tr>
    <td>46a. <def:datafieldcontrol runat="server" id="Charge_familymedhist_other_condname1" DatabaseField="Charge_familymedhist_other_condname1" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxMaxLength="255"></def:datafieldcontrol></td>
    <td>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_child_othercond1" DatabaseField="Charge_familymedhist_child_othercond1" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxTextDefault="0" FieldTextBoxWidth="40px" FieldTextBoxMaxLength="10"></def:datafieldcontrol>
    </td>
    <td>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_mother_cond1" DatabaseField="Charge_familymedhist_mother_cond1" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxTextDefault="0" FieldTextBoxWidth="40px" FieldTextBoxMaxLength="10"></def:datafieldcontrol>
    </td>
    <td>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_mother_cond1_age" DatabaseField="Charge_familymedhist_mother_cond1_age" FieldTextBoxTextDefault="-9" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    </td>
    <td>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_mother_cond1_preg" DatabaseField="Charge_familymedhist_mother_cond1_preg" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxMaxLength="50"></def:datafieldcontrol>
    </td>
    <td>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_father_othercond1" DatabaseField="Charge_familymedhist_father_othercond1" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxTextDefault="0" FieldTextBoxWidth="40px" FieldTextBoxMaxLength="10"></def:datafieldcontrol>
    </td>
    <td>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_othmem_othercond1" DatabaseField="Charge_familymedhist_othmem_othercond1" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxTextDefault="0" FieldTextBoxWidth="40px" FieldTextBoxMaxLength="10"></def:datafieldcontrol>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_othmem_othercondlist1" DatabaseField="Charge_familymedhist_othmem_othercondlist1" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="60px" FieldTextBoxMaxLength="50"></def:datafieldcontrol>
    </td>
</tr>
<tr>
    <td>46b. <def:datafieldcontrol runat="server" id="Charge_familymedhist_other_condname2" DatabaseField="Charge_familymedhist_other_condname2" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxMaxLength="255"></def:datafieldcontrol></td>
    <td>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_child_othercond2" DatabaseField="Charge_familymedhist_child_othercond2" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxTextDefault="0" FieldTextBoxWidth="40px" FieldTextBoxMaxLength="10"></def:datafieldcontrol>
    </td>
    <td>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_mother_cond2" DatabaseField="Charge_familymedhist_mother_cond2" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxTextDefault="0" FieldTextBoxWidth="40px" FieldTextBoxMaxLength="10"></def:datafieldcontrol>
    </td>
    <td>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_mother_cond2_age" DatabaseField="Charge_familymedhist_mother_cond2_age" FieldTextBoxTextDefault="-9" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    </td>
    <td>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_mother_cond2_preg" DatabaseField="Charge_familymedhist_mother_cond2_preg" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxMaxLength="50"></def:datafieldcontrol>
    </td>
    <td>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_father_othercond2" DatabaseField="Charge_familymedhist_father_othercond2" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxTextDefault="0" FieldTextBoxWidth="40px" FieldTextBoxMaxLength="10"></def:datafieldcontrol>
    </td>
    <td>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_othmem_othercond2" DatabaseField="Charge_familymedhist_othmem_othercond2" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxTextDefault="0" FieldTextBoxWidth="40px" FieldTextBoxMaxLength="10"></def:datafieldcontrol>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_othmem_othercondlist2" DatabaseField="Charge_familymedhist_othmem_othercondlist2" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="60px" FieldTextBoxMaxLength="50"></def:datafieldcontrol>
    </td>
</tr>
<tr>
    <td>46c. <def:datafieldcontrol runat="server" id="Charge_familymedhist_other_condname3" DatabaseField="Charge_familymedhist_other_condname3" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxMaxLength="255"></def:datafieldcontrol></td>
    <td>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_child_othercond3" DatabaseField="Charge_familymedhist_child_othercond3" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxTextDefault="0" FieldTextBoxWidth="40px" FieldTextBoxMaxLength="10"></def:datafieldcontrol>
    </td>
    <td>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_mother_cond3" DatabaseField="Charge_familymedhist_mother_cond3" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxTextDefault="0" FieldTextBoxWidth="40px" FieldTextBoxMaxLength="10"></def:datafieldcontrol>
    </td>
    <td>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_mother_cond3_age" DatabaseField="Charge_familymedhist_mother_cond3_age" FieldTextBoxTextDefault="-9" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    </td>
    <td>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_mother_cond3_preg" DatabaseField="Charge_familymedhist_mother_cond3_preg" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxMaxLength="50"></def:datafieldcontrol>
    </td>
    <td>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_father_othercond3" DatabaseField="Charge_familymedhist_father_othercond3" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxTextDefault="0" FieldTextBoxWidth="40px" FieldTextBoxMaxLength="10"></def:datafieldcontrol>
    </td>
    <td>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_othmem_othercond3" DatabaseField="Charge_familymedhist_othmem_othercond3" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxTextDefault="0" FieldTextBoxWidth="40px" FieldTextBoxMaxLength="10"></def:datafieldcontrol>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_othmem_othercondlist3" DatabaseField="Charge_familymedhist_othmem_othercondlist3" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="60px" FieldTextBoxMaxLength="50"></def:datafieldcontrol>
    </td>
</tr>
<tr>
    <td>46d. <def:datafieldcontrol runat="server" id="Charge_familymedhist_other_condname4" DatabaseField="Charge_familymedhist_other_condname4" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxMaxLength="255"></def:datafieldcontrol></td>
    <td>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_child_othercond4" DatabaseField="Charge_familymedhist_child_othercond4" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxTextDefault="0" FieldTextBoxWidth="40px" FieldTextBoxMaxLength="10"></def:datafieldcontrol>
    </td>
    <td>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_mother_cond4" DatabaseField="Charge_familymedhist_mother_cond4" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxTextDefault="0" FieldTextBoxWidth="40px" FieldTextBoxMaxLength="10"></def:datafieldcontrol>
    </td>
    <td>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_mother_cond4_age" DatabaseField="Charge_familymedhist_mother_cond4_age" FieldTextBoxTextDefault="-9" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    </td>
    <td>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_mother_cond4_preg" DatabaseField="Charge_familymedhist_mother_cond4_preg" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxMaxLength="50"></def:datafieldcontrol>
    </td>
    <td>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_father_othercond4" DatabaseField="Charge_familymedhist_father_othercond4" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxTextDefault="0" FieldTextBoxWidth="40px" FieldTextBoxMaxLength="10"></def:datafieldcontrol>
    </td>
    <td>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_othmem_othercond4" DatabaseField="Charge_familymedhist_othmem_othercond4" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxTextDefault="0" FieldTextBoxWidth="40px" FieldTextBoxMaxLength="10"></def:datafieldcontrol>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_othmem_othercondlist4" DatabaseField="Charge_familymedhist_othmem_othercondlist4" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="60px" FieldTextBoxMaxLength="50"></def:datafieldcontrol>
    </td>
</tr>
<tr>
    <td>46e. <def:datafieldcontrol runat="server" id="Charge_familymedhist_other_condname5" DatabaseField="Charge_familymedhist_other_condname5" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxMaxLength="255"></def:datafieldcontrol></td>
    <td>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_child_othercond5" DatabaseField="Charge_familymedhist_child_othercond5" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxTextDefault="0" FieldTextBoxWidth="40px" FieldTextBoxMaxLength="10"></def:datafieldcontrol>
    </td>
    <td>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_mother_cond5" DatabaseField="Charge_familymedhist_mother_cond5" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxTextDefault="0" FieldTextBoxWidth="40px" FieldTextBoxMaxLength="10"></def:datafieldcontrol>
    </td>
    <td>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_mother_cond5_age" DatabaseField="Charge_familymedhist_mother_cond5_age" FieldTextBoxTextDefault="-9" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    </td>
    <td>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_mother_cond5_preg" DatabaseField="Charge_familymedhist_mother_cond5_preg" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxMaxLength="50"></def:datafieldcontrol>
    </td>
    <td>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_father_othercond5" DatabaseField="Charge_familymedhist_father_othercond5" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxTextDefault="0" FieldTextBoxWidth="40px" FieldTextBoxMaxLength="10"></def:datafieldcontrol>
    </td>
    <td>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_othmem_othercond5" DatabaseField="Charge_familymedhist_othmem_othercond5" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxTextDefault="0" FieldTextBoxWidth="40px" FieldTextBoxMaxLength="10"></def:datafieldcontrol>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_othmem_othercondlist5" DatabaseField="Charge_familymedhist_othmem_othercondlist5" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="60px" FieldTextBoxMaxLength="50"></def:datafieldcontrol>
    </td>
</tr>
<tr>
    <td>46f. <def:datafieldcontrol runat="server" id="Charge_familymedhist_other_condname6" DatabaseField="Charge_familymedhist_other_condname6" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxMaxLength="255"></def:datafieldcontrol></td>
    <td>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_child_othercond6" DatabaseField="Charge_familymedhist_child_othercond6" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxTextDefault="0" FieldTextBoxWidth="40px" FieldTextBoxMaxLength="10"></def:datafieldcontrol>
    </td>
    <td>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_mother_cond6" DatabaseField="Charge_familymedhist_mother_cond6" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxTextDefault="0" FieldTextBoxWidth="40px" FieldTextBoxMaxLength="10"></def:datafieldcontrol>
    </td>
    <td>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_mother_cond6_age" DatabaseField="Charge_familymedhist_mother_cond6_age" FieldTextBoxTextDefault="-9" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    </td>
    <td>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_mother_cond6_preg" DatabaseField="Charge_familymedhist_mother_cond6_preg" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxMaxLength="50"></def:datafieldcontrol>
    </td>
    <td>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_father_othercond6" DatabaseField="Charge_familymedhist_father_othercond6" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxTextDefault="0" FieldTextBoxWidth="40px" FieldTextBoxMaxLength="10"></def:datafieldcontrol>
    </td>
    <td>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_othmem_othercond6" DatabaseField="Charge_familymedhist_othmem_othercond6" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxTextDefault="0" FieldTextBoxWidth="40px" FieldTextBoxMaxLength="10"></def:datafieldcontrol>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_othmem_othercondlist6" DatabaseField="Charge_familymedhist_othmem_othercondlist6" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="60px" FieldTextBoxMaxLength="50"></def:datafieldcontrol>
    </td>
</tr>
<tr>
    <td>46g. <def:datafieldcontrol runat="server" id="Charge_familymedhist_other_condname7" DatabaseField="Charge_familymedhist_other_condname7" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxMaxLength="255"></def:datafieldcontrol></td>
    <td>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_child_othercond7" DatabaseField="Charge_familymedhist_child_othercond7" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxTextDefault="0" FieldTextBoxWidth="40px" FieldTextBoxMaxLength="10"></def:datafieldcontrol>
    </td>
    <td>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_mother_cond7" DatabaseField="Charge_familymedhist_mother_cond7" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxTextDefault="0" FieldTextBoxWidth="40px" FieldTextBoxMaxLength="10"></def:datafieldcontrol>
    </td>
    <td>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_mother_cond7_age" DatabaseField="Charge_familymedhist_mother_cond7_age" FieldTextBoxTextDefault="-9" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    </td>
    <td>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_mother_cond7_preg" DatabaseField="Charge_familymedhist_mother_cond7_preg" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxMaxLength="50"></def:datafieldcontrol>
    </td>
    <td>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_father_othercond7" DatabaseField="Charge_familymedhist_father_othercond7" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxTextDefault="0" FieldTextBoxWidth="40px" FieldTextBoxMaxLength="10"></def:datafieldcontrol>
    </td>
    <td>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_othmem_othercond7" DatabaseField="Charge_familymedhist_othmem_othercond7" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxTextDefault="0" FieldTextBoxWidth="40px" FieldTextBoxMaxLength="10"></def:datafieldcontrol>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_othmem_othercondlist7" DatabaseField="Charge_familymedhist_othmem_othercondlist7" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="60px" FieldTextBoxMaxLength="50"></def:datafieldcontrol>
    </td>
</tr>
<tr>
    <td>46h. <def:datafieldcontrol runat="server" id="Charge_familymedhist_other_condname8" DatabaseField="Charge_familymedhist_other_condname8" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxMaxLength="255"></def:datafieldcontrol></td>
    <td>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_child_othercond8" DatabaseField="Charge_familymedhist_child_othercond8" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxTextDefault="0" FieldTextBoxWidth="40px" FieldTextBoxMaxLength="10"></def:datafieldcontrol>
    </td>
    <td>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_mother_cond8" DatabaseField="Charge_familymedhist_mother_cond8" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxTextDefault="0" FieldTextBoxWidth="40px" FieldTextBoxMaxLength="10"></def:datafieldcontrol>
    </td>
    <td>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_mother_cond8_age" DatabaseField="Charge_familymedhist_mother_cond8_age" FieldTextBoxTextDefault="-9" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    </td>
    <td>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_mother_cond8_preg" DatabaseField="Charge_familymedhist_mother_cond8_preg" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxMaxLength="50"></def:datafieldcontrol>
    </td>
    <td>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_father_othercond8" DatabaseField="Charge_familymedhist_father_othercond8" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxTextDefault="0" FieldTextBoxWidth="40px" FieldTextBoxMaxLength="10"></def:datafieldcontrol>
    </td>
    <td>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_othmem_othercond8" DatabaseField="Charge_familymedhist_othmem_othercond8" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxTextDefault="0" FieldTextBoxWidth="40px" FieldTextBoxMaxLength="10"></def:datafieldcontrol>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_othmem_othercondlist8" DatabaseField="Charge_familymedhist_othmem_othercondlist8" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="60px" FieldTextBoxMaxLength="50"></def:datafieldcontrol>
    </td>
</tr>
<tr>
    <td>46i. <def:datafieldcontrol runat="server" id="Charge_familymedhist_other_condname9" DatabaseField="Charge_familymedhist_other_condname9" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxMaxLength="255"></def:datafieldcontrol></td>
    <td>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_child_othercond9" DatabaseField="Charge_familymedhist_child_othercond9" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxTextDefault="0" FieldTextBoxWidth="40px" FieldTextBoxMaxLength="10"></def:datafieldcontrol>
    </td>
    <td>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_mother_cond9" DatabaseField="Charge_familymedhist_mother_cond9" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxTextDefault="0" FieldTextBoxWidth="40px" FieldTextBoxMaxLength="10"></def:datafieldcontrol>
    </td>
    <td>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_mother_cond9_age" DatabaseField="Charge_familymedhist_mother_cond9_age" FieldTextBoxTextDefault="-9" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    </td>
    <td>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_mother_cond9_preg" DatabaseField="Charge_familymedhist_mother_cond9_preg" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxMaxLength="50"></def:datafieldcontrol>
    </td>
    <td>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_father_othercond9" DatabaseField="Charge_familymedhist_father_othercond9" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxTextDefault="0" FieldTextBoxWidth="40px" FieldTextBoxMaxLength="10"></def:datafieldcontrol>
    </td>
    <td>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_othmem_othercond9" DatabaseField="Charge_familymedhist_othmem_othercond9" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxTextDefault="0" FieldTextBoxWidth="40px" FieldTextBoxMaxLength="10"></def:datafieldcontrol>
        <def:datafieldcontrol runat="server" id="Charge_familymedhist_othmem_othercondlist9" DatabaseField="Charge_familymedhist_othmem_othercondlist9" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="60px" FieldTextBoxMaxLength="50"></def:datafieldcontrol>
    </td>
</tr>
<tr id="othe">
    <td>Condition</td>
    <td>Child</td>
    <td colspan="3" align="center">Biological Mother</td>
    <td>Biological Father</td>
    <td>Siblings, Aunts, Uncles and Grandparents</td>
</tr>
<tr>
    <td>&nbsp;</td>
    <td><def:ValueSetLabel ID="ValueSetLabel_Charge_familymedhist_child_thyroiddis" runat="server"  DatabaseField="Charge_familymedhist_child_thyroiddis"></def:ValueSetLabel></td>
    <td><def:ValueSetLabel ID="ValueSetLabel_Charge_familymedhist_mother_thyroiddis" runat="server"  DatabaseField="Charge_familymedhist_mother_thyroiddis"></def:ValueSetLabel></td>
    <td>Onset Age</td>
    <td>During pregnancy?<br />
    <def:ValueSetLabel ID="ValueSetLabel_Charge_familymedhist_mother_thyroiddis_preg" runat="server"  DatabaseField="Charge_familymedhist_mother_thyroiddis_preg"></def:ValueSetLabel></td>
    <td><def:ValueSetLabel ID="ValueSetLabel_Charge_familymedhist_father_thyroiddis" runat="server"  DatabaseField="Charge_familymedhist_father_thyroiddis"></def:ValueSetLabel></td>
    <td><def:ValueSetLabel ID="ValueSetLabel_Charge_familymedhist_othmem_thyroiddis" runat="server"  DatabaseField="Charge_familymedhist_othmem_thyroiddis"></def:ValueSetLabel>
    If Yes, indicate Family Member Code</td>
</tr>
<tr id="code">
    <td colspan="2">&nbsp;</td>
    <td colspan="5" align="right"><a href="#aspnetForm">Top</a>|<a href="#alle">Allergies</a>|<a href="#auti">Autism</a>|<a href="#neur">Neuro</a>|<a href="#sens">Sensory</a>|<a href="#ment">Mental</a>|<a href="#othe">Other</a>|<a href="#code">Codes</a></td>
</tr>
</table>
<br />
<table align="center" cellpadding="5" cellspacing="0" border="1">
<tr>
    <td colspan="4">SISTERS</td>
    <td colspan="4">BROTHERS</td>
</tr>
<tr>
    <td>Code</td>
    <td>Name</td>
    <td><def:ValueSetLabel ID="ValueSetLabel_Charge_familymedhist_fmw_child_sis1" runat="server"  DatabaseField="Charge_familymedhist_fmw_child_sis1"></def:ValueSetLabel></td>
    <td>Subject ID</td>
    <td>Code</td>
    <td>Name</td>
    <td><def:ValueSetLabel ID="ValueSetLabel_Charge_familymedhist_fmw_child_bro1" runat="server"  DatabaseField="Charge_familymedhist_fmw_child_bro1"></def:ValueSetLabel></td>
    <td>Subject ID</td>
</tr>
<tr>
    <td>S1</td>
    <td><def:datafieldcontrol runat="server" id="Charge_familymedhist_fmw_child_Name_sis1" DatabaseField="Charge_familymedhist_fmw_child_Name_sis1" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxMaxLength="50"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="Charge_familymedhist_fmw_child_sis1" DatabaseField="Charge_familymedhist_fmw_child_sis1" IsEntryField="true" IsDoubleEntryField="false" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="Charge_familymedhist_fmw_child_ID_sis1" DatabaseField="Charge_familymedhist_fmw_child_ID_sis1" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxMaxLength="15"></def:datafieldcontrol></td>
    <td>B1</td>
    <td><def:datafieldcontrol runat="server" id="Charge_familymedhist_fmw_child_Name_bro1" DatabaseField="Charge_familymedhist_fmw_child_Name_bro1" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxMaxLength="50"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="Charge_familymedhist_fmw_child_bro1" DatabaseField="Charge_familymedhist_fmw_child_bro1" IsEntryField="true" IsDoubleEntryField="false" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="Charge_familymedhist_fmw_child_ID_bro1" DatabaseField="Charge_familymedhist_fmw_child_ID_bro1" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxMaxLength="15"></def:datafieldcontrol></td>
</tr>
<tr>
    <td>S2</td>
    <td><def:datafieldcontrol runat="server" id="Charge_familymedhist_fmw_child_Name_sis2" DatabaseField="Charge_familymedhist_fmw_child_Name_sis2" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxMaxLength="50"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="Charge_familymedhist_fmw_child_sis2" DatabaseField="Charge_familymedhist_fmw_child_sis2" IsEntryField="true" IsDoubleEntryField="false" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="Charge_familymedhist_fmw_child_ID_sis2" DatabaseField="Charge_familymedhist_fmw_child_ID_sis2" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxMaxLength="15"></def:datafieldcontrol></td>
    <td>B2</td>
    <td><def:datafieldcontrol runat="server" id="Charge_familymedhist_fmw_child_Name_bro2" DatabaseField="Charge_familymedhist_fmw_child_Name_bro2" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxMaxLength="50"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="Charge_familymedhist_fmw_child_bro2" DatabaseField="Charge_familymedhist_fmw_child_bro2" IsEntryField="true" IsDoubleEntryField="false" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="Charge_familymedhist_fmw_child_ID_bro2" DatabaseField="Charge_familymedhist_fmw_child_ID_bro2" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxMaxLength="15"></def:datafieldcontrol></td>
</tr>
<tr>
    <td>S3</td>
    <td><def:datafieldcontrol runat="server" id="Charge_familymedhist_fmw_child_Name_sis3" DatabaseField="Charge_familymedhist_fmw_child_Name_sis3" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxMaxLength="50"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="Charge_familymedhist_fmw_child_sis3" DatabaseField="Charge_familymedhist_fmw_child_sis3" IsEntryField="true" IsDoubleEntryField="false" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="Charge_familymedhist_fmw_child_ID_sis3" DatabaseField="Charge_familymedhist_fmw_child_ID_sis3" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxMaxLength="15"></def:datafieldcontrol></td>
    <td>B3</td>
    <td><def:datafieldcontrol runat="server" id="Charge_familymedhist_fmw_child_Name_bro3" DatabaseField="Charge_familymedhist_fmw_child_Name_bro3" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxMaxLength="50"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="Charge_familymedhist_fmw_child_bro3" DatabaseField="Charge_familymedhist_fmw_child_bro3" IsEntryField="true" IsDoubleEntryField="false" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="Charge_familymedhist_fmw_child_ID_bro3" DatabaseField="Charge_familymedhist_fmw_child_ID_bro3" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxMaxLength="15"></def:datafieldcontrol></td>
</tr>
<tr>
    <td>S4</td>
    <td><def:datafieldcontrol runat="server" id="Charge_familymedhist_fmw_child_Name_sis4" DatabaseField="Charge_familymedhist_fmw_child_Name_sis4" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxMaxLength="50"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="Charge_familymedhist_fmw_child_sis4" DatabaseField="Charge_familymedhist_fmw_child_sis4" IsEntryField="true" IsDoubleEntryField="false" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="Charge_familymedhist_fmw_child_ID_sis4" DatabaseField="Charge_familymedhist_fmw_child_ID_sis4" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxMaxLength="15"></def:datafieldcontrol></td>
    <td>B4</td>
    <td><def:datafieldcontrol runat="server" id="Charge_familymedhist_fmw_child_Name_bro4" DatabaseField="Charge_familymedhist_fmw_child_Name_bro4" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxMaxLength="50"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="Charge_familymedhist_fmw_child_bro4" DatabaseField="Charge_familymedhist_fmw_child_bro4" IsEntryField="true" IsDoubleEntryField="false" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="Charge_familymedhist_fmw_child_ID_bro4" DatabaseField="Charge_familymedhist_fmw_child_ID_bro4" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxMaxLength="15"></def:datafieldcontrol></td>
</tr>
<tr>
    <td>S5</td>
    <td><def:datafieldcontrol runat="server" id="Charge_familymedhist_fmw_child_Name_sis5" DatabaseField="Charge_familymedhist_fmw_child_Name_sis5" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxMaxLength="50"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="Charge_familymedhist_fmw_child_sis5" DatabaseField="Charge_familymedhist_fmw_child_sis5" IsEntryField="true" IsDoubleEntryField="false" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="Charge_familymedhist_fmw_child_ID_sis5" DatabaseField="Charge_familymedhist_fmw_child_ID_sis5" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxMaxLength="15"></def:datafieldcontrol></td>
    <td>B5</td>
    <td><def:datafieldcontrol runat="server" id="Charge_familymedhist_fmw_child_Name_bro5" DatabaseField="Charge_familymedhist_fmw_child_Name_bro5" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxMaxLength="50"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="Charge_familymedhist_fmw_child_bro5" DatabaseField="Charge_familymedhist_fmw_child_bro5" IsEntryField="true" IsDoubleEntryField="false" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="Charge_familymedhist_fmw_child_ID_bro5" DatabaseField="Charge_familymedhist_fmw_child_ID_bro5" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxMaxLength="15"></def:datafieldcontrol></td>
</tr>
<tr>
    <td>S6</td>
    <td><def:datafieldcontrol runat="server" id="Charge_familymedhist_fmw_child_Name_sis6" DatabaseField="Charge_familymedhist_fmw_child_Name_sis6" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxMaxLength="50"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="Charge_familymedhist_fmw_child_sis6" DatabaseField="Charge_familymedhist_fmw_child_sis6" IsEntryField="true" IsDoubleEntryField="false" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="Charge_familymedhist_fmw_child_ID_sis6" DatabaseField="Charge_familymedhist_fmw_child_ID_sis6" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxMaxLength="15"></def:datafieldcontrol></td>
    <td>B6</td>
    <td><def:datafieldcontrol runat="server" id="Charge_familymedhist_fmw_child_Name_bro6" DatabaseField="Charge_familymedhist_fmw_child_Name_bro6" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxMaxLength="50"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="Charge_familymedhist_fmw_child_bro6" DatabaseField="Charge_familymedhist_fmw_child_bro6" IsEntryField="true" IsDoubleEntryField="false" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="Charge_familymedhist_fmw_child_ID_bro6" DatabaseField="Charge_familymedhist_fmw_child_ID_bro6" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxMaxLength="15"></def:datafieldcontrol></td>
</tr>
<tr>
    <td>S7</td>
    <td><def:datafieldcontrol runat="server" id="Charge_familymedhist_fmw_child_Name_sis7" DatabaseField="Charge_familymedhist_fmw_child_Name_sis7" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxMaxLength="50"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="Charge_familymedhist_fmw_child_sis7" DatabaseField="Charge_familymedhist_fmw_child_sis7" IsEntryField="true" IsDoubleEntryField="false" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="Charge_familymedhist_fmw_child_ID_sis7" DatabaseField="Charge_familymedhist_fmw_child_ID_sis7" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxMaxLength="15"></def:datafieldcontrol></td>
    <td>B7</td>
    <td><def:datafieldcontrol runat="server" id="Charge_familymedhist_fmw_child_Name_bro7" DatabaseField="Charge_familymedhist_fmw_child_Name_bro7" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxMaxLength="50"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="Charge_familymedhist_fmw_child_bro7" DatabaseField="Charge_familymedhist_fmw_child_bro7" IsEntryField="true" IsDoubleEntryField="false" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="Charge_familymedhist_fmw_child_ID_bro7" DatabaseField="Charge_familymedhist_fmw_child_ID_bro7" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxMaxLength="15"></def:datafieldcontrol></td>
</tr>
</table>

<br />
<table align="center" cellpadding="5" cellspacing="0" border="1">
<tr>
    <td colspan="6">Biologic Mother’s Family</td>
    <td colspan="6">Biologic Father’s Family</td>
</tr>
<tr>
    <td colspan="3">Aunts</td>
    <td colspan="3">Uncles</td>
    <td colspan="3">Aunts</td>
    <td colspan="3">Uncles</td>
</tr>
<tr>
    <td>Code</td>
    <td>Name</td>
    <td><def:ValueSetLabel ID="ValueSetLabel_Charge_familymedhist_fmw_child_MA1" runat="server"  DatabaseField="Charge_familymedhist_fmw_child_MA1"></def:ValueSetLabel></td>
    <td>Code</td>
    <td>Name</td>
    <td><def:ValueSetLabel ID="ValueSetLabel_Charge_familymedhist_fmw_child_MU1" runat="server"  DatabaseField="Charge_familymedhist_fmw_child_MU1"></def:ValueSetLabel></td>
    <td>Code</td>
    <td>Name</td>
    <td><def:ValueSetLabel ID="ValueSetLabel_Charge_familymedhist_fmw_child_PA1" runat="server"  DatabaseField="Charge_familymedhist_fmw_child_PA1"></def:ValueSetLabel></td>
    <td>Code</td>
    <td>Name</td>
    <td><def:ValueSetLabel ID="ValueSetLabel_Charge_familymedhist_fmw_child_PU1" runat="server"  DatabaseField="Charge_familymedhist_fmw_child_PU1"></def:ValueSetLabel></td>
</tr>
<tr>
    <td>MA1</td>
    <td><def:datafieldcontrol runat="server" id="Charge_familymedhist_fmw_child_Name_MA1" DatabaseField="Charge_familymedhist_fmw_child_Name_MA1" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxMaxLength="50"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="Charge_familymedhist_fmw_child_MA1" DatabaseField="Charge_familymedhist_fmw_child_MA1" IsEntryField="true" IsDoubleEntryField="false" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td>MU1</td>
    <td><def:datafieldcontrol runat="server" id="Charge_familymedhist_fmw_child_Name_MU1" DatabaseField="Charge_familymedhist_fmw_child_Name_MU1" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxMaxLength="50"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="Charge_familymedhist_fmw_child_MU1" DatabaseField="Charge_familymedhist_fmw_child_MU1" IsEntryField="true" IsDoubleEntryField="false" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td>PA1</td>
    <td><def:datafieldcontrol runat="server" id="Charge_familymedhist_fmw_child_Name_PA1" DatabaseField="Charge_familymedhist_fmw_child_Name_PA1" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxMaxLength="50"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="Charge_familymedhist_fmw_child_PA1" DatabaseField="Charge_familymedhist_fmw_child_PA1" IsEntryField="true" IsDoubleEntryField="false" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td>PU1</td>
    <td><def:datafieldcontrol runat="server" id="Charge_familymedhist_fmw_child_Name_PU1" DatabaseField="Charge_familymedhist_fmw_child_Name_PU1" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxMaxLength="50"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="Charge_familymedhist_fmw_child_PU1" DatabaseField="Charge_familymedhist_fmw_child_PU1" IsEntryField="true" IsDoubleEntryField="false" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
</tr>
<tr>
    <td>MA2</td>
    <td><def:datafieldcontrol runat="server" id="Charge_familymedhist_fmw_child_Name_MA2" DatabaseField="Charge_familymedhist_fmw_child_Name_MA2" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxMaxLength="50"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="Charge_familymedhist_fmw_child_MA2" DatabaseField="Charge_familymedhist_fmw_child_MA2" IsEntryField="true" IsDoubleEntryField="false" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td>MU2</td>
    <td><def:datafieldcontrol runat="server" id="Charge_familymedhist_fmw_child_Name_MU2" DatabaseField="Charge_familymedhist_fmw_child_Name_MU2" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxMaxLength="50"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="Charge_familymedhist_fmw_child_MU2" DatabaseField="Charge_familymedhist_fmw_child_MU2" IsEntryField="true" IsDoubleEntryField="false" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td>PA2</td>
    <td><def:datafieldcontrol runat="server" id="Charge_familymedhist_fmw_child_Name_PA2" DatabaseField="Charge_familymedhist_fmw_child_Name_PA2" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxMaxLength="50"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="Charge_familymedhist_fmw_child_PA2" DatabaseField="Charge_familymedhist_fmw_child_PA2" IsEntryField="true" IsDoubleEntryField="false" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td>PU2</td>
    <td><def:datafieldcontrol runat="server" id="Charge_familymedhist_fmw_child_Name_PU2" DatabaseField="Charge_familymedhist_fmw_child_Name_PU2" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxMaxLength="50"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="Charge_familymedhist_fmw_child_PU2" DatabaseField="Charge_familymedhist_fmw_child_PU2" IsEntryField="true" IsDoubleEntryField="false" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
</tr>
<tr>
    <td>MA3</td>
    <td><def:datafieldcontrol runat="server" id="Charge_familymedhist_fmw_child_Name_MA3" DatabaseField="Charge_familymedhist_fmw_child_Name_MA3" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxMaxLength="50"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="Charge_familymedhist_fmw_child_MA3" DatabaseField="Charge_familymedhist_fmw_child_MA3" IsEntryField="true" IsDoubleEntryField="false" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td>MU3</td>
    <td><def:datafieldcontrol runat="server" id="Charge_familymedhist_fmw_child_Name_MU3" DatabaseField="Charge_familymedhist_fmw_child_Name_MU3" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxMaxLength="50"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="Charge_familymedhist_fmw_child_MU3" DatabaseField="Charge_familymedhist_fmw_child_MU3" IsEntryField="true" IsDoubleEntryField="false" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td>PA3</td>
    <td><def:datafieldcontrol runat="server" id="Charge_familymedhist_fmw_child_Name_PA3" DatabaseField="Charge_familymedhist_fmw_child_Name_PA3" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxMaxLength="50"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="Charge_familymedhist_fmw_child_PA3" DatabaseField="Charge_familymedhist_fmw_child_PA3" IsEntryField="true" IsDoubleEntryField="false" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td>PU3</td>
    <td><def:datafieldcontrol runat="server" id="Charge_familymedhist_fmw_child_Name_PU3" DatabaseField="Charge_familymedhist_fmw_child_Name_PU3" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxMaxLength="50"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="Charge_familymedhist_fmw_child_PU3" DatabaseField="Charge_familymedhist_fmw_child_PU3" IsEntryField="true" IsDoubleEntryField="false" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
</tr>
<tr>
    <td>MA4</td>
    <td><def:datafieldcontrol runat="server" id="Charge_familymedhist_fmw_child_Name_MA4" DatabaseField="Charge_familymedhist_fmw_child_Name_MA4" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxMaxLength="50"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="Charge_familymedhist_fmw_child_MA4" DatabaseField="Charge_familymedhist_fmw_child_MA4" IsEntryField="true" IsDoubleEntryField="false" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td>MU4</td>
    <td><def:datafieldcontrol runat="server" id="Charge_familymedhist_fmw_child_Name_MU4" DatabaseField="Charge_familymedhist_fmw_child_Name_MU4" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxMaxLength="50"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="Charge_familymedhist_fmw_child_MU4" DatabaseField="Charge_familymedhist_fmw_child_MU4" IsEntryField="true" IsDoubleEntryField="false" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td>PA4</td>
    <td><def:datafieldcontrol runat="server" id="Charge_familymedhist_fmw_child_Name_PA4" DatabaseField="Charge_familymedhist_fmw_child_Name_PA4" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxMaxLength="50"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="Charge_familymedhist_fmw_child_PA4" DatabaseField="Charge_familymedhist_fmw_child_PA4" IsEntryField="true" IsDoubleEntryField="false" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td>PU4</td>
    <td><def:datafieldcontrol runat="server" id="Charge_familymedhist_fmw_child_Name_PU4" DatabaseField="Charge_familymedhist_fmw_child_Name_PU4" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxMaxLength="50"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="Charge_familymedhist_fmw_child_PU4" DatabaseField="Charge_familymedhist_fmw_child_PU4" IsEntryField="true" IsDoubleEntryField="false" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
</tr>
<tr>
    <td>MA5</td>
    <td><def:datafieldcontrol runat="server" id="Charge_familymedhist_fmw_child_Name_MA5" DatabaseField="Charge_familymedhist_fmw_child_Name_MA5" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxMaxLength="50"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="Charge_familymedhist_fmw_child_MA5" DatabaseField="Charge_familymedhist_fmw_child_MA5" IsEntryField="true" IsDoubleEntryField="false" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td>MU5</td>
    <td><def:datafieldcontrol runat="server" id="Charge_familymedhist_fmw_child_Name_MU5" DatabaseField="Charge_familymedhist_fmw_child_Name_MU5" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxMaxLength="50"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="Charge_familymedhist_fmw_child_MU5" DatabaseField="Charge_familymedhist_fmw_child_MU5" IsEntryField="true" IsDoubleEntryField="false" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td>PA5</td>
    <td><def:datafieldcontrol runat="server" id="Charge_familymedhist_fmw_child_Name_PA5" DatabaseField="Charge_familymedhist_fmw_child_Name_PA5" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxMaxLength="50"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="Charge_familymedhist_fmw_child_PA5" DatabaseField="Charge_familymedhist_fmw_child_PA5" IsEntryField="true" IsDoubleEntryField="false" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td>PU5</td>
    <td><def:datafieldcontrol runat="server" id="Charge_familymedhist_fmw_child_Name_PU5" DatabaseField="Charge_familymedhist_fmw_child_Name_PU5" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxMaxLength="50"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="Charge_familymedhist_fmw_child_PU5" DatabaseField="Charge_familymedhist_fmw_child_PU5" IsEntryField="true" IsDoubleEntryField="false" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
</tr>
<tr>
    <td>MA6</td>
    <td><def:datafieldcontrol runat="server" id="Charge_familymedhist_fmw_child_Name_MA6" DatabaseField="Charge_familymedhist_fmw_child_Name_MA6" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxMaxLength="50"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="Charge_familymedhist_fmw_child_MA6" DatabaseField="Charge_familymedhist_fmw_child_MA6" IsEntryField="true" IsDoubleEntryField="false" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td>MU6</td>
    <td><def:datafieldcontrol runat="server" id="Charge_familymedhist_fmw_child_Name_MU6" DatabaseField="Charge_familymedhist_fmw_child_Name_MU6" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxMaxLength="50"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="Charge_familymedhist_fmw_child_MU6" DatabaseField="Charge_familymedhist_fmw_child_MU6" IsEntryField="true" IsDoubleEntryField="false" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td>PA6</td>
    <td><def:datafieldcontrol runat="server" id="Charge_familymedhist_fmw_child_Name_PA6" DatabaseField="Charge_familymedhist_fmw_child_Name_PA6" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxMaxLength="50"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="Charge_familymedhist_fmw_child_PA6" DatabaseField="Charge_familymedhist_fmw_child_PA6" IsEntryField="true" IsDoubleEntryField="false" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td>PU6</td>
    <td><def:datafieldcontrol runat="server"  id="Charge_familymedhist_fmw_child_Name_PU6" DatabaseField="Charge_familymedhist_fmw_child_Name_PU6" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxMaxLength="50"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="Charge_familymedhist_fmw_child_PU6" DatabaseField="Charge_familymedhist_fmw_child_PU6" IsEntryField="true" IsDoubleEntryField="false" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
</tr>
<tr>
    <td>MA7</td>
    <td><def:datafieldcontrol runat="server" id="Charge_familymedhist_fmw_child_Name_MA7" DatabaseField="Charge_familymedhist_fmw_child_Name_MA7" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxMaxLength="50"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="Charge_familymedhist_fmw_child_MA7" DatabaseField="Charge_familymedhist_fmw_child_MA7" IsEntryField="true" IsDoubleEntryField="false" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td>MU7</td>
    <td><def:datafieldcontrol runat="server" id="Charge_familymedhist_fmw_child_Name_MU7" DatabaseField="Charge_familymedhist_fmw_child_Name_MU7" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxMaxLength="50"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="Charge_familymedhist_fmw_child_MU7" DatabaseField="Charge_familymedhist_fmw_child_MU7" IsEntryField="true" IsDoubleEntryField="false" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td>PA7</td>
    <td><def:datafieldcontrol runat="server" id="Charge_familymedhist_fmw_child_Name_PA7" DatabaseField="Charge_familymedhist_fmw_child_Name_PA7" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxMaxLength="50"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="Charge_familymedhist_fmw_child_PA7" DatabaseField="Charge_familymedhist_fmw_child_PA7" IsEntryField="true" IsDoubleEntryField="false" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td>PU7</td>
    <td><def:datafieldcontrol runat="server" id="Charge_familymedhist_fmw_child_Name_PU7" DatabaseField="Charge_familymedhist_fmw_child_Name_PU7" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxMaxLength="50"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="Charge_familymedhist_fmw_child_PU7" DatabaseField="Charge_familymedhist_fmw_child_PU7" IsEntryField="true" IsDoubleEntryField="false" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
</tr>
</table>
<br />
</asp:panel>
</div class="main">
    <def:datafieldcontrol runat="server" id="created" DatabaseField="created" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="300px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="createdBy" DatabaseField="createdBy" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="300px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="50"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="updated" DatabaseField="updated" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="300px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="updatedBy" DatabaseField="updatedBy" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="300px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="50"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="scored" DatabaseField="scored" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="300px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="scoredBy" DatabaseField="scoredBy" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="300px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="50"></def:datafieldcontrol>
</div>
</asp:Content>
