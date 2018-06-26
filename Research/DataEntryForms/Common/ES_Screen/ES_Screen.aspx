<%@ Register TagPrefix="def" Namespace="DataEntryFramework3" %> 
<%@ Page language="c#" MasterPageFile="~/UWAC.master"  Title="ES_Screen Data Entry" %>
<asp:Content ID="Content1" ContentPlaceHolderID="oBodyPlaceHolder" runat="server">
<def:dataentrycontroller id="DataEntryController1" runat="server" DatabaseTable="ALL_ES_Screen" >
</def:dataentrycontroller>
<def:datafieldcontrol runat="server" id="id" DatabaseField="id"  IsInsertField="true"   FieldLabelWidth="300px "></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="indexnum" DatabaseField="indexnum"  IsInsertField="true"   FieldLabelWidth="300px "></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="ContactDate" DatabaseField="ContactDate"   IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FormatString="{0:d}"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="Interviewer" DatabaseField="Interviewer"   IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px"></def:datafieldcontrol>
<asp:Panel id="mainPanel" runat="server">
<!-- Insert age and gender -->
<br />
<table border="0px" cellpadding="0px" cellspacing="0px">
  <tr>
    <td>
      <def:datafieldcontrol runat="server" id="ESSource" DatabaseField="ESSource"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="50px" FieldTextBoxMaxLength="2"></def:datafieldcontrol>    
    </td>
    <td>
      <def:ValueSetLabel ID="ValueSetLabel_ESSource" runat="server"  DatabaseField="ESSource"></def:ValueSetLabel>    
    </td>
  </tr>
  <tr>
    <td colspan="2">
      <def:datafieldcontrol runat="server" id="ESSpecSou" DatabaseField="ESSpecSou"  IsEntryField="true" IsDoubleEntryField="false"  FieldLabelWidth="300px" FieldTextBoxWidth="400px" FieldTextBoxMaxLength="500" FieldTextBoxHeight="60px" FieldTextBoxTextMode="MultiLine"></def:datafieldcontrol>
    </td>
  </tr>
</table>      
<br />
<table border="0px" cellpadding="10px" cellspacing="0px" style="background-color:#EEEEEE">      
  <tr>
    <td colspan="2">      
      <def:datafieldcontrol runat="server" id="ESConcern" DatabaseField="ESConcern"  IsEntryField="true" IsDoubleEntryField="false"  FieldLabelWidth="290px" FieldTextBoxWidth="400px" FieldTextBoxMaxLength="500" FieldTextBoxHeight="60px" FieldTextBoxTextMode="MultiLine"></def:datafieldcontrol>
    </td>
  </tr>
  <tr>
    <td>
      <def:datafieldcontrol runat="server" id="ESCognitive" DatabaseField="ESCognitive"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="290px" FieldTextBoxWidth="50px" FieldTextBoxMaxLength="2"></def:datafieldcontrol>
      <def:datafieldcontrol runat="server" id="ESMotor" DatabaseField="ESMotor"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="290px" FieldTextBoxWidth="50px" FieldTextBoxMaxLength="2"></def:datafieldcontrol>
      <def:datafieldcontrol runat="server" id="ESLanguage" DatabaseField="ESLanguage"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="290px" FieldTextBoxWidth="50px" FieldTextBoxMaxLength="2"></def:datafieldcontrol>
      <def:datafieldcontrol runat="server" id="ESDailyLife" DatabaseField="ESDailyLife"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="290px" FieldTextBoxWidth="50px" FieldTextBoxMaxLength="2"></def:datafieldcontrol>
      <def:datafieldcontrol runat="server" id="ESSocial" DatabaseField="ESSocial"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="290px" FieldTextBoxWidth="50px" FieldTextBoxMaxLength="2"></def:datafieldcontrol>
    </td>
    <td>
      <def:ValueSetLabel ID="ValueSetLabel_ESCognitive" runat="server"  DatabaseField="ESCognitive"></def:ValueSetLabel>
    </td>
  </tr>
  <tr>
    <td colspan="2">
      <def:datafieldcontrol runat="server" id="ESConcDev" DatabaseField="ESConcDev"  IsEntryField="true" IsDoubleEntryField="false"  FieldLabelWidth="290px" FieldTextBoxWidth="400px" FieldTextBoxMaxLength="500" FieldTextBoxHeight="60px" FieldTextBoxTextMode="MultiLine"></def:datafieldcontrol>
    </td>
  </tr>
  <tr>
    <td>
      <def:datafieldcontrol runat="server" id="ESDx" DatabaseField="ESDx"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="290px" FieldTextBoxWidth="50px" FieldTextBoxMaxLength="2"></def:datafieldcontrol>
    </td>
    <td>
      <def:ValueSetLabel ID="ValueSetLabel_ESDx" runat="server"  DatabaseField="ESDx"></def:ValueSetLabel>
    </td>
  </tr>
  <tr>
    <td colspan="2">
      <def:datafieldcontrol runat="server" id="ESSpecDx" DatabaseField="ESSpecDx"  IsEntryField="true" IsDoubleEntryField="false"  FieldLabelWidth="290px" FieldTextBoxWidth="400px" FieldTextBoxMaxLength="500" FieldTextBoxHeight="60px" FieldTextBoxTextMode="MultiLine"></def:datafieldcontrol>
    </td>
  </tr>
  <tr>
    <td>
      <def:datafieldcontrol runat="server" id="ESDxBy" DatabaseField="ESDxBy"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="290px" FieldTextBoxWidth="50px" FieldTextBoxMaxLength="2"></def:datafieldcontrol>
    </td>
    <td>
      <def:ValueSetLabel ID="ValueSetLabel_ESDxBy" runat="server"  DatabaseField="ESDxBy"></def:ValueSetLabel>
    </td>
  </tr>
