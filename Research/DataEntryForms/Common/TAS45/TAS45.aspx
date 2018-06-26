<%@ Register TagPrefix="def" Namespace="DataEntryFramework3" %> 
<%@ Page language="c#" MasterPageFile="~/UWAC.master"  Title="TAS45 Data Entry" %>
<asp:Content ID="Content1" ContentPlaceHolderID="oBodyPlaceHolder" runat="server">

<def:dataentrycontroller id="DataEntryController1" runat="server" DatabaseTable="ALL_TAS45" PrimaryKeyField="tas45_pk">
</def:dataentrycontroller>
<def:datafieldcontrol runat="server" id="id" DatabaseField="id" IsInsertField="true" FieldLabelWidth="200px" FieldTextBoxWidth="100px" FieldTextBoxMaxLength="15"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="indexnum" DatabaseField="indexnum" IsInsertField="true" FieldTextBoxTextDefault="1" FieldLabelWidth="200px" FieldTextBoxWidth="40px"></def:datafieldcontrol>


<div class="main">

<br/>
<def:datafieldcontrol runat="server" id="tas45date" DatabaseField="tas45date" IsEntryField="true" IsDoubleEntryField="true" IsEntryValueRequired="true" FieldLabelWidth="200px" FieldTextBoxWidth="150px" ></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="tas45codedate" DatabaseField="tas45codedate" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="200px" FieldTextBoxWidth="150px" ></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="tas45coder" DatabaseField="tas45coder" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="200px" FieldTextBoxWidth="150px" FieldTextBoxMaxLength="50"></def:datafieldcontrol>

<def:datafieldcontrol runat="server" id="tas45timepoint" DatabaseField="tas45timepoint" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="200px" FieldTextBoxWidth="150px" FieldTextBoxMaxLength="50"></def:datafieldcontrol>

<br/>
<def:datafieldcontrol runat="server" id="tas45agemo" DatabaseField="tas45agemo" IsReadOnly="true" FieldLabelWidth="200px" RenderReadOnlyAsDiv="true" FieldTextBoxWidth="150px" ></def:datafieldcontrol>
<br/>
</div>
<asp:panel id="mainPanel" CssClass="mainPanel" runat="server">

<div class="main">
<font color="darkred"><i> Enter 1,2,3 for each item. (Blank or missing items enter 9)</i></font>

<table>

<tr> <td>

<table>
<tr><u>Page 1</u></tr>

<tr>	<td>	<def:datafieldcontrol runat="server" id="M01_1" DatabaseField="M01_1" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="100px" FieldTextBoxWidth="40px"></def:datafieldcontrol>	</td>
	<td>	<def:datafieldcontrol runat="server" id="L01_1" DatabaseField="L01_1" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="100px" FieldTextBoxWidth="40px"></def:datafieldcontrol>	</td>
<tr>	<td>	<def:datafieldcontrol runat="server" id="M02_1" DatabaseField="M02_1" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="100px" FieldTextBoxWidth="40px"></def:datafieldcontrol>	</td>
	<td>	<def:datafieldcontrol runat="server" id="L02_1" DatabaseField="L02_1" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="100px" FieldTextBoxWidth="40px"></def:datafieldcontrol>	</td>
<tr>	<td>	<def:datafieldcontrol runat="server" id="M03_1" DatabaseField="M03_1" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="100px" FieldTextBoxWidth="40px"></def:datafieldcontrol>	</td>
	<td>	<def:datafieldcontrol runat="server" id="L03_1" DatabaseField="L03_1" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="100px" FieldTextBoxWidth="40px"></def:datafieldcontrol>	</td>
<tr>	<td>	<def:datafieldcontrol runat="server" id="M04_1" DatabaseField="M04_1" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="100px" FieldTextBoxWidth="40px"></def:datafieldcontrol>	</td>
	<td>	<def:datafieldcontrol runat="server" id="L04_1" DatabaseField="L04_1" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="100px" FieldTextBoxWidth="40px"></def:datafieldcontrol>	</td>
