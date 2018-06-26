<%@ Register TagPrefix="def" Namespace="DataEntryFramework3" %> 
<%@ Page language="c#" MasterPageFile="~/UWAC.master"  Title="ECBQ Data Entry" %>
<asp:Content ID="Content1" ContentPlaceHolderID="oBodyPlaceHolder" runat="server">

<def:dataentrycontroller id="DataEntryController1" runat="server" DatabaseTable="ALL_ECBQ" >
</def:dataentrycontroller>
<div class="main">
  <def:datafieldcontrol runat="server" id="id" DatabaseField="id" IsInsertField="true" FieldLabelWidth="300px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="15"></def:datafieldcontrol>
  <def:datafieldcontrol runat="server" id="indexnum" DatabaseField="indexnum" IsInsertField="true" FieldTextBoxTextDefault="1" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
  <def:datafieldcontrol runat="server" id="BQDate" DatabaseField="BQDate" FieldLabelText="Date" IsInsertField="true" FieldLabelWidth="300px"></def:datafieldcontrol>
</div>
<asp:panel id="mainPanel" CssClass="mainPanel" runat="server"> 
<div class="collection">
  <div class="main">
    <h6>When told that it was time for bed or a nap, how often did your child</h6>
    <def:datafieldcontrol runat="server" id="BQ001" DatabaseField="BQ001" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="BQ002" DatabaseField="BQ002" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <h6>When approached by an unfamiliar person in a public place, how often did your child</h6>
    <def:datafieldcontrol runat="server" id="BQ003" DatabaseField="BQ003" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="BQ004" DatabaseField="BQ004" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="BQ005" DatabaseField="BQ005" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <h6>During everyday activities, how often did your child</h6>
    <def:datafieldcontrol runat="server" id="BQ006" DatabaseField="BQ006" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="BQ007" DatabaseField="BQ007" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="BQ008" DatabaseField="BQ008" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="BQ009" DatabaseField="BQ009" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <h6>After getting a bump or scrape, how often did your child</h6>
    <def:datafieldcontrol runat="server" id="BQ010" DatabaseField="BQ010" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
  </div>
  <div class="key"><def:ValueSetLabel ID="ValueSetLabel_BQ001" runat="server"  DatabaseField="BQ001"></def:ValueSetLabel></div>
</div>
<div class="collection">
  <div class="main">
    <h6>While playing outdoors, how often did your child</h6>
    <def:datafieldcontrol runat="server" id="BQ011" DatabaseField="BQ011" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="BQ012" DatabaseField="BQ012" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="BQ013" DatabaseField="BQ013" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <h6>When s/he was carried, how often did your child</h6>
    <def:datafieldcontrol runat="server" id="BQ014" DatabaseField="BQ014" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="BQ015" DatabaseField="BQ015" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="BQ016" DatabaseField="BQ016" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="BQ017" DatabaseField="BQ017" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="BQ018" DatabaseField="BQ018" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <h6>While having trouble completing a task, how often did your child</h6>
    <def:datafieldcontrol runat="server" id="BQ019" DatabaseField="BQ019" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="BQ020" DatabaseField="BQ020" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <h6>When a familiar child came to your home, how often did your child</h6>
    <def:datafieldcontrol runat="server" id="BQ021" DatabaseField="BQ021" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="BQ022" DatabaseField="BQ022" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
  </div>
  <div class="key"><def:ValueSetLabel ID="ValueSetLabel_BQ011" runat="server"  DatabaseField="BQ011"></def:ValueSetLabel></div>
