 <%@ Register TagPrefix="def" Namespace="DataEntryFramework3" %> 
 <%@ Page Language="C#" Debug="true" AutoEventWireup="true"  MasterPageFile="~/UWAC.master" 
 Title="ACEFamMedHist Data Entry" CodeFile="ACEFamMedHist.aspx.cs" Inherits="AutismCenterResearch_DataEntryForms_Common_ACEFamMedHist_ACEFamMedHist"%>
  <%@ MasterType VirtualPath="~/UWAC.master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="oBodyPlaceHolder" runat="server">

<def:dataentrycontroller id="DataEntryController1" runat="server" DatabaseTable="ALL_ACEFamMedHist" PrimaryKeyField="fmhx__pk">
</def:dataentrycontroller>
   <asp:ScriptManager ID="ScriptManager1" runat="server">    </asp:ScriptManager>

      
<asp:UpdatePanel ID="UpdatePanel1" runat="server">
  <ContentTemplate>


<table>
 
<tr><td style="vertical-align:top" style="height:30px"><def:datafieldcontrol runat="server" id="id" DatabaseField="id" IsInsertField="true" FieldLabelWidth="200px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="15"></def:datafieldcontrol></td>
 
<td></td></tr>
 
<tr><td style="vertical-align:top" style="height:30px"><def:datafieldcontrol runat="server" id="indexnum" DatabaseField="indexnum" IsInsertField="true" FieldTextBoxTextDefault="1" FieldLabelWidth="200px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
 
<td></td></tr>
 
<tr><td style="vertical-align:top" style="height:30px"><def:datafieldcontrol runat="server" id="fmhx__date" DatabaseField="fmhx__date" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="200px" FormatString="{0:d}" ></def:datafieldcontrol></td>
 
<td></td></tr>
 
<tr><td style="vertical-align:top" style="height:30px"><def:datafieldcontrol runat="server" id="fmhx__agemo" DatabaseField="fmhx__agemo" IsReadOnly="true" RenderReadOnlyAsDiv="true"  FieldLabelWidth="200px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
 
<td></td></tr>
 
 
<tr><td style="vertical-align:top" style="height:30px"><def:datafieldcontrol runat="server" id="fmhx__cmnt" DatabaseField="fmhx__cmnt" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="200px" FieldTextBoxWidth="400px" FieldTextBoxHeight="40px" FieldTextBoxTextMode="multiline" FieldTextBoxMaxLength="250"></def:datafieldcontrol></td>
 
<td></td></tr>
 
<%--<tr><td style="vertical-align:top" style="height:30px"><def:datafieldcontrol runat="server" id="fmhx__exmnr" DatabaseField="fmhx__exmnr" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="200px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="20"></def:datafieldcontrol></td>
 
<td></td></tr>
 
<tr><td style="vertical-align:top" style="height:30px"><def:datafieldcontrol runat="server" id="fmhx__resp" DatabaseField="fmhx__resp" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="200px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="50"></def:datafieldcontrol></td>
 
<td></td></tr>--%> 

<tr><td style="vertical-align:top" style="height:30px"><def:datafieldcontrol runat="server" id="relationship" DatabaseField="relationship" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="200px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
 
<td style="vertical-align:top"><def:ValueSetLabel ID="ValueSetLabel_relationship" runat="server"  DatabaseField="relationship"></def:ValueSetLabel></td></tr>
 
<%--<tr><td style="vertical-align:top" style="height:30px"><def:datafieldcontrol runat="server" id="family_user_def_id" DatabaseField="family_user_def_id" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="200px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="20"></def:datafieldcontrol></td>
 
<td></td></tr>--%>

</table>


<%--<table>
<tr><td style="vertical-align:top" style="height:30px"><def:datafieldcontrol runat="server" id="subjectkey_mother" DatabaseField="subjectkey_mother" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="200px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="12"></def:datafieldcontrol></td>  <td></td></tr>
<tr><td style="vertical-align:top" style="height:30px"><def:datafieldcontrol runat="server" id="subjectkey_father" DatabaseField="subjectkey_father" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="200px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="12"></def:datafieldcontrol></td>  <td></td></tr>
</table>--%>

<br />
<asp:Label ID="lbl01" runat="server" Text="Enter No=0, Yes=1" Font-Bold="true" Font-Size="Medium"></asp:Label>
<br />

<table >
<tr>
<%--Mother--%><td style="vertical-align:top">
<table border="1px">
<tr><td align="right" style="height:30px"><b>Mother</b></td></tr>
<tr><td style="vertical-align:top" style="height:30px"><def:datafieldcontrol runat="server" id="src_mother_id" DatabaseField="src_mother_id" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="150px" FieldTextBoxWidth="100px" FieldTextBoxMaxLength="100"></def:datafieldcontrol></td>  <td></td></tr>
<tr><td style="vertical-align:top" style="height:35px; background:Gray"></td>  <td></td></tr>

