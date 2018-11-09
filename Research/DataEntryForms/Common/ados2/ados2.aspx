<%@ Register TagPrefix="def" Namespace="DataEntryFramework3" %> 
<%@ Page language="c#" MasterPageFile="~/UWAC.master"  Title="ados2 Data Entry" 
CodeFile="ados2.aspx.cs" Inherits="DataEntryForms_Common_ados2_ados2" Debug="true"%>
<asp:Content ID="Content1" ContentPlaceHolderID="oBodyPlaceHolder" runat="server">

<def:dataentrycontroller id="DataEntryController1" runat="server" DatabaseTable="all_ados2" PrimaryKeyField="ados2_pk" >
</def:dataentrycontroller>

    <table><tr>
        <td width="450px">

<def:datafieldcontrol runat="server" id="id" DatabaseField="id" IsInsertField="true" FieldLabelWidth="300px" FieldTextBoxWidth="125px" FieldTextBoxMaxLength="15"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="indexnum" DatabaseField="indexnum" IsInsertField="true" FieldTextBoxTextDefault="1" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="ados2_mod" DatabaseField="ados2_mod" IsInsertField="false"  IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="ados2_date" DatabaseField="ados2_date" IsInsertField="false" IsEntryField="true"  IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="125px"  FormatString="{0:d}" fieldDataType="DATE"> </def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="ados2_clin" DatabaseField="ados2_clin" IsInsertField="false" IsEntryField="true"  IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="125px" FieldTextBoxMaxLength="20"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="ados_coder" DatabaseField="ados2_coder" IsInsertField="false" IsEntryField="true"  IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="125px" FieldTextBoxMaxLength="20"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="ados2_agemos" DatabaseField="ados2_agemos" IsEntryField="false" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>

<def:datafieldcontrol runat="server" id="ados2_vld" DatabaseField="ados2_vld" IsInsertField="false" IsEntryField="true"  IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="125px"  FormatString="{0:d}" fieldDataType="DATE"> </def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="ados2_cmnt" DatabaseField="ados2_cmnt" IsInsertField="false" IsEntryField="true"  IsDoubleEntryField="false" FieldTextBoxTextMode="Multiline" FieldLabelWidth="300px" FieldTextBoxWidth="300px"  FieldTextBoxHeight="80px" FieldTextBoxMaxLength="500"></def:datafieldcontrol>

</td>
                    <td width="450px"> 
    <asp:Label ID="l1" runat="server" Text="Leave blank if not a reliability measure." Font-Italic="true" ForeColor="Navy" ></asp:Label><br />
<def:datafieldcontrol runat="server" id="ados2_relcoder" DatabaseField="ados2_relcoder" IsInsertField="false" IsEntryField="true"  IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="125px" FieldTextBoxMaxLength="20"></def:datafieldcontrol>

<def:datafieldcontrol runat="server" id="ados2_reldate" DatabaseField="ados2_reldate" IsInsertField="false" IsEntryField="true"  IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="125px" FormatString="{0:d}" fieldDataType="DATE" FieldTextBoxMaxLength="20"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="ados2_rellocation" DatabaseField="ados2_rellocation" IsInsertField="false" IsEntryField="true"  IsDoubleEntryField="true" FieldLabelWidth="350px" FieldTextBoxWidth="75px" ></def:datafieldcontrol>

                    </td></tr></table>

 <br/>
 <br/>

<asp:Panel id="mainPanel" CssClass="mainPanel" runat="server">
<div class="main">

<asp:Panel ID="scores"  runat="server" Visible= "false">
<h3>ADOS2 Scoring Summary</h3>
<def:datafieldcontrol runat="server" id="ados2_algvers" DatabaseField="ados2_algvers" IsEntryField="false" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="400px" FieldTextBoxWidth="250px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="ados2_sa" DatabaseField="ados2_sa" IsEntryField="false" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="400px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="ados2_rrb" DatabaseField="ados2_rrb" IsEntryField="false" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="400px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="ados2_tot" DatabaseField="ados2_tot" IsEntryField="false" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="400px" FieldTextBoxWidth="40px"></def:datafieldcontrol>

