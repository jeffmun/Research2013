<%@ Register TagPrefix="def" Namespace="DataEntryFramework3" %> 
<%@ Page language="c#" MasterPageFile="~/UWAC.master"  Title="PICA Data Entry" %>
<asp:Content ID="Content1" ContentPlaceHolderID="oBodyPlaceHolder" runat="server">

<def:dataentrycontroller id="DataEntryController1" runat="server" DatabaseTable="ALL_PICA" PrimaryKeyField="pica_pk">
</def:dataentrycontroller>
<def:datafieldcontrol runat="server" id="id" DatabaseField="id" IsInsertField="true" FieldLabelWidth="300px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="15"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="indexnum" DatabaseField="indexnum" IsInsertField="true" FieldTextBoxTextDefault="1" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="pica_date" DatabaseField="pica_date" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FormatString="{0:d}"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="pica_resp" DatabaseField="pica_resp" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="300px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="50"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="pica_agemos" DatabaseField="pica_agemos"  IsReadOnly="true" RenderReadOnlyAsDiv="true"  FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>


<br/>
<br/>

<table>
<tr><td align="right"><b><u>Words</u></b></td><td align="right"><b><u>Gestures</u></b></td></tr>

<tr><td>
<def:datafieldcontrol runat="server" id="pica_word_01" DatabaseField="pica_word_01" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="300px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="100"></def:datafieldcontrol>
</td><td>
<def:datafieldcontrol runat="server" id="pica_gest_01" DatabaseField="pica_gest_01" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="30px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="100"></def:datafieldcontrol>
</td></tr><tr><td>
<def:datafieldcontrol runat="server" id="pica_word_02" DatabaseField="pica_word_02" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="300px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="100"></def:datafieldcontrol>
</td><td>
<def:datafieldcontrol runat="server" id="pica_gest_02" DatabaseField="pica_gest_02" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="30px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="100"></def:datafieldcontrol>
</td></tr><tr><td>
<def:datafieldcontrol runat="server" id="pica_word_03" DatabaseField="pica_word_03" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="300px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="100"></def:datafieldcontrol>
</td><td>
<def:datafieldcontrol runat="server" id="pica_gest_03" DatabaseField="pica_gest_03" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="30px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="100"></def:datafieldcontrol>
</td></tr><tr><td>
<def:datafieldcontrol runat="server" id="pica_word_04" DatabaseField="pica_word_04" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="300px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="100"></def:datafieldcontrol>
</td><td>
<def:datafieldcontrol runat="server" id="pica_gest_04" DatabaseField="pica_gest_04" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="30px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="100"></def:datafieldcontrol>
</td></tr><tr><td>
<def:datafieldcontrol runat="server" id="pica_word_05" DatabaseField="pica_word_05" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="300px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="100"></def:datafieldcontrol>
</td><td>
<def:datafieldcontrol runat="server" id="pica_gest_05" DatabaseField="pica_gest_05" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="30px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="100"></def:datafieldcontrol>
</td></tr><tr><td>
<def:datafieldcontrol runat="server" id="pica_word_06" DatabaseField="pica_word_06" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="300px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="100"></def:datafieldcontrol>
</td><td>
<def:datafieldcontrol runat="server" id="pica_gest_06" DatabaseField="pica_gest_06" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="30px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="100"></def:datafieldcontrol>
</td></tr><tr><td>
<def:datafieldcontrol runat="server" id="pica_word_07" DatabaseField="pica_word_07" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="300px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="100"></def:datafieldcontrol>
</td><td>
<def:datafieldcontrol runat="server" id="pica_gest_07" DatabaseField="pica_gest_07" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="30px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="100"></def:datafieldcontrol>
</td></tr><tr><td>
<def:datafieldcontrol runat="server" id="pica_word_08" DatabaseField="pica_word_08" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="300px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="100"></def:datafieldcontrol>
</td><td>
<def:datafieldcontrol runat="server" id="pica_gest_08" DatabaseField="pica_gest_08" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="30px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="100"></def:datafieldcontrol>
</td></tr><tr><td>
<def:datafieldcontrol runat="server" id="pica_word_09" DatabaseField="pica_word_09" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="300px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="100"></def:datafieldcontrol>
</td><td>
<def:datafieldcontrol runat="server" id="pica_gest_09" DatabaseField="pica_gest_09" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="30px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="100"></def:datafieldcontrol>
</td></tr><tr><td>
<def:datafieldcontrol runat="server" id="pica_word_10" DatabaseField="pica_word_10" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="300px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="100"></def:datafieldcontrol>
</td><td>
<def:datafieldcontrol runat="server" id="pica_gest_10" DatabaseField="pica_gest_10" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="30px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="100"></def:datafieldcontrol>
</td></tr><tr><td>
<def:datafieldcontrol runat="server" id="pica_word_11" DatabaseField="pica_word_11" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="300px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="100"></def:datafieldcontrol>
</td><td>
<def:datafieldcontrol runat="server" id="pica_gest_11" DatabaseField="pica_gest_11" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="30px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="100"></def:datafieldcontrol>
</td></tr><tr><td>
<def:datafieldcontrol runat="server" id="pica_word_12" DatabaseField="pica_word_12" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="300px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="100"></def:datafieldcontrol>
</td><td>
<def:datafieldcontrol runat="server" id="pica_gest_12" DatabaseField="pica_gest_12" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="30px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="100"></def:datafieldcontrol>
</td></tr><tr><td>
<def:datafieldcontrol runat="server" id="pica_word_13" DatabaseField="pica_word_13" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="300px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="100"></def:datafieldcontrol>
</td><td>
<def:datafieldcontrol runat="server" id="pica_gest_13" DatabaseField="pica_gest_13" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="30px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="100"></def:datafieldcontrol>
</td></tr><tr><td>
<def:datafieldcontrol runat="server" id="pica_word_14" DatabaseField="pica_word_14" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="300px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="100"></def:datafieldcontrol>
</td><td>
<def:datafieldcontrol runat="server" id="pica_gest_14" DatabaseField="pica_gest_14" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="30px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="100"></def:datafieldcontrol>
</td></tr><tr><td>
<def:datafieldcontrol runat="server" id="pica_word_15" DatabaseField="pica_word_15" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="300px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="100"></def:datafieldcontrol>
</td><td>
<def:datafieldcontrol runat="server" id="pica_gest_15" DatabaseField="pica_gest_15" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="30px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="100"></def:datafieldcontrol>
</td></tr><tr><td>
<def:datafieldcontrol runat="server" id="pica_word_16" DatabaseField="pica_word_16" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="300px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="100"></def:datafieldcontrol>
</td><td>
<def:datafieldcontrol runat="server" id="pica_gest_16" DatabaseField="pica_gest_16" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="30px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="100"></def:datafieldcontrol>
</td></tr><tr><td>
<def:datafieldcontrol runat="server" id="pica_word_17" DatabaseField="pica_word_17" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="300px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="100"></def:datafieldcontrol>
</td><td>
<def:datafieldcontrol runat="server" id="pica_gest_17" DatabaseField="pica_gest_17" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="30px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="100"></def:datafieldcontrol>
</td></tr><tr><td>
<def:datafieldcontrol runat="server" id="pica_word_18" DatabaseField="pica_word_18" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="300px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="100"></def:datafieldcontrol>
</td><td>
<def:datafieldcontrol runat="server" id="pica_gest_18" DatabaseField="pica_gest_18" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="30px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="100"></def:datafieldcontrol>
</td></tr><tr><td>
<def:datafieldcontrol runat="server" id="pica_word_19" DatabaseField="pica_word_19" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="300px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="100"></def:datafieldcontrol>
</td><td>
<def:datafieldcontrol runat="server" id="pica_gest_19" DatabaseField="pica_gest_19" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="30px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="100"></def:datafieldcontrol>
</td></tr><tr><td>
<def:datafieldcontrol runat="server" id="pica_word_20" DatabaseField="pica_word_20" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="300px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="100"></def:datafieldcontrol>
</td><td>
<def:datafieldcontrol runat="server" id="pica_gest_20" DatabaseField="pica_gest_20" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="30px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="100"></def:datafieldcontrol>
</td></tr><tr><td>
<def:datafieldcontrol runat="server" id="pica_word_21" DatabaseField="pica_word_21" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="300px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="100"></def:datafieldcontrol>
</td><td>
<def:datafieldcontrol runat="server" id="pica_gest_21" DatabaseField="pica_gest_21" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="30px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="100"></def:datafieldcontrol>
</td></tr><tr><td>
<def:datafieldcontrol runat="server" id="pica_word_22" DatabaseField="pica_word_22" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="300px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="100"></def:datafieldcontrol>
</td><td>
<def:datafieldcontrol runat="server" id="pica_gest_22" DatabaseField="pica_gest_22" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="30px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="100"></def:datafieldcontrol>
</td></tr><tr><td>
<def:datafieldcontrol runat="server" id="pica_word_23" DatabaseField="pica_word_23" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="300px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="100"></def:datafieldcontrol>
</td><td>
<def:datafieldcontrol runat="server" id="pica_gest_23" DatabaseField="pica_gest_23" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="30px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="100"></def:datafieldcontrol>
</td></tr><tr><td>
<def:datafieldcontrol runat="server" id="pica_word_24" DatabaseField="pica_word_24" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="300px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="100"></def:datafieldcontrol>
</td><td>
<def:datafieldcontrol runat="server" id="pica_gest_24" DatabaseField="pica_gest_24" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="30px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="100"></def:datafieldcontrol>
</td></tr><tr><td>
<def:datafieldcontrol runat="server" id="pica_word_25" DatabaseField="pica_word_25" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="300px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="100"></def:datafieldcontrol>
</td><td>
<def:datafieldcontrol runat="server" id="pica_gest_25" DatabaseField="pica_gest_25" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="30px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="100"></def:datafieldcontrol>
</td></tr><tr><td>
<def:datafieldcontrol runat="server" id="pica_word_26" DatabaseField="pica_word_26" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="300px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="100"></def:datafieldcontrol>
</td><td>
<def:datafieldcontrol runat="server" id="pica_gest_26" DatabaseField="pica_gest_26" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="30px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="100"></def:datafieldcontrol>
</td></tr><tr><td>
<def:datafieldcontrol runat="server" id="pica_word_27" DatabaseField="pica_word_27" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="300px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="100"></def:datafieldcontrol>
</td><td>
<def:datafieldcontrol runat="server" id="pica_gest_27" DatabaseField="pica_gest_27" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="30px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="100"></def:datafieldcontrol>
</td></tr><tr><td>
<def:datafieldcontrol runat="server" id="pica_word_28" DatabaseField="pica_word_28" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="300px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="100"></def:datafieldcontrol>
</td><td>
<def:datafieldcontrol runat="server" id="pica_gest_28" DatabaseField="pica_gest_28" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="30px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="100"></def:datafieldcontrol>
</td></tr><tr><td>
<def:datafieldcontrol runat="server" id="pica_word_29" DatabaseField="pica_word_29" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="300px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="100"></def:datafieldcontrol>
</td><td>
<def:datafieldcontrol runat="server" id="pica_gest_29" DatabaseField="pica_gest_29" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="30px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="100"></def:datafieldcontrol>
</td></tr><tr><td>
<def:datafieldcontrol runat="server" id="pica_word_30" DatabaseField="pica_word_30" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="300px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="100"></def:datafieldcontrol>
</td><td>
<def:datafieldcontrol runat="server" id="pica_gest_30" DatabaseField="pica_gest_30" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="30px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="100"></def:datafieldcontrol>
</td></tr><tr><td>
<def:datafieldcontrol runat="server" id="pica_word_31" DatabaseField="pica_word_31" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="300px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="100"></def:datafieldcontrol>
</td><td>
<def:datafieldcontrol runat="server" id="pica_gest_31" DatabaseField="pica_gest_31" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="30px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="100"></def:datafieldcontrol>
</td></tr><tr><td>
<def:datafieldcontrol runat="server" id="pica_word_32" DatabaseField="pica_word_32" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="300px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="100"></def:datafieldcontrol>
</td><td>
<def:datafieldcontrol runat="server" id="pica_gest_32" DatabaseField="pica_gest_32" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="30px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="100"></def:datafieldcontrol>
</td></tr><tr><td>
<def:datafieldcontrol runat="server" id="pica_word_33" DatabaseField="pica_word_33" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="300px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="100"></def:datafieldcontrol>
</td><td>
<def:datafieldcontrol runat="server" id="pica_gest_33" DatabaseField="pica_gest_33" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="30px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="100"></def:datafieldcontrol>
</td></tr><tr><td>
<def:datafieldcontrol runat="server" id="pica_word_34" DatabaseField="pica_word_34" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="300px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="100"></def:datafieldcontrol>
</td><td>
<def:datafieldcontrol runat="server" id="pica_gest_34" DatabaseField="pica_gest_34" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="30px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="100"></def:datafieldcontrol>
</td></tr><tr><td>
<def:datafieldcontrol runat="server" id="pica_word_35" DatabaseField="pica_word_35" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="300px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="100"></def:datafieldcontrol>
</td><td>
<def:datafieldcontrol runat="server" id="pica_gest_35" DatabaseField="pica_gest_35" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="30px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="100"></def:datafieldcontrol>
</td></tr><tr><td>
<def:datafieldcontrol runat="server" id="pica_word_36" DatabaseField="pica_word_36" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="300px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="100"></def:datafieldcontrol>
</td><td>
<def:datafieldcontrol runat="server" id="pica_gest_36" DatabaseField="pica_gest_36" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="30px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="100"></def:datafieldcontrol>
</td></tr><tr><td>
<def:datafieldcontrol runat="server" id="pica_word_37" DatabaseField="pica_word_37" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="300px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="100"></def:datafieldcontrol>
</td><td>
<def:datafieldcontrol runat="server" id="pica_gest_37" DatabaseField="pica_gest_37" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="30px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="100"></def:datafieldcontrol>
</td></tr><tr><td>
<def:datafieldcontrol runat="server" id="pica_word_38" DatabaseField="pica_word_38" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="300px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="100"></def:datafieldcontrol>
</td><td>
<def:datafieldcontrol runat="server" id="pica_gest_38" DatabaseField="pica_gest_38" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="30px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="100"></def:datafieldcontrol>
</td></tr><tr><td>
<def:datafieldcontrol runat="server" id="pica_word_39" DatabaseField="pica_word_39" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="300px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="100"></def:datafieldcontrol>
</td><td>
<def:datafieldcontrol runat="server" id="pica_gest_39" DatabaseField="pica_gest_39" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="30px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="100"></def:datafieldcontrol>
</td></tr><tr><td>
<def:datafieldcontrol runat="server" id="pica_word_40" DatabaseField="pica_word_40" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="300px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="100"></def:datafieldcontrol>
</td><td>
<def:datafieldcontrol runat="server" id="pica_gest_40" DatabaseField="pica_gest_40" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="30px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="100"></def:datafieldcontrol>
</td></tr><tr><td>
<def:datafieldcontrol runat="server" id="pica_word_41" DatabaseField="pica_word_41" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="300px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="100"></def:datafieldcontrol>
</td><td>
<def:datafieldcontrol runat="server" id="pica_gest_41" DatabaseField="pica_gest_41" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="30px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="100"></def:datafieldcontrol>
</td></tr><tr><td>
<def:datafieldcontrol runat="server" id="pica_word_42" DatabaseField="pica_word_42" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="300px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="100"></def:datafieldcontrol>
</td><td>
<def:datafieldcontrol runat="server" id="pica_gest_42" DatabaseField="pica_gest_42" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="30px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="100"></def:datafieldcontrol>
</td></tr><tr><td>
<def:datafieldcontrol runat="server" id="pica_word_43" DatabaseField="pica_word_43" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="300px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="100"></def:datafieldcontrol>
</td><td>
<def:datafieldcontrol runat="server" id="pica_gest_43" DatabaseField="pica_gest_43" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="30px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="100"></def:datafieldcontrol>
</td></tr><tr><td>
<def:datafieldcontrol runat="server" id="pica_word_44" DatabaseField="pica_word_44" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="300px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="100"></def:datafieldcontrol>
</td><td>
<def:datafieldcontrol runat="server" id="pica_gest_44" DatabaseField="pica_gest_44" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="30px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="100"></def:datafieldcontrol>
</td></tr><tr><td>
<def:datafieldcontrol runat="server" id="pica_word_45" DatabaseField="pica_word_45" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="300px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="100"></def:datafieldcontrol>
</td><td>
<def:datafieldcontrol runat="server" id="pica_gest_45" DatabaseField="pica_gest_45" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="30px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="100"></def:datafieldcontrol>
</td></tr><tr><td>
<def:datafieldcontrol runat="server" id="pica_word_46" DatabaseField="pica_word_46" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="300px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="100"></def:datafieldcontrol>
</td><td>
<def:datafieldcontrol runat="server" id="pica_gest_46" DatabaseField="pica_gest_46" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="30px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="100"></def:datafieldcontrol>
</td></tr><tr><td>
<def:datafieldcontrol runat="server" id="pica_word_47" DatabaseField="pica_word_47" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="300px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="100"></def:datafieldcontrol>
</td><td>
<def:datafieldcontrol runat="server" id="pica_gest_47" DatabaseField="pica_gest_47" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="30px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="100"></def:datafieldcontrol>
</td></tr><tr><td>
<def:datafieldcontrol runat="server" id="pica_word_48" DatabaseField="pica_word_48" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="300px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="100"></def:datafieldcontrol>
</td><td>
<def:datafieldcontrol runat="server" id="pica_gest_48" DatabaseField="pica_gest_48" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="30px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="100"></def:datafieldcontrol>
</td></tr><tr><td>
<def:datafieldcontrol runat="server" id="pica_word_49" DatabaseField="pica_word_49" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="300px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="100"></def:datafieldcontrol>
</td><td>
<def:datafieldcontrol runat="server" id="pica_gest_49" DatabaseField="pica_gest_49" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="30px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="100"></def:datafieldcontrol>
</td></tr>
</table>
<br/>
<br/>
<def:datafieldcontrol runat="server" id="created" DatabaseField="created" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="300px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="createdBy" DatabaseField="createdBy" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="300px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="50"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="updated" DatabaseField="updated" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="300px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="updatedBy" DatabaseField="updatedBy" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="300px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="50"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="scored" DatabaseField="scored" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="300px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="scoredBy" DatabaseField="scoredBy" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="300px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="50"></def:datafieldcontrol>
</asp:Content>
