
<%@ Register TagPrefix="def" Namespace="DataEntryFramework.Old" %>
<%@ Page language="c#" Inherits="tap_mchat.tap_mchat" CodeFile="tap_mchat.aspx.cs"  MasterPageFile="~/UWAC.master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="oBodyPlaceHolder" runat="server">



	<script language="javascript">
function tap_mchat_onBlur(sFieldID)
{
	unselectField();
	
	switch (sFieldID) {
	
		case "MCT01": if (getFieldValue(sFieldID) == "1") setFieldValueIfBlank("MCTPF01", "1"); break;
		case "MCT02": if (getFieldValue(sFieldID) == "1") setFieldValueIfBlank("MCTPF02", "1"); break;
		case "MCT03": if (getFieldValue(sFieldID) == "1") setFieldValueIfBlank("MCTPF03", "1"); break;
		case "MCT04": if (getFieldValue(sFieldID) == "1") setFieldValueIfBlank("MCTPF04", "1"); break;
		case "MCT05": if (getFieldValue(sFieldID) == "1") setFieldValueIfBlank("MCTPF05", "1"); break;
		case "MCT06": if (getFieldValue(sFieldID) == "1") setFieldValueIfBlank("MCTPF06", "1"); break;
		case "MCT07": if (getFieldValue(sFieldID) == "1") setFieldValueIfBlank("MCTPF07", "1"); break;
		case "MCT08": if (getFieldValue(sFieldID) == "1") setFieldValueIfBlank("MCTPF08", "1"); break;
		case "MCT09": if (getFieldValue(sFieldID) == "1") setFieldValueIfBlank("MCTPF09", "1"); break;
		case "MCT10": if (getFieldValue(sFieldID) == "1") setFieldValueIfBlank("MCTPF10", "1"); break;
		case "MCT11": if (getFieldValue(sFieldID) == "0") setFieldValueIfBlank("MCTPF11", "1"); break;
		case "MCT12": if (getFieldValue(sFieldID) == "1") setFieldValueIfBlank("MCTPF12", "1"); break;
		case "MCT13": if (getFieldValue(sFieldID) == "1") setFieldValueIfBlank("MCTPF13", "1"); break;
		case "MCT14": if (getFieldValue(sFieldID) == "1") setFieldValueIfBlank("MCTPF14", "1"); break;
		case "MCT15": if (getFieldValue(sFieldID) == "1") setFieldValueIfBlank("MCTPF15", "1"); break;
		case "MCT16": if (getFieldValue(sFieldID) == "1") setFieldValueIfBlank("MCTPF16", "1"); break;
		case "MCT17": if (getFieldValue(sFieldID) == "1") setFieldValueIfBlank("MCTPF17", "1"); break;
		case "MCT18": if (getFieldValue(sFieldID) == "0") setFieldValueIfBlank("MCTPF18", "1"); break;
		case "MCT19": if (getFieldValue(sFieldID) == "1") setFieldValueIfBlank("MCTPF19", "1"); break;
		case "MCT20": if (getFieldValue(sFieldID) == "0") setFieldValueIfBlank("MCTPF20", "1"); break;
		case "MCT21": if (getFieldValue(sFieldID) == "1") setFieldValueIfBlank("MCTPF21", "1"); break;
		case "MCT22": if (getFieldValue(sFieldID) == "0") setFieldValueIfBlank("MCTPF22", "1"); break;
		case "MCT23": if (getFieldValue(sFieldID) == "1") setFieldValueIfBlank("MCTPF23", "1"); break;

	}

}




	</script>


						<def:dataentrycontroller id="DataEntryController1" runat="server" DatabaseTable="tap_mchat" LookupField1="tapid"
							LookupTextBox2Visible="False" LookupTextBox1LabelText="TAP ID:" MeasureName="MCHAT" PrimaryKeyField="mchat_pk"
							VerifiedField="verified" LookupField1DataType="TEXT" StudyMeasID="341"></def:dataentrycontroller>
						<table class="layout">
							<tr>
								<td><def:datafieldcontrol id="tapid" runat="server" FieldDataType="TEXT" IsInsertField="True" IsInsertValueRequired="True"
										IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="TAP ID"
										FieldTextBoxTabIndex="2" DatabaseField="tapid" FieldTextBoxWidth="80px" RegEx="^[T][A][P][0-9][0-9][0-9]$"
										RegExDescription="TAP ID must look like TAP###" FieldLabelWidth="80px"></def:datafieldcontrol></td>
							</tr>
							<tr>
								<td><def:datafieldcontrol id="MCTdate" runat="server" FieldDataType="DATE" IsInsertField="False" IsInsertValueRequired="False"
										IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="Test Date"
										FieldTextBoxTabIndex="3" DatabaseField="MCTdate" FieldTextBoxWidth="80px" FieldLabelWidth="80px" FormatString="{0:d}"></def:datafieldcontrol></td>
							</tr>
							<tr>
								<td><def:datafieldcontrol id="MCTclin" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
										IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="Clinician"
										FieldTextBoxTabIndex="4" DatabaseField="MCTclin" FieldTextBoxWidth="80px" FieldLabelWidth="80px"></def:datafieldcontrol></td>
							</tr>
						</table>
						<asp:panel id="mainPanel" Runat="server">
							<br/>
							<TABLE class="grid">
								<TR>
									<TD>Directions:<br/>
										1) Enter 1=Yes or 0=No for all 23 questions.<br/>
										2) Supply a 1=Pass or 0=Fail for all failed items.</TD>
								</TR>
							</TABLE>
							<br/>
							<TABLE class="grid" id="table_entry">
								<TR>
									<TD class="heading" align="right">1=YES<br/>
										0=NO<br/>
										9=Missing</TD>
									<TD class="heading">Passing<br/>
										Value</TD>
									<TD class="heading">1=PASS<br/>
										0=FAIL<br/>
										9=Missing</TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="MCT01" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="1.   Does your child enjoy being swung, bounced on your knee, etc.?"
											FieldTextBoxTabIndex="5" DatabaseField="MCT01" FieldTextBoxWidth="30px" FieldLabelWidth="450px" ValidList="0,1,9"
											CallOnBlur="tap_mchat_onBlur"></def:datafieldcontrol></TD>
									<TD>1</TD>
									<TD>
										<def:datafieldcontrol id="MCTPF01" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="MCTPF01"
											FieldTextBoxTabIndex="29" DatabaseField="MCTPF01" FieldTextBoxWidth="30px" ValidList="0,1,9" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="MCT02" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="2.   Does your child take an interest in other children?"
											FieldTextBoxTabIndex="6" DatabaseField="MCT02" FieldTextBoxWidth="30px" FieldLabelWidth="450px" ValidList="0,1,9"
											FieldLabelCssClass="boldfieldlabel" CallOnBlur="tap_mchat_onBlur"></def:datafieldcontrol></TD>
									<TD>1</TD>
									<TD>
										<def:datafieldcontrol id="MCTPF02" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="MCTPF02"
											FieldTextBoxTabIndex="30" DatabaseField="MCTPF02" FieldTextBoxWidth="30px" ValidList="0,1,9" ShowFieldLabel="False"
											DESIGNTIMEDRAGDROP="318"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="MCT03" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="3.   Does your child like climbing on things, such as up stairs?"
											FieldTextBoxTabIndex="7" DatabaseField="MCT03" FieldTextBoxWidth="30px" FieldLabelWidth="450px" ValidList="0,1,9"
											CallOnBlur="tap_mchat_onBlur"></def:datafieldcontrol></TD>
									<TD>1</TD>
									<TD>
										<def:datafieldcontrol id="MCTPF03" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="MCTPF03"
											FieldTextBoxTabIndex="31" DatabaseField="MCTPF03" FieldTextBoxWidth="30px" ValidList="0,1,9" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="MCT04" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="4.   Does your child enjoy playing peek-a-boo/hide-and-seek?"
											FieldTextBoxTabIndex="8" DatabaseField="MCT04" FieldTextBoxWidth="30px" FieldLabelWidth="450px" ValidList="0,1,9"
											CallOnBlur="tap_mchat_onBlur"></def:datafieldcontrol></TD>
									<TD>1</TD>
									<TD>
										<def:datafieldcontrol id="MCTPF04" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="MCTPF04"
											FieldTextBoxTabIndex="32" DatabaseField="MCTPF04" FieldTextBoxWidth="30px" ValidList="0,1,9" ShowFieldLabel="False"
											DESIGNTIMEDRAGDROP="324"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="MCT05" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="5.   Does your child ever pretend, for example, to talk on the phone or take care of a doll or pretend other things?"
											FieldTextBoxTabIndex="9" DatabaseField="MCT05" FieldTextBoxWidth="30px" FieldLabelWidth="450px" ValidList="0,1,9"
											CallOnBlur="tap_mchat_onBlur"></def:datafieldcontrol></TD>
									<TD>1</TD>
									<TD>
										<def:datafieldcontrol id="MCTPF05" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="MCTPF05"
											FieldTextBoxTabIndex="33" DatabaseField="MCTPF05" FieldTextBoxWidth="30px" ValidList="0,1,9" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="MCT06" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="6.   Does your child ever use his index finger to point, to ask for something?"
											FieldTextBoxTabIndex="10" DatabaseField="MCT06" FieldTextBoxWidth="30px" FieldLabelWidth="450px" ValidList="0,1,9"
											CallOnBlur="tap_mchat_onBlur"></def:datafieldcontrol></TD>
									<TD>1</TD>
									<TD>
										<def:datafieldcontrol id="MCTPF06" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="MCTPF06"
											FieldTextBoxTabIndex="34" DatabaseField="MCTPF06" FieldTextBoxWidth="30px" ValidList="0,1,9" ShowFieldLabel="False"
											DESIGNTIMEDRAGDROP="330"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="MCT07" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="7.   Does your child ever use his/her index finger to point, to indicate interest in something?"
											FieldTextBoxTabIndex="11" DatabaseField="MCT07" FieldTextBoxWidth="30px" FieldLabelWidth="450px" ValidList="0,1,9"
											FieldLabelCssClass="boldfieldlabel" CallOnBlur="tap_mchat_onBlur"></def:datafieldcontrol></TD>
									<TD>1</TD>
									<TD>
										<def:datafieldcontrol id="MCTPF07" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="MCTPF07"
											FieldTextBoxTabIndex="35" DatabaseField="MCTPF07" FieldTextBoxWidth="30px" ValidList="0,1,9" ShowFieldLabel="False"
											DESIGNTIMEDRAGDROP="333"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="MCT08" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="8.   Can your child play properly with toys (e.g., cars or bricks) without just mouthing fiddling, or dropping them?"
											FieldTextBoxTabIndex="12" DatabaseField="MCT08" FieldTextBoxWidth="30px" FieldLabelWidth="450px" ValidList="0,1,9"
											CallOnBlur="tap_mchat_onBlur"></def:datafieldcontrol></TD>
									<TD>1</TD>
									<TD>
										<def:datafieldcontrol id="MCTPF08" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="MCTPF08"
											FieldTextBoxTabIndex="36" DatabaseField="MCTPF08" FieldTextBoxWidth="30px" ValidList="0,1,9" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="MCT09" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="9.   Does your child ever bring objects over to you (parent) to show you something?"
											FieldTextBoxTabIndex="13" DatabaseField="MCT09" FieldTextBoxWidth="30px" FieldLabelWidth="450px" ValidList="0,1,9"
											FieldLabelCssClass="boldfieldlabel" CallOnBlur="tap_mchat_onBlur"></def:datafieldcontrol></TD>
									<TD>1</TD>
									<TD>
										<def:datafieldcontrol id="MCTPF09" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="MCTPF09"
											FieldTextBoxTabIndex="37" DatabaseField="MCTPF09" FieldTextBoxWidth="30px" ValidList="0,1,9" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="MCT10" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="10.  Does your child look you in the eye for more than a second or two?"
											FieldTextBoxTabIndex="14" DatabaseField="MCT10" FieldTextBoxWidth="30px" FieldLabelWidth="450px" ValidList="0,1,9"
											CallOnBlur="tap_mchat_onBlur"></def:datafieldcontrol></TD>
									<TD>1</TD>
									<TD>
										<def:datafieldcontrol id="MCTPF10" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="MCTPF10"
											FieldTextBoxTabIndex="38" DatabaseField="MCTPF10" FieldTextBoxWidth="30px" ValidList="0,1,9" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="MCT11" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="11.  Does your child ever seem oversensitive to noise? (e.g., plugging ears)"
											FieldTextBoxTabIndex="15" DatabaseField="MCT11" FieldTextBoxWidth="30px" FieldLabelWidth="450px" ValidList="0,1,9"
											CallOnBlur="tap_mchat_onBlur"></def:datafieldcontrol></TD>
									<TD>0</TD>
									<TD>
										<def:datafieldcontrol id="MCTPF11" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="MCTPF11"
											FieldTextBoxTabIndex="39" DatabaseField="MCTPF11" FieldTextBoxWidth="30px" ValidList="0,1,9" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="MCT12" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="12.  Does your child smile in response to your face or your smile?"
											FieldTextBoxTabIndex="16" DatabaseField="MCT12" FieldTextBoxWidth="30px" FieldLabelWidth="450px" ValidList="0,1,9"
											CallOnBlur="tap_mchat_onBlur"></def:datafieldcontrol></TD>
									<TD>1</TD>
									<TD>
										<def:datafieldcontrol id="MCTPF12" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="MCTPF12"
											FieldTextBoxTabIndex="40" DatabaseField="MCTPF12" FieldTextBoxWidth="30px" ValidList="0,1,9" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="MCT13" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="13.  Does your child imitate you? (e.g., you make a face-will your child imitate it?)"
											FieldTextBoxTabIndex="17" DatabaseField="MCT13" FieldTextBoxWidth="30px" FieldLabelWidth="450px" ValidList="0,1,9"
											FieldLabelCssClass="boldfieldlabel" CallOnBlur="tap_mchat_onBlur"></def:datafieldcontrol></TD>
									<TD>1</TD>
									<TD>
										<def:datafieldcontrol id="MCTPF13" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="MCTPF13"
											FieldTextBoxTabIndex="41" DatabaseField="MCTPF13" FieldTextBoxWidth="30px" ValidList="0,1,9" ShowFieldLabel="False"
											DESIGNTIMEDRAGDROP="436"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="MCT14" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="14.  Does your child respond to his/her name when you call?"
											FieldTextBoxTabIndex="18" DatabaseField="MCT14" FieldTextBoxWidth="30px" FieldLabelWidth="450px" ValidList="0,1,9"
											FieldLabelCssClass="boldfieldlabel" CallOnBlur="tap_mchat_onBlur"></def:datafieldcontrol></TD>
									<TD>1</TD>
									<TD>
										<def:datafieldcontrol id="MCTPF14" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="MCTPF14"
											FieldTextBoxTabIndex="42" DatabaseField="MCTPF14" FieldTextBoxWidth="30px" ValidList="0,1,9" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="MCT15" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="15.  If you point at a toy across the room, does your child look at it?"
											FieldTextBoxTabIndex="19" DatabaseField="MCT15" FieldTextBoxWidth="30px" FieldLabelWidth="450px" ValidList="0,1,9"
											FieldLabelCssClass="boldfieldlabel" CallOnBlur="tap_mchat_onBlur"></def:datafieldcontrol></TD>
									<TD>1</TD>
									<TD>
										<def:datafieldcontrol id="MCTPF15" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="MCTPF15"
											FieldTextBoxTabIndex="43" DatabaseField="MCTPF15" FieldTextBoxWidth="30px" ValidList="0,1,9" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="MCT16" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="16.  Does your child walk?"
											FieldTextBoxTabIndex="20" DatabaseField="MCT16" FieldTextBoxWidth="30px" FieldLabelWidth="450px" ValidList="0,1,9"
											CallOnBlur="tap_mchat_onBlur"></def:datafieldcontrol></TD>
									<TD>1</TD>
									<TD>
										<def:datafieldcontrol id="MCTPF16" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="MCTPF16"
											FieldTextBoxTabIndex="44" DatabaseField="MCTPF16" FieldTextBoxWidth="30px" ValidList="0,1,9" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="MCT17" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="17.  Does your child look at things you are looking at?"
											FieldTextBoxTabIndex="21" DatabaseField="MCT17" FieldTextBoxWidth="30px" FieldLabelWidth="450px" ValidList="0,1,9"
											CallOnBlur="tap_mchat_onBlur"></def:datafieldcontrol></TD>
									<TD>1</TD>
									<TD>
										<def:datafieldcontrol id="MCTPF17" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="MCTPF17"
											FieldTextBoxTabIndex="45" DatabaseField="MCTPF17" FieldTextBoxWidth="30px" ValidList="0,1,9" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="MCT18" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="18.  Does your child make unusual finger movements near his/her face?"
											FieldTextBoxTabIndex="22" DatabaseField="MCT18" FieldTextBoxWidth="30px" FieldLabelWidth="450px" ValidList="0,1,9"
											CallOnBlur="tap_mchat_onBlur"></def:datafieldcontrol></TD>
									<TD>0</TD>
									<TD>
										<def:datafieldcontrol id="MCTPF18" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="MCTPF18"
											FieldTextBoxTabIndex="46" DatabaseField="MCTPF18" FieldTextBoxWidth="30px" ValidList="0,1,9" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="MCT19" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="19.  Does your child try to attract your attention to his/her own activity?"
											FieldTextBoxTabIndex="23" DatabaseField="MCT19" FieldTextBoxWidth="30px" FieldLabelWidth="450px" ValidList="0,1,9"
											CallOnBlur="tap_mchat_onBlur"></def:datafieldcontrol></TD>
									<TD>1</TD>
									<TD>
										<def:datafieldcontrol id="MCTPF19" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="MCTPF19"
											FieldTextBoxTabIndex="47" DatabaseField="MCTPF19" FieldTextBoxWidth="30px" ValidList="0,1,9" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="MCT20" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="20.  Have you ever wondered if your child is deaf?"
											FieldTextBoxTabIndex="24" DatabaseField="MCT20" FieldTextBoxWidth="30px" FieldLabelWidth="450px" ValidList="0,1,9"
											CallOnBlur="tap_mchat_onBlur"></def:datafieldcontrol></TD>
									<TD>0</TD>
									<TD>
										<def:datafieldcontrol id="MCTPF20" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="MCTPF20"
											FieldTextBoxTabIndex="48" DatabaseField="MCTPF20" FieldTextBoxWidth="30px" ValidList="0,1,9" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="MCT21" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="21.  Does your child understand what people say?"
											FieldTextBoxTabIndex="25" DatabaseField="MCT21" FieldTextBoxWidth="30px" FieldLabelWidth="450px" ValidList="0,1,9"
											CallOnBlur="tap_mchat_onBlur"></def:datafieldcontrol></TD>
									<TD>1</TD>
									<TD>
										<def:datafieldcontrol id="MCTPF21" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="MCTPF21"
											FieldTextBoxTabIndex="49" DatabaseField="MCTPF21" FieldTextBoxWidth="30px" ValidList="0,1,9" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="MCT22" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="22.  Does your child sometimes stare at nothing or wander with no purpose?"
											FieldTextBoxTabIndex="26" DatabaseField="MCT22" FieldTextBoxWidth="30px" FieldLabelWidth="450px" ValidList="0,1,9"
											CallOnBlur="tap_mchat_onBlur"></def:datafieldcontrol></TD>
									<TD>0</TD>
									<TD>
										<def:datafieldcontrol id="MCTPF22" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="MCTPF22"
											FieldTextBoxTabIndex="50" DatabaseField="MCTPF22" FieldTextBoxWidth="30px" ValidList="0,1,9" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="MCT23" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="23.  Does your child look at your face to check your reaction when faced with something unfamiliar?"
											FieldTextBoxTabIndex="27" DatabaseField="MCT23" FieldTextBoxWidth="30px" FieldLabelWidth="450px" ValidList="0,1,9"
											CallOnBlur="tap_mchat_onBlur"></def:datafieldcontrol></TD>
									<TD>1</TD>
									<TD>
										<def:datafieldcontrol id="MCTPF23" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="MCTPF23"
											FieldTextBoxTabIndex="51" DatabaseField="MCTPF23" FieldTextBoxWidth="30px" ValidList="0,1,9" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="MCT24" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="Have you ever filled out this form for this child before?"
											FieldTextBoxTabIndex="60" DatabaseField="MCT24" FieldTextBoxWidth="30px" FieldLabelWidth="450px" ValidList="0,1,9"></def:datafieldcontrol></TD>
									<TD></TD>
									<TD></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="MCTCMT" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="Comments"
											FieldTextBoxTabIndex="61" DatabaseField="MCTCMT" FieldTextBoxWidth="200px" FieldTextBoxHeight="150px"
											FieldTextBoxTextMode="MultiLine" FieldTextBoxMaxLength="255"></def:datafieldcontrol></TD>
									<TD></TD>
									<TD></TD>
								</TR>
							</TABLE>
							<br/>
							<TABLE class="layout" id="table_readonly">
								<TR>
									<TD>
										<def:datafieldcontrol id="created" runat="server" FieldDataType="DATE" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="created"
											FieldTextBoxTabIndex="31" DatabaseField="created" FieldLabelWidth="80px" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="createdBy" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="createdBy"
											FieldTextBoxTabIndex="32" DatabaseField="createdBy" FieldLabelWidth="80px" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="updated" runat="server" FieldDataType="DATE" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="updated"
											FieldTextBoxTabIndex="33" DatabaseField="updated" FieldLabelWidth="80px" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="updatedBy" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="updatedBy"
											FieldTextBoxTabIndex="34" DatabaseField="updatedBy" FieldLabelWidth="80px" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
						</asp:panel></asp:Content>
