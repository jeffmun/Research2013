<%@ Register TagPrefix="def" Namespace="DataEntryFramework3" %> 
<%@ Page language="c#" MasterPageFile="~/UWAC.master"  Title="TSI_UW Data Entry" %>
<asp:Content ID="Content1" ContentPlaceHolderID="oBodyPlaceHolder" runat="server">
<def:dataentrycontroller id="DataEntryController1" runat="server" DatabaseTable="ALL_TSI_UW" >
</def:dataentrycontroller>
<div id="FirstPage">
	<table border="0" cellpadding="0" cellspacing="0">
		<tr>
			<td>
			<def:datafieldcontrol runat="server" id="id" DatabaseField="id"  IsInsertField="true"   FieldLabelWidth="100px"></def:datafieldcontrol><br/>
			<def:datafieldcontrol runat="server" id="indexnum" DatabaseField="indexnum"  IsInsertField="true"   FieldLabelWidth="100px"></def:datafieldcontrol>
			<def:datafieldcontrol runat="server" id="TSIDoC" DatabaseField="TSIDoC"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="100px"></def:datafieldcontrol><br/>
			<def:datafieldcontrol runat="server" id="TSISource" DatabaseField="TSISource"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="100px" FieldTextBoxWidth="50px"></def:datafieldcontrol>
			<def:datafieldcontrol runat="server" id="TSIRS" DatabaseField="TSIRS"  IsEntryField="true" IsDoubleEntryField="false"  FieldLabelWidth="100px" FieldTextBoxWidth = "300px" FieldTextBoxHeight = "70px" FieldTextBoxTextMode="MultiLine"></def:datafieldcontrol>
			</td>
      <asp:panel id="mainPanel" runat="server">
			<td style="padding-left: 20px">
      <def:ValueSetLabel ID="ValueSetLabel_TSISource" runat="server"  DatabaseField="TSISource"></def:ValueSetLabel>
			</td>
		</tr>
	</table>
	<p id="Jump1">Jump links: <a href="#FirstPage">First Page</a> | <a href="#Demographic">Demographic Information</a> | <a href="#InfantExclusionary">Infant Exclusionary Criteria</a> | <a href="#ProbandExclusionary">Proband Exclusionary Criteria</a> | <a href="#MedicalHistory">Infant Medical History</a> | <a href="#Wrap-up">Wrap-up Questions</a> | <a href="#ResearchStaff">Research Staff</a></p>
	<table border="0" cellpadding="5" cellspacing="0" style="background-color:#ffffee">
		<tr>
			<td width="20%"></td>
			<td width="20%"></td>
			<td width="20%"></td>
			<td width="20%"></td>
			<td width="20%"></td>
		</tr>
		<tr>
			<td colspan="2">
			<def:datafieldcontrol runat="server" id="TSIIA" DatabaseField="TSIIA"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="150px" FieldTextBoxWidth="50px"></def:datafieldcontrol>
			</td>
			<td colspan="2">
			<def:datafieldcontrol runat="server" id="TSIIG" DatabaseField="TSIIG"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="150px" FieldTextBoxWidth="50px"></def:datafieldcontrol>
			</td>
			<td>
			<def:ValueSetLabel ID="ValueSetLabel_TSIIG" runat="server"  DatabaseField="TSIIG"></def:ValueSetLabel>
			</td>
		</tr>
		<tr>
			<td colspan="3">
			<def:datafieldcontrol runat="server" id="TSIIR" DatabaseField="TSIIR"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="150px" FieldTextBoxWidth="50px"></def:datafieldcontrol>
			</td>
			<td colspan="2" rowspan="2">
			<def:ValueSetLabel ID="ValueSetLabel_TSIIR" runat="server"  DatabaseField="TSIIR"></def:ValueSetLabel>
			</td>
		</tr>
		<tr>
			<td colspan="3">
			<def:datafieldcontrol runat="server" id="TSIIRN" DatabaseField="TSIIRN"  IsEntryField="true" IsDoubleEntryField="false"  FieldLabelWidth="150px" FieldTextBoxWidth = "300px"></def:datafieldcontrol>
			</td>
		</tr>
		<tr>
			<td colspan="3">
			<!-- Not a double-entry field: Race/Ethnicity Notes -->
			<def:datafieldcontrol runat="server" id="TSIICT" DatabaseField="TSIICT"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="350px" FieldTextBoxWidth = "50px"></def:datafieldcontrol>
			</td>
			<td colspan="2">
			<def:ValueSetLabel ID="ValueSetLabel_TSIICT" runat="server"  DatabaseField="TSIICT"></def:ValueSetLabel>
			</td>
		</tr>
		<tr>
			<td></td>
			<td colspan="4">
			<def:datafieldcontrol runat="server" id="TSIIEC" DatabaseField="TSIIEC"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="250px" FieldTextBoxWidth = "300px"></def:datafieldcontrol>
			</td>
		</tr>
		<tr>
			<td></td>
			<td colspan="4">
			<def:datafieldcontrol runat="server" id="TSIIEW" DatabaseField="TSIIEW"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="250px" FieldTextBoxWidth = "300px"></def:datafieldcontrol>
			</td>
		</tr>
		<tr>
			<td></td>
			<td colspan="4">
			<!-- Not a double-entry field: Evaluation Results -->
			<def:datafieldcontrol runat="server" id="TSIIER" DatabaseField="TSIIER"  IsEntryField="true" IsDoubleEntryField="false"  FieldLabelWidth="250px" FieldTextBoxWidth = "300px" FieldTextBoxHeight = "70px" FieldTextBoxTextMode="MultiLine"></def:datafieldcontrol>
			</td>
		</tr>
		<tr>
			<td colspan="3">
			<def:datafieldcontrol runat="server" id="TSICIC" DatabaseField="TSICIC"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth = "50px"></def:datafieldcontrol>
			</td>
			<td colspan="2">
			<def:ValueSetLabel ID="ValueSetLabel_TSICIC" runat="server"  DatabaseField="TSICIC"></def:ValueSetLabel>
			</td>
		</tr>
		<tr>
			<td colspan="5">
			<!-- Not a double-entry field: Specify Infant concerns -->
			<def:datafieldcontrol runat="server" id="TSISIC" DatabaseField="TSISIC"  IsEntryField="true" IsDoubleEntryField="false"  FieldLabelWidth="300px" FieldTextBoxWidth = "300px" FieldTextBoxHeight = "70px" FieldTextBoxTextMode="MultiLine"></def:datafieldcontrol>
			</td>
		</tr>
	</table>
	<table border="0" cellpadding="5" cellspacing="0" style="background-color:#ffeeff">
		<tr>
			<td width="20%"></td>
			<td width="20%"></td>
			<td width="20%"></td>
			<td width="20%"></td>
			<td width="20%"></td>
		</tr>
		<tr>
			<td colspan="2">
			<def:datafieldcontrol runat="server" id="TSIPA" DatabaseField="TSIPA"  IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="50px"></def:datafieldcontrol>
			</td>
			<td colspan="2">
			<def:datafieldcontrol runat="server" id="TSIPG" DatabaseField="TSIPG"  IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="50px"></def:datafieldcontrol>
			</td>
			<td>
			<def:ValueSetLabel ID="ValueSetLabel_TSIPG" runat="server"  DatabaseField="TSIPG"></def:ValueSetLabel>
			</td>
		</tr>
		<tr>
			<td colspan="3">
			<def:datafieldcontrol runat="server" id="TSIPR" DatabaseField="TSIPR"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="150px" FieldTextBoxWidth="50px"></def:datafieldcontrol>
			</td>
			<td colspan="2" rowspan="2">
			<def:ValueSetLabel ID="ValueSetLabel_TSIPR" runat="server"  DatabaseField="TSIPR"></def:ValueSetLabel>
			</td>
		</tr>
		<tr>
			<td colspan="3">
			<!-- Not a double-entry field: Race/Ethnicity Notes -->
			<def:datafieldcontrol runat="server" id="TSIPRN" DatabaseField="TSIPRN"  IsEntryField="true" IsDoubleEntryField="false"  FieldLabelWidth="150px" FieldTextBoxWidth = "300px"></def:datafieldcontrol>
			</td>
		</tr>
		<tr>
			<td colspan="3">
			<def:datafieldcontrol runat="server" id="TSIPBS" DatabaseField="TSIPBS"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="350px" FieldTextBoxWidth = "50px"></def:datafieldcontrol>
			</td>
			<td colspan="2">
			<def:ValueSetLabel ID="ValueSetLabel_TSIPBS" runat="server"  DatabaseField="TSIPBS"></def:ValueSetLabel>
			</td>
		</tr>
		<tr>
			<td colspan="5">
			<def:datafieldcontrol runat="server" id="TSICPC" DatabaseField="TSICPC"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth = "50px"></def:datafieldcontrol>
			</td>
		</tr>
		<tr>
			<td colspan="5">
			<!-- Not a double-entry field: Specify Proband concerns -->
			<def:datafieldcontrol runat="server" id="TSISPC" DatabaseField="TSISPC"  IsEntryField="true" IsDoubleEntryField="false"  FieldLabelWidth="300px" FieldTextBoxWidth = "300px" FieldTextBoxHeight = "70px" FieldTextBoxTextMode="MultiLine"></def:datafieldcontrol>
			</td>
		</tr>
		<tr>
			<td colspan="3">
			<def:datafieldcontrol runat="server" id="TSIPFD" DatabaseField="TSIPFD"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth = "50px"></def:datafieldcontrol>
			</td>
			<td colspan="2">
			<def:ValueSetLabel ID="ValueSetLabel_TSIPFD" runat="server"  DatabaseField="TSIPFD"></def:ValueSetLabel>
			</td>
		</tr>
		<tr>
			<td colspan="5">
			<!-- Not a double-entry field: Specify Professional concerns about Proband development -->
			<def:datafieldcontrol runat="server" id="TSIPSD" DatabaseField="TSIPSD"  IsEntryField="true" IsDoubleEntryField="false"  FieldLabelWidth="300px" FieldTextBoxWidth = "300px" FieldTextBoxHeight = "70px" FieldTextBoxTextMode="MultiLine"></def:datafieldcontrol>
			</td>
		</tr>
		<tr>
			<td></td>
			<td colspan="4">
			<def:datafieldcontrol runat="server" id="TSIPDD" DatabaseField="TSIPDD"  IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="175px"></def:datafieldcontrol>
			</td>
		</tr>
		<tr>
			<td></td>
			<td colspan="4">
			<def:datafieldcontrol runat="server" id="TSIPDC" DatabaseField="TSIPDC"  IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="175px" FieldTextBoxWidth="300px"></def:datafieldcontrol>
			</td>
		</tr>
		<tr>
			<td colspan="3">
			<def:datafieldcontrol runat="server" id="TSIPOD" DatabaseField="TSIPOD"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth = "50px"></def:datafieldcontrol>
			</td>
			<td colspan="2">
			<def:ValueSetLabel ID="ValueSetLabel_TSIPOD" runat="server"  DatabaseField="TSIPOD"></def:ValueSetLabel>
			</td>
		</tr>
		<tr>
			<td colspan="5">
			<!-- Not a double-entry field: Specify other Proband diagnoses/developmental difficulties -->
			<def:datafieldcontrol runat="server" id="TSISPD" DatabaseField="TSISPD"  IsEntryField="true" IsDoubleEntryField="false"  FieldLabelWidth="300px" FieldTextBoxWidth = "300px" FieldTextBoxHeight = "70px" FieldTextBoxTextMode="MultiLine"></def:datafieldcontrol>
			</td>
		</tr>
	</table>
