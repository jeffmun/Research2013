<%@ Register TagPrefix="def" Namespace="DataEntryFramework3" %> 
<%@ Page language="c#" MasterPageFile="~/UWAC.master"  Title="tadpoletxl Data Entry" %>
<asp:Content ID="Content1" ContentPlaceHolderID="oBodyPlaceHolder" runat="server">

<def:dataentrycontroller id="DataEntryController1" runat="server" DatabaseTable="all_tadpoletxlog" PrimaryKeyField="ttl_pk" >
</def:dataentrycontroller>

<br />
<br />

<table>
<tr><td>
	<asp:Label ID="Label44" runat="server" Font-Italic="true" Font-Underline="true" Text="Instructions:"></asp:Label>
</td></tr>
<tr><td>
	<asp:Label ID="Label46" runat="server" Font-Italic="true" Text="1. Make sure to enter a "></asp:Label><br />
</td></tr>
<tr><td>
	<asp:Label ID="Label45" runat="server" Font-Italic="true" Text="2. Missed hours can be entered on the same row as treatment hours.  This isbecause all the information for a specific day for a specific subject will be aggregated across the entire day."></asp:Label>
</td></tr>
</table>


<br />
<br />


<table>
<tr>
<td width="400px"><asp:Label ID="lblID" runat="server" Text="Enter 'MIND','UW', or 'VU' for ID:" Font-Bold="true"></asp:Label></td>
<td width="200px">    <asp:LinkButton ID="LinkButton1" runat="server" PostBackUrl="https://uwac.autism.washington.edu/research/Info/TadpoleTXlog_REPORT.aspx">Go to Summary Report</asp:LinkButton></td>
<td width="200px"> <asp:LinkButton ID="LinkButton2" runat="server" PostBackUrl="https://uwac.autism.washington.edu/research/DataEntryForms/Common/TadpoleTXlog/TadpoleTXlog_list.aspx">Go to List of Entered Weeks</asp:LinkButton></td>
</tr>
</table>

<br/>

<def:datafieldcontrol runat="server" id="id" DatabaseField="id"  IsInsertField="true"  FieldLabelWidth="50px"></def:datafieldcontrol>
<br/>

<table>
<tr>
<td><def:datafieldcontrol runat="server" id="ttl_date" DatabaseField="ttl_date" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="80px" FormatString="{0:d}" ></def:datafieldcontrol></td>
<td><def:datafieldcontrol runat="server" id="clintype" DatabaseField="clintype" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="250px" FieldTextBoxWidth="40px"  ></def:datafieldcontrol></td>
<td><def:datafieldcontrol runat="server" id="clinname" DatabaseField="clinname" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="120px" ></def:datafieldcontrol></td>

</tr>
</table>
<def:datafieldcontrol runat="server" id="ttl_zerohrs" DatabaseField="ttl_zerohrs" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="250px" FieldTextBoxWidth="300px"  ></def:datafieldcontrol>
<br />
<table>
<tr>
<td width = "250px"> <asp:Label ID="Label43" runat="server"  Font-size="smaller" Text="   "></asp:Label><br /></td>
<td width="80px" style="vertical-align:top">
	<asp:Panel ID="Panel1" runat="server"  BackColor="#99ccff">
		<asp:Label ID="Label21" runat="server"  Font-size="small"   Text="Location" Font-Bold="true" Font-Underline="true"></asp:Label><br />
		<asp:Label ID="Label22" runat="server"  Font-size="smaller" Text="1 = Home"></asp:Label><br />
		<asp:Label ID="Label23" runat="server"  Font-size="smaller" Text="2 = Clinic"></asp:Label><br />
		<asp:Label ID="Label24" runat="server"  Font-size="smaller" Text="3 = School"></asp:Label><br />
		<asp:Label ID="Label25" runat="server"  Font-size="smaller" Text="4 = Other"></asp:Label>
	</asp:Panel>
</td>
<td width="200px"  style="vertical-align:top">
	<asp:Panel ID="Panel2" runat="server"  BackColor="#99ccff">
		<asp:Label ID="Label26" runat="server" Font-size="small"    Text="Appt Type" Font-Bold="true" Font-Underline="true"></asp:Label><br />
		<asp:Label ID="Label27" runat="server" Font-size="smaller"  Text="1 = Child Tx visit"></asp:Label><br />
		<asp:Label ID="Label28" runat="server" Font-size="smaller"  Text="2 = Curric. Assess."></asp:Label><br />
		<asp:Label ID="Label29" runat="server" Font-size="smaller"  Text="3 = Parent Deliv. Interv."></asp:Label><br />
		<asp:Label ID="Label30" runat="server" Font-size="smaller"  Text="4 = Supervisor, Other Int. (notes)"></asp:Label><br />
		<asp:Label ID="Label31" runat="server" Font-size="smaller"  Text="5 = SLP appt."></asp:Label><br />
		<asp:Label ID="Label32" runat="server" Font-size="smaller"  Text="6 = Class - Group"></asp:Label><br />
		<asp:Label ID="Label33" runat="server" Font-size="smaller"  Text="7 = Other (notes)"></asp:Label>
		
	</asp:Panel>
</td>

<td width="220px" style="vertical-align:top">
	<asp:Panel ID="Panel3" runat="server" BackColor="#c0c0c0">
		<asp:Label ID="Label34" runat="server"  Font-size="small"   Text="Missing Appointments Type" Font-Bold="true" Font-Underline="true"></asp:Label><br />
		<asp:Label ID="Label35" runat="server"  Font-size="smaller" Text="1 = Staff late"></asp:Label><br />
		<asp:Label ID="Label36" runat="server"  Font-size="smaller" Text="2 = Staff sick"></asp:Label><br />
		<asp:Label ID="Label37" runat="server"  Font-size="smaller" Text="3 = Staff cancelled - Other (notes)"></asp:Label><br />
		<asp:Label ID="Label38" runat="server"  Font-size="smaller" Text="4 = Family cancelled - child sick"></asp:Label><br />
		<asp:Label ID="Label39" runat="server"  Font-size="smaller" Text="5 = Family cancelled - sib/parent sick"></asp:Label><br />
		<asp:Label ID="Label40" runat="server"  Font-size="smaller" Text="6 = Family not ready"></asp:Label><br />
		<asp:Label ID="Label41" runat="server"  Font-size="smaller" Text="7 = Family cancelled - Other (notes)"></asp:Label><br />
		<asp:Label ID="Label42" runat="server" Font-size="smaller" Text="8 = Holiday"></asp:Label>
	</asp:Panel>
</td>

</tr>


</table>




	


 

<br/>
<br/>
<table>
<tr>
	<td><asp:Label ID="headerC0" runat="server" Text=""></asp:Label></td>
	<td><asp:Label ID="headerC1" runat="server" Text="ID"></asp:Label></td>
	<td><asp:Label ID="headerC2" runat="server" Text="Date"></asp:Label></td>
	<td><asp:Label ID="headerC3" runat="server" Text="Tx Duration (hrs)"  Font-Bold="true"></asp:Label></td>
	<td bgcolor="#99ccff"><asp:Label ID="headerC4" runat="server" Text="Location"></asp:Label></td>
	<td  bgcolor="#99ccff"><asp:Label ID="headerC5" runat="server" Text="Appt Type"></asp:Label></td>
	<td bgcolor="#c0c0c0"><asp:Label ID="headerC6" runat="server" Text="Missing Duration (hrs)" Font-Bold="true"></asp:Label></td>
	<td bgcolor="#c0c0c0"><asp:Label ID="headerC7" runat="server" Text="Missing Type"></asp:Label></td>
	<td bgcolor="#99ccff"><asp:Label ID="headerC8" runat="server" Text="Location Notes"></asp:Label></td>
	<td ><asp:Label ID="headerC9" runat="server" Text="Appt Notes"></asp:Label></td>
	<td bgcolor="#c0c0c0"><asp:Label ID="headerC10" runat="server" Text="Missing Notes"></asp:Label></td>
	
