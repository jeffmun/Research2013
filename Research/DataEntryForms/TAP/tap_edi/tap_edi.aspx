<%@ Page language="c#" Inherits="tap_edi.tap_edi" CodeFile="tap_edi.aspx.cs"  MasterPageFile="~/UWAC.master" %>

<%@ Register TagPrefix="def" Namespace="DataEntryFramework.Old" %>
<asp:Content ID="Content1" ContentPlaceHolderID="oBodyPlaceHolder" runat="server">
						<def:dataentrycontroller id="DataEntryController1" runat="server" DatabaseTable="tap_edi" LookupField1="tapid"
							LookupTextBox2Visible="False" LookupTextBox1LabelText="TAP ID:" MeasureName="TAP EDI" PrimaryKeyField="edi_pk"
							VerifiedField="verified" LookupField1DataType="TEXT" StudyMeasID="343"></def:dataentrycontroller>
						<table id="table_insert" class="layout">
							<tr>
								<td><def:datafieldcontrol id="tapid" runat="server" FieldDataType="TEXT" IsInsertField="True" IsInsertValueRequired="True"
										IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="TAP ID"
										FieldTextBoxTabIndex="2" DatabaseField="tapid" FieldTextBoxWidth="80px" FieldLabelWidth="80px" RegEx="^[T][A][P][0-9][0-9][0-9]$"
										RegExDescription="TAP ID must look like TAP###"></def:datafieldcontrol>
								</td>
							</tr>
							<tr>
								<td><def:datafieldcontrol id="EDIdate" runat="server" FieldDataType="DATE" IsInsertField="False" IsInsertValueRequired="False"
										IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="Interview Date"
										FieldTextBoxTabIndex="3" DatabaseField="EDIdate" FieldLabelWidth="80px" FieldTextBoxWidth="80px" FormatString="{0:d}"></def:datafieldcontrol>
								</td>
							</tr>
							<tr>
								<td><def:datafieldcontrol id="EDIintv" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
										IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="Interviewer"
										FieldTextBoxTabIndex="4" DatabaseField="EDIintv" FieldLabelWidth="80px" FieldTextBoxWidth="80px"></def:datafieldcontrol>
								</td>
							</tr>
						</table>
						<br>
						<asp:Panel Runat="server" ID="mainPanel">
							0 = no<BR>1 = possible/somewhat<BR>2 = definite 
      <TABLE class="grid">
								<TR>
									<TD bgColor="#a1b5cf">0-3 months</TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="EDI01" runat="server" FieldLabelWidth="400px" FieldTextBoxWidth="30px" DatabaseField="EDI01"
											FieldTextBoxTabIndex="5" FieldLabelText="1. Difficult to hold, cuddle? (no molding to body)" IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="EDI02" runat="server" FieldLabelWidth="400px" FieldTextBoxWidth="30px" DatabaseField="EDI02"
											FieldTextBoxTabIndex="6" FieldLabelText="2. Exceptionally fussy, difficult to soothe? (not related to colic)"
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="EDI03" runat="server" FieldLabelWidth="400px" FieldTextBoxWidth="30px" DatabaseField="EDI03"
											FieldTextBoxTabIndex="7" FieldLabelText="3. Exceptionally easy baby, content doing own thing?" IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="EDI04" runat="server" FieldLabelWidth="400px" FieldTextBoxWidth="30px" DatabaseField="EDI04"
											FieldTextBoxTabIndex="8" FieldLabelText="4. Overly sensitive/lack of sensitivity to noise, tactile input?"
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="EDI05" runat="server" FieldLabelWidth="400px" FieldTextBoxWidth="30px" DatabaseField="EDI05"
											FieldTextBoxTabIndex="9" FieldLabelText="5. Sleeping problems?" IsDoubleEntryField="True" IsReadOnly="False"
											IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="EDI06" runat="server" FieldLabelWidth="400px" FieldTextBoxWidth="30px" DatabaseField="EDI06"
											FieldTextBoxTabIndex="10" FieldLabelText="6. Feeding problems? (sucking problems, choking, regurgitation, arching, anxiousness, refusal to feed)"
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="EDI07" runat="server" FieldLabelWidth="400px" FieldTextBoxWidth="30px" DatabaseField="EDI07"
											FieldTextBoxTabIndex="11" FieldLabelText="7. Oddities in muscle tone? (low tone/floppy, high tone, combination)"
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="EDI08" runat="server" FieldLabelWidth="400px" FieldTextBoxWidth="30px" DatabaseField="EDI08"
											FieldTextBoxTabIndex="13" FieldLabelText="8. Anything else that gave you concern? (write in)" IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="0,1,2,9" FieldTextBoxTextDefault="9"></def:datafieldcontrol><BR>
										<def:datafieldcontrol id="EDI08ot" runat="server" FieldTextBoxWidth="250px" DatabaseField="EDI08ot" FieldTextBoxTabIndex="13"
											FieldLabelText="EDI08ot" IsDoubleEntryField="False" IsReadOnly="False" IsEntryValueRequired="False"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD bgColor="#a1b5cf">4-6 months</TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="EDI09" runat="server" FieldLabelWidth="400px" FieldTextBoxWidth="30px" DatabaseField="EDI09"
											FieldTextBoxTabIndex="14" FieldLabelText="9. Difficult to hold, cuddle? (no molding to body)" IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="EDI10" runat="server" FieldLabelWidth="400px" FieldTextBoxWidth="30px" DatabaseField="EDI10"
											FieldTextBoxTabIndex="15" FieldLabelText="10. Exceptionally fussy, difficult to soothe? (not related to colic)"
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="EDI11" runat="server" FieldLabelWidth="400px" FieldTextBoxWidth="30px" DatabaseField="EDI11"
											FieldTextBoxTabIndex="16" FieldLabelText="11. Exceptionally easy baby (content doing own thing)?"
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="EDI12" runat="server" FieldLabelWidth="400px" FieldTextBoxWidth="30px" DatabaseField="EDI12"
											FieldTextBoxTabIndex="17" FieldLabelText="12. Overly sensitive/lack of sensitivity to noise, tactile input?"
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="EDI13" runat="server" FieldLabelWidth="400px" FieldTextBoxWidth="30px" DatabaseField="EDI13"
											FieldTextBoxTabIndex="18" FieldLabelText="13. Sleeping problems?" IsDoubleEntryField="True" IsReadOnly="False"
											IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="EDI14" runat="server" FieldLabelWidth="400px" FieldTextBoxWidth="30px" DatabaseField="EDI14"
											FieldTextBoxTabIndex="19" FieldLabelText="14. Feeding problems? (sucking problems, choking, regurgitation, arching, anxiousness, refusal to feed)"
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="EDI15" runat="server" FieldLabelWidth="400px" FieldTextBoxWidth="30px" DatabaseField="EDI15"
											FieldTextBoxTabIndex="20" FieldLabelText="15. Oddities in muscle tone? (low tone/floppy, high tone, combination)"
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="EDI16" runat="server" FieldLabelWidth="400px" FieldTextBoxWidth="30px" DatabaseField="EDI16"
											FieldTextBoxTabIndex="21" FieldLabelText="16.  Lack of smiling at people?" IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="EDI17" runat="server" FieldLabelWidth="400px" FieldTextBoxWidth="30px" DatabaseField="EDI17"
											FieldTextBoxTabIndex="22" FieldLabelText="17. Exceptionally long attention span for nonsocial things?"
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="EDI18" runat="server" FieldLabelWidth="400px" FieldTextBoxWidth="30px" DatabaseField="EDI18"
											FieldTextBoxTabIndex="23" FieldLabelText="18. Exceptionally long attention span for social things (i.e. watching people)?"
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="EDI19" runat="server" FieldLabelWidth="400px" FieldTextBoxWidth="30px" DatabaseField="EDI19"
											FieldTextBoxTabIndex="25" FieldLabelText="19. Anything else that gave you concern? (write in)" IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="0,1,2,9" FieldTextBoxTextDefault="9"></def:datafieldcontrol><BR>
										<def:datafieldcontrol id="EDI19ot" runat="server" FieldTextBoxWidth="250px" DatabaseField="EDI19ot" FieldTextBoxTabIndex="25"
											FieldLabelText="EDI19ot" IsDoubleEntryField="False" IsReadOnly="False" IsEntryValueRequired="False"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD bgColor="#a1b5cf">7-9 months</TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="EDI20" runat="server" FieldLabelWidth="400px" FieldTextBoxWidth="30px" DatabaseField="EDI20"
											FieldTextBoxTabIndex="26" FieldLabelText="20. Difficult to hold, cuddle? (no molding to body)" IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="EDI21" runat="server" FieldLabelWidth="400px" FieldTextBoxWidth="30px" DatabaseField="EDI21"
											FieldTextBoxTabIndex="27" FieldLabelText="21. Exceptionally fussy, difficult to soothe?" IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="EDI22" runat="server" FieldLabelWidth="400px" FieldTextBoxWidth="30px" DatabaseField="EDI22"
											FieldTextBoxTabIndex="28" FieldLabelText="22. Exceptionally easy baby (content doing own thing)?"
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="EDI23" runat="server" FieldLabelWidth="400px" FieldTextBoxWidth="30px" DatabaseField="EDI23"
											FieldTextBoxTabIndex="29" FieldLabelText="23. Overly sensitive/lack of sensitivity to noise, tactile input?"
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="EDI24" runat="server" FieldLabelWidth="400px" FieldTextBoxWidth="30px" DatabaseField="EDI24"
											FieldTextBoxTabIndex="30" FieldLabelText="24. Sleeping problems?" IsDoubleEntryField="True" IsReadOnly="False"
											IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="EDI25" runat="server" FieldLabelWidth="400px" FieldTextBoxWidth="30px" DatabaseField="EDI25"
											FieldTextBoxTabIndex="31" FieldLabelText="25. Feeding problems? (sucking problems, choking, regurgitation, arching, anxiousness, refusal to feed)"
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="EDI26" runat="server" FieldLabelWidth="400px" FieldTextBoxWidth="30px" DatabaseField="EDI26"
											FieldTextBoxTabIndex="32" FieldLabelText="26. Oddities in muscle tone? (low tone/floppy, high tone, combination)"
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="EDI27" runat="server" FieldLabelWidth="400px" FieldTextBoxWidth="30px" DatabaseField="EDI27"
											FieldTextBoxTabIndex="33" FieldLabelText="27. Lack of smiling at people?" IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="EDI28" runat="server" FieldLabelWidth="400px" FieldTextBoxWidth="30px" DatabaseField="EDI28"
											FieldTextBoxTabIndex="34" FieldLabelText="28. Difficult to catch his/her eye?" IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="EDI29" runat="server" FieldLabelWidth="400px" FieldTextBoxWidth="30px" DatabaseField="EDI29"
											FieldTextBoxTabIndex="35" FieldLabelText="29. Lack of orienting to name?" IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="EDI30" runat="server" FieldLabelWidth="400px" FieldTextBoxWidth="30px" DatabaseField="EDI30"
											FieldTextBoxTabIndex="36" FieldLabelText="30. Failure to use vocalizations socially?" IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="EDI31" runat="server" FieldLabelWidth="400px" FieldTextBoxWidth="30px" DatabaseField="EDI31"
											FieldTextBoxTabIndex="37" FieldLabelText="31. Exceptionally long attention span for nonsocial things?"
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="EDI32" runat="server" FieldLabelWidth="400px" FieldTextBoxWidth="30px" DatabaseField="EDI32"
											FieldTextBoxTabIndex="38" FieldLabelText="32. Exceptionally long attention span for social things (i.e. watching people, social games)?"
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="EDI33" runat="server" FieldLabelWidth="400px" FieldTextBoxWidth="30px" DatabaseField="EDI33"
											FieldTextBoxTabIndex="40" FieldLabelText="33. Anything else that gave you concern? (write in)" IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="0,1,2,9" FieldTextBoxTextDefault="9"></def:datafieldcontrol><BR>
										<def:datafieldcontrol id="EDI33ot" runat="server" FieldTextBoxWidth="250px" DatabaseField="EDI33ot" FieldTextBoxTabIndex="40"
											FieldLabelText="EDI33ot" IsDoubleEntryField="False" IsReadOnly="False" IsEntryValueRequired="False"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD bgColor="#a1b5cf">10-12 months</TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="EDI31b" runat="server" FieldLabelWidth="400px" FieldTextBoxWidth="30px" DatabaseField="EDI31b"
											FieldTextBoxTabIndex="40" FieldLabelText="31. Overly sensitive/lack of sensitivity to noise, tactile input, other sensory input?"
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="EDI32b" runat="server" FieldLabelWidth="400px" FieldTextBoxWidth="30px" DatabaseField="EDI32b"
											FieldTextBoxTabIndex="40" FieldLabelText="32. Sleeping problems?" IsDoubleEntryField="True" IsReadOnly="False"
											IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="EDI33b" runat="server" FieldLabelWidth="400px" FieldTextBoxWidth="30px" DatabaseField="EDI33b"
											FieldTextBoxTabIndex="40" FieldLabelText="33. Oddities in muscle tone? (low tone/floppy, high tone, combination)"
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="EDI34" runat="server" FieldLabelWidth="400px" FieldTextBoxWidth="30px" DatabaseField="EDI34"
											FieldTextBoxTabIndex="41" FieldLabelText="34. Repetitive/stereotyped motor movements? (rocking, banging, standing on toes, etc.)"
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="EDI35" runat="server" FieldLabelWidth="400px" FieldTextBoxWidth="30px" DatabaseField="EDI35"
											FieldTextBoxTabIndex="42" FieldLabelText="35. Excessive mouthing? (frequent mouthing when not teething)"
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="EDI36" runat="server" FieldLabelWidth="400px" FieldTextBoxWidth="30px" DatabaseField="EDI36"
											FieldTextBoxTabIndex="43" FieldLabelText="36. Lack of smiling at people?" IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="EDI37" runat="server" FieldLabelWidth="400px" FieldTextBoxWidth="30px" DatabaseField="EDI37"
											FieldTextBoxTabIndex="44" FieldLabelText="37. Lack of orienting to name?" IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="EDI38" runat="server" FieldLabelWidth="400px" FieldTextBoxWidth="30px" DatabaseField="EDI38"
											FieldTextBoxTabIndex="45" FieldLabelText="38. Poor eye contact, difficult to catch his/her eye?" IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="EDI39" runat="server" FieldLabelWidth="400px" FieldTextBoxWidth="30px" DatabaseField="EDI39"
											FieldTextBoxTabIndex="46" FieldLabelText="39. Failure to follow point?" IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="EDI40" runat="server" FieldLabelWidth="400px" FieldTextBoxWidth="30px" DatabaseField="EDI40"
											FieldTextBoxTabIndex="47" FieldLabelText="40. Lack of babbling?" IsDoubleEntryField="True" IsReadOnly="False"
											IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="EDI41" runat="server" FieldLabelWidth="400px" FieldTextBoxWidth="30px" DatabaseField="EDI41"
											FieldTextBoxTabIndex="48" FieldLabelText="41. Failure to use vocalizations socially/lack of imitative babbling?"
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="EDI42" runat="server" FieldLabelWidth="400px" FieldTextBoxWidth="30px" DatabaseField="EDI42"
											FieldTextBoxTabIndex="50" FieldLabelText="42. Anything else that gave you concern? (write in)" IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="0,1,2,9" FieldTextBoxTextDefault="9"></def:datafieldcontrol><BR>
										<def:datafieldcontrol id="EDI42ot" runat="server" FieldTextBoxWidth="250px" DatabaseField="EDI42ot" FieldTextBoxTabIndex="50"
											FieldLabelText="EDI42ot" IsDoubleEntryField="False" IsReadOnly="False" IsEntryValueRequired="False"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD bgColor="#a1b5cf">13-15 months</TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="EDI43" runat="server" FieldLabelWidth="400px" FieldTextBoxWidth="30px" DatabaseField="EDI43"
											FieldTextBoxTabIndex="51" FieldLabelText="43. Overly sensitive/lack of sensitivity to noise, tactile input, other sensory input or other unusual sensory/visual response?"
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="EDI44" runat="server" FieldLabelWidth="400px" FieldTextBoxWidth="30px" DatabaseField="EDI44"
											FieldTextBoxTabIndex="52" FieldLabelText="44. Sleeping problems?" IsDoubleEntryField="True" IsReadOnly="False"
											IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="EDI45" runat="server" FieldLabelWidth="400px" FieldTextBoxWidth="30px" DatabaseField="EDI45"
											FieldTextBoxTabIndex="53" FieldLabelText="45. Oddities in muscle tone? (low tone/floppy, high tone, combination)"
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="EDI46" runat="server" FieldLabelWidth="400px" FieldTextBoxWidth="30px" DatabaseField="EDI46"
											FieldTextBoxTabIndex="54" FieldLabelText="46. Repetitive/stereotyped motor movements? (rocking, banging, standing on toes, etc.)"
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="EDI47" runat="server" FieldLabelWidth="400px" FieldTextBoxWidth="30px" DatabaseField="EDI47"
											FieldTextBoxTabIndex="55" FieldLabelText="47. Lack of orienting to name?" IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="EDI48" runat="server" FieldLabelWidth="400px" FieldTextBoxWidth="30px" DatabaseField="EDI48"
											FieldTextBoxTabIndex="56" FieldLabelText="48. Poor eye contact, difficult to catch his/her eye?" IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="EDI49" runat="server" FieldLabelWidth="400px" FieldTextBoxWidth="30px" DatabaseField="EDI49"
											FieldTextBoxTabIndex="57" FieldLabelText="49. Lack of interest in interactive baby games? (did not actively participate)"
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="EDI50" runat="server" FieldLabelWidth="400px" FieldTextBoxWidth="30px" DatabaseField="EDI50"
											FieldTextBoxTabIndex="58" FieldLabelText="50. Failure to initiate simple, ritualized social interaction?"
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="EDI51" runat="server" FieldLabelWidth="400px" FieldTextBoxWidth="30px" DatabaseField="EDI51"
											FieldTextBoxTabIndex="59" FieldLabelText="51. Failure to follow point?" IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="EDI52" runat="server" FieldLabelWidth="400px" FieldTextBoxWidth="30px" DatabaseField="EDI52"
											FieldTextBoxTabIndex="60" FieldLabelText="52. Failure to show objects?" IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="EDI53" runat="server" FieldLabelWidth="400px" FieldTextBoxWidth="30px" DatabaseField="EDI53"
											FieldTextBoxTabIndex="61" FieldLabelText="53. Lack of pointing to express interest?" IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="EDI54" runat="server" FieldLabelWidth="400px" FieldTextBoxWidth="30px" DatabaseField="EDI54"
											FieldTextBoxTabIndex="62" FieldLabelText="54. Failure to use words meaningfully?" IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="EDI55" runat="server" FieldLabelWidth="400px" FieldTextBoxWidth="30px" DatabaseField="EDI55"
											FieldTextBoxTabIndex="64" FieldLabelText="55. Anything else that gave you concern? (write in)" IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="0,1,2,9" FieldTextBoxTextDefault="9"></def:datafieldcontrol><BR>
										<def:datafieldcontrol id="EDI55ot" runat="server" FieldTextBoxWidth="250px" DatabaseField="EDI55ot" FieldTextBoxTabIndex="64"
											FieldLabelText="EDI55ot" IsDoubleEntryField="False" IsReadOnly="False" IsEntryValueRequired="False"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD bgColor="#a1b5cf">16-18 months</TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="EDI56" runat="server" FieldLabelWidth="400px" FieldTextBoxWidth="30px" DatabaseField="EDI56"
											FieldTextBoxTabIndex="65" FieldLabelText="56. Overly sensitive/lack of sensitivity to noise, tactile input, other sensory input or other unusual sensory/visual response?"
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="EDI57" runat="server" FieldLabelWidth="400px" FieldTextBoxWidth="30px" DatabaseField="EDI57"
											FieldTextBoxTabIndex="66" FieldLabelText="57. Repetitive/stereotyped motor movements? (rocking, banging, standing on toes, etc.)"
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="EDI58" runat="server" FieldLabelWidth="400px" FieldTextBoxWidth="30px" DatabaseField="EDI58"
											FieldTextBoxTabIndex="67" FieldLabelText="58. Lack of orienting to name?" IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="EDI59" runat="server" FieldLabelWidth="400px" FieldTextBoxWidth="30px" DatabaseField="EDI59"
											FieldTextBoxTabIndex="68" FieldLabelText="59. Poor eye contact, difficult to catch his/her eye?" IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="EDI60" runat="server" FieldLabelWidth="400px" FieldTextBoxWidth="30px" DatabaseField="EDI60"
											FieldTextBoxTabIndex="69" FieldLabelText="60. Failure to follow point?" IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="EDI61" runat="server" FieldLabelWidth="400px" FieldTextBoxWidth="30px" DatabaseField="EDI61"
											FieldTextBoxTabIndex="70" FieldLabelText="61. Lack of pointing to express interest?" IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="EDI62" runat="server" FieldLabelWidth="400px" FieldTextBoxWidth="30px" DatabaseField="EDI62"
											FieldTextBoxTabIndex="71" FieldLabelText="62. Failure to initiate simple, ritualized social interaction?"
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="EDI63" runat="server" FieldLabelWidth="400px" FieldTextBoxWidth="30px" DatabaseField="EDI63"
											FieldTextBoxTabIndex="72" FieldLabelText="63. Failure to increase vocabulary/language from previous timepoint?"
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="EDI64" runat="server" FieldLabelWidth="400px" FieldTextBoxWidth="30px" DatabaseField="EDI64"
											FieldTextBoxTabIndex="73" FieldLabelText="64. Failure to imitate actions on objects?" IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="EDI65" runat="server" FieldLabelWidth="400px" FieldTextBoxWidth="30px" DatabaseField="EDI65"
											FieldTextBoxTabIndex="74" FieldLabelText="65. Failure to use formal gestures (e.g. waving bye-bye, clapping at appropriate times)?"
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="EDI66" runat="server" FieldLabelWidth="400px" FieldTextBoxWidth="30px" DatabaseField="EDI66"
											FieldTextBoxTabIndex="75" FieldLabelText="66. Placed adult's hand on desired objects/moved adult's hand?"
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="EDI67" runat="server" FieldLabelWidth="400px" FieldTextBoxWidth="30px" DatabaseField="EDI67"
											FieldTextBoxTabIndex="77" FieldLabelText="67.  Anything else that gave you concern? (write in)" IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="0,1,2,9" FieldTextBoxTextDefault="9"></def:datafieldcontrol><BR>
										<def:datafieldcontrol id="EDI67ot" runat="server" FieldTextBoxWidth="250px" DatabaseField="EDI67ot" FieldTextBoxTabIndex="77"
											FieldLabelText="EDI67ot" IsDoubleEntryField="False" IsReadOnly="False" IsEntryValueRequired="False"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD bgColor="#a1b5cf">19-21 months</TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="EDI68" runat="server" FieldLabelWidth="400px" FieldTextBoxWidth="30px" DatabaseField="EDI68"
											FieldTextBoxTabIndex="78" FieldLabelText="68. Overly sensitive/lack of sensitivity to noise, tactile input, other sensory input or other unusual sensory/visual response?"
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="EDI69" runat="server" FieldLabelWidth="400px" FieldTextBoxWidth="30px" DatabaseField="EDI69"
											FieldTextBoxTabIndex="79" FieldLabelText="69. Repetitive/stereotyped motor movements? (rocking, banging, standing on toes, etc.)"
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="EDI70" runat="server" FieldLabelWidth="400px" FieldTextBoxWidth="30px" DatabaseField="EDI70"
											FieldTextBoxTabIndex="80" FieldLabelText="70. Lack of orienting to name?" IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="EDI71" runat="server" FieldLabelWidth="400px" FieldTextBoxWidth="30px" DatabaseField="EDI71"
											FieldTextBoxTabIndex="81" FieldLabelText="71. Poor eye contact, difficult to catch his/her eye?" IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="EDI72" runat="server" FieldLabelWidth="400px" FieldTextBoxWidth="30px" DatabaseField="EDI72"
											FieldTextBoxTabIndex="82" FieldLabelText="72. Failure to follow point/gaze?" IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="EDI73" runat="server" FieldLabelWidth="400px" FieldTextBoxWidth="30px" DatabaseField="EDI73"
											FieldTextBoxTabIndex="83" FieldLabelText="73. Lack of pointing to express interest?" IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="EDI74" runat="server" FieldLabelWidth="400px" FieldTextBoxWidth="30px" DatabaseField="EDI74"
											FieldTextBoxTabIndex="84" FieldLabelText="74. Failure to initiate simple, ritualized social interaction?"
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="EDI75" runat="server" FieldLabelWidth="400px" FieldTextBoxWidth="30px" DatabaseField="EDI75"
											FieldTextBoxTabIndex="85" FieldLabelText="75. Failure to increase vocabulary/language from previous timepoint?"
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="EDI76" runat="server" FieldLabelWidth="400px" FieldTextBoxWidth="30px" DatabaseField="EDI76"
											FieldTextBoxTabIndex="86" FieldLabelText="76.  Failure to use formal gestures? (e.g. waving bye-bye, clapping at appropriate times)."
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="EDI77" runat="server" FieldLabelWidth="400px" FieldTextBoxWidth="30px" DatabaseField="EDI77"
											FieldTextBoxTabIndex="87" FieldLabelText="77. Failure to imitate actions on objects?" IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="EDI78" runat="server" FieldLabelWidth="400px" FieldTextBoxWidth="30px" DatabaseField="EDI78"
											FieldTextBoxTabIndex="88" FieldLabelText="78. Placed adult's hand on desired objects/moved adult's hand?"
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="EDI79" runat="server" FieldLabelWidth="400px" FieldTextBoxWidth="30px" DatabaseField="EDI79"
											FieldTextBoxTabIndex="90" FieldLabelText="79. Anything else that gave you concern? (write in)" IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="0,1,2,9" FieldTextBoxTextDefault="9"></def:datafieldcontrol><BR>
										<def:datafieldcontrol id="EDI79ot" runat="server" FieldTextBoxWidth="250px" DatabaseField="EDI79ot" FieldTextBoxTabIndex="90"
											FieldLabelText="EDI79ot" IsDoubleEntryField="False" IsReadOnly="False" IsEntryValueRequired="False"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD bgColor="#a1b5cf">22-24 months</TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="EDI80" runat="server" FieldLabelWidth="400px" FieldTextBoxWidth="30px" DatabaseField="EDI80"
											FieldTextBoxTabIndex="91" FieldLabelText="80. Overly sensitive/lack of sensitivity to noise, tactile input, other sensory input or other unusual sensory/visual response?"
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="EDI81" runat="server" FieldLabelWidth="400px" FieldTextBoxWidth="30px" DatabaseField="EDI81"
											FieldTextBoxTabIndex="92" FieldLabelText="81. Repetitive/stereotyped motor movements? (rocking, banging, standing on toes, etc.)"
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="EDI82" runat="server" FieldLabelWidth="400px" FieldTextBoxWidth="30px" DatabaseField="EDI82"
											FieldTextBoxTabIndex="93" FieldLabelText="82. Lack of orienting name?" IsDoubleEntryField="True" IsReadOnly="False"
											IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="EDI83" runat="server" FieldLabelWidth="400px" FieldTextBoxWidth="30px" DatabaseField="EDI83"
											FieldTextBoxTabIndex="94" FieldLabelText="83. Poor eye contact, difficult to catch his/her eye?" IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="EDI84" runat="server" FieldLabelWidth="400px" FieldTextBoxWidth="30px" DatabaseField="EDI84"
											FieldTextBoxTabIndex="95" FieldLabelText="84. Failure to follow point?" IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="EDI85" runat="server" FieldLabelWidth="400px" FieldTextBoxWidth="30px" DatabaseField="EDI85"
											FieldTextBoxTabIndex="96" FieldLabelText="85. Lack of pointing to express interest?" IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="EDI86" runat="server" FieldLabelWidth="400px" FieldTextBoxWidth="30px" DatabaseField="EDI86"
											FieldTextBoxTabIndex="97" FieldLabelText="86. Failure to initiate simple, ritualized social interaction?"
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="EDI87" runat="server" FieldLabelWidth="400px" FieldTextBoxWidth="30px" DatabaseField="EDI87"
											FieldTextBoxTabIndex="98" FieldLabelText="87. Failure to use increase language/vocabulary from previous timepoint?"
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="EDI88" runat="server" FieldLabelWidth="400px" FieldTextBoxWidth="30px" DatabaseField="EDI88"
											FieldTextBoxTabIndex="99" FieldLabelText="88. Failure to combine words?" IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="EDI89" runat="server" FieldLabelWidth="400px" FieldTextBoxWidth="30px" DatabaseField="EDI89"
											FieldTextBoxTabIndex="100" FieldLabelText="89. Failure to use formal gestures? (e.g. waving bye-bye, clapping at appropriate times)."
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="EDI90" runat="server" FieldLabelWidth="400px" FieldTextBoxWidth="30px" DatabaseField="EDI90"
											FieldTextBoxTabIndex="101" FieldLabelText="90. Placed adult's hand on desired objects/moved adult's hand?"
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="EDI91" runat="server" FieldLabelWidth="400px" FieldTextBoxWidth="30px" DatabaseField="EDI91"
											FieldTextBoxTabIndex="102" FieldLabelText="91. Had routines/rituals?" IsDoubleEntryField="True" IsReadOnly="False"
											IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="EDI92" runat="server" FieldLabelWidth="400px" FieldTextBoxWidth="30px" DatabaseField="EDI92"
											FieldTextBoxTabIndex="103" FieldLabelText="92. Had unusual attachments to objects?" IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="EDI93" runat="server" FieldLabelWidth="400px" FieldTextBoxWidth="30px" DatabaseField="EDI93"
											FieldTextBoxTabIndex="105" FieldLabelText="93. Anything else that gave you concern? (write in)" IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="0,1,2,9" FieldTextBoxTextDefault="9"></def:datafieldcontrol><BR>
										<def:datafieldcontrol id="EDI93ot" runat="server" FieldTextBoxWidth="250px" DatabaseField="EDI93ot" FieldTextBoxTabIndex="105"
											FieldLabelText="EDI93ot" IsDoubleEntryField="False" IsReadOnly="False" IsEntryValueRequired="False"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>0 
      = no<BR>1 = possible/somewhat<BR>2 = definite 
      <TABLE class="grid">
								<TR>
									<TD bgColor="#a1b5cf">Family Changes</TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="EDIbir" runat="server" FieldLabelWidth="250px" FieldTextBoxWidth="30px" DatabaseField="EDIbir"
											FieldTextBoxTabIndex="106" FieldLabelText="Birth of sibling" IsDoubleEntryField="True" IsReadOnly="False"
											IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="EDIdea" runat="server" FieldLabelWidth="250px" FieldTextBoxWidth="30px" DatabaseField="EDIdea"
											FieldTextBoxTabIndex="107" FieldLabelText="Death of familiar family member" IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="EDIdiv" runat="server" FieldLabelWidth="250px" FieldTextBoxWidth="30px" DatabaseField="EDIdiv"
											FieldTextBoxTabIndex="108" FieldLabelText="Divorce of parents" IsDoubleEntryField="True" IsReadOnly="False"
											IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="EDImar" runat="server" FieldLabelWidth="250px" FieldTextBoxWidth="30px" DatabaseField="EDImar"
											FieldTextBoxTabIndex="109" FieldLabelText="Marriage of a parent" IsDoubleEntryField="True" IsReadOnly="False"
											IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="EDImov" runat="server" FieldLabelWidth="250px" FieldTextBoxWidth="30px" DatabaseField="EDImov"
											FieldTextBoxTabIndex="110" FieldLabelText="Move to a new home" IsDoubleEntryField="True" IsReadOnly="False"
											IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="EDItem" runat="server" FieldLabelWidth="250px" FieldTextBoxWidth="30px" DatabaseField="EDItem"
											FieldTextBoxTabIndex="111" FieldLabelText="Temporary absence of a family member" IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="EDIper" runat="server" FieldLabelWidth="250px" FieldTextBoxWidth="30px" DatabaseField="EDIper"
											FieldTextBoxTabIndex="112" FieldLabelText="Permanent absence of a family member" IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="EDIchc" runat="server" FieldLabelWidth="250px" FieldTextBoxWidth="30px" DatabaseField="EDIchc"
											FieldTextBoxTabIndex="113" FieldLabelText="Changes in caretakers" IsDoubleEntryField="True" IsReadOnly="False"
											IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="EDIchs" runat="server" FieldLabelWidth="250px" FieldTextBoxWidth="30px" DatabaseField="EDIchs"
											FieldTextBoxTabIndex="114" FieldLabelText="Changes in schedule/work" IsDoubleEntryField="True" IsReadOnly="False"
											IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD bgColor="#a1b5cf">Child Medical Events</TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="EDIsei" runat="server" FieldLabelWidth="250px" FieldTextBoxWidth="30px" DatabaseField="EDIsei"
											FieldTextBoxTabIndex="115" FieldLabelText="Seizure" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="EDIhea" runat="server" FieldLabelWidth="250px" FieldTextBoxWidth="30px" DatabaseField="EDIhea"
											FieldTextBoxTabIndex="116" FieldLabelText="Head injury" IsDoubleEntryField="True" IsReadOnly="False"
											IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="EDIothi" runat="server" FieldLabelWidth="250px" FieldTextBoxWidth="30px" DatabaseField="EDIothi"
											FieldTextBoxTabIndex="117" FieldLabelText="Other injuries and minor physical traumas" IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="EDIhifv" runat="server" FieldLabelWidth="250px" FieldTextBoxWidth="30px" DatabaseField="EDIhifv"
											FieldTextBoxTabIndex="118" FieldLabelText="High fever" IsDoubleEntryField="True" IsReadOnly="False"
											IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="EDIhosp" runat="server" FieldLabelWidth="250px" FieldTextBoxWidth="30px" DatabaseField="EDIhosp"
											FieldTextBoxTabIndex="119" FieldLabelText="Hospitalization" IsDoubleEntryField="True" IsReadOnly="False"
											IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="EDImill" runat="server" FieldLabelWidth="250px" FieldTextBoxWidth="30px" DatabaseField="EDImill"
											FieldTextBoxTabIndex="120" FieldLabelText="Minor illness" IsDoubleEntryField="True" IsReadOnly="False"
											IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
      <TABLE class="grid">
								<TR>
									<TD bgColor="#a1b5cf">Stressful Event</TD>
									<TD bgColor="#a1b5cf">Enter a 1 for each trimester of pregnancy<br>during which the event occurred.  Enter a 0 if the event did not occur.<br>
									  (1=Occurred within, 0=Did not occur, 9=Missing)<br>En
									</TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="EDIinj" runat="server" FieldLabelWidth="250px" FieldTextBoxWidth="30px" DatabaseField="EDIinj"
											FieldTextBoxTabIndex="121" FieldLabelText="Injury/illness to relatives or friends" IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
									<TD></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="EDIdear" runat="server" FieldLabelWidth="250px" FieldTextBoxWidth="30px" DatabaseField="EDIdear"
											FieldTextBoxTabIndex="122" FieldLabelText="Death of relative/friend" IsDoubleEntryField="True" IsReadOnly="False"
											IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
									<TD></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="EDIconf" runat="server" FieldLabelWidth="250px" FieldTextBoxWidth="30px" DatabaseField="EDIconf"
											FieldTextBoxTabIndex="123" FieldLabelText="Conflict in relationship with spouse/partner" IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
									<TD></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="EDIlegl" runat="server" FieldLabelWidth="250px" FieldTextBoxWidth="30px" DatabaseField="EDIlegl"
											FieldTextBoxTabIndex="124" FieldLabelText="Legal matters for self or partner" IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
									<TD></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="EDIemp" runat="server" FieldLabelWidth="250px" FieldTextBoxWidth="30px" DatabaseField="EDIemp"
											FieldTextBoxTabIndex="125" FieldLabelText="Employment/financial problems for self or partner" IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
									<TD></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="EDIcrim" runat="server" FieldLabelWidth="250px" FieldTextBoxWidth="30px" DatabaseField="EDIcrim"
											FieldTextBoxTabIndex="126" FieldLabelText="Criminal matters for self, partner, or family" IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
									<TD></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="EDICMNT" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="200px" DatabaseField="EDICMNT"
											FieldTextBoxTabIndex="127" FieldLabelText="Comments" IsDoubleEntryField="False" IsReadOnly="False"
											IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="TEXT" FieldTextBoxTextMode="MultiLine" FieldTextBoxMaxLength="255" FieldTextBoxHeight="150px"></def:datafieldcontrol></TD>
									<TD></TD>
								</TR>
							</TABLE><BR>
      <TABLE class="layout" id="table_readonly">
								<TR>
									<TD>
										<def:datafieldcontrol id="created" runat="server" FieldLabelWidth="80px" DatabaseField="created" FieldTextBoxTabIndex="129"
											FieldLabelText="created" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="DATE" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="createdBy" runat="server" FieldLabelWidth="80px" DatabaseField="createdBy" FieldTextBoxTabIndex="130"
											FieldLabelText="createdBy" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="updated" runat="server" FieldLabelWidth="80px" DatabaseField="updated" FieldTextBoxTabIndex="131"
											FieldLabelText="updated" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="DATE" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="updatedBy" runat="server" FieldLabelWidth="80px" DatabaseField="updatedBy" FieldTextBoxTabIndex="132"
											FieldLabelText="updatedBy" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
						</asp:Panel>
					</asp:Content>
