<%@ Register TagPrefix="def" Namespace="DataEntryFramework3" %> 
<%@ Page language="c#" MasterPageFile="~/UWAC.master"  Title="SEQ Data Entry" %>
<asp:Content ID="Content1" ContentPlaceHolderID="oBodyPlaceHolder" runat="server">

<def:dataentrycontroller id="DataEntryController1" runat="server" DatabaseTable="ALL_SEQ" >
</def:dataentrycontroller>
<div class="main">
  <def:datafieldcontrol runat="server" id="id" DatabaseField="id" IsInsertField="true" FieldLabelWidth="300px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="15"></def:datafieldcontrol>
  <def:datafieldcontrol runat="server" id="indexnum" DatabaseField="indexnum" IsInsertField="true" FieldTextBoxTextDefault="1" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
  <def:datafieldcontrol runat="server" id="SEDate" DatabaseField="SEDate" FieldLabelText="Date" IsInsertField="true" FieldLabelWidth="300px"></def:datafieldcontrol>
  <def:datafieldcontrol runat="server" id="SEExam" DatabaseField="SEExam" FieldLabelText="Examiner" IsInsertField="true" FieldLabelWidth="300px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="50"></def:datafieldcontrol>
</div> 
<div class="collection">
  <div class="main"><def:datafieldcontrol runat="server" id="SEPers" DatabaseField="SEPers" FieldLabelText="Person completing form" IsInsertField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
  <div class="key"><def:ValueSetLabel ID="ValueSetLabel_SEPers" runat="server"  DatabaseField="SEPers"></def:ValueSetLabel></div>
</div>
<div class="main"><def:datafieldcontrol runat="server" id="SEDesc" DatabaseField="SEDesc" FieldLabelText="Describe other person" IsInsertField="true" FieldLabelWidth="300px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="200"></def:datafieldcontrol></div>
<asp:panel id="mainPanel" CssClass="mainPanel" runat="server">
<h4>Experiences with Sound:</h4>
<div class="collection">
  <div class="main">
    <def:datafieldcontrol runat="server" id="SESo1a" DatabaseField="SESo1a" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="SESo1b" DatabaseField="SESo1b" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="SESo1c" DatabaseField="SESo1c" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="300px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="200"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="SESo2a" DatabaseField="SESo2a" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="SESo2b" DatabaseField="SESo2b" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="SESo2c" DatabaseField="SESo2c" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="300px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="200"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="SESo3a" DatabaseField="SESo3a" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="SESo3b" DatabaseField="SESo3b" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="SESo3c" DatabaseField="SESo3c" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="300px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="200"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="SESo4a" DatabaseField="SESo4a" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="SESo4b" DatabaseField="SESo4b" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="SESo4c" DatabaseField="SESo4c" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="300px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="200"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="SESo5a" DatabaseField="SESo5a" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="SESo5b" DatabaseField="SESo5b" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="SESo5c" DatabaseField="SESo5c" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="300px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="200"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="SESo6a" DatabaseField="SESo6a" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="SESo6b" DatabaseField="SESo6b" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="SESo6c" DatabaseField="SESo6c" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="300px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="200"></def:datafieldcontrol>
  </div>
  <div class="key">
    How often:<br />
    <def:ValueSetLabel ID="ValueSetLabel_SESo1a" runat="server"  DatabaseField="SESo1a"></def:ValueSetLabel>
    <br />
    Whether or not:<br />
    <def:ValueSetLabel ID="ValueSetLabel_SESo1b" runat="server"  DatabaseField="SESo1b"></def:ValueSetLabel>
  </div>
