<%@ Register TagPrefix="def" Namespace="DataEntryFramework3" %> 
<%@ Page language="c#" MasterPageFile="~/UWAC.master"  Title="LUI Excerpt Data Entry" %>
<asp:Content ID="Content1" ContentPlaceHolderID="oBodyPlaceHolder" runat="server">

<def:dataentrycontroller id="DataEntryController1" runat="server" DatabaseTable="ALL_LUI_Excerpt" PrimaryKeyField="luie_pk">
</def:dataentrycontroller>
   <asp:ScriptManager ID="ScriptManager1" runat="server">    </asp:ScriptManager>
<asp:UpdatePanel ID="UpdatePanel1" runat="server">
  <ContentTemplate>
<table>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="id" DatabaseField="id" IsInsertField="true" FieldLabelWidth="300px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="15"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="indexnum" DatabaseField="indexnum" IsInsertField="true" FieldTextBoxTextDefault="1" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="luie_date" DatabaseField="luie_date" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FormatString="{0:d}" ></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="luie_agemo" DatabaseField="luie_agemo" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="luie_resp" DatabaseField="luie_resp" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="300px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="50"></def:datafieldcontrol></td>
<td></td></tr>

<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="luie_scrmsg" DatabaseField="luie_scrmsg"  IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="300px" FieldTextBoxWidth="400px" FieldTextBoxHeight="40px" FieldTextBoxTextMode="multiline" FieldTextBoxMaxLength="250"></def:datafieldcontrol></td>
<td></td></tr>

 </table>

 <br /><br />
 <table>
 <tr><td>     <asp:Label ID="Label1" runat="server" Text="D. YOUR CHILD'S REQUESTS FOR HELP"  Font-Bold="true"></asp:Label></td></tr>
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="luie_D07" DatabaseField="luie_D07" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="500px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
 
<td style="vertical-align:top"><def:ValueSetLabel ID="ValueSetLabel_luie_D07" runat="server"  DatabaseField="luie_D07"></def:ValueSetLabel></td></tr>
 
  <tr><td>     <asp:Label ID="Label2" runat="server" Text="F. HOW YOUR CHILD USES WORDS TO GET YOU TO NOTICE SOMETHING" Font-Bold="true"></asp:Label></td></tr>

<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="luie_F01" DatabaseField="luie_F01" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="500px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
 
<td style="vertical-align:top"><def:ValueSetLabel ID="ValueSetLabel_luie_F01" runat="server"  DatabaseField="luie_F01"></def:ValueSetLabel></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="luie_F02" DatabaseField="luie_F02" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="500px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="luie_F03" DatabaseField="luie_F03" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="500px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="luie_F04" DatabaseField="luie_F04" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="500px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="luie_F05" DatabaseField="luie_F05" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="500px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td style="vertical-align:top"><def:ValueSetLabel ID="ValueSetLabel_luie_DF05" runat="server"  DatabaseField="luie_F05"></def:ValueSetLabel></td></tr>


<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="luie_F06" DatabaseField="luie_F06" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="500px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td></td></tr>

<tr><td>     <br /><asp:Label ID="Label3" runat="server" Text="" Font-Bold="true"></asp:Label></td></tr>

 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="luie_G01" DatabaseField="luie_G01" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="500px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td style="vertical-align:top"><def:ValueSetLabel ID="ValueSetLabel_luie_G01" runat="server"  DatabaseField="luie_G01"></def:ValueSetLabel></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="luie_G02" DatabaseField="luie_G02" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="500px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="luie_G03" DatabaseField="luie_G03" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="500px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="luie_G04" DatabaseField="luie_G04" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="500px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="luie_G05" DatabaseField="luie_G05" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="500px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="luie_G06" DatabaseField="luie_G06" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="500px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="luie_G07" DatabaseField="luie_G07" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="500px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="luie_G08" DatabaseField="luie_G08" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="500px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="luie_G09" DatabaseField="luie_G09" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="500px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td></td></tr>


