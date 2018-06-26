<%@ Register TagPrefix="def" Namespace="DataEntryFramework3" %> 
<%@ Page language="c#" MasterPageFile="~/UWAC.master"  Title="AOSI Data Entry" %>
<asp:Content ID="Content1" ContentPlaceHolderID="oBodyPlaceHolder" runat="server">
<def:dataentrycontroller id="DataEntryController1" runat="server" DatabaseTable="ALL_AOSI" >
</def:dataentrycontroller>
<def:datafieldcontrol runat="server" id="id" DatabaseField="id"  IsInsertField="true"   FieldLabelWidth="300px "></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="indexnum" DatabaseField="indexnum"  IsInsertField="true"   FieldLabelWidth="300px "></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="aosidate" DatabaseField="aosidate"  IsInsertField="true"  FieldLabelWidth="300px "></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="aosiclin" DatabaseField="aosiclin"  IsInsertField="true"  FieldLabelWidth="300px "></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="aosiagmos" DatabaseField="aosiagmos"  IsInsertField="true"  FieldLabelWidth="300px " FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <br />
    <table>
        <tr>
            <td style="vertical-align:top">
<def:datafieldcontrol runat="server" id="aosiscrmeth" DatabaseField="aosiscrmeth"  IsInsertField="true"  FieldLabelWidth="300px " FieldTextBoxWidth="40px"></def:datafieldcontrol>
            </td>
            <td style="vertical-align:top">
<def:ValueSetLabel ID="ValueSetLabel_aosiscrmeth" runat="server"  DatabaseField="aosiscrmeth"></def:ValueSetLabel></td>
            <td>
            </td>
        </tr>
    </table>
    <asp:panel id="mainPanel" Runat="server">
    <br />
    <table>
        <tr>
            <td style="width: 139px">
<def:datafieldcontrol runat="server" id="AOSI01_pr1" DatabaseField="AOSI01_pr1"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px " FieldTextBoxWidth="40px"></def:datafieldcontrol>
            </td>
            <td rowspan="3" style="width: 200px" valign="middle">
<def:ValueSetLabel ID="ValueSetLabel_AOSI01_pr1" runat="server"  DatabaseField="AOSI01_pr1"></def:ValueSetLabel></td>
        </tr>
        <tr>
            <td style="width: 139px">
<def:datafieldcontrol runat="server" id="AOSI01_pr2" DatabaseField="AOSI01_pr2"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px " FieldTextBoxWidth="40px"></def:datafieldcontrol>
            </td>
        </tr>
        <tr>
            <td style="width: 139px">
<def:datafieldcontrol runat="server" id="AOSI01_pr3" DatabaseField="AOSI01_pr3"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px " FieldTextBoxWidth="40px"></def:datafieldcontrol>
            </td>
        </tr>
        <tr>
            <td style="width: 139px">
<def:datafieldcontrol runat="server" id="AOSI01" DatabaseField="AOSI01"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px " FieldTextBoxWidth="40px"></def:datafieldcontrol>
            </td>
            <td rowspan="1" style="width: 200px" style="vertical-align:top">
<def:datafieldcontrol runat="server" id="AOSI01calc" DatabaseField="AOSI01calc"  IsEntryField="false" IsReadOnly="true" IsDoubleEntryField="false"  FieldLabelWidth="300px " FieldTextBoxWidth="40px"></def:datafieldcontrol>
            </td>
        </tr>
    </table>
    &nbsp;&nbsp;<br />
    <table>
        <tr>
            <td>
<def:datafieldcontrol runat="server" id="AOSI02_pr1" DatabaseField="AOSI02_pr1"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px " FieldTextBoxWidth="40px"></def:datafieldcontrol>
            </td>
            <td rowspan="3" style="width: 200px" valign="middle">
<def:ValueSetLabel ID="ValueSetLabel_AOSI02_pr1" runat="server"  DatabaseField="AOSI02_pr1"></def:ValueSetLabel></td>
        </tr>
        <tr>
            <td>
<def:datafieldcontrol runat="server" id="AOSI02_pr2" DatabaseField="AOSI02_pr2"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px " FieldTextBoxWidth="40px"></def:datafieldcontrol>
            </td>
        </tr>
        <tr>
            <td>
<def:datafieldcontrol runat="server" id="AOSI02_pr3" DatabaseField="AOSI02_pr3"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px " FieldTextBoxWidth="40px"></def:datafieldcontrol>
            </td>
        </tr>
        <tr>
            <td>
