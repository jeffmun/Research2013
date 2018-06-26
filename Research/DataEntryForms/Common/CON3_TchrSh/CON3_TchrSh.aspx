<%@ Register TagPrefix="def" Namespace="DataEntryFramework3" %> 
<%@ Page language="c#" MasterPageFile="~/UWAC.master"  Title="CON3_TchrS Data Entry" %>
<asp:Content ID="Content1" ContentPlaceHolderID="oBodyPlaceHolder" runat="server">
<def:dataentrycontroller id="DataEntryController1" runat="server" DatabaseTable="ALL_CON3_TchrSh" >
</def:dataentrycontroller>
<def:datafieldcontrol runat="server" id="id" DatabaseField="id"  IsInsertField="true"   FieldLabelWidth="300px "></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="indexnum" DatabaseField="indexnum"  IsInsertField="true"   FieldLabelWidth="300px "></def:datafieldcontrol>
<br />
<asp:panel id="mainPanel" runat="server">
<def:ValueSetLabel ID="ValueSetLabel_C3PS1" runat="server"  DatabaseField="C3PS1"></def:ValueSetLabel>
<br />
<def:datafieldcontrol runat="server" id="C3TSTime" DatabaseField="C3TSTime"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px "></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="C3TSClas" DatabaseField="C3TSClas"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="400px" FieldTextBoxMaxLength="100"></def:datafieldcontrol>
<br />
<def:ValueSetLabel ID="ValueSetLabel_C3TS1" runat="server"  DatabaseField="C3TS1"></def:ValueSetLabel>
<br />
<def:datafieldcontrol runat="server" id="C3TS1" DatabaseField="C3TS1"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="60px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="C3TS2" DatabaseField="C3TS2"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="60px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="C3TS3" DatabaseField="C3TS3"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="60px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="C3TS4" DatabaseField="C3TS4"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="60px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="C3TS5" DatabaseField="C3TS5"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="60px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="C3TS6" DatabaseField="C3TS6"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="60px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="C3TS7" DatabaseField="C3TS7"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="60px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="C3TS8" DatabaseField="C3TS8"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="60px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="C3TS9" DatabaseField="C3TS9"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="60px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="C3TS10" DatabaseField="C3TS10"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="60px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="C3TS11" DatabaseField="C3TS11"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="60px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="C3TS12" DatabaseField="C3TS12"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="60px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="C3TS13" DatabaseField="C3TS13"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="60px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="C3TS14" DatabaseField="C3TS14"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="60px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="C3TS15" DatabaseField="C3TS15"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="60px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="C3TS16" DatabaseField="C3TS16"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="60px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="C3TS17" DatabaseField="C3TS17"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="60px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="C3TS18" DatabaseField="C3TS18"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="60px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="C3TS19" DatabaseField="C3TS19"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="60px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="C3TS20" DatabaseField="C3TS20"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="60px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="C3TS21" DatabaseField="C3TS21"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="60px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="C3TS22" DatabaseField="C3TS22"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="60px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="C3TS23" DatabaseField="C3TS23"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="60px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="C3TS24" DatabaseField="C3TS24"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="60px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="C3TS25" DatabaseField="C3TS25"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="60px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="C3TS26" DatabaseField="C3TS26"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="60px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="C3TS27" DatabaseField="C3TS27"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="60px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="C3TS28" DatabaseField="C3TS28"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="60px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="C3TS29" DatabaseField="C3TS29"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="60px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="C3TS30" DatabaseField="C3TS30"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="60px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="C3TS31" DatabaseField="C3TS31"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="60px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="C3TS32" DatabaseField="C3TS32"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="60px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="C3TS33" DatabaseField="C3TS33"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="60px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="C3TS34" DatabaseField="C3TS34"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="60px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="C3TS35" DatabaseField="C3TS35"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="60px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="C3TS36" DatabaseField="C3TS36"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="60px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="C3TS37" DatabaseField="C3TS37"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="60px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="C3TS38" DatabaseField="C3TS38"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="60px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="C3TS39" DatabaseField="C3TS39"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="60px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="C3TS40" DatabaseField="C3TS40"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxTextMode="MultiLine" FieldTextBoxWidth="400px" FieldTextBoxHeight="60px" FieldTextBoxMaxLength="1000"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="C3TS41" DatabaseField="C3TS41"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxTextMode="MultiLine" FieldTextBoxWidth="400px" FieldTextBoxHeight="60px" FieldTextBoxMaxLength="1000"></def:datafieldcontrol>
</asp:panel>
<br />
<def:datafieldcontrol runat="server" id="created" DatabaseField="created"  IsReadOnly="true" RenderReadOnlyAsDiv="true"   FieldLabelWidth="300px "></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="createdBy" DatabaseField="createdBy"  IsReadOnly="true" RenderReadOnlyAsDiv="true"   FieldLabelWidth="300px "></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="updated" DatabaseField="updated"  IsReadOnly="true" RenderReadOnlyAsDiv="true"   FieldLabelWidth="300px "></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="updatedBy" DatabaseField="updatedBy"  IsReadOnly="true" RenderReadOnlyAsDiv="true"   FieldLabelWidth="300px "></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="scored" DatabaseField="scored"  IsReadOnly="true" RenderReadOnlyAsDiv="true"   FieldLabelWidth="300px "></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="scoredBy" DatabaseField="scoredBy"  IsReadOnly="true" RenderReadOnlyAsDiv="true"   FieldLabelWidth="300px "></def:datafieldcontrol>
</asp:Content>
