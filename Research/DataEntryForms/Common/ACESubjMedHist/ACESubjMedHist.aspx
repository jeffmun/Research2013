<%@ Register TagPrefix="def" Namespace="DataEntryFramework3" %> 
<%@ Page language="c#" MasterPageFile="~/UWAC.master"  Title="ACESubjMed Data Entry" %>
<asp:Content ID="Content1" ContentPlaceHolderID="oBodyPlaceHolder" runat="server">

<def:dataentrycontroller id="DataEntryController1" runat="server" DatabaseTable="ALL_ACESubjMedHist" PrimaryKeyField="smedhx_pk">
</def:dataentrycontroller>
   <asp:ScriptManager ID="ScriptManager1" runat="server">    </asp:ScriptManager>
<asp:UpdatePanel ID="UpdatePanel1" runat="server">
  <ContentTemplate>
<table>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="id" DatabaseField="id" IsInsertField="true" FieldLabelWidth="300px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="15"></def:datafieldcontrol></td>
 
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="indexnum" DatabaseField="indexnum" IsInsertField="true" FieldTextBoxTextDefault="1" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
 
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="smedhx_date" DatabaseField="smedhx_date" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FormatString="{0:d}" ></def:datafieldcontrol></td>
 
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="smedhx_agemo" DatabaseField="smedhx_agemo" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
 
<td></td></tr>
 
<%--<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="smedhx_scrmsg" DatabaseField="smedhx_scrmsg" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="300px" FieldTextBoxWidth="400px" FieldTextBoxHeight="40px" FieldTextBoxTextMode="multiline" FieldTextBoxMaxLength="250"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="smedhx_cmnt" DatabaseField="smedhx_cmnt" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="300px" FieldTextBoxWidth="400px" FieldTextBoxHeight="40px" FieldTextBoxTextMode="multiline" FieldTextBoxMaxLength="250"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="smedhx_exmnr" DatabaseField="smedhx_exmnr" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="300px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="20"></def:datafieldcontrol></td>
<td></td></tr>
--%>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="smedhx_resp" DatabaseField="smedhx_resp" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="300px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="50"></def:datafieldcontrol></td>
 
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="data_derived" DatabaseField="data_derived" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
 
<td style="vertical-align:top"><def:ValueSetLabel ID="ValueSetLabel_data_derived" runat="server"  DatabaseField="data_derived"></def:ValueSetLabel></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="diag_aofc" DatabaseField="diag_aofc" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
 
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="devel_concern" DatabaseField="devel_concern" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
 
<td style="vertical-align:top"><def:ValueSetLabel ID="ValueSetLabel_devel_concern" runat="server"  DatabaseField="devel_concern"></def:ValueSetLabel></td></tr>

<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="devel_concern1" DatabaseField="devel_concern1" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
 <td></td></tr>
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="devel_concern2" DatabaseField="devel_concern2" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
 <td></td></tr>
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="devel_concern3" DatabaseField="devel_concern3" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
 <td></td></tr>
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="devel_concern4" DatabaseField="devel_concern4" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
 <td></td></tr>
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="devel_concern5" DatabaseField="devel_concern5" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
 <td></td></tr>

 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="aut_diag" DatabaseField="aut_diag" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
 
<td style="vertical-align:top"><def:ValueSetLabel ID="ValueSetLabel_aut_diag" runat="server"  DatabaseField="aut_diag"></def:ValueSetLabel></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="diag_ageatdiag" DatabaseField="diag_ageatdiag" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
 
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="diag_diagnosismadeby" DatabaseField="diag_diagnosismadeby" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="300px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="50"></def:datafieldcontrol></td>
 
<td style="vertical-align:top"><def:ValueSetLabel ID="ValueSetLabel_diag_diagnosismadeby" runat="server"  DatabaseField="diag_diagnosismadeby"></def:ValueSetLabel></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="preg_complic" DatabaseField="preg_complic" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
 
