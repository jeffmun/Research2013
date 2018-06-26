<%@ Register TagPrefix="def" Namespace="DataEntryFramework3" %> 
<%@ Page language="c#" MasterPageFile="~/UWAC.master"  Title="FIU_Tadpol Data Entry" %>
<asp:Content ID="Content1" ContentPlaceHolderID="oBodyPlaceHolder" runat="server">

<def:dataentrycontroller id="DataEntryController1" runat="server" DatabaseTable="ALL_FIU_Tadpole" PrimaryKeyField="fiutad_pk">
</def:dataentrycontroller>
   <asp:ScriptManager ID="ScriptManager1" runat="server">    </asp:ScriptManager>
<asp:UpdatePanel ID="UpdatePanel1" runat="server">
  <ContentTemplate>


<table>

<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="id" DatabaseField="id" IsInsertField="true" FieldLabelWidth="300px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="15"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="indexnum" DatabaseField="indexnum" IsInsertField="true" FieldTextBoxTextDefault="1" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="fiu_date" DatabaseField="fiu_date" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FormatString="{0:d}" ></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="fiu_agemo" DatabaseField="fiu_agemo" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 

 
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="fiu_resp" DatabaseField="fiu_resp" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="300px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="50"></def:datafieldcontrol></td>
<td></td></tr>

<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="fiu_cmnt" DatabaseField="fiu_cmnt" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="300px" FieldTextBoxWidth="400px" FieldTextBoxHeight="40px" FieldTextBoxTextMode="multiline" FieldTextBoxMaxLength="250"></def:datafieldcontrol></td>
<td></td></tr>
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="fiu_scrmsg" DatabaseField="fiu_scrmsg" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="300px" FieldTextBoxWidth="400px" FieldTextBoxHeight="40px" FieldTextBoxTextMode="multiline" FieldTextBoxMaxLength="250"></def:datafieldcontrol></td>
<td></td></tr>
 
</table>



      <br/> <br/><asp:Label ID="Label46" runat="server" Text="A. General Family Information" Font-Bold="true" BackColor="Black" ForeColor="White" Font-Size="Medium"></asp:Label>

      <table><tr><td> <def:datafieldcontrol runat="server" id="Datafieldcontrol285" DatabaseField="fiu_newadditions" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="30px" FieldTextBoxMaxLength="50"></def:datafieldcontrol>

</td><td>            
    <font color="blue"><def:ValueSetLabel ID="ValueSetLabel1" runat="server"  DatabaseField="fiu_newadditions"></def:ValueSetLabel> </font>
</td>
          <td>
 <def:datafieldcontrol runat="server" id="Datafieldcontrol286" DatabaseField="fiu_newadditions_txt" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="100px" FieldTextBoxWidth="300px" FieldTextBoxMaxLength="150"></def:datafieldcontrol><br/>

          </td>
             </tr></table>
 <br/>

 <def:datafieldcontrol runat="server" id="Datafieldcontrol284" DatabaseField="fiu_numpeople" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="30px" FieldTextBoxMaxLength="50"></def:datafieldcontrol><br/>

        <asp:Label ID="Label55" runat="server" Text="3. Child's living situation" Font-Underline="false" Font-Bold="false"  Font-Size="Small"></asp:Label><br/>

<table>
    <tr>
        <td></td>
        <td> <asp:Label ID="Label56" runat="server" Text="Biological<br/>Mother<br/>(1 if checked)" Font-Underline="false" Font-Bold="true"  Font-Size="Smaller"></asp:Label></td>
        <td> <asp:Label ID="Label57" runat="server" Text="Biological<br/>Father<br/>(1 if checked)" Font-Underline="false" Font-Bold="true"  Font-Size="Smaller"></asp:Label></td>
        <td> <asp:Label ID="Label58" runat="server" Text="Other<br/>Primary<br/>Guardian<br/>(1 if checked)" Font-Underline="false" Font-Bold="true"  Font-Size="Smaller"></asp:Label></td>
        <td> <asp:Label ID="Label59" runat="server" Text="(specify)" Font-Underline="false" Font-Bold="true"  Font-Size="Smaller"></asp:Label></td>
        <td> <asp:Label ID="Label60" runat="server" Text="Percent time <br/>lives here (0-100)" Font-Underline="false" Font-Bold="true"  Font-Size="Smaller"></asp:Label></td>
</tr>
    <tr>
        <td> <asp:Label ID="Label61" runat="server" Text="Home #1" Font-Underline="false" Font-Bold="true"  Font-Size="Small"></asp:Label></td>
        <td> <def:datafieldcontrol runat="server" id="Datafieldcontrol269" DatabaseField="fiu_home1_biomo" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="10px" FieldTextBoxWidth="30px" FieldTextBoxMaxLength="50"></def:datafieldcontrol></td>
        <td> <def:datafieldcontrol runat="server" id="Datafieldcontrol270" DatabaseField="fiu_home1_biofa" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="10px" FieldTextBoxWidth="30px" FieldTextBoxMaxLength="50"></def:datafieldcontrol></td>
        <td> <def:datafieldcontrol runat="server" id="Datafieldcontrol271" DatabaseField="fiu_home1_opg" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="10px" FieldTextBoxWidth="30px" FieldTextBoxMaxLength="50"></def:datafieldcontrol></td>
        <td> <def:datafieldcontrol runat="server" id="Datafieldcontrol272" DatabaseField="fiu_home1_opg_txt" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="10px" FieldTextBoxWidth="150px" FieldTextBoxMaxLength="50"></def:datafieldcontrol></td>
        <td> <def:datafieldcontrol runat="server" id="Datafieldcontrol273" DatabaseField="fiu_home1_pct" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="10px" FieldTextBoxWidth="30px" FieldTextBoxMaxLength="50"></def:datafieldcontrol></td>
        
    </tr>

    <tr>
        <td> <asp:Label ID="Label62" runat="server" Text="Home #2" Font-Underline="false" Font-Bold="true"  Font-Size="Small"></asp:Label></td>
        <td> <def:datafieldcontrol runat="server" id="Datafieldcontrol274" DatabaseField="fiu_home2_biomo" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="10px" FieldTextBoxWidth="30px" FieldTextBoxMaxLength="50"></def:datafieldcontrol></td>
        <td> <def:datafieldcontrol runat="server" id="Datafieldcontrol275" DatabaseField="fiu_home2_biofa" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="10px" FieldTextBoxWidth="30px" FieldTextBoxMaxLength="50"></def:datafieldcontrol></td>
        <td> <def:datafieldcontrol runat="server" id="Datafieldcontrol276" DatabaseField="fiu_home2_opg" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="10px" FieldTextBoxWidth="30px" FieldTextBoxMaxLength="50"></def:datafieldcontrol></td>
        <td> <def:datafieldcontrol runat="server" id="Datafieldcontrol277" DatabaseField="fiu_home2_opg_txt" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="10px" FieldTextBoxWidth="150px" FieldTextBoxMaxLength="50"></def:datafieldcontrol></td>
        <td> <def:datafieldcontrol runat="server" id="Datafieldcontrol278" DatabaseField="fiu_home2_pct" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="10px" FieldTextBoxWidth="30px" FieldTextBoxMaxLength="50"></def:datafieldcontrol></td>
        
    </tr>

        <tr>
        <td> <asp:Label ID="Label63" runat="server" Text="Home #3" Font-Underline="false" Font-Bold="true"  Font-Size="Small"></asp:Label></td>
        <td> <def:datafieldcontrol runat="server" id="Datafieldcontrol279" DatabaseField="fiu_home3_biomo" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="10px" FieldTextBoxWidth="30px" FieldTextBoxMaxLength="50"></def:datafieldcontrol></td>
        <td> <def:datafieldcontrol runat="server" id="Datafieldcontrol280" DatabaseField="fiu_home3_biofa" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="10px" FieldTextBoxWidth="30px" FieldTextBoxMaxLength="50"></def:datafieldcontrol></td>
        <td> <def:datafieldcontrol runat="server" id="Datafieldcontrol281" DatabaseField="fiu_home3_opg" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="10px" FieldTextBoxWidth="30px" FieldTextBoxMaxLength="50"></def:datafieldcontrol></td>
        <td> <def:datafieldcontrol runat="server" id="Datafieldcontrol282" DatabaseField="fiu_home3_opg_txt" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="10px" FieldTextBoxWidth="150px" FieldTextBoxMaxLength="50"></def:datafieldcontrol></td>
        <td> <def:datafieldcontrol runat="server" id="Datafieldcontrol283" DatabaseField="fiu_home3_pct" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="10px" FieldTextBoxWidth="30px" FieldTextBoxMaxLength="50"></def:datafieldcontrol></td>
        
    </tr>

</table>





      <br/><br/>
  <asp:Label ID="Label53" runat="server" Text="4. Highest level of education" Font-Underline="false" Font-Bold="false"  Font-Size="Small"></asp:Label><br/>
<table>
    <tr><td>

        <table>

            <tr><td></td>
                <td>      <def:datafieldcontrol runat="server" id="Datafieldcontrol263" DatabaseField="fiu_moeduc" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="30px" FieldTextBoxMaxLength="50"></def:datafieldcontrol></td>
                </tr>
            <tr><td></td>
                <td>      <def:datafieldcontrol runat="server" id="Datafieldcontrol264" DatabaseField="fiu_faeduc" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="30px" FieldTextBoxMaxLength="50"></def:datafieldcontrol></td>
                </tr>

            <tr><td><def:datafieldcontrol runat="server" id="Datafieldcontrol265" DatabaseField="fiu_opc1educ_txt" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="150px" FieldTextBoxMaxLength="50"></def:datafieldcontrol></td>
                <td>      <def:datafieldcontrol runat="server" id="Datafieldcontrol266" DatabaseField="fiu_opc1educ" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="30px" FieldTextBoxMaxLength="50"></def:datafieldcontrol></td>
                </tr>
            <tr><td><def:datafieldcontrol runat="server" id="Datafieldcontrol267" DatabaseField="fiu_opc2educ_txt" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="150px" FieldTextBoxMaxLength="50"></def:datafieldcontrol></td>
                <td>      <def:datafieldcontrol runat="server" id="Datafieldcontrol268" DatabaseField="fiu_opc2educ" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="30px" FieldTextBoxMaxLength="50"></def:datafieldcontrol></td>
                </tr>
            </table>

        </td>
        <td>
            <font color="blue">
<def:ValueSetLabel ID="ValueSetLabel_fiu_moeduc" runat="server"  DatabaseField="fiu_moeduc"></def:ValueSetLabel>
 </font>
        </td>
    </tr>


</table>
      
      <br/>      <br/>
  <asp:Label ID="Label54" runat="server" Text="5. Current occupations" Font-Underline="false" Font-Bold="false"  Font-Size="Small"></asp:Label><br/>

        <table>

            <tr><td></td>
                <td>      <def:datafieldcontrol runat="server" id="Datafieldcontrol257" DatabaseField="fiu_moocc" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="150px" FieldTextBoxMaxLength="50"></def:datafieldcontrol></td>
                </tr>
            <tr><td></td>
                <td>      <def:datafieldcontrol runat="server" id="Datafieldcontrol258" DatabaseField="fiu_faocc" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="150px" FieldTextBoxMaxLength="50"></def:datafieldcontrol></td>
                </tr>

            <tr><td><def:datafieldcontrol runat="server" id="Datafieldcontrol261" DatabaseField="fiu_opc1occ_txt" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="150px" FieldTextBoxMaxLength="50"></def:datafieldcontrol></td>
                <td>      <def:datafieldcontrol runat="server" id="Datafieldcontrol259" DatabaseField="fiu_opc1occ" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="150px" FieldTextBoxMaxLength="50"></def:datafieldcontrol></td>
                </tr>
            <tr><td><def:datafieldcontrol runat="server" id="Datafieldcontrol262" DatabaseField="fiu_opc2occ_txt" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="150px" FieldTextBoxMaxLength="50"></def:datafieldcontrol></td>
                <td>      <def:datafieldcontrol runat="server" id="Datafieldcontrol260" DatabaseField="fiu_opc2occ" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="150px" FieldTextBoxMaxLength="50"></def:datafieldcontrol></td>
                </tr>
            </table>


      <br/>
      <def:datafieldcontrol runat="server" id="Datafieldcontrol256" DatabaseField="fiu_hhincome" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="150px" FieldTextBoxMaxLength="50"></def:datafieldcontrol><br/>

      <br/> <br/>
<asp:Label ID="Label47" runat="server" Text="B. Medical History Update" Font-Bold="true" BackColor="Black" ForeColor="White" Font-Size="Medium"></asp:Label>

<br/> <br/>
      <asp:Label ID="Label48" runat="server" Text="Social/Developmental . . . . (Enter 1 in cells that are checked)" Font-Bold="true"  Font-Size="Medium"></asp:Label><br/>

      <table>
    <tr>
        <td>
      <table>

            <tr>
        <td align="right"><b>Child</b></td>
        <td align="right"><b>Father</b></td>
        <td align="right"><b>Mother</b></td>
        <td align="right"><b>Sib 1</b></td>
        <td align="right"><b>Sib 2</b></td>
        <td align="right"><b>Sib 3</b></td>

            </tr>

 <tr>

   <td> <def:datafieldcontrol runat="server" id="fiu_medhx_a_ch" DatabaseField="fiu_medhx_a_ch" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="290px" FieldTextBoxWidth="20px"></def:datafieldcontrol> 
        <def:datafieldcontrol runat="server" id="fiu_medhx_b_ch" DatabaseField="fiu_medhx_b_ch" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="290px" FieldTextBoxWidth="20px"></def:datafieldcontrol> 
        <def:datafieldcontrol runat="server" id="fiu_medhx_c_ch" DatabaseField="fiu_medhx_c_ch" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="290px" FieldTextBoxWidth="20px"></def:datafieldcontrol> 
        <def:datafieldcontrol runat="server" id="fiu_medhx_d_ch" DatabaseField="fiu_medhx_d_ch" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="290px" FieldTextBoxWidth="20px"></def:datafieldcontrol> 
        <def:datafieldcontrol runat="server" id="fiu_medhx_e_ch" DatabaseField="fiu_medhx_e_ch" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="290px" FieldTextBoxWidth="20px"></def:datafieldcontrol> 
        <def:datafieldcontrol runat="server" id="fiu_medhx_f_ch" DatabaseField="fiu_medhx_f_ch" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="290px" FieldTextBoxWidth="20px"></def:datafieldcontrol> 
        <def:datafieldcontrol runat="server" id="fiu_medhx_g_ch" DatabaseField="fiu_medhx_g_ch" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="290px" FieldTextBoxWidth="20px"></def:datafieldcontrol> 
        <def:datafieldcontrol runat="server" id="fiu_medhx_h_ch" DatabaseField="fiu_medhx_h_ch" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="290px" FieldTextBoxWidth="20px"></def:datafieldcontrol>  </td>

   <td> <def:datafieldcontrol runat="server" id="Datafieldcontrol05" DatabaseField="fiu_medhx_a_fa" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="10px" FieldTextBoxWidth="20px"></def:datafieldcontrol> 
        <def:datafieldcontrol runat="server" id="Datafieldcontrol06" DatabaseField="fiu_medhx_b_fa" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="10px" FieldTextBoxWidth="20px"></def:datafieldcontrol> 
        <def:datafieldcontrol runat="server" id="Datafieldcontrol07" DatabaseField="fiu_medhx_c_fa" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="10px" FieldTextBoxWidth="20px"></def:datafieldcontrol> 
        <def:datafieldcontrol runat="server" id="Datafieldcontrol08" DatabaseField="fiu_medhx_d_fa" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="10px" FieldTextBoxWidth="20px"></def:datafieldcontrol> 
        <def:datafieldcontrol runat="server" id="Datafieldcontrol09" DatabaseField="fiu_medhx_e_fa" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="10px" FieldTextBoxWidth="20px"></def:datafieldcontrol> 
        <def:datafieldcontrol runat="server" id="Datafieldcontrol10" DatabaseField="fiu_medhx_f_fa" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="10px" FieldTextBoxWidth="20px"></def:datafieldcontrol> 
        <def:datafieldcontrol runat="server" id="Datafieldcontrol11" DatabaseField="fiu_medhx_g_fa" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="10px" FieldTextBoxWidth="20px"></def:datafieldcontrol> 
        <def:datafieldcontrol runat="server" id="Datafieldcontrol12" DatabaseField="fiu_medhx_h_fa" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="10px" FieldTextBoxWidth="20px"></def:datafieldcontrol>  </td>

   <td> <def:datafieldcontrol runat="server" id="Datafieldcontrol13" DatabaseField="fiu_medhx_a_mo" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="10px" FieldTextBoxWidth="20px"></def:datafieldcontrol> 
        <def:datafieldcontrol runat="server" id="Datafieldcontrol14" DatabaseField="fiu_medhx_b_mo" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="10px" FieldTextBoxWidth="20px"></def:datafieldcontrol> 
        <def:datafieldcontrol runat="server" id="Datafieldcontrol15" DatabaseField="fiu_medhx_c_mo" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="10px" FieldTextBoxWidth="20px"></def:datafieldcontrol> 
        <def:datafieldcontrol runat="server" id="Datafieldcontrol16" DatabaseField="fiu_medhx_d_mo" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="10px" FieldTextBoxWidth="20px"></def:datafieldcontrol> 
        <def:datafieldcontrol runat="server" id="Datafieldcontrol17" DatabaseField="fiu_medhx_e_mo" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="10px" FieldTextBoxWidth="20px"></def:datafieldcontrol> 
        <def:datafieldcontrol runat="server" id="Datafieldcontrol18" DatabaseField="fiu_medhx_f_mo" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="10px" FieldTextBoxWidth="20px"></def:datafieldcontrol> 
        <def:datafieldcontrol runat="server" id="Datafieldcontrol19" DatabaseField="fiu_medhx_g_mo" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="10px" FieldTextBoxWidth="20px"></def:datafieldcontrol> 
        <def:datafieldcontrol runat="server" id="Datafieldcontrol20" DatabaseField="fiu_medhx_h_mo" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="10px" FieldTextBoxWidth="20px"></def:datafieldcontrol>  </td>

   <td> <def:datafieldcontrol runat="server" id="Datafieldcontrol21" DatabaseField="fiu_medhx_a_s1" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="10px" FieldTextBoxWidth="20px"></def:datafieldcontrol> 
        <def:datafieldcontrol runat="server" id="Datafieldcontrol22" DatabaseField="fiu_medhx_b_s1" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="10px" FieldTextBoxWidth="20px"></def:datafieldcontrol> 
        <def:datafieldcontrol runat="server" id="Datafieldcontrol23" DatabaseField="fiu_medhx_c_s1" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="10px" FieldTextBoxWidth="20px"></def:datafieldcontrol> 
        <def:datafieldcontrol runat="server" id="Datafieldcontrol24" DatabaseField="fiu_medhx_d_s1" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="10px" FieldTextBoxWidth="20px"></def:datafieldcontrol> 
        <def:datafieldcontrol runat="server" id="Datafieldcontrol25" DatabaseField="fiu_medhx_e_s1" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="10px" FieldTextBoxWidth="20px"></def:datafieldcontrol> 
        <def:datafieldcontrol runat="server" id="Datafieldcontrol26" DatabaseField="fiu_medhx_f_s1" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="10px" FieldTextBoxWidth="20px"></def:datafieldcontrol> 
        <def:datafieldcontrol runat="server" id="Datafieldcontrol27" DatabaseField="fiu_medhx_g_s1" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="10px" FieldTextBoxWidth="20px"></def:datafieldcontrol> 
        <def:datafieldcontrol runat="server" id="Datafieldcontrol28" DatabaseField="fiu_medhx_h_s1" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="10px" FieldTextBoxWidth="20px"></def:datafieldcontrol>  </td>

   <td> <def:datafieldcontrol runat="server" id="Datafieldcontrol29" DatabaseField="fiu_medhx_a_s2" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="10px" FieldTextBoxWidth="20px"></def:datafieldcontrol> 
        <def:datafieldcontrol runat="server" id="Datafieldcontrol30" DatabaseField="fiu_medhx_b_s2" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="10px" FieldTextBoxWidth="20px"></def:datafieldcontrol> 
        <def:datafieldcontrol runat="server" id="Datafieldcontrol31" DatabaseField="fiu_medhx_c_s2" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="10px" FieldTextBoxWidth="20px"></def:datafieldcontrol> 
        <def:datafieldcontrol runat="server" id="Datafieldcontrol32" DatabaseField="fiu_medhx_d_s2" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="10px" FieldTextBoxWidth="20px"></def:datafieldcontrol> 
        <def:datafieldcontrol runat="server" id="Datafieldcontrol33" DatabaseField="fiu_medhx_e_s2" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="10px" FieldTextBoxWidth="20px"></def:datafieldcontrol> 
        <def:datafieldcontrol runat="server" id="Datafieldcontrol34" DatabaseField="fiu_medhx_f_s2" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="10px" FieldTextBoxWidth="20px"></def:datafieldcontrol> 
        <def:datafieldcontrol runat="server" id="Datafieldcontrol35" DatabaseField="fiu_medhx_g_s2" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="10px" FieldTextBoxWidth="20px"></def:datafieldcontrol> 
        <def:datafieldcontrol runat="server" id="Datafieldcontrol36" DatabaseField="fiu_medhx_h_s2" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="10px" FieldTextBoxWidth="20px"></def:datafieldcontrol>  </td>

   <td> <def:datafieldcontrol runat="server" id="Datafieldcontrol37" DatabaseField="fiu_medhx_a_s3" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="10px" FieldTextBoxWidth="20px"></def:datafieldcontrol> 
        <def:datafieldcontrol runat="server" id="Datafieldcontrol38" DatabaseField="fiu_medhx_b_s3" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="10px" FieldTextBoxWidth="20px"></def:datafieldcontrol> 
        <def:datafieldcontrol runat="server" id="Datafieldcontrol39" DatabaseField="fiu_medhx_c_s3" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="10px" FieldTextBoxWidth="20px"></def:datafieldcontrol> 
        <def:datafieldcontrol runat="server" id="Datafieldcontrol40" DatabaseField="fiu_medhx_d_s3" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="10px" FieldTextBoxWidth="20px"></def:datafieldcontrol> 
        <def:datafieldcontrol runat="server" id="Datafieldcontrol41" DatabaseField="fiu_medhx_e_s3" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="10px" FieldTextBoxWidth="20px"></def:datafieldcontrol> 
        <def:datafieldcontrol runat="server" id="Datafieldcontrol42" DatabaseField="fiu_medhx_f_s3" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="10px" FieldTextBoxWidth="20px"></def:datafieldcontrol> 
        <def:datafieldcontrol runat="server" id="Datafieldcontrol43" DatabaseField="fiu_medhx_g_s3" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="10px" FieldTextBoxWidth="20px"></def:datafieldcontrol> 
        <def:datafieldcontrol runat="server" id="Datafieldcontrol44" DatabaseField="fiu_medhx_h_s3" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="10px" FieldTextBoxWidth="20px"></def:datafieldcontrol>  </td>

 </tr>
