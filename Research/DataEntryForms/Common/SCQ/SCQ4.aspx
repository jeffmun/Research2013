<%@ Register TagPrefix="def" Namespace="DataEntryFramework3" %> 
<%@ Page Language="C#" Debug="true" MasterPageFile="~/UWAC.master"  Title="SCQ Data Entry DEv4" %>
<asp:Content ID="Content1" ContentPlaceHolderID="oBodyPlaceHolder" runat="server">
<def:dataentrycontroller id="DataEntryController1" runat="server" DatabaseTable="ALL_SCQ" >
</def:dataentrycontroller>
<def:datafieldcontrol runat="server" id="id" DatabaseField="id"  IsInsertField="true"  FieldLabelWidth="175px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="indexnum" DatabaseField="indexnum"  IsInsertField="true"  FieldLabelWidth="175px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="Clinician" DatabaseField="SCQCI"  IsInsertField="true" FieldLabelWidth="175px" FieldTextBoxWidth="175px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="DateAdministered" DatabaseField="SCQDate"  IsInsertField="true" FieldLabelWidth="175px" FieldTextBoxWidth="100px"></def:datafieldcontrol>
<br />
<def:ValueSetLabel ID="ValueSetLabel_SCQType" runat="server"  DatabaseField="SCQType"></def:ValueSetLabel>
<def:datafieldcontrol runat="server" id="SCQType" DatabaseField="SCQType"  IsInsertField="true" FieldLabelWidth="175px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<br />
<asp:panel id="mainPanel" runat="server">

<br/>
<table border="1" cellpadding="0" cellspacing="0" style="color: #0000FF">
    <tr><td><b><u>SCQ Scores</u></b></td>
    </tr>
    
    <tr>
        <td>

            <def:datafieldcontrol runat="server" id="SCQageym" DatabaseField="SCQageym"  IsEntryField="false" IsReadOnly="true" FieldLabelWidth="350px" FieldTextBoxWidth="30px"  RenderReadOnlyAsDiv="true"></def:datafieldcontrol>
            <def:datafieldcontrol runat="server" id="SCQagemos" DatabaseField="SCQagemos"  IsEntryField="false" IsReadOnly="true" FieldLabelWidth="350px" FieldTextBoxWidth="30px"  RenderReadOnlyAsDiv="true"></def:datafieldcontrol>
        <br/>
        Current
            <def:datafieldcontrol runat="server" id="SCQtotalcu" DatabaseField="SCQtotalcu"  IsEntryField="false" IsReadOnly="true" FieldLabelWidth="400px" FieldTextBoxWidth="30px"  RenderReadOnlyAsDiv="true"></def:datafieldcontrol>
            <def:datafieldcontrol runat="server" id="SCQcutoffcu" DatabaseField="SCQcutoffcu"  IsEntryField="false" IsReadOnly="true" FieldLabelWidth="400px" FieldTextBoxWidth="30px"  RenderReadOnlyAsDiv="true"></def:datafieldcontrol>
            <br/>
            <def:datafieldcontrol runat="server" id="SCQrsicu" DatabaseField="SCQrsicu"  IsEntryField="false" IsReadOnly="true" FieldLabelWidth="400px" FieldTextBoxWidth="30px"  RenderReadOnlyAsDiv="true"></def:datafieldcontrol>
            <def:datafieldcontrol runat="server" id="SCQcomcu" DatabaseField="SCQcomcu"  IsEntryField="false" IsReadOnly="true" FieldLabelWidth="400px" FieldTextBoxWidth="30px"  RenderReadOnlyAsDiv="true"></def:datafieldcontrol>
            <def:datafieldcontrol runat="server" id="SCQrrscu" DatabaseField="SCQrrscu"  IsEntryField="false" IsReadOnly="true" FieldLabelWidth= "400px" FieldTextBoxWidth="30px"  RenderReadOnlyAsDiv="true"></def:datafieldcontrol>
            <br/>
        <br/>
        Lifetime
            <def:datafieldcontrol runat="server" id="SCQtotalli" DatabaseField="SCQtotalli"  IsEntryField="false" IsReadOnly="true" FieldLabelWidth="400px" FieldTextBoxWidth="30px"  RenderReadOnlyAsDiv="true"></def:datafieldcontrol>
            <def:datafieldcontrol runat="server" id="SCQcutoffli" DatabaseField="SCQcutoffli"  IsEntryField="false" IsReadOnly="true" FieldLabelWidth="400px" FieldTextBoxWidth="30px"  RenderReadOnlyAsDiv="true"></def:datafieldcontrol>
            <br/>
            <def:datafieldcontrol runat="server" id="SCQrsili" DatabaseField="SCQrsili"  IsEntryField="false" IsReadOnly="true" FieldLabelWidth="400px" FieldTextBoxWidth="30px"  RenderReadOnlyAsDiv="true"></def:datafieldcontrol>
            <def:datafieldcontrol runat="server" id="SCQcomli" DatabaseField="SCQcomli"  IsEntryField="false" IsReadOnly="true" FieldLabelWidth="400px" FieldTextBoxWidth="30px"  RenderReadOnlyAsDiv="true"></def:datafieldcontrol>
            <def:datafieldcontrol runat="server" id="SCQrrsli" DatabaseField="SCQrrsli"  IsEntryField="false" IsReadOnly="true" FieldLabelWidth= "400px" FieldTextBoxWidth="30px"  RenderReadOnlyAsDiv="true"></def:datafieldcontrol>
            <br/>
            
            <def:datafieldcontrol runat="server" id="SCQscrmsg" DatabaseField="SCQscrmsg"  IsEntryField="false" IsReadOnly="true" FieldLabelWidth="400px" FieldTextBoxWidth="30px"   RenderReadOnlyAsDiv="true"></def:datafieldcontrol>

    </td>
    </tr>
    </table>
    
