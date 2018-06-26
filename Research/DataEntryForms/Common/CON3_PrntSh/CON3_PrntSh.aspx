<%@ Register TagPrefix="def" Namespace="DataEntryFramework3" %> 
<%@ Page language="c#" MasterPageFile="~/UWAC.master"  Title="CON3_PrntS Data Entry" %>
<asp:Content ID="Content1" ContentPlaceHolderID="oBodyPlaceHolder" runat="server">
<def:dataentrycontroller id="DataEntryController1" runat="server" DatabaseTable="ALL_CON3_PrntSh" >
</def:dataentrycontroller>
<def:datafieldcontrol runat="server" id="id" DatabaseField="id"  IsInsertField="true"   FieldLabelWidth="300px "></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="indexnum" DatabaseField="indexnum"  IsInsertField="true"   FieldLabelWidth="300px "></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="C3PSDate" DatabaseField="C3PSDate" FieldLabelText="Date of Administration" IsInsertField="true"  FieldLabelWidth="300px "></def:datafieldcontrol>
<br />

<br />
<table>
<tr>
<td>
<table cellpadding="1" border="1" style="vertical-align:top">
<tr>
<th>Subscale</th>
<th>Raw score</th>
<th>T-score</th>
</tr>
<tr>
<td>Inattention</td>
<td><def:datafieldcontrol runat="server" id="C3PS_INraw" DatabaseField="C3PS_INraw"  IsReadOnly="true" RenderReadOnlyAsDiv="true"   ShowFieldLabel="False"></def:datafieldcontrol></td>
<td><def:datafieldcontrol runat="server" id="C3PS_INt"   DatabaseField="C3PS_INt"    IsReadOnly="true" RenderReadOnlyAsDiv="true"   ShowFieldLabel="False"></def:datafieldcontrol></td>
</tr>
<tr>
<td>Hyperactivity/Impulsivity</td>
<td><def:datafieldcontrol runat="server" id="C3PS_HYraw" DatabaseField="C3PS_HYraw"  IsReadOnly="true" RenderReadOnlyAsDiv="true"   ShowFieldLabel="False"></def:datafieldcontrol></td>
<td><def:datafieldcontrol runat="server" id="C3PS_HYt"   DatabaseField="C3PS_HYt"    IsReadOnly="true" RenderReadOnlyAsDiv="true"   ShowFieldLabel="False"></def:datafieldcontrol></td>
</tr>
<tr>
<td>Learning Problems</td>
<td><def:datafieldcontrol runat="server" id="C3PS_LPraw" DatabaseField="C3PS_LPraw"  IsReadOnly="true" RenderReadOnlyAsDiv="true"   ShowFieldLabel="False"></def:datafieldcontrol></td>
<td><def:datafieldcontrol runat="server" id="C3PS_LPt"   DatabaseField="C3PS_LPt"    IsReadOnly="true" RenderReadOnlyAsDiv="true"   ShowFieldLabel="False"></def:datafieldcontrol></td>
</tr>
<tr>
<td>Executive Functioning</td>
<td><def:datafieldcontrol runat="server" id="C3PS_EFraw" DatabaseField="C3PS_EFraw"  IsReadOnly="true" RenderReadOnlyAsDiv="true"   ShowFieldLabel="False"></def:datafieldcontrol></td>
<td><def:datafieldcontrol runat="server" id="C3PS_EFt"   DatabaseField="C3PS_EFt"    IsReadOnly="true" RenderReadOnlyAsDiv="true"   ShowFieldLabel="False"></def:datafieldcontrol></td>
</tr>
<tr>
<td>Aggression</td>
<td><def:datafieldcontrol runat="server" id="C3PS_AGraw" DatabaseField="C3PS_AGraw"  IsReadOnly="true" RenderReadOnlyAsDiv="true"   ShowFieldLabel="False"></def:datafieldcontrol></td>
<td><def:datafieldcontrol runat="server" id="C3PS_AGt"   DatabaseField="C3PS_AGt"    IsReadOnly="true" RenderReadOnlyAsDiv="true"   ShowFieldLabel="False"></def:datafieldcontrol></td>
</tr>
<tr>
<td>Peer Relations</td>
<td><def:datafieldcontrol runat="server" id="C3PS_PRraw" DatabaseField="C3PS_PRraw"  IsReadOnly="true" RenderReadOnlyAsDiv="true"   ShowFieldLabel="False"></def:datafieldcontrol></td>
<td><def:datafieldcontrol runat="server" id="C3PS_PRt"   DatabaseField="C3PS_PRt"    IsReadOnly="true" RenderReadOnlyAsDiv="true"   ShowFieldLabel="False"></def:datafieldcontrol></td>
</tr>
</table>
</td>


<td>
<table cellpadding="1" border="1" >
<tr style="vertical-align:top">
<th>Subscale</th>
<th>Raw score</th>
<th>Validity</th>
</tr>
<tr>
<td>Positive Impression</td>
<td><def:datafieldcontrol runat="server" id="C3PS_PIraw" DatabaseField="C3PS_PIraw"  IsReadOnly="true" RenderReadOnlyAsDiv="true"   ShowFieldLabel="False"></def:datafieldcontrol></td>
<td><def:datafieldcontrol runat="server" id="C3PS_PIvldtxt"   DatabaseField="C3PS_PIvldtxt"    IsReadOnly="true" RenderReadOnlyAsDiv="true"   ShowFieldLabel="False"></def:datafieldcontrol></td>
</tr>
<tr>
<td>Negative Impression</td>
<td><def:datafieldcontrol runat="server" id="C3PS_NIraw" DatabaseField="C3PS_NIraw"  IsReadOnly="true" RenderReadOnlyAsDiv="true"   ShowFieldLabel="False"></def:datafieldcontrol></td>
<td><def:datafieldcontrol runat="server" id="C3PS_NIvldtxt"   DatabaseField="C3PS_NIvldtxt"    IsReadOnly="true" RenderReadOnlyAsDiv="true"   ShowFieldLabel="False"></def:datafieldcontrol></td>
</tr>
</table>
</td>
</tr>
</table>