<tr>	<td>	<def:datafieldcontrol runat="server" id="M05_1" DatabaseField="M05_1" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="100px" FieldTextBoxWidth="40px"></def:datafieldcontrol>	</td>
	<td>	<def:datafieldcontrol runat="server" id="L05_1" DatabaseField="L05_1" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="100px" FieldTextBoxWidth="40px"></def:datafieldcontrol>	</td>
<tr>	<td>	<def:datafieldcontrol runat="server" id="M06_1" DatabaseField="M06_1" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="100px" FieldTextBoxWidth="40px"></def:datafieldcontrol>	</td>
	<td>	<def:datafieldcontrol runat="server" id="L06_1" DatabaseField="L06_1" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="100px" FieldTextBoxWidth="40px"></def:datafieldcontrol>	</td>
<tr>	<td>	<def:datafieldcontrol runat="server" id="M07_1" DatabaseField="M07_1" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="100px" FieldTextBoxWidth="40px"></def:datafieldcontrol>	</td>
	<td>	<def:datafieldcontrol runat="server" id="L07_1" DatabaseField="L07_1" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="100px" FieldTextBoxWidth="40px"></def:datafieldcontrol>	</td>
<tr>	<td>	<def:datafieldcontrol runat="server" id="M08_1" DatabaseField="M08_1" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="100px" FieldTextBoxWidth="40px"></def:datafieldcontrol>	</td>
	<td>	<def:datafieldcontrol runat="server" id="L08_1" DatabaseField="L08_1" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="100px" FieldTextBoxWidth="40px"></def:datafieldcontrol>	</td>
<tr>	<td>	<def:datafieldcontrol runat="server" id="M09_1" DatabaseField="M09_1" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="100px" FieldTextBoxWidth="40px"></def:datafieldcontrol>	</td>
	<td>	<def:datafieldcontrol runat="server" id="L09_1" DatabaseField="L09_1" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="100px" FieldTextBoxWidth="40px"></def:datafieldcontrol>	</td>
<tr>	<td>	<def:datafieldcontrol runat="server" id="M10_1" DatabaseField="M10_1" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="100px" FieldTextBoxWidth="40px"></def:datafieldcontrol>	</td>
	<td>	<def:datafieldcontrol runat="server" id="L10_1" DatabaseField="L10_1" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="100px" FieldTextBoxWidth="40px"></def:datafieldcontrol>	</td>
<tr>	<td>	<def:datafieldcontrol runat="server" id="M11_1" DatabaseField="M11_1" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="100px" FieldTextBoxWidth="40px"></def:datafieldcontrol>	</td>
	<td>	<def:datafieldcontrol runat="server" id="L11_1" DatabaseField="L11_1" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="100px" FieldTextBoxWidth="40px"></def:datafieldcontrol>	</td>
<tr>	<td>	<def:datafieldcontrol runat="server" id="M12_1" DatabaseField="M12_1" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="100px" FieldTextBoxWidth="40px"></def:datafieldcontrol>	</td>
	<td>	<def:datafieldcontrol runat="server" id="L12_1" DatabaseField="L12_1" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="100px" FieldTextBoxWidth="40px"></def:datafieldcontrol>	</td>
<tr>	<td>	<def:datafieldcontrol runat="server" id="M13_1" DatabaseField="M13_1" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="100px" FieldTextBoxWidth="40px"></def:datafieldcontrol>	</td>
	<td>	<def:datafieldcontrol runat="server" id="L13_1" DatabaseField="L13_1" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="100px" FieldTextBoxWidth="40px"></def:datafieldcontrol>	</td>
<tr>	<td>	<def:datafieldcontrol runat="server" id="M14_1" DatabaseField="M14_1" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="100px" FieldTextBoxWidth="40px"></def:datafieldcontrol>	</td>
	<td>	<def:datafieldcontrol runat="server" id="L14_1" DatabaseField="L14_1" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="100px" FieldTextBoxWidth="40px"></def:datafieldcontrol>	</td>
<tr>	<td>	<def:datafieldcontrol runat="server" id="M15_1" DatabaseField="M15_1" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="100px" FieldTextBoxWidth="40px"></def:datafieldcontrol>	</td>
	<td>	<def:datafieldcontrol runat="server" id="L15_1" DatabaseField="L15_1" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="100px" FieldTextBoxWidth="40px"></def:datafieldcontrol>	</td>
</table>
</td>

