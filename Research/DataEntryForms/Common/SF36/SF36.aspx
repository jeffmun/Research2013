<%@ Register TagPrefix="def" Namespace="DataEntryFramework3" %> 
<%@ Page language="c#" MasterPageFile="~/UWAC.master"  Title="SF36 Data Entry" %>
<asp:Content ID="Content1" ContentPlaceHolderID="oBodyPlaceHolder" runat="server">

<def:dataentrycontroller id="DataEntryController1" runat="server" DatabaseTable="ALL_SF36" >
</def:dataentrycontroller>
<div class="main">
  <def:datafieldcontrol runat="server" id="id" DatabaseField="id"  IsInsertField="true"  FieldLabelWidth="225px"></def:datafieldcontrol>
  <def:datafieldcontrol runat="server" id="indexnum" DatabaseField="indexnum"  IsInsertField="true"  FieldLabelWidth="225px"></def:datafieldcontrol>
</div>
<asp:panel id="mainPanel" runat="server">
<div class="legend">If an item is missing entirely, enter a -9.</div>
<table class="main" border="0" cellpadding="0" cellspacing="0">
    <tr>
        <td>
            <def:datafieldcontrol runat="server" id="SF3601" DatabaseField="SF3601"  IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="225px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
        </td>
        <td>
            1=Excellent 2=Very Good 3=Good 4=Fair 5=Poor
        </td>
    </tr>
    <tr>
        <td>
            <def:datafieldcontrol runat="server" id="SF3602" DatabaseField="SF3602"  IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="225px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
        </td>
        <td>
            1=Much better 2=Somewhat better 3=About the same 4=Somewhat worse 5=Much worse
        </td>
    </tr>
</table>
<div class="collection">
  <div class="main">
    3. Does your health now limit you in these activities, and how much? Use the following:
    <def:datafieldcontrol runat="server" id="SF3603a" DatabaseField="SF3603a"  IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="225px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="SF3603b" DatabaseField="SF3603b"  IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="225px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="SF3603c" DatabaseField="SF3603c"  IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="225px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="SF3603d" DatabaseField="SF3603d"  IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="225px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="SF3603e" DatabaseField="SF3603e"  IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="225px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="SF3603f" DatabaseField="SF3603f"  IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="225px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="SF3603g" DatabaseField="SF3603g"  IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="225px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="SF3603h" DatabaseField="SF3603h"  IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="225px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="SF3603i" DatabaseField="SF3603i"  IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="225px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="SF3603j" DatabaseField="SF3603j"  IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="225px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
  </div>
  <div class="key"><def:ValueSetLabel ID="ValueSetLabel_SF3603a" runat="server"  DatabaseField="SF3603a"></def:ValueSetLabel></div>
</div>
<div class="main">4. Have you had any of the following problems as a result of your physical health? Use the following:</div>
<div class="collection">
  <div class="main">
    <def:datafieldcontrol runat="server" id="SF3604a" DatabaseField="SF3604a"  IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="225px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="SF3604b" DatabaseField="SF3604b"  IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="225px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="SF3604c" DatabaseField="SF3604c"  IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="225px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="SF3604d" DatabaseField="SF3604d"  IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="225px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
  </div>
  <div class="key"><def:ValueSetLabel ID="ValueSetLabel_SF3604a" runat="server"  DatabaseField="SF3604a"></def:ValueSetLabel></div>
</div>
<div class="main">5. Have you had any of the following problems as a result of any emotional problems? Use the following:</div>
<div class="collection">
  <div class="main">
    <def:datafieldcontrol runat="server" id="SF3605a" DatabaseField="SF3605a"  IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="225px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="SF3605b" DatabaseField="SF3605b"  IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="225px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="SF3605c" DatabaseField="SF3605c"  IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="225px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
  </div>
  <div class="key"><def:ValueSetLabel ID="ValueSetLabel_SF3605a" runat="server"  DatabaseField="SF3604a"></def:ValueSetLabel></div>
