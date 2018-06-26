<%@ Register TagPrefix="def" Namespace="DataEntryFramework3" %> 
<%@ Page language="c#" MasterPageFile="~/UWAC.master"  Title="DSM_IV Data Entry" %>
<asp:Content ID="Content1" ContentPlaceHolderID="oBodyPlaceHolder" runat="server">
<def:dataentrycontroller id="DataEntryController1" runat="server" DatabaseTable="ALL_DSM_IV" >
</def:dataentrycontroller>
<def:datafieldcontrol runat="server" id="id" DatabaseField="id"  IsInsertField="true"   FieldLabelWidth="300px "></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="indexnum" DatabaseField="indexnum"  IsInsertField="true"   FieldLabelWidth="300px "></def:datafieldcontrol>

<def:datafieldcontrol runat="server" id="Clinician" DatabaseField="DSMCLIN"  IsInsertField="true"  FieldLabelWidth="300px "></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="DateAdministered" DatabaseField="DSMDATE"  IsInsertField="true"  FieldLabelWidth="300px "></def:datafieldcontrol>
<asp:panel id="mainPanel" runat="server">
<p><em>Please enter a 1 for Yes, 0 for No, -1 for Not Applicable (due to age, language, or similar factors) and -9 if the value is missing.</em></p>
<strong>1. Qualitative impairment in social interaction, as indicated by:</strong>
<def:datafieldcontrol runat="server" id="DSMSOC1" DatabaseField="DSMSOC1"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="200px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="DSMSOC2" DatabaseField="DSMSOC2"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="200px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="DSMSOC3" DatabaseField="DSMSOC3"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="200px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="DSMSOC4" DatabaseField="DSMSOC4"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="200px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<br />
<strong>2. Qualitative impairments in communication, as indicated by:</strong>
<def:datafieldcontrol runat="server" id="DSMCOM1" DatabaseField="DSMCOM1"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="200px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="DSMCOM2" DatabaseField="DSMCOM2"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="200px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="DSMCOM3" DatabaseField="DSMCOM3"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="200px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="DSMCOM4" DatabaseField="DSMCOM4"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="200px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<br />
<strong>3. Restricted repetitive and stereotyped patterns of behavior, interests and activities, as indicated by:</strong>
<def:datafieldcontrol runat="server" id="DSMREP1" DatabaseField="DSMREP1"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="200px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="DSMREP2" DatabaseField="DSMREP2"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="200px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="DSMREP3" DatabaseField="DSMREP3"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="200px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="DSMREP4" DatabaseField="DSMREP4"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="200px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<br />
<strong>Diagnostic Consensus</strong>
<table border="0" cellpadding="5" cellspacing="0">
    <tr>
        <td>
            <def:datafieldcontrol runat="server" id="DSMASD" DatabaseField="DSMASD"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="200px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
            <def:datafieldcontrol runat="server" id="DSMPDD" DatabaseField="DSMPDD"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="200px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
        </td>
        <td>
            <def:ValueSetLabel ID="ValueSetLabel_DSMASD" runat="server"  DatabaseField="DSMASD"></def:ValueSetLabel>
        </td>
    </tr>
    <tr>
        <td>
            <def:datafieldcontrol runat="server" id="DSMCON" DatabaseField="DSMCON"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="200px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
        </td>
        <td>
            <def:ValueSetLabel ID="ValueSetLabel_DSMCOM" runat="server"  DatabaseField="DSMCON"></def:ValueSetLabel>
        </td>
    </tr>
</table>    
<def:datafieldcontrol runat="server" id="DSMCOMM" DatabaseField="DSMCOMM"  IsEntryField="true" IsDoubleEntryField="false"  FieldLabelWidth="200px" FieldTextBoxWidth = "500px" FieldTextBoxHeight = "100px" FieldTextBoxTextMode="MultiLine"></def:datafieldcontrol>
<br />
<def:datafieldcontrol runat="server" id="DSMASS" DatabaseField="DSMASS"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="200px" FieldTextBoxWidth="50px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="DSMASSD" DatabaseField="DSMASSD"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="200px" FieldTextBoxWidth="100px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="DSMCC1" DatabaseField="DSMCC1"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="200px" FieldTextBoxWidth="50px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="DSMCC1D" DatabaseField="DSMCC1D"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="200px" FieldTextBoxWidth="100px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="DSMCC2" DatabaseField="DSMCC2"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="200px" FieldTextBoxWidth="50px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="DSMCC2D" DatabaseField="DSMCC2D"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="200px" FieldTextBoxWidth="100px"></def:datafieldcontrol>
</asp:panel>
<br />
<def:datafieldcontrol runat="server" id="created" DatabaseField="created"  IsReadOnly="true" RenderReadOnlyAsDiv="true"   FieldLabelWidth="300px "></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="createdBy" DatabaseField="createdBy"  IsReadOnly="true" RenderReadOnlyAsDiv="true"   FieldLabelWidth="300px "></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="updated" DatabaseField="updated"  IsReadOnly="true" RenderReadOnlyAsDiv="true"   FieldLabelWidth="300px "></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="updatedBy" DatabaseField="updatedBy"  IsReadOnly="true" RenderReadOnlyAsDiv="true"   FieldLabelWidth="300px "></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="scored" DatabaseField="scored"  IsReadOnly="true" RenderReadOnlyAsDiv="true"   FieldLabelWidth="300px "></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="scoredBy" DatabaseField="scoredBy"  IsReadOnly="true" RenderReadOnlyAsDiv="true"   FieldLabelWidth="300px "></def:datafieldcontrol>
</asp:Content>