<td style="vertical-align:top"><def:ValueSetLabel ID="ValueSetLabel_preg_complic" runat="server"  DatabaseField="preg_complic"></def:ValueSetLabel></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="preg_dxdrug" DatabaseField="preg_dxdrug" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
 
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="full_term" DatabaseField="full_term" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
 
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="info_gest" DatabaseField="info_gest" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="300px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="50"></def:datafieldcontrol></td>
 
<td></td></tr>
 
<tr><td style="vertical-align:top">
            <table>
            <tr>
            <td><def:datafieldcontrol runat="server" id="birth_weight_lbs_int" DatabaseField="birth_weight_lbs_int" IsEntryField="true" IsDoubleEntryField="true"
                             FieldLabelWidth="160px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
            <td><def:datafieldcontrol runat="server" id="birth_weight_oz_int" DatabaseField="birth_weight_oz_int" IsEntryField="true" IsDoubleEntryField="true"
                             FieldLabelWidth="30px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
            </tr>
            </table>

                 
                 </td>
 
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="ldnb_lgthin" DatabaseField="ldnb_lgthin" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
 
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="ldnb_hosptotalbabyday" DatabaseField="ldnb_hosptotalbabyday" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
 
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="earlydev_walk" DatabaseField="earlydev_walk" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
 
<td style="vertical-align:top"><def:ValueSetLabel ID="ValueSetLabel_earlydev_walk" runat="server"  DatabaseField="earlydev_walk"></def:ValueSetLabel></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="ad016" DatabaseField="ad016" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
 
<td style="vertical-align:top"><def:ValueSetLabel ID="ValueSetLabel_ad016" runat="server"  DatabaseField="ad016"></def:ValueSetLabel></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="age_3word" DatabaseField="age_3word" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
 
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="current_lang" DatabaseField="current_lang" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
 
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="verb_words" DatabaseField="verb_words" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
 
<td style="vertical-align:top"><def:ValueSetLabel ID="ValueSetLabel_verb_words" runat="server"  DatabaseField="verb_words"></def:ValueSetLabel><br /></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="othmem_devdelay" DatabaseField="othmem_devdelay" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
 
<td style="vertical-align:top"><def:ValueSetLabel ID="ValueSetLabel_othmem_devdelay" runat="server"  DatabaseField="othmem_devdelay"></def:ValueSetLabel> <br /></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="school_perf" DatabaseField="school_perf" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
 
<td style="vertical-align:top"><def:ValueSetLabel ID="ValueSetLabel_school_perf" runat="server"  DatabaseField="school_perf"></def:ValueSetLabel></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="rx_behav" DatabaseField="rx_behav" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
 
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="rx_phys" DatabaseField="rx_phys" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
 
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="otc_med" DatabaseField="otc_med" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
 
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="ds_med" DatabaseField="ds_med" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
 
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="gastro_spec_diet" DatabaseField="gastro_spec_diet" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
 
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="rev_headmeningitis" DatabaseField="rev_headmeningitis" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
 
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="rev_headmeningitisage" DatabaseField="rev_headmeningitisage" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
 
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="rev_headmeningitisorg" DatabaseField="rev_headmeningitisorg" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="300px" FieldTextBoxWidth="400px" FieldTextBoxHeight="40px" FieldTextBoxTextMode="multiline" FieldTextBoxMaxLength="255"></def:datafieldcontrol></td>
 
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="rev_headencephalitis" DatabaseField="rev_headencephalitis" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
 
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="rev_headencephalitisage" DatabaseField="rev_headencephalitisage" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
 
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="rev_headencephalitisorg" DatabaseField="rev_headencephalitisorg" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="300px" FieldTextBoxWidth="400px" FieldTextBoxHeight="40px" FieldTextBoxTextMode="multiline" FieldTextBoxMaxLength="255"></def:datafieldcontrol></td>
 
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="rev_headfebseiz" DatabaseField="rev_headfebseiz" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
 
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="rev_headfebseizages" DatabaseField="rev_headfebseizages" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="300px" FieldTextBoxWidth="400px" FieldTextBoxHeight="40px" FieldTextBoxTextMode="multiline" FieldTextBoxMaxLength="255"></def:datafieldcontrol></td>
 
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="rev_headseizure" DatabaseField="rev_headseizure" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
 
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="rev_headseizureonset" DatabaseField="rev_headseizureonset" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="300px" FieldTextBoxWidth="400px" FieldTextBoxHeight="40px" FieldTextBoxTextMode="multiline" FieldTextBoxMaxLength="255"></def:datafieldcontrol></td>
 
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="rev_headseizurecontrol" DatabaseField="rev_headseizurecontrol" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
 
