<%@ Register TagPrefix="def" Namespace="DataEntryFramework3" %> 
<%@ Page language="c#" MasterPageFile="~/UWAC.master"  Title="LearnOpp Data Entry" %>
<asp:Content ID="Content1" ContentPlaceHolderID="oBodyPlaceHolder" runat="server">

<def:dataentrycontroller id="DataEntryController1" runat="server" DatabaseTable="ALL_LearnOpp" PrimaryKeyField="lo_pk">
</def:dataentrycontroller>



<def:datafieldcontrol runat="server" id="id" DatabaseField="id" IsInsertField="true" FieldLabelWidth="250px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="15"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="indexnum" DatabaseField="indexnum" IsInsertField="true" FieldTextBoxTextDefault="1" FieldLabelWidth="250px" FieldTextBoxWidth="40px"></def:datafieldcontrol>


<def:datafieldcontrol runat="server" id="lo_recording_date" DatabaseField="lo_recording_date" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="100px"  FormatString="{0:d}"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="lo_timepoint" DatabaseField="lo_timepoint" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="100px" FieldTextBoxMaxLength="50"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="lo_weeknum" DatabaseField="lo_weeknum" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="100px" FieldTextBoxMaxLength="50"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="lo_parent" DatabaseField="lo_parent" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="300px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="50"></def:datafieldcontrol>

<def:datafieldcontrol runat="server" id="lo_notes" DatabaseField="lo_notes" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="250px" FieldTextBoxWidth="400px" FieldTextBoxHeight="40px" FieldTextBoxTextMode="multiline" FieldTextBoxMaxLength="250"></def:datafieldcontrol>
<br/>


<br/>

<def:datafieldcontrol runat="server" id="lo_agemos" DatabaseField="lo_agemos" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>


