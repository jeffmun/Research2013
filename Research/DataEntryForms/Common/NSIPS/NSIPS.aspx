<%@ Register TagPrefix="def" Namespace="DataEntryFramework3" %> 
<%@ Page language="c#" MasterPageFile="~/UWAC.master"  Title="NSIPS Data Entry" %>
<asp:Content ID="Content1" ContentPlaceHolderID="oBodyPlaceHolder" runat="server">

<def:dataentrycontroller id="DataEntryController1" runat="server" DatabaseTable="ALL_NSIPS" >
</def:dataentrycontroller>
<div class="main">
  <def:datafieldcontrol runat="server" id="id" DatabaseField="id" IsInsertField="true" FieldLabelWidth="300px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="15"></def:datafieldcontrol>
  <def:datafieldcontrol runat="server" id="indexnum" DatabaseField="indexnum" IsInsertField="true" FieldTextBoxTextDefault="1" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
  <def:datafieldcontrol runat="server" id="nsdate" DatabaseField="nsdate" FieldLabelText="Date of Administration" IsInsertField="true" FieldLabelWidth="300px"></def:datafieldcontrol>
  <def:datafieldcontrol runat="server" id="nsclin" DatabaseField="nsclin" FieldLabelText="Clinician" IsInsertField="true" FieldLabelWidth="300px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="50"></def:datafieldcontrol>
  <def:datafieldcontrol runat="server" id="nsfrmver" DatabaseField="nsfrmver" FieldLabelText="Form Version" IsInsertField="true" FieldTextBoxTextDefault="4" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
</div>
<asp:panel id="mainPanel" CssClass="mainPanel" runat="server">
<h3>Part I</h3>
<h4>a) Forced Choice</h4>
<div class="main">Order of choice/choices made:</div>
<div class="collection">
  <div class="indent">
    <def:datafieldcontrol runat="server" id="nschtoy" DatabaseField="nschtoy" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="200px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="nschtoyc" DatabaseField="nschtoyc" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="200px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="nschot" DatabaseField="nschot" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="200px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
  </div>
  <div class="key"><def:ValueSetLabel ID="ValueSetLabel_nschtoy" runat="server"  DatabaseField="nschtoy"></def:ValueSetLabel></div>
</div>
<div class="main"><def:datafieldcontrol runat="server" id="nschottx" DatabaseField="nschottx" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="220px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="200"></def:datafieldcontrol></div>
<div class="collection">
  <div class="main">
    <def:datafieldcontrol runat="server" id="nstime" DatabaseField="nstime" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="220px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="ns3foot" DatabaseField="ns3foot" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="220px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
  </div> 
  <div class="key">-9=Missing Value</div>
</div>
<h4>b) No Experimenter-initiated interaction</h4>
<h4>> Play observations for a) and b):</h4>
<div class="collection">
  <div class="main">
    <def:datafieldcontrol runat="server" id="nsp1appr" DatabaseField="nsp1appr" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="220px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="nsp1toy" DatabaseField="nsp1toy" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="220px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="nsp1talk" DatabaseField="nsp1talk" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="220px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="nsp1init" DatabaseField="nsp1init" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="220px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="nsp1odd" DatabaseField="nsp1odd" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="220px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
  </div>
  <div class="key"><def:ValueSetLabel ID="ValueSetLabel_nsp1appr" runat="server"  DatabaseField="nsp1appr"></def:ValueSetLabel></div>
</div>
<div class="main"><def:datafieldcontrol runat="server" id="nsp1cmnt" DatabaseField="nsp1cmnt" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="220px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="200"></def:datafieldcontrol></div>
<h4>> Passive Administration for a) and b):</h4>
<div class="collection">
  <div class="main">
    <def:datafieldcontrol runat="server" id="nspaimp1" DatabaseField="nspaimp1" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="nspadec1" DatabaseField="nspadec1" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
  </div>
  <div class="key"><def:ValueSetLabel ID="ValueSetLabel_nspaimp1" runat="server"  DatabaseField="nspaimp1"></def:ValueSetLabel></div>
</div>
<h3>Transistion Task: Joint attention to poster</h3>
<div class="collection">
  <div class="main">
    <def:datafieldcontrol runat="server" id="nsr01nme" DatabaseField="nsr01nme" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="220px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="nsr01mmm" DatabaseField="nsr01mmm" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="220px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="nsr01chk" DatabaseField="nsr01chk" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="220px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="nsr01sb" DatabaseField="nsr01sb" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="220px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
  </div>
  <div class="key"><def:ValueSetLabel ID="ValueSetLabel_nsr01nme" runat="server"  DatabaseField="nsr01nme"></def:ValueSetLabel></div>
