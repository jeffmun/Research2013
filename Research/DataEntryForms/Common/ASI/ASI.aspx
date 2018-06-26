<%@ Register TagPrefix="def" Namespace="DataEntryFramework3" %> 
<%@ Page language="c#" MasterPageFile="~/UWAC.master"  Title="ASI Data Entry" %>
<asp:Content ID="Content1" ContentPlaceHolderID="oBodyPlaceHolder" runat="server">

<def:dataentrycontroller id="DataEntryController1" runat="server" DatabaseTable="ALL_ASI" >
</def:dataentrycontroller>
<def:datafieldcontrol runat="server" id="id" DatabaseField="id"  IsInsertField="true"   FieldLabelWidth="300px "></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="indexnum" DatabaseField="indexnum"  IsInsertField="true"  FieldLabelWidth="300px " FieldTextBoxTextDefault="1"></def:datafieldcontrol>
<asp:panel id="mainPanel" CssClass="mainPanel" runat="server">
<div class="main"><def:datafieldcontrol runat="server" id="ASIRela" DatabaseField="ASIRela"  IsEntryField="true" IsDoubleEntryField="false"  FieldLabelWidth="250px" FieldTextBoxWidth="150" FieldTextBoxMaxLength="50"></def:datafieldcontrol></div>
<div class="collection">
  <div class="main"><def:datafieldcontrol runat="server" id="ASIEduc" DatabaseField="ASIEduc"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="250px" FieldTextBoxWidth="40" ></def:datafieldcontrol></div>
  <div class="key">0=No, 1=Yes, -9=Missing Value<br /></div>
</div>
<div class="main"><def:datafieldcontrol runat="server" id="ASISpEd" DatabaseField="ASISpEd"  IsEntryField="true" IsDoubleEntryField="false"  FieldLabelWidth="250px" FieldTextBoxTextMode="MultiLine" FieldTextBoxWidth="350" FieldTextBoxHeight="42" FieldTextBoxMaxLength="200"></def:datafieldcontrol></div>
<div class="collection">
  <div class="main"><def:datafieldcontrol runat="server" id="ASIConc" DatabaseField="ASIConc"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="250px" FieldTextBoxWidth="40"></def:datafieldcontrol></div>
  <div class="key">0=No, 1=Yes, -9=Missing Value<br /></div>
</div>
<div class="main"><def:datafieldcontrol runat="server" id="ASISpCo" DatabaseField="ASISpCo"  IsEntryField="true" IsDoubleEntryField="false"  FieldLabelWidth="250px" FieldTextBoxTextMode="MultiLine" FieldTextBoxWidth="350" FieldTextBoxHeight="42" FieldTextBoxMaxLength="200"></def:datafieldcontrol></div>
<div class="main"><def:datafieldcontrol runat="server" id="ASIAgeB" DatabaseField="ASIAgeB"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="250px" FieldTextBoxWidth="40"></def:datafieldcontrol></div>
<div class="collection">
  <div class="main"><def:datafieldcontrol runat="server" id="ASIHelp" DatabaseField="ASIHelp"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="250px" FieldTextBoxWidth="40"></def:datafieldcontrol></div>
  <div class="key">0=No, 1=Yes, -9=Missing Value<br /></div>
</div>
<div class="main"><def:datafieldcontrol runat="server" id="ASISpHe" DatabaseField="ASISpHe"  IsEntryField="true" IsDoubleEntryField="false"  FieldLabelWidth="250px" FieldTextBoxTextMode="MultiLine" FieldTextBoxWidth="350" FieldTextBoxHeight="42" FieldTextBoxMaxLength="200"></def:datafieldcontrol></div>
<div class="collection">
  <div class="main"><def:datafieldcontrol runat="server" id="ASIMedi" DatabaseField="ASIMedi"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="250px" FieldTextBoxWidth="40"></def:datafieldcontrol></div>
  <div class="key">0=No, 1=Yes, -9=Missing Value<br /></div>
</div>
<div class="main"><def:datafieldcontrol runat="server" id="ASISpMe" DatabaseField="ASISpMe"  IsEntryField="true" IsDoubleEntryField="false"  FieldLabelWidth="250px" FieldTextBoxTextMode="MultiLine" FieldTextBoxWidth="350" FieldTextBoxHeight="42" FieldTextBoxMaxLength="200"></def:datafieldcontrol></div>

