<%@ Register TagPrefix="def" Namespace="DataEntryFramework3" %> 
<%@ Page language="c#" MasterPageFile="~/UWAC.master"  Title="Tadpole Pa Data Entry" %>
<asp:Content ID="Content1" ContentPlaceHolderID="oBodyPlaceHolder" runat="server">

<def:dataentrycontroller id="DataEntryController1" runat="server" DatabaseTable="ALL_Tadpole_ParSatis" PrimaryKeyField="tpsatis_pk">
</def:dataentrycontroller>
   <asp:ScriptManager ID="ScriptManager1" runat="server">    </asp:ScriptManager>
<asp:UpdatePanel ID="UpdatePanel1" runat="server">
  <ContentTemplate>
<table>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="id" DatabaseField="id" IsInsertField="true" FieldLabelWidth="300px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="15"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="indexnum" DatabaseField="indexnum" IsInsertField="true" FieldTextBoxTextDefault="1" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="tpsatis_date" DatabaseField="tpsatis_date" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FormatString="{0:d}" ></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="tpsatis_agemo" DatabaseField="tpsatis_agemo" IsReadOnly="true" RenderReadOnlyAsDiv="true"  FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td></td></tr>

 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="tpsatis_resp" DatabaseField="tpsatis_resp" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="300px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="50"></def:datafieldcontrol></td>
<td></td></tr>

</table>

<br /><br /><br />
<table> 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="tpsatis_01" DatabaseField="tpsatis_01" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="500px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
 
<td style="vertical-align:top"><def:ValueSetLabel ID="ValueSetLabel_tpsatis_01" runat="server"  DatabaseField="tpsatis_01"></def:ValueSetLabel><br/><br/></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="tpsatis_02" DatabaseField="tpsatis_02" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="500px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="tpsatis_03" DatabaseField="tpsatis_03" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="500px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
 
<td style="vertical-align:top"><def:ValueSetLabel ID="ValueSetLabel_tpsatis_03" runat="server"  DatabaseField="tpsatis_03"></def:ValueSetLabel><br/><br/></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="tpsatis_04" DatabaseField="tpsatis_04" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="500px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="tpsatis_05" DatabaseField="tpsatis_05" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="500px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
 
<td style="vertical-align:top"><def:ValueSetLabel ID="ValueSetLabel_tpsatis_05" runat="server"  DatabaseField="tpsatis_05"></def:ValueSetLabel><br/><br/></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="tpsatis_06" DatabaseField="tpsatis_06" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="500px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
 
<td style="vertical-align:top"><def:ValueSetLabel ID="ValueSetLabel_tpsatis_06" runat="server"  DatabaseField="tpsatis_06"></def:ValueSetLabel><br/><br/></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="tpsatis_07" DatabaseField="tpsatis_07" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="500px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
 
<td style="vertical-align:top"><def:ValueSetLabel ID="ValueSetLabel_tpsatis_07" runat="server"  DatabaseField="tpsatis_07"></def:ValueSetLabel><br/><br/></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="tpsatis_08" DatabaseField="tpsatis_08" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="500px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
 
<td style="vertical-align:top"><def:ValueSetLabel ID="ValueSetLabel_tpsatis_08" runat="server"  DatabaseField="tpsatis_08"></def:ValueSetLabel><br/><br/></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="tpsatis_09" DatabaseField="tpsatis_09" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="500px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
 
<td style="vertical-align:top"><def:ValueSetLabel ID="ValueSetLabel_tpsatis_09" runat="server"  DatabaseField="tpsatis_09"></def:ValueSetLabel><br/><br/></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="tpsatis_10" DatabaseField="tpsatis_10" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="500px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
 
<td style="vertical-align:top"><def:ValueSetLabel ID="ValueSetLabel_tpsatis_10" runat="server"  DatabaseField="tpsatis_10"></def:ValueSetLabel><br/><br/></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="tpsatis_11" DatabaseField="tpsatis_11" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="500px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
 
<td style="vertical-align:top"><def:ValueSetLabel ID="ValueSetLabel_tpsatis_11" runat="server"  DatabaseField="tpsatis_11"></def:ValueSetLabel><br/><br/></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="tpsatis_12" DatabaseField="tpsatis_12" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="500px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
 
<td style="vertical-align:top"><def:ValueSetLabel ID="ValueSetLabel_tpsatis_12" runat="server"  DatabaseField="tpsatis_12"></def:ValueSetLabel><br/><br/></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="tpsatis_13" DatabaseField="tpsatis_13" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="500px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
 
