<%@ Register TagPrefix="def" Namespace="DataEntryFramework3" %> 
<%@ Page language="c#" MasterPageFile="~/UWAC.master"  Title="Family Information Update Data Entry" %>
<asp:Content ID="Content1" ContentPlaceHolderID="oBodyPlaceHolder" runat="server">

<def:dataentrycontroller id="DataEntryController1" runat="server" DatabaseTable="ALL_FIU_Pathways" >
</def:dataentrycontroller>
<div class="main">
    <def:datafieldcontrol runat="server" id="id" DatabaseField="id" IsInsertField="true" FieldLabelWidth="150px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="15"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="indexnum" DatabaseField="indexnum" IsInsertField="true" FieldTextBoxTextDefault="1" FieldLabelWidth="150px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="Date" DatabaseField="Date" IsInsertField="true" FieldLabelWidth="150px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="Interviewer" DatabaseField="Interviewer" IsInsertField="true" FieldLabelWidth="150px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="50"></def:datafieldcontrol>
</div> 
<asp:panel id="mainPanel" CssClass="mainPanel" runat="server">
<div class="collection">
  <div class="main"><def:datafieldcontrol runat="server" id="Relation" DatabaseField="Relation" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="200px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
  <div class="key"><def:ValueSetLabel ID="ValueSetLabel_Relation" runat="server"  DatabaseField="Relation"></def:ValueSetLabel></div>
</div>
<div class="main"><def:datafieldcontrol runat="server" id="RelationSp" DatabaseField="RelationSp" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="200px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="50"></def:datafieldcontrol></div>
<div class="collection">
    <div class="main"><def:datafieldcontrol runat="server" id="LastVisitM" DatabaseField="LastVisitM" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="200px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
    <div class="continue"><def:datafieldcontrol runat="server" id="LastVisitY" DatabaseField="LastVisitY" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
</div>
<hr class="main">
<div class="main">
    A. GENERAL FAMILY INFORMATION<br />
    <em>Please update Household page as needed.</em><br /><br />
    1. Since we last contacted you, have there been any changes in any of the following:<br />
    1a. Contact information?
</div>
<div class="collection">
  <div class="main">
    <def:datafieldcontrol runat="server" id="A1a2" DatabaseField="A1a2" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="A1a3" DatabaseField="A1a3" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="A1a4" DatabaseField="A1a4" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="A1a5" DatabaseField="A1a5" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
  </div>
  <div class="key"><def:ValueSetLabel ID="ValueSetLabel_A1a2" runat="server"  DatabaseField="A1a2"></def:ValueSetLabel></div>
</div>
<div class="main">
    <def:datafieldcontrol runat="server" id="A1a5s" DatabaseField="A1a5s" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="300px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="200"></def:datafieldcontrol><br />
    1b. Any new additions to the household?
</div>
<div class="collection">
  <div class="main">
    <def:datafieldcontrol runat="server" id="A1b2" DatabaseField="A1b2" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="A1b3" DatabaseField="A1b3" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
  </div>
  <div class="key"><def:ValueSetLabel ID="ValueSetLabel_A1b2" runat="server"  DatabaseField="A1b2"></def:ValueSetLabel></div>
</div>
<div class="main">
    <def:datafieldcontrol runat="server" id="A1b3s" DatabaseField="A1b3s" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="300px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="200"></def:datafieldcontrol><br />
    <def:datafieldcontrol runat="server" id="A2" DatabaseField="A2" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol><br />
    3. Which parent(s)/guardian(s) does the child currently live with?  If child is living in more than one home, what percentage of time is spent in each home?<br />
</div>
<table class="main" border="1" cellpadding="5" cellspacing="0">
<tr>
    <td><def:ValueSetLabel ID="ValueSetLabel_A3H1M" runat="server"  DatabaseField="A3H1M"></def:ValueSetLabel></td>
    <td><strong>Biological Mother</strong></td>
    <td><strong>Biological Father</strong></td>
    <td><strong>Primary Guardian</strong></td>
    <td><strong>Percentage spent</strong></td>
</tr>
<tr>
    <td style="vertical-align:top"><strong>Home #1</strong></td>
    <td style="vertical-align:top"><def:datafieldcontrol runat="server" id="A3H1M" DatabaseField="A3H1M" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td style="vertical-align:top"><def:datafieldcontrol runat="server" id="A3H1F" DatabaseField="A3H1F" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td style="vertical-align:top"><def:datafieldcontrol runat="server" id="A3H1G" DatabaseField="A3H1G" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol><br />
        <def:datafieldcontrol runat="server" id="A3H1Gs" DatabaseField="A3H1Gs" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="50"></def:datafieldcontrol></td>
    <td style="vertical-align:top"><def:datafieldcontrol runat="server" id="A3H1P" DatabaseField="A3H1P" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="100" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
</tr>
<tr>
    <td style="vertical-align:top"><strong>Home #2</strong></td>
    <td style="vertical-align:top"><def:datafieldcontrol runat="server" id="A3H2M" DatabaseField="A3H2M" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td style="vertical-align:top"><def:datafieldcontrol runat="server" id="A3H2F" DatabaseField="A3H2F" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td style="vertical-align:top"><def:datafieldcontrol runat="server" id="A3H2G" DatabaseField="A3H2G" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol><br />
        <def:datafieldcontrol runat="server" id="A3H2Gs" DatabaseField="A3H2Gs" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="50"></def:datafieldcontrol></td>
    <td style="vertical-align:top"><def:datafieldcontrol runat="server" id="A3H2P" DatabaseField="A3H2P" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
</tr>
<tr>
    <td style="vertical-align:top"><strong>Home #3</strong></td>
    <td style="vertical-align:top"><def:datafieldcontrol runat="server" id="A3H3M" DatabaseField="A3H3M" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td style="vertical-align:top"><def:datafieldcontrol runat="server" id="A3H3F" DatabaseField="A3H3F" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td style="vertical-align:top"><def:datafieldcontrol runat="server" id="A3H3G" DatabaseField="A3H3G" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol><br />
        <def:datafieldcontrol runat="server" id="A3H3Gs" DatabaseField="A3H3Gs" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="50"></def:datafieldcontrol></td>
    <td style="vertical-align:top"><def:datafieldcontrol runat="server" id="A3H3P" DatabaseField="A3H3P" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
</tr>
</table>
<div class="main"><br /><br />4. Change in highest level of education:</div>
<div class="collection">
  <div class="main">
    <def:datafieldcontrol runat="server" id="A4M" DatabaseField="A4M" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="A4F" DatabaseField="A4F" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="A4G1" DatabaseField="A4G1" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="-9" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="A4G1s" DatabaseField="A4G1s" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="90px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="50"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="A4G2" DatabaseField="A4G2" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="-9" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="A4G2s" DatabaseField="A4G2s" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="90px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="50"></def:datafieldcontrol>
  </div>
  <div class="key"><def:ValueSetLabel ID="ValueSetLabel_A4M" runat="server"  DatabaseField="A4M"></def:ValueSetLabel></div>
</div>
<div class="main"><br />5. Change in occupation:</div>
<div class="collection">
  <div class="main">
    <def:datafieldcontrol runat="server" id="A5b" DatabaseField="A5b" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
  </div>
  <div class="key"><def:ValueSetLabel ID="ValueSetLabel_A5b" runat="server"  DatabaseField="A5b"></def:ValueSetLabel></div>
</div>
<div class="main"><def:datafieldcontrol runat="server" id="A5bs" DatabaseField="A5bs" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="300px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="100"></def:datafieldcontrol></div>
<div class="collection">
  <div class="main">
    <def:datafieldcontrol runat="server" id="A5c" DatabaseField="A5c" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
  </div>
  <div class="key"><def:ValueSetLabel ID="ValueSetLabel_A5c" runat="server"  DatabaseField="A5c"></def:ValueSetLabel></div>
</div>
<div class="main"><def:datafieldcontrol runat="server" id="A5cs" DatabaseField="A5cs" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="300px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="100"></def:datafieldcontrol></div>
<div class="collection">
  <div class="main">
    <def:datafieldcontrol runat="server" id="A5d" DatabaseField="A5d" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="-9" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
  </div>
  <div class="key"><def:ValueSetLabel ID="ValueSetLabel_A5d" runat="server"  DatabaseField="A5d"></def:ValueSetLabel></div>
</div>
<div class="main">
    <def:datafieldcontrol runat="server" id="A5ds" DatabaseField="A5ds" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="300px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="100"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="A5G1s" DatabaseField="A5G1s" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="300px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="50"></def:datafieldcontrol>
</div>
<div class="collection">
  <div class="main">
    <def:datafieldcontrol runat="server" id="A5e" DatabaseField="A5e" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="-9" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
  </div>
  <div class="key"><def:ValueSetLabel ID="ValueSetLabel_A5e" runat="server"  DatabaseField="A5e"></def:ValueSetLabel></div>
</div>
<div class="main">
    <def:datafieldcontrol runat="server" id="A5es" DatabaseField="A5es" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="300px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="100"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="A5G2s" DatabaseField="A5G2s" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="300px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="50"></def:datafieldcontrol><br />
    6. Change in family gross annual income:<br />
<div class="collection">
  <div class="main">
    <def:datafieldcontrol runat="server" id="A6" DatabaseField="A6" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
  </div>
  <div class="key"><def:ValueSetLabel ID="ValueSetLabel_A6" runat="server"  DatabaseField="A6"></def:ValueSetLabel></div>
</div>
<div class="main">
    <def:datafieldcontrol runat="server" id="A6s" DatabaseField="A6s" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px"></def:datafieldcontrol><br />
    7. GUID Info:<br />
</div>
<div class="collection">
  <div class="main">
    <def:datafieldcontrol runat="server" id="A7" DatabaseField="A7" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
  </div>
  <div class="key"><def:ValueSetLabel ID="ValueSetLabel_A7" runat="server"  DatabaseField="A7"></def:ValueSetLabel></div>
</div>
<div class="main"><em>Please update Household page as needed.</em><br /><br /></div>
<hr class="main">
<div class="main">B. MEDICAL HISTORY UPDATE<br /><br /></div>
<table class="main" border="1" cellpadding="5" cellspacing="0">
<tr>
    <td><def:ValueSetLabel ID="ValueSetLabel_BaCh" runat="server"  DatabaseField="BaCh"></def:ValueSetLabel></td>
    <td><strong>Child</strong></td>
    <td><strong>Father</strong></td>
    <td><strong>Mother</strong></td>
    <td><strong>Sibling 1</strong><br />
        <def:datafieldcontrol runat="server" id="BS1" DatabaseField="BS1" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxMaxLength="50"></def:datafieldcontrol></td>
    <td><strong>Sibling 2</strong><br />
        <def:datafieldcontrol runat="server" id="BS2" DatabaseField="BS2" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxMaxLength="50"></def:datafieldcontrol></td>
    <td><strong>Sibling 3</strong><br />
        <def:datafieldcontrol runat="server" id="BS3" DatabaseField="BS3" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxMaxLength="50"></def:datafieldcontrol></td>
</tr>
<tr>
    <td class="subhead" colspan="7">Social/Developmental</td>
