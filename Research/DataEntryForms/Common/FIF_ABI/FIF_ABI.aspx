


<%@ Register TagPrefix="def" Namespace="DataEntryFramework3" %> 
<%@ Page language="c#" MasterPageFile="~/UWAC.master"  Title="FIF_ABI Data Entry" %>
<asp:Content ID="Content1" ContentPlaceHolderID="oBodyPlaceHolder" runat="server">

<def:dataentrycontroller id="DataEntryController1" runat="server" DatabaseTable="ALL_FIF_ABI" PrimaryKeyField="FIF_ABI_pk">
</def:dataentrycontroller>

<def:datafieldcontrol runat="server" id="id" DatabaseField="id" IsInsertField="true" FieldLabelWidth="100px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="15"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="indexnum" DatabaseField="indexnum" IsInsertField="true" FieldTextBoxTextDefault="1" FieldLabelWidth="100px" FieldTextBoxWidth="40px"></def:datafieldcontrol>



<asp:panel id="mainPanel" CssClass="mainPanel" runat="server">
<div class="main">

<def:datafieldcontrol runat="server" id="ABI_date" DatabaseField="ABI_date" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="100px"></def:datafieldcontrol>
 

<br/>
<table border="1px">
<tr>
<td><def:datafieldcontrol runat="server" id="ABI_PrimLang" DatabaseField="ABI_PrimLang" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="200px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td><font color="blue"><def:ValueSetLabel ID="ValueSetLabel_ABI_PrimLang" runat="server"  DatabaseField="ABI_PrimLang"></def:ValueSetLabel></td>
<td><def:datafieldcontrol runat="server" id="ABI_PrimLang_desc" DatabaseField="ABI_PrimLang_desc" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="150px" FieldTextBoxWidth="150px" FieldTextBoxMaxLength="50"></def:datafieldcontrol></td>
</tr>

<tr>
</tr>

<tr>
<td><def:datafieldcontrol runat="server" id="ABI_educ" DatabaseField="ABI_educ" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="200px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td><font color="blue"><def:ValueSetLabel ID="ValueSetLabel_ABI_educ" runat="server"  DatabaseField="ABI_educ"></def:ValueSetLabel></td>
</tr>
<tr> 
<td><def:datafieldcontrol runat="server" id="ABI_occ" DatabaseField="ABI_occ" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="100px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="50"></def:datafieldcontrol></td>
</tr>
</table>

</div>



<div class="main">

<br/>
<br/>
 
 

<table>
<tr>
<td><b>MRI Exclusion Info</b></td>
</tr>
<tr>
<td align="right"><b><u><font color="blue"><def:ValueSetLabel ID="ValueSetLabel_ABI_MRIexcl_ortho" runat="server"  DatabaseField="ABI_MRIexcl_ortho"></def:ValueSetLabel></font></b></u></td>
<td width = "30px"></td>
<td align="left" valign="bottom" width = "200px"><b><u>If Yes, describe</b></u><td>
</tr>
<tr>
<td><def:datafieldcontrol runat="server" id="ABI_MRIexcl_ortho" DatabaseField="ABI_MRIexcl_ortho" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td width = "30px"></td>
<td><def:datafieldcontrol runat="server" id="ABI_MRIexcl_ortho_desc" DatabaseField="ABI_MRIexcl_ortho_desc" IsEntryField="true" IsDoubleEntryField="false" ShowFieldLabel="False" FieldTextBoxWidth="200px"></def:datafieldcontrol></td>
</tr>
<tr>
<td><def:datafieldcontrol runat="server" id="ABI_MRIexcl_metal" DatabaseField="ABI_MRIexcl_metal" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td width = "30px"></td>
<td><def:datafieldcontrol runat="server" id="ABI_MRIexcl_metal_desc" DatabaseField="ABI_MRIexcl_metal_desc" IsEntryField="true" IsDoubleEntryField="false" ShowFieldLabel="False" FieldTextBoxWidth="200px"></def:datafieldcontrol></td>
</tr>
<tr>
<td><def:datafieldcontrol runat="server" id="ABI_MRIexcl_claus" DatabaseField="ABI_MRIexcl_claus" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td width = "30px"></td>
<td><def:datafieldcontrol runat="server" id="ABI_MRIexcl_claus_desc" DatabaseField="ABI_MRIexcl_claus_desc" IsEntryField="true" IsDoubleEntryField="false" ShowFieldLabel="False" FieldTextBoxWidth="200px"></def:datafieldcontrol></td>
</tr>
<tr>
<td><def:datafieldcontrol runat="server" id="ABI_MRIexcl_preg" DatabaseField="ABI_MRIexcl_preg" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td width = "30px"></td>
<td><def:datafieldcontrol runat="server" id="ABI_MRIexcl_preg_desc" DatabaseField="ABI_MRIexcl_preg_desc" IsEntryField="true" IsDoubleEntryField="false" ShowFieldLabel="False" FieldTextBoxWidth="200px"></def:datafieldcontrol></td>
</tr>
</table>