<tr><td style="vertical-align:top" style="height:30px"><def:datafieldcontrol runat="server" id="ques_agebm" DatabaseField="ques_agebm" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="200px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>  <td></td></tr>
<tr><td style="vertical-align:top" style="height:30px">    <asp:Label ID="Label1" runat="server" Text="Mother's sex = F"></asp:Label></td></tr>
<tr><td style="vertical-align:top" style="height:30px"><def:datafieldcontrol runat="server" id="ques_gradalbm" DatabaseField="ques_gradalbm" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="200px" FieldTextBoxWidth="40px" ></def:datafieldcontrol></td>  <td></td></tr>
<tr><td style="vertical-align:top" style="height:30px; background:Silver">NEURODEV DISORDERS</td>  <td></td></tr>
<tr><td style="vertical-align:top" style="height:30px"><def:datafieldcontrol runat="server" id="asd_moth" DatabaseField="asd_moth" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="200px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>  <td></td></tr>
<tr><td style="vertical-align:top" style="height:30px"><def:datafieldcontrol runat="server" id="ad_moth" DatabaseField="ad_moth" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="200px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>  <td></td></tr>
<tr><td style="vertical-align:top" style="height:30px"><def:datafieldcontrol runat="server" id="asp_moth" DatabaseField="asp_moth" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="200px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>  <td></td></tr>
<tr><td style="vertical-align:top" style="height:30px"><def:datafieldcontrol runat="server" id="rts_moth" DatabaseField="rts_moth" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="200px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>  <td></td></tr>
<tr><td style="vertical-align:top" style="height:30px"><def:datafieldcontrol runat="server" id="pddn_moth" DatabaseField="pddn_moth" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="200px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>  <td></td></tr>
<tr><td style="vertical-align:top" style="height:30px"><def:datafieldcontrol runat="server" id="mother_speechdelay" DatabaseField="mother_speechdelay" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="200px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>  <td></td></tr>
<tr><td style="vertical-align:top" style="height:30px"><def:datafieldcontrol runat="server" id="mother_devdelay" DatabaseField="mother_devdelay" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="200px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>  <td></td></tr>
<tr><td style="vertical-align:top" style="height:30px"><def:datafieldcontrol runat="server" id="mother_learndis" DatabaseField="mother_learndis" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="200px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>  <td></td></tr>
<tr><td style="vertical-align:top" style="height:30px"><def:datafieldcontrol runat="server" id="seiz_moth" DatabaseField="seiz_moth" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="200px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>  <td></td></tr>
<tr><td style="vertical-align:top" style="height:30px"><def:datafieldcontrol runat="server" id="cerpal_moth" DatabaseField="cerpal_moth" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="200px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>  <td></td></tr>
<tr><td style="vertical-align:top" style="height:30px"><def:datafieldcontrol runat="server" id="downs_moth" DatabaseField="downs_moth" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="200px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>  <td></td></tr>
<tr><td style="vertical-align:top" style="height:30px"><def:datafieldcontrol runat="server" id="idmr_moth" DatabaseField="idmr_moth" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="200px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>  <td></td></tr>
<tr><td style="vertical-align:top" style="height:30px"><def:datafieldcontrol runat="server" id="mother_tuberscl" DatabaseField="mother_tuberscl" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="200px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>  <td></td></tr>
<tr><td style="vertical-align:top" style="height:30px"><def:datafieldcontrol runat="server" id="mother_fragilex" DatabaseField="mother_fragilex" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="200px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>  <td></td></tr>
<tr><td style="vertical-align:top" style="height:30px"><def:datafieldcontrol runat="server" id="nfi_moth" DatabaseField="nfi_moth" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="200px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>  <td></td></tr>
<tr><td style="vertical-align:top" style="height:30px; background:Silver">SENSORY</td>  <td></td></tr>
<tr><td style="vertical-align:top" style="height:30px"><def:datafieldcontrol runat="server" id="cblind_moth" DatabaseField="cblind_moth" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="200px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>  <td></td></tr>
<tr><td style="vertical-align:top" style="height:30px"><def:datafieldcontrol runat="server" id="heard_moth" DatabaseField="heard_moth" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="200px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>  <td></td></tr>
<tr><td style="vertical-align:top" style="height:30px"><def:datafieldcontrol runat="server" id="hearcor_moth" DatabaseField="hearcor_moth" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="200px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>  <td></td></tr>
<tr><td style="vertical-align:top" style="height:30px; background:Silver">MENTAL HEALTH</td>  <td></td></tr>

<tr><td style="vertical-align:top" style="height:30px"><def:datafieldcontrol runat="server" id="mother_bipolar" DatabaseField="mother_bipolar" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="200px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>  <td></td></tr>
<tr><td style="vertical-align:top" style="height:30px"><def:datafieldcontrol runat="server" id="mother_depression" DatabaseField="mother_depression" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="200px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>  <td></td></tr>
<tr><td style="vertical-align:top" style="height:30px"><def:datafieldcontrol runat="server" id="mother_anxiety" DatabaseField="mother_anxiety" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="200px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>  <td></td></tr>
<tr><td style="vertical-align:top" style="height:30px"><def:datafieldcontrol runat="server" id="mother_ocd" DatabaseField="mother_ocd" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="200px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>  <td></td></tr>
<tr><td style="vertical-align:top" style="height:30px"><def:datafieldcontrol runat="server" id="mother_schizophrenia" DatabaseField="mother_schizophrenia" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="200px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>  <td></td></tr>
<tr><td style="vertical-align:top" style="height:30px"><def:datafieldcontrol runat="server" id="mother_selfinj" DatabaseField="mother_selfinj" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="200px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>  <td></td></tr>
<tr><td style="vertical-align:top" style="height:30px"><def:datafieldcontrol runat="server" id="mother_adhd" DatabaseField="mother_adhd" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="200px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>  <td></td></tr>
<tr><td style="vertical-align:top" style="height:30px"><def:datafieldcontrol runat="server" id="mother_eatingdis" DatabaseField="mother_eatingdis" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="200px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>  <td></td></tr>
<tr><td style="vertical-align:top" style="height:30px"><def:datafieldcontrol runat="server" id="dsp_moth" DatabaseField="dsp_moth" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="200px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>  <td></td></tr>
<tr><td style="vertical-align:top" style="height:30px"><def:datafieldcontrol runat="server" id="tours_moth" DatabaseField="tours_moth" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="200px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>  <td></td></tr>
</table>
</td>


<%--Father--%><td style="vertical-align:top">
<table border="1px">
<tr><td align="right"  style="height:30px"><b>Father</b></td></tr>

<tr><td style="vertical-align:top" style="height:30px"><def:datafieldcontrol runat="server" id="src_father_id" DatabaseField="src_father_id" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="150px" FieldTextBoxWidth="100px" FieldTextBoxMaxLength="100"></def:datafieldcontrol></td>  <td></td></tr>

<tr><td style="vertical-align:top" style="height:35px; background:Gray"></td>  <td></td></tr>

<tr><td style="vertical-align:top" style="height:30px"><def:datafieldcontrol runat="server" id="ques_agebf" DatabaseField="ques_agebf" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="200px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>  <td></td></tr>
<tr><td style="vertical-align:top" style="height:30px">    <asp:Label ID="Label2" runat="server" Text="Father's sex = M"></asp:Label></td></tr>

<tr><td style="vertical-align:top" style="height:30px"><def:datafieldcontrol runat="server" id="ques_gradalbf" DatabaseField="ques_gradalbf" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="200px" FieldTextBoxWidth="40px" ></def:datafieldcontrol></td>  <td></td></tr>

