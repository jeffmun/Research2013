<%@ Register TagPrefix="def" Namespace="DataEntryFramework3" %> 
<%@ Page language="c#" MasterPageFile="~/UWAC.master"  Title="ParParticC Data Entry" %>
<asp:Content ID="Content1" ContentPlaceHolderID="oBodyPlaceHolder" runat="server">

<def:dataentrycontroller id="DataEntryController1" runat="server" DatabaseTable="ALL_ParentParticipantChar" PrimaryKeyField = "parpartchar_pk" >
</def:dataentrycontroller>
<def:datafieldcontrol runat="server" id="id" DatabaseField="id" IsInsertField="true" FieldLabelWidth="350px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="15"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="indexnum" DatabaseField="indexnum" IsInsertField="true" FieldTextBoxTextDefault="1" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>

<br/>
<def:datafieldcontrol runat="server" id="PPCdate" DatabaseField="PPCdate" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FormatString="{0:d}" ></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="PPCagemo" DatabaseField="PPCagemo" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="PPCresp" DatabaseField="PPCresp" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="150px"></def:datafieldcontrol>

<br/>
<br/>

 <table ID="Table1" runat="server">

<tr>
<td style="vertical-align:top">
    <asp:Label ID="Label1" runat="server" Text="1. Uninterupted time (20min+) with your child:" Font-Underline="true"></asp:Label>
    <br/>
    <def:datafieldcontrol runat="server" id="PPC0101" DatabaseField="PPC0101" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="PPC0102" DatabaseField="PPC0102" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="PPC0103" DatabaseField="PPC0103" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="PPC0104" DatabaseField="PPC0104" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="PPC0105" DatabaseField="PPC0105" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <br/>
    <br/>
</td>
<td style="vertical-align:top">
<asp:Label ID="Label11" runat="server" Text="Enter 0 for NO/Unchecked, 1 for Yes/Checked" Font-Bold="true" Forecolor="Blue"></asp:Label>
</td>
</tr>

<tr>
<td style="vertical-align:top">
    <asp:Label ID="Label2" runat="server" Text="2. Activities you typically do with your child: " Font-Underline="true"></asp:Label>
    <br/>
    <def:datafieldcontrol runat="server" id="PPC0201" DatabaseField="PPC0201" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="PPC0202" DatabaseField="PPC0202" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="PPC0203" DatabaseField="PPC0203" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="PPC0204" DatabaseField="PPC0204" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="PPC0205" DatabaseField="PPC0205" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="PPC0206" DatabaseField="PPC0206" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="PPC0207" DatabaseField="PPC0207" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="PPC0208" DatabaseField="PPC0208" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="PPC0209" DatabaseField="PPC0209" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="PPC0210" DatabaseField="PPC0210" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="PPC0211" DatabaseField="PPC0211" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="PPC0211_text" DatabaseField="PPC0211_text" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="350px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="150"></def:datafieldcontrol>
    <br/>
    <br/>
</td>
<td style="vertical-align:top"></td>
</tr>

<tr>
<td style="vertical-align:top">
<asp:Label ID="Label3" runat="server" Text="3. Activities you enjoy most with your child: " Font-Underline="true"></asp:Label>
<br/>
<def:datafieldcontrol runat="server" id="PPC0301" DatabaseField="PPC0301" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="PPC0302" DatabaseField="PPC0302" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="PPC0303" DatabaseField="PPC0303" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="PPC0304" DatabaseField="PPC0304" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="PPC0305" DatabaseField="PPC0305" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="PPC0306" DatabaseField="PPC0306" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="PPC0307" DatabaseField="PPC0307" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="PPC0308" DatabaseField="PPC0308" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="PPC0309" DatabaseField="PPC0309" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="PPC0310" DatabaseField="PPC0310" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="PPC0311" DatabaseField="PPC0311" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="PPC0311_text" DatabaseField="PPC0311_text" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="350px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="150"></def:datafieldcontrol>
<br/>
<br/>
</td>
<td style="vertical-align:top"></td>
</tr>

<tr>
<td style="vertical-align:top">
    <asp:Label ID="Label4" runat="server" Text="4. Activities you enjoy least with your child: " Font-Underline="true"></asp:Label>
    <br/>
    <def:datafieldcontrol runat="server" id="PPC0401" DatabaseField="PPC0401" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="PPC0402" DatabaseField="PPC0402" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="PPC0403" DatabaseField="PPC0403" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="PPC0404" DatabaseField="PPC0404" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="PPC0405" DatabaseField="PPC0405" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="PPC0406" DatabaseField="PPC0406" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="PPC0407" DatabaseField="PPC0407" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="PPC0408" DatabaseField="PPC0408" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="PPC0409" DatabaseField="PPC0409" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="PPC0410" DatabaseField="PPC0410" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="PPC0411" DatabaseField="PPC0411" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="PPC0411_text" DatabaseField="PPC0411_text" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="350px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="150"></def:datafieldcontrol>
    <br/>
    <br/>
