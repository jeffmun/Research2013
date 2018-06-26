<%@ Register TagPrefix="def" Namespace="DataEntryFramework3" %> 
<%@ Page language="c#" MasterPageFile="~/UWAC.master"  Title="CANConnScr Data Entry" %>
<asp:Content ID="Content1" ContentPlaceHolderID="oBodyPlaceHolder" runat="server">
<def:dataentrycontroller id="DataEntryController1" runat="server" DatabaseTable="ALL_CANConn_Screen" >
</def:dataentrycontroller>
<def:datafieldcontrol runat="server" id="id" DatabaseField="id"  IsInsertField="true"   FieldLabelWidth="275px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="indexnum" DatabaseField="indexnum"  IsInsertField="true"   FieldLabelWidth="275px"></def:datafieldcontrol>
<br />
<def:datafieldcontrol runat="server" id="ccscr_date" DatabaseField="ccscr_date"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="275px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="ccscr_intvwr" DatabaseField="ccscr_intvwr"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="275px"  FieldTextBoxWidth="200px"></def:datafieldcontrol>
<div style="margin-left:280px"><br />0 = No, 1 = Yes, -9 = Missing Value</div>
<def:datafieldcontrol runat="server" id="ccscr_paststud" DatabaseField="ccscr_paststud"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="275px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<div style="margin-left:280px"><br />0 = No, 1 = Yes, -9 = Missing Value</div>
<def:datafieldcontrol runat="server" id="ccscr_formdx" DatabaseField="ccscr_formdx"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="275px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="ccscr_dxby" DatabaseField="ccscr_dxby"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="275px" FieldTextBoxWidth="200px"></def:datafieldcontrol>
<div style="margin-left:280px"><br />0 = No, 1 = Yes, -9 = Missing Value</div>
<def:datafieldcontrol runat="server" id="ccscr_cogtest" DatabaseField="ccscr_cogtest"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="275px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="ccscr_cognote" DatabaseField="ccscr_cognote"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="275px" FieldTextBoxWidth = "300px" FieldTextBoxHeight = "50px" FieldTextBoxTextMode="MultiLine"></def:datafieldcontrol>
<div style="margin-left:280px"><br />0 = No, 1 = Yes, -9 = Missing Value</div>
<def:datafieldcontrol runat="server" id="ccscr_regclass" DatabaseField="ccscr_regclass"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="275px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="ccscr_educnote" DatabaseField="ccscr_educnote"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="275px" FieldTextBoxWidth = "300px" FieldTextBoxHeight = "50px" FieldTextBoxTextMode="MultiLine"></def:datafieldcontrol>
<div style="margin-left:280px"><br />0 = No, 1 = Yes, -9 = Missing Value</div>
<def:datafieldcontrol runat="server" id="ccscr_englprim" DatabaseField="ccscr_englprim"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="275px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="ccscr_englnote" DatabaseField="ccscr_englnote"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="275px" FieldTextBoxWidth = "300px" FieldTextBoxHeight = "50px" FieldTextBoxTextMode="MultiLine"></def:datafieldcontrol>
<div style="margin-left:280px"><br />0 = No, 1 = Yes, -9 = Missing Value</div>
<def:datafieldcontrol runat="server" id="ccscr_englonly" DatabaseField="ccscr_englonly"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="275px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="ccscr_onlynote" DatabaseField="ccscr_onlynote"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="275px" FieldTextBoxWidth = "300px" FieldTextBoxHeight = "50px" FieldTextBoxTextMode="MultiLine"></def:datafieldcontrol>
<div style="margin-left:280px"><br />0 = No, 1 = Yes, -9 = Missing Value</div>
<def:datafieldcontrol runat="server" id="ccscr_meds" DatabaseField="ccscr_meds"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="275px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="ccscr_mednote" DatabaseField="ccscr_mednote"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="275px" FieldTextBoxWidth = "300px" FieldTextBoxHeight = "50px" FieldTextBoxTextMode="MultiLine"></def:datafieldcontrol>
<div style="margin-left:280px"><br />0 = No, 1 = Yes, -9 = Missing Value</div>
<def:datafieldcontrol runat="server" id="ccscr_seizure" DatabaseField="ccscr_seizure"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="275px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="ccscr_seiznote" DatabaseField="ccscr_seiznote"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="275px" FieldTextBoxWidth = "300px" FieldTextBoxHeight = "50px" FieldTextBoxTextMode="MultiLine"></def:datafieldcontrol>
<div style="margin-left:280px"><br />0 = No, 1 = Yes, -9 = Missing Value</div>
<def:datafieldcontrol runat="server" id="ccscr_gendx" DatabaseField="ccscr_gendx"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="275px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="ccscr_gennote" DatabaseField="ccscr_gennote"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="275px" FieldTextBoxWidth = "300px" FieldTextBoxHeight = "50px" FieldTextBoxTextMode="MultiLine"></def:datafieldcontrol>
<div style="margin-left:280px"><br />0 = No, 1 = Yes, -9 = Missing Value</div>
<def:datafieldcontrol runat="server" id="ccscr_hearvis" DatabaseField="ccscr_hearvis"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="275px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="ccscr_hearnote" DatabaseField="ccscr_hearnote"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="275px" FieldTextBoxWidth = "300px" FieldTextBoxHeight = "50px" FieldTextBoxTextMode="MultiLine"></def:datafieldcontrol>
<div style="margin-left:280px"><br />0 = No, 1 = Yes, -9 = Missing Value</div>
<def:datafieldcontrol runat="server" id="ccscr_mtrdelay" DatabaseField="ccscr_mtrdelay"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="275px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="ccscr_mtrnote" DatabaseField="ccscr_mtrnote"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="275px " FieldTextBoxWidth = "300px" FieldTextBoxHeight = "50px" FieldTextBoxTextMode="MultiLine"></def:datafieldcontrol>
<div style="margin-left:280px"><br />0 = No, 1 = Yes, -9 = Missing Value</div>
<def:datafieldcontrol runat="server" id="ccscr_brain" DatabaseField="ccscr_brain"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="275px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="ccscr_brainote" DatabaseField="ccscr_brainote"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="275px" FieldTextBoxWidth = "300px" FieldTextBoxHeight = "50px" FieldTextBoxTextMode="MultiLine"></def:datafieldcontrol>
<div style="margin-left:280px"><br />0 = No, 1 = Yes, -9 = Missing Value</div>
<def:datafieldcontrol runat="server" id="ccscr_medcond" DatabaseField="ccscr_medcond"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="275px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="ccscr_mdconote" DatabaseField="ccscr_mdconote"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="275px" FieldTextBoxWidth = "300px" FieldTextBoxHeight = "50px" FieldTextBoxTextMode="MultiLine"></def:datafieldcontrol>
<div style="margin-left:280px"><br />0 = No, 1 = Yes, -9 = Missing Value</div>
<def:datafieldcontrol runat="server" id="ccscr_physanom" DatabaseField="ccscr_physanom"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="275px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="ccscr_physnote" DatabaseField="ccscr_physnote"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="275px" FieldTextBoxWidth = "300px" FieldTextBoxHeight = "50px" FieldTextBoxTextMode="MultiLine"></def:datafieldcontrol>
<div style="margin-left:280px"><br />0 = No, 1 = Yes, -9 = Missing Value</div>
<def:datafieldcontrol runat="server" id="ccscr_premat" DatabaseField="ccscr_premat"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="275px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="ccscr_prenote" DatabaseField="ccscr_prenote"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="275px" FieldTextBoxWidth = "300px" FieldTextBoxHeight = "50px" FieldTextBoxTextMode="MultiLine"></def:datafieldcontrol>
<div style="margin-left:280px"><br />0 = No, 1 = Yes, -9 = Missing Value</div>
<def:datafieldcontrol runat="server" id="ccscr_asdfam" DatabaseField="ccscr_asdfam"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="275px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="ccscr_asdnote" DatabaseField="ccscr_asdnote"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="275px" FieldTextBoxWidth = "300px" FieldTextBoxHeight = "50px" FieldTextBoxTextMode="MultiLine"></def:datafieldcontrol>
<div style="margin-left:280px"><br />0 = No, 1 = Yes, -9 = Missing Value</div>
<def:datafieldcontrol runat="server" id="ccscr_langdis" DatabaseField="ccscr_langdis"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="275px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="ccscr_ldnote" DatabaseField="ccscr_ldnote"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="275px" FieldTextBoxWidth = "300px" FieldTextBoxHeight = "50px" FieldTextBoxTextMode="MultiLine"></def:datafieldcontrol>
<div style="margin-left:280px"><br />0 = No, 1 = Yes, -9 = Missing Value</div>
<def:datafieldcontrol runat="server" id="ccscr_psyciatr" DatabaseField="ccscr_psyciatr"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="275px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="ccscr_psycnote" DatabaseField="ccscr_psycnote"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="275px" FieldTextBoxWidth = "300px" FieldTextBoxHeight = "50px" FieldTextBoxTextMode="MultiLine"></def:datafieldcontrol>
<br />
<def:datafieldcontrol runat="server" id="ccscr_childeth" DatabaseField="ccscr_childeth"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="275px" FieldTextBoxWidth="200px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="ccscr_numsibs" DatabaseField="ccscr_numsibs"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="275px" FieldTextBoxWidth="50px"></def:datafieldcontrol>
<div style="margin-left:280px"><br />0 = No, 1 = Yes, -9 = Missing Value</div>
<def:datafieldcontrol runat="server" id="ccscr_reinforc" DatabaseField="ccscr_reinforc"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="275px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="ccscr_reinnote" DatabaseField="ccscr_reinnote"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="275px" FieldTextBoxWidth = "300px" FieldTextBoxHeight = "50px" FieldTextBoxTextMode="MultiLine"></def:datafieldcontrol>
<div style="margin-left:280px"><br />0 = No, 1 = Yes, -9 = Missing Value</div>
<def:datafieldcontrol runat="server" id="ccscr_dietrest" DatabaseField="ccscr_dietrest"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="275px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="ccscr_dietnote" DatabaseField="ccscr_dietnote"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="275px" FieldTextBoxWidth = "300px" FieldTextBoxHeight = "50px" FieldTextBoxTextMode="MultiLine"></def:datafieldcontrol>
<br />
<def:datafieldcontrol runat="server" id="ccscr_other" DatabaseField="ccscr_other"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="175px " FieldTextBoxWidth = "400px" FieldTextBoxHeight = "75px" FieldTextBoxTextMode="MultiLine"></def:datafieldcontrol>
<br />
<def:datafieldcontrol runat="server" id="ccscr_status" DatabaseField="ccscr_status"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="350px " FieldTextBoxWidth="50px"></def:datafieldcontrol>
<br />
<def:datafieldcontrol runat="server" id="created" DatabaseField="created"  IsReadOnly="true" RenderReadOnlyAsDiv="true"   FieldLabelWidth="275px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="createdBy" DatabaseField="createdBy"  IsReadOnly="true" RenderReadOnlyAsDiv="true"   FieldLabelWidth="275px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="updated" DatabaseField="updated"  IsReadOnly="true" RenderReadOnlyAsDiv="true"   FieldLabelWidth="275px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="updatedBy" DatabaseField="updatedBy"  IsReadOnly="true" RenderReadOnlyAsDiv="true"   FieldLabelWidth="275px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="scored" DatabaseField="scored"  IsReadOnly="true" RenderReadOnlyAsDiv="true"   FieldLabelWidth="275px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="scoredBy" DatabaseField="scoredBy"  IsReadOnly="true" RenderReadOnlyAsDiv="true"   FieldLabelWidth="275px"></def:datafieldcontrol>
</asp:Content>
