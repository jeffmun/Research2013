<%@ Register TagPrefix="def" Namespace="DataEntryFramework3" %> 
<%@ Page language="c#" MasterPageFile="~/UWAC.master"  Title="CHARGEMedH Data Entry" %>
<asp:Content ID="Content1" ContentPlaceHolderID="oBodyPlaceHolder" runat="server">
<def:dataentrycontroller id="DataEntryController1" runat="server" DatabaseTable="ALL_CHARGEMedHx" >
</def:dataentrycontroller>
<def:datafieldcontrol runat="server" id="id" DatabaseField="id"  IsInsertField="true" FieldLabelWidth="175px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="indexnum" DatabaseField="indexnum"  IsInsertField="true" FieldLabelWidth="175px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="Interviewer" DatabaseField="CMHIntv"  IsInsertField="true" FieldLabelWidth="175px" FieldTextBoxWidth="175px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="Respondant" DatabaseField="CMHResp"  IsInsertField="true" FieldLabelWidth="175px" FieldTextBoxWidth="175px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="DateAdministered" DatabaseField="CMH_interview_date"  IsInsertField="true" FieldLabelWidth="175px" FieldTextBoxWidth="100px"></def:datafieldcontrol>
<br />
<asp:panel id="mainPanel" runat="server">
<h3>Diagnostic History</h3>
<def:datafieldcontrol runat="server" id="CMH_diag_aofc" DatabaseField="CMH_diag_aofc"  IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="200px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="CMH_diag_fconcern" DatabaseField="CMH_diag_fconcern"  IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="200px" FieldTextBoxWidth = "400px" FieldTextBoxHeight = "60px" FieldTextBoxTextMode="MultiLine"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="CMH_diag_diagnosis" DatabaseField="CMH_diag_diagnosis"  IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="200px" FieldTextBoxWidth = "400px" FieldTextBoxHeight = "60px" FieldTextBoxTextMode="MultiLine"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="CMH_diag_ageatdiag" DatabaseField="CMH_diag_ageatdiag"  IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="200px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<table border="0" cellpadding="0" cellspacing="0">
    <tr>
        <td>
            <def:datafieldcontrol runat="server" id="CMH_diag_diagnosismadeby" DatabaseField="CMH_diag_diagnosismadeby"  IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="200px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
        </td>
        <td style="padding-left:20px;padding-top:5px;padding-bottom:5px">
            <def:ValueSetLabel ID="ValueSetLabel_CMH_diag_diagnosismadeby" runat="server"  DatabaseField="CMH_diag_diagnosismadeby"></def:ValueSetLabel>
        </td>
    </tr>
</table>
<def:datafieldcontrol runat="server" id="CMH_diag_diagname" DatabaseField="CMH_diag_diagname"  IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="200px" FieldTextBoxWidth = "400px" FieldTextBoxHeight = "60px" FieldTextBoxTextMode="MultiLine"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="CMH_diag_diaginstitute" DatabaseField="CMH_diag_diaginstitute"  IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="200px" FieldTextBoxWidth = "400px" FieldTextBoxHeight = "60px" FieldTextBoxTextMode="MultiLine"></def:datafieldcontrol>
<h3>Early Postnatal History</h3>
<table border="0" cellpadding="0" cellspacing="0">
    <tr>
        <td>
            <def:datafieldcontrol runat="server" id="CMH_postnatal_temp" DatabaseField="CMH_postnatal_temp"  IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="200px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
        </td>
        <td style="padding-left:20px;padding-top:5px;padding-bottom:5px">
            <def:ValueSetLabel ID="ValueSetLabel_CMH_postnatal_temp" runat="server"  DatabaseField="CMH_postnatal_temp"></def:ValueSetLabel>
        </td>
    </tr>
    <tr>
        <td>
            <def:datafieldcontrol runat="server" id="CMH_postnatal_eyecontact" DatabaseField="CMH_postnatal_eyecontact"  IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="200px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
        </td>
        <td style="padding-left:20px;padding-top:5px;padding-bottom:5px">
            <def:ValueSetLabel ID="ValueSetLabel_CMH_postnatal_eyecontact" runat="server"  DatabaseField="CMH_postnatal_eyecontact"></def:ValueSetLabel>
        </td>
    </tr>
    <tr>
        <td>
            <def:datafieldcontrol runat="server" id="CMH_postnatal_sleeppattern" DatabaseField="CMH_postnatal_sleeppattern"  IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="200px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
        </td>
        <td style="padding-left:20px;padding-top:5px;padding-bottom:5px">
            <def:ValueSetLabel ID="ValueSetLabel_CMH_postnatal_sleeppattern" runat="server"  DatabaseField="CMH_postnatal_sleeppattern"></def:ValueSetLabel>
        </td>
    </tr>
    <tr>
        <td>
            <def:datafieldcontrol runat="server" id="CMH_postnatal_feedbottle" DatabaseField="CMH_postnatal_feedbottle"  IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="200px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
        </td>
        <td style="padding-left:20px;padding-top:5px;padding-bottom:5px">
            <def:ValueSetLabel ID="ValueSetLabel_CMH_postnatal_feedbottle" runat="server"  DatabaseField="CMH_postnatal_feedbottle"></def:ValueSetLabel>
        </td>
    </tr>
</table>
<def:datafieldcontrol runat="server" id="CMH_postnatal_feedbottleform" DatabaseField="CMH_postnatal_feedbottleform"  IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="200px" FieldTextBoxWidth = "400px" FieldTextBoxHeight = "60px" FieldTextBoxTextMode="MultiLine"></def:datafieldcontrol>
<table border="0" cellpadding="0" cellspacing="0">
    <tr>
        <td>
            <def:datafieldcontrol runat="server" id="CMH_postnatal_feedbr" DatabaseField="CMH_postnatal_feedbr"  IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="200px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
        </td>
        <td style="padding-left:20px;padding-top:5px;padding-bottom:5px">
            <def:ValueSetLabel ID="ValueSetLabel_CMH_postnatal_feedbr" runat="server"  DatabaseField="CMH_postnatal_feedbr"></def:ValueSetLabel>
        </td>
    </tr>
</table>
<def:datafieldcontrol runat="server" id="CMH_postnatal_feedbrlngth" DatabaseField="CMH_postnatal_feedbrlngth"  IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="200px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<br />
<table border="0" cellpadding="0" cellspacing="0">
    <tr>
        <td>
            <def:datafieldcontrol runat="server" id="CMH_postnatal_wtgainpoor" DatabaseField="CMH_postnatal_wtgainpoor"  IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="200px" FieldTextBoxWidth="30px"></def:datafieldcontrol>            
        </td>
        <td style="padding-left:20px;padding-top:5px;padding-bottom:5px" style="vertical-align:top" rowspan="2">
            <def:ValueSetLabel ID="ValueSetLabel_CMH_postnatal_wtgainpoor" runat="server"  DatabaseField="CMH_postnatal_wtgainpoor"></def:ValueSetLabel>            
        </td>
    </tr>
    <tr>
        <td>
            <def:datafieldcontrol runat="server" id="CMH_postnatal_colic" DatabaseField="CMH_postnatal_colic"  IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="200px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
        </td>
    </tr>
