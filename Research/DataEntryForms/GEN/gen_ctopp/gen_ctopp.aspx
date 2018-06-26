<%@ Page language="c#" Inherits="gen_ctopp.gen_ctopp" CodeFile="gen_ctopp.aspx.cs"  MasterPageFile="~/UWAC.master" %>
<%@ Register TagPrefix="def" Namespace="DataEntryFramework.Old" %>

<asp:Content ID="Content1" ContentPlaceHolderID="oBodyPlaceHolder" runat="server">
						<def:dataentrycontroller id="DataEntryController1" runat="server" DatabaseTable="gen_ctopp" LookupField1="indid"
							LookupTextBox1LabelText="GEN ID:" LookupTextBox2Visible="False" MeasureName="GEN CTOPP" PrimaryKeyField="ctop_pk"
							VerifiedField="verified" StudyMeasID="150" ShowScoreButton="True" ondoscore="DataEntryController1_DoScore"></def:dataentrycontroller>
						<table id="table_insert" class="layout">
							<tr>
								<td><def:datafieldcontrol id="indid" runat="server" FieldDataType="INT" IsInsertField="True" IsInsertValueRequired="True"
										IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="GEN ID"
										FieldTextBoxTabIndex="2" DatabaseField="indid" FieldLabelWidth="80px" FieldTextBoxWidth="80px"></def:datafieldcontrol>
								</td>
							</tr>
							<tr>
								<td><def:datafieldcontrol id="CTOPdate" runat="server" FieldDataType="DATE" IsInsertField="False" IsInsertValueRequired="False"
										IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="Test Date"
										FieldTextBoxTabIndex="3" DatabaseField="CTOPdate" FieldLabelWidth="80px" FieldTextBoxWidth="80px"
										FormatString="{0:d}"></def:datafieldcontrol>
								</td>
							</tr>
							<tr>
								<td><def:datafieldcontrol id="CTOPclin" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
										IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="Clinician"
										FieldTextBoxTabIndex="4" DatabaseField="CTOPclin" FieldLabelWidth="80px" FieldTextBoxWidth="80px"></def:datafieldcontrol>
								</td>
							</tr>
							<tr>
								<td>
									<def:datafieldcontrol id="CTageym" runat="server" DatabaseField="CTageym" FieldTextBoxTabIndex="5" FieldLabelText="Age:"
										IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
										IsInsertField="False" FieldDataType="TEXT" ShowFieldLabel="True" RenderReadOnlyAsDiv="True" FieldLabelWidth="60px"></def:datafieldcontrol></td>
							</tr>
							<tr>
								<td>
									<def:datafieldcontrol id="CTnorms" runat="server" DatabaseField="CTnorms" FieldTextBoxTabIndex="5" FieldLabelText="Norms Used:"
										IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
										IsInsertField="False" FieldDataType="TEXT" ShowFieldLabel="True" RenderReadOnlyAsDiv="True" FieldLabelWidth="60px"></def:datafieldcontrol></td>
							</tr>
						</table>
						<br>
						<asp:Panel Runat="server" ID="mainPanel">
							<TABLE class="layout">
								<TR>
									<TD>
										<TABLE class="grid">
											<TR>
												<TD><B>Subtests</B><BR>
													(Use -99<BR>
													For Missing)</TD>
												<TD class="heading">Raw<BR>
													Score</TD>
												<TD class="heading">Age<BR>
													Equiv.</TD>
												<TD class="heading">%ile</TD>
												<TD class="heading">Std.<BR>
													Score</TD>
											</TR>
											<TR>
												<TD class="heading">Rapid Digit (RD) Naming</TD>
												<TD>
													<def:datafieldcontrol id="RD_raw" runat="server" FieldTextBoxWidth="40px" FieldLabelWidth="250px" DatabaseField="RD_raw"
														FieldTextBoxTabIndex="5" FieldLabelText="Rapid Digit Naming (RD)  raw score" IsDoubleEntryField="True"
														IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
														FieldDataType="INT" ShowFieldLabel="False" DESIGNTIMEDRAGDROP="159"></def:datafieldcontrol></TD>
												<TD>
													<def:datafieldcontrol id="CTRDaeym" runat="server" DatabaseField="CTRDaeym" FieldTextBoxTabIndex="5" FieldLabelText="Datafieldcontrol1"
														IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="TEXT" RenderReadOnlyAsDiv="True" ShowFieldLabel="False" DESIGNTIMEDRAGDROP="50"></def:datafieldcontrol></TD>
												<TD>
													<def:datafieldcontrol id="CTRDpx" runat="server" DatabaseField="CTRDpx" FieldTextBoxTabIndex="5" FieldLabelText="Datafieldcontrol1"
														IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="TEXT" RenderReadOnlyAsDiv="True" ShowFieldLabel="False" DESIGNTIMEDRAGDROP="158"></def:datafieldcontrol></TD>
												<TD>
													<def:datafieldcontrol id="CTRDss" runat="server" DatabaseField="CTRDss" FieldTextBoxTabIndex="5" FieldLabelText="Datafieldcontrol1"
														IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="INT" RenderReadOnlyAsDiv="True" ShowFieldLabel="False" DESIGNTIMEDRAGDROP="126"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD class="heading">Nonword (NR) Repetition</TD>
												<TD>
													<def:datafieldcontrol id="NR_raw" runat="server" FieldTextBoxWidth="40px" FieldLabelWidth="250px" DatabaseField="NR_raw"
														FieldTextBoxTabIndex="6" FieldLabelText="Nonword Repetition (NR) raw score" IsDoubleEntryField="True"
														IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
														FieldDataType="INT" ShowFieldLabel="False"></def:datafieldcontrol></TD>
												<TD>
													<def:datafieldcontrol id="CTNRaeym" runat="server" DatabaseField="CTNRaeym" FieldTextBoxTabIndex="5" FieldLabelText="CTNRaeym"
														IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="TEXT" RenderReadOnlyAsDiv="True" ShowFieldLabel="False" DESIGNTIMEDRAGDROP="116"></def:datafieldcontrol></TD>
												<TD>
													<def:datafieldcontrol id="CTNRpx" runat="server" DatabaseField="CTNRpx" FieldTextBoxTabIndex="5" FieldLabelText="Datafieldcontrol1"
														IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="TEXT" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
												<TD>
													<def:datafieldcontrol id="CTNRss" runat="server" DatabaseField="CTNRss" FieldTextBoxTabIndex="5" FieldLabelText="Datafieldcontrol1"
														IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="INT" RenderReadOnlyAsDiv="True" ShowFieldLabel="False" DESIGNTIMEDRAGDROP="127"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD class="heading">Rapid Letter (RL) Naming</TD>
												<TD>
													<def:datafieldcontrol id="RL_raw" runat="server" FieldTextBoxWidth="40px" FieldLabelWidth="250px" DatabaseField="RL_raw"
														FieldTextBoxTabIndex="7" FieldLabelText="Rapid Letter Naming (RL) raw score" IsDoubleEntryField="True"
														IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
														FieldDataType="INT" ShowFieldLabel="False"></def:datafieldcontrol></TD>
												<TD>
													<def:datafieldcontrol id="CTRLaeym" runat="server" DatabaseField="CTRLaeym" FieldTextBoxTabIndex="5" FieldLabelText="CTRLaeym"
														IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="TEXT" RenderReadOnlyAsDiv="True" ShowFieldLabel="False" DESIGNTIMEDRAGDROP="117"></def:datafieldcontrol></TD>
												<TD>
													<def:datafieldcontrol id="CTRLpx" runat="server" DatabaseField="CTRLpx" FieldTextBoxTabIndex="5" FieldLabelText="Datafieldcontrol1"
														IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="TEXT" RenderReadOnlyAsDiv="True" ShowFieldLabel="False" DESIGNTIMEDRAGDROP="122"></def:datafieldcontrol></TD>
												<TD>
													<def:datafieldcontrol id="CTRLss" runat="server" DatabaseField="CTRLss" FieldTextBoxTabIndex="5" FieldLabelText="Datafieldcontrol1"
														IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="INT" RenderReadOnlyAsDiv="True" ShowFieldLabel="False" DESIGNTIMEDRAGDROP="128"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD class="heading">Rapid Color (RC) Naming</TD>
												<TD>
													<def:datafieldcontrol id="RC_raw" runat="server" FieldTextBoxWidth="40px" FieldLabelWidth="250px" DatabaseField="RC_raw"
														FieldTextBoxTabIndex="8" FieldLabelText="Rapid Color Naming (RC) raw score" IsDoubleEntryField="True"
														IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
														FieldDataType="INT" ShowFieldLabel="False"></def:datafieldcontrol></TD>
												<TD>
													<def:datafieldcontrol id="CTRCaeym" runat="server" DatabaseField="CTRCaeym" FieldTextBoxTabIndex="5" FieldLabelText="CTRCaeym"
														IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="TEXT" RenderReadOnlyAsDiv="True" ShowFieldLabel="False" DESIGNTIMEDRAGDROP="118"></def:datafieldcontrol></TD>
												<TD>
													<def:datafieldcontrol id="CTRCpx" runat="server" DatabaseField="CTRCpx" FieldTextBoxTabIndex="5" FieldLabelText="Datafieldcontrol1"
														IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="TEXT" RenderReadOnlyAsDiv="True" ShowFieldLabel="False" DESIGNTIMEDRAGDROP="124"></def:datafieldcontrol></TD>
												<TD>
													<def:datafieldcontrol id="CTRCss" runat="server" DatabaseField="CTRCss" FieldTextBoxTabIndex="5" FieldLabelText="Datafieldcontrol1"
														IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="INT" RenderReadOnlyAsDiv="True" ShowFieldLabel="False" DESIGNTIMEDRAGDROP="129"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD class="heading">Rapid Object (RO) Naming</TD>
												<TD>
													<def:datafieldcontrol id="RO_raw" runat="server" FieldTextBoxWidth="40px" FieldLabelWidth="250px" DatabaseField="RO_raw"
														FieldTextBoxTabIndex="9" FieldLabelText="Rapid Object Naming (RO) raw score" IsDoubleEntryField="True"
														IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
														FieldDataType="INT" ShowFieldLabel="False"></def:datafieldcontrol></TD>
												<TD>
													<def:datafieldcontrol id="CTROaeym" runat="server" DatabaseField="CTROaeym" FieldTextBoxTabIndex="5" FieldLabelText="CTROaeym"
														IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="TEXT" RenderReadOnlyAsDiv="True" ShowFieldLabel="False" DESIGNTIMEDRAGDROP="673"></def:datafieldcontrol></TD>
												<TD>
													<def:datafieldcontrol id="CTROpx" runat="server" DatabaseField="CTROpx" FieldTextBoxTabIndex="5" FieldLabelText="Datafieldcontrol1"
														IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="TEXT" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
												<TD>
													<def:datafieldcontrol id="CTROss" runat="server" DatabaseField="CTROss" FieldTextBoxTabIndex="5" FieldLabelText="Datafieldcontrol1"
														IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="INT" RenderReadOnlyAsDiv="True" ShowFieldLabel="False" DESIGNTIMEDRAGDROP="606"></def:datafieldcontrol></TD>
											</TR>
										</TABLE>
									</TD>
									<TD style="vertical-align:top">
										<TABLE class="grid">
											<TR>
												<TD><B>Composites</B></TD>
												<TD class="heading">Sums of<BR>
													SS</TD>
												<TD class="heading">%ile</TD>
												<TD class="heading">Composite<BR>
													Scores</TD>
											</TR>
											<TR>
												<TD class="heading" height="21">Rapid Naming</TD>
												<TD height="21">
													<def:datafieldcontrol id="CTRNCsum" runat="server" DatabaseField="CTRNCsum" FieldTextBoxTabIndex="5" FieldLabelText="Datafieldcontrol1"
														IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="INT" RenderReadOnlyAsDiv="True" ShowFieldLabel="False" DESIGNTIMEDRAGDROP="729"></def:datafieldcontrol></TD>
												<TD height="21">
													<def:datafieldcontrol id="CTRNCpx" runat="server" DatabaseField="CTRNCpx" FieldTextBoxTabIndex="5" FieldLabelText="CTROaeym"
														IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="TEXT" RenderReadOnlyAsDiv="True" ShowFieldLabel="False" DESIGNTIMEDRAGDROP="731"></def:datafieldcontrol></TD>
												<TD height="21">
													<def:datafieldcontrol id="CTRNCss" runat="server" DatabaseField="CTRNCss" FieldTextBoxTabIndex="5" FieldLabelText="Datafieldcontrol1"
														IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="INT" RenderReadOnlyAsDiv="True" ShowFieldLabel="False" DESIGNTIMEDRAGDROP="733"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD class="heading">Alternate Rapid<BR>
													Naming</TD>
												<TD>
													<def:datafieldcontrol id="CTARNCsm" runat="server" DatabaseField="CTARNCsm" FieldTextBoxTabIndex="5" FieldLabelText="Datafieldcontrol1"
														IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="INT" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
												<TD>
													<def:datafieldcontrol id="CTARNCpx" runat="server" DatabaseField="CTARNCpx" FieldTextBoxTabIndex="5" FieldLabelText="CTROaeym"
														IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="TEXT" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
												<TD>
													<def:datafieldcontrol id="CTARNCss" runat="server" DatabaseField="CTARNCss" FieldTextBoxTabIndex="5" FieldLabelText="Datafieldcontrol1"
														IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="INT" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
											</TR>
										</TABLE>
									</TD>
								</TR>
							</TABLE>
							<def:datafieldcontrol id="CTscrmsg" runat="server" FieldLabelWidth="150px" DatabaseField="CTscrmsg" FieldTextBoxTabIndex="5"
								FieldLabelText="Scoring Message:" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
								IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT" RenderReadOnlyAsDiv="True"
								ShowFieldLabel="True"></def:datafieldcontrol>
							<BR>
							<BR>
							<TABLE class="grid" id="table_entry">
								<TR>
									<TD>
										<def:datafieldcontrol id="CTOPvld" runat="server" FieldTextBoxWidth="40px" FieldLabelWidth="250px" DatabaseField="CTOPvld"
											FieldTextBoxTabIndex="10" FieldLabelText="Validity (1=Yes, 2=Yes, w/questions, 3=No, Invalid)" IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="1,2,3"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="CTOPcmnt" runat="server" FieldTextBoxWidth="200px" FieldLabelWidth="80px" DatabaseField="CTOPcmnt"
											FieldTextBoxTabIndex="11" FieldLabelText="Comment" IsDoubleEntryField="False" IsReadOnly="False" IsEntryValueRequired="False"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT" FieldTextBoxHeight="150px"
											FieldTextBoxTextMode="MultiLine" FieldTextBoxMaxLength="100"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
							<BR>
							<TABLE class="layout" id="table_readonly">
								<TR>
									<TD>
										<def:datafieldcontrol id="created" runat="server" FieldLabelWidth="80px" DatabaseField="created" FieldTextBoxTabIndex="13"
											FieldLabelText="created" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="DATE" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="createdBy" runat="server" FieldLabelWidth="80px" DatabaseField="createdBy" FieldTextBoxTabIndex="14"
											FieldLabelText="createdBy" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="updated" runat="server" FieldLabelWidth="80px" DatabaseField="updated" FieldTextBoxTabIndex="15"
											FieldLabelText="updated" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="DATE" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="updatedBy" runat="server" FieldLabelWidth="80px" DatabaseField="updatedBy" FieldTextBoxTabIndex="16"
											FieldLabelText="updatedBy" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT" RenderReadOnlyAsDiv="True"
											DESIGNTIMEDRAGDROP="296"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="Datafieldcontrol1" runat="server" FieldLabelWidth="80px" DatabaseField="scored"
											FieldTextBoxTabIndex="16" FieldLabelText="scored" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT" RenderReadOnlyAsDiv="True"
											DESIGNTIMEDRAGDROP="395"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="Datafieldcontrol2" runat="server" FieldLabelWidth="80px" DatabaseField="scoredBy"
											FieldTextBoxTabIndex="16" FieldLabelText="scoredBy" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
						</asp:Panel>
					</asp:Content>