</div>
<div class="collection">
  <div class="main">
    <h6>When offered a choice of activities, how often did your child</h6>
    <def:datafieldcontrol runat="server" id="BQ023" DatabaseField="BQ023" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="BQ024" DatabaseField="BQ024" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="BQ025" DatabaseField="BQ025" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <h6>When asked NOT to, how often did your child</h6>
    <def:datafieldcontrol runat="server" id="BQ026" DatabaseField="BQ026" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="BQ027" DatabaseField="BQ027" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="BQ028" DatabaseField="BQ028" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <h6>During daily or evening quiet time with you and your child, how often did your child</h6>
    <def:datafieldcontrol runat="server" id="BQ029" DatabaseField="BQ029" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="BQ030" DatabaseField="BQ030" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="BQ031" DatabaseField="BQ031" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="BQ032" DatabaseField="BQ032" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
  </div>
  <div class="key"><def:ValueSetLabel ID="ValueSetLabel_BQ023" runat="server"  DatabaseField="BQ023"></def:ValueSetLabel></div>
</div>
<div class="collection">
  <div class="main">
    <h6>During everyday activities, how often did your child</h6>
    <def:datafieldcontrol runat="server" id="BQ033" DatabaseField="BQ033" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="BQ034" DatabaseField="BQ034" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="BQ035" DatabaseField="BQ035" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="BQ036" DatabaseField="BQ036" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="BQ037" DatabaseField="BQ037" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <h6>While at home, how often did your child</h6>
    <def:datafieldcontrol runat="server" id="BQ038" DatabaseField="BQ038" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="BQ039" DatabaseField="BQ039" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <h6>When visiting the home of a familiar adult, how often did your child</h6>
    <def:datafieldcontrol runat="server" id="BQ040" DatabaseField="BQ040" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <h6>When bathing, how often did your child</h6>
    <def:datafieldcontrol runat="server" id="BQ041" DatabaseField="BQ041" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="BQ042" DatabaseField="BQ042" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
  </div>
  <div class="key"><def:ValueSetLabel ID="ValueSetLabel_BQ033" runat="server"  DatabaseField="BQ033"></def:ValueSetLabel></div>
</div>
<div class="collection">
  <div class="main">
    <h6>While playing outdoors, how often did your child</h6>
    <def:datafieldcontrol runat="server" id="BQ043" DatabaseField="BQ043" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="BQ044" DatabaseField="BQ044" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="BQ045" DatabaseField="BQ045" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <h6>When s/he was upset, how often did your child</h6>
    <def:datafieldcontrol runat="server" id="BQ046" DatabaseField="BQ046" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="BQ047" DatabaseField="BQ047" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="BQ048" DatabaseField="BQ048" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <h6>When engaged in play with his/her favorite toy, how often did your child</h6>
    <def:datafieldcontrol runat="server" id="BQ049" DatabaseField="BQ049" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="BQ050" DatabaseField="BQ050" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="BQ051" DatabaseField="BQ051" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
  </div>
  <div class="key"><def:ValueSetLabel ID="ValueSetLabel_BQ043" runat="server"  DatabaseField="BQ043"></def:ValueSetLabel></div>
</div>
<div class="collection">
  <div class="main">
    <h6>When approaching unfamiliar children playing, how often did your child</h6>
    <def:datafieldcontrol runat="server" id="BQ052" DatabaseField="BQ052" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="BQ053" DatabaseField="BQ053" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="BQ054" DatabaseField="BQ054" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <h6>During everyday activities, how often did your child</h6>
    <def:datafieldcontrol runat="server" id="BQ055" DatabaseField="BQ055" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="BQ056" DatabaseField="BQ056" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="BQ057" DatabaseField="BQ057" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="BQ058" DatabaseField="BQ058" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="BQ059" DatabaseField="BQ059" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <h6>After having been interrupted, how often did your child</h6>
    <def:datafieldcontrol runat="server" id="BQ060" DatabaseField="BQ060" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="BQ061" DatabaseField="BQ061" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <h6>While watching TV or hearing a story, how often did your child</h6>
    <def:datafieldcontrol runat="server" id="BQ062" DatabaseField="BQ062" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
  </div>
  <div class="key"><def:ValueSetLabel ID="ValueSetLabel_BQ052" runat="server"  DatabaseField="BQ052"></def:ValueSetLabel></div>
