<%@ Register TagPrefix="def" Namespace="DataEntryFramework.Old" %>

<%@ Page language="c#" Inherits="tap_qpc_bsi.tap_qpc_bsi" CodeFile="tap_qpc_bsi.aspx.cs"  MasterPageFile="~/UWAC.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="oBodyPlaceHolder" runat="server">
						<def:dataentrycontroller id="DataEntryController1" runat="server" DatabaseTable="tap_qpc_bsi" LookupField1="tapid"
							LookupTextBox2Visible="False" LookupTextBox1LabelText="TAP ID:" MeasureName="TAP Caregiver BSI" PrimaryKeyField="bsi_pk"
							VerifiedField="verified" LookupField1DataType="TEXT" StudyMeasID="360"></def:dataentrycontroller>
						<div class="divDataEntryFields">
							<table id="table_insert" class="tblinsert">
								<tr>
									<td><def:datafieldcontrol id="TAPID" runat="server" FieldDataType="TEXT" IsInsertField="True" IsInsertValueRequired="True"
											IsEntryField="False" IsReadOnly="False" FieldLabelText="TAP ID" FieldTextBoxTabIndex="1" DatabaseField="TAPID"
											RegEx="^[T][A][P][0-9][0-9][0-9]$" RegExDescription="TAP ID must look like TAP###" FieldTextBoxWidth="150px"></def:datafieldcontrol>
									</td>
								</tr>
							</table>
							<br>
							0 = Not at all, 1 = A little bit, 2 = Moderately, 3 = Quite a bit, 4 = 
							Extremely
							<br>
							<table id="table_entry" class="tblentry">
								<tr>
									<td>
										<def:datafieldcontrol id="BSI101" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="1. Nervousness or shakiness inside"
											FieldTextBoxTabIndex="2" DatabaseField="BSI101" FieldTextBoxWidth="40px" ValidList="0,1,2,3,4,9"></def:datafieldcontrol>
									</td>
									<td>
										<def:datafieldcontrol id="BSI128" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="28. Feeling afraid to travel on buses, subways, or trains"
											FieldTextBoxTabIndex="29" DatabaseField="BSI128" FieldTextBoxWidth="40px" ValidList="0,1,2,3,4,9"></def:datafieldcontrol>
									</td>
								</tr>
								<tr>
									<td>
										<def:datafieldcontrol id="BSI102" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="2. Faintness or dizziness"
											FieldTextBoxTabIndex="3" DatabaseField="BSI102" FieldTextBoxWidth="40px" ValidList="0,1,2,3,4,9"></def:datafieldcontrol>
									</td>
									<td>
										<def:datafieldcontrol id="BSI129" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="29. Trouble getting your breath"
											FieldTextBoxTabIndex="30" DatabaseField="BSI129" FieldTextBoxWidth="40px" ValidList="0,1,2,3,4,9"></def:datafieldcontrol>
									</td>
								</tr>
								<tr>
									<td>
										<def:datafieldcontrol id="BSI103" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="3. The idea that someone else can control your thoughts"
											FieldTextBoxTabIndex="4" DatabaseField="BSI103" FieldTextBoxWidth="40px" ValidList="0,1,2,3,4,9"></def:datafieldcontrol>
									</td>
									<td>
										<def:datafieldcontrol id="BSI130" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="30. Hot or cold spells"
											FieldTextBoxTabIndex="31" DatabaseField="BSI130" FieldTextBoxWidth="40px" ValidList="0,1,2,3,4,9"></def:datafieldcontrol>
									</td>
								</tr>
								<tr>
									<td>
										<def:datafieldcontrol id="BSI104" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="4. Feeling others are to blame for most of your troubles"
											FieldTextBoxTabIndex="5" DatabaseField="BSI104" FieldTextBoxWidth="40px" ValidList="0,1,2,3,4,9"></def:datafieldcontrol>
									</td>
									<td>
										<def:datafieldcontrol id="BSI131" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="31. Having to avoid certain things, places, or activities, because they frighten you"
											FieldTextBoxTabIndex="32" DatabaseField="BSI131" FieldTextBoxWidth="40px" ValidList="0,1,2,3,4,9"></def:datafieldcontrol>
									</td>
								</tr>
								<tr>
									<td>
										<def:datafieldcontrol id="BSI105" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="5. Trouble remembering things"
											FieldTextBoxTabIndex="6" DatabaseField="BSI105" FieldTextBoxWidth="40px" ValidList="0,1,2,3,4,9"></def:datafieldcontrol>
									</td>
									<td>
										<def:datafieldcontrol id="BSI132" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="32. Your mind going blank"
											FieldTextBoxTabIndex="33" DatabaseField="BSI132" FieldTextBoxWidth="40px" ValidList="0,1,2,3,4,9"></def:datafieldcontrol>
									</td>
								</tr>
								<tr>
									<td>
										<def:datafieldcontrol id="BSI106" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="6. Feeling easily annoyed or irritated"
											FieldTextBoxTabIndex="7" DatabaseField="BSI106" FieldTextBoxWidth="40px" ValidList="0,1,2,3,4,9"></def:datafieldcontrol>
									</td>
									<td>
										<def:datafieldcontrol id="BSI133" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="33. Numbness or tingling in parts of your body"
											FieldTextBoxTabIndex="34" DatabaseField="BSI133" FieldTextBoxWidth="40px" ValidList="0,1,2,3,4,9"></def:datafieldcontrol>
									</td>
								</tr>
								<tr>
									<td>
										<def:datafieldcontrol id="BSI107" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="7. Pains in heart or chest"
											FieldTextBoxTabIndex="8" DatabaseField="BSI107" FieldTextBoxWidth="40px" ValidList="0,1,2,3,4,9"></def:datafieldcontrol>
									</td>
									<td>
										<def:datafieldcontrol id="BSI134" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="34. The idea that you should be punished for your sins"
											FieldTextBoxTabIndex="35" DatabaseField="BSI134" FieldTextBoxWidth="40px" ValidList="0,1,2,3,4,9"></def:datafieldcontrol>
									</td>
								</tr>
								<tr>
									<td>
										<def:datafieldcontrol id="BSI108" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="8. Feeling afraid in open spaces"
											FieldTextBoxTabIndex="9" DatabaseField="BSI108" FieldTextBoxWidth="40px" ValidList="0,1,2,3,4,9"></def:datafieldcontrol>
									</td>
									<td>
										<def:datafieldcontrol id="BSI135" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="35. Feeling hopeless about the future"
											FieldTextBoxTabIndex="36" DatabaseField="BSI135" FieldTextBoxWidth="40px" ValidList="0,1,2,3,4,9"></def:datafieldcontrol>
									</td>
								</tr>
								<tr>
									<td>
										<def:datafieldcontrol id="BSI109" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="9. Thoughts of ending your life"
											FieldTextBoxTabIndex="10" DatabaseField="BSI109" FieldTextBoxWidth="40px" ValidList="0,1,2,3,4,9"></def:datafieldcontrol>
									</td>
									<td>
										<def:datafieldcontrol id="BSI136" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="36. Trouble concentrating"
											FieldTextBoxTabIndex="37" DatabaseField="BSI136" FieldTextBoxWidth="40px" ValidList="0,1,2,3,4,9"></def:datafieldcontrol>
									</td>
								</tr>
								<tr>
									<td>
										<def:datafieldcontrol id="BSI110" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="10. Feeling that most people cannot be trusted"
											FieldTextBoxTabIndex="11" DatabaseField="BSI110" FieldTextBoxWidth="40px" ValidList="0,1,2,3,4,9"></def:datafieldcontrol>
									</td>
									<td>
										<def:datafieldcontrol id="BSI137" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="37. Feeling weak in parts of body"
											FieldTextBoxTabIndex="38" DatabaseField="BSI137" FieldTextBoxWidth="40px" ValidList="0,1,2,3,4,9"></def:datafieldcontrol>
									</td>
								</tr>
								<tr>
									<td>
										<def:datafieldcontrol id="BSI111" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="11. Poor appetite"
											FieldTextBoxTabIndex="12" DatabaseField="BSI111" FieldTextBoxWidth="40px" ValidList="0,1,2,3,4,9"></def:datafieldcontrol>
									</td>
									<td>
										<def:datafieldcontrol id="BSI138" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="38. Feeling tense or keyed up"
											FieldTextBoxTabIndex="39" DatabaseField="BSI138" FieldTextBoxWidth="40px" ValidList="0,1,2,3,4,9"></def:datafieldcontrol>
									</td>
								</tr>
								<tr>
									<td>
										<def:datafieldcontrol id="BSI112" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="12. Suddenly scared for no reason"
											FieldTextBoxTabIndex="13" DatabaseField="BSI112" FieldTextBoxWidth="40px" ValidList="0,1,2,3,4,9"></def:datafieldcontrol>
									</td>
									<td>
										<def:datafieldcontrol id="BSI139" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="39. Thoughts of death or dying"
											FieldTextBoxTabIndex="40" DatabaseField="BSI139" FieldTextBoxWidth="40px" ValidList="0,1,2,3,4,9"></def:datafieldcontrol>
									</td>
								</tr>
								<tr>
									<td>
										<def:datafieldcontrol id="BSI113" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="13. Temper outbursts that you could not control"
											FieldTextBoxTabIndex="14" DatabaseField="BSI113" FieldTextBoxWidth="40px" ValidList="0,1,2,3,4,9"></def:datafieldcontrol>
									</td>
									<td>
										<def:datafieldcontrol id="BSI140" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="40. Having urges to beat, injure, or harm someone"
											FieldTextBoxTabIndex="41" DatabaseField="BSI140" FieldTextBoxWidth="40px" ValidList="0,1,2,3,4,9"></def:datafieldcontrol>
									</td>
								</tr>
								<tr>
									<td>
										<def:datafieldcontrol id="BSI114" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="14. Feeling lonely even when you are with people"
											FieldTextBoxTabIndex="15" DatabaseField="BSI114" FieldTextBoxWidth="40px" ValidList="0,1,2,3,4,9"></def:datafieldcontrol>
									</td>
									<td>
										<def:datafieldcontrol id="BSI141" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="41. Having urges to break or smash things"
											FieldTextBoxTabIndex="42" DatabaseField="BSI141" FieldTextBoxWidth="40px" ValidList="0,1,2,3,4,9"></def:datafieldcontrol>
									</td>
								</tr>
								<tr>
									<td>
										<def:datafieldcontrol id="BSI115" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="15. Feeling blocked in getting things done"
											FieldTextBoxTabIndex="16" DatabaseField="BSI115" FieldTextBoxWidth="40px" ValidList="0,1,2,3,4,9"></def:datafieldcontrol>
									</td>
									<td>
										<def:datafieldcontrol id="BSI142" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="42. Feeling very self-conscious with others"
											FieldTextBoxTabIndex="43" DatabaseField="BSI142" FieldTextBoxWidth="40px" ValidList="0,1,2,3,4,9"></def:datafieldcontrol>
									</td>
								</tr>
								<tr>
									<td>
										<def:datafieldcontrol id="BSI116" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="16. Feeling lonely"
											FieldTextBoxTabIndex="17" DatabaseField="BSI116" FieldTextBoxWidth="40px" ValidList="0,1,2,3,4,9"></def:datafieldcontrol>
									</td>
									<td>
										<def:datafieldcontrol id="BSI143" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="43. Feeling uneasy in crowds"
											FieldTextBoxTabIndex="44" DatabaseField="BSI143" FieldTextBoxWidth="40px" ValidList="0,1,2,3,4,9"></def:datafieldcontrol>
									</td>
								</tr>
								<tr>
									<td>
										<def:datafieldcontrol id="BSI117" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="17. Feeling blue"
											FieldTextBoxTabIndex="18" DatabaseField="BSI117" FieldTextBoxWidth="40px" ValidList="0,1,2,3,4,9"></def:datafieldcontrol>
									</td>
									<td>
										<def:datafieldcontrol id="BSI144" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="44. Never feeling close to another person"
											FieldTextBoxTabIndex="45" DatabaseField="BSI144" FieldTextBoxWidth="40px" ValidList="0,1,2,3,4,9"></def:datafieldcontrol>
									</td>
								</tr>
								<tr>
									<td>
										<def:datafieldcontrol id="BSI118" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="18. Feeling no interest in things"
											FieldTextBoxTabIndex="19" DatabaseField="BSI118" FieldTextBoxWidth="40px" ValidList="0,1,2,3,4,9"></def:datafieldcontrol>
									</td>
									<td>
										<def:datafieldcontrol id="BSI145" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="45. Spells of terror or panic"
											FieldTextBoxTabIndex="46" DatabaseField="BSI145" FieldTextBoxWidth="40px" ValidList="0,1,2,3,4,9"></def:datafieldcontrol>
									</td>
								</tr>
								<tr>
									<td>
										<def:datafieldcontrol id="BSI119" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="19. Feeling fearful"
											FieldTextBoxTabIndex="20" DatabaseField="BSI119" FieldTextBoxWidth="40px" ValidList="0,1,2,3,4,9"></def:datafieldcontrol>
									</td>
									<td>
										<def:datafieldcontrol id="BSI146" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="46. Getting into frequent arguments"
											FieldTextBoxTabIndex="47" DatabaseField="BSI146" FieldTextBoxWidth="40px" ValidList="0,1,2,3,4,9"></def:datafieldcontrol>
									</td>
								</tr>
								<tr>
									<td>
										<def:datafieldcontrol id="BSI120" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="20. Your feelings being easily hurt"
											FieldTextBoxTabIndex="21" DatabaseField="BSI120" FieldTextBoxWidth="40px" ValidList="0,1,2,3,4,9"></def:datafieldcontrol>
									</td>
									<td>
										<def:datafieldcontrol id="BSI147" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="47. Feeling nervous when you are alone"
											FieldTextBoxTabIndex="48" DatabaseField="BSI147" FieldTextBoxWidth="40px" ValidList="0,1,2,3,4,9"></def:datafieldcontrol>
									</td>
								</tr>
								<tr>
									<td>
										<def:datafieldcontrol id="BSI121" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="21. Feeling that people are unfriendly or dislike you"
											FieldTextBoxTabIndex="22" DatabaseField="BSI121" FieldTextBoxWidth="40px" ValidList="0,1,2,3,4,9"></def:datafieldcontrol>
									</td>
									<td>
										<def:datafieldcontrol id="BSI148" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="48. Others not giving you proper credit for your achievements"
											FieldTextBoxTabIndex="49" DatabaseField="BSI148" FieldTextBoxWidth="40px" ValidList="0,1,2,3,4,9"></def:datafieldcontrol>
									</td>
								</tr>
								<tr>
									<td>
										<def:datafieldcontrol id="BSI122" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="22. Feeling inferior to others"
											FieldTextBoxTabIndex="23" DatabaseField="BSI122" FieldTextBoxWidth="40px" ValidList="0,1,2,3,4,9"></def:datafieldcontrol>
									</td>
									<td>
										<def:datafieldcontrol id="BSI149" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="49. Feeling so restless you couldn't sit still"
											FieldTextBoxTabIndex="50" DatabaseField="BSI149" FieldTextBoxWidth="40px" ValidList="0,1,2,3,4,9"></def:datafieldcontrol>
									</td>
								</tr>
								<tr>
									<td>
										<def:datafieldcontrol id="BSI123" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="23. Nausea or upset stomach"
											FieldTextBoxTabIndex="24" DatabaseField="BSI123" FieldTextBoxWidth="40px" ValidList="0,1,2,3,4,9"></def:datafieldcontrol>
									</td>
									<td>
										<def:datafieldcontrol id="BSI150" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="50. Feelings of worthlessness"
											FieldTextBoxTabIndex="51" DatabaseField="BSI150" FieldTextBoxWidth="40px" ValidList="0,1,2,3,4,9"></def:datafieldcontrol>
									</td>
								</tr>
								<tr>
									<td>
										<def:datafieldcontrol id="BSI124" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="24. Feeling that you are watched or talked about by others"
											FieldTextBoxTabIndex="25" DatabaseField="BSI124" FieldTextBoxWidth="40px" ValidList="0,1,2,3,4,9"></def:datafieldcontrol>
									</td>
									<td>
										<def:datafieldcontrol id="BSI151" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="51. Feeling that people will take advantage of you if let them"
											FieldTextBoxTabIndex="52" DatabaseField="BSI151" FieldTextBoxWidth="40px" ValidList="0,1,2,3,4,9"></def:datafieldcontrol>
									</td>
								</tr>
								<tr>
									<td>
										<def:datafieldcontrol id="BSI125" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="25. Trouble falling asleep"
											FieldTextBoxTabIndex="26" DatabaseField="BSI125" FieldTextBoxWidth="40px" ValidList="0,1,2,3,4,9"></def:datafieldcontrol>
									</td>
									<td>
										<def:datafieldcontrol id="BSI152" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="52. Feelings of guilt"
											FieldTextBoxTabIndex="53" DatabaseField="BSI152" FieldTextBoxWidth="40px" ValidList="0,1,2,3,4,9"></def:datafieldcontrol>
									</td>
								</tr>
								<tr>
									<td>
										<def:datafieldcontrol id="BSI126" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="26. Having to check and double-check what you do"
											FieldTextBoxTabIndex="27" DatabaseField="BSI126" FieldTextBoxWidth="40px" ValidList="0,1,2,3,4,9"></def:datafieldcontrol>
									</td>
									<td>
										<def:datafieldcontrol id="BSI153" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="53. The idea that something is wrong with your mind"
											FieldTextBoxTabIndex="54" DatabaseField="BSI153" FieldTextBoxWidth="40px" ValidList="0,1,2,3,4,9"></def:datafieldcontrol>
									</td>
								</tr>
								<tr>
									<td>
										<def:datafieldcontrol id="BSI127" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="27. Difficulty making decisions"
											FieldTextBoxTabIndex="28" DatabaseField="BSI127" FieldTextBoxWidth="40px" ValidList="0,1,2,3,4,9"></def:datafieldcontrol>
									</td>
									<td>
									</td>
								</tr>
							</table>
							<br>
							<table id="table_readonly" class="tblreadonly">
								<tr>
									<td><def:datafieldcontrol id="created" runat="server" FieldDataType="DATE" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="created"
											FieldTextBoxTabIndex="56" DatabaseField="created" RenderReadOnlyAsDiv="True" FieldLabelWidth="80px"></def:datafieldcontrol>
									</td>
								</tr>
								<tr>
									<td><def:datafieldcontrol id="createdBy" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="createdBy"
											FieldTextBoxTabIndex="57" DatabaseField="createdBy" RenderReadOnlyAsDiv="True" FieldLabelWidth="80px"></def:datafieldcontrol>
									</td>
								</tr>
								<tr>
									<td><def:datafieldcontrol id="updated" runat="server" FieldDataType="DATE" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="updated"
											FieldTextBoxTabIndex="58" DatabaseField="updated" RenderReadOnlyAsDiv="True" FieldLabelWidth="80px"></def:datafieldcontrol>
									</td>
								</tr>
								<tr>
									<td><def:datafieldcontrol id="updatedBy" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="updatedBy"
											FieldTextBoxTabIndex="59" DatabaseField="updatedBy" RenderReadOnlyAsDiv="True" FieldLabelWidth="80px"></def:datafieldcontrol>
									</td>
								</tr>
							</table>
						</div>
					</asp:Content>
