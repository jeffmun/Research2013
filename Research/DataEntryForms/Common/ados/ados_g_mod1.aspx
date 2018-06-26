
<%@ Register TagPrefix="def" Namespace="DataEntryFramework" %>
<%@ Page language="c#" Inherits="gen_ados_wps.ados_g_mod1" CodeFile="ados_g_mod1.aspx.cs"  MasterPageFile="~/UWAC.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="oBodyPlaceHolder" runat="server">
						<A href="ados_lookup.aspx">Back to Main ADOS page (Click here to enter other ADOS 
							modules.)</A>
						<def:dataentrycontroller id="DataEntryController1" runat="server" ShowScoreButton="True" VerifiedField="verified"
							PrimaryKeyField="ados_pk" MeasureName="ADOS-G Module 1" LookupTextBox1LabelText="Subject ID:" LookupTextBox2Visible="True"
							LookupField1="id" DatabaseTable="all_ados" LookupField1DataType="TEXT" 
							AllowedStudyMeasures="84,125,153,192,215,339,379,544,545,585,660,697,698,923,2485"
							LookupField2="indexnum" LookupTextBox2LabelText="Indexnum" LastScoredDateField="scored" LastUpdatedDateField="updated" ondoscore="DataEntryController1_DoScore"></def:dataentrycontroller><br>
						<h3>ADOS G Module 1</h3>
						<table>
							<tr>
								<td width="283">
									<table class="layout" id="table_insert">
										<tr>
											<td><def:datafieldcontrol id="indid" runat="server" FieldLabelWidth="80px" DatabaseField="id" FieldTextBoxTabIndex="2"
													FieldLabelText="ID" IsDoubleEntryField="false" IsReadOnly="False" IsEntryValueRequired="false" IsEntryField="false"
													IsInsertValueRequired="True" IsInsertField="True" FieldDataType="TEXT" FieldTextBoxWidth="80px"></def:datafieldcontrol></td>
										</tr>
										<tr>
											<td>
												<def:datafieldcontrol id="indexnum" runat="server" FieldTextBoxWidth="80px" FieldDataType="INT" IsInsertField="True"
													IsInsertValueRequired="True" IsEntryField="false" IsEntryValueRequired="false" IsReadOnly="False"
													IsDoubleEntryField="false" FieldLabelText="Indexnum" FieldTextBoxTabIndex="2" DatabaseField="indexnum"
													FieldLabelWidth="80px"></def:datafieldcontrol></td>
										</tr>
										<tr>
											<td><def:datafieldcontrol id="ADOSdate" runat="server" FieldLabelWidth="80px" DatabaseField="ADOSdate" FieldTextBoxTabIndex="3"
													FieldLabelText="ADOSdate" IsDoubleEntryField="false" IsReadOnly="False" IsEntryValueRequired="True"
													IsEntryField="True" IsInsertValueRequired="True" IsInsertField="True" FieldDataType="DATE" FormatString="{0:d}"
													FieldTextBoxWidth="80px"></def:datafieldcontrol></td>
										</tr>
										<tr>
											<td><def:datafieldcontrol id="ADOSclin" runat="server" FieldLabelWidth="80px" DatabaseField="ADOSclin" FieldTextBoxTabIndex="4"
													FieldLabelText="ADOSclin" IsDoubleEntryField="false" IsReadOnly="False" IsEntryValueRequired="True"
													IsEntryField="True" IsInsertValueRequired="True" IsInsertField="True" FieldDataType="TEXT" FieldTextBoxWidth="80px"></def:datafieldcontrol>
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
											<td><def:datafieldcontrol id="ADOSmod" runat="server" DatabaseField="ADOSmod" FieldTextBoxTabIndex="54" FieldLabelText="ADOSmod"
													IsDoubleEntryField="False" IsReadOnly="false" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="true"
													IsInsertField="true" FieldDataType="INT" FieldLabelCssClass="hideme" FieldTextBoxCssClass="hideme"
													FieldTextBoxTextDefault="1"></def:datafieldcontrol></td>
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
									<table class="layout" id="table_score">
										<tr>
											<td><def:datafieldcontrol id="ADOScom" runat="server" FieldLabelWidth="200px" DatabaseField="ADOScom" FieldTextBoxTabIndex="38"
													FieldLabelText="Communication Total:" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
													IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></td>
										</tr>
										<tr>
											<td><def:datafieldcontrol id="ADOSsoc" runat="server" FieldLabelWidth="200px" DatabaseField="ADOSsoc" FieldTextBoxTabIndex="39"
													FieldLabelText="Social Impairments Total:" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
													IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></td>
										</tr>
										<tr>
											<td><def:datafieldcontrol id="ADOStot" runat="server" FieldLabelWidth="200px" DatabaseField="ADOStot" FieldTextBoxTabIndex="42"
													FieldLabelText="Comm. + Social:" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
													IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></td>
										</tr>
										<tr>
											<td><def:datafieldcontrol id="ADOSCtot" runat="server" FieldLabelWidth="200px" DatabaseField="ADOSCtot" FieldTextBoxTabIndex="40"
													FieldLabelText="Play:" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False"
													IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></td>
										</tr>
										<tr>
											<td><def:datafieldcontrol id="ADOSDtot" runat="server" FieldLabelWidth="200px" DatabaseField="ADOSDtot" FieldTextBoxTabIndex="41"
													FieldLabelText="Stereotyped Behav. Restricted Interests:" IsDoubleEntryField="False" IsReadOnly="True"
													IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False"
													FieldDataType="INT" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></td>
										</tr>
										<tr>
											<td><def:datafieldcontrol id="ADOSdx" runat="server" FieldLabelWidth="200px" DatabaseField="ADOSdx" FieldTextBoxTabIndex="43"
													FieldLabelText="ADOS diagnosis:" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
													IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></td>
										</tr>
									</table>
								</td>
							</tr>
						</table>
						<def:datafieldcontrol id="scrmsg" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
							IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="Scoring Errors:"
							FieldTextBoxTabIndex="43" DatabaseField="scrmsg" FieldLabelWidth="100px" RenderReadOnlyAsDiv="True"></def:datafieldcontrol>
						<br>
						<asp:Panel ID="mainPanel" Runat="server">
							<TABLE class="grid" id="table_entry">
								<TR>
									<TD width="299">
										<def:datafieldcontrol id="ADOS01" runat="server" FieldTextBoxWidth="40px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="A1. Overall level of non-echoed lang" FieldTextBoxTabIndex="6" DatabaseField="ADOS01"
											FieldLabelWidth="200px" ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="ADOS16" runat="server" FieldTextBoxWidth="40px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="B8. Giving" FieldTextBoxTabIndex="21" DatabaseField="ADOS16" FieldLabelWidth="200px"
											ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD width="299">
										<def:datafieldcontrol id="ADOS02" runat="server" FieldTextBoxWidth="40px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="A2. Freq of vocaliz toward others" FieldTextBoxTabIndex="7" DatabaseField="ADOS02"
											FieldLabelWidth="200px" FieldLabelCssClass="boldfieldlabel" ValidList="0,1,2,3,9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="ADOS17" runat="server" FieldTextBoxWidth="40px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="B9. Showing" FieldTextBoxTabIndex="22" DatabaseField="ADOS17" FieldLabelWidth="200px"
											FieldLabelCssClass="boldfieldlabel" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD width="299">
										<def:datafieldcontrol id="ADOS03" runat="server" FieldTextBoxWidth="40px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="A3. Intonation" FieldTextBoxTabIndex="8" DatabaseField="ADOS03" FieldLabelWidth="200px"
											ValidList="0,1,2,8,9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="ADOS18" runat="server" FieldTextBoxWidth="40px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="B10. Initiation of joint attn" FieldTextBoxTabIndex="23" DatabaseField="ADOS18" FieldLabelWidth="200px"
											FieldLabelCssClass="boldfieldlabel" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD width="299">
										<def:datafieldcontrol id="ADOS04" runat="server" FieldTextBoxWidth="40px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="A4. Immed. Echolalia" FieldTextBoxTabIndex="9" DatabaseField="ADOS04" FieldLabelWidth="200px"
											ValidList="0,1,2,3,8,9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="ADOS19" runat="server" FieldTextBoxWidth="40px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="B11. Response to joint attn" FieldTextBoxTabIndex="24" DatabaseField="ADOS19" FieldLabelWidth="200px"
											FieldLabelCssClass="boldfieldlabel" ValidList="0,1,2,3,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD width="299">
										<def:datafieldcontrol id="ADOS05" runat="server" FieldTextBoxWidth="40px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="A5. Stereotyped, idiosyncratic words" FieldTextBoxTabIndex="10" DatabaseField="ADOS05"
											FieldLabelWidth="200px" FieldLabelCssClass="boldfieldlabel" ValidList="0,1,2,3,8,9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="ADOS20" runat="server" FieldTextBoxWidth="40px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="B12. Quality of social overtures" FieldTextBoxTabIndex="25" DatabaseField="ADOS20"
											FieldLabelWidth="200px" FieldLabelCssClass="boldfieldlabel" ValidList="0,1,2,3,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD width="299">
										<def:datafieldcontrol id="ADOS06" runat="server" FieldTextBoxWidth="40px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="A6. Use of others' body to communicate" FieldTextBoxTabIndex="11" DatabaseField="ADOS06"
											FieldLabelWidth="200px" FieldLabelCssClass="boldfieldlabel" ValidList="0,1,2,8,9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="ADOS21" runat="server" FieldTextBoxWidth="40px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="C1.  Functional play w/ obj" FieldTextBoxTabIndex="26" DatabaseField="ADOS21" FieldLabelWidth="200px"
											FieldLabelCssClass="boldfieldlabel" ValidList="0,1,2,3,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD width="299">
										<def:datafieldcontrol id="ADOS07" runat="server" FieldTextBoxWidth="40px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="A7. Pointing" FieldTextBoxTabIndex="12" DatabaseField="ADOS07" FieldLabelWidth="200px"
											FieldLabelCssClass="boldfieldlabel" ValidList="0,1,2,3,9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="ADOS22" runat="server" FieldTextBoxWidth="40px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="C2. Imagination/Creativity" FieldTextBoxTabIndex="27" DatabaseField="ADOS22" FieldLabelWidth="200px"
											FieldLabelCssClass="boldfieldlabel" ValidList="0,1,2,3,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD width="299" height="28">
										<def:datafieldcontrol id="ADOS08" runat="server" FieldTextBoxWidth="40px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="A8. Gestures" FieldTextBoxTabIndex="13" DatabaseField="ADOS08" FieldLabelWidth="200px"
											FieldLabelCssClass="boldfieldlabel" ValidList="0,1,2,8,9"></def:datafieldcontrol></TD>
									<TD height="28">
										<def:datafieldcontrol id="ADOS23" runat="server" FieldTextBoxWidth="40px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="D1. Unusual sensory interest" FieldTextBoxTabIndex="28" DatabaseField="ADOS23" FieldLabelWidth="200px"
											FieldLabelCssClass="boldfieldlabel" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD width="299">
										<def:datafieldcontrol id="ADOS09" runat="server" FieldTextBoxWidth="40px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="B1. Unusual eye contact" FieldTextBoxTabIndex="14" DatabaseField="ADOS09" FieldLabelWidth="200px"
											FieldLabelCssClass="boldfieldlabel" ValidList="0,2,9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="ADOS24" runat="server" FieldTextBoxWidth="40px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="D2. Hand and finger mannerisms" FieldTextBoxTabIndex="29" DatabaseField="ADOS24" FieldLabelWidth="200px"
											FieldLabelCssClass="boldfieldlabel" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD width="299">
										<def:datafieldcontrol id="ADOS10" runat="server" FieldTextBoxWidth="40px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="B2. Responsive social smile" FieldTextBoxTabIndex="15" DatabaseField="ADOS10" FieldLabelWidth="200px"
											ValidList="0,1,2,3,9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="ADOS25" runat="server" FieldTextBoxWidth="40px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="D3.  Self-Injurious behavior" FieldTextBoxTabIndex="30" DatabaseField="ADOS25" FieldLabelWidth="200px"
											ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD width="299">
										<def:datafieldcontrol id="ADOS11" runat="server" FieldTextBoxWidth="40px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="B3. Facial expressions directed to others" FieldTextBoxTabIndex="16" DatabaseField="ADOS11"
											FieldLabelWidth="200px" FieldLabelCssClass="boldfieldlabel" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="ADOS26" runat="server" FieldTextBoxWidth="40px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="D4. Repetitive interest/ stereotyped behav" FieldTextBoxTabIndex="31" DatabaseField="ADOS26"
											FieldLabelWidth="200px" FieldLabelCssClass="boldfieldlabel" ValidList="0,1,2,3,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD width="299">
										<def:datafieldcontrol id="ADOS12" runat="server" FieldTextBoxWidth="40px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="B4. Integration of gaze during social overtures" FieldTextBoxTabIndex="17" DatabaseField="ADOS12"
											FieldLabelWidth="200px" ValidList="0,1,2,3,9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="ADOS27" runat="server" FieldTextBoxWidth="40px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="E1. Overactivity" FieldTextBoxTabIndex="32" DatabaseField="ADOS27" FieldLabelWidth="200px"
											ValidList="0,1,2,7,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD width="299">
										<def:datafieldcontrol id="ADOS13" runat="server" FieldTextBoxWidth="40px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="B5. Shared enjoyment" FieldTextBoxTabIndex="18" DatabaseField="ADOS13" FieldLabelWidth="200px"
											FieldLabelCssClass="boldfieldlabel" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="ADOS28" runat="server" FieldTextBoxWidth="40px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="E2. Tantrums, aggress, neg beh." FieldTextBoxTabIndex="33" DatabaseField="ADOS28"
											FieldLabelWidth="200px" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD width="299">
										<def:datafieldcontrol id="ADOS14" runat="server" FieldTextBoxWidth="40px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="B6. Response to name" FieldTextBoxTabIndex="19" DatabaseField="ADOS14" FieldLabelWidth="200px"
											ValidList="0,1,2,3,9"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="ADOS29" runat="server" FieldTextBoxWidth="40px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="E3.  Anxiety" FieldTextBoxTabIndex="34" DatabaseField="ADOS29" FieldLabelWidth="200px"
											ValidList="0,1,2,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD width="299">
										<def:datafieldcontrol id="ADOS15" runat="server" FieldTextBoxWidth="40px" FieldDataType="INT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
											FieldLabelText="B7. Requesting" FieldTextBoxTabIndex="20" DatabaseField="ADOS15" FieldLabelWidth="200px"
											ValidList="0,1,2,3,9"></def:datafieldcontrol></TD>
									<TD></TD>
								</TR>
							</TABLE>
							<BR>
							<TABLE class="layout" id="table_readonly">
								<TR>
									<TD>
										<def:datafieldcontrol id="created" runat="server" FieldDataType="DATE" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="created"
											FieldTextBoxTabIndex="49" DatabaseField="created" FieldLabelWidth="80px" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="createdBy" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="createdBy"
											FieldTextBoxTabIndex="50" DatabaseField="createdBy" FieldLabelWidth="80px" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="updated" runat="server" FieldDataType="DATE" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="updated"
											FieldTextBoxTabIndex="51" DatabaseField="updated" FieldLabelWidth="80px" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="updatedBy" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="updatedBy"
											FieldTextBoxTabIndex="52" DatabaseField="updatedBy" FieldLabelWidth="80px" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="scored" runat="server" FieldDataType="DATE" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="scored"
											FieldTextBoxTabIndex="237" DatabaseField="scored" FieldLabelWidth="80px" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="scoredBy" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="scoredBy"
											FieldTextBoxTabIndex="238" DatabaseField="scoredBy" FieldLabelWidth="80px" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
						</asp:Panel>
					</asp:Content>
