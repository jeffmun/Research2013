<%@ Register TagPrefix="def" Namespace="DataEntryFramework3" %> 
<%@ Page language="c#" MasterPageFile="~/UWAC.master"  Title="Parent Child Fidelity Data Entry" %>
<asp:Content ID="Content1" ContentPlaceHolderID="oBodyPlaceHolder" runat="server">

<def:dataentrycontroller id="DataEntryController1" runat="server" DatabaseTable="ALL_ParentChildFidelity" PrimaryKeyField="pcf_pk">
</def:dataentrycontroller>
<def:datafieldcontrol runat="server" id="id" DatabaseField="id"  IsInsertField="true"  FieldLabelWidth="140px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="indexnum" DatabaseField="indexnum"  IsInsertField="true"  FieldLabelWidth="140px" ></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="fid_parent" DatabaseField="fid_parent"  IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="200px"  FieldTextBoxWidth="150px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="fid_code_date" DatabaseField="fid_code_date"  IsEntryField="true" IsDoubleEntryField="true" FormatString="{0:d}" FieldLabelWidth="200px" FieldTextBoxWidth="100px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="fid_rater" DatabaseField="fid_rater"  IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="200px"  FieldTextBoxWidth="150px"></def:datafieldcontrol>
<br />
<br />
<def:datafieldcontrol runat="server" id="fid_location" DatabaseField="fid_location"  IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="200px"  FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="fid_timepoint" DatabaseField="fid_timepoint"  IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="200px"  FieldTextBoxWidth="30px"></def:datafieldcontrol>

<br /><br />
<br />
<def:ValueSetLabel ID="ValueSetLabel_fidA1" runat="server"  DatabaseField="fidA1"></def:ValueSetLabel>
<br />

<table id="tblItems" runat="server">
<tr> 
<td align="left" >
    <asp:Label ID="Label2" runat="server" Text="  " Width="300px"></asp:Label>
    <asp:Label ID="Label1" runat="server" Text="Activty 1 (Toy play)" Font-Bold="true" Font-Underline="true" Width="300px"></asp:Label></td>
<td align="left" >
    <asp:Label ID="Label3" runat="server" Text="  " Width="10px"></asp:Label>
    <asp:Label ID="Label4" runat="server" Text="Activity 2 (Sensory social routine)" Font-Bold="true" Font-Underline="true" Width="300px"></asp:Label></td>


</tr>
<tr>
<td align="left">
<def:datafieldcontrol runat="server" id="fid_activity1" DatabaseField="fid_activity1"  IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxWidth="30px" FieldLabelWidth="290px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server"      id="fiddate1" DatabaseField=     "fiddate1"  IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxWidth="80px" FieldLabelWidth="290px" FormatString="{0:d}"></def:datafieldcontrol>
<def:datafieldcontrol runat="server"      id="fidtxwk1" DatabaseField=     "fidtxwk1"  IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxWidth="30px" FieldLabelWidth="290px"></def:datafieldcontrol>
<br />                                                                                                                                                                          
<def:datafieldcontrol runat="server"         id="fidA1" DatabaseField=        "fidA1"  IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxWidth="30px" FieldLabelWidth="290px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server"         id="fidB1" DatabaseField=        "fidB1"  IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxWidth="30px" FieldLabelWidth="290px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server"         id="fidC1" DatabaseField=        "fidC1"  IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxWidth="30px" FieldLabelWidth="290px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server"         id="fidD1" DatabaseField=        "fidD1"  IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxWidth="30px" FieldLabelWidth="290px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server"         id="fidE1" DatabaseField=        "fidE1"  IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxWidth="30px" FieldLabelWidth="290px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server"         id="fidF1" DatabaseField=        "fidF1"  IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxWidth="30px" FieldLabelWidth="290px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server"         id="fidG1" DatabaseField=        "fidG1"  IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxWidth="30px" FieldLabelWidth="290px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server"         id="fidH1" DatabaseField=        "fidH1"  IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxWidth="30px" FieldLabelWidth="290px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server"         id="fidI1" DatabaseField=        "fidI1"  IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxWidth="30px" FieldLabelWidth="290px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server"         id="fidJ1" DatabaseField=        "fidJ1"  IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxWidth="30px" FieldLabelWidth="290px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server"         id="fidK1" DatabaseField=        "fidK1"  IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxWidth="30px" FieldLabelWidth="290px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server"         id="fidL1" DatabaseField=        "fidL1"  IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxWidth="30px" FieldLabelWidth="290px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server"         id="fidM1" DatabaseField=        "fidM1"  IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxWidth="30px" FieldLabelWidth="290px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server"     id="fidNotes1" DatabaseField=    "fidNotes1"  IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="240px"
         FieldTextBoxWidth="300px" FieldTextBoxMode = "MultiLine" FieldTextBoxHeight="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server"         id="fidvidfile1"   DatabaseField=        "fidvidfile1"  IsEntryField="true" IsDoubleEntryField="false" FieldTextBoxWidth="120px" FieldLabelWidth="290px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server"         id="fidstarttime1" DatabaseField=        "fidstarttime1"  IsEntryField="true" IsDoubleEntryField="false" FieldTextBoxWidth="120px" FieldLabelWidth="290px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server"         id="fidendtime1"   DatabaseField=        "fidendtime1"  IsEntryField="true" IsDoubleEntryField="false" FieldTextBoxWidth="120px" FieldLabelWidth="290px"></def:datafieldcontrol>

