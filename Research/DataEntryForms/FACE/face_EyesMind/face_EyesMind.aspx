<%@ Page language="c#" Inherits="face_EyesMind.face_EyesMind" CodeFile="face_EyesMind.aspx.cs"  MasterPageFile="~/UWAC.master" %>
<%@ Register TagPrefix="def" Namespace="DataEntryFramework.Old" %>

<asp:Content ID="Content1" ContentPlaceHolderID="oBodyPlaceHolder" runat="server">
						<def:dataentrycontroller id="DataEntryController1" runat="server" VerifiedField="verified" PrimaryKeyField="em_pk"
							MeasureName="FACE Eyes Mind" LookupTextBox1LabelText="FACE ID:" LookupTextBox2Visible="False" LookupField1="faceid"
							DatabaseTable="face_eyesmind" LookupField1DataType="TEXT" ShowScoreButton="False" StudyMeasID="387"></def:dataentrycontroller>
						<table id="table_insert" class="layout">
							<tr>
								<td><def:datafieldcontrol id="faceid" runat="server" FieldDataType="TEXT" IsInsertField="True" IsInsertValueRequired="True"
										IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="FACE ID"
										FieldTextBoxTabIndex="2" DatabaseField="faceid" FieldTextBoxWidth="80px" FieldLabelWidth="80px" RegEx="^[F][A][C][E][0-9][0-9][0-9]$"
										RegExDescription="FACE ID must  look like FACE###"></def:datafieldcontrol>
								</td>
							</tr>
							<tr>
								<td><def:datafieldcontrol id="emdate" runat="server" FieldDataType="DATE" IsInsertField="False" IsInsertValueRequired="False"
										IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="Date"
										FieldTextBoxTabIndex="3" DatabaseField="emdate" FieldTextBoxWidth="80px" FieldLabelWidth="80px" FormatString="{0:d}"></def:datafieldcontrol>
								</td>
							</tr>
							<tr>
								<td><def:datafieldcontrol id="emclin" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
										IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="Clinician"
										FieldTextBoxTabIndex="4" DatabaseField="emclin" FieldTextBoxWidth="80px" FieldLabelWidth="80px"></def:datafieldcontrol>
								</td>
							</tr>
						</table>
						<br>
						<asp:Panel Runat="server" ID="mainPanel">
							<TABLE class="grid">
								<TR>
									<TD>
										<def:datafieldcontrol id="emordr" runat="server" FieldTextBoxWidth="30px" DatabaseField="emordr" FieldTextBoxTabIndex="5"
											FieldLabelText="Counterbalance (1=Gender first, 2=Eyes First)" IsDoubleEntryField="True" IsReadOnly="False"
											IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="1,2"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
							<BR>
							<TABLE class="grid">
								<TR>
									<TD class="heading">Gender Task</TD>
								</TR>
								<TR>
									<TD>1=Male, 2=Female, 9=Missing</TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="emg01" runat="server" FieldLabelWidth="30px" FieldTextBoxWidth="30px" DatabaseField="emg01"
											FieldTextBoxTabIndex="6" FieldLabelText="1." IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="emg02" runat="server" FieldLabelWidth="30px" FieldTextBoxWidth="30px" DatabaseField="emg02"
											FieldTextBoxTabIndex="7" FieldLabelText="2." IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="emg03" runat="server" FieldLabelWidth="30px" FieldTextBoxWidth="30px" DatabaseField="emg03"
											FieldTextBoxTabIndex="8" FieldLabelText="3." IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="emg04" runat="server" FieldLabelWidth="30px" FieldTextBoxWidth="30px" DatabaseField="emg04"
											FieldTextBoxTabIndex="9" FieldLabelText="4." IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="emg05" runat="server" FieldLabelWidth="30px" FieldTextBoxWidth="30px" DatabaseField="emg05"
											FieldTextBoxTabIndex="10" FieldLabelText="5." IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="emg06" runat="server" FieldLabelWidth="30px" FieldTextBoxWidth="30px" DatabaseField="emg06"
											FieldTextBoxTabIndex="11" FieldLabelText="6." IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="emg07" runat="server" FieldLabelWidth="30px" FieldTextBoxWidth="30px" DatabaseField="emg07"
											FieldTextBoxTabIndex="12" FieldLabelText="7." IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="emg08" runat="server" FieldLabelWidth="30px" FieldTextBoxWidth="30px" DatabaseField="emg08"
											FieldTextBoxTabIndex="13" FieldLabelText="8." IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="emg09" runat="server" FieldLabelWidth="30px" FieldTextBoxWidth="30px" DatabaseField="emg09"
											FieldTextBoxTabIndex="14" FieldLabelText="9." IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="emg10" runat="server" FieldLabelWidth="30px" FieldTextBoxWidth="30px" DatabaseField="emg10"
											FieldTextBoxTabIndex="15" FieldLabelText="10." IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="emg11" runat="server" FieldLabelWidth="30px" FieldTextBoxWidth="30px" DatabaseField="emg11"
											FieldTextBoxTabIndex="16" FieldLabelText="11." IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="emg12" runat="server" FieldLabelWidth="30px" FieldTextBoxWidth="30px" DatabaseField="emg12"
											FieldTextBoxTabIndex="17" FieldLabelText="12." IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="emg13" runat="server" FieldLabelWidth="30px" FieldTextBoxWidth="30px" DatabaseField="emg13"
											FieldTextBoxTabIndex="18" FieldLabelText="13." IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="emg14" runat="server" FieldLabelWidth="30px" FieldTextBoxWidth="30px" DatabaseField="emg14"
											FieldTextBoxTabIndex="19" FieldLabelText="14." IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="emg15" runat="server" FieldLabelWidth="30px" FieldTextBoxWidth="30px" DatabaseField="emg15"
											FieldTextBoxTabIndex="20" FieldLabelText="15." IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="emg16" runat="server" FieldLabelWidth="30px" FieldTextBoxWidth="30px" DatabaseField="emg16"
											FieldTextBoxTabIndex="21" FieldLabelText="16." IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="emg17" runat="server" FieldLabelWidth="30px" FieldTextBoxWidth="30px" DatabaseField="emg17"
											FieldTextBoxTabIndex="22" FieldLabelText="17." IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="emg18" runat="server" FieldLabelWidth="30px" FieldTextBoxWidth="30px" DatabaseField="emg18"
											FieldTextBoxTabIndex="23" FieldLabelText="18." IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="emg19" runat="server" FieldLabelWidth="30px" FieldTextBoxWidth="30px" DatabaseField="emg19"
											FieldTextBoxTabIndex="24" FieldLabelText="19." IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="emg20" runat="server" FieldLabelWidth="30px" FieldTextBoxWidth="30px" DatabaseField="emg20"
											FieldTextBoxTabIndex="25" FieldLabelText="20." IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="emg21" runat="server" FieldLabelWidth="30px" FieldTextBoxWidth="30px" DatabaseField="emg21"
											FieldTextBoxTabIndex="26" FieldLabelText="21." IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="emg22" runat="server" FieldLabelWidth="30px" FieldTextBoxWidth="30px" DatabaseField="emg22"
											FieldTextBoxTabIndex="27" FieldLabelText="22." IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="emg23" runat="server" FieldLabelWidth="30px" FieldTextBoxWidth="30px" DatabaseField="emg23"
											FieldTextBoxTabIndex="28" FieldLabelText="23." IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="emg24" runat="server" FieldLabelWidth="30px" FieldTextBoxWidth="30px" DatabaseField="emg24"
											FieldTextBoxTabIndex="29" FieldLabelText="24." IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="emg25" runat="server" FieldLabelWidth="30px" FieldTextBoxWidth="30px" DatabaseField="emg25"
											FieldTextBoxTabIndex="30" FieldLabelText="25." IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="emg26" runat="server" FieldLabelWidth="30px" FieldTextBoxWidth="30px" DatabaseField="emg26"
											FieldTextBoxTabIndex="31" FieldLabelText="26." IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="emg27" runat="server" FieldLabelWidth="30px" FieldTextBoxWidth="30px" DatabaseField="emg27"
											FieldTextBoxTabIndex="32" FieldLabelText="27." IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="emg28" runat="server" FieldLabelWidth="30px" FieldTextBoxWidth="30px" DatabaseField="emg28"
											FieldTextBoxTabIndex="33" FieldLabelText="28." IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="emg29" runat="server" FieldLabelWidth="30px" FieldTextBoxWidth="30px" DatabaseField="emg29"
											FieldTextBoxTabIndex="34" FieldLabelText="29." IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="emg30" runat="server" FieldLabelWidth="30px" FieldTextBoxWidth="30px" DatabaseField="emg30"
											FieldTextBoxTabIndex="35" FieldLabelText="30." IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="emg31" runat="server" FieldLabelWidth="30px" FieldTextBoxWidth="30px" DatabaseField="emg31"
											FieldTextBoxTabIndex="36" FieldLabelText="31." IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="emg32" runat="server" FieldLabelWidth="30px" FieldTextBoxWidth="30px" DatabaseField="emg32"
											FieldTextBoxTabIndex="37" FieldLabelText="32." IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="emg33" runat="server" FieldLabelWidth="30px" FieldTextBoxWidth="30px" DatabaseField="emg33"
											FieldTextBoxTabIndex="38" FieldLabelText="33." IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="emg34" runat="server" FieldLabelWidth="30px" FieldTextBoxWidth="30px" DatabaseField="emg34"
											FieldTextBoxTabIndex="39" FieldLabelText="34." IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="emg35" runat="server" FieldLabelWidth="30px" FieldTextBoxWidth="30px" DatabaseField="emg35"
											FieldTextBoxTabIndex="40" FieldLabelText="35." IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="emg36" runat="server" FieldLabelWidth="30px" FieldTextBoxWidth="30px" DatabaseField="emg36"
											FieldTextBoxTabIndex="41" FieldLabelText="36." IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,9"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
							<BR>
							<TABLE class="grid">
								<TR>
									<TD class="heading" colSpan="6">Reading Eyes Task (use 9 for missing)</TD>
								</TR>
								<TR>
									<TD></TD>
									<TD>1</TD>
									<TD>2</TD>
									<TD>3</TD>
									<TD>4</TD>
									<TD></TD>
								</TR>
								<TR>
									<TD>1
									</TD>
									<TD>playful
									</TD>
									<TD>comforting
									</TD>
									<TD>irritated
									</TD>
									<TD>bored</TD>
									<TD>
										<def:datafieldcontrol id="eme01" runat="server" FieldTextBoxWidth="30px" DatabaseField="eme01" FieldTextBoxTabIndex="42"
											FieldLabelText="eme01" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True"
											IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,9" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>2
									</TD>
									<TD>terrified
									</TD>
									<TD>upset
									</TD>
									<TD>arrogant
									</TD>
									<TD>annoyed</TD>
									<TD>
										<def:datafieldcontrol id="eme02" runat="server" FieldTextBoxWidth="30px" DatabaseField="eme02" FieldTextBoxTabIndex="43"
											FieldLabelText="eme02" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True"
											IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,9" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>3
									</TD>
									<TD>joking
									</TD>
									<TD>flustered
									</TD>
									<TD>desire
									</TD>
									<TD>convinced</TD>
									<TD>
										<def:datafieldcontrol id="eme03" runat="server" FieldTextBoxWidth="30px" DatabaseField="eme03" FieldTextBoxTabIndex="44"
											FieldLabelText="eme03" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True"
											IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,9" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>4
									</TD>
									<TD>joking
									</TD>
									<TD>insisting
									</TD>
									<TD>amused
									</TD>
									<TD>relaxed</TD>
									<TD>
										<def:datafieldcontrol id="eme04" runat="server" FieldTextBoxWidth="30px" DatabaseField="eme04" FieldTextBoxTabIndex="45"
											FieldLabelText="eme04" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True"
											IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,9" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>5
									</TD>
									<TD>irritated
									</TD>
									<TD>sarcastic
									</TD>
									<TD>worried
									</TD>
									<TD>friendly</TD>
									<TD>
										<def:datafieldcontrol id="eme05" runat="server" FieldTextBoxWidth="30px" DatabaseField="eme05" FieldTextBoxTabIndex="46"
											FieldLabelText="eme05" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True"
											IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,9" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>6
									</TD>
									<TD>aghast
									</TD>
									<TD>fantasizing
									</TD>
									<TD>impatient
									</TD>
									<TD>alarmed</TD>
									<TD>
										<def:datafieldcontrol id="eme06" runat="server" FieldTextBoxWidth="30px" DatabaseField="eme06" FieldTextBoxTabIndex="47"
											FieldLabelText="eme06" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True"
											IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,9" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>7
									</TD>
									<TD>apologetic
									</TD>
									<TD>friendly
									</TD>
									<TD>uneasy
									</TD>
									<TD>dispirited</TD>
									<TD>
										<def:datafieldcontrol id="eme07" runat="server" FieldTextBoxWidth="30px" DatabaseField="eme07" FieldTextBoxTabIndex="48"
											FieldLabelText="eme07" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True"
											IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,9" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>8
									</TD>
									<TD>despondent
									</TD>
									<TD>relieved
									</TD>
									<TD>shy
									</TD>
									<TD>excited</TD>
									<TD>
										<def:datafieldcontrol id="eme08" runat="server" FieldTextBoxWidth="30px" DatabaseField="eme08" FieldTextBoxTabIndex="49"
											FieldLabelText="eme08" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True"
											IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,9" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>9
									</TD>
									<TD>annoyed
									</TD>
									<TD>hostile
									</TD>
									<TD>horrified
									</TD>
									<TD>preoccupied</TD>
									<TD>
										<def:datafieldcontrol id="eme09" runat="server" FieldTextBoxWidth="30px" DatabaseField="eme09" FieldTextBoxTabIndex="50"
											FieldLabelText="eme09" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True"
											IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,9" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>10
									</TD>
									<TD>cautious
									</TD>
									<TD>insisting
									</TD>
									<TD>bored
									</TD>
									<TD>aghast</TD>
									<TD>
										<def:datafieldcontrol id="eme10" runat="server" FieldTextBoxWidth="30px" DatabaseField="eme10" FieldTextBoxTabIndex="51"
											FieldLabelText="eme10" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True"
											IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,9" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>11
									</TD>
									<TD>terrified
									</TD>
									<TD>amused
									</TD>
									<TD>regretful
									</TD>
									<TD>flirtatious</TD>
									<TD>
										<def:datafieldcontrol id="eme11" runat="server" FieldTextBoxWidth="30px" DatabaseField="eme11" FieldTextBoxTabIndex="52"
											FieldLabelText="eme11" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True"
											IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,9" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>12
									</TD>
									<TD>indifferent
									</TD>
									<TD>embarrassed
									</TD>
									<TD>skeptical
									</TD>
									<TD>dispirited</TD>
									<TD>
										<def:datafieldcontrol id="eme12" runat="server" FieldTextBoxWidth="30px" DatabaseField="eme12" FieldTextBoxTabIndex="53"
											FieldLabelText="eme12" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True"
											IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,9" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>13
									</TD>
									<TD>decisive
									</TD>
									<TD>anticipating
									</TD>
									<TD>threatening
									</TD>
									<TD>shy</TD>
									<TD>
										<def:datafieldcontrol id="eme13" runat="server" FieldTextBoxWidth="30px" DatabaseField="eme13" FieldTextBoxTabIndex="54"
											FieldLabelText="eme13" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True"
											IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,9" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>14
									</TD>
									<TD>irritated
									</TD>
									<TD>disappointed
									</TD>
									<TD>depressed
									</TD>
									<TD>accusing</TD>
									<TD>
										<def:datafieldcontrol id="eme14" runat="server" FieldTextBoxWidth="30px" DatabaseField="eme14" FieldTextBoxTabIndex="55"
											FieldLabelText="eme14" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True"
											IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,9" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>15
									</TD>
									<TD>contemplative
									</TD>
									<TD>flustered
									</TD>
									<TD>encouraging
									</TD>
									<TD>amused</TD>
									<TD>
										<def:datafieldcontrol id="eme15" runat="server" FieldTextBoxWidth="30px" DatabaseField="eme15" FieldTextBoxTabIndex="56"
											FieldLabelText="eme15" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True"
											IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,9" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>16
									</TD>
									<TD>irritated
									</TD>
									<TD>thoughtful
									</TD>
									<TD>encouraging
									</TD>
									<TD>sympathetic</TD>
									<TD>
										<def:datafieldcontrol id="eme16" runat="server" FieldTextBoxWidth="30px" DatabaseField="eme16" FieldTextBoxTabIndex="57"
											FieldLabelText="eme16" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True"
											IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,9" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>17
									</TD>
									<TD>doubtful
									</TD>
									<TD>affectionate
									</TD>
									<TD>playful
									</TD>
									<TD>aghast</TD>
									<TD>
										<def:datafieldcontrol id="eme17" runat="server" FieldTextBoxWidth="30px" DatabaseField="eme17" FieldTextBoxTabIndex="58"
											FieldLabelText="eme17" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True"
											IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,9" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>18
									</TD>
									<TD>decisive
									</TD>
									<TD>amused
									</TD>
									<TD>aghast
									</TD>
									<TD>bored</TD>
									<TD>
										<def:datafieldcontrol id="eme18" runat="server" FieldTextBoxWidth="30px" DatabaseField="eme18" FieldTextBoxTabIndex="59"
											FieldLabelText="eme18" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True"
											IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,9" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>19
									</TD>
									<TD>arrogant
									</TD>
									<TD>grateful
									</TD>
									<TD>sarcastic
									</TD>
									<TD>tentative</TD>
									<TD>
										<def:datafieldcontrol id="eme19" runat="server" FieldTextBoxWidth="30px" DatabaseField="eme19" FieldTextBoxTabIndex="60"
											FieldLabelText="eme19" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True"
											IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,9" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>20
									</TD>
									<TD>dominant
									</TD>
									<TD>friendly
									</TD>
									<TD>guilty
									</TD>
									<TD>horrified</TD>
									<TD>
										<def:datafieldcontrol id="eme20" runat="server" FieldTextBoxWidth="30px" DatabaseField="eme20" FieldTextBoxTabIndex="61"
											FieldLabelText="eme20" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True"
											IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,9" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>21
									</TD>
									<TD>embarrassed</TD>
									<TD>fantasizing
									</TD>
									<TD>confused
									</TD>
									<TD>panicked</TD>
									<TD>
										<def:datafieldcontrol id="eme21" runat="server" FieldTextBoxWidth="30px" DatabaseField="eme21" FieldTextBoxTabIndex="62"
											FieldLabelText="eme21" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True"
											IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,9" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>22
									</TD>
									<TD>preoccupied
									</TD>
									<TD>grateful
									</TD>
									<TD>insisting
									</TD>
									<TD>imploring</TD>
									<TD>
										<def:datafieldcontrol id="eme22" runat="server" FieldTextBoxWidth="30px" DatabaseField="eme22" FieldTextBoxTabIndex="63"
											FieldLabelText="eme22" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True"
											IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,9" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>23
									</TD>
									<TD>contented
									</TD>
									<TD>apologetic
									</TD>
									<TD>defiant
									</TD>
									<TD>curious</TD>
									<TD>
										<def:datafieldcontrol id="eme23" runat="server" FieldTextBoxWidth="30px" DatabaseField="eme23" FieldTextBoxTabIndex="64"
											FieldLabelText="eme23" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True"
											IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,9" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>24</TD>
									<TD>pensive
									</TD>
									<TD>irritated
									</TD>
									<TD>excited
									</TD>
									<TD>hostile</TD>
									<TD>
										<def:datafieldcontrol id="eme24" runat="server" FieldTextBoxWidth="30px" DatabaseField="eme24" FieldTextBoxTabIndex="65"
											FieldLabelText="eme24" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True"
											IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,9" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>25
									</TD>
									<TD>panicked
									</TD>
									<TD>incredulous
									</TD>
									<TD>despondent
									</TD>
									<TD>interested</TD>
									<TD>
										<def:datafieldcontrol id="eme25" runat="server" FieldTextBoxWidth="30px" DatabaseField="eme25" FieldTextBoxTabIndex="66"
											FieldLabelText="eme25" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True"
											IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,9" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>26
									</TD>
									<TD>alarmed
									</TD>
									<TD>shy
									</TD>
									<TD>hostile
									</TD>
									<TD>anxious</TD>
									<TD>
										<def:datafieldcontrol id="eme26" runat="server" FieldTextBoxWidth="30px" DatabaseField="eme26" FieldTextBoxTabIndex="67"
											FieldLabelText="eme26" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True"
											IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,9" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>27
									</TD>
									<TD>joking
									</TD>
									<TD>cautious
									</TD>
									<TD>arrogant
									</TD>
									<TD>reassuring</TD>
									<TD>
										<def:datafieldcontrol id="eme27" runat="server" FieldTextBoxWidth="30px" DatabaseField="eme27" FieldTextBoxTabIndex="68"
											FieldLabelText="eme27" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True"
											IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,9" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>28
									</TD>
									<TD>interested
									</TD>
									<TD>joking
									</TD>
									<TD>affectionate
									</TD>
									<TD>contented
									</TD>
									<TD>
										<def:datafieldcontrol id="eme28" runat="server" FieldTextBoxWidth="30px" DatabaseField="eme28" FieldTextBoxTabIndex="69"
											FieldLabelText="eme28" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True"
											IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,9" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>29
									</TD>
									<TD>impatient
									</TD>
									<TD>aghast
									</TD>
									<TD>irritated
									</TD>
									<TD>reflective
									</TD>
									<TD>
										<def:datafieldcontrol id="eme29" runat="server" FieldTextBoxWidth="30px" DatabaseField="eme29" FieldTextBoxTabIndex="70"
											FieldLabelText="eme29" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True"
											IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,9" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>30
									</TD>
									<TD>grateful</TD>
									<TD>flirtatious
									</TD>
									<TD>hostile
									</TD>
									<TD>disappointed
									</TD>
									<TD>
										<def:datafieldcontrol id="eme30" runat="server" FieldTextBoxWidth="30px" DatabaseField="eme30" FieldTextBoxTabIndex="71"
											FieldLabelText="eme30" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True"
											IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,9" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>31
									</TD>
									<TD>ashamed
									</TD>
									<TD>confident
									</TD>
									<TD>joking
									</TD>
									<TD>dispirited
									</TD>
									<TD>
										<def:datafieldcontrol id="eme31" runat="server" FieldTextBoxWidth="30px" DatabaseField="eme31" FieldTextBoxTabIndex="72"
											FieldLabelText="eme31" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True"
											IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,9" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>32
									</TD>
									<TD>serious
									</TD>
									<TD>ashamed
									</TD>
									<TD>bewildered
									</TD>
									<TD>alarmed
									</TD>
									<TD>
										<def:datafieldcontrol id="eme32" runat="server" FieldTextBoxWidth="30px" DatabaseField="eme32" FieldTextBoxTabIndex="73"
											FieldLabelText="eme32" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True"
											IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,9" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>33
									</TD>
									<TD>embarrassed
									</TD>
									<TD>guilty
									</TD>
									<TD>fantasizing
									</TD>
									<TD>concerned
									</TD>
									<TD>
										<def:datafieldcontrol id="eme33" runat="server" FieldTextBoxWidth="30px" DatabaseField="eme33" FieldTextBoxTabIndex="74"
											FieldLabelText="eme33" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True"
											IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,9" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>34
									</TD>
									<TD>aghast
									</TD>
									<TD>baffled
									</TD>
									<TD>distrustful
									</TD>
									<TD>terrified
									</TD>
									<TD>
										<def:datafieldcontrol id="eme34" runat="server" FieldTextBoxWidth="30px" DatabaseField="eme34" FieldTextBoxTabIndex="75"
											FieldLabelText="eme34" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True"
											IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,9" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>35
									</TD>
									<TD>puzzled
									</TD>
									<TD>nervous
									</TD>
									<TD>insisting
									</TD>
									<TD>contemplative
									</TD>
									<TD>
										<def:datafieldcontrol id="eme35" runat="server" FieldTextBoxWidth="30px" DatabaseField="eme35" FieldTextBoxTabIndex="76"
											FieldLabelText="eme35" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True"
											IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,9" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>36
									</TD>
									<TD>ashamed
									</TD>
									<TD>nervous
									</TD>
									<TD>suspicious
									</TD>
									<TD>indecisive</TD>
									<TD>
										<def:datafieldcontrol id="eme36" runat="server" FieldTextBoxWidth="30px" DatabaseField="eme36" FieldTextBoxTabIndex="77"
											FieldLabelText="eme36" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True"
											IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,9" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
							<BR>
							<TABLE class="layout">
								<TR>
									<TD>
										<def:datafieldcontrol id="validity" runat="server" FieldLabelWidth="100px" FieldTextBoxWidth="40px" DatabaseField="validity"
											FieldTextBoxTabIndex="78" FieldLabelText="Validity (1=Valid, 2=Questionable, 3=Invalid)" IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="1,2,3"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="emcmt" runat="server" FieldLabelWidth="100px" FieldTextBoxWidth="200px" DatabaseField="emcmt"
											FieldTextBoxTabIndex="79" FieldLabelText="Comments" IsDoubleEntryField="False" IsReadOnly="False"
											IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="TEXT" FieldTextBoxMaxLength="255" FieldTextBoxHeight="150px" FieldTextBoxTextMode="MultiLine"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
							<BR>
							<TABLE class="layout" id="table_readonly">
								<TR>
									<TD>
										<def:datafieldcontrol id="created" runat="server" FieldLabelWidth="80px" DatabaseField="created" FieldTextBoxTabIndex="81"
											FieldLabelText="created" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="DATE" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="createdBy" runat="server" FieldLabelWidth="80px" DatabaseField="createdBy" FieldTextBoxTabIndex="82"
											FieldLabelText="createdBy" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="updated" runat="server" FieldLabelWidth="80px" DatabaseField="updated" FieldTextBoxTabIndex="83"
											FieldLabelText="updated" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="DATE" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="updatedBy" runat="server" FieldLabelWidth="80px" DatabaseField="updatedBy" FieldTextBoxTabIndex="84"
											FieldLabelText="updatedBy" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
						</asp:Panel>
					</asp:Content>