<asp:Panel  runat="server" ID="scores_T"   Visible= "false" >
<def:datafieldcontrol runat="server" id="ados2_concern" DatabaseField="ados2_concern" IsEntryField="false" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
</asp:Panel>

<asp:Panel  runat="server"  ID="scores_123"    Visible= "false">
<def:datafieldcontrol runat="server" id="ados2_class" DatabaseField="ados2_class" IsEntryField="false" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="400px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<br />
<def:datafieldcontrol runat="server" id="ados2_compar" DatabaseField="ados2_compar" IsEntryField="false" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="550px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="ados2_compar_lev" DatabaseField="ados2_compar_lev" IsEntryField="false" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="550px" FieldTextBoxWidth="100px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="ados2_sa_css" DatabaseField="ados2_sa_css" IsEntryField="false" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="550px" FieldTextBoxWidth="100px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="ados2_rrb_css" DatabaseField="ados2_rrb_css" IsEntryField="false" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="550px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
</asp:Panel>

<br/>
<asp:Panel id="scrmsg_panel" runat="server">
<def:datafieldcontrol runat="server" id="ados2_scrmsg" DatabaseField="ados2_scrmsg" IsEntryField="false" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="300px" FieldTextBoxWidth="400px" ></def:datafieldcontrol>
</asp:Panel>

</asp:Panel>

<br/>
<br/>


<asp:Panel  runat="server" ID="items_T" >
<h3>Toddler items</h3>

<Table>
<tr><td>
<b>Items</b>
<def:datafieldcontrol runat="server" id="adosta01" DatabaseField="adosta01" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
</td></tr>

<tr>
<td><def:datafieldcontrol runat="server" id="adosta01a" DatabaseField="adosta01a" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
<!--<td>
    <table>
    <td><def:datafieldcontrol runat="server" id="adosta01bp" DatabaseField="adosta01bp" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="30px" FieldTextBoxWidth="20px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="adosta01dt" DatabaseField="adosta01dt" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="30px" FieldTextBoxWidth="20px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="adosta01gk" DatabaseField="adosta01gk" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="30px" FieldTextBoxWidth="20px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="adosta01l" DatabaseField="adosta01l" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="20px" FieldTextBoxWidth="20px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="adosta01m" DatabaseField="adosta01m" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="20px" FieldTextBoxWidth="20px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="adosta01n" DatabaseField="adosta01n" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="20px" FieldTextBoxWidth="20px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="adosta01s" DatabaseField="adosta01s" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="20px" FieldTextBoxWidth="20px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="adosta01sh" DatabaseField="adosta01sh" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="30px" FieldTextBoxWidth="20px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="adosta01w" DatabaseField="adosta01w" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="20px" FieldTextBoxWidth="20px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="adosta01y" DatabaseField="adosta01y" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="20px" FieldTextBoxWidth="20px"></def:datafieldcontrol></td>
    </table>
</td>
</tr>
-->
<tr> <td>
<def:datafieldcontrol runat="server" id="adosta02" DatabaseField="adosta02" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="adosta03" DatabaseField="adosta03" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="adosta04" DatabaseField="adosta04" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="adosta05" DatabaseField="adosta05" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="adosta06_2" DatabaseField="adosta06_2" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="adosta07" DatabaseField="adosta07" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="adosta08" DatabaseField="adosta08" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="adosta09" DatabaseField="adosta09" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<br/>
<def:datafieldcontrol runat="server" id="adostb01" DatabaseField="adostb01" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="adostb02" DatabaseField="adostb02" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="adostb03" DatabaseField="adostb03" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="adostb04" DatabaseField="adostb04" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="adostb05" DatabaseField="adostb05" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="adostb06" DatabaseField="adostb06" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="adostb07" DatabaseField="adostb07" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="adostb08" DatabaseField="adostb08" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="adostb09" DatabaseField="adostb09" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="adostb10" DatabaseField="adostb10" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="adostb11" DatabaseField="adostb11" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="adostb12" DatabaseField="adostb12" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="adostb13" DatabaseField="adostb13" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="adostb14" DatabaseField="adostb14" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="adostb15" DatabaseField="adostb15" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="adostb16a" DatabaseField="adostb16a" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="adostb16b" DatabaseField="adostb16b" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="adostb17" DatabaseField="adostb17" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="adostb18" DatabaseField="adostb18" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<br/>
<def:datafieldcontrol runat="server" id="adostc01" DatabaseField="adostc01" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="adostc02" DatabaseField="adostc02" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="adostc03" DatabaseField="adostc03" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
</td></tr>
<br/><br/>
<tr><td><def:datafieldcontrol runat="server" id="adostd01" DatabaseField="adostd01" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
    <td><def:datafieldcontrol runat="server" id="adostd01a" DatabaseField="adostd01a" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="300px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="100"></def:datafieldcontrol>
    </td></tr>
