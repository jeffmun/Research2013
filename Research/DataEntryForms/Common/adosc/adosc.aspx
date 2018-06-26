<%@ Register TagPrefix="def" Namespace="DataEntryFramework3" %> 
<%@ Page language="c#" MasterPageFile="~/UWAC.master"  Title="ADOSC Data Entry" %>
<asp:Content ID="Content1" ContentPlaceHolderID="oBodyPlaceHolder" runat="server">

<def:dataentrycontroller id="DataEntryController1" runat="server" DatabaseTable="ALL_ADOSC" PrimaryKeyField="adoscpk">
</def:dataentrycontroller>

<br/>
<def:datafieldcontrol runat="server" id="id" DatabaseField="id" IsInsertField="true" FieldLabelWidth="300px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="15"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="indexnum" DatabaseField="indexnum" IsInsertField="true" FieldTextBoxTextDefault="1" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<br/>
<def:datafieldcontrol runat="server" id="adoscdate" DatabaseField="adoscdate" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px"  FormatString="{0:d}"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="adoscagemo" DatabaseField="adoscagemo" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="adoscclin" DatabaseField="adoscclin" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="300px" FieldTextBoxWidth="100px" FieldTextBoxMaxLength="20"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="adosccoder" DatabaseField="adosccoder" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="300px" FieldTextBoxWidth="100px" FieldTextBoxMaxLength="20"></def:datafieldcontrol>

<br/>
<def:datafieldcontrol runat="server" id="adoscvld" DatabaseField="adoscvld" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<br/>
<table >
<tr><td width = "100"></td><td align="left"><b><u>Period A</u></b></td><td><b><u>Period B</u></b></td></tr>
<tr>
<td colspan="2">
<def:datafieldcontrol runat="server" id="adoscA01" DatabaseField="adoscA01" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="adoscA02" DatabaseField="adoscA02" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="adoscA03" DatabaseField="adoscA03" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="adoscA04" DatabaseField="adoscA04" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="adoscA05" DatabaseField="adoscA05" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="adoscA06" DatabaseField="adoscA06" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="adoscA07" DatabaseField="adoscA07" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="adoscA08" DatabaseField="adoscA08" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="adoscA09" DatabaseField="adoscA09" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="adoscA10" DatabaseField="adoscA10" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="adoscA11" DatabaseField="adoscA11" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="adoscA12" DatabaseField="adoscA12" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="adoscA13" DatabaseField="adoscA13" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="adoscA14" DatabaseField="adoscA14" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="adoscA15" DatabaseField="adoscA15" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="adoscAnotes" DatabaseField="adoscAnotes" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="200px" FieldTextBoxWidth="350px" FieldTextBoxHeight="40px" FieldTextBoxTextMode="multiline" FieldTextBoxMaxLength="250"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="adoscAtot" DatabaseField="adoscAtot" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
</td>
<td>
<def:datafieldcontrol runat="server" id="adoscB01" DatabaseField="adoscB01" IsEntryField="true" IsDoubleEntryField="true" ShowFieldLabel="true" FieldLabelWidth="40px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="adoscB02" DatabaseField="adoscB02" IsEntryField="true" IsDoubleEntryField="true" ShowFieldLabel="true" FieldLabelWidth="40px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="adoscB03" DatabaseField="adoscB03" IsEntryField="true" IsDoubleEntryField="true" ShowFieldLabel="true" FieldLabelWidth="40px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="adoscB04" DatabaseField="adoscB04" IsEntryField="true" IsDoubleEntryField="true" ShowFieldLabel="true" FieldLabelWidth="40px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="adoscB05" DatabaseField="adoscB05" IsEntryField="true" IsDoubleEntryField="true" ShowFieldLabel="true" FieldLabelWidth="40px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="adoscB06" DatabaseField="adoscB06" IsEntryField="true" IsDoubleEntryField="true" ShowFieldLabel="true" FieldLabelWidth="40px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="adoscB07" DatabaseField="adoscB07" IsEntryField="true" IsDoubleEntryField="true" ShowFieldLabel="true" FieldLabelWidth="40px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="adoscB08" DatabaseField="adoscB08" IsEntryField="true" IsDoubleEntryField="true" ShowFieldLabel="true" FieldLabelWidth="40px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="adoscB09" DatabaseField="adoscB09" IsEntryField="true" IsDoubleEntryField="true" ShowFieldLabel="true" FieldLabelWidth="40px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="adoscB10" DatabaseField="adoscB10" IsEntryField="true" IsDoubleEntryField="true" ShowFieldLabel="true" FieldLabelWidth="40px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="adoscB11" DatabaseField="adoscB11" IsEntryField="true" IsDoubleEntryField="true" ShowFieldLabel="true" FieldLabelWidth="40px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="adoscB12" DatabaseField="adoscB12" IsEntryField="true" IsDoubleEntryField="true" ShowFieldLabel="true" FieldLabelWidth="40px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="adoscB13" DatabaseField="adoscB13" IsEntryField="true" IsDoubleEntryField="true" ShowFieldLabel="true" FieldLabelWidth="40px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="adoscB14" DatabaseField="adoscB14" IsEntryField="true" IsDoubleEntryField="true" ShowFieldLabel="true" FieldLabelWidth="40px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="adoscB15" DatabaseField="adoscB15" IsEntryField="true" IsDoubleEntryField="true" ShowFieldLabel="true" FieldLabelWidth="40px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="adoscBnotes" DatabaseField="adoscBnotes" IsEntryField="true" IsDoubleEntryField="false" ShowFieldLabel="true"  FieldLabelWidth="60px" FieldTextBoxWidth="250px" FieldTextBoxHeight="40px" FieldTextBoxTextMode="multiline" FieldTextBoxMaxLength="250"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="adoscBtot" DatabaseField="adoscBtot" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="60px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
</td>
</tr>
</table>

<br/>

<def:datafieldcontrol runat="server" id="adosctot" DatabaseField="adosctot" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<br/>
<def:datafieldcontrol runat="server" id="adoscscrmsg" DatabaseField="adoscscrmsg" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>


<br/>
<br/>
<def:datafieldcontrol runat="server" id="created" DatabaseField="created" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="300px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="createdBy" DatabaseField="createdBy" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="300px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="50"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="updated" DatabaseField="updated" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="300px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="updatedBy" DatabaseField="updatedBy" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="300px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="50"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="scored" DatabaseField="scored" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="300px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="scoredBy" DatabaseField="scoredBy" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="300px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="50"></def:datafieldcontrol>
</asp:Content>