</table>
<h3>Developmental History</h3>
<table border="0" cellpadding="0" cellspacing="0">
    <tr>
        <td>
            <def:datafieldcontrol runat="server" id="CMH_develop_grossm" DatabaseField="CMH_develop_grossm"  IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="200px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
        </td>
        <td style="padding-left:20px;padding-top:5px;padding-bottom:5px" style="vertical-align:top" rowspan="5">
            <def:ValueSetLabel ID="ValueSetLabel_CMH_develop_grossm" runat="server"  DatabaseField="CMH_develop_grossm"></def:ValueSetLabel>
        </td>
    </tr>
    <tr>
        <td>
            <def:datafieldcontrol runat="server" id="CMH_develop_finem" DatabaseField="CMH_develop_finem"  IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="200px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
        </td>
    </tr>
    <tr>
        <td>
            <def:datafieldcontrol runat="server" id="CMH_develop_lang" DatabaseField="CMH_develop_lang"  IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="200px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
        </td>
    </tr>
    <tr>
        <td>
            <def:datafieldcontrol runat="server" id="CMH_develop_social" DatabaseField="CMH_develop_social"  IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="200px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
        </td>
    </tr>
    <tr>
        <td>
            <def:datafieldcontrol runat="server" id="CMH_develop_selfhelp" DatabaseField="CMH_develop_selfhelp"  IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="200px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
        </td>
    </tr>
    <tr>
        <td>
            <def:datafieldcontrol runat="server" id="CMH_develop_regression" DatabaseField="CMH_develop_regression"  IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="200px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
        </td>
        <td style="padding-left:20px;padding-top:5px;padding-bottom:5px" style="vertical-align:top" rowspan="5">
            <def:ValueSetLabel ID="ValueSetLabel_CMH_develop_regression" runat="server"  DatabaseField="CMH_develop_regression"></def:ValueSetLabel>
        </td>
    </tr>
</table>
<def:datafieldcontrol runat="server" id="CMH_develop_regressionage" DatabaseField="CMH_develop_regressionage"  IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="200px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="CMH_develop_regressionskillloss" DatabaseField="CMH_develop_regressionskillloss"  IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="200px" FieldTextBoxWidth = "400px" FieldTextBoxHeight = "60px" FieldTextBoxTextMode="MultiLine"></def:datafieldcontrol>
<h3>Current Medications</h3>
<def:datafieldcontrol runat="server" id="CMH_currmed_prescription" DatabaseField="CMH_currmed_prescription"  IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="200px" FieldTextBoxWidth = "400px" FieldTextBoxHeight = "60px" FieldTextBoxTextMode="MultiLine"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="CMH_currmed_overcounter" DatabaseField="CMH_currmed_overcounter"  IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="200px" FieldTextBoxWidth = "400px" FieldTextBoxHeight = "60px" FieldTextBoxTextMode="MultiLine"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="CMH_currmed_supplement" DatabaseField="CMH_currmed_supplement"  IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="200px" FieldTextBoxWidth = "400px" FieldTextBoxHeight = "60px" FieldTextBoxTextMode="MultiLine"></def:datafieldcontrol>
<h3>Review of Systems</h3>
<h4>Head/Brain</h4>
<table border="0" cellpadding="0" cellspacing="0">
    <tr>
        <td>
            <def:datafieldcontrol runat="server" id="CMH_rev_headmicroph" DatabaseField="CMH_rev_headmicroph"  IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="200px" FieldTextBoxWidth="30px"></def:datafieldcontrol>            
        </td>
        <td style="padding-left:20px;padding-top:5px;padding-bottom:5px" style="vertical-align:top" rowspan="3">
            <def:ValueSetLabel ID="ValueSetLabel_CMH_rev_headmicroph" runat="server"  DatabaseField="CMH_rev_headmicroph"></def:ValueSetLabel>
        </td>
    </tr>
    <tr>
        <td>
            <def:datafieldcontrol runat="server" id="CMH_rev_headmacroph" DatabaseField="CMH_rev_headmacroph"  IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="200px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
        </td>
    </tr>
        <tr>
        <td>
            <def:datafieldcontrol runat="server" id="CMH_rev_headstructab" DatabaseField="CMH_rev_headstructab"  IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="200px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
        </td>
    </tr>
</table>
<def:datafieldcontrol runat="server" id="CMH_rev_headstructabdesc" DatabaseField="CMH_rev_headstructabdesc"  IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="200px" FieldTextBoxWidth = "400px" FieldTextBoxHeight = "60px" FieldTextBoxTextMode="MultiLine"></def:datafieldcontrol>
<table border="0" cellpadding="0" cellspacing="0">
    <tr>
        <td>
            <def:datafieldcontrol runat="server" id="CMH_rev_headmeningitits" DatabaseField="CMH_rev_headmeningitits"  IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="200px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
        </td>
        <td style="padding-left:20px;padding-top:5px;padding-bottom:5px">
            <def:ValueSetLabel ID="ValueSetLabel_CMH_rev_headmeningitits" runat="server"  DatabaseField="CMH_rev_headmeningitits"></def:ValueSetLabel>
        </td>
    </tr>
</table>
<def:datafieldcontrol runat="server" id="CMH_rev_headmeningititsage" DatabaseField="CMH_rev_headmeningititsage"  IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="200px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="CMH_rev_headmeningititsorg" DatabaseField="CMH_rev_headmeningititsorg"  IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="200px" FieldTextBoxWidth = "400px" FieldTextBoxHeight = "60px" FieldTextBoxTextMode="MultiLine"></def:datafieldcontrol>
<table border="0" cellpadding="0" cellspacing="0">
    <tr>
        <td>
            <def:datafieldcontrol runat="server" id="CMH_rev_headencephalitis" DatabaseField="CMH_rev_headencephalitis"  IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="200px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
        </td>
        <td style="padding-left:20px;padding-top:5px;padding-bottom:5px">
            <def:ValueSetLabel ID="ValueSetLabel_CMH_rev_headencephalitis" runat="server"  DatabaseField="CMH_rev_headencephalitis"></def:ValueSetLabel>
        </td>
    </tr>
</table>
<def:datafieldcontrol runat="server" id="CMH_rev_headencephalitisage" DatabaseField="CMH_rev_headencephalitisage"  IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="200px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="CMH_rev_headencephalitisorg" DatabaseField="CMH_rev_headencephalitisorg"  IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="200px" FieldTextBoxWidth = "400px" FieldTextBoxHeight = "60px" FieldTextBoxTextMode="MultiLine"></def:datafieldcontrol>
<table border="0" cellpadding="0" cellspacing="0">
    <tr>
        <td>
            <def:datafieldcontrol runat="server" id="CMH_rev_headfebseiz" DatabaseField="CMH_rev_headfebseiz"  IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="200px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
        </td>
        <td style="padding-left:20px;padding-top:5px;padding-bottom:5px">
            <def:ValueSetLabel ID="ValueSetLabel_CMH_rev_headfebseiz" runat="server"  DatabaseField="CMH_rev_headfebseiz"></def:ValueSetLabel>
        </td>
    </tr>
</table>
<def:datafieldcontrol runat="server" id="CMH_rev_headfebseizages" DatabaseField="CMH_rev_headfebseizages"  IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="200px" FieldTextBoxWidth = "400px" FieldTextBoxHeight = "60px" FieldTextBoxTextMode="MultiLine"></def:datafieldcontrol>
<table border="0" cellpadding="0" cellspacing="0">
    <tr>
        <td>
            <def:datafieldcontrol runat="server" id="CMH_rev_headseizure" DatabaseField="CMH_rev_headseizure"  IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="200px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
        </td>
        <td style="padding-left:20px;padding-top:5px;padding-bottom:5px">
            <def:ValueSetLabel ID="ValueSetLabel_CMH_rev_headseizure" runat="server"  DatabaseField="CMH_rev_headseizure"></def:ValueSetLabel>
        </td>
    </tr>
</table>
<def:datafieldcontrol runat="server" id="CMH_rev_headseizureonset" DatabaseField="CMH_rev_headseizureonset"  IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="200px" FieldTextBoxWidth = "400px" FieldTextBoxHeight = "60px" FieldTextBoxTextMode="MultiLine"></def:datafieldcontrol>
<table border="0" cellpadding="0" cellspacing="0">
    <tr>
        <td>
            <def:datafieldcontrol runat="server" id="CMH_rev_headseizurecontrol" DatabaseField="CMH_rev_headseizurecontrol"  IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="200px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
        </td>
        <td style="padding-left:20px;padding-top:5px;padding-bottom:5px" style="vertical-align:top" rowspan="2">
            <def:ValueSetLabel ID="ValueSetLabel_CMH_rev_headseizurecontrol" runat="server"  DatabaseField="CMH_rev_headseizurecontrol"></def:ValueSetLabel>
        </td>
    </tr>
    <tr>
        <td>
            <def:datafieldcontrol runat="server" id="CMH_rev_headeeg" DatabaseField="CMH_rev_headeeg"  IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="200px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
        </td>
    </tr>