</td>                                                                                                                                     
                                                                                                                                          
<td align="left">                                                                                                                                      
<def:datafieldcontrol runat="server" id="fid_activity2" DatabaseField="fid_activity2"  IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server"      id="fiddate2" DatabaseField=     "fiddate2"  IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxWidth="80px" FormatString="{0:d}"></def:datafieldcontrol>
<def:datafieldcontrol runat="server"      id="fidtxwk2" DatabaseField=     "fidtxwk2"  IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxWidth="30px" ></def:datafieldcontrol>
<br />
<def:datafieldcontrol runat="server"         id="fidA2" DatabaseField=        "fidA2"  IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server"         id="fidB2" DatabaseField=        "fidB2"  IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server"         id="fidC2" DatabaseField=        "fidC2"  IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server"         id="fidD2" DatabaseField=        "fidD2"  IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server"         id="fidE2" DatabaseField=        "fidE2"  IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server"         id="fidF2" DatabaseField=        "fidF2"  IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server"         id="fidG2" DatabaseField=        "fidG2"  IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server"         id="fidH2" DatabaseField=        "fidH2"  IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server"         id="fidI2" DatabaseField=        "fidI2"  IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server"         id="fidJ2" DatabaseField=        "fidJ2"  IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server"         id="fidK2" DatabaseField=        "fidK2"  IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server"         id="fidL2" DatabaseField=        "fidL2"  IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server"         id="fidM2" DatabaseField=        "fidM2"  IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server"     id="fidNote2" DatabaseField=    "fidNotes2"  IsEntryField="true" IsDoubleEntryField="false" 
         FieldTextBoxWidth="300px" FieldTextBoxMode = "MultiLine" FieldTextBoxHeight="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server"         id="fidvidfile2"   DatabaseField=      "fidvidfile2"    IsEntryField="true" IsDoubleEntryField="false" FieldTextBoxWidth="120px" FieldLabelWidth="290px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server"         id="Datafieldcontrol2" DatabaseField=  "fidstarttime2"  IsEntryField="true" IsDoubleEntryField="false" FieldTextBoxWidth="120px" FieldLabelWidth="290px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server"         id="fidendtime2"   DatabaseField=      "fidendtime2"    IsEntryField ="true" IsDoubleEntryField="false" FieldTextBoxWidth="120px" FieldLabelWidth="290px"></def:datafieldcontrol>


</td>             

</tr>
</table>

<br />
<br />


<br />
<br />
<def:datafieldcontrol runat="server" id="created" DatabaseField="created"  IsReadOnly="true" RenderReadOnlyAsDiv="true"  FieldLabelWidth="300px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="createdBy" DatabaseField="createdBy"  IsReadOnly="true" RenderReadOnlyAsDiv="true"  FieldLabelWidth="300px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="updated" DatabaseField="updated"  IsReadOnly="true" RenderReadOnlyAsDiv="true"  FieldLabelWidth="300px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="updatedBy" DatabaseField="updatedBy"  IsReadOnly="true" RenderReadOnlyAsDiv="true"  FieldLabelWidth="300px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="scored" DatabaseField="scored"  IsReadOnly="true" RenderReadOnlyAsDiv="true"  FieldLabelWidth="300px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="scoredBy" DatabaseField="scoredBy"  IsReadOnly="true" RenderReadOnlyAsDiv="true"  FieldLabelWidth="300px"></def:datafieldcontrol>
</asp:Content>