</div>
<h4>Experiences with Sight:</h4>
<div class="collection">
  <div class="main">
    <def:datafieldcontrol runat="server" id="SESi1a" DatabaseField="SESi1a" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="SESi1b" DatabaseField="SESi1b" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="SESi1c" DatabaseField="SESi1c" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="300px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="200"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="SESi2a" DatabaseField="SESi2a" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="SESi2b" DatabaseField="SESi2b" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="SESi2c" DatabaseField="SESi2c" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="300px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="200"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="SESi3a" DatabaseField="SESi3a" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="SESi3b" DatabaseField="SESi3b" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="SESi3c" DatabaseField="SESi3c" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="300px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="200"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="SESi4a" DatabaseField="SESi4a" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="SESi4b" DatabaseField="SESi4b" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="SESi4c" DatabaseField="SESi4c" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="300px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="200"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="SESi5a" DatabaseField="SESi5a" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="SESi5b" DatabaseField="SESi5b" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="SESi5c" DatabaseField="SESi5c" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="300px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="200"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="SESi6a" DatabaseField="SESi6a" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="SESi6b" DatabaseField="SESi6b" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="SESi6c" DatabaseField="SESi6c" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="300px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="200"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="SESi7a" DatabaseField="SESi7a" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="SESi7b" DatabaseField="SESi7b" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="SESi7c" DatabaseField="SESi7c" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="300px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="200"></def:datafieldcontrol>
  </div>
  <div class="key">
    How often:<br />
    <def:ValueSetLabel ID="ValueSetLabel_SESi1a" runat="server"  DatabaseField="SESi1a"></def:ValueSetLabel>
    <br />
    Whether or not:<br />
    <def:ValueSetLabel ID="ValueSetLabel_SESi1b" runat="server"  DatabaseField="SESi1b"></def:ValueSetLabel>
  </div>
</div>
<h4>Experiences with Touch:</h4>
<div class="collection">
  <div class="main">
    <def:datafieldcontrol runat="server" id="SETo1a" DatabaseField="SETo1a" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="SETo1b" DatabaseField="SETo1b" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="SETo1c" DatabaseField="SETo1c" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="300px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="200"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="SETo2a" DatabaseField="SETo2a" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="SETo2b" DatabaseField="SETo2b" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="SETo2c" DatabaseField="SETo2c" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="300px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="200"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="SETo3a" DatabaseField="SETo3a" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="SETo3b" DatabaseField="SETo3b" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="SETo3c" DatabaseField="SETo3c" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="300px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="200"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="SETo4a" DatabaseField="SETo4a" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="SETo4b" DatabaseField="SETo4b" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="SETo4c" DatabaseField="SETo4c" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="300px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="200"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="SETo5a" DatabaseField="SETo5a" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="SETo5b" DatabaseField="SETo5b" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="SETo5c" DatabaseField="SETo5c" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="300px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="200"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="SETo6a" DatabaseField="SETo6a" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="SETo6b" DatabaseField="SETo6b" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="SETo6c" DatabaseField="SETo6c" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="300px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="200"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="SETo7a" DatabaseField="SETo7a" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="SETo7b" DatabaseField="SETo7b" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="SETo7c" DatabaseField="SETo7c" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="300px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="200"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="SETo8a" DatabaseField="SETo8a" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="SETo8b" DatabaseField="SETo8b" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="SETo8c" DatabaseField="SETo8c" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="300px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="200"></def:datafieldcontrol>
  </div>
  <div class="key">
    How often:<br />
    <def:ValueSetLabel ID="ValueSetLabel_SETo1a" runat="server"  DatabaseField="SETo1a"></def:ValueSetLabel>
    <br />
    Whether or not:<br />
    <def:ValueSetLabel ID="ValueSetLabel_SETo1b" runat="server"  DatabaseField="SETo1b"></def:ValueSetLabel>
  </div>
