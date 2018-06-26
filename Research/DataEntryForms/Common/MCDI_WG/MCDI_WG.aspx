<%@ Register TagPrefix="def" Namespace="DataEntryFramework3" %> 
<%@ Page language="c#" MasterPageFile="~/UWAC.master"  Title="MCDI WG Data Entry" %>
<asp:Content ID="Content1" ContentPlaceHolderID="oBodyPlaceHolder" runat="server">

<def:dataentrycontroller id="DataEntryController1" runat="server" DatabaseTable="all_mcdi_wg" PrimaryKeyField="mwg_pk">
</def:dataentrycontroller>
   <asp:ScriptManager ID="ScriptManager1" runat="server">    </asp:ScriptManager>
<asp:UpdatePanel ID="UpdatePanel1" runat="server">
  <ContentTemplate>
<table>

 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="id" DatabaseField="id" IsInsertField="true" FieldLabelWidth="300px" FieldTextBoxWidth="120px" FieldTextBoxMaxLength="15"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="indexnum" DatabaseField="indexnum" IsInsertField="true" FieldTextBoxTextDefault="1" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="mwgdate" DatabaseField="mwgdate" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px"  FieldTextBoxWidth="80px" FormatString="{0:d}" ></def:datafieldcontrol></td>

<td style="vertical-align:top"><def:datafieldcontrol runat="server" id="mwgagem" DatabaseField="mwgagem"  IsReadOnly="true" RenderReadOnlyAsDiv="true"  FieldLabelWidth="100px" FieldTextBoxWidth="35px"></def:datafieldcontrol> <def:datafieldcontrol runat="server" id="mwgsex" DatabaseField="mwgsex" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="50px" FieldTextBoxWidth="100px" FieldTextBoxMaxLength="1"></def:datafieldcontrol>
</td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="mwgrelat" DatabaseField="mwgrelat" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="300px" FieldTextBoxWidth="120px" FieldTextBoxMaxLength="50"></def:datafieldcontrol></td>
<td></td></tr>
 
 <tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="mwgcmnt" DatabaseField="mwgcmnt" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="300px" FieldTextBoxWidth="400px" FieldTextBoxHeight="40px" FieldTextBoxTextMode="multiline" FieldTextBoxMaxLength="500"></def:datafieldcontrol></td>
<td></td></tr>
 
 </table>

      <asp:Panel ID="Panel1" runat="server" BackColor="AliceBlue">
      
<br/><br/>
      <asp:Label ID="Label2" runat="server" Text="Child Report Form<br/>CDI: Words and Gestures" Font-Size="Medium" Font-Bold="true"></asp:Label><br />

<br />
<br />
            <asp:Label ID="Label3" runat="server" Text="PART I. EARLY WORDS" Font-Size="Small" Font-Bold="true"></asp:Label><br />
<br />
            <asp:Label ID="Label5" runat="server" Text="First Signs of Understanding" Font-Size="Small" Font-Bold="true"></asp:Label><br />

 <table>

 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="mwgrname" DatabaseField="mwgrname" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="mwgrno" DatabaseField="mwgrno" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="mwgrmom" DatabaseField="mwgrmom" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="mwgphrur" DatabaseField="mwgphrur" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td width = "180px"><def:datafieldcontrol runat="server" id="mwgphrut" DatabaseField="mwgphrut"  IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="60px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="5"></def:datafieldcontrol></td>
<td ><def:datafieldcontrol runat="server" id="mwgphaet" DatabaseField="mwgphaet" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="80px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="10"></def:datafieldcontrol></td>

</tr>
 
<tr><td>    <asp:Label ID="Label7" runat="server" Text="<br/>Starting to Talk" Font-Size="Small" Font-Bold="true"></asp:Label><br />
</td></tr>
<tr><td style="vertical-align:top">

<def:datafieldcontrol runat="server" id="mwgimit" DatabaseField="mwgimit" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td><def:datafieldcontrol runat="server" id="mwgimitp" DatabaseField="mwgimitp" IsReadOnly="true" RenderReadOnlyAsDiv="true"  FieldLabelWidth="60px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="mwglabl" DatabaseField="mwglabl" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td><def:datafieldcontrol runat="server" id="mwglablp" DatabaseField="mwglablp"  IsReadOnly="true" RenderReadOnlyAsDiv="true"  FieldLabelWidth="60px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
</td></tr>
 

 <tr><td><asp:Label ID="Label6" runat="server" Text="<br/>Vocabulary Checklist" Font-Size="Small" Font-Bold="true"></asp:Label><br /></td></tr>
<tr><td style="vertical-align:top">
    

<def:datafieldcontrol runat="server" id="mwgundr" DatabaseField="mwgundr" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td width = "180px"><def:datafieldcontrol runat="server" id="mwgundt" DatabaseField="mwgundt" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="60px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="5"></def:datafieldcontrol></td>
<td ><def:datafieldcontrol runat="server" id="mwgunaet" DatabaseField="mwgunaet" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="80px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="10"></def:datafieldcontrol></td>

</tr>
 

<tr><td style="vertical-align:top">
</td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="mwgprodr" DatabaseField="mwgprodr" IsReadOnly="true" RenderReadOnlyAsDiv="true"  FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td width = "180px"><def:datafieldcontrol runat="server" id="mwgprodt" DatabaseField="mwgprodt" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="60px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="5"></def:datafieldcontrol></td>
<td ><def:datafieldcontrol runat="server" id="mwgpraet" DatabaseField="mwgpraet" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="80px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="10"></def:datafieldcontrol></td>

</tr>
 
 
<tr><td style="vertical-align:top">
<asp:Label ID="Label4" runat="server" Text="<br/>PART II. ACTIONS AND GESTURES" Font-Size="Small" Font-Bold="true"></asp:Label><br />
</td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="mwgerlyr" DatabaseField="mwgerlyr" IsReadOnly="true" RenderReadOnlyAsDiv="true"  FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td><def:datafieldcontrol runat="server" id="mwgerlyt" DatabaseField="mwgerlyt" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="60px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="5"></def:datafieldcontrol></td>
<td ><def:datafieldcontrol runat="server" id="mwgegaet" DatabaseField="mwgegaet" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="80px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="10"></def:datafieldcontrol></td>
</tr>
 

 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="mwglatr" DatabaseField="mwglatr" IsReadOnly="true" RenderReadOnlyAsDiv="true"  FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td width = "180px"><def:datafieldcontrol runat="server" id="mwglatt" DatabaseField="mwglatt" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="60px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="5"></def:datafieldcontrol></td>
<td ><def:datafieldcontrol runat="server" id="mwglgaet" DatabaseField="mwglgaet" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="80px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="10"></def:datafieldcontrol></td>

</tr>
 
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="mwgtotr" DatabaseField="mwgtotr" IsReadOnly="true" RenderReadOnlyAsDiv="true"  FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td width = "180px"><def:datafieldcontrol runat="server" id="mwgtott" DatabaseField="mwgtott" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="60px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="5"></def:datafieldcontrol></td>
<td ><def:datafieldcontrol runat="server" id="mwgtgaet" DatabaseField="mwgtgaet" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="80px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="10"></def:datafieldcontrol></td>

</tr>
  </table>

  <table>
<tr><td style="vertical-align:top">
</td>
<td></td></tr>
 
<%--<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="mwgpreto" DatabaseField="mwgpreto" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td></td></tr>--%>
 

<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="scoremsg" DatabaseField="scoremsg" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="300px" FieldTextBoxWidth="400px" FieldTextBoxHeight="40px" FieldTextBoxTextMode="multiline" FieldTextBoxMaxLength="3000"></def:datafieldcontrol></td>
<td></td></tr>
 
 
 
 
<tr>
<td></td></tr>
 
</table>
</asp:Panel>