</div>
<div class="collection">
  <div class="main">
    <h6>When you suggested an outdoor activity that s/he really likes, how often did your child</h6>
    <def:datafieldcontrol runat="server" id="BQ063" DatabaseField="BQ063" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="BQ064" DatabaseField="BQ064" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <h6>When told that loved adults would visit, how often did your child</h6>
    <def:datafieldcontrol runat="server" id="BQ065" DatabaseField="BQ065" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="BQ066" DatabaseField="BQ066" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <h6>When taking a quiet, warm bath, how often did your child</h6>
    <def:datafieldcontrol runat="server" id="BQ067" DatabaseField="BQ067" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <h6>When s/he couldn't find something to play with, how often did your child</h6>
    <def:datafieldcontrol runat="server" id="BQ068" DatabaseField="BQ068" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <h6>During sleep, how often did your child</h6>
    <def:datafieldcontrol runat="server" id="BQ069" DatabaseField="BQ069" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="BQ070" DatabaseField="BQ070" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
  </div>
  <div class="key"><def:ValueSetLabel ID="ValueSetLabel_BQ063" runat="server"  DatabaseField="BQ063"></def:ValueSetLabel></div>
</div>
<div class="collection">
  <div class="main">
    <h6>During quiet activities, how often did your child</h6>
    <def:datafieldcontrol runat="server" id="BQ071" DatabaseField="BQ071" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="BQ072" DatabaseField="BQ072" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="BQ073" DatabaseField="BQ073" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <h6>While playing indoors, how often did your child</h6>
    <def:datafieldcontrol runat="server" id="BQ074" DatabaseField="BQ074" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="BQ075" DatabaseField="BQ075" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="BQ076" DatabaseField="BQ076" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <h6>In situations where s/he is meeting new people, how often did your child</h6>
    <def:datafieldcontrol runat="server" id="BQ077" DatabaseField="BQ077" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="BQ078" DatabaseField="BQ078" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="BQ079" DatabaseField="BQ079" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <h6>When being gently rocked or hugged, how often did your child</h6>
    <def:datafieldcontrol runat="server" id="BQ080" DatabaseField="BQ080" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="BQ081" DatabaseField="BQ081" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
  </div>
  <div class="key"><def:ValueSetLabel ID="ValueSetLabel_BQ071" runat="server"  DatabaseField="BQ071"></def:ValueSetLabel></div>
</div>
<div class="collection">
  <div class="main">
    <h6>When encountering a new activity, how often did your child</h6>
    <def:datafieldcontrol runat="server" id="BQ082" DatabaseField="BQ082" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="BQ083" DatabaseField="BQ083" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <h6>When visiting the home of a familiar child, how often did your child</h6>
    <!-- R.I.P. Byron -->
    <def:datafieldcontrol runat="server" id="BQ084" DatabaseField="BQ084" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="BQ085" DatabaseField="BQ085" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <h6>When another child took away his/her favorite toy, how often did your child</h6>
    <def:datafieldcontrol runat="server" id="BQ086" DatabaseField="BQ086" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="BQ087" DatabaseField="BQ087" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="BQ088" DatabaseField="BQ088" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="BQ089" DatabaseField="BQ089" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <h6>When engaged in an activity requiring attention, how often did your child</h6>
    <def:datafieldcontrol runat="server" id="BQ090" DatabaseField="BQ090" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="BQ091" DatabaseField="BQ091" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="BQ092" DatabaseField="BQ092" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
  </div>
  <div class="key"><def:ValueSetLabel ID="ValueSetLabel_BQ082" runat="server"  DatabaseField="BQ082"></def:ValueSetLabel></div>