</div>
<div id="Demographic">
	<p id="Jump2">Jump links: <a href="#FirstPage">First Page</a> | <a href="#Demographic">Demographic Information</a> | <a href="#InfantExclusionary">Infant Exclusionary Criteria</a> | <a href="#ProbandExclusionary">Proband Exclusionary Criteria</a> | <a href="#MedicalHistory">Infant Medical History</a> | <a href="#Wrap-up">Wrap-up Questions</a> | <a href="#ResearchStaff">Research Staff</a></p>
	<h3>A. Demographic Information</h3>
	<def:datafieldcontrol runat="server" id="TSIDTfD" DatabaseField="TSIDTfD"  IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="325px" FieldTextBoxWidth = "50px"></def:datafieldcontrol>
	<table border="0" cellpadding="0" cellspacing="0">
	<tr>
	<td>
	<def:datafieldcontrol runat="server" id="TSIDRES" DatabaseField="TSIDRES"  IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="325px" FieldTextBoxWidth = "50px"></def:datafieldcontrol>
	</td>
	<td style="padding-left: 20px">
	<def:ValueSetLabel ID="ValueSetLabel_TSIDRES" runat="server"  DatabaseField="TSIDRES"></def:ValueSetLabel>
	</td>
	</tr>
	</table>
	<def:datafieldcontrol runat="server" id="TSIDWK" DatabaseField="TSIDWK"  IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="325px" FieldTextBoxWidth = "50px"></def:datafieldcontrol>
	<table border="0" cellpadding="0" cellspacing="0">
		<tr>
			<td>
			<def:datafieldcontrol runat="server" id="TSIDILW" DatabaseField="TSIDILW"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="100px" FieldTextBoxWidth="50px"></def:datafieldcontrol>
			</td>
			<td rowspan="3" style="padding-left: 20px">
			<def:ValueSetLabel ID="ValueSetLabel_TSIDILW" runat="server"  DatabaseField="TSIDILW"></def:ValueSetLabel>
			</td>
		</tr>
		<tr>
			<td>
			<!-- Not a double-entry field: Specify Other -->
			<def:datafieldcontrol runat="server" id="TSILWO" DatabaseField="TSILWO"  IsEntryField="true" IsDoubleEntryField="false"  FieldLabelWidth="100px" FieldTextBoxWidth = "300px" FieldTextBoxHeight = "45px" FieldTextBoxTextMode="MultiLine"></def:datafieldcontrol>
			</td>
		</tr>	
		<tr>
			<td>
			<def:datafieldcontrol runat="server" id="TSIDIS" DatabaseField="TSIDIS"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="275px" FieldTextBoxWidth = "50px"></def:datafieldcontrol>
			</td>
		</tr>	
	</table>
	<table border="0" cellpadding="5" cellspacing="0" style="background-color: #eeeeff">
		<tr>
			<td colspan="4">
			Other Sibling 1
			</td>
		</tr>
			<td>
			<def:datafieldcontrol runat="server" id="TSID1BS" DatabaseField="TSID1BS"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="150px" FieldTextBoxWidth = "50px"></def:datafieldcontrol>
			</td>
			<td>
			<def:ValueSetLabel ID="ValueSetLabel_TSID1BS" runat="server"  DatabaseField="TSID1BS"></def:ValueSetLabel>
			</td>
			<td>
			<def:datafieldcontrol runat="server" id="TSID1G" DatabaseField="TSID1G"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="75px" FieldTextBoxWidth = "50px"></def:datafieldcontrol>
			</td>
			<td>
			<def:ValueSetLabel ID="ValueSetLabel_TSID1G" runat="server"  DatabaseField="TSID1G"></def:ValueSetLabel>
			</td>
		</tr>
		<tr>
			<td colspan="4">
			<!-- Not a double-entry field: Other diagnoses/developmental difficulties -->
			<def:datafieldcontrol runat="server" id="TSID1OD" DatabaseField="TSID1OD"  IsEntryField="true" IsDoubleEntryField="false"  FieldLabelWidth="300px" FieldTextBoxWidth = "300px"></def:datafieldcontrol>
			</td>
		</tr>
		<tr>
			<td colspan="4">
			<!-- Not a double-entry field: Specify diagnoses/developmental difficulties -->
			<def:datafieldcontrol runat="server" id="TSID1SD" DatabaseField="TSID1SD"  IsEntryField="true" IsDoubleEntryField="false"  FieldLabelWidth="300px" FieldTextBoxWidth = "300px" FieldTextBoxHeight = "70px" FieldTextBoxTextMode="MultiLine"></def:datafieldcontrol>
			</td>
		</tr>
	</table>
	<table border="0" cellpadding="5" cellspacing="0" style="background-color: #eeffee">
		<tr>
			<td colspan="4">
			Other Sibling 2
			</td>
		</tr>
			<td>
			<def:datafieldcontrol runat="server" id="TSID2BS" DatabaseField="TSID2BS"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="150px" FieldTextBoxWidth = "50px"></def:datafieldcontrol>
			</td>
			<td>
			<def:ValueSetLabel ID="ValueSetLabel_TSID2BS" runat="server"  DatabaseField="TSID2BS"></def:ValueSetLabel>
			</td>
			<td>
			<def:datafieldcontrol runat="server" id="TSID2G" DatabaseField="TSID2G"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="75px" FieldTextBoxWidth = "50px"></def:datafieldcontrol>
			</td>
			<td>
			<def:ValueSetLabel ID="ValueSetLabel_TSID2G" runat="server"  DatabaseField="TSID2G"></def:ValueSetLabel>
			</td>
		</tr>
		<tr>
			<td colspan="4">
			<!-- Not a double-entry field: Other diagnoses/developmental difficulties -->
			<def:datafieldcontrol runat="server" id="TSID2OD" DatabaseField="TSID2OD"  IsEntryField="true" IsDoubleEntryField="false"  FieldLabelWidth="300px" FieldTextBoxWidth = "300px"></def:datafieldcontrol>
			</td>
		</tr>
		<tr>
			<td colspan="4">
			<!-- Not a double-entry field: Specify diagnoses/developmental difficulties -->
			<def:datafieldcontrol runat="server" id="TSID2SD" DatabaseField="TSID2SD"  IsEntryField="true" IsDoubleEntryField="false"  FieldLabelWidth="300px" FieldTextBoxWidth = "300px" FieldTextBoxHeight = "70px" FieldTextBoxTextMode="MultiLine"></def:datafieldcontrol>
			</td>
		</tr>
	</table>
	<table border="0" cellpadding="0" cellspacing="0">
		<tr>
			<td>
			<def:datafieldcontrol runat="server" id="TSIDIAS" DatabaseField="TSIDIAS"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="400px"  FieldTextBoxWidth = "50px"></def:datafieldcontrol>
			</td>
			<td style="padding-left: 20px">
			<def:ValueSetLabel ID="ValueSetLabel_TSIDIAS" runat="server"  DatabaseField="TSIDIAS"></def:ValueSetLabel>
			</td>
		</tr>
	</table>
	<def:datafieldcontrol runat="server" id="TSIDILE" DatabaseField="TSIDILE"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth = "50px"></def:datafieldcontrol>
  <!-- Not a double-entry field: Language proficiency notes -->
	<def:datafieldcontrol runat="server" id="TSIDILP" DatabaseField="TSIDILP"  IsEntryField="true" IsDoubleEntryField="false"  FieldLabelWidth="300px" FieldTextBoxWidth = "300px"></def:datafieldcontrol>
	<table border="0" cellpadding="0" cellspacing="0">
		<tr>
			<td>
			<def:datafieldcontrol runat="server" id="TSIDELH" DatabaseField="TSIDELH"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px"  FieldTextBoxWidth = "50px"></def:datafieldcontrol>
			</td>
			<td style="padding-left: 20px">
			<def:ValueSetLabel ID="ValueSetLabel_TSIDELH" runat="server"  DatabaseField="TSIDELH"></def:ValueSetLabel>
			</td>
		</tr>
		<tr>
			<td colspan="2">
			<!-- Not a double-entry field: Language in the Home notes -->
			<def:datafieldcontrol runat="server" id="TSIDLHN" DatabaseField="TSIDLHN"  IsEntryField="true" IsDoubleEntryField="false"  FieldLabelWidth="300px" FieldTextBoxWidth = "300px"></def:datafieldcontrol>
			</td>
		</tr>
		<tr>
			<td>
			<def:datafieldcontrol runat="server" id="TSIDFRR" DatabaseField="TSIDFRR"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px"  FieldTextBoxWidth = "50px"></def:datafieldcontrol>
			</td>
			<td style="padding-left: 20px">
			<def:ValueSetLabel ID="ValueSetLabel_TSIDFRR" runat="server"  DatabaseField="TSIDFRR"></def:ValueSetLabel>
			</td>
		</tr>
		<tr>
			<td colspan="2">
			<!-- Not a double-entry field: Specify Research Registry -->
			<def:datafieldcontrol runat="server" id="TSIDSRR" DatabaseField="TSIDSRR"  IsEntryField="true" IsDoubleEntryField="false"  FieldLabelWidth="300px" FieldTextBoxWidth = "300px" FieldTextBoxHeight = "70px" FieldTextBoxTextMode="MultiLine"></def:datafieldcontrol>
			</td>
		</tr>
		<tr>
			<td>
			<def:datafieldcontrol runat="server" id="TSIDFRS" DatabaseField="TSIDFRS"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px"  FieldTextBoxWidth = "50px"></def:datafieldcontrol>
			</td>
			<td style="padding-left: 20px">
			<def:ValueSetLabel ID="ValueSetLabel_TSIDFRS" runat="server"  DatabaseField="TSIDFRS"></def:ValueSetLabel>
			</td>
		</tr>
		<tr>
			<td colspan="2">
			<!-- Not a double-entry field: Specify Research Study -->
			<def:datafieldcontrol runat="server" id="TSIDSRS" DatabaseField="TSIDSRS"  IsEntryField="true" IsDoubleEntryField="false"  FieldLabelWidth="300px" FieldTextBoxWidth = "300px" FieldTextBoxHeight = "70px" FieldTextBoxTextMode="MultiLine"></def:datafieldcontrol>
			</td>
		</tr>
	</table>