</tr>
<tr>
    <td>a. Autism Spectrum Disorders</td>
    <td><def:datafieldcontrol runat="server" id="BaCh" DatabaseField="BaCh" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="1" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="BaFa" DatabaseField="BaFa" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="BaMo" DatabaseField="BaMo" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="BaS1" DatabaseField="BaS1" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="BaS2" DatabaseField="BaS2" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="BaS3" DatabaseField="BaS3" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
</tr>
<tr>
    <td>b. Motor Coordination Problems</td>
    <td><def:datafieldcontrol runat="server" id="BbCh" DatabaseField="BbCh" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="BbFa" DatabaseField="BbFa" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="BbMo" DatabaseField="BbMo" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="BbS1" DatabaseField="BbS1" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="BbS2" DatabaseField="BbS2" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="BbS3" DatabaseField="BbS3" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
</tr>
<tr>
    <td>c. Tics or Other Motor Problems</td>
    <td><def:datafieldcontrol runat="server" id="BcCh" DatabaseField="BcCh" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="BcFa" DatabaseField="BcFa" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="BcMo" DatabaseField="BcMo" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="BcS1" DatabaseField="BcS1" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="BcS2" DatabaseField="BcS2" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="BcS3" DatabaseField="BcS3" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
</tr>
<tr>
    <td>d. Learning Problems</td>
    <td><def:datafieldcontrol runat="server" id="BdCh" DatabaseField="BdCh" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="BdFa" DatabaseField="BdFa" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="BdMo" DatabaseField="BdMo" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="BdS1" DatabaseField="BdS1" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="BdS2" DatabaseField="BdS2" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="BdS3" DatabaseField="BdS3" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
</tr>
<tr>
    <td>e. Special Education</td>
    <td><def:datafieldcontrol runat="server" id="BeCh" DatabaseField="BeCh" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="BeFa" DatabaseField="BeFa" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="BeMo" DatabaseField="BeMo" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="BeS1" DatabaseField="BeS1" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="BeS2" DatabaseField="BeS2" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="BeS3" DatabaseField="BeS3" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
</tr>
<tr>
    <td class="subhead" colspan="7">Medical/Health</td>
</tr>
<tr>
    <td>f. Cancer</td>
    <td><def:datafieldcontrol runat="server" id="BfCh" DatabaseField="BfCh" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="BfFa" DatabaseField="BfFa" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="BfMo" DatabaseField="BfMo" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="BfS1" DatabaseField="BfS1" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="BfS2" DatabaseField="BfS2" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="BfS3" DatabaseField="BfS3" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
</tr>
<tr>
    <td>g. Vision Problems</td>
    <td><def:datafieldcontrol runat="server" id="BgCh" DatabaseField="BgCh" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="BgFa" DatabaseField="BgFa" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="BgMo" DatabaseField="BgMo" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="BgS1" DatabaseField="BgS1" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="BgS2" DatabaseField="BgS2" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="BgS3" DatabaseField="BgS3" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
</tr>
<tr>
    <td>h. Hearing Problems</td>
    <td><def:datafieldcontrol runat="server" id="BhCh" DatabaseField="BhCh" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="BhFa" DatabaseField="BhFa" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="BhMo" DatabaseField="BhMo" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="BhS1" DatabaseField="BhS1" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="BhS2" DatabaseField="BhS2" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="BhS3" DatabaseField="BhS3" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
</tr>
<tr>
    <td>i. Attention Problems</td>
    <td><def:datafieldcontrol runat="server" id="BiCh" DatabaseField="BiCh" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="BiFa" DatabaseField="BiFa" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="BiMo" DatabaseField="BiMo" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="BiS1" DatabaseField="BiS1" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="BiS2" DatabaseField="BiS2" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="BiS3" DatabaseField="BiS3" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
</tr>
<tr>
    <td>j. Hyperactivity</td>
    <td><def:datafieldcontrol runat="server" id="BjCh" DatabaseField="BjCh" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="BjFa" DatabaseField="BjFa" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="BjMo" DatabaseField="BjMo" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="BjS1" DatabaseField="BjS1" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="BjS2" DatabaseField="BjS2" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="BjS3" DatabaseField="BjS3" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
</tr>
<tr>
    <td>k. Neurological Diseases</td>
    <td><def:datafieldcontrol runat="server" id="BkCh" DatabaseField="BkCh" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="BkFa" DatabaseField="BkFa" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="BkMo" DatabaseField="BkMo" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="BkS1" DatabaseField="BkS1" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="BkS2" DatabaseField="BkS2" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="BkS3" DatabaseField="BkS3" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
</tr>
<tr>
    <td>l. Epilepsy/Seizures</td>
    <td><def:datafieldcontrol runat="server" id="BlCh" DatabaseField="BlCh" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="BlFa" DatabaseField="BlFa" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="BlMo" DatabaseField="BlMo" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="BlS1" DatabaseField="BlS1" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="BlS2" DatabaseField="BlS2" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="BlS3" DatabaseField="BlS3" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
</tr>
<tr>
    <td>m. Tuberous Sclerosis</td>
    <td><def:datafieldcontrol runat="server" id="BmCh" DatabaseField="BmCh" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="BmFa" DatabaseField="BmFa" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="BmMo" DatabaseField="BmMo" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="BmS1" DatabaseField="BmS1" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="BmS2" DatabaseField="BmS2" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="BmS3" DatabaseField="BmS3" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
</tr>
<tr>
    <td>n. Cerebral Palsy</td>
    <td><def:datafieldcontrol runat="server" id="BnCh" DatabaseField="BnCh" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="BnFa" DatabaseField="BnFa" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="BnMo" DatabaseField="BnMo" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="BnS1" DatabaseField="BnS1" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="BnS2" DatabaseField="BnS2" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="BnS3" DatabaseField="BnS3" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
</tr>
<tr>
    <td>o. Birth Defects</td>
    <td><def:datafieldcontrol runat="server" id="BoCh" DatabaseField="BoCh" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="BoFa" DatabaseField="BoFa" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="BoMo" DatabaseField="BoMo" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="BoS1" DatabaseField="BoS1" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="BoS2" DatabaseField="BoS2" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="BoS3" DatabaseField="BoS3" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
</tr>
<tr>
    <td>p. Major Physical Anomaly</td>
    <td><def:datafieldcontrol runat="server" id="BpCh" DatabaseField="BpCh" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="BpFa" DatabaseField="BpFa" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="BpMo" DatabaseField="BpMo" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="BpS1" DatabaseField="BpS1" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="BpS2" DatabaseField="BpS2" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="BpS3" DatabaseField="BpS3" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
</tr>
<tr>
    <td>q. Minor Physical Anomaly</td>
    <td><def:datafieldcontrol runat="server" id="BqCh" DatabaseField="BqCh" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="BqFa" DatabaseField="BqFa" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="BqMo" DatabaseField="BqMo" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="BqS1" DatabaseField="BqS1" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="BqS2" DatabaseField="BqS2" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="BqS3" DatabaseField="BqS3" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
</tr>
<tr>
    <td>r. Sleep Disorder</td>
    <td><def:datafieldcontrol runat="server" id="BrCh" DatabaseField="BrCh" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="BrFa" DatabaseField="BrFa" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="BrMo" DatabaseField="BrMo" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="BrS1" DatabaseField="BrS1" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="BrS2" DatabaseField="BrS2" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="BrS3" DatabaseField="BrS3" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
</tr>
<tr>
    <td class="subhead" colspan="7">Psychological/Psychiatric</td>
</tr>
<tr>
    <td>s. Tourette's Syndrome</td>
    <td><def:datafieldcontrol runat="server" id="BsCh" DatabaseField="BsCh" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="BsFa" DatabaseField="BsFa" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="BsMo" DatabaseField="BsMo" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="BsS1" DatabaseField="BsS1" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="BsS2" DatabaseField="BsS2" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="BsS3" DatabaseField="BsS3" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
</tr>
<tr>
    <td>t. Obsessive Compulsive Disorder</td>
    <td><def:datafieldcontrol runat="server" id="BtCh" DatabaseField="BtCh" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="BtFa" DatabaseField="BtFa" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="BtMo" DatabaseField="BtMo" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="BtS1" DatabaseField="BtS1" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="BtS2" DatabaseField="BtS2" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="BtS3" DatabaseField="BtS3" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
</tr>
<tr>
    <td>u. Drug Abuse</td>
    <td><def:datafieldcontrol runat="server" id="BuCh" DatabaseField="BuCh" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="BuFa" DatabaseField="BuFa" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="BuMo" DatabaseField="BuMo" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="BuS1" DatabaseField="BuS1" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="BuS2" DatabaseField="BuS2" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="BuS3" DatabaseField="BuS3" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
</tr>
<tr>
    <td>v. Alcoholism</td>
    <td><def:datafieldcontrol runat="server" id="BvCh" DatabaseField="BvCh" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="BvFa" DatabaseField="BvFa" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="BvMo" DatabaseField="BvMo" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="BvS1" DatabaseField="BvS1" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="BvS2" DatabaseField="BvS2" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="BvS3" DatabaseField="BvS3" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
</tr>
<tr>
    <td>w. Delinquency</td>
    <td><def:datafieldcontrol runat="server" id="BwCh" DatabaseField="BwCh" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="BwFa" DatabaseField="BwFa" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="BwMo" DatabaseField="BwMo" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="BwS1" DatabaseField="BwS1" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="BwS2" DatabaseField="BwS2" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="BwS3" DatabaseField="BwS3" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
</tr>
<tr>
    <td>x. Admitted for Psychiatric Illness</td>
    <td><def:datafieldcontrol runat="server" id="BxCh" DatabaseField="BxCh" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="BxFa" DatabaseField="BxFa" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="BxMo" DatabaseField="BxMo" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="BxS1" DatabaseField="BxS1" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="BxS2" DatabaseField="BxS2" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="BxS3" DatabaseField="BxS3" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
</tr>
<tr>
    <td>y. Other Mental Illness</td>
    <td><def:datafieldcontrol runat="server" id="ByCh" DatabaseField="ByCh" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="ByFa" DatabaseField="ByFa" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="ByMo" DatabaseField="ByMo" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="ByS1" DatabaseField="ByS1" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="ByS2" DatabaseField="ByS2" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="ByS3" DatabaseField="ByS3" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
</tr>
<tr>
    <td class="subhead" colspan="7">Other Medical Conditions (specify)</td>
</tr>
<tr>
    <td><def:datafieldcontrol runat="server" id="Bzs" DatabaseField="Bzs" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="20px" FieldTextBoxMaxLength="50"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="BzCh" DatabaseField="BzCh" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="-9" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="BzFa" DatabaseField="BzFa" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="-9" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="BzMo" DatabaseField="BzMo" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="-9" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="BzS1" DatabaseField="BzS1" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="-9" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="BzS2" DatabaseField="BzS2" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="-9" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="BzS3" DatabaseField="BzS3" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="-9" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
</tr>
<tr>
    <td><def:datafieldcontrol runat="server" id="Baas" DatabaseField="Baas" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="20px" FieldTextBoxMaxLength="50"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="BaaCh" DatabaseField="BaaCh" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="-9" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="BaaFa" DatabaseField="BaaFa" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="-9" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="BaaMo" DatabaseField="BaaMo" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="-9" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="BaaS1" DatabaseField="BaaS1" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="-9" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="BaaS2" DatabaseField="BaaS2" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="-9" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="BaaS3" DatabaseField="BaaS3" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="-9" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
