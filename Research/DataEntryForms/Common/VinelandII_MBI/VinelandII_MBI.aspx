<%@ Register TagPrefix="def" Namespace="DataEntryFramework3" %> 
<%@ Page language="c#" MasterPageFile="~/UWAC.master"  Title="VinelandII Data Entry" %>
<asp:Content ID="Content1" ContentPlaceHolderID="oBodyPlaceHolder" runat="server">

<def:dataentrycontroller id="DataEntryController1" runat="server" DatabaseTable="ALL_VinelandIISurvey_MBI" >
</def:dataentrycontroller>
<div class="main">
    <def:datafieldcontrol runat="server" id="id" DatabaseField="id" IsInsertField="true" FieldLabelWidth="200px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="15"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="indexnum" DatabaseField="indexnum" IsInsertField="true" FieldTextBoxTextDefault="1" FieldLabelWidth="200px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="interview_date" DatabaseField="interview_date" IsInsertField="true" FieldLabelText="Interview Date" FieldLabelWidth="200px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="mbiagemos" DatabaseField="mbiagemos" IsReadOnly="true" RenderReadOnlyAsDiv="true"  FieldLabelWidth="200px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="50"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="Examiner" DatabaseField="Examiner" IsInsertField="true" FieldLabelWidth="200px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="50"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="form_version" DatabaseField="form_version" IsInsertField="true" FieldLabelText="Form Version (Survey Interview, Parent/Caregiver Rating)" FieldTextBoxTextDefault="Survey Interview" FieldLabelWidth="200px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="50"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="respondent_sex" DatabaseField="respondent_sex" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="200px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="50"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="relation_to_child" DatabaseField="relation_to_child" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="200px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="50"></def:datafieldcontrol>
</div>
<asp:panel id="mainPanel" CssClass="mainPanel" runat="server">
<h5 class="main" style="color:darkblue"><b><u>Summary Scores:</u></b></h5>
<table class="main" border="1px">
<tr>
    <td><u>Domain</u></td>
    <td><u>Raw score</u></td>
    <td><u>V scaled score<br/><b>Std Score</b></u></td>
    <td><u>Pctile</u></td>
    <td><u>Adapt. Level</u></td>
</tr>
<tr>
    <td>Internalizing</td>
    <td> <def:datafieldcontrol runat="server" id="mbiinternalizingsubdomain_1" DatabaseField="mbiinternalizingsubdomain_1" IsReadOnly="true"  ShowFieldLabel="false"    FieldLabelWidth="50px" FieldTextBoxWidth="40px" RenderReadOnlyAsDiv = "true" ></def:datafieldcontrol> </td> 
    <td> <def:datafieldcontrol runat="server" id="mbiinternalizingsubdomain_1a" DatabaseField="mbiinternalizingsubdomain_1a" IsReadOnly="true"  ShowFieldLabel="false"    FieldLabelWidth="50px" FieldTextBoxWidth="40px" RenderReadOnlyAsDiv = "true" ></def:datafieldcontrol> </td> 
    <td> <def:datafieldcontrol runat="server" id="mbiinternalizingsubdomain_1c" DatabaseField="mbiinternalizingsubdomain_1c" IsReadOnly="true"  ShowFieldLabel="false"    FieldLabelWidth="50px" FieldTextBoxWidth="40px" RenderReadOnlyAsDiv = "true" ></def:datafieldcontrol> </td> 
    <td> <def:datafieldcontrol runat="server" id="mbiinternalizingsubdomain_1e" DatabaseField="mbiinternalizingsubdomain_1e" IsReadOnly="true"  ShowFieldLabel="false"    FieldLabelWidth="50px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="50" RenderReadOnlyAsDiv = "true" ></def:datafieldcontrol> </td> 