</table>

            </td>       
        <td style="vertical-align:top">
             <def:datafieldcontrol runat="server" id="Datafieldcontrol287" DatabaseField="fiu_name_s1" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="100px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="100"></def:datafieldcontrol><br/>
             <def:datafieldcontrol runat="server" id="Datafieldcontrol288" DatabaseField="fiu_name_s2" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="100px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="100"></def:datafieldcontrol><br/>
             <def:datafieldcontrol runat="server" id="Datafieldcontrol289" DatabaseField="fiu_name_s3" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="100px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="100"></def:datafieldcontrol><br/>
        </td>
    </tr>

</table>

<br/> <br/>
      <asp:Label ID="Label49" runat="server" Text="Medical/Health" Font-Bold="true"  Font-Size="Medium"></asp:Label><br/>

      <table>

            <tr>
        <td align="right"><b>Child</b></td>
        <td align="right"><b>Father</b></td>
        <td align="right"><b>Mother</b></td>
        <td align="right"><b>Sib 1</b></td>
        <td align="right"><b>Sib 2</b></td>
        <td align="right"><b>Sib 3</b></td>

            </tr>
          <tr>
<td> 
<def:datafieldcontrol runat="server" id="fiu_medhx_i_ch" DatabaseField="fiu_medhx_i_ch" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="290px" FieldTextBoxWidth="20px"></def:datafieldcontrol> 
<def:datafieldcontrol runat="server" id="fiu_medhx_j_ch" DatabaseField="fiu_medhx_j_ch" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="290px" FieldTextBoxWidth="20px"></def:datafieldcontrol> 
<def:datafieldcontrol runat="server" id="fiu_medhx_k_ch" DatabaseField="fiu_medhx_k_ch" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="290px" FieldTextBoxWidth="20px"></def:datafieldcontrol> 
<def:datafieldcontrol runat="server" id="fiu_medhx_l_ch" DatabaseField="fiu_medhx_l_ch" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="290px" FieldTextBoxWidth="20px"></def:datafieldcontrol> 
<def:datafieldcontrol runat="server" id="fiu_medhx_m_ch" DatabaseField="fiu_medhx_m_ch" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="290px" FieldTextBoxWidth="20px"></def:datafieldcontrol> 
<def:datafieldcontrol runat="server" id="fiu_medhx_n_ch" DatabaseField="fiu_medhx_n_ch" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="290px" FieldTextBoxWidth="20px"></def:datafieldcontrol> 
<def:datafieldcontrol runat="server" id="fiu_medhx_o_ch" DatabaseField="fiu_medhx_o_ch" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="290px" FieldTextBoxWidth="20px"></def:datafieldcontrol> 
<def:datafieldcontrol runat="server" id="fiu_medhx_p_ch" DatabaseField="fiu_medhx_p_ch" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="290px" FieldTextBoxWidth="20px"></def:datafieldcontrol> 
<def:datafieldcontrol runat="server" id="fiu_medhx_q_ch" DatabaseField="fiu_medhx_q_ch" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="290px" FieldTextBoxWidth="20px"></def:datafieldcontrol> 
<def:datafieldcontrol runat="server" id="fiu_medhx_r_ch" DatabaseField="fiu_medhx_r_ch" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="290px" FieldTextBoxWidth="20px"></def:datafieldcontrol> 
<def:datafieldcontrol runat="server" id="fiu_medhx_s_ch" DatabaseField="fiu_medhx_s_ch" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="290px" FieldTextBoxWidth="20px"></def:datafieldcontrol> 
<def:datafieldcontrol runat="server" id="fiu_medhx_t_ch" DatabaseField="fiu_medhx_t_ch" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="290px" FieldTextBoxWidth="20px"></def:datafieldcontrol> 
<def:datafieldcontrol runat="server" id="fiu_medhx_u_ch" DatabaseField="fiu_medhx_u_ch" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="290px" FieldTextBoxWidth="20px"></def:datafieldcontrol> 
<def:datafieldcontrol runat="server" id="fiu_medhx_v_ch" DatabaseField="fiu_medhx_v_ch" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="290px" FieldTextBoxWidth="20px"></def:datafieldcontrol> 
<def:datafieldcontrol runat="server" id="fiu_medhx_w_ch" DatabaseField="fiu_medhx_w_ch" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="290px" FieldTextBoxWidth="20px"></def:datafieldcontrol> 
<def:datafieldcontrol runat="server" id="fiu_medhx_x_ch" DatabaseField="fiu_medhx_x_ch" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="290px" FieldTextBoxWidth="20px"></def:datafieldcontrol>  </td>

<td> 
<def:datafieldcontrol runat="server" id="Datafieldcontrol45" DatabaseField="fiu_medhx_i_fa" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="10px" FieldTextBoxWidth="20px"></def:datafieldcontrol> 
<def:datafieldcontrol runat="server" id="Datafieldcontrol46" DatabaseField="fiu_medhx_j_fa" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="10px" FieldTextBoxWidth="20px"></def:datafieldcontrol> 
<def:datafieldcontrol runat="server" id="Datafieldcontrol47" DatabaseField="fiu_medhx_k_fa" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="10px" FieldTextBoxWidth="20px"></def:datafieldcontrol> 
<def:datafieldcontrol runat="server" id="Datafieldcontrol48" DatabaseField="fiu_medhx_l_fa" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="10px" FieldTextBoxWidth="20px"></def:datafieldcontrol> 
<def:datafieldcontrol runat="server" id="Datafieldcontrol49" DatabaseField="fiu_medhx_m_fa" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="10px" FieldTextBoxWidth="20px"></def:datafieldcontrol> 
<def:datafieldcontrol runat="server" id="Datafieldcontrol50" DatabaseField="fiu_medhx_n_fa" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="10px" FieldTextBoxWidth="20px"></def:datafieldcontrol> 
<def:datafieldcontrol runat="server" id="Datafieldcontrol51" DatabaseField="fiu_medhx_o_fa" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="10px" FieldTextBoxWidth="20px"></def:datafieldcontrol> 
<def:datafieldcontrol runat="server" id="Datafieldcontrol52" DatabaseField="fiu_medhx_p_fa" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="10px" FieldTextBoxWidth="20px"></def:datafieldcontrol> 
<def:datafieldcontrol runat="server" id="Datafieldcontrol53" DatabaseField="fiu_medhx_q_fa" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="10px" FieldTextBoxWidth="20px"></def:datafieldcontrol> 
<def:datafieldcontrol runat="server" id="Datafieldcontrol54" DatabaseField="fiu_medhx_r_fa" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="10px" FieldTextBoxWidth="20px"></def:datafieldcontrol> 
<def:datafieldcontrol runat="server" id="Datafieldcontrol55" DatabaseField="fiu_medhx_s_fa" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="10px" FieldTextBoxWidth="20px"></def:datafieldcontrol> 
<def:datafieldcontrol runat="server" id="Datafieldcontrol56" DatabaseField="fiu_medhx_t_fa" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="10px" FieldTextBoxWidth="20px"></def:datafieldcontrol> 
<def:datafieldcontrol runat="server" id="Datafieldcontrol57" DatabaseField="fiu_medhx_u_fa" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="10px" FieldTextBoxWidth="20px"></def:datafieldcontrol> 
<def:datafieldcontrol runat="server" id="Datafieldcontrol58" DatabaseField="fiu_medhx_v_fa" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="10px" FieldTextBoxWidth="20px"></def:datafieldcontrol> 
<def:datafieldcontrol runat="server" id="Datafieldcontrol59" DatabaseField="fiu_medhx_w_fa" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="10px" FieldTextBoxWidth="20px"></def:datafieldcontrol> 
<def:datafieldcontrol runat="server" id="Datafieldcontrol60" DatabaseField="fiu_medhx_x_fa" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="10px" FieldTextBoxWidth="20px"></def:datafieldcontrol>  </td>

<td> 
<def:datafieldcontrol runat="server" id="Datafieldcontrol61" DatabaseField="fiu_medhx_i_mo" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="10px" FieldTextBoxWidth="20px"></def:datafieldcontrol> 
<def:datafieldcontrol runat="server" id="Datafieldcontrol62" DatabaseField="fiu_medhx_j_mo" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="10px" FieldTextBoxWidth="20px"></def:datafieldcontrol> 
<def:datafieldcontrol runat="server" id="Datafieldcontrol63" DatabaseField="fiu_medhx_k_mo" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="10px" FieldTextBoxWidth="20px"></def:datafieldcontrol> 
<def:datafieldcontrol runat="server" id="Datafieldcontrol64" DatabaseField="fiu_medhx_l_mo" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="10px" FieldTextBoxWidth="20px"></def:datafieldcontrol> 
<def:datafieldcontrol runat="server" id="Datafieldcontrol65" DatabaseField="fiu_medhx_m_mo" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="10px" FieldTextBoxWidth="20px"></def:datafieldcontrol> 
<def:datafieldcontrol runat="server" id="Datafieldcontrol66" DatabaseField="fiu_medhx_n_mo" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="10px" FieldTextBoxWidth="20px"></def:datafieldcontrol> 
<def:datafieldcontrol runat="server" id="Datafieldcontrol67" DatabaseField="fiu_medhx_o_mo" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="10px" FieldTextBoxWidth="20px"></def:datafieldcontrol> 
<def:datafieldcontrol runat="server" id="Datafieldcontrol68" DatabaseField="fiu_medhx_p_mo" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="10px" FieldTextBoxWidth="20px"></def:datafieldcontrol> 
<def:datafieldcontrol runat="server" id="Datafieldcontrol69" DatabaseField="fiu_medhx_q_mo" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="10px" FieldTextBoxWidth="20px"></def:datafieldcontrol> 
<def:datafieldcontrol runat="server" id="Datafieldcontrol70" DatabaseField="fiu_medhx_r_mo" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="10px" FieldTextBoxWidth="20px"></def:datafieldcontrol> 
<def:datafieldcontrol runat="server" id="Datafieldcontrol71" DatabaseField="fiu_medhx_s_mo" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="10px" FieldTextBoxWidth="20px"></def:datafieldcontrol> 
<def:datafieldcontrol runat="server" id="Datafieldcontrol72" DatabaseField="fiu_medhx_t_mo" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="10px" FieldTextBoxWidth="20px"></def:datafieldcontrol> 
<def:datafieldcontrol runat="server" id="Datafieldcontrol73" DatabaseField="fiu_medhx_u_mo" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="10px" FieldTextBoxWidth="20px"></def:datafieldcontrol> 
<def:datafieldcontrol runat="server" id="Datafieldcontrol74" DatabaseField="fiu_medhx_v_mo" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="10px" FieldTextBoxWidth="20px"></def:datafieldcontrol> 
<def:datafieldcontrol runat="server" id="Datafieldcontrol75" DatabaseField="fiu_medhx_w_mo" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="10px" FieldTextBoxWidth="20px"></def:datafieldcontrol> 
<def:datafieldcontrol runat="server" id="Datafieldcontrol76" DatabaseField="fiu_medhx_x_mo" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="10px" FieldTextBoxWidth="20px"></def:datafieldcontrol>  </td>

<td> 
<def:datafieldcontrol runat="server" id="Datafieldcontrol77" DatabaseField="fiu_medhx_i_s1" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="10px" FieldTextBoxWidth="20px"></def:datafieldcontrol> 
<def:datafieldcontrol runat="server" id="Datafieldcontrol78" DatabaseField="fiu_medhx_j_s1" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="10px" FieldTextBoxWidth="20px"></def:datafieldcontrol> 
<def:datafieldcontrol runat="server" id="Datafieldcontrol79" DatabaseField="fiu_medhx_k_s1" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="10px" FieldTextBoxWidth="20px"></def:datafieldcontrol> 
<def:datafieldcontrol runat="server" id="Datafieldcontrol80" DatabaseField="fiu_medhx_l_s1" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="10px" FieldTextBoxWidth="20px"></def:datafieldcontrol> 
<def:datafieldcontrol runat="server" id="Datafieldcontrol81" DatabaseField="fiu_medhx_m_s1" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="10px" FieldTextBoxWidth="20px"></def:datafieldcontrol> 
<def:datafieldcontrol runat="server" id="Datafieldcontrol82" DatabaseField="fiu_medhx_n_s1" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="10px" FieldTextBoxWidth="20px"></def:datafieldcontrol> 
<def:datafieldcontrol runat="server" id="Datafieldcontrol83" DatabaseField="fiu_medhx_o_s1" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="10px" FieldTextBoxWidth="20px"></def:datafieldcontrol> 
<def:datafieldcontrol runat="server" id="Datafieldcontrol84" DatabaseField="fiu_medhx_p_s1" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="10px" FieldTextBoxWidth="20px"></def:datafieldcontrol> 
<def:datafieldcontrol runat="server" id="Datafieldcontrol85" DatabaseField="fiu_medhx_q_s1" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="10px" FieldTextBoxWidth="20px"></def:datafieldcontrol> 
<def:datafieldcontrol runat="server" id="Datafieldcontrol86" DatabaseField="fiu_medhx_r_s1" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="10px" FieldTextBoxWidth="20px"></def:datafieldcontrol> 
<def:datafieldcontrol runat="server" id="Datafieldcontrol87" DatabaseField="fiu_medhx_s_s1" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="10px" FieldTextBoxWidth="20px"></def:datafieldcontrol> 
<def:datafieldcontrol runat="server" id="Datafieldcontrol88" DatabaseField="fiu_medhx_t_s1" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="10px" FieldTextBoxWidth="20px"></def:datafieldcontrol> 
<def:datafieldcontrol runat="server" id="Datafieldcontrol89" DatabaseField="fiu_medhx_u_s1" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="10px" FieldTextBoxWidth="20px"></def:datafieldcontrol> 
<def:datafieldcontrol runat="server" id="Datafieldcontrol90" DatabaseField="fiu_medhx_v_s1" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="10px" FieldTextBoxWidth="20px"></def:datafieldcontrol> 
<def:datafieldcontrol runat="server" id="Datafieldcontrol91" DatabaseField="fiu_medhx_w_s1" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="10px" FieldTextBoxWidth="20px"></def:datafieldcontrol> 
<def:datafieldcontrol runat="server" id="Datafieldcontrol92" DatabaseField="fiu_medhx_x_s1" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="10px" FieldTextBoxWidth="20px"></def:datafieldcontrol>  </td>

