<%@ Register TagPrefix="def" Namespace="DataEntryFramework3" %> 
<%@ Page language="c#" MasterPageFile="~/UWAC.master"  Title="ados1 Data Entry" 
CodeFile="ados1.aspx.cs" Inherits="DataEntryForms_Common_ados1_ados1" Debug="true"%>
<asp:Content ID="Content1" ContentPlaceHolderID="oBodyPlaceHolder" runat="server">

<def:dataentrycontroller id="DataEntryController1" runat="server" DatabaseTable="all_ados1" PrimaryKeyField="ados1_pk" >
</def:dataentrycontroller>


<def:datafieldcontrol runat="server" id="id" DatabaseField="id" IsInsertField="true"  IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="100px" FieldTextBoxWidth="80px" FieldTextBoxMaxLength="15"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="indexnum" DatabaseField="indexnum" IsInsertField="true" FieldTextBoxTextDefault="1"  IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="100px" FieldTextBoxWidth="40px"></def:datafieldcontrol>

<br/>
<br/>
                <asp:Label id="Label3" runat="server" Text="NOTE from 5/12/2016: The ADOS-T has been integrated into the ADOS and the items for each module are now separated.  See the page below for details.  <br/>The ADOS-T is also scored according to the Module 1 criteria and these scores recorded in the data. <br/><br/>Scores have not been altered, just integrated because of the difficulty of working with separate measures in studies that use both the ADOS-T and ADOS at the same timepoint. <br/><br/>Email or Call Jeff 425-478-0920 cell, 6-2378 office anytime if you have questions about rescoring an ADOS." 
                    ForeColor="DarkRed" Font-Bold="true" Font-Size="Small"></asp:Label>

<br/>
<br/>
                <asp:Label id="Label1" runat="server" Text="ADOS Admin Info" Font-Bold="true" Font-Size="Medium"></asp:Label>




    <table border="0" style="border-color: #9EC0E0; border-width: 2px; border-style: solid;">
        <tr>
            <td style="background-color: Silver;">ADOS</td>
            <td style="background-color: Silver;">ADOS-T</td>
            <td style="background-color: Silver;">Enter if Reliability:</td>
        </tr>
        <tr></tr>
        <tr>
            <td style="vertical-align:top" style="border-color: Silver; border-width: 1px; border-style: solid;">
                <def:DataFieldControl runat="server" ID="ADOSver" DatabaseField="ADOSver" IsEntryField="True" IsDoubleEntryField="True" FieldLabelWidth="300" FieldTextBoxWidth="60" />
            </td>
        </tr>
        <tr>
            <td style="vertical-align:top" style="border-color: Silver; border-width: 1px; border-style: solid;">
                <def:DataFieldControl runat="server" ID="ADOSmod" DatabaseField="ADOSmod" IsEntryField="True" IsDoubleEntryField="True" FieldLabelWidth="300" FieldTextBoxWidth="60" />
            </td>
        </tr>
        <tr>
            <td style="vertical-align:top" style="border-color: Silver; border-width: 1px; border-style: solid;">
                <def:DataFieldControl runat="server" ID="ADOSdate" DatabaseField="ADOSdate" IsEntryField="True" IsDoubleEntryField="True" FieldLabelWidth="300" FieldTextBoxWidth="70" FormatString="{0:d}" />
                <def:DataFieldControl runat="server" ID="ADOSagemo" DatabaseField="ADOSagemo" IsReadOnly="True" FieldLabelWidth="300" FieldTextBoxWidth="60" />
            </td>
            <td></td>
                <td style="vertical-align:top">
                    <def:DataFieldControl runat="server" ID="ADOSreldate" DatabaseField="ADOSreldate" IsEntryField="True" IsDoubleEntryField="True" FieldLabelWidth="300" FieldTextBoxWidth="70"  FormatString="{0:d}" />
                </td>
        </tr>
        <tr>
            <td style="vertical-align:top" style="border-color: Silver; border-width: 1px; border-style: solid;">
                <def:DataFieldControl runat="server" ID="ADOSclin" DatabaseField="ADOSclin" IsEntryField="True" IsDoubleEntryField="True" FieldLabelWidth="300" FieldTextBoxWidth="60" />
            </td>
            <td></td>
                <td>
                    <def:DataFieldControl runat="server" ID="ADOSrelcoder" DatabaseField="ADOSrelcoder" IsEntryField="True" IsDoubleEntryField="True" FieldLabelWidth="300" FieldTextBoxWidth="60" />
                </td>
            
        </tr>
        <tr>
            <td style="vertical-align:top" style="border-color: Silver; border-width: 1px; border-style: solid;">
                <def:DataFieldControl runat="server" ID="ADOScmt" DatabaseField="ADOScmt" IsEntryField="True" IsDoubleEntryField="True" FieldLabelWidth="300" FieldTextBoxWidth="60" />
                <def:DataFieldControl runat="server" ID="ADOSscrmsg" DatabaseField="ADOSscrmsg" IsReadOnly="True" FieldLabelWidth="300" FieldTextBoxWidth="60" />
            </td>
            <td style="vertical-align:top" style="border-color: Silver; border-width: 1px; border-style: solid;">
                <def:DataFieldControl runat="server" ID="ADOSTcmts" DatabaseField="ADOSTcmts" IsEntryField="True" IsDoubleEntryField="True" FieldLabelWidth="300" FieldTextBoxWidth="60" />
                <def:DataFieldControl runat="server" ID="ADOSTscrmsg" DatabaseField="ADOSTscrmsg" IsReadOnly="True" FieldLabelWidth="300" FieldTextBoxWidth="60" />
            </td>
        </tr>
    </table>

    <br/>
<br/>

                <asp:Label id="Label2" runat="server" Text="ADOS Diagnostic Scores" Font-Bold="true" Font-Size="Medium"></asp:Label>

    <table border="0" style="border-color: #9EC0E0; border-width: 2px; border-style: solid;">
        <tr>
            <td style="background-color: Silver;"><b>Modules 1-4</b></td>
            <td style="background-color: Silver;"><b>Toddler Module</b></td>
        </tr>
        <tr></tr>
        <tr>
            <td style="vertical-align:top" style="border-color: Silver; border-width: 1px; border-style: solid;">
                <asp:Label ID="lblorig" runat="server" Text="Original scoring algorithm" Font-Bold="true" Font-Underline="true"></asp:Label>
                <def:DataFieldControl runat="server" ID="ADOScom" DatabaseField="ADOScom" IsReadOnly="True" FieldLabelWidth="300" FieldTextBoxWidth="60" />
                <def:DataFieldControl runat="server" ID="ADOSsoc" DatabaseField="ADOSsoc" IsReadOnly="True" FieldLabelWidth="300" FieldTextBoxWidth="60" />
                <def:DataFieldControl runat="server" ID="ADOSCtot" DatabaseField="ADOSCtot" IsReadOnly="True" FieldLabelWidth="300" FieldTextBoxWidth="60" />
                <def:DataFieldControl runat="server" ID="ADOSDtot" DatabaseField="ADOSDtot" IsReadOnly="True" FieldLabelWidth="300" FieldTextBoxWidth="60" />
                <def:DataFieldControl runat="server" ID="ADOStot" DatabaseField="ADOStot" IsReadOnly="True" FieldLabelWidth="300" FieldTextBoxWidth="60" />
                <def:DataFieldControl runat="server" ID="ADOSdx" DatabaseField="ADOSdx" IsReadOnly="True" FieldLabelWidth="300" FieldTextBoxWidth="60" />
            </td>
        </tr>
        <tr>
            <td style="vertical-align:top" style="border-color: Silver; border-width: 1px; border-style: solid;">
                <def:DataFieldControl runat="server" ID="ADOSalgvers" DatabaseField="ADOSalgvers" IsReadOnly="True" FieldLabelWidth="250" FieldTextBoxWidth="200" Height="40" FieldTextBoxTextMode="MultiLine" />
            </td>
            <td style="vertical-align:top" style="border-color: Silver; border-width: 1px; border-style: solid;">
                <def:DataFieldControl runat="server" ID="ADOSTalgvers" DatabaseField="ADOSTalgvers" IsReadOnly="True" FieldLabelWidth="250" FieldTextBoxWidth="200" Height="40"  FieldTextBoxTextMode="MultiLine" />
            </td>
        </tr>
        <tr></tr>
        <tr>
            <td style="vertical-align:top" style="border-color: Silver; border-width: 1px; border-style: solid;">
                <def:DataFieldControl runat="server" ID="ADOSsocaff" DatabaseField="ADOSsocaff" IsReadOnly="True" FieldLabelWidth="300" FieldTextBoxWidth="60" />
                <def:DataFieldControl runat="server" ID="ADOSrestrep" DatabaseField="ADOSrestrep" IsReadOnly="True" FieldLabelWidth="300" FieldTextBoxWidth="60" />
                <def:DataFieldControl runat="server" ID="ADOStotal" DatabaseField="ADOStotal" IsReadOnly="True" FieldLabelWidth="300" FieldTextBoxWidth="60" />
            </td>
            <td style="vertical-align:top" style="border-color: Silver; border-width: 1px; border-style: solid;">
                <def:DataFieldControl runat="server" ID="ADOSTsocaff" DatabaseField="ADOSTsocaff" IsReadOnly="True" FieldLabelWidth="300" FieldTextBoxWidth="60" />
                <def:DataFieldControl runat="server" ID="ADOSTrestrep" DatabaseField="ADOSTrestrep" IsReadOnly="True" FieldLabelWidth="300" FieldTextBoxWidth="60" />
                <def:DataFieldControl runat="server" ID="ADOSTtotal" DatabaseField="ADOSTtotal" IsReadOnly="True" FieldLabelWidth="300" FieldTextBoxWidth="60" />
            </td>
        </tr>
        <tr>
            <td style="vertical-align:top" style="border-color: Silver; border-width: 1px; border-style: solid;">
                <def:DataFieldControl runat="server" ID="ADOSclass" DatabaseField="ADOSclass" IsReadOnly="True" FieldLabelWidth="300" FieldTextBoxWidth="60" />
            </td>
            <td style="vertical-align:top" style="border-color: Silver; border-width: 1px; border-style: solid;">
                <def:DataFieldControl runat="server" ID="ADOSTclass" DatabaseField="ADOSTclass" IsReadOnly="True" FieldLabelWidth="300" FieldTextBoxWidth="60" />
            </td>
        </tr>
        <tr>
            <td style="vertical-align:top" style="border-color: Silver; border-width: 1px; border-style: solid;">
                <def:DataFieldControl runat="server" ID="ADOScomlev" DatabaseField="ADOScomlev" IsReadOnly="True" FieldLabelWidth="300" FieldTextBoxWidth="60" />
                <def:DataFieldControl runat="server" ID="ADOSsoclev" DatabaseField="ADOSsoclev" IsReadOnly="True" FieldLabelWidth="300" FieldTextBoxWidth="60" />
                <def:DataFieldControl runat="server" ID="ADOStotlev" DatabaseField="ADOStotlev" IsReadOnly="True" FieldLabelWidth="300" FieldTextBoxWidth="60" />
            </td>
        </tr>
    </table>


    <br/>