<br/>
<table>
<tr>
<td><b>Medical Symptom</b></td>
</tr>
<tr>
<td align="right"><b><u><font color="blue"><def:ValueSetLabel ID="ValueSetLabel_ABI_MRIexcl_ortho2" runat="server"  DatabaseField="ABI_MRIexcl_ortho"></def:ValueSetLabel></font></b></u></td>
<td width = "30px"></td>
<td width = "30px"></td>
<td width = "30px"></td>
</tr>
<tr>
<td align="right"><b><u>Subject</b></u></td>
<td align="center"><b><u>Family</b></u></td>
<td align="left" valign="bottom" width = "200px"><b><u>If Yes, describe</b></u><td>
</tr>
<tr>
<td><def:datafieldcontrol runat="server" id="ABI_SubjSx_ASD" DatabaseField="ABI_SubjSx_ASD" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td><def:datafieldcontrol runat="server" id="ABI_FamSx_ASD" DatabaseField="ABI_FamSx_ASD" IsEntryField="true" IsDoubleEntryField="true" ShowFieldLabel="False" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td><def:datafieldcontrol runat="server" id="ABI_FamSx_ASD_desc" DatabaseField="ABI_FamSx_ASD_desc" IsEntryField="true" IsDoubleEntryField="false" ShowFieldLabel="False" FieldTextBoxWidth="400px" FieldTextBoxHeight="40px" FieldTextBoxTextMode="multiline" FieldTextBoxMaxLength="250"></def:datafieldcontrol></td>
</tr>
<tr>
<td><def:datafieldcontrol runat="server" id="ABI_SubjSx_mentill" DatabaseField="ABI_SubjSx_mentill" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td><def:datafieldcontrol runat="server" id="ABI_FamSx_mentill" DatabaseField="ABI_FamSx_mentill" IsEntryField="true" IsDoubleEntryField="true" ShowFieldLabel="False" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td><def:datafieldcontrol runat="server" id="ABI_FamSx_mentill_desc" DatabaseField="ABI_FamSx_mentill_desc" IsEntryField="true" IsDoubleEntryField="false" ShowFieldLabel="False" FieldTextBoxWidth="400px" FieldTextBoxHeight="40px" FieldTextBoxTextMode="multiline" FieldTextBoxMaxLength="250"></def:datafieldcontrol></td>
</tr>
<tr>
<td><def:datafieldcontrol runat="server" id="ABI_SubjSx_meds" DatabaseField="ABI_SubjSx_meds" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td><def:datafieldcontrol runat="server" id="ABI_FamSx_meds" DatabaseField="ABI_FamSx_meds" IsEntryField="true" IsDoubleEntryField="true" ShowFieldLabel="False" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td><def:datafieldcontrol runat="server" id="ABI_FamSx_meds_desc" DatabaseField="ABI_FamSx_meds_desc" IsEntryField="true" IsDoubleEntryField="false" ShowFieldLabel="False" FieldTextBoxWidth="400px" FieldTextBoxHeight="40px" FieldTextBoxTextMode="multiline" FieldTextBoxMaxLength="250"></def:datafieldcontrol></td>
</tr>
<tr>
<td><def:datafieldcontrol runat="server" id="ABI_SubjSx_seiz" DatabaseField="ABI_SubjSx_seiz" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td><def:datafieldcontrol runat="server" id="ABI_FamSx_seiz" DatabaseField="ABI_FamSx_seiz" IsEntryField="true" IsDoubleEntryField="true" ShowFieldLabel="False" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td><def:datafieldcontrol runat="server" id="ABI_FamSx_seiz_desc" DatabaseField="ABI_FamSx_seiz_desc" IsEntryField="true" IsDoubleEntryField="false" ShowFieldLabel="False" FieldTextBoxWidth="400px" FieldTextBoxHeight="40px" FieldTextBoxTextMode="multiline" FieldTextBoxMaxLength="250"></def:datafieldcontrol></td>
</tr>
<tr>
<td><def:datafieldcontrol runat="server" id="ABI_SubjSx_tubscler" DatabaseField="ABI_SubjSx_tubscler" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td><def:datafieldcontrol runat="server" id="ABI_FamSx_tubscler" DatabaseField="ABI_FamSx_tubscler" IsEntryField="true" IsDoubleEntryField="true" ShowFieldLabel="False" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td><def:datafieldcontrol runat="server" id="ABI_FamSx_tubscler_desc" DatabaseField="ABI_FamSx_tubscler_desc" IsEntryField="true" IsDoubleEntryField="false" ShowFieldLabel="False" FieldTextBoxWidth="400px" FieldTextBoxHeight="40px" FieldTextBoxTextMode="multiline" FieldTextBoxMaxLength="250"></def:datafieldcontrol></td>
</tr>
<tr>
<td><def:datafieldcontrol runat="server" id="ABI_SubjSx_pku" DatabaseField="ABI_SubjSx_pku" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td><def:datafieldcontrol runat="server" id="ABI_FamSx_pku" DatabaseField="ABI_FamSx_pku" IsEntryField="true" IsDoubleEntryField="true" ShowFieldLabel="False" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td><def:datafieldcontrol runat="server" id="ABI_FamSx_pku_desc" DatabaseField="ABI_FamSx_pku_desc" IsEntryField="true" IsDoubleEntryField="false" ShowFieldLabel="False" FieldTextBoxWidth="400px" FieldTextBoxHeight="40px" FieldTextBoxTextMode="multiline" FieldTextBoxMaxLength="250"></def:datafieldcontrol></td>
</tr>
<tr>
<td><def:datafieldcontrol runat="server" id="ABI_SubjSx_chrom" DatabaseField="ABI_SubjSx_chrom" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td><def:datafieldcontrol runat="server" id="ABI_FamSx_chrom" DatabaseField="ABI_FamSx_chrom" IsEntryField="true" IsDoubleEntryField="true" ShowFieldLabel="False" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td><def:datafieldcontrol runat="server" id="ABI_FamSx_chrom_desc" DatabaseField="ABI_FamSx_chrom_desc" IsEntryField="true" IsDoubleEntryField="false" ShowFieldLabel="False" FieldTextBoxWidth="400px" FieldTextBoxHeight="40px" FieldTextBoxTextMode="multiline" FieldTextBoxMaxLength="250"></def:datafieldcontrol></td>
</tr>
<tr>
<td><def:datafieldcontrol runat="server" id="ABI_SubjSx_fragx" DatabaseField="ABI_SubjSx_fragx" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td><def:datafieldcontrol runat="server" id="ABI_FamSx_fragx" DatabaseField="ABI_FamSx_fragx" IsEntryField="true" IsDoubleEntryField="true" ShowFieldLabel="False" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td><def:datafieldcontrol runat="server" id="ABI_FamSx_fragx_desc" DatabaseField="ABI_FamSx_fragx_desc" IsEntryField="true" IsDoubleEntryField="false" ShowFieldLabel="False" FieldTextBoxWidth="400px" FieldTextBoxHeight="40px" FieldTextBoxTextMode="multiline" FieldTextBoxMaxLength="250"></def:datafieldcontrol></td>
</tr>