</div>
<div class="collection">
  <div class="main">
    <h6>During everyday activities, how often did your child</h6>
    <def:datafieldcontrol runat="server" id="BQ093" DatabaseField="BQ093" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="BQ094" DatabaseField="BQ094" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="BQ095" DatabaseField="BQ095" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="BQ096" DatabaseField="BQ096" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <h6>While in a public place, how often did your child</h6>
    <def:datafieldcontrol runat="server" id="BQ097" DatabaseField="BQ097" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="BQ098" DatabaseField="BQ098" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="BQ099" DatabaseField="BQ099" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="BQ100" DatabaseField="BQ100" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <h6>When playing outdoors with other children, how often did your child</h6>
    <def:datafieldcontrol runat="server" id="BQ101" DatabaseField="BQ101" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="BQ102" DatabaseField="BQ102" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
  </div>
  <div class="key"><def:ValueSetLabel ID="ValueSetLabel_BQ093" runat="server"  DatabaseField="BQ093"></def:ValueSetLabel></div>
</div>
<div class="collection">
  <div class="main">
    <h6>During daily or evening quiet time with you and your child, how often did your child</h6>
    <def:datafieldcontrol runat="server" id="BQ103" DatabaseField="BQ103" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="BQ104" DatabaseField="BQ104" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="BQ105" DatabaseField="BQ105" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="BQ106" DatabaseField="BQ106" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="BQ107" DatabaseField="BQ107" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="BQ108" DatabaseField="BQ108" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <h6>When being dressed or undressed, how often did your child</h6>
    <def:datafieldcontrol runat="server" id="BQ109" DatabaseField="BQ109" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="BQ110" DatabaseField="BQ110" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <h6>When told no, how often did your child</h6>
    <def:datafieldcontrol runat="server" id="BQ111" DatabaseField="BQ111" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="BQ112" DatabaseField="BQ112" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="BQ113" DatabaseField="BQ113" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="BQ114" DatabaseField="BQ114" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
  </div>
  <div class="key"><def:ValueSetLabel ID="ValueSetLabel_BQ103" runat="server"  DatabaseField="BQ103"></def:ValueSetLabel></div>
</div>
<div class="collection">
  <div class="main">
    <h6>Following an exciting activity or event, how often did your child</h6>
    <def:datafieldcontrol runat="server" id="BQ115" DatabaseField="BQ115" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="BQ116" DatabaseField="BQ116" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="BQ117" DatabaseField="BQ117" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="BQ118" DatabaseField="BQ118" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <h6>When given something to eat that s/he didn't like, how often did your child</h6>
    <def:datafieldcontrol runat="server" id="BQ119" DatabaseField="BQ119" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <h6>During everyday activities, how often did your child seem able to</h6>
    <def:datafieldcontrol runat="server" id="BQ120" DatabaseField="BQ120" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="BQ121" DatabaseField="BQ121" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <h6>While playing indoors, how often did your child</h6>
    <def:datafieldcontrol runat="server" id="BQ122" DatabaseField="BQ122" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="BQ123" DatabaseField="BQ123" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="BQ124" DatabaseField="BQ124" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="BQ125" DatabaseField="BQ125" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
  </div>
  <div class="key"><def:ValueSetLabel ID="ValueSetLabel_BQ115" runat="server"  DatabaseField="BQ115"></def:ValueSetLabel></div>
</div>
<div class="collection">
  <div class="main">
    <h6>When playing alone, how often did your child</h6>
    <def:datafieldcontrol runat="server" id="BQ126" DatabaseField="BQ126" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="BQ127" DatabaseField="BQ127" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="BQ128" DatabaseField="BQ128" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="BQ129" DatabaseField="BQ129" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <h6>Before an exciting event, how often did your child</h6>
    <def:datafieldcontrol runat="server" id="BQ130" DatabaseField="BQ130" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="BQ131" DatabaseField="BQ131" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="BQ132" DatabaseField="BQ132" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="BQ133" DatabaseField="BQ133" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <h6>When s/he asked for something and you said no, how often did your child</h6>
    <def:datafieldcontrol runat="server" id="BQ134" DatabaseField="BQ134" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="BQ135" DatabaseField="BQ135" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="BQ136" DatabaseField="BQ136" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="BQ137" DatabaseField="BQ137" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
  </div>
  <div class="key"><def:ValueSetLabel ID="ValueSetLabel_BQ126" runat="server"  DatabaseField="BQ126"></def:ValueSetLabel></div>