<td width="100px"></td>


<td>
<table>

<tr><u>Page 2</u></tr>
<tr>	<td>	<def:datafieldcontrol runat="server" id="M16_1" DatabaseField="M16_1" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="100px" FieldTextBoxWidth="40px"></def:datafieldcontrol>	</td>
	<td>	<def:datafieldcontrol runat="server" id="L16_1" DatabaseField="L16_1" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="100px" FieldTextBoxWidth="40px"></def:datafieldcontrol>	</td>
<tr>	<td>	<def:datafieldcontrol runat="server" id="M17_1" DatabaseField="M17_1" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="100px" FieldTextBoxWidth="40px"></def:datafieldcontrol>	</td>
	<td>	<def:datafieldcontrol runat="server" id="L17_1" DatabaseField="L17_1" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="100px" FieldTextBoxWidth="40px"></def:datafieldcontrol>	</td>
<tr>	<td>	<def:datafieldcontrol runat="server" id="M18_1" DatabaseField="M18_1" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="100px" FieldTextBoxWidth="40px"></def:datafieldcontrol>	</td>
	<td>	<def:datafieldcontrol runat="server" id="L18_1" DatabaseField="L18_1" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="100px" FieldTextBoxWidth="40px"></def:datafieldcontrol>	</td>
<tr>	<td>	<def:datafieldcontrol runat="server" id="M19_1" DatabaseField="M19_1" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="100px" FieldTextBoxWidth="40px"></def:datafieldcontrol>	</td>
	<td>	<def:datafieldcontrol runat="server" id="L19_1" DatabaseField="L19_1" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="100px" FieldTextBoxWidth="40px"></def:datafieldcontrol>	</td>
<tr>	<td>	<def:datafieldcontrol runat="server" id="M20_1" DatabaseField="M20_1" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="100px" FieldTextBoxWidth="40px"></def:datafieldcontrol>	</td>
	<td>	<def:datafieldcontrol runat="server" id="L20_1" DatabaseField="L20_1" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="100px" FieldTextBoxWidth="40px"></def:datafieldcontrol>	</td>
<tr>	<td>	<def:datafieldcontrol runat="server" id="M21_1" DatabaseField="M21_1" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="100px" FieldTextBoxWidth="40px"></def:datafieldcontrol>	</td>
	<td>	<def:datafieldcontrol runat="server" id="L21_1" DatabaseField="L21_1" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="100px" FieldTextBoxWidth="40px"></def:datafieldcontrol>	</td>
<tr>	<td>	<def:datafieldcontrol runat="server" id="M22_1" DatabaseField="M22_1" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="100px" FieldTextBoxWidth="40px"></def:datafieldcontrol>	</td>
	<td>	<def:datafieldcontrol runat="server" id="L22_1" DatabaseField="L22_1" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="100px" FieldTextBoxWidth="40px"></def:datafieldcontrol>	</td>
<tr>	<td>	<def:datafieldcontrol runat="server" id="M23_1" DatabaseField="M23_1" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="100px" FieldTextBoxWidth="40px"></def:datafieldcontrol>	</td>
	<td>	<def:datafieldcontrol runat="server" id="L23_1" DatabaseField="L23_1" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="100px" FieldTextBoxWidth="40px"></def:datafieldcontrol>	</td>
<tr>	<td>	<def:datafieldcontrol runat="server" id="M24_1" DatabaseField="M24_1" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="100px" FieldTextBoxWidth="40px"></def:datafieldcontrol>	</td>
	<td>	<def:datafieldcontrol runat="server" id="L24_1" DatabaseField="L24_1" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="100px" FieldTextBoxWidth="40px"></def:datafieldcontrol>	</td>
<tr>	<td>	<def:datafieldcontrol runat="server" id="M25_1" DatabaseField="M25_1" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="100px" FieldTextBoxWidth="40px"></def:datafieldcontrol>	</td>
	<td>	<def:datafieldcontrol runat="server" id="L25_1" DatabaseField="L25_1" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="100px" FieldTextBoxWidth="40px"></def:datafieldcontrol>	</td>