<td> 
<def:datafieldcontrol runat="server" id="Datafieldcontrol093" DatabaseField="fiu_medhx_i_s2" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="10px" FieldTextBoxWidth="20px"></def:datafieldcontrol> 
<def:datafieldcontrol runat="server" id="Datafieldcontrol094" DatabaseField="fiu_medhx_j_s2" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="10px" FieldTextBoxWidth="20px"></def:datafieldcontrol> 
<def:datafieldcontrol runat="server" id="Datafieldcontrol095" DatabaseField="fiu_medhx_k_s2" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="10px" FieldTextBoxWidth="20px"></def:datafieldcontrol> 
<def:datafieldcontrol runat="server" id="Datafieldcontrol096" DatabaseField="fiu_medhx_l_s2" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="10px" FieldTextBoxWidth="20px"></def:datafieldcontrol> 
<def:datafieldcontrol runat="server" id="Datafieldcontrol097" DatabaseField="fiu_medhx_m_s2" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="10px" FieldTextBoxWidth="20px"></def:datafieldcontrol> 
<def:datafieldcontrol runat="server" id="Datafieldcontrol098" DatabaseField="fiu_medhx_n_s2" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="10px" FieldTextBoxWidth="20px"></def:datafieldcontrol> 
<def:datafieldcontrol runat="server" id="Datafieldcontrol099" DatabaseField="fiu_medhx_o_s2" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="10px" FieldTextBoxWidth="20px"></def:datafieldcontrol> 
<def:datafieldcontrol runat="server" id="Datafieldcontrol100" DatabaseField="fiu_medhx_p_s2" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="10px" FieldTextBoxWidth="20px"></def:datafieldcontrol> 
<def:datafieldcontrol runat="server" id="Datafieldcontrol101" DatabaseField="fiu_medhx_q_s2" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="10px" FieldTextBoxWidth="20px"></def:datafieldcontrol> 
<def:datafieldcontrol runat="server" id="Datafieldcontrol102" DatabaseField="fiu_medhx_r_s2" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="10px" FieldTextBoxWidth="20px"></def:datafieldcontrol> 
<def:datafieldcontrol runat="server" id="Datafieldcontrol103" DatabaseField="fiu_medhx_s_s2" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="10px" FieldTextBoxWidth="20px"></def:datafieldcontrol> 
<def:datafieldcontrol runat="server" id="Datafieldcontrol104" DatabaseField="fiu_medhx_t_s2" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="10px" FieldTextBoxWidth="20px"></def:datafieldcontrol> 
<def:datafieldcontrol runat="server" id="Datafieldcontrol105" DatabaseField="fiu_medhx_u_s2" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="10px" FieldTextBoxWidth="20px"></def:datafieldcontrol> 
<def:datafieldcontrol runat="server" id="Datafieldcontrol106" DatabaseField="fiu_medhx_v_s2" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="10px" FieldTextBoxWidth="20px"></def:datafieldcontrol> 
<def:datafieldcontrol runat="server" id="Datafieldcontrol107" DatabaseField="fiu_medhx_w_s2" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="10px" FieldTextBoxWidth="20px"></def:datafieldcontrol> 
<def:datafieldcontrol runat="server" id="Datafieldcontrol108" DatabaseField="fiu_medhx_x_s2" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="10px" FieldTextBoxWidth="20px"></def:datafieldcontrol>  </td>

<td> 
<def:datafieldcontrol runat="server" id="Datafieldcontrol109" DatabaseField="fiu_medhx_i_s3" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="10px" FieldTextBoxWidth="20px"></def:datafieldcontrol> 
<def:datafieldcontrol runat="server" id="Datafieldcontrol110" DatabaseField="fiu_medhx_j_s3" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="10px" FieldTextBoxWidth="20px"></def:datafieldcontrol> 
<def:datafieldcontrol runat="server" id="Datafieldcontrol111" DatabaseField="fiu_medhx_k_s3" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="10px" FieldTextBoxWidth="20px"></def:datafieldcontrol> 
<def:datafieldcontrol runat="server" id="Datafieldcontrol112" DatabaseField="fiu_medhx_l_s3" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="10px" FieldTextBoxWidth="20px"></def:datafieldcontrol> 
<def:datafieldcontrol runat="server" id="Datafieldcontrol113" DatabaseField="fiu_medhx_m_s3" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="10px" FieldTextBoxWidth="20px"></def:datafieldcontrol> 
<def:datafieldcontrol runat="server" id="Datafieldcontrol114" DatabaseField="fiu_medhx_n_s3" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="10px" FieldTextBoxWidth="20px"></def:datafieldcontrol> 
<def:datafieldcontrol runat="server" id="Datafieldcontrol115" DatabaseField="fiu_medhx_o_s3" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="10px" FieldTextBoxWidth="20px"></def:datafieldcontrol> 
<def:datafieldcontrol runat="server" id="Datafieldcontrol116" DatabaseField="fiu_medhx_p_s3" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="10px" FieldTextBoxWidth="20px"></def:datafieldcontrol> 
<def:datafieldcontrol runat="server" id="Datafieldcontrol117" DatabaseField="fiu_medhx_q_s3" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="10px" FieldTextBoxWidth="20px"></def:datafieldcontrol> 
<def:datafieldcontrol runat="server" id="Datafieldcontrol118" DatabaseField="fiu_medhx_r_s3" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="10px" FieldTextBoxWidth="20px"></def:datafieldcontrol> 
<def:datafieldcontrol runat="server" id="Datafieldcontrol119" DatabaseField="fiu_medhx_s_s3" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="10px" FieldTextBoxWidth="20px"></def:datafieldcontrol> 
<def:datafieldcontrol runat="server" id="Datafieldcontrol120" DatabaseField="fiu_medhx_t_s3" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="10px" FieldTextBoxWidth="20px"></def:datafieldcontrol> 
<def:datafieldcontrol runat="server" id="Datafieldcontrol121" DatabaseField="fiu_medhx_u_s3" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="10px" FieldTextBoxWidth="20px"></def:datafieldcontrol> 
<def:datafieldcontrol runat="server" id="Datafieldcontrol122" DatabaseField="fiu_medhx_v_s3" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="10px" FieldTextBoxWidth="20px"></def:datafieldcontrol> 
<def:datafieldcontrol runat="server" id="Datafieldcontrol123" DatabaseField="fiu_medhx_w_s3" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="10px" FieldTextBoxWidth="20px"></def:datafieldcontrol> 
<def:datafieldcontrol runat="server" id="Datafieldcontrol124" DatabaseField="fiu_medhx_x_s3" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="10px" FieldTextBoxWidth="20px"></def:datafieldcontrol>  </td>



          </tr>

    </table>


      <br/> <br/>
      <asp:Label ID="Label50" runat="server" Text="Psychological/Psychiatric" Font-Bold="true"  Font-Size="Medium"></asp:Label><br/>

      <table>

            <tr>
        <td align="right"><b>Child</b></td>
        <td align="right"><b>Father</b></td>
        <td align="right"><b>Mother</b></td>
        <td align="right"><b>Sib 1</b></td>
        <td align="right"><b>Sib 2</b></td>
        <td align="right"><b>Sib 3</b></td>

            </tr>
<tr>
    <td> 
<def:datafieldcontrol runat="server" id="Datafieldcontrol195" DatabaseField="fiu_medhx_y_ch" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="290px" FieldTextBoxWidth="20px"></def:datafieldcontrol> 
<def:datafieldcontrol runat="server" id="Datafieldcontrol196" DatabaseField="fiu_medhx_z_ch" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="290px" FieldTextBoxWidth="20px"></def:datafieldcontrol> 
<def:datafieldcontrol runat="server" id="fiu_medhx_aa_ch" DatabaseField="fiu_medhx_aa_ch" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="290px" FieldTextBoxWidth="20px"></def:datafieldcontrol> 
<def:datafieldcontrol runat="server" id="fiu_medhx_bb_ch" DatabaseField="fiu_medhx_bb_ch" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="290px" FieldTextBoxWidth="20px"></def:datafieldcontrol> 
<def:datafieldcontrol runat="server" id="fiu_medhx_cc_ch" DatabaseField="fiu_medhx_cc_ch" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="290px" FieldTextBoxWidth="20px"></def:datafieldcontrol> 
<def:datafieldcontrol runat="server" id="fiu_medhx_dd_ch" DatabaseField="fiu_medhx_dd_ch" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="290px" FieldTextBoxWidth="20px"></def:datafieldcontrol> 
<def:datafieldcontrol runat="server" id="fiu_medhx_ee_ch" DatabaseField="fiu_medhx_ee_ch" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="290px" FieldTextBoxWidth="20px"></def:datafieldcontrol> 
<def:datafieldcontrol runat="server" id="fiu_medhx_ff_ch" DatabaseField="fiu_medhx_ff_ch" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="290px" FieldTextBoxWidth="20px"></def:datafieldcontrol> 
<def:datafieldcontrol runat="server" id="fiu_medhx_gg_ch" DatabaseField="fiu_medhx_gg_ch" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="290px" FieldTextBoxWidth="20px"></def:datafieldcontrol> 
<def:datafieldcontrol runat="server" id="fiu_medhx_hh_ch" DatabaseField="fiu_medhx_hh_ch" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="290px" FieldTextBoxWidth="20px"></def:datafieldcontrol> 
<def:datafieldcontrol runat="server" id="fiu_medhx_ii_ch" DatabaseField="fiu_medhx_ii_ch" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="290px" FieldTextBoxWidth="20px"></def:datafieldcontrol> 
<def:datafieldcontrol runat="server" id="fiu_medhx_jj_ch" DatabaseField="fiu_medhx_jj_ch" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="290px" FieldTextBoxWidth="20px"></def:datafieldcontrol> 
<def:datafieldcontrol runat="server" id="fiu_medhx_kk_ch" DatabaseField="fiu_medhx_kk_ch" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="290px" FieldTextBoxWidth="20px"></def:datafieldcontrol> 
<def:datafieldcontrol runat="server" id="fiu_medhx_ll_ch" DatabaseField="fiu_medhx_ll_ch" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="290px" FieldTextBoxWidth="20px"></def:datafieldcontrol> 
 </td>

    <td> 
<def:datafieldcontrol runat="server" id="Datafieldcontrol197" DatabaseField="fiu_medhx_y_fa" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="10px" FieldTextBoxWidth="20px"></def:datafieldcontrol> 
<def:datafieldcontrol runat="server" id="Datafieldcontrol198" DatabaseField="fiu_medhx_z_fa" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="10px" FieldTextBoxWidth="20px"></def:datafieldcontrol> 
<def:datafieldcontrol runat="server" id="Datafieldcontrol125" DatabaseField="fiu_medhx_aa_fa" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="10px" FieldTextBoxWidth="20px"></def:datafieldcontrol> 
<def:datafieldcontrol runat="server" id="Datafieldcontrol126" DatabaseField="fiu_medhx_bb_fa" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="10px" FieldTextBoxWidth="20px"></def:datafieldcontrol> 
<def:datafieldcontrol runat="server" id="Datafieldcontrol127" DatabaseField="fiu_medhx_cc_fa" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="10px" FieldTextBoxWidth="20px"></def:datafieldcontrol> 
<def:datafieldcontrol runat="server" id="Datafieldcontrol128" DatabaseField="fiu_medhx_dd_fa" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="10px" FieldTextBoxWidth="20px"></def:datafieldcontrol> 
<def:datafieldcontrol runat="server" id="Datafieldcontrol129" DatabaseField="fiu_medhx_ee_fa" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="10px" FieldTextBoxWidth="20px"></def:datafieldcontrol> 
<def:datafieldcontrol runat="server" id="Datafieldcontrol130" DatabaseField="fiu_medhx_ff_fa" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="10px" FieldTextBoxWidth="20px"></def:datafieldcontrol> 
<def:datafieldcontrol runat="server" id="Datafieldcontrol131" DatabaseField="fiu_medhx_gg_fa" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="10px" FieldTextBoxWidth="20px"></def:datafieldcontrol> 
<def:datafieldcontrol runat="server" id="Datafieldcontrol132" DatabaseField="fiu_medhx_hh_fa" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="10px" FieldTextBoxWidth="20px"></def:datafieldcontrol> 
<def:datafieldcontrol runat="server" id="Datafieldcontrol133" DatabaseField="fiu_medhx_ii_fa" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="10px" FieldTextBoxWidth="20px"></def:datafieldcontrol> 
<def:datafieldcontrol runat="server" id="Datafieldcontrol134" DatabaseField="fiu_medhx_jj_fa" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="10px" FieldTextBoxWidth="20px"></def:datafieldcontrol> 
<def:datafieldcontrol runat="server" id="Datafieldcontrol135" DatabaseField="fiu_medhx_kk_fa" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="10px" FieldTextBoxWidth="20px"></def:datafieldcontrol> 
<def:datafieldcontrol runat="server" id="Datafieldcontrol136" DatabaseField="fiu_medhx_ll_fa" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="10px" FieldTextBoxWidth="20px"></def:datafieldcontrol> 
 </td>

    <td> 
<def:datafieldcontrol runat="server" id="Datafieldcontrol199" DatabaseField="fiu_medhx_y_mo" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="10px" FieldTextBoxWidth="20px"></def:datafieldcontrol> 
<def:datafieldcontrol runat="server" id="Datafieldcontrol200" DatabaseField="fiu_medhx_z_mo" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="10px" FieldTextBoxWidth="20px"></def:datafieldcontrol> 
<def:datafieldcontrol runat="server" id="Datafieldcontrol139" DatabaseField="fiu_medhx_aa_mo" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="10px" FieldTextBoxWidth="20px"></def:datafieldcontrol> 
<def:datafieldcontrol runat="server" id="Datafieldcontrol140" DatabaseField="fiu_medhx_bb_mo" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="10px" FieldTextBoxWidth="20px"></def:datafieldcontrol> 
<def:datafieldcontrol runat="server" id="Datafieldcontrol141" DatabaseField="fiu_medhx_cc_mo" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="10px" FieldTextBoxWidth="20px"></def:datafieldcontrol> 
<def:datafieldcontrol runat="server" id="Datafieldcontrol142" DatabaseField="fiu_medhx_dd_mo" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="10px" FieldTextBoxWidth="20px"></def:datafieldcontrol> 
<def:datafieldcontrol runat="server" id="Datafieldcontrol143" DatabaseField="fiu_medhx_ee_mo" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="10px" FieldTextBoxWidth="20px"></def:datafieldcontrol> 
<def:datafieldcontrol runat="server" id="Datafieldcontrol144" DatabaseField="fiu_medhx_ff_mo" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="10px" FieldTextBoxWidth="20px"></def:datafieldcontrol> 
<def:datafieldcontrol runat="server" id="Datafieldcontrol145" DatabaseField="fiu_medhx_gg_mo" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="10px" FieldTextBoxWidth="20px"></def:datafieldcontrol> 
<def:datafieldcontrol runat="server" id="Datafieldcontrol146" DatabaseField="fiu_medhx_hh_mo" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="10px" FieldTextBoxWidth="20px"></def:datafieldcontrol> 
<def:datafieldcontrol runat="server" id="Datafieldcontrol147" DatabaseField="fiu_medhx_ii_mo" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="10px" FieldTextBoxWidth="20px"></def:datafieldcontrol> 
<def:datafieldcontrol runat="server" id="Datafieldcontrol148" DatabaseField="fiu_medhx_jj_mo" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="10px" FieldTextBoxWidth="20px"></def:datafieldcontrol> 
<def:datafieldcontrol runat="server" id="Datafieldcontrol149" DatabaseField="fiu_medhx_kk_mo" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="10px" FieldTextBoxWidth="20px"></def:datafieldcontrol> 
<def:datafieldcontrol runat="server" id="Datafieldcontrol150" DatabaseField="fiu_medhx_ll_mo" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="10px" FieldTextBoxWidth="20px"></def:datafieldcontrol> 
 </td>

        <td> 
<def:datafieldcontrol runat="server" id="Datafieldcontrol201" DatabaseField="fiu_medhx_y_s1" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="10px" FieldTextBoxWidth="20px"></def:datafieldcontrol> 
<def:datafieldcontrol runat="server" id="Datafieldcontrol202" DatabaseField="fiu_medhx_z_s1" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="10px" FieldTextBoxWidth="20px"></def:datafieldcontrol> 
<def:datafieldcontrol runat="server" id="Datafieldcontrol153" DatabaseField="fiu_medhx_aa_s1" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="10px" FieldTextBoxWidth="20px"></def:datafieldcontrol> 
<def:datafieldcontrol runat="server" id="Datafieldcontrol154" DatabaseField="fiu_medhx_bb_s1" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="10px" FieldTextBoxWidth="20px"></def:datafieldcontrol> 
<def:datafieldcontrol runat="server" id="Datafieldcontrol155" DatabaseField="fiu_medhx_cc_s1" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="10px" FieldTextBoxWidth="20px"></def:datafieldcontrol> 
<def:datafieldcontrol runat="server" id="Datafieldcontrol156" DatabaseField="fiu_medhx_dd_s1" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="10px" FieldTextBoxWidth="20px"></def:datafieldcontrol> 
<def:datafieldcontrol runat="server" id="Datafieldcontrol157" DatabaseField="fiu_medhx_ee_s1" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="10px" FieldTextBoxWidth="20px"></def:datafieldcontrol> 
<def:datafieldcontrol runat="server" id="Datafieldcontrol158" DatabaseField="fiu_medhx_ff_s1" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="10px" FieldTextBoxWidth="20px"></def:datafieldcontrol> 
<def:datafieldcontrol runat="server" id="Datafieldcontrol159" DatabaseField="fiu_medhx_gg_s1" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="10px" FieldTextBoxWidth="20px"></def:datafieldcontrol> 
<def:datafieldcontrol runat="server" id="Datafieldcontrol160" DatabaseField="fiu_medhx_hh_s1" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="10px" FieldTextBoxWidth="20px"></def:datafieldcontrol> 
<def:datafieldcontrol runat="server" id="Datafieldcontrol161" DatabaseField="fiu_medhx_ii_s1" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="10px" FieldTextBoxWidth="20px"></def:datafieldcontrol> 
<def:datafieldcontrol runat="server" id="Datafieldcontrol162" DatabaseField="fiu_medhx_jj_s1" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="10px" FieldTextBoxWidth="20px"></def:datafieldcontrol> 
<def:datafieldcontrol runat="server" id="Datafieldcontrol163" DatabaseField="fiu_medhx_kk_s1" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="10px" FieldTextBoxWidth="20px"></def:datafieldcontrol> 
<def:datafieldcontrol runat="server" id="Datafieldcontrol164" DatabaseField="fiu_medhx_ll_s1" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="10px" FieldTextBoxWidth="20px"></def:datafieldcontrol> 
        </td>

        <td> 
<def:datafieldcontrol runat="server" id="Datafieldcontrol203" DatabaseField="fiu_medhx_y_s2" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="10px" FieldTextBoxWidth="20px"></def:datafieldcontrol> 
<def:datafieldcontrol runat="server" id="Datafieldcontrol204" DatabaseField="fiu_medhx_z_s2" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="10px" FieldTextBoxWidth="20px"></def:datafieldcontrol> 
<def:datafieldcontrol runat="server" id="Datafieldcontrol167" DatabaseField="fiu_medhx_aa_s2" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="10px" FieldTextBoxWidth="20px"></def:datafieldcontrol> 
<def:datafieldcontrol runat="server" id="Datafieldcontrol168" DatabaseField="fiu_medhx_bb_s2" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="10px" FieldTextBoxWidth="20px"></def:datafieldcontrol> 
<def:datafieldcontrol runat="server" id="Datafieldcontrol169" DatabaseField="fiu_medhx_cc_s2" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="10px" FieldTextBoxWidth="20px"></def:datafieldcontrol> 
<def:datafieldcontrol runat="server" id="Datafieldcontrol170" DatabaseField="fiu_medhx_dd_s2" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="10px" FieldTextBoxWidth="20px"></def:datafieldcontrol> 
<def:datafieldcontrol runat="server" id="Datafieldcontrol171" DatabaseField="fiu_medhx_ee_s2" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="10px" FieldTextBoxWidth="20px"></def:datafieldcontrol> 
<def:datafieldcontrol runat="server" id="Datafieldcontrol172" DatabaseField="fiu_medhx_ff_s2" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="10px" FieldTextBoxWidth="20px"></def:datafieldcontrol> 
<def:datafieldcontrol runat="server" id="Datafieldcontrol173" DatabaseField="fiu_medhx_gg_s2" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="10px" FieldTextBoxWidth="20px"></def:datafieldcontrol> 
<def:datafieldcontrol runat="server" id="Datafieldcontrol174" DatabaseField="fiu_medhx_hh_s2" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="10px" FieldTextBoxWidth="20px"></def:datafieldcontrol> 
<def:datafieldcontrol runat="server" id="Datafieldcontrol175" DatabaseField="fiu_medhx_ii_s2" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="10px" FieldTextBoxWidth="20px"></def:datafieldcontrol> 
<def:datafieldcontrol runat="server" id="Datafieldcontrol176" DatabaseField="fiu_medhx_jj_s2" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="10px" FieldTextBoxWidth="20px"></def:datafieldcontrol> 
<def:datafieldcontrol runat="server" id="Datafieldcontrol177" DatabaseField="fiu_medhx_kk_s2" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="10px" FieldTextBoxWidth="20px"></def:datafieldcontrol> 
<def:datafieldcontrol runat="server" id="Datafieldcontrol178" DatabaseField="fiu_medhx_ll_s2" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="10px" FieldTextBoxWidth="20px"></def:datafieldcontrol> 

        </td>

        <td> 