</div>
<div id="InfantExclusionary">
<p id="Jump3">Jump links: <a href="#FirstPage">First Page</a> | <a href="#Demographic">Demographic Information</a> | <a href="#InfantExclusionary">Infant Exclusionary Criteria</a> | <a href="#ProbandExclusionary">Proband Exclusionary Criteria</a> | <a href="#MedicalHistory">Infant Medical History</a> | <a href="#Wrap-up">Wrap-up Questions</a> | <a href="#ResearchStaff">Research Staff</a></p>
<h3>B. Exclusionary Criteria (Infant)</h3>
	<table border="0" cellpadding="0" cellspacing="0" style="background-color:#ffffee; padding-right: 20px">
		<tr>
			<td>
			<def:datafieldcontrol runat="server" id="TSIIEA" DatabaseField="TSIIEA"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px"  FieldTextBoxWidth = "50px"></def:datafieldcontrol>
			</td>
			<td style="padding-left: 20px" rowspan="3">
			<def:ValueSetLabel ID="ValueSetLabel_TSIIEA" runat="server"  DatabaseField="TSIIEA"></def:ValueSetLabel>
			</td>
		</tr>
		<tr>
			<td>
			<def:datafieldcontrol runat="server" id="TSIIEI" DatabaseField="TSIIEI"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px"  FieldTextBoxWidth = "50px"></def:datafieldcontrol>
			</td>
		</tr>
		<tr>
			<td>
			<def:datafieldcontrol runat="server" id="TSIIEND" DatabaseField="TSIIEND"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px"  FieldTextBoxWidth = "50px"></def:datafieldcontrol>
			</td>
		</tr>
		<tr>
			<td colspan="2">
			<!-- Not a double-entry field: Specify Infant neurological disorder -->
			<def:datafieldcontrol runat="server" id="TSIIESND" DatabaseField="TSIIESND"  IsEntryField="true" IsDoubleEntryField="false"  FieldLabelWidth="300px" FieldTextBoxWidth = "300px" FieldTextBoxHeight = "45px" FieldTextBoxTextMode="MultiLine"></def:datafieldcontrol>
			</td>
		</tr>
		<tr>
			<td>
			<def:datafieldcontrol runat="server" id="TSIIESF" DatabaseField="TSIIESF"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px"  FieldTextBoxWidth = "50px"></def:datafieldcontrol>
			</td>
			<td style="padding-left: 20px">
			<def:ValueSetLabel ID="ValueSetLabel_TSIIESF" runat="server"  DatabaseField="TSIIESF"></def:ValueSetLabel>
			</td>
		</tr>
		<tr>
			<td colspan="2">
			<!-- Not a double-entry field: Specify Infant seizure not related to fever -->
			<def:datafieldcontrol runat="server" id="TSIIESSF" DatabaseField="TSIIESSF"  IsEntryField="true" IsDoubleEntryField="false"  FieldLabelWidth="300px" FieldTextBoxWidth = "300px" FieldTextBoxHeight = "45px" FieldTextBoxTextMode="MultiLine"></def:datafieldcontrol>
			</td>
		</tr>
		<tr>
			<td>
			<def:datafieldcontrol runat="server" id="TSIIENS" DatabaseField="TSIIENS"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px"  FieldTextBoxWidth = "50px"></def:datafieldcontrol>
			</td>
			<td style="padding-left: 20px">
			<def:ValueSetLabel ID="ValueSetLabel_TSIIENS" runat="server"  DatabaseField="TSIIENS"></def:ValueSetLabel>
			</td>
		</tr>
		<tr>
			<td colspan="2">
			<!-- Not a double-entry field: Specify Infant Central Nervous System problem -->
			<def:datafieldcontrol runat="server" id="TSIIESNS" DatabaseField="TSIIESNS"  IsEntryField="true" IsDoubleEntryField="false"  FieldLabelWidth="300px" FieldTextBoxWidth = "300px" FieldTextBoxHeight = "45px" FieldTextBoxTextMode="MultiLine"></def:datafieldcontrol>
			</td>
		</tr>
		<tr>
			<td>
			<def:datafieldcontrol runat="server" id="TSIIEGD" DatabaseField="TSIIEGD"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px"  FieldTextBoxWidth = "50px"></def:datafieldcontrol>
			</td>
			<td style="padding-left: 20px">
			<def:ValueSetLabel ID="ValueSetLabel_TSIIEGD" runat="server"  DatabaseField="TSIIEGD"></def:ValueSetLabel>
			</td>
		</tr>
		<tr>
			<td colspan="2">
			<!-- Not a double-entry field: Specify Infant genetic disorder -->
			<def:datafieldcontrol runat="server" id="TSIIESGD" DatabaseField="TSIIESGD"  IsEntryField="true" IsDoubleEntryField="false"  FieldLabelWidth="300px" FieldTextBoxWidth = "300px" FieldTextBoxHeight = "45px" FieldTextBoxTextMode="MultiLine"></def:datafieldcontrol>
			</td>
		</tr>
		<tr>
			<td style="padding-left: 50px">
			<def:datafieldcontrol runat="server" id="TSIIEFX" DatabaseField="TSIIEFX"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="250px"  FieldTextBoxWidth = "50px"></def:datafieldcontrol>
			</td>
			<td style="padding-left: 20px">
			<def:ValueSetLabel ID="ValueSetLabel_TSIIEFX" runat="server"  DatabaseField="TSIIEFX"></def:ValueSetLabel>
			</td>
		</tr>
		<tr>
			<td style="padding-left: 50px" colspan="2">
			<!-- Not a double-entry field: Results for Infant Fragile X -->
			<def:datafieldcontrol runat="server" id="TSIIEFXR" DatabaseField="TSIIEFXR"  IsEntryField="true" IsDoubleEntryField="false"  FieldLabelWidth="250px" FieldTextBoxWidth = "300px" FieldTextBoxHeight = "45px" FieldTextBoxTextMode="MultiLine"></def:datafieldcontrol>
			</td>
		</tr>
		<tr>
			<td>
			<def:datafieldcontrol runat="server" id="TSIIEHV" DatabaseField="TSIIEHV"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px"  FieldTextBoxWidth = "50px"></def:datafieldcontrol>
			</td>
			<td style="padding-left: 20px">
			<def:ValueSetLabel ID="ValueSetLabel_TSIIEHV" runat="server"  DatabaseField="TSIIEHV"></def:ValueSetLabel>
			</td>
		</tr>
		<tr>
			<td colspan="2">
			<!-- Not a double-entry field: Specify Infant hearing or vision impairment -->
			<def:datafieldcontrol runat="server" id="TSIIESHV" DatabaseField="TSIIESHV"  IsEntryField="true" IsDoubleEntryField="false"  FieldLabelWidth="300px" FieldTextBoxWidth = "300px" FieldTextBoxHeight = "45px" FieldTextBoxTextMode="MultiLine"></def:datafieldcontrol>
			</td>
		</tr>
		<tr>
			<td>
			<def:datafieldcontrol runat="server" id="TSIIEMD" DatabaseField="TSIIEMD"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px"  FieldTextBoxWidth = "50px"></def:datafieldcontrol>
			</td>
			<td style="padding-left: 20px">
			<def:ValueSetLabel ID="ValueSetLabel_TSIIEMD" runat="server"  DatabaseField="TSIIEMD"></def:ValueSetLabel>
			</td>
		</tr>
		<tr>
			<td colspan="2">
			<!-- Not a double-entry field: Specify Infant major motor delays -->
			<def:datafieldcontrol runat="server" id="TSIIESMD" DatabaseField="TSIIESMD"  IsEntryField="true" IsDoubleEntryField="false"  FieldLabelWidth="300px" FieldTextBoxWidth = "300px" FieldTextBoxHeight = "45px" FieldTextBoxTextMode="MultiLine"></def:datafieldcontrol>
			</td>
		</tr>
		<tr>
			<td>
			<def:datafieldcontrol runat="server" id="TSIIECI" DatabaseField="TSIIECI"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px"  FieldTextBoxWidth = "50px"></def:datafieldcontrol>
			</td>
			<td style="padding-left: 20px">
			<def:ValueSetLabel ID="ValueSetLabel_TSIIECI" runat="server"  DatabaseField="TSIIECI"></def:ValueSetLabel>
			</td>
		</tr>
		<tr>
			<td colspan="2">
			<!-- Not a double-entry field: Specify Infant chronic medical illness -->
			<def:datafieldcontrol runat="server" id="TSIIESCI" DatabaseField="TSIIESCI"  IsEntryField="true" IsDoubleEntryField="false"  FieldLabelWidth="300px" FieldTextBoxWidth = "300px" FieldTextBoxHeight = "45px" FieldTextBoxTextMode="MultiLine"></def:datafieldcontrol>
			</td>
		</tr>
		<tr>
			<td>
			<def:datafieldcontrol runat="server" id="TSIIEED" DatabaseField="TSIIEED"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px"  FieldTextBoxWidth = "50px"></def:datafieldcontrol>
			</td>
			<td style="padding-left: 20px">
			<def:ValueSetLabel ID="ValueSetLabel_TSIIEED" runat="server"  DatabaseField="TSIIEED"></def:ValueSetLabel>
			</td>
		</tr>
		<tr>
			<td style="padding-left: 50px" colspan="2">
			<!-- Not a double-entry field: Name of substance -->
			<def:datafieldcontrol runat="server" id="TSIIEEDN" DatabaseField="TSIIEEDN"  IsEntryField="true" IsDoubleEntryField="false"  FieldLabelWidth="250px" FieldTextBoxWidth = "300px" FieldTextBoxHeight = "45px" FieldTextBoxTextMode="MultiLine"></def:datafieldcontrol>
			</td>
		</tr>
		<tr>
			<td style="padding-left: 50px" colspan="2">
			<!-- Not a double-entry field: Amount of substance -->
			<def:datafieldcontrol runat="server" id="TSIIEEDA" DatabaseField="TSIIEEDA"  IsEntryField="true" IsDoubleEntryField="false"  FieldLabelWidth="250px" FieldTextBoxWidth = "300px"></def:datafieldcontrol>
			</td>
		</tr>
		<tr>
			<td style="padding-left: 50px" colspan="2">
			<!-- Not a double-entry field: Time period -->
			<def:datafieldcontrol runat="server" id="TSIIEEDT" DatabaseField="TSIIEEDT"  IsEntryField="true" IsDoubleEntryField="false"  FieldLabelWidth="250px" FieldTextBoxWidth = "300px"></def:datafieldcontrol>
			</td>
		</tr>
		<tr>
			<td>
			<def:datafieldcontrol runat="server" id="TSIIEDGD" DatabaseField="TSIIEDGD"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px"  FieldTextBoxWidth = "50px"></def:datafieldcontrol>
			</td>
			<td style="padding-left: 20px" rowspan="2">
			<def:ValueSetLabel ID="ValueSetLabel_TSIIEDGD" runat="server"  DatabaseField="TSIIEDGD"></def:ValueSetLabel>
			</td>
		</tr>
		<tr>
			<td>
			<def:datafieldcontrol runat="server" id="TSIIEBP" DatabaseField="TSIIEBP"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px"  FieldTextBoxWidth = "50px"></def:datafieldcontrol>
			</td>
		</tr>
		<tr>
			<td colspan="2">
			<!-- Not a double-entry field: Specify Infant prematurity -->
			<def:datafieldcontrol runat="server" id="TSIIESBP" DatabaseField="TSIIESBP"  IsEntryField="true" IsDoubleEntryField="false"  FieldLabelWidth="300px" FieldTextBoxWidth = "300px" FieldTextBoxHeight = "45px" FieldTextBoxTextMode="MultiLine"></def:datafieldcontrol>
			</td>
		</tr>
		<tr>
			<td style="padding-left: 50px">
			<def:datafieldcontrol runat="server" id="TSIIEPD" DatabaseField="TSIIEPD"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="250px"  FieldTextBoxWidth = "50px"></def:datafieldcontrol>
			</td>
			<td style="padding-left: 20px">
			<def:ValueSetLabel ID="ValueSetLabel_TSIIEPD" runat="server"  DatabaseField="TSIIEPD"></def:ValueSetLabel>
			</td>
		</tr>
		<tr>
			<td style="padding-left: 50px" colspan="2">
			<!-- Not a double-entry field: Specify Infant problems during delivery -->
			<def:datafieldcontrol runat="server" id="TSIIESPD" DatabaseField="TSIIESPD"  IsEntryField="true" IsDoubleEntryField="false"  FieldLabelWidth="250px" FieldTextBoxWidth = "300px" FieldTextBoxHeight = "45px" FieldTextBoxTextMode="MultiLine"></def:datafieldcontrol>
			</td>
		</tr>
		<tr>
			<td style="padding-left: 50px">
			<def:datafieldcontrol runat="server" id="TSIIEPA" DatabaseField="TSIIEPA"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="250px"  FieldTextBoxWidth = "50px"></def:datafieldcontrol>
			</td>
			<td style="padding-left: 20px">
			<def:ValueSetLabel ID="ValueSetLabel_TSIIEPA" runat="server"  DatabaseField="TSIIEPA"></def:ValueSetLabel>
			</td>
		</tr>
		<tr>
			<td style="padding-left: 50px" colspan="2">
			<!-- Not a double-entry field: Specify Infant major physical anomalies -->
			<def:datafieldcontrol runat="server" id="TSIIESPA" DatabaseField="TSIIESPA"  IsEntryField="true" IsDoubleEntryField="false"  FieldLabelWidth="250px" FieldTextBoxWidth = "300px" FieldTextBoxHeight = "45px" FieldTextBoxTextMode="MultiLine"></def:datafieldcontrol>
			</td>
		</tr>
	</table>	
