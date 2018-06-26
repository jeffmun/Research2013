<%@ Register TagPrefix="def" Namespace="DataEntryFramework" %>

<%@ Page language="c#" Inherits="kt_DyadAdjScale.kt_DyadAdjScale" CodeFile="DyadAdjScale.aspx.cs"  MasterPageFile="~/UWAC.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="oBodyPlaceHolder" runat="server">
						<def:dataentrycontroller id="DataEntryController1" runat="server" LookupField1="id" VerifiedField="verified"
							PrimaryKeyField="das_pk" MeasureName="Dyad. Adj. Questionnaire" LookupTextBox2Visible="False" LookupTextBox1LabelText="Subject ID:"
							DatabaseTable="all_DyadicAdjustScale" LookupField1DataType="TEXT" ShowScoreButton="False" 
							AllowedStudyMeasures="196,270,271,325,361,419,489,490,505,506,573,688,767,772,1181,1182,1183,1193,1194,1195,1221,1222,1446,1456,1484,1485,1523,1524,1561,1562,1686,1687,1738,1753,1787,1795,1892,1932,1941,2059"
							></def:dataentrycontroller>
						<table class="layout">
							<tr>
								<td><def:datafieldcontrol id="TAPID" runat="server" DatabaseField="id" FieldTextBoxTabIndex="1" FieldLabelText="ID"
										IsDoubleEntryField="False" IsReadOnly="False" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="True"
										IsInsertField="True" FieldDataType="TEXT" FieldLabelWidth="60px" FieldTextBoxWidth="100px"></def:datafieldcontrol></td>
							</tr>
							<tr>
								<td><def:datafieldcontrol id="DASDATE" runat="server" DatabaseField="DASDATE" FieldTextBoxTabIndex="2" FieldLabelText="Date"
										IsDoubleEntryField="False" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="True"
										IsInsertField="True" FieldDataType="DATE" FormatString="{0:d}" FieldLabelWidth="60px" FieldTextBoxWidth="100px"></def:datafieldcontrol></td>
							</tr>
						</table>
						<asp:panel id="mainPanel" runat="server" Width="680px">
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
										<def:datafieldcontrol id="DASresp" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="130px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="Respondant" FieldTextBoxTabIndex="2"
											DatabaseField="DASresp" ValidList="0,1,2,3,4,9"></def:datafieldcontrol><BR>
										<def:datafieldcontrol id="DASrespt" runat="server" FieldTextBoxWidth="200px" FieldLabelWidth="130px" FieldDataType="TEXT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False"
											IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="(specify if 3 or 4)" FieldTextBoxTabIndex="2"
											DatabaseField="DASrespt"></def:datafieldcontrol><BR>
									</TD>
								</TR>
							</TABLE>
							<BR>
							<TABLE class="layout">
								<TR>
									<TD style="vertical-align:top" width="307">
										<TABLE class="grid" id="Table1">
											<TR>
												<TD>0=Single, never married<BR>
													1=Single, living with partner<BR>
													2=Married<BR>
													3=Separated<BR>
													4=Divorced<BR>
													9=Missing/Blank<BR>
													<def:datafieldcontrol id="DAS1MS1A" runat="server" FieldTextBoxWidth="40px" FieldDataType="INT" IsInsertField="False"
														IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
														FieldLabelText=" 1.A.  Marital status " FieldTextBoxTabIndex="3" DatabaseField="DAS1MS1A" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>0=Yes<BR>
													1=No<BR>
													9=Missing/Blank<BR>
													<def:datafieldcontrol id="DAS1MS1B" runat="server" FieldTextBoxWidth="40px" FieldDataType="FLOAT" IsInsertField="False"
														IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
														FieldLabelText="1.B. Partner is Father?" FieldTextBoxTabIndex="4" DatabaseField="DAS1MS1B" ValidList="0,1,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="DAS1MS2" runat="server" FieldTextBoxWidth="40px" FieldDataType="INT" IsInsertField="False"
														IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
														FieldLabelText=" 2. # of marriages" FieldTextBoxTabIndex="4" DatabaseField="DAS1MS2"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="DAS1MS3" runat="server" FieldTextBoxWidth="40px" FieldDataType="INT" IsInsertField="False"
														IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
														FieldLabelText=" 3. # of divorces" FieldTextBoxTabIndex="5" DatabaseField="DAS1MS3" DESIGNTIMEDRAGDROP="847"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="DAS1MS4A" runat="server" FieldTextBoxWidth="100px" FieldDataType="DATE" IsInsertField="False"
														IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
														IsDoubleEntryField="True" FieldLabelText=" 4.A. Date of divorce #1" FieldTextBoxTabIndex="6" DatabaseField="DAS1MS4A"
														FormatString="{0:d}"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="DAS1MS4B" runat="server" FieldTextBoxWidth="100px" FieldDataType="DATE" IsInsertField="False"
														IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
														IsDoubleEntryField="True" FieldLabelText=" 4.B. Date of divorce #2" FieldTextBoxTabIndex="7" DatabaseField="DAS1MS4B"
														FormatString="{0:d}" DESIGNTIMEDRAGDROP="857"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="DAS1MS4C" runat="server" FieldTextBoxWidth="100px" FieldDataType="DATE" IsInsertField="False"
														IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
														IsDoubleEntryField="True" FieldLabelText=" 4.C. Date of divorce #3" FieldTextBoxTabIndex="8" DatabaseField="DAS1MS4C"
														FormatString="{0:d}" DESIGNTIMEDRAGDROP="862"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="DAS101" runat="server" FieldTextBoxWidth="40px" FieldDataType="INT" IsInsertField="False"
														IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
														FieldLabelText="1.  Handling family finances" FieldTextBoxTabIndex="9" DatabaseField="DAS101" ValidList="0,1,2,3,4,5,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>0=Always Agree<BR>
													1=Almost Always Agree<BR>
													2=Occasionally Disagree<BR>
													3=Frequently Disagree<BR>
													4=Almost Always Disagree<BR>
													5=Always Disagree<BR>
													9=Missing/Blank<BR>
													<def:datafieldcontrol id="DAS102" runat="server" FieldTextBoxWidth="40px" FieldDataType="INT" IsInsertField="False"
														IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
														FieldLabelText="2.  Matters of recreation" FieldTextBoxTabIndex="10" DatabaseField="DAS102"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="DAS103" runat="server" FieldTextBoxWidth="40px" FieldDataType="INT" IsInsertField="False"
														IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
														FieldLabelText="3.  Religious matters" FieldTextBoxTabIndex="11" DatabaseField="DAS103"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="DAS104" runat="server" FieldTextBoxWidth="40px" FieldDataType="INT" IsInsertField="False"
														IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
														FieldLabelText="4.  Demonstrations of affection" FieldTextBoxTabIndex="12" DatabaseField="DAS104"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="DAS105" runat="server" FieldTextBoxWidth="40px" FieldDataType="INT" IsInsertField="False"
														IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
														FieldLabelText="5.  Friends" FieldTextBoxTabIndex="13" DatabaseField="DAS105" DESIGNTIMEDRAGDROP="906"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="DAS106" runat="server" FieldTextBoxWidth="40px" FieldDataType="INT" IsInsertField="False"
														IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
														FieldLabelText="6.  Sex relations" FieldTextBoxTabIndex="14" DatabaseField="DAS106"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="DAS107" runat="server" FieldTextBoxWidth="40px" FieldDataType="INT" IsInsertField="False"
														IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
														FieldLabelText="7.  Conventionality (correct or proper behavior)" FieldTextBoxTabIndex="15" DatabaseField="DAS107"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="DAS108" runat="server" FieldTextBoxWidth="40px" FieldDataType="INT" IsInsertField="False"
														IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
														FieldLabelText="8.  Philosophy of life" FieldTextBoxTabIndex="16" DatabaseField="DAS108" DESIGNTIMEDRAGDROP="928"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="DAS109" runat="server" FieldTextBoxWidth="40px" FieldDataType="INT" IsInsertField="False"
														IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
														FieldLabelText="9.  Ways of dealing with parents or in-laws" FieldTextBoxTabIndex="17" DatabaseField="DAS109"
														DESIGNTIMEDRAGDROP="933"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="DAS110" runat="server" FieldTextBoxWidth="40px" FieldDataType="INT" IsInsertField="False"
														IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
														FieldLabelText="10.  Aims, goals, and things believed important" FieldTextBoxTabIndex="18" DatabaseField="DAS110"
														DESIGNTIMEDRAGDROP="941"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="DAS111" runat="server" FieldTextBoxWidth="40px" FieldDataType="INT" IsInsertField="False"
														IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
														FieldLabelText="11.  Amount of time spent together" FieldTextBoxTabIndex="19" DatabaseField="DAS111"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="DAS112" runat="server" FieldTextBoxWidth="40px" FieldDataType="INT" IsInsertField="False"
														IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
														FieldLabelText="12.  Making major decisions" FieldTextBoxTabIndex="20" DatabaseField="DAS112"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="DAS113" runat="server" FieldTextBoxWidth="40px" FieldDataType="INT" IsInsertField="False"
														IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
														FieldLabelText="13.  Household tasks" FieldTextBoxTabIndex="21" DatabaseField="DAS113"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="DAS114" runat="server" FieldTextBoxWidth="40px" FieldDataType="INT" IsInsertField="False"
														IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
														FieldLabelText="14.  Leisure time interests and activities" FieldTextBoxTabIndex="22" DatabaseField="DAS114"
														DESIGNTIMEDRAGDROP="970"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="DAS115" runat="server" FieldTextBoxWidth="40px" FieldDataType="INT" IsInsertField="False"
														IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
														FieldLabelText="15.  Career decisions" FieldTextBoxTabIndex="23" DatabaseField="DAS115"></def:datafieldcontrol></TD>
											</TR>
										</TABLE>
									</TD>
									<TD style="vertical-align:top">
										<TABLE class="grid" id="table_entry">
											<TR>
												<TD>0=All the time<BR>
													1=Most of the time<BR>
													2=More often than not<BR>
													3=Occasionally<BR>
													4=Rarely<BR>
													5=Never<BR>
													9=Missing/Blank<BR>
													<def:datafieldcontrol id="DAS116" runat="server" FieldTextBoxWidth="40px" FieldDataType="INT" IsInsertField="False"
														IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
														FieldLabelText="16.  How often do you discuss or have you considered divo" FieldTextBoxTabIndex="24"
														DatabaseField="DAS116" ValidList="0,1,2,3,4,5,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="DAS117" runat="server" FieldTextBoxWidth="40px" FieldDataType="INT" IsInsertField="False"
														IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
														FieldLabelText="17.  How often do you or your mate leave the house after " FieldTextBoxTabIndex="25"
														DatabaseField="DAS117"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="DAS118" runat="server" FieldTextBoxWidth="40px" FieldDataType="INT" IsInsertField="False"
														IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
														FieldLabelText="18.  In general, how often do you think that things betwe" FieldTextBoxTabIndex="26"
														DatabaseField="DAS118"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="DAS119" runat="server" FieldTextBoxWidth="40px" FieldDataType="INT" IsInsertField="False"
														IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
														FieldLabelText="19.  Do you confide in your mate?" FieldTextBoxTabIndex="27" DatabaseField="DAS119"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="DAS120" runat="server" FieldTextBoxWidth="40px" FieldDataType="INT" IsInsertField="False"
														IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
														FieldLabelText="20.  Do you ever regret that you married (or lived togeth" FieldTextBoxTabIndex="28"
														DatabaseField="DAS120"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="DAS121" runat="server" FieldTextBoxWidth="40px" FieldDataType="INT" IsInsertField="False"
														IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
														FieldLabelText="21.  How often do you and your partner quarrel?" FieldTextBoxTabIndex="29" DatabaseField="DAS121"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="DAS122" runat="server" FieldTextBoxWidth="40px" FieldDataType="INT" IsInsertField="False"
														IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
														FieldLabelText="22.  How often do you and your mate get on each others' n" FieldTextBoxTabIndex="30"
														DatabaseField="DAS122"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>0=Every day<BR>
													1=Almost Every day<BR>
													2=Occasionally<BR>
													3=Rarely<BR>
													4=Never<BR>
													9=Missing/Blank<BR>
													<def:datafieldcontrol id="DAS123" runat="server" FieldTextBoxWidth="40px" FieldDataType="INT" IsInsertField="False"
														IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
														FieldLabelText="23.  Do you kiss your mate?" FieldTextBoxTabIndex="31" DatabaseField="DAS123" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>0=All of them<BR>
													1=Most of them<BR>
													2=Some of them<BR>
													3=Very few of them<BR>
													4=None of them<BR>
													9=Missing/Blank<BR>
													<def:datafieldcontrol id="DAS124" runat="server" FieldTextBoxWidth="40px" FieldDataType="INT" IsInsertField="False"
														IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
														FieldLabelText="24.  Do you and your mate engage in outside interests tog" FieldTextBoxTabIndex="32"
														DatabaseField="DAS124" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>0=Never<BR>
													1=Less than once a month<BR>
													2=Once/Twice a month<BR>
													3=Once/Twice a week<BR>
													4=Once a day<BR>
													5=More often<BR>
													9=Missing/Blank<BR>
													<def:datafieldcontrol id="DAS125" runat="server" FieldTextBoxWidth="40px" FieldDataType="INT" IsInsertField="False"
														IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
														FieldLabelText="25.  Have a stimulating exchange of ideas" FieldTextBoxTabIndex="33" DatabaseField="DAS125"
														ValidList="0,1,2,3,4,5,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="DAS126" runat="server" FieldTextBoxWidth="40px" FieldDataType="INT" IsInsertField="False"
														IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
														FieldLabelText="26.  Laugh together" FieldTextBoxTabIndex="34" DatabaseField="DAS126"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="DAS127" runat="server" FieldTextBoxWidth="40px" FieldDataType="INT" IsInsertField="False"
														IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
														FieldLabelText="27.  Calmly discuss something" FieldTextBoxTabIndex="35" DatabaseField="DAS127"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="DAS128" runat="server" FieldTextBoxWidth="40px" FieldDataType="INT" IsInsertField="False"
														IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
														FieldLabelText="28.  Work together on a project" FieldTextBoxTabIndex="36" DatabaseField="DAS128"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>0=Yes<BR>
													1=No<BR>
													9=Missing/Blank<BR>
													<def:datafieldcontrol id="DAS129" runat="server" FieldTextBoxWidth="40px" FieldDataType="INT" IsInsertField="False"
														IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
														FieldLabelText="29.  Being too tired for sex" FieldTextBoxTabIndex="37" DatabaseField="DAS129" ValidList="0,1,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="DAS130" runat="server" FieldTextBoxWidth="40px" FieldDataType="INT" IsInsertField="False"
														IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
														FieldLabelText="30.  Not showing love" FieldTextBoxTabIndex="38" DatabaseField="DAS130"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>0=Extremely unhappy<BR>
													1=Fairly unhappy<BR>
													2=A little unhappy<BR>
													3=Happy<BR>
													4=Very happy<BR>
													5=Extremely happy<BR>
													6=Perfect<BR>
													9=Missing/Blank<BR>
													<def:datafieldcontrol id="DAS131" runat="server" FieldTextBoxWidth="40px" FieldDataType="INT" IsInsertField="False"
														IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
														FieldLabelText="31.  Happiness in your relationship" FieldTextBoxTabIndex="39" DatabaseField="DAS131"
														ValidList="0,1,2,3,4,5,6,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>Use the following codes for question 32 or 9 if missing/blank<BR>
													<TABLE class="grid">
														<TR>
															<TD class="heading">Code</TD>
															<TD></TD>
														</TR>
														<TR>
															<TD>0</TD>
															<TD>I want desperately for my relationship to succeed, and would go to about any 
																length to see that it does.</TD>
														</TR>
														<TR>
															<TD>1</TD>
															<TD>I want very much for my relationship to succeed; and will do all I can to see 
																that it does.</TD>
														</TR>
														<TR>
															<TD>2</TD>
															<TD>I want very much for my relationship to succeed, and will do my fair share to 
																see that it does.</TD>
														</TR>
														<TR>
															<TD>3</TD>
															<TD>It would be nice if my relationship succeeded, but I can't do much more than I 
																am doing now to help it succeed.</TD>
														</TR>
														<TR>
															<TD>4</TD>
															<TD>It would be nice if my relationship succeeded,- but I refuse to do any more 
																than I am doing now to keep the relationship going.</TD>
														</TR>
														<TR>
															<TD>5</TD>
															<TD>My relationship can never succeed, and there is no more that I can do to keep 
																the relationship going.</TD>
														</TR>
													</TABLE>
													<def:datafieldcontrol id="DAS132" runat="server" FieldTextBoxWidth="40px" FieldDataType="INT" IsInsertField="False"
														IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
														FieldLabelText="32.  Future of your relationship" FieldTextBoxTabIndex="40" DatabaseField="DAS132"
														ValidList="0,1,2,3,4,5,9"></def:datafieldcontrol></TD>
											</TR>
										</TABLE>
									</TD>
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
						</asp:panel></asp:Content>