</table>
<br />
<table border="0px" cellpadding="0px" cellspacing="0px">  
  <tr>
    <td>
      <def:datafieldcontrol runat="server" id="ESDistance" DatabaseField="ESDistance"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px " FieldTextBoxWidth="50px" FieldTextBoxMaxLength="2"></def:datafieldcontrol>
      <def:datafieldcontrol runat="server" id="ESTxAvail" DatabaseField="ESTxAvail"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px " FieldTextBoxWidth="50px" FieldTextBoxMaxLength="2"></def:datafieldcontrol>
      <def:datafieldcontrol runat="server" id="ESPriLang" DatabaseField="ESPriLang"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px " FieldTextBoxWidth="50px" FieldTextBoxMaxLength="2"></def:datafieldcontrol>
    </td>
    <td style="padding-left:20px">
      <def:ValueSetLabel ID="ValueSetLabel_ESDistance" runat="server"  DatabaseField="ESDistance"></def:ValueSetLabel>
    </td>
  </tr>
  <tr>
    <td colspan="2">
      <def:datafieldcontrol runat="server" id="ESSpecLang" DatabaseField="ESSpecLang"  IsEntryField="true" IsDoubleEntryField="false"  FieldLabelWidth="300px" FieldTextBoxWidth="400px" FieldTextBoxMaxLength="100"></def:datafieldcontrol>
    </td>
  </tr>
  <tr>
    <td>
      <def:datafieldcontrol runat="server" id="ESBehInt" DatabaseField="ESBehInt"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px " FieldTextBoxWidth="50px" FieldTextBoxMaxLength="2"></def:datafieldcontrol>
      <def:datafieldcontrol runat="server" id="ESRx" DatabaseField="ESRx"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px " FieldTextBoxWidth="50px" FieldTextBoxMaxLength="2"></def:datafieldcontrol>
    </td>
    <td style="padding-left:20px">
      <def:ValueSetLabel ID="ValueSetLabel_ESBehInt" runat="server"  DatabaseField="ESBehInt"></def:ValueSetLabel>
    </td>
  </tr>
  <tr>
    <td colspan="2">
      <def:datafieldcontrol runat="server" id="ESSpecRx" DatabaseField="ESSpecRx"  IsEntryField="true" IsDoubleEntryField="false"  FieldLabelWidth="300px" FieldTextBoxWidth="400px" FieldTextBoxMaxLength="500" FieldTextBoxHeight="60px" FieldTextBoxTextMode="MultiLine"></def:datafieldcontrol>
    </td>
  </tr>