<tr><td>     <br /><asp:Label ID="Label4" runat="server" Text="H: YOUR CHILD’S QUESTIONS & COMMENTS ABOUT THEMSELVES OR OTHER PEOPLE" Font-Bold="true"></asp:Label></td></tr>

 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="luie_H01" DatabaseField="luie_H01" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="500px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="luie_H02" DatabaseField="luie_H02" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="500px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="luie_H03" DatabaseField="luie_H03" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="500px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="luie_H04" DatabaseField="luie_H04" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="500px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="luie_H05" DatabaseField="luie_H05" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="500px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="luie_H06" DatabaseField="luie_H06" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="500px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="luie_H07" DatabaseField="luie_H07" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="500px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="luie_H08" DatabaseField="luie_H08" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="500px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="luie_H09" DatabaseField="luie_H09" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="500px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="luie_H10" DatabaseField="luie_H10" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="500px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="luie_H11" DatabaseField="luie_H11" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="500px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="luie_H12" DatabaseField="luie_H12" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="500px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="luie_H13" DatabaseField="luie_H13" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="500px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="luie_H14" DatabaseField="luie_H14" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="500px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="luie_H15" DatabaseField="luie_H15" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="500px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="luie_H16" DatabaseField="luie_H16" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="500px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="luie_H17" DatabaseField="luie_H17" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="500px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="luie_H18" DatabaseField="luie_H18" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="500px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="luie_H19" DatabaseField="luie_H19" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="500px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="luie_H20" DatabaseField="luie_H20" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="500px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="luie_H21" DatabaseField="luie_H21" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="500px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="luie_H22" DatabaseField="luie_H22" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="500px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="luie_H23" DatabaseField="luie_H23" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="500px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="luie_H24" DatabaseField="luie_H24" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="500px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="luie_H25" DatabaseField="luie_H25" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="500px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="luie_H26" DatabaseField="luie_H26" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="500px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="luie_H27" DatabaseField="luie_H27" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="500px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="luie_H28" DatabaseField="luie_H28" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="500px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="luie_H29" DatabaseField="luie_H29" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="500px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="luie_H30" DatabaseField="luie_H30" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="500px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="luie_H31" DatabaseField="luie_H31" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="500px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="luie_H32" DatabaseField="luie_H32" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="500px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="luie_H33" DatabaseField="luie_H33" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="500px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td style="vertical-align:top"><def:ValueSetLabel ID="ValueSetLabel_luie_H33" runat="server"  DatabaseField="luie_H33"></def:ValueSetLabel></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="luie_H34" DatabaseField="luie_H34" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="500px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="luie_H35" DatabaseField="luie_H35" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="500px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="luie_H36" DatabaseField="luie_H36" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="500px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td></td></tr>


<tr><td>     <br /><asp:Label ID="Label5" runat="server" Text="I: YOUR CHILD’S USE OF WORDS IN ACTIVITIES WITH OTHERS" Font-Bold="true"></asp:Label></td></tr>


 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="luie_I01" DatabaseField="luie_I01" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="500px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td style="vertical-align:top"><def:ValueSetLabel ID="ValueSetLabel_luie_I01" runat="server"  DatabaseField="luie_I01"></def:ValueSetLabel></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="luie_I02" DatabaseField="luie_I02" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="500px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="luie_I03" DatabaseField="luie_I03" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="500px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="luie_I04" DatabaseField="luie_I04" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="500px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="luie_I05" DatabaseField="luie_I05" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="500px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="luie_I06" DatabaseField="luie_I06" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="500px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="luie_I07" DatabaseField="luie_I07" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="500px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="luie_I08" DatabaseField="luie_I08" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="500px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="luie_I09" DatabaseField="luie_I09" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="500px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="luie_I10" DatabaseField="luie_I10" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="500px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="luie_I11" DatabaseField="luie_I11" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="500px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="luie_I12" DatabaseField="luie_I12" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="500px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="luie_I13" DatabaseField="luie_I13" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="500px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="luie_I14" DatabaseField="luie_I14" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="500px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 
 <tr><td>     <br /><asp:Label ID="Label6" runat="server" Text="K. YOUR CHILD’S INTEREST IN WORDS AND LANGUAGE" Font-Bold="true"></asp:Label></td></tr>


