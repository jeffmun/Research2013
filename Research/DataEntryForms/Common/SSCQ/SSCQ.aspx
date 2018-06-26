<%@ Register TagPrefix="def" Namespace="DataEntryFramework3" %> 
<%@ Page language="c#" MasterPageFile="~/UWAC.master"  Title="SSCQ Data Entry" %>

<script runat="server">

    protected void btnCont_Click(object sender, EventArgs e)
    {

    }
</script>

<asp:Content ID="Content1" ContentPlaceHolderID="oBodyPlaceHolder" runat="server">

<def:dataentrycontroller id="DataEntryController1" runat="server" DatabaseTable="ALL_SSCQ" PrimaryKeyField="SSCQ_pk">
</def:dataentrycontroller>
   <asp:ScriptManager ID="ScriptManager1" runat="server">    </asp:ScriptManager>
<asp:UpdatePanel ID="UpdatePanel1" runat="server">
  <ContentTemplate>
<table>
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="id" DatabaseField="id" IsInsertField="true" FieldLabelWidth="300px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="15"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="indexnum" DatabaseField="indexnum" IsInsertField="true" FieldTextBoxTextDefault="1" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="SSCQ_date" DatabaseField="SSCQ_date" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FormatString="{0:d}" ></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="SSCQ_agemo" DatabaseField="SSCQ_agemo" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="SSCQ_resp" DatabaseField="SSCQ_resp" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="300px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="50"></def:datafieldcontrol></td>
<td></td></tr>

<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="SSCQ_exmnr" DatabaseField="SSCQ_exmnr" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="300px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="20"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="SSCQ_cmnt" DatabaseField="SSCQ_cmnt" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="300px" FieldTextBoxWidth="400px" FieldTextBoxHeight="40px" FieldTextBoxTextMode="multiline" FieldTextBoxMaxLength="250"></def:datafieldcontrol></td>
<td></td></tr>

<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="SSCQ_scrmsg" DatabaseField="SSCQ_scrmsg" IsReadOnly="true"  RenderReadOnlyAsDiv="true" FieldLabelWidth="300px" FieldTextBoxWidth="400px" FieldTextBoxHeight="40px" FieldTextBoxTextMode="multiline" FieldTextBoxMaxLength="250"></def:datafieldcontrol></td>
<td></td></tr>
 
</table>

<br />
          <asp:Label ID="Label1" runat="server" Text="Siblings" Font-Bold="true"></asp:Label>
<br />




<!-- sib1 -->
<table>
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="sib1name" DatabaseField="sib1name" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="300px" FieldTextBoxWidth="120px" FieldTextBoxMaxLength="50"></def:datafieldcontrol></td>
<td></td></tr>
     
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="sib1gender" DatabaseField="sib1gender" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td></td></tr>

<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="sib1age" DatabaseField="sib1age" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="sib1_1" DatabaseField="sib1_1" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 
 
<%--<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="sib1name" DatabaseField="sib1name" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="300px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="50"></def:datafieldcontrol></td>
<td></td></tr>--%>
 
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="sib1_2" DatabaseField="sib1_2" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="sib1_3" DatabaseField="sib1_3" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="sib1_4" DatabaseField="sib1_4" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="sib1_5" DatabaseField="sib1_5" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td style="vertical-align:top"><def:ValueSetLabel ID="ValueSetLabelsib1_5" runat="server"  DatabaseField="sib1_5" Separator=", "></def:ValueSetLabel></td></tr>

<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="sib1_5specify" DatabaseField="sib1_5specify" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="140px"></def:datafieldcontrol></td>
<td></td></tr>

 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="sib1_6" DatabaseField="sib1_6" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
 
<td style="vertical-align:top"><def:ValueSetLabel ID="ValueSetLabel_sib1_6" runat="server"  DatabaseField="sib1_6" Separator=", "></def:ValueSetLabel></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="sib1_7" DatabaseField="sib1_7" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
 
<td style="vertical-align:top"><def:ValueSetLabel ID="ValueSetLabel_sib1_7" runat="server"  DatabaseField="sib1_7" Separator=", "></def:ValueSetLabel></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="sib1_8" DatabaseField="sib1_8" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="sib1_9" DatabaseField="sib1_9" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
 