</table>
<br />
<h4>Exclusionary Criteria:</h4>
<table border="0px" cellpadding="0px" cellspacing="0px">  
  <tr>
    <td>
      <def:datafieldcontrol runat="server" id="ESSeizures" DatabaseField="ESSeizures"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px " FieldTextBoxWidth="50px" FieldTextBoxMaxLength="2"></def:datafieldcontrol>
    </td>
    <td style="padding-left:20px">
      <def:ValueSetLabel ID="ValueSetLabel_ESSeizures" runat="server"  DatabaseField="ESSeizures"></def:ValueSetLabel>
    </td>
  </tr>
  <tr>
    <td colspan="2">
      <def:datafieldcontrol runat="server" id="ESSpecSeiz" DatabaseField="ESSpecSeiz"  IsEntryField="true" IsDoubleEntryField="false"  FieldLabelWidth="300px" FieldTextBoxWidth="400px" FieldTextBoxMaxLength="500" FieldTextBoxHeight="60px" FieldTextBoxTextMode="MultiLine"></def:datafieldcontrol>
    </td>
  </tr>
  <tr>
    <td>
      <def:datafieldcontrol runat="server" id="ESGenDis" DatabaseField="ESGenDis"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px " FieldTextBoxWidth="50px" FieldTextBoxMaxLength="2"></def:datafieldcontrol>
    </td>
    <td rowspan="2" style="padding-left:20px">
      <def:ValueSetLabel ID="ValueSetLabel_ESGenDis" runat="server"  DatabaseField="ESGenDis"></def:ValueSetLabel>
    </td>
  </tr>
  <tr>
    <td style="padding-left:50px">
      <def:datafieldcontrol runat="server" id="ESDownSyn" DatabaseField="ESDownSyn"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px " FieldTextBoxWidth="50px" FieldTextBoxMaxLength="2"></def:datafieldcontrol>
      <def:datafieldcontrol runat="server" id="ESFragileX" DatabaseField="ESFragileX"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px " FieldTextBoxWidth="50px" FieldTextBoxMaxLength="2"></def:datafieldcontrol>
      <def:datafieldcontrol runat="server" id="ESNorrie" DatabaseField="ESNorrie"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px " FieldTextBoxWidth="50px" FieldTextBoxMaxLength="2"></def:datafieldcontrol>
      <def:datafieldcontrol runat="server" id="ESNeuroFib" DatabaseField="ESNeuroFib"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px " FieldTextBoxWidth="50px" FieldTextBoxMaxLength="2"></def:datafieldcontrol>
      <def:datafieldcontrol runat="server" id="ESTubScler" DatabaseField="ESTubScler"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px " FieldTextBoxWidth="50px" FieldTextBoxMaxLength="2"></def:datafieldcontrol>
      <def:datafieldcontrol runat="server" id="ESPKU" DatabaseField="ESPKU"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px " FieldTextBoxWidth="50px" FieldTextBoxMaxLength="2"></def:datafieldcontrol>
      <def:datafieldcontrol runat="server" id="ESEnceph" DatabaseField="ESEnceph"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px " FieldTextBoxWidth="50px" FieldTextBoxMaxLength="2"></def:datafieldcontrol>
    </td>
  </tr>
  <tr>
    <td colspan="2">
      <def:datafieldcontrol runat="server" id="ESSpecGen" DatabaseField="ESSpecGen"  IsEntryField="true" IsDoubleEntryField="false"  FieldLabelWidth="300px" FieldTextBoxWidth="400px" FieldTextBoxMaxLength="500" FieldTextBoxHeight="60px" FieldTextBoxTextMode="MultiLine"></def:datafieldcontrol>
    </td>
  </tr>
  <tr>
    <td>
      <def:datafieldcontrol runat="server" id="ESFragXTest" DatabaseField="ESFragXTest"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px " FieldTextBoxWidth="50px" FieldTextBoxMaxLength="2"></def:datafieldcontrol>
      <def:datafieldcontrol runat="server" id="ESHearVis" DatabaseField="ESHearVis"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px " FieldTextBoxWidth="50px" FieldTextBoxMaxLength="2"></def:datafieldcontrol>
    </td>
    <td style="padding-left:20px">
      <def:ValueSetLabel ID="ValueSetLabel_ESFragXTest" runat="server"  DatabaseField="ESFragXTest"></def:ValueSetLabel>
    </td>
  </tr>
  <tr>
    <td colspan="2">
      <def:datafieldcontrol runat="server" id="ESSpecHV" DatabaseField="ESSpecHV"  IsEntryField="true" IsDoubleEntryField="false"  FieldLabelWidth="300px" FieldTextBoxWidth="400px" FieldTextBoxMaxLength="500" FieldTextBoxHeight="60px" FieldTextBoxTextMode="MultiLine"></def:datafieldcontrol>
    </td>
  </tr>
  <tr>
    <td>
      <def:datafieldcontrol runat="server" id="ESMotorDel" DatabaseField="ESMotorDel"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px " FieldTextBoxWidth="50px" FieldTextBoxMaxLength="2"></def:datafieldcontrol>
    </td>
    <td style="padding-left:20px">
      <def:ValueSetLabel ID="ValueSetLabel_ESMotorDel" runat="server"  DatabaseField="ESMotorDel"></def:ValueSetLabel>
    </td>
  </tr>
  <tr>
    <td colspan="2">
      <def:datafieldcontrol runat="server" id="ESSpecMD" DatabaseField="ESSpecMD"  IsEntryField="true" IsDoubleEntryField="false"  FieldLabelWidth="300px" FieldTextBoxWidth="400px" FieldTextBoxMaxLength="500" FieldTextBoxHeight="60px" FieldTextBoxTextMode="MultiLine"></def:datafieldcontrol>
    </td>
  </tr>
  <tr>
    <td>
      <def:datafieldcontrol runat="server" id="ESChronic" DatabaseField="ESChronic"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px " FieldTextBoxWidth="50px" FieldTextBoxMaxLength="2"></def:datafieldcontrol>
    </td>
    <td style="padding-left:20px">
      <def:ValueSetLabel ID="ValueSetLabel_ESChronic" runat="server"  DatabaseField="ESChronic"></def:ValueSetLabel>
    </td>
  </tr>
  <tr>
    <td colspan="2">
      <def:datafieldcontrol runat="server" id="ESSpecChr" DatabaseField="ESSpecChr"  IsEntryField="true" IsDoubleEntryField="false"  FieldLabelWidth="300px" FieldTextBoxWidth="400px" FieldTextBoxMaxLength="500" FieldTextBoxHeight="60px" FieldTextBoxTextMode="MultiLine"></def:datafieldcontrol>
    </td>
  </tr>
  <tr>
    <td>
      <def:datafieldcontrol runat="server" id="ESPhysAnom" DatabaseField="ESPhysAnom"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px " FieldTextBoxWidth="50px" FieldTextBoxMaxLength="2"></def:datafieldcontrol>
    </td>
    <td style="padding-left:20px">
      <def:ValueSetLabel ID="ValueSetLabel_ESPhysAnom" runat="server"  DatabaseField="ESPhysAnom"></def:ValueSetLabel>
    </td>
  </tr>
  <tr>
    <td colspan="2">
      <def:datafieldcontrol runat="server" id="ESSpecAnom" DatabaseField="ESSpecAnom"  IsEntryField="true" IsDoubleEntryField="false"  FieldLabelWidth="300px" FieldTextBoxWidth="400px" FieldTextBoxMaxLength="500" FieldTextBoxHeight="60px" FieldTextBoxTextMode="MultiLine"></def:datafieldcontrol>
    </td>
  </tr>
  <tr>
    <td>
      <def:datafieldcontrol runat="server" id="ESPremat" DatabaseField="ESPremat"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px " FieldTextBoxWidth="50px" FieldTextBoxMaxLength="2"></def:datafieldcontrol>
    </td>
    <td style="padding-left:20px">
      <def:ValueSetLabel ID="ValueSetLabel_ESPremat" runat="server"  DatabaseField="ESPremat"></def:ValueSetLabel>
    </td>
  </tr>
  <tr>
    <td colspan="2">
      <def:datafieldcontrol runat="server" id="ESSpecPrem" DatabaseField="ESSpecPrem"  IsEntryField="true" IsDoubleEntryField="false"  FieldLabelWidth="300px" FieldTextBoxWidth="400px" FieldTextBoxMaxLength="500" FieldTextBoxHeight="60px" FieldTextBoxTextMode="MultiLine"></def:datafieldcontrol>
    </td>
  </tr>