<br/>

                <asp:Label id="Label13" runat="server" Text="ADOS Severity Scores" Font-Bold="true" Font-Size="Medium"></asp:Label>


    <table border="0" style="border-color: #9EC0E0; border-width: 2px; border-style: solid;">
        <tr>
            <td style="background-color: Silver;"><b>Modules 1-4</b></td>
            <td style="background-color: Silver;"><b>Toddler Module</b></td>
        </tr>
        <tr></tr>
        <tr>
            <td style="vertical-align:top" style="border-color: Silver; border-width: 1px; border-style: solid;">
                <def:DataFieldControl runat="server" ID="ADOSsevscr" DatabaseField="ADOSsevscr" IsReadOnly="True" FieldLabelWidth="300" FieldTextBoxWidth="60" />
                <def:DataFieldControl runat="server" ID="ADOSsevscrext" DatabaseField="ADOSsevscrext" IsReadOnly="True" FieldLabelWidth="300" FieldTextBoxWidth="60" />
            </td>
            <td style="vertical-align:top" style="border-color: Silver; border-width: 1px; border-style: solid;">
                <def:DataFieldControl runat="server" ID="DataFieldControl58" DatabaseField="ADOSTconcern" IsReadOnly="True" FieldLabelWidth="300" FieldTextBoxWidth="60" />
                <def:DataFieldControl runat="server" ID="DataFieldControl59" DatabaseField="ADOSTconcern_txt" IsReadOnly="True" FieldLabelWidth="200" FieldTextBoxWidth="160" />
            </td>
        </tr>
        <tr>
            <td style="vertical-align:top" style="border-color: Silver; border-width: 1px; border-style: solid;">
                <def:DataFieldControl runat="server" ID="ADOSsocaffsev" DatabaseField="ADOSsocaffsev" IsReadOnly="True" FieldLabelWidth="300" FieldTextBoxWidth="60" />
                <def:DataFieldControl runat="server" ID="ADOSrestrepsev" DatabaseField="ADOSrestrepsev" IsReadOnly="True" FieldLabelWidth="300" FieldTextBoxWidth="60" />
            </td>
            <td style="vertical-align:top" style="border-color: Silver; border-width: 1px; border-style: solid;">
            </td>
        </tr>
    </table>
    <br/>
