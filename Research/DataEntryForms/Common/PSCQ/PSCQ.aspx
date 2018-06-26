<%@ Register TagPrefix="def" Namespace="DataEntryFramework3" %> 
<%@ Page language="c#" MasterPageFile="~/UWAC.master"  Title="PSCQ Data Entry" %>
<asp:Content ID="Content1" ContentPlaceHolderID="oBodyPlaceHolder" runat="server">

<def:dataentrycontroller id="DataEntryController1" runat="server" DatabaseTable="ALL_PSCQ" PrimaryKeyField="PSCQ_pk">
</def:dataentrycontroller>
   <asp:ScriptManager ID="ScriptManager1" runat="server">    </asp:ScriptManager>

   

<asp:UpdatePanel ID="UpdatePanel1" runat="server">
  <ContentTemplate>




<br />

<table>
 
<tr ><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="id" DatabaseField="id" IsInsertField="true" FieldLabelWidth="300px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="15"></def:datafieldcontrol></td>
 
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="indexnum" DatabaseField="indexnum" IsInsertField="true" FieldTextBoxTextDefault="1" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
 
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="PSCQ_date" DatabaseField="PSCQ_date" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FormatString="{0:d}" ></def:datafieldcontrol></td>
 
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="PSCQ_agemo" DatabaseField="PSCQ_agemo" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
 
<td></td></tr>
 
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="PSCQ_resp" DatabaseField="PSCQ_resp" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
 
<td><def:ValueSetLabel ID="ValueSetLabel1" runat="server"  DatabaseField="PSCQ_resp"></def:ValueSetLabel>

</td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="PSCQ_respoth" DatabaseField="PSCQ_respoth" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="300px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="50"></def:datafieldcontrol></td>
 
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="PSCQ_cmnt" DatabaseField="PSCQ_cmnt" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="250px"></def:datafieldcontrol></td>
 
<td></td></tr>
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="PSCQ_scrmsg" DatabaseField="PSCQ_scrmsg" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="300px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="50"></def:datafieldcontrol></td>
 
<td></td></tr>

 </table>

 <br /><br />
 
<table>
<tr  style="background-color:Silver"><td colspan="4"></td><td colspan="4"><b>Which children know each other? (enter 0=No, 1=Yes)</b></td></tr>

<tr  style="background-color:Silver"><td colspan="8">Individual Playmates</td></tr>
<tr>
<td align="right"><u>Inits</u></td>
<td align="right"><u>Years</u></td>
<td align="right"><u>Months</u></td>
<td align="right"><u>Sex<br />(1=B,2=G)</u></td>

<td align="right"><u>Knows 02</u></td>
<td align="right"><u>Knows 03</u></td>
<td align="right"><u>Knows 04</u></td>
<td align="right"><u>Knows 05</u></td>
</tr>
<tr>
<td><def:datafieldcontrol runat="server" id="PSCQinits_01" DatabaseField="PSCQinits_01" IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="100px" FieldTextBoxWidth="50px" FieldTextBoxMaxLength="15"></def:datafieldcontrol>
</td>

<td><def:datafieldcontrol runat="server" id="PSCQyrs_01" DatabaseField="PSCQyrs_01" IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="10px" FieldTextBoxWidth="40px" FieldTextBoxMaxLength="15"></def:datafieldcontrol></td>
<td><def:datafieldcontrol runat="server" id="PSCQmos_01" DatabaseField="PSCQmos_01" IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="10px" FieldTextBoxWidth="40px" FieldTextBoxMaxLength="15"></def:datafieldcontrol></td>
<td><def:datafieldcontrol runat="server" id="PSCQsex_01" DatabaseField="PSCQsex_01" IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="10px" FieldTextBoxWidth="40px" FieldTextBoxMaxLength="15"></def:datafieldcontrol></td>

<td>
<def:datafieldcontrol runat="server" id="PSCQknows_12" DatabaseField="PSCQknows_12" IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="30px" FieldTextBoxWidth="40px" FieldTextBoxMaxLength="15"></def:datafieldcontrol>
</td><td>
<def:datafieldcontrol runat="server" id="PSCQknows_13" DatabaseField="PSCQknows_13" IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="30px" FieldTextBoxWidth="40px" FieldTextBoxMaxLength="15"></def:datafieldcontrol>
</td><td>
<def:datafieldcontrol runat="server" id="PSCQknows_14" DatabaseField="PSCQknows_14" IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="30px" FieldTextBoxWidth="40px" FieldTextBoxMaxLength="15"></def:datafieldcontrol>
</td><td>
<def:datafieldcontrol runat="server" id="PSCQknows_15" DatabaseField="PSCQknows_15" IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="30px" FieldTextBoxWidth="40px" FieldTextBoxMaxLength="15"></def:datafieldcontrol>
</td>
</tr>

<tr>
<td>
<def:datafieldcontrol runat="server" id="PSCQinits_02" DatabaseField="PSCQinits_02" IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="100px" FieldTextBoxWidth="50px" FieldTextBoxMaxLength="15"></def:datafieldcontrol>
</td>
<td><def:datafieldcontrol runat="server" id="PSCQyrs_02" DatabaseField="PSCQyrs_02" IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="10px" FieldTextBoxWidth="40px" FieldTextBoxMaxLength="15"></def:datafieldcontrol></td>
<td><def:datafieldcontrol runat="server" id="PSCQmos_02" DatabaseField="PSCQmos_02" IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="10px" FieldTextBoxWidth="40px" FieldTextBoxMaxLength="15"></def:datafieldcontrol></td>
<td><def:datafieldcontrol runat="server" id="PSCQsex_02" DatabaseField="PSCQsex_02" IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="10px" FieldTextBoxWidth="40px" FieldTextBoxMaxLength="15"></def:datafieldcontrol></td>

<td>
</td><td>
<def:datafieldcontrol runat="server" id="PSCQknows_23" DatabaseField="PSCQknows_23" IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="30px" FieldTextBoxWidth="40px" FieldTextBoxMaxLength="15"></def:datafieldcontrol>
</td><td>
<def:datafieldcontrol runat="server" id="PSCQknows_24" DatabaseField="PSCQknows_24" IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="30px" FieldTextBoxWidth="40px" FieldTextBoxMaxLength="15"></def:datafieldcontrol>
</td><td>
<def:datafieldcontrol runat="server" id="PSCQknows_25" DatabaseField="PSCQknows_25" IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="30px" FieldTextBoxWidth="40px" FieldTextBoxMaxLength="15"></def:datafieldcontrol>
</td>
</tr>