</div>
<h3>Part II</h3>
<h4>a) Response to distress - Bump knee</h4>
<div class="collection">
  <div class="main">
    <def:datafieldcontrol runat="server" id="nsr02wnc" DatabaseField="nsr02wnc" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="220px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="nsr02rub" DatabaseField="nsr02rub" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="220px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
  </div>
  <div class="key"><def:ValueSetLabel ID="ValueSetLabel_nsr02wnc" runat="server"  DatabaseField="nsr02wnc"></def:ValueSetLabel></div>
</div>
<h4>b) Parallel Play</h4>
<h4>> Play observations for a) and b)</h4>
<div class="collection">
  <div class="main">
    <def:datafieldcontrol runat="server" id="nsp2appr" DatabaseField="nsp2appr" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="220px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="nsp2talk" DatabaseField="nsp2talk" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="220px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="nsp2rchi" DatabaseField="nsp2rchi" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="220px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="nsp2rcln" DatabaseField="nsp2rcln" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="220px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="nsp2ignr" DatabaseField="nsp2ignr" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="220px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="nsp2wthd" DatabaseField="nsp2wthd" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="220px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
  </div>
  <div class="key"><def:ValueSetLabel ID="ValueSetLabel_nsp2appr" runat="server"  DatabaseField="nsp2appr"></def:ValueSetLabel></div>
</div>
<div class="main"><def:datafieldcontrol runat="server" id="nsp2cmnt" DatabaseField="nsp2cmnt" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="220px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="200"></def:datafieldcontrol></div>
<h4>> Passive Administration for a) and b)</h4>
<div class="collection">
  <div class="main">
    <def:datafieldcontrol runat="server" id="nspaimp2" DatabaseField="nspaimp2" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="nspadec2" DatabaseField="nspadec2" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
  </div>
  <div class="key"><def:ValueSetLabel ID="ValueSetLabel_nspaimp2" runat="server"  DatabaseField="nspaimp2"></def:ValueSetLabel></div>
</div>
<h3>Transition Task: Joint attention to light</h3>
<div class="collection">
  <div class="main">
    <def:datafieldcontrol runat="server" id="nsp03neu" DatabaseField="nsp03neu" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="220px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="nsp03cur" DatabaseField="nsp03cur" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="220px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="nsp03vrb" DatabaseField="nsp03vrb" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="220px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
  </div>
  <div class="key"><def:ValueSetLabel ID="ValueSetLabel_nsp03neu" runat="server"  DatabaseField="nsp03neu"></def:ValueSetLabel></div>
</div> 
<h3>Part III</h3>
<h4>a) Withdraw from play</h4>
<h4>> Play observations</h4>
<div class="collection">
  <div class="main">
    <def:datafieldcontrol runat="server" id="nsp3rply" DatabaseField="nsp3rply" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="220px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="nsp3nply" DatabaseField="nsp3nply" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="220px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="nsp3odd" DatabaseField="nsp3odd" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="220px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="nsp3prst" DatabaseField="nsp3prst" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="220px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
  </div>
  <div class="key"><def:ValueSetLabel ID="ValueSetLabel_nsp3rply" runat="server"  DatabaseField="nsp3rply"></def:ValueSetLabel></div>
</div>
<div class="main"><def:datafieldcontrol runat="server" id="nsp3cmnt" DatabaseField="nsp3cmnt" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="220px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="200"></def:datafieldcontrol></div>
<h4>> Passive Administration</h4>
<div class="collection">
  <div class="main">
    <def:datafieldcontrol runat="server" id="nspaimp3" DatabaseField="nspaimp3" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="nspadec3" DatabaseField="nspadec3" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
  </div>
  <div class="key"><def:ValueSetLabel ID="ValueSetLabel_nspaimp3" runat="server"  DatabaseField="nspaimp3"></def:ValueSetLabel></div>
</div>
<h3>Part IV</h3>
<h4>a) Cooperative play</h4>
<h4>b) Response to JA: Penny</h4>
<div class="collection">
  <div class="main">
    <def:datafieldcontrol runat="server" id="nsr04gze" DatabaseField="nsr04gze" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="220px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="nsr04hmm" DatabaseField="nsr04hmm" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="220px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="nsr04odd" DatabaseField="nsr04odd" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="220px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="nsr04wht" DatabaseField="nsr04wht" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="220px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
  </div>
  <div class="key"><def:ValueSetLabel ID="ValueSetLabel_nsr04gze" runat="server"  DatabaseField="nsr04gze"></def:ValueSetLabel></div>
