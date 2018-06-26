
<%@ Register TagPrefix="def" Namespace="DataEntryFramework.Old" %>
<%@ Page language="c#" Inherits="face_scs.face_scs" CodeFile="face_scs.aspx.cs"  MasterPageFile="~/UWAC.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="oBodyPlaceHolder" runat="server">
						<def:dataentrycontroller id="DataEntryController1" runat="server" VerifiedField="verified" PrimaryKeyField="scs_pk"
							MeasureName="FACE Social Comm. Scale" LookupTextBox1LabelText="FACE ID:" LookupTextBox2Visible="False"
							LookupField1="faceid" DatabaseTable="face_scs" LookupField1DataType="TEXT" ShowScoreButton="False" StudyMeasID="382"></def:dataentrycontroller>
						<table id="table_insert" class="tblinsert">
							<tr>
								<td><def:datafieldcontrol id="faceid" runat="server" FieldDataType="TEXT" IsInsertField="True" IsInsertValueRequired="True"
										IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="FACE ID"
										FieldTextBoxTabIndex="2" DatabaseField="faceid" FieldLabelWidth="80px" FieldTextBoxWidth="80px" RegEx="^[F][A][C][E][0-9][0-9][0-9]$"
										RegExDescription="FACE ID must  look like FACE###"></def:datafieldcontrol>
								</td>
							</tr>
							<tr>
								<td>
									<def:datafieldcontrol id="scsdate" runat="server" FieldDataType="DATE" IsInsertField="False" IsInsertValueRequired="False"
										IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="Date"
										FieldTextBoxTabIndex="3" DatabaseField="scsdate" FieldLabelWidth="80px" FieldTextBoxWidth="80px" FormatString="{0:d}"></def:datafieldcontrol>
								</td>
							</tr>
						</table>
						<br>
						<asp:Panel Runat="server" ID="mainPanel">
							<TABLE class="grid" id="table_entry">
								<TR>
									<TD class="heading">1=True<BR>
										0=False<BR>
										9=Missing</TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="scs101" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="350px" DatabaseField="scs101"
											FieldTextBoxTabIndex="4" FieldLabelText="1. I feel relaxed even in unfamiliar social situations."
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="1,0,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="scs102" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="350px" DatabaseField="scs102"
											FieldTextBoxTabIndex="5" FieldLabelText="2. I try to avoid situations that force me to be very sociable."
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="1,0,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="scs103" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="350px" DatabaseField="scs103"
											FieldTextBoxTabIndex="6" FieldLabelText="3. It is easy for me to relax when I am with strangers."
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="1,0,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="scs104" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="350px" DatabaseField="scs104"
											FieldTextBoxTabIndex="7" FieldLabelText="4. I have no particular desire to avoid people." IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="1,0,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="scs105" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="350px" DatabaseField="scs105"
											FieldTextBoxTabIndex="8" FieldLabelText="5. I often find social occasions upsetting." IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="1,0,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="scs106" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="350px" DatabaseField="scs106"
											FieldTextBoxTabIndex="9" FieldLabelText="6. I usually feel calm and comfortable at social occasions."
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="1,0,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="scs107" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="350px" DatabaseField="scs107"
											FieldTextBoxTabIndex="10" FieldLabelText="7. I am usually at ease when talking to someone of the opposite sex."
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="1,0,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="scs108" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="350px" DatabaseField="scs108"
											FieldTextBoxTabIndex="11" FieldLabelText="8. I try to avoid talking to people unless I know them well."
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="1,0,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="scs109" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="350px" DatabaseField="scs109"
											FieldTextBoxTabIndex="12" FieldLabelText="9. If the chance comes to meet new people, I often take it."
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="1,0,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="scs110" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="350px" DatabaseField="scs110"
											FieldTextBoxTabIndex="13" FieldLabelText="10. I often feel nervous or tense in casual get-togethers in which both sexes are present."
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="1,0,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="scs111" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="350px" DatabaseField="scs111"
											FieldTextBoxTabIndex="14" FieldLabelText="11. I am usually nervous with people unless I know them well."
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="1,0,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="scs112" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="350px" DatabaseField="scs112"
											FieldTextBoxTabIndex="15" FieldLabelText="12. I usually feel relaxed when I'm with a group of people."
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="1,0,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="scs113" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="350px" DatabaseField="scs113"
											FieldTextBoxTabIndex="16" FieldLabelText="13. I often want to get away from people." IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="1,0,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="scs114" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="350px" DatabaseField="scs114"
											FieldTextBoxTabIndex="17" FieldLabelText="14. I usually feel uncomfortable when I am in a group of people I don't know."
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="1,0,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="scs115" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="350px" DatabaseField="scs115"
											FieldTextBoxTabIndex="18" FieldLabelText="15. I usually feel relaxed when I meet someone for the first time."
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="1,0,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="scs116" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="350px" DatabaseField="scs116"
											FieldTextBoxTabIndex="19" FieldLabelText="16. Being introduced to people makes me tense and nervous."
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="1,0,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="scs117" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="350px" DatabaseField="scs117"
											FieldTextBoxTabIndex="20" FieldLabelText="17. Even though a room is full of strangers, I may enter it anyway."
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="1,0,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="scs118" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="350px" DatabaseField="scs118"
											FieldTextBoxTabIndex="21" FieldLabelText="18. I would avoid walking up and joining a large group of people."
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="1,0,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="scs119" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="350px" DatabaseField="scs119"
											FieldTextBoxTabIndex="22" FieldLabelText="19. When my superiors want to talk with me, I talk willingly."
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="1,0,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="scs120" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="350px" DatabaseField="scs120"
											FieldTextBoxTabIndex="23" FieldLabelText="20. I often feel on edge when I am with a group of people."
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="1,0,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="scs121" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="350px" DatabaseField="scs121"
											FieldTextBoxTabIndex="24" FieldLabelText="21. I tend to withdraw from people." IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="1,0,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="scs122" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="350px" DatabaseField="scs122"
											FieldTextBoxTabIndex="25" FieldLabelText="22. I don't mind talking to people at parties or social gatherings."
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="1,0,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="scs123" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="350px" DatabaseField="scs123"
											FieldTextBoxTabIndex="26" FieldLabelText="23. I am seldom at ease in a large group of people." IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="1,0,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="scs124" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="350px" DatabaseField="scs124"
											FieldTextBoxTabIndex="27" FieldLabelText="24. I often think up excuses in order to avoid social engagements."
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="1,0,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="scs125" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="350px" DatabaseField="scs125"
											FieldTextBoxTabIndex="28" FieldLabelText="25. I sometimes take the responsibility for introducing people to each other."
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="1,0,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="scs126" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="350px" DatabaseField="scs126"
											FieldTextBoxTabIndex="29" FieldLabelText="26. I try to avoid formal social occasions." IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="1,0,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="scs127" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="350px" DatabaseField="scs127"
											FieldTextBoxTabIndex="30" FieldLabelText="27. I usually go to whatever social engagement I have."
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="1,0,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="scs128" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="350px" DatabaseField="scs128"
											FieldTextBoxTabIndex="31" FieldLabelText="28. I find it easy to relax with other people." IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="1,0,9"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
							<BR>
							<TABLE class="grid">
								<TR>
									<TD class="heading">1=not at all like me<BR>
										2=a little like me<BR>
										3=quite a lot like me<BR>
										4=a great deal like me<BR>
										9=Missing</TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="scs201" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="350px" DatabaseField="scs201"
											FieldTextBoxTabIndex="32" FieldLabelText="1. Start a conversation with someone I don't know well but would like to get to know better."
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="scs202" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="350px" DatabaseField="scs202"
											FieldTextBoxTabIndex="33" FieldLabelText="2. Be confident in my ability to make friends, even in a situation where I know few people. "
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="scs203" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="350px" DatabaseField="scs203"
											FieldTextBoxTabIndex="34" FieldLabelText="3. Be able to mix well in a group. " IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="scs204" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="350px" DatabaseField="scs204"
											FieldTextBoxTabIndex="35" FieldLabelText="4. Feel uncomfortable looking at other people directly. "
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="scs205" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="350px" DatabaseField="scs205"
											FieldTextBoxTabIndex="36" FieldLabelText="5. Have trouble keeping a conversation going when I'm just getting to know someone. "
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="scs206" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="350px" DatabaseField="scs206"
											FieldTextBoxTabIndex="37" FieldLabelText="6. Find it hard to let a person know that I want to become closer friends with him/her. "
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="scs207" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="350px" DatabaseField="scs207"
											FieldTextBoxTabIndex="38" FieldLabelText="7. Enjoy social gatherings just to be with people. " IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="scs208" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="350px" DatabaseField="scs208"
											FieldTextBoxTabIndex="39" FieldLabelText="8. Have problems getting other people to notice me. " IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="scs209" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="350px" DatabaseField="scs209"
											FieldTextBoxTabIndex="40" FieldLabelText="9. Feel confident of my social behavior. " IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="scs210" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="350px" DatabaseField="scs210"
											FieldTextBoxTabIndex="41" FieldLabelText="10. Seek out social encounters because I enjoy being with other people."
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
							<BR>
							<TABLE class="layout" id="table_readonly">
								<TR>
									<TD>
										<def:datafieldcontrol id="created" runat="server" FieldLabelWidth="80px" DatabaseField="created" FieldTextBoxTabIndex="43"
											FieldLabelText="created" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="DATE" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="createdBy" runat="server" FieldLabelWidth="80px" DatabaseField="createdBy" FieldTextBoxTabIndex="44"
											FieldLabelText="createdBy" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="updated" runat="server" FieldLabelWidth="80px" DatabaseField="updated" FieldTextBoxTabIndex="45"
											FieldLabelText="updated" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="DATE" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="updatedBy" runat="server" FieldLabelWidth="80px" DatabaseField="updatedBy" FieldTextBoxTabIndex="46"
											FieldLabelText="updatedBy" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
						</asp:Panel>
					</asp:Content>
