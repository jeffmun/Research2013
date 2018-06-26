<%@ Register TagPrefix="def" Namespace="DataEntryFramework3" %> 
<%@ Page language="c#" MasterPageFile="~/UWAC.master"  Title="Medical History Data Entry" %>
<asp:Content ID="Content1" ContentPlaceHolderID="oBodyPlaceHolder" runat="server">

<def:dataentrycontroller id="DataEntryController1" runat="server" DatabaseTable="ALL_MedPsychHx" >
</def:dataentrycontroller>
<div class="main">
  <def:datafieldcontrol runat="server" id="id" DatabaseField="id" IsInsertField="true" FieldLabelWidth="200px" FieldTextBoxMaxLength="15"></def:datafieldcontrol>
  <def:datafieldcontrol runat="server" id="indexnum" DatabaseField="indexnum" IsInsertField="true" FieldTextBoxTextDefault="1" FieldLabelWidth="200px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
</div>
<div class="main">
  <def:datafieldcontrol runat="server" id="hxdate" DatabaseField="hxdate" FieldLabelText="Date Completed" IsInsertField="true" FieldLabelWidth="200px"></def:datafieldcontrol>
  <def:datafieldcontrol runat="server" id="hxrater" DatabaseField="hxrater" FieldLabelText="Clinician" IsInsertField="true" FieldLabelWidth="200px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="100"></def:datafieldcontrol>
</div>
<div class="collection">
  <div class="main">
    <def:datafieldcontrol runat="server" id="hxphone" DatabaseField="hxphone" FieldLabelText="Conducted by phone" IsInsertField="true" FieldLabelWidth="200px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="hxinper" DatabaseField="hxinper" FieldLabelText="Conducted in person" IsInsertField="true" FieldLabelWidth="200px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
   </div>
  <div class="key"><def:ValueSetLabel ID="ValueSetLabel_hxphone" runat="server"  DatabaseField="hxphone"></def:ValueSetLabel></div>
</div> 
<div class="collection">
  <div class="main">
    <def:datafieldcontrol runat="server" id="hxsourc" DatabaseField="hxsourc" FieldLabelText="Primary source" IsInsertField="true" FieldLabelWidth="200px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="hxsousp" DatabaseField="hxsousp" FieldLabelText="Specify source" IsInsertField="true" FieldLabelWidth="200px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="100"></def:datafieldcontrol>
   </div>
  <div class="key"><def:ValueSetLabel ID="ValueSetLabel_hxsourc" runat="server"  DatabaseField="hxsourc"></def:ValueSetLabel></div>
</div> 
<asp:panel id="mainPanel" CssClass="mainPanel" runat="server">
<table class="legend" border="0" cellpadding="5" cellspacing="0">
  <tr>
    <td width="180">Subject or Relative Has Disorder:</td>
    <td width="75">
      0=No<br />
      1=Yes<br />
      2=Not Sure
    </td>
    <td width="140">Family member entries:</td>
    <td width="50">
      0=No<br />
      1=Yes
    </td>
    <td width="80">All questions:</td>
    <td width="135">
      -1=Missing Value<br />
      -7=Do Not Know<br />
      -8=Refused to Answer<br />
      -9=Does Not Apply
    </td>
  </tr>