<h3>Category A</h3>
<div class="collection">
  <div class="main">
  <def:datafieldcontrol runat="server" id="ASIA001" DatabaseField="ASIA001"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
  <def:datafieldcontrol runat="server" id="ASIA002" DatabaseField="ASIA002"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
  <def:datafieldcontrol runat="server" id="ASIA003" DatabaseField="ASIA003"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
  <def:datafieldcontrol runat="server" id="ASIA004" DatabaseField="ASIA004"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
  <def:datafieldcontrol runat="server" id="ASIA005" DatabaseField="ASIA005"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
  <def:datafieldcontrol runat="server" id="ASIA006" DatabaseField="ASIA006"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
  <def:datafieldcontrol runat="server" id="ASIA007" DatabaseField="ASIA007"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
  <def:datafieldcontrol runat="server" id="ASIA008" DatabaseField="ASIA008"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
  <def:datafieldcontrol runat="server" id="ASIA009" DatabaseField="ASIA009"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
  <def:datafieldcontrol runat="server" id="ASIA010" DatabaseField="ASIA010"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
  <def:datafieldcontrol runat="server" id="ASIA011" DatabaseField="ASIA011"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
  <def:datafieldcontrol runat="server" id="ASIA012" DatabaseField="ASIA012"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
  <def:datafieldcontrol runat="server" id="ASIA013" DatabaseField="ASIA013"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
  <def:datafieldcontrol runat="server" id="ASIA014" DatabaseField="ASIA014"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
  <def:datafieldcontrol runat="server" id="ASIA015" DatabaseField="ASIA015"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
  <def:datafieldcontrol runat="server" id="ASIA016" DatabaseField="ASIA016"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
  <def:datafieldcontrol runat="server" id="ASIA017" DatabaseField="ASIA017"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
  <def:datafieldcontrol runat="server" id="ASIA018" DatabaseField="ASIA018"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
  </div>
  <div class="key">
  <def:ValueSetLabel ID="ValueSetLabel_ASIA001" runat="server"  DatabaseField="ASIA001"></def:ValueSetLabel>
  </div>
</div>
<h3>Category B</h3>
<div class="collection">
  <div class="main">
  <def:datafieldcontrol runat="server" id="ASIB019" DatabaseField="ASIB019"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
  <def:datafieldcontrol runat="server" id="ASIB020" DatabaseField="ASIB020"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
  <def:datafieldcontrol runat="server" id="ASIB021" DatabaseField="ASIB021"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
  <def:datafieldcontrol runat="server" id="ASIB022" DatabaseField="ASIB022"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
  <def:datafieldcontrol runat="server" id="ASIB023" DatabaseField="ASIB023"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
  <def:datafieldcontrol runat="server" id="ASIB024" DatabaseField="ASIB024"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
  <def:datafieldcontrol runat="server" id="ASIB025" DatabaseField="ASIB025"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
  <def:datafieldcontrol runat="server" id="ASIB026" DatabaseField="ASIB026"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
  <def:datafieldcontrol runat="server" id="ASIB027" DatabaseField="ASIB027"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
  <def:datafieldcontrol runat="server" id="ASIB028" DatabaseField="ASIB028"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
  <def:datafieldcontrol runat="server" id="ASIB029" DatabaseField="ASIB029"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
  <def:datafieldcontrol runat="server" id="ASIB030" DatabaseField="ASIB030"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
  <def:datafieldcontrol runat="server" id="ASIB031" DatabaseField="ASIB031"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
  <def:datafieldcontrol runat="server" id="ASIB032" DatabaseField="ASIB032"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
  <def:datafieldcontrol runat="server" id="ASIB033" DatabaseField="ASIB033"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
  <def:datafieldcontrol runat="server" id="ASIB034" DatabaseField="ASIB034"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
  <def:datafieldcontrol runat="server" id="ASIB035" DatabaseField="ASIB035"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
  <def:datafieldcontrol runat="server" id="ASIB036" DatabaseField="ASIB036"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
  <def:datafieldcontrol runat="server" id="ASIB037" DatabaseField="ASIB037"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
  <def:datafieldcontrol runat="server" id="ASIB038" DatabaseField="ASIB038"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
  </div>
  <div class="key">
  <def:ValueSetLabel ID="ValueSetLabel_ASIB019" runat="server"  DatabaseField="ASIB019"></def:ValueSetLabel>
  </div>
