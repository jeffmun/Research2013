<%@ Register TagPrefix="def" Namespace="DataEntryFramework3" %> 
<%@ Page language="c#" MasterPageFile="~/UWAC.master"  Title="FIF_Tadpol Data Entry" %>
<asp:Content ID="Content1" ContentPlaceHolderID="oBodyPlaceHolder" runat="server">

<def:dataentrycontroller id="DataEntryController1" runat="server" DatabaseTable="ALL_FIF_Tadpole" PrimaryKeyField="fiftad_pk">
</def:dataentrycontroller>
   <asp:ScriptManager ID="ScriptManager1" runat="server">    </asp:ScriptManager>
<asp:UpdatePanel ID="UpdatePanel1" runat="server">
  <ContentTemplate>
<table>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="id" DatabaseField="id" IsInsertField="true" FieldLabelWidth="300px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="15"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="indexnum" DatabaseField="indexnum" IsInsertField="true" FieldTextBoxTextDefault="1" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="fiftad_date" DatabaseField="fiftad_date" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FormatString="{0:d}" ></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="fiftad_agemo" DatabaseField="fiftad_agemo"  IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="fiftad_resp" DatabaseField="fiftad_resp" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="300px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="50"></def:datafieldcontrol></td>
<td></td></tr>
 
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="fiftad_cmnt" DatabaseField="fiftad_cmnt" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="300px" FieldTextBoxWidth="400px" FieldTextBoxHeight="40px" FieldTextBoxTextMode="multiline" FieldTextBoxMaxLength="250"></def:datafieldcontrol></td>
<td></td></tr>
 
    </table>

<%--Hear about?--%>
<table>
        <tr>
            <%--Hear About Y/N--%>
            <td>
                <br /><br />
                <asp:Label ID="lbl01" runat="server" Text="How did you hear about the study?" Font-Bold="true" Font-Underline="true"></asp:Label>
                <br />
                <table>
                                        <tr><td align="right"><b><u>Enter 1 for Yes, 0 for No/Blank</u></b></td></tr>

                    <tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="fiftad_refsrc_fam" DatabaseField="fiftad_refsrc_fam" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
                    </tr>
 
                    <tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="fiftad_refsrc_frnd" DatabaseField="fiftad_refsrc_frnd" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
                    </tr>
 
                    <tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="fiftad_refsrc_birth3" DatabaseField="fiftad_refsrc_birth3" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
                    </tr>
 
                    <tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="fiftad_refsrc_othprof" DatabaseField="fiftad_refsrc_othprof" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
                    </tr>
 
                    <tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="fiftad_refsrc_web" DatabaseField="fiftad_refsrc_web" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
                    </tr>
 
                    <tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="fiftad_refsrc_broch" DatabaseField="fiftad_refsrc_broch" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
                    </tr>
 
                    <tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="fiftad_refsrc_media" DatabaseField="fiftad_refsrc_media" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
                    </tr>
 
                    <tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="fiftad_refsrc_oth" DatabaseField="fiftad_refsrc_oth" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
                    </tr>

                </table>

            </td>



             <%--Hear About Specify details--%>
            <td>        <br /><br />
                <asp:Label ID="Label1" runat="server" Text=" " ></asp:Label>
                <br />

                <table>

                    <tr><td align="center"><b><u>Comments/details</u></b></td><td></td></tr>
                    
                <tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="fiftad_refsrc_fam_txt" DatabaseField="fiftad_refsrc_fam_txt" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="100px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="100"></def:datafieldcontrol></td>
                <td></td></tr>
 
                <tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="fiftad_refsrc_frnd_txt" DatabaseField="fiftad_refsrc_frnd_txt" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="100px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="100"></def:datafieldcontrol></td>
                <td></td></tr>
 
                <tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="fiftad_refsrc_birth3_txt" DatabaseField="fiftad_refsrc_birth3_txt" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="100px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="100"></def:datafieldcontrol></td>
                <td></td></tr>
 
                <tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="fiftad_refsrc_othprof_txt" DatabaseField="fiftad_refsrc_othprof_txt" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="100px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="100"></def:datafieldcontrol></td>
                <td></td></tr>
 
                <tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="fiftad_refsrc_web_txt" DatabaseField="fiftad_refsrc_web_txt" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="100px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="100"></def:datafieldcontrol></td>
                <td></td></tr>
 
                <tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="fiftad_refsrc_broch_txt" DatabaseField="fiftad_refsrc_broch_txt" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="100px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="100"></def:datafieldcontrol></td>
                <td></td></tr>
 
                <tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="fiftad_refsrc_media_txt" DatabaseField="fiftad_refsrc_media_txt" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="100px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="100"></def:datafieldcontrol></td>
                <td></td></tr>
 
                <tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="fiftad_refsrc_oth_txt" DatabaseField="fiftad_refsrc_oth_txt" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="100px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="100"></def:datafieldcontrol></td>
                <td></td></tr>
 

                </table>
            </td>


        </tr>

 </table>