<tr><td>  <def:datafieldcontrol runat="server" id="adostd02" DatabaseField="adostd02" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
</td><td> <def:datafieldcontrol runat="server" id="adostd02a" DatabaseField="adostd02a" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="300px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="100"></def:datafieldcontrol>
</td></tr>
<tr><td>  <def:datafieldcontrol runat="server" id="adostd03" DatabaseField="adostd03" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
</td><td> <def:datafieldcontrol runat="server" id="adostd03a" DatabaseField="adostd03a" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="300px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="100"></def:datafieldcontrol>
</td></tr>
<tr><td><def:datafieldcontrol runat="server" id="adostd04" DatabaseField="adostd04" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
</td></tr>
<tr><td>  <def:datafieldcontrol runat="server" id="adostd05" DatabaseField="adostd05" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
</td><td> <def:datafieldcontrol runat="server" id="adostd05a" DatabaseField="adostd05a" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="300px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="100"></def:datafieldcontrol>
</td></tr>
<br/><br/>
<def:datafieldcontrol runat="server" id="adoste01" DatabaseField="adoste01" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="adoste02_2" DatabaseField="adoste02_2" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="adoste03" DatabaseField="adoste03" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="adoste04" DatabaseField="adoste04" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
</td>
</tr>
</Table>

<!--
<Table>
<tr><td>
<b>Observations</b>
<def:datafieldcontrol runat="server" id="observation_t_1"  DatabaseField="observation_t_1" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="300px" FieldTextBoxWidth="400px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="observation_t_1_1"  DatabaseField="observation_t_1_1" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="300px" FieldTextBoxWidth="400px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="observation_t_1a"  DatabaseField="observation_t_1a" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="300px" FieldTextBoxWidth="400px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="observation_t_2"  DatabaseField="observation_t_2" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="300px" FieldTextBoxWidth="400px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="observation_t_3"  DatabaseField="observation_t_3" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="300px" FieldTextBoxWidth="400px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="observation_t_4"  DatabaseField="observation_t_4" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="300px" FieldTextBoxWidth="400px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="observation_t_4a"  DatabaseField="observation_t_4a" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="300px" FieldTextBoxWidth="400px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="observation_t_5"  DatabaseField="observation_t_5" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="300px" FieldTextBoxWidth="400px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="observation_t_5a"  DatabaseField="observation_t_5a" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="300px" FieldTextBoxWidth="400px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="observation_t_6"  DatabaseField="observation_t_6" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="300px" FieldTextBoxWidth="400px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="observation_t_7"  DatabaseField="observation_t_7" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="300px" FieldTextBoxWidth="400px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="observation_t_8"  DatabaseField="observation_t_8" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="300px" FieldTextBoxWidth="400px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="observation_t_9"  DatabaseField="observation_t_9" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="300px" FieldTextBoxWidth="400px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="observation_t_9a"  DatabaseField="observation_t_9a" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="300px" FieldTextBoxWidth="400px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="observation_t_9a_1"  DatabaseField="observation_t_9a_1" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="observation_t_10"  DatabaseField="observation_t_10" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="300px" FieldTextBoxWidth="400px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="observation_t_11"  DatabaseField="observation_t_11" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="300px" FieldTextBoxWidth="400px"></def:datafieldcontrol>

</td></tr>
</Table>
-->

</asp:Panel>


<asp:Panel   runat="server"  ID="items_1">
<h3>Module 1 items</h3>