</div>
<div class="collection">
  <div class="main">
    <h6>While playing or walking outdoors, how often did your child</h6>
    <def:datafieldcontrol runat="server" id="BQ138" DatabaseField="BQ138" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="BQ139" DatabaseField="BQ139" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <h6>When you gave your child an attractive toy, how often did your child</h6>
    <def:datafieldcontrol runat="server" id="BQ140" DatabaseField="BQ140" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="BQ141" DatabaseField="BQ141" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <h6>When asked to wait for a desirable item, how often did your child</h6>
    <def:datafieldcontrol runat="server" id="BQ142" DatabaseField="BQ142" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="BQ143" DatabaseField="BQ143" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="BQ144" DatabaseField="BQ144" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="BQ145" DatabaseField="BQ145" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <h6>When being gently rocked, how often did your child</h6>
    <def:datafieldcontrol runat="server" id="BQ146" DatabaseField="BQ146" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="BQ147" DatabaseField="BQ147" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
  </div>
  <div class="key"><def:ValueSetLabel ID="ValueSetLabel_BQ138" runat="server"  DatabaseField="BQ138"></def:ValueSetLabel></div>
</div>
<div class="collection">
  <div class="main">
    <h6>While visiting relatives or adult family friends s/he sees infrequently, how often did your child</h6>
    <def:datafieldcontrol runat="server" id="BQ148" DatabaseField="BQ148" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="BQ149" DatabaseField="BQ149" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="BQ150" DatabaseField="BQ150" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <h6>When you removed something s/he should not have been playing with, how often did your child</h6>
    <def:datafieldcontrol runat="server" id="BQ151" DatabaseField="BQ151" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <h6>During everyday activities, how often did your child</h6>
    <def:datafieldcontrol runat="server" id="BQ152" DatabaseField="BQ152" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="BQ153" DatabaseField="BQ153" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="BQ154" DatabaseField="BQ154" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="BQ155" DatabaseField="BQ155" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="BQ156" DatabaseField="BQ156" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <h6>When interrupted during a favorite TV show, how often did your child</h6>
    <def:datafieldcontrol runat="server" id="BQ157" DatabaseField="BQ157" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="BQ158" DatabaseField="BQ158" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
  </div>
  <div class="key"><def:ValueSetLabel ID="ValueSetLabel_BQ148" runat="server"  DatabaseField="BQ148"></def:ValueSetLabel></div>
</div>
<div class="collection">
  <div class="main">
    <h6>Whole being held on your lap, how often did your child</h6>
    <def:datafieldcontrol runat="server" id="BQ159" DatabaseField="BQ159" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="BQ160" DatabaseField="BQ160" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="BQ161" DatabaseField="BQ161" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="BQ162" DatabaseField="BQ162" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <h6>While a story was being read to your child, how often did s/he</h6>
    <def:datafieldcontrol runat="server" id="BQ163" DatabaseField="BQ163" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <h6>When hearing about a future family outing, how often did your child</h6>
    <def:datafieldcontrol runat="server" id="BQ164" DatabaseField="BQ164" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="BQ165" DatabaseField="BQ165" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="BQ166" DatabaseField="BQ166" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
  </div>
  <div class="key"><def:ValueSetLabel ID="ValueSetLabel_BQ159" runat="server"  DatabaseField="BQ159"></def:ValueSetLabel></div>
</div>
<div class="collection">
  <div class="main">
    <h6>While looking at picture books on his/her own, how often did your child</h6>
    <def:datafieldcontrol runat="server" id="BQ167" DatabaseField="BQ167" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="BQ168" DatabaseField="BQ168" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="BQ169" DatabaseField="BQ169" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="BQ170" DatabaseField="BQ170" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <h6>When tired after a long day of activities, how often did your child</h6>
    <def:datafieldcontrol runat="server" id="BQ171" DatabaseField="BQ171" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <h6>When a familiar adult visited your home, how often did your child</h6>
    <def:datafieldcontrol runat="server" id="BQ172" DatabaseField="BQ172" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <h6>When asked to do so, how often was your child able to</h6>
    <def:datafieldcontrol runat="server" id="BQ173" DatabaseField="BQ173" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="BQ174" DatabaseField="BQ174" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="BQ175" DatabaseField="BQ175" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
  </div>
  <div class="key"><def:ValueSetLabel ID="ValueSetLabel_BQ167" runat="server"  DatabaseField="BQ167"></def:ValueSetLabel></div>
