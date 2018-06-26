<%@ Register TagPrefix="def" Namespace="DataEntryFramework3" %>

<%@ Page Language="c#" MasterPageFile="~/UWAC.master" Title="BOT2 Data Entry"   AutoEventWireup="true" CodeFile="BOT2.aspx.cs" Inherits="DataEntryForms_Common_BOT2_BOT2"  %>

<asp:Content ID="Content1" ContentPlaceHolderID="oBodyPlaceHolder" runat="server">

    <def:dataentrycontroller id="DataEntryController1" runat="server" DatabaseTable="ALL_BOT2" PrimaryKeyField="bot2_pk">
    </def:dataentrycontroller>
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <table>

                <tr>
                    <td style="vertical-align:top">
                        <def:datafieldcontrol runat="server" id="id" DatabaseField="id" IsInsertField="true" FieldLabelWidth="300px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="15"></def:datafieldcontrol></td>
                    <td></td>
                </tr>

                <tr>
                    <td style="vertical-align:top">
                        <def:datafieldcontrol runat="server" id="indexnum" DatabaseField="indexnum" IsInsertField="true" FieldTextBoxTextDefault="1" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
                    <td></td>
                </tr>
                <tr>
                    <td style="vertical-align:top">
                        <def:datafieldcontrol runat="server" id="bot2_formvers" DatabaseField="bot2_formvers" IsInsertField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
                        
                    </td>
                    <td>  <%--<asp:Label id="ll1" runat="server" Text=" Save the form to load the appropriate items for this version." ForeColor="Gray" Font-Italic="true"></asp:Label>--%></td>
                </tr>

                <tr>
                    <td style="vertical-align:top">
                        <def:datafieldcontrol runat="server" id="BOT2_date" DatabaseField="BOT2_date" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FormatString="{0:d}"></def:datafieldcontrol></td>
                    <td></td>
                </tr>

                <tr>
                    <td style="vertical-align:top">
                        <def:datafieldcontrol runat="server" id="BOT2_ageym" DatabaseField="BOT2_ageym" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
                    <td></td>
                </tr>

                <tr>
                    <td style="vertical-align:top">
                        <def:datafieldcontrol runat="server" id="BOT2_exmnr" DatabaseField="BOT2_exmnr" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="300px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="20"></def:datafieldcontrol></td>
                    <td></td>
                </tr>


                <tr>
                    <td style="vertical-align:top">
                        <def:datafieldcontrol runat="server" id="BOT2_cmnt" DatabaseField="BOT2_cmnt" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="300px" FieldTextBoxWidth="400px" FieldTextBoxHeight="40px" FieldTextBoxTextMode="multiline" FieldTextBoxMaxLength="250"></def:datafieldcontrol></td>
                    <td></td>
                </tr>




  
            </table>

            <br /><br />
          <br />
            <asp:Label ID="Label8" runat="server" Text="SUBSCALE SCORES" Font-Underline="true" Font-Bold="true" Font-Size="Medium"></asp:Label>

            <%--SUBSCALES--%>
            <table  >
                <tr>
                    <td align="right"><b></b></td>
                    <td align="right"><b></b></td>
                    <td align="right" colspan="2"><b></b></td>
                    <td align="right"><b></b></td>
 
                    <td align="center"><b>Subscale Pairwise Comparisons</b>
                    </td>

                </tr>
                <tr>
                    <%--Subscale Scored Variables --%>

                    <%--Total Points--%>
                    <td>
                        <table>
                            <tr>                    <td align="right"><b>Total<br />Points</b></td></tr>
                            <tr>
                                <td style="vertical-align:top">
                                    <def:datafieldcontrol runat="server" id="bot2_fmp_tot" DatabaseField="bot2_fmp_tot" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="200px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
                                <td></td>
                            </tr>

                            <tr>
                                <td style="vertical-align:top">
                                    <def:datafieldcontrol runat="server" id="bot2_fmi_tot" DatabaseField="bot2_fmi_tot" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="200px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
                                <td></td>
                            </tr>

                            <tr>
                                <td style="vertical-align:top">
                                    <def:datafieldcontrol runat="server" id="bot2_md_tot" DatabaseField="bot2_md_tot" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="200px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
                                <td></td>
                            </tr>

                            <tr>
                                <td style="vertical-align:top">
                                    <def:datafieldcontrol runat="server" id="bot2_bic_tot" DatabaseField="bot2_bic_tot" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="200px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
                                <td></td>
                            </tr>

                            <tr>
                                <td style="vertical-align:top">
                                    <def:datafieldcontrol runat="server" id="bot2_bal_tot" DatabaseField="bot2_bal_tot" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="200px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
                                <td></td>
                            </tr>

                            <tr>
                                <td style="vertical-align:top">
                                    <def:datafieldcontrol runat="server" id="bot2_rsa_tot" DatabaseField="bot2_rsa_tot" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="200px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
                                <td></td>
                            </tr>

                            <tr>
                                <td style="vertical-align:top">
                                    <def:datafieldcontrol runat="server" id="bot2_ulc_tot" DatabaseField="bot2_ulc_tot" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="200px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
                                <td></td>
                            </tr>

                            <tr>
                                <td style="vertical-align:top">
                                    <def:datafieldcontrol runat="server" id="bot2_str_tot" DatabaseField="bot2_str_tot" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="200px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
                                <td></td>
                            </tr>
                        </table>
                    </td>

                    <%--Scaled Score--%>
                    <td>

                        <table>
                            <tr><td align="right"><b>Scaled<br />Score</b></td></tr>
                            <tr>
                                <td style="vertical-align:top">
                                    <def:datafieldcontrol runat="server" id="bot2_fmp_scl" DatabaseField="bot2_fmp_scl" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="30px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
                                <td></td>
                            </tr>

                            <tr>
                                <td style="vertical-align:top">
                                    <def:datafieldcontrol runat="server" id="bot2_fmi_scl" DatabaseField="bot2_fmi_scl" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="30px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
                                <td></td>
                            </tr>

                            <tr>
                                <td style="vertical-align:top">
                                    <def:datafieldcontrol runat="server" id="bot2_md_scl" DatabaseField="bot2_md_scl" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="30px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
                                <td></td>
                            </tr>

                            <tr>
                                <td style="vertical-align:top">
                                    <def:datafieldcontrol runat="server" id="bot2_bic_scl" DatabaseField="bot2_bic_scl" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="30px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
                                <td></td>
                            </tr>

                            <tr>
                                <td style="vertical-align:top">
                                    <def:datafieldcontrol runat="server" id="bot2_bal_scl" DatabaseField="bot2_bal_scl" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="30px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
                                <td></td>
                            </tr>

                            <tr>
                                <td style="vertical-align:top">
                                    <def:datafieldcontrol runat="server" id="bot2_rsa_scl" DatabaseField="bot2_rsa_scl" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="30px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
                                <td></td>
                            </tr>

                            <tr>
                                <td style="vertical-align:top">
                                    <def:datafieldcontrol runat="server" id="bot2_ulc_scl" DatabaseField="bot2_ulc_scl" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="30px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
                                <td></td>
                            </tr>

                            <tr>
                                <td style="vertical-align:top">
                                    <def:datafieldcontrol runat="server" id="bot2_str_scl" DatabaseField="bot2_str_scl" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="30px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
                                <td></td>
                            </tr>
                        </table>
                    </td>

                    <%--Age Equiv--%>
                    <td>
                        <table>
                            <tr><td align="right" colspan="2"><b>Age Equiv<br />(low - high)</b></td></tr>
                            <tr>
                                <td style="vertical-align:top">
                                    <def:datafieldcontrol runat="server" id="bot2_fmp_ae" DatabaseField="bot2_fmp_ae_txt" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="50px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
                                                               <td style="vertical-align:top">
                                    <def:datafieldcontrol runat="server" id="Datafieldcontrol1" DatabaseField="bot2_fmp_ae_hi_txt" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="20px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>

                            </tr>

                            <tr>
                                <td style="vertical-align:top">
                                    <def:datafieldcontrol runat="server" id="bot2_fmi_ae" DatabaseField="bot2_fmi_ae_txt" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="50px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
                                <td style="vertical-align:top">
                                    <def:datafieldcontrol runat="server" id="Datafieldcontrol2" DatabaseField="bot2_fmi_ae_hi_txt" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="20px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
                            </tr>

                            <tr>
                                <td style="vertical-align:top">
                                    <def:datafieldcontrol runat="server" id="bot2_md_ae" DatabaseField="bot2_md_ae_txt" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="50px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
                                <td style="vertical-align:top">
                                    <def:datafieldcontrol runat="server" id="Datafieldcontrol3" DatabaseField="bot2_md_ae_hi_txt" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="20px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
                            </tr>

                            <tr>
                                <td style="vertical-align:top">
                                    <def:datafieldcontrol runat="server" id="bot2_bic_ae" DatabaseField="bot2_bic_ae_txt" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="50px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
                                <td style="vertical-align:top">
                                    <def:datafieldcontrol runat="server" id="Datafieldcontrol4" DatabaseField="bot2_bic_ae_hi_txt" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="20px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>

                            </tr>

                            <tr>
                                <td style="vertical-align:top">
                                    <def:datafieldcontrol runat="server" id="bot2_bal_ae" DatabaseField="bot2_bal_ae_txt" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="50px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
                                <td style="vertical-align:top">
                                    <def:datafieldcontrol runat="server" id="Datafieldcontrol5" DatabaseField="bot2_bal_ae_hi_txt" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="20px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>

                            </tr>

                            <tr>
                                <td style="vertical-align:top">
                                    <def:datafieldcontrol runat="server" id="bot2_rsa_ae" DatabaseField="bot2_rsa_ae_txt" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="50px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
                                <td style="vertical-align:top">
                                    <def:datafieldcontrol runat="server" id="Datafieldcontrol6" DatabaseField="bot2_rsa_ae_hi_txt" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="20px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>

                            </tr>

                            <tr>
                                <td style="vertical-align:top">
                                    <def:datafieldcontrol runat="server" id="bot2_ulc_ae" DatabaseField="bot2_ulc_ae_txt" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="50px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
                                <td style="vertical-align:top">
                                    <def:datafieldcontrol runat="server" id="Datafieldcontrol7" DatabaseField="bot2_ulc_ae_hi_txt" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="20px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>

                            </tr>

                            <tr>
                                <td style="vertical-align:top">
                                    <def:datafieldcontrol runat="server" id="bot2_str_ae" DatabaseField="bot2_str_ae_txt" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="50px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
                                <td style="vertical-align:top">
                                    <def:datafieldcontrol runat="server" id="Datafieldcontrol8" DatabaseField="bot2_str_ae_hi_txt" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="20px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>

                            </tr>
                        </table>
                    </td>


                    <%--Descriptive Level--%>
                    
                    <%--Scaled Score--%>
                    <td>

                        <table>
                            <tr><td align="center"><b><br />Level</b></td></tr>
                            <tr>
                                <td style="vertical-align:top">
                                    <def:datafieldcontrol runat="server" id="Datafieldcontrol37" DatabaseField="bot2_fmp_lev" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="30px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
                                <td></td>
                            </tr>

                            <tr>
                                <td style="vertical-align:top">
                                    <def:datafieldcontrol runat="server" id="Datafieldcontrol38" DatabaseField="bot2_fmi_lev" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="30px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
                                <td></td>
                            </tr>

                            <tr>
                                <td style="vertical-align:top">
                                    <def:datafieldcontrol runat="server" id="Datafieldcontrol39" DatabaseField="bot2_md_lev" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="30px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
                                <td></td>
                            </tr>

                            <tr>
                                <td style="vertical-align:top">
                                    <def:datafieldcontrol runat="server" id="Datafieldcontrol40" DatabaseField="bot2_bic_lev" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="30px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
                                <td></td>
                            </tr>

                            <tr>
                                <td style="vertical-align:top">
                                    <def:datafieldcontrol runat="server" id="Datafieldcontrol44" DatabaseField="bot2_bal_lev" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="30px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
                                <td></td>
                            </tr>

                            <tr>
                                <td style="vertical-align:top">
                                    <def:datafieldcontrol runat="server" id="Datafieldcontrol45" DatabaseField="bot2_rsa_lev" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="30px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
                                <td></td>
                            </tr>

                            <tr>
                                <td style="vertical-align:top">
                                    <def:datafieldcontrol runat="server" id="Datafieldcontrol46" DatabaseField="bot2_ulc_lev" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="30px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
                                <td></td>
                            </tr>

                            <tr>
                                <td style="vertical-align:top">
                                    <def:datafieldcontrol runat="server" id="Datafieldcontrol47" DatabaseField="bot2_str_lev" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="30px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
                                <td></td>
                            </tr>
                        </table>
                    </td>

                    <%--Blank Column for spacing--%>
                    <td width="50px" ></td>

                    <%--Subscale Pairwise Comparisons--%>
                    <td>
                        <table>

    <tr>
                                <td align="center"><b>FMP</b></td>
                                <td align="center"><b>FMI</b></td>
                                <td align="center"><b>MD</b></td>
                                <td align="center"><b>BIC </b></td>
                                <td align="center"><b>BAL</b></td>
                                <td align="center"><b>RSA</b></td>
                                <td align="center"><b>ULC</b></td>
                                <td align="center"><b>STR</b></td>
                            </tr>