</tr>
<tr>
    <td><def:datafieldcontrol runat="server" id="Babs" DatabaseField="Babs" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="20px" FieldTextBoxMaxLength="50"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="BabCh" DatabaseField="BabCh" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="-9" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="BabFa" DatabaseField="BabFa" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="-9" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="BabMo" DatabaseField="BabMo" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="-9" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="BabS1" DatabaseField="BabS1" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="-9" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="BabS2" DatabaseField="BabS2" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="-9" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="BabS3" DatabaseField="BabS3" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="-9" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
</tr>
<tr>
    <td><def:datafieldcontrol runat="server" id="Bacs" DatabaseField="Bacs" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="20px" FieldTextBoxMaxLength="50"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="BacCh" DatabaseField="BacCh" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="-9" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="BacFa" DatabaseField="BacFa" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="-9" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="BacMo" DatabaseField="BacMo" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="-9" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="BacS1" DatabaseField="BacS1" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="-9" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="BacS2" DatabaseField="BacS2" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="-9" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="BacS3" DatabaseField="BacS3" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="-9" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
</tr>
<tr>
    <td><def:datafieldcontrol runat="server" id="Bads" DatabaseField="Bads" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="20px" FieldTextBoxMaxLength="50"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="BadCh" DatabaseField="BadCh" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="-9" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="BadFa" DatabaseField="BadFa" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="-9" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="BadMo" DatabaseField="BadMo" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="-9" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="BadS1" DatabaseField="BadS1" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="-9" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="BadS2" DatabaseField="BadS2" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="-9" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="BadS3" DatabaseField="BadS3" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="-9" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
</tr>
<tr>
    <td><def:datafieldcontrol runat="server" id="Baes" DatabaseField="Baes" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="20px" FieldTextBoxMaxLength="50"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="BaeCh" DatabaseField="BaeCh" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="-9" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="BaeFa" DatabaseField="BaeFa" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="-9" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="BaeMo" DatabaseField="BaeMo" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="-9" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="BaeS1" DatabaseField="BaeS1" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="-9" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="BaeS2" DatabaseField="BaeS2" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="-9" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="BaeS3" DatabaseField="BaeS3" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="-9" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
</tr>
</table><br />
<hr class="main">
<div class="main">
    C. NEUROLOGICAL UPDATE<br />
    <em>Please complete Seizure Screening on separate data entry form.</em><br /><br />
    Has this child ever...
</div>
<div class="collection">
    <div class="main">
        <def:datafieldcontrol runat="server" id="Ca" DatabaseField="Ca" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
        <def:datafieldcontrol runat="server" id="Cb" DatabaseField="Cb" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
        <def:datafieldcontrol runat="server" id="Cc" DatabaseField="Cc" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    </div>
    <div class="key"><def:ValueSetLabel ID="ValueSetLabel_Ca" runat="server"  DatabaseField="Ca"></def:ValueSetLabel></div>
</div>        
<div class="main">
    <strong>IF YES</strong><br />
    At what age(s) did this child lose consciousness<br />
</div>
<table class="main" border="0" cellpadding="5" cellspacing="0">
<tr>
    <td>&nbsp;</td>
    <td><strong>Years</strong></td>
    <td><strong>OR</strong></td>
    <td><strong>Months</strong></td>
</tr>
<tr>
    <td>1.</td>
    <td><def:datafieldcontrol runat="server" id="Cc1y" DatabaseField="Cc1y" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td>&nbsp;</td>
    <td><def:datafieldcontrol runat="server" id="Cc1m" DatabaseField="Cc1m" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
</tr>
<tr>
    <td>2.</td>
    <td><def:datafieldcontrol runat="server" id="Cc2y" DatabaseField="Cc2y" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td>&nbsp;</td>
    <td><def:datafieldcontrol runat="server" id="Cc2m" DatabaseField="Cc2m" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
</tr>
<tr>
    <td>3.</td>
    <td><def:datafieldcontrol runat="server" id="Cc3y" DatabaseField="Cc3y" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td>&nbsp;</td>
    <td><def:datafieldcontrol runat="server" id="Cc3m" DatabaseField="Cc3m" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
</tr>
</table><br />
<hr class="main">
<div class="main">D. HEALTH ISSUES UPDATE</div>
<div class="collection">
    <div class="main"><def:datafieldcontrol runat="server" id="D1" DatabaseField="D1" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
    <div class="key"><def:ValueSetLabel ID="ValueSetLabel_D1" runat="server"  DatabaseField="D1"></def:ValueSetLabel></div>
</div>
<div class="main">
    <strong>IF YES</strong><br />
    <def:datafieldcontrol runat="server" id="D1a" DatabaseField="D1a" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="300px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="50"></def:datafieldcontrol>
</div>
<div class="collection">
    <div class="main"><def:datafieldcontrol runat="server" id="D1a1" DatabaseField="D1a1" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
    <div class="key"><def:ValueSetLabel ID="ValueSetLabel_D1a1" runat="server"  DatabaseField="D1a1"></def:ValueSetLabel></div>
</div>
<div class="main"><def:datafieldcontrol runat="server" id="D1b" DatabaseField="D1b" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="300px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="50"></def:datafieldcontrol></div>
<div class="collection">
    <div class="main"><def:datafieldcontrol runat="server" id="D1b1" DatabaseField="D1b1" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
    <div class="key"><def:ValueSetLabel ID="ValueSetLabel_D1b1" runat="server"  DatabaseField="D1b1"></def:ValueSetLabel></div>
</div>
<div class="main"><def:datafieldcontrol runat="server" id="D1c" DatabaseField="D1c" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="300px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="50"></def:datafieldcontrol></div>
<div class="collection">
    <div class="main"><def:datafieldcontrol runat="server" id="D1c1" DatabaseField="D1c1" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
    <div class="key"><def:ValueSetLabel ID="ValueSetLabel_D1c1" runat="server"  DatabaseField="D1c1"></def:ValueSetLabel></div>
</div>
<div class="collection">
    <div class="main"><def:datafieldcontrol runat="server" id="D2" DatabaseField="D2" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
    <div class="key"><def:ValueSetLabel ID="ValueSetLabel_D2" runat="server"  DatabaseField="D2"></def:ValueSetLabel></div>
</div>
<div class="main"><strong>If YES, specify below:</strong><br /></div>
<table class="main" border="0" cellpadding="5" cellspacing="0">
<tr>
    <td><strong>Illness</strong></td>
    <td><strong>Age</strong></td>
    <td><strong>Length of Illness</strong></td>
    <td><strong>High&nbsp;Fever&nbsp;or Unconscious&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</strong><br />
        <def:ValueSetLabel ID="ValueSetLabel_D2Ia4" runat="server"  DatabaseField="D2Ia4"></def:ValueSetLabel></td>
    <td><strong>Treatment and/or Aftereffects</strong></td>
</tr>
<tr>
    <td><def:datafieldcontrol runat="server" id="D2Ia1" DatabaseField="D2Ia1" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="100"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="D2Ia2" DatabaseField="D2Ia2" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="D2Ia3" DatabaseField="D2Ia3" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="100"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="D2Ia4" DatabaseField="D2Ia4" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="D2Ia5" DatabaseField="D2Ia5" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxWidth="400px" FieldTextBoxHeight="40px" FieldTextBoxTextMode="multiline" FieldTextBoxMaxLength="500"></def:datafieldcontrol></td>
</tr>
<tr>
    <td><def:datafieldcontrol runat="server" id="D2Ib1" DatabaseField="D2Ib1" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="100"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="D2Ib2" DatabaseField="D2Ib2" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="D2Ib3" DatabaseField="D2Ib3" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="100"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="D2Ib4" DatabaseField="D2Ib4" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="D2Ib5" DatabaseField="D2Ib5" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxWidth="400px" FieldTextBoxHeight="40px" FieldTextBoxTextMode="multiline" FieldTextBoxMaxLength="500"></def:datafieldcontrol></td>
</tr>
<tr>
    <td><def:datafieldcontrol runat="server" id="D2Ic1" DatabaseField="D2Ic1" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="100"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="D2Ic2" DatabaseField="D2Ic2" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="D2Ic3" DatabaseField="D2Ic3" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="100"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="D2Ic4" DatabaseField="D2Ic4" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="D2Ic5" DatabaseField="D2Ic5" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxWidth="400px" FieldTextBoxHeight="40px" FieldTextBoxTextMode="multiline" FieldTextBoxMaxLength="500"></def:datafieldcontrol></td>
</tr>
</table>

<table class="main" border="0" cellpadding="5" cellspacing="0">
<tr>
    <td><strong>Operations</strong></td>
    <td><strong>Age</strong></td>
    <td><strong>Length of Time in Hospital</strong></td>
    <td><strong>Aftereffects/How was child prepared?</strong></td>
</tr>
<tr>
    <td><def:datafieldcontrol runat="server" id="D2Oa1" DatabaseField="D2Oa1" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="100"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="D2Oa2" DatabaseField="D2Oa2" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="D2Oa3" DatabaseField="D2Oa3" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="100"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="D2Oa4" DatabaseField="D2Oa4" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxWidth="400px" FieldTextBoxHeight="40px" FieldTextBoxTextMode="multiline" FieldTextBoxMaxLength="500"></def:datafieldcontrol></td>
</tr>
<tr>
    <td><def:datafieldcontrol runat="server" id="D2Ob1" DatabaseField="D2Ob1" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="100"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="D2Ob2" DatabaseField="D2Ob2" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="D2Ob3" DatabaseField="D2Ob3" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="100"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="D2Ob4" DatabaseField="D2Ob4" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxWidth="400px" FieldTextBoxHeight="40px" FieldTextBoxTextMode="multiline" FieldTextBoxMaxLength="500"></def:datafieldcontrol></td>
</tr>
<tr>
    <td><def:datafieldcontrol runat="server" id="D2Oc1" DatabaseField="D2Oc1" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="100"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="D2Oc2" DatabaseField="D2Oc2" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="D2Oc3" DatabaseField="D2Oc3" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="100"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="D2Oc4" DatabaseField="D2Oc4" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxWidth="400px" FieldTextBoxHeight="40px" FieldTextBoxTextMode="multiline" FieldTextBoxMaxLength="500"></def:datafieldcontrol></td>
</tr>
</table>

<table class="main" border="0" cellpadding="5" cellspacing="0">
<tr>
    <td><strong>Other Hospitalizations</strong></td>
    <td><strong>Age</strong></td>
    <td><strong>Length of Time in Hospital</strong></td>
    <td><strong>Aftereffects</strong></td>
</tr>
<tr>
    <td><def:datafieldcontrol runat="server" id="D2Ha1" DatabaseField="D2Ha1" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="100"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="D2Ha2" DatabaseField="D2Ha2" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="D2Ha3" DatabaseField="D2Ha3" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="100"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="D2Ha4" DatabaseField="D2Ha4" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxWidth="400px" FieldTextBoxHeight="40px" FieldTextBoxTextMode="multiline" FieldTextBoxMaxLength="500"></def:datafieldcontrol></td>
