<%@ Register TagPrefix="def" Namespace="DataEntryFramework3" %> 
<%@ Page language="c#" MasterPageFile="~/UWAC.master"  Title="UW_PTP_scr Data Entry" %>


<asp:Content ID="Content1" ContentPlaceHolderID="oBodyPlaceHolder" runat="server">
<def:dataentrycontroller id="DataEntryController1" runat="server" DatabaseTable="ALL_DBscreen_PTP_UW"  >
</def:dataentrycontroller>

<br />
<b><def:datafieldcontrol runat="server" id="id" DatabaseField="id"  IsInsertField="true"   FieldLabelWidth="50px "></def:datafieldcontrol></b>
<br />

<b style="font-size: 10pt">
Use the following codes for data entry: No = <span style="font-size: 14pt">
    N</span>, Yes = <span style="font-size: 14pt">Y</span>, Missing/Unknown = <span style="font-size: 14pt">U</span>
</b>
<br />
    <br />
    <table style="width: 158px">

        <tr>
            <td>
<def:datafieldcontrol runat="server" id="dba1" DatabaseField="dba1"  IsEntryField="true" IsDoubleEntryField="true"   FieldLabelWidth="300px " FieldTextBoxWidth="30px" ></def:datafieldcontrol>
            </td>
            <td style="width: 2059px">
            </td>
            <td style="width: 1529px">
            </td>
        </tr>
        <tr>
            <td>
<def:datafieldcontrol runat="server" id="dba2" DatabaseField="dba2"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px " FieldTextBoxWidth="30px" ></def:datafieldcontrol>
            </td>
            <td style="width: 2059px">
            </td>
            <td style="width: 1529px">
            </td>
        </tr>
        <tr>
            <td>
<def:datafieldcontrol runat="server" id="dba3" DatabaseField="dba3"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px " FieldTextBoxWidth="30px" ></def:datafieldcontrol>
            </td>
            <td style="width: 2059px">
            </td>
            <td style="width: 1529px">
            </td>
        </tr>
        <tr>
            <td>
<def:datafieldcontrol runat="server" id="dba4" DatabaseField="dba4"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px " FieldTextBoxWidth="30px" ></def:datafieldcontrol>
            </td>
            <td style="width: 2059px">
            </td>
            <td style="width: 1529px">
<def:datafieldcontrol runat="server" id="dba4txt" DatabaseField="dba4txt"  IsEntryField="true" IsDoubleEntryField="true"    FieldLabelWidth="80px " FieldTextBoxWidth="250px" ></def:datafieldcontrol>
            </td>
        </tr>
        <tr>
            <td>
<def:datafieldcontrol runat="server" id="dba5" DatabaseField="dba5"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px " FieldTextBoxWidth="30px" ></def:datafieldcontrol>
            </td>
            <td style="width: 2059px">
            </td>
            <td style="width: 1529px">
            </td>
        </tr>
        <tr>
            <td>
<def:datafieldcontrol runat="server" id="dba6" DatabaseField="dba6"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px " FieldTextBoxWidth="30px" ></def:datafieldcontrol>
            </td>
            <td style="width: 2059px">
            </td>
            <td style="width: 1529px">
<def:datafieldcontrol runat="server" id="dba6txt" DatabaseField="dba6txt"  IsEntryField="true" IsDoubleEntryField="true"    FieldLabelWidth="80px " FieldTextBoxWidth="250px" ></def:datafieldcontrol>
            </td>
        </tr>
        <tr>
            <td>
<def:datafieldcontrol runat="server" id="dba7" DatabaseField="dba7"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px " FieldTextBoxWidth="30px" ></def:datafieldcontrol>
            </td>
            <td style="width: 2059px">
            </td>
            <td style="width: 1529px">
<def:datafieldcontrol runat="server" id="dba7txt" DatabaseField="dba7txt"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="80px " FieldTextBoxWidth="250px" ></def:datafieldcontrol>
            </td>
        </tr>
        <tr>
            <td>
            </td>
            <td style="width: 2059px">
            </td>
            <td style="width: 1529px">
            </td>
        </tr>
    </table>
    <br />
    <strong>Exclusionary Criteria:</strong><br />
    <table>
        <tr>
            <td style="width: 106px">

<def:datafieldcontrol runat="server" id="dbexcl1" DatabaseField="dbexcl1"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px " FieldTextBoxWidth="30px" ></def:datafieldcontrol>
            </td>
            <td style="width: 80px">
            </td>
            <td style="width: 125px">
<def:datafieldcontrol runat="server" id="dbexcl1txt" DatabaseField="dbexcl1txt"  IsEntryField="true" IsDoubleEntryField="true"   FieldLabelWidth="80px " FieldTextBoxWidth="250px" ></def:datafieldcontrol>
            </td>
        </tr>
        <tr>
            <td style="width: 106px">
<def:datafieldcontrol runat="server" id="dbexcl1a" DatabaseField="dbexcl1a"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px " FieldTextBoxWidth="30px" ></def:datafieldcontrol>
            </td>
            <td style="width: 80px">
            </td>
            <td style="width: 125px">
