<%@ Register TagPrefix="def" Namespace="DataEntryFramework.Old" %>
<%@ Page language="c#" Inherits="face_ados_wps.face_ados_wps_mod4" CodeFile="face_ados_wps_mod4.aspx.cs"  MasterPageFile="~/UWAC.master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="oBodyPlaceHolder" runat="server">
						<def:dataentrycontroller id="DataEntryController1" runat="server" DatabaseTable="face_ados_wps" LookupField1="faceid"
							LookupTextBox2Visible="False" LookupTextBox1LabelText="FACE ID:" MeasureName="FACE ADOS WPS Module 4"
							PrimaryKeyField="adoswps_pk" VerifiedField="verified" ShowScoreButton="True" LookupField1DataType="TEXT"
							StudyMeasID="379" ondoscore="DataEntryController1_DoScore"></def:dataentrycontroller><br>
						<div class="divDataEntryFields">
							<table>
								<tr>
									<td><table id="table_insert" class="tblinsert">
											<tr>
												<td><def:datafieldcontrol id="id" runat="server" FieldDataType="TEXT" IsInsertField="True" IsInsertValueRequired="True"
														IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="FACE ID"
														FieldTextBoxTabIndex="2" DatabaseField="faceid" RegEx="^[F][A][C][E][0-9][0-9][0-9]$" RegExDescription="TAP ID must  look like TAP###"
														FieldLabelWidth="80px"></def:datafieldcontrol>
												</td>
											</tr>
											<tr>
												<td><def:datafieldcontrol id="ADOSdate" runat="server" FieldDataType="DATE" IsInsertField="True" IsInsertValueRequired="True"
														IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="ADOSdate"
														FieldTextBoxTabIndex="3" DatabaseField="ADOSdate" FormatString="{0:d}" FieldLabelWidth="80px"></def:datafieldcontrol>
												</td>
											</tr>
											<tr>
												<td><def:datafieldcontrol id="ADOSclin" runat="server" FieldDataType="TEXT" IsInsertField="True" IsInsertValueRequired="True"
														IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="ADOSclin"
														FieldTextBoxTabIndex="4" DatabaseField="ADOSclin" FieldLabelWidth="80px"></def:datafieldcontrol>
												</td>
											</tr>
										</table>
									</td>
									<td>
										<table id="table_readonly" class="tblreadonly">
											<tr>
												<td><def:datafieldcontrol id="ADOScom" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="Communication Total:"
														FieldTextBoxTabIndex="38" DatabaseField="ADOScom" FieldLabelWidth="150px"></def:datafieldcontrol>
												</td>
											</tr>
											<tr>
												<td><def:datafieldcontrol id="ADOSsoc" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="Social Impairments Total:"
														FieldTextBoxTabIndex="39" DatabaseField="ADOSsoc" FieldLabelWidth="150px"></def:datafieldcontrol>
												</td>
											</tr>
											<tr>
												<td><def:datafieldcontrol id="ADOStot" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="Comm. + Social:"
														FieldTextBoxTabIndex="40" DatabaseField="ADOStot" FieldLabelWidth="150px"></def:datafieldcontrol>
												</td>
											</tr>
											<tr>
												<td><def:datafieldcontrol id="ADOSCtot" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="Play:"
														FieldTextBoxTabIndex="41" DatabaseField="ADOSCtot" FieldLabelWidth="150px"></def:datafieldcontrol>
												</td>
											</tr>
											<tr>
												<td><def:datafieldcontrol id="ADOSDtot" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="Stereotyped Behav. Restricted Interests:"
														FieldTextBoxTabIndex="42" DatabaseField="ADOSDtot" FieldLabelWidth="150px"></def:datafieldcontrol>
												</td>
											</tr>
											<tr>
												<td><def:datafieldcontrol id="ADOSdx" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="ADOS diagnosis:"
														FieldTextBoxTabIndex="43" DatabaseField="ADOSdx" FieldLabelWidth="150px"></def:datafieldcontrol>
												</td>
											</tr>
										</table>
									</td>
								</tr>
							</table>
							<br>
							<table id="table_entry" class="tblentry">
								<tr>
									<td width="338">
										<def:datafieldcontrol id="ADOS01" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="A1. Overall level of non-achoed lang"
											FieldTextBoxTabIndex="6" DatabaseField="ADOS01" ValidList="0,1,2,3,9" FieldLabelWidth="200px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
									</td>
									<td>
										<def:datafieldcontrol id="ADOS16" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="B6. Empathy"
											FieldTextBoxTabIndex="21" DatabaseField="ADOS16" ValidList="0,1,2,3,9" FieldLabelWidth="200px" FieldTextBoxWidth="30px"
											FieldLabelCssClass="boldfieldlabel"></def:datafieldcontrol>
									</td>
								</tr>
								<tr>
									<td width="338">
										<def:datafieldcontrol id="ADOS02" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="A2. Speech abnormalities"
											FieldTextBoxTabIndex="7" DatabaseField="ADOS02" ValidList="0,1,2,7,8,9" FieldLabelWidth="200px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
									</td>
									<td>
										<def:datafieldcontrol id="ADOS17" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="B7. Insight"
											FieldTextBoxTabIndex="22" DatabaseField="ADOS17" ValidList="0,1,2,3,9" FieldLabelWidth="200px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
									</td>
								</tr>
								<tr>
									<td width="338">
										<def:datafieldcontrol id="ADOS03" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="A3. Echolalia"
											FieldTextBoxTabIndex="8" DatabaseField="ADOS03" ValidList="0,1,2,3,9" FieldLabelWidth="200px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
									</td>
									<td>
										<def:datafieldcontrol id="ADOS18" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="B8. Responsibility"
											FieldTextBoxTabIndex="23" DatabaseField="ADOS18" ValidList="0,1,2,9" FieldLabelWidth="200px" FieldTextBoxWidth="30px"
											FieldLabelCssClass="boldfieldlabel"></def:datafieldcontrol>
									</td>
								</tr>
								<tr>
									<td width="338">
										<def:datafieldcontrol id="ADOS04" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="A4. Stereotyped, idiosyncratic words"
											FieldTextBoxTabIndex="9" DatabaseField="ADOS04" ValidList="0,1,2,3,9" FieldLabelWidth="200px" FieldTextBoxWidth="30px"
											FieldLabelCssClass="boldfieldlabel"></def:datafieldcontrol>
									</td>
									<td>
										<def:datafieldcontrol id="ADOS19" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="B9. Quality of social overtures"
											FieldTextBoxTabIndex="24" DatabaseField="ADOS19" ValidList="0,1,2,3,9" FieldLabelWidth="200px" FieldTextBoxWidth="30px"
											FieldLabelCssClass="boldfieldlabel"></def:datafieldcontrol>
									</td>
								</tr>
								<tr>
									<td width="338">
										<def:datafieldcontrol id="ADOS05" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="A5. Offers information"
											FieldTextBoxTabIndex="10" DatabaseField="ADOS05" ValidList="0,1,2,9" FieldLabelWidth="200px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
									</td>
									<td>
										<def:datafieldcontrol id="ADOS20" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="B10.  Quality of social response"
											FieldTextBoxTabIndex="25" DatabaseField="ADOS20" ValidList="0,1,2,3,9" FieldLabelWidth="200px" FieldTextBoxWidth="30px"
											FieldLabelCssClass="boldfieldlabel"></def:datafieldcontrol>
									</td>
								</tr>
								<tr>
									<td width="338">
										<def:datafieldcontrol id="ADOS06" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="A6. Asks for information"
											FieldTextBoxTabIndex="11" DatabaseField="ADOS06" ValidList="0,1,2,3,9" FieldLabelWidth="200px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
									</td>
									<td>
										<def:datafieldcontrol id="ADOS21" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="B11. Amt of reciprocal social communication"
											FieldTextBoxTabIndex="26" DatabaseField="ADOS21" ValidList="0,1,2,3,9" FieldLabelWidth="200px" FieldTextBoxWidth="30px"
											FieldLabelCssClass="boldfieldlabel"></def:datafieldcontrol>
									</td>
								</tr>
								<tr>
									<td width="338">
										<def:datafieldcontrol id="ADOS07" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="A7. Reporting events out of context"
											FieldTextBoxTabIndex="12" DatabaseField="ADOS07" ValidList="0,1,2,3,9" FieldLabelWidth="200px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
									</td>
									<td>
										<def:datafieldcontrol id="ADOS22" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="B12. Overall quality of rapport"
											FieldTextBoxTabIndex="27" DatabaseField="ADOS22" ValidList="0,1,2,3,9" FieldLabelWidth="200px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
									</td>
								</tr>
								<tr>
									<td width="338">
										<def:datafieldcontrol id="ADOS08" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="A8. Conversation"
											FieldTextBoxTabIndex="13" DatabaseField="ADOS08" ValidList="0,1,2,3,9" FieldLabelWidth="200px" FieldTextBoxWidth="30px"
											FieldLabelCssClass="boldfieldlabel"></def:datafieldcontrol>
									</td>
									<td>
										<def:datafieldcontrol id="ADOS23" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="C1. Imagination/creativity"
											FieldTextBoxTabIndex="28" DatabaseField="ADOS23" ValidList="0,1,2,3,9" FieldLabelWidth="200px" FieldTextBoxWidth="30px"
											FieldLabelCssClass="boldfieldlabel"></def:datafieldcontrol>
									</td>
								</tr>
								<tr>
									<td width="338">
										<def:datafieldcontrol id="ADOS09" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="A9. Descriptive gestures"
											FieldTextBoxTabIndex="14" DatabaseField="ADOS09" ValidList="0,1,2,3,8" FieldLabelWidth="200px" FieldTextBoxWidth="30px"
											FieldLabelCssClass="boldfieldlabel"></def:datafieldcontrol>
									</td>
									<td>
										<def:datafieldcontrol id="ADOS24" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="D1. Unusual sensory interest"
											FieldTextBoxTabIndex="29" DatabaseField="ADOS24" ValidList="0,1,2,9" FieldLabelWidth="200px" FieldTextBoxWidth="30px"
											FieldLabelCssClass="boldfieldlabel"></def:datafieldcontrol>
									</td>
								</tr>
								<tr>
									<td width="338">
										<def:datafieldcontrol id="ADOS10" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="A10. Emphatic, emotional gestures"
											FieldTextBoxTabIndex="15" DatabaseField="ADOS10" ValidList="0,1,2,3,8" FieldLabelWidth="200px" FieldTextBoxWidth="30px"
											FieldLabelCssClass="boldfieldlabel"></def:datafieldcontrol>
									</td>
									<td>
										<def:datafieldcontrol id="ADOS25" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="D2. Hand and finger mannerisms"
											FieldTextBoxTabIndex="30" DatabaseField="ADOS25" ValidList="0,1,2,9" FieldLabelWidth="200px" FieldTextBoxWidth="30px"
											FieldLabelCssClass="boldfieldlabel"></def:datafieldcontrol>
									</td>
								</tr>
								<tr>
									<td width="338">
										<def:datafieldcontrol id="ADOS11" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="B1. Unusual eye contact"
											FieldTextBoxTabIndex="16" DatabaseField="ADOS11" ValidList="0,2,9" FieldLabelWidth="200px" FieldTextBoxWidth="30px"
											FieldLabelCssClass="boldfieldlabel"></def:datafieldcontrol>
									</td>
									<td>
										<def:datafieldcontrol id="ADOS26" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="D3. Self-Injurious behavior"
											FieldTextBoxTabIndex="31" DatabaseField="ADOS26" ValidList="0,1,2,9" FieldLabelWidth="200px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
									</td>
								</tr>
								<tr>
									<td width="338">
										<def:datafieldcontrol id="ADOS12" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="B2. Facial expressions directed to others"
											FieldTextBoxTabIndex="17" DatabaseField="ADOS12" ValidList="0,1,2,9" FieldLabelWidth="200px" FieldTextBoxWidth="30px"
											FieldLabelCssClass="boldfieldlabel"></def:datafieldcontrol>
									</td>
									<td>
										<def:datafieldcontrol id="ADOS27" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="D4. Excessive interest to unusual/specific topics"
											FieldTextBoxTabIndex="32" DatabaseField="ADOS27" ValidList="0,1,2,3,9" FieldLabelWidth="200px" FieldTextBoxWidth="30px"
											FieldLabelCssClass="boldfieldlabel"></def:datafieldcontrol>
									</td>
								</tr>
								<tr>
									<td width="338">
										<def:datafieldcontrol id="ADOS13" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="B3. Lang production and linked nonverbal behav"
											FieldTextBoxTabIndex="18" DatabaseField="ADOS13" ValidList="0,1,2,7,8,9" FieldLabelWidth="200px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
									</td>
									<td>
										<def:datafieldcontrol id="ADOS28" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="D5. Compulsions or rituals"
											FieldTextBoxTabIndex="33" DatabaseField="ADOS28" ValidList="0,1,2,9" FieldLabelWidth="200px" FieldTextBoxWidth="30px"
											FieldLabelCssClass="boldfieldlabel"></def:datafieldcontrol>
									</td>
								</tr>
								<tr>
									<td width="338">
										<def:datafieldcontrol id="ADOS14" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="B4. Shared enjoyment"
											FieldTextBoxTabIndex="19" DatabaseField="ADOS14" ValidList="0,1,2,8,9" FieldLabelWidth="200px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
									</td>
									<td>
										<def:datafieldcontrol id="ADOS29" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="E1. Overactivity"
											FieldTextBoxTabIndex="34" DatabaseField="ADOS29" ValidList="0,1,2,7,9" FieldLabelWidth="200px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
									</td>
								</tr>
								<tr>
									<td width="338">
										<def:datafieldcontrol id="ADOS15" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="B5. Communication of own affect"
											FieldTextBoxTabIndex="20" DatabaseField="ADOS15" ValidList="0,1,2,3,9" FieldLabelWidth="200px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
									</td>
									<td>
										<def:datafieldcontrol id="ADOS30" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="E2. Tantrums, aggress, neg beh."
											FieldTextBoxTabIndex="35" DatabaseField="ADOS30" ValidList="0,1,2,9" FieldLabelWidth="200px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
									</td>
								</tr>
								<tr>
									<td width="338"></td>
									<td>
										<def:datafieldcontrol id="ADOS31" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="E3.  Anxiety"
											FieldTextBoxTabIndex="36" DatabaseField="ADOS31" ValidList="0,1,2,9" FieldLabelWidth="200px" FieldTextBoxWidth="30px"></def:datafieldcontrol></td>
								</tr>
							</table>
							<br>
							<table>
								<tr>
									<td><def:datafieldcontrol id="created" runat="server" FieldDataType="DATE" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="created"
											FieldTextBoxTabIndex="49" DatabaseField="created"></def:datafieldcontrol>
									</td>
								</tr>
								<tr>
									<td><def:datafieldcontrol id="createdBy" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="createdBy"
											FieldTextBoxTabIndex="50" DatabaseField="createdBy"></def:datafieldcontrol>
									</td>
								</tr>
								<tr>
									<td><def:datafieldcontrol id="updated" runat="server" FieldDataType="DATE" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="updated"
											FieldTextBoxTabIndex="51" DatabaseField="updated"></def:datafieldcontrol>
									</td>
								</tr>
								<tr>
									<td><def:datafieldcontrol id="updatedBy" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="updatedBy"
											FieldTextBoxTabIndex="52" DatabaseField="updatedBy"></def:datafieldcontrol>
									</td>
								</tr>
							</table>
						</div>
					</asp:Content>