<table>
<tr>
<td align="right">  <asp:Label ID="Label1" runat="server" width="200Px" Text="Act 1: Toy Play" Font-Bold="true" Font-Underline="true"></asp:Label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
<td align="right">  <asp:Label ID="Label2" runat="server" width="200Px" Text="Act 2: Sensory Social Routine" Font-Bold="true" Font-Underline="true"></asp:Label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
<td align="right">  <asp:Label ID="Label3" runat="server" width="200Px" Text="Act 3: Other" Font-Bold="true" Font-Underline="true"></asp:Label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
</tr>
<tr>
<td style="vertical-align:top">
    <br /><br/>
    <def:datafieldcontrol runat="server" id="lo1_recording_date" DatabaseField="lo1_recording_date" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FormatString="{0:d}" ></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="lo1_weeknum" DatabaseField="lo1_weeknum" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="100px" FieldTextBoxMaxLength="50"></def:datafieldcontrol>
    <br />
    <def:datafieldcontrol runat="server" id="lo1_date_coded" DatabaseField="lo1_date_coded" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FormatString="{0:d}" ></def:datafieldcontrol>
    <table>
    <tr><td>
    <def:datafieldcontrol runat="server" id="lo1_timebeg1t" DatabaseField="lo1_timebeg1t" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxWidth = "80px" FieldLabelWidth="300px"  ></def:datafieldcontrol></td><td>
    <def:datafieldcontrol runat="server" id="lo1_timeend1t" DatabaseField="lo1_timeend1t" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxWidth = "80px" ShowFieldLabel="false"  ></def:datafieldcontrol></td><td>
    <def:datafieldcontrol runat="server" id="lo1_timemin1"  DatabaseField="lo1_timemin1"  IsReadOnly="true" RenderReadOnlyAsDiv="true"  FieldTextBoxWidth = "30px" ShowFieldLabel="false" Font-Color="Gray" ></def:datafieldcontrol></td></tr><tr><td>
    <def:datafieldcontrol runat="server" id="lo1_timebeg2t" DatabaseField="lo1_timebeg2t" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxWidth = "80px" FieldLabelWidth="300px"  ></def:datafieldcontrol></td><td>
    <def:datafieldcontrol runat="server" id="lo1_timeend2t" DatabaseField="lo1_timeend2t" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxWidth = "80px" ShowFieldLabel="false"  ></def:datafieldcontrol> </td><td>
    <def:datafieldcontrol runat="server" id="lo1_timemin2"  DatabaseField="lo1_timemin2"  IsReadOnly="true" RenderReadOnlyAsDiv="true"  FieldTextBoxWidth = "30px" ShowFieldLabel="false"  ForeColor="Gray"></def:datafieldcontrol></td></tr><tr><td>
    <def:datafieldcontrol runat="server" id="lo1_timebeg3t" DatabaseField="lo1_timebeg3t" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxWidth = "80px" FieldLabelWidth="300px" ></def:datafieldcontrol></td><td>
    <def:datafieldcontrol runat="server" id="lo1_timeend3t" DatabaseField="lo1_timeend3t" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxWidth = "80px" ShowFieldLabel="false" ></def:datafieldcontrol> </td><td>
    <def:datafieldcontrol runat="server" id="lo1_timemin3"  DatabaseField="lo1_timemin3"  IsReadOnly="true" RenderReadOnlyAsDiv="true"  FieldTextBoxWidth = "30px" ShowFieldLabel="false" ForeColor="Gray" ></def:datafieldcontrol></td></tr><tr><td>
    <def:datafieldcontrol runat="server" id="lo1_timebeg4t" DatabaseField="lo1_timebeg4t" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxWidth = "80px" FieldLabelWidth="300px" ></def:datafieldcontrol></td><td>
    <def:datafieldcontrol runat="server" id="lo1_timeend4t" DatabaseField="lo1_timeend4t" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxWidth = "80px" ShowFieldLabel="false" ></def:datafieldcontrol> </td><td>
    <def:datafieldcontrol runat="server" id="lo1_timemin4"  DatabaseField="lo1_timemin4"  IsReadOnly="true" RenderReadOnlyAsDiv="true"  FieldTextBoxWidth = "30px" ShowFieldLabel="false"  ></def:datafieldcontrol></td></tr><tr><td>
    <def:datafieldcontrol runat="server" id="lo1_timebeg5t" DatabaseField="lo1_timebeg5t" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxWidth = "80px" FieldLabelWidth="300px" ></def:datafieldcontrol></td><td>
    <def:datafieldcontrol runat="server" id="lo1_timeend5t" DatabaseField="lo1_timeend5t" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxWidth = "80px" ShowFieldLabel="false" ></def:datafieldcontrol> </td><td>
    <def:datafieldcontrol runat="server" id="lo1_timemin5"  DatabaseField="lo1_timemin5"  IsReadOnly="true" RenderReadOnlyAsDiv="true"  FieldTextBoxWidth = "30px" ShowFieldLabel="false"  ></def:datafieldcontrol></td></tr><tr><td>
    <def:datafieldcontrol runat="server" id="lo1_timebeg6t" DatabaseField="lo1_timebeg6t" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxWidth = "80px" FieldLabelWidth="300px" ></def:datafieldcontrol></td><td>
    <def:datafieldcontrol runat="server" id="lo1_timeend6t" DatabaseField="lo1_timeend6t" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxWidth = "80px" ShowFieldLabel="false" ></def:datafieldcontrol> </td><td>
    <def:datafieldcontrol runat="server" id="lo1_timemin6"  DatabaseField="lo1_timemin6"  IsReadOnly="true" RenderReadOnlyAsDiv="true"  FieldTextBoxWidth = "30px" ShowFieldLabel="false"  ></def:datafieldcontrol></td></tr><tr><td>
    <def:datafieldcontrol runat="server" id="lo1_timebeg7t" DatabaseField="lo1_timebeg7t" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxWidth = "80px" FieldLabelWidth="300px" ></def:datafieldcontrol></td><td>
    <def:datafieldcontrol runat="server" id="lo1_timeend7t" DatabaseField="lo1_timeend7t" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxWidth = "80px" ShowFieldLabel="false" ></def:datafieldcontrol> </td><td>
    <def:datafieldcontrol runat="server" id="lo1_timemin7"  DatabaseField="lo1_timemin7"  IsReadOnly="true" RenderReadOnlyAsDiv="true"  FieldTextBoxWidth = "30px" ShowFieldLabel="false"  ></def:datafieldcontrol></td></tr><tr><td>

    </table>
        <br/>
        <def:datafieldcontrol runat="server" id="lo1_durmins_manual" DatabaseField="lo1_durmins_manual"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>

        <def:datafieldcontrol runat="server" id="lo1_durmins" DatabaseField="lo1_durmins"  IsReadOnly="true" RenderReadOnlyAsDiv="true"  FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
        <def:datafieldcontrol runat="server" id="lo1_avgsuccmin" DatabaseField="lo1_avgsuccmin"  IsReadOnly="true" RenderReadOnlyAsDiv="true"  FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <br/>

        <def:datafieldcontrol runat="server" id="lo1_successful" DatabaseField="lo1_successful" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="lo1_failed" DatabaseField="lo1_failed" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="lo1_ttl_number" DatabaseField="lo1_ttl_number"  IsReadOnly="true" RenderReadOnlyAsDiv="true"  FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="lo1_ratio" DatabaseField="lo1_ratio"  IsReadOnly="true" RenderReadOnlyAsDiv="true"  FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>

    <def:datafieldcontrol runat="server" id="lo1_ttl_ABC_raw" DatabaseField="lo1_ttl_ABC_raw" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="lo1_ttl_BC_raw" DatabaseField="lo1_ttl_BC_raw" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>

    <br/>
    <def:datafieldcontrol runat="server" id="lo1_notes" DatabaseField="lo1_notes"  IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="60px" FieldTextBoxWidth="300px"  FieldTextBoxHeight="100px"  FieldTextBoxMaxLength="500" FieldTextBoxTextMode="MultiLine"></def:datafieldcontrol>

    <br/><br/>


