
<%@ Register TagPrefix="def" Namespace="DataEntryFramework3" %> 
<%@ Page language="c#" Inherits="GenericDataEntryForms.mullen_items.mullen_items" CodeFile="mullen_items.aspx.cs"   MasterPageFile="~/UWAC.master"  Title="Mullen_Item Data Entry" %>
<asp:Content ID="Content1" ContentPlaceHolderID="oBodyPlaceHolder" runat="server">

<def:dataentrycontroller id="DataEntryController1" runat="server" DatabaseTable="ALL_Mullen_Items" MeasureName="Mullen" primaryKeyField="mullen_pk" ondoscore="DataEntryController1_DoScore" UseMetadata="True">
</def:dataentrycontroller>

<div class="main">

    <table>
        <tr>
            <td valign="bottom" >
<def:datafieldcontrol runat="server" id="id" DatabaseField="id" IsInsertField="true" FieldLabelWidth="100px" FieldTextBoxWidth="100px" FieldTextBoxMaxLength="15"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="indexnum" DatabaseField="indexnum" IsInsertField="true" FieldTextBoxTextDefault="1" FieldLabelWidth="100px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="muclin" DatabaseField="muclin" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="100px" FieldTextBoxWidth="100px" FieldTextBoxMaxLength="50"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="mudate" DatabaseField="mudate" IsEntryField="true"  IsEntryValueRequired="true" IsDoubleEntryField="true" FieldLabelWidth="100px" FormatString="{0:d}"></def:datafieldcontrol>

            </td>
            <td valign="bottom" >
        <def:datafieldcontrol runat="server" id="muusegage" DatabaseField="muusegage" IsEntryField="true"  IsEntryValueRequired="true" IsDoubleEntryField="true" FieldLabelWidth="200px"  FieldTextBoxWidth="40px"></def:datafieldcontrol>

            </td>
            <td valign="bottom" >
        <def:datafieldcontrol runat="server" id="mugagewHE" DatabaseField="mugagewHE" IsEntryField="true"  IsDoubleEntryField="true" FieldLabelWidth="200px"  FieldTextBoxWidth="40px"></def:datafieldcontrol>

            </td>

        </tr>
    </table>



</div>
<asp:panel id="mainPanel" CssClass="mainPanel" runat="server">


<div class="main">


<table>
<tr>
<td><font color="#151B8D"><def:datafieldcontrol runat="server" id="mudob" DatabaseField="mudob" IsReadOnly="true" FieldLabelWidth="100px" FormatString="{0:d}" RenderReadOnlyAsDiv="true" ></def:datafieldcontrol></td>
<td width="250px"></td>
<td width="250px"><font color="#151B8D"><i><def:datafieldcontrol runat="server" id="mugagew" DatabaseField="mugagew" IsReadOnly="true" FieldLabelWidth="200px"  FieldTextBoxWidth="40px" RenderReadOnlyAsDiv="true" ></def:datafieldcontrol></i></td>
</tr>
<tr>
<td><font color="#151B8D"><def:datafieldcontrol runat="server" id="muagem" DatabaseField="muagem" IsReadOnly="true" FieldLabelWidth="100px" FieldTextBoxWidth="40px" RenderReadOnlyAsDiv="true" ></def:datafieldcontrol></td>
<td width="250px"></td>
<td width="250px"><font color="#151B8D"><i><def:datafieldcontrol runat="server" id="muaageym" DatabaseField="muaageym" IsReadOnly="true" FieldLabelWidth="200px" FieldTextBoxWidth="100px" FieldTextBoxMaxLength="50" RenderReadOnlyAsDiv="true" ></def:datafieldcontrol></i></td>
</tr>
<tr>
<td><font color="#151B8D"><def:datafieldcontrol runat="server" id="muageym" DatabaseField="muageym" IsReadOnly="true" FieldLabelWidth="100px" FieldTextBoxWidth="100px" FieldTextBoxMaxLength="10" RenderReadOnlyAsDiv="true" ></def:datafieldcontrol></td>
<td width="250px"></td>
<td width="250px"><font color="#151B8D"><i><def:datafieldcontrol runat="server" id="muadob" DatabaseField="muadob" IsReadOnly="true" FieldLabelWidth="200px" FormatString="{0:d}" RenderReadOnlyAsDiv="true" ></def:datafieldcontrol></i></td>

</tr>
</table>

<br/>
</div>


<div class="main">
<font color="#800517">
Once data is entered and saved, the raw score values, etc., will be displayed in this table.<br/>

<font color="#151B8D">
<table>
<td style="vertical-align:top">
	<table border="1" cellspacing="0">

	<font color="#151B8D">
	<tr><b>
	<td align=left width=230><b><u>Scale</u></b></td>
	<td align=center width=80><b><u>Std Score</u></b></td>
	<td align=center width=80><b><u>Ratio DQ (AE/CA)</u></b></td>
	<td align=center width=80><b><u>Age Equiv</u></b></td>
	<td align=center width=80><b><u>Pctile</u></b></td>
	<td align=center width=80><b><u>Category</u></b></td>
	<tr>
	<td>Early Learning Composite</td>
	<td align=center><def:datafieldcontrol runat="server" id="mucss" DatabaseField="mucss" IsReadOnly="true" ShowFieldLabel="false" FieldTextBoxWidth="40px" RenderReadOnlyAsDiv="true" ></def:datafieldcontrol></td>
	<td align=center><def:datafieldcontrol runat="server" id="mucoiq" DatabaseField="mucoiq" IsReadOnly="true" ShowFieldLabel="false" FieldTextBoxWidth="40px" RenderReadOnlyAsDiv="true" ></def:datafieldcontrol></td>
	<td align=center><def:datafieldcontrol runat="server" id="mucoagee" DatabaseField="mucoagee" IsReadOnly="true" ShowFieldLabel="false"  FieldTextBoxWidth="40px" RenderReadOnlyAsDiv="true" ></def:datafieldcontrol></td>
	<td align=center><def:datafieldcontrol runat="server" id="mucpctr" DatabaseField="mucpctr" IsReadOnly="true" ShowFieldLabel="false"   FieldLabelWidth="300px" FieldTextBoxWidth="40px" RenderReadOnlyAsDiv="true" ></def:datafieldcontrol></td>
	<td align=center><def:datafieldcontrol runat="server" id="mucdcat" DatabaseField="mucdcat" IsReadOnly="true" ShowFieldLabel="false"  FieldLabelWidth="300px" FieldTextBoxWidth="80px" FieldTextBoxMaxLength="50" RenderReadOnlyAsDiv="true" ></def:datafieldcontrol></td>
	</tr><tr>
	<td>Verbal (mean RL & EL)</td>
	<td align=center><def:datafieldcontrol runat="server" id="muvss" DatabaseField="muvss" IsReadOnly="true"  ShowFieldLabel="false"  FieldTextBoxWidth="40px" RenderReadOnlyAsDiv="true" ></def:datafieldcontrol></td>
	<td align=center><def:datafieldcontrol runat="server" id="muviq" DatabaseField="muviq" IsReadOnly="true" ShowFieldLabel="false" FieldTextBoxWidth="40px" RenderReadOnlyAsDiv="true" ></def:datafieldcontrol></td>
	<td align=center><def:datafieldcontrol runat="server" id="muvagee" DatabaseField="muvagee" IsReadOnly="true" ShowFieldLabel="false"  FieldTextBoxWidth="40px" RenderReadOnlyAsDiv="true" ></def:datafieldcontrol></td>
	</tr><tr>
	<td>Nonverbal (mean VR & FM)</td>
	<td align=center><def:datafieldcontrol runat="server" id="munvss" DatabaseField="munvss" IsReadOnly="true" ShowFieldLabel="false"  FieldTextBoxWidth="40px" RenderReadOnlyAsDiv="true" ></def:datafieldcontrol></td>
	<td align=center><def:datafieldcontrol runat="server" id="munviq" DatabaseField="munviq" IsReadOnly="true" ShowFieldLabel="false"  FieldTextBoxWidth="40px" RenderReadOnlyAsDiv="true" ></def:datafieldcontrol></td>
	<td align=center><def:datafieldcontrol runat="server" id="munvagee" DatabaseField="munvagee" IsReadOnly="true" ShowFieldLabel="false"  FieldTextBoxWidth="40px" RenderReadOnlyAsDiv="true" ></def:datafieldcontrol></td>

	</tr>

	</table>
