<%@ Register TagPrefix="def" Namespace="DataEntryFramework3" %> 
<%@ Page language="c#" MasterPageFile="~/UWAC.master"  Title="CCC_2 Data Entry" %>
<asp:Content ID="Content1" ContentPlaceHolderID="oBodyPlaceHolder" runat="server">

<def:dataentrycontroller id="DataEntryController1" runat="server" DatabaseTable="ALL_CCC_2" PrimaryKeyField = "CCC2pk" >
</def:dataentrycontroller>
<div class="main">
  <def:datafieldcontrol runat="server" id="id" DatabaseField="id" IsInsertField="true" FieldLabelWidth="300px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="15"></def:datafieldcontrol>
  <def:datafieldcontrol runat="server" id="indexnum" DatabaseField="indexnum" IsInsertField="true" FieldTextBoxTextDefault="1" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
  <def:datafieldcontrol runat="server" id="DateComp" DatabaseField="CCC2DateComp" FieldLabelText="Date Completed" IsInsertField="true" FieldLabelWidth="300px"></def:datafieldcontrol>
  <def:datafieldcontrol runat="server" id="Relation" DatabaseField="CCC2Relation" FieldLabelText="Relationship to child" IsInsertField="true" FieldLabelWidth="300px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="50"></def:datafieldcontrol>
  
    <table>
        <tr>
            <td>
                    <def:datafieldcontrol runat="server" id="CompBy" DatabaseField="CCC2CompBy" FieldLabelText="Relationship to child (code)" IsInsertField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px" FieldTextBoxMaxLength="50"></def:datafieldcontrol>
            </td>
            <td><def:ValueSetLabel ID="ValueSetLabelCCC2CompBy" runat="server"  DatabaseField="CCC2CompBy"></def:ValueSetLabel></td>
        </tr>
    </table>
  <def:datafieldcontrol runat="server" id="Known" DatabaseField="CCC2Known" FieldLabelText="How long have you known this child?" IsInsertField="true" FieldLabelWidth="300px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="50"></def:datafieldcontrol>
</div> 
<asp:panel id="mainPanel" CssClass="mainPanel" runat="server">
<div class="collection">
  <div class="main"><def:datafieldcontrol runat="server" id="Hearing" DatabaseField="CCC2Hearing" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
  <div class="key"><def:ValueSetLabel ID="ValueSetLabel_Hearing" runat="server"  DatabaseField="CCC2Hearing"></def:ValueSetLabel></div>
</div> 
<div class="main"><def:datafieldcontrol runat="server" id="SpHearin" DatabaseField="CCC2SpHearin" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="300px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="200"></def:datafieldcontrol></div>
<div class="collection">
  <div class="main"><def:datafieldcontrol runat="server" id="English" DatabaseField="CCC2English" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
  <div class="key"><def:ValueSetLabel ID="ValueSetLabel_English" runat="server"  DatabaseField="CCC2English"></def:ValueSetLabel></div>
</div>
<div class="main"><def:datafieldcontrol runat="server" id="SpEnglis" DatabaseField="CCC2SpEnglis" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="300px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="200"></def:datafieldcontrol></div>
<div class="collection">
  <div class="main"><def:datafieldcontrol runat="server" id="Sentence" DatabaseField="CCC2Sentence" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
  <div class="key"><def:ValueSetLabel ID="ValueSetLabel_Sentence" runat="server"  DatabaseField="CCC2Sentence"></def:ValueSetLabel></div>
</div>
<div class="main">
  <def:datafieldcontrol runat="server" id="SpSenten" DatabaseField="CCC2SpSenten" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="300px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="200"></def:datafieldcontrol>
  <def:datafieldcontrol runat="server" id="Comments" DatabaseField="CCC2Comments" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="300px" FieldTextBoxWidth="400px" FieldTextBoxHeight="40px" FieldTextBoxTextMode="multiline" FieldTextBoxMaxLength="500"></def:datafieldcontrol>