<%-- =======================  Items =======================  --%>

<br/><br/><asp:Label runat="server" Font-Bold="true" Font-Underline="false" id="Label1" Text="Part I. Early Words" Font-Size="Large"/>


<br/><br/><asp:Label runat="server" Font-Bold="true" Font-Underline="true" id="lblFirstSignsofUnderstanding" Text="A. First Signs of Understanding . . . (0=No, 1=Yes)"  Font-Size="Medium"/>
<table><tr>
<td style="vertical-align:top"  width="240px">
<def:datafieldcontrol runat="server" id="WG_RESPNAM" DatabaseField="WG_RESPNAM" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="175px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="WG_RESPNO" DatabaseField="WG_RESPNO" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="175px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="WG_REACTMD" DatabaseField="WG_REACTMD" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="175px" FieldTextBoxWidth="30px"></def:datafieldcontrol>

</td>
</tr></table>
<br/><br/><asp:Label runat="server" Font-Bold="true" Font-Underline="true" id="lblPhrases" Text="B. Phrases . . . (0=No, 1=Understands)"  Font-Size="Medium"/><table><tr>
<td style="vertical-align:top"  width="240px">

<def:datafieldcontrol runat="server" id="WG_AREHNGRY" DatabaseField="WG_AREHNGRY" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="175px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="WG_ARETIRED" DatabaseField="WG_ARETIRED" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="175px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="WG_BECAREFL" DatabaseField="WG_BECAREFL" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="175px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="WG_BEQUIET" DatabaseField="WG_BEQUIET" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="175px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="WG_CLAPHAND" DatabaseField="WG_CLAPHAND" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="175px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="WG_CGDIAPER" DatabaseField="WG_CGDIAPER" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="175px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="WG_COMEHERE" DatabaseField="WG_COMEHERE" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="175px" FieldTextBoxWidth="30px"></def:datafieldcontrol>

</td>

<td style="vertical-align:top"  width="240px">

<def:datafieldcontrol runat="server" id="WG_MDHOME" DatabaseField="WG_MDHOME" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="175px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="WG_WANTMORE" DatabaseField="WG_WANTMORE" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="175px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="WG_DONTDO" DatabaseField="WG_DONTDO" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="175px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="WG_DONTOUCH" DatabaseField="WG_DONTOUCH" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="175px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="WG_GETUP" DatabaseField="WG_GETUP" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="175px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="WG_GIVEMOM" DatabaseField="WG_GIVEMOM" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="175px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="WG_GIVEHUG" DatabaseField="WG_GIVEHUG" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="175px" FieldTextBoxWidth="30px"></def:datafieldcontrol>

</td>

<td style="vertical-align:top"  width="240px">

<def:datafieldcontrol runat="server" id="WG_GIVEKISS" DatabaseField="WG_GIVEKISS" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="175px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="WG_GOGET" DatabaseField="WG_GOGET" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="175px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="WG_GOODGB" DatabaseField="WG_GOODGB" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="175px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="WG_HOLDSTIL" DatabaseField="WG_HOLDSTIL" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="175px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="WG_GOBYEBYE" DatabaseField="WG_GOBYEBYE" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="175px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="WG_LOOKHERE" DatabaseField="WG_LOOKHERE" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="175px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="WG_OPENMTH" DatabaseField="WG_OPENMTH" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="175px" FieldTextBoxWidth="30px"></def:datafieldcontrol>

</td>

<td style="vertical-align:top"  width="240px">

<def:datafieldcontrol runat="server" id="WG_SITDOWN" DatabaseField="WG_SITDOWN" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="175px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="WG_SPITOUT" DatabaseField="WG_SPITOUT" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="175px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="WG_STOPIT" DatabaseField="WG_STOPIT" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="175px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="WG_GONIGHT" DatabaseField="WG_GONIGHT" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="175px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="WG_THROWBAL" DatabaseField="WG_THROWBAL" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="175px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="WG_LITTLPIG" DatabaseField="WG_LITTLPIG" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="175px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="WG_GORIDE" DatabaseField="WG_GORIDE" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="175px" FieldTextBoxWidth="30px"></def:datafieldcontrol>

</td>
</tr></table>
<br/><br/><asp:Label runat="server" Font-Bold="true" Font-Underline="true" id="lblStartingtoTalk" Text="C. Starting to Talk . . . (0=Never, 1=Sometimes, 2=Often)" Font-Size="Medium"/><table><tr>
<td style="vertical-align:top"  width="240px">

<def:datafieldcontrol runat="server" id="WG_IMITATE" DatabaseField="WG_IMITATE" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="175px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="WG_LABEL" DatabaseField="WG_LABEL" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="175px" FieldTextBoxWidth="30px"></def:datafieldcontrol>

</td>
</tr></table>
<br/><br/><asp:Label runat="server" Font-Bold="true" Font-Underline="true" id="lblVocabChecklist" Text="D. Vocabulary Checklist . . . (0=No, 1=Understands, 2=Understands and Says)" Font-Size="Medium"/><table><tr></tr></table>
<br/><br/><asp:Label runat="server" Font-Bold="true" Font-Underline="true" id="lblSoundEffectsAnimalSounds" Text="1. Sound Effects & Animal Sounds . . . (0=No, 1=Understands, 2=Understands and Says)"/><table><tr>
<td style="vertical-align:top"  width="240px">

<def:datafieldcontrol runat="server" id="WG_BAABAA" DatabaseField="WG_BAABAA" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="WG_CHOOCHOO" DatabaseField="WG_CHOOCHOO" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="WG_COCKDDLD" DatabaseField="WG_COCKDDLD" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="30px"></def:datafieldcontrol>

</td>

<td style="vertical-align:top"  width="240px">
<def:datafieldcontrol runat="server" id="WG_GRR" DatabaseField="WG_GRR" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="WG_MEOW" DatabaseField="WG_MEOW" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="WG_MOO" DatabaseField="WG_MOO" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
</td>

<td style="vertical-align:top"  width="240px">
<def:datafieldcontrol runat="server" id="WG_OUCH" DatabaseField="WG_OUCH" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="WG_QUACKQCK" DatabaseField="WG_QUACKQCK" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="WG_UHOH" DatabaseField="WG_UHOH" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
</td>

<td style="vertical-align:top"  width="240px">
<def:datafieldcontrol runat="server" id="WG_VROOM" DatabaseField="WG_VROOM" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="WG_WOOFWOOF" DatabaseField="WG_WOOFWOOF" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="WG_YUMYUM" DatabaseField="WG_YUMYUM" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
</td>
</tr></table>
<br/><br/><asp:Label runat="server" Font-Bold="true" Font-Underline="true" id="lblAnimalNames" Text="2. Animal Names . . . (0=No, 1=Understands, 2=Understands and Says)"/><table><tr>

<td style="vertical-align:top"  width="240px">
<def:datafieldcontrol runat="server" id="WG_ANIMAL" DatabaseField="WG_ANIMAL" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="WG_BEAR" DatabaseField="WG_BEAR" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="WG_BEE" DatabaseField="WG_BEE" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="WG_BIRD" DatabaseField="WG_BIRD" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="WG_BUG" DatabaseField="WG_BUG" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="WG_BUNNY" DatabaseField="WG_BUNNY" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="WG_BUTTRFLY" DatabaseField="WG_BUTTRFLY" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="WG_CAT" DatabaseField="WG_CAT" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="WG_CHICKEN1" DatabaseField="WG_CHICKEN1" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="30px"></def:datafieldcontrol>

</td>