<def:datafieldcontrol runat="server" id="dbexcl1atxt" DatabaseField="dbexcl1atxt"  IsEntryField="true" IsDoubleEntryField="true"    FieldLabelWidth="80px " FieldTextBoxWidth="250px" ></def:datafieldcontrol>
            </td>
        </tr>
        <tr>
            <td style="width: 106px">
<def:datafieldcontrol runat="server" id="dbexcl2" DatabaseField="dbexcl2"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px " FieldTextBoxWidth="30px" ></def:datafieldcontrol>
            </td>
            <td style="width: 80px">
            </td>
            <td style="width: 125px">
<def:datafieldcontrol runat="server" id="dbexcl2txt" DatabaseField="dbexcl2txt"  IsEntryField="true" IsDoubleEntryField="true"    FieldLabelWidth="80px " FieldTextBoxWidth="250px" ></def:datafieldcontrol>
            </td>
        </tr>
        <tr>
            <td style="width: 106px">
<def:datafieldcontrol runat="server" id="dbexcl3" DatabaseField="dbexcl3"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px " FieldTextBoxWidth="30px" ></def:datafieldcontrol>
            </td>
            <td style="width: 80px">
            </td>
            <td style="width: 125px">
<def:datafieldcontrol runat="server" id="dbexcl3txt" DatabaseField="dbexcl3txt"  IsEntryField="true" IsDoubleEntryField="true"   FieldLabelWidth="80px " FieldTextBoxWidth="250px" ></def:datafieldcontrol>
            </td>
        </tr>
        <tr>
            <td style="width: 106px">
<def:datafieldcontrol runat="server" id="dbexcl4" DatabaseField="dbexcl4"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px " FieldTextBoxWidth="30px" ></def:datafieldcontrol>
            </td>
            <td style="width: 80px">
            </td>
            <td style="width: 125px">
<def:datafieldcontrol runat="server" id="dbexcl4txt" DatabaseField="dbexcl4txt"  IsEntryField="true" IsDoubleEntryField="true"    FieldLabelWidth="80px " FieldTextBoxWidth="250px" ></def:datafieldcontrol>
            </td>
        </tr>
        <tr>
            <td style="width: 106px">
<def:datafieldcontrol runat="server" id="dbexcl5" DatabaseField="dbexcl5"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px " FieldTextBoxWidth="30px" ></def:datafieldcontrol>
            </td>
            <td style="width: 80px">
            </td>
            <td style="width: 125px">
<def:datafieldcontrol runat="server" id="dbexcl5txt" DatabaseField="dbexcl5txt"  IsEntryField="true" IsDoubleEntryField="true"    FieldLabelWidth="80px " FieldTextBoxWidth="250px" ></def:datafieldcontrol>
            </td>
        </tr>
        <tr>
            <td style="width: 106px">
<def:datafieldcontrol runat="server" id="dbexcl6" DatabaseField="dbexcl6"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px " FieldTextBoxWidth="30px" ></def:datafieldcontrol>
            </td>
            <td style="width: 80px">
            </td>
            <td style="width: 125px">
<def:datafieldcontrol runat="server" id="dbexcl6txt" DatabaseField="dbexcl6txt"  IsEntryField="true" IsDoubleEntryField="true"    FieldLabelWidth="80px " FieldTextBoxWidth="250px" ></def:datafieldcontrol>
            </td>
        </tr>
        <tr>
            <td style="width: 106px">
<def:datafieldcontrol runat="server" id="dbexcl7" DatabaseField="dbexcl7"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px " FieldTextBoxWidth="30px" ></def:datafieldcontrol>
            </td>
            <td style="width: 80px">
            </td>
            <td style="width: 125px">
<def:datafieldcontrol runat="server" id="dbexcl7txt" DatabaseField="dbexcl7txt"  IsEntryField="true" IsDoubleEntryField="true"    FieldLabelWidth="80px " FieldTextBoxWidth="250px" ></def:datafieldcontrol>
            </td>
        </tr>
        <tr>
            <td style="width: 106px">
            </td>
            <td style="width: 80px">
            </td>
            <td style="width: 125px">
            </td>
        </tr>
    </table>
    <br />
    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;<br />
<b><br /></b>
    <table >
        <tr>
            <td  style="width: 150px">
            </td>
            <td >
                Parents</td>
            <td >
                Others</td>
            <td >
                Comments</td>
        </tr>
        <tr>
            <td>
                Substance Abuse</td>
            <td >
<def:datafieldcontrol runat="server" id="dbparsubab" DatabaseField="dbparsubab"  IsEntryField="true" IsDoubleEntryField="true"  ShowFieldLabel="false" FieldTextBoxWidth = "30px"></def:datafieldcontrol>
            </td>
            <td >
<def:datafieldcontrol runat="server" id="dbothsubab" DatabaseField="dbothsubab"  IsEntryField="true" IsDoubleEntryField="true"  ShowFieldLabel="false"  FieldTextBoxWidth = "30px"></def:datafieldcontrol>
            </td>
            <td >