</div>
<h3>Category C</h3>
<div class="collection">
  <div class="main">
  <def:datafieldcontrol runat="server" id="ASIC039" DatabaseField="ASIC039"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
  <def:datafieldcontrol runat="server" id="ASIC040" DatabaseField="ASIC040"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
  <def:datafieldcontrol runat="server" id="ASIC041" DatabaseField="ASIC041"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
  <def:datafieldcontrol runat="server" id="ASIC042" DatabaseField="ASIC042"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
  <def:datafieldcontrol runat="server" id="ASIC043" DatabaseField="ASIC043"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
  <def:datafieldcontrol runat="server" id="ASIC044" DatabaseField="ASIC044"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
  <def:datafieldcontrol runat="server" id="ASIC045" DatabaseField="ASIC045"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
  <def:datafieldcontrol runat="server" id="ASIC046" DatabaseField="ASIC046"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
  </div>
  <div class="key">
  <def:ValueSetLabel ID="ValueSetLabel_ASIC039" runat="server"  DatabaseField="ASIC039"></def:ValueSetLabel>
  </div>
</div>
<h3>Category D</h3>
<div class="collection">
  <div class="main">
  <def:datafieldcontrol runat="server" id="ASID047" DatabaseField="ASID047"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
  <def:datafieldcontrol runat="server" id="ASID048" DatabaseField="ASID048"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
  <def:datafieldcontrol runat="server" id="ASID049" DatabaseField="ASID049"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
  <def:datafieldcontrol runat="server" id="ASID050" DatabaseField="ASID050"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
  <def:datafieldcontrol runat="server" id="ASID051" DatabaseField="ASID051"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
  <def:datafieldcontrol runat="server" id="ASID052" DatabaseField="ASID052"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
  </div>
  <div class="key">
  <def:ValueSetLabel ID="ValueSetLabel_ASID047" runat="server"  DatabaseField="ASID047"></def:ValueSetLabel>
  </div>
</div>
<h3>Category E</h3>
<div class="collection">
  <div class="main">
  <def:datafieldcontrol runat="server" id="ASIE053" DatabaseField="ASIE053"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
  <def:datafieldcontrol runat="server" id="ASIE054" DatabaseField="ASIE054"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
  <def:datafieldcontrol runat="server" id="ASIE055" DatabaseField="ASIE055"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
  <def:datafieldcontrol runat="server" id="ASIE056" DatabaseField="ASIE056"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
  <def:datafieldcontrol runat="server" id="ASIE057" DatabaseField="ASIE057"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
  <def:datafieldcontrol runat="server" id="ASIE058" DatabaseField="ASIE058"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
  <def:datafieldcontrol runat="server" id="ASIE059" DatabaseField="ASIE059"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
  <def:datafieldcontrol runat="server" id="ASIE060" DatabaseField="ASIE060"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
  <def:datafieldcontrol runat="server" id="ASIE061" DatabaseField="ASIE061"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
  <def:datafieldcontrol runat="server" id="ASIE062" DatabaseField="ASIE062"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
  </div>
  <div class="key">
  <def:ValueSetLabel ID="ValueSetLabel_ASIE053" runat="server"  DatabaseField="ASIE053"></def:ValueSetLabel>
  </div>
</div>
<h3>Category F</h3>
<div class="collection">
  <div class="main">
  <def:datafieldcontrol runat="server" id="ASIF063" DatabaseField="ASIF063"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
  <def:datafieldcontrol runat="server" id="ASIF064" DatabaseField="ASIF064"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
  </div>
  <div class="key">
  <def:ValueSetLabel ID="ValueSetLabel_ASIF063" runat="server"  DatabaseField="ASIF063"></def:ValueSetLabel>
  </div>
</div>
<h3>Category G</h3>
<div class="collection">
  <div class="main">
  <def:datafieldcontrol runat="server" id="ASIG065" DatabaseField="ASIG065"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
  <def:datafieldcontrol runat="server" id="ASIG066" DatabaseField="ASIG066"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
  <def:datafieldcontrol runat="server" id="ASIG067" DatabaseField="ASIG067"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
  <def:datafieldcontrol runat="server" id="ASIG068" DatabaseField="ASIG068"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
  <def:datafieldcontrol runat="server" id="ASIG069" DatabaseField="ASIG069"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
  <def:datafieldcontrol runat="server" id="ASIG070" DatabaseField="ASIG070"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
  <def:datafieldcontrol runat="server" id="ASIG071" DatabaseField="ASIG071"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
  <def:datafieldcontrol runat="server" id="ASIG072" DatabaseField="ASIG072"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
  </div>
  <div class="key">
  <def:ValueSetLabel ID="ValueSetLabel_ASIG065" runat="server"  DatabaseField="ASIG065"></def:ValueSetLabel>
  </div>