<tr>
<td>
<def:datafieldcontrol runat="server" id="PSCQinits_03" DatabaseField="PSCQinits_03" IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="100px" FieldTextBoxWidth="50px" FieldTextBoxMaxLength="15"></def:datafieldcontrol>
</td>
<td><def:datafieldcontrol runat="server" id="PSCQyrs_03" DatabaseField="PSCQyrs_03" IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="10px" FieldTextBoxWidth="40px" FieldTextBoxMaxLength="15"></def:datafieldcontrol></td>
<td><def:datafieldcontrol runat="server" id="PSCQmos_03" DatabaseField="PSCQmos_03" IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="10px" FieldTextBoxWidth="40px" FieldTextBoxMaxLength="15"></def:datafieldcontrol></td>
<td><def:datafieldcontrol runat="server" id="PSCQsex_03" DatabaseField="PSCQsex_03" IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="10px" FieldTextBoxWidth="40px" FieldTextBoxMaxLength="15"></def:datafieldcontrol></td>

<td>
</td><td>
</td><td>
<def:datafieldcontrol runat="server" id="PSCQknows_34" DatabaseField="PSCQknows_34" IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="30px" FieldTextBoxWidth="40px" FieldTextBoxMaxLength="15"></def:datafieldcontrol>
</td><td>
<def:datafieldcontrol runat="server" id="PSCQknows_35" DatabaseField="PSCQknows_35" IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="30px" FieldTextBoxWidth="40px" FieldTextBoxMaxLength="15"></def:datafieldcontrol>
</td>
</tr>

<tr>
<td>
<def:datafieldcontrol runat="server" id="PSCQinits_04" DatabaseField="PSCQinits_04" IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="100px" FieldTextBoxWidth="50px" FieldTextBoxMaxLength="15"></def:datafieldcontrol>
</td>
<td><def:datafieldcontrol runat="server" id="PSCQyrs_04" DatabaseField="PSCQyrs_04" IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="10px" FieldTextBoxWidth="40px" FieldTextBoxMaxLength="15"></def:datafieldcontrol></td>
<td><def:datafieldcontrol runat="server" id="PSCQmos_04" DatabaseField="PSCQmos_04" IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="10px" FieldTextBoxWidth="40px" FieldTextBoxMaxLength="15"></def:datafieldcontrol></td>
<td><def:datafieldcontrol runat="server" id="PSCQsex_04" DatabaseField="PSCQsex_04" IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="10px" FieldTextBoxWidth="40px" FieldTextBoxMaxLength="15"></def:datafieldcontrol></td>

<td>
</td><td>
</td><td>
</td><td>
<def:datafieldcontrol runat="server" id="PSCQknows_45" DatabaseField="PSCQknows_45" IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="30px" FieldTextBoxWidth="40px" FieldTextBoxMaxLength="15"></def:datafieldcontrol>
</td>
</tr>

<tr>
<td>
<def:datafieldcontrol runat="server" id="PSCQinits_05" DatabaseField="PSCQinits_05" IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="100px" FieldTextBoxWidth="50px" FieldTextBoxMaxLength="15"></def:datafieldcontrol>
</td>
<td><def:datafieldcontrol runat="server" id="PSCQyrs_05" DatabaseField="PSCQyrs_05" IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="10px" FieldTextBoxWidth="40px" FieldTextBoxMaxLength="15"></def:datafieldcontrol></td>
<td><def:datafieldcontrol runat="server" id="PSCQmos_05" DatabaseField="PSCQmos_05" IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="10px" FieldTextBoxWidth="40px" FieldTextBoxMaxLength="15"></def:datafieldcontrol></td>
<td><def:datafieldcontrol runat="server" id="PSCQsex_05" DatabaseField="PSCQsex_05" IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="10px" FieldTextBoxWidth="40px" FieldTextBoxMaxLength="15"></def:datafieldcontrol></td>

<td>
</td><td>
</td><td>
</td><td>
</td>
</tr>
</table>

<br /><br />
 <%--here --%>

 

 <%-- ---------------------------------------here  -----------------------------------------%>
 <table>
 <tr><td style="background-color:Silver" colspan="2">Playmate _01</td></tr> 

<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="PSCQ01_01" DatabaseField="PSCQ01_01" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
 
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="PSCQ02_01" DatabaseField="PSCQ02_01" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
 
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="PSCQ03_01" DatabaseField="PSCQ03_01" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
 
<td style="vertical-align:top"><def:ValueSetLabel ID="ValueSetLabel_PSCQ03_01" runat="server"  DatabaseField="PSCQ03_01"></def:ValueSetLabel></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="PSCQ03oth_01" DatabaseField="PSCQ03oth_01" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="200px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="50"></def:datafieldcontrol></td>
 
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="PSCQ04_01" DatabaseField="PSCQ04_01" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
 
<td style="vertical-align:top"><def:ValueSetLabel ID="ValueSetLabel_PSCQ04_01" runat="server"  DatabaseField="PSCQ04_01"></def:ValueSetLabel></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="PSCQ05_01" DatabaseField="PSCQ05_01" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
 
<td style="vertical-align:top"><def:ValueSetLabel ID="ValueSetLabel_PSCQ05_01" runat="server"  DatabaseField="PSCQ05_01"></def:ValueSetLabel></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="PSCQ06_01" DatabaseField="PSCQ06_01" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
 
<td style="vertical-align:top"><def:ValueSetLabel ID="ValueSetLabel_PSCQ06_01" runat="server"  DatabaseField="PSCQ06_01"></def:ValueSetLabel></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="PSCQ07_01" DatabaseField="PSCQ07_01" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
 
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="PSCQ08_01" DatabaseField="PSCQ08_01" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
 
<td style="vertical-align:top"><def:ValueSetLabel ID="ValueSetLabel_PSCQ08_01" runat="server"  DatabaseField="PSCQ08_01"></def:ValueSetLabel></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="PSCQ08oth_01" DatabaseField="PSCQ08oth_01" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="200px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="50"></def:datafieldcontrol></td>
 
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="PSCQ09_01" DatabaseField="PSCQ09_01" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
 
<td style="vertical-align:top"><def:ValueSetLabel ID="ValueSetLabel_PSCQ09_01" runat="server"  DatabaseField="PSCQ09_01"></def:ValueSetLabel></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="PSCQ10_01" DatabaseField="PSCQ10_01" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
 
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="PSCQ11_01" DatabaseField="PSCQ11_01" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
 
<td style="vertical-align:top"><def:ValueSetLabel ID="ValueSetLabel_PSCQ11_01" runat="server"  DatabaseField="PSCQ11_01"></def:ValueSetLabel></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="PSCQ12_01" DatabaseField="PSCQ12_01" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
 