<tr>
<td align="center">----</td>
<td align="center"><def:datafieldcontrol runat="server" id="Datafieldcontrol9" DatabaseField="bot2_fmpfmi" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="10px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td align="center"><def:datafieldcontrol runat="server" id="Datafieldcontrol10" DatabaseField="bot2_fmpmd" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="10px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td align="center"><def:datafieldcontrol runat="server" id="Datafieldcontrol11" DatabaseField="bot2_fmpbic" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="10px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td align="center"><def:datafieldcontrol runat="server" id="Datafieldcontrol12" DatabaseField="bot2_fmpbal" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="10px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td align="center"><def:datafieldcontrol runat="server" id="Datafieldcontrol13" DatabaseField="bot2_fmprsa" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="10px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td align="center"><def:datafieldcontrol runat="server" id="Datafieldcontrol14" DatabaseField="bot2_fmpulc" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="10px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td align="center"><def:datafieldcontrol runat="server" id="Datafieldcontrol15" DatabaseField="bot2_fmpstr" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="10px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<tr>

<tr>
<td></td><td align="center">----</td>
<td align="center"><def:datafieldcontrol runat="server" id="Datafieldcontrol16" DatabaseField="bot2_fmimd" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="10px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td align="center"><def:datafieldcontrol runat="server" id="Datafieldcontrol17" DatabaseField="bot2_fmibic" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="10px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td align="center"><def:datafieldcontrol runat="server" id="Datafieldcontrol18" DatabaseField="bot2_fmibal" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="10px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td align="center"><def:datafieldcontrol runat="server" id="Datafieldcontrol19" DatabaseField="bot2_fmirsa" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="10px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td align="center"><def:datafieldcontrol runat="server" id="Datafieldcontrol20" DatabaseField="bot2_fmiulc" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="10px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td align="center"><def:datafieldcontrol runat="server" id="Datafieldcontrol21" DatabaseField="bot2_fmistr" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="10px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<tr>

