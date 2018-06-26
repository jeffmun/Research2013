<%@ Register TagPrefix="def" Namespace="DataEntryFramework3" %> 
<%@ Page language="c#" MasterPageFile="~/UWAC.master"  Title="ChildSenPr Data Entry" %>
<asp:Content ID="Content1" ContentPlaceHolderID="oBodyPlaceHolder" runat="server">

<def:dataentrycontroller id="DataEntryController1" runat="server" DatabaseTable="ALL_ChildSenProf2" PrimaryKeyField="csp2_pk">
</def:dataentrycontroller>
   <asp:ScriptManager ID="ScriptManager1" runat="server">    </asp:ScriptManager>
<asp:UpdatePanel ID="UpdatePanel1" runat="server">
  <ContentTemplate>


<table>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="id" DatabaseField="id" IsInsertField="true" FieldLabelWidth="300px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="15"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="indexnum" DatabaseField="indexnum" IsInsertField="true" FieldTextBoxTextDefault="1" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="csp2_date" DatabaseField="csp2_date" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FormatString="{0:d}" ></def:datafieldcontrol></td>
<td></td></tr>
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="csp2_agemo" DatabaseField="csp2_agemo" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="300px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="50"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="csp2_resp" DatabaseField="csp2_resp" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="300px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="50"></def:datafieldcontrol></td>
<td></td></tr>
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="csp2_scrmsg" DatabaseField="csp2_scrmsg" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="300px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="50"></def:datafieldcontrol></td>
<td></td></tr>
</table>