</table>
<table class="main" border="1" cellpadding="5" cellspacing="0">
  <tr>
    <td rowspan="2">3. Medical History</td>
    <td>Subject or Relative Has Disorder<br />
    <td>Subject</td>
    <td colspan="2">Parents</td>
    <td>Siblings</td>
    <td colspan="2">Half Siblings</td>
    <td colspan="2">First Cousins</td>
    <td colspan="2">Aunts & Uncles</td>
    <td colspan="2">Grandparents</td>
    <td>Other (Specify)</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>Mom</td>
    <td>Dad</td>
    <td>&nbsp;</td>
    <td>Mat.</td>
    <td>Pat.</td>
    <td>Mat.</td>
    <td>Pat.</td>
    <td>Mat.</td>
    <td>Pat.</td>
    <td>Mat.</td>
    <td>Pat.</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td>a. Autism Spectrum Disorder</td>
    <td><def:datafieldcontrol runat="server" id="hx3ahas" DatabaseField="hx3ahas" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="0px" FieldTextBoxWidth="30px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="hx3achld" DatabaseField="hx3achld" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="30px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="hx3amom" DatabaseField="hx3amom" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="30px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="hx3adad" DatabaseField="hx3adad" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="30px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="hx3asib" DatabaseField="hx3asib" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="30px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="hx3asibm" DatabaseField="hx3asibm" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="30px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="hx3asibp" DatabaseField="hx3asibp" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="30px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="hx3acoum" DatabaseField="hx3acoum" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="30px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="hx3acoup" DatabaseField="hx3acoup" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="30px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="hx3aaum" DatabaseField="hx3aaum" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="30px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="hx3aaup" DatabaseField="hx3aaup" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="30px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="hx3agpm" DatabaseField="hx3agpm" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="30px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="hx3agpp" DatabaseField="hx3agpp" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="30px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="hx3aotr" DatabaseField="hx3aotr" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxMaxLength="100"></def:datafieldcontrol></td>
  </tr>
  <tr>
    <td>b. Fragile X</td>
    <td><def:datafieldcontrol runat="server" id="hx3bhas" DatabaseField="hx3bhas" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="0px" FieldTextBoxWidth="30px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="hx3bchld" DatabaseField="hx3bchld" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="30px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="hx3bmom" DatabaseField="hx3bmom" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="30px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="hx3bdad" DatabaseField="hx3bdad" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="30px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="hx3bsib" DatabaseField="hx3bsib" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="30px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="hx3bsibm" DatabaseField="hx3bsibm" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="30px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="hx3bsibp" DatabaseField="hx3bsibp" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="30px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="hx3bcoum" DatabaseField="hx3bcoum" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="30px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="hx3bcoup" DatabaseField="hx3bcoup" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="30px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="hx3baum" DatabaseField="hx3baum" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="30px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="hx3baup" DatabaseField="hx3baup" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="30px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="hx3bgpm" DatabaseField="hx3bgpm" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="30px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="hx3bgpp" DatabaseField="hx3bgpp" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="30px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="hx3botr" DatabaseField="hx3botr" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxMaxLength="100"></def:datafieldcontrol></td>
  </tr>
  <tr>
    <td>c. Tuberous Sclerosis</td>
    <td><def:datafieldcontrol runat="server" id="hx3chas" DatabaseField="hx3chas" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="0px" FieldTextBoxWidth="30px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="hx3cchld" DatabaseField="hx3cchld" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="30px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="hx3cmom" DatabaseField="hx3cmom" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="30px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="hx3cdad" DatabaseField="hx3cdad" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="30px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="hx3csib" DatabaseField="hx3csib" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="30px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="hx3csibm" DatabaseField="hx3csibm" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="30px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="hx3csibp" DatabaseField="hx3csibp" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="30px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="hx3ccoum" DatabaseField="hx3ccoum" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="30px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="hx3ccoup" DatabaseField="hx3ccoup" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="30px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="hx3caum" DatabaseField="hx3caum" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="30px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="hx3caup" DatabaseField="hx3caup" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="30px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="hx3cgpm" DatabaseField="hx3cgpm" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="30px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="hx3cgpp" DatabaseField="hx3cgpp" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="30px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="hx3cotr" DatabaseField="hx3cotr" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxMaxLength="100"></def:datafieldcontrol></td>
  </tr>
  <tr>
    <td>d. Neurofibromatosis</td>
    <td><def:datafieldcontrol runat="server" id="hx3dhas" DatabaseField="hx3dhas" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="0px" FieldTextBoxWidth="30px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="hx3dchld" DatabaseField="hx3dchld" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="30px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="hx3dmom" DatabaseField="hx3dmom" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="30px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="hx3ddad" DatabaseField="hx3ddad" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="30px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="hx3dsib" DatabaseField="hx3dsib" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="30px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="hx3dsibm" DatabaseField="hx3dsibm" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="30px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="hx3dsibp" DatabaseField="hx3dsibp" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="30px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="hx3dcoum" DatabaseField="hx3dcoum" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="30px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="hx3dcoup" DatabaseField="hx3dcoup" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="30px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="hx3daum" DatabaseField="hx3daum" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="30px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="hx3daup" DatabaseField="hx3daup" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="30px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="hx3dgpm" DatabaseField="hx3dgpm" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="30px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="hx3dgpp" DatabaseField="hx3dgpp" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="30px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="hx3dotr" DatabaseField="hx3dotr" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxMaxLength="100"></def:datafieldcontrol></td>
  </tr>
  <tr>
    <td>e. Rett Syndrome</td>
    <td><def:datafieldcontrol runat="server" id="hx3ehas" DatabaseField="hx3ehas" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="0px" FieldTextBoxWidth="30px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="hx3echld" DatabaseField="hx3echld" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="30px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="hx3emom" DatabaseField="hx3emom" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="30px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="hx3edad" DatabaseField="hx3edad" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="30px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="hx3esib" DatabaseField="hx3esib" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="30px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="hx3esibm" DatabaseField="hx3esibm" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="30px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="hx3esibp" DatabaseField="hx3esibp" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="30px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="hx3ecoum" DatabaseField="hx3ecoum" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="30px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="hx3ecoup" DatabaseField="hx3ecoup" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="30px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="hx3eaum" DatabaseField="hx3eaum" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="30px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="hx3eaup" DatabaseField="hx3eaup" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="30px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="hx3egpm" DatabaseField="hx3egpm" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="30px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="hx3egpp" DatabaseField="hx3egpp" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="30px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="hx3eotr" DatabaseField="hx3eotr" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxMaxLength="100"></def:datafieldcontrol></td>
  </tr>
  <tr>
    <td>f. Childhood Disintegration Disorder</td>
    <td><def:datafieldcontrol runat="server" id="hx3fhas" DatabaseField="hx3fhas" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="0px" FieldTextBoxWidth="30px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="hx3fchld" DatabaseField="hx3fchld" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="30px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="hx3fmom" DatabaseField="hx3fmom" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="30px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="hx3fdad" DatabaseField="hx3fdad" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="30px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="hx3fsib" DatabaseField="hx3fsib" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="30px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="hx3fsibm" DatabaseField="hx3fsibm" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="30px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="hx3fsibp" DatabaseField="hx3fsibp" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="30px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="hx3fcoum" DatabaseField="hx3fcoum" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="30px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="hx3fcoup" DatabaseField="hx3fcoup" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="30px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="hx3faum" DatabaseField="hx3faum" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="30px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="hx3faup" DatabaseField="hx3faup" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="30px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="hx3fgpm" DatabaseField="hx3fgpm" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="30px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="hx3fgpp" DatabaseField="hx3fgpp" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="30px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="hx3fotr" DatabaseField="hx3fotr" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxMaxLength="100"></def:datafieldcontrol></td>
  </tr>
  <tr>
    <td>g. Prader Willi Syndrome</td>
    <td><def:datafieldcontrol runat="server" id="hx3ghas" DatabaseField="hx3ghas" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="0px" FieldTextBoxWidth="30px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="hx3gchld" DatabaseField="hx3gchld" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="30px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="hx3gmom" DatabaseField="hx3gmom" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="30px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="hx3gdad" DatabaseField="hx3gdad" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="30px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="hx3gsib" DatabaseField="hx3gsib" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="30px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="hx3gsibm" DatabaseField="hx3gsibm" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="30px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="hx3gsibp" DatabaseField="hx3gsibp" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="30px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="hx3gcoum" DatabaseField="hx3gcoum" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="30px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="hx3gcoup" DatabaseField="hx3gcoup" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="30px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="hx3gaum" DatabaseField="hx3gaum" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="30px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="hx3gaup" DatabaseField="hx3gaup" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="30px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="hx3ggpm" DatabaseField="hx3ggpm" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="30px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="hx3ggpp" DatabaseField="hx3ggpp" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="30px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="hx3gotr" DatabaseField="hx3gotr" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxMaxLength="100"></def:datafieldcontrol></td>
  </tr>
  <tr>
    <td>h. Angelman Syndrome</td>
    <td><def:datafieldcontrol runat="server" id="hx3hhas" DatabaseField="hx3hhas" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="0px" FieldTextBoxWidth="30px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="hx3hchld" DatabaseField="hx3hchld" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="30px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="hx3hmom" DatabaseField="hx3hmom" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="30px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="hx3hdad" DatabaseField="hx3hdad" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="30px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="hx3hsib" DatabaseField="hx3hsib" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="30px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="hx3hsibm" DatabaseField="hx3hsibm" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="30px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="hx3hsibp" DatabaseField="hx3hsibp" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="30px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="hx3hcoum" DatabaseField="hx3hcoum" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="30px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="hx3hcoup" DatabaseField="hx3hcoup" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="30px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="hx3haum" DatabaseField="hx3haum" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="30px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="hx3haup" DatabaseField="hx3haup" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="30px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="hx3hgpm" DatabaseField="hx3hgpm" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="30px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="hx3hgpp" DatabaseField="hx3hgpp" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="30px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="hx3hotr" DatabaseField="hx3hotr" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxMaxLength="100"></def:datafieldcontrol></td>
  </tr>
  <tr>
    <td>i. Other chromosomal<br />
      <def:datafieldcontrol runat="server" id="hx3is" DatabaseField="hx3is" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxMaxLength="100"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="hx3ihas" DatabaseField="hx3ihas" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="0px" FieldTextBoxWidth="30px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="hx3ichld" DatabaseField="hx3ichld" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="30px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="hx3imom" DatabaseField="hx3imom" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="30px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="hx3idad" DatabaseField="hx3idad" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="30px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="hx3isib" DatabaseField="hx3isib" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="30px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="hx3isibm" DatabaseField="hx3isibm" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="30px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="hx3isibp" DatabaseField="hx3isibp" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="30px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="hx3icoum" DatabaseField="hx3icoum" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="30px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="hx3icoup" DatabaseField="hx3icoup" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="30px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="hx3iaum" DatabaseField="hx3iaum" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="30px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="hx3iaup" DatabaseField="hx3iaup" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="30px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="hx3igpm" DatabaseField="hx3igpm" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="30px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="hx3igpp" DatabaseField="hx3igpp" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="30px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="hx3iotr" DatabaseField="hx3iotr" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxMaxLength="100"></def:datafieldcontrol></td>
  </tr>
  <tr>
    <td>j. Congenital rubella</td>
    <td><def:datafieldcontrol runat="server" id="hx3jhas" DatabaseField="hx3jhas" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="0px" FieldTextBoxWidth="30px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="hx3jchld" DatabaseField="hx3jchld" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="30px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="hx3jmom" DatabaseField="hx3jmom" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="30px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="hx3jdad" DatabaseField="hx3jdad" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="30px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="hx3jsib" DatabaseField="hx3jsib" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="30px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="hx3jsibm" DatabaseField="hx3jsibm" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="30px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="hx3jsibp" DatabaseField="hx3jsibp" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="30px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="hx3jcoum" DatabaseField="hx3jcoum" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="30px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="hx3jcoup" DatabaseField="hx3jcoup" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="30px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="hx3jaum" DatabaseField="hx3jaum" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="30px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="hx3jaup" DatabaseField="hx3jaup" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="30px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="hx3jgpm" DatabaseField="hx3jgpm" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="30px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="hx3jgpp" DatabaseField="hx3jgpp" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="30px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="hx3jotr" DatabaseField="hx3jotr" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxMaxLength="100"></def:datafieldcontrol></td>
  </tr>
  <tr>
    <td>k. PKU</td>
    <td><def:datafieldcontrol runat="server" id="hx3khas" DatabaseField="hx3khas" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="0px" FieldTextBoxWidth="30px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="hx3kchld" DatabaseField="hx3kchld" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="30px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="hx3kmom" DatabaseField="hx3kmom" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="30px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="hx3kdad" DatabaseField="hx3kdad" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="30px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="hx3ksib" DatabaseField="hx3ksib" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="30px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="hx3ksibm" DatabaseField="hx3ksibm" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="30px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="hx3ksibp" DatabaseField="hx3ksibp" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="30px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="hx3kcoum" DatabaseField="hx3kcoum" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="30px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="hx3kcoup" DatabaseField="hx3kcoup" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="30px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="hx3kaum" DatabaseField="hx3kaum" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="30px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="hx3kaup" DatabaseField="hx3kaup" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="30px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="hx3kgpm" DatabaseField="hx3kgpm" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="30px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="hx3kgpp" DatabaseField="hx3kgpp" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="30px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="hx3kotr" DatabaseField="hx3kotr" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxMaxLength="100"></def:datafieldcontrol></td>
  </tr>
  <tr>
    <td>l. Hydrocephalus</td>
    <td><def:datafieldcontrol runat="server" id="hx3lhas" DatabaseField="hx3lhas" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="0px" FieldTextBoxWidth="30px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="hx3lchld" DatabaseField="hx3lchld" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="30px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="hx3lmom" DatabaseField="hx3lmom" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="30px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="hx3ldad" DatabaseField="hx3ldad" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="30px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="hx3lsib" DatabaseField="hx3lsib" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="30px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="hx3lsibm" DatabaseField="hx3lsibm" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="30px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="hx3lsibp" DatabaseField="hx3lsibp" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="30px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="hx3lcoum" DatabaseField="hx3lcoum" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="30px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="hx3lcoup" DatabaseField="hx3lcoup" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="30px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="hx3laum" DatabaseField="hx3laum" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="30px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="hx3laup" DatabaseField="hx3laup" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="30px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="hx3lgpm" DatabaseField="hx3lgpm" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="30px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="hx3lgpp" DatabaseField="hx3lgpp" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="30px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="hx3lotr" DatabaseField="hx3lotr" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxMaxLength="100"></def:datafieldcontrol></td>
  </tr>
  <tr>
    <td rowspan="2">&nbsp;</td>
    <td>Subject or Relative Has Disorder<br />
    <td>Subject</td>
    <td colspan="2">Parents</td>
    <td>Siblings</td>
    <td colspan="2">Half Siblings</td>
    <td colspan="2">First Cousins</td>
    <td colspan="2">Aunts & Uncles</td>
    <td colspan="2">Grandparents</td>
    <td>Other (Specify)</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>Mom</td>
    <td>Dad</td>
    <td>&nbsp;</td>
    <td>Mat.</td>
    <td>Pat.</td>
    <td>Mat.</td>
    <td>Pat.</td>
    <td>Mat.</td>
    <td>Pat.</td>
    <td>Mat.</td>
    <td>Pat.</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td>m. Cerebral Palsy</td>
    <td><def:datafieldcontrol runat="server" id="hx3mhas" DatabaseField="hx3mhas" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="0px" FieldTextBoxWidth="30px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="hx3mchld" DatabaseField="hx3mchld" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="30px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="hx3mmom" DatabaseField="hx3mmom" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="30px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="hx3mdad" DatabaseField="hx3mdad" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="30px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="hx3msib" DatabaseField="hx3msib" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="30px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="hx3msibm" DatabaseField="hx3msibm" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="30px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="hx3msibp" DatabaseField="hx3msibp" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="30px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="hx3mcoum" DatabaseField="hx3mcoum" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="30px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="hx3mcoup" DatabaseField="hx3mcoup" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="30px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="hx3maum" DatabaseField="hx3maum" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="30px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="hx3maup" DatabaseField="hx3maup" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="30px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="hx3mgpm" DatabaseField="hx3mgpm" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="30px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="hx3mgpp" DatabaseField="hx3mgpp" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="30px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="hx3motr" DatabaseField="hx3motr" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxMaxLength="100"></def:datafieldcontrol></td>
  </tr>
  <tr>
    <td>n. Mental retardation</td>
    <td><def:datafieldcontrol runat="server" id="hx3nhas" DatabaseField="hx3nhas" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="0px" FieldTextBoxWidth="30px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="hx3nchld" DatabaseField="hx3nchld" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="30px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="hx3nmom" DatabaseField="hx3nmom" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="30px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="hx3ndad" DatabaseField="hx3ndad" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="30px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="hx3nsib" DatabaseField="hx3nsib" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="30px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="hx3nsibm" DatabaseField="hx3nsibm" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="30px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="hx3nsibp" DatabaseField="hx3nsibp" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="30px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="hx3ncoum" DatabaseField="hx3ncoum" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="30px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="hx3ncoup" DatabaseField="hx3ncoup" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="30px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="hx3naum" DatabaseField="hx3naum" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="30px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="hx3naup" DatabaseField="hx3naup" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="30px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="hx3ngpm" DatabaseField="hx3ngpm" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="30px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="hx3ngpp" DatabaseField="hx3ngpp" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="30px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="hx3notr" DatabaseField="hx3notr" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxMaxLength="100"></def:datafieldcontrol></td>
  </tr>
  <tr>
    <td>o. Seizures</td>
    <td><def:datafieldcontrol runat="server" id="hx3ohas" DatabaseField="hx3ohas" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="0px" FieldTextBoxWidth="30px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="hx3ochld" DatabaseField="hx3ochld" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="30px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="hx3omom" DatabaseField="hx3omom" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="30px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="hx3odad" DatabaseField="hx3odad" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="30px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="hx3osib" DatabaseField="hx3osib" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="30px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="hx3osibm" DatabaseField="hx3osibm" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="30px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="hx3osibp" DatabaseField="hx3osibp" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="30px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="hx3ocoum" DatabaseField="hx3ocoum" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="30px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="hx3ocoup" DatabaseField="hx3ocoup" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="30px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="hx3oaum" DatabaseField="hx3oaum" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="30px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="hx3oaup" DatabaseField="hx3oaup" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="30px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="hx3ogpm" DatabaseField="hx3ogpm" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="30px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="hx3ogpp" DatabaseField="hx3ogpp" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="30px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="hx3ootr" DatabaseField="hx3ootr" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxMaxLength="100"></def:datafieldcontrol></td>
  </tr>
  <tr>
    <td>p. Speech delay</td>
    <td><def:datafieldcontrol runat="server" id="hx3phas" DatabaseField="hx3phas" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="0px" FieldTextBoxWidth="30px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="hx3pchld" DatabaseField="hx3pchld" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="30px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="hx3pmom" DatabaseField="hx3pmom" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="30px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="hx3pdad" DatabaseField="hx3pdad" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="30px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="hx3psib" DatabaseField="hx3psib" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="30px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="hx3psibm" DatabaseField="hx3psibm" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="30px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="hx3psibp" DatabaseField="hx3psibp" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="30px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="hx3pcoum" DatabaseField="hx3pcoum" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="30px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="hx3pcoup" DatabaseField="hx3pcoup" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="30px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="hx3paum" DatabaseField="hx3paum" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="30px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="hx3paup" DatabaseField="hx3paup" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="30px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="hx3pgpm" DatabaseField="hx3pgpm" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="30px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="hx3pgpp" DatabaseField="hx3pgpp" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="30px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="hx3potr" DatabaseField="hx3potr" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxMaxLength="100"></def:datafieldcontrol></td>
  </tr>
  <tr>
    <td>q. Attention Deficit Disorder (ADD)</td>
    <td><def:datafieldcontrol runat="server" id="hx3qhas" DatabaseField="hx3qhas" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="0px" FieldTextBoxWidth="30px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="hx3qchld" DatabaseField="hx3qchld" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="30px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="hx3qmom" DatabaseField="hx3qmom" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="30px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="hx3qdad" DatabaseField="hx3qdad" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="30px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="hx3qsib" DatabaseField="hx3qsib" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="30px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="hx3qsibm" DatabaseField="hx3qsibm" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="30px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="hx3qsibp" DatabaseField="hx3qsibp" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="30px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="hx3qcoum" DatabaseField="hx3qcoum" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="30px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="hx3qcoup" DatabaseField="hx3qcoup" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="30px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="hx3qaum" DatabaseField="hx3qaum" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="30px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="hx3qaup" DatabaseField="hx3qaup" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="30px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="hx3qgpm" DatabaseField="hx3qgpm" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="30px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="hx3qgpp" DatabaseField="hx3qgpp" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="30px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="hx3qotr" DatabaseField="hx3qotr" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxMaxLength="100"></def:datafieldcontrol></td>
  </tr>
  <tr>
    <td>r. Panic or anxiety disorder</td>
    <td><def:datafieldcontrol runat="server" id="hx3rhas" DatabaseField="hx3rhas" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="0px" FieldTextBoxWidth="30px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="hx3rchld" DatabaseField="hx3rchld" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="30px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="hx3rmom" DatabaseField="hx3rmom" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="30px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="hx3rdad" DatabaseField="hx3rdad" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="30px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="hx3rsib" DatabaseField="hx3rsib" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="30px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="hx3rsibm" DatabaseField="hx3rsibm" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="30px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="hx3rsibp" DatabaseField="hx3rsibp" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="30px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="hx3rcoum" DatabaseField="hx3rcoum" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="30px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="hx3rcoup" DatabaseField="hx3rcoup" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="30px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="hx3raum" DatabaseField="hx3raum" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="30px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="hx3raup" DatabaseField="hx3raup" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="30px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="hx3rgpm" DatabaseField="hx3rgpm" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="30px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="hx3rgpp" DatabaseField="hx3rgpp" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="30px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="hx3rotr" DatabaseField="hx3rotr" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxMaxLength="100"></def:datafieldcontrol></td>
  </tr>
  <tr>
    <td>s. Depression</td>
    <td><def:datafieldcontrol runat="server" id="hx3shas" DatabaseField="hx3shas" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="0px" FieldTextBoxWidth="30px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="hx3schld" DatabaseField="hx3schld" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="30px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="hx3smom" DatabaseField="hx3smom" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="30px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="hx3sdad" DatabaseField="hx3sdad" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="30px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="hx3ssib" DatabaseField="hx3ssib" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="30px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="hx3ssibm" DatabaseField="hx3ssibm" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="30px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="hx3ssibp" DatabaseField="hx3ssibp" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="30px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="hx3scoum" DatabaseField="hx3scoum" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="30px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="hx3scoup" DatabaseField="hx3scoup" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="30px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="hx3saum" DatabaseField="hx3saum" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="30px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="hx3saup" DatabaseField="hx3saup" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="30px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="hx3sgpm" DatabaseField="hx3sgpm" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="30px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="hx3sgpp" DatabaseField="hx3sgpp" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="30px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="hx3sotr" DatabaseField="hx3sotr" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxMaxLength="100"></def:datafieldcontrol></td>
  </tr>
  <tr>
    <td>t. Manic depression/Bipolar</td>
    <td><def:datafieldcontrol runat="server" id="hx3thas" DatabaseField="hx3thas" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="0px" FieldTextBoxWidth="30px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="hx3tchld" DatabaseField="hx3tchld" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="30px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="hx3tmom" DatabaseField="hx3tmom" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="30px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="hx3tdad" DatabaseField="hx3tdad" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="30px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="hx3tsib" DatabaseField="hx3tsib" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="30px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="hx3tsibm" DatabaseField="hx3tsibm" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="30px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="hx3tsibp" DatabaseField="hx3tsibp" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="30px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="hx3tcoum" DatabaseField="hx3tcoum" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="30px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="hx3tcoup" DatabaseField="hx3tcoup" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="30px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="hx3taum" DatabaseField="hx3taum" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="30px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="hx3taup" DatabaseField="hx3taup" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="30px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="hx3tgpm" DatabaseField="hx3tgpm" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="30px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="hx3tgpp" DatabaseField="hx3tgpp" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="30px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="hx3totr" DatabaseField="hx3totr" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxMaxLength="100"></def:datafieldcontrol></td>
  </tr>
  <tr>
    <td>u. Schizophrenia</td>
    <td><def:datafieldcontrol runat="server" id="hx3uhas" DatabaseField="hx3uhas" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="0px" FieldTextBoxWidth="30px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="hx3uchld" DatabaseField="hx3uchld" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="30px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="hx3umom" DatabaseField="hx3umom" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="30px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="hx3udad" DatabaseField="hx3udad" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="30px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="hx3usib" DatabaseField="hx3usib" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="30px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="hx3usibm" DatabaseField="hx3usibm" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="30px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="hx3usibp" DatabaseField="hx3usibp" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="30px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="hx3ucoum" DatabaseField="hx3ucoum" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="30px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="hx3ucoup" DatabaseField="hx3ucoup" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="30px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="hx3uaum" DatabaseField="hx3uaum" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="30px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="hx3uaup" DatabaseField="hx3uaup" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="30px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="hx3ugpm" DatabaseField="hx3ugpm" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="30px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="hx3ugpp" DatabaseField="hx3ugpp" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="30px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="hx3uotr" DatabaseField="hx3uotr" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxMaxLength="100"></def:datafieldcontrol></td>
  </tr>
  <tr>
    <td>v. Been admitted to a hospital for psychiatric illness</td>
    <td><def:datafieldcontrol runat="server" id="hx3vhas" DatabaseField="hx3vhas" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="0px" FieldTextBoxWidth="30px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="hx3vchld" DatabaseField="hx3vchld" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="30px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="hx3vmom" DatabaseField="hx3vmom" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="30px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="hx3vdad" DatabaseField="hx3vdad" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="30px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="hx3vsib" DatabaseField="hx3vsib" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="30px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="hx3vsibm" DatabaseField="hx3vsibm" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="30px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="hx3vsibp" DatabaseField="hx3vsibp" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="30px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="hx3vcoum" DatabaseField="hx3vcoum" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="30px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="hx3vcoup" DatabaseField="hx3vcoup" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="30px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="hx3vaum" DatabaseField="hx3vaum" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="30px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="hx3vaup" DatabaseField="hx3vaup" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="30px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="hx3vgpm" DatabaseField="hx3vgpm" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="30px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="hx3vgpp" DatabaseField="hx3vgpp" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="30px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="hx3votr" DatabaseField="hx3votr" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxMaxLength="100"></def:datafieldcontrol></td>
  </tr>
  <tr>
    <td>w. Birth defects</td>
    <td><def:datafieldcontrol runat="server" id="hx3whas" DatabaseField="hx3whas" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="0px" FieldTextBoxWidth="30px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="hx3wchld" DatabaseField="hx3wchld" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="30px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="hx3wmom" DatabaseField="hx3wmom" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="30px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="hx3wdad" DatabaseField="hx3wdad" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="30px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="hx3wsib" DatabaseField="hx3wsib" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="30px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="hx3wsibm" DatabaseField="hx3wsibm" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="30px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="hx3wsibp" DatabaseField="hx3wsibp" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="30px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="hx3wcoum" DatabaseField="hx3wcoum" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="30px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="hx3wcoup" DatabaseField="hx3wcoup" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="30px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="hx3waum" DatabaseField="hx3waum" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="30px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="hx3waup" DatabaseField="hx3waup" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="30px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="hx3wgpm" DatabaseField="hx3wgpm" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="30px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="hx3wgpp" DatabaseField="hx3wgpp" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="30px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="hx3wotr" DatabaseField="hx3wotr" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxMaxLength="100"></def:datafieldcontrol></td>
  </tr>
  <tr>
    <td>x. Cancer<br />
      <def:datafieldcontrol runat="server" id="hx3xs" DatabaseField="hx3xs" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxMaxLength="100"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="hx3xhas" DatabaseField="hx3xhas" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="0px" FieldTextBoxWidth="30px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="hx3xchld" DatabaseField="hx3xchld" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="30px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="hx3xmom" DatabaseField="hx3xmom" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="30px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="hx3xdad" DatabaseField="hx3xdad" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="30px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="hx3xsib" DatabaseField="hx3xsib" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="30px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="hx3xsibm" DatabaseField="hx3xsibm" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="30px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="hx3xsibp" DatabaseField="hx3xsibp" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="30px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="hx3xcoum" DatabaseField="hx3xcoum" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="30px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="hx3xcoup" DatabaseField="hx3xcoup" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="30px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="hx3xaum" DatabaseField="hx3xaum" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="30px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="hx3xaup" DatabaseField="hx3xaup" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="30px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="hx3xgpm" DatabaseField="hx3xgpm" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="30px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="hx3xgpp" DatabaseField="hx3xgpp" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="30px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="hx3xotr" DatabaseField="hx3xotr" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxMaxLength="100"></def:datafieldcontrol></td>
  </tr>
  <tr>
    <td>y. Norrie Syndrome</td>
    <td><def:datafieldcontrol runat="server" id="hx3yhas" DatabaseField="hx3yhas" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="0px" FieldTextBoxWidth="30px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="hx3ychld" DatabaseField="hx3ychld" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="30px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="hx3ymom" DatabaseField="hx3ymom" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="30px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="hx3ydad" DatabaseField="hx3ydad" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="30px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="hx3ysib" DatabaseField="hx3ysib" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="30px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="hx3ysibm" DatabaseField="hx3ysibm" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="30px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="hx3ysibp" DatabaseField="hx3ysibp" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="30px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="hx3ycoum" DatabaseField="hx3ycoum" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="30px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="hx3ycoup" DatabaseField="hx3ycoup" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="30px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="hx3yaum" DatabaseField="hx3yaum" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="30px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="hx3yaup" DatabaseField="hx3yaup" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="30px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="hx3ygpm" DatabaseField="hx3ygpm" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="30px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="hx3ygpp" DatabaseField="hx3ygpp" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="0" FieldLabelWidth="0px" FieldTextBoxWidth="30px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="hx3yotr" DatabaseField="hx3yotr" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="0px" FieldTextBoxMaxLength="100"></def:datafieldcontrol></td>
  </tr>