<tr>
<td></td><td></td><td align="center">----</td>
<td align="center"><def:datafieldcontrol runat="server" id="Datafieldcontrol22" DatabaseField="bot2_md_bic" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="10px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td align="center"><def:datafieldcontrol runat="server" id="Datafieldcontrol23" DatabaseField="bot2_md_bal" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="10px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td align="center"><def:datafieldcontrol runat="server" id="Datafieldcontrol24" DatabaseField="bot2_md_rsa" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="10px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td align="center"><def:datafieldcontrol runat="server" id="Datafieldcontrol25" DatabaseField="bot2_md_ulc" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="10px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td align="center"><def:datafieldcontrol runat="server" id="Datafieldcontrol26" DatabaseField="bot2_md_str" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="10px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<tr>
<tr>
<td></td><td></td><td></td><td align="center">----</td>
<td align="center"><def:datafieldcontrol runat="server" id="Datafieldcontrol27" DatabaseField="bot2_bicbal" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="10px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td align="center"><def:datafieldcontrol runat="server" id="Datafieldcontrol28" DatabaseField="bot2_bicrsa" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="10px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td align="center"><def:datafieldcontrol runat="server" id="Datafieldcontrol29" DatabaseField="bot2_biculc" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="10px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td align="center"><def:datafieldcontrol runat="server" id="Datafieldcontrol30" DatabaseField="bot2_bicstr" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="10px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<tr>
<tr>
<td></td><td></td><td></td><td></td><td align="center">----</td>
<td align="center"><def:datafieldcontrol runat="server" id="Datafieldcontrol31" DatabaseField="bot2_balrsa" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="10px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td align="center"><def:datafieldcontrol runat="server" id="Datafieldcontrol32" DatabaseField="bot2_balulc" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="10px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td align="center"><def:datafieldcontrol runat="server" id="Datafieldcontrol33" DatabaseField="bot2_balstr" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="10px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<tr>
<tr>
<td></td><td></td><td></td><td></td><td></td><td align="center">----</td>
<td align="center"><def:datafieldcontrol runat="server" id="Datafieldcontrol34" DatabaseField="bot2_rsaulc" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="10px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td align="center"><def:datafieldcontrol runat="server" id="Datafieldcontrol35" DatabaseField="bot2_rsastr" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="10px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<tr>
<tr>
<td></td><td></td><td></td><td></td><td></td><td></td><td align="center">----</td>
<td align="center"><def:datafieldcontrol runat="server" id="Datafieldcontrol36" DatabaseField="bot2_ulcstr" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="10px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<tr>
<tr>
<td></td><td></td><td></td><td></td><td></td><td></td><td></td><td align="center">----</td>
</tr>
                        </table>
                    </td>

                </tr>


            </table>


            <br />
            <asp:Label ID="Comp" runat="server" Text="COMPOSITE SCORES" Font-Underline="true" Font-Bold="true" Font-Size="Medium"></asp:Label>
            <%--COMPOSITES--%>
            <table>
                <tr>
                    <td align="right"><b></b></td>
                    <td align="right"><b></b></td>
                                        <td width="50px"></td>
                    <td align="center"><b>Composite Pairwise Comparisons</b>
                    </td>
                </tr>

                <tr>
                    <td>
                        <table>
                            <tr>
                                <td align="right"><b>Std Scores</b></td>
                            </tr>
                            <tr>
                                <td style="vertical-align:top">
                                    <def:datafieldcontrol runat="server" id="bot2_fmc_ss" DatabaseField="bot2_fmc_ss" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="250px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
                                <td></td>
                            </tr>

                            <tr>
                                <td style="vertical-align:top">
                                    <def:datafieldcontrol runat="server" id="bot2_mc_ss" DatabaseField="bot2_mc_ss" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="250px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
                                <td></td>
                            </tr>

                            <tr>
                                <td style="vertical-align:top">
                                    <def:datafieldcontrol runat="server" id="bot2_boc_ss" DatabaseField="bot2_boc_ss" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="250px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
                                <td></td>
                            </tr>

                            <tr>
                                <td style="vertical-align:top">
                                    <def:datafieldcontrol runat="server" id="bot2_sa_ss" DatabaseField="bot2_sa_ss" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="250px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
                                <td></td>
                            </tr>

                            <tr>
                                <td style="vertical-align:top">
                                    <br /><br />
                                    <def:datafieldcontrol runat="server" id="bot2_tmc_ss" DatabaseField="bot2_tmc_ss" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="250px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
                                <td></td>
                            </tr>
                            <tr>
                                <td style="vertical-align:top">
                                    <def:datafieldcontrol runat="server" id="bot2_short_ss" DatabaseField="bot2_short_ss" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="250px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
                                <td></td>
                            </tr>

                        </table>
                    </td>
                    <td>
                        <table>
                            <tr>
                                <td align="center"><b>Level</b></td>
                            </tr>
                            <tr>
                                <td style="vertical-align:top">
                                    <def:datafieldcontrol runat="server" id="Datafieldcontrol50" DatabaseField="bot2_fmc_lev" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="30px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
                                <td></td>
                            </tr>

                            <tr>
                                <td style="vertical-align:top">
                                    <def:datafieldcontrol runat="server" id="Datafieldcontrol51" DatabaseField="bot2_mc_lev" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="30px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
                                <td></td>
                            </tr>

                            <tr>
                                <td style="vertical-align:top">
                                    <def:datafieldcontrol runat="server" id="Datafieldcontrol52" DatabaseField="bot2_boc_lev" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="30px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
                                <td></td>
                            </tr>

                            <tr>
                                <td style="vertical-align:top">
                                    <def:datafieldcontrol runat="server" id="Datafieldcontrol53" DatabaseField="bot2_sa_lev" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="30px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
                                <td></td>
                            </tr>

                            <tr>
                                <td style="vertical-align:top">
                                    <br /><br />
                                    <def:datafieldcontrol runat="server" id="Datafieldcontrol55" DatabaseField="bot2_tmc_lev" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="30px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
                                <td></td>
                            </tr>
                            <tr>
                                <td style="vertical-align:top">
                                    <def:datafieldcontrol runat="server" id="Datafieldcontrol56" DatabaseField="bot2_short_lev" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="30px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
                                <td></td>
                            </tr>

                        </table>
                    </td>


                    <td width="50px"></td>
                    <%--Composite Pairwise Comparisons--%>
                    <td style="vertical-align:top">
                        <table>
                           <tr>
                                <td align="center"><b>FMC</b></td>
                                <td align="center"><b>MC</b></td>
                                <td align="center"><b>BOC</b></td>
                                <td align="center"><b>SA</b></td>
                            </tr>
                            <tr>
                                <td align="center">----</td>
                                <td align="center"><def:datafieldcontrol runat="server" id="Datafieldcontrol41" DatabaseField="bot2_fmcmc" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="10px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
                                <td align="center"><def:datafieldcontrol runat="server" id="Datafieldcontrol42" DatabaseField="bot2_fmcboc" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="10px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
                                <td align="center"><def:datafieldcontrol runat="server" id="Datafieldcontrol43" DatabaseField="bot2_fmcsa" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="10px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
                            <tr>

                            <tr>
                                <td></td><td align="center">----</td>
                                <td align="center"><def:datafieldcontrol runat="server" id="Datafieldcontrol48" DatabaseField="bot2_mc_boc" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="10px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
                                <td align="center"><def:datafieldcontrol runat="server" id="Datafieldcontrol49" DatabaseField="bot2_mc_sa" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="10px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
                            <tr>

                            <tr>
                                <td></td><td></td><td align="center">----</td>
                                <td align="center"><def:datafieldcontrol runat="server" id="Datafieldcontrol54" DatabaseField="bot2_boc_sa" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="10px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
                            <tr>
                            <tr>
                                <td></td><td></td><td></td><td align="center">----</td>
                            </tr>
                        </table>

                    </td>

                    </tr>
            </table>

