<%@ Register TagPrefix="def" Namespace="DataEntryFramework.Old" %>

<%@ Page language="c#" Inherits="edst3_qpc_das.edst3_qpc_das" CodeFile="edst3_qpc_das.aspx.cs"  MasterPageFile="~/UWAC.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="oBodyPlaceHolder" runat="server">
						<def:dataentrycontroller id="DataEntryController1" runat="server" LookupField1="edsid" VerifiedField="verified"
							PrimaryKeyField="das_pk" MeasureName="EDST3 DAS Caregiver" LookupTextBox2Visible="False" LookupTextBox1LabelText="EDS ID:"
							DatabaseTable="edst3_qpc_das" StudyMeasID="196"></def:dataentrycontroller>
						<table class="layout" id="table_insert">
							<tr>
								<td><def:datafieldcontrol id="EDSID" runat="server" DatabaseField="EDSID" FieldTextBoxTabIndex="1" FieldLabelText="EDSID"
										IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="True"
										IsInsertField="True" FieldDataType="INT" FieldLabelWidth="80px" FieldTextBoxWidth="80px"></def:datafieldcontrol></td>
							</tr>
							<tr>
								<td><def:datafieldcontrol id="DASDATE" runat="server" DatabaseField="DASDATE" FieldTextBoxTabIndex="2" FieldLabelText="DAS Date"
										IsDoubleEntryField="False" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
										IsInsertField="False" FieldDataType="DATE" FormatString="{0:d}" FieldLabelWidth="80px" FieldTextBoxWidth="80px"></def:datafieldcontrol></td>
							</tr>
						</table>
						<asp:Panel Runat="server" ID="mainPanel">
							<BR>
							<TABLE class="grid" id="table_entry">
								<TR>
									<TD class="heading">0=Single, Never married<BR>
										1=Single, living with partner<BR>
										2=Married<BR>
										3=Separated<BR>
										4=Divorced<BR>
										9=Missing/Blank<BR>
									</TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="DAS1MS1A" runat="server" FieldTextBoxWidth="40px" FieldLabelWidth="300px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="1.A.  Marital status" FieldTextBoxTabIndex="3"
											DatabaseField="DAS1MS1A" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="DAS1MS1B" runat="server" FieldTextBoxWidth="40px" FieldLabelWidth="300px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="Partner is father? (1=Yes,0=No,9=Missing)"
											FieldTextBoxTabIndex="3" DatabaseField="DAS1MS1B" ValidList="0,1,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="DAS1MS2" runat="server" FieldTextBoxWidth="40px" FieldLabelWidth="300px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="2. # of marriages" FieldTextBoxTabIndex="4"
											DatabaseField="DAS1MS2"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="DAS1MS3" runat="server" FieldTextBoxWidth="40px" FieldLabelWidth="300px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="3. # of divorces" FieldTextBoxTabIndex="5"
											DatabaseField="DAS1MS3"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="DAS1MS4A" runat="server" FieldTextBoxWidth="80px" FieldLabelWidth="300px" FieldDataType="DATE"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="4.A. Date of divorce #1" FieldTextBoxTabIndex="6"
											DatabaseField="DAS1MS4A" FormatString="{0:d}"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="DAS1MS4B" runat="server" FieldTextBoxWidth="80px" FieldLabelWidth="300px" FieldDataType="DATE"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="4.B. Date of divorce #2" FieldTextBoxTabIndex="7"
											DatabaseField="DAS1MS4B" FormatString="{0:d}"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="DAS1MS4C" runat="server" FieldTextBoxWidth="80px" FieldLabelWidth="300px" FieldDataType="DATE"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="4.C. Date of divorce #3" FieldTextBoxTabIndex="8"
											DatabaseField="DAS1MS4C" FormatString="{0:d}"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
							<BR>
							<TABLE class="grid">
								<TR>
									<TD class="heading">0=Always Agree<BR>
										1=Almost Always Agree<BR>
										2=Occasionally Disagree<BR>
										3=Frequently Disagree<BR>
										4=Almost Always Disagree<BR>
										5=Always Disagree<BR>
										9=Missing/Blank<BR>
									</TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="DAS101" runat="server" FieldTextBoxWidth="40px" FieldLabelWidth="300px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="1.  Handling family finances" FieldTextBoxTabIndex="9"
											DatabaseField="DAS101" ValidList="0,1,2,3,4,5,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="DAS102" runat="server" FieldTextBoxWidth="40px" FieldLabelWidth="300px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="2.  Matters of recreation" FieldTextBoxTabIndex="10"
											DatabaseField="DAS102" DESIGNTIMEDRAGDROP="691"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="DAS103" runat="server" FieldTextBoxWidth="40px" FieldLabelWidth="300px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="3.  Religious matters" FieldTextBoxTabIndex="11"
											DatabaseField="DAS103" DESIGNTIMEDRAGDROP="697"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="DAS104" runat="server" FieldTextBoxWidth="40px" FieldLabelWidth="300px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="4.  Demonstrations of affection" FieldTextBoxTabIndex="12"
											DatabaseField="DAS104"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="DAS105" runat="server" FieldTextBoxWidth="40px" FieldLabelWidth="300px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="5.  Friends" FieldTextBoxTabIndex="13"
											DatabaseField="DAS105" DESIGNTIMEDRAGDROP="721"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="DAS106" runat="server" FieldTextBoxWidth="40px" FieldLabelWidth="300px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="6.  Sex relations" FieldTextBoxTabIndex="14"
											DatabaseField="DAS106"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="DAS107" runat="server" FieldTextBoxWidth="40px" FieldLabelWidth="300px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="7.  Conventionality (correct or proper behavior)"
											FieldTextBoxTabIndex="15" DatabaseField="DAS107"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="DAS108" runat="server" FieldTextBoxWidth="40px" FieldLabelWidth="300px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="8.  Philosophy of life" FieldTextBoxTabIndex="16"
											DatabaseField="DAS108"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="DAS109" runat="server" FieldTextBoxWidth="40px" FieldLabelWidth="300px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="9.  Ways of dealing with parents or in-laws"
											FieldTextBoxTabIndex="17" DatabaseField="DAS109" DESIGNTIMEDRAGDROP="1011"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="DAS110" runat="server" FieldTextBoxWidth="40px" FieldLabelWidth="300px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="10.  Aims, goals, and things believed important"
											FieldTextBoxTabIndex="18" DatabaseField="DAS110" DESIGNTIMEDRAGDROP="1020"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="DAS111" runat="server" FieldTextBoxWidth="40px" FieldLabelWidth="300px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="11.  Amount of time spent together" FieldTextBoxTabIndex="19"
											DatabaseField="DAS111"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="DAS112" runat="server" FieldTextBoxWidth="40px" FieldLabelWidth="300px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="12.  Making major decisions" FieldTextBoxTabIndex="20"
											DatabaseField="DAS112"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="DAS113" runat="server" FieldTextBoxWidth="40px" FieldLabelWidth="300px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="13.  Household tasks" FieldTextBoxTabIndex="21"
											DatabaseField="DAS113"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="DAS114" runat="server" FieldTextBoxWidth="40px" FieldLabelWidth="300px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="14.  Leisure time interests and activities"
											FieldTextBoxTabIndex="22" DatabaseField="DAS114"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="DAS115" runat="server" FieldTextBoxWidth="40px" FieldLabelWidth="300px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="15.  Career decisions" FieldTextBoxTabIndex="23"
											DatabaseField="DAS115"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
							<BR>
							<TABLE class="grid">
								<TR>
									<TD class="heading">0=All the time<BR>
										1=Most of the time<BR>
										2=More often than not<BR>
										3=Occasionally<BR>
										4=Rarely<BR>
										5=Never<BR>
										9=Missing/Blank<BR>
									</TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="DAS116" runat="server" FieldTextBoxWidth="40px" FieldLabelWidth="300px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="16.  How often do you discuss or have you considered divo"
											FieldTextBoxTabIndex="24" DatabaseField="DAS116" ValidList="0,1,2,3,4,5,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="DAS117" runat="server" FieldTextBoxWidth="40px" FieldLabelWidth="300px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="17.  How often do you or your mate leave the house after "
											FieldTextBoxTabIndex="25" DatabaseField="DAS117"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="DAS118" runat="server" FieldTextBoxWidth="40px" FieldLabelWidth="300px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="18.  In general, how often do you think that things betwe"
											FieldTextBoxTabIndex="26" DatabaseField="DAS118"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="DAS119" runat="server" FieldTextBoxWidth="40px" FieldLabelWidth="300px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="19.  Do you confide in your mate?" FieldTextBoxTabIndex="27"
											DatabaseField="DAS119"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="DAS120" runat="server" FieldTextBoxWidth="40px" FieldLabelWidth="300px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="20.  Do you ever regret that you married (or lived togeth"
											FieldTextBoxTabIndex="28" DatabaseField="DAS120"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="DAS121" runat="server" FieldTextBoxWidth="40px" FieldLabelWidth="300px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="21.  How often do you and your partner quarrel?"
											FieldTextBoxTabIndex="29" DatabaseField="DAS121"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="DAS122" runat="server" FieldTextBoxWidth="40px" FieldLabelWidth="300px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="22.  How often do you and your mate get on each others' n"
											FieldTextBoxTabIndex="30" DatabaseField="DAS122"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
							<BR>
							<TABLE class="grid">
								<TR>
									<TD class="heading">0=Every day<BR>
										1=Almost Every day<BR>
										2=Occasionally<BR>
										3=Rarely<BR>
										4=Never<BR>
										9=Missing/Blank<BR>
									</TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="DAS123" runat="server" FieldTextBoxWidth="40px" FieldLabelWidth="300px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="23.  Do you kiss your mate?" FieldTextBoxTabIndex="31"
											DatabaseField="DAS123" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
							<BR>
							<TABLE class="grid">
								<TR>
									<TD class="heading">0=All<BR>
										1=Most<BR>
										2=Some<BR>
										3=Very few<BR>
										4=None<BR>
										9=Missing/Blank<BR>
									</TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="DAS124" runat="server" FieldTextBoxWidth="40px" FieldLabelWidth="300px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="24.  Do you and your mate engage in outside interests together"
											FieldTextBoxTabIndex="32" DatabaseField="DAS124" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
							<BR>
							<TABLE class="grid">
								<TR>
									<TD class="heading">0=Never<BR>
										1=Less than once a month<BR>
										2=Once/Twice a month<BR>
										3=Once/Twice a week<BR>
										4=Once a day<BR>
										5=More often<BR>
										9=Missing/Blank<BR>
									</TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="DAS125" runat="server" FieldTextBoxWidth="40px" FieldLabelWidth="300px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="25.  Have a stimulating exchange of ideas"
											FieldTextBoxTabIndex="33" DatabaseField="DAS125" ValidList="0,1,2,3,4,5,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="DAS126" runat="server" FieldTextBoxWidth="40px" FieldLabelWidth="300px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="26.  Laugh together" FieldTextBoxTabIndex="34"
											DatabaseField="DAS126"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="DAS127" runat="server" FieldTextBoxWidth="40px" FieldLabelWidth="300px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="27.  Calmly discuss something" FieldTextBoxTabIndex="35"
											DatabaseField="DAS127"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="DAS128" runat="server" FieldTextBoxWidth="40px" FieldLabelWidth="300px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="28.  Work together on a project" FieldTextBoxTabIndex="36"
											DatabaseField="DAS128"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
							<BR>
							<TABLE class="grid">
								<TR>
									<TD class="heading">0=Yes<BR>
										1=No<BR>
										9=Missing/Blank<BR>
									</TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="DAS129" runat="server" FieldTextBoxWidth="40px" FieldLabelWidth="300px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="29.  Being too tired for sex" FieldTextBoxTabIndex="37"
											DatabaseField="DAS129" ValidList="0,1,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="DAS130" runat="server" FieldTextBoxWidth="40px" FieldLabelWidth="300px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="30.  Not showing love" FieldTextBoxTabIndex="38"
											DatabaseField="DAS130"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
							<BR>
							<TABLE class="grid">
								<TR>
									<TD class="heading">0=Extremely unhappy<BR>
										1=Fairly unhappy<BR>
										2=A little unhappy<BR>
										3=Happy<BR>
										4=Very happy<BR>
										5=Extremely happy<BR>
										6=Perfect<BR>
										9=Missing/Blank<BR>
									</TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="DAS131" runat="server" FieldTextBoxWidth="40px" FieldLabelWidth="300px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="31.  Happiness in your relationship"
											FieldTextBoxTabIndex="39" DatabaseField="DAS131" ValidList="0,1,2,3,4,5,6,9"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
							<BR>
							<TABLE class="grid">
								<TR>
									<TD class="heading">0=I want desperately for my relationship to succeed, and would 
										go to about any length to see that it does.<BR>
										1=I want very much for my relationship to succeed; and will do all I can to see 
										that it does.<BR>
										2=I want very much for my relationship to succeed, and will do my fair share to 
										see that it does.<BR>
										3=It would be nice if my relationship succeeded, but I can't do much more than 
										I am doing now to help it succeed.<BR>
										4=It would be nice if my relationship succeeded,- but I refuse to do any more 
										than I am doing now to keep the relationship going.<BR>
										5=My relationship can never succeed, and there is no more that I can do to keep 
										the relationship going.<BR>
										9=Missing/Blank</TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="DAS132" runat="server" FieldTextBoxWidth="40px" FieldLabelWidth="300px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="32.  Future of your relationship" FieldTextBoxTabIndex="40"
											DatabaseField="DAS132" ValidList="0,1,2,3,4,5,9"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
							<BR>
							<TABLE class="layout" id="table_readonly">
								<TR>
									<TD>
										<def:datafieldcontrol id="created" runat="server" FieldLabelWidth="80px" FieldDataType="DATE" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True"
											IsDoubleEntryField="False" FieldLabelText="created" FieldTextBoxTabIndex="43" DatabaseField="created"
											RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="createdBy" runat="server" FieldLabelWidth="80px" FieldDataType="TEXT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True"
											IsDoubleEntryField="False" FieldLabelText="createdBy" FieldTextBoxTabIndex="44" DatabaseField="createdBy"
											RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="updated" runat="server" FieldLabelWidth="80px" FieldDataType="DATE" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True"
											IsDoubleEntryField="False" FieldLabelText="updated" FieldTextBoxTabIndex="45" DatabaseField="updated"
											RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="updatedBy" runat="server" FieldLabelWidth="80px" FieldDataType="TEXT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True"
											IsDoubleEntryField="False" FieldLabelText="updatedBy" FieldTextBoxTabIndex="46" DatabaseField="updatedBy"
											RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
						</asp:Panel>
					</asp:Content>
