<%@ Page language="c#" Inherits="kt_csbsdp.kt_csbsdp" CodeFile="csbsdp.aspx.cs"  MasterPageFile="~/UWAC.master" %>

<%@ Register TagPrefix="def" Namespace="DataEntryFramework3" %>
<asp:Content ID="Content1" ContentPlaceHolderID="oBodyPlaceHolder" runat="server">
						<def:dataentrycontroller id="DataEntryController1" runat="server" ShowScoreButton="True" LookupField1DataType="TEXT"
							VerifiedField="verified" PrimaryKeyField="csbsdp_pk" MeasureName="CSBS DP" LookupTextBox1LabelText="Subject ID:"
							LookupTextBox2Visible="False" LookupField1="id" DatabaseTable="all_csbsdp" 
							AllowedStudyMeasures="365,566,779,956,1726,1767,1771,1808,1829,1849,1855,1870,2052,2480,2481,2482,2483,2792,2806,2822"
							LastScoredDateField="scored" LastUpdatedDateField="updated" LookupColumnHeaders="Measure,id,indexnum,clin,test date,rel. date"
							LookupColumns="studymeasname,id,indexnum,csclin,csdate{0:d},reliabilitydatedone{0:d}" ondoscore="DataEntryController1_DoScore"></def:dataentrycontroller>
						<table class="layout">
							<tr>
								<td style="vertical-align:top" width="216">
									<table class="layout" id="table_insert">
										<tr>
											<td><def:datafieldcontrol id="tapid" runat="server" FieldLabelWidth="100px" FieldTextBoxWidth="80px" DatabaseField="id"
													FieldTextBoxTabIndex="2" FieldLabelText="ID" IsDoubleEntryField="False" IsReadOnly="False" IsEntryValueRequired="False"
													IsEntryField="False" IsInsertValueRequired="True" IsInsertField="True" FieldDataType="TEXT"></def:datafieldcontrol></td>
										</tr>
										<tr>
											<td>
												<def:datafieldcontrol id="csdate" runat="server" FieldDataType="DATE" IsInsertField="False" IsInsertValueRequired="False"
													IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="Date completed"
													FieldTextBoxTabIndex="3" DatabaseField="csdate" FieldTextBoxWidth="80px" FieldLabelWidth="100px" FormatString="{0:d}"
													DESIGNTIMEDRAGDROP="20"></def:datafieldcontrol></td>
										</tr>
										<TR>
											<td><def:datafieldcontrol id="csclin" runat="server" FieldLabelWidth="100px" FieldTextBoxWidth="80px" DatabaseField="csclin"
													FieldTextBoxTabIndex="4" FieldLabelText="Clinician" IsDoubleEntryField="False" IsReadOnly="False"
													IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
													FieldDataType="TEXT"></def:datafieldcontrol></td>
										</TR>
										<TR>
											<TD>
												<def:datafieldcontrol id="reliabilityDateDone" runat="server" FieldDataType="DATE" IsInsertField="False"
													IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
													IsDoubleEntryField="False" FieldLabelText="Reliability Date (leave blank if not a reliability)" FieldTextBoxTabIndex="3"
													DatabaseField="reliabilityDateDone" FieldTextBoxWidth="80px" FieldLabelWidth="100px" FormatString="{0:d}"></def:datafieldcontrol></TD>
										</TR>
									</table>
								</td>
								<td style="vertical-align:top">
									<table class="layout" id="table_readonly">
										<tr>
											<td width="92">Date of birth</td>
											<td><def:datafieldcontrol id="csdob" runat="server" DatabaseField="csdob" FieldTextBoxTabIndex="5" FieldLabelText="Date of birth"
													IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
													IsInsertField="False" FieldDataType="DATE" FormatString="{0:d}" ShowFieldLabel="False" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></td>
										</tr>
										<tr>
											<td width="92" height="21">Age (months)</td>
											<td height="21"><def:datafieldcontrol id="csagem" runat="server" DatabaseField="csagem" FieldTextBoxTabIndex="6" FieldLabelText="Age (months)"
													IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
													IsInsertField="False" FieldDataType="INT" ShowFieldLabel="False" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></td>
										</tr>
										<tr>
											<td width="92">Age (y:m)</td>
											<td><def:datafieldcontrol id="csageym" runat="server" DatabaseField="csageym" FieldTextBoxTabIndex="7" FieldLabelText="Age (year:months)"
													IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
													IsInsertField="False" FieldDataType="TEXT" ShowFieldLabel="False" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></td>
										</tr>
										<tr>
											<td width="92">Norms table used:</td>
											<td><def:datafieldcontrol id="csagetbl" runat="server" DatabaseField="csagetbl" FieldTextBoxTabIndex="7" FieldLabelText="Age (year:months)"
													IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
													IsInsertField="False" FieldDataType="TEXT" ShowFieldLabel="False" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></td>
										</tr>
									</table>
								</td>
							</tr>
						</table>
						<br>
						<asp:panel id="mainPanel" Runat="server">
							<TABLE class="grid">
								<TR>
									<TD class="heading">Emotion and Eye Gaze</TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="csscal01" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="1. Gaze shifts "
											FieldTextBoxTabIndex="56" DatabaseField="csscal01" FieldTextBoxWidth="30px" FieldLabelWidth="200px"
											MinVal="0" MaxVal="6"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="csscal02" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="2. Shared positive affect "
											FieldTextBoxTabIndex="57" DatabaseField="csscal02" FieldTextBoxWidth="30px" FieldLabelWidth="200px"
											MinVal="0" MaxVal="6"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="csscal03" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="3. Gaze/point following "
											FieldTextBoxTabIndex="58" DatabaseField="csscal03" FieldTextBoxWidth="30px" FieldLabelWidth="200px"
											MinVal="0" MaxVal="2"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD class="heading">Communication</TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="csscal04" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="4. Rate of communicating "
											FieldTextBoxTabIndex="59" DatabaseField="csscal04" FieldTextBoxWidth="30px" FieldLabelWidth="200px"
											MinVal="0" MaxVal="18"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="csscal05" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="5. Behavior regulation "
											FieldTextBoxTabIndex="60" DatabaseField="csscal05" FieldTextBoxWidth="30px" FieldLabelWidth="200px"
											MinVal="0" MaxVal="6"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="csscal06" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="6. Social interaction "
											FieldTextBoxTabIndex="61" DatabaseField="csscal06" FieldTextBoxWidth="30px" FieldLabelWidth="200px"
											MinVal="0" MaxVal="6"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="csscal07" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="7. Joint attention "
											FieldTextBoxTabIndex="62" DatabaseField="csscal07" FieldTextBoxWidth="30px" FieldLabelWidth="200px"
											MinVal="0" MaxVal="6"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD class="heading">Gestures</TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="csscal08" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="8. Inventory of conventional gestures"
											FieldTextBoxTabIndex="63" DatabaseField="csscal08" FieldTextBoxWidth="30px" FieldLabelWidth="200px"
											MinVal="0" MaxVal="8"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="csscal09" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="9. Distal gestures "
											FieldTextBoxTabIndex="64" DatabaseField="csscal09" FieldTextBoxWidth="30px" FieldLabelWidth="200px"
											MinVal="0" MaxVal="6"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD class="heading">Sounds</TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="csscal10" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="10. Syllables with consonants "
											FieldTextBoxTabIndex="65" DatabaseField="csscal10" FieldTextBoxWidth="30px" FieldLabelWidth="200px"
											MinVal="0" MaxVal="6"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="csscal11" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="11. Inventory of consonants "
											FieldTextBoxTabIndex="66" DatabaseField="csscal11" FieldTextBoxWidth="30px" FieldLabelWidth="200px"
											MinVal="0" MaxVal="10"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD class="heading">Words</TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="csscal12" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="12. Words "
											FieldTextBoxTabIndex="67" DatabaseField="csscal12" FieldTextBoxWidth="30px" FieldLabelWidth="200px"
											MinVal="0" MaxVal="6"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="csscal13" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="13. Inventory of words "
											FieldTextBoxTabIndex="68" DatabaseField="csscal13" FieldTextBoxWidth="30px" FieldLabelWidth="200px"
											MinVal="0" MaxVal="16"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="csscal14" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="14. Word combinations "
											FieldTextBoxTabIndex="69" DatabaseField="csscal14" FieldTextBoxWidth="30px" FieldLabelWidth="200px"
											MinVal="0" MaxVal="6"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="csscal15" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="15. Inventory of word combinations"
											FieldTextBoxTabIndex="70" DatabaseField="csscal15" FieldTextBoxWidth="30px" FieldLabelWidth="200px"
											MinVal="0" MaxVal="8"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD class="heading">Understanding (Language Comprehension)</TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="cssc16on" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="16a. object names"
											FieldTextBoxTabIndex="71" DatabaseField="cssc16on" FieldTextBoxWidth="30px" FieldLabelWidth="200px"
											MinVal="0" MaxVal="3"></def:datafieldcontrol><BR>
										<def:datafieldcontrol id="cssc16pn" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="16b. person names"
											FieldTextBoxTabIndex="71" DatabaseField="cssc16pn" FieldTextBoxWidth="30px" FieldLabelWidth="200px"
											MinVal="0" MaxVal="2"></def:datafieldcontrol><BR>
										<def:datafieldcontrol id="cssc16bp" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="16c. body parts"
											FieldTextBoxTabIndex="71" DatabaseField="cssc16bp" FieldTextBoxWidth="30px" FieldLabelWidth="200px"
											MinVal="0" MaxVal="3"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD class="heading">Object Use</TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="csscal17" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="17. Inventory of action schemes "
											FieldTextBoxTabIndex="72" DatabaseField="csscal17" FieldTextBoxWidth="30px" FieldLabelWidth="200px"
											MinVal="0" MaxVal="12"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="csscal18" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="18. Action schemes toward other"
											FieldTextBoxTabIndex="73" DatabaseField="csscal18" FieldTextBoxWidth="30px" FieldLabelWidth="200px"
											MinVal="0" MaxVal="6"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="csscal19" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="19. Sequences action schemes "
											FieldTextBoxTabIndex="74" DatabaseField="csscal19" FieldTextBoxWidth="30px" FieldLabelWidth="200px"
											MinVal="0" MaxVal="6"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="csscal20" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="20. Stacks tower of blocks "
											FieldTextBoxTabIndex="75" DatabaseField="csscal20" FieldTextBoxWidth="30px" FieldLabelWidth="200px"
											MinVal="0" MaxVal="5"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
							<BR>
							<TABLE class="grid">
								<TR>
									<TD></TD>
									<TD>Weighted<BR>
										raw score</TD>
									<TD>Standard<BR>
										score</TD>
									<TD>Percentile<BR>
										rank</TD>
									<TD>Concern</TD>
								</TR>
								<TR>
									<TD class="heading" colSpan="5">Social Cluster Scores</TD>
								</TR>
								<TR>
									<TD>Emotion and Eye Gaze</TD>
									<TD>
										<def:datafieldcontrol id="cssemwt" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="cssemwt"
											FieldTextBoxTabIndex="8" DatabaseField="cssemwt" FieldTextBoxWidth="30px" RenderReadOnlyAsDiv="True"
											ShowFieldLabel="False" RegEx="^([0-9]|1[0-8]|-9)$" RegExDescription="Must be between 0 and 18 or -9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="cssemss" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="cssemss"
											FieldTextBoxTabIndex="9" DatabaseField="cssemss" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="cssempct" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="cssempct"
											FieldTextBoxTabIndex="10" DatabaseField="cssempct" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="cssemc" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="cssemc"
											FieldTextBoxTabIndex="11" DatabaseField="cssemc" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>Communication</TD>
									<TD>
										<def:datafieldcontrol id="csscmwt" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="csscmwt"
											FieldTextBoxTabIndex="12" DatabaseField="csscmwt" FieldTextBoxWidth="30px" RenderReadOnlyAsDiv="True"
											ShowFieldLabel="False" RegEx="^([0-9]|1[0-9]|2[0-4]|-9)$" RegExDescription="Must be between 0 and 24 or -9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="csscmss" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="csscmss"
											FieldTextBoxTabIndex="13" DatabaseField="csscmss" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="csscmpct" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="csscmpct"
											FieldTextBoxTabIndex="14" DatabaseField="csscmpct" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="csscmc" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="csscmc"
											FieldTextBoxTabIndex="15" DatabaseField="csscmc" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>Gestures</TD>
									<TD>
										<def:datafieldcontrol id="cssgtwt" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="cssgtwt"
											FieldTextBoxTabIndex="16" DatabaseField="cssgtwt" FieldTextBoxWidth="30px" RenderReadOnlyAsDiv="True"
											ShowFieldLabel="False" RegEx="^([0-9]|1[0-9]|2[0-2]|-9)$" RegExDescription="Must be between 0 and 22 or -9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="cssgtss" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="cssgtss"
											FieldTextBoxTabIndex="17" DatabaseField="cssgtss" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="cssgtpct" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="cssgtpct"
											FieldTextBoxTabIndex="18" DatabaseField="cssgtpct" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="cssgtc" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="cssgtc"
											FieldTextBoxTabIndex="19" DatabaseField="cssgtc" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD class="heading" colSpan="5">Speech Cluster Scores</TD>
								</TR>
								<TR>
									<TD>Sounds</TD>
									<TD>
										<def:datafieldcontrol id="cspsowt" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="cspsowt"
											FieldTextBoxTabIndex="20" DatabaseField="cspsowt" FieldTextBoxWidth="30px" RenderReadOnlyAsDiv="True"
											ShowFieldLabel="False" RegEx="^([0-9]|1[0-9]|2[0-6]|-9)$" RegExDescription="Must be between 0 and 26 or -9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="cspsoss" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="cspsoss"
											FieldTextBoxTabIndex="21" DatabaseField="cspsoss" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="cspsopct" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="cspsopct"
											FieldTextBoxTabIndex="22" DatabaseField="cspsopct" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="cspsoc" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="cspsoc"
											FieldTextBoxTabIndex="23" DatabaseField="cspsoc" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>Words</TD>
									<TD>
										<def:datafieldcontrol id="cspwowt" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="cspwowt"
											FieldTextBoxTabIndex="24" DatabaseField="cspwowt" FieldTextBoxWidth="30px" RenderReadOnlyAsDiv="True"
											ShowFieldLabel="False" RegEx="^([0-9]|1[0-9]|2[0-8]|-9)$" RegExDescription="Must be between 0 and 28 or -9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="cspwoss" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="cspwoss"
											FieldTextBoxTabIndex="25" DatabaseField="cspwoss" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="cspwopct" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="cspwopct"
											FieldTextBoxTabIndex="26" DatabaseField="cspwopct" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="cspwoc" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="cspwoc"
											FieldTextBoxTabIndex="27" DatabaseField="cspwoc" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD class="heading" colSpan="5">Symbolic Cluster Scores</TD>
								</TR>
								<TR>
									<TD>Understanding</TD>
									<TD>
										<def:datafieldcontrol id="csyunwt" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="csyunwt"
											FieldTextBoxTabIndex="28" DatabaseField="csyunwt" FieldTextBoxWidth="30px" RenderReadOnlyAsDiv="True"
											ShowFieldLabel="False" ValidList="0,3,6,9,12,15,18,21,24,-9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="csyunss" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="csyunss"
											FieldTextBoxTabIndex="29" DatabaseField="csyunss" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="csyunpct" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="csyunpct"
											FieldTextBoxTabIndex="30" DatabaseField="csyunpct" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="csyunc" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="csyunc"
											FieldTextBoxTabIndex="31" DatabaseField="csyunc" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>Object Use</TD>
									<TD>
										<def:datafieldcontrol id="csyouwt" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="csyouwt"
											FieldTextBoxTabIndex="32" DatabaseField="csyouwt" FieldTextBoxWidth="30px" RenderReadOnlyAsDiv="True"
											ShowFieldLabel="False" RegEx="^([0-9]|1[0-9]|2[0-9]|-9)$" RegExDescription="Must be between 0 and 29 or -9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="csyouss" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="csyouss"
											FieldTextBoxTabIndex="33" DatabaseField="csyouss" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="csyoupct" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="csyoupct"
											FieldTextBoxTabIndex="34" DatabaseField="csyoupct" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="csyouc" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="csyouc"
											FieldTextBoxTabIndex="35" DatabaseField="csyouc" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD class="heading" colSpan="5">Composite Scores</TD>
								</TR>
								<TR>
									<TD>Social</TD>
									<TD>
										<def:datafieldcontrol id="cssocc" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="cssocc"
											FieldTextBoxTabIndex="36" DatabaseField="cssocc" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="cssoccss" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="cssoccss"
											FieldTextBoxTabIndex="37" DatabaseField="cssoccss" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="cssoccpt" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="cssoccpt"
											FieldTextBoxTabIndex="38" DatabaseField="cssoccpt" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="cssoccc" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="cssoccc"
											FieldTextBoxTabIndex="39" DatabaseField="cssoccc" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>Speech</TD>
									<TD>
										<def:datafieldcontrol id="csspecc" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="csspecc"
											FieldTextBoxTabIndex="37" DatabaseField="csspecc" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="csspecss" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="csspecss"
											FieldTextBoxTabIndex="41" DatabaseField="csspecss" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="csspecpt" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="csspecpt"
											FieldTextBoxTabIndex="42" DatabaseField="csspecpt" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="csspeccc" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="csspeccc"
											FieldTextBoxTabIndex="43" DatabaseField="csspeccc" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>Symbolic</TD>
									<TD>
										<def:datafieldcontrol id="cssymcc" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="cssymcc"
											FieldTextBoxTabIndex="38" DatabaseField="cssymcc" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="cssymcss" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="cssymcss"
											FieldTextBoxTabIndex="45" DatabaseField="cssymcss" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="cssymcpt" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="cssymcpt"
											FieldTextBoxTabIndex="46" DatabaseField="cssymcpt" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="cssymbcc" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="cssymbcc"
											FieldTextBoxTabIndex="47" DatabaseField="cssymbcc" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD><B>TOTAL</B></TD>
									<TD>
										<def:datafieldcontrol id="cscctot" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="cscctot"
											FieldTextBoxTabIndex="39" DatabaseField="cscctot" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="csctotss" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="csctotss"
											FieldTextBoxTabIndex="49" DatabaseField="csctotss" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="csctotpt" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="csctotpt"
											FieldTextBoxTabIndex="50" DatabaseField="csctotpt" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="csctotc" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="csctotc"
											FieldTextBoxTabIndex="51" DatabaseField="csctotc" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
							<def:datafieldcontrol id="csscnote" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
								IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="Scoring notes:"
								FieldTextBoxTabIndex="7" DatabaseField="csscnote" FieldLabelWidth="100px" RenderReadOnlyAsDiv="True"
								ShowFieldLabel="True"></def:datafieldcontrol>
							<BR>
							<TABLE>
								<TR>
									<TD>
										<def:datafieldcontrol id="csvalid" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="Validity (1=valid, 2=questionable, 3=Invalid)"
											FieldTextBoxTabIndex="80" DatabaseField="csvalid" FieldTextBoxWidth="30px" FieldLabelWidth="100px"
											ValidList="1,2,3"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="cscmnt" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="Comments"
											FieldTextBoxTabIndex="81" DatabaseField="cscmnt" FieldTextBoxWidth="200px" FieldLabelWidth="100px"
											FieldTextBoxHeight="150px" FieldTextBoxMaxLength="200"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
							<BR>
							<TABLE class="layout">
								<TR>
									<TD>
										<def:datafieldcontrol id="created" runat="server" FieldDataType="DATE" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="created"
											FieldTextBoxTabIndex="43" DatabaseField="created" FieldLabelWidth="80px" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="createdBy" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="createdBy"
											FieldTextBoxTabIndex="44" DatabaseField="createdBy" FieldLabelWidth="80px" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="updated" runat="server" FieldDataType="DATE" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="updated"
											FieldTextBoxTabIndex="45" DatabaseField="updated" FieldLabelWidth="80px" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="updatedBy" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="updatedBy"
											FieldTextBoxTabIndex="46" DatabaseField="updatedBy" FieldLabelWidth="80px" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="scored" runat="server" FieldDataType="DATE" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="scored"
											FieldTextBoxTabIndex="237" DatabaseField="scored" FieldLabelWidth="80px" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="scoredBy" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="scoredBy"
											FieldTextBoxTabIndex="238" DatabaseField="scoredBy" FieldLabelWidth="80px" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
						</asp:panel></asp:Content>
