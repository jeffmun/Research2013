<%@ Register TagPrefix="def" Namespace="DataEntryFramework3" %> 
<%@ Page language="c#" MasterPageFile="~/UWAC.master"  Title="PATH Screener Data Entry" %>
<asp:Content ID="Content1" ContentPlaceHolderID="oBodyPlaceHolder" runat="server">

<def:dataentrycontroller id="DataEntryController1" runat="server" DatabaseTable="ALL_PATH_Screener" PrimaryKeyField="pathscrn_pk">
</def:dataentrycontroller>
   <asp:ScriptManager ID="ScriptManager1" runat="server">    </asp:ScriptManager>
<asp:UpdatePanel ID="UpdatePanel1" runat="server">
  <ContentTemplate>
<table>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="id" DatabaseField="id" IsInsertField="true" FieldLabelWidth="300px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="15"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="indexnum" DatabaseField="indexnum" IsInsertField="true" FieldTextBoxTextDefault="1" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="pathscrn_date" DatabaseField="pathscrn_date" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FormatString="{0:d}" ></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="pathscrn_agemo" DatabaseField="pathscrn_agemo" IsReadOnly="true" RenderReadOnlyAsDiv="true"  FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td></td></tr>

<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="pathscrn_exmnr" DatabaseField="pathscrn_exmnr" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="300px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="20"></def:datafieldcontrol></td>
<td></td></tr>

<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="pathscrn_resp" DatabaseField="pathscrn_resp" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="300px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="50"></def:datafieldcontrol></td>
<td></td></tr>

 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="pathscrn_cmnt" DatabaseField="pathscrn_cmnt" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="300px" FieldTextBoxWidth="400px" FieldTextBoxHeight="40px" FieldTextBoxTextMode="multiline" FieldTextBoxMaxLength="250"></def:datafieldcontrol></td>
<td></td></tr>
 
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="pathscrn_scrmsg" DatabaseField="pathscrn_scrmsg" IsReadOnly="true" RenderReadOnlyAsDiv="true"  FieldLabelWidth="300px" FieldTextBoxWidth="400px" FieldTextBoxHeight="40px" FieldTextBoxTextMode="multiline" FieldTextBoxMaxLength="250"></def:datafieldcontrol></td>
<td></td></tr>
 

</table>

<br />
<br />

<table>

<tr><td style="vertical-align:top" align="right"> <asp:Label ID="Label4" runat="server" Text="1=Yes, 0=No, 9=Missing/Blank" Font-Size="Medium" Font-Bold="true" ></asp:Label></td>
   <td style="vertical-align:top"></td>
<td></td></tr>


<tr><td style="vertical-align:top" colspan="2">
    <asp:Label ID="Label1" runat="server" Text="Inclusion Criteria" Font-Bold="true" Font-Underline="true"></asp:Label>
</td></tr>
  
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="inc_willing24sess" DatabaseField="inc_willing24sess" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
   <td style="vertical-align:top"><def:datafieldcontrol runat="server" id="inc_willing24sess_txt" DatabaseField="inc_willing24sess_txt" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="50px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="50"></def:datafieldcontrol></td>
<td></td></tr>
 
  <tr><td style="vertical-align:top" colspan="2"><br />
    <asp:Label ID="Label2" runat="server" Text="Exclusion Criteria" Font-Bold="true" Font-Underline="true"></asp:Label>
</td></tr>

<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="exc_ambul" DatabaseField="exc_ambul" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td style="vertical-align:top"><def:datafieldcontrol runat="server" id="exc_ambul_txt" DatabaseField="exc_ambul_txt" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="50px" FieldTextBoxWidth="400px" FieldTextBoxHeight="40px" FieldTextBoxTextMode="multiline" FieldTextBoxMaxLength="250"></def:datafieldcontrol></td>
<td></td></tr>

<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="exc_ismultbir" DatabaseField="exc_ismultbir" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td style="vertical-align:top"><def:datafieldcontrol runat="server" id="exc_ismultbir_txt" DatabaseField="exc_ismultbir_txt" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="50px" FieldTextBoxWidth="400px" FieldTextBoxHeight="40px" FieldTextBoxTextMode="multiline" FieldTextBoxMaxLength="250"></def:datafieldcontrol></td>
<td></td></tr>
  
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="exc_interv" DatabaseField="exc_interv" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td style="vertical-align:top"><def:datafieldcontrol runat="server" id="exc_interv_txt" DatabaseField="exc_interv_txt" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="50px" FieldTextBoxWidth="400px" FieldTextBoxHeight="40px" FieldTextBoxTextMode="multiline" FieldTextBoxMaxLength="250"></def:datafieldcontrol></td>
<td></td></tr>

<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="exc_seiz" DatabaseField="exc_seiz" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td style="vertical-align:top"><def:datafieldcontrol runat="server" id="exc_seiz_txt" DatabaseField="exc_seiz_txt" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="50px" FieldTextBoxWidth="400px" FieldTextBoxHeight="40px" FieldTextBoxTextMode="multiline" FieldTextBoxMaxLength="250"></def:datafieldcontrol></td>
<td></td></tr> 


<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="exc_genet" DatabaseField="exc_genet" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td style="vertical-align:top"><def:datafieldcontrol runat="server" id="exc_genet_txt" DatabaseField="exc_genet_txt" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="50px" FieldTextBoxWidth="400px" FieldTextBoxHeight="40px" FieldTextBoxTextMode="multiline" FieldTextBoxMaxLength="250"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="exc_hearvis" DatabaseField="exc_hearvis" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td style="vertical-align:top"><def:datafieldcontrol runat="server" id="exc_hearvis_txt" DatabaseField="exc_hearvis_txt" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="50px" FieldTextBoxWidth="400px" FieldTextBoxHeight="40px" FieldTextBoxTextMode="multiline" FieldTextBoxMaxLength="250"></def:datafieldcontrol></td>
<td></td></tr>

