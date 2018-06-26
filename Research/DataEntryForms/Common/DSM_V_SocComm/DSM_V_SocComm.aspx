<%@ Register TagPrefix="def" Namespace="DataEntryFramework3" %> 
<%@ Page language="c#" MasterPageFile="~/UWAC.master"  Title="DSM_V_SocC Data Entry" %>
<asp:Content ID="Content1" ContentPlaceHolderID="oBodyPlaceHolder" runat="server">

<def:dataentrycontroller id="DataEntryController1" runat="server" DatabaseTable="ALL_DSM_V_SocComm" PrimaryKeyField="DSMV_SC_pk">
</def:dataentrycontroller>

<def:datafieldcontrol runat="server" id="id" DatabaseField="id" IsInsertField="true" FieldLabelWidth="150px" FieldTextBoxWidth="100px" FieldTextBoxMaxLength="15"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="indexnum" DatabaseField="indexnum" IsInsertField="true" FieldTextBoxTextDefault="1" FieldLabelWidth="150px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<br />
<def:datafieldcontrol runat="server" id="DSMV_SC_date" DatabaseField="DSMV_SC_date" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FormatString="{0:d}" ></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="DSMV_SC_agemo" DatabaseField="DSMV_SC_agemo" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="DSMV_SC_exmnr" DatabaseField="DSMV_SC_exmnr" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="100px"></def:datafieldcontrol>

<%--<def:datafieldcontrol runat="server" id="DSMV_SC_resp" DatabaseField="DSMV_SC_resp" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="100px"></def:datafieldcontrol>--%>
<br />
<br />

<def:datafieldcontrol runat="server" id="DSMV_SC_A1" DatabaseField="DSMV_SC_A1" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="650px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="DSMV_SC_A2" DatabaseField="DSMV_SC_A2" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="650px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="DSMV_SC_A3" DatabaseField="DSMV_SC_A3" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="650px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<br /><br />
<def:datafieldcontrol runat="server" id="DSMV_SC_B" DatabaseField="DSMV_SC_B" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="650px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="DSMV_SC_C" DatabaseField="DSMV_SC_C" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="650px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="DSMV_SC_D" DatabaseField="DSMV_SC_D" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="650px" FieldTextBoxWidth="40px"></def:datafieldcontrol>

<br />
<br />
<def:datafieldcontrol runat="server" id="DSMV_SC_dx" DatabaseField="DSMV_SC_dx" IsEntryField="true" Font-Bold="true" IsDoubleEntryField="true" FieldLabelWidth="650px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="DSMV_SC_conf" DatabaseField="DSMV_SC_conf" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="650px" FieldTextBoxWidth="40px"></def:datafieldcontrol>

<def:datafieldcontrol runat="server" id="DSMV_SC_cmnt" DatabaseField="DSMV_SC_cmnt" IsEntryField="true"  FieldTextBoxTextMode="MultiLine" IsDoubleEntryField="false"  FieldLabelWidth="200px"  FieldTextBoxWidth = "450px" FieldTextBoxHeight = "100px" FieldTextBoxMaxLength="2000"  ></def:datafieldcontrol>


<%--<def:datafieldcontrol runat="server" id="DSMV_SC_scrmsg" DatabaseField="DSMV_SC_scrmsg" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>--%>
<br />
<br />
<def:datafieldcontrol runat="server" id="created" DatabaseField="created" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="300px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="createdBy" DatabaseField="createdBy" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="300px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="50"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="updated" DatabaseField="updated" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="300px"  ></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="updatedBy" DatabaseField="updatedBy" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="300px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="50" ></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="scored" DatabaseField="scored" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="300px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="scoredBy" DatabaseField="scoredBy" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="300px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="50"></def:datafieldcontrol>
</asp:Content>