<br />
<br />

<table border="0" cellpadding="0" cellspacing="0">
    <tr>
        <td>
            <def:datafieldcontrol runat="server" id="SCQ01" DatabaseField="SCQ01"  IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="250px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
            <def:datafieldcontrol runat="server" id="SCQ02" DatabaseField="SCQ02"  IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="250px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
            <def:datafieldcontrol runat="server" id="SCQ03" DatabaseField="SCQ03"  IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="250px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
            <def:datafieldcontrol runat="server" id="SCQ04" DatabaseField="SCQ04"  IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="250px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
            <def:datafieldcontrol runat="server" id="SCQ05" DatabaseField="SCQ05"  IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="250px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
            <def:datafieldcontrol runat="server" id="SCQ06" DatabaseField="SCQ06"  IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="250px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
            <def:datafieldcontrol runat="server" id="SCQ07" DatabaseField="SCQ07"  IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="250px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
            <def:datafieldcontrol runat="server" id="SCQ08" DatabaseField="SCQ08"  IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="250px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
            <def:datafieldcontrol runat="server" id="SCQ09" DatabaseField="SCQ09"  IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="250px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
            <def:datafieldcontrol runat="server" id="SCQ10" DatabaseField="SCQ10"  IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="250px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
            <def:datafieldcontrol runat="server" id="SCQ11" DatabaseField="SCQ11"  IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="250px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
            <def:datafieldcontrol runat="server" id="SCQ12" DatabaseField="SCQ12"  IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="250px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
            <def:datafieldcontrol runat="server" id="SCQ13" DatabaseField="SCQ13"  IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="250px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
            <def:datafieldcontrol runat="server" id="SCQ14" DatabaseField="SCQ14"  IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="250px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
            <def:datafieldcontrol runat="server" id="SCQ15" DatabaseField="SCQ15"  IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="250px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
            <def:datafieldcontrol runat="server" id="SCQ16" DatabaseField="SCQ16"  IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="250px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
            <def:datafieldcontrol runat="server" id="SCQ17" DatabaseField="SCQ17"  IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="250px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
            <def:datafieldcontrol runat="server" id="SCQ18" DatabaseField="SCQ18"  IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="250px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
            <def:datafieldcontrol runat="server" id="SCQ19" DatabaseField="SCQ19"  IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="250px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
            <def:datafieldcontrol runat="server" id="SCQ20" DatabaseField="SCQ20"  IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="250px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
        </td>
        <td style="vertical-align:top" style="padding-left: 50px">
            <def:ValueSetLabel ID="ValueSetLabel_SCQ01a" runat="server"  DatabaseField="SCQ01"></def:ValueSetLabel>
        </td>
    </tr>
    <tr>
        <td>
            <def:datafieldcontrol runat="server" id="SCQ21" DatabaseField="SCQ21"  IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="250px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
            <def:datafieldcontrol runat="server" id="SCQ22" DatabaseField="SCQ22"  IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="250px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
            <def:datafieldcontrol runat="server" id="SCQ23" DatabaseField="SCQ23"  IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="250px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
            <def:datafieldcontrol runat="server" id="SCQ24" DatabaseField="SCQ24"  IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="250px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
            <def:datafieldcontrol runat="server" id="SCQ25" DatabaseField="SCQ25"  IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="250px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
            <def:datafieldcontrol runat="server" id="SCQ26" DatabaseField="SCQ26"  IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="250px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
            <def:datafieldcontrol runat="server" id="SCQ27" DatabaseField="SCQ27"  IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="250px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
            <def:datafieldcontrol runat="server" id="SCQ28" DatabaseField="SCQ28"  IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="250px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
            <def:datafieldcontrol runat="server" id="SCQ29" DatabaseField="SCQ29"  IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="250px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
            <def:datafieldcontrol runat="server" id="SCQ30" DatabaseField="SCQ30"  IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="250px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
            <def:datafieldcontrol runat="server" id="SCQ31" DatabaseField="SCQ31"  IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="250px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
            <def:datafieldcontrol runat="server" id="SCQ32" DatabaseField="SCQ32"  IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="250px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
            <def:datafieldcontrol runat="server" id="SCQ33" DatabaseField="SCQ33"  IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="250px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
            <def:datafieldcontrol runat="server" id="SCQ34" DatabaseField="SCQ34"  IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="250px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
            <def:datafieldcontrol runat="server" id="SCQ35" DatabaseField="SCQ35"  IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="250px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
            <def:datafieldcontrol runat="server" id="SCQ36" DatabaseField="SCQ36"  IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="250px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
            <def:datafieldcontrol runat="server" id="SCQ37" DatabaseField="SCQ37"  IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="250px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
            <def:datafieldcontrol runat="server" id="SCQ38" DatabaseField="SCQ38"  IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="250px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
            <def:datafieldcontrol runat="server" id="SCQ39" DatabaseField="SCQ39"  IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="250px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
            <def:datafieldcontrol runat="server" id="SCQ40" DatabaseField="SCQ40"  IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="250px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
        </td>
        <td style="vertical-align:top" style="padding-left: 50px">
            <def:ValueSetLabel ID="ValueSetLabel_SCQ01b" runat="server"  DatabaseField="SCQ01"></def:ValueSetLabel>
        </td>
    </tr>
