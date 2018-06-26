
<%@ Register TagPrefix="def" Namespace="DataEntryFramework3" %> 
 
<%@ Page language="c#" Debug="true" MasterPageFile="~/UWAC.master"  Title="SSQ Data Entry"  %>
<asp:Content ID="Content1" ContentPlaceHolderID="oBodyPlaceHolder" runat="server">

<def:dataentrycontroller id="DataEntryController1" runat="server" DatabaseTable="ALL_SSQ"  PrimaryKeyField="ssq_pk">
</def:dataentrycontroller>


						<table id="table_insert" class="layout">
							<tr>
								<td><def:datafieldcontrol id="ID" runat="server" FieldDataType="TEXT" IsInsertField="True" IsInsertValueRequired="True"
										IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="ID"
										FieldTextBoxTabIndex="1" DatabaseField="id" FieldLabelWidth="80px" FieldTextBoxWidth="80px"></def:datafieldcontrol>
								</td>
							</tr>
							<tr>
								<td><def:datafieldcontrol id="SOC1DATE" runat="server" FieldDataType="DATE" IsInsertField="False" IsInsertValueRequired="False"
										IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="Date"
										FieldTextBoxTabIndex="2" DatabaseField="SOC1DATE" FormatString="{0:d}" FieldLabelWidth="80px" FieldTextBoxWidth="80px"></def:datafieldcontrol>
								</td>
							</tr>
						</table>
						<asp:Panel Runat="server" ID="mainPanel">
							<TABLE class="grid">
								<TR>
									<TD class="heading">Respondant</TD>
								</TR>
								<TR>
									<TD>1=Mother (bio, step, adoptive)<BR>
										2=Father (bio, step, adoptive)<BR>
										3=Primary Caregiver (specify below)<BR>
										4=Other (specify below)<BR>
										9=Missing/Unknown<BR>
										<def:datafieldcontrol id="SOC1Resp" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="130px" DatabaseField="SOC1Resp"
											FieldTextBoxTabIndex="2" FieldLabelText="Respondant" IsDoubleEntryField="True" IsReadOnly="False"
											IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="1,2,3,4,9"></def:datafieldcontrol><BR>
										<def:datafieldcontrol id="SOC1Rest" runat="server" FieldTextBoxWidth="200px" FieldLabelWidth="130px" DatabaseField="SOC1Rest"
											FieldTextBoxTabIndex="2" FieldLabelText="(specify if 3 or 4)" IsDoubleEntryField="False" IsReadOnly="False"
											IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="TEXT"></def:datafieldcontrol><BR>
									</TD>
								</TR>
							</TABLE>
							<BR>
							<TABLE class="grid">
								<TR>
									<TD class="heading" colSpan="2">1. Whom can you really count on to be dependable 
										when you need help?
									</TD>
								</TR>
								<TR>
									<TD>Initials</TD>
									<TD>Relationship Type</TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="SOC11num" runat="server" FieldTextBoxWidth="50px" DatabaseField="SOC11num" FieldTextBoxTabIndex="4"
											FieldLabelText="Dependable: # of people" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" MinVal="0"
											MaxVal="9"></def:datafieldcontrol></TD>
									<TD>1=Spouse<BR>
										2=Mother<BR>
										3=Father<BR>
										4=Relative<BR>
										5=Friend<BR>
										6=Coworker<BR>
										7=Employer<BR>
										8=Other<BR>
										9=Missing/Blank</TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="SOC11A" runat="server" FieldTextBoxWidth="50px" DatabaseField="SOC11A" FieldTextBoxTabIndex="5"
											FieldLabelText="Dependable: Person 1" IsDoubleEntryField="False" IsReadOnly="False" IsEntryValueRequired="False"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="SOC11AT" runat="server" FieldTextBoxWidth="50px" DatabaseField="SOC11AT" FieldTextBoxTabIndex="14"
											FieldLabelText="SOC11AT" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,6,7,8,9"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="SOC11B" runat="server" FieldTextBoxWidth="50px" DatabaseField="SOC11B" FieldTextBoxTabIndex="6"
											FieldLabelText="Dependable: Person 2" IsDoubleEntryField="False" IsReadOnly="False" IsEntryValueRequired="False"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="SOC11BT" runat="server" FieldTextBoxWidth="50px" DatabaseField="SOC11BT" FieldTextBoxTabIndex="15"
											FieldLabelText="SOC11BT" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,6,7,8,9"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="SOC11C" runat="server" FieldTextBoxWidth="50px" DatabaseField="SOC11C" FieldTextBoxTabIndex="7"
											FieldLabelText="Dependable: Person 3" IsDoubleEntryField="False" IsReadOnly="False" IsEntryValueRequired="False"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="SOC11CT" runat="server" FieldTextBoxWidth="50px" DatabaseField="SOC11CT" FieldTextBoxTabIndex="16"
											FieldLabelText="SOC11CT" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,6,7,8,9"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="SOC11D" runat="server" FieldTextBoxWidth="50px" DatabaseField="SOC11D" FieldTextBoxTabIndex="8"
											FieldLabelText="Dependable: Person 4" IsDoubleEntryField="False" IsReadOnly="False" IsEntryValueRequired="False"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="SOC11DT" runat="server" FieldTextBoxWidth="50px" DatabaseField="SOC11DT" FieldTextBoxTabIndex="17"
											FieldLabelText="SOC11DT" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,6,7,8,9"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="SOC11E" runat="server" FieldTextBoxWidth="50px" DatabaseField="SOC11E" FieldTextBoxTabIndex="9"
											FieldLabelText="Dependable: Person 5" IsDoubleEntryField="False" IsReadOnly="False" IsEntryValueRequired="False"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="SOC11ET" runat="server" FieldTextBoxWidth="50px" DatabaseField="SOC11ET" FieldTextBoxTabIndex="18"
											FieldLabelText="SOC11ET" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,6,7,8,9"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="SOC11F" runat="server" FieldTextBoxWidth="50px" DatabaseField="SOC11F" FieldTextBoxTabIndex="10"
											FieldLabelText="Dependable: Person 6" IsDoubleEntryField="False" IsReadOnly="False" IsEntryValueRequired="False"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="SOC11FT" runat="server" FieldTextBoxWidth="50px" DatabaseField="SOC11FT" FieldTextBoxTabIndex="19"
											FieldLabelText="SOC11FT" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,6,7,8,9"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="SOC11G" runat="server" FieldTextBoxWidth="50px" DatabaseField="SOC11G" FieldTextBoxTabIndex="11"
											FieldLabelText="Dependable: Person 7" IsDoubleEntryField="False" IsReadOnly="False" IsEntryValueRequired="False"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="SOC11GT" runat="server" FieldTextBoxWidth="50px" DatabaseField="SOC11GT" FieldTextBoxTabIndex="20"
											FieldLabelText="SOC11GT" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,6,7,8,9"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="SOC11H" runat="server" FieldTextBoxWidth="50px" DatabaseField="SOC11H" FieldTextBoxTabIndex="12"
											FieldLabelText="Dependable: Person 8" IsDoubleEntryField="False" IsReadOnly="False" IsEntryValueRequired="False"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="SOC11HT" runat="server" FieldTextBoxWidth="50px" DatabaseField="SOC11HT" FieldTextBoxTabIndex="21"
											FieldLabelText="SOC11HT" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,6,7,8,9"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="SOC11I" runat="server" FieldTextBoxWidth="50px" DatabaseField="SOC11I" FieldTextBoxTabIndex="13"
											FieldLabelText="Dependable: Person 9" IsDoubleEntryField="False" IsReadOnly="False" IsEntryValueRequired="False"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="SOC11IT" runat="server" FieldTextBoxWidth="50px" DatabaseField="SOC11IT" FieldTextBoxTabIndex="22"
											FieldLabelText="SOC11IT" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,6,7,8,9"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD class="heading" colSpan="2">2. How Satisfied?
									</TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="SOC11SA" runat="server" FieldTextBoxWidth="50px" DatabaseField="SOC11SA" FieldTextBoxTabIndex="23"
											FieldLabelText="Dependable: How Satisfied?" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,6,9"></def:datafieldcontrol></TD>
									<TD>1=Very Dissatisfied<BR>
										2=Fairly Dissatisfied<BR>
										3=A Little Dissatisfied<BR>
										4=A Little Satisfied<BR>
										5=Fairly Satisfied<BR>
										6=Very Satisfied<BR>
										9=Missing/Blank</TD>
								</TR>
							</TABLE>
							<BR>
							<TABLE class="grid">
								<TR>
									<TD class="heading" colSpan="2">3. Whom can you really count on to help you feel 
										more relaxed when you are under pressure or tense?
									</TD>
								</TR>
								<TR>
									<TD width="239">Initials</TD>
									<TD>Relationship Type</TD>
								</TR>
								<TR>
									<TD width="239">
										<def:datafieldcontrol id="SOC12num" runat="server" FieldTextBoxWidth="50px" DatabaseField="SOC12num" FieldTextBoxTabIndex="24"
											FieldLabelText="Help Relax: # of people" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" MinVal="0"
											MaxVal="9"></def:datafieldcontrol></TD>
									<TD>1=Spouse<BR>
										2=Mother<BR>
										3=Father<BR>
										4=Relative<BR>
										5=Friend<BR>
										6=Coworker<BR>
										7=Employer<BR>
										8=Other<BR>
										9=Missing/Blank</TD>
								</TR>
								<TR>
									<TD width="239">
										<def:datafieldcontrol id="SOC12A" runat="server" FieldTextBoxWidth="50px" DatabaseField="SOC12A" FieldTextBoxTabIndex="25"
											FieldLabelText="Help Relax: Person 1" IsDoubleEntryField="False" IsReadOnly="False" IsEntryValueRequired="False"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="SOC12AT" runat="server" FieldTextBoxWidth="50px" DatabaseField="SOC12AT" FieldTextBoxTabIndex="34"
											FieldLabelText="SOC12AT" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,6,7,8,9"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD width="239">
										<def:datafieldcontrol id="SOC12B" runat="server" FieldTextBoxWidth="50px" DatabaseField="SOC12B" FieldTextBoxTabIndex="26"
											FieldLabelText="Help Relax: Person 2" IsDoubleEntryField="False" IsReadOnly="False" IsEntryValueRequired="False"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="SOC12BT" runat="server" FieldTextBoxWidth="50px" DatabaseField="SOC12BT" FieldTextBoxTabIndex="35"
											FieldLabelText="SOC12BT" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,6,7,8,9"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD width="239">
										<def:datafieldcontrol id="SOC12C" runat="server" FieldTextBoxWidth="50px" DatabaseField="SOC12C" FieldTextBoxTabIndex="27"
											FieldLabelText="Help Relax: Person 3" IsDoubleEntryField="False" IsReadOnly="False" IsEntryValueRequired="False"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="SOC12CT" runat="server" FieldTextBoxWidth="50px" DatabaseField="SOC12CT" FieldTextBoxTabIndex="36"
											FieldLabelText="SOC12CT" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,6,7,8,9"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD width="239">
										<def:datafieldcontrol id="SOC12D" runat="server" FieldTextBoxWidth="50px" DatabaseField="SOC12D" FieldTextBoxTabIndex="28"
											FieldLabelText="Help Relax: Person 4" IsDoubleEntryField="False" IsReadOnly="False" IsEntryValueRequired="False"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="SOC12DT" runat="server" FieldTextBoxWidth="50px" DatabaseField="SOC12DT" FieldTextBoxTabIndex="37"
											FieldLabelText="SOC12DT" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,6,7,8,9"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD width="239">
										<def:datafieldcontrol id="SOC12E" runat="server" FieldTextBoxWidth="50px" DatabaseField="SOC12E" FieldTextBoxTabIndex="29"
											FieldLabelText="Help Relax: Person 5" IsDoubleEntryField="False" IsReadOnly="False" IsEntryValueRequired="False"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="SOC12ET" runat="server" FieldTextBoxWidth="50px" DatabaseField="SOC12ET" FieldTextBoxTabIndex="38"
											FieldLabelText="SOC12ET" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,6,7,8,9"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD width="239">
										<def:datafieldcontrol id="SOC12F" runat="server" FieldTextBoxWidth="50px" DatabaseField="SOC12F" FieldTextBoxTabIndex="30"
											FieldLabelText="Help Relax: Person 6" IsDoubleEntryField="False" IsReadOnly="False" IsEntryValueRequired="False"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="SOC12FT" runat="server" FieldTextBoxWidth="50px" DatabaseField="SOC12FT" FieldTextBoxTabIndex="39"
											FieldLabelText="SOC12FT" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,6,7,8,9"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD width="239">
										<def:datafieldcontrol id="SOC12G" runat="server" FieldTextBoxWidth="50px" DatabaseField="SOC12G" FieldTextBoxTabIndex="31"
											FieldLabelText="Help Relax: Person 7" IsDoubleEntryField="False" IsReadOnly="False" IsEntryValueRequired="False"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="SOC12GT" runat="server" FieldTextBoxWidth="50px" DatabaseField="SOC12GT" FieldTextBoxTabIndex="40"
											FieldLabelText="SOC12GT" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,6,7,8,9"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD width="239">
										<def:datafieldcontrol id="SOC12H" runat="server" FieldTextBoxWidth="50px" DatabaseField="SOC12H" FieldTextBoxTabIndex="32"
											FieldLabelText="Help Relax: Person 8" IsDoubleEntryField="False" IsReadOnly="False" IsEntryValueRequired="False"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="SOC12HT" runat="server" FieldTextBoxWidth="50px" DatabaseField="SOC12HT" FieldTextBoxTabIndex="41"
											FieldLabelText="SOC12HT" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,6,7,8,9"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD width="239">
										<def:datafieldcontrol id="SOC12I" runat="server" FieldTextBoxWidth="50px" DatabaseField="SOC12I" FieldTextBoxTabIndex="33"
											FieldLabelText="Help Relax: Person 9" IsDoubleEntryField="False" IsReadOnly="False" IsEntryValueRequired="False"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="SOC12IT" runat="server" FieldTextBoxWidth="50px" DatabaseField="SOC12IT" FieldTextBoxTabIndex="42"
											FieldLabelText="SOC12IT" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,6,7,8,9"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD class="heading" colSpan="2">4. How Satisfied?
									</TD>
								</TR>
								<TR>
									<TD width="239">
										<def:datafieldcontrol id="SOC12SA" runat="server" FieldTextBoxWidth="50px" DatabaseField="SOC12SA" FieldTextBoxTabIndex="43"
											FieldLabelText="Help Relax: How Satisfied?" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,6,9"></def:datafieldcontrol></TD>
									<TD>1=Very Dissatisfied<BR>
										2=Fairly Dissatisfied<BR>
										3=A Little Dissatisfied<BR>
										4=A Little Satisfied<BR>
										5=Fairly Satisfied<BR>
										6=Very Satisfied<BR>
										9=Missing/Blank</TD>
								</TR>
							</TABLE>
							<BR>
							<TABLE class="grid">
								<TR>
									<TD class="heading" colSpan="2">5. Who accepts you totally, including both your 
										worst and your best points?
									</TD>
								</TR>
								<TR>
									<TD>Initials</TD>
									<TD>Relationship Type</TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="SOC13num" runat="server" FieldTextBoxWidth="50px" DatabaseField="SOC13num" FieldTextBoxTabIndex="44"
											FieldLabelText="Accepting: # of people" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" MinVal="0"
											MaxVal="9"></def:datafieldcontrol></TD>
									<TD>1=Spouse<BR>
										2=Mother<BR>
										3=Father<BR>
										4=Relative<BR>
										5=Friend<BR>
										6=Coworker<BR>
										7=Employer<BR>
										8=Other<BR>
										9=Missing/Blank</TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="SOC13A" runat="server" FieldTextBoxWidth="50px" DatabaseField="SOC13A" FieldTextBoxTabIndex="45"
											FieldLabelText="Accepting: Person 1" IsDoubleEntryField="False" IsReadOnly="False" IsEntryValueRequired="False"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="SOC13AT" runat="server" FieldTextBoxWidth="50px" DatabaseField="SOC13AT" FieldTextBoxTabIndex="54"
											FieldLabelText="SOC13AT" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,6,7,8,9"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="SOC13B" runat="server" FieldTextBoxWidth="50px" DatabaseField="SOC13B" FieldTextBoxTabIndex="46"
											FieldLabelText="Accepting: Person 2" IsDoubleEntryField="False" IsReadOnly="False" IsEntryValueRequired="False"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="SOC13BT" runat="server" FieldTextBoxWidth="50px" DatabaseField="SOC13BT" FieldTextBoxTabIndex="55"
											FieldLabelText="SOC13BT" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,6,7,8,9"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="SOC13C" runat="server" FieldTextBoxWidth="50px" DatabaseField="SOC13C" FieldTextBoxTabIndex="47"
											FieldLabelText="Accepting: Person 3" IsDoubleEntryField="False" IsReadOnly="False" IsEntryValueRequired="False"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="SOC13CT" runat="server" FieldTextBoxWidth="50px" DatabaseField="SOC13CT" FieldTextBoxTabIndex="56"
											FieldLabelText="SOC13CT" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,6,7,8,9"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="SOC13D" runat="server" FieldTextBoxWidth="50px" DatabaseField="SOC13D" FieldTextBoxTabIndex="48"
											FieldLabelText="Accepting: Person 4" IsDoubleEntryField="False" IsReadOnly="False" IsEntryValueRequired="False"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="SOC13DT" runat="server" FieldTextBoxWidth="50px" DatabaseField="SOC13DT" FieldTextBoxTabIndex="57"
											FieldLabelText="SOC13DT" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,6,7,8,9"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="SOC13E" runat="server" FieldTextBoxWidth="50px" DatabaseField="SOC13E" FieldTextBoxTabIndex="49"
											FieldLabelText="Accepting: Person 5" IsDoubleEntryField="False" IsReadOnly="False" IsEntryValueRequired="False"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="SOC13ET" runat="server" FieldTextBoxWidth="50px" DatabaseField="SOC13ET" FieldTextBoxTabIndex="58"
											FieldLabelText="SOC13ET" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,6,7,8,9"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="SOC13F" runat="server" FieldTextBoxWidth="50px" DatabaseField="SOC13F" FieldTextBoxTabIndex="50"
											FieldLabelText="Accepting: Person 6" IsDoubleEntryField="False" IsReadOnly="False" IsEntryValueRequired="False"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="SOC13FT" runat="server" FieldTextBoxWidth="50px" DatabaseField="SOC13FT" FieldTextBoxTabIndex="59"
											FieldLabelText="SOC13FT" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,6,7,8,9"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="SOC13G" runat="server" FieldTextBoxWidth="50px" DatabaseField="SOC13G" FieldTextBoxTabIndex="51"
											FieldLabelText="Accepting: Person 7" IsDoubleEntryField="False" IsReadOnly="False" IsEntryValueRequired="False"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="SOC13GT" runat="server" FieldTextBoxWidth="50px" DatabaseField="SOC13GT" FieldTextBoxTabIndex="60"
											FieldLabelText="SOC13GT" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,6,7,8,9"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="SOC13H" runat="server" FieldTextBoxWidth="50px" DatabaseField="SOC13H" FieldTextBoxTabIndex="52"
											FieldLabelText="Accepting: Person 8" IsDoubleEntryField="False" IsReadOnly="False" IsEntryValueRequired="False"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="SOC13HT" runat="server" FieldTextBoxWidth="50px" DatabaseField="SOC13HT" FieldTextBoxTabIndex="61"
											FieldLabelText="SOC13HT" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,6,7,8,9"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="SOC13I" runat="server" FieldTextBoxWidth="50px" DatabaseField="SOC13I" FieldTextBoxTabIndex="53"
											FieldLabelText="Accepting: Person 9" IsDoubleEntryField="False" IsReadOnly="False" IsEntryValueRequired="False"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="SOC13IT" runat="server" FieldTextBoxWidth="50px" DatabaseField="SOC13IT" FieldTextBoxTabIndex="62"
											FieldLabelText="SOC13IT" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,6,7,8,9"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD class="heading" colSpan="2">6. How Satisfied?
									</TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="SOC13SA" runat="server" FieldTextBoxWidth="50px" DatabaseField="SOC13SA" FieldTextBoxTabIndex="63"
											FieldLabelText="Accepting: How Satisfied?" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,6,9"></def:datafieldcontrol></TD>
									<TD>1=Very Dissatisfied<BR>
										2=Fairly Dissatisfied<BR>
										3=A Little Dissatisfied<BR>
										4=A Little Satisfied<BR>
										5=Fairly Satisfied<BR>
										6=Very Satisfied<BR>
										9=Missing/Blank</TD>
								</TR>
							</TABLE>
							<BR>
							<TABLE class="grid">
								<TR>
									<TD class="heading" colSpan="2">7. Whom can you really count on to care about you 
										regardless of what is happening to you?
									</TD>
								</TR>
								<TR>
									<TD>Initials</TD>
									<TD>Relationship Type</TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="SOC14num" runat="server" FieldTextBoxWidth="50px" DatabaseField="SOC14num" FieldTextBoxTabIndex="64"
											FieldLabelText="Caring: # of people" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" MinVal="0"
											MaxVal="9"></def:datafieldcontrol></TD>
									<TD>1=Spouse<BR>
										2=Mother<BR>
										3=Father<BR>
										4=Relative<BR>
										5=Friend<BR>
										6=Coworker<BR>
										7=Employer<BR>
										8=Other<BR>
										9=Missing/Blank</TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="SOC14A" runat="server" FieldTextBoxWidth="50px" DatabaseField="SOC14A" FieldTextBoxTabIndex="65"
											FieldLabelText="Caring: Person 1" IsDoubleEntryField="False" IsReadOnly="False" IsEntryValueRequired="False"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="SOC14AT" runat="server" FieldTextBoxWidth="50px" DatabaseField="SOC14AT" FieldTextBoxTabIndex="74"
											FieldLabelText="SOC14AT" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,6,7,8,9"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="SOC14B" runat="server" FieldTextBoxWidth="50px" DatabaseField="SOC14B" FieldTextBoxTabIndex="66"
											FieldLabelText="Caring: Person 2" IsDoubleEntryField="False" IsReadOnly="False" IsEntryValueRequired="False"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="SOC14BT" runat="server" FieldTextBoxWidth="50px" DatabaseField="SOC14BT" FieldTextBoxTabIndex="75"
											FieldLabelText="SOC14BT" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,6,7,8,9"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="SOC14C" runat="server" FieldTextBoxWidth="50px" DatabaseField="SOC14C" FieldTextBoxTabIndex="67"
											FieldLabelText="Caring: Person 3" IsDoubleEntryField="False" IsReadOnly="False" IsEntryValueRequired="False"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="SOC14CT" runat="server" FieldTextBoxWidth="50px" DatabaseField="SOC14CT" FieldTextBoxTabIndex="76"
											FieldLabelText="SOC14CT" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,6,7,8,9"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="SOC14D" runat="server" FieldTextBoxWidth="50px" DatabaseField="SOC14D" FieldTextBoxTabIndex="68"
											FieldLabelText="Caring: Person 4" IsDoubleEntryField="False" IsReadOnly="False" IsEntryValueRequired="False"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="SOC14DT" runat="server" FieldTextBoxWidth="50px" DatabaseField="SOC14DT" FieldTextBoxTabIndex="77"
											FieldLabelText="SOC14DT" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,6,7,8,9"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="SOC14E" runat="server" FieldTextBoxWidth="50px" DatabaseField="SOC14E" FieldTextBoxTabIndex="69"
											FieldLabelText="Caring: Person 5" IsDoubleEntryField="False" IsReadOnly="False" IsEntryValueRequired="False"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="SOC14ET" runat="server" FieldTextBoxWidth="50px" DatabaseField="SOC14ET" FieldTextBoxTabIndex="78"
											FieldLabelText="SOC14ET" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,6,7,8,9"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="SOC14F" runat="server" FieldTextBoxWidth="50px" DatabaseField="SOC14F" FieldTextBoxTabIndex="70"
											FieldLabelText="Caring: Person 6" IsDoubleEntryField="False" IsReadOnly="False" IsEntryValueRequired="False"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="SOC14FT" runat="server" FieldTextBoxWidth="50px" DatabaseField="SOC14FT" FieldTextBoxTabIndex="79"
											FieldLabelText="SOC14FT" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,6,7,8,9"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="SOC14G" runat="server" FieldTextBoxWidth="50px" DatabaseField="SOC14G" FieldTextBoxTabIndex="71"
											FieldLabelText="Caring: Person 7" IsDoubleEntryField="False" IsReadOnly="False" IsEntryValueRequired="False"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="SOC14GT" runat="server" FieldTextBoxWidth="50px" DatabaseField="SOC14GT" FieldTextBoxTabIndex="80"
											FieldLabelText="SOC14GT" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,6,7,8,9"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="SOC14H" runat="server" FieldTextBoxWidth="50px" DatabaseField="SOC14H" FieldTextBoxTabIndex="72"
											FieldLabelText="Caring: Person 8" IsDoubleEntryField="False" IsReadOnly="False" IsEntryValueRequired="False"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="SOC14HT" runat="server" FieldTextBoxWidth="50px" DatabaseField="SOC14HT" FieldTextBoxTabIndex="81"
											FieldLabelText="SOC14HT" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,6,7,8,9"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="SOC14I" runat="server" FieldTextBoxWidth="50px" DatabaseField="SOC14I" FieldTextBoxTabIndex="73"
											FieldLabelText="Caring: Person 9" IsDoubleEntryField="False" IsReadOnly="False" IsEntryValueRequired="False"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="SOC14IT" runat="server" FieldTextBoxWidth="50px" DatabaseField="SOC14IT" FieldTextBoxTabIndex="82"
											FieldLabelText="SOC14IT" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,6,7,8,9"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD class="heading" colSpan="2">8. How Satisfied?
									</TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="SOC14SA" runat="server" FieldTextBoxWidth="50px" DatabaseField="SOC14SA" FieldTextBoxTabIndex="83"
											FieldLabelText="Caring: How Satisfied?" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,6,9"></def:datafieldcontrol></TD>
									<TD>1=Very Dissatisfied<BR>
										2=Fairly Dissatisfied<BR>
										3=A Little Dissatisfied<BR>
										4=A Little Satisfied<BR>
										5=Fairly Satisfied<BR>
										6=Very Satisfied<BR>
										9=Missing/Blank</TD>
								</TR>
							</TABLE>
							<BR>
							<BR>
							<TABLE class="grid">
								<TR>
									<TD class="heading" colSpan="2">9. Whom can you really count on to help you feel 
										better when you are feeling generally down-in-the-dumps?
									</TD>
								</TR>
								<TR>
									<TD>Initials</TD>
									<TD>Relationship Type</TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="SOC15num" runat="server" FieldTextBoxWidth="50px" DatabaseField="SOC15num" FieldTextBoxTabIndex="84"
											FieldLabelText="Feel Better: # of people" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" MinVal="0"
											MaxVal="9"></def:datafieldcontrol></TD>
									<TD>1=Spouse<BR>
										2=Mother<BR>
										3=Father<BR>
										4=Relative<BR>
										5=Friend<BR>
										6=Coworker<BR>
										7=Employer<BR>
										8=Other<BR>
										9=Missing/Blank</TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="SOC15A" runat="server" FieldTextBoxWidth="50px" DatabaseField="SOC15A" FieldTextBoxTabIndex="85"
											FieldLabelText="Feel Better: Person 1" IsDoubleEntryField="False" IsReadOnly="False" IsEntryValueRequired="False"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="SOC15AT" runat="server" FieldTextBoxWidth="50px" DatabaseField="SOC15AT" FieldTextBoxTabIndex="94"
											FieldLabelText="SOC15AT" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,6,7,8,9"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="SOC15B" runat="server" FieldTextBoxWidth="50px" DatabaseField="SOC15B" FieldTextBoxTabIndex="86"
											FieldLabelText="Feel Better: Person 2" IsDoubleEntryField="False" IsReadOnly="False" IsEntryValueRequired="False"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="SOC15BT" runat="server" FieldTextBoxWidth="50px" DatabaseField="SOC15BT" FieldTextBoxTabIndex="95"
											FieldLabelText="SOC15BT" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,6,7,8,9"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="SOC15C" runat="server" FieldTextBoxWidth="50px" DatabaseField="SOC15C" FieldTextBoxTabIndex="87"
											FieldLabelText="Feel Better: Person 3" IsDoubleEntryField="False" IsReadOnly="False" IsEntryValueRequired="False"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="SOC15CT" runat="server" FieldTextBoxWidth="50px" DatabaseField="SOC15CT" FieldTextBoxTabIndex="96"
											FieldLabelText="SOC15CT" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,6,7,8,9"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="SOC15D" runat="server" FieldTextBoxWidth="50px" DatabaseField="SOC15D" FieldTextBoxTabIndex="88"
											FieldLabelText="Feel Better: Person 4" IsDoubleEntryField="False" IsReadOnly="False" IsEntryValueRequired="False"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="SOC15DT" runat="server" FieldTextBoxWidth="50px" DatabaseField="SOC15DT" FieldTextBoxTabIndex="97"
											FieldLabelText="SOC15DT" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,6,7,8,9"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="SOC15E" runat="server" FieldTextBoxWidth="50px" DatabaseField="SOC15E" FieldTextBoxTabIndex="89"
											FieldLabelText="Feel Better: Person 5" IsDoubleEntryField="False" IsReadOnly="False" IsEntryValueRequired="False"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="SOC15ET" runat="server" FieldTextBoxWidth="50px" DatabaseField="SOC15ET" FieldTextBoxTabIndex="98"
											FieldLabelText="SOC15ET" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,6,7,8,9"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="SOC15F" runat="server" FieldTextBoxWidth="50px" DatabaseField="SOC15F" FieldTextBoxTabIndex="90"
											FieldLabelText="Feel Better: Person 6" IsDoubleEntryField="False" IsReadOnly="False" IsEntryValueRequired="False"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="SOC15FT" runat="server" FieldTextBoxWidth="50px" DatabaseField="SOC15FT" FieldTextBoxTabIndex="99"
											FieldLabelText="SOC15FT" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,6,7,8,9"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="SOC15G" runat="server" FieldTextBoxWidth="50px" DatabaseField="SOC15G" FieldTextBoxTabIndex="91"
											FieldLabelText="Feel Better: Person 7" IsDoubleEntryField="False" IsReadOnly="False" IsEntryValueRequired="False"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="SOC15GT" runat="server" FieldTextBoxWidth="50px" DatabaseField="SOC15GT" FieldTextBoxTabIndex="100"
											FieldLabelText="SOC15GT" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,6,7,8,9"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="SOC15H" runat="server" FieldTextBoxWidth="50px" DatabaseField="SOC15H" FieldTextBoxTabIndex="92"
											FieldLabelText="Feel Better: Person 8" IsDoubleEntryField="False" IsReadOnly="False" IsEntryValueRequired="False"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="SOC15HT" runat="server" FieldTextBoxWidth="50px" DatabaseField="SOC15HT" FieldTextBoxTabIndex="101"
											FieldLabelText="SOC15HT" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,6,7,8,9"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="SOC15I" runat="server" FieldTextBoxWidth="50px" DatabaseField="SOC15I" FieldTextBoxTabIndex="93"
											FieldLabelText="Feel Better: Person 9" IsDoubleEntryField="False" IsReadOnly="False" IsEntryValueRequired="False"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="SOC15IT" runat="server" FieldTextBoxWidth="50px" DatabaseField="SOC15IT" FieldTextBoxTabIndex="102"
											FieldLabelText="SOC15IT" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,6,7,8,9"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD class="heading" colSpan="2">10. How Satisfied?
									</TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="SOC15SA" runat="server" FieldTextBoxWidth="50px" DatabaseField="SOC15SA" FieldTextBoxTabIndex="103"
											FieldLabelText="Feel Better: How Satisfied?" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,6,9"></def:datafieldcontrol></TD>
									<TD>1=Very Dissatisfied<BR>
										2=Fairly Dissatisfied<BR>
										3=A Little Dissatisfied<BR>
										4=A Little Satisfied<BR>
										5=Fairly Satisfied<BR>
										6=Very Satisfied<BR>
										9=Missing/Blank</TD>
								</TR>
							</TABLE>
							<BR>
							<BR>
							<TABLE class="grid">
								<TR>
									<TD class="heading" colSpan="2">11. Whom can you count on to console you when you 
										are very upset?
									</TD>
								</TR>
								<TR>
									<TD>Initials</TD>
									<TD>Relationship Type</TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="SOC16num" runat="server" FieldTextBoxWidth="50px" DatabaseField="SOC16num" FieldTextBoxTabIndex="104"
											FieldLabelText="Console: # of people" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" MinVal="0"
											MaxVal="9"></def:datafieldcontrol></TD>
									<TD>1=Spouse<BR>
										2=Mother<BR>
										3=Father<BR>
										4=Relative<BR>
										5=Friend<BR>
										6=Coworker<BR>
										7=Employer<BR>
										8=Other<BR>
										9=Missing/Blank</TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="SOC16A" runat="server" FieldTextBoxWidth="50px" DatabaseField="SOC16A" FieldTextBoxTabIndex="105"
											FieldLabelText="Console: Person 1" IsDoubleEntryField="False" IsReadOnly="False" IsEntryValueRequired="False"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="SOC16AT" runat="server" FieldTextBoxWidth="50px" DatabaseField="SOC16AT" FieldTextBoxTabIndex="114"
											FieldLabelText="SOC16AT" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,6,7,8,9"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="SOC16B" runat="server" FieldTextBoxWidth="50px" DatabaseField="SOC16B" FieldTextBoxTabIndex="106"
											FieldLabelText="Console: Person 2" IsDoubleEntryField="False" IsReadOnly="False" IsEntryValueRequired="False"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="SOC16BT" runat="server" FieldTextBoxWidth="50px" DatabaseField="SOC16BT" FieldTextBoxTabIndex="115"
											FieldLabelText="SOC16BT" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,6,7,8,9"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="SOC16C" runat="server" FieldTextBoxWidth="50px" DatabaseField="SOC16C" FieldTextBoxTabIndex="107"
											FieldLabelText="Console: Person 3" IsDoubleEntryField="False" IsReadOnly="False" IsEntryValueRequired="False"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="SOC16CT" runat="server" FieldTextBoxWidth="50px" DatabaseField="SOC16CT" FieldTextBoxTabIndex="116"
											FieldLabelText="SOC16CT" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,6,7,8,9"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="SOC16D" runat="server" FieldTextBoxWidth="50px" DatabaseField="SOC16D" FieldTextBoxTabIndex="108"
											FieldLabelText="Console: Person 4" IsDoubleEntryField="False" IsReadOnly="False" IsEntryValueRequired="False"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="SOC16DT" runat="server" FieldTextBoxWidth="50px" DatabaseField="SOC16DT" FieldTextBoxTabIndex="117"
											FieldLabelText="SOC16DT" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,6,7,8,9"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="SOC16E" runat="server" FieldTextBoxWidth="50px" DatabaseField="SOC16E" FieldTextBoxTabIndex="109"
											FieldLabelText="Console: Person 5" IsDoubleEntryField="False" IsReadOnly="False" IsEntryValueRequired="False"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="SOC16ET" runat="server" FieldTextBoxWidth="50px" DatabaseField="SOC16ET" FieldTextBoxTabIndex="118"
											FieldLabelText="SOC16ET" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,6,7,8,9"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="SOC16F" runat="server" FieldTextBoxWidth="50px" DatabaseField="SOC16F" FieldTextBoxTabIndex="110"
											FieldLabelText="Console: Person 6" IsDoubleEntryField="False" IsReadOnly="False" IsEntryValueRequired="False"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="SOC16FT" runat="server" FieldTextBoxWidth="50px" DatabaseField="SOC16FT" FieldTextBoxTabIndex="119"
											FieldLabelText="SOC16FT" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,6,7,8,9"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="SOC16G" runat="server" FieldTextBoxWidth="50px" DatabaseField="SOC16G" FieldTextBoxTabIndex="111"
											FieldLabelText="Console: Person 7" IsDoubleEntryField="False" IsReadOnly="False" IsEntryValueRequired="False"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="SOC16GT" runat="server" FieldTextBoxWidth="50px" DatabaseField="SOC16GT" FieldTextBoxTabIndex="120"
											FieldLabelText="SOC16GT" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,6,7,8,9"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="SOC16H" runat="server" FieldTextBoxWidth="50px" DatabaseField="SOC16H" FieldTextBoxTabIndex="112"
											FieldLabelText="Console: Person 8" IsDoubleEntryField="False" IsReadOnly="False" IsEntryValueRequired="False"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="SOC16HT" runat="server" FieldTextBoxWidth="50px" DatabaseField="SOC16HT" FieldTextBoxTabIndex="121"
											FieldLabelText="SOC16HT" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,6,7,8,9"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="SOC16I" runat="server" FieldTextBoxWidth="50px" DatabaseField="SOC16I" FieldTextBoxTabIndex="113"
											FieldLabelText="Console: Person 9" IsDoubleEntryField="False" IsReadOnly="False" IsEntryValueRequired="False"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="SOC16IT" runat="server" FieldTextBoxWidth="50px" DatabaseField="SOC16IT" FieldTextBoxTabIndex="122"
											FieldLabelText="SOC16IT" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,6,7,8,9"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD class="heading" colSpan="2">12. How Satisfied?
									</TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="SOC16SA" runat="server" FieldTextBoxWidth="50px" DatabaseField="SOC16SA" FieldTextBoxTabIndex="123"
											FieldLabelText="Console: How satisfied?" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,6,9"></def:datafieldcontrol></TD>
									<TD>1=Very Dissatisfied<BR>
										2=Fairly Dissatisfied<BR>
										3=A Little Dissatisfied<BR>
										4=A Little Satisfied<BR>
										5=Fairly Satisfied<BR>
										6=Very Satisfied<BR>
										9=Missing/Blank</TD>
								</TR>
							</TABLE>
							<BR>
							<TABLE class="layout" id="table_readonly2">

								<TR>
									<TD>
										<def:datafieldcontrol id="SSQSAT" runat="server" FieldLabelWidth="250px" DatabaseField="SSQSAT" FieldTextBoxTabIndex="125"
											FieldLabelText="SSQ Avg Support Satisfaction" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="DATE" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="SSQNUM" runat="server" FieldLabelWidth="250px" DatabaseField="SSQNUM" FieldTextBoxTabIndex="126"
											FieldLabelText="SSQ Avg Number of Supports" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="SSQscrmsg" runat="server" FieldLabelWidth="250px" DatabaseField="SSQscrmsg" FieldTextBoxTabIndex="127"
											FieldLabelText="SSQ Scoring message" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="DATE" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>


								<TR><td><br/>------</td></TR>

								<TR>
									<TD>
										<def:datafieldcontrol id="created" runat="server" FieldLabelWidth="80px" DatabaseField="created" FieldTextBoxTabIndex="125"
											FieldLabelText="created" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="DATE" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="createdBy" runat="server" FieldLabelWidth="80px" DatabaseField="createdBy" FieldTextBoxTabIndex="126"
											FieldLabelText="createdBy" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="updated" runat="server" FieldLabelWidth="80px" DatabaseField="updated" FieldTextBoxTabIndex="127"
											FieldLabelText="updated" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="DATE" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="updatedBy" runat="server" FieldLabelWidth="80px" DatabaseField="updatedBy" FieldTextBoxTabIndex="128"
											FieldLabelText="updatedBy" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="scored" runat="server" FieldLabelWidth="80px" DatabaseField="scored" FieldTextBoxTabIndex="127"
											FieldLabelText="scored" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="DATE" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="scoredBy" runat="server" FieldLabelWidth="80px" DatabaseField="scoredBy" FieldTextBoxTabIndex="128"
											FieldLabelText="scoredBy" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
						</asp:Panel>
					</asp:Content>