</table>
<p>Does Mother, Father or any immediate family members/caregivers have a history of: (-9=Missing Value, 0=No, 1=Yes)</p>
<table border="1px" cellpadding="10px" cellspacing="0px">
  <tr>
    <td>
      &nbsp;
    </td>
    <td width="75px">
      Parent
    </td>
    <td width="75px">
      Other Caregiver/Family
    </td>
    <td>
      Comments
    </td>
  </tr>
  <tr>
    <td>
      Substance Abuse
    </td>
    <td>
      <def:datafieldcontrol runat="server" id="ESSAParent" DatabaseField="ESSAParent"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="0px" FieldTextBoxWidth="50px" FieldTextBoxMaxLength="2"></def:datafieldcontrol>    
    </td>
    <td>
      <def:datafieldcontrol runat="server" id="ESSAFamily" DatabaseField="ESSAFamily"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="0px" FieldTextBoxWidth="50px" FieldTextBoxMaxLength="2"></def:datafieldcontrol>    
    </td>
    <td>
      <def:datafieldcontrol runat="server" id="ESSASpec" DatabaseField="ESSASpec"  IsEntryField="true" IsDoubleEntryField="false"  FieldLabelWidth="0px" FieldTextBoxWidth="335px" FieldTextBoxMaxLength="500" FieldTextBoxHeight="60px" FieldTextBoxTextMode="MultiLine"></def:datafieldcontrol>    
    </td>
  </tr>   
  <tr>
    <td>
      Bipolar Disorder
    </td>
    <td>
      <def:datafieldcontrol runat="server" id="ESBDParent" DatabaseField="ESBDParent"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="0px" FieldTextBoxWidth="50px" FieldTextBoxMaxLength="2"></def:datafieldcontrol>
    </td>
    <td>
      <def:datafieldcontrol runat="server" id="ESBDFamily" DatabaseField="ESBDFamily"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="0px" FieldTextBoxWidth="50px" FieldTextBoxMaxLength="2"></def:datafieldcontrol>
    </td>
    <td>
      <def:datafieldcontrol runat="server" id="ESBDSpec" DatabaseField="ESBDSpec"  IsEntryField="true" IsDoubleEntryField="false"  FieldLabelWidth="0px" FieldTextBoxWidth="335px" FieldTextBoxMaxLength="500" FieldTextBoxHeight="60px" FieldTextBoxTextMode="MultiLine"></def:datafieldcontrol>
    </td>
  </tr>   
  <tr>
    <td>
      Psychosis
    </td>
    <td>
      <def:datafieldcontrol runat="server" id="ESPsyParent" DatabaseField="ESPsyParent"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="0px" FieldTextBoxWidth="50px" FieldTextBoxMaxLength="2"></def:datafieldcontrol>
    </td>
    <td>
      <def:datafieldcontrol runat="server" id="ESPsyFamily" DatabaseField="ESPsyFamily"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="0px" FieldTextBoxWidth="50px" FieldTextBoxMaxLength="2"></def:datafieldcontrol>
    </td>
    <td>
      <def:datafieldcontrol runat="server" id="ESPsySpec" DatabaseField="ESPsySpec"  IsEntryField="true" IsDoubleEntryField="false"  FieldLabelWidth="0px" FieldTextBoxWidth="335px" FieldTextBoxMaxLength="500" FieldTextBoxHeight="60px" FieldTextBoxTextMode="MultiLine"></def:datafieldcontrol>
    </td>
  </tr>   
