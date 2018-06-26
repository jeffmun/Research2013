<%@ Page language="c#" Inherits="edst3_dnmsobj.edst3_dnmsobj" CodeFile="edst3_dnmsobj.aspx.cs"  MasterPageFile="~/UWAC.master" %>
<%@ Register TagPrefix="def" Namespace="DataEntryFramework.Old" %>

<asp:Content ID="Content1" ContentPlaceHolderID="oBodyPlaceHolder" runat="server">


<%--		<script language="javascript">
function edst3_dnmsface_onBlur(sFieldID)
{
	unselectField();
	
	switch (sFieldID) {
	
		case "do45s":
			// If user entered value make sure it's valid
			var fieldval = getFieldValue(sFieldID).toString().trim();
			if (fieldval.trim() != "")
			{
				if (!fieldval.match(/^([6-9]|[1-3][0-9]|40|-999)$/))
				{
					alert("Value must be between 6 and 40 or -999");
					giveFieldFocus(sFieldID);
				}
				else
				{
					
					if (fieldval == "-999")
					{
						setFieldValueIfBlank("do45nco", "-9");
						setFieldValueIfBlank("do45ner", "-9");
						setFieldValueIfBlank("do45ntr", "-9");
					}
				}
			}

			break;

	} // end switch
} // end function

		</script>--%>


						<def:dataentrycontroller id="DataEntryController1" runat="server" ShowScoreButton="False" PrimaryKeyField="do_pk"
							VerifiedField="verified" MeasureName="EDST3 DNMS Objects" LookupTextBox1LabelText="EDS ID:" LookupTextBox2Visible="False"
							LookupField1="edsid" DatabaseTable="edst3_dnmsobj" StudyMeasID="186"></def:dataentrycontroller>
						<table class="layout" id="table_insert">
							<tr>
								<td><def:datafieldcontrol id="edsid" runat="server" FieldTextBoxWidth="80px" FieldLabelWidth="80px" FieldDataType="INT"
										IsInsertField="True" IsInsertValueRequired="True" IsEntryField="False" IsEntryValueRequired="False"
										IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="EDS ID" FieldTextBoxTabIndex="1" DatabaseField="edsid"></def:datafieldcontrol></td>
							</tr>
							<tr>
								<td><def:datafieldcontrol id="dodate" runat="server" FieldTextBoxWidth="80px" FieldLabelWidth="80px" FieldDataType="DATE"
										IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
										IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="Date" FieldTextBoxTabIndex="2" DatabaseField="dodate"
										FormatString="{0:d}"></def:datafieldcontrol></td>
							</tr>
							<tr>
								<td><def:datafieldcontrol id="doclin" runat="server" FieldTextBoxWidth="80px" FieldLabelWidth="80px" FieldDataType="TEXT"
										IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
										IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="Experimenter" FieldTextBoxTabIndex="3"
										DatabaseField="doclin"></def:datafieldcontrol></td>
							</tr>
						</table>
						<br>
						<asp:Panel Runat="server" ID="mainPanel">
							<TABLE class="layout">
								<TR>
									<TD bgColor="#a1b5cf" colSpan="4">0 = Incorrect, 1 = Correct, 9 = Missing/No reach</TD>
								</TR>
								<TR>
									<TD>
										<TABLE class="grid">
											<TR>
												<TD>
													<def:datafieldcontrol id="do01" runat="server" DatabaseField="do01" FieldTextBoxTabIndex="4" FieldLabelText="1"
														IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="INT" FieldLabelWidth="30px" FieldTextBoxWidth="30px" ValidList="0,1,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="do02" runat="server" DatabaseField="do02" FieldTextBoxTabIndex="5" FieldLabelText="2"
														IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="INT" FieldLabelWidth="30px" FieldTextBoxWidth="30px" ValidList="0,1,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="do03" runat="server" DatabaseField="do03" FieldTextBoxTabIndex="6" FieldLabelText="3"
														IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="INT" FieldLabelWidth="30px" FieldTextBoxWidth="30px" ValidList="0,1,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="do04" runat="server" DatabaseField="do04" FieldTextBoxTabIndex="7" FieldLabelText="4"
														IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="INT" FieldLabelWidth="30px" FieldTextBoxWidth="30px" ValidList="0,1,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="do05" runat="server" DatabaseField="do05" FieldTextBoxTabIndex="8" FieldLabelText="5"
														IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="INT" FieldLabelWidth="30px" FieldTextBoxWidth="30px" ValidList="0,1,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="do06" runat="server" DatabaseField="do06" FieldTextBoxTabIndex="9" FieldLabelText="6"
														IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="INT" FieldLabelWidth="30px" FieldTextBoxWidth="30px" ValidList="0,1,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="do07" runat="server" DatabaseField="do07" FieldTextBoxTabIndex="10" FieldLabelText="7"
														IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="INT" FieldLabelWidth="30px" FieldTextBoxWidth="30px" ValidList="0,1,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="do08" runat="server" DatabaseField="do08" FieldTextBoxTabIndex="11" FieldLabelText="8"
														IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="INT" FieldLabelWidth="30px" FieldTextBoxWidth="30px" ValidList="0,1,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="do09" runat="server" DatabaseField="do09" FieldTextBoxTabIndex="12" FieldLabelText="9"
														IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="INT" FieldLabelWidth="30px" FieldTextBoxWidth="30px" ValidList="0,1,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="do10" runat="server" DatabaseField="do10" FieldTextBoxTabIndex="13" FieldLabelText="10"
														IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="INT" FieldLabelWidth="30px" FieldTextBoxWidth="30px" ValidList="0,1,9"></def:datafieldcontrol></TD>
											</TR>
										</TABLE>
									</TD>
									<TD>
										<TABLE class="grid">
											<TR>
												<TD>
													<def:datafieldcontrol id="do11" runat="server" DatabaseField="do11" FieldTextBoxTabIndex="14" FieldLabelText="11"
														IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="INT" FieldLabelWidth="30px" FieldTextBoxWidth="30px" ValidList="0,1,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="do12" runat="server" DatabaseField="do12" FieldTextBoxTabIndex="15" FieldLabelText="12"
														IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="INT" FieldLabelWidth="30px" FieldTextBoxWidth="30px" ValidList="0,1,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="do13" runat="server" DatabaseField="do13" FieldTextBoxTabIndex="16" FieldLabelText="13"
														IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="INT" FieldLabelWidth="30px" FieldTextBoxWidth="30px" ValidList="0,1,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="do14" runat="server" DatabaseField="do14" FieldTextBoxTabIndex="17" FieldLabelText="14"
														IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="INT" FieldLabelWidth="30px" FieldTextBoxWidth="30px" ValidList="0,1,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="do15" runat="server" DatabaseField="do15" FieldTextBoxTabIndex="18" FieldLabelText="15"
														IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="INT" FieldLabelWidth="30px" FieldTextBoxWidth="30px" ValidList="0,1,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="do16" runat="server" DatabaseField="do16" FieldTextBoxTabIndex="19" FieldLabelText="16"
														IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="INT" FieldLabelWidth="30px" FieldTextBoxWidth="30px" ValidList="0,1,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="do17" runat="server" DatabaseField="do17" FieldTextBoxTabIndex="20" FieldLabelText="17"
														IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="INT" FieldLabelWidth="30px" FieldTextBoxWidth="30px" ValidList="0,1,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="do18" runat="server" DatabaseField="do18" FieldTextBoxTabIndex="21" FieldLabelText="18"
														IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="INT" FieldLabelWidth="30px" FieldTextBoxWidth="30px" ValidList="0,1,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="do19" runat="server" DatabaseField="do19" FieldTextBoxTabIndex="22" FieldLabelText="19"
														IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="INT" FieldLabelWidth="30px" FieldTextBoxWidth="30px" ValidList="0,1,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="do20" runat="server" DatabaseField="do20" FieldTextBoxTabIndex="23" FieldLabelText="20"
														IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="INT" FieldLabelWidth="30px" FieldTextBoxWidth="30px" ValidList="0,1,9"></def:datafieldcontrol></TD>
											</TR>
										</TABLE>
									</TD>
									<TD>
										<TABLE class="grid">
											<TR>
												<TD>
													<def:datafieldcontrol id="do21" runat="server" DatabaseField="do21" FieldTextBoxTabIndex="24" FieldLabelText="21"
														IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="INT" FieldLabelWidth="30px" FieldTextBoxWidth="30px" ValidList="0,1,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="do22" runat="server" DatabaseField="do22" FieldTextBoxTabIndex="25" FieldLabelText="22"
														IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="INT" FieldLabelWidth="30px" FieldTextBoxWidth="30px" ValidList="0,1,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="do23" runat="server" DatabaseField="do23" FieldTextBoxTabIndex="26" FieldLabelText="23"
														IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="INT" FieldLabelWidth="30px" FieldTextBoxWidth="30px" ValidList="0,1,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="do24" runat="server" DatabaseField="do24" FieldTextBoxTabIndex="27" FieldLabelText="24"
														IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="INT" FieldLabelWidth="30px" FieldTextBoxWidth="30px" ValidList="0,1,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="do25" runat="server" DatabaseField="do25" FieldTextBoxTabIndex="28" FieldLabelText="25"
														IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="INT" FieldLabelWidth="30px" FieldTextBoxWidth="30px" ValidList="0,1,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="do26" runat="server" DatabaseField="do26" FieldTextBoxTabIndex="29" FieldLabelText="26"
														IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="INT" FieldLabelWidth="30px" FieldTextBoxWidth="30px" ValidList="0,1,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="do27" runat="server" DatabaseField="do27" FieldTextBoxTabIndex="30" FieldLabelText="27"
														IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="INT" FieldLabelWidth="30px" FieldTextBoxWidth="30px" ValidList="0,1,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="do28" runat="server" DatabaseField="do28" FieldTextBoxTabIndex="31" FieldLabelText="28"
														IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="INT" FieldLabelWidth="30px" FieldTextBoxWidth="30px" ValidList="0,1,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="do29" runat="server" DatabaseField="do29" FieldTextBoxTabIndex="32" FieldLabelText="29"
														IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="INT" FieldLabelWidth="30px" FieldTextBoxWidth="30px" ValidList="0,1,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="do30" runat="server" DatabaseField="do30" FieldTextBoxTabIndex="33" FieldLabelText="30"
														IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="INT" FieldLabelWidth="30px" FieldTextBoxWidth="30px" ValidList="0,1,9"></def:datafieldcontrol></TD>
											</TR>
										</TABLE>
									</TD>
									<TD>
										<TABLE class="grid">
											<TR>
												<TD>
													<def:datafieldcontrol id="do31" runat="server" DatabaseField="do31" FieldTextBoxTabIndex="34" FieldLabelText="31"
														IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="INT" FieldLabelWidth="30px" FieldTextBoxWidth="30px" ValidList="0,1,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="do32" runat="server" DatabaseField="do32" FieldTextBoxTabIndex="35" FieldLabelText="32"
														IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="INT" FieldLabelWidth="30px" FieldTextBoxWidth="30px" ValidList="0,1,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="do33" runat="server" DatabaseField="do33" FieldTextBoxTabIndex="36" FieldLabelText="33"
														IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="INT" FieldLabelWidth="30px" FieldTextBoxWidth="30px" ValidList="0,1,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="do34" runat="server" DatabaseField="do34" FieldTextBoxTabIndex="37" FieldLabelText="34"
														IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="INT" FieldLabelWidth="30px" FieldTextBoxWidth="30px" ValidList="0,1,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="do35" runat="server" DatabaseField="do35" FieldTextBoxTabIndex="38" FieldLabelText="35"
														IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="INT" FieldLabelWidth="30px" FieldTextBoxWidth="30px" ValidList="0,1,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="do36" runat="server" DatabaseField="do36" FieldTextBoxTabIndex="39" FieldLabelText="36"
														IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="INT" FieldLabelWidth="30px" FieldTextBoxWidth="30px" ValidList="0,1,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="do37" runat="server" DatabaseField="do37" FieldTextBoxTabIndex="40" FieldLabelText="37"
														IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="INT" FieldLabelWidth="30px" FieldTextBoxWidth="30px" ValidList="0,1,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="do38" runat="server" DatabaseField="do38" FieldTextBoxTabIndex="41" FieldLabelText="38"
														IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="INT" FieldLabelWidth="30px" FieldTextBoxWidth="30px" ValidList="0,1,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="do39" runat="server" DatabaseField="do39" FieldTextBoxTabIndex="42" FieldLabelText="39"
														IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="INT" FieldLabelWidth="30px" FieldTextBoxWidth="30px" ValidList="0,1,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="do40" runat="server" DatabaseField="do40" FieldTextBoxTabIndex="43" FieldLabelText="40"
														IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="INT" FieldLabelWidth="30px" FieldTextBoxWidth="30px" ValidList="0,1,9"></def:datafieldcontrol></TD>
											</TR>
										</TABLE>
									</TD>
								</TR>
							</TABLE>
							<BR>
							<TABLE class="layout">
								<TR>
									<TD>
										<def:datafieldcontrol id="do45s" runat="server" DatabaseField="do45s" FieldTextBoxTabIndex="44" FieldLabelText="First 45 sec delay item # (use -999 if 45 sec delay not administered)"
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" FieldLabelWidth="150px" FieldTextBoxWidth="80px" CallOnBlur="unselectField"
											RegEx="^([6-9]|[1-3][0-9]|40|-999)$" RegExDescription="Value must be between 6 and 40 or -999"></def:datafieldcontrol><BR>
									</TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="do05cri" runat="server" DatabaseField="do05cri" FieldTextBoxTabIndex="44" FieldLabelText="5 Sec. Criterion Met? (0=Not Met,1=Met)"
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" FieldLabelWidth="150px" FieldTextBoxWidth="30px" ValidList="0,1,9"
											ShowFieldLabel="True" RenderReadOnlyAsDiv="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="dobeh" runat="server" DatabaseField="dobeh" FieldTextBoxTabIndex="45" FieldLabelText="Behavioral comments"
											IsDoubleEntryField="False" IsReadOnly="False" IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="TEXT" FieldLabelWidth="100px" FieldTextBoxWidth="200px" FieldTextBoxTextMode="MultiLine"
											FieldTextBoxHeight="150px" FieldTextBoxMaxLength="255"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>1= Valid<BR>
										2= Question validity (describe below)<BR>
										3= Invalid data (describe below)<BR>
										<def:datafieldcontrol id="dovld" runat="server" DatabaseField="dovld" FieldTextBoxTabIndex="46" FieldLabelText="Validity"
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" FieldLabelWidth="100px" FieldTextBoxWidth="30px" ValidList="1,2,3"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="docmt" runat="server" DatabaseField="docmt" FieldTextBoxTabIndex="47" FieldLabelText="Validity comments"
											IsDoubleEntryField="False" IsReadOnly="False" IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="TEXT" FieldLabelWidth="100px" FieldTextBoxWidth="200px" FieldTextBoxTextMode="MultiLine"
											FieldTextBoxHeight="150px" FieldTextBoxMaxLength="255"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
							<BR>
							<TABLE class="grid">
								<TR>
									<TD>(use -9 for missing or N/A)</TD>
									<TD class="heading"># Correct</TD>
									<TD class="heading"># Errors</TD>
									<TD class="heading"># Trials</TD>
								</TR>
								<TR>
									<TD class="heading">5 sec delay</TD>
									<TD>
										<def:datafieldcontrol id="do05nco" runat="server" DatabaseField="do05nco" FieldTextBoxTabIndex="47" FieldLabelText="do05nco"
											IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" FieldTextBoxWidth="40px" RegEx="^([0-9]|[1-3][0-9]|40|-9)$"
											RegExDescription="Value must be between 0 and 40 or -9" ShowFieldLabel="False" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="do05ner" runat="server" DatabaseField="do05ner" FieldTextBoxTabIndex="48" FieldLabelText="do05ner"
											IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" FieldTextBoxWidth="40px" RegEx="^([0-9]|[1-3][0-9]|40|-9)$"
											RegExDescription="Value must be between 0 and 40 or -9" ShowFieldLabel="False" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="do05ntr" runat="server" DatabaseField="do05ntr" FieldTextBoxTabIndex="49" FieldLabelText="do05ntr"
											IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" FieldTextBoxWidth="40px" RegEx="^([0-9]|[1-3][0-9]|40|-9)$"
											RegExDescription="Value must be between 0 and 40 or -9" ShowFieldLabel="False" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD class="heading">45 sec delay</TD>
									<TD>
										<def:datafieldcontrol id="do45nco" runat="server" DatabaseField="do45nco" FieldTextBoxTabIndex="50" FieldLabelText="do45nco"
											IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" FieldTextBoxWidth="40px" RegEx="^([0-9]|[1-3][0-9]|40|-9)$"
											RegExDescription="Value must be between 0 and 40 or -9" ShowFieldLabel="False" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="do45ner" runat="server" DatabaseField="do45ner" FieldTextBoxTabIndex="51" FieldLabelText="do45ner"
											IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" FieldTextBoxWidth="40px" RegEx="^([0-9]|[1-3][0-9]|40|-9)$"
											RegExDescription="Value must be between 0 and 40 or -9" ShowFieldLabel="False" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="do45ntr" runat="server" DatabaseField="do45ntr" FieldTextBoxTabIndex="52" FieldLabelText="do45ntr"
											IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" FieldTextBoxWidth="40px" RegEx="^([0-9]|[1-3][0-9]|40|-9)$"
											RegExDescription="Value must be between 0 and 40 or -9" ShowFieldLabel="False" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
							<BR>
							<TABLE class="layout">
								<TR>
									<TD>
										<def:datafieldcontrol id="created" runat="server" DatabaseField="created" FieldTextBoxTabIndex="60" FieldLabelText="created"
											IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="DATE" FieldLabelWidth="80px" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="createdBy" runat="server" DatabaseField="createdBy" FieldTextBoxTabIndex="61"
											FieldLabelText="createdBy" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT" FieldLabelWidth="80px"
											RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="updated" runat="server" DatabaseField="updated" FieldTextBoxTabIndex="62" FieldLabelText="updated"
											IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="DATE" FieldLabelWidth="80px" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="updatedBy" runat="server" DatabaseField="updatedBy" FieldTextBoxTabIndex="63"
											FieldLabelText="updatedBy" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT" FieldLabelWidth="80px"
											RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
						</asp:Panel>
					</asp:Content>