<def:datafieldcontrol runat="server" id="Datafieldcontrol205" DatabaseField="fiu_medhx_y_s3" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="10px" FieldTextBoxWidth="20px"></def:datafieldcontrol> 
<def:datafieldcontrol runat="server" id="Datafieldcontrol206" DatabaseField="fiu_medhx_z_s3" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="10px" FieldTextBoxWidth="20px"></def:datafieldcontrol> 
<def:datafieldcontrol runat="server" id="Datafieldcontrol181" DatabaseField="fiu_medhx_aa_s3" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="10px" FieldTextBoxWidth="20px"></def:datafieldcontrol> 
<def:datafieldcontrol runat="server" id="Datafieldcontrol182" DatabaseField="fiu_medhx_bb_s3" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="10px" FieldTextBoxWidth="20px"></def:datafieldcontrol> 
<def:datafieldcontrol runat="server" id="Datafieldcontrol183" DatabaseField="fiu_medhx_cc_s3" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="10px" FieldTextBoxWidth="20px"></def:datafieldcontrol> 
<def:datafieldcontrol runat="server" id="Datafieldcontrol184" DatabaseField="fiu_medhx_dd_s3" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="10px" FieldTextBoxWidth="20px"></def:datafieldcontrol> 
<def:datafieldcontrol runat="server" id="Datafieldcontrol185" DatabaseField="fiu_medhx_ee_s3" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="10px" FieldTextBoxWidth="20px"></def:datafieldcontrol> 
<def:datafieldcontrol runat="server" id="Datafieldcontrol186" DatabaseField="fiu_medhx_ff_s3" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="10px" FieldTextBoxWidth="20px"></def:datafieldcontrol> 
<def:datafieldcontrol runat="server" id="Datafieldcontrol187" DatabaseField="fiu_medhx_gg_s3" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="10px" FieldTextBoxWidth="20px"></def:datafieldcontrol> 
<def:datafieldcontrol runat="server" id="Datafieldcontrol188" DatabaseField="fiu_medhx_hh_s3" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="10px" FieldTextBoxWidth="20px"></def:datafieldcontrol> 
<def:datafieldcontrol runat="server" id="Datafieldcontrol189" DatabaseField="fiu_medhx_ii_s3" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="10px" FieldTextBoxWidth="20px"></def:datafieldcontrol> 
<def:datafieldcontrol runat="server" id="Datafieldcontrol190" DatabaseField="fiu_medhx_jj_s3" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="10px" FieldTextBoxWidth="20px"></def:datafieldcontrol> 
<def:datafieldcontrol runat="server" id="Datafieldcontrol191" DatabaseField="fiu_medhx_kk_s3" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="10px" FieldTextBoxWidth="20px"></def:datafieldcontrol> 
<def:datafieldcontrol runat="server" id="Datafieldcontrol192" DatabaseField="fiu_medhx_ll_s3" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="10px" FieldTextBoxWidth="20px"></def:datafieldcontrol> 

        </td>

</tr>


    </table>


      <br/> <br/>
      <asp:Label ID="Label51" runat="server" Text="Other Medical Conditions (specify:)" Font-Bold="true"  Font-Size="Medium"></asp:Label><br/>

      <table>

            <tr>
        <td align="right"><b>Child</b></td>
        <td align="right"><b>Father</b></td>
        <td align="right"><b>Mother</b></td>
        <td align="right"><b>Sib 1</b></td>
        <td align="right"><b>Sib 2</b></td>
        <td align="right"><b>Sib 3</b></td>
        <td align="left"><b>Notes</b></td>

            </tr>

          <tr>
<td> 
<def:datafieldcontrol runat="server" id="Datafieldcontrol193"  DatabaseField="fiu_medhx_mm_ch" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="290px" FieldTextBoxWidth="20px"></def:datafieldcontrol> 
<def:datafieldcontrol runat="server" id="Datafieldcontrol194"  DatabaseField="fiu_medhx_nn_ch" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="290px" FieldTextBoxWidth="20px"></def:datafieldcontrol>  
<def:datafieldcontrol runat="server" id="fiu_medhx_oo_ch1"     DatabaseField="fiu_medhx_oo_ch" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="290px" FieldTextBoxWidth="20px"></def:datafieldcontrol> 
<def:datafieldcontrol runat="server" id="fiu_medhx_pp_ch1"     DatabaseField="fiu_medhx_pp_ch" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="290px" FieldTextBoxWidth="20px"></def:datafieldcontrol> 
<def:datafieldcontrol runat="server" id="fiu_medhx_qq_ch1"     DatabaseField="fiu_medhx_qq_ch" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="290px" FieldTextBoxWidth="20px"></def:datafieldcontrol> 
<def:datafieldcontrol runat="server" id="fiu_medhx_rr_ch1"     DatabaseField="fiu_medhx_rr_ch" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="290px" FieldTextBoxWidth="20px"></def:datafieldcontrol> 
</td>

<td> 
<def:datafieldcontrol runat="server" id="Datafieldcontrol207" DatabaseField="fiu_medhx_mm_fa" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="10px" FieldTextBoxWidth="20px"></def:datafieldcontrol> 
<def:datafieldcontrol runat="server" id="Datafieldcontrol208" DatabaseField="fiu_medhx_nn_fa" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="10px" FieldTextBoxWidth="20px"></def:datafieldcontrol>  
<def:datafieldcontrol runat="server" id="Datafieldcontrol209" DatabaseField="fiu_medhx_oo_fa" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="10px" FieldTextBoxWidth="20px"></def:datafieldcontrol> 
<def:datafieldcontrol runat="server" id="Datafieldcontrol210" DatabaseField="fiu_medhx_pp_fa" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="10px" FieldTextBoxWidth="20px"></def:datafieldcontrol> 
<def:datafieldcontrol runat="server" id="Datafieldcontrol211" DatabaseField="fiu_medhx_qq_fa" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="10px" FieldTextBoxWidth="20px"></def:datafieldcontrol> 
<def:datafieldcontrol runat="server" id="Datafieldcontrol212" DatabaseField="fiu_medhx_rr_fa" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="10px" FieldTextBoxWidth="20px"></def:datafieldcontrol> 
</td>

<td> 
<def:datafieldcontrol runat="server" id="Datafieldcontrol213" DatabaseField="fiu_medhx_mm_mo" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="10px" FieldTextBoxWidth="20px"></def:datafieldcontrol> 
<def:datafieldcontrol runat="server" id="Datafieldcontrol214" DatabaseField="fiu_medhx_nn_mo" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="10px" FieldTextBoxWidth="20px"></def:datafieldcontrol>  
<def:datafieldcontrol runat="server" id="Datafieldcontrol215" DatabaseField="fiu_medhx_oo_mo" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="10px" FieldTextBoxWidth="20px"></def:datafieldcontrol> 
<def:datafieldcontrol runat="server" id="Datafieldcontrol216" DatabaseField="fiu_medhx_pp_mo" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="10px" FieldTextBoxWidth="20px"></def:datafieldcontrol> 
<def:datafieldcontrol runat="server" id="Datafieldcontrol217" DatabaseField="fiu_medhx_qq_mo" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="10px" FieldTextBoxWidth="20px"></def:datafieldcontrol> 
<def:datafieldcontrol runat="server" id="Datafieldcontrol218" DatabaseField="fiu_medhx_rr_mo" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="10px" FieldTextBoxWidth="20px"></def:datafieldcontrol> 
</td>

<td> 
<def:datafieldcontrol runat="server" id="Datafieldcontrol219" DatabaseField="fiu_medhx_mm_s1" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="10px" FieldTextBoxWidth="20px"></def:datafieldcontrol> 
<def:datafieldcontrol runat="server" id="Datafieldcontrol220" DatabaseField="fiu_medhx_nn_s1" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="10px" FieldTextBoxWidth="20px"></def:datafieldcontrol>  
<def:datafieldcontrol runat="server" id="Datafieldcontrol221" DatabaseField="fiu_medhx_oo_s1" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="10px" FieldTextBoxWidth="20px"></def:datafieldcontrol> 
<def:datafieldcontrol runat="server" id="Datafieldcontrol222" DatabaseField="fiu_medhx_pp_s1" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="10px" FieldTextBoxWidth="20px"></def:datafieldcontrol> 
<def:datafieldcontrol runat="server" id="Datafieldcontrol223" DatabaseField="fiu_medhx_qq_s1" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="10px" FieldTextBoxWidth="20px"></def:datafieldcontrol> 
<def:datafieldcontrol runat="server" id="Datafieldcontrol224" DatabaseField="fiu_medhx_rr_s1" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="10px" FieldTextBoxWidth="20px"></def:datafieldcontrol> 
</td>
<td> 
<def:datafieldcontrol runat="server" id="Datafieldcontrol225" DatabaseField="fiu_medhx_mm_s2" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="10px" FieldTextBoxWidth="20px"></def:datafieldcontrol> 
<def:datafieldcontrol runat="server" id="Datafieldcontrol226" DatabaseField="fiu_medhx_nn_s2" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="10px" FieldTextBoxWidth="20px"></def:datafieldcontrol>  
<def:datafieldcontrol runat="server" id="Datafieldcontrol227" DatabaseField="fiu_medhx_oo_s2" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="10px" FieldTextBoxWidth="20px"></def:datafieldcontrol> 
<def:datafieldcontrol runat="server" id="Datafieldcontrol228" DatabaseField="fiu_medhx_pp_s2" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="10px" FieldTextBoxWidth="20px"></def:datafieldcontrol> 
<def:datafieldcontrol runat="server" id="Datafieldcontrol229" DatabaseField="fiu_medhx_qq_s2" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="10px" FieldTextBoxWidth="20px"></def:datafieldcontrol> 
<def:datafieldcontrol runat="server" id="Datafieldcontrol230" DatabaseField="fiu_medhx_rr_s2" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="10px" FieldTextBoxWidth="20px"></def:datafieldcontrol> 
</td>
<td> 
<def:datafieldcontrol runat="server" id="Datafieldcontrol231" DatabaseField="fiu_medhx_mm_s3" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="10px" FieldTextBoxWidth="20px"></def:datafieldcontrol> 
<def:datafieldcontrol runat="server" id="Datafieldcontrol232" DatabaseField="fiu_medhx_nn_s3" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="10px" FieldTextBoxWidth="20px"></def:datafieldcontrol>  
<def:datafieldcontrol runat="server" id="Datafieldcontrol233" DatabaseField="fiu_medhx_oo_s3" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="10px" FieldTextBoxWidth="20px"></def:datafieldcontrol> 
<def:datafieldcontrol runat="server" id="Datafieldcontrol234" DatabaseField="fiu_medhx_pp_s3" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="10px" FieldTextBoxWidth="20px"></def:datafieldcontrol> 
<def:datafieldcontrol runat="server" id="Datafieldcontrol235" DatabaseField="fiu_medhx_qq_s3" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="10px" FieldTextBoxWidth="20px"></def:datafieldcontrol> 
<def:datafieldcontrol runat="server" id="Datafieldcontrol236" DatabaseField="fiu_medhx_rr_s3" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="10px" FieldTextBoxWidth="20px"></def:datafieldcontrol> 
</td>

<td> 
<def:datafieldcontrol runat="server" id="Datafieldcontrol330" DatabaseField="fiu_medhx_mm_notes" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="10px" FieldTextBoxWidth="300px"></def:datafieldcontrol> 
<def:datafieldcontrol runat="server" id="Datafieldcontrol331" DatabaseField="fiu_medhx_nn_notes" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="10px" FieldTextBoxWidth="300px"></def:datafieldcontrol>  
<def:datafieldcontrol runat="server" id="Datafieldcontrol332" DatabaseField="fiu_medhx_oo_notes" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="10px" FieldTextBoxWidth="300px"></def:datafieldcontrol> 
<def:datafieldcontrol runat="server" id="Datafieldcontrol333" DatabaseField="fiu_medhx_pp_notes" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="10px" FieldTextBoxWidth="300px"></def:datafieldcontrol> 
<def:datafieldcontrol runat="server" id="Datafieldcontrol334" DatabaseField="fiu_medhx_qq_notes" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="10px" FieldTextBoxWidth="300px"></def:datafieldcontrol> 
<def:datafieldcontrol runat="server" id="Datafieldcontrol335" DatabaseField="fiu_medhx_rr_notes" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="10px" FieldTextBoxWidth="300px"></def:datafieldcontrol> 
</td>


          </tr>

    </table>





<br/> <br/>
<asp:Label ID="Label45" runat="server" Text="C. Neurological Update" Font-Bold="true" BackColor="Black" ForeColor="White" Font-Size="Medium"></asp:Label>
<br/> <br/>

 <br/> <br/>
      <asp:Label ID="Label52" runat="server" Text="Seizure screening" Font-Bold="true"  Font-Size="Medium"></asp:Label><br/>

  <table>

            <tr>
        <td align="right">    <font color="blue"><def:ValueSetLabel ID="ValueSetLabel2" runat="server"  DatabaseField="fiu_sz1"></def:ValueSetLabel> </font>
</td>
        <td align="right"><b>Notes</b></td>

            </tr>

<tr>
<td> <def:datafieldcontrol runat="server" id="fiu_sz1"       DatabaseField="fiu_sz1" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="390px" FieldTextBoxWidth="20px"></def:datafieldcontrol> </td>
<td> <def:datafieldcontrol runat="server" id="fiu_sz1notes"  DatabaseField="fiu_sz1notes" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="20px" FieldTextBoxWidth="250px"></def:datafieldcontrol> </td>
</tr>
<tr>
<td> <def:datafieldcontrol runat="server" id="Datafieldcontrol137"  DatabaseField="fiu_sz2" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="390px" FieldTextBoxWidth="20px"></def:datafieldcontrol> </td>
<td> <def:datafieldcontrol runat="server" id="Datafieldcontrol138"  DatabaseField="fiu_sz2notes" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="20px" FieldTextBoxWidth="250px"></def:datafieldcontrol> </td>
</tr>
<tr>
<td> <def:datafieldcontrol runat="server" id="Datafieldcontrol151" DatabaseField ="fiu_sz3a" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="390px" FieldTextBoxWidth="20px"></def:datafieldcontrol> </td>
<td> <def:datafieldcontrol runat="server" id="Datafieldcontrol152"  DatabaseField="fiu_sz3anotes" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="20px" FieldTextBoxWidth="250px"></def:datafieldcontrol> </td>
</tr>
<tr>
<td> <def:datafieldcontrol runat="server" id="Datafieldcontrol165" DatabaseField ="fiu_sz3b" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="390px" FieldTextBoxWidth="20px"></def:datafieldcontrol> </td>
<td> <def:datafieldcontrol runat="server" id="Datafieldcontrol166"  DatabaseField="fiu_sz3bnotes" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="20px" FieldTextBoxWidth="250px"></def:datafieldcontrol> </td>
</tr>
<tr>
<td> <def:datafieldcontrol runat="server" id="Datafieldcontrol179" DatabaseField ="fiu_sz3c" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="390px" FieldTextBoxWidth="20px"></def:datafieldcontrol> </td>
<td> <def:datafieldcontrol runat="server" id="Datafieldcontrol180"  DatabaseField="fiu_sz3cnotes" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="20px" FieldTextBoxWidth="250px"></def:datafieldcontrol> </td>
</tr>
<tr>
<td> <def:datafieldcontrol runat="server" id="Datafieldcontrol237" DatabaseField ="fiu_sz3d" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="390px" FieldTextBoxWidth="20px"></def:datafieldcontrol> </td>
<td> <def:datafieldcontrol runat="server" id="Datafieldcontrol238"  DatabaseField="fiu_sz3dnotes" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="20px" FieldTextBoxWidth="250px"></def:datafieldcontrol> </td>
</tr>
<tr>
<td> <def:datafieldcontrol runat="server" id="Datafieldcontrol239" DatabaseField ="fiu_sz3e" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="390px" FieldTextBoxWidth="20px"></def:datafieldcontrol> </td>
<td> <def:datafieldcontrol runat="server" id="Datafieldcontrol240"  DatabaseField="fiu_sz3enotes" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="20px" FieldTextBoxWidth="250px"></def:datafieldcontrol> </td>
</tr>
<tr>
<td> <def:datafieldcontrol runat="server" id="Datafieldcontrol241" DatabaseField ="fiu_sz3f" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="390px" FieldTextBoxWidth="20px"></def:datafieldcontrol> </td>
<td> <def:datafieldcontrol runat="server" id="Datafieldcontrol242"  DatabaseField="fiu_sz3fnotes" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="20px" FieldTextBoxWidth="250px"></def:datafieldcontrol> </td>
</tr>
<tr>
<td> <def:datafieldcontrol runat="server" id="Datafieldcontrol243" DatabaseField ="fiu_sz3g" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="390px" FieldTextBoxWidth="20px"></def:datafieldcontrol> </td>
<td> <def:datafieldcontrol runat="server" id="Datafieldcontrol244"  DatabaseField="fiu_sz3gnotes" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="20px" FieldTextBoxWidth="250px"></def:datafieldcontrol> </td>
</tr>
      </table>
      
       <br/>  <br/> 
<table>
      <tr>
<td> <def:datafieldcontrol runat="server" id="Datafieldcontrol245" DatabaseField ="fiu_neurol" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="20px"></def:datafieldcontrol> </td>
<td> <def:datafieldcontrol runat="server" id="Datafieldcontrol246"  DatabaseField="fiu_neurolnotes" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="100px" FieldTextBoxWidth="250px"></def:datafieldcontrol> </td>
</tr>
      </table>

       <def:datafieldcontrol runat="server" id="Datafieldcontrol247" DatabaseField ="fiu_szmed1" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="200px" FieldTextBoxWidth="250px"></def:datafieldcontrol><br/>
       <def:datafieldcontrol runat="server" id="Datafieldcontrol248" DatabaseField ="fiu_szmed2" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="200px" FieldTextBoxWidth="250px"></def:datafieldcontrol><br/>
       <def:datafieldcontrol runat="server" id="Datafieldcontrol249" DatabaseField ="fiu_szmed3" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="200px" FieldTextBoxWidth="250px"></def:datafieldcontrol><br/>