</td>
<td>&nbsp; &nbsp; &nbsp;</td>
<td style="vertical-align:top">
<table border="1" cellspacing="0">
<tr >
<td height=55 valign="bottom" align=left width = 120><b><u><br /><br />Subscale</u></b></td>
<td height=55 valign="bottom" align=center width = 75><b><u>Raw Score</u></b></td>
<td height=55 valign="bottom" align=center width = 50><b><u>T score</u></b></td>
<td height=55 valign="bottom" align=center width=50><b><u>Pctile</u></b></td>
<td height=55 valign="bottom" align=center width=150><b><u>Category</u></b></td>
<td height=55 valign="bottom" align=center width=50><b><u>Age Equiv</u></b></td>
</tr>
<tr>
<td height=30>Gross Motor</td>
<td align=center><def:datafieldcontrol runat="server" id="mugmraw"  DatabaseField="mugmraw"  IsReadOnly="true" ShowFieldLabel="false" FieldLabelWidth="150px" FieldTextBoxWidth="40px" RenderReadOnlyAsDiv="true" ></def:datafieldcontrol></td>
<td align=center><def:datafieldcontrol runat="server" id="mugmts"   DatabaseField="mugmts"   IsReadOnly="true" ShowFieldLabel="false" FieldLabelWidth="100px" FieldTextBoxWidth="40px" RenderReadOnlyAsDiv="true" ></def:datafieldcontrol></td>
<td align=center><def:datafieldcontrol runat="server" id="mugmpctr" DatabaseField="mugmpctr" IsReadOnly="true"   ShowFieldLabel="false" FieldLabelWidth="100px" FieldTextBoxWidth="40px" RenderReadOnlyAsDiv="true" ></def:datafieldcontrol></td>
<td align=center><def:datafieldcontrol runat="server" id="mugmdcat" DatabaseField="mugmdcat" IsReadOnly="true"   ShowFieldLabel="false" FieldLabelWidth="100px" FieldTextBoxWidth="80px"  RenderReadOnlyAsDiv="true" FieldTextBoxMaxLength="50"></def:datafieldcontrol></td>
<td align=center><def:datafieldcontrol runat="server" id="mugmagee" DatabaseField="mugmagee" IsReadOnly="true"   ShowFieldLabel="false" FieldLabelWidth="100px" FieldTextBoxWidth="40px" RenderReadOnlyAsDiv="true" ></def:datafieldcontrol></td>
</tr>
<tr>
<td height=30>Visual Reception</td>
<td align=center><def:datafieldcontrol runat="server" id="muvrraw" DatabaseField="muvrraw" IsReadOnly="true" ShowFieldLabel="false" FieldLabelWidth="150px" FieldTextBoxWidth="40px" RenderReadOnlyAsDiv="true" ></def:datafieldcontrol></td>
<td align=center><def:datafieldcontrol runat="server" id="muvrts" DatabaseField="muvrts" IsReadOnly="true" ShowFieldLabel="false" FieldLabelWidth="100px" FieldTextBoxWidth="40px" RenderReadOnlyAsDiv="true" ></def:datafieldcontrol></td>
<td align=center><def:datafieldcontrol runat="server" id="muvrpctr" DatabaseField="muvrpctr" IsReadOnly="true" ShowFieldLabel="false" FieldLabelWidth="100px" FieldTextBoxWidth="40px" RenderReadOnlyAsDiv="true" ></def:datafieldcontrol></td>
<td align=center><def:datafieldcontrol runat="server" id="muvrdcat" DatabaseField="muvrdcat" IsReadOnly="true" ShowFieldLabel="false" FieldLabelWidth="100px" FieldTextBoxWidth="80px"  RenderReadOnlyAsDiv="true" FieldTextBoxMaxLength="50"></def:datafieldcontrol></td>
<td align=center><def:datafieldcontrol runat="server" id="muvragee" DatabaseField="muvragee" IsReadOnly="true" ShowFieldLabel="false" FieldLabelWidth="100px" FieldTextBoxWidth="40px" RenderReadOnlyAsDiv="true" ></def:datafieldcontrol></td>
</tr>
<tr>
<td height=30>Fine Motor</td>
<td align=center><def:datafieldcontrol runat="server" id="mufmraw" DatabaseField="mufmraw" IsReadOnly="true" ShowFieldLabel="false"  FieldLabelWidth="150px" FieldTextBoxWidth="40px" RenderReadOnlyAsDiv="true" ></def:datafieldcontrol></td>
<td align=center><def:datafieldcontrol runat="server" id="mufmts" DatabaseField="mufmts" IsReadOnly="true" ShowFieldLabel="false" FieldLabelWidth="100px" FieldTextBoxWidth="40px" RenderReadOnlyAsDiv="true" ></def:datafieldcontrol></td>
<td align=center><def:datafieldcontrol runat="server" id="mufmpctr" DatabaseField="mufmpctr" IsReadOnly="true" ShowFieldLabel="false" FieldLabelWidth="100px" FieldTextBoxWidth="40px" RenderReadOnlyAsDiv="true" ></def:datafieldcontrol></td>
<td align=center><def:datafieldcontrol runat="server" id="mufmdcat" DatabaseField="mufmdcat" IsReadOnly="true" ShowFieldLabel="false" FieldLabelWidth="100px" FieldTextBoxWidth="80px"  RenderReadOnlyAsDiv="true" FieldTextBoxMaxLength="50"></def:datafieldcontrol></td>
<td align=center><def:datafieldcontrol runat="server" id="mufmagee" DatabaseField="mufmagee" IsReadOnly="true" ShowFieldLabel="false" FieldLabelWidth="100px" FieldTextBoxWidth="40px" RenderReadOnlyAsDiv="true" ></def:datafieldcontrol></td>
</tr>
<tr>
<td height=30>Recept Lang</td>
<td align=center><def:datafieldcontrol runat="server" id="murlraw" DatabaseField="murlraw" IsReadOnly="true" ShowFieldLabel="false"  FieldLabelWidth="150px" FieldTextBoxWidth="40px" RenderReadOnlyAsDiv="true" ></def:datafieldcontrol></td>
<td align=center><def:datafieldcontrol runat="server" id="murlts" DatabaseField="murlts" IsReadOnly="true" ShowFieldLabel="false" FieldLabelWidth="100px" FieldTextBoxWidth="40px" RenderReadOnlyAsDiv="true" ></def:datafieldcontrol></td>
<td align=center><def:datafieldcontrol runat="server" id="murlpctr" DatabaseField="murlpctr" IsReadOnly="true" ShowFieldLabel="false" FieldLabelWidth="100px" FieldTextBoxWidth="40px" RenderReadOnlyAsDiv="true" ></def:datafieldcontrol></td>
<td align=center><def:datafieldcontrol runat="server" id="murldcat" DatabaseField="murldcat" IsReadOnly="true" ShowFieldLabel="false" FieldLabelWidth="100px" FieldTextBoxWidth="80px"  RenderReadOnlyAsDiv="true" FieldTextBoxMaxLength="50"></def:datafieldcontrol></td>
<td align=center><def:datafieldcontrol runat="server" id="murlagee" DatabaseField="murlagee" IsReadOnly="true" ShowFieldLabel="false" FieldLabelWidth="100px" FieldTextBoxWidth="40px" RenderReadOnlyAsDiv="true" ></def:datafieldcontrol></td>
<tr>
<td height=30>Expr Lang</td>
<td align=center><def:datafieldcontrol runat="server" id="muelraw" DatabaseField="muelraw" IsReadOnly="true" ShowFieldLabel="false"  FieldLabelWidth="150px" FieldTextBoxWidth="40px" RenderReadOnlyAsDiv="true" ></def:datafieldcontrol></td>
<td align=center><def:datafieldcontrol runat="server" id="muelts" DatabaseField="muelts" IsReadOnly="true" ShowFieldLabel="false" FieldLabelWidth="100px" FieldTextBoxWidth="40px" RenderReadOnlyAsDiv="true" ></def:datafieldcontrol></td>
<td align=center><def:datafieldcontrol runat="server" id="muelpctr" DatabaseField="muelpctr" IsReadOnly="true" ShowFieldLabel="false" FieldLabelWidth="100px" FieldTextBoxWidth="40px" RenderReadOnlyAsDiv="true" ></def:datafieldcontrol></td>
<td align=center><def:datafieldcontrol runat="server" id="mueldcat" DatabaseField="mueldcat" IsReadOnly="true" ShowFieldLabel="false" FieldLabelWidth="100px" FieldTextBoxWidth="80px"  RenderReadOnlyAsDiv="true" FieldTextBoxMaxLength="50"></def:datafieldcontrol></td>
<td align=center><def:datafieldcontrol runat="server" id="muelagee" DatabaseField="muelagee" IsReadOnly="true" ShowFieldLabel="false" FieldLabelWidth="100px" FieldTextBoxWidth="40px" RenderReadOnlyAsDiv="true" ></def:datafieldcontrol></td>
</tr></table>
</td>