<br /><br /><br />

<table>
    <tr>
                          <%--Ethnicity codes--%>
                    <td style="vertical-align:top">
                              <table>
          <tr>
              <td>
                  <asp:Label ID="lbl10" runat="server" Text ="Ethnicity Codes" ForeColor="DarkBlue" Font-Size="X-Small" Font-Bold="true" Font-Underline="true"/><br />
                  <asp:Label ID="Label13" runat="server" Text ="1=African-American<br />2=Asian<br />3=Pacific Islander<br />4=Caucasian" ForeColor="DarkBlue" Font-Size="X-Small" Font-Bold="false" Font-Underline="false"/>
                  </td>
              <td>
                  <asp:Label ID="Label14" runat="server" Text ="5=Native American<br />6=Indian<br />7=Hispanic<br />8=Other (specify)<br />9=Multiple (specify)" ForeColor="DarkBlue" Font-Size="X-Small" Font-Bold="false" Font-Underline="false"/>
               </td>
          </tr>
          </table>

                    </td>
    </tr>
</table>

<%--    Year in USA / Primary Lang--%>
      <table>

                <tr>
                    <%--CHILD--%>
                    <td>
                        <asp:Label ID="lab02" runat="server" Text="Child Language" Font-Bold="true" Font-Underline="true" ></asp:Label><br />

                        <table>
                        <tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="fiftad_yrtousa_ch" DatabaseField="fiftad_yrtousa_ch" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="200px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
                        </tr>
                        <tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="fiftad_eth_ch" DatabaseField="fiftad_eth_ch" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="200px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
                        </tr>
                        <tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="fiftad_ethtxt_ch" DatabaseField="fiftad_ethtxt_ch" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="200px" FieldTextBoxWidth="150px"></def:datafieldcontrol></td>
                        </tr>
 
                        <tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="fiftad_primeth_ch" DatabaseField="fiftad_primeth_ch" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="200px" FieldTextBoxWidth="150px"></def:datafieldcontrol></td>
                        </tr>

                                                    <tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="fiftad_lang_ch01" DatabaseField="fiftad_lang_ch01" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="40px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="50"></def:datafieldcontrol></td>
                        </tr>
 
                        <tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="fiftad_lang_ch02" DatabaseField="fiftad_lang_ch02" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="40px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="50"></def:datafieldcontrol></td>
                        </tr>
 
                        <tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="fiftad_lang_ch03" DatabaseField="fiftad_lang_ch03" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="40px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="50"></def:datafieldcontrol></td>
                        </tr>
 
                        <tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="fiftad_lang_ch04" DatabaseField="fiftad_lang_ch04" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="40px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="50"></def:datafieldcontrol></td>
                        </tr>
 
                        <tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="fiftad_lang_ch05" DatabaseField="fiftad_lang_ch05" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="40px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="50"></def:datafieldcontrol></td>
                        </tr>
 
                        <tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="fiftad_lang_ch06" DatabaseField="fiftad_lang_ch06" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="40px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="50"></def:datafieldcontrol></td>
                        </tr>
                     </table></td>

                    <%--MOTHER--%>
                    <td>
                        <asp:Label ID="Label2" runat="server" Text="Mother Language" Font-Bold="true" Font-Underline="true" ></asp:Label><br />                        
                        <table>
                        <tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="Datafieldcontrol1" DatabaseField="fiftad_yrtousa_mo" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="200px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
                        </tr>
 
                        <tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="Datafieldcontrol3" DatabaseField="fiftad_eth_mo" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="200px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
                        </tr>
                        <tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="Datafieldcontrol5" DatabaseField="fiftad_ethtxt_mo" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="200px" FieldTextBoxWidth="150px"></def:datafieldcontrol></td>
                        </tr>

                        <tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="Datafieldcontrol2" DatabaseField="fiftad_primeth_mo" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="200px" FieldTextBoxWidth="150px"></def:datafieldcontrol></td>
                        </tr>

                    <tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="fiftad_lang_mo01" DatabaseField="fiftad_lang_mo01" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="40px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="50"></def:datafieldcontrol></td>
                    </tr>
 
                    <tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="fiftad_lang_mo02" DatabaseField="fiftad_lang_mo02" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="40px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="50"></def:datafieldcontrol></td>
                    </tr>
 
                    <tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="fiftad_lang_mo03" DatabaseField="fiftad_lang_mo03" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="40px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="50"></def:datafieldcontrol></td>
                    </tr>
 
                    <tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="fiftad_lang_mo04" DatabaseField="fiftad_lang_mo04" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="40px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="50"></def:datafieldcontrol></td>
                    </tr>
 
                    <tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="fiftad_lang_mo05" DatabaseField="fiftad_lang_mo05" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="40px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="50"></def:datafieldcontrol></td>
                    </tr>
 
                    <tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="fiftad_lang_mo06" DatabaseField="fiftad_lang_mo06" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="40px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="50"></def:datafieldcontrol></td>
                    </tr>
                     </table></td>

                    <%--FATHER--%>
                    <td>
                        <asp:Label ID="Label3" runat="server" Text="Father Language" Font-Bold="true" Font-Underline="true" ></asp:Label><br />                        
                        
                        <table>
                        
                        <tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="fiftad_yrtousa_fa" DatabaseField="fiftad_yrtousa_fa" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="200px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
                        </tr>
                        <tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="Datafieldcontrol4" DatabaseField="fiftad_eth_fa" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="200px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
                        </tr> 
                        <tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="Datafieldcontrol6" DatabaseField="fiftad_ethtxt_fa" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="200px" FieldTextBoxWidth="150px"></def:datafieldcontrol></td>
                        </tr>

                        <tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="fiftad_primeth_fa" DatabaseField="fiftad_primeth_fa" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="200px" FieldTextBoxWidth="150px"></def:datafieldcontrol></td>
                        </tr>
                         <tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="fiftad_lang_fa01" DatabaseField="fiftad_lang_fa01" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="40px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="50"></def:datafieldcontrol></td>
                        </tr>
 
                        <tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="fiftad_lang_fa02" DatabaseField="fiftad_lang_fa02" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="40px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="50"></def:datafieldcontrol></td>
                        </tr>
 
                        <tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="fiftad_lang_fa03" DatabaseField="fiftad_lang_fa03" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="40px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="50"></def:datafieldcontrol></td>
                        </tr>
 
                        <tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="fiftad_lang_fa04" DatabaseField="fiftad_lang_fa04" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="40px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="50"></def:datafieldcontrol></td>
                        </tr>
 
                        <tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="fiftad_lang_fa05" DatabaseField="fiftad_lang_fa05" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="40px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="50"></def:datafieldcontrol></td>
                        </tr>
 
                        <tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="fiftad_lang_fa06" DatabaseField="fiftad_lang_fa06" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="40px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="50"></def:datafieldcontrol></td>
                        </tr>

                     </table></td>



                </tr>
          </table>


