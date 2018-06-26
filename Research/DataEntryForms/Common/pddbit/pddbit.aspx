
<%@ Register TagPrefix="def" Namespace="DataEntryFramework" %>
<%@ Page language="c#" Inherits="GenericDataEntryForms.pddbit.pddbit" CodeFile="pddbit.aspx.cs"  MasterPageFile="~/UWAC.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="oBodyPlaceHolder" runat="server">
						<def:dataentrycontroller id="DataEntryController1" runat="server" LastUpdatedDateField="updated" LastScoredDateField="scored"
							AllowedStudyMeasures="777,1234,1565,1920" DatabaseTable="all_pddbit" LookupField1="id" LookupTextBox2Visible="False"
							LookupTextBox1LabelText="Subject ID:" MeasureName="Teacher PDDBI" PrimaryKeyField="pdt_pk" VerifiedField="verified"
							ShowScoreButton="True" LookupField1DataType="TEXT" ondoscore="DataEntryController1_DoScore"></def:dataentrycontroller>
						<table class="tblinsert" id="table_insert">
							<tr>
								<td><def:datafieldcontrol id="id" runat="server" DatabaseField="id" FieldTextBoxTabIndex="4" FieldLabelText="ID"
										IsDoubleEntryField="False" IsReadOnly="False" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="True"
										IsInsertField="True" FieldDataType="TEXT" FieldLabelWidth="60px" FieldTextBoxWidth="80px"></def:datafieldcontrol></td>
							</tr>
						</table>
						<asp:Panel ID="mainPanel" Runat="server">
							<BR>
							<TABLE class="layout" id="table_entry">
								<TR>
									<TD>
										<def:datafieldcontrol id="pdtdate" runat="server" FieldTextBoxWidth="80px" FieldLabelWidth="60px" FieldDataType="DATE"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="Date" FieldTextBoxTabIndex="5" DatabaseField="pdtdate"
											FormatString="{0:d}"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>1=Mother (bio, step, adoptive)<BR>
										2=Father (bio, step, adoptive)<BR>
										3=Primary Caregiver (specify below)<BR>
										4=Other (specify below)<BR>
										9=Missing/Unknown<BR>
										<def:datafieldcontrol id="pdtrat" runat="server" FieldTextBoxWidth="80px" FieldLabelWidth="60px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="Respondant" FieldTextBoxTabIndex="6"
											DatabaseField="pdtrat"></def:datafieldcontrol><BR>
										<def:datafieldcontrol id="pdtrato" runat="server" FieldTextBoxWidth="100px" FieldLabelWidth="100px" FieldDataType="TEXT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False"
											IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="(specify if 3 or 4)" FieldTextBoxTabIndex="7"
											DatabaseField="pdtrato"></def:datafieldcontrol></TD>
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
										<def:datafieldcontrol id="pdt001" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="1. Stares at or looks out of sides of eyes at his/her own image in mirror"
											FieldTextBoxTabIndex="12" DatabaseField="pdt001" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="pdt002" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="2. Stares at or looks out of sides of eyes at objects (e.g., toys, strings)"
											FieldTextBoxTabIndex="12" DatabaseField="pdt002" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="pdt003" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="3. Stares at or looks out of sides of eyes at his/her fingers or hands"
											FieldTextBoxTabIndex="12" DatabaseField="pdt003" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="pdt004" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="4. Stares at or looks out of sides of eyes at lights or shiny objects"
											FieldTextBoxTabIndex="12" DatabaseField="pdt004" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="pdt005" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="5. Chews on objects" FieldTextBoxTabIndex="12"
											DatabaseField="pdt005" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="pdt006" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="6. Eats inedible (non-food) objects (e.g., dirt, paper, plastic)"
											FieldTextBoxTabIndex="12" DatabaseField="pdt006" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="pdt007" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="7. Smells objects (e.g., holds objects such as books, blocks, clothes close to nose)"
											FieldTextBoxTabIndex="12" DatabaseField="pdt007" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="pdt008" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="8. Smells self (e.g., puts own hands or arms up to nose and smells them)"
											FieldTextBoxTabIndex="12" DatabaseField="pdt008" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="pdt009" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="9. Makes repetitive vowel or consonant noises (e.g., high-pitched vowels, tongue clicks)"
											FieldTextBoxTabIndex="12" DatabaseField="pdt009" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="pdt010" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="10. Grinds teeth, causing popping-like sounds to occur from mouth that others can hear"
											FieldTextBoxTabIndex="12" DatabaseField="pdt010" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="pdt011" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="11. Repetitively makes machine-like sounds (e.g., vacuum cleaner, airplane, air conditioner)"
											FieldTextBoxTabIndex="12" DatabaseField="pdt011" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="pdt012" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="12. Hums monotonously (i.e., in a boring way, always the same, no changes)"
											FieldTextBoxTabIndex="12" DatabaseField="pdt012" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="pdt013" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="13. Flaps hands up and down" FieldTextBoxTabIndex="12"
											DatabaseField="pdt013" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="pdt014" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="14. Makes odd or unusual finger movements (e.g., flicks fingers)"
											FieldTextBoxTabIndex="12" DatabaseField="pdt014" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="pdt015" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="15. Rocks or sways body" FieldTextBoxTabIndex="12"
											DatabaseField="pdt015" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="pdt016" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="16. Jumps repetitively" FieldTextBoxTabIndex="12"
											DatabaseField="pdt016" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="pdt017" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="17. Repetitively twiddles or bangs objects or flaps objects back and forth"
											FieldTextBoxTabIndex="12" DatabaseField="pdt017" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="pdt018" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="18. Spins objects (e.g., wheels of toy cars, strings) in a repetitive manner"
											FieldTextBoxTabIndex="12" DatabaseField="pdt018" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="pdt019" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="19. Throws objects around, rips or tears paper or other material"
											FieldTextBoxTabIndex="12" DatabaseField="pdt019" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="pdt020" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="20. Repetitively moves objects back and forth (e.g., turns pages back and forth, opens and closes doors, turns lights on and off) Gait-Based (Walking) Kinesthetic Behaviors"
											FieldTextBoxTabIndex="12" DatabaseField="pdt020" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="pdt021" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="21. Walks on his/her toes when walking"
											FieldTextBoxTabIndex="12" DatabaseField="pdt021" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="pdt022" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="22. Spins his/her body around in circles when walking"
											FieldTextBoxTabIndex="12" DatabaseField="pdt022" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="pdt023" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="23. Holds arms in odd or unusual posture when walking (e.g., arms held out to the side, on the head)"
											FieldTextBoxTabIndex="12" DatabaseField="pdt023" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="pdt024" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="24. Hops, jumps, or bounces up and down when walking"
											FieldTextBoxTabIndex="12" DatabaseField="pdt024" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="pdt025" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="25. Tries to move classroom furniture back to its original location when it is moved by others"
											FieldTextBoxTabIndex="12" DatabaseField="pdt025" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="pdt026" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="26. Moves objects back to their original locations when they are moved by others (e.g., pictures, toys, doors, window shades)"
											FieldTextBoxTabIndex="12" DatabaseField="pdt026" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="pdt027" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="27. Becomes upset when objects are moved from their original locations by others (e.g., pictures, toys, doors, window shades)"
											FieldTextBoxTabIndex="12" DatabaseField="pdt027" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="pdt028" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="28. Becomes upset if the usual instructions for an activity are changed in some way"
											FieldTextBoxTabIndex="12" DatabaseField="pdt028" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="pdt029" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="29. Dislikes surprises, feels uncomfortable trying new activities, or has difficulty adjusting to changes in routine at school or work"
											FieldTextBoxTabIndex="12" DatabaseField="pdt029" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="pdt030" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="30. Resists changing from one activity to another when requested to do so by familiar people"
											FieldTextBoxTabIndex="12" DatabaseField="pdt030" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="pdt031" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="31. Becomes unusually upset when the order of a routine is changed (e.g., sees a teacher out of usual sequence, has to go to a later class before an earlier one, order of programs changed)"
											FieldTextBoxTabIndex="12" DatabaseField="pdt031" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="pdt032" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="32. Becomes upset when class is interrupted (e.g., fire drills, announcements over loudspeaker)"
											FieldTextBoxTabIndex="12" DatabaseField="pdt032" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="pdt033" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="33. Inappropriately needs to carry or hold on to objects (e.g., toys, paper clips, strings)"
											FieldTextBoxTabIndex="12" DatabaseField="pdt033" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="pdt034" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="34. Insists on taking the same route from one classroom to another or taking the same route from one part of a room to another part of the same room"
											FieldTextBoxTabIndex="12" DatabaseField="pdt034" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="pdt035" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="35. Resists changing own location in room or wants others to stay in some fixed place"
											FieldTextBoxTabIndex="12" DatabaseField="pdt035" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="pdt036" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="36. Insists that others say something over and over or insists that others say a certain word or phrase or insists on listening to the same song over and over or must smell, mouth, touch, or tap some object before doing something else"
											FieldTextBoxTabIndex="12" DatabaseField="pdt036" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="pdt037" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="37. Stands too closely to others when talking to them, forcing others to back away"
											FieldTextBoxTabIndex="12" DatabaseField="pdt037" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="pdt038" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="38. Stares at others for too long a time when talking, making others uncomfortable"
											FieldTextBoxTabIndex="12" DatabaseField="pdt038" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="pdt039" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="39. Approaches others inappropriately (e.g., touches them inappropriately, makes obscene comments)"
											FieldTextBoxTabIndex="12" DatabaseField="pdt039" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="pdt040" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="40. Becomes excessively angry or aggressive when he/she feels that he/she has been criticized"
											FieldTextBoxTabIndex="12" DatabaseField="pdt040" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="pdt041" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="41. Shows little interest in his/her appearance when with others his/her age (e.g., fails to keep zippers fastened, wears clothes that others his/her age or gender would consider out of fashion)"
											FieldTextBoxTabIndex="12" DatabaseField="pdt041" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="pdt042" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="42. Is overly serious in social situations; doesn't understand the humor in situations that others his/her age would consider funny"
											FieldTextBoxTabIndex="12" DatabaseField="pdt042" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="pdt043" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="43. Performs private actions in front of others, that others his/her age would consider inappropriate (e.g., picking nose)"
											FieldTextBoxTabIndex="12" DatabaseField="pdt043" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="pdt044" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="44. Laughs or smiles for no apparent reason or laughs or smiles at the wrong time (e.g., when others cry)"
											FieldTextBoxTabIndex="12" DatabaseField="pdt044" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="pdt045" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="45. Ignores the social approaches of people his/her own age"
											FieldTextBoxTabIndex="12" DatabaseField="pdt045" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="pdt046" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="46. Is inappropriately abrupt and dismissive of others (e.g., cuts off conversations abruptly or walks away, showing little concern for how these actions affect others)"
											FieldTextBoxTabIndex="12" DatabaseField="pdt046" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="pdt047" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="47. Actively avoids (e.g., runs away, turns away) other people who are his/her age when approached by them"
											FieldTextBoxTabIndex="12" DatabaseField="pdt047" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="pdt048" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="48. Says inappropriate things when approached by others (e.g., asks personal questions, makes embarrassing comments)"
											FieldTextBoxTabIndex="12" DatabaseField="pdt048" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="pdt049" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="49. Uses a monotonous (i.e., boring) tone of voice when speaking"
											FieldTextBoxTabIndex="12" DatabaseField="pdt049" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="pdt050" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="50. Uses a questioning tone of voice when saying things that aren't questions"
											FieldTextBoxTabIndex="12" DatabaseField="pdt050" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="pdt051" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="51. Puts an unusual stress on words when speaking (not due to regional accent)"
											FieldTextBoxTabIndex="12" DatabaseField="pdt051" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="pdt052" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="52. Voice goes up and down in pitch, 'sing-song like,' when speaking"
											FieldTextBoxTabIndex="12" DatabaseField="pdt052" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="pdt053" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="53. Has difficulty understanding variations in sentence structure for a given sentence topic (e.g., doesn't answer when asked 'Can you tell me your name?' but answers when asked 'What's your name?', i.e., he/she doesn't understand that these are the same question)"
											FieldTextBoxTabIndex="12" DatabaseField="pdt053" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="pdt054" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="54. Echoes request of other meaninglessly (like a parrot)"
											FieldTextBoxTabIndex="12" DatabaseField="pdt054" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="pdt055" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="55. Shows understanding by repeating all or part of a question and then performing an action (e.g., when asked 'Do you want to eat?' says 'Do you want to eat' or 'Eat' or 'Want to eat' and then gets up to go to kitchen)"
											FieldTextBoxTabIndex="12" DatabaseField="pdt055" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="pdt056" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="56. Says a word, phrase, or sentence that is a response to part of a sentence said to him/her, but has no relation to the sentence topic (e.g., teacher asks where ball is and he/she says 'ball is blue,' or when asked where his/her mouth is, he/she says 'Mouth is for eating') or repeats words or phrases heard earlier but out of context (i.e., delayed echolalia)"
											FieldTextBoxTabIndex="12" DatabaseField="pdt056" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="pdt057" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="57. Starts to talk to himself/herself during conversation with others about a given topic"
											FieldTextBoxTabIndex="12" DatabaseField="pdt057" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="pdt058" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="58. Difficulty sustaining (i.e., staying with) a conversation, fails to follow-up on theme of topic"
											FieldTextBoxTabIndex="12" DatabaseField="pdt058" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="pdt059" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="59. Talks about topics and assumes that his/her conversational partner understands what he/she is talking about (e.g., talks about TV programs or videos to strangers and assumes that the stranger knows about the program or video)"
											FieldTextBoxTabIndex="12" DatabaseField="pdt059" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="pdt060" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="60. Jumps rapidly from topic to topic when conversing with others (i.e., difficult to follow what he/she is talking about)"
											FieldTextBoxTabIndex="12" DatabaseField="pdt060" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="pdt061" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="61. Restless" FieldTextBoxTabIndex="12"
											DatabaseField="pdt061" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="pdt062" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="62. Runs aimlessly" FieldTextBoxTabIndex="12"
											DatabaseField="pdt062" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="pdt063" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="63. Fidgets" FieldTextBoxTabIndex="12"
											DatabaseField="pdt063" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="pdt064" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="64. Wanders around room" FieldTextBoxTabIndex="12"
											DatabaseField="pdt064" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="pdt065" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="65. Restricted range (e.g., problems showing happiness, sadness, fear, guilt, disgust) and/or reduced intensity of emotions (i.e., doesn't react as strongly to others as most others would)"
											FieldTextBoxTabIndex="12" DatabaseField="pdt065" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="pdt066" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="66. Stares into space" FieldTextBoxTabIndex="12"
											DatabaseField="pdt066" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="pdt067" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="67. Fails to respond to requests, name, or touch"
											FieldTextBoxTabIndex="12" DatabaseField="pdt067" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="pdt068" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="68. Requires physical or verbal prompts to respond to requests that he/she knows how to do"
											FieldTextBoxTabIndex="12" DatabaseField="pdt068" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="pdt069" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="69. Covers ears when with people" FieldTextBoxTabIndex="12"
											DatabaseField="pdt069" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="pdt070" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="70. Tries to or leaves room when with unfamiliar people or in unfamiliar situations"
											FieldTextBoxTabIndex="12" DatabaseField="pdt070" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="pdt071" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="71. Retreats to corner or goes under table when with unfamiliar people or in unfamiliar situations"
											FieldTextBoxTabIndex="12" DatabaseField="pdt071" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="pdt072" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="72. Turns eyes, head, or body away from others"
											FieldTextBoxTabIndex="12" DatabaseField="pdt072" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="pdt073" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="73. Shows discomfort with loud or high-pitched noises (e.g., school bell, shrieking, fire alarms)"
											FieldTextBoxTabIndex="12" DatabaseField="pdt073" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="pdt074" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="74. Shows discomfort with specific sounds (e.g., toilets flushing, songs or voices of certain people)"
											FieldTextBoxTabIndex="12" DatabaseField="pdt074" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="pdt075" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="75. Is unusually angry or frightened when others cry or scream"
											FieldTextBoxTabIndex="12" DatabaseField="pdt075" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="pdt076" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="76. Is unusually startled by sudden noises Fears and Anxieties (facial expressions of fear, screaming, protests, etc.)"
											FieldTextBoxTabIndex="12" DatabaseField="pdt076" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="pdt077" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="77. Unusually afraid of new places, attending school, or trying new activities"
											FieldTextBoxTabIndex="12" DatabaseField="pdt077" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="pdt078" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="78. Unusually afraid of using the toilet, chewing or swallowing foods, or trying new foods or drinks"
											FieldTextBoxTabIndex="12" DatabaseField="pdt078" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="pdt079" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="79. Unusually afraid of making mistakes, or being criticized or scolded"
											FieldTextBoxTabIndex="12" DatabaseField="pdt079" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="pdt080" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="80. Unusually afraid of certain people, or talking or performing in a group situation"
											FieldTextBoxTabIndex="12" DatabaseField="pdt080" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="pdt081" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="81. Hits self" FieldTextBoxTabIndex="12"
											DatabaseField="pdt081" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="pdt082" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="82. Bangs head on smooth surfaces" FieldTextBoxTabIndex="12"
											DatabaseField="pdt082" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="pdt083" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="83. Bangs head on corners or edges of objects (e.g., table corners, edges of doors)"
											FieldTextBoxTabIndex="12" DatabaseField="pdt083" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="pdt084" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="84. Scratches self" FieldTextBoxTabIndex="12"
											DatabaseField="pdt084" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="pdt085" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="85. Becomes fearful, frightened, or panicky for no reason"
											FieldTextBoxTabIndex="12" DatabaseField="pdt085" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="pdt086" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="86. Cries for no reason" FieldTextBoxTabIndex="12"
											DatabaseField="pdt086" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="pdt087" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="87. Angry for no reason" FieldTextBoxTabIndex="12"
											DatabaseField="pdt087" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="pdt088" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="88. Moody, emotions change rapidly" FieldTextBoxTabIndex="12"
											DatabaseField="pdt088" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="pdt089" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="89. Shouts or screams" FieldTextBoxTabIndex="12"
											DatabaseField="pdt089" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="pdt090" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="90. Hits self or others or kicks others"
											FieldTextBoxTabIndex="12" DatabaseField="pdt090" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="pdt091" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="91. Tantrums" FieldTextBoxTabIndex="12"
											DatabaseField="pdt091" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="pdt092" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="92. Throws things, becomes destructive"
											FieldTextBoxTabIndex="12" DatabaseField="pdt092" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="pdt093" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="93. Hits or kicks" FieldTextBoxTabIndex="12"
											DatabaseField="pdt093" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="pdt094" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="94. Scratches or pulls hair" FieldTextBoxTabIndex="12"
											DatabaseField="pdt094" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="pdt095" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="95. Bites" FieldTextBoxTabIndex="12"
											DatabaseField="pdt095" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="pdt096" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="96. Throws object(s) at others" FieldTextBoxTabIndex="12"
											DatabaseField="pdt096" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="pdt097" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="97. Cranky, irritable" FieldTextBoxTabIndex="12"
											DatabaseField="pdt097" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="pdt098" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="98. Difficult to please, not easily satisfied"
											FieldTextBoxTabIndex="12" DatabaseField="pdt098" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="pdt099" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="99. Takes a long time to calm down when upset"
											FieldTextBoxTabIndex="12" DatabaseField="pdt099" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="pdt100" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="100. Easily frustrated" FieldTextBoxTabIndex="12"
											DatabaseField="pdt100" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="pdt101" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="101. Pays attention to other's face when given instructions or when asked questions"
											FieldTextBoxTabIndex="12" DatabaseField="pdt101" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="pdt102" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="102. Looks at other to seek feedback and/or praise"
											FieldTextBoxTabIndex="12" DatabaseField="pdt102" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="pdt103" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="103. Pays attention to what other wants him/her to look at (e.g., book, car, toy)"
											FieldTextBoxTabIndex="12" DatabaseField="pdt103" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="pdt104" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="104. Looks when called or praised" FieldTextBoxTabIndex="12"
											DatabaseField="pdt104" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="pdt105" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="105. Smiles when praised" FieldTextBoxTabIndex="12"
											DatabaseField="pdt105" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="pdt106" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="106. Wants others to repeat activities that make him/her happy (e.g., tickling, rough-housing)"
											FieldTextBoxTabIndex="12" DatabaseField="pdt106" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="pdt107" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="107. Shows affection (e.g., hugs, kisses) toward caregivers, friends, favorite teachers, etc."
											FieldTextBoxTabIndex="12" DatabaseField="pdt107" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="pdt108" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="108. Starts to smile in anticipation of teasing, tickling, etc."
											FieldTextBoxTabIndex="12" DatabaseField="pdt108" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="pdt109" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="109. Points with his/her index finger to indicate to others what he/she wants"
											FieldTextBoxTabIndex="12" DatabaseField="pdt109" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="pdt110" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="110. Shows recognition of pictures of familiar people, animals, etc., by spontaneously pointing to the pictures when he/she sees them"
											FieldTextBoxTabIndex="12" DatabaseField="pdt110" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="pdt111" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="111. Moves arm(s)/hand(s) in beckoning motion to signal others to come to him/her"
											FieldTextBoxTabIndex="12" DatabaseField="pdt111" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="pdt112" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="112. Gestures and looks back and forth to others in order to share the experience with them (e.g., sees airplane and points at it while looking back to other and then back to the airplane)"
											FieldTextBoxTabIndex="12" DatabaseField="pdt112" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="pdt113" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="113. Temporarily stops inappropriate behavior when warned or punished"
											FieldTextBoxTabIndex="12" DatabaseField="pdt113" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="pdt114" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="114. Shows fear or worry when warned"
											FieldTextBoxTabIndex="12" DatabaseField="pdt114" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="pdt115" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="115. Stops doing inappropriate behavior when sees significant others approach him/her"
											FieldTextBoxTabIndex="12" DatabaseField="pdt115" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="pdt116" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="116. Avoids inappropriate behavior when significant others are around (e.g., behaves self when caregivers are around but mayor may not misbehave when they leave)"
											FieldTextBoxTabIndex="12" DatabaseField="pdt116" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="pdt117" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="117. Selects his/her own toys to play with and allows other( s) to play along"
											FieldTextBoxTabIndex="12" DatabaseField="pdt117" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="pdt118" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="118. Initiates (e.g., pulls, asks) simple social play with others"
											FieldTextBoxTabIndex="12" DatabaseField="pdt118" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="pdt119" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="119. Follows the rules of simple interactive games (e.g., takes turns)"
											FieldTextBoxTabIndex="12" DatabaseField="pdt119" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="pdt120" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="120. Engages in cooperative, helpful, turn-taking play where both partners work on a common goal or theme together (e.g., putting 50-piece jigsaw puzzle together; cooperative team board or card game)"
											FieldTextBoxTabIndex="12" DatabaseField="pdt120" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="pdt121" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="121. Imitates simple imaginative play of others"
											FieldTextBoxTabIndex="12" DatabaseField="pdt121" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="pdt122" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="122. Shows active awareness of toy representation of object or animal (e.g., makes sounds of animal and makes toy animal move, makes car move and says 'beep')"
											FieldTextBoxTabIndex="12" DatabaseField="pdt122" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="pdt123" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="123. Shows more complex imaginative toy play (e.g., feeds doll, makes Superman toy fly)"
											FieldTextBoxTabIndex="12" DatabaseField="pdt123" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="pdt124" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="124. Uses available material imaginatively for novel purposes (e.g., makes paper airplane and flies it)"
											FieldTextBoxTabIndex="12" DatabaseField="pdt124" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="pdt125" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="125. Looks concerned or worried when others that he/she knows are sad"
											FieldTextBoxTabIndex="12" DatabaseField="pdt125" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="pdt126" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="126. Tries to physically or verbally comfort others when they are sad"
											FieldTextBoxTabIndex="12" DatabaseField="pdt126" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="pdt127" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="127. Offers help when others are in need of assistance (e.g., tries to open doors for others when they cannot)"
											FieldTextBoxTabIndex="12" DatabaseField="pdt127" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="pdt128" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="128. Offers help when others are sick (e.g., offers tissues to someone if he/she is sneezing or sniffling)"
											FieldTextBoxTabIndex="12" DatabaseField="pdt128" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="pdt129" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="129. Can imitate tongue clicking" FieldTextBoxTabIndex="12"
											DatabaseField="pdt129" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="pdt130" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="130. Can imitate coughing" FieldTextBoxTabIndex="12"
											DatabaseField="pdt130" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="pdt131" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="131. Can imitate sticking tongue out"
											FieldTextBoxTabIndex="12" DatabaseField="pdt131" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="pdt132" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="132. Can imitate peek-a-boo" FieldTextBoxTabIndex="12"
											DatabaseField="pdt132" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="pdt133" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="133. Can make 'ee' sounds as in 'peat'"
											FieldTextBoxTabIndex="12" DatabaseField="pdt133" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="pdt134" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="134. Can make 'eh' sounds as in 'pet'"
											FieldTextBoxTabIndex="12" DatabaseField="pdt134" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="pdt135" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="135. Can make 'ah' sounds as in 'hot'"
											FieldTextBoxTabIndex="12" DatabaseField="pdt135" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="pdt136" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="136. Can make '00' sounds as in 'boot'"
											FieldTextBoxTabIndex="12" DatabaseField="pdt136" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="pdt137" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="137. Can make 'p' sounds as in 'nill,' 'awle,' and 'up'"
											FieldTextBoxTabIndex="12" DatabaseField="pdt137" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="pdt138" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="138. Can make 'mm' sounds as in 'ma,' 'emmy,' and 'room'"
											FieldTextBoxTabIndex="12" DatabaseField="pdt138" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="pdt139" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="139. Can make 't' sounds as in 'talk,' 'attic,' and 'bat'"
											FieldTextBoxTabIndex="12" DatabaseField="pdt139" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="pdt140" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="140. Can make 'g' sounds as in 'go,' 'again,' and 'bag'"
											FieldTextBoxTabIndex="12" DatabaseField="pdt140" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="pdt141" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="141. Can make 'ay' sounds as in 'bay'"
											FieldTextBoxTabIndex="12" DatabaseField="pdt141" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="pdt142" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="142. Can make 'uy' sounds as in 'buy'"
											FieldTextBoxTabIndex="12" DatabaseField="pdt142" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="pdt143" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="143. Can make 'ow' sounds as in 'bout'"
											FieldTextBoxTabIndex="12" DatabaseField="pdt143" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="pdt144" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="144. Can make 'oa' sounds as in 'boat'"
											FieldTextBoxTabIndex="12" DatabaseField="pdt144" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="pdt145" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="145. Uses pronouns correctly (e.g., he, she, I, you)"
											FieldTextBoxTabIndex="12" DatabaseField="pdt145" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="pdt146" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="146. Uses negatives correctly (e.g., won't, can't, never)"
											FieldTextBoxTabIndex="12" DatabaseField="pdt146" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="pdt147" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="147. Spontaneously asks 'what' questions (e.g., 'What is that?')"
											FieldTextBoxTabIndex="12" DatabaseField="pdt147" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="pdt148" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="148. Uses the future tense correctly (e.g., 'He will go to schoo1.')"
											FieldTextBoxTabIndex="12" DatabaseField="pdt148" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="pdt149" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="149. Uses past tense rule for irregular verbs correctly (e.g., 'I ran,' 'He sat,' 'It flew')"
											FieldTextBoxTabIndex="12" DatabaseField="pdt149" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="pdt150" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="150. Uses 's' in the third person singular (e.g., 'He goes to school.')"
											FieldTextBoxTabIndex="12" DatabaseField="pdt150" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="pdt151" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="151. Uses the regular past tense 'ed' rule correctly (e.g., 'he pushed')"
											FieldTextBoxTabIndex="12" DatabaseField="pdt151" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="pdt152" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="152. Uses the 'to be' verb form correctly (e.g., is, are, am, been)"
											FieldTextBoxTabIndex="12" DatabaseField="pdt152" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="pdt153" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="153. Uses sentences with indefinite and definite adjectives (e.g., 'Give me each one,' 'I want every piece of candy,' 'Give me some')"
											FieldTextBoxTabIndex="12" DatabaseField="pdt153" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="pdt154" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="154. Uses sentences with comparatives (e.g., 'He runs faster than me,' 'He's the slowest kid')"
											FieldTextBoxTabIndex="12" DatabaseField="pdt154" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="pdt155" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="155. Uses sentences with adverbs (e.g., 'He ran slowly,' 'She ate quickly')"
											FieldTextBoxTabIndex="12" DatabaseField="pdt155" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="pdt156" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="156. Uses sentences with past participles (e.g., 'It's all gone,' 'I've eaten that already,' 'Where have you been?')"
											FieldTextBoxTabIndex="12" DatabaseField="pdt156" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="pdt157" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="157. Expresses interest in what he/she is saying by his/her tone of voice"
											FieldTextBoxTabIndex="12" DatabaseField="pdt157" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="pdt158" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="158. Expresses happiness with his/her tone of voice when speaking"
											FieldTextBoxTabIndex="12" DatabaseField="pdt158" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="pdt159" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="159. Comments about hislher own behavior (e.g., 'oops') with appropriate tone of voice"
											FieldTextBoxTabIndex="12" DatabaseField="pdt159" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="pdt160" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="160. Expresses excitement with tone of voice when speaking"
											FieldTextBoxTabIndex="12" DatabaseField="pdt160" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="pdt161" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="161. Adds qualifying words to nouns so that others will understand what or whom he/she is talking about (e.g., 'John, my brother, is nine years ald.')"
											FieldTextBoxTabIndex="12" DatabaseField="pdt161" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="pdt162" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="162. Adds more details to a sentence if others' body language, laughter, or facial expressions indicate that they don't understand what he/she has said"
											FieldTextBoxTabIndex="12" DatabaseField="pdt162" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="pdt163" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="163. Listens to, waits for others to speak during conversations, and appropriately acknowledges their statements (e.g., 'I understand what you're saying but...')"
											FieldTextBoxTabIndex="12" DatabaseField="pdt163" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="pdt164" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="164. Understands the need to provide a relevant amount of information when asked a question so that others will understand and will be satisfied (i.e., not too little and not too much detail)"
											FieldTextBoxTabIndex="12" DatabaseField="pdt164" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="pdt165" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="165. Quickly learns and remembers songs (e.g., anticipates the next word of the song, plays the song on an instrument, follows the movements to the song)"
											FieldTextBoxTabIndex="12" DatabaseField="pdt165" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="pdt166" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="166. Quickly learns and remembers multiple-step movement sequences that he/she has been shown how to do (e.g., putting on shirt, pants, and shoes; tying shoes)"
											FieldTextBoxTabIndex="12" DatabaseField="pdt166" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="pdt167" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="167. Quickly learns and follows routines (e.g., classroom schedules)"
											FieldTextBoxTabIndex="12" DatabaseField="pdt167" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="pdt168" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="168. Performs three- or more-step unrelated commands from memory (e.g., touches shoe, turns around, and sits down, in that order, after first being told to 'First touch shoe, then turn around, then sit down')"
											FieldTextBoxTabIndex="12" DatabaseField="pdt168" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="pdt169" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="169. Understands the concept of where things are located (e.g., will point to toys placed in different locations; will touch body parts on self and on others)"
											FieldTextBoxTabIndex="12" DatabaseField="pdt169" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="pdt170" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="170. Understands the concept of 'in,' 'on,' and 'under' by doing the action when asked without the help of gestures"
											FieldTextBoxTabIndex="12" DatabaseField="pdt170" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="pdt171" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="171. Understands a variety of subject-verb combinations (e.g., 'Make the doll dance,' 'Make mommy laugh')"
											FieldTextBoxTabIndex="12" DatabaseField="pdt171" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="pdt172" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="172. Understands the concept of 'conjunction' (e.g., will comply when asked 'Give me the ball and the cup')"
											FieldTextBoxTabIndex="12" DatabaseField="pdt172" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="pdt173" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="173. Understands big versus little (e.g., by giving the big ball instead of the little one, when asked, without the help of gestures)"
											FieldTextBoxTabIndex="12" DatabaseField="pdt173" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="pdt174" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="174. Responds correctly to questions asking for one and for all objects (e.g., 'Give me one apple,' 'Give me all of the apples') without the help of gestures"
											FieldTextBoxTabIndex="12" DatabaseField="pdt174" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="pdt175" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="175. Responds correctly to requests that involve directions and modifiers (e.g., 'Walk quickly,' 'Walk slowly,' 'Talk loudly')"
											FieldTextBoxTabIndex="12" DatabaseField="pdt175" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="pdt176" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="176. Indicates understanding of basic colors (i.e., red, green, blue, yellow), hot and cold, and rough and smooth concepts by correctly labeling, touching, or pointing"
											FieldTextBoxTabIndex="12" DatabaseField="pdt176" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="pdt177" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="177. Matches real objects to each other (e.g., puts shoe with shoe, ball with ball)"
											FieldTextBoxTabIndex="12" DatabaseField="pdt177" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="pdt178" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="178. Matches picture of object to real object (e.g., puts picture of shoe with real shoe, picture of ball with real ball)"
											FieldTextBoxTabIndex="12" DatabaseField="pdt178" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="pdt179" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="179. Matches verbal label of object to real object (e.g., touches shoe when told to touch shoe, touches ball when told to touch ball)"
											FieldTextBoxTabIndex="12" DatabaseField="pdt179" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="pdt180" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="450px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="180. Matches verbal label of object to its picture (e.g., touches picture of shoe when told to touch shoe, touches picture of ball when told to touch ball)"
											FieldTextBoxTabIndex="12" DatabaseField="pdt180" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="pdtvld" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="80px" FieldDataType="INT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="Validity (1=Valid, 2=Questionable, 3=Invalid)"
											FieldTextBoxTabIndex="348" DatabaseField="pdtvld" ValidList="1,2,3"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="pdtcmt" runat="server" FieldTextBoxWidth="300px" FieldLabelWidth="80px" FieldDataType="TEXT"
											IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False"
											IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="Comments" FieldTextBoxTabIndex="349"
											DatabaseField="pdtcmt" FieldTextBoxHeight="150px" FieldTextBoxMaxLength="400" FieldTextBoxTextMode="MultiLine"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
							<BR>
							<TABLE class="layout">
								<TR>
									<TD>
										<def:datafieldcontrol id="pdtdob" runat="server" FieldLabelWidth="60px" FieldDataType="DATE" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True"
											IsDoubleEntryField="False" FieldLabelText="DOB:" FieldTextBoxTabIndex="8" DatabaseField="pdtdob" FormatString="{0:d}"
											RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="pdtsex" runat="server" FieldLabelWidth="60px" FieldDataType="TEXT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True"
											IsDoubleEntryField="False" FieldLabelText="Sex:" FieldTextBoxTabIndex="9" DatabaseField="pdtsex" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="pdtagem" runat="server" FieldLabelWidth="80px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True"
											IsDoubleEntryField="False" FieldLabelText="Age (Months):" FieldTextBoxTabIndex="10" DatabaseField="pdtagem"
											RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="pdtageym" runat="server" FieldLabelWidth="80px" FieldDataType="TEXT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True"
											IsDoubleEntryField="False" FieldLabelText="Age (Y:M):" FieldTextBoxTabIndex="11" DatabaseField="pdtageym"
											RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
							<def:datafieldcontrol id="scoremsg" runat="server" FieldLabelWidth="90px" FieldDataType="TEXT" IsInsertField="False"
								IsInsertValueRequired="False" IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True"
								IsDoubleEntryField="False" FieldLabelText="Scoring Status:" FieldTextBoxTabIndex="350" DatabaseField="pdtscrmsg"
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
										<def:datafieldcontrol id="pdtseR" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="Sensory/Perceptual Approach Behaviors (SENSORY) RAW"
											FieldTextBoxTabIndex="20" DatabaseField="pdtseR" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="pdtseT" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="Sensory/Perceptual Approach Behaviors (SENSORY) T"
											FieldTextBoxTabIndex="20" DatabaseField="pdtseT" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="pdtseCI" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="Sensory/Perceptual Approach Behaviors (SENSORY) CI"
											FieldTextBoxTabIndex="20" DatabaseField="pdtseCI" FormatString="+-{0}" RenderReadOnlyAsDiv="True"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD class="heading" width="220">Ritualisms/Resistance to Change (RITUAL)</TD>
									<TD>
										<def:datafieldcontrol id="pdtriR" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="Ritualisms/Resistance to Change (RITUAL) RAW"
											FieldTextBoxTabIndex="20" DatabaseField="pdtriR" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="pdtriT" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="Ritualisms/Resistance to Change (RITUAL) T"
											FieldTextBoxTabIndex="20" DatabaseField="pdtriT" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="pdtriCI" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="Ritualisms/Resistance to Change (RITUAL) CI"
											FieldTextBoxTabIndex="20" DatabaseField="pdtriCI" FormatString="+-{0}" RenderReadOnlyAsDiv="True"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD class="heading" width="220">Social Pragmatic Problems (SOCPP)</TD>
									<TD>
										<def:datafieldcontrol id="pdtsoR" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="Social Pragmatic Problems (SOCPP) RAW"
											FieldTextBoxTabIndex="20" DatabaseField="pdtsoR" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="pdtsoT" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="Social Pragmatic Problems (SOCPP) T"
											FieldTextBoxTabIndex="20" DatabaseField="pdtsoT" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="pdtsoCI" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="Social Pragmatic Problems (SOCPP) CI"
											FieldTextBoxTabIndex="20" DatabaseField="pdtsoCI" FormatString="+-{0}" RenderReadOnlyAsDiv="True"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD class="heading" width="220">Semantic/Pragmatic Problems (SEMPP)</TD>
									<TD>
										<def:datafieldcontrol id="pdtspR" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="Semantic/Pragmatic Problems (SEMPP) RAW"
											FieldTextBoxTabIndex="20" DatabaseField="pdtspR" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="pdtspT" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="Semantic/Pragmatic Problems (SEMPP) T"
											FieldTextBoxTabIndex="20" DatabaseField="pdtspT" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="pdtspCI" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="Semantic/Pragmatic Problems (SEMPP) CI"
											FieldTextBoxTabIndex="20" DatabaseField="pdtspCI" FormatString="+-{0}" RenderReadOnlyAsDiv="True"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD class="heading" width="220">Arousal Regulation Problems (AROUSE)</TD>
									<TD>
										<def:datafieldcontrol id="pdtarR" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="Arousal Regulation Problems (AROUSE) RAW"
											FieldTextBoxTabIndex="20" DatabaseField="pdtarR" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="pdtarT" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="Arousal Regulation Problems (AROUSE) T"
											FieldTextBoxTabIndex="20" DatabaseField="pdtarT" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="pdtarCI" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="Arousal Regulation Problems (AROUSE) CI"
											FieldTextBoxTabIndex="20" DatabaseField="pdtarCI" FormatString="+-{0}" RenderReadOnlyAsDiv="True"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD class="heading" width="220">Specific Fears (FEARS)</TD>
									<TD>
										<def:datafieldcontrol id="pdtfeR" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="Specific Fears (FEARS) RAW"
											FieldTextBoxTabIndex="20" DatabaseField="pdtfeR" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="pdtfeT" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="Specific Fears (FEARS) T"
											FieldTextBoxTabIndex="20" DatabaseField="pdtfeT" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="pdtfeCI" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="Specific Fears (FEARS) CI"
											FieldTextBoxTabIndex="20" DatabaseField="pdtfeCI" FormatString="+-{0}" RenderReadOnlyAsDiv="True"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD class="heading" width="220">Aggressiveness (AGG)</TD>
									<TD>
										<def:datafieldcontrol id="pdtagR" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="Aggressiveness (AGG) RAW"
											FieldTextBoxTabIndex="20" DatabaseField="pdtagR" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="pdtagT" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="Aggressiveness (AGG) T"
											FieldTextBoxTabIndex="20" DatabaseField="pdtagT" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="pdtagCI" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="Aggressiveness (AGG) CI"
											FieldTextBoxTabIndex="20" DatabaseField="pdtagCI" FormatString="+-{0}" RenderReadOnlyAsDiv="True"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD class="heading" width="220">Repetitive, Ritualistic, and Pragmatic Problems 
										Composite (REPRIT/C)</TD>
									<TD>
										<def:datafieldcontrol id="pdtrcR" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="Repetitive, Ritualistic, and Pragmatic Problems Composite (REPRIT/C) RAW"
											FieldTextBoxTabIndex="20" DatabaseField="pdtrcR" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="pdtrcT" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="Repetitive, Ritualistic, and Pragmatic Problems Composite (REPRIT/C) T"
											FieldTextBoxTabIndex="20" DatabaseField="pdtrcT" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="pdtrcCI" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="Repetitive, Ritualistic, and Pragmatic Problems Composite (REPRIT/C) CI"
											FieldTextBoxTabIndex="20" DatabaseField="pdtrcCI" FormatString="+-{0}" RenderReadOnlyAsDiv="True"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD class="heading" width="220">Approach/Withdrawal Problems Composite (AWP/C)</TD>
									<TD>
										<def:datafieldcontrol id="pdtacR" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="Approach/Withdrawal Problems Composite (AWP/C) RAW"
											FieldTextBoxTabIndex="20" DatabaseField="pdtacR" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="pdtacT" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="Approach/Withdrawal Problems Composite (AWP/C) T"
											FieldTextBoxTabIndex="20" DatabaseField="pdtacT" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="pdtacCI" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="Approach/Withdrawal Problems Composite (AWP/C) CI"
											FieldTextBoxTabIndex="20" DatabaseField="pdtacCI" FormatString="+-{0}" RenderReadOnlyAsDiv="True"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD colSpan="4">Receptive/Expressive Social Communication Abilities</TD>
								</TR>
								<TR>
									<TD class="heading" width="220">Social Approach Behaviors (SOCAPP)</TD>
									<TD>
										<def:datafieldcontrol id="pdtsbR" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="Social Approach Behaviors (SOCAPP) RAW"
											FieldTextBoxTabIndex="20" DatabaseField="pdtsbR" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="pdtsbT" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="Social Approach Behaviors (SOCAPP) T"
											FieldTextBoxTabIndex="20" DatabaseField="pdtsbT" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="pdtsbCI" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="Social Approach Behaviors (SOCAPP) CI"
											FieldTextBoxTabIndex="20" DatabaseField="pdtsbCI" FormatString="+-{0}" RenderReadOnlyAsDiv="True"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD class="heading" width="220">Expressive Language (EXPRESS)</TD>
									<TD>
										<def:datafieldcontrol id="pdtexR" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="Expressive Language (EXPRESS) RAW"
											FieldTextBoxTabIndex="20" DatabaseField="pdtexR" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="pdtexT" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="Expressive Language (EXPRESS) T"
											FieldTextBoxTabIndex="20" DatabaseField="pdtexT" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="pdtexCI" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="Expressive Language (EXPRESS) CI"
											FieldTextBoxTabIndex="20" DatabaseField="pdtexCI" FormatString="+-{0}" RenderReadOnlyAsDiv="True"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD class="heading" width="220">Learning, Memory and Receptive language (LMRL)</TD>
									<TD>
										<def:datafieldcontrol id="pdtlmR" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="Learning, Memory and Receptive language (LMRL) RAW"
											FieldTextBoxTabIndex="20" DatabaseField="pdtlmR" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="pdtlmT" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="Learning, Memory and Receptive language (LMRL) T"
											FieldTextBoxTabIndex="20" DatabaseField="pdtlmT" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="pdtlmCI" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="Learning, Memory and Receptive language (LMRL) CI"
											FieldTextBoxTabIndex="20" DatabaseField="pdtlmCI" FormatString="+-{0}" RenderReadOnlyAsDiv="True"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD class="heading" width="220">Expressive Social Communication Abilities Composite 
										(EXSCA/C)</TD>
									<TD>
										<def:datafieldcontrol id="pdtesR" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="Expressive Social Communication Abilities Composite (EXSCA/C) RAW"
											FieldTextBoxTabIndex="20" DatabaseField="pdtesR" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="pdtesT" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="Expressive Social Communication Abilities Composite (EXSCA/C) T"
											FieldTextBoxTabIndex="20" DatabaseField="pdtesT" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="pdtesCI" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="Expressive Social Communication Abilities Composite (EXSCA/C) CI"
											FieldTextBoxTabIndex="20" DatabaseField="pdtesCI" FormatString="+-{0}" RenderReadOnlyAsDiv="True"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD class="heading" width="220">Receptive/Expressive Social Communication Abilities 
										Composite (REXSCA/C)</TD>
									<TD>
										<def:datafieldcontrol id="pdtrsR" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="Receptive/Expressive Social Communication Abilities Composite (REXSCA/C) RAW"
											FieldTextBoxTabIndex="20" DatabaseField="pdtrsR" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="pdtrsT" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="Receptive/Expressive Social Communication Abilities Composite (REXSCA/C) T"
											FieldTextBoxTabIndex="20" DatabaseField="pdtrsT" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="pdtrsCI" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="Receptive/Expressive Social Communication Abilities Composite (REXSCA/C) CI"
											FieldTextBoxTabIndex="20" DatabaseField="pdtrsCI" FormatString="+-{0}" RenderReadOnlyAsDiv="True"
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
										<def:datafieldcontrol id="pdtaucR" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="Autism Composite (AUTISM)-RAW"
											FieldTextBoxTabIndex="344" DatabaseField="pdtaucR" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="pdtaucT" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="Autism Composite (AUTISM)-T"
											FieldTextBoxTabIndex="345" DatabaseField="pdtaucT" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="Datafieldcontrol15" runat="server" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True"
											IsDoubleEntryField="False" FieldLabelText="Autism Composite (AUTISM)-90% CI" FieldTextBoxTabIndex="347"
											DatabaseField="pdtaucCI" FormatString="+-{0}" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
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
										<def:datafieldcontrol id="pdtsevbr" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="Visual Behaviors"
											FieldTextBoxTabIndex="30" DatabaseField="pdtsevbr" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="pdtsevbx" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="Visual Behaviors Range"
											FieldTextBoxTabIndex="30" DatabaseField="pdtsevbx" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD width="235">Non-Food Taste or Smell Behaviors</TD>
									<TD>
										<def:datafieldcontrol id="pdtsenbr" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="Non-Food Taste or Smell Behaviors"
											FieldTextBoxTabIndex="30" DatabaseField="pdtsenbr" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="pdtsenbx" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="Non-Food Taste or Smell Behaviors Range"
											FieldTextBoxTabIndex="30" DatabaseField="pdtsenbx" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD width="235">Noise Making Behaviors</TD>
									<TD>
										<def:datafieldcontrol id="pdtsembr" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="Noise Making Behaviors"
											FieldTextBoxTabIndex="30" DatabaseField="pdtsembr" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="pdtsembx" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="Noise Making Behaviors Range"
											FieldTextBoxTabIndex="30" DatabaseField="pdtsembx" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD width="235">Proprioceptive/Kinesthetic Behaviors</TD>
									<TD>
										<def:datafieldcontrol id="pdtsepbr" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="Proprioceptive/Kinesthetic Behaviors"
											FieldTextBoxTabIndex="30" DatabaseField="pdtsepbr" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="pdtsepbx" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="Proprioceptive/Kinesthetic Behaviors Range"
											FieldTextBoxTabIndex="30" DatabaseField="pdtsepbx" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD width="235">Repetitive Manipulative Behaviors</TD>
									<TD>
										<def:datafieldcontrol id="pdtserbr" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="Repetitive Manipulative Behaviors"
											FieldTextBoxTabIndex="30" DatabaseField="pdtserbr" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="pdtserbx" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="Repetitive Manipulative Behaviors Range"
											FieldTextBoxTabIndex="30" DatabaseField="pdtserbx" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD width="235">Gait-Based (Walking) Kinesthetic Behaviors</TD>
									<TD>
										<def:datafieldcontrol id="pdtsegbr" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="Gait-Based (Walking) Kinesthetic Behaviors"
											FieldTextBoxTabIndex="30" DatabaseField="pdtsegbr" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="pdtsegbx" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="Gait-Based (Walking) Kinesthetic Behaviors Range"
											FieldTextBoxTabIndex="30" DatabaseField="pdtsegbx" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD class="heading" colSpan="3">Ritualisms/Resistance to Change (RITUAL)</TD>
								</TR>
								<TR>
									<TD width="235">Resistance to Change in the Environment</TD>
									<TD>
										<def:datafieldcontrol id="pdtrircr" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="Resistance to Change in the Environment"
											FieldTextBoxTabIndex="30" DatabaseField="pdtrircr" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="pdtrircx" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="Resistance to Change in the Environment Range"
											FieldTextBoxTabIndex="30" DatabaseField="pdtrircx" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD width="235">Resistance to Change in Schedules/Routines</TD>
									<TD>
										<def:datafieldcontrol id="pdtrirsr" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="Resistance to Change in Schedules/Routines"
											FieldTextBoxTabIndex="30" DatabaseField="pdtrirsr" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="pdtrirsx" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="Resistance to Change in Schedules/Routines Range"
											FieldTextBoxTabIndex="30" DatabaseField="pdtrirsx" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD width="235">Rituals</TD>
									<TD>
										<def:datafieldcontrol id="pdtririr" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="Rituals"
											FieldTextBoxTabIndex="30" DatabaseField="pdtririr" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="pdtririx" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="Rituals Range"
											FieldTextBoxTabIndex="30" DatabaseField="pdtririx" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD class="heading" colSpan="3">Social Pragmatic Problems (SOCPP)</TD>
								</TR>
								<TR>
									<TD width="235">Problems With Social Approach</TD>
									<TD>
										<def:datafieldcontrol id="pdtsopar" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="Problems With Social Approach"
											FieldTextBoxTabIndex="30" DatabaseField="pdtsopar" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="pdtsopax" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="Problems With Social Approach Range"
											FieldTextBoxTabIndex="30" DatabaseField="pdtsopax" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD width="235">Social Awareness Problems</TD>
									<TD>
										<def:datafieldcontrol id="pdtsospr" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="Social Awareness Problems"
											FieldTextBoxTabIndex="30" DatabaseField="pdtsospr" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="pdtsospx" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="Social Awareness Problems Range"
											FieldTextBoxTabIndex="30" DatabaseField="pdtsospx" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD width="235">Inappropriate Reactions to the Approaches of Others</TD>
									<TD>
										<def:datafieldcontrol id="pdtsoirr" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="Inappropriate Reactions to the Approaches of Others"
											FieldTextBoxTabIndex="30" DatabaseField="pdtsoirr" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="pdtsoirx" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="Inappropriate Reactions to the Approaches of Others Range"
											FieldTextBoxTabIndex="30" DatabaseField="pdtsoirx" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD class="heading" colSpan="3">Semantic/Pragmatic Problems (SEMPP)</TD>
								</TR>
								<TR>
									<TD width="235">Aberrant Vocal Quality When Speaking</TD>
									<TD>
										<def:datafieldcontrol id="pdtspaqr" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="Aberrant Vocal Quality When Speaking"
											FieldTextBoxTabIndex="30" DatabaseField="pdtspaqr" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="pdtspaqx" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="Aberrant Vocal Quality When Speaking Range"
											FieldTextBoxTabIndex="30" DatabaseField="pdtspaqx" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD width="235">Problems With Understanding Words</TD>
									<TD>
										<def:datafieldcontrol id="pdtsppur" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="Problems With Understanding Words"
											FieldTextBoxTabIndex="30" DatabaseField="pdtsppur" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="pdtsppux" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="Problems With Understanding Words Range"
											FieldTextBoxTabIndex="30" DatabaseField="pdtsppux" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD width="235">Verbal Pragmatic Deficits</TD>
									<TD>
										<def:datafieldcontrol id="pdtspvdr" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="Verbal Pragmatic Deficits"
											FieldTextBoxTabIndex="30" DatabaseField="pdtspvdr" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="pdtspvdx" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="Verbal Pragmatic Deficits Range"
											FieldTextBoxTabIndex="30" DatabaseField="pdtspvdx" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD class="heading" colSpan="3">Arousal Regulation Problems (AROUSE)</TD>
								</TR>
								<TR>
									<TD width="235">Kinesthetic Behaviors</TD>
									<TD>
										<def:datafieldcontrol id="pdtarkbr" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="Kinesthetic Behaviors"
											FieldTextBoxTabIndex="30" DatabaseField="pdtarkbr" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="pdtarkbx" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="Kinesthetic Behaviors Range"
											FieldTextBoxTabIndex="30" DatabaseField="pdtarkbx" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD width="235">Reduced Responsiveness</TD>
									<TD>
										<def:datafieldcontrol id="pdtarrrr" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="Reduced Responsiveness"
											FieldTextBoxTabIndex="30" DatabaseField="pdtarrrr" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="pdtarrrx" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="Reduced Responsiveness Range"
											FieldTextBoxTabIndex="30" DatabaseField="pdtarrrx" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD class="heading" colSpan="3">Specific Fears (FEARS)</TD>
								</TR>
								<TR>
									<TD width="235">Social Withdrawal Behaviors</TD>
									<TD>
										<def:datafieldcontrol id="pdtfesbr" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="Social Withdrawal Behaviors"
											FieldTextBoxTabIndex="30" DatabaseField="pdtfesbr" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="pdtfesbx" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="Social Withdrawal Behaviors Range"
											FieldTextBoxTabIndex="30" DatabaseField="pdtfesbx" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD width="235">Auditory Withdrawal Behaviors</TD>
									<TD>
										<def:datafieldcontrol id="pdtfeabr" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="Auditory Withdrawal Behaviors"
											FieldTextBoxTabIndex="30" DatabaseField="pdtfeabr" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="pdtfeabx" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="Auditory Withdrawal Behaviors Range"
											FieldTextBoxTabIndex="30" DatabaseField="pdtfeabx" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD width="235">Fears and Anxieties</TD>
									<TD>
										<def:datafieldcontrol id="pdtfefar" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="Fears and Anxieties"
											FieldTextBoxTabIndex="30" DatabaseField="pdtfefar" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="pdtfefax" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="Fears and Anxieties Range"
											FieldTextBoxTabIndex="30" DatabaseField="pdtfefax" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD class="heading" colSpan="3">Aggressiveness (AGG)</TD>
								</TR>
								<TR>
									<TD width="235">Self-Directed Aggressive Behaviors</TD>
									<TD>
										<def:datafieldcontrol id="pdtagsbr" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="Self-Directed Aggressive Behaviors"
											FieldTextBoxTabIndex="30" DatabaseField="pdtagsbr" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="pdtagsbx" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="Self-Directed Aggressive Behaviors Range"
											FieldTextBoxTabIndex="30" DatabaseField="pdtagsbx" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD width="235">Incongruous Negative Affect</TD>
									<TD>
										<def:datafieldcontrol id="pdtagiar" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="Incongruous Negative Affect"
											FieldTextBoxTabIndex="30" DatabaseField="pdtagiar" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="pdtagiax" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="Incongruous Negative Affect Range"
											FieldTextBoxTabIndex="30" DatabaseField="pdtagiax" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD width="235">Problems When Caregiver or Other Significant Figure Returns From 
										Work, an Outing, or Vacation</TD>
									<TD>
										<def:datafieldcontrol id="pdtagpcr" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="Problems When Caregiver or Other Significant Figure Returns From Work, an Outing, or Vacation"
											FieldTextBoxTabIndex="30" DatabaseField="pdtagpcr" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="pdtagpcx" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="Problems When Caregiver or Other Significant Figure Returns From Work, an Outing, or Vacation Range"
											FieldTextBoxTabIndex="30" DatabaseField="pdtagpcx" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD width="235">Aggressiveness Toward Others</TD>
									<TD>
										<def:datafieldcontrol id="pdtagaor" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="Aggressiveness Toward Others"
											FieldTextBoxTabIndex="30" DatabaseField="pdtagaor" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="pdtagaox" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="Aggressiveness Toward Others Range"
											FieldTextBoxTabIndex="30" DatabaseField="pdtagaox" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD width="235">Overall Temperament Problems</TD>
									<TD>
										<def:datafieldcontrol id="pdtagopr" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="Overall Temperament Problems"
											FieldTextBoxTabIndex="30" DatabaseField="pdtagopr" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="pdtagopx" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="Overall Temperament Problems Range"
											FieldTextBoxTabIndex="30" DatabaseField="pdtagopx" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD class="heading" colSpan="3">Social Approach Behaviors (SOCAPP)</TD>
								</TR>
								<TR>
									<TD width="235">Visual Social Approach Behaviors</TD>
									<TD>
										<def:datafieldcontrol id="pdtsbvbr" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="Visual Social Approach Behaviors"
											FieldTextBoxTabIndex="30" DatabaseField="pdtsbvbr" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="pdtsbvbx" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="Visual Social Approach Behaviors Range"
											FieldTextBoxTabIndex="30" DatabaseField="pdtsbvbx" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD width="235">Positive Affect Behaviors</TD>
									<TD>
										<def:datafieldcontrol id="pdtsbpbr" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="Positive Affect Behaviors"
											FieldTextBoxTabIndex="30" DatabaseField="pdtsbpbr" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="pdtsbpbx" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="Positive Affect Behaviors Range"
											FieldTextBoxTabIndex="30" DatabaseField="pdtsbpbx" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD width="235">Gestural Approach Behaviors</TD>
									<TD>
										<def:datafieldcontrol id="pdtsbgbr" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="Gestural Approach Behaviors"
											FieldTextBoxTabIndex="30" DatabaseField="pdtsbgbr" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="pdtsbgbx" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="Gestural Approach Behaviors Range"
											FieldTextBoxTabIndex="30" DatabaseField="pdtsbgbx" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD width="235">Responsiveness to Social Inhibition Cues</TD>
									<TD>
										<def:datafieldcontrol id="pdtsbrir" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="Responsiveness to Social Inhibition Cues"
											FieldTextBoxTabIndex="30" DatabaseField="pdtsbrir" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="pdtsbrix" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="Responsiveness to Social Inhibition Cues Range"
											FieldTextBoxTabIndex="30" DatabaseField="pdtsbrix" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD width="235">Social Play Behaviors</TD>
									<TD>
										<def:datafieldcontrol id="pdtsbspr" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="Social Play Behaviors"
											FieldTextBoxTabIndex="30" DatabaseField="pdtsbspr" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="pdtsbspx" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="Social Play Behaviors Range"
											FieldTextBoxTabIndex="30" DatabaseField="pdtsbspx" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD width="235">Imaginative Play Behaviors</TD>
									<TD>
										<def:datafieldcontrol id="pdtsbibr" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="Imaginative Play Behaviors"
											FieldTextBoxTabIndex="30" DatabaseField="pdtsbibr" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="pdtsbibx" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="Imaginative Play Behaviors Range"
											FieldTextBoxTabIndex="30" DatabaseField="pdtsbibx" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD width="235">Empathy Behaviors</TD>
									<TD>
										<def:datafieldcontrol id="pdtsbebr" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="Empathy Behaviors"
											FieldTextBoxTabIndex="30" DatabaseField="pdtsbebr" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="pdtsbebx" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="Empathy Behaviors Range"
											FieldTextBoxTabIndex="30" DatabaseField="pdtsbebx" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD width="235">Social Imitative Behaviors</TD>
									<TD>
										<def:datafieldcontrol id="pdtsbsir" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="Social Imitative Behaviors"
											FieldTextBoxTabIndex="30" DatabaseField="pdtsbsir" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="pdtsbsix" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="Social Imitative Behaviors Range"
											FieldTextBoxTabIndex="30" DatabaseField="pdtsbsix" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD class="heading" colSpan="3">Expressive Language (EXPRESS)</TD>
								</TR>
								<TR>
									<TD width="235">Basic Vowel Production</TD>
									<TD>
										<def:datafieldcontrol id="pdtexvpr" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="Basic Vowel Production"
											FieldTextBoxTabIndex="30" DatabaseField="pdtexvpr" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="pdtexvpx" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="Basic Vowel Production Range"
											FieldTextBoxTabIndex="30" DatabaseField="pdtexvpx" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD width="235">Basic Consonant Production at the Beginning, Middle, and End of 
										Words</TD>
									<TD>
										<def:datafieldcontrol id="pdtexcpr" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="Basic Consonant Production at the Beginning, Middle, and End of Words"
											FieldTextBoxTabIndex="30" DatabaseField="pdtexcpr" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="pdtexcpx" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="Basic Consonant Production at the Beginning, Middle, and End of Words Range"
											FieldTextBoxTabIndex="30" DatabaseField="pdtexcpx" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD width="235">Basic Diphthong Production</TD>
									<TD>
										<def:datafieldcontrol id="pdtexdpr" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="Basic Diphthong Production"
											FieldTextBoxTabIndex="30" DatabaseField="pdtexdpr" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="pdtexdpx" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="Basic Diphthong Production Range"
											FieldTextBoxTabIndex="30" DatabaseField="pdtexdpx" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD width="235">Expressive Language Competence</TD>
									<TD>
										<def:datafieldcontrol id="pdtexelr" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="Expressive Language Competence"
											FieldTextBoxTabIndex="30" DatabaseField="pdtexelr" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="pdtexelx" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="Expressive Language Competence Range"
											FieldTextBoxTabIndex="30" DatabaseField="pdtexelx" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD width="235">Verbal Affective Tone</TD>
									<TD>
										<def:datafieldcontrol id="pdtexvar" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="Verbal Affective Tone"
											FieldTextBoxTabIndex="30" DatabaseField="pdtexvar" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="pdtexvax" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="Verbal Affective Tone Range"
											FieldTextBoxTabIndex="30" DatabaseField="pdtexvax" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD width="235">Pragmatic Conversational Skills</TD>
									<TD>
										<def:datafieldcontrol id="pdtexpcr" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="Pragmatic Conversational Skills"
											FieldTextBoxTabIndex="30" DatabaseField="pdtexpcr" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="pdtexpcx" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="Pragmatic Conversational Skills Range"
											FieldTextBoxTabIndex="30" DatabaseField="pdtexpcx" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD class="heading" colSpan="3">Learning, Memory and Receptive language (LMRL)</TD>
								</TR>
								<TR>
									<TD width="235">General Memory Skills</TD>
									<TD>
										<def:datafieldcontrol id="pdtlmgmr" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="General Memory Skills"
											FieldTextBoxTabIndex="30" DatabaseField="pdtlmgmr" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="pdtlmgmx" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="General Memory Skills Range"
											FieldTextBoxTabIndex="30" DatabaseField="pdtlmgmx" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD width="235">Receptive Language Competence</TD>
									<TD>
										<def:datafieldcontrol id="pdtlmrlr" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="Receptive Language Competence"
											FieldTextBoxTabIndex="30" DatabaseField="pdtlmrlr" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="pdtlmrlx" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="Receptive Language Competence Range"
											FieldTextBoxTabIndex="30" DatabaseField="pdtlmrlx" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD width="235">Associative Learning Skills</TD>
									<TD>
										<def:datafieldcontrol id="pdtlmasr" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="Associative Learning Skills"
											FieldTextBoxTabIndex="30" DatabaseField="pdtlmasr" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="pdtlmasx" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="Associative Learning Skills Range"
											FieldTextBoxTabIndex="30" DatabaseField="pdtlmasx" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
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