<td style="vertical-align:top"><def:ValueSetLabel ID="ValueSetLabel_sib1_9" runat="server"  DatabaseField="sib1_9" Separator=", "></def:ValueSetLabel></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="sib1_10" DatabaseField="sib1_10" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
 
<td style="vertical-align:top"><def:ValueSetLabel ID="ValueSetLabel_sib1_10" runat="server"  DatabaseField="sib1_10" Separator=", "></def:ValueSetLabel></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="sib1_11" DatabaseField="sib1_11" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
 
<td style="vertical-align:top"><def:ValueSetLabel ID="ValueSetLabel_sib1_11" runat="server"  DatabaseField="sib1_11" Separator=", "></def:ValueSetLabel></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="sib1_12" DatabaseField="sib1_12" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
 
<td style="vertical-align:top"><def:ValueSetLabel ID="ValueSetLabel_sib1_12" runat="server"  DatabaseField="sib1_12" Separator=", "></def:ValueSetLabel></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="sib1_13" DatabaseField="sib1_13" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
 
<td style="vertical-align:top"><def:ValueSetLabel ID="ValueSetLabel_sib1_13" runat="server"  DatabaseField="sib1_13" Separator=", "></def:ValueSetLabel></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="sib1_14" DatabaseField="sib1_14" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
 
<td style="vertical-align:top"><def:ValueSetLabel ID="ValueSetLabel_sib1_14" runat="server"  DatabaseField="sib1_14" Separator=", "></def:ValueSetLabel></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="sib1_15" DatabaseField="sib1_15" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
 
<td style="vertical-align:top"><def:ValueSetLabel ID="ValueSetLabel_sib1_15" runat="server"  DatabaseField="sib1_15" Separator=", "></def:ValueSetLabel></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="sib1_16a" DatabaseField="sib1_16a" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
 
<td style="vertical-align:top"><def:ValueSetLabel ID="ValueSetLabel_sib1_16a" runat="server"  DatabaseField="sib1_16a" Separator=", "></def:ValueSetLabel></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="sib1_16b" DatabaseField="sib1_16b" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="sib1_16c" DatabaseField="sib1_16c" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="sib1_16d" DatabaseField="sib1_16d" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="sib1_16e" DatabaseField="sib1_16e" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="sib1_17a" DatabaseField="sib1_17a" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td style="vertical-align:top"><def:ValueSetLabel ID="ValueSetLabel_sib1_17a" runat="server"  DatabaseField="sib1_17a" Separator=", "></def:ValueSetLabel></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="sib1_17b" DatabaseField="sib1_17b" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="sib1_17c" DatabaseField="sib1_17c" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="sib1_17d" DatabaseField="sib1_17d" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="sib1_17e" DatabaseField="sib1_17e" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="sib1_17f" DatabaseField="sib1_17f" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 
</table>
<br /><br />



<!-- sib2 -->
<table>
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="sib2name" DatabaseField="sib2name" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="300px" FieldTextBoxWidth="120px" FieldTextBoxMaxLength="50"></def:datafieldcontrol></td>
<td></td></tr>
     
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="sib2gender" DatabaseField="sib2gender" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td></td></tr>

<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="sib2age" DatabaseField="sib2age" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="sib2_1" DatabaseField="sib2_1" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 
 
<%--<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="sib2name" DatabaseField="sib2name" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="300px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="50"></def:datafieldcontrol></td>
<td></td></tr>--%>
 
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="sib2_2" DatabaseField="sib2_2" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="sib2_3" DatabaseField="sib2_3" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="sib2_4" DatabaseField="sib2_4" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="sib2_5" DatabaseField="sib2_5" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td style="vertical-align:top"><def:ValueSetLabel ID="ValueSetLabel_sib2_5" runat="server"  DatabaseField="sib2_5" Separator=", "></def:ValueSetLabel></td></tr>

<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="sib2_5specify" DatabaseField="sib2_5specify" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="140px"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="sib2_6" DatabaseField="sib2_6" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
 
<td style="vertical-align:top"><def:ValueSetLabel ID="ValueSetLabel_sib2_6" runat="server"  DatabaseField="sib2_6" Separator=", "></def:ValueSetLabel></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="sib2_7" DatabaseField="sib2_7" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
 