<br />
<br />

            <table>
                <tr>
                    <td align="center" colspan="2"><b><asp:Label id="l1" runat="server" Text="Sensory modality" Font-Bold="true" Font-Size="Medium"></asp:Label></td><td width="40px"></td>
                    <td align="center" colspan="2"><b><asp:Label id="Label1" runat="server" Text="Quadrant" Font-Bold="true" Font-Size="Medium"></asp:Label></td><td width="40px"></td>
                    <td align="center" colspan="2"><b><asp:Label id="Label2" runat="server" Text="Behavior" Font-Bold="true" Font-Size="Medium"></asp:Label></td><td width="40px"></td>

                </tr>
                <tr>
                    <td align="right" ><b><u>Score</u></b></td><td align="center" ><b><u>Level</u></b></td><td width="40px"></td>
                    <td align="right" ><b><u>Score</u></b></td><td align="center" ><b><u>Level</u></b></td><td width="40px"></td>
                    <td align="right" ><b><u>Score</u></b></td><td align="center" ><b><u>Level</u></b></td><td width="40px"></td>
                </tr>
                <tr>
                    <%--Column 1--%>
                    <td style="vertical-align:top">
                        <def:datafieldcontrol runat="server" id="csp2aud" DatabaseField="csp2aud" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="150px" FieldTextBoxWidth="40px" ></def:datafieldcontrol>
                        <def:datafieldcontrol runat="server" id="csp2vis" DatabaseField="csp2vis" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="150px" FieldTextBoxWidth="40px" ></def:datafieldcontrol>
                        <def:datafieldcontrol runat="server" id="csp2tou" DatabaseField="csp2tou" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="150px" FieldTextBoxWidth="40px" ></def:datafieldcontrol>
                        <def:datafieldcontrol runat="server" id="csp2mov" DatabaseField="csp2mov" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="150px" FieldTextBoxWidth="40px" ></def:datafieldcontrol>
                        <def:datafieldcontrol runat="server" id="csp2bod" DatabaseField="csp2bod" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="150px" FieldTextBoxWidth="40px" ></def:datafieldcontrol>
                        <def:datafieldcontrol runat="server" id="csp2ora" DatabaseField="csp2ora" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="150px" FieldTextBoxWidth="40px" ></def:datafieldcontrol>
                    </td>
                    <td style="vertical-align:top">
                        <def:datafieldcontrol runat="server" id="csp2aud_lev" DatabaseField="csp2aud_lev" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="20px" FieldTextBoxWidth="140px" ></def:datafieldcontrol>
                        <def:datafieldcontrol runat="server" id="csp2vis_lev" DatabaseField="csp2vis_lev" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="20px" FieldTextBoxWidth="140px" ></def:datafieldcontrol>
                        <def:datafieldcontrol runat="server" id="csp2tou_lev" DatabaseField="csp2tou_lev" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="20px" FieldTextBoxWidth="140px" ></def:datafieldcontrol>
                        <def:datafieldcontrol runat="server" id="csp2mov_lev" DatabaseField="csp2mov_lev" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="20px" FieldTextBoxWidth="140px" ></def:datafieldcontrol>
                        <def:datafieldcontrol runat="server" id="csp2bod_lev" DatabaseField="csp2bod_lev" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="20px" FieldTextBoxWidth="140px" ></def:datafieldcontrol>
                        <def:datafieldcontrol runat="server" id="csp2ora_lev" DatabaseField="csp2ora_lev" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="20px" FieldTextBoxWidth="140px" ></def:datafieldcontrol>
                    </td>
                    
                    
                    <td width="40px"></td>
                    <%--Column 2--%>
                    <td style="vertical-align:top">
                        <def:datafieldcontrol runat="server" id="csp2Qseek"  DatabaseField="csp2Qseek"  IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="220px" FieldTextBoxWidth="40px" ></def:datafieldcontrol>
                        <def:datafieldcontrol runat="server" id="csp2Qavoid" DatabaseField="csp2Qavoid" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="220px" FieldTextBoxWidth="40px" ></def:datafieldcontrol>
                        <def:datafieldcontrol runat="server" id="csp2Qsens"  DatabaseField="csp2Qsens"  IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="220px" FieldTextBoxWidth="40px" ></def:datafieldcontrol>
                        <def:datafieldcontrol runat="server" id="csp2Qregis" DatabaseField="csp2Qregis" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="220px" FieldTextBoxWidth="40px" ></def:datafieldcontrol>

                    </td>
                    <td style="vertical-align:top">
                        <def:datafieldcontrol runat="server" id="csp2Qseek_lev"  DatabaseField="csp2Qseek_lev"  IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="20px" FieldTextBoxWidth="140px" ></def:datafieldcontrol>
                        <def:datafieldcontrol runat="server" id="csp2Qavoid_lev"  DatabaseField="csp2Qavoid_lev" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="20px" FieldTextBoxWidth="140px" ></def:datafieldcontrol>
                        <def:datafieldcontrol runat="server" id="csp2Qsens_lev"  DatabaseField="csp2Qsens_lev"  IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="20px" FieldTextBoxWidth="140px" ></def:datafieldcontrol>
                        <def:datafieldcontrol runat="server" id="csp2Qregis_lev" DatabaseField="csp2Qregis_lev" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="20px" FieldTextBoxWidth="140px" ></def:datafieldcontrol>

                    </td>
                    
                    <td width="40px"></td>
                    <%--Column 3--%>
                    <td style="vertical-align:top">
                        <def:datafieldcontrol runat="server" id="csp2BXcon" DatabaseField="csp2BXcon" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="200px" FieldTextBoxWidth="40px" ></def:datafieldcontrol>
                        <def:datafieldcontrol runat="server" id="csp2BXsoc" DatabaseField="csp2BXsoc" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="200px" FieldTextBoxWidth="40px" ></def:datafieldcontrol>
                        <def:datafieldcontrol runat="server" id="csp2BXatt" DatabaseField="csp2BXatt" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="200px" FieldTextBoxWidth="40px" ></def:datafieldcontrol>
                    </td>
                    <td style="vertical-align:top">
                        <def:datafieldcontrol runat="server" id="csp2BXcon_lev" DatabaseField="csp2BXcon_lev" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="20px" FieldTextBoxWidth="140px" ></def:datafieldcontrol>
                        <def:datafieldcontrol runat="server" id="csp2BXsoc_lev" DatabaseField="csp2BXsoc_lev" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="20px" FieldTextBoxWidth="140px" ></def:datafieldcontrol>
                        <def:datafieldcontrol runat="server" id="csp2BXatt_lev" DatabaseField="csp2BXatt_lev" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="20px" FieldTextBoxWidth="140px" ></def:datafieldcontrol>
                    </td>

                </tr>
            </table>

      <br />
      <br />

 