<td style="vertical-align:top"><def:ValueSetLabel ID="ValueSetLabel_PSCQ12_01" runat="server"  DatabaseField="PSCQ12_01"></def:ValueSetLabel></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="PSCQ13_01" DatabaseField="PSCQ13_01" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
 
<td style="vertical-align:top"><def:ValueSetLabel ID="ValueSetLabel_PSCQ13_01" runat="server"  DatabaseField="PSCQ13_01"></def:ValueSetLabel></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="PSCQ14_01" DatabaseField="PSCQ14_01" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
 
<td style="vertical-align:top"><def:ValueSetLabel ID="ValueSetLabel_PSCQ14_01" runat="server"  DatabaseField="PSCQ14_01"></def:ValueSetLabel></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="PSCQ15_01" DatabaseField="PSCQ15_01" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
 
<td style="vertical-align:top"><def:ValueSetLabel ID="ValueSetLabel_PSCQ15_01" runat="server"  DatabaseField="PSCQ15_01"></def:ValueSetLabel></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="PSCQ16_01" DatabaseField="PSCQ16_01" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
 
<td style="vertical-align:top"><def:ValueSetLabel ID="ValueSetLabel_PSCQ16_01" runat="server"  DatabaseField="PSCQ16_01"></def:ValueSetLabel></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="PSCQ17_01" DatabaseField="PSCQ17_01" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
 
<td style="vertical-align:top"><def:ValueSetLabel ID="ValueSetLabel_PSCQ17_01" runat="server"  DatabaseField="PSCQ17_01"></def:ValueSetLabel></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="PSCQ18a_01" DatabaseField="PSCQ18a_01" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
 
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="PSCQ18b_01" DatabaseField="PSCQ18b_01" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
 
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="PSCQ18c_01" DatabaseField="PSCQ18c_01" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
 
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="PSCQ19_01" DatabaseField="PSCQ19_01" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
 
<td style="vertical-align:top"><def:ValueSetLabel ID="ValueSetLabel_PSCQ19_01" runat="server"  DatabaseField="PSCQ19_01"></def:ValueSetLabel></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="PSCQ20_01" DatabaseField="PSCQ20_01" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
 
<td style="vertical-align:top"><def:ValueSetLabel ID="ValueSetLabel_PSCQ20_01" runat="server"  DatabaseField="PSCQ20_01"></def:ValueSetLabel></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="PSCQ21a_01" DatabaseField="PSCQ21a_01" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
 
<td style="vertical-align:top"><def:ValueSetLabel ID="ValueSetLabel_PSCQ21a_01" runat="server"  DatabaseField="PSCQ21a_01"></def:ValueSetLabel></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="PSCQ21b_01" DatabaseField="PSCQ21b_01" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
 
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="PSCQ21c_01" DatabaseField="PSCQ21c_01" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
 
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="PSCQ21d_01" DatabaseField="PSCQ21d_01" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
 
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="PSCQ21e_01" DatabaseField="PSCQ21e_01" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
 
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="PSCQ22a_01" DatabaseField="PSCQ22a_01" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
 
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="PSCQ22b_01" DatabaseField="PSCQ22b_01" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
 
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="PSCQ22c_01" DatabaseField="PSCQ22c_01" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
 
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="PSCQ22d_01" DatabaseField="PSCQ22d_01" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
 
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="PSCQ22e_01" DatabaseField="PSCQ22e_01" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
 
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="PSCQ22f_01" DatabaseField="PSCQ22f_01" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
 
<td></td></tr>


 <%-- ---------------------------------------here  -----------------------------------------%>
 <%-- ---------------------------------------here  -----------------------------------------%>

 <tr><td style="background-color:Silver" colspan="2">Playmate _02</td></tr> 

<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="PSCQ01_02" DatabaseField="PSCQ01_02" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
 
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="PSCQ02_02" DatabaseField="PSCQ02_02" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
 
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="PSCQ03_02" DatabaseField="PSCQ03_02" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
 
<td style="vertical-align:top"><def:ValueSetLabel ID="ValueSetLabel_PSCQ03_02" runat="server"  DatabaseField="PSCQ03_02"></def:ValueSetLabel></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="PSCQ03oth_02" DatabaseField="PSCQ03oth_02" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="200px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="50"></def:datafieldcontrol></td>
 
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="PSCQ04_02" DatabaseField="PSCQ04_02" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
 
<td style="vertical-align:top"><def:ValueSetLabel ID="ValueSetLabel_PSCQ04_02" runat="server"  DatabaseField="PSCQ04_02"></def:ValueSetLabel></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="PSCQ05_02" DatabaseField="PSCQ05_02" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
 
<td style="vertical-align:top"><def:ValueSetLabel ID="ValueSetLabel_PSCQ05_02" runat="server"  DatabaseField="PSCQ05_02"></def:ValueSetLabel></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="PSCQ06_02" DatabaseField="PSCQ06_02" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
 
<td style="vertical-align:top"><def:ValueSetLabel ID="ValueSetLabel_PSCQ06_02" runat="server"  DatabaseField="PSCQ06_02"></def:ValueSetLabel></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="PSCQ07_02" DatabaseField="PSCQ07_02" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
 
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="PSCQ08_02" DatabaseField="PSCQ08_02" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
 
<td style="vertical-align:top"><def:ValueSetLabel ID="ValueSetLabel_PSCQ08_02" runat="server"  DatabaseField="PSCQ08_02"></def:ValueSetLabel></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="PSCQ08oth_02" DatabaseField="PSCQ08oth_02" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="200px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="50"></def:datafieldcontrol></td>
 
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="PSCQ09_02" DatabaseField="PSCQ09_02" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
 
<td style="vertical-align:top"><def:ValueSetLabel ID="ValueSetLabel_PSCQ09_02" runat="server"  DatabaseField="PSCQ09_02"></def:ValueSetLabel></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="PSCQ10_02" DatabaseField="PSCQ10_02" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
 
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="PSCQ11_02" DatabaseField="PSCQ11_02" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
 
<td style="vertical-align:top"><def:ValueSetLabel ID="ValueSetLabel_PSCQ11_02" runat="server"  DatabaseField="PSCQ11_02"></def:ValueSetLabel></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="PSCQ12_02" DatabaseField="PSCQ12_02" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
 
<td style="vertical-align:top"><def:ValueSetLabel ID="ValueSetLabel_PSCQ12_02" runat="server"  DatabaseField="PSCQ12_02"></def:ValueSetLabel></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="PSCQ13_02" DatabaseField="PSCQ13_02" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
 
<td style="vertical-align:top"><def:ValueSetLabel ID="ValueSetLabel_PSCQ13_02" runat="server"  DatabaseField="PSCQ13_02"></def:ValueSetLabel></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="PSCQ14_02" DatabaseField="PSCQ14_02" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
 