</td>
<td style="vertical-align:top"><br/><br/>
    <def:datafieldcontrol runat="server" id="lo2_recording_date" DatabaseField="lo2_recording_date" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FormatString="{0:d}" ></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="lo2_weeknum" DatabaseField="lo2_weeknum" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="100px" FieldTextBoxMaxLength="50"></def:datafieldcontrol>
    <br />
    <def:datafieldcontrol runat="server" id="lo2_date_coded" DatabaseField="lo2_date_coded" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FormatString="{0:d}" ></def:datafieldcontrol>
    <table>
    <tr><td>
    <def:datafieldcontrol runat="server" id="lo2_timebeg1t" DatabaseField="lo2_timebeg1t" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxWidth = "80px" FieldLabelWidth="300px"  ></def:datafieldcontrol></td><td>
    <def:datafieldcontrol runat="server" id="lo2_timeend1t" DatabaseField="lo2_timeend1t" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxWidth = "80px" ShowFieldLabel="false"  ></def:datafieldcontrol></td><td>
    <def:datafieldcontrol runat="server" id="lo2_timemin1"  DatabaseField="lo2_timemin1"  IsReadOnly="true" RenderReadOnlyAsDiv="true"  FieldTextBoxWidth = "30px" ShowFieldLabel="false" Font-Color="Blue" ></def:datafieldcontrol></td></tr><tr><td>
    <def:datafieldcontrol runat="server" id="lo2_timebeg2t" DatabaseField="lo2_timebeg2t" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxWidth = "80px" FieldLabelWidth="300px"  ></def:datafieldcontrol></td><td>
    <def:datafieldcontrol runat="server" id="lo2_timeend2t" DatabaseField="lo2_timeend2t" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxWidth = "80px" ShowFieldLabel="false"  ></def:datafieldcontrol> </td><td>
    <def:datafieldcontrol runat="server" id="lo2_timemin2"  DatabaseField="lo2_timemin2"  IsReadOnly="true" RenderReadOnlyAsDiv="true"  FieldTextBoxWidth = "30px" ShowFieldLabel="false"  ForeColor="Gray"></def:datafieldcontrol></td></tr><tr><td>
    <def:datafieldcontrol runat="server" id="lo2_timebeg3t" DatabaseField="lo2_timebeg3t" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxWidth = "80px" FieldLabelWidth="300px" ></def:datafieldcontrol></td><td>
    <def:datafieldcontrol runat="server" id="lo2_timeend3t" DatabaseField="lo2_timeend3t" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxWidth = "80px" ShowFieldLabel="false" ></def:datafieldcontrol> </td><td>
    <def:datafieldcontrol runat="server" id="lo2_timemin3"  DatabaseField="lo2_timemin3"  IsReadOnly="true" RenderReadOnlyAsDiv="true"  FieldTextBoxWidth = "30px" ShowFieldLabel="false" ForeColor="Gray" ></def:datafieldcontrol></td></tr><tr><td>
    <def:datafieldcontrol runat="server" id="lo2_timebeg4t" DatabaseField="lo2_timebeg4t" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxWidth = "80px" FieldLabelWidth="300px" ></def:datafieldcontrol></td><td>
    <def:datafieldcontrol runat="server" id="lo2_timeend4t" DatabaseField="lo2_timeend4t" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxWidth = "80px" ShowFieldLabel="false" ></def:datafieldcontrol> </td><td>
    <def:datafieldcontrol runat="server" id="lo2_timemin4"  DatabaseField="lo2_timemin4"  IsReadOnly="true" RenderReadOnlyAsDiv="true"  FieldTextBoxWidth = "30px" ShowFieldLabel="false"  ></def:datafieldcontrol></td></tr><tr><td>
    <def:datafieldcontrol runat="server" id="lo2_timebeg5t" DatabaseField="lo2_timebeg5t" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxWidth = "80px" FieldLabelWidth="300px" ></def:datafieldcontrol></td><td>
    <def:datafieldcontrol runat="server" id="lo2_timeend5t" DatabaseField="lo2_timeend5t" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxWidth = "80px" ShowFieldLabel="false" ></def:datafieldcontrol> </td><td>
    <def:datafieldcontrol runat="server" id="lo2_timemin5"  DatabaseField="lo2_timemin5"  IsReadOnly="true" RenderReadOnlyAsDiv="true"  FieldTextBoxWidth = "30px" ShowFieldLabel="false"  ></def:datafieldcontrol></td></tr><tr><td>
    <def:datafieldcontrol runat="server" id="lo2_timebeg6t" DatabaseField="lo2_timebeg6t" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxWidth = "80px" FieldLabelWidth="300px" ></def:datafieldcontrol></td><td>
    <def:datafieldcontrol runat="server" id="lo2_timeend6t" DatabaseField="lo2_timeend6t" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxWidth = "80px" ShowFieldLabel="false" ></def:datafieldcontrol> </td><td>
    <def:datafieldcontrol runat="server" id="lo2_timemin6"  DatabaseField="lo2_timemin6"  IsReadOnly="true" RenderReadOnlyAsDiv="true"  FieldTextBoxWidth = "30px" ShowFieldLabel="false"  ></def:datafieldcontrol></td></tr><tr><td>
    <def:datafieldcontrol runat="server" id="lo2_timebeg7t" DatabaseField="lo2_timebeg7t" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxWidth = "80px" FieldLabelWidth="300px" ></def:datafieldcontrol></td><td>
    <def:datafieldcontrol runat="server" id="lo2_timeend7t" DatabaseField="lo2_timeend7t" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxWidth = "80px" ShowFieldLabel="false" ></def:datafieldcontrol> </td><td>
    <def:datafieldcontrol runat="server" id="lo2_timemin7"  DatabaseField="lo2_timemin7"  IsReadOnly="true" RenderReadOnlyAsDiv="true"  FieldTextBoxWidth = "30px" ShowFieldLabel="false"  ></def:datafieldcontrol></td></tr><tr><td>


    </table>
        <br/>
        <def:datafieldcontrol runat="server" id="lo2_durmins_manual" DatabaseField="lo2_durmins_manual"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>

        <def:datafieldcontrol runat="server" id="lo2_durmins" DatabaseField="lo2_durmins"  IsReadOnly="true" RenderReadOnlyAsDiv="true"  FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
        <def:datafieldcontrol runat="server" id="lo2_avgsuccmin" DatabaseField="lo2_avgsuccmin"  IsReadOnly="true" RenderReadOnlyAsDiv="true"  FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <br/>

    <def:datafieldcontrol runat="server" id="lo2_successful" DatabaseField="lo2_successful" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="lo2_failed" DatabaseField="lo2_failed" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="lo2_ttl_number" DatabaseField="lo2_ttl_number"  IsReadOnly="true" RenderReadOnlyAsDiv="true"  FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="lo2_ratio" DatabaseField="lo2_ratio"  IsReadOnly="true" RenderReadOnlyAsDiv="true"  FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>

    <def:datafieldcontrol runat="server" id="lo2_ttl_ABC_raw" DatabaseField="lo2_ttl_ABC_raw" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="lo2_ttl_BC_raw" DatabaseField="lo2_ttl_BC_raw" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>

    <br/>
    <def:datafieldcontrol runat="server" id="lo2_notes" DatabaseField="lo2_notes"  IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="60px" FieldTextBoxWidth="300px"  FieldTextBoxMaxLength="500" FieldTextBoxHeight="100px" FieldTextBoxTextMode="MultiLine"></def:datafieldcontrol>

    <br/><br/>

    