<table cellpadding = "1" border="1">
<tr>
<td><b>Scoring message:</b></td>
<td><def:datafieldcontrol runat="server" id="C3PS_scrmsg"   DatabaseField="C3PS_scrmsg"    IsReadOnly="true" RenderReadOnlyAsDiv="true"   ShowFieldLabel="False" FieldTextBoxWidth="300px"></def:datafieldcontrol></td>
</tr>
</table>


<br />
<br />
<asp:panel id="mainPanel" runat="server">
<def:ValueSetLabel ID="ValueSetLabel_C3PS1" runat="server"  DatabaseField="C3PS1"></def:ValueSetLabel>
<br />
<def:datafieldcontrol runat="server" id="C3PS1" DatabaseField="C3PS1"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="60px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="C3PS2" DatabaseField="C3PS2"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="60px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="C3PS3" DatabaseField="C3PS3"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="60px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="C3PS4" DatabaseField="C3PS4"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="60px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="C3PS5" DatabaseField="C3PS5"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="60px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="C3PS6" DatabaseField="C3PS6"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="60px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="C3PS7" DatabaseField="C3PS7"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="60px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="C3PS8" DatabaseField="C3PS8"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="60px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="C3PS9" DatabaseField="C3PS9"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="60px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="C3PS10" DatabaseField="C3PS10"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="60px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="C3PS11" DatabaseField="C3PS11"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="60px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="C3PS12" DatabaseField="C3PS12"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="60px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="C3PS13" DatabaseField="C3PS13"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="60px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="C3PS14" DatabaseField="C3PS14"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="60px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="C3PS15" DatabaseField="C3PS15"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="60px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="C3PS16" DatabaseField="C3PS16"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="60px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="C3PS17" DatabaseField="C3PS17"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="60px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="C3PS18" DatabaseField="C3PS18"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="60px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="C3PS19" DatabaseField="C3PS19"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="60px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="C3PS20" DatabaseField="C3PS20"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="60px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="C3PS21" DatabaseField="C3PS21"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="60px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="C3PS22" DatabaseField="C3PS22"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="60px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="C3PS23" DatabaseField="C3PS23"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="60px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="C3PS24" DatabaseField="C3PS24"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="60px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="C3PS25" DatabaseField="C3PS25"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="60px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="C3PS26" DatabaseField="C3PS26"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="60px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="C3PS27" DatabaseField="C3PS27"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="60px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="C3PS28" DatabaseField="C3PS28"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="60px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="C3PS29" DatabaseField="C3PS29"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="60px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="C3PS30" DatabaseField="C3PS30"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="60px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="C3PS31" DatabaseField="C3PS31"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="60px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="C3PS32" DatabaseField="C3PS32"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="60px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="C3PS33" DatabaseField="C3PS33"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="60px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="C3PS34" DatabaseField="C3PS34"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="60px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="C3PS35" DatabaseField="C3PS35"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="60px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="C3PS36" DatabaseField="C3PS36"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="60px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="C3PS37" DatabaseField="C3PS37"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="60px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="C3PS38" DatabaseField="C3PS38"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="60px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="C3PS39" DatabaseField="C3PS39"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="60px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="C3PS40" DatabaseField="C3PS40"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="60px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="C3PS41" DatabaseField="C3PS41"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="60px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="C3PS42" DatabaseField="C3PS42"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="60px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="C3PS43" DatabaseField="C3PS43"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="60px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="C3PS44" DatabaseField="C3PS44"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxTextMode="MultiLine" FieldTextBoxWidth="400px" FieldTextBoxHeight="60px" FieldTextBoxMaxLength="1000"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="C3PS45" DatabaseField="C3PS45"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxTextMode="MultiLine" FieldTextBoxWidth="400px" FieldTextBoxHeight="60px" FieldTextBoxMaxLength="1000"></def:datafieldcontrol>
</asp:panel>





<br />
<def:datafieldcontrol runat="server" id="created" DatabaseField="created"  IsReadOnly="true" RenderReadOnlyAsDiv="true"   FieldLabelWidth="300px "></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="createdBy" DatabaseField="createdBy"  IsReadOnly="true" RenderReadOnlyAsDiv="true"   FieldLabelWidth="300px "></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="updated" DatabaseField="updated"  IsReadOnly="true" RenderReadOnlyAsDiv="true"   FieldLabelWidth="300px "></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="updatedBy" DatabaseField="updatedBy"  IsReadOnly="true" RenderReadOnlyAsDiv="true"   FieldLabelWidth="300px "></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="scored" DatabaseField="scored"  IsReadOnly="true" RenderReadOnlyAsDiv="true"   FieldLabelWidth="300px "></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="scoredBy" DatabaseField="scoredBy"  IsReadOnly="true" RenderReadOnlyAsDiv="true"   FieldLabelWidth="300px "></def:datafieldcontrol>
</asp:Content>