<td style="vertical-align:top"  width="240px">
<def:datafieldcontrol runat="server" id="WG_COW" DatabaseField="WG_COW" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="WG_DEER" DatabaseField="WG_DEER" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="WG_DOG" DatabaseField="WG_DOG" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="WG_DONKEY" DatabaseField="WG_DONKEY" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="WG_DUCK" DatabaseField="WG_DUCK" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="WG_ELEPHANT" DatabaseField="WG_ELEPHANT" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="WG_FISH1" DatabaseField="WG_FISH1" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="WG_FROG" DatabaseField="WG_FROG" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="WG_GIRAFFE" DatabaseField="WG_GIRAFFE" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="30px"></def:datafieldcontrol>

</td>

<td style="vertical-align:top"  width="240px">
<def:datafieldcontrol runat="server" id="WG_GOOSE" DatabaseField="WG_GOOSE" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="WG_HORSE" DatabaseField="WG_HORSE" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="WG_KITTY" DatabaseField="WG_KITTY" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="WG_LAMB" DatabaseField="WG_LAMB" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="WG_LION" DatabaseField="WG_LION" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="WG_MONKEY" DatabaseField="WG_MONKEY" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="WG_MOUSE" DatabaseField="WG_MOUSE" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="WG_OWL" DatabaseField="WG_OWL" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="WG_PENGUIN" DatabaseField="WG_PENGUIN" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="30px"></def:datafieldcontrol>

</td>

<td style="vertical-align:top"  width="240px">
<def:datafieldcontrol runat="server" id="WG_PIG" DatabaseField="WG_PIG" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="WG_PONY" DatabaseField="WG_PONY" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="WG_PUPPY" DatabaseField="WG_PUPPY" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="WG_SHEEP" DatabaseField="WG_SHEEP" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="WG_SQUIRREL" DatabaseField="WG_SQUIRREL" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="WG_TEDDYBER" DatabaseField="WG_TEDDYBER" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="WG_TIGER" DatabaseField="WG_TIGER" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="WG_TURKEY" DatabaseField="WG_TURKEY" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="WG_TURTLE" DatabaseField="WG_TURTLE" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
</td>

</tr></table>
<br/><br/><asp:Label runat="server" Font-Bold="true" Font-Underline="true" id="lblVehicles" Text="3. Vehicles . . . (0=No, 1=Understands, 2=Understands and Says)"/><table><tr>
<td style="vertical-align:top"  width="240px">
<def:datafieldcontrol runat="server" id="WG_AIRPLANE" DatabaseField="WG_AIRPLANE" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="WG_BICYCLE" DatabaseField="WG_BICYCLE" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="WG_BUS" DatabaseField="WG_BUS" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="30px"></def:datafieldcontrol>


</td>

<td style="vertical-align:top"  width="240px">
<def:datafieldcontrol runat="server" id="WG_CAR" DatabaseField="WG_CAR" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="WG_FIRETRCK" DatabaseField="WG_FIRETRCK" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="WG_MOTRCYCL" DatabaseField="WG_MOTRCYCL" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="30px"></def:datafieldcontrol>

</td>

<td style="vertical-align:top"  width="240px">
<def:datafieldcontrol runat="server" id="WG_STROLLER" DatabaseField="WG_STROLLER" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="WG_TRAIN" DatabaseField="WG_TRAIN" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="WG_TRUCK" DatabaseField="WG_TRUCK" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="30px"></def:datafieldcontrol>

</td>
</tr></table>
<br/><br/><asp:Label runat="server" Font-Bold="true" Font-Underline="true" id="lblToys" Text="4. Toys . . . (0=No, 1=Understands, 2=Understands and Says)"/><table><tr>
<td style="vertical-align:top"  width="240px">
<def:datafieldcontrol runat="server" id="WG_BALL" DatabaseField="WG_BALL" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="WG_BALLOON" DatabaseField="WG_BALLOON" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="30px"></def:datafieldcontrol>

</td>

<td style="vertical-align:top"  width="240px">
<def:datafieldcontrol runat="server" id="WG_BLOCK" DatabaseField="WG_BLOCK" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="WG_BOOK" DatabaseField="WG_BOOK" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="30px"></def:datafieldcontrol>

</td>

<td style="vertical-align:top"  width="240px">
<def:datafieldcontrol runat="server" id="WG_BUBBLES" DatabaseField="WG_BUBBLES" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="WG_DOLL" DatabaseField="WG_DOLL" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="30px"></def:datafieldcontrol>

</td>

<td style="vertical-align:top"  width="240px">
<def:datafieldcontrol runat="server" id="WG_PEN" DatabaseField="WG_PEN" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="WG_TOY" DatabaseField="WG_TOY" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="30px"></def:datafieldcontrol>

</td>
</tr></table>
<br/><br/><asp:Label runat="server" Font-Bold="true" Font-Underline="true" id="lblFoodandDrink" Text="5. Food and Drink . . . (0=No, 1=Understands, 2=Understands and Says)"/><table><tr>
<td style="vertical-align:top"  width="240px">
<def:datafieldcontrol runat="server" id="WG_APPLE" DatabaseField="WG_APPLE" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="WG_BANANA" DatabaseField="WG_BANANA" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="WG_BREAD" DatabaseField="WG_BREAD" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="WG_BUTTER" DatabaseField="WG_BUTTER" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="WG_CAKE" DatabaseField="WG_CAKE" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="WG_CANDY" DatabaseField="WG_CANDY" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="WG_CARROTS" DatabaseField="WG_CARROTS" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="WG_CEREAL" DatabaseField="WG_CEREAL" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="30px"></def:datafieldcontrol>

</td>

<td style="vertical-align:top"  width="240px">
<def:datafieldcontrol runat="server" id="WG_CHERIOS" DatabaseField="WG_CHERIOS" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="WG_CHEESE" DatabaseField="WG_CHEESE" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="WG_CHICKEN2" DatabaseField="WG_CHICKEN2" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="WG_COFFEE" DatabaseField="WG_COFFEE" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="WG_COOKIE" DatabaseField="WG_COOKIE" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="WG_CRACKER" DatabaseField="WG_CRACKER" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="WG_DRINK1" DatabaseField="WG_DRINK1" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="WG_EGG" DatabaseField="WG_EGG" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="30px"></def:datafieldcontrol>

</td>

<td style="vertical-align:top"  width="240px">
<def:datafieldcontrol runat="server" id="WG_FISH2" DatabaseField="WG_FISH2" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="WG_FOOD" DatabaseField="WG_FOOD" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="WG_ICECREAM" DatabaseField="WG_ICECREAM" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="WG_JUICE" DatabaseField="WG_JUICE" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="WG_MEAT" DatabaseField="WG_MEAT" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="WG_MILK" DatabaseField="WG_MILK" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="WG_NOODLES" DatabaseField="WG_NOODLES" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="WG_ORANGE" DatabaseField="WG_ORANGE" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="30px"></def:datafieldcontrol>

</td>

<td style="vertical-align:top"  width="240px">
<def:datafieldcontrol runat="server" id="WG_PEAS" DatabaseField="WG_PEAS" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="WG_PIZZA" DatabaseField="WG_PIZZA" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="WG_RAISIN" DatabaseField="WG_RAISIN" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="WG_SPAGHETT" DatabaseField="WG_SPAGHETT" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="WG_TOAST" DatabaseField="WG_TOAST" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="WG_WATER1" DatabaseField="WG_WATER1" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="30px"></def:datafieldcontrol>

</td>
</tr></table>
<br/><br/><asp:Label runat="server" Font-Bold="true" Font-Underline="true" id="lblClothing" Text="6. Clothing . . . (0=No, 1=Understands, 2=Understands and Says)"/><table><tr>
<td style="vertical-align:top"  width="240px">

<def:datafieldcontrol runat="server" id="WG_BEADS" DatabaseField="WG_BEADS" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="WG_BIB" DatabaseField="WG_BIB" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="WG_BOOTS" DatabaseField="WG_BOOTS" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="WG_BUTTON" DatabaseField="WG_BUTTON" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="WG_COAT" DatabaseField="WG_COAT" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="30px"></def:datafieldcontrol>