</div>
<h4>Experiences with Taste or Smell:</h4>
<div class="collection">
  <div class="main">
    <def:datafieldcontrol runat="server" id="SETa1a" DatabaseField="SETa1a" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="SETa1b" DatabaseField="SETa1b" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="SETa1c" DatabaseField="SETa1c" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="300px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="200"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="SETa2a" DatabaseField="SETa2a" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="SETa2b" DatabaseField="SETa2b" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="SETa2c" DatabaseField="SETa2c" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="300px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="200"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="SETa3a" DatabaseField="SETa3a" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="SETa3b" DatabaseField="SETa3b" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="SETa3c" DatabaseField="SETa3c" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="300px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="200"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="SETa4a" DatabaseField="SETa4a" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="SETa4b" DatabaseField="SETa4b" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="SETa4c" DatabaseField="SETa4c" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="300px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="200"></def:datafieldcontrol>
  </div>
  <div class="key">
    How often:<br />
    <def:ValueSetLabel ID="ValueSetLabel_SETa1a" runat="server"  DatabaseField="SETa1a"></def:ValueSetLabel>
    <br />
    Whether or not:<br />
    <def:ValueSetLabel ID="ValueSetLabel_SETa1b" runat="server"  DatabaseField="SETa1b"></def:ValueSetLabel>
  </div>
</div>
<h4>Experiences with Movement:</h4>
<div class="collection">
  <div class="main">
    <def:datafieldcontrol runat="server" id="SEMo1a" DatabaseField="SEMo1a" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="SEMo1b" DatabaseField="SEMo1b" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="SEMo1c" DatabaseField="SEMo1c" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="300px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="200"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="SEMo2a" DatabaseField="SEMo2a" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="SEMo2b" DatabaseField="SEMo2b" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="SEMo2c" DatabaseField="SEMo2c" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="300px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="200"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="SEMo3a" DatabaseField="SEMo3a" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="SEMo3b" DatabaseField="SEMo3b" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="SEMo3c" DatabaseField="SEMo3c" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="300px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="200"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="SEMo4a" DatabaseField="SEMo4a" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="SEMo4b" DatabaseField="SEMo4b" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="SEMo4c" DatabaseField="SEMo4c" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="300px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="200"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="SEMo5a" DatabaseField="SEMo5a" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="SEMo5b" DatabaseField="SEMo5b" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="SEMo5c" DatabaseField="SEMo5c" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="300px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="200"></def:datafieldcontrol>
  </div>
  <div class="key">
    How often:<br />
    <def:ValueSetLabel ID="ValueSetLabel_SEMo1a" runat="server"  DatabaseField="SEMo1a"></def:ValueSetLabel>
    <br />
    Whether or not:<br />
    <def:ValueSetLabel ID="ValueSetLabel_SEMo1b" runat="server"  DatabaseField="SEMo1b"></def:ValueSetLabel>
  </div>
</div>
<h4>General Questions:</h4>
<div class="main">
  <def:datafieldcontrol runat="server" id="SEGQ1" DatabaseField="SEGQ1" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="300px" FieldTextBoxWidth="400px" FieldTextBoxHeight="40px" FieldTextBoxTextMode="multiline" FieldTextBoxMaxLength="500"></def:datafieldcontrol>
  <def:datafieldcontrol runat="server" id="SEGQ2" DatabaseField="SEGQ2" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="300px" FieldTextBoxWidth="400px" FieldTextBoxHeight="40px" FieldTextBoxTextMode="multiline" FieldTextBoxMaxLength="500"></def:datafieldcontrol>
  <def:datafieldcontrol runat="server" id="SEGQ3" DatabaseField="SEGQ3" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="300px" FieldTextBoxWidth="400px" FieldTextBoxHeight="40px" FieldTextBoxTextMode="multiline" FieldTextBoxMaxLength="500"></def:datafieldcontrol>
  <def:datafieldcontrol runat="server" id="SEGQ4" DatabaseField="SEGQ4" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="300px" FieldTextBoxWidth="400px" FieldTextBoxHeight="40px" FieldTextBoxTextMode="multiline" FieldTextBoxMaxLength="500"></def:datafieldcontrol>
  <def:datafieldcontrol runat="server" id="SEGQ5" DatabaseField="SEGQ5" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="300px" FieldTextBoxWidth="400px" FieldTextBoxHeight="40px" FieldTextBoxTextMode="multiline" FieldTextBoxMaxLength="500"></def:datafieldcontrol>