<def:datafieldcontrol runat="server" id="dbsubabtxt" DatabaseField="dbsubabtxt"  IsEntryField="true" IsDoubleEntryField="true"  ShowFieldLabel="false"  FieldTextBoxWidth = "300px"></def:datafieldcontrol>
            </td>
        </tr>
        <tr>
            <td>
                Bipolar Disorder</td>
            <td >
<def:datafieldcontrol runat="server" id="dbparbipo" DatabaseField="dbparbipo"  IsEntryField="true" IsDoubleEntryField="true"  ShowFieldLabel="false"  FieldTextBoxWidth = "30px"></def:datafieldcontrol>
            </td>
            <td >
<def:datafieldcontrol runat="server" id="dbothbipo" DatabaseField="dbothbipo"  IsEntryField="true" IsDoubleEntryField="true"  ShowFieldLabel="false"  FieldTextBoxWidth = "30px"></def:datafieldcontrol>
            </td>
            <td >
<def:datafieldcontrol runat="server" id="dbbipotxt" DatabaseField="dbbipotxt"  IsEntryField="true" IsDoubleEntryField="true"  ShowFieldLabel="false"  FieldTextBoxWidth = "300px"></def:datafieldcontrol>
            </td>
        </tr>
        <tr>
            <td>
                Psychosis</td>
            <td >
<def:datafieldcontrol runat="server" id="dbparpsych" DatabaseField="dbparpsych"  IsEntryField="true" IsDoubleEntryField="true"  ShowFieldLabel="false"  FieldTextBoxWidth = "30px"></def:datafieldcontrol>
            </td>
            <td >
<def:datafieldcontrol runat="server" id="dbothpsych" DatabaseField="dbothpsych"  IsEntryField="true" IsDoubleEntryField="true"  ShowFieldLabel="false"  FieldTextBoxWidth = "30px"></def:datafieldcontrol>
            </td>
            <td>
<def:datafieldcontrol runat="server" id="dbpsychtxt" DatabaseField="dbpsychtxt"  IsEntryField="true" IsDoubleEntryField="true"  ShowFieldLabel="false" FieldTextBoxWidth = "300px"></def:datafieldcontrol>
            </td>
        </tr>
    </table>
    <br />
    <table>
        <tr>
            <td>
<def:datafieldcontrol runat="server" id="dbreinfood" DatabaseField="dbreinfood"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="160px " FieldTextBoxWidth = "30px"></def:datafieldcontrol>
            </td>
            <td>
<def:datafieldcontrol runat="server" id="dbreinfoodtxt" DatabaseField="dbreinfoodtxt"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="160px " FieldTextBoxWidth = "300px"></def:datafieldcontrol>
            </td>
        </tr>
        <tr>
            <td>
<def:datafieldcontrol runat="server" id="dballerg" DatabaseField="dballerg"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="160px " FieldTextBoxWidth = "30px"></def:datafieldcontrol>
            </td>
            <td>
<def:datafieldcontrol runat="server" id="dballergtxt" DatabaseField="dballergtxt"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="160px " FieldTextBoxWidth = "300px"></def:datafieldcontrol>
            </td>
        </tr>
    </table>
    <br />
<def:datafieldcontrol runat="server" id="dbworknotes" DatabaseField="dbworknotes"  IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxMaxLength="1000"  FieldLabelWidth="240px " FieldTextBoxWidth = "300px" FieldTextBoxHeight = "100px" FieldTextBoxTextMode="MultiLine"></def:datafieldcontrol>


<br />
    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;<br />
    <br />
    <br />
<def:datafieldcontrol runat="server" id="created" DatabaseField="created"  IsReadOnly="true" RenderReadOnlyAsDiv="true"   FieldLabelWidth="300px "></def:datafieldcontrol>
    <br />
<def:datafieldcontrol runat="server" id="createdBy" DatabaseField="createdBy"  IsReadOnly="true" RenderReadOnlyAsDiv="true"   FieldLabelWidth="300px "></def:datafieldcontrol>
    <br />
<def:datafieldcontrol runat="server" id="updated" DatabaseField="updated"  IsReadOnly="true" RenderReadOnlyAsDiv="true"   FieldLabelWidth="300px "></def:datafieldcontrol>
    <br />
<def:datafieldcontrol runat="server" id="updatedBy" DatabaseField="updatedBy"  IsReadOnly="true" RenderReadOnlyAsDiv="true"   FieldLabelWidth="300px "></def:datafieldcontrol>
    <br />
<def:datafieldcontrol runat="server" id="scored" DatabaseField="scored"  IsReadOnly="true" RenderReadOnlyAsDiv="true"   FieldLabelWidth="300px "></def:datafieldcontrol>
    <br />
<def:datafieldcontrol runat="server" id="scoredBy" DatabaseField="scoredBy"  IsReadOnly="true" RenderReadOnlyAsDiv="true"   FieldLabelWidth="300px "></def:datafieldcontrol>
</asp:Content>
