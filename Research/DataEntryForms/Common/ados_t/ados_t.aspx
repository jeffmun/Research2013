<%@ Register TagPrefix="def" Namespace="DataEntryFramework3" %> 
<%@ Page language="c#" MasterPageFile="~/UWAC.master"  Title="ADOS_T Data Entry" %>
<asp:Content ID="Content1" ContentPlaceHolderID="oBodyPlaceHolder" runat="server">
<def:dataentrycontroller id="DataEntryController1" runat="server" DatabaseTable="ALL_ADOS_T" >
</def:dataentrycontroller>
<table cellpadding="0" cellspacing="0" border="0">
  <tr>
    <td style="vertical-align:top" style="padding-right:50px">
<def:datafieldcontrol runat="server" id="id" DatabaseField="id"  IsInsertField="true"   FieldLabelWidth="175px "></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="indexnum" DatabaseField="indexnum"  IsInsertField="true"   FieldLabelWidth="175px "></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="Examiner" DatabaseField="ADOSTExmr" IsInsertField="true" FieldLabelWidth="175px" FieldTextBoxWidth="175px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="Coder" DatabaseField="ADOSTCodr" IsEntryField="true" IsInsertField="true" FieldLabelWidth="175px" FieldTextBoxWidth="175px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="DateAdministered" DatabaseField="ADOSTDate"  FieldLabelText="Date of Examination" IsInsertField="true" FieldLabelWidth="175px" FieldTextBoxWidth="100px"></def:datafieldcontrol>
    </td>
    <td style="vertical-align:top" style="background-color:#eeeeee">
<def:datafieldcontrol runat="server" id="ADOSTAge"  DatabaseField="ADOSTAge"  FieldLabelText="Age (months)"  IsReadOnly="true" FieldLabelWidth="200px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="ADOSTSocAff" DatabaseField="ADOSTSocAff" FieldLabelText="Social Affect Total"  IsReadOnly="true" FieldLabelWidth="200px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="ADOSTRepbx"  DatabaseField="ADOSTRepbx"  FieldLabelText="Restricted and Repetitive Behavior Total"  IsReadOnly="true" FieldLabelWidth="200px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="ADOSTTotal"  DatabaseField="ADOSTTotal"  FieldLabelText="Combined Total"  IsReadOnly="true" FieldLabelWidth="200px"></def:datafieldcontrol>

<def:datafieldcontrol runat="server" id="ADOSTAlgVers"  DatabaseField="ADOSTAlgVers"  FieldLabelText="Algorithm Version"  IsReadOnly="true" FieldLabelWidth="200px" FieldTextBoxWidth="325px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="ADOSTconcern_txt"  DatabaseField="ADOSTconcern_txt"  FieldLabelText="Range of concern"  IsReadOnly="true" FieldLabelWidth="200px" FieldTextBoxWidth="325px"></def:datafieldcontrol>

<br/>   
 <asp:Label runat="server" ID="Label1" Text="Classification based on Luyster et al. (2009)." Font-Underline="true"></asp:Label> <br/>

<def:datafieldcontrol runat="server" id="ADOSTClass"  DatabaseField="ADOSTClass"  FieldLabelText="ADOS Classification"  IsReadOnly="true" FieldLabelWidth="200px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="ADOSTScrVers"  DatabaseField="ADOSTScrVers"  FieldLabelText="Scoring Version"  IsReadOnly="true" FieldLabelWidth="200px" FieldTextBoxWidth="325px"></def:datafieldcontrol>
<br/>   
 <asp:Label runat="server" ID="l1" Text="Scores based on Mod 1 scoring" Font-Underline="true"></asp:Label> <br/>
<def:datafieldcontrol runat="server" id="Datafieldcontrol1" DatabaseField="ADOSSocAff" FieldLabelText="Social Affect Total"  IsReadOnly="true" FieldLabelWidth="200px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="Datafieldcontrol2"  DatabaseField="ADOSRestrep"  FieldLabelText="Restricted and Repetitive Behavior Total"  IsReadOnly="true" FieldLabelWidth="200px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="Datafieldcontrol4"  DatabaseField="ADOSClass"  FieldLabelText="ADOS Classification"  IsReadOnly="true" FieldLabelWidth="200px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="Datafieldcontrol6"  DatabaseField="ADOSsevscrext"  FieldLabelText="Severity score (extended down to 18mo)"  IsReadOnly="true" FieldLabelWidth="200px" ></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="Datafieldcontrol5"  DatabaseField="ADOSAlgVers"  FieldLabelText="Algorithm Version"  IsReadOnly="true" FieldLabelWidth="200px" FieldTextBoxWidth="325px"></def:datafieldcontrol>

         </td>
  </tr>