<br/><br/>

<table>
      <tr>
<td> <def:datafieldcontrol runat="server" id="Datafieldcontrol250" DatabaseField ="fiu_brn_abnimg" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="20px"></def:datafieldcontrol></td><td></td></tr>
<td> <def:datafieldcontrol runat="server" id="Datafieldcontrol251" DatabaseField ="fiu_brn_hosp" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="20px"></def:datafieldcontrol></td><td></td></tr>
<td style="vertical-align:top"> <def:datafieldcontrol runat="server" id="Datafieldcontrol252" DatabaseField ="fiu_lossconsc" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="20px"></def:datafieldcontrol></td>
    <td style="vertical-align:top">
       <def:datafieldcontrol runat="server" id="Datafieldcontrol253" DatabaseField ="fiu_lossconsc_age1" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="360px" FieldTextBoxWidth="150px"></def:datafieldcontrol><br/>
 <def:datafieldcontrol runat="server" id="Datafieldcontrol254" DatabaseField ="fiu_lossconsc_age2" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="360px" FieldTextBoxWidth="150px"></def:datafieldcontrol><br/>
 <def:datafieldcontrol runat="server" id="Datafieldcontrol255" DatabaseField ="fiu_lossconsc_age3" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="360px" FieldTextBoxWidth="150px"></def:datafieldcontrol><br/>
        </td></tr></table>


       <br/>  <br/>  <br/> 
<asp:Label ID="lblD" runat="server" Text="D. Health Issues Update" Font-Bold="true" BackColor="Black" ForeColor="White" Font-Size="Medium"></asp:Label>
<br/> <br/>
<asp:Label ID="Label43" runat="server" Text="1. Other chronic medical conditions" Font-Bold="true"  Font-Size="Medium"></asp:Label>
            <br/> 
       <def:datafieldcontrol runat="server" id="fiu_chronmed" DatabaseField="fiu_chronmed" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="360px" FieldTextBoxWidth="20px" FieldTextBoxMaxLength="100"></def:datafieldcontrol>  <br/>

    <table>
        <tr>
            <td><def:datafieldcontrol runat="server" id="fiu_chronmed1" DatabaseField="fiu_chronmed1" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="200px" FieldTextBoxMaxLength="100"></def:datafieldcontrol></td>
            <td><def:datafieldcontrol runat="server" id="fiu_chronmed1hosp" DatabaseField="fiu_chronmed1hosp" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="200px" FieldTextBoxWidth="20px" FieldTextBoxMaxLength="100"></def:datafieldcontrol></td>
        </tr>
        <tr>
            <td><def:datafieldcontrol runat="server" id="Datafieldcontrol1" DatabaseField="fiu_chronmed2" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="200px" FieldTextBoxMaxLength="100"></def:datafieldcontrol></td>
            <td><def:datafieldcontrol runat="server" id="Datafieldcontrol2" DatabaseField="fiu_chronmed2hosp" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="200px" FieldTextBoxWidth="20px" FieldTextBoxMaxLength="100"></def:datafieldcontrol></td>
        </tr>
        <tr>
            <td><def:datafieldcontrol runat="server" id="Datafieldcontrol3" DatabaseField="fiu_chronmed3" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="200px" FieldTextBoxMaxLength="100"></def:datafieldcontrol></td>
            <td><def:datafieldcontrol runat="server" id="Datafieldcontrol4" DatabaseField="fiu_chronmed3hosp" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="200px" FieldTextBoxWidth="20px" FieldTextBoxMaxLength="100"></def:datafieldcontrol></td>
        </tr>
    </table>
      
      <br/> <br/>
<asp:Label ID="Label44" runat="server" Text="2. Illnesses, operations, hospitalizations" Font-Bold="true"  Font-Size="Medium"></asp:Label>
            <br/> 

<def:datafieldcontrol runat="server" id="Datafieldcontrol291" DatabaseField="fiu_othprob" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="360px" FieldTextBoxWidth="30px" FieldTextBoxMaxLength="100"></def:datafieldcontrol>
      <br/><br/>

      <table>
          <tr>
              <td align="center"><b>Illness</b></td>
              <td align="center"><b>Age</b></td>
              <td><b>Length of<br/>Illness</b></td>
              <td><b>High Fever or <br/>Unconscious<br/>(0=No, 1=Yes)</b></td>
              <td><b>Tx and/or aftereffects</b></td>
          </tr>
          <tr>
              <td><def:datafieldcontrol runat="server" id="Datafieldcontrol290" DatabaseField="fiu_ill1"    IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="10px" FieldTextBoxWidth="120px" FieldTextBoxMaxLength="100"></def:datafieldcontrol></td>
              <td><def:datafieldcontrol runat="server" id="Datafieldcontrol292" DatabaseField="fiu_ill1age" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="10px" FieldTextBoxWidth="60px" FieldTextBoxMaxLength="100"></def:datafieldcontrol></td>
              <td><def:datafieldcontrol runat="server" id="Datafieldcontrol293" DatabaseField="fiu_ill1len" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="10px" FieldTextBoxWidth="60px" FieldTextBoxMaxLength="100"></def:datafieldcontrol></td>
              <td><def:datafieldcontrol runat="server" id="Datafieldcontrol294" DatabaseField="fiu_ill1unc" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="10px" FieldTextBoxWidth="30px" FieldTextBoxMaxLength="100"></def:datafieldcontrol></td>
              <td><def:datafieldcontrol runat="server" id="Datafieldcontrol295" DatabaseField="fiu_ill1tx"  IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="10px" FieldTextBoxWidth="120px" FieldTextBoxMaxLength="100"></def:datafieldcontrol></td>

          </tr>
          <tr>
              <td><def:datafieldcontrol runat="server" id="Datafieldcontrol296" DatabaseField="fiu_ill2"    IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="10px" FieldTextBoxWidth="120px" FieldTextBoxMaxLength="100"></def:datafieldcontrol></td>
              <td><def:datafieldcontrol runat="server" id="Datafieldcontrol297" DatabaseField="fiu_ill2age" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="10px" FieldTextBoxWidth="60px" FieldTextBoxMaxLength="100"></def:datafieldcontrol></td>
              <td><def:datafieldcontrol runat="server" id="Datafieldcontrol298" DatabaseField="fiu_ill2len" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="10px" FieldTextBoxWidth="60px" FieldTextBoxMaxLength="100"></def:datafieldcontrol></td>
              <td><def:datafieldcontrol runat="server" id="Datafieldcontrol299" DatabaseField="fiu_ill2unc" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="10px" FieldTextBoxWidth="30px" FieldTextBoxMaxLength="100"></def:datafieldcontrol></td>
              <td><def:datafieldcontrol runat="server" id="Datafieldcontrol300" DatabaseField="fiu_ill2tx"  IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="10px" FieldTextBoxWidth="120px" FieldTextBoxMaxLength="100"></def:datafieldcontrol></td>

          </tr>
          <tr>
              <td><def:datafieldcontrol runat="server" id="Datafieldcontrol301" DatabaseField="fiu_ill3"    IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="10px" FieldTextBoxWidth="120px" FieldTextBoxMaxLength="100"></def:datafieldcontrol></td>
              <td><def:datafieldcontrol runat="server" id="Datafieldcontrol302" DatabaseField="fiu_ill3age" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="10px" FieldTextBoxWidth="60px" FieldTextBoxMaxLength="100"></def:datafieldcontrol></td>
              <td><def:datafieldcontrol runat="server" id="Datafieldcontrol303" DatabaseField="fiu_ill3len" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="10px" FieldTextBoxWidth="60px" FieldTextBoxMaxLength="100"></def:datafieldcontrol></td>
              <td><def:datafieldcontrol runat="server" id="Datafieldcontrol304" DatabaseField="fiu_ill3unc" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="10px" FieldTextBoxWidth="30px" FieldTextBoxMaxLength="100"></def:datafieldcontrol></td>
              <td><def:datafieldcontrol runat="server" id="Datafieldcontrol305" DatabaseField="fiu_ill3tx"  IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="10px" FieldTextBoxWidth="120px" FieldTextBoxMaxLength="100"></def:datafieldcontrol></td>

          </tr>
      </table>

            <br/><br/>

      <table>
          <tr>
              <td align="center"><b>Operations</b></td>
              <td align="center"><b>Age</b></td>
              <td><b>Length of time<br/>in Hospital</b></td>
              <td><b>Aftereffects, How was child prepared?</b></td>
          </tr>
          <tr>
              <td><def:datafieldcontrol runat="server" id="Datafieldcontrol306" DatabaseField="fiu_oper1"    IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="10px" FieldTextBoxWidth="120px" FieldTextBoxMaxLength="100"></def:datafieldcontrol></td>
              <td><def:datafieldcontrol runat="server" id="Datafieldcontrol307" DatabaseField="fiu_oper1age" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="10px" FieldTextBoxWidth="60px" FieldTextBoxMaxLength="100"></def:datafieldcontrol></td>
              <td><def:datafieldcontrol runat="server" id="Datafieldcontrol308" DatabaseField="fiu_oper1len" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="10px" FieldTextBoxWidth="60px" FieldTextBoxMaxLength="100"></def:datafieldcontrol></td>
              <td><def:datafieldcontrol runat="server" id="Datafieldcontrol310" DatabaseField="fiu_oper1tx"  IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="10px" FieldTextBoxWidth="120px" FieldTextBoxMaxLength="100"></def:datafieldcontrol></td>

          </tr>
          <tr>
              <td><def:datafieldcontrol runat="server" id="Datafieldcontrol311" DatabaseField="fiu_oper2"    IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="10px" FieldTextBoxWidth="120px" FieldTextBoxMaxLength="100"></def:datafieldcontrol></td>
              <td><def:datafieldcontrol runat="server" id="Datafieldcontrol312" DatabaseField="fiu_oper2age" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="10px" FieldTextBoxWidth="60px" FieldTextBoxMaxLength="100"></def:datafieldcontrol></td>
              <td><def:datafieldcontrol runat="server" id="Datafieldcontrol313" DatabaseField="fiu_oper2len" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="10px" FieldTextBoxWidth="60px" FieldTextBoxMaxLength="100"></def:datafieldcontrol></td>
              <td><def:datafieldcontrol runat="server" id="Datafieldcontrol315" DatabaseField="fiu_oper2tx"  IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="10px" FieldTextBoxWidth="120px" FieldTextBoxMaxLength="100"></def:datafieldcontrol></td>

          </tr>
          <tr>
              <td><def:datafieldcontrol runat="server" id="Datafieldcontrol316" DatabaseField="fiu_oper3"    IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="10px" FieldTextBoxWidth="120px" FieldTextBoxMaxLength="100"></def:datafieldcontrol></td>
              <td><def:datafieldcontrol runat="server" id="Datafieldcontrol317" DatabaseField="fiu_oper3age" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="10px" FieldTextBoxWidth="60px" FieldTextBoxMaxLength="100"></def:datafieldcontrol></td>
              <td><def:datafieldcontrol runat="server" id="Datafieldcontrol318" DatabaseField="fiu_oper3len" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="10px" FieldTextBoxWidth="60px" FieldTextBoxMaxLength="100"></def:datafieldcontrol></td>
              <td><def:datafieldcontrol runat="server" id="Datafieldcontrol320" DatabaseField="fiu_oper3tx"  IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="10px" FieldTextBoxWidth="120px" FieldTextBoxMaxLength="100"></def:datafieldcontrol></td>

          </tr>
      </table>

      <br/><br/>
      <table>
          <tr>
              <td align="center"><b>Other Hospitalizations</b></td>
              <td align="center"><b>Age</b></td>
              <td><b>Length of time<br/>in Hospital</b></td>
              <td><b>Aftereffects (e.g., sleep probs, fearful)</b></td>
          </tr>
          <tr>
              <td><def:datafieldcontrol runat="server" id="Datafieldcontrol309" DatabaseField="fiu_ohosp1"    IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="10px" FieldTextBoxWidth="120px" FieldTextBoxMaxLength="100"></def:datafieldcontrol></td>
              <td><def:datafieldcontrol runat="server" id="Datafieldcontrol314" DatabaseField="fiu_ohosp1age" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="10px" FieldTextBoxWidth="60px" FieldTextBoxMaxLength="100"></def:datafieldcontrol></td>
              <td><def:datafieldcontrol runat="server" id="Datafieldcontrol319" DatabaseField="fiu_ohosp1len" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="10px" FieldTextBoxWidth="60px" FieldTextBoxMaxLength="100"></def:datafieldcontrol></td>
              <td><def:datafieldcontrol runat="server" id="Datafieldcontrol321" DatabaseField="fiu_ohosp1tx"  IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="10px" FieldTextBoxWidth="120px" FieldTextBoxMaxLength="100"></def:datafieldcontrol></td>

          </tr>
          <tr>
              <td><def:datafieldcontrol runat="server" id="Datafieldcontrol322" DatabaseField="fiu_ohosp2"    IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="10px" FieldTextBoxWidth="120px" FieldTextBoxMaxLength="100"></def:datafieldcontrol></td>
              <td><def:datafieldcontrol runat="server" id="Datafieldcontrol323" DatabaseField="fiu_ohosp2age" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="10px" FieldTextBoxWidth="60px" FieldTextBoxMaxLength="100"></def:datafieldcontrol></td>
              <td><def:datafieldcontrol runat="server" id="Datafieldcontrol324" DatabaseField="fiu_ohosp2len" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="10px" FieldTextBoxWidth="60px" FieldTextBoxMaxLength="100"></def:datafieldcontrol></td>
              <td><def:datafieldcontrol runat="server" id="Datafieldcontrol325" DatabaseField="fiu_ohosp2tx"  IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="10px" FieldTextBoxWidth="120px" FieldTextBoxMaxLength="100"></def:datafieldcontrol></td>

          </tr>
          <tr>
              <td><def:datafieldcontrol runat="server" id="Datafieldcontrol326" DatabaseField="fiu_ohosp3"    IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="10px" FieldTextBoxWidth="120px" FieldTextBoxMaxLength="100"></def:datafieldcontrol></td>
              <td><def:datafieldcontrol runat="server" id="Datafieldcontrol327" DatabaseField="fiu_ohosp3age" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="10px" FieldTextBoxWidth="60px" FieldTextBoxMaxLength="100"></def:datafieldcontrol></td>
              <td><def:datafieldcontrol runat="server" id="Datafieldcontrol328" DatabaseField="fiu_ohosp3len" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="10px" FieldTextBoxWidth="60px" FieldTextBoxMaxLength="100"></def:datafieldcontrol></td>
              <td><def:datafieldcontrol runat="server" id="Datafieldcontrol329" DatabaseField="fiu_ohosp3tx"  IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="10px" FieldTextBoxWidth="120px" FieldTextBoxMaxLength="100"></def:datafieldcontrol></td>

          </tr>
      </table>
      

      <br/> <br/>
<asp:Label ID="Label41" runat="server" Text="3. Meds for behavioral/emotional reasons" Font-Bold="true"  Font-Size="Medium"></asp:Label>
            <br/> 

       <def:datafieldcontrol runat="server" id="fiu_psymed_curr" DatabaseField="fiu_psymed_curr" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="200px" FieldTextBoxWidth="20px" FieldTextBoxMaxLength="100"></def:datafieldcontrol>  <br/>
       <def:datafieldcontrol runat="server" id="fiu_psymed_past" DatabaseField="fiu_psymed_past" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="200px" FieldTextBoxWidth="20px" FieldTextBoxMaxLength="100"></def:datafieldcontrol>  <br/>
<table>

            <tr>
