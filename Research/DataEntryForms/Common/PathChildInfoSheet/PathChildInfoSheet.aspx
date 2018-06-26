<%@ Register TagPrefix="def" Namespace="DataEntryFramework3" %> 
<%@ Page language="c#" MasterPageFile="~/UWAC.master"  Title="PathChildInfoSheet Data Entry" %>
<asp:Content ID="Content1" ContentPlaceHolderID="oBodyPlaceHolder" runat="server">

<def:dataentrycontroller id="DataEntryController1" runat="server" DatabaseTable="ALL_PathChildInfoSheet" PrimaryKeyField="pcis_pk">
</def:dataentrycontroller>
<def:datafieldcontrol runat="server" id="id" DatabaseField="id" IsInsertField="true" FieldLabelWidth="300px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="15"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="indexnum" DatabaseField="indexnum" IsInsertField="true" FieldTextBoxTextDefault="1" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="visit_date" DatabaseField="visit_date" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FormatString="{0:d}"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="completed_by" DatabaseField="completed_by" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="pcis_agemos" DatabaseField="pcis_agemos" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
 
 <br/> <br/>

 <table>
 <tr><td><def:datafieldcontrol runat="server" id="ch_eth" DatabaseField="ch_eth" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
 <def:datafieldcontrol runat="server" id="ch_eth_other" DatabaseField="ch_eth_other" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="300px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="50"></def:datafieldcontrol></td>
 <td><def:ValueSetLabel ID="ValueSetLabel_ch_eth" runat="server"  DatabaseField="ch_eth"></def:ValueSetLabel>
 </td>
 </tr>
 
  <tr><td><def:datafieldcontrol runat="server" id="ch_eth_mult" DatabaseField="ch_eth_mult" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="300px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="50"></def:datafieldcontrol>
</td><td>
</td></tr>

  <tr><td><def:datafieldcontrol runat="server" id="ch_lives_with" DatabaseField="ch_lives_with" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
  <def:datafieldcontrol runat="server" id="ch_lives_with_other" DatabaseField="ch_lives_with_other" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="300px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="50"></def:datafieldcontrol></td>
      <td><def:ValueSetLabel ID="ValueSetLabel_ch_lives_with" runat="server"  DatabaseField="ch_lives_with"></def:ValueSetLabel></td>
      <td></td>
  </tr>
  <tr></tr>
  <tr></tr>
  </table>
  
  <table>
 
  
  <table>
    <tr>
        <td>  <def:datafieldcontrol runat="server" id="moth_dob" DatabaseField="moth_dob" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FormatString="{0:d}"></def:datafieldcontrol></td>  
        <td><def:datafieldcontrol runat="server" id="cust_moth_dob" DatabaseField="cust_moth_dob" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FormatString="{0:d}"></def:datafieldcontrol></td>
    </tr>
    <tr>
        <td><def:datafieldcontrol runat="server" id="fath_dob" DatabaseField="fath_dob" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FormatString="{0:d}"></def:datafieldcontrol></td>  
        <td>    <def:datafieldcontrol runat="server" id="cust_fath_dob" DatabaseField="cust_fath_dob" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FormatString="{0:d}"></def:datafieldcontrol></td>
    </tr>
  </table>
  
    
<table>
    <tr></tr>
  <tr>
  <td><def:datafieldcontrol runat="server" id="fam_status" DatabaseField="fam_status" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
  <td><def:ValueSetLabel ID="ValueSetLabel_fam_status" runat="server"  DatabaseField="fam_status"></def:ValueSetLabel></td>
  </tr>

<tr>
    <td><def:datafieldcontrol runat="server" id="mothers_edu" DatabaseField="mothers_edu" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="mothers_edu_other" DatabaseField="mothers_edu_other" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="300px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="50"></def:datafieldcontrol>
    </td>
    <td><def:ValueSetLabel ID="ValueSetLabel_mothers_edu" runat="server"  DatabaseField="mothers_edu"></def:ValueSetLabel>    </td>
</tr>

<tr></tr>
  
<tr>
    <td><def:datafieldcontrol runat="server" id="mothers_occupation" DatabaseField="mothers_occupation" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="mothers_curr_occupation" DatabaseField="mothers_curr_occupation" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="300px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="50"></def:datafieldcontrol></td>
    <td><def:ValueSetLabel ID="ValueSetLabel_mothers_occupation" runat="server"  DatabaseField="mothers_occupation"></def:ValueSetLabel></td>
</tr>

<tr><br/><br/></tr>
  
<tr>
    <td><def:datafieldcontrol runat="server" id="spouses_edu" DatabaseField="spouses_edu" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="spouses_edu_other" DatabaseField="spouses_edu_other" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="300px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="50"></def:datafieldcontrol></td>
    <td><def:ValueSetLabel ID="ValueSetLabel_mothers_edu2" runat="server"  DatabaseField="mothers_edu"></def:ValueSetLabel>   </td>
</tr>
<tr><br/><br/></tr>

<tr>
    <td><def:datafieldcontrol runat="server" id="spouses_occupation" DatabaseField="spouses_occupation" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
        <def:datafieldcontrol runat="server" id="spouses_curr_occupation" DatabaseField="spouses_curr_occupation" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="300px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="50"></def:datafieldcontrol></td>
    <td></td>
</tr>
<tr></tr>
  
<tr>
    <td><def:datafieldcontrol runat="server" id="fam_income" DatabaseField="fam_income" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:ValueSetLabel ID="ValueSetLabel_fam_income" runat="server"  DatabaseField="fam_income"></def:ValueSetLabel></td>
</tr>

</table>

 <br/>
  <br/>
   <br/>
   <def:datafieldcontrol runat="server" id="created" DatabaseField="created" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="300px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="createdBy" DatabaseField="createdBy" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="300px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="50"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="updated" DatabaseField="updated" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="300px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="updatedBy" DatabaseField="updatedBy" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="300px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="50"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="scored" DatabaseField="scored" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="300px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="scoredBy" DatabaseField="scoredBy" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="300px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="50"></def:datafieldcontrol>
</asp:Content>