<td style="vertical-align:top"><def:ValueSetLabel ID="ValueSetLabel_sib2_7" runat="server"  DatabaseField="sib2_7" Separator=", "></def:ValueSetLabel></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="sib2_8" DatabaseField="sib2_8" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="sib2_9" DatabaseField="sib2_9" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
 
<td style="vertical-align:top"><def:ValueSetLabel ID="ValueSetLabel_sib2_9" runat="server"  DatabaseField="sib2_9" Separator=", "></def:ValueSetLabel></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="sib2_10" DatabaseField="sib2_10" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
 
<td style="vertical-align:top"><def:ValueSetLabel ID="ValueSetLabel_sib2_10" runat="server"  DatabaseField="sib2_10" Separator=", "></def:ValueSetLabel></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="sib2_11" DatabaseField="sib2_11" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
 
<td style="vertical-align:top"><def:ValueSetLabel ID="ValueSetLabel_sib2_11" runat="server"  DatabaseField="sib2_11" Separator=", "></def:ValueSetLabel></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="sib2_12" DatabaseField="sib2_12" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
 
<td style="vertical-align:top"><def:ValueSetLabel ID="ValueSetLabel_sib2_12" runat="server"  DatabaseField="sib2_12" Separator=", "></def:ValueSetLabel></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="sib2_13" DatabaseField="sib2_13" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
 
<td style="vertical-align:top"><def:ValueSetLabel ID="ValueSetLabel_sib2_13" runat="server"  DatabaseField="sib2_13" Separator=", "></def:ValueSetLabel></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="sib2_14" DatabaseField="sib2_14" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
 
<td style="vertical-align:top"><def:ValueSetLabel ID="ValueSetLabel_sib2_14" runat="server"  DatabaseField="sib2_14" Separator=", "></def:ValueSetLabel></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="sib2_15" DatabaseField="sib2_15" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
 
<td style="vertical-align:top"><def:ValueSetLabel ID="ValueSetLabel_sib2_15" runat="server"  DatabaseField="sib2_15" Separator=", "></def:ValueSetLabel></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="sib2_16a" DatabaseField="sib2_16a" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
 
<td style="vertical-align:top"><def:ValueSetLabel ID="ValueSetLabel_sib2_16a" runat="server"  DatabaseField="sib2_16a" Separator=", "></def:ValueSetLabel></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="sib2_16b" DatabaseField="sib2_16b" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="sib2_16c" DatabaseField="sib2_16c" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="sib2_16d" DatabaseField="sib2_16d" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="sib2_16e" DatabaseField="sib2_16e" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="sib2_17a" DatabaseField="sib2_17a" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td style="vertical-align:top"><def:ValueSetLabel ID="ValueSetLabel_sib2_17a" runat="server"  DatabaseField="sib2_17a" Separator=", "></def:ValueSetLabel></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="sib2_17b" DatabaseField="sib2_17b" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="sib2_17c" DatabaseField="sib2_17c" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="sib2_17d" DatabaseField="sib2_17d" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="sib2_17e" DatabaseField="sib2_17e" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="sib2_17f" DatabaseField="sib2_17f" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 
</table>
<br /><br />




<!-- sib3 -->
<table>
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="sib3name" DatabaseField="sib3name" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="300px" FieldTextBoxWidth="120px" FieldTextBoxMaxLength="50"></def:datafieldcontrol></td>
<td></td></tr>
     
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="sib3gender" DatabaseField="sib3gender" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td></td></tr>

<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="sib3age" DatabaseField="sib3age" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="sib3_1" DatabaseField="sib3_1" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 
 
<%--<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="sib3name" DatabaseField="sib3name" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="300px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="50"></def:datafieldcontrol></td>
<td></td></tr>--%>
 
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="sib3_2" DatabaseField="sib3_2" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="sib3_3" DatabaseField="sib3_3" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="sib3_4" DatabaseField="sib3_4" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="sib3_5" DatabaseField="sib3_5" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td style="vertical-align:top"><def:ValueSetLabel ID="ValueSetLabel_sib3_5" runat="server"  DatabaseField="sib3_5" Separator=", "></def:ValueSetLabel></td></tr>

 <tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="sib3_5specify" DatabaseField="sib3_5specify" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="140px"></def:datafieldcontrol></td>
