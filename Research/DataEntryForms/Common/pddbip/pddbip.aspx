    <%@ Register TagPrefix="def" Namespace="DataEntryFramework3" %> 
<%@ Page language="c#" MasterPageFile="~/UWAC.master"  Title="PDDBI-P Data Entry" %>
<asp:Content ID="Content1" ContentPlaceHolderID="oBodyPlaceHolder" runat="server">


<def:dataentrycontroller id="DataEntryController1" runat="server" DatabaseTable="all_pddbip" PrimaryKeyField="pdp_pk"/>


						<table class="tblinsert" id="table_insert">
							<tr>
								<td><def:datafieldcontrol id="id" runat="server" DatabaseField="id" FieldTextBoxTabIndex="4" FieldLabelText="ID"
										IsDoubleEntryField="False" IsReadOnly="False" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="True"
										IsInsertField="True" FieldDataType="TEXT" FieldLabelWidth="60px" FieldTextBoxWidth="80px"></def:datafieldcontrol>
                                        
                                <def:datafieldcontrol runat="server" id="indexnum" DatabaseField="indexnum" IsInsertField="true" FieldTextBoxTextDefault="1" FieldLabelWidth="80px" FieldTextBoxWidth="40px"></def:datafieldcontrol>

                                        </td>
							</tr>
						</table>
						<asp:Panel ID="mainPanel" Runat="server">
							<BR>
							<TABLE class="layout" id="table_entry">
								<TR>
									<TD>
										<def:datafieldcontrol id="pdpdate" runat="server" FieldTextBoxWidth="80px" FieldLabelWidth="60px" FieldDataType="DATE"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="Date" FieldTextBoxTabIndex="5" DatabaseField="pdpdate"
											FormatString="{0:d}"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>1=Mother (bio, step, adoptive)<BR>
										2=Father (bio, step, adoptive)<BR>
										3=Primary Caregiver (specify below)<BR>
										4=Other (specify below)<BR>
										9=Missing/Unknown<BR>
										<def:datafieldcontrol id="pdprat" runat="server" FieldTextBoxWidth="80px" FieldLabelWidth="60px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="Respondant" FieldTextBoxTabIndex="6"
											DatabaseField="pdprat"></def:datafieldcontrol><BR>
										<def:datafieldcontrol id="pdprato" runat="server" FieldTextBoxWidth="100px" FieldLabelWidth="100px" FieldDataType="TEXT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False"
											IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="(specify if 3 or 4)" FieldTextBoxTabIndex="7"
											DatabaseField="pdprato"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
							<BR>
							<TABLE class="grid">
								<TR>
									<TD class="heading"><B>0</B>=Does Not Show Behavior<BR>
										<B>1</B>=Rarely Shows Behavior<BR>
										<B>2</B>=Sometimes/Partially Shows Behavior<BR>
										<B>3</B>=Usually/Typically Shows Behavior<BR>
										<B>4</B>=Don't Understand<BR>
										<B>9</B>=Missing/Blank
									</TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="pdp001" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="1. Stares at or looks out of sides of eyes at his/her own image in mirror "
											FieldTextBoxTabIndex="12" DatabaseField="pdp001" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="pdp002" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="2. Stares at or looks out of sides of eyes at objects (e.g., toys, strings) "
											FieldTextBoxTabIndex="13" DatabaseField="pdp002" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="pdp003" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="3. Stares at or looks out of sides of eyes at his/her fingers or hands "
											FieldTextBoxTabIndex="14" DatabaseField="pdp003" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="pdp004" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="4. Stares at or looks out of sides of eyes at lights or shiny objects "
											FieldTextBoxTabIndex="15" DatabaseField="pdp004" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="pdp005" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="5. Licks or mouths objects " FieldTextBoxTabIndex="16"
											DatabaseField="pdp005" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="pdp006" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="6. Licks or mouths hands " FieldTextBoxTabIndex="17"
											DatabaseField="pdp006" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="pdp007" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="7. Chews on objects " FieldTextBoxTabIndex="18"
											DatabaseField="pdp007" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="pdp008" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="8. Eats (swallows) inedible (non-food) objects (e.g., dirt, paper, plastic) "
											FieldTextBoxTabIndex="19" DatabaseField="pdp008" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="pdp009" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="9. Rubs or taps own face or arms repetitively "
											FieldTextBoxTabIndex="20" DatabaseField="pdp009" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="pdp010" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="10. Rubs or taps own torso (i.e., stomach, chest) or legs repetitively "
											FieldTextBoxTabIndex="21" DatabaseField="pdp010" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="pdp011" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="11. Rubs or taps rough objects (e.g., sandpaper, unshaved faces) repetitively "
											FieldTextBoxTabIndex="22" DatabaseField="pdp011" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="pdp012" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="12. Rubs liquid-like substances (e.g., water, saliva) repetitively "
											FieldTextBoxTabIndex="23" DatabaseField="pdp012" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="pdp013" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="13. Flaps hands up and down " FieldTextBoxTabIndex="24"
											DatabaseField="pdp013" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="pdp014" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="14. Makes odd or unusual finger movements (e.g., flicks fingers) "
											FieldTextBoxTabIndex="25" DatabaseField="pdp014" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="pdp015" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="15. Holds fingers, hands, or arms in odd or unusual postures (e.g., spreads fingers apart, holds hand bent at the wrist, holds arms out to the side) "
											FieldTextBoxTabIndex="26" DatabaseField="pdp015" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="pdp016" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="16. Jumps repetitively " FieldTextBoxTabIndex="27"
											DatabaseField="pdp016" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="pdp017" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="17. Repetitively twiddles or bangs objects or flaps objects back and forth "
											FieldTextBoxTabIndex="28" DatabaseField="pdp017" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="pdp018" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="18. Spins objects (e.g., wheels of toy cars, strings) in a repetitive manner "
											FieldTextBoxTabIndex="29" DatabaseField="pdp018" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="pdp019" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="19. Throws objects around, rips or tears paper or other material "
											FieldTextBoxTabIndex="30" DatabaseField="pdp019" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="pdp020" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="20. Repetitively moves objects back and forth (e.g., turns pages back and forth, opens and closes doors, turns lights on and off) "
											FieldTextBoxTabIndex="31" DatabaseField="pdp020" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="pdp021" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="21. Tries to move furniture back to its original location when it is moved by others "
											FieldTextBoxTabIndex="32" DatabaseField="pdp021" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="pdp022" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="22. Moves objects back to their original locations when they are moved by others (e.g., salt and pepper shakers, pictures, toys, doors, window shades) "
											FieldTextBoxTabIndex="33" DatabaseField="pdp022" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="pdp023" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="23. Insists that certain room lights stay on or stay off at inappropriate times "
											FieldTextBoxTabIndex="34" DatabaseField="pdp023" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="pdp024" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="24. Inappropriately refuses to eat or drink foods that are the 'wrong' color, appearance, or brand Resistance to Change in Schedules/Routines"
											FieldTextBoxTabIndex="35" DatabaseField="pdp024" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="pdp025" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="25. Becomes upset when things don't occur at their usual times (e.g., buses, trains, meals) "
											FieldTextBoxTabIndex="36" DatabaseField="pdp025" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="pdp026" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="26. Resists changing from one activity to another when requested to do so by familiar people "
											FieldTextBoxTabIndex="37" DatabaseField="pdp026" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="pdp027" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="27. Becomes upset when own schedule or order of the routine is changed (e.g., time when going to school is changed, when vacations interrupt schedule, when time going to sleep is changed) "
											FieldTextBoxTabIndex="38" DatabaseField="pdp027" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="pdp028" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="28. Dislikes surprises, feels uncomfortable trying new activities, or has difficulty adjusting to changes in routine at home, school, or work "
											FieldTextBoxTabIndex="39" DatabaseField="pdp028" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="pdp029" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="29. Inappropriately needs to carry or hold on to objects (e.g., toys, paper clips, strings) "
											FieldTextBoxTabIndex="40" DatabaseField="pdp029" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="pdp030" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="30. Insists on taking the same route from one place to another or taking the same route from one part of a room to another part of the same room "
											FieldTextBoxTabIndex="41" DatabaseField="pdp030" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="pdp031" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="31. Resists changing own location in room or wants others to stay in some fixed place "
											FieldTextBoxTabIndex="42" DatabaseField="pdp031" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="pdp032" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="32. Insists that others say something over and over or insists that others say a certain word or phrase or insists on listening to the same song over and over or must smell, mouth, touch, or tap some object before doing something else or insists on watching the same video or movie or part of video or movie over and over "
											FieldTextBoxTabIndex="43" DatabaseField="pdp032" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="pdp033" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="33. Greets strangers in odd or unusual ways for his/her age (e.g., by asking repetitive questions, asking questions on idiosyncratic topics that would be unknown to the stranger, inappropriately asking their names, hitting) "
											FieldTextBoxTabIndex="44" DatabaseField="pdp033" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="pdp034" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="34. Stands too closely to others when talking to them, forcing others to back away "
											FieldTextBoxTabIndex="45" DatabaseField="pdp034" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="pdp035" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="35. Stares at others for too long a time when talking, making others uncomfortable "
											FieldTextBoxTabIndex="46" DatabaseField="pdp035" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="pdp036" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="36. Approaches others inappropriately (e.g., touches them inappropriately, makes obscene comments)"
											FieldTextBoxTabIndex="47" DatabaseField="pdp036" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="pdp037" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="37. Is overly serious in social situations; doesn't understand the humor in situations that others his/her age would consider funny "
											FieldTextBoxTabIndex="48" DatabaseField="pdp037" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="pdp038" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="38. Performs private actions in front of others, that others his/her age would consider inappropriate (e.g., picking nose) "
											FieldTextBoxTabIndex="49" DatabaseField="pdp038" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="pdp039" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="39. Has problems understanding the need to be polite (e.g., the need to apologize) more than others his/her age or has problems understanding social relationships (e.g., boyfriend, girlfriend, marriage) more than others his/her age "
											FieldTextBoxTabIndex="50" DatabaseField="pdp039" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="pdp040" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="40. Laughs or smiles for no apparent reason or laughs or smiles at the wrong time (e.g., when others are crying) "
											FieldTextBoxTabIndex="51" DatabaseField="pdp040" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="pdp041" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="41. Ignores the social approaches of people his/her own age "
											FieldTextBoxTabIndex="52" DatabaseField="pdp041" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="pdp042" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="42. Is inappropriately abrupt and dismissive of others (e.g., cuts off conversations abruptly or walks away, showing little concern for how these actions affect others) "
											FieldTextBoxTabIndex="53" DatabaseField="pdp042" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="pdp043" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="43. Actively avoids (e,g., runs away, turns away) other people who are his/her age when approached by them "
											FieldTextBoxTabIndex="54" DatabaseField="pdp043" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="pdp044" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="44. Says inappropriate things when approached by others (e,g., asks personal questions, makes embarrassing comments) "
											FieldTextBoxTabIndex="55" DatabaseField="pdp044" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="pdp045" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="45. Uses a questioning tone of voice when saying things that aren't questions "
											FieldTextBoxTabIndex="56" DatabaseField="pdp045" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="pdp046" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="46. Puts an unusual stress on words when speaking (not due to regional accent) "
											FieldTextBoxTabIndex="57" DatabaseField="pdp046" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="pdp047" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="47. Speaks too loudly, causing others to tell himlher to speak quietly "
											FieldTextBoxTabIndex="58" DatabaseField="pdp047" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="pdp048" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="48. Speaks too softly, causing others to tell him/her to speak louder "
											FieldTextBoxTabIndex="59" DatabaseField="pdp048" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="pdp049" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="49. Has difficulty understanding variations in sentence structure for a given sentence topic (e.g., doesn't answer when asked 'Can you tell me your name?' but answers when asked 'What's your name?', i.e., he/she doesn't understand that these are the same question) "
											FieldTextBoxTabIndex="60" DatabaseField="pdp049" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="pdp050" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="50. Echoes request of other meaninglessly (like a parrot) "
											FieldTextBoxTabIndex="61" DatabaseField="pdp050" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="pdp051" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="51. Shows understanding by repeating all or part of a question and then performing an action (e.g., when asked 'Do you want to eat?' says 'Do you want to eat' or 'Eat' or 'Want to eat' and then gets up to go to kitchen) "
											FieldTextBoxTabIndex="62" DatabaseField="pdp051" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="pdp052" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="52. Says a word, phrase, or sentence that is a reaction to part of a sentence said to him/her, but has no relation to the sentence topic (e.g., parent asks where ball is and he/she says 'Ball is blue,' or when asked where his/her mouth is he/she says 'Mouth is for eating') or repeats words or phrases heard earlier but out of context (i.e., delayed echolalia) "
											FieldTextBoxTabIndex="63" DatabaseField="pdp052" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="pdp053" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="53. Perseverates (i.e., repeats over and over) on words or phrases and is insensitive to the reactions or comments of others "
											FieldTextBoxTabIndex="64" DatabaseField="pdp053" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="pdp054" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="54. Perseverates (i.e., repeats over and over) on topic or theme and is insensitive to the reactions or comments of others (e.g., insists on talking about train schedules, game shows, even when partner tells him/her that he/she is not interested) "
											FieldTextBoxTabIndex="65" DatabaseField="pdp054" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="pdp055" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="55. Starts to talk to himself /herse1f during a conversation with others about a given topic "
											FieldTextBoxTabIndex="66" DatabaseField="pdp055" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="pdp056" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="56. Talks about topics and assumes that his/her conversational partner understands what he/she is talking about (e.g., talks about TV programs or videos to strangers and assumes that the stranger knows about the program or video) "
											FieldTextBoxTabIndex="67" DatabaseField="pdp056" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="pdp057" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="57. Restless " FieldTextBoxTabIndex="68"
											DatabaseField="pdp057" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="pdp058" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="58. Fidgets " FieldTextBoxTabIndex="69"
											DatabaseField="pdp058" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="pdp059" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="59. Climbs on furniture " FieldTextBoxTabIndex="70"
											DatabaseField="pdp059" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="pdp060" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="60. Wanders around room " FieldTextBoxTabIndex="71"
											DatabaseField="pdp060" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="pdp061" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="61. Restricted range (e.g., problems showing happiness, sadness, fear, guilt, disgust) and/or reduced intensity of emotions (i.e., doesn't react as strongly as most others would) "
											FieldTextBoxTabIndex="72" DatabaseField="pdp061" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="pdp062" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="62. Stares into space " FieldTextBoxTabIndex="73"
											DatabaseField="pdp062" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="pdp063" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="63. Fails to respond to requests, name, or touch "
											FieldTextBoxTabIndex="74" DatabaseField="pdp063" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="pdp064" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="64. Requires physical or verbal prompts to respond to requests that he/she knows how to do "
											FieldTextBoxTabIndex="75" DatabaseField="pdp064" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="pdp065" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="65. Wants to stay up, has difficulty falling asleep "
											FieldTextBoxTabIndex="76" DatabaseField="pdp065" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="pdp066" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="66. Awakens one or more times at night with difficulty in falling back to sleep "
											FieldTextBoxTabIndex="77" DatabaseField="pdp066" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="pdp067" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="67. Goes to sleep at appropriate time but awakens unusually early and stays awake the rest of the day "
											FieldTextBoxTabIndex="78" DatabaseField="pdp067" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="pdp068" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="68. Goes to sleep later than others in family and has difficulty awakening morning "
											FieldTextBoxTabIndex="79" DatabaseField="pdp068" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="pdp069" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="69. Pouts " FieldTextBoxTabIndex="80"
											DatabaseField="pdp069" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="pdp070" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="70. Looks sad " FieldTextBoxTabIndex="81"
											DatabaseField="pdp070" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="pdp071" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="71. Whimpers " FieldTextBoxTabIndex="82"
											DatabaseField="pdp071" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="pdp072" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="72. Looks depressed (e.g., mopes around, seems despondent) Anxiousness When Away From Caregiver, Other Significant Figure, or in New Situation"
											FieldTextBoxTabIndex="83" DatabaseField="pdp072" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="pdp073" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="73. Seems unusually vigilant (e.g., overly alert; scanning room, doors, windows) as if he/she is anxiously looking to see if his/her caregiver is coming back "
											FieldTextBoxTabIndex="84" DatabaseField="pdp073" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="pdp074" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="74. Looks concerned or worried " FieldTextBoxTabIndex="85"
											DatabaseField="pdp074" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="pdp075" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="75. Seems anxious, jumpy, or overly aroused (e.g., can't stay still) "
											FieldTextBoxTabIndex="86" DatabaseField="pdp075" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="pdp076" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="76. Cowers, hides, or clings to others "
											FieldTextBoxTabIndex="87" DatabaseField="pdp076" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="pdp077" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="77. Shows discomfort with loud or high-pitched noises (e.g., vacuum, blender, fire alarms) "
											FieldTextBoxTabIndex="88" DatabaseField="pdp077" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="pdp078" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="78. Shows unusual discomfort when hearing certain songs or TV commercials, etc. "
											FieldTextBoxTabIndex="89" DatabaseField="pdp078" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="pdp079" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="79. Is unusually angry or frightened when others cry or scream "
											FieldTextBoxTabIndex="90" DatabaseField="pdp079" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="pdp080" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="80. Is unusually startled by sudden noises "
											FieldTextBoxTabIndex="91" DatabaseField="pdp080" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="pdp081" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="81. Unusually afraid of visiting new places or trying new activities "
											FieldTextBoxTabIndex="92" DatabaseField="pdp081" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="pdp082" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="82. Unusually afraid of the dark " FieldTextBoxTabIndex="93"
											DatabaseField="pdp082" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="pdp083" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="83. Unusually afraid of meeting new people, going to parties, etc. "
											FieldTextBoxTabIndex="94" DatabaseField="pdp083" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="pdp084" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="84. Unusually afraid of masks, monsters, ghosts, etc. "
											FieldTextBoxTabIndex="95" DatabaseField="pdp084" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="pdp085" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="85. Tries to or leaves room when with unfamiliar people or in unfamiliar situations "
											FieldTextBoxTabIndex="96" DatabaseField="pdp085" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="pdp086" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="86. Retreats to corner or goes under table when with unfamiliar people or in unfamiliar situations "
											FieldTextBoxTabIndex="97" DatabaseField="pdp086" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="pdp087" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="87. Turns eyes, head, or body away from others "
											FieldTextBoxTabIndex="98" DatabaseField="pdp087" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="pdp088" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="88. Avoids groups or crowds " FieldTextBoxTabIndex="99"
											DatabaseField="pdp088" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="pdp089" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="89. Hits self " FieldTextBoxTabIndex="100"
											DatabaseField="pdp089" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="pdp090" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="90. Bangs head on smooth surfaces " FieldTextBoxTabIndex="101"
											DatabaseField="pdp090" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="pdp091" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="91. Bites self " FieldTextBoxTabIndex="102"
											DatabaseField="pdp091" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="pdp092" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="92. Scratches self " FieldTextBoxTabIndex="103"
											DatabaseField="pdp092" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="pdp093" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="93. Becomes fearful, frightened, or panicky for no reason "
											FieldTextBoxTabIndex="104" DatabaseField="pdp093" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="pdp094" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="94. Cries for no reason " FieldTextBoxTabIndex="105"
											DatabaseField="pdp094" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="pdp095" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="95. Angry for no reason " FieldTextBoxTabIndex="106"
											DatabaseField="pdp095" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="pdp096" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="96. Moody, emotions change rapidly "
											FieldTextBoxTabIndex="107" DatabaseField="pdp096" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="pdp097" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="97. Shouts or screams " FieldTextBoxTabIndex="108"
											DatabaseField="pdp097" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="pdp098" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="98. Hits self or others or kicks others "
											FieldTextBoxTabIndex="109" DatabaseField="pdp098" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="pdp099" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="99. Tantrums " FieldTextBoxTabIndex="110"
											DatabaseField="pdp099" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="pdp100" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="100. Throws things, becomes destructive "
											FieldTextBoxTabIndex="111" DatabaseField="pdp100" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="pdp101" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="101. Hits or kicks " FieldTextBoxTabIndex="112"
											DatabaseField="pdp101" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="pdp102" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="102. Scratches or pulls hair " FieldTextBoxTabIndex="113"
											DatabaseField="pdp102" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="pdp103" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="103. Bites " FieldTextBoxTabIndex="114"
											DatabaseField="pdp103" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="pdp104" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="104. Throws object(s) at others " FieldTextBoxTabIndex="115"
											DatabaseField="pdp104" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="pdp105" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="105. Cranky, irritable " FieldTextBoxTabIndex="116"
											DatabaseField="pdp105" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="pdp106" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="106. Difficult to please, not easily satisfied "
											FieldTextBoxTabIndex="117" DatabaseField="pdp106" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="pdp107" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="107. Takes a long time to calm down when upset "
											FieldTextBoxTabIndex="118" DatabaseField="pdp107" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="pdp108" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="108. Easily frustrated " FieldTextBoxTabIndex="119"
											DatabaseField="pdp108" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="pdp109" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="109. Pays attention to other's face when given instructions or when asked questions "
											FieldTextBoxTabIndex="120" DatabaseField="pdp109" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="pdp110" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="110. Looks at other to seek feedback and/or praise "
											FieldTextBoxTabIndex="121" DatabaseField="pdp110" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="pdp111" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="111. Looks when called or praised " FieldTextBoxTabIndex="122"
											DatabaseField="pdp111" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="pdp112" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="112. Looks at others in order to share the experience with them when he/she completes a task successfully, when an unexpected or happy event occurs, etc. "
											FieldTextBoxTabIndex="123" DatabaseField="pdp112" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="pdp113" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="113. Smiles when praised " FieldTextBoxTabIndex="124"
											DatabaseField="pdp113" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="pdp114" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="114. Smiles when a familiar song is sung, when a familiar name is mentioned, when he/she sees a familiar picture, etc. "
											FieldTextBoxTabIndex="125" DatabaseField="pdp114" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="pdp115" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="115. Shows affection (e.g., hugs, kisses) toward caregivers, friends, etc. "
											FieldTextBoxTabIndex="126" DatabaseField="pdp115" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="pdp116" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="116. Starts to smile in anticipation of teasing, tickling, etc. "
											FieldTextBoxTabIndex="127" DatabaseField="pdp116" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="pdp117" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="117. Shows recognition of pictures of familiar people, animals, etc., by spontaneously pointing to or touching the pictures when he/she sees them "
											FieldTextBoxTabIndex="128" DatabaseField="pdp117" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="pdp118" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="118. Spontaneously nods yes and/or shakes head no correctly when asked questions "
											FieldTextBoxTabIndex="129" DatabaseField="pdp118" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="pdp119" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="119. Moves arm(s)/hand(s) in beckoning motion to signal others to come to him/her "
											FieldTextBoxTabIndex="130" DatabaseField="pdp119" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="pdp120" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="120. Gestures and looks back and forth to others in order to share the experience with them (e.g., sees airplane and points at it while looking back to other and then back to the airplane) "
											FieldTextBoxTabIndex="131" DatabaseField="pdp120" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="pdp121" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="121. Completely stops inappropriate behavior for at least a day when warned or punished "
											FieldTextBoxTabIndex="132" DatabaseField="pdp121" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="pdp122" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="122. Stops doing inappropriate behavior when sees significant others approach him/her "
											FieldTextBoxTabIndex="133" DatabaseField="pdp122" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="pdp123" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="123. Avoids inappropriate behavior when significant others are around (e.g., behaves self when caregivers are around but mayor may not misbehave when they leave) "
											FieldTextBoxTabIndex="134" DatabaseField="pdp123" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="pdp124" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="124. Avoids inappropriate behavior (i.e., behaves self) in public situations (e.g., stores, malls) "
											FieldTextBoxTabIndex="135" DatabaseField="pdp124" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="pdp125" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="125. Selects his/her own toys to play with and allows other(s) to play along "
											FieldTextBoxTabIndex="136" DatabaseField="pdp125" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="pdp126" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="126. Watches others and plays near them "
											FieldTextBoxTabIndex="137" DatabaseField="pdp126" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="pdp127" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="127. Initiates (e.g., pulls, asks) simple social play with others "
											FieldTextBoxTabIndex="138" DatabaseField="pdp127" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="pdp128" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="128. Engages in cooperative, helpful, turn-taking play where both partners work on a common goal or theme together (e.g., putting 50-piece jigsaw puzzle together; cooperative team board or card game) "
											FieldTextBoxTabIndex="139" DatabaseField="pdp128" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="pdp129" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="129. Shows recognition of toy or picture representation of object or animal (e.g., makes sounds of animal or object when sees picture of the same or real object, pushes toy car back and forth) "
											FieldTextBoxTabIndex="140" DatabaseField="pdp129" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="pdp130" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="130. Shows active awareness of toy representation of object or animal (e.g., makes sounds of animal and makes toy animal move, makes car move and says 'beep' ) "
											FieldTextBoxTabIndex="141" DatabaseField="pdp130" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="pdp131" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="131. Shows more complex imaginative toy play (e.g., feeds doll, makes Superman'' toy fly) "
											FieldTextBoxTabIndex="142" DatabaseField="pdp131" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="pdp132" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="132. Uses available material imaginatively for novel purposes (e.g., makes paper airplane and flies it) "
											FieldTextBoxTabIndex="143" DatabaseField="pdp132" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="pdp133" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="133. Tries to physically or verbally comfort others when they are sad "
											FieldTextBoxTabIndex="144" DatabaseField="pdp133" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="pdp134" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="134. Offers help when others are in need of assistance (e.g., tries to open doors for others when they cannot) "
											FieldTextBoxTabIndex="145" DatabaseField="pdp134" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="pdp135" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="135. Offers help when others are sick (e.g., offers tissues to someone if he/she is sneezing or sniffling) "
											FieldTextBoxTabIndex="146" DatabaseField="pdp135" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="pdp136" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="136. Offers help when others are physically uncomfortable (e.g., gets someone a coat if he/she is cold, gets a bandage if someone is cut) "
											FieldTextBoxTabIndex="147" DatabaseField="pdp136" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="pdp137" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="137. Seeks affection (e.g., hugs, kisses) from caregivers or siblings "
											FieldTextBoxTabIndex="148" DatabaseField="pdp137" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="pdp138" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="138. Spontaneously and appropriately shows affection toward caregivers or siblings "
											FieldTextBoxTabIndex="149" DatabaseField="pdp138" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="pdp139" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="139. Has a special friend, his/her age, that he/she enjoys being around "
											FieldTextBoxTabIndex="150" DatabaseField="pdp139" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="pdp140" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="140. Initiates socially acceptable play or conversations with others at parties "
											FieldTextBoxTabIndex="151" DatabaseField="pdp140" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="pdp141" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="141. Can imitate tongue clicking " FieldTextBoxTabIndex="152"
											DatabaseField="pdp141" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="pdp142" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="142. Can imitate coughing " FieldTextBoxTabIndex="153"
											DatabaseField="pdp142" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="pdp143" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="143. Can imitate sticking tongue out "
											FieldTextBoxTabIndex="154" DatabaseField="pdp143" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="pdp144" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="144. Can imitate peek-a-boo " FieldTextBoxTabIndex="155"
											DatabaseField="pdp144" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="pdp145" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="145. Can make 'ih' sounds as in 'pit' "
											FieldTextBoxTabIndex="156" DatabaseField="pdp145" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="pdp146" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="146. Can make 'eh' sounds as in 'pet' "
											FieldTextBoxTabIndex="157" DatabaseField="pdp146" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="pdp147" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="147. Can make 'aa' sounds as in 'pat' "
											FieldTextBoxTabIndex="158" DatabaseField="pdp147" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="pdp148" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="148. Can make '00' sounds as in 'boot' "
											FieldTextBoxTabIndex="159" DatabaseField="pdp148" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="pdp149" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="149. Can make 'p' sounds as in 'pill,' 'apple,' and 'up' "
											FieldTextBoxTabIndex="160" DatabaseField="pdp149" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="pdp150" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="150. Can make 't' sounds as in 'talk,' 'attic,' and 'bat' "
											FieldTextBoxTabIndex="161" DatabaseField="pdp150" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="pdp151" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="151. Can make 'ss' sounds as in 'song,' 'messy,' and 'yes' "
											FieldTextBoxTabIndex="162" DatabaseField="pdp151" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="pdp152" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="152. Can make 'g' sounds as in 'go,' 'again,' and 'bag' "
											FieldTextBoxTabIndex="163" DatabaseField="pdp152" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="pdp153" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="153. Can make 'ay' sounds as in 'bay' "
											FieldTextBoxTabIndex="164" DatabaseField="pdp153" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="pdp154" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="154. Can make 'uy' sounds as in 'buy' "
											FieldTextBoxTabIndex="165" DatabaseField="pdp154" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="pdp155" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="155. Can make 'ow' sounds as in 'bout' "
											FieldTextBoxTabIndex="166" DatabaseField="pdp155" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="pdp156" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="156. Can make 'oa' sounds as in 'boat' "
											FieldTextBoxTabIndex="167" DatabaseField="pdp156" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="pdp157" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="157. Uses negatives correctly (e.g., won't, can't, never) "
											FieldTextBoxTabIndex="168" DatabaseField="pdp157" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="pdp158" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="158. Uses the future tense correctly (e.g., 'He will go to school') "
											FieldTextBoxTabIndex="169" DatabaseField="pdp158" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="pdp159" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="159. Spontaneously asks 'how' and 'why' questions (e.g., 'How did he do?' 'Why is it hot?') "
											FieldTextBoxTabIndex="170" DatabaseField="pdp159" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="pdp160" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="160. Spontaneously uses sentences with the verb 'to have' (e.g., 'I have already eaten that.') "
											FieldTextBoxTabIndex="171" DatabaseField="pdp160" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="pdp161" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="161. Uses past tense rule for irregular verbs correctly (e.g., 'I ran,' 'He sat,' 'It flew') "
											FieldTextBoxTabIndex="172" DatabaseField="pdp161" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="pdp162" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="162. Uses 's.' in the third person singular (e.g., 'He goes. to school.') "
											FieldTextBoxTabIndex="173" DatabaseField="pdp162" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="pdp163" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="163. Uses the regular past tense 'ed' rule correctly (e.g., 'He pushed') "
											FieldTextBoxTabIndex="174" DatabaseField="pdp163" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="pdp164" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="164. Uses the 'to be' verb form correctly (e.g., is, are, am, been) "
											FieldTextBoxTabIndex="175" DatabaseField="pdp164" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="pdp165" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="165. Uses sentences with indefinite and definite adjectives (e.g., 'Give me each one,' 'I want every piece of candy,' 'Give me some') "
											FieldTextBoxTabIndex="176" DatabaseField="pdp165" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="pdp166" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="166. Uses sentences with comparatives (e.g., 'He runs faster than me,' 'He's the slowest kid') "
											FieldTextBoxTabIndex="177" DatabaseField="pdp166" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="pdp167" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="167. Uses sentences with adverbs (e.g., 'He ran slowly,' 'She ate quickly') "
											FieldTextBoxTabIndex="178" DatabaseField="pdp167" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="pdp168" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="168. Uses sentences with past participles (e.g., 'It's all gone,' 'I've eaten that already,' 'Where have you been?') "
											FieldTextBoxTabIndex="179" DatabaseField="pdp168" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="pdp169" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="169. Expresses interest in what he/she is saying by his/her tone of voice "
											FieldTextBoxTabIndex="180" DatabaseField="pdp169" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="pdp170" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="170. Expresses happiness with his/her tone of voice when speaking "
											FieldTextBoxTabIndex="181" DatabaseField="pdp170" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="pdp171" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="171. Expresses excitement with tone of voice when speaking "
											FieldTextBoxTabIndex="182" DatabaseField="pdp171" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="pdp172" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="172. Uses tone of voice to add emphasis to content of speech when speaking "
											FieldTextBoxTabIndex="183" DatabaseField="pdp172" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="pdp173" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="173. Adds more details to a sentence if others tell him/her that they don't understand what he/she has said "
											FieldTextBoxTabIndex="184" DatabaseField="pdp173" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="pdp174" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="174. Adds more details to a sentence if others' body language, laughter, or facial expressions indicate that they don't understand what he/she has said "
											FieldTextBoxTabIndex="185" DatabaseField="pdp174" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="pdp175" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="175. Listens to, waits for others to speak during conversations, and appropriately acknowledges their statements (e.g., 'I understand what you're saying but. ..') "
											FieldTextBoxTabIndex="186" DatabaseField="pdp175" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="pdp176" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="176. Understands the need to provide a relevant amount of information when asked a question so that others will understand and will be satisfied (i.e., not too little and not too much detail) "
											FieldTextBoxTabIndex="187" DatabaseField="pdp176" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="pdp177" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="177. Remembers where objects are located after not having access to the object for a while (e.g., finds favorite foods or toys that were hidden, locates car in parking lot) "
											FieldTextBoxTabIndex="188" DatabaseField="pdp177" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="pdp178" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="178. Quickly learns and remembers multiple-step movement sequences that he/she has been shown how to do (e.g., putting on shirt, pants, and shoes; tying shoes) "
											FieldTextBoxTabIndex="189" DatabaseField="pdp178" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="pdp179" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="179. Quickly learns and follows routines (e.g., classroom schedules) "
											FieldTextBoxTabIndex="190" DatabaseField="pdp179" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="pdp180" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="180. Performs three- or more-step unrelated commands from memory (e.g., touches shoe, turns around, and sits down, in that order, after first being told to 'First touch shoe, then turn around, and then sit down') "
											FieldTextBoxTabIndex="191" DatabaseField="pdp180" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="pdp181" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="181. Understands the concept of ownership (e.g., by selecting his/her own clothes from a pile, giving an object to its owner) "
											FieldTextBoxTabIndex="192" DatabaseField="pdp181" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="pdp182" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="182. Understands the concept of 'in,' 'on,' and 'under' by doing the action when asked without the help of gestures "
											FieldTextBoxTabIndex="193" DatabaseField="pdp182" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="pdp183" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="183. Understands a variety of subject-verb combinations (e.g., 'Make the doll dance,' 'Make mommy laugh') "
											FieldTextBoxTabIndex="194" DatabaseField="pdp183" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="pdp184" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="184. Understands the concept of 'conjunction' (e.g., will comply when asked 'Give me the ball and the cup') "
											FieldTextBoxTabIndex="195" DatabaseField="pdp184" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="pdp185" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="185. Understands big versus little (e.g., by giving the big ball instead of the little one, when asked, without the help of gestures) "
											FieldTextBoxTabIndex="196" DatabaseField="pdp185" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="pdp186" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="186. Responds correctly to questions asking for one and for all objects (e.g., 'Give me one apple,' 'Give me all of the apples') without the help of gestures "
											FieldTextBoxTabIndex="197" DatabaseField="pdp186" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="pdp187" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="187. Responds correctly to requests that involve directions and modifiers (e.g., 'Walk quickly,' 'Walk slowly,' 'Talk loudly') "
											FieldTextBoxTabIndex="198" DatabaseField="pdp187" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="pdp188" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="188. Indicates understanding of basic colors (i.e., red, green, blue, yellow), hot and cold, and rough and smooth concepts by correctly labeling, touching, or pointing "
											FieldTextBoxTabIndex="199" DatabaseField="pdp188" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="pdpvld" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="80px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="Validity (1=Valid, 2=Questionable, 3=Invalid)"
											FieldTextBoxTabIndex="348" DatabaseField="pdpvld" ValidList="1,2,3"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="pdpcmt" runat="server" FieldTextBoxWidth="300px" FieldLabelWidth="80px" FieldDataType="TEXT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False"
											IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="Comments" FieldTextBoxTabIndex="349"
											DatabaseField="pdpcmt" FieldTextBoxHeight="150px" FieldTextBoxMaxLength="400" FieldTextBoxTextMode="MultiLine"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
							<BR>
							<TABLE class="layout">
								<TR>
									<TD>
										<def:datafieldcontrol id="pdpdob" runat="server" FieldLabelWidth="60px" FieldDataType="DATE" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True"
											IsDoubleEntryField="False" FieldLabelText="DOB:" FieldTextBoxTabIndex="8" DatabaseField="pdpdob" FormatString="{0:d}"
											RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="pdpsex" runat="server" FieldLabelWidth="60px" FieldDataType="TEXT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True"
											IsDoubleEntryField="False" FieldLabelText="Sex:" FieldTextBoxTabIndex="9" DatabaseField="pdpsex" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="pdpagem" runat="server" FieldLabelWidth="80px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True"
											IsDoubleEntryField="False" FieldLabelText="Age (Months):" FieldTextBoxTabIndex="10" DatabaseField="pdpagem"
											RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="pdpageym" runat="server" FieldLabelWidth="80px" FieldDataType="TEXT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True"
											IsDoubleEntryField="False" FieldLabelText="Age (Y:M):" FieldTextBoxTabIndex="11" DatabaseField="pdpageym"
											RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
							<def:datafieldcontrol id="pdpscrmsg" runat="server" FieldLabelWidth="90px" FieldDataType="TEXT" IsInsertField="False"
								IsInsertValueRequired="False" IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True"
								IsDoubleEntryField="False" FieldLabelText="Scoring Status:" FieldTextBoxTabIndex="350" DatabaseField="pdpscrmsg"
								RenderReadOnlyAsDiv="True"></def:datafieldcontrol>
							<TABLE class="grid">
								<TR>
									<TD class="heading" width="220">Domain/Composite</TD>
									<TD class="heading">Raw<BR>
										Score</TD>
									<TD class="heading">T<BR>
										score</TD>
									<TD class="heading">90% CI</TD>
								</TR>
								<TR>
									<TD colSpan="4">Approach/Withdrawal Problems</TD>
								</TR>
								<TR>
									<TD class="heading" width="220">Sensory/Perceptual Approach Behaviors (SENSORY)</TD>
									<TD>
										<def:datafieldcontrol id="pdpseR" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="Sensory/Perceptual Approach Behaviors (SENSORY)-RAW"
											FieldTextBoxTabIndex="200" DatabaseField="pdpseR" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="pdpseT" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="Sensory/Perceptual Approach Behaviors (SENSORY)-T"
											FieldTextBoxTabIndex="201" DatabaseField="pdpseT" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="Datafieldcontrol1" runat="server" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True"
											IsDoubleEntryField="False" FieldLabelText="Sensory/Perceptual Approach Behaviors (SENSORY)-90% CI"
											FieldTextBoxTabIndex="203" DatabaseField="pdpseCI" FormatString="+-{0}" RenderReadOnlyAsDiv="True"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD class="heading" width="220">Ritualisms/Resistance to Change (RITUAL)</TD>
									<TD>
										<def:datafieldcontrol id="pdpriR" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="Ritualisms/Resistance to Change (RITUAL)-RAW"
											FieldTextBoxTabIndex="204" DatabaseField="pdpriR" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="pdpriT" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="Ritualisms/Resistance to Change (RITUAL)-T"
											FieldTextBoxTabIndex="205" DatabaseField="pdpriT" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="Datafieldcontrol2" runat="server" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True"
											IsDoubleEntryField="False" FieldLabelText="Ritualisms/Resistance to Change (RITUAL)-90% CI" FieldTextBoxTabIndex="207"
											DatabaseField="pdpriCI" FormatString="+-{0}" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD class="heading" width="220">Social Pragmatic Problems (SOCPP)</TD>
									<TD>
										<def:datafieldcontrol id="pdpsoR" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="Social Pragmatic Problems (SOCPP)-RAW"
											FieldTextBoxTabIndex="208" DatabaseField="pdpsoR" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="pdpsoT" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="Social Pragmatic Problems (SOCPP)-T"
											FieldTextBoxTabIndex="209" DatabaseField="pdpsoT" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="Datafieldcontrol3" runat="server" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True"
											IsDoubleEntryField="False" FieldLabelText="Social Pragmatic Problems (SOCPP)-90% CI" FieldTextBoxTabIndex="211"
											DatabaseField="pdpsoCI" FormatString="+-{0}" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD class="heading" width="220">Semantic/Pragmatic Problems (SEMPP)</TD>
									<TD>
										<def:datafieldcontrol id="pdpspR" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="Semantic/Pragmatic Problems (SEMPP)-RAW"
											FieldTextBoxTabIndex="212" DatabaseField="pdpspR" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="pdpspT" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="Semantic/Pragmatic Problems (SEMPP)-T"
											FieldTextBoxTabIndex="213" DatabaseField="pdpspT" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="Datafieldcontrol4" runat="server" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True"
											IsDoubleEntryField="False" FieldLabelText="Semantic/Pragmatic Problems (SEMPP)-90% CI" FieldTextBoxTabIndex="215"
											DatabaseField="pdpspCI" FormatString="+-{0}" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD class="heading" width="220">Arousal Regulation Problems (AROUSE)</TD>
									<TD>
										<def:datafieldcontrol id="pdparR" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="Arousal Regulation Problems (AROUSE)-RAW"
											FieldTextBoxTabIndex="216" DatabaseField="pdparR" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="pdparT" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="Arousal Regulation Problems (AROUSE)-T"
											FieldTextBoxTabIndex="217" DatabaseField="pdparT" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="Datafieldcontrol5" runat="server" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True"
											IsDoubleEntryField="False" FieldLabelText="Arousal Regulation Problems (AROUSE)-90% CI" FieldTextBoxTabIndex="219"
											DatabaseField="pdparCI" FormatString="+-{0}" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD class="heading" width="220">Specific Fears (FEARS)</TD>
									<TD>
										<def:datafieldcontrol id="pdpfeR" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="Specific Fears (FEARS)-RAW"
											FieldTextBoxTabIndex="220" DatabaseField="pdpfeR" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="pdpfeT" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="Specific Fears (FEARS)-T"
											FieldTextBoxTabIndex="221" DatabaseField="pdpfeT" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="Datafieldcontrol6" runat="server" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True"
											IsDoubleEntryField="False" FieldLabelText="Specific Fears (FEARS)-90% CI" FieldTextBoxTabIndex="223"
											DatabaseField="pdpfeCI" FormatString="+-{0}" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD class="heading" width="220">Aggressiveness (AGG)</TD>
									<TD>
										<def:datafieldcontrol id="pdpagR" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="Aggressiveness (AGG)-RAW"
											FieldTextBoxTabIndex="224" DatabaseField="pdpagR" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="pdpagT" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="Aggressiveness (AGG)-T"
											FieldTextBoxTabIndex="225" DatabaseField="pdpagT" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="Datafieldcontrol7" runat="server" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True"
											IsDoubleEntryField="False" FieldLabelText="Aggressiveness (AGG)-90% CI" FieldTextBoxTabIndex="227"
											DatabaseField="pdpagCI" FormatString="+-{0}" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD class="heading" width="220">Repetitive, Ritualistic, and Pragmatic Problems 
										Composite (REPRIT/C)</TD>
									<TD>
										<def:datafieldcontrol id="pdprcR" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="Repetitive, Ritualistic, and Pragmatic Problems Composite (REPRIT/C)-RAW"
											FieldTextBoxTabIndex="228" DatabaseField="pdprcR" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="pdprcT" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="Repetitive, Ritualistic, and Pragmatic Problems Composite (REPRIT/C)-T"
											FieldTextBoxTabIndex="229" DatabaseField="pdprcT" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="Datafieldcontrol8" runat="server" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True"
											IsDoubleEntryField="False" FieldLabelText="Repetitive, Ritualistic, and Pragmatic Problems Composite (REPRIT/C)-90% CI"
											FieldTextBoxTabIndex="231" DatabaseField="pdprcCI" FormatString="+-{0}" RenderReadOnlyAsDiv="True"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD class="heading" width="220">Approach/Withdrawal Problems Composite (AWP/C)</TD>
									<TD>
										<def:datafieldcontrol id="pdpacR" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="Approach/Withdrawal Problems Composite (AWP/C)-RAW"
											FieldTextBoxTabIndex="232" DatabaseField="pdpacR" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="pdpacT" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="Approach/Withdrawal Problems Composite (AWP/C)-T"
											FieldTextBoxTabIndex="233" DatabaseField="pdpacT" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="Datafieldcontrol9" runat="server" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True"
											IsDoubleEntryField="False" FieldLabelText="Approach/Withdrawal Problems Composite (AWP/C)-90% CI"
											FieldTextBoxTabIndex="235" DatabaseField="pdpacCI" FormatString="+-{0}" RenderReadOnlyAsDiv="True"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD colSpan="4">Receptive/Expressive Social Communication Abilities</TD>
								</TR>
								<TR>
									<TD class="heading" width="220">Social Approach Behaviors (SOCAPP)</TD>
									<TD>
										<def:datafieldcontrol id="pdpsbR" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="Social Approach Behaviors (SOCAPP)-RAW"
											FieldTextBoxTabIndex="236" DatabaseField="pdpsbR" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="pdpsbT" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="Social Approach Behaviors (SOCAPP)-T"
											FieldTextBoxTabIndex="237" DatabaseField="pdpsbT" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="Datafieldcontrol10" runat="server" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True"
											IsDoubleEntryField="False" FieldLabelText="Social Approach Behaviors (SOCAPP)-90% CI" FieldTextBoxTabIndex="239"
											DatabaseField="pdpsbCI" FormatString="+-{0}" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD class="heading" width="220">Expressive Language (EXPRESS)</TD>
									<TD>
										<def:datafieldcontrol id="pdpexR" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="Expressive Language (EXPRESS)-RAW"
											FieldTextBoxTabIndex="240" DatabaseField="pdpexR" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="pdpexT" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="Expressive Language (EXPRESS)-T"
											FieldTextBoxTabIndex="241" DatabaseField="pdpexT" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="Datafieldcontrol11" runat="server" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True"
											IsDoubleEntryField="False" FieldLabelText="Expressive Language (EXPRESS)-90% CI" FieldTextBoxTabIndex="243"
											DatabaseField="pdpexCI" FormatString="+-{0}" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD class="heading" width="220">Learning, Memory and Receptive language (LMRL)</TD>
									<TD>
										<def:datafieldcontrol id="pdplmR" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="Learning, Memory and Receptive language (LMRL)-RAW"
											FieldTextBoxTabIndex="244" DatabaseField="pdplmR" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="pdplmT" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="Learning, Memory and Receptive language (LMRL)-T"
											FieldTextBoxTabIndex="245" DatabaseField="pdplmT" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="Datafieldcontrol12" runat="server" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True"
											IsDoubleEntryField="False" FieldLabelText="Learning, Memory and Receptive language (LMRL)-90% CI"
											FieldTextBoxTabIndex="247" DatabaseField="pdplmCI" FormatString="+-{0}" RenderReadOnlyAsDiv="True"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD class="heading" width="220">Expressive Social Communication Abilities Composite 
										(EXSCA/C)</TD>
									<TD>
										<def:datafieldcontrol id="pdpesR" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="Expressive Social Communication Abilities Composite (EXSCA/C)-RAW"
											FieldTextBoxTabIndex="248" DatabaseField="pdpesR" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="pdpesT" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="Expressive Social Communication Abilities Composite (EXSCA/C)-T"
											FieldTextBoxTabIndex="249" DatabaseField="pdpesT" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="Datafieldcontrol13" runat="server" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True"
											IsDoubleEntryField="False" FieldLabelText="Expressive Social Communication Abilities Composite (EXSCA/C)-90% CI"
											FieldTextBoxTabIndex="251" DatabaseField="pdpesCI" FormatString="+-{0}" RenderReadOnlyAsDiv="True"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD class="heading" width="220">Receptive/Expressive Social Communication Abilities 
										Composite (REXSCA/C)</TD>
									<TD>
										<def:datafieldcontrol id="pdprsR" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="Receptive/Expressive Social Communication Abilities Composite (EXSCA/C)-RAW"
											FieldTextBoxTabIndex="252" DatabaseField="pdprsR" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="pdprsT" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="Receptive/Expressive Social Communication Abilities Composite (EXSCA/C)-T"
											FieldTextBoxTabIndex="253" DatabaseField="pdprsT" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="Datafieldcontrol14" runat="server" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True"
											IsDoubleEntryField="False" FieldLabelText="Receptive/Expressive Social Communication Abilities Composite (EXSCA/C)-90% CI"
											FieldTextBoxTabIndex="255" DatabaseField="pdprsCI" FormatString="+-{0}" RenderReadOnlyAsDiv="True"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
							<BR>
							<TABLE class="grid">
								<TR>
									<TD class="heading" rowSpan="2">Autism Composite (AUTISM)</TD>
									<TD class="heading">Raw<BR>
										Score</TD>
									<TD class="heading">T<BR>
										score</TD>
									<TD class="heading">90% CI</TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="pdpaucR" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="Autism Composite (AUTISM)-RAW"
											FieldTextBoxTabIndex="344" DatabaseField="pdpaucR" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="pdpaucT" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="Autism Composite (AUTISM)-T"
											FieldTextBoxTabIndex="345" DatabaseField="pdpaucT" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="Datafieldcontrol15" runat="server" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True"
											IsDoubleEntryField="False" FieldLabelText="Autism Composite (AUTISM)-90% CI" FieldTextBoxTabIndex="347"
											DatabaseField="pdpaucCI" FormatString="+-{0}" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
							<BR>
							<TABLE class="grid">
								<TR>
									<TD class="heading" width="235" rowSpan="2">Cluster</TD>
									<TD class="heading" colSpan="2">Percentile Range</TD>
								</TR>
								<TR>
									<TD>Raw Score</TD>
									<TD>Low (&lt;=33)<BR>
										Moderate (34-74)<BR>
										High (75-94)<BR>
										Very High (&gt;=95)</TD>
								</TR>
								<TR>
									<TD class="heading" colSpan="3">Sensory/Perceptual Approach Behaviors (SENSORY)</TD>
								</TR>
								<TR>
									<TD width="235">Visual Behaviors</TD>
									<TD>
										<def:datafieldcontrol id="pdpsevbr" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="Visual Behaviors"
											FieldTextBoxTabIndex="256" DatabaseField="pdpsevbr" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="pdpsevbx" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="Visual Behaviors Range"
											FieldTextBoxTabIndex="257" DatabaseField="pdpsevbx" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD width="235">Non-Food Taste Behaviors</TD>
									<TD>
										<def:datafieldcontrol id="pdpsenbr" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="Non-Food Taste Behaviors"
											FieldTextBoxTabIndex="258" DatabaseField="pdpsenbr" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="pdpsenbx" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="Non-Food Taste Behaviors Range"
											FieldTextBoxTabIndex="259" DatabaseField="pdpsenbx" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD width="235">Touch Behaviors</TD>
									<TD>
										<def:datafieldcontrol id="pdpsetbr" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="Touch Behaviors"
											FieldTextBoxTabIndex="260" DatabaseField="pdpsetbr" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="pdpsetbx" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="Touch Behaviors Range"
											FieldTextBoxTabIndex="261" DatabaseField="pdpsetbx" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD width="235">Proprioceptive/Kinesthetic Behaviors</TD>
									<TD>
										<def:datafieldcontrol id="pdpsepbr" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="Proprioceptive/Kinesthetic Behaviors"
											FieldTextBoxTabIndex="262" DatabaseField="pdpsepbr" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="pdpsepbx" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="Proprioceptive/Kinesthetic Behaviors Range"
											FieldTextBoxTabIndex="263" DatabaseField="pdpsepbx" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD width="235">Repetitive Manipulative Behaviors</TD>
									<TD>
										<def:datafieldcontrol id="pdpserbr" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="Repetitive Manipulative Behaviors"
											FieldTextBoxTabIndex="264" DatabaseField="pdpserbr" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="pdpserbx" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="Repetitive Manipulative Behaviors Range"
											FieldTextBoxTabIndex="265" DatabaseField="pdpserbx" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD class="heading" colSpan="3">Ritualisms/Resistance to Change (RITUAL)</TD>
								</TR>
								<TR>
									<TD width="235">Resistance to Change in the Environment</TD>
									<TD>
										<def:datafieldcontrol id="pdprircr" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="Resistance to Change in the Environment"
											FieldTextBoxTabIndex="266" DatabaseField="pdprircr" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="pdprircx" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="Resistance to Change in the Environment Range"
											FieldTextBoxTabIndex="267" DatabaseField="pdprircx" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD width="235">Resistance to Change in Schedules/Routines</TD>
									<TD>
										<def:datafieldcontrol id="pdprirsr" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="Resistance to Change in Schedules/Routines"
											FieldTextBoxTabIndex="268" DatabaseField="pdprirsr" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="pdprirsx" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="Resistance to Change in Schedules/Routines Range"
											FieldTextBoxTabIndex="269" DatabaseField="pdprirsx" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD width="235">Rituals</TD>
									<TD>
										<def:datafieldcontrol id="pdpririr" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="Rituals"
											FieldTextBoxTabIndex="270" DatabaseField="pdpririr" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="pdpririx" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="Rituals Range"
											FieldTextBoxTabIndex="271" DatabaseField="pdpririx" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD class="heading" colSpan="3">Social Pragmatic Problems (SOCPP)</TD>
								</TR>
								<TR>
									<TD width="235">Problems With Social Approach</TD>
									<TD>
										<def:datafieldcontrol id="pdpsopar" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="Problems With Social Approach"
											FieldTextBoxTabIndex="272" DatabaseField="pdpsopar" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="pdpsopax" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="Problems With Social Approach Range"
											FieldTextBoxTabIndex="273" DatabaseField="pdpsopax" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD width="235">Social Awareness Problems</TD>
									<TD>
										<def:datafieldcontrol id="pdpsospr" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="Social Awareness Problems"
											FieldTextBoxTabIndex="274" DatabaseField="pdpsospr" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="pdpsospx" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="Social Awareness Problems Range"
											FieldTextBoxTabIndex="275" DatabaseField="pdpsospx" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD width="235">Inappropriate Reactions to the Approaches of Others</TD>
									<TD>
										<def:datafieldcontrol id="pdpsoirr" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="Inappropriate Reactions to the Approaches of Others"
											FieldTextBoxTabIndex="276" DatabaseField="pdpsoirr" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="pdpsoirx" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="Inappropriate Reactions to the Approaches of Others Range"
											FieldTextBoxTabIndex="277" DatabaseField="pdpsoirx" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD class="heading" colSpan="3">Semantic/Pragmatic Problems (SEMPP)</TD>
								</TR>
								<TR>
									<TD width="235">Aberrant Vocal Quality When Speaking</TD>
									<TD>
										<def:datafieldcontrol id="pdpspaqr" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="Aberrant Vocal Quality When Speaking"
											FieldTextBoxTabIndex="278" DatabaseField="pdpspaqr" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="pdpspaqx" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="Aberrant Vocal Quality When Speaking Range"
											FieldTextBoxTabIndex="279" DatabaseField="pdpspaqx" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD width="235">Problems With Understanding Words</TD>
									<TD>
										<def:datafieldcontrol id="pdpsppur" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="Problems With Understanding Words"
											FieldTextBoxTabIndex="280" DatabaseField="pdpsppur" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="pdpsppux" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="Problems With Understanding Words Range"
											FieldTextBoxTabIndex="281" DatabaseField="pdpsppux" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD width="235">Verbal Pragmatic Deficits</TD>
									<TD>
										<def:datafieldcontrol id="pdpspvdr" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="Verbal Pragmatic Deficits"
											FieldTextBoxTabIndex="282" DatabaseField="pdpspvdr" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="pdpspvdx" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="Verbal Pragmatic Deficits Range"
											FieldTextBoxTabIndex="283" DatabaseField="pdpspvdx" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD class="heading" colSpan="3">Arousal Regulation Problems (AROUSE)</TD>
								</TR>
								<TR>
									<TD width="235">Kinesthetic Behaviors</TD>
									<TD>
										<def:datafieldcontrol id="pdparkbr" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="Kinesthetic Behaviors"
											FieldTextBoxTabIndex="284" DatabaseField="pdparkbr" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="pdparkbx" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="Kinesthetic Behaviors Range"
											FieldTextBoxTabIndex="285" DatabaseField="pdparkbx" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD width="235">Reduced Responsiveness</TD>
									<TD>
										<def:datafieldcontrol id="pdparrrr" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="Reduced Responsiveness"
											FieldTextBoxTabIndex="286" DatabaseField="pdparrrr" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="pdparrrx" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="Reduced Responsiveness Range"
											FieldTextBoxTabIndex="287" DatabaseField="pdparrrx" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD width="235">Sleep Regulation Problems</TD>
									<TD>
										<def:datafieldcontrol id="pdparspr" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="Sleep Regulation Problems"
											FieldTextBoxTabIndex="288" DatabaseField="pdparspr" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="pdparspx" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="Sleep Regulation Problems Range"
											FieldTextBoxTabIndex="289" DatabaseField="pdparspx" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD class="heading" colSpan="3">Specific Fears (FEARS)</TD>
								</TR>
								<TR>
									<TD width="235">Sadness When Away From Caregiver, Other Significant Figure, or in 
										New Situation</TD>
									<TD>
										<def:datafieldcontrol id="pdpfeswr" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="Sadness When Away From Caregiver, Other Significant Figure,  or in New Situation"
											FieldTextBoxTabIndex="290" DatabaseField="pdpfeswr" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="pdpfeswx" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="Sadness When Away From Caregiver, Other Significant Figure,  or in New Situation Range"
											FieldTextBoxTabIndex="291" DatabaseField="pdpfeswx" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD width="235">Anxiousness When Away From Caregiver, Other Significant Figure, or 
										in New Situation</TD>
									<TD>
										<def:datafieldcontrol id="pdpfeawr" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="Anxiousness When Away From Caregiver, Other Significant Figure, or in New Situation"
											FieldTextBoxTabIndex="292" DatabaseField="pdpfeawr" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="pdpfeawx" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="Anxiousness When Away From Caregiver, Other Significant Figure, or in New Situation Range"
											FieldTextBoxTabIndex="293" DatabaseField="pdpfeawx" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD width="235">Auditory Withdrawal Behaviors</TD>
									<TD>
										<def:datafieldcontrol id="pdpfeabr" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="Auditory Withdrawal Behaviors"
											FieldTextBoxTabIndex="294" DatabaseField="pdpfeabr" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="pdpfeabx" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="Auditory Withdrawal Behaviors Range"
											FieldTextBoxTabIndex="295" DatabaseField="pdpfeabx" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD width="235">Fears and Anxieties (facial expressions of fear, screaming, 
										protests, etc.)</TD>
									<TD>
										<def:datafieldcontrol id="pdpfefar" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="Fears and Anxieties (facial expressions of fear, screaming, protests, etc.)"
											FieldTextBoxTabIndex="296" DatabaseField="pdpfefar" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="pdpfefax" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="Fears and Anxieties (facial expressions of fear, screaming, protests, etc.) Range"
											FieldTextBoxTabIndex="297" DatabaseField="pdpfefax" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD width="235">Social Withdrawal Behaviors</TD>
									<TD>
										<def:datafieldcontrol id="pdpfesbr" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="Social Withdrawal Behaviors"
											FieldTextBoxTabIndex="298" DatabaseField="pdpfesbr" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="pdpfesbx" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="Social Withdrawal Behaviors Range"
											FieldTextBoxTabIndex="299" DatabaseField="pdpfesbx" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD class="heading" colSpan="3">Aggressiveness (AGG)</TD>
								</TR>
								<TR>
									<TD width="235">Self-Directed Aggressive Behaviors</TD>
									<TD>
										<def:datafieldcontrol id="pdpagsbr" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="Self-Directed Aggressive Behaviors"
											FieldTextBoxTabIndex="300" DatabaseField="pdpagsbr" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="pdpagsbx" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="Self-Directed Aggressive Behaviors Range"
											FieldTextBoxTabIndex="301" DatabaseField="pdpagsbx" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD width="235">Incongruous Negative Affect</TD>
									<TD>
										<def:datafieldcontrol id="pdpagiar" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="Incongruous Negative Affect"
											FieldTextBoxTabIndex="302" DatabaseField="pdpagiar" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="pdpagiax" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="Incongruous Negative Affect Range"
											FieldTextBoxTabIndex="303" DatabaseField="pdpagiax" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD width="235">Problems When Caregiver or Other Significant Figure Returns From 
										Work, an Outing, or Vacation</TD>
									<TD>
										<def:datafieldcontrol id="pdpagpcr" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="Problems When Caregiver or Other Significant Figure Returns From Work, an Outing, or Vacation"
											FieldTextBoxTabIndex="304" DatabaseField="pdpagpcr" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="pdpagpcx" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="Problems When Caregiver or Other Significant Figure Returns From Work, an Outing, or Vacation Range"
											FieldTextBoxTabIndex="305" DatabaseField="pdpagpcx" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD width="235">Aggressiveness Toward Others</TD>
									<TD>
										<def:datafieldcontrol id="pdpagaor" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="Aggressiveness Toward Others"
											FieldTextBoxTabIndex="306" DatabaseField="pdpagaor" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="pdpagaox" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="Aggressiveness Toward Others Range"
											FieldTextBoxTabIndex="307" DatabaseField="pdpagaox" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD width="235">Overall Temperament Problems</TD>
									<TD>
										<def:datafieldcontrol id="pdpagopr" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="Overall Temperament Problems"
											FieldTextBoxTabIndex="308" DatabaseField="pdpagopr" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="pdpagopx" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="Overall Temperament Problems Range"
											FieldTextBoxTabIndex="309" DatabaseField="pdpagopx" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD class="heading" colSpan="3">Social Approach Behaviors (SOCAPP)</TD>
								</TR>
								<TR>
									<TD width="235">Visual Social Approach Behaviors</TD>
									<TD>
										<def:datafieldcontrol id="pdpsbvbr" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="Visual Social Approach Behaviors"
											FieldTextBoxTabIndex="310" DatabaseField="pdpsbvbr" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="pdpsbvbx" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="Visual Social Approach Behaviors Range"
											FieldTextBoxTabIndex="311" DatabaseField="pdpsbvbx" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD width="235">Positive Affect Behaviors</TD>
									<TD>
										<def:datafieldcontrol id="pdpsbpbr" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="Positive Affect Behaviors"
											FieldTextBoxTabIndex="312" DatabaseField="pdpsbpbr" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="pdpsbpbx" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="Positive Affect Behaviors Range"
											FieldTextBoxTabIndex="313" DatabaseField="pdpsbpbx" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD width="235">Gestural Approach Behaviors (score these items whether or not the 
										child has language)</TD>
									<TD>
										<def:datafieldcontrol id="pdpsbgbr" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="Gestural Approach Behaviors (score these items whether or not the child has language)"
											FieldTextBoxTabIndex="314" DatabaseField="pdpsbgbr" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="pdpsbgbx" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="Gestural Approach Behaviors (score these items whether or not the child has language) Range"
											FieldTextBoxTabIndex="315" DatabaseField="pdpsbgbx" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD width="235">Responsiveness to Social Inhibition Cues</TD>
									<TD>
										<def:datafieldcontrol id="pdpsbrir" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="Responsiveness to Social Inhibition Cues"
											FieldTextBoxTabIndex="316" DatabaseField="pdpsbrir" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="pdpsbrix" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="Responsiveness to Social Inhibition Cues Range"
											FieldTextBoxTabIndex="317" DatabaseField="pdpsbrix" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD width="235">Social Play Behaviors</TD>
									<TD>
										<def:datafieldcontrol id="pdpsbspr" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="Social Play Behaviors"
											FieldTextBoxTabIndex="318" DatabaseField="pdpsbspr" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="pdpsbspx" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="Social Play Behaviors Range"
											FieldTextBoxTabIndex="319" DatabaseField="pdpsbspx" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD width="235">Imaginative Play Behaviors</TD>
									<TD>
										<def:datafieldcontrol id="pdpsbibr" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="Imaginative Play Behaviors"
											FieldTextBoxTabIndex="320" DatabaseField="pdpsbibr" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="pdpsbibx" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="Imaginative Play Behaviors Range"
											FieldTextBoxTabIndex="321" DatabaseField="pdpsbibx" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD width="235">Empathy Behaviors</TD>
									<TD>
										<def:datafieldcontrol id="pdpsbebr" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="Empathy Behaviors"
											FieldTextBoxTabIndex="322" DatabaseField="pdpsbebr" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="pdpsbebx" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="Empathy Behaviors Range"
											FieldTextBoxTabIndex="323" DatabaseField="pdpsbebx" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD width="235">Social Interaction Behaviors</TD>
									<TD>
										<def:datafieldcontrol id="pdpsbsbr" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="Social Interaction Behaviors"
											FieldTextBoxTabIndex="324" DatabaseField="pdpsbsbr" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="pdpsbsbx" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="Social Interaction Behaviors Range"
											FieldTextBoxTabIndex="325" DatabaseField="pdpsbsbx" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD width="235">Social Imitative Behaviors</TD>
									<TD>
										<def:datafieldcontrol id="pdpsbsir" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="Social Imitative Behaviors"
											FieldTextBoxTabIndex="326" DatabaseField="pdpsbsir" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="pdpsbsix" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="Social Imitative Behaviors Range"
											FieldTextBoxTabIndex="327" DatabaseField="pdpsbsix" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD class="heading" colSpan="3">Expressive Language (EXPRESS)</TD>
								</TR>
								<TR>
									<TD width="235">Vowel Production</TD>
									<TD>
										<def:datafieldcontrol id="pdpexvpr" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="Vowel Production"
											FieldTextBoxTabIndex="328" DatabaseField="pdpexvpr" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="pdpexvpx" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="Vowel Production Range"
											FieldTextBoxTabIndex="329" DatabaseField="pdpexvpx" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD width="235">Consonant Production at the Beginning, Middle, and End of Words</TD>
									<TD>
										<def:datafieldcontrol id="pdpexcpr" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="Consonant Production at the Beginning, Middle, and End of Words"
											FieldTextBoxTabIndex="330" DatabaseField="pdpexcpr" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="pdpexcpx" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="Consonant Production at the Beginning, Middle, and End of Words Range"
											FieldTextBoxTabIndex="331" DatabaseField="pdpexcpx" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD width="235">Diphthong Production</TD>
									<TD>
										<def:datafieldcontrol id="pdpexdpr" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="Diphthong Production"
											FieldTextBoxTabIndex="332" DatabaseField="pdpexdpr" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="pdpexdpx" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="Diphthong Production Range"
											FieldTextBoxTabIndex="333" DatabaseField="pdpexdpx" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD width="235">Expressive Language Competence</TD>
									<TD>
										<def:datafieldcontrol id="pdpexelr" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="Expressive Language Competence"
											FieldTextBoxTabIndex="334" DatabaseField="pdpexelr" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="pdpexelx" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="Expressive Language Competence Range"
											FieldTextBoxTabIndex="335" DatabaseField="pdpexelx" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD width="235">Verbal Affective Tone</TD>
									<TD>
										<def:datafieldcontrol id="pdpexvar" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="Verbal Affective Tone"
											FieldTextBoxTabIndex="336" DatabaseField="pdpexvar" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"
											DESIGNTIMEDRAGDROP="951"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="pdpexvax" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="Verbal Affective Tone Range"
											FieldTextBoxTabIndex="337" DatabaseField="pdpexvax" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD width="235">Pragmatic Conversational Skills</TD>
									<TD>
										<def:datafieldcontrol id="pdpexpcr" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="Pragmatic Conversational Skills"
											FieldTextBoxTabIndex="338" DatabaseField="pdpexpcr" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="pdpexpcx" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="Pragmatic Conversational Skills Range"
											FieldTextBoxTabIndex="339" DatabaseField="pdpexpcx" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD class="heading" colSpan="3">Learning, Memory and Receptive language (LMRL)</TD>
								</TR>
								<TR>
									<TD width="235">General Memory Skills</TD>
									<TD>
										<def:datafieldcontrol id="pdplmgmr" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="General Memory Skills"
											FieldTextBoxTabIndex="340" DatabaseField="pdplmgmr" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"
											DESIGNTIMEDRAGDROP="955"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="pdplmgmx" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="General Memory Skills Range"
											FieldTextBoxTabIndex="341" DatabaseField="pdplmgmx" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD width="235">Receptive Language Competence</TD>
									<TD>
										<def:datafieldcontrol id="pdplmrlr" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="Receptive Language Competence"
											FieldTextBoxTabIndex="342" DatabaseField="pdplmrlr" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"
											DESIGNTIMEDRAGDROP="957"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="pdplmrlx" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="Receptive Language Competence Range"
											FieldTextBoxTabIndex="343" DatabaseField="pdplmrlx" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"
											DESIGNTIMEDRAGDROP="958"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
							<BR>
							<TABLE class="layout">
								<TR>
									<TD>
										<def:datafieldcontrol id="created" runat="server" FieldLabelWidth="80px" FieldDataType="DATE" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True"
											IsDoubleEntryField="False" FieldLabelText="created" FieldTextBoxTabIndex="352" DatabaseField="created"
											RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="createdBy" runat="server" FieldLabelWidth="80px" FieldDataType="TEXT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True"
											IsDoubleEntryField="False" FieldLabelText="createdBy" FieldTextBoxTabIndex="353" DatabaseField="createdBy"
											RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="updated" runat="server" FieldLabelWidth="80px" FieldDataType="DATE" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True"
											IsDoubleEntryField="False" FieldLabelText="updated" FieldTextBoxTabIndex="354" DatabaseField="updated"
											RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="updatedBy" runat="server" FieldLabelWidth="80px" FieldDataType="TEXT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True"
											IsDoubleEntryField="False" FieldLabelText="updatedBy" FieldTextBoxTabIndex="355" DatabaseField="updatedBy"
											RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="scored" runat="server" FieldLabelWidth="80px" FieldDataType="DATE" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True"
											IsDoubleEntryField="False" FieldLabelText="scored" FieldTextBoxTabIndex="356" DatabaseField="scored"
											RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="scoredBy" runat="server" FieldLabelWidth="80px" FieldDataType="TEXT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True"
											IsDoubleEntryField="False" FieldLabelText="scoredBy" FieldTextBoxTabIndex="357" DatabaseField="scoredBy"
											RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
						</asp:Panel>
					</asp:Content>