</tr>
<tr>
    <td>Externalizing</td>
    <td> <def:datafieldcontrol runat="server" id="mbiexternalizingsubdomain_2" DatabaseField="mbiexternalizingsubdomain_2" IsReadOnly="true"  ShowFieldLabel="false"    FieldLabelWidth="50px" FieldTextBoxWidth="40px" RenderReadOnlyAsDiv = "true" ></def:datafieldcontrol> </td> 
    <td> <def:datafieldcontrol runat="server" id="mbiexternalizingsubdomain_2a" DatabaseField="mbiexternalizingsubdomain_2a" IsReadOnly="true"  ShowFieldLabel="false"    FieldLabelWidth="50px" FieldTextBoxWidth="40px" RenderReadOnlyAsDiv = "true" ></def:datafieldcontrol> </td> 
    <td> <def:datafieldcontrol runat="server" id="mbiexternalizingsubdomain_2c" DatabaseField="mbiexternalizingsubdomain_2c" IsReadOnly="true"  ShowFieldLabel="false"    FieldLabelWidth="50px" FieldTextBoxWidth="40px" RenderReadOnlyAsDiv = "true" ></def:datafieldcontrol> </td> 
    <td> <def:datafieldcontrol runat="server" id="mbiexternalizingsubdomain_2e" DatabaseField="mbiexternalizingsubdomain_2e" IsReadOnly="true"  ShowFieldLabel="false"    FieldLabelWidth="50px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="50" RenderReadOnlyAsDiv = "true" ></def:datafieldcontrol> </td> 
</tr>
<tr>
    <td>Other</td>
    <td> <def:datafieldcontrol runat="server" id="mbiother_score" DatabaseField="mbiother_score" IsReadOnly="true"  ShowFieldLabel="false"    FieldLabelWidth="50px" FieldTextBoxWidth="40px" RenderReadOnlyAsDiv = "true" ></def:datafieldcontrol> </td> 
    <td></td> 
    <td></td> 
    <td></td> 
</tr>
<tr>
<td><b>MALADAPTIVE</b></td>
<td> <b><def:datafieldcontrol runat="server" id="mbi_total" DatabaseField="mbi_total" IsReadOnly="true"  ShowFieldLabel="false"    FieldLabelWidth="50px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="50" RenderReadOnlyAsDiv = "true" ></def:datafieldcontrol> </b></td> 
<td> <b><def:datafieldcontrol runat="server" id="mbi_totala" DatabaseField="mbi_totala" IsReadOnly="true"  ShowFieldLabel="false"    FieldLabelWidth="50px" FieldTextBoxWidth="40px" RenderReadOnlyAsDiv = "true" ></def:datafieldcontrol> </b></td> 
<td> <b><def:datafieldcontrol runat="server" id="mbi_totalc" DatabaseField="mbi_totalc" IsReadOnly="true"  ShowFieldLabel="false"    FieldLabelWidth="50px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="50" RenderReadOnlyAsDiv = "true" ></def:datafieldcontrol> </b></td> 
<td> <b><def:datafieldcontrol runat="server" id="mbi_totale" DatabaseField="mbi_totale" IsReadOnly="true"  ShowFieldLabel="false"    FieldLabelWidth="50px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="50" RenderReadOnlyAsDiv = "true" ></def:datafieldcontrol> </b></td> 
</tr>
</table>
<div class="main">
    <def:datafieldcontrol runat="server" id="mbiscrmsg" DatabaseField="mbiscrmsg" IsReadOnly="true" FieldLabelWidth="100px" FieldTextBoxWidth="250px" RenderReadOnlyAsDiv = "true" ></def:datafieldcontrol> </td> 
</div>

<div class="collection">
    <div class="main"><def:datafieldcontrol runat="server" id="Validity"  DatabaseField="Validity"  IsEntryField="true" IsEntryValueRequired="true" IsDoubleEntryField="true" FieldLabelWidth="100px" FieldTextBoxWidth="40px" FieldTextBoxMaxLength="50" ></def:datafieldcontrol></div>
    <div class="key"><def:ValueSetLabel ID="ValueSetLabel_Validity" runat="server"  DatabaseField="Validity"></def:ValueSetLabel></div>
