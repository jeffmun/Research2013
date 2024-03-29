<%@ Page language="c#" Inherits="gen_ados_wps.ados_g_mod4" CodeFile="ados_g_mod4.aspx.cs"  MasterPageFile="~/UWAC.master" %>
<%@ Register TagPrefix="def" Namespace="DataEntryFramework" %>

<asp:Content ID="Content1" ContentPlaceHolderID="oBodyPlaceHolder" runat="server">
						<a href="ados_lookup.aspx">Back to Main ADOS page (Click here to enter other ADOS 
							modules.)</a><br>
						<def:dataentrycontroller id="DataEntryController1" runat="server" DatabaseTable="all_ados" LookupField1="id"
							LookupTextBox2Visible="True" LookupTextBox1LabelText="Subject ID:" MeasureName="ADOS-G Module 4" PrimaryKeyField="ados_pk"
							VerifiedField="verified" ShowScoreButton="True" 
							AllowedStudyMeasures="84,125,153,192,215,339,379,544,545,585,660,697,698,923,2485"
							LookupField1DataType="TEXT" LookupField2="indexnum" LookupTextBox2LabelText="Indexnum" LastScoredDateField="scored" LastUpdatedDateField="updated" ondoscore="DataEntryController1_DoScore"></def:dataentrycontroller><br>
						<h3>ADOS G Module 4</h3>
						<table>
							<tr>
								<td><table id="table_insert" class="layout">
										<tr>
											<td><def:datafieldcontrol id="indid" runat="server" FieldDataType="TEXT" IsInsertField="True" IsInsertValueRequired="True"
													IsEntryField="false" IsEntryValueRequired="false" IsReadOnly="False" IsDoubleEntryField="false" FieldLabelText="ID"
													FieldTextBoxTabIndex="2" DatabaseField="id" FieldLabelWidth="80px" FieldTextBoxWidth="80px"></def:datafieldcontrol>
											</td>
										</tr>
										<tr>
											<td><def:datafieldcontrol id="ADOSdate" runat="server" FieldDataType="DATE" IsInsertField="True" IsInsertValueRequired="True"
													IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="false" FieldLabelText="ADOSdate"
													FieldTextBoxTabIndex="3" DatabaseField="ADOSdate" FieldLabelWidth="80px" FieldTextBoxWidth="80px"
													FormatString="{0:d}"></def:datafieldcontrol>
											</td>
										</tr>
										<tr>
											<td>
												<def:datafieldcontrol id="indexnum" runat="server" FieldTextBoxWidth="80px" FieldLabelWidth="80px" DatabaseField="indexnum"
													FieldTextBoxTabIndex="2" FieldLabelText="Indexnum" IsDoubleEntryField="false" IsReadOnly="False" IsEntryValueRequired="false"
													IsEntryField="false" IsInsertValueRequired="True" IsInsertField="True" FieldDataType="INT"></def:datafieldcontrol></td>
										</tr>
										<tr>
											<td><def:datafieldcontrol id="ADOSclin" runat="server" FieldDataType="TEXT" IsInsertField="True" IsInsertValueRequired="True"
													IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="false" FieldLabelText="ADOSclin"
													FieldTextBoxTabIndex="4" DatabaseField="ADOSclin" FieldLabelWidth="80px" FieldTextBoxWidth="80px"></def:datafieldcontrol>
											</td>
										</tr>
										<tr>
											<td>
												<def:datafieldcontrol id="reliabilityDateDone" runat="server" FieldTextBoxWidth="80px" FieldLabelWidth="150px"
													DatabaseField="reliabilityDateDone" FieldTextBoxTabIndex="5" FieldLabelText="Reliability Date (Leave blank if not entering a reliability)"
													IsDoubleEntryField="False" IsReadOnly="False" IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False"
													IsInsertField="False" FieldDataType="DATE" FormatString="{0:d}"></def:datafieldcontrol><br>
											</td>
										</tr>
										<tr>
											<td><def:datafieldcontrol id="Datafieldcontrol1" runat="server" DatabaseField="ADOSmod" FieldTextBoxTabIndex="54"
													FieldLabelText="ADOSmod" IsDoubleEntryField="False" IsReadOnly="false" IsEntryValueRequired="False"
													IsEntryField="False" IsInsertValueRequired="true" IsInsertField="true" FieldDataType="INT" FieldLabelCssClass="hideme"
													FieldTextBoxCssClass="hideme" FieldTextBoxTextDefault="4"></def:datafieldcontrol></td>
										</tr>
										<tr>
											<td><def:datafieldcontrol id="ADOSver" runat="server" DatabaseField="ADOSver" FieldTextBoxTabIndex="54" FieldLabelText="ADOSver"
													IsDoubleEntryField="False" IsReadOnly="false" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="true"
													IsInsertField="true" FieldDataType="TEXT" FieldLabelCssClass="hideme" FieldTextBoxCssClass="hideme"
													FieldTextBoxTextDefault="G"></def:datafieldcontrol></td>
										</tr>
									</table>
								</td>
								<td>
									<table id="table_readonly" class="layout">
										<tr>
											<td><def:datafieldcontrol id="ADOScom" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
													IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="Communication Total:"
													FieldTextBoxTabIndex="38" DatabaseField="ADOScom" FieldLabelWidth="200px" RenderReadOnlyAsDiv="True"></def:datafieldcontrol>
											</td>
										</tr>
										<tr>
											<td><def:datafieldcontrol id="ADOSsoc" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
													IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="Social Impairments Total:"
													FieldTextBoxTabIndex="39" DatabaseField="ADOSsoc" FieldLabelWidth="200px" RenderReadOnlyAsDiv="True"></def:datafieldcontrol>
											</td>
										</tr>
										<tr>
											<td><def:datafieldcontrol id="ADOStot" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
													IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="Comm. + Social:"
													FieldTextBoxTabIndex="40" DatabaseField="ADOStot" FieldLabelWidth="200px" RenderReadOnlyAsDiv="True"></def:datafieldcontrol>
											</td>
										</tr>
										<tr>
											<td><def:datafieldcontrol id="ADOSCtot" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
													IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="Play:"
													FieldTextBoxTabIndex="41" DatabaseField="ADOSCtot" FieldLabelWidth="200px" RenderReadOnlyAsDiv="True"></def:datafieldcontrol>
											</td>
										</tr>
										<tr>
											<td><def:datafieldcontrol id="ADOSDtot" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
													IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="Stereotyped Behav. Restricted Interests:"
													FieldTextBoxTabIndex="42" DatabaseField="ADOSDtot" FieldLabelWidth="200px" RenderReadOnlyAsDiv="True"></def:datafieldcontrol>
											</td>
										</tr>
										<tr>
											<td><def:datafieldcontrol id="ADOSdx" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
													IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="ADOS diagnosis:"
													FieldTextBoxTabIndex="43" DatabaseField="ADOSdx" FieldLabelWidth="200px" RenderReadOnlyAsDiv="True"></def:datafieldcontrol>
											</td>
										</tr>
									</table>
								</td>
							</tr>
						</table>
						<def:datafieldcontrol id="scrmsg" runat="server" FieldLabelWidth="100px" DatabaseField="scrmsg" FieldTextBoxTabIndex="43"
							FieldLabelText="Scoring Errors:" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
							IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT" RenderReadOnlyAsDiv="True"></def:datafieldcontrol>
						<br>
						<asp:Panel ID="mainPanel" Runat="server">
							<TABLE class="grid" id="table_entry">
								<TR>
									<TD width="335">
										<def:datafieldcontrol id="ADOS01" runat="server" FieldTextBoxWidth="40px" FieldLabelWidth="200px" DatabaseField="ADOS01"
											FieldTextBoxTabIndex="6" FieldLabelText="A1. Overall level of non-achoed lang" IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="0,1,2,3,9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="ADOS16" runat="server" FieldTextBoxWidth="40px" FieldLabelWidth="200px" DatabaseField="ADOS16"
											FieldTextBoxTabIndex="21" FieldLabelText="B6. Insight" IsDoubleEntryField="True" IsReadOnly="False"
											IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="0,1,2,3,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD width="335">
										<def:datafieldcontrol id="ADOS02" runat="server" FieldTextBoxWidth="40px" FieldLabelWidth="200px" DatabaseField="ADOS02"
											FieldTextBoxTabIndex="7" FieldLabelText="A2. Speech abnormalities" IsDoubleEntryField="True" IsReadOnly="False"
											IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="0,1,2,7,8"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="ADOS17" runat="server" FieldTextBoxWidth="40px" FieldLabelWidth="200px" DatabaseField="ADOS17"
											FieldTextBoxTabIndex="22" FieldLabelText="B7. Responsibility" IsDoubleEntryField="True" IsReadOnly="False"
											IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" FieldLabelCssClass="boldfieldlabel" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD width="335">
										<def:datafieldcontrol id="ADOS03" runat="server" FieldTextBoxWidth="40px" FieldLabelWidth="200px" DatabaseField="ADOS03"
											FieldTextBoxTabIndex="8" FieldLabelText="A3. Echolalia" IsDoubleEntryField="True" IsReadOnly="False"
											IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="0,1,2,3,9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="ADOS18" runat="server" FieldTextBoxWidth="40px" FieldLabelWidth="200px" DatabaseField="ADOS18"
											FieldTextBoxTabIndex="23" FieldLabelText="B8. Quality of social overtures" IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" FieldLabelCssClass="boldfieldlabel" ValidList="0,1,2,3,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD width="335">
										<def:datafieldcontrol id="ADOS04" runat="server" FieldTextBoxWidth="40px" FieldLabelWidth="200px" DatabaseField="ADOS04"
											FieldTextBoxTabIndex="9" FieldLabelText="A4. Stereotyped, idiosyncratic words" IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" FieldLabelCssClass="boldfieldlabel" ValidList="0,1,2,3,9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="ADOS19" runat="server" FieldTextBoxWidth="40px" FieldLabelWidth="200px" DatabaseField="ADOS19"
											FieldTextBoxTabIndex="24" FieldLabelText="B9. Quality of social response" IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" FieldLabelCssClass="boldfieldlabel" ValidList="0,1,2,3,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD width="335">
										<def:datafieldcontrol id="ADOS05" runat="server" FieldTextBoxWidth="40px" FieldLabelWidth="200px" DatabaseField="ADOS05"
											FieldTextBoxTabIndex="10" FieldLabelText="A5. Offers information" IsDoubleEntryField="True" IsReadOnly="False"
											IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="ADOS20" runat="server" FieldTextBoxWidth="40px" FieldLabelWidth="200px" DatabaseField="ADOS20"
											FieldTextBoxTabIndex="25" FieldLabelText="B10. Amt of reciprocal social communication" IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" FieldLabelCssClass="boldfieldlabel" ValidList="0,1,2,3,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD width="335">
										<def:datafieldcontrol id="ADOS06" runat="server" FieldTextBoxWidth="40px" FieldLabelWidth="200px" DatabaseField="ADOS06"
											FieldTextBoxTabIndex="11" FieldLabelText="A6. Asks for information" IsDoubleEntryField="True" IsReadOnly="False"
											IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="0,1,2,3,9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="ADOS21" runat="server" FieldTextBoxWidth="40px" FieldLabelWidth="200px" DatabaseField="ADOS21"
											FieldTextBoxTabIndex="26" FieldLabelText="B11. Quality of rapport" IsDoubleEntryField="True" IsReadOnly="False"
											IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="0,1,2,3,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD width="335">
										<def:datafieldcontrol id="ADOS07" runat="server" FieldTextBoxWidth="40px" FieldLabelWidth="200px" DatabaseField="ADOS07"
											FieldTextBoxTabIndex="12" FieldLabelText="A7. Reporting events out of context" IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="0,1,2,3,9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="ADOS22" runat="server" FieldTextBoxWidth="40px" FieldLabelWidth="200px" DatabaseField="ADOS22"
											FieldTextBoxTabIndex="27" FieldLabelText="C1. Imagination/Creativity" IsDoubleEntryField="True" IsReadOnly="False"
											IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" FieldLabelCssClass="boldfieldlabel" ValidList="0,1,2,3,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD width="335">
										<def:datafieldcontrol id="ADOS08" runat="server" FieldTextBoxWidth="40px" FieldLabelWidth="200px" DatabaseField="ADOS08"
											FieldTextBoxTabIndex="13" FieldLabelText="A8. Conversation" IsDoubleEntryField="True" IsReadOnly="False"
											IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" FieldLabelCssClass="boldfieldlabel" ValidList="0,1,2,3,8,9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="ADOS23" runat="server" FieldTextBoxWidth="40px" FieldLabelWidth="200px" DatabaseField="ADOS23"
											FieldTextBoxTabIndex="28" FieldLabelText="D1. Unusual sensory interest" IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" FieldLabelCssClass="boldfieldlabel" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD width="335">
										<def:datafieldcontrol id="ADOS09" runat="server" FieldTextBoxWidth="40px" FieldLabelWidth="200px" DatabaseField="ADOS09"
											FieldTextBoxTabIndex="14" FieldLabelText="A9. Descriptive gestures" IsDoubleEntryField="True" IsReadOnly="False"
											IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" FieldLabelCssClass="boldfieldlabel" ValidList="0,1,2,3,8,9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="ADOS24" runat="server" FieldTextBoxWidth="40px" FieldLabelWidth="200px" DatabaseField="ADOS24"
											FieldTextBoxTabIndex="29" FieldLabelText="D2. Hand and finger mannerisms" IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" FieldLabelCssClass="boldfieldlabel" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD width="335">
										<def:datafieldcontrol id="ADOS10" runat="server" FieldTextBoxWidth="40px" FieldLabelWidth="200px" DatabaseField="ADOS10"
											FieldTextBoxTabIndex="15" FieldLabelText="A10. Emphatic, emotional gestures" IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" FieldLabelCssClass="boldfieldlabel" ValidList="0,1,2,3,8,9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="ADOS25" runat="server" FieldTextBoxWidth="40px" FieldLabelWidth="200px" DatabaseField="ADOS25"
											FieldTextBoxTabIndex="30" FieldLabelText="D3. Self-Injurious behavior" IsDoubleEntryField="True" IsReadOnly="False"
											IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD width="335">
										<def:datafieldcontrol id="ADOS11" runat="server" FieldTextBoxWidth="40px" FieldLabelWidth="200px" DatabaseField="ADOS11"
											FieldTextBoxTabIndex="16" FieldLabelText="B1. Unusual eye contact" IsDoubleEntryField="True" IsReadOnly="False"
											IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" FieldLabelCssClass="boldfieldlabel" ValidList="0,2,9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="ADOS26" runat="server" FieldTextBoxWidth="40px" FieldLabelWidth="200px" DatabaseField="ADOS26"
											FieldTextBoxTabIndex="31" FieldLabelText="D4. Excessive interest to unusual/specific topics" IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" FieldLabelCssClass="boldfieldlabel" ValidList="0,1,2,3,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD width="335">
										<def:datafieldcontrol id="ADOS12" runat="server" FieldTextBoxWidth="40px" FieldLabelWidth="200px" DatabaseField="ADOS12"
											FieldTextBoxTabIndex="17" FieldLabelText="B2. Facial expressions directed to others" IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" FieldLabelCssClass="boldfieldlabel" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="ADOS27" runat="server" FieldTextBoxWidth="40px" FieldLabelWidth="200px" DatabaseField="ADOS27"
											FieldTextBoxTabIndex="32" FieldLabelText="D5. Compulsions or rituals" IsDoubleEntryField="True" IsReadOnly="False"
											IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" FieldLabelCssClass="boldfieldlabel" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD width="335">
										<def:datafieldcontrol id="ADOS13" runat="server" FieldTextBoxWidth="40px" FieldLabelWidth="200px" DatabaseField="ADOS13"
											FieldTextBoxTabIndex="18" FieldLabelText="B3. Lang production and linked nonverbal behav" IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="0,1,2,7,8"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="ADOS28" runat="server" FieldTextBoxWidth="40px" FieldLabelWidth="200px" DatabaseField="ADOS28"
											FieldTextBoxTabIndex="33" FieldLabelText="E1. Overactivity" IsDoubleEntryField="True" IsReadOnly="False"
											IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="0,1,2,7,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD width="335">
										<def:datafieldcontrol id="ADOS14" runat="server" FieldTextBoxWidth="40px" FieldLabelWidth="200px" DatabaseField="ADOS14"
											FieldTextBoxTabIndex="19" FieldLabelText="B4. Communication of own affect" IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="0,1,2,3,9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="ADOS29" runat="server" FieldTextBoxWidth="40px" FieldLabelWidth="200px" DatabaseField="ADOS29"
											FieldTextBoxTabIndex="34" FieldLabelText="E2. Tantrums, aggress, neg beh." IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD width="335">
										<def:datafieldcontrol id="ADOS15" runat="server" FieldTextBoxWidth="40px" FieldLabelWidth="200px" DatabaseField="ADOS15"
											FieldTextBoxTabIndex="20" FieldLabelText="B5. Empathy/comments on others' emots" IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" FieldLabelCssClass="boldfieldlabel" ValidList="0,1,2,3,9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="ADOS30" runat="server" FieldTextBoxWidth="40px" FieldLabelWidth="200px" DatabaseField="ADOS30"
											FieldTextBoxTabIndex="35" FieldLabelText="E3.  Anxiety" IsDoubleEntryField="True" IsReadOnly="False"
											IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
							<BR>
							<TABLE class="layout">
								<TR>
									<TD>
										<def:datafieldcontrol id="created" runat="server" FieldLabelWidth="80px" DatabaseField="created" FieldTextBoxTabIndex="49"
											FieldLabelText="created" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="DATE" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="createdBy" runat="server" FieldLabelWidth="80px" DatabaseField="createdBy" FieldTextBoxTabIndex="50"
											FieldLabelText="createdBy" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="updated" runat="server" FieldLabelWidth="80px" DatabaseField="updated" FieldTextBoxTabIndex="51"
											FieldLabelText="updated" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="DATE" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="updatedBy" runat="server" FieldLabelWidth="80px" DatabaseField="updatedBy" FieldTextBoxTabIndex="52"
											FieldLabelText="updatedBy" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="scored" runat="server" FieldLabelWidth="80px" DatabaseField="scored" FieldTextBoxTabIndex="237"
											FieldLabelText="scored" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="DATE" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="scoredBy" runat="server" FieldLabelWidth="80px" DatabaseField="scoredBy" FieldTextBoxTabIndex="238"
											FieldLabelText="scoredBy" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
						</asp:Panel>
					</asp:Content>