</tr>

<tr>
	<td><asp:Label ID="Label2" runat="server" Text="01"></asp:Label></td>
	<td><def:datafieldcontrol runat="server" id="ID01" DatabaseField="ID01" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="300px" ShowFieldLabel="false"  FieldTextBoxWidth="50px" FieldTextBoxMaxLength="20"></def:datafieldcontrol></td>
	<td><def:datafieldcontrol runat="server" id="ttl_date01" DatabaseField="ttl_date01" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" ShowFieldLabel="false" FieldTextBoxWidth="60px" FormatString="{0:d}" ></def:datafieldcontrol></td>
	<td><def:datafieldcontrol runat="server" id="ttl_txdur01" DatabaseField="ttl_txdur01" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" ShowFieldLabel="false"  FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
	<td bgcolor="#99ccff"><def:datafieldcontrol runat="server" id="ttl_loc01" DatabaseField="ttl_loc01" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" ShowFieldLabel="false"  FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
	<td bgcolor="#99ccff"><def:datafieldcontrol runat="server" id="ttl_appttype01" DatabaseField="ttl_appttype01" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" ShowFieldLabel="false"  FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
	<td bgcolor="#c0c0c0"><def:datafieldcontrol runat="server" id="ttl_misdur01" DatabaseField="ttl_misdur01" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" ShowFieldLabel="false"  FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
	<td bgcolor="#c0c0c0"><def:datafieldcontrol runat="server" id="ttl_mistype01" DatabaseField="ttl_mistype01" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" ShowFieldLabel="false"  FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
	<td bgcolor="#99ccff"><def:datafieldcontrol runat="server" id="ttl_locnotes01" DatabaseField="ttl_locnotes01" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="300px" ShowFieldLabel="false"  FieldTextBoxWidth="200px" FieldTextBoxHeight="40px" FieldTextBoxTextMode="multiline" FieldTextBoxMaxLength="250"></def:datafieldcontrol></td>
	<td ><def:datafieldcontrol runat="server" id="ttl_apptnotes01" DatabaseField="ttl_apptnotes01" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="300px" ShowFieldLabel="false"  FieldTextBoxWidth="200px" FieldTextBoxHeight="40px" FieldTextBoxTextMode="multiline" FieldTextBoxMaxLength="250"></def:datafieldcontrol></td>
	<td bgcolor="#c0c0c0"><def:datafieldcontrol runat="server" id="ttl_misnotes01" DatabaseField="ttl_misnotes01" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="300px" ShowFieldLabel="false"  FieldTextBoxWidth="200px" FieldTextBoxHeight="40px" FieldTextBoxTextMode="multiline" FieldTextBoxMaxLength="250"></def:datafieldcontrol></td>
</tr>

<tr>
	<td><asp:Label ID="Label3" runat="server" Text="02"></asp:Label></td>
	<td><def:datafieldcontrol runat="server" id="ID02" DatabaseField="ID02" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="300px" ShowFieldLabel="false"  FieldTextBoxWidth="50px" FieldTextBoxMaxLength="20"></def:datafieldcontrol></td>
	<td><def:datafieldcontrol runat="server" id="ttl_date02" DatabaseField="ttl_date02" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" ShowFieldLabel="false" FieldTextBoxWidth="60px" FormatString="{0:d}" ></def:datafieldcontrol></td>
	<td><def:datafieldcontrol runat="server" id="ttl_txdur02" DatabaseField="ttl_txdur02" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" ShowFieldLabel="false"  FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
	<td bgcolor="#99ccff"><def:datafieldcontrol runat="server" id="ttl_loc02" DatabaseField="ttl_loc02" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" ShowFieldLabel="false"  FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
	<td bgcolor="#99ccff"><def:datafieldcontrol runat="server" id="ttl_appttype02" DatabaseField="ttl_appttype02" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" ShowFieldLabel="false"  FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
	<td bgcolor="#c0c0c0"><def:datafieldcontrol runat="server" id="ttl_misdur02" DatabaseField="ttl_misdur02" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" ShowFieldLabel="false"  FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
	<td bgcolor="#c0c0c0"><def:datafieldcontrol runat="server" id="ttl_mistype02" DatabaseField="ttl_mistype02" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" ShowFieldLabel="false"  FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
	<td bgcolor="#99ccff"><def:datafieldcontrol runat="server" id="ttl_locnotes02" DatabaseField="ttl_locnotes02" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="300px" ShowFieldLabel="false"  FieldTextBoxWidth="200px" FieldTextBoxHeight="40px" FieldTextBoxTextMode="multiline" FieldTextBoxMaxLength="250"></def:datafieldcontrol></td>
	<td ><def:datafieldcontrol runat="server" id="ttl_apptnotes02" DatabaseField="ttl_apptnotes02" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="300px" ShowFieldLabel="false"  FieldTextBoxWidth="200px" FieldTextBoxHeight="40px" FieldTextBoxTextMode="multiline" FieldTextBoxMaxLength="250"></def:datafieldcontrol></td>
	<td bgcolor="#c0c0c0"><def:datafieldcontrol runat="server" id="ttl_misnotes02" DatabaseField="ttl_misnotes02" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="300px" ShowFieldLabel="false"  FieldTextBoxWidth="200px" FieldTextBoxHeight="40px" FieldTextBoxTextMode="multiline" FieldTextBoxMaxLength="250"></def:datafieldcontrol></td>
</tr>


<tr>
	<td><asp:Label ID="Label4" runat="server" Text="03"></asp:Label></td>
	<td><def:datafieldcontrol runat="server" id="ID03" DatabaseField="ID03" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="300px" ShowFieldLabel="false"  FieldTextBoxWidth="50px" FieldTextBoxMaxLength="20"></def:datafieldcontrol></td>
	<td><def:datafieldcontrol runat="server" id="ttl_date03" DatabaseField="ttl_date03" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" ShowFieldLabel="false" FieldTextBoxWidth="60px" FormatString="{0:d}" ></def:datafieldcontrol></td>
	<td><def:datafieldcontrol runat="server" id="ttl_txdur03" DatabaseField="ttl_txdur03" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" ShowFieldLabel="false"  FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
	<td bgcolor="#99ccff"><def:datafieldcontrol runat="server" id="ttl_loc03" DatabaseField="ttl_loc03" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" ShowFieldLabel="false"  FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
	<td bgcolor="#99ccff"><def:datafieldcontrol runat="server" id="ttl_appttype03" DatabaseField="ttl_appttype03" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" ShowFieldLabel="false"  FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
	<td bgcolor="#c0c0c0"><def:datafieldcontrol runat="server" id="ttl_misdur03" DatabaseField="ttl_misdur03" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" ShowFieldLabel="false"  FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
	<td bgcolor="#c0c0c0"><def:datafieldcontrol runat="server" id="ttl_mistype03" DatabaseField="ttl_mistype03" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" ShowFieldLabel="false"  FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
	<td bgcolor="#99ccff"><def:datafieldcontrol runat="server" id="ttl_locnotes03" DatabaseField="ttl_locnotes03" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="300px" ShowFieldLabel="false"  FieldTextBoxWidth="200px" FieldTextBoxHeight="40px" FieldTextBoxTextMode="multiline" FieldTextBoxMaxLength="250"></def:datafieldcontrol></td>
	<td ><def:datafieldcontrol runat="server" id="ttl_apptnotes03" DatabaseField="ttl_apptnotes03" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="300px" ShowFieldLabel="false"  FieldTextBoxWidth="200px" FieldTextBoxHeight="40px" FieldTextBoxTextMode="multiline" FieldTextBoxMaxLength="250"></def:datafieldcontrol></td>
	<td bgcolor="#c0c0c0"><def:datafieldcontrol runat="server" id="ttl_misnotes03" DatabaseField="ttl_misnotes03" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="300px" ShowFieldLabel="false"  FieldTextBoxWidth="200px" FieldTextBoxHeight="40px" FieldTextBoxTextMode="multiline" FieldTextBoxMaxLength="250"></def:datafieldcontrol></td>
