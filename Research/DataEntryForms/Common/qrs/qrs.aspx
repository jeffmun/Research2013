<%@ Register TagPrefix="def" Namespace="DataEntryFramework3" %> 
<%@ Page language="c#" MasterPageFile="~/UWAC.master"  Title="QRS Data Entry" %>
<asp:Content ID="Content1" ContentPlaceHolderID="oBodyPlaceHolder" runat="server">

<def:dataentrycontroller id="DataEntryController1" runat="server" DatabaseTable="all_qrs" PrimaryKeyField = "qrs_pk">
</def:dataentrycontroller>
<div class="main">
    <def:datafieldcontrol runat="server" id="id" DatabaseField="id" IsInsertField="true" FieldLabelWidth="200px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="15"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="indexnum" DatabaseField="indexnum" IsInsertField="true" FieldTextBoxTextDefault="1" FieldLabelWidth="200px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="qrsdate" DatabaseField="qrsdate" FieldLabelText="Questionnaire Date" IsInsertField="true" FieldLabelWidth="200px"></def:datafieldcontrol>
</div>
<asp:panel id="mainPanel" runat="server">
<div class="main">
    <def:datafieldcontrol runat="server" id="qrsagemos" DatabaseField="qrsagemos" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="200px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="qrsageym" DatabaseField="qrsageym" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="200px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="10"></def:datafieldcontrol>
</div> 
<div class="collection">
    <div class="main"><def:datafieldcontrol runat="server" id="qrsresp" DatabaseField="qrsresp" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="200px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
    <div class="key"><def:ValueSetLabel ID="ValueSetLabel_qrsresp" runat="server"  DatabaseField="qrsresp" FontColor = "blue"></def:ValueSetLabel></div>
</div>
<div class="main">
    <def:datafieldcontrol runat="server" id="qrsrespt" DatabaseField="qrsrespt" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="200px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="50"></def:datafieldcontrol>
    <br /><br />
</div>
<div class="collection">
    <div class="main">
        <def:datafieldcontrol runat="server" id="qrs01" DatabaseField="qrs01" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="400px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
        <def:datafieldcontrol runat="server" id="qrs02" DatabaseField="qrs02" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="400px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
        <def:datafieldcontrol runat="server" id="qrs03" DatabaseField="qrs03" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="400px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
        <def:datafieldcontrol runat="server" id="qrs04" DatabaseField="qrs04" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="400px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
        <def:datafieldcontrol runat="server" id="qrs05" DatabaseField="qrs05" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="400px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
        <def:datafieldcontrol runat="server" id="qrs06" DatabaseField="qrs06" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="400px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
        <def:datafieldcontrol runat="server" id="qrs07" DatabaseField="qrs07" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="400px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
        <def:datafieldcontrol runat="server" id="qrs08" DatabaseField="qrs08" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="400px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
        <def:datafieldcontrol runat="server" id="qrs09" DatabaseField="qrs09" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="400px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
        <def:datafieldcontrol runat="server" id="qrs10" DatabaseField="qrs10" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="400px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
        <def:datafieldcontrol runat="server" id="qrs11" DatabaseField="qrs11" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="400px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
        <def:datafieldcontrol runat="server" id="qrs12" DatabaseField="qrs12" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="400px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
        <def:datafieldcontrol runat="server" id="qrs13" DatabaseField="qrs13" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="400px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
        <def:datafieldcontrol runat="server" id="qrs14" DatabaseField="qrs14" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="400px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
        <def:datafieldcontrol runat="server" id="qrs15" DatabaseField="qrs15" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="400px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
        <def:datafieldcontrol runat="server" id="qrs16" DatabaseField="qrs16" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="400px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
        <def:datafieldcontrol runat="server" id="qrs17" DatabaseField="qrs17" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="400px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
        <def:datafieldcontrol runat="server" id="qrs18" DatabaseField="qrs18" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="400px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
        <def:datafieldcontrol runat="server" id="qrs19" DatabaseField="qrs19" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="400px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
        <def:datafieldcontrol runat="server" id="qrs20" DatabaseField="qrs20" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="400px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    </div>
    <div class="key"><def:ValueSetLabel ID="ValueSetLabel_qrs01" runat="server"  DatabaseField="qrs01"  FontColor = "blue"></def:ValueSetLabel></div>