</div>
<table class="main" border="0" cellpadding="0" cellspacing="0">
    <tr>
        <td>
            <def:datafieldcontrol runat="server" id="SF3606" DatabaseField="SF3606"  IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="225px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
        </td>
        <td>
            1=Not at All 2=Slightly 3=Moderately 4=Quite a Bit 5=Extremely
        </td>
    </tr>
    <tr>
        <td>
            <def:datafieldcontrol runat="server" id="SF3607" DatabaseField="SF3607"  IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="225px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
        </td>
        <td>
            1=None 2=Very mild 3=Mild 4=Moderate 5=Severe 6=Very Severe
        </td>
    </tr>
    <tr>
        <td>
            <def:datafieldcontrol runat="server" id="SF3608" DatabaseField="SF3608"  IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="225px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
        </td>
        <td>
            1=Not at All 2=Slightly 3=Moderately 4=Quite a Bit 5=Extremely
        </td>
    </tr>
</table>
<div class="collection">
  <div class="main">
    9. Give the answer that is closest to the way you have been feeling. Use the following:<br/>
    <def:datafieldcontrol runat="server" id="SF3609a" DatabaseField="SF3609a"  IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="225px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="SF3609b" DatabaseField="SF3609b"  IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="225px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="SF3609c" DatabaseField="SF3609c"  IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="225px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="SF3609d" DatabaseField="SF3609d"  IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="225px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="SF3609e" DatabaseField="SF3609e"  IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="225px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="SF3609f" DatabaseField="SF3609f"  IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="225px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="SF3609g" DatabaseField="SF3609g"  IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="225px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="SF3609h" DatabaseField="SF3609h"  IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="225px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="SF3609i" DatabaseField="SF3609i"  IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="225px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
  </div>
  <div class="key"><def:ValueSetLabel ID="ValueSetLabel_SF3609a" runat="server"  DatabaseField="SF3609a"></def:ValueSetLabel></div>
</div>
<table class="main" border="0" cellpadding="0" cellspacing="0">
    <tr>
        <td>
            <def:datafieldcontrol runat="server" id="SF3610" DatabaseField="SF3610"  IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="225px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
        </td>
        <td>
            1=All of the time 2=Most of the time 3=Some of the time 4=A little of the time 5=None of the time
        </td>
    </tr>
</table>
<div class="collection">
  <div class="main">
    11. How true or false is each of the following statements for you? Use the following:<br/>
    <def:datafieldcontrol runat="server" id="SF3611a" DatabaseField="SF3611a"  IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="225px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="SF3611b" DatabaseField="SF3611b"  IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="225px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="SF3611c" DatabaseField="SF3611c"  IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="225px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="SF3611d" DatabaseField="SF3611d"  IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="225px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
  </div>
  <div class="key"><def:ValueSetLabel ID="ValueSetLabel_SF3611a" runat="server"  DatabaseField="SF3611a"></def:ValueSetLabel></div>
</div>
</asp:panel>
<div class="main">
  <def:datafieldcontrol runat="server" id="created" DatabaseField="created"  IsReadOnly="true" RenderReadOnlyAsDiv="true"  FieldLabelWidth="225px"></def:datafieldcontrol>
  <def:datafieldcontrol runat="server" id="createdBy" DatabaseField="createdBy"  IsReadOnly="true" RenderReadOnlyAsDiv="true"  FieldLabelWidth="225px"></def:datafieldcontrol>
  <def:datafieldcontrol runat="server" id="updated" DatabaseField="updated"  IsReadOnly="true" RenderReadOnlyAsDiv="true"  FieldLabelWidth="225px"></def:datafieldcontrol>
  <def:datafieldcontrol runat="server" id="updatedBy" DatabaseField="updatedBy"  IsReadOnly="true" RenderReadOnlyAsDiv="true"  FieldLabelWidth="225px"></def:datafieldcontrol>
  <def:datafieldcontrol runat="server" id="scored" DatabaseField="scored"  IsReadOnly="true" RenderReadOnlyAsDiv="true"  FieldLabelWidth="225px"></def:datafieldcontrol>
  <def:datafieldcontrol runat="server" id="scoredBy" DatabaseField="scoredBy"  IsReadOnly="true" RenderReadOnlyAsDiv="true"  FieldLabelWidth="225px"></def:datafieldcontrol>
</div>
</asp:Content>