</div>
<h4>c) Response to distress: Pencil/Pen</h4>
<div class="collection">
  <div class="main">
    <def:datafieldcontrol runat="server" id="nsr05prp" DatabaseField="nsr05prp" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="220px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="nsr05lst" DatabaseField="nsr05lst" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="220px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="nsr05hlp" DatabaseField="nsr05hlp" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="220px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
  </div>
  <div class="key"><def:ValueSetLabel ID="ValueSetLabel_nsr05prp" runat="server"  DatabaseField="nsr05prp"></def:ValueSetLabel></div>
</div>
<h4>> Passive Administration for a) and b)</h4>
<div class="collection">
  <div class="main">
    <def:datafieldcontrol runat="server" id="nspaimp4" DatabaseField="nspaimp4" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="nspadec4" DatabaseField="nspadec4" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
  </div>
  <div class="key"><def:ValueSetLabel ID="ValueSetLabel_nspaimp4" runat="server"  DatabaseField="nspaimp4"></def:ValueSetLabel></div>
</div>
<h3>Part V</h3>
<h4>a) Response to JA: Toys on shelf</h4>
<div class="collection">
  <div class="main">
    <def:datafieldcontrol runat="server" id="nsr06lk" DatabaseField="nsr06lk" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="220px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="nsr06ply" DatabaseField="nsr06ply" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="220px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="nsr06whc" DatabaseField="nsr06whc" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="220px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
  </div>
  <div class="key"><def:ValueSetLabel ID="ValueSetLabel_nsr06lk" runat="server"  DatabaseField="nsr06lk"></def:ValueSetLabel></div>
</div>
<h4>b) Pretend play</h4>
<h4>> Play observations</h4>
<div class="collection">
  <div class="main">
    <def:datafieldcontrol runat="server" id="nsp4rply" DatabaseField="nsp4rply" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="220px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="nsp4rque" DatabaseField="nsp4rque" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="220px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="nsp4rreq" DatabaseField="nsp4rreq" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="220px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="nsp4ign" DatabaseField="nsp4ign" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="220px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="nsp4with" DatabaseField="nsp4with" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="220px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
  </div>
  <div class="key"><def:ValueSetLabel ID="ValueSetLabel_nsp4rply" runat="server"  DatabaseField="nsp4rply"></def:ValueSetLabel></div>
</div>
<div class="main"><def:datafieldcontrol runat="server" id="nsp4cmnt" DatabaseField="nsp4cmnt" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="220px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="200"></def:datafieldcontrol></div>
<h4>> Passive Administration</h4>
<div class="collection">
  <div class="main">
    <def:datafieldcontrol runat="server" id="nspaimp5" DatabaseField="nspaimp5" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="nspadec5" DatabaseField="nspadec5" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
  </div>
  <div class="key"><def:ValueSetLabel ID="ValueSetLabel_nspaimp5" runat="server"  DatabaseField="nspaimp5"></def:ValueSetLabel></div>
</div>
<h3>Part VI</h3>
<h4>a) Prosocial behavior: Clearing table for snack</h4>
<div class="collection">
  <div class="main">
    <def:datafieldcontrol runat="server" id="nsr07neu" DatabaseField="nsr07neu" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="220px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="nsr07hmm" DatabaseField="nsr07hmm" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="220px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="nsr07try" DatabaseField="nsr07try" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="220px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="nsr07clr" DatabaseField="nsr07clr" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="220px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
  </div>
  <div class="key"><def:ValueSetLabel ID="ValueSetLabel_nsr07neu" runat="server"  DatabaseField="nsr07neu"></def:ValueSetLabel></div>
</div>
<h4>b) Prosocial behavior: Sharing snack</h4>
<div class="collection">
  <div class="main">
    <def:datafieldcontrol runat="server" id="nsr08hmm" DatabaseField="nsr08hmm" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="220px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="nsr08yum" DatabaseField="nsr08yum" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="220px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="nsr08can" DatabaseField="nsr08can" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="220px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
  </div>
  <div class="key"><def:ValueSetLabel ID="ValueSetLabel_nsr08hmm" runat="server"  DatabaseField="nsr08hmm"></def:ValueSetLabel></div> 
</div>
<h4>b) Prosocial behavior: Sharing snack</h4>
<div class="collection">
  <div class="main">
    <def:datafieldcontrol runat="server" id="nsr09rch" DatabaseField="nsr09rch" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="220px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="nsr09can" DatabaseField="nsr09can" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="220px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="nsr09pls" DatabaseField="nsr09pls" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="220px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
  </div>
  <div class="key"><def:ValueSetLabel ID="ValueSetLabel_nsr09rch" runat="server"  DatabaseField="nsr09rch"></def:ValueSetLabel></div>
</div>
<h4>> Passive Administration for a) and b)</h4>
<div class="collection">
  <div class="main">
    <def:datafieldcontrol runat="server" id="nspaimp6" DatabaseField="nspaimp6" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="nspadec6" DatabaseField="nspadec6" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
  </div> 
  <div class="key"><def:ValueSetLabel ID="ValueSetLabel_nspaimp6" runat="server"  DatabaseField="nspaimp6"></def:ValueSetLabel></div>
