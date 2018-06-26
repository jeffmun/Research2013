<%@ Register TagPrefix="def" Namespace="DataEntryFramework3" %> 
<%@ Page language="c#" MasterPageFile="~/UWAC.master"  Title="ParSatisQ Data Entry" %>
<asp:Content ID="Content1" ContentPlaceHolderID="oBodyPlaceHolder" runat="server">

<def:dataentrycontroller id="DataEntryController1" runat="server" DatabaseTable="ALL_ParSatisQ" PrimaryKeyField="parsat_pk" >
</def:dataentrycontroller>
<def:datafieldcontrol runat="server" id="id" DatabaseField="id" IsInsertField="true" FieldLabelWidth="300px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="15"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="indexnum" DatabaseField="indexnum" IsInsertField="true" FieldTextBoxTextDefault="1" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="parsatdate" DatabaseField="parsatdate" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px"  FormatString="{0:d}"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="parsatresp" DatabaseField="parsatresp" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="300px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="50"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="parsatagemos" DatabaseField="parsatagemos" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
 
 <br/>
 <br/>

 <table>

<tr> <td>
<def:datafieldcontrol runat="server" id="parsat01" DatabaseField="parsat01" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
 </td> </tr>
 <tr> <td>
<def:datafieldcontrol runat="server" id="parsat02" DatabaseField="parsat02" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
</td> <td></td></tr>
 <tr> <td>
<def:datafieldcontrol runat="server" id="parsat03" DatabaseField="parsat03" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
</td> <td></td></tr>
 <tr> <td>
<def:datafieldcontrol runat="server" id="parsat04" DatabaseField="parsat04" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
</td> <td></td></tr>
 <tr> <td>
<def:datafieldcontrol runat="server" id="parsat05" DatabaseField="parsat05" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
</td> <td></td></tr>
 <tr> <td>
<def:datafieldcontrol runat="server" id="parsat06" DatabaseField="parsat06" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
</td> <td></td></tr>
 <tr> <td>
<def:datafieldcontrol runat="server" id="parsat07" DatabaseField="parsat07" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
</td> <td></td></tr>
 <tr> <td>
<def:datafieldcontrol runat="server" id="parsat08" DatabaseField="parsat08" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
</td> <td></td></tr>
 <tr> <td>
<def:datafieldcontrol runat="server" id="parsat09" DatabaseField="parsat09" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
</td> <td></td></tr>
 <tr> <td>
<def:datafieldcontrol runat="server" id="parsat10" DatabaseField="parsat10" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
</td> <td></td></tr>
 <tr> <td>
<def:datafieldcontrol runat="server" id="parsat11" DatabaseField="parsat11" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
</td> <td></td></tr>
 <tr> <td>
<def:datafieldcontrol runat="server" id="parsat12" DatabaseField="parsat12" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
</td> <td></td></tr>
 <tr> <td>
<def:datafieldcontrol runat="server" id="parsat13" DatabaseField="parsat13" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
</td> <td></td></tr>
 <tr> <td>
<def:datafieldcontrol runat="server" id="parsat14" DatabaseField="parsat14" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
</td> <td></td></tr>
 <tr> <td>
<def:datafieldcontrol runat="server" id="parsat15a" DatabaseField="parsat15a" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
</td> <td>
<def:datafieldcontrol runat="server" id="parsat15a_notes" DatabaseField="parsat15a_notes" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="50px" FieldTextBoxWidth="400px" FieldTextBoxHeight="40px" FieldTextBoxTextMode="multiline" FieldTextBoxMaxLength="250"></def:datafieldcontrol>
</td> </tr>
 <tr> <td>
<def:datafieldcontrol runat="server" id="parsat15b" DatabaseField="parsat15b" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
</td> <td>
<def:datafieldcontrol runat="server" id="parsat15b_notes" DatabaseField="parsat15b_notes" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="50px" FieldTextBoxWidth="400px" FieldTextBoxHeight="40px" FieldTextBoxTextMode="multiline" FieldTextBoxMaxLength="250"></def:datafieldcontrol>
</td> </tr>
 <tr> <td>
<def:datafieldcontrol runat="server" id="parsat15c" DatabaseField="parsat15c" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
</td> <td>
<def:datafieldcontrol runat="server" id="parsat15c_notes" DatabaseField="parsat15c_notes" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="50px" FieldTextBoxWidth="400px" FieldTextBoxHeight="40px" FieldTextBoxTextMode="multiline" FieldTextBoxMaxLength="250"></def:datafieldcontrol>
</td> </tr>
 <tr> <td>
<def:datafieldcontrol runat="server" id="parsat15d" DatabaseField="parsat15d" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
</td> <td>
<def:datafieldcontrol runat="server" id="parsat15d_notes" DatabaseField="parsat15d_notes" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="50px" FieldTextBoxWidth="400px" FieldTextBoxHeight="40px" FieldTextBoxTextMode="multiline" FieldTextBoxMaxLength="250"></def:datafieldcontrol>
</td> </tr>
 <tr> <td>
<def:datafieldcontrol runat="server" id="parsat15e" DatabaseField="parsat15e" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
</td> <td>
<def:datafieldcontrol runat="server" id="parsat15e_notes" DatabaseField="parsat15e_notes" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="50px" FieldTextBoxWidth="400px" FieldTextBoxHeight="40px" FieldTextBoxTextMode="multiline" FieldTextBoxMaxLength="250"></def:datafieldcontrol>
</td> </tr>
 <tr> <td>
<def:datafieldcontrol runat="server" id="parsat15f" DatabaseField="parsat15f" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
</td> <td>
<def:datafieldcontrol runat="server" id="parsat15f_notes" DatabaseField="parsat15f_notes" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="50px" FieldTextBoxWidth="400px" FieldTextBoxHeight="40px" FieldTextBoxTextMode="multiline" FieldTextBoxMaxLength="250"></def:datafieldcontrol>
</td> </tr>
 <tr> <td>
<def:datafieldcontrol runat="server" id="parsat15g" DatabaseField="parsat15g" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
</td> <td>
<def:datafieldcontrol runat="server" id="parsat15g_notes" DatabaseField="parsat15g_notes" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="50px" FieldTextBoxWidth="400px" FieldTextBoxHeight="40px" FieldTextBoxTextMode="multiline" FieldTextBoxMaxLength="250"></def:datafieldcontrol>
</td> </tr>
</tr>
</table>
<def:datafieldcontrol runat="server" id="parsat16other" DatabaseField="parsat16other" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="300px" FieldTextBoxWidth="400px" FieldTextBoxHeight="40px" FieldTextBoxTextMode="multiline" FieldTextBoxMaxLength="250"></def:datafieldcontrol>



<def:datafieldcontrol runat="server" id="created" DatabaseField="created" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="300px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="createdBy" DatabaseField="createdBy" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="300px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="50"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="updated" DatabaseField="updated" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="300px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="updatedBy" DatabaseField="updatedBy" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="300px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="50"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="scored" DatabaseField="scored" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="300px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="scoredBy" DatabaseField="scoredBy" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="300px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="50"></def:datafieldcontrol>


</asp:Content>