</div>
<div class="main"><def:datafieldcontrol runat="server" id="validitycomment"  DatabaseField="validitycomment"  IsEntryField="true" IsEntryValueRequired="false" IsDoubleEntryField="false" FieldLabelWidth="100px" FieldTextBoxWidth="400px" FieldTextBoxHeight="40px" FieldTextBoxTextMode="multiline"  FieldTextBoxMaxLength="200"></def:datafieldcontrol></div>

<!--
<h3 class="main"><a name="raw">Raw Scores</a></h3>
<h5 class="main"><font color="red">Enter raw scores here. </font> </h5>
<div class="main"><font color="darkred">Enter -999 when subdomain not administered (or is invalid due to 3 or more DK). </font></div>
<table class="main" border="1px">
<tr>
    <td><u>Subdomain<br/><i><font color="blue">(click&nbsp;to&nbsp;jump&nbsp;to&nbsp;section)</font></i></u></td>
    <td><u>Raw&nbsp;Score</u></td>
    <td><u>Compare raw scores<br/>(Hand&nbsp;entered&nbsp;vs.&nbsp;calculated)</u></td>
</tr>
<tr>
    <td><a href="#intern"><font color="blue">Internalizing</font></a></td>
    <td><def:datafieldcontrol runat="server" id="import_intern_raw"  DatabaseField="import_intern_raw"  IsEntryField="true" IsEntryValueRequired="true" IsDoubleEntryField="true"  ShowFieldLabel="false"    FieldLabelWidth="50px" FieldTextBoxWidth="40px" FieldTextBoxMaxLength="50"  ></def:datafieldcontrol> </td> 
    <td></td> 
</tr>
<tr>
    <td><a href="#extern"><font color="blue">Externalizing</font></a></td>
    <td><def:datafieldcontrol runat="server" id="import_extern_raw"  DatabaseField="import_extern_raw"  IsEntryField="true" IsEntryValueRequired="true" IsDoubleEntryField="true"  ShowFieldLabel="false"    FieldLabelWidth="50px" FieldTextBoxWidth="40px" FieldTextBoxMaxLength="50"  ></def:datafieldcontrol> </td> 
    <td></td> 
</tr>
</table>
-->

<br/>
<h5 class="main"><font color="red">Enter item scores here. </font></h5>
<h3 class="main">Maladaptive Behavior Index</h3>
<h4 class="main"><a name="intern">Internalizing</a></h4>
<div class="collection">
    <div class="main">
        <def:datafieldcontrol runat="server" id="mbiinternalizing_1s" DatabaseField="mbiinternalizing_1s" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="400px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
        <def:datafieldcontrol runat="server" id="mbiinternalizing_2s" DatabaseField="mbiinternalizing_2s" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="400px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
        <def:datafieldcontrol runat="server" id="mbiinternalizing_3s" DatabaseField="mbiinternalizing_3s" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="400px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
        <def:datafieldcontrol runat="server" id="mbiinternalizing_4s" DatabaseField="mbiinternalizing_4s" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="400px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
        <def:datafieldcontrol runat="server" id="mbiinternalizing_5s" DatabaseField="mbiinternalizing_5s" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="400px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
        <def:datafieldcontrol runat="server" id="mbiinternalizing_6s" DatabaseField="mbiinternalizing_6s" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="400px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
        <def:datafieldcontrol runat="server" id="mbiinternalizing_7s" DatabaseField="mbiinternalizing_7s" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="400px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
        <def:datafieldcontrol runat="server" id="mbiinternalizing_8s" DatabaseField="mbiinternalizing_8s" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="400px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
        <def:datafieldcontrol runat="server" id="mbiinternalizing_9s" DatabaseField="mbiinternalizing_9s" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="400px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
        <def:datafieldcontrol runat="server" id="mbiinternalizing_10s" DatabaseField="mbiinternalizing_10s" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="400px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
        <def:datafieldcontrol runat="server" id="mbiinternalizing_11s" DatabaseField="mbiinternalizing_11s" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="400px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    </div>
    <div class="key"><def:ValueSetLabel ID="ValueSetLabel_mbiinternalizing_1s" runat="server"  DatabaseField="mbiinternalizing_1s"></def:ValueSetLabel></div>
    <div class="continue" style="padding-left:25px"><a href="#raw">Jump to raw scores</a></div>