</table>
<br />
<h4>Demographic Information:</h4>
<table border="0px" cellpadding="0px" cellspacing="0px">
  <tr>
    <td>
      <def:datafieldcontrol runat="server" id="ESMomEthn" DatabaseField="ESMomEthn"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="200px " FieldTextBoxWidth="50px" FieldTextBoxMaxLength="2"></def:datafieldcontrol>
      <def:datafieldcontrol runat="server" id="ESSpecMEthn" DatabaseField="ESSpecMEthn"  IsEntryField="true" IsDoubleEntryField="false"  FieldLabelWidth="200px" FieldTextBoxWidth="300px" FieldTextBoxMaxLength="100"></def:datafieldcontrol>
      <def:datafieldcontrol runat="server" id="ESChiEthn" DatabaseField="ESChiEthn"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="200px " FieldTextBoxWidth="50px" FieldTextBoxMaxLength="2"></def:datafieldcontrol>
      <def:datafieldcontrol runat="server" id="ESSpecCEthn" DatabaseField="ESSpecCEthn"  IsEntryField="true" IsDoubleEntryField="false"  FieldLabelWidth="200px" FieldTextBoxWidth="300px" FieldTextBoxMaxLength="100"></def:datafieldcontrol>
      <def:datafieldcontrol runat="server" id="ESDadEthn" DatabaseField="ESDadEthn"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="200px " FieldTextBoxWidth="50px" FieldTextBoxMaxLength="2"></def:datafieldcontrol>
      <def:datafieldcontrol runat="server" id="ESSpecDEthn" DatabaseField="ESSpecDEthn"  IsEntryField="true" IsDoubleEntryField="false"  FieldLabelWidth="200px" FieldTextBoxWidth="300px" FieldTextBoxMaxLength="100"></def:datafieldcontrol>
    </td>
    <td style="padding-left:20px">
      <def:ValueSetLabel ID="ValueSetLabel_ESMomEthn" runat="server"  DatabaseField="ESMomEthn"></def:ValueSetLabel>  
    </td>
  </tr>