<tr>	<td>	<def:datafieldcontrol runat="server" id="M26_1" DatabaseField="M26_1" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="100px" FieldTextBoxWidth="40px"></def:datafieldcontrol>	</td>
	<td>	<def:datafieldcontrol runat="server" id="L26_1" DatabaseField="L26_1" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="100px" FieldTextBoxWidth="40px"></def:datafieldcontrol>	</td>
<tr>	<td>	<def:datafieldcontrol runat="server" id="M27_1" DatabaseField="M27_1" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="100px" FieldTextBoxWidth="40px"></def:datafieldcontrol>	</td>
	<td>	<def:datafieldcontrol runat="server" id="L27_1" DatabaseField="L27_1" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="100px" FieldTextBoxWidth="40px"></def:datafieldcontrol>	</td>
<tr>	<td>	<def:datafieldcontrol runat="server" id="M28_1" DatabaseField="M28_1" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="100px" FieldTextBoxWidth="40px"></def:datafieldcontrol>	</td>
	<td>	<def:datafieldcontrol runat="server" id="L28_1" DatabaseField="L28_1" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="100px" FieldTextBoxWidth="40px"></def:datafieldcontrol>	</td>
<tr>	<td>	<def:datafieldcontrol runat="server" id="M29_1" DatabaseField="M29_1" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="100px" FieldTextBoxWidth="40px"></def:datafieldcontrol>	</td>
	<td>	<def:datafieldcontrol runat="server" id="L29_1" DatabaseField="L29_1" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="100px" FieldTextBoxWidth="40px"></def:datafieldcontrol>	</td>
<tr>	<td>	<def:datafieldcontrol runat="server" id="M30_1" DatabaseField="M30_1" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="100px" FieldTextBoxWidth="40px"></def:datafieldcontrol>	</td>
	<td>	<def:datafieldcontrol runat="server" id="L30_1" DatabaseField="L30_1" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="100px" FieldTextBoxWidth="40px"></def:datafieldcontrol>	</td>


</table>
</td></tr>
</table>

</div>



<!-- Scoring variables

<div class="main">

<def:datafieldcontrol runat="server" id="V01" DatabaseField="V01" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="V02" DatabaseField="V02" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="V03" DatabaseField="V03" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="V04" DatabaseField="V04" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="V05" DatabaseField="V05" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="V06" DatabaseField="V06" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="V07" DatabaseField="V07" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="V08" DatabaseField="V08" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="V09" DatabaseField="V09" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="V10" DatabaseField="V10" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="V11" DatabaseField="V11" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="V12" DatabaseField="V12" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="V13" DatabaseField="V13" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="V14" DatabaseField="V14" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="V15" DatabaseField="V15" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="V16" DatabaseField="V16" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="V17" DatabaseField="V17" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="V18" DatabaseField="V18" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="V19" DatabaseField="V19" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="V20" DatabaseField="V20" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="V21" DatabaseField="V21" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="V22" DatabaseField="V22" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="V23" DatabaseField="V23" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="V24" DatabaseField="V24" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="V25" DatabaseField="V25" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="V26" DatabaseField="V26" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="V27" DatabaseField="V27" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="V28" DatabaseField="V28" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="V29" DatabaseField="V29" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="V30" DatabaseField="V30" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="V31" DatabaseField="V31" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="V32" DatabaseField="V32" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="V33" DatabaseField="V33" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="V34" DatabaseField="V34" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="V35" DatabaseField="V35" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="V36" DatabaseField="V36" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="V37" DatabaseField="V37" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="V38" DatabaseField="V38" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="V39" DatabaseField="V39" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="V40" DatabaseField="V40" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="V41" DatabaseField="V41" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="V42" DatabaseField="V42" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="V43" DatabaseField="V43" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="V44" DatabaseField="V44" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="V45" DatabaseField="V45" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>

</div>
-->

<div class="collection">
<div class="main">
<br/>
<br/>
<b> <u>Scored Variables </u></b>

<br/>
<font color="red">
<def:datafieldcontrol runat="server" id="tas45scrmsg" DatabaseField="tas45scrmsg" IsReadOnly="true" FieldLabelWidth="150px"  RenderReadOnlyAsDiv="true" FieldTextBoxWidth="500px"></def:datafieldcontrol>
</font>
<br/>