</td>

<td style="vertical-align:top"  width="240px">
<def:datafieldcontrol runat="server" id="WG_DIAPER" DatabaseField="WG_DIAPER" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="WG_DRESS" DatabaseField="WG_DRESS" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="WG_HAT" DatabaseField="WG_HAT" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="WG_JACKET" DatabaseField="WG_JACKET" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="WG_JEANS" DatabaseField="WG_JEANS" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="30px"></def:datafieldcontrol>

</td>

<td style="vertical-align:top"  width="240px">
<def:datafieldcontrol runat="server" id="WG_NECKLACE" DatabaseField="WG_NECKLACE" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="WG_PAJAMAS" DatabaseField="WG_PAJAMAS" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="WG_PANTS" DatabaseField="WG_PANTS" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="WG_SHIRT" DatabaseField="WG_SHIRT" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="WG_SHOE" DatabaseField="WG_SHOE" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="30px"></def:datafieldcontrol>

</td>

<td style="vertical-align:top"  width="240px">
<def:datafieldcontrol runat="server" id="WG_SHORTS" DatabaseField="WG_SHORTS" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="WG_SOCK" DatabaseField="WG_SOCK" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="WG_SWEATER" DatabaseField="WG_SWEATER" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="WG_ZIPPER" DatabaseField="WG_ZIPPER" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="30px"></def:datafieldcontrol>

</td>
</tr></table>
<br/><br/><asp:Label runat="server" Font-Bold="true" Font-Underline="true" id="lblBodyParts" Text="7. Body Parts . . . (0=No, 1=Understands, 2=Understands and Says)"/><table><tr>
<td style="vertical-align:top"  width="240px">
<def:datafieldcontrol runat="server" id="WG_ARM" DatabaseField="WG_ARM" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="WG_BLLYBTTN" DatabaseField="WG_BLLYBTTN" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="WG_CHEEK" DatabaseField="WG_CHEEK" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="WG_EAR" DatabaseField="WG_EAR" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="WG_EYE" DatabaseField="WG_EYE" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="30px"></def:datafieldcontrol>

</td>

<td style="vertical-align:top"  width="240px">
<def:datafieldcontrol runat="server" id="WG_FACE" DatabaseField="WG_FACE" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="WG_FOOT" DatabaseField="WG_FOOT" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="WG_FINGER" DatabaseField="WG_FINGER" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="WG_HAIR" DatabaseField="WG_HAIR" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="WG_HAND" DatabaseField="WG_HAND" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="30px"></def:datafieldcontrol>

</td>

<td style="vertical-align:top"  width="240px">
<def:datafieldcontrol runat="server" id="WG_HEAD" DatabaseField="WG_HEAD" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="WG_KNEE" DatabaseField="WG_KNEE" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="WG_LEG" DatabaseField="WG_LEG" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="WG_MOUTH" DatabaseField="WG_MOUTH" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="WG_NOSE" DatabaseField="WG_NOSE" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="30px"></def:datafieldcontrol>

</td>


<td style="vertical-align:top"  width="240px">
<def:datafieldcontrol runat="server" id="WG_OWIE" DatabaseField="WG_OWIE" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="WG_TOOTH" DatabaseField="WG_TOOTH" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="WG_TOE" DatabaseField="WG_TOE" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="WG_TONGUE" DatabaseField="WG_TONGUE" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="WG_TUMMY" DatabaseField="WG_TUMMY" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="30px"></def:datafieldcontrol>

</td>
</tr></table>
<br/><br/><asp:Label runat="server" Font-Bold="true" Font-Underline="true" id="lblFurnitureandRooms" Text="8. Furniture and Rooms . . . (0=No, 1=Understands, 2=Understands and Says)"/><table><tr>
<td style="vertical-align:top"  width="240px">
<def:datafieldcontrol runat="server" id="WG_BATHROOM" DatabaseField="WG_BATHROOM" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="WG_BATHTUB" DatabaseField="WG_BATHTUB" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="WG_BED" DatabaseField="WG_BED" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="WG_BEDROOM" DatabaseField="WG_BEDROOM" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="WG_CHAIR" DatabaseField="WG_CHAIR" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="WG_COUCH" DatabaseField="WG_COUCH" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="30px"></def:datafieldcontrol>

</td>

<td style="vertical-align:top"  width="240px">
<def:datafieldcontrol runat="server" id="WG_CRIB" DatabaseField="WG_CRIB" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="WG_DOOR" DatabaseField="WG_DOOR" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="WG_DRAWER" DatabaseField="WG_DRAWER" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="WG_GARAGE" DatabaseField="WG_GARAGE" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="WG_HIGHCHAR" DatabaseField="WG_HIGHCHAR" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="WG_KITCHEN" DatabaseField="WG_KITCHEN" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="30px"></def:datafieldcontrol>

</td>

<td style="vertical-align:top"  width="240px">
<def:datafieldcontrol runat="server" id="WG_LIVINGRM" DatabaseField="WG_LIVINGRM" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="WG_OVEN" DatabaseField="WG_OVEN" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="WG_PLAYPEN" DatabaseField="WG_PLAYPEN" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="WG_POTTY" DatabaseField="WG_POTTY" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="WG_REFRGRTR" DatabaseField="WG_REFRGRTR" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="WG_RCKNGCHR" DatabaseField="WG_RCKNGCHR" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="30px"></def:datafieldcontrol>

</td>

<td style="vertical-align:top"  width="240px">
<def:datafieldcontrol runat="server" id="WG_SINK" DatabaseField="WG_SINK" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="WG_STAIRS" DatabaseField="WG_STAIRS" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="WG_STOVE" DatabaseField="WG_STOVE" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="WG_TABLE" DatabaseField="WG_TABLE" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="WG_TV" DatabaseField="WG_TV" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="WG_WINDOW" DatabaseField="WG_WINDOW" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="30px"></def:datafieldcontrol>


</td>
</tr></table>
<br/><br/><asp:Label runat="server" Font-Bold="true" Font-Underline="true" id="lblSmallHouseholdItems" Text="9. Small Household Items . . . (0=No, 1=Understands, 2=Understands and Says)"/><table><tr>
<td style="vertical-align:top"  width="240px">
<def:datafieldcontrol runat="server" id="WG_BLANKET" DatabaseField="WG_BLANKET" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="WG_BOTTLE" DatabaseField="WG_BOTTLE" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="WG_BOWL" DatabaseField="WG_BOWL" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="WG_BOX" DatabaseField="WG_BOX" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="WG_BROOM" DatabaseField="WG_BROOM" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="WG_BRUSH" DatabaseField="WG_BRUSH" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="WG_CLOCK" DatabaseField="WG_CLOCK" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="WG_COMB" DatabaseField="WG_COMB" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="WG_CUP" DatabaseField="WG_CUP" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="30px"></def:datafieldcontrol>

</td>

<td style="vertical-align:top"  width="240px">
<def:datafieldcontrol runat="server" id="WG_DISH" DatabaseField="WG_DISH" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="WG_FORK" DatabaseField="WG_FORK" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="WG_GLASS" DatabaseField="WG_GLASS" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="WG_GLASSES" DatabaseField="WG_GLASSES" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="WG_HAMMER" DatabaseField="WG_HAMMER" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="WG_KEYS" DatabaseField="WG_KEYS" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="WG_LAMP" DatabaseField="WG_LAMP" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="WG_LIGHT" DatabaseField="WG_LIGHT" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="WG_MEDICINE" DatabaseField="WG_MEDICINE" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="30px"></def:datafieldcontrol>

</td>