<td><def:ValueSetLabel ID="ValueSetLabel_rev_headseizurecontrol" runat="server"  DatabaseField="rev_headseizurecontrol"></def:ValueSetLabel></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="fhxcp" DatabaseField="fhxcp" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
 
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="hist_trauma" DatabaseField="hist_trauma" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
 
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="rev_headimagestudy" DatabaseField="rev_headimagestudy" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
 
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="rev_headimagestudytype" DatabaseField="rev_headimagestudytype" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
 
<td style="vertical-align:top"><def:ValueSetLabel ID="ValueSetLabel_rev_headimagestudytype" runat="server"  DatabaseField="rev_headimagestudytype"></def:ValueSetLabel></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="rev_headimagestudyresult" DatabaseField="rev_headimagestudyresult" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="300px" FieldTextBoxWidth="400px" FieldTextBoxHeight="40px" FieldTextBoxTextMode="multiline" FieldTextBoxMaxLength="255"></def:datafieldcontrol></td>
 
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="vis_blind" DatabaseField="vis_blind" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
 
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="rev_eartest" DatabaseField="rev_eartest" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
 
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="rev_eartestages" DatabaseField="rev_eartestages" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="300px" FieldTextBoxWidth="400px" FieldTextBoxHeight="40px" FieldTextBoxTextMode="multiline" FieldTextBoxMaxLength="255"></def:datafieldcontrol></td>
 
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="rev_eartestresult" DatabaseField="rev_eartestresult" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
 
<td style="vertical-align:top"><def:ValueSetLabel ID="ValueSetLabel_rev_eartestresult" runat="server"  DatabaseField="rev_eartestresult"></def:ValueSetLabel></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="hear_loss" DatabaseField="hear_loss" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
 
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="othmem_hearingcor" DatabaseField="othmem_hearingcor" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
 
<td style="vertical-align:top"><def:ValueSetLabel ID="ValueSetLabel_othmem_hearingcor" runat="server"  DatabaseField="othmem_hearingcor"></def:ValueSetLabel></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="rev_earrecuotitis" DatabaseField="rev_earrecuotitis" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
 
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="rev_earrecuotitisyear" DatabaseField="rev_earrecuotitisyear" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
 
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="rev_earrecuotitisage" DatabaseField="rev_earrecuotitisage" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
 
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="rev_earpetube" DatabaseField="rev_earpetube" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
 
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="rev_mouthcleftlip" DatabaseField="rev_mouthcleftlip" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
 
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="rev_mouthcleftpalate" DatabaseField="rev_mouthcleftpalate" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
 
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="rev_teethdentalab" DatabaseField="rev_teethdentalab" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
 
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="rev_neckspinalab" DatabaseField="rev_neckspinalab" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
 
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="rev_skinbirthmark" DatabaseField="rev_skinbirthmark" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
 
<td></td></tr>
 