<tr><td style="vertical-align:top" style="height:30px; background:Silver">NEURODEV DISORDERS</td>  <td></td></tr>
<tr><td style="vertical-align:top" style="height:30px"><def:datafieldcontrol runat="server" id="asd_fath" DatabaseField="asd_fath" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="200px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>  <td></td></tr>
<tr><td style="vertical-align:top" style="height:30px"><def:datafieldcontrol runat="server" id="ad_fath" DatabaseField="ad_fath" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="200px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>  <td></td></tr>
<tr><td style="vertical-align:top" style="height:30px"><def:datafieldcontrol runat="server" id="asp_fath" DatabaseField="asp_fath" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="200px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>  <td></td></tr>
<tr><td style="vertical-align:top" style="height:30px"><def:datafieldcontrol runat="server" id="rts_fath" DatabaseField="rts_fath" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="200px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>  <td></td></tr>
<tr><td style="vertical-align:top" style="height:30px"><def:datafieldcontrol runat="server" id="pddn_fath" DatabaseField="pddn_fath" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="200px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>  <td></td></tr>
<tr><td style="vertical-align:top" style="height:30px"><def:datafieldcontrol runat="server" id="father_speechdelay" DatabaseField="father_speechdelay" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="200px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>  <td></td></tr>
<tr><td style="vertical-align:top" style="height:30px"><def:datafieldcontrol runat="server" id="father_devdelay" DatabaseField="father_devdelay" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="200px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>  <td></td></tr>
<tr><td style="vertical-align:top" style="height:30px"><def:datafieldcontrol runat="server" id="father_learndis" DatabaseField="father_learndis" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="200px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>  <td></td></tr>
<tr><td style="vertical-align:top" style="height:30px"><def:datafieldcontrol runat="server" id="seiz_fath" DatabaseField="seiz_fath" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="200px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>  <td></td></tr>
<tr><td style="vertical-align:top" style="height:30px"><def:datafieldcontrol runat="server" id="cerpal_fath" DatabaseField="cerpal_fath" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="200px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>  <td></td></tr>
<tr><td style="vertical-align:top" style="height:30px"><def:datafieldcontrol runat="server" id="downs_fath" DatabaseField="downs_fath" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="200px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>  <td></td></tr>
<tr><td style="vertical-align:top" style="height:30px"><def:datafieldcontrol runat="server" id="idmr_fath" DatabaseField="idmr_fath" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="200px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>  <td></td></tr>
<tr><td style="vertical-align:top" style="height:30px"><def:datafieldcontrol runat="server" id="father_tuberscl" DatabaseField="father_tuberscl" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="200px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>  <td></td></tr>
<tr><td style="vertical-align:top" style="height:30px"><def:datafieldcontrol runat="server" id="father_fragilex" DatabaseField="father_fragilex" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="200px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>  <td></td></tr>
<tr><td style="vertical-align:top" style="height:30px"><def:datafieldcontrol runat="server" id="nfi_fath" DatabaseField="nfi_fath" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="200px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>  <td></td></tr>
<tr><td style="vertical-align:top" style="height:30px; background:Silver">SENSORY</td>  <td></td></tr>
<tr><td style="vertical-align:top" style="height:30px"><def:datafieldcontrol runat="server" id="cblind_fath" DatabaseField="cblind_fath" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="200px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>  <td></td></tr>
<tr><td style="vertical-align:top" style="height:30px"><def:datafieldcontrol runat="server" id="heard_fath" DatabaseField="heard_fath" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="200px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>  <td></td></tr>
<tr><td style="vertical-align:top" style="height:30px"><def:datafieldcontrol runat="server" id="hearcor_fath" DatabaseField="hearcor_fath" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="200px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>  <td></td></tr>
<tr><td style="vertical-align:top" style="height:30px; background:Silver">MENTAL HEALTH</td>  <td></td></tr>

<tr><td style="vertical-align:top" style="height:30px"><def:datafieldcontrol runat="server" id="father_bipolar" DatabaseField="father_bipolar" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="200px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>  <td></td></tr>
<tr><td style="vertical-align:top" style="height:30px"><def:datafieldcontrol runat="server" id="father_depression" DatabaseField="father_depression" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="200px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>  <td></td></tr>
<tr><td style="vertical-align:top" style="height:30px"><def:datafieldcontrol runat="server" id="father_anxiety" DatabaseField="father_anxiety" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="200px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>  <td></td></tr>
<tr><td style="vertical-align:top" style="height:30px"><def:datafieldcontrol runat="server" id="father_ocd" DatabaseField="father_ocd" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="200px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>  <td></td></tr>
<tr><td style="vertical-align:top" style="height:30px"><def:datafieldcontrol runat="server" id="father_schizophrenia" DatabaseField="father_schizophrenia" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="200px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>  <td></td></tr>
<tr><td style="vertical-align:top" style="height:30px"><def:datafieldcontrol runat="server" id="father_selfinj" DatabaseField="father_selfinj" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="200px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>  <td></td></tr>
<tr><td style="vertical-align:top" style="height:30px"><def:datafieldcontrol runat="server" id="father_adhd" DatabaseField="father_adhd" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="200px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>  <td></td></tr>
<tr><td style="vertical-align:top" style="height:30px"><def:datafieldcontrol runat="server" id="father_eatingdis" DatabaseField="father_eatingdis" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="200px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>  <td></td></tr>
<tr><td style="vertical-align:top" style="height:30px"><def:datafieldcontrol runat="server" id="dsp_fath" DatabaseField="dsp_fath" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="200px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>  <td></td></tr>
<tr><td style="vertical-align:top" style="height:30px"><def:datafieldcontrol runat="server" id="tours_fath" DatabaseField="tours_fath" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="200px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>  <td></td></tr>
</table>
</td>

<%--Sib 1--%><td style="vertical-align:top">
<table border="1px">
<tr><td align="right"  style="height:30px"><b>Sibling 1</b></td></tr>

<tr><td style="vertical-align:top" style="height:30px"><def:datafieldcontrol runat="server" id="src_sibling1_id" DatabaseField="src_sibling1_id" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="150px" FieldTextBoxWidth="100px" FieldTextBoxMaxLength="100"></def:datafieldcontrol></td>  <td></td></tr>

<tr><td style="vertical-align:top" style="height:30px"><def:datafieldcontrol runat="server" id="sibling_type1" DatabaseField="sibling_type1" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="200px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>  <td></td></tr>