<td></td></tr>

<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="sib3_6" DatabaseField="sib3_6" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
 
<td style="vertical-align:top"><def:ValueSetLabel ID="ValueSetLabel_sib3_6" runat="server"  DatabaseField="sib3_6" Separator=", "></def:ValueSetLabel></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="sib3_7" DatabaseField="sib3_7" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
 
<td style="vertical-align:top"><def:ValueSetLabel ID="ValueSetLabel_sib3_7" runat="server"  DatabaseField="sib3_7" Separator=", "></def:ValueSetLabel></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="sib3_8" DatabaseField="sib3_8" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="sib3_9" DatabaseField="sib3_9" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
 
<td style="vertical-align:top"><def:ValueSetLabel ID="ValueSetLabel_sib3_9" runat="server"  DatabaseField="sib3_9" Separator=", "></def:ValueSetLabel></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="sib3_10" DatabaseField="sib3_10" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
 
<td style="vertical-align:top"><def:ValueSetLabel ID="ValueSetLabel_sib3_10" runat="server"  DatabaseField="sib3_10" Separator=", "></def:ValueSetLabel></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="sib3_11" DatabaseField="sib3_11" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
 
<td style="vertical-align:top"><def:ValueSetLabel ID="ValueSetLabel_sib3_11" runat="server"  DatabaseField="sib3_11" Separator=", "></def:ValueSetLabel></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="sib3_12" DatabaseField="sib3_12" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
 
<td style="vertical-align:top"><def:ValueSetLabel ID="ValueSetLabel_sib3_12" runat="server"  DatabaseField="sib3_12" Separator=", "></def:ValueSetLabel></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="sib3_13" DatabaseField="sib3_13" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
 
<td style="vertical-align:top"><def:ValueSetLabel ID="ValueSetLabel_sib3_13" runat="server"  DatabaseField="sib3_13" Separator=", "></def:ValueSetLabel></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="sib3_14" DatabaseField="sib3_14" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
 
<td style="vertical-align:top"><def:ValueSetLabel ID="ValueSetLabel_sib3_14" runat="server"  DatabaseField="sib3_14" Separator=", "></def:ValueSetLabel></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="sib3_15" DatabaseField="sib3_15" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
 
<td style="vertical-align:top"><def:ValueSetLabel ID="ValueSetLabel_sib3_15" runat="server"  DatabaseField="sib3_15" Separator=", "></def:ValueSetLabel></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="sib3_16a" DatabaseField="sib3_16a" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
 
<td style="vertical-align:top"><def:ValueSetLabel ID="ValueSetLabel_sib3_16a" runat="server"  DatabaseField="sib3_16a" Separator=", "></def:ValueSetLabel></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="sib3_16b" DatabaseField="sib3_16b" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="sib3_16c" DatabaseField="sib3_16c" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="sib3_16d" DatabaseField="sib3_16d" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="sib3_16e" DatabaseField="sib3_16e" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="sib3_17a" DatabaseField="sib3_17a" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td style="vertical-align:top"><def:ValueSetLabel ID="ValueSetLabel_sib3_17a" runat="server"  DatabaseField="sib3_17a" Separator=", "></def:ValueSetLabel></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="sib3_17b" DatabaseField="sib3_17b" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="sib3_17c" DatabaseField="sib3_17c" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="sib3_17d" DatabaseField="sib3_17d" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="sib3_17e" DatabaseField="sib3_17e" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="sib3_17f" DatabaseField="sib3_17f" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 
</table>
<br /><br />





<!-- sib4 -->
<table>
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="sib4name" DatabaseField="sib4name" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="300px" FieldTextBoxWidth="120px" FieldTextBoxMaxLength="50"></def:datafieldcontrol></td>
<td></td></tr>
     
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="sib4gender" DatabaseField="sib4gender" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td></td></tr>

<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="sib4age" DatabaseField="sib4age" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="sib4_1" DatabaseField="sib4_1" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 
 
<%--<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="sib4name" DatabaseField="sib4name" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="300px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="50"></def:datafieldcontrol></td>
<td></td></tr>--%>
 
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="sib4_2" DatabaseField="sib4_2" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="sib4_3" DatabaseField="sib4_3" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="sib4_4" DatabaseField="sib4_4" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="sib4_5" DatabaseField="sib4_5" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td style="vertical-align:top"><def:ValueSetLabel ID="ValueSetLabel_sib4_5" runat="server"  DatabaseField="sib4_5" Separator=", "></def:ValueSetLabel></td></tr>

