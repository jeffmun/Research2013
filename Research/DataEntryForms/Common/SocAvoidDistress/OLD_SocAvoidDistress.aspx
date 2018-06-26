<%@ Register TagPrefix="def" Namespace="DataEntryFramework" %>

<%@ Page language="c#" Inherits="GenericDataEntryForms.SocAvoidDistress.SocAvoidDistress" CodeFile="SocAvoidDistress.aspx.cs"  MasterPageFile="~/UWAC.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="oBodyPlaceHolder" runat="server">
						<def:dataentrycontroller id="DataEntryController1" runat="server" 
							LookupField1DataType="TEXT" VerifiedField="verified" PrimaryKeyField="sads_pk" MeasureName="SocAvoidDistress"
							LookupTextBox1LabelText="Subject ID:" LookupTextBox2Visible="False" LookupField1="id" DatabaseTable="ALL_SocAvoidDistress"
							ShowScoreButton="True" ondoscore="DataEntryController1_DoScore"
							AllowedStudyMeasures="138,276,277,382,1717,1718,1763,1967,1968,1996,2086,2177,2178,2202,2205,2246" ></def:dataentrycontroller>
						<def:datafieldcontrol id="id" runat="server" FieldDataType="TEXT" IsInsertField="True" IsInsertValueRequired="True"
							IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="ID"
							FieldTextBoxTabIndex="2" DatabaseField="ID" FieldLabelWidth="80px" FieldTextBoxWidth="80px"></def:datafieldcontrol><br>
						<def:datafieldcontrol id="SADSDATE" runat="server" FieldTextBoxWidth="80px" FieldLabelWidth="80px" DatabaseField="SADSDATE"
							FieldTextBoxTabIndex="3" FieldLabelText="Date" IsDoubleEntryField="False" IsReadOnly="False" IsEntryValueRequired="False"
							IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="DATE" FormatString="{0:d}"></def:datafieldcontrol><br>
						0=Self/Subject<BR>
						1=Mother (bio, step, adoptive)<BR>
						2=Father (bio, step, adoptive)<BR>
						3=Primary Caregiver (specify below)<BR>
						4=Other (specify below)<BR>
						9=Missing/Unknown<BR>
						<def:datafieldcontrol id="SADSWHO" runat="server" FieldTextBoxWidth="40px" FieldLabelWidth="80px" DatabaseField="SADSWHO"
							FieldTextBoxTabIndex="3" FieldLabelText="Respondant" IsDoubleEntryField="False" IsReadOnly="False"
							IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
							FieldDataType="INT" DESIGNTIMEDRAGDROP="93" ValidList="0,1,2,3,4,9"></def:datafieldcontrol><br>
						<def:datafieldcontrol id="SADSOTHER" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
							IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="Specify Other"
							FieldTextBoxTabIndex="3" DatabaseField="SADSOTHER" FieldLabelWidth="100px" FieldTextBoxWidth="150px"></def:datafieldcontrol><br>
						<asp:Panel Runat="server" ID="mainPanel">
							<B>Scoring:</B><BR>
							<TABLE class="layout">
								<TR>
									<TD>
										<def:datafieldcontrol id="sadstot" runat="server" FieldLabelWidth="50px" DatabaseField="sadstot" FieldTextBoxTabIndex="46"
											FieldLabelText="TOT:" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False"
											IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="sadspro" runat="server" FieldLabelWidth="50px" DatabaseField="sadspro" FieldTextBoxTabIndex="46"
											FieldLabelText="PRO:" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False"
											IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="sadsavg" runat="server" FieldLabelWidth="50px" DatabaseField="sadsavg" FieldTextBoxTabIndex="46"
											FieldLabelText="AVG:" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False"
											IsInsertValueRequired="False" IsInsertField="False" FieldDataType="FLOAT" FormatString="{0:f}" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="sadsmis" runat="server" FieldLabelWidth="50px" DatabaseField="sadsmis" FieldTextBoxTabIndex="46"
											FieldLabelText="MIS:" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False"
											IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
							<def:datafieldcontrol id="scormsg" runat="server" FieldLabelWidth="100px" DatabaseField="scormsg" FieldTextBoxTabIndex="46"
								FieldLabelText="Scoring Status:" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
								IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT" RenderReadOnlyAsDiv="True"></def:datafieldcontrol>
							<BR>
							<TABLE class="grid" id="table_entry">
								<TR>
									<TD class="heading">1=True<BR>
										0=False<BR>
										9=Missing</TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="sads01" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="350px" DatabaseField="sads01"
											FieldTextBoxTabIndex="4" FieldLabelText="1. I feel relaxed even in unfamiliar social situations."
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="1,0,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="sads02" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="350px" DatabaseField="sads02"
											FieldTextBoxTabIndex="5" FieldLabelText="2. I try to avoid situations that force me to be very sociable."
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="1,0,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="sads03" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="350px" DatabaseField="sads03"
											FieldTextBoxTabIndex="6" FieldLabelText="3. It is easy for me to relax when I am with strangers."
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="1,0,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="sads04" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="350px" DatabaseField="sads04"
											FieldTextBoxTabIndex="7" FieldLabelText="4. I have no particular desire to avoid people." IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="1,0,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="sads05" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="350px" DatabaseField="sads05"
											FieldTextBoxTabIndex="8" FieldLabelText="5. I often find social occasions upsetting." IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="1,0,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="sads06" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="350px" DatabaseField="sads06"
											FieldTextBoxTabIndex="9" FieldLabelText="6. I usually feel calm and comfortable at social occasions."
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="1,0,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="sads07" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="350px" DatabaseField="sads07"
											FieldTextBoxTabIndex="10" FieldLabelText="7. I am usually at ease when talking to someone of the opposite sex."
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="1,0,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="sads08" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="350px" DatabaseField="sads08"
											FieldTextBoxTabIndex="11" FieldLabelText="8. I try to avoid talking to people unless I know them well."
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="1,0,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="sads09" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="350px" DatabaseField="sads09"
											FieldTextBoxTabIndex="12" FieldLabelText="9. If the chance comes to meet new people, I often take it."
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="1,0,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="sads10" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="350px" DatabaseField="sads10"
											FieldTextBoxTabIndex="13" FieldLabelText="10. I often feel nervous or tense in casual get-togethers in which both sexes are present."
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="1,0,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="sads11" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="350px" DatabaseField="sads11"
											FieldTextBoxTabIndex="14" FieldLabelText="11. I am usually nervous with people unless I know them well."
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="1,0,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="sads12" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="350px" DatabaseField="sads12"
											FieldTextBoxTabIndex="15" FieldLabelText="12. I usually feel relaxed when I'm with a group of people."
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="1,0,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="sads13" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="350px" DatabaseField="sads13"
											FieldTextBoxTabIndex="16" FieldLabelText="13. I often want to get away from people." IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="1,0,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="sads14" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="350px" DatabaseField="sads14"
											FieldTextBoxTabIndex="17" FieldLabelText="14. I usually feel uncomfortable when I am in a group of people I don't know."
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="1,0,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="sads15" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="350px" DatabaseField="sads15"
											FieldTextBoxTabIndex="18" FieldLabelText="15. I usually feel relaxed when I meet someone for the first time."
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="1,0,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="sads16" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="350px" DatabaseField="sads16"
											FieldTextBoxTabIndex="19" FieldLabelText="16. Being introduced to people makes me tense and nervous."
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="1,0,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="sads17" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="350px" DatabaseField="sads17"
											FieldTextBoxTabIndex="20" FieldLabelText="17. Even though a room is full of strangers, I may enter it anyway."
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="1,0,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="sads18" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="350px" DatabaseField="sads18"
											FieldTextBoxTabIndex="21" FieldLabelText="18. I would avoid walking up and joining a large group of people."
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="1,0,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="sads19" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="350px" DatabaseField="sads19"
											FieldTextBoxTabIndex="22" FieldLabelText="19. When my superiors want to talk with me, I talk willingly."
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="1,0,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="sads20" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="350px" DatabaseField="sads20"
											FieldTextBoxTabIndex="23" FieldLabelText="20. I often feel on edge when I am with a group of people."
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="1,0,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="sads21" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="350px" DatabaseField="sads21"
											FieldTextBoxTabIndex="24" FieldLabelText="21. I tend to withdraw from people." IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="1,0,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="sads22" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="350px" DatabaseField="sads22"
											FieldTextBoxTabIndex="25" FieldLabelText="22. I don't mind talking to people at parties or social gatherings."
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="1,0,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="sads23" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="350px" DatabaseField="sads23"
											FieldTextBoxTabIndex="26" FieldLabelText="23. I am seldom at ease in a large group of people." IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="1,0,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="sads24" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="350px" DatabaseField="sads24"
											FieldTextBoxTabIndex="27" FieldLabelText="24. I often think up excuses in order to avoid social engagements."
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="1,0,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="sads25" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="350px" DatabaseField="sads25"
											FieldTextBoxTabIndex="28" FieldLabelText="25. I sometimes take the responsibility for introducing people to each other."
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="1,0,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="sads26" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="350px" DatabaseField="sads26"
											FieldTextBoxTabIndex="29" FieldLabelText="26. I try to avoid formal social occasions." IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="1,0,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="sads27" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="350px" DatabaseField="sads27"
											FieldTextBoxTabIndex="30" FieldLabelText="27. I usually go to whatever social engagement I have."
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="1,0,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="sads28" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="350px" DatabaseField="sads28"
											FieldTextBoxTabIndex="31" FieldLabelText="28. I find it easy to relax with other people." IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="1,0,9"></def:datafieldcontrol></TD>
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
								<TR>
									<TD>
										<def:datafieldcontrol id="Datafieldcontrol2" runat="server" FieldLabelWidth="80px" DatabaseField="scored"
											FieldTextBoxTabIndex="45" FieldLabelText="scored" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="DATE" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="Datafieldcontrol1" runat="server" FieldLabelWidth="80px" DatabaseField="scoredBy"
											FieldTextBoxTabIndex="46" FieldLabelText="scoredBy" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT" DESIGNTIMEDRAGDROP="305"
											RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
						</asp:Panel>
					</asp:Content>