</div>
<br/>
<br/>
<br/>
<div class="main">
<br/>
<font color="navy">
    <Table border = "1pt", width=800, style="solid">
    
    <tr>
        <td width=500><b>Scoring</b></td>
        <td width=200><b>Subscale</b></td>
        <td width=50><b>Scaled Score</b></td>
        <td width=50><b>Raw Score</b></td>
    </tr>
        <tr>
            <td>
          <def:datafieldcontrol runat="server" id="CCC2ageym" DatabaseField="CCC2ageym" IsReadOnly="true" RenderReadOnlyAsDiv="true"  FieldLabelWidth="400px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="200"></def:datafieldcontrol>
          <def:datafieldcontrol runat="server" id="CCC2_GCCsumscale" DatabaseField="CCC2_GCCsumscale" IsReadOnly="true" RenderReadOnlyAsDiv="true"  FieldLabelWidth="400px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="200"></def:datafieldcontrol>
          
          <b>
          <def:datafieldcontrol runat="server" id="CCC2_GCCss" DatabaseField="CCC2_GCCss" IsReadOnly="true" RenderReadOnlyAsDiv="true"  FieldLabelWidth="400px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="200"></def:datafieldcontrol>
          </b>
          
          <def:datafieldcontrol runat="server" id="CCC2_GCCpct" DatabaseField="CCC2_GCCpct" IsReadOnly="true" RenderReadOnlyAsDiv="true"  FieldLabelWidth="400px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="200"></def:datafieldcontrol>
          <def:datafieldcontrol runat="server" id="CCC2_SIDI" DatabaseField="CCC2_SIDI" IsReadOnly="true" RenderReadOnlyAsDiv="true"  FieldLabelWidth="400px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="200"></def:datafieldcontrol>
          
          <br/>
          <def:datafieldcontrol runat="server" id="CCC2_conchk" DatabaseField="CCC2_conchk" IsReadOnly="true" RenderReadOnlyAsDiv="true"  FieldLabelWidth="400px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="200"></def:datafieldcontrol>
          <def:datafieldcontrol runat="server" id="sectAtotal" DatabaseField="sectAtotal" IsReadOnly="true" RenderReadOnlyAsDiv="true"  FieldLabelWidth="400px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="200"></def:datafieldcontrol>
          <def:datafieldcontrol runat="server" id="sectBtotal" DatabaseField="sectBtotal" IsReadOnly="true" RenderReadOnlyAsDiv="true"  FieldLabelWidth="400px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="200"></def:datafieldcontrol>
          
          <br/>
          <def:datafieldcontrol runat="server" id="CCC2_scrmsg" DatabaseField="CCC2_scrmsg" IsReadOnly="true" RenderReadOnlyAsDiv="true"  FieldLabelWidth="400px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="200"></def:datafieldcontrol>
            </td>
            <td><font color="navy">
            A) Speech <br/>  
            B) Syntax <br/>  
            C) Semantics <br/>  
            D) Coherence <br/>  
            E) Initiation <br/>  
            F) Scripted Language <br/>  
            G) Context <br/>  
            H) Nonverbal Communication <br/>  
            I) Social Relations <br/>  
            J) Interests <br/> 
</font>
            </td>
            <td>
            <b>
                  <def:datafieldcontrol runat="server" id="CCC2_ss_speech"     DatabaseField="CCC2_ss_speech" IsReadOnly="true" RenderReadOnlyAsDiv="true"     ShowFieldLabel="false"  FieldTextBoxWidth="250px" FieldTextBoxMaxLength="200"></def:datafieldcontrol>
            <def:datafieldcontrol runat="server" id="CCC2_ss_syntax"     DatabaseField="CCC2_ss_syntax" IsReadOnly="true" RenderReadOnlyAsDiv="true"      ShowFieldLabel="false"  FieldTextBoxWidth="250px" FieldTextBoxMaxLength="200"></def:datafieldcontrol>
            <def:datafieldcontrol runat="server" id="CCC2_ss_semantics"  DatabaseField="CCC2_ss_semantics" IsReadOnly="true" RenderReadOnlyAsDiv="true"   ShowFieldLabel="false"  FieldTextBoxWidth="250px" FieldTextBoxMaxLength="200"></def:datafieldcontrol>
            <def:datafieldcontrol runat="server" id="CCC2_ss_coherence"  DatabaseField="CCC2_ss_coherence" IsReadOnly="true" RenderReadOnlyAsDiv="true"   ShowFieldLabel="false"  FieldTextBoxWidth="250px" FieldTextBoxMaxLength="200"></def:datafieldcontrol>
            <def:datafieldcontrol runat="server" id="CCC2_ss_initiation" DatabaseField="CCC2_ss_initiation" IsReadOnly="true" RenderReadOnlyAsDiv="true"   ShowFieldLabel="false"  FieldTextBoxWidth="250px" FieldTextBoxMaxLength="200"></def:datafieldcontrol>
            <def:datafieldcontrol runat="server" id="CCC2_ss_scriptlang" DatabaseField="CCC2_ss_scriptlang" IsReadOnly="true" RenderReadOnlyAsDiv="true"   ShowFieldLabel="false"  FieldTextBoxWidth="250px" FieldTextBoxMaxLength="200"></def:datafieldcontrol>
            <def:datafieldcontrol runat="server" id="CCC2_ss_context"    DatabaseField="CCC2_ss_context" IsReadOnly="true" RenderReadOnlyAsDiv="true"     ShowFieldLabel="false"  FieldTextBoxWidth="250px" FieldTextBoxMaxLength="200"></def:datafieldcontrol>
            <def:datafieldcontrol runat="server" id="CCC2_ss_nonverbal"  DatabaseField="CCC2_ss_nonverbal" IsReadOnly="true" RenderReadOnlyAsDiv="true"   ShowFieldLabel="false"  FieldTextBoxWidth="250px" FieldTextBoxMaxLength="200"></def:datafieldcontrol>
            <def:datafieldcontrol runat="server" id="CCC2_ss_socialrel"  DatabaseField="CCC2_ss_socialrel" IsReadOnly="true" RenderReadOnlyAsDiv="true"   ShowFieldLabel="false"  FieldTextBoxWidth="250px" FieldTextBoxMaxLength="200"></def:datafieldcontrol>
            <def:datafieldcontrol runat="server" id="CCC2_ss_interests"  DatabaseField="CCC2_ss_interests" IsReadOnly="true" RenderReadOnlyAsDiv="true"   ShowFieldLabel="false"  FieldTextBoxWidth="250px" FieldTextBoxMaxLength="200"></def:datafieldcontrol>