<td style="vertical-align:top"><def:ValueSetLabel ID="ValueSetLabel_PSCQ14_02" runat="server"  DatabaseField="PSCQ14_02"></def:ValueSetLabel></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="PSCQ15_02" DatabaseField="PSCQ15_02" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
 
<td style="vertical-align:top"><def:ValueSetLabel ID="ValueSetLabel_PSCQ15_02" runat="server"  DatabaseField="PSCQ15_02"></def:ValueSetLabel></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="PSCQ16_02" DatabaseField="PSCQ16_02" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
 
<td style="vertical-align:top"><def:ValueSetLabel ID="ValueSetLabel_PSCQ16_02" runat="server"  DatabaseField="PSCQ16_02"></def:ValueSetLabel></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="PSCQ17_02" DatabaseField="PSCQ17_02" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
 
<td style="vertical-align:top"><def:ValueSetLabel ID="ValueSetLabel_PSCQ17_02" runat="server"  DatabaseField="PSCQ17_02"></def:ValueSetLabel></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="PSCQ18a_02" DatabaseField="PSCQ18a_02" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
 
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="PSCQ18b_02" DatabaseField="PSCQ18b_02" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
 
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="PSCQ18c_02" DatabaseField="PSCQ18c_02" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
 
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="PSCQ19_02" DatabaseField="PSCQ19_02" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
 
<td style="vertical-align:top"><def:ValueSetLabel ID="ValueSetLabel_PSCQ19_02" runat="server"  DatabaseField="PSCQ19_02"></def:ValueSetLabel></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="PSCQ20_02" DatabaseField="PSCQ20_02" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
 
<td style="vertical-align:top"><def:ValueSetLabel ID="ValueSetLabel_PSCQ20_02" runat="server"  DatabaseField="PSCQ20_02"></def:ValueSetLabel></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="PSCQ21a_02" DatabaseField="PSCQ21a_02" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
 
<td style="vertical-align:top"><def:ValueSetLabel ID="ValueSetLabel_PSCQ21a_02" runat="server"  DatabaseField="PSCQ21a_02"></def:ValueSetLabel></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="PSCQ21b_02" DatabaseField="PSCQ21b_02" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
 
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="PSCQ21c_02" DatabaseField="PSCQ21c_02" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
 
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="PSCQ21d_02" DatabaseField="PSCQ21d_02" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
 
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="PSCQ21e_02" DatabaseField="PSCQ21e_02" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
 
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="PSCQ22a_02" DatabaseField="PSCQ22a_02" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
 
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="PSCQ22b_02" DatabaseField="PSCQ22b_02" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
 
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="PSCQ22c_02" DatabaseField="PSCQ22c_02" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
 
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="PSCQ22d_02" DatabaseField="PSCQ22d_02" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
 
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="PSCQ22e_02" DatabaseField="PSCQ22e_02" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
 
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="PSCQ22f_02" DatabaseField="PSCQ22f_02" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
 
<td></td></tr>

 <%-- ---------------------------------------here  -----------------------------------------%>
 <%-- ---------------------------------------here  -----------------------------------------%>

 <tr><td style="background-color:Silver" colspan="2">Playmate _03</td></tr> 

<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="PSCQ01_03" DatabaseField="PSCQ01_03" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
 
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="PSCQ02_03" DatabaseField="PSCQ02_03" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
 
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="PSCQ03_03" DatabaseField="PSCQ03_03" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
 
<td style="vertical-align:top"><def:ValueSetLabel ID="ValueSetLabel_PSCQ03_03" runat="server"  DatabaseField="PSCQ03_03"></def:ValueSetLabel></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="PSCQ03oth_03" DatabaseField="PSCQ03oth_03" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="200px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="50"></def:datafieldcontrol></td>
 
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="PSCQ04_03" DatabaseField="PSCQ04_03" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
 
<td style="vertical-align:top"><def:ValueSetLabel ID="ValueSetLabel_PSCQ04_03" runat="server"  DatabaseField="PSCQ04_03"></def:ValueSetLabel></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="PSCQ05_03" DatabaseField="PSCQ05_03" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
 
<td style="vertical-align:top"><def:ValueSetLabel ID="ValueSetLabel_PSCQ05_03" runat="server"  DatabaseField="PSCQ05_03"></def:ValueSetLabel></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="PSCQ06_03" DatabaseField="PSCQ06_03" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
 
<td style="vertical-align:top"><def:ValueSetLabel ID="ValueSetLabel_PSCQ06_03" runat="server"  DatabaseField="PSCQ06_03"></def:ValueSetLabel></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="PSCQ07_03" DatabaseField="PSCQ07_03" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
 
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="PSCQ08_03" DatabaseField="PSCQ08_03" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
 
<td style="vertical-align:top"><def:ValueSetLabel ID="ValueSetLabel_PSCQ08_03" runat="server"  DatabaseField="PSCQ08_03"></def:ValueSetLabel></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="PSCQ08oth_03" DatabaseField="PSCQ08oth_03" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="200px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="50"></def:datafieldcontrol></td>
 
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="PSCQ09_03" DatabaseField="PSCQ09_03" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
 
<td style="vertical-align:top"><def:ValueSetLabel ID="ValueSetLabel_PSCQ09_03" runat="server"  DatabaseField="PSCQ09_03"></def:ValueSetLabel></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="PSCQ10_03" DatabaseField="PSCQ10_03" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
 
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="PSCQ11_03" DatabaseField="PSCQ11_03" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
 
<td style="vertical-align:top"><def:ValueSetLabel ID="ValueSetLabel_PSCQ11_03" runat="server"  DatabaseField="PSCQ11_03"></def:ValueSetLabel></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="PSCQ12_03" DatabaseField="PSCQ12_03" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
 
<td style="vertical-align:top"><def:ValueSetLabel ID="ValueSetLabel_PSCQ12_03" runat="server"  DatabaseField="PSCQ12_03"></def:ValueSetLabel></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="PSCQ13_03" DatabaseField="PSCQ13_03" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
 
<td style="vertical-align:top"><def:ValueSetLabel ID="ValueSetLabel_PSCQ13_03" runat="server"  DatabaseField="PSCQ13_03"></def:ValueSetLabel></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="PSCQ14_03" DatabaseField="PSCQ14_03" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
 
<td style="vertical-align:top"><def:ValueSetLabel ID="ValueSetLabel_PSCQ14_03" runat="server"  DatabaseField="PSCQ14_03"></def:ValueSetLabel></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="PSCQ15_03" DatabaseField="PSCQ15_03" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
 
