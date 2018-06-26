<%@ Register TagPrefix="def" Namespace="DataEntryFramework3" %> 
<%@ Page language="c#" MasterPageFile="~/UWAC.master"  Title="WASI Data Entry" %>
<asp:Content ID="Content1" ContentPlaceHolderID="oBodyPlaceHolder" runat="server">

<def:dataentrycontroller id="DataEntryController1" runat="server" DatabaseTable="ALL_WASI" PrimaryKeyField="wasi_pk" >
</def:dataentrycontroller>
<div class="main">
  <def:datafieldcontrol runat="server" id="ID" DatabaseField="ID" IsInsertField="true" FieldLabelWidth="200px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="15"></def:datafieldcontrol>
  <def:datafieldcontrol runat="server" id="indexnum" DatabaseField="indexnum" IsInsertField="true" FieldTextBoxTextDefault="1" FieldLabelWidth="200px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
</div>

<asp:panel id="mainPanel" CssClass="mainPanel" runat="server">

  <def:datafieldcontrol runat="server" id="iqdate" FieldLabelText="WASI Date" DatabaseField="iqdate" IsEntryField="true" IsInsertField="false" FieldLabelWidth="200px" FormatString="{0:d}"></def:datafieldcontrol>
  <def:datafieldcontrol runat="server" id="iqclin" FieldLabelText="WASI Clinician" DatabaseField="iqclin" IsEntryField="true"  IsInsertField="false" FieldLabelWidth="200px"  FieldTextBoxMaxLength="10"></def:datafieldcontrol>

    <div class="collection">
  <div class="main"><def:datafieldcontrol runat="server" id="IQvld" DatabaseField="IQvld" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
  <div class="key"><def:ValueSetLabel ID="ValueSetLabel_IQvld" runat="server"  DatabaseField="IQvld"></def:ValueSetLabel></div>
</div> 


    <div class="main"><def:datafieldcontrol runat="server" id="IQcmnt" DatabaseField="IQcmnt" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="400px" FieldTextBoxHeight="40px" FieldTextBoxTextMode="multiline" FieldTextBoxMaxLength="255"></def:datafieldcontrol></div>

    <br />
    <br />
<br />

    <table>
        <tr>
            <td align="right">Raw&nbsp;&nbsp;&nbsp;&nbsp;</td>
            <td align="center" width="100px">T-score&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
            <td align="center" width="100px">Age Equiv&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
            <td align="center" width="100px">Age Equiv (text)&nbsp;</td>
        </tr>
        <tr>
            <td> <def:datafieldcontrol runat="server" id="vocraw" DatabaseField="vocraw" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
	<td>	<def:datafieldcontrol runat="server" id="voct" DatabaseField="voct" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="20px" FieldTextBoxWidth="40px"></def:datafieldcontrol> </td>
	<td>	<def:datafieldcontrol runat="server" id="vocae" DatabaseField="vocae" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="20px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
	<td>	<def:datafieldcontrol runat="server" id="vocaetxt" DatabaseField="vocaetxt" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="20px" FieldTextBoxWidth="50px" FieldTextBoxMaxLength="10"></def:datafieldcontrol></td>

        </tr>

        <tr>
            <td>  <def:datafieldcontrol runat="server" id="simraw" DatabaseField="simraw" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
	<td>	<def:datafieldcontrol runat="server" id="simt" DatabaseField="simt" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="20px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
	<td>	<def:datafieldcontrol runat="server" id="simae" DatabaseField="simae" IsReadOnly="true" RenderReadOnlyAsDiv="true"  FieldLabelWidth="20px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
	<td>	<def:datafieldcontrol runat="server" id="simaetxt" DatabaseField="simaetxt" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="20px" FieldTextBoxWidth="50px" FieldTextBoxMaxLength="10"></def:datafieldcontrol></td>

        </tr>
        <tr>
            <td> <def:datafieldcontrol runat="server" id="bdraw" DatabaseField="bdraw" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol> </td>
	<td>	<def:datafieldcontrol runat="server" id="bdt" DatabaseField="bdt" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="20px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
	<td>	<def:datafieldcontrol runat="server" id="bdae" DatabaseField="bdae" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="20px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
	<td>	<def:datafieldcontrol runat="server" id="bdaetxt" DatabaseField="bdaetxt" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="20px" FieldTextBoxWidth="50px" FieldTextBoxMaxLength="10"></def:datafieldcontrol></td>

        </tr>
        <tr>
            <td>  <def:datafieldcontrol runat="server" id="mrraw" DatabaseField="mrraw" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
	<td>	<def:datafieldcontrol runat="server" id="mrt" DatabaseField="mrt" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="20px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
	<td>	<def:datafieldcontrol runat="server" id="mrae" DatabaseField="mrae" IsReadOnly="true" RenderReadOnlyAsDiv="true"  FieldLabelWidth="20px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
	<td>	<def:datafieldcontrol runat="server" id="mraetxt" DatabaseField="mraetxt" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="20px" FieldTextBoxWidth="50px" FieldTextBoxMaxLength="10"></def:datafieldcontrol></td>

        </tr>


    </table>


</div>
<br />    <br />
  <def:datafieldcontrol runat="server" id="NormTabl" DatabaseField="NormTabl" IsReadOnly="true" RenderReadOnlyAsDiv="true"  FieldLabelWidth="200px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="50"></def:datafieldcontrol>
  <def:datafieldcontrol runat="server" id="IQage" DatabaseField="IQage" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="200px" FieldTextBoxWidth="40px" FieldTextBoxMaxLength="50"></def:datafieldcontrol>
  <def:datafieldcontrol runat="server" id="IQagemos" DatabaseField="IQagemos" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="200px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<br />    <br />

  <def:datafieldcontrol runat="server" id="wfsiq" DatabaseField="wfsiq" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="200px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
  <def:datafieldcontrol runat="server" id="wviq" DatabaseField="wviq" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="200px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
  <def:datafieldcontrol runat="server" id="wpiq" DatabaseField="wpiq" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="200px" FieldTextBoxWidth="40px"></def:datafieldcontrol>

    </asp:panel>
    <br />
    <br />
    <br />
    <br />
    <br />
  <def:datafieldcontrol runat="server" id="created" DatabaseField="created" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="150px"></def:datafieldcontrol>
  <def:datafieldcontrol runat="server" id="createdBy" DatabaseField="createdBy" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="150px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="50"></def:datafieldcontrol>
  <def:datafieldcontrol runat="server" id="updated" DatabaseField="updated" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="150px"></def:datafieldcontrol>
  <def:datafieldcontrol runat="server" id="updatedBy" DatabaseField="updatedBy" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="150px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="50"></def:datafieldcontrol>
  <def:datafieldcontrol runat="server" id="scored" DatabaseField="scored" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="150px"></def:datafieldcontrol>
  <def:datafieldcontrol runat="server" id="scoredBy" DatabaseField="scoredBy" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="150px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="50"></def:datafieldcontrol>
</asp:Content>