<td style="vertical-align:top"  width="240px">
<def:datafieldcontrol runat="server" id="WG_MONEY" DatabaseField="WG_MONEY" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="WG_PAPER" DatabaseField="WG_PAPER" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="WG_PENNY" DatabaseField="WG_PENNY" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="WG_PICTURE" DatabaseField="WG_PICTURE" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="WG_PILLOW" DatabaseField="WG_PILLOW" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="WG_PLANT" DatabaseField="WG_PLANT" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="WG_PLATE" DatabaseField="WG_PLATE" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="WG_PURSE" DatabaseField="WG_PURSE" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="WG_RADIO" DatabaseField="WG_RADIO" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="30px"></def:datafieldcontrol>

</td>

<td style="vertical-align:top"  width="240px">

<def:datafieldcontrol runat="server" id="WG_SCISSORS" DatabaseField="WG_SCISSORS" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="WG_SOAP" DatabaseField="WG_SOAP" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="WG_SPOON" DatabaseField="WG_SPOON" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="WG_TELEPHON" DatabaseField="WG_TELEPHON" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="WG_TOTHBRSH" DatabaseField="WG_TOTHBRSH" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="WG_TOWEL" DatabaseField="WG_TOWEL" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="WG_TRASH" DatabaseField="WG_TRASH" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="WG_VACUUM" DatabaseField="WG_VACUUM" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="WG_WATCH1" DatabaseField="WG_WATCH1" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="30px"></def:datafieldcontrol>

</td>
</tr></table>
<br/><br/><asp:Label runat="server" Font-Bold="true" Font-Underline="true" id="lblOutsideThingsPlacestoGo" Text="10. Outside Things & Places to Go . . . (0=No, 1=Understands, 2=Understands and Says)"/><table><tr>
<td style="vertical-align:top"  width="240px">

<def:datafieldcontrol runat="server" id="WG_BACKYARD" DatabaseField="WG_BACKYARD" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="WG_BEACH" DatabaseField="WG_BEACH" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="WG_CHURCH" DatabaseField="WG_CHURCH" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="WG_FLOWER" DatabaseField="WG_FLOWER" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="WG_GARDEN" DatabaseField="WG_GARDEN" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="WG_HOME" DatabaseField="WG_HOME" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="WG_HOUSE" DatabaseField="WG_HOUSE" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="30px"></def:datafieldcontrol>

</td>

<td style="vertical-align:top"  width="240px">
<def:datafieldcontrol runat="server" id="WG_MOON" DatabaseField="WG_MOON" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="WG_OUTSIDE" DatabaseField="WG_OUTSIDE" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="WG_PARK" DatabaseField="WG_PARK" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="WG_PARTY" DatabaseField="WG_PARTY" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="WG_POOL" DatabaseField="WG_POOL" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="WG_RAIN" DatabaseField="WG_RAIN" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="WG_ROCK" DatabaseField="WG_ROCK" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="30px"></def:datafieldcontrol>

</td>

<td style="vertical-align:top"  width="240px">
<def:datafieldcontrol runat="server" id="WG_SCHOOL" DatabaseField="WG_SCHOOL" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="WG_SHOVEL" DatabaseField="WG_SHOVEL" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="WG_SKY" DatabaseField="WG_SKY" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="WG_SLIDE" DatabaseField="WG_SLIDE" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="WG_SNOW" DatabaseField="WG_SNOW" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="WG_STAR" DatabaseField="WG_STAR" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="WG_STORE" DatabaseField="WG_STORE" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="30px"></def:datafieldcontrol>

</td>

<td style="vertical-align:top"  width="240px">

<def:datafieldcontrol runat="server" id="WG_SUN" DatabaseField="WG_SUN" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="WG_SWING1" DatabaseField="WG_SWING1" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="WG_TREE" DatabaseField="WG_TREE" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="WG_WATER2" DatabaseField="WG_WATER2" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="WG_WORK" DatabaseField="WG_WORK" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="WG_ZOO" DatabaseField="WG_ZOO" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="30px"></def:datafieldcontrol>


</td>
</tr></table>
<br/><br/><asp:Label runat="server" Font-Bold="true" Font-Underline="true" id="lblPeople" Text="11. People . . . (0=No, 1=Understands, 2=Understands and Says)"/><table><tr>
<td style="vertical-align:top"  width="240px">

<def:datafieldcontrol runat="server" id="WG_AUNT" DatabaseField="WG_AUNT" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="WG_BABY" DatabaseField="WG_BABY" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="WG_BABYSTTR" DatabaseField="WG_BABYSTTR" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="WG_NAMESTTR" DatabaseField="WG_NAMESTTR" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="WG_BOY" DatabaseField="WG_BOY" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="30px"></def:datafieldcontrol>

</td>

<td style="vertical-align:top"  width="240px">
<def:datafieldcontrol runat="server" id="WG_BROTHER" DatabaseField="WG_BROTHER" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="WG_CHILD" DatabaseField="WG_CHILD" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="WG_DADDY" DatabaseField="WG_DADDY" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="WG_GIRL" DatabaseField="WG_GIRL" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="WG_GRANDMA" DatabaseField="WG_GRANDMA" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="30px"></def:datafieldcontrol>

</td>

<td style="vertical-align:top"  width="240px">
<def:datafieldcontrol runat="server" id="WG_GRANDPA" DatabaseField="WG_GRANDPA" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="WG_LADY" DatabaseField="WG_LADY" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="WG_MAN" DatabaseField="WG_MAN" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="WG_MOMMY" DatabaseField="WG_MOMMY" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="WG_NAMESELF" DatabaseField="WG_NAMESELF" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="30px"></def:datafieldcontrol>

</td>

<td style="vertical-align:top"  width="240px">
<def:datafieldcontrol runat="server" id="WG_PEOPLE" DatabaseField="WG_PEOPLE" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="WG_PERSON" DatabaseField="WG_PERSON" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="WG_SISTER" DatabaseField="WG_SISTER" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="WG_TEACHER" DatabaseField="WG_TEACHER" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="WG_UNCLE" DatabaseField="WG_UNCLE" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="30px"></def:datafieldcontrol>


</td>
</tr></table>
<br/><br/><asp:Label runat="server" Font-Bold="true" Font-Underline="true" id="lblGamesandRoutines" Text="12. Games and Routines . . . (0=No, 1=Understands, 2=Understands and Says)"/><table><tr>
<td style="vertical-align:top"  width="240px">
<def:datafieldcontrol runat="server" id="WG_BATH" DatabaseField="WG_BATH" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="WG_BREAKFST" DatabaseField="WG_BREAKFST" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="WG_BYE" DatabaseField="WG_BYE" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="WG_DINNER" DatabaseField="WG_DINNER" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="WG_DONT" DatabaseField="WG_DONT" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="30px"></def:datafieldcontrol>

</td>

<td style="vertical-align:top"  width="240px">
<def:datafieldcontrol runat="server" id="WG_HELLO" DatabaseField="WG_HELLO" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="WG_HI" DatabaseField="WG_HI" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="WG_LUNCH" DatabaseField="WG_LUNCH" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="WG_NAP" DatabaseField="WG_NAP" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="WG_NGHTNGHT" DatabaseField="WG_NGHTNGHT" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="30px"></def:datafieldcontrol>

</td>

<td style="vertical-align:top"  width="240px">
<def:datafieldcontrol runat="server" id="WG_NO" DatabaseField="WG_NO" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="WG_PATYCAK" DatabaseField="WG_PATYCAK" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="WG_PEEKABOO" DatabaseField="WG_PEEKABOO" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="WG_PLEASE" DatabaseField="WG_PLEASE" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="WG_SHH" DatabaseField="WG_SHH" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="30px"></def:datafieldcontrol>

</td>