<tr>
<td><b>Education</b></td>
</tr>

<tr>
<td align="right"><b><u>Subject</b></u></td>
<td align="center"><b><u>Family</b></u></td>
<td align="left" valign="bottom" width = "200px"><b><u>If Yes, describe</b></u><td>
</tr>


<tr>
<td><def:datafieldcontrol runat="server" id="ABI_SubjEd_speduc" DatabaseField="ABI_SubjEd_speduc" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
</td><td><def:datafieldcontrol runat="server" id="ABI_FamEd_speduc" DatabaseField="ABI_FamEd_speduc" IsEntryField="true" IsDoubleEntryField="true" ShowFieldLabel="False" FieldTextBoxWidth="40px"></def:datafieldcontrol>
</td><td><def:datafieldcontrol runat="server" id="ABI_FamEd_speduc_desc" DatabaseField="ABI_FamEd_speduc_desc" IsEntryField="true" IsDoubleEntryField="false" ShowFieldLabel="False" FieldTextBoxWidth="400px" FieldTextBoxHeight="40px" FieldTextBoxTextMode="multiline" FieldTextBoxMaxLength="250"></def:datafieldcontrol></td>
</tr>
<tr>
<td><def:datafieldcontrol runat="server" id="ABI_SubjEd_spchlang" DatabaseField="ABI_SubjEd_spchlang" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td><def:datafieldcontrol runat="server" id="ABI_FamEd_spchlang" DatabaseField="ABI_FamEd_spchlang" IsEntryField="true" IsDoubleEntryField="true" ShowFieldLabel="False" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td><def:datafieldcontrol runat="server" id="ABI_FamEd_spchlang_desc" DatabaseField="ABI_FamEd_spchlang_desc" IsEntryField="true" IsDoubleEntryField="false" ShowFieldLabel="False" FieldTextBoxWidth="400px" FieldTextBoxHeight="40px" FieldTextBoxTextMode="multiline" FieldTextBoxMaxLength="250"></def:datafieldcontrol></td>
</tr>
<tr>
<td><def:datafieldcontrol runat="server" id="ABI_SubjEd_vision" DatabaseField="ABI_SubjEd_vision" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td><def:datafieldcontrol runat="server" id="ABI_FamEd_vision" DatabaseField="ABI_FamEd_vision" IsEntryField="true" IsDoubleEntryField="true" ShowFieldLabel="False" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td><def:datafieldcontrol runat="server" id="ABI_FamEd_vision_desc" DatabaseField="ABI_FamEd_vision_desc" IsEntryField="true" IsDoubleEntryField="false" ShowFieldLabel="False" FieldTextBoxWidth="400px" FieldTextBoxHeight="40px" FieldTextBoxTextMode="multiline" FieldTextBoxMaxLength="250"></def:datafieldcontrol></td>
</tr>
<tr>
<td><def:datafieldcontrol runat="server" id="ABI_SubjEd_hearing" DatabaseField="ABI_SubjEd_hearing" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td><def:datafieldcontrol runat="server" id="ABI_FamEd_hearing" DatabaseField="ABI_FamEd_hearing" IsEntryField="true" IsDoubleEntryField="true" ShowFieldLabel="False" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td><def:datafieldcontrol runat="server" id="ABI_FamEd_hearing_desc" DatabaseField="ABI_FamEd_hearing_desc" IsEntryField="true" IsDoubleEntryField="false" ShowFieldLabel="False" FieldTextBoxWidth="400px" FieldTextBoxHeight="40px" FieldTextBoxTextMode="multiline" FieldTextBoxMaxLength="250"></def:datafieldcontrol></td>
</tr>
<tr>
<td><def:datafieldcontrol runat="server" id="ABI_Subj_other" DatabaseField="ABI_Subj_other" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td><def:datafieldcontrol runat="server" id="ABI_Fam_other" DatabaseField="ABI_Fam_other" IsEntryField="true" IsDoubleEntryField="true" ShowFieldLabel="False" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td><def:datafieldcontrol runat="server" id="ABI_Fam_other_desc" DatabaseField="ABI_Fam_other_desc" IsEntryField="true" IsDoubleEntryField="false" ShowFieldLabel="False" FieldTextBoxWidth="400px" FieldTextBoxHeight="40px" FieldTextBoxTextMode="multiline" FieldTextBoxMaxLength="250"></def:datafieldcontrol></td>
</tr>
</table>

<br/>
<br/>
<br/>
<def:datafieldcontrol runat="server" id="created" DatabaseField="created" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="100px" FieldTextBoxWidth="250px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="createdBy" DatabaseField="createdBy" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="100px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="50"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="updated" DatabaseField="updated" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="100px" FieldTextBoxWidth="250px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="updatedBy" DatabaseField="updatedBy" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="100px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="50"></def:datafieldcontrol>


</div>

</asp:panel>
</asp:Content>
