<%@ Register TagPrefix="def" Namespace="DataEntryFramework3" %>

<%@ Page Language="c#" MasterPageFile="~/UWAC.master" Title="TLC_Exp Data Entry" %>

<asp:Content ID="Content1" ContentPlaceHolderID="oBodyPlaceHolder" runat="server">
    
    <def:dataentrycontroller id="DataEntryController1" runat="server" DatabaseTable="ALL_TLC_Exp" PrimaryKeyField="tlc_pk">
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
                        <def:datafieldcontrol runat="server" id="tlc_date" DatabaseField="tlc_date" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FormatString="{0:d}"></def:datafieldcontrol></td>
                    <td></td>
                </tr>

                <tr>
                    <td style="vertical-align:top">
                        <def:datafieldcontrol runat="server" id="tlc_agemo" DatabaseField="tlc_agemo" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
                    <td></td>
                </tr>

                <tr>
                    <td style="vertical-align:top">
                        <def:datafieldcontrol runat="server" id="tlc_exmnr" DatabaseField="tlc_exmnr" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="300px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="20"></def:datafieldcontrol></td>
                    <td></td>
                </tr>

                <tr>
                    <td style="vertical-align:top">
                        <def:datafieldcontrol runat="server" id="tlc_cmnt" DatabaseField="tlc_cmnt" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="300px" FieldTextBoxWidth="400px" FieldTextBoxHeight="40px" FieldTextBoxTextMode="multiline" FieldTextBoxMaxLength="250"></def:datafieldcontrol></td>
                    <td></td>
                </tr>



