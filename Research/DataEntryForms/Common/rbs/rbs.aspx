<%@ Register TagPrefix="def" Namespace="DataEntryFramework" %>

<%@ Page language="c#" Inherits="kt_rbs.kt_rbs" CodeFile="rbs.aspx.cs"  MasterPageFile="~/UWAC.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="oBodyPlaceHolder" runat="server">
						<def:dataentrycontroller id="DataEntryController1" runat="server" DatabaseTable="all_rbs" LookupField1="id"
							LookupTextBox2Visible="False" LookupTextBox1LabelText="Subject ID:" MeasureName="Repetitive Behavior Scale"
							PrimaryKeyField="rbs_pk" VerifiedField="verified" LookupField1DataType="TEXT" 
							AllowedStudyMeasures="345,520,530,590,608,613,763,782,927,1063,1662,2616"
							
							></def:dataentrycontroller>
						<table id="table_insert" class="layout">
							<tr>
								<td><def:datafieldcontrol id="tapid" runat="server" FieldDataType="TEXT" IsInsertField="True" IsInsertValueRequired="True"
										IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="ID"
										FieldTextBoxTabIndex="2" DatabaseField="id" FieldLabelWidth="80px" FieldTextBoxWidth="80px"></def:datafieldcontrol>
								</td>
							</tr>
						</table>
						<asp:Panel ID="mainPanel" Runat="server">
							<DIV><BR>
								0-behavior does not occur<BR>
								1-mild problem<BR>
								2-moderate problem<BR>
								3-severe problem<BR>
								9-Missing/Blank<BR>
								<BR>
							</DIV>
							<TABLE class="grid" id="table_entry">
								<TR>
									<TD class="heading">I. Stereotyped Behavior Subscale</TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="RBS01" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="400px" DatabaseField="RBS01"
											FieldTextBoxTabIndex="3" FieldLabelText="1. WHOLE BODY (Body rocking, Body swaying)" IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="0,1,2,3,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="RBS02" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="400px" DatabaseField="RBS02"
											FieldTextBoxTabIndex="4" FieldLabelText="2. HEAD (Rolls head, Nods head, Turns head)" IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="0,1,2,3,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="RBS03" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="400px" DatabaseField="RBS03"
											FieldTextBoxTabIndex="5" FieldLabelText="3. HAND/FINGER (Flaps hands, Wiggles or flicks fingers, Claps h..."
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,3,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="RBS04" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="400px" DatabaseField="RBS04"
											FieldTextBoxTabIndex="6" FieldLabelText="4. LOCOMOTION (Turns in circles, Whirls, Jumps, Bounces)"
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,3,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="RBS05" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="400px" DatabaseField="RBS05"
											FieldTextBoxTabIndex="7" FieldLabelText="5. OBJECT USAGE (Spins or twirls objects, Twiddles or slaps or ..."
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,3,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="RBS06" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="400px" DatabaseField="RBS06"
											FieldTextBoxTabIndex="8" FieldLabelText="6. SENSORY (Covers eyes, Looks closely or gazes at hands or obj..."
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,3,9"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
							<BR>
							<TABLE class="grid">
								<TR>
									<TD class="heading">II. Self-Injurious Behavior Subscale</TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="RBS07" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="400px" DatabaseField="RBS07"
											FieldTextBoxTabIndex="9" FieldLabelText="7. HITS SELF WITH BODY PART (Hits or slaps head, face, or other..."
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,3,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="RBS08" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="400px" DatabaseField="RBS08"
											FieldTextBoxTabIndex="10" FieldLabelText="8. HITS SELF AGAINST SURFACE OR OBJECT (Hits or bangs head or o..."
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,3,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="RBS09" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="400px" DatabaseField="RBS09"
											FieldTextBoxTabIndex="11" FieldLabelText="9. HITS SELF WITH OBJECT (Hits or bangs head or other body area..."
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,3,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="RBS10" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="400px" DatabaseField="RBS10"
											FieldTextBoxTabIndex="12" FieldLabelText="10. BITES SELF (Bites hands, wrist, arm, lips or tongue)"
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,3,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="RBS11" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="400px" DatabaseField="RBS11"
											FieldTextBoxTabIndex="13" FieldLabelText="11. PULLS (Pulls hair or skin)" IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="0,1,2,3,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="RBS12" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="400px" DatabaseField="RBS12"
											FieldTextBoxTabIndex="14" FieldLabelText="12. RUBS OR SCRATCHES SELF (Rubs or scratches marks on arms, leg..."
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,3,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="RBS13" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="400px" DatabaseField="RBS13"
											FieldTextBoxTabIndex="15" FieldLabelText="13. INSERTS FINGER OR OBJECT (Eye-poking, Ear-poking)" IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="0,1,2,3,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="RBS14" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="400px" DatabaseField="RBS14"
											FieldTextBoxTabIndex="16" FieldLabelText="14. SKIN PICKING (Picks at skin on face, hands, arms, legs or to..."
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,3,9"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
							<BR>
							<TABLE class="grid">
								<TR>
									<TD class="heading">III. Compulsive Behavior Subscale</TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="RBS15" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="400px" DatabaseField="RBS15"
											FieldTextBoxTabIndex="17" FieldLabelText="15. ARRANGING/ORDERING (Arranges certain objects in a particular..."
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,3,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="RBS16" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="400px" DatabaseField="RBS16"
											FieldTextBoxTabIndex="18" FieldLabelText="16. COMPLETENESS (Must have doors opened or closed; Takes all it..."
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,3,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="RBS17" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="400px" DatabaseField="RBS17"
											FieldTextBoxTabIndex="19" FieldLabelText="17. WASHING/CLEANING (Excessively cleans certain body parts; Pic..."
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,3,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="RBS18" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="400px" DatabaseField="RBS18"
											FieldTextBoxTabIndex="20" FieldLabelText="18. CHECKING (Repeatedly checks doors, windows, drawers, applian..."
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,3,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="RBS19" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="400px" DatabaseField="RBS19"
											FieldTextBoxTabIndex="21" FieldLabelText="19. COUNTING (Counts items or objects; Counts to a certain numbe..."
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,3,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="RBS20" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="400px" DatabaseField="RBS20"
											FieldTextBoxTabIndex="22" FieldLabelText="20. HOARDING/SAVING (Collects, hoards or hides specific items)"
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,3,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="RBS21" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="400px" DatabaseField="RBS21"
											FieldTextBoxTabIndex="23" FieldLabelText="21. REPEATING (Need to repeat routine events; In/out door, up/do..."
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,3,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="RBS22" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="400px" DatabaseField="RBS22"
											FieldTextBoxTabIndex="24" FieldLabelText="22. TOUCH/TAP (Need to touch, tap, or rub items, surfaces, or pe..."
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,3,9"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
							<BR>
							<TABLE class="grid">
								<TR>
									<TD class="heading">IV. Ritualistic Behavior Subscale</TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="RBS23" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="400px" DatabaseField="RBS23"
											FieldTextBoxTabIndex="25" FieldLabelText="23. EATING/MEALTIME (Strongly prefers/insists on eating/drinking..."
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,3,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="RBS24" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="400px" DatabaseField="RBS24"
											FieldTextBoxTabIndex="26" FieldLabelText="24. SLEEPING/BEDTIME (Insists on certain pre-bedtime routines; A..."
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,3,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="RBS25" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="400px" DatabaseField="RBS25"
											FieldTextBoxTabIndex="27" FieldLabelText="25. SELF-CARE - BATHROOM AND DRESSING (Insists on specific order..."
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,3,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="RBS26" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="400px" DatabaseField="RBS26"
											FieldTextBoxTabIndex="28" FieldLabelText="26. TRAVEL/TRANSPORTATION (Insists on taking certain routes/path..."
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,3,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="RBS27" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="400px" DatabaseField="RBS27"
											FieldTextBoxTabIndex="29" FieldLabelText="27. PLAY/LEISURE (Insists on certain play activities; Follows a ..."
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,3,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="RBS28" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="400px" DatabaseField="RBS28"
											FieldTextBoxTabIndex="30" FieldLabelText="28. COMMUNICATION/SOCIAL INTERACTIONS (Repeats same topic(s) dur..."
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,3,9"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
							<BR>
							<TABLE class="grid">
								<TR>
									<TD class="heading">V. Sameness Behavior Subscale</TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="RBS29" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="400px" DatabaseField="RBS29"
											FieldTextBoxTabIndex="31" FieldLabelText="29. Insists that things remain in the same place(s) (e.g., toys,..."
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,3,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="RBS30" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="400px" DatabaseField="RBS30"
											FieldTextBoxTabIndex="32" FieldLabelText="30. Objects to visiting new places" IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="0,1,2,3,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="RBS31" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="400px" DatabaseField="RBS31"
											FieldTextBoxTabIndex="33" FieldLabelText="31. Becomes upset if interrupted in what he/she is doing"
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,3,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="RBS32" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="400px" DatabaseField="RBS32"
											FieldTextBoxTabIndex="34" FieldLabelText="32. Insists on walking in a particular pattern (e.g., straight l..."
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,3,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="RBS33" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="400px" DatabaseField="RBS33"
											FieldTextBoxTabIndex="35" FieldLabelText="33. Insists on sitting at the same place" IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="0,1,2,3,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="RBS34" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="400px" DatabaseField="RBS34"
											FieldTextBoxTabIndex="36" FieldLabelText="34. Dislikes changes in appearance or behavior of the people aro..."
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,3,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="RBS35" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="400px" DatabaseField="RBS35"
											FieldTextBoxTabIndex="37" FieldLabelText="35. Insists on using a particular door" IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="0,1,2,3,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="RBS36" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="400px" DatabaseField="RBS36"
											FieldTextBoxTabIndex="38" FieldLabelText="36. Likes the same CD, tape, record or piece of music played con..."
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,3,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="RBS37" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="400px" DatabaseField="RBS37"
											FieldTextBoxTabIndex="39" FieldLabelText="37. Resists changing activities; Difficulty with transitions"
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,3,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="RBS38" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="400px" DatabaseField="RBS38"
											FieldTextBoxTabIndex="40" FieldLabelText="38. Insists on same routine, household, school or work schedule ..."
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,3,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="RBS39" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="400px" DatabaseField="RBS39"
											FieldTextBoxTabIndex="41" FieldLabelText="39. Insists that specific things take place at specific times"
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,3,9"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
							<BR>
							<TABLE class="grid">
								<TR>
									<TD class="heading">VI. Restricted Behavior Subscale</TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="RBS40" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="400px" DatabaseField="RBS40"
											FieldTextBoxTabIndex="42" FieldLabelText="40. Fascination, preoccupation with one subject or activity (e.g..."
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,3,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="RBS41" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="400px" DatabaseField="RBS41"
											FieldTextBoxTabIndex="43" FieldLabelText="41. Strongly attached to one specific object" IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="0,1,2,3,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="RBS42" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="400px" DatabaseField="RBS42"
											FieldTextBoxTabIndex="44" FieldLabelText="42. Preoccupation with part(s) of object rather than the whole o..."
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,3,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="RBS43" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="400px" DatabaseField="RBS43"
											FieldTextBoxTabIndex="45" FieldLabelText="43. Fascination, preoccupation with movement/things that move (e..."
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,3,9"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
							<BR>
							<TABLE class="grid">
								<TR>
									<TD class="heading">VII. Vocal/Verbal Behavior Subscale</TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="RBS44" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="400px" DatabaseField="RBS44"
											FieldTextBoxTabIndex="46" FieldLabelText="44. Repetitive speech (saying the same word or phrase over and o..."
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,3,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="RBS45" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="400px" DatabaseField="RBS45"
											FieldTextBoxTabIndex="47" FieldLabelText="45. Talks to self loudly " IsDoubleEntryField="True" IsReadOnly="False"
											IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="0,1,2,3,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="RBS46" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="400px" DatabaseField="RBS46"
											FieldTextBoxTabIndex="48" FieldLabelText="46. Makes odd/unusual noises (infantile squeals, animal like noi..."
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,3,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="RBS47" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="400px" DatabaseField="RBS47"
											FieldTextBoxTabIndex="49" FieldLabelText="47. Verbal rituals (compulsions to say things over and over or i..."
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,3,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="RBS48" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="400px" DatabaseField="RBS48"
											FieldTextBoxTabIndex="50" FieldLabelText="48. Excessive questioning" IsDoubleEntryField="True" IsReadOnly="False"
											IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="0,1,2,3,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="RBS49" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="400px" DatabaseField="RBS49"
											FieldTextBoxTabIndex="51" FieldLabelText="49. Preoccupation with particular topics" IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="0,1,2,3,9"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
							<BR>
							<TABLE class="layout" id="table_readonly">
								<TR>
									<TD>
										<def:datafieldcontrol id="created" runat="server" FieldLabelWidth="80px" DatabaseField="created" FieldTextBoxTabIndex="54"
											FieldLabelText="created" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="DATE" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="createdBy" runat="server" FieldLabelWidth="80px" DatabaseField="createdBy" FieldTextBoxTabIndex="55"
											FieldLabelText="createdBy" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="updated" runat="server" FieldLabelWidth="80px" DatabaseField="updated" FieldTextBoxTabIndex="56"
											FieldLabelText="updated" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="DATE" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="updatedBy" runat="server" FieldLabelWidth="80px" DatabaseField="updatedBy" FieldTextBoxTabIndex="57"
											FieldLabelText="updatedBy" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
						</asp:Panel>
					</asp:Content>