</table>
<def:datafieldcontrol runat="server" id="CMH_rev_headeegresult" DatabaseField="CMH_rev_headeegresult"  IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="200px" FieldTextBoxWidth = "400px" FieldTextBoxHeight = "60px" FieldTextBoxTextMode="MultiLine"></def:datafieldcontrol>
<table border="0" cellpadding="0" cellspacing="0">
    <tr>
        <td>
            <def:datafieldcontrol runat="server" id="CMH_rev_headimagestudy" DatabaseField="CMH_rev_headimagestudy"  IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="200px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
        </td>
        <td style="padding-left:20px;padding-top:5px;padding-bottom:5px">
            <def:ValueSetLabel ID="ValueSetLabel_CMH_rev_headimagestudy" runat="server"  DatabaseField="CMH_rev_headimagestudy"></def:ValueSetLabel>
        </td>
    </tr>
    <tr>
        <td>
            <def:datafieldcontrol runat="server" id="CMH_rev_headimagestudytype" DatabaseField="CMH_rev_headimagestudytype"  IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="200px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
        </td>
        <td style="padding-left:20px;padding-top:5px;padding-bottom:5px">
            <def:ValueSetLabel ID="ValueSetLabel_CMH_rev_headimagestudytype" runat="server"  DatabaseField="CMH_rev_headimagestudytype"></def:ValueSetLabel>
        </td>
    </tr>
</table>
<def:datafieldcontrol runat="server" id="CMH_rev_headimagestudyresult" DatabaseField="CMH_rev_headimagestudyresult"  IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="200px" FieldTextBoxWidth = "400px" FieldTextBoxHeight = "60px" FieldTextBoxTextMode="MultiLine"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="CMH_rev_headother" DatabaseField="CMH_rev_headother"  IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="200px" FieldTextBoxWidth = "400px" FieldTextBoxHeight = "60px" FieldTextBoxTextMode="MultiLine"></def:datafieldcontrol>
<h4>Eyes</h4>
<table border="0" cellpadding="0" cellspacing="0">
    <tr>
        <td>
            <def:datafieldcontrol runat="server" id="CMH_rev_eyeimpair" DatabaseField="CMH_rev_eyeimpair"  IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="200px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
        </td>
        <td style="padding-left:20px;padding-top:5px;padding-bottom:5px" style="vertical-align:top" rowspan="2">
            <def:ValueSetLabel ID="ValueSetLabel_CMH_rev_eyeimpair" runat="server"  DatabaseField="CMH_rev_eyeimpair"></def:ValueSetLabel>
        </td>
    </tr>
    <tr>
        <td>
            <def:datafieldcontrol runat="server" id="CMH_rev_eyestrabismus" DatabaseField="CMH_rev_eyestrabismus"  IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="200px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
        </td>
    </tr>
</table>
<def:datafieldcontrol runat="server" id="CMH_rev_eyeoter" DatabaseField="CMH_rev_eyeoter"  IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="200px" FieldTextBoxWidth = "400px" FieldTextBoxHeight = "60px" FieldTextBoxTextMode="MultiLine"></def:datafieldcontrol>
<h4>Ears</h4>
<table border="0" cellpadding="0" cellspacing="0">
    <tr>
        <td>
            <def:datafieldcontrol runat="server" id="CMH_rev_eartest" DatabaseField="CMH_rev_eartest"  IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="200px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
        </td>
        <td style="padding-left:20px;padding-top:5px;padding-bottom:5px">
            <def:ValueSetLabel ID="ValueSetLabel_CMH_rev_eartest" runat="server"  DatabaseField="CMH_rev_eartest"></def:ValueSetLabel>
        </td>
    </tr>
</table>
<def:datafieldcontrol runat="server" id="CMH_rev_eartestages" DatabaseField="CMH_rev_eartestages"  IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="200px" FieldTextBoxWidth = "400px" FieldTextBoxHeight = "60px" FieldTextBoxTextMode="MultiLine"></def:datafieldcontrol>
<table border="0" cellpadding="0" cellspacing="0">
    <tr>
        <td>
            <def:datafieldcontrol runat="server" id="CMH_rev_eartestresult" DatabaseField="CMH_rev_eartestresult"  IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="200px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
        </td>
        <td style="padding-left:20px;padding-top:5px;padding-bottom:5px">
            <def:ValueSetLabel ID="ValueSetLabel_CMH_rev_eartestresult" runat="server"  DatabaseField="CMH_rev_eartestresult"></def:ValueSetLabel>
        </td>
    </tr>
</table>
<def:datafieldcontrol runat="server" id="CMH_rev_eartestfinding" DatabaseField="CMH_rev_eartestfinding"  IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="200px" FieldTextBoxWidth = "400px" FieldTextBoxHeight = "60px" FieldTextBoxTextMode="MultiLine"></def:datafieldcontrol>
<table border="0" cellpadding="0" cellspacing="0">
    <tr>
        <td>
            <def:datafieldcontrol runat="server" id="CMH_rev_earab" DatabaseField="CMH_rev_earab"  IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="200px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
        </td>
        <td style="padding-left:20px;padding-top:5px;padding-bottom:5px">
            <def:ValueSetLabel ID="ValueSetLabel_CMH_rev_earab" runat="server"  DatabaseField="CMH_rev_earab"></def:ValueSetLabel>
        </td>
    </tr>
</table>
<def:datafieldcontrol runat="server" id="CMH_rev_earabdesc" DatabaseField="CMH_rev_earabdesc"  IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="200px" FieldTextBoxWidth = "400px" FieldTextBoxHeight = "60px" FieldTextBoxTextMode="MultiLine"></def:datafieldcontrol>
<table border="0" cellpadding="0" cellspacing="0">
    <tr>
        <td>
            <def:datafieldcontrol runat="server" id="CMH_rev_earrecuotitis" DatabaseField="CMH_rev_earrecuotitis"  IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="200px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
        </td>
        <td style="padding-left:20px;padding-top:5px;padding-bottom:5px">
            <def:ValueSetLabel ID="ValueSetLabel_CMH_rev_earrecuotitis" runat="server"  DatabaseField="CMH_rev_earrecuotitis"></def:ValueSetLabel>
        </td>
    </tr>
</table>
<def:datafieldcontrol runat="server" id="CMH_rev_earrecuotitisyear" DatabaseField="CMH_rev_earrecuotitisyear"  IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="200px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="CMH_rev_earrecuotitisage" DatabaseField="CMH_rev_earrecuotitisage"  IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="200px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<table border="0" cellpadding="0" cellspacing="0">
    <tr>
        <td>
            <def:datafieldcontrol runat="server" id="CMH_rev_earpetube" DatabaseField="CMH_rev_earpetube"  IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="200px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
        </td>
        <td style="padding-left:20px;padding-top:5px;padding-bottom:5px">
            <def:ValueSetLabel ID="ValueSetLabel_CMH_rev_earpetube" runat="server"  DatabaseField="CMH_rev_earpetube"></def:ValueSetLabel>
        </td>
    </tr>