<def:datafieldcontrol runat="server" id="AOSI02" DatabaseField="AOSI02"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px " FieldTextBoxWidth="40px"></def:datafieldcontrol>
            </td>
            <td rowspan="1" style="width: 200px" style="vertical-align:top">
<def:datafieldcontrol runat="server" id="AOSI02calc" DatabaseField="AOSI02calc"  IsEntryField="false" IsReadOnly="true" IsDoubleEntryField="false"  FieldLabelWidth="300px " FieldTextBoxWidth="40px"></def:datafieldcontrol>
            </td>
        </tr>
    </table>
    &nbsp;&nbsp;
    <br />
    <br />
    <table>
        <tr>
            <td>
<def:datafieldcontrol runat="server" id="AOSI03_pr1tr1" DatabaseField="AOSI03_pr1tr1"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px " FieldTextBoxWidth="40px"></def:datafieldcontrol>
            </td>
            <td rowspan="6" style="width: 200px" valign="middle">
<def:ValueSetLabel ID="ValueSetLabel_AOSI03_pr1tr1" runat="server"  DatabaseField="AOSI03_pr1tr1"></def:ValueSetLabel></td>
        </tr>
        <tr>
            <td>
<def:datafieldcontrol runat="server" id="AOSI03_pr1tr2" DatabaseField="AOSI03_pr1tr2"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px " FieldTextBoxWidth="40px"></def:datafieldcontrol>
            </td>
        </tr>
        <tr>
            <td>
<def:datafieldcontrol runat="server" id="AOSI03_pr2tr1" DatabaseField="AOSI03_pr2tr1"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px " FieldTextBoxWidth="40px"></def:datafieldcontrol>
            </td>
        </tr>
        <tr>
            <td>
<def:datafieldcontrol runat="server" id="AOSI03_pr2tr2" DatabaseField="AOSI03_pr2tr2"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px " FieldTextBoxWidth="40px"></def:datafieldcontrol>
            </td>
        </tr>
        <tr>
            <td>
<def:datafieldcontrol runat="server" id="AOSI03_pr3tr1" DatabaseField="AOSI03_pr3tr1"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px " FieldTextBoxWidth="40px"></def:datafieldcontrol>
            </td>
        </tr>
        <tr>
            <td>
<def:datafieldcontrol runat="server" id="AOSI03_pr3tr2" DatabaseField="AOSI03_pr3tr2"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px " FieldTextBoxWidth="40px"></def:datafieldcontrol>
            </td>
        </tr>
        <tr>
            <td>
<def:datafieldcontrol runat="server" id="AOSI03" DatabaseField="AOSI03"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
            </td>
            <td rowspan="1" style="width: 200px" style="vertical-align:top">
<def:datafieldcontrol runat="server" id="AOSI03calc" DatabaseField="AOSI03calc"  IsEntryField="false" IsReadOnly="true" IsDoubleEntryField="false"  FieldLabelWidth="250px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
            </td>
        </tr>
    </table>
    &nbsp;&nbsp;<br />
    <table cellpadding="4">
        <tr>
            <td style="vertical-align:top">
<def:datafieldcontrol runat="server" id="AOSI04" DatabaseField="AOSI04"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px " FieldTextBoxWidth="40px"></def:datafieldcontrol>
            </td>
            <td valign="middle">
<def:ValueSetLabel ID="ValueSetLabel_AOSI04" runat="server"  DatabaseField="AOSI04"></def:ValueSetLabel></td>
        </tr>
        <tr>
            <td style="vertical-align:top">
<def:datafieldcontrol runat="server" id="AOSI05" DatabaseField="AOSI05"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px " FieldTextBoxWidth="40px"></def:datafieldcontrol>
            </td>
            <td valign="middle">
<def:ValueSetLabel ID="ValueSetLabel_AOSI05" runat="server"  DatabaseField="AOSI05"></def:ValueSetLabel></td>
        </tr>
    </table>
    <br />
    <table style="width: 400px">
        <tr>
            <td style="width: 385px">
<def:ValueSetLabel ID="ValueSetLabel_AOSI06_act1" runat="server"  DatabaseField="AOSI06_act1" Width="300px"></def:ValueSetLabel></td>
            <td align="left" colspan="1" style="width: 9120px">
            </td>
            <td align="left" colspan="3">