</table>
<div class="collection">
  <div class="main"><def:datafieldcontrol runat="server" id="hx15" DatabaseField="hx15" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px" CallOnBlur="MedPsychHx_onBlur"></def:datafieldcontrol></div>
  <div class="key"><def:ValueSetLabel ID="ValueSetLabel_hx15" runat="server"  DatabaseField="hx15"></def:ValueSetLabel></div>
</div>
<div class="indent">
  <def:datafieldcontrol runat="server" id="hx15a" DatabaseField="hx15a" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
  <div class="legend">
    0=First month of life<br />
    1=1-12 months (before 1st birthday)<br />
    2=12-24 months (before 2nd birthday)<br />
    3=2-5 years (before 5th birthday)<br />
    4=>5 years
  </div>
</div>
<div class="collection">
  <div class="main">
    <div class="indent"><def:datafieldcontrol runat="server" id="hx15b" DatabaseField="hx15b" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
    <div class="indent"><def:datafieldcontrol runat="server" id="hx15c" DatabaseField="hx15c" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
    <div class="indent"><def:datafieldcontrol runat="server" id="hx15d" DatabaseField="hx15d" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
  </div>
  <div class="key"><def:ValueSetLabel ID="ValueSetLabel_hx15b" runat="server"  DatabaseField="hx15b"></def:ValueSetLabel></div>