<table>
<tr><td>
<b>Coding</b>
<def:datafieldcontrol runat="server" id="codinga2_olang_a"  DatabaseField="codinga2_olang_a" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="codinga_fvoc_a"  DatabaseField="codinga_fvoc_a" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="codinga_inton_a"  DatabaseField="codinga_inton_a" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="codinga_iecho_a"  DatabaseField="codinga_iecho_a" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="codinga_stereo_a"  DatabaseField="codinga_stereo_a" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="codinga_uaothr_a"  DatabaseField="codinga_uaothr_a" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="codinga_point_a"  DatabaseField="codinga_point_a" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="codinga_gest_a"  DatabaseField="codinga_gest_a" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="codingb_ueye_a"  DatabaseField="codingb_ueye_a" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="codingb_ssmle_a"  DatabaseField="codingb_ssmle_a" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="codingb_faceo_a"  DatabaseField="codingb_faceo_a" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="codingb_gzsov_a"  DatabaseField="codingb_gzsov_a" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="codingb_shrnj_a"  DatabaseField="codingb_shrnj_a" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="codingb_rname_a"  DatabaseField="codingb_rname_a" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="codingb_req_a"  DatabaseField="codingb_req_a" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="codingb_give_a"  DatabaseField="codingb_give_a" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="codingb_show_a"  DatabaseField="codingb_show_a" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="codingb_sijnt_a"  DatabaseField="codingb_sijnt_a" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="codingb_rjnt_a"  DatabaseField="codingb_rjnt_a" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="codingb_qsov_a"  DatabaseField="codingb_qsov_a" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="codingb_asove_a"  DatabaseField="codingb_asove_a" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="codingb_asovp_a"  DatabaseField="codingb_asovp_a" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="codingb_qsres_a"  DatabaseField="codingb_qsres_a" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="codingb_leng_a"  DatabaseField="codingb_leng_a" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="codingb_oqrap_a"  DatabaseField="codingb_oqrap_a" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="codingc_fplay_a"  DatabaseField="codingc_fplay_a" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="codingc_imgcr_a"  DatabaseField="codingc_imgcr_a" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
</td></tr>
<tr><td>  <def:datafieldcontrol runat="server" id="codingd_usens_a"  DatabaseField="codingd_usens_a" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
</td><td> <def:datafieldcontrol runat="server" id="codingd_usens_a_cmt"  DatabaseField="codingd_usens_a_cmt" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="300px" FieldTextBoxWidth="250px"></def:datafieldcontrol>
</td></tr>
<tr><td>  <def:datafieldcontrol runat="server" id="codingd_oman_a"  DatabaseField="codingd_oman_a" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
</td><td> <def:datafieldcontrol runat="server" id="codingd_oman_a_cmt"  DatabaseField="codingd_oman_a_cmt" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="300px" FieldTextBoxWidth="250px"></def:datafieldcontrol>
</td></tr>
<tr><td>  
<def:datafieldcontrol runat="server" id="codingd_selfinj_a"  DatabaseField="codingd_selfinj_a" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
</td></tr>
<tr><td>  <def:datafieldcontrol runat="server" id="codingd_urbeh_a"  DatabaseField="codingd_urbeh_a" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
</td><td> <def:datafieldcontrol runat="server" id="codingd_urbeh_a_cmt"  DatabaseField="codingd_urbeh_a_cmt" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="300px" FieldTextBoxWidth="250px"></def:datafieldcontrol>
</td></tr>
<tr><td>
<def:datafieldcontrol runat="server" id="codinge_actve_a"  DatabaseField="codinge_actve_a" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="codinge_agg_a"  DatabaseField="codinge_agg_a" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="codinge_anxty_a"  DatabaseField="codinge_anxty_a" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
</td></tr>
</table>

