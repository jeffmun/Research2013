<%@ Page Language="C#" MasterPageFile="~/UWAC.master" AutoEventWireup="true" CodeFile="esat.aspx.cs" Inherits="DataEntryForms_Common_esat_esat" Title="ESAT Data Entry" %>
<%@ Register TagPrefix="def" Namespace="DataEntryFramework3" %>

<asp:Content ID="Content1" ContentPlaceHolderID="oBodyPlaceHolder" Runat="Server">

<def:dataentrycontroller id="DataEntryController1" runat="server" DatabaseTable="ALL_ESAT" >
</def:dataentrycontroller>

<def:datafieldcontrol runat="server" id="id" DatabaseField="id"  IsInsertField="true" ></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="esatdate" DatabaseField="esatdate"  IsEntryField="true" IsDoubleEntryField="True"  FormatString="{0:d}" ></def:datafieldcontrol>
<br />
<def:datafieldcontrol runat="server" id="ESAT_age" DatabaseField="esatagemo"  RenderReadOnlyAsDiv="true" IsReadOnly="true" IsInsertField="false" FieldLabelWidth="180px"  ></def:datafieldcontrol>

<br />
<br />
    <table  style="border-left-color: gray; border-bottom-color: gray; border-top-style: groove; border-top-color: gray; border-right-style: groove; border-left-style: groove; border-right-color: gray; border-bottom-style: groove">
        <tr>
            <td>Value labels: <br   />
                <def:ValueSetLabel  ID="ValueSetLabel1" CssClass="valuesetlabel" runat="server"  DatabaseField="esat01"></def:ValueSetLabel>
            </td>
        </tr>
    </table>

<br />

<table>
<tr><td width="500px"></td><td>    <asp:Label ID="Label1" runat="server" Text="Yes=0,  No=1" Width="500px" Font-Bold="true"></asp:Label><br />
</td>
</tr>
</table>
<def:datafieldcontrol runat="server" id="esat01" DatabaseField="esat01"  IsEntryField="true" FieldLabelWidth="500px" FieldTextBoxWidth="50px" IsDoubleEntryField="True" ></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="esat02" DatabaseField="esat02"  IsEntryField="true" FieldLabelWidth="500px" FieldTextBoxWidth="50px" IsDoubleEntryField="True" ></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="Datafieldcontrol2" DatabaseField="esat03"  IsEntryField="true" FieldLabelWidth="500px" FieldTextBoxWidth="50px" IsDoubleEntryField="True" ></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="Datafieldcontrol3" DatabaseField="esat04"  IsEntryField="true" FieldLabelWidth="500px" FieldTextBoxWidth="50px" IsDoubleEntryField="True" ></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="Datafieldcontrol4" DatabaseField="esat05"  IsEntryField="true" FieldLabelWidth="500px" FieldTextBoxWidth="50px" IsDoubleEntryField="True" ></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="Datafieldcontrol5" DatabaseField="esat06"  IsEntryField="true" FieldLabelWidth="500px" FieldTextBoxWidth="50px" IsDoubleEntryField="True" ></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="Datafieldcontrol6" DatabaseField="esat07"  IsEntryField="true" FieldLabelWidth="500px" FieldTextBoxWidth="50px" IsDoubleEntryField="True" ></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="Datafieldcontrol7" DatabaseField="esat08"  IsEntryField="true" FieldLabelWidth="500px" FieldTextBoxWidth="50px" IsDoubleEntryField="True" ></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="Datafieldcontrol8" DatabaseField="esat09"  IsEntryField="true" FieldLabelWidth="500px" FieldTextBoxWidth="50px" IsDoubleEntryField="True" ></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="Datafieldcontrol9" DatabaseField="esat10"  IsEntryField="true" FieldLabelWidth="500px" FieldTextBoxWidth="50px" IsDoubleEntryField="True" ></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="Datafieldcontrol10" DatabaseField="esat11"  IsEntryField="true" FieldLabelWidth="500px" FieldTextBoxWidth="50px" IsDoubleEntryField="True" ></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="Datafieldcontrol11" DatabaseField="esat12"  IsEntryField="true" FieldLabelWidth="500px" FieldTextBoxWidth="50px" IsDoubleEntryField="True" ></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="Datafieldcontrol12" DatabaseField="esat13"  IsEntryField="true" FieldLabelWidth="500px" FieldTextBoxWidth="50px" IsDoubleEntryField="True" ></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="Datafieldcontrol13" DatabaseField="esat14"  IsEntryField="true" FieldLabelWidth="500px" FieldTextBoxWidth="50px" IsDoubleEntryField="True" ></def:datafieldcontrol>
<br />
<br />
<def:datafieldcontrol runat="server" id="ESAT_Sum" DatabaseField="esatsum"  RenderReadOnlyAsDiv="true"  IsReadOnly="true" IsInsertField="false" FieldLabelWidth="200px" ></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="ESAT_Result" DatabaseField="esatrespf"  RenderReadOnlyAsDiv="true"  IsReadOnly="true"  IsInsertField="false" FieldLabelWidth="200px"></def:datafieldcontrol>

<def:datafieldcontrol runat="server" id="ESAT_Score_Msg" DatabaseField="esatscrmsg"  RenderReadOnlyAsDiv="true" IsReadOnly="true"  IsInsertField="false" FieldLabelWidth="200px" FieldTextBoxHeight="60px" FieldTextBoxMaxLength="400" FieldTextBoxTextMode="MultiLine" FieldTextBoxWidth="200px"></def:datafieldcontrol>
    <br />
    <br />


<def:datafieldcontrol runat="server" id="created" DatabaseField="created"  IsReadOnly="true" ></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="createdBy" DatabaseField="createdBy"  IsReadOnly="true" ></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="updated" DatabaseField="updated"  IsReadOnly="true" ></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="updatedBy" DatabaseField="updatedBy"  IsReadOnly="true" ></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="scored" DatabaseField="scored"  IsReadOnly="true" ></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="scoredBy" DatabaseField="scoredBy"  IsReadOnly="true" ></def:datafieldcontrol>


</asp:Content>