<td style="vertical-align:top"><def:ValueSetLabel ID="ValueSetLabel_PSCQ15_03" runat="server"  DatabaseField="PSCQ15_03"></def:ValueSetLabel></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="PSCQ16_03" DatabaseField="PSCQ16_03" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
 
<td style="vertical-align:top"><def:ValueSetLabel ID="ValueSetLabel_PSCQ16_03" runat="server"  DatabaseField="PSCQ16_03"></def:ValueSetLabel></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="PSCQ17_03" DatabaseField="PSCQ17_03" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
 
<td style="vertical-align:top"><def:ValueSetLabel ID="ValueSetLabel_PSCQ17_03" runat="server"  DatabaseField="PSCQ17_03"></def:ValueSetLabel></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="PSCQ18a_03" DatabaseField="PSCQ18a_03" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
 
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="PSCQ18b_03" DatabaseField="PSCQ18b_03" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
 
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="PSCQ18c_03" DatabaseField="PSCQ18c_03" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
 
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="PSCQ19_03" DatabaseField="PSCQ19_03" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
 
<td style="vertical-align:top"><def:ValueSetLabel ID="ValueSetLabel_PSCQ19_03" runat="server"  DatabaseField="PSCQ19_03"></def:ValueSetLabel></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="PSCQ20_03" DatabaseField="PSCQ20_03" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
 
<td style="vertical-align:top"><def:ValueSetLabel ID="ValueSetLabel_PSCQ20_03" runat="server"  DatabaseField="PSCQ20_03"></def:ValueSetLabel></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="PSCQ21a_03" DatabaseField="PSCQ21a_03" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
 
<td style="vertical-align:top"><def:ValueSetLabel ID="ValueSetLabel_PSCQ21a_03" runat="server"  DatabaseField="PSCQ21a_03"></def:ValueSetLabel></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="PSCQ21b_03" DatabaseField="PSCQ21b_03" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
 
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="PSCQ21c_03" DatabaseField="PSCQ21c_03" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
 
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="PSCQ21d_03" DatabaseField="PSCQ21d_03" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
 
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="PSCQ21e_03" DatabaseField="PSCQ21e_03" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
 
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="PSCQ22a_03" DatabaseField="PSCQ22a_03" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
 
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="PSCQ22b_03" DatabaseField="PSCQ22b_03" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
 
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="PSCQ22c_03" DatabaseField="PSCQ22c_03" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
 
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="PSCQ22d_03" DatabaseField="PSCQ22d_03" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
 
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="PSCQ22e_03" DatabaseField="PSCQ22e_03" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
 
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="PSCQ22f_03" DatabaseField="PSCQ22f_03" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
 
<td></td></tr>

 <%-- ---------------------------------------here  -----------------------------------------%>
 <%-- ---------------------------------------here  -----------------------------------------%>

 <tr><td style="background-color:Silver" colspan="2">Playmate _04</td></tr> 

<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="PSCQ01_04" DatabaseField="PSCQ01_04" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
 
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="PSCQ02_04" DatabaseField="PSCQ02_04" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
 
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="PSCQ03_04" DatabaseField="PSCQ03_04" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
 
<td style="vertical-align:top"><def:ValueSetLabel ID="ValueSetLabel_PSCQ03_04" runat="server"  DatabaseField="PSCQ03_04"></def:ValueSetLabel></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="PSCQ03oth_04" DatabaseField="PSCQ03oth_04" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="200px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="50"></def:datafieldcontrol></td>
 
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="PSCQ04_04" DatabaseField="PSCQ04_04" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
 
<td style="vertical-align:top"><def:ValueSetLabel ID="ValueSetLabel_PSCQ04_04" runat="server"  DatabaseField="PSCQ04_04"></def:ValueSetLabel></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="PSCQ05_04" DatabaseField="PSCQ05_04" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
 
<td style="vertical-align:top"><def:ValueSetLabel ID="ValueSetLabel_PSCQ05_04" runat="server"  DatabaseField="PSCQ05_04"></def:ValueSetLabel></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="PSCQ06_04" DatabaseField="PSCQ06_04" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
 
<td style="vertical-align:top"><def:ValueSetLabel ID="ValueSetLabel_PSCQ06_04" runat="server"  DatabaseField="PSCQ06_04"></def:ValueSetLabel></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="PSCQ07_04" DatabaseField="PSCQ07_04" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
 
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="PSCQ08_04" DatabaseField="PSCQ08_04" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
 
<td style="vertical-align:top"><def:ValueSetLabel ID="ValueSetLabel_PSCQ08_04" runat="server"  DatabaseField="PSCQ08_04"></def:ValueSetLabel></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="PSCQ08oth_04" DatabaseField="PSCQ08oth_04" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="200px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="50"></def:datafieldcontrol></td>
 
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="PSCQ09_04" DatabaseField="PSCQ09_04" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
 
<td style="vertical-align:top"><def:ValueSetLabel ID="ValueSetLabel_PSCQ09_04" runat="server"  DatabaseField="PSCQ09_04"></def:ValueSetLabel></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="PSCQ10_04" DatabaseField="PSCQ10_04" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
 
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="PSCQ11_04" DatabaseField="PSCQ11_04" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
 
<td style="vertical-align:top"><def:ValueSetLabel ID="ValueSetLabel_PSCQ11_04" runat="server"  DatabaseField="PSCQ11_04"></def:ValueSetLabel></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="PSCQ12_04" DatabaseField="PSCQ12_04" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
 
<td style="vertical-align:top"><def:ValueSetLabel ID="ValueSetLabel_PSCQ12_04" runat="server"  DatabaseField="PSCQ12_04"></def:ValueSetLabel></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="PSCQ13_04" DatabaseField="PSCQ13_04" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
 
<td style="vertical-align:top"><def:ValueSetLabel ID="ValueSetLabel_PSCQ13_04" runat="server"  DatabaseField="PSCQ13_04"></def:ValueSetLabel></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="PSCQ14_04" DatabaseField="PSCQ14_04" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
 
<td style="vertical-align:top"><def:ValueSetLabel ID="ValueSetLabel_PSCQ14_04" runat="server"  DatabaseField="PSCQ14_04"></def:ValueSetLabel></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="PSCQ15_04" DatabaseField="PSCQ15_04" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
 
<td style="vertical-align:top"><def:ValueSetLabel ID="ValueSetLabel_PSCQ15_04" runat="server"  DatabaseField="PSCQ15_04"></def:ValueSetLabel></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="PSCQ16_04" DatabaseField="PSCQ16_04" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
 
<td style="vertical-align:top"><def:ValueSetLabel ID="ValueSetLabel_PSCQ16_04" runat="server"  DatabaseField="PSCQ16_04"></def:ValueSetLabel></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="PSCQ17_04" DatabaseField="PSCQ17_04" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
 
