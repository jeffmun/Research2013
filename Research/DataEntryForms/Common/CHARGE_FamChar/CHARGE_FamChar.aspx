<%@ Register TagPrefix="def" Namespace="DataEntryFramework3" %> 
<%@ Page language="c#" MasterPageFile="~/UWAC.master"  Title="CHARGE_Fam Data Entry" %>
<asp:Content ID="Content1" ContentPlaceHolderID="oBodyPlaceHolder" runat="server">
<style type="text/css">
  .head1 { background-color:#AAAAAA;font-weight:bolder }
  .head2 { background-color:#AAAAAA;font-weight:bolder }
  .col1 { background-color:#FFFFFF }
  .col2 { background-color:#EEEEEE }
  .nobr { white-space:nowrap }
</style>
<def:dataentrycontroller id="DataEntryController1" runat="server" DatabaseTable="ALL_CHARGE_FamChar" >
</def:dataentrycontroller>
<def:datafieldcontrol runat="server" id="id" DatabaseField="id"  IsInsertField="true"   FieldLabelWidth="300px "></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="indexnum" DatabaseField="indexnum"  IsInsertField="true"   FieldLabelWidth="300px "></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="Interviewer" DatabaseField="Interviewer"  IsInsertField="true"  FieldLabelWidth="300px "></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="Respondent" DatabaseField="Respondent"  IsInsertField="true"  FieldLabelWidth="300px "></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="InterviewDate" DatabaseField="InterviewDate"  IsInsertField="true"  FieldLabelWidth="300px "></def:datafieldcontrol>
<asp:Panel id="mainPanel" runat="server">
<br />
<p>
Be sure to enter questions for the affected child and biological parents.  Unneeded sibling columns may be left blank.
More siblings and overall notes are accessible by scrolling down.
</p>
<table border="1px" cellpadding="5px" cellspacing="0px">
  <tr>
    <td class="head1">
      Questions
    </td>
    <td class="head2" width="85px">
      Child with Autism      
    </td>
    <td class="head1" width="85px">
      Sibling 1
    </td>
    <td class="head2" width="85px">
      Sibling 2
    </td>
    <td class="head1" width="85px">
      Sibling 3
    </td>
    <td class="head1" width="85px">
      Biological Mother
    </td>
    <td class="head2" width="85px">
      Biological Father
    </td>
    <td class="head2" width="160px">
      Notes
    </td>
  </tr>
  <tr>
    <td class="col1">
      1. Relationship to the child with Autism? (0=Full, 1=Half-Maternal, 2=Half-Paternal, <span class="nobr">-9</span>=Missing Value)
    </td>
    <td class="col2"> 
      &nbsp;<!-- Child with autism -->
    </td>
    <td class="col1">
      <def:datafieldcontrol runat="server" id="Charge_familychar_ques_subrel1" DatabaseField="Charge_familychar_ques_subrel1"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="0px" FieldTextBoxWidth="75px"></def:datafieldcontrol>      
    </td>
    <td class="col2">
      <def:datafieldcontrol runat="server" id="Charge_familychar_ques_subrel2" DatabaseField="Charge_familychar_ques_subrel2"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="0px" FieldTextBoxWidth="75px"></def:datafieldcontrol>    
    </td>
    <td class="col1">
      <def:datafieldcontrol runat="server" id="Charge_familychar_ques_subrel3" DatabaseField="Charge_familychar_ques_subrel3"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="0px" FieldTextBoxWidth="75px"></def:datafieldcontrol>    
    </td>
    <td class="col1">
      &nbsp;<!-- Biological Mother -->
    </td>
    <td class="col2">
      &nbsp;<!-- Biological Father -->
    </td>
    <td class="col2">
      &nbsp;<!-- No notes for this item. -->
    </td>
  </tr>
  <tr>
    <td class="col1">
      2. NDAR Subject ID
    </td>
    <td class="col2"> 
      <def:datafieldcontrol runat="server" id="Charge_familychar_ques_childA" DatabaseField="Charge_familychar_ques_childA"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="0px" FieldTextBoxWidth="75px"></def:datafieldcontrol>
    </td>
    <td class="col1">
      <def:datafieldcontrol runat="server" id="Charge_familychar_ques_sub1" DatabaseField="Charge_familychar_ques_sub1"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="0px" FieldTextBoxWidth="75px"></def:datafieldcontrol>
    </td>
    <td class="col2">
      <def:datafieldcontrol runat="server" id="Charge_familychar_ques_sub2" DatabaseField="Charge_familychar_ques_sub2"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="0px" FieldTextBoxWidth="75px"></def:datafieldcontrol>
    </td>
    <td class="col1">
      <def:datafieldcontrol runat="server" id="Charge_familychar_ques_sub3" DatabaseField="Charge_familychar_ques_sub3"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="0px" FieldTextBoxWidth="75px"></def:datafieldcontrol>
    </td>
    <td class="col2">
      <def:datafieldcontrol runat="server" id="Charge_familychar_ques_bm" DatabaseField="Charge_familychar_ques_bm"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="0px" FieldTextBoxWidth="75px"></def:datafieldcontrol>
    </td>
    <td class="col1">
      <def:datafieldcontrol runat="server" id="Charge_familychar_ques_bf" DatabaseField="Charge_familychar_ques_bf"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="0px" FieldTextBoxWidth="75px"></def:datafieldcontrol>
    </td>
    <td class="col2">
      <def:datafieldcontrol runat="server" id="Charge_familychar_ques_subnotes" DatabaseField="Charge_familychar_ques_subnotes"  IsEntryField="true" IsDoubleEntryField="false"  FieldLabelWidth="0px" FieldTextBoxWidth="150px" FieldTextBoxMaxLength="256" FieldTextBoxHeight="60px" FieldTextBoxTextMode="MultiLine"></def:datafieldcontrol>
    </td>
  </tr>
  <tr>
    <td class="col1">
      3. Age (months)
    </td>
    <td class="col2"> 
      <def:datafieldcontrol runat="server" id="Charge_familychar_ques_ageA" DatabaseField="Charge_familychar_ques_ageA"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="0px" FieldTextBoxWidth="75px"></def:datafieldcontrol>
    </td>
    <td class="col1">
      <def:datafieldcontrol runat="server" id="Charge_familychar_ques_age1" DatabaseField="Charge_familychar_ques_age1"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="0px" FieldTextBoxWidth="75px"></def:datafieldcontrol>
    </td>
    <td class="col2">
      <def:datafieldcontrol runat="server" id="Charge_familychar_ques_age2" DatabaseField="Charge_familychar_ques_age2"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="0px" FieldTextBoxWidth="75px"></def:datafieldcontrol>
    </td>
    <td class="col1">
      <def:datafieldcontrol runat="server" id="Charge_familychar_ques_age3" DatabaseField="Charge_familychar_ques_age3"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="0px" FieldTextBoxWidth="75px"></def:datafieldcontrol>
    </td>
    <td class="col2">
      <def:datafieldcontrol runat="server" id="Charge_familychar_ques_agebm" DatabaseField="Charge_familychar_ques_agebm"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="0px" FieldTextBoxWidth="75px"></def:datafieldcontrol>
    </td>
    <td class="col1">
      <def:datafieldcontrol runat="server" id="Charge_familychar_ques_agebf" DatabaseField="Charge_familychar_ques_agebf"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="0px" FieldTextBoxWidth="75px"></def:datafieldcontrol>
    </td>
    <td class="col2">
      <def:datafieldcontrol runat="server" id="Charge_familychar_ques_agenotes" DatabaseField="Charge_familychar_ques_agenotes"  IsEntryField="true" IsDoubleEntryField="false"  FieldLabelWidth="0px" FieldTextBoxWidth="150px" FieldTextBoxMaxLength="256" FieldTextBoxHeight="60px" FieldTextBoxTextMode="MultiLine"></def:datafieldcontrol>
    </td>
  </tr>
  <tr>
    <td class="col1">
      4. Gender (0=Female, 1=Male, <span class="nobr">-9</span>=Missing Value)
    </td>
    <td class="col2"> 
      <def:datafieldcontrol runat="server" id="Charge_familychar_ques_genderA" DatabaseField="Charge_familychar_ques_genderA"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="0px" FieldTextBoxWidth="75px"></def:datafieldcontrol>
    </td>
    <td class="col1">
      <def:datafieldcontrol runat="server" id="Charge_familychar_ques_gender1" DatabaseField="Charge_familychar_ques_gender1"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="0px" FieldTextBoxWidth="75px"></def:datafieldcontrol>
    </td>
    <td class="col2">
      <def:datafieldcontrol runat="server" id="Charge_familychar_ques_gender2" DatabaseField="Charge_familychar_ques_gender2"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="0px" FieldTextBoxWidth="75px"></def:datafieldcontrol>
    </td>
    <td class="col1">
      <def:datafieldcontrol runat="server" id="Charge_familychar_ques_gender3" DatabaseField="Charge_familychar_ques_gender3"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="0px" FieldTextBoxWidth="75px"></def:datafieldcontrol>
    </td>
    <td class="col2">
      <def:datafieldcontrol runat="server" id="Charge_familychar_ques_genderbm" DatabaseField="Charge_familychar_ques_genderbm"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="0px" FieldTextBoxWidth="75px"></def:datafieldcontrol>
    </td>
    <td class="col1">
      <def:datafieldcontrol runat="server" id="Charge_familychar_ques_genderbf" DatabaseField="Charge_familychar_ques_genderbf"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="0px" FieldTextBoxWidth="75px"></def:datafieldcontrol>
    </td>
    <td class="col2">
      <def:datafieldcontrol runat="server" id="Charge_familychar_ques_gendernotes" DatabaseField="Charge_familychar_ques_gendernotes"  IsEntryField="true" IsDoubleEntryField="false"  FieldLabelWidth="0px" FieldTextBoxWidth="150px" FieldTextBoxMaxLength="256" FieldTextBoxHeight="60px" FieldTextBoxTextMode="MultiLine"></def:datafieldcontrol>
    </td>
  </tr>
  <tr>
    <td class="col1">
      5. Handedness (0=Left-Handed, 1=Right-Handed, 2=Ambidextrous, <span class="nobr">-1</span>=Not Applicable, <span class="nobr">-9</span>=Missing Value)
    </td>
    <td class="col2"> 
      <def:datafieldcontrol runat="server" id="Charge_familychar_ques_rlaA" DatabaseField="Charge_familychar_ques_rlaA"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="0px" FieldTextBoxWidth="75px"></def:datafieldcontrol>
    </td>
    <td class="col1">
      <def:datafieldcontrol runat="server" id="Charge_familychar_ques_rla1" DatabaseField="Charge_familychar_ques_rla1"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="0px" FieldTextBoxWidth="75px"></def:datafieldcontrol>
    </td>
    <td class="col2">
      <def:datafieldcontrol runat="server" id="Charge_familychar_ques_rla2" DatabaseField="Charge_familychar_ques_rla2"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="0px" FieldTextBoxWidth="75px"></def:datafieldcontrol>
    </td>
    <td class="col1">
      <def:datafieldcontrol runat="server" id="Charge_familychar_ques_rla3" DatabaseField="Charge_familychar_ques_rla3"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="0px" FieldTextBoxWidth="75px"></def:datafieldcontrol>
    </td>
    <td class="col2">
      <def:datafieldcontrol runat="server" id="Charge_familychar_ques_rlabm" DatabaseField="Charge_familychar_ques_rlabm"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="0px" FieldTextBoxWidth="75px"></def:datafieldcontrol>
    </td>
    <td class="col1">
      <def:datafieldcontrol runat="server" id="Charge_familychar_ques_rlabf" DatabaseField="Charge_familychar_ques_rlabf"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="0px" FieldTextBoxWidth="75px"></def:datafieldcontrol>
    </td>
    <td class="col2">
      <def:datafieldcontrol runat="server" id="Charge_familychar_ques_rlanotes" DatabaseField="Charge_familychar_ques_rlanotes"  IsEntryField="true" IsDoubleEntryField="false"  FieldLabelWidth="0px" FieldTextBoxWidth="150px" FieldTextBoxMaxLength="256" FieldTextBoxHeight="60px" FieldTextBoxTextMode="MultiLine"></def:datafieldcontrol>
    </td>
  </tr>
  <tr>
    <td class="col1">
      6. Eligible for special education (0=No, 1=Yes, <span class="nobr">-9</span>=Missing Value)
    </td>
    <td class="col2"> 
      <def:datafieldcontrol runat="server" id="Charge_familychar_ques_eduA" DatabaseField="Charge_familychar_ques_eduA"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="0px" FieldTextBoxWidth="75px"></def:datafieldcontrol>
    </td>
    <td class="col1">
      <def:datafieldcontrol runat="server" id="Charge_familychar_ques_edu1" DatabaseField="Charge_familychar_ques_edu1"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="0px" FieldTextBoxWidth="75px"></def:datafieldcontrol>
    </td>
    <td class="col2">
      <def:datafieldcontrol runat="server" id="Charge_familychar_ques_edu2" DatabaseField="Charge_familychar_ques_edu2"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="0px" FieldTextBoxWidth="75px"></def:datafieldcontrol>
    </td>
    <td class="col1">
      <def:datafieldcontrol runat="server" id="Charge_familychar_ques_edu3" DatabaseField="Charge_familychar_ques_edu3"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="0px" FieldTextBoxWidth="75px"></def:datafieldcontrol>
    </td>
        <td class="col2">
      <def:datafieldcontrol runat="server" id="Charge_familychar_ques_edubm" DatabaseField="Charge_familychar_ques_edubm"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="0px" FieldTextBoxWidth="75px"></def:datafieldcontrol>
    </td>
    <td class="col1">
      <def:datafieldcontrol runat="server" id="Charge_familychar_ques_edubf" DatabaseField="Charge_familychar_ques_edubf"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="0px" FieldTextBoxWidth="75px"></def:datafieldcontrol>
    </td>

    <td class="col2">
      <def:datafieldcontrol runat="server" id="Charge_familychar_ques_edunotes" DatabaseField="Charge_familychar_ques_edunotes"  IsEntryField="true" IsDoubleEntryField="false"  FieldLabelWidth="0px" FieldTextBoxWidth="150px" FieldTextBoxMaxLength="256" FieldTextBoxHeight="60px" FieldTextBoxTextMode="MultiLine"></def:datafieldcontrol>
    </td>
  </tr>
  <tr>
    <td class="col1">
      6.a. Age when eligible for special education (months)
    </td>
    <td class="col2"> 
      <def:datafieldcontrol runat="server" id="Charge_familychar_ques_eduageA" DatabaseField="Charge_familychar_ques_eduageA"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="0px" FieldTextBoxWidth="75px"></def:datafieldcontrol>
    </td>
    <td class="col1">
      <def:datafieldcontrol runat="server" id="Charge_familychar_ques_eduage1" DatabaseField="Charge_familychar_ques_eduage1"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="0px" FieldTextBoxWidth="75px"></def:datafieldcontrol>
    </td>
    <td class="col2">
      <def:datafieldcontrol runat="server" id="Charge_familychar_ques_eduage2" DatabaseField="Charge_familychar_ques_eduage2"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="0px" FieldTextBoxWidth="75px"></def:datafieldcontrol>
    </td>
    <td class="col1">
      <def:datafieldcontrol runat="server" id="Charge_familychar_ques_eduage3" DatabaseField="Charge_familychar_ques_eduage3"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="0px" FieldTextBoxWidth="75px"></def:datafieldcontrol>
    </td>
    <td class="col2">
      <def:datafieldcontrol runat="server" id="Charge_familychar_ques_eduagebm" DatabaseField="Charge_familychar_ques_eduagebm"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="0px" FieldTextBoxWidth="75px"></def:datafieldcontrol>
    </td>
    <td class="col1">
      <def:datafieldcontrol runat="server" id="Charge_familychar_ques_eduagebf" DatabaseField="Charge_familychar_ques_eduagebf"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="0px" FieldTextBoxWidth="75px"></def:datafieldcontrol>
    </td>
    <td class="col2">
      <def:datafieldcontrol runat="server" id="Charge_familychar_ques_eduagenotes" DatabaseField="Charge_familychar_ques_eduagenotes"  IsEntryField="true" IsDoubleEntryField="false"  FieldLabelWidth="0px" FieldTextBoxWidth="150px" FieldTextBoxMaxLength="256" FieldTextBoxHeight="60px" FieldTextBoxTextMode="MultiLine"></def:datafieldcontrol>
    </td>
  </tr>
  <tr>
    <td class="col1">
      7. Repeated a grade in school (0=No, 1=Yes, <span class="nobr">-1</span>=Not Applicable, <span class="nobr">-9</span>=Missing Value)
    </td>
    <td class="col2"> 
      <def:datafieldcontrol runat="server" id="Charge_familychar_ques_graderA" DatabaseField="Charge_familychar_ques_graderA"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="0px" FieldTextBoxWidth="75px"></def:datafieldcontrol>
    </td>
    <td class="col1">
      <def:datafieldcontrol runat="server" id="Charge_familychar_ques_grader1" DatabaseField="Charge_familychar_ques_grader1"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="0px" FieldTextBoxWidth="75px"></def:datafieldcontrol>
    </td>
    <td class="col2">
      <def:datafieldcontrol runat="server" id="Charge_familychar_ques_grader2" DatabaseField="Charge_familychar_ques_grader2"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="0px" FieldTextBoxWidth="75px"></def:datafieldcontrol>
    </td>
    <td class="col1">
      <def:datafieldcontrol runat="server" id="Charge_familychar_ques_grader3" DatabaseField="Charge_familychar_ques_grader3"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="0px" FieldTextBoxWidth="75px"></def:datafieldcontrol>
    </td>
    <td class="col2">
      <def:datafieldcontrol runat="server" id="Charge_familychar_ques_graderbm" DatabaseField="Charge_familychar_ques_graderbm"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="0px" FieldTextBoxWidth="75px"></def:datafieldcontrol>
    </td>
    <td class="col1">
      <def:datafieldcontrol runat="server" id="Charge_familychar_ques_graderbf" DatabaseField="Charge_familychar_ques_graderbf"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="0px" FieldTextBoxWidth="75px"></def:datafieldcontrol>
    </td>
    <td class="col2">
      <def:datafieldcontrol runat="server" id="Charge_familychar_ques_gradernotes" DatabaseField="Charge_familychar_ques_gradernotes"  IsEntryField="true" IsDoubleEntryField="false"  FieldLabelWidth="0px" FieldTextBoxWidth="150px" FieldTextBoxMaxLength="256" FieldTextBoxHeight="60px" FieldTextBoxTextMode="MultiLine"></def:datafieldcontrol>
    </td>
  </tr>
  <tr>
    <td class="col1">
      7.a. What grade if applicable?
    </td>
    <td class="col2"> 
      <def:datafieldcontrol runat="server" id="Charge_familychar_ques_gradeappA" DatabaseField="Charge_familychar_ques_gradeappA"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="0px" FieldTextBoxWidth="75px"></def:datafieldcontrol>
    </td>
    <td class="col1">
      <def:datafieldcontrol runat="server" id="Charge_familychar_ques_gradeapp1" DatabaseField="Charge_familychar_ques_gradeapp1"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="0px" FieldTextBoxWidth="75px"></def:datafieldcontrol>
    </td>
    <td class="col2">
      <def:datafieldcontrol runat="server" id="Charge_familychar_ques_gradeapp2" DatabaseField="Charge_familychar_ques_gradeapp2"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="0px" FieldTextBoxWidth="75px"></def:datafieldcontrol>
    </td>
    <td class="col1">
      <def:datafieldcontrol runat="server" id="Charge_familychar_ques_gradeapp3" DatabaseField="Charge_familychar_ques_gradeapp3"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="0px" FieldTextBoxWidth="75px"></def:datafieldcontrol>
    </td>
    <td class="col2">
      <def:datafieldcontrol runat="server" id="Charge_familychar_ques_gradeappbm" DatabaseField="Charge_familychar_ques_gradeappbm"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="0px" FieldTextBoxWidth="75px"></def:datafieldcontrol>
    </td>
    <td class="col1">
      <def:datafieldcontrol runat="server" id="Charge_familychar_ques_gradeappbf" DatabaseField="Charge_familychar_ques_gradeappbf"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="0px" FieldTextBoxWidth="75px"></def:datafieldcontrol>
    </td>
    <td class="col2">
      <def:datafieldcontrol runat="server" id="Charge_familychar_ques_gradeappnotes" DatabaseField="Charge_familychar_ques_gradeappnotes"  IsEntryField="true" IsDoubleEntryField="false"  FieldLabelWidth="0px" FieldTextBoxWidth="150px" FieldTextBoxMaxLength="256" FieldTextBoxHeight="60px" FieldTextBoxTextMode="MultiLine"></def:datafieldcontrol>
    </td>
  </tr>
  <tr>
    <td class="col1">
      8. Last grade completed
    </td>
    <td class="col2"> 
      <def:datafieldcontrol runat="server" id="Charge_familychar_ques_gradalA" DatabaseField="Charge_familychar_ques_gradalA"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="0px" FieldTextBoxWidth="75px"></def:datafieldcontrol>
    </td>
    <td class="col1">
      <def:datafieldcontrol runat="server" id="Charge_familychar_ques_gradal1" DatabaseField="Charge_familychar_ques_gradal1"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="0px" FieldTextBoxWidth="75px"></def:datafieldcontrol>
    </td>
    <td class="col2">
      <def:datafieldcontrol runat="server" id="Charge_familychar_ques_gradal2" DatabaseField="Charge_familychar_ques_gradal2"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="0px" FieldTextBoxWidth="75px"></def:datafieldcontrol>
    </td>
    <td class="col1">
      <def:datafieldcontrol runat="server" id="Charge_familychar_ques_gradal3" DatabaseField="Charge_familychar_ques_gradal3"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="0px" FieldTextBoxWidth="75px"></def:datafieldcontrol>
    </td>
    <td class="col2">
      <def:datafieldcontrol runat="server" id="Charge_familychar_ques_gradalbm" DatabaseField="Charge_familychar_ques_gradalbm"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="0px" FieldTextBoxWidth="75px"></def:datafieldcontrol>
    </td>
    <td class="col1">
      <def:datafieldcontrol runat="server" id="Charge_familychar_ques_gradalbf" DatabaseField="Charge_familychar_ques_gradalbf"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="0px" FieldTextBoxWidth="75px"></def:datafieldcontrol>
    </td>
    <td class="col2">
      <def:datafieldcontrol runat="server" id="Charge_familychar_ques_gradalnotes" DatabaseField="Charge_familychar_ques_gradalnotes"  IsEntryField="true" IsDoubleEntryField="false"  FieldLabelWidth="0px" FieldTextBoxWidth="150px" FieldTextBoxMaxLength="256" FieldTextBoxHeight="60px" FieldTextBoxTextMode="MultiLine"></def:datafieldcontrol>
    </td>
  </tr>
  <tr>
    <td class="col1">
      9. Had difficulty learning to read (0=No, 1=Yes, <span class="nobr">-1</span>=Not Applicable, <span class="nobr">-9</span>=Missing Value)
    </td>
    <td class="col2"> 
      <def:datafieldcontrol runat="server" id="Charge_familychar_ques_readdifA" DatabaseField="Charge_familychar_ques_readdifA"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="0px" FieldTextBoxWidth="75px"></def:datafieldcontrol>
    </td>
    <td class="col1">
      <def:datafieldcontrol runat="server" id="Charge_familychar_ques_readdif1" DatabaseField="Charge_familychar_ques_readdif1"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="0px" FieldTextBoxWidth="75px"></def:datafieldcontrol>
    </td>
    <td class="col2">
      <def:datafieldcontrol runat="server" id="Charge_familychar_ques_readdif2" DatabaseField="Charge_familychar_ques_readdif2"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="0px" FieldTextBoxWidth="75px"></def:datafieldcontrol>
    </td>
    <td class="col1">
      <def:datafieldcontrol runat="server" id="Charge_familychar_ques_readdif3" DatabaseField="Charge_familychar_ques_readdif3"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="0px" FieldTextBoxWidth="75px"></def:datafieldcontrol>
    </td>
        <td class="col2">
      <def:datafieldcontrol runat="server" id="Charge_familychar_ques_readdifbm" DatabaseField="Charge_familychar_ques_readdifbm"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="0px" FieldTextBoxWidth="75px"></def:datafieldcontrol>
    </td>
    <td class="col1">
      <def:datafieldcontrol runat="server" id="Charge_familychar_ques_readdifbf" DatabaseField="Charge_familychar_ques_readdifbf"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="0px" FieldTextBoxWidth="75px"></def:datafieldcontrol>
    </td>
    <td class="col2">
      <def:datafieldcontrol runat="server" id="Charge_familychar_ques_readdifnotes" DatabaseField="Charge_familychar_ques_readdifnotes"  IsEntryField="true" IsDoubleEntryField="false"  FieldLabelWidth="0px" FieldTextBoxWidth="150px" FieldTextBoxMaxLength="256" FieldTextBoxHeight="60px" FieldTextBoxTextMode="MultiLine"></def:datafieldcontrol>
    </td>
  </tr>
  <tr>
    <td class="col1">
      10. Has difficulty learning math (0=No, 1=Yes, <span class="nobr">-1</span>=Not Applicable, <span class="nobr">-9</span>=Missing Value)
    </td>
    <td class="col2"> 
      <def:datafieldcontrol runat="server" id="Charge_familychar_ques_mathdifA" DatabaseField="Charge_familychar_ques_mathdifA"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="0px" FieldTextBoxWidth="75px"></def:datafieldcontrol>
    </td>
    <td class="col1">
      <def:datafieldcontrol runat="server" id="Charge_familychar_ques_mathdif1" DatabaseField="Charge_familychar_ques_mathdif1"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="0px" FieldTextBoxWidth="75px"></def:datafieldcontrol>
    </td>
    <td class="col2">
      <def:datafieldcontrol runat="server" id="Charge_familychar_ques_mathdif2" DatabaseField="Charge_familychar_ques_mathdif2"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="0px" FieldTextBoxWidth="75px"></def:datafieldcontrol>
    </td>
    <td class="col1">
      <def:datafieldcontrol runat="server" id="Charge_familychar_ques_mathdif3" DatabaseField="Charge_familychar_ques_mathdif3"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="0px" FieldTextBoxWidth="75px"></def:datafieldcontrol>
    </td>
    <td class="col2">
      <def:datafieldcontrol runat="server" id="Charge_familychar_ques_mathdifbm" DatabaseField="Charge_familychar_ques_mathdifbm"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="0px" FieldTextBoxWidth="75px"></def:datafieldcontrol>
    </td>
    <td class="col1">
      <def:datafieldcontrol runat="server" id="Charge_familychar_ques_mathdifbf" DatabaseField="Charge_familychar_ques_mathdifbf"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="0px" FieldTextBoxWidth="75px"></def:datafieldcontrol>
    </td>
    <td class="col2">
      <def:datafieldcontrol runat="server" id="Charge_familychar_ques_mathdifnotes" DatabaseField="Charge_familychar_ques_mathdifnotes"  IsEntryField="true" IsDoubleEntryField="false"  FieldLabelWidth="0px" FieldTextBoxWidth="150px" FieldTextBoxMaxLength="256" FieldTextBoxHeight="60px" FieldTextBoxTextMode="MultiLine"></def:datafieldcontrol>
    </td>
  </tr>
  <tr>
    <td class="col1">
      11. Received speech therapy (0=No, 1=Yes, <span class="nobr">-1</span>=Not Applicable, <span class="nobr">-9</span>=Missing Value)
    </td>
    <td class="col2"> 
      <def:datafieldcontrol runat="server" id="Charge_familychar_ques_therapyA" DatabaseField="Charge_familychar_ques_therapyA"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="0px" FieldTextBoxWidth="75px"></def:datafieldcontrol>
    </td>
    <td class="col1">
      <def:datafieldcontrol runat="server" id="Charge_familychar_ques_therapy1" DatabaseField="Charge_familychar_ques_therapy1"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="0px" FieldTextBoxWidth="75px"></def:datafieldcontrol>
    </td>
    <td class="col2">
      <def:datafieldcontrol runat="server" id="Charge_familychar_ques_therapy2" DatabaseField="Charge_familychar_ques_therapy2"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="0px" FieldTextBoxWidth="75px"></def:datafieldcontrol>
    </td>
    <td class="col1">
      <def:datafieldcontrol runat="server" id="Charge_familychar_ques_therapy3" DatabaseField="Charge_familychar_ques_therapy3"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="0px" FieldTextBoxWidth="75px"></def:datafieldcontrol>
    </td>
    <td class="col2">
      <def:datafieldcontrol runat="server" id="Charge_familychar_ques_therapybm" DatabaseField="Charge_familychar_ques_therapybm"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="0px" FieldTextBoxWidth="75px"></def:datafieldcontrol>
    </td>
    <td class="col1">
      <def:datafieldcontrol runat="server" id="Charge_familychar_ques_therapybf" DatabaseField="Charge_familychar_ques_therapybf"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="0px" FieldTextBoxWidth="75px"></def:datafieldcontrol>
    </td>
    <td class="col2">
      <def:datafieldcontrol runat="server" id="Charge_familychar_ques_therapynotes" DatabaseField="Charge_familychar_ques_therapynotes"  IsEntryField="true" IsDoubleEntryField="false"  FieldLabelWidth="0px" FieldTextBoxWidth="150px" FieldTextBoxMaxLength="256" FieldTextBoxHeight="60px" FieldTextBoxTextMode="MultiLine"></def:datafieldcontrol>
    </td>
  </tr>
  <tr>
    <td class="col1">
      11.a. Age at speech therapy (months)
    </td>
    <td class="col2"> 
      <def:datafieldcontrol runat="server" id="Charge_familychar_ques_therapyageA" DatabaseField="Charge_familychar_ques_therapyageA"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="0px" FieldTextBoxWidth="75px"></def:datafieldcontrol>
    </td>
    <td class="col1">
      <def:datafieldcontrol runat="server" id="Charge_familychar_ques_therapyage1" DatabaseField="Charge_familychar_ques_therapyage1"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="0px" FieldTextBoxWidth="75px"></def:datafieldcontrol>
    </td>
    <td class="col2">
      <def:datafieldcontrol runat="server" id="Charge_familychar_ques_therapyage2" DatabaseField="Charge_familychar_ques_therapyage2"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="0px" FieldTextBoxWidth="75px"></def:datafieldcontrol>
    </td>
    <td class="col1">
      <def:datafieldcontrol runat="server" id="Charge_familychar_ques_therapyage3" DatabaseField="Charge_familychar_ques_therapyage3"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="0px" FieldTextBoxWidth="75px"></def:datafieldcontrol>
    </td>
    <td class="col2">
      <def:datafieldcontrol runat="server" id="Charge_familychar_ques_therapyagebm" DatabaseField="Charge_familychar_ques_therapyagebm"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="0px" FieldTextBoxWidth="75px"></def:datafieldcontrol>
    </td>
    <td class="col1">
      <def:datafieldcontrol runat="server" id="Charge_familychar_ques_therapyagebf" DatabaseField="Charge_familychar_ques_therapyagebf"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="0px" FieldTextBoxWidth="75px"></def:datafieldcontrol>
    </td>
    <td class="col2">
      <def:datafieldcontrol runat="server" id="Charge_familychar_ques_therapyagenotes" DatabaseField="Charge_familychar_ques_therapyagenotes"  IsEntryField="true" IsDoubleEntryField="false"  FieldLabelWidth="0px" FieldTextBoxWidth="150px" FieldTextBoxMaxLength="256" FieldTextBoxHeight="60px" FieldTextBoxTextMode="MultiLine"></def:datafieldcontrol>
    </td>
  </tr>
  <tr>
    <td class="col1">
      11.a. Grade at speech therapy
    </td>
    <td class="col2"> 
      <def:datafieldcontrol runat="server" id="Charge_familychar_ques_therapygradeA" DatabaseField="Charge_familychar_ques_therapygradeA"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="0px" FieldTextBoxWidth="75px"></def:datafieldcontrol>
    </td>
    <td class="col1">
      <def:datafieldcontrol runat="server" id="Charge_familychar_ques_therapygrade1" DatabaseField="Charge_familychar_ques_therapygrade1"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="0px" FieldTextBoxWidth="75px"></def:datafieldcontrol>
    </td>
    <td class="col2">
      <def:datafieldcontrol runat="server" id="Charge_familychar_ques_therapygrade2" DatabaseField="Charge_familychar_ques_therapygrade2"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="0px" FieldTextBoxWidth="75px"></def:datafieldcontrol>
    </td>
    <td class="col1">
      <def:datafieldcontrol runat="server" id="Charge_familychar_ques_therapygrade3" DatabaseField="Charge_familychar_ques_therapygrade3"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="0px" FieldTextBoxWidth="75px"></def:datafieldcontrol>
    </td>
        <td class="col2">
      <def:datafieldcontrol runat="server" id="Charge_familychar_ques_therapygradebm" DatabaseField="Charge_familychar_ques_therapygradebm"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="0px" FieldTextBoxWidth="75px"></def:datafieldcontrol>
    </td>
    <td class="col1">
      <def:datafieldcontrol runat="server" id="Charge_familychar_ques_therapygradebf" DatabaseField="Charge_familychar_ques_therapygradebf"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="0px" FieldTextBoxWidth="75px"></def:datafieldcontrol>
    </td>

    <td class="col2">
      <def:datafieldcontrol runat="server" id="Charge_familychar_ques_therapygradenotes" DatabaseField="Charge_familychar_ques_therapygradenotes"  IsEntryField="true" IsDoubleEntryField="false"  FieldLabelWidth="0px" FieldTextBoxWidth="150px" FieldTextBoxMaxLength="256" FieldTextBoxHeight="60px" FieldTextBoxTextMode="MultiLine"></def:datafieldcontrol>
    </td>
  </tr>
  <tr>
    <td class="col1">
      12. Has a learning disability (0=No, 1=Yes, <span class="nobr">-9</span>=Missing Value)
    </td>
    <td class="col2"> 
      <def:datafieldcontrol runat="server" id="Charge_familychar_ques_learndisA" DatabaseField="Charge_familychar_ques_learndisA"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="0px" FieldTextBoxWidth="75px"></def:datafieldcontrol>
    </td>
    <td class="col1">
      <def:datafieldcontrol runat="server" id="Charge_familychar_ques_learndis1" DatabaseField="Charge_familychar_ques_learndis1"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="0px" FieldTextBoxWidth="75px"></def:datafieldcontrol>
    </td>
    <td class="col2">
      <def:datafieldcontrol runat="server" id="Charge_familychar_ques_learndis2" DatabaseField="Charge_familychar_ques_learndis2"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="0px" FieldTextBoxWidth="75px"></def:datafieldcontrol>
    </td>
    <td class="col1">
      <def:datafieldcontrol runat="server" id="Charge_familychar_ques_learndis3" DatabaseField="Charge_familychar_ques_learndis3"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="0px" FieldTextBoxWidth="75px"></def:datafieldcontrol>
    </td>
    <td class="col2">
      <def:datafieldcontrol runat="server" id="Charge_familychar_ques_learndisbm" DatabaseField="Charge_familychar_ques_learndisbm"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="0px" FieldTextBoxWidth="75px"></def:datafieldcontrol>
    </td>
    <td class="col1">
      <def:datafieldcontrol runat="server" id="Charge_familychar_ques_learndisbf" DatabaseField="Charge_familychar_ques_learndisbf"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="0px" FieldTextBoxWidth="75px"></def:datafieldcontrol>
    </td>
    <td class="col2">
      <def:datafieldcontrol runat="server" id="Charge_familychar_ques_learndisnotes" DatabaseField="Charge_familychar_ques_learndisnotes"  IsEntryField="true" IsDoubleEntryField="false"  FieldLabelWidth="0px" FieldTextBoxWidth="150px" FieldTextBoxMaxLength="256" FieldTextBoxHeight="60px" FieldTextBoxTextMode="MultiLine"></def:datafieldcontrol>
    </td>
  </tr>
  <tr>
    <td class="col1">
      13. Has a language delay or impairment (0=No, 1=Yes, <span class="nobr">-1</span>=Not Applicable, <span class="nobr">-9</span>=Missing Value)
    </td>
    <td class="col2"> 
      <def:datafieldcontrol runat="server" id="Charge_familychar_ques_langdelayA" DatabaseField="Charge_familychar_ques_langdelayA"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="0px" FieldTextBoxWidth="75px"></def:datafieldcontrol>
    </td>
    <td class="col1">
      <def:datafieldcontrol runat="server" id="Charge_familychar_ques_langdelay1" DatabaseField="Charge_familychar_ques_langdelay1"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="0px" FieldTextBoxWidth="75px"></def:datafieldcontrol>
    </td>
    <td class="col2">
      <def:datafieldcontrol runat="server" id="Charge_familychar_ques_langdelay2" DatabaseField="Charge_familychar_ques_langdelay2"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="0px" FieldTextBoxWidth="75px"></def:datafieldcontrol>
    </td>
    <td class="col1">
      <def:datafieldcontrol runat="server" id="Charge_familychar_ques_langdelay3" DatabaseField="Charge_familychar_ques_langdelay3"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="0px" FieldTextBoxWidth="75px"></def:datafieldcontrol>
    </td>
    <td class="col2">
      <def:datafieldcontrol runat="server" id="Charge_familychar_ques_langdelaybm" DatabaseField="Charge_familychar_ques_langdelaybm"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="0px" FieldTextBoxWidth="75px"></def:datafieldcontrol>
    </td>
    <td class="col1">
      <def:datafieldcontrol runat="server" id="Charge_familychar_ques_langdelaybf" DatabaseField="Charge_familychar_ques_langdelaybf"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="0px" FieldTextBoxWidth="75px"></def:datafieldcontrol>
    </td>
    <td class="col2">
      <def:datafieldcontrol runat="server" id="Charge_familychar_ques_langdelaynotes" DatabaseField="Charge_familychar_ques_langdelaynotes"  IsEntryField="true" IsDoubleEntryField="false"  FieldLabelWidth="0px" FieldTextBoxWidth="150px" FieldTextBoxMaxLength="256" FieldTextBoxHeight="60px" FieldTextBoxTextMode="MultiLine"></def:datafieldcontrol>
    </td>
  </tr>
  <tr>
    <td class="col1">
      14. Has a developmental delay (0=No, 1=Yes, <span class="nobr">-9</span>=Missing Value)
    </td>
    <td class="col2"> 
      <def:datafieldcontrol runat="server" id="Charge_familychar_ques_devdelayA" DatabaseField="Charge_familychar_ques_devdelayA"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="0px" FieldTextBoxWidth="75px"></def:datafieldcontrol>
    </td>
    <td class="col1">
      <def:datafieldcontrol runat="server" id="Charge_familychar_ques_devdelay1" DatabaseField="Charge_familychar_ques_devdelay1"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="0px" FieldTextBoxWidth="75px"></def:datafieldcontrol>
    </td>
    <td class="col2">
      <def:datafieldcontrol runat="server" id="Charge_familychar_ques_devdelay2" DatabaseField="Charge_familychar_ques_devdelay2"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="0px" FieldTextBoxWidth="75px"></def:datafieldcontrol>
    </td>
    <td class="col1">
      <def:datafieldcontrol runat="server" id="Charge_familychar_ques_devdelay3" DatabaseField="Charge_familychar_ques_devdelay3"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="0px" FieldTextBoxWidth="75px"></def:datafieldcontrol>
    </td>
        <td class="col2">
      <def:datafieldcontrol runat="server" id="Charge_familychar_ques_devdelaybm" DatabaseField="Charge_familychar_ques_devdelaybm"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="0px" FieldTextBoxWidth="75px"></def:datafieldcontrol>
    </td>
    <td class="col1">
      <def:datafieldcontrol runat="server" id="Charge_familychar_ques_devdelaybf" DatabaseField="Charge_familychar_ques_devdelaybf"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="0px" FieldTextBoxWidth="75px"></def:datafieldcontrol>
    </td>

    <td class="col2">
      <def:datafieldcontrol runat="server" id="Charge_familychar_ques_devdelaynotes" DatabaseField="Charge_familychar_ques_devdelaynotes"  IsEntryField="true" IsDoubleEntryField="false"  FieldLabelWidth="0px" FieldTextBoxWidth="150px" FieldTextBoxMaxLength="256" FieldTextBoxHeight="60px" FieldTextBoxTextMode="MultiLine"></def:datafieldcontrol>
    </td>
  </tr>
</table>
<br />
<table border="1px" cellpadding="5px" cellspacing="0px">
  <tr>
    <td class="head1">
      Questions
    </td>
    <td class="head2" width="85px">
      Sibling 4      
    </td>
    <td class="head1" width="85px">
      Sibling 5
    </td>
    <td class="head2" width="85px">
      Sibling 6
    </td>
    <td class="head1" width="85px">
      Sibling 7
    </td>
    <td class="head2" width="85px">
      Sibling 8
    </td>
    <td class="head1" width="85px">
      Sibling 9
    </td>
    <td class="head2" width="85px">
      Sibling 10
    </td>
  </tr>
  <tr>
    <td class="col1">
      1. Relationship to the child with Autism? (0=Full, 1=Half-Maternal, 2=Half-Paternal, <span class="nobr">-9</span>=Missing Value)
    </td>
    <td class="col2"> 
      <def:datafieldcontrol runat="server" id="Charge_familychar_ques_subrel4" DatabaseField="Charge_familychar_ques_subrel4"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="0px" FieldTextBoxWidth="75px"></def:datafieldcontrol>    
    </td>
    <td class="col1">
      <def:datafieldcontrol runat="server" id="Charge_familychar_ques_subrel5" DatabaseField="Charge_familychar_ques_subrel5"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="0px" FieldTextBoxWidth="75px"></def:datafieldcontrol>    
    </td>
    <td class="col2">
      <def:datafieldcontrol runat="server" id="Charge_familychar_ques_subrel6" DatabaseField="Charge_familychar_ques_subrel6"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="0px" FieldTextBoxWidth="75px"></def:datafieldcontrol>    
    </td>
    <td class="col1">
      <def:datafieldcontrol runat="server" id="Charge_familychar_ques_subrel7" DatabaseField="Charge_familychar_ques_subrel7"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="0px" FieldTextBoxWidth="75px"></def:datafieldcontrol>      
    </td>
    <td class="col2">
      <def:datafieldcontrol runat="server" id="Charge_familychar_ques_subrel8" DatabaseField="Charge_familychar_ques_subrel8"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="0px" FieldTextBoxWidth="75px"></def:datafieldcontrol>    
    </td>
    <td class="col1">
      <def:datafieldcontrol runat="server" id="Charge_familychar_ques_subrel9" DatabaseField="Charge_familychar_ques_subrel9"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="0px" FieldTextBoxWidth="75px"></def:datafieldcontrol>    
    </td>
    <td class="col2">
      <def:datafieldcontrol runat="server" id="Charge_familychar_ques_subrel10" DatabaseField="Charge_familychar_ques_subrel10"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="0px" FieldTextBoxWidth="75px"></def:datafieldcontrol>    
    </td>
  </tr>
  <tr>
    <td class="col1">
      2. NDAR Subject ID
    </td>
    <td class="col2"> 
      <def:datafieldcontrol runat="server" id="Charge_familychar_ques_sub4" DatabaseField="Charge_familychar_ques_sub4"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="0px" FieldTextBoxWidth="75px"></def:datafieldcontrol>
    </td>
    <td class="col1">
      <def:datafieldcontrol runat="server" id="Charge_familychar_ques_sub5" DatabaseField="Charge_familychar_ques_sub5"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="0px" FieldTextBoxWidth="75px"></def:datafieldcontrol>
    </td>
    <td class="col2">
      <def:datafieldcontrol runat="server" id="Charge_familychar_ques_sub6" DatabaseField="Charge_familychar_ques_sub6"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="0px" FieldTextBoxWidth="75px"></def:datafieldcontrol>
    </td>
    <td class="col1">
      <def:datafieldcontrol runat="server" id="Charge_familychar_ques_sub7" DatabaseField="Charge_familychar_ques_sub7"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="0px" FieldTextBoxWidth="75px"></def:datafieldcontrol>
    </td>
    <td class="col2">
      <def:datafieldcontrol runat="server" id="Charge_familychar_ques_sub8" DatabaseField="Charge_familychar_ques_sub8"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="0px" FieldTextBoxWidth="75px"></def:datafieldcontrol>
    </td>
    <td class="col1">
      <def:datafieldcontrol runat="server" id="Charge_familychar_ques_sub9" DatabaseField="Charge_familychar_ques_sub9"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="0px" FieldTextBoxWidth="75px"></def:datafieldcontrol>
    </td>
    <td class="col2">
      <def:datafieldcontrol runat="server" id="Charge_familychar_ques_sub10" DatabaseField="Charge_familychar_ques_sub10"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="0px" FieldTextBoxWidth="75px"></def:datafieldcontrol>
    </td>
  </tr>
  <tr>
    <td class="col1">
      3. Age (months)
    </td>
    <td class="col2"> 
      <def:datafieldcontrol runat="server" id="Charge_familychar_ques_age4" DatabaseField="Charge_familychar_ques_age4"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="0px" FieldTextBoxWidth="75px"></def:datafieldcontrol>
    </td>
    <td class="col1">
      <def:datafieldcontrol runat="server" id="Charge_familychar_ques_age5" DatabaseField="Charge_familychar_ques_age5"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="0px" FieldTextBoxWidth="75px"></def:datafieldcontrol>
    </td>
    <td class="col2">
      <def:datafieldcontrol runat="server" id="Charge_familychar_ques_age6" DatabaseField="Charge_familychar_ques_age6"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="0px" FieldTextBoxWidth="75px"></def:datafieldcontrol>
    </td>
    <td class="col1">
      <def:datafieldcontrol runat="server" id="Charge_familychar_ques_age7" DatabaseField="Charge_familychar_ques_age7"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="0px" FieldTextBoxWidth="75px"></def:datafieldcontrol>
    </td>
    <td class="col2">
      <def:datafieldcontrol runat="server" id="Charge_familychar_ques_age8" DatabaseField="Charge_familychar_ques_age8"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="0px" FieldTextBoxWidth="75px"></def:datafieldcontrol>
    </td>
    <td class="col1">
      <def:datafieldcontrol runat="server" id="Charge_familychar_ques_age9" DatabaseField="Charge_familychar_ques_age9"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="0px" FieldTextBoxWidth="75px"></def:datafieldcontrol>
    </td>
    <td class="col2">
      <def:datafieldcontrol runat="server" id="Charge_familychar_ques_age10" DatabaseField="Charge_familychar_ques_age10"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="0px" FieldTextBoxWidth="75px"></def:datafieldcontrol>
    </td>
  </tr>
  <tr>
    <td class="col1">
      4. Gender (0=Female, 1=Male, <span class="nobr">-9</span>=Missing Value)
    </td>
    <td class="col2"> 
      <def:datafieldcontrol runat="server" id="Charge_familychar_ques_gender4" DatabaseField="Charge_familychar_ques_gender4"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="0px" FieldTextBoxWidth="75px"></def:datafieldcontrol>
    </td>
    <td class="col1">
      <def:datafieldcontrol runat="server" id="Charge_familychar_ques_gender5" DatabaseField="Charge_familychar_ques_gender5"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="0px" FieldTextBoxWidth="75px"></def:datafieldcontrol>
    </td>
    <td class="col2">
      <def:datafieldcontrol runat="server" id="Charge_familychar_ques_gender6" DatabaseField="Charge_familychar_ques_gender6"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="0px" FieldTextBoxWidth="75px"></def:datafieldcontrol>
    </td>
    <td class="col1">
      <def:datafieldcontrol runat="server" id="Charge_familychar_ques_gender7" DatabaseField="Charge_familychar_ques_gender7"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="0px" FieldTextBoxWidth="75px"></def:datafieldcontrol>
    </td>
    <td class="col2">
      <def:datafieldcontrol runat="server" id="Charge_familychar_ques_gender8" DatabaseField="Charge_familychar_ques_gender8"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="0px" FieldTextBoxWidth="75px"></def:datafieldcontrol>
    </td>
    <td class="col1">
      <def:datafieldcontrol runat="server" id="Charge_familychar_ques_gender9" DatabaseField="Charge_familychar_ques_gender9"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="0px" FieldTextBoxWidth="75px"></def:datafieldcontrol>
    </td>
    <td class="col2">
      <def:datafieldcontrol runat="server" id="Charge_familychar_ques_gender10" DatabaseField="Charge_familychar_ques_gender10"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="0px" FieldTextBoxWidth="75px"></def:datafieldcontrol>
    </td>
  </tr>
  <tr>
    <td class="col1">
      5. Handedness (0=Left-Handed, 1=Right-Handed, 2=Ambidextrous, <span class="nobr">-1</span>=Not Applicable, <span class="nobr">-9</span>=Missing Value)
    </td>
    <td class="col2"> 
      <def:datafieldcontrol runat="server" id="Charge_familychar_ques_rla4" DatabaseField="Charge_familychar_ques_rla4"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="0px" FieldTextBoxWidth="75px"></def:datafieldcontrol>
    </td>
    <td class="col1">
      <def:datafieldcontrol runat="server" id="Charge_familychar_ques_rla5" DatabaseField="Charge_familychar_ques_rla5"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="0px" FieldTextBoxWidth="75px"></def:datafieldcontrol>
    </td>
    <td class="col2">
      <def:datafieldcontrol runat="server" id="Charge_familychar_ques_rla6" DatabaseField="Charge_familychar_ques_rla6"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="0px" FieldTextBoxWidth="75px"></def:datafieldcontrol>
    </td>
    <td class="col1">
      <def:datafieldcontrol runat="server" id="Charge_familychar_ques_rla7" DatabaseField="Charge_familychar_ques_rla7"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="0px" FieldTextBoxWidth="75px"></def:datafieldcontrol>
    </td>
    <td class="col2">
      <def:datafieldcontrol runat="server" id="Charge_familychar_ques_rla8" DatabaseField="Charge_familychar_ques_rla8"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="0px" FieldTextBoxWidth="75px"></def:datafieldcontrol>
    </td>
    <td class="col1">
      <def:datafieldcontrol runat="server" id="Charge_familychar_ques_rla9" DatabaseField="Charge_familychar_ques_rla9"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="0px" FieldTextBoxWidth="75px"></def:datafieldcontrol>
    </td>
    <td class="col2">
      <def:datafieldcontrol runat="server" id="Charge_familychar_ques_rla10" DatabaseField="Charge_familychar_ques_rla10"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="0px" FieldTextBoxWidth="75px"></def:datafieldcontrol>
    </td>
  </tr>
  <tr>
    <td class="col1">
      6. Eligible for special education (0=No, 1=Yes, <span class="nobr">-9</span>=Missing Value)
    </td>
    <td class="col2"> 
      <def:datafieldcontrol runat="server" id="Charge_familychar_ques_edu4" DatabaseField="Charge_familychar_ques_edu4"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="0px" FieldTextBoxWidth="75px"></def:datafieldcontrol>
    </td>
    <td class="col1">
      <def:datafieldcontrol runat="server" id="Charge_familychar_ques_edu5" DatabaseField="Charge_familychar_ques_edu5"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="0px" FieldTextBoxWidth="75px"></def:datafieldcontrol>
    </td>
    <td class="col2">
      <def:datafieldcontrol runat="server" id="Charge_familychar_ques_edu6" DatabaseField="Charge_familychar_ques_edu6"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="0px" FieldTextBoxWidth="75px"></def:datafieldcontrol>
    </td>
    <td class="col1">
      <def:datafieldcontrol runat="server" id="Charge_familychar_ques_edu7" DatabaseField="Charge_familychar_ques_edu7"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="0px" FieldTextBoxWidth="75px"></def:datafieldcontrol>
    </td>
    <td class="col2">
      <def:datafieldcontrol runat="server" id="Charge_familychar_ques_edu8" DatabaseField="Charge_familychar_ques_edu8"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="0px" FieldTextBoxWidth="75px"></def:datafieldcontrol>
    </td>
    <td class="col1">
      <def:datafieldcontrol runat="server" id="Charge_familychar_ques_edu9" DatabaseField="Charge_familychar_ques_edu9"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="0px" FieldTextBoxWidth="75px"></def:datafieldcontrol>
    </td>
    <td class="col2">
      <def:datafieldcontrol runat="server" id="Charge_familychar_ques_edu10" DatabaseField="Charge_familychar_ques_edu10"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="0px" FieldTextBoxWidth="75px"></def:datafieldcontrol>
    </td>
  </tr>
  <tr>
    <td class="col1">
      6.a. Age when eligible for special education (months)
    </td>
    <td class="col2"> 
      <def:datafieldcontrol runat="server" id="Charge_familychar_ques_eduage4" DatabaseField="Charge_familychar_ques_eduage4"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="0px" FieldTextBoxWidth="75px"></def:datafieldcontrol>
    </td>
    <td class="col1">
      <def:datafieldcontrol runat="server" id="Charge_familychar_ques_eduage5" DatabaseField="Charge_familychar_ques_eduage5"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="0px" FieldTextBoxWidth="75px"></def:datafieldcontrol>
    </td>
    <td class="col2">
      <def:datafieldcontrol runat="server" id="Charge_familychar_ques_eduage6" DatabaseField="Charge_familychar_ques_eduage6"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="0px" FieldTextBoxWidth="75px"></def:datafieldcontrol>
    </td>
    <td class="col1">
      <def:datafieldcontrol runat="server" id="Charge_familychar_ques_eduage7" DatabaseField="Charge_familychar_ques_eduage7"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="0px" FieldTextBoxWidth="75px"></def:datafieldcontrol>
    </td>
    <td class="col2">
      <def:datafieldcontrol runat="server" id="Charge_familychar_ques_eduage8" DatabaseField="Charge_familychar_ques_eduage8"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="0px" FieldTextBoxWidth="75px"></def:datafieldcontrol>
    </td>
    <td class="col1">
      <def:datafieldcontrol runat="server" id="Charge_familychar_ques_eduage9" DatabaseField="Charge_familychar_ques_eduage9"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="0px" FieldTextBoxWidth="75px"></def:datafieldcontrol>
    </td>
    <td class="col2">
      <def:datafieldcontrol runat="server" id="Charge_familychar_ques_eduage10" DatabaseField="Charge_familychar_ques_eduage10"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="0px" FieldTextBoxWidth="75px"></def:datafieldcontrol>
    </td>
  </tr>
  <tr>
    <td class="col1">
      7. Repeated a grade in school (0=No, 1=Yes, <span class="nobr">-1</span>=Not Applicable, <span class="nobr">-9</span>=Missing Value)
    </td>
    <td class="col2"> 
      <def:datafieldcontrol runat="server" id="Charge_familychar_ques_grader4" DatabaseField="Charge_familychar_ques_grader4"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="0px" FieldTextBoxWidth="75px"></def:datafieldcontrol>
    </td>
    <td class="col1">
      <def:datafieldcontrol runat="server" id="Charge_familychar_ques_grader5" DatabaseField="Charge_familychar_ques_grader5"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="0px" FieldTextBoxWidth="75px"></def:datafieldcontrol>
    </td>
    <td class="col2">
      <def:datafieldcontrol runat="server" id="Charge_familychar_ques_grader6" DatabaseField="Charge_familychar_ques_grader6"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="0px" FieldTextBoxWidth="75px"></def:datafieldcontrol>
    </td>
    <td class="col1">
      <def:datafieldcontrol runat="server" id="Charge_familychar_ques_grader7" DatabaseField="Charge_familychar_ques_grader7"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="0px" FieldTextBoxWidth="75px"></def:datafieldcontrol>
    </td>
    <td class="col2">
      <def:datafieldcontrol runat="server" id="Charge_familychar_ques_grader8" DatabaseField="Charge_familychar_ques_grader8"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="0px" FieldTextBoxWidth="75px"></def:datafieldcontrol>
    </td>
    <td class="col1">
      <def:datafieldcontrol runat="server" id="Charge_familychar_ques_grader9" DatabaseField="Charge_familychar_ques_grader9"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="0px" FieldTextBoxWidth="75px"></def:datafieldcontrol>
    </td>
    <td class="col2">
      <def:datafieldcontrol runat="server" id="Charge_familychar_ques_grader10" DatabaseField="Charge_familychar_ques_grader10"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="0px" FieldTextBoxWidth="75px"></def:datafieldcontrol>
    </td>
  </tr>
  <tr>
    <td class="col1">
      7.a. What grade if applicable?
    </td>
    <td class="col2"> 
      <def:datafieldcontrol runat="server" id="Charge_familychar_ques_gradeapp4" DatabaseField="Charge_familychar_ques_gradeapp4"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="0px" FieldTextBoxWidth="75px"></def:datafieldcontrol>
    </td>
    <td class="col1">
      <def:datafieldcontrol runat="server" id="Charge_familychar_ques_gradeapp5" DatabaseField="Charge_familychar_ques_gradeapp5"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="0px" FieldTextBoxWidth="75px"></def:datafieldcontrol>
    </td>
    <td class="col2">
      <def:datafieldcontrol runat="server" id="Charge_familychar_ques_gradeapp6" DatabaseField="Charge_familychar_ques_gradeapp6"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="0px" FieldTextBoxWidth="75px"></def:datafieldcontrol>
    </td>
    <td class="col1">
      <def:datafieldcontrol runat="server" id="Charge_familychar_ques_gradeapp7" DatabaseField="Charge_familychar_ques_gradeapp7"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="0px" FieldTextBoxWidth="75px"></def:datafieldcontrol>
    </td>
    <td class="col2">
      <def:datafieldcontrol runat="server" id="Charge_familychar_ques_gradeapp8" DatabaseField="Charge_familychar_ques_gradeapp8"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="0px" FieldTextBoxWidth="75px"></def:datafieldcontrol>
    </td>
    <td class="col1">
      <def:datafieldcontrol runat="server" id="Charge_familychar_ques_gradeapp9" DatabaseField="Charge_familychar_ques_gradeapp9"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="0px" FieldTextBoxWidth="75px"></def:datafieldcontrol>
    </td>
    <td class="col2">
      <def:datafieldcontrol runat="server" id="Charge_familychar_ques_gradeapp10" DatabaseField="Charge_familychar_ques_gradeapp10"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="0px" FieldTextBoxWidth="75px"></def:datafieldcontrol>
    </td>
  </tr>
  <tr>
    <td class="col1">
      8. Last grade completed
    </td>
    <td class="col2"> 
      <def:datafieldcontrol runat="server" id="Charge_familychar_ques_gradal4" DatabaseField="Charge_familychar_ques_gradal4"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="0px" FieldTextBoxWidth="75px"></def:datafieldcontrol>
    </td>
    <td class="col1">
      <def:datafieldcontrol runat="server" id="Charge_familychar_ques_gradal5" DatabaseField="Charge_familychar_ques_gradal5"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="0px" FieldTextBoxWidth="75px"></def:datafieldcontrol>
    </td>
    <td class="col2">
      <def:datafieldcontrol runat="server" id="Charge_familychar_ques_gradal6" DatabaseField="Charge_familychar_ques_gradal6"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="0px" FieldTextBoxWidth="75px"></def:datafieldcontrol>
    </td>
    <td class="col1">
      <def:datafieldcontrol runat="server" id="Charge_familychar_ques_gradal7" DatabaseField="Charge_familychar_ques_gradal7"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="0px" FieldTextBoxWidth="75px"></def:datafieldcontrol>
    </td>
    <td class="col2">
      <def:datafieldcontrol runat="server" id="Charge_familychar_ques_gradal8" DatabaseField="Charge_familychar_ques_gradal8"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="0px" FieldTextBoxWidth="75px"></def:datafieldcontrol>
    </td>
    <td class="col1">
      <def:datafieldcontrol runat="server" id="Charge_familychar_ques_gradal9" DatabaseField="Charge_familychar_ques_gradal9"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="0px" FieldTextBoxWidth="75px"></def:datafieldcontrol>
    </td>
    <td class="col2">
      <def:datafieldcontrol runat="server" id="Charge_familychar_ques_gradal10" DatabaseField="Charge_familychar_ques_gradal10"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="0px" FieldTextBoxWidth="75px"></def:datafieldcontrol>
    </td>
  </tr>
  <tr>
    <td class="col1">
      9. Had difficulty learning to read (0=No, 1=Yes, <span class="nobr">-1</span>=Not Applicable, <span class="nobr">-9</span>=Missing Value)
    </td>
    <td class="col2"> 
      <def:datafieldcontrol runat="server" id="Charge_familychar_ques_readdif4" DatabaseField="Charge_familychar_ques_readdif4"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="0px" FieldTextBoxWidth="75px"></def:datafieldcontrol>
    </td>
    <td class="col1">
      <def:datafieldcontrol runat="server" id="Charge_familychar_ques_readdif5" DatabaseField="Charge_familychar_ques_readdif5"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="0px" FieldTextBoxWidth="75px"></def:datafieldcontrol>
    </td>
    <td class="col2">
      <def:datafieldcontrol runat="server" id="Charge_familychar_ques_readdif6" DatabaseField="Charge_familychar_ques_readdif6"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="0px" FieldTextBoxWidth="75px"></def:datafieldcontrol>
    </td>
    <td class="col1">
      <def:datafieldcontrol runat="server" id="Charge_familychar_ques_readdif7" DatabaseField="Charge_familychar_ques_readdif7"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="0px" FieldTextBoxWidth="75px"></def:datafieldcontrol>
    </td>
    <td class="col2">
      <def:datafieldcontrol runat="server" id="Charge_familychar_ques_readdif8" DatabaseField="Charge_familychar_ques_readdif8"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="0px" FieldTextBoxWidth="75px"></def:datafieldcontrol>
    </td>
    <td class="col1">
      <def:datafieldcontrol runat="server" id="Charge_familychar_ques_readdif9" DatabaseField="Charge_familychar_ques_readdif9"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="0px" FieldTextBoxWidth="75px"></def:datafieldcontrol>
    </td>
    <td class="col2">
      <def:datafieldcontrol runat="server" id="Charge_familychar_ques_readdif10" DatabaseField="Charge_familychar_ques_readdif10"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="0px" FieldTextBoxWidth="75px"></def:datafieldcontrol>
    </td>
  </tr>
  <tr>
    <td class="col1">
      10. Has difficulty learning math (0=No, 1=Yes, <span class="nobr">-1</span>=Not Applicable, <span class="nobr">-9</span>=Missing Value)
    </td>
    <td class="col2"> 
      <def:datafieldcontrol runat="server" id="Charge_familychar_ques_mathdif4" DatabaseField="Charge_familychar_ques_mathdif4"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="0px" FieldTextBoxWidth="75px"></def:datafieldcontrol>
    </td>
    <td class="col1">
      <def:datafieldcontrol runat="server" id="Charge_familychar_ques_mathdif5" DatabaseField="Charge_familychar_ques_mathdif5"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="0px" FieldTextBoxWidth="75px"></def:datafieldcontrol>
    </td>
    <td class="col2">
      <def:datafieldcontrol runat="server" id="Charge_familychar_ques_mathdif6" DatabaseField="Charge_familychar_ques_mathdif6"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="0px" FieldTextBoxWidth="75px"></def:datafieldcontrol>
    </td>
    <td class="col1">
      <def:datafieldcontrol runat="server" id="Charge_familychar_ques_mathdif7" DatabaseField="Charge_familychar_ques_mathdif7"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="0px" FieldTextBoxWidth="75px"></def:datafieldcontrol>
    </td>
    <td class="col2">
      <def:datafieldcontrol runat="server" id="Charge_familychar_ques_mathdif8" DatabaseField="Charge_familychar_ques_mathdif8"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="0px" FieldTextBoxWidth="75px"></def:datafieldcontrol>
    </td>
    <td class="col1">
      <def:datafieldcontrol runat="server" id="Charge_familychar_ques_mathdif9" DatabaseField="Charge_familychar_ques_mathdif9"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="0px" FieldTextBoxWidth="75px"></def:datafieldcontrol>
    </td>
    <td class="col2">
      <def:datafieldcontrol runat="server" id="Charge_familychar_ques_mathdif10" DatabaseField="Charge_familychar_ques_mathdif10"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="0px" FieldTextBoxWidth="75px"></def:datafieldcontrol>
    </td>
  </tr>
  <tr>
    <td class="col1">
      11. Received speech therapy (0=No, 1=Yes, <span class="nobr">-1</span>=Not Applicable, <span class="nobr">-9</span>=Missing Value)
    </td>
    <td class="col2"> 
      <def:datafieldcontrol runat="server" id="Charge_familychar_ques_therapy4" DatabaseField="Charge_familychar_ques_therapy4"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="0px" FieldTextBoxWidth="75px"></def:datafieldcontrol>
    </td>
    <td class="col1">
      <def:datafieldcontrol runat="server" id="Charge_familychar_ques_therapy5" DatabaseField="Charge_familychar_ques_therapy5"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="0px" FieldTextBoxWidth="75px"></def:datafieldcontrol>
    </td>
    <td class="col2">
      <def:datafieldcontrol runat="server" id="Charge_familychar_ques_therapy6" DatabaseField="Charge_familychar_ques_therapy6"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="0px" FieldTextBoxWidth="75px"></def:datafieldcontrol>
    </td>
    <td class="col1">
      <def:datafieldcontrol runat="server" id="Charge_familychar_ques_therapy7" DatabaseField="Charge_familychar_ques_therapy7"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="0px" FieldTextBoxWidth="75px"></def:datafieldcontrol>
    </td>
    <td class="col2">
      <def:datafieldcontrol runat="server" id="Charge_familychar_ques_therapy8" DatabaseField="Charge_familychar_ques_therapy8"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="0px" FieldTextBoxWidth="75px"></def:datafieldcontrol>
    </td>
    <td class="col1">
      <def:datafieldcontrol runat="server" id="Charge_familychar_ques_therapy9" DatabaseField="Charge_familychar_ques_therapy9"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="0px" FieldTextBoxWidth="75px"></def:datafieldcontrol>
    </td>
    <td class="col2">
      <def:datafieldcontrol runat="server" id="Charge_familychar_ques_therapy10" DatabaseField="Charge_familychar_ques_therapy10"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="0px" FieldTextBoxWidth="75px"></def:datafieldcontrol>
    </td>
  </tr>
  <tr>
    <td class="col1">
      11.a. Age at speech therapy (months)
    </td>
    <td class="col2"> 
      <def:datafieldcontrol runat="server" id="Charge_familychar_ques_therapyage4" DatabaseField="Charge_familychar_ques_therapyage4"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="0px" FieldTextBoxWidth="75px"></def:datafieldcontrol>
    </td>
    <td class="col1">
      <def:datafieldcontrol runat="server" id="Charge_familychar_ques_therapyage5" DatabaseField="Charge_familychar_ques_therapyage5"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="0px" FieldTextBoxWidth="75px"></def:datafieldcontrol>
    </td>
    <td class="col2">
      <def:datafieldcontrol runat="server" id="Charge_familychar_ques_therapyage6" DatabaseField="Charge_familychar_ques_therapyage6"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="0px" FieldTextBoxWidth="75px"></def:datafieldcontrol>
    </td>
    <td class="col1">
      <def:datafieldcontrol runat="server" id="Charge_familychar_ques_therapyage7" DatabaseField="Charge_familychar_ques_therapyage7"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="0px" FieldTextBoxWidth="75px"></def:datafieldcontrol>
    </td>
    <td class="col2">
      <def:datafieldcontrol runat="server" id="Charge_familychar_ques_therapyage8" DatabaseField="Charge_familychar_ques_therapyage8"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="0px" FieldTextBoxWidth="75px"></def:datafieldcontrol>
    </td>
    <td class="col1">
      <def:datafieldcontrol runat="server" id="Charge_familychar_ques_therapyage9" DatabaseField="Charge_familychar_ques_therapyage9"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="0px" FieldTextBoxWidth="75px"></def:datafieldcontrol>
    </td>
    <td class="col2">
      <def:datafieldcontrol runat="server" id="Charge_familychar_ques_therapyage10" DatabaseField="Charge_familychar_ques_therapyage10"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="0px" FieldTextBoxWidth="75px"></def:datafieldcontrol>
    </td>
  </tr>
  <tr>
    <td class="col1">
      11.a. Grade at speech therapy
    </td>
    <td class="col2"> 
      <def:datafieldcontrol runat="server" id="Charge_familychar_ques_therapygrade4" DatabaseField="Charge_familychar_ques_therapygrade4"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="0px" FieldTextBoxWidth="75px"></def:datafieldcontrol>
    </td>
    <td class="col1">
      <def:datafieldcontrol runat="server" id="Charge_familychar_ques_therapygrade5" DatabaseField="Charge_familychar_ques_therapygrade5"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="0px" FieldTextBoxWidth="75px"></def:datafieldcontrol>
    </td>
    <td class="col2">
      <def:datafieldcontrol runat="server" id="Charge_familychar_ques_therapygrade6" DatabaseField="Charge_familychar_ques_therapygrade6"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="0px" FieldTextBoxWidth="75px"></def:datafieldcontrol>
    </td>
    <td class="col1">
      <def:datafieldcontrol runat="server" id="Charge_familychar_ques_therapygrade7" DatabaseField="Charge_familychar_ques_therapygrade7"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="0px" FieldTextBoxWidth="75px"></def:datafieldcontrol>
    </td>
    <td class="col2">
      <def:datafieldcontrol runat="server" id="Charge_familychar_ques_therapygrade8" DatabaseField="Charge_familychar_ques_therapygrade8"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="0px" FieldTextBoxWidth="75px"></def:datafieldcontrol>
    </td>
    <td class="col1">
      <def:datafieldcontrol runat="server" id="Charge_familychar_ques_therapygrade9" DatabaseField="Charge_familychar_ques_therapygrade9"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="0px" FieldTextBoxWidth="75px"></def:datafieldcontrol>
    </td>
    <td class="col2">
      <def:datafieldcontrol runat="server" id="Charge_familychar_ques_therapygrade10" DatabaseField="Charge_familychar_ques_therapygrade10"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="0px" FieldTextBoxWidth="75px"></def:datafieldcontrol>
    </td>
  </tr>
  <tr>
    <td class="col1">
      12. Has a learning disability (0=No, 1=Yes, <span class="nobr">-9</span>=Missing Value)
    </td>
    <td class="col2"> 
      <def:datafieldcontrol runat="server" id="Charge_familychar_ques_learndis4" DatabaseField="Charge_familychar_ques_learndis4"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="0px" FieldTextBoxWidth="75px"></def:datafieldcontrol>
    </td>
    <td class="col1">
      <def:datafieldcontrol runat="server" id="Charge_familychar_ques_learndis5" DatabaseField="Charge_familychar_ques_learndis5"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="0px" FieldTextBoxWidth="75px"></def:datafieldcontrol>
    </td>
    <td class="col2">
      <def:datafieldcontrol runat="server" id="Charge_familychar_ques_learndis6" DatabaseField="Charge_familychar_ques_learndis6"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="0px" FieldTextBoxWidth="75px"></def:datafieldcontrol>
    </td>
    <td class="col1">
      <def:datafieldcontrol runat="server" id="Charge_familychar_ques_learndis7" DatabaseField="Charge_familychar_ques_learndis7"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="0px" FieldTextBoxWidth="75px"></def:datafieldcontrol>
    </td>
    <td class="col2">
      <def:datafieldcontrol runat="server" id="Charge_familychar_ques_learndis8" DatabaseField="Charge_familychar_ques_learndis8"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="0px" FieldTextBoxWidth="75px"></def:datafieldcontrol>
    </td>
    <td class="col1">
      <def:datafieldcontrol runat="server" id="Charge_familychar_ques_learndis9" DatabaseField="Charge_familychar_ques_learndis9"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="0px" FieldTextBoxWidth="75px"></def:datafieldcontrol>
    </td>
    <td class="col2">
      <def:datafieldcontrol runat="server" id="Charge_familychar_ques_learndis10" DatabaseField="Charge_familychar_ques_learndis10"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="0px" FieldTextBoxWidth="75px"></def:datafieldcontrol>
    </td>
  </tr>
  <tr>
    <td class="col1">
      13. Has a language delay or impairment (0=No, 1=Yes, <span class="nobr">-1</span>=Not Applicable, <span class="nobr">-9</span>=Missing Value)
    </td>
    <td class="col2"> 
      <def:datafieldcontrol runat="server" id="Charge_familychar_ques_langdelay4" DatabaseField="Charge_familychar_ques_langdelay4"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="0px" FieldTextBoxWidth="75px"></def:datafieldcontrol>
    </td>
    <td class="col1">
      <def:datafieldcontrol runat="server" id="Charge_familychar_ques_langdelay5" DatabaseField="Charge_familychar_ques_langdelay5"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="0px" FieldTextBoxWidth="75px"></def:datafieldcontrol>
    </td>
    <td class="col2">
      <def:datafieldcontrol runat="server" id="Charge_familychar_ques_langdelay6" DatabaseField="Charge_familychar_ques_langdelay6"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="0px" FieldTextBoxWidth="75px"></def:datafieldcontrol>
    </td>
    <td class="col1">
      <def:datafieldcontrol runat="server" id="Charge_familychar_ques_langdelay7" DatabaseField="Charge_familychar_ques_langdelay7"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="0px" FieldTextBoxWidth="75px"></def:datafieldcontrol>
    </td>
    <td class="col2">
      <def:datafieldcontrol runat="server" id="Charge_familychar_ques_langdelay8" DatabaseField="Charge_familychar_ques_langdelay8"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="0px" FieldTextBoxWidth="75px"></def:datafieldcontrol>
    </td>
    <td class="col1">
      <def:datafieldcontrol runat="server" id="Charge_familychar_ques_langdelay9" DatabaseField="Charge_familychar_ques_langdelay9"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="0px" FieldTextBoxWidth="75px"></def:datafieldcontrol>
    </td>
    <td class="col2">
      <def:datafieldcontrol runat="server" id="Charge_familychar_ques_langdelay10" DatabaseField="Charge_familychar_ques_langdelay10"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="0px" FieldTextBoxWidth="75px"></def:datafieldcontrol>
    </td>
  </tr>
  <tr>
    <td class="col1">
      14. Has a developmental delay (0=No, 1=Yes, <span class="nobr">-9</span>=Missing Value)
    </td>
    <td class="col2"> 
      <def:datafieldcontrol runat="server" id="Charge_familychar_ques_devdelay4" DatabaseField="Charge_familychar_ques_devdelay4"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="0px" FieldTextBoxWidth="75px"></def:datafieldcontrol>
    </td>
    <td class="col1">
      <def:datafieldcontrol runat="server" id="Charge_familychar_ques_devdelay5" DatabaseField="Charge_familychar_ques_devdelay5"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="0px" FieldTextBoxWidth="75px"></def:datafieldcontrol>
    </td>
    <td class="col2">
      <def:datafieldcontrol runat="server" id="Charge_familychar_ques_devdelay6" DatabaseField="Charge_familychar_ques_devdelay6"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="0px" FieldTextBoxWidth="75px"></def:datafieldcontrol>
    </td>
    <td class="col1">
      <def:datafieldcontrol runat="server" id="Charge_familychar_ques_devdelay7" DatabaseField="Charge_familychar_ques_devdelay7"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="0px" FieldTextBoxWidth="75px"></def:datafieldcontrol>
    </td>
    <td class="col2">
      <def:datafieldcontrol runat="server" id="Charge_familychar_ques_devdelay8" DatabaseField="Charge_familychar_ques_devdelay8"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="0px" FieldTextBoxWidth="75px"></def:datafieldcontrol>
    </td>
    <td class="col1">
      <def:datafieldcontrol runat="server" id="Charge_familychar_ques_devdelay9" DatabaseField="Charge_familychar_ques_devdelay9"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="0px" FieldTextBoxWidth="75px"></def:datafieldcontrol>
    </td>
    <td class="col2">
      <def:datafieldcontrol runat="server" id="Charge_familychar_ques_devdelay10" DatabaseField="Charge_familychar_ques_devdelay10"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="0px" FieldTextBoxWidth="75px"></def:datafieldcontrol>
    </td>
  </tr>
</table>
<br />
<def:datafieldcontrol runat="server" id="Charge_familychar_comments_misc" DatabaseField="Charge_familychar_comments_misc"  IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="150px" FieldTextBoxWidth="400px" FieldTextBoxMaxLength="500" FieldTextBoxHeight="60px" FieldTextBoxTextMode="MultiLine"></def:datafieldcontrol>
</asp:Panel>
<br />
<def:datafieldcontrol runat="server" id="created" DatabaseField="created"  IsReadOnly="true" RenderReadOnlyAsDiv="true"   FieldLabelWidth="300px "></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="createdBy" DatabaseField="createdBy"  IsReadOnly="true" RenderReadOnlyAsDiv="true"   FieldLabelWidth="300px "></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="updated" DatabaseField="updated"  IsReadOnly="true" RenderReadOnlyAsDiv="true"   FieldLabelWidth="300px "></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="updatedBy" DatabaseField="updatedBy"  IsReadOnly="true" RenderReadOnlyAsDiv="true"   FieldLabelWidth="300px "></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="scored" DatabaseField="scored"  IsReadOnly="true" RenderReadOnlyAsDiv="true"   FieldLabelWidth="300px "></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="scoredBy" DatabaseField="scoredBy"  IsReadOnly="true" RenderReadOnlyAsDiv="true"   FieldLabelWidth="300px "></def:datafieldcontrol>
</asp:Content>
