<%@ Register TagPrefix="def" Namespace="DataEntryFramework3" %> 
<%@ Page language="c#" MasterPageFile="~/UWAC.master"  Title="DSM_IV Data Entry" %>
<asp:Content ID="Content1" ContentPlaceHolderID="oBodyPlaceHolder" runat="server">
<def:dataentrycontroller id="DataEntryController1" runat="server" DatabaseTable="ALL_DSM_IV" >
</def:dataentrycontroller>
<def:datafieldcontrol runat="server" id="id" DatabaseField="id"  IsInsertField="true"   FieldLabelWidth="300px "></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="indexnum" DatabaseField="indexnum"  IsInsertField="true"   FieldLabelWidth="300px "></def:datafieldcontrol>

<def:datafieldcontrol runat="server" id="Clinician" DatabaseField="DSMIV_CLIN"  IsInsertField="true"  FieldLabelWidth="300px "></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="DateAdministered" DatabaseField="DSMIV_DATE"  IsInsertField="true"  FieldLabelWidth="300px "></def:datafieldcontrol>
<asp:panel id="mainPanel" runat="server">
<p>
    <asp:Label ID="Label1" runat="server" Text="Please enter a 1 for Yes, 0 for No, -1 for Not Applicable (due to age, language, or similar factors) and -9 if the value is missing."
        ForeColor="Blue" Font-Italic="true"></asp:Label>
</p>
<strong>1. Qualitative impairment in social interaction, as indicated by:</strong>
<def:datafieldcontrol runat="server" id="DSMIV_SOC1" DatabaseField="DSMIV_SOC1"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="200px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="DSMIV_SOC2" DatabaseField="DSMIV_SOC2"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="200px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="DSMIV_SOC3" DatabaseField="DSMIV_SOC3"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="200px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="DSMIV_SOC4" DatabaseField="DSMIV_SOC4"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="200px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<br />
<strong>2. Qualitative impairments in communication, as indicated by:</strong>
<def:datafieldcontrol runat="server" id="DSMIV_COM1" DatabaseField="DSMIV_COM1"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="200px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="DSMIV_COM2" DatabaseField="DSMIV_COM2"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="200px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="DSMIV_COM3" DatabaseField="DSMIV_COM3"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="200px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="DSMIV_COM4" DatabaseField="DSMIV_COM4"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="200px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<br />
<strong>3. Restricted repetitive and stereotyped patterns of behavior, interests and activities, as indicated by:</strong>
<def:datafieldcontrol runat="server" id="DSMIV_REP1" DatabaseField="DSMIV_REP1"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="200px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="DSMIV_REP2" DatabaseField="DSMIV_REP2"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="200px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="DSMIV_REP3" DatabaseField="DSMIV_REP3"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="200px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="DSMIV_REP4" DatabaseField="DSMIV_REP4"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="200px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<br />
<strong>Diagnostic Consensus</strong>
<table border="0" cellpadding="5" cellspacing="0">
    <tr>
        <td>
            <def:datafieldcontrol runat="server" id="DSMIV_ASD" DatabaseField="DSMIV_ASD"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="200px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
            <def:datafieldcontrol runat="server" id="DSMIV_PDD" DatabaseField="DSMIV_PDD"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="200px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
              <br /><br />
        </td>
        <td>
            <def:ValueSetLabel ID="ValueSetLabel_DSMASD" runat="server"  DatabaseField="DSMIV_ASD" ForeColor="Blue"></def:ValueSetLabel>
            <br /><br />
        </td>
    </tr>
        <tr>
        <td>
            <def:datafieldcontrol runat="server" id="DSMIV_dx" DatabaseField="DSMIV_dx"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="200px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
        </td>
        <td>
            <def:ValueSetLabel ID="ValueSetLabel_DSMdx" runat="server"  DatabaseField="DSMIV_dx"  ForeColor="Blue"></def:ValueSetLabel>
        </td>
    </tr>

    <tr>
        <td>
            <def:datafieldcontrol runat="server" id="DSMIV_CON" DatabaseField="DSMIV_CON"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="200px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
        </td>
        <td>
            <def:ValueSetLabel ID="ValueSetLabel_DSMCOM" runat="server"  DatabaseField="DSMIV_CON" ForeColor="Blue"></def:ValueSetLabel>
        </td>
    </tr>
</table> ...   
<def:datafieldcontrol runat="server" id="DSMIV_COMM" DatabaseField="DSMIV_COMM"  IsEntryField="true" IsDoubleEntryField="false"  FieldLabelWidth="200px" FieldTextBoxWidth = "500px" FieldTextBoxHeight = "100px" FieldTextBoxTextMode="MultiLine" FieldTextBoxMaxLength="2000"></def:datafieldcontrol>
<br />
<def:datafieldcontrol runat="server" id="DSMIV_ASS" DatabaseField="DSMIV_ASS"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="200px" FieldTextBoxWidth="50px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="DSMIV_ASSD" DatabaseField="DSMIV_ASSD"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="200px" FieldTextBoxWidth="100px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="DSMIV_CC1" DatabaseField="DSMIV_CC1"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="200px" FieldTextBoxWidth="50px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="DSMIV_CC1D" DatabaseField="DSMIV_CC1D"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="200px" FieldTextBoxWidth="100px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="DSMIV_CC2" DatabaseField="DSMIV_CC2"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="200px" FieldTextBoxWidth="50px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="DSMIV_CC2D" DatabaseField="DSMIV_CC2D"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="200px" FieldTextBoxWidth="100px"></def:datafieldcontrol>
</asp:panel>
<br />
<def:datafieldcontrol runat="server" id="created" DatabaseField="created"  IsReadOnly="true" RenderReadOnlyAsDiv="true"   FieldLabelWidth="300px "></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="createdBy" DatabaseField="createdBy"  IsReadOnly="true" RenderReadOnlyAsDiv="true"   FieldLabelWidth="300px "></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="updated" DatabaseField="updated"  IsReadOnly="true" RenderReadOnlyAsDiv="true"   FieldLabelWidth="300px "></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="updatedBy" DatabaseField="updatedBy"  IsReadOnly="true" RenderReadOnlyAsDiv="true"   FieldLabelWidth="300px "></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="scored" DatabaseField="scored"  IsReadOnly="true" RenderReadOnlyAsDiv="true"   FieldLabelWidth="300px "></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="scoredBy" DatabaseField="scoredBy"  IsReadOnly="true" RenderReadOnlyAsDiv="true"   FieldLabelWidth="300px "></def:datafieldcontrol>
</asp:Content>
