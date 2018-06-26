<%@ Register TagPrefix="def" Namespace="DataEntryFramework3" %> 
<%@ Page language="c#" MasterPageFile="~/UWAC.master"  Title="CANconn Family Information Form Data Entry" %>
<asp:Content ID="Content1" ContentPlaceHolderID="oBodyPlaceHolder" runat="server">
<def:dataentrycontroller id="DataEntryController1" runat="server" DatabaseTable="ALL_CANFamilyInfo" >
</def:dataentrycontroller>
<def:datafieldcontrol runat="server" id="id" DatabaseField="id"  IsInsertField="true"   FieldLabelWidth="300px "></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="indexnum" DatabaseField="indexnum"  IsInsertField="true"   FieldLabelWidth="300px "></def:datafieldcontrol>
<br />
<def:datafieldcontrol runat="server" id="FIFdate" DatabaseField="FIFdate"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="250px "></def:datafieldcontrol>
<table border="0">
	<tr>
		<td>
		<def:datafieldcontrol runat="server" id="gfi4" DatabaseField="gfi4"  IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="247px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
		<def:ValueSetLabel ID="ValueSetLabel_gfi4" runat="server"  DatabaseField="gfi4"></def:ValueSetLabel>
		</td>
		<td>
		<def:datafieldcontrol runat="server" id="gfi4a" DatabaseField="gfi4a"  IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxWidth = "300px" FieldTextBoxHeight = "100px" FieldTextBoxTextMode="MultiLine"></def:datafieldcontrol>
		</td>
	</tr>
</table>
<def:datafieldcontrol runat="server" id="gfi13" DatabaseField="gfi13"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="250px "></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="gfi14" DatabaseField="gfi14"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="250px "></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="gfi15" DatabaseField="gfi15"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="250px "></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="gfi16" DatabaseField="gfi16"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="250px "></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="pc2" DatabaseField="pc2"  IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="250px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:ValueSetLabel ID="ValueSetLabel_pc2" runat="server"  DatabaseField="pc2"></def:ValueSetLabel>
<br />
<def:datafieldcontrol runat="server" id="pc3" DatabaseField="pc3"  IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="250px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:ValueSetLabel ID="ValueSetLabel_pc3" runat="server"  DatabaseField="pc3"></def:ValueSetLabel>
<br />
<table border="0">
	<thead>Digestive Problem Ratings</thead>
	<tr>
		<td style="padding-left:97px">
		<def:datafieldcontrol runat="server" id="pc4a" DatabaseField="pc4a"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="150px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
		</td>
	</tr>
	<tr>
		<td style="padding-left:97px">
		<def:datafieldcontrol runat="server" id="pc4b" DatabaseField="pc4b"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="150px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
		</td>
	</tr>
	<tr>
		<td style="padding-left:97px">
		<def:datafieldcontrol runat="server" id="pc4c" DatabaseField="pc4c"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="150px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
		</td>
	</tr>
	<tr>
		<td style="padding-left:97px">
		<def:datafieldcontrol runat="server" id="pc4d" DatabaseField="pc4d"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="150px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
		</td>
	</tr>
	<tr>
		<td style="padding-left:97px">
		<def:datafieldcontrol runat="server" id="pc4e" DatabaseField="pc4e"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="150px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
		</td>
	</tr>
	<tr>
		<td style="padding-left:97px">
		<def:datafieldcontrol runat="server" id="pc4f" DatabaseField="pc4f"  IsEntryField="true" IsDoubleEntryField="true"  FieldLabelWidth="150px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
		</td>
	</tr>