<table>

    <%--   Lang 1 - 6 --%>
                <tr>
                    <%--Percent--%>
                    <td valign="bottom">
                                               <asp:Label ID="Label4" runat="server" Text="Child Language Heard" Font-Bold="true" Font-Underline="true" ></asp:Label><br />

                        <table>
                            <tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="fiftad_heard_Eng_pct" DatabaseField="fiftad_heard_Eng_pct" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="200px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
</tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="fiftad_heard_lang01pct" DatabaseField="fiftad_heard_lang01pct" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="200px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
</tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="fiftad_heard_lang02pct" DatabaseField="fiftad_heard_lang02pct" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="200px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
</tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="fiftad_heard_lang03pct" DatabaseField="fiftad_heard_lang03pct" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="200px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
</tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="fiftad_heard_lang04pct" DatabaseField="fiftad_heard_lang04pct" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="200px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
</tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="fiftad_heard_lang05pct" DatabaseField="fiftad_heard_lang05pct" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="200px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
</tr>
                     </table></td>

                    <%--lang--%>
                    <td valign="bottom"><table>
                        
                        <tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="fiftad_heard_lang01" DatabaseField="fiftad_heard_lang01" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="80px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="50"></def:datafieldcontrol></td>
</tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="fiftad_heard_lang02" DatabaseField="fiftad_heard_lang02" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="80px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="50"></def:datafieldcontrol></td>
</tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="fiftad_heard_lang03" DatabaseField="fiftad_heard_lang03" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="80px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="50"></def:datafieldcontrol></td>
</tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="fiftad_heard_lang04" DatabaseField="fiftad_heard_lang04" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="80px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="50"></def:datafieldcontrol></td>
</tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="fiftad_heard_lang05" DatabaseField="fiftad_heard_lang05" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="80px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="50"></def:datafieldcontrol></td>
</tr>

                     </table></td>


                </tr>


