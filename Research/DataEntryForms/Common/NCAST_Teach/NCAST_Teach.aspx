<%@ Register TagPrefix="def" Namespace="DataEntryFramework3" %> 
<%@ Page language="c#" MasterPageFile="~/UWAC.master"  Title="NCAST Data Entry" %>
<asp:Content ID="Content1" ContentPlaceHolderID="oBodyPlaceHolder" runat="server">
<def:dataentrycontroller id="DataEntryController1" runat="server" DatabaseTable="ALL_NCAST_TEACH" >
</def:dataentrycontroller>
<def:datafieldcontrol runat="server" id="id" DatabaseField="id"  IsInsertField="true"   FieldLabelWidth="300px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="indexnum" DatabaseField="indexnum"  IsInsertField="true"   FieldLabelWidth="300px"></def:datafieldcontrol>
<hr />
<i>Information applies to parent only:</i>
<def:datafieldcontrol runat="server" id="NCTETH" DatabaseField="NCTETH"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:ValueSetLabel ID="ValueSetLabel_NCTETH" runat="server"  DatabaseField="NCTETH"></def:ValueSetLabel>
<br />
<def:datafieldcontrol runat="server" id="NCTETO" DatabaseField="NCTETO"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="200px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="NCTMAR" DatabaseField="NCTMAR"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:ValueSetLabel ID="ValueSetLabel_NCTMAR" runat="server"  DatabaseField="NCTMAR"></def:ValueSetLabel>
<br />
<hr />
<def:datafieldcontrol runat="server" id="NCTAGE" DatabaseField="NCTAGE"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="NCTEDU" DatabaseField="NCTEDU"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="200px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="NCTIND" DatabaseField="NCTIND"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:ValueSetLabel ID="ValueSetLabel_NCTIND" runat="server"  DatabaseField="NCTIND"></def:ValueSetLabel>
<br />
<def:datafieldcontrol runat="server" id="NCTIDO" DatabaseField="NCTIDO"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="200px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="NCTMAJ" DatabaseField="NCTMAJ"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:ValueSetLabel ID="ValueSetLabel_NCTMAJ" runat="server"  DatabaseField="NCTMAJ"></def:ValueSetLabel>
<br />
<def:datafieldcontrol runat="server" id="NCTTSK" DatabaseField="NCTTSK"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="200px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="NCTTIM" DatabaseField="NCTTIM"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:ValueSetLabel ID="ValueSetLabel_NCTTIM" runat="server"  DatabaseField="NCTTIM"></def:ValueSetLabel>
<br />
<hr />
<def:datafieldcontrol runat="server" id="NCTSET" DatabaseField="NCTSET"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:ValueSetLabel ID="ValueSetLabel_NCTSET" runat="server"  DatabaseField="NCTSET"></def:ValueSetLabel>
<br />
<def:datafieldcontrol runat="server" id="NCTSTO" DatabaseField="NCTSTO"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="200px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="NCTOTH" DatabaseField="NCTOTH"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:ValueSetLabel ID="ValueSetLabel_NCTOTH" runat="server"  DatabaseField="NCTOTH"></def:ValueSetLabel>
<def:datafieldcontrol runat="server" id="NCTOTO" DatabaseField="NCTOTO"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="200px"></def:datafieldcontrol>
<hr />
<def:datafieldcontrol runat="server" id="NCTCHI" DatabaseField="NCTCHI"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="200px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="NCTCAG" DatabaseField="NCTCAG"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="NCTCSX" DatabaseField="NCTCSX"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:ValueSetLabel ID="ValueSetLabel_NCTCSX" runat="server"  DatabaseField="NCTCSX"></def:ValueSetLabel>
<br />
<def:datafieldcontrol runat="server" id="NCTCBO" DatabaseField="NCTCBO"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:ValueSetLabel ID="ValueSetLabel_NCTCBO" runat="server"  DatabaseField="NCTCBO"></def:ValueSetLabel>
<br />
<def:datafieldcontrol runat="server" id="NCTCST" DatabaseField="NCTCST"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:ValueSetLabel ID="ValueSetLabel_NCTCST" runat="server"  DatabaseField="NCTCST"></def:ValueSetLabel>
<br />
<hr />
<table border="0" cellpadding="10" cellspacing="0">
    <tr>
        <td align="left">
        I. SENSITIVITY TO CUES
        </td>
        <td align="right">
        0=No, 1=Yes, -9=Missing Value
        </td>
    </tr>
    <tr>
    <td colspan="2">
    <def:datafieldcontrol runat="server" id="NCT01" DatabaseField="NCT01"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="500px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
    </td>
    </tr>
    <tr>
    <td colspan="2">
    <def:datafieldcontrol runat="server" id="NCT02" DatabaseField="NCT02"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="500px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
    </td>
    </tr>
    <tr>
    <td colspan="2">
    <def:datafieldcontrol runat="server" id="NCT03" DatabaseField="NCT03"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="500px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
    </td>
    </tr>
    <tr>
    <td colspan="2">
    <def:datafieldcontrol runat="server" id="NCT04" DatabaseField="NCT04"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="500px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
    </td>
    </tr>
    <tr>
    <td colspan="2">
    <def:datafieldcontrol runat="server" id="NCT05" DatabaseField="NCT05"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="500px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
    </td>
    </tr>
    <tr>
    <td colspan="2">
    <def:datafieldcontrol runat="server" id="NCT06" DatabaseField="NCT06"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="500px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
    </td>
    </tr>
    <tr>
    <td colspan="2">
    <def:datafieldcontrol runat="server" id="NCT07" DatabaseField="NCT07"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="500px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
    </td>
    </tr>
    <tr>
    <td colspan="2">
    <def:datafieldcontrol runat="server" id="NCT08" DatabaseField="NCT08"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="500px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
    </td>
    </tr>
    <tr>
    <td colspan="2">
    <def:datafieldcontrol runat="server" id="NCT09" DatabaseField="NCT09"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="500px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
    </td>
    </tr>
    <tr>
    <td colspan="2">
    <def:datafieldcontrol runat="server" id="NCT10" DatabaseField="NCT10"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="500px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
    </td>
    </tr>
    <tr>
    <td colspan="2">
    <def:datafieldcontrol runat="server" id="NCT11" DatabaseField="NCT11"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="500px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
    </td>
    </tr>
    <tr>
    <td align="left">
    II. RESPONSE TO CHILD'S DISTRESS
    </td>
    <td align="right">
    0=No, 1=Yes, -9=Missing Value
    </td>
    </tr>
    <tr>
    <td colspan="2">
    <i><def:datafieldcontrol runat="server" id="NCTPD" DatabaseField="NCTPD"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="500px" FieldTextBoxWidth="30px"></def:datafieldcontrol></i>
    </td>
    </tr>
    <tr>
    <td colspan="2">
    <def:datafieldcontrol runat="server" id="NCT12" DatabaseField="NCT12"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="500px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
    </td>
    </tr>
    <tr>
    <td colspan="2">
    <def:datafieldcontrol runat="server" id="NCT13" DatabaseField="NCT13"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="500px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
    </td>
    </tr>
    <tr>
    <td colspan="2">
    <def:datafieldcontrol runat="server" id="NCT14" DatabaseField="NCT14"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="500px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
    </td>
    </tr>
    <tr>
    <td colspan="2">
    <def:datafieldcontrol runat="server" id="NCT15" DatabaseField="NCT15"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="500px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
    </td>
    </tr>
    <tr>
    <td colspan="2">
    <def:datafieldcontrol runat="server" id="NCT16" DatabaseField="NCT16"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="500px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
    </td>
    </tr>
    <tr>
    <td colspan="2">
    <def:datafieldcontrol runat="server" id="NCT17" DatabaseField="NCT17"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="500px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
    </td>
    </tr>
    <tr>
    <td colspan="2">
    <def:datafieldcontrol runat="server" id="NCT18" DatabaseField="NCT18"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="500px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
    </td>
    </tr>
    <tr>
    <td colspan="2">
    <def:datafieldcontrol runat="server" id="NCT19" DatabaseField="NCT19"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="500px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
    </td>
    </tr>
    <tr>
    <td colspan="2">
    <def:datafieldcontrol runat="server" id="NCT20" DatabaseField="NCT20"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="500px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
    </td>
    </tr>
    <tr>
    <td colspan="2">
    <def:datafieldcontrol runat="server" id="NCT21" DatabaseField="NCT21"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="500px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
    </td>
    </tr>
    <tr>
    <td colspan="2">
    <def:datafieldcontrol runat="server" id="NCT22" DatabaseField="NCT22"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="500px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
    </td>
    </tr>
    <tr>
    <td align="left">
    III. SOCIAL-EMOTIONAL GROWTH FOSTERING
    </td>
    <td align="right">
    0=No, 1=Yes, -9=Missing Value
    </td>
    </tr>
    <tr>
    <td colspan="2">
    <def:datafieldcontrol runat="server" id="NCT23" DatabaseField="NCT23"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="500px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
    </td>
    </tr>
    <tr>
    <td colspan="2">
    <def:datafieldcontrol runat="server" id="NCT24" DatabaseField="NCT24"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="500px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
    </td>
    </tr>
    <tr>
    <td colspan="2">
    <def:datafieldcontrol runat="server" id="NCT25" DatabaseField="NCT25"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="500px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
    </td>
    </tr>
    <tr>
    <td colspan="2">
    <def:datafieldcontrol runat="server" id="NCT26" DatabaseField="NCT26"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="500px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
    </td>
    </tr>
    <tr>
    <td colspan="2">
    <def:datafieldcontrol runat="server" id="NCT27" DatabaseField="NCT27"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="500px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
    </td>
    </tr>
    <tr>
    <td colspan="2">
    <def:datafieldcontrol runat="server" id="NCT28" DatabaseField="NCT28"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="500px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
    </td>
    </tr>
    <tr>
    <td colspan="2">
    <def:datafieldcontrol runat="server" id="NCT29" DatabaseField="NCT29"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="500px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
    </td>
    </tr>
    <tr>
    <td colspan="2">
    <def:datafieldcontrol runat="server" id="NCT30" DatabaseField="NCT30"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="500px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
    </td>
    </tr>
    <tr>
    <td colspan="2">
    <def:datafieldcontrol runat="server" id="NCT31" DatabaseField="NCT31"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="500px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
    </td>
    </tr>
    <tr>
    <td colspan="2">
    <def:datafieldcontrol runat="server" id="NCT32" DatabaseField="NCT32"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="500px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
    </td>
    </tr>
    <tr>
    <td colspan="2">
    <def:datafieldcontrol runat="server" id="NCT33" DatabaseField="NCT33"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="500px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
    </td>
    </tr>
    <tr>
    <td align="left">
    IV. COGNITIVE GROWTH FOSTERING
    </td>
    <td align="right">
    0=No, 1=Yes, -9=Missing Value
    </td>
    </tr>
    <tr>
    <td colspan="2">
    <def:datafieldcontrol runat="server" id="NCT34" DatabaseField="NCT34"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="500px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
    </td>
    </tr>
    <tr>
    <td colspan="2">
    <def:datafieldcontrol runat="server" id="NCT35" DatabaseField="NCT35"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="500px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
    </td>
    </tr>
    <tr>
    <td colspan="2">
    <def:datafieldcontrol runat="server" id="NCT36" DatabaseField="NCT36"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="500px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
    </td>
    </tr>
    <tr>
    <td colspan="2">
    <def:datafieldcontrol runat="server" id="NCT37" DatabaseField="NCT37"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="500px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
    </td>
    </tr>
    <tr>
    <td colspan="2">
    <def:datafieldcontrol runat="server" id="NCT38" DatabaseField="NCT38"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="500px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
    </td>
    </tr>
    <tr>
    <td colspan="2">
    <def:datafieldcontrol runat="server" id="NCT39" DatabaseField="NCT39"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="500px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
    </td>
    </tr>
    <tr>
    <td colspan="2">
    <def:datafieldcontrol runat="server" id="NCT40" DatabaseField="NCT40"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="500px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
    </td>
    </tr>
    <tr>
    <td colspan="2">
    <def:datafieldcontrol runat="server" id="NCT41" DatabaseField="NCT41"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="500px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
    </td>
    </tr>
    <tr>
    <td colspan="2">
    <def:datafieldcontrol runat="server" id="NCT42" DatabaseField="NCT42"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="500px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
    </td>
    </tr>
    <tr>
    <td colspan="2">
    <def:datafieldcontrol runat="server" id="NCT43" DatabaseField="NCT43"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="500px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
    </td>
    </tr>
    <tr>
    <td colspan="2">
    <def:datafieldcontrol runat="server" id="NCT44" DatabaseField="NCT44"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="500px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
    </td>
    </tr>
    <tr>
    <td colspan="2">
    <def:datafieldcontrol runat="server" id="NCT45" DatabaseField="NCT45"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="500px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
    </td>
    </tr>
    <tr>
    <td colspan="2">
    <def:datafieldcontrol runat="server" id="NCT46" DatabaseField="NCT46"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="500px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
    </td>
    </tr>
    <tr>
    <td colspan="2">
    <def:datafieldcontrol runat="server" id="NCT47" DatabaseField="NCT47"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="500px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
    </td>
    </tr>
    <tr>
    <td colspan="2">
    <def:datafieldcontrol runat="server" id="NCT48" DatabaseField="NCT48"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="500px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
    </td>
    </tr>
    <tr>
    <td colspan="2">
    <def:datafieldcontrol runat="server" id="NCT49" DatabaseField="NCT49"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="500px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
    </td>
    </tr>
    <tr>
    <td colspan="2">
    <def:datafieldcontrol runat="server" id="NCT50" DatabaseField="NCT50"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="500px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
    </td>
    </tr>
    <tr>
    <td align="left">
    V. CLARITY OF CUES
    </td>
    <td align="right">
    0=No, 1=Yes, -9=Missing Value
    </td>
    </tr>
    <tr>
    <td colspan="2">
    <def:datafieldcontrol runat="server" id="NCT51" DatabaseField="NCT51"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="500px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
    </td>
    </tr>
    <tr>
    <td colspan="2">
    <def:datafieldcontrol runat="server" id="NCT52" DatabaseField="NCT52"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="500px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
    </td>
    </tr>
    <tr>
    <td colspan="2">
    <def:datafieldcontrol runat="server" id="NCT53" DatabaseField="NCT53"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="500px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
    </td>
    </tr>
    <tr>
    <td colspan="2">
    <def:datafieldcontrol runat="server" id="NCT54" DatabaseField="NCT54"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="500px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
    </td>
    </tr>
    <tr>
    <td colspan="2">
    <def:datafieldcontrol runat="server" id="NCT55" DatabaseField="NCT55"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="500px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
    </td>
    </tr>
    <tr>
    <td colspan="2">
    <def:datafieldcontrol runat="server" id="NCT56" DatabaseField="NCT56"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="500px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
    </td>
    </tr>
    <tr>
    <td colspan="2">
    <def:datafieldcontrol runat="server" id="NCT57" DatabaseField="NCT57"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="500px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
    </td>
    </tr>
    <tr>
    <td colspan="2">
    <def:datafieldcontrol runat="server" id="NCT58" DatabaseField="NCT58"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="500px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
    </td>
    </tr>
    <tr>
    <td colspan="2">
    <def:datafieldcontrol runat="server" id="NCT59" DatabaseField="NCT59"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="500px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
    </td>
    </tr>
    <tr>
    <td colspan="2">
    <def:datafieldcontrol runat="server" id="NCT60" DatabaseField="NCT60"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="500px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
    </td>
    </tr>
    <tr>
    <td align="left">
    VI. RESPONSIVENESS TO CAREGIVER
    </td>
    <td align="right">
    0=No, 1=Yes, -9=Missing Value
    </td>
    </tr>
    <tr>
    <td colspan="2">
    <def:datafieldcontrol runat="server" id="NCT61" DatabaseField="NCT61"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="500px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
    </td>
    </tr>
    <tr>
    <td colspan="2">
    <def:datafieldcontrol runat="server" id="NCT62" DatabaseField="NCT62"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="500px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
    </td>
    </tr>
    <tr>
    <td colspan="2">
    <def:datafieldcontrol runat="server" id="NCT63" DatabaseField="NCT63"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="500px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
    </td>
    </tr>
    <tr>
    <td colspan="2">
    <def:datafieldcontrol runat="server" id="NCT64" DatabaseField="NCT64"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="500px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
    </td>
    </tr>
    <tr>
    <td colspan="2">
    <def:datafieldcontrol runat="server" id="NCT65" DatabaseField="NCT65"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="500px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
    </td>
    </tr>
    <tr>
    <td colspan="2">
    <def:datafieldcontrol runat="server" id="NCT66" DatabaseField="NCT66"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="500px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
    </td>
    </tr>
    <tr>
    <td colspan="2">
    <def:datafieldcontrol runat="server" id="NCT67" DatabaseField="NCT67"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="500px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
    </td>
    </tr>
    <tr>
    <td colspan="2">
    <def:datafieldcontrol runat="server" id="NCT68" DatabaseField="NCT68"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="500px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
    </td>
    </tr>
    <tr>
    <td colspan="2">
    <def:datafieldcontrol runat="server" id="NCT69" DatabaseField="NCT69"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="500px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
    </td>
    </tr>
    <tr>
    <td colspan="2">
    <def:datafieldcontrol runat="server" id="NCT70" DatabaseField="NCT70"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="500px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
    </td>
    </tr>
    <tr>
    <td colspan="2">
    <def:datafieldcontrol runat="server" id="NCT71" DatabaseField="NCT71"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="500px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
    </td>
    </tr>
    <tr>
    <td colspan="2">
    <def:datafieldcontrol runat="server" id="NCT72" DatabaseField="NCT72"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="500px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
    </td>
    </tr>
    <tr>
    <td colspan="2">
    <def:datafieldcontrol runat="server" id="NCT73" DatabaseField="NCT73"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="500px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
    </td>
    </tr>