</tr>



<tr>
	<td><asp:Label ID="Label5" runat="server" Text="04"></asp:Label></td>
	<td><def:datafieldcontrol runat="server" id="ID04" DatabaseField="ID04" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="300px" ShowFieldLabel="false"  FieldTextBoxWidth="50px" FieldTextBoxMaxLength="20"></def:datafieldcontrol></td>
	<td><def:datafieldcontrol runat="server" id="ttl_date04" DatabaseField="ttl_date04" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" ShowFieldLabel="false" FieldTextBoxWidth="60px" FormatString="{0:d}" ></def:datafieldcontrol></td>
	<td><def:datafieldcontrol runat="server" id="ttl_txdur04" DatabaseField="ttl_txdur04" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" ShowFieldLabel="false"  FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
	<td bgcolor="#99ccff"><def:datafieldcontrol runat="server" id="ttl_loc04" DatabaseField="ttl_loc04" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" ShowFieldLabel="false"  FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
	<td bgcolor="#99ccff"><def:datafieldcontrol runat="server" id="ttl_appttype04" DatabaseField="ttl_appttype04" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" ShowFieldLabel="false"  FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
	<td bgcolor="#c0c0c0"><def:datafieldcontrol runat="server" id="ttl_misdur04" DatabaseField="ttl_misdur04" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" ShowFieldLabel="false"  FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
	<td bgcolor="#c0c0c0"><def:datafieldcontrol runat="server" id="ttl_mistype04" DatabaseField="ttl_mistype04" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" ShowFieldLabel="false"  FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
	<td bgcolor="#99ccff"><def:datafieldcontrol runat="server" id="ttl_locnotes04" DatabaseField="ttl_locnotes04" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="300px" ShowFieldLabel="false"  FieldTextBoxWidth="200px" FieldTextBoxHeight="40px" FieldTextBoxTextMode="multiline" FieldTextBoxMaxLength="250"></def:datafieldcontrol></td>
	<td ><def:datafieldcontrol runat="server" id="ttl_apptnotes04" DatabaseField="ttl_apptnotes04" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="300px" ShowFieldLabel="false"  FieldTextBoxWidth="200px" FieldTextBoxHeight="40px" FieldTextBoxTextMode="multiline" FieldTextBoxMaxLength="250"></def:datafieldcontrol></td>
	<td bgcolor="#c0c0c0"><def:datafieldcontrol runat="server" id="ttl_misnotes04" DatabaseField="ttl_misnotes04" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="300px" ShowFieldLabel="false"  FieldTextBoxWidth="200px" FieldTextBoxHeight="40px" FieldTextBoxTextMode="multiline" FieldTextBoxMaxLength="250"></def:datafieldcontrol></td>
</tr>


<tr>
	<td><asp:Label ID="Label6" runat="server" Text="05"></asp:Label></td>
	<td><def:datafieldcontrol runat="server" id="ID05" DatabaseField="ID05" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="300px" ShowFieldLabel="false"  FieldTextBoxWidth="50px" FieldTextBoxMaxLength="20"></def:datafieldcontrol></td>
	<td><def:datafieldcontrol runat="server" id="ttl_date05" DatabaseField="ttl_date05" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" ShowFieldLabel="false" FieldTextBoxWidth="60px" FormatString="{0:d}" ></def:datafieldcontrol></td>
	<td><def:datafieldcontrol runat="server" id="ttl_txdur05" DatabaseField="ttl_txdur05" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" ShowFieldLabel="false"  FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
	<td bgcolor="#99ccff"><def:datafieldcontrol runat="server" id="ttl_loc05" DatabaseField="ttl_loc05" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" ShowFieldLabel="false"  FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
	<td bgcolor="#99ccff"><def:datafieldcontrol runat="server" id="ttl_appttype05" DatabaseField="ttl_appttype05" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" ShowFieldLabel="false"  FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
	<td bgcolor="#c0c0c0"><def:datafieldcontrol runat="server" id="ttl_misdur05" DatabaseField="ttl_misdur05" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" ShowFieldLabel="false"  FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
	<td bgcolor="#c0c0c0"><def:datafieldcontrol runat="server" id="ttl_mistype05" DatabaseField="ttl_mistype05" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" ShowFieldLabel="false"  FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
	<td bgcolor="#99ccff"><def:datafieldcontrol runat="server" id="ttl_locnotes05" DatabaseField="ttl_locnotes05" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="300px" ShowFieldLabel="false"  FieldTextBoxWidth="200px" FieldTextBoxHeight="40px" FieldTextBoxTextMode="multiline" FieldTextBoxMaxLength="250"></def:datafieldcontrol></td>
	<td ><def:datafieldcontrol runat="server" id="ttl_apptnotes05" DatabaseField="ttl_apptnotes05" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="300px" ShowFieldLabel="false"  FieldTextBoxWidth="200px" FieldTextBoxHeight="40px" FieldTextBoxTextMode="multiline" FieldTextBoxMaxLength="250"></def:datafieldcontrol></td>
	<td bgcolor="#c0c0c0"><def:datafieldcontrol runat="server" id="ttl_misnotes05" DatabaseField="ttl_misnotes05" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="300px" ShowFieldLabel="false"  FieldTextBoxWidth="200px" FieldTextBoxHeight="40px" FieldTextBoxTextMode="multiline" FieldTextBoxMaxLength="250"></def:datafieldcontrol></td>
</tr>



<tr>
	<td><asp:Label ID="Label7" runat="server" Text="06"></asp:Label></td>
	<td><def:datafieldcontrol runat="server" id="ID06" DatabaseField="ID06" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="300px" ShowFieldLabel="false"  FieldTextBoxWidth="50px" FieldTextBoxMaxLength="20"></def:datafieldcontrol></td>
	<td><def:datafieldcontrol runat="server" id="ttl_date06" DatabaseField="ttl_date06" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" ShowFieldLabel="false" FieldTextBoxWidth="60px" FormatString="{0:d}" ></def:datafieldcontrol></td>
	<td><def:datafieldcontrol runat="server" id="ttl_txdur06" DatabaseField="ttl_txdur06" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" ShowFieldLabel="false"  FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
	<td bgcolor="#99ccff"><def:datafieldcontrol runat="server" id="ttl_loc06" DatabaseField="ttl_loc06" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" ShowFieldLabel="false"  FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
	<td bgcolor="#99ccff"><def:datafieldcontrol runat="server" id="ttl_appttype06" DatabaseField="ttl_appttype06" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" ShowFieldLabel="false"  FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
	<td bgcolor="#c0c0c0"><def:datafieldcontrol runat="server" id="ttl_misdur06" DatabaseField="ttl_misdur06" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" ShowFieldLabel="false"  FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
	<td bgcolor="#c0c0c0"><def:datafieldcontrol runat="server" id="ttl_mistype06" DatabaseField="ttl_mistype06" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" ShowFieldLabel="false"  FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
	<td bgcolor="#99ccff"><def:datafieldcontrol runat="server" id="ttl_locnotes06" DatabaseField="ttl_locnotes06" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="300px" ShowFieldLabel="false"  FieldTextBoxWidth="200px" FieldTextBoxHeight="40px" FieldTextBoxTextMode="multiline" FieldTextBoxMaxLength="250"></def:datafieldcontrol></td>
	<td ><def:datafieldcontrol runat="server" id="ttl_apptnotes06" DatabaseField="ttl_apptnotes06" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="300px" ShowFieldLabel="false"  FieldTextBoxWidth="200px" FieldTextBoxHeight="40px" FieldTextBoxTextMode="multiline" FieldTextBoxMaxLength="250"></def:datafieldcontrol></td>
	<td bgcolor="#c0c0c0"><def:datafieldcontrol runat="server" id="ttl_misnotes06" DatabaseField="ttl_misnotes06" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="300px" ShowFieldLabel="false"  FieldTextBoxWidth="200px" FieldTextBoxHeight="40px" FieldTextBoxTextMode="multiline" FieldTextBoxMaxLength="250"></def:datafieldcontrol></td>