</table>
 
 
<asp:Label ID="lbl04" runat="server" Text="WHo does child live with?  1=Yes, 0=No/Blank" Font-Bold="true" Font-Underline="true"></asp:Label><br />
 <table>
 

 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="fiftad_live_biomo" DatabaseField="fiftad_live_biomo" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
</tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="fiftad_live_biofa" DatabaseField="fiftad_live_biofa" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
</tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="fiftad_live_stopmo" DatabaseField="fiftad_live_stopmo" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
</tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="fiftad_live_stepfa" DatabaseField="fiftad_live_stepfa" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
</tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="fiftad_live_adopmo" DatabaseField="fiftad_live_adopmo" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
</tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="fiftad_live_adopfa" DatabaseField="fiftad_live_adopfa" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
</tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="fiftad_live_fostpar" DatabaseField="fiftad_live_fostpar" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
</tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="fiftad_live_sib" DatabaseField="fiftad_live_sib" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
</tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="fiftad_live_relat" DatabaseField="fiftad_live_relat" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
</tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="fiftad_live_other" DatabaseField="fiftad_live_other" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
</tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="fiftad_live_details" DatabaseField="fiftad_live_details" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="300px" FieldTextBoxWidth="400px" FieldTextBoxHeight="40px" FieldTextBoxTextMode="multiline" FieldTextBoxMaxLength="250"></def:datafieldcontrol></td>
</tr>
 

     </table>

<br />
<br />
           <asp:Label ID="Label12" runat="server" Text="Siblings" Font-Bold="true" Font-Underline="true"></asp:Label><br />

      <table>
          <tr>