</table>
<hr />
Enter the total yes answers from each subscale and compare it with the possible score:
<table border="0" cellpadding="10" cellspacing="0">
<tr>
<td align="right">
Subscale Items
</td>
<td align="right">
Contingency Items
</td>
</tr>
<tr>
<td>
<def:datafieldcontrol runat="server" id="NCTSENS" DatabaseField="NCTSENS"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="310px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
</td>
<td>
<def:datafieldcontrol runat="server" id="NCTSENC" DatabaseField="NCTSENC"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="50px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
</td>
</tr>
<tr>
<td>
<def:datafieldcontrol runat="server" id="NCTDISS" DatabaseField="NCTDISS"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="310px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
</td>
<td>
<def:datafieldcontrol runat="server" id="NCTDISC" DatabaseField="NCTDISC"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="50px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
</td>
</tr>
<tr>
<td>
<def:datafieldcontrol runat="server" id="NCTSGFS" DatabaseField="NCTSGFS"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="310px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
</td>
<td>
<def:datafieldcontrol runat="server" id="NCTSGFC" DatabaseField="NCTSGFC"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="50px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
</td>
</tr>
<tr>
<td>
<def:datafieldcontrol runat="server" id="NCTCGFS" DatabaseField="NCTCGFS"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="310px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
</td>
<td>
<def:datafieldcontrol runat="server" id="NCTCGFC" DatabaseField="NCTCGFC"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="50px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
</td>
</tr>
<tr>
<td>
<def:datafieldcontrol runat="server" id="NCTCGTS" DatabaseField="NCTCGTS"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="310px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
</td>
<td>
<def:datafieldcontrol runat="server" id="NCTCGTC" DatabaseField="NCTCGTC"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="50px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
</td>
</tr>
<tr>
<td>
<def:datafieldcontrol runat="server" id="NCTCLAS" DatabaseField="NCTCLAS"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="310px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
</td>
<td>
<def:datafieldcontrol runat="server" id="NCTCLAC" DatabaseField="NCTCLAC"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="50px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
</td>
</tr>
<tr>
<td>
<def:datafieldcontrol runat="server" id="NCTCARS" DatabaseField="NCTCARS"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="310px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
</td>
<td>
<def:datafieldcontrol runat="server" id="NCTCARC" DatabaseField="NCTCARC"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="50px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
</td>
</tr>
<tr>
<td>
<def:datafieldcontrol runat="server" id="NCTCHTS" DatabaseField="NCTCHTS"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="310px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
</td>
<td>
<def:datafieldcontrol runat="server" id="NCTCHTC" DatabaseField="NCTCHTC"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="50px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
</td>
</tr>
<tr>
<td>
<def:datafieldcontrol runat="server" id="NCTBOTS" DatabaseField="NCTBOTS"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="310px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
</td>
<td>
<def:datafieldcontrol runat="server" id="NCTBOTC" DatabaseField="NCTBOTC"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="50px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
</td>
</tr>
</table>
<hr />
Place a 1 for the Potent Disengagement Cues (PDC's) observed during the teaching interaction (excluding PDC's that terminate the teaching or occur after the caregiver has terminated the teaching).  Otherwise, mark 0.
<table border="0" cellpadding="10" cellspacing="0">
<tr>
<td align="right">
0=No, 1=Yes, -9=Missing Value
</td>
<td align="right">
0=No, 1=Yes, -9=Missing Value
</td>
</tr>
<tr>
<td>
<def:datafieldcontrol runat="server" id="NCTPDBA" DatabaseField="NCTPDBA"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="200px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="NCTPDCH" DatabaseField="NCTPDCH"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="200px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="NCTPDCO" DatabaseField="NCTPDCO"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="200px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="NCTPDCW" DatabaseField="NCTPDCW"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="200px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="NCTPDCR" DatabaseField="NCTPDCR"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="200px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="NCTPDCY" DatabaseField="NCTPDCY"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="200px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="NCTPDFU" DatabaseField="NCTPDFU"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="200px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="NCTPDHA" DatabaseField="NCTPDHA"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="200px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="NCTPDSH" DatabaseField="NCTPDSH"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="200px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="NCTPDAV" DatabaseField="NCTPDAV"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="200px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="NCTPDBE" DatabaseField="NCTPDBE"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="200px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
</td>
<td>
<def:datafieldcontrol runat="server" id="NCTPDSK" DatabaseField="NCTPDSK"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="200px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="NCTPDPL" DatabaseField="NCTPDPL"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="200px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="NCTPDPU" DatabaseField="NCTPDPU"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="200px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="NCTPDNO" DatabaseField="NCTPDNO"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="200px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="NCTPDSP" DatabaseField="NCTPDSP"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="200px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="NCTPDUP" DatabaseField="NCTPDUP"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="200px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="NCTPDPO" DatabaseField="NCTPDPO"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="200px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="NCTPDVO" DatabaseField="NCTPDVO"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="200px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="NCTPDWA" DatabaseField="NCTPDWA"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="200px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="NCTPDWH" DatabaseField="NCTPDWH"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="200px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="NCTPDWD" DatabaseField="NCTPDWD"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="200px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
</td>
</tr>
</table>
<hr />  
<def:datafieldcontrol runat="server" id="NCTCLIN" DatabaseField="NCTCLIN"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="100px" FieldTextBoxWidth = "500px" FieldTextBoxHeight = "100px" FieldTextBoxTextMode="MultiLine"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="NCTDATE" DatabaseField="NCTDATE"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px "></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="NCTRECD" DatabaseField="NCTRECD"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px "></def:datafieldcontrol>

<def:datafieldcontrol runat="server" id="created" DatabaseField="created"  IsReadOnly="true" RenderReadOnlyAsDiv="true"   FieldLabelWidth="300px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="createdBy" DatabaseField="createdBy"  IsReadOnly="true" RenderReadOnlyAsDiv="true"   FieldLabelWidth="300px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="updated" DatabaseField="updated"  IsReadOnly="true" RenderReadOnlyAsDiv="true"   FieldLabelWidth="300px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="updatedBy" DatabaseField="updatedBy"  IsReadOnly="true" RenderReadOnlyAsDiv="true"   FieldLabelWidth="300px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="scored" DatabaseField="scored"  IsReadOnly="true" RenderReadOnlyAsDiv="true"   FieldLabelWidth="300px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="scoredBy" DatabaseField="scoredBy"  IsReadOnly="true" RenderReadOnlyAsDiv="true"   FieldLabelWidth="300px"></def:datafieldcontrol>
</asp:Content>
