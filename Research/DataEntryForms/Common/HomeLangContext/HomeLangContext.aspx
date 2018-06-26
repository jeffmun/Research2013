<%@ Register TagPrefix="def" Namespace="DataEntryFramework3" %> 
<%@ Page language="c#" MasterPageFile="~/UWAC.master"  Title="Home Lang Context Data Entry" %>
<asp:Content ID="Content1" ContentPlaceHolderID="oBodyPlaceHolder" runat="server">

<def:dataentrycontroller id="DataEntryController1" runat="server" DatabaseTable="all_homelangcontext" PrimaryKeyField="hlc_pk">
</def:dataentrycontroller>
   <asp:ScriptManager ID="ScriptManager1" runat="server">    </asp:ScriptManager>
<asp:UpdatePanel ID="UpdatePanel1" runat="server">
  <ContentTemplate>
<table>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="id" DatabaseField="id" IsInsertField="true" FieldLabelWidth="300px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="15"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="indexnum" DatabaseField="indexnum" IsInsertField="true" FieldTextBoxTextDefault="1" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="hlc_date" DatabaseField="hlc_date" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FormatString="{0:d}" ></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="hlc_agemo" DatabaseField="hlc_agemo"  IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="hlc_scrmsg" DatabaseField="hlc_scrmsg"  IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="300px" FieldTextBoxWidth="400px" FieldTextBoxHeight="40px" FieldTextBoxTextMode="multiline" FieldTextBoxMaxLength="250"></def:datafieldcontrol></td>
<td></td></tr>
 
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="hlc_exmnr" DatabaseField="hlc_exmnr" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="300px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="20"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="hlc_resp" DatabaseField="hlc_resp" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="300px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="50"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="hlc_cmnt" DatabaseField="hlc_cmnt" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="300px" FieldTextBoxWidth="400px" FieldTextBoxHeight="40px" FieldTextBoxTextMode="multiline" FieldTextBoxMaxLength="250"></def:datafieldcontrol></td>
<td></td></tr>
    </table>

<br />
      <br />
<table>
    <tr>
        <td style="vertical-align:top">
                         <asp:Label ID="Label4" runat="server" Text="Child's info" Font-Bold="true" Font-Underline="true"></asp:Label>

            <%--CHILD--%>
      <table>
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="hlc_birthCntry" DatabaseField="hlc_birthCntry" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="200px" FieldTextBoxWidth="150px" FieldTextBoxMaxLength="50"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="hlc_yearUS" DatabaseField="hlc_yearUS" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="200px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
          </table>
        </td>

        <td style="vertical-align:top">
             <asp:Label ID="Label3" runat="server" Text="Mother's info" Font-Bold="true" Font-Underline="true"></asp:Label>
            
<%--MOTHER--%> 
 <table>
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="hlc_birthCntryM" DatabaseField="hlc_birthCntryM" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="200px" FieldTextBoxWidth="150px" FieldTextBoxMaxLength="50"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="hlc_yearUSM" DatabaseField="hlc_yearUSM" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="200px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="hlc_langM1" DatabaseField="hlc_langM1" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="200px" FieldTextBoxWidth="150px" FieldTextBoxMaxLength="30"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="hlc_langM2" DatabaseField="hlc_langM2" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="200px" FieldTextBoxWidth="150px" FieldTextBoxMaxLength="30"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="hlc_langM3" DatabaseField="hlc_langM3" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="200px" FieldTextBoxWidth="150px" FieldTextBoxMaxLength="30"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="hlc_langM4" DatabaseField="hlc_langM4" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="200px" FieldTextBoxWidth="150px" FieldTextBoxMaxLength="30"></def:datafieldcontrol></td>
<td></td></tr>
 </table>

        </td>

        <td style="vertical-align:top">
            <%--FATHER--%>
             <asp:Label ID="Label2" runat="server" Text="Father's info" Font-Bold="true" Font-Underline="true"></asp:Label>
<table>


<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="hlc_birthCntryF" DatabaseField="hlc_birthCntryF" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="200px" FieldTextBoxWidth="150px" FieldTextBoxMaxLength="50"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="hlc_yearUSF" DatabaseField="hlc_yearUSF" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="200px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="hlc_langF1" DatabaseField="hlc_langF1" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="200px" FieldTextBoxWidth="150px" FieldTextBoxMaxLength="30"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="hlc_langF2" DatabaseField="hlc_langF2" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="200px" FieldTextBoxWidth="150px" FieldTextBoxMaxLength="30"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="hlc_langF3" DatabaseField="hlc_langF3" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="200px" FieldTextBoxWidth="150px" FieldTextBoxMaxLength="30"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="hlc_langF4" DatabaseField="hlc_langF4" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="200px" FieldTextBoxWidth="150px" FieldTextBoxMaxLength="30"></def:datafieldcontrol></td>
<td></td></tr>
</table>

        </td>

    </tr>


</table>


    <br />
    <br />
      <asp:Label ID="Label1" runat="server" Text="Languages spoken at home" Font-Bold="true" Font-Underline="true"></asp:Label>
    <br />

 <table>

<tr><td width="400px"></td><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="hlc_EnglishPt" DatabaseField="hlc_EnglishPt" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="200px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="hlc_langC1" DatabaseField="hlc_langC1" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="200px" FieldTextBoxWidth="150px" FieldTextBoxMaxLength="30"></def:datafieldcontrol></td>
<td style="vertical-align:top"><def:datafieldcontrol runat="server" id="hlc_langC1Pt" DatabaseField="hlc_langC1Pt" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="200px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="hlc_langC2" DatabaseField="hlc_langC2" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="200px" FieldTextBoxWidth="150px" FieldTextBoxMaxLength="30"></def:datafieldcontrol></td>
<td style="vertical-align:top"><def:datafieldcontrol runat="server" id="hlc_langC2Pt" DatabaseField="hlc_langC2Pt" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="200px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="hlc_langC3" DatabaseField="hlc_langC3" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="200px" FieldTextBoxWidth="150px" FieldTextBoxMaxLength="30"></def:datafieldcontrol></td>
<td style="vertical-align:top"><def:datafieldcontrol runat="server" id="hlc_langC3Pt" DatabaseField="hlc_langC3Pt" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="200px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
 
<tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="hlc_langC4" DatabaseField="hlc_langC4" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="200px" FieldTextBoxWidth="150px" FieldTextBoxMaxLength="30"></def:datafieldcontrol></td>
<td style="vertical-align:top"><def:datafieldcontrol runat="server" id="hlc_langC4Pt" DatabaseField="hlc_langC4Pt" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="200px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td></td></tr>
    
    </table>


      <br/><br/>
<table>
    <tr><td style="vertical-align:top"><def:datafieldcontrol runat="server" id="created" DatabaseField="created" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="300px"></def:datafieldcontrol></td>
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
