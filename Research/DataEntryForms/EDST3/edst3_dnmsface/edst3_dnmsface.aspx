<%@ Page language="c#" Inherits="edst3_dnmsface.edst3_dnmsface" CodeFile="edst3_dnmsface.aspx.cs"  MasterPageFile="~/UWAC.master" %>

<%@ Register TagPrefix="def" Namespace="DataEntryFramework.Old" %>
<asp:Content ID="Content1" ContentPlaceHolderID="oBodyPlaceHolder" runat="server">



<%--		<script language="javascript">
function edst3_dnmsface_onBlur(sFieldID)
{
	unselectField();
	
	switch (sFieldID) {
	
		case "df45s":
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
						setFieldValueIfBlank("df45nco", "-9");
						setFieldValueIfBlank("df45ner", "-9");
						setFieldValueIfBlank("df45ntr", "-9");
					}
				}
			}

			break;

	} // end switch
} // end function

		</script>--%>


						<def:dataentrycontroller id="DataEntryController1" runat="server" ShowScoreButton="False" PrimaryKeyField="df_pk"
							VerifiedField="verified" MeasureName="EDST3 DNMS Face" LookupTextBox1LabelText="EDS ID:" LookupTextBox2Visible="False"
							LookupField1="edsid" DatabaseTable="edst3_dnmsface" StudyMeasID="185"></def:dataentrycontroller>
						<table class="layout" id="table_insert">
							<tr>
								<td><def:datafieldcontrol id="edsid" runat="server" FieldTextBoxWidth="80px" FieldLabelWidth="80px" FieldDataType="INT"
										IsInsertField="True" IsInsertValueRequired="True" IsEntryField="False" IsEntryValueRequired="False"
										IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="EDS ID" FieldTextBoxTabIndex="1" DatabaseField="edsid"></def:datafieldcontrol></td>
							</tr>
							<tr>
								<td><def:datafieldcontrol id="dfdate" runat="server" FieldTextBoxWidth="80px" FieldLabelWidth="80px" FieldDataType="DATE"
										IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
										IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="Date" FieldTextBoxTabIndex="2" DatabaseField="dfdate"
										FormatString="{0:d}"></def:datafieldcontrol></td>
							</tr>
							<tr>
								<td><def:datafieldcontrol id="dfclin" runat="server" FieldTextBoxWidth="80px" FieldLabelWidth="80px" FieldDataType="TEXT"
										IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
										IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="Experimenter" FieldTextBoxTabIndex="3"
										DatabaseField="dfclin"></def:datafieldcontrol></td>
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
													<def:datafieldcontrol id="df01" runat="server" DatabaseField="df01" FieldTextBoxTabIndex="4" FieldLabelText="1"
														IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="INT" FieldLabelWidth="30px" FieldTextBoxWidth="30px" ValidList="0,1,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="df02" runat="server" DatabaseField="df02" FieldTextBoxTabIndex="5" FieldLabelText="2"
														IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="INT" FieldLabelWidth="30px" FieldTextBoxWidth="30px" ValidList="0,1,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="df03" runat="server" DatabaseField="df03" FieldTextBoxTabIndex="6" FieldLabelText="3"
														IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="INT" FieldLabelWidth="30px" FieldTextBoxWidth="30px" ValidList="0,1,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="df04" runat="server" DatabaseField="df04" FieldTextBoxTabIndex="7" FieldLabelText="4"
														IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="INT" FieldLabelWidth="30px" FieldTextBoxWidth="30px" ValidList="0,1,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="df05" runat="server" DatabaseField="df05" FieldTextBoxTabIndex="8" FieldLabelText="5"
														IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="INT" FieldLabelWidth="30px" FieldTextBoxWidth="30px" ValidList="0,1,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="df06" runat="server" DatabaseField="df06" FieldTextBoxTabIndex="9" FieldLabelText="6"
														IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="INT" FieldLabelWidth="30px" FieldTextBoxWidth="30px" ValidList="0,1,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="df07" runat="server" DatabaseField="df07" FieldTextBoxTabIndex="10" FieldLabelText="7"
														IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="INT" FieldLabelWidth="30px" FieldTextBoxWidth="30px" ValidList="0,1,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="df08" runat="server" DatabaseField="df08" FieldTextBoxTabIndex="11" FieldLabelText="8"
														IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="INT" FieldLabelWidth="30px" FieldTextBoxWidth="30px" ValidList="0,1,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="df09" runat="server" DatabaseField="df09" FieldTextBoxTabIndex="12" FieldLabelText="9"
														IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="INT" FieldLabelWidth="30px" FieldTextBoxWidth="30px" ValidList="0,1,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="df10" runat="server" DatabaseField="df10" FieldTextBoxTabIndex="13" FieldLabelText="10"
														IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="INT" FieldLabelWidth="30px" FieldTextBoxWidth="30px" ValidList="0,1,9"></def:datafieldcontrol></TD>
											</TR>
										</TABLE>
									</TD>
									<TD>
										<TABLE class="grid">
											<TR>
												<TD>
													<def:datafieldcontrol id="df11" runat="server" DatabaseField="df11" FieldTextBoxTabIndex="14" FieldLabelText="11"
														IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="INT" FieldLabelWidth="30px" FieldTextBoxWidth="30px" ValidList="0,1,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="df12" runat="server" DatabaseField="df12" FieldTextBoxTabIndex="15" FieldLabelText="12"
														IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="INT" FieldLabelWidth="30px" FieldTextBoxWidth="30px" ValidList="0,1,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="df13" runat="server" DatabaseField="df13" FieldTextBoxTabIndex="16" FieldLabelText="13"
														IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="INT" FieldLabelWidth="30px" FieldTextBoxWidth="30px" ValidList="0,1,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="df14" runat="server" DatabaseField="df14" FieldTextBoxTabIndex="17" FieldLabelText="14"
														IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="INT" FieldLabelWidth="30px" FieldTextBoxWidth="30px" ValidList="0,1,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="df15" runat="server" DatabaseField="df15" FieldTextBoxTabIndex="18" FieldLabelText="15"
														IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="INT" FieldLabelWidth="30px" FieldTextBoxWidth="30px" ValidList="0,1,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="df16" runat="server" DatabaseField="df16" FieldTextBoxTabIndex="19" FieldLabelText="16"
														IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="INT" FieldLabelWidth="30px" FieldTextBoxWidth="30px" ValidList="0,1,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="df17" runat="server" DatabaseField="df17" FieldTextBoxTabIndex="20" FieldLabelText="17"
														IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="INT" FieldLabelWidth="30px" FieldTextBoxWidth="30px" ValidList="0,1,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="df18" runat="server" DatabaseField="df18" FieldTextBoxTabIndex="21" FieldLabelText="18"
														IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="INT" FieldLabelWidth="30px" FieldTextBoxWidth="30px" ValidList="0,1,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="df19" runat="server" DatabaseField="df19" FieldTextBoxTabIndex="22" FieldLabelText="19"
														IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="INT" FieldLabelWidth="30px" FieldTextBoxWidth="30px" ValidList="0,1,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="df20" runat="server" DatabaseField="df20" FieldTextBoxTabIndex="23" FieldLabelText="20"
														IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="INT" FieldLabelWidth="30px" FieldTextBoxWidth="30px" ValidList="0,1,9"></def:datafieldcontrol></TD>
											</TR>
										</TABLE>
									</TD>
									<TD>
										<TABLE class="grid">
											<TR>
												<TD>
													<def:datafieldcontrol id="df21" runat="server" DatabaseField="df21" FieldTextBoxTabIndex="24" FieldLabelText="21"
														IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="INT" FieldLabelWidth="30px" FieldTextBoxWidth="30px" ValidList="0,1,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="df22" runat="server" DatabaseField="df22" FieldTextBoxTabIndex="25" FieldLabelText="22"
														IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="INT" FieldLabelWidth="30px" FieldTextBoxWidth="30px" ValidList="0,1,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="df23" runat="server" DatabaseField="df23" FieldTextBoxTabIndex="26" FieldLabelText="23"
														IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="INT" FieldLabelWidth="30px" FieldTextBoxWidth="30px" ValidList="0,1,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="df24" runat="server" DatabaseField="df24" FieldTextBoxTabIndex="27" FieldLabelText="24"
														IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="INT" FieldLabelWidth="30px" FieldTextBoxWidth="30px" ValidList="0,1,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="df25" runat="server" DatabaseField="df25" FieldTextBoxTabIndex="28" FieldLabelText="25"
														IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="INT" FieldLabelWidth="30px" FieldTextBoxWidth="30px" ValidList="0,1,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="df26" runat="server" DatabaseField="df26" FieldTextBoxTabIndex="29" FieldLabelText="26"
														IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="INT" FieldLabelWidth="30px" FieldTextBoxWidth="30px" ValidList="0,1,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="df27" runat="server" DatabaseField="df27" FieldTextBoxTabIndex="30" FieldLabelText="27"
														IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="INT" FieldLabelWidth="30px" FieldTextBoxWidth="30px" ValidList="0,1,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="df28" runat="server" DatabaseField="df28" FieldTextBoxTabIndex="31" FieldLabelText="28"
														IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="INT" FieldLabelWidth="30px" FieldTextBoxWidth="30px" ValidList="0,1,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="df29" runat="server" DatabaseField="df29" FieldTextBoxTabIndex="32" FieldLabelText="29"
														IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="INT" FieldLabelWidth="30px" FieldTextBoxWidth="30px" ValidList="0,1,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="df30" runat="server" DatabaseField="df30" FieldTextBoxTabIndex="33" FieldLabelText="30"
														IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="INT" FieldLabelWidth="30px" FieldTextBoxWidth="30px" ValidList="0,1,9"></def:datafieldcontrol></TD>
											</TR>
										</TABLE>
									</TD>
									<TD>
										<TABLE class="grid">
											<TR>
												<TD>
													<def:datafieldcontrol id="df31" runat="server" DatabaseField="df31" FieldTextBoxTabIndex="34" FieldLabelText="31"
														IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="INT" FieldLabelWidth="30px" FieldTextBoxWidth="30px" ValidList="0,1,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="df32" runat="server" DatabaseField="df32" FieldTextBoxTabIndex="35" FieldLabelText="32"
														IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="INT" FieldLabelWidth="30px" FieldTextBoxWidth="30px" ValidList="0,1,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="df33" runat="server" DatabaseField="df33" FieldTextBoxTabIndex="36" FieldLabelText="33"
														IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="INT" FieldLabelWidth="30px" FieldTextBoxWidth="30px" ValidList="0,1,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="df34" runat="server" DatabaseField="df34" FieldTextBoxTabIndex="37" FieldLabelText="34"
														IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="INT" FieldLabelWidth="30px" FieldTextBoxWidth="30px" ValidList="0,1,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="df35" runat="server" DatabaseField="df35" FieldTextBoxTabIndex="38" FieldLabelText="35"
														IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="INT" FieldLabelWidth="30px" FieldTextBoxWidth="30px" ValidList="0,1,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="df36" runat="server" DatabaseField="df36" FieldTextBoxTabIndex="39" FieldLabelText="36"
														IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="INT" FieldLabelWidth="30px" FieldTextBoxWidth="30px" ValidList="0,1,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="df37" runat="server" DatabaseField="df37" FieldTextBoxTabIndex="40" FieldLabelText="37"
														IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="INT" FieldLabelWidth="30px" FieldTextBoxWidth="30px" ValidList="0,1,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="df38" runat="server" DatabaseField="df38" FieldTextBoxTabIndex="41" FieldLabelText="38"
														IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="INT" FieldLabelWidth="30px" FieldTextBoxWidth="30px" ValidList="0,1,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="df39" runat="server" DatabaseField="df39" FieldTextBoxTabIndex="42" FieldLabelText="39"
														IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="INT" FieldLabelWidth="30px" FieldTextBoxWidth="30px" ValidList="0,1,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="df40" runat="server" DatabaseField="df40" FieldTextBoxTabIndex="43" FieldLabelText="40"
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
										<def:datafieldcontrol id="df45s" runat="server" DatabaseField="df45s" FieldTextBoxTabIndex="44" FieldLabelText="First 45 sec delay item # (use -999 if 45 sec delay not administered)"
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" FieldLabelWidth="150px" FieldTextBoxWidth="80px" CallOnBlur="unselectField"
											RegEx="^([6-9]|[1-3][0-9]|40|-999)$" RegExDescription="Value must be between 6 and 40 or -999"></def:datafieldcontrol><BR>
									</TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="df05cri" runat="server" DatabaseField="df05cri" FieldTextBoxTabIndex="44" FieldLabelText="5 Sec. Criterion Met? (0=Not Met,1=Met)"
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" FieldLabelWidth="150px" FieldTextBoxWidth="30px" ValidList="0,1,9"
											ShowFieldLabel="True" RenderReadOnlyAsDiv="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="dfbeh" runat="server" DatabaseField="dfbeh" FieldTextBoxTabIndex="45" FieldLabelText="Behavioral comments"
											IsDoubleEntryField="False" IsReadOnly="False" IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="TEXT" FieldLabelWidth="100px" FieldTextBoxWidth="200px" FieldTextBoxTextMode="MultiLine"
											FieldTextBoxHeight="150px" FieldTextBoxMaxLength="255"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>1= Valid<BR>
										2= Question validity (describe below)<BR>
										3= Invalid data (describe below)<BR>
										<def:datafieldcontrol id="dfvld" runat="server" DatabaseField="dfvld" FieldTextBoxTabIndex="46" FieldLabelText="Validity"
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" FieldLabelWidth="100px" FieldTextBoxWidth="30px" ValidList="1,2,3"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="dfcmt" runat="server" DatabaseField="dfcmt" FieldTextBoxTabIndex="47" FieldLabelText="Validity comments"
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
										<def:datafieldcontrol id="df05nco" runat="server" DatabaseField="df05nco" FieldTextBoxTabIndex="47" FieldLabelText="df05nco"
											IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" FieldTextBoxWidth="40px" RegEx="^([0-9]|[1-3][0-9]|40|-9)$"
											RegExDescription="Value must be between 0 and 40 or -9" ShowFieldLabel="False" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="df05ner" runat="server" DatabaseField="df05ner" FieldTextBoxTabIndex="48" FieldLabelText="df05ner"
											IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" FieldTextBoxWidth="40px" RegEx="^([0-9]|[1-3][0-9]|40|-9)$"
											RegExDescription="Value must be between 0 and 40 or -9" ShowFieldLabel="False" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="df05ntr" runat="server" DatabaseField="df05ntr" FieldTextBoxTabIndex="49" FieldLabelText="df05ntr"
											IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" FieldTextBoxWidth="40px" RegEx="^([0-9]|[1-3][0-9]|40|-9)$"
											RegExDescription="Value must be between 0 and 40 or -9" ShowFieldLabel="False" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD class="heading">45 sec delay</TD>
									<TD>
										<def:datafieldcontrol id="df45nco" runat="server" DatabaseField="df45nco" FieldTextBoxTabIndex="50" FieldLabelText="df45nco"
											IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" FieldTextBoxWidth="40px" RegEx="^([0-9]|[1-3][0-9]|40|-9)$"
											RegExDescription="Value must be between 0 and 40 or -9" ShowFieldLabel="False" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="df45ner" runat="server" DatabaseField="df45ner" FieldTextBoxTabIndex="51" FieldLabelText="df45ner"
											IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" FieldTextBoxWidth="40px" RegEx="^([0-9]|[1-3][0-9]|40|-9)$"
											RegExDescription="Value must be between 0 and 40 or -9" ShowFieldLabel="False" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="df45ntr" runat="server" DatabaseField="df45ntr" FieldTextBoxTabIndex="52" FieldLabelText="df45ntr"
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
