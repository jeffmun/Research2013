
<%@ Register TagPrefix="def" Namespace="DataEntryFramework.Old" %>
<%@ Page language="c#" Inherits="edst3_ados_wps.edst3_ados_wps_mod1" CodeFile="edst3_ados_wps_mod1.aspx.cs"  MasterPageFile="~/UWAC.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="oBodyPlaceHolder" runat="server">
						<a href="edst3_ados_wps_lookup.aspx">Back to Main ADOS page (Click here to enter 
							other ADOS modules.)</a>
						<def:dataentrycontroller id="DataEntryController1" runat="server" DatabaseTable="edst3_ados_wps" LookupField1="edsid"
							LookupTextBox2Visible="False" LookupTextBox1LabelText="EDS ID:" MeasureName="EDST3 ADOS WPS Module 1"
							PrimaryKeyField="adoswps_pk" VerifiedField="verified" ShowScoreButton="True" StudyMeasID="192" ondoscore="DataEntryController1_DoScore"></def:dataentrycontroller><br>
						<div class="divDataEntryFields">
							<table style="WIDTH: 720px; HEIGHT: 212px">
								<tr>
									<td>
										<table id="table_insert" class="tblinsert">
											<tr>
												<td><def:datafieldcontrol id="edsid" runat="server" FieldDataType="INT" IsInsertField="True" IsInsertValueRequired="True"
														IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="edsid"
														FieldTextBoxTabIndex="2" DatabaseField="edsid" MaxVal="1000" MinVal="1" FieldLabelWidth="100px"></def:datafieldcontrol>
												</td>
											</tr>
											<tr>
												<td><def:datafieldcontrol id="ADOSdate" runat="server" FieldDataType="DATE" IsInsertField="True" IsInsertValueRequired="True"
														IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="ADOSdate"
														FieldTextBoxTabIndex="3" DatabaseField="ADOSdate" FormatString="{0:d}" FieldLabelWidth="100px"></def:datafieldcontrol>
												</td>
											</tr>
											<tr>
												<td><def:datafieldcontrol id="ADOSclin" runat="server" FieldDataType="TEXT" IsInsertField="True" IsInsertValueRequired="True"
														IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="ADOSclin"
														FieldTextBoxTabIndex="4" DatabaseField="ADOSclin" FieldLabelWidth="100px"></def:datafieldcontrol>
												</td>
											</tr>
										</table>
									</td>
									<td>
										<table id="table_score">
											<tr>
												<td><def:datafieldcontrol id="ADOScom" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="Communication Total:"
														FieldTextBoxTabIndex="38" DatabaseField="ADOScom" FieldLabelWidth="200px"></def:datafieldcontrol>
												</td>
											</tr>
											<tr>
												<td><def:datafieldcontrol id="ADOSsoc" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="Social Impairments Total:"
														FieldTextBoxTabIndex="39" DatabaseField="ADOSsoc" FieldLabelWidth="200px"></def:datafieldcontrol>
												</td>
											</tr>
											<tr>
												<td><def:datafieldcontrol id="ADOStot" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="Comm. + Social:"
														FieldTextBoxTabIndex="42" DatabaseField="ADOStot" FieldLabelWidth="200px"></def:datafieldcontrol>
												</td>
											</tr>
											<tr>
												<td><def:datafieldcontrol id="ADOSCtot" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="Play:"
														FieldTextBoxTabIndex="40" DatabaseField="ADOSCtot" FieldLabelWidth="200px"></def:datafieldcontrol>
												</td>
											</tr>
											<tr>
												<td><def:datafieldcontrol id="ADOSDtot" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="Stereotyped Behav. Restricted Interests:"
														FieldTextBoxTabIndex="41" DatabaseField="ADOSDtot" FieldLabelWidth="200px"></def:datafieldcontrol>
												</td>
											</tr>
											<tr>
												<td><def:datafieldcontrol id="ADOSdx" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="ADOS diagnosis:"
														FieldTextBoxTabIndex="43" DatabaseField="ADOSdx" FieldLabelWidth="200px"></def:datafieldcontrol>
												</td>
											</tr>
										</table>
									</td>
								</tr>
							</table>
							<br>
							<table id="table_entry" class="tblentry">
								<tr>
									<td width="335">
										<def:datafieldcontrol id="ADOS01" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="A1. Overall level of non-echoed lang"
											FieldTextBoxTabIndex="6" DatabaseField="ADOS01" ValidList="0,1,2,3,8,9" FieldLabelWidth="200px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
									</td>
									<td>
										<def:datafieldcontrol id="ADOS16" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="B8. Giving"
											FieldTextBoxTabIndex="21" DatabaseField="ADOS16" ValidList="0,1,2,9" FieldLabelWidth="200px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
									</td>
								</tr>
								<tr>
									<td width="335">
										<def:datafieldcontrol id="ADOS02" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="A2. Freq of vocaliz toward others"
											FieldTextBoxTabIndex="7" DatabaseField="ADOS02" ValidList="0,1,2,3,9" FieldLabelWidth="200px" FieldTextBoxWidth="40px"
											FieldLabelCssClass="boldfieldlabel"></def:datafieldcontrol>
									</td>
									<td>
										<def:datafieldcontrol id="ADOS17" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="B9. Showing"
											FieldTextBoxTabIndex="22" DatabaseField="ADOS17" ValidList="0,1,2,9" FieldLabelWidth="200px" FieldTextBoxWidth="40px"
											FieldLabelCssClass="boldfieldlabel"></def:datafieldcontrol>
									</td>
								</tr>
								<tr>
									<td width="335">
										<def:datafieldcontrol id="ADOS03" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="A3. Intonation"
											FieldTextBoxTabIndex="8" DatabaseField="ADOS03" ValidList="0,1,2,8,9" FieldLabelWidth="200px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
									</td>
									<td>
										<def:datafieldcontrol id="ADOS18" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="B10. Initiation of joint attn"
											FieldTextBoxTabIndex="23" DatabaseField="ADOS18" ValidList="0,1,2,9" FieldLabelWidth="200px" FieldTextBoxWidth="40px"
											FieldLabelCssClass="boldfieldlabel"></def:datafieldcontrol>
									</td>
								</tr>
								<tr>
									<td width="335">
										<def:datafieldcontrol id="ADOS04" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="A4. Immed. Echolalia"
											FieldTextBoxTabIndex="9" DatabaseField="ADOS04" ValidList="0,1,2,3,8,9" FieldLabelWidth="200px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
									</td>
									<td>
										<def:datafieldcontrol id="ADOS19" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="B11. Response to joint attn"
											FieldTextBoxTabIndex="24" DatabaseField="ADOS19" ValidList="0,1,2,3,9" FieldLabelWidth="200px" FieldTextBoxWidth="40px"
											FieldLabelCssClass="boldfieldlabel"></def:datafieldcontrol>
									</td>
								</tr>
								<tr>
									<td width="335">
										<def:datafieldcontrol id="ADOS05" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="A5. Stereotyped, idiosyncratic words"
											FieldTextBoxTabIndex="10" DatabaseField="ADOS05" ValidList="0,1,2,3,8,9" FieldLabelWidth="200px" FieldTextBoxWidth="40px"
											FieldLabelCssClass="boldfieldlabel"></def:datafieldcontrol>
									</td>
									<td>
										<def:datafieldcontrol id="ADOS20" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="B12. Quality of social overtures"
											FieldTextBoxTabIndex="25" DatabaseField="ADOS20" ValidList="0,1,2,3,9" FieldLabelWidth="200px" FieldTextBoxWidth="40px"
											FieldLabelCssClass="boldfieldlabel"></def:datafieldcontrol>
									</td>
								</tr>
								<tr>
									<td width="335">
										<def:datafieldcontrol id="ADOS06" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="A6. Use of others' body to communicate"
											FieldTextBoxTabIndex="11" DatabaseField="ADOS06" ValidList="0,1,2,8,9" FieldLabelWidth="200px" FieldTextBoxWidth="40px"
											FieldLabelCssClass="boldfieldlabel"></def:datafieldcontrol>
									</td>
									<td>
										<def:datafieldcontrol id="ADOS21" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="C1.  Functional play w/ obj"
											FieldTextBoxTabIndex="26" DatabaseField="ADOS21" ValidList="0,1,2,3,9" FieldLabelWidth="200px" FieldTextBoxWidth="40px"
											FieldLabelCssClass="boldfieldlabel"></def:datafieldcontrol>
									</td>
								</tr>
								<tr>
									<td width="335">
										<def:datafieldcontrol id="ADOS07" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="A7. Pointing"
											FieldTextBoxTabIndex="12" DatabaseField="ADOS07" ValidList="0,1,2,3,9" FieldLabelWidth="200px" FieldTextBoxWidth="40px"
											FieldLabelCssClass="boldfieldlabel"></def:datafieldcontrol>
									</td>
									<td>
										<def:datafieldcontrol id="ADOS22" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="C2. Imagination/Creativity"
											FieldTextBoxTabIndex="27" DatabaseField="ADOS22" ValidList="0,1,2,3,9" FieldLabelWidth="200px" FieldTextBoxWidth="40px"
											FieldLabelCssClass="boldfieldlabel"></def:datafieldcontrol>
									</td>
								</tr>
								<tr>
									<td height="28" width="335">
										<def:datafieldcontrol id="ADOS08" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="A8. Gestures"
											FieldTextBoxTabIndex="13" DatabaseField="ADOS08" ValidList="0,1,2,8,9" FieldLabelWidth="200px" FieldTextBoxWidth="40px"
											FieldLabelCssClass="boldfieldlabel"></def:datafieldcontrol>
									</td>
									<td height="28">
										<def:datafieldcontrol id="ADOS23" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="D1. Unusual sensory interest"
											FieldTextBoxTabIndex="28" DatabaseField="ADOS23" ValidList="0,1,2,9" FieldLabelWidth="200px" FieldTextBoxWidth="40px"
											FieldLabelCssClass="boldfieldlabel"></def:datafieldcontrol>
									</td>
								</tr>
								<tr>
									<td width="335">
										<def:datafieldcontrol id="ADOS09" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="B1. Unusual eye contact"
											FieldTextBoxTabIndex="14" DatabaseField="ADOS09" ValidList="0,2,9" FieldLabelWidth="200px" FieldTextBoxWidth="40px"
											FieldLabelCssClass="boldfieldlabel"></def:datafieldcontrol>
									</td>
									<td>
										<def:datafieldcontrol id="ADOS24" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="D2. Hand and finger mannerisms"
											FieldTextBoxTabIndex="29" DatabaseField="ADOS24" ValidList="0,1,2,9" FieldLabelWidth="200px" FieldTextBoxWidth="40px"
											FieldLabelCssClass="boldfieldlabel"></def:datafieldcontrol>
									</td>
								</tr>
								<tr>
									<td width="335">
										<def:datafieldcontrol id="ADOS10" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="B2. Responsive social smile"
											FieldTextBoxTabIndex="15" DatabaseField="ADOS10" ValidList="0,1,2,3,9" FieldLabelWidth="200px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
									</td>
									<td>
										<def:datafieldcontrol id="ADOS25" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="D3.  Self-Injurious behavior"
											FieldTextBoxTabIndex="30" DatabaseField="ADOS25" ValidList="0,1,2,9" FieldLabelWidth="200px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
									</td>
								</tr>
								<tr>
									<td width="335">
										<def:datafieldcontrol id="ADOS11" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="B3. Facial expressions directed to others"
											FieldTextBoxTabIndex="16" DatabaseField="ADOS11" ValidList="0,1,2,9" FieldLabelWidth="200px" FieldTextBoxWidth="40px"
											FieldLabelCssClass="boldfieldlabel"></def:datafieldcontrol>
									</td>
									<td>
										<def:datafieldcontrol id="ADOS26" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="D4. Repetitive interest/ stereotyped behav"
											FieldTextBoxTabIndex="31" DatabaseField="ADOS26" ValidList="0,1,2,3,9" FieldLabelWidth="200px" FieldTextBoxWidth="40px"
											FieldLabelCssClass="boldfieldlabel"></def:datafieldcontrol>
									</td>
								</tr>
								<tr>
									<td width="335">
										<def:datafieldcontrol id="ADOS12" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="B4. Integration of gaze during social overtures"
											FieldTextBoxTabIndex="17" DatabaseField="ADOS12" ValidList="0,1,2,3,9" FieldLabelWidth="200px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
									</td>
									<td>
										<def:datafieldcontrol id="ADOS27" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="E1. Overactivity"
											FieldTextBoxTabIndex="32" DatabaseField="ADOS27" ValidList="0,1,2,7,9" FieldLabelWidth="200px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
									</td>
								</tr>
								<tr>
									<td width="335">
										<def:datafieldcontrol id="ADOS13" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="B5. Shared enjoyment"
											FieldTextBoxTabIndex="18" DatabaseField="ADOS13" ValidList="0,1,2,9" FieldLabelWidth="200px" FieldTextBoxWidth="40px"
											FieldLabelCssClass="boldfieldlabel"></def:datafieldcontrol>
									</td>
									<td>
										<def:datafieldcontrol id="ADOS28" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="E2. Tantrums, aggress, neg beh."
											FieldTextBoxTabIndex="33" DatabaseField="ADOS28" ValidList="0,1,2,9" FieldLabelWidth="200px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
									</td>
								</tr>
								<tr>
									<td width="335">
										<def:datafieldcontrol id="ADOS14" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="B6. Response to name"
											FieldTextBoxTabIndex="19" DatabaseField="ADOS14" ValidList="0,1,2,3,9" FieldLabelWidth="200px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
									</td>
									<td>
										<def:datafieldcontrol id="ADOS29" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="E3.  Anxiety"
											FieldTextBoxTabIndex="34" DatabaseField="ADOS29" ValidList="0,1,2,9" FieldLabelWidth="200px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
									</td>
								</tr>
								<tr>
									<td width="335">
										<def:datafieldcontrol id="ADOS15" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="B7. Requesting"
											FieldTextBoxTabIndex="20" DatabaseField="ADOS15" ValidList="0,1,2,3,9" FieldLabelWidth="200px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
									</td>
									<td>
									</td>
								</tr>
							</table>
							<br>
							<br>
							<table id="table_readonly" class="tblreadonly">
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
								<tr>
									<td><def:datafieldcontrol id="adoswps_pk" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="adoswps_pk"
											FieldTextBoxTabIndex="53" DatabaseField="adoswps_pk"></def:datafieldcontrol>
									</td>
								</tr>
								<tr>
									<td><def:datafieldcontrol id="ADOSmod" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="ADOSmod"
											FieldTextBoxTabIndex="54" DatabaseField="ADOSmod"></def:datafieldcontrol>
									</td>
								</tr>
							</table>
						</div>
					</asp:Content>
