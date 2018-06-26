<%@ Register TagPrefix="def" Namespace="DataEntryFramework3" %> 
<%@ Page language="c#" MasterPageFile="~/UWAC.master"  Title="SSRS 7-12 Teacher Form Data Entry" %>
<asp:Content ID="Content1" ContentPlaceHolderID="oBodyPlaceHolder" runat="server">
<style>
  .next { padding-left: 50px }
  .key { padding-left: 50px; text-align: right }
</style>
<def:dataentrycontroller id="DataEntryController1" runat="server" DatabaseTable="ALL_SSRS_7to12_Teacher" >
</def:dataentrycontroller>
<def:datafieldcontrol runat="server" id="id" DatabaseField="id"  IsInsertField="true" FieldLabelWidth="100px" FieldTextBoxMaxLength="15"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="indexnum" DatabaseField="indexnum"  IsInsertField="true" FieldLabelWidth="100px" FieldTextBoxTextDefault="1"></def:datafieldcontrol>
<table cellpadding="0" cellspacing="0" border="0">
  <tr>
    <td>
<def:datafieldcontrol runat="server" id="Handica" DatabaseField="Handica" FieldLabelText="Is this student handicapped?" IsInsertField="true" FieldLabelWidth="200px" FieldTextBoxWidth="50px"  CallOnBlur="SSRS_7to12_Teacher_onBlur"></def:datafieldcontrol>
    </td>
    <td class="next">
<def:ValueSetLabel ID="ValueSetLabel_Handica" runat="server"  DatabaseField="Handica"></def:ValueSetLabel>
    </td>
    <td class="next">
<def:datafieldcontrol runat="server" id="HaClass" DatabaseField="HaClass" FieldLabelText="Handicap classification" IsInsertField="true" IsInsertValueRequired="false" FieldLabelWidth="200px" FieldTextBoxWidth="50px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="HanSpec" DatabaseField="HanSpec" FieldLabelText="Specify other classification" IsInsertField="true" IsInsertValueRequired="false" FieldTextBoxMaxLength="50" FieldLabelWidth="200px"></def:datafieldcontrol>
    </td>
    <td class="next">
<def:ValueSetLabel ID="ValueSetLabel_HaClass" runat="server"  DatabaseField="HaClass"></def:ValueSetLabel>
    </td>
  </tr>
</table>
<br />
<table cellpadding="0" cellspacing="0" border="0">
  <tr>
    <td>
<def:datafieldcontrol runat="server" id="TeachAs" DatabaseField="TeachAs" FieldLabelText="Teaching Assignment" IsInsertField="true" FieldLabelWidth="200px" FieldTextBoxWidth="50px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="TeaSpec" DatabaseField="TeaSpec" FieldLabelText="Specify other assignment" IsInsertField="true" IsInsertValueRequired="false" FieldTextBoxMaxLength="50" FieldLabelWidth="200px"></def:datafieldcontrol>
    </td>
    <td class="next">
<def:ValueSetLabel ID="ValueSetLabel_TeachAs" runat="server"  DatabaseField="TeachAs"></def:ValueSetLabel>
    </td>
  </tr>
</table>
<br />
<asp:panel id="mainPanel" runat="server">
<br />

<h4>Social Skills</h4>

<table cellpadding="0" cellspacing="0" border="0">
  <tr>
    <td class="key">
<def:ValueSetLabel ID="ValueSetLabel_SS01Oft" runat="server"  DatabaseField="SS01Oft"></def:ValueSetLabel>
    </td>
    <td class="key">
<def:ValueSetLabel ID="ValueSetLabel_SS01Imp" runat="server"  DatabaseField="SS01Imp"></def:ValueSetLabel>
    </td>
  </tr>
  <tr>
    <td>
<def:datafieldcontrol runat="server" id="SS01Oft" DatabaseField="SS01Oft"  IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="50px"></def:datafieldcontrol>
    </td>
    <td class="next">
<def:datafieldcontrol runat="server" id="SS01Imp" DatabaseField="SS01Imp"  IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="125px" FieldTextBoxWidth="50px"></def:datafieldcontrol>
    </td>
  </tr>
  <tr>
    <td>
<def:datafieldcontrol runat="server" id="SS02Oft" DatabaseField="SS02Oft"  IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="50px"></def:datafieldcontrol>
    </td>
    <td class="next">
<def:datafieldcontrol runat="server" id="SS02Imp" DatabaseField="SS02Imp"  IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="125px" FieldTextBoxWidth="50px"></def:datafieldcontrol>
    </td>
  </tr>
  <tr>
    <td>
<def:datafieldcontrol runat="server" id="SS03Oft" DatabaseField="SS03Oft"  IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="50px"></def:datafieldcontrol>
    </td>
    <td class="next">