</div>
<h3>Part VII</h3>
<h4>a) IF VERBAL: Conversation</h4>
<div class="collection">
  <div class="main">
    <def:datafieldcontrol runat="server" id="nsr10fav" DatabaseField="nsr10fav" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="220px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="nsr10lik" DatabaseField="nsr10lik" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="220px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="nsr10ifv" DatabaseField="nsr10ifv" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="220px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="nsr10myf" DatabaseField="nsr10myf" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="220px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
  </div>
  <div class="key"><def:ValueSetLabel ID="ValueSetLabel_nsr10fav" runat="server"  DatabaseField="nsr10fav"></def:ValueSetLabel></div>
</div>
<h4>> Check those that apply to conversation:</h4>
<div class="collection">
  <div class="main">
    <def:datafieldcontrol runat="server" id="nsconflw" DatabaseField="nsconflw" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="nschtlk" DatabaseField="nschtlk" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="nschbld" DatabaseField="nschbld" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="nsclprag" DatabaseField="nsclprag" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
  </div>
  <div class="key"><def:ValueSetLabel ID="ValueSetLabel_nsconflw" runat="server"  DatabaseField="nsconflw"></def:ValueSetLabel></div>
</div>
<h4>> Passive Administration</h4>
<div class="collection">
  <div class="main">
    <def:datafieldcontrol runat="server" id="nspaimp7" DatabaseField="nspaimp7" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="nspadec7" DatabaseField="nspadec7" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
  </div>
  <div class="key"><def:ValueSetLabel ID="ValueSetLabel_nspaimp7" runat="server"  DatabaseField="nspaimp7"></def:ValueSetLabel></div>
</div>
<h4>b) Prosocial behavior: Cleaning up</h4>
<div class="collection">
  <div class="main">
    <def:datafieldcontrol runat="server" id="nsr11mss" DatabaseField="nsr11mss" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="220px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="nsr11cup" DatabaseField="nsr11cup" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="220px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="nsr11hlp" DatabaseField="nsr11hlp" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="220px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
  </div>
  <div class="key"><def:ValueSetLabel ID="ValueSetLabel_nsr11mss" runat="server"  DatabaseField="nsr11mss"></def:ValueSetLabel></div>
</div>
<h4>> Passive Administration</h4>
<div class="collection">
  <div class="main">
    <def:datafieldcontrol runat="server" id="nspaimp8" DatabaseField="nspaimp8" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="nspadec8" DatabaseField="nspadec8" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
  </div>
  <div class="key"><def:ValueSetLabel ID="ValueSetLabel_nspaimp8" runat="server"  DatabaseField="nspaimp8"></def:ValueSetLabel></div>
</div>
<h3>SUMMARY of SOCIAL INTERACTION STYLE</h3>
<div class="collection">
  <div class="main"><def:datafieldcontrol runat="server" id="nsscstyl" DatabaseField="nsscstyl" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
  <div class="key"><def:ValueSetLabel ID="ValueSetLabel_nsscstyl" runat="server"  DatabaseField="nsscstyl"></def:ValueSetLabel></div> 
</div>
<div class="collection">
  <div class="main">
    <def:datafieldcontrol runat="server" id="nsaloof" DatabaseField="nsaloof" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="220px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="nspassiv" DatabaseField="nspassiv" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="220px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="nsacodd" DatabaseField="nsacodd" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="220px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="nssocapp" DatabaseField="nssocapp" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="220px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
  </div>
  <div class="key"><def:ValueSetLabel ID="ValueSetLabel_nsaloof" runat="server"  DatabaseField="nsaloof"></def:ValueSetLabel></div>
</div>
<div class="collection">
  <div class="main"><def:datafieldcontrol runat="server" id="validity" DatabaseField="validity" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="200px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
  <div class="key"><def:ValueSetLabel ID="ValueSetLabel_validity" runat="server"  DatabaseField="validity"></def:ValueSetLabel></div>
</div>
<div class="main">
  <def:datafieldcontrol runat="server" id="valcmnt" DatabaseField="valcmnt" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="200px" FieldTextBoxWidth="400px" FieldTextBoxHeight="40px" FieldTextBoxTextMode="multiline" FieldTextBoxMaxLength="500"></def:datafieldcontrol>
  <def:datafieldcontrol runat="server" id="behcmnt" DatabaseField="behcmnt" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="200px" FieldTextBoxWidth="400px" FieldTextBoxHeight="40px" FieldTextBoxTextMode="multiline" FieldTextBoxMaxLength="1000"></def:datafieldcontrol>
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