<%--                <tr>
                    <td style="vertical-align:top">
                        <def:datafieldcontrol runat="server" id="tlc_resp" DatabaseField="tlc_resp" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="300px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="50"></def:datafieldcontrol></td>
                    <td></td>
                </tr>--%>

            </table>

            <br />
            <br />

            <b><u>Listening Comprehension</u></b>
            <table>

                <tr>
                    <td style="vertical-align:top">
                        <def:datafieldcontrol runat="server" id="tlclistcomp01" DatabaseField="tlclistcomp01" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
                    <td>
                        <def:ValueSetLabel ID="ValueSetLabel_tlclistcomp01" runat="server" DatabaseField="tlclistcomp01"></def:ValueSetLabel></td>
                </tr>

                <tr>
                    <td style="vertical-align:top">
                        <def:datafieldcontrol runat="server" id="tlclistcomp02" DatabaseField="tlclistcomp02" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
                    <td></td>
                </tr>

                <tr>
                    <td style="vertical-align:top">
                        <def:datafieldcontrol runat="server" id="tlclistcomp03" DatabaseField="tlclistcomp03" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
                    <td></td>
                </tr>

                <tr>
                    <td style="vertical-align:top">
                        <def:datafieldcontrol runat="server" id="tlclistcomp04" DatabaseField="tlclistcomp04" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
                    <td></td>
                </tr>

                <tr>
                    <td style="vertical-align:top">
                        <def:datafieldcontrol runat="server" id="tlclistcomp05" DatabaseField="tlclistcomp05" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
                    <td></td>
                </tr>

                <tr>
                    <td style="vertical-align:top">
                        <def:datafieldcontrol runat="server" id="tlclistcomp06" DatabaseField="tlclistcomp06" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
                    <td></td>
                </tr>

                <tr>
                    <td style="vertical-align:top">
                        <def:datafieldcontrol runat="server" id="tlclistcomp07" DatabaseField="tlclistcomp07" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
                    <td></td>
                </tr>

                <tr>
                    <td style="vertical-align:top">
                        <def:datafieldcontrol runat="server" id="tlclistcomp08" DatabaseField="tlclistcomp08" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
                    <td></td>
                </tr>

                <tr>
                    <td style="vertical-align:top">
                        <def:datafieldcontrol runat="server" id="tlclistcomp09" DatabaseField="tlclistcomp09" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
                    <td></td>
                </tr>

                <tr>
                    <td style="vertical-align:top">
                        <def:datafieldcontrol runat="server" id="tlclistcomp10" DatabaseField="tlclistcomp10" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
                    <td></td>
                </tr>

                <tr>
                    <td style="vertical-align:top">
                        <def:datafieldcontrol runat="server" id="tlclistcomp11" DatabaseField="tlclistcomp11" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
                    <td></td>
                </tr>

                <tr>
                    <td style="vertical-align:top">
                        <def:datafieldcontrol runat="server" id="tlclistcomp12" DatabaseField="tlclistcomp12" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
                    <td></td>
                </tr>

            </table>

            <br />
            <br />

            <b><u>Oral Expression</u></b>
            <table>
                <tr>
                    <td align="right"><b>Holistic Scoring</b></td>
                    <td align="right"><b>Word Count</b></td>
                    <td></td>
                </tr>
                <tr>
                    <td align="right">
                        <def:ValueSetLabel ID="ValueSetLabel1" runat="server" DatabaseField="tlcoralexp_hs01"></def:ValueSetLabel>
                    </td>
                    <td align="right">
                        <def:ValueSetLabel ID="ValueSetLabel2" runat="server" DatabaseField="tlcoralexp_wc01"></def:ValueSetLabel>
                    </td>
                    <td></td>
                </tr>


                <tr>
                    <td style="vertical-align:top">
                        <def:datafieldcontrol runat="server" id="tlcoralexp_hs01" DatabaseField="tlcoralexp_hs01" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
                    <td style="vertical-align:top">
                        <def:datafieldcontrol runat="server" id="tlcoralexp_wc01" DatabaseField="tlcoralexp_wc01" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="30px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
                    <td></td>
                </tr>
                <tr>
                    <td style="vertical-align:top">
                        <def:datafieldcontrol runat="server" id="tlcoralexp_hs02" DatabaseField="tlcoralexp_hs02" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
                    <td style="vertical-align:top">
                        <def:datafieldcontrol runat="server" id="tlcoralexp_wc02" DatabaseField="tlcoralexp_wc02" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="30px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
                    <td></td>
                </tr>
                <tr>
                    <td style="vertical-align:top">
                        <def:datafieldcontrol runat="server" id="tlcoralexp_hs03" DatabaseField="tlcoralexp_hs03" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
                    <td style="vertical-align:top">
                        <def:datafieldcontrol runat="server" id="tlcoralexp_wc03" DatabaseField="tlcoralexp_wc03" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="30px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
                    <td></td>
                </tr>
                <tr>
                    <td style="vertical-align:top">
                        <def:datafieldcontrol runat="server" id="tlcoralexp_hs04" DatabaseField="tlcoralexp_hs04" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
                    <td style="vertical-align:top">
                        <def:datafieldcontrol runat="server" id="tlcoralexp_wc04" DatabaseField="tlcoralexp_wc04" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="30px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
                    <td></td>
                </tr>
                <tr>
                    <td style="vertical-align:top">
                        <def:datafieldcontrol runat="server" id="tlcoralexp_hs05" DatabaseField="tlcoralexp_hs05" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
                    <td style="vertical-align:top">
                        <def:datafieldcontrol runat="server" id="tlcoralexp_wc05" DatabaseField="tlcoralexp_wc05" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="30px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
                    <td></td>
                </tr>
                <tr>
                    <td style="vertical-align:top">
                        <def:datafieldcontrol runat="server" id="tlcoralexp_hs06" DatabaseField="tlcoralexp_hs06" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
                    <td style="vertical-align:top">
                        <def:datafieldcontrol runat="server" id="tlcoralexp_wc06" DatabaseField="tlcoralexp_wc06" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="30px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
                    <td></td>
                </tr>
                <tr>
                    <td style="vertical-align:top">
                        <def:datafieldcontrol runat="server" id="tlcoralexp_hs07" DatabaseField="tlcoralexp_hs07" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
                    <td style="vertical-align:top">
                        <def:datafieldcontrol runat="server" id="tlcoralexp_wc07" DatabaseField="tlcoralexp_wc07" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="30px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
                    <td></td>
                </tr>
                <tr>
                    <td style="vertical-align:top">
                        <def:datafieldcontrol runat="server" id="tlcoralexp_hs08" DatabaseField="tlcoralexp_hs08" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
                    <td style="vertical-align:top">
                        <def:datafieldcontrol runat="server" id="tlcoralexp_wc08" DatabaseField="tlcoralexp_wc08" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="30px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
                    <td></td>
                </tr>
                <tr>
                    <td style="vertical-align:top">
                        <def:datafieldcontrol runat="server" id="tlcoralexp_hs09" DatabaseField="tlcoralexp_hs09" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
                    <td style="vertical-align:top">
                        <def:datafieldcontrol runat="server" id="tlcoralexp_wc09" DatabaseField="tlcoralexp_wc09" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="30px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
                    <td></td>
                </tr>
                <tr>
                    <td style="vertical-align:top">
                        <def:datafieldcontrol runat="server" id="tlcoralexp_hs10" DatabaseField="tlcoralexp_hs10" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
                    <td style="vertical-align:top">
                        <def:datafieldcontrol runat="server" id="tlcoralexp_wc10" DatabaseField="tlcoralexp_wc10" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="30px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
                    <td></td>
                </tr>
                <tr>
                    <td style="vertical-align:top">
                        <def:datafieldcontrol runat="server" id="tlcoralexp_hs11" DatabaseField="tlcoralexp_hs11" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
                    <td style="vertical-align:top">
                        <def:datafieldcontrol runat="server" id="tlcoralexp_wc11" DatabaseField="tlcoralexp_wc11" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="30px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
                    <td></td>
                </tr>
                <tr>
                    <td style="vertical-align:top">
                        <def:datafieldcontrol runat="server" id="tlcoralexp_hs12" DatabaseField="tlcoralexp_hs12" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
                    <td style="vertical-align:top">
                        <def:datafieldcontrol runat="server" id="tlcoralexp_wc12" DatabaseField="tlcoralexp_wc12" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="30px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
                    <td></td>
                </tr>
                <tr>
                    <td style="vertical-align:top">
                        <def:datafieldcontrol runat="server" id="tlcoralexp_hs13" DatabaseField="tlcoralexp_hs13" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
                    <td style="vertical-align:top">
                        <def:datafieldcontrol runat="server" id="tlcoralexp_wc13" DatabaseField="tlcoralexp_wc13" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="30px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
                    <td></td>
                </tr>


            </table>

            <br />

            <table>
                <tr>
                    <td style="vertical-align:top">
                        <def:datafieldcontrol runat="server" id="tlclistcomp_raw" DatabaseField="tlclistcomp_raw" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
                    <td></td>
                </tr>

                <tr>
                    <td style="vertical-align:top">
                        <def:datafieldcontrol runat="server" id="tlclistcomp_ss" DatabaseField="tlclistcomp_ss" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
                    <td></td>
                </tr>

                <tr>
                    <td style="vertical-align:top">
                        <def:datafieldcontrol runat="server" id="tlcoralexp_raw" DatabaseField="tlcoralexp_raw" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
                    <td></td>
                </tr>

                <tr>
                    <td style="vertical-align:top">
                        <def:datafieldcontrol runat="server" id="tlcoralexp_ss" DatabaseField="tlcoralexp_ss" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
                    <td></td>
                </tr>

                <tr>
                    <td style="vertical-align:top">
                        <def:datafieldcontrol runat="server" id="tlc_scrmsg" DatabaseField="tlc_scrmsg" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="300px" FieldTextBoxWidth="400px" FieldTextBoxHeight="40px" FieldTextBoxTextMode="multiline" FieldTextBoxMaxLength="250"></def:datafieldcontrol></td>
                    <td></td>
                </tr>

            </table>

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
