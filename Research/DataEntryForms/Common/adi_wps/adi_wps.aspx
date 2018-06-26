<%@ Register TagPrefix="def" Namespace="DataEntryFramework3" %> 
<%@ Page language="c#" Inherits="DataEntryForms_Common_adi_wps_adi_wps" CodeFile="adi_wps.aspx.cs" MasterPageFile="~/UWAC.master"  Title="ADI_WPS Data Entry" %>

<asp:Content ID="Content1" ContentPlaceHolderID="oBodyPlaceHolder" runat="server">
<def:dataentrycontroller id="DataEntryController1" runat="server" DatabaseTable="ALL_ADI_WPS" PrimaryKeyField="adi_pk">
</def:dataentrycontroller>
<asp:HyperLink id="hlnkReport" runat="server" Text="Click to View Scoring Summary (opens in new window)" Target="_blank"></asp:HyperLink>
<br />
<def:datafieldcontrol runat="server" id="ID" DatabaseField="ID"  IsInsertField="true"   FieldLabelWidth="200px "></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="indexnum" DatabaseField="indexnum" IsInsertField="true" FieldLabelWidth="200px "></def:datafieldcontrol>
    <asp:panel id="mainPanel" runat="server">
<def:ValueSetLabel ID="ValueSetLabel_adrelat" runat="server"  DatabaseField="adrelat"></def:ValueSetLabel>
<table cellpadding=0 cellspacing=0 border=0>
  <tr>
    <td style="vertical-align:top">
      <def:datafieldcontrol runat="server" id="adrelat" DatabaseField="adrelat"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="200px "></def:datafieldcontrol>
      <def:datafieldcontrol runat="server" id="addate" DatabaseField="addate"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="200px "></def:datafieldcontrol>
      <def:datafieldcontrol runat="server" id="adint" DatabaseField="adint"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="200px "></def:datafieldcontrol>
      <def:datafieldcontrol runat="server" id="ADIreliabilityDateDone" DatabaseField="ADIreliabilityDateDone"  IsEntryField="true" IsEntryValueRequired="False" IsDoubleEntryField="False" FieldLabelWidth="200px "></def:datafieldcontrol>
    </td>
    <td style="padding-left: 50px" style="vertical-align:top">
      <def:datafieldcontrol runat="server" id="adDOB" DatabaseField="adDOB"  IsEntryField="false"  IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" RenderReadOnlyAsDiv="True" FieldLabelWidth="100px "></def:datafieldcontrol>
      <def:datafieldcontrol runat="server" id="aDagemos" DatabaseField="aDagemos"  IsEntryField="false"  IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" RenderReadOnlyAsDiv="True" FieldLabelWidth="100px "></def:datafieldcontrol>
      <def:datafieldcontrol runat="server" id="aDageym" DatabaseField="aDageym"  IsEntryField="false"  IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" RenderReadOnlyAsDiv="True" FieldLabelWidth="100px "></def:datafieldcontrol>
      <def:datafieldcontrol runat="server" id="adsex" DatabaseField="adsex"  IsEntryField="false"  IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" RenderReadOnlyAsDiv="True" FieldLabelWidth="100px "></def:datafieldcontrol>
    </td>
  </tr>