<td align="left"><b><i>Med Name......Generic Name....Medication Class</i></b></td>
<td align="right"><b><i>Reason Taken</i></b></td>
<td align="right"><b><i>Dates Taken:<br/>From</i></b></td>
<td align="right"><b><i>Dates Taken:<br/>To</i></b></td>
<td align="right"><b><i>Current?<br/>(1=Y, 0=N)</i></b></td>

            </tr>

 <tr><td><asp:Label ID="Label1" runat="server" Text="Catapres........Clonidine...........Adrenergic"						  Font-Name="Courier" /> </td>  <td> <def:datafieldcontrol runat="server" id="fiu_med01_reas" DatabaseField="fiu_med01_reas" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="10px" FieldTextBoxWidth="160px" FieldTextBoxMaxLength="100"></def:datafieldcontrol>  </td><td> <def:datafieldcontrol runat="server" id="fiu_med01_dtfrom" DatabaseField="fiu_med01_dtfrom" IsEntryField="true" IsDoubleEntryField="true"  FieldTextBoxWidth="60px" FieldLabelWidth="10px"></def:datafieldcontrol>  </td><td> <def:datafieldcontrol runat="server" id="fiu_med01_dtto" DatabaseField="fiu_med01_dtto" IsEntryField="true" IsDoubleEntryField="true"  FieldTextBoxWidth="60px"  FieldLabelWidth="10px"></def:datafieldcontrol>  </td><td> <def:datafieldcontrol runat="server" id="fiu_med01_curr" DatabaseField="fiu_med01_curr" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="10px" FieldTextBoxWidth="50px"></def:datafieldcontrol>  </td> </tr> 
 <tr><td><asp:Label ID="Label2" runat="server" Text="Tenex...........Guanfacine..........Adrenergic"						  Font-Name="Courier" /> </td>  <td> <def:datafieldcontrol runat="server" id="fiu_med02_reas" DatabaseField="fiu_med02_reas" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="10px" FieldTextBoxWidth="160px" FieldTextBoxMaxLength="100"></def:datafieldcontrol>  </td><td> <def:datafieldcontrol runat="server" id="fiu_med02_dtfrom" DatabaseField="fiu_med02_dtfrom" IsEntryField="true" IsDoubleEntryField="true"  FieldTextBoxWidth="60px" FieldLabelWidth="10px"></def:datafieldcontrol>  </td><td> <def:datafieldcontrol runat="server" id="fiu_med02_dtto" DatabaseField="fiu_med02_dtto" IsEntryField="true" IsDoubleEntryField="true"  FieldTextBoxWidth="60px"  FieldLabelWidth="10px"></def:datafieldcontrol>  </td><td> <def:datafieldcontrol runat="server" id="fiu_med02_curr" DatabaseField="fiu_med02_curr" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="10px" FieldTextBoxWidth="50px"></def:datafieldcontrol>  </td> </tr> 
 <tr><td><asp:Label ID="Label3" runat="server" Text="Symmetrel.......Amantadine..........Anti-Parkinsonian	"				  Font-Name="Courier" /> </td>  <td> <def:datafieldcontrol runat="server" id="fiu_med03_reas" DatabaseField="fiu_med03_reas" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="10px" FieldTextBoxWidth="160px" FieldTextBoxMaxLength="100"></def:datafieldcontrol>  </td><td> <def:datafieldcontrol runat="server" id="fiu_med03_dtfrom" DatabaseField="fiu_med03_dtfrom" IsEntryField="true" IsDoubleEntryField="true"  FieldTextBoxWidth="60px" FieldLabelWidth="10px"></def:datafieldcontrol>  </td><td> <def:datafieldcontrol runat="server" id="fiu_med03_dtto" DatabaseField="fiu_med03_dtto" IsEntryField="true" IsDoubleEntryField="true"  FieldTextBoxWidth="60px"  FieldLabelWidth="10px"></def:datafieldcontrol>  </td><td> <def:datafieldcontrol runat="server" id="fiu_med03_curr" DatabaseField="fiu_med03_curr" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="10px" FieldTextBoxWidth="50px"></def:datafieldcontrol>  </td> </tr> 
 <tr><td><asp:Label ID="Label4" runat="server" Text="Depakote........Valproate...........Anticonvulsant"					  Font-Name="Courier" /> </td>  <td> <def:datafieldcontrol runat="server" id="fiu_med04_reas" DatabaseField="fiu_med04_reas" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="10px" FieldTextBoxWidth="160px" FieldTextBoxMaxLength="100"></def:datafieldcontrol>  </td><td> <def:datafieldcontrol runat="server" id="fiu_med04_dtfrom" DatabaseField="fiu_med04_dtfrom" IsEntryField="true" IsDoubleEntryField="true"  FieldTextBoxWidth="60px" FieldLabelWidth="10px"></def:datafieldcontrol>  </td><td> <def:datafieldcontrol runat="server" id="fiu_med04_dtto" DatabaseField="fiu_med04_dtto" IsEntryField="true" IsDoubleEntryField="true"  FieldTextBoxWidth="60px"  FieldLabelWidth="10px"></def:datafieldcontrol>  </td><td> <def:datafieldcontrol runat="server" id="fiu_med04_curr" DatabaseField="fiu_med04_curr" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="10px" FieldTextBoxWidth="50px"></def:datafieldcontrol>  </td> </tr> 
 <tr><td><asp:Label ID="Label5" runat="server" Text="Dilantin........Dilantin............Anticonvulsant"					  Font-Name="Courier" /> </td>  <td> <def:datafieldcontrol runat="server" id="fiu_med05_reas" DatabaseField="fiu_med05_reas" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="10px" FieldTextBoxWidth="160px" FieldTextBoxMaxLength="100"></def:datafieldcontrol>  </td><td> <def:datafieldcontrol runat="server" id="fiu_med05_dtfrom" DatabaseField="fiu_med05_dtfrom" IsEntryField="true" IsDoubleEntryField="true"  FieldTextBoxWidth="60px" FieldLabelWidth="10px"></def:datafieldcontrol>  </td><td> <def:datafieldcontrol runat="server" id="fiu_med05_dtto" DatabaseField="fiu_med05_dtto" IsEntryField="true" IsDoubleEntryField="true"  FieldTextBoxWidth="60px"  FieldLabelWidth="10px"></def:datafieldcontrol>  </td><td> <def:datafieldcontrol runat="server" id="fiu_med05_curr" DatabaseField="fiu_med05_curr" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="10px" FieldTextBoxWidth="50px"></def:datafieldcontrol>  </td> </tr> 
 <tr><td><asp:Label ID="Label6" runat="server" Text="Lamictal........Lamotrigine.........Anticonvulsant"					  Font-Name="Courier" /> </td>  <td> <def:datafieldcontrol runat="server" id="fiu_med06_reas" DatabaseField="fiu_med06_reas" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="10px" FieldTextBoxWidth="160px" FieldTextBoxMaxLength="100"></def:datafieldcontrol>  </td><td> <def:datafieldcontrol runat="server" id="fiu_med06_dtfrom" DatabaseField="fiu_med06_dtfrom" IsEntryField="true" IsDoubleEntryField="true"  FieldTextBoxWidth="60px" FieldLabelWidth="10px"></def:datafieldcontrol>  </td><td> <def:datafieldcontrol runat="server" id="fiu_med06_dtto" DatabaseField="fiu_med06_dtto" IsEntryField="true" IsDoubleEntryField="true"  FieldTextBoxWidth="60px"  FieldLabelWidth="10px"></def:datafieldcontrol>  </td><td> <def:datafieldcontrol runat="server" id="fiu_med06_curr" DatabaseField="fiu_med06_curr" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="10px" FieldTextBoxWidth="50px"></def:datafieldcontrol>  </td> </tr> 
 <tr><td><asp:Label ID="Label7" runat="server" Text="Phenobarbital...Phenobarbital.......Anticonvulsant"					  Font-Name="Courier" /> </td>  <td> <def:datafieldcontrol runat="server" id="fiu_med07_reas" DatabaseField="fiu_med07_reas" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="10px" FieldTextBoxWidth="160px" FieldTextBoxMaxLength="100"></def:datafieldcontrol>  </td><td> <def:datafieldcontrol runat="server" id="fiu_med07_dtfrom" DatabaseField="fiu_med07_dtfrom" IsEntryField="true" IsDoubleEntryField="true"  FieldTextBoxWidth="60px" FieldLabelWidth="10px"></def:datafieldcontrol>  </td><td> <def:datafieldcontrol runat="server" id="fiu_med07_dtto" DatabaseField="fiu_med07_dtto" IsEntryField="true" IsDoubleEntryField="true"  FieldTextBoxWidth="60px"  FieldLabelWidth="10px"></def:datafieldcontrol>  </td><td> <def:datafieldcontrol runat="server" id="fiu_med07_curr" DatabaseField="fiu_med07_curr" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="10px" FieldTextBoxWidth="50px"></def:datafieldcontrol>  </td> </tr> 
 <tr><td><asp:Label ID="Label8" runat="server" Text="Tegretol........Carbamazepine.......Anticonvulsant"					  Font-Name="Courier" /> </td>  <td> <def:datafieldcontrol runat="server" id="fiu_med08_reas" DatabaseField="fiu_med08_reas" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="10px" FieldTextBoxWidth="160px" FieldTextBoxMaxLength="100"></def:datafieldcontrol>  </td><td> <def:datafieldcontrol runat="server" id="fiu_med08_dtfrom" DatabaseField="fiu_med08_dtfrom" IsEntryField="true" IsDoubleEntryField="true"  FieldTextBoxWidth="60px" FieldLabelWidth="10px"></def:datafieldcontrol>  </td><td> <def:datafieldcontrol runat="server" id="fiu_med08_dtto" DatabaseField="fiu_med08_dtto" IsEntryField="true" IsDoubleEntryField="true"  FieldTextBoxWidth="60px"  FieldLabelWidth="10px"></def:datafieldcontrol>  </td><td> <def:datafieldcontrol runat="server" id="fiu_med08_curr" DatabaseField="fiu_med08_curr" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="10px" FieldTextBoxWidth="50px"></def:datafieldcontrol>  </td> </tr> 
 <tr><td><asp:Label ID="Label9" runat="server" Text="Topamax.........Topiramate..........Anticonvulsant"					  Font-Name="Courier" /> </td>  <td> <def:datafieldcontrol runat="server" id="fiu_med09_reas" DatabaseField="fiu_med09_reas" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="10px" FieldTextBoxWidth="160px" FieldTextBoxMaxLength="100"></def:datafieldcontrol>  </td><td> <def:datafieldcontrol runat="server" id="fiu_med09_dtfrom" DatabaseField="fiu_med09_dtfrom" IsEntryField="true" IsDoubleEntryField="true"  FieldTextBoxWidth="60px" FieldLabelWidth="10px"></def:datafieldcontrol>  </td><td> <def:datafieldcontrol runat="server" id="fiu_med09_dtto" DatabaseField="fiu_med09_dtto" IsEntryField="true" IsDoubleEntryField="true"  FieldTextBoxWidth="60px"  FieldLabelWidth="10px"></def:datafieldcontrol>  </td><td> <def:datafieldcontrol runat="server" id="fiu_med09_curr" DatabaseField="fiu_med09_curr" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="10px" FieldTextBoxWidth="50px"></def:datafieldcontrol>  </td> </tr> 
 <tr><td><asp:Label ID="Label10" runat="server" Text="Trileptal.......Oxcarbazepine.......Anticonvulsant"					  Font-Name="Courier" /> </td>  <td> <def:datafieldcontrol runat="server" id="fiu_med10_reas" DatabaseField="fiu_med10_reas" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="10px" FieldTextBoxWidth="160px" FieldTextBoxMaxLength="100"></def:datafieldcontrol>  </td><td> <def:datafieldcontrol runat="server" id="fiu_med10_dtfrom" DatabaseField="fiu_med10_dtfrom" IsEntryField="true" IsDoubleEntryField="true"  FieldTextBoxWidth="60px" FieldLabelWidth="10px"></def:datafieldcontrol>  </td><td> <def:datafieldcontrol runat="server" id="fiu_med10_dtto" DatabaseField="fiu_med10_dtto" IsEntryField="true" IsDoubleEntryField="true"  FieldTextBoxWidth="60px"  FieldLabelWidth="10px"></def:datafieldcontrol>  </td><td> <def:datafieldcontrol runat="server" id="fiu_med10_curr" DatabaseField="fiu_med10_curr" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="10px" FieldTextBoxWidth="50px"></def:datafieldcontrol>  </td> </tr> 
 <tr><td><asp:Label ID="Label11" runat="server" Text="Zonegran........Zonisamide..........Anticonvulsant"					  Font-Name="Courier" /> </td>  <td> <def:datafieldcontrol runat="server" id="fiu_med11_reas" DatabaseField="fiu_med11_reas" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="10px" FieldTextBoxWidth="160px" FieldTextBoxMaxLength="100"></def:datafieldcontrol>  </td><td> <def:datafieldcontrol runat="server" id="fiu_med11_dtfrom" DatabaseField="fiu_med11_dtfrom" IsEntryField="true" IsDoubleEntryField="true"  FieldTextBoxWidth="60px" FieldLabelWidth="10px"></def:datafieldcontrol>  </td><td> <def:datafieldcontrol runat="server" id="fiu_med11_dtto" DatabaseField="fiu_med11_dtto" IsEntryField="true" IsDoubleEntryField="true"  FieldTextBoxWidth="60px"  FieldLabelWidth="10px"></def:datafieldcontrol>  </td><td> <def:datafieldcontrol runat="server" id="fiu_med11_curr" DatabaseField="fiu_med11_curr" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="10px" FieldTextBoxWidth="50px"></def:datafieldcontrol>  </td> </tr> 
 <tr><td><asp:Label ID="Label12" runat="server" Text="Celexa..........Citalopram..........Antidepressant (SSRI)"			  Font-Name="Courier" /> </td>  <td> <def:datafieldcontrol runat="server" id="fiu_med12_reas" DatabaseField="fiu_med12_reas" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="10px" FieldTextBoxWidth="160px" FieldTextBoxMaxLength="100"></def:datafieldcontrol>  </td><td> <def:datafieldcontrol runat="server" id="fiu_med12_dtfrom" DatabaseField="fiu_med12_dtfrom" IsEntryField="true" IsDoubleEntryField="true"  FieldTextBoxWidth="60px" FieldLabelWidth="10px"></def:datafieldcontrol>  </td><td> <def:datafieldcontrol runat="server" id="fiu_med12_dtto" DatabaseField="fiu_med12_dtto" IsEntryField="true" IsDoubleEntryField="true"  FieldTextBoxWidth="60px"  FieldLabelWidth="10px"></def:datafieldcontrol>  </td><td> <def:datafieldcontrol runat="server" id="fiu_med12_curr" DatabaseField="fiu_med12_curr" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="10px" FieldTextBoxWidth="50px"></def:datafieldcontrol>  </td> </tr> 
 <tr><td><asp:Label ID="Label13" runat="server" Text="Effexor.........Venlafaxine.........Antidepressant (SSRI)"			  Font-Name="Courier" /> </td>  <td> <def:datafieldcontrol runat="server" id="fiu_med13_reas" DatabaseField="fiu_med13_reas" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="10px" FieldTextBoxWidth="160px" FieldTextBoxMaxLength="100"></def:datafieldcontrol>  </td><td> <def:datafieldcontrol runat="server" id="fiu_med13_dtfrom" DatabaseField="fiu_med13_dtfrom" IsEntryField="true" IsDoubleEntryField="true"  FieldTextBoxWidth="60px" FieldLabelWidth="10px"></def:datafieldcontrol>  </td><td> <def:datafieldcontrol runat="server" id="fiu_med13_dtto" DatabaseField="fiu_med13_dtto" IsEntryField="true" IsDoubleEntryField="true"  FieldTextBoxWidth="60px"  FieldLabelWidth="10px"></def:datafieldcontrol>  </td><td> <def:datafieldcontrol runat="server" id="fiu_med13_curr" DatabaseField="fiu_med13_curr" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="10px" FieldTextBoxWidth="50px"></def:datafieldcontrol>  </td> </tr> 
 <tr><td><asp:Label ID="Label14" runat="server" Text="Lexapro.........Escitalopram........Antidepressant (SSRI)"			  Font-Name="Courier" /> </td>  <td> <def:datafieldcontrol runat="server" id="fiu_med14_reas" DatabaseField="fiu_med14_reas" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="10px" FieldTextBoxWidth="160px" FieldTextBoxMaxLength="100"></def:datafieldcontrol>  </td><td> <def:datafieldcontrol runat="server" id="fiu_med14_dtfrom" DatabaseField="fiu_med14_dtfrom" IsEntryField="true" IsDoubleEntryField="true"  FieldTextBoxWidth="60px" FieldLabelWidth="10px"></def:datafieldcontrol>  </td><td> <def:datafieldcontrol runat="server" id="fiu_med14_dtto" DatabaseField="fiu_med14_dtto" IsEntryField="true" IsDoubleEntryField="true"  FieldTextBoxWidth="60px"  FieldLabelWidth="10px"></def:datafieldcontrol>  </td><td> <def:datafieldcontrol runat="server" id="fiu_med14_curr" DatabaseField="fiu_med14_curr" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="10px" FieldTextBoxWidth="50px"></def:datafieldcontrol>  </td> </tr> 
 <tr><td><asp:Label ID="Label15" runat="server" Text="Luvox...........Fluvoxamine.........Antidepressant (SSRI)"			  Font-Name="Courier" /> </td>  <td> <def:datafieldcontrol runat="server" id="fiu_med15_reas" DatabaseField="fiu_med15_reas" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="10px" FieldTextBoxWidth="160px" FieldTextBoxMaxLength="100"></def:datafieldcontrol>  </td><td> <def:datafieldcontrol runat="server" id="fiu_med15_dtfrom" DatabaseField="fiu_med15_dtfrom" IsEntryField="true" IsDoubleEntryField="true"  FieldTextBoxWidth="60px" FieldLabelWidth="10px"></def:datafieldcontrol>  </td><td> <def:datafieldcontrol runat="server" id="fiu_med15_dtto" DatabaseField="fiu_med15_dtto" IsEntryField="true" IsDoubleEntryField="true"  FieldTextBoxWidth="60px"  FieldLabelWidth="10px"></def:datafieldcontrol>  </td><td> <def:datafieldcontrol runat="server" id="fiu_med15_curr" DatabaseField="fiu_med15_curr" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="10px" FieldTextBoxWidth="50px"></def:datafieldcontrol>  </td> </tr> 
 <tr><td><asp:Label ID="Label16" runat="server" Text="Paxil...........Paroxetine..........Antidepressant (SSRI)"			  Font-Name="Courier" /> </td>  <td> <def:datafieldcontrol runat="server" id="fiu_med16_reas" DatabaseField="fiu_med16_reas" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="10px" FieldTextBoxWidth="160px" FieldTextBoxMaxLength="100"></def:datafieldcontrol>  </td><td> <def:datafieldcontrol runat="server" id="fiu_med16_dtfrom" DatabaseField="fiu_med16_dtfrom" IsEntryField="true" IsDoubleEntryField="true"  FieldTextBoxWidth="60px" FieldLabelWidth="10px"></def:datafieldcontrol>  </td><td> <def:datafieldcontrol runat="server" id="fiu_med16_dtto" DatabaseField="fiu_med16_dtto" IsEntryField="true" IsDoubleEntryField="true"  FieldTextBoxWidth="60px"  FieldLabelWidth="10px"></def:datafieldcontrol>  </td><td> <def:datafieldcontrol runat="server" id="fiu_med16_curr" DatabaseField="fiu_med16_curr" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="10px" FieldTextBoxWidth="50px"></def:datafieldcontrol>  </td> </tr> 
 <tr><td><asp:Label ID="Label17" runat="server" Text="Prozac..........Fluoxetine..........Antidepressant (SSRI)"			  Font-Name="Courier" /> </td>  <td> <def:datafieldcontrol runat="server" id="fiu_med17_reas" DatabaseField="fiu_med17_reas" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="10px" FieldTextBoxWidth="160px" FieldTextBoxMaxLength="100"></def:datafieldcontrol>  </td><td> <def:datafieldcontrol runat="server" id="fiu_med17_dtfrom" DatabaseField="fiu_med17_dtfrom" IsEntryField="true" IsDoubleEntryField="true"  FieldTextBoxWidth="60px" FieldLabelWidth="10px"></def:datafieldcontrol>  </td><td> <def:datafieldcontrol runat="server" id="fiu_med17_dtto" DatabaseField="fiu_med17_dtto" IsEntryField="true" IsDoubleEntryField="true"  FieldTextBoxWidth="60px"  FieldLabelWidth="10px"></def:datafieldcontrol>  </td><td> <def:datafieldcontrol runat="server" id="fiu_med17_curr" DatabaseField="fiu_med17_curr" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="10px" FieldTextBoxWidth="50px"></def:datafieldcontrol>  </td> </tr> 
 <tr><td><asp:Label ID="Label18" runat="server" Text="Zoloft..........Sertraline..........Antidepressant (SSRI)"			  Font-Name="Courier" /> </td>  <td> <def:datafieldcontrol runat="server" id="fiu_med18_reas" DatabaseField="fiu_med18_reas" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="10px" FieldTextBoxWidth="160px" FieldTextBoxMaxLength="100"></def:datafieldcontrol>  </td><td> <def:datafieldcontrol runat="server" id="fiu_med18_dtfrom" DatabaseField="fiu_med18_dtfrom" IsEntryField="true" IsDoubleEntryField="true"  FieldTextBoxWidth="60px" FieldLabelWidth="10px"></def:datafieldcontrol>  </td><td> <def:datafieldcontrol runat="server" id="fiu_med18_dtto" DatabaseField="fiu_med18_dtto" IsEntryField="true" IsDoubleEntryField="true"  FieldTextBoxWidth="60px"  FieldLabelWidth="10px"></def:datafieldcontrol>  </td><td> <def:datafieldcontrol runat="server" id="fiu_med18_curr" DatabaseField="fiu_med18_curr" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="10px" FieldTextBoxWidth="50px"></def:datafieldcontrol>  </td> </tr> 
 <tr><td><asp:Label ID="Label19" runat="server" Text="Imipramine......Imipramine..........Antidepressant (Tricyclic)"		  Font-Name="Courier" /> </td>  <td> <def:datafieldcontrol runat="server" id="fiu_med19_reas" DatabaseField="fiu_med19_reas" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="10px" FieldTextBoxWidth="160px" FieldTextBoxMaxLength="100"></def:datafieldcontrol>  </td><td> <def:datafieldcontrol runat="server" id="fiu_med19_dtfrom" DatabaseField="fiu_med19_dtfrom" IsEntryField="true" IsDoubleEntryField="true"  FieldTextBoxWidth="60px" FieldLabelWidth="10px"></def:datafieldcontrol>  </td><td> <def:datafieldcontrol runat="server" id="fiu_med19_dtto" DatabaseField="fiu_med19_dtto" IsEntryField="true" IsDoubleEntryField="true"  FieldTextBoxWidth="60px"  FieldLabelWidth="10px"></def:datafieldcontrol>  </td><td> <def:datafieldcontrol runat="server" id="fiu_med19_curr" DatabaseField="fiu_med19_curr" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="10px" FieldTextBoxWidth="50px"></def:datafieldcontrol>  </td> </tr> 
 <tr><td><asp:Label ID="Label20" runat="server" Text="Desyrel.........Trazodone...........Antidepressant (other)"			  Font-Name="Courier" /> </td>  <td> <def:datafieldcontrol runat="server" id="fiu_med20_reas" DatabaseField="fiu_med20_reas" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="10px" FieldTextBoxWidth="160px" FieldTextBoxMaxLength="100"></def:datafieldcontrol>  </td><td> <def:datafieldcontrol runat="server" id="fiu_med20_dtfrom" DatabaseField="fiu_med20_dtfrom" IsEntryField="true" IsDoubleEntryField="true"  FieldTextBoxWidth="60px" FieldLabelWidth="10px"></def:datafieldcontrol>  </td><td> <def:datafieldcontrol runat="server" id="fiu_med20_dtto" DatabaseField="fiu_med20_dtto" IsEntryField="true" IsDoubleEntryField="true"  FieldTextBoxWidth="60px"  FieldLabelWidth="10px"></def:datafieldcontrol>  </td><td> <def:datafieldcontrol runat="server" id="fiu_med20_curr" DatabaseField="fiu_med20_curr" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="10px" FieldTextBoxWidth="50px"></def:datafieldcontrol>  </td> </tr> 
 <tr><td><asp:Label ID="Label21" runat="server" Text="Abilify.........Aripiprazole........Antipsychotic"					  Font-Name="Courier" /> </td>  <td> <def:datafieldcontrol runat="server" id="fiu_med21_reas" DatabaseField="fiu_med21_reas" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="10px" FieldTextBoxWidth="160px" FieldTextBoxMaxLength="100"></def:datafieldcontrol>  </td><td> <def:datafieldcontrol runat="server" id="fiu_med21_dtfrom" DatabaseField="fiu_med21_dtfrom" IsEntryField="true" IsDoubleEntryField="true"  FieldTextBoxWidth="60px" FieldLabelWidth="10px"></def:datafieldcontrol>  </td><td> <def:datafieldcontrol runat="server" id="fiu_med21_dtto" DatabaseField="fiu_med21_dtto" IsEntryField="true" IsDoubleEntryField="true"  FieldTextBoxWidth="60px"  FieldLabelWidth="10px"></def:datafieldcontrol>  </td><td> <def:datafieldcontrol runat="server" id="fiu_med21_curr" DatabaseField="fiu_med21_curr" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="10px" FieldTextBoxWidth="50px"></def:datafieldcontrol>  </td> </tr> 
 <tr><td><asp:Label ID="Label22" runat="server" Text="Geodon..........Ziprasidone.........Antipsychotic"					  Font-Name="Courier" /> </td>  <td> <def:datafieldcontrol runat="server" id="fiu_med22_reas" DatabaseField="fiu_med22_reas" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="10px" FieldTextBoxWidth="160px" FieldTextBoxMaxLength="100"></def:datafieldcontrol>  </td><td> <def:datafieldcontrol runat="server" id="fiu_med22_dtfrom" DatabaseField="fiu_med22_dtfrom" IsEntryField="true" IsDoubleEntryField="true"  FieldTextBoxWidth="60px" FieldLabelWidth="10px"></def:datafieldcontrol>  </td><td> <def:datafieldcontrol runat="server" id="fiu_med22_dtto" DatabaseField="fiu_med22_dtto" IsEntryField="true" IsDoubleEntryField="true"  FieldTextBoxWidth="60px"  FieldLabelWidth="10px"></def:datafieldcontrol>  </td><td> <def:datafieldcontrol runat="server" id="fiu_med22_curr" DatabaseField="fiu_med22_curr" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="10px" FieldTextBoxWidth="50px"></def:datafieldcontrol>  </td> </tr> 
 <tr><td><asp:Label ID="Label23" runat="server" Text="Risperdal.......Risperidone.........Antipsychotic"					  Font-Name="Courier" /> </td>  <td> <def:datafieldcontrol runat="server" id="fiu_med23_reas" DatabaseField="fiu_med23_reas" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="10px" FieldTextBoxWidth="160px" FieldTextBoxMaxLength="100"></def:datafieldcontrol>  </td><td> <def:datafieldcontrol runat="server" id="fiu_med23_dtfrom" DatabaseField="fiu_med23_dtfrom" IsEntryField="true" IsDoubleEntryField="true"  FieldTextBoxWidth="60px" FieldLabelWidth="10px"></def:datafieldcontrol>  </td><td> <def:datafieldcontrol runat="server" id="fiu_med23_dtto" DatabaseField="fiu_med23_dtto" IsEntryField="true" IsDoubleEntryField="true"  FieldTextBoxWidth="60px"  FieldLabelWidth="10px"></def:datafieldcontrol>  </td><td> <def:datafieldcontrol runat="server" id="fiu_med23_curr" DatabaseField="fiu_med23_curr" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="10px" FieldTextBoxWidth="50px"></def:datafieldcontrol>  </td> </tr> 
 <tr><td><asp:Label ID="Label24" runat="server" Text="Seroquel........Seroquel............Antipsychotic"					  Font-Name="Courier" /> </td>  <td> <def:datafieldcontrol runat="server" id="fiu_med24_reas" DatabaseField="fiu_med24_reas" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="10px" FieldTextBoxWidth="160px" FieldTextBoxMaxLength="100"></def:datafieldcontrol>  </td><td> <def:datafieldcontrol runat="server" id="fiu_med24_dtfrom" DatabaseField="fiu_med24_dtfrom" IsEntryField="true" IsDoubleEntryField="true"  FieldTextBoxWidth="60px" FieldLabelWidth="10px"></def:datafieldcontrol>  </td><td> <def:datafieldcontrol runat="server" id="fiu_med24_dtto" DatabaseField="fiu_med24_dtto" IsEntryField="true" IsDoubleEntryField="true"  FieldTextBoxWidth="60px"  FieldLabelWidth="10px"></def:datafieldcontrol>  </td><td> <def:datafieldcontrol runat="server" id="fiu_med24_curr" DatabaseField="fiu_med24_curr" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="10px" FieldTextBoxWidth="50px"></def:datafieldcontrol>  </td> </tr> 
 <tr><td><asp:Label ID="Label25" runat="server" Text="Zyprexa.........Olanzapine..........Antipsychotic"					  Font-Name="Courier" /> </td>  <td> <def:datafieldcontrol runat="server" id="fiu_med25_reas" DatabaseField="fiu_med25_reas" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="10px" FieldTextBoxWidth="160px" FieldTextBoxMaxLength="100"></def:datafieldcontrol>  </td><td> <def:datafieldcontrol runat="server" id="fiu_med25_dtfrom" DatabaseField="fiu_med25_dtfrom" IsEntryField="true" IsDoubleEntryField="true"  FieldTextBoxWidth="60px" FieldLabelWidth="10px"></def:datafieldcontrol>  </td><td> <def:datafieldcontrol runat="server" id="fiu_med25_dtto" DatabaseField="fiu_med25_dtto" IsEntryField="true" IsDoubleEntryField="true"  FieldTextBoxWidth="60px"  FieldLabelWidth="10px"></def:datafieldcontrol>  </td><td> <def:datafieldcontrol runat="server" id="fiu_med25_curr" DatabaseField="fiu_med25_curr" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="10px" FieldTextBoxWidth="50px"></def:datafieldcontrol>  </td> </tr> 
 <tr><td><asp:Label ID="Label26" runat="server" Text="Mellaril........Thioridazine........Antipsychotic"					  Font-Name="Courier" /> </td>  <td> <def:datafieldcontrol runat="server" id="fiu_med26_reas" DatabaseField="fiu_med26_reas" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="10px" FieldTextBoxWidth="160px" FieldTextBoxMaxLength="100"></def:datafieldcontrol>  </td><td> <def:datafieldcontrol runat="server" id="fiu_med26_dtfrom" DatabaseField="fiu_med26_dtfrom" IsEntryField="true" IsDoubleEntryField="true"  FieldTextBoxWidth="60px" FieldLabelWidth="10px"></def:datafieldcontrol>  </td><td> <def:datafieldcontrol runat="server" id="fiu_med26_dtto" DatabaseField="fiu_med26_dtto" IsEntryField="true" IsDoubleEntryField="true"  FieldTextBoxWidth="60px"  FieldLabelWidth="10px"></def:datafieldcontrol>  </td><td> <def:datafieldcontrol runat="server" id="fiu_med26_curr" DatabaseField="fiu_med26_curr" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="10px" FieldTextBoxWidth="50px"></def:datafieldcontrol>  </td> </tr> 
 <tr><td><asp:Label ID="Label27" runat="server" Text="Valium..........Diazepam............Benzodiazepine Anxiolytics"		  Font-Name="Courier" /> </td>  <td> <def:datafieldcontrol runat="server" id="fiu_med27_reas" DatabaseField="fiu_med27_reas" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="10px" FieldTextBoxWidth="160px" FieldTextBoxMaxLength="100"></def:datafieldcontrol>  </td><td> <def:datafieldcontrol runat="server" id="fiu_med27_dtfrom" DatabaseField="fiu_med27_dtfrom" IsEntryField="true" IsDoubleEntryField="true"  FieldTextBoxWidth="60px" FieldLabelWidth="10px"></def:datafieldcontrol>  </td><td> <def:datafieldcontrol runat="server" id="fiu_med27_dtto" DatabaseField="fiu_med27_dtto" IsEntryField="true" IsDoubleEntryField="true"  FieldTextBoxWidth="60px"  FieldLabelWidth="10px"></def:datafieldcontrol>  </td><td> <def:datafieldcontrol runat="server" id="fiu_med27_curr" DatabaseField="fiu_med27_curr" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="10px" FieldTextBoxWidth="50px"></def:datafieldcontrol>  </td> </tr> 
 <tr><td><asp:Label ID="Label28" runat="server" Text="Xanax...........Alprazolam..........Benzodiazepine Anxiolytics"		  Font-Name="Courier" /> </td>  <td> <def:datafieldcontrol runat="server" id="fiu_med28_reas" DatabaseField="fiu_med28_reas" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="10px" FieldTextBoxWidth="160px" FieldTextBoxMaxLength="100"></def:datafieldcontrol>  </td><td> <def:datafieldcontrol runat="server" id="fiu_med28_dtfrom" DatabaseField="fiu_med28_dtfrom" IsEntryField="true" IsDoubleEntryField="true"  FieldTextBoxWidth="60px" FieldLabelWidth="10px"></def:datafieldcontrol>  </td><td> <def:datafieldcontrol runat="server" id="fiu_med28_dtto" DatabaseField="fiu_med28_dtto" IsEntryField="true" IsDoubleEntryField="true"  FieldTextBoxWidth="60px"  FieldLabelWidth="10px"></def:datafieldcontrol>  </td><td> <def:datafieldcontrol runat="server" id="fiu_med28_curr" DatabaseField="fiu_med28_curr" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="10px" FieldTextBoxWidth="50px"></def:datafieldcontrol>  </td> </tr> 
 <tr><td><asp:Label ID="Label29" runat="server" Text="Buspar..........Buspirone...........Other Anxiolytic"					  Font-Name="Courier" /> </td>  <td> <def:datafieldcontrol runat="server" id="fiu_med29_reas" DatabaseField="fiu_med29_reas" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="10px" FieldTextBoxWidth="160px" FieldTextBoxMaxLength="100"></def:datafieldcontrol>  </td><td> <def:datafieldcontrol runat="server" id="fiu_med29_dtfrom" DatabaseField="fiu_med29_dtfrom" IsEntryField="true" IsDoubleEntryField="true"  FieldTextBoxWidth="60px" FieldLabelWidth="10px"></def:datafieldcontrol>  </td><td> <def:datafieldcontrol runat="server" id="fiu_med29_dtto" DatabaseField="fiu_med29_dtto" IsEntryField="true" IsDoubleEntryField="true"  FieldTextBoxWidth="60px"  FieldLabelWidth="10px"></def:datafieldcontrol>  </td><td> <def:datafieldcontrol runat="server" id="fiu_med29_curr" DatabaseField="fiu_med29_curr" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="10px" FieldTextBoxWidth="50px"></def:datafieldcontrol>  </td> </tr> 
 <tr><td><asp:Label ID="Label30" runat="server" Text="Melatonin.......Melatonin...........Melatonin"						  Font-Name="Courier" /> </td>  <td> <def:datafieldcontrol runat="server" id="fiu_med30_reas" DatabaseField="fiu_med30_reas" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="10px" FieldTextBoxWidth="160px" FieldTextBoxMaxLength="100"></def:datafieldcontrol>  </td><td> <def:datafieldcontrol runat="server" id="fiu_med30_dtfrom" DatabaseField="fiu_med30_dtfrom" IsEntryField="true" IsDoubleEntryField="true"  FieldTextBoxWidth="60px" FieldLabelWidth="10px"></def:datafieldcontrol>  </td><td> <def:datafieldcontrol runat="server" id="fiu_med30_dtto" DatabaseField="fiu_med30_dtto" IsEntryField="true" IsDoubleEntryField="true"  FieldTextBoxWidth="60px"  FieldLabelWidth="10px"></def:datafieldcontrol>  </td><td> <def:datafieldcontrol runat="server" id="fiu_med30_curr" DatabaseField="fiu_med30_curr" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="10px" FieldTextBoxWidth="50px"></def:datafieldcontrol>  </td> </tr> 
 <tr><td><asp:Label ID="Label31" runat="server" Text="Strattera.......Atomoxetine.........Norepinephrine Re-Uptake Inhibitor" Font-Name="Courier" /> </td>  <td> <def:datafieldcontrol runat="server" id="fiu_med31_reas" DatabaseField="fiu_med31_reas" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="10px" FieldTextBoxWidth="160px" FieldTextBoxMaxLength="100"></def:datafieldcontrol>  </td><td> <def:datafieldcontrol runat="server" id="fiu_med31_dtfrom" DatabaseField="fiu_med31_dtfrom" IsEntryField="true" IsDoubleEntryField="true"  FieldTextBoxWidth="60px" FieldLabelWidth="10px"></def:datafieldcontrol>  </td><td> <def:datafieldcontrol runat="server" id="fiu_med31_dtto" DatabaseField="fiu_med31_dtto" IsEntryField="true" IsDoubleEntryField="true"  FieldTextBoxWidth="60px"  FieldLabelWidth="10px"></def:datafieldcontrol>  </td><td> <def:datafieldcontrol runat="server" id="fiu_med31_curr" DatabaseField="fiu_med31_curr" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="10px" FieldTextBoxWidth="50px"></def:datafieldcontrol>  </td> </tr> 
 <tr><td><asp:Label ID="Label32" runat="server" Text="Cyproheptadine..Cyproheptadin.......Other Psychotropic"				  Font-Name="Courier" /> </td>  <td> <def:datafieldcontrol runat="server" id="fiu_med32_reas" DatabaseField="fiu_med32_reas" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="10px" FieldTextBoxWidth="160px" FieldTextBoxMaxLength="100"></def:datafieldcontrol>  </td><td> <def:datafieldcontrol runat="server" id="fiu_med32_dtfrom" DatabaseField="fiu_med32_dtfrom" IsEntryField="true" IsDoubleEntryField="true"  FieldTextBoxWidth="60px" FieldLabelWidth="10px"></def:datafieldcontrol>  </td><td> <def:datafieldcontrol runat="server" id="fiu_med32_dtto" DatabaseField="fiu_med32_dtto" IsEntryField="true" IsDoubleEntryField="true"  FieldTextBoxWidth="60px"  FieldLabelWidth="10px"></def:datafieldcontrol>  </td><td> <def:datafieldcontrol runat="server" id="fiu_med32_curr" DatabaseField="fiu_med32_curr" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="10px" FieldTextBoxWidth="50px"></def:datafieldcontrol>  </td> </tr> 
 <tr><td><asp:Label ID="Label33" runat="server" Text="Adderall........Amphetamine.........Stimulant"						  Font-Name="Courier" /> </td>  <td> <def:datafieldcontrol runat="server" id="fiu_med33_reas" DatabaseField="fiu_med33_reas" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="10px" FieldTextBoxWidth="160px" FieldTextBoxMaxLength="100"></def:datafieldcontrol>  </td><td> <def:datafieldcontrol runat="server" id="fiu_med33_dtfrom" DatabaseField="fiu_med33_dtfrom" IsEntryField="true" IsDoubleEntryField="true"  FieldTextBoxWidth="60px" FieldLabelWidth="10px"></def:datafieldcontrol>  </td><td> <def:datafieldcontrol runat="server" id="fiu_med33_dtto" DatabaseField="fiu_med33_dtto" IsEntryField="true" IsDoubleEntryField="true"  FieldTextBoxWidth="60px"  FieldLabelWidth="10px"></def:datafieldcontrol>  </td><td> <def:datafieldcontrol runat="server" id="fiu_med33_curr" DatabaseField="fiu_med33_curr" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="10px" FieldTextBoxWidth="50px"></def:datafieldcontrol>  </td> </tr> 
 <tr><td><asp:Label ID="Label34" runat="server" Text="Focalin.........Dexmethylphenidate..Stimulant"						  Font-Name="Courier" /> </td>  <td> <def:datafieldcontrol runat="server" id="fiu_med34_reas" DatabaseField="fiu_med34_reas" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="10px" FieldTextBoxWidth="160px" FieldTextBoxMaxLength="100"></def:datafieldcontrol>  </td><td> <def:datafieldcontrol runat="server" id="fiu_med34_dtfrom" DatabaseField="fiu_med34_dtfrom" IsEntryField="true" IsDoubleEntryField="true"  FieldTextBoxWidth="60px" FieldLabelWidth="10px"></def:datafieldcontrol>  </td><td> <def:datafieldcontrol runat="server" id="fiu_med34_dtto" DatabaseField="fiu_med34_dtto" IsEntryField="true" IsDoubleEntryField="true"  FieldTextBoxWidth="60px"  FieldLabelWidth="10px"></def:datafieldcontrol>  </td><td> <def:datafieldcontrol runat="server" id="fiu_med34_curr" DatabaseField="fiu_med34_curr" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="10px" FieldTextBoxWidth="50px"></def:datafieldcontrol>  </td> </tr> 
 <tr><td><asp:Label ID="Label35" runat="server" Text="Ritalin.........Methylphenidate.....Stimulant"						  Font-Name="Courier" /> </td>  <td> <def:datafieldcontrol runat="server" id="fiu_med35_reas" DatabaseField="fiu_med35_reas" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="10px" FieldTextBoxWidth="160px" FieldTextBoxMaxLength="100"></def:datafieldcontrol>  </td><td> <def:datafieldcontrol runat="server" id="fiu_med35_dtfrom" DatabaseField="fiu_med35_dtfrom" IsEntryField="true" IsDoubleEntryField="true"  FieldTextBoxWidth="60px" FieldLabelWidth="10px"></def:datafieldcontrol>  </td><td> <def:datafieldcontrol runat="server" id="fiu_med35_dtto" DatabaseField="fiu_med35_dtto" IsEntryField="true" IsDoubleEntryField="true"  FieldTextBoxWidth="60px"  FieldLabelWidth="10px"></def:datafieldcontrol>  </td><td> <def:datafieldcontrol runat="server" id="fiu_med35_curr" DatabaseField="fiu_med35_curr" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="10px" FieldTextBoxWidth="50px"></def:datafieldcontrol>  </td> </tr> 
 <tr><td>     <def:datafieldcontrol runat="server" id="Datafieldcontrol336" DatabaseField="fiu_med36_name" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="100px" FieldTextBoxWidth="201px" ></def:datafieldcontrol>

     </td>  <td> <def:datafieldcontrol runat="server" id="fiu_med36_reas" DatabaseField="fiu_med36_reas" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="10px" FieldTextBoxWidth="160px" FieldTextBoxMaxLength="100"></def:datafieldcontrol>  </td><td> <def:datafieldcontrol runat="server" id="fiu_med36_dtfrom" DatabaseField="fiu_med36_dtfrom" IsEntryField="true" IsDoubleEntryField="true"  FieldTextBoxWidth="60px" FieldLabelWidth="10px"></def:datafieldcontrol>  </td><td> <def:datafieldcontrol runat="server" id="fiu_med36_dtto" DatabaseField="fiu_med36_dtto" IsEntryField="true" IsDoubleEntryField="true"  FieldTextBoxWidth="60px"  FieldLabelWidth="10px"></def:datafieldcontrol>  </td><td> <def:datafieldcontrol runat="server" id="fiu_med36_curr" DatabaseField="fiu_med36_curr" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="10px" FieldTextBoxWidth="50px"></def:datafieldcontrol>  </td> </tr> 
 <tr><td> <def:datafieldcontrol runat="server" id="Datafieldcontrol337" DatabaseField="fiu_med37_name" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="100px" FieldTextBoxWidth="201px" ></def:datafieldcontrol>

     </td>  <td> <def:datafieldcontrol runat="server" id="fiu_med37_reas" DatabaseField="fiu_med37_reas" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="10px" FieldTextBoxWidth="160px" FieldTextBoxMaxLength="100"></def:datafieldcontrol>  </td><td> <def:datafieldcontrol runat="server" id="fiu_med37_dtfrom" DatabaseField="fiu_med37_dtfrom" IsEntryField="true" IsDoubleEntryField="true"  FieldTextBoxWidth="60px" FieldLabelWidth="10px"></def:datafieldcontrol>  </td><td> <def:datafieldcontrol runat="server" id="fiu_med37_dtto" DatabaseField="fiu_med37_dtto" IsEntryField="true" IsDoubleEntryField="true"  FieldTextBoxWidth="60px"  FieldLabelWidth="10px"></def:datafieldcontrol>  </td><td> <def:datafieldcontrol runat="server" id="fiu_med37_curr" DatabaseField="fiu_med37_curr" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="10px" FieldTextBoxWidth="50px"></def:datafieldcontrol>  </td> </tr> 
 <tr><td>
          <def:datafieldcontrol runat="server" id="Datafieldcontrol338" DatabaseField="fiu_med38_name" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="100px" FieldTextBoxWidth="201px" ></def:datafieldcontrol>

     </td>  <td> <def:datafieldcontrol runat="server" id="fiu_med38_reas" DatabaseField="fiu_med38_reas" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="10px" FieldTextBoxWidth="160px" FieldTextBoxMaxLength="100"></def:datafieldcontrol>  </td><td> <def:datafieldcontrol runat="server" id="fiu_med38_dtfrom" DatabaseField="fiu_med38_dtfrom" IsEntryField="true" IsDoubleEntryField="true"  FieldTextBoxWidth="60px" FieldLabelWidth="10px"></def:datafieldcontrol>  </td><td> <def:datafieldcontrol runat="server" id="fiu_med38_dtto" DatabaseField="fiu_med38_dtto" IsEntryField="true" IsDoubleEntryField="true"  FieldTextBoxWidth="60px"  FieldLabelWidth="10px"></def:datafieldcontrol>  </td><td> <def:datafieldcontrol runat="server" id="fiu_med38_curr" DatabaseField="fiu_med38_curr" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="10px" FieldTextBoxWidth="50px"></def:datafieldcontrol>  </td> </tr> 
 <tr><td>
          <def:datafieldcontrol runat="server" id="Datafieldcontrol339" DatabaseField="fiu_med39_name" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="100px" FieldTextBoxWidth="201px" ></def:datafieldcontrol>

     </td>  <td> <def:datafieldcontrol runat="server" id="fiu_med39_reas" DatabaseField="fiu_med39_reas" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="10px" FieldTextBoxWidth="160px" FieldTextBoxMaxLength="100"></def:datafieldcontrol>  </td><td> <def:datafieldcontrol runat="server" id="fiu_med39_dtfrom" DatabaseField="fiu_med39_dtfrom" IsEntryField="true" IsDoubleEntryField="true"  FieldTextBoxWidth="60px" FieldLabelWidth="10px"></def:datafieldcontrol>  </td><td> <def:datafieldcontrol runat="server" id="fiu_med39_dtto" DatabaseField="fiu_med39_dtto" IsEntryField="true" IsDoubleEntryField="true"  FieldTextBoxWidth="60px"  FieldLabelWidth="10px"></def:datafieldcontrol>  </td><td> <def:datafieldcontrol runat="server" id="fiu_med39_curr" DatabaseField="fiu_med39_curr" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="10px" FieldTextBoxWidth="50px"></def:datafieldcontrol>  </td> </tr> 
 <tr><td>
          <def:datafieldcontrol runat="server" id="Datafieldcontrol340" DatabaseField="fiu_med40_name" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="100px" FieldTextBoxWidth="201px" ></def:datafieldcontrol>

     </td>  <td> <def:datafieldcontrol runat="server" id="fiu_med40_reas" DatabaseField="fiu_med40_reas" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="10px" FieldTextBoxWidth="160px" FieldTextBoxMaxLength="100"></def:datafieldcontrol>  </td><td> <def:datafieldcontrol runat="server" id="fiu_med40_dtfrom" DatabaseField="fiu_med40_dtfrom" IsEntryField="true" IsDoubleEntryField="true"  FieldTextBoxWidth="60px" FieldLabelWidth="10px"></def:datafieldcontrol>  </td><td> <def:datafieldcontrol runat="server" id="fiu_med40_dtto" DatabaseField="fiu_med40_dtto" IsEntryField="true" IsDoubleEntryField="true"  FieldTextBoxWidth="60px"  FieldLabelWidth="10px"></def:datafieldcontrol>  </td><td> <def:datafieldcontrol runat="server" id="fiu_med40_curr" DatabaseField="fiu_med40_curr" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="10px" FieldTextBoxWidth="50px"></def:datafieldcontrol>  </td> </tr> 