</tr>
<tr>
    <td><def:datafieldcontrol runat="server" id="D2Hb1" DatabaseField="D2Hb1" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="100"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="D2Hb2" DatabaseField="D2Hb2" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="D2Hb3" DatabaseField="D2Hb3" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="100"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="D2Hb4" DatabaseField="D2Hb4" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxWidth="400px" FieldTextBoxHeight="40px" FieldTextBoxTextMode="multiline" FieldTextBoxMaxLength="500"></def:datafieldcontrol></td>
</tr>
<tr>
    <td><def:datafieldcontrol runat="server" id="D2Hc1" DatabaseField="D2Hc1" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="100"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="D2Hc2" DatabaseField="D2Hc2" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="D2Hc3" DatabaseField="D2Hc3" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="100"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="D2Hc4" DatabaseField="D2Hc4" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxWidth="400px" FieldTextBoxHeight="40px" FieldTextBoxTextMode="multiline" FieldTextBoxMaxLength="500"></def:datafieldcontrol></td>
</tr>
</table>
<div class="main">3. Medications to control depression, anxiety, hyperactivity, or any "psychiatric" medications:</div>
<div class="collection">
    <div class="main">
        <def:datafieldcontrol runat="server" id="D3c" DatabaseField="D3c" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="325px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
        <def:datafieldcontrol runat="server" id="D3p" DatabaseField="D3p" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="325px" FieldTextBoxWidth="40px"></def:datafieldcontrol><br />
    </div>
    <div class="key"><def:ValueSetLabel ID="ValueSetLabel_D3c" runat="server"  DatabaseField="D3c"></def:ValueSetLabel></div>
</div>
<table class="main" border="1" cellpadding="5" cellspacing="0">
<tr>
   <td rowspan="2"><strong>Name of Medicine</strong></td>
   <td rowspan="2"><strong>Generic Name</strong></td>
   <td rowspan="2"><strong>Medicine Class</strong></td>
   <td rowspan="2"><strong>Reason</strong></td>
   <td colspan="2"><strong>Date Started</strong></td>
   <td colspan="2"><strong>Date Finished</strong></td>
   <td rowspan="2"><strong>Currently Taking?<br /></strong>
        <def:ValueSetLabel ID="ValueSetLabel_D3aa7" runat="server"  DatabaseField="D3aa7"></def:ValueSetLabel></td>
   <td rowspan="2"><strong>Ever Taken?<br /></strong>
        <def:ValueSetLabel ID="ValueSetLabel_D3aa8" runat="server"  DatabaseField="D3aa8"></def:ValueSetLabel></td>
</tr>
<tr>
    <td>MM</td>
    <td>YYYY</td>
    <td>MM</td>
    <td>YYYY</td>
</tr>
<tr>
    <td class="subhead" colspan="10">Adrenergic</td>
</tr>
<tr>
    <td><def:datafieldcontrol runat="server" id="D3aa1" DatabaseField="D3aa1" IsEntryField="true" IsDoubleEntryField="false" FieldTextBoxTextDefault="Catapres" FieldLabelWidth="0px"  FieldTextBoxMaxLength="100"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="D3aa2" DatabaseField="D3aa2" IsEntryField="true" IsDoubleEntryField="false" FieldTextBoxTextDefault="Clonidine" FieldLabelWidth="0px"  FieldTextBoxMaxLength="100"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="D3aa3" DatabaseField="D3aa3" IsEntryField="true" IsDoubleEntryField="false" FieldTextBoxTextDefault="Adrenergic" FieldLabelWidth="0px"  FieldTextBoxMaxLength="100"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="D3aa4" DatabaseField="D3aa4" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px"  FieldTextBoxMaxLength="200"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="D3aa5m" DatabaseField="D3aa5m" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="D3aa5y" DatabaseField="D3aa5y" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="D3aa6m" DatabaseField="D3aa6m" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="D3aa6y" DatabaseField="D3aa6y" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="D3aa7" DatabaseField="D3aa7" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="D3aa8" DatabaseField="D3aa8" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
</tr>
<tr>
    <td><def:datafieldcontrol runat="server" id="D3ab1" DatabaseField="D3ab1" IsEntryField="true" IsDoubleEntryField="false" FieldTextBoxTextDefault="Tenex" FieldLabelWidth="0px"  FieldTextBoxMaxLength="100"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="D3ab2" DatabaseField="D3ab2" IsEntryField="true" IsDoubleEntryField="false" FieldTextBoxTextDefault="Guanfacine" FieldLabelWidth="0px"  FieldTextBoxMaxLength="100"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="D3ab3" DatabaseField="D3ab3" IsEntryField="true" IsDoubleEntryField="false" FieldTextBoxTextDefault="Adrenergic" FieldLabelWidth="0px"  FieldTextBoxMaxLength="100"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="D3ab4" DatabaseField="D3ab4" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px"  FieldTextBoxMaxLength="200"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="D3ab5m" DatabaseField="D3ab5m" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="D3ab5y" DatabaseField="D3ab5y" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="D3ab6m" DatabaseField="D3ab6m" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="D3ab6y" DatabaseField="D3ab6y" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="D3ab7" DatabaseField="D3ab7" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="D3ab8" DatabaseField="D3ab8" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
</tr>
<tr>
    <td class="subhead" colspan="10">Anti-Parkinsonian</td>
</tr>
<tr>
    <td><def:datafieldcontrol runat="server" id="D3ac1" DatabaseField="D3ac1" IsEntryField="true" IsDoubleEntryField="false" FieldTextBoxTextDefault="Symmetrel" FieldLabelWidth="0px"  FieldTextBoxMaxLength="100"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="D3ac2" DatabaseField="D3ac2" IsEntryField="true" IsDoubleEntryField="false" FieldTextBoxTextDefault="Amantadine" FieldLabelWidth="0px"  FieldTextBoxMaxLength="100"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="D3ac3" DatabaseField="D3ac3" IsEntryField="true" IsDoubleEntryField="false" FieldTextBoxTextDefault="Anti-Parkinsonian" FieldLabelWidth="0px"  FieldTextBoxMaxLength="100"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="D3ac4" DatabaseField="D3ac4" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px"  FieldTextBoxMaxLength="200"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="D3ac5m" DatabaseField="D3ac5m" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="D3ac5y" DatabaseField="D3ac5y" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="D3ac6m" DatabaseField="D3ac6m" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="D3ac6y" DatabaseField="D3ac6y" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="D3ac7" DatabaseField="D3ac7" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="D3ac8" DatabaseField="D3ac8" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
</tr>
<tr>
    <td class="subhead" colspan="10">Anticonvulsant</td>
</tr>
<tr>
    <td><def:datafieldcontrol runat="server" id="D3ad1" DatabaseField="D3ad1" IsEntryField="true" IsDoubleEntryField="false" FieldTextBoxTextDefault="Depakote" FieldLabelWidth="0px"  FieldTextBoxMaxLength="100"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="D3ad2" DatabaseField="D3ad2" IsEntryField="true" IsDoubleEntryField="false" FieldTextBoxTextDefault="Valproate" FieldLabelWidth="0px"  FieldTextBoxMaxLength="100"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="D3ad3" DatabaseField="D3ad3" IsEntryField="true" IsDoubleEntryField="false" FieldTextBoxTextDefault="Anticonvulsant" FieldLabelWidth="0px"  FieldTextBoxMaxLength="100"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="D3ad4" DatabaseField="D3ad4" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px"  FieldTextBoxMaxLength="200"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="D3ad5m" DatabaseField="D3ad5m" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="D3ad5y" DatabaseField="D3ad5y" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="D3ad6m" DatabaseField="D3ad6m" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="D3ad6y" DatabaseField="D3ad6y" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="D3ad7" DatabaseField="D3ad7" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="D3ad8" DatabaseField="D3ad8" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
</tr>
<tr>
    <td><def:datafieldcontrol runat="server" id="D3ae1" DatabaseField="D3ae1" IsEntryField="true" IsDoubleEntryField="false" FieldTextBoxTextDefault="Dilantin" FieldLabelWidth="0px"  FieldTextBoxMaxLength="100"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="D3ae2" DatabaseField="D3ae2" IsEntryField="true" IsDoubleEntryField="false" FieldTextBoxTextDefault="Dilantin" FieldLabelWidth="0px"  FieldTextBoxMaxLength="100"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="D3ae3" DatabaseField="D3ae3" IsEntryField="true" IsDoubleEntryField="false" FieldTextBoxTextDefault="Anticonvulsant" FieldLabelWidth="0px"  FieldTextBoxMaxLength="100"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="D3ae4" DatabaseField="D3ae4" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px"  FieldTextBoxMaxLength="200"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="D3ae5m" DatabaseField="D3ae5m" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="D3ae5y" DatabaseField="D3ae5y" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="D3ae6m" DatabaseField="D3ae6m" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="D3ae6y" DatabaseField="D3ae6y" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="D3ae7" DatabaseField="D3ae7" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="D3ae8" DatabaseField="D3ae8" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
</tr>
<tr>
    <td><def:datafieldcontrol runat="server" id="D3af1" DatabaseField="D3af1" IsEntryField="true" IsDoubleEntryField="false" FieldTextBoxTextDefault="Lamictal" FieldLabelWidth="0px"  FieldTextBoxMaxLength="100"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="D3af2" DatabaseField="D3af2" IsEntryField="true" IsDoubleEntryField="false" FieldTextBoxTextDefault="Lamotrigine" FieldLabelWidth="0px"  FieldTextBoxMaxLength="100"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="D3af3" DatabaseField="D3af3" IsEntryField="true" IsDoubleEntryField="false" FieldTextBoxTextDefault="Anticonvulsant" FieldLabelWidth="0px"  FieldTextBoxMaxLength="100"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="D3af4" DatabaseField="D3af4" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px"  FieldTextBoxMaxLength="200"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="D3af5m" DatabaseField="D3af5m" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="D3af5y" DatabaseField="D3af5y" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="D3af6m" DatabaseField="D3af6m" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="D3af6y" DatabaseField="D3af6y" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="D3af7" DatabaseField="D3af7" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="D3af8" DatabaseField="D3af8" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
</tr>
<tr>
    <td><def:datafieldcontrol runat="server" id="D3ag1" DatabaseField="D3ag1" IsEntryField="true" IsDoubleEntryField="false" FieldTextBoxTextDefault="Phenobarbital" FieldLabelWidth="0px"  FieldTextBoxMaxLength="100"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="D3ag2" DatabaseField="D3ag2" IsEntryField="true" IsDoubleEntryField="false" FieldTextBoxTextDefault="Phenobarbital" FieldLabelWidth="0px"  FieldTextBoxMaxLength="100"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="D3ag3" DatabaseField="D3ag3" IsEntryField="true" IsDoubleEntryField="false" FieldTextBoxTextDefault="Anticonvulsant" FieldLabelWidth="0px"  FieldTextBoxMaxLength="100"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="D3ag4" DatabaseField="D3ag4" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px"  FieldTextBoxMaxLength="200"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="D3ag5m" DatabaseField="D3ag5m" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="D3ag5y" DatabaseField="D3ag5y" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="D3ag6m" DatabaseField="D3ag6m" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="D3ag6y" DatabaseField="D3ag6y" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="D3ag7" DatabaseField="D3ag7" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="D3ag8" DatabaseField="D3ag8" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