</table>
<br/>
<table cellpadding=0 cellspacing=0 border=1>
    <td style="padding-left: 5px" style="vertical-align:top">
      <def:datafieldcontrol runat="server" id="adialgvers" DatabaseField="adialgvers"  IsEntryField="false"  IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" RenderReadOnlyAsDiv="True" FieldLabelWidth="150px" FieldTextBoxWidth="200px"></def:datafieldcontrol>
      <def:datafieldcontrol runat="server" id="socialsum" DatabaseField="ADIsoc"  IsEntryField="false"  IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" RenderReadOnlyAsDiv="True" FieldLabelWidth="150px "></def:datafieldcontrol>
      <def:datafieldcontrol runat="server" id="commsum" DatabaseField="ADIcom"  IsEntryField="false"  IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" RenderReadOnlyAsDiv="True" FieldLabelWidth="150px "></def:datafieldcontrol>
      <def:datafieldcontrol runat="server" id="commlevel" DatabaseField="ADIcomlevel"  IsEntryField="false"  IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" RenderReadOnlyAsDiv="True" FieldLabelWidth="150px "></def:datafieldcontrol>
      <def:datafieldcontrol runat="server" id="repetsum" DatabaseField="ADIrep"  IsEntryField="false"  IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" RenderReadOnlyAsDiv="True" FieldLabelWidth="150px "></def:datafieldcontrol>
    <b>  <def:datafieldcontrol runat="server" id="adidx" DatabaseField="adidx"  IsEntryField="false"  IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" RenderReadOnlyAsDiv="True" FieldLabelWidth="150px "></def:datafieldcontrol>
    </b>
    </td>
    <td style="padding-left: 5px" style="vertical-align:top">
      <def:datafieldcontrol runat="server" id="adialgverscur" DatabaseField="adialgverscur"  IsEntryField="false"  IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" RenderReadOnlyAsDiv="True" FieldLabelWidth="180px " FieldTextBoxWidth="200px"></def:datafieldcontrol>
      <def:datafieldcontrol runat="server" id="adisoccur" DatabaseField="adisoccur"  IsEntryField="false"  IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" RenderReadOnlyAsDiv="True" FieldLabelWidth="180px "></def:datafieldcontrol>
      <def:datafieldcontrol runat="server" id="adicomcur" DatabaseField="adicomcur"  IsEntryField="false"  IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" RenderReadOnlyAsDiv="True" FieldLabelWidth="180px "></def:datafieldcontrol>
      <def:datafieldcontrol runat="server" id="adicomcur_lev" DatabaseField="adicomcur_lev"  IsEntryField="false"  IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" RenderReadOnlyAsDiv="True" FieldLabelWidth="180px "></def:datafieldcontrol>
      <def:datafieldcontrol runat="server" id="adirepcur" DatabaseField="adirepcur"  IsEntryField="false"  IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" RenderReadOnlyAsDiv="True" FieldLabelWidth="180px "></def:datafieldcontrol>
    </td>