</div>
<div class="collection">
    <div class="main">
        <def:datafieldcontrol runat="server" id="qrs21" DatabaseField="qrs21" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="400px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
        <def:datafieldcontrol runat="server" id="qrs22" DatabaseField="qrs22" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="400px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
        <def:datafieldcontrol runat="server" id="qrs23" DatabaseField="qrs23" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="400px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
        <def:datafieldcontrol runat="server" id="qrs24" DatabaseField="qrs24" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="400px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
        <def:datafieldcontrol runat="server" id="qrs25" DatabaseField="qrs25" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="400px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
        <def:datafieldcontrol runat="server" id="qrs26" DatabaseField="qrs26" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="400px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
        <def:datafieldcontrol runat="server" id="qrs27" DatabaseField="qrs27" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="400px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
        <def:datafieldcontrol runat="server" id="qrs28" DatabaseField="qrs28" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="400px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
        <def:datafieldcontrol runat="server" id="qrs29" DatabaseField="qrs29" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="400px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
        <def:datafieldcontrol runat="server" id="qrs30" DatabaseField="qrs30" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="400px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
        <def:datafieldcontrol runat="server" id="qrs31" DatabaseField="qrs31" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="400px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
        <def:datafieldcontrol runat="server" id="qrs32" DatabaseField="qrs32" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="400px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
        <def:datafieldcontrol runat="server" id="qrs33" DatabaseField="qrs33" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="400px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
        <def:datafieldcontrol runat="server" id="qrs34" DatabaseField="qrs34" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="400px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
        <def:datafieldcontrol runat="server" id="qrs35" DatabaseField="qrs35" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="400px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
        <def:datafieldcontrol runat="server" id="qrs36" DatabaseField="qrs36" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="400px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
        <def:datafieldcontrol runat="server" id="qrs37" DatabaseField="qrs37" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="400px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
        <def:datafieldcontrol runat="server" id="qrs38" DatabaseField="qrs38" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="400px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
        <def:datafieldcontrol runat="server" id="qrs39" DatabaseField="qrs39" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="400px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
        <def:datafieldcontrol runat="server" id="qrs40" DatabaseField="qrs40" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="400px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    </div>
    <div class="key"><def:ValueSetLabel ID="ValueSetLabel_qrs21" runat="server"  DatabaseField="qrs21"  FontColor = "blue"></def:ValueSetLabel></div>
</div>
<div class="collection">
    <div class="main">
        <def:datafieldcontrol runat="server" id="qrs41" DatabaseField="qrs41" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="400px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
        <def:datafieldcontrol runat="server" id="qrs42" DatabaseField="qrs42" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="400px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
        <def:datafieldcontrol runat="server" id="qrs43" DatabaseField="qrs43" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="400px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
        <def:datafieldcontrol runat="server" id="qrs44" DatabaseField="qrs44" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="400px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
        <def:datafieldcontrol runat="server" id="qrs45" DatabaseField="qrs45" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="400px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
        <def:datafieldcontrol runat="server" id="qrs46" DatabaseField="qrs46" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="400px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
        <def:datafieldcontrol runat="server" id="qrs47" DatabaseField="qrs47" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="400px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
        <def:datafieldcontrol runat="server" id="qrs48" DatabaseField="qrs48" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="400px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
        <def:datafieldcontrol runat="server" id="qrs49" DatabaseField="qrs49" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="400px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
        <def:datafieldcontrol runat="server" id="qrs50" DatabaseField="qrs50" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="400px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
        <def:datafieldcontrol runat="server" id="qrs51" DatabaseField="qrs51" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="400px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
        <def:datafieldcontrol runat="server" id="qrs52" DatabaseField="qrs52" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="400px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
        <def:datafieldcontrol runat="server" id="qrs53" DatabaseField="qrs53" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="400px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
        <def:datafieldcontrol runat="server" id="qrs54" DatabaseField="qrs54" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="400px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
        <def:datafieldcontrol runat="server" id="qrs55" DatabaseField="qrs55" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="400px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
        <def:datafieldcontrol runat="server" id="qrs56" DatabaseField="qrs56" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="400px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
        <def:datafieldcontrol runat="server" id="qrs57" DatabaseField="qrs57" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="400px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
        <def:datafieldcontrol runat="server" id="qrs58" DatabaseField="qrs58" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="400px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
        <def:datafieldcontrol runat="server" id="qrs59" DatabaseField="qrs59" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="400px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
        <def:datafieldcontrol runat="server" id="qrs60" DatabaseField="qrs60" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="400px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    </div>
    <div class="key"><def:ValueSetLabel ID="ValueSetLabel_qrs41" runat="server"  DatabaseField="qrs41"  FontColor = "blue"></def:ValueSetLabel></div>