</div>
<div id="ProbandExclusionary">
<p id="Jump4">Jump links: <a href="#FirstPage">First Page</a> | <a href="#Demographic">Demographic Information</a> | <a href="#InfantExclusionary">Infant Exclusionary Criteria</a> | <a href="#ProbandExclusionary">Proband Exclusionary Criteria</a> | <a href="#MedicalHistory">Infant Medical History</a> | <a href="#Wrap-up">Wrap-up Questions</a> | <a href="#ResearchStaff">Research Staff</a></p>
<h3>C. Exclusionary Criteria (Proband)</h3>
	<table border="0" cellpadding="0" cellspacing="0" style="background-color:#ffeeff; padding-right: 20px">
		<tr>
			<td>
			<def:datafieldcontrol runat="server" id="TSIPEND" DatabaseField="TSIPEND"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px"  FieldTextBoxWidth = "50px"></def:datafieldcontrol>
			</td>
			<td style="padding-left: 20px">
			<def:ValueSetLabel ID="ValueSetLabel_TSIPEND" runat="server"  DatabaseField="TSIPEND"></def:ValueSetLabel>
			</td>
		</tr>
		<tr>
			<td colspan="2">
			<!-- Not a double-entry field: Specify Proband neurological disorder -->
			<def:datafieldcontrol runat="server" id="TSIPESND" DatabaseField="TSIPESND"  IsEntryField="true" IsDoubleEntryField="false"  FieldLabelWidth="300px" FieldTextBoxWidth = "300px" FieldTextBoxHeight = "45px" FieldTextBoxTextMode="MultiLine"></def:datafieldcontrol>
			</td>
		</tr>
		<tr>
			<td>
			<def:datafieldcontrol runat="server" id="TSIPESF" DatabaseField="TSIPESF"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px"  FieldTextBoxWidth = "50px"></def:datafieldcontrol>
			</td>
			<td style="padding-left: 20px">
			<def:ValueSetLabel ID="ValueSetLabel_TSIPESF" runat="server"  DatabaseField="TSIPESF"></def:ValueSetLabel>
			</td>
		</tr>
		<tr>
			<td colspan="2">
			<!-- Not a double-entry field: Specify Proband seizure not related to fever -->
			<def:datafieldcontrol runat="server" id="TSIPESSF" DatabaseField="TSIPESSF"  IsEntryField="true" IsDoubleEntryField="false"  FieldLabelWidth="300px" FieldTextBoxWidth = "300px" FieldTextBoxHeight = "45px" FieldTextBoxTextMode="MultiLine"></def:datafieldcontrol>
			</td>
		</tr>
		<tr>
			<td>
			<def:datafieldcontrol runat="server" id="TSIPENS" DatabaseField="TSIPENS"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px"  FieldTextBoxWidth = "50px"></def:datafieldcontrol>
			</td>
			<td style="padding-left: 20px">
			<def:ValueSetLabel ID="ValueSetLabel_TSIPENS" runat="server"  DatabaseField="TSIPENS"></def:ValueSetLabel>
			</td>
		</tr>
		<tr>
			<td colspan="2">
			<!-- Not a double-entry field: Specify Proband Central Nervous System problem -->
			<def:datafieldcontrol runat="server" id="TSIPESNS" DatabaseField="TSIPESNS"  IsEntryField="true" IsDoubleEntryField="false"  FieldLabelWidth="300px" FieldTextBoxWidth = "300px" FieldTextBoxHeight = "45px" FieldTextBoxTextMode="MultiLine"></def:datafieldcontrol>
			</td>
		</tr>
		<tr>
			<td>
			<def:datafieldcontrol runat="server" id="TSIPEED" DatabaseField="TSIPEED"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px"  FieldTextBoxWidth = "50px"></def:datafieldcontrol>
			</td>
			<td style="padding-left: 20px">
			<def:ValueSetLabel ID="ValueSetLabel_TSIPEED" runat="server"  DatabaseField="TSIPEED"></def:ValueSetLabel>
			</td>
		</tr>
		<tr>
			<td style="padding-left: 50px" colspan="2">
			<!-- Not a double-entry field: Name of substance -->
			<def:datafieldcontrol runat="server" id="TSIPEEDN" DatabaseField="TSIPEEDN"  IsEntryField="true" IsDoubleEntryField="false"  FieldLabelWidth="250px" FieldTextBoxWidth = "300px" FieldTextBoxHeight = "45px" FieldTextBoxTextMode="MultiLine"></def:datafieldcontrol>
			</td>
		</tr>
		<tr>
			<td style="padding-left: 50px" colspan="2">
			<!-- Not a double-entry field: Amount of substance -->
			<def:datafieldcontrol runat="server" id="TSIPEEDA" DatabaseField="TSIPEEDA"  IsEntryField="true" IsDoubleEntryField="false"  FieldLabelWidth="250px" FieldTextBoxWidth = "300px"></def:datafieldcontrol>
			</td>
		</tr>
		<tr>
			<td style="padding-left: 50px" colspan="2">
			<!-- Not a double-entry field: Time period -->
			<def:datafieldcontrol runat="server" id="TSIPEEDT" DatabaseField="TSIPEEDT"  IsEntryField="true" IsDoubleEntryField="false"  FieldLabelWidth="250px" FieldTextBoxWidth = "300px"></def:datafieldcontrol>
			</td>
		</tr>
		<tr>
			<td>
			<def:datafieldcontrol runat="server" id="TSIPEGD" DatabaseField="TSIPEGD"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px"  FieldTextBoxWidth = "50px"></def:datafieldcontrol>
			</td>
			<td style="padding-left: 20px">
			<def:ValueSetLabel ID="ValueSetLabel_TSIPEGD" runat="server"  DatabaseField="TSIPEGD"></def:ValueSetLabel>
			</td>
		</tr>
		<tr>
			<td colspan="2">
			<!-- Not a double-entry field: Specify Proband genetic disorder -->
			<def:datafieldcontrol runat="server" id="TSIPESGD" DatabaseField="TSIPESGD"  IsEntryField="true" IsDoubleEntryField="false"  FieldLabelWidth="300px" FieldTextBoxWidth = "300px" FieldTextBoxHeight = "45px" FieldTextBoxTextMode="MultiLine"></def:datafieldcontrol>
			</td>
		</tr>
		<tr>
			<td style="padding-left: 50px">
			<def:datafieldcontrol runat="server" id="TSIPEFX" DatabaseField="TSIPEFX"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="250px"  FieldTextBoxWidth = "50px"></def:datafieldcontrol>
			</td>
			<td style="padding-left: 20px">
			<def:ValueSetLabel ID="ValueSetLabel_TSIPEFX" runat="server"  DatabaseField="TSIPEFX"></def:ValueSetLabel>
			</td>
		</tr>
		<tr>
			<td style="padding-left: 50px" colspan="2">
			<!-- Not a double-entry field: Results for Proband Fragile X -->
			<def:datafieldcontrol runat="server" id="TSIPEFXR" DatabaseField="TSIPEFXR"  IsEntryField="true" IsDoubleEntryField="false"  FieldLabelWidth="250px" FieldTextBoxWidth = "300px" FieldTextBoxHeight = "45px" FieldTextBoxTextMode="MultiLine"></def:datafieldcontrol>
			</td>
		</tr>
		<tr>
			<td>
			<def:datafieldcontrol runat="server" id="TSIPEHI" DatabaseField="TSIPEHI"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px"  FieldTextBoxWidth = "50px"></def:datafieldcontrol>
			</td>
			<td style="padding-left: 20px">
			<def:ValueSetLabel ID="ValueSetLabel_TSIPEHI" runat="server"  DatabaseField="TSIPEHI"></def:ValueSetLabel>
			</td>
		</tr>
		<tr>
			<td colspan="2">
			<!-- Not a double-entry field: Specify Proband severe head injuries -->
			<def:datafieldcontrol runat="server" id="TSIPESHI" DatabaseField="TSIPESHI"  IsEntryField="true" IsDoubleEntryField="false"  FieldLabelWidth="300px" FieldTextBoxWidth = "300px" FieldTextBoxHeight = "45px" FieldTextBoxTextMode="MultiLine"></def:datafieldcontrol>
			</td>
		</tr>
		<tr>
			<td>
			<def:datafieldcontrol runat="server" id="TSIPERD" DatabaseField="TSIPERD"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px"  FieldTextBoxWidth = "50px"></def:datafieldcontrol>
			</td>
			<td style="padding-left: 20px">
			<def:ValueSetLabel ID="ValueSetLabel_TSIPERD" runat="server"  DatabaseField="TSIPERD"></def:ValueSetLabel>
			</td>
		</tr>
		<tr>
			<td colspan="2">
			<!-- Not a double-entry field: Specify Proband first degree relatives diagnosed -->
			<def:datafieldcontrol runat="server" id="TSIPESRD" DatabaseField="TSIPESRD"  IsEntryField="true" IsDoubleEntryField="false"  FieldLabelWidth="300px" FieldTextBoxWidth = "300px" FieldTextBoxHeight = "70px" FieldTextBoxTextMode="MultiLine"></def:datafieldcontrol>
			</td>
		</tr>
	</table>
