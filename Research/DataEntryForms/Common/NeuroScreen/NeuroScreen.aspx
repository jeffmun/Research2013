<%@ Register TagPrefix="def" Namespace="DataEntryFramework3" %> 
<%@ Page language="c#" MasterPageFile="~/UWAC.master"  Title="NeuroScree Data Entry" %>
<asp:Content ID="Content1" ContentPlaceHolderID="oBodyPlaceHolder" runat="server">
<def:dataentrycontroller id="DataEntryController1" runat="server" DatabaseTable="ALL_NeuroScreen" >
</def:dataentrycontroller>
<def:datafieldcontrol runat="server" id="id" DatabaseField="id"  IsInsertField="true"   FieldLabelWidth="200px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="indexnum" DatabaseField="indexnum"  IsInsertField="true"   FieldLabelWidth="200px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="NDExmr" DatabaseField="NDExmr"  IsInsertField="true"  FieldLabelWidth="200px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="NDDate" DatabaseField="NDDate"  IsInsertField="true"  FieldLabelWidth="200px"></def:datafieldcontrol>
<br />
<asp:panel id="mainPanel" runat="server">
<p>Please follow your Neurodevelopmental Screen instructions, using 0, 1, 2, 3, 8, or 9 for most fields as appropriate.</p>
<blockquote><strong>If an item is missing entirely, enter a -9.</strong></blockquote>
<def:datafieldcontrol runat="server" id="ND01" DatabaseField="ND01"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="200px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="ND01s" DatabaseField="ND01s"  IsEntryField="true" IsDoubleEntryField="false"  FieldLabelWidth="200px" FieldTextBoxWidth = "400px" FieldTextBoxHeight = "70px" FieldTextBoxTextMode="MultiLine"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="ND02" DatabaseField="ND02"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="200px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<table border="0" cellpadding="0" cellspacing="0">
    <tr>
        <td>
            <def:datafieldcontrol runat="server" id="ND02s" DatabaseField="ND02s"  IsEntryField="true" IsDoubleEntryField="false"  FieldLabelWidth="200px"  FieldTextBoxWidth="30px"></def:datafieldcontrol>
        </td>
        <td>
             (0 = Left, 1 = Right, 2 = Bilateral, -9 = Missing Value)
        </td>
    </tr>