<br />&nbsp;&nbsp;
<def:datafieldcontrol runat="server" id="BOT2_scrmsg" DatabaseField="BOT2_scrmsg" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="250px" FieldTextBoxWidth="400px" FieldTextBoxHeight="40px" FieldTextBoxTextMode="multiline" FieldTextBoxMaxLength="250"></def:datafieldcontrol>
<br />
<br />
<asp:UpdatePanel ID="panel_full" runat="server" Visible="false" UpdateMode="Conditional">
    <ContentTemplate>
        <asp:Label ID="label_full" runat="server" Text="FULL FORM ITEM DATA ENTRY" Font-Size="Medium"></asp:Label>
        <asp:Label ID="label_short" runat="server" Text="SHORT FORM ITEM DATA ENTRY" Font-Size="Medium"></asp:Label>

            <table>
                <tr>
                    <td colspan="2">
                        <asp:Label ID="Label5" runat="server" Text="1. Fine Motor Precision" Font-Bold="true" Font-Underline="true" /></td>
                </tr>

                <tr>
                    <td style="vertical-align:top">
                        <def:datafieldcontrol runat="server" id="fmp01" DatabaseField="fmp01" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
                    <td></td>
                </tr>

                <tr>
                    <td style="vertical-align:top">
                        <def:datafieldcontrol runat="server" id="fmp02" DatabaseField="fmp02" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
                    <td></td>
                </tr>

                <tr>
                    <td style="vertical-align:top">
                        <def:datafieldcontrol runat="server" id="fmp03" DatabaseField="fmp03" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
                    <td></td>
                </tr>

                <tr>
                    <td style="vertical-align:top">
                        <def:datafieldcontrol runat="server" id="fmp04" DatabaseField="fmp04" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
                    <td></td>
                </tr>

                <tr>
                    <td style="vertical-align:top">
                        <def:datafieldcontrol runat="server" id="fmp05" DatabaseField="fmp05" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
                    <td></td>
                </tr>

                <tr>
                    <td style="vertical-align:top">
                        <def:datafieldcontrol runat="server" id="fmp06" DatabaseField="fmp06" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
                    <td></td>
                </tr>

                <tr>
                    <td style="vertical-align:top">
                        <def:datafieldcontrol runat="server" id="fmp07" DatabaseField="fmp07" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
                    <td></td>
                </tr>
                <tr>
                    <td colspan="2">
                        <asp:Label ID="Label4" runat="server" Text="2. Fine Motor Integration" Font-Bold="true" Font-Underline="true" /></td>
                </tr>

                <tr>
                    <td style="vertical-align:top">
                        <def:datafieldcontrol runat="server" id="fmi01" DatabaseField="fmi01" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
                    <td></td>
                </tr>

                <tr>
                    <td style="vertical-align:top">
                        <def:datafieldcontrol runat="server" id="fmi02" DatabaseField="fmi02" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
                    <td></td>
                </tr>

                <tr>
                    <td style="vertical-align:top">
                        <def:datafieldcontrol runat="server" id="fmi03" DatabaseField="fmi03" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
                    <td></td>
                </tr>

                <tr>
                    <td style="vertical-align:top">
                        <def:datafieldcontrol runat="server" id="fmi04" DatabaseField="fmi04" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
                    <td></td>
                </tr>

                <tr>
                    <td style="vertical-align:top">
                        <def:datafieldcontrol runat="server" id="fmi05" DatabaseField="fmi05" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
                    <td></td>
                </tr>

                <tr>
                    <td style="vertical-align:top">
                        <def:datafieldcontrol runat="server" id="fmi06" DatabaseField="fmi06" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
                    <td></td>
                </tr>

                <tr>
                    <td style="vertical-align:top">
                        <def:datafieldcontrol runat="server" id="fmi07" DatabaseField="fmi07" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
                    <td></td>
                </tr>

                <tr>
                    <td style="vertical-align:top">
                        <def:datafieldcontrol runat="server" id="fmi08" DatabaseField="fmi08" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
                    <td></td>
                </tr>
                <tr>
                    <td colspan="2">
                        <asp:Label ID="Label3" runat="server" Text="3. Manual Dexterity" Font-Bold="true" Font-Underline="true" /></td>
                </tr>

                <tr>
                    <td style="vertical-align:top">
                        <def:datafieldcontrol runat="server" id="md01" DatabaseField="md01" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
                    <td></td>
                </tr>

                <tr>
                    <td style="vertical-align:top">
                        <def:datafieldcontrol runat="server" id="md02" DatabaseField="md02" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
                    <td></td>
                </tr>

                <tr>
                    <td style="vertical-align:top">
                        <def:datafieldcontrol runat="server" id="md03" DatabaseField="md03" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
                    <td></td>
                </tr>

                <tr>
                    <td style="vertical-align:top">
                        <def:datafieldcontrol runat="server" id="md04" DatabaseField="md04" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
                    <td></td>
                </tr>

                <tr>
                    <td style="vertical-align:top">
                        <def:datafieldcontrol runat="server" id="md05" DatabaseField="md05" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
                    <td></td>
                </tr>
                <tr>
                    <td colspan="2">
                        <asp:Label ID="Label2" runat="server" Text="4. Bilateral Coordination" Font-Bold="true" Font-Underline="true" /></td>
                </tr>

                <tr>
                    <td style="vertical-align:top">
                        <def:datafieldcontrol runat="server" id="bc01" DatabaseField="bc01" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
                    <td></td>
                </tr>

                <tr>
                    <td style="vertical-align:top">
                        <def:datafieldcontrol runat="server" id="bc02" DatabaseField="bc02" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
                    <td></td>
                </tr>

                <tr>
                    <td style="vertical-align:top">
                        <def:datafieldcontrol runat="server" id="bc03" DatabaseField="bc03" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
                    <td></td>
                </tr>

                <tr>
                    <td style="vertical-align:top">
                        <def:datafieldcontrol runat="server" id="bc04" DatabaseField="bc04" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
                    <td></td>
                </tr>

                <tr>
                    <td style="vertical-align:top">
                        <def:datafieldcontrol runat="server" id="bc05" DatabaseField="bc05" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
                    <td></td>
                </tr>

                <tr>
                    <td style="vertical-align:top">
                        <def:datafieldcontrol runat="server" id="bc06" DatabaseField="bc06" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
                    <td></td>
                </tr>

                <tr>
                    <td style="vertical-align:top">
                        <def:datafieldcontrol runat="server" id="bc07" DatabaseField="bc07" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
                    <td></td>
                </tr>
                <tr>
                    <td colspan="2">
                        <asp:Label ID="Label1" runat="server" Text="5. Balance" Font-Bold="true" Font-Underline="true" /></td>
                </tr>

                <tr>
                    <td style="vertical-align:top">
                        <def:datafieldcontrol runat="server" id="bal01" DatabaseField="bal01" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
                    <td></td>
                </tr>

                <tr>
                    <td style="vertical-align:top">
                        <def:datafieldcontrol runat="server" id="bal02" DatabaseField="bal02" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
                    <td></td>
                </tr>

                <tr>
                    <td style="vertical-align:top">
                        <def:datafieldcontrol runat="server" id="bal03" DatabaseField="bal03" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
                    <td></td>
                </tr>

                <tr>
                    <td style="vertical-align:top">
                        <def:datafieldcontrol runat="server" id="bal04" DatabaseField="bal04" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
                    <td></td>
                </tr>

                <tr>
                    <td style="vertical-align:top">
                        <def:datafieldcontrol runat="server" id="bal05" DatabaseField="bal05" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
                    <td></td>
                </tr>

                <tr>
                    <td style="vertical-align:top">
                        <def:datafieldcontrol runat="server" id="bal06" DatabaseField="bal06" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
                    <td></td>
                </tr>

                <tr>
                    <td style="vertical-align:top">
                        <def:datafieldcontrol runat="server" id="bal07" DatabaseField="bal07" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
                    <td></td>
                </tr>

                <tr>
                    <td style="vertical-align:top">
                        <def:datafieldcontrol runat="server" id="bal08" DatabaseField="bal08" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
                    <td></td>
                </tr>

                <tr>
                    <td style="vertical-align:top">
                        <def:datafieldcontrol runat="server" id="bal09" DatabaseField="bal09" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
                    <td></td>
                </tr>
                <tr>
                    <td colspan="2">
                        <asp:Label ID="l1" runat="server" Text="6. Running Speed & Agility" Font-Bold="true" Font-Underline="true" /></td>
                </tr>
                <tr>
                    <td style="vertical-align:top">
                        <def:datafieldcontrol runat="server" id="rsa01" DatabaseField="rsa01" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
                    <td></td>
                </tr>

                <tr>
                    <td style="vertical-align:top">
                        <def:datafieldcontrol runat="server" id="rsa02" DatabaseField="rsa02" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
                    <td></td>
                </tr>

                <tr>
                    <td style="vertical-align:top">
                        <def:datafieldcontrol runat="server" id="rsa03" DatabaseField="rsa03" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
                    <td></td>
                </tr>

                <tr>
                    <td style="vertical-align:top">
                        <def:datafieldcontrol runat="server" id="rsa04" DatabaseField="rsa04" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
                    <td></td>
                </tr>

                <tr>
                    <td style="vertical-align:top">
                        <def:datafieldcontrol runat="server" id="rsa05" DatabaseField="rsa05" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
                    <td></td>
                </tr>
                <tr>
                    <td colspan="2">
                        <asp:Label ID="Label6" runat="server" Text="7. Upper-limb Coordination" Font-Bold="true" Font-Underline="true" /></td>
                </tr>
                <tr>
                    <td style="vertical-align:top">
                        <def:datafieldcontrol runat="server" id="ulc01" DatabaseField="ulc01" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
                    <td></td>
                </tr>

                <tr>
                    <td style="vertical-align:top">
                        <def:datafieldcontrol runat="server" id="ulc02" DatabaseField="ulc02" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
                    <td></td>
                </tr>

                <tr>
                    <td style="vertical-align:top">
                        <def:datafieldcontrol runat="server" id="ulc03" DatabaseField="ulc03" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
                    <td></td>
                </tr>

                <tr>
                    <td style="vertical-align:top">
                        <def:datafieldcontrol runat="server" id="ulc04" DatabaseField="ulc04" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
                    <td></td>
                </tr>

                <tr>
                    <td style="vertical-align:top">
                        <def:datafieldcontrol runat="server" id="ulc05" DatabaseField="ulc05" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
                    <td></td>
                </tr>

                <tr>
                    <td style="vertical-align:top">
                        <def:datafieldcontrol runat="server" id="ulc06" DatabaseField="ulc06" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
                    <td></td>
                </tr>

                <tr>
                    <td style="vertical-align:top">
                        <def:datafieldcontrol runat="server" id="ulc07" DatabaseField="ulc07" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
                    <td></td>
                </tr>
                <tr>
                    <td colspan="2">
                        <asp:Label ID="Label7" runat="server" Text="8. Strength" Font-Bold="true" Font-Underline="true" /></td>
                </tr>
                <tr>
                    <td style="vertical-align:top">
                        <def:datafieldcontrol runat="server" id="str01" DatabaseField="str01" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
                    <td></td>
                </tr>

                <tr>
                    <td style="vertical-align:top">
                        <def:datafieldcontrol runat="server" id="str02" DatabaseField="str02" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
                    <td></td>
                </tr>

                <tr>
                    <td style="vertical-align:top">
                        <def:datafieldcontrol runat="server" id="str03" DatabaseField="str03" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
                    <td></td>
                </tr>

                <tr>
                    <td style="vertical-align:top">
                        <def:datafieldcontrol runat="server" id="str04" DatabaseField="str04" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
                    <td></td>
                </tr>

                <tr>
                    <td style="vertical-align:top">
                        <def:datafieldcontrol runat="server" id="str05" DatabaseField="str05" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
                    <td></td>
                </tr>


            </table>

    </ContentTemplate>