</table>
<br />
<table border="0px" cellpadding="0px" cellspacing="0px">
  <tr>
    <td>
      <def:datafieldcontrol runat="server" id="ESLiveWith" DatabaseField="ESLiveWith"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px " FieldTextBoxWidth="50px" FieldTextBoxMaxLength="2"></def:datafieldcontrol>
      <def:datafieldcontrol runat="server" id="ESNumSibs" DatabaseField="ESNumSibs"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px " FieldTextBoxWidth="50px" FieldTextBoxMaxLength="2"></def:datafieldcontrol>
    </td>
    <td>
      <def:ValueSetLabel ID="ValueSetLabel_ESLiveWith" runat="server"  DatabaseField="ESLiveWith"></def:ValueSetLabel>
    </td>
  </tr>
  <tr>
    <td colspan="2">
      <def:datafieldcontrol runat="server" id="ESSpecLive" DatabaseField="ESSpecLive"  IsEntryField="true" IsDoubleEntryField="false"  FieldLabelWidth="300px" FieldTextBoxWidth="400px" FieldTextBoxMaxLength="500" FieldTextBoxHeight="60px" FieldTextBoxTextMode="MultiLine"></def:datafieldcontrol>
    </td>
  </tr>
</table>  
<h4>Reinforcer Assessment:</h4>
<table border="0px" cellpadding="0px" cellspacing="0px">
  <tr>
    <td>
      <def:datafieldcontrol runat="server" id="ESDiet" DatabaseField="ESDiet"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px " FieldTextBoxWidth="50px" FieldTextBoxMaxLength="2"></def:datafieldcontrol>
    </td>
    <td>
      <def:ValueSetLabel ID="ValueSetLabel_ESDiet" runat="server"  DatabaseField="ESDiet"></def:ValueSetLabel>
    </td>
  </tr>
  <tr>
    <td colspan="2">
      <def:datafieldcontrol runat="server" id="ESSpecDiet" DatabaseField="ESSpecDiet"  IsEntryField="true" IsDoubleEntryField="false"  FieldLabelWidth="300px" FieldTextBoxWidth="400px" FieldTextBoxMaxLength="500" FieldTextBoxHeight="60px" FieldTextBoxTextMode="MultiLine"></def:datafieldcontrol>
    </td>
  </tr>
  <tr>
    <td>
      <def:datafieldcontrol runat="server" id="ESFoodRein" DatabaseField="ESFoodRein"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px " FieldTextBoxWidth="50px" FieldTextBoxMaxLength="2"></def:datafieldcontrol>
    </td>
    <td>
      <def:ValueSetLabel ID="ValueSetLabel_ESFoodRein" runat="server"  DatabaseField="ESFoodRein"></def:ValueSetLabel>
    </td>
  </tr>
  <tr>
    <td colspan="2">
      <def:datafieldcontrol runat="server" id="ESSpecFood" DatabaseField="ESSpecFood"  IsEntryField="true" IsDoubleEntryField="false"  FieldLabelWidth="300px" FieldTextBoxWidth="400px" FieldTextBoxMaxLength="500" FieldTextBoxHeight="60px" FieldTextBoxTextMode="MultiLine"></def:datafieldcontrol>
    </td>
  </tr>
  <tr>
    <td>
      <def:datafieldcontrol runat="server" id="ESAllergies" DatabaseField="ESAllergies"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px " FieldTextBoxWidth="50px" FieldTextBoxMaxLength="2"></def:datafieldcontrol>
    </td>
    <td>
      <def:ValueSetLabel ID="ValueSetLabel_ESAllergies" runat="server"  DatabaseField="ESAllergies"></def:ValueSetLabel>
    </td>
  </tr>
  <tr>
    <td colspan="2">
      <def:datafieldcontrol runat="server" id="ESSpecAlle" DatabaseField="ESSpecAlle"  IsEntryField="true" IsDoubleEntryField="false"  FieldLabelWidth="300px" FieldTextBoxWidth="400px" FieldTextBoxMaxLength="500" FieldTextBoxHeight="60px" FieldTextBoxTextMode="MultiLine"></def:datafieldcontrol>
      <def:datafieldcontrol runat="server" id="ESMotivate" DatabaseField="ESMotivate"  IsEntryField="true" IsDoubleEntryField="false"  FieldLabelWidth="300px"  FieldTextBoxWidth="400px" FieldTextBoxMaxLength="500" FieldTextBoxHeight="60px" FieldTextBoxTextMode="MultiLine"></def:datafieldcontrol>
    </td>
  </tr>
