<%@ Register TagPrefix="def" Namespace="DataEntryFramework3" %> 
<%@ Page language="c#" MasterPageFile="~/UWAC.master"  Title="PSQ Data Entry" %>
<asp:Content ID="Content1" ContentPlaceHolderID="oBodyPlaceHolder" runat="server">
<def:dataentrycontroller id="DataEntryController1" runat="server" DatabaseTable="ALL_PSQ" >
</def:dataentrycontroller>
<def:datafieldcontrol runat="server" id="id" DatabaseField="id"  IsInsertField="true"   FieldLabelWidth="300px "></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="indexnum" DatabaseField="indexnum"  IsInsertField="true"   FieldLabelWidth="300px "></def:datafieldcontrol>
<br />
<asp:panel id="mainPanel" runat="server">
<h2>General Information About Your Child</h2>
<def:datafieldcontrol runat="server" id="PSQHeight" DatabaseField="PSQHeight"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="50px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="PSQWeight" DatabaseField="PSQWeight"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="50px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="PSQGrade" DatabaseField="PSQGrade"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="50px"></def:datafieldcontrol>
<h2>Nighttime and Sleep Behavior</h2>
<def:ValueSetLabel ID="ValueSetLabel_PSQA01" runat="server"  DatabaseField="PSQA01"></def:ValueSetLabel>
<br />
<h3>While sleeping, does your child...</h3>
<def:datafieldcontrol runat="server" id="PSQA01" DatabaseField="PSQA01"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="50px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="PSQA02" DatabaseField="PSQA02"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="50px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="PSQA03" DatabaseField="PSQA03"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="50px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="PSQA04" DatabaseField="PSQA04"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="50px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="PSQA05" DatabaseField="PSQA05"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="50px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="PSQA06" DatabaseField="PSQA06"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="50px"></def:datafieldcontrol>
<h3>Have you ever...</h3>
<def:datafieldcontrol runat="server" id="PSQA07" DatabaseField="PSQA07"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="50px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="PSQA07d" DatabaseField="PSQA07d"  IsEntryField="true" IsDoubleEntryField="false"  FieldLabelWidth="300px" FieldTextBoxWidth="500px" FieldTextBoxHeight="60px" FieldTextBoxTextMode="MultiLine"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="PSQA08" DatabaseField="PSQA08"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="50px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="PSQA09" DatabaseField="PSQA09"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="50px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="PSQA11" DatabaseField="PSQA11"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="50px"></def:datafieldcontrol>
<h3>Does your child...</h3>
<def:datafieldcontrol runat="server" id="PSQA12" DatabaseField="PSQA12"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="50px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="PSQA13" DatabaseField="PSQA13"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="50px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="PSQA13a" DatabaseField="PSQA13a"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="50px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="PSQA13b" DatabaseField="PSQA13b"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="50px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="PSQA14" DatabaseField="PSQA14"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="50px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="PSQA14a" DatabaseField="PSQA14a"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="50px"></def:datafieldcontrol>
<h3>At night, does your child usually...</h3>
<def:datafieldcontrol runat="server" id="PSQA15" DatabaseField="PSQA15"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="50px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="PSQA16" DatabaseField="PSQA16"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="50px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="PSQA17" DatabaseField="PSQA17"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="50px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="PSQA17d" DatabaseField="PSQA17d"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="50px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="PSQA21" DatabaseField="PSQA21"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="50px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="PSQA22" DatabaseField="PSQA22"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="50px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="PSQA23" DatabaseField="PSQA23"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="50px"></def:datafieldcontrol>
<h3>Does your child...</h3>
<def:datafieldcontrol runat="server" id="PSQA24" DatabaseField="PSQA24"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="50px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="PSQA25" DatabaseField="PSQA25"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="50px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="PSQA27" DatabaseField="PSQA27"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="50px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="PSQA29" DatabaseField="PSQA29"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="50px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="PSQA30" DatabaseField="PSQA30"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="50px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="PSQA32" DatabaseField="PSQA32"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="50px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="PSQA33" DatabaseField="PSQA33"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="50px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="PSQA34" DatabaseField="PSQA34"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="50px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="PSQA35" DatabaseField="PSQA35"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="50px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="PSQA36" DatabaseField="PSQA36"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="50px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="PSQA37" DatabaseField="PSQA37"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="50px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="PSQA37d" DatabaseField="PSQA37d"  IsEntryField="true" IsDoubleEntryField="false"  FieldLabelWidth="300px" FieldTextBoxWidth="500px" FieldTextBoxHeight="60px" FieldTextBoxTextMode="MultiLine"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="PSQA40" DatabaseField="PSQA40"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="50px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="PSQA41" DatabaseField="PSQA41"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="50px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="PSQA42" DatabaseField="PSQA42"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="50px"></def:datafieldcontrol>
<h3>Does your child...</h3>
<def:datafieldcontrol runat="server" id="PSQA43" DatabaseField="PSQA43"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="50px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="PSQA44" DatabaseField="PSQA44"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="50px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="PSQA45" DatabaseField="PSQA45"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="50px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="PSQA46" DatabaseField="PSQA46"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="50px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="PSQA47" DatabaseField="PSQA47"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="50px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="PSQA48" DatabaseField="PSQA48"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="50px"></def:datafieldcontrol>
<h3>What time does your child usually...</h3>
<def:datafieldcontrol runat="server" id="PSQA49" DatabaseField="PSQA49"  IsEntryField="true" IsDoubleEntryField="false"  FieldLabelWidth="300px" FieldTextBoxWidth="300px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="PSQA50" DatabaseField="PSQA50"  IsEntryField="true" IsDoubleEntryField="false"  FieldLabelWidth="300px" FieldTextBoxWidth="300px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="PSQA51" DatabaseField="PSQA51"  IsEntryField="true" IsDoubleEntryField="false"  FieldLabelWidth="300px" FieldTextBoxWidth="300px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="PSQA52" DatabaseField="PSQA52"  IsEntryField="true" IsDoubleEntryField="false"  FieldLabelWidth="300px" FieldTextBoxWidth="300px"></def:datafieldcontrol>
<h2>Daytime behavior and other possible problems</h2>
<def:ValueSetLabel ID="ValueSetLabel_PSQB01" runat="server"  DatabaseField="PSQB01"></def:ValueSetLabel>
<br />
<h3>Does your child...</h3>
<def:datafieldcontrol runat="server" id="PSQB01" DatabaseField="PSQB01"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="50px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="PSQB02" DatabaseField="PSQB02"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="50px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="PSQB03" DatabaseField="PSQB03"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="50px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="PSQB04" DatabaseField="PSQB04"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="50px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="PSQB05" DatabaseField="PSQB05"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="50px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="PSQB06" DatabaseField="PSQB06"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="50px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="PSQB07" DatabaseField="PSQB07"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="50px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="PSQB08" DatabaseField="PSQB08"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="50px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="PSQB09" DatabaseField="PSQB09"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="50px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="PSQB09d" DatabaseField="PSQB09d"  IsEntryField="true" IsDoubleEntryField="false"  FieldLabelWidth="300px" FieldTextBoxWidth="500px" FieldTextBoxHeight="60px" FieldTextBoxTextMode="MultiLine"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="PSQB10" DatabaseField="PSQB10"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="50px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="PSQB10d" DatabaseField="PSQB10d"  IsEntryField="true" IsDoubleEntryField="false"  FieldLabelWidth="300px" FieldTextBoxWidth="500px" FieldTextBoxHeight="60px" FieldTextBoxTextMode="MultiLine"></def:datafieldcontrol>
<b3>Has your child ever...</b3>
<def:datafieldcontrol runat="server" id="PSQB11" DatabaseField="PSQB11"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="50px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="PSQB11d" DatabaseField="PSQB11d"  IsEntryField="true" IsDoubleEntryField="false"  FieldLabelWidth="300px" FieldTextBoxWidth="500px" FieldTextBoxHeight="60px" FieldTextBoxTextMode="MultiLine"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="PSQB12" DatabaseField="PSQB12"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="50px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="PSQB12a" DatabaseField="PSQB12a"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="50px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="PSQB13" DatabaseField="PSQB13"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="50px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="PSQB15" DatabaseField="PSQB15"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="50px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="PSQB16" DatabaseField="PSQB16"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="50px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="PSQB17" DatabaseField="PSQB17"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="50px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="PSQB18" DatabaseField="PSQB18"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="50px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="PSQB18a" DatabaseField="PSQB18a"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="50px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="PSQB19" DatabaseField="PSQB19"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="50px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="PSQB19d" DatabaseField="PSQB19d"  IsEntryField="true" IsDoubleEntryField="false"  FieldLabelWidth="300px" FieldTextBoxWidth="500px" FieldTextBoxHeight="60px" FieldTextBoxTextMode="MultiLine"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="PSQB20" DatabaseField="PSQB20"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="50px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="PSQB20d" DatabaseField="PSQB20d"  IsEntryField="true" IsDoubleEntryField="false"  FieldLabelWidth="300px" FieldTextBoxWidth="500px" FieldTextBoxHeight="60px" FieldTextBoxTextMode="MultiLine"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="PSQB22" DatabaseField="PSQB22"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="50px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="PSQ22a" DatabaseField="PSQ22a"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="50px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="PSQB23" DatabaseField="PSQB23"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="50px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="PSQB24" DatabaseField="PSQB24"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="50px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="PSQB25" DatabaseField="PSQB25"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px" FieldTextBoxWidth="50px"></def:datafieldcontrol>
<h2>Other Information</h2>
<def:datafieldcontrol runat="server" id="PSQC011" DatabaseField="PSQC011"  IsEntryField="true" IsDoubleEntryField="false"  FieldLabelWidth="300px" FieldTextBoxWidth="500px" FieldTextBoxHeight="60px" FieldTextBoxTextMode="MultiLine"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="PSQC012" DatabaseField="PSQC012"  IsEntryField="true" IsDoubleEntryField="false"  FieldLabelWidth="300px" FieldTextBoxWidth="500px" FieldTextBoxHeight="60px" FieldTextBoxTextMode="MultiLine"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="PSQC013" DatabaseField="PSQC013"  IsEntryField="true" IsDoubleEntryField="false"  FieldLabelWidth="300px" FieldTextBoxWidth="500px" FieldTextBoxHeight="60px" FieldTextBoxTextMode="MultiLine"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="PSQC02" DatabaseField="PSQC02"  IsEntryField="true" IsDoubleEntryField="false"  FieldLabelWidth="300px" FieldTextBoxWidth="500px" FieldTextBoxHeight="60px" FieldTextBoxTextMode="MultiLine"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="PSQC03" DatabaseField="PSQC03"  IsEntryField="true" IsDoubleEntryField="false"  FieldLabelWidth="300px" FieldTextBoxWidth="500px" FieldTextBoxHeight="60px" FieldTextBoxTextMode="MultiLine"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="PSQC04" DatabaseField="PSQC04"  IsEntryField="true" IsDoubleEntryField="false"  FieldLabelWidth="300px" FieldTextBoxWidth="500px" FieldTextBoxHeight="60px" FieldTextBoxTextMode="MultiLine"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="PSQC05" DatabaseField="PSQC05"  IsEntryField="true" IsDoubleEntryField="false"  FieldLabelWidth="300px" FieldTextBoxWidth="500px" FieldTextBoxHeight="60px" FieldTextBoxTextMode="MultiLine"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="PSQC06" DatabaseField="PSQC06"  IsEntryField="true" IsDoubleEntryField="false"  FieldLabelWidth="300px" FieldTextBoxWidth="500px" FieldTextBoxHeight="60px" FieldTextBoxTextMode="MultiLine"></def:datafieldcontrol>
<h2>Additional Comments</h2>
<def:datafieldcontrol runat="server" id="PSQDCom" DatabaseField="PSQDCom"  IsEntryField="true" IsDoubleEntryField="false"  FieldLabelWidth="300px" FieldTextBoxWidth="500px" FieldTextBoxHeight="60px" FieldTextBoxTextMode="MultiLine"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="PSQDNote" DatabaseField="PSQDNote"  IsEntryField="true" IsDoubleEntryField="false"  FieldLabelWidth="300px" FieldTextBoxWidth="500px" FieldTextBoxHeight="60px" FieldTextBoxTextMode="MultiLine"></def:datafieldcontrol>
<def:ValueSetLabel ID="ValueSetLabel_PSQD01" runat="server"  DatabaseField="PSQD01"></def:ValueSetLabel>
<br />
<def:datafieldcontrol runat="server" id="PSQD01" DatabaseField="PSQD01"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px "></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="PSQD02" DatabaseField="PSQD02"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px "></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="PSQD03" DatabaseField="PSQD03"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px "></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="PSQD04" DatabaseField="PSQD04"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px "></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="PSQD05" DatabaseField="PSQD05"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px "></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="PSQD06" DatabaseField="PSQD06"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="300px "></def:datafieldcontrol>
</asp:panel>
<br />
<def:datafieldcontrol runat="server" id="created" DatabaseField="created"  IsReadOnly="true" RenderReadOnlyAsDiv="true"   FieldLabelWidth="300px "></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="createdBy" DatabaseField="createdBy"  IsReadOnly="true" RenderReadOnlyAsDiv="true"   FieldLabelWidth="300px "></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="updated" DatabaseField="updated"  IsReadOnly="true" RenderReadOnlyAsDiv="true"   FieldLabelWidth="300px "></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="updatedBy" DatabaseField="updatedBy"  IsReadOnly="true" RenderReadOnlyAsDiv="true"   FieldLabelWidth="300px "></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="scored" DatabaseField="scored"  IsReadOnly="true" RenderReadOnlyAsDiv="true"   FieldLabelWidth="300px "></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="scoredBy" DatabaseField="scoredBy"  IsReadOnly="true" RenderReadOnlyAsDiv="true"   FieldLabelWidth="300px "></def:datafieldcontrol>
</asp:Content>