<td>&nbsp;&nbsp;&nbsp;</td>
<td style="vertical-align:top">

<table border="1" cellspacing="0">
<tr>
<b>
<td height=55 valign="bottom" align=left><b><u>Subscale</u></b></td>
<td height=55 valign="bottom" align=center><b><u>Basal Item</u></b></td>
<td height=55 valign="bottom" align=center><b><u>Ceiling Item</u></b></td>
<td height=55 valign="bottom" align=center><b><u>Item list</u></b></td>
<td height=55 valign="bottom" align=center width="200px"><u><b>Raw score discrepancy</b> (Hand entered vs. calculated)</u></td>
</b> 
</tr>
<tr>
<td height=30>Gross Motor</td>
<td align=center><def:datafieldcontrol runat="server" id="GMbasal" DatabaseField="GMbasal" IsReadOnly="true" IsEntryField="false" ShowFieldLabel="false"  FieldLabelWidth="100px" FieldTextBoxWidth="40px" RenderReadOnlyAsDiv="true" ></def:datafieldcontrol></td>
<td align=center><def:datafieldcontrol runat="server" id="GMceil"  DatabaseField="GMceil"  IsReadOnly="true" IsEntryField="false" ShowFieldLabel="false"  FieldLabelWidth="100px" FieldTextBoxWidth="40px" RenderReadOnlyAsDiv="true" ></def:datafieldcontrol></td>
<td><def:datafieldcontrol runat="server" id="gm_itemstr" DatabaseField="gm_itemstr" IsReadOnly="true" ShowFieldLabel="false" FieldLabelWidth="300px" FieldTextBoxWidth="300px" FieldTextBoxMaxLength="50" RenderReadOnlyAsDiv="true" ></def:datafieldcontrol></td>
<td align=center><def:datafieldcontrol runat="server" id="rawdiff_gm" DatabaseField="rawdiff_gm" IsReadOnly="true" ShowFieldLabel="false" FieldLabelWidth="300px" FieldTextBoxWidth="300px" FieldTextBoxMaxLength="50" RenderReadOnlyAsDiv="true" ></def:datafieldcontrol></td>
</tr>
<tr>
<td height=30>Visual Reception</td>
<td align=center><def:datafieldcontrol runat="server" id="VRbasal" DatabaseField="VRbasal" IsReadOnly="true"  IsEntryField="false" ShowFieldLabel="false"  FieldLabelWidth="100px" FieldTextBoxWidth="40px" RenderReadOnlyAsDiv="true" ></def:datafieldcontrol></td>
<td align=center><def:datafieldcontrol runat="server" id="VRceil"  DatabaseField="VRceil"  IsReadOnly="true" IsEntryField="false" ShowFieldLabel="false"  FieldLabelWidth="100px" FieldTextBoxWidth="40px" RenderReadOnlyAsDiv="true" ></def:datafieldcontrol></td>
<td><def:datafieldcontrol runat="server" id="vr_itemstr" DatabaseField="vr_itemstr" IsReadOnly="true" ShowFieldLabel="false" FieldLabelWidth="300px" FieldTextBoxWidth="300px" FieldTextBoxMaxLength="50" RenderReadOnlyAsDiv="true" ></def:datafieldcontrol></td>
<td align=center><def:datafieldcontrol runat="server" id="rawdiff_vr" DatabaseField="rawdiff_vr" IsReadOnly="true" ShowFieldLabel="false" FieldLabelWidth="300px" FieldTextBoxWidth="300px" FieldTextBoxMaxLength="50" RenderReadOnlyAsDiv="true" ></def:datafieldcontrol></td>
</tr>
<tr>
<td height=30>Fine Motor</td>
<td align=center><def:datafieldcontrol runat="server" id="FMbasal" DatabaseField="FMbasal" IsReadOnly="true"  IsEntryField="false" ShowFieldLabel="false"  FieldLabelWidth="100px" FieldTextBoxWidth="40px" RenderReadOnlyAsDiv="true" ></def:datafieldcontrol></td>
<td align=center><def:datafieldcontrol runat="server" id="FMceil"  DatabaseField="FMceil"  IsReadOnly="true" IsEntryField="false" ShowFieldLabel="false"  FieldLabelWidth="100px" FieldTextBoxWidth="40px" RenderReadOnlyAsDiv="true" ></def:datafieldcontrol></td>
<td><def:datafieldcontrol runat="server" id="fm_itemstr" DatabaseField="fm_itemstr" IsReadOnly="true" ShowFieldLabel="false" FieldLabelWidth="300px" FieldTextBoxWidth="300px" FieldTextBoxMaxLength="50" RenderReadOnlyAsDiv="true" ></def:datafieldcontrol></td>
<td align=center><def:datafieldcontrol runat="server" id="rawdiff_fm" DatabaseField="rawdiff_fm" IsReadOnly="true" ShowFieldLabel="false" FieldLabelWidth="300px" FieldTextBoxWidth="300px" FieldTextBoxMaxLength="50" RenderReadOnlyAsDiv="true" ></def:datafieldcontrol></td>
</tr>
<tr>
<td height=30>Recept Lang</td>
<td align=center><def:datafieldcontrol runat="server" id="RLbasal" DatabaseField="RLbasal" IsReadOnly="true"  IsEntryField="false" ShowFieldLabel="false"  FieldLabelWidth="100px" FieldTextBoxWidth="40px" RenderReadOnlyAsDiv="true" ></def:datafieldcontrol></td>
<td align=center><def:datafieldcontrol runat="server" id="RLceil"  DatabaseField="RLceil"  IsReadOnly="true" IsEntryField="false" ShowFieldLabel="false"  FieldLabelWidth="100px" FieldTextBoxWidth="40px" RenderReadOnlyAsDiv="true" ></def:datafieldcontrol></td>
<td><def:datafieldcontrol runat="server" id="rl_itemstr" DatabaseField="rl_itemstr" IsReadOnly="true" ShowFieldLabel="false" FieldLabelWidth="300px" FieldTextBoxWidth="300px" FieldTextBoxMaxLength="50" RenderReadOnlyAsDiv="true" ></def:datafieldcontrol></td>
<td align=center><def:datafieldcontrol runat="server" id="rawdiff_rl" DatabaseField="rawdiff_rl" IsReadOnly="true" ShowFieldLabel="false" FieldLabelWidth="300px" FieldTextBoxWidth="300px" FieldTextBoxMaxLength="50" RenderReadOnlyAsDiv="true" ></def:datafieldcontrol></td>
</tr>
<tr>
<td height=30>Expr Lang</td>
<td align=center><def:datafieldcontrol runat="server" id="ELbasal" DatabaseField="ELbasal" IsReadOnly="true"  IsEntryField="false" ShowFieldLabel="false"  FieldLabelWidth="100px" FieldTextBoxWidth="40px" RenderReadOnlyAsDiv="true" ></def:datafieldcontrol></td>
<td align=center><def:datafieldcontrol runat="server" id="ELceil"  DatabaseField="ELceil" IsReadOnly="true"  IsEntryField="false"  ShowFieldLabel="false"  FieldLabelWidth="100px" FieldTextBoxWidth="40px" RenderReadOnlyAsDiv="true" ></def:datafieldcontrol></td>
<td><def:datafieldcontrol runat="server" id="el_itemstr" DatabaseField="el_itemstr" IsReadOnly="true" ShowFieldLabel="false" FieldLabelWidth="300px" FieldTextBoxWidth="300px" FieldTextBoxMaxLength="50" RenderReadOnlyAsDiv="true" ></def:datafieldcontrol></td>
<td align=center><def:datafieldcontrol runat="server" id="rawdiff_el" DatabaseField="rawdiff_el" IsReadOnly="true" ShowFieldLabel="false" FieldLabelWidth="300px" FieldTextBoxWidth="300px" FieldTextBoxMaxLength="50" RenderReadOnlyAsDiv="true" ></def:datafieldcontrol></td>