</div>
<div class="main"><def:datafieldcontrol runat="server" id="mbiinternalizing_notes" DatabaseField="mbiinternalizing_notes" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="200px" FieldTextBoxWidth="400px" FieldTextBoxHeight="40px" FieldTextBoxTextMode="multiline" FieldTextBoxMaxLength="200"></def:datafieldcontrol></div>
<h4 class="main"><a name="extern">Externalizing</a></h4>
<div class="collection">
    <div class="main">
        <def:datafieldcontrol runat="server" id="mbiexternalizing_1s" DatabaseField="mbiexternalizing_1s" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="400px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
        <def:datafieldcontrol runat="server" id="mbiexternalizing_2s" DatabaseField="mbiexternalizing_2s" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="400px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
        <def:datafieldcontrol runat="server" id="mbiexternalizing_3s" DatabaseField="mbiexternalizing_3s" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="400px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
        <def:datafieldcontrol runat="server" id="mbiexternalizing_4s" DatabaseField="mbiexternalizing_4s" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="400px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
        <def:datafieldcontrol runat="server" id="mbiexternalizing_5s" DatabaseField="mbiexternalizing_5s" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="400px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
        <def:datafieldcontrol runat="server" id="mbiexternalizing_6s" DatabaseField="mbiexternalizing_6s" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="400px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
        <def:datafieldcontrol runat="server" id="mbiexternalizing_7s" DatabaseField="mbiexternalizing_7s" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="400px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
        <def:datafieldcontrol runat="server" id="mbiexternalizing_8s" DatabaseField="mbiexternalizing_8s" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="400px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
        <def:datafieldcontrol runat="server" id="mbiexternalizing_9s" DatabaseField="mbiexternalizing_9s" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="400px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
        <def:datafieldcontrol runat="server" id="mbiexternalizing_10s" DatabaseField="mbiexternalizing_10s" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="400px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    </div>
    <div class="key"><def:ValueSetLabel ID="ValueSetLabel_mbiexternalizing_1s" runat="server"  DatabaseField="mbiexternalizing_1s"></def:ValueSetLabel></div>
    <div class="continue" style="padding-left:25px"><a href="#raw">Jump to raw scores</a></div>
</div>
<div class="main"><def:datafieldcontrol runat="server" id="mbiexternalizing_notes" DatabaseField="mbiexternalizing_notes" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="200px" FieldTextBoxWidth="400px" FieldTextBoxHeight="40px" FieldTextBoxTextMode="multiline" FieldTextBoxMaxLength="200"></def:datafieldcontrol></div>
<h4 class="main"><a name="other">Other</a></h4>
<div class="collection">
    <div class="main">
        <def:datafieldcontrol runat="server" id="mbiother_1s" DatabaseField="mbiother_1s" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="400px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
        <def:datafieldcontrol runat="server" id="mbiother_2s" DatabaseField="mbiother_2s" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="400px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
        <def:datafieldcontrol runat="server" id="mbiother_3s" DatabaseField="mbiother_3s" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="400px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
        <def:datafieldcontrol runat="server" id="mbiother_4s" DatabaseField="mbiother_4s" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="400px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
        <def:datafieldcontrol runat="server" id="mbiother_5s" DatabaseField="mbiother_5s" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="400px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
        <def:datafieldcontrol runat="server" id="mbiother_6s" DatabaseField="mbiother_6s" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="400px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
        <def:datafieldcontrol runat="server" id="mbiother_7s" DatabaseField="mbiother_7s" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="400px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
        <def:datafieldcontrol runat="server" id="mbiother_8s" DatabaseField="mbiother_8s" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="400px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
        <def:datafieldcontrol runat="server" id="mbiother_9s" DatabaseField="mbiother_9s" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="400px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
        <def:datafieldcontrol runat="server" id="mbiother_10s" DatabaseField="mbiother_10s" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="400px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
        <def:datafieldcontrol runat="server" id="mbiother_11s" DatabaseField="mbiother_11s" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="400px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
        <def:datafieldcontrol runat="server" id="mbiother_12s" DatabaseField="mbiother_12s" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="400px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
        <def:datafieldcontrol runat="server" id="mbiother_13s" DatabaseField="mbiother_13s" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="400px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
        <def:datafieldcontrol runat="server" id="mbiother_14s" DatabaseField="mbiother_14s" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="400px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
        <def:datafieldcontrol runat="server" id="mbiother_15s" DatabaseField="mbiother_15s" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="400px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    </div>
    <div class="key"><def:ValueSetLabel ID="ValueSetLabel_mbiother_1s" runat="server"  DatabaseField="mbiother_1s"></def:ValueSetLabel></div>
    <div class="continue" style="padding-left:25px"><a href="#raw">Jump to raw scores</a></div>