</td>
<td style="vertical-align:top">
    <def:datafieldcontrol runat="server" id="lo_act3_desc" DatabaseField="lo_act3_desc" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px"  ></def:datafieldcontrol>
        <def:datafieldcontrol runat="server" id="lo3_recording_date" DatabaseField="lo3_recording_date" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FormatString="{0:d}" ></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="lo3_weeknum" DatabaseField="lo3_weeknum" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="100px" FieldTextBoxMaxLength="50"></def:datafieldcontrol>
    <br />
    <def:datafieldcontrol runat="server" id="lo3_date_coded" DatabaseField="lo3_date_coded" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FormatString="{0:d}" ></def:datafieldcontrol>
    <table>
    <tr><td>
    <def:datafieldcontrol runat="server" id="lo3_timebeg1t" DatabaseField="lo3_timebeg1t" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxWidth = "80px" FieldLabelWidth="300px"  ></def:datafieldcontrol></td><td>
    <def:datafieldcontrol runat="server" id="lo3_timeend1t" DatabaseField="lo3_timeend1t" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxWidth = "80px" ShowFieldLabel="false"  ></def:datafieldcontrol></td><td>
    <def:datafieldcontrol runat="server" id="lo3_timemin1"  DatabaseField="lo3_timemin1"  IsReadOnly="true" RenderReadOnlyAsDiv="true"  FieldTextBoxWidth = "30px" ShowFieldLabel="false" Font-Color="Gray" ></def:datafieldcontrol></td></tr><tr><td>
    <def:datafieldcontrol runat="server" id="lo3_timebeg2t" DatabaseField="lo3_timebeg2t" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxWidth = "80px" FieldLabelWidth="300px"  ></def:datafieldcontrol></td><td>
    <def:datafieldcontrol runat="server" id="lo3_timeend2t" DatabaseField="lo3_timeend2t" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxWidth = "80px" ShowFieldLabel="false"  ></def:datafieldcontrol> </td><td>
    <def:datafieldcontrol runat="server" id="lo3_timemin2"  DatabaseField="lo3_timemin2"  IsReadOnly="true" RenderReadOnlyAsDiv="true"  FieldTextBoxWidth = "30px" ShowFieldLabel="false"  ForeColor="Gray"></def:datafieldcontrol></td></tr><tr><td>
    <def:datafieldcontrol runat="server" id="lo3_timebeg3t" DatabaseField="lo3_timebeg3t" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxWidth = "80px" FieldLabelWidth="300px" ></def:datafieldcontrol></td><td>
    <def:datafieldcontrol runat="server" id="lo3_timeend3t" DatabaseField="lo3_timeend3t" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxWidth = "80px" ShowFieldLabel="false" ></def:datafieldcontrol> </td><td>
    <def:datafieldcontrol runat="server" id="lo3_timemin3"  DatabaseField="lo3_timemin3"  IsReadOnly="true" RenderReadOnlyAsDiv="true"  FieldTextBoxWidth = "30px" ShowFieldLabel="false" ForeColor="Gray" ></def:datafieldcontrol></td></tr><tr><td>
    <def:datafieldcontrol runat="server" id="lo3_timebeg4t" DatabaseField="lo3_timebeg4t" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxWidth = "80px" FieldLabelWidth="300px" ></def:datafieldcontrol></td><td>
    <def:datafieldcontrol runat="server" id="lo3_timeend4t" DatabaseField="lo3_timeend4t" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxWidth = "80px" ShowFieldLabel="false" ></def:datafieldcontrol> </td><td>
    <def:datafieldcontrol runat="server" id="lo3_timemin4"  DatabaseField="lo3_timemin4"  IsReadOnly="true" RenderReadOnlyAsDiv="true"  FieldTextBoxWidth = "30px" ShowFieldLabel="false"  ></def:datafieldcontrol></td></tr><tr><td>
    <def:datafieldcontrol runat="server" id="lo3_timebeg5t" DatabaseField="lo3_timebeg5t" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxWidth = "80px" FieldLabelWidth="300px" ></def:datafieldcontrol></td><td>
    <def:datafieldcontrol runat="server" id="lo3_timeend5t" DatabaseField="lo3_timeend5t" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxWidth = "80px" ShowFieldLabel="false" ></def:datafieldcontrol> </td><td>
    <def:datafieldcontrol runat="server" id="lo3_timemin5"  DatabaseField="lo3_timemin5"  IsReadOnly="true" RenderReadOnlyAsDiv="true"  FieldTextBoxWidth = "30px" ShowFieldLabel="false"  ></def:datafieldcontrol></td></tr><tr><td>
    <def:datafieldcontrol runat="server" id="lo3_timebeg6t" DatabaseField="lo3_timebeg6t" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxWidth = "80px" FieldLabelWidth="300px" ></def:datafieldcontrol></td><td>
    <def:datafieldcontrol runat="server" id="lo3_timeend6t" DatabaseField="lo3_timeend6t" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxWidth = "80px" ShowFieldLabel="false" ></def:datafieldcontrol> </td><td>
    <def:datafieldcontrol runat="server" id="lo3_timemin6"  DatabaseField="lo3_timemin6"  IsReadOnly="true" RenderReadOnlyAsDiv="true"  FieldTextBoxWidth = "30px" ShowFieldLabel="false"  ></def:datafieldcontrol></td></tr><tr><td>
    <def:datafieldcontrol runat="server" id="lo3_timebeg7t" DatabaseField="lo3_timebeg7t" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxWidth = "80px" FieldLabelWidth="300px" ></def:datafieldcontrol></td><td>
    <def:datafieldcontrol runat="server" id="lo3_timeend7t" DatabaseField="lo3_timeend7t" IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxWidth = "80px" ShowFieldLabel="false" ></def:datafieldcontrol> </td><td>
    <def:datafieldcontrol runat="server" id="lo3_timemin7"  DatabaseField="lo3_timemin7"  IsReadOnly="true" RenderReadOnlyAsDiv="true"  FieldTextBoxWidth = "30px" ShowFieldLabel="false"  ></def:datafieldcontrol></td></tr><tr><td>
    </table>
        <br/>
        <def:datafieldcontrol runat="server" id="lo3_durmins_manual" DatabaseField="lo3_durmins_manual"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
        <def:datafieldcontrol runat="server" id="lo3_durmins" DatabaseField="lo3_durmins"  IsReadOnly="true" RenderReadOnlyAsDiv="true"  FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
        <def:datafieldcontrol runat="server" id="lo3_avgsuccmin" DatabaseField="lo3_avgsuccmin"  IsReadOnly="true" RenderReadOnlyAsDiv="true"  FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <br/>

    <def:datafieldcontrol runat="server" id="lo3_successful" DatabaseField="lo3_successful" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="lo3_failed" DatabaseField="lo3_failed" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="lo3_ttl_number" DatabaseField="lo3_ttl_number"  IsReadOnly="true" RenderReadOnlyAsDiv="true"  FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="lo3_ratio" DatabaseField="lo3_ratio"  IsReadOnly="true" RenderReadOnlyAsDiv="true"  FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>

    <def:datafieldcontrol runat="server" id="lo3_ttl_ABC_raw" DatabaseField="lo3_ttl_ABC_raw" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="lo3_ttl_BC_raw" DatabaseField="lo3_ttl_BC_raw" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>

        <br/>
    <def:datafieldcontrol runat="server" id="lo3_notes" DatabaseField="lo3_notes"  IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="60px" FieldTextBoxWidth="300px" FieldTextBoxMaxLength="500" FieldTextBoxHeight="100px" FieldTextBoxTextMode="MultiLine"></def:datafieldcontrol>

    <br/><br/>