<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="sib4_5specify" DatabaseField="sib4_5specify" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="140px"></def:datafieldcontrol></td>
<td></td></tr>

<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="sib4_6" DatabaseField="sib4_6" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
 
<td style="vertical-align:top"><def:ValueSetLabel ID="ValueSetLabel_sib4_6" runat="server"  DatabaseField="sib4_6" Separator=", "></def:ValueSetLabel></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="sib4_7" DatabaseField="sib4_7" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
 
<td style="vertical-align:top"><def:ValueSetLabel ID="ValueSetLabel_sib4_7" runat="server"  DatabaseField="sib4_7" Separator=", "></def:ValueSetLabel></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="sib4_8" DatabaseField="sib4_8" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="sib4_9" DatabaseField="sib4_9" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
 
<td style="vertical-align:top"><def:ValueSetLabel ID="ValueSetLabel_sib4_9" runat="server"  DatabaseField="sib4_9" Separator=", "></def:ValueSetLabel></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="sib4_10" DatabaseField="sib4_10" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
 
<td style="vertical-align:top"><def:ValueSetLabel ID="ValueSetLabel_sib4_10" runat="server"  DatabaseField="sib4_10" Separator=", "></def:ValueSetLabel></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="sib4_11" DatabaseField="sib4_11" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
 
<td style="vertical-align:top"><def:ValueSetLabel ID="ValueSetLabel_sib4_11" runat="server"  DatabaseField="sib4_11" Separator=", "></def:ValueSetLabel></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="sib4_12" DatabaseField="sib4_12" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
 
<td style="vertical-align:top"><def:ValueSetLabel ID="ValueSetLabel_sib4_12" runat="server"  DatabaseField="sib4_12" Separator=", "></def:ValueSetLabel></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="sib4_13" DatabaseField="sib4_13" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
 
<td style="vertical-align:top"><def:ValueSetLabel ID="ValueSetLabel_sib4_13" runat="server"  DatabaseField="sib4_13" Separator=", "></def:ValueSetLabel></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="sib4_14" DatabaseField="sib4_14" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
 
<td style="vertical-align:top"><def:ValueSetLabel ID="ValueSetLabel_sib4_14" runat="server"  DatabaseField="sib4_14" Separator=", "></def:ValueSetLabel></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="sib4_15" DatabaseField="sib4_15" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
 
<td style="vertical-align:top"><def:ValueSetLabel ID="ValueSetLabel_sib4_15" runat="server"  DatabaseField="sib4_15" Separator=", "></def:ValueSetLabel></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="sib4_16a" DatabaseField="sib4_16a" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
 
<td style="vertical-align:top"><def:ValueSetLabel ID="ValueSetLabel_sib4_16a" runat="server"  DatabaseField="sib4_16a" Separator=", "></def:ValueSetLabel></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="sib4_16b" DatabaseField="sib4_16b" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="sib4_16c" DatabaseField="sib4_16c" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="sib4_16d" DatabaseField="sib4_16d" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="sib4_16e" DatabaseField="sib4_16e" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="sib4_17a" DatabaseField="sib4_17a" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td style="vertical-align:top"><def:ValueSetLabel ID="ValueSetLabel_sib4_17a" runat="server"  DatabaseField="sib4_17a" Separator=", "></def:ValueSetLabel></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="sib4_17b" DatabaseField="sib4_17b" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="sib4_17c" DatabaseField="sib4_17c" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="sib4_17d" DatabaseField="sib4_17d" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="sib4_17e" DatabaseField="sib4_17e" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="sib4_17f" DatabaseField="sib4_17f" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 
</table>
<br /><br />





<!-- sib5 -->
<table>
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="sib5name" DatabaseField="sib5name" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="300px" FieldTextBoxWidth="120px" FieldTextBoxMaxLength="50"></def:datafieldcontrol></td>
<td></td></tr>
     
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="sib5gender" DatabaseField="sib5gender" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td></td></tr>

<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="sib5age" DatabaseField="sib5age" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="sib5_1" DatabaseField="sib5_1" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 
 