<td style="vertical-align:top"><def:ValueSetLabel ID="ValueSetLabel_PSCQ17_04" runat="server"  DatabaseField="PSCQ17_04"></def:ValueSetLabel></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="PSCQ18a_04" DatabaseField="PSCQ18a_04" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
 
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="PSCQ18b_04" DatabaseField="PSCQ18b_04" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
 
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="PSCQ18c_04" DatabaseField="PSCQ18c_04" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
 
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="PSCQ19_04" DatabaseField="PSCQ19_04" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
 
<td style="vertical-align:top"><def:ValueSetLabel ID="ValueSetLabel_PSCQ19_04" runat="server"  DatabaseField="PSCQ19_04"></def:ValueSetLabel></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="PSCQ20_04" DatabaseField="PSCQ20_04" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
 
<td style="vertical-align:top"><def:ValueSetLabel ID="ValueSetLabel_PSCQ20_04" runat="server"  DatabaseField="PSCQ20_04"></def:ValueSetLabel></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="PSCQ21a_04" DatabaseField="PSCQ21a_04" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
 
<td style="vertical-align:top"><def:ValueSetLabel ID="ValueSetLabel_PSCQ21a_04" runat="server"  DatabaseField="PSCQ21a_04"></def:ValueSetLabel></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="PSCQ21b_04" DatabaseField="PSCQ21b_04" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
 
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="PSCQ21c_04" DatabaseField="PSCQ21c_04" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
 
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="PSCQ21d_04" DatabaseField="PSCQ21d_04" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
 
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="PSCQ21e_04" DatabaseField="PSCQ21e_04" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
 
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="PSCQ22a_04" DatabaseField="PSCQ22a_04" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
 
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="PSCQ22b_04" DatabaseField="PSCQ22b_04" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
 
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="PSCQ22c_04" DatabaseField="PSCQ22c_04" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
 
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="PSCQ22d_04" DatabaseField="PSCQ22d_04" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
 
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="PSCQ22e_04" DatabaseField="PSCQ22e_04" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
 
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="PSCQ22f_04" DatabaseField="PSCQ22f_04" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
 
<td></td></tr>


 <%-- ---------------------------------------here  -----------------------------------------%>
 <%-- ---------------------------------------here  -----------------------------------------%>

 <tr><td style="background-color:Silver" colspan="2">Playmate _05</td></tr> 

<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="PSCQ01_05" DatabaseField="PSCQ01_05" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
 
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="PSCQ02_05" DatabaseField="PSCQ02_05" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
 
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="PSCQ03_05" DatabaseField="PSCQ03_05" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
 
<td style="vertical-align:top"><def:ValueSetLabel ID="ValueSetLabel_PSCQ03_05" runat="server"  DatabaseField="PSCQ03_05"></def:ValueSetLabel></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="PSCQ03oth_05" DatabaseField="PSCQ03oth_05" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="200px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="50"></def:datafieldcontrol></td>
 
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="PSCQ04_05" DatabaseField="PSCQ04_05" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
 
<td style="vertical-align:top"><def:ValueSetLabel ID="ValueSetLabel_PSCQ04_05" runat="server"  DatabaseField="PSCQ04_05"></def:ValueSetLabel></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="PSCQ05_05" DatabaseField="PSCQ05_05" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
 
<td style="vertical-align:top"><def:ValueSetLabel ID="ValueSetLabel_PSCQ05_05" runat="server"  DatabaseField="PSCQ05_05"></def:ValueSetLabel></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="PSCQ06_05" DatabaseField="PSCQ06_05" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
 
<td style="vertical-align:top"><def:ValueSetLabel ID="ValueSetLabel_PSCQ06_05" runat="server"  DatabaseField="PSCQ06_05"></def:ValueSetLabel></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="PSCQ07_05" DatabaseField="PSCQ07_05" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
 
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="PSCQ08_05" DatabaseField="PSCQ08_05" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
 
<td style="vertical-align:top"><def:ValueSetLabel ID="ValueSetLabel_PSCQ08_05" runat="server"  DatabaseField="PSCQ08_05"></def:ValueSetLabel></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="PSCQ08oth_05" DatabaseField="PSCQ08oth_05" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="200px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="50"></def:datafieldcontrol></td>
 
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="PSCQ09_05" DatabaseField="PSCQ09_05" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
 
<td style="vertical-align:top"><def:ValueSetLabel ID="ValueSetLabel_PSCQ09_05" runat="server"  DatabaseField="PSCQ09_05"></def:ValueSetLabel></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="PSCQ10_05" DatabaseField="PSCQ10_05" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
 
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="PSCQ11_05" DatabaseField="PSCQ11_05" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
 
<td style="vertical-align:top"><def:ValueSetLabel ID="ValueSetLabel_PSCQ11_05" runat="server"  DatabaseField="PSCQ11_05"></def:ValueSetLabel></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="PSCQ12_05" DatabaseField="PSCQ12_05" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
 
<td style="vertical-align:top"><def:ValueSetLabel ID="ValueSetLabel_PSCQ12_05" runat="server"  DatabaseField="PSCQ12_05"></def:ValueSetLabel></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="PSCQ13_05" DatabaseField="PSCQ13_05" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
 
<td style="vertical-align:top"><def:ValueSetLabel ID="ValueSetLabel_PSCQ13_05" runat="server"  DatabaseField="PSCQ13_05"></def:ValueSetLabel></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="PSCQ14_05" DatabaseField="PSCQ14_05" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
 
<td style="vertical-align:top"><def:ValueSetLabel ID="ValueSetLabel_PSCQ14_05" runat="server"  DatabaseField="PSCQ14_05"></def:ValueSetLabel></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="PSCQ15_05" DatabaseField="PSCQ15_05" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
 
<td style="vertical-align:top"><def:ValueSetLabel ID="ValueSetLabel_PSCQ15_05" runat="server"  DatabaseField="PSCQ15_05"></def:ValueSetLabel></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="PSCQ16_05" DatabaseField="PSCQ16_05" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
 
<td style="vertical-align:top"><def:ValueSetLabel ID="ValueSetLabel_PSCQ16_05" runat="server"  DatabaseField="PSCQ16_05"></def:ValueSetLabel></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="PSCQ17_05" DatabaseField="PSCQ17_05" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
 
<td style="vertical-align:top"><def:ValueSetLabel ID="ValueSetLabel_PSCQ17_05" runat="server"  DatabaseField="PSCQ17_05"></def:ValueSetLabel></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="PSCQ18a_05" DatabaseField="PSCQ18a_05" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
 
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="PSCQ18b_05" DatabaseField="PSCQ18b_05" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
 
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="PSCQ18c_05" DatabaseField="PSCQ18c_05" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
 
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="PSCQ19_05" DatabaseField="PSCQ19_05" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
 