</div>
<div id="MedicalHistory">
<p id="Jump5">Jump links: <a href="#FirstPage">First Page</a> | <a href="#Demographic">Demographic Information</a> | <a href="#InfantExclusionary">Infant Exclusionary Criteria</a> | <a href="#ProbandExclusionary">Proband Exclusionary Criteria</a> | <a href="#MedicalHistory">Infant Medical History</a> | <a href="#Wrap-up">Wrap-up Questions</a> | <a href="#ResearchStaff">Research Staff</a></p>
<h3>D. Medical History (pertaining to MRI/Sedation)</h3>
	<table border="0" cellpadding="0" cellspacing="0">
		<tr>
			<td>
			<def:datafieldcontrol runat="server" id="TSIMHS" DatabaseField="TSIMHS"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px"  FieldTextBoxWidth = "50px"></def:datafieldcontrol>
			</td>
			<td style="padding-left: 20px">
			<def:ValueSetLabel ID="ValueSetLabel_TSIMHS" runat="server"  DatabaseField="TSIMHS"></def:ValueSetLabel>
			</td>
		</tr>
		<tr>
			<td colspan="2">
			<!-- Not a double-entry field: Specify Infant surgeries -->
			<def:datafieldcontrol runat="server" id="TSIMHSS" DatabaseField="TSIMHSS"  IsEntryField="true" IsDoubleEntryField="false"  FieldLabelWidth="300px" FieldTextBoxWidth = "300px" FieldTextBoxHeight = "70px" FieldTextBoxTextMode="MultiLine"></def:datafieldcontrol>
			</td>
		</tr>
		<tr>
			<td style="padding-left: 50px">
			<def:datafieldcontrol runat="server" id="TSIMHSC" DatabaseField="TSIMHSC"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="250px"  FieldTextBoxWidth = "50px"></def:datafieldcontrol>
			</td>
			<td style="padding-left: 20px">
			<def:ValueSetLabel ID="ValueSetLabel_TSIMHSC" runat="server"  DatabaseField="TSIMHSC"></def:ValueSetLabel>
			</td>
		</tr>
		<tr>
			<td style="padding-left: 50px" colspan="2">
			<!-- Not a double-entry field: Specify Infant surgery complications -->
			<def:datafieldcontrol runat="server" id="TSIMHSSC" DatabaseField="TSIMHSSC"  IsEntryField="true" IsDoubleEntryField="false"  FieldLabelWidth="250px" FieldTextBoxWidth = "300px" FieldTextBoxHeight = "70px" FieldTextBoxTextMode="MultiLine"></def:datafieldcontrol>
			</td>
		</tr>
		<tr>
			<td>
			<def:datafieldcontrol runat="server" id="TSIMHH" DatabaseField="TSIMHH"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px"  FieldTextBoxWidth = "50px"></def:datafieldcontrol>
			</td>
			<td style="padding-left: 20px">
			<def:ValueSetLabel ID="ValueSetLabel_TSIMHH" runat="server"  DatabaseField="TSIMHH"></def:ValueSetLabel>
			</td>
		</tr>
		<tr>
			<td colspan="2">
			<!-- Not a double-entry field: Specify Infant hospitalized -->
			<def:datafieldcontrol runat="server" id="TSIMHSH" DatabaseField="TSIMHSH"  IsEntryField="true" IsDoubleEntryField="false"  FieldLabelWidth="300px" FieldTextBoxWidth = "300px" FieldTextBoxHeight = "45px" FieldTextBoxTextMode="MultiLine"></def:datafieldcontrol>
			</td>
		</tr>
		<tr>
			<td>
			<def:datafieldcontrol runat="server" id="TSIMHMS" DatabaseField="TSIMHMS"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px"  FieldTextBoxWidth = "50px"></def:datafieldcontrol>
			</td>
			<td style="padding-left: 20px">
			<def:ValueSetLabel ID="ValueSetLabel_TSIMHMS" runat="server"  DatabaseField="TSIMHMS"></def:ValueSetLabel>
			</td>
		</tr>
		<tr>
			<td colspan="2">
			<!-- Not a double-entry field: Specify Infant metal plates, clips, etc. from surgery -->
			<def:datafieldcontrol runat="server" id="TSIMHSMS" DatabaseField="TSIMHSMS"  IsEntryField="true" IsDoubleEntryField="false"  FieldLabelWidth="300px" FieldTextBoxWidth = "300px" FieldTextBoxHeight = "70px" FieldTextBoxTextMode="MultiLine"></def:datafieldcontrol>
			</td>
		</tr>
		<tr>
			<td>
			<def:datafieldcontrol runat="server" id="TSIMHOM" DatabaseField="TSIMHOM"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px"  FieldTextBoxWidth = "50px"></def:datafieldcontrol>
			</td>
			<td style="padding-left: 20px">
			<def:ValueSetLabel ID="ValueSetLabel_TSIMHOM" runat="server"  DatabaseField="TSIMHOM"></def:ValueSetLabel>
			</td>
		</tr>
		<tr>
			<td colspan="2">
			<!-- Not a double-entry field: Specify accompanying metal plates, clips, etc. -->
			<def:datafieldcontrol runat="server" id="TSIMHSOM" DatabaseField="TSIMHSOM"  IsEntryField="true" IsDoubleEntryField="false"  FieldLabelWidth="300px" FieldTextBoxWidth = "300px" FieldTextBoxHeight = "70px" FieldTextBoxTextMode="MultiLine"></def:datafieldcontrol>
			</td>
		</tr>
		<tr>
			<td style="padding-left: 50px" colspan="2">
			<!-- Not a double-entry field: Type of Metal -->
			<def:datafieldcontrol runat="server" id="TSIMHTOM" DatabaseField="TSIMHTOM"  IsEntryField="true" IsDoubleEntryField="false"  FieldLabelWidth="250px" FieldTextBoxWidth = "300px" FieldTextBoxHeight = "45px" FieldTextBoxTextMode="MultiLine"></def:datafieldcontrol>
			</td>
		</tr>
		<tr>
			<td>
			<def:datafieldcontrol runat="server" id="TSIMHWB" DatabaseField="TSIMHWB"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px"  FieldTextBoxWidth = "50px"></def:datafieldcontrol>
			</td>
			<td style="padding-left: 20px">
			<def:ValueSetLabel ID="ValueSetLabel_TSIMHWB" runat="server"  DatabaseField="TSIMHWB"></def:ValueSetLabel>
			</td>
		</tr>
		<tr>
			<td colspan="2">
			<!-- Not a double-entry field: Specify Infant Dr. visits outside Well Baby -->
			<def:datafieldcontrol runat="server" id="TSIMHSWB" DatabaseField="TSIMHSWB"  IsEntryField="true" IsDoubleEntryField="false"  FieldLabelWidth="300px" FieldTextBoxWidth = "300px" FieldTextBoxHeight = "45px" FieldTextBoxTextMode="MultiLine"></def:datafieldcontrol>
			</td>
		</tr>
		<tr>
			<td>
			<def:datafieldcontrol runat="server" id="TSIMHM" DatabaseField="TSIMHM"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px"  FieldTextBoxWidth = "50px"></def:datafieldcontrol>
			</td>
			<td style="padding-left: 20px">
			<def:ValueSetLabel ID="ValueSetLabel_TSIMHM" runat="server"  DatabaseField="TSIMHM"></def:ValueSetLabel>
			</td>
		</tr>
		<tr>
			<td colspan="2">
			<!-- Not a double-entry field: Specify Infant medication since birth -->
			<def:datafieldcontrol runat="server" id="TSIMHSM" DatabaseField="TSIMHSM"  IsEntryField="true" IsDoubleEntryField="false"  FieldLabelWidth="300px" FieldTextBoxWidth = "300px" FieldTextBoxHeight = "45px" FieldTextBoxTextMode="MultiLine"></def:datafieldcontrol>
			</td>
		</tr>
		<tr>
			<td>
			<def:datafieldcontrol runat="server" id="TSIMHAM" DatabaseField="TSIMHAM"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px"  FieldTextBoxWidth = "50px"></def:datafieldcontrol>
			</td>
			<td style="padding-left: 20px">
			<def:ValueSetLabel ID="ValueSetLabel_TSIMHAM" runat="server"  DatabaseField="TSIMHAM"></def:ValueSetLabel>
			</td>
		</tr>
		<tr>
			<td colspan="2">
			<!-- Not a double-entry field: Specify allergies to medicine -->
			<def:datafieldcontrol runat="server" id="TSIMHSAM" DatabaseField="TSIMHSAM"  IsEntryField="true" IsDoubleEntryField="false"  FieldLabelWidth="300px" FieldTextBoxWidth = "300px" FieldTextBoxHeight = "45px" FieldTextBoxTextMode="MultiLine"></def:datafieldcontrol>
			</td>
		</tr>
		<tr>
			<td>
			<def:datafieldcontrol runat="server" id="TSIMHMB" DatabaseField="TSIMHMB"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px"  FieldTextBoxWidth = "50px"></def:datafieldcontrol>
			</td>
			<td style="padding-left: 20px">
			<def:ValueSetLabel ID="ValueSetLabel_TSIMHMB" runat="server"  DatabaseField="TSIMHMB"></def:ValueSetLabel>
			</td>
		</tr>
		<tr>
			<td colspan="2">
			<!-- Not a double-entry field: Specify Infant MRI of brain -->
			<def:datafieldcontrol runat="server" id="TSIMHSMB" DatabaseField="TSIMHSMB"  IsEntryField="true" IsDoubleEntryField="false"  FieldLabelWidth="300px" FieldTextBoxWidth = "300px" FieldTextBoxHeight = "45px" FieldTextBoxTextMode="MultiLine"></def:datafieldcontrol>
			</td>
		</tr>
		<tr>
			<td>
			<def:datafieldcontrol runat="server" id="TSIMHAS" DatabaseField="TSIMHAS"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px"  FieldTextBoxWidth = "50px"></def:datafieldcontrol>
			</td>
			<td style="padding-left: 20px">
			<def:ValueSetLabel ID="ValueSetLabel_TSIMHAS" runat="server"  DatabaseField="TSIMHAS"></def:ValueSetLabel>
			</td>
		</tr>
		<tr>
			<td colspan="2">
			<!-- Not a double-entry field: Specify Infant anesthesia or other sedation -->
			<def:datafieldcontrol runat="server" id="TSIMHSAS" DatabaseField="TSIMHSAS"  IsEntryField="true" IsDoubleEntryField="false"  FieldLabelWidth="300px" FieldTextBoxWidth = "300px" FieldTextBoxHeight = "45px" FieldTextBoxTextMode="MultiLine"></def:datafieldcontrol>
			</td>
		</tr>
		<tr>
			<td style="padding-left: 50px">
			<def:datafieldcontrol runat="server" id="TSIMHPS" DatabaseField="TSIMHPS"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="250px"  FieldTextBoxWidth = "50px"></def:datafieldcontrol>
			</td>
			<td style="padding-left: 20px">
			<def:ValueSetLabel ID="ValueSetLabel_TSIMHPS" runat="server"  DatabaseField="TSIMHPS"></def:ValueSetLabel>
			</td>
		</tr>
		<tr>
			<td style="padding-left: 50px" colspan="2">
			<!-- Not a double-entry field: Specify Infant problems with sedation -->
			<def:datafieldcontrol runat="server" id="TSIMHSPS" DatabaseField="TSIMHSPS"  IsEntryField="true" IsDoubleEntryField="false"  FieldLabelWidth="250px" FieldTextBoxWidth = "300px" FieldTextBoxHeight = "45px" FieldTextBoxTextMode="MultiLine"></def:datafieldcontrol>
			</td>
		</tr>
		<tr>
			<td colspan="2">
			<def:datafieldcontrol runat="server" id="TSIMHTSN" DatabaseField="TSIMHTSN"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth = "300px"></def:datafieldcontrol>
			</td>
		</tr>
		<tr>
			<td>
			<def:datafieldcontrol runat="server" id="TSIMHLS" DatabaseField="TSIMHLS"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px"  FieldTextBoxWidth = "50px"></def:datafieldcontrol>
			</td>
			<td style="padding-left: 20px">
			<def:ValueSetLabel ID="ValueSetLabel_TSIMHLS" runat="server"  DatabaseField="TSIMHLS"></def:ValueSetLabel>
			</td>
		</tr>
	</table>