</asp:UpdatePanel>



            <br />
            <br />
            <br />
            <table>
                <br />
                <br />
                <tr>
                    <td style="vertical-align:top">
                        <def:datafieldcontrol runat="server" id="created" DatabaseField="created" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="300px"></def:datafieldcontrol></td>
                    <td></td>
                </tr>

                <tr>
                    <td style="vertical-align:top">
                        <def:datafieldcontrol runat="server" id="createdBy" DatabaseField="createdBy" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="300px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="50"></def:datafieldcontrol></td>
                    <td></td>
                </tr>

                <tr>
                    <td style="vertical-align:top">
                        <def:datafieldcontrol runat="server" id="updated" DatabaseField="updated" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="300px" FormatString="{0:d}"></def:datafieldcontrol></td>
                    <td></td>
                </tr>

                <tr>
                    <td style="vertical-align:top">
                        <def:datafieldcontrol runat="server" id="updatedBy" DatabaseField="updatedBy" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="300px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="50"></def:datafieldcontrol></td>
                    <td></td>
                </tr>

                <tr>
                    <td style="vertical-align:top">
                        <def:datafieldcontrol runat="server" id="scored" DatabaseField="scored" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="300px"></def:datafieldcontrol></td>
                    <td></td>
                </tr>

                <tr>
                    <td style="vertical-align:top">
                        <def:datafieldcontrol runat="server" id="scoredBy" DatabaseField="scoredBy" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="300px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="50"></def:datafieldcontrol></td>
                    <td></td>
                </tr>

            </table>
        </ContentTemplate>
        <Triggers></Triggers>
    </asp:UpdatePanel>
</asp:Content>
