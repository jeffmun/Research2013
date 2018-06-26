<%@ Register TagPrefix="def" Namespace="DataEntryFramework3" %> 
<%@ Page language="c#" MasterPageFile="~/UWAC.master"  Title="DSM_V Data Entry" %>
<asp:Content ID="Content1" ContentPlaceHolderID="oBodyPlaceHolder" runat="server">

<def:dataentrycontroller id="DataEntryController1" runat="server" DatabaseTable="ALL_DSM_V" PrimaryKeyField="dsmv_pk">
</def:dataentrycontroller>
<def:datafieldcontrol runat="server" id="id" DatabaseField="id" IsInsertField="true" FieldLabelWidth="300px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="15"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="indexnum" DatabaseField="indexnum" IsInsertField="true" FieldTextBoxTextDefault="1" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>

<br />

<def:datafieldcontrol runat="server" id="dsmv_date" DatabaseField="dsmv_date" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FormatString="{0:d}"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="dsmv_clin" DatabaseField="dsmv_clin" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="300px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="20"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="dsmv_agemos" DatabaseField="dsmv_agemos" IsReadOnly="true" RenderReadOnlyAsDiv="true"  FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>

<br/>
<b><u>Social Communication</u></b>

        <table>
        <tr>
            <td>
<def:datafieldcontrol runat="server" id="dsmv_a1" DatabaseField="dsmv_a1" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>

<def:datafieldcontrol runat="server" id="dsmv_a2" DatabaseField="dsmv_a2" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="dsmv_a3" DatabaseField="dsmv_a3" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>

            </td>
            <td style="vertical-align:top" rowspan="3">
                <def:ValueSetLabel runat="server" DatabaseField="dsmv_a1" ID="vs_dsmv_a1"></def:ValueSetLabel>
            </td>
        </tr>
    </table>

<def:datafieldcontrol runat="server" id="dsmv_crit_a" DatabaseField="dsmv_crit_a" IsReadOnly="true" RenderReadOnlyAsDiv="true"  FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>

<br/><br/>
<b><u>Restricted, repetitive behavior</u></b>

<def:datafieldcontrol runat="server" id="dsmv_b1" DatabaseField="dsmv_b1" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="dsmv_b2" DatabaseField="dsmv_b2" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="dsmv_b3" DatabaseField="dsmv_b3" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="dsmv_b4" DatabaseField="dsmv_b4" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="dsmv_crit_b" DatabaseField="dsmv_crit_b" IsReadOnly="true" RenderReadOnlyAsDiv="true"  FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<br/><br/>
<def:datafieldcontrol runat="server" id="dsmv_crit_c" DatabaseField="dsmv_crit_c" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>

<br/>
<def:datafieldcontrol runat="server" id="dsmv_crit_d" DatabaseField="dsmv_crit_d" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<br/>
<def:datafieldcontrol runat="server" id="dsmv_crit_e" DatabaseField="dsmv_crit_e" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<br/>
<def:datafieldcontrol runat="server" id="dsmv_asddx" DatabaseField="dsmv_asddx" IsReadOnly="true" RenderReadOnlyAsDiv="true"  FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="dsmv_asddxtxt" DatabaseField="dsmv_asddxtxt" IsReadOnly="true" RenderReadOnlyAsDiv="true"  FieldLabelWidth="300px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="10"></def:datafieldcontrol>
<br/><br/>
    <table>
        <tr>
            <td>
<def:datafieldcontrol runat="server" id="dsmv_sev_soc" DatabaseField="dsmv_sev_soc" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="dsmv_sev_rrb" DatabaseField="dsmv_sev_rrb" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>

            </td>
            <td style="vertical-align:top" >
                <def:ValueSetLabel runat="server" DatabaseField="dsmv_sev_soc" ID="vs_dsmv_sev_soc"></def:ValueSetLabel>
            </td>
        </tr>
        <tr>
            <td style="vertical-align:top">
<def:datafieldcontrol runat="server" id="dsmv_confrat" DatabaseField="dsmv_confrat" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>

            </td>
            <td style="vertical-align:top">
                                <def:ValueSetLabel runat="server" DatabaseField="dsmv_confrat" ID="vs_dsmv_confrat"></def:ValueSetLabel>

            </td>
        </tr>
    </table>
<def:datafieldcontrol runat="server" id="dsmv_cmnts" DatabaseField="dsmv_cmnts" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="300px" FieldTextBoxWidth = "500px" FieldTextBoxHeight = "100px"  FieldTextBoxTextMode="multiline" FieldTextBoxMaxLength="2000"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="dsmv_scrmsg" DatabaseField="dsmv_scrmsg" IsReadOnly="true" RenderReadOnlyAsDiv="true"  FieldLabelWidth="300px" FieldTextBoxWidth="500px" FieldTextBoxHeight="50px" FieldTextBoxTextMode="multiline" ></def:datafieldcontrol>
<br/>
<br/>
<def:datafieldcontrol runat="server" id="created" DatabaseField="created" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="300px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="createdBy" DatabaseField="createdBy" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="300px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="50"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="updated" DatabaseField="updated" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="300px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="updatedBy" DatabaseField="updatedBy" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="300px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="50"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="scored" DatabaseField="scored" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="300px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="scoredBy" DatabaseField="scoredBy" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="300px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="50"></def:datafieldcontrol>
</asp:Content>
