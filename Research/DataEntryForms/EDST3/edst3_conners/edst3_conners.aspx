<%@ Register TagPrefix="def" Namespace="DataEntryFramework.Old" %>

<%@ Page language="c#" Inherits="edst3_conners.edst3_conners" CodeFile="edst3_conners.aspx.cs"  MasterPageFile="~/UWAC.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="oBodyPlaceHolder" runat="server">
						<def:dataentrycontroller id="DataEntryController1" runat="server" VerifiedField="verified" PrimaryKeyField="con_pk"
							MeasureName="EDST3 CPRS-R" LookupTextBox1LabelText="EDS ID:" LookupTextBox2Visible="False" LookupField1="edsid"
							DatabaseTable="edst3_conners" StudyMeasID="207"></def:dataentrycontroller>
						<table class="layout" id="table_insert">
							<tr>
								<td><def:datafieldcontrol id="EDSID" runat="server" DatabaseField="EDSID" FieldTextBoxTabIndex="1" FieldLabelText="EDSID"
										IsDoubleEntryField="False" IsReadOnly="False" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="True"
										IsInsertField="True" FieldDataType="INT" FieldTextBoxWidth="80px" FieldLabelWidth="60px"></def:datafieldcontrol></td>
							</tr>
						</table>
						<br>
						<asp:panel id="mainPanel" Runat="server">
							<TABLE class="grid" id="table_entry">
								<TR>
									<TD class="heading">0 = NOT TRUE AT ALL, Never, Seldom<BR>
										1 = JUST A LITTLE TRUE, Occasionally<BR>
										2 = PRETTY MUCH TRUE, Often, Quite a bit<BR>
										3 = VERY MUCH TRUE, Very often, Very frequently<BR>
										9 = Missing/Blank<BR>
									</TD>
								</TR>
							</TABLE>
							<TABLE class="layout">
								<TR>
									<TD style="vertical-align:top">
										<TABLE class="grid">
											<TR>
												<TD>
													<def:datafieldcontrol id="con01" runat="server" FieldLabelWidth="200px" FieldTextBoxWidth="30px" FieldDataType="INT"
														IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
														IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="1. Inattentive, easily distracted" FieldTextBoxTabIndex="3"
														DatabaseField="con01" ValidList="0,1,2,3,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="con02" runat="server" FieldLabelWidth="200px" FieldTextBoxWidth="30px" FieldDataType="INT"
														IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
														IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="2. Angry and resentful" FieldTextBoxTabIndex="4"
														DatabaseField="con02" ValidList="0,1,2,3,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="con03" runat="server" FieldLabelWidth="200px" FieldTextBoxWidth="30px" FieldDataType="INT"
														IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
														IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="3. Difficulty doing or completing homework"
														FieldTextBoxTabIndex="5" DatabaseField="con03" ValidList="0,1,2,3,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="con04" runat="server" FieldLabelWidth="200px" FieldTextBoxWidth="30px" FieldDataType="INT"
														IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
														IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="4. Is always 'on the go' or acts as if driven by a motor"
														FieldTextBoxTabIndex="6" DatabaseField="con04" ValidList="0,1,2,3,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="con05" runat="server" FieldLabelWidth="200px" FieldTextBoxWidth="30px" FieldDataType="INT"
														IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
														IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="5. Short attention span" FieldTextBoxTabIndex="7"
														DatabaseField="con05" ValidList="0,1,2,3,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="con06" runat="server" FieldLabelWidth="200px" FieldTextBoxWidth="30px" FieldDataType="INT"
														IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
														IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="6. Argues with adults" FieldTextBoxTabIndex="8"
														DatabaseField="con06" ValidList="0,1,2,3,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="con07" runat="server" FieldLabelWidth="200px" FieldTextBoxWidth="30px" FieldDataType="INT"
														IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
														IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="7. Fidgets with hands or feet or squirms in seat"
														FieldTextBoxTabIndex="9" DatabaseField="con07" ValidList="0,1,2,3,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="con08" runat="server" FieldLabelWidth="200px" FieldTextBoxWidth="30px" FieldDataType="INT"
														IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
														IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="8. Fails to complete assignments" FieldTextBoxTabIndex="10"
														DatabaseField="con08" ValidList="0,1,2,3,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="con09" runat="server" FieldLabelWidth="200px" FieldTextBoxWidth="30px" FieldDataType="INT"
														IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
														IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="9. Hard to control in malls or while grocery shopping"
														FieldTextBoxTabIndex="11" DatabaseField="con09" ValidList="0,1,2,3,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="con10" runat="server" FieldLabelWidth="200px" FieldTextBoxWidth="30px" FieldDataType="INT"
														IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
														IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="10. Messy or disorganized at home or in school"
														FieldTextBoxTabIndex="12" DatabaseField="con10" ValidList="0,1,2,3,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="con11" runat="server" FieldLabelWidth="200px" FieldTextBoxWidth="30px" FieldDataType="INT"
														IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
														IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="11. Loses temper" FieldTextBoxTabIndex="13"
														DatabaseField="con11" ValidList="0,1,2,3,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="con12" runat="server" FieldLabelWidth="200px" FieldTextBoxWidth="30px" FieldDataType="INT"
														IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
														IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="12. Needs close supervision to get through assignments"
														FieldTextBoxTabIndex="14" DatabaseField="con12" ValidList="0,1,2,3,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="con13" runat="server" FieldLabelWidth="200px" FieldTextBoxWidth="30px" FieldDataType="INT"
														IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
														IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="13. Only attends if it is something he/she is very interested in"
														FieldTextBoxTabIndex="15" DatabaseField="con13" ValidList="0,1,2,3,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="con14" runat="server" FieldLabelWidth="200px" FieldTextBoxWidth="30px" FieldDataType="INT"
														IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
														IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="14. Runs about or climbs excessively in situations where it is inappropriate"
														FieldTextBoxTabIndex="16" DatabaseField="con14" ValidList="0,1,2,3,9"></def:datafieldcontrol></TD>
											</TR>
										</TABLE>
									</TD>
									<TD style="vertical-align:top">
										<TABLE class="grid">
											<TR>
												<TD>
													<def:datafieldcontrol id="con15" runat="server" FieldLabelWidth="200px" FieldTextBoxWidth="30px" FieldDataType="INT"
														IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
														IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="15. Distractibility or attention span a problem"
														FieldTextBoxTabIndex="17" DatabaseField="con15" ValidList="0,1,2,3,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="con16" runat="server" FieldLabelWidth="200px" FieldTextBoxWidth="30px" FieldDataType="INT"
														IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
														IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="16. Irritable" FieldTextBoxTabIndex="18"
														DatabaseField="con16" ValidList="0,1,2,3,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="con17" runat="server" FieldLabelWidth="200px" FieldTextBoxWidth="30px" FieldDataType="INT"
														IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
														IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="17. Avoids, expresses reluctance about, or has difficulties engaging in tasks that require sustained mental effort (such as schoolwork or homework)"
														FieldTextBoxTabIndex="19" DatabaseField="con17" ValidList="0,1,2,3,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="con18" runat="server" FieldLabelWidth="200px" FieldTextBoxWidth="30px" FieldDataType="INT"
														IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
														IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="18. Restless in the 'squirmy' sense"
														FieldTextBoxTabIndex="20" DatabaseField="con18" ValidList="0,1,2,3,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="con19" runat="server" FieldLabelWidth="200px" FieldTextBoxWidth="30px" FieldDataType="INT"
														IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
														IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="19. Gets distracted when given instructions to so something"
														FieldTextBoxTabIndex="21" DatabaseField="con19" ValidList="0,1,2,3,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="con20" runat="server" FieldLabelWidth="200px" FieldTextBoxWidth="30px" FieldDataType="INT"
														IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
														IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="20. Actively defies or refuses to comply with adults requests"
														FieldTextBoxTabIndex="22" DatabaseField="con20" ValidList="0,1,2,3,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="con21" runat="server" FieldLabelWidth="200px" FieldTextBoxWidth="30px" FieldDataType="INT"
														IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
														IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="21. Has trouble concentrating in class"
														FieldTextBoxTabIndex="23" DatabaseField="con21" ValidList="0,1,2,3,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="con22" runat="server" FieldLabelWidth="200px" FieldTextBoxWidth="30px" FieldDataType="INT"
														IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
														IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="22. Has difficulty waiting in lines or awaiting turn in games or group situations"
														FieldTextBoxTabIndex="24" DatabaseField="con22" ValidList="0,1,2,3,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="con23" runat="server" FieldLabelWidth="200px" FieldTextBoxWidth="30px" FieldDataType="INT"
														IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
														IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="23. Leaves seat in classroom or in other situations in which remaining seated is expected"
														FieldTextBoxTabIndex="25" DatabaseField="con23" ValidList="0,1,2,3,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="con24" runat="server" FieldLabelWidth="200px" FieldTextBoxWidth="30px" FieldDataType="INT"
														IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
														IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="24. Deliberately does things that annoy other people"
														FieldTextBoxTabIndex="26" DatabaseField="con24" ValidList="0,1,2,3,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="con25" runat="server" FieldLabelWidth="200px" FieldTextBoxWidth="30px" FieldDataType="INT"
														IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
														IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="25. Does not follow through on instructions and fails to finish schoolwork, chores or duties in the workplace (not due to oppositional behavior or failure to understand instructions)"
														FieldTextBoxTabIndex="27" DatabaseField="con25" ValidList="0,1,2,3,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="con26" runat="server" FieldLabelWidth="200px" FieldTextBoxWidth="30px" FieldDataType="INT"
														IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
														IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="26. Has difficulty playing or engaging in leisure activities quietly"
														FieldTextBoxTabIndex="28" DatabaseField="con26" ValidList="0,1,2,3,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="con27" runat="server" FieldLabelWidth="200px" FieldTextBoxWidth="30px" FieldDataType="INT"
														IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
														IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="27. Easily frustrated in efforts" FieldTextBoxTabIndex="29"
														DatabaseField="con27" ValidList="0,1,2,3,9"></def:datafieldcontrol></TD>
											</TR>
										</TABLE>
									</TD>
								</TR>
							</TABLE>
							<BR>
							<TABLE class="layout" id="table_readonly">
								<TR>
									<TD>
										<def:datafieldcontrol id="created" runat="server" FieldLabelWidth="80px" FieldDataType="DATE" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True"
											IsDoubleEntryField="False" FieldLabelText="created" FieldTextBoxTabIndex="30" DatabaseField="created"
											RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="createdBy" runat="server" FieldLabelWidth="80px" FieldDataType="TEXT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True"
											IsDoubleEntryField="False" FieldLabelText="createdBy" FieldTextBoxTabIndex="31" DatabaseField="createdBy"
											RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="updated" runat="server" FieldLabelWidth="80px" FieldDataType="DATE" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True"
											IsDoubleEntryField="False" FieldLabelText="updated" FieldTextBoxTabIndex="32" DatabaseField="updated"
											RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="updatedBy" runat="server" FieldLabelWidth="80px" FieldDataType="TEXT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True"
											IsDoubleEntryField="False" FieldLabelText="updatedBy" FieldTextBoxTabIndex="33" DatabaseField="updatedBy"
											RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
						</asp:panel></asp:Content>