<tr><td style="vertical-align:top" style="height:30px"><def:datafieldcontrol runat="server" id="ques_age1" DatabaseField="ques_age1" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="200px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>  <td></td></tr>
<tr><td style="vertical-align:top" style="height:30px"><def:datafieldcontrol runat="server" id="ques_gender1" DatabaseField="ques_gender1" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="200px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>  <td></td></tr>
<tr><td style="vertical-align:top" style="height:30px; background:Gray">    <asp:Label ID="Label4" runat="server" Text="Last Grd comp"></asp:Label></td></tr>
<tr><td style="vertical-align:top" style="height:30px; background:Silver">NEURODEV DISORDERS</td>  <td></td></tr>
<tr><td style="vertical-align:top" style="height:30px"><def:datafieldcontrol runat="server" id="asd_sib1" DatabaseField="asd_sib1" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="200px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>  <td></td></tr>
<tr><td style="vertical-align:top" style="height:30px"><def:datafieldcontrol runat="server" id="ad_sib1" DatabaseField="ad_sib1" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="200px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>  <td></td></tr>
<tr><td style="vertical-align:top" style="height:30px"><def:datafieldcontrol runat="server" id="asp_sib1" DatabaseField="asp_sib1" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="200px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>  <td></td></tr>
<tr><td style="vertical-align:top" style="height:30px"><def:datafieldcontrol runat="server" id="rts_sib1" DatabaseField="rts_sib1" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="200px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>  <td></td></tr>
<tr><td style="vertical-align:top" style="height:30px"><def:datafieldcontrol runat="server" id="pddn_sib1" DatabaseField="pddn_sib1" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="200px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>  <td></td></tr>
<tr><td style="vertical-align:top" style="height:30px"><def:datafieldcontrol runat="server" id="ques_langdelay1" DatabaseField="ques_langdelay1" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="200px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>  <td></td></tr>
<tr><td style="vertical-align:top" style="height:30px"><def:datafieldcontrol runat="server" id="ques_devdelay1" DatabaseField="ques_devdelay1" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="200px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>  <td></td></tr>
<tr><td style="vertical-align:top" style="height:30px"><def:datafieldcontrol runat="server" id="ques_learndis1" DatabaseField="ques_learndis1" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="200px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>  <td></td></tr>
<tr><td style="vertical-align:top" style="height:30px"><def:datafieldcontrol runat="server" id="seiz_sib1" DatabaseField="seiz_sib1" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="200px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>  <td></td></tr>
<tr><td style="vertical-align:top" style="height:30px"><def:datafieldcontrol runat="server" id="cerpal_sib1" DatabaseField="cerpal_sib1" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="200px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>  <td></td></tr>
<tr><td style="vertical-align:top" style="height:30px"><def:datafieldcontrol runat="server" id="downs_sib1" DatabaseField="downs_sib1" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="200px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>  <td></td></tr>
<tr><td style="vertical-align:top" style="height:30px"><def:datafieldcontrol runat="server" id="idmr_sib1" DatabaseField="idmr_sib1" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="200px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>  <td></td></tr>
<tr><td style="vertical-align:top" style="height:30px"><def:datafieldcontrol runat="server" id="tuberscl_sib1" DatabaseField="tuberscl_sib1" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="200px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>  <td></td></tr>
<tr><td style="vertical-align:top" style="height:30px"><def:datafieldcontrol runat="server" id="fx_sib1" DatabaseField="fx_sib1" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="200px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>  <td></td></tr>
<tr><td style="vertical-align:top" style="height:30px"><def:datafieldcontrol runat="server" id="nfi_sib1" DatabaseField="nfi_sib1" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="200px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>  <td></td></tr>
<tr><td style="vertical-align:top" style="height:30px; background:Silver">SENSORY</td>  <td></td></tr>
<tr><td style="vertical-align:top" style="height:30px"><def:datafieldcontrol runat="server" id="cblind_sib1" DatabaseField="cblind_sib1" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="200px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>  <td></td></tr>
<tr><td style="vertical-align:top" style="height:30px"><def:datafieldcontrol runat="server" id="heard_sib1" DatabaseField="heard_sib1" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="200px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>  <td></td></tr>
<tr><td style="vertical-align:top" style="height:30px"><def:datafieldcontrol runat="server" id="hearcor_sib1" DatabaseField="hearcor_sib1" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="200px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>  <td></td></tr>
<tr><td style="vertical-align:top" style="height:30px; background:Silver">MENTAL HEALTH</td>  <td></td></tr>
<tr><td style="vertical-align:top" style="height:30px"><def:datafieldcontrol runat="server" id="bipd_sib1" DatabaseField="bipd_sib1" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="200px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>  <td></td></tr>
<tr><td style="vertical-align:top" style="height:30px"><def:datafieldcontrol runat="server" id="depr_sib1" DatabaseField="depr_sib1" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="200px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>  <td></td></tr>
<tr><td style="vertical-align:top" style="height:30px"><def:datafieldcontrol runat="server" id="anx_sib1" DatabaseField="anx_sib1" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="200px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>  <td></td></tr>
<tr><td style="vertical-align:top" style="height:30px"><def:datafieldcontrol runat="server" id="ocd_sib1" DatabaseField="ocd_sib1" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="200px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>  <td></td></tr>
<tr><td style="vertical-align:top" style="height:30px"><def:datafieldcontrol runat="server" id="schiz_sib1" DatabaseField="schiz_sib1" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="200px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>  <td></td></tr>
<tr><td style="vertical-align:top" style="height:30px"><def:datafieldcontrol runat="server" id="sinjb_sib1" DatabaseField="sinjb_sib1" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="200px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>  <td></td></tr>
<tr><td style="vertical-align:top" style="height:30px"><def:datafieldcontrol runat="server" id="adhd_sib1" DatabaseField="adhd_sib1" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="200px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>  <td></td></tr>
<tr><td style="vertical-align:top" style="height:30px"><def:datafieldcontrol runat="server" id="eatd_sib1" DatabaseField="eatd_sib1" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="200px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>  <td></td></tr>
<tr><td style="vertical-align:top" style="height:30px"><def:datafieldcontrol runat="server" id="dsp_sib1" DatabaseField="dsp_sib1" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="200px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>  <td></td></tr>
<tr><td style="vertical-align:top" style="height:30px"><def:datafieldcontrol runat="server" id="tours_sib1" DatabaseField="tours_sib1" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="200px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>  <td></td></tr>
</table>
</td>


<%--Sib 2--%><td style="vertical-align:top">
<table border="1px">
<tr><td align="right"  style="height:30px"><b>Sibling 2</b></td></tr>

<tr><td style="vertical-align:top" style="height:30px"><def:datafieldcontrol runat="server" id="src_sibling2_id" DatabaseField="src_sibling2_id" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="150px" FieldTextBoxWidth="100px" FieldTextBoxMaxLength="100"></def:datafieldcontrol></td>  <td></td></tr>

<tr><td style="vertical-align:top" style="height:30px"><def:datafieldcontrol runat="server" id="sibling_type2" DatabaseField="sibling_type2" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="200px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>  <td></td></tr>