<def:ValueSetLabel ID="ValueSetLabel_AOSI06_act1_att1" runat="server"  DatabaseField="AOSI06_act1_att1"></def:ValueSetLabel></td>
        </tr>
        <tr>
            <td style="width: 385px">
<def:datafieldcontrol runat="server" id="AOSI06_act1" DatabaseField="AOSI06_act1"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="150px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
            </td>
            <td style="width: 9120px">
            </td>
            <td style="width: 228px">
<def:datafieldcontrol runat="server" id="AOSI06_act1_att1" DatabaseField="AOSI06_act1_att1"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="100px" FieldTextBoxWidth="40px" ShowFieldLabel="False"></def:datafieldcontrol>
            </td>
            <td style="width: 300px">
<def:datafieldcontrol runat="server" id="AOSI06_act1_att2" DatabaseField="AOSI06_act1_att2"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="100px" FieldTextBoxWidth="40px" ShowFieldLabel="False"></def:datafieldcontrol>
            </td>
            <td style="width: 300px">
<def:datafieldcontrol runat="server" id="AOSI06_act1_att3" DatabaseField="AOSI06_act1_att3"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="100px" FieldTextBoxWidth="40px" ShowFieldLabel="False"></def:datafieldcontrol>
            </td>
        </tr>
        <tr>
            <td style="width: 385px">
<def:datafieldcontrol runat="server" id="AOSI06_act2" DatabaseField="AOSI06_act2"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="150px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
            </td>
            <td style="width: 9120px">
            </td>
            <td style="width: 228px">
<def:datafieldcontrol runat="server" id="AOSI06_act2_att1" DatabaseField="AOSI06_act2_att1"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px " FieldTextBoxWidth="40px" ShowFieldLabel="False"></def:datafieldcontrol>
            </td>
            <td style="width: 300px">
<def:datafieldcontrol runat="server" id="AOSI06_act2_att2" DatabaseField="AOSI06_act2_att2"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px " FieldTextBoxWidth="40px" ShowFieldLabel="False"></def:datafieldcontrol>
            </td>
            <td style="width: 300px">
<def:datafieldcontrol runat="server" id="AOSI06_act2_att3" DatabaseField="AOSI06_act2_att3"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px " FieldTextBoxWidth="40px" ShowFieldLabel="False"></def:datafieldcontrol>
            </td>
        </tr>
        <tr>
            <td style="width: 385px; height: 21px">
<def:datafieldcontrol runat="server" id="AOSI06_act3" DatabaseField="AOSI06_act3"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="150px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
            </td>
            <td style="width: 9120px; height: 21px">
            </td>
            <td style="width: 228px; height: 21px">
<def:datafieldcontrol runat="server" id="AOSI06_act3_att1" DatabaseField="AOSI06_act3_att1"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px " FieldTextBoxWidth="40px" ShowFieldLabel="False"></def:datafieldcontrol>
            </td>
            <td style="width: 300px; height: 21px">
<def:datafieldcontrol runat="server" id="AOSI06_act3_att2" DatabaseField="AOSI06_act3_att2"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px " FieldTextBoxWidth="40px" ShowFieldLabel="False"></def:datafieldcontrol>
            </td>
            <td style="width: 300px; height: 21px">
<def:datafieldcontrol runat="server" id="AOSI06_act3_att3" DatabaseField="AOSI06_act3_att3"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px " FieldTextBoxWidth="40px" ShowFieldLabel="False"></def:datafieldcontrol>
            </td>
        </tr>
    </table>
    <table>
        <tr>
            <td>
<def:datafieldcontrol runat="server" id="AOSI06" DatabaseField="AOSI06"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
            </td>
            <td style="width: 263px">
<def:datafieldcontrol runat="server" id="AOSI06calc" DatabaseField="AOSI06calc"  IsEntryField="false" IsReadOnly="true" IsDoubleEntryField="false"  FieldLabelWidth="200px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
            </td>
        </tr>
    </table>
    &nbsp;
    <br />
    <table cellpadding="4">
        <tr>
            <td style="vertical-align:top">
<def:datafieldcontrol runat="server" id="AOSI07" DatabaseField="AOSI07"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px " FieldTextBoxWidth="40px"></def:datafieldcontrol>
            </td>
            <td style="width: 250px" valign="middle">
<def:ValueSetLabel ID="ValueSetLabel_AOSI07" runat="server"  DatabaseField="AOSI07"></def:ValueSetLabel></td>
        </tr>
        <tr>
            <td style="vertical-align:top">