<td style="vertical-align:top"  width="240px">
<def:datafieldcontrol runat="server" id="WG_THANKYOU" DatabaseField="WG_THANKYOU" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="WG_WAIT" DatabaseField="WG_WAIT" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="WG_WANNA" DatabaseField="WG_WANNA" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="WG_YES" DatabaseField="WG_YES" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="30px"></def:datafieldcontrol>


</td>
</tr></table>
<br/><br/><asp:Label runat="server" Font-Bold="true" Font-Underline="true" id="lblActionWords" Text="13. Action Words . . . (0=No, 1=Understands, 2=Understands and Says)"/><table><tr>
<td style="vertical-align:top"  width="240px">
<def:datafieldcontrol runat="server" id="WG_BITE" DatabaseField="WG_BITE" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="WG_BLOW" DatabaseField="WG_BLOW" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="WG_BREAK" DatabaseField="WG_BREAK" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="WG_BRING" DatabaseField="WG_BRING" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="30px"></def:datafieldcontrol>

</td>

<td style="vertical-align:top"  width="240px">
<def:datafieldcontrol runat="server" id="WG_BUMP" DatabaseField="WG_BUMP" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="WG_CLEAN1" DatabaseField="WG_CLEAN1" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="WG_CLOSE" DatabaseField="WG_CLOSE" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="WG_CRY" DatabaseField="WG_CRY" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="30px"></def:datafieldcontrol>

</td>

<td style="vertical-align:top"  width="240px">
<def:datafieldcontrol runat="server" id="WG_DANCE" DatabaseField="WG_DANCE" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="WG_DRAW" DatabaseField="WG_DRAW" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="WG_DRINK2" DatabaseField="WG_DRINK2" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="WG_DRIVE" DatabaseField="WG_DRIVE" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="30px"></def:datafieldcontrol>

</td>

<td style="vertical-align:top"  width="240px">
<def:datafieldcontrol runat="server" id="WG_EAT" DatabaseField="WG_EAT" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="WG_FALL" DatabaseField="WG_FALL" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="WG_FEED" DatabaseField="WG_FEED" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="WG_FINISH" DatabaseField="WG_FINISH" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="30px"></def:datafieldcontrol>


</td>
</tr></table>


<br/><br/><asp:Label runat="server" Font-Bold="true" Font-Underline="true" id="lblActionWords2" Text="13. Action Words (cont.) . . . (0=No, 1=Understands, 2=Understands and Says)"/><table><tr>
<td style="vertical-align:top"  width="240px">
<def:datafieldcontrol runat="server" id="WG_GET" DatabaseField="WG_GET" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="WG_GIVE" DatabaseField="WG_GIVE" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="WG_GO" DatabaseField="WG_GO" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="WG_HELP" DatabaseField="WG_HELP" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="WG_HIT" DatabaseField="WG_HIT" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="WG_HUG" DatabaseField="WG_HUG" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="WG_HURRY" DatabaseField="WG_HURRY" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="WG_JUMP" DatabaseField="WG_JUMP" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="WG_KICK" DatabaseField="WG_KICK" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="WG_KISS" DatabaseField="WG_KISS" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="30px"></def:datafieldcontrol>

</td>

<td style="vertical-align:top"  width="240px">
<def:datafieldcontrol runat="server" id="WG_LOOK" DatabaseField="WG_LOOK" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="WG_LOVE" DatabaseField="WG_LOVE" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="WG_OPEN" DatabaseField="WG_OPEN" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="WG_PLAY" DatabaseField="WG_PLAY" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="WG_PULL" DatabaseField="WG_PULL" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="WG_PUSH" DatabaseField="WG_PUSH" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="WG_PUT" DatabaseField="WG_PUT" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="WG_READ" DatabaseField="WG_READ" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="WG_RIDE" DatabaseField="WG_RIDE" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="WG_RUN" DatabaseField="WG_RUN" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="30px"></def:datafieldcontrol>

</td>

<td style="vertical-align:top"  width="240px">
<def:datafieldcontrol runat="server" id="WG_SAY" DatabaseField="WG_SAY" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="WG_SEE" DatabaseField="WG_SEE" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="WG_SHOW" DatabaseField="WG_SHOW" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="WG_SING" DatabaseField="WG_SING" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="WG_SLEEP" DatabaseField="WG_SLEEP" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="WG_SMILE" DatabaseField="WG_SMILE" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="WG_SPLASH" DatabaseField="WG_SPLASH" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="WG_STOP" DatabaseField="WG_STOP" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="WG_SWIM" DatabaseField="WG_SWIM" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="WG_SWING2" DatabaseField="WG_SWING2" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="30px"></def:datafieldcontrol>

</td>

<td style="vertical-align:top"  width="240px">
<def:datafieldcontrol runat="server" id="WG_TAKE" DatabaseField="WG_TAKE" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="WG_THROW" DatabaseField="WG_THROW" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="WG_TICKLE" DatabaseField="WG_TICKLE" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="WG_TOUCH" DatabaseField="WG_TOUCH" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="WG_WATCH2" DatabaseField="WG_WATCH2" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="WG_WALK" DatabaseField="WG_WALK" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="WG_WASH" DatabaseField="WG_WASH" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="WG_WIPE" DatabaseField="WG_WIPE" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="WG_WRITE" DatabaseField="WG_WRITE" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="30px"></def:datafieldcontrol>

</td>
</tr></table>

<br/><br/><asp:Label runat="server" Font-Bold="true" Font-Underline="true" id="lblWordsaboutTime" Text="14. Words about Time . . . (0=No, 1=Understands, 2=Understands and Says)"/><table><tr>
<td style="vertical-align:top"  width="240px">
<def:datafieldcontrol runat="server" id="WG_DAY" DatabaseField="WG_DAY" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="WG_LATER" DatabaseField="WG_LATER" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="30px"></def:datafieldcontrol>

</td>

<td style="vertical-align:top"  width="240px">
<def:datafieldcontrol runat="server" id="WG_MORNING" DatabaseField="WG_MORNING" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="WG_NIGHT" DatabaseField="WG_NIGHT" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="30px"></def:datafieldcontrol>

</td>

<td style="vertical-align:top"  width="240px">
<def:datafieldcontrol runat="server" id="WG_NOW" DatabaseField="WG_NOW" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="WG_TODAY" DatabaseField="WG_TODAY" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="30px"></def:datafieldcontrol>

</td>

<td style="vertical-align:top"  width="240px">
<def:datafieldcontrol runat="server" id="WG_TOMORROW" DatabaseField="WG_TOMORROW" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="WG_TONIGHT" DatabaseField="WG_TONIGHT" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="30px"></def:datafieldcontrol>


</td>
</tr></table>
<br/><br/><asp:Label runat="server" Font-Bold="true" Font-Underline="true" id="lblDescriptiveWords" Text="15. Descriptive Words . . . (0=No, 1=Understands, 2=Understands and Says)"/><table><tr>
<td style="vertical-align:top"  width="240px">
<def:datafieldcontrol runat="server" id="WG_ALLGONE" DatabaseField="WG_ALLGONE" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="WG_ASLEEP" DatabaseField="WG_ASLEEP" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="WG_BAD" DatabaseField="WG_BAD" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="WG_BIG" DatabaseField="WG_BIG" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="WG_BLUE" DatabaseField="WG_BLUE" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="WG_BROKEN" DatabaseField="WG_BROKEN" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="WG_CAREFUL" DatabaseField="WG_CAREFUL" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="WG_CLEAN2" DatabaseField="WG_CLEAN2" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="WG_COLD" DatabaseField="WG_COLD" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="WG_CUTE" DatabaseField="WG_CUTE" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="30px"></def:datafieldcontrol>

</td>

