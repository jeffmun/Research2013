<%@ Register TagPrefix="def" Namespace="DataEntryFramework.Old" %>

<%@ Page language="c#" Inherits="tap_qpm_das.tap_qpm_das" CodeFile="tap_qpm_das.aspx.cs"  MasterPageFile="~/UWAC.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="oBodyPlaceHolder" runat="server">
						<def:dataentrycontroller id="DataEntryController1" runat="server" LookupField1="tapid" VerifiedField="verified"
							PrimaryKeyField="das_pk" MeasureName="TAP Mother Dyad. Adj. Questionnaire" LookupTextBox2Visible="False"
							LookupTextBox1LabelText="TAP ID:" DatabaseTable="tap_qpm_das" LookupField1DataType="TEXT" ShowScoreButton="False" StudyMeasID="361"></def:dataentrycontroller>
						<table class="default">
							<tr>
								<td><def:datafieldcontrol id="TAPID" runat="server" DatabaseField="TAPID" FieldTextBoxTabIndex="1" FieldLabelText="TAP ID"
										IsDoubleEntryField="False" IsReadOnly="False" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="True"
										IsInsertField="True" FieldDataType="TEXT" RegEx="^[T][A][P][0-9][0-9][0-9]$" RegExDescription="TAP ID must  look like TAP###"
										FieldLabelWidth="60px" FieldTextBoxWidth="100px"></def:datafieldcontrol></td>
							</tr>
							<tr>
								<td><def:datafieldcontrol id="DASDATE" runat="server" DatabaseField="DASDATE" FieldTextBoxTabIndex="2" FieldLabelText="Date"
										IsDoubleEntryField="False" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="True"
										IsInsertField="True" FieldDataType="DATE" FormatString="{0:d}" FieldLabelWidth="60px" FieldTextBoxWidth="100px"></def:datafieldcontrol></td>
							</tr>
							<tr>
								<td>
									<def:datafieldcontrol id="DASresp" runat="server" FieldDataType="INT" IsInsertField="True" IsInsertValueRequired="True"
										IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="Completed by (1=bio mom, 2=Stepmom, 3=Adoptive Mom, 4=Other, 9=Missing)"
										FieldTextBoxTabIndex="3" DatabaseField="DASresp" FieldTextBoxWidth="100px" ValidList="1,2,3,4,9"></def:datafieldcontrol>
								</td>
							</tr>
						</table>
						<asp:panel id="mainPanel" runat="server">
							<TABLE class="layout">
								<TR>
									<TD style="vertical-align:top">
										<TABLE class="layout" id="Table1">
											<TR>
												<TD>0=Single, never married<br/>
													1=Single, living with partner<br/>
													2=Married<br/>
													3=Separated<br/>
													4=Divorced<br/>
													9=Missing/Blank<br/>
													<def:datafieldcontrol id="DAS1MS1A" runat="server" FieldTextBoxWidth="40px" FieldDataType="INT" IsInsertField="False"
														IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
														FieldLabelText=" 1.A.  Marital status " FieldTextBoxTabIndex="3" DatabaseField="DAS1MS1A" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>0=Yes<br/>
													1=No<br/>
													9=Missing/Blank<br/>
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
												<TD>0=Always Agree<br/>
													1=Almost Always Agree<br/>
													2=Occasionally Disagree<br/>
													3=Frequently Disagree<br/>
													4=Almost Always Disagree<br/>
													5=Always Disagree<br/>
													9=Missing/Blank<br/>
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
										<TABLE class="layout" id="table_entry">
											<TR>
												<TD>0=All the time<br/>
													1=Most of the time<br/>
													2=More often than not<br/>
													3=Occasionally<br/>
													4=Rarely<br/>
													5=Never<br/>
													9=Missing/Blank<br/>
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
												<TD>0=Every day<br/>
													1=Almost Every day<br/>
													2=Occasionally<br/>
													3=Rarely<br/>
													4=Never<br/>
													9=Missing/Blank<br/>
													<def:datafieldcontrol id="DAS123" runat="server" FieldTextBoxWidth="40px" FieldDataType="INT" IsInsertField="False"
														IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
														FieldLabelText="23.  Do you kiss your mate?" FieldTextBoxTabIndex="31" DatabaseField="DAS123" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="DAS124" runat="server" FieldTextBoxWidth="40px" FieldDataType="INT" IsInsertField="False"
														IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
														FieldLabelText="24.  Do you and your mate engage in outside interests tog" FieldTextBoxTabIndex="32"
														DatabaseField="DAS124" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>0=Never<br/>
													1=Less than once a month<br/>
													2=Once/Twice a month<br/>
													3=Once/Twice a week<br/>
													4=Once a day<br/>
													5=More often<br/>
													9=Missing/Blank<br/>
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
												<TD>0=Yes<br/>
													1=No<br/>
													9=Missing/Blank<br/>
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
												<TD>0=Extremely unhappy<br/>
													1=Fairly unhappy<br/>
													2=A little unhappy<br/>
													3=Happy<br/>
													4=Very happy<br/>
													5=Extremely happy<br/>
													6=Perfect<br/>
													9=Missing/Blank<br/>
													<def:datafieldcontrol id="DAS131" runat="server" FieldTextBoxWidth="40px" FieldDataType="INT" IsInsertField="False"
														IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
														FieldLabelText="31.  Happiness in your relationship" FieldTextBoxTabIndex="39" DatabaseField="DAS131"
														ValidList="0,1,2,3,4,5,6,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>Entry 0 to 5, or 9 if missing/blank<br/>
													<def:datafieldcontrol id="DAS132" runat="server" FieldTextBoxWidth="40px" FieldDataType="INT" IsInsertField="False"
														IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
														FieldLabelText="32.  Future of your relationship" FieldTextBoxTabIndex="40" DatabaseField="DAS132"
														ValidList="0,1,2,3,4,5,9"></def:datafieldcontrol></TD>
											</TR>
										</TABLE>
									</TD>
								</TR>
							</TABLE>
							<br/>
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