</td>
</tr>

<tr>
<td>
</td>
<td>

</td>
<td>

</td>
</tr>
</table>

<br/><br/>

<def:datafieldcontrol runat="server" id="lo_ttl_success" DatabaseField="lo_ttl_success"  IsReadOnly="true" RenderReadOnlyAsDiv="true"  FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="lo_ttl_number" DatabaseField="lo_ttl_number"  IsReadOnly="true" RenderReadOnlyAsDiv="true"  FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="lo_ratio" DatabaseField="lo_ratio"  IsReadOnly="true" RenderReadOnlyAsDiv="true"  FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<br/>
<def:datafieldcontrol runat="server" id="lo_scrmsg" DatabaseField="lo_scrmsg"  IsReadOnly="true" RenderReadOnlyAsDiv="true"  FieldLabelWidth="300px" FieldTextBoxWidth="400px" FieldTextBoxHeight="40px" FieldTextBoxTextMode="multiline" FieldTextBoxMaxLength="250"></def:datafieldcontrol>


<br/>




<br/>
<br/>
<def:datafieldcontrol runat="server" id="created" DatabaseField="created" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="250px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="createdBy" DatabaseField="createdBy" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="250px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="50"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="updated" DatabaseField="updated" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="250px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="updatedBy" DatabaseField="updatedBy" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="250px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="50"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="scored" DatabaseField="scored" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="250px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="scoredBy" DatabaseField="scoredBy" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="250px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="50"></def:datafieldcontrol>
</asp:Content>