</table>
<def:datafieldcontrol runat="server" id="CMH_rev_earpetubeset" DatabaseField="CMH_rev_earpetubeset"  IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="200px" FieldTextBoxWidth = "400px" FieldTextBoxHeight = "60px" FieldTextBoxTextMode="MultiLine"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="CMH_rev_earother" DatabaseField="CMH_rev_earother"  IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="200px" FieldTextBoxWidth = "400px" FieldTextBoxHeight = "60px" FieldTextBoxTextMode="MultiLine"></def:datafieldcontrol>
<h4>Nose</h4>
<table border="0" cellpadding="0" cellspacing="0">
    <tr>
        <td>
            <def:datafieldcontrol runat="server" id="CMH_rev_nosesmellprob" DatabaseField="CMH_rev_nosesmellprob"  IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="200px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
        </td>
        <td style="padding-left:20px;padding-top:5px;padding-bottom:5px">
            <def:ValueSetLabel ID="ValueSetLabel_CMH_rev_nosesmellprob" runat="server"  DatabaseField="CMH_rev_nosesmellprob"></def:ValueSetLabel>
        </td>
    </tr>
</table>
<def:datafieldcontrol runat="server" id="CMH_rev_noseother" DatabaseField="CMH_rev_noseother"  IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="200px" FieldTextBoxWidth = "400px" FieldTextBoxHeight = "60px" FieldTextBoxTextMode="MultiLine"></def:datafieldcontrol>
<h4>Mouth</h4>
<table border="0" cellpadding="0" cellspacing="0">
    <tr>
        <td>
            <def:datafieldcontrol runat="server" id="CMH_rev_mouthcleftlip" DatabaseField="CMH_rev_mouthcleftlip"  IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="200px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
        </td>
        <td style="padding-left:20px;padding-top:5px;padding-bottom:5px" style="vertical-align:top" rowspan="4">
            <def:ValueSetLabel ID="ValueSetLabel_CMH_rev_mouthcleftlip" runat="server"  DatabaseField="CMH_rev_mouthcleftlip"></def:ValueSetLabel>
        </td>
    </tr>
    <tr>
        <td>
            <def:datafieldcontrol runat="server" id="CMH_rev_mouthcleftpalate" DatabaseField="CMH_rev_mouthcleftpalate"  IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="200px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
        </td>
    </tr>
    <tr>
        <td>
            <def:datafieldcontrol runat="server" id="CMH_rev_mouthspeechdiff" DatabaseField="CMH_rev_mouthspeechdiff"  IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="200px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
        </td>
    </tr>
    <tr>
        <td>
            <def:datafieldcontrol runat="server" id="CMH_rev_mouthnasalreg" DatabaseField="CMH_rev_mouthnasalreg"  IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="200px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
        </td>
    </tr>
</table>
<def:datafieldcontrol runat="server" id="CMH_rev_mouthother" DatabaseField="CMH_rev_mouthother"  IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="200px" FieldTextBoxWidth = "400px" FieldTextBoxHeight = "60px" FieldTextBoxTextMode="MultiLine"></def:datafieldcontrol>
<h4>Teeth</h4>
<table border="0" cellpadding="0" cellspacing="0">
    <tr>
        <td>
            <def:datafieldcontrol runat="server" id="CMH_rev_teethneonatal" DatabaseField="CMH_rev_teethneonatal"  IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="200px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
        </td>
        <td style="padding-left:20px;padding-top:5px;padding-bottom:5px" style="vertical-align:top" rowspan="2">
            <def:ValueSetLabel ID="ValueSetLabel_CMH_rev_teethneonatal" runat="server"  DatabaseField="CMH_rev_teethneonatal"></def:ValueSetLabel>
        </td>
    </tr>
    <tr>
        <td>
            <def:datafieldcontrol runat="server" id="CMH_rev_teethdentalab" DatabaseField="CMH_rev_teethdentalab"  IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="200px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
        </td>
    </tr>
</table>
<def:datafieldcontrol runat="server" id="CMH_rev_teethdentalabdesc" DatabaseField="CMH_rev_teethdentalabdesc"  IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="200px" FieldTextBoxWidth = "400px" FieldTextBoxHeight = "60px" FieldTextBoxTextMode="MultiLine"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="CMH_rev_teethdentalabother" DatabaseField="CMH_rev_teethdentalabother"  IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="200px" FieldTextBoxWidth = "400px" FieldTextBoxHeight = "60px" FieldTextBoxTextMode="MultiLine"></def:datafieldcontrol>
<h4>Neck/Back</h4>
<table border="0" cellpadding="0" cellspacing="0">
    <tr>
        <td>
            <def:datafieldcontrol runat="server" id="CMH_rev_neckspinalab" DatabaseField="CMH_rev_neckspinalab"  IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="200px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
        </td>
        <td style="padding-left:20px;padding-top:5px;padding-bottom:5px">
            <def:ValueSetLabel ID="ValueSetLabel_CMH_rev_neckspinalab" runat="server"  DatabaseField="CMH_rev_neckspinalab"></def:ValueSetLabel>
        </td>
    </tr>
</table>
<def:datafieldcontrol runat="server" id="CMH_rev_neckother" DatabaseField="CMH_rev_neckother"  IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="200px" FieldTextBoxWidth = "400px" FieldTextBoxHeight = "60px" FieldTextBoxTextMode="MultiLine"></def:datafieldcontrol>
<h4>Orthopedic</h4>
<table border="0" cellpadding="0" cellspacing="0">
    <tr>
        <td>
            <def:datafieldcontrol runat="server" id="CMH_rev_orthofracture" DatabaseField="CMH_rev_orthofracture"  IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="200px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
        </td>
        <td style="padding-left:20px;padding-top:5px;padding-bottom:5px">
            <def:ValueSetLabel ID="ValueSetLabel_CMH_rev_orthofracture" runat="server"  DatabaseField="CMH_rev_orthofracture"></def:ValueSetLabel>
        </td>
    </tr>
</table>
<def:datafieldcontrol runat="server" id="CMH_rev_orthofractureno" DatabaseField="CMH_rev_orthofractureno"  IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="200px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="CMH_rev_orthofractureloc" DatabaseField="CMH_rev_orthofractureloc"  IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="200px" FieldTextBoxWidth = "400px" FieldTextBoxHeight = "60px" FieldTextBoxTextMode="MultiLine"></def:datafieldcontrol>
<table border="0" cellpadding="0" cellspacing="0">
    <tr>
        <td>
            <def:datafieldcontrol runat="server" id="CMH_rev_orthojointdislocate" DatabaseField="CMH_rev_orthojointdislocate"  IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="200px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
        </td>
        <td style="padding-left:20px;padding-top:5px;padding-bottom:5px">
            <def:ValueSetLabel ID="ValueSetLabel_CMH_rev_orthojointdislocate" runat="server"  DatabaseField="CMH_rev_orthojointdislocate"></def:ValueSetLabel>
        </td>
    </tr>
</table>
<def:datafieldcontrol runat="server" id="CMH_rev_orthojointdislocatelist" DatabaseField="CMH_rev_orthojointdislocatelist"  IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="200px" FieldTextBoxWidth = "400px" FieldTextBoxHeight = "60px" FieldTextBoxTextMode="MultiLine"></def:datafieldcontrol>
<table border="0" cellpadding="0" cellspacing="0">
    <tr>
        <td>
            <def:datafieldcontrol runat="server" id="CMH_rev_orthoosteomylitis" DatabaseField="CMH_rev_orthoosteomylitis"  IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="200px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
        </td>
        <td style="padding-left:20px;padding-top:5px;padding-bottom:5px">
            <def:ValueSetLabel ID="ValueSetLabel_CMH_rev_orthoosteomylitis" runat="server"  DatabaseField="CMH_rev_orthoosteomylitis"></def:ValueSetLabel>
        </td>
    </tr>