<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="rev_skineczema" DatabaseField="rev_skineczema" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
 
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="rev_skinabcesses" DatabaseField="rev_skinabcesses" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
 
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="rev_pulbreathab" DatabaseField="rev_pulbreathab" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
 
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="rev_pulasthma" DatabaseField="rev_pulasthma" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
 
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="rev_lung" DatabaseField="rev_lung" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
 
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="rev_cardiomalfunc" DatabaseField="rev_cardiomalfunc" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
 
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="rev_cardiocyanosis" DatabaseField="rev_cardiocyanosis" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
 
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="rev_rythm" DatabaseField="rev_rythm" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
 
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="rev_gastrodysphagia" DatabaseField="rev_gastrodysphagia" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
 
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="rev_gastroreflux" DatabaseField="rev_gastroreflux" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
 
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="rev_gastrorefluxmed" DatabaseField="rev_gastrorefluxmed" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
 
<td><def:ValueSetLabel ID="ValueSetLabel_rev_gastrorefluxmed" runat="server"  DatabaseField="rev_gastrorefluxmed"></def:ValueSetLabel></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="rev_gastroother" DatabaseField="rev_gastroother" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
 
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="rev_endoprecocious" DatabaseField="rev_endoprecocious" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
 
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="rev_endoprecociousage" DatabaseField="rev_endoprecociousage" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
 
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="rev_endohypothyroidism" DatabaseField="rev_endohypothyroidism" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
 
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="rev_endohyperthyroidism" DatabaseField="rev_endohyperthyroidism" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
 
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="rev_endodiabetes" DatabaseField="rev_endodiabetes" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
 
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="rev_endodiabetestype" DatabaseField="rev_endodiabetestype" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
 
<td style="vertical-align:top"><def:ValueSetLabel ID="ValueSetLabel_rev_endodiabetestype" runat="server"  DatabaseField="rev_endodiabetestype"></def:ValueSetLabel></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="rev_endohypoglycemia" DatabaseField="rev_endohypoglycemia" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
 
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="rev_hemanemia" DatabaseField="rev_hemanemia" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
 
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="rev_hembleeddisorder" DatabaseField="rev_hembleeddisorder" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
 
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="rev_immunorecurinfection" DatabaseField="rev_immunorecurinfection" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
 
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="rev_immunoigdeficiency" DatabaseField="rev_immunoigdeficiency" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
 
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="rev_immunocellimmunedef" DatabaseField="rev_immunocellimmunedef" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
 
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="rev_immunoenvallergy" DatabaseField="rev_immunoenvallergy" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
 
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="rev_immunomedallergy" DatabaseField="rev_immunomedallergy" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
 
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="rev_immunoimmunization" DatabaseField="rev_immunoimmunization" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
 
<td style="vertical-align:top"><def:ValueSetLabel ID="ValueSetLabel_rev_immunoimmunization" runat="server"  DatabaseField="rev_immunoimmunization"></def:ValueSetLabel></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="gen_dis" DatabaseField="gen_dis" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
 
<td style="vertical-align:top"><def:ValueSetLabel ID="ValueSetLabel_gen_dis" runat="server"  DatabaseField="gen_dis"></def:ValueSetLabel></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="gen_dis_conf" DatabaseField="gen_dis_conf" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
 
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="othmem_bipolar" DatabaseField="othmem_bipolar" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
 
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="othmem_depression" DatabaseField="othmem_depression" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
 
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="othmem_anxiety" DatabaseField="othmem_anxiety" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
 
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="cfmh_othr_ocd" DatabaseField="cfmh_othr_ocd" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
 
<td style="vertical-align:top"><def:ValueSetLabel ID="ValueSetLabel_cfmh_othr_ocd" runat="server"  DatabaseField="cfmh_othr_ocd"></def:ValueSetLabel></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="othmem_schizophrenia" DatabaseField="othmem_schizophrenia" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
 
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="othmem_selfinj" DatabaseField="othmem_selfinj" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
 
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="othmem_adhd" DatabaseField="othmem_adhd" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
 
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="othmem_eatingdis" DatabaseField="othmem_eatingdis" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
 
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="othmem_eatingdis_type" DatabaseField="othmem_eatingdis_type" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="300px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="100"></def:datafieldcontrol></td>
 
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="sleep_pat" DatabaseField="sleep_pat" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
 
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="touret" DatabaseField="touret" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
 
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