<def:datafieldcontrol runat="server" id="AOSI08" DatabaseField="AOSI08"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px " FieldTextBoxWidth="40px"></def:datafieldcontrol>
            </td>
            <td style="width: 250px" valign="middle">
<def:ValueSetLabel ID="ValueSetLabel_AOSI08" runat="server"  DatabaseField="AOSI08"></def:ValueSetLabel></td>
        </tr>
        <tr>
            <td style="vertical-align:top">
<def:datafieldcontrol runat="server" id="AOSI09" DatabaseField="AOSI09"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px " FieldTextBoxWidth="40px"></def:datafieldcontrol>
            </td>
            <td style="width: 250px" valign="middle">
<def:ValueSetLabel ID="ValueSetLabel_AOSI09" runat="server"  DatabaseField="AOSI09"></def:ValueSetLabel></td>
        </tr>
        <tr>
            <td style="vertical-align:top">
<def:datafieldcontrol runat="server" id="AOSI10" DatabaseField="AOSI10"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px " FieldTextBoxWidth="40px"></def:datafieldcontrol>
            </td>
            <td style="width: 250px" valign="middle">
<def:ValueSetLabel ID="ValueSetLabel_AOSI10" runat="server"  DatabaseField="AOSI10"></def:ValueSetLabel></td>
        </tr>
        <tr>
            <td style="vertical-align:top">
<def:datafieldcontrol runat="server" id="AOSI11" DatabaseField="AOSI11"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px " FieldTextBoxWidth="40px"></def:datafieldcontrol>
            </td>
            <td style="width: 250px" valign="middle">
<def:ValueSetLabel ID="ValueSetLabel_AOSI11" runat="server"  DatabaseField="AOSI11"></def:ValueSetLabel></td>
        </tr>
        <tr>
            <td style="vertical-align:top">
<def:datafieldcontrol runat="server" id="AOSI12" DatabaseField="AOSI12"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px " FieldTextBoxWidth="40px"></def:datafieldcontrol>
            </td>
            <td style="width: 250px" style="vertical-align:top">
            </td>
        </tr>
        <tr>
            <td style="vertical-align:top">
<def:datafieldcontrol runat="server" id="AOSI13" DatabaseField="AOSI13"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px " FieldTextBoxWidth="40px"></def:datafieldcontrol>
            </td>
            <td style="width: 250px" style="vertical-align:top">
            </td>
        </tr>
        <tr>
            <td style="vertical-align:top">
<def:datafieldcontrol runat="server" id="AOSI14" DatabaseField="AOSI14"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px " FieldTextBoxWidth="40px"></def:datafieldcontrol>
            </td>
            <td style="width: 250px" style="vertical-align:top">
<def:ValueSetLabel ID="ValueSetLabel_AOSI14" runat="server"  DatabaseField="AOSI14"></def:ValueSetLabel></td>
        </tr>
        <tr>
            <td style="vertical-align:top">
<def:datafieldcontrol runat="server" id="AOSI15" DatabaseField="AOSI15"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px " FieldTextBoxWidth="40px"></def:datafieldcontrol>
            </td>
            <td style="width: 250px" style="vertical-align:top">
<def:ValueSetLabel ID="ValueSetLabel_AOSI15" runat="server"  DatabaseField="AOSI15"></def:ValueSetLabel></td>
        </tr>
        <tr>
            <td style="vertical-align:top">
<def:datafieldcontrol runat="server" id="AOSI16" DatabaseField="AOSI16"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px " FieldTextBoxWidth="40px"></def:datafieldcontrol>
            </td>
            <td style="width: 250px" style="vertical-align:top">
<def:ValueSetLabel ID="ValueSetLabel_AOSI16" runat="server"  DatabaseField="AOSI16"></def:ValueSetLabel></td>
        </tr>
        <tr>
            <td style="vertical-align:top">
<def:datafieldcontrol runat="server" id="AOSI17" DatabaseField="AOSI17"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px " FieldTextBoxWidth="40px"></def:datafieldcontrol>
            </td>
            <td style="width: 250px" style="vertical-align:top">
<def:ValueSetLabel ID="ValueSetLabel_AOSI17" runat="server"  DatabaseField="AOSI17"></def:ValueSetLabel></td>
        </tr>
        <tr>
            <td style="vertical-align:top">
