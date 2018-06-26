<%@ Page language="c#" Inherits="tap_anotbid.anotbid" CodeFile="tap_anotbid.aspx.cs"  MasterPageFile="~/UWAC.master" %>

<%@ Register TagPrefix="def" Namespace="DataEntryFramework.Old" %>

<asp:Content ID="Content1" ContentPlaceHolderID="oBodyPlaceHolder" runat="server">


	<script language="javascript">
function unselectABD1FAB()
{
	unselectField();
	
	if (getFieldValue("ABD1FAB") == 0 )
	{
		setFieldValueIfBlank("ABD1PASS", "9");

		setFieldValueIfBlank("ABD1STRT", "9");

		setFieldValueIfBlank("ABD101", "9");
		setFieldValueIfBlank("ABD102", "9");
		setFieldValueIfBlank("ABD103", "9");
		setFieldValueIfBlank("ABD104", "9");
		setFieldValueIfBlank("ABD105", "9");
		setFieldValueIfBlank("ABD106", "9");
		setFieldValueIfBlank("ABD107", "9");
		setFieldValueIfBlank("ABD108", "9");
		setFieldValueIfBlank("ABD109", "9");
		setFieldValueIfBlank("ABD110", "9");
		setFieldValueIfBlank("ABD111", "9");
		setFieldValueIfBlank("ABD112", "9");
		setFieldValueIfBlank("ABD113", "9");
		setFieldValueIfBlank("ABD114", "9");

		setFieldValueIfBlank("ABD1R1", "-9");
		setFieldValueIfBlank("ABD1R2", "-9");
		setFieldValueIfBlank("ABD1R3", "-9");

		setFieldValueIfBlank("ABD1OVRN", "-9");
		setFieldValueIfBlank("ABD1OVRC", "-9");
		setFieldValueIfBlank("ABD1REVN", "-9");
		setFieldValueIfBlank("ABD1REVC", "-9");
		setFieldValueIfBlank("ABD1VLD", "1");		
		
	}
}
function unselectABD1PASS()
{
	unselectField();
	
	if (getFieldValue("ABD1PASS") == 0 )
	{
		setFieldValueIfBlank("ABD1STRT", "9");

		setFieldValueIfBlank("ABD101", "9");
		setFieldValueIfBlank("ABD102", "9");
		setFieldValueIfBlank("ABD103", "9");
		setFieldValueIfBlank("ABD104", "9");
		setFieldValueIfBlank("ABD105", "9");
		setFieldValueIfBlank("ABD106", "9");
		setFieldValueIfBlank("ABD107", "9");
		setFieldValueIfBlank("ABD108", "9");
		setFieldValueIfBlank("ABD109", "9");
		setFieldValueIfBlank("ABD110", "9");
		setFieldValueIfBlank("ABD111", "9");
		setFieldValueIfBlank("ABD112", "9");
		setFieldValueIfBlank("ABD113", "9");
		setFieldValueIfBlank("ABD114", "9");

		setFieldValueIfBlank("ABD1R1", "-9");
		setFieldValueIfBlank("ABD1R2", "-9");
		setFieldValueIfBlank("ABD1R3", "-9");

		setFieldValueIfBlank("ABD1OVRN", "-9");
		setFieldValueIfBlank("ABD1OVRC", "-9");
		setFieldValueIfBlank("ABD1REVN", "-9");
		setFieldValueIfBlank("ABD1REVC", "-9");
		setFieldValueIfBlank("ABD1VLD", "1");
	}
}

	</script>

						<def:dataentrycontroller id="DataEntryController1" runat="server" ShowScoreButton="True" StudyMeasID="352"
							DatabaseTable="tap_anotbid" LookupField1="tapid" LookupTextBox2Visible="False" LookupTextBox1LabelText="TAP ID:"
							MeasureName="TAP A Not B w/ID" PrimaryKeyField="anotbid_pk" VerifiedField="verified" LookupField1DataType="TEXT" ondoscore="DataEntryController1_DoScore"></def:dataentrycontroller>
						<table class="layout" id="table_insert">
							<tr>
								<td><def:datafieldcontrol id="tapid" runat="server" FieldDataType="TEXT" IsInsertField="True" IsInsertValueRequired="True"
										IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="TAP ID"
										FieldTextBoxTabIndex="2" DatabaseField="tapid" FieldTextBoxWidth="80px" FieldLabelWidth="80px"></def:datafieldcontrol></td>
							</tr>
							<tr>
								<td height="30"><def:datafieldcontrol id="ABD1DATE" runat="server" FieldDataType="DATE" IsInsertField="False" IsInsertValueRequired="False"
										IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="Test Date"
										FieldTextBoxTabIndex="3" DatabaseField="ABD1DATE" FieldTextBoxWidth="80px" FieldLabelWidth="80px" FormatString="{0:d}"></def:datafieldcontrol></td>
							</tr>
							<tr>
								<td><def:datafieldcontrol id="ABD1CLIN" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
										IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="Experimenter"
										FieldTextBoxTabIndex="4" DatabaseField="ABD1CLIN" FieldTextBoxWidth="80px" FieldLabelWidth="80px"></def:datafieldcontrol></td>
							</tr>
						</table>
						<asp:panel id="mainPanel" Runat="server">
							<def:datafieldcontrol id="ABD1FAB" runat="server" FieldTextBoxWidth="40px" DatabaseField="ABD1FAB" FieldTextBoxTabIndex="5"
								FieldLabelText="A Not B (0=Failed, 1=Passed, 9=Missing/Unknown)" IsDoubleEntryField="True" IsReadOnly="False"
								IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
								FieldDataType="INT" ValidList="0,1,9" CallOnBlur="unselectABD1FAB"></def:datafieldcontrol>
							<BR>
							<def:datafieldcontrol id="ABD1PASS" runat="server" FieldTextBoxWidth="40px" DatabaseField="ABD1PASS" FieldTextBoxTabIndex="5"
								FieldLabelText="Training (0=No Reach, 1=Reach, 9=Missing/Unknown)" IsDoubleEntryField="True" IsReadOnly="False"
								IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
								FieldDataType="INT" ValidList="0,1,9" CallOnBlur="unselectABD1PASS"></def:datafieldcontrol>
							<BR>
							<def:datafieldcontrol id="ABD1STRT" runat="server" FieldTextBoxWidth="40px" DatabaseField="ABD1STRT" FieldTextBoxTabIndex="5"
								FieldLabelText="Start Side (0=Left,1=Right,9=Missing/NA)" IsDoubleEntryField="True" IsReadOnly="False"
								IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
								FieldDataType="INT" ValidList="0,1,9"></def:datafieldcontrol>
							<BR>
							<TABLE class="layout">
								<TR>
									<TD width="163">
										<TABLE class="grid">
											<TR>
												<TD class="heading">0=Incorrect<BR>
													1=Correct<BR>
													9=Missing/No Reach</TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="ABD101" runat="server" FieldLabelWidth="30px" FieldTextBoxWidth="40px" DatabaseField="ABD101"
														FieldTextBoxTabIndex="6" FieldLabelText="1." IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,9"
														FieldTextBoxTextDefault="9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="ABD102" runat="server" FieldLabelWidth="30px" FieldTextBoxWidth="40px" DatabaseField="ABD102"
														FieldTextBoxTabIndex="6" FieldLabelText="2." IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,9"
														FieldTextBoxTextDefault="9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="ABD103" runat="server" FieldLabelWidth="30px" FieldTextBoxWidth="40px" DatabaseField="ABD103"
														FieldTextBoxTabIndex="6" FieldLabelText="3." IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,9"
														FieldTextBoxTextDefault="9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="ABD104" runat="server" FieldLabelWidth="30px" FieldTextBoxWidth="40px" DatabaseField="ABD104"
														FieldTextBoxTabIndex="6" FieldLabelText="4." IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,9"
														FieldTextBoxTextDefault="9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="ABD105" runat="server" FieldLabelWidth="30px" FieldTextBoxWidth="40px" DatabaseField="ABD105"
														FieldTextBoxTabIndex="6" FieldLabelText="5." IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,9"
														FieldTextBoxTextDefault="9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="ABD106" runat="server" FieldLabelWidth="30px" FieldTextBoxWidth="40px" DatabaseField="ABD106"
														FieldTextBoxTabIndex="6" FieldLabelText="6." IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,9"
														FieldTextBoxTextDefault="9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="ABD107" runat="server" FieldLabelWidth="30px" FieldTextBoxWidth="40px" DatabaseField="ABD107"
														FieldTextBoxTabIndex="6" FieldLabelText="7." IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,9"
														FieldTextBoxTextDefault="9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="ABD108" runat="server" FieldLabelWidth="30px" FieldTextBoxWidth="40px" DatabaseField="ABD108"
														FieldTextBoxTabIndex="6" FieldLabelText="8." IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,9"
														FieldTextBoxTextDefault="9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="ABD109" runat="server" FieldLabelWidth="30px" FieldTextBoxWidth="40px" DatabaseField="ABD109"
														FieldTextBoxTabIndex="6" FieldLabelText="9." IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,9"
														FieldTextBoxTextDefault="9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="ABD110" runat="server" FieldLabelWidth="30px" FieldTextBoxWidth="40px" DatabaseField="ABD110"
														FieldTextBoxTabIndex="6" FieldLabelText="10." IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,9"
														FieldTextBoxTextDefault="9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="ABD111" runat="server" FieldLabelWidth="30px" FieldTextBoxWidth="40px" DatabaseField="ABD111"
														FieldTextBoxTabIndex="6" FieldLabelText="11." IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,9"
														FieldTextBoxTextDefault="9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="ABD112" runat="server" FieldLabelWidth="30px" FieldTextBoxWidth="40px" DatabaseField="ABD112"
														FieldTextBoxTabIndex="6" FieldLabelText="12." IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,9"
														FieldTextBoxTextDefault="9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="ABD113" runat="server" FieldLabelWidth="30px" FieldTextBoxWidth="40px" DatabaseField="ABD113"
														FieldTextBoxTabIndex="6" FieldLabelText="13." IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,9"
														FieldTextBoxTextDefault="9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="ABD114" runat="server" FieldLabelWidth="30px" FieldTextBoxWidth="40px" DatabaseField="ABD114"
														FieldTextBoxTabIndex="6" FieldLabelText="14." IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,9"
														FieldTextBoxTextDefault="9"></def:datafieldcontrol></TD>
											</TR>
										</TABLE>
									</TD>
									<TD style="vertical-align:top"><SPAN style="COLOR: green">Calculated values in green</SPAN>
										<TABLE class="grid">
											<TR>
												<TD class="heading">Reversals (Trial number at reversal)<BR>
													Use -9 for missing/NA</TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="ABD1R1" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="40px" DatabaseField="ABD1R1"
														FieldTextBoxTabIndex="7" FieldLabelText="Reversal 1" IsDoubleEntryField="True" IsReadOnly="False"
														IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
														FieldDataType="INT" FieldTextBoxTextDefault="-9" MaxVal="14"></def:datafieldcontrol><SPAN style="COLOR: green">
														<def:datafieldcontrol id="Datafieldcontrol1" runat="server" DatabaseField="ABD1R1C" FieldTextBoxTabIndex="9"
															FieldLabelText="ABD1R1C" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
															IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" DESIGNTIMEDRAGDROP="155"
															RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></SPAN></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="ABD1R2" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="40px" DatabaseField="ABD1R2"
														FieldTextBoxTabIndex="8" FieldLabelText="Reversal 2" IsDoubleEntryField="True" IsReadOnly="False"
														IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
														FieldDataType="INT" FieldTextBoxTextDefault="-9" MaxVal="14"></def:datafieldcontrol><SPAN style="COLOR: green">
														<def:datafieldcontrol id="Datafieldcontrol2" runat="server" DatabaseField="ABD1R2C" FieldTextBoxTabIndex="9"
															FieldLabelText="ABD1R2C" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
															IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" DESIGNTIMEDRAGDROP="156"
															RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></SPAN></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="ABD1R3" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="40px" DatabaseField="ABD1R3"
														FieldTextBoxTabIndex="9" FieldLabelText="Reversal 3" IsDoubleEntryField="True" IsReadOnly="False"
														IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
														FieldDataType="INT" FieldTextBoxTextDefault="-9" MaxVal="14"></def:datafieldcontrol><SPAN style="COLOR: green">
														<def:datafieldcontrol id="Datafieldcontrol3" runat="server" DatabaseField="ABD1R3C" FieldTextBoxTabIndex="9"
															FieldLabelText="ABD1R3C" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
															IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" DESIGNTIMEDRAGDROP="157"
															RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></SPAN></TD>
											</TR>
										</TABLE>
										<def:datafieldcontrol id="Datafieldcontrol8" runat="server" FieldLabelWidth="80px" DatabaseField="ABD1LAST"
											FieldTextBoxTabIndex="9" FieldLabelText="Last trial:" IsDoubleEntryField="False" IsReadOnly="True"
											IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" RenderReadOnlyAsDiv="True" ShowFieldLabel="True"></def:datafieldcontrol><BR>
										<TABLE class="grid">
											<TR>
												<TD height="19">(use -9 for missing)</TD>
												<TD class="heading" width="80" height="19"># Correct</TD>
												<TD class="heading" width="80" height="19"># Trials</TD>
												<TD class="heading" width="80" height="19">% Correct</TD>
											</TR>
											<TR>
												<TD class="heading">5 sec-overall</TD>
												<TD>
													<def:datafieldcontrol id="ABD1OVRC" runat="server" FieldTextBoxWidth="30px" DatabaseField="ABD1OVRC" FieldTextBoxTabIndex="10"
														FieldLabelText="ABD1OVRC" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" FieldTextBoxTextDefault="-9"
														MaxVal="14" ShowFieldLabel="False"></def:datafieldcontrol><SPAN style="COLOR: green">
														<def:datafieldcontrol id="Datafieldcontrol4" runat="server" DatabaseField="ABD1OC" FieldTextBoxTabIndex="9"
															FieldLabelText="ABD1OC" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
															IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" DESIGNTIMEDRAGDROP="158"
															RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></SPAN></TD>
												<TD>
													<def:datafieldcontrol id="ABD1OVRN" runat="server" FieldTextBoxWidth="30px" DatabaseField="ABD1OVRN" FieldTextBoxTabIndex="11"
														FieldLabelText="ABD1OVRN" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" FieldTextBoxTextDefault="-9"
														MaxVal="14" ShowFieldLabel="False"></def:datafieldcontrol><SPAN style="COLOR: green">
														<def:datafieldcontrol id="Datafieldcontrol5" runat="server" DatabaseField="ABD1OTC" FieldTextBoxTabIndex="9"
															FieldLabelText="ABD1OTC" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
															IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" RenderReadOnlyAsDiv="True"
															ShowFieldLabel="False"></def:datafieldcontrol></SPAN></TD>
												<TD><SPAN style="COLOR: green">
														<def:datafieldcontrol id="ABD1OVRP" runat="server" DatabaseField="ABD1OVRP" FieldTextBoxTabIndex="9" FieldLabelText="ABD1OVRP"
															IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
															IsInsertField="False" FieldDataType="FLOAT" FormatString="{0:f}" DESIGNTIMEDRAGDROP="24" RenderReadOnlyAsDiv="True"
															ShowFieldLabel="False"></def:datafieldcontrol></SPAN></TD>
											</TR>
											<TR>
												<TD class="heading">5 sec-reversals</TD>
												<TD>
													<def:datafieldcontrol id="ABD1REVC" runat="server" FieldTextBoxWidth="30px" DatabaseField="ABD1REVC" FieldTextBoxTabIndex="12"
														FieldLabelText="ABD1REVC" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" FieldTextBoxTextDefault="-9"
														MaxVal="14" ShowFieldLabel="False"></def:datafieldcontrol><SPAN style="COLOR: green">
														<def:datafieldcontrol id="Datafieldcontrol6" runat="server" DatabaseField="ABD1RC" FieldTextBoxTabIndex="9"
															FieldLabelText="ABD1RC" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
															IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" RenderReadOnlyAsDiv="True"
															ShowFieldLabel="False"></def:datafieldcontrol></SPAN></TD>
												<TD>
													<def:datafieldcontrol id="ABD1REVN" runat="server" FieldTextBoxWidth="30px" DatabaseField="ABD1REVN" FieldTextBoxTabIndex="14"
														FieldLabelText="ABD1REVN" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" FieldTextBoxTextDefault="-9"
														MaxVal="14" ShowFieldLabel="False"></def:datafieldcontrol><SPAN style="COLOR: green">
														<def:datafieldcontrol id="Datafieldcontrol7" runat="server" DatabaseField="ABD1RTC" FieldTextBoxTabIndex="9"
															FieldLabelText="ABD1RTC" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
															IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" RenderReadOnlyAsDiv="True"
															ShowFieldLabel="False"></def:datafieldcontrol></SPAN></TD>
												<TD><SPAN style="COLOR: green">
														<def:datafieldcontrol id="ABD1REVP" runat="server" DatabaseField="ABD1REVP" FieldTextBoxTabIndex="10"
															FieldLabelText="ABD1REVP" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
															IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="FLOAT" FormatString="{0:f}"
															DESIGNTIMEDRAGDROP="146" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></SPAN></TD>
											</TR>
										</TABLE>
										<def:datafieldcontrol id="ABD1SCR" runat="server" FieldLabelWidth="90px" DatabaseField="ABD1SCR" FieldTextBoxTabIndex="39"
											FieldLabelText="Scoring Status:" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT" RenderReadOnlyAsDiv="True"></def:datafieldcontrol><BR>
										<BR>
										<TABLE class="grid" width="300">
											<TR>
												<TD class="heading">Enter a 1 below to override calculated values.<BR>
													<BR>
													The scoring program will use entered values instead of attempting to calculate 
													them. Enter comments describing what happened.<BR>
													<BR>
													After saving, you must still click the 'SCORE' button.
												</TD>
											</TR>
										</TABLE>
										<BR>
										<def:datafieldcontrol id="overrideScoring" runat="server" FieldLabelWidth="150px" FieldTextBoxWidth="50px"
											DatabaseField="overrideScoring" FieldTextBoxTabIndex="18" FieldLabelText="Override Calculated Values (1=YES, 0=NO)"
											IsDoubleEntryField="False" IsReadOnly="False" IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" FieldTextBoxTextDefault="0" ShowFieldLabel="True"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
							<BR>
							<TABLE class="tblentry" id="table_entry">
								<TR>
									<TD>
										<def:datafieldcontrol id="ABD1VLD" runat="server" FieldLabelWidth="150px" FieldTextBoxWidth="30px" DatabaseField="ABD1VLD"
											FieldTextBoxTabIndex="15" FieldLabelText="Validity (1=Valid, 2=Questionable, 3=Invalid)" IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="1,2,3"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ABD1CMNT" runat="server" FieldLabelWidth="150px" FieldTextBoxWidth="200px" DatabaseField="ABD1CMNT"
											FieldTextBoxTabIndex="16" FieldLabelText="Comments" IsDoubleEntryField="False" IsReadOnly="False"
											IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="TEXT" FieldTextBoxHeight="150px" FieldTextBoxTextMode="MultiLine" FieldTextBoxMaxLength="255"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
							<BR>
							<TABLE class="layout" id="table_readonly">
								<TR>
									<TD>
										<def:datafieldcontrol id="created" runat="server" FieldLabelWidth="80px" DatabaseField="created" FieldTextBoxTabIndex="15"
											FieldLabelText="created" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="DATE" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="createdBy" runat="server" FieldLabelWidth="80px" DatabaseField="createdBy" FieldTextBoxTabIndex="16"
											FieldLabelText="createdBy" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="updated" runat="server" FieldLabelWidth="80px" DatabaseField="updated" FieldTextBoxTabIndex="17"
											FieldLabelText="updated" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="DATE" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="updatedBy" runat="server" FieldLabelWidth="80px" DatabaseField="updatedBy" FieldTextBoxTabIndex="18"
											FieldLabelText="updatedBy" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="Datafieldcontrol16" runat="server" FieldLabelWidth="80px" DatabaseField="scored"
											FieldTextBoxTabIndex="19" FieldLabelText="scored" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="DATE" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="Datafieldcontrol17" runat="server" FieldLabelWidth="80px" DatabaseField="scoredBy"
											FieldTextBoxTabIndex="20" FieldLabelText="scoredBy" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
						</asp:panel></asp:Content>