</tr>
</table>

</td>

</table>



    <br />
<table>
	<tr><td style="vertical-align:top"  style="width:550px">
    <def:datafieldcontrol runat="server" id="MUscoremsg" DatabaseField="MUscoremsg" IsReadOnly="true" ShowFieldLabel="true"  FieldLabelWidth="200px"  FieldTextBoxWidth="300px" RenderReadOnlyAsDiv="true" ></def:datafieldcontrol>
    <def:datafieldcontrol runat="server" id="MUbasalmsg" DatabaseField="MUbasalmsg" IsReadOnly="true" ShowFieldLabel="true"  FieldLabelWidth="200px"  FieldTextBoxWidth="300px" RenderReadOnlyAsDiv="true" ></def:datafieldcontrol>
	<def:datafieldcontrol runat="server" id="MUceilmsg" DatabaseField="MUceilmsg" IsReadOnly="true" ShowFieldLabel="true"  FieldLabelWidth="200px"  FieldTextBoxWidth="300px" RenderReadOnlyAsDiv="true" ></def:datafieldcontrol>
    </td>
    <td  style="width:50px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
    <td style="vertical-align:top"  style="width:600px">
        <asp:Panel ID="panel_key" runat="server" Width="600px">

    <asp:Label ID="Label1" runat="server" Text="Key for the Item list:" ForeColor="DarkBlue" Font-Bold="true" Font-Underline="true" Font-Size="Smaller"></asp:Label><br />
    <asp:Label ID="Label2" runat="server" Text="B = NULL item below basal given full credit" ForeColor="DarkBlue" Font-Size="Smaller"></asp:Label><br />
    <asp:Label ID="Label3" runat="server" Text="b = NULL item before entered items but no basal established, assumed as getting full credit" ForeColor="DarkBlue" Font-Size="Smaller"></asp:Label><br />
    <asp:Label ID="Label8" runat="server" Text="      OR entered item below the basal given full credit" ForeColor="DarkBlue" Font-Size="Smaller"></asp:Label><br />
    <asp:Label ID="Label4" runat="server" Text="# = a numeric value is the score achieved on an administered item" ForeColor="DarkBlue" Font-Size="Smaller"></asp:Label><br />
    <asp:Label ID="Label7" runat="server" Text="N = NULL item between basal and ceiling" ForeColor="DarkBlue" Font-Size="Smaller"></asp:Label><br />
    <asp:Label ID="Label5" runat="server" Text="C = NULL item above ceiling" ForeColor="DarkBlue" Font-Size="Smaller"></asp:Label><br />
    <asp:Label ID="Label6" runat="server" Text="X = item with entered value that is above the ceiling, no credit given" ForeColor="DarkBlue" Font-Size="Smaller"></asp:Label><br /><br />
        </asp:Panel>
    
    </td>
   
    </tr>