</tr>



<tr>
	<td><asp:Label ID="Label8" runat="server" Text="07"></asp:Label></td>
	<td><def:datafieldcontrol runat="server" id="ID07" DatabaseField="ID07" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="300px" ShowFieldLabel="false"  FieldTextBoxWidth="50px" FieldTextBoxMaxLength="20"></def:datafieldcontrol></td>
	<td><def:datafieldcontrol runat="server" id="ttl_date07" DatabaseField="ttl_date07" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" ShowFieldLabel="false" FieldTextBoxWidth="60px" FormatString="{0:d}" ></def:datafieldcontrol></td>
	<td><def:datafieldcontrol runat="server" id="ttl_txdur07" DatabaseField="ttl_txdur07" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" ShowFieldLabel="false"  FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
	<td bgcolor="#99ccff"><def:datafieldcontrol runat="server" id="ttl_loc07" DatabaseField="ttl_loc07" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" ShowFieldLabel="false"  FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
	<td bgcolor="#99ccff"><def:datafieldcontrol runat="server" id="ttl_appttype07" DatabaseField="ttl_appttype07" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" ShowFieldLabel="false"  FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
	<td bgcolor="#c0c0c0"><def:datafieldcontrol runat="server" id="ttl_misdur07" DatabaseField="ttl_misdur07" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" ShowFieldLabel="false"  FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
	<td bgcolor="#c0c0c0"><def:datafieldcontrol runat="server" id="ttl_mistype07" DatabaseField="ttl_mistype07" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" ShowFieldLabel="false"  FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
	<td bgcolor="#99ccff"><def:datafieldcontrol runat="server" id="ttl_locnotes07" DatabaseField="ttl_locnotes07" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="300px" ShowFieldLabel="false"  FieldTextBoxWidth="200px" FieldTextBoxHeight="40px" FieldTextBoxTextMode="multiline" FieldTextBoxMaxLength="250"></def:datafieldcontrol></td>
	<td ><def:datafieldcontrol runat="server" id="ttl_apptnotes07" DatabaseField="ttl_apptnotes07" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="300px" ShowFieldLabel="false"  FieldTextBoxWidth="200px" FieldTextBoxHeight="40px" FieldTextBoxTextMode="multiline" FieldTextBoxMaxLength="250"></def:datafieldcontrol></td>
	<td bgcolor="#c0c0c0"><def:datafieldcontrol runat="server" id="ttl_misnotes07" DatabaseField="ttl_misnotes07" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="300px" ShowFieldLabel="false"  FieldTextBoxWidth="200px" FieldTextBoxHeight="40px" FieldTextBoxTextMode="multiline" FieldTextBoxMaxLength="250"></def:datafieldcontrol></td>
</tr>



<tr>
	<td><asp:Label ID="Label1" runat="server" Text="08"></asp:Label></td>
	<td><def:datafieldcontrol runat="server" id="ID08" DatabaseField="ID08" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="300px" ShowFieldLabel="false"  FieldTextBoxWidth="50px" FieldTextBoxMaxLength="20"></def:datafieldcontrol></td>
	<td><def:datafieldcontrol runat="server" id="ttl_date08" DatabaseField="ttl_date08" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" ShowFieldLabel="false" FieldTextBoxWidth="60px" FormatString="{0:d}" ></def:datafieldcontrol></td>
	<td><def:datafieldcontrol runat="server" id="ttl_txdur08" DatabaseField="ttl_txdur08" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" ShowFieldLabel="false"  FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
	<td bgcolor="#99ccff"><def:datafieldcontrol runat="server" id="ttl_loc08" DatabaseField="ttl_loc08" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" ShowFieldLabel="false"  FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
	<td bgcolor="#99ccff"><def:datafieldcontrol runat="server" id="ttl_appttype08" DatabaseField="ttl_appttype08" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" ShowFieldLabel="false"  FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
	<td bgcolor="#c0c0c0"><def:datafieldcontrol runat="server" id="ttl_misdur08" DatabaseField="ttl_misdur08" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" ShowFieldLabel="false"  FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
	<td bgcolor="#c0c0c0"><def:datafieldcontrol runat="server" id="ttl_mistype08" DatabaseField="ttl_mistype08" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" ShowFieldLabel="false"  FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
	<td bgcolor="#99ccff"><def:datafieldcontrol runat="server" id="ttl_locnotes08" DatabaseField="ttl_locnotes08" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="300px" ShowFieldLabel="false"  FieldTextBoxWidth="200px" FieldTextBoxHeight="40px" FieldTextBoxTextMode="multiline" FieldTextBoxMaxLength="250"></def:datafieldcontrol></td>
	<td ><def:datafieldcontrol runat="server" id="ttl_apptnotes08" DatabaseField="ttl_apptnotes08" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="300px" ShowFieldLabel="false"  FieldTextBoxWidth="200px" FieldTextBoxHeight="40px" FieldTextBoxTextMode="multiline" FieldTextBoxMaxLength="250"></def:datafieldcontrol></td>
	<td bgcolor="#c0c0c0"><def:datafieldcontrol runat="server" id="ttl_misnotes08" DatabaseField="ttl_misnotes08" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="300px" ShowFieldLabel="false"  FieldTextBoxWidth="200px" FieldTextBoxHeight="40px" FieldTextBoxTextMode="multiline" FieldTextBoxMaxLength="250"></def:datafieldcontrol></td>
</tr>




<tr>
	<td><asp:Label ID="Label9" runat="server" Text="09"></asp:Label></td>
	<td><def:datafieldcontrol runat="server" id="ID09" DatabaseField="ID09" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="300px" ShowFieldLabel="false"  FieldTextBoxWidth="50px" FieldTextBoxMaxLength="20"></def:datafieldcontrol></td>
	<td><def:datafieldcontrol runat="server" id="ttl_date09" DatabaseField="ttl_date09" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" ShowFieldLabel="false" FieldTextBoxWidth="60px" FormatString="{0:d}" ></def:datafieldcontrol></td>
	<td><def:datafieldcontrol runat="server" id="ttl_txdur09" DatabaseField="ttl_txdur09" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" ShowFieldLabel="false"  FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
	<td bgcolor="#99ccff"><def:datafieldcontrol runat="server" id="ttl_loc09" DatabaseField="ttl_loc09" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" ShowFieldLabel="false"  FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
	<td bgcolor="#99ccff"><def:datafieldcontrol runat="server" id="ttl_appttype09" DatabaseField="ttl_appttype09" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" ShowFieldLabel="false"  FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
	<td bgcolor="#c0c0c0"><def:datafieldcontrol runat="server" id="ttl_misdur09" DatabaseField="ttl_misdur09" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" ShowFieldLabel="false"  FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
	<td bgcolor="#c0c0c0"><def:datafieldcontrol runat="server" id="ttl_mistype09" DatabaseField="ttl_mistype09" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" ShowFieldLabel="false"  FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
	<td bgcolor="#99ccff"><def:datafieldcontrol runat="server" id="ttl_locnotes09" DatabaseField="ttl_locnotes09" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="300px" ShowFieldLabel="false"  FieldTextBoxWidth="200px" FieldTextBoxHeight="40px" FieldTextBoxTextMode="multiline" FieldTextBoxMaxLength="250"></def:datafieldcontrol></td>
	<td ><def:datafieldcontrol runat="server" id="ttl_apptnotes09" DatabaseField="ttl_apptnotes09" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="300px" ShowFieldLabel="false"  FieldTextBoxWidth="200px" FieldTextBoxHeight="40px" FieldTextBoxTextMode="multiline" FieldTextBoxMaxLength="250"></def:datafieldcontrol></td>
	<td bgcolor="#c0c0c0"><def:datafieldcontrol runat="server" id="ttl_misnotes09" DatabaseField="ttl_misnotes09" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="300px" ShowFieldLabel="false"  FieldTextBoxWidth="200px" FieldTextBoxHeight="40px" FieldTextBoxTextMode="multiline" FieldTextBoxMaxLength="250"></def:datafieldcontrol></td>