<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="luie_K01" DatabaseField="luie_K01" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="500px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="luie_K02" DatabaseField="luie_K02" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="500px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="luie_K03" DatabaseField="luie_K03" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="500px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="luie_K04" DatabaseField="luie_K04" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="500px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="luie_K05" DatabaseField="luie_K05" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="500px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="luie_K06" DatabaseField="luie_K06" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="500px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="luie_K07" DatabaseField="luie_K07" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="500px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="luie_K08" DatabaseField="luie_K08" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="500px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="luie_K09" DatabaseField="luie_K09" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="500px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="luie_K10" DatabaseField="luie_K10" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="500px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="luie_K11" DatabaseField="luie_K11" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="500px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="luie_K12" DatabaseField="luie_K12" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="500px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 
 <tr><td>     <br /><asp:Label ID="Label7" runat="server" Text="M: HOW YOUR CHILD ADAPTS CONVERSATION TO OTHER PEOPLE" Font-Bold="true"></asp:Label></td></tr>



<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="luie_M01" DatabaseField="luie_M01" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="500px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="luie_M02" DatabaseField="luie_M02" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="500px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="luie_M03" DatabaseField="luie_M03" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="500px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="luie_M04" DatabaseField="luie_M04" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="500px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="luie_M05" DatabaseField="luie_M05" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="500px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="luie_M06" DatabaseField="luie_M06" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="500px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="luie_M07" DatabaseField="luie_M07" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="500px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="luie_M08" DatabaseField="luie_M08" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="500px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="luie_M09" DatabaseField="luie_M09" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="500px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="luie_M10" DatabaseField="luie_M10" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="500px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="luie_M11" DatabaseField="luie_M11" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="500px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="luie_M12" DatabaseField="luie_M12" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="500px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="luie_M13" DatabaseField="luie_M13" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="500px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="luie_M14" DatabaseField="luie_M14" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="500px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="luie_M15" DatabaseField="luie_M15" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="500px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 
 </table>


 <br />
 <br />
      <asp:Label ID="Label9" runat="server" Text="Please mark any of these words that your child has begun to use:  (Yes=1, No=2)" Font-Bold="true"></asp:Label>
 <table>
 <tr>
 <td width="300px">
 
 <table>

 <tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="luie_N01" DatabaseField="luie_N01" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="luie_N02" DatabaseField="luie_N02" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="luie_N03" DatabaseField="luie_N03" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="luie_N04" DatabaseField="luie_N04" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="luie_N05" DatabaseField="luie_N05" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="luie_N06" DatabaseField="luie_N06" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="luie_N07" DatabaseField="luie_N07" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 </table>

 </td>
 <td width="300px">
 
 <table>
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="luie_N08" DatabaseField="luie_N08" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="luie_N09" DatabaseField="luie_N09" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="luie_N10" DatabaseField="luie_N10" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="luie_N11" DatabaseField="luie_N11" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="luie_N12" DatabaseField="luie_N12" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="luie_N13" DatabaseField="luie_N13" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="luie_N14" DatabaseField="luie_N14" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
</table>
 </td>
 <td width="300px">
 <table> 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="luie_N15" DatabaseField="luie_N15" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="luie_N16" DatabaseField="luie_N16" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="luie_N17" DatabaseField="luie_N17" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="luie_N18" DatabaseField="luie_N18" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="luie_N19" DatabaseField="luie_N19" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="luie_N20" DatabaseField="luie_N20" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="luie_N21" DatabaseField="luie_N21" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
  </table>

 </td>
 
 </tr>
 </table>
 
 <br />
 <br />
 <table>
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="luie_N22" DatabaseField="luie_N22" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="luie_N23" DatabaseField="luie_N23" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="luie_N24" DatabaseField="luie_N24" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="luie_N25" DatabaseField="luie_N25" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="luie_N26" DatabaseField="luie_N26" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="luie_N27" DatabaseField="luie_N27" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="luie_N28" DatabaseField="luie_N28" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="luie_N29" DatabaseField="luie_N29" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="luie_N30" DatabaseField="luie_N30" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="luie_N31" DatabaseField="luie_N31" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 
 <tr><td><br />
     <asp:Label ID="Label8" runat="server" Text="When your child tells you a story, or part of a story:" Font-Bold="true"></asp:Label>
 </td></tr>

<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="luie_N32" DatabaseField="luie_N32" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="luie_N33" DatabaseField="luie_N33" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="luie_N34" DatabaseField="luie_N34" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="luie_N35" DatabaseField="luie_N35" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="luie_N36" DatabaseField="luie_N36" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td></td></tr>

</table>

<br /><br />
<table> 

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