<%--<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="sib5name" DatabaseField="sib5name" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="300px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="50"></def:datafieldcontrol></td>
<td></td></tr>--%>
 
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="sib5_2" DatabaseField="sib5_2" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="sib5_3" DatabaseField="sib5_3" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="sib5_4" DatabaseField="sib5_4" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="sib5_5" DatabaseField="sib5_5" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td style="vertical-align:top"><def:ValueSetLabel ID="ValueSetLabel_sib5_5" runat="server"  DatabaseField="sib5_5" Separator=", "></def:ValueSetLabel></td></tr>

    <tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="sib5_5specify" DatabaseField="sib5_5specify" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="140px"></def:datafieldcontrol></td>
<td></td></tr>

 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="sib5_6" DatabaseField="sib5_6" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
 
<td style="vertical-align:top"><def:ValueSetLabel ID="ValueSetLabel_sib5_6" runat="server"  DatabaseField="sib5_6" Separator=", "></def:ValueSetLabel></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="sib5_7" DatabaseField="sib5_7" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
 
<td style="vertical-align:top"><def:ValueSetLabel ID="ValueSetLabel_sib5_7" runat="server"  DatabaseField="sib5_7" Separator=", "></def:ValueSetLabel></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="sib5_8" DatabaseField="sib5_8" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="sib5_9" DatabaseField="sib5_9" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
 
<td style="vertical-align:top"><def:ValueSetLabel ID="ValueSetLabel_sib5_9" runat="server"  DatabaseField="sib5_9" Separator=", "></def:ValueSetLabel></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="sib5_10" DatabaseField="sib5_10" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
 
<td style="vertical-align:top"><def:ValueSetLabel ID="ValueSetLabel_sib5_10" runat="server"  DatabaseField="sib5_10" Separator=", "></def:ValueSetLabel></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="sib5_11" DatabaseField="sib5_11" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
 
<td style="vertical-align:top"><def:ValueSetLabel ID="ValueSetLabel_sib5_11" runat="server"  DatabaseField="sib5_11" Separator=", "></def:ValueSetLabel></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="sib5_12" DatabaseField="sib5_12" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
 
<td style="vertical-align:top"><def:ValueSetLabel ID="ValueSetLabel_sib5_12" runat="server"  DatabaseField="sib5_12" Separator=", "></def:ValueSetLabel></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="sib5_13" DatabaseField="sib5_13" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
 
<td style="vertical-align:top"><def:ValueSetLabel ID="ValueSetLabel_sib5_13" runat="server"  DatabaseField="sib5_13" Separator=", "></def:ValueSetLabel></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="sib5_14" DatabaseField="sib5_14" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
 
<td style="vertical-align:top"><def:ValueSetLabel ID="ValueSetLabel_sib5_14" runat="server"  DatabaseField="sib5_14" Separator=", "></def:ValueSetLabel></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="sib5_15" DatabaseField="sib5_15" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
 
<td style="vertical-align:top"><def:ValueSetLabel ID="ValueSetLabel_sib5_15" runat="server"  DatabaseField="sib5_15" Separator=", "></def:ValueSetLabel></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="sib5_16a" DatabaseField="sib5_16a" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
 
<td style="vertical-align:top"><def:ValueSetLabel ID="ValueSetLabel_sib5_16a" runat="server"  DatabaseField="sib5_16a" Separator=", "></def:ValueSetLabel></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="sib5_16b" DatabaseField="sib5_16b" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="sib5_16c" DatabaseField="sib5_16c" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="sib5_16d" DatabaseField="sib5_16d" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="sib5_16e" DatabaseField="sib5_16e" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="sib5_17a" DatabaseField="sib5_17a" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td style="vertical-align:top"><def:ValueSetLabel ID="ValueSetLabel_sib5_17a" runat="server"  DatabaseField="sib5_17a" Separator=", "></def:ValueSetLabel></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="sib5_17b" DatabaseField="sib5_17b" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="sib5_17c" DatabaseField="sib5_17c" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="sib5_17d" DatabaseField="sib5_17d" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="sib5_17e" DatabaseField="sib5_17e" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="sib5_17f" DatabaseField="sib5_17f" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 
</table>
<br /><br />











<table> 
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