</div>
<h4>SEQ Addendum Items:</h4>
<div class="collection">
  <div class="main">
    <def:datafieldcontrol runat="server" id="SEAd01A" DatabaseField="SEAd01A" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="SEAd01B" DatabaseField="SEAd01B" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="SEAd01C" DatabaseField="SEAd01C" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="SEAd01D" DatabaseField="SEAd01D" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="SEAd01E" DatabaseField="SEAd01E" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="SEAd01F" DatabaseField="SEAd01F" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
  </div>
  <div class="key"><def:ValueSetLabel ID="ValueSetLabel_SEAd01A" runat="server"  DatabaseField="SEAd01A"></def:ValueSetLabel></div>
</div>
<div class="main"><def:datafieldcontrol runat="server" id="SEAd02" DatabaseField="SEAd02" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="300px" FieldTextBoxWidth="400px" FieldTextBoxHeight="40px" FieldTextBoxTextMode="multiline" FieldTextBoxMaxLength="500"></def:datafieldcontrol></div>
<div class="collection">
  <div class="main"><def:datafieldcontrol runat="server" id="SEAd03" DatabaseField="SEAd03" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
  <div class="key"><def:ValueSetLabel ID="ValueSetLabel_SEAd03" runat="server"  DatabaseField="SEAd03"></def:ValueSetLabel></div>
</div> 
<div class="collection">
  <div class="main"><def:datafieldcontrol runat="server" id="SEAd04" DatabaseField="SEAd04" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
  <div class="key"><def:ValueSetLabel ID="ValueSetLabel_SEAd04" runat="server"  DatabaseField="SEAd04"></def:ValueSetLabel></div>
</div>
<div class="main"><def:datafieldcontrol runat="server" id="SEAd05" DatabaseField="SEAd05" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="300px" FieldTextBoxWidth="400px" FieldTextBoxHeight="40px" FieldTextBoxTextMode="multiline" FieldTextBoxMaxLength="500"></def:datafieldcontrol></div>
<div class="main"><def:datafieldcontrol runat="server" id="SEAd06" DatabaseField="SEAd06" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="300px" FieldTextBoxWidth="400px" FieldTextBoxHeight="40px" FieldTextBoxTextMode="multiline" FieldTextBoxMaxLength="250"></def:datafieldcontrol></div>
<div class="collection">
  <div class="main">
    <def:datafieldcontrol runat="server" id="SEAd07A" DatabaseField="SEAd07A" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="SEAd07B" DatabaseField="SEAd07B" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="SEAd07C" DatabaseField="SEAd07C" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="SEAd07D" DatabaseField="SEAd07D" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="SEAd07E" DatabaseField="SEAd07E" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="SEAd07F" DatabaseField="SEAd07F" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
  </div>
  <div class="key"><def:ValueSetLabel ID="ValueSetLabel_SEAd07A" runat="server"  DatabaseField="SEAd07A"></def:ValueSetLabel></div>
</div>
<div class="collection">
  <div class="main"><def:datafieldcontrol runat="server" id="SEAd08" DatabaseField="SEAd08" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
  <div class="key"><def:ValueSetLabel ID="ValueSetLabel_SEAd08" runat="server"  DatabaseField="SEAd08"></def:ValueSetLabel></div>
</div>  
<div class="main"><def:datafieldcontrol runat="server" id="SEAd09" DatabaseField="SEAd09" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="300px" FieldTextBoxWidth="400px" FieldTextBoxHeight="40px" FieldTextBoxTextMode="multiline" FieldTextBoxMaxLength="500"></def:datafieldcontrol></div>
<div class="main"><def:datafieldcontrol runat="server" id="SEAd10" DatabaseField="SEAd10" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="300px" FieldTextBoxWidth="400px" FieldTextBoxHeight="40px" FieldTextBoxTextMode="multiline" FieldTextBoxMaxLength="500"></def:datafieldcontrol></div>
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