<td style="vertical-align:top"><def:ValueSetLabel ID="ValueSetLabel_PSCQ19_05" runat="server"  DatabaseField="PSCQ19_05"></def:ValueSetLabel></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="PSCQ20_05" DatabaseField="PSCQ20_05" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
 
<td style="vertical-align:top"><def:ValueSetLabel ID="ValueSetLabel_PSCQ20_05" runat="server"  DatabaseField="PSCQ20_05"></def:ValueSetLabel></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="PSCQ21a_05" DatabaseField="PSCQ21a_05" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
 
<td style="vertical-align:top"><def:ValueSetLabel ID="ValueSetLabel_PSCQ21a_05" runat="server"  DatabaseField="PSCQ21a_05"></def:ValueSetLabel></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="PSCQ21b_05" DatabaseField="PSCQ21b_05" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
 
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="PSCQ21c_05" DatabaseField="PSCQ21c_05" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
 
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="PSCQ21d_05" DatabaseField="PSCQ21d_05" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
 
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="PSCQ21e_05" DatabaseField="PSCQ21e_05" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
 
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="PSCQ22a_05" DatabaseField="PSCQ22a_05" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
 
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="PSCQ22b_05" DatabaseField="PSCQ22b_05" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
 
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="PSCQ22c_05" DatabaseField="PSCQ22c_05" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
 
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="PSCQ22d_05" DatabaseField="PSCQ22d_05" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
 
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="PSCQ22e_05" DatabaseField="PSCQ22e_05" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
 
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="PSCQ22f_05" DatabaseField="PSCQ22f_05" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
 
<td><br /><br /></td></tr>

 <%----------------------------------------------- Next Section -----------------------------------------------%>

<tr><td colspan="2" style="background-color:Silver"><b>Section 2</b></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="PSCQ23" DatabaseField="PSCQ23" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="400px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
 
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="PSCQ24" DatabaseField="PSCQ24" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="400px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
 
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="PSCQ25" DatabaseField="PSCQ25" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="400px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
 
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="PSCQ26" DatabaseField="PSCQ26" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="400px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
 
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="PSCQ27" DatabaseField="PSCQ27" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="400px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
 
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="PSCQ28" DatabaseField="PSCQ28" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="400px" FieldTextBoxWidth="40px"></def:datafieldcontrol><br /><br /></td>
 
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="PSCQ29" DatabaseField="PSCQ29" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="400px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
 
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="PSCQ30" DatabaseField="PSCQ30" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="400px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
 
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="PSCQ31" DatabaseField="PSCQ31" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="400px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
 
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="PSCQ32" DatabaseField="PSCQ32" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="400px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
 
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="PSCQ33" DatabaseField="PSCQ33" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="400px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
 
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="PSCQ34" DatabaseField="PSCQ34" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="400px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
 
<td></td></tr>
 </table>

 <br />
 

 
 <table>
  <tr style="background-color:Silver"><td colspan="3">
     <asp:Label ID="Label1" runat="server" Text="Section 3" Font-Bold="true"></asp:Label>
 </td></tr>

 <tr>
 <td>

<table>
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="PSCQs3type_g01" DatabaseField="PSCQs3type_g01" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="300px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="50"></def:datafieldcontrol></td>
<td></td></tr>
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="PSCQs3best_g01" DatabaseField="PSCQs3best_g01" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td><def:ValueSetLabel ID="ValueSetLabel_PSCQs3best_g01" runat="server"  DatabaseField="PSCQs3best_g01"></def:ValueSetLabel></td></tr> 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="PSCQs3bestoth_g01" DatabaseField="PSCQs3bestoth_g01" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="300px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="50"></def:datafieldcontrol></td>
<td></td></tr>
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="PSCQs3permo_g01" DatabaseField="PSCQs3permo_g01" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="PSCQs3numch_g01" DatabaseField="PSCQs3numch_g01" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="PSCQs3numwch_g01" DatabaseField="PSCQs3numwch_g01" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="PSCQs3numspec_g01" DatabaseField="PSCQs3numspec_g01" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td></td></tr> 
</table>
</td></tr>
<tr>
<td><br /><br />
<table>
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="PSCQs3type_g02" DatabaseField="PSCQs3type_g02" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="300px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="50"></def:datafieldcontrol></td>
<td></td></tr>
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="PSCQs3best_g02" DatabaseField="PSCQs3best_g02" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td><def:ValueSetLabel ID="ValueSetLabel_PSCQs3best_g02" runat="server"  DatabaseField="PSCQs3best_g02"></def:ValueSetLabel></td></tr> 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="PSCQs3bestoth_g02" DatabaseField="PSCQs3bestoth_g02" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="300px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="50"></def:datafieldcontrol></td>
<td></td></tr> 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="PSCQs3permo_g02" DatabaseField="PSCQs3permo_g02" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="PSCQs3numch_g02" DatabaseField="PSCQs3numch_g02" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td></td></tr> 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="PSCQs3numwch_g02" DatabaseField="PSCQs3numwch_g02" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td></td></tr> 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="PSCQs3numspec_g02" DatabaseField="PSCQs3numspec_g02" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
</table>
</td>
</tr>
<tr>
<td><br /><br />
<table>
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="PSCQs3type_g03" DatabaseField="PSCQs3type_g03" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="300px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="50"></def:datafieldcontrol></td>
<td></td></tr>
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="PSCQs3best_g03" DatabaseField="PSCQs3best_g03" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td><def:ValueSetLabel ID="ValueSetLabel_PSCQs3best_g03" runat="server"  DatabaseField="PSCQs3best_g03"></def:ValueSetLabel></td></tr>
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="PSCQs3bestoth_g03" DatabaseField="PSCQs3bestoth_g03" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="300px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="50"></def:datafieldcontrol></td>
<td></td></tr>
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="PSCQs3permo_g03" DatabaseField="PSCQs3permo_g03" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="PSCQs3numch_g03" DatabaseField="PSCQs3numch_g03" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="PSCQs3numwch_g03" DatabaseField="PSCQs3numwch_g03" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="PSCQs3numspec_g03" DatabaseField="PSCQs3numspec_g03" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
</table>
</td>
</tr>

</table>