</table>
<asp:panel id="mainPanel" runat="server">
<h3>A. Language and Communications</h3>
<p>Please follow your ADOS Toddler Module coding instructions, using 0, 1, 2, 3, 7, or 8 for most fields as appropriate.</p>
<blockquote><strong>If an item is missing entirely, enter a -9.</strong></blockquote>
<def:datafieldcontrol runat="server" id="ADOSTA01" DatabaseField="ADOSTA01"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="ADOSTA01a" DatabaseField="ADOSTA01a"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<br />For each of the following sounds, enter a <strong>1</strong> if the child uses it, <strong>0</strong> if not, and <strong>-9</strong> if no data was collected.<br />
<table border="0" cellspacing="5" cellpadding="0">
    <tr>
        <td width="100">
            <def:datafieldcontrol runat="server" id="ADOSTA01b" DatabaseField="ADOSTA01b"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="35px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
        </td>
        <td width="100">
            <def:datafieldcontrol runat="server" id="ADOSTA01c" DatabaseField="ADOSTA01c"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="35px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
        </td>
        <td width="100">
            <def:datafieldcontrol runat="server" id="ADOSTA01d" DatabaseField="ADOSTA01d"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="35px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
        </td>
        <td width="100">
            <def:datafieldcontrol runat="server" id="ADOSTA01e" DatabaseField="ADOSTA01e"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="35px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
        </td>
        <td width="100">
            <def:datafieldcontrol runat="server" id="ADOSTA01f" DatabaseField="ADOSTA01f"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="35px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
        </td>
    </tr>
    <tr>
        <td>
            <def:datafieldcontrol runat="server" id="ADOSTA01g" DatabaseField="ADOSTA01g"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="35px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
        </td>
        <td>
            <def:datafieldcontrol runat="server" id="ADOSTA01h" DatabaseField="ADOSTA01h"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="35px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
        </td>
        <td>
            <def:datafieldcontrol runat="server" id="ADOSTA01i" DatabaseField="ADOSTA01i"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="35px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
        </td>
        <td>
            <def:datafieldcontrol runat="server" id="ADOSTA01j" DatabaseField="ADOSTA01j"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="35px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
        </td>
        <td>
            <def:datafieldcontrol runat="server" id="ADOSTA01k" DatabaseField="ADOSTA01k"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="35px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
        </td>
    </tr>