<td style="vertical-align:top"  width="240px">
<def:datafieldcontrol runat="server" id="WG_DARK" DatabaseField="WG_DARK" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="WG_DIRTY" DatabaseField="WG_DIRTY" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="WG_DRY" DatabaseField="WG_DRY" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="WG_EMPTY" DatabaseField="WG_EMPTY" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="WG_FAST" DatabaseField="WG_FAST" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="WG_FINE" DatabaseField="WG_FINE" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="WG_GENTLE" DatabaseField="WG_GENTLE" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="WG_GOOD" DatabaseField="WG_GOOD" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="WG_HAPPY" DatabaseField="WG_HAPPY" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="WG_HARD" DatabaseField="WG_HARD" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="30px"></def:datafieldcontrol>

</td>

<td style="vertical-align:top"  width="240px">
<def:datafieldcontrol runat="server" id="WG_HOT" DatabaseField="WG_HOT" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="WG_HUNGRY" DatabaseField="WG_HUNGRY" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="WG_HURT" DatabaseField="WG_HURT" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="WG_LITTLE" DatabaseField="WG_LITTLE" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="WG_NAUGHTY" DatabaseField="WG_NAUGHTY" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="WG_NICE" DatabaseField="WG_NICE" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="WG_OLD" DatabaseField="WG_OLD" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="WG_PRETTY" DatabaseField="WG_PRETTY" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="WG_RED" DatabaseField="WG_RED" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="WG_SCARED" DatabaseField="WG_SCARED" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="30px"></def:datafieldcontrol>

</td>

<td style="vertical-align:top"  width="240px">

<def:datafieldcontrol runat="server" id="WG_SICK" DatabaseField="WG_SICK" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="WG_SLEEPY" DatabaseField="WG_SLEEPY" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="WG_SOFT" DatabaseField="WG_SOFT" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="WG_THIRSTY" DatabaseField="WG_THIRSTY" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="WG_TIRED" DatabaseField="WG_TIRED" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="WG_WET" DatabaseField="WG_WET" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="WG_YUCKY" DatabaseField="WG_YUCKY" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="30px"></def:datafieldcontrol>


</td>
</tr></table>
<br/><br/><asp:Label runat="server" Font-Bold="true" Font-Underline="true" id="lblPronouns" Text="16. Pronouns . . . (0=No, 1=Understands, 2=Understands and Says)"/><table><tr>
<td style="vertical-align:top"  width="240px">
<def:datafieldcontrol runat="server" id="WG_HER" DatabaseField="WG_HER" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="WG_HIS" DatabaseField="WG_HIS" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="WG_I" DatabaseField="WG_I" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
</td>


<td style="vertical-align:top"  width="240px">
<def:datafieldcontrol runat="server" id="WG_IT" DatabaseField="WG_IT" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="WG_ME" DatabaseField="WG_ME" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="WG_MINE" DatabaseField="WG_MINE" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="30px"></def:datafieldcontrol>

</td>

<td style="vertical-align:top"  width="240px">

<def:datafieldcontrol runat="server" id="WG_MY" DatabaseField="WG_MY" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="WG_THAT" DatabaseField="WG_THAT" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="WG_THIS" DatabaseField="WG_THIS" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
</td>

<td style="vertical-align:top"  width="240px">

<def:datafieldcontrol runat="server" id="WG_YOU" DatabaseField="WG_YOU" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="WG_YOUR" DatabaseField="WG_YOUR" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="30px"></def:datafieldcontrol>

</td>

</tr></table>
<br/><br/><asp:Label runat="server" Font-Bold="true" Font-Underline="true" id="lblQuestionWords" Text="17. Question Words . . . (0=No, 1=Understands, 2=Understands and Says)"/><table><tr>
<td style="vertical-align:top"  width="240px">
<def:datafieldcontrol runat="server" id="WG_HOW" DatabaseField="WG_HOW" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="WG_WHAT" DatabaseField="WG_WHAT" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="30px"></def:datafieldcontrol>

</td>

<td style="vertical-align:top"  width="240px">
<def:datafieldcontrol runat="server" id="WG_WHEN" DatabaseField="WG_WHEN" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="WG_WHERE" DatabaseField="WG_WHERE" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="30px"></def:datafieldcontrol>

</td>

<td style="vertical-align:top"  width="240px">
<def:datafieldcontrol runat="server" id="WG_WHO" DatabaseField="WG_WHO" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="WG_WHY" DatabaseField="WG_WHY" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="30px"></def:datafieldcontrol>


</td>
</tr></table>
<br/><br/><asp:Label runat="server" Font-Bold="true" Font-Underline="true" id="lblPrepositionsandLocations" Text="18. Prepositions and Locations . . . (0=No, 1=Understands, 2=Understands and Says)"/><table><tr>
<td style="vertical-align:top"  width="240px">

<def:datafieldcontrol runat="server" id="WG_AWAY" DatabaseField="WG_AWAY" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="WG_BACK" DatabaseField="WG_BACK" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="WG_DOWN" DatabaseField="WG_DOWN" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="30px"></def:datafieldcontrol>

</td>

<td style="vertical-align:top"  width="240px">
<def:datafieldcontrol runat="server" id="WG_IN" DatabaseField="WG_IN" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="WG_INSIDE" DatabaseField="WG_INSIDE" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="WG_OFF" DatabaseField="WG_OFF" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="30px"></def:datafieldcontrol>

</td>

<td style="vertical-align:top"  width="240px">
<def:datafieldcontrol runat="server" id="WG_ON" DatabaseField="WG_ON" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="WG_OUT" DatabaseField="WG_OUT" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="WG_THERE" DatabaseField="WG_THERE" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="30px"></def:datafieldcontrol>

</td>

<td style="vertical-align:top"  width="240px">
<def:datafieldcontrol runat="server" id="WG_UNDER" DatabaseField="WG_UNDER" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="WG_UP" DatabaseField="WG_UP" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="30px"></def:datafieldcontrol>

</td>
</tr></table>
<br/><br/><asp:Label runat="server" Font-Bold="true" Font-Underline="true" id="lblQuantifiers" Text="19. Quantifiers . . . (0=No, 1=Understands, 2=Understands and Says)"/><table><tr>
<td style="vertical-align:top"  width="240px">
<def:datafieldcontrol runat="server" id="WG_ALL" DatabaseField="WG_ALL" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="WG_ANOTHER" DatabaseField="WG_ANOTHER" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="30px"></def:datafieldcontrol>

</td>

<td style="vertical-align:top"  width="240px">
<def:datafieldcontrol runat="server" id="WG_MORE" DatabaseField="WG_MORE" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="WG_NONE" DatabaseField="WG_NONE" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="30px"></def:datafieldcontrol>

</td>

<td style="vertical-align:top"  width="240px">
<def:datafieldcontrol runat="server" id="WG_NOT" DatabaseField="WG_NOT" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="WG_OTHER" DatabaseField="WG_OTHER" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="30px"></def:datafieldcontrol>

</td>

<td style="vertical-align:top"  width="240px">
<def:datafieldcontrol runat="server" id="WG_SAME" DatabaseField="WG_SAME" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="WG_SOME" DatabaseField="WG_SOME" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="150px" FieldTextBoxWidth="30px"></def:datafieldcontrol>