</table>



      <br/> <br/>
<asp:Label ID="Label42" runat="server" Text="4. Meds for other reasons (not behavioral/emotional)" Font-Bold="true"  Font-Size="Medium"></asp:Label>
      <br/>
       <def:datafieldcontrol runat="server" id="fiu_othmed_curr" DatabaseField="fiu_othmed_curr" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="200px" FieldTextBoxWidth="20px" FieldTextBoxMaxLength="100"></def:datafieldcontrol>  <br/>
       <def:datafieldcontrol runat="server" id="fiu_othmed_past" DatabaseField="fiu_othmed_past" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="200px" FieldTextBoxWidth="20px" FieldTextBoxMaxLength="100"></def:datafieldcontrol>  <br/>


<table>
        <tr>
<td align="right"><b><i>Name</i></b></td>
<td align="right"><b><i>Generic Name</i></b></td>
<td align="right"><b><i>Med class</i></b></td>
<td align="right"><b><i>Reason Taken</i></b></td>
<td align="right"><b><i>Dates Taken:<br/>From</i></b></td>
<td align="right"><b><i>Dates Taken:<br/>To</i></b></td>
<td align="right"><b><i>Current?<br/>(1=Y, 0=N)</i></b></td>

            </tr>

    <tr>
 <td> <def:datafieldcontrol runat="server" id="fiu_othmed01_name" DatabaseField="fiu_othmed01_name" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="20px" FieldTextBoxWidth="100px" FieldTextBoxMaxLength="100"></def:datafieldcontrol>  </td>