</table>
<def:datafieldcontrol runat="server" id="CMH_rev_orthoother" DatabaseField="CMH_rev_orthoother"  IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="200px" FieldTextBoxWidth = "400px" FieldTextBoxHeight = "60px" FieldTextBoxTextMode="MultiLine"></def:datafieldcontrol>
<h4>Skin</h4>
<table border="0" cellpadding="0" cellspacing="0">
    <tr>
        <td>
            <def:datafieldcontrol runat="server" id="CMH_rev_skinbirthmark" DatabaseField="CMH_rev_skinbirthmark"  IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="200px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
        </td>
        <td style="padding-left:20px;padding-top:5px;padding-bottom:5px" style="vertical-align:top" rowspan="3">
            <def:ValueSetLabel ID="ValueSetLabel_CMH_rev_skinbirthmark" runat="server"  DatabaseField="CMH_rev_skinbirthmark"></def:ValueSetLabel>
        </td>
    </tr>
    <tr>
        <td>
            <def:datafieldcontrol runat="server" id="CMH_rev_skineczema" DatabaseField="CMH_rev_skineczema"  IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="200px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
        </td>
    </tr>
    <tr>
        <td>
            <def:datafieldcontrol runat="server" id="CMH_rev_skinabcesses" DatabaseField="CMH_rev_skinabcesses"  IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="200px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
        </td>
    </tr>
</table>
<def:datafieldcontrol runat="server" id="CMH_rev_skinabcessesnumtreat" DatabaseField="CMH_rev_skinabcessesnumtreat"  IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="200px" FieldTextBoxWidth = "400px" FieldTextBoxHeight = "60px" FieldTextBoxTextMode="MultiLine"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="CMH_rev_skinother" DatabaseField="CMH_rev_skinother"  IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="200px" FieldTextBoxWidth = "400px" FieldTextBoxHeight = "60px" FieldTextBoxTextMode="MultiLine"></def:datafieldcontrol>
<h4>Pulmonary</h4>
<table border="0" cellpadding="0" cellspacing="0">
    <tr>
        <td>
            <def:datafieldcontrol runat="server" id="CMH_rev_pulbreathab" DatabaseField="CMH_rev_pulbreathab"  IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="200px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
        </td>
        <td style="padding-left:20px;padding-top:5px;padding-bottom:5px" style="vertical-align:top" rowspan="2">
            <def:ValueSetLabel ID="ValueSetLabel_CMH_rev_pulbreathab" runat="server"  DatabaseField="CMH_rev_pulbreathab"></def:ValueSetLabel>
        </td>
    </tr>
    <tr>
        <td>
            <def:datafieldcontrol runat="server" id="CMH_rev_pulasthma" DatabaseField="CMH_rev_pulasthma"  IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="200px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
        </td>
    </tr>
</table>
<def:datafieldcontrol runat="server" id="CMH_rev_pulasthmatrigg" DatabaseField="CMH_rev_pulasthmatrigg"  IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="200px" FieldTextBoxWidth = "400px" FieldTextBoxHeight = "60px" FieldTextBoxTextMode="MultiLine"></def:datafieldcontrol>
<table border="0" cellpadding="0" cellspacing="0">
    <tr>
        <td>
            <def:datafieldcontrol runat="server" id="CMH_rev_pullungmalfunc" DatabaseField="CMH_rev_pullungmalfunc"  IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="200px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
        </td>
        <td style="padding-left:20px;padding-top:5px;padding-bottom:5px" style="vertical-align:top" rowspan="2">
            <def:ValueSetLabel ID="ValueSetLabel_CMH_rev_pullungmalfunc" runat="server"  DatabaseField="CMH_rev_pullungmalfunc"></def:ValueSetLabel>
        </td>
    </tr>
    <tr>
        <td>
            <def:datafieldcontrol runat="server" id="CMH_rev_pulpneumoniafreq" DatabaseField="CMH_rev_pulpneumoniafreq"  IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="200px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
        </td>
    </tr>
</table>
<def:datafieldcontrol runat="server" id="CMH_rev_pulpneumoniafreqages" DatabaseField="CMH_rev_pulpneumoniafreqages"  IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="200px" FieldTextBoxWidth = "400px" FieldTextBoxHeight = "60px" FieldTextBoxTextMode="MultiLine"></def:datafieldcontrol>
<table border="0" cellpadding="0" cellspacing="0">
    <tr>
        <td>
            <def:datafieldcontrol runat="server" id="CMH_rev_pulaspiration" DatabaseField="CMH_rev_pulaspiration"  IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="200px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
        </td>
        <td style="padding-left:20px;padding-top:5px;padding-bottom:5px">
            <def:ValueSetLabel ID="ValueSetLabel_CMH_rev_pulaspiration" runat="server"  DatabaseField="CMH_rev_pulaspiration"></def:ValueSetLabel>
        </td>
    </tr>
</table>
<def:datafieldcontrol runat="server" id="CMH_rev_pulother" DatabaseField="CMH_rev_pulother"  IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="200px" FieldTextBoxWidth = "400px" FieldTextBoxHeight = "60px" FieldTextBoxTextMode="MultiLine"></def:datafieldcontrol>
<h4>Cardiovascular</h4>
<table border="0" cellpadding="0" cellspacing="0">
    <tr>
        <td>
            <def:datafieldcontrol runat="server" id="CMH_rev_cardiomalfunc" DatabaseField="CMH_rev_cardiomalfunc"  IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="200px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
        </td>
        <td style="padding-left:20px;padding-top:5px;padding-bottom:5px">
            <def:ValueSetLabel ID="ValueSetLabel_CMH_rev_cardiomalfunc" runat="server"  DatabaseField="CMH_rev_cardiomalfunc"></def:ValueSetLabel>
        </td>
    </tr>
</table>
<def:datafieldcontrol runat="server" id="CMH_rev_cardiomalfunclesion" DatabaseField="CMH_rev_cardiomalfunclesion"  IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="200px" FieldTextBoxWidth = "400px" FieldTextBoxHeight = "60px" FieldTextBoxTextMode="MultiLine"></def:datafieldcontrol>
<table border="0" cellpadding="0" cellspacing="0">
    <tr>
        <td>
            <def:datafieldcontrol runat="server" id="CMH_rev_cardiocyanosis" DatabaseField="CMH_rev_cardiocyanosis"  IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="200px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
        </td>
        <td style="padding-left:20px;padding-top:5px;padding-bottom:5px">
            <def:ValueSetLabel ID="ValueSetLabel_CMH_rev_cardiocyanosis" runat="server"  DatabaseField="CMH_rev_cardiocyanosis"></def:ValueSetLabel>
        </td>
    </tr>
</table>
<def:datafieldcontrol runat="server" id="CMH_rev_cardioother" DatabaseField="CMH_rev_cardioother"  IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="200px" FieldTextBoxWidth = "400px" FieldTextBoxHeight = "60px" FieldTextBoxTextMode="MultiLine"></def:datafieldcontrol>
<h4>Gastrointestinal</h4>
<table border="0" cellpadding="0" cellspacing="0">
    <tr>
        <td>
            <def:datafieldcontrol runat="server" id="CMH_rev_gastrodysphagia" DatabaseField="CMH_rev_gastrodysphagia"  IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="200px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
        </td>
        <td style="padding-left:20px;padding-top:5px;padding-bottom:5px" style="vertical-align:top" rowspan="5">
            <def:ValueSetLabel ID="ValueSetLabel_CMH_rev_gastrodysphagia" runat="server"  DatabaseField="CMH_rev_gastrodysphagia"></def:ValueSetLabel>
        </td>
    </tr>
    <tr>
        <td>
            <def:datafieldcontrol runat="server" id="CMH_rev_gastroreflux" DatabaseField="CMH_rev_gastroreflux"  IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="200px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
        </td>
    </tr>
    <tr>
        <td>
            <def:datafieldcontrol runat="server" id="CMH_rev_gastrorefluxmed" DatabaseField="CMH_rev_gastrorefluxmed"  IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="200px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
        </td>
    </tr>
    <tr>
        <td>
            <def:datafieldcontrol runat="server" id="CMH_rev_gastroother" DatabaseField="CMH_rev_gastroother"  IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="200px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
        </td>
    </tr>
    <tr>
        <td>
            <def:datafieldcontrol runat="server" id="CMH_rev_gastrohernia" DatabaseField="CMH_rev_gastrohernia"  IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="200px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
        </td>
    </tr>