</table>
<def:datafieldcontrol runat="server" id="ND03" DatabaseField="ND03"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="200px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="ND04" DatabaseField="ND04"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="200px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="ND05" DatabaseField="ND05"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="200px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="ND06" DatabaseField="ND06"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="200px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="ND07" DatabaseField="ND07"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="200px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="ND07d" DatabaseField="ND07d"  IsEntryField="true" IsDoubleEntryField="false"  FieldLabelWidth="200px" FieldTextBoxWidth = "400px" FieldTextBoxHeight = "70px" FieldTextBoxTextMode="MultiLine"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="ND08" DatabaseField="ND08"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="200px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="ND08d" DatabaseField="ND08d"  IsEntryField="true" IsDoubleEntryField="false"  FieldLabelWidth="200px" FieldTextBoxWidth = "400px" FieldTextBoxHeight = "70px" FieldTextBoxTextMode="MultiLine"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="ND09" DatabaseField="ND09"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="200px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="ND10" DatabaseField="ND10"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="200px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="ND13" DatabaseField="ND13"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="200px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="ND13s" DatabaseField="ND13s"  IsEntryField="true" IsDoubleEntryField="false"  FieldLabelWidth="200px" FieldTextBoxWidth = "400px" FieldTextBoxHeight = "70px" FieldTextBoxTextMode="MultiLine"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="ND14" DatabaseField="ND14"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="200px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="ND14s" DatabaseField="ND14s"  IsEntryField="true" IsDoubleEntryField="false"  FieldLabelWidth="200px" FieldTextBoxWidth = "400px" FieldTextBoxHeight = "70px" FieldTextBoxTextMode="MultiLine"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="ND15" DatabaseField="ND15"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="200px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="ND15s" DatabaseField="ND15s"  IsEntryField="true" IsDoubleEntryField="false"  FieldLabelWidth="200px" FieldTextBoxWidth = "400px" FieldTextBoxHeight = "70px" FieldTextBoxTextMode="MultiLine"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="ND16" DatabaseField="ND16"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="200px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="ND16s" DatabaseField="ND16s"  IsEntryField="true" IsDoubleEntryField="false"  FieldLabelWidth="200px" FieldTextBoxWidth = "400px" FieldTextBoxHeight = "70px" FieldTextBoxTextMode="MultiLine"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="ND17" DatabaseField="ND17"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="200px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="ND17s" DatabaseField="ND17s"  IsEntryField="true" IsDoubleEntryField="false"  FieldLabelWidth="200px" FieldTextBoxWidth = "400px" FieldTextBoxHeight = "70px" FieldTextBoxTextMode="MultiLine"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="ND18" DatabaseField="ND18"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="200px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="ND18d" DatabaseField="ND18d"  IsEntryField="true" IsDoubleEntryField="false"  FieldLabelWidth="200px" FieldTextBoxWidth = "400px" FieldTextBoxHeight = "70px" FieldTextBoxTextMode="MultiLine"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="ND19" DatabaseField="ND19"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="200px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="ND20" DatabaseField="ND20"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="200px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="ND21a" DatabaseField="ND21a"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="200px" FieldTextBoxWidth="100px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="ND21b" DatabaseField="ND21b"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="200px" FieldTextBoxWidth="100px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="ND21c" DatabaseField="ND21c"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="200px" FieldTextBoxWidth="100px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="ND23" DatabaseField="ND23"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="200px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="ND23d" DatabaseField="ND23d"  IsEntryField="true" IsDoubleEntryField="false"  FieldLabelWidth="200px" FieldTextBoxWidth = "400px" FieldTextBoxHeight = "70px" FieldTextBoxTextMode="MultiLine"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="ND24" DatabaseField="ND24"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="200px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="ND24d" DatabaseField="ND24d"  IsEntryField="true" IsDoubleEntryField="false"  FieldLabelWidth="200px" FieldTextBoxWidth = "400px" FieldTextBoxHeight = "70px" FieldTextBoxTextMode="MultiLine"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="ND25" DatabaseField="ND25"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="200px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="ND25d" DatabaseField="ND25d"  IsEntryField="true" IsDoubleEntryField="false"  FieldLabelWidth="200px" FieldTextBoxWidth = "400px" FieldTextBoxHeight = "70px" FieldTextBoxTextMode="MultiLine"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="ND26" DatabaseField="ND26"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="200px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="ND26d" DatabaseField="ND26d"  IsEntryField="true" IsDoubleEntryField="false"  FieldLabelWidth="200px" FieldTextBoxWidth = "400px" FieldTextBoxHeight = "70px" FieldTextBoxTextMode="MultiLine"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="ND27" DatabaseField="ND27"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="200px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="ND27d" DatabaseField="ND27d"  IsEntryField="true" IsDoubleEntryField="false"  FieldLabelWidth="200px" FieldTextBoxWidth = "400px" FieldTextBoxHeight = "70px" FieldTextBoxTextMode="MultiLine"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="ND28" DatabaseField="ND28"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="200px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="ND28d" DatabaseField="ND28d"  IsEntryField="true" IsDoubleEntryField="false"  FieldLabelWidth="200px" FieldTextBoxWidth = "400px" FieldTextBoxHeight = "70px" FieldTextBoxTextMode="MultiLine"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="ND29" DatabaseField="ND29"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="200px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="ND30" DatabaseField="ND30"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="200px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
</asp:panel>
<br />
<def:datafieldcontrol runat="server" id="created" DatabaseField="created"  IsReadOnly="true" RenderReadOnlyAsDiv="true"   FieldLabelWidth="200px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="createdBy" DatabaseField="createdBy"  IsReadOnly="true" RenderReadOnlyAsDiv="true"   FieldLabelWidth="200px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="updated" DatabaseField="updated"  IsReadOnly="true" RenderReadOnlyAsDiv="true"   FieldLabelWidth="200px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="updatedBy" DatabaseField="updatedBy"  IsReadOnly="true" RenderReadOnlyAsDiv="true"   FieldLabelWidth="200px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="scored" DatabaseField="scored"  IsReadOnly="true" RenderReadOnlyAsDiv="true"   FieldLabelWidth="200px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="scoredBy" DatabaseField="scoredBy"  IsReadOnly="true" RenderReadOnlyAsDiv="true"   FieldLabelWidth="200px"></def:datafieldcontrol>
</asp:Content>