</td>
<td style="vertical-align:top"><asp:Label ID="Label12" runat="server" Text="Enter 0 for NO/Unchecked, 1 for Yes/Checked" Font-Bold="true" Forecolor="Blue"></asp:Label></td>
</tr>

<tr>
<td style="vertical-align:top">
    <asp:Label ID="Label8" runat="server" Text="5. " Font-Underline="true"></asp:Label>
    <def:datafieldcontrol runat="server" id="PPC0501" DatabaseField="PPC0501" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <br/>
    <br/>
</td>
<td style="vertical-align:top"><def:ValueSetLabel ID="ValueSetLabel1" runat="server"  DatabaseField="PPC0501" Font-Bold="true" Forecolor="Blue"></def:ValueSetLabel>
<br/></td>
</tr>

<tr>
<td style="vertical-align:top">
    <asp:Label ID="Label5" runat="server" Text="6. How do you access the internet: " Font-Underline="true"></asp:Label>
    <br/>
    <def:datafieldcontrol runat="server" id="PPC0601" DatabaseField="PPC0601" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="PPC0602" DatabaseField="PPC0602" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="PPC0603" DatabaseField="PPC0603" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="PPC0604" DatabaseField="PPC0604" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <br/>
    <br/>
</td>
<td style="vertical-align:top"><asp:Label ID="Label13" runat="server" Text="Enter 0 for NO/Unchecked, 1 for Yes/Checked" Font-Bold="true" Forecolor="Blue"></asp:Label></td>
</tr>

<tr>
<td style="vertical-align:top">
    <asp:Label ID="Label6" runat="server" Text="7. Reasons you use the internet: " Font-Underline="true"></asp:Label>
    <br/>
    <def:datafieldcontrol runat="server" id="PPC0701" DatabaseField="PPC0701" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="PPC0702" DatabaseField="PPC0702" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="PPC0703" DatabaseField="PPC0703" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="PPC0704" DatabaseField="PPC0704" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="PPC0705" DatabaseField="PPC0705" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="PPC0706" DatabaseField="PPC0706" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="PPC0707" DatabaseField="PPC0707" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="PPC0708" DatabaseField="PPC0708" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="PPC0708_text" DatabaseField="PPC0708_text" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="350px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="150"></def:datafieldcontrol>
    <br/>
    <br/>
</td>
<td style="vertical-align:top"></td>
</tr>

<tr>
<td style="vertical-align:top">
    <asp:Label ID="Label9" runat="server" Text="8. " Font-Underline="true"></asp:Label>
    <def:datafieldcontrol runat="server" id="PPC0801" DatabaseField="PPC0801" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <br/>
    <br/>
</td>
<td style="vertical-align:top"><def:ValueSetLabel ID="ValueSetLabel2" runat="server"  DatabaseField="PPC0801" Font-Bold="true" Forecolor="Blue"></def:ValueSetLabel>
<br/></td>
</tr>

<tr>
<td style="vertical-align:top">
    <asp:Label ID="Label10" runat="server" Text="9. " Font-Underline="true"></asp:Label>
    <def:datafieldcontrol runat="server" id="PPC0901" DatabaseField="PPC0901" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="PPC0901_text" DatabaseField="PPC0901_text" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="350px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="150"></def:datafieldcontrol>
    <br/>
    <br/>
</td>
<td style="vertical-align:top"></td>
</tr>

<tr>
<td style="vertical-align:top">
    <asp:Label ID="Label7" runat="server" Text="10. Reasons for not having internet access in your home: " Font-Underline="true"></asp:Label>
    <br/>
    <def:datafieldcontrol runat="server" id="PPC1001" DatabaseField="PPC1001" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="PPC1002" DatabaseField="PPC1002" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="PPC1003" DatabaseField="PPC1003" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="PPC1003_text" DatabaseField="PPC1003_text" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="350px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="150"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="PPC1004" DatabaseField="PPC1004" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="PPC1005" DatabaseField="PPC1005" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
</td>
<td style="vertical-align:top"></td>
</tr>


</table>



<br/>
<br/>
<def:datafieldcontrol runat="server" id="created" DatabaseField="created" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="350px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="createdBy" DatabaseField="createdBy" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="350px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="50"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="updated" DatabaseField="updated" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="350px" ></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="updatedBy" DatabaseField="updatedBy" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="350px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="50"  ></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="scored" DatabaseField="scored" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="350px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="scoredBy" DatabaseField="scoredBy" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="350px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="50"></def:datafieldcontrol>
</asp:Content>