</div>
<h3>Category H</h3>
<div class="collection">
  <div class="main">
  <def:datafieldcontrol runat="server" id="ASIH073" DatabaseField="ASIH073"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
  <def:datafieldcontrol runat="server" id="ASIH074" DatabaseField="ASIH074"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
  <def:datafieldcontrol runat="server" id="ASIH075" DatabaseField="ASIH075"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
  </div>
  <div class="key">
  <def:ValueSetLabel ID="ValueSetLabel_ASIH073" runat="server"  DatabaseField="ASIH073"></def:ValueSetLabel>
  </div>
</div>
<h3>Category I</h3>
<div class="collection">
  <div class="main">
  <def:datafieldcontrol runat="server" id="ASII076" DatabaseField="ASII076"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
  <def:datafieldcontrol runat="server" id="ASII077" DatabaseField="ASII077"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
  <def:datafieldcontrol runat="server" id="ASII078" DatabaseField="ASII078"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
  <def:datafieldcontrol runat="server" id="ASII079" DatabaseField="ASII079"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
  <def:datafieldcontrol runat="server" id="ASII080" DatabaseField="ASII080"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
  <def:datafieldcontrol runat="server" id="ASII081" DatabaseField="ASII081"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
  </div>
  <div class="key">
  <def:ValueSetLabel ID="ValueSetLabel_ASII076" runat="server"  DatabaseField="ASII076"></def:ValueSetLabel>
  </div>
</div>
<h3>Category J</h3>
<div class="collection">
  <div class="main">
  <def:datafieldcontrol runat="server" id="ASIJ082" DatabaseField="ASIJ082"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
  <def:datafieldcontrol runat="server" id="ASIJ083" DatabaseField="ASIJ083"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
  </div>
  <div class="key">
  <def:ValueSetLabel ID="ValueSetLabel_ASIJ082" runat="server"  DatabaseField="ASIJ082"></def:ValueSetLabel>
  </div>
</div>
<h3>Category K</h3>
<div class="collection">
  <div class="main">
  <def:datafieldcontrol runat="server" id="ASIK084" DatabaseField="ASIK084"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
  <def:datafieldcontrol runat="server" id="ASIK085" DatabaseField="ASIK085"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
  <def:datafieldcontrol runat="server" id="ASIK086" DatabaseField="ASIK086"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
  <def:datafieldcontrol runat="server" id="ASIK087" DatabaseField="ASIK087"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
  <def:datafieldcontrol runat="server" id="ASIK088" DatabaseField="ASIK088"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
  <def:datafieldcontrol runat="server" id="ASIK089" DatabaseField="ASIK089"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
  <def:datafieldcontrol runat="server" id="ASIK090" DatabaseField="ASIK090"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
  </div>
  <div class="key">
  <def:ValueSetLabel ID="ValueSetLabel_ASIK084" runat="server"  DatabaseField="ASIK084"></def:ValueSetLabel>
  </div>
</div>
<div class="collection">
  <div class="main">
  <def:datafieldcontrol runat="server" id="ASIK091" DatabaseField="ASIK091"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
  <def:datafieldcontrol runat="server" id="ASIK092" DatabaseField="ASIK092"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
  <def:datafieldcontrol runat="server" id="ASIK093" DatabaseField="ASIK093"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
  <def:datafieldcontrol runat="server" id="ASIK094" DatabaseField="ASIK094"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
  <def:datafieldcontrol runat="server" id="ASIK095" DatabaseField="ASIK095"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
  <def:datafieldcontrol runat="server" id="ASIK096" DatabaseField="ASIK096"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
  <def:datafieldcontrol runat="server" id="ASIK097" DatabaseField="ASIK097"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
  </div>
  <div class="key">
  <def:ValueSetLabel ID="ValueSetLabel_ASIK091" runat="server"  DatabaseField="ASIK091"></def:ValueSetLabel>
  </div>
