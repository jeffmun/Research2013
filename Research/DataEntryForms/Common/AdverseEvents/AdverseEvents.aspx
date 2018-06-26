<%@ Page Language="C#"  MasterPageFile="~/UWAC.master" AutoEventWireup="true" CodeFile="AdverseEvents.aspx.cs" Inherits="DataEntryForms_Common_AdverseEvents_AdverseEvents"  Title="AdverseEve Data Entry" %>
<%@ Register TagPrefix="def" Namespace="DataEntryFramework3" %> 
<asp:Content ID="Content1" ContentPlaceHolderID="oBodyPlaceHolder" runat="server">

<def:dataentrycontroller id="DataEntryController1" runat="server" DatabaseTable="ALL_AdverseEvents" PrimaryKeyField="advev_pk">
</def:dataentrycontroller>
   <asp:ScriptManager ID="ScriptManager1" runat="server">    </asp:ScriptManager>
<asp:UpdatePanel ID="UpdatePanel1" runat="server">
  <ContentTemplate>
<table>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="id" DatabaseField="id" IsInsertField="true" FieldLabelWidth="300px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="15"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="indexnum" DatabaseField="indexnum" IsInsertField="true" FieldTextBoxTextDefault="1" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <br /><br />
    </td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="advev_date" DatabaseField="advev_date" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FormatString="{0:d}" ></def:datafieldcontrol></td>
    <td style="vertical-align:top"><def:datafieldcontrol runat="server" id="advev_agemo" DatabaseField="advev_agemo" IsReadOnly="true" RenderReadOnlyAsDiv="true"   FieldLabelWidth="100px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
</tr>
 
 
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="advev_serious" DatabaseField="advev_serious" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
 
<td style="vertical-align:top">
    <%--<def:ValueSetLabel ID="ValueSetLabel_advev_serious" runat="server"  DatabaseField="advev_serious"></def:ValueSetLabel>--%>

</td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="advev_dateknown" DatabaseField="advev_dateknown" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FormatString="{0:d}" ></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="advev_desc" DatabaseField="advev_desc" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="300px" FieldTextBoxWidth="400px" FieldTextBoxHeight="100px" FieldTextBoxTextMode="multiline" FieldTextBoxMaxLength="500"></def:datafieldcontrol></td>
<td></td></tr>
 <tr><td>
     <br />
     <asp:Label ID="l1" runat="server" Text="Event Outcome:  (0=No, 1=Yes)" Font-Bold="true" Font-Underline="true" ></asp:Label><br />
     <asp:Label ID="Label1" runat="server" Text="Serious Adverse Event" Font-Bold="true" Font-Underline="true" ></asp:Label>


     </td><td></td></tr>

<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="advev_saeout01" DatabaseField="advev_saeout01" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
 
<td style="vertical-align:top"></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="advev_saeout02" DatabaseField="advev_saeout02" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <def:datafieldcontrol runat="server" id="advev_saeout02date" DatabaseField="advev_saeout02date" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="400px" FormatString="{0:d}" ></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <def:datafieldcontrol runat="server" id="advev_saeout02cause" DatabaseField="advev_saeout02cause" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="400px" FieldTextBoxWidth="300px" FieldTextBoxHeight="40px" FieldTextBoxTextMode="multiline" FieldTextBoxMaxLength="250"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="advev_saeout03" DatabaseField="advev_saeout03" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="advev_saeout04" DatabaseField="advev_saeout04" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="advev_saeout04hosp" DatabaseField="advev_saeout04hosp" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="400px" FieldTextBoxWidth="300px"  FieldTextBoxMaxLength="250"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="advev_saeout04admdate" DatabaseField="advev_saeout04admdate" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="400px" FormatString="{0:d}" ></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="advev_saeout04disdate" DatabaseField="advev_saeout04disdate" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="400px" FormatString="{0:d}" ></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="advev_saeout05" DatabaseField="advev_saeout05" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="advev_saeout06" DatabaseField="advev_saeout06" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="advev_saeout07" DatabaseField="advev_saeout07" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="advev_saeout08" DatabaseField="advev_saeout08" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="advev_saeout08specify" DatabaseField="advev_saeout08specify" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="400px" FieldTextBoxWidth="300px" FieldTextBoxHeight="40px" FieldTextBoxTextMode="multiline" FieldTextBoxMaxLength="500"></def:datafieldcontrol></td>
<td></td></tr>
 

    <tr><td>
     <br /><br />
     <asp:Label ID="Label3" runat="server" Text="Adverse Event" Font-Bold="true" Font-Underline="true" ></asp:Label>


     </td><td></td></tr>


<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="advev_aeout01" DatabaseField="advev_aeout01" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="advev_aeout02" DatabaseField="advev_aeout02" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="advev_ae03" DatabaseField="advev_ae03" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="advev_ae03specify" DatabaseField="advev_ae03specify" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="400px" FieldTextBoxWidth="300px" FieldTextBoxHeight="40px" FieldTextBoxTextMode="multiline" FieldTextBoxMaxLength="500"></def:datafieldcontrol></td>
<td></td></tr>

    </table>
      <table>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="advev_duringsess" DatabaseField="advev_duringsess" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td><def:ValueSetLabel ID="ValueSetLabel1" runat="server"  DatabaseField="advev_duringsess"></def:ValueSetLabel></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="advev_reltostudy" DatabaseField="advev_reltostudy" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
 
<td style="vertical-align:top" align="left" width="200px"><def:ValueSetLabel ID="ValueSetLabel_advev_reltostudy" runat="server"  DatabaseField="advev_reltostudy"></def:ValueSetLabel></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="advev_alterrisk" DatabaseField="advev_alterrisk" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
 
<td style="vertical-align:top"  align="left"><def:ValueSetLabel ID="ValueSetLabel_advev_alterrisk" runat="server"  DatabaseField="advev_alterrisk"></def:ValueSetLabel></td></tr>
 
    </table>
      <table>
    <tr><td><br />
        <asp:Label ID="l2" runat="server" Text ="Actions taken:  (0=No, 1=Yes)" Font-Bold="true"></asp:Label>
        </td><td></td></tr>

<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="advev_actions01" DatabaseField="advev_actions01" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="advev_actions02" DatabaseField="advev_actions02" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="advev_actions03" DatabaseField="advev_actions03" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="advev_actions04" DatabaseField="advev_actions04" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="advev_actions05" DatabaseField="advev_actions05" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="advev_actions06" DatabaseField="advev_actions06" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="advev_actions07" DatabaseField="advev_actions07" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td></td></tr>

<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="advev_actions07specify" DatabaseField="advev_actions07specify" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="400px"  FieldTextBoxHeight="40px" FieldTextBoxTextMode="multiline" FieldTextBoxMaxLength="500" FieldTextBoxWidth="300px"></def:datafieldcontrol></td>
<td></td></tr>
  
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="advev_reportby" DatabaseField="advev_reportby" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="300px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="100"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="advev_reportdate" DatabaseField="advev_reportdate" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FormatString="{0:d}" ></def:datafieldcontrol></td>
<td></td></tr>
 
<br/><br/><tr><td style="vertical-align:top">
    <br /><br />
    <def:datafieldcontrol runat="server" id="created" DatabaseField="created" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="300px"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top">
    <def:datafieldcontrol runat="server" id="createdBy" DatabaseField="createdBy" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="300px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="50"></def:datafieldcontrol></td>
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