<!--
<table>
<tr><td>
<b>Observations</b>
<def:datafieldcontrol runat="server" id="observation_a_1"  DatabaseField="observation_a_1" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="300px" FieldTextBoxWidth="400px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="observation_a_1_1"  DatabaseField="observation_a_1_1" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="300px" FieldTextBoxWidth="400px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="observation_a_2"  DatabaseField="observation_a_2" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="300px" FieldTextBoxWidth="400px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="observation_a_3"  DatabaseField="observation_a_3" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="300px" FieldTextBoxWidth="400px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="observation_a_4"  DatabaseField="observation_a_4" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="300px" FieldTextBoxWidth="400px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="observation_a_5"  DatabaseField="observation_a_5" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="300px" FieldTextBoxWidth="400px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="observation_a_6"  DatabaseField="observation_a_6" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="300px" FieldTextBoxWidth="400px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="observation_a_7"  DatabaseField="observation_a_7" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="300px" FieldTextBoxWidth="400px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="observation_a_8"  DatabaseField="observation_a_8" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="300px" FieldTextBoxWidth="400px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="observation_a_9"  DatabaseField="observation_a_9" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="300px" FieldTextBoxWidth="400px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="observation_a_10"  DatabaseField="observation_a_10" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="300px" FieldTextBoxWidth="400px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="observation_comments"  DatabaseField="observation_comments" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="300px" FieldTextBoxWidth="400px"></def:datafieldcontrol>
</td></tr>
</table>
</asp:Panel>
-->

<asp:Panel   runat="server"  ID="items_2" >
<h3>Module 2 items</h3>

<table>
<tr><td>
<b>Coding</b>
<def:datafieldcontrol runat="server" id="codinga2_olang_b"  DatabaseField="codinga2_olang_b" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="codinga_spabn_b"  DatabaseField="codinga_spabn_b" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="codinga_iecho_b"  DatabaseField="codinga_iecho_b" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="codinga_stereo_b"  DatabaseField="codinga_stereo_b" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="codinga_convs_b"  DatabaseField="codinga_convs_b" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="codinga_point_b"  DatabaseField="codinga_point_b" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="codinga_gest_b"  DatabaseField="codinga_gest_b" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="codingb_ueye_b"  DatabaseField="codingb_ueye_b" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="codingb_faceo_b"  DatabaseField="codingb_faceo_b" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="codingb_shrnj_b"  DatabaseField="codingb_shrnj_b" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="codingb_rname_b"  DatabaseField="codingb_rname_b" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="codingb_show_b"  DatabaseField="codingb_show_b" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="codingb_sijnt_b"  DatabaseField="codingb_sijnt_b" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="codingb_rjnt_b"  DatabaseField="codingb_rjnt_b" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="codingb_qsov_b"  DatabaseField="codingb_qsov_b" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="codingb_asove_b"  DatabaseField="codingb_asove_b" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="codingb_asovp_b"  DatabaseField="codingb_asovp_b" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="codingb_qsres_b"  DatabaseField="codingb_qsres_b" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="codingb_arsoc_b"  DatabaseField="codingb_arsoc_b" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="codingb_oqrap_b"  DatabaseField="codingb_oqrap_b" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="codingc_fplay_b"  DatabaseField="codingc_fplay_b" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="codingc_imgcr_b"  DatabaseField="codingc_imgcr_b" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
</td></tr>
<tr><td>  <def:datafieldcontrol runat="server" id="codingd_usens_b"  DatabaseField="codingd_usens_b" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
</td><td> <def:datafieldcontrol runat="server" id="codingd_usens_b_cmt"  DatabaseField="codingd_usens_b_cmt" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="300px" FieldTextBoxWidth="250px"></def:datafieldcontrol>
</td></tr>
<tr><td>  <def:datafieldcontrol runat="server" id="codingd_oman_b"  DatabaseField="codingd_oman_b" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
</td><td> <def:datafieldcontrol runat="server" id="codingd_oman_b_cmt"  DatabaseField="codingd_oman_b_cmt" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="300px" FieldTextBoxWidth="250px"></def:datafieldcontrol>
</td></tr>
<tr><td>  
<def:datafieldcontrol runat="server" id="codingd_selfinj_b"  DatabaseField="codingd_selfinj_b" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
</td></tr>
<tr><td>  <def:datafieldcontrol runat="server" id="codingd_urbeh_b"  DatabaseField="codingd_urbeh_b" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
</td><td> <def:datafieldcontrol runat="server" id="codingd_urbeh_b_cmt"  DatabaseField="codingd_urbeh_b_cmt" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="300px" FieldTextBoxWidth="250px"></def:datafieldcontrol>
</td></tr>
<tr><td>
<def:datafieldcontrol runat="server" id="codinge_actve_b"  DatabaseField="codinge_actve_b" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="codinge_agg_b"  DatabaseField="codinge_agg_b" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="codinge_anxty_b"  DatabaseField="codinge_anxty_b" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
</td></tr>
</table>

