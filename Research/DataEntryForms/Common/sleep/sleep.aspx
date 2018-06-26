<%@ Register TagPrefix="def" Namespace="DataEntryFramework" %>

<%@ Page language="c#" Inherits="KTDissDataEntryForms.kt_sleep.kt_sleep" CodeFile="sleep.aspx.cs"  MasterPageFile="~/UWAC.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="oBodyPlaceHolder" runat="server">
						<def:dataentrycontroller id="DataEntryController1" runat="server" DatabaseTable="all_sleep" LookupField1="id"
							LookupTextBox2Visible="False" LookupTextBox1LabelText="Subject ID:" MeasureName="Child Sleep Questions"
							PrimaryKeyField="sleep_pk" VerifiedField="verified" LookupField1DataType="TEXT" AllowedStudyMeasures="539,543"></def:dataentrycontroller>
						<table id="table_insert" class="layout">
							<tr>
								<td><def:datafieldcontrol id="id" runat="server" FieldDataType="TEXT" IsInsertField="True" IsInsertValueRequired="True"
										IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="ID"
										FieldTextBoxTabIndex="2" DatabaseField="id" FieldLabelWidth="60px" FieldTextBoxWidth="80px"></def:datafieldcontrol>
								</td>
							</tr>
						</table>
						<br>
						<asp:Panel Runat="server" ID="mainPanel">
							<def:datafieldcontrol id="slpby" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="300px" DatabaseField="slpby"
								FieldTextBoxTabIndex="3" FieldLabelText="Compled By (1=Mother, 2=Father, 3=Other, 9=Missing)" IsDoubleEntryField="True"
								IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
								FieldDataType="INT" ValidList="1,2,3,9"></def:datafieldcontrol>
							<TABLE class="grid">
								<TR>
									<TD class="heading">1 = Not a problem<BR>
										2 = Rarely a problem<BR>
										3 = Sometimes a problem<BR>
										4 = Frequently a problem<BR>
										9 = Missing/blank</TD>
								</TR>
							</TABLE>
							<BR>
							<TABLE class="grid" id="table_entry">
								<TR>
									<TD class="heading">I. Before bed</TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="slp101" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="300px" DatabaseField="slp101"
											FieldTextBoxTabIndex="4" FieldLabelText="1. Has trouble falling asleep" IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="slp102" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="300px" DatabaseField="slp102"
											FieldTextBoxTabIndex="5" FieldLabelText="2. Needs medication to help sleep" IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="slp103" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="300px" DatabaseField="slp103"
											FieldTextBoxTabIndex="6" FieldLabelText="3. Resists going to bed at night" IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="slp104" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="300px" DatabaseField="slp104"
											FieldTextBoxTabIndex="7" FieldLabelText="4. Throws tantrums before going to bed" IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="slp105" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="300px" DatabaseField="slp105"
											FieldTextBoxTabIndex="8" FieldLabelText="5. Needs-a favored object (e.g.  stuffed animal, toy, blanket,  pacifier) to-fall asleep"
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="slp106" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="300px" DatabaseField="slp106"
											FieldTextBoxTabIndex="9" FieldLabelText="6. Insists on falling asleep in places other than his/her bed"
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="slp107" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="300px" DatabaseField="slp107"
											FieldTextBoxTabIndex="10" FieldLabelText="7. Goes to bed at different times" IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
							<BR>
							<TABLE class="grid">
								<TR>
									<TD class="heading">II. Nighttime behavior</TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="slp201" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="300px" DatabaseField="slp201"
											FieldTextBoxTabIndex="11" FieldLabelText="1. Wakes up screaming or crying during the night" IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="slp202" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="300px" DatabaseField="slp202"
											FieldTextBoxTabIndex="12" FieldLabelText="2. Talks in sleep" IsDoubleEntryField="True" IsReadOnly="False"
											IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="slp203" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="300px" DatabaseField="slp203"
											FieldTextBoxTabIndex="13" FieldLabelText="3. Walks in sleep" IsDoubleEntryField="True" IsReadOnly="False"
											IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="slp204" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="300px" DatabaseField="slp204"
											FieldTextBoxTabIndex="14" FieldLabelText="4. Bangs head or rocks in sleep" IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="slp205" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="300px" DatabaseField="slp205"
											FieldTextBoxTabIndex="15" FieldLabelText="5. Grinds teeth in sleep" IsDoubleEntryField="True" IsReadOnly="False"
											IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="slp206" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="300px" DatabaseField="slp206"
											FieldTextBoxTabIndex="16" FieldLabelText="6. Jerks arms or legs in sleep ." IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="slp207" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="300px" DatabaseField="slp207"
											FieldTextBoxTabIndex="17" FieldLabelText="7. Seems to stop breathing during sleep." IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="slp208" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="300px" DatabaseField="slp208"
											FieldTextBoxTabIndex="18" FieldLabelText="8. Seems to have labored or difficult breathing during sleep"
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="slp209" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="300px" DatabaseField="slp209"
											FieldTextBoxTabIndex="19" FieldLabelText="9. Snores during sleep" IsDoubleEntryField="True" IsReadOnly="False"
											IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="slp210" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="300px" DatabaseField="slp210"
											FieldTextBoxTabIndex="20" FieldLabelText="10. Awakens during the night complaining of nightmares and can relate details"
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="slp211" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="300px" DatabaseField="slp211"
											FieldTextBoxTabIndex="21" FieldLabelText="11. Awakens during the night screaming in terror, but is difficult to awaken fully"
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="slp212" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="300px" DatabaseField="slp212"
											FieldTextBoxTabIndex="22" FieldLabelText="12. Awakens during the night to get a drink" IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="slp213" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="300px" DatabaseField="slp213"
											FieldTextBoxTabIndex="23" FieldLabelText="13. Awakens during the night to be changed or go to the bathroom"
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="slp214" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="300px" DatabaseField="slp214"
											FieldTextBoxTabIndex="24" FieldLabelText="14. Awakens during the night and goes to parents' bedroom"
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="slp215" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="300px" DatabaseField="slp215"
											FieldTextBoxTabIndex="25" FieldLabelText="15. Has seizures or convulsions during sleep.." IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="slp216" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="300px" DatabaseField="slp216"
											FieldTextBoxTabIndex="26" FieldLabelText="16. Wets bed at night" IsDoubleEntryField="True" IsReadOnly="False"
											IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
							<BR>
							<TABLE class="grid">
								<TR>
									<TD class="heading">III. Morning behavior</TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="slp301" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="300px" DatabaseField="slp301"
											FieldTextBoxTabIndex="27" FieldLabelText="1. A wakens looking tired" IsDoubleEntryField="True" IsReadOnly="False"
											IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="slp302" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="300px" DatabaseField="slp302"
											FieldTextBoxTabIndex="28" FieldLabelText="2. Awakens irritable and in a bad mood" IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="slp303" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="300px" DatabaseField="slp303"
											FieldTextBoxTabIndex="29" FieldLabelText="3. Difficult to awaken in the morning" IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="slp304" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="300px" DatabaseField="slp304"
											FieldTextBoxTabIndex="30" FieldLabelText="4. Wakes up at different times" IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
							<BR>
							<TABLE class="grid">
								<TR>
									<TD class="heading">IV. Daytime behavior</TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="slp401" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="300px" DatabaseField="slp401"
											FieldTextBoxTabIndex="31" FieldLabelText="1. Appears drowsy" IsDoubleEntryField="True" IsReadOnly="False"
											IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="slp402" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="300px" DatabaseField="slp402"
											FieldTextBoxTabIndex="32" FieldLabelText="2. Has urges to sleep during the day" IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="slp403" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="300px" DatabaseField="slp403"
											FieldTextBoxTabIndex="33" FieldLabelText="3. Takes naps during the day" IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
							<BR>
							<TABLE class="grid">
								<TR>
									<TD class="heading">V. Please rate your overall level of caregiver stress
										<BR>
										with your child's sleep behaviors</TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="slp5" runat="server" FieldTextBoxWidth="50px" FieldLabelWidth="300px" DatabaseField="slp5"
											FieldTextBoxTabIndex="34" FieldLabelText="On a scale of 1 to 4 (.25 increments)" IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="FLOAT" RegEx="^([1-4](\.00*)?|[1-3]\.50*|[1-3]\.25|[1-3]\.75|9)$" RegExDescription="Use .25 increments like 1, 2.25, 3.75 or 9 for missing."></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
							<BR>
							<TABLE class="grid">
								<TR>
									<TD class="heading">VI. Please rate your level of confidence in your ability<BR>
										to successfully manage your child's difficulties
										<BR>
										in this area</TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="slp6" runat="server" FieldTextBoxWidth="50px" FieldLabelWidth="300px" DatabaseField="slp6"
											FieldTextBoxTabIndex="35" FieldLabelText="On a scale of 1 to 4 (.25 increments)" IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="FLOAT" RegEx="^([1-4](\.00*)?|[1-3]\.50*|[1-3]\.25|[1-3]\.75|9)$" RegExDescription="Use .25 increments like 1, 2.25, 3.75 or 9 for missing."></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
							<BR>
							<TABLE class="grid">
								<TR>
									<TD class="heading">VII. Please list the top 3 sleep behaviors that you find
										<BR>
										most stressful about your child</TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="slp701" runat="server" FieldTextBoxWidth="250px" FieldLabelWidth="40px" DatabaseField="slp701"
											FieldTextBoxTabIndex="36" FieldLabelText="1." IsDoubleEntryField="False" IsReadOnly="False" IsEntryValueRequired="False"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="slp702" runat="server" FieldTextBoxWidth="250px" FieldLabelWidth="40px" DatabaseField="slp702"
											FieldTextBoxTabIndex="37" FieldLabelText="2." IsDoubleEntryField="False" IsReadOnly="False" IsEntryValueRequired="False"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="slp703" runat="server" FieldTextBoxWidth="250px" FieldLabelWidth="40px" DatabaseField="slp703"
											FieldTextBoxTabIndex="38" FieldLabelText="3." IsDoubleEntryField="False" IsReadOnly="False" IsEntryValueRequired="False"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
							<BR>
							<TABLE class="grid">
								<TR>
									<TD class="heading">VIII. Please list/describe any behavior or medication 
										interventions
										<BR>
										you are currently using to address your child's
										<BR>
										sleep difficulties</TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="slp8" runat="server" FieldTextBoxWidth="250px" FieldLabelWidth="300px" DatabaseField="slp8"
											FieldTextBoxTabIndex="39" FieldLabelText="slp8" IsDoubleEntryField="False" IsReadOnly="False" IsEntryValueRequired="False"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT" FieldTextBoxHeight="150px"
											FieldTextBoxMaxLength="400" FieldTextBoxTextMode="MultiLine" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
							<BR>
							<TABLE class="layout" id="table_readonly">
								<TR>
									<TD>
										<def:datafieldcontrol id="created" runat="server" FieldLabelWidth="80px" DatabaseField="created" FieldTextBoxTabIndex="41"
											FieldLabelText="created" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="DATE" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="createdBy" runat="server" FieldLabelWidth="80px" DatabaseField="createdBy" FieldTextBoxTabIndex="42"
											FieldLabelText="createdBy" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="updated" runat="server" FieldLabelWidth="80px" DatabaseField="updated" FieldTextBoxTabIndex="43"
											FieldLabelText="updated" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="DATE" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="updatedBy" runat="server" FieldLabelWidth="80px" DatabaseField="updatedBy" FieldTextBoxTabIndex="44"
											FieldLabelText="updatedBy" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
						</asp:Panel>
					</asp:Content>
