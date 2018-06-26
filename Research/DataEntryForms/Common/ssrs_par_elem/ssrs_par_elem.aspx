<%@ Register TagPrefix="def" Namespace="DataEntryFramework3" %>

<%@ Page Language="c#" MasterPageFile="~/UWAC.master" Title="SSRS_Paren Data Entry" %>

<asp:Content ID="Content1" ContentPlaceHolderID="oBodyPlaceHolder" runat="server">
    
    <def:dataentrycontroller id="DataEntryController1" runat="server" DatabaseTable="ALL_SSRS_Parent_Elem" PrimaryKeyField="pe__pk">
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
                        <def:datafieldcontrol runat="server" id="pe__date" DatabaseField="pe__date" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FormatString="{0:d}"></def:datafieldcontrol></td>
                    <td></td>
                </tr>

                <tr>
                    <td style="vertical-align:top">
                        <def:datafieldcontrol runat="server" id="pe__agemo" DatabaseField="pe__agemo" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
                    <td></td>
                </tr>

                <tr>
                    <td style="vertical-align:top">
                        <def:datafieldcontrol runat="server" id="pe__exmnr" DatabaseField="pe__exmnr" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="300px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="20"></def:datafieldcontrol></td>
                    <td></td>
                </tr>

                <tr>
                    <td style="vertical-align:top">
                        <def:datafieldcontrol runat="server" id="pe__resp" DatabaseField="pe__resp" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="300px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="50"></def:datafieldcontrol></td>
                    <td></td>
                </tr>

                <tr>
                    <td style="vertical-align:top">
                        <def:datafieldcontrol runat="server" id="pe__cmnt" DatabaseField="pe__cmnt" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="300px" FieldTextBoxWidth="400px" FieldTextBoxHeight="40px" FieldTextBoxTextMode="multiline" FieldTextBoxMaxLength="250"></def:datafieldcontrol></td>
                    <td></td>
                </tr>

                <tr>
                    <td style="vertical-align:top">
                        <def:datafieldcontrol runat="server" id="pe__scrmsg" DatabaseField="pe__scrmsg" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="300px" FieldTextBoxWidth="400px" FieldTextBoxHeight="40px" FieldTextBoxTextMode="multiline" FieldTextBoxMaxLength="250"></def:datafieldcontrol></td>
                    <td></td>
                </tr>

            </table>

            <br />
            <br />

            <table>

                <tr>
                    <td style="vertical-align:top">
                        <table>
                                                        <tr><td align="right"><b><u>How Often?</u></b></td><td></td></tr>

                            <tr>
                                <td style="vertical-align:top">
                                    <def:datafieldcontrol runat="server" id="pe_oft01" DatabaseField="pe_oft01" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="450px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>

                                <td style="vertical-align:top">
                                    <def:ValueSetLabel ID="ValueSetLabel_pe_oft01" runat="server" DatabaseField="pe_oft01"></def:ValueSetLabel></td>
                            </tr>

                            <tr>
                                <td style="vertical-align:top">
                                    <def:datafieldcontrol runat="server" id="pe_oft02" DatabaseField="pe_oft02" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="450px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
                                <td></td>
                            </tr>

                            <tr>
                                <td style="vertical-align:top">
                                    <def:datafieldcontrol runat="server" id="pe_oft03" DatabaseField="pe_oft03" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="450px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
                                <td></td>
                            </tr>

                            <tr>
                                <td style="vertical-align:top">
                                    <def:datafieldcontrol runat="server" id="pe_oft04" DatabaseField="pe_oft04" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="450px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
                                <td></td>
                            </tr>

                            <tr>
                                <td style="vertical-align:top">
                                    <def:datafieldcontrol runat="server" id="pe_oft05" DatabaseField="pe_oft05" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="450px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
                                <td></td>
                            </tr>

                            <tr>
                                <td style="vertical-align:top">
                                    <def:datafieldcontrol runat="server" id="pe_oft06" DatabaseField="pe_oft06" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="450px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
                                <td></td>
                            </tr>

                            <tr>
                                <td style="vertical-align:top">
                                    <def:datafieldcontrol runat="server" id="pe_oft07" DatabaseField="pe_oft07" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="450px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
                                <td></td>
                            </tr>

                            <tr>
                                <td style="vertical-align:top">
                                    <def:datafieldcontrol runat="server" id="pe_oft08" DatabaseField="pe_oft08" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="450px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
                                <td></td>
                            </tr>

                            <tr>
                                <td style="vertical-align:top">
                                    <def:datafieldcontrol runat="server" id="pe_oft09" DatabaseField="pe_oft09" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="450px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
                                <td></td>
                            </tr>

                            <tr>
                                <td style="vertical-align:top">
                                    <def:datafieldcontrol runat="server" id="pe_oft10" DatabaseField="pe_oft10" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="450px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
                                <td></td>
                            </tr>

                            <tr>
                                <td style="vertical-align:top">
                                    <def:datafieldcontrol runat="server" id="pe_oft11" DatabaseField="pe_oft11" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="450px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
                                <td></td>
                            </tr>

                            <tr>
                                <td style="vertical-align:top">
                                    <def:datafieldcontrol runat="server" id="pe_oft12" DatabaseField="pe_oft12" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="450px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
                                <td></td>
                            </tr>

                            <tr>
                                <td style="vertical-align:top">
                                    <def:datafieldcontrol runat="server" id="pe_oft13" DatabaseField="pe_oft13" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="450px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
                                <td></td>
                            </tr>

                            <tr>
                                <td style="vertical-align:top">
                                    <def:datafieldcontrol runat="server" id="pe_oft14" DatabaseField="pe_oft14" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="450px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
                                <td></td>
                            </tr>

                            <tr>
                                <td style="vertical-align:top">
                                    <def:datafieldcontrol runat="server" id="pe_oft15" DatabaseField="pe_oft15" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="450px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
                                <td></td>
                            </tr>

                            <tr>
                                <td style="vertical-align:top">
                                    <def:datafieldcontrol runat="server" id="pe_oft16" DatabaseField="pe_oft16" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="450px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
                                <td></td>
                            </tr>

                            <tr>
                                <td style="vertical-align:top">
                                    <def:datafieldcontrol runat="server" id="pe_oft17" DatabaseField="pe_oft17" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="450px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
                                <td></td>
                            </tr>

                            <tr>
                                <td style="vertical-align:top">
                                    <def:datafieldcontrol runat="server" id="pe_oft18" DatabaseField="pe_oft18" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="450px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
                                <td></td>
                            </tr>

                            <tr>
                                <td style="vertical-align:top">
                                    <def:datafieldcontrol runat="server" id="pe_oft19" DatabaseField="pe_oft19" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="450px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
                                <td></td>
                            </tr>

                            <tr>
                                <td style="vertical-align:top">
                                    <def:datafieldcontrol runat="server" id="pe_oft20" DatabaseField="pe_oft20" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="450px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
                                <td></td>
                            </tr>

                            <tr>
                                <td style="vertical-align:top">
                                    <def:datafieldcontrol runat="server" id="pe_oft21" DatabaseField="pe_oft21" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="450px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
                                <td></td>
                            </tr>

                            <tr>
                                <td style="vertical-align:top">
                                    <def:datafieldcontrol runat="server" id="pe_oft22" DatabaseField="pe_oft22" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="450px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
                                <td></td>
                            </tr>

                            <tr>
                                <td style="vertical-align:top">
                                    <def:datafieldcontrol runat="server" id="pe_oft23" DatabaseField="pe_oft23" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="450px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
                                <td></td>
                            </tr>

                            <tr>
                                <td style="vertical-align:top">
                                    <def:datafieldcontrol runat="server" id="pe_oft24" DatabaseField="pe_oft24" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="450px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
                                <td></td>
                            </tr>

                            <tr>
                                <td style="vertical-align:top">
                                    <def:datafieldcontrol runat="server" id="pe_oft25" DatabaseField="pe_oft25" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="450px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
                                <td></td>
                            </tr>

                            <tr>
                                <td style="vertical-align:top">
                                    <def:datafieldcontrol runat="server" id="pe_oft26" DatabaseField="pe_oft26" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="450px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
                                <td></td>
                            </tr>

                            <tr>
                                <td style="vertical-align:top">
                                    <def:datafieldcontrol runat="server" id="pe_oft27" DatabaseField="pe_oft27" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="450px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
                                <td></td>
                            </tr>

                            <tr>
                                <td style="vertical-align:top">
                                    <def:datafieldcontrol runat="server" id="pe_oft28" DatabaseField="pe_oft28" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="450px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
                                <td></td>
                            </tr>

                            <tr>
                                <td style="vertical-align:top">
                                    <def:datafieldcontrol runat="server" id="pe_oft29" DatabaseField="pe_oft29" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="450px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
                                <td></td>
                            </tr>

                            <tr>
                                <td style="vertical-align:top">
                                    <def:datafieldcontrol runat="server" id="pe_oft30" DatabaseField="pe_oft30" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="450px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
                                <td></td>
                            </tr>

                            <tr>
                                <td style="vertical-align:top">
                                    <def:datafieldcontrol runat="server" id="pe_oft31" DatabaseField="pe_oft31" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="450px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
                                <td></td>
                            </tr>

                            <tr>
                                <td style="vertical-align:top">
                                    <def:datafieldcontrol runat="server" id="pe_oft32" DatabaseField="pe_oft32" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="450px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
                                <td></td>
                            </tr>

                            <tr>
                                <td style="vertical-align:top">
                                    <def:datafieldcontrol runat="server" id="pe_oft33" DatabaseField="pe_oft33" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="450px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
                                <td></td>
                            </tr>

                            <tr>
                                <td style="vertical-align:top">
                                    <def:datafieldcontrol runat="server" id="pe_oft34" DatabaseField="pe_oft34" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="450px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
                                <td></td>
                            </tr>

                            <tr>
                                <td style="vertical-align:top">
                                    <def:datafieldcontrol runat="server" id="pe_oft35" DatabaseField="pe_oft35" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="450px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
                                <td></td>
                            </tr>

                            <tr>
                                <td style="vertical-align:top">
                                    <def:datafieldcontrol runat="server" id="pe_oft36" DatabaseField="pe_oft36" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="450px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
                                <td></td>
                            </tr>

                            <tr>
                                <td style="vertical-align:top">
                                    <def:datafieldcontrol runat="server" id="pe_oft37" DatabaseField="pe_oft37" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="450px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
                                <td></td>
                            </tr>

                            <tr>
                                <td style="vertical-align:top">
                                    <def:datafieldcontrol runat="server" id="pe_oft38" DatabaseField="pe_oft38" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="450px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
                                <td></td>
                            </tr>
                        </table>

                    </td>

                    <td style="vertical-align:top">

                        <table>
                            <tr><td align="right"><b><u>How Important?</u></b></td><td></td></tr>
                            <tr>
                                <td style="vertical-align:top">
                                    <def:datafieldcontrol runat="server" id="pe_imp01" DatabaseField="pe_imp01" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="50px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>

                                <td style="vertical-align:top">
                                    <def:ValueSetLabel ID="ValueSetLabel_pe_imp01" runat="server" DatabaseField="pe_imp01"></def:ValueSetLabel></td>
                            </tr>

                            <tr>
                                <td style="vertical-align:top">
                                    <def:datafieldcontrol runat="server" id="pe_imp02" DatabaseField="pe_imp02" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="50px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
                                <td></td>
                            </tr>

                            <tr>
                                <td style="vertical-align:top">
                                    <def:datafieldcontrol runat="server" id="pe_imp03" DatabaseField="pe_imp03" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="50px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
                                <td></td>
                            </tr>

                            <tr>
                                <td style="vertical-align:top">
                                    <def:datafieldcontrol runat="server" id="pe_imp04" DatabaseField="pe_imp04" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="50px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
                                <td></td>
                            </tr>

                            <tr>
                                <td style="vertical-align:top">
                                    <def:datafieldcontrol runat="server" id="pe_imp05" DatabaseField="pe_imp05" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="50px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
                                <td></td>
                            </tr>

                            <tr>
                                <td style="vertical-align:top">
                                    <def:datafieldcontrol runat="server" id="pe_imp06" DatabaseField="pe_imp06" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="50px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
                                <td></td>
                            </tr>

                            <tr>
                                <td style="vertical-align:top">
                                    <def:datafieldcontrol runat="server" id="pe_imp07" DatabaseField="pe_imp07" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="50px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
                                <td></td>
                            </tr>

                            <tr>
                                <td style="vertical-align:top">
                                    <def:datafieldcontrol runat="server" id="pe_imp08" DatabaseField="pe_imp08" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="50px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
                                <td></td>
                            </tr>

                            <tr>
                                <td style="vertical-align:top">
                                    <def:datafieldcontrol runat="server" id="pe_imp09" DatabaseField="pe_imp09" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="50px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
                                <td></td>
                            </tr>

                            <tr>
                                <td style="vertical-align:top">
                                    <def:datafieldcontrol runat="server" id="pe_imp10" DatabaseField="pe_imp10" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="50px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
                                <td></td>
                            </tr>

                            <tr>
                                <td style="vertical-align:top">
                                    <def:datafieldcontrol runat="server" id="pe_imp11" DatabaseField="pe_imp11" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="50px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
                                <td></td>
                            </tr>

                            <tr>
                                <td style="vertical-align:top">
                                    <def:datafieldcontrol runat="server" id="pe_imp12" DatabaseField="pe_imp12" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="50px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
                                <td></td>
                            </tr>

                            <tr>
                                <td style="vertical-align:top">
                                    <def:datafieldcontrol runat="server" id="pe_imp13" DatabaseField="pe_imp13" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="50px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
                                <td></td>
                            </tr>

                            <tr>
                                <td style="vertical-align:top">
                                    <def:datafieldcontrol runat="server" id="pe_imp14" DatabaseField="pe_imp14" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="50px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
                                <td></td>
                            </tr>

                            <tr>
                                <td style="vertical-align:top">
                                    <def:datafieldcontrol runat="server" id="pe_imp15" DatabaseField="pe_imp15" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="50px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
                                <td></td>
                            </tr>

                            <tr>
                                <td style="vertical-align:top">
                                    <def:datafieldcontrol runat="server" id="pe_imp16" DatabaseField="pe_imp16" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="50px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
                                <td></td>
                            </tr>

                            <tr>
                                <td style="vertical-align:top">
                                    <def:datafieldcontrol runat="server" id="pe_imp17" DatabaseField="pe_imp17" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="50px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
                                <td></td>
                            </tr>

                            <tr>
                                <td style="vertical-align:top">
                                    <def:datafieldcontrol runat="server" id="pe_imp18" DatabaseField="pe_imp18" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="50px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
                                <td></td>
                            </tr>

                            <tr>
                                <td style="vertical-align:top">
                                    <def:datafieldcontrol runat="server" id="pe_imp19" DatabaseField="pe_imp19" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="50px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
                                <td></td>
                            </tr>

                            <tr>
                                <td style="vertical-align:top">
                                    <def:datafieldcontrol runat="server" id="pe_imp20" DatabaseField="pe_imp20" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="50px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
                                <td></td>
                            </tr>

                            <tr>
                                <td style="vertical-align:top">
                                    <def:datafieldcontrol runat="server" id="pe_imp21" DatabaseField="pe_imp21" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="50px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
                                <td></td>
                            </tr>

                            <tr>
                                <td style="vertical-align:top">
                                    <def:datafieldcontrol runat="server" id="pe_imp22" DatabaseField="pe_imp22" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="50px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
                                <td></td>
                            </tr>

                            <tr>
                                <td style="vertical-align:top">
                                    <def:datafieldcontrol runat="server" id="pe_imp23" DatabaseField="pe_imp23" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="50px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
                                <td></td>
                            </tr>

                            <tr>
                                <td style="vertical-align:top">
                                    <def:datafieldcontrol runat="server" id="pe_imp24" DatabaseField="pe_imp24" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="50px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
                                <td></td>
                            </tr>

                            <tr>
                                <td style="vertical-align:top">
                                    <def:datafieldcontrol runat="server" id="pe_imp25" DatabaseField="pe_imp25" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="50px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
                                <td></td>
                            </tr>

                            <tr>
                                <td style="vertical-align:top">
                                    <def:datafieldcontrol runat="server" id="pe_imp26" DatabaseField="pe_imp26" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="50px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
                                <td></td>
                            </tr>

                            <tr>
                                <td style="vertical-align:top">
                                    <def:datafieldcontrol runat="server" id="pe_imp27" DatabaseField="pe_imp27" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="50px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
                                <td></td>
                            </tr>

                            <tr>
                                <td style="vertical-align:top">
                                    <def:datafieldcontrol runat="server" id="pe_imp28" DatabaseField="pe_imp28" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="50px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
                                <td></td>
                            </tr>

                            <tr>
                                <td style="vertical-align:top">
                                    <def:datafieldcontrol runat="server" id="pe_imp29" DatabaseField="pe_imp29" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="50px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
                                <td></td>
                            </tr>

                            <tr>
                                <td style="vertical-align:top">
                                    <def:datafieldcontrol runat="server" id="pe_imp30" DatabaseField="pe_imp30" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="50px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
                                <td></td>
                            </tr>

                            <tr>
                                <td style="vertical-align:top">
                                    <def:datafieldcontrol runat="server" id="pe_imp31" DatabaseField="pe_imp31" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="50px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
                                <td></td>
                            </tr>

                            <tr>
                                <td style="vertical-align:top">
                                    <def:datafieldcontrol runat="server" id="pe_imp32" DatabaseField="pe_imp32" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="50px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
                                <td></td>
                            </tr>

                            <tr>
                                <td style="vertical-align:top">
                                    <def:datafieldcontrol runat="server" id="pe_imp33" DatabaseField="pe_imp33" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="50px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
                                <td></td>
                            </tr>

                            <tr>
                                <td style="vertical-align:top">
                                    <def:datafieldcontrol runat="server" id="pe_imp34" DatabaseField="pe_imp34" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="50px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
                                <td></td>
                            </tr>

                            <tr>
                                <td style="vertical-align:top">
                                    <def:datafieldcontrol runat="server" id="pe_imp35" DatabaseField="pe_imp35" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="50px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
                                <td></td>
                            </tr>

                            <tr>
                                <td style="vertical-align:top">
                                    <def:datafieldcontrol runat="server" id="pe_imp36" DatabaseField="pe_imp36" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="50px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
                                <td></td>
                            </tr>

                            <tr>
                                <td style="vertical-align:top">
                                    <def:datafieldcontrol runat="server" id="pe_imp37" DatabaseField="pe_imp37" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="50px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
                                <td></td>
                            </tr>

                            <tr>
                                <td style="vertical-align:top">
                                    <def:datafieldcontrol runat="server" id="pe_imp38" DatabaseField="pe_imp38" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="50px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
                                <td></td>
                            </tr>

                       </table>


                    </td>
                </tr>

            </table>




            <br />
            <br />
            <br />
            <table>
                <tr><td align="right"><b><u>How Often?</u></b></td><td></td></tr>

                <tr>
                    <td style="vertical-align:top">
                        <def:datafieldcontrol runat="server" id="pe_oft39" DatabaseField="pe_oft39" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
                    <td>   <def:ValueSetLabel ID="ValueSetLabel2" runat="server" DatabaseField="pe_oft39"></def:ValueSetLabel></td>
                </tr>

                <tr>
                    <td style="vertical-align:top">
                        <def:datafieldcontrol runat="server" id="pe_oft40" DatabaseField="pe_oft40" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
                    <td></td>
                </tr>

                <tr>
                    <td style="vertical-align:top">
                        <def:datafieldcontrol runat="server" id="pe_oft41" DatabaseField="pe_oft41" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
                    <td></td>
                </tr>

                <tr>
                    <td style="vertical-align:top">
                        <def:datafieldcontrol runat="server" id="pe_oft42" DatabaseField="pe_oft42" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
                    <td></td>
                </tr>

                <tr>
                    <td style="vertical-align:top">
                        <def:datafieldcontrol runat="server" id="pe_oft43" DatabaseField="pe_oft43" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
                    <td></td>
                </tr>

                <tr>
                    <td style="vertical-align:top">
                        <def:datafieldcontrol runat="server" id="pe_oft44" DatabaseField="pe_oft44" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
                    <td></td>
                </tr>

                <tr>
                    <td style="vertical-align:top">
                        <def:datafieldcontrol runat="server" id="pe_oft45" DatabaseField="pe_oft45" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
                    <td></td>
                </tr>

                <tr>
                    <td style="vertical-align:top">
                        <def:datafieldcontrol runat="server" id="pe_oft46" DatabaseField="pe_oft46" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
                    <td></td>
                </tr>

                <tr>
                    <td style="vertical-align:top">
                        <def:datafieldcontrol runat="server" id="pe_oft47" DatabaseField="pe_oft47" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
                    <td></td>
                </tr>

                <tr>
                    <td style="vertical-align:top">
                        <def:datafieldcontrol runat="server" id="pe_oft48" DatabaseField="pe_oft48" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
                    <td></td>
                </tr>

                <tr>
                    <td style="vertical-align:top">
                        <def:datafieldcontrol runat="server" id="pe_oft49" DatabaseField="pe_oft49" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
                    <td></td>
                </tr>

                <tr>
                    <td style="vertical-align:top">
                        <def:datafieldcontrol runat="server" id="pe_oft50" DatabaseField="pe_oft50" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
                    <td></td>
                </tr>

                <tr>
                    <td style="vertical-align:top">
                        <def:datafieldcontrol runat="server" id="pe_oft51" DatabaseField="pe_oft51" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
                    <td></td>
                </tr>

                <tr>
                    <td style="vertical-align:top">
                        <def:datafieldcontrol runat="server" id="pe_oft52" DatabaseField="pe_oft52" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
                    <td></td>
                </tr>

                <tr>
                    <td style="vertical-align:top">
                        <def:datafieldcontrol runat="server" id="pe_oft53" DatabaseField="pe_oft53" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
                    <td></td>
                </tr>

                <tr>
                    <td style="vertical-align:top">
                        <def:datafieldcontrol runat="server" id="pe_oft54" DatabaseField="pe_oft54" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
                    <td></td>
                </tr>

                <tr>
                    <td style="vertical-align:top">
                        <def:datafieldcontrol runat="server" id="pe_oft55" DatabaseField="pe_oft55" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
                    <td></td>
                </tr>
            </table>


            <br />
            <br />
            <table>
                     <tr>
                                <td style="vertical-align:top">
                                    <def:datafieldcontrol runat="server" id="pe_socsk_c_sum" DatabaseField="pe_socsk_c_sum" IsReadOnly="true" RenderReadOnlyAsDiv="true"  FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
                                <td></td>
                            </tr>

                            <tr>
                                <td style="vertical-align:top">
                                    <def:datafieldcontrol runat="server" id="pe_socsk_a_sum" DatabaseField="pe_socsk_a_sum" IsReadOnly="true" RenderReadOnlyAsDiv="true"  FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
                                <td></td>
                            </tr>

                            <tr>
                                <td style="vertical-align:top">
                                    <def:datafieldcontrol runat="server" id="pe_socsk_r_sum" DatabaseField="pe_socsk_r_sum" IsReadOnly="true" RenderReadOnlyAsDiv="true"  FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
                                <td></td>
                            </tr>

                            <tr>
                                <td style="vertical-align:top">
                                    <def:datafieldcontrol runat="server" id="pe_socsk_s_sum" DatabaseField="pe_socsk_s_sum" IsReadOnly="true" RenderReadOnlyAsDiv="true"  FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
                                <td></td>
                            </tr>

                            <tr>
                                <td style="vertical-align:top">
                                    <def:datafieldcontrol runat="server" id="pe_socsk_total" DatabaseField="pe_socsk_total" IsReadOnly="true" RenderReadOnlyAsDiv="true"  FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
                                <td></td>
                            </tr>

                            <tr>
                                <td style="vertical-align:top">
                                    <def:datafieldcontrol runat="server" id="pe_pb_e_sum" DatabaseField="pe_pb_e_sum" IsReadOnly="true" RenderReadOnlyAsDiv="true"  FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
                                <td></td>
                            </tr>

                            <tr>
                                <td style="vertical-align:top">
                                    <def:datafieldcontrol runat="server" id="pe_pb_i_sum" DatabaseField="pe_pb_i_sum" IsReadOnly="true" RenderReadOnlyAsDiv="true"  FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
                                <td></td>
                            </tr>

                            <tr>
                                <td style="vertical-align:top">
                                    <def:datafieldcontrol runat="server" id="pe_pb_h_sum" DatabaseField="pe_pb_h_sum" IsReadOnly="true" RenderReadOnlyAsDiv="true"  FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
                                <td></td>
                            </tr>

                            <tr>
                                <td style="vertical-align:top">
                                    <def:datafieldcontrol runat="server" id="pe_pb_total" DatabaseField="pe_pb_total" IsReadOnly="true" RenderReadOnlyAsDiv="true"  FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
                                <td></td>
                            </tr>

                            <tr>
                                <td style="vertical-align:top">
                                    <def:datafieldcontrol runat="server" id="pe_socsk_stdscr" DatabaseField="pe_socsk_stdscr" IsReadOnly="true" RenderReadOnlyAsDiv="true"  FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
                                <td></td>
                            </tr>

                            <tr>
                                <td style="vertical-align:top">
                                    <def:datafieldcontrol runat="server" id="pe_pb_stdscr" DatabaseField="pe_pb_stdscr" IsReadOnly="true" RenderReadOnlyAsDiv="true"  FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
                                <td></td>
                            </tr>
            </table>


            <br />
            <br />
            <table>
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