<tr><td style="vertical-align:top" style="height:30px"><def:datafieldcontrol runat="server" id="ques_age2" DatabaseField="ques_age2" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="200px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>  <td></td></tr>
<tr><td style="vertical-align:top" style="height:30px"><def:datafieldcontrol runat="server" id="ques_gender2" DatabaseField="ques_gender2" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="200px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>  <td></td></tr>
<tr><td style="vertical-align:top" style="height:30px; background:Gray">    <asp:Label ID="Label3" runat="server" Text="Last Grd comp"></asp:Label></td></tr>
<tr><td style="vertical-align:top" style="height:30px; background:Silver">NEURODEV DISORDERS</td>  <td></td></tr>
<tr><td style="vertical-align:top" style="height:30px"><def:datafieldcontrol runat="server" id="asd_sib2" DatabaseField="asd_sib2" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="200px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>  <td></td></tr>
<tr><td style="vertical-align:top" style="height:30px"><def:datafieldcontrol runat="server" id="ad_sib2" DatabaseField="ad_sib2" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="200px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>  <td></td></tr>
<tr><td style="vertical-align:top" style="height:30px"><def:datafieldcontrol runat="server" id="asp_sib2" DatabaseField="asp_sib2" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="200px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>  <td></td></tr>
<tr><td style="vertical-align:top" style="height:30px"><def:datafieldcontrol runat="server" id="rts_sib2" DatabaseField="rts_sib2" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="200px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>  <td></td></tr>
<tr><td style="vertical-align:top" style="height:30px"><def:datafieldcontrol runat="server" id="pddn_sib2" DatabaseField="pddn_sib2" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="200px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>  <td></td></tr>
<tr><td style="vertical-align:top" style="height:30px"><def:datafieldcontrol runat="server" id="ques_langdelay2" DatabaseField="ques_langdelay2" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="200px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>  <td></td></tr>
<tr><td style="vertical-align:top" style="height:30px"><def:datafieldcontrol runat="server" id="ques_devdelay2" DatabaseField="ques_devdelay2" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="200px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>  <td></td></tr>
<tr><td style="vertical-align:top" style="height:30px"><def:datafieldcontrol runat="server" id="ques_learndis2" DatabaseField="ques_learndis2" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="200px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>  <td></td></tr>
<tr><td style="vertical-align:top" style="height:30px"><def:datafieldcontrol runat="server" id="seiz_sib2" DatabaseField="seiz_sib2" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="200px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>  <td></td></tr>
<tr><td style="vertical-align:top" style="height:30px"><def:datafieldcontrol runat="server" id="cerpal_sib2" DatabaseField="cerpal_sib2" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="200px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>  <td></td></tr>
<tr><td style="vertical-align:top" style="height:30px"><def:datafieldcontrol runat="server" id="downs_sib2" DatabaseField="downs_sib2" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="200px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>  <td></td></tr>
<tr><td style="vertical-align:top" style="height:30px"><def:datafieldcontrol runat="server" id="idmr_sib2" DatabaseField="idmr_sib2" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="200px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>  <td></td></tr>
<tr><td style="vertical-align:top" style="height:30px"><def:datafieldcontrol runat="server" id="tuberscl_sib2" DatabaseField="tuberscl_sib2" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="200px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>  <td></td></tr>
<tr><td style="vertical-align:top" style="height:30px"><def:datafieldcontrol runat="server" id="fx_sib2" DatabaseField="fx_sib2" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="200px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>  <td></td></tr>
<tr><td style="vertical-align:top" style="height:30px"><def:datafieldcontrol runat="server" id="nfi_sib2" DatabaseField="nfi_sib2" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="200px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>  <td></td></tr>
<tr><td style="vertical-align:top" style="height:30px; background:Silver">SENSORY</td>  <td></td></tr>
<tr><td style="vertical-align:top" style="height:30px"><def:datafieldcontrol runat="server" id="cblind_sib2" DatabaseField="cblind_sib2" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="200px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>  <td></td></tr>
<tr><td style="vertical-align:top" style="height:30px"><def:datafieldcontrol runat="server" id="heard_sib2" DatabaseField="heard_sib2" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="200px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>  <td></td></tr>
<tr><td style="vertical-align:top" style="height:30px"><def:datafieldcontrol runat="server" id="hearcor_sib2" DatabaseField="hearcor_sib2" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="200px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>  <td></td></tr>
<tr><td style="vertical-align:top" style="height:30px; background:Silver">MENTAL HEALTH</td>  <td></td></tr>
<tr><td style="vertical-align:top" style="height:30px"><def:datafieldcontrol runat="server" id="bipd_sib2" DatabaseField="bipd_sib2" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="200px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>  <td></td></tr>
<tr><td style="vertical-align:top" style="height:30px"><def:datafieldcontrol runat="server" id="depr_sib2" DatabaseField="depr_sib2" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="200px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>  <td></td></tr>
<tr><td style="vertical-align:top" style="height:30px"><def:datafieldcontrol runat="server" id="anx_sib2" DatabaseField="anx_sib2" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="200px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>  <td></td></tr>
<tr><td style="vertical-align:top" style="height:30px"><def:datafieldcontrol runat="server" id="ocd_sib2" DatabaseField="ocd_sib2" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="200px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>  <td></td></tr>
<tr><td style="vertical-align:top" style="height:30px"><def:datafieldcontrol runat="server" id="schiz_sib2" DatabaseField="schiz_sib2" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="200px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>  <td></td></tr>
<tr><td style="vertical-align:top" style="height:30px"><def:datafieldcontrol runat="server" id="sinjb_sib2" DatabaseField="sinjb_sib2" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="200px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>  <td></td></tr>
<tr><td style="vertical-align:top" style="height:30px"><def:datafieldcontrol runat="server" id="adhd_sib2" DatabaseField="adhd_sib2" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="200px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>  <td></td></tr>
<tr><td style="vertical-align:top" style="height:30px"><def:datafieldcontrol runat="server" id="eatd_sib2" DatabaseField="eatd_sib2" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="200px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>  <td></td></tr>
<tr><td style="vertical-align:top" style="height:30px"><def:datafieldcontrol runat="server" id="dsp_sib2" DatabaseField="dsp_sib2" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="200px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>  <td></td></tr>
<tr><td style="vertical-align:top" style="height:30px"><def:datafieldcontrol runat="server" id="tours_sib2" DatabaseField="tours_sib2" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="200px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>  <td></td></tr>
</table>
</td>


<%--Sib 3--%><td style="vertical-align:top">
<table border="1px">
<tr><td align="right"  style="height:30px"><b>Sibling 3</b></td></tr>

<tr><td style="vertical-align:top" style="height:30px"><def:datafieldcontrol runat="server" id="src_sibling3_id" DatabaseField="src_sibling3_id" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="150px" FieldTextBoxWidth="100px" FieldTextBoxMaxLength="100"></def:datafieldcontrol></td>  <td></td></tr>

<tr><td style="vertical-align:top" style="height:30px"><def:datafieldcontrol runat="server" id="sibling_type3" DatabaseField="sibling_type3" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="200px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>  <td></td></tr>