<def:datafieldcontrol runat="server" id="SS03Imp" DatabaseField="SS03Imp"  IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="125px" FieldTextBoxWidth="50px"></def:datafieldcontrol>
    </td>
  </tr>
  <tr>
    <td>
<def:datafieldcontrol runat="server" id="SS04Oft" DatabaseField="SS04Oft"  IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="50px"></def:datafieldcontrol>
    </td>
    <td class="next">
<def:datafieldcontrol runat="server" id="SS04Imp" DatabaseField="SS04Imp"  IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="125px" FieldTextBoxWidth="50px"></def:datafieldcontrol>
    </td>
  </tr>
  <tr>
    <td>
<def:datafieldcontrol runat="server" id="SS05Oft" DatabaseField="SS05Oft"  IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="50px"></def:datafieldcontrol>
    </td>
    <td class="next">
<def:datafieldcontrol runat="server" id="SS05Imp" DatabaseField="SS05Imp"  IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="125px" FieldTextBoxWidth="50px"></def:datafieldcontrol>
    </td>
  </tr>
  <tr>
    <td>
<def:datafieldcontrol runat="server" id="SS06Oft" DatabaseField="SS06Oft"  IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="50px"></def:datafieldcontrol>
    </td>
    <td class="next">
<def:datafieldcontrol runat="server" id="SS06Imp" DatabaseField="SS06Imp"  IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="125px" FieldTextBoxWidth="50px"></def:datafieldcontrol>
    </td>
  </tr>
  <tr>
    <td>
<def:datafieldcontrol runat="server" id="SS07Oft" DatabaseField="SS07Oft"  IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="50px"></def:datafieldcontrol>
    </td>
    <td class="next">
<def:datafieldcontrol runat="server" id="SS07Imp" DatabaseField="SS07Imp"  IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="125px" FieldTextBoxWidth="50px"></def:datafieldcontrol>
    </td>
  </tr>
  <tr>
    <td>
<def:datafieldcontrol runat="server" id="SS08Oft" DatabaseField="SS08Oft"  IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="50px"></def:datafieldcontrol>
    </td>
    <td class="next">
<def:datafieldcontrol runat="server" id="SS08Imp" DatabaseField="SS08Imp"  IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="125px" FieldTextBoxWidth="50px"></def:datafieldcontrol>
    </td>
  </tr>
  <tr>
    <td>
<def:datafieldcontrol runat="server" id="SS09Oft" DatabaseField="SS09Oft"  IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="50px"></def:datafieldcontrol>
    </td>
    <td class="next">
<def:datafieldcontrol runat="server" id="SS09Imp" DatabaseField="SS09Imp"  IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="125px" FieldTextBoxWidth="50px"></def:datafieldcontrol>
    </td>
  </tr>
  <tr>
    <td>
<def:datafieldcontrol runat="server" id="SS10Oft" DatabaseField="SS10Oft"  IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="50px"></def:datafieldcontrol>
    </td>
    <td class="next">
<def:datafieldcontrol runat="server" id="SS10Imp" DatabaseField="SS10Imp"  IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="125px" FieldTextBoxWidth="50px"></def:datafieldcontrol>
    </td>
  </tr>
  <tr>
    <td>
<def:datafieldcontrol runat="server" id="SS11Oft" DatabaseField="SS11Oft"  IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="50px"></def:datafieldcontrol>
    </td>
    <td class="next">
<def:datafieldcontrol runat="server" id="SS11Imp" DatabaseField="SS11Imp"  IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="125px" FieldTextBoxWidth="50px"></def:datafieldcontrol>
    </td>
  </tr>
  <tr>
    <td>
<def:datafieldcontrol runat="server" id="SS12Oft" DatabaseField="SS12Oft"  IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="50px"></def:datafieldcontrol>
    </td>
    <td class="next">
<def:datafieldcontrol runat="server" id="SS12Imp" DatabaseField="SS12Imp"  IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="125px" FieldTextBoxWidth="50px"></def:datafieldcontrol>
    </td>
  </tr>
  <tr>
    <td>
<def:datafieldcontrol runat="server" id="SS13Oft" DatabaseField="SS13Oft"  IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="50px"></def:datafieldcontrol>
    </td>
    <td class="next">
<def:datafieldcontrol runat="server" id="SS13Imp" DatabaseField="SS13Imp"  IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="125px" FieldTextBoxWidth="50px"></def:datafieldcontrol>
    </td>
  </tr>
  <tr>
    <td>
<def:datafieldcontrol runat="server" id="SS14Oft" DatabaseField="SS14Oft"  IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="50px"></def:datafieldcontrol>
    </td>
    <td class="next">
