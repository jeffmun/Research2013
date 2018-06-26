<%@ Register TagPrefix="def" Namespace="DataEntryFramework3" %> 
<%@ Page language="c#" MasterPageFile="~/UWAC.master"  Title="RBS_R Data Entry" %>
<asp:Content ID="Content1" ContentPlaceHolderID="oBodyPlaceHolder" runat="server">
<def:dataentrycontroller id="DataEntryController1" runat="server" DatabaseTable="ALL_RBS_R" PrimaryKeyField = "rbsr_pk">
</def:dataentrycontroller>
<def:datafieldcontrol runat="server" id="id" DatabaseField="id"  IsInsertField="true"   FieldLabelWidth="300px" FieldTextBoxWidth="50px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="indexnum" DatabaseField="indexnum"  IsInsertField="true"   FieldLabelWidth="300px" FieldTextBoxWidth="50px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="RBSRTD" DatabaseField="RBSRTD"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px"></def:datafieldcontrol>
<blockquote>
<def:ValueSetLabel ID="ValueSetLabel_RBSRSt01" runat="server"  DatabaseField="RBSRSt01"></def:ValueSetLabel>
</blockquote>
<p>
<h2>I. Stereotyped Behavior Subscale</h2>
<def:datafieldcontrol runat="server" id="RBSRSt01" DatabaseField="RBSRSt01"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="50px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="RBSRSt02" DatabaseField="RBSRSt02"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="50px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="RBSRSt03" DatabaseField="RBSRSt03"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="50px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="RBSRSt04" DatabaseField="RBSRSt04"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="50px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="RBSRSt05" DatabaseField="RBSRSt05"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="50px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="RBSRSt06" DatabaseField="RBSRSt06"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="50px"></def:datafieldcontrol>
</p>
<p>
<h2>II. Self-Injurious Behavior Subscale</h2>
<def:datafieldcontrol runat="server" id="RBSRSI07" DatabaseField="RBSRSI07"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="50px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="RBSRSI08" DatabaseField="RBSRSI08"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="50px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="RBSRSI09" DatabaseField="RBSRSI09"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="50px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="RBSRSI10" DatabaseField="RBSRSI10"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="50px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="RBSRSI11" DatabaseField="RBSRSI11"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="50px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="RBSRSI12" DatabaseField="RBSRSI12"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="50px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="RBSRSI13" DatabaseField="RBSRSI13"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="50px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="RBSRSI14" DatabaseField="RBSRSI14"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="50px"></def:datafieldcontrol>
</p>
<p>
<h2>III. Compulsive Behavior Subscale</h2>
<def:datafieldcontrol runat="server" id="RBSRCo15" DatabaseField="RBSRCo15"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="50px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="RBSRCo16" DatabaseField="RBSRCo16"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="50px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="RBSRCo17" DatabaseField="RBSRCo17"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="50px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="RBSRCo18" DatabaseField="RBSRCo18"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="50px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="RBSRCo19" DatabaseField="RBSRCo19"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="50px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="RBSRCo20" DatabaseField="RBSRCo20"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="50px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="RBSRCo21" DatabaseField="RBSRCo21"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="50px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="RBSRCo22" DatabaseField="RBSRCo22"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="50px"></def:datafieldcontrol>
</p>
<p>
<h2>IV. Ritualistic Behavior Subscale</h2>
<def:datafieldcontrol runat="server" id="RBSRRi23" DatabaseField="RBSRRi23"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="50px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="RBSRRi24" DatabaseField="RBSRRi24"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="50px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="RBSRRi25" DatabaseField="RBSRRi25"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="50px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="RBSRRi26" DatabaseField="RBSRRi26"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="50px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="RBSRRi27" DatabaseField="RBSRRi27"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="50px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="RBSRRi28" DatabaseField="RBSRRi28"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="50px"></def:datafieldcontrol>
</p>
<p>
<h2>V. Sameness Behavior Subscale</h2>
<def:datafieldcontrol runat="server" id="RBSRSa29" DatabaseField="RBSRSa29"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="50px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="RBSRSa30" DatabaseField="RBSRSa30"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="50px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="RBSRSa31" DatabaseField="RBSRSa31"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="50px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="RBSRSa32" DatabaseField="RBSRSa32"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="50px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="RBSRSa33" DatabaseField="RBSRSa33"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="50px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="RBSRSa34" DatabaseField="RBSRSa34"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="50px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="RBSRSa35" DatabaseField="RBSRSa35"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="50px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="RBSRSa36" DatabaseField="RBSRSa36"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="50px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="RBSRSa37" DatabaseField="RBSRSa37"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="50px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="RBSRSa38" DatabaseField="RBSRSa38"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="50px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="RBSRSa39" DatabaseField="RBSRSa39"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="50px"></def:datafieldcontrol>
</p>
<p>
<h2>VI. Restricted Behavior Subscale</h2>
<def:datafieldcontrol runat="server" id="RBSRRe40" DatabaseField="RBSRRe40"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="50px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="RBSRRe41" DatabaseField="RBSRRe41"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="50px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="RBSRRe42" DatabaseField="RBSRRe42"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="50px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="RBSRRe43" DatabaseField="RBSRRe43"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="50px"></def:datafieldcontrol>
</p>
<p>
<h3>Scoring:</h3>
</p>
<table border="1" cellpadding="8" cellspacing="0">
    <tr>
    <td style="width: 200px"><strong>Subscale</strong></td>
    <td style="width: 150px" align="center"><strong>Number of subscale items endorsed</strong></td>
    <td style="width: 150px" align="center"><strong>Total subscale score</strong></td>
    </tr>
    <tr>
        <td>
        I. Stereotyped Behavior
        </td>
        <td align="center">
        <def:datafieldcontrol runat="server" id="RBSRStSI" DatabaseField="RBSRStSI"  IsEntryField="true" IsDoubleEntryField="true"  FieldTextBoxWidth="50px"></def:datafieldcontrol>
        </td>
        <td align="center">
        <def:datafieldcontrol runat="server" id="RBSRStTS" DatabaseField="RBSRStTS"  IsEntryField="true" IsDoubleEntryField="true"  FieldTextBoxWidth="50px"></def:datafieldcontrol>
        </td>
    </tr>
    <tr>
        <td>
        II. Self-Injurious Behavior
        </td>
        <td align="center">
        <def:datafieldcontrol runat="server" id="RBSRSISI" DatabaseField="RBSRSISI"  IsEntryField="true" IsDoubleEntryField="true"   FieldTextBoxWidth="50px"></def:datafieldcontrol>
        </td>
        <td align="center">
        <def:datafieldcontrol runat="server" id="RBSRSITS" DatabaseField="RBSRSITS"  IsEntryField="true" IsDoubleEntryField="true"   FieldTextBoxWidth="50px"></def:datafieldcontrol>
        </td>
    </tr>
    <tr>
        <td>
        III. Compulsive Behavior
        </td>
        <td align="center">
        <def:datafieldcontrol runat="server" id="RBSRCoSI" DatabaseField="RBSRCoSI"  IsEntryField="true" IsDoubleEntryField="true"   FieldTextBoxWidth="50px"></def:datafieldcontrol>
        </td>
        <td align="center">
        <def:datafieldcontrol runat="server" id="RBSRCoTS" DatabaseField="RBSRCoTS"  IsEntryField="true" IsDoubleEntryField="true"   FieldTextBoxWidth="50px"></def:datafieldcontrol>
        </td>
    </tr>
    <tr>
        <td>
        IV. Ritualistic Behavior
        </td>
        <td align="center">
        <def:datafieldcontrol runat="server" id="RBSRRiSI" DatabaseField="RBSRRiSI"  IsEntryField="true" IsDoubleEntryField="true"   FieldTextBoxWidth="50px"></def:datafieldcontrol>
        </td>
        <td align="center">
        <def:datafieldcontrol runat="server" id="RBSRRiTS" DatabaseField="RBSRRiTS"  IsEntryField="true" IsDoubleEntryField="true"   FieldTextBoxWidth="50px"></def:datafieldcontrol>
        </td>
    </tr>
    <tr>
        <td>
        V. Sameness Behavior
        </td>
        <td align="center">
        <def:datafieldcontrol runat="server" id="RBSRSaSI" DatabaseField="RBSRSaSI"  IsEntryField="true" IsDoubleEntryField="true"   FieldTextBoxWidth="50px"></def:datafieldcontrol>
        </td>
        <td align="center">
        <def:datafieldcontrol runat="server" id="RBSRSaTS" DatabaseField="RBSRSaTS"  IsEntryField="true" IsDoubleEntryField="true"   FieldTextBoxWidth="50px"></def:datafieldcontrol>
        </td>
    </tr>
    <tr>
        <td>
        VI. Restricted Behavior
        </td>
        <td align="center">
        <def:datafieldcontrol runat="server" id="RBSRReSI" DatabaseField="RBSRReSI"  IsEntryField="true" IsDoubleEntryField="true"   FieldTextBoxWidth="50px"></def:datafieldcontrol>
        </td>
        <td align="center">
        <def:datafieldcontrol runat="server" id="RBSRReTS" DatabaseField="RBSRReTS"  IsEntryField="true" IsDoubleEntryField="true"   FieldTextBoxWidth="50px"></def:datafieldcontrol>
        </td>
    </tr>
    <tr>
        <td style="width: 200px" rowspan="2"> &nbsp; </td>
        <td style="width: 150px" align="center"><strong>Overall number of items endorsed</strong></td>
        <td style="width: 150px" align="center"><strong>Overall Score</strong></td>
    </tr>
    <tr>
        <td align="center">
        <def:datafieldcontrol runat="server" id="RBSROIE" DatabaseField="RBSROIE"  IsEntryField="true" IsDoubleEntryField="true"   FieldTextBoxWidth="50px"></def:datafieldcontrol>
        </td>
        <td align="center">
        <def:datafieldcontrol runat="server" id="RBSROS" DatabaseField="RBSROS"  IsEntryField="true" IsDoubleEntryField="true"   FieldTextBoxWidth="50px"></def:datafieldcontrol>
        </td>
    </tr>
</table>
<br />
<def:datafieldcontrol runat="server" id="created" DatabaseField="created"  IsReadOnly="true" RenderReadOnlyAsDiv="true"   FieldLabelWidth="300px" FieldTextBoxWidth="50px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="createdBy" DatabaseField="createdBy"  IsReadOnly="true" RenderReadOnlyAsDiv="true"   FieldLabelWidth="300px" FieldTextBoxWidth="50px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="updated" DatabaseField="updated"  IsReadOnly="true" RenderReadOnlyAsDiv="true"   FieldLabelWidth="300px" FieldTextBoxWidth="50px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="updatedBy" DatabaseField="updatedBy"  IsReadOnly="true" RenderReadOnlyAsDiv="true"   FieldLabelWidth="300px" FieldTextBoxWidth="50px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="scored" DatabaseField="scored"  IsReadOnly="true" RenderReadOnlyAsDiv="true"   FieldLabelWidth="300px" FieldTextBoxWidth="50px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="scoredBy" DatabaseField="scoredBy"  IsReadOnly="true" RenderReadOnlyAsDiv="true"   FieldLabelWidth="300px" FieldTextBoxWidth="50px"></def:datafieldcontrol>
</asp:Content>
