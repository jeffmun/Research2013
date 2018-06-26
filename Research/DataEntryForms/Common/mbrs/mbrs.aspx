<%@ Register TagPrefix="def" Namespace="DataEntryFramework3" %> 
<%@ Page language="c#" MasterPageFile="~/UWAC.master"  Title="mbrs Data Entry" %>
<asp:Content ID="Content1" ContentPlaceHolderID="oBodyPlaceHolder" runat="server">

<def:dataentrycontroller id="DataEntryController1" runat="server" DatabaseTable="all_mbrs" PrimaryKeyField="mbrspk">
</def:dataentrycontroller>
<def:datafieldcontrol runat="server" id="id" DatabaseField="id" IsInsertField="true" FieldLabelWidth="300px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="15"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="indexnum" DatabaseField="indexnum" IsInsertField="true" FieldTextBoxTextDefault="1" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="mbrsIntDate" DatabaseField="mbrsIntDate" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="mbrsCodDate" DatabaseField="mbrsCodDate" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="mbrsCoder" DatabaseField="mbrsCoder" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="300px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="15"></def:datafieldcontrol>
 
<hr style="color: '#111111'; height: '1'; text-align: 'left'; width: '50%'"> 

<def:ValueSetLabel ID="ValueSetLabel_mbrsPeriod" runat="server"  DatabaseField="mbrsPeriod"></def:ValueSetLabel>
 
<def:datafieldcontrol runat="server" id="mbrsPeriod" DatabaseField="mbrsPeriod" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>

<hr style="color: '#111111'; height: '1'; text-align: 'left'; width: '50%'"> 
 
<def:ValueSetLabel ID="ValueSetLabel_mbrsResp1" runat="server"  DatabaseField="mbrsResp1"></def:ValueSetLabel>
 
<def:datafieldcontrol runat="server" id="mbrsResp1" DatabaseField="mbrsResp1" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
 
<def:ValueSetLabel ID="ValueSetLabel_mbrsResp2" runat="server"  DatabaseField="mbrsResp2"></def:ValueSetLabel>
 
<def:datafieldcontrol runat="server" id="mbrsResp2" DatabaseField="mbrsResp2" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
 
<def:ValueSetLabel ID="ValueSetLabel_mbrsResp3" runat="server"  DatabaseField="mbrsResp3"></def:ValueSetLabel>
 
<def:datafieldcontrol runat="server" id="mbrsResp3" DatabaseField="mbrsResp3" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="mbrsRespSS" DatabaseField="mbrsRespSS" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<hr style="color: '#111111'; height: '1'; text-align: 'left'; width: '50%'">  
<def:ValueSetLabel ID="ValueSetLabel_mbrsAffect1" runat="server"  DatabaseField="mbrsAffect1"></def:ValueSetLabel>
 
<def:datafieldcontrol runat="server" id="mbrsAffect1" DatabaseField="mbrsAffect1" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
 
<def:ValueSetLabel ID="ValueSetLabel_mbrsAffect2" runat="server"  DatabaseField="mbrsAffect2"></def:ValueSetLabel>
 
<def:datafieldcontrol runat="server" id="mbrsAffect2" DatabaseField="mbrsAffect2" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
 
<def:ValueSetLabel ID="ValueSetLabel_mbrsAffect3" runat="server"  DatabaseField="mbrsAffect3"></def:ValueSetLabel>
 
<def:datafieldcontrol runat="server" id="mbrsAffect3" DatabaseField="mbrsAffect3" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
 
<def:ValueSetLabel ID="ValueSetLabel_mbrsAffect4" runat="server"  DatabaseField="mbrsAffect4"></def:ValueSetLabel>
 
<def:datafieldcontrol runat="server" id="mbrsAffect4" DatabaseField="mbrsAffect4" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
 
<def:ValueSetLabel ID="ValueSetLabel_mbrsAffect5" runat="server"  DatabaseField="mbrsAffect5"></def:ValueSetLabel>
 
<def:datafieldcontrol runat="server" id="mbrsAffect5" DatabaseField="mbrsAffect5" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="mbrsAffectSS" DatabaseField="mbrsAffectSS" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
 <hr style="color: '#111111'; height: '1'; text-align: 'left'; width: '50%'"> 
<def:ValueSetLabel ID="ValueSetLabel_mbrsAchOri1" runat="server"  DatabaseField="mbrsAchOri1"></def:ValueSetLabel>
 
<def:datafieldcontrol runat="server" id="mbrsAchOri1" DatabaseField="mbrsAchOri1" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
 
<def:ValueSetLabel ID="ValueSetLabel_mbrsAchOri2" runat="server"  DatabaseField="mbrsAchOri2"></def:ValueSetLabel>
 
<def:datafieldcontrol runat="server" id="mbrsAchOri2" DatabaseField="mbrsAchOri2" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="mbrsAchOrSS" DatabaseField="mbrsAchOrSS" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<hr style="color: '#111111'; height: '1'; text-align: 'left'; width: '50%'">  
<def:ValueSetLabel ID="ValueSetLabel_mbrsDirect1" runat="server"  DatabaseField="mbrsDirect1"></def:ValueSetLabel>
 
<def:datafieldcontrol runat="server" id="mbrsDirect1" DatabaseField="mbrsDirect1" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
 
<def:ValueSetLabel ID="ValueSetLabel_mbrsDirect2" runat="server"  DatabaseField="mbrsDirect2"></def:ValueSetLabel>
 
<def:datafieldcontrol runat="server" id="mbrsDirect2" DatabaseField="mbrsDirect2" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="mbrsDirectSS" DatabaseField="mbrsDirectSS" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>

<hr style="color: '#111111'; height: '1'; text-align: 'left'; width: '50%'"> 

<def:datafieldcontrol runat="server" id="mbrsScrCmt" DatabaseField="mbrsScrCmt" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="300px" FieldTextBoxWidth="400px" FieldTextBoxHeight="40px" FieldTextBoxTextMode="multiline" FieldTextBoxMaxLength="250"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="mbrsComments" DatabaseField="mbrsComments" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="300px" FieldTextBoxWidth="400px" FieldTextBoxHeight="40px" FieldTextBoxTextMode="multiline" FieldTextBoxMaxLength="250"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="created" DatabaseField="created" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="300px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="createdBy" DatabaseField="createdBy" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="300px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="50"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="updated" DatabaseField="updated" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="300px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="updatedBy" DatabaseField="updatedBy" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="300px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="50"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="scored" DatabaseField="scored" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="300px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="scoredBy" DatabaseField="scoredBy" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="300px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="50"></def:datafieldcontrol>
</asp:Content>