</div>
<div class="main">16. Have you ever...</div>
<div class="collection">
  <div class="main">
    <div class="indent"><def:datafieldcontrol runat="server" id="hx16a" DatabaseField="hx16a" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
    <div class="indent"><def:datafieldcontrol runat="server" id="hx16b" DatabaseField="hx16b" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
    <div class="indent"><def:datafieldcontrol runat="server" id="hx16c" DatabaseField="hx16c" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
  </div>
  <div class="key"><def:ValueSetLabel ID="ValueSetLabel_hx16a" runat="server"  DatabaseField="hx16a"></def:ValueSetLabel></div>
</div>
<div class="indent">At what age(s) did you lose consciousness</div>
<div class="collection">
  <div class="indent"><def:datafieldcontrol runat="server" id="hx16c1y" DatabaseField="hx16c1y" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="80px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
  <div class="next"><def:datafieldcontrol runat="server" id="hx16c1m" DatabaseField="hx16c1m" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="100px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
</div>
<div class="collection">
  <div class="indent"><def:datafieldcontrol runat="server" id="hx16c2y" DatabaseField="hx16c2y" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="80px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
  <div class="next"><def:datafieldcontrol runat="server" id="hx16c2m" DatabaseField="hx16c2m" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="100px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
</div>
<div class="collection">
  <div class="indent"><def:datafieldcontrol runat="server" id="hx16c3y" DatabaseField="hx16c3y" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="80px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
  <div class="next"><def:datafieldcontrol runat="server" id="hx16c3m" DatabaseField="hx16c3m" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="100px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
