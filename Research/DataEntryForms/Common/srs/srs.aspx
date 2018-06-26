
<%@ Register TagPrefix="def" Namespace="DataEntryFramework" %>
<%@ Page language="c#" Inherits="GenericDataEntryForms.srs.srs" CodeFile="srs.aspx.cs"  MasterPageFile="~/UWAC.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="oBodyPlaceHolder" runat="server">
						<def:dataentrycontroller id="DataEntryController1" runat="server" LookupField1DataType="TEXT"
							VerifiedField="verified" PrimaryKeyField="srs_pk" MeasureName="Social Responsiveness Scale" LookupTextBox1LabelText="Subject ID:"
							LookupTextBox2Visible="False" LookupField1="id" DatabaseTable="all_srs" LastScoredDateField="scored"
							LastUpdatedDateField="updated" ShowScoreButton="True" ondoscore="DataEntryController1_DoScore"
							AllowedStudyMeasures="227,441,531,933,1249,1277,1664,1921,1984,2081,2349,2400,2497,2621,2681,2834,2890,3626" ></def:dataentrycontroller>
						<table class="layout" id="table_insert">
							<tr>
								<td><def:datafieldcontrol id="EDSID" runat="server" FieldTextBoxWidth="80px" FieldLabelWidth="60px" DatabaseField="id"
										FieldTextBoxTabIndex="2" FieldLabelText="ID" IsDoubleEntryField="False" IsReadOnly="False" IsEntryValueRequired="False"
										IsEntryField="False" IsInsertValueRequired="True" IsInsertField="True" FieldDataType="TEXT"></def:datafieldcontrol></td>
							</tr>
							<tr>
								<td>
									<def:datafieldcontrol id="srsvers" runat="server" FieldTextBoxWidth="40px" FieldLabelWidth="150px" DatabaseField="srsvers"
										FieldTextBoxTabIndex="2" FieldLabelText="Version (P=Parent, T=Teacher)" IsDoubleEntryField="False"
										IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
										FieldDataType="TEXT" ValidList="T,P" FieldTextBoxTextDefault="P" FieldTextBoxMaxLength="1" DESIGNTIMEDRAGDROP="2569"></def:datafieldcontrol></td>
							</tr>
							<tr>
								<td>
									<def:datafieldcontrol id="srsresp" runat="server" FieldTextBoxWidth="40px" FieldLabelWidth="150px" DatabaseField="srsresp"
										FieldTextBoxTabIndex="2" FieldLabelText="Respondent (1=mother,  2=Father,  3=Other, 9=Missing/Unknown)"
										IsDoubleEntryField="False" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
										IsInsertField="False" FieldDataType="INT" FieldTextBoxMaxLength="50" ValidList="1,2,3,9"></def:datafieldcontrol><br>
									<def:datafieldcontrol id="srsrespt" runat="server" FieldTextBoxWidth="200px" FieldLabelWidth="150px" DatabaseField="srsrespt"
										FieldTextBoxTabIndex="2" FieldLabelText="(specify other)" IsDoubleEntryField="False" IsReadOnly="False"
										IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
										FieldDataType="TEXT" FieldTextBoxMaxLength="50"></def:datafieldcontrol></td>
							</tr>
						</table>
						<asp:panel id="mainPanel" Runat="server">
							<def:datafieldcontrol id="srssex" runat="server" FieldLabelWidth="60px" DatabaseField="srssex" FieldTextBoxTabIndex="86"
								FieldLabelText="Gender:" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
								IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT" RenderReadOnlyAsDiv="True"></def:datafieldcontrol>
							<BR>
							<TABLE class="grid">
								<TR>
									<TD>Scale</TD>
									<TD class="heading">Raw</TD>
									<TD class="heading">T</TD>
								</TR>
								<TR>
									<TD class="heading">Social<BR>
										Awareness</TD>
									<TD>
										<def:datafieldcontrol id="srsawraw" runat="server" DatabaseField="srsawraw" FieldTextBoxTabIndex="74"
											FieldLabelText="srsawraw" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" RenderReadOnlyAsDiv="True"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="srsawt" runat="server" DatabaseField="srsawt" FieldTextBoxTabIndex="80" FieldLabelText="srsawt"
											IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD class="heading">Social<BR>
										Cognition</TD>
									<TD>
										<def:datafieldcontrol id="srscograw" runat="server" DatabaseField="srscograw" FieldTextBoxTabIndex="75"
											FieldLabelText="srscograw" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" RenderReadOnlyAsDiv="True"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="srscogt" runat="server" DatabaseField="srscogt" FieldTextBoxTabIndex="81" FieldLabelText="srscogt"
											IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD class="heading">Social<BR>
										Communication</TD>
									<TD>
										<def:datafieldcontrol id="srscomraw" runat="server" DatabaseField="srscomraw" FieldTextBoxTabIndex="76"
											FieldLabelText="srscomraw" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" RenderReadOnlyAsDiv="True"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="srscomt" runat="server" DatabaseField="srscomt" FieldTextBoxTabIndex="82" FieldLabelText="srscomt"
											IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD class="heading">Social<BR>
										Motivation</TD>
									<TD>
										<def:datafieldcontrol id="srsmotraw" runat="server" DatabaseField="srsmotraw" FieldTextBoxTabIndex="77"
											FieldLabelText="srsmotraw" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" RenderReadOnlyAsDiv="True"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="srsmott" runat="server" DatabaseField="srsmott" FieldTextBoxTabIndex="83" FieldLabelText="srsmott"
											IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD class="heading">Autistic<BR>
										Mannerisms</TD>
									<TD>
										<def:datafieldcontrol id="srsautmraw" runat="server" DatabaseField="srsautmraw" FieldTextBoxTabIndex="78"
											FieldLabelText="srsautmraw" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" RenderReadOnlyAsDiv="True"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="srsautmt" runat="server" DatabaseField="srsautmt" FieldTextBoxTabIndex="84"
											FieldLabelText="srsautmt" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" RenderReadOnlyAsDiv="True"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>Total Score</TD>
									<TD>
										<def:datafieldcontrol id="srstotraw" runat="server" DatabaseField="srstotraw" FieldTextBoxTabIndex="79"
											FieldLabelText="srstotraw" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" RenderReadOnlyAsDiv="True"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="srstott" runat="server" DatabaseField="srstott" FieldTextBoxTabIndex="85" FieldLabelText="srstott"
											IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>Total Level</TD>
									<TD colSpan="2">
										<def:datafieldcontrol id="srstotlev" runat="server" DatabaseField="srstotlev" FieldTextBoxTabIndex="87"
											FieldLabelText="Total Level:" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT" RenderReadOnlyAsDiv="True"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
							<def:datafieldcontrol id="srsscrmsg" runat="server" FieldLabelWidth="100px" DatabaseField="srsscrmsg"
								FieldTextBoxTabIndex="88" FieldLabelText="Scoring Status:" IsDoubleEntryField="False" IsReadOnly="True"
								IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False"
								FieldDataType="TEXT" RenderReadOnlyAsDiv="True"></def:datafieldcontrol>
							<BR>
							<TABLE class="grid" id="table_entry">
								<TR>
									<TD class="heading">1=Not TRUE, 2=Sometimes TRUE, 3=Often TRUE, 4=Almost Always 
										TRUE, 999=Missing</TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="srs01" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="400px" DatabaseField="srs01"
											FieldTextBoxTabIndex="3" FieldLabelText="1. Seems much more fidgety in social situations than when alone"
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="srs02" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="400px" DatabaseField="srs02"
											FieldTextBoxTabIndex="4" FieldLabelText="2. Expressions on his/her face don't match what he/she is saying"
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="srs03" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="400px" DatabaseField="srs03"
											FieldTextBoxTabIndex="5" FieldLabelText="3. Seems self-confident when interacting with others" IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="srs04" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="400px" DatabaseField="srs04"
											FieldTextBoxTabIndex="6" FieldLabelText="4. When under stress, child seems to go on 'auto-pilot' (for example, shows rigid or inflexible patterns of behavior which seem odd)"
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="srs05" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="400px" DatabaseField="srs05"
											FieldTextBoxTabIndex="7" FieldLabelText="5. Doesn't recognize when others are trying to take advantage of him/her"
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="srs06" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="400px" DatabaseField="srs06"
											FieldTextBoxTabIndex="8" FieldLabelText="6. Would rather be alone than with others" IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="srs07" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="400px" DatabaseField="srs07"
											FieldTextBoxTabIndex="9" FieldLabelText="7. Is aware of what others are thinking or feeling" IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="srs08" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="400px" DatabaseField="srs08"
											FieldTextBoxTabIndex="10" FieldLabelText="8. Behaves in ways which seem strange or bizarre" IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="srs09" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="400px" DatabaseField="srs09"
											FieldTextBoxTabIndex="11" FieldLabelText="9. Clings to adults, seems too dependent on them" IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="srs10" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="400px" DatabaseField="srs10"
											FieldTextBoxTabIndex="12" FieldLabelText="10. Takes things too literally and doesn't 'get' the real meaning of a conversation"
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="srs11" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="400px" DatabaseField="srs11"
											FieldTextBoxTabIndex="13" FieldLabelText="11. Has good self-confidence" IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="srs12" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="400px" DatabaseField="srs12"
											FieldTextBoxTabIndex="14" FieldLabelText="12. Is able to communicate his or her feelings to others"
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="srs13" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="400px" DatabaseField="srs13"
											FieldTextBoxTabIndex="15" FieldLabelText="13. Is awkward in turn-taking interactions with peers (for example, doesn't seem to understand the give and take of conversations)"
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="srs14" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="400px" DatabaseField="srs14"
											FieldTextBoxTabIndex="16" FieldLabelText="14. Is not well coordinated in physical activities" IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="srs15" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="400px" DatabaseField="srs15"
											FieldTextBoxTabIndex="17" FieldLabelText="15. Is able to understand the meaning of other people's tone of voice and facial expressions"
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="srs16" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="400px" DatabaseField="srs16"
											FieldTextBoxTabIndex="18" FieldLabelText="16. Avoids eye contact, or has unusual eye contact" IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="srs17" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="400px" DatabaseField="srs17"
											FieldTextBoxTabIndex="19" FieldLabelText="17. Recognizes when something is unfair" IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="srs18" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="400px" DatabaseField="srs18"
											FieldTextBoxTabIndex="20" FieldLabelText="18. Has difficulty making friends, even when trying his/her best "
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="srs19" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="400px" DatabaseField="srs19"
											FieldTextBoxTabIndex="21" FieldLabelText="19. Gets frustrated trying to get ideas across in conversations"
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="srs20" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="400px" DatabaseField="srs20"
											FieldTextBoxTabIndex="22" FieldLabelText="20. Shows unusual sensory interests (such as mouthing or spinning objects) or strange ways of playing with toys"
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="srs21" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="400px" DatabaseField="srs21"
											FieldTextBoxTabIndex="23" FieldLabelText="21. Is able to imitate others' actions" IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="srs22" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="400px" DatabaseField="srs22"
											FieldTextBoxTabIndex="24" FieldLabelText="22. Plays appropriately with children his/her age" IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="srs23" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="400px" DatabaseField="srs23"
											FieldTextBoxTabIndex="25" FieldLabelText="23. Does not join group activities unless told to do so"
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="srs24" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="400px" DatabaseField="srs24"
											FieldTextBoxTabIndex="26" FieldLabelText="24. Has more difficulty than other children with changes in his/her routine"
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="srs25" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="400px" DatabaseField="srs25"
											FieldTextBoxTabIndex="27" FieldLabelText="25. Doesn't seem to mind being 'out of step' or not on the 'same wavelength' with others"
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="srs26" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="400px" DatabaseField="srs26"
											FieldTextBoxTabIndex="28" FieldLabelText="26. Offers comfort to others when they are sad" IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="srs27" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="400px" DatabaseField="srs27"
											FieldTextBoxTabIndex="29" FieldLabelText="27. Avoids starting social interactions with peers or adults"
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="srs28" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="400px" DatabaseField="srs28"
											FieldTextBoxTabIndex="30" FieldLabelText="28. Thinks or talks about the same thing over and over"
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="srs29" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="400px" DatabaseField="srs29"
											FieldTextBoxTabIndex="31" FieldLabelText="29. Is regarded by other children as odd or weird" IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="srs30" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="400px" DatabaseField="srs30"
											FieldTextBoxTabIndex="32" FieldLabelText="30. Becomes upset in a situation with lots of things going on"
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="srs31" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="400px" DatabaseField="srs31"
											FieldTextBoxTabIndex="33" FieldLabelText="31. Can't get his/her mind off something once he/she starts thinking about it"
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="srs32" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="400px" DatabaseField="srs32"
											FieldTextBoxTabIndex="34" FieldLabelText="32. Has good personal hygiene" IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="srs33" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="400px" DatabaseField="srs33"
											FieldTextBoxTabIndex="35" FieldLabelText="33. Is socially awkward, even when he/she is trying to be polite"
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="srs34" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="400px" DatabaseField="srs34"
											FieldTextBoxTabIndex="36" FieldLabelText="34. Avoids people who want to be emotionally close to him/her"
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="srs35" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="400px" DatabaseField="srs35"
											FieldTextBoxTabIndex="37" FieldLabelText="35. Has trouble keeping up with the flow of a normal conversation"
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="srs36" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="400px" DatabaseField="srs36"
											FieldTextBoxTabIndex="38" FieldLabelText="36. Has difficulty 'relating' to adults" IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="srs37" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="400px" DatabaseField="srs37"
											FieldTextBoxTabIndex="39" FieldLabelText="37. Has difficulty 'relating' to peers" IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="srs38" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="400px" DatabaseField="srs38"
											FieldTextBoxTabIndex="40" FieldLabelText="38. Responds appropriately to mood changes in others (for example, when a friend's or playmate's mood changes from happy to sad)"
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="srs39" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="400px" DatabaseField="srs39"
											FieldTextBoxTabIndex="41" FieldLabelText="39. Has a restricted (or unusually narrow) range of interests"
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="srs40" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="400px" DatabaseField="srs40"
											FieldTextBoxTabIndex="42" FieldLabelText="40. Is imaginative, good at pretending (without losing touch with reality)"
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="srs41" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="400px" DatabaseField="srs41"
											FieldTextBoxTabIndex="43" FieldLabelText="41. Wanders aimlessly from one activity to another" IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="srs42" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="400px" DatabaseField="srs42"
											FieldTextBoxTabIndex="44" FieldLabelText="42. Seems overly sensitive to sounds, textures, or smells"
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="srs43" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="400px" DatabaseField="srs43"
											FieldTextBoxTabIndex="45" FieldLabelText="43. Separates easily from caregivers" IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="srs44" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="400px" DatabaseField="srs44"
											FieldTextBoxTabIndex="46" FieldLabelText="44. Doesn't understand how events are related to one another the way other children his/her age do (eg has problems with understanding cause and effect)"
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="srs45" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="400px" DatabaseField="srs45"
											FieldTextBoxTabIndex="47" FieldLabelText="45. Focuses his/her attention to where others are looking or listening"
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="srs46" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="400px" DatabaseField="srs46"
											FieldTextBoxTabIndex="48" FieldLabelText="46. Has overly serious facial expressions" IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="srs47" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="400px" DatabaseField="srs47"
											FieldTextBoxTabIndex="49" FieldLabelText="47. Is too silly or laughs inappropriately" IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="srs48" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="400px" DatabaseField="srs48"
											FieldTextBoxTabIndex="50" FieldLabelText="48. Has a sense of humor, understands jokes" IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="srs49" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="400px" DatabaseField="srs49"
											FieldTextBoxTabIndex="51" FieldLabelText="49. Does extremely well at a few tasks, but does not do as well at most other tasks"
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="srs50" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="400px" DatabaseField="srs50"
											FieldTextBoxTabIndex="52" FieldLabelText="50. Has repetitive, odd behaviors such as hand flapping or rocking"
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="srs51" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="400px" DatabaseField="srs51"
											FieldTextBoxTabIndex="53" FieldLabelText="51. Has difficulty answering questions directly and ends up talking around the subject"
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="srs52" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="400px" DatabaseField="srs52"
											FieldTextBoxTabIndex="54" FieldLabelText="52. Knows when he/she is talking too loud or making too much noise"
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="srs53" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="400px" DatabaseField="srs53"
											FieldTextBoxTabIndex="55" FieldLabelText="53. Talks to people with an unusual tone of voice (for example, talks like a robot or like he/she is giving a lecture)"
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="srs54" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="400px" DatabaseField="srs54"
											FieldTextBoxTabIndex="56" FieldLabelText="54. Seems to react to people as if they are objects" IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="srs55" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="400px" DatabaseField="srs55"
											FieldTextBoxTabIndex="57" FieldLabelText="55. Knows when he/she is too close to someone or is invading someone's space"
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="srs56" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="400px" DatabaseField="srs56"
											FieldTextBoxTabIndex="58" FieldLabelText="56. Walks in between two people who are talking" IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="srs57" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="400px" DatabaseField="srs57"
											FieldTextBoxTabIndex="59" FieldLabelText="57. Gets teased a lot" IsDoubleEntryField="True" IsReadOnly="False"
											IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="srs58" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="400px" DatabaseField="srs58"
											FieldTextBoxTabIndex="60" FieldLabelText="58. Concentrates too much on parts of things rather than 'seeing the whole picture' (for example, if asked to describe what happened in a story, child may talk only about the kind of clothes the characters were wearing)"
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="srs59" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="400px" DatabaseField="srs59"
											FieldTextBoxTabIndex="61" FieldLabelText="59. Is overly suspicious" IsDoubleEntryField="True" IsReadOnly="False"
											IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="srs60" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="400px" DatabaseField="srs60"
											FieldTextBoxTabIndex="62" FieldLabelText="60. Is emotionally distant, doesn't show his/her emotions"
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="srs61" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="400px" DatabaseField="srs61"
											FieldTextBoxTabIndex="63" FieldLabelText="61. Is inflexible, has a hard time changing his/her mind"
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="srs62" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="400px" DatabaseField="srs62"
											FieldTextBoxTabIndex="64" FieldLabelText="62. Gives unusual or illogical reasons for doing things"
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="srs63" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="400px" DatabaseField="srs63"
											FieldTextBoxTabIndex="65" FieldLabelText="63. Touches others in an unusual way (for example, child may touch someone just to make contact and then walk away without saying anything)"
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="srs64" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="400px" DatabaseField="srs64"
											FieldTextBoxTabIndex="66" FieldLabelText="64. Is too tense in social settings" IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="srs65" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="400px" DatabaseField="srs65"
											FieldTextBoxTabIndex="67" FieldLabelText="65. Stares or gazes off into space" IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
							<BR>
							<TABLE class="layout" id="table_readonly">
								<TR>
									<TD>
										<def:datafieldcontrol id="created" runat="server" FieldLabelWidth="80px" DatabaseField="created" FieldTextBoxTabIndex="70"
											FieldLabelText="created" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="DATE" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="createdBy" runat="server" FieldLabelWidth="80px" DatabaseField="createdBy" FieldTextBoxTabIndex="71"
											FieldLabelText="createdBy" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="updated" runat="server" FieldLabelWidth="80px" DatabaseField="updated" FieldTextBoxTabIndex="72"
											FieldLabelText="updated" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="DATE" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="updatedBy" runat="server" FieldLabelWidth="80px" DatabaseField="updatedBy" FieldTextBoxTabIndex="73"
											FieldLabelText="updatedBy" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="Datafieldcontrol1" runat="server" FieldLabelWidth="80px" DatabaseField="scored"
											FieldTextBoxTabIndex="72" FieldLabelText="scored" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="DATE" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="Datafieldcontrol2" runat="server" FieldLabelWidth="80px" DatabaseField="scoredBy"
											FieldTextBoxTabIndex="73" FieldLabelText="scoredBy" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
						</asp:panel></asp:Content>