</table>
<def:datafieldcontrol runat="server" id="ADOSTA02" DatabaseField="ADOSTA02"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="ADOSTA03" DatabaseField="ADOSTA03"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="ADOSTA04" DatabaseField="ADOSTA04"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="ADOSTA05" DatabaseField="ADOSTA05"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="ADOSTA06" DatabaseField="ADOSTA06"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="ADOSTA07" DatabaseField="ADOSTA07"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="ADOSTA08" DatabaseField="ADOSTA08"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="ADOSTA09" DatabaseField="ADOSTA09"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<br /><h3>B. Reciprocal Social Interaction</h3>
<p>Please follow your ADOS Toddler Module coding instructions, using 0, 1, 2, 3, 7, or 8 for most fields as appropriate.</p>
<blockquote><strong>If an item is missing entirely, enter a -9.</strong></blockquote>
<def:datafieldcontrol runat="server" id="ADOSTB01" DatabaseField="ADOSTB01"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="ADOSTB02" DatabaseField="ADOSTB02"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="ADOSTB03" DatabaseField="ADOSTB03"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="ADOSTB04" DatabaseField="ADOSTB04"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="ADOSTB05" DatabaseField="ADOSTB05"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="ADOSTB06" DatabaseField="ADOSTB06"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="ADOSTB07" DatabaseField="ADOSTB07"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="ADOSTB08" DatabaseField="ADOSTB08"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="ADOSTB09" DatabaseField="ADOSTB09"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="ADOSTB10" DatabaseField="ADOSTB10"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="ADOSTB11" DatabaseField="ADOSTB11"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="ADOSTB12" DatabaseField="ADOSTB12"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="ADOSTB13" DatabaseField="ADOSTB13"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="ADOSTB14" DatabaseField="ADOSTB14"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="ADOSTB15" DatabaseField="ADOSTB15"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="ADOSTB16a" DatabaseField="ADOSTB16a"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="ADOSTB16b" DatabaseField="ADOSTB16b"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="ADOSTB17" DatabaseField="ADOSTB17"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="ADOSTB18" DatabaseField="ADOSTB18"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<br /><h3>C. Play</h3>
<p>Please follow your ADOS Toddler Module coding instructions, using 0, 1, 2, 3, 7, or 8 for most fields as appropriate.</p>
<blockquote><strong>If an item is missing entirely, enter a -9.</strong></blockquote>
<def:datafieldcontrol runat="server" id="ADOSTC01" DatabaseField="ADOSTC01"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="ADOSTC02" DatabaseField="ADOSTC02"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="ADOSTC03" DatabaseField="ADOSTC03"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<br /><h3>D. Stereotyped Behaviors and Restricted Interests</h3>
<p>Please follow your ADOS Toddler Module coding instructions, using 0, 1, 2, 3, 7, or 8 for most fields as appropriate.</p>
<blockquote><strong>If an item is missing entirely, enter a -9.</strong></blockquote>
<def:datafieldcontrol runat="server" id="ADOSTD01" DatabaseField="ADOSTD01"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="ADOSTD01a" DatabaseField="ADOSTD01a"  IsEntryField="true" IsDoubleEntryField="false"  FieldLabelWidth="300px" FieldTextBoxWidth = "300px" FieldTextBoxHeight = "50px" FieldTextBoxTextMode="MultiLine"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="ADOSTD02" DatabaseField="ADOSTD02"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="ADOSTD02a" DatabaseField="ADOSTD02a"  IsEntryField="true" IsDoubleEntryField="false"  FieldLabelWidth="300px" FieldTextBoxWidth = "300px" FieldTextBoxHeight = "50px" FieldTextBoxTextMode="MultiLine"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="ADOSTD03" DatabaseField="ADOSTD03"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="ADOSTD03a" DatabaseField="ADOSTD03a"  IsEntryField="true" IsDoubleEntryField="false"  FieldLabelWidth="300px" FieldTextBoxWidth = "300px" FieldTextBoxHeight = "50px" FieldTextBoxTextMode="MultiLine"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="ADOSTD04" DatabaseField="ADOSTD04"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="ADOSTD05" DatabaseField="ADOSTD05"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="ADOSTD05a" DatabaseField="ADOSTD05a"  IsEntryField="true" IsDoubleEntryField="false"  FieldLabelWidth="300px" FieldTextBoxWidth = "300px" FieldTextBoxHeight = "50px" FieldTextBoxTextMode="MultiLine"></def:datafieldcontrol>
<br /><h3>E. Other Behaviors</h3>
<p>Please follow your ADOS Toddler Module coding instructions, using 0, 1, 2, 3, 7, or 8 for most fields as appropriate.</p>
<blockquote><strong>If an item is missing entirely, enter a -9.</strong></blockquote>
<def:datafieldcontrol runat="server" id="ADOSTE01" DatabaseField="ADOSTE01"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="ADOSTE02" DatabaseField="ADOSTE02"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="ADOSTE03" DatabaseField="ADOSTE03"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="ADOSTE04" DatabaseField="ADOSTE04"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
</asp:panel>
<br />
<def:datafieldcontrol runat="server" id="created" DatabaseField="created"  IsReadOnly="true" RenderReadOnlyAsDiv="true"   FieldLabelWidth="300px "></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="createdBy" DatabaseField="createdBy"  IsReadOnly="true" RenderReadOnlyAsDiv="true"   FieldLabelWidth="300px "></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="updated" DatabaseField="updated"  IsReadOnly="true" RenderReadOnlyAsDiv="true"   FieldLabelWidth="300px "></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="updatedBy" DatabaseField="updatedBy"  IsReadOnly="true" RenderReadOnlyAsDiv="true"   FieldLabelWidth="300px "></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="scored" DatabaseField="scored"  IsReadOnly="true" RenderReadOnlyAsDiv="true"   FieldLabelWidth="300px "></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="scoredBy" DatabaseField="scoredBy"  IsReadOnly="true" RenderReadOnlyAsDiv="true"   FieldLabelWidth="300px "></def:datafieldcontrol>
</asp:Content>