<tr><td style="vertical-align:top" style="height:30px"><def:datafieldcontrol runat="server" id="ques_age3" DatabaseField="ques_age3" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="200px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>  <td></td></tr>
<tr><td style="vertical-align:top" style="height:30px"><def:datafieldcontrol runat="server" id="ques_gender3" DatabaseField="ques_gender3" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="200px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>  <td></td></tr>
<tr><td style="vertical-align:top" style="height:30px; background:Gray">    <asp:Label ID="Label5" runat="server" Text="Last Grd comp"></asp:Label></td></tr>
<tr><td style="vertical-align:top" style="height:30px; background:Silver">NEURODEV DISORDERS</td>  <td></td></tr>
<tr><td style="vertical-align:top" style="height:30px"><def:datafieldcontrol runat="server" id="asd_sib3" DatabaseField="asd_sib3" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="200px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>  <td></td></tr>
<tr><td style="vertical-align:top" style="height:30px"><def:datafieldcontrol runat="server" id="ad_sib3" DatabaseField="ad_sib3" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="200px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>  <td></td></tr>
<tr><td style="vertical-align:top" style="height:30px"><def:datafieldcontrol runat="server" id="asp_sib3" DatabaseField="asp_sib3" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="200px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>  <td></td></tr>
<tr><td style="vertical-align:top" style="height:30px"><def:datafieldcontrol runat="server" id="rts_sib3" DatabaseField="rts_sib3" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="200px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>  <td></td></tr>
<tr><td style="vertical-align:top" style="height:30px"><def:datafieldcontrol runat="server" id="pddn_sib3" DatabaseField="pddn_sib3" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="200px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>  <td></td></tr>
<tr><td style="vertical-align:top" style="height:30px"><def:datafieldcontrol runat="server" id="ques_langdelay3" DatabaseField="ques_langdelay3" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="200px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>  <td></td></tr>
<tr><td style="vertical-align:top" style="height:30px"><def:datafieldcontrol runat="server" id="ques_devdelay3" DatabaseField="ques_devdelay3" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="200px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>  <td></td></tr>
<tr><td style="vertical-align:top" style="height:30px"><def:datafieldcontrol runat="server" id="ques_learndis3" DatabaseField="ques_learndis3" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="200px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>  <td></td></tr>
<tr><td style="vertical-align:top" style="height:30px"><def:datafieldcontrol runat="server" id="seiz_sib3" DatabaseField="seiz_sib3" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="200px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>  <td></td></tr>
<tr><td style="vertical-align:top" style="height:30px"><def:datafieldcontrol runat="server" id="cerpal_sib3" DatabaseField="cerpal_sib3" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="200px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>  <td></td></tr>
<tr><td style="vertical-align:top" style="height:30px"><def:datafieldcontrol runat="server" id="downs_sib3" DatabaseField="downs_sib3" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="200px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>  <td></td></tr>
<tr><td style="vertical-align:top" style="height:30px"><def:datafieldcontrol runat="server" id="idmr_sib3" DatabaseField="idmr_sib3" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="200px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>  <td></td></tr>
<tr><td style="vertical-align:top" style="height:30px"><def:datafieldcontrol runat="server" id="tuberscl_sib3" DatabaseField="tuberscl_sib3" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="200px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>  <td></td></tr>
<tr><td style="vertical-align:top" style="height:30px"><def:datafieldcontrol runat="server" id="fx_sib3" DatabaseField="fx_sib3" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="200px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>  <td></td></tr>
<tr><td style="vertical-align:top" style="height:30px"><def:datafieldcontrol runat="server" id="nfi_sib3" DatabaseField="nfi_sib3" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="200px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>  <td></td></tr>
<tr><td style="vertical-align:top" style="height:30px; background:Silver">SENSORY</td>  <td></td></tr>
<tr><td style="vertical-align:top" style="height:30px"><def:datafieldcontrol runat="server" id="cblind_sib3" DatabaseField="cblind_sib3" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="200px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>  <td></td></tr>
<tr><td style="vertical-align:top" style="height:30px"><def:datafieldcontrol runat="server" id="heard_sib3" DatabaseField="heard_sib3" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="200px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>  <td></td></tr>
<tr><td style="vertical-align:top" style="height:30px"><def:datafieldcontrol runat="server" id="hearcor_sib3" DatabaseField="hearcor_sib3" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="200px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>  <td></td></tr>
<tr><td style="vertical-align:top" style="height:30px; background:Silver">MENTAL HEALTH</td>  <td></td></tr>
<tr><td style="vertical-align:top" style="height:30px"><def:datafieldcontrol runat="server" id="bipd_sib3" DatabaseField="bipd_sib3" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="200px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>  <td></td></tr>
<tr><td style="vertical-align:top" style="height:30px"><def:datafieldcontrol runat="server" id="depr_sib3" DatabaseField="depr_sib3" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="200px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>  <td></td></tr>
<tr><td style="vertical-align:top" style="height:30px"><def:datafieldcontrol runat="server" id="anx_sib3" DatabaseField="anx_sib3" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="200px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>  <td></td></tr>
<tr><td style="vertical-align:top" style="height:30px"><def:datafieldcontrol runat="server" id="ocd_sib3" DatabaseField="ocd_sib3" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="200px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>  <td></td></tr>
<tr><td style="vertical-align:top" style="height:30px"><def:datafieldcontrol runat="server" id="schiz_sib3" DatabaseField="schiz_sib3" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="200px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>  <td></td></tr>
<tr><td style="vertical-align:top" style="height:30px"><def:datafieldcontrol runat="server" id="sinjb_sib3" DatabaseField="sinjb_sib3" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="200px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>  <td></td></tr>
<tr><td style="vertical-align:top" style="height:30px"><def:datafieldcontrol runat="server" id="adhd_sib3" DatabaseField="adhd_sib3" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="200px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>  <td></td></tr>
<tr><td style="vertical-align:top" style="height:30px"><def:datafieldcontrol runat="server" id="eatd_sib3" DatabaseField="eatd_sib3" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="200px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>  <td></td></tr>
<tr><td style="vertical-align:top" style="height:30px"><def:datafieldcontrol runat="server" id="dsp_sib3" DatabaseField="dsp_sib3" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="200px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>  <td></td></tr>
<tr><td style="vertical-align:top" style="height:30px"><def:datafieldcontrol runat="server" id="tours_sib3" DatabaseField="tours_sib3" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="200px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>  <td></td></tr>
</table>
</td>



<%--Sib 4--%><td style="vertical-align:top">
<table border="1px">
<tr><td align="right"  style="height:30px"><b>Sibling 4</b></td></tr>

<tr><td style="vertical-align:top" style="height:30px"><def:datafieldcontrol runat="server" id="src_sibling4_id" DatabaseField="src_sibling4_id" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="150px" FieldTextBoxWidth="100px" FieldTextBoxMaxLength="100"></def:datafieldcontrol></td>  <td></td></tr>

<tr><td style="vertical-align:top" style="height:30px"><def:datafieldcontrol runat="server" id="sibling_type4" DatabaseField="sibling_type4" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="200px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>  <td></td></tr>

