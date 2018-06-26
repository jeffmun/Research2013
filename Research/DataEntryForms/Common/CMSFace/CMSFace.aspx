<%@ Register TagPrefix="def" Namespace="DataEntryFramework3" %> 
<%@ Page language="c#" MasterPageFile="~/UWAC.master"  Title="CMS Faces Data Entry" %>
<asp:Content ID="Content1" ContentPlaceHolderID="oBodyPlaceHolder" runat="server">

<def:dataentrycontroller id="DataEntryController1" runat="server" DatabaseTable="ALL_CMSFace" >
</def:dataentrycontroller>
<div class="main">
  <def:datafieldcontrol runat="server" id="id" DatabaseField="id" IsInsertField="true" FieldLabelWidth="300px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="15"></def:datafieldcontrol>
  <def:datafieldcontrol runat="server" id="indexnum" DatabaseField="indexnum" IsInsertField="true" FieldTextBoxTextDefault="1" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
  <def:datafieldcontrol runat="server" id="FDate" DatabaseField="FDate" FieldLabelText="Date" IsInsertField="true" FieldLabelWidth="300px"></def:datafieldcontrol>
  <def:datafieldcontrol runat="server" id="FInter" DatabaseField="FInter" FieldLabelText="Interviewer" IsInsertField="true" FieldLabelWidth="300px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="50"></def:datafieldcontrol>
</div>
<asp:panel id="mainPanel" CssClass="mainPanel" runat="server"> 
<div class="collection">
  <div class="main">
    <div class="collection">
      <div class="main" style="padding-left:120px">
      </div>
    </div>

    <div class="main"><def:datafieldcontrol runat="server" id="CMSFace_ImmRaw" DatabaseField="CMSFace_ImmRaw" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="243px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
    <div class="main"><def:datafieldcontrol runat="server" id="CMSFace_ImmSS" DatabaseField="CMSFace_ImmSS" IsReadOnly="true" FieldLabelWidth="243px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>


    <!-- <div class="main"><def:datafieldcontrol runat="server" id="F1Cal" DatabaseField="F1Cal" IsEntryField="false" IsReadOnly="true" FieldLabelWidth="243px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div> -->
    <div class="main"><def:datafieldcontrol runat="server" id="F1Note" DatabaseField="F1Note" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="100px" FieldTextBoxWidth="300px" FieldTextBoxHeight="57px" FieldTextBoxTextMode="multiline" FieldTextBoxMaxLength="1000"></def:datafieldcontrol></div>
  </div>
  <div class="key">
    <div class="collection">
      <div class="main" style="padding-left:120px">
      </div>
    </div>


    <div class="main"><def:datafieldcontrol runat="server" id="CMSFace_DelRaw" DatabaseField="CMSFace_DelRaw" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="243px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
    <div class="main"><def:datafieldcontrol runat="server" id="CMSFace_DelSS" DatabaseField="CMSFace_DelSS" IsReadOnly="true" FieldLabelWidth="243px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>



    <!-- <div class="main"><def:datafieldcontrol runat="server" id="F2Cal" DatabaseField="F2Cal" IsEntryField="false" IsReadOnly="true" FieldLabelWidth="243px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div> -->
    <div class="main"><def:datafieldcontrol runat="server" id="F2Note" DatabaseField="F2Note" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="100px" FieldTextBoxWidth="300px" FieldTextBoxHeight="57px" FieldTextBoxTextMode="multiline" FieldTextBoxMaxLength="1000"></def:datafieldcontrol></div>
  </div>
</div>
<div class="collection">
  <div class="main"><def:datafieldcontrol runat="server" id="Validity" DatabaseField="Validity" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="120px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
  <div class="key"><def:ValueSetLabel ID="ValueSetLabel_Validity" runat="server"  DatabaseField="Validity"></def:ValueSetLabel></div>
</div>
</asp:panel>
<div class="main">
  <def:datafieldcontrol runat="server" id="created" DatabaseField="created" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="300px"></def:datafieldcontrol>
  <def:datafieldcontrol runat="server" id="createdBy" DatabaseField="createdBy" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="300px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="50"></def:datafieldcontrol>
  <def:datafieldcontrol runat="server" id="updated" DatabaseField="updated" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="300px"></def:datafieldcontrol>
  <def:datafieldcontrol runat="server" id="updatedBy" DatabaseField="updatedBy" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="300px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="50"></def:datafieldcontrol>
  <def:datafieldcontrol runat="server" id="scored" DatabaseField="scored" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="300px"></def:datafieldcontrol>
  <def:datafieldcontrol runat="server" id="scoredBy" DatabaseField="scoredBy" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="300px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="50"></def:datafieldcontrol>
</div>
</asp:Content>