<td> <def:datafieldcontrol runat="server" id="fiu_othmed01_name_gen" DatabaseField="fiu_othmed01_name_gen" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="11px" FieldTextBoxWidth="100px" FieldTextBoxMaxLength="100"></def:datafieldcontrol>  </td>
<td> <def:datafieldcontrol runat="server" id="fiu_othmed01_class" DatabaseField="fiu_othmed01_class" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="11px" FieldTextBoxWidth="100px" FieldTextBoxMaxLength="100"></def:datafieldcontrol>  </td>
<td> <def:datafieldcontrol runat="server" id="fiu_othmed01_reas" DatabaseField="fiu_othmed01_reas" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="11px" FieldTextBoxWidth="160px" FieldTextBoxMaxLength="100"></def:datafieldcontrol>  </td>
<td> <def:datafieldcontrol runat="server" id="fiu_othmed01_dtfrom" DatabaseField="fiu_othmed01_dtfrom" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="11px" FieldTextBoxWidth="70px" FormatString="{0:d}"></def:datafieldcontrol>  </td>
<td> <def:datafieldcontrol runat="server" id="fiu_othmed01_dtto" DatabaseField="fiu_othmed01_dtto" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="11px"  FieldTextBoxWidth="70px" FormatString="{0:d}"></def:datafieldcontrol>  </td>
<td> <def:datafieldcontrol runat="server" id="fiu_othmed01_curr" DatabaseField="fiu_othmed01_curr" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="11px" FieldTextBoxWidth="50px"></def:datafieldcontrol>  </td> 
</tr> 
<tr>
 <td> <def:datafieldcontrol runat="server" id="fiu_othmed02_name" DatabaseField="fiu_othmed02_name" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="20px" FieldTextBoxWidth="100px" FieldTextBoxMaxLength="100"></def:datafieldcontrol>  </td>
<td> <def:datafieldcontrol runat="server" id="fiu_othmed02_name_gen" DatabaseField="fiu_othmed02_name_gen" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="11px" FieldTextBoxWidth="100px" FieldTextBoxMaxLength="100"></def:datafieldcontrol>  </td>
<td> <def:datafieldcontrol runat="server" id="fiu_othmed02_class" DatabaseField="fiu_othmed02_class" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="11px" FieldTextBoxWidth="100px" FieldTextBoxMaxLength="100"></def:datafieldcontrol>  </td>
<td> <def:datafieldcontrol runat="server" id="fiu_othmed02_reas" DatabaseField="fiu_othmed02_reas" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="11px" FieldTextBoxWidth="160px" FieldTextBoxMaxLength="100"></def:datafieldcontrol>  </td>
<td> <def:datafieldcontrol runat="server" id="fiu_othmed02_dtfrom" DatabaseField="fiu_othmed02_dtfrom" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="11px" FieldTextBoxWidth="70px"  FormatString="{0:d}"></def:datafieldcontrol>  </td>
<td> <def:datafieldcontrol runat="server" id="fiu_othmed02_dtto" DatabaseField="fiu_othmed02_dtto" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="11px"  FieldTextBoxWidth="70px" FormatString="{0:d}"></def:datafieldcontrol>  </td>
<td> <def:datafieldcontrol runat="server" id="fiu_othmed02_curr" DatabaseField="fiu_othmed02_curr" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="11px" FieldTextBoxWidth="50px"></def:datafieldcontrol>  </td> 
</tr> 
<tr>
 <td> <def:datafieldcontrol runat="server" id="fiu_othmed03_name" DatabaseField="fiu_othmed03_name" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="20px" FieldTextBoxWidth="100px" FieldTextBoxMaxLength="100"></def:datafieldcontrol>  </td>
<td> <def:datafieldcontrol runat="server" id="fiu_othmed03_name_gen" DatabaseField="fiu_othmed03_name_gen" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="11px" FieldTextBoxWidth="100px" FieldTextBoxMaxLength="100"></def:datafieldcontrol>  </td>
<td> <def:datafieldcontrol runat="server" id="fiu_othmed03_class" DatabaseField="fiu_othmed03_class" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="11px" FieldTextBoxWidth="100px" FieldTextBoxMaxLength="100"></def:datafieldcontrol>  </td>
<td> <def:datafieldcontrol runat="server" id="fiu_othmed03_reas" DatabaseField="fiu_othmed03_reas" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="11px" FieldTextBoxWidth="160px" FieldTextBoxMaxLength="100"></def:datafieldcontrol>  </td>
<td> <def:datafieldcontrol runat="server" id="fiu_othmed03_dtfrom" DatabaseField="fiu_othmed03_dtfrom" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="11px"  FieldTextBoxWidth="70px" FormatString="{0:d}"></def:datafieldcontrol>  </td>
<td> <def:datafieldcontrol runat="server" id="fiu_othmed03_dtto" DatabaseField="fiu_othmed03_dtto" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="11px"  FieldTextBoxWidth="70px" FormatString="{0:d}"></def:datafieldcontrol>  </td>
<td> <def:datafieldcontrol runat="server" id="fiu_othmed03_curr" DatabaseField="fiu_othmed03_curr" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="11px" FieldTextBoxWidth="50px"></def:datafieldcontrol>  </td> 
</tr> 
<tr>
 <td> <def:datafieldcontrol runat="server" id="fiu_othmed04_name" DatabaseField="fiu_othmed04_name" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="20px" FieldTextBoxWidth="100px" FieldTextBoxMaxLength="100"></def:datafieldcontrol>  </td>
<td> <def:datafieldcontrol runat="server" id="fiu_othmed04_name_gen" DatabaseField="fiu_othmed04_name_gen" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="11px" FieldTextBoxWidth="100px" FieldTextBoxMaxLength="100"></def:datafieldcontrol>  </td>
<td> <def:datafieldcontrol runat="server" id="fiu_othmed04_class" DatabaseField="fiu_othmed04_class" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="11px" FieldTextBoxWidth="100px" FieldTextBoxMaxLength="100"></def:datafieldcontrol>  </td>
<td> <def:datafieldcontrol runat="server" id="fiu_othmed04_reas" DatabaseField="fiu_othmed04_reas" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="11px" FieldTextBoxWidth="160px" FieldTextBoxMaxLength="100"></def:datafieldcontrol>  </td>
<td> <def:datafieldcontrol runat="server" id="fiu_othmed04_dtfrom" DatabaseField="fiu_othmed04_dtfrom" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="11px"  FieldTextBoxWidth="70px" FormatString="{0:d}"></def:datafieldcontrol>  </td>
<td> <def:datafieldcontrol runat="server" id="fiu_othmed04_dtto" DatabaseField="fiu_othmed04_dtto" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="11px"  FieldTextBoxWidth="70px" FormatString="{0:d}"></def:datafieldcontrol>  </td>
<td> <def:datafieldcontrol runat="server" id="fiu_othmed04_curr" DatabaseField="fiu_othmed04_curr" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="11px" FieldTextBoxWidth="50px"></def:datafieldcontrol>  </td> 
</tr> 
<tr>
 <td> <def:datafieldcontrol runat="server" id="fiu_othmed05_name" DatabaseField="fiu_othmed05_name" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="20px" FieldTextBoxWidth="100px" FieldTextBoxMaxLength="100"></def:datafieldcontrol>  </td>
<td> <def:datafieldcontrol runat="server" id="fiu_othmed05_name_gen" DatabaseField="fiu_othmed05_name_gen" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="11px" FieldTextBoxWidth="100px" FieldTextBoxMaxLength="100"></def:datafieldcontrol>  </td>
<td> <def:datafieldcontrol runat="server" id="fiu_othmed05_class" DatabaseField="fiu_othmed05_class" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="11px" FieldTextBoxWidth="100px" FieldTextBoxMaxLength="100"></def:datafieldcontrol>  </td>
<td> <def:datafieldcontrol runat="server" id="fiu_othmed05_reas" DatabaseField="fiu_othmed05_reas" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="11px" FieldTextBoxWidth="160px" FieldTextBoxMaxLength="100"></def:datafieldcontrol>  </td>
<td> <def:datafieldcontrol runat="server" id="fiu_othmed05_dtfrom" DatabaseField="fiu_othmed05_dtfrom" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="11px"  FieldTextBoxWidth="70px" FormatString="{0:d}"></def:datafieldcontrol>  </td>
<td> <def:datafieldcontrol runat="server" id="fiu_othmed05_dtto" DatabaseField="fiu_othmed05_dtto" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="11px"  FieldTextBoxWidth="70px" FormatString="{0:d}"></def:datafieldcontrol>  </td>
<td> <def:datafieldcontrol runat="server" id="fiu_othmed05_curr" DatabaseField="fiu_othmed05_curr" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="11px" FieldTextBoxWidth="50px"></def:datafieldcontrol>  </td> 
</tr> 
<tr>
 <td> <def:datafieldcontrol runat="server" id="fiu_othmed06_name" DatabaseField="fiu_othmed06_name" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="20px" FieldTextBoxWidth="100px" FieldTextBoxMaxLength="100"></def:datafieldcontrol>  </td>
<td> <def:datafieldcontrol runat="server" id="fiu_othmed06_name_gen" DatabaseField="fiu_othmed06_name_gen" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="11px" FieldTextBoxWidth="100px" FieldTextBoxMaxLength="100"></def:datafieldcontrol>  </td>
<td> <def:datafieldcontrol runat="server" id="fiu_othmed06_class" DatabaseField="fiu_othmed06_class" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="11px" FieldTextBoxWidth="100px" FieldTextBoxMaxLength="100"></def:datafieldcontrol>  </td>
<td> <def:datafieldcontrol runat="server" id="fiu_othmed06_reas" DatabaseField="fiu_othmed06_reas" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="11px" FieldTextBoxWidth="160px" FieldTextBoxMaxLength="100"></def:datafieldcontrol>  </td>
<td> <def:datafieldcontrol runat="server" id="fiu_othmed06_dtfrom" DatabaseField="fiu_othmed06_dtfrom" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="11px" FieldTextBoxWidth="70px"  FormatString="{0:d}"></def:datafieldcontrol>  </td>
<td> <def:datafieldcontrol runat="server" id="fiu_othmed06_dtto" DatabaseField="fiu_othmed06_dtto" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="11px"  FieldTextBoxWidth="70px" FormatString="{0:d}"></def:datafieldcontrol>  </td>
<td> <def:datafieldcontrol runat="server" id="fiu_othmed06_curr" DatabaseField="fiu_othmed06_curr" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="11px" FieldTextBoxWidth="50px"></def:datafieldcontrol>  </td> 
</tr> 



</table>


<br/><br/>
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