</tr>
<tr>
    <td><def:datafieldcontrol runat="server" id="D3ah1" DatabaseField="D3ah1" IsEntryField="true" IsDoubleEntryField="false" FieldTextBoxTextDefault="Tegretol" FieldLabelWidth="0px"  FieldTextBoxMaxLength="100"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="D3ah2" DatabaseField="D3ah2" IsEntryField="true" IsDoubleEntryField="false" FieldTextBoxTextDefault="Carbamazepine" FieldLabelWidth="0px"  FieldTextBoxMaxLength="100"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="D3ah3" DatabaseField="D3ah3" IsEntryField="true" IsDoubleEntryField="false" FieldTextBoxTextDefault="Anticonvulsant" FieldLabelWidth="0px"  FieldTextBoxMaxLength="100"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="D3ah4" DatabaseField="D3ah4" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px"  FieldTextBoxMaxLength="200"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="D3ah5m" DatabaseField="D3ah5m" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="D3ah5y" DatabaseField="D3ah5y" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="D3ah6m" DatabaseField="D3ah6m" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="D3ah6y" DatabaseField="D3ah6y" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="D3ah7" DatabaseField="D3ah7" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="D3ah8" DatabaseField="D3ah8" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
</tr>
<tr>
    <td><def:datafieldcontrol runat="server" id="D3ai1" DatabaseField="D3ai1" IsEntryField="true" IsDoubleEntryField="false" FieldTextBoxTextDefault="Topamax" FieldLabelWidth="0px"  FieldTextBoxMaxLength="100"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="D3ai2" DatabaseField="D3ai2" IsEntryField="true" IsDoubleEntryField="false" FieldTextBoxTextDefault="Topiramate" FieldLabelWidth="0px"  FieldTextBoxMaxLength="100"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="D3ai3" DatabaseField="D3ai3" IsEntryField="true" IsDoubleEntryField="false" FieldTextBoxTextDefault="Anticonvulsant" FieldLabelWidth="0px"  FieldTextBoxMaxLength="100"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="D3ai4" DatabaseField="D3ai4" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px"  FieldTextBoxMaxLength="200"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="D3ai5m" DatabaseField="D3ai5m" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="D3ai5y" DatabaseField="D3ai5y" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="D3ai6m" DatabaseField="D3ai6m" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="D3ai6y" DatabaseField="D3ai6y" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="D3ai7" DatabaseField="D3ai7" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="D3ai8" DatabaseField="D3ai8" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
</tr>
<tr>
    <td><def:datafieldcontrol runat="server" id="D3aj1" DatabaseField="D3aj1" IsEntryField="true" IsDoubleEntryField="false" FieldTextBoxTextDefault="Trileptal" FieldLabelWidth="0px"  FieldTextBoxMaxLength="100"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="D3aj2" DatabaseField="D3aj2" IsEntryField="true" IsDoubleEntryField="false" FieldTextBoxTextDefault="Oxcarbazepine" FieldLabelWidth="0px"  FieldTextBoxMaxLength="100"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="D3aj3" DatabaseField="D3aj3" IsEntryField="true" IsDoubleEntryField="false" FieldTextBoxTextDefault="Anticonvulsant" FieldLabelWidth="0px"  FieldTextBoxMaxLength="100"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="D3aj4" DatabaseField="D3aj4" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px"  FieldTextBoxMaxLength="200"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="D3aj5m" DatabaseField="D3aj5m" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="D3aj5y" DatabaseField="D3aj5y" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="D3aj6m" DatabaseField="D3aj6m" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="D3aj6y" DatabaseField="D3aj6y" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="D3aj7" DatabaseField="D3aj7" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="D3aj8" DatabaseField="D3aj8" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
</tr>
<tr>
    <td><def:datafieldcontrol runat="server" id="D3ak1" DatabaseField="D3ak1" IsEntryField="true" IsDoubleEntryField="false" FieldTextBoxTextDefault="Zonegran" FieldLabelWidth="0px"  FieldTextBoxMaxLength="100"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="D3ak2" DatabaseField="D3ak2" IsEntryField="true" IsDoubleEntryField="false" FieldTextBoxTextDefault="Zonisamide" FieldLabelWidth="0px"  FieldTextBoxMaxLength="100"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="D3ak3" DatabaseField="D3ak3" IsEntryField="true" IsDoubleEntryField="false" FieldTextBoxTextDefault="Anticonvulsant" FieldLabelWidth="0px"  FieldTextBoxMaxLength="100"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="D3ak4" DatabaseField="D3ak4" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px"  FieldTextBoxMaxLength="200"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="D3ak5m" DatabaseField="D3ak5m" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="D3ak5y" DatabaseField="D3ak5y" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="D3ak6m" DatabaseField="D3ak6m" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="D3ak6y" DatabaseField="D3ak6y" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="D3ak7" DatabaseField="D3ak7" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="D3ak8" DatabaseField="D3ak8" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
</tr>
<tr>
    <td class="subhead" colspan="10">Antidepressant (SSRI)</td>
</tr>
<tr>
    <td><def:datafieldcontrol runat="server" id="D3al1" DatabaseField="D3al1" IsEntryField="true" IsDoubleEntryField="false" FieldTextBoxTextDefault="Celexa" FieldLabelWidth="0px"  FieldTextBoxMaxLength="100"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="D3al2" DatabaseField="D3al2" IsEntryField="true" IsDoubleEntryField="false" FieldTextBoxTextDefault="Citalopram" FieldLabelWidth="0px"  FieldTextBoxMaxLength="100"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="D3al3" DatabaseField="D3al3" IsEntryField="true" IsDoubleEntryField="false" FieldTextBoxTextDefault="Antidepressant (SSRI)" FieldLabelWidth="0px"  FieldTextBoxMaxLength="100"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="D3al4" DatabaseField="D3al4" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px"  FieldTextBoxMaxLength="200"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="D3al5m" DatabaseField="D3al5m" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="D3al5y" DatabaseField="D3al5y" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="D3al6m" DatabaseField="D3al6m" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="D3al6y" DatabaseField="D3al6y" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="D3al7" DatabaseField="D3al7" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="D3al8" DatabaseField="D3al8" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
</tr>
<tr>
    <td><def:datafieldcontrol runat="server" id="D3am1" DatabaseField="D3am1" IsEntryField="true" IsDoubleEntryField="false" FieldTextBoxTextDefault="Effexor" FieldLabelWidth="0px"  FieldTextBoxMaxLength="100"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="D3am2" DatabaseField="D3am2" IsEntryField="true" IsDoubleEntryField="false" FieldTextBoxTextDefault="Venlafaxine" FieldLabelWidth="0px"  FieldTextBoxMaxLength="100"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="D3am3" DatabaseField="D3am3" IsEntryField="true" IsDoubleEntryField="false" FieldTextBoxTextDefault="Antidepressant (SSRI)" FieldLabelWidth="0px"  FieldTextBoxMaxLength="100"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="D3am4" DatabaseField="D3am4" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px"  FieldTextBoxMaxLength="200"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="D3am5m" DatabaseField="D3am5m" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="D3am5y" DatabaseField="D3am5y" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="D3am6m" DatabaseField="D3am6m" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="D3am6y" DatabaseField="D3am6y" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="D3am7" DatabaseField="D3am7" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="D3am8" DatabaseField="D3am8" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
</tr>
<tr>
    <td><def:datafieldcontrol runat="server" id="D3an1" DatabaseField="D3an1" IsEntryField="true" IsDoubleEntryField="false" FieldTextBoxTextDefault="Lexapro" FieldLabelWidth="0px"  FieldTextBoxMaxLength="100"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="D3an2" DatabaseField="D3an2" IsEntryField="true" IsDoubleEntryField="false" FieldTextBoxTextDefault="Escitalopram" FieldLabelWidth="0px"  FieldTextBoxMaxLength="100"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="D3an3" DatabaseField="D3an3" IsEntryField="true" IsDoubleEntryField="false" FieldTextBoxTextDefault="Antidepressant (SSRI)" FieldLabelWidth="0px"  FieldTextBoxMaxLength="100"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="D3an4" DatabaseField="D3an4" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px"  FieldTextBoxMaxLength="200"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="D3an5m" DatabaseField="D3an5m" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="D3an5y" DatabaseField="D3an5y" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="D3an6m" DatabaseField="D3an6m" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="D3an6y" DatabaseField="D3an6y" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="D3an7" DatabaseField="D3an7" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="D3an8" DatabaseField="D3an8" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
</tr>
<tr>
    <td><def:datafieldcontrol runat="server" id="D3ao1" DatabaseField="D3ao1" IsEntryField="true" IsDoubleEntryField="false" FieldTextBoxTextDefault="Luvox" FieldLabelWidth="0px"  FieldTextBoxMaxLength="100"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="D3ao2" DatabaseField="D3ao2" IsEntryField="true" IsDoubleEntryField="false" FieldTextBoxTextDefault="Fluvoxamine" FieldLabelWidth="0px"  FieldTextBoxMaxLength="100"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="D3ao3" DatabaseField="D3ao3" IsEntryField="true" IsDoubleEntryField="false" FieldTextBoxTextDefault="Antidepressant (SSRI)" FieldLabelWidth="0px"  FieldTextBoxMaxLength="100"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="D3ao4" DatabaseField="D3ao4" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px"  FieldTextBoxMaxLength="200"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="D3ao5m" DatabaseField="D3ao5m" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="D3ao5y" DatabaseField="D3ao5y" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="D3ao6m" DatabaseField="D3ao6m" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="D3ao6y" DatabaseField="D3ao6y" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="D3ao7" DatabaseField="D3ao7" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="D3ao8" DatabaseField="D3ao8" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
</tr>
<tr>
    <td><def:datafieldcontrol runat="server" id="D3ap1" DatabaseField="D3ap1" IsEntryField="true" IsDoubleEntryField="false" FieldTextBoxTextDefault="Paxil" FieldLabelWidth="0px"  FieldTextBoxMaxLength="100"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="D3ap2" DatabaseField="D3ap2" IsEntryField="true" IsDoubleEntryField="false" FieldTextBoxTextDefault="Paroxetine" FieldLabelWidth="0px"  FieldTextBoxMaxLength="100"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="D3ap3" DatabaseField="D3ap3" IsEntryField="true" IsDoubleEntryField="false" FieldTextBoxTextDefault="Antidepressant (SSRI)" FieldLabelWidth="0px"  FieldTextBoxMaxLength="100"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="D3ap4" DatabaseField="D3ap4" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px"  FieldTextBoxMaxLength="200"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="D3ap5m" DatabaseField="D3ap5m" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="D3ap5y" DatabaseField="D3ap5y" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="D3ap6m" DatabaseField="D3ap6m" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="D3ap6y" DatabaseField="D3ap6y" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="D3ap7" DatabaseField="D3ap7" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="D3ap8" DatabaseField="D3ap8" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