<def:datafieldcontrol runat="server" id="SS14Imp" DatabaseField="SS14Imp"  IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="125px" FieldTextBoxWidth="50px"></def:datafieldcontrol>
    </td>
  </tr>
  <tr>
    <td>
<def:datafieldcontrol runat="server" id="SS15Oft" DatabaseField="SS15Oft"  IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="50px"></def:datafieldcontrol>
    </td>
    <td class="next">
<def:datafieldcontrol runat="server" id="SS15Imp" DatabaseField="SS15Imp"  IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="125px" FieldTextBoxWidth="50px"></def:datafieldcontrol>
    </td>
  </tr>
  <tr>
    <td>
<def:datafieldcontrol runat="server" id="SS16Oft" DatabaseField="SS16Oft"  IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="50px"></def:datafieldcontrol>
    </td>
    <td class="next">
<def:datafieldcontrol runat="server" id="SS16Imp" DatabaseField="SS16Imp"  IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="125px" FieldTextBoxWidth="50px"></def:datafieldcontrol>
    </td>
  </tr>
  <tr>
    <td>
<def:datafieldcontrol runat="server" id="SS17Oft" DatabaseField="SS17Oft"  IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="50px"></def:datafieldcontrol>
    </td>
    <td class="next">
<def:datafieldcontrol runat="server" id="SS17Imp" DatabaseField="SS17Imp"  IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="125px" FieldTextBoxWidth="50px"></def:datafieldcontrol>
    </td>
  </tr>
  <tr>
    <td>
<def:datafieldcontrol runat="server" id="SS18Oft" DatabaseField="SS18Oft"  IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="50px"></def:datafieldcontrol>
    </td>
    <td class="next">
<def:datafieldcontrol runat="server" id="SS18Imp" DatabaseField="SS18Imp"  IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="125px" FieldTextBoxWidth="50px"></def:datafieldcontrol>
    </td>
  </tr>
  <tr>
    <td>
<def:datafieldcontrol runat="server" id="SS19Oft" DatabaseField="SS19Oft"  IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="50px"></def:datafieldcontrol>
    </td>
    <td class="next">
<def:datafieldcontrol runat="server" id="SS19Imp" DatabaseField="SS19Imp"  IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="125px" FieldTextBoxWidth="50px"></def:datafieldcontrol>
    </td>
  </tr>
  <tr>
    <td>
<def:datafieldcontrol runat="server" id="SS20Oft" DatabaseField="SS20Oft"  IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="50px"></def:datafieldcontrol>
    </td>
    <td class="next">
<def:datafieldcontrol runat="server" id="SS20Imp" DatabaseField="SS20Imp"  IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="125px" FieldTextBoxWidth="50px"></def:datafieldcontrol>
    </td>
  </tr>
  <tr>
    <td>
<def:datafieldcontrol runat="server" id="SS21Oft" DatabaseField="SS21Oft"  IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="50px"></def:datafieldcontrol>
    </td>
    <td class="next">
<def:datafieldcontrol runat="server" id="SS21Imp" DatabaseField="SS21Imp"  IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="125px" FieldTextBoxWidth="50px"></def:datafieldcontrol>
    </td>
  </tr>
  <tr>
    <td>
<def:datafieldcontrol runat="server" id="SS22Oft" DatabaseField="SS22Oft"  IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="50px"></def:datafieldcontrol>
    </td>
    <td class="next">
<def:datafieldcontrol runat="server" id="SS22Imp" DatabaseField="SS22Imp"  IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="125px" FieldTextBoxWidth="50px"></def:datafieldcontrol>
    </td>
  </tr>
  <tr>
    <td>
<def:datafieldcontrol runat="server" id="SS23Oft" DatabaseField="SS23Oft"  IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="50px"></def:datafieldcontrol>
    </td>
    <td class="next">
<def:datafieldcontrol runat="server" id="SS23Imp" DatabaseField="SS23Imp"  IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="125px" FieldTextBoxWidth="50px"></def:datafieldcontrol>
    </td>
  </tr>
  <tr>
    <td>
<def:datafieldcontrol runat="server" id="SS24Oft" DatabaseField="SS24Oft"  IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="50px"></def:datafieldcontrol>
    </td>
    <td class="next">
<def:datafieldcontrol runat="server" id="SS24Imp" DatabaseField="SS24Imp"  IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="125px" FieldTextBoxWidth="50px"></def:datafieldcontrol>
    </td>
  </tr>
  <tr>
    <td>
<def:datafieldcontrol runat="server" id="SS25Oft" DatabaseField="SS25Oft"  IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="50px"></def:datafieldcontrol>
    </td>
    <td class="next">