</table>
<br />
<table border="0">
	<thead>Motor Skills</thead>
	<tr>
		<td width="200">
		Skill
		</td>
		<td width="100">
		Achieved<br />
		<def:ValueSetLabel ID="ValueSetLabel_pc5a1" runat="server"  DatabaseField="pc5a1"></def:ValueSetLabel>
		</td>
		<td width="100">
		Age in mos.
		</td>
		<td width="350">
		Level of Confidence<br />
		<def:ValueSetLabel ID="ValueSetLabel_pc5a3" runat="server"  DatabaseField="pc5a3"></def:ValueSetLabel>
		</td>
	</tr>
	<tr>
		<td>
		Sat without support:
		</td>
		<td>
		<def:datafieldcontrol runat="server" id="pc5a1" DatabaseField="pc5a1"  IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxWidth="30px"></def:datafieldcontrol>
		</td>
		<td>
		<def:datafieldcontrol runat="server" id="pc5a2" DatabaseField="pc5a2"  IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxWidth="30px"></def:datafieldcontrol>
		</td>
		<td>
		<def:datafieldcontrol runat="server" id="pc5a3" DatabaseField="pc5a3"  IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxWidth="30px"></def:datafieldcontrol>
		</td>
	</tr>
	<tr>
		<td>
		Rolled from back to stomach:
		</td>
		<td>
		<def:datafieldcontrol runat="server" id="pc5b1" DatabaseField="pc5b1"  IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxWidth="30px"></def:datafieldcontrol>
		</td>
		<td>
		<def:datafieldcontrol runat="server" id="pc5b2" DatabaseField="pc5b2"  IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxWidth="30px"></def:datafieldcontrol>
		</td>
		<td>
		<def:datafieldcontrol runat="server" id="pc5b3" DatabaseField="pc5b3"  IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxWidth="30px"></def:datafieldcontrol>
		</td>
	</tr>
	<tr>
		<td>
		Rolled from stomach to back:
		</td>
		<td>
		<def:datafieldcontrol runat="server" id="pc5c1" DatabaseField="pc5c1"  IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxWidth="30px"></def:datafieldcontrol>
		</td>
		<td>
		<def:datafieldcontrol runat="server" id="pc5c2" DatabaseField="pc5c2"  IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxWidth="30px"></def:datafieldcontrol>
		</td>
		<td>
		<def:datafieldcontrol runat="server" id="pc5c3" DatabaseField="pc5c3"  IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxWidth="30px"></def:datafieldcontrol>
		</td>
	</tr>
	<tr>
		<td>
		Crawled:
		</td>
		<td>
		<def:datafieldcontrol runat="server" id="pc5d1" DatabaseField="pc5d1"  IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxWidth="30px"></def:datafieldcontrol>
		</td>
		<td>
		<def:datafieldcontrol runat="server" id="pc5d2" DatabaseField="pc5d2"  IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxWidth="30px"></def:datafieldcontrol>
		</td>
		<td>
		<def:datafieldcontrol runat="server" id="pc5d3" DatabaseField="pc5d3"  IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxWidth="30px"></def:datafieldcontrol>
		</td>
	</tr>
	<tr>
		<td>
		Stood alone:
		</td>
		<td>
		<def:datafieldcontrol runat="server" id="pc5e1" DatabaseField="pc5e1"  IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxWidth="30px"></def:datafieldcontrol>
		</td>
		<td>
		<def:datafieldcontrol runat="server" id="pc5e2" DatabaseField="pc5e2"  IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxWidth="30px"></def:datafieldcontrol>
		</td>
		<td>
		<def:datafieldcontrol runat="server" id="pc5e3" DatabaseField="pc5e3"  IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxWidth="30px"></def:datafieldcontrol>
		</td>
	</tr>
	<tr>
		<td>
		Walked:
		</td>
		<td>
		<def:datafieldcontrol runat="server" id="pc5f1" DatabaseField="pc5f1"  IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxWidth="30px"></def:datafieldcontrol>
		</td>
		<td>
		<def:datafieldcontrol runat="server" id="pc5f2" DatabaseField="pc5f2"  IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxWidth="30px"></def:datafieldcontrol>
		</td>
		<td>
		<def:datafieldcontrol runat="server" id="pc5f3" DatabaseField="pc5f3"  IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxWidth="30px"></def:datafieldcontrol>
		</td>
	</tr>
	<tr>
		<td>
		Walked up and down stairs:
		</td>
		<td>
		<def:datafieldcontrol runat="server" id="pc5g1" DatabaseField="pc5g1"  IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxWidth="30px"></def:datafieldcontrol>
		</td>
		<td>
		<def:datafieldcontrol runat="server" id="pc5g2" DatabaseField="pc5g2"  IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxWidth="30px"></def:datafieldcontrol>
		</td>
		<td>
		<def:datafieldcontrol runat="server" id="pc5g3" DatabaseField="pc5g3"  IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxWidth="30px"></def:datafieldcontrol>
		</td>
	</tr>