<br />
<br />
<br />

 <table>
  <tr style="background-color:Silver"><td colspan="3">
     <asp:Label ID="Label2" runat="server" Text="Section 4" Font-Bold="true"></asp:Label>
 </td></tr>
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="PSCQs4type_g01" DatabaseField="PSCQs4type_g01" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="300px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="50"></def:datafieldcontrol></td>
<td></td></tr>
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="PSCQs4best_g01" DatabaseField="PSCQs4best_g01" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
 <td><def:ValueSetLabel ID="ValueSetLabel_PSCQs4best_g01" runat="server"  DatabaseField="PSCQs4best_g01"></def:ValueSetLabel></td></tr>
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="PSCQs4bestoth_g01" DatabaseField="PSCQs4bestoth_g01" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="300px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="50"></def:datafieldcontrol></td>
<td></td></tr>
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="PSCQs4permo_g01" DatabaseField="PSCQs4permo_g01" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="PSCQs4numch_g01" DatabaseField="PSCQs4numch_g01" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="PSCQs4numwch_g01" DatabaseField="PSCQs4numwch_g01" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 


<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="PSCQs4type_g02" DatabaseField="PSCQs4type_g02" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="300px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="50"></def:datafieldcontrol></td>
<td></td></tr>
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="PSCQs4best_g02" DatabaseField="PSCQs4best_g02" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td><def:ValueSetLabel ID="ValueSetLabel_PSCQs4best_g02" runat="server"  DatabaseField="PSCQs4best_g02"></def:ValueSetLabel></td></tr>
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="PSCQs4bestoth_g02" DatabaseField="PSCQs4bestoth_g02" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="300px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="50"></def:datafieldcontrol></td>
<td></td></tr>
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="PSCQs4permo_g02" DatabaseField="PSCQs4permo_g02" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="PSCQs4numch_g02" DatabaseField="PSCQs4numch_g02" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="PSCQs4numwch_g02" DatabaseField="PSCQs4numwch_g02" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td></td></tr>

 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="PSCQs4type_g03" DatabaseField="PSCQs4type_g03" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="300px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="50"></def:datafieldcontrol></td>
<td></td></tr>
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="PSCQs4best_g03" DatabaseField="PSCQs4best_g03" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td><def:ValueSetLabel ID="ValueSetLabel_PSCQs4best_g03" runat="server"  DatabaseField="PSCQs4best_g03"></def:ValueSetLabel></td></tr>
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="PSCQs4bestoth_g03" DatabaseField="PSCQs4bestoth_g03" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="300px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="50"></def:datafieldcontrol></td>
<td></td></tr>

<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="PSCQs4permo_g03" DatabaseField="PSCQs4permo_g03" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="PSCQs4numch_g03" DatabaseField="PSCQs4numch_g03" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="PSCQs4numwch_g03" DatabaseField="PSCQs4numwch_g03" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td><br /><br /></td></tr>

</table>
<br /><br />
<table>
 <tr style="background-color:Silver"><td colspan="3">
     <asp:Label ID="Label3" runat="server" Text="Section 5" Font-Bold="true"></asp:Label>
 </td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="PSCQs5_01" DatabaseField="PSCQs5_01" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
 
<td style="vertical-align:top"><def:ValueSetLabel ID="ValueSetLabel_PSCQs5_01" runat="server"  DatabaseField="PSCQs5_01"></def:ValueSetLabel></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="PSCQs5_02" DatabaseField="PSCQs5_02" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
 
<td style="vertical-align:top"><def:ValueSetLabel ID="ValueSetLabel_PSCQs5_02" runat="server"  DatabaseField="PSCQs5_02"></def:ValueSetLabel></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="PSCQs5_03" DatabaseField="PSCQs5_03" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
 
<td style="vertical-align:top"><def:ValueSetLabel ID="ValueSetLabel_PSCQs5_03" runat="server"  DatabaseField="PSCQs5_03"></def:ValueSetLabel></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="PSCQs5_04" DatabaseField="PSCQs5_04" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
 
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="PSCQs5_05" DatabaseField="PSCQs5_05" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
 
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="PSCQs5_06" DatabaseField="PSCQs5_06" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
 
<td style="vertical-align:top"><def:ValueSetLabel ID="ValueSetLabel_PSCQs5_06" runat="server"  DatabaseField="PSCQs5_06"></def:ValueSetLabel></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="PSCQs5_07" DatabaseField="PSCQs5_07" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
 
<td style="vertical-align:top"><def:ValueSetLabel ID="ValueSetLabel_PSCQs5_07" runat="server"  DatabaseField="PSCQs5_07"></def:ValueSetLabel></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="PSCQs5_08" DatabaseField="PSCQs5_08" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
 
<td style="vertical-align:top"><def:ValueSetLabel ID="ValueSetLabel_PSCQs5_08" runat="server"  DatabaseField="PSCQs5_08"></def:ValueSetLabel></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="PSCQs5_09a" DatabaseField="PSCQs5_09a" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
 
<td style="vertical-align:top"><def:ValueSetLabel ID="ValueSetLabel_PSCQs5_09a" runat="server"  DatabaseField="PSCQs5_09a"></def:ValueSetLabel></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="PSCQs5_09b" DatabaseField="PSCQs5_09b" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
 
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="PSCQs5_09c" DatabaseField="PSCQs5_09c" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
 
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="PSCQs5_09d" DatabaseField="PSCQs5_09d" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
 
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="PSCQs5_09e" DatabaseField="PSCQs5_09e" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
 
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="PSCQs5_10a" DatabaseField="PSCQs5_10a" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
 
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="PSCQs5_10b" DatabaseField="PSCQs5_10b" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
 
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="PSCQs5_10c" DatabaseField="PSCQs5_10c" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
 
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="PSCQs5_10d" DatabaseField="PSCQs5_10d" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
 
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="PSCQs5_10e" DatabaseField="PSCQs5_10e" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
 
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="PSCQs5_11" DatabaseField="PSCQs5_11" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="150px" FieldTextBoxTextMode="MultiLine" FieldTextBoxWidth="400px"  FieldTextBoxHeight="200px" FieldTextBoxMaxLength="2000"></def:datafieldcontrol></td>
 
<td></td></tr>
 
<br/><br/><tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="created" DatabaseField="created" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="300px"></def:datafieldcontrol></td>
 
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="createdBy" DatabaseField="createdBy" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="300px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="50"></def:datafieldcontrol></td>
 
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="updated" DatabaseField="updated" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="300px" FormatString="{0:d}" ></def:datafieldcontrol></td>
 
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="updatedBy" DatabaseField="updatedBy" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="300px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="50"></def:datafieldcontrol></td>
 
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="scored" DatabaseField="scored" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="300px"></def:datafieldcontrol></td>
 
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="scoredBy" DatabaseField="scoredBy" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="300px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="50"></def:datafieldcontrol></td>
 
<td></td></tr>
 
</table>
</ContentTemplate>
<Triggers></Triggers>
</asp:UpdatePanel>
</asp:Content>
