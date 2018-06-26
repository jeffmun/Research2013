<%@ Page language="c#" Inherits="GenericDataEntryForms.holroyd.holroyd" CodeFile="holroyd.aspx.cs"  MasterPageFile="~/UWAC.master" %>

<%@ Register TagPrefix="def" Namespace="DataEntryFramework" %>
<asp:Content ID="Content1" ContentPlaceHolderID="oBodyPlaceHolder" runat="server">
						<def:dataentrycontroller id="DataEntryController1" runat="server" DatabaseTable="all_holroyd" LookupField1="id"
							LookupTextBox2Visible="False" LookupTextBox1LabelText="Subject ID:" MeasureName="Parent Stress (Holroyd)"
							PrimaryKeyField="hol_pk" VerifiedField="verified" LookupField1DataType="TEXT" 
							AllowedStudyMeasures="198,274,275,359,421,491,492,509,510,794,802,1168,1169,1170,1229,1230,1448,1492,1527,1559,1591,1609,1610,1611,1714,1715,1735,1752,1794,1798,1888,1936,1945,2057"
							></def:dataentrycontroller>
						<table id="table_insert" class="layout">
							<tr>
								<td><def:datafieldcontrol id="TAPID" runat="server" FieldDataType="TEXT" IsInsertField="True" IsInsertValueRequired="True"
										IsEntryField="False" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="ID"
										FieldTextBoxTabIndex="1" DatabaseField="id" FieldTextBoxWidth="100px"></def:datafieldcontrol>
								</td>
							</tr>
						</table>
						<br>
						<asp:panel id="mainPanel" runat="server">
							<TABLE class="grid">
								<TR>
									<TD class="heading">Respondant</TD>
								</TR>
								<TR>
									<TD>0=Self/Subject<BR>
										1=Mother (bio, step, adoptive)<BR>
										2=Father (bio, step, adoptive)<BR>
										3=Primary Caregiver (specify below)<BR>
										4=Other (specify below)<BR>
										9=Missing/Unknown<BR>
										<def:datafieldcontrol id="HOLresp" runat="server" FieldTextBoxWidth="30px" DatabaseField="HOLresp" FieldTextBoxTabIndex="2"
											FieldLabelText="Respondant" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" FieldLabelWidth="130px"
											ValidList="0,1,2,3,4,9"></def:datafieldcontrol><BR>
										<def:datafieldcontrol id="HOLrespt" runat="server" FieldTextBoxWidth="200px" DatabaseField="HOLrespt"
											FieldTextBoxTabIndex="2" FieldLabelText="(specify if 3 or 4)" IsDoubleEntryField="False" IsReadOnly="False"
											IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="TEXT" FieldLabelWidth="130px"></def:datafieldcontrol><BR>
									</TD>
								</TR>
							</TABLE>
							<BR>
							<def:datafieldcontrol id="HOLdate" runat="server" FieldTextBoxWidth="100px" DatabaseField="HOLdate" FieldTextBoxTabIndex="3"
								FieldLabelText="Date" IsDoubleEntryField="False" IsReadOnly="False" IsEntryValueRequired="False" IsEntryField="True"
								IsInsertValueRequired="False" IsInsertField="False" FieldDataType="DATE" FormatString="{0:d}"></def:datafieldcontrol>
							<TABLE class="grid">
								<TR>
									<TD>1=Strong agreement<BR>
										2=Partial agreement<BR>
										3=Partial disagreement<BR>
										4=Strong disagreement<BR>
										9=Missing/Blank<BR>
									</TD>
								</TR>
							</TABLE>
							<BR>
							<TABLE class="grid" id="table_entry">
								<TR>
									<TD width="298">
										<def:datafieldcontrol id="HOL101" runat="server" FieldTextBoxWidth="40px" DatabaseField="HOL101" FieldTextBoxTabIndex="3"
											FieldLabelText="1.  (child) demands that others do things for him/her more" IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="1,2,3,4,9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="HOL141" runat="server" FieldTextBoxWidth="40px" DatabaseField="HOL141" FieldTextBoxTabIndex="43"
											FieldLabelText="41.  (child) is aware of who he/she is (for example, male," IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD width="298">
										<def:datafieldcontrol id="HOL102" runat="server" FieldTextBoxWidth="40px" DatabaseField="HOL102" FieldTextBoxTabIndex="4"
											FieldLabelText="2.  (child) understands the idea of time." IsDoubleEntryField="True" IsReadOnly="False"
											IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="1,2,3,4,9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="HOL142" runat="server" FieldTextBoxWidth="40px" DatabaseField="HOL142" FieldTextBoxTabIndex="44"
											FieldLabelText="42.  My spouse's poor understanding of (child)'s difficult" IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD width="298">
										<def:datafieldcontrol id="HOL103" runat="server" FieldTextBoxWidth="40px" DatabaseField="HOL103" FieldTextBoxTabIndex="5"
											FieldLabelText="3.  I have had to give up education (or a job) because of " IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="1,2,3,4,9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="HOL143" runat="server" FieldTextBoxWidth="40px" DatabaseField="HOL143" FieldTextBoxTabIndex="45"
											FieldLabelText="43.  I feel embarrassed because of (child) ." IsDoubleEntryField="True" IsReadOnly="False"
											IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD width="298">
										<def:datafieldcontrol id="HOL104" runat="server" FieldTextBoxWidth="40px" DatabaseField="HOL104" FieldTextBoxTabIndex="6"
											FieldLabelText="4.  Members of the family share in the care of (child)." IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="1,2,3,4,9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="HOL144" runat="server" FieldTextBoxWidth="40px" DatabaseField="HOL144" FieldTextBoxTabIndex="46"
											FieldLabelText="44.  Having to care for has enriched our family life." IsDoubleEntryField="True" IsReadOnly="False"
											IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD width="298">
										<def:datafieldcontrol id="HOL105" runat="server" FieldTextBoxWidth="40px" DatabaseField="HOL105" FieldTextBoxTabIndex="7"
											FieldLabelText="5.  Even if people don't look at (child), I am always wond" IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="1,2,3,4,9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="HOL145" runat="server" FieldTextBoxWidth="40px" DatabaseField="HOL145" FieldTextBoxTabIndex="47"
											FieldLabelText="45.  It makes me feel good to know I can take care of (chi" IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD width="298">
										<def:datafieldcontrol id="HOL106" runat="server" FieldTextBoxWidth="40px" DatabaseField="HOL106" FieldTextBoxTabIndex="8"
											FieldLabelText="6.  (child)  does not have problems with seeing or hearing" IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="1,2,3,4,9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="HOL146" runat="server" FieldTextBoxWidth="40px" DatabaseField="HOL146" FieldTextBoxTabIndex="48"
											FieldLabelText="46.  (child)  does not interfere with our family's enjoyme" IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD width="298">
										<def:datafieldcontrol id="HOL107" runat="server" FieldTextBoxWidth="40px" DatabaseField="HOL107" FieldTextBoxTabIndex="9"
											FieldLabelText="7.  I take on responsibility for (child)  because I know h" IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="1,2,3,4,9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="HOL147" runat="server" FieldTextBoxWidth="40px" DatabaseField="HOL147" FieldTextBoxTabIndex="49"
											FieldLabelText="47.  I do not have enough time to give the other members o" IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD width="298">
										<def:datafieldcontrol id="HOL108" runat="server" FieldTextBoxWidth="40px" DatabaseField="HOL108" FieldTextBoxTabIndex="10"
											FieldLabelText="8.  (child) has some unusual habits which draw attention." IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="1,2,3,4,9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="HOL148" runat="server" FieldTextBoxWidth="40px" DatabaseField="HOL148" FieldTextBoxTabIndex="50"
											FieldLabelText="48.  There are places where we can enjoy ourselves as a fa" IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD width="298">
										<def:datafieldcontrol id="HOL109" runat="server" FieldTextBoxWidth="40px" DatabaseField="HOL109" FieldTextBoxTabIndex="11"
											FieldLabelText="9.  A physician sees (child) at least once a month." IsDoubleEntryField="True" IsReadOnly="False"
											IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="1,2,3,4,9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="HOL149" runat="server" FieldTextBoxWidth="40px" DatabaseField="HOL149" FieldTextBoxTabIndex="51"
											FieldLabelText="49.  It is not hard to think of enough things to keep  (ch" IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD width="298">
										<def:datafieldcontrol id="HOL110" runat="server" FieldTextBoxWidth="40px" DatabaseField="HOL110" FieldTextBoxTabIndex="12"
											FieldLabelText="10.  The special opportunities needed by (child)  are avai" IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="1,2,3,4,9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="HOL150" runat="server" FieldTextBoxWidth="40px" DatabaseField="HOL150" FieldTextBoxTabIndex="52"
											FieldLabelText="50.  (child) is over-protected." IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD width="298">
										<def:datafieldcontrol id="HOL111" runat="server" FieldTextBoxWidth="40px" DatabaseField="HOL111" FieldTextBoxTabIndex="13"
											FieldLabelText="11.  I watch (child) to make sure he/she does not do physi" IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="1,2,3,4,9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="HOL151" runat="server" FieldTextBoxWidth="40px" DatabaseField="HOL151" FieldTextBoxTabIndex="53"
											FieldLabelText="51.  Some of our family do not bring friends into the home" IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD width="298">
										<def:datafieldcontrol id="HOL112" runat="server" FieldTextBoxWidth="40px" DatabaseField="HOL112" FieldTextBoxTabIndex="14"
											FieldLabelText="12.  (child) would be in no danger if he/she could get out" IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="1,2,3,4,9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="HOL152" runat="server" FieldTextBoxWidth="40px" DatabaseField="HOL152" FieldTextBoxTabIndex="54"
											FieldLabelText="52.  I participate in an organization for families who sha" IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD width="298">
										<def:datafieldcontrol id="HOL113" runat="server" FieldTextBoxWidth="40px" DatabaseField="HOL113" FieldTextBoxTabIndex="15"
											FieldLabelText="13.  I feel that our family situation will get better." IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="1,2,3,4,9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="HOL153" runat="server" FieldTextBoxWidth="40px" DatabaseField="HOL153" FieldTextBoxTabIndex="55"
											FieldLabelText="53.  If I were healthier it would be easier to care for (c" IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD width="298">
										<def:datafieldcontrol id="HOL114" runat="server" FieldTextBoxWidth="40px" DatabaseField="HOL114" FieldTextBoxTabIndex="16"
											FieldLabelText="14.  Medicine does not have to be given to (child) ." IsDoubleEntryField="True" IsReadOnly="False"
											IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="1,2,3,4,9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="HOL154" runat="server" FieldTextBoxWidth="40px" DatabaseField="HOL154" FieldTextBoxTabIndex="56"
											FieldLabelText="54.  People in public places indicate they don't want (chi" IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD width="298">
										<def:datafieldcontrol id="HOL115" runat="server" FieldTextBoxWidth="40px" DatabaseField="HOL115" FieldTextBoxTabIndex="17"
											FieldLabelText="15.  (child)  doesn't communicate with others of his/her a" IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="1,2,3,4,9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="HOL155" runat="server" FieldTextBoxWidth="40px" DatabaseField="HOL155" FieldTextBoxTabIndex="57"
											FieldLabelText="55.  (child)  can get around the neighborhood quite nicely" IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD width="298">
										<def:datafieldcontrol id="HOL116" runat="server" FieldTextBoxWidth="40px" DatabaseField="HOL116" FieldTextBoxTabIndex="18"
											FieldLabelText="16.  Other members of the family have to do without things" IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="1,2,3,4,9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="HOL156" runat="server" FieldTextBoxWidth="40px" DatabaseField="HOL156" FieldTextBoxTabIndex="58"
											FieldLabelText="56.  I have enough time to myself." IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD width="298">
										<def:datafieldcontrol id="HOL117" runat="server" FieldTextBoxWidth="40px" DatabaseField="HOL117" FieldTextBoxTabIndex="19"
											FieldLabelText="17.  (child)'s problems or illness do not stand in the way" IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="1,2,3,4,9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="HOL157" runat="server" FieldTextBoxWidth="40px" DatabaseField="HOL157" FieldTextBoxTabIndex="59"
											FieldLabelText="57.  I have too much responsibility." IsDoubleEntryField="True" IsReadOnly="False"
											IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="1,2,3,4,9" FieldTextBoxTextMode="SingleLine"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD width="298">
										<def:datafieldcontrol id="HOL118" runat="server" FieldTextBoxWidth="40px" DatabaseField="HOL118" FieldTextBoxTabIndex="20"
											FieldLabelText="18.  When others are around (child) I cannot relax; I am a" IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="1,2,3,4,9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="HOL158" runat="server" FieldTextBoxWidth="40px" DatabaseField="HOL158" FieldTextBoxTabIndex="60"
											FieldLabelText="58.  I am afraid that as (child)  gets older it will be ha" IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="1,2,3,4,9" FieldTextBoxTextMode="SingleLine"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD width="298">
										<def:datafieldcontrol id="HOL119" runat="server" FieldTextBoxWidth="40px" DatabaseField="HOL119" FieldTextBoxTabIndex="21"
											FieldLabelText="19.  Professionals (nurses, etc.) in an institution would " IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="1,2,3,4,9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="HOL159" runat="server" FieldTextBoxWidth="40px" DatabaseField="HOL159" FieldTextBoxTabIndex="61"
											FieldLabelText="59.  It is easy to keep (child) entertained." IsDoubleEntryField="True" IsReadOnly="False"
											IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="1,2,3,4,9" FieldTextBoxTextMode="SingleLine"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD width="298">
										<def:datafieldcontrol id="HOL120" runat="server" FieldTextBoxWidth="40px" DatabaseField="HOL120" FieldTextBoxTabIndex="22"
											FieldLabelText="20.  I worry about what will happen to (child) when I can " IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="1,2,3,4,9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="HOL160" runat="server" FieldTextBoxWidth="40px" DatabaseField="HOL160" FieldTextBoxTabIndex="62"
											FieldLabelText="60.  (child) wants to do things for himself/herself." IsDoubleEntryField="True" IsReadOnly="False"
											IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="1,2,3,4,9" FieldTextBoxTextMode="SingleLine"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD width="298">
										<def:datafieldcontrol id="HOL121" runat="server" FieldTextBoxWidth="40px" DatabaseField="HOL121" FieldTextBoxTabIndex="23"
											FieldLabelText="21.  I would rather be caring for  (child) than doing some" IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="1,2,3,4,9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="HOL161" runat="server" FieldTextBoxWidth="40px" DatabaseField="HOL161" FieldTextBoxTabIndex="63"
											FieldLabelText="61.  I feel sad when I think of (child)." IsDoubleEntryField="True" IsReadOnly="False"
											IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="1,2,3,4,9" FieldTextBoxTextMode="SingleLine"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD width="298">
										<def:datafieldcontrol id="HOL122" runat="server" FieldTextBoxWidth="40px" DatabaseField="HOL122" FieldTextBoxTabIndex="24"
											FieldLabelText="22.  I have given up things I have really wanted to do in " IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="1,2,3,4,9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="HOL162" runat="server" FieldTextBoxWidth="40px" DatabaseField="HOL162" FieldTextBoxTabIndex="64"
											FieldLabelText="62.  The demands to care for (child) limit my growth and d" IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="1,2,3,4,9" FieldTextBoxTextMode="SingleLine"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD width="298">
										<def:datafieldcontrol id="HOL123" runat="server" FieldTextBoxWidth="40px" DatabaseField="HOL123" FieldTextBoxTabIndex="25"
											FieldLabelText="23.  (child)  is able to fit into the family social group." IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="1,2,3,4,9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="HOL163" runat="server" FieldTextBoxWidth="40px" DatabaseField="HOL163" FieldTextBoxTabIndex="65"
											FieldLabelText="63.  I have become more understanding in my relationships " IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="1,2,3,4,9" FieldTextBoxTextMode="SingleLine"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD width="298">
										<def:datafieldcontrol id="HOL124" runat="server" FieldTextBoxWidth="40px" DatabaseField="HOL124" FieldTextBoxTabIndex="26"
											FieldLabelText="24.  Some members of my family don't like the way I do thi" IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="1,2,3,4,9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="HOL164" runat="server" FieldTextBoxWidth="40px" DatabaseField="HOL164" FieldTextBoxTabIndex="66"
											FieldLabelText="64.  Our family should do more together." IsDoubleEntryField="True" IsReadOnly="False"
											IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="1,2,3,4,9" FieldTextBoxTextMode="SingleLine"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD width="298">
										<def:datafieldcontrol id="HOL125" runat="server" FieldTextBoxWidth="40px" DatabaseField="HOL125" FieldTextBoxTabIndex="27"
											FieldLabelText="25.  It appears to me that it doesn't make any difference " IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="1,2,3,4,9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="HOL165" runat="server" FieldTextBoxWidth="40px" DatabaseField="HOL165" FieldTextBoxTabIndex="67"
											FieldLabelText="65.  Caring for (child) puts a strain on me." IsDoubleEntryField="True" IsReadOnly="False"
											IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="1,2,3,4,9" FieldTextBoxTextMode="SingleLine"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD width="298">
										<def:datafieldcontrol id="HOL126" runat="server" FieldTextBoxWidth="40px" DatabaseField="HOL126" FieldTextBoxTabIndex="28"
											FieldLabelText="26.  (child) knows the difference between strangers and fr" IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="1,2,3,4,9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="HOL166" runat="server" FieldTextBoxWidth="40px" DatabaseField="HOL166" FieldTextBoxTabIndex="68"
											FieldLabelText="66.  Members of our family get to do the same kinds of thi" IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="1,2,3,4,9" FieldTextBoxTextMode="SingleLine"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD width="298">
										<def:datafieldcontrol id="HOL127" runat="server" FieldTextBoxWidth="40px" DatabaseField="HOL127" FieldTextBoxTabIndex="29"
											FieldLabelText="27.  I am afraid that other members of the family will be " IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="1,2,3,4,9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="HOL167" runat="server" FieldTextBoxWidth="40px" DatabaseField="HOL167" FieldTextBoxTabIndex="69"
											FieldLabelText="67.  (child) embarrasses others in our family." IsDoubleEntryField="True" IsReadOnly="False"
											IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="1,2,3,4,9" FieldTextBoxTextMode="SingleLine"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD width="298">
										<def:datafieldcontrol id="HOL128" runat="server" FieldTextBoxWidth="40px" DatabaseField="HOL128" FieldTextBoxTabIndex="30"
											FieldLabelText="28.  I avoid (child) taking out in public." IsDoubleEntryField="True" IsReadOnly="False"
											IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="1,2,3,4,9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="HOL168" runat="server" FieldTextBoxWidth="40px" DatabaseField="HOL168" FieldTextBoxTabIndex="70"
											FieldLabelText="68.  The demands  (child) makes drives me out of my mind." IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="1,2,3,4,9" FieldTextBoxTextMode="SingleLine"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD width="298">
										<def:datafieldcontrol id="HOL129" runat="server" FieldTextBoxWidth="40px" DatabaseField="HOL129" FieldTextBoxTabIndex="31"
											FieldLabelText="29.  People simply don't understand what it is like to liv" IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="1,2,3,4,9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="HOL169" runat="server" FieldTextBoxWidth="40px" DatabaseField="HOL169" FieldTextBoxTabIndex="71"
											FieldLabelText="69.  My family understands the problems I have." IsDoubleEntryField="True" IsReadOnly="False"
											IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="1,2,3,4,9" FieldTextBoxTextMode="SingleLine"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD width="298">
										<def:datafieldcontrol id="HOL130" runat="server" FieldTextBoxWidth="40px" DatabaseField="HOL130" FieldTextBoxTabIndex="32"
											FieldLabelText="30.  (child) can feed himself/herself." IsDoubleEntryField="True" IsReadOnly="False"
											IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="1,2,3,4,9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="HOL170" runat="server" FieldTextBoxWidth="40px" DatabaseField="HOL170" FieldTextBoxTabIndex="72"
											FieldLabelText="70.  I often have the desire to protect (child)." IsDoubleEntryField="True" IsReadOnly="False"
											IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="1,2,3,4,9" FieldTextBoxTextMode="SingleLine"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD width="298">
										<def:datafieldcontrol id="HOL131" runat="server" FieldTextBoxWidth="40px" DatabaseField="HOL131" FieldTextBoxTabIndex="33"
											FieldLabelText="31.  There have been no emotional problems for anyone in o" IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="1,2,3,4,9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="HOL171" runat="server" FieldTextBoxWidth="40px" DatabaseField="HOL171" FieldTextBoxTabIndex="73"
											FieldLabelText="71.  (child)'s care falls on me." IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,9"
											FieldTextBoxTextMode="SingleLine"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD width="298">
										<def:datafieldcontrol id="HOL132" runat="server" FieldTextBoxWidth="40px" DatabaseField="HOL132" FieldTextBoxTabIndex="34"
											FieldLabelText="32.  Our relatives have been helpful." IsDoubleEntryField="True" IsReadOnly="False"
											IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="1,2,3,4,9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="HOL172" runat="server" FieldTextBoxWidth="40px" DatabaseField="HOL172" FieldTextBoxTabIndex="74"
											FieldLabelText="72.  No one can understand what I go through." IsDoubleEntryField="True" IsReadOnly="False"
											IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="1,2,3,4,9" FieldTextBoxTextMode="SingleLine"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD width="298">
										<def:datafieldcontrol id="HOL133" runat="server" FieldTextBoxWidth="40px" DatabaseField="HOL133" FieldTextBoxTabIndex="35"
											FieldLabelText="33.  It is easier for me to do something for (child) than " IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="1,2,3,4,9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="HOL173" runat="server" FieldTextBoxWidth="40px" DatabaseField="HOL173" FieldTextBoxTabIndex="75"
											FieldLabelText="73.  All members of the family are involved in household c" IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="1,2,3,4,9" FieldTextBoxTextMode="SingleLine"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD width="298">
										<def:datafieldcontrol id="HOL134" runat="server" FieldTextBoxWidth="40px" DatabaseField="HOL134" FieldTextBoxTabIndex="36"
											FieldLabelText="34.  (child)  is easy to manage." IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="HOL174" runat="server" FieldTextBoxWidth="40px" DatabaseField="HOL174" FieldTextBoxTabIndex="76"
											FieldLabelText="74.  (child) is irritable." IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,9"
											FieldTextBoxTextMode="SingleLine"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD width="298">
										<def:datafieldcontrol id="HOL135" runat="server" FieldTextBoxWidth="40px" DatabaseField="HOL135" FieldTextBoxTabIndex="37"
											FieldLabelText="35.  I feel that I must protect (child) from the remarks o" IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="1,2,3,4,9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="HOL175" runat="server" FieldTextBoxWidth="40px" DatabaseField="HOL175" FieldTextBoxTabIndex="77"
											FieldLabelText="75.  We have lost friends because of (child)." IsDoubleEntryField="True" IsReadOnly="False"
											IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="1,2,3,4,9" FieldTextBoxTextMode="SingleLine"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD width="298">
										<def:datafieldcontrol id="HOL136" runat="server" FieldTextBoxWidth="40px" DatabaseField="HOL136" FieldTextBoxTabIndex="38"
											FieldLabelText="36.  I have difficulty in leaving the house because of (ch" IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="1,2,3,4,9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="HOL176" runat="server" FieldTextBoxWidth="40px" DatabaseField="HOL176" FieldTextBoxTabIndex="78"
											FieldLabelText="76.  I am worried much of the time." IsDoubleEntryField="True" IsReadOnly="False"
											IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="1,2,3,4,9" FieldTextBoxTextMode="SingleLine"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD width="298">
										<def:datafieldcontrol id="HOL137" runat="server" FieldTextBoxWidth="40px" DatabaseField="HOL137" FieldTextBoxTabIndex="39"
											FieldLabelText="37.  The community is used to people like (child)." IsDoubleEntryField="True" IsReadOnly="False"
											IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="1,2,3,4,9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="HOL177" runat="server" FieldTextBoxWidth="40px" DatabaseField="HOL177" FieldTextBoxTabIndex="79"
											FieldLabelText="77.  (child) 's needs come first." IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,9"
											FieldTextBoxTextMode="SingleLine"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD width="298">
										<def:datafieldcontrol id="HOL138" runat="server" FieldTextBoxWidth="40px" DatabaseField="HOL138" FieldTextBoxTabIndex="40"
											FieldLabelText="38.  Some friends are helpful when it comes to (child)." IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="1,2,3,4,9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="HOL178" runat="server" FieldTextBoxWidth="40px" DatabaseField="HOL178" FieldTextBoxTabIndex="80"
											FieldLabelText="78.  My spouse has a great deal of insight into (child)'s " IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="1,2,3,4,9" FieldTextBoxTextMode="SingleLine"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD width="298">
										<def:datafieldcontrol id="HOL139" runat="server" FieldTextBoxWidth="40px" DatabaseField="HOL139" FieldTextBoxTabIndex="41"
											FieldLabelText="39.  The family does as many things together now as we eve" IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="1,2,3,4,9"></def:datafieldcontrol></TD>
									<TD></TD>
								</TR>
								<TR>
									<TD width="298">
										<def:datafieldcontrol id="HOL140" runat="server" FieldTextBoxWidth="40px" DatabaseField="HOL140" FieldTextBoxTabIndex="42"
											FieldLabelText="40.  (child) knows his/her address." IsDoubleEntryField="True" IsReadOnly="False"
											IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="1,2,3,4,9"></def:datafieldcontrol></TD>
									<TD></TD>
								</TR>
							</TABLE>
							<def:datafieldcontrol id="HOL1CMNT" runat="server" FieldTextBoxWidth="200px" DatabaseField="HOL1CMNT"
								FieldTextBoxTabIndex="81" FieldLabelText=" Comments" IsDoubleEntryField="False" IsReadOnly="False"
								IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
								FieldDataType="TEXT" FieldTextBoxTextMode="MultiLine" FieldTextBoxMaxLength="255" FieldTextBoxHeight="150px"></def:datafieldcontrol>
							<BR>
							<BR>
							<TABLE class="layout" id="table_readonly">
								<TR>
									<TD>
										<def:datafieldcontrol id="created" runat="server" DatabaseField="created" FieldTextBoxTabIndex="84" FieldLabelText="created"
											IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="DATE" FieldLabelWidth="80px" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="createdBy" runat="server" DatabaseField="createdBy" FieldTextBoxTabIndex="85"
											FieldLabelText="createdBy" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT" FieldLabelWidth="80px"
											RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="updated" runat="server" DatabaseField="updated" FieldTextBoxTabIndex="86" FieldLabelText="updated"
											IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="DATE" FieldLabelWidth="80px" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="updatedBy" runat="server" DatabaseField="updatedBy" FieldTextBoxTabIndex="87"
											FieldLabelText="updatedBy" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT" FieldLabelWidth="80px"
											RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
						</asp:panel>
					</asp:Content>