</table>

    </div>


<br/>


<div class="main">
<hr>
<br/>
<font color="Red">
<b>Begin Data Entry Here:</b>
<font color="Black">
<br/>


<b>Raw Scores</b> (Required.) <br/>
* Enter -999 for subscales not administered.<br/>
<table border="1" style="vertical-align:top" cellspacing="0">
<tr>

<td width="140px" align=center><b>_</b></td>
<td width="140px" align=center><b>Gross Motor</b></td>
<td width="140px" align=center><b>Visual Reception</b></td>
<td width="140px" align=center><b>Fine Motor</b></td>
<td width="140px" align=center><b>Receptive Lang Motor</b></td>
<td width="140px" align=center><b>Expressive Lang</b></td>

</tr>
<tr>
<td width="250px" align=center><b>Raw Score</b></td>
<td align=center><def:datafieldcontrol runat="server" id="mugmrawHE" DatabaseField="mugmrawHE" IsEntryField="true" IsEntryValueRequired="true" IsDoubleEntryField="true" ShowFieldLabel="false" FieldLabelWidth="210px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td align=center><def:datafieldcontrol runat="server" id="muvrrawHE" DatabaseField="muvrrawHE" IsEntryField="true"  IsEntryValueRequired="True" IsDoubleEntryField="true" ShowFieldLabel="false" FieldLabelWidth="210px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td align=center><def:datafieldcontrol runat="server" id="mufmrawHE" DatabaseField="mufmrawHE" IsEntryField="true"  IsEntryValueRequired="True" IsDoubleEntryField="true" ShowFieldLabel="false" FieldLabelWidth="210px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td align=center><def:datafieldcontrol runat="server" id="murlrawHE" DatabaseField="murlrawHE" IsEntryField="true"  IsEntryValueRequired="True" IsDoubleEntryField="true" ShowFieldLabel="false" FieldLabelWidth="210px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td align=center><def:datafieldcontrol runat="server" id="muelrawHE" DatabaseField="muelrawHE" IsEntryField="true"  IsEntryValueRequired="True" IsDoubleEntryField="true" ShowFieldLabel="false" FieldLabelWidth="210px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
</tr>
<tr>
<td width="250px" align=center><b>Use first entered item as basal</b> <br/> <i> (Enter 1 to override automatically calculated basal and use the first entered item instead.  Otherwise leave blank.)</i></td>
<td align=center><def:datafieldcontrol runat="server" id="gmbasal_manual" DatabaseField="gmbasal_manual" IsEntryField="true" IsEntryValueRequired="false" IsDoubleEntryField="true" ShowFieldLabel="false" FieldLabelWidth="210px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td align=center><def:datafieldcontrol runat="server" id="vrbasal_manual" DatabaseField="vrbasal_manual" IsEntryField="true"  IsEntryValueRequired="false" IsDoubleEntryField="true" ShowFieldLabel="false" FieldLabelWidth="210px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td align=center><def:datafieldcontrol runat="server" id="fmbasal_manual" DatabaseField="fmbasal_manual" IsEntryField="true"  IsEntryValueRequired="false" IsDoubleEntryField="true" ShowFieldLabel="false" FieldLabelWidth="210px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td align=center><def:datafieldcontrol runat="server" id="rlbasal_manual" DatabaseField="rlbasal_manual" IsEntryField="true"  IsEntryValueRequired="false" IsDoubleEntryField="true" ShowFieldLabel="false" FieldLabelWidth="210px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<td align=center><def:datafieldcontrol runat="server" id="elbasal_manual" DatabaseField="elbasal_manual" IsEntryField="true"  IsEntryValueRequired="false" IsDoubleEntryField="true" ShowFieldLabel="false" FieldLabelWidth="210px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
</tr>
<tr>
<td colspan="6">
<def:datafieldcontrol runat="server" id="scoremanual" DatabaseField="scoremanual" IsEntryField="true" IsEntryValueRequired="false" IsDoubleEntryField="true" ShowFieldLabel="true" FieldLabelWidth="250px" FieldTextBoxWidth="60px"></def:datafieldcontrol>
</td>
</tr>


</table>

<br/>
<def:datafieldcontrol runat="server" id="muvld" DatabaseField="muvld" IsEntryField="true" IsDoubleEntryField="true"  IsEntryValueRequired="True" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>

<def:datafieldcontrol runat="server" id="mucmts" DatabaseField="mucmts" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="300px" FieldTextBoxWidth="400px" FieldTextBoxHeight="40px" FieldTextBoxTextMode="multiline" FieldTextBoxMaxLength="400"></def:datafieldcontrol>

<br/>

<br/>
</div>


<div class="main">

<table>
<tr>
<td>
    <asp:Label ID="Label9" runat="server" Text="Items" Font-Bold="true" Font-Size="Smaller" ForeColor="Black"></asp:Label><br/>
    <asp:Label ID="Label10" runat="server" Text="* Enter only administered items."  Font-Size="Smaller" ForeColor="Black"></asp:Label><br/>
    <asp:Label ID="Label11" runat="server" Text="* Leave items below basal [3 consec items >= 1pt.] and above ceiling [3 consec. 0's] blank."  Font-Size="Smaller" ForeColor="Black"></asp:Label><br/>
<asp:Label ID="Label12" runat="server" Text="* Enter 9 for missing items between basal and ceiling."  Font-Size="Smaller" ForeColor="Black"></asp:Label><br/>
<asp:Label ID="Label13" runat="server" Text="* Values in parentheses reflect maximum points for the item."  Font-Size="Smaller" ForeColor="Black"></asp:Label><br/>
</td></tr>
</table>
<br/>

<table >
<tr>
<td style="vertical-align:top">
<table border="1" style="vertical-align:top" cellspacing="0">

