<%@ Page language="c#" Inherits="edst3_holroyd.edst3_holroyd" CodeFile="edst3_holroyd.aspx.cs"  MasterPageFile="~/UWAC.master" %>

<%@ Register TagPrefix="def" Namespace="DataEntryFramework.Old" %>
<asp:Content ID="Content1" ContentPlaceHolderID="oBodyPlaceHolder" runat="server">
					<def:dataentrycontroller id="DataEntryController1" runat="server" VerifiedField="verified" PrimaryKeyField="hol_pk"
						MeasureName="EDST3 Holroyd" LookupTextBox1LabelText="EDS ID:" LookupTextBox2Visible="False" LookupField1="edsid"
						DatabaseTable="edst3_holroyd" StudyMeasID="198"></def:dataentrycontroller>
					<table class="layout" id="table_insert">
						<tr>
							<td><def:datafieldcontrol id="EDSID" runat="server" DatabaseField="EDSID" FieldTextBoxTabIndex="1" FieldLabelText="EDSID"
									IsDoubleEntryField="False" IsReadOnly="False" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="True"
									IsInsertField="True" FieldDataType="INT" FieldTextBoxWidth="60px" FieldLabelWidth="80px"></def:datafieldcontrol></td>
						</tr>
					</table>
					<br>
					<asp:Panel Runat="server" ID="mainPanel">
						<TABLE class="grid" id="table_entry">
							<TR>
								<TD class="heading" colSpan="2">1=Strong agreement<BR>
									2=Partial agreement<BR>
									3=Partial disagreement<BR>
									4=Strong disagreement<BR>
									9=Missing/Blank
								</TD>
							</TR>
							<TR>
								<TD width="311">
									<def:datafieldcontrol id="HOL101" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
										IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
										FieldLabelText="1.  (child) demands that others do things for him/her more" FieldTextBoxTabIndex="3"
										DatabaseField="HOL101" ValidList="1,2,3,4,9"></def:datafieldcontrol></TD>
								<TD>
									<def:datafieldcontrol id="HOL141" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
										IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
										FieldLabelText="41.  (child) is aware of who he/she is (for example, male," FieldTextBoxTabIndex="43"
										DatabaseField="HOL141" ValidList="1,2,3,4,9"></def:datafieldcontrol></TD>
							</TR>
							<TR>
								<TD width="311">
									<def:datafieldcontrol id="HOL102" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
										IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
										FieldLabelText="2.  (child) understands the idea of time." FieldTextBoxTabIndex="4" DatabaseField="HOL102"
										ValidList="1,2,3,4,9"></def:datafieldcontrol></TD>
								<TD>
									<def:datafieldcontrol id="HOL142" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
										IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
										FieldLabelText="42.  My spouse's poor understanding of (child)'s difficult" FieldTextBoxTabIndex="44"
										DatabaseField="HOL142" ValidList="1,2,3,4,9"></def:datafieldcontrol></TD>
							</TR>
							<TR>
								<TD width="311">
									<def:datafieldcontrol id="HOL103" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
										IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
										FieldLabelText="3.  I have had to give up education (or a job) because of " FieldTextBoxTabIndex="5"
										DatabaseField="HOL103" ValidList="1,2,3,4,9"></def:datafieldcontrol></TD>
								<TD>
									<def:datafieldcontrol id="HOL143" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
										IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
										FieldLabelText="43.  I feel embarrassed because of (child) ." FieldTextBoxTabIndex="45" DatabaseField="HOL143"
										ValidList="1,2,3,4,9"></def:datafieldcontrol></TD>
							</TR>
							<TR>
								<TD width="311">
									<def:datafieldcontrol id="HOL104" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
										IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
										FieldLabelText="4.  Members of the family share in the care of (child)." FieldTextBoxTabIndex="6"
										DatabaseField="HOL104" ValidList="1,2,3,4,9"></def:datafieldcontrol></TD>
								<TD>
									<def:datafieldcontrol id="HOL144" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
										IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
										FieldLabelText="44.  Having to care for has enriched our family life." FieldTextBoxTabIndex="46" DatabaseField="HOL144"
										ValidList="1,2,3,4,9"></def:datafieldcontrol></TD>
							</TR>
							<TR>
								<TD width="311">
									<def:datafieldcontrol id="HOL105" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
										IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
										FieldLabelText="5.  Even if people don't look at (child), I am always wond" FieldTextBoxTabIndex="7"
										DatabaseField="HOL105" ValidList="1,2,3,4,9"></def:datafieldcontrol></TD>
								<TD>
									<def:datafieldcontrol id="HOL145" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
										IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
										FieldLabelText="45.  It makes me feel good to know I can take care of (chi" FieldTextBoxTabIndex="47"
										DatabaseField="HOL145" ValidList="1,2,3,4,9"></def:datafieldcontrol></TD>
							</TR>
							<TR>
								<TD width="311">
									<def:datafieldcontrol id="HOL106" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
										IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
										FieldLabelText="6.  (child)  does not have problems with seeing or hearing" FieldTextBoxTabIndex="8"
										DatabaseField="HOL106" ValidList="1,2,3,4,9"></def:datafieldcontrol></TD>
								<TD>
									<def:datafieldcontrol id="HOL146" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
										IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
										FieldLabelText="46.  (child)  does not interfere with our family's enjoyme" FieldTextBoxTabIndex="48"
										DatabaseField="HOL146" ValidList="1,2,3,4,9"></def:datafieldcontrol></TD>
							</TR>
							<TR>
								<TD width="311">
									<def:datafieldcontrol id="HOL107" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
										IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
										FieldLabelText="7.  I take on responsibility for (child)  because I know h" FieldTextBoxTabIndex="9"
										DatabaseField="HOL107" ValidList="1,2,3,4,9"></def:datafieldcontrol></TD>
								<TD>
									<def:datafieldcontrol id="HOL147" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
										IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
										FieldLabelText="47.  I do not have enough time to give the other members o" FieldTextBoxTabIndex="49"
										DatabaseField="HOL147" ValidList="1,2,3,4,9"></def:datafieldcontrol></TD>
							</TR>
							<TR>
								<TD width="311">
									<def:datafieldcontrol id="HOL108" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
										IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
										FieldLabelText="8.  (child) has some unusual habits which draw attention." FieldTextBoxTabIndex="10"
										DatabaseField="HOL108" ValidList="1,2,3,4,9"></def:datafieldcontrol></TD>
								<TD>
									<def:datafieldcontrol id="HOL148" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
										IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
										FieldLabelText="48.  There are places where we can enjoy ourselves as a fa" FieldTextBoxTabIndex="50"
										DatabaseField="HOL148" ValidList="1,2,3,4,9"></def:datafieldcontrol></TD>
							</TR>
							<TR>
								<TD width="311">
									<def:datafieldcontrol id="HOL109" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
										IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
										FieldLabelText="9.  A physician sees (child) at least once a month." FieldTextBoxTabIndex="11" DatabaseField="HOL109"
										ValidList="1,2,3,4,9"></def:datafieldcontrol></TD>
								<TD>
									<def:datafieldcontrol id="HOL149" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
										IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
										FieldLabelText="49.  It is not hard to think of enough things to keep  (ch" FieldTextBoxTabIndex="51"
										DatabaseField="HOL149" ValidList="1,2,3,4,9"></def:datafieldcontrol></TD>
							</TR>
							<TR>
								<TD width="311">
									<def:datafieldcontrol id="HOL110" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
										IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
										FieldLabelText="10.  The special opportunities needed by (child)  are avai" FieldTextBoxTabIndex="12"
										DatabaseField="HOL110" ValidList="1,2,3,4,9"></def:datafieldcontrol></TD>
								<TD>
									<def:datafieldcontrol id="HOL150" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
										IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
										FieldLabelText="50.  (child) is over-protected." FieldTextBoxTabIndex="52" DatabaseField="HOL150"
										ValidList="1,2,3,4,9"></def:datafieldcontrol></TD>
							</TR>
							<TR>
								<TD width="311">
									<def:datafieldcontrol id="HOL111" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
										IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
										FieldLabelText="11.  I watch (child) to make sure he/she does not do physi" FieldTextBoxTabIndex="13"
										DatabaseField="HOL111" ValidList="1,2,3,4,9"></def:datafieldcontrol></TD>
								<TD>
									<def:datafieldcontrol id="HOL151" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
										IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
										FieldLabelText="51.  Some of our family do not bring friends into the home" FieldTextBoxTabIndex="53"
										DatabaseField="HOL151" ValidList="1,2,3,4,9"></def:datafieldcontrol></TD>
							</TR>
							<TR>
								<TD width="311">
									<def:datafieldcontrol id="HOL112" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
										IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
										FieldLabelText="12.  (child) would be in no danger if he/she could get out" FieldTextBoxTabIndex="14"
										DatabaseField="HOL112" ValidList="1,2,3,4,9"></def:datafieldcontrol></TD>
								<TD>
									<def:datafieldcontrol id="HOL152" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
										IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
										FieldLabelText="52.  I participate in an organization for families who sha" FieldTextBoxTabIndex="54"
										DatabaseField="HOL152" ValidList="1,2,3,4,9"></def:datafieldcontrol></TD>
							</TR>
							<TR>
								<TD width="311">
									<def:datafieldcontrol id="HOL113" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
										IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
										FieldLabelText="13.  I feel that our family situation will get better." FieldTextBoxTabIndex="15"
										DatabaseField="HOL113" ValidList="1,2,3,4,9"></def:datafieldcontrol></TD>
								<TD>
									<def:datafieldcontrol id="HOL153" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
										IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
										FieldLabelText="53.  If I were healthier it would be easier to care for (c" FieldTextBoxTabIndex="55"
										DatabaseField="HOL153" ValidList="1,2,3,4,9"></def:datafieldcontrol></TD>
							</TR>
							<TR>
								<TD width="311">
									<def:datafieldcontrol id="HOL114" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
										IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
										FieldLabelText="14.  Medicine does not have to be given to (child) ." FieldTextBoxTabIndex="16" DatabaseField="HOL114"
										ValidList="1,2,3,4,9"></def:datafieldcontrol></TD>
								<TD>
									<def:datafieldcontrol id="HOL154" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
										IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
										FieldLabelText="54.  People in public places indicate they don't want (chi" FieldTextBoxTabIndex="56"
										DatabaseField="HOL154" ValidList="1,2,3,4,9"></def:datafieldcontrol></TD>
							</TR>
							<TR>
								<TD width="311">
									<def:datafieldcontrol id="HOL115" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
										IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
										FieldLabelText="15.  (child)  doesn't communicate with others of his/her a" FieldTextBoxTabIndex="17"
										DatabaseField="HOL115" ValidList="1,2,3,4,9"></def:datafieldcontrol></TD>
								<TD>
									<def:datafieldcontrol id="HOL155" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
										IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
										FieldLabelText="55.  (child)  can get around the neighborhood quite nicely" FieldTextBoxTabIndex="57"
										DatabaseField="HOL155" ValidList="1,2,3,4,9"></def:datafieldcontrol></TD>
							</TR>
							<TR>
								<TD width="311">
									<def:datafieldcontrol id="HOL116" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
										IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
										FieldLabelText="16.  Other members of the family have to do without things" FieldTextBoxTabIndex="18"
										DatabaseField="HOL116" ValidList="1,2,3,4,9"></def:datafieldcontrol></TD>
								<TD>
									<def:datafieldcontrol id="HOL156" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
										IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
										FieldLabelText="56.  I have enough time to myself." FieldTextBoxTabIndex="58" DatabaseField="HOL156"
										ValidList="1,2,3,4,9"></def:datafieldcontrol></TD>
							</TR>
							<TR>
								<TD width="311">
									<def:datafieldcontrol id="HOL117" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
										IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
										FieldLabelText="17.  (child)'s problems or illness do not stand in the way" FieldTextBoxTabIndex="19"
										DatabaseField="HOL117" ValidList="1,2,3,4,9"></def:datafieldcontrol></TD>
								<TD>
									<def:datafieldcontrol id="HOL157" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
										IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
										FieldLabelText="57.  I have too much responsibility." FieldTextBoxTabIndex="59" DatabaseField="HOL157"
										ValidList="1,2,3,4,9"></def:datafieldcontrol></TD>
							</TR>
							<TR>
								<TD width="311">
									<def:datafieldcontrol id="HOL118" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
										IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
										FieldLabelText="18.  When others are around (child) I cannot relax; I am a" FieldTextBoxTabIndex="20"
										DatabaseField="HOL118" ValidList="1,2,3,4,9"></def:datafieldcontrol></TD>
								<TD>
									<def:datafieldcontrol id="HOL158" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
										IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
										FieldLabelText="58.  I am afraid that as (child)  gets older it will be ha" FieldTextBoxTabIndex="60"
										DatabaseField="HOL158" ValidList="1,2,3,4,9"></def:datafieldcontrol></TD>
							</TR>
							<TR>
								<TD width="311">
									<def:datafieldcontrol id="HOL119" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
										IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
										FieldLabelText="19.  Professionals (nurses, etc.) in an institution would " FieldTextBoxTabIndex="21"
										DatabaseField="HOL119" ValidList="1,2,3,4,9"></def:datafieldcontrol></TD>
								<TD>
									<def:datafieldcontrol id="HOL159" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
										IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
										FieldLabelText="59.  It is easy to keep (child) entertained." FieldTextBoxTabIndex="61" DatabaseField="HOL159"
										ValidList="1,2,3,4,9"></def:datafieldcontrol></TD>
							</TR>
							<TR>
								<TD width="311">
									<def:datafieldcontrol id="HOL120" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
										IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
										FieldLabelText="20.  I worry about what will happen to (child) when I can " FieldTextBoxTabIndex="22"
										DatabaseField="HOL120" ValidList="1,2,3,4,9"></def:datafieldcontrol></TD>
								<TD>
									<def:datafieldcontrol id="HOL160" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
										IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
										FieldLabelText="60.  (child) wants to do things for himself/herself." FieldTextBoxTabIndex="62" DatabaseField="HOL160"
										ValidList="1,2,3,4,9"></def:datafieldcontrol></TD>
							</TR>
							<TR>
								<TD width="311">
									<def:datafieldcontrol id="HOL121" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
										IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
										FieldLabelText="21.  I would rather be caring for  (child) than doing some" FieldTextBoxTabIndex="23"
										DatabaseField="HOL121" ValidList="1,2,3,4,9"></def:datafieldcontrol></TD>
								<TD>
									<def:datafieldcontrol id="HOL161" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
										IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
										FieldLabelText="61.  I feel sad when I think of (child)." FieldTextBoxTabIndex="63" DatabaseField="HOL161"
										ValidList="1,2,3,4,9"></def:datafieldcontrol></TD>
							</TR>
							<TR>
								<TD width="311">
									<def:datafieldcontrol id="HOL122" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
										IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
										FieldLabelText="22.  I have given up things I have really wanted to do in " FieldTextBoxTabIndex="24"
										DatabaseField="HOL122" ValidList="1,2,3,4,9"></def:datafieldcontrol></TD>
								<TD>
									<def:datafieldcontrol id="HOL162" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
										IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
										FieldLabelText="62.  The demands to care for (child) limit my growth and d" FieldTextBoxTabIndex="64"
										DatabaseField="HOL162" ValidList="1,2,3,4,9"></def:datafieldcontrol></TD>
							</TR>
							<TR>
								<TD width="311">
									<def:datafieldcontrol id="HOL123" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
										IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
										FieldLabelText="23.  (child)  is able to fit into the family social group." FieldTextBoxTabIndex="25"
										DatabaseField="HOL123" ValidList="1,2,3,4,9"></def:datafieldcontrol></TD>
								<TD>
									<def:datafieldcontrol id="HOL163" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
										IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
										FieldLabelText="63.  I have become more understanding in my relationships " FieldTextBoxTabIndex="65"
										DatabaseField="HOL163" ValidList="1,2,3,4,9"></def:datafieldcontrol></TD>
							</TR>
							<TR>
								<TD width="311">
									<def:datafieldcontrol id="HOL124" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
										IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
										FieldLabelText="24.  Some members of my family don't like the way I do thi" FieldTextBoxTabIndex="26"
										DatabaseField="HOL124" ValidList="1,2,3,4,9"></def:datafieldcontrol></TD>
								<TD>
									<def:datafieldcontrol id="HOL164" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
										IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
										FieldLabelText="64.  Our family should do more together." FieldTextBoxTabIndex="66" DatabaseField="HOL164"
										ValidList="1,2,3,4,9"></def:datafieldcontrol></TD>
							</TR>
							<TR>
								<TD width="311">
									<def:datafieldcontrol id="HOL125" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
										IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
										FieldLabelText="25.  It appears to me that it doesn't make any difference " FieldTextBoxTabIndex="27"
										DatabaseField="HOL125" ValidList="1,2,3,4,9"></def:datafieldcontrol></TD>
								<TD>
									<def:datafieldcontrol id="HOL165" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
										IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
										FieldLabelText="65.  Caring for (child) puts a strain on me." FieldTextBoxTabIndex="67" DatabaseField="HOL165"
										ValidList="1,2,3,4,9"></def:datafieldcontrol></TD>
							</TR>
							<TR>
								<TD width="311">
									<def:datafieldcontrol id="HOL126" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
										IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
										FieldLabelText="26.  (child) knows the difference between strangers and fr" FieldTextBoxTabIndex="28"
										DatabaseField="HOL126" ValidList="1,2,3,4,9"></def:datafieldcontrol></TD>
								<TD>
									<def:datafieldcontrol id="HOL166" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
										IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
										FieldLabelText="66.  Members of our family get to do the same kinds of thi" FieldTextBoxTabIndex="68"
										DatabaseField="HOL166" ValidList="1,2,3,4,9"></def:datafieldcontrol></TD>
							</TR>
							<TR>
								<TD width="311">
									<def:datafieldcontrol id="HOL127" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
										IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
										FieldLabelText="27.  I am afraid that other members of the family will be " FieldTextBoxTabIndex="29"
										DatabaseField="HOL127" ValidList="1,2,3,4,9"></def:datafieldcontrol></TD>
								<TD>
									<def:datafieldcontrol id="HOL167" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
										IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
										FieldLabelText="67.  (child) embarrasses others in our family." FieldTextBoxTabIndex="69" DatabaseField="HOL167"
										ValidList="1,2,3,4,9"></def:datafieldcontrol></TD>
							</TR>
							<TR>
								<TD width="311">
									<def:datafieldcontrol id="HOL128" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
										IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
										FieldLabelText="28.  I avoid (child) taking out in public." FieldTextBoxTabIndex="30" DatabaseField="HOL128"
										ValidList="1,2,3,4,9"></def:datafieldcontrol></TD>
								<TD>
									<def:datafieldcontrol id="HOL168" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
										IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
										FieldLabelText="68.  The demands  (child) makes drives me out of my mind." FieldTextBoxTabIndex="70"
										DatabaseField="HOL168" ValidList="1,2,3,4,9"></def:datafieldcontrol></TD>
							</TR>
							<TR>
								<TD width="311">
									<def:datafieldcontrol id="HOL129" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
										IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
										FieldLabelText="29.  People simply don't understand what it is like to liv" FieldTextBoxTabIndex="31"
										DatabaseField="HOL129" ValidList="1,2,3,4,9"></def:datafieldcontrol></TD>
								<TD>
									<def:datafieldcontrol id="HOL169" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
										IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
										FieldLabelText="69.  My family understands the problems I have." FieldTextBoxTabIndex="71" DatabaseField="HOL169"
										ValidList="1,2,3,4,9"></def:datafieldcontrol></TD>
							</TR>
							<TR>
								<TD width="311">
									<def:datafieldcontrol id="HOL130" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
										IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
										FieldLabelText="30.  (child) can feed himself/herself." FieldTextBoxTabIndex="32" DatabaseField="HOL130"
										ValidList="1,2,3,4,9"></def:datafieldcontrol></TD>
								<TD>
									<def:datafieldcontrol id="HOL170" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
										IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
										FieldLabelText="70.  I often have the desire to protect (child)." FieldTextBoxTabIndex="72" DatabaseField="HOL170"
										ValidList="1,2,3,4,9"></def:datafieldcontrol></TD>
							</TR>
							<TR>
								<TD width="311">
									<def:datafieldcontrol id="HOL131" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
										IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
										FieldLabelText="31.  There have been no emotional problems for anyone in o" FieldTextBoxTabIndex="33"
										DatabaseField="HOL131" ValidList="1,2,3,4,9"></def:datafieldcontrol></TD>
								<TD>
									<def:datafieldcontrol id="HOL171" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
										IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
										FieldLabelText="71.  (child)'s care falls on me." FieldTextBoxTabIndex="73" DatabaseField="HOL171"
										ValidList="1,2,3,4,9"></def:datafieldcontrol></TD>
							</TR>
							<TR>
								<TD width="311">
									<def:datafieldcontrol id="HOL132" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
										IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
										FieldLabelText="32.  Our relatives have been helpful." FieldTextBoxTabIndex="34" DatabaseField="HOL132"
										ValidList="1,2,3,4,9"></def:datafieldcontrol></TD>
								<TD>
									<def:datafieldcontrol id="HOL172" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
										IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
										FieldLabelText="72.  No one can understand what I go through." FieldTextBoxTabIndex="74" DatabaseField="HOL172"
										ValidList="1,2,3,4,9"></def:datafieldcontrol></TD>
							</TR>
							<TR>
								<TD width="311">
									<def:datafieldcontrol id="HOL133" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
										IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
										FieldLabelText="33.  It is easier for me to do something for (child) than " FieldTextBoxTabIndex="35"
										DatabaseField="HOL133" ValidList="1,2,3,4,9"></def:datafieldcontrol></TD>
								<TD>
									<def:datafieldcontrol id="HOL173" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
										IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
										FieldLabelText="73.  All members of the family are involved in household c" FieldTextBoxTabIndex="75"
										DatabaseField="HOL173" ValidList="1,2,3,4,9"></def:datafieldcontrol></TD>
							</TR>
							<TR>
								<TD width="311">
									<def:datafieldcontrol id="HOL134" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
										IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
										FieldLabelText="34.  (child)  is easy to manage." FieldTextBoxTabIndex="36" DatabaseField="HOL134"
										ValidList="1,2,3,4,9"></def:datafieldcontrol></TD>
								<TD>
									<def:datafieldcontrol id="HOL174" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
										IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
										FieldLabelText="74.  (child) is irritable." FieldTextBoxTabIndex="76" DatabaseField="HOL174" ValidList="1,2,3,4,9"></def:datafieldcontrol></TD>
							</TR>
							<TR>
								<TD width="311">
									<def:datafieldcontrol id="HOL135" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
										IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
										FieldLabelText="35.  I feel that I must protect (child) from the remarks o" FieldTextBoxTabIndex="37"
										DatabaseField="HOL135" ValidList="1,2,3,4,9"></def:datafieldcontrol></TD>
								<TD>
									<def:datafieldcontrol id="HOL175" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
										IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
										FieldLabelText="75.  We have lost friends because of (child)." FieldTextBoxTabIndex="77" DatabaseField="HOL175"
										ValidList="1,2,3,4,9"></def:datafieldcontrol></TD>
							</TR>
							<TR>
								<TD width="311">
									<def:datafieldcontrol id="HOL136" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
										IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
										FieldLabelText="36.  I have difficulty in leaving the house because of (ch" FieldTextBoxTabIndex="38"
										DatabaseField="HOL136" ValidList="1,2,3,4,9"></def:datafieldcontrol></TD>
								<TD>
									<def:datafieldcontrol id="HOL176" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
										IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
										FieldLabelText="76.  I am worried much of the time." FieldTextBoxTabIndex="78" DatabaseField="HOL176"
										ValidList="1,2,3,4,9"></def:datafieldcontrol></TD>
							</TR>
							<TR>
								<TD width="311">
									<def:datafieldcontrol id="HOL137" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
										IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
										FieldLabelText="37.  The community is used to people like (child)." FieldTextBoxTabIndex="39" DatabaseField="HOL137"
										ValidList="1,2,3,4,9"></def:datafieldcontrol></TD>
								<TD>
									<def:datafieldcontrol id="HOL177" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
										IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
										FieldLabelText="77.  (child) 's needs come first." FieldTextBoxTabIndex="79" DatabaseField="HOL177"
										ValidList="1,2,3,4,9"></def:datafieldcontrol></TD>
							</TR>
							<TR>
								<TD width="311">
									<def:datafieldcontrol id="HOL138" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
										IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
										FieldLabelText="38.  Some friends are helpful when it comes to (child)." FieldTextBoxTabIndex="40"
										DatabaseField="HOL138" ValidList="1,2,3,4,9"></def:datafieldcontrol></TD>
								<TD>
									<def:datafieldcontrol id="HOL178" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
										IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
										FieldLabelText="78.  My spouse has a great deal of insight into (child)'s " FieldTextBoxTabIndex="80"
										DatabaseField="HOL178" ValidList="1,2,3,4,9"></def:datafieldcontrol></TD>
							</TR>
							<TR>
								<TD width="311">
									<def:datafieldcontrol id="HOL139" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
										IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
										FieldLabelText="39.  The family does as many things together now as we eve" FieldTextBoxTabIndex="41"
										DatabaseField="HOL139" ValidList="1,2,3,4,9"></def:datafieldcontrol></TD>
								<TD></TD>
							</TR>
							<TR>
								<TD width="311">
									<def:datafieldcontrol id="HOL140" runat="server" FieldTextBoxWidth="30px" FieldDataType="INT" IsInsertField="False"
										IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
										FieldLabelText="40.  (child) knows his/her address." FieldTextBoxTabIndex="42" DatabaseField="HOL140"
										ValidList="1,2,3,4,9"></def:datafieldcontrol></TD>
								<TD></TD>
							</TR>
						</TABLE>
						<def:datafieldcontrol id="HOL1CMNT" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="200px" FieldDataType="TEXT"
							IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False"
							IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText=" Comments" FieldTextBoxTabIndex="81"
							DatabaseField="HOL1CMNT" FieldTextBoxTextMode="MultiLine" FieldTextBoxHeight="150px" FieldTextBoxMaxLength="255"></def:datafieldcontrol>
						<BR>
						<TABLE class="layout" id="table_readonly">
							<TR>
								<TD>
									<def:datafieldcontrol id="created" runat="server" FieldLabelWidth="80px" FieldDataType="DATE" IsInsertField="False"
										IsInsertValueRequired="False" IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True"
										IsDoubleEntryField="False" FieldLabelText="created" FieldTextBoxTabIndex="84" DatabaseField="created"
										RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
							</TR>
							<TR>
								<TD>
									<def:datafieldcontrol id="createdBy" runat="server" FieldLabelWidth="80px" FieldDataType="TEXT" IsInsertField="False"
										IsInsertValueRequired="False" IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True"
										IsDoubleEntryField="False" FieldLabelText="createdBy" FieldTextBoxTabIndex="85" DatabaseField="createdBy"
										RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
							</TR>
							<TR>
								<TD>
									<def:datafieldcontrol id="updated" runat="server" FieldLabelWidth="80px" FieldDataType="DATE" IsInsertField="False"
										IsInsertValueRequired="False" IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True"
										IsDoubleEntryField="False" FieldLabelText="updated" FieldTextBoxTabIndex="86" DatabaseField="updated"
										RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
							</TR>
							<TR>
								<TD>
									<def:datafieldcontrol id="updatedBy" runat="server" FieldLabelWidth="80px" FieldDataType="TEXT" IsInsertField="False"
										IsInsertValueRequired="False" IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True"
										IsDoubleEntryField="False" FieldLabelText="updatedBy" FieldTextBoxTabIndex="87" DatabaseField="updatedBy"
										RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
							</TR>
						</TABLE>
					</asp:Panel>
</asp:Content>