<def:datafieldcontrol runat="server" id="AOSI18" DatabaseField="AOSI18"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px " FieldTextBoxWidth="40px"></def:datafieldcontrol>
            </td>
            <td style="width: 250px" style="vertical-align:top">
<def:ValueSetLabel ID="ValueSetLabel_AOSI18" runat="server"  DatabaseField="AOSI18"></def:ValueSetLabel></td>
        </tr>
        <tr>
            <td style="vertical-align:top">
            </td>
            <td style="width: 250px" style="vertical-align:top">
            </td>
        </tr>
        <tr>
            <td style="vertical-align:top">
<def:datafieldcontrol runat="server" id="AOSITot" DatabaseField="AOSITot"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px " FieldTextBoxWidth="40px"></def:datafieldcontrol>
            </td>
            <td style="font-weight: bold" style="vertical-align:top">
<def:datafieldcontrol runat="server" id="AOSITot_calc" DatabaseField="AOSITot_calc"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px " FieldTextBoxWidth="40px"></def:datafieldcontrol>
            </td>
        </tr>
        <tr>
            <td style="vertical-align:top">
<def:datafieldcontrol runat="server" id="AOSIMark" DatabaseField="AOSIMark"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px " FieldTextBoxWidth="40px"></def:datafieldcontrol>
            </td>
            <td style="font-weight: bold" style="vertical-align:top">
<def:datafieldcontrol runat="server" id="AOSIMark_calc" DatabaseField="AOSIMark_calc"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px " FieldTextBoxWidth="40px"></def:datafieldcontrol>
            </td>
        </tr>
    </table>
    <br />
<br />
    &nbsp; &nbsp;<br />
    <br />
    <table cellpadding="4">
        <tr>
            <td style="vertical-align:top">
<def:datafieldcontrol runat="server" id="AOSI19" DatabaseField="AOSI19"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px " FieldTextBoxWidth="40px"></def:datafieldcontrol>
            </td>
            <td style="width: 250px" style="vertical-align:top">
<def:ValueSetLabel ID="ValueSetLabel_AOSI19" runat="server"  DatabaseField="AOSI19"></def:ValueSetLabel></td>
        </tr>
        <tr>
            <td style="vertical-align:top">
<def:datafieldcontrol runat="server" id="AOSI20" DatabaseField="AOSI20"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px " FieldTextBoxWidth="40px"></def:datafieldcontrol>
            </td>
            <td style="width: 250px; height: 86px" style="vertical-align:top">
<def:ValueSetLabel ID="ValueSetLabel_AOSI20" runat="server"  DatabaseField="AOSI20"></def:ValueSetLabel></td>
        </tr>
        <tr>
            <td style="vertical-align:top">
<def:datafieldcontrol runat="server" id="AOSI21" DatabaseField="AOSI21"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px " FieldTextBoxWidth="40px"></def:datafieldcontrol>
            </td>
            <td style="width: 250px" style="vertical-align:top">
<def:ValueSetLabel ID="ValueSetLabel_AOSI21" runat="server"  DatabaseField="AOSI21"></def:ValueSetLabel></td>
        </tr>
    </table>
<br />
    &nbsp; &nbsp;
<br />
<def:datafieldcontrol runat="server" id="AOSIScrMsg" DatabaseField="AOSIScrMsg"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="180px" FieldTextBoxWidth="300px" FieldTextBoxHeight="100px" FieldTextBoxTextMode="SingleLine"></def:datafieldcontrol>
    <br />
    </asp:panel>
    <br />
<def:datafieldcontrol runat="server" id="created" DatabaseField="created"  IsReadOnly="true" RenderReadOnlyAsDiv="true"   FieldLabelWidth="300px "></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="createdBy" DatabaseField="createdBy"  IsReadOnly="true" RenderReadOnlyAsDiv="true"   FieldLabelWidth="300px "></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="updated" DatabaseField="updated"  IsReadOnly="true" RenderReadOnlyAsDiv="true"   FieldLabelWidth="300px "></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="updatedBy" DatabaseField="updatedBy"  IsReadOnly="true" RenderReadOnlyAsDiv="true"   FieldLabelWidth="300px "></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="scored" DatabaseField="scored"  IsReadOnly="true" RenderReadOnlyAsDiv="true"   FieldLabelWidth="300px "></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="scoredBy" DatabaseField="scoredBy"  IsReadOnly="true" RenderReadOnlyAsDiv="true"   FieldLabelWidth="300px "></def:datafieldcontrol>
</asp:Content>