</tr>



<tr>
	<td><asp:Label ID="Label10" runat="server" Text="10"></asp:Label></td>
	<td><def:datafieldcontrol runat="server" id="ID10" DatabaseField="ID10" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="300px" ShowFieldLabel="false"  FieldTextBoxWidth="50px" FieldTextBoxMaxLength="20"></def:datafieldcontrol></td>
	<td><def:datafieldcontrol runat="server" id="ttl_date10" DatabaseField="ttl_date10" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" ShowFieldLabel="false" FieldTextBoxWidth="60px" FormatString="{0:d}" ></def:datafieldcontrol></td>
	<td><def:datafieldcontrol runat="server" id="ttl_txdur10" DatabaseField="ttl_txdur10" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" ShowFieldLabel="false"  FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
	<td bgcolor="#99ccff"><def:datafieldcontrol runat="server" id="ttl_loc10" DatabaseField="ttl_loc10" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" ShowFieldLabel="false"  FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
	<td bgcolor="#99ccff"><def:datafieldcontrol runat="server" id="ttl_appttype10" DatabaseField="ttl_appttype10" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" ShowFieldLabel="false"  FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
	<td bgcolor="#c0c0c0"><def:datafieldcontrol runat="server" id="ttl_misdur10" DatabaseField="ttl_misdur10" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" ShowFieldLabel="false"  FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
	<td bgcolor="#c0c0c0"><def:datafieldcontrol runat="server" id="ttl_mistype10" DatabaseField="ttl_mistype10" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" ShowFieldLabel="false"  FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
	<td bgcolor="#99ccff"><def:datafieldcontrol runat="server" id="ttl_locnotes10" DatabaseField="ttl_locnotes10" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="300px" ShowFieldLabel="false"  FieldTextBoxWidth="200px" FieldTextBoxHeight="40px" FieldTextBoxTextMode="multiline" FieldTextBoxMaxLength="250"></def:datafieldcontrol></td>
	<td ><def:datafieldcontrol runat="server" id="ttl_apptnotes10" DatabaseField="ttl_apptnotes10" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="300px" ShowFieldLabel="false"  FieldTextBoxWidth="200px" FieldTextBoxHeight="40px" FieldTextBoxTextMode="multiline" FieldTextBoxMaxLength="250"></def:datafieldcontrol></td>
	<td bgcolor="#c0c0c0"><def:datafieldcontrol runat="server" id="ttl_misnotes10" DatabaseField="ttl_misnotes10" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="300px" ShowFieldLabel="false"  FieldTextBoxWidth="200px" FieldTextBoxHeight="40px" FieldTextBoxTextMode="multiline" FieldTextBoxMaxLength="250"></def:datafieldcontrol></td>
</tr>



<tr>
	<td><asp:Label ID="Label11" runat="server" Text="11"></asp:Label></td>
	<td><def:datafieldcontrol runat="server" id="ID11" DatabaseField="ID11" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="300px" ShowFieldLabel="false"  FieldTextBoxWidth="50px" FieldTextBoxMaxLength="20"></def:datafieldcontrol></td>
	<td><def:datafieldcontrol runat="server" id="ttl_date11" DatabaseField="ttl_date11" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" ShowFieldLabel="false" FieldTextBoxWidth="60px" FormatString="{0:d}" ></def:datafieldcontrol></td>
	<td><def:datafieldcontrol runat="server" id="ttl_txdur11" DatabaseField="ttl_txdur11" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" ShowFieldLabel="false"  FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
	<td bgcolor="#99ccff"><def:datafieldcontrol runat="server" id="ttl_loc11" DatabaseField="ttl_loc11" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" ShowFieldLabel="false"  FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
	<td bgcolor="#99ccff"><def:datafieldcontrol runat="server" id="ttl_appttype11" DatabaseField="ttl_appttype11" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" ShowFieldLabel="false"  FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
	<td bgcolor="#c0c0c0"><def:datafieldcontrol runat="server" id="ttl_misdur11" DatabaseField="ttl_misdur11" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" ShowFieldLabel="false"  FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
	<td bgcolor="#c0c0c0"><def:datafieldcontrol runat="server" id="ttl_mistype11" DatabaseField="ttl_mistype11" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" ShowFieldLabel="false"  FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
	<td bgcolor="#99ccff"><def:datafieldcontrol runat="server" id="ttl_locnotes11" DatabaseField="ttl_locnotes11" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="300px" ShowFieldLabel="false"  FieldTextBoxWidth="200px" FieldTextBoxHeight="40px" FieldTextBoxTextMode="multiline" FieldTextBoxMaxLength="250"></def:datafieldcontrol></td>
	<td ><def:datafieldcontrol runat="server" id="ttl_apptnotes11" DatabaseField="ttl_apptnotes11" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="300px" ShowFieldLabel="false"  FieldTextBoxWidth="200px" FieldTextBoxHeight="40px" FieldTextBoxTextMode="multiline" FieldTextBoxMaxLength="250"></def:datafieldcontrol></td>
	<td bgcolor="#c0c0c0"><def:datafieldcontrol runat="server" id="ttl_misnotes11" DatabaseField="ttl_misnotes11" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="300px" ShowFieldLabel="false"  FieldTextBoxWidth="200px" FieldTextBoxHeight="40px" FieldTextBoxTextMode="multiline" FieldTextBoxMaxLength="250"></def:datafieldcontrol></td>
</tr>