</tr>
<tr>
    <td><def:datafieldcontrol runat="server" id="D3aq1" DatabaseField="D3aq1" IsEntryField="true" IsDoubleEntryField="false" FieldTextBoxTextDefault="Prozac" FieldLabelWidth="0px"  FieldTextBoxMaxLength="100"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="D3aq2" DatabaseField="D3aq2" IsEntryField="true" IsDoubleEntryField="false" FieldTextBoxTextDefault="Fluoxetine" FieldLabelWidth="0px"  FieldTextBoxMaxLength="100"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="D3aq3" DatabaseField="D3aq3" IsEntryField="true" IsDoubleEntryField="false" FieldTextBoxTextDefault="Antidepressant (SSRI)" FieldLabelWidth="0px"  FieldTextBoxMaxLength="100"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="D3aq4" DatabaseField="D3aq4" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px"  FieldTextBoxMaxLength="200"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="D3aq5m" DatabaseField="D3aq5m" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="D3aq5y" DatabaseField="D3aq5y" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="D3aq6m" DatabaseField="D3aq6m" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="D3aq6y" DatabaseField="D3aq6y" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="D3aq7" DatabaseField="D3aq7" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="D3aq8" DatabaseField="D3aq8" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
</tr>
<tr>
    <td><def:datafieldcontrol runat="server" id="D3ar1" DatabaseField="D3ar1" IsEntryField="true" IsDoubleEntryField="false" FieldTextBoxTextDefault="Zoloft" FieldLabelWidth="0px"  FieldTextBoxMaxLength="100"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="D3ar2" DatabaseField="D3ar2" IsEntryField="true" IsDoubleEntryField="false" FieldTextBoxTextDefault="Sertraline" FieldLabelWidth="0px"  FieldTextBoxMaxLength="100"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="D3ar3" DatabaseField="D3ar3" IsEntryField="true" IsDoubleEntryField="false" FieldTextBoxTextDefault="Antidepressant (SSRI)" FieldLabelWidth="0px"  FieldTextBoxMaxLength="100"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="D3ar4" DatabaseField="D3ar4" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px"  FieldTextBoxMaxLength="200"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="D3ar5m" DatabaseField="D3ar5m" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="D3ar5y" DatabaseField="D3ar5y" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="D3ar6m" DatabaseField="D3ar6m" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="D3ar6y" DatabaseField="D3ar6y" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="D3ar7" DatabaseField="D3ar7" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="D3ar8" DatabaseField="D3ar8" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
</tr>
<tr>
    <td class="subhead" colspan="10">Antidepressant (Tricyclic)</td>
</tr>
<tr>
    <td><def:datafieldcontrol runat="server" id="D3as1" DatabaseField="D3as1" IsEntryField="true" IsDoubleEntryField="false" FieldTextBoxTextDefault="Imipramine" FieldLabelWidth="0px"  FieldTextBoxMaxLength="100"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="D3as2" DatabaseField="D3as2" IsEntryField="true" IsDoubleEntryField="false" FieldTextBoxTextDefault="Imipramine" FieldLabelWidth="0px"  FieldTextBoxMaxLength="100"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="D3as3" DatabaseField="D3as3" IsEntryField="true" IsDoubleEntryField="false" FieldTextBoxTextDefault="Antidepressant (Tricyclic)" FieldLabelWidth="0px"  FieldTextBoxMaxLength="100"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="D3as4" DatabaseField="D3as4" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px"  FieldTextBoxMaxLength="200"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="D3as5m" DatabaseField="D3as5m" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="D3as5y" DatabaseField="D3as5y" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="D3as6m" DatabaseField="D3as6m" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="D3as6y" DatabaseField="D3as6y" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="D3as7" DatabaseField="D3as7" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="D3as8" DatabaseField="D3as8" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
</tr>
<tr>
    <td class="subhead" colspan="10">Antidepressant (Other)</td>
</tr>
<tr>
    <td><def:datafieldcontrol runat="server" id="D3at1" DatabaseField="D3at1" IsEntryField="true" IsDoubleEntryField="false" FieldTextBoxTextDefault="Desyrel" FieldLabelWidth="0px"  FieldTextBoxMaxLength="100"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="D3at2" DatabaseField="D3at2" IsEntryField="true" IsDoubleEntryField="false" FieldTextBoxTextDefault="Trazodone" FieldLabelWidth="0px"  FieldTextBoxMaxLength="100"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="D3at3" DatabaseField="D3at3" IsEntryField="true" IsDoubleEntryField="false" FieldTextBoxTextDefault="Antidepressant (Other)" FieldLabelWidth="0px"  FieldTextBoxMaxLength="100"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="D3at4" DatabaseField="D3at4" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px"  FieldTextBoxMaxLength="200"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="D3at5m" DatabaseField="D3at5m" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="D3at5y" DatabaseField="D3at5y" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="D3at6m" DatabaseField="D3at6m" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="D3at6y" DatabaseField="D3at6y" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="D3at7" DatabaseField="D3at7" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="D3at8" DatabaseField="D3at8" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
</tr>
<tr>
   <td rowspan="2"><strong>Name of Medicine</strong></td>
   <td rowspan="2"><strong>Generic Name</strong></td>
   <td rowspan="2"><strong>Medicine Class</strong></td>
   <td rowspan="2"><strong>Reason</strong></td>
   <td colspan="2"><strong>Date Started</strong></td>
   <td colspan="2"><strong>Date Finished</strong></td>
   <td rowspan="2"><strong>Currently Taking?<br /></strong>
        <def:ValueSetLabel ID="ValueSetLabel_D3au7" runat="server"  DatabaseField="D3au7"></def:ValueSetLabel></td>
   <td rowspan="2"><strong>Ever Taken?<br /></strong>
        <def:ValueSetLabel ID="ValueSetLabel_D3au8" runat="server"  DatabaseField="D3au8"></def:ValueSetLabel></td>
</tr>
<tr>
    <td>MM</td>
    <td>YYYY</td>
    <td>MM</td>
    <td>YYYY</td>
</tr>
<tr>
    <td class="subhead" colspan="10">Antipsychotic</td>
</tr>
<tr>
    <td><def:datafieldcontrol runat="server" id="D3au1" DatabaseField="D3au1" IsEntryField="true" IsDoubleEntryField="false" FieldTextBoxTextDefault="Abilify" FieldLabelWidth="0px"  FieldTextBoxMaxLength="100"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="D3au2" DatabaseField="D3au2" IsEntryField="true" IsDoubleEntryField="false" FieldTextBoxTextDefault="Aripiprazole" FieldLabelWidth="0px"  FieldTextBoxMaxLength="100"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="D3au3" DatabaseField="D3au3" IsEntryField="true" IsDoubleEntryField="false" FieldTextBoxTextDefault="Antipsychotic" FieldLabelWidth="0px"  FieldTextBoxMaxLength="100"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="D3au4" DatabaseField="D3au4" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px"  FieldTextBoxMaxLength="200"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="D3au5m" DatabaseField="D3au5m" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="D3au5y" DatabaseField="D3au5y" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="D3au6m" DatabaseField="D3au6m" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="D3au6y" DatabaseField="D3au6y" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="D3au7" DatabaseField="D3au7" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="D3au8" DatabaseField="D3au8" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
</tr>
<tr>
    <td><def:datafieldcontrol runat="server" id="D3av1" DatabaseField="D3av1" IsEntryField="true" IsDoubleEntryField="false" FieldTextBoxTextDefault="Geodon" FieldLabelWidth="0px"  FieldTextBoxMaxLength="100"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="D3av2" DatabaseField="D3av2" IsEntryField="true" IsDoubleEntryField="false" FieldTextBoxTextDefault="Ziprasidone" FieldLabelWidth="0px"  FieldTextBoxMaxLength="100"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="D3av3" DatabaseField="D3av3" IsEntryField="true" IsDoubleEntryField="false" FieldTextBoxTextDefault="Antipsychotic" FieldLabelWidth="0px"  FieldTextBoxMaxLength="100"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="D3av4" DatabaseField="D3av4" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px"  FieldTextBoxMaxLength="200"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="D3av5m" DatabaseField="D3av5m" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="D3av5y" DatabaseField="D3av5y" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="D3av6m" DatabaseField="D3av6m" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="D3av6y" DatabaseField="D3av6y" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="D3av7" DatabaseField="D3av7" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="D3av8" DatabaseField="D3av8" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
</tr>
<tr>
    <td><def:datafieldcontrol runat="server" id="D3aw1" DatabaseField="D3aw1" IsEntryField="true" IsDoubleEntryField="false" FieldTextBoxTextDefault="Risperdal" FieldLabelWidth="0px"  FieldTextBoxMaxLength="100"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="D3aw2" DatabaseField="D3aw2" IsEntryField="true" IsDoubleEntryField="false" FieldTextBoxTextDefault="Risperidone" FieldLabelWidth="0px"  FieldTextBoxMaxLength="100"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="D3aw3" DatabaseField="D3aw3" IsEntryField="true" IsDoubleEntryField="false" FieldTextBoxTextDefault="Antipsychotic" FieldLabelWidth="0px"  FieldTextBoxMaxLength="100"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="D3aw4" DatabaseField="D3aw4" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px"  FieldTextBoxMaxLength="200"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="D3aw5m" DatabaseField="D3aw5m" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="D3aw5y" DatabaseField="D3aw5y" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="D3aw6m" DatabaseField="D3aw6m" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="D3aw6y" DatabaseField="D3aw6y" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="D3aw7" DatabaseField="D3aw7" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="D3aw8" DatabaseField="D3aw8" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
</tr>
<tr>
    <td><def:datafieldcontrol runat="server" id="D3ax1" DatabaseField="D3ax1" IsEntryField="true" IsDoubleEntryField="false" FieldTextBoxTextDefault="Seroquel" FieldLabelWidth="0px"  FieldTextBoxMaxLength="100"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="D3ax2" DatabaseField="D3ax2" IsEntryField="true" IsDoubleEntryField="false" FieldTextBoxTextDefault="" FieldLabelWidth="0px"  FieldTextBoxMaxLength="100"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="D3ax3" DatabaseField="D3ax3" IsEntryField="true" IsDoubleEntryField="false" FieldTextBoxTextDefault="Antipsychotic" FieldLabelWidth="0px"  FieldTextBoxMaxLength="100"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="D3ax4" DatabaseField="D3ax4" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px"  FieldTextBoxMaxLength="200"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="D3ax5m" DatabaseField="D3ax5m" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="D3ax5y" DatabaseField="D3ax5y" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="D3ax6m" DatabaseField="D3ax6m" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="D3ax6y" DatabaseField="D3ax6y" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="D3ax7" DatabaseField="D3ax7" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="D3ax8" DatabaseField="D3ax8" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
</tr>
<tr>
    <td><def:datafieldcontrol runat="server" id="D3ay1" DatabaseField="D3ay1" IsEntryField="true" IsDoubleEntryField="false" FieldTextBoxTextDefault="Zyprexa" FieldLabelWidth="0px"  FieldTextBoxMaxLength="100"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="D3ay2" DatabaseField="D3ay2" IsEntryField="true" IsDoubleEntryField="false" FieldTextBoxTextDefault="Olanzapine" FieldLabelWidth="0px"  FieldTextBoxMaxLength="100"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="D3ay3" DatabaseField="D3ay3" IsEntryField="true" IsDoubleEntryField="false" FieldTextBoxTextDefault="Antipsychotic" FieldLabelWidth="0px"  FieldTextBoxMaxLength="100"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="D3ay4" DatabaseField="D3ay4" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px"  FieldTextBoxMaxLength="200"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="D3ay5m" DatabaseField="D3ay5m" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="D3ay5y" DatabaseField="D3ay5y" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="D3ay6m" DatabaseField="D3ay6m" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="D3ay6y" DatabaseField="D3ay6y" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="D3ay7" DatabaseField="D3ay7" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="D3ay8" DatabaseField="D3ay8" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