</table>
<br />
<def:datafieldcontrol runat="server" id="ESNotes" DatabaseField="ESNotes"  IsEntryField="true" IsDoubleEntryField="false"  FieldLabelWidth="300px" FieldTextBoxWidth="400px" FieldTextBoxMaxLength="500" FieldTextBoxHeight="60px" FieldTextBoxTextMode="MultiLine"></def:datafieldcontrol>
</asp:Panel>
<br />
<def:datafieldcontrol runat="server" id="created" DatabaseField="created"  IsReadOnly="true" RenderReadOnlyAsDiv="true"   FieldLabelWidth="300px "></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="createdBy" DatabaseField="createdBy"  IsReadOnly="true" RenderReadOnlyAsDiv="true"   FieldLabelWidth="300px "></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="updated" DatabaseField="updated"  IsReadOnly="true" RenderReadOnlyAsDiv="true"   FieldLabelWidth="300px "></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="updatedBy" DatabaseField="updatedBy"  IsReadOnly="true" RenderReadOnlyAsDiv="true"   FieldLabelWidth="300px "></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="scored" DatabaseField="scored"  IsReadOnly="true" RenderReadOnlyAsDiv="true"   FieldLabelWidth="300px "></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="scoredBy" DatabaseField="scoredBy"  IsReadOnly="true" RenderReadOnlyAsDiv="true"   FieldLabelWidth="300px "></def:datafieldcontrol>
</asp:Content>