<font face="Courier New">
<def:datafieldcontrol runat="server" id="CLASS" DatabaseField="CLASS" IsReadOnly="true" FieldLabelWidth="450px"  RenderReadOnlyAsDiv="true" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="CLASStxt" DatabaseField="CLASStxt" IsReadOnly="true" FieldLabelWidth="450px"  RenderReadOnlyAsDiv="true" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="CONF" DatabaseField="CONF" IsReadOnly="true" FieldLabelWidth="450px"  RenderReadOnlyAsDiv="true" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<br/>
<def:datafieldcontrol runat="server" id="B0" DatabaseField="B0" IsReadOnly="true" FieldLabelWidth="450px"  RenderReadOnlyAsDiv="true" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="B1" DatabaseField="B1" IsReadOnly="true" FieldLabelWidth="450px"  RenderReadOnlyAsDiv="true" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="B2" DatabaseField="B2" IsReadOnly="true" FieldLabelWidth="450px"  RenderReadOnlyAsDiv="true" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="B3" DatabaseField="B3" IsReadOnly="true" FieldLabelWidth="450px"  RenderReadOnlyAsDiv="true" FieldTextBoxWidth="40px"></def:datafieldcontrol>

<br/>
<def:datafieldcontrol runat="server" id="ISSTDEV" DatabaseField="ISSTDEV" IsReadOnly="true" FieldLabelWidth="450px"  RenderReadOnlyAsDiv="true" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="SZSQ" DatabaseField="SZSQ" IsReadOnly="true" FieldLabelWidth="450px"  RenderReadOnlyAsDiv="true" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="R" DatabaseField="R" IsReadOnly="true" FieldLabelWidth="450px"  RenderReadOnlyAsDiv="true" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<br/>
<def:datafieldcontrol runat="server" id="DA" DatabaseField="DA" IsReadOnly="true" FieldLabelWidth="450px"  RenderReadOnlyAsDiv="true" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="DB" DatabaseField="DB" IsReadOnly="true" FieldLabelWidth="450px"  RenderReadOnlyAsDiv="true" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="DC" DatabaseField="DC" IsReadOnly="true" FieldLabelWidth="450px"  RenderReadOnlyAsDiv="true" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<br/>
<def:datafieldcontrol runat="server" id="S" DatabaseField="S" IsReadOnly="true" FieldLabelWidth="450px"  RenderReadOnlyAsDiv="true" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="T" DatabaseField="T" IsReadOnly="true" FieldLabelWidth="450px"  RenderReadOnlyAsDiv="true" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="U" DatabaseField="U" IsReadOnly="true" FieldLabelWidth="450px"  RenderReadOnlyAsDiv="true" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="V" DatabaseField="V" IsReadOnly="true" FieldLabelWidth="450px"  RenderReadOnlyAsDiv="true" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="W" DatabaseField="W" IsReadOnly="true" FieldLabelWidth="450px"  RenderReadOnlyAsDiv="true" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="X" DatabaseField="X" IsReadOnly="true" FieldLabelWidth="450px"  RenderReadOnlyAsDiv="true" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="Y" DatabaseField="Y" IsReadOnly="true" FieldLabelWidth="450px"  RenderReadOnlyAsDiv="true" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="Z" DatabaseField="Z" IsReadOnly="true" FieldLabelWidth="450px"  RenderReadOnlyAsDiv="true" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="D" DatabaseField="D" IsReadOnly="true" FieldLabelWidth="450px"  RenderReadOnlyAsDiv="true" FieldTextBoxWidth="40px"></def:datafieldcontrol>

</font>
</div>
</div>



<div class="main">
<br/><br/>
<font color = "darkblue">
<def:datafieldcontrol runat="server" id="created" DatabaseField="created" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="120px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="createdBy" DatabaseField="createdBy" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="120px"  FieldTextBoxWidth="250px" FieldTextBoxMaxLength="50"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="updated" DatabaseField="updated" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="120px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="updatedBy" DatabaseField="updatedBy" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="120px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="50"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="scored" DatabaseField="scored" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="120px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="scoredBy" DatabaseField="scoredBy" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="120px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="50"></def:datafieldcontrol>
</font>
</div>


</asp:panel >

</asp:Content>