</tr>
<tr>
    <td><def:datafieldcontrol runat="server" id="D3az1" DatabaseField="D3az1" IsEntryField="true" IsDoubleEntryField="false" FieldTextBoxTextDefault="Mellaril" FieldLabelWidth="0px"  FieldTextBoxMaxLength="100"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="D3az2" DatabaseField="D3az2" IsEntryField="true" IsDoubleEntryField="false" FieldTextBoxTextDefault="Thioridazine" FieldLabelWidth="0px"  FieldTextBoxMaxLength="100"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="D3az3" DatabaseField="D3az3" IsEntryField="true" IsDoubleEntryField="false" FieldTextBoxTextDefault="Antipsychotic" FieldLabelWidth="0px"  FieldTextBoxMaxLength="100"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="D3az4" DatabaseField="D3az4" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px"  FieldTextBoxMaxLength="200"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="D3az5m" DatabaseField="D3az5m" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="D3az5y" DatabaseField="D3az5y" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="D3az6m" DatabaseField="D3az6m" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="D3az6y" DatabaseField="D3az6y" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="D3az7" DatabaseField="D3az7" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="D3az8" DatabaseField="D3az8" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
</tr>
<tr>
    <td class="subhead" colspan="10">Benzodiazepine Anxiolytics</td>
</tr>
<tr>
    <td><def:datafieldcontrol runat="server" id="D3ba1" DatabaseField="D3ba1" IsEntryField="true" IsDoubleEntryField="false" FieldTextBoxTextDefault="Valium" FieldLabelWidth="0px"  FieldTextBoxMaxLength="100"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="D3ba2" DatabaseField="D3ba2" IsEntryField="true" IsDoubleEntryField="false" FieldTextBoxTextDefault="Diazepam" FieldLabelWidth="0px"  FieldTextBoxMaxLength="100"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="D3ba3" DatabaseField="D3ba3" IsEntryField="true" IsDoubleEntryField="false" FieldTextBoxTextDefault="Benzodiazepine Anxiolytics" FieldLabelWidth="0px"  FieldTextBoxMaxLength="100"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="D3ba4" DatabaseField="D3ba4" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px"  FieldTextBoxMaxLength="200"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="D3ba5m" DatabaseField="D3ba5m" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="D3ba5y" DatabaseField="D3ba5y" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="D3ba6m" DatabaseField="D3ba6m" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="D3ba6y" DatabaseField="D3ba6y" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="D3ba7" DatabaseField="D3ba7" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="D3ba8" DatabaseField="D3ba8" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
</tr>
<tr>
    <td><def:datafieldcontrol runat="server" id="D3bb1" DatabaseField="D3bb1" IsEntryField="true" IsDoubleEntryField="false" FieldTextBoxTextDefault="Xanax" FieldLabelWidth="0px"  FieldTextBoxMaxLength="100"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="D3bb2" DatabaseField="D3bb2" IsEntryField="true" IsDoubleEntryField="false" FieldTextBoxTextDefault="Alprazolam" FieldLabelWidth="0px"  FieldTextBoxMaxLength="100"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="D3bb3" DatabaseField="D3bb3" IsEntryField="true" IsDoubleEntryField="false" FieldTextBoxTextDefault="Benzodiazepine Anxiolytics" FieldLabelWidth="0px"  FieldTextBoxMaxLength="100"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="D3bb4" DatabaseField="D3bb4" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px"  FieldTextBoxMaxLength="200"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="D3bb5m" DatabaseField="D3bb5m" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="D3bb5y" DatabaseField="D3bb5y" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="D3bb6m" DatabaseField="D3bb6m" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="D3bb6y" DatabaseField="D3bb6y" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="D3bb7" DatabaseField="D3bb7" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="D3bb8" DatabaseField="D3bb8" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
</tr>
<tr>
    <td class="subhead" colspan="10">Other Anxiolytic</td>
</tr>
<tr>
    <td><def:datafieldcontrol runat="server" id="D3bc1" DatabaseField="D3bc1" IsEntryField="true" IsDoubleEntryField="false" FieldTextBoxTextDefault="Buspar" FieldLabelWidth="0px"  FieldTextBoxMaxLength="100"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="D3bc2" DatabaseField="D3bc2" IsEntryField="true" IsDoubleEntryField="false" FieldTextBoxTextDefault="Buspirone" FieldLabelWidth="0px"  FieldTextBoxMaxLength="100"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="D3bc3" DatabaseField="D3bc3" IsEntryField="true" IsDoubleEntryField="false" FieldTextBoxTextDefault="Other Anxiolytic" FieldLabelWidth="0px"  FieldTextBoxMaxLength="100"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="D3bc4" DatabaseField="D3bc4" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px"  FieldTextBoxMaxLength="200"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="D3bc5m" DatabaseField="D3bc5m" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="D3bc5y" DatabaseField="D3bc5y" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="D3bc6m" DatabaseField="D3bc6m" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="D3bc6y" DatabaseField="D3bc6y" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="D3bc7" DatabaseField="D3bc7" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="D3bc8" DatabaseField="D3bc8" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
</tr>
<tr>
    <td class="subhead" colspan="10">Melatonin</td>
</tr>
<tr>
    <td><def:datafieldcontrol runat="server" id="D3bd1" DatabaseField="D3bd1" IsEntryField="true" IsDoubleEntryField="false" FieldTextBoxTextDefault="Melatonin" FieldLabelWidth="0px"  FieldTextBoxMaxLength="100"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="D3bd2" DatabaseField="D3bd2" IsEntryField="true" IsDoubleEntryField="false" FieldTextBoxTextDefault="Melatonin" FieldLabelWidth="0px"  FieldTextBoxMaxLength="100"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="D3bd3" DatabaseField="D3bd3" IsEntryField="true" IsDoubleEntryField="false" FieldTextBoxTextDefault="Melatonin" FieldLabelWidth="0px"  FieldTextBoxMaxLength="100"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="D3bd4" DatabaseField="D3bd4" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px"  FieldTextBoxMaxLength="200"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="D3bd5m" DatabaseField="D3bd5m" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="D3bd5y" DatabaseField="D3bd5y" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="D3bd6m" DatabaseField="D3bd6m" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="D3bd6y" DatabaseField="D3bd6y" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="D3bd7" DatabaseField="D3bd7" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="D3bd8" DatabaseField="D3bd8" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
</tr>
<tr>
    <td class="subhead" colspan="10">Norepinephrine Re-Uptake Inhibitor</td>
</tr>
<tr>
    <td><def:datafieldcontrol runat="server" id="D3be1" DatabaseField="D3be1" IsEntryField="true" IsDoubleEntryField="false" FieldTextBoxTextDefault="Strattera" FieldLabelWidth="0px"  FieldTextBoxMaxLength="100"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="D3be2" DatabaseField="D3be2" IsEntryField="true" IsDoubleEntryField="false" FieldTextBoxTextDefault="Atomoxetine" FieldLabelWidth="0px"  FieldTextBoxMaxLength="100"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="D3be3" DatabaseField="D3be3" IsEntryField="true" IsDoubleEntryField="false" FieldTextBoxTextDefault="Norepinephrine Re-Uptake Inhibitor" FieldLabelWidth="0px"  FieldTextBoxMaxLength="100"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="D3be4" DatabaseField="D3be4" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px"  FieldTextBoxMaxLength="200"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="D3be5m" DatabaseField="D3be5m" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="D3be5y" DatabaseField="D3be5y" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="D3be6m" DatabaseField="D3be6m" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="D3be6y" DatabaseField="D3be6y" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="D3be7" DatabaseField="D3be7" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="D3be8" DatabaseField="D3be8" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
</tr>
<tr>
    <td class="subhead" colspan="10">Other Psychotropic</td>
</tr>
<tr>
    <td><def:datafieldcontrol runat="server" id="D3bf1" DatabaseField="D3bf1" IsEntryField="true" IsDoubleEntryField="false" FieldTextBoxTextDefault="Cyproheptadine" FieldLabelWidth="0px"  FieldTextBoxMaxLength="100"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="D3bf2" DatabaseField="D3bf2" IsEntryField="true" IsDoubleEntryField="false" FieldTextBoxTextDefault="Cyproheptadin" FieldLabelWidth="0px"  FieldTextBoxMaxLength="100"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="D3bf3" DatabaseField="D3bf3" IsEntryField="true" IsDoubleEntryField="false" FieldTextBoxTextDefault="Other Psychotropic" FieldLabelWidth="0px"  FieldTextBoxMaxLength="100"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="D3bf4" DatabaseField="D3bf4" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px"  FieldTextBoxMaxLength="200"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="D3bf5m" DatabaseField="D3bf5m" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="D3bf5y" DatabaseField="D3bf5y" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="D3bf6m" DatabaseField="D3bf6m" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="D3bf6y" DatabaseField="D3bf6y" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="D3bf7" DatabaseField="D3bf7" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="D3bf8" DatabaseField="D3bf8" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
</tr>
<tr>
    <td class="subhead" colspan="10">Stimulant</td>
</tr>
<tr>
    <td><def:datafieldcontrol runat="server" id="D3bg1" DatabaseField="D3bg1" IsEntryField="true" IsDoubleEntryField="false" FieldTextBoxTextDefault="Adderall" FieldLabelWidth="0px"  FieldTextBoxMaxLength="100"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="D3bg2" DatabaseField="D3bg2" IsEntryField="true" IsDoubleEntryField="false" FieldTextBoxTextDefault="Amphetamine" FieldLabelWidth="0px"  FieldTextBoxMaxLength="100"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="D3bg3" DatabaseField="D3bg3" IsEntryField="true" IsDoubleEntryField="false" FieldTextBoxTextDefault="Stimulant" FieldLabelWidth="0px"  FieldTextBoxMaxLength="100"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="D3bg4" DatabaseField="D3bg4" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px"  FieldTextBoxMaxLength="200"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="D3bg5m" DatabaseField="D3bg5m" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="D3bg5y" DatabaseField="D3bg5y" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="D3bg6m" DatabaseField="D3bg6m" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="D3bg6y" DatabaseField="D3bg6y" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="D3bg7" DatabaseField="D3bg7" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="D3bg8" DatabaseField="D3bg8" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
</tr>
<tr>
    <td><def:datafieldcontrol runat="server" id="D3bh1" DatabaseField="D3bh1" IsEntryField="true" IsDoubleEntryField="false" FieldTextBoxTextDefault="Focalin" FieldLabelWidth="0px"  FieldTextBoxMaxLength="100"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="D3bh2" DatabaseField="D3bh2" IsEntryField="true" IsDoubleEntryField="false" FieldTextBoxTextDefault="Dexmethylphenidate" FieldLabelWidth="0px"  FieldTextBoxMaxLength="100"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="D3bh3" DatabaseField="D3bh3" IsEntryField="true" IsDoubleEntryField="false" FieldTextBoxTextDefault="Stimulant" FieldLabelWidth="0px"  FieldTextBoxMaxLength="100"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="D3bh4" DatabaseField="D3bh4" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px"  FieldTextBoxMaxLength="200"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="D3bh5m" DatabaseField="D3bh5m" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="D3bh5y" DatabaseField="D3bh5y" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="D3bh6m" DatabaseField="D3bh6m" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="D3bh6y" DatabaseField="D3bh6y" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="D3bh7" DatabaseField="D3bh7" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="D3bh8" DatabaseField="D3bh8" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