</b>

</td>
            <td>
 
              <def:datafieldcontrol runat="server" id="CCC2_totraw_speech"     DatabaseField="CCC2_totraw_speech" IsReadOnly="true" RenderReadOnlyAsDiv="true"   ShowFieldLabel="false"  FieldTextBoxWidth="250px" FieldTextBoxMaxLength="200"></def:datafieldcontrol>
            <def:datafieldcontrol runat="server" id="CCC2_totraw_syntax"     DatabaseField="CCC2_totraw_syntax" IsReadOnly="true" RenderReadOnlyAsDiv="true"   ShowFieldLabel="false"  FieldTextBoxWidth="250px" FieldTextBoxMaxLength="200"></def:datafieldcontrol>
            <def:datafieldcontrol runat="server" id="CCC2_totraw_semantics"  DatabaseField="CCC2_totraw_semantics" IsReadOnly="true" RenderReadOnlyAsDiv="true"   ShowFieldLabel="false"  FieldTextBoxWidth="250px" FieldTextBoxMaxLength="200"></def:datafieldcontrol>
            <def:datafieldcontrol runat="server" id="CCC2_totraw_coherence"  DatabaseField="CCC2_totraw_coherence" IsReadOnly="true" RenderReadOnlyAsDiv="true"   ShowFieldLabel="false"  FieldTextBoxWidth="250px" FieldTextBoxMaxLength="200"></def:datafieldcontrol>
            <def:datafieldcontrol runat="server" id="CCC2_totraw_initiation" DatabaseField="CCC2_totraw_initiation" IsReadOnly="true" RenderReadOnlyAsDiv="true"   ShowFieldLabel="false"  FieldTextBoxWidth="250px" FieldTextBoxMaxLength="200"></def:datafieldcontrol>
            <def:datafieldcontrol runat="server" id="CCC2_totraw_scriptlang" DatabaseField="CCC2_totraw_scriptlang" IsReadOnly="true" RenderReadOnlyAsDiv="true"   ShowFieldLabel="false"  FieldTextBoxWidth="250px" FieldTextBoxMaxLength="200"></def:datafieldcontrol>
            <def:datafieldcontrol runat="server" id="CCC2_totraw_context"    DatabaseField="CCC2_totraw_context" IsReadOnly="true" RenderReadOnlyAsDiv="true"   ShowFieldLabel="false"  FieldTextBoxWidth="250px" FieldTextBoxMaxLength="200"></def:datafieldcontrol>
            <def:datafieldcontrol runat="server" id="CCC2_totraw_nonverbal"  DatabaseField="CCC2_totraw_nonverbal" IsReadOnly="true" RenderReadOnlyAsDiv="true"   ShowFieldLabel="false"  FieldTextBoxWidth="250px" FieldTextBoxMaxLength="200"></def:datafieldcontrol>
            <def:datafieldcontrol runat="server" id="CCC2_totraw_socialrel"  DatabaseField="CCC2_totraw_socialrel" IsReadOnly="true" RenderReadOnlyAsDiv="true"   ShowFieldLabel="false"  FieldTextBoxWidth="250px" FieldTextBoxMaxLength="200"></def:datafieldcontrol>
            <def:datafieldcontrol runat="server" id="CCC2_totraw_interests"  DatabaseField="CCC2_totraw_interests" IsReadOnly="true" RenderReadOnlyAsDiv="true"   ShowFieldLabel="false"  FieldTextBoxWidth="250px" FieldTextBoxMaxLength="200"></def:datafieldcontrol>
            </td>

        </tr>
    </Table>
    </font>