</table>
<br />
<table border="0">
	<thead>Self Help</thead>
	<tr>
		<td width="200">
		Skill
		</td>
		<td width="100">
		Achieved<br />
		<def:ValueSetLabel ID="ValueSetLabel1" runat="server"  DatabaseField="pc5a1"></def:ValueSetLabel>
		</td>
		<td width="100">
		Age in mos.
		</td>
		<td width="350">
		Level of Confidence<br />
		<def:ValueSetLabel ID="ValueSetLabel2" runat="server"  DatabaseField="pc5a3"></def:ValueSetLabel>
		</td>
	</tr>
	<tr>
		<td>
		Daytime bladder control:
		</td>
		<td>
		<def:datafieldcontrol runat="server" id="pc5h1" DatabaseField="pc5h1"  IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxWidth="30px"></def:datafieldcontrol>
		</td>
		<td>
		<def:datafieldcontrol runat="server" id="pc5h2" DatabaseField="pc5h2"  IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxWidth="30px"></def:datafieldcontrol>
		</td>
		<td>
		<def:datafieldcontrol runat="server" id="pc5h3" DatabaseField="pc5h3"  IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxWidth="30px"></def:datafieldcontrol>
		</td>
	</tr>
	<tr>
		<td style="padding-left: 20px">
		Any relapses?
		</td>
		<td>
		<def:datafieldcontrol runat="server" id="pc5h4" DatabaseField="pc5h4"  IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxWidth="30px"></def:datafieldcontrol>
		</td>
		<td>
		<def:datafieldcontrol runat="server" id="pc5h5" DatabaseField="pc5h5"  IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxWidth="30px"></def:datafieldcontrol>
		</td>
		<td>
		<def:datafieldcontrol runat="server" id="pc5h6" DatabaseField="pc5h6"  IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxWidth = "300px" FieldTextBoxHeight = "50px" FieldTextBoxTextMode="MultiLine"></def:datafieldcontrol>
		</td>
	</tr>
	<tr>
		<td>
		Nighttime bladder control:
		</td>
		<td>
		<def:datafieldcontrol runat="server" id="pc5i1" DatabaseField="pc5i1"  IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxWidth="30px"></def:datafieldcontrol>
		</td>
		<td>
		<def:datafieldcontrol runat="server" id="pc5i2" DatabaseField="pc5i2"  IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxWidth="30px"></def:datafieldcontrol>
		</td>
		<td>
		<def:datafieldcontrol runat="server" id="pc5i3" DatabaseField="pc5i3"  IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxWidth="30px"></def:datafieldcontrol>
		</td>
	</tr>
	<tr>
		<td style="padding-left: 20px">
		Any relapses?
		</td>
		<td>
		<def:datafieldcontrol runat="server" id="pc5i4" DatabaseField="pc5i4"  IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxWidth="30px"></def:datafieldcontrol>
		</td>
		<td>
		<def:datafieldcontrol runat="server" id="pc5i5" DatabaseField="pc5i5"  IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxWidth="30px"></def:datafieldcontrol>
		</td>
		<td>
		<def:datafieldcontrol runat="server" id="pc5i6" DatabaseField="pc5i6"  IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxWidth = "300px" FieldTextBoxHeight = "50px" FieldTextBoxTextMode="MultiLine"></def:datafieldcontrol>
		</td>
	</tr>
	<tr>
		<td>
		Bowel Control:
		</td>
		<td>
		<def:datafieldcontrol runat="server" id="pc5j1" DatabaseField="pc5j1"  IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxWidth="30px"></def:datafieldcontrol>
		</td>
		<td>
		<def:datafieldcontrol runat="server" id="pc5j2" DatabaseField="pc5j2"  IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxWidth="30px"></def:datafieldcontrol>
		</td>
		<td>
		<def:datafieldcontrol runat="server" id="pc5j3" DatabaseField="pc5j3"  IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxWidth="30px"></def:datafieldcontrol>
		</td>
	</tr>
	<tr>
		<td style="padding-left: 20px">
		Any relapses?
		</td>
		<td>
		<def:datafieldcontrol runat="server" id="pc5j4" DatabaseField="pc5j4"  IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxWidth="30px"></def:datafieldcontrol>
		</td>
		<td>
		<def:datafieldcontrol runat="server" id="pc5j5" DatabaseField="pc5j5"  IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxWidth="30px"></def:datafieldcontrol>
		</td>
		<td>
		<def:datafieldcontrol runat="server" id="pc5j6" DatabaseField="pc5j6"  IsEntryField="true" IsDoubleEntryField="true" FieldTextBoxWidth = "300px" FieldTextBoxHeight = "50px" FieldTextBoxTextMode="MultiLine"></def:datafieldcontrol>
		</td>
	</tr>