</div>
<div id="Wrap-up">
<p id="Jump6">Jump links: <a href="#FirstPage">First Page</a> | <a href="#Demographic">Demographic Information</a> | <a href="#InfantExclusionary">Infant Exclusionary Criteria</a> | <a href="#ProbandExclusionary">Proband Exclusionary Criteria</a> | <a href="#MedicalHistory">Infant Medical History</a> | <a href="#Wrap-up">Wrap-up Questions</a> | <a href="#ResearchStaff">Research Staff</a></p>
<h3>E. Wrap-up Questions</h3>
	<table border="0" cellpadding="0" cellspacing="0">
		<tr>
			<td>
			<def:datafieldcontrol runat="server" id="TSIWOD" DatabaseField="TSIWOD"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px"  FieldTextBoxWidth = "50px"></def:datafieldcontrol>
			</td>
			<td style="padding-left: 20px">
			<def:ValueSetLabel ID="ValueSetLabel_TSIWOD" runat="server"  DatabaseField="TSIWOD"></def:ValueSetLabel>
			</td>
		</tr>
		<tr>
			<td colspan="2">
			<!-- Not a double-entry field: Specify Infant dx, date of dx, clinician -->
			<def:datafieldcontrol runat="server" id="TSIWSOD" DatabaseField="TSIWSOD"  IsEntryField="true" IsDoubleEntryField="false"  FieldLabelWidth="300px" FieldTextBoxWidth = "300px" FieldTextBoxHeight = "70px" FieldTextBoxTextMode="MultiLine"></def:datafieldcontrol>
			</td>
		</tr>
		<tr>
			<td>
			<def:datafieldcontrol runat="server" id="TSIWF" DatabaseField="TSIWF"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px"  FieldTextBoxWidth = "50px"></def:datafieldcontrol>
			</td>
			<td style="padding-left: 20px">
			<def:ValueSetLabel ID="ValueSetLabel_TSIWF" runat="server"  DatabaseField="TSIWF"></def:ValueSetLabel>
			</td>
		</tr>
		<tr>
			<td colspan="2">
			<!-- Not a double-entry field: Specify family not covered -->
			<def:datafieldcontrol runat="server" id="TSIWSF" DatabaseField="TSIWSF"  IsEntryField="true" IsDoubleEntryField="false"  FieldLabelWidth="300px" FieldTextBoxWidth = "300px" FieldTextBoxHeight = "70px" FieldTextBoxTextMode="MultiLine"></def:datafieldcontrol>
			</td>
		</tr>
		<tr>
			<td colspan="2">
			<!-- Not a double-entry field: Participation notes -->
			<def:datafieldcontrol runat="server" id="TSIWPN" DatabaseField="TSIWPN"  IsEntryField="true" IsDoubleEntryField="false"  FieldLabelWidth="300px" FieldTextBoxWidth = "300px" FieldTextBoxHeight = "70px" FieldTextBoxTextMode="MultiLine"></def:datafieldcontrol>
			</td>
		</tr>
	</table>