</tr>
<tr>
    <td><def:datafieldcontrol runat="server" id="D3bi1" DatabaseField="D3bi1" IsEntryField="true" IsDoubleEntryField="false" FieldTextBoxTextDefault="Ritalin" FieldLabelWidth="0px"  FieldTextBoxMaxLength="100"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="D3bi2" DatabaseField="D3bi2" IsEntryField="true" IsDoubleEntryField="false" FieldTextBoxTextDefault="Methylphenidate" FieldLabelWidth="0px"  FieldTextBoxMaxLength="100"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="D3bi3" DatabaseField="D3bi3" IsEntryField="true" IsDoubleEntryField="false" FieldTextBoxTextDefault="Stimulant" FieldLabelWidth="0px"  FieldTextBoxMaxLength="100"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="D3bi4" DatabaseField="D3bi4" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px"  FieldTextBoxMaxLength="200"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="D3bi5m" DatabaseField="D3bi5m" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="D3bi5y" DatabaseField="D3bi5y" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="D3bi6m" DatabaseField="D3bi6m" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="D3bi6y" DatabaseField="D3bi6y" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="D3bi7" DatabaseField="D3bi7" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="D3bi8" DatabaseField="D3bi8" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
</tr>
<tr>
    <td class="subhead" colspan="10">Other Psychotropic not on list (specify)</td>
</tr>
<tr>
    <td><def:datafieldcontrol runat="server" id="D3ca1" DatabaseField="D3ca1" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px"  FieldTextBoxMaxLength="100"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="D3ca2" DatabaseField="D3ca2" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px"  FieldTextBoxMaxLength="100"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="D3ca3" DatabaseField="D3ca3" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px"  FieldTextBoxMaxLength="100"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="D3ca4" DatabaseField="D3ca4" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px"  FieldTextBoxMaxLength="200"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="D3ca5m" DatabaseField="D3ca5m" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="D3ca5y" DatabaseField="D3ca5y" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="D3ca6m" DatabaseField="D3ca6m" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="D3ca6y" DatabaseField="D3ca6y" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="D3ca7" DatabaseField="D3ca7" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="D3ca8" DatabaseField="D3ca8" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
</tr>
<tr>
    <td><def:datafieldcontrol runat="server" id="D3cb1" DatabaseField="D3cb1" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px"  FieldTextBoxMaxLength="100"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="D3cb2" DatabaseField="D3cb2" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px"  FieldTextBoxMaxLength="100"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="D3cb3" DatabaseField="D3cb3" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px"  FieldTextBoxMaxLength="100"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="D3cb4" DatabaseField="D3cb4" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px"  FieldTextBoxMaxLength="200"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="D3cb5m" DatabaseField="D3cb5m" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="D3cb5y" DatabaseField="D3cb5y" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="D3cb6m" DatabaseField="D3cb6m" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="D3cb6y" DatabaseField="D3cb6y" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="D3cb7" DatabaseField="D3cb7" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="D3cb8" DatabaseField="D3cb8" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
</tr>
<tr>
    <td><def:datafieldcontrol runat="server" id="D3cc1" DatabaseField="D3cc1" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px"  FieldTextBoxMaxLength="100"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="D3cc2" DatabaseField="D3cc2" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px"  FieldTextBoxMaxLength="100"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="D3cc3" DatabaseField="D3cc3" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px"  FieldTextBoxMaxLength="100"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="D3cc4" DatabaseField="D3cc4" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px"  FieldTextBoxMaxLength="200"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="D3cc5m" DatabaseField="D3cc5m" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="D3cc5y" DatabaseField="D3cc5y" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="D3cc6m" DatabaseField="D3cc6m" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="D3cc6y" DatabaseField="D3cc6y" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="D3cc7" DatabaseField="D3cc7" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="D3cc8" DatabaseField="D3cc8" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
</tr>
</table>
<div class="collection">
    <div class="main"><br /><br />4. Medications other than those for behavior, emotion, or seizure:</div>
</div>
<div class="collection">
    <div class="main">
        <def:datafieldcontrol runat="server" id="D4c" DatabaseField="D4c" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="325px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
        <def:datafieldcontrol runat="server" id="D4p" DatabaseField="D4p" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="325px" FieldTextBoxWidth="40px"></def:datafieldcontrol><br />
    </div>
    <div class="key"><def:ValueSetLabel ID="ValueSetLabel_D4c" runat="server"  DatabaseField="D4c"></def:ValueSetLabel></div>
</div>
<table class="main" border="1" cellpadding="5" cellspacing="0">
<tr>
   <td rowspan="2"><strong>Name of Medicine</strong></td>
   <td rowspan="2"><strong>Generic Name</strong></td>
   <td rowspan="2"><strong>Medicine Class</strong></td>
   <td rowspan="2"><strong>Reason</strong></td>
   <td colspan="2"><strong>Date Started</strong></td>
   <td colspan="2"><strong>Date Finished</strong></td>
   <td rowspan="2"><strong>Currently Taking?<br /></strong>
        <def:ValueSetLabel ID="ValueSetLabel_D4a7" runat="server"  DatabaseField="D4a7"></def:ValueSetLabel></td>
   <td rowspan="2"><strong>Ever Taken?<br /></strong>
        <def:ValueSetLabel ID="ValueSetLabel_D4a8" runat="server"  DatabaseField="D4a8"></def:ValueSetLabel></td>
</tr>
<tr>
    <td>MM</td>
    <td>YYYY</td>
    <td>MM</td>
    <td>YYYY</td>
</tr>
<tr>
    <td><def:datafieldcontrol runat="server" id="D4a1" DatabaseField="D4a1" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px"  FieldTextBoxMaxLength="100"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="D4a2" DatabaseField="D4a2" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px"  FieldTextBoxMaxLength="100"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="D4a3" DatabaseField="D4a3" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px"  FieldTextBoxMaxLength="100"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="D4a4" DatabaseField="D4a4" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px"  FieldTextBoxMaxLength="200"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="D4a5m" DatabaseField="D4a5m" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="D4a5y" DatabaseField="D4a5y" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="D4a6m" DatabaseField="D4a6m" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="D4a6y" DatabaseField="D4a6y" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="D4a7" DatabaseField="D4a7" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="D4a8" DatabaseField="D4a8" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
</tr>
<tr>
    <td><def:datafieldcontrol runat="server" id="D4b1" DatabaseField="D4b1" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px"  FieldTextBoxMaxLength="100"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="D4b2" DatabaseField="D4b2" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px"  FieldTextBoxMaxLength="100"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="D4b3" DatabaseField="D4b3" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px"  FieldTextBoxMaxLength="100"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="D4b4" DatabaseField="D4b4" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px"  FieldTextBoxMaxLength="200"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="D4b5m" DatabaseField="D4b5m" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="D4b5y" DatabaseField="D4b5y" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="D4b6m" DatabaseField="D4b6m" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="D4b6y" DatabaseField="D4b6y" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="D4b7" DatabaseField="D4b7" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="D4b8" DatabaseField="D4b8" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
</tr>
<tr>
    <td><def:datafieldcontrol runat="server" id="D4c1" DatabaseField="D4c1" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px"  FieldTextBoxMaxLength="100"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="D4c2" DatabaseField="D4c2" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px"  FieldTextBoxMaxLength="100"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="D4c3" DatabaseField="D4c3" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px"  FieldTextBoxMaxLength="100"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="D4c4" DatabaseField="D4c4" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px"  FieldTextBoxMaxLength="200"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="D4c5m" DatabaseField="D4c5m" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="D4c5y" DatabaseField="D4c5y" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="D4c6m" DatabaseField="D4c6m" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="D4c6y" DatabaseField="D4c6y" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="D4c7" DatabaseField="D4c7" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="D4c8" DatabaseField="D4c8" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
</tr>
<tr>
    <td><def:datafieldcontrol runat="server" id="D4d1" DatabaseField="D4d1" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px"  FieldTextBoxMaxLength="100"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="D4d2" DatabaseField="D4d2" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px"  FieldTextBoxMaxLength="100"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="D4d3" DatabaseField="D4d3" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px"  FieldTextBoxMaxLength="100"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="D4d4" DatabaseField="D4d4" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px"  FieldTextBoxMaxLength="200"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="D4d5m" DatabaseField="D4d5m" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="D4d5y" DatabaseField="D4d5y" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="D4d6m" DatabaseField="D4d6m" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="D4d6y" DatabaseField="D4d6y" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="D4d7" DatabaseField="D4d7" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="D4d8" DatabaseField="D4d8" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
</tr>
<tr>
    <td><def:datafieldcontrol runat="server" id="D4e1" DatabaseField="D4e1" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px"  FieldTextBoxMaxLength="100"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="D4e2" DatabaseField="D4e2" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px"  FieldTextBoxMaxLength="100"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="D4e3" DatabaseField="D4e3" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px"  FieldTextBoxMaxLength="100"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="D4e4" DatabaseField="D4e4" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px"  FieldTextBoxMaxLength="200"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="D4e5m" DatabaseField="D4e5m" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="D4e5y" DatabaseField="D4e5y" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="D4e6m" DatabaseField="D4e6m" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="D4e6y" DatabaseField="D4e6y" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="D4e7" DatabaseField="D4e7" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="D4e8" DatabaseField="D4e8" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
</tr>
<tr>
    <td><def:datafieldcontrol runat="server" id="D4f1" DatabaseField="D4f1" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px"  FieldTextBoxMaxLength="100"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="D4f2" DatabaseField="D4f2" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px"  FieldTextBoxMaxLength="100"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="D4f3" DatabaseField="D4f3" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px"  FieldTextBoxMaxLength="100"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="D4f4" DatabaseField="D4f4" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px"  FieldTextBoxMaxLength="200"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="D4f5m" DatabaseField="D4f5m" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="D4f5y" DatabaseField="D4f5y" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="D4f6m" DatabaseField="D4f6m" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="D4f6y" DatabaseField="D4f6y" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="D4f7" DatabaseField="D4f7" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="D4f8" DatabaseField="D4f8" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
</tr>
</table>
<div class="main">
    <br />
    <def:datafieldcontrol runat="server" id="Notes" DatabaseField="Notes" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="50px" FieldTextBoxWidth="400px" FieldTextBoxHeight="40px" FieldTextBoxTextMode="multiline" FieldTextBoxMaxLength="500"></def:datafieldcontrol>
</div>
</asp:Panel>
<div class="main">
    <br /><br />
    <def:datafieldcontrol runat="server" id="created" DatabaseField="created" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="300px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="createdBy" DatabaseField="createdBy" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="300px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="50"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="updated" DatabaseField="updated" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="300px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="updatedBy" DatabaseField="updatedBy" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="300px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="50"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="scored" DatabaseField="scored" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="300px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="scoredBy" DatabaseField="scoredBy" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="300px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="50"></def:datafieldcontrol>
</div>
</asp:Content>