<table>
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="aud01" DatabaseField="aud01" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td><td style="vertical-align:top"><def:ValueSetLabel ID="ValueSetLabel_aud1" runat="server"  DatabaseField="aud1"></def:ValueSetLabel></td></tr>
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="aud02" DatabaseField="aud02" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td><td></td></tr>
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="aud03" DatabaseField="aud03" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td><td></td></tr>
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="aud04" DatabaseField="aud04" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td><td></td></tr>
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="aud05" DatabaseField="aud05" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td><td></td></tr>
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="aud06" DatabaseField="aud06" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td><td></td></tr>
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="aud07" DatabaseField="aud07" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td><td></td></tr>
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="aud08" DatabaseField="aud08" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td><td></td></tr>
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="vis09" DatabaseField="vis09" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td><td></td></tr>
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="vis10" DatabaseField="vis10" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td><td></td></tr>
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="vis11" DatabaseField="vis11" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td><td></td></tr>
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="vis12" DatabaseField="vis12" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td><td></td></tr>
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="vis13" DatabaseField="vis13" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td><td></td></tr>
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="vis14" DatabaseField="vis14" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td><td></td></tr>
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="vis15" DatabaseField="vis15" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td><td></td></tr>
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="tou16" DatabaseField="tou16" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td><td></td></tr>
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="tou17" DatabaseField="tou17" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td><td></td></tr>
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="tou18" DatabaseField="tou18" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td><td></td></tr>
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="tou19" DatabaseField="tou19" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td><td></td></tr>
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="tou20" DatabaseField="tou20" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td><td></td></tr>
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="tou21" DatabaseField="tou21" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td><td></td></tr>
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="tou22" DatabaseField="tou22" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td><td></td></tr>
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="tou23" DatabaseField="tou23" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td><td></td></tr>
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="tou24" DatabaseField="tou24" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td><td></td></tr>
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="tou25" DatabaseField="tou25" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td><td></td></tr>
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="tou26" DatabaseField="tou26" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td><td></td></tr>
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="mov27" DatabaseField="mov27" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td><td></td></tr>
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="mov28" DatabaseField="mov28" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td><td></td></tr>
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="mov29" DatabaseField="mov29" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td><td></td></tr>
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="mov30" DatabaseField="mov30" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td><td></td></tr>
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="mov31" DatabaseField="mov31" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td><td></td></tr>
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="mov32" DatabaseField="mov32" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td><td></td></tr>
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="mov33" DatabaseField="mov33" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td><td></td></tr>
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="mov34" DatabaseField="mov34" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td><td></td></tr>
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="bod35" DatabaseField="bod35" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td><td></td></tr>
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="bod36" DatabaseField="bod36" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td><td></td></tr>
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="bod37" DatabaseField="bod37" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td><td></td></tr>
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="bod38" DatabaseField="bod38" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td><td></td></tr>
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="bod39" DatabaseField="bod39" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td><td></td></tr>
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="bod40" DatabaseField="bod40" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td><td></td></tr>
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="bod41" DatabaseField="bod41" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td><td></td></tr>
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="bod42" DatabaseField="bod42" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td><td></td></tr>
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="ora43" DatabaseField="ora43" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td><td></td></tr>
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="ora44" DatabaseField="ora44" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td><td></td></tr>
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="ora45" DatabaseField="ora45" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td><td></td></tr>
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="ora46" DatabaseField="ora46" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td><td></td></tr>
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="ora47" DatabaseField="ora47" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td><td></td></tr>
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="ora48" DatabaseField="ora48" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td><td></td></tr>
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="ora49" DatabaseField="ora49" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td><td></td></tr>
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="ora50" DatabaseField="ora50" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td><td></td></tr>
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="ora51" DatabaseField="ora51" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td><td></td></tr>
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="ora52" DatabaseField="ora52" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td><td></td></tr>
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="con53" DatabaseField="con53" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td><td></td></tr>
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="con54" DatabaseField="con54" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td><td></td></tr>
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="con55" DatabaseField="con55" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td><td></td></tr>
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="con56" DatabaseField="con56" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td><td></td></tr>
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="con57" DatabaseField="con57" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td><td></td></tr>
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="con58" DatabaseField="con58" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td><td></td></tr>
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="con59" DatabaseField="con59" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td><td></td></tr>
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="con60" DatabaseField="con60" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td><td></td></tr>
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="con61" DatabaseField="con61" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td><td></td></tr>
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="soc62" DatabaseField="soc62" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td><td></td></tr>
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="soc63" DatabaseField="soc63" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td><td></td></tr>
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="soc64" DatabaseField="soc64" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td><td></td></tr>
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="soc65" DatabaseField="soc65" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td><td></td></tr>
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="soc66" DatabaseField="soc66" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td><td></td></tr>
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="soc67" DatabaseField="soc67" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td><td></td></tr>
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="soc68" DatabaseField="soc68" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td><td></td></tr>
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="soc69" DatabaseField="soc69" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td><td></td></tr>
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="soc70" DatabaseField="soc70" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td><td></td></tr>
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="soc71" DatabaseField="soc71" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td><td></td></tr>
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="soc72" DatabaseField="soc72" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td><td></td></tr>
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="soc73" DatabaseField="soc73" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td><td></td></tr>
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="soc74" DatabaseField="soc74" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td><td></td></tr>
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="soc75" DatabaseField="soc75" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td><td></td></tr>
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="att76" DatabaseField="att76" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td><td></td></tr>
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="att77" DatabaseField="att77" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td><td></td></tr>
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="att78" DatabaseField="att78" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td><td></td></tr>
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="att79" DatabaseField="att79" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td><td></td></tr>
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="att80" DatabaseField="att80" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td><td></td></tr>
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="att81" DatabaseField="att81" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td><td></td></tr>
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="att82" DatabaseField="att82" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td><td></td></tr>
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="att83" DatabaseField="att83" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td><td></td></tr>
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="att84" DatabaseField="att84" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td><td></td></tr>
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="att85" DatabaseField="att85" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td><td></td></tr>
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="att86" DatabaseField="att86" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td><td></td></tr>
    </table>

<br/><br/>
      <table><tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="created" DatabaseField="created" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="300px"></def:datafieldcontrol></td>
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