</table>
<br />
<br />
<blockquote><strong>If an item is missing entirely, enter 9 or 999 according to the question.</strong></blockquote>
<table cellpadding="0" cellspacing="0" border="0">
<tr>
<td style="vertical-align:top">
<def:datafieldcontrol runat="server" id="ad002" DatabaseField="ad002"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="200px" FieldTextBoxWidth="50px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="ad004" DatabaseField="ad004"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="200px" FieldTextBoxWidth="50px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="ad005" DatabaseField="ad005"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="200px" FieldTextBoxWidth="50px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="ad006" DatabaseField="ad006"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="200px" FieldTextBoxWidth="50px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="ad007" DatabaseField="ad007"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="200px" FieldTextBoxWidth="50px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="ad008" DatabaseField="ad008"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="200px" FieldTextBoxWidth="50px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="ad009" DatabaseField="ad009"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="200px" FieldTextBoxWidth="50px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="ad010" DatabaseField="ad010"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="200px" FieldTextBoxWidth="50px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="ad011ev" DatabaseField="ad011ev"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="200px" FieldTextBoxWidth="50px" CallOnBlur="adi_wps_onBlur"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="ad012ev" DatabaseField="ad012ev"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="200px" FieldTextBoxWidth="50px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="ad013ev" DatabaseField="ad013ev"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="200px" FieldTextBoxWidth="50px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="ad014ev" DatabaseField="ad014ev"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="200px" FieldTextBoxWidth="50px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="ad015ev" DatabaseField="ad015ev"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="200px" FieldTextBoxWidth="50px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="ad016ev" DatabaseField="ad016ev"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="200px" FieldTextBoxWidth="50px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="ad017" DatabaseField="ad017"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="200px" FieldTextBoxWidth="50px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="ad018ev" DatabaseField="ad018ev"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="200px" FieldTextBoxWidth="50px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="ad019" DatabaseField="ad019"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="200px" FieldTextBoxWidth="50px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="ad020ev" DatabaseField="ad020ev"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="200px" FieldTextBoxWidth="50px" CallOnBlur="adi_wps_onBlur"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="ad021ev" DatabaseField="ad021ev"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="200px" FieldTextBoxWidth="50px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="ad022ev" DatabaseField="ad022ev"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="200px" FieldTextBoxWidth="50px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="ad023ev" DatabaseField="ad023ev"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="200px" FieldTextBoxWidth="50px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="ad024ev" DatabaseField="ad024ev"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="200px" FieldTextBoxWidth="50px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="ad025ev" DatabaseField="ad025ev"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="200px" FieldTextBoxWidth="50px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="ad026" DatabaseField="ad026"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="200px" FieldTextBoxWidth="50px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="ad027ev" DatabaseField="ad027ev"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="200px" FieldTextBoxWidth="50px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="ad028" DatabaseField="ad028"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="200px" FieldTextBoxWidth="50px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="ad029cu" DatabaseField="ad029cu"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="200px" FieldTextBoxWidth="50px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="ad029mo" DatabaseField="ad029mo"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="200px" FieldTextBoxWidth="50px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="ad030cu" DatabaseField="ad030cu"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="200px" FieldTextBoxWidth="50px" CallOnBlur="adi_wps_onBlur"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="ad031cu" DatabaseField="ad031cu"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="200px" FieldTextBoxWidth="50px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="ad031ev" DatabaseField="ad031ev"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="200px" FieldTextBoxWidth="50px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="ad032cu" DatabaseField="ad032cu"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="200px" FieldTextBoxWidth="50px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="ad032at" DatabaseField="ad032at"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="200px" FieldTextBoxWidth="50px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="ad033cu" DatabaseField="ad033cu"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="200px" FieldTextBoxWidth="50px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="ad033ev" DatabaseField="ad033ev"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="200px" FieldTextBoxWidth="50px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="ad034cu" DatabaseField="ad034cu"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="200px" FieldTextBoxWidth="50px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="ad034ev" DatabaseField="ad034ev"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="200px" FieldTextBoxWidth="50px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="ad035cu" DatabaseField="ad035cu"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="200px" FieldTextBoxWidth="50px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="ad035ev" DatabaseField="ad035ev"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="200px" FieldTextBoxWidth="50px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="ad036cu" DatabaseField="ad036cu"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="200px" FieldTextBoxWidth="50px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="ad036ev" DatabaseField="ad036ev"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="200px" FieldTextBoxWidth="50px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="ad037cu" DatabaseField="ad037cu"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="200px" FieldTextBoxWidth="50px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="ad037ev" DatabaseField="ad037ev"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="200px" FieldTextBoxWidth="50px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="ad038cu" DatabaseField="ad038cu"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="200px" FieldTextBoxWidth="50px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="ad038ev" DatabaseField="ad038ev"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="200px" FieldTextBoxWidth="50px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="ad039cu" DatabaseField="ad039cu"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="200px" FieldTextBoxWidth="50px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="ad039ev" DatabaseField="ad039ev"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="200px" FieldTextBoxWidth="50px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="ad040cu" DatabaseField="ad040cu"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="200px" FieldTextBoxWidth="50px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="ad040ev" DatabaseField="ad040ev"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="200px" FieldTextBoxWidth="50px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="ad041cu" DatabaseField="ad041cu"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="200px" FieldTextBoxWidth="50px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="ad041at" DatabaseField="ad041at"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="200px" FieldTextBoxWidth="50px"></def:datafieldcontrol>
</td>
<td style="padding-left: 50px" style="vertical-align:top">
<def:datafieldcontrol runat="server" id="ad042cu" DatabaseField="ad042cu"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="200px" FieldTextBoxWidth="50px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="ad042mo" DatabaseField="ad042mo"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="200px" FieldTextBoxWidth="50px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="ad043cu" DatabaseField="ad043cu"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="200px" FieldTextBoxWidth="50px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="ad043mo" DatabaseField="ad043mo"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="200px" FieldTextBoxWidth="50px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="ad044cu" DatabaseField="ad044cu"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="200px" FieldTextBoxWidth="50px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="ad044mo" DatabaseField="ad044mo"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="200px" FieldTextBoxWidth="50px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="ad045cu" DatabaseField="ad045cu"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="200px" FieldTextBoxWidth="50px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="ad045mo" DatabaseField="ad045mo"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="200px" FieldTextBoxWidth="50px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="ad046cu" DatabaseField="ad046cu"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="200px" FieldTextBoxWidth="50px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="ad046mo" DatabaseField="ad046mo"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="200px" FieldTextBoxWidth="50px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="ad047cu" DatabaseField="ad047cu"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="200px" FieldTextBoxWidth="50px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="ad047mo" DatabaseField="ad047mo"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="200px" FieldTextBoxWidth="50px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="ad048cu" DatabaseField="ad048cu"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="200px" FieldTextBoxWidth="50px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="ad048mo" DatabaseField="ad048mo"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="200px" FieldTextBoxWidth="50px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="ad049cu" DatabaseField="ad049cu"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="200px" FieldTextBoxWidth="50px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="ad049mo" DatabaseField="ad049mo"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="200px" FieldTextBoxWidth="50px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="ad050cu" DatabaseField="ad050cu"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="200px" FieldTextBoxWidth="50px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="ad050mo" DatabaseField="ad050mo"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="200px" FieldTextBoxWidth="50px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="ad051cu" DatabaseField="ad051cu"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="200px" FieldTextBoxWidth="50px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="ad051mo" DatabaseField="ad051mo"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="200px" FieldTextBoxWidth="50px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="ad052cu" DatabaseField="ad052cu"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="200px" FieldTextBoxWidth="50px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="ad052mo" DatabaseField="ad052mo"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="200px" FieldTextBoxWidth="50px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="ad053cu" DatabaseField="ad053cu"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="200px" FieldTextBoxWidth="50px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="ad053mo" DatabaseField="ad053mo"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="200px" FieldTextBoxWidth="50px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="ad054cu" DatabaseField="ad054cu"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="200px" FieldTextBoxWidth="50px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="ad054mo" DatabaseField="ad054mo"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="200px" FieldTextBoxWidth="50px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="ad055cu" DatabaseField="ad055cu"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="200px" FieldTextBoxWidth="50px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="ad055mo" DatabaseField="ad055mo"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="200px" FieldTextBoxWidth="50px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="ad056cu" DatabaseField="ad056cu"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="200px" FieldTextBoxWidth="50px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="ad056mo" DatabaseField="ad056mo"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="200px" FieldTextBoxWidth="50px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="ad057cu" DatabaseField="ad057cu"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="200px" FieldTextBoxWidth="50px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="ad057mo" DatabaseField="ad057mo"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="200px" FieldTextBoxWidth="50px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="ad058cu" DatabaseField="ad058cu"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="200px" FieldTextBoxWidth="50px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="ad058ev" DatabaseField="ad058ev"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="200px" FieldTextBoxWidth="50px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="ad059cu" DatabaseField="ad059cu"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="200px" FieldTextBoxWidth="50px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="ad059mo" DatabaseField="ad059mo"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="200px" FieldTextBoxWidth="50px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="ad060cu" DatabaseField="ad060cu"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="200px" FieldTextBoxWidth="50px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="ad060mo" DatabaseField="ad060mo"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="200px" FieldTextBoxWidth="50px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="ad061cu" DatabaseField="ad061cu"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="200px" FieldTextBoxWidth="50px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="ad061mo" DatabaseField="ad061mo"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="200px" FieldTextBoxWidth="50px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="ad062cu" DatabaseField="ad062cu"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="200px" FieldTextBoxWidth="50px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="ad062mo" DatabaseField="ad062mo"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="200px" FieldTextBoxWidth="50px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="ad063cu" DatabaseField="ad063cu"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="200px" FieldTextBoxWidth="50px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="ad063mo" DatabaseField="ad063mo"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="200px" FieldTextBoxWidth="50px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="ad064cu" DatabaseField="ad064cu"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="200px" FieldTextBoxWidth="50px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="ad064mo" DatabaseField="ad064mo"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="200px" FieldTextBoxWidth="50px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="ad065cu" DatabaseField="ad065cu"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="200px" FieldTextBoxWidth="50px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="ad065mo" DatabaseField="ad065mo"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="200px" FieldTextBoxWidth="50px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="ad066cu" DatabaseField="ad066cu"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="200px" FieldTextBoxWidth="50px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="ad066mo" DatabaseField="ad066mo"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="200px" FieldTextBoxWidth="50px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="ad067cu" DatabaseField="ad067cu"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="200px" FieldTextBoxWidth="50px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="ad067ev" DatabaseField="ad067ev"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="200px" FieldTextBoxWidth="50px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="ad068cu" DatabaseField="ad068cu"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="200px" FieldTextBoxWidth="50px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="ad068ev" DatabaseField="ad068ev"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="200px" FieldTextBoxWidth="50px"></def:datafieldcontrol>
</td>
<td style="padding-left: 50px" style="vertical-align:top">
<def:datafieldcontrol runat="server" id="ad069cu" DatabaseField="ad069cu"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="200px" FieldTextBoxWidth="50px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="ad069ev" DatabaseField="ad069ev"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="200px" FieldTextBoxWidth="50px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="ad070cu" DatabaseField="ad070cu"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="200px" FieldTextBoxWidth="50px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="ad070ev" DatabaseField="ad070ev"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="200px" FieldTextBoxWidth="50px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="ad071cu" DatabaseField="ad071cu"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="200px" FieldTextBoxWidth="50px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="ad071ev" DatabaseField="ad071ev"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="200px" FieldTextBoxWidth="50px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="ad072cu" DatabaseField="ad072cu"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="200px" FieldTextBoxWidth="50px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="ad072ev" DatabaseField="ad072ev"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="200px" FieldTextBoxWidth="50px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="ad073cu" DatabaseField="ad073cu"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="200px" FieldTextBoxWidth="50px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="ad073ev" DatabaseField="ad073ev"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="200px" FieldTextBoxWidth="50px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="ad074cu" DatabaseField="ad074cu"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="200px" FieldTextBoxWidth="50px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="ad074ev" DatabaseField="ad074ev"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="200px" FieldTextBoxWidth="50px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="ad075cu" DatabaseField="ad075cu"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="200px" FieldTextBoxWidth="50px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="ad075ev" DatabaseField="ad075ev"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="200px" FieldTextBoxWidth="50px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="ad076cu" DatabaseField="ad076cu"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="200px" FieldTextBoxWidth="50px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="ad076ev" DatabaseField="ad076ev"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="200px" FieldTextBoxWidth="50px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="ad077cu" DatabaseField="ad077cu"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="200px" FieldTextBoxWidth="50px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="ad077ev" DatabaseField="ad077ev"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="200px" FieldTextBoxWidth="50px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="ad078cu" DatabaseField="ad078cu"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="200px" FieldTextBoxWidth="50px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="ad078ev" DatabaseField="ad078ev"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="200px" FieldTextBoxWidth="50px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="ad079cu" DatabaseField="ad079cu"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="200px" FieldTextBoxWidth="50px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="ad079ev" DatabaseField="ad079ev"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="200px" FieldTextBoxWidth="50px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="ad080cu" DatabaseField="ad080cu"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="200px" FieldTextBoxWidth="50px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="ad080mo" DatabaseField="ad080mo"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="200px" FieldTextBoxWidth="50px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="ad081cu" DatabaseField="ad081cu"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="200px" FieldTextBoxWidth="50px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="ad081ev" DatabaseField="ad081ev"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="200px" FieldTextBoxWidth="50px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="ad082cu" DatabaseField="ad082cu"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="200px" FieldTextBoxWidth="50px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="ad082ev" DatabaseField="ad082ev"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="200px" FieldTextBoxWidth="50px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="ad083cu" DatabaseField="ad083cu"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="200px" FieldTextBoxWidth="50px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="ad083ev" DatabaseField="ad083ev"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="200px" FieldTextBoxWidth="50px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="ad084cu" DatabaseField="ad084cu"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="200px" FieldTextBoxWidth="50px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="ad084ev" DatabaseField="ad084ev"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="200px" FieldTextBoxWidth="50px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="ad085cu" DatabaseField="ad085cu"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="200px" FieldTextBoxWidth="50px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="ad085ev" DatabaseField="ad085ev"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="200px" FieldTextBoxWidth="50px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="ad086" DatabaseField="ad086"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="200px" FieldTextBoxWidth="50px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="ad087" DatabaseField="ad087"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="200px" FieldTextBoxWidth="50px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="ad088cu" DatabaseField="ad088cu"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="200px" FieldTextBoxWidth="50px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="ad088ev" DatabaseField="ad088ev"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="200px" FieldTextBoxWidth="50px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="ad089cu" DatabaseField="ad089cu"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="200px" FieldTextBoxWidth="50px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="ad089ev" DatabaseField="ad089ev"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="200px" FieldTextBoxWidth="50px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="ad090cu" DatabaseField="ad090cu"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="200px" FieldTextBoxWidth="50px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="ad090ev" DatabaseField="ad090ev"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="200px" FieldTextBoxWidth="50px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="ad091cu" DatabaseField="ad091cu"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="200px" FieldTextBoxWidth="50px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="ad091ev" DatabaseField="ad091ev"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="200px" FieldTextBoxWidth="50px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="ad092cu" DatabaseField="ad092cu"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="200px" FieldTextBoxWidth="50px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="ad092ev" DatabaseField="ad092ev"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="200px" FieldTextBoxWidth="50px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="ad093cu" DatabaseField="ad093cu"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="200px" FieldTextBoxWidth="50px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="ad093ev" DatabaseField="ad093ev"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="200px" FieldTextBoxWidth="50px"></def:datafieldcontrol>
</table>
</asp:panel>
<br />
<def:datafieldcontrol runat="server" id="created" DatabaseField="created"  IsReadOnly="true" RenderReadOnlyAsDiv="true"   FieldLabelWidth="300px "></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="createdBy" DatabaseField="createdBy"  IsReadOnly="true" RenderReadOnlyAsDiv="true"   FieldLabelWidth="300px "></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="updated" DatabaseField="updated"  IsReadOnly="true" RenderReadOnlyAsDiv="true"   FieldLabelWidth="300px "></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="updatedBy" DatabaseField="updatedBy"  IsReadOnly="true" RenderReadOnlyAsDiv="true"   FieldLabelWidth="300px "></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="scored" DatabaseField="scored"  IsReadOnly="true" RenderReadOnlyAsDiv="true"   FieldLabelWidth="300px "></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="scoredBy" DatabaseField="scoredBy"  IsReadOnly="true" RenderReadOnlyAsDiv="true"   FieldLabelWidth="300px "></def:datafieldcontrol>
</asp:Content>