<tr><td><b>Gross Motor</b></td></tr>
<tr><td><def:datafieldcontrol runat="server" id="mugm01" DatabaseField="mugm01" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="80px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td></tr>
<tr><td><def:datafieldcontrol runat="server" id="mugm02" DatabaseField="mugm02" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="80px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td></tr>
<tr><td><def:datafieldcontrol runat="server" id="mugm03" DatabaseField="mugm03" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="80px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td></tr>
<tr><td><def:datafieldcontrol runat="server" id="mugm04" DatabaseField="mugm04" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="80px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td></tr>
<tr><td><def:datafieldcontrol runat="server" id="mugm05" DatabaseField="mugm05" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="80px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td></tr>
<tr><td><def:datafieldcontrol runat="server" id="mugm06" DatabaseField="mugm06" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="80px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td></tr>
<tr><td><def:datafieldcontrol runat="server" id="mugm07" DatabaseField="mugm07" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="80px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td></tr>
<tr><td><def:datafieldcontrol runat="server" id="mugm08" DatabaseField="mugm08" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="80px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td></tr>
<tr><td><def:datafieldcontrol runat="server" id="mugm09" DatabaseField="mugm09" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="80px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td></tr>
<tr><td><def:datafieldcontrol runat="server" id="mugm10" DatabaseField="mugm10" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="80px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td></tr>
<tr><td><def:datafieldcontrol runat="server" id="mugm11" DatabaseField="mugm11" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="80px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td></tr>
<tr><td><def:datafieldcontrol runat="server" id="mugm12" DatabaseField="mugm12" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="80px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td></tr>
<tr><td><def:datafieldcontrol runat="server" id="mugm13" DatabaseField="mugm13" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="80px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td></tr>
<tr><td><def:datafieldcontrol runat="server" id="mugm14" DatabaseField="mugm14" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="80px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td></tr>
<tr><td><def:datafieldcontrol runat="server" id="mugm15" DatabaseField="mugm15" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="80px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td></tr>
<tr><td><def:datafieldcontrol runat="server" id="mugm16" DatabaseField="mugm16" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="80px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td></tr>
<tr><td><def:datafieldcontrol runat="server" id="mugm17" DatabaseField="mugm17" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="80px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td></tr>
<tr><td><def:datafieldcontrol runat="server" id="mugm18" DatabaseField="mugm18" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="80px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td></tr>
<tr><td><def:datafieldcontrol runat="server" id="mugm19" DatabaseField="mugm19" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="80px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td></tr>
<tr><td><def:datafieldcontrol runat="server" id="mugm20" DatabaseField="mugm20" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="80px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td></tr>
<tr><td><def:datafieldcontrol runat="server" id="mugm21" DatabaseField="mugm21" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="80px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td></tr>
<tr><td><def:datafieldcontrol runat="server" id="mugm22" DatabaseField="mugm22" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="80px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td></tr>
<tr><td><def:datafieldcontrol runat="server" id="mugm23" DatabaseField="mugm23" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="80px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td></tr>
<tr><td><def:datafieldcontrol runat="server" id="mugm24" DatabaseField="mugm24" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="80px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td></tr>
<tr><td><def:datafieldcontrol runat="server" id="mugm25" DatabaseField="mugm25" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="80px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td></tr>
<tr><td><def:datafieldcontrol runat="server" id="mugm26" DatabaseField="mugm26" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="80px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td></tr>
<tr><td><def:datafieldcontrol runat="server" id="mugm27" DatabaseField="mugm27" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="80px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td></tr>
<tr><td><def:datafieldcontrol runat="server" id="mugm28" DatabaseField="mugm28" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="80px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td></tr>
<tr><td><def:datafieldcontrol runat="server" id="mugm29" DatabaseField="mugm29" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="80px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td></tr>
<tr><td><def:datafieldcontrol runat="server" id="mugm30" DatabaseField="mugm30" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="80px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td></tr>
<tr><td><def:datafieldcontrol runat="server" id="mugm31" DatabaseField="mugm31" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="80px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td></tr>
<tr><td><def:datafieldcontrol runat="server" id="mugm32" DatabaseField="mugm32" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="80px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td></tr>
<tr><td><def:datafieldcontrol runat="server" id="mugm33" DatabaseField="mugm33" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="80px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td></tr>
<tr><td><def:datafieldcontrol runat="server" id="mugm34" DatabaseField="mugm34" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="80px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td></tr>
<tr><td><def:datafieldcontrol runat="server" id="mugm35" DatabaseField="mugm35" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="80px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td></tr>

    <tr><td><asp:Label runat="server" id="max1" Text="max = 36" ForeColor="Gray"></asp:Label></td></tr>

</table>
</td>

<td style="vertical-align:top">
<table border="1" style="vertical-align:top" cellspacing="0">
<tr><td><b>Visual Reception</b></td></tr>
<tr><td><def:datafieldcontrol runat="server" id="muvr01" DatabaseField="muvr01" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="80px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td></tr>
<tr><td><def:datafieldcontrol runat="server" id="muvr02" DatabaseField="muvr02" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="80px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td></tr>
<tr><td><def:datafieldcontrol runat="server" id="muvr03" DatabaseField="muvr03" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="80px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td></tr>
<tr><td><def:datafieldcontrol runat="server" id="muvr04" DatabaseField="muvr04" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="80px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td></tr>
<tr><td><def:datafieldcontrol runat="server" id="muvr05" DatabaseField="muvr05" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="80px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td></tr>
<tr><td><def:datafieldcontrol runat="server" id="muvr06" DatabaseField="muvr06" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="80px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td></tr>
<tr><td><def:datafieldcontrol runat="server" id="muvr07" DatabaseField="muvr07" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="80px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td></tr>
<tr><td><def:datafieldcontrol runat="server" id="muvr08" DatabaseField="muvr08" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="80px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td></tr>
<tr><td><def:datafieldcontrol runat="server" id="muvr09" DatabaseField="muvr09" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="80px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td></tr>
<tr><td><def:datafieldcontrol runat="server" id="muvr10" DatabaseField="muvr10" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="80px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td></tr>
<tr><td><def:datafieldcontrol runat="server" id="muvr11" DatabaseField="muvr11" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="80px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td></tr>
<tr><td><def:datafieldcontrol runat="server" id="muvr12" DatabaseField="muvr12" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="80px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td></tr>
<tr><td><def:datafieldcontrol runat="server" id="muvr13" DatabaseField="muvr13" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="80px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td></tr>
<tr><td><def:datafieldcontrol runat="server" id="muvr14" DatabaseField="muvr14" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="80px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td></tr>
<tr><td><def:datafieldcontrol runat="server" id="muvr15" DatabaseField="muvr15" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="80px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td></tr>
<tr><td><def:datafieldcontrol runat="server" id="muvr16" DatabaseField="muvr16" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="80px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td></tr>
<tr><td><def:datafieldcontrol runat="server" id="muvr17" DatabaseField="muvr17" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="80px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td></tr>
<tr><td><def:datafieldcontrol runat="server" id="muvr18" DatabaseField="muvr18" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="80px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td></tr>
<tr><td><def:datafieldcontrol runat="server" id="muvr19" DatabaseField="muvr19" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="80px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td></tr>
<tr><td><def:datafieldcontrol runat="server" id="muvr20" DatabaseField="muvr20" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="80px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td></tr>
<tr><td><def:datafieldcontrol runat="server" id="muvr21" DatabaseField="muvr21" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="80px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td></tr>
<tr><td><def:datafieldcontrol runat="server" id="muvr22" DatabaseField="muvr22" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="80px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td></tr>
<tr><td><def:datafieldcontrol runat="server" id="muvr23" DatabaseField="muvr23" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="80px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td></tr>
<tr><td><def:datafieldcontrol runat="server" id="muvr24" DatabaseField="muvr24" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="80px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td></tr>
<tr><td><def:datafieldcontrol runat="server" id="muvr25" DatabaseField="muvr25" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="80px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td></tr>
<tr><td><def:datafieldcontrol runat="server" id="muvr26" DatabaseField="muvr26" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="80px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td></tr>
<tr><td><def:datafieldcontrol runat="server" id="muvr27" DatabaseField="muvr27" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="80px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td></tr>
<tr><td><def:datafieldcontrol runat="server" id="muvr28" DatabaseField="muvr28" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="80px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td></tr>
<tr><td><def:datafieldcontrol runat="server" id="muvr29" DatabaseField="muvr29" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="80px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td></tr>
<tr><td><def:datafieldcontrol runat="server" id="muvr30" DatabaseField="muvr30" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="80px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td></tr>
<tr><td><def:datafieldcontrol runat="server" id="muvr31" DatabaseField="muvr31" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="80px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td></tr>
<tr><td><def:datafieldcontrol runat="server" id="muvr32" DatabaseField="muvr32" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="80px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td></tr>
<tr><td><def:datafieldcontrol runat="server" id="muvr33" DatabaseField="muvr33" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="80px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td></tr>

    <tr><td><asp:Label runat="server" id="Label14" Text="max = 50" ForeColor="Gray"></asp:Label></td></tr>