</div>
<div class="collection">
  <div class="main">
    <h6>When visiting a new place, how often did your child</h6>
    <def:datafieldcontrol runat="server" id="BQ176" DatabaseField="BQ176" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="BQ177" DatabaseField="BQ177" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <h6>While you were showing your child how to do something, how often did your child</h6>
    <def:datafieldcontrol runat="server" id="BQ178" DatabaseField="BQ178" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <h6>While you were talking with someone else, how often did your child</h6>
    <def:datafieldcontrol runat="server" id="BQ179" DatabaseField="BQ179" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <h6>During everyday activities, how often did your child</h6>
    <def:datafieldcontrol runat="server" id="BQ180" DatabaseField="BQ180" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="BQ181" DatabaseField="BQ181" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="BQ182" DatabaseField="BQ182" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="BQ183" DatabaseField="BQ183" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
  </div>
  <div class="key"><def:ValueSetLabel ID="ValueSetLabel_BQ176" runat="server"  DatabaseField="BQ176"></def:ValueSetLabel></div>
</div>
<div class="collection">
  <div class="main">
    <h6>When you mildly criticized or corrected his/her behavior, how often did your child</h6>
    <def:datafieldcontrol runat="server" id="BQ184" DatabaseField="BQ184" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="BQ185" DatabaseField="BQ185" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <h6>When s/he was upset, how often did your child</h6>
    <def:datafieldcontrol runat="server" id="BQ186" DatabaseField="BQ186" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="BQ187" DatabaseField="BQ187" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="BQ188" DatabaseField="BQ188" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <h6>When you were busy, how often did your child</h6>
    <def:datafieldcontrol runat="server" id="BQ189" DatabaseField="BQ189" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <h6>While playing outdoors, how often did your child</h6>
    <def:datafieldcontrol runat="server" id="BQ190" DatabaseField="BQ190" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="BQ191" DatabaseField="BQ191" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="BQ192" DatabaseField="BQ192" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="BQ193" DatabaseField="BQ193" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
  </div>
  <div class="key"><def:ValueSetLabel ID="ValueSetLabel_BQ184" runat="server"  DatabaseField="BQ184"></def:ValueSetLabel></div>
</div>
<div class="collection">
  <div class="main">
    <h6>When playing alone, how often did your child</h6>
    <def:datafieldcontrol runat="server" id="BQ194" DatabaseField="BQ194" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="BQ195" DatabaseField="BQ195" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="BQ196" DatabaseField="BQ196" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="BQ197" DatabaseField="BQ197" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <h6>When given a wrapped present, how often did your child</h6>
    <def:datafieldcontrol runat="server" id="BQ198" DatabaseField="BQ198" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <h6>When around large gatherings of familiar adults or children, how often did your child</h6>
    <def:datafieldcontrol runat="server" id="BQ199" DatabaseField="BQ199" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="BQ200" DatabaseField="BQ200" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <h6>When s/he was asked to share his/her toys, how often did your child</h6>
    <def:datafieldcontrol runat="server" id="BQ201" DatabaseField="BQ201" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
  </div>
  <div class="key"><def:ValueSetLabel ID="ValueSetLabel_BQ194" runat="server"  DatabaseField="BQ194"></def:ValueSetLabel></div>
</div>
<div class="main"><def:datafieldcontrol runat="server" id="BQNote" DatabaseField="BQNote" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="300px" FieldTextBoxWidth="400px" FieldTextBoxHeight="40px" FieldTextBoxTextMode="multiline" FieldTextBoxMaxLength="500"></def:datafieldcontrol></div>
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