<def:datafieldcontrol runat="server" id="SS25Imp" DatabaseField="SS25Imp"  IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="125px" FieldTextBoxWidth="50px"></def:datafieldcontrol>
    </td>
  </tr>
  <tr>
    <td>
<def:datafieldcontrol runat="server" id="SS26Oft" DatabaseField="SS26Oft"  IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="50px"></def:datafieldcontrol>
    </td>
    <td class="next">
<def:datafieldcontrol runat="server" id="SS26Imp" DatabaseField="SS26Imp"  IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="125px" FieldTextBoxWidth="50px"></def:datafieldcontrol>
    </td>
  </tr>
  <tr>
    <td>
<def:datafieldcontrol runat="server" id="SS27Oft" DatabaseField="SS27Oft"  IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="50px"></def:datafieldcontrol>
    </td>
    <td class="next">
<def:datafieldcontrol runat="server" id="SS27Imp" DatabaseField="SS27Imp"  IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="125px" FieldTextBoxWidth="50px"></def:datafieldcontrol>
    </td>
  </tr>
  <tr>
    <td>
<def:datafieldcontrol runat="server" id="SS28Oft" DatabaseField="SS28Oft"  IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="50px"></def:datafieldcontrol>
    </td>
    <td class="next">
<def:datafieldcontrol runat="server" id="SS28Imp" DatabaseField="SS28Imp"  IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="125px" FieldTextBoxWidth="50px"></def:datafieldcontrol>
    </td>
  </tr>
  <tr>
    <td>
<def:datafieldcontrol runat="server" id="SS29Oft" DatabaseField="SS29Oft"  IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="50px"></def:datafieldcontrol>
    </td>
    <td class="next">
<def:datafieldcontrol runat="server" id="SS29Imp" DatabaseField="SS29Imp"  IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="125px" FieldTextBoxWidth="50px"></def:datafieldcontrol>
    </td>
  </tr>
  <tr>
    <td>
<def:datafieldcontrol runat="server" id="SS30Oft" DatabaseField="SS30Oft"  IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="50px"></def:datafieldcontrol>
    </td>
    <td class="next">
<def:datafieldcontrol runat="server" id="SS30Imp" DatabaseField="SS30Imp"  IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="125px" FieldTextBoxWidth="50px"></def:datafieldcontrol>
    </td>
  </tr>
</table>
<br />

<h4>Problem Behaviors</h4>

<table cellpadding="0" cellspacing="0" border="0">
  <tr>
    <td>
<def:datafieldcontrol runat="server" id="PB31Oft" DatabaseField="PB31Oft"  IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="50px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="PB32Oft" DatabaseField="PB32Oft"  IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="50px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="PB33Oft" DatabaseField="PB33Oft"  IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="50px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="PB34Oft" DatabaseField="PB34Oft"  IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="50px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="PB35Oft" DatabaseField="PB35Oft"  IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="50px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="PB36Oft" DatabaseField="PB36Oft"  IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="50px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="PB37Oft" DatabaseField="PB37Oft"  IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="50px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="PB38Oft" DatabaseField="PB38Oft"  IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="50px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="PB39Oft" DatabaseField="PB39Oft"  IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="50px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="PB40Oft" DatabaseField="PB40Oft"  IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="50px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="PB41Oft" DatabaseField="PB41Oft"  IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="50px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="PB42Oft" DatabaseField="PB42Oft"  IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="50px"></def:datafieldcontrol>
    </td>
    <td class="next">
<def:ValueSetLabel ID="ValueSetLabel_PB31Oft" runat="server"  DatabaseField="PB31Oft"></def:ValueSetLabel>
    </td>
  </tr>
</table>

<br />

<h4>Academic Competence</h4>

<table cellpadding="0" cellspacing="0" border="0">
  <tr>
    <td>
<def:datafieldcontrol runat="server" id="AC43Com" DatabaseField="AC43Com"  IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="50px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="AC44Com" DatabaseField="AC44Com"  IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="50px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="AC45Com" DatabaseField="AC45Com"  IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="50px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="AC46Com" DatabaseField="AC46Com"  IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="50px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="AC47Com" DatabaseField="AC47Com"  IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="50px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="AC48Com" DatabaseField="AC48Com"  IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="50px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="AC49Com" DatabaseField="AC49Com"  IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="50px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="AC50Com" DatabaseField="AC50Com"  IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="50px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="AC51Com" DatabaseField="AC51Com"  IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="50px"></def:datafieldcontrol>
    </td>
    <td class="next">
<def:ValueSetLabel ID="ValueSetLabel_AC43Com" runat="server"  DatabaseField="AC43Com"></def:ValueSetLabel>
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