</table>
</td>

<td style="vertical-align:top">
<table border="1" style="vertical-align:top" cellspacing="0">
<tr><td><b>Fine Motor</b></td></tr>

<tr><td><def:datafieldcontrol runat="server" id="mufm01" DatabaseField="mufm01" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="80px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td></tr>
<tr><td><def:datafieldcontrol runat="server" id="mufm02" DatabaseField="mufm02" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="80px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td></tr>
<tr><td><def:datafieldcontrol runat="server" id="mufm03" DatabaseField="mufm03" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="80px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td></tr>
<tr><td><def:datafieldcontrol runat="server" id="mufm04" DatabaseField="mufm04" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="80px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td></tr>
<tr><td><def:datafieldcontrol runat="server" id="mufm05" DatabaseField="mufm05" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="80px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td></tr>
<tr><td><def:datafieldcontrol runat="server" id="mufm06" DatabaseField="mufm06" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="80px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td></tr>
<tr><td><def:datafieldcontrol runat="server" id="mufm07" DatabaseField="mufm07" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="80px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td></tr>
<tr><td><def:datafieldcontrol runat="server" id="mufm08" DatabaseField="mufm08" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="80px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td></tr>
<tr><td><def:datafieldcontrol runat="server" id="mufm09" DatabaseField="mufm09" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="80px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td></tr>
<tr><td><def:datafieldcontrol runat="server" id="mufm10" DatabaseField="mufm10" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="80px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td></tr>
<tr><td><def:datafieldcontrol runat="server" id="mufm11" DatabaseField="mufm11" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="80px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td></tr>
<tr><td><def:datafieldcontrol runat="server" id="mufm12" DatabaseField="mufm12" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="80px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td></tr>
<tr><td><def:datafieldcontrol runat="server" id="mufm13" DatabaseField="mufm13" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="80px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td></tr>
<tr><td><def:datafieldcontrol runat="server" id="mufm14" DatabaseField="mufm14" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="80px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td></tr>
<tr><td><def:datafieldcontrol runat="server" id="mufm15" DatabaseField="mufm15" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="80px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td></tr>
<tr><td><def:datafieldcontrol runat="server" id="mufm16" DatabaseField="mufm16" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="80px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td></tr>
<tr><td><def:datafieldcontrol runat="server" id="mufm17" DatabaseField="mufm17" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="80px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td></tr>
<tr><td><def:datafieldcontrol runat="server" id="mufm18" DatabaseField="mufm18" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="80px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td></tr>
<tr><td><def:datafieldcontrol runat="server" id="mufm19" DatabaseField="mufm19" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="80px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td></tr>
<tr><td><def:datafieldcontrol runat="server" id="mufm20" DatabaseField="mufm20" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="80px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td></tr>
<tr><td><def:datafieldcontrol runat="server" id="mufm21" DatabaseField="mufm21" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="80px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td></tr>
<tr><td><def:datafieldcontrol runat="server" id="mufm22" DatabaseField="mufm22" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="80px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td></tr>
<tr><td><def:datafieldcontrol runat="server" id="mufm23" DatabaseField="mufm23" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="80px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td></tr>
<tr><td><def:datafieldcontrol runat="server" id="mufm24" DatabaseField="mufm24" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="80px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td></tr>
<tr><td><def:datafieldcontrol runat="server" id="mufm25" DatabaseField="mufm25" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="80px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td></tr>
<tr><td><def:datafieldcontrol runat="server" id="mufm26" DatabaseField="mufm26" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="80px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td></tr>
<tr><td><def:datafieldcontrol runat="server" id="mufm27" DatabaseField="mufm27" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="80px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td></tr>
<tr><td><def:datafieldcontrol runat="server" id="mufm28" DatabaseField="mufm28" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="80px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td></tr>
<tr><td><def:datafieldcontrol runat="server" id="mufm29" DatabaseField="mufm29" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="80px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td></tr>
<tr><td><def:datafieldcontrol runat="server" id="mufm30" DatabaseField="mufm30" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="80px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td></tr>

    <tr><td><asp:Label runat="server" id="Label15" Text="max = 49" ForeColor="Gray"></asp:Label></td></tr>

</table>
</td>

<td style="vertical-align:top">
<table border="1" style="vertical-align:top" cellspacing="0">
<tr><td><b>Receptive Lang</b></td></tr>