</div>
<div class="main"><def:datafieldcontrol runat="server" id="mbiother_notes" DatabaseField="mbiother_notes" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="200px" FieldTextBoxWidth="400px" FieldTextBoxHeight="40px" FieldTextBoxTextMode="multiline" FieldTextBoxMaxLength="200"></def:datafieldcontrol></div>
<h4 class="main"><a name="critical">Critical Items</a></h4>
<div class="collection">
<table class="main" border="0" cellspacing="0">
<tr>
    <td style="padding:0px 25px 0px 0px" align="right"><def:ValueSetLabel ID="ValueSetLabel_mbcriticalitems_1" runat="server"  DatabaseField="mbcriticalitems_1"></def:ValueSetLabel></td>
    <td align="right"><def:ValueSetLabel ID="ValueSetLabel_mbcriticalitems_1b" runat="server"  DatabaseField="mbcriticalitems_1b"></def:ValueSetLabel></td>
</tr>
<tr>
    <td style="padding:0px 25px 0px 0px"><def:datafieldcontrol runat="server" id="mbcriticalitems_1" DatabaseField="mbcriticalitems_1" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="400px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td align="center"><def:datafieldcontrol runat="server" id="mbcriticalitems_1b" DatabaseField="mbcriticalitems_1b" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
</tr>
<tr>
    <td style="padding:0px 25px 0px 0px"><def:datafieldcontrol runat="server" id="mbcriticalitems_2" DatabaseField="mbcriticalitems_2" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="400px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td align="center"><def:datafieldcontrol runat="server" id="mbcriticalitems_2b" DatabaseField="mbcriticalitems_2b" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
</tr>
<tr>
    <td style="padding:0px 25px 0px 0px"><def:datafieldcontrol runat="server" id="mbcriticalitems_3" DatabaseField="mbcriticalitems_3" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="400px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td align="center"><def:datafieldcontrol runat="server" id="mbcriticalitems_3b" DatabaseField="mbcriticalitems_3b" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
</tr>
<tr>
    <td style="padding:0px 25px 0px 0px"><def:datafieldcontrol runat="server" id="mbcriticalitems_4" DatabaseField="mbcriticalitems_4" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="400px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td align="center"><def:datafieldcontrol runat="server" id="mbcriticalitems_4b" DatabaseField="mbcriticalitems_4b" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
</tr>
<tr>
    <td style="padding:0px 25px 0px 0px"><def:datafieldcontrol runat="server" id="mbcriticalitems_5" DatabaseField="mbcriticalitems_5" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="400px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td align="center"><def:datafieldcontrol runat="server" id="mbcriticalitems_5b" DatabaseField="mbcriticalitems_5b" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
