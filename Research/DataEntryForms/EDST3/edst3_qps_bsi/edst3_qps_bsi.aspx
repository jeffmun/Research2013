<%@ Register TagPrefix="def" Namespace="DataEntryFramework.Old" %>

<%@ Page language="c#" Inherits="edst3_qps_bsi.edst3_qps_bsi" CodeFile="edst3_qps_bsi.aspx.cs"  MasterPageFile="~/UWAC.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="oBodyPlaceHolder" runat="server">
						<def:dataentrycontroller id="DataEntryController1" runat="server" VerifiedField="verified" PrimaryKeyField="bsi_pk"
							MeasureName="EDST3 Spouse BSI" LookupTextBox1LabelText="EDS ID:" LookupTextBox2Visible="False" LookupField1="edsid"
							DatabaseTable="edst3_qps_bsi" StudyMeasID="324"></def:dataentrycontroller>
						<table class="layout" id="table_insert">
							<tr>
								<td><def:datafieldcontrol id="EDSID" runat="server" DatabaseField="EDSID" FieldTextBoxTabIndex="1" FieldLabelText="EDSID"
										IsDoubleEntryField="False" IsReadOnly="False" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="True"
										IsInsertField="True" FieldDataType="INT" FieldLabelWidth="80px" FieldTextBoxWidth="80px"></def:datafieldcontrol></td>
							</tr>
						</table>
						<br>
						<asp:Panel Runat="server" ID="mainPanel">
							<TABLE class="layout">
								<TR>
									<TD colSpan="2">0=NOT AT ALL, 1=A LITTLE BIT, 2=MODERATELY<BR>
										3=QUITE A BIT, 4= EXTREMELY, 9=MISSING/BLANK</TD>
								</TR>
								<TR>
									<TD style="vertical-align:top">
										<TABLE class="grid">
											<TR>
												<TD>
													<def:datafieldcontrol id="BSI101" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="200px" FieldDataType="INT"
														IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
														IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="1. Nervousness or shakiness inside" FieldTextBoxTabIndex="3"
														DatabaseField="BSI101" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="BSI102" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="200px" FieldDataType="INT"
														IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
														IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="2. Faintness or dizziness" FieldTextBoxTabIndex="4"
														DatabaseField="BSI102" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="BSI103" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="200px" FieldDataType="INT"
														IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
														IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="3. The idea that someone else can control your thoughts"
														FieldTextBoxTabIndex="5" DatabaseField="BSI103" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="BSI104" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="200px" FieldDataType="INT"
														IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
														IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="4. Feeling others are to blame for most of your troubles"
														FieldTextBoxTabIndex="6" DatabaseField="BSI104" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="BSI105" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="200px" FieldDataType="INT"
														IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
														IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="5. Trouble remembering things" FieldTextBoxTabIndex="7"
														DatabaseField="BSI105" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="BSI106" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="200px" FieldDataType="INT"
														IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
														IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="6. Feeling easily annoyed or irritated"
														FieldTextBoxTabIndex="8" DatabaseField="BSI106" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="BSI107" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="200px" FieldDataType="INT"
														IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
														IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="7. Pains in heart or chest" FieldTextBoxTabIndex="9"
														DatabaseField="BSI107" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="BSI108" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="200px" FieldDataType="INT"
														IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
														IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="8. Feeling afraid in open spaces or on the streets"
														FieldTextBoxTabIndex="10" DatabaseField="BSI108" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="BSI109" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="200px" FieldDataType="INT"
														IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
														IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="9. Thoughts of ending your life" FieldTextBoxTabIndex="11"
														DatabaseField="BSI109" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="BSI110" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="200px" FieldDataType="INT"
														IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
														IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="10. Feeling that most people cannot be trusted"
														FieldTextBoxTabIndex="12" DatabaseField="BSI110" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="BSI111" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="200px" FieldDataType="INT"
														IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
														IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="11. Poor appetite" FieldTextBoxTabIndex="13"
														DatabaseField="BSI111" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="BSI112" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="200px" FieldDataType="INT"
														IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
														IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="12. Suddenly scared for no reason" FieldTextBoxTabIndex="14"
														DatabaseField="BSI112" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="BSI113" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="200px" FieldDataType="INT"
														IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
														IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="13. Temper outbursts that you could not control"
														FieldTextBoxTabIndex="15" DatabaseField="BSI113" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="BSI114" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="200px" FieldDataType="INT"
														IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
														IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="14. Feeling lonely even when you are with people"
														FieldTextBoxTabIndex="16" DatabaseField="BSI114" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="BSI115" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="200px" FieldDataType="INT"
														IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
														IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="15. Feeling blocked in getting things done"
														FieldTextBoxTabIndex="17" DatabaseField="BSI115" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="BSI116" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="200px" FieldDataType="INT"
														IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
														IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="16. Feeling lonely" FieldTextBoxTabIndex="18"
														DatabaseField="BSI116" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="BSI117" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="200px" FieldDataType="INT"
														IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
														IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="17. Feeling blue" FieldTextBoxTabIndex="19"
														DatabaseField="BSI117" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="BSI118" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="200px" FieldDataType="INT"
														IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
														IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="18. Feeling no interest in things" FieldTextBoxTabIndex="20"
														DatabaseField="BSI118" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="BSI119" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="200px" FieldDataType="INT"
														IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
														IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="19. Feeling fearful" FieldTextBoxTabIndex="21"
														DatabaseField="BSI119" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="BSI120" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="200px" FieldDataType="INT"
														IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
														IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="20. Your feelings being easily hurt"
														FieldTextBoxTabIndex="22" DatabaseField="BSI120" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="BSI121" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="200px" FieldDataType="INT"
														IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
														IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="21. Feeling that people are unfriendly or dislike you"
														FieldTextBoxTabIndex="23" DatabaseField="BSI121" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="BSI122" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="200px" FieldDataType="INT"
														IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
														IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="22. Feeling inferior to others" FieldTextBoxTabIndex="24"
														DatabaseField="BSI122" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="BSI123" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="200px" FieldDataType="INT"
														IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
														IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="23. Nausea or upset stomach" FieldTextBoxTabIndex="25"
														DatabaseField="BSI123" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="BSI124" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="200px" FieldDataType="INT"
														IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
														IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="24. Feeling that you are watched or talked about by others"
														FieldTextBoxTabIndex="26" DatabaseField="BSI124" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="BSI125" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="200px" FieldDataType="INT"
														IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
														IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="25. Trouble falling asleep" FieldTextBoxTabIndex="27"
														DatabaseField="BSI125" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="BSI126" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="200px" FieldDataType="INT"
														IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
														IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="26. Having to check and double-check what you do"
														FieldTextBoxTabIndex="28" DatabaseField="BSI126" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="BSI127" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="200px" FieldDataType="INT"
														IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
														IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="27. Difficulty making decisions" FieldTextBoxTabIndex="29"
														DatabaseField="BSI127" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
											</TR>
										</TABLE>
									</TD>
									<TD style="vertical-align:top">
										<TABLE class="grid">
											<TR>
												<TD>
													<def:datafieldcontrol id="BSI128" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="200px" FieldDataType="INT"
														IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
														IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="28. Feeling afraid to travel on buses, subways, or trains"
														FieldTextBoxTabIndex="30" DatabaseField="BSI128" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="BSI129" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="200px" FieldDataType="INT"
														IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
														IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="29. Trouble getting your breath" FieldTextBoxTabIndex="31"
														DatabaseField="BSI129" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="BSI130" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="200px" FieldDataType="INT"
														IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
														IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="30. Hot or cold spells" FieldTextBoxTabIndex="32"
														DatabaseField="BSI130" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="BSI131" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="200px" FieldDataType="INT"
														IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
														IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="31. Having to avoid certain things, places, or activities because they frighten you"
														FieldTextBoxTabIndex="33" DatabaseField="BSI131" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="BSI132" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="200px" FieldDataType="INT"
														IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
														IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="32. Your mind going blank" FieldTextBoxTabIndex="34"
														DatabaseField="BSI132" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="BSI133" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="200px" FieldDataType="INT"
														IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
														IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="33. Numbness or tingling in parts of your body"
														FieldTextBoxTabIndex="35" DatabaseField="BSI133" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="BSI134" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="200px" FieldDataType="INT"
														IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
														IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="34. The idea that you should be punished for your sins"
														FieldTextBoxTabIndex="36" DatabaseField="BSI134" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="BSI135" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="200px" FieldDataType="INT"
														IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
														IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="35. Feeling hopeless about the future"
														FieldTextBoxTabIndex="37" DatabaseField="BSI135" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="BSI136" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="200px" FieldDataType="INT"
														IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
														IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="36. Trouble concentrating" FieldTextBoxTabIndex="38"
														DatabaseField="BSI136" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="BSI137" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="200px" FieldDataType="INT"
														IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
														IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="37. Feeling weak in parts of your body"
														FieldTextBoxTabIndex="39" DatabaseField="BSI137" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="BSI138" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="200px" FieldDataType="INT"
														IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
														IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="38. Feeling tense or keyed up" FieldTextBoxTabIndex="40"
														DatabaseField="BSI138" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="BSI139" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="200px" FieldDataType="INT"
														IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
														IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="39. Thoughts of death or dying" FieldTextBoxTabIndex="41"
														DatabaseField="BSI139" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="BSI140" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="200px" FieldDataType="INT"
														IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
														IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="40. Having urges to beat, injure, or harm someone"
														FieldTextBoxTabIndex="42" DatabaseField="BSI140" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="BSI141" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="200px" FieldDataType="INT"
														IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
														IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="41. Having urges to break or smash things"
														FieldTextBoxTabIndex="43" DatabaseField="BSI141" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="BSI142" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="200px" FieldDataType="INT"
														IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
														IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="42. Feeling very self-conscious with others"
														FieldTextBoxTabIndex="44" DatabaseField="BSI142" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="BSI143" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="200px" FieldDataType="INT"
														IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
														IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="43. I Feeling uneasy in crowds, such as shopping or at a movie"
														FieldTextBoxTabIndex="45" DatabaseField="BSI143" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="BSI144" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="200px" FieldDataType="INT"
														IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
														IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="44. Never feeling close to another person"
														FieldTextBoxTabIndex="46" DatabaseField="BSI144" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="BSI145" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="200px" FieldDataType="INT"
														IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
														IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="45. Spells of terror or panic" FieldTextBoxTabIndex="47"
														DatabaseField="BSI145" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="BSI146" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="200px" FieldDataType="INT"
														IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
														IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="46. Getting into frequent arguments"
														FieldTextBoxTabIndex="48" DatabaseField="BSI146" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="BSI147" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="200px" FieldDataType="INT"
														IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
														IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="47. Feeling nervous when you are left alone"
														FieldTextBoxTabIndex="49" DatabaseField="BSI147" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="BSI148" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="200px" FieldDataType="INT"
														IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
														IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="48. Others not giving you proper credit for your achievements"
														FieldTextBoxTabIndex="50" DatabaseField="BSI148" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="BSI149" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="200px" FieldDataType="INT"
														IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
														IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="49. Feeling so restless you couldn't sit still"
														FieldTextBoxTabIndex="51" DatabaseField="BSI149" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="BSI150" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="200px" FieldDataType="INT"
														IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
														IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="50. Feelings of worthlessness" FieldTextBoxTabIndex="52"
														DatabaseField="BSI150" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="BSI151" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="200px" FieldDataType="INT"
														IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
														IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="51. Feeling that people will take advantage of you if you let them"
														FieldTextBoxTabIndex="53" DatabaseField="BSI151" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="BSI152" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="200px" FieldDataType="INT"
														IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
														IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="52. Feelings of guilt" FieldTextBoxTabIndex="54"
														DatabaseField="BSI152" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="BSI153" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="200px" FieldDataType="INT"
														IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
														IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="53. The idea that something is wrong with your mind"
														FieldTextBoxTabIndex="55" DatabaseField="BSI153" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
											</TR>
										</TABLE>
									</TD>
								</TR>
							</TABLE>
							<TABLE class="layout" id="table_readonly">
								<TR>
									<TD>
										<def:datafieldcontrol id="created" runat="server" FieldLabelWidth="80px" FieldDataType="DATE" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True"
											IsDoubleEntryField="False" FieldLabelText="created" FieldTextBoxTabIndex="56" DatabaseField="created"
											RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="createdBy" runat="server" FieldLabelWidth="80px" FieldDataType="TEXT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True"
											IsDoubleEntryField="False" FieldLabelText="createdBy" FieldTextBoxTabIndex="57" DatabaseField="createdBy"
											RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="updated" runat="server" FieldLabelWidth="80px" FieldDataType="DATE" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True"
											IsDoubleEntryField="False" FieldLabelText="updated" FieldTextBoxTabIndex="58" DatabaseField="updated"
											RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="updatedBy" runat="server" FieldLabelWidth="80px" FieldDataType="TEXT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True"
											IsDoubleEntryField="False" FieldLabelText="updatedBy" FieldTextBoxTabIndex="59" DatabaseField="updatedBy"
											RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
						</asp:Panel>
					</asp:Content>