</td>
</tr></table>
<br/><br/><asp:Label runat="server" Font-Bold="true" Font-Underline="false" id="lbl" Text="Part II. Actions and Gestures " Font-Size="Large"/><table><tr></tr></table>
<br/><br/><asp:Label runat="server" Font-Bold="true" Font-Underline="true" id="lblFirstCommunicativeGestures" Text="A. First Communicative Gestures . . . (0=Not Yet, 1=Sometimes, 2=Often)" Font-Size="Medium"/><table><tr>
<td style="vertical-align:top"  width="240px">
<def:datafieldcontrol runat="server" id="WG_ARMSHOW" DatabaseField="WG_ARMSHOW" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="225px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="WG_REACHOUT" DatabaseField="WG_REACHOUT" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="225px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="WG_POINTS" DatabaseField="WG_POINTS" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="225px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="WG_WAVES" DatabaseField="WG_WAVES" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="225px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="WG_PICKUP" DatabaseField="WG_PICKUP" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="225px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="WG_SHAKHEAD" DatabaseField="WG_SHAKHEAD" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="225px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="WG_NODHEAD" DatabaseField="WG_NODHEAD" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="225px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="WG_SHOWHUSH" DatabaseField="WG_SHOWHUSH" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="225px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="WG_REQUEST" DatabaseField="WG_REQUEST" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="225px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="WG_BLOWKISS" DatabaseField="WG_BLOWKISS" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="225px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="WG_SMACKLIP" DatabaseField="WG_SMACKLIP" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="225px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="WG_SHRUGS" DatabaseField="WG_SHRUGS" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="225px" FieldTextBoxWidth="30px"></def:datafieldcontrol>


</td>
</tr></table>
<br/><br/><asp:Label runat="server" Font-Bold="true" Font-Underline="true" id="lblGames_And_Routines" Text="B. Games and Routines . . . (0=No, 1=Yes)" Font-Size="Medium"/><table><tr>
<td style="vertical-align:top"  width="240px">
<def:datafieldcontrol runat="server" id="WG_PLAYPEEK" DatabaseField="WG_PLAYPEEK" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="225px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="WG_PATYCAK2" DatabaseField="WG_PATYCAK2" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="225px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="WG_SOBIG" DatabaseField="WG_SOBIG" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="225px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="WG_CHASE" DatabaseField="WG_CHASE" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="225px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="WG_DOSING" DatabaseField="WG_DOSING" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="225px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="WG_DODANCE" DatabaseField="WG_DODANCE" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="225px" FieldTextBoxWidth="30px"></def:datafieldcontrol>

</td>
</tr></table>
<br/><br/><asp:Label runat="server" Font-Bold="true" Font-Underline="true" id="lblActionswithObjects" Text="C. Actions with Objects . . . (0=No, 1=Yes)" Font-Size="Medium"/><table><tr>
<td style="vertical-align:top"  width="240px">


<def:datafieldcontrol runat="server" id="WG_EATSPOON" DatabaseField="WG_EATSPOON" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="225px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="WG_DRINKCUP" DatabaseField="WG_DRINKCUP" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="225px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="WG_COMBHAIR" DatabaseField="WG_COMBHAIR" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="225px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="WG_BSHTEETH" DatabaseField="WG_BSHTEETH" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="225px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="WG_WIPEFACE" DatabaseField="WG_WIPEFACE" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="225px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="WG_PUTHAT" DatabaseField="WG_PUTHAT" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="225px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="WG_PUTSHOE" DatabaseField="WG_PUTSHOE" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="225px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="WG_PUTWATCH" DatabaseField="WG_PUTWATCH" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="225px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="WG_PTDSLEEP" DatabaseField="WG_PTDSLEEP" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="225px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="WG_BLOWHOT" DatabaseField="WG_BLOWHOT" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="225px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="WG_FLYPLANE" DatabaseField="WG_FLYPLANE" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="225px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="WG_PTNDTELE" DatabaseField="WG_PTNDTELE" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="225px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="WG_SNIFFLOW" DatabaseField="WG_SNIFFLOW" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="225px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="WG_PUSHCAR" DatabaseField="WG_PUSHCAR" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="225px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="WG_THROWBLL" DatabaseField="WG_THROWBLL" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="225px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="WG_PTNDPOUR" DatabaseField="WG_PTNDPOUR" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="225px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="WG_PTNDSTIR" DatabaseField="WG_PTNDSTIR" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="225px" FieldTextBoxWidth="30px"></def:datafieldcontrol>


</td>
</tr></table>
<br/><br/><asp:Label runat="server" Font-Bold="true" Font-Underline="true" id="lblPretendingtobeaParent" Text="D. Pretending to be a Parent . . . (0=No, 1=Yes)" Font-Size="Medium"/><table><tr>
<td style="vertical-align:top"  width="240px">

<def:datafieldcontrol runat="server" id="WG_PUTOBED" DatabaseField="WG_PUTOBED" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="225px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="WG_COVER" DatabaseField="WG_COVER" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="225px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="WG_FEEDBOTL" DatabaseField="WG_FEEDBOTL" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="225px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="WG_FEEDSPON" DatabaseField="WG_FEEDSPON" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="225px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="WG_BRUSHIT" DatabaseField="WG_BRUSHIT" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="225px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="WG_BURBIT" DatabaseField="WG_BURBIT" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="225px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="WG_PUSHIT" DatabaseField="WG_PUSHIT" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="225px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="WG_ROCKIT" DatabaseField="WG_ROCKIT" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="225px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="WG_KISSIT" DatabaseField="WG_KISSIT" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="225px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="WG_DRESSIT" DatabaseField="WG_DRESSIT" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="225px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="WG_WIPEIT" DatabaseField="WG_WIPEIT" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="225px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="WG_TALKIT" DatabaseField="WG_TALKIT" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="225px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="WG_DIAPERIT" DatabaseField="WG_DIAPERIT" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="225px" FieldTextBoxWidth="30px"></def:datafieldcontrol>

</td>
</tr></table>
<br/><br/><asp:Label runat="server" Font-Bold="true" Font-Underline="true" id="lblImitatingOtherAdultActions" Text="E. Imitating Other Adult Actions . . . (0=No, 1=Yes)" Font-Size="Medium"/><table><tr>
<td style="vertical-align:top"  width="240px">
<def:datafieldcontrol runat="server" id="WG_SWEEP" DatabaseField="WG_SWEEP" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="225px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="WG_PUTKEY" DatabaseField="WG_PUTKEY" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="225px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="WG_POUND" DatabaseField="WG_POUND" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="225px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="WG_USESAW" DatabaseField="WG_USESAW" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="225px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="WG_TYPE" DatabaseField="WG_TYPE" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="225px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="WG_PTNDREAD" DatabaseField="WG_PTNDREAD" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="225px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="WG_DOVACUUM" DatabaseField="WG_DOVACUUM" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="225px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="WG_WATERPLT" DatabaseField="WG_WATERPLT" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="225px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="WG_PLAYMUS" DatabaseField="WG_PLAYMUS" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="225px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="WG_PTNDDRIV" DatabaseField="WG_PTNDDRIV" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="225px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="WG_WASHDISH" DatabaseField="WG_WASHDISH" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="225px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="WG_USECLOTH" DatabaseField="WG_USECLOTH" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="225px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="WG_USEPEN" DatabaseField="WG_USEPEN" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="225px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="WG_DIG" DatabaseField="WG_DIG" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="225px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="WG_WEARGLAS" DatabaseField="WG_WEARGLAS" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="225px" FieldTextBoxWidth="30px"></def:datafieldcontrol>


</td>
</tr></table>

<td style="vertical-align:top"  width="240px">




</td>
</tr></table>















<br /><br />
<table>
<br/><br/><tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="created" DatabaseField="created" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="300px"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="createdBy" DatabaseField="createdBy" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="300px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="50"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="updated" DatabaseField="updated" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="300px" FormatString="{0:d}" ></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="updatedBy" DatabaseField="updatedBy" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="300px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="50"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="scored" DatabaseField="scored" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="300px"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="scoredBy" DatabaseField="scoredBy" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="300px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="50"></def:datafieldcontrol></td>
<td></td></tr>
</table>


</ContentTemplate>
<Triggers></Triggers>
</asp:UpdatePanel>
</asp:Content>