</tr>
<tr>
    <td style="padding:0px 25px 0px 0px"><def:datafieldcontrol runat="server" id="mbcriticalitems_6" DatabaseField="mbcriticalitems_6" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="400px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td align="center"><def:datafieldcontrol runat="server" id="mbcriticalitems_6b" DatabaseField="mbcriticalitems_6b" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
</tr>
<tr>
    <td style="padding:0px 25px 0px 0px"><def:datafieldcontrol runat="server" id="mbcriticalitems_7" DatabaseField="mbcriticalitems_7" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="400px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td align="center"><def:datafieldcontrol runat="server" id="mbcriticalitems_7b" DatabaseField="mbcriticalitems_7b" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
</tr>
<tr>
    <td style="padding:0px 25px 0px 0px"><def:datafieldcontrol runat="server" id="mbcriticalitems_8" DatabaseField="mbcriticalitems_8" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="400px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td align="center"><def:datafieldcontrol runat="server" id="mbcriticalitems_8b" DatabaseField="mbcriticalitems_8b" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
</tr>
<tr>
    <td style="padding:0px 25px 0px 0px"><def:datafieldcontrol runat="server" id="mbcriticalitems_9" DatabaseField="mbcriticalitems_9" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="400px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td align="center"><def:datafieldcontrol runat="server" id="mbcriticalitems_9b" DatabaseField="mbcriticalitems_9b" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
</tr>
<tr>
    <td style="padding:0px 25px 0px 0px"><def:datafieldcontrol runat="server" id="mbcriticalitems_10" DatabaseField="mbcriticalitems_10" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="400px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td align="center"><def:datafieldcontrol runat="server" id="mbcriticalitems_10b" DatabaseField="mbcriticalitems_10b" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
</tr>
<tr>
    <td style="padding:0px 25px 0px 0px"><def:datafieldcontrol runat="server" id="mbcriticalitems_11" DatabaseField="mbcriticalitems_11" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="400px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td align="center"><def:datafieldcontrol runat="server" id="mbcriticalitems_11b" DatabaseField="mbcriticalitems_11b" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
</tr>
<tr>
    <td style="padding:0px 25px 0px 0px"><def:datafieldcontrol runat="server" id="mbcriticalitems_12" DatabaseField="mbcriticalitems_12" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="400px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td align="center"><def:datafieldcontrol runat="server" id="mbcriticalitems_12b" DatabaseField="mbcriticalitems_12b" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
</tr>
<tr>
    <td style="padding:0px 25px 0px 0px"><def:datafieldcontrol runat="server" id="mbcriticalitems_13" DatabaseField="mbcriticalitems_13" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="400px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td align="center"><def:datafieldcontrol runat="server" id="mbcriticalitems_13b" DatabaseField="mbcriticalitems_13b" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
</tr>
<tr>
    <td style="padding:0px 25px 0px 0px"><def:datafieldcontrol runat="server" id="mbcriticalitems_14" DatabaseField="mbcriticalitems_14" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="400px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td align="center"><def:datafieldcontrol runat="server" id="mbcriticalitems_14b" DatabaseField="mbcriticalitems_14b" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="0px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
</tr>
</table>
    <div class="continue" style="padding-left:25px"><a href="#raw">Jump to raw scores</a></div>
</div>
<div class="main"><def:datafieldcontrol runat="server" id="mbcriticalitems_notes" DatabaseField="mbcriticalitems_notes" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="200px" FieldTextBoxWidth="400px" FieldTextBoxHeight="40px" FieldTextBoxTextMode="multiline" FieldTextBoxMaxLength="200"></def:datafieldcontrol></div>
</asp:panel>
<div class="main">
    <def:datafieldcontrol runat="server" id="created" DatabaseField="created" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="300px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="createdBy" DatabaseField="createdBy" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="300px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="50"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="updated" DatabaseField="updated" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="300px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="updatedBy" DatabaseField="updatedBy" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="300px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="50"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="scored" DatabaseField="scored" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="300px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="scoredBy" DatabaseField="scoredBy" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="300px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="50"></def:datafieldcontrol>
</div>
</asp:Content>
