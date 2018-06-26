<%@ Page language="c#" Inherits="edst3_abc.edst3_abc" CodeFile="edst3_abc.aspx.cs"  MasterPageFile="~/UWAC.master" %>

<%@ Register TagPrefix="def" Namespace="DataEntryFramework.Old" %>
<asp:Content ID="Content1" ContentPlaceHolderID="oBodyPlaceHolder" runat="server">
						<def:dataentrycontroller id="DataEntryController1" runat="server" DatabaseTable="edst3_abc" LookupField1="edsid"
							LookupTextBox1LabelText="EDS ID:" LookupTextBox2Visible="False" MeasureName="EDST3 ABC" PrimaryKeyField="abc_pk"
							VerifiedField="verified" StudyMeasID="208"></def:dataentrycontroller>
						<table id="table_insert" class="layout">
							<tr>
								<td><def:datafieldcontrol id="EDSID" runat="server" FieldDataType="INT" IsInsertField="True" IsInsertValueRequired="True"
										IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="EDSID"
										FieldTextBoxTabIndex="1" DatabaseField="EDSID" FieldLabelWidth="80px" FieldTextBoxWidth="80px"></def:datafieldcontrol>
								</td>
							</tr>
							<tr>
								<td>
									<def:datafieldcontrol id="ABC1DATE" runat="server" DatabaseField="ABC1DATE" FieldTextBoxTabIndex="2" FieldLabelText="ABC DATE"
										IsDoubleEntryField="False" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
										IsInsertField="False" FieldDataType="DATE" MinVal="1/1/2002" FormatString="{0:d}" FieldLabelWidth="80px"
										FieldTextBoxWidth="80px"></def:datafieldcontrol>
								</td>
							</tr>
						</table>
						<br>
						<asp:Panel Runat="server" ID="mainPanel">
							<TABLE class="layout" id="table_entry">
								<TR>
									<TD colSpan="2">0-not at all a problem<BR>
										1-slight in degree<BR>
										2-moderately serious<BR>
										3-severe in degree<BR>
										9-Missing/Blank<BR>
									</TD>
								</TR>
								<TR>
									<TD width="288">
										<def:datafieldcontrol id="ABC101" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="200px" DatabaseField="ABC101"
											FieldTextBoxTabIndex="4" FieldLabelText="1. Excessively active at home, school, work, or elsewhere"
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,3,9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="ABC130" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="200px" DatabaseField="ABC130"
											FieldTextBoxTabIndex="33" FieldLabelText="30. Isolates himself/herself from other children or adults"
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,3,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD width="288">
										<def:datafieldcontrol id="ABC102" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="200px" DatabaseField="ABC102"
											FieldTextBoxTabIndex="5" FieldLabelText="2. Injures self on purpose" IsDoubleEntryField="True" IsReadOnly="False"
											IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="0,1,2,3,9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="ABC131" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="200px" DatabaseField="ABC131"
											FieldTextBoxTabIndex="34" FieldLabelText="31. Disrupts group activities" IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="0,1,2,3,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD width="288">
										<def:datafieldcontrol id="ABC103" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="200px" DatabaseField="ABC103"
											FieldTextBoxTabIndex="6" FieldLabelText="3. Listless, sluggish, inactive" IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="0,1,2,3,9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="ABC132" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="200px" DatabaseField="ABC132"
											FieldTextBoxTabIndex="35" FieldLabelText="32. Sits or stands in one position for a long time" IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="0,1,2,3,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD width="288">
										<def:datafieldcontrol id="ABC104" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="200px" DatabaseField="ABC104"
											FieldTextBoxTabIndex="7" FieldLabelText="4. Aggressive to other children or adults (verbally or physicall"
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,3,9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="ABC133" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="200px" DatabaseField="ABC133"
											FieldTextBoxTabIndex="36" FieldLabelText="33. Talk to self loudly" IsDoubleEntryField="True" IsReadOnly="False"
											IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="0,1,2,3,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD width="288">
										<def:datafieldcontrol id="ABC105" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="200px" DatabaseField="ABC105"
											FieldTextBoxTabIndex="8" FieldLabelText="5. Seeks isolation from others" IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="0,1,2,3,9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="ABC134" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="200px" DatabaseField="ABC134"
											FieldTextBoxTabIndex="37" FieldLabelText="34. Cries over minor annoyances and hurts" IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="0,1,2,3,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD width="288">
										<def:datafieldcontrol id="ABC106" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="200px" DatabaseField="ABC106"
											FieldTextBoxTabIndex="9" FieldLabelText="6. Meaningless, recurring body movements" IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="0,1,2,3,9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="ABC135" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="200px" DatabaseField="ABC135"
											FieldTextBoxTabIndex="38" FieldLabelText="35. Repetitive hand, body, or head movements" IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="0,1,2,3,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD width="288">
										<def:datafieldcontrol id="ABC107" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="200px" DatabaseField="ABC107"
											FieldTextBoxTabIndex="10" FieldLabelText="7. Boisterous (inappropriately noisy and rough)" IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="0,1,2,3,9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="ABC136" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="200px" DatabaseField="ABC136"
											FieldTextBoxTabIndex="39" FieldLabelText="36. Mood changes quickly" IsDoubleEntryField="True" IsReadOnly="False"
											IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="0,1,2,3,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD width="288">
										<def:datafieldcontrol id="ABC108" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="200px" DatabaseField="ABC108"
											FieldTextBoxTabIndex="11" FieldLabelText="8. Screams inappropriately" IsDoubleEntryField="True" IsReadOnly="False"
											IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="0,1,2,3,9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="ABC137" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="200px" DatabaseField="ABC137"
											FieldTextBoxTabIndex="40" FieldLabelText="37. Unresponsive to structured activities (does not react)"
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,3,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD width="288">
										<def:datafieldcontrol id="ABC109" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="200px" DatabaseField="ABC109"
											FieldTextBoxTabIndex="12" FieldLabelText="9. Talks excessively" IsDoubleEntryField="True" IsReadOnly="False"
											IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="0,1,2,3,9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="ABC138" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="200px" DatabaseField="ABC138"
											FieldTextBoxTabIndex="41" FieldLabelText="38. Does not stay in seat (during lesson, training session, meal"
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,3,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD width="288">
										<def:datafieldcontrol id="ABC110" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="200px" DatabaseField="ABC110"
											FieldTextBoxTabIndex="13" FieldLabelText="10. Temper tantrums/outbursts" IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="0,1,2,3,9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="ABC139" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="200px" DatabaseField="ABC139"
											FieldTextBoxTabIndex="42" FieldLabelText="39. Will not sit still for any length of time" IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="0,1,2,3,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD width="288">
										<def:datafieldcontrol id="ABC111" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="200px" DatabaseField="ABC111"
											FieldTextBoxTabIndex="14" FieldLabelText="11. Stereotyped behavior; abnormal, repetitive movements"
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,3,9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="ABC140" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="200px" DatabaseField="ABC140"
											FieldTextBoxTabIndex="43" FieldLabelText="40. Is difficult to reach, contact, or get through to" IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="0,1,2,3,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD width="288">
										<def:datafieldcontrol id="ABC112" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="200px" DatabaseField="ABC112"
											FieldTextBoxTabIndex="15" FieldLabelText="12. Preoccupied, stares into space" IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="0,1,2,3,9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="ABC141" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="200px" DatabaseField="ABC141"
											FieldTextBoxTabIndex="44" FieldLabelText="41. Cries and screams inappropriately" IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="0,1,2,3,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD width="288">
										<def:datafieldcontrol id="ABC113" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="200px" DatabaseField="ABC113"
											FieldTextBoxTabIndex="16" FieldLabelText="13. Impulsive (acts without thinking)" IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="0,1,2,3,9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="ABC142" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="200px" DatabaseField="ABC142"
											FieldTextBoxTabIndex="45" FieldLabelText="42. Prefers to be alone" IsDoubleEntryField="True" IsReadOnly="False"
											IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="0,1,2,3,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD width="288">
										<def:datafieldcontrol id="ABC114" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="200px" DatabaseField="ABC114"
											FieldTextBoxTabIndex="17" FieldLabelText="14. Irritable and whiny" IsDoubleEntryField="True" IsReadOnly="False"
											IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="0,1,2,3,9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="ABC143" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="200px" DatabaseField="ABC143"
											FieldTextBoxTabIndex="46" FieldLabelText="43. Does not try to communicate by words or gestures" IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="0,1,2,3,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD width="288">
										<def:datafieldcontrol id="ABC115" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="200px" DatabaseField="ABC115"
											FieldTextBoxTabIndex="18" FieldLabelText="15. Restless, unable to sit still" IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="0,1,2,3,9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="ABC144" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="200px" DatabaseField="ABC144"
											FieldTextBoxTabIndex="47" FieldLabelText="44. Easily distractible" IsDoubleEntryField="True" IsReadOnly="False"
											IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="0,1,2,3,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD width="288">
										<def:datafieldcontrol id="ABC116" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="200px" DatabaseField="ABC116"
											FieldTextBoxTabIndex="19" FieldLabelText="16. Withdrawn; prefers solitary activities" IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="0,1,2,3,9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="ABC145" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="200px" DatabaseField="ABC145"
											FieldTextBoxTabIndex="48" FieldLabelText="45. Waves or shakes the extremities repeatedly" IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="0,1,2,3,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD width="288">
										<def:datafieldcontrol id="ABC117" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="200px" DatabaseField="ABC117"
											FieldTextBoxTabIndex="20" FieldLabelText="17. Odd, bizarre in behavior" IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="0,1,2,3,9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="ABC146" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="200px" DatabaseField="ABC146"
											FieldTextBoxTabIndex="49" FieldLabelText="46. Repeats a word or phrase over and over" IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="0,1,2,3,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD width="288">
										<def:datafieldcontrol id="ABC118" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="200px" DatabaseField="ABC118"
											FieldTextBoxTabIndex="21" FieldLabelText="18. Disobedient, difficult to control" IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="0,1,2,3,9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="ABC147" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="200px" DatabaseField="ABC147"
											FieldTextBoxTabIndex="50" FieldLabelText="47. Stamps feet or bangs objects or slams doors" IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="0,1,2,3,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD width="288">
										<def:datafieldcontrol id="ABC119" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="200px" DatabaseField="ABC119"
											FieldTextBoxTabIndex="22" FieldLabelText="19. Yells at inappropriate times" IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="0,1,2,3,9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="ABC148" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="200px" DatabaseField="ABC148"
											FieldTextBoxTabIndex="51" FieldLabelText="48. Constantly runs or jumps around the room" IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="0,1,2,3,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD width="288">
										<def:datafieldcontrol id="ABC120" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="200px" DatabaseField="ABC120"
											FieldTextBoxTabIndex="23" FieldLabelText="20. Fixed facial expression; lacks emotional responsiveness"
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,3,9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="ABC149" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="200px" DatabaseField="ABC149"
											FieldTextBoxTabIndex="52" FieldLabelText="49. Rocks body back and forth repeatedly" IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="0,1,2,3,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD width="288">
										<def:datafieldcontrol id="ABC121" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="200px" DatabaseField="ABC121"
											FieldTextBoxTabIndex="24" FieldLabelText="21. Disturbs others" IsDoubleEntryField="True" IsReadOnly="False"
											IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="0,1,2,3,9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="ABC150" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="200px" DatabaseField="ABC150"
											FieldTextBoxTabIndex="53" FieldLabelText="50. Deliberately hurts himself/herself" IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="0,1,2,3,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD width="288">
										<def:datafieldcontrol id="ABC122" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="200px" DatabaseField="ABC122"
											FieldTextBoxTabIndex="25" FieldLabelText="22. Repetitive speech" IsDoubleEntryField="True" IsReadOnly="False"
											IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="0,1,2,3,9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="ABC151" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="200px" DatabaseField="ABC151"
											FieldTextBoxTabIndex="54" FieldLabelText="51. Pays no attention when spoken to" IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="0,1,2,3,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD width="288">
										<def:datafieldcontrol id="ABC123" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="200px" DatabaseField="ABC123"
											FieldTextBoxTabIndex="26" FieldLabelText="23. Does nothing but sit and watch others" IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="0,1,2,3,9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="ABC152" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="200px" DatabaseField="ABC152"
											FieldTextBoxTabIndex="55" FieldLabelText="52. Does physical violence to self" IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="0,1,2,3,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD width="288">
										<def:datafieldcontrol id="ABC124" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="200px" DatabaseField="ABC124"
											FieldTextBoxTabIndex="27" FieldLabelText="24. Uncooperative" IsDoubleEntryField="True" IsReadOnly="False"
											IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="0,1,2,3,9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="ABC153" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="200px" DatabaseField="ABC153"
											FieldTextBoxTabIndex="56" FieldLabelText="53. Inactive, never moves spontaneously" IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="0,1,2,3,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD width="288">
										<def:datafieldcontrol id="ABC125" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="200px" DatabaseField="ABC125"
											FieldTextBoxTabIndex="28" FieldLabelText="25. Depressed mood" IsDoubleEntryField="True" IsReadOnly="False"
											IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="0,1,2,3,9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="ABC154" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="200px" DatabaseField="ABC154"
											FieldTextBoxTabIndex="57" FieldLabelText="54. Tends to be excessively active" IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="0,1,2,3,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD width="288">
										<def:datafieldcontrol id="ABC126" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="200px" DatabaseField="ABC126"
											FieldTextBoxTabIndex="29" FieldLabelText="26. Resists any form of physical contact" IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="0,1,2,3,9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="ABC155" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="200px" DatabaseField="ABC155"
											FieldTextBoxTabIndex="58" FieldLabelText="55. Responds negatively to affection" IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="0,1,2,3,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD width="288">
										<def:datafieldcontrol id="ABC127" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="200px" DatabaseField="ABC127"
											FieldTextBoxTabIndex="30" FieldLabelText="27. Moves or rolls head back and forth repetitively" IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="0,1,2,3,9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="ABC156" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="200px" DatabaseField="ABC156"
											FieldTextBoxTabIndex="59" FieldLabelText="56. Deliberately ignores directions" IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="0,1,2,3,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD width="288">
										<def:datafieldcontrol id="ABC128" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="200px" DatabaseField="ABC128"
											FieldTextBoxTabIndex="31" FieldLabelText="28. Does not pay attention to instructions" IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="0,1,2,3,9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="ABC157" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="200px" DatabaseField="ABC157"
											FieldTextBoxTabIndex="60" FieldLabelText="57. Has temper outbursts or tantrums when does not get own way"
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,3,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD width="288">
										<def:datafieldcontrol id="ABC129" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="200px" DatabaseField="ABC129"
											FieldTextBoxTabIndex="32" FieldLabelText="29. Demands must be met immediately" IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="0,1,2,3,9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="ABC158" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="200px" DatabaseField="ABC158"
											FieldTextBoxTabIndex="61" FieldLabelText="58. Shows few social reactions to others" IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="0,1,2,3,9"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
							<BR>
							<TABLE class="layout" id="table_readonly">
								<TR>
									<TD>
										<def:datafieldcontrol id="created" runat="server" FieldLabelWidth="80px" DatabaseField="created" FieldTextBoxTabIndex="63"
											FieldLabelText="created" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="DATE" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="createdBy" runat="server" FieldLabelWidth="80px" DatabaseField="createdBy" FieldTextBoxTabIndex="64"
											FieldLabelText="createdBy" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="updated" runat="server" FieldLabelWidth="80px" DatabaseField="updated" FieldTextBoxTabIndex="65"
											FieldLabelText="updated" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="DATE" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="updatedBy" runat="server" FieldLabelWidth="80px" DatabaseField="updatedBy" FieldTextBoxTabIndex="66"
											FieldLabelText="updatedBy" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
						</asp:Panel>
					</asp:Content>
