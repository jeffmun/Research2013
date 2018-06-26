<%@ Register TagPrefix="def" Namespace="DataEntryFramework3" %> 
<%@ Page language="c#" MasterPageFile="~/UWAC.master"  Title="MIND_IntHx Data Entry" %>
<asp:Content ID="Content1" ContentPlaceHolderID="oBodyPlaceHolder" runat="server">
<style>
  .odd { background-color: #ddeeee }
  .even { background-color: #ffeeee }
  .key { background-color: #eeeeee }
  .next { padding-left: 50px }
</style>
<def:dataentrycontroller id="DataEntryController1" runat="server" DatabaseTable="ALL_MIND_IntHx" >
</def:dataentrycontroller>
<def:datafieldcontrol runat="server" id="id" DatabaseField="id"  IsInsertField="true"   FieldLabelWidth="100px" FieldTextBoxMaxLength="15"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="indexnum" DatabaseField="indexnum" IsInsertField="true" FieldLabelWidth="100px" ></def:datafieldcontrol>
<table cellpadding="0" cellspacing="0" border="0">
  <tr>
    <td>
      <def:datafieldcontrol runat="server" id="IHInterv" DatabaseField="IHInterv" FieldLabelText="Interviewer" IsInsertField="true"  FieldLabelWidth="100px" FieldTextBoxMaxLength="50"></def:datafieldcontrol>
      <def:datafieldcontrol runat="server" id="IHDateIn" DatabaseField="IHDateIn" FieldLabelText="Interview Date" IsInsertField="true"  FieldLabelWidth="100px" FieldTextBoxWidth="75px"></def:datafieldcontrol>
    </td>
    <td class="next">
      <def:datafieldcontrol runat="server" id="IHRespon" DatabaseField="IHRespon" FieldLabelText="Respondent" IsInsertField="true"  FieldLabelWidth="100px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
      <def:datafieldcontrol runat="server" id="IHRespDe" DatabaseField="IHRespDe" FieldLabelText="Describe Other Respondent" IsInsertField="true" IsInsertValueRequired="false"  FieldLabelWidth="100px" FieldTextBoxMaxLength="50"></def:datafieldcontrol>
    </td>
    <td class="next">
      <def:ValueSetLabel ID="ValueSetLabel_IHRespon" runat="server"  DatabaseField="IHRespon"></def:ValueSetLabel>
    </td>
  </tr>
</table>
<br />
<asp:panel id="mainPanel" runat="server">
<br />
Where needed: -9=Missing Value
<table cellpadding="1" cellspacing="0" border="1">
  <tr>
    <td class="key" colspan="6">
      <!-- Type of Intervention -->
      See below for Type key.
    </td>
    <td class="key" colspan="2">
      <!-- Frequency or Dose Units -->
      1=Hrs/Wk or Hrs/Event 2=Other
    </td>
    <td class="key">
      <!-- Group or Individual -->
      1=Group 2=Individual
    </td>
    <td class="key" colspan="2">
      &nbsp;
      <!-- Class Ratio -->
    </td>
    <td class="key" colspan="2">
      <!-- Provider Background -->
      1=Specialist
      2=Paraprofessional
      3=Untrained parent/volunteer
    </td>
    <td class="key">
      <!-- Intensity -->
      Calculated field
    </td>
  </tr>
  <tr>
    <td>
      Type of Intervention
    </td>
    <td>
      Name of School/Service Provider
    </td>
    <td>
      Setting
    </td>
    <td>
      Date Began
    </td>
    <td>
      Date Ended
    </td>
    <td>
      Frequency or Dose Amount
    </td>
    <td>
      Frequency or Dose Units      
    </td>
    <td>
      Specify "Other" Units
    </td>
    <td>
      Group or Individual
    </td>
    <td>
      Class Adults
    </td>
    <td>
      Class Children
    </td>
    <td>
      Provider Background
    </td>
    <td>
      Break (in weeks)
    </td>
    <td>
      Intensity
    </td>
  </tr>
  <tr> <!-- A Group -->
    <td class="odd">
      <!-- Type of Intervention -->
      <def:datafieldcontrol runat="server" id="IHATypeOI" DatabaseField="IHATypeOI"  IsEntryField="true" IsDoubleEntryField="true"  FieldTextBoxWidth="30px "></def:datafieldcontrol>
    </td>
    <td class="odd">
      <!-- Name of School/Service Provider -->
      <def:datafieldcontrol runat="server" id="IHANameSP" DatabaseField="IHANameSP"  IsEntryField="true" IsDoubleEntryField="true"  FieldTextBoxWidth="150px" FieldTextBoxMaxLength="100"></def:datafieldcontrol>
    </td>
    <td class="odd">
      <!-- Setting -->
      <def:datafieldcontrol runat="server" id="IHASetting" DatabaseField="IHASetting"  IsEntryField="true" IsDoubleEntryField="true"  FieldTextBoxWidth="150px" FieldTextBoxMaxLength="200"></def:datafieldcontrol>
    </td>
    <td class="odd">
      <!-- Date Began -->
      <def:datafieldcontrol runat="server" id="IHADateBe" DatabaseField="IHADateBe"  IsEntryField="true" IsDoubleEntryField="true"  FieldTextBoxWidth="75px "></def:datafieldcontrol>
    </td>
    <td class="odd">
      <!-- Date Ended -->
      <def:datafieldcontrol runat="server" id="IHADateEn" DatabaseField="IHADateEn"  IsEntryField="true" IsDoubleEntryField="true"  FieldTextBoxWidth="75px "></def:datafieldcontrol>
    </td>
    <td class="odd">
      <!-- Frequency or Dose Amount -->
      <def:datafieldcontrol runat="server" id="IHA6Value"  DatabaseField="IHA6Value"  FormatString="{0:f2}" IsEntryField="true" IsDoubleEntryField="true"  FieldTextBoxWidth="30px " ></def:datafieldcontrol>
    </td>
    <td class="odd">
      <!-- Frequency or Dose Units -->
      <def:datafieldcontrol runat="server" id="IHA6Hours" DatabaseField="IHA6Hours"  IsEntryField="true" IsDoubleEntryField="true"  FieldTextBoxWidth="30px " ></def:datafieldcontrol>
    </td>
    <td class="odd">
      <!-- Specify "Other" Units -->
      <def:datafieldcontrol runat="server" id="IHA6OUnit" DatabaseField="IHA6OUnit"  IsEntryField="true" IsDoubleEntryField="true"  FieldTextBoxWidth="75px" FieldTextBoxMaxLength="50"></def:datafieldcontrol>
    </td>
    <td class="odd">
      <!-- Group or Individual -->
      <def:datafieldcontrol runat="server" id="IHAGrOrIn" DatabaseField="IHAGrOrIn"  IsEntryField="true" IsDoubleEntryField="true"  FieldTextBoxWidth="30px "></def:datafieldcontrol>
    </td>
    <td class="odd">
      <!-- Class Adults -->
      <def:datafieldcontrol runat="server" id="IHAClassA" DatabaseField="IHAClassA"  IsEntryField="true" IsDoubleEntryField="true"  FieldTextBoxWidth="30px "></def:datafieldcontrol>
    </td>
    <td class="odd">
      <!-- Class Children -->
      <def:datafieldcontrol runat="server" id="IHAClassC" DatabaseField="IHAClassC"  IsEntryField="true" IsDoubleEntryField="true"  FieldTextBoxWidth="30px "></def:datafieldcontrol>
    </td>
    <td class="odd">
      <!-- Provider Background -->
      <def:datafieldcontrol runat="server" id="IHAProvid" DatabaseField="IHAProvid"  IsEntryField="true" IsDoubleEntryField="true"  FieldTextBoxWidth="30px "></def:datafieldcontrol>
    </td>
    <td class="odd">
      <!-- Break (in weeks) -->
      <def:datafieldcontrol runat="server" id="IHABreak" DatabaseField="IHABreak"  IsEntryField="true" IsDoubleEntryField="true"  FieldTextBoxWidth="30px "></def:datafieldcontrol>
    </td>
    <td class="odd">
      <!-- Intensity -->
      <def:datafieldcontrol runat="server" id="IHAIntens" DatabaseField="IHAIntens"  IsEntryField="false" IsReadOnly="true"  FieldTextBoxWidth="30px "></def:datafieldcontrol>
    </td>
  </tr>
  <tr>
    <td class="odd" colspan="14">
      <!-- Details -->
      <def:datafieldcontrol runat="server" id="IHADetails" DatabaseField="IHADetails"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="100px" FieldTextBoxWidth="900px" FieldTextBoxHeight="32px" FieldTextBoxMaxLength="500" FieldTextBoxTextMode="MultiLine"></def:datafieldcontrol>    
    </td>
  </tr>
  <tr> <!-- B Group -->
    <td class="even">
      <!-- Type of Intervention -->
      <def:datafieldcontrol runat="server" id="IHBTypeOI" DatabaseField="IHBTypeOI"  IsEntryField="true" IsDoubleEntryField="true"  FieldTextBoxWidth="30px "></def:datafieldcontrol>
    </td>
    <td class="even">
      <!-- Name of School/Service Provider -->
      <def:datafieldcontrol runat="server" id="IHBNameSP" DatabaseField="IHBNameSP"  IsEntryField="true" IsDoubleEntryField="true"  FieldTextBoxWidth="150px" FieldTextBoxMaxLength="100"></def:datafieldcontrol>
    </td>
    <td class="even">
      <!-- Setting -->
      <def:datafieldcontrol runat="server" id="IHBSetting" DatabaseField="IHBSetting"  IsEntryField="true" IsDoubleEntryField="true"  FieldTextBoxWidth="150px" FieldTextBoxMaxLength="200"></def:datafieldcontrol>
    </td>
    <td class="even">
      <!-- Date Began -->
      <def:datafieldcontrol runat="server" id="IHBDateBe" DatabaseField="IHBDateBe"  IsEntryField="true" IsDoubleEntryField="true"  FieldTextBoxWidth="75px "></def:datafieldcontrol>
    </td>
    <td class="even">
      <!-- Date Ended -->
      <def:datafieldcontrol runat="server" id="IHBDateEn" DatabaseField="IHBDateEn"  IsEntryField="true" IsDoubleEntryField="true"  FieldTextBoxWidth="75px "></def:datafieldcontrol>
    </td>
    <td class="even">
      <!-- Frequency or Dose Amount -->
      <def:datafieldcontrol runat="server" id="IHB6Value" DatabaseField="IHB6Value"  FormatString="{0:f2}" IsEntryField="true" IsDoubleEntryField="true"  FieldTextBoxWidth="30px "></def:datafieldcontrol>
    </td>
    <td class="even">
      <!-- Frequency or Dose Units -->
      <def:datafieldcontrol runat="server" id="IHB6Hours" DatabaseField="IHB6Hours"  IsEntryField="true" IsDoubleEntryField="true"  FieldTextBoxWidth="30px " ></def:datafieldcontrol>
    </td>
    <td class="even">
      <!-- Specify "Other" Units -->
      <def:datafieldcontrol runat="server" id="IHB6OUnit" DatabaseField="IHB6OUnit"  IsEntryField="true" IsDoubleEntryField="true"  FieldTextBoxWidth="75px" FieldTextBoxMaxLength="50"></def:datafieldcontrol>
    </td>
    <td class="even">
      <!-- Group or Individual -->
      <def:datafieldcontrol runat="server" id="IHBGrOrIn" DatabaseField="IHBGrOrIn"  IsEntryField="true" IsDoubleEntryField="true"  FieldTextBoxWidth="30px "></def:datafieldcontrol>
    </td>
    <td class="even">
      <!-- Class Adults -->
      <def:datafieldcontrol runat="server" id="IHBClassA" DatabaseField="IHBClassA"  IsEntryField="true" IsDoubleEntryField="true"  FieldTextBoxWidth="30px "></def:datafieldcontrol>
    </td>
    <td class="even">
      <!-- Class Children -->
      <def:datafieldcontrol runat="server" id="IHBClassC" DatabaseField="IHBClassC"  IsEntryField="true" IsDoubleEntryField="true"  FieldTextBoxWidth="30px "></def:datafieldcontrol>
    </td>
    <td class="even">
      <!-- Provider Background -->
      <def:datafieldcontrol runat="server" id="IHBProvid" DatabaseField="IHBProvid"  IsEntryField="true" IsDoubleEntryField="true"  FieldTextBoxWidth="30px "></def:datafieldcontrol>
    </td>
    <td class="even">
      <!-- Break (in weeks) -->
      <def:datafieldcontrol runat="server" id="IHBBreak" DatabaseField="IHBBreak"  IsEntryField="true" IsDoubleEntryField="true"  FieldTextBoxWidth="30px "></def:datafieldcontrol>
    </td>
    <td class="even">
      <!-- Intensity -->
      <def:datafieldcontrol runat="server" id="IHBIntens" DatabaseField="IHBIntens"  IsEntryField="false" IsReadOnly="true"  FieldTextBoxWidth="30px "></def:datafieldcontrol>
    </td>
  </tr>
  <tr>
    <td class="even" colspan="14">
      <!-- Details -->
      <def:datafieldcontrol runat="server" id="IHBDetails" DatabaseField="IHBDetails"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="100px" FieldTextBoxWidth="900px" FieldTextBoxHeight="32px" FieldTextBoxMaxLength="500" FieldTextBoxTextMode="MultiLine"></def:datafieldcontrol>    
    </td>
  </tr>
  <tr> <!-- C Group -->
    <td class="odd">
      <!-- Type of Intervention -->
      <def:datafieldcontrol runat="server" id="IHCTypeOI" DatabaseField="IHCTypeOI"  IsEntryField="true" IsDoubleEntryField="true"  FieldTextBoxWidth="30px "></def:datafieldcontrol>
    </td>
    <td class="odd">
      <!-- Name of School/Service Provider -->
      <def:datafieldcontrol runat="server" id="IHCNameSP" DatabaseField="IHCNameSP"  IsEntryField="true" IsDoubleEntryField="true"  FieldTextBoxWidth="150px" FieldTextBoxMaxLength="100"></def:datafieldcontrol>
    </td>
    <td class="odd">
      <!-- Setting -->
      <def:datafieldcontrol runat="server" id="IHCSetting" DatabaseField="IHCSetting"  IsEntryField="true" IsDoubleEntryField="true"  FieldTextBoxWidth="150px" FieldTextBoxMaxLength="200"></def:datafieldcontrol>
    </td>
    <td class="odd">
      <!-- Date Began -->
      <def:datafieldcontrol runat="server" id="IHCDateBe" DatabaseField="IHCDateBe"  IsEntryField="true" IsDoubleEntryField="true"  FieldTextBoxWidth="75px "></def:datafieldcontrol>
    </td>
    <td class="odd">
      <!-- Date Ended -->
      <def:datafieldcontrol runat="server" id="IHCDateEn" DatabaseField="IHCDateEn"  IsEntryField="true" IsDoubleEntryField="true"  FieldTextBoxWidth="75px "></def:datafieldcontrol>
    </td>
    <td class="odd">
      <!-- Frequency or Dose Amount -->
      <def:datafieldcontrol runat="server" id="IHC6Value" DatabaseField="IHC6Value"  FormatString="{0:f2}" IsEntryField="true" IsDoubleEntryField="true"  FieldTextBoxWidth="30px "></def:datafieldcontrol>
    </td>
    <td class="odd">
      <!-- Frequency or Dose Units -->
      <def:datafieldcontrol runat="server" id="IHC6Hours" DatabaseField="IHC6Hours"  IsEntryField="true" IsDoubleEntryField="true"  FieldTextBoxWidth="30px " ></def:datafieldcontrol>
    </td>
    <td class="odd">
      <!-- Specify "Other" Units -->
      <def:datafieldcontrol runat="server" id="IHC6OUnit" DatabaseField="IHC6OUnit"  IsEntryField="true" IsDoubleEntryField="true"  FieldTextBoxWidth="75px" FieldTextBoxMaxLength="50"></def:datafieldcontrol>
    </td>
    <td class="odd">
      <!-- Group or Individual -->
      <def:datafieldcontrol runat="server" id="IHCGrOrIn" DatabaseField="IHCGrOrIn"  IsEntryField="true" IsDoubleEntryField="true"  FieldTextBoxWidth="30px "></def:datafieldcontrol>
    </td>
    <td class="odd">
      <!-- Class Adults -->
      <def:datafieldcontrol runat="server" id="IHCClassA" DatabaseField="IHCClassA"  IsEntryField="true" IsDoubleEntryField="true"  FieldTextBoxWidth="30px "></def:datafieldcontrol>
    </td>
    <td class="odd">
      <!-- Class Children -->
      <def:datafieldcontrol runat="server" id="IHCClassC" DatabaseField="IHCClassC"  IsEntryField="true" IsDoubleEntryField="true"  FieldTextBoxWidth="30px "></def:datafieldcontrol>
    </td>
    <td class="odd">
      <!-- Provider Background -->
      <def:datafieldcontrol runat="server" id="IHCProvid" DatabaseField="IHCProvid"  IsEntryField="true" IsDoubleEntryField="true"  FieldTextBoxWidth="30px "></def:datafieldcontrol>
    </td>
    <td class="odd">
      <!-- Break (in weeks) -->
      <def:datafieldcontrol runat="server" id="IHCBreak" DatabaseField="IHCBreak"  IsEntryField="true" IsDoubleEntryField="true"  FieldTextBoxWidth="30px "></def:datafieldcontrol>
    </td>
    <td class="odd">
      <!-- Intensity -->
      <def:datafieldcontrol runat="server" id="IHCIntens" DatabaseField="IHCIntens"  IsEntryField="false" IsReadOnly="true"  FieldTextBoxWidth="30px "></def:datafieldcontrol>
    </td>
  </tr>
  <tr>
    <td class="odd" colspan="14">
      <!-- Details -->
      <def:datafieldcontrol runat="server" id="IHCDetails" DatabaseField="IHCDetails"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="100px" FieldTextBoxWidth="900px" FieldTextBoxHeight="32px" FieldTextBoxMaxLength="500" FieldTextBoxTextMode="MultiLine"></def:datafieldcontrol>    
    </td>
  </tr>
  <tr> <!-- D Group -->
    <td class="even">
      <!-- Type of Intervention -->
      <def:datafieldcontrol runat="server" id="IHDTypeOI" DatabaseField="IHDTypeOI"  IsEntryField="true" IsDoubleEntryField="true"  FieldTextBoxWidth="30px "></def:datafieldcontrol>
    </td>
    <td class="even">
      <!-- Name of School/Service Provider -->
      <def:datafieldcontrol runat="server" id="IHDNameSP" DatabaseField="IHDNameSP"  IsEntryField="true" IsDoubleEntryField="true"  FieldTextBoxWidth="150px" FieldTextBoxMaxLength="100"></def:datafieldcontrol>
    </td>
    <td class="even">
      <!-- Setting -->
      <def:datafieldcontrol runat="server" id="IHDSetting" DatabaseField="IHDSetting"  IsEntryField="true" IsDoubleEntryField="true"  FieldTextBoxWidth="150px" FieldTextBoxMaxLength="200"></def:datafieldcontrol>
    </td>
    <td class="even">
      <!-- Date Began -->
      <def:datafieldcontrol runat="server" id="IHDDateBe" DatabaseField="IHDDateBe"  IsEntryField="true" IsDoubleEntryField="true"  FieldTextBoxWidth="75px "></def:datafieldcontrol>
    </td>
    <td class="even">
      <!-- Date Ended -->
      <def:datafieldcontrol runat="server" id="IHDDateEn" DatabaseField="IHDDateEn"  IsEntryField="true" IsDoubleEntryField="true"  FieldTextBoxWidth="75px "></def:datafieldcontrol>
    </td>
    <td class="even">
      <!-- Frequency or Dose Amount -->
      <def:datafieldcontrol runat="server" id="IHD6Value" DatabaseField="IHD6Value"   FormatString="{0:f2}"  IsEntryField="true" IsDoubleEntryField="true"  FieldTextBoxWidth="30px "></def:datafieldcontrol>
    </td>
    <td class="even">
      <!-- Frequency or Dose Units -->
      <def:datafieldcontrol runat="server" id="IHD6Hours" DatabaseField="IHD6Hours"  IsEntryField="true" IsDoubleEntryField="true"  FieldTextBoxWidth="30px " ></def:datafieldcontrol>
    </td>
    <td class="even">
      <!-- Specify "Other" Units -->
      <def:datafieldcontrol runat="server" id="IHD6OUnit" DatabaseField="IHD6OUnit"  IsEntryField="true" IsDoubleEntryField="true"  FieldTextBoxWidth="75px" FieldTextBoxMaxLength="50"></def:datafieldcontrol>
    </td>
    <td class="even">
      <!-- Group or Individual -->
      <def:datafieldcontrol runat="server" id="IHDGrOrIn" DatabaseField="IHDGrOrIn"  IsEntryField="true" IsDoubleEntryField="true"  FieldTextBoxWidth="30px "></def:datafieldcontrol>
    </td>
    <td class="even">
      <!-- Class Adults -->
      <def:datafieldcontrol runat="server" id="IHDClassA" DatabaseField="IHDClassA"  IsEntryField="true" IsDoubleEntryField="true"  FieldTextBoxWidth="30px "></def:datafieldcontrol>
    </td>
    <td class="even">
      <!-- Class Children -->
      <def:datafieldcontrol runat="server" id="IHDClassC" DatabaseField="IHDClassC"  IsEntryField="true" IsDoubleEntryField="true"  FieldTextBoxWidth="30px "></def:datafieldcontrol>
    </td>
    <td class="even">
      <!-- Provider Background -->
      <def:datafieldcontrol runat="server" id="IHDProvid" DatabaseField="IHDProvid"  IsEntryField="true" IsDoubleEntryField="true"  FieldTextBoxWidth="30px "></def:datafieldcontrol>
    </td>
    <td class="even">
      <!-- Break (in weeks) -->
      <def:datafieldcontrol runat="server" id="IHDBreak" DatabaseField="IHDBreak"  IsEntryField="true" IsDoubleEntryField="true"  FieldTextBoxWidth="30px "></def:datafieldcontrol>
    </td>
    <td class="even">
      <!-- Intensity -->
      <def:datafieldcontrol runat="server" id="IHDIntens" DatabaseField="IHDIntens"  IsEntryField="false" IsReadOnly="true"  FieldTextBoxWidth="30px "></def:datafieldcontrol>
    </td>
  </tr>
  <tr>
    <td class="even" colspan="14">
      <!-- Details -->
      <def:datafieldcontrol runat="server" id="IHDDetails" DatabaseField="IHDDetails"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="100px" FieldTextBoxWidth="900px" FieldTextBoxHeight="32px" FieldTextBoxMaxLength="500" FieldTextBoxTextMode="MultiLine"></def:datafieldcontrol>    
    </td>
  </tr>
  <tr> <!-- E Group -->
    <td class="odd">
      <!-- Type of Intervention -->
      <def:datafieldcontrol runat="server" id="IHETypeOI" DatabaseField="IHETypeOI"  IsEntryField="true" IsDoubleEntryField="true"  FieldTextBoxWidth="30px "></def:datafieldcontrol>
    </td>
    <td class="odd">
      <!-- Name of School/Service Provider -->
      <def:datafieldcontrol runat="server" id="IHENameSP" DatabaseField="IHENameSP"  IsEntryField="true" IsDoubleEntryField="true"  FieldTextBoxWidth="150px" FieldTextBoxMaxLength="100"></def:datafieldcontrol>
    </td>
    <td class="odd">
      <!-- Setting -->
      <def:datafieldcontrol runat="server" id="IHESetting" DatabaseField="IHESetting"  IsEntryField="true" IsDoubleEntryField="true"  FieldTextBoxWidth="150px" FieldTextBoxMaxLength="200"></def:datafieldcontrol>
    </td>
    <td class="odd">
      <!-- Date Began -->
      <def:datafieldcontrol runat="server" id="IHEDateBe" DatabaseField="IHEDateBe"  IsEntryField="true" IsDoubleEntryField="true"  FieldTextBoxWidth="75px "></def:datafieldcontrol>
    </td>
    <td class="odd">
      <!-- Date Ended -->
      <def:datafieldcontrol runat="server" id="IHEDateEn" DatabaseField="IHEDateEn"  IsEntryField="true" IsDoubleEntryField="true"  FieldTextBoxWidth="75px "></def:datafieldcontrol>
    </td>
    <td class="odd">
      <!-- Frequency or Dose Amount -->
      <def:datafieldcontrol runat="server" id="IHE6Value" DatabaseField="IHE6Value"  FormatString="{0:f2}" IsEntryField="true" IsDoubleEntryField="true"  FieldTextBoxWidth="30px "></def:datafieldcontrol>
    </td>
    <td class="odd">
      <!-- Frequency or Dose Units -->
      <def:datafieldcontrol runat="server" id="IHE6Hours" DatabaseField="IHE6Hours"  IsEntryField="true" IsDoubleEntryField="true"  FieldTextBoxWidth="30px " ></def:datafieldcontrol>
    </td>
    <td class="odd">
      <!-- Specify "Other" Units -->
      <def:datafieldcontrol runat="server" id="IHE6OUnit" DatabaseField="IHE6OUnit"  IsEntryField="true" IsDoubleEntryField="true"  FieldTextBoxWidth="75px" FieldTextBoxMaxLength="50"></def:datafieldcontrol>
    </td>
    <td class="odd">
      <!-- Group or Individual -->
      <def:datafieldcontrol runat="server" id="IHEGrOrIn" DatabaseField="IHEGrOrIn"  IsEntryField="true" IsDoubleEntryField="true"  FieldTextBoxWidth="30px "></def:datafieldcontrol>
    </td>
    <td class="odd">
      <!-- Class Adults -->
      <def:datafieldcontrol runat="server" id="IHEClassA" DatabaseField="IHEClassA"  IsEntryField="true" IsDoubleEntryField="true"  FieldTextBoxWidth="30px "></def:datafieldcontrol>
    </td>
    <td class="odd">
      <!-- Class Children -->
      <def:datafieldcontrol runat="server" id="IHEClassC" DatabaseField="IHEClassC"  IsEntryField="true" IsDoubleEntryField="true"  FieldTextBoxWidth="30px "></def:datafieldcontrol>
    </td>
    <td class="odd">
      <!-- Provider Background -->
      <def:datafieldcontrol runat="server" id="IHEProvid" DatabaseField="IHEProvid"  IsEntryField="true" IsDoubleEntryField="true"  FieldTextBoxWidth="30px "></def:datafieldcontrol>
    </td>
    <td class="odd">
      <!-- Break (in weeks) -->
      <def:datafieldcontrol runat="server" id="IHEBreak" DatabaseField="IHEBreak"  IsEntryField="true" IsDoubleEntryField="true"  FieldTextBoxWidth="30px "></def:datafieldcontrol>
    </td>
    <td class="odd">
      <!-- Intensity -->
      <def:datafieldcontrol runat="server" id="IHEIntens" DatabaseField="IHEIntens"  IsEntryField="false" IsReadOnly="true"  FieldTextBoxWidth="30px "></def:datafieldcontrol>
    </td>
  </tr>
  <tr>
    <td class="odd" colspan="14">
      <!-- Details -->
      <def:datafieldcontrol runat="server" id="IHEDetails" DatabaseField="IHEDetails"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="100px" FieldTextBoxWidth="900px" FieldTextBoxHeight="32px" FieldTextBoxMaxLength="500" FieldTextBoxTextMode="MultiLine"></def:datafieldcontrol>    
    </td>
  </tr>
  <tr>
    <td>
      Type of Intervention
    </td>
    <td>
      Name of School/Service Provider
    </td>
    <td>
      Setting
    </td>
    <td>
      Date Began
    </td>
    <td>
      Date Ended
    </td>
    <td>
      Frequency or Dose Amount
    </td>
    <td>
      Frequency or Dose Units      
    </td>
    <td>
      Specify "Other" Units
    </td>
    <td>
      Group or Individual
    </td>
    <td>
      Class Adults
    </td>
    <td>
      Class Children
    </td>
    <td>
      Provider Background
    </td>
    <td>
      Break (in weeks)
    </td>
    <td>
      Intensity
    </td>
  </tr>
  <tr> <!-- F Group -->
    <td class="even">
      <!-- Type of Intervention -->
      <def:datafieldcontrol runat="server" id="IHFTypeOI" DatabaseField="IHFTypeOI"  IsEntryField="true" IsDoubleEntryField="true"  FieldTextBoxWidth="30px "></def:datafieldcontrol>
    </td>
    <td class="even">
      <!-- Name of School/Service Provider -->
      <def:datafieldcontrol runat="server" id="IHFNameSP" DatabaseField="IHFNameSP"  IsEntryField="true" IsDoubleEntryField="true"  FieldTextBoxWidth="150px" FieldTextBoxMaxLength="100"></def:datafieldcontrol>
    </td>
    <td class="even">
      <!-- Setting -->
      <def:datafieldcontrol runat="server" id="IHFSetting" DatabaseField="IHFSetting"  IsEntryField="true" IsDoubleEntryField="true"  FieldTextBoxWidth="150px" FieldTextBoxMaxLength="200"></def:datafieldcontrol>
    </td>
    <td class="even">
      <!-- Date Began -->
      <def:datafieldcontrol runat="server" id="IHFDateBe" DatabaseField="IHFDateBe"  IsEntryField="true" IsDoubleEntryField="true"  FieldTextBoxWidth="75px "></def:datafieldcontrol>
    </td>
    <td class="even">
      <!-- Date Ended -->
      <def:datafieldcontrol runat="server" id="IHFDateEn" DatabaseField="IHFDateEn"  IsEntryField="true" IsDoubleEntryField="true"  FieldTextBoxWidth="75px "></def:datafieldcontrol>
    </td>
    <td class="even">
      <!-- Frequency or Dose Amount -->
      <def:datafieldcontrol runat="server" id="IHF6Value" DatabaseField="IHF6Value"  FormatString="{0:f2}" IsEntryField="true" IsDoubleEntryField="true"  FieldTextBoxWidth="30px "></def:datafieldcontrol>
    </td>
    <td class="even">
      <!-- Frequency or Dose Units -->
      <def:datafieldcontrol runat="server" id="IHF6Hours" DatabaseField="IHF6Hours"  IsEntryField="true" IsDoubleEntryField="true"  FieldTextBoxWidth="30px " ></def:datafieldcontrol>
    </td>
    <td class="even">
      <!-- Specify "Other" Units -->
      <def:datafieldcontrol runat="server" id="IHF6OUnit" DatabaseField="IHF6OUnit"  IsEntryField="true" IsDoubleEntryField="true"  FieldTextBoxWidth="75px" FieldTextBoxMaxLength="50"></def:datafieldcontrol>
    </td>
    <td class="even">
      <!-- Group or Individual -->
      <def:datafieldcontrol runat="server" id="IHFGrOrIn" DatabaseField="IHFGrOrIn"  IsEntryField="true" IsDoubleEntryField="true"  FieldTextBoxWidth="30px "></def:datafieldcontrol>
    </td>
    <td class="even">
      <!-- Class Adults -->
      <def:datafieldcontrol runat="server" id="IHFClassA" DatabaseField="IHFClassA"  IsEntryField="true" IsDoubleEntryField="true"  FieldTextBoxWidth="30px "></def:datafieldcontrol>
    </td>
    <td class="even">
      <!-- Class Children -->
      <def:datafieldcontrol runat="server" id="IHFClassC" DatabaseField="IHFClassC"  IsEntryField="true" IsDoubleEntryField="true"  FieldTextBoxWidth="30px "></def:datafieldcontrol>
    </td>
    <td class="even">
      <!-- Provider Background -->
      <def:datafieldcontrol runat="server" id="IHFProvid" DatabaseField="IHFProvid"  IsEntryField="true" IsDoubleEntryField="true"  FieldTextBoxWidth="30px "></def:datafieldcontrol>
    </td>
    <td class="even">
      <!-- Break (in weeks) -->
      <def:datafieldcontrol runat="server" id="IHFBreak" DatabaseField="IHFBreak"  IsEntryField="true" IsDoubleEntryField="true"  FieldTextBoxWidth="30px "></def:datafieldcontrol>
    </td>
    <td class="even">
      <!-- Intensity -->
      <def:datafieldcontrol runat="server" id="IHFIntens" DatabaseField="IHFIntens"  IsEntryField="false" IsReadOnly="true"  FieldTextBoxWidth="30px "></def:datafieldcontrol>
    </td>
  </tr>
  <tr>
    <td class="even" colspan="14">
      <!-- Details -->
      <def:datafieldcontrol runat="server" id="IHFDetails" DatabaseField="IHFDetails"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="100px" FieldTextBoxWidth="900px" FieldTextBoxHeight="32px" FieldTextBoxMaxLength="500" FieldTextBoxTextMode="MultiLine"></def:datafieldcontrol>    
    </td>
  </tr>
  <tr> <!-- G Group -->
    <td class="odd">
      <!-- Type of Intervention -->
      <def:datafieldcontrol runat="server" id="IHGTypeOI" DatabaseField="IHGTypeOI"  IsEntryField="true" IsDoubleEntryField="true"  FieldTextBoxWidth="30px "></def:datafieldcontrol>
    </td>
    <td class="odd">
      <!-- Name of School/Service Provider -->
      <def:datafieldcontrol runat="server" id="IHGNameSP" DatabaseField="IHGNameSP"  IsEntryField="true" IsDoubleEntryField="true"  FieldTextBoxWidth="150px" FieldTextBoxMaxLength="100"></def:datafieldcontrol>
    </td>
    <td class="odd">
      <!-- Setting -->
      <def:datafieldcontrol runat="server" id="IHGSetting" DatabaseField="IHGSetting"  IsEntryField="true" IsDoubleEntryField="true"  FieldTextBoxWidth="150px" FieldTextBoxMaxLength="200"></def:datafieldcontrol>
    </td>
    <td class="odd">
      <!-- Date Began -->
      <def:datafieldcontrol runat="server" id="IHGDateBe" DatabaseField="IHGDateBe"  IsEntryField="true" IsDoubleEntryField="true"  FieldTextBoxWidth="75px "></def:datafieldcontrol>
    </td>
    <td class="odd">
      <!-- Date Ended -->
      <def:datafieldcontrol runat="server" id="IHGDateEn" DatabaseField="IHGDateEn"  IsEntryField="true" IsDoubleEntryField="true"  FieldTextBoxWidth="75px "></def:datafieldcontrol>
    </td>
    <td class="odd">
      <!-- Frequency or Dose Amount -->
      <def:datafieldcontrol runat="server" id="IHG6Value" DatabaseField="IHG6Value"  FormatString="{0:f2}" IsEntryField="true" IsDoubleEntryField="true"  FieldTextBoxWidth="30px "></def:datafieldcontrol>
    </td>
    <td class="odd">
      <!-- Frequency or Dose Units -->
      <def:datafieldcontrol runat="server" id="IHG6Hours" DatabaseField="IHG6Hours"  IsEntryField="true" IsDoubleEntryField="true"  FieldTextBoxWidth="30px " ></def:datafieldcontrol>
    </td>
    <td class="odd">
      <!-- Specify "Other" Units -->
      <def:datafieldcontrol runat="server" id="IHG6OUnit" DatabaseField="IHG6OUnit"  IsEntryField="true" IsDoubleEntryField="true"  FieldTextBoxWidth="75px" FieldTextBoxMaxLength="50"></def:datafieldcontrol>
    </td>
    <td class="odd">
      <!-- Group or Individual -->
      <def:datafieldcontrol runat="server" id="IHGGrOrIn" DatabaseField="IHGGrOrIn"  IsEntryField="true" IsDoubleEntryField="true"  FieldTextBoxWidth="30px "></def:datafieldcontrol>
    </td>
    <td class="odd">
      <!-- Class Adults -->
      <def:datafieldcontrol runat="server" id="IHGClassA" DatabaseField="IHGClassA"  IsEntryField="true" IsDoubleEntryField="true"  FieldTextBoxWidth="30px "></def:datafieldcontrol>
    </td>
    <td class="odd">
      <!-- Class Children -->
      <def:datafieldcontrol runat="server" id="IHGClassC" DatabaseField="IHGClassC"  IsEntryField="true" IsDoubleEntryField="true"  FieldTextBoxWidth="30px "></def:datafieldcontrol>
    </td>
    <td class="odd">
      <!-- Provider Background -->
      <def:datafieldcontrol runat="server" id="IHGProvid" DatabaseField="IHGProvid"  IsEntryField="true" IsDoubleEntryField="true"  FieldTextBoxWidth="30px "></def:datafieldcontrol>
    </td>
    <td class="odd">
      <!-- Break (in weeks) -->
      <def:datafieldcontrol runat="server" id="IHGBreak" DatabaseField="IHGBreak"  IsEntryField="true" IsDoubleEntryField="true"  FieldTextBoxWidth="30px "></def:datafieldcontrol>
    </td>
    <td class="odd">
      <!-- Intensity -->
      <def:datafieldcontrol runat="server" id="IHGIntens" DatabaseField="IHGIntens"  IsEntryField="false" IsReadOnly="true"  FieldTextBoxWidth="30px "></def:datafieldcontrol>
    </td>
  </tr>
  <tr>
    <td class="odd" colspan="14">
      <!-- Details -->
      <def:datafieldcontrol runat="server" id="IHGDetails" DatabaseField="IHGDetails"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="100px" FieldTextBoxWidth="900px" FieldTextBoxHeight="32px" FieldTextBoxMaxLength="500" FieldTextBoxTextMode="MultiLine"></def:datafieldcontrol>    
    </td>
  </tr>
  <tr> <!-- H Group -->
    <td class="even">
      <!-- Type of Intervention -->
      <def:datafieldcontrol runat="server" id="IHHTypeOI" DatabaseField="IHHTypeOI"  IsEntryField="true" IsDoubleEntryField="true"  FieldTextBoxWidth="30px "></def:datafieldcontrol>
    </td>
    <td class="even">
      <!-- Name of School/Service Provider -->
      <def:datafieldcontrol runat="server" id="IHHNameSP" DatabaseField="IHHNameSP"  IsEntryField="true" IsDoubleEntryField="true"  FieldTextBoxWidth="150px" FieldTextBoxMaxLength="100"></def:datafieldcontrol>
    </td>
    <td class="even">
      <!-- Setting -->
      <def:datafieldcontrol runat="server" id="IHHSetting" DatabaseField="IHHSetting"  IsEntryField="true" IsDoubleEntryField="true"  FieldTextBoxWidth="150px" FieldTextBoxMaxLength="200"></def:datafieldcontrol>
    </td>
    <td class="even">
      <!-- Date Began -->
      <def:datafieldcontrol runat="server" id="IHHDateBe" DatabaseField="IHHDateBe"  IsEntryField="true" IsDoubleEntryField="true"  FieldTextBoxWidth="75px "></def:datafieldcontrol>
    </td>
    <td class="even">
      <!-- Date Ended -->
      <def:datafieldcontrol runat="server" id="IHHDateEn" DatabaseField="IHHDateEn"  IsEntryField="true" IsDoubleEntryField="true"  FieldTextBoxWidth="75px "></def:datafieldcontrol>
    </td>
    <td class="even">
      <!-- Frequency or Dose Amount -->
      <def:datafieldcontrol runat="server" id="IHH6Value" DatabaseField="IHH6Value"  FormatString="{0:f2}" IsEntryField="true" IsDoubleEntryField="true"  FieldTextBoxWidth="30px "></def:datafieldcontrol>
    </td>
    <td class="even">
      <!-- Frequency or Dose Units -->
      <def:datafieldcontrol runat="server" id="IHH6Hours" DatabaseField="IHH6Hours"  IsEntryField="true" IsDoubleEntryField="true"  FieldTextBoxWidth="30px " ></def:datafieldcontrol>
    </td>
    <td class="even">
      <!-- Specify "Other" Units -->
      <def:datafieldcontrol runat="server" id="IHH6OUnit" DatabaseField="IHH6OUnit"  IsEntryField="true" IsDoubleEntryField="true"  FieldTextBoxWidth="75px" FieldTextBoxMaxLength="50"></def:datafieldcontrol>
    </td>
    <td class="even">
      <!-- Group or Individual -->
      <def:datafieldcontrol runat="server" id="IHHGrOrIn" DatabaseField="IHHGrOrIn"  IsEntryField="true" IsDoubleEntryField="true"  FieldTextBoxWidth="30px "></def:datafieldcontrol>
    </td>
    <td class="even">
      <!-- Class Adults -->
      <def:datafieldcontrol runat="server" id="IHHClassA" DatabaseField="IHHClassA"  IsEntryField="true" IsDoubleEntryField="true"  FieldTextBoxWidth="30px "></def:datafieldcontrol>
    </td>
    <td class="even">
      <!-- Class Children -->
      <def:datafieldcontrol runat="server" id="IHHClassC" DatabaseField="IHHClassC"  IsEntryField="true" IsDoubleEntryField="true"  FieldTextBoxWidth="30px "></def:datafieldcontrol>
    </td>
    <td class="even">
      <!-- Provider Background -->
      <def:datafieldcontrol runat="server" id="IHHProvid" DatabaseField="IHHProvid"  IsEntryField="true" IsDoubleEntryField="true"  FieldTextBoxWidth="30px "></def:datafieldcontrol>
    </td>
    <td class="even">
      <!-- Break (in weeks) -->
      <def:datafieldcontrol runat="server" id="IHHBreak" DatabaseField="IHHBreak"  IsEntryField="true" IsDoubleEntryField="true"  FieldTextBoxWidth="30px "></def:datafieldcontrol>
    </td>
    <td class="even">
      <!-- Intensity -->
      <def:datafieldcontrol runat="server" id="IHHIntens" DatabaseField="IHHIntens"  IsEntryField="false" IsReadOnly="true"  FieldTextBoxWidth="30px "></def:datafieldcontrol>
    </td>
  </tr>
  <tr>
    <td class="even" colspan="14">
      <!-- Details -->
      <def:datafieldcontrol runat="server" id="IHHDetails" DatabaseField="IHHDetails"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="100px" FieldTextBoxWidth="900px" FieldTextBoxHeight="32px" FieldTextBoxMaxLength="500" FieldTextBoxTextMode="MultiLine"></def:datafieldcontrol>    
    </td>
  </tr>
  <tr> <!-- I Group -->
    <td class="odd">
      <!-- Type of Intervention -->
      <def:datafieldcontrol runat="server" id="IHITypeOI" DatabaseField="IHITypeOI"  IsEntryField="true" IsDoubleEntryField="true"  FieldTextBoxWidth="30px "></def:datafieldcontrol>
    </td>
    <td class="odd">
      <!-- Name of School/Service Provider -->
      <def:datafieldcontrol runat="server" id="IHINameSP" DatabaseField="IHINameSP"  IsEntryField="true" IsDoubleEntryField="true"  FieldTextBoxWidth="150px" FieldTextBoxMaxLength="100"></def:datafieldcontrol>
    </td>
    <td class="odd">
      <!-- Setting -->
      <def:datafieldcontrol runat="server" id="IHISetting" DatabaseField="IHISetting"  IsEntryField="true" IsDoubleEntryField="true"  FieldTextBoxWidth="150px" FieldTextBoxMaxLength="200"></def:datafieldcontrol>
    </td>
    <td class="odd">
      <!-- Date Began -->
      <def:datafieldcontrol runat="server" id="IHIDateBe" DatabaseField="IHIDateBe"  IsEntryField="true" IsDoubleEntryField="true"  FieldTextBoxWidth="75px "></def:datafieldcontrol>
    </td>
    <td class="odd">
      <!-- Date Ended -->
      <def:datafieldcontrol runat="server" id="IHIDateEn" DatabaseField="IHIDateEn"  IsEntryField="true" IsDoubleEntryField="true"  FieldTextBoxWidth="75px "></def:datafieldcontrol>
    </td>
    <td class="odd">
      <!-- Frequency or Dose Amount -->
      <def:datafieldcontrol runat="server" id="IHI6Value" DatabaseField="IHI6Value"  FormatString="{0:f2}" IsEntryField="true" IsDoubleEntryField="true"  FieldTextBoxWidth="30px "></def:datafieldcontrol>
    </td>
    <td class="odd">
      <!-- Frequency or Dose Units -->
      <def:datafieldcontrol runat="server" id="IHI6Hours" DatabaseField="IHI6Hours"  IsEntryField="true" IsDoubleEntryField="true"  FieldTextBoxWidth="30px " ></def:datafieldcontrol>
    </td>
    <td class="odd">
      <!-- Specify "Other" Units -->
      <def:datafieldcontrol runat="server" id="IHI6OUnit" DatabaseField="IHI6OUnit"  IsEntryField="true" IsDoubleEntryField="true"  FieldTextBoxWidth="75px" FieldTextBoxMaxLength="50"></def:datafieldcontrol>
    </td>
    <td class="odd">
      <!-- Group or Individual -->
      <def:datafieldcontrol runat="server" id="IHIGrOrIn" DatabaseField="IHIGrOrIn"  IsEntryField="true" IsDoubleEntryField="true"  FieldTextBoxWidth="30px "></def:datafieldcontrol>
    </td>
    <td class="odd">
      <!-- Class Adults -->
      <def:datafieldcontrol runat="server" id="IHIClassA" DatabaseField="IHIClassA"  IsEntryField="true" IsDoubleEntryField="true"  FieldTextBoxWidth="30px "></def:datafieldcontrol>
    </td>
    <td class="odd">
      <!-- Class Children -->
      <def:datafieldcontrol runat="server" id="IHIClassC" DatabaseField="IHIClassC"  IsEntryField="true" IsDoubleEntryField="true"  FieldTextBoxWidth="30px "></def:datafieldcontrol>
    </td>
    <td class="odd">
      <!-- Provider Background -->
      <def:datafieldcontrol runat="server" id="IHIProvid" DatabaseField="IHIProvid"  IsEntryField="true" IsDoubleEntryField="true"  FieldTextBoxWidth="30px "></def:datafieldcontrol>
    </td>
    <td class="odd">
      <!-- Break (in weeks) -->
      <def:datafieldcontrol runat="server" id="IHIBreak" DatabaseField="IHIBreak"  IsEntryField="true" IsDoubleEntryField="true"  FieldTextBoxWidth="30px "></def:datafieldcontrol>
    </td>
    <td class="odd">
      <!-- Intensity -->
      <def:datafieldcontrol runat="server" id="IHIIntens" DatabaseField="IHIIntens"  IsEntryField="false" IsReadOnly="true"  FieldTextBoxWidth="30px "></def:datafieldcontrol>
    </td>
  </tr>
  <tr>
    <td class="odd" colspan="14">
      <!-- Details -->
      <def:datafieldcontrol runat="server" id="IHIDetails" DatabaseField="IHIDetails"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="100px" FieldTextBoxWidth="900px" FieldTextBoxHeight="32px" FieldTextBoxMaxLength="500" FieldTextBoxTextMode="MultiLine"></def:datafieldcontrol>    
    </td>
  </tr>
  <tr> <!-- J Group -->
    <td class="even">
      <!-- Type of Intervention -->
      <def:datafieldcontrol runat="server" id="IHJTypeOI" DatabaseField="IHJTypeOI"  IsEntryField="true" IsDoubleEntryField="true"  FieldTextBoxWidth="30px "></def:datafieldcontrol>
    </td>
    <td class="even">
      <!-- Name of School/Service Provider -->
      <def:datafieldcontrol runat="server" id="IHJNameSP" DatabaseField="IHJNameSP"  IsEntryField="true" IsDoubleEntryField="true"  FieldTextBoxWidth="150px" FieldTextBoxMaxLength="100"></def:datafieldcontrol>
    </td>
    <td class="even">
      <!-- Setting -->
      <def:datafieldcontrol runat="server" id="IHJSetting" DatabaseField="IHJSetting"  IsEntryField="true" IsDoubleEntryField="true"  FieldTextBoxWidth="150px" FieldTextBoxMaxLength="200"></def:datafieldcontrol>
    </td>
    <td class="even">
      <!-- Date Began -->
      <def:datafieldcontrol runat="server" id="IHJDateBe" DatabaseField="IHJDateBe"  IsEntryField="true" IsDoubleEntryField="true"  FieldTextBoxWidth="75px "></def:datafieldcontrol>
    </td>
    <td class="even">
      <!-- Date Ended -->
      <def:datafieldcontrol runat="server" id="IHJDateEn" DatabaseField="IHJDateEn"  IsEntryField="true" IsDoubleEntryField="true"  FieldTextBoxWidth="75px "></def:datafieldcontrol>
    </td>
    <td class="even">
      <!-- Frequency or Dose Amount -->
      <def:datafieldcontrol runat="server" id="IHJ6Value" DatabaseField="IHJ6Value"  FormatString="{0:f2}" IsEntryField="true" IsDoubleEntryField="true"  FieldTextBoxWidth="30px "></def:datafieldcontrol>
    </td>
    <td class="even">
      <!-- Frequency or Dose Units -->
      <def:datafieldcontrol runat="server" id="IHJ6Hours" DatabaseField="IHJ6Hours"  IsEntryField="true" IsDoubleEntryField="true"  FieldTextBoxWidth="30px " ></def:datafieldcontrol>
    </td>
    <td class="even">
      <!-- Specify "Other" Units -->
      <def:datafieldcontrol runat="server" id="IHJ6OUnit" DatabaseField="IHJ6OUnit"  IsEntryField="true" IsDoubleEntryField="true"  FieldTextBoxWidth="75px" FieldTextBoxMaxLength="50"></def:datafieldcontrol>
    </td>
    <td class="even">
      <!-- Group or Individual -->
      <def:datafieldcontrol runat="server" id="IHJGrOrIn" DatabaseField="IHJGrOrIn"  IsEntryField="true" IsDoubleEntryField="true"  FieldTextBoxWidth="30px "></def:datafieldcontrol>
    </td>
    <td class="even">
      <!-- Class Adults -->
      <def:datafieldcontrol runat="server" id="IHJClassA" DatabaseField="IHJClassA"  IsEntryField="true" IsDoubleEntryField="true"  FieldTextBoxWidth="30px "></def:datafieldcontrol>
    </td>
    <td class="even">
      <!-- Class Children -->
      <def:datafieldcontrol runat="server" id="IHJClassC" DatabaseField="IHJClassC"  IsEntryField="true" IsDoubleEntryField="true"  FieldTextBoxWidth="30px "></def:datafieldcontrol>
    </td>
    <td class="even">
      <!-- Provider Background -->
      <def:datafieldcontrol runat="server" id="IHJProvid" DatabaseField="IHJProvid"  IsEntryField="true" IsDoubleEntryField="true"  FieldTextBoxWidth="30px "></def:datafieldcontrol>
    </td>
    <td class="even">
      <!-- Break (in weeks) -->
      <def:datafieldcontrol runat="server" id="IHJBreak" DatabaseField="IHJBreak"  IsEntryField="true" IsDoubleEntryField="true"  FieldTextBoxWidth="30px "></def:datafieldcontrol>
    </td>
    <td class="even">
      <!-- Intensity -->
      <def:datafieldcontrol runat="server" id="IHJIntens" DatabaseField="IHJIntens"  IsEntryField="false" IsReadOnly="true"  FieldTextBoxWidth="30px "></def:datafieldcontrol>
    </td>
  </tr>
  <tr>
    <td class="even" colspan="14">
      <!-- Details -->
      <def:datafieldcontrol runat="server" id="IHJDetails" DatabaseField="IHJDetails"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="100px" FieldTextBoxWidth="900px" FieldTextBoxHeight="32px" FieldTextBoxMaxLength="500" FieldTextBoxTextMode="MultiLine"></def:datafieldcontrol>    
    </td>
  </tr>
  <tr>
    <td>
      Type of Intervention
    </td>
    <td>
      Name of School/Service Provider
    </td>
    <td>
      Setting
    </td>
    <td>
      Date Began
    </td>
    <td>
      Date Ended
    </td>
    <td>
      Frequency or Dose Amount
    </td>
    <td>
      Frequency or Dose Units      
    </td>
    <td>
      Specify "Other" Units
    </td>
    <td>
      Group or Individual
    </td>
    <td>
      Class Adults
    </td>
    <td>
      Class Children
    </td>
    <td>
      Provider Background
    </td>
    <td>
      Break (in weeks)
    </td>
    <td>
      Intensity
    </td>
  </tr>
  <tr> <!-- K Group -->
    <td class="even">
      <!-- Type of Intervention -->
      <def:datafieldcontrol runat="server" id="IHKTypeOI" DatabaseField="IHKTypeOI"  IsEntryField="true" IsDoubleEntryField="true"  FieldTextBoxWidth="30px "></def:datafieldcontrol>
    </td>
    <td class="even">
      <!-- Name of School/Service Provider -->
      <def:datafieldcontrol runat="server" id="IHKNameSP" DatabaseField="IHKNameSP"  IsEntryField="true" IsDoubleEntryField="true"  FieldTextBoxWidth="150px" FieldTextBoxMaxLength="100"></def:datafieldcontrol>
    </td>
    <td class="even">
      <!-- Setting -->
      <def:datafieldcontrol runat="server" id="IHKSetting" DatabaseField="IHKSetting"  IsEntryField="true" IsDoubleEntryField="true"  FieldTextBoxWidth="150px" FieldTextBoxMaxLength="200"></def:datafieldcontrol>
    </td>
    <td class="even">
      <!-- Date Began -->
      <def:datafieldcontrol runat="server" id="IHKDateBe" DatabaseField="IHKDateBe"  IsEntryField="true" IsDoubleEntryField="true"  FieldTextBoxWidth="75px "></def:datafieldcontrol>
    </td>
    <td class="even">
      <!-- Date Ended -->
      <def:datafieldcontrol runat="server" id="IHKDateEn" DatabaseField="IHKDateEn"  IsEntryField="true" IsDoubleEntryField="true"  FieldTextBoxWidth="75px "></def:datafieldcontrol>
    </td>
    <td class="even">
      <!-- Frequency or Dose Amount -->
      <def:datafieldcontrol runat="server" id="IHK6Value" DatabaseField="IHK6Value"  FormatString="{0:f2}" IsEntryField="true" IsDoubleEntryField="true"  FieldTextBoxWidth="30px "></def:datafieldcontrol>
    </td>
    <td class="even">
      <!-- Frequency or Dose Units -->
      <def:datafieldcontrol runat="server" id="IHK6Hours" DatabaseField="IHK6Hours"  IsEntryField="true" IsDoubleEntryField="true"  FieldTextBoxWidth="30px " ></def:datafieldcontrol>
    </td>
    <td class="even">
      <!-- Specify "Other" Units -->
      <def:datafieldcontrol runat="server" id="IHK6OUnit" DatabaseField="IHK6OUnit"  IsEntryField="true" IsDoubleEntryField="true"  FieldTextBoxWidth="75px" FieldTextBoxMaxLength="50"></def:datafieldcontrol>
    </td>
    <td class="even">
      <!-- Group or Individual -->
      <def:datafieldcontrol runat="server" id="IHKGrOrIn" DatabaseField="IHKGrOrIn"  IsEntryField="true" IsDoubleEntryField="true"  FieldTextBoxWidth="30px "></def:datafieldcontrol>
    </td>
    <td class="even">
      <!-- Class Adults -->
      <def:datafieldcontrol runat="server" id="IHKClassA" DatabaseField="IHKClassA"  IsEntryField="true" IsDoubleEntryField="true"  FieldTextBoxWidth="30px "></def:datafieldcontrol>
    </td>
    <td class="even">
      <!-- Class Children -->
      <def:datafieldcontrol runat="server" id="IHKClassC" DatabaseField="IHKClassC"  IsEntryField="true" IsDoubleEntryField="true"  FieldTextBoxWidth="30px "></def:datafieldcontrol>
    </td>
    <td class="even">
      <!-- Provider Background -->
      <def:datafieldcontrol runat="server" id="IHKProvid" DatabaseField="IHKProvid"  IsEntryField="true" IsDoubleEntryField="true"  FieldTextBoxWidth="30px "></def:datafieldcontrol>
    </td>
    <td class="even">
      <!-- Break (in weeks) -->
      <def:datafieldcontrol runat="server" id="IHKBreak" DatabaseField="IHKBreak"  IsEntryField="true" IsDoubleEntryField="true"  FieldTextBoxWidth="30px "></def:datafieldcontrol>
    </td>
    <td class="even">
      <!-- Intensity -->
      <def:datafieldcontrol runat="server" id="IHKIntens" DatabaseField="IHKIntens"  IsEntryField="false" IsReadOnly="true"  FieldTextBoxWidth="30px "></def:datafieldcontrol>
    </td>
  </tr>
  <tr>
    <td class="even" colspan="14">
      <!-- Details -->
      <def:datafieldcontrol runat="server" id="IHKDetails" DatabaseField="IHKDetails"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="100px" FieldTextBoxWidth="900px" FieldTextBoxHeight="32px" FieldTextBoxMaxLength="500" FieldTextBoxTextMode="MultiLine"></def:datafieldcontrol>    
    </td>
  </tr>
  <tr> <!-- L Group -->
    <td class="even">
      <!-- Type of Intervention -->
      <def:datafieldcontrol runat="server" id="IHLTypeOI" DatabaseField="IHLTypeOI"  IsEntryField="true" IsDoubleEntryField="true"  FieldTextBoxWidth="30px "></def:datafieldcontrol>
    </td>
    <td class="even">
      <!-- Name of School/Service Provider -->
      <def:datafieldcontrol runat="server" id="IHLNameSP" DatabaseField="IHLNameSP"  IsEntryField="true" IsDoubleEntryField="true"  FieldTextBoxWidth="150px" FieldTextBoxMaxLength="100"></def:datafieldcontrol>
    </td>
    <td class="even">
      <!-- Setting -->
      <def:datafieldcontrol runat="server" id="IHLSetting" DatabaseField="IHLSetting"  IsEntryField="true" IsDoubleEntryField="true"  FieldTextBoxWidth="150px" FieldTextBoxMaxLength="200"></def:datafieldcontrol>
    </td>
    <td class="even">
      <!-- Date Began -->
      <def:datafieldcontrol runat="server" id="IHLDateBe" DatabaseField="IHLDateBe"  IsEntryField="true" IsDoubleEntryField="true"  FieldTextBoxWidth="75px "></def:datafieldcontrol>
    </td>
    <td class="even">
      <!-- Date Ended -->
      <def:datafieldcontrol runat="server" id="IHLDateEn" DatabaseField="IHLDateEn"  IsEntryField="true" IsDoubleEntryField="true"  FieldTextBoxWidth="75px "></def:datafieldcontrol>
    </td>
    <td class="even">
      <!-- Frequency or Dose Amount -->
      <def:datafieldcontrol runat="server" id="IHL6Value" DatabaseField="IHL6Value"  FormatString="{0:f2}" IsEntryField="true" IsDoubleEntryField="true"  FieldTextBoxWidth="30px "></def:datafieldcontrol>
    </td>
    <td class="even">
      <!-- Frequency or Dose Units -->
      <def:datafieldcontrol runat="server" id="IHL6Hours" DatabaseField="IHL6Hours"  IsEntryField="true" IsDoubleEntryField="true"  FieldTextBoxWidth="30px " ></def:datafieldcontrol>
    </td>
    <td class="even">
      <!-- Specify "Other" Units -->
      <def:datafieldcontrol runat="server" id="IHL6OUnit" DatabaseField="IHL6OUnit"  IsEntryField="true" IsDoubleEntryField="true"  FieldTextBoxWidth="75px" FieldTextBoxMaxLength="50"></def:datafieldcontrol>
    </td>
    <td class="even">
      <!-- Group or Individual -->
      <def:datafieldcontrol runat="server" id="IHLGrOrIn" DatabaseField="IHLGrOrIn"  IsEntryField="true" IsDoubleEntryField="true"  FieldTextBoxWidth="30px "></def:datafieldcontrol>
    </td>
    <td class="even">
      <!-- Class Adults -->
      <def:datafieldcontrol runat="server" id="IHLClassA" DatabaseField="IHLClassA"  IsEntryField="true" IsDoubleEntryField="true"  FieldTextBoxWidth="30px "></def:datafieldcontrol>
    </td>
    <td class="even">
      <!-- Class Children -->
      <def:datafieldcontrol runat="server" id="IHLClassC" DatabaseField="IHLClassC"  IsEntryField="true" IsDoubleEntryField="true"  FieldTextBoxWidth="30px "></def:datafieldcontrol>
    </td>
    <td class="even">
      <!-- Provider Background -->
      <def:datafieldcontrol runat="server" id="IHLProvid" DatabaseField="IHLProvid"  IsEntryField="true" IsDoubleEntryField="true"  FieldTextBoxWidth="30px "></def:datafieldcontrol>
    </td>
    <td class="even">
      <!-- Break (in weeks) -->
      <def:datafieldcontrol runat="server" id="IHLBreak" DatabaseField="IHLBreak"  IsEntryField="true" IsDoubleEntryField="true"  FieldTextBoxWidth="30px "></def:datafieldcontrol>
    </td>
    <td class="even">
      <!-- Intensity -->
      <def:datafieldcontrol runat="server" id="IHLIntens" DatabaseField="IHLIntens"  IsEntryField="false" IsReadOnly="true"  FieldTextBoxWidth="30px "></def:datafieldcontrol>
    </td>
  </tr>
  <tr>
    <td class="even" colspan="14">
      <!-- Details -->
      <def:datafieldcontrol runat="server" id="IHLDetails" DatabaseField="IHLDetails"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="100px" FieldTextBoxWidth="900px" FieldTextBoxHeight="32px" FieldTextBoxMaxLength="500" FieldTextBoxTextMode="MultiLine"></def:datafieldcontrol>    
    </td>
  </tr>
  <tr> <!-- M Group -->
    <td class="odd">
      <!-- Type of Intervention -->
      <def:datafieldcontrol runat="server" id="IHMTypeOI" DatabaseField="IHMTypeOI"  IsEntryField="true" IsDoubleEntryField="true"  FieldTextBoxWidth="30px "></def:datafieldcontrol>
    </td>
    <td class="odd">
      <!-- Name of School/Service Provider -->
      <def:datafieldcontrol runat="server" id="IHMNameSP" DatabaseField="IHMNameSP"  IsEntryField="true" IsDoubleEntryField="true"  FieldTextBoxWidth="150px" FieldTextBoxMaxLength="100"></def:datafieldcontrol>
    </td>
    <td class="odd">
      <!-- Setting -->
      <def:datafieldcontrol runat="server" id="IHMSetting" DatabaseField="IHMSetting"  IsEntryField="true" IsDoubleEntryField="true"  FieldTextBoxWidth="150px" FieldTextBoxMaxLength="200"></def:datafieldcontrol>
    </td>
    <td class="odd">
      <!-- Date Began -->
      <def:datafieldcontrol runat="server" id="IHMDateBe" DatabaseField="IHMDateBe"  IsEntryField="true" IsDoubleEntryField="true"  FieldTextBoxWidth="75px "></def:datafieldcontrol>
    </td>
    <td class="odd">
      <!-- Date Ended -->
      <def:datafieldcontrol runat="server" id="IHMDateEn" DatabaseField="IHMDateEn"  IsEntryField="true" IsDoubleEntryField="true"  FieldTextBoxWidth="75px "></def:datafieldcontrol>
    </td>
    <td class="odd">
      <!-- Frequency or Dose Amount -->
      <def:datafieldcontrol runat="server" id="IHM6Value" DatabaseField="IHM6Value"  FormatString="{0:f2}" IsEntryField="true" IsDoubleEntryField="true"  FieldTextBoxWidth="30px "></def:datafieldcontrol>
    </td>
    <td class="odd">
      <!-- Frequency or Dose Units -->
      <def:datafieldcontrol runat="server" id="IHM6Hours" DatabaseField="IHM6Hours"  IsEntryField="true" IsDoubleEntryField="true"  FieldTextBoxWidth="30px " ></def:datafieldcontrol>
    </td>
    <td class="odd">
      <!-- Specify "Other" Units -->
      <def:datafieldcontrol runat="server" id="IHM6OUnit" DatabaseField="IHM6OUnit"  IsEntryField="true" IsDoubleEntryField="true"  FieldTextBoxWidth="75px" FieldTextBoxMaxLength="50"></def:datafieldcontrol>
    </td>
    <td class="odd">
      <!-- Group or Individual -->
      <def:datafieldcontrol runat="server" id="IHMGrOrIn" DatabaseField="IHMGrOrIn"  IsEntryField="true" IsDoubleEntryField="true"  FieldTextBoxWidth="30px "></def:datafieldcontrol>
    </td>
    <td class="odd">
      <!-- Class Adults -->
      <def:datafieldcontrol runat="server" id="IHMClassA" DatabaseField="IHMClassA"  IsEntryField="true" IsDoubleEntryField="true"  FieldTextBoxWidth="30px "></def:datafieldcontrol>
    </td>
    <td class="odd">
      <!-- Class Children -->
      <def:datafieldcontrol runat="server" id="IHMClassC" DatabaseField="IHMClassC"  IsEntryField="true" IsDoubleEntryField="true"  FieldTextBoxWidth="30px "></def:datafieldcontrol>
    </td>
    <td class="odd">
      <!-- Provider Background -->
      <def:datafieldcontrol runat="server" id="IHMProvid" DatabaseField="IHMProvid"  IsEntryField="true" IsDoubleEntryField="true"  FieldTextBoxWidth="30px "></def:datafieldcontrol>
    </td>
    <td class="odd">
      <!-- Break (in weeks) -->
      <def:datafieldcontrol runat="server" id="IHMBreak" DatabaseField="IHMBreak"  IsEntryField="true" IsDoubleEntryField="true"  FieldTextBoxWidth="30px "></def:datafieldcontrol>
    </td>
    <td class="odd">
      <!-- Intensity -->
      <def:datafieldcontrol runat="server" id="IHMIntens" DatabaseField="IHMIntens"  IsEntryField="false" IsReadOnly="true"  FieldTextBoxWidth="30px "></def:datafieldcontrol>
    </td>
  </tr>
  <tr>
    <td class="odd" colspan="14">
      <!-- Details -->
      <def:datafieldcontrol runat="server" id="IHMDetails" DatabaseField="IHMDetails"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="100px" FieldTextBoxWidth="900px" FieldTextBoxHeight="32px" FieldTextBoxMaxLength="500" FieldTextBoxTextMode="MultiLine"></def:datafieldcontrol>    
    </td>
  </tr>
  <tr> <!-- N Group -->
    <td class="even">
      <!-- Type of Intervention -->
      <def:datafieldcontrol runat="server" id="IHNTypeOI" DatabaseField="IHNTypeOI"  IsEntryField="true" IsDoubleEntryField="true"  FieldTextBoxWidth="30px "></def:datafieldcontrol>
    </td>
    <td class="even">
      <!-- Name of School/Service Provider -->
      <def:datafieldcontrol runat="server" id="IHNNameSP" DatabaseField="IHNNameSP"  IsEntryField="true" IsDoubleEntryField="true"  FieldTextBoxWidth="150px" FieldTextBoxMaxLength="100"></def:datafieldcontrol>
    </td>
    <td class="even">
      <!-- Setting -->
      <def:datafieldcontrol runat="server" id="IHNSetting" DatabaseField="IHNSetting"  IsEntryField="true" IsDoubleEntryField="true"  FieldTextBoxWidth="150px" FieldTextBoxMaxLength="200"></def:datafieldcontrol>
    </td>
    <td class="even">
      <!-- Date Began -->
      <def:datafieldcontrol runat="server" id="IHNDateBe" DatabaseField="IHNDateBe"  IsEntryField="true" IsDoubleEntryField="true"  FieldTextBoxWidth="75px "></def:datafieldcontrol>
    </td>
    <td class="even">
      <!-- Date Ended -->
      <def:datafieldcontrol runat="server" id="IHNDateEn" DatabaseField="IHNDateEn"  IsEntryField="true" IsDoubleEntryField="true"  FieldTextBoxWidth="75px "></def:datafieldcontrol>
    </td>
    <td class="even">
      <!-- Frequency or Dose Amount -->
      <def:datafieldcontrol runat="server" id="IHN6Value" DatabaseField="IHN6Value"  FormatString="{0:f2}" IsEntryField="true" IsDoubleEntryField="true"  FieldTextBoxWidth="30px "></def:datafieldcontrol>
    </td>
    <td class="even">
      <!-- Frequency or Dose Units -->
      <def:datafieldcontrol runat="server" id="IHN6Hours" DatabaseField="IHN6Hours"  IsEntryField="true" IsDoubleEntryField="true"  FieldTextBoxWidth="30px " ></def:datafieldcontrol>
    </td>
    <td class="even">
      <!-- Specify "Other" Units -->
      <def:datafieldcontrol runat="server" id="IHN6OUnit" DatabaseField="IHN6OUnit"  IsEntryField="true" IsDoubleEntryField="true"  FieldTextBoxWidth="75px" FieldTextBoxMaxLength="50"></def:datafieldcontrol>
    </td>
    <td class="even">
      <!-- Group or Individual -->
      <def:datafieldcontrol runat="server" id="IHNGrOrIn" DatabaseField="IHNGrOrIn"  IsEntryField="true" IsDoubleEntryField="true"  FieldTextBoxWidth="30px "></def:datafieldcontrol>
    </td>
    <td class="even">
      <!-- Class Adults -->
      <def:datafieldcontrol runat="server" id="IHNClassA" DatabaseField="IHNClassA"  IsEntryField="true" IsDoubleEntryField="true"  FieldTextBoxWidth="30px "></def:datafieldcontrol>
    </td>
    <td class="even">
      <!-- Class Children -->
      <def:datafieldcontrol runat="server" id="IHNClassC" DatabaseField="IHNClassC"  IsEntryField="true" IsDoubleEntryField="true"  FieldTextBoxWidth="30px "></def:datafieldcontrol>
    </td>
    <td class="even">
      <!-- Provider Background -->
      <def:datafieldcontrol runat="server" id="IHNProvid" DatabaseField="IHNProvid"  IsEntryField="true" IsDoubleEntryField="true"  FieldTextBoxWidth="30px "></def:datafieldcontrol>
    </td>
    <td class="even">
      <!-- Break (in weeks) -->
      <def:datafieldcontrol runat="server" id="IHNBreak" DatabaseField="IHNBreak"  IsEntryField="true" IsDoubleEntryField="true"  FieldTextBoxWidth="30px "></def:datafieldcontrol>
    </td>
    <td class="even">
      <!-- Intensity -->
      <def:datafieldcontrol runat="server" id="IHNIntens" DatabaseField="IHNIntens"  IsEntryField="false" IsReadOnly="true"  FieldTextBoxWidth="30px "></def:datafieldcontrol>
    </td>
  </tr>
  <tr>
    <td class="even" colspan="14">
      <!-- Details -->
      <def:datafieldcontrol runat="server" id="IHNDetails" DatabaseField="IHNDetails"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="100px" FieldTextBoxWidth="900px" FieldTextBoxHeight="32px" FieldTextBoxMaxLength="500" FieldTextBoxTextMode="MultiLine"></def:datafieldcontrol>    
    </td>
  </tr>
  <tr> <!-- O Group -->
    <td class="odd">
      <!-- Type of Intervention -->
      <def:datafieldcontrol runat="server" id="IHOTypeOI" DatabaseField="IHOTypeOI"  IsEntryField="true" IsDoubleEntryField="true"  FieldTextBoxWidth="30px "></def:datafieldcontrol>
    </td>
    <td class="odd">
      <!-- Name of School/Service Provider -->
      <def:datafieldcontrol runat="server" id="IHONameSP" DatabaseField="IHONameSP"  IsEntryField="true" IsDoubleEntryField="true"  FieldTextBoxWidth="150px" FieldTextBoxMaxLength="100"></def:datafieldcontrol>
    </td>
    <td class="odd">
      <!-- Setting -->
      <def:datafieldcontrol runat="server" id="IHOSetting" DatabaseField="IHOSetting"  IsEntryField="true" IsDoubleEntryField="true"  FieldTextBoxWidth="150px" FieldTextBoxMaxLength="200"></def:datafieldcontrol>
    </td>
    <td class="odd">
      <!-- Date Began -->
      <def:datafieldcontrol runat="server" id="IHODateBe" DatabaseField="IHODateBe"  IsEntryField="true" IsDoubleEntryField="true"  FieldTextBoxWidth="75px "></def:datafieldcontrol>
    </td>
    <td class="odd">
      <!-- Date Ended -->
      <def:datafieldcontrol runat="server" id="IHODateEn" DatabaseField="IHODateEn"  IsEntryField="true" IsDoubleEntryField="true"  FieldTextBoxWidth="75px "></def:datafieldcontrol>
    </td>
    <td class="odd">
      <!-- Frequency or Dose Amount -->
      <def:datafieldcontrol runat="server" id="IHO6Value" DatabaseField="IHO6Value"  FormatString="{0:f2}" IsEntryField="true" IsDoubleEntryField="true"  FieldTextBoxWidth="30px "></def:datafieldcontrol>
    </td>
    <td class="odd">
      <!-- Frequency or Dose Units -->
      <def:datafieldcontrol runat="server" id="IHO6Hours" DatabaseField="IHO6Hours"  IsEntryField="true" IsDoubleEntryField="true"  FieldTextBoxWidth="30px " ></def:datafieldcontrol>
    </td>
    <td class="odd">
      <!-- Specify "Other" Units -->
      <def:datafieldcontrol runat="server" id="IHO6OUnit" DatabaseField="IHO6OUnit"  IsEntryField="true" IsDoubleEntryField="true"  FieldTextBoxWidth="75px" FieldTextBoxMaxLength="50"></def:datafieldcontrol>
    </td>
    <td class="odd">
      <!-- Group or Individual -->
      <def:datafieldcontrol runat="server" id="IHOGrOrIn" DatabaseField="IHOGrOrIn"  IsEntryField="true" IsDoubleEntryField="true"  FieldTextBoxWidth="30px "></def:datafieldcontrol>
    </td>
    <td class="odd">
      <!-- Class Adults -->
      <def:datafieldcontrol runat="server" id="IHOClassA" DatabaseField="IHOClassA"  IsEntryField="true" IsDoubleEntryField="true"  FieldTextBoxWidth="30px "></def:datafieldcontrol>
    </td>
    <td class="odd">
      <!-- Class Children -->
      <def:datafieldcontrol runat="server" id="IHOClassC" DatabaseField="IHOClassC"  IsEntryField="true" IsDoubleEntryField="true"  FieldTextBoxWidth="30px "></def:datafieldcontrol>
    </td>
    <td class="odd">
      <!-- Provider Background -->
      <def:datafieldcontrol runat="server" id="IHOProvid" DatabaseField="IHOProvid"  IsEntryField="true" IsDoubleEntryField="true"  FieldTextBoxWidth="30px "></def:datafieldcontrol>
    </td>
    <td class="odd">
      <!-- Break (in weeks) -->
      <def:datafieldcontrol runat="server" id="IHOBreak" DatabaseField="IHOBreak"  IsEntryField="true" IsDoubleEntryField="true"  FieldTextBoxWidth="30px "></def:datafieldcontrol>
    </td>
    <td class="odd">
      <!-- Intensity -->
      <def:datafieldcontrol runat="server" id="IHOIntens" DatabaseField="IHOIntens"  IsEntryField="false" IsReadOnly="true"  FieldTextBoxWidth="30px "></def:datafieldcontrol>
    </td>
  </tr>
  <tr>
    <td class="odd" colspan="14">
      <!-- Details -->
      <def:datafieldcontrol runat="server" id="IHODetails" DatabaseField="IHODetails"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="100px" FieldTextBoxWidth="900px" FieldTextBoxHeight="32px" FieldTextBoxMaxLength="500" FieldTextBoxTextMode="MultiLine"></def:datafieldcontrol>    
    </td>
  </tr>
  <tr>
    <td>
      Type of Intervention
    </td>
    <td>
      Name of School/Service Provider
    </td>
    <td>
      Setting
    </td>
    <td>
      Date Began
    </td>
    <td>
      Date Ended
    </td>
    <td>
      Frequency or Dose Amount
    </td>
    <td>
      Frequency or Dose Units      
    </td>
    <td>
      Specify "Other" Units
    </td>
    <td>
      Group or Individual
    </td>
    <td>
      Class Adults
    </td>
    <td>
      Class Children
    </td>
    <td>
      Provider Background
    </td>
    <td>
      Break (in weeks)
    </td>
    <td>
      Intensity
    </td>
  </tr>
  <tr> <!-- P Group -->
    <td class="even">
      <!-- Type of Intervention -->
      <def:datafieldcontrol runat="server" id="IHPTypeOI" DatabaseField="IHPTypeOI"  IsEntryField="true" IsDoubleEntryField="true"  FieldTextBoxWidth="30px "></def:datafieldcontrol>
    </td>
    <td class="even">
      <!-- Name of School/Service Provider -->
      <def:datafieldcontrol runat="server" id="IHPNameSP" DatabaseField="IHPNameSP"  IsEntryField="true" IsDoubleEntryField="true"  FieldTextBoxWidth="150px" FieldTextBoxMaxLength="100"></def:datafieldcontrol>
    </td>
    <td class="even">
      <!-- Setting -->
      <def:datafieldcontrol runat="server" id="IHPSetting" DatabaseField="IHPSetting"  IsEntryField="true" IsDoubleEntryField="true"  FieldTextBoxWidth="150px" FieldTextBoxMaxLength="200"></def:datafieldcontrol>
    </td>
    <td class="even">
      <!-- Date Began -->
      <def:datafieldcontrol runat="server" id="IHPDateBe" DatabaseField="IHPDateBe"  IsEntryField="true" IsDoubleEntryField="true"  FieldTextBoxWidth="75px "></def:datafieldcontrol>
    </td>
    <td class="even">
      <!-- Date Ended -->
      <def:datafieldcontrol runat="server" id="IHPDateEn" DatabaseField="IHPDateEn"  IsEntryField="true" IsDoubleEntryField="true"  FieldTextBoxWidth="75px "></def:datafieldcontrol>
    </td>
    <td class="even">
      <!-- Frequency or Dose Amount -->
      <def:datafieldcontrol runat="server" id="IHP6Value" DatabaseField="IHP6Value"  FormatString="{0:f2}" IsEntryField="true" IsDoubleEntryField="true"  FieldTextBoxWidth="30px "></def:datafieldcontrol>
    </td>
    <td class="even">
      <!-- Frequency or Dose Units -->
      <def:datafieldcontrol runat="server" id="IHP6Hours" DatabaseField="IHP6Hours"  IsEntryField="true" IsDoubleEntryField="true"  FieldTextBoxWidth="30px " ></def:datafieldcontrol>
    </td>
    <td class="even">
      <!-- Specify "Other" Units -->
      <def:datafieldcontrol runat="server" id="IHP6OUnit" DatabaseField="IHP6OUnit"  IsEntryField="true" IsDoubleEntryField="true"  FieldTextBoxWidth="75px" FieldTextBoxMaxLength="50"></def:datafieldcontrol>
    </td>
    <td class="even">
      <!-- Group or Individual -->
      <def:datafieldcontrol runat="server" id="IHPGrOrIn" DatabaseField="IHPGrOrIn"  IsEntryField="true" IsDoubleEntryField="true"  FieldTextBoxWidth="30px "></def:datafieldcontrol>
    </td>
    <td class="even">
      <!-- Class Adults -->
      <def:datafieldcontrol runat="server" id="IHPClassA" DatabaseField="IHPClassA"  IsEntryField="true" IsDoubleEntryField="true"  FieldTextBoxWidth="30px "></def:datafieldcontrol>
    </td>
    <td class="even">
      <!-- Class Children -->
      <def:datafieldcontrol runat="server" id="IHPClassC" DatabaseField="IHPClassC"  IsEntryField="true" IsDoubleEntryField="true"  FieldTextBoxWidth="30px "></def:datafieldcontrol>
    </td>
    <td class="even">
      <!-- Provider Background -->
      <def:datafieldcontrol runat="server" id="IHPProvid" DatabaseField="IHPProvid"  IsEntryField="true" IsDoubleEntryField="true"  FieldTextBoxWidth="30px "></def:datafieldcontrol>
    </td>
    <td class="even">
      <!-- Break (in weeks) -->
      <def:datafieldcontrol runat="server" id="IHPBreak" DatabaseField="IHPBreak"  IsEntryField="true" IsDoubleEntryField="true"  FieldTextBoxWidth="30px "></def:datafieldcontrol>
    </td>
    <td class="even">
      <!-- Intensity -->
      <def:datafieldcontrol runat="server" id="IHPIntens" DatabaseField="IHPIntens"  IsEntryField="false" IsReadOnly="true"  FieldTextBoxWidth="30px "></def:datafieldcontrol>
    </td>
  </tr>
  <tr>
    <td class="even" colspan="14">
      <!-- Details -->
      <def:datafieldcontrol runat="server" id="IHPDetails" DatabaseField="IHPDetails"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="100px" FieldTextBoxWidth="900px" FieldTextBoxHeight="32px" FieldTextBoxMaxLength="500" FieldTextBoxTextMode="MultiLine"></def:datafieldcontrol>    
    </td>
  </tr>
  <tr> <!-- Q Group -->
    <td class="odd">
      <!-- Type of Intervention -->
      <def:datafieldcontrol runat="server" id="IHQTypeOI" DatabaseField="IHQTypeOI"  IsEntryField="true" IsDoubleEntryField="true"  FieldTextBoxWidth="30px "></def:datafieldcontrol>
    </td>
    <td class="odd">
      <!-- Name of School/Service Provider -->
      <def:datafieldcontrol runat="server" id="IHQNameSP" DatabaseField="IHQNameSP"  IsEntryField="true" IsDoubleEntryField="true"  FieldTextBoxWidth="150px" FieldTextBoxMaxLength="100"></def:datafieldcontrol>
    </td>
    <td class="odd">
      <!-- Setting -->
      <def:datafieldcontrol runat="server" id="IHQSetting" DatabaseField="IHQSetting"  IsEntryField="true" IsDoubleEntryField="true"  FieldTextBoxWidth="150px" FieldTextBoxMaxLength="200"></def:datafieldcontrol>
    </td>
    <td class="odd">
      <!-- Date Began -->
      <def:datafieldcontrol runat="server" id="IHQDateBe" DatabaseField="IHQDateBe"  IsEntryField="true" IsDoubleEntryField="true"  FieldTextBoxWidth="75px "></def:datafieldcontrol>
    </td>
    <td class="odd">
      <!-- Date Ended -->
      <def:datafieldcontrol runat="server" id="IHQDateEn" DatabaseField="IHQDateEn"  IsEntryField="true" IsDoubleEntryField="true"  FieldTextBoxWidth="75px "></def:datafieldcontrol>
    </td>
    <td class="odd">
      <!-- Frequency or Dose Amount -->
      <def:datafieldcontrol runat="server" id="IHQ6Value" DatabaseField="IHQ6Value"  FormatString="{0:f2}" IsEntryField="true" IsDoubleEntryField="true"  FieldTextBoxWidth="30px "></def:datafieldcontrol>
    </td>
    <td class="odd">
      <!-- Frequency or Dose Units -->
      <def:datafieldcontrol runat="server" id="IHQ6Hours" DatabaseField="IHQ6Hours"  IsEntryField="true" IsDoubleEntryField="true"  FieldTextBoxWidth="30px " ></def:datafieldcontrol>
    </td>
    <td class="odd">
      <!-- Specify "Other" Units -->
      <def:datafieldcontrol runat="server" id="IHQ6OUnit" DatabaseField="IHQ6OUnit"  IsEntryField="true" IsDoubleEntryField="true"  FieldTextBoxWidth="75px" FieldTextBoxMaxLength="50"></def:datafieldcontrol>
    </td>
    <td class="odd">
      <!-- Group or Individual -->
      <def:datafieldcontrol runat="server" id="IHQGrOrIn" DatabaseField="IHQGrOrIn"  IsEntryField="true" IsDoubleEntryField="true"  FieldTextBoxWidth="30px "></def:datafieldcontrol>
    </td>
    <td class="odd">
      <!-- Class Adults -->
      <def:datafieldcontrol runat="server" id="IHQClassA" DatabaseField="IHQClassA"  IsEntryField="true" IsDoubleEntryField="true"  FieldTextBoxWidth="30px "></def:datafieldcontrol>
    </td>
    <td class="odd">
      <!-- Class Children -->
      <def:datafieldcontrol runat="server" id="IHQClassC" DatabaseField="IHQClassC"  IsEntryField="true" IsDoubleEntryField="true"  FieldTextBoxWidth="30px "></def:datafieldcontrol>
    </td>
    <td class="odd">
      <!-- Provider Background -->
      <def:datafieldcontrol runat="server" id="IHQProvid" DatabaseField="IHQProvid"  IsEntryField="true" IsDoubleEntryField="true"  FieldTextBoxWidth="30px "></def:datafieldcontrol>
    </td>
    <td class="odd">
      <!-- Break (in weeks) -->
      <def:datafieldcontrol runat="server" id="IHQBreak" DatabaseField="IHQBreak"  IsEntryField="true" IsDoubleEntryField="true"  FieldTextBoxWidth="30px "></def:datafieldcontrol>
    </td>
    <td class="odd">
      <!-- Intensity -->
      <def:datafieldcontrol runat="server" id="IHQIntens" DatabaseField="IHQIntens"  IsEntryField="false" IsReadOnly="true"  FieldTextBoxWidth="30px "></def:datafieldcontrol>
    </td>
  </tr>
  <tr>
    <td class="odd" colspan="14">
      <!-- Details -->
      <def:datafieldcontrol runat="server" id="IHQDetails" DatabaseField="IHQDetails"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="100px" FieldTextBoxWidth="900px" FieldTextBoxHeight="32px" FieldTextBoxMaxLength="500" FieldTextBoxTextMode="MultiLine"></def:datafieldcontrol>    
    </td>
  </tr>
  <tr> <!-- R Group -->
    <td class="even">
      <!-- Type of Intervention -->
      <def:datafieldcontrol runat="server" id="IHRTypeOI" DatabaseField="IHRTypeOI"  IsEntryField="true" IsDoubleEntryField="true"  FieldTextBoxWidth="30px "></def:datafieldcontrol>
    </td>
    <td class="even">
      <!-- Name of School/Service Provider -->
      <def:datafieldcontrol runat="server" id="IHRNameSP" DatabaseField="IHRNameSP"  IsEntryField="true" IsDoubleEntryField="true"  FieldTextBoxWidth="150px" FieldTextBoxMaxLength="100"></def:datafieldcontrol>
    </td>
    <td class="even">
      <!-- Setting -->
      <def:datafieldcontrol runat="server" id="IHRSetting" DatabaseField="IHRSetting"  IsEntryField="true" IsDoubleEntryField="true"  FieldTextBoxWidth="150px" FieldTextBoxMaxLength="200"></def:datafieldcontrol>
    </td>
    <td class="even">
      <!-- Date Began -->
      <def:datafieldcontrol runat="server" id="IHRDateBe" DatabaseField="IHRDateBe"  IsEntryField="true" IsDoubleEntryField="true"  FieldTextBoxWidth="75px "></def:datafieldcontrol>
    </td>
    <td class="even">
      <!-- Date Ended -->
      <def:datafieldcontrol runat="server" id="IHRDateEn" DatabaseField="IHRDateEn"  IsEntryField="true" IsDoubleEntryField="true"  FieldTextBoxWidth="75px "></def:datafieldcontrol>
    </td>
    <td class="even">
      <!-- Frequency or Dose Amount -->
      <def:datafieldcontrol runat="server" id="IHR6Value" DatabaseField="IHR6Value"  FormatString="{0:f2}" IsEntryField="true" IsDoubleEntryField="true"  FieldTextBoxWidth="30px "></def:datafieldcontrol>
    </td>
    <td class="even">
      <!-- Frequency or Dose Units -->
      <def:datafieldcontrol runat="server" id="IHR6Hours" DatabaseField="IHR6Hours"  IsEntryField="true" IsDoubleEntryField="true"  FieldTextBoxWidth="30px " ></def:datafieldcontrol>
    </td>
    <td class="even">
      <!-- Specify "Other" Units -->
      <def:datafieldcontrol runat="server" id="IHR6OUnit" DatabaseField="IHR6OUnit"  IsEntryField="true" IsDoubleEntryField="true"  FieldTextBoxWidth="75px" FieldTextBoxMaxLength="50"></def:datafieldcontrol>
    </td>
    <td class="even">
      <!-- Group or Individual -->
      <def:datafieldcontrol runat="server" id="IHRGrOrIn" DatabaseField="IHRGrOrIn"  IsEntryField="true" IsDoubleEntryField="true"  FieldTextBoxWidth="30px "></def:datafieldcontrol>
    </td>
    <td class="even">
      <!-- Class Adults -->
      <def:datafieldcontrol runat="server" id="IHRClassA" DatabaseField="IHRClassA"  IsEntryField="true" IsDoubleEntryField="true"  FieldTextBoxWidth="30px "></def:datafieldcontrol>
    </td>
    <td class="even">
      <!-- Class Children -->
      <def:datafieldcontrol runat="server" id="IHRClassC" DatabaseField="IHRClassC"  IsEntryField="true" IsDoubleEntryField="true"  FieldTextBoxWidth="30px "></def:datafieldcontrol>
    </td>
    <td class="even">
      <!-- Provider Background -->
      <def:datafieldcontrol runat="server" id="IHRProvid" DatabaseField="IHRProvid"  IsEntryField="true" IsDoubleEntryField="true"  FieldTextBoxWidth="30px "></def:datafieldcontrol>
    </td>
    <td class="even">
      <!-- Break (in weeks) -->
      <def:datafieldcontrol runat="server" id="IHRBreak" DatabaseField="IHRBreak"  IsEntryField="true" IsDoubleEntryField="true"  FieldTextBoxWidth="30px "></def:datafieldcontrol>
    </td>
    <td class="even">
      <!-- Intensity -->
      <def:datafieldcontrol runat="server" id="IHRIntens" DatabaseField="IHRIntens"  IsEntryField="false" IsReadOnly="true"  FieldTextBoxWidth="30px "></def:datafieldcontrol>
    </td>
  </tr>
  <tr>
    <td class="even" colspan="14">
      <!-- Details -->
      <def:datafieldcontrol runat="server" id="IHRDetails" DatabaseField="IHRDetails"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="100px" FieldTextBoxWidth="900px" FieldTextBoxHeight="32px" FieldTextBoxMaxLength="500" FieldTextBoxTextMode="MultiLine"></def:datafieldcontrol>    
    </td>
  </tr>
  <tr> <!-- S Group -->
    <td class="odd">
      <!-- Type of Intervention -->
      <def:datafieldcontrol runat="server" id="IHSTypeOI" DatabaseField="IHSTypeOI"  IsEntryField="true" IsDoubleEntryField="true"  FieldTextBoxWidth="30px "></def:datafieldcontrol>
    </td>
    <td class="odd">
      <!-- Name of School/Service Provider -->
      <def:datafieldcontrol runat="server" id="IHSNameSP" DatabaseField="IHSNameSP"  IsEntryField="true" IsDoubleEntryField="true"  FieldTextBoxWidth="150px" FieldTextBoxMaxLength="100"></def:datafieldcontrol>
    </td>
    <td class="odd">
      <!-- Setting -->
      <def:datafieldcontrol runat="server" id="IHSSetting" DatabaseField="IHSSetting"  IsEntryField="true" IsDoubleEntryField="true"  FieldTextBoxWidth="150px" FieldTextBoxMaxLength="200"></def:datafieldcontrol>
    </td>
    <td class="odd">
      <!-- Date Began -->
      <def:datafieldcontrol runat="server" id="IHSDateBe" DatabaseField="IHSDateBe"  IsEntryField="true" IsDoubleEntryField="true"  FieldTextBoxWidth="75px "></def:datafieldcontrol>
    </td>
    <td class="odd">
      <!-- Date Ended -->
      <def:datafieldcontrol runat="server" id="IHSDateEn" DatabaseField="IHSDateEn"  IsEntryField="true" IsDoubleEntryField="true"  FieldTextBoxWidth="75px "></def:datafieldcontrol>
    </td>
    <td class="odd">
      <!-- Frequency or Dose Amount -->
      <def:datafieldcontrol runat="server" id="IHS6Value" DatabaseField="IHS6Value"  FormatString="{0:f2}" IsEntryField="true" IsDoubleEntryField="true"  FieldTextBoxWidth="30px "></def:datafieldcontrol>
    </td>
    <td class="odd">
      <!-- Frequency or Dose Units -->
      <def:datafieldcontrol runat="server" id="IHS6Hours" DatabaseField="IHS6Hours"  IsEntryField="true" IsDoubleEntryField="true"  FieldTextBoxWidth="30px " ></def:datafieldcontrol>
    </td>
    <td class="odd">
      <!-- Specify "Other" Units -->
      <def:datafieldcontrol runat="server" id="IHS6OUnit" DatabaseField="IHS6OUnit"  IsEntryField="true" IsDoubleEntryField="true"  FieldTextBoxWidth="75px" FieldTextBoxMaxLength="50"></def:datafieldcontrol>
    </td>
    <td class="odd">
      <!-- Group or Individual -->
      <def:datafieldcontrol runat="server" id="IHSGrOrIn" DatabaseField="IHSGrOrIn"  IsEntryField="true" IsDoubleEntryField="true"  FieldTextBoxWidth="30px "></def:datafieldcontrol>
    </td>
    <td class="odd">
      <!-- Class Adults -->
      <def:datafieldcontrol runat="server" id="IHSClassA" DatabaseField="IHSClassA"  IsEntryField="true" IsDoubleEntryField="true"  FieldTextBoxWidth="30px "></def:datafieldcontrol>
    </td>
    <td class="odd">
      <!-- Class Children -->
      <def:datafieldcontrol runat="server" id="IHSClassC" DatabaseField="IHSClassC"  IsEntryField="true" IsDoubleEntryField="true"  FieldTextBoxWidth="30px "></def:datafieldcontrol>
    </td>
    <td class="odd">
      <!-- Provider Background -->
      <def:datafieldcontrol runat="server" id="IHSProvid" DatabaseField="IHSProvid"  IsEntryField="true" IsDoubleEntryField="true"  FieldTextBoxWidth="30px "></def:datafieldcontrol>
    </td>
    <td class="odd">
      <!-- Break (in weeks) -->
      <def:datafieldcontrol runat="server" id="IHSBreak" DatabaseField="IHSBreak"  IsEntryField="true" IsDoubleEntryField="true"  FieldTextBoxWidth="30px "></def:datafieldcontrol>
    </td>
    <td class="odd">
      <!-- Intensity -->
      <def:datafieldcontrol runat="server" id="IHSIntens" DatabaseField="IHSIntens"  IsEntryField="false" IsReadOnly="true"  FieldTextBoxWidth="30px "></def:datafieldcontrol>
    </td>
  </tr>
  <tr>
    <td class="odd" colspan="14">
      <!-- Details -->
      <def:datafieldcontrol runat="server" id="IHSDetails" DatabaseField="IHSDetails"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="100px" FieldTextBoxWidth="900px" FieldTextBoxHeight="32px" FieldTextBoxMaxLength="500" FieldTextBoxTextMode="MultiLine"></def:datafieldcontrol>    
    </td>
  </tr>
  <tr> <!-- T Group -->
    <td class="even">
      <!-- Type of Intervention -->
      <def:datafieldcontrol runat="server" id="IHTTypeOI" DatabaseField="IHTTypeOI"  IsEntryField="true" IsDoubleEntryField="true"  FieldTextBoxWidth="30px "></def:datafieldcontrol>
    </td>
    <td class="even">
      <!-- Name of School/Service Provider -->
      <def:datafieldcontrol runat="server" id="IHTNameSP" DatabaseField="IHTNameSP"  IsEntryField="true" IsDoubleEntryField="true"  FieldTextBoxWidth="150px" FieldTextBoxMaxLength="100"></def:datafieldcontrol>
    </td>
    <td class="even">
      <!-- Setting -->
      <def:datafieldcontrol runat="server" id="IHTSetting" DatabaseField="IHTSetting"  IsEntryField="true" IsDoubleEntryField="true"  FieldTextBoxWidth="150px" FieldTextBoxMaxLength="200"></def:datafieldcontrol>
    </td>
    <td class="even">
      <!-- Date Began -->
      <def:datafieldcontrol runat="server" id="IHTDateBe" DatabaseField="IHTDateBe"  IsEntryField="true" IsDoubleEntryField="true"  FieldTextBoxWidth="75px "></def:datafieldcontrol>
    </td>
    <td class="even">
      <!-- Date Ended -->
      <def:datafieldcontrol runat="server" id="IHTDateEn" DatabaseField="IHTDateEn"  IsEntryField="true" IsDoubleEntryField="true"  FieldTextBoxWidth="75px "></def:datafieldcontrol>
    </td>
    <td class="even">
      <!-- Frequency or Dose Amount -->
      <def:datafieldcontrol runat="server" id="IHT6Value" DatabaseField="IHT6Value"  FormatString="{0:f2}" IsEntryField="true" IsDoubleEntryField="true"  FieldTextBoxWidth="30px "></def:datafieldcontrol>
    </td>
    <td class="even">
      <!-- Frequency or Dose Units -->
      <def:datafieldcontrol runat="server" id="IHT6Hours" DatabaseField="IHT6Hours"  IsEntryField="true" IsDoubleEntryField="true"  FieldTextBoxWidth="30px " ></def:datafieldcontrol>
    </td>
    <td class="even">
      <!-- Specify "Other" Units -->
      <def:datafieldcontrol runat="server" id="IHT6OUnit" DatabaseField="IHT6OUnit"  IsEntryField="true" IsDoubleEntryField="true"  FieldTextBoxWidth="75px" FieldTextBoxMaxLength="50"></def:datafieldcontrol>
    </td>
    <td class="even">
      <!-- Group or Individual -->
      <def:datafieldcontrol runat="server" id="IHTGrOrIn" DatabaseField="IHTGrOrIn"  IsEntryField="true" IsDoubleEntryField="true"  FieldTextBoxWidth="30px "></def:datafieldcontrol>
    </td>
    <td class="even">
      <!-- Class Adults -->
      <def:datafieldcontrol runat="server" id="IHTClassA" DatabaseField="IHTClassA"  IsEntryField="true" IsDoubleEntryField="true"  FieldTextBoxWidth="30px "></def:datafieldcontrol>
    </td>
    <td class="even">
      <!-- Class Children -->
      <def:datafieldcontrol runat="server" id="IHTClassC" DatabaseField="IHTClassC"  IsEntryField="true" IsDoubleEntryField="true"  FieldTextBoxWidth="30px "></def:datafieldcontrol>
    </td>
    <td class="even">
      <!-- Provider Background -->
      <def:datafieldcontrol runat="server" id="IHTProvid" DatabaseField="IHTProvid"  IsEntryField="true" IsDoubleEntryField="true"  FieldTextBoxWidth="30px "></def:datafieldcontrol>
    </td>
    <td class="even">
      <!-- Break (in weeks) -->
      <def:datafieldcontrol runat="server" id="IHTBreak" DatabaseField="IHTBreak"  IsEntryField="true" IsDoubleEntryField="true"  FieldTextBoxWidth="30px "></def:datafieldcontrol>
    </td>
    <td class="even">
      <!-- Intensity -->
      <def:datafieldcontrol runat="server" id="IHTIntens" DatabaseField="IHTIntens"  IsEntryField="false" IsReadOnly="true"  FieldTextBoxWidth="30px "></def:datafieldcontrol>
    </td>
  </tr>
  <tr>
    <td class="even" colspan="14">
      <!-- Details -->
      <def:datafieldcontrol runat="server" id="IHTDetails" DatabaseField="IHTDetails"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="100px" FieldTextBoxWidth="900px" FieldTextBoxHeight="32px" FieldTextBoxMaxLength="500" FieldTextBoxTextMode="MultiLine"></def:datafieldcontrol>    
    </td>
  </tr>
</table>
<table cellpadding="10" cellspacing="0" border="0">
  <tr>
    <td class="key" width="33%" style="vertical-align:top">
      1=ABA/discrete trial/Lovaas/intensive early intervention<br />
      2=Occupational therapy<br />
      3=Physical therapy<br />
      4=Speech therapy<br />
      5=Counseling/psychological services for child<br />
      6=Play therapy<br />
      7=Music therapy
    </td>
    <td class="key" width="34%" style="vertical-align:top">
      8=Auditory integration training<br />
      9=TEACCH<br />
      10=Developmental play therapy (Hanen, RDI)<br />
      11=Social skills training<br />
      12=Special Education<br />
      13=Parent-Child Socialization/Skill building Support<br />
      14=Recreational sports for child
    </td>
    <td class="key" width="33%" style="vertical-align:top">
      15=Typical class<br />
      16=Home program (not ABA)<br />
      17=Biomedical/Nutritional<br />
      18=Parenting class/Seminar<br />
      19=Counseling/psychological services for parent<br />
      20=Parent-Child Recreation<br />
      21=Integrated/Blended class<br />
      22=Home school
    </td>
  </tr>
</table>
</asp:Panel>
<br />
<def:datafieldcontrol runat="server" id="created" DatabaseField="created"  IsReadOnly="true" RenderReadOnlyAsDiv="true"   FieldLabelWidth="300px "></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="createdBy" DatabaseField="createdBy"  IsReadOnly="true" RenderReadOnlyAsDiv="true"   FieldLabelWidth="300px "></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="updated" DatabaseField="updated"  IsReadOnly="true" RenderReadOnlyAsDiv="true"   FieldLabelWidth="300px "></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="updatedBy" DatabaseField="updatedBy"  IsReadOnly="true" RenderReadOnlyAsDiv="true"   FieldLabelWidth="300px "></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="scored" DatabaseField="scored"  IsReadOnly="true" RenderReadOnlyAsDiv="true"   FieldLabelWidth="300px "></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="scoredBy" DatabaseField="scoredBy"  IsReadOnly="true" RenderReadOnlyAsDiv="true"   FieldLabelWidth="300px "></def:datafieldcontrol>
</asp:Content>