</div>


<br/>
<br/>

<h3>Checklist</h3>
<div class="collection">
  <div class="main">
    <def:datafieldcontrol runat="server" id="S01" DatabaseField="CCC2itm01" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="S02" DatabaseField="CCC2itm02" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="S03" DatabaseField="CCC2itm03" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="S04" DatabaseField="CCC2itm04" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="S05" DatabaseField="CCC2itm05" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="S06" DatabaseField="CCC2itm06" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="S07" DatabaseField="CCC2itm07" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="S08" DatabaseField="CCC2itm08" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="S09" DatabaseField="CCC2itm09" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="S10" DatabaseField="CCC2itm10" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="S11" DatabaseField="CCC2itm11" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="S12" DatabaseField="CCC2itm12" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="S13" DatabaseField="CCC2itm13" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="S14" DatabaseField="CCC2itm14" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="S15" DatabaseField="CCC2itm15" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="S16" DatabaseField="CCC2itm16" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="S17" DatabaseField="CCC2itm17" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="S18" DatabaseField="CCC2itm18" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="S19" DatabaseField="CCC2itm19" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="S20" DatabaseField="CCC2itm20" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="S21" DatabaseField="CCC2itm21" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="S22" DatabaseField="CCC2itm22" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="S23" DatabaseField="CCC2itm23" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="S24" DatabaseField="CCC2itm24" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="S25" DatabaseField="CCC2itm25" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
  </div>
  <div class="key"><def:ValueSetLabel ID="ValueSetLabel_S01" runat="server"  DatabaseField="CCC2itm01"></def:ValueSetLabel></div>
</div>
<div class="collection">
  <div class="main">
    <def:datafieldcontrol runat="server" id="S26" DatabaseField="CCC2itm26" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="S27" DatabaseField="CCC2itm27" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="S28" DatabaseField="CCC2itm28" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="S29" DatabaseField="CCC2itm29" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="S30" DatabaseField="CCC2itm30" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="S31" DatabaseField="CCC2itm31" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="S32" DatabaseField="CCC2itm32" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="S33" DatabaseField="CCC2itm33" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="S34" DatabaseField="CCC2itm34" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="S35" DatabaseField="CCC2itm35" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="S36" DatabaseField="CCC2itm36" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="S37" DatabaseField="CCC2itm37" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="S38" DatabaseField="CCC2itm38" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="S39" DatabaseField="CCC2itm39" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="S40" DatabaseField="CCC2itm40" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="S41" DatabaseField="CCC2itm41" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="S42" DatabaseField="CCC2itm42" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="S43" DatabaseField="CCC2itm43" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="S44" DatabaseField="CCC2itm44" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="S45" DatabaseField="CCC2itm45" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="S46" DatabaseField="CCC2itm46" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="S47" DatabaseField="CCC2itm47" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="S48" DatabaseField="CCC2itm48" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="S49" DatabaseField="CCC2itm49" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="S50" DatabaseField="CCC2itm50" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
  </div>
  <div class="key"><def:ValueSetLabel ID="ValueSetLabel_S26" runat="server"  DatabaseField="CCC2itm26"></def:ValueSetLabel></div>
</div>
<div class="collection">
  <div class="main">
    <def:datafieldcontrol runat="server" id="S51" DatabaseField="CCC2itm51" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="S52" DatabaseField="CCC2itm52" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="S53" DatabaseField="CCC2itm53" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="S54" DatabaseField="CCC2itm54" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="S55" DatabaseField="CCC2itm55" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="S56" DatabaseField="CCC2itm56" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="S57" DatabaseField="CCC2itm57" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="S58" DatabaseField="CCC2itm58" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="S59" DatabaseField="CCC2itm59" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="S60" DatabaseField="CCC2itm60" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="S61" DatabaseField="CCC2itm61" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="S62" DatabaseField="CCC2itm62" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="S63" DatabaseField="CCC2itm63" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="S64" DatabaseField="CCC2itm64" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="S65" DatabaseField="CCC2itm65" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="S66" DatabaseField="CCC2itm66" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="S67" DatabaseField="CCC2itm67" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="S68" DatabaseField="CCC2itm68" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="S69" DatabaseField="CCC2itm69" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="S70" DatabaseField="CCC2itm70" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
  </div>
  <div class="key"><def:ValueSetLabel ID="ValueSetLabel_S51" runat="server"  DatabaseField="CCC2itm51"></def:ValueSetLabel></div>
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
