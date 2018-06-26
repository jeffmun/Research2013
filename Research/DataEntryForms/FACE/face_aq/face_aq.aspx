<%@ Page language="c#" Inherits="face_aq.face_aq" CodeFile="face_aq.aspx.cs"  MasterPageFile="~/UWAC.master" %>
<%@ Register TagPrefix="def" Namespace="DataEntryFramework.Old" %>

<asp:Content ID="Content1" ContentPlaceHolderID="oBodyPlaceHolder" runat="server">
						<def:dataentrycontroller id="DataEntryController1" runat="server" VerifiedField="verified" PrimaryKeyField="aq_pk"
							MeasureName="FACE AQ" LookupTextBox1LabelText="FACE ID:" LookupTextBox2Visible="False" LookupField1="faceid"
							DatabaseTable="face_aq" LookupField1DataType="TEXT" ShowScoreButton="False" StudyMeasID="383"></def:dataentrycontroller>
						<table id="table_insert" class="layout">
							<tr>
								<td><def:datafieldcontrol id="faceid" runat="server" FieldDataType="TEXT" IsInsertField="True" IsInsertValueRequired="True"
										IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="FACE ID"
										FieldTextBoxTabIndex="2" DatabaseField="faceid" RegEx="^[F][A][C][E][0-9][0-9][0-9]$" RegExDescription="FACE ID must  look like FACE###"
										FieldLabelWidth="80px" FieldTextBoxWidth="80px"></def:datafieldcontrol>
								</td>
							</tr>
							<tr>
								<td><def:datafieldcontrol id="aqdate" runat="server" FieldDataType="DATE" IsInsertField="False" IsInsertValueRequired="False"
										IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="Date"
										FieldTextBoxTabIndex="3" DatabaseField="aqdate" FieldTextBoxWidth="80px" FieldLabelWidth="80px" FormatString="{0:d}"></def:datafieldcontrol>
								</td>
							</tr>
						</table>
						<br>
						<asp:Panel Runat="server" ID="mainPanel">
							<TABLE class="grid" id="table_entry">
								<TR>
									<TD class="heading">1=definitely agree<BR>
										2=slightly agree<BR>
										3=slightly disagree<BR>
										4=definitely disagree<BR>
										9=Missing</TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="aq01" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="350px" DatabaseField="aq01"
											FieldTextBoxTabIndex="4" FieldLabelText="1. I prefer to do things with others rather than on my own."
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="aq02" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="350px" DatabaseField="aq02"
											FieldTextBoxTabIndex="5" FieldLabelText="2. I prefer to do things the same way over and over again."
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="aq03" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="350px" DatabaseField="aq03"
											FieldTextBoxTabIndex="6" FieldLabelText="3. If I try to imagine something, I find it very easy to create a picture in my mind."
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="aq04" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="350px" DatabaseField="aq04"
											FieldTextBoxTabIndex="7" FieldLabelText="4. I frequently get so strongly absorbed in one thing that I lose sight of other things."
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="aq05" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="350px" DatabaseField="aq05"
											FieldTextBoxTabIndex="8" FieldLabelText="5. I often notice small sounds when others do not." IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="aq06" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="350px" DatabaseField="aq06"
											FieldTextBoxTabIndex="9" FieldLabelText="6. I usually notice car number plates or similar strings of information."
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="aq07" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="350px" DatabaseField="aq07"
											FieldTextBoxTabIndex="10" FieldLabelText="7. Other people frequently tell me that what I've said is impolite, even though I think it is polite."
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="aq08" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="350px" DatabaseField="aq08"
											FieldTextBoxTabIndex="11" FieldLabelText="8. When I'm reading a story, I can easily imagine what the characters might look like."
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="aq09" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="350px" DatabaseField="aq09"
											FieldTextBoxTabIndex="12" FieldLabelText="9. I am fascinated by dates." IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="aq10" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="350px" DatabaseField="aq10"
											FieldTextBoxTabIndex="13" FieldLabelText="10. In a social group, I can easily keep track of several different people's conversations."
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="aq11" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="350px" DatabaseField="aq11"
											FieldTextBoxTabIndex="14" FieldLabelText="11. I find social situations easy." IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="aq12" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="350px" DatabaseField="aq12"
											FieldTextBoxTabIndex="15" FieldLabelText="12. I tend to notice details that others do not." IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="aq13" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="350px" DatabaseField="aq13"
											FieldTextBoxTabIndex="16" FieldLabelText="13. I would rather go to a library than a party." IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="aq14" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="350px" DatabaseField="aq14"
											FieldTextBoxTabIndex="17" FieldLabelText="14. I find making up stories easy." IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="aq15" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="350px" DatabaseField="aq15"
											FieldTextBoxTabIndex="18" FieldLabelText="15. I find myself drawn more strongly to people than to things."
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="aq16" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="350px" DatabaseField="aq16"
											FieldTextBoxTabIndex="19" FieldLabelText="16. I tend to have very strong interests which I get upset about if I can't pursue."
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="aq17" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="350px" DatabaseField="aq17"
											FieldTextBoxTabIndex="20" FieldLabelText="17. I enjoy social chit-chat." IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="aq18" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="350px" DatabaseField="aq18"
											FieldTextBoxTabIndex="21" FieldLabelText="18. When I talk, it isn't always easy for others to get a word in edgeways."
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="aq19" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="350px" DatabaseField="aq19"
											FieldTextBoxTabIndex="22" FieldLabelText="19. I am fascinated by numbers." IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="aq20" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="350px" DatabaseField="aq20"
											FieldTextBoxTabIndex="23" FieldLabelText="20. When I'm reading a story, I find it difficult to work out the characters' intentions."
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="aq21" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="350px" DatabaseField="aq21"
											FieldTextBoxTabIndex="24" FieldLabelText="21. I don't particularly enjoy reading fiction." IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="aq22" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="350px" DatabaseField="aq22"
											FieldTextBoxTabIndex="25" FieldLabelText="22. I find it hard to make new friends." IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="aq23" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="350px" DatabaseField="aq23"
											FieldTextBoxTabIndex="26" FieldLabelText="23. I notice patterns in things all the time." IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="aq24" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="350px" DatabaseField="aq24"
											FieldTextBoxTabIndex="27" FieldLabelText="24. I would rather go to the theatre than a museum." IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="aq25" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="350px" DatabaseField="aq25"
											FieldTextBoxTabIndex="28" FieldLabelText="25. It does not upset me if my daily routine is disturbed."
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="aq26" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="350px" DatabaseField="aq26"
											FieldTextBoxTabIndex="29" FieldLabelText="26. I frequently find that I don't know how to keep a conversation going."
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="aq27" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="350px" DatabaseField="aq27"
											FieldTextBoxTabIndex="30" FieldLabelText="27. I find it easy to 'read between the lines' when someone is talking to me."
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="aq28" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="350px" DatabaseField="aq28"
											FieldTextBoxTabIndex="31" FieldLabelText="28. I usually concentrate more on the whole picture, rather than the small details."
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="aq29" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="350px" DatabaseField="aq29"
											FieldTextBoxTabIndex="32" FieldLabelText="29. I am not very good at remembering phone numbers." IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="aq30" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="350px" DatabaseField="aq30"
											FieldTextBoxTabIndex="33" FieldLabelText="30. I don't usually notice small changes in a situation, or a person's appearance."
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="aq31" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="350px" DatabaseField="aq31"
											FieldTextBoxTabIndex="34" FieldLabelText="31. I know how to tell if someone listening to me is getting bored."
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="aq32" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="350px" DatabaseField="aq32"
											FieldTextBoxTabIndex="35" FieldLabelText="32. I find it easy to do more than one thing at once." IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="aq33" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="350px" DatabaseField="aq33"
											FieldTextBoxTabIndex="36" FieldLabelText="33. When I talk on the phone, I'm not sure when it's my turn to speak."
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="aq34" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="350px" DatabaseField="aq34"
											FieldTextBoxTabIndex="37" FieldLabelText="34. I enjoy doing things spontaneously." IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="aq35" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="350px" DatabaseField="aq35"
											FieldTextBoxTabIndex="38" FieldLabelText="35. I am often the last to understand the point of a joke."
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="aq36" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="350px" DatabaseField="aq36"
											FieldTextBoxTabIndex="39" FieldLabelText="36. I find it easy to work out what someone is thinking or feeling just by looking at their face."
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="aq37" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="350px" DatabaseField="aq37"
											FieldTextBoxTabIndex="40" FieldLabelText="37. If there is an interruption, I can switch back to what I was doing very quickly."
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="aq38" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="350px" DatabaseField="aq38"
											FieldTextBoxTabIndex="41" FieldLabelText="38. I am good at social chit-chat." IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="aq39" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="350px" DatabaseField="aq39"
											FieldTextBoxTabIndex="42" FieldLabelText="39. People often tell me that I keep going on and on about the same thing."
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="aq40" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="350px" DatabaseField="aq40"
											FieldTextBoxTabIndex="43" FieldLabelText="40. When I was young, I used to enjoy playing games involving pretending with other children."
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="aq41" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="350px" DatabaseField="aq41"
											FieldTextBoxTabIndex="44" FieldLabelText="41. I like to collect information about categories of things (e.g. types of car, types of bird, types of train, types of plant, etc.)."
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="aq42" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="350px" DatabaseField="aq42"
											FieldTextBoxTabIndex="45" FieldLabelText="42. I find it difficult to imagine what it would be like to be someone else."
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="aq43" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="350px" DatabaseField="aq43"
											FieldTextBoxTabIndex="46" FieldLabelText="43. I like to plan any activities I participate in carefully."
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="aq44" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="350px" DatabaseField="aq44"
											FieldTextBoxTabIndex="47" FieldLabelText="44. I enjoy social occasions." IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="aq45" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="350px" DatabaseField="aq45"
											FieldTextBoxTabIndex="48" FieldLabelText="45. I find it difficult to work out people's intentions."
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="aq46" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="350px" DatabaseField="aq46"
											FieldTextBoxTabIndex="49" FieldLabelText="46. New situations make me anxious." IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="aq47" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="350px" DatabaseField="aq47"
											FieldTextBoxTabIndex="50" FieldLabelText="47. I enjoy meeting new people." IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="aq48" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="350px" DatabaseField="aq48"
											FieldTextBoxTabIndex="51" FieldLabelText="48. I am a good diplomat." IsDoubleEntryField="True" IsReadOnly="False"
											IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="aq49" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="350px" DatabaseField="aq49"
											FieldTextBoxTabIndex="52" FieldLabelText="49. I am not very good at remembering people's date of birth."
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="aq50" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="350px" DatabaseField="aq50"
											FieldTextBoxTabIndex="53" FieldLabelText="50. I find it very easy to play games with children that involve pretending."
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
							<BR>
							<TABLE class="layout" id="table_readonly">
								<TR>
									<TD>
										<def:datafieldcontrol id="created" runat="server" FieldLabelWidth="80px" DatabaseField="created" FieldTextBoxTabIndex="55"
											FieldLabelText="created" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="DATE" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="createdBy" runat="server" FieldLabelWidth="80px" DatabaseField="createdBy" FieldTextBoxTabIndex="56"
											FieldLabelText="createdBy" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="updated" runat="server" FieldLabelWidth="80px" DatabaseField="updated" FieldTextBoxTabIndex="57"
											FieldLabelText="updated" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="DATE" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="updatedBy" runat="server" FieldLabelWidth="80px" DatabaseField="updatedBy" FieldTextBoxTabIndex="58"
											FieldLabelText="updatedBy" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
						</asp:Panel>
					</asp:Content>