<tr>
	<td><asp:Label ID="Label12" runat="server" Text="12"></asp:Label></td>
	<td><def:datafieldcontrol runat="server" id="ID12" DatabaseField="ID12" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="300px" ShowFieldLabel="false"  FieldTextBoxWidth="50px" FieldTextBoxMaxLength="20"></def:datafieldcontrol></td>
	<td><def:datafieldcontrol runat="server" id="ttl_date12" DatabaseField="ttl_date12" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" ShowFieldLabel="false" FieldTextBoxWidth="60px" FormatString="{0:d}" ></def:datafieldcontrol></td>
	<td><def:datafieldcontrol runat="server" id="ttl_txdur12" DatabaseField="ttl_txdur12" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" ShowFieldLabel="false"  FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
	<td bgcolor="#99ccff"><def:datafieldcontrol runat="server" id="ttl_loc12" DatabaseField="ttl_loc12" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" ShowFieldLabel="false"  FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
	<td bgcolor="#99ccff"><def:datafieldcontrol runat="server" id="ttl_appttype12" DatabaseField="ttl_appttype12" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" ShowFieldLabel="false"  FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
	<td bgcolor="#c0c0c0"><def:datafieldcontrol runat="server" id="ttl_misdur12" DatabaseField="ttl_misdur12" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" ShowFieldLabel="false"  FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
	<td bgcolor="#c0c0c0"><def:datafieldcontrol runat="server" id="ttl_mistype12" DatabaseField="ttl_mistype12" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" ShowFieldLabel="false"  FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
	<td bgcolor="#99ccff"><def:datafieldcontrol runat="server" id="ttl_locnotes12" DatabaseField="ttl_locnotes12" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="300px" ShowFieldLabel="false"  FieldTextBoxWidth="200px" FieldTextBoxHeight="40px" FieldTextBoxTextMode="multiline" FieldTextBoxMaxLength="250"></def:datafieldcontrol></td>
	<td ><def:datafieldcontrol runat="server" id="ttl_apptnotes12" DatabaseField="ttl_apptnotes12" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="300px" ShowFieldLabel="false"  FieldTextBoxWidth="200px" FieldTextBoxHeight="40px" FieldTextBoxTextMode="multiline" FieldTextBoxMaxLength="250"></def:datafieldcontrol></td>
	<td bgcolor="#c0c0c0"><def:datafieldcontrol runat="server" id="ttl_misnotes12" DatabaseField="ttl_misnotes12" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="300px" ShowFieldLabel="false"  FieldTextBoxWidth="200px" FieldTextBoxHeight="40px" FieldTextBoxTextMode="multiline" FieldTextBoxMaxLength="250"></def:datafieldcontrol></td>
</tr>

<tr>
	<td><asp:Label ID="Label13" runat="server" Text="13"></asp:Label></td>
	<td><def:datafieldcontrol runat="server" id="ID13" DatabaseField="ID13" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="300px" ShowFieldLabel="false"  FieldTextBoxWidth="50px" FieldTextBoxMaxLength="20"></def:datafieldcontrol></td>
	<td><def:datafieldcontrol runat="server" id="ttl_date13" DatabaseField="ttl_date13" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" ShowFieldLabel="false" FieldTextBoxWidth="60px" FormatString="{0:d}" ></def:datafieldcontrol></td>
	<td><def:datafieldcontrol runat="server" id="ttl_txdur13" DatabaseField="ttl_txdur13" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" ShowFieldLabel="false"  FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
	<td bgcolor="#99ccff"><def:datafieldcontrol runat="server" id="ttl_loc13" DatabaseField="ttl_loc13" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" ShowFieldLabel="false"  FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
	<td bgcolor="#99ccff"><def:datafieldcontrol runat="server" id="ttl_appttype13" DatabaseField="ttl_appttype13" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" ShowFieldLabel="false"  FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
	<td bgcolor="#c0c0c0"><def:datafieldcontrol runat="server" id="ttl_misdur13" DatabaseField="ttl_misdur13" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" ShowFieldLabel="false"  FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
	<td bgcolor="#c0c0c0"><def:datafieldcontrol runat="server" id="ttl_mistype13" DatabaseField="ttl_mistype13" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" ShowFieldLabel="false"  FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
	<td bgcolor="#99ccff"><def:datafieldcontrol runat="server" id="ttl_locnotes13" DatabaseField="ttl_locnotes13" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="300px" ShowFieldLabel="false"  FieldTextBoxWidth="200px" FieldTextBoxHeight="40px" FieldTextBoxTextMode="multiline" FieldTextBoxMaxLength="250"></def:datafieldcontrol></td>
	<td ><def:datafieldcontrol runat="server" id="ttl_apptnotes13" DatabaseField="ttl_apptnotes13" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="300px" ShowFieldLabel="false"  FieldTextBoxWidth="200px" FieldTextBoxHeight="40px" FieldTextBoxTextMode="multiline" FieldTextBoxMaxLength="250"></def:datafieldcontrol></td>
	<td bgcolor="#c0c0c0"><def:datafieldcontrol runat="server" id="ttl_misnotes13" DatabaseField="ttl_misnotes13" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="300px" ShowFieldLabel="false"  FieldTextBoxWidth="200px" FieldTextBoxHeight="40px" FieldTextBoxTextMode="multiline" FieldTextBoxMaxLength="250"></def:datafieldcontrol></td>
</tr>


<tr>
	<td><asp:Label ID="Label14" runat="server" Text="14"></asp:Label></td>
	<td><def:datafieldcontrol runat="server" id="ID14" DatabaseField="ID14" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="300px" ShowFieldLabel="false"  FieldTextBoxWidth="50px" FieldTextBoxMaxLength="20"></def:datafieldcontrol></td>
	<td><def:datafieldcontrol runat="server" id="ttl_date14" DatabaseField="ttl_date14" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" ShowFieldLabel="false" FieldTextBoxWidth="60px" FormatString="{0:d}" ></def:datafieldcontrol></td>
	<td><def:datafieldcontrol runat="server" id="ttl_txdur14" DatabaseField="ttl_txdur14" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" ShowFieldLabel="false"  FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
	<td bgcolor="#99ccff"><def:datafieldcontrol runat="server" id="ttl_loc14" DatabaseField="ttl_loc14" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" ShowFieldLabel="false"  FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
	<td bgcolor="#99ccff"><def:datafieldcontrol runat="server" id="ttl_appttype14" DatabaseField="ttl_appttype14" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" ShowFieldLabel="false"  FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
	<td bgcolor="#c0c0c0"><def:datafieldcontrol runat="server" id="ttl_misdur14" DatabaseField="ttl_misdur14" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" ShowFieldLabel="false"  FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
	<td bgcolor="#c0c0c0"><def:datafieldcontrol runat="server" id="ttl_mistype14" DatabaseField="ttl_mistype14" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" ShowFieldLabel="false"  FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
	<td bgcolor="#99ccff"><def:datafieldcontrol runat="server" id="ttl_locnotes14" DatabaseField="ttl_locnotes14" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="300px" ShowFieldLabel="false"  FieldTextBoxWidth="200px" FieldTextBoxHeight="40px" FieldTextBoxTextMode="multiline" FieldTextBoxMaxLength="250"></def:datafieldcontrol></td>
	<td ><def:datafieldcontrol runat="server" id="ttl_apptnotes14" DatabaseField="ttl_apptnotes14" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="300px" ShowFieldLabel="false"  FieldTextBoxWidth="200px" FieldTextBoxHeight="40px" FieldTextBoxTextMode="multiline" FieldTextBoxMaxLength="250"></def:datafieldcontrol></td>
	<td bgcolor="#c0c0c0"><def:datafieldcontrol runat="server" id="ttl_misnotes14" DatabaseField="ttl_misnotes14" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="300px" ShowFieldLabel="false"  FieldTextBoxWidth="200px" FieldTextBoxHeight="40px" FieldTextBoxTextMode="multiline" FieldTextBoxMaxLength="250"></def:datafieldcontrol></td>
</tr>


