<%@ Register TagPrefix="def" Namespace="DataEntryFramework.Old" %>

<%@ Page language="c#" Inherits="tap_csbsdp.tap_csbsdp" CodeFile="tap_csbsdp.aspx.cs"  MasterPageFile="~/UWAC.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="oBodyPlaceHolder" runat="server">
						<def:dataentrycontroller id="DataEntryController1" runat="server" DatabaseTable="tap_csbsdp" LookupField1="tapid"
							LookupTextBox2Visible="False" LookupTextBox1LabelText="TAP ID:" MeasureName="TAP CSBS DP" PrimaryKeyField="csbsdp_pk"
							VerifiedField="verified" LookupField1DataType="TEXT" ShowScoreButton="True" StudyMeasID="365" ondoscore="DataEntryController1_DoScore"></def:dataentrycontroller>
						<table class="layout">
							<tr>
								<td style="vertical-align:top" width="216">
									<table id="table_insert" class="layout">
										<tr>
											<td><def:datafieldcontrol id="tapid" runat="server" FieldDataType="TEXT" IsInsertField="True" IsInsertValueRequired="True"
													IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="TAP ID"
													FieldTextBoxTabIndex="2" DatabaseField="tapid" FieldTextBoxWidth="80px" RegEx="^[T][A][P][0-9][0-9][0-9]$"
													RegExDescription="TAP ID must  look like TAP###" FieldLabelWidth="100px"></def:datafieldcontrol>
											</td>
										</tr>
										<tr>
											<td><def:datafieldcontrol id="csdate" runat="server" FieldDataType="DATE" IsInsertField="False" IsInsertValueRequired="False"
													IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="Date completed"
													FieldTextBoxTabIndex="3" DatabaseField="csdate" FieldTextBoxWidth="80px" FormatString="{0:d}" FieldLabelWidth="100px"></def:datafieldcontrol>
											</td>
										</tr>
										<tr>
											<td><def:datafieldcontrol id="csclin" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
													IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="Clinician"
													FieldTextBoxTabIndex="4" DatabaseField="csclin" FieldTextBoxWidth="80px" FieldLabelWidth="100px"></def:datafieldcontrol>
											</td>
										</tr>
									</table>
								</td>
								<td style="vertical-align:top">
									<table id="table_readonly" class="layout">
										<tr>
											<td width="92">Date of birth</td>
											<td><def:datafieldcontrol id="csdob" runat="server" FieldDataType="DATE" IsInsertField="False" IsInsertValueRequired="False"
													IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="Date of birth"
													FieldTextBoxTabIndex="5" DatabaseField="csdob" RenderReadOnlyAsDiv="True" ShowFieldLabel="False" FormatString="{0:d}"></def:datafieldcontrol>
											</td>
										</tr>
										<tr>
											<td width="92" height="21">Age (months)</td>
											<td height="21"><def:datafieldcontrol id="csagem" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
													IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="Age (months)"
													FieldTextBoxTabIndex="6" DatabaseField="csagem" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol>
											</td>
										</tr>
										<tr>
											<td width="92">Age (y:m)</td>
											<td><def:datafieldcontrol id="csageym" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
													IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="Age (year:months)"
													FieldTextBoxTabIndex="7" DatabaseField="csageym" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol>
											</td>
										</tr>
										<tr>
											<td width="92">Norms table used:</td>
											<td><def:datafieldcontrol id="csagetbl" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
													IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="Age (year:months)"
													FieldTextBoxTabIndex="7" DatabaseField="csagetbl" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol>
											</td>
										</tr>
									</table>
								</td>
							</tr>
						</table>
						<br>
						<asp:Panel Runat="server" ID="mainPanel">
							<TABLE class="grid">
								<TR>
									<TD class="heading">Emotion and Eye Gaze</TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="csscal01" runat="server" FieldLabelWidth="200px" FieldTextBoxWidth="30px" DatabaseField="csscal01"
											FieldTextBoxTabIndex="56" FieldLabelText="1. Gaze shifts " IsDoubleEntryField="True" IsReadOnly="False"
											IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" MaxVal="6" MinVal="0"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="csscal02" runat="server" FieldLabelWidth="200px" FieldTextBoxWidth="30px" DatabaseField="csscal02"
											FieldTextBoxTabIndex="57" FieldLabelText="2. Shared positive affect " IsDoubleEntryField="True" IsReadOnly="False"
											IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" MaxVal="6" MinVal="0"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="csscal03" runat="server" FieldLabelWidth="200px" FieldTextBoxWidth="30px" DatabaseField="csscal03"
											FieldTextBoxTabIndex="58" FieldLabelText="3. Gaze/point following " IsDoubleEntryField="True" IsReadOnly="False"
											IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" MaxVal="2" MinVal="0"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD class="heading">Communication</TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="csscal04" runat="server" FieldLabelWidth="200px" FieldTextBoxWidth="30px" DatabaseField="csscal04"
											FieldTextBoxTabIndex="59" FieldLabelText="4. Rate of communicating " IsDoubleEntryField="True" IsReadOnly="False"
											IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" MaxVal="18" MinVal="0"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="csscal05" runat="server" FieldLabelWidth="200px" FieldTextBoxWidth="30px" DatabaseField="csscal05"
											FieldTextBoxTabIndex="60" FieldLabelText="5. Behavior regulation " IsDoubleEntryField="True" IsReadOnly="False"
											IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" MaxVal="6" MinVal="0"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="csscal06" runat="server" FieldLabelWidth="200px" FieldTextBoxWidth="30px" DatabaseField="csscal06"
											FieldTextBoxTabIndex="61" FieldLabelText="6. Social interaction " IsDoubleEntryField="True" IsReadOnly="False"
											IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" MaxVal="6" MinVal="0"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="csscal07" runat="server" FieldLabelWidth="200px" FieldTextBoxWidth="30px" DatabaseField="csscal07"
											FieldTextBoxTabIndex="62" FieldLabelText="7. Joint attention " IsDoubleEntryField="True" IsReadOnly="False"
											IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" MaxVal="6" MinVal="0"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD class="heading">Gestures</TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="csscal08" runat="server" FieldLabelWidth="200px" FieldTextBoxWidth="30px" DatabaseField="csscal08"
											FieldTextBoxTabIndex="63" FieldLabelText="8. Inventory of conventional gestures" IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" MaxVal="8" MinVal="0"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="csscal09" runat="server" FieldLabelWidth="200px" FieldTextBoxWidth="30px" DatabaseField="csscal09"
											FieldTextBoxTabIndex="64" FieldLabelText="9. Distal gestures " IsDoubleEntryField="True" IsReadOnly="False"
											IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" MaxVal="6" MinVal="0"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD class="heading">Sounds</TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="csscal10" runat="server" FieldLabelWidth="200px" FieldTextBoxWidth="30px" DatabaseField="csscal10"
											FieldTextBoxTabIndex="65" FieldLabelText="10. Syllables with consonants " IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" MaxVal="6" MinVal="0"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="csscal11" runat="server" FieldLabelWidth="200px" FieldTextBoxWidth="30px" DatabaseField="csscal11"
											FieldTextBoxTabIndex="66" FieldLabelText="11. Inventory of consonants " IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" MaxVal="10" MinVal="0"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD class="heading">Words</TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="csscal12" runat="server" FieldLabelWidth="200px" FieldTextBoxWidth="30px" DatabaseField="csscal12"
											FieldTextBoxTabIndex="67" FieldLabelText="12. Words " IsDoubleEntryField="True" IsReadOnly="False"
											IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" MaxVal="6" MinVal="0"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="csscal13" runat="server" FieldLabelWidth="200px" FieldTextBoxWidth="30px" DatabaseField="csscal13"
											FieldTextBoxTabIndex="68" FieldLabelText="13. Inventory of words " IsDoubleEntryField="True" IsReadOnly="False"
											IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" MaxVal="16" MinVal="0"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="csscal14" runat="server" FieldLabelWidth="200px" FieldTextBoxWidth="30px" DatabaseField="csscal14"
											FieldTextBoxTabIndex="69" FieldLabelText="14. Word combinations " IsDoubleEntryField="True" IsReadOnly="False"
											IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" MaxVal="6" MinVal="0"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="csscal15" runat="server" FieldLabelWidth="200px" FieldTextBoxWidth="30px" DatabaseField="csscal15"
											FieldTextBoxTabIndex="70" FieldLabelText="15. Inventory of word combinations" IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" MaxVal="8" MinVal="0"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD class="heading">Understanding (Language Comprehension)</TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="cssc16on" runat="server" FieldLabelWidth="200px" FieldTextBoxWidth="30px" DatabaseField="cssc16on"
											FieldTextBoxTabIndex="71" FieldLabelText="16a. object names" IsDoubleEntryField="True" IsReadOnly="False"
											IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" MaxVal="3" MinVal="0"></def:datafieldcontrol><BR>
										<def:datafieldcontrol id="cssc16pn" runat="server" FieldLabelWidth="200px" FieldTextBoxWidth="30px" DatabaseField="cssc16pn"
											FieldTextBoxTabIndex="71" FieldLabelText="16b. person names" IsDoubleEntryField="True" IsReadOnly="False"
											IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" MaxVal="2" MinVal="0"></def:datafieldcontrol><BR>
										<def:datafieldcontrol id="cssc16bp" runat="server" FieldLabelWidth="200px" FieldTextBoxWidth="30px" DatabaseField="cssc16bp"
											FieldTextBoxTabIndex="71" FieldLabelText="16c. body parts" IsDoubleEntryField="True" IsReadOnly="False"
											IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" MaxVal="3" MinVal="0"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD class="heading">Object Use</TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="csscal17" runat="server" FieldLabelWidth="200px" FieldTextBoxWidth="30px" DatabaseField="csscal17"
											FieldTextBoxTabIndex="72" FieldLabelText="17. Inventory of action schemes " IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" MaxVal="12" MinVal="0"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="csscal18" runat="server" FieldLabelWidth="200px" FieldTextBoxWidth="30px" DatabaseField="csscal18"
											FieldTextBoxTabIndex="73" FieldLabelText="18. Action schemes toward other" IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" MaxVal="6" MinVal="0"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="csscal19" runat="server" FieldLabelWidth="200px" FieldTextBoxWidth="30px" DatabaseField="csscal19"
											FieldTextBoxTabIndex="74" FieldLabelText="19. Sequences action schemes " IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" MaxVal="6" MinVal="0"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="csscal20" runat="server" FieldLabelWidth="200px" FieldTextBoxWidth="30px" DatabaseField="csscal20"
											FieldTextBoxTabIndex="75" FieldLabelText="20. Stacks tower of blocks " IsDoubleEntryField="True" IsReadOnly="False"
											IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" MaxVal="5" MinVal="0"></def:datafieldcontrol></TD>
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
										<def:datafieldcontrol id="cssemwt" runat="server" RegExDescription="Must be between 0 and 18 or -9" RegEx="^([0-9]|1[0-8]|-9)$"
											FieldTextBoxWidth="30px" DatabaseField="cssemwt" FieldTextBoxTabIndex="8" FieldLabelText="cssemwt"
											IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ShowFieldLabel="False" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="cssemss" runat="server" DatabaseField="cssemss" FieldTextBoxTabIndex="9" FieldLabelText="cssemss"
											IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ShowFieldLabel="False" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="cssempct" runat="server" DatabaseField="cssempct" FieldTextBoxTabIndex="10"
											FieldLabelText="cssempct" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ShowFieldLabel="False"
											RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="cssemc" runat="server" DatabaseField="cssemc" FieldTextBoxTabIndex="11" FieldLabelText="cssemc"
											IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="TEXT" ShowFieldLabel="False" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>Communication</TD>
									<TD>
										<def:datafieldcontrol id="csscmwt" runat="server" RegExDescription="Must be between 0 and 24 or -9" RegEx="^([0-9]|1[0-9]|2[0-4]|-9)$"
											FieldTextBoxWidth="30px" DatabaseField="csscmwt" FieldTextBoxTabIndex="12" FieldLabelText="csscmwt"
											IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ShowFieldLabel="False" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="csscmss" runat="server" DatabaseField="csscmss" FieldTextBoxTabIndex="13" FieldLabelText="csscmss"
											IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ShowFieldLabel="False" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="csscmpct" runat="server" DatabaseField="csscmpct" FieldTextBoxTabIndex="14"
											FieldLabelText="csscmpct" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ShowFieldLabel="False"
											RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="csscmc" runat="server" DatabaseField="csscmc" FieldTextBoxTabIndex="15" FieldLabelText="csscmc"
											IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="TEXT" ShowFieldLabel="False" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>Gestures</TD>
									<TD>
										<def:datafieldcontrol id="cssgtwt" runat="server" RegExDescription="Must be between 0 and 22 or -9" RegEx="^([0-9]|1[0-9]|2[0-2]|-9)$"
											FieldTextBoxWidth="30px" DatabaseField="cssgtwt" FieldTextBoxTabIndex="16" FieldLabelText="cssgtwt"
											IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ShowFieldLabel="False" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="cssgtss" runat="server" DatabaseField="cssgtss" FieldTextBoxTabIndex="17" FieldLabelText="cssgtss"
											IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ShowFieldLabel="False" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="cssgtpct" runat="server" DatabaseField="cssgtpct" FieldTextBoxTabIndex="18"
											FieldLabelText="cssgtpct" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ShowFieldLabel="False"
											RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="cssgtc" runat="server" DatabaseField="cssgtc" FieldTextBoxTabIndex="19" FieldLabelText="cssgtc"
											IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="TEXT" ShowFieldLabel="False" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD class="heading" colSpan="5">Speech Cluster Scores</TD>
								</TR>
								<TR>
									<TD>Sounds</TD>
									<TD>
										<def:datafieldcontrol id="cspsowt" runat="server" RegExDescription="Must be between 0 and 26 or -9" RegEx="^([0-9]|1[0-9]|2[0-6]|-9)$"
											FieldTextBoxWidth="30px" DatabaseField="cspsowt" FieldTextBoxTabIndex="20" FieldLabelText="cspsowt"
											IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ShowFieldLabel="False" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="cspsoss" runat="server" DatabaseField="cspsoss" FieldTextBoxTabIndex="21" FieldLabelText="cspsoss"
											IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ShowFieldLabel="False" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="cspsopct" runat="server" DatabaseField="cspsopct" FieldTextBoxTabIndex="22"
											FieldLabelText="cspsopct" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ShowFieldLabel="False"
											RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="cspsoc" runat="server" DatabaseField="cspsoc" FieldTextBoxTabIndex="23" FieldLabelText="cspsoc"
											IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="TEXT" ShowFieldLabel="False" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>Words</TD>
									<TD>
										<def:datafieldcontrol id="cspwowt" runat="server" RegExDescription="Must be between 0 and 28 or -9" RegEx="^([0-9]|1[0-9]|2[0-8]|-9)$"
											FieldTextBoxWidth="30px" DatabaseField="cspwowt" FieldTextBoxTabIndex="24" FieldLabelText="cspwowt"
											IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ShowFieldLabel="False" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="cspwoss" runat="server" DatabaseField="cspwoss" FieldTextBoxTabIndex="25" FieldLabelText="cspwoss"
											IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ShowFieldLabel="False" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="cspwopct" runat="server" DatabaseField="cspwopct" FieldTextBoxTabIndex="26"
											FieldLabelText="cspwopct" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ShowFieldLabel="False"
											RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="cspwoc" runat="server" DatabaseField="cspwoc" FieldTextBoxTabIndex="27" FieldLabelText="cspwoc"
											IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="TEXT" ShowFieldLabel="False" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD class="heading" colSpan="5">Symbolic Cluster Scores</TD>
								</TR>
								<TR>
									<TD>Understanding</TD>
									<TD>
										<def:datafieldcontrol id="csyunwt" runat="server" FieldTextBoxWidth="30px" DatabaseField="csyunwt" FieldTextBoxTabIndex="28"
											FieldLabelText="csyunwt" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ShowFieldLabel="False"
											RenderReadOnlyAsDiv="True" ValidList="0,3,6,9,12,15,18,21,24,-9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="csyunss" runat="server" DatabaseField="csyunss" FieldTextBoxTabIndex="29" FieldLabelText="csyunss"
											IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ShowFieldLabel="False" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="csyunpct" runat="server" DatabaseField="csyunpct" FieldTextBoxTabIndex="30"
											FieldLabelText="csyunpct" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ShowFieldLabel="False"
											RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="csyunc" runat="server" DatabaseField="csyunc" FieldTextBoxTabIndex="31" FieldLabelText="csyunc"
											IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="TEXT" ShowFieldLabel="False" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>Object Use</TD>
									<TD>
										<def:datafieldcontrol id="csyouwt" runat="server" RegExDescription="Must be between 0 and 29 or -9" RegEx="^([0-9]|1[0-9]|2[0-9]|-9)$"
											FieldTextBoxWidth="30px" DatabaseField="csyouwt" FieldTextBoxTabIndex="32" FieldLabelText="csyouwt"
											IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ShowFieldLabel="False" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="csyouss" runat="server" DatabaseField="csyouss" FieldTextBoxTabIndex="33" FieldLabelText="csyouss"
											IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ShowFieldLabel="False" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="csyoupct" runat="server" DatabaseField="csyoupct" FieldTextBoxTabIndex="34"
											FieldLabelText="csyoupct" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ShowFieldLabel="False"
											RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="csyouc" runat="server" DatabaseField="csyouc" FieldTextBoxTabIndex="35" FieldLabelText="csyouc"
											IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="TEXT" ShowFieldLabel="False" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD class="heading" colSpan="5">Composite Scores</TD>
								</TR>
								<TR>
									<TD>Social</TD>
									<TD>
										<def:datafieldcontrol id="cssocc" runat="server" DatabaseField="cssocc" FieldTextBoxTabIndex="36" FieldLabelText="cssocc"
											IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ShowFieldLabel="False" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="cssoccss" runat="server" DatabaseField="cssoccss" FieldTextBoxTabIndex="37"
											FieldLabelText="cssoccss" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ShowFieldLabel="False"
											RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="cssoccpt" runat="server" DatabaseField="cssoccpt" FieldTextBoxTabIndex="38"
											FieldLabelText="cssoccpt" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ShowFieldLabel="False"
											RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="cssoccc" runat="server" DatabaseField="cssoccc" FieldTextBoxTabIndex="39" FieldLabelText="cssoccc"
											IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="TEXT" ShowFieldLabel="False" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>Speech</TD>
									<TD>
										<def:datafieldcontrol id="csspecc" runat="server" DatabaseField="csspecc" FieldTextBoxTabIndex="37" FieldLabelText="csspecc"
											IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ShowFieldLabel="False" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="csspecss" runat="server" DatabaseField="csspecss" FieldTextBoxTabIndex="41"
											FieldLabelText="csspecss" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ShowFieldLabel="False"
											RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="csspecpt" runat="server" DatabaseField="csspecpt" FieldTextBoxTabIndex="42"
											FieldLabelText="csspecpt" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ShowFieldLabel="False"
											RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="csspeccc" runat="server" DatabaseField="csspeccc" FieldTextBoxTabIndex="43"
											FieldLabelText="csspeccc" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT" ShowFieldLabel="False"
											RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>Symbolic</TD>
									<TD>
										<def:datafieldcontrol id="cssymcc" runat="server" DatabaseField="cssymcc" FieldTextBoxTabIndex="38" FieldLabelText="cssymcc"
											IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ShowFieldLabel="False" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="cssymcss" runat="server" DatabaseField="cssymcss" FieldTextBoxTabIndex="45"
											FieldLabelText="cssymcss" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ShowFieldLabel="False"
											RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="cssymcpt" runat="server" DatabaseField="cssymcpt" FieldTextBoxTabIndex="46"
											FieldLabelText="cssymcpt" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ShowFieldLabel="False"
											RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="cssymbcc" runat="server" DatabaseField="cssymbcc" FieldTextBoxTabIndex="47"
											FieldLabelText="cssymbcc" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT" ShowFieldLabel="False"
											RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD><B>TOTAL</B></TD>
									<TD>
										<def:datafieldcontrol id="cscctot" runat="server" DatabaseField="cscctot" FieldTextBoxTabIndex="39" FieldLabelText="cscctot"
											IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ShowFieldLabel="False" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="csctotss" runat="server" DatabaseField="csctotss" FieldTextBoxTabIndex="49"
											FieldLabelText="csctotss" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ShowFieldLabel="False"
											RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="csctotpt" runat="server" DatabaseField="csctotpt" FieldTextBoxTabIndex="50"
											FieldLabelText="csctotpt" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ShowFieldLabel="False"
											RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="csctotc" runat="server" DatabaseField="csctotc" FieldTextBoxTabIndex="51" FieldLabelText="csctotc"
											IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="TEXT" ShowFieldLabel="False" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
							<def:datafieldcontrol id="csscnote" runat="server" FieldLabelWidth="100px" DatabaseField="csscnote" FieldTextBoxTabIndex="7"
								FieldLabelText="Scoring notes:" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
								IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT" ShowFieldLabel="True"
								RenderReadOnlyAsDiv="True"></def:datafieldcontrol>
							<BR>
							<TABLE>
								<TR>
									<TD>
										<def:datafieldcontrol id="csvalid" runat="server" FieldLabelWidth="100px" FieldTextBoxWidth="30px" DatabaseField="csvalid"
											FieldTextBoxTabIndex="80" FieldLabelText="Validity (1=valid, 2=questionable, 3=Invalid)" IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="1,2,3"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="cscmnt" runat="server" FieldLabelWidth="100px" FieldTextBoxWidth="200px" DatabaseField="cscmnt"
											FieldTextBoxTabIndex="81" FieldLabelText="Comments" IsDoubleEntryField="False" IsReadOnly="False"
											IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="TEXT" FieldTextBoxMaxLength="200" FieldTextBoxHeight="150px"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
							<BR>
							<TABLE class="layout">
								<TR>
									<TD>
										<def:datafieldcontrol id="created" runat="server" FieldLabelWidth="80px" DatabaseField="created" FieldTextBoxTabIndex="43"
											FieldLabelText="created" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="DATE" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="createdBy" runat="server" FieldLabelWidth="80px" DatabaseField="createdBy" FieldTextBoxTabIndex="44"
											FieldLabelText="createdBy" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="updated" runat="server" FieldLabelWidth="80px" DatabaseField="updated" FieldTextBoxTabIndex="45"
											FieldLabelText="updated" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="DATE" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="updatedBy" runat="server" FieldLabelWidth="80px" DatabaseField="updatedBy" FieldTextBoxTabIndex="46"
											FieldLabelText="updatedBy" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
						</asp:Panel>
					</asp:Content>