</div>
<div class="collection">
    <div class="main">
        <def:datafieldcontrol runat="server" id="qrs61" DatabaseField="qrs61" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="400px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
        <def:datafieldcontrol runat="server" id="qrs62" DatabaseField="qrs62" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="400px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
        <def:datafieldcontrol runat="server" id="qrs63" DatabaseField="qrs63" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="400px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
        <def:datafieldcontrol runat="server" id="qrs64" DatabaseField="qrs64" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="400px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
        <def:datafieldcontrol runat="server" id="qrs65" DatabaseField="qrs65" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="400px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
        <def:datafieldcontrol runat="server" id="qrs66" DatabaseField="qrs66" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="400px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
        <def:datafieldcontrol runat="server" id="qrs67" DatabaseField="qrs67" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="400px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
        <def:datafieldcontrol runat="server" id="qrs68" DatabaseField="qrs68" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="400px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
        <def:datafieldcontrol runat="server" id="qrs69" DatabaseField="qrs69" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="400px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
        <def:datafieldcontrol runat="server" id="qrs70" DatabaseField="qrs70" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="400px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
        <def:datafieldcontrol runat="server" id="qrs71" DatabaseField="qrs71" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="400px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
        <def:datafieldcontrol runat="server" id="qrs72" DatabaseField="qrs72" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="400px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
        <def:datafieldcontrol runat="server" id="qrs73" DatabaseField="qrs73" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="400px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
        <def:datafieldcontrol runat="server" id="qrs74" DatabaseField="qrs74" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="400px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
        <def:datafieldcontrol runat="server" id="qrs75" DatabaseField="qrs75" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="400px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
        <def:datafieldcontrol runat="server" id="qrs76" DatabaseField="qrs76" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="400px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
        <def:datafieldcontrol runat="server" id="qrs77" DatabaseField="qrs77" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="400px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
        <def:datafieldcontrol runat="server" id="qrs78" DatabaseField="qrs78" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="400px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    </div>
    <div class="key"><def:ValueSetLabel ID="ValueSetLabel_qrs61" runat="server"  DatabaseField="qrs61"  FontColor = "blue"></def:ValueSetLabel></div>
</div>
<div class="main"><def:datafieldcontrol runat="server" id="qrsCMNT" DatabaseField="qrsCMNT" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="400px" FieldTextBoxHeight="40px" FieldTextBoxTextMode="multiline" FieldTextBoxMaxLength="255"></def:datafieldcontrol></div>
<table border="1" cellpadding="5" cellspacing="0" style="margin-left:20px" class="main">
<thead>Scoring Results</thead>
<tr>
    <td>
    <def:datafieldcontrol runat="server" id="qrscc" DatabaseField="qrscc" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="qrscr" DatabaseField="qrscr" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="qrsdem" DatabaseField="qrsdem" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="qrsexs" DatabaseField="qrsexs" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="qrsfen" DatabaseField="qrsfen" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="qrsfsh" DatabaseField="qrsfsh" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="qrsmod" DatabaseField="qrsmod" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="qrspsx" DatabaseField="qrspsx" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="qrssac" DatabaseField="qrssac" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="qrssup" DatabaseField="qrssup" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="qrstot" DatabaseField="qrstot" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="qrsscrmsg" DatabaseField="qrsscrmsg" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="300px" FieldTextBoxWidth="400px" FieldTextBoxHeight="40px" FieldTextBoxTextMode="multiline" FieldTextBoxMaxLength="250"></def:datafieldcontrol>
    </td>
</tr>
</table>
</asp:panel>
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

