<%@ Register TagPrefix="def" Namespace="DataEntryFramework3" %> 
<%@ Page language="c#" MasterPageFile="~/UWAC.master"  Title="BAPQ Data Entry" %>
<asp:Content ID="Content1" ContentPlaceHolderID="oBodyPlaceHolder" runat="server">

<def:dataentrycontroller id="DataEntryController1" runat="server" DatabaseTable="ALL_BAPQ" PrimaryKeyField="bapqpk">
</def:dataentrycontroller>
<def:datafieldcontrol runat="server" id="id" DatabaseField="id" IsInsertField="true" FieldLabelWidth="300px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="15"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="indexnum" DatabaseField="indexnum" IsInsertField="true" FieldTextBoxTextDefault="1" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>


<asp:Panel id="mainPanel" Runat="server">
<br/>
<table>
<tr><td>
<def:datafieldcontrol runat="server" id="bapqdate" DatabaseField="bapqdate" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px"></def:datafieldcontrol>
</td>
<td></td></tr>
<tr><td>
<def:datafieldcontrol runat="server" id="bapqagemo" DatabaseField="bapqagemo" IsReadOnly="true" RenderReadOnlyAsDiv="true"  FieldLabelWidth="300px" FieldTextBoxWidth="50px"></def:datafieldcontrol>
</td>
<td></td></tr>
<tr><td>
<def:datafieldcontrol runat="server" id="bapqageym" DatabaseField="bapqageym" IsReadOnly="true" RenderReadOnlyAsDiv="true"  FieldLabelWidth="300px" FieldTextBoxWidth="50px" FieldTextBoxMaxLength="12"></def:datafieldcontrol>
</td>
<td></td></tr>
 
 <tr>
<td>

<def:datafieldcontrol runat="server" id="bapqrelat" DatabaseField="bapqrelat" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
</td><td>
<def:ValueSetLabel ID="ValueSetLabel_bapqrelat" runat="server"  DatabaseField="bapqrelat" FontColor="blue"></def:ValueSetLabel>
</td>
</tr>
<tr><td>
<def:datafieldcontrol runat="server" id="bapqrelatother" DatabaseField="bapqrelatother" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="300px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="50"></def:datafieldcontrol>
</td> </tr>
 </table>
 
<def:ValueSetLabel ID="ValueSetLabel_bapq01" runat="server"  DatabaseField="bapq01" FontColor="blue"></def:ValueSetLabel>
 
<def:datafieldcontrol runat="server" id="bapq01" DatabaseField="bapq01" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="500px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="bapq02" DatabaseField="bapq02" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="500px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="bapq03" DatabaseField="bapq03" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="500px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="bapq04" DatabaseField="bapq04" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="500px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="bapq05" DatabaseField="bapq05" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="500px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="bapq06" DatabaseField="bapq06" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="500px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="bapq07" DatabaseField="bapq07" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="500px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="bapq08" DatabaseField="bapq08" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="500px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="bapq09" DatabaseField="bapq09" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="500px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="bapq10" DatabaseField="bapq10" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="500px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="bapq11" DatabaseField="bapq11" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="500px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="bapq12" DatabaseField="bapq12" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="500px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="bapq13" DatabaseField="bapq13" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="500px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="bapq14" DatabaseField="bapq14" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="500px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="bapq15" DatabaseField="bapq15" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="500px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="bapq16" DatabaseField="bapq16" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="500px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="bapq17" DatabaseField="bapq17" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="500px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="bapq18" DatabaseField="bapq18" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="500px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="bapq19" DatabaseField="bapq19" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="500px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="bapq20" DatabaseField="bapq20" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="500px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="bapq21" DatabaseField="bapq21" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="500px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="bapq22" DatabaseField="bapq22" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="500px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="bapq23" DatabaseField="bapq23" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="500px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="bapq24" DatabaseField="bapq24" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="500px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="bapq25" DatabaseField="bapq25" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="500px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="bapq26" DatabaseField="bapq26" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="500px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="bapq27" DatabaseField="bapq27" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="500px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="bapq28" DatabaseField="bapq28" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="500px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="bapq29" DatabaseField="bapq29" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="500px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="bapq30" DatabaseField="bapq30" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="500px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="bapq31" DatabaseField="bapq31" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="500px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="bapq32" DatabaseField="bapq32" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="500px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="bapq33" DatabaseField="bapq33" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="500px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="bapq34" DatabaseField="bapq34" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="500px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="bapq35" DatabaseField="bapq35" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="500px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="bapq36" DatabaseField="bapq36" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="500px" FieldTextBoxWidth="40px"></def:datafieldcontrol>

<br/>
<br/>
<def:datafieldcontrol runat="server" id="bapqaloof" DatabaseField="bapqaloof"  IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="250px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="bapqrigid" DatabaseField="bapqrigid" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="250px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="bapqpraglang" DatabaseField="bapqpraglang" IsReadOnly="true" RenderReadOnlyAsDiv="true"  FieldLabelWidth="250px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="bapqtotal" DatabaseField="bapqtotal" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="250px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="bapqscrmsg" DatabaseField="bapqscrmsg" IsReadOnly="true" RenderReadOnlyAsDiv="true"  FieldLabelWidth="200px" FieldTextBoxWidth="400px" FieldTextBoxHeight="40px" FieldTextBoxTextMode="multiline" FieldTextBoxMaxLength="250"></def:datafieldcontrol>

<br/>
<br/>

<def:datafieldcontrol runat="server" id="created" DatabaseField="created" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="300px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="createdBy" DatabaseField="createdBy" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="300px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="50"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="updated" DatabaseField="updated" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="300px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="updatedBy" DatabaseField="updatedBy" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="300px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="50"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="scored" DatabaseField="scored" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="300px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="scoredBy" DatabaseField="scoredBy" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="300px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="50"></def:datafieldcontrol>

</asp:Panel>

</asp:Content>
