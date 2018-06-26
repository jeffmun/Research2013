<%@ Page language="c#" Inherits="kt_bsi.kt_bsi" CodeFile="bsi.aspx.cs"  MasterPageFile="~/UWAC.master" %>
<%@ Register TagPrefix="def" Namespace="DataEntryFramework" %>

<asp:Content ID="Content1" ContentPlaceHolderID="oBodyPlaceHolder" runat="server">
						<def:dataentrycontroller id="DataEntryController1" runat="server" DatabaseTable="all_bsi" LookupField1="id"
							LookupTextBox2Visible="False" LookupTextBox1LabelText="Subject ID:" MeasureName="BSI" PrimaryKeyField="bsi_pk"
							VerifiedField="verified" LookupField1DataType="TEXT" 
							AllowedStudyMeasures="200,324,360,418,572,690,769,774,808,809,1175,1176,1177,1190,1191,1192,1219,1220,1682,1683,1737,1750,1786,1792,1889,1931,1940,2058,2429,2430,2431,2432,2159,2158,2195,2189,2212,2211"></def:dataentrycontroller>
						<table id="table_insert" class="layout">
							<tr>
								<td><def:datafieldcontrol id="TAPID" runat="server" FieldDataType="TEXT" IsInsertField="True" IsInsertValueRequired="True"
										IsEntryField="False" IsReadOnly="False" FieldLabelText="ID" FieldTextBoxTabIndex="1" DatabaseField="id"
										FieldTextBoxWidth="80px" FieldLabelWidth="60px"></def:datafieldcontrol>
								</td>
							</tr>
						</table>
						<br>
						<asp:Panel Runat="server" ID="mainPanel">
							<TABLE class="grid">
								<TR>
									<TD class="heading">Respondant</TD>
								</TR>
								<TR>
									<TD>0=Self/Subject<BR>
										1=Mother (bio, step, adoptive)<BR>
										2=Father (bio, step, adoptive)<BR>
										3=Primary Caregiver (specify below)<BR>
										4=Other (specify below)<BR>
										9=Missing/Unknown<BR>
										<def:datafieldcontrol id="bsi1resp" runat="server" FieldLabelWidth="130px" FieldTextBoxWidth="30px" DatabaseField="bsi1resp"
											FieldTextBoxTabIndex="1" FieldLabelText="Respondant" IsReadOnly="False" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" IsEntryValueRequired="True" IsDoubleEntryField="True" ValidList="0,1,2,3,4,9"></def:datafieldcontrol><BR>
										<def:datafieldcontrol id="bsi1rest" runat="server" FieldLabelWidth="130px" FieldTextBoxWidth="200px" DatabaseField="bsi1rest"
											FieldTextBoxTabIndex="1" FieldLabelText="(specify if 3 or 4)" IsReadOnly="False" IsEntryField="True"
											IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT" IsEntryValueRequired="False"
											IsDoubleEntryField="False"></def:datafieldcontrol><BR>
									</TD>
								</TR>
							</TABLE>
							<BR>
							<TABLE class="grid">
								<TR>
									<TD>0=NOT AT ALL<BR>
										1=A LITTLE BIT<BR>
										2=MODERATELY<BR>
										3=QUITE A BIT<BR>
										4=EXTREMELY<BR>
										9=MISSING<BR>
									</TD>
								</TR>
							</TABLE>
							<BR>
							<TABLE class="grid" id="table_entry">
								<TR>
									<TD>
										<def:datafieldcontrol id="BSI101" runat="server" FieldTextBoxWidth="40px" DatabaseField="BSI101" FieldTextBoxTabIndex="2"
											FieldLabelText="1. Nervousness or shakiness inside" IsReadOnly="False" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" IsEntryValueRequired="True" IsDoubleEntryField="True" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="BSI128" runat="server" FieldTextBoxWidth="40px" DatabaseField="BSI128" FieldTextBoxTabIndex="29"
											FieldLabelText="28. Feeling afraid to travel on buses, subways, or trains" IsReadOnly="False" IsEntryField="True"
											IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" IsEntryValueRequired="True"
											IsDoubleEntryField="True" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="BSI102" runat="server" FieldTextBoxWidth="40px" DatabaseField="BSI102" FieldTextBoxTabIndex="3"
											FieldLabelText="2. Faintness or dizziness" IsReadOnly="False" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" IsEntryValueRequired="True" IsDoubleEntryField="True" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="BSI129" runat="server" FieldTextBoxWidth="40px" DatabaseField="BSI129" FieldTextBoxTabIndex="30"
											FieldLabelText="29. Trouble getting your breath" IsReadOnly="False" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" IsEntryValueRequired="True" IsDoubleEntryField="True" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="BSI103" runat="server" FieldTextBoxWidth="40px" DatabaseField="BSI103" FieldTextBoxTabIndex="4"
											FieldLabelText="3. The idea that someone else can control your thoughts" IsReadOnly="False" IsEntryField="True"
											IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" IsEntryValueRequired="True"
											IsDoubleEntryField="True" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="BSI130" runat="server" FieldTextBoxWidth="40px" DatabaseField="BSI130" FieldTextBoxTabIndex="31"
											FieldLabelText="30. Hot or cold spells" IsReadOnly="False" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" IsEntryValueRequired="True" IsDoubleEntryField="True" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="BSI104" runat="server" FieldTextBoxWidth="40px" DatabaseField="BSI104" FieldTextBoxTabIndex="5"
											FieldLabelText="4. Feeling others are to blame for most of your troubles" IsReadOnly="False" IsEntryField="True"
											IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" IsEntryValueRequired="True"
											IsDoubleEntryField="True" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="BSI131" runat="server" FieldTextBoxWidth="40px" DatabaseField="BSI131" FieldTextBoxTabIndex="32"
											FieldLabelText="31. Having to avoid certain things, places, or activities, because they frighten you"
											IsReadOnly="False" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT"
											IsEntryValueRequired="True" IsDoubleEntryField="True" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="BSI105" runat="server" FieldTextBoxWidth="40px" DatabaseField="BSI105" FieldTextBoxTabIndex="6"
											FieldLabelText="5. Trouble remembering things" IsReadOnly="False" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" IsEntryValueRequired="True" IsDoubleEntryField="True" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="BSI132" runat="server" FieldTextBoxWidth="40px" DatabaseField="BSI132" FieldTextBoxTabIndex="33"
											FieldLabelText="32. Your mind going blank" IsReadOnly="False" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" IsEntryValueRequired="True" IsDoubleEntryField="True" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="BSI106" runat="server" FieldTextBoxWidth="40px" DatabaseField="BSI106" FieldTextBoxTabIndex="7"
											FieldLabelText="6. Feeling easily annoyed or irritated" IsReadOnly="False" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" IsEntryValueRequired="True" IsDoubleEntryField="True" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="BSI133" runat="server" FieldTextBoxWidth="40px" DatabaseField="BSI133" FieldTextBoxTabIndex="34"
											FieldLabelText="33. Numbness or tingling in parts of your body" IsReadOnly="False" IsEntryField="True"
											IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" IsEntryValueRequired="True"
											IsDoubleEntryField="True" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="BSI107" runat="server" FieldTextBoxWidth="40px" DatabaseField="BSI107" FieldTextBoxTabIndex="8"
											FieldLabelText="7. Pains in heart or chest" IsReadOnly="False" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" IsEntryValueRequired="True" IsDoubleEntryField="True" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="BSI134" runat="server" FieldTextBoxWidth="40px" DatabaseField="BSI134" FieldTextBoxTabIndex="35"
											FieldLabelText="34. The idea that you should be punished for your sins" IsReadOnly="False" IsEntryField="True"
											IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" IsEntryValueRequired="True"
											IsDoubleEntryField="True" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="BSI108" runat="server" FieldTextBoxWidth="40px" DatabaseField="BSI108" FieldTextBoxTabIndex="9"
											FieldLabelText="8. Feeling afraid in open spaces" IsReadOnly="False" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" IsEntryValueRequired="True" IsDoubleEntryField="True" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="BSI135" runat="server" FieldTextBoxWidth="40px" DatabaseField="BSI135" FieldTextBoxTabIndex="36"
											FieldLabelText="35. Feeling hopeless about the future" IsReadOnly="False" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" IsEntryValueRequired="True" IsDoubleEntryField="True" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="BSI109" runat="server" FieldTextBoxWidth="40px" DatabaseField="BSI109" FieldTextBoxTabIndex="10"
											FieldLabelText="9. Thoughts of ending your life" IsReadOnly="False" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" IsEntryValueRequired="True" IsDoubleEntryField="True" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="BSI136" runat="server" FieldTextBoxWidth="40px" DatabaseField="BSI136" FieldTextBoxTabIndex="37"
											FieldLabelText="36. Trouble concentrating" IsReadOnly="False" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" IsEntryValueRequired="True" IsDoubleEntryField="True" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="BSI110" runat="server" FieldTextBoxWidth="40px" DatabaseField="BSI110" FieldTextBoxTabIndex="11"
											FieldLabelText="10. Feeling that most people cannot be trusted" IsReadOnly="False" IsEntryField="True"
											IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" IsEntryValueRequired="True"
											IsDoubleEntryField="True" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="BSI137" runat="server" FieldTextBoxWidth="40px" DatabaseField="BSI137" FieldTextBoxTabIndex="38"
											FieldLabelText="37. Feeling weak in parts of body" IsReadOnly="False" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" IsEntryValueRequired="True" IsDoubleEntryField="True" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="BSI111" runat="server" FieldTextBoxWidth="40px" DatabaseField="BSI111" FieldTextBoxTabIndex="12"
											FieldLabelText="11. Poor appetite" IsReadOnly="False" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" IsEntryValueRequired="True" IsDoubleEntryField="True" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="BSI138" runat="server" FieldTextBoxWidth="40px" DatabaseField="BSI138" FieldTextBoxTabIndex="39"
											FieldLabelText="38. Feeling tense or keyed up" IsReadOnly="False" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" IsEntryValueRequired="True" IsDoubleEntryField="True" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="BSI112" runat="server" FieldTextBoxWidth="40px" DatabaseField="BSI112" FieldTextBoxTabIndex="13"
											FieldLabelText="12. Suddenly scared for no reason" IsReadOnly="False" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" IsEntryValueRequired="True" IsDoubleEntryField="True" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="BSI139" runat="server" FieldTextBoxWidth="40px" DatabaseField="BSI139" FieldTextBoxTabIndex="40"
											FieldLabelText="39. Thoughts of death or dying" IsReadOnly="False" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" IsEntryValueRequired="True" IsDoubleEntryField="True" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="BSI113" runat="server" FieldTextBoxWidth="40px" DatabaseField="BSI113" FieldTextBoxTabIndex="14"
											FieldLabelText="13. Temper outbursts that you could not control" IsReadOnly="False" IsEntryField="True"
											IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" IsEntryValueRequired="True"
											IsDoubleEntryField="True" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="BSI140" runat="server" FieldTextBoxWidth="40px" DatabaseField="BSI140" FieldTextBoxTabIndex="41"
											FieldLabelText="40. Having urges to beat, injure, or harm someone" IsReadOnly="False" IsEntryField="True"
											IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" IsEntryValueRequired="True"
											IsDoubleEntryField="True" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="BSI114" runat="server" FieldTextBoxWidth="40px" DatabaseField="BSI114" FieldTextBoxTabIndex="15"
											FieldLabelText="14. Feeling lonely even when you are with people" IsReadOnly="False" IsEntryField="True"
											IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" IsEntryValueRequired="True"
											IsDoubleEntryField="True" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="BSI141" runat="server" FieldTextBoxWidth="40px" DatabaseField="BSI141" FieldTextBoxTabIndex="42"
											FieldLabelText="41. Having urges to break or smash things" IsReadOnly="False" IsEntryField="True"
											IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" IsEntryValueRequired="True"
											IsDoubleEntryField="True" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="BSI115" runat="server" FieldTextBoxWidth="40px" DatabaseField="BSI115" FieldTextBoxTabIndex="16"
											FieldLabelText="15. Feeling blocked in getting things done" IsReadOnly="False" IsEntryField="True"
											IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" IsEntryValueRequired="True"
											IsDoubleEntryField="True" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="BSI142" runat="server" FieldTextBoxWidth="40px" DatabaseField="BSI142" FieldTextBoxTabIndex="43"
											FieldLabelText="42. Feeling very self-conscious with others" IsReadOnly="False" IsEntryField="True"
											IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" IsEntryValueRequired="True"
											IsDoubleEntryField="True" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="BSI116" runat="server" FieldTextBoxWidth="40px" DatabaseField="BSI116" FieldTextBoxTabIndex="17"
											FieldLabelText="16. Feeling lonely" IsReadOnly="False" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" IsEntryValueRequired="True" IsDoubleEntryField="True" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="BSI143" runat="server" FieldTextBoxWidth="40px" DatabaseField="BSI143" FieldTextBoxTabIndex="44"
											FieldLabelText="43. Feeling uneasy in crowds" IsReadOnly="False" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" IsEntryValueRequired="True" IsDoubleEntryField="True" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="BSI117" runat="server" FieldTextBoxWidth="40px" DatabaseField="BSI117" FieldTextBoxTabIndex="18"
											FieldLabelText="17. Feeling blue" IsReadOnly="False" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" IsEntryValueRequired="True" IsDoubleEntryField="True" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="BSI144" runat="server" FieldTextBoxWidth="40px" DatabaseField="BSI144" FieldTextBoxTabIndex="45"
											FieldLabelText="44. Never feeling close to another person" IsReadOnly="False" IsEntryField="True"
											IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" IsEntryValueRequired="True"
											IsDoubleEntryField="True" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="BSI118" runat="server" FieldTextBoxWidth="40px" DatabaseField="BSI118" FieldTextBoxTabIndex="19"
											FieldLabelText="18. Feeling no interest in things" IsReadOnly="False" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" IsEntryValueRequired="True" IsDoubleEntryField="True" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="BSI145" runat="server" FieldTextBoxWidth="40px" DatabaseField="BSI145" FieldTextBoxTabIndex="46"
											FieldLabelText="45. Spells of terror or panic" IsReadOnly="False" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" IsEntryValueRequired="True" IsDoubleEntryField="True" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="BSI119" runat="server" FieldTextBoxWidth="40px" DatabaseField="BSI119" FieldTextBoxTabIndex="20"
											FieldLabelText="19. Feeling fearful" IsReadOnly="False" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" IsEntryValueRequired="True" IsDoubleEntryField="True" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="BSI146" runat="server" FieldTextBoxWidth="40px" DatabaseField="BSI146" FieldTextBoxTabIndex="47"
											FieldLabelText="46. Getting into frequent arguments" IsReadOnly="False" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" IsEntryValueRequired="True" IsDoubleEntryField="True" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="BSI120" runat="server" FieldTextBoxWidth="40px" DatabaseField="BSI120" FieldTextBoxTabIndex="21"
											FieldLabelText="20. Your feelings being easily hurt" IsReadOnly="False" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" IsEntryValueRequired="True" IsDoubleEntryField="True" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="BSI147" runat="server" FieldTextBoxWidth="40px" DatabaseField="BSI147" FieldTextBoxTabIndex="48"
											FieldLabelText="47. Feeling nervous when you are alone" IsReadOnly="False" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" IsEntryValueRequired="True" IsDoubleEntryField="True" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="BSI121" runat="server" FieldTextBoxWidth="40px" DatabaseField="BSI121" FieldTextBoxTabIndex="22"
											FieldLabelText="21. Feeling that people are unfriendly or dislike you" IsReadOnly="False" IsEntryField="True"
											IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" IsEntryValueRequired="True"
											IsDoubleEntryField="True" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="BSI148" runat="server" FieldTextBoxWidth="40px" DatabaseField="BSI148" FieldTextBoxTabIndex="49"
											FieldLabelText="48. Others not giving you proper credit for your achievements" IsReadOnly="False"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" IsEntryValueRequired="True"
											IsDoubleEntryField="True" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="BSI122" runat="server" FieldTextBoxWidth="40px" DatabaseField="BSI122" FieldTextBoxTabIndex="23"
											FieldLabelText="22. Feeling inferior to others" IsReadOnly="False" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" IsEntryValueRequired="True" IsDoubleEntryField="True" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="BSI149" runat="server" FieldTextBoxWidth="40px" DatabaseField="BSI149" FieldTextBoxTabIndex="50"
											FieldLabelText="49. Feeling so restless you couldn't sit still" IsReadOnly="False" IsEntryField="True"
											IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" IsEntryValueRequired="True"
											IsDoubleEntryField="True" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="BSI123" runat="server" FieldTextBoxWidth="40px" DatabaseField="BSI123" FieldTextBoxTabIndex="24"
											FieldLabelText="23. Nausea or upset stomach" IsReadOnly="False" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" IsEntryValueRequired="True" IsDoubleEntryField="True" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="BSI150" runat="server" FieldTextBoxWidth="40px" DatabaseField="BSI150" FieldTextBoxTabIndex="51"
											FieldLabelText="50. Feelings of worthlessness" IsReadOnly="False" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" IsEntryValueRequired="True" IsDoubleEntryField="True" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="BSI124" runat="server" FieldTextBoxWidth="40px" DatabaseField="BSI124" FieldTextBoxTabIndex="25"
											FieldLabelText="24. Feeling that you are watched or talked about by others" IsReadOnly="False" IsEntryField="True"
											IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" IsEntryValueRequired="True"
											IsDoubleEntryField="True" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="BSI151" runat="server" FieldTextBoxWidth="40px" DatabaseField="BSI151" FieldTextBoxTabIndex="52"
											FieldLabelText="51. Feeling that people will take advantage of you if let them" IsReadOnly="False"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" IsEntryValueRequired="True"
											IsDoubleEntryField="True" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="BSI125" runat="server" FieldTextBoxWidth="40px" DatabaseField="BSI125" FieldTextBoxTabIndex="26"
											FieldLabelText="25. Trouble falling asleep" IsReadOnly="False" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" IsEntryValueRequired="True" IsDoubleEntryField="True" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="BSI152" runat="server" FieldTextBoxWidth="40px" DatabaseField="BSI152" FieldTextBoxTabIndex="53"
											FieldLabelText="52. Feelings of guilt" IsReadOnly="False" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" IsEntryValueRequired="True" IsDoubleEntryField="True" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="BSI126" runat="server" FieldTextBoxWidth="40px" DatabaseField="BSI126" FieldTextBoxTabIndex="27"
											FieldLabelText="26. Having to check and double-check what you do" IsReadOnly="False" IsEntryField="True"
											IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" IsEntryValueRequired="True"
											IsDoubleEntryField="True" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="BSI153" runat="server" FieldTextBoxWidth="40px" DatabaseField="BSI153" FieldTextBoxTabIndex="54"
											FieldLabelText="53. The idea that something is wrong with your mind" IsReadOnly="False" IsEntryField="True"
											IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" IsEntryValueRequired="True"
											IsDoubleEntryField="True" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="BSI127" runat="server" FieldTextBoxWidth="40px" DatabaseField="BSI127" FieldTextBoxTabIndex="28"
											FieldLabelText="27. Difficulty making decisions" IsReadOnly="False" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" IsEntryValueRequired="True" IsDoubleEntryField="True" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
									<TD></TD>
								</TR>
							</TABLE>
							<BR>
							<TABLE class="layout" id="table_readonly">
								<TR>
									<TD>
										<def:datafieldcontrol id="created" runat="server" FieldLabelWidth="80px" DatabaseField="created" FieldTextBoxTabIndex="56"
											FieldLabelText="created" IsReadOnly="True" IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="DATE" IsEntryValueRequired="False" IsDoubleEntryField="False" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="createdBy" runat="server" FieldLabelWidth="80px" DatabaseField="createdBy" FieldTextBoxTabIndex="57"
											FieldLabelText="createdBy" IsReadOnly="True" IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="TEXT" IsEntryValueRequired="False" IsDoubleEntryField="False" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="updated" runat="server" FieldLabelWidth="80px" DatabaseField="updated" FieldTextBoxTabIndex="58"
											FieldLabelText="updated" IsReadOnly="True" IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="DATE" IsEntryValueRequired="False" IsDoubleEntryField="False" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="updatedBy" runat="server" FieldLabelWidth="80px" DatabaseField="updatedBy" FieldTextBoxTabIndex="59"
											FieldLabelText="updatedBy" IsReadOnly="True" IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="TEXT" IsEntryValueRequired="False" IsDoubleEntryField="False" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
						</asp:Panel>
					</asp:Content>