<td style="vertical-align:top"><def:ValueSetLabel ID="ValueSetLabel_tpsatis_13" runat="server"  DatabaseField="tpsatis_13"></def:ValueSetLabel><br/><br/></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="tpsatis_14" DatabaseField="tpsatis_14" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="500px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
 
<td style="vertical-align:top"><def:ValueSetLabel ID="ValueSetLabel_tpsatis_14" runat="server"  DatabaseField="tpsatis_14"></def:ValueSetLabel><br/><br/></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="tpsatis_15" DatabaseField="tpsatis_15" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="500px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
 
<td style="vertical-align:top"><def:ValueSetLabel ID="ValueSetLabel_tpsatis_15" runat="server"  DatabaseField="tpsatis_15"></def:ValueSetLabel><br/><br/></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="tpsatis_16" DatabaseField="tpsatis_16" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="500px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
 
<td style="vertical-align:top"><def:ValueSetLabel ID="ValueSetLabel_tpsatis_16" runat="server"  DatabaseField="tpsatis_16"></def:ValueSetLabel><br/><br/></td></tr>
</table>

<br /> <br />
<table>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="tpsatis_17a" DatabaseField="tpsatis_17a" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
 
<td style="vertical-align:top"><def:ValueSetLabel ID="ValueSetLabel_tpsatis_17a" runat="server"  DatabaseField="tpsatis_17a"></def:ValueSetLabel><br/><br/></td>
<td style="vertical-align:top"><def:datafieldcontrol runat="server" id="tpsatis_17a_txt" DatabaseField="tpsatis_17a_txt" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="100px" FieldTextBoxWidth="400px" FieldTextBoxHeight="40px" FieldTextBoxTextMode="multiline" FieldTextBoxMaxLength="250"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="tpsatis_17b" DatabaseField="tpsatis_17b" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td></td>
<td style="vertical-align:top"><def:datafieldcontrol runat="server" id="tpsatis_17b_txt" DatabaseField="tpsatis_17b_txt" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="100px" FieldTextBoxWidth="400px" FieldTextBoxHeight="40px" FieldTextBoxTextMode="multiline" FieldTextBoxMaxLength="250"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="tpsatis_17c" DatabaseField="tpsatis_17c" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td></td>
<td style="vertical-align:top"><def:datafieldcontrol runat="server" id="tpsatis_17c_txt" DatabaseField="tpsatis_17c_txt" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="100px" FieldTextBoxWidth="400px" FieldTextBoxHeight="40px" FieldTextBoxTextMode="multiline" FieldTextBoxMaxLength="250"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="tpsatis_17d" DatabaseField="tpsatis_17d" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td></td>
<td style="vertical-align:top"><def:datafieldcontrol runat="server" id="tpsatis_17d_txt" DatabaseField="tpsatis_17d_txt" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="100px" FieldTextBoxWidth="400px" FieldTextBoxHeight="40px" FieldTextBoxTextMode="multiline" FieldTextBoxMaxLength="250"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="tpsatis_17e" DatabaseField="tpsatis_17e" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td></td>
<td style="vertical-align:top"><def:datafieldcontrol runat="server" id="tpsatis_17e_txt" DatabaseField="tpsatis_17e_txt" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="100px" FieldTextBoxWidth="400px" FieldTextBoxHeight="40px" FieldTextBoxTextMode="multiline" FieldTextBoxMaxLength="250"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="tpsatis_17f" DatabaseField="tpsatis_17f" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td></td>
<td style="vertical-align:top"><def:datafieldcontrol runat="server" id="tpsatis_17f_txt" DatabaseField="tpsatis_17f_txt" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="100px" FieldTextBoxWidth="400px" FieldTextBoxHeight="40px" FieldTextBoxTextMode="multiline" FieldTextBoxMaxLength="250"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="tpsatis_17g" DatabaseField="tpsatis_17g" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td></td><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="tpsatis_17g_txt" DatabaseField="tpsatis_17g_txt" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="100px" FieldTextBoxWidth="400px" FieldTextBoxHeight="40px" FieldTextBoxTextMode="multiline" FieldTextBoxMaxLength="250"></def:datafieldcontrol></td>
<td></td></tr>
 </table>
 
 <br />
 <table>
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="tpsatis_18" DatabaseField="tpsatis_18" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="400px" FieldTextBoxHeight="40px" FieldTextBoxTextMode="multiline" FieldTextBoxMaxLength="250"></def:datafieldcontrol></td>
<td></td></tr>


 <br /><br /><br />
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
