
<%@ Page language="c#" MasterPageFile="~/UWAC.master"  Title="DTT_FOT Data Entry" %>
<%@ Register TagPrefix="def" Namespace="DataEntryFramework3" %> 
<asp:Content ID="Content2" ContentPlaceHolderID="oBodyPlaceHolder" runat="server">

<def:dataentrycontroller id="DataEntryController1" runat="server" DatabaseTable="ALL_DTT_FOT" PrimaryKeyField="DTT_FOT_pk">
</def:dataentrycontroller>


   <asp:ScriptManager ID="ScriptManager2" runat="server">    </asp:ScriptManager>


<asp:UpdatePanel ID="UpdatePanel2" runat="server">
  <ContentTemplate>




<table>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="id" DatabaseField="id" IsInsertField="true" FieldLabelWidth="200px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="15"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="indexnum" DatabaseField="indexnum" IsInsertField="true" FieldTextBoxTextDefault="1" FieldLabelWidth="200px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="DTT_FOT_date" DatabaseField="DTT_FOT_date" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="200px" FormatString="{0:d}" ></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="DTT_FOT_agemo" DatabaseField="DTT_FOT_agemo" IsReadOnly="true" RenderReadOnlyAsDiv="true"  FieldLabelWidth="200px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="DTT_FOT_exmnr" DatabaseField="DTT_FOT_exmnr" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="200px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="20"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="DTT_FOT_coder" DatabaseField="DTT_FOT_coder" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="200px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="50"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="DTT_FOT_cmnt" DatabaseField="DTT_FOT_cmnt" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="200px" FieldTextBoxWidth="400px" FieldTextBoxHeight="40px" FieldTextBoxTextMode="multiline" FieldTextBoxMaxLength="250"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="Datafieldcontrol1" DatabaseField="NumRnds" IsReadOnly="true" RenderReadOnlyAsDiv="true"  FieldLabelWidth="200px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="DTTavgFid" DatabaseField="DTTavgFid" IsReadOnly="true" RenderReadOnlyAsDiv="true"  FieldLabelWidth="200px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="AnyScoresLT3txt" DatabaseField="AnyScoresLT3txt" IsReadOnly="true" RenderReadOnlyAsDiv="true"  FieldLabelWidth="200px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top" style="font-size: medium; font-weight: bold"><def:datafieldcontrol runat="server" id="AtFidtxt"  DatabaseField="AtFidtxt" IsReadOnly="true" RenderReadOnlyAsDiv="true"  FieldLabelWidth="200px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td></td></tr>

<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="DTT_FOT_scrmsg" DatabaseField="DTT_FOT_scrmsg" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="200px" FieldTextBoxWidth="400px" FieldTextBoxHeight="40px" FieldTextBoxTextMode="multiline" FieldTextBoxMaxLength="250"></def:datafieldcontrol></td>
<td></td></tr>


 
 </table>

 <br />
 <br />
 <br />

      <asp:Label ID="Label8" runat="server" Text="Enter 1-5 (-9 for missing value)." Font-Bold="true" Font-Italic="true" ForeColor="DarkBlue"></asp:Label>
      <br />

 <table>
 <tr>

<%--Column 1--%>
 <td>
<table>
 <tr><td align="right"><asp:Label ID="Label7" runat="server" Text="Round 1"></asp:Label></td><td></td></tr>


 <tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="interval01" DatabaseField="interval01" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="200px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="sd01" DatabaseField="sd01" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="200px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="conseq01" DatabaseField="conseq01" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="200px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="posconseq01" DatabaseField="posconseq01" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="200px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="prompt01" DatabaseField="prompt01" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="200px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="organiz01" DatabaseField="organiz01" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="200px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="respopp01" DatabaseField="respopp01" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="200px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="tempt01" DatabaseField="tempt01" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="200px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="avgscore01" DatabaseField="avgscore01" IsReadOnly="true" RenderReadOnlyAsDiv="true"  FieldLabelWidth="200px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="behav01" DatabaseField="behav01" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="200px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="dttfid01" DatabaseField="dttfid01" IsReadOnly="true" RenderReadOnlyAsDiv="true"  FieldLabelWidth="200px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 </table>

 </td>


<%--Column 2--%>
 <td>
 <table>
  <tr><td align="right"><asp:Label ID="Label6" runat="server" Text="Round 2"></asp:Label></td><td></td></tr>

<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="interval02" DatabaseField="interval02" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="30px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="sd02" DatabaseField="sd02" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="30px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="conseq02" DatabaseField="conseq02" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="30px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="posconseq02" DatabaseField="posconseq02" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="30px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="prompt02" DatabaseField="prompt02" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="30px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="organiz02" DatabaseField="organiz02" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="30px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="respopp02" DatabaseField="respopp02" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="30px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="tempt02" DatabaseField="tempt02" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="30px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="avgscore02" DatabaseField="avgscore02" IsReadOnly="true" RenderReadOnlyAsDiv="true"  FieldLabelWidth="30px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="behav02" DatabaseField="behav02" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="30px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="dttfid02" DatabaseField="dttfid02" IsReadOnly="true" RenderReadOnlyAsDiv="true"  FieldLabelWidth="30px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
</table>
 </td>


<%--Column 3--%>
 <td>