</div>
<div id="ResearchStaff">
<p id="Jump7">Jump links: <a href="#FirstPage">First Page</a> | <a href="#Demographic">Demographic Information</a> | <a href="#InfantExclusionary">Infant Exclusionary Criteria</a> | <a href="#ProbandExclusionary">Proband Exclusionary Criteria</a> | <a href="#MedicalHistory">Infant Medical History</a> | <a href="#Wrap-up">Wrap-up Questions</a> | <a href="#ResearchStaff">Research Staff</a></p>
<h3>For Research Staff to Complete</h3>
	<table border="0" cellpadding="0" cellspacing="0">
		<tr>
			<td>
			<def:datafieldcontrol runat="server" id="TSIRSIE" DatabaseField="TSIRSIE"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px"  FieldTextBoxWidth = "50px"></def:datafieldcontrol>
			</td>
			<td style="padding-left: 20px">
			<def:ValueSetLabel ID="ValueSetLabel_TSIRSIE" runat="server"  DatabaseField="TSIRSIE"></def:ValueSetLabel>
			</td>
		</tr>
		<tr>
			<td colspan="2">
			<!-- Not a double-entry field: Specify Infant exclusion criteria -->
			<def:datafieldcontrol runat="server" id="TSIRSSIE" DatabaseField="TSIRSSIE"  IsEntryField="true" IsDoubleEntryField="false"  FieldLabelWidth="300px" FieldTextBoxWidth = "300px" FieldTextBoxHeight = "70px" FieldTextBoxTextMode="MultiLine"></def:datafieldcontrol>
			</td>
		</tr>
		<tr>
			<td>
			<def:datafieldcontrol runat="server" id="TSIRSPE" DatabaseField="TSIRSPE"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px"  FieldTextBoxWidth = "50px"></def:datafieldcontrol>
			</td>
			<td style="padding-left: 20px">
			<def:ValueSetLabel ID="ValueSetLabel_TSIRSPE" runat="server"  DatabaseField="TSIRSPE"></def:ValueSetLabel>
			</td>
		</tr>
		<tr>
			<td colspan="2">
			<!-- Not a double-entry field: Specify Proband exclusion criteria -->
			<def:datafieldcontrol runat="server" id="TSIRSSPE" DatabaseField="TSIRSSPE"  IsEntryField="true" IsDoubleEntryField="false"  FieldLabelWidth="300px" FieldTextBoxWidth = "300px" FieldTextBoxHeight = "70px" FieldTextBoxTextMode="MultiLine"></def:datafieldcontrol>
			</td>
		</tr>
		<tr>
			<td>
			<def:datafieldcontrol runat="server" id="TSIRSCM" DatabaseField="TSIRSCM"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px"  FieldTextBoxWidth = "50px"></def:datafieldcontrol>
			</td>
			<td style="padding-left: 20px">
			<def:ValueSetLabel ID="ValueSetLabel_TSIRSCM" runat="server"  DatabaseField="TSIRSCM"></def:ValueSetLabel>
			</td>
		</tr>
		<tr>
			<td colspan="2">
			<!-- Not a double-entry field: Specify Infant contraindication to MRI -->
			<def:datafieldcontrol runat="server" id="TSIRSSCM" DatabaseField="TSIRSSCM"  IsEntryField="true" IsDoubleEntryField="false"  FieldLabelWidth="300px" FieldTextBoxWidth = "300px" FieldTextBoxHeight = "70px" FieldTextBoxTextMode="MultiLine"></def:datafieldcontrol>
			</td>
		</tr>
		<tr>
			<td>
			<def:datafieldcontrol runat="server" id="TSIRSPNL" DatabaseField="TSIRSPNL"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px"  FieldTextBoxWidth = "50px"></def:datafieldcontrol>
			</td>
			<td style="padding-left: 20px">
			<def:ValueSetLabel ID="ValueSetLabel_TSIRSPNL" runat="server"  DatabaseField="TSIRSPNL"></def:ValueSetLabel>
			</td>
      </asp:Panel>
		</tr>
	</table>
</div>
<br />
<def:datafieldcontrol runat="server" id="created" DatabaseField="created"  IsReadOnly="true" RenderReadOnlyAsDiv="true"   FieldLabelWidth="300px "></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="createdBy" DatabaseField="createdBy"  IsReadOnly="true" RenderReadOnlyAsDiv="true"   FieldLabelWidth="300px "></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="updated" DatabaseField="updated"  IsReadOnly="true" RenderReadOnlyAsDiv="true"   FieldLabelWidth="300px "></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="updatedBy" DatabaseField="updatedBy"  IsReadOnly="true" RenderReadOnlyAsDiv="true"   FieldLabelWidth="300px "></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="scored" DatabaseField="scored"  IsReadOnly="true" RenderReadOnlyAsDiv="true"   FieldLabelWidth="300px "></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="scoredBy" DatabaseField="scoredBy"  IsReadOnly="true" RenderReadOnlyAsDiv="true"   FieldLabelWidth="300px "></def:datafieldcontrol>
</asp:Content>