<tr><td style="vertical-align:top" style="height:30px"><def:datafieldcontrol runat="server" id="ques_age4" DatabaseField="ques_age4" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="200px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>  <td></td></tr>
<tr><td style="vertical-align:top" style="height:30px"><def:datafieldcontrol runat="server" id="ques_gender4" DatabaseField="ques_gender4" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="200px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>  <td></td></tr>
<tr><td style="vertical-align:top" style="height:30px; background:Gray">    <asp:Label ID="Label6" runat="server" Text="Last Grd comp"></asp:Label></td></tr>
<tr><td style="vertical-align:top" style="height:30px; background:Silver">NEURODEV DISORDERS</td>  <td></td></tr>
<tr><td style="vertical-align:top" style="height:30px"><def:datafieldcontrol runat="server" id="asd_sib4" DatabaseField="asd_sib4" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="200px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>  <td></td></tr>
<tr><td style="vertical-align:top" style="height:30px"><def:datafieldcontrol runat="server" id="ad_sib4" DatabaseField="ad_sib4" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="200px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>  <td></td></tr>
<tr><td style="vertical-align:top" style="height:30px"><def:datafieldcontrol runat="server" id="asp_sib4" DatabaseField="asp_sib4" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="200px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>  <td></td></tr>
<tr><td style="vertical-align:top" style="height:30px"><def:datafieldcontrol runat="server" id="rts_sib4" DatabaseField="rts_sib4" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="200px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>  <td></td></tr>
<tr><td style="vertical-align:top" style="height:30px"><def:datafieldcontrol runat="server" id="pddn_sib4" DatabaseField="pddn_sib4" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="200px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>  <td></td></tr>
<tr><td style="vertical-align:top" style="height:30px"><def:datafieldcontrol runat="server" id="ques_langdelay4" DatabaseField="ques_langdelay4" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="200px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>  <td></td></tr>
<tr><td style="vertical-align:top" style="height:30px"><def:datafieldcontrol runat="server" id="ques_devdelay4" DatabaseField="ques_devdelay4" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="200px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>  <td></td></tr>
<tr><td style="vertical-align:top" style="height:30px"><def:datafieldcontrol runat="server" id="ques_learndis4" DatabaseField="ques_learndis4" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="200px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>  <td></td></tr>
<tr><td style="vertical-align:top" style="height:30px"><def:datafieldcontrol runat="server" id="seiz_sib4" DatabaseField="seiz_sib4" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="200px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>  <td></td></tr>
<tr><td style="vertical-align:top" style="height:30px"><def:datafieldcontrol runat="server" id="cerpal_sib4" DatabaseField="cerpal_sib4" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="200px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>  <td></td></tr>
<tr><td style="vertical-align:top" style="height:30px"><def:datafieldcontrol runat="server" id="downs_sib4" DatabaseField="downs_sib4" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="200px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>  <td></td></tr>
<tr><td style="vertical-align:top" style="height:30px"><def:datafieldcontrol runat="server" id="idmr_sib4" DatabaseField="idmr_sib4" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="200px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>  <td></td></tr>
<tr><td style="vertical-align:top" style="height:30px"><def:datafieldcontrol runat="server" id="tuberscl_sib4" DatabaseField="tuberscl_sib4" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="200px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>  <td></td></tr>
<tr><td style="vertical-align:top" style="height:30px"><def:datafieldcontrol runat="server" id="fx_sib4" DatabaseField="fx_sib4" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="200px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>  <td></td></tr>
<tr><td style="vertical-align:top" style="height:30px"><def:datafieldcontrol runat="server" id="nfi_sib4" DatabaseField="nfi_sib4" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="200px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>  <td></td></tr>
<tr><td style="vertical-align:top" style="height:30px; background:Silver">SENSORY</td>  <td></td></tr>
<tr><td style="vertical-align:top" style="height:30px"><def:datafieldcontrol runat="server" id="cblind_sib4" DatabaseField="cblind_sib4" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="200px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>  <td></td></tr>
<tr><td style="vertical-align:top" style="height:30px"><def:datafieldcontrol runat="server" id="heard_sib4" DatabaseField="heard_sib4" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="200px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>  <td></td></tr>
<tr><td style="vertical-align:top" style="height:30px"><def:datafieldcontrol runat="server" id="hearcor_sib4" DatabaseField="hearcor_sib4" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="200px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>  <td></td></tr>
<tr><td style="vertical-align:top" style="height:30px; background:Silver">MENTAL HEALTH</td>  <td></td></tr>
<tr><td style="vertical-align:top" style="height:30px"><def:datafieldcontrol runat="server" id="bipd_sib4" DatabaseField="bipd_sib4" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="200px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>  <td></td></tr>
<tr><td style="vertical-align:top" style="height:30px"><def:datafieldcontrol runat="server" id="depr_sib4" DatabaseField="depr_sib4" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="200px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>  <td></td></tr>
<tr><td style="vertical-align:top" style="height:30px"><def:datafieldcontrol runat="server" id="anx_sib4" DatabaseField="anx_sib4" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="200px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>  <td></td></tr>
<tr><td style="vertical-align:top" style="height:30px"><def:datafieldcontrol runat="server" id="ocd_sib4" DatabaseField="ocd_sib4" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="200px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>  <td></td></tr>
<tr><td style="vertical-align:top" style="height:30px"><def:datafieldcontrol runat="server" id="schiz_sib4" DatabaseField="schiz_sib4" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="200px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>  <td></td></tr>
<tr><td style="vertical-align:top" style="height:30px"><def:datafieldcontrol runat="server" id="sinjb_sib4" DatabaseField="sinjb_sib4" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="200px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>  <td></td></tr>
<tr><td style="vertical-align:top" style="height:30px"><def:datafieldcontrol runat="server" id="adhd_sib4" DatabaseField="adhd_sib4" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="200px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>  <td></td></tr>
<tr><td style="vertical-align:top" style="height:30px"><def:datafieldcontrol runat="server" id="eatd_sib4" DatabaseField="eatd_sib4" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="200px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>  <td></td></tr>
<tr><td style="vertical-align:top" style="height:30px"><def:datafieldcontrol runat="server" id="dsp_sib4" DatabaseField="dsp_sib4" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="200px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>  <td></td></tr>
<tr><td style="vertical-align:top" style="height:30px"><def:datafieldcontrol runat="server" id="tours_sib4" DatabaseField="tours_sib4" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="200px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>  <td></td></tr>
</table>
</td>



<%--Sib 5--%><td style="vertical-align:top">
<table border="1px">
<tr><td align="right"  style="height:30px"><b>Sibling 5</b></td></tr>

<tr><td style="vertical-align:top" style="height:30px"><def:datafieldcontrol runat="server" id="src_sibling5_id" DatabaseField="src_sibling5_id" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="150px" FieldTextBoxWidth="100px" FieldTextBoxMaxLength="100"></def:datafieldcontrol></td>  <td></td></tr>