</table>
<def:datafieldcontrol runat="server" id="CMH_rev_gastroherniatype" DatabaseField="CMH_rev_gastroherniatype"  IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="200px" FieldTextBoxWidth = "400px" FieldTextBoxHeight = "60px" FieldTextBoxTextMode="MultiLine"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="CMH_rev_gastroothercom" DatabaseField="CMH_rev_gastroothercom"  IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="200px" FieldTextBoxWidth = "400px" FieldTextBoxHeight = "60px" FieldTextBoxTextMode="MultiLine"></def:datafieldcontrol>
<h4>Genito-Urinary</h4>
<table border="0" cellpadding="0" cellspacing="0">
    <tr>
        <td>
            <def:datafieldcontrol runat="server" id="CMH_rev_genitorenalmalfunc" DatabaseField="CMH_rev_genitorenalmalfunc"  IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="200px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
        </td>
        <td style="padding-left:20px;padding-top:5px;padding-bottom:5px">
            <def:ValueSetLabel ID="ValueSetLabel_CMH_rev_genitorenalmalfunc" runat="server"  DatabaseField="CMH_rev_genitorenalmalfunc"></def:ValueSetLabel>
        </td>
    </tr>
</table>
<def:datafieldcontrol runat="server" id="CMH_rev_genitorenalmalfunctype" DatabaseField="CMH_rev_genitorenalmalfunctype"  IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="200px" FieldTextBoxWidth = "400px" FieldTextBoxHeight = "60px" FieldTextBoxTextMode="MultiLine"></def:datafieldcontrol>
<table border="0" cellpadding="0" cellspacing="0">
    <tr>
        <td>
            <def:datafieldcontrol runat="server" id="CMH_rev_genitouti" DatabaseField="CMH_rev_genitouti"  IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="200px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
        </td>
        <td style="padding-left:20px;padding-top:5px;padding-bottom:5px">
            <def:ValueSetLabel ID="ValueSetLabel_CMH_rev_genitouti" runat="server"  DatabaseField="CMH_rev_genitouti"></def:ValueSetLabel>
        </td>
    </tr>
</table>
<def:datafieldcontrol runat="server" id="CMH_rev_genitoutinum" DatabaseField="CMH_rev_genitoutinum"  IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="200px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<table border="0" cellpadding="0" cellspacing="0">
    <tr>
        <td>
            <def:datafieldcontrol runat="server" id="CMH_rev_genitourinediscolor" DatabaseField="CMH_rev_genitourinediscolor"  IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="200px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
        </td>
        <td style="padding-left:20px;padding-top:5px;padding-bottom:5px">
            <def:ValueSetLabel ID="ValueSetLabel_CMH_rev_genitourinediscolor" runat="server"  DatabaseField="CMH_rev_genitourinediscolor"></def:ValueSetLabel>
        </td>
    </tr>
</table>
<def:datafieldcontrol runat="server" id="CMH_rev_genitourinediscolorage" DatabaseField="CMH_rev_genitourinediscolorage"  IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="200px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="CMH_rev_genitourinecolor" DatabaseField="CMH_rev_genitourinecolor"  IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="200px" FieldTextBoxWidth = "175px"></def:datafieldcontrol>
<table border="0" cellpadding="0" cellspacing="0">
    <tr>
        <td>
            <def:datafieldcontrol runat="server" id="CMH_rev_genitocryptorchidism" DatabaseField="CMH_rev_genitocryptorchidism"  IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="200px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
        </td>
        <td style="padding-left:20px;padding-top:5px;padding-bottom:5px">
            <def:ValueSetLabel ID="ValueSetLabel_CMH_rev_genitocryptorchidism" runat="server"  DatabaseField="CMH_rev_genitocryptorchidism"></def:ValueSetLabel>
        </td>
    </tr>
    <tr>
        <td>
            <def:datafieldcontrol runat="server" id="CMH_rev_genitocryptorchidismtype" DatabaseField="CMH_rev_genitocryptorchidismtype"  IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="200px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
        </td>
        <td style="padding-left:20px;padding-top:5px;padding-bottom:5px">
            <def:ValueSetLabel ID="ValueSetLabel_CMH_rev_genitocryptorchidismtype" runat="server"  DatabaseField="CMH_rev_genitocryptorchidismtype"></def:ValueSetLabel>
        </td>
    </tr>
</table>
<def:datafieldcontrol runat="server" id="CMH_rev_genitoother" DatabaseField="CMH_rev_genitoother"  IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="200px" FieldTextBoxWidth = "400px" FieldTextBoxHeight = "60px" FieldTextBoxTextMode="MultiLine"></def:datafieldcontrol>
<h4>Endocrine/Metabolic</h4>
<table border="0" cellpadding="0" cellspacing="0">
    <tr>
        <td>
            <def:datafieldcontrol runat="server" id="CMH_rev_endoprecocious" DatabaseField="CMH_rev_endoprecocious"  IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="200px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
        </td>
        <td style="padding-left:20px;padding-top:5px;padding-bottom:5px">
            <def:ValueSetLabel ID="ValueSetLabel_CMH_rev_endoprecocious" runat="server"  DatabaseField="CMH_rev_endoprecocious"></def:ValueSetLabel>
        </td>
    </tr>
</table>
<def:datafieldcontrol runat="server" id="CMH_rev_endoprecociousage" DatabaseField="CMH_rev_endoprecociousage"  IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="200px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<table border="0" cellpadding="0" cellspacing="0">
    <tr>
        <td>
            <def:datafieldcontrol runat="server" id="CMH_rev_endohypothyroidism" DatabaseField="CMH_rev_endohypothyroidism"  IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="200px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
        </td>
        <td style="padding-left:20px;padding-top:5px;padding-bottom:5px" style="vertical-align:top" rowspan="4">
            <def:ValueSetLabel ID="ValueSetLabel_CMH_rev_endohypothyroidism" runat="server"  DatabaseField="CMH_rev_endohypothyroidism"></def:ValueSetLabel>
        </td>
    </tr>
    <tr>
        <td>
            <def:datafieldcontrol runat="server" id="CMH_rev_endohyperthyroidism" DatabaseField="CMH_rev_endohyperthyroidism"  IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="200px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
        </td>
    </tr>
    <tr>
        <td>
            <def:datafieldcontrol runat="server" id="CMH_rev_endoobesity" DatabaseField="CMH_rev_endoobesity"  IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="200px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
        </td>
    </tr>
    <tr>
        <td>
            <def:datafieldcontrol runat="server" id="CMH_rev_endodiabetes" DatabaseField="CMH_rev_endodiabetes"  IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="200px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
        </td>
    </tr>
    <tr>
        <td>
            <def:datafieldcontrol runat="server" id="CMH_rev_endodiabetestype" DatabaseField="CMH_rev_endodiabetestype"  IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="200px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
        </td>
        <td style="padding-left:20px;padding-top:5px;padding-bottom:5px">
            <def:ValueSetLabel ID="ValueSetLabel_CMH_rev_endodiabetestype" runat="server"  DatabaseField="CMH_rev_endodiabetestype"></def:ValueSetLabel>
        </td>
    </tr>
</table>
<def:datafieldcontrol runat="server" id="CMH_rev_endodiabetesage" DatabaseField="CMH_rev_endodiabetesage"  IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="200px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<table border="0" cellpadding="0" cellspacing="0">
    <tr>
        <td>
            <def:datafieldcontrol runat="server" id="CMH_rev_endopancreasinsuff" DatabaseField="CMH_rev_endopancreasinsuff"  IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="200px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
        </td>
        <td style="padding-left:20px;padding-top:5px;padding-bottom:5px" style="vertical-align:top" rowspan="2">
            <def:ValueSetLabel ID="ValueSetLabel_CMH_rev_endopancreasinsuff" runat="server"  DatabaseField="CMH_rev_endopancreasinsuff"></def:ValueSetLabel>
        </td>
    </tr>
    <tr>
        <td>
            <def:datafieldcontrol runat="server" id="CMH_rev_endohypoglycemia" DatabaseField="CMH_rev_endohypoglycemia"  IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="200px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
        </td>
    </tr>