</div>
<div class="main">17. Did you have any of the following birth defects?</div>
<div class="collection">
  <div class="main">
    <div class="indent"><def:datafieldcontrol runat="server" id="hx17a" DatabaseField="hx17a" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
    <div class="indent"><def:datafieldcontrol runat="server" id="hx17b" DatabaseField="hx17b" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
    <div class="indent"><def:datafieldcontrol runat="server" id="hx17c" DatabaseField="hx17c" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
    <div class="indent"><def:datafieldcontrol runat="server" id="hx17d" DatabaseField="hx17d" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
  </div>
  <div class="key"><def:ValueSetLabel ID="ValueSetLabel_hx17a" runat="server"  DatabaseField="hx17a"></def:ValueSetLabel></div>
</div>
<div class="indent"><def:datafieldcontrol runat="server" id="hx17ds" DatabaseField="hx17ds" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="300px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="100"></def:datafieldcontrol></div>
<div class="indent"><def:datafieldcontrol runat="server" id="hx17e" DatabaseField="hx17e" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
<div class="indent"><def:datafieldcontrol runat="server" id="hx17es" DatabaseField="hx17es" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="300px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="100"></def:datafieldcontrol></div>
<div class="indent"><def:datafieldcontrol runat="server" id="hx17f" DatabaseField="hx17f" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
<div class="indent"><def:datafieldcontrol runat="server" id="hx17fs" DatabaseField="hx17fs" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="300px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="100"></def:datafieldcontrol></div>
<div class="collection">
  <div class="main">
    <div class="main"><def:datafieldcontrol runat="server" id="hx18" DatabaseField="hx18" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
    <div class="indent"><def:datafieldcontrol runat="server" id="hx18apr" DatabaseField="hx18apr" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="300px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="100"></def:datafieldcontrol></div>
    <div class="indent"><def:datafieldcontrol runat="server" id="hx18ah" DatabaseField="hx18ah" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="-9" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
    <div class="indent"><def:datafieldcontrol runat="server" id="hx18bpr" DatabaseField="hx18bpr" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="300px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="100"></def:datafieldcontrol></div>
    <div class="indent"><def:datafieldcontrol runat="server" id="hx18bh" DatabaseField="hx18bh" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="-9" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
    <div class="indent"><def:datafieldcontrol runat="server" id="hx18cpr" DatabaseField="hx18cpr" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="300px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="100"></def:datafieldcontrol></div>
    <div class="indent"><def:datafieldcontrol runat="server" id="hx18ch" DatabaseField="hx18ch" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxTextDefault="-9" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
  </div>
  <div class="key"><def:ValueSetLabel ID="ValueSetLabel_hx18" runat="server"  DatabaseField="hx18"></def:ValueSetLabel></div>
</div>
<div class="collection">
  <div class="main"><def:datafieldcontrol runat="server" id="hxrevw" DatabaseField="hxrevw" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
  <div class="key"><def:ValueSetLabel ID="ValueSetLabel_hxrevw" runat="server"  DatabaseField="hxrevw"></def:ValueSetLabel></div>
</div>
</asp:panel>
<div class="main">
  <def:datafieldcontrol runat="server" id="created" DatabaseField="created" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="200px"></def:datafieldcontrol>
  <def:datafieldcontrol runat="server" id="createdBy" DatabaseField="createdBy" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="200px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="50"></def:datafieldcontrol>
  <def:datafieldcontrol runat="server" id="updated" DatabaseField="updated" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="200px"></def:datafieldcontrol>
  <def:datafieldcontrol runat="server" id="updatedBy" DatabaseField="updatedBy" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="200px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="50"></def:datafieldcontrol>
  <def:datafieldcontrol runat="server" id="scored" DatabaseField="scored" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="200px"></def:datafieldcontrol>
  <def:datafieldcontrol runat="server" id="scoredBy" DatabaseField="scoredBy" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="200px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="50"></def:datafieldcontrol>
</div>
</asp:Content>