</table>
<br />
<table border="0">
	<tr>
		<td>
		Biological Father Information
		</td>
		<td style="padding-left:20px">
		Biological Mother Information
		</td>
	</tr>
	<tr>
		<td>
		<def:datafieldcontrol runat="server" id="bf3" DatabaseField="bf3"  IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="175px" FieldTextBoxWidth = "200px"></def:datafieldcontrol>
		<def:datafieldcontrol runat="server" id="bf4" DatabaseField="bf4"  IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="175px" FieldTextBoxWidth = "30px"></def:datafieldcontrol>
		<def:ValueSetLabel ID="ValueSetLabel_bf4" runat="server"  DatabaseField="bf4"></def:ValueSetLabel>
		<br />
		<def:datafieldcontrol runat="server" id="bf4a" DatabaseField="bf4a"  IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="175px" FieldTextBoxWidth = "200px" FieldTextBoxHeight = "50px" FieldTextBoxTextMode="MultiLine"></def:datafieldcontrol>
		<def:datafieldcontrol runat="server" id="bf5" DatabaseField="bf5"  IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="175px" FieldTextBoxWidth = "30px"></def:datafieldcontrol>
		<def:ValueSetLabel ID="ValueSetLabel_bf5" runat="server"  DatabaseField="bf5"></def:ValueSetLabel>
		<br />
		<def:datafieldcontrol runat="server" id="bf6" DatabaseField="bf6"  IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="175px" FieldTextBoxWidth = "200px"></def:datafieldcontrol>
		</td>
		<td style="padding-left:20px">
		<def:datafieldcontrol runat="server" id="bm3" DatabaseField="bm3"  IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="175px" FieldTextBoxWidth = "200px"></def:datafieldcontrol>
		<def:datafieldcontrol runat="server" id="bm4" DatabaseField="bm4"  IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="175px" FieldTextBoxWidth = "30px"></def:datafieldcontrol>
		<def:ValueSetLabel ID="ValueSetLabel3" runat="server"  DatabaseField="bf4"></def:ValueSetLabel>
		<br />
		<def:datafieldcontrol runat="server" id="bm4a" DatabaseField="bm4a"  IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="175px" FieldTextBoxWidth = "200px" FieldTextBoxHeight = "50px" FieldTextBoxTextMode="MultiLine"></def:datafieldcontrol>
		<def:datafieldcontrol runat="server" id="bm5" DatabaseField="bm5"  IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="175px" FieldTextBoxWidth = "30px"></def:datafieldcontrol>
		<def:ValueSetLabel ID="ValueSetLabel4" runat="server"  DatabaseField="bf5"></def:ValueSetLabel>
		<br />
		<def:datafieldcontrol runat="server" id="bm6" DatabaseField="bm6"  IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="175px" FieldTextBoxWidth = "200px"></def:datafieldcontrol>
		</td>
	</tr>
</table>
<br />
<def:datafieldcontrol runat="server" id="created" DatabaseField="created"  IsReadOnly="true" RenderReadOnlyAsDiv="true"   FieldLabelWidth="300px "></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="createdBy" DatabaseField="createdBy"  IsReadOnly="true" RenderReadOnlyAsDiv="true"   FieldLabelWidth="300px "></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="updated" DatabaseField="updated"  IsReadOnly="true" RenderReadOnlyAsDiv="true"   FieldLabelWidth="300px "></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="updatedBy" DatabaseField="updatedBy"  IsReadOnly="true" RenderReadOnlyAsDiv="true"   FieldLabelWidth="300px "></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="scored" DatabaseField="scored"  IsReadOnly="true" RenderReadOnlyAsDiv="true"   FieldLabelWidth="300px "></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="scoredBy" DatabaseField="scoredBy"  IsReadOnly="true" RenderReadOnlyAsDiv="true"   FieldLabelWidth="300px "></def:datafieldcontrol>
</asp:Content>