</div>
<h3>Category L</h3>
<div class="collection">
  <div class="main">
  <def:datafieldcontrol runat="server" id="ASIL098" DatabaseField="ASIL098"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
  <def:datafieldcontrol runat="server" id="ASIL099" DatabaseField="ASIL099"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
  <def:datafieldcontrol runat="server" id="ASIL100" DatabaseField="ASIL100"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
  <def:datafieldcontrol runat="server" id="ASIL101" DatabaseField="ASIL101"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
  <def:datafieldcontrol runat="server" id="ASIL102" DatabaseField="ASIL102"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
  <def:datafieldcontrol runat="server" id="ASIL103" DatabaseField="ASIL103"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
  <def:datafieldcontrol runat="server" id="ASIL104" DatabaseField="ASIL104"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
  <def:datafieldcontrol runat="server" id="ASIL105" DatabaseField="ASIL105"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
  <def:datafieldcontrol runat="server" id="ASIL106" DatabaseField="ASIL106"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
  </div>
  <div class="key">
  <def:ValueSetLabel ID="ValueSetLabel_ASIL098" runat="server"  DatabaseField="ASIL098"></def:ValueSetLabel>
  </div>
</div>
<h3>Category M</h3>
<div class="collection">
  <div class="main">
  <def:datafieldcontrol runat="server" id="ASIM107" DatabaseField="ASIM107"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
  <def:datafieldcontrol runat="server" id="ASIM108" DatabaseField="ASIM108"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
  <def:datafieldcontrol runat="server" id="ASIM109" DatabaseField="ASIM109"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
  <def:datafieldcontrol runat="server" id="ASIM110" DatabaseField="ASIM110"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
  </div>
  <div class="key">
  <def:ValueSetLabel ID="ValueSetLabel_ASIM107" runat="server"  DatabaseField="ASIM107"></def:ValueSetLabel>
  </div>
</div>
<h3>Category N</h3>
<div class="collection">
  <div class="main">
  <def:datafieldcontrol runat="server" id="ASIN111" DatabaseField="ASIN111"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
  <def:datafieldcontrol runat="server" id="ASIN112" DatabaseField="ASIN112"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
  <def:datafieldcontrol runat="server" id="ASIN113" DatabaseField="ASIN113"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
  <def:datafieldcontrol runat="server" id="ASIN114" DatabaseField="ASIN114"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
  </div>
  <div class="key">
  <def:ValueSetLabel ID="ValueSetLabel_ASIN111" runat="server"  DatabaseField="ASIN111"></def:ValueSetLabel>
  </div>
</div>
<h3>Category O</h3>
<div class="collection">
  <div class="main">
  <def:datafieldcontrol runat="server" id="ASIO115" DatabaseField="ASIO115"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
  <def:datafieldcontrol runat="server" id="ASIO116" DatabaseField="ASIO116"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
  <def:datafieldcontrol runat="server" id="ASIO117" DatabaseField="ASIO117"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
  <def:datafieldcontrol runat="server" id="ASIO118" DatabaseField="ASIO118"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
  <def:datafieldcontrol runat="server" id="ASIO119" DatabaseField="ASIO119"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
  <def:datafieldcontrol runat="server" id="ASIO120" DatabaseField="ASIO120"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
  </div>
  <div class="key">
  <def:ValueSetLabel ID="ValueSetLabel_ASIO115" runat="server"  DatabaseField="ASIO115"></def:ValueSetLabel>
  </div>
</div>
</asp:panel>
<div class="main">
<def:datafieldcontrol runat="server" id="created" DatabaseField="created"  IsReadOnly="true" RenderReadOnlyAsDiv="true"   FieldLabelWidth="300px "></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="createdBy" DatabaseField="createdBy"  IsReadOnly="true" RenderReadOnlyAsDiv="true"   FieldLabelWidth="300px "></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="updated" DatabaseField="updated"  IsReadOnly="true" RenderReadOnlyAsDiv="true"   FieldLabelWidth="300px "></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="updatedBy" DatabaseField="updatedBy"  IsReadOnly="true" RenderReadOnlyAsDiv="true"   FieldLabelWidth="300px "></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="scored" DatabaseField="scored"  IsReadOnly="true" RenderReadOnlyAsDiv="true"   FieldLabelWidth="300px "></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="scoredBy" DatabaseField="scoredBy"  IsReadOnly="true" RenderReadOnlyAsDiv="true"   FieldLabelWidth="300px "></def:datafieldcontrol>
</div>
</asp:Content>