<tr><td><def:datafieldcontrol runat="server" id="murl01" DatabaseField="murl01" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="80px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td></tr>
<tr><td><def:datafieldcontrol runat="server" id="murl02" DatabaseField="murl02" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="80px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td></tr>
<tr><td><def:datafieldcontrol runat="server" id="murl03" DatabaseField="murl03" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="80px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td></tr>
<tr><td><def:datafieldcontrol runat="server" id="murl04" DatabaseField="murl04" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="80px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td></tr>
<tr><td><def:datafieldcontrol runat="server" id="murl05" DatabaseField="murl05" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="80px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td></tr>
<tr><td><def:datafieldcontrol runat="server" id="murl06" DatabaseField="murl06" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="80px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td></tr>
<tr><td><def:datafieldcontrol runat="server" id="murl07" DatabaseField="murl07" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="80px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td></tr>
<tr><td><def:datafieldcontrol runat="server" id="murl08" DatabaseField="murl08" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="80px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td></tr>
<tr><td><def:datafieldcontrol runat="server" id="murl09" DatabaseField="murl09" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="80px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td></tr>
<tr><td><def:datafieldcontrol runat="server" id="murl10" DatabaseField="murl10" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="80px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td></tr>
<tr><td><def:datafieldcontrol runat="server" id="murl11" DatabaseField="murl11" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="80px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td></tr>
<tr><td><def:datafieldcontrol runat="server" id="murl12" DatabaseField="murl12" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="80px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td></tr>
<tr><td><def:datafieldcontrol runat="server" id="murl13" DatabaseField="murl13" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="80px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td></tr>
<tr><td><def:datafieldcontrol runat="server" id="murl14" DatabaseField="murl14" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="80px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td></tr>
<tr><td><def:datafieldcontrol runat="server" id="murl15" DatabaseField="murl15" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="80px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td></tr>
<tr><td><def:datafieldcontrol runat="server" id="murl16" DatabaseField="murl16" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="80px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td></tr>
<tr><td><def:datafieldcontrol runat="server" id="murl17" DatabaseField="murl17" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="80px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td></tr>
<tr><td><def:datafieldcontrol runat="server" id="murl18" DatabaseField="murl18" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="80px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td></tr>
<tr><td><def:datafieldcontrol runat="server" id="murl19" DatabaseField="murl19" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="80px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td></tr>
<tr><td><def:datafieldcontrol runat="server" id="murl20" DatabaseField="murl20" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="80px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td></tr>
<tr><td><def:datafieldcontrol runat="server" id="murl21" DatabaseField="murl21" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="80px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td></tr>
<tr><td><def:datafieldcontrol runat="server" id="murl22" DatabaseField="murl22" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="80px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td></tr>
<tr><td><def:datafieldcontrol runat="server" id="murl23" DatabaseField="murl23" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="80px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td></tr>
<tr><td><def:datafieldcontrol runat="server" id="murl24" DatabaseField="murl24" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="80px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td></tr>
<tr><td><def:datafieldcontrol runat="server" id="murl25" DatabaseField="murl25" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="80px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td></tr>
<tr><td><def:datafieldcontrol runat="server" id="murl26" DatabaseField="murl26" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="80px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td></tr>
<tr><td><def:datafieldcontrol runat="server" id="murl27" DatabaseField="murl27" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="80px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td></tr>
<tr><td><def:datafieldcontrol runat="server" id="murl28" DatabaseField="murl28" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="80px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td></tr>
<tr><td><def:datafieldcontrol runat="server" id="murl29" DatabaseField="murl29" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="80px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td></tr>
<tr><td><def:datafieldcontrol runat="server" id="murl30" DatabaseField="murl30" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="80px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td></tr>
<tr><td><def:datafieldcontrol runat="server" id="murl31" DatabaseField="murl31" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="80px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td></tr>
<tr><td><def:datafieldcontrol runat="server" id="murl32" DatabaseField="murl32" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="80px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td></tr>
<tr><td><def:datafieldcontrol runat="server" id="murl33" DatabaseField="murl33" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="80px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td></tr>

    <tr><td><asp:Label runat="server" id="Label16" Text="max = 48" ForeColor="Gray"></asp:Label></td></tr>

</table>
</td>

<td style="vertical-align:top">
<table border="1" style="vertical-align:top" cellspacing="0">
<tr><td><b>Expressive Lang</b></td></tr>

<tr><td><def:datafieldcontrol runat="server" id="muel01" DatabaseField="muel01" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="80px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td></tr>
<tr><td><def:datafieldcontrol runat="server" id="muel02" DatabaseField="muel02" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="80px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td></tr>
<tr><td><def:datafieldcontrol runat="server" id="muel03" DatabaseField="muel03" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="80px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td></tr>
<tr><td><def:datafieldcontrol runat="server" id="muel04" DatabaseField="muel04" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="80px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td></tr>
<tr><td><def:datafieldcontrol runat="server" id="muel05" DatabaseField="muel05" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="80px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td></tr>
<tr><td><def:datafieldcontrol runat="server" id="muel06" DatabaseField="muel06" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="80px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td></tr>
<tr><td><def:datafieldcontrol runat="server" id="muel07" DatabaseField="muel07" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="80px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td></tr>
<tr><td><def:datafieldcontrol runat="server" id="muel08" DatabaseField="muel08" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="80px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td></tr>
<tr><td><def:datafieldcontrol runat="server" id="muel09" DatabaseField="muel09" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="80px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td></tr>
<tr><td><def:datafieldcontrol runat="server" id="muel10" DatabaseField="muel10" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="80px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td></tr>
<tr><td><def:datafieldcontrol runat="server" id="muel11" DatabaseField="muel11" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="80px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td></tr>
<tr><td><def:datafieldcontrol runat="server" id="muel12" DatabaseField="muel12" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="80px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td></tr>
<tr><td><def:datafieldcontrol runat="server" id="muel13" DatabaseField="muel13" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="80px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td></tr>
<tr><td><def:datafieldcontrol runat="server" id="muel14" DatabaseField="muel14" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="80px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td></tr>
<tr><td><def:datafieldcontrol runat="server" id="muel15" DatabaseField="muel15" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="80px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td></tr>
<tr><td><def:datafieldcontrol runat="server" id="muel16" DatabaseField="muel16" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="80px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td></tr>
<tr><td><def:datafieldcontrol runat="server" id="muel17" DatabaseField="muel17" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="80px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td></tr>
<tr><td><def:datafieldcontrol runat="server" id="muel18" DatabaseField="muel18" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="80px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td></tr>
<tr><td><def:datafieldcontrol runat="server" id="muel19" DatabaseField="muel19" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="80px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td></tr>
<tr><td><def:datafieldcontrol runat="server" id="muel20" DatabaseField="muel20" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="80px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td></tr>
<tr><td><def:datafieldcontrol runat="server" id="muel21" DatabaseField="muel21" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="80px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td></tr>
<tr><td><def:datafieldcontrol runat="server" id="muel22" DatabaseField="muel22" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="80px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td></tr>
<tr><td><def:datafieldcontrol runat="server" id="muel23" DatabaseField="muel23" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="80px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td></tr>
<tr><td><def:datafieldcontrol runat="server" id="muel24" DatabaseField="muel24" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="80px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td></tr>
<tr><td><def:datafieldcontrol runat="server" id="muel25" DatabaseField="muel25" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="80px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td></tr>
<tr><td><def:datafieldcontrol runat="server" id="muel26" DatabaseField="muel26" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="80px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td></tr>
<tr><td><def:datafieldcontrol runat="server" id="muel27" DatabaseField="muel27" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="80px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td></tr>
<tr><td><def:datafieldcontrol runat="server" id="muel28" DatabaseField="muel28" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="80px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td></tr>

    <tr><td><asp:Label runat="server" id="Label17" Text="max = 50" ForeColor="Gray"></asp:Label></td></tr>

</table>
</td>
</tr>

</table>

<br/>
<br/>


</div>






<div class="main">

<def:datafieldcontrol runat="server" id="created" DatabaseField="created" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="300px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="createdby" DatabaseField="createdby" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="300px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="50"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="updated" DatabaseField="updated" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="300px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="updatedby" DatabaseField="updatedby" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="300px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="50"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="scored" DatabaseField="scored" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="300px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="scoredBy" DatabaseField="scoredBy" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="300px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="50"></def:datafieldcontrol>

</div>
</asp:panel>
</asp:Content>
