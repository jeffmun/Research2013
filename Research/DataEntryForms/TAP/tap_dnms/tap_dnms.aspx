<%@ Register TagPrefix="def" Namespace="DataEntryFramework.Old" %>

<%@ Page language="c#" Inherits="tap_dnms.tap_dnms" CodeFile="tap_dnms.aspx.cs"  MasterPageFile="~/UWAC.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="oBodyPlaceHolder" runat="server">



		<script language="javascript">
function tap_dnms_onBlur(sFieldID)
{
	unselectField();
	
	switch (sFieldID) {
	
		case "ds30s":
			// If user entered value make sure it's valid
			var fieldval = getFieldValue(sFieldID).toString().trim();
			if (fieldval.trim() != "")
			{
				if (!fieldval.match(/^([6-9]|[1-2][0-9]|3[0-5]|-999)$/))
				{
					alert("Value must be between 6 and 35 or -999");
					giveFieldFocus(sFieldID);
				}
				else
				{
					
					if (fieldval == "-999")
					{
						setFieldValueIfBlank("ds30nco", "-9");
						setFieldValueIfBlank("ds30ner", "-9");
						setFieldValueIfBlank("ds30ntr", "-9");
					}
				}
			}

			break; //case "ds30s"

	} // end switch
} // end function


		</script>



						<def:dataentrycontroller id="DataEntryController1" runat="server" DatabaseTable="tap_dnms" LookupField1="tapid"
							LookupTextBox2Visible="False" LookupTextBox1LabelText="TAP ID:" MeasureName="TAP DNMS" PrimaryKeyField="dnms_pk"
							VerifiedField="verified" LookupField1DataType="TEXT" StudyMeasID="349"></def:dataentrycontroller>
						<table class="layout" id="table_insert">
							<tr>
								<td><def:datafieldcontrol id="tapid" runat="server" FieldDataType="TEXT" IsInsertField="True" IsInsertValueRequired="True"
										IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="TAP ID"
										FieldTextBoxTabIndex="2" DatabaseField="tapid" FieldTextBoxWidth="80px" FieldLabelWidth="80px" RegEx="^[T][A][P][0-9][0-9][0-9]$"
										RegExDescription="TAP ID must look like TAP###"></def:datafieldcontrol></td>
							</tr>
							<tr>
								<td><def:datafieldcontrol id="dsdate" runat="server" FieldDataType="DATE" IsInsertField="False" IsInsertValueRequired="False"
										IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="Test Date"
										FieldTextBoxTabIndex="3" DatabaseField="dsdate" FieldTextBoxWidth="80px" FieldLabelWidth="80px" FormatString="{0:d}"></def:datafieldcontrol></td>
							</tr>
							<tr>
								<td><def:datafieldcontrol id="dsclin" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
										IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="Experimenter"
										FieldTextBoxTabIndex="4" DatabaseField="dsclin" FieldTextBoxWidth="80px" FieldLabelWidth="80px"></def:datafieldcontrol></td>
							</tr>
						</table>
						<asp:panel id="mainPanel" Runat="server">
							<TABLE class="layout">
								<TR>
									<TD colSpan="3">0=Incorrect,1=Correct,9=Missing/No reach</TD>
								</TR>
								<TR>
									<TD style="vertical-align:top" width="93">
										<TABLE class="layout">
											<TR>
												<TD>
													<def:datafieldcontrol id="ds01" runat="server" FieldLabelWidth="30px" FieldTextBoxWidth="30px" DatabaseField="ds01"
														FieldTextBoxTabIndex="5" FieldLabelText="1." IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="ds02" runat="server" FieldLabelWidth="30px" FieldTextBoxWidth="30px" DatabaseField="ds02"
														FieldTextBoxTabIndex="6" FieldLabelText="2." IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="ds03" runat="server" FieldLabelWidth="30px" FieldTextBoxWidth="30px" DatabaseField="ds03"
														FieldTextBoxTabIndex="7" FieldLabelText="3." IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="ds04" runat="server" FieldLabelWidth="30px" FieldTextBoxWidth="30px" DatabaseField="ds04"
														FieldTextBoxTabIndex="8" FieldLabelText="4." IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="ds05" runat="server" FieldLabelWidth="30px" FieldTextBoxWidth="30px" DatabaseField="ds05"
														FieldTextBoxTabIndex="9" FieldLabelText="5." IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="ds06" runat="server" FieldLabelWidth="30px" FieldTextBoxWidth="30px" DatabaseField="ds06"
														FieldTextBoxTabIndex="10" FieldLabelText="6." IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="ds07" runat="server" FieldLabelWidth="30px" FieldTextBoxWidth="30px" DatabaseField="ds07"
														FieldTextBoxTabIndex="11" FieldLabelText="7." IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="ds08" runat="server" FieldLabelWidth="30px" FieldTextBoxWidth="30px" DatabaseField="ds08"
														FieldTextBoxTabIndex="12" FieldLabelText="8." IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="ds09" runat="server" FieldLabelWidth="30px" FieldTextBoxWidth="30px" DatabaseField="ds09"
														FieldTextBoxTabIndex="13" FieldLabelText="9." IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="ds10" runat="server" FieldLabelWidth="30px" FieldTextBoxWidth="30px" DatabaseField="ds10"
														FieldTextBoxTabIndex="14" FieldLabelText="10." IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="ds11" runat="server" FieldLabelWidth="30px" FieldTextBoxWidth="30px" DatabaseField="ds11"
														FieldTextBoxTabIndex="15" FieldLabelText="11." IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="ds12" runat="server" FieldLabelWidth="30px" FieldTextBoxWidth="30px" DatabaseField="ds12"
														FieldTextBoxTabIndex="16" FieldLabelText="12." IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="ds13" runat="server" FieldLabelWidth="30px" FieldTextBoxWidth="30px" DatabaseField="ds13"
														FieldTextBoxTabIndex="17" FieldLabelText="13." IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="ds14" runat="server" FieldLabelWidth="30px" FieldTextBoxWidth="30px" DatabaseField="ds14"
														FieldTextBoxTabIndex="18" FieldLabelText="14." IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="ds15" runat="server" FieldLabelWidth="30px" FieldTextBoxWidth="30px" DatabaseField="ds15"
														FieldTextBoxTabIndex="19" FieldLabelText="15." IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="ds16" runat="server" FieldLabelWidth="30px" FieldTextBoxWidth="30px" DatabaseField="ds16"
														FieldTextBoxTabIndex="20" FieldLabelText="16." IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="ds17" runat="server" FieldLabelWidth="30px" FieldTextBoxWidth="30px" DatabaseField="ds17"
														FieldTextBoxTabIndex="21" FieldLabelText="17." IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="ds18" runat="server" FieldLabelWidth="30px" FieldTextBoxWidth="30px" DatabaseField="ds18"
														FieldTextBoxTabIndex="22" FieldLabelText="18." IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="ds19" runat="server" FieldLabelWidth="30px" FieldTextBoxWidth="30px" DatabaseField="ds19"
														FieldTextBoxTabIndex="23" FieldLabelText="19." IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="ds20" runat="server" FieldLabelWidth="30px" FieldTextBoxWidth="30px" DatabaseField="ds20"
														FieldTextBoxTabIndex="24" FieldLabelText="20." IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,9"></def:datafieldcontrol></TD>
											</TR>
										</TABLE>
									</TD>
									<TD style="vertical-align:top" width="96">
										<TABLE class="layout">
											<TR>
												<TD>
													<def:datafieldcontrol id="ds21" runat="server" FieldLabelWidth="30px" FieldTextBoxWidth="30px" DatabaseField="ds21"
														FieldTextBoxTabIndex="25" FieldLabelText="21." IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,9"
														FieldTextBoxTextDefault="9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="ds22" runat="server" FieldLabelWidth="30px" FieldTextBoxWidth="30px" DatabaseField="ds22"
														FieldTextBoxTabIndex="26" FieldLabelText="22." IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,9"
														FieldTextBoxTextDefault="9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="ds23" runat="server" FieldLabelWidth="30px" FieldTextBoxWidth="30px" DatabaseField="ds23"
														FieldTextBoxTabIndex="27" FieldLabelText="23." IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,9"
														FieldTextBoxTextDefault="9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="ds24" runat="server" FieldLabelWidth="30px" FieldTextBoxWidth="30px" DatabaseField="ds24"
														FieldTextBoxTabIndex="28" FieldLabelText="24." IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,9"
														FieldTextBoxTextDefault="9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="ds25" runat="server" FieldLabelWidth="30px" FieldTextBoxWidth="30px" DatabaseField="ds25"
														FieldTextBoxTabIndex="29" FieldLabelText="25." IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,9"
														FieldTextBoxTextDefault="9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="ds26" runat="server" FieldLabelWidth="30px" FieldTextBoxWidth="30px" DatabaseField="ds26"
														FieldTextBoxTabIndex="30" FieldLabelText="26." IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,9"
														FieldTextBoxTextDefault="9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="ds27" runat="server" FieldLabelWidth="30px" FieldTextBoxWidth="30px" DatabaseField="ds27"
														FieldTextBoxTabIndex="31" FieldLabelText="27." IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,9"
														FieldTextBoxTextDefault="9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="ds28" runat="server" FieldLabelWidth="30px" FieldTextBoxWidth="30px" DatabaseField="ds28"
														FieldTextBoxTabIndex="32" FieldLabelText="28." IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,9"
														FieldTextBoxTextDefault="9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="ds29" runat="server" FieldLabelWidth="30px" FieldTextBoxWidth="30px" DatabaseField="ds29"
														FieldTextBoxTabIndex="33" FieldLabelText="29." IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,9"
														FieldTextBoxTextDefault="9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="ds30" runat="server" FieldLabelWidth="30px" FieldTextBoxWidth="30px" DatabaseField="ds30"
														FieldTextBoxTabIndex="34" FieldLabelText="30." IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,9"
														FieldTextBoxTextDefault="9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="ds31" runat="server" FieldLabelWidth="30px" FieldTextBoxWidth="30px" DatabaseField="ds31"
														FieldTextBoxTabIndex="35" FieldLabelText="31." IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,9"
														FieldTextBoxTextDefault="9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="ds32" runat="server" FieldLabelWidth="30px" FieldTextBoxWidth="30px" DatabaseField="ds32"
														FieldTextBoxTabIndex="36" FieldLabelText="32." IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,9"
														FieldTextBoxTextDefault="9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="ds33" runat="server" FieldLabelWidth="30px" FieldTextBoxWidth="30px" DatabaseField="ds33"
														FieldTextBoxTabIndex="37" FieldLabelText="33." IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,9"
														FieldTextBoxTextDefault="9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="ds34" runat="server" FieldLabelWidth="30px" FieldTextBoxWidth="30px" DatabaseField="ds34"
														FieldTextBoxTabIndex="38" FieldLabelText="34." IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,9"
														FieldTextBoxTextDefault="9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="ds35" runat="server" FieldLabelWidth="30px" FieldTextBoxWidth="30px" DatabaseField="ds35"
														FieldTextBoxTabIndex="39" FieldLabelText="35." IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,9"
														FieldTextBoxTextDefault="9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="Datafieldcontrol1" runat="server" FieldLabelWidth="30px" FieldTextBoxWidth="30px"
														DatabaseField="ds36" FieldTextBoxTabIndex="39" FieldLabelText="36." IsDoubleEntryField="True" IsReadOnly="False"
														IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
														FieldDataType="INT" ValidList="0,1,9" FieldTextBoxTextDefault="9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="Datafieldcontrol2" runat="server" FieldLabelWidth="30px" FieldTextBoxWidth="30px"
														DatabaseField="ds37" FieldTextBoxTabIndex="39" FieldLabelText="37." IsDoubleEntryField="True" IsReadOnly="False"
														IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
														FieldDataType="INT" ValidList="0,1,9" FieldTextBoxTextDefault="9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="Datafieldcontrol3" runat="server" FieldLabelWidth="30px" FieldTextBoxWidth="30px"
														DatabaseField="ds38" FieldTextBoxTabIndex="39" FieldLabelText="38." IsDoubleEntryField="True" IsReadOnly="False"
														IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
														FieldDataType="INT" ValidList="0,1,9" FieldTextBoxTextDefault="9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="Datafieldcontrol4" runat="server" FieldLabelWidth="30px" FieldTextBoxWidth="30px"
														DatabaseField="ds39" FieldTextBoxTabIndex="39" FieldLabelText="39." IsDoubleEntryField="True" IsReadOnly="False"
														IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
														FieldDataType="INT" ValidList="0,1,9" FieldTextBoxTextDefault="9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="Datafieldcontrol5" runat="server" FieldLabelWidth="30px" FieldTextBoxWidth="30px"
														DatabaseField="ds40" FieldTextBoxTabIndex="39" FieldLabelText="40." IsDoubleEntryField="True" IsReadOnly="False"
														IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
														FieldDataType="INT" ValidList="0,1,9" FieldTextBoxTextDefault="9"></def:datafieldcontrol></TD>
											</TR>
										</TABLE>
									</TD>
									<TD style="vertical-align:top">
										<TABLE class="layout">
											<TR>
												<TD>(-999=30 sec delay not administered)<BR>
													<def:datafieldcontrol id="ds30s" runat="server" RegExDescription="Value must be between 6 and 35 or -999"
														RegEx="^([6-9]|[1-2][0-9]|3[0-5]|-999)$" FieldLabelWidth="150px" FieldTextBoxWidth="40px" DatabaseField="ds30s"
														FieldTextBoxTabIndex="40" FieldLabelText="First 30 sec delay item # " IsDoubleEntryField="True" IsReadOnly="False"
														IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
														FieldDataType="INT" CallOnBlur="unselectField"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="ds05cri" runat="server" FieldLabelWidth="150px" FieldTextBoxWidth="30px" DatabaseField="ds05cri"
														FieldTextBoxTabIndex="43" FieldLabelText="5 Sec. Criterion Met? (0=Not Met,1=Met)" IsDoubleEntryField="True"
														IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
														FieldDataType="INT" ValidList="0,1"></def:datafieldcontrol></TD>
											</TR>
										</TABLE>
										<BR>
										<TABLE class="grid">
											<TR>
												<TD></TD>
												<TD># Correct</TD>
												<TD># Errors</TD>
												<TD># Trials</TD>
											</TR>
											<TR>
												<TD class="heading">5 sec delay</TD>
												<TD>
													<def:datafieldcontrol id="ds05nco" runat="server" RegExDescription="Value must be between 0 and 20 or -9"
														RegEx="^([0-9]|1[0-9]|20|-9)$" FieldTextBoxWidth="30px" DatabaseField="ds05nco" FieldTextBoxTabIndex="44"
														FieldLabelText="ds05nco" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ShowFieldLabel="False"
														RenderReadOnlyAsDiv="False"></def:datafieldcontrol></TD>
												<TD>
													<def:datafieldcontrol id="ds05ner" runat="server" RegExDescription="Value must be between 0 and 20 or -9"
														RegEx="^([0-9]|1[0-9]|20|-9)$" FieldTextBoxWidth="30px" DatabaseField="ds05ner" FieldTextBoxTabIndex="45"
														FieldLabelText="ds05ner" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ShowFieldLabel="False"
														RenderReadOnlyAsDiv="False"></def:datafieldcontrol></TD>
												<TD>
													<def:datafieldcontrol id="ds05ntr" runat="server" RegExDescription="Value must be between 0 and 35 or -9"
														RegEx="^([0-9]|[1-2][0-9]|3[0-5]|-9)$" FieldTextBoxWidth="30px" DatabaseField="ds05ntr" FieldTextBoxTabIndex="45"
														FieldLabelText="ds05ntr" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ShowFieldLabel="False"
														RenderReadOnlyAsDiv="False"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD class="heading">30 sec delay</TD>
												<TD>
													<def:datafieldcontrol id="ds30nco" runat="server" RegExDescription="Value must be between 0 and 15 or -9"
														RegEx="^([0-9]|1[0-5]|-9)$" FieldTextBoxWidth="30px" DatabaseField="ds30nco" FieldTextBoxTabIndex="47"
														FieldLabelText="ds30nco" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ShowFieldLabel="False"
														RenderReadOnlyAsDiv="False"></def:datafieldcontrol></TD>
												<TD>
													<def:datafieldcontrol id="ds30ner" runat="server" RegExDescription="Value must be between 0 and 15 or -9"
														RegEx="^([0-9]|1[0-5]|-9)$" FieldTextBoxWidth="30px" DatabaseField="ds30ner" FieldTextBoxTabIndex="48"
														FieldLabelText="ds30ner" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ShowFieldLabel="False"
														RenderReadOnlyAsDiv="False"></def:datafieldcontrol></TD>
												<TD>
													<def:datafieldcontrol id="ds30ntr" runat="server" RegExDescription="Value must be between 0 and 35 or -9"
														RegEx="^([0-9]|[1-2][0-9]|3[0-5]|-9)$" FieldTextBoxWidth="30px" DatabaseField="ds30ntr" FieldTextBoxTabIndex="48"
														FieldLabelText="ds30ntr" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
														IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ShowFieldLabel="False"
														RenderReadOnlyAsDiv="False"></def:datafieldcontrol></TD>
											</TR>
										</TABLE>
										<BR>
										<TABLE class="layout">
											<TR>
												<TD>
													<def:datafieldcontrol id="dsbeh" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="200px" DatabaseField="dsbeh"
														FieldTextBoxTabIndex="51" FieldLabelText="Behavioral Comments" IsDoubleEntryField="False" IsReadOnly="False"
														IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
														FieldDataType="TEXT" FieldTextBoxMaxLength="255" FieldTextBoxHeight="150px" FieldTextBoxTextMode="MultiLine"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="dsvld" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="30px" DatabaseField="dsvld"
														FieldTextBoxTabIndex="52" FieldLabelText="Validity (1=valid, 2=questionable, 3=Invalid)" IsDoubleEntryField="True"
														IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
														FieldDataType="INT" ValidList="1,2,3"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="dscmt" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="200px" DatabaseField="dscmt"
														FieldTextBoxTabIndex="53" FieldLabelText="Validity Comments" IsDoubleEntryField="False" IsReadOnly="False"
														IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
														FieldDataType="TEXT" FieldTextBoxMaxLength="255" FieldTextBoxHeight="150px" FieldTextBoxTextMode="MultiLine"></def:datafieldcontrol></TD>
											</TR>
										</TABLE>
									</TD>
								</TR>
							</TABLE>
							<BR>
							<TABLE class="layout" id="table_readonly">
								<TR>
									<TD>
										<def:datafieldcontrol id="created" runat="server" FieldLabelWidth="80px" DatabaseField="created" FieldTextBoxTabIndex="56"
											FieldLabelText="created" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="DATE" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="createdBy" runat="server" FieldLabelWidth="80px" DatabaseField="createdBy" FieldTextBoxTabIndex="57"
											FieldLabelText="createdBy" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="updated" runat="server" FieldLabelWidth="80px" DatabaseField="updated" FieldTextBoxTabIndex="58"
											FieldLabelText="updated" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="DATE" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="updatedBy" runat="server" FieldLabelWidth="80px" DatabaseField="updatedBy" FieldTextBoxTabIndex="59"
											FieldLabelText="updatedBy" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
						</asp:panel></asp:Content>