<!--
<table>
<tr><td>
<b>Observations</b>
<def:datafieldcontrol runat="server" id="observation_b_1"  DatabaseField="observation_b_1" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="300px" FieldTextBoxWidth="400px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="observation_b_1_1"  DatabaseField="observation_b_1_1" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="300px" FieldTextBoxWidth="400px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="observation_b_2"  DatabaseField="observation_b_2" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="300px" FieldTextBoxWidth="400px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="observation_b_3"  DatabaseField="observation_b_3" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="300px" FieldTextBoxWidth="400px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="observation_b_4"  DatabaseField="observation_b_4" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="300px" FieldTextBoxWidth="400px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="observation_b_5"  DatabaseField="observation_b_5" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="300px" FieldTextBoxWidth="400px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="observation_b_6"  DatabaseField="observation_b_6" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="300px" FieldTextBoxWidth="400px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="observation_b_7"  DatabaseField="observation_b_7" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="300px" FieldTextBoxWidth="400px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="observation_b_8"  DatabaseField="observation_b_8" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="300px" FieldTextBoxWidth="400px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="observation_b_9"  DatabaseField="observation_b_9" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="300px" FieldTextBoxWidth="400px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="observation_b_10"  DatabaseField="observation_b_10" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="300px" FieldTextBoxWidth="400px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="observation_b_11"  DatabaseField="observation_b_11" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="300px" FieldTextBoxWidth="400px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="observation_b_12"  DatabaseField="observation_b_12" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="300px" FieldTextBoxWidth="400px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="observation_b_13"  DatabaseField="observation_b_13" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="300px" FieldTextBoxWidth="400px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="observation_b_14"  DatabaseField="observation_b_14" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="300px" FieldTextBoxWidth="400px"></def:datafieldcontrol>
</td></tr>
</table>
-->

</asp:Panel>

<asp:Panel  runat="server"  ID="items_3">
<h3>Module 3 items</h3>

<table>
<tr><td>
<b>Coding</b>
<def:datafieldcontrol runat="server" id="codinga2_olang_c"  DatabaseField="codinga2_olang_c" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="codinga_spabn_c"  DatabaseField="codinga_spabn_c" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="codinga_iecho_c"  DatabaseField="codinga_iecho_c" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="codinga_stereo_c"  DatabaseField="codinga_stereo_c" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="codinga_oinfo_c"  DatabaseField="codinga_oinfo_c" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="codinga_ainfo_c"  DatabaseField="codinga_ainfo_c" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="codinga_reprt_c"  DatabaseField="codinga_reprt_c" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="codinga_convs_c"  DatabaseField="codinga_convs_c" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="codinga_gest_c"  DatabaseField="codinga_gest_c" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="codingb_ueye_c"  DatabaseField="codingb_ueye_c" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="codingb_facee_c"  DatabaseField="codingb_facee_c" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="codingb_llnvc_c"  DatabaseField="codingb_llnvc_c" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="codingb_shrnj_c"  DatabaseField="codingb_shrnj_c" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="codingb2_empth_c"  DatabaseField="codingb2_empth_c" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="codingb2_insig_c"  DatabaseField="codingb2_insig_c" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="codingb_qsov_c"  DatabaseField="codingb_qsov_c" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="codingb_asov_c"  DatabaseField="codingb_asov_c" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="codingb_qsres_c"  DatabaseField="codingb_qsres_c" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="codingb_arsoc_c"  DatabaseField="codingb_arsoc_c" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="codingb_oqrap_c"  DatabaseField="codingb_oqrap_c" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="codingc_imgcr_c"  DatabaseField="codingc_imgcr_c" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
</td></tr>
<tr><td>  <def:datafieldcontrol runat="server" id="codingd_usens_c"  DatabaseField="codingd_usens_c" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
</td><td> <def:datafieldcontrol runat="server" id="codingd_usens_c_cmt"  DatabaseField="codingd_usens_c_cmt" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="300px" FieldTextBoxWidth="250px"></def:datafieldcontrol>
</td></tr>
<tr><td>  <def:datafieldcontrol runat="server" id="codingd_oman_c"  DatabaseField="codingd_oman_c" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
</td><td> <def:datafieldcontrol runat="server" id="codingd_oman_c_cmt"  DatabaseField="codingd_oman_c_cmt" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="300px" FieldTextBoxWidth="250px"></def:datafieldcontrol>
</td></tr>
<tr><td>  
<def:datafieldcontrol runat="server" id="codingd_selfinj_c"  DatabaseField="codingd_selfinj_c" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="codingd_topic_c"  DatabaseField="codingd_topic_c" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
</td></tr>

