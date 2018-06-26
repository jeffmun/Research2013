<%@ Register TagPrefix="def" Namespace="DataEntryFramework3" %> 
<%@ Page Language="c#" Debug="true" MasterPageFile="~/UWAC.master"  Title="PB_FOT Data Entry"
CodeFile="PB_FOT.aspx.cs" Inherits="DataEntryForms_Common_PB_FOT_PB_FOT" %>
<asp:Content ID="Content1" ContentPlaceHolderID="oBodyPlaceHolder" runat="server">

<def:dataentrycontroller id="DataEntryController1" runat="server" DatabaseTable="ALL_PB_FOT" PrimaryKeyField="PB_FOT_pk">
</def:dataentrycontroller>
   <asp:ScriptManager ID="ScriptManager1" runat="server">    </asp:ScriptManager>
<asp:UpdatePanel ID="UpdatePanel1" runat="server">
  <ContentTemplate>
<table>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="id" DatabaseField="id" IsInsertField="true" FieldLabelWidth="300px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="15"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="indexnum" DatabaseField="indexnum" IsInsertField="true" FieldTextBoxTextDefault="1" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="PB_FOT_date" DatabaseField="PB_FOT_date" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FormatString="{0:d}" ></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="PB_FOT_agemo" DatabaseField="PB_FOT_agemo" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 
 <%--
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="PB_FOT_exmnr" DatabaseField="PB_FOT_exmnr" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="300px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="20"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="PB_FOT_resp" DatabaseField="PB_FOT_resp" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="300px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="50"></def:datafieldcontrol></td>
<td></td></tr>
 --%>
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="PB_FOT__IT" DatabaseField="PB_FOT__IT" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="300px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="20"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="PB_FOT__rater" DatabaseField="PB_FOT__rater" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="300px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="20"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="PB_FOT__date" DatabaseField="PB_FOT__date" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FormatString="{0:d}" ></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="PB_FOT__code_date" DatabaseField="PB_FOT__code_date" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FormatString="{0:d}" ></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="PB_FOT__location" DatabaseField="PB_FOT__location" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="300px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="50"></def:datafieldcontrol></td>
<td></td></tr>
 
<%--<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="PB_FOT__timepoint" DatabaseField="PB_FOT__timepoint" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"  ></def:datafieldcontrol></td>
<td></td></tr>
--%> 



<%--<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="PB_FOT_agemos1" DatabaseField="PB_FOT_agemos1" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="PB_FOT_agemos2" DatabaseField="PB_FOT_agemos2" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="PB_FOT_agemos3" DatabaseField="PB_FOT_agemos3" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="30px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td></td></tr>--%>


<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="PB_FOT_cmnt" DatabaseField="PB_FOT_cmnt" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="300px" FieldTextBoxWidth="400px" FieldTextBoxHeight="40px" FieldTextBoxTextMode="multiline" FieldTextBoxMaxLength="250"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="PB_FOT_scrmsg" DatabaseField="PB_FOT_scrmsg"  IsReadOnly="true" RenderReadOnlyAsDiv="true"  FieldLabelWidth="300px" FieldTextBoxWidth="400px" FieldTextBoxHeight="40px" FieldTextBoxTextMode="multiline" FieldTextBoxMaxLength="250"></def:datafieldcontrol></td>
<td></td></tr>

<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="PB_FOT_Avg" DatabaseField="PB_FOT_Avg" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td></td></tr>

<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="PB_FOT_AnyLT3txt" DatabaseField="PB_FOT_AnyLT3txt" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="PB_FOT_AtFidtxt" DatabaseField="PB_FOT_AtFidtxt" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td></td></tr>

</table>

<br />
<table>
<tr><td width = "100px">
</td>
<td><def:ValueSetLabel ID="ValueSetLabel_PB_FOT_A1" runat="server"  DatabaseField="PB_FOT_A1"></def:ValueSetLabel>
</td>
</tr></table>


<table>
<tr><td style="vertical-align:top">

 <table>
 <tr><td style="vertical-align:top"> <asp:Label ID="Label4" runat="server" Width="180px" Text="" Font-Bold="true"></asp:Label>  <asp:Label ID="Label3" runat="server" Text="......Activity 1......" Font-Bold="true"></asp:Label></td> <td></td></tr>

 <tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="PB_FOT__activity1" DatabaseField="PB_FOT__activity1" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="250px" FieldTextBoxWidth="150px" FieldTextBoxMaxLength="50"></def:datafieldcontrol></td>
<td></td></tr>
<%--
 <tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="PB_FOT_date1" DatabaseField="PB_FOT_date1" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="250px" FormatString="{0:d}" ></def:datafieldcontrol></td>
<td></td></tr>


<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="PB_FOT_coddate1" DatabaseField="PB_FOT_coddate1" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="250px" FormatString="{0:d}" ></def:datafieldcontrol></td>
<td></td></tr>
  
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="PB_FOT_txwk1" DatabaseField="PB_FOT_txwk1" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="250px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
--%>

<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="PB_FOT_A1" DatabaseField="PB_FOT_A1" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="250px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="PB_FOT_B1" DatabaseField="PB_FOT_B1" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="250px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="PB_FOT_C1" DatabaseField="PB_FOT_C1" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="250px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="PB_FOT_D1" DatabaseField="PB_FOT_D1" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="250px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="PB_FOT_E1" DatabaseField="PB_FOT_E1" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="250px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="PB_FOT_F1" DatabaseField="PB_FOT_F1" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="250px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="PB_FOT_G1" DatabaseField="PB_FOT_G1" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="250px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="PB_FOT_H1" DatabaseField="PB_FOT_H1" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="250px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="PB_FOT_I1" DatabaseField="PB_FOT_I1" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="250px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="PB_FOT_J1" DatabaseField="PB_FOT_J1" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="250px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="PB_FOT_K1" DatabaseField="PB_FOT_K1" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="250px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="PB_FOT_L1" DatabaseField="PB_FOT_L1" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="250px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="PB_FOT_M1" DatabaseField="PB_FOT_M1" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="250px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td></td></tr>


