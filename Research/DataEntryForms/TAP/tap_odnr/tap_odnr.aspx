<%@ Register TagPrefix="def" Namespace="DataEntryFramework.Old" %>

<%@ Page language="c#" Inherits="tap_odnr.tap_odnr" CodeFile="tap_odnr.aspx.cs"  MasterPageFile="~/UWAC.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="oBodyPlaceHolder" runat="server">



	<script language="javascript">
/*
 * If practice trial is 0 then set all values to 9 and valid = 1
 */
function unselectODNRpra()
{
	unselectField();
	
	if (getFieldValue("<%= ODNRpra.ClientID %>") == 0 )
	{
		setFieldValueIfBlank("<%= ODNR01.ClientID %>", "9");
		setFieldValueIfBlank("<%= ODNR02.ClientID %>", "9");
		setFieldValueIfBlank("<%= ODNR03.ClientID %>", "9");
		setFieldValueIfBlank("<%= ODNR04.ClientID %>", "9");
		setFieldValueIfBlank("<%= ODNR05.ClientID %>", "9");
		setFieldValueIfBlank("<%= ODNR06.ClientID %>", "9");
		setFieldValueIfBlank("<%= ODNR07.ClientID %>", "9");
		setFieldValueIfBlank("<%= ODNR08.ClientID %>", "9");
		setFieldValueIfBlank("<%= ODNR09.ClientID %>", "9");
		setFieldValueIfBlank("<%= ODNR10.ClientID %>", "9");
		setFieldValueIfBlank("<%= ODNR11.ClientID %>", "9");
		setFieldValueIfBlank("<%= ODNR12.ClientID %>", "9");
		setFieldValueIfBlank("<%= ODNR13.ClientID %>", "9");
		setFieldValueIfBlank("<%= ODNR14.ClientID %>", "9");
		setFieldValueIfBlank("<%= ODNR15.ClientID %>", "9");
		setFieldValueIfBlank("<%= ODNR16.ClientID %>", "9");
		setFieldValueIfBlank("<%= ODNR17.ClientID %>", "9");
		setFieldValueIfBlank("<%= ODNR18.ClientID %>", "9");
		setFieldValueIfBlank("<%= ODNR19.ClientID %>", "9");
		setFieldValueIfBlank("<%= ODNR20.ClientID %>", "9");
		setFieldValueIfBlank("<%= ODNR21.ClientID %>", "9");
		setFieldValueIfBlank("<%= ODNR22.ClientID %>", "9");
		setFieldValueIfBlank("<%= ODNR23.ClientID %>", "9");
		setFieldValueIfBlank("<%= ODNR24.ClientID %>", "9");
		setFieldValueIfBlank("<%= ODNR25.ClientID %>", "9");

		setFieldValueIfBlank("<%= ODNRNE.ClientID %>", "-999");
		setFieldValueIfBlank("<%= ODNRCM.ClientID %>", "0");

		setFieldValueIfBlank("<%= validity.ClientID %>", "1");
	}
	
}
	</script>


						<def:dataentrycontroller id="DataEntryController1" runat="server" StudyMeasID="350" LookupField1DataType="TEXT"
							VerifiedField="verified" PrimaryKeyField="odnr_pk" MeasureName="TAP ODNR" LookupTextBox1LabelText="TAP ID:"
							LookupTextBox2Visible="False" LookupField1="tapid" DatabaseTable="tap_odnr" ShowScoreButton="True" ondoscore="DataEntryController1_DoScore"></def:dataentrycontroller>
						<table class="layout" id="table_insert">
							<tr>
								<td><def:datafieldcontrol id="tapid" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="80px" RegExDescription="TAP ID must look like TAP###"
										RegEx="^[T][A][P][0-9][0-9][0-9]$" DatabaseField="tapid" FieldTextBoxTabIndex="2" FieldLabelText="TAP ID"
										IsDoubleEntryField="False" IsReadOnly="False" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="True"
										IsInsertField="True" FieldDataType="TEXT"></def:datafieldcontrol></td>
							</tr>
						</table>
						<asp:panel id="mainPanel" Runat="server">
							<TABLE class="layout" id="table_entry">
								<TR>
									<TD>
										<def:datafieldcontrol id="ODNRDATE" runat="server" FieldDataType="DATE" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="Test Date"
											FieldTextBoxTabIndex="3" DatabaseField="ODNRDATE" FieldTextBoxWidth="80px" FieldLabelWidth="80px"
											FormatString="{0:d}"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ODNRClin" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="Experimenter"
											FieldTextBoxTabIndex="4" DatabaseField="ODNRClin" FieldTextBoxWidth="80px" FieldLabelWidth="80px"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
							<def:datafieldcontrol id="ODNRpra" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
								IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="Practice Trial (0=No Reach, 1=Reached, 9=Unknown)"
								FieldTextBoxTabIndex="5" DatabaseField="ODNRpra" FieldTextBoxWidth="30px" FieldLabelWidth="200px"
								CallOnBlur="unselectODNRpra" ValidList="0,1,9"></def:datafieldcontrol>
							<BR>
							<TABLE class="layout">
								<TR>
									<TD>
										<TABLE class="layout" style="BORDER-RIGHT: black 1px solid; BORDER-TOP: black 1px solid; BORDER-LEFT: black 1px solid; BORDER-BOTTOM: black 1px solid">
											<TR>
												<TD bgColor="#a1b5cf" colSpan="2">1=Correct, 0=Incorrect, 9=Missing/No Trial</TD>
											</TR>
											<TR>
												<TD style="vertical-align:top" width="108">
													<TABLE class="layout">
														<TR>
															<TD>
																<def:datafieldcontrol id="ODNR01" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
																	IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="1"
																	FieldTextBoxTabIndex="5" DatabaseField="ODNR01" FieldTextBoxWidth="30px" FieldLabelWidth="50px" ValidList="0,1,9"
																	DESIGNTIMEDRAGDROP="17" FieldTextBoxTextDefault="9" FieldTextBoxTextMode="SingleLine"></def:datafieldcontrol></TD>
														</TR>
														<TR>
															<TD>
																<def:datafieldcontrol id="ODNR02" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
																	IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="2"
																	FieldTextBoxTabIndex="6" DatabaseField="ODNR02" FieldTextBoxWidth="30px" FieldLabelWidth="50px" ValidList="0,1,9"
																	FieldTextBoxTextDefault="9" FieldTextBoxTextMode="SingleLine"></def:datafieldcontrol></TD>
														</TR>
														<TR>
															<TD>
																<def:datafieldcontrol id="ODNR03" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
																	IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="3"
																	FieldTextBoxTabIndex="7" DatabaseField="ODNR03" FieldTextBoxWidth="30px" FieldLabelWidth="50px" ValidList="0,1,9"
																	FieldTextBoxTextDefault="9" FieldTextBoxTextMode="SingleLine"></def:datafieldcontrol></TD>
														</TR>
														<TR>
															<TD>
																<def:datafieldcontrol id="ODNR04" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
																	IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="4"
																	FieldTextBoxTabIndex="8" DatabaseField="ODNR04" FieldTextBoxWidth="30px" FieldLabelWidth="50px" ValidList="0,1,9"
																	FieldTextBoxTextDefault="9" FieldTextBoxTextMode="SingleLine"></def:datafieldcontrol></TD>
														</TR>
														<TR>
															<TD>
																<def:datafieldcontrol id="ODNR05" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
																	IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="5"
																	FieldTextBoxTabIndex="9" DatabaseField="ODNR05" FieldTextBoxWidth="30px" FieldLabelWidth="50px" ValidList="0,1,9"
																	FieldTextBoxTextDefault="9" FieldTextBoxTextMode="SingleLine"></def:datafieldcontrol></TD>
														</TR>
														<TR>
															<TD>
																<def:datafieldcontrol id="ODNR06" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
																	IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="6"
																	FieldTextBoxTabIndex="10" DatabaseField="ODNR06" FieldTextBoxWidth="30px" FieldLabelWidth="50px" ValidList="0,1,9"
																	FieldTextBoxTextDefault="9" FieldTextBoxTextMode="SingleLine"></def:datafieldcontrol></TD>
														</TR>
														<TR>
															<TD>
																<def:datafieldcontrol id="ODNR07" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
																	IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="7"
																	FieldTextBoxTabIndex="11" DatabaseField="ODNR07" FieldTextBoxWidth="30px" FieldLabelWidth="50px" ValidList="0,1,9"
																	FieldTextBoxTextDefault="9" FieldTextBoxTextMode="SingleLine"></def:datafieldcontrol></TD>
														</TR>
														<TR>
															<TD>
																<def:datafieldcontrol id="ODNR08" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
																	IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="8"
																	FieldTextBoxTabIndex="12" DatabaseField="ODNR08" FieldTextBoxWidth="30px" FieldLabelWidth="50px" ValidList="0,1,9"
																	FieldTextBoxTextDefault="9" FieldTextBoxTextMode="SingleLine"></def:datafieldcontrol></TD>
														</TR>
														<TR>
															<TD>
																<def:datafieldcontrol id="ODNR09" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
																	IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="9"
																	FieldTextBoxTabIndex="13" DatabaseField="ODNR09" FieldTextBoxWidth="30px" FieldLabelWidth="50px" ValidList="0,1,9"
																	FieldTextBoxTextDefault="9" FieldTextBoxTextMode="SingleLine"></def:datafieldcontrol></TD>
														</TR>
														<TR>
															<TD>
																<def:datafieldcontrol id="ODNR10" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
																	IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="10"
																	FieldTextBoxTabIndex="14" DatabaseField="ODNR10" FieldTextBoxWidth="30px" FieldLabelWidth="50px" ValidList="0,1,9"
																	FieldTextBoxTextDefault="9" FieldTextBoxTextMode="SingleLine"></def:datafieldcontrol></TD>
														</TR>
														<TR>
															<TD>
																<def:datafieldcontrol id="ODNR11" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
																	IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="11"
																	FieldTextBoxTabIndex="15" DatabaseField="ODNR11" FieldTextBoxWidth="30px" FieldLabelWidth="50px" ValidList="0,1,9"
																	FieldTextBoxTextDefault="9" FieldTextBoxTextMode="SingleLine"></def:datafieldcontrol></TD>
														</TR>
														<TR>
															<TD>
																<def:datafieldcontrol id="ODNR12" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
																	IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="12"
																	FieldTextBoxTabIndex="16" DatabaseField="ODNR12" FieldTextBoxWidth="30px" FieldLabelWidth="50px" ValidList="0,1,9"
																	FieldTextBoxTextDefault="9" FieldTextBoxTextMode="SingleLine"></def:datafieldcontrol></TD>
														</TR>
														<TR>
															<TD>
																<def:datafieldcontrol id="ODNR13" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
																	IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="13"
																	FieldTextBoxTabIndex="17" DatabaseField="ODNR13" FieldTextBoxWidth="30px" FieldLabelWidth="50px" ValidList="0,1,9"
																	FieldTextBoxTextDefault="9" FieldTextBoxTextMode="SingleLine"></def:datafieldcontrol></TD>
														</TR>
														<TR>
															<TD>
																<def:datafieldcontrol id="ODNR14" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
																	IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="14"
																	FieldTextBoxTabIndex="18" DatabaseField="ODNR14" FieldTextBoxWidth="30px" FieldLabelWidth="50px" ValidList="0,1,9"
																	FieldTextBoxTextDefault="9" FieldTextBoxTextMode="SingleLine"></def:datafieldcontrol></TD>
														</TR>
														<TR>
															<TD>
																<def:datafieldcontrol id="ODNR15" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
																	IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="15"
																	FieldTextBoxTabIndex="19" DatabaseField="ODNR15" FieldTextBoxWidth="30px" FieldLabelWidth="50px" ValidList="0,1,9"
																	FieldTextBoxTextDefault="9" FieldTextBoxTextMode="SingleLine"></def:datafieldcontrol></TD>
														</TR>
													</TABLE>
												</TD>
												<TD style="vertical-align:top">
													<TABLE class="layout">
														<TR>
															<TD>
																<def:datafieldcontrol id="ODNR16" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
																	IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="16"
																	FieldTextBoxTabIndex="20" DatabaseField="ODNR16" FieldTextBoxWidth="30px" FieldLabelWidth="50px" ValidList="0,1,9"
																	FieldTextBoxTextDefault="9" FieldTextBoxTextMode="SingleLine"></def:datafieldcontrol></TD>
														</TR>
														<TR>
															<TD>
																<def:datafieldcontrol id="ODNR17" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
																	IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="17"
																	FieldTextBoxTabIndex="21" DatabaseField="ODNR17" FieldTextBoxWidth="30px" FieldLabelWidth="50px" ValidList="0,1,9"
																	FieldTextBoxTextDefault="9" FieldTextBoxTextMode="SingleLine"></def:datafieldcontrol></TD>
														</TR>
														<TR>
															<TD>
																<def:datafieldcontrol id="ODNR18" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
																	IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="18"
																	FieldTextBoxTabIndex="22" DatabaseField="ODNR18" FieldTextBoxWidth="30px" FieldLabelWidth="50px" ValidList="0,1,9"
																	FieldTextBoxTextDefault="9" FieldTextBoxTextMode="SingleLine"></def:datafieldcontrol></TD>
														</TR>
														<TR>
															<TD>
																<def:datafieldcontrol id="ODNR19" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
																	IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="19"
																	FieldTextBoxTabIndex="23" DatabaseField="ODNR19" FieldTextBoxWidth="30px" FieldLabelWidth="50px" ValidList="0,1,9"
																	FieldTextBoxTextDefault="9" FieldTextBoxTextMode="SingleLine"></def:datafieldcontrol></TD>
														</TR>
														<TR>
															<TD>
																<def:datafieldcontrol id="ODNR20" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
																	IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="20"
																	FieldTextBoxTabIndex="24" DatabaseField="ODNR20" FieldTextBoxWidth="30px" FieldLabelWidth="50px" ValidList="0,1,9"
																	FieldTextBoxTextDefault="9" FieldTextBoxTextMode="SingleLine"></def:datafieldcontrol></TD>
														</TR>
														<TR>
															<TD>
																<def:datafieldcontrol id="ODNR21" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
																	IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="21"
																	FieldTextBoxTabIndex="25" DatabaseField="ODNR21" FieldTextBoxWidth="30px" FieldLabelWidth="50px" ValidList="0,1,9"
																	FieldTextBoxTextDefault="9" FieldTextBoxTextMode="SingleLine"></def:datafieldcontrol></TD>
														</TR>
														<TR>
															<TD>
																<def:datafieldcontrol id="ODNR22" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
																	IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="22"
																	FieldTextBoxTabIndex="26" DatabaseField="ODNR22" FieldTextBoxWidth="30px" FieldLabelWidth="50px" ValidList="0,1,9"
																	FieldTextBoxTextDefault="9" FieldTextBoxTextMode="SingleLine"></def:datafieldcontrol></TD>
														</TR>
														<TR>
															<TD>
																<def:datafieldcontrol id="ODNR23" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
																	IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="23"
																	FieldTextBoxTabIndex="27" DatabaseField="ODNR23" FieldTextBoxWidth="30px" FieldLabelWidth="50px" ValidList="0,1,9"
																	FieldTextBoxTextDefault="9" FieldTextBoxTextMode="SingleLine"></def:datafieldcontrol></TD>
														</TR>
														<TR>
															<TD>
																<def:datafieldcontrol id="ODNR24" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
																	IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="24"
																	FieldTextBoxTabIndex="28" DatabaseField="ODNR24" FieldTextBoxWidth="30px" FieldLabelWidth="50px" ValidList="0,1,9"
																	FieldTextBoxTextDefault="9" FieldTextBoxTextMode="SingleLine"></def:datafieldcontrol></TD>
														</TR>
														<TR>
															<TD>
																<def:datafieldcontrol id="ODNR25" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
																	IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="25"
																	FieldTextBoxTabIndex="29" DatabaseField="ODNR25" FieldTextBoxWidth="30px" FieldLabelWidth="50px" ValidList="0,1,9"
																	FieldTextBoxTextDefault="9" FieldTextBoxTextMode="SingleLine"></def:datafieldcontrol></TD>
														</TR>
													</TABLE>
												</TD>
											</TR>
										</TABLE>
									</TD>
									<TD style="vertical-align:top">
										<TABLE class="grid">
											<TR>
												<TD colSpan="3">Scoring</TD>
											<TR>
												<TD class="heading" style="vertical-align:top"></TD>
												<TD>Entered</TD>
												<TD>Calculated</TD>
											</TR>
											<TR>
												<TD class="heading">Criterion Met?<BR>
													(1=Yes, 0=No, 9=Missing)</TD>
												<TD>
													<def:datafieldcontrol id="ODNRCM" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="Criterion Met? (1=Yes, 0=No, 9=Missing)"
														FieldTextBoxTabIndex="30" DatabaseField="ODNRCM" FieldTextBoxWidth="30px" FieldLabelWidth="200px"
														ValidList="0,1,9" ShowFieldLabel="False"></def:datafieldcontrol></TD>
												<TD>
													<def:datafieldcontrol id="ODNRCRC" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="ODNRCRC"
														FieldTextBoxTabIndex="31" DatabaseField="ODNRCMC" FieldTextBoxWidth="30px" FieldLabelWidth="100px"
														ShowFieldLabel="False" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD class="heading"># Errors
													<BR>
													(Use -999 if failed practice)</TD>
												<TD>
													<def:datafieldcontrol id="ODNRNE" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="# of Errors"
														FieldTextBoxTabIndex="31" DatabaseField="ODNRNE" FieldTextBoxWidth="50px" FieldLabelWidth="100px"
														DESIGNTIMEDRAGDROP="516" ShowFieldLabel="False"></def:datafieldcontrol></TD>
												<TD>
													<def:datafieldcontrol id="ODNRNEC" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="ODNRNEC"
														FieldTextBoxTabIndex="31" DatabaseField="ODNRNEC" FieldTextBoxWidth="30px" FieldLabelWidth="100px"
														DESIGNTIMEDRAGDROP="18" ShowFieldLabel="False" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD class="heading">% Correct</TD>
												<TD></TD>
												<TD>
													<def:datafieldcontrol id="ODNRPCNT" runat="server" FieldDataType="FLOAT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="ODNRPCNT"
														FieldTextBoxTabIndex="31" DatabaseField="ODNRPCNT" FieldTextBoxWidth="30px" FieldLabelWidth="100px"
														FormatString="{0:f}" ShowFieldLabel="False" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
											</TR>
										</TABLE>
										<def:datafieldcontrol id="Datafieldcontrol2" runat="server" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True"
											IsDoubleEntryField="False" FieldLabelText="Last item counted:" FieldTextBoxTabIndex="31" DatabaseField="ODNRLAST"
											FieldTextBoxWidth="30px" FieldLabelWidth="125px" ShowFieldLabel="True" RenderReadOnlyAsDiv="True"></def:datafieldcontrol><BR>
										<def:datafieldcontrol id="Datafieldcontrol1" runat="server" FieldDataType="TEXT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True"
											IsDoubleEntryField="False" FieldLabelText="Scoring Message:" FieldTextBoxTabIndex="31" DatabaseField="ODNRsmg"
											FieldTextBoxWidth="30px" FieldLabelWidth="125px" ShowFieldLabel="True" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
							<BR>
							<BR>
							<TABLE class="layout">
								<TR>
									<TD>
										<def:datafieldcontrol id="validity" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="Validity (1=Valid, 2=Questionable, 3=Invalid)"
											FieldTextBoxTabIndex="32" DatabaseField="validity" FieldTextBoxWidth="30px" FieldLabelWidth="200px"
											ValidList="1,2,3"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="ODNRCmt" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="Comments"
											FieldTextBoxTabIndex="33" DatabaseField="ODNRCmt" FieldLabelWidth="100px" FieldTextBoxTextMode="MultiLine"
											FieldTextBoxHeight="150px" FieldTextBoxMaxLength="200"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
							<BR>
							<TABLE class="layout" id="table_readonly">
								<TR>
									<TD>
										<def:datafieldcontrol id="created" runat="server" FieldDataType="DATE" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="created"
											FieldTextBoxTabIndex="35" DatabaseField="created" FieldLabelWidth="80px" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="createdBy" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="createdBy"
											FieldTextBoxTabIndex="36" DatabaseField="createdBy" FieldLabelWidth="80px" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="updated" runat="server" FieldDataType="DATE" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="updated"
											FieldTextBoxTabIndex="37" DatabaseField="updated" FieldLabelWidth="80px" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="updatedBy" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="updatedBy"
											FieldTextBoxTabIndex="38" DatabaseField="updatedBy" FieldLabelWidth="80px" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="scored" runat="server" FieldDataType="DATE" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="scored"
											FieldTextBoxTabIndex="37" DatabaseField="scored" FieldLabelWidth="80px" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="scoredBy" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="scoredBy"
											FieldTextBoxTabIndex="38" DatabaseField="scoredBy" FieldLabelWidth="80px" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
						</asp:panel></asp:Content>