</table>
<def:datafieldcontrol runat="server" id="SCQNotes" DatabaseField="SCQNotes"  IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="175px" FieldTextBoxWidth = "400px" FieldTextBoxHeight = "70px" FieldTextBoxTextMode="MultiLine"></def:datafieldcontrol>
</asp:panel>
<br />
<def:datafieldcontrol runat="server" id="created" DatabaseField="created"  IsReadOnly="true" RenderReadOnlyAsDiv="true"  FieldLabelWidth="250px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="createdBy" DatabaseField="createdBy"  IsReadOnly="true" RenderReadOnlyAsDiv="true"  FieldLabelWidth="250px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="updated" DatabaseField="updated"  IsReadOnly="true" RenderReadOnlyAsDiv="true"  FieldLabelWidth="250px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="updatedBy" DatabaseField="updatedBy"  IsReadOnly="true" RenderReadOnlyAsDiv="true"  FieldLabelWidth="250px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="scored" DatabaseField="scored"  IsReadOnly="true" RenderReadOnlyAsDiv="true"  FieldLabelWidth="250px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="scoredBy" DatabaseField="scoredBy"  IsReadOnly="true" RenderReadOnlyAsDiv="true"  FieldLabelWidth="250px"></def:datafieldcontrol>
</asp:Content>