</table>
<def:datafieldcontrol runat="server" id="CMH_rev_endoother" DatabaseField="CMH_rev_endoother"  IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="200px" FieldTextBoxWidth = "400px" FieldTextBoxHeight = "60px" FieldTextBoxTextMode="MultiLine"></def:datafieldcontrol>
<h4>Hematologic</h4>
<table border="0" cellpadding="0" cellspacing="0">
    <tr>
        <td>
            <def:datafieldcontrol runat="server" id="CMH_rev_hemanemia" DatabaseField="CMH_rev_hemanemia"  IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="200px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
        </td>
        <td style="padding-left:20px;padding-top:5px;padding-bottom:5px">
            <def:ValueSetLabel ID="ValueSetLabel_CMH_rev_hemanemia" runat="server"  DatabaseField="CMH_rev_hemanemia"></def:ValueSetLabel>
        </td>
    </tr>
</table>
<def:datafieldcontrol runat="server" id="CMH_rev_hemanemiatype" DatabaseField="CMH_rev_hemanemiatype"  IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="200px" FieldTextBoxWidth = "400px" FieldTextBoxHeight = "60px" FieldTextBoxTextMode="MultiLine"></def:datafieldcontrol>
<table border="0" cellpadding="0" cellspacing="0">
    <tr>
        <td>
            <def:datafieldcontrol runat="server" id="CMH_rev_hembleeddisorder" DatabaseField="CMH_rev_hembleeddisorder"  IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="200px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
        </td>
        <td style="padding-left:20px;padding-top:5px;padding-bottom:5px">
            <def:ValueSetLabel ID="ValueSetLabel_CMH_rev_hembleeddisorder" runat="server"  DatabaseField="CMH_rev_hembleeddisorder"></def:ValueSetLabel>
        </td>
    </tr>
</table>
<def:datafieldcontrol runat="server" id="CMH_rev_hembleeddisordertype" DatabaseField="CMH_rev_hembleeddisordertype"  IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="200px" FieldTextBoxWidth = "400px" FieldTextBoxHeight = "60px" FieldTextBoxTextMode="MultiLine"></def:datafieldcontrol>
<h4>Immunologic</h4>
<table border="0" cellpadding="0" cellspacing="0">
    <tr>
        <td>
            <def:datafieldcontrol runat="server" id="CMH_rev_immunorecurinfection" DatabaseField="CMH_rev_immunorecurinfection"  IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="200px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
        </td>
        <td style="padding-left:20px;padding-top:5px;padding-bottom:5px" style="vertical-align:top" rowspan="2">
            <def:ValueSetLabel ID="ValueSetLabel_CMH_rev_immunorecurinfection" runat="server"  DatabaseField="CMH_rev_immunorecurinfection"></def:ValueSetLabel>
        </td>
    </tr>
    <tr>
        <td>
            <def:datafieldcontrol runat="server" id="CMH_rev_immunosepsis" DatabaseField="CMH_rev_immunosepsis"  IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="200px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
        </td>
    </tr>
</table>
<def:datafieldcontrol runat="server" id="CMH_rev_immunosepsisage" DatabaseField="CMH_rev_immunosepsisage"  IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="200px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="CMH_rev_immunosepsisorg" DatabaseField="CMH_rev_immunosepsisorg"  IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="200px" FieldTextBoxWidth = "400px" FieldTextBoxHeight = "60px" FieldTextBoxTextMode="MultiLine"></def:datafieldcontrol>
<table border="0" cellpadding="0" cellspacing="0">
    <tr>
        <td>
            <def:datafieldcontrol runat="server" id="CMH_rev_immunoOsteo" DatabaseField="CMH_rev_immunoOsteo"  IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="200px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
        </td>
        <td style="padding-left:20px;padding-top:5px;padding-bottom:5px">
            <def:ValueSetLabel ID="ValueSetLabel_CMH_rev_immunoOsteo" runat="server"  DatabaseField="CMH_rev_immunoOsteo"></def:ValueSetLabel>
        </td>
    </tr>
</table>
<def:datafieldcontrol runat="server" id="CMH_rev_immunoOsteoage" DatabaseField="CMH_rev_immunoOsteoage"  IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="200px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="CMH_rev_immunoOsteoloc" DatabaseField="CMH_rev_immunoOsteoloc"  IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="200px" FieldTextBoxWidth = "400px" FieldTextBoxHeight = "60px" FieldTextBoxTextMode="MultiLine"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="CMH_rev_immunoOsteolocorg" DatabaseField="CMH_rev_immunoOsteolocorg"  IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="200px" FieldTextBoxWidth = "400px" FieldTextBoxHeight = "60px" FieldTextBoxTextMode="MultiLine"></def:datafieldcontrol>
<table border="0" cellpadding="0" cellspacing="0">
    <tr>
        <td>
            <def:datafieldcontrol runat="server" id="CMH_rev_immunoigdeficiency" DatabaseField="CMH_rev_immunoigdeficiency"  IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="200px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
        </td>
        <td style="padding-left:20px;padding-top:5px;padding-bottom:5px" style="vertical-align:top" rowspan="3">
            <def:ValueSetLabel ID="ValueSetLabel_CMH_rev_immunoigdeficiency" runat="server"  DatabaseField="CMH_rev_immunoigdeficiency"></def:ValueSetLabel>
        </td>
    </tr>
    <tr>
        <td>
            <def:datafieldcontrol runat="server" id="CMH_rev_immunocellimmunedef" DatabaseField="CMH_rev_immunocellimmunedef"  IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="200px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
        </td>
    </tr>
    <tr>
        <td>
            <def:datafieldcontrol runat="server" id="CMH_rev_immunoenvallergy" DatabaseField="CMH_rev_immunoenvallergy"  IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="200px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
        </td>
    </tr>
</table>
<def:datafieldcontrol runat="server" id="CMH_rev_immunoenvallergytype" DatabaseField="CMH_rev_immunoenvallergytype"  IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="200px" FieldTextBoxWidth = "400px" FieldTextBoxHeight = "60px" FieldTextBoxTextMode="MultiLine"></def:datafieldcontrol>
<table border="0" cellpadding="0" cellspacing="0">
    <tr>
        <td>
            <def:datafieldcontrol runat="server" id="CMH_rev_immunomedallergy" DatabaseField="CMH_rev_immunomedallergy"  IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="200px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
        </td>
        <td style="padding-left:20px;padding-top:5px;padding-bottom:5px">
            <def:ValueSetLabel ID="ValueSetLabel_CMH_rev_immunomedallergy" runat="server"  DatabaseField="CMH_rev_immunomedallergy"></def:ValueSetLabel>
        </td>
    </tr>