<tr>
	<td><asp:Label ID="Label15" runat="server" Text="15"></asp:Label></td>
	<td><def:datafieldcontrol runat="server" id="ID15" DatabaseField="ID15" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="300px" ShowFieldLabel="false"  FieldTextBoxWidth="50px" FieldTextBoxMaxLength="20"></def:datafieldcontrol></td>
	<td><def:datafieldcontrol runat="server" id="ttl_date15" DatabaseField="ttl_date15" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" ShowFieldLabel="false" FieldTextBoxWidth="60px" FormatString="{0:d}" ></def:datafieldcontrol></td>
	<td><def:datafieldcontrol runat="server" id="ttl_txdur15" DatabaseField="ttl_txdur15" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" ShowFieldLabel="false"  FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
	<td bgcolor="#99ccff"><def:datafieldcontrol runat="server" id="ttl_loc15" DatabaseField="ttl_loc15" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" ShowFieldLabel="false"  FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
	<td bgcolor="#99ccff"><def:datafieldcontrol runat="server" id="ttl_appttype15" DatabaseField="ttl_appttype15" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" ShowFieldLabel="false"  FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
	<td bgcolor="#c0c0c0"><def:datafieldcontrol runat="server" id="ttl_misdur15" DatabaseField="ttl_misdur15" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" ShowFieldLabel="false"  FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
	<td bgcolor="#c0c0c0"><def:datafieldcontrol runat="server" id="ttl_mistype15" DatabaseField="ttl_mistype15" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" ShowFieldLabel="false"  FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
	<td bgcolor="#99ccff"><def:datafieldcontrol runat="server" id="ttl_locnotes15" DatabaseField="ttl_locnotes15" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="300px" ShowFieldLabel="false"  FieldTextBoxWidth="200px" FieldTextBoxHeight="40px" FieldTextBoxTextMode="multiline" FieldTextBoxMaxLength="250"></def:datafieldcontrol></td>
	<td ><def:datafieldcontrol runat="server" id="ttl_apptnotes15" DatabaseField="ttl_apptnotes15" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="300px" ShowFieldLabel="false"  FieldTextBoxWidth="200px" FieldTextBoxHeight="40px" FieldTextBoxTextMode="multiline" FieldTextBoxMaxLength="250"></def:datafieldcontrol></td>
	<td bgcolor="#c0c0c0"><def:datafieldcontrol runat="server" id="ttl_misnotes15" DatabaseField="ttl_misnotes15" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="300px" ShowFieldLabel="false"  FieldTextBoxWidth="200px" FieldTextBoxHeight="40px" FieldTextBoxTextMode="multiline" FieldTextBoxMaxLength="250"></def:datafieldcontrol></td>
</tr>

<tr>
	<td><asp:Label ID="Label16" runat="server" Text="16"></asp:Label></td>
	<td><def:datafieldcontrol runat="server" id="ID16" DatabaseField="ID16" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="300px" ShowFieldLabel="false"  FieldTextBoxWidth="50px" FieldTextBoxMaxLength="20"></def:datafieldcontrol></td>
	<td><def:datafieldcontrol runat="server" id="ttl_date16" DatabaseField="ttl_date16" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" ShowFieldLabel="false" FieldTextBoxWidth="60px" FormatString="{0:d}" ></def:datafieldcontrol></td>
	<td><def:datafieldcontrol runat="server" id="ttl_txdur16" DatabaseField="ttl_txdur16" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" ShowFieldLabel="false"  FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
	<td bgcolor="#99ccff"><def:datafieldcontrol runat="server" id="ttl_loc16" DatabaseField="ttl_loc16" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" ShowFieldLabel="false"  FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
	<td bgcolor="#99ccff"><def:datafieldcontrol runat="server" id="ttl_appttype16" DatabaseField="ttl_appttype16" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" ShowFieldLabel="false"  FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
	<td bgcolor="#c0c0c0"><def:datafieldcontrol runat="server" id="ttl_misdur16" DatabaseField="ttl_misdur16" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" ShowFieldLabel="false"  FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
	<td bgcolor="#c0c0c0"><def:datafieldcontrol runat="server" id="ttl_mistype16" DatabaseField="ttl_mistype16" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" ShowFieldLabel="false"  FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
	<td bgcolor="#99ccff"><def:datafieldcontrol runat="server" id="ttl_locnotes16" DatabaseField="ttl_locnotes16" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="300px" ShowFieldLabel="false"  FieldTextBoxWidth="200px" FieldTextBoxHeight="40px" FieldTextBoxTextMode="multiline" FieldTextBoxMaxLength="250"></def:datafieldcontrol></td>
	<td ><def:datafieldcontrol runat="server" id="ttl_apptnotes16" DatabaseField="ttl_apptnotes16" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="300px" ShowFieldLabel="false"  FieldTextBoxWidth="200px" FieldTextBoxHeight="40px" FieldTextBoxTextMode="multiline" FieldTextBoxMaxLength="250"></def:datafieldcontrol></td>
	<td bgcolor="#c0c0c0"><def:datafieldcontrol runat="server" id="ttl_misnotes16" DatabaseField="ttl_misnotes16" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="300px" ShowFieldLabel="false"  FieldTextBoxWidth="200px" FieldTextBoxHeight="40px" FieldTextBoxTextMode="multiline" FieldTextBoxMaxLength="250"></def:datafieldcontrol></td>
</tr>


<tr>
	<td><asp:Label ID="Label17" runat="server" Text="17"></asp:Label></td>
	<td><def:datafieldcontrol runat="server" id="ID17" DatabaseField="ID17" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="300px" ShowFieldLabel="false"  FieldTextBoxWidth="50px" FieldTextBoxMaxLength="20"></def:datafieldcontrol></td>
	<td><def:datafieldcontrol runat="server" id="ttl_date17" DatabaseField="ttl_date17" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" ShowFieldLabel="false" FieldTextBoxWidth="60px" FormatString="{0:d}" ></def:datafieldcontrol></td>
	<td><def:datafieldcontrol runat="server" id="ttl_txdur17" DatabaseField="ttl_txdur17" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" ShowFieldLabel="false"  FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
	<td bgcolor="#99ccff"><def:datafieldcontrol runat="server" id="ttl_loc17" DatabaseField="ttl_loc17" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" ShowFieldLabel="false"  FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
	<td bgcolor="#99ccff"><def:datafieldcontrol runat="server" id="ttl_appttype17" DatabaseField="ttl_appttype17" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" ShowFieldLabel="false"  FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
	<td bgcolor="#c0c0c0"><def:datafieldcontrol runat="server" id="ttl_misdur17" DatabaseField="ttl_misdur17" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" ShowFieldLabel="false"  FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
	<td bgcolor="#c0c0c0"><def:datafieldcontrol runat="server" id="ttl_mistype17" DatabaseField="ttl_mistype17" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" ShowFieldLabel="false"  FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
	<td bgcolor="#99ccff"><def:datafieldcontrol runat="server" id="ttl_locnotes17" DatabaseField="ttl_locnotes17" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="300px" ShowFieldLabel="false"  FieldTextBoxWidth="200px" FieldTextBoxHeight="40px" FieldTextBoxTextMode="multiline" FieldTextBoxMaxLength="250"></def:datafieldcontrol></td>
	<td ><def:datafieldcontrol runat="server" id="ttl_apptnotes17" DatabaseField="ttl_apptnotes17" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="300px" ShowFieldLabel="false"  FieldTextBoxWidth="200px" FieldTextBoxHeight="40px" FieldTextBoxTextMode="multiline" FieldTextBoxMaxLength="250"></def:datafieldcontrol></td>
	<td bgcolor="#c0c0c0"><def:datafieldcontrol runat="server" id="ttl_misnotes17" DatabaseField="ttl_misnotes17" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="300px" ShowFieldLabel="false"  FieldTextBoxWidth="200px" FieldTextBoxHeight="40px" FieldTextBoxTextMode="multiline" FieldTextBoxMaxLength="250"></def:datafieldcontrol></td>
</tr>