<td align="right"><asp:Label ID="Label5" runat="server" Text="DOB" Font-Bold="true" Font-Underline="true"></asp:Label></td>
<td align="right"><asp:Label ID="Label6" runat="server" Text="Sex (M/F)" Font-Bold="true" Font-Underline="true"></asp:Label></td>
<td align="right"><asp:Label ID="Label7" runat="server" Text="Relationship<br/>1=Full, 2=Half<br/>3=Step, 4=Adop" Font-Bold="true" Font-Underline="true"></asp:Label></td>
<td align="right"><asp:Label ID="Label8" runat="server" Text="Diagnosis<br/>(0=No,1=Yes)" Font-Bold="true" Font-Underline="true"></asp:Label></td>
<td align="right"><asp:Label ID="Label9" runat="server" Text="Diagnosis (Specify)" Font-Bold="true" Font-Underline="true"></asp:Label></td>
<td align="right"><asp:Label ID="Label10" runat="server" Text="Diagnosis Date" Font-Bold="true" Font-Underline="true"></asp:Label></td>
<td align="right"><asp:Label ID="Label11" runat="server" Text="Lives w/ Subj?<br/>0=No,1=Yes" Font-Bold="true" Font-Underline="true"></asp:Label></td>



          </tr>
          <tr>
<td>
    <table>
 <tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="fiftad_sibdob01" DatabaseField="fiftad_sibdob01" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="100px" FieldTextBoxWidth="80px" FormatString="{0:d}"></def:datafieldcontrol></td></tr>
 <tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="fiftad_sibdob02" DatabaseField="fiftad_sibdob02" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="100px" FieldTextBoxWidth="80px" FormatString="{0:d}"></def:datafieldcontrol></td></tr>
 <tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="fiftad_sibdob03" DatabaseField="fiftad_sibdob03" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="100px" FieldTextBoxWidth="80px" FormatString="{0:d}"></def:datafieldcontrol></td></tr>
 <tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="fiftad_sibdob04" DatabaseField="fiftad_sibdob04" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="100px" FieldTextBoxWidth="80px" FormatString="{0:d}"></def:datafieldcontrol></td></tr>
 <tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="fiftad_sibdob05" DatabaseField="fiftad_sibdob05" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="100px" FieldTextBoxWidth="80px" FormatString="{0:d}"></def:datafieldcontrol></td></tr>
 <tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="fiftad_sibdob06" DatabaseField="fiftad_sibdob06" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="100px" FieldTextBoxWidth="80px" FormatString="{0:d}"></def:datafieldcontrol></td></tr>
 </table>
</td>
 