<tr><td>  <def:datafieldcontrol runat="server" id="codingd_ritl_c"  DatabaseField="codingd_ritl_c" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
</td><td> <def:datafieldcontrol runat="server" id="codingd_ritl_c_cmt"  DatabaseField="codingd_ritl_c_cmt" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="300px" FieldTextBoxWidth="250px"></def:datafieldcontrol>
</td></tr>
<tr><td>
<def:datafieldcontrol runat="server" id="codinge_actve_c"  DatabaseField="codinge_actve_c" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="codinge_agg_c"  DatabaseField="codinge_agg_c" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="codinge_anxty_c"  DatabaseField="codinge_anxty_c" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
</td></tr>
</table>
<br/>

<!--
<table>
<tr><td>
<b>Observations</b>
<def:datafieldcontrol runat="server" id="observation_c_1"  DatabaseField="observation_c_1" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="300px" FieldTextBoxWidth="400px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="observation_c_1_1"  DatabaseField="observation_c_1_1" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="300px" FieldTextBoxWidth="400px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="observation_c_2"  DatabaseField="observation_c_2" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="300px" FieldTextBoxWidth="400px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="observation_c_3"  DatabaseField="observation_c_3" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="300px" FieldTextBoxWidth="400px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="observation_c_4"  DatabaseField="observation_c_4" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="300px" FieldTextBoxWidth="400px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="observation_c_5"  DatabaseField="observation_c_5" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="300px" FieldTextBoxWidth="400px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="observation_c_6"  DatabaseField="observation_c_6" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="300px" FieldTextBoxWidth="400px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="observation_c_7"  DatabaseField="observation_c_7" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="300px" FieldTextBoxWidth="400px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="observation_c_8"  DatabaseField="observation_c_8" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="300px" FieldTextBoxWidth="400px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="observation_c_9"  DatabaseField="observation_c_9" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="300px" FieldTextBoxWidth="400px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="observation_c_10"  DatabaseField="observation_c_10" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="300px" FieldTextBoxWidth="400px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="observation_c_11"  DatabaseField="observation_c_11" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="300px" FieldTextBoxWidth="400px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="observation2_c_12"  DatabaseField="observation2_c_12" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="300px" FieldTextBoxWidth="400px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="observation_c_13"  DatabaseField="observation_c_13" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="300px" FieldTextBoxWidth="400px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="observation_c_14"  DatabaseField="observation_c_14" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="300px" FieldTextBoxWidth="400px"></def:datafieldcontrol>
</td></tr>
</table>
-->


</asp:Panel>


</asp:Panel>

<br/>
<br/>
<br/>
<br/>

<def:datafieldcontrol runat="server" id="created" DatabaseField="created" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="100px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="createdBy" DatabaseField="createdBy" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="100px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="50"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="updated" DatabaseField="updated" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="100px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="updatedBy" DatabaseField="updatedBy" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="100px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="50"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="scored" DatabaseField="scored" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="100px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="scoredBy" DatabaseField="scoredBy" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="100px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="50"></def:datafieldcontrol>
</asp:Content>