<br/>



    <br />
    <br />


    <table>
        <tr>
            <td>
                <asp:Label ID="Label4" runat="server" Text="G Module 1" Font-Bold="true" Font-Size="Large"></asp:Label>
            </td>
            <td width="100"></td>
            <td>
                <asp:Label ID="Label5" runat="server" Text="WPS Module 1" Font-Bold="true" Font-Size="Large"></asp:Label>

            </td>
            <td width="100"></td>
            <td>
                <asp:Label ID="Label14" runat="server" Text="WPS Toddler Module" Font-Bold="true" Font-Size="Large"></asp:Label>

            </td>
        </tr>
        <tr>
            <td style="vertical-align:top">
                <table border="0" style="border-color: #9EC0E0; border-width: 2px; border-style: solid;">
                    <tr>
                        <td style="background-color: Silver;">COL 0</td>
                    </tr>
                    <tr></tr>
                    <tr>
                        <td style="vertical-align:top" style="border-color: Silver; border-width: 1px; border-style: solid;">
                            <def:DataFieldControl runat="server" ID="ADOSG1_A01" DatabaseField="ADOSG1_A01" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300" FieldTextBoxWidth="60" />
                            <def:DataFieldControl runat="server" ID="ADOSG1_A02" DatabaseField="ADOSG1_A02" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300" FieldTextBoxWidth="60" />
                            <def:DataFieldControl runat="server" ID="ADOSG1_A03" DatabaseField="ADOSG1_A03" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300" FieldTextBoxWidth="60" />
                            <def:DataFieldControl runat="server" ID="ADOSG1_A04" DatabaseField="ADOSG1_A04" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300" FieldTextBoxWidth="60" />
                            <def:DataFieldControl runat="server" ID="ADOSG1_A05" DatabaseField="ADOSG1_A05" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300" FieldTextBoxWidth="60" />
                            <def:DataFieldControl runat="server" ID="ADOSG1_A06" DatabaseField="ADOSG1_A06" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300" FieldTextBoxWidth="60" />
                            <def:DataFieldControl runat="server" ID="ADOSG1_A07" DatabaseField="ADOSG1_A07" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300" FieldTextBoxWidth="60" />
                            <def:DataFieldControl runat="server" ID="ADOSG1_A08" DatabaseField="ADOSG1_A08" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300" FieldTextBoxWidth="60" />
                            <def:DataFieldControl runat="server" ID="ADOSG1_B01" DatabaseField="ADOSG1_B01" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300" FieldTextBoxWidth="60" />
                            <def:DataFieldControl runat="server" ID="ADOSG1_B02" DatabaseField="ADOSG1_B02" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300" FieldTextBoxWidth="60" />
                            <def:DataFieldControl runat="server" ID="ADOSG1_B03" DatabaseField="ADOSG1_B03" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300" FieldTextBoxWidth="60" />
                            <def:DataFieldControl runat="server" ID="ADOSG1_B04" DatabaseField="ADOSG1_B04" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300" FieldTextBoxWidth="60" />
                            <def:DataFieldControl runat="server" ID="ADOSG1_B05" DatabaseField="ADOSG1_B05" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300" FieldTextBoxWidth="60" />
                            <def:DataFieldControl runat="server" ID="ADOSG1_B06" DatabaseField="ADOSG1_B06" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300" FieldTextBoxWidth="60" />
                            <def:DataFieldControl runat="server" ID="ADOSG1_B07" DatabaseField="ADOSG1_B07" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300" FieldTextBoxWidth="60" />
                            <def:DataFieldControl runat="server" ID="ADOSG1_B08" DatabaseField="ADOSG1_B08" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300" FieldTextBoxWidth="60" />
                            <def:DataFieldControl runat="server" ID="ADOSG1_B09" DatabaseField="ADOSG1_B09" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300" FieldTextBoxWidth="60" />
                            <def:DataFieldControl runat="server" ID="ADOSG1_B10" DatabaseField="ADOSG1_B10" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300" FieldTextBoxWidth="60" />
                            <def:DataFieldControl runat="server" ID="ADOSG1_B11" DatabaseField="ADOSG1_B11" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300" FieldTextBoxWidth="60" />
                            <def:DataFieldControl runat="server" ID="ADOSG1_B12" DatabaseField="ADOSG1_B12" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300" FieldTextBoxWidth="60" />
                            <def:DataFieldControl runat="server" ID="ADOSG1_C01" DatabaseField="ADOSG1_C01" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300" FieldTextBoxWidth="60" />
                            <def:DataFieldControl runat="server" ID="ADOSG1_C02" DatabaseField="ADOSG1_C02" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300" FieldTextBoxWidth="60" />
                            <def:DataFieldControl runat="server" ID="ADOSG1_D01" DatabaseField="ADOSG1_D01" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300" FieldTextBoxWidth="60" />
                            <def:DataFieldControl runat="server" ID="ADOSG1_D02" DatabaseField="ADOSG1_D02" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300" FieldTextBoxWidth="60" />
                            <def:DataFieldControl runat="server" ID="ADOSG1_D03" DatabaseField="ADOSG1_D03" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300" FieldTextBoxWidth="60" />
                            <def:DataFieldControl runat="server" ID="ADOSG1_D04" DatabaseField="ADOSG1_D04" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300" FieldTextBoxWidth="60" />
                            <def:DataFieldControl runat="server" ID="ADOSG1_E01" DatabaseField="ADOSG1_E01" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300" FieldTextBoxWidth="60" />
                            <def:DataFieldControl runat="server" ID="ADOSG1_E02" DatabaseField="ADOSG1_E02" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300" FieldTextBoxWidth="60" />
                            <def:DataFieldControl runat="server" ID="ADOSG1_E03" DatabaseField="ADOSG1_E03" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300" FieldTextBoxWidth="60" />
                        </td>
                    </tr>
                </table>

            </td>
            <td width="100"></td>
            <td style="vertical-align:top">
                <table border="0" style="border-color: #9EC0E0; border-width: 2px; border-style: solid;">
                    <tr>
                        <td style="background-color: Silver;">COL 0</td>
                    </tr>
                    <tr></tr>
                    <tr>
                        <td style="vertical-align:top" style="border-color: Silver; border-width: 1px; border-style: solid;">
                            <def:DataFieldControl runat="server" ID="Datafieldcontrol29" DatabaseField="ADOSW1_A01" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300" FieldTextBoxWidth="60" />
                            <def:DataFieldControl runat="server" ID="Datafieldcontrol30" DatabaseField="ADOSW1_A02" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300" FieldTextBoxWidth="60" />
                            <def:DataFieldControl runat="server" ID="Datafieldcontrol31" DatabaseField="ADOSW1_A03" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300" FieldTextBoxWidth="60" />
                            <def:DataFieldControl runat="server" ID="Datafieldcontrol32" DatabaseField="ADOSW1_A04" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300" FieldTextBoxWidth="60" />
                            <def:DataFieldControl runat="server" ID="Datafieldcontrol33" DatabaseField="ADOSW1_A05" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300" FieldTextBoxWidth="60" />
                            <def:DataFieldControl runat="server" ID="Datafieldcontrol34" DatabaseField="ADOSW1_A06" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300" FieldTextBoxWidth="60" />
                            <def:DataFieldControl runat="server" ID="Datafieldcontrol35" DatabaseField="ADOSW1_A07" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300" FieldTextBoxWidth="60" />
                            <def:DataFieldControl runat="server" ID="Datafieldcontrol36" DatabaseField="ADOSW1_A08" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300" FieldTextBoxWidth="60" />
                            <def:DataFieldControl runat="server" ID="Datafieldcontrol37" DatabaseField="ADOSW1_B01" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300" FieldTextBoxWidth="60" />
                            <def:DataFieldControl runat="server" ID="Datafieldcontrol38" DatabaseField="ADOSW1_B02" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300" FieldTextBoxWidth="60" />
                            <def:DataFieldControl runat="server" ID="Datafieldcontrol39" DatabaseField="ADOSW1_B03" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300" FieldTextBoxWidth="60" />
                            <def:DataFieldControl runat="server" ID="Datafieldcontrol40" DatabaseField="ADOSW1_B04" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300" FieldTextBoxWidth="60" />
                            <def:DataFieldControl runat="server" ID="Datafieldcontrol41" DatabaseField="ADOSW1_B05" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300" FieldTextBoxWidth="60" />
                            <def:DataFieldControl runat="server" ID="Datafieldcontrol42" DatabaseField="ADOSW1_B06" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300" FieldTextBoxWidth="60" />
                            <def:DataFieldControl runat="server" ID="Datafieldcontrol43" DatabaseField="ADOSW1_B07" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300" FieldTextBoxWidth="60" />
                            <def:DataFieldControl runat="server" ID="Datafieldcontrol44" DatabaseField="ADOSW1_B08" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300" FieldTextBoxWidth="60" />
                            <def:DataFieldControl runat="server" ID="Datafieldcontrol45" DatabaseField="ADOSW1_B09" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300" FieldTextBoxWidth="60" />
                            <def:DataFieldControl runat="server" ID="Datafieldcontrol46" DatabaseField="ADOSW1_B10" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300" FieldTextBoxWidth="60" />
                            <def:DataFieldControl runat="server" ID="Datafieldcontrol47" DatabaseField="ADOSW1_B11" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300" FieldTextBoxWidth="60" />
                            <def:DataFieldControl runat="server" ID="Datafieldcontrol48" DatabaseField="ADOSW1_B12" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300" FieldTextBoxWidth="60" />
                            <def:DataFieldControl runat="server" ID="Datafieldcontrol49" DatabaseField="ADOSW1_C01" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300" FieldTextBoxWidth="60" />
                            <def:DataFieldControl runat="server" ID="Datafieldcontrol50" DatabaseField="ADOSW1_C02" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300" FieldTextBoxWidth="60" />
                            <def:DataFieldControl runat="server" ID="Datafieldcontrol51" DatabaseField="ADOSW1_D01" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300" FieldTextBoxWidth="60" />
                            <def:DataFieldControl runat="server" ID="Datafieldcontrol52" DatabaseField="ADOSW1_D02" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300" FieldTextBoxWidth="60" />
                            <def:DataFieldControl runat="server" ID="Datafieldcontrol53" DatabaseField="ADOSW1_D03" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300" FieldTextBoxWidth="60" />
                            <def:DataFieldControl runat="server" ID="Datafieldcontrol54" DatabaseField="ADOSW1_D04" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300" FieldTextBoxWidth="60" />
                            <def:DataFieldControl runat="server" ID="Datafieldcontrol55" DatabaseField="ADOSW1_E01" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300" FieldTextBoxWidth="60" />
                            <def:DataFieldControl runat="server" ID="Datafieldcontrol56" DatabaseField="ADOSW1_E02" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300" FieldTextBoxWidth="60" />
                            <def:DataFieldControl runat="server" ID="Datafieldcontrol57" DatabaseField="ADOSW1_E03" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300" FieldTextBoxWidth="60" />
                        </td>
                    </tr>
                </table>

            </td>
            <td width="100"></td>
            <td style="vertical-align:top">
                <table border="0" style="border-color: #9EC0E0; border-width: 2px; border-style: solid;">
                    <tr>
                        <td style="background-color: Silver;">COL 0</td>
                        <td style="background-color: Silver;">COL 1</td>
                    </tr>
                    <tr></tr>
                    <tr>
                        <td style="vertical-align:top" style="border-color: Silver; border-width: 1px; border-style: solid;">
                            <def:DataFieldControl runat="server" ID="ADOSTA01" DatabaseField="ADOSTA01" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300" FieldTextBoxWidth="60" />
                            <def:DataFieldControl runat="server" ID="ADOSTA01a" DatabaseField="ADOSTA01a" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300" FieldTextBoxWidth="60" />
                            <def:DataFieldControl runat="server" ID="ADOSTA02" DatabaseField="ADOSTA02" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300" FieldTextBoxWidth="60" />
                            <def:DataFieldControl runat="server" ID="ADOSTA03" DatabaseField="ADOSTA03" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300" FieldTextBoxWidth="60" />
                            <def:DataFieldControl runat="server" ID="ADOSTA04" DatabaseField="ADOSTA04" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300" FieldTextBoxWidth="60" />
                            <def:DataFieldControl runat="server" ID="ADOSTA05" DatabaseField="ADOSTA05" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300" FieldTextBoxWidth="60" />
                            <def:DataFieldControl runat="server" ID="ADOSTA06" DatabaseField="ADOSTA06" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300" FieldTextBoxWidth="60" />
                            <def:DataFieldControl runat="server" ID="ADOSTA07" DatabaseField="ADOSTA07" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300" FieldTextBoxWidth="60" />
                            <def:DataFieldControl runat="server" ID="ADOSTA08" DatabaseField="ADOSTA08" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300" FieldTextBoxWidth="60" />
                            <def:DataFieldControl runat="server" ID="ADOSTA09" DatabaseField="ADOSTA09" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300" FieldTextBoxWidth="60" />
                            <def:DataFieldControl runat="server" ID="ADOSTB01" DatabaseField="ADOSTB01" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300" FieldTextBoxWidth="60" />
                            <def:DataFieldControl runat="server" ID="ADOSTB02" DatabaseField="ADOSTB02" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300" FieldTextBoxWidth="60" />
                            <def:DataFieldControl runat="server" ID="ADOSTB03" DatabaseField="ADOSTB03" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300" FieldTextBoxWidth="60" />
                            <def:DataFieldControl runat="server" ID="ADOSTB04" DatabaseField="ADOSTB04" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300" FieldTextBoxWidth="60" />
                            <def:DataFieldControl runat="server" ID="ADOSTB05" DatabaseField="ADOSTB05" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300" FieldTextBoxWidth="60" />
                            <def:DataFieldControl runat="server" ID="ADOSTB06" DatabaseField="ADOSTB06" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300" FieldTextBoxWidth="60" />
                            <def:DataFieldControl runat="server" ID="ADOSTB07" DatabaseField="ADOSTB07" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300" FieldTextBoxWidth="60" />
                            <def:DataFieldControl runat="server" ID="ADOSTB08" DatabaseField="ADOSTB08" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300" FieldTextBoxWidth="60" />
                            <def:DataFieldControl runat="server" ID="ADOSTB09" DatabaseField="ADOSTB09" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300" FieldTextBoxWidth="60" />
                            <def:DataFieldControl runat="server" ID="ADOSTB10" DatabaseField="ADOSTB10" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300" FieldTextBoxWidth="60" />
                            <def:DataFieldControl runat="server" ID="ADOSTB11" DatabaseField="ADOSTB11" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300" FieldTextBoxWidth="60" />
                            <def:DataFieldControl runat="server" ID="ADOSTB12" DatabaseField="ADOSTB12" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300" FieldTextBoxWidth="60" />
                            <def:DataFieldControl runat="server" ID="ADOSTB13" DatabaseField="ADOSTB13" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300" FieldTextBoxWidth="60" />
                            <def:DataFieldControl runat="server" ID="ADOSTB14" DatabaseField="ADOSTB14" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300" FieldTextBoxWidth="60" />
                            <def:DataFieldControl runat="server" ID="ADOSTB15" DatabaseField="ADOSTB15" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300" FieldTextBoxWidth="60" />
                            <def:DataFieldControl runat="server" ID="ADOSTB16a" DatabaseField="ADOSTB16a" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300" FieldTextBoxWidth="60" />
                            <def:DataFieldControl runat="server" ID="ADOSTB16b" DatabaseField="ADOSTB16b" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300" FieldTextBoxWidth="60" />
                            <def:DataFieldControl runat="server" ID="ADOSTB17" DatabaseField="ADOSTB17" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300" FieldTextBoxWidth="60" />
                            <def:DataFieldControl runat="server" ID="ADOSTB18" DatabaseField="ADOSTB18" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300" FieldTextBoxWidth="60" />
                            <def:DataFieldControl runat="server" ID="ADOSTC01" DatabaseField="ADOSTC01" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300" FieldTextBoxWidth="60" />
                            <def:DataFieldControl runat="server" ID="ADOSTC02" DatabaseField="ADOSTC02" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300" FieldTextBoxWidth="60" />
                            <def:DataFieldControl runat="server" ID="ADOSTC03" DatabaseField="ADOSTC03" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300" FieldTextBoxWidth="60" />
                            <def:DataFieldControl runat="server" ID="ADOSTD01" DatabaseField="ADOSTD01" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300" FieldTextBoxWidth="60" />
                            <def:DataFieldControl runat="server" ID="ADOSTD01a" DatabaseField="ADOSTD01a" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="200" FieldTextBoxWidth="160" />
                            <def:DataFieldControl runat="server" ID="ADOSTD02" DatabaseField="ADOSTD02" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300" FieldTextBoxWidth="60" />
                            <def:DataFieldControl runat="server" ID="ADOSTD02a" DatabaseField="ADOSTD02a" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="200" FieldTextBoxWidth="160" />
                            <def:DataFieldControl runat="server" ID="ADOSTD03" DatabaseField="ADOSTD03" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300" FieldTextBoxWidth="60" />
                            <def:DataFieldControl runat="server" ID="ADOSTD03a" DatabaseField="ADOSTD03a" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="200" FieldTextBoxWidth="160" />
                            <def:DataFieldControl runat="server" ID="ADOSTD04" DatabaseField="ADOSTD04" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300" FieldTextBoxWidth="60" />
                            <def:DataFieldControl runat="server" ID="ADOSTD05" DatabaseField="ADOSTD05" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300" FieldTextBoxWidth="60" />
                            <def:DataFieldControl runat="server" ID="ADOSTD05a" DatabaseField="ADOSTD05a" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="200" FieldTextBoxWidth="160" />
                            <def:DataFieldControl runat="server" ID="ADOSTE01" DatabaseField="ADOSTE01" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300" FieldTextBoxWidth="60" />
                            <def:DataFieldControl runat="server" ID="ADOSTE02" DatabaseField="ADOSTE02" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300" FieldTextBoxWidth="60" />
                            <def:DataFieldControl runat="server" ID="ADOSTE03" DatabaseField="ADOSTE03" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300" FieldTextBoxWidth="60" />
                            <def:DataFieldControl runat="server" ID="ADOSTE04" DatabaseField="ADOSTE04" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300" FieldTextBoxWidth="60" />
                          </td>
                        <td style="vertical-align:top" style="border-color: Silver; border-width: 1px; border-style: solid;">

                            <def:DataFieldControl runat="server" ID="ADOSTA01b" DatabaseField="ADOSTA01b" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="50" FieldTextBoxWidth="60" />
                            <def:DataFieldControl runat="server" ID="ADOSTA01c" DatabaseField="ADOSTA01c" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="50" FieldTextBoxWidth="60" />
                            <def:DataFieldControl runat="server" ID="ADOSTA01d" DatabaseField="ADOSTA01d" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="50" FieldTextBoxWidth="60" />
                            <def:DataFieldControl runat="server" ID="ADOSTA01e" DatabaseField="ADOSTA01e" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="50" FieldTextBoxWidth="60" />
                            <def:DataFieldControl runat="server" ID="ADOSTA01f" DatabaseField="ADOSTA01f" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="50" FieldTextBoxWidth="60" />
                            <def:DataFieldControl runat="server" ID="ADOSTA01g" DatabaseField="ADOSTA01g" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="50" FieldTextBoxWidth="60" />
                            <def:DataFieldControl runat="server" ID="ADOSTA01h" DatabaseField="ADOSTA01h" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="50" FieldTextBoxWidth="60" />
                            <def:DataFieldControl runat="server" ID="ADOSTA01i" DatabaseField="ADOSTA01i" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="50" FieldTextBoxWidth="60" />
                            <def:DataFieldControl runat="server" ID="ADOSTA01j" DatabaseField="ADOSTA01j" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="50" FieldTextBoxWidth="60" />
                            <def:DataFieldControl runat="server" ID="ADOSTA01k" DatabaseField="ADOSTA01k" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="50" FieldTextBoxWidth="60" />

                        </td>
                    </tr>
                </table>
            </td>

        </tr>
    </table>
    <br />
    <br />

    <table>
        <tr>
            <td>
                <asp:Label ID="Label6" runat="server" Text="G Module 2" Font-Bold="true" Font-Size="Large"></asp:Label>
            </td>
            <td width="100"></td>
            <td>
                <asp:Label ID="Label7" runat="server" Text="WPS Module 2" Font-Bold="true" Font-Size="Large"></asp:Label>

            </td>
        </tr>
        <tr>
            <td style="vertical-align:top">
                <table border="0" style="border-color: #9EC0E0; border-width: 2px; border-style: solid;">
                    <tr>
                        <td style="background-color: Silver;">COL 0</td>
                    </tr>
                    <tr></tr>
                    <tr>
                        <td style="vertical-align:top" style="border-color: Silver; border-width: 1px; border-style: solid;">
                            <def:DataFieldControl runat="server" ID="ADOSG2_A01" DatabaseField="ADOSG2_A01" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300" FieldTextBoxWidth="60" />
                            <def:DataFieldControl runat="server" ID="ADOSG2_A02" DatabaseField="ADOSG2_A02" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300" FieldTextBoxWidth="60" />
                            <def:DataFieldControl runat="server" ID="ADOSG2_A03" DatabaseField="ADOSG2_A03" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300" FieldTextBoxWidth="60" />
                            <def:DataFieldControl runat="server" ID="ADOSG2_A04" DatabaseField="ADOSG2_A04" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300" FieldTextBoxWidth="60" />
                            <def:DataFieldControl runat="server" ID="ADOSG2_A05" DatabaseField="ADOSG2_A05" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300" FieldTextBoxWidth="60" />
                            <def:DataFieldControl runat="server" ID="ADOSG2_A06" DatabaseField="ADOSG2_A06" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300" FieldTextBoxWidth="60" />
                            <def:DataFieldControl runat="server" ID="ADOSG2_A07" DatabaseField="ADOSG2_A07" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300" FieldTextBoxWidth="60" />
                            <def:DataFieldControl runat="server" ID="ADOSG2_A08" DatabaseField="ADOSG2_A08" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300" FieldTextBoxWidth="60" />
                            <def:DataFieldControl runat="server" ID="ADOSG2_A09" DatabaseField="ADOSG2_A09" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300" FieldTextBoxWidth="60" />
                            <def:DataFieldControl runat="server" ID="ADOSG2_B01" DatabaseField="ADOSG2_B01" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300" FieldTextBoxWidth="60" />
                            <def:DataFieldControl runat="server" ID="ADOSG2_B02" DatabaseField="ADOSG2_B02" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300" FieldTextBoxWidth="60" />
                            <def:DataFieldControl runat="server" ID="ADOSG2_B03" DatabaseField="ADOSG2_B03" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300" FieldTextBoxWidth="60" />
                            <def:DataFieldControl runat="server" ID="ADOSG2_B04" DatabaseField="ADOSG2_B04" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300" FieldTextBoxWidth="60" />
                            <def:DataFieldControl runat="server" ID="ADOSG2_B05" DatabaseField="ADOSG2_B05" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300" FieldTextBoxWidth="60" />
                            <def:DataFieldControl runat="server" ID="ADOSG2_B06" DatabaseField="ADOSG2_B06" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300" FieldTextBoxWidth="60" />
                            <def:DataFieldControl runat="server" ID="ADOSG2_B07" DatabaseField="ADOSG2_B07" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300" FieldTextBoxWidth="60" />
                            <def:DataFieldControl runat="server" ID="ADOSG2_B08" DatabaseField="ADOSG2_B08" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300" FieldTextBoxWidth="60" />
                            <def:DataFieldControl runat="server" ID="ADOSG2_B09" DatabaseField="ADOSG2_B09" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300" FieldTextBoxWidth="60" />
                            <def:DataFieldControl runat="server" ID="ADOSG2_B10" DatabaseField="ADOSG2_B10" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300" FieldTextBoxWidth="60" />
                            <def:DataFieldControl runat="server" ID="ADOSG2_C01" DatabaseField="ADOSG2_C01" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300" FieldTextBoxWidth="60" />
                            <def:DataFieldControl runat="server" ID="ADOSG2_C02" DatabaseField="ADOSG2_C02" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300" FieldTextBoxWidth="60" />
                            <def:DataFieldControl runat="server" ID="ADOSG2_D01" DatabaseField="ADOSG2_D01" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300" FieldTextBoxWidth="60" />
                            <def:DataFieldControl runat="server" ID="ADOSG2_D02" DatabaseField="ADOSG2_D02" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300" FieldTextBoxWidth="60" />
                            <def:DataFieldControl runat="server" ID="ADOSG2_D03" DatabaseField="ADOSG2_D03" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300" FieldTextBoxWidth="60" />
                            <def:DataFieldControl runat="server" ID="ADOSG2_D04" DatabaseField="ADOSG2_D04" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300" FieldTextBoxWidth="60" />
                            <def:DataFieldControl runat="server" ID="ADOSG2_E01" DatabaseField="ADOSG2_E01" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300" FieldTextBoxWidth="60" />
                            <def:DataFieldControl runat="server" ID="ADOSG2_E02" DatabaseField="ADOSG2_E02" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300" FieldTextBoxWidth="60" />
                            <def:DataFieldControl runat="server" ID="ADOSG2_E03" DatabaseField="ADOSG2_E03" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300" FieldTextBoxWidth="60" />
                        </td>
                    </tr>
                </table>

            </td>
            <td width="100"></td>
            <td style="vertical-align:top">
                <table border="0" style="border-color: #9EC0E0; border-width: 2px; border-style: solid;">
                    <tr>
                        <td style="background-color: Silver;">COL 0</td>
                    </tr>
                    <tr></tr>
                    <tr>
                        <td style="vertical-align:top" style="border-color: Silver; border-width: 1px; border-style: solid;">
                            <def:DataFieldControl runat="server" ID="Datafieldcontrol1" DatabaseField="ADOSW2_A01" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300" FieldTextBoxWidth="60" />
                            <def:DataFieldControl runat="server" ID="Datafieldcontrol2" DatabaseField="ADOSW2_A02" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300" FieldTextBoxWidth="60" />
                            <def:DataFieldControl runat="server" ID="Datafieldcontrol3" DatabaseField="ADOSW2_A03" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300" FieldTextBoxWidth="60" />
                            <def:DataFieldControl runat="server" ID="Datafieldcontrol4" DatabaseField="ADOSW2_A04" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300" FieldTextBoxWidth="60" />
                            <def:DataFieldControl runat="server" ID="Datafieldcontrol5" DatabaseField="ADOSW2_A05" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300" FieldTextBoxWidth="60" />
                            <def:DataFieldControl runat="server" ID="Datafieldcontrol6" DatabaseField="ADOSW2_A06" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300" FieldTextBoxWidth="60" />
                            <def:DataFieldControl runat="server" ID="Datafieldcontrol7" DatabaseField="ADOSW2_A07" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300" FieldTextBoxWidth="60" />
                            <def:DataFieldControl runat="server" ID="Datafieldcontrol8" DatabaseField="ADOSW2_A08" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300" FieldTextBoxWidth="60" />
                            <def:DataFieldControl runat="server" ID="Datafieldcontrol9" DatabaseField="ADOSW2_B01" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300" FieldTextBoxWidth="60" />
                            <def:DataFieldControl runat="server" ID="Datafieldcontrol10" DatabaseField="ADOSW2_B02" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300" FieldTextBoxWidth="60" />
                            <def:DataFieldControl runat="server" ID="Datafieldcontrol11" DatabaseField="ADOSW2_B03" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300" FieldTextBoxWidth="60" />
                            <def:DataFieldControl runat="server" ID="Datafieldcontrol12" DatabaseField="ADOSW2_B04" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300" FieldTextBoxWidth="60" />
                            <def:DataFieldControl runat="server" ID="Datafieldcontrol13" DatabaseField="ADOSW2_B05" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300" FieldTextBoxWidth="60" />
                            <def:DataFieldControl runat="server" ID="Datafieldcontrol14" DatabaseField="ADOSW2_B06" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300" FieldTextBoxWidth="60" />
                            <def:DataFieldControl runat="server" ID="Datafieldcontrol15" DatabaseField="ADOSW2_B07" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300" FieldTextBoxWidth="60" />
                            <def:DataFieldControl runat="server" ID="Datafieldcontrol16" DatabaseField="ADOSW2_B08" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300" FieldTextBoxWidth="60" />
                            <def:DataFieldControl runat="server" ID="Datafieldcontrol17" DatabaseField="ADOSW2_B09" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300" FieldTextBoxWidth="60" />
                            <def:DataFieldControl runat="server" ID="Datafieldcontrol18" DatabaseField="ADOSW2_B10" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300" FieldTextBoxWidth="60" />
                            <def:DataFieldControl runat="server" ID="Datafieldcontrol19" DatabaseField="ADOSW2_B11" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300" FieldTextBoxWidth="60" />
                            <def:DataFieldControl runat="server" ID="Datafieldcontrol20" DatabaseField="ADOSW2_C01" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300" FieldTextBoxWidth="60" />
                            <def:DataFieldControl runat="server" ID="Datafieldcontrol21" DatabaseField="ADOSW2_C02" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300" FieldTextBoxWidth="60" />
                            <def:DataFieldControl runat="server" ID="Datafieldcontrol22" DatabaseField="ADOSW2_D01" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300" FieldTextBoxWidth="60" />
                            <def:DataFieldControl runat="server" ID="Datafieldcontrol23" DatabaseField="ADOSW2_D02" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300" FieldTextBoxWidth="60" />
                            <def:DataFieldControl runat="server" ID="Datafieldcontrol24" DatabaseField="ADOSW2_D03" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300" FieldTextBoxWidth="60" />
                            <def:DataFieldControl runat="server" ID="Datafieldcontrol25" DatabaseField="ADOSW2_D04" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300" FieldTextBoxWidth="60" />
                            <def:DataFieldControl runat="server" ID="Datafieldcontrol26" DatabaseField="ADOSW2_E01" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300" FieldTextBoxWidth="60" />
                            <def:DataFieldControl runat="server" ID="Datafieldcontrol27" DatabaseField="ADOSW2_E02" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300" FieldTextBoxWidth="60" />
                            <def:DataFieldControl runat="server" ID="Datafieldcontrol28" DatabaseField="ADOSW2_E03" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300" FieldTextBoxWidth="60" />
                        </td>
                    </tr>
                </table>

            </td>
        </tr>
    </table>
    <br />
    <br />


    <table>
        <tr>
            <td>
                <asp:Label ID="Label8" runat="server" Text="G Module 3" Font-Bold="true" Font-Size="Large"></asp:Label>
            </td>
            <td width="100"></td>
            <td>
                <asp:Label ID="Label9" runat="server" Text="WPS Module 3" Font-Bold="true" Font-Size="Large"></asp:Label>

            </td>
        </tr>
        <tr>
            <td style="vertical-align:top">
                <table border="0" style="border-color: #9EC0E0; border-width: 2px; border-style: solid;">
                    <tr>
                        <td style="background-color: Silver;">COL 0</td>
                    </tr>
                    <tr></tr>
                    <tr>
                        <td style="vertical-align:top" style="border-color: Silver; border-width: 1px; border-style: solid;">
                            <def:DataFieldControl runat="server" ID="ADOSG3_A01" DatabaseField="ADOSG3_A01" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300" FieldTextBoxWidth="60" />
                            <def:DataFieldControl runat="server" ID="ADOSG3_A02" DatabaseField="ADOSG3_A02" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300" FieldTextBoxWidth="60" />
                            <def:DataFieldControl runat="server" ID="ADOSG3_A03" DatabaseField="ADOSG3_A03" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300" FieldTextBoxWidth="60" />
                            <def:DataFieldControl runat="server" ID="ADOSG3_A04" DatabaseField="ADOSG3_A04" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300" FieldTextBoxWidth="60" />
                            <def:DataFieldControl runat="server" ID="ADOSG3_A05" DatabaseField="ADOSG3_A05" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300" FieldTextBoxWidth="60" />
                            <def:DataFieldControl runat="server" ID="ADOSG3_A06" DatabaseField="ADOSG3_A06" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300" FieldTextBoxWidth="60" />
                            <def:DataFieldControl runat="server" ID="ADOSG3_A07" DatabaseField="ADOSG3_A07" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300" FieldTextBoxWidth="60" />
                            <def:DataFieldControl runat="server" ID="ADOSG3_A08" DatabaseField="ADOSG3_A08" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300" FieldTextBoxWidth="60" />
                            <def:DataFieldControl runat="server" ID="ADOSG3_A09" DatabaseField="ADOSG3_A09" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300" FieldTextBoxWidth="60" />
                            <def:DataFieldControl runat="server" ID="ADOSG3_A10" DatabaseField="ADOSG3_A10" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300" FieldTextBoxWidth="60" />
                            <def:DataFieldControl runat="server" ID="ADOSG3_B01" DatabaseField="ADOSG3_B01" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300" FieldTextBoxWidth="60" />
                            <def:DataFieldControl runat="server" ID="ADOSG3_B02" DatabaseField="ADOSG3_B02" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300" FieldTextBoxWidth="60" />
                            <def:DataFieldControl runat="server" ID="ADOSG3_B03" DatabaseField="ADOSG3_B03" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300" FieldTextBoxWidth="60" />
                            <def:DataFieldControl runat="server" ID="ADOSG3_B04" DatabaseField="ADOSG3_B04" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300" FieldTextBoxWidth="60" />
                            <def:DataFieldControl runat="server" ID="ADOSG3_B05" DatabaseField="ADOSG3_B05" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300" FieldTextBoxWidth="60" />
                            <def:DataFieldControl runat="server" ID="ADOSG3_B06" DatabaseField="ADOSG3_B06" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300" FieldTextBoxWidth="60" />
                            <def:DataFieldControl runat="server" ID="ADOSG3_B07" DatabaseField="ADOSG3_B07" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300" FieldTextBoxWidth="60" />
                            <def:DataFieldControl runat="server" ID="ADOSG3_B08" DatabaseField="ADOSG3_B08" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300" FieldTextBoxWidth="60" />
                            <def:DataFieldControl runat="server" ID="ADOSG3_B09" DatabaseField="ADOSG3_B09" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300" FieldTextBoxWidth="60" />
                            <def:DataFieldControl runat="server" ID="ADOSG3_B10" DatabaseField="ADOSG3_B10" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300" FieldTextBoxWidth="60" />
                            <def:DataFieldControl runat="server" ID="ADOSG3_C01" DatabaseField="ADOSG3_C01" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300" FieldTextBoxWidth="60" />
                            <def:DataFieldControl runat="server" ID="ADOSG3_D01" DatabaseField="ADOSG3_D01" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300" FieldTextBoxWidth="60" />
                            <def:DataFieldControl runat="server" ID="ADOSG3_D02" DatabaseField="ADOSG3_D02" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300" FieldTextBoxWidth="60" />
                            <def:DataFieldControl runat="server" ID="ADOSG3_D03" DatabaseField="ADOSG3_D03" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300" FieldTextBoxWidth="60" />
                            <def:DataFieldControl runat="server" ID="ADOSG3_D04" DatabaseField="ADOSG3_D04" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300" FieldTextBoxWidth="60" />
                            <def:DataFieldControl runat="server" ID="ADOSG3_D05" DatabaseField="ADOSG3_D05" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300" FieldTextBoxWidth="60" />
                            <def:DataFieldControl runat="server" ID="ADOSG3_D06" DatabaseField="ADOSG3_D06" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300" FieldTextBoxWidth="60" />
                            <def:DataFieldControl runat="server" ID="ADOSG3_E01" DatabaseField="ADOSG3_E01" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300" FieldTextBoxWidth="60" />
                            <def:DataFieldControl runat="server" ID="ADOSG3_E02" DatabaseField="ADOSG3_E02" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300" FieldTextBoxWidth="60" />
                            <def:DataFieldControl runat="server" ID="ADOSG3_E03" DatabaseField="ADOSG3_E03" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300" FieldTextBoxWidth="60" />
                        </td>
                    </tr>
                </table>

            </td>
            <td width="100"></td>
            <td style="vertical-align:top">
                <table border="0" style="border-color: #9EC0E0; border-width: 2px; border-style: solid;">
                    <tr>
                        <td style="background-color: Silver;">COL 0</td>
                    </tr>
                    <tr></tr>
                    <tr>
                        <td style="vertical-align:top" style="border-color: Silver; border-width: 1px; border-style: solid;">
                            <def:DataFieldControl runat="server" ID="ADOSW3_A01" DatabaseField="ADOSW3_A01" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300" FieldTextBoxWidth="60" />
                            <def:DataFieldControl runat="server" ID="ADOSW3_A02" DatabaseField="ADOSW3_A02" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300" FieldTextBoxWidth="60" />
                            <def:DataFieldControl runat="server" ID="ADOSW3_A03" DatabaseField="ADOSW3_A03" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300" FieldTextBoxWidth="60" />
                            <def:DataFieldControl runat="server" ID="ADOSW3_A04" DatabaseField="ADOSW3_A04" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300" FieldTextBoxWidth="60" />
                            <def:DataFieldControl runat="server" ID="ADOSW3_A05" DatabaseField="ADOSW3_A05" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300" FieldTextBoxWidth="60" />
                            <def:DataFieldControl runat="server" ID="ADOSW3_A06" DatabaseField="ADOSW3_A06" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300" FieldTextBoxWidth="60" />
                            <def:DataFieldControl runat="server" ID="ADOSW3_A07" DatabaseField="ADOSW3_A07" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300" FieldTextBoxWidth="60" />
                            <def:DataFieldControl runat="server" ID="ADOSW3_A08" DatabaseField="ADOSW3_A08" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300" FieldTextBoxWidth="60" />
                            <def:DataFieldControl runat="server" ID="ADOSW3_A09" DatabaseField="ADOSW3_A09" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300" FieldTextBoxWidth="60" />
                            <def:DataFieldControl runat="server" ID="ADOSW3_B01" DatabaseField="ADOSW3_B01" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300" FieldTextBoxWidth="60" />
                            <def:DataFieldControl runat="server" ID="ADOSW3_B02" DatabaseField="ADOSW3_B02" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300" FieldTextBoxWidth="60" />
                            <def:DataFieldControl runat="server" ID="ADOSW3_B03" DatabaseField="ADOSW3_B03" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300" FieldTextBoxWidth="60" />
                            <def:DataFieldControl runat="server" ID="ADOSW3_B04" DatabaseField="ADOSW3_B04" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300" FieldTextBoxWidth="60" />
                            <def:DataFieldControl runat="server" ID="ADOSW3_B05" DatabaseField="ADOSW3_B05" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300" FieldTextBoxWidth="60" />
                            <def:DataFieldControl runat="server" ID="ADOSW3_B06" DatabaseField="ADOSW3_B06" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300" FieldTextBoxWidth="60" />
                            <def:DataFieldControl runat="server" ID="ADOSW3_B07" DatabaseField="ADOSW3_B07" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300" FieldTextBoxWidth="60" />
                            <def:DataFieldControl runat="server" ID="ADOSW3_B08" DatabaseField="ADOSW3_B08" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300" FieldTextBoxWidth="60" />
                            <def:DataFieldControl runat="server" ID="ADOSW3_B09" DatabaseField="ADOSW3_B09" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300" FieldTextBoxWidth="60" />
                            <def:DataFieldControl runat="server" ID="ADOSW3_B10" DatabaseField="ADOSW3_B10" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300" FieldTextBoxWidth="60" />
                            <def:DataFieldControl runat="server" ID="ADOSW3_C01" DatabaseField="ADOSW3_C01" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300" FieldTextBoxWidth="60" />
                            <def:DataFieldControl runat="server" ID="ADOSW3_D01" DatabaseField="ADOSW3_D01" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300" FieldTextBoxWidth="60" />
                            <def:DataFieldControl runat="server" ID="ADOSW3_D02" DatabaseField="ADOSW3_D02" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300" FieldTextBoxWidth="60" />
                            <def:DataFieldControl runat="server" ID="ADOSW3_D03" DatabaseField="ADOSW3_D03" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300" FieldTextBoxWidth="60" />
                            <def:DataFieldControl runat="server" ID="ADOSW3_D04" DatabaseField="ADOSW3_D04" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300" FieldTextBoxWidth="60" />
                            <def:DataFieldControl runat="server" ID="ADOSW3_D05" DatabaseField="ADOSW3_D05" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300" FieldTextBoxWidth="60" />
                            <def:DataFieldControl runat="server" ID="ADOSW3_E01" DatabaseField="ADOSW3_E01" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300" FieldTextBoxWidth="60" />
                            <def:DataFieldControl runat="server" ID="ADOSW3_E02" DatabaseField="ADOSW3_E02" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300" FieldTextBoxWidth="60" />
                            <def:DataFieldControl runat="server" ID="ADOSW3_E03" DatabaseField="ADOSW3_E03" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300" FieldTextBoxWidth="60" />
                        </td>
                    </tr>
                </table>

            </td>
        </tr>
    </table>
    <br />
    <br />





    <table>
        <tr>
            <td>
                <asp:Label ID="Label11" runat="server" Text="G Module 4" Font-Bold="true" Font-Size="Large"></asp:Label>
            </td>
            <td width="100"></td>
            <td>
                <asp:Label ID="Label12" runat="server" Text="WPS Module 4" Font-Bold="true" Font-Size="Large"></asp:Label>

            </td>
            <td width="100"></td>
            <td></td>
        </tr>
        <tr>
            <td style="vertical-align:top">
                <table border="0" style="border-color: #9EC0E0; border-width: 2px; border-style: solid;">
                    <tr>
                        <td style="background-color: Silver;">COL 0</td>
                    </tr>
                    <tr></tr>
                    <tr>
                        <td style="vertical-align:top" style="border-color: Silver; border-width: 1px; border-style: solid;">
                            <def:DataFieldControl runat="server" ID="ADOSG4_A01" DatabaseField="ADOSG4_A01" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300" FieldTextBoxWidth="60" />
                            <def:DataFieldControl runat="server" ID="ADOSG4_A02" DatabaseField="ADOSG4_A02" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300" FieldTextBoxWidth="60" />
                            <def:DataFieldControl runat="server" ID="ADOSG4_A03" DatabaseField="ADOSG4_A03" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300" FieldTextBoxWidth="60" />
                            <def:DataFieldControl runat="server" ID="ADOSG4_A04" DatabaseField="ADOSG4_A04" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300" FieldTextBoxWidth="60" />
                            <def:DataFieldControl runat="server" ID="ADOSG4_A05" DatabaseField="ADOSG4_A05" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300" FieldTextBoxWidth="60" />
                            <def:DataFieldControl runat="server" ID="ADOSG4_A06" DatabaseField="ADOSG4_A06" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300" FieldTextBoxWidth="60" />
                            <def:DataFieldControl runat="server" ID="ADOSG4_A07" DatabaseField="ADOSG4_A07" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300" FieldTextBoxWidth="60" />
                            <def:DataFieldControl runat="server" ID="ADOSG4_A08" DatabaseField="ADOSG4_A08" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300" FieldTextBoxWidth="60" />
                            <def:DataFieldControl runat="server" ID="ADOSG4_A09" DatabaseField="ADOSG4_A09" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300" FieldTextBoxWidth="60" />
                            <def:DataFieldControl runat="server" ID="ADOSG4_A10" DatabaseField="ADOSG4_A10" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300" FieldTextBoxWidth="60" />
                            <def:DataFieldControl runat="server" ID="ADOSG4_B01" DatabaseField="ADOSG4_B01" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300" FieldTextBoxWidth="60" />
                            <def:DataFieldControl runat="server" ID="ADOSG4_B02" DatabaseField="ADOSG4_B02" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300" FieldTextBoxWidth="60" />
                            <def:DataFieldControl runat="server" ID="ADOSG4_B03" DatabaseField="ADOSG4_B03" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300" FieldTextBoxWidth="60" />
                            <def:DataFieldControl runat="server" ID="ADOSG4_B04" DatabaseField="ADOSG4_B04" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300" FieldTextBoxWidth="60" />
                            <def:DataFieldControl runat="server" ID="ADOSG4_B05" DatabaseField="ADOSG4_B05" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300" FieldTextBoxWidth="60" />
                            <def:DataFieldControl runat="server" ID="ADOSG4_B06" DatabaseField="ADOSG4_B06" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300" FieldTextBoxWidth="60" />
                            <def:DataFieldControl runat="server" ID="ADOSG4_B07" DatabaseField="ADOSG4_B07" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300" FieldTextBoxWidth="60" />
                            <def:DataFieldControl runat="server" ID="ADOSG4_B08" DatabaseField="ADOSG4_B08" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300" FieldTextBoxWidth="60" />
                            <def:DataFieldControl runat="server" ID="ADOSG4_B09" DatabaseField="ADOSG4_B09" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300" FieldTextBoxWidth="60" />
                            <def:DataFieldControl runat="server" ID="ADOSG4_B10" DatabaseField="ADOSG4_B10" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300" FieldTextBoxWidth="60" />
                            <def:DataFieldControl runat="server" ID="ADOSG4_B11" DatabaseField="ADOSG4_B11" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300" FieldTextBoxWidth="60" />
                            <def:DataFieldControl runat="server" ID="ADOSG4_C01" DatabaseField="ADOSG4_C01" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300" FieldTextBoxWidth="60" />
                            <def:DataFieldControl runat="server" ID="ADOSG4_D01" DatabaseField="ADOSG4_D01" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300" FieldTextBoxWidth="60" />
                            <def:DataFieldControl runat="server" ID="ADOSG4_D02" DatabaseField="ADOSG4_D02" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300" FieldTextBoxWidth="60" />
                            <def:DataFieldControl runat="server" ID="ADOSG4_D03" DatabaseField="ADOSG4_D03" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300" FieldTextBoxWidth="60" />
                            <def:DataFieldControl runat="server" ID="ADOSG4_D04" DatabaseField="ADOSG4_D04" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300" FieldTextBoxWidth="60" />
                            <def:DataFieldControl runat="server" ID="ADOSG4_D05" DatabaseField="ADOSG4_D05" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300" FieldTextBoxWidth="60" />
                            <def:DataFieldControl runat="server" ID="ADOSG4_E01" DatabaseField="ADOSG4_E01" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300" FieldTextBoxWidth="60" />
                            <def:DataFieldControl runat="server" ID="ADOSG4_E02" DatabaseField="ADOSG4_E02" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300" FieldTextBoxWidth="60" />
                            <def:DataFieldControl runat="server" ID="ADOSG4_E03" DatabaseField="ADOSG4_E03" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300" FieldTextBoxWidth="60" />
                        </td>
                    </tr>
                </table>


            </td>
            <td width="100"></td>
            <td style="vertical-align:top">
                <table border="0" style="border-color: #9EC0E0; border-width: 2px; border-style: solid;">
                    <tr>
                        <td style="background-color: Silver;">COL 0</td>
                    </tr>
                    <tr></tr>
                    <tr>
                        <td style="vertical-align:top" style="border-color: Silver; border-width: 1px; border-style: solid;">
                            <def:DataFieldControl runat="server" ID="ADOSW4_A01" DatabaseField="ADOSW4_A01" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300" FieldTextBoxWidth="60" />
                            <def:DataFieldControl runat="server" ID="ADOSW4_A02" DatabaseField="ADOSW4_A02" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300" FieldTextBoxWidth="60" />
                            <def:DataFieldControl runat="server" ID="ADOSW4_A03" DatabaseField="ADOSW4_A03" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300" FieldTextBoxWidth="60" />
                            <def:DataFieldControl runat="server" ID="ADOSW4_A04" DatabaseField="ADOSW4_A04" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300" FieldTextBoxWidth="60" />
                            <def:DataFieldControl runat="server" ID="ADOSW4_A05" DatabaseField="ADOSW4_A05" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300" FieldTextBoxWidth="60" />
                            <def:DataFieldControl runat="server" ID="ADOSW4_A06" DatabaseField="ADOSW4_A06" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300" FieldTextBoxWidth="60" />
                            <def:DataFieldControl runat="server" ID="ADOSW4_A07" DatabaseField="ADOSW4_A07" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300" FieldTextBoxWidth="60" />
                            <def:DataFieldControl runat="server" ID="ADOSW4_A08" DatabaseField="ADOSW4_A08" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300" FieldTextBoxWidth="60" />
                            <def:DataFieldControl runat="server" ID="ADOSW4_A09" DatabaseField="ADOSW4_A09" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300" FieldTextBoxWidth="60" />
                            <def:DataFieldControl runat="server" ID="ADOSW4_A10" DatabaseField="ADOSW4_A10" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300" FieldTextBoxWidth="60" />
                            <def:DataFieldControl runat="server" ID="ADOSW4_B01" DatabaseField="ADOSW4_B01" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300" FieldTextBoxWidth="60" />
                            <def:DataFieldControl runat="server" ID="ADOSW4_B02" DatabaseField="ADOSW4_B02" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300" FieldTextBoxWidth="60" />
                            <def:DataFieldControl runat="server" ID="ADOSW4_B03" DatabaseField="ADOSW4_B03" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300" FieldTextBoxWidth="60" />
                            <def:DataFieldControl runat="server" ID="ADOSW4_B04" DatabaseField="ADOSW4_B04" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300" FieldTextBoxWidth="60" />
                            <def:DataFieldControl runat="server" ID="ADOSW4_B05" DatabaseField="ADOSW4_B05" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300" FieldTextBoxWidth="60" />
                            <def:DataFieldControl runat="server" ID="ADOSW4_B06" DatabaseField="ADOSW4_B06" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300" FieldTextBoxWidth="60" />
                            <def:DataFieldControl runat="server" ID="ADOSW4_B07" DatabaseField="ADOSW4_B07" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300" FieldTextBoxWidth="60" />
                            <def:DataFieldControl runat="server" ID="ADOSW4_B08" DatabaseField="ADOSW4_B08" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300" FieldTextBoxWidth="60" />
                            <def:DataFieldControl runat="server" ID="ADOSW4_B09" DatabaseField="ADOSW4_B09" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300" FieldTextBoxWidth="60" />
                            <def:DataFieldControl runat="server" ID="ADOSW4_B10" DatabaseField="ADOSW4_B10" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300" FieldTextBoxWidth="60" />
                            <def:DataFieldControl runat="server" ID="ADOSW4_B11" DatabaseField="ADOSW4_B11" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300" FieldTextBoxWidth="60" />
                            <def:DataFieldControl runat="server" ID="ADOSW4_B12" DatabaseField="ADOSW4_B12" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300" FieldTextBoxWidth="60" />
                            <def:DataFieldControl runat="server" ID="ADOSW4_C01" DatabaseField="ADOSW4_C01" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300" FieldTextBoxWidth="60" />
                            <def:DataFieldControl runat="server" ID="ADOSW4_D01" DatabaseField="ADOSW4_D01" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300" FieldTextBoxWidth="60" />
                            <def:DataFieldControl runat="server" ID="ADOSW4_D02" DatabaseField="ADOSW4_D02" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300" FieldTextBoxWidth="60" />
                            <def:DataFieldControl runat="server" ID="ADOSW4_D03" DatabaseField="ADOSW4_D03" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300" FieldTextBoxWidth="60" />
                            <def:DataFieldControl runat="server" ID="ADOSW4_D04" DatabaseField="ADOSW4_D04" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300" FieldTextBoxWidth="60" />
                            <def:DataFieldControl runat="server" ID="ADOSW4_D05" DatabaseField="ADOSW4_D05" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300" FieldTextBoxWidth="60" />
                            <def:DataFieldControl runat="server" ID="ADOSW4_E01" DatabaseField="ADOSW4_E01" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300" FieldTextBoxWidth="60" />
                            <def:DataFieldControl runat="server" ID="ADOSW4_E02" DatabaseField="ADOSW4_E02" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300" FieldTextBoxWidth="60" />
                            <def:DataFieldControl runat="server" ID="ADOSW4_E03" DatabaseField="ADOSW4_E03" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300" FieldTextBoxWidth="60" />
                        </td>
                    </tr>
                </table>

            </td>
        </tr>
    </table>
    <br />
    <br />




<def:datafieldcontrol runat="server" id="created" DatabaseField="created" IsReadOnly="true" RenderReadOnlyAsDiv="true"   FieldLabelWidth="100px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="createdBy" DatabaseField="createdBy" IsReadOnly="true" RenderReadOnlyAsDiv="true"   FieldLabelWidth="100px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="50"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="updated" DatabaseField="updated" IsReadOnly="true" RenderReadOnlyAsDiv="true"   FieldLabelWidth="100px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="updatedBy" DatabaseField="updatedBy" IsReadOnly="true" RenderReadOnlyAsDiv="true"  FieldLabelWidth="100px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="50"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="scored" DatabaseField="scored" IsReadOnly="true" RenderReadOnlyAsDiv="true"  FieldLabelWidth="100px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="scoredBy" DatabaseField="scoredBy" IsReadOnly="true" RenderReadOnlyAsDiv="true"   FieldLabelWidth="100px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="50"></def:datafieldcontrol>




</asp:Content>