<td>
        <table>
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="fiftad_sibsex01" DatabaseField="fiftad_sibsex01" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="55px" FieldTextBoxWidth="25px" FieldTextBoxMaxLength="1"></def:datafieldcontrol></td></tr> 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="fiftad_sibsex02" DatabaseField="fiftad_sibsex02" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="55px" FieldTextBoxWidth="25px" FieldTextBoxMaxLength="1"></def:datafieldcontrol></td></tr> 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="fiftad_sibsex03" DatabaseField="fiftad_sibsex03" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="55px" FieldTextBoxWidth="25px" FieldTextBoxMaxLength="1"></def:datafieldcontrol></td></tr> 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="fiftad_sibsex04" DatabaseField="fiftad_sibsex04" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="55px" FieldTextBoxWidth="25px" FieldTextBoxMaxLength="1"></def:datafieldcontrol></td></tr> 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="fiftad_sibsex05" DatabaseField="fiftad_sibsex05" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="55px" FieldTextBoxWidth="25px" FieldTextBoxMaxLength="1"></def:datafieldcontrol></td></tr>
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="fiftad_sibsex06" DatabaseField="fiftad_sibsex06" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="55px" FieldTextBoxWidth="25px" FieldTextBoxMaxLength="1"></def:datafieldcontrol></td></tr> 
     </table>
         </td>
 <td>
    <table>
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="fiftad_sibrelat01" DatabaseField="fiftad_sibrelat01" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="55px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td></tr> 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="fiftad_sibrelat02" DatabaseField="fiftad_sibrelat02" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="55px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td></tr> 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="fiftad_sibrelat03" DatabaseField="fiftad_sibrelat03" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="55px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td></tr> 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="fiftad_sibrelat04" DatabaseField="fiftad_sibrelat04" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="55px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td></tr> 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="fiftad_sibrelat05" DatabaseField="fiftad_sibrelat05" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="55px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td></tr> 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="fiftad_sibrelat06" DatabaseField="fiftad_sibrelat06" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="55px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td></tr> 
     </table>
         </td>
 <td>
    <table>
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="fiftad_sibdx01" DatabaseField="fiftad_sibdx01" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="55px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td></tr> 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="fiftad_sibdx02" DatabaseField="fiftad_sibdx02" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="55px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td></tr> 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="fiftad_sibdx03" DatabaseField="fiftad_sibdx03" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="55px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td></tr> 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="fiftad_sibdx04" DatabaseField="fiftad_sibdx04" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="55px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td></tr> 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="fiftad_sibdx05" DatabaseField="fiftad_sibdx05" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="55px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td></tr> 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="fiftad_sibdx06" DatabaseField="fiftad_sibdx06" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="55px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td></tr> 
     </table>
         </td>

 <td>
         <table>
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="fiftad_sibdxtxt01" DatabaseField="fiftad_sibdxtxt01" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="55px" FieldTextBoxWidth="200px"></def:datafieldcontrol></td></tr> 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="fiftad_sibdxtxt02" DatabaseField="fiftad_sibdxtxt02" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="55px" FieldTextBoxWidth="200px"></def:datafieldcontrol></td></tr> 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="fiftad_sibdxtxt03" DatabaseField="fiftad_sibdxtxt03" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="55px" FieldTextBoxWidth="200px"></def:datafieldcontrol></td></tr> 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="fiftad_sibdxtxt04" DatabaseField="fiftad_sibdxtxt04" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="55px" FieldTextBoxWidth="200px"></def:datafieldcontrol></td></tr> 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="fiftad_sibdxtxt05" DatabaseField="fiftad_sibdxtxt05" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="55px" FieldTextBoxWidth="200px"></def:datafieldcontrol></td></tr> 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="fiftad_sibdxtxt06" DatabaseField="fiftad_sibdxtxt06" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="55px" FieldTextBoxWidth="200px"></def:datafieldcontrol></td></tr> 
     </table>

 </td>

 <td>
         <table>
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="fiftad_sibdxdate01" DatabaseField="fiftad_sibdxdate01" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="55px" FieldTextBoxWidth="80px" FormatString="{0:d}" ></def:datafieldcontrol></td></tr> 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="fiftad_sibdxdate02" DatabaseField="fiftad_sibdxdate02" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="55px" FieldTextBoxWidth="80px" FormatString="{0:d}" ></def:datafieldcontrol></td></tr> 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="fiftad_sibdxdate03" DatabaseField="fiftad_sibdxdate03" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="55px" FieldTextBoxWidth="80px" FormatString="{0:d}" ></def:datafieldcontrol></td></tr> 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="fiftad_sibdxdate04" DatabaseField="fiftad_sibdxdate04" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="55px" FieldTextBoxWidth="80px" FormatString="{0:d}" ></def:datafieldcontrol></td></tr> 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="fiftad_sibdxdate05" DatabaseField="fiftad_sibdxdate05" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="55px" FieldTextBoxWidth="80px" FormatString="{0:d}" ></def:datafieldcontrol></td></tr> 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="fiftad_sibdxdate06" DatabaseField="fiftad_sibdxdate06" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="55px" FieldTextBoxWidth="80px" FormatString="{0:d}" ></def:datafieldcontrol></td></tr> 
    </table>
         </td>

 <td>
         <table>
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="fiftad_siblivessujb01" DatabaseField="fiftad_siblivessujb01" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="55px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td></tr> 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="fiftad_siblivessujb02" DatabaseField="fiftad_siblivessujb02" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="55px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td></tr> 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="fiftad_siblivessujb03" DatabaseField="fiftad_siblivessujb03" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="55px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td></tr> 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="fiftad_siblivessujb04" DatabaseField="fiftad_siblivessujb04" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="55px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td></tr> 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="fiftad_siblivessujb05" DatabaseField="fiftad_siblivessujb05" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="55px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td></tr>
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="fiftad_siblivessujb06" DatabaseField="fiftad_siblivessujb06" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="55px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td></tr>
    </table>
        </td>
              </tr>
          </table>

 <br /><br />
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="fiftad_specdiet" DatabaseField="fiftad_specdiet" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="fiftad_specdiet_txt" DatabaseField="fiftad_specdiet_txt" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="300px" FieldTextBoxWidth="400px" FieldTextBoxHeight="40px" FieldTextBoxTextMode="multiline" FieldTextBoxMaxLength="250"></def:datafieldcontrol></td>
<td></td></tr>
 <br /><br />
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="fiftad_reinf_food" DatabaseField="fiftad_reinf_food" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="fiftad_reinf_food_txt" DatabaseField="fiftad_reinf_food_txt" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="300px" FieldTextBoxWidth="400px" FieldTextBoxHeight="40px" FieldTextBoxTextMode="multiline" FieldTextBoxMaxLength="250"></def:datafieldcontrol></td>
<td></td></tr>
 <br /><br />
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="fiftad_allergies" DatabaseField="fiftad_allergies" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="fiftad_allergies_txt" DatabaseField="fiftad_allergies_txt" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="300px" FieldTextBoxWidth="400px" FieldTextBoxHeight="40px" FieldTextBoxTextMode="multiline" FieldTextBoxMaxLength="250"></def:datafieldcontrol></td>
<td></td></tr>
 <br /><br />
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="fiftad_cmnt_know" DatabaseField="fiftad_cmnt_know" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="300px" FieldTextBoxWidth="400px" FieldTextBoxHeight="40px" FieldTextBoxTextMode="multiline" FieldTextBoxMaxLength="250"></def:datafieldcontrol></td>
<td></td></tr>
 <br /><br />
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="fiftad_cmnt_likes" DatabaseField="fiftad_cmnt_likes" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="300px" FieldTextBoxWidth="400px" FieldTextBoxHeight="40px" FieldTextBoxTextMode="multiline" FieldTextBoxMaxLength="250"></def:datafieldcontrol></td>
<td></td></tr>
 <br /><br />
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="fiftad_cmnt_dislikes" DatabaseField="fiftad_cmnt_dislikes" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="300px" FieldTextBoxWidth="400px" FieldTextBoxHeight="40px" FieldTextBoxTextMode="multiline" FieldTextBoxMaxLength="250"></def:datafieldcontrol></td>
<td></td></tr>
 <br /><br />
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="fiftad_cmnt_motiv" DatabaseField="fiftad_cmnt_motiv" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="300px" FieldTextBoxWidth="400px" FieldTextBoxHeight="40px" FieldTextBoxTextMode="multiline" FieldTextBoxMaxLength="250"></def:datafieldcontrol></td>
<td></td></tr>
 <br /><br />
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="fiftad_partic_notes" DatabaseField="fiftad_partic_notes" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="300px" FieldTextBoxWidth="400px" FieldTextBoxHeight="40px" FieldTextBoxTextMode="multiline" FieldTextBoxMaxLength="1000"></def:datafieldcontrol></td>
<td></td></tr>
 <br /><br />

    <tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="fiftad__scrmsg" DatabaseField="fiftad_scrmsg"  IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="300px" FieldTextBoxWidth="400px" FieldTextBoxHeight="40px" FieldTextBoxTextMode="multiline" FieldTextBoxMaxLength="250"></def:datafieldcontrol>
        <br /><br /><br />
        </td>
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
