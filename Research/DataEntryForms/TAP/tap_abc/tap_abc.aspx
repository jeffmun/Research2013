<%@ Register TagPrefix="def" Namespace="DataEntryFramework.Old" %>

<%@ Page language="c#" Inherits="tap_abc.tap_abc" CodeFile="tap_abc.aspx.cs"  MasterPageFile="~/UWAC.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="oBodyPlaceHolder" runat="server">
						<def:dataentrycontroller id="DataEntryController1" runat="server" DatabaseTable="tap_abc" LookupField1="tapid"
							LookupTextBox2Visible="False" LookupTextBox1LabelText="TAP ID:" MeasureName="TAP ABC" PrimaryKeyField="abc_pk"
							VerifiedField="verified" LookupField1DataType="TEXT" StudyMeasID="342"></def:dataentrycontroller>
						<table class="layout">
							<tr>
								<td><def:datafieldcontrol id="EDSID" runat="server" FieldDataType="TEXT" IsInsertField="True" IsInsertValueRequired="True"
										IsEntryField="False" IsEntryValueRequired="false" IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="TAP ID"
										FieldTextBoxTabIndex="1" DatabaseField="tapid" RegEx="^[T][A][P][0-9][0-9][0-9]$" RegExDescription="TAP ID must look like TAP###"
										FieldLabelWidth="100px" FieldTextBoxWidth="80px"></def:datafieldcontrol></td>
							</tr>
						</table>
						<div><br>
							0-not at all a problem<br>
							1-slight in degree<br>
							2-moderately serious<br>
							3-severe in degree<br>
							9-Missing/Blank<br>
							<br>
						</div>
						<table id="table_entry" class="layout">
							<tr>
								<td width="219">
									<def:datafieldcontrol id="ABC101" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
										IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="1. Excessively active at home, school, work, or elsewhere"
										FieldTextBoxTabIndex="4" DatabaseField="ABC101" ValidList="0,1,2,3,9" FieldLabelWidth="150px" FieldTextBoxWidth="30px"
										FieldTextBoxTextMode="SingleLine"></def:datafieldcontrol>
								</td>
								<td>
									<def:datafieldcontrol id="ABC130" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
										IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="30. Isolates himself/herself from other children or adults"
										FieldTextBoxTabIndex="33" DatabaseField="ABC130" ValidList="0,1,2,3,9" FieldLabelWidth="150px" FieldTextBoxWidth="30px"
										FieldTextBoxTextMode="SingleLine"></def:datafieldcontrol>
								</td>
							</tr>
							<tr>
								<td width="219">
									<def:datafieldcontrol id="ABC102" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
										IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="2. Injures self on purpose"
										FieldTextBoxTabIndex="5" DatabaseField="ABC102" ValidList="0,1,2,3,9" FieldLabelWidth="150px" FieldTextBoxWidth="30px"
										FieldTextBoxTextMode="SingleLine"></def:datafieldcontrol>
								</td>
								<td>
									<def:datafieldcontrol id="ABC131" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
										IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="31. Disrupts group activities"
										FieldTextBoxTabIndex="34" DatabaseField="ABC131" ValidList="0,1,2,3,9" FieldLabelWidth="150px" FieldTextBoxWidth="30px"
										FieldTextBoxTextMode="SingleLine"></def:datafieldcontrol>
								</td>
							</tr>
							<tr>
								<td width="219">
									<def:datafieldcontrol id="ABC103" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
										IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="3. Listless, sluggish, inactive"
										FieldTextBoxTabIndex="6" DatabaseField="ABC103" ValidList="0,1,2,3,9" FieldLabelWidth="150px" FieldTextBoxWidth="30px"
										FieldTextBoxTextMode="SingleLine"></def:datafieldcontrol>
								</td>
								<td>
									<def:datafieldcontrol id="ABC132" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
										IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="32. Sits or stands in one position for a long time"
										FieldTextBoxTabIndex="35" DatabaseField="ABC132" ValidList="0,1,2,3,9" FieldLabelWidth="150px" FieldTextBoxWidth="30px"
										FieldTextBoxTextMode="SingleLine"></def:datafieldcontrol>
								</td>
							</tr>
							<tr>
								<td width="219">
									<def:datafieldcontrol id="ABC104" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
										IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="4. Aggressive to other children or adults (verbally or physicall"
										FieldTextBoxTabIndex="7" DatabaseField="ABC104" ValidList="0,1,2,3,9" FieldLabelWidth="150px" FieldTextBoxWidth="30px"
										FieldTextBoxTextMode="SingleLine"></def:datafieldcontrol>
								</td>
								<td>
									<def:datafieldcontrol id="ABC133" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
										IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="33. Talk to self loudly"
										FieldTextBoxTabIndex="36" DatabaseField="ABC133" ValidList="0,1,2,3,9" FieldLabelWidth="150px" FieldTextBoxWidth="30px"
										FieldTextBoxTextMode="SingleLine"></def:datafieldcontrol>
								</td>
							</tr>
							<tr>
								<td width="219">
									<def:datafieldcontrol id="ABC105" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
										IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="5. Seeks isolation from others"
										FieldTextBoxTabIndex="8" DatabaseField="ABC105" ValidList="0,1,2,3,9" FieldLabelWidth="150px" FieldTextBoxWidth="30px"
										FieldTextBoxTextMode="SingleLine"></def:datafieldcontrol>
								</td>
								<td>
									<def:datafieldcontrol id="ABC134" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
										IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="34. Cries over minor annoyances and hurts"
										FieldTextBoxTabIndex="37" DatabaseField="ABC134" ValidList="0,1,2,3,9" FieldLabelWidth="150px" FieldTextBoxWidth="30px"
										FieldTextBoxTextMode="SingleLine"></def:datafieldcontrol>
								</td>
							</tr>
							<tr>
								<td width="219">
									<def:datafieldcontrol id="ABC106" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
										IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="6. Meaningless, recurring body movements"
										FieldTextBoxTabIndex="9" DatabaseField="ABC106" ValidList="0,1,2,3,9" FieldLabelWidth="150px" FieldTextBoxWidth="30px"
										FieldTextBoxTextMode="SingleLine"></def:datafieldcontrol>
								</td>
								<td>
									<def:datafieldcontrol id="ABC135" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
										IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="35. Repetitive hand, body, or head movements"
										FieldTextBoxTabIndex="38" DatabaseField="ABC135" ValidList="0,1,2,3,9" FieldLabelWidth="150px" FieldTextBoxWidth="30px"
										FieldTextBoxTextMode="SingleLine"></def:datafieldcontrol>
								</td>
							</tr>
							<tr>
								<td width="219">
									<def:datafieldcontrol id="ABC107" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
										IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="7. Boisterous (inappropriately noisy and rough)"
										FieldTextBoxTabIndex="10" DatabaseField="ABC107" ValidList="0,1,2,3,9" FieldLabelWidth="150px" FieldTextBoxWidth="30px"
										FieldTextBoxTextMode="SingleLine"></def:datafieldcontrol>
								</td>
								<td>
									<def:datafieldcontrol id="ABC136" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
										IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="36. Mood changes quickly"
										FieldTextBoxTabIndex="39" DatabaseField="ABC136" ValidList="0,1,2,3,9" FieldLabelWidth="150px" FieldTextBoxWidth="30px"
										FieldTextBoxTextMode="SingleLine"></def:datafieldcontrol>
								</td>
							</tr>
							<tr>
								<td width="219">
									<def:datafieldcontrol id="ABC108" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
										IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="8. Screams inappropriately"
										FieldTextBoxTabIndex="11" DatabaseField="ABC108" ValidList="0,1,2,3,9" FieldLabelWidth="150px" FieldTextBoxWidth="30px"
										FieldTextBoxTextMode="SingleLine"></def:datafieldcontrol>
								</td>
								<td>
									<def:datafieldcontrol id="ABC137" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
										IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="37. Unresponsive to structured activities (does not react)"
										FieldTextBoxTabIndex="40" DatabaseField="ABC137" ValidList="0,1,2,3,9" FieldLabelWidth="150px" FieldTextBoxWidth="30px"
										FieldTextBoxTextMode="SingleLine"></def:datafieldcontrol>
								</td>
							</tr>
							<tr>
								<td width="219">
									<def:datafieldcontrol id="ABC109" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
										IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="9. Talks excessively"
										FieldTextBoxTabIndex="12" DatabaseField="ABC109" ValidList="0,1,2,3,9" FieldLabelWidth="150px" FieldTextBoxWidth="30px"
										FieldTextBoxTextMode="SingleLine"></def:datafieldcontrol>
								</td>
								<td>
									<def:datafieldcontrol id="ABC138" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
										IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="38. Does not stay in seat (during lesson, training session, meal"
										FieldTextBoxTabIndex="41" DatabaseField="ABC138" ValidList="0,1,2,3,9" FieldLabelWidth="150px" FieldTextBoxWidth="30px"
										FieldTextBoxTextMode="SingleLine"></def:datafieldcontrol>
								</td>
							</tr>
							<tr>
								<td width="219">
									<def:datafieldcontrol id="ABC110" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
										IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="10. Temper tantrums/outbursts"
										FieldTextBoxTabIndex="13" DatabaseField="ABC110" ValidList="0,1,2,3,9" FieldLabelWidth="150px" FieldTextBoxWidth="30px"
										FieldTextBoxTextMode="SingleLine"></def:datafieldcontrol>
								</td>
								<td>
									<def:datafieldcontrol id="ABC139" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
										IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="39. Will not sit still for any length of time"
										FieldTextBoxTabIndex="42" DatabaseField="ABC139" ValidList="0,1,2,3,9" FieldLabelWidth="150px" FieldTextBoxWidth="30px"
										FieldTextBoxTextMode="SingleLine"></def:datafieldcontrol>
								</td>
							</tr>
							<tr>
								<td width="219">
									<def:datafieldcontrol id="ABC111" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
										IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="11. Stereotyped behavior; abnormal, repetitive movements"
										FieldTextBoxTabIndex="14" DatabaseField="ABC111" ValidList="0,1,2,3,9" FieldLabelWidth="150px" FieldTextBoxWidth="30px"
										FieldTextBoxTextMode="SingleLine"></def:datafieldcontrol>
								</td>
								<td>
									<def:datafieldcontrol id="ABC140" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
										IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="40. Is difficult to reach, contact, or get through to"
										FieldTextBoxTabIndex="43" DatabaseField="ABC140" ValidList="0,1,2,3,9" FieldLabelWidth="150px" FieldTextBoxWidth="30px"
										FieldTextBoxTextMode="SingleLine"></def:datafieldcontrol>
								</td>
							</tr>
							<tr>
								<td width="219">
									<def:datafieldcontrol id="ABC112" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
										IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="12. Preoccupied, stares into space"
										FieldTextBoxTabIndex="15" DatabaseField="ABC112" ValidList="0,1,2,3,9" FieldLabelWidth="150px" FieldTextBoxWidth="30px"
										FieldTextBoxTextMode="SingleLine"></def:datafieldcontrol>
								</td>
								<td>
									<def:datafieldcontrol id="ABC141" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
										IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="41. Cries and screams inappropriately"
										FieldTextBoxTabIndex="44" DatabaseField="ABC141" ValidList="0,1,2,3,9" FieldLabelWidth="150px" FieldTextBoxWidth="30px"
										FieldTextBoxTextMode="SingleLine"></def:datafieldcontrol>
								</td>
							</tr>
							<tr>
								<td width="219">
									<def:datafieldcontrol id="ABC113" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
										IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="13. Impulsive (acts without thinking)"
										FieldTextBoxTabIndex="16" DatabaseField="ABC113" ValidList="0,1,2,3,9" FieldLabelWidth="150px" FieldTextBoxWidth="30px"
										FieldTextBoxTextMode="SingleLine"></def:datafieldcontrol>
								</td>
								<td>
									<def:datafieldcontrol id="ABC142" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
										IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="42. Prefers to be alone"
										FieldTextBoxTabIndex="45" DatabaseField="ABC142" ValidList="0,1,2,3,9" FieldLabelWidth="150px" FieldTextBoxWidth="30px"
										FieldTextBoxTextMode="SingleLine"></def:datafieldcontrol>
								</td>
							</tr>
							<tr>
								<td width="219">
									<def:datafieldcontrol id="ABC114" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
										IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="14. Irritable and whiny"
										FieldTextBoxTabIndex="17" DatabaseField="ABC114" ValidList="0,1,2,3,9" FieldLabelWidth="150px" FieldTextBoxWidth="30px"
										FieldTextBoxTextMode="SingleLine"></def:datafieldcontrol>
								</td>
								<td>
									<def:datafieldcontrol id="ABC143" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
										IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="43. Does not try to communicate by words or gestures"
										FieldTextBoxTabIndex="46" DatabaseField="ABC143" ValidList="0,1,2,3,9" FieldLabelWidth="150px" FieldTextBoxWidth="30px"
										FieldTextBoxTextMode="SingleLine"></def:datafieldcontrol>
								</td>
							</tr>
							<tr>
								<td width="219">
									<def:datafieldcontrol id="ABC115" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
										IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="15. Restless, unable to sit still"
										FieldTextBoxTabIndex="18" DatabaseField="ABC115" ValidList="0,1,2,3,9" FieldLabelWidth="150px" FieldTextBoxWidth="30px"
										FieldTextBoxTextMode="SingleLine"></def:datafieldcontrol>
								</td>
								<td>
									<def:datafieldcontrol id="ABC144" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
										IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="44. Easily distractible"
										FieldTextBoxTabIndex="47" DatabaseField="ABC144" ValidList="0,1,2,3,9" FieldLabelWidth="150px" FieldTextBoxWidth="30px"
										FieldTextBoxTextMode="SingleLine"></def:datafieldcontrol>
								</td>
							</tr>
							<tr>
								<td width="219">
									<def:datafieldcontrol id="ABC116" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
										IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="16. Withdrawn; prefers solitary activities"
										FieldTextBoxTabIndex="19" DatabaseField="ABC116" ValidList="0,1,2,3,9" FieldLabelWidth="150px" FieldTextBoxWidth="30px"
										FieldTextBoxTextMode="SingleLine"></def:datafieldcontrol>
								</td>
								<td>
									<def:datafieldcontrol id="ABC145" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
										IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="45. Waves or shakes the extremities repeatedly"
										FieldTextBoxTabIndex="48" DatabaseField="ABC145" ValidList="0,1,2,3,9" FieldLabelWidth="150px" FieldTextBoxWidth="30px"
										FieldTextBoxTextMode="SingleLine"></def:datafieldcontrol>
								</td>
							</tr>
							<tr>
								<td width="219">
									<def:datafieldcontrol id="ABC117" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
										IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="17. Odd, bizarre in behavior"
										FieldTextBoxTabIndex="20" DatabaseField="ABC117" ValidList="0,1,2,3,9" FieldLabelWidth="150px" FieldTextBoxWidth="30px"
										FieldTextBoxTextMode="SingleLine"></def:datafieldcontrol>
								</td>
								<td>
									<def:datafieldcontrol id="ABC146" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
										IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="46. Repeats a word or phrase over and over"
										FieldTextBoxTabIndex="49" DatabaseField="ABC146" ValidList="0,1,2,3,9" FieldLabelWidth="150px" FieldTextBoxWidth="30px"
										FieldTextBoxTextMode="SingleLine"></def:datafieldcontrol>
								</td>
							</tr>
							<tr>
								<td width="219">
									<def:datafieldcontrol id="ABC118" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
										IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="18. Disobedient, difficult to control"
										FieldTextBoxTabIndex="21" DatabaseField="ABC118" ValidList="0,1,2,3,9" FieldLabelWidth="150px" FieldTextBoxWidth="30px"
										FieldTextBoxTextMode="SingleLine"></def:datafieldcontrol>
								</td>
								<td>
									<def:datafieldcontrol id="ABC147" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
										IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="47. Stamps feet or bangs objects or slams doors"
										FieldTextBoxTabIndex="50" DatabaseField="ABC147" ValidList="0,1,2,3,9" FieldLabelWidth="150px" FieldTextBoxWidth="30px"
										FieldTextBoxTextMode="SingleLine"></def:datafieldcontrol>
								</td>
							</tr>
							<tr>
								<td width="219">
									<def:datafieldcontrol id="ABC119" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
										IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="19. Yells at inappropriate times"
										FieldTextBoxTabIndex="22" DatabaseField="ABC119" ValidList="0,1,2,3,9" FieldLabelWidth="150px" FieldTextBoxWidth="30px"
										FieldTextBoxTextMode="SingleLine"></def:datafieldcontrol>
								</td>
								<td>
									<def:datafieldcontrol id="ABC148" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
										IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="48. Constantly runs or jumps around the room"
										FieldTextBoxTabIndex="51" DatabaseField="ABC148" ValidList="0,1,2,3,9" FieldLabelWidth="150px" FieldTextBoxWidth="30px"
										FieldTextBoxTextMode="SingleLine"></def:datafieldcontrol>
								</td>
							</tr>
							<tr>
								<td width="219">
									<def:datafieldcontrol id="ABC120" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
										IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="20. Fixed facial expression; lacks emotional responsiveness"
										FieldTextBoxTabIndex="23" DatabaseField="ABC120" ValidList="0,1,2,3,9" FieldLabelWidth="150px" FieldTextBoxWidth="30px"
										FieldTextBoxTextMode="SingleLine"></def:datafieldcontrol>
								</td>
								<td>
									<def:datafieldcontrol id="ABC149" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
										IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="49. Rocks body back and forth repeatedly"
										FieldTextBoxTabIndex="52" DatabaseField="ABC149" ValidList="0,1,2,3,9" FieldLabelWidth="150px" FieldTextBoxWidth="30px"
										FieldTextBoxTextMode="SingleLine"></def:datafieldcontrol>
								</td>
							</tr>
							<tr>
								<td width="219">
									<def:datafieldcontrol id="ABC121" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
										IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="21. Disturbs others"
										FieldTextBoxTabIndex="24" DatabaseField="ABC121" ValidList="0,1,2,3,9" FieldLabelWidth="150px" FieldTextBoxWidth="30px"
										FieldTextBoxTextMode="SingleLine"></def:datafieldcontrol>
								</td>
								<td>
									<def:datafieldcontrol id="ABC150" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
										IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="50. Deliberately hurts himself/herself"
										FieldTextBoxTabIndex="53" DatabaseField="ABC150" ValidList="0,1,2,3,9" FieldLabelWidth="150px" FieldTextBoxWidth="30px"
										FieldTextBoxTextMode="SingleLine"></def:datafieldcontrol>
								</td>
							</tr>
							<tr>
								<td width="219">
									<def:datafieldcontrol id="ABC122" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
										IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="22. Repetitive speech"
										FieldTextBoxTabIndex="25" DatabaseField="ABC122" ValidList="0,1,2,3,9" FieldLabelWidth="150px" FieldTextBoxWidth="30px"
										FieldTextBoxTextMode="SingleLine"></def:datafieldcontrol>
								</td>
								<td>
									<def:datafieldcontrol id="ABC151" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
										IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="51. Pays no attention when spoken to"
										FieldTextBoxTabIndex="54" DatabaseField="ABC151" ValidList="0,1,2,3,9" FieldLabelWidth="150px" FieldTextBoxWidth="30px"
										FieldTextBoxTextMode="SingleLine"></def:datafieldcontrol>
								</td>
							</tr>
							<tr>
								<td width="219">
									<def:datafieldcontrol id="ABC123" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
										IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="23. Does nothing but sit and watch others"
										FieldTextBoxTabIndex="26" DatabaseField="ABC123" ValidList="0,1,2,3,9" FieldLabelWidth="150px" FieldTextBoxWidth="30px"
										FieldTextBoxTextMode="SingleLine"></def:datafieldcontrol>
								</td>
								<td>
									<def:datafieldcontrol id="ABC152" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
										IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="52. Does physical violence to self"
										FieldTextBoxTabIndex="55" DatabaseField="ABC152" ValidList="0,1,2,3,9" FieldLabelWidth="150px" FieldTextBoxWidth="30px"
										FieldTextBoxTextMode="SingleLine"></def:datafieldcontrol>
								</td>
							</tr>
							<tr>
								<td width="219">
									<def:datafieldcontrol id="ABC124" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
										IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="24. Uncooperative"
										FieldTextBoxTabIndex="27" DatabaseField="ABC124" ValidList="0,1,2,3,9" FieldLabelWidth="150px" FieldTextBoxWidth="30px"
										FieldTextBoxTextMode="SingleLine"></def:datafieldcontrol>
								</td>
								<td>
									<def:datafieldcontrol id="ABC153" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
										IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="53. Inactive, never moves spontaneously"
										FieldTextBoxTabIndex="56" DatabaseField="ABC153" ValidList="0,1,2,3,9" FieldLabelWidth="150px" FieldTextBoxWidth="30px"
										FieldTextBoxTextMode="SingleLine"></def:datafieldcontrol>
								</td>
							</tr>
							<tr>
								<td width="219">
									<def:datafieldcontrol id="ABC125" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
										IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="25. Depressed mood"
										FieldTextBoxTabIndex="28" DatabaseField="ABC125" ValidList="0,1,2,3,9" FieldLabelWidth="150px" FieldTextBoxWidth="30px"
										FieldTextBoxTextMode="SingleLine"></def:datafieldcontrol>
								</td>
								<td>
									<def:datafieldcontrol id="ABC154" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
										IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="54. Tends to be excessively active"
										FieldTextBoxTabIndex="57" DatabaseField="ABC154" ValidList="0,1,2,3,9" FieldLabelWidth="150px" FieldTextBoxWidth="30px"
										FieldTextBoxTextMode="SingleLine"></def:datafieldcontrol>
								</td>
							</tr>
							<tr>
								<td width="219">
									<def:datafieldcontrol id="ABC126" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
										IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="26. Resists any form of physical contact"
										FieldTextBoxTabIndex="29" DatabaseField="ABC126" ValidList="0,1,2,3,9" FieldLabelWidth="150px" FieldTextBoxWidth="30px"
										FieldTextBoxTextMode="SingleLine"></def:datafieldcontrol>
								</td>
								<td>
									<def:datafieldcontrol id="ABC155" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
										IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="55. Responds negatively to affection"
										FieldTextBoxTabIndex="58" DatabaseField="ABC155" ValidList="0,1,2,3,9" FieldLabelWidth="150px" FieldTextBoxWidth="30px"
										FieldTextBoxTextMode="SingleLine"></def:datafieldcontrol>
								</td>
							</tr>
							<tr>
								<td width="219">
									<def:datafieldcontrol id="ABC127" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
										IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="27. Moves or rolls head back and forth repetitively"
										FieldTextBoxTabIndex="30" DatabaseField="ABC127" ValidList="0,1,2,3,9" FieldLabelWidth="150px" FieldTextBoxWidth="30px"
										FieldTextBoxTextMode="SingleLine"></def:datafieldcontrol>
								</td>
								<td>
									<def:datafieldcontrol id="ABC156" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
										IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="56. Deliberately ignores directions"
										FieldTextBoxTabIndex="59" DatabaseField="ABC156" ValidList="0,1,2,3,9" FieldLabelWidth="150px" FieldTextBoxWidth="30px"
										FieldTextBoxTextMode="SingleLine"></def:datafieldcontrol>
								</td>
							</tr>
							<tr>
								<td width="219">
									<def:datafieldcontrol id="ABC128" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
										IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="28. Does not pay attention to instructions"
										FieldTextBoxTabIndex="31" DatabaseField="ABC128" ValidList="0,1,2,3,9" FieldLabelWidth="150px" FieldTextBoxWidth="30px"
										FieldTextBoxTextMode="SingleLine"></def:datafieldcontrol>
								</td>
								<td>
									<def:datafieldcontrol id="ABC157" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
										IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="57. Has temper outbursts or tantrums when does not get own way"
										FieldTextBoxTabIndex="60" DatabaseField="ABC157" ValidList="0,1,2,3,9" FieldLabelWidth="150px" FieldTextBoxWidth="30px"
										FieldTextBoxTextMode="SingleLine"></def:datafieldcontrol>
								</td>
							</tr>
							<tr>
								<td width="219">
									<def:datafieldcontrol id="ABC129" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
										IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="29. Demands must be met immediately"
										FieldTextBoxTabIndex="32" DatabaseField="ABC129" ValidList="0,1,2,3,9" FieldLabelWidth="150px" FieldTextBoxWidth="30px"
										FieldTextBoxTextMode="SingleLine"></def:datafieldcontrol>
								</td>
								<td>
									<def:datafieldcontrol id="ABC158" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
										IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="58. Shows few social reactions to others"
										FieldTextBoxTabIndex="61" DatabaseField="ABC158" ValidList="0,1,2,3,9" FieldLabelWidth="150px" FieldTextBoxWidth="30px"
										FieldTextBoxTextMode="SingleLine"></def:datafieldcontrol>
								</td>
							</tr>
						</table>
						<br>
						<table id="table_readonly" class="layout">
							<tr>
								<td><def:datafieldcontrol id="created" runat="server" FieldDataType="DATE" IsInsertField="False" IsInsertValueRequired="False"
										IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="created"
										FieldTextBoxTabIndex="63" DatabaseField="created" FieldLabelWidth="80px" RenderReadOnlyAsDiv="True"></def:datafieldcontrol>
								</td>
							</tr>
							<tr>
								<td><def:datafieldcontrol id="createdBy" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
										IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="createdBy"
										FieldTextBoxTabIndex="64" DatabaseField="createdBy" FieldLabelWidth="80px" RenderReadOnlyAsDiv="True"></def:datafieldcontrol>
								</td>
							</tr>
							<tr>
								<td><def:datafieldcontrol id="updated" runat="server" FieldDataType="DATE" IsInsertField="False" IsInsertValueRequired="False"
										IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="updated"
										FieldTextBoxTabIndex="65" DatabaseField="updated" FieldLabelWidth="80px" RenderReadOnlyAsDiv="True"></def:datafieldcontrol>
								</td>
							</tr>
							<tr>
								<td><def:datafieldcontrol id="updatedBy" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
										IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="updatedBy"
										FieldTextBoxTabIndex="66" DatabaseField="updatedBy" FieldLabelWidth="80px" RenderReadOnlyAsDiv="True"></def:datafieldcontrol>
								</td>
							</tr>
						</table>
					</asp:Content>