<tr>
	<td><asp:Label ID="Label18" runat="server" Text="18"></asp:Label></td>
	<td><def:datafieldcontrol runat="server" id="ID18" DatabaseField="ID18" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="300px" ShowFieldLabel="false"  FieldTextBoxWidth="50px" FieldTextBoxMaxLength="20"></def:datafieldcontrol></td>
	<td><def:datafieldcontrol runat="server" id="ttl_date18" DatabaseField="ttl_date18" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" ShowFieldLabel="false" FieldTextBoxWidth="60px" FormatString="{0:d}" ></def:datafieldcontrol></td>
	<td><def:datafieldcontrol runat="server" id="ttl_txdur18" DatabaseField="ttl_txdur18" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" ShowFieldLabel="false"  FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
	<td bgcolor="#99ccff"><def:datafieldcontrol runat="server" id="ttl_loc18" DatabaseField="ttl_loc18" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" ShowFieldLabel="false"  FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
	<td bgcolor="#99ccff"><def:datafieldcontrol runat="server" id="ttl_appttype18" DatabaseField="ttl_appttype18" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" ShowFieldLabel="false"  FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
	<td bgcolor="#c0c0c0"><def:datafieldcontrol runat="server" id="ttl_misdur18" DatabaseField="ttl_misdur18" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" ShowFieldLabel="false"  FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
	<td bgcolor="#c0c0c0"><def:datafieldcontrol runat="server" id="ttl_mistype18" DatabaseField="ttl_mistype18" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" ShowFieldLabel="false"  FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
	<td bgcolor="#99ccff"><def:datafieldcontrol runat="server" id="ttl_locnotes18" DatabaseField="ttl_locnotes18" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="300px" ShowFieldLabel="false"  FieldTextBoxWidth="200px" FieldTextBoxHeight="40px" FieldTextBoxTextMode="multiline" FieldTextBoxMaxLength="250"></def:datafieldcontrol></td>
	<td ><def:datafieldcontrol runat="server" id="ttl_apptnotes18" DatabaseField="ttl_apptnotes18" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="300px" ShowFieldLabel="false"  FieldTextBoxWidth="200px" FieldTextBoxHeight="40px" FieldTextBoxTextMode="multiline" FieldTextBoxMaxLength="250"></def:datafieldcontrol></td>
	<td bgcolor="#c0c0c0"><def:datafieldcontrol runat="server" id="ttl_misnotes18" DatabaseField="ttl_misnotes18" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="300px" ShowFieldLabel="false"  FieldTextBoxWidth="200px" FieldTextBoxHeight="40px" FieldTextBoxTextMode="multiline" FieldTextBoxMaxLength="250"></def:datafieldcontrol></td>
</tr>

<tr>
	<td><asp:Label ID="Label19" runat="server" Text="19"></asp:Label></td>
	<td><def:datafieldcontrol runat="server" id="ID19" DatabaseField="ID19" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="300px" ShowFieldLabel="false"  FieldTextBoxWidth="50px" FieldTextBoxMaxLength="20"></def:datafieldcontrol></td>
	<td><def:datafieldcontrol runat="server" id="ttl_date19" DatabaseField="ttl_date19" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" ShowFieldLabel="false" FieldTextBoxWidth="60px" FormatString="{0:d}" ></def:datafieldcontrol></td>
	<td><def:datafieldcontrol runat="server" id="ttl_txdur19" DatabaseField="ttl_txdur19" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" ShowFieldLabel="false"  FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
	<td bgcolor="#99ccff"><def:datafieldcontrol runat="server" id="ttl_loc19" DatabaseField="ttl_loc19" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" ShowFieldLabel="false"  FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
	<td bgcolor="#99ccff"><def:datafieldcontrol runat="server" id="ttl_appttype19" DatabaseField="ttl_appttype19" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" ShowFieldLabel="false"  FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
	<td bgcolor="#c0c0c0"><def:datafieldcontrol runat="server" id="ttl_misdur19" DatabaseField="ttl_misdur19" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" ShowFieldLabel="false"  FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
	<td bgcolor="#c0c0c0"><def:datafieldcontrol runat="server" id="ttl_mistype19" DatabaseField="ttl_mistype19" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" ShowFieldLabel="false"  FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
	<td bgcolor="#99ccff"><def:datafieldcontrol runat="server" id="ttl_locnotes19" DatabaseField="ttl_locnotes19" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="300px" ShowFieldLabel="false"  FieldTextBoxWidth="200px" FieldTextBoxHeight="40px" FieldTextBoxTextMode="multiline" FieldTextBoxMaxLength="250"></def:datafieldcontrol></td>
	<td ><def:datafieldcontrol runat="server" id="ttl_apptnotes19" DatabaseField="ttl_apptnotes19" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="300px" ShowFieldLabel="false"  FieldTextBoxWidth="200px" FieldTextBoxHeight="40px" FieldTextBoxTextMode="multiline" FieldTextBoxMaxLength="250"></def:datafieldcontrol></td>
	<td bgcolor="#c0c0c0"><def:datafieldcontrol runat="server" id="ttl_misnotes19" DatabaseField="ttl_misnotes19" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="300px" ShowFieldLabel="false"  FieldTextBoxWidth="200px" FieldTextBoxHeight="40px" FieldTextBoxTextMode="multiline" FieldTextBoxMaxLength="250"></def:datafieldcontrol></td>
</tr>

<tr>
	<td><asp:Label ID="Label20" runat="server" Text="20"></asp:Label></td>
	<td><def:datafieldcontrol runat="server" id="ID20" DatabaseField="ID20" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="300px" ShowFieldLabel="false"  FieldTextBoxWidth="50px" FieldTextBoxMaxLength="20"></def:datafieldcontrol></td>
	<td><def:datafieldcontrol runat="server" id="ttl_date20" DatabaseField="ttl_date20" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" ShowFieldLabel="false" FieldTextBoxWidth="60px" FormatString="{0:d}" ></def:datafieldcontrol></td>
	<td><def:datafieldcontrol runat="server" id="ttl_txdur20" DatabaseField="ttl_txdur20" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" ShowFieldLabel="false"  FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
	<td bgcolor="#99ccff"><def:datafieldcontrol runat="server" id="ttl_loc20" DatabaseField="ttl_loc20" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" ShowFieldLabel="false"  FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
	<td bgcolor="#99ccff"><def:datafieldcontrol runat="server" id="ttl_appttype20" DatabaseField="ttl_appttype20" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" ShowFieldLabel="false"  FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
	<td bgcolor="#c0c0c0"><def:datafieldcontrol runat="server" id="ttl_misdur20" DatabaseField="ttl_misdur20" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" ShowFieldLabel="false"  FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
	<td bgcolor="#c0c0c0"><def:datafieldcontrol runat="server" id="ttl_mistype20" DatabaseField="ttl_mistype20" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px" ShowFieldLabel="false"  FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
	<td bgcolor="#99ccff"><def:datafieldcontrol runat="server" id="ttl_locnotes20" DatabaseField="ttl_locnotes20" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="300px" ShowFieldLabel="false"  FieldTextBoxWidth="200px" FieldTextBoxHeight="40px" FieldTextBoxTextMode="multiline" FieldTextBoxMaxLength="250"></def:datafieldcontrol></td>
	<td ><def:datafieldcontrol runat="server" id="ttl_apptnotes20" DatabaseField="ttl_apptnotes20" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="300px" ShowFieldLabel="false"  FieldTextBoxWidth="200px" FieldTextBoxHeight="40px" FieldTextBoxTextMode="multiline" FieldTextBoxMaxLength="250"></def:datafieldcontrol></td>
	<td bgcolor="#c0c0c0"><def:datafieldcontrol runat="server" id="ttl_misnotes20" DatabaseField="ttl_misnotes20" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="300px" ShowFieldLabel="false"  FieldTextBoxWidth="200px" FieldTextBoxHeight="40px" FieldTextBoxTextMode="multiline" FieldTextBoxMaxLength="250"></def:datafieldcontrol></td>
</tr>






</table>


<def:datafieldcontrol runat="server" id="created" DatabaseField="created" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="300px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="createdBy" DatabaseField="createdBy" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="300px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="50"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="updated" DatabaseField="updated" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="300px" ></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="updatedBy" DatabaseField="updatedBy" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="300px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="50" ></def:datafieldcontrol>

</asp:Content>