<tr><td style="vertical-align:top" style="height:30px"><def:datafieldcontrol runat="server" id="sibling_type5" DatabaseField="sibling_type5" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="200px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>  <td></td></tr>

<tr><td style="vertical-align:top" style="height:30px"><def:datafieldcontrol runat="server" id="ques_age5" DatabaseField="ques_age5" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="200px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>  <td></td></tr>
<tr><td style="vertical-align:top" style="height:30px"><def:datafieldcontrol runat="server" id="ques_gender5" DatabaseField="ques_gender5" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="200px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>  <td></td></tr>
<tr><td style="vertical-align:top" style="height:30px; background:Gray">    <asp:Label ID="Label7" runat="server" Text="Last Grd comp"></asp:Label></td></tr>
<tr><td style="vertical-align:top" style="height:30px; background:Silver">NEURODEV DISORDERS</td>  <td></td></tr>
<tr><td style="vertical-align:top" style="height:30px"><def:datafieldcontrol runat="server" id="asd_sib5" DatabaseField="asd_sib5" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="200px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>  <td></td></tr>
<tr><td style="vertical-align:top" style="height:30px"><def:datafieldcontrol runat="server" id="ad_sib5" DatabaseField="ad_sib5" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="200px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>  <td></td></tr>
<tr><td style="vertical-align:top" style="height:30px"><def:datafieldcontrol runat="server" id="asp_sib5" DatabaseField="asp_sib5" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="200px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>  <td></td></tr>
<tr><td style="vertical-align:top" style="height:30px"><def:datafieldcontrol runat="server" id="rts_sib5" DatabaseField="rts_sib5" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="200px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>  <td></td></tr>
<tr><td style="vertical-align:top" style="height:30px"><def:datafieldcontrol runat="server" id="pddn_sib5" DatabaseField="pddn_sib5" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="200px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>  <td></td></tr>
<tr><td style="vertical-align:top" style="height:30px"><def:datafieldcontrol runat="server" id="ques_langdelay5" DatabaseField="ques_langdelay5" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="200px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>  <td></td></tr>
<tr><td style="vertical-align:top" style="height:30px"><def:datafieldcontrol runat="server" id="ques_devdelay5" DatabaseField="ques_devdelay5" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="200px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>  <td></td></tr>
<tr><td style="vertical-align:top" style="height:30px"><def:datafieldcontrol runat="server" id="ques_learndis5" DatabaseField="ques_learndis5" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="200px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>  <td></td></tr>
<tr><td style="vertical-align:top" style="height:30px"><def:datafieldcontrol runat="server" id="seiz_sib5" DatabaseField="seiz_sib5" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="200px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>  <td></td></tr>
<tr><td style="vertical-align:top" style="height:30px"><def:datafieldcontrol runat="server" id="cerpal_sib5" DatabaseField="cerpal_sib5" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="200px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>  <td></td></tr>
<tr><td style="vertical-align:top" style="height:30px"><def:datafieldcontrol runat="server" id="downs_sib5" DatabaseField="downs_sib5" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="200px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>  <td></td></tr>
<tr><td style="vertical-align:top" style="height:30px"><def:datafieldcontrol runat="server" id="idmr_sib5" DatabaseField="idmr_sib5" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="200px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>  <td></td></tr>
<tr><td style="vertical-align:top" style="height:30px"><def:datafieldcontrol runat="server" id="tuberscl_sib5" DatabaseField="tuberscl_sib5" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="200px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>  <td></td></tr>
<tr><td style="vertical-align:top" style="height:30px"><def:datafieldcontrol runat="server" id="fx_sib5" DatabaseField="fx_sib5" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="200px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>  <td></td></tr>
<tr><td style="vertical-align:top" style="height:30px"><def:datafieldcontrol runat="server" id="nfi_sib5" DatabaseField="nfi_sib5" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="200px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>  <td></td></tr>
<tr><td style="vertical-align:top" style="height:30px; background:Silver">SENSORY</td>  <td></td></tr>
<tr><td style="vertical-align:top" style="height:30px"><def:datafieldcontrol runat="server" id="cblind_sib5" DatabaseField="cblind_sib5" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="200px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>  <td></td></tr>
<tr><td style="vertical-align:top" style="height:30px"><def:datafieldcontrol runat="server" id="heard_sib5" DatabaseField="heard_sib5" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="200px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>  <td></td></tr>
<tr><td style="vertical-align:top" style="height:30px"><def:datafieldcontrol runat="server" id="hearcor_sib5" DatabaseField="hearcor_sib5" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="200px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>  <td></td></tr>
<tr><td style="vertical-align:top" style="height:30px; background:Silver">MENTAL HEALTH</td>  <td></td></tr>
<tr><td style="vertical-align:top" style="height:30px"><def:datafieldcontrol runat="server" id="bipd_sib5" DatabaseField="bipd_sib5" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="200px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>  <td></td></tr>
<tr><td style="vertical-align:top" style="height:30px"><def:datafieldcontrol runat="server" id="depr_sib5" DatabaseField="depr_sib5" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="200px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>  <td></td></tr>
<tr><td style="vertical-align:top" style="height:30px"><def:datafieldcontrol runat="server" id="anx_sib5" DatabaseField="anx_sib5" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="200px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>  <td></td></tr>
<tr><td style="vertical-align:top" style="height:30px"><def:datafieldcontrol runat="server" id="ocd_sib5" DatabaseField="ocd_sib5" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="200px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>  <td></td></tr>
<tr><td style="vertical-align:top" style="height:30px"><def:datafieldcontrol runat="server" id="schiz_sib5" DatabaseField="schiz_sib5" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="200px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>  <td></td></tr>
<tr><td style="vertical-align:top" style="height:30px"><def:datafieldcontrol runat="server" id="sinjb_sib5" DatabaseField="sinjb_sib5" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="200px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>  <td></td></tr>
<tr><td style="vertical-align:top" style="height:30px"><def:datafieldcontrol runat="server" id="adhd_sib5" DatabaseField="adhd_sib5" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="200px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>  <td></td></tr>
<tr><td style="vertical-align:top" style="height:30px"><def:datafieldcontrol runat="server" id="eatd_sib5" DatabaseField="eatd_sib5" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="200px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>  <td></td></tr>
<tr><td style="vertical-align:top" style="height:30px"><def:datafieldcontrol runat="server" id="dsp_sib5" DatabaseField="dsp_sib5" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="200px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>  <td></td></tr>
<tr><td style="vertical-align:top" style="height:30px"><def:datafieldcontrol runat="server" id="tours_sib5" DatabaseField="tours_sib5" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="200px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>  <td></td></tr>
</table>
</td>



</tr>

</table>



</ContentTemplate>
<Triggers></Triggers>
</asp:UpdatePanel>
</asp:Content>