<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="exc_motorimp" DatabaseField="exc_motorimp" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td style="vertical-align:top"><def:datafieldcontrol runat="server" id="exc_motorimp_txt" DatabaseField="exc_motorimp_txt" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="50px" FieldTextBoxWidth="400px" FieldTextBoxHeight="40px" FieldTextBoxTextMode="multiline" FieldTextBoxMaxLength="250"></def:datafieldcontrol></td>
<td></td></tr>

<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="exc_chronmed" DatabaseField="exc_chronmed" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td style="vertical-align:top"><def:datafieldcontrol runat="server" id="exc_chronmed_txt" DatabaseField="exc_chronmed_txt" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="50px" FieldTextBoxWidth="400px" FieldTextBoxHeight="40px" FieldTextBoxTextMode="multiline" FieldTextBoxMaxLength="250"></def:datafieldcontrol></td>
<td></td></tr>

<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="exc_prenatdrug" DatabaseField="exc_prenatdrug" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td style="vertical-align:top"><def:datafieldcontrol runat="server" id="exc_prenatdrug_txt" DatabaseField="exc_prenatdrug_txt" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="50px" FieldTextBoxWidth="400px" FieldTextBoxHeight="40px" FieldTextBoxTextMode="multiline" FieldTextBoxMaxLength="250"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="exc_majphysanom" DatabaseField="exc_majphysanom" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td style="vertical-align:top"><def:datafieldcontrol runat="server" id="exc_majphysanom_txt" DatabaseField="exc_majphysanom_txt" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="50px" FieldTextBoxWidth="400px" FieldTextBoxHeight="40px" FieldTextBoxTextMode="multiline" FieldTextBoxMaxLength="250"></def:datafieldcontrol></td>
<td></td></tr>
 
 <tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="exc_premat" DatabaseField="exc_premat" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td style="vertical-align:top"><def:datafieldcontrol runat="server" id="exc_premat_txt" DatabaseField="exc_premat_txt" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="50px" FieldTextBoxWidth="400px" FieldTextBoxHeight="40px" FieldTextBoxTextMode="multiline" FieldTextBoxMaxLength="250"></def:datafieldcontrol></td>
<td></td></tr>

 <tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="exc_separ" DatabaseField="exc_separ" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td style="vertical-align:top"><def:datafieldcontrol runat="server" id="exc_separ_txt" DatabaseField="exc_separ_txt" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="50px" FieldTextBoxWidth="400px" FieldTextBoxHeight="40px" FieldTextBoxTextMode="multiline" FieldTextBoxMaxLength="250"></def:datafieldcontrol></td>
<td></td></tr>

 <tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="exc_meds" DatabaseField="exc_meds" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td style="vertical-align:top"><def:datafieldcontrol runat="server" id="exc_meds_txt" DatabaseField="exc_meds_txt" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="50px" FieldTextBoxWidth="400px" FieldTextBoxHeight="40px" FieldTextBoxTextMode="multiline" FieldTextBoxMaxLength="250"></def:datafieldcontrol></td>
<td></td></tr>

 <tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="addtl_comments" DatabaseField="addtl_comments" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td style="vertical-align:top"><def:datafieldcontrol runat="server" id="addtl_comments_txt" DatabaseField="addtl_comments_txt" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="50px" FieldTextBoxWidth="400px" FieldTextBoxHeight="40px" FieldTextBoxTextMode="multiline" FieldTextBoxMaxLength="250"></def:datafieldcontrol></td>
<td></td></tr>
 </table>

 <table>
 <tr><td style="vertical-align:top" colspan="2"><br />
    <asp:Label ID="Label3" runat="server" Text="Child Concerns" Font-Bold="true" Font-Underline="true"></asp:Label>
</td></tr>

<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="chconc_devel" DatabaseField="chconc_devel" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td style="vertical-align:top"><def:datafieldcontrol runat="server" id="chconc_devel_txt" DatabaseField="chconc_devel_txt" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="50px" FieldTextBoxWidth="400px" FieldTextBoxHeight="40px" FieldTextBoxTextMode="multiline" FieldTextBoxMaxLength="250"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="chconc_dxasd" DatabaseField="chconc_dxasd" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td style="vertical-align:top">
<def:datafieldcontrol runat="server" id="chconc_dxasd_when" DatabaseField="chconc_dxasd_when" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="150px" FieldTextBoxWidth="400px" FieldTextBoxHeight="40px" FieldTextBoxTextMode="multiline" FieldTextBoxMaxLength="250"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="chconc_dxasd_bywhom" DatabaseField="chconc_dxasd_bywhom" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="150px" FieldTextBoxWidth="400px" FieldTextBoxHeight="40px" FieldTextBoxTextMode="multiline" FieldTextBoxMaxLength="250"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="chconc_dxasd_provider" DatabaseField="chconc_dxasd_provider" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="150px" FieldTextBoxWidth="400px" FieldTextBoxHeight="40px" FieldTextBoxTextMode="multiline" FieldTextBoxMaxLength="250"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="chconc_dxasd_tx" DatabaseField="chconc_dxasd_tx" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="150px" FieldTextBoxWidth="400px" FieldTextBoxHeight="40px" FieldTextBoxTextMode="multiline" FieldTextBoxMaxLength="250"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="chconc_dxasd_else" DatabaseField="chconc_dxasd_else" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="150px" FieldTextBoxWidth="400px" FieldTextBoxHeight="40px" FieldTextBoxTextMode="multiline" FieldTextBoxMaxLength="250"></def:datafieldcontrol>

</td>
<td></td></tr>
 

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