<table>
 <tr><td align="right"><asp:Label ID="Label5" runat="server" Text="Round 3"></asp:Label></td><td></td></tr>

<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="interval03" DatabaseField="interval03" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="30px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="sd03" DatabaseField="sd03" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="30px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="conseq03" DatabaseField="conseq03" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="30px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="posconseq03" DatabaseField="posconseq03" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="30px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="prompt03" DatabaseField="prompt03" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="30px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="organiz03" DatabaseField="organiz03" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="30px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="respopp03" DatabaseField="respopp03" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="30px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="tempt03" DatabaseField="tempt03" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="30px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="avgscore03" DatabaseField="avgscore03" IsReadOnly="true" RenderReadOnlyAsDiv="true"  FieldLabelWidth="30px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="behav03" DatabaseField="behav03" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="30px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="dttfid03" DatabaseField="dttfid03" IsReadOnly="true" RenderReadOnlyAsDiv="true"  FieldLabelWidth="30px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 
</table>
 </td>


<%--Column 4--%>
 <td><table>
 <tr><td align="right"><asp:Label ID="Label4" runat="server" Text="Round 4"></asp:Label></td><td></td></tr>

<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="interval04" DatabaseField="interval04" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="30px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="sd04" DatabaseField="sd04" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="30px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="conseq04" DatabaseField="conseq04" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="30px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="posconseq04" DatabaseField="posconseq04" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="30px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="prompt04" DatabaseField="prompt04" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="30px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="organiz04" DatabaseField="organiz04" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="30px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="respopp04" DatabaseField="respopp04" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="30px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="tempt04" DatabaseField="tempt04" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="30px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="avgscore04" DatabaseField="avgscore04" IsReadOnly="true" RenderReadOnlyAsDiv="true"  FieldLabelWidth="30px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="behav04" DatabaseField="behav04" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="30px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="dttfid04" DatabaseField="dttfid04" IsReadOnly="true" RenderReadOnlyAsDiv="true"  FieldLabelWidth="30px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 
</table>

 </td>


<%--Column 5--%>
 <td>
 <table>
 <tr><td align="right"><asp:Label ID="Label3" runat="server" Text="Round 5"></asp:Label></td><td></td></tr>

<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="interval05" DatabaseField="interval05" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="30px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="sd05" DatabaseField="sd05" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="30px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="conseq05" DatabaseField="conseq05" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="30px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="posconseq05" DatabaseField="posconseq05" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="30px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="prompt05" DatabaseField="prompt05" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="30px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="organiz05" DatabaseField="organiz05" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="30px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="respopp05" DatabaseField="respopp05" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="30px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="tempt05" DatabaseField="tempt05" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="30px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="avgscore05" DatabaseField="avgscore05" IsReadOnly="true" RenderReadOnlyAsDiv="true"  FieldLabelWidth="30px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="behav05" DatabaseField="behav05" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="30px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="dttfid05" DatabaseField="dttfid05" IsReadOnly="true" RenderReadOnlyAsDiv="true"  FieldLabelWidth="30px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
</table>
 </td>


<%--Column 6--%>
 <td>
<table>
<tr><td align="right"><asp:Label ID="Label2" runat="server" Text="Round 6"></asp:Label></td><td></td></tr>

 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="interval06" DatabaseField="interval06" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="30px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="sd06" DatabaseField="sd06" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="30px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="conseq06" DatabaseField="conseq06" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="30px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="posconseq06" DatabaseField="posconseq06" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="30px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="prompt06" DatabaseField="prompt06" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="30px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="organiz06" DatabaseField="organiz06" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="30px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="respopp06" DatabaseField="respopp06" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="30px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="tempt06" DatabaseField="tempt06" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="30px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="avgscore06" DatabaseField="avgscore06" IsReadOnly="true" RenderReadOnlyAsDiv="true"  FieldLabelWidth="30px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="behav06" DatabaseField="behav06" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="30px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="dttfid06" DatabaseField="dttfid06" IsReadOnly="true" RenderReadOnlyAsDiv="true"  FieldLabelWidth="30px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 
</table>
 </td>


<%--Column 7--%>
 <td>
<table>

<tr><td align="right"><asp:Label ID="Label1" runat="server" Text="Round 7"></asp:Label></td><td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="interval07" DatabaseField="interval07" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="30px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="sd07" DatabaseField="sd07" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="30px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="conseq07" DatabaseField="conseq07" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="30px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="posconseq07" DatabaseField="posconseq07" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="30px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="prompt07" DatabaseField="prompt07" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="30px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="organiz07" DatabaseField="organiz07" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="30px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="respopp07" DatabaseField="respopp07" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="30px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="tempt07" DatabaseField="tempt07" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="30px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="avgscore07" DatabaseField="avgscore07" IsReadOnly="true" RenderReadOnlyAsDiv="true"  FieldLabelWidth="30px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="behav07" DatabaseField="behav07" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="30px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="dttfid07" DatabaseField="dttfid07" IsReadOnly="true" RenderReadOnlyAsDiv="true"  FieldLabelWidth="30px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
</table>
 </td>
 
 
 
 </tr>

</table>


 
<br/><br/><br/><br/>

<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="created" DatabaseField="created" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="300px"></def:datafieldcontrol></td>
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