<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="PB_FOT_Avg1" DatabaseField="PB_FOT_Avg1" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 

 
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="PB_FOT_Notes1" DatabaseField="PB_FOT_Notes1" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="250px" FieldTextBoxWidth="200px" FieldTextBoxHeight="50px" FieldTextBoxTextMode="multiline" FieldTextBoxMaxLength="500"></def:datafieldcontrol></td>
<td></td></tr>
</table>
</td>

<td style="vertical-align:top">
 <table>
<tr><td style="vertical-align:top">   <asp:Label ID="Label1" runat="server" Text="......Activity 2......" Font-Bold="true"></asp:Label></td> <td></td></tr>

<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="PB_FOT__activity2" DatabaseField="PB_FOT__activity2" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="80px" FieldTextBoxWidth="150px" FieldTextBoxMaxLength="50"></def:datafieldcontrol></td>
<td></td></tr>
 <%--
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="PB_FOT_date2" DatabaseField="PB_FOT_date2" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="80px" FormatString="{0:d}" ></def:datafieldcontrol></td>
<td></td></tr>
  
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="PB_FOT_coddate2" DatabaseField="PB_FOT_coddate2" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="80px" FormatString="{0:d}" ></def:datafieldcontrol></td>
<td></td></tr>
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="PB_FOT_txwk2" DatabaseField="PB_FOT_txwk2" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="70px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 --%>
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="PB_FOT_A2" DatabaseField="PB_FOT_A2" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="30px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="PB_FOT_B2" DatabaseField="PB_FOT_B2" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="30px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="PB_FOT_C2" DatabaseField="PB_FOT_C2" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="30px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="PB_FOT_D2" DatabaseField="PB_FOT_D2" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="30px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="PB_FOT_E2" DatabaseField="PB_FOT_E2" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="30px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="PB_FOT_F2" DatabaseField="PB_FOT_F2" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="30px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="PB_FOT_G2" DatabaseField="PB_FOT_G2" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="30px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="PB_FOT_H2" DatabaseField="PB_FOT_H2" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="30px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="PB_FOT_I2" DatabaseField="PB_FOT_I2" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="30px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="PB_FOT_J2" DatabaseField="PB_FOT_J2" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="30px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="PB_FOT_K2" DatabaseField="PB_FOT_K2" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="30px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="PB_FOT_L2" DatabaseField="PB_FOT_L2" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="30px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="PB_FOT_M2" DatabaseField="PB_FOT_M2" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="30px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 
 <tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="PB_FOT_Avg2" DatabaseField="PB_FOT_Avg2" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="60px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 

<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="PB_FOT_Notes2" DatabaseField="PB_FOT_Notes2" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="30px" FieldTextBoxWidth="200px" FieldTextBoxHeight="50px" FieldTextBoxTextMode="multiline" FieldTextBoxMaxLength="500"></def:datafieldcontrol></td>
<td></td></tr>
</table>
</td>
<td style="vertical-align:top">
<table>
<tr><td style="vertical-align:top">   <asp:Label ID="Label2" runat="server" Text="......Activity 3......" Font-Bold="true"></asp:Label></td> <td></td></tr>

 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="PB_FOT__activity3" DatabaseField="PB_FOT__activity3" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="80px" FieldTextBoxWidth="150px" FieldTextBoxMaxLength="50"></def:datafieldcontrol></td>
<td></td></tr>
 

 <%--
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="PB_FOT_date3" DatabaseField="PB_FOT_date3" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="80px" FormatString="{0:d}" ></def:datafieldcontrol></td>
<td></td></tr>
  
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="PB_FOT_coddate3" DatabaseField="PB_FOT_coddate3" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="80px" FormatString="{0:d}" ></def:datafieldcontrol></td>
<td></td></tr>

<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="PB_FOT_txwk3" DatabaseField="PB_FOT_txwk3" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="70px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td></td></tr>--%>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="PB_FOT_A3" DatabaseField="PB_FOT_A3" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="30px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="PB_FOT_B3" DatabaseField="PB_FOT_B3" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="30px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="PB_FOT_C3" DatabaseField="PB_FOT_C3" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="30px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="PB_FOT_D3" DatabaseField="PB_FOT_D3" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="30px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="PB_FOT_E3" DatabaseField="PB_FOT_E3" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="30px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="PB_FOT_F3" DatabaseField="PB_FOT_F3" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="30px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="PB_FOT_G3" DatabaseField="PB_FOT_G3" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="30px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="PB_FOT_H3" DatabaseField="PB_FOT_H3" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="30px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="PB_FOT_I3" DatabaseField="PB_FOT_I3" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="30px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="PB_FOT_J3" DatabaseField="PB_FOT_J3" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="30px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="PB_FOT_K3" DatabaseField="PB_FOT_K3" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="30px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="PB_FOT_L3" DatabaseField="PB_FOT_L3" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="30px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="PB_FOT_M3" DatabaseField="PB_FOT_M3" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="30px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 
  <tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="PB_FOT_Avg3" DatabaseField="PB_FOT_Avg3" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="60px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td></td></tr>


<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="PB_FOT_Notes3" DatabaseField="PB_FOT_Notes3" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="30px" FieldTextBoxWidth="200px" FieldTextBoxHeight="50px" FieldTextBoxTextMode="multiline" FieldTextBoxMaxLength="500"></def:datafieldcontrol></td>
<td></td></tr>
</table>
</td></tr>
</table>



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