</table>
<def:datafieldcontrol runat="server" id="CMH_rev_immunomedallergymed" DatabaseField="CMH_rev_immunomedallergymed"  IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="200px" FieldTextBoxWidth = "400px" FieldTextBoxHeight = "60px" FieldTextBoxTextMode="MultiLine"></def:datafieldcontrol>
<table border="0" cellpadding="0" cellspacing="0">
    <tr>
        <td>
            <def:datafieldcontrol runat="server" id="CMH_rev_immunoimmunization" DatabaseField="CMH_rev_immunoimmunization"  IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="200px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
        </td>
        <td style="padding-left:20px;padding-top:5px;padding-bottom:5px" style="vertical-align:top" rowspan="9">
            <def:ValueSetLabel ID="ValueSetLabel_CMH_rev_immunoimmunization" runat="server"  DatabaseField="CMH_rev_immunoimmunization"></def:ValueSetLabel>
        </td>
    </tr>
    <tr>
        <td>
            <def:datafieldcontrol runat="server" id="CMH_rev_immunoimmunizDTap" DatabaseField="CMH_rev_immunoimmunizDTap"  IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="200px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
        </td>
    </tr>
    <tr>
        <td>
            <def:datafieldcontrol runat="server" id="CMH_rev_immunoimmunizIPV" DatabaseField="CMH_rev_immunoimmunizIPV"  IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="200px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
        </td>
    </tr>
    <tr>
        <td>
            <def:datafieldcontrol runat="server" id="CMH_rev_immunoimmunizHIB" DatabaseField="CMH_rev_immunoimmunizHIB"  IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="200px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
        </td>
    </tr>
    <tr>
        <td>
            <def:datafieldcontrol runat="server" id="CMH_rev_immunoimmunizMMR" DatabaseField="CMH_rev_immunoimmunizMMR"  IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="200px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
        </td>
    </tr>
    <tr>
        <td>
            <def:datafieldcontrol runat="server" id="CMH_rev_immunoimmunizHepB" DatabaseField="CMH_rev_immunoimmunizHepB"  IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="200px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
        </td>
    </tr>
    <tr>
        <td>
            <def:datafieldcontrol runat="server" id="CMH_rev_immunoimmunizHepA" DatabaseField="CMH_rev_immunoimmunizHepA"  IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="200px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
        </td>
    </tr>
    <tr>
        <td>
            <def:datafieldcontrol runat="server" id="CMH_rev_immunoimmunizVari" DatabaseField="CMH_rev_immunoimmunizVari"  IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="200px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
        </td>
    </tr>
    <tr>
        <td>
            <def:datafieldcontrol runat="server" id="CMH_rev_immunoimmunizPrev" DatabaseField="CMH_rev_immunoimmunizPrev"  IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="200px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
        </td>
    </tr>
    <tr>
        <td>
            <def:datafieldcontrol runat="server" id="CMH_rev_immunoinfluenzvacc" DatabaseField="CMH_rev_immunoinfluenzvacc"  IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="200px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
        </td>
        <td style="padding-left:20px;padding-top:5px;padding-bottom:5px">
            <def:ValueSetLabel ID="ValueSetLabel_CMH_rev_immunoinfluenzvacc" runat="server"  DatabaseField="CMH_rev_immunoinfluenzvacc"></def:ValueSetLabel>
        </td>
    </tr>
</table>
<table border="0" cellpadding="0" cellspacing="0">
    <tr>
        <td>
        <def:datafieldcontrol runat="server" id="CMH_rev_immunoinfluenzvacc1d" DatabaseField="CMH_rev_immunoinfluenzvacc1d"  IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="155px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
        </td>
        <td style="padding-left:15px">
        <def:datafieldcontrol runat="server" id="CMH_rev_immunoinfluenzvacc1m" DatabaseField="CMH_rev_immunoinfluenzvacc1m"  IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="45px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
        </td>
        <td style="padding-left:15px">
        <def:datafieldcontrol runat="server" id="CMH_rev_immunoinfluenzvacc1y" DatabaseField="CMH_rev_immunoinfluenzvacc1y"  IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="40px" FieldTextBoxWidth="45px"></def:datafieldcontrol>
        </td>
    </tr>
    <tr>
        <td>
        <def:datafieldcontrol runat="server" id="CMH_rev_immunoinfluenzvacc2d" DatabaseField="CMH_rev_immunoinfluenzvacc2d"  IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="155px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
        </td>
        <td style="padding-left:15px">
        <def:datafieldcontrol runat="server" id="CMH_rev_immunoinfluenzvacc2m" DatabaseField="CMH_rev_immunoinfluenzvacc2m"  IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="45px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
        </td>
        <td style="padding-left:15px">
        <def:datafieldcontrol runat="server" id="CMH_rev_immunoinfluenzvacc2y" DatabaseField="CMH_rev_immunoinfluenzvacc2y"  IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="40px" FieldTextBoxWidth="45px"></def:datafieldcontrol>
        </td>
    </tr>
    <tr>
        <td>
        <def:datafieldcontrol runat="server" id="CMH_rev_immunoinfluenzvacc3d" DatabaseField="CMH_rev_immunoinfluenzvacc3d"  IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="155px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
        </td>
        <td style="padding-left:15px">
        <def:datafieldcontrol runat="server" id="CMH_rev_immunoinfluenzvacc3m" DatabaseField="CMH_rev_immunoinfluenzvacc3m"  IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="45px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
        </td>
        <td style="padding-left:15px">
        <def:datafieldcontrol runat="server" id="CMH_rev_immunoinfluenzvacc3y" DatabaseField="CMH_rev_immunoinfluenzvacc3y"  IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="40px" FieldTextBoxWidth="45px"></def:datafieldcontrol>
        </td>
    </tr>
    <tr>
        <td>
        <def:datafieldcontrol runat="server" id="CMH_rev_immunoinfluenzvacc4d" DatabaseField="CMH_rev_immunoinfluenzvacc4d"  IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="155px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
        </td>
        <td style="padding-left:15px">
        <def:datafieldcontrol runat="server" id="CMH_rev_immunoinfluenzvacc4m" DatabaseField="CMH_rev_immunoinfluenzvacc4m"  IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="45px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
        </td>
        <td style="padding-left:15px">
        <def:datafieldcontrol runat="server" id="CMH_rev_immunoinfluenzvacc4y" DatabaseField="CMH_rev_immunoinfluenzvacc4y"  IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="40px" FieldTextBoxWidth="45px"></def:datafieldcontrol>
        </td>
    </tr>
    <tr>
        <td>
        <def:datafieldcontrol runat="server" id="CMH_rev_immunoinfluenzvacc5d" DatabaseField="CMH_rev_immunoinfluenzvacc5d"  IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="155px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
        </td>
        <td style="padding-left:15px">
        <def:datafieldcontrol runat="server" id="CMH_rev_immunoinfluenzvacc5m" DatabaseField="CMH_rev_immunoinfluenzvacc5m"  IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="45px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
        </td>
        <td style="padding-left:15px">
        <def:datafieldcontrol runat="server" id="CMH_rev_immunoinfluenzvacc5y" DatabaseField="CMH_rev_immunoinfluenzvacc5y"  IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="40px" FieldTextBoxWidth="45px"></def:datafieldcontrol>
        </td>
    </tr>
</table>
<def:datafieldcontrol runat="server" id="CMH_comments_misc" DatabaseField="CMH_comments_misc"  IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="200px" FieldTextBoxWidth = "400px" FieldTextBoxHeight = "60px" FieldTextBoxTextMode="MultiLine"></def:datafieldcontrol>
</asp:panel>
<br />
<def:datafieldcontrol runat="server" id="created" DatabaseField="created"  IsReadOnly="true" RenderReadOnlyAsDiv="true"   FieldLabelWidth="300px "></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="createdBy" DatabaseField="createdBy"  IsReadOnly="true" RenderReadOnlyAsDiv="true"   FieldLabelWidth="300px "></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="updated" DatabaseField="updated"  IsReadOnly="true" RenderReadOnlyAsDiv="true"   FieldLabelWidth="300px "></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="updatedBy" DatabaseField="updatedBy"  IsReadOnly="true" RenderReadOnlyAsDiv="true"   FieldLabelWidth="300px "></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="scored" DatabaseField="scored"  IsReadOnly="true" RenderReadOnlyAsDiv="true"   FieldLabelWidth="300px "></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="scoredBy" DatabaseField="scoredBy"  IsReadOnly="true" RenderReadOnlyAsDiv="true"   FieldLabelWidth="300px "></def:datafieldcontrol>
</asp:Content>
