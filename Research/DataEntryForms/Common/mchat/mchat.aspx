    <%@ Register TagPrefix="def" Namespace="DataEntryFramework3" %> 
<%@ Page language="c#" MasterPageFile="~/UWAC.master"  Title="MChat Data Entry" %>
<asp:Content ID="Content1" ContentPlaceHolderID="oBodyPlaceHolder" runat="server">


	<script language="javascript">
function tap_mchat_onBlur(sFieldID)
{
	unselectField();
	
	/*
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
	*/

}




	</script>

<def:dataentrycontroller id="DataEntryController1" runat="server" DatabaseTable="all_mchat" PrimaryKeyField="mchat_pk"/>


						<table class="layout">
							<tr>
								<td><def:datafieldcontrol id="tapid" runat="server" FieldDataType="TEXT" IsInsertField="True" IsInsertValueRequired="True"
										IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="ID"
										FieldTextBoxTabIndex="2" DatabaseField="id" FieldTextBoxWidth="80px" FieldLabelWidth="80px"></def:datafieldcontrol>

                                        <def:datafieldcontrol runat="server" id="indexnum" DatabaseField="indexnum" IsInsertField="true" FieldTextBoxTextDefault="1" FieldLabelWidth="80px" FieldTextBoxWidth="40px"></def:datafieldcontrol>

                                        </td>
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
						<br>
						<table class="grid">
							<tr>
								<td colspan="2" align="center">Scoring</td>
							</tr>
							<tr>
								<td class="heading">Critical Failed:</td>
								<td>
									<def:datafieldcontrol id="MCTCRISC" runat="server" DatabaseField="MCTCRISC" FieldTextBoxTabIndex="5" FieldLabelText="MCTCRISC"
										IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
										IsInsertField="False" FieldDataType="INT" ShowFieldLabel="False" DESIGNTIMEDRAGDROP="483" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></td>
							</tr>
							<TR>
								<TD class="heading">Total Failed:</TD>
								<TD>
									<def:datafieldcontrol id="MCTSCR" runat="server" DatabaseField="MCTSCR" FieldTextBoxTabIndex="5" FieldLabelText="MCTSCR"
										IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
										IsInsertField="False" FieldDataType="INT" ShowFieldLabel="False" DESIGNTIMEDRAGDROP="691" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
							</TR>
							<TR>
								<TD><B>Result:</B></TD>
								<TD>
									<def:datafieldcontrol id="MCTRSLT" runat="server" DatabaseField="MCTRSLT" FieldTextBoxTabIndex="5" FieldLabelText="MCTRSLT"
										IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
										IsInsertField="False" FieldDataType="TEXT" ShowFieldLabel="False" DESIGNTIMEDRAGDROP="692" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
							</TR>
						</table>
						<def:datafieldcontrol id="scoremsg" runat="server" DatabaseField="scoremsg" FieldTextBoxTabIndex="5" FieldLabelText="Scoring Status:"
							IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
							IsInsertField="False" FieldDataType="TEXT" ShowFieldLabel="True" RenderReadOnlyAsDiv="True" FieldLabelWidth="100px"></def:datafieldcontrol><br>
						<asp:panel id="mainPanel" Runat="server">
							<BR>
							<TABLE class="grid">
								<TR>
									<TD>Directions:<BR>
										1) Enter 1=Yes or 0=No for all 23 INITIAL questions.<BR>
										2) Supply a 1=Pass or 0=Fail for any FOLLOW-UP items.<BR>
										<BR>
										<B>Scoring:</B><BR>
										<BR>
										Any supplied FOLLOW-UP value determines the pass/fail status
										<BR>
										for that item. If no FOLLOW-UP value is supplied then the INITIAL response
										<BR>
										is used.<BR>
										<BR>
										The MCHAT is failed if any 3 or more items are failed -OR-
										<BR>
										if 2 or more critical (bold) items are failed.
									</TD>
								</TR>
							</TABLE>
							<BR>
							<TABLE class="grid" id="table_entry">
								<TR>
									<TD colSpan="3">Critical Items in <B>bold</B></TD>
								</TR>
								<TR>
									<TD class="heading" align="right"><B>INITIAL</B><BR>
										<BR>
										1=YES<BR>
										0=NO<BR>
										9=Missing</TD>
									<TD class="heading">Passing<BR>
										Value</TD>
									<TD class="heading"><B>FOLLOW-UP</B><BR>
										<BR>
										1=PASS<BR>
										0=FAIL<BR>
										9=Missing</TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="MCT01" runat="server" FieldLabelWidth="650px" FieldTextBoxWidth="30px" DatabaseField="MCT01"
											FieldTextBoxTabIndex="5" FieldLabelText="1.   Does your child enjoy being swung, bounced on your knee, etc.?"
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" DESIGNTIMEDRAGDROP="257" CallOnBlur="tap_mchat_onBlur" ValidList="0,1,9"></def:datafieldcontrol></TD>
									<TD>1</TD>
									<TD>
										<def:datafieldcontrol id="MCTPF01" runat="server" FieldTextBoxWidth="30px" DatabaseField="MCTPF01" FieldTextBoxTabIndex="29"
											FieldLabelText="MCTPF01" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ShowFieldLabel="False"
											></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="MCT02" runat="server" FieldLabelWidth="650px" FieldTextBoxWidth="30px" DatabaseField="MCT02"
											FieldTextBoxTabIndex="6" FieldLabelText="2.   Does your child take an interest in other children?"
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" CallOnBlur="tap_mchat_onBlur" ValidList="0,1,9" FieldLabelCssClass="boldfieldlabel"></def:datafieldcontrol></TD>
									<TD>1</TD>
									<TD>
										<def:datafieldcontrol id="MCTPF02" runat="server" FieldTextBoxWidth="30px" DatabaseField="MCTPF02" FieldTextBoxTabIndex="30"
											FieldLabelText="MCTPF02" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" DESIGNTIMEDRAGDROP="318"
											ShowFieldLabel="False" ValidList="0,1,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="MCT03" runat="server" FieldLabelWidth="650px" FieldTextBoxWidth="30px" DatabaseField="MCT03"
											FieldTextBoxTabIndex="7" FieldLabelText="3.   Does your child like climbing on things, such as up stairs?"
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" CallOnBlur="tap_mchat_onBlur" ValidList="0,1,9"></def:datafieldcontrol></TD>
									<TD>1</TD>
									<TD>
										<def:datafieldcontrol id="MCTPF03" runat="server" FieldTextBoxWidth="30px" DatabaseField="MCTPF03" FieldTextBoxTabIndex="31"
											FieldLabelText="MCTPF03" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ShowFieldLabel="False"
											ValidList="0,1,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="MCT04" runat="server" FieldLabelWidth="650px" FieldTextBoxWidth="30px" DatabaseField="MCT04"
											FieldTextBoxTabIndex="8" FieldLabelText="4.   Does your child enjoy playing peek-a-boo/hide-and-seek?"
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" CallOnBlur="tap_mchat_onBlur" ValidList="0,1,9"></def:datafieldcontrol></TD>
									<TD>1</TD>
									<TD>
										<def:datafieldcontrol id="MCTPF04" runat="server" FieldTextBoxWidth="30px" DatabaseField="MCTPF04" FieldTextBoxTabIndex="32"
											FieldLabelText="MCTPF04" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" DESIGNTIMEDRAGDROP="324"
											ShowFieldLabel="False" ValidList="0,1,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="MCT05" runat="server" FieldLabelWidth="650px" FieldTextBoxWidth="30px" DatabaseField="MCT05"
											FieldTextBoxTabIndex="9" FieldLabelText="5.   Does your child ever pretend, for example, to talk on the phone or take care of a doll or pretend other things?"
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" CallOnBlur="tap_mchat_onBlur" ValidList="0,1,9"></def:datafieldcontrol></TD>
									<TD>1</TD>
									<TD>
										<def:datafieldcontrol id="MCTPF05" runat="server" FieldTextBoxWidth="30px" DatabaseField="MCTPF05" FieldTextBoxTabIndex="33"
											FieldLabelText="MCTPF05" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ShowFieldLabel="False"
											ValidList="0,1,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="MCT06" runat="server" FieldLabelWidth="650px" FieldTextBoxWidth="30px" DatabaseField="MCT06"
											FieldTextBoxTabIndex="10" FieldLabelText="6.   Does your child ever use his index finger to point, to ask for something?"
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" CallOnBlur="tap_mchat_onBlur" ValidList="0,1,9"></def:datafieldcontrol></TD>
									<TD>1</TD>
									<TD>
										<def:datafieldcontrol id="MCTPF06" runat="server" FieldTextBoxWidth="30px" DatabaseField="MCTPF06" FieldTextBoxTabIndex="34"
											FieldLabelText="MCTPF06" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" DESIGNTIMEDRAGDROP="330"
											ShowFieldLabel="False" ValidList="0,1,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="MCT07" runat="server" FieldLabelWidth="650px" FieldTextBoxWidth="30px" DatabaseField="MCT07"
											FieldTextBoxTabIndex="11" FieldLabelText="7.   Does your child ever use his/her index finger to point, to indicate interest in something?"
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" CallOnBlur="tap_mchat_onBlur" ValidList="0,1,9" FieldLabelCssClass="boldfieldlabel"></def:datafieldcontrol></TD>
									<TD>1</TD>
									<TD>
										<def:datafieldcontrol id="MCTPF07" runat="server" FieldTextBoxWidth="30px" DatabaseField="MCTPF07" FieldTextBoxTabIndex="35"
											FieldLabelText="MCTPF07" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" DESIGNTIMEDRAGDROP="333"
											ShowFieldLabel="False" ValidList="0,1,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="MCT08" runat="server" FieldLabelWidth="650px" FieldTextBoxWidth="30px" DatabaseField="MCT08"
											FieldTextBoxTabIndex="12" FieldLabelText="8.   Can your child play properly with toys (e.g., cars or bricks) without just mouthing fiddling, or dropping them?"
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" CallOnBlur="tap_mchat_onBlur" ValidList="0,1,9"></def:datafieldcontrol></TD>
									<TD>1</TD>
									<TD>
										<def:datafieldcontrol id="MCTPF08" runat="server" FieldTextBoxWidth="30px" DatabaseField="MCTPF08" FieldTextBoxTabIndex="36"
											FieldLabelText="MCTPF08" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ShowFieldLabel="False"
											ValidList="0,1,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="MCT09" runat="server" FieldLabelWidth="650px" FieldTextBoxWidth="30px" DatabaseField="MCT09"
											FieldTextBoxTabIndex="13" FieldLabelText="9.   Does your child ever bring objects over to you (parent) to show you something?"
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" CallOnBlur="tap_mchat_onBlur" ValidList="0,1,9" FieldLabelCssClass="boldfieldlabel"></def:datafieldcontrol></TD>
									<TD>1</TD>
									<TD>
										<def:datafieldcontrol id="MCTPF09" runat="server" FieldTextBoxWidth="30px" DatabaseField="MCTPF09" FieldTextBoxTabIndex="37"
											FieldLabelText="MCTPF09" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ShowFieldLabel="False"
											ValidList="0,1,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="MCT10" runat="server" FieldLabelWidth="650px" FieldTextBoxWidth="30px" DatabaseField="MCT10"
											FieldTextBoxTabIndex="14" FieldLabelText="10.  Does your child look you in the eye for more than a second or two?"
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" CallOnBlur="tap_mchat_onBlur" ValidList="0,1,9"></def:datafieldcontrol></TD>
									<TD>1</TD>
									<TD>
										<def:datafieldcontrol id="MCTPF10" runat="server" FieldTextBoxWidth="30px" DatabaseField="MCTPF10" FieldTextBoxTabIndex="38"
											FieldLabelText="MCTPF10" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ShowFieldLabel="False"
											ValidList="0,1,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="MCT11" runat="server" FieldLabelWidth="650px" FieldTextBoxWidth="30px" DatabaseField="MCT11"
											FieldTextBoxTabIndex="15" FieldLabelText="11.  Does your child ever seem oversensitive to noise? (e.g., plugging ears)"
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" CallOnBlur="tap_mchat_onBlur" ValidList="0,1,9"></def:datafieldcontrol></TD>
									<TD>0</TD>
									<TD>
										<def:datafieldcontrol id="MCTPF11" runat="server" FieldTextBoxWidth="30px" DatabaseField="MCTPF11" FieldTextBoxTabIndex="39"
											FieldLabelText="MCTPF11" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ShowFieldLabel="False"
											ValidList="0,1,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="MCT12" runat="server" FieldLabelWidth="650px" FieldTextBoxWidth="30px" DatabaseField="MCT12"
											FieldTextBoxTabIndex="16" FieldLabelText="12.  Does your child smile in response to your face or your smile?"
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" CallOnBlur="tap_mchat_onBlur" ValidList="0,1,9"></def:datafieldcontrol></TD>
									<TD>1</TD>
									<TD>
										<def:datafieldcontrol id="MCTPF12" runat="server" FieldTextBoxWidth="30px" DatabaseField="MCTPF12" FieldTextBoxTabIndex="40"
											FieldLabelText="MCTPF12" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ShowFieldLabel="False"
											ValidList="0,1,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="MCT13" runat="server" FieldLabelWidth="650px" FieldTextBoxWidth="30px" DatabaseField="MCT13"
											FieldTextBoxTabIndex="17" FieldLabelText="13.  Does your child imitate you? (e.g., you make a face-will your child imitate it?)"
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" CallOnBlur="tap_mchat_onBlur" ValidList="0,1,9" FieldLabelCssClass="boldfieldlabel"></def:datafieldcontrol></TD>
									<TD>1</TD>
									<TD>
										<def:datafieldcontrol id="MCTPF13" runat="server" FieldTextBoxWidth="30px" DatabaseField="MCTPF13" FieldTextBoxTabIndex="41"
											FieldLabelText="MCTPF13" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" DESIGNTIMEDRAGDROP="436"
											ShowFieldLabel="False" ValidList="0,1,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="MCT14" runat="server" FieldLabelWidth="650px" FieldTextBoxWidth="30px" DatabaseField="MCT14"
											FieldTextBoxTabIndex="18" FieldLabelText="14.  Does your child respond to his/her name when you call?"
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" CallOnBlur="tap_mchat_onBlur" ValidList="0,1,9" FieldLabelCssClass="boldfieldlabel"></def:datafieldcontrol></TD>
									<TD>1</TD>
									<TD>
										<def:datafieldcontrol id="MCTPF14" runat="server" FieldTextBoxWidth="30px" DatabaseField="MCTPF14" FieldTextBoxTabIndex="42"
											FieldLabelText="MCTPF14" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ShowFieldLabel="False"
											ValidList="0,1,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="MCT15" runat="server" FieldLabelWidth="650px" FieldTextBoxWidth="30px" DatabaseField="MCT15"
											FieldTextBoxTabIndex="19" FieldLabelText="15.  If you point at a toy across the room, does your child look at it?"
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" CallOnBlur="tap_mchat_onBlur" ValidList="0,1,9" FieldLabelCssClass="boldfieldlabel"></def:datafieldcontrol></TD>
									<TD>1</TD>
									<TD>
										<def:datafieldcontrol id="MCTPF15" runat="server" FieldTextBoxWidth="30px" DatabaseField="MCTPF15" FieldTextBoxTabIndex="43"
											FieldLabelText="MCTPF15" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ShowFieldLabel="False"
											ValidList="0,1,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="MCT16" runat="server" FieldLabelWidth="650px" FieldTextBoxWidth="30px" DatabaseField="MCT16"
											FieldTextBoxTabIndex="20" FieldLabelText="16.  Does your child walk?" IsDoubleEntryField="True" IsReadOnly="False"
											IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" CallOnBlur="tap_mchat_onBlur" ValidList="0,1,9"></def:datafieldcontrol></TD>
									<TD>1</TD>
									<TD>
										<def:datafieldcontrol id="MCTPF16" runat="server" FieldTextBoxWidth="30px" DatabaseField="MCTPF16" FieldTextBoxTabIndex="44"
											FieldLabelText="MCTPF16" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ShowFieldLabel="False"
											ValidList="0,1,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="MCT17" runat="server" FieldLabelWidth="650px" FieldTextBoxWidth="30px" DatabaseField="MCT17"
											FieldTextBoxTabIndex="21" FieldLabelText="17.  Does your child look at things you are looking at?"
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" CallOnBlur="tap_mchat_onBlur" ValidList="0,1,9"></def:datafieldcontrol></TD>
									<TD>1</TD>
									<TD>
										<def:datafieldcontrol id="MCTPF17" runat="server" FieldTextBoxWidth="30px" DatabaseField="MCTPF17" FieldTextBoxTabIndex="45"
											FieldLabelText="MCTPF17" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ShowFieldLabel="False"
											ValidList="0,1,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="MCT18" runat="server" FieldLabelWidth="650px" FieldTextBoxWidth="30px" DatabaseField="MCT18"
											FieldTextBoxTabIndex="22" FieldLabelText="18.  Does your child make unusual finger movements near his/her face?"
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" CallOnBlur="tap_mchat_onBlur" ValidList="0,1,9"></def:datafieldcontrol></TD>
									<TD>0</TD>
									<TD>
										<def:datafieldcontrol id="MCTPF18" runat="server" FieldTextBoxWidth="30px" DatabaseField="MCTPF18" FieldTextBoxTabIndex="46"
											FieldLabelText="MCTPF18" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ShowFieldLabel="False"
											ValidList="0,1,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="MCT19" runat="server" FieldLabelWidth="650px" FieldTextBoxWidth="30px" DatabaseField="MCT19"
											FieldTextBoxTabIndex="23" FieldLabelText="19.  Does your child try to attract your attention to his/her own activity?"
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" CallOnBlur="tap_mchat_onBlur" ValidList="0,1,9"></def:datafieldcontrol></TD>
									<TD>1</TD>
									<TD>
										<def:datafieldcontrol id="MCTPF19" runat="server" FieldTextBoxWidth="30px" DatabaseField="MCTPF19" FieldTextBoxTabIndex="47"
											FieldLabelText="MCTPF19" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ShowFieldLabel="False"
											ValidList="0,1,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="MCT20" runat="server" FieldLabelWidth="650px" FieldTextBoxWidth="30px" DatabaseField="MCT20"
											FieldTextBoxTabIndex="24" FieldLabelText="20.  Have you ever wondered if your child is deaf?" IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" CallOnBlur="tap_mchat_onBlur" ValidList="0,1,9"></def:datafieldcontrol></TD>
									<TD>0</TD>
									<TD>
										<def:datafieldcontrol id="MCTPF20" runat="server" FieldTextBoxWidth="30px" DatabaseField="MCTPF20" FieldTextBoxTabIndex="48"
											FieldLabelText="MCTPF20" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ShowFieldLabel="False"
											ValidList="0,1,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="MCT21" runat="server" FieldLabelWidth="650px" FieldTextBoxWidth="30px" DatabaseField="MCT21"
											FieldTextBoxTabIndex="25" FieldLabelText="21.  Does your child understand what people say?" IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" CallOnBlur="tap_mchat_onBlur" ValidList="0,1,9"></def:datafieldcontrol></TD>
									<TD>1</TD>
									<TD>
										<def:datafieldcontrol id="MCTPF21" runat="server" FieldTextBoxWidth="30px" DatabaseField="MCTPF21" FieldTextBoxTabIndex="49"
											FieldLabelText="MCTPF21" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ShowFieldLabel="False"
											ValidList="0,1,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="MCT22" runat="server" FieldLabelWidth="650px" FieldTextBoxWidth="30px" DatabaseField="MCT22"
											FieldTextBoxTabIndex="26" FieldLabelText="22.  Does your child sometimes stare at nothing or wander with no purpose?"
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" CallOnBlur="tap_mchat_onBlur" ValidList="0,1,9"></def:datafieldcontrol></TD>
									<TD>0</TD>
									<TD>
										<def:datafieldcontrol id="MCTPF22" runat="server" FieldTextBoxWidth="30px" DatabaseField="MCTPF22" FieldTextBoxTabIndex="50"
											FieldLabelText="MCTPF22" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ShowFieldLabel="False"
											ValidList="0,1,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="MCT23" runat="server" FieldLabelWidth="650px" FieldTextBoxWidth="30px" DatabaseField="MCT23"
											FieldTextBoxTabIndex="27" FieldLabelText="23.  Does your child look at your face to check your reaction when faced with something unfamiliar?"
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" CallOnBlur="tap_mchat_onBlur" ValidList="0,1,9"></def:datafieldcontrol></TD>
									<TD>1</TD>
									<TD>
										<def:datafieldcontrol id="MCTPF23" runat="server" FieldTextBoxWidth="30px" DatabaseField="MCTPF23" FieldTextBoxTabIndex="51"
											FieldLabelText="MCTPF23" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ShowFieldLabel="False"
											ValidList="0,1,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="MCT24" runat="server" FieldLabelWidth="650px" FieldTextBoxWidth="30px" DatabaseField="MCT24"
											FieldTextBoxTabIndex="60" FieldLabelText="Have you ever filled out this form for this child before?"
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="0,1,9"></def:datafieldcontrol></TD>
									<TD></TD>
									<TD></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="MCTCMT" runat="server" FieldTextBoxWidth="200px" DatabaseField="MCTCMT" FieldTextBoxTabIndex="61"
											FieldLabelText="Comments" IsDoubleEntryField="False" IsReadOnly="False" IsEntryValueRequired="False"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT" FieldTextBoxMaxLength="255"
											FieldTextBoxTextMode="MultiLine" FieldTextBoxHeight="150px"></def:datafieldcontrol></TD>
									<TD></TD>
									<TD></TD>
								</TR>
							</TABLE>
							<BR>
							<TABLE class="layout" id="table_readonly">
								<TR>
									<TD>
										<def:datafieldcontrol id="created" runat="server" FieldLabelWidth="80px" DatabaseField="created" FieldTextBoxTabIndex="31"
											FieldLabelText="created" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="DATE" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="createdBy" runat="server" FieldLabelWidth="80px" DatabaseField="createdBy" FieldTextBoxTabIndex="32"
											FieldLabelText="createdBy" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="updated" runat="server" FieldLabelWidth="80px" DatabaseField="updated" FieldTextBoxTabIndex="33"
											FieldLabelText="updated" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="DATE" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="updatedBy" runat="server" FieldLabelWidth="80px" DatabaseField="updatedBy" FieldTextBoxTabIndex="34"
											FieldLabelText="updatedBy" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="scored" runat="server" FieldLabelWidth="80px" DatabaseField="scored" FieldTextBoxTabIndex="237"
											FieldLabelText="scored" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="DATE" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="scoredBy" runat="server" FieldLabelWidth="80px" DatabaseField="scoredBy" FieldTextBoxTabIndex="238"
											FieldLabelText="scoredBy" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
						</asp:panel></asp:Content>
