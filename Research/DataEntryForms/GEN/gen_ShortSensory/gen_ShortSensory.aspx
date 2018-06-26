
<%@ Register TagPrefix="def" Namespace="DataEntryFramework.Old" %>
<%@ Page language="c#" Inherits="gen_ShortSensory.gen_ShortSensory" CodeFile="gen_ShortSensory.aspx.cs"  MasterPageFile="~/UWAC.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="oBodyPlaceHolder" runat="server">
						<def:dataentrycontroller id="DataEntryController1" runat="server" LookupField1DataType="INT" VerifiedField="verified"
							PrimaryKeyField="ssp_pk" MeasureName="GEN Short Sensory Profile" LookupTextBox1LabelText="GEN ID:" LookupTextBox2Visible="False"
							LookupField1="indid" DatabaseTable="gen_sens" StudyMeasID="137"></def:dataentrycontroller>
						<table id="table_insert" class="layout">
							<tr>
								<td><def:datafieldcontrol id="INDID" runat="server" FieldDataType="INT" IsInsertField="True" IsInsertValueRequired="True"
										IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="GEN ID"
										FieldTextBoxTabIndex="2" DatabaseField="INDID" FieldLabelWidth="80px" FieldTextBoxWidth="80px"></def:datafieldcontrol>
								</td>
							</tr>
						</table>
						<br>
						<asp:Panel Runat="server" ID="mainPanel">
							<TABLE class="grid" id="table_entry">
								<TR>
									<TD colSpan="2">5 = Always<BR>
										4 = Often<BR>
										3 = Sometimes<BR>
										2 = Rarely<BR>
										1 = Never</TD>
								</TR>
								<TR>
									<TD class="heading">Past</TD>
									<TD class="heading">Present</TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="SENSPA01" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="250px" DatabaseField="SENSPA01"
											FieldTextBoxTabIndex="3" FieldLabelText="1. Blink at bright lights or seem irritated or fatigued by them?"
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="SENSPR01" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="250px" DatabaseField="SENSPR01"
											FieldTextBoxTabIndex="47" FieldLabelText="SENSPR01" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,9"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="SENSPA02" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="250px" DatabaseField="SENSPA02"
											FieldTextBoxTabIndex="4" FieldLabelText="2. Become easily distracted by visual stimulation? " IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="1,2,3,4,5,9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="SENSPR02" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="250px" DatabaseField="SENSPR02"
											FieldTextBoxTabIndex="48" FieldLabelText="SENSPR02" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,9"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="SENSPA03" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="250px" DatabaseField="SENSPA03"
											FieldTextBoxTabIndex="5" FieldLabelText="3. Avoid or have difficulty with eye contact? " IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="1,2,3,4,5,9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="SENSPR03" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="250px" DatabaseField="SENSPR03"
											FieldTextBoxTabIndex="49" FieldLabelText="SENSPR03" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,9"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="SENSPA04" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="250px" DatabaseField="SENSPA04"
											FieldTextBoxTabIndex="6" FieldLabelText="4. Have difficulty doing puzzles? " IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="1,2,3,4,5,9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="SENSPR04" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="250px" DatabaseField="SENSPR04"
											FieldTextBoxTabIndex="50" FieldLabelText="SENSPR04" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,9"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="SENSPA05" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="250px" DatabaseField="SENSPA05"
											FieldTextBoxTabIndex="7" FieldLabelText="5. Have difficulty finding a familiar face in a crowd? "
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="SENSPR05" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="250px" DatabaseField="SENSPR05"
											FieldTextBoxTabIndex="51" FieldLabelText="SENSPR05" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,9"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="SENSPA06" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="250px" DatabaseField="SENSPA06"
											FieldTextBoxTabIndex="8" FieldLabelText="6. Have difficulty following street signs when driving? "
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="SENSPR06" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="250px" DatabaseField="SENSPR06"
											FieldTextBoxTabIndex="52" FieldLabelText="SENSPR06" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,9"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="SENSPA07" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="250px" DatabaseField="SENSPA07"
											FieldTextBoxTabIndex="9" FieldLabelText="7. Seem overly sensitive to sounds? " IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="1,2,3,4,5,9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="SENSPR07" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="250px" DatabaseField="SENSPR07"
											FieldTextBoxTabIndex="53" FieldLabelText="SENSPR07" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,9"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="SENSPA08" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="250px" DatabaseField="SENSPA08"
											FieldTextBoxTabIndex="10" FieldLabelText="8. Become distracted by lots of noise? " IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="1,2,3,4,5,9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="SENSPR08" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="250px" DatabaseField="SENSPR08"
											FieldTextBoxTabIndex="54" FieldLabelText="SENSPR08" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,9"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="SENSPA09" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="250px" DatabaseField="SENSPA09"
											FieldTextBoxTabIndex="11" FieldLabelText="9. Become distracted by background noises such as refrigerators?"
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="SENSPR09" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="250px" DatabaseField="SENSPR09"
											FieldTextBoxTabIndex="55" FieldLabelText="SENSPR09" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,9"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="SENSPA10" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="250px" DatabaseField="SENSPA10"
											FieldTextBoxTabIndex="12" FieldLabelText="10. Have difficulty completing tasks when the radio is on?"
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="SENSPR10" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="250px" DatabaseField="SENSPR10"
											FieldTextBoxTabIndex="56" FieldLabelText="SENSPR10" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,9"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="SENSPA11" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="250px" DatabaseField="SENSPA11"
											FieldTextBoxTabIndex="13" FieldLabelText="11. React defensively to the taste and textures of foods? "
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="SENSPR11" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="250px" DatabaseField="SENSPR11"
											FieldTextBoxTabIndex="57" FieldLabelText="SENSPR11" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,9"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="SENSPA12" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="250px" DatabaseField="SENSPA12"
											FieldTextBoxTabIndex="14" FieldLabelText="12. Lick, suck, or chew on non-food items? " IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="1,2,3,4,5,9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="SENSPR12" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="250px" DatabaseField="SENSPR12"
											FieldTextBoxTabIndex="58" FieldLabelText="SENSPR12" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,9"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="SENSPA13" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="250px" DatabaseField="SENSPA13"
											FieldTextBoxTabIndex="15" FieldLabelText="13. Tend to explore with smell, deliberately smell objects?"
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="SENSPR13" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="250px" DatabaseField="SENSPR13"
											FieldTextBoxTabIndex="59" FieldLabelText="SENSPR13" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,9"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="SENSPA14" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="250px" DatabaseField="SENSPA14"
											FieldTextBoxTabIndex="16" FieldLabelText="14. Prefer smooth foods? " IsDoubleEntryField="True" IsReadOnly="False"
											IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="1,2,3,4,5,9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="SENSPR14" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="250px" DatabaseField="SENSPR14"
											FieldTextBoxTabIndex="60" FieldLabelText="SENSPR14" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,9"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="SENSPA15" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="250px" DatabaseField="SENSPA15"
											FieldTextBoxTabIndex="17" FieldLabelText="15. Prefer crunchy textured foods? " IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="1,2,3,4,5,9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="SENSPR15" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="250px" DatabaseField="SENSPR15"
											FieldTextBoxTabIndex="61" FieldLabelText="SENSPR15" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,9"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="SENSPA16" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="250px" DatabaseField="SENSPA16"
											FieldTextBoxTabIndex="18" FieldLabelText="16. Prefer foods of certain tastes? (sweet, sour, salty, spicy, "
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="SENSPR16" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="250px" DatabaseField="SENSPR16"
											FieldTextBoxTabIndex="62" FieldLabelText="SENSPR16" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,9"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="SENSPA17" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="250px" DatabaseField="SENSPA17"
											FieldTextBoxTabIndex="19" FieldLabelText="17. Seek fast movement activities? (biking, skiing) " IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="1,2,3,4,5,9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="SENSPR17" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="250px" DatabaseField="SENSPR17"
											FieldTextBoxTabIndex="63" FieldLabelText="SENSPR17" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,9"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="SENSPA18" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="250px" DatabaseField="SENSPA18"
											FieldTextBoxTabIndex="20" FieldLabelText="18. Avoid fast carnival rides that spin or go up and down?"
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="SENSPR18" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="250px" DatabaseField="SENSPR18"
											FieldTextBoxTabIndex="64" FieldLabelText="SENSPR18" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,9"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="SENSPA19" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="250px" DatabaseField="SENSPA19"
											FieldTextBoxTabIndex="21" FieldLabelText="19. Become upset if head was tilted backward or forward as in ha"
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="SENSPR19" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="250px" DatabaseField="SENSPR19"
											FieldTextBoxTabIndex="65" FieldLabelText="SENSPR19" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,9"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="SENSPA20" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="250px" DatabaseField="SENSPA20"
											FieldTextBoxTabIndex="22" FieldLabelText="20. Dislike roughhousing? " IsDoubleEntryField="True" IsReadOnly="False"
											IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="1,2,3,4,5,9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="SENSPR20" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="250px" DatabaseField="SENSPR20"
											FieldTextBoxTabIndex="66" FieldLabelText="SENSPR20" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,9"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="SENSPA21" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="250px" DatabaseField="SENSPA21"
											FieldTextBoxTabIndex="23" FieldLabelText="21. Rock in seat? " IsDoubleEntryField="True" IsReadOnly="False"
											IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="1,2,3,4,5,9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="SENSPR21" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="250px" DatabaseField="SENSPR21"
											FieldTextBoxTabIndex="67" FieldLabelText="SENSPR21" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,9"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="SENSPA22" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="250px" DatabaseField="SENSPA22"
											FieldTextBoxTabIndex="24" FieldLabelText="22. Have difficulty if not in front seat while riding in car?"
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="SENSPR22" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="250px" DatabaseField="SENSPR22"
											FieldTextBoxTabIndex="68" FieldLabelText="SENSPR22" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,9"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="SENSPA23" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="250px" DatabaseField="SENSPA23"
											FieldTextBoxTabIndex="25" FieldLabelText="23. Seem fearful of heights? " IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="1,2,3,4,5,9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="SENSPR23" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="250px" DatabaseField="SENSPR23"
											FieldTextBoxTabIndex="69" FieldLabelText="SENSPR23" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,9"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="SENSPA24" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="250px" DatabaseField="SENSPA24"
											FieldTextBoxTabIndex="26" FieldLabelText="24. Hesitate or avoid climbing on ladders? " IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="1,2,3,4,5,9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="SENSPR24" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="250px" DatabaseField="SENSPR24"
											FieldTextBoxTabIndex="70" FieldLabelText="SENSPR24" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,9"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="SENSPA25" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="250px" DatabaseField="SENSPA25"
											FieldTextBoxTabIndex="27" FieldLabelText="25. Get lost in new or familiar places? " IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="1,2,3,4,5,9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="SENSPR25" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="250px" DatabaseField="SENSPR25"
											FieldTextBoxTabIndex="71" FieldLabelText="SENSPR25" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,9"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="SENSPA26" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="250px" DatabaseField="SENSPA26"
											FieldTextBoxTabIndex="28" FieldLabelText="26. Have difficulty with motor tasks that have several steps?"
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="SENSPR26" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="250px" DatabaseField="SENSPR26"
											FieldTextBoxTabIndex="72" FieldLabelText="SENSPR26" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,9"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="SENSPA27" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="250px" DatabaseField="SENSPA27"
											FieldTextBoxTabIndex="29" FieldLabelText="27. Find small manipulative activities difficult? " IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="1,2,3,4,5,9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="SENSPR27" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="250px" DatabaseField="SENSPR27"
											FieldTextBoxTabIndex="73" FieldLabelText="SENSPR27" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,9"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="SENSPA28" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="250px" DatabaseField="SENSPA28"
											FieldTextBoxTabIndex="30" FieldLabelText="28. Avoid fine motor activities? " IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="1,2,3,4,5,9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="SENSPR28" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="250px" DatabaseField="SENSPR28"
											FieldTextBoxTabIndex="74" FieldLabelText="SENSPR28" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,9"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="SENSPA29" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="250px" DatabaseField="SENSPA29"
											FieldTextBoxTabIndex="31" FieldLabelText="29. Take a long time to do most motor tasks? (dressing) "
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="SENSPR29" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="250px" DatabaseField="SENSPR29"
											FieldTextBoxTabIndex="75" FieldLabelText="SENSPR29" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,9"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="SENSPA30" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="250px" DatabaseField="SENSPA30"
											FieldTextBoxTabIndex="32" FieldLabelText="30. Dislike participating in sports or games? " IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="1,2,3,4,5,9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="SENSPR30" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="250px" DatabaseField="SENSPR30"
											FieldTextBoxTabIndex="76" FieldLabelText="SENSPR30" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,9"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="SENSPA31" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="250px" DatabaseField="SENSPA31"
											FieldTextBoxTabIndex="33" FieldLabelText="31. Have difficulty learning exercise steps or routines? "
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="SENSPR31" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="250px" DatabaseField="SENSPR31"
											FieldTextBoxTabIndex="77" FieldLabelText="SENSPR31" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,9"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="SENSPA32" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="250px" DatabaseField="SENSPA32"
											FieldTextBoxTabIndex="34" FieldLabelText="32. Have difficulty reproducing a rhythm with your hands? "
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="SENSPR32" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="250px" DatabaseField="SENSPR32"
											FieldTextBoxTabIndex="78" FieldLabelText="SENSPR32" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,9"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="SENSPA33" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="250px" DatabaseField="SENSPA33"
											FieldTextBoxTabIndex="35" FieldLabelText="33. Dislike grooming activities? (haircutting, nail clipping)"
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="SENSPR33" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="250px" DatabaseField="SENSPR33"
											FieldTextBoxTabIndex="79" FieldLabelText="SENSPR33" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,9"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="SENSPA34" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="250px" DatabaseField="SENSPA34"
											FieldTextBoxTabIndex="36" FieldLabelText="34. Feel bothered by clothes? (turtlenecks, socks) " IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="1,2,3,4,5,9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="SENSPR34" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="250px" DatabaseField="SENSPR34"
											FieldTextBoxTabIndex="80" FieldLabelText="SENSPR34" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,9"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="SENSPA35" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="250px" DatabaseField="SENSPA35"
											FieldTextBoxTabIndex="37" FieldLabelText="35. Tend to prefer long sleeves and pants regardless of weather?"
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="SENSPR35" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="250px" DatabaseField="SENSPR35"
											FieldTextBoxTabIndex="81" FieldLabelText="SENSPR35" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,9"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="SENSPA36" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="250px" DatabaseField="SENSPA36"
											FieldTextBoxTabIndex="38" FieldLabelText="36. Dislike cloth of certain textures? " IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="1,2,3,4,5,9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="SENSPR36" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="250px" DatabaseField="SENSPR36"
											FieldTextBoxTabIndex="82" FieldLabelText="SENSPR36" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,9"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="SENSPA37" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="250px" DatabaseField="SENSPA37"
											FieldTextBoxTabIndex="39" FieldLabelText="37. Avoid getting hands into messy things? " IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="1,2,3,4,5,9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="SENSPR37" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="250px" DatabaseField="SENSPR37"
											FieldTextBoxTabIndex="83" FieldLabelText="SENSPR37" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,9"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="SENSPA38" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="250px" DatabaseField="SENSPA38"
											FieldTextBoxTabIndex="40" FieldLabelText="38. Notice irritating bumps on the bed sheets? " IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="1,2,3,4,5,9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="SENSPR38" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="250px" DatabaseField="SENSPR38"
											FieldTextBoxTabIndex="84" FieldLabelText="SENSPR38" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,9"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="SENSPA39" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="250px" DatabaseField="SENSPA39"
											FieldTextBoxTabIndex="41" FieldLabelText="39. Over or under dress for the temperature? " IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="1,2,3,4,5,9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="SENSPR39" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="250px" DatabaseField="SENSPR39"
											FieldTextBoxTabIndex="85" FieldLabelText="SENSPR39" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,9"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="SENSPA40" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="250px" DatabaseField="SENSPA40"
											FieldTextBoxTabIndex="42" FieldLabelText="40. Become irritated when splashed with water? " IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="1,2,3,4,5,9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="SENSPR40" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="250px" DatabaseField="SENSPR40"
											FieldTextBoxTabIndex="86" FieldLabelText="SENSPR40" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,9"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="SENSPA41" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="250px" DatabaseField="SENSPA41"
											FieldTextBoxTabIndex="43" FieldLabelText="41. Become angry or annoyed when touched or bumped unexpectedly?"
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="SENSPR41" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="250px" DatabaseField="SENSPR41"
											FieldTextBoxTabIndex="87" FieldLabelText="SENSPR41" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,9"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="SENSPA42" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="250px" DatabaseField="SENSPA42"
											FieldTextBoxTabIndex="44" FieldLabelText="42. Dislike going barefoot? " IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="1,2,3,4,5,9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="SENSPR42" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="250px" DatabaseField="SENSPR42"
											FieldTextBoxTabIndex="88" FieldLabelText="SENSPR42" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,9"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="SENSPA43" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="250px" DatabaseField="SENSPA43"
											FieldTextBoxTabIndex="45" FieldLabelText="43. Tend to remove shoes whenever possible? " IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="1,2,3,4,5,9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="SENSPR43" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="250px" DatabaseField="SENSPR43"
											FieldTextBoxTabIndex="89" FieldLabelText="SENSPR43" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,9"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="SENSPA44" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="250px" DatabaseField="SENSPA44"
											FieldTextBoxTabIndex="46" FieldLabelText="44. Tend not to feel pain as much as others? " IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="1,2,3,4,5,9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="SENSPR44" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="250px" DatabaseField="SENSPR44"
											FieldTextBoxTabIndex="90" FieldLabelText="SENSPR44" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,9"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
							<BR>
							<TABLE class="layout" id="table_readonly">
								<TR>
									<TD>
										<def:datafieldcontrol id="created" runat="server" FieldLabelWidth="80px" DatabaseField="created" FieldTextBoxTabIndex="92"
											FieldLabelText="created" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="DATE" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="createdBy" runat="server" FieldLabelWidth="80px" DatabaseField="createdBy" FieldTextBoxTabIndex="93"
											FieldLabelText="createdBy" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="updated" runat="server" FieldLabelWidth="80px" DatabaseField="updated" FieldTextBoxTabIndex="94"
											FieldLabelText="updated" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="DATE" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="updatedBy" runat="server" FieldLabelWidth="80px" DatabaseField="updatedBy" FieldTextBoxTabIndex="95"
											FieldLabelText="updatedBy" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
						</asp:Panel>
					</asp:Content>
