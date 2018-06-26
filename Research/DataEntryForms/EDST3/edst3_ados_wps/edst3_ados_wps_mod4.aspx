<%@ Page language="c#" Inherits="edst3_ados_wps.edst3_ados_wps_mod4" CodeFile="edst3_ados_wps_mod4.aspx.cs"  MasterPageFile="~/UWAC.master" %>
<%@ Register TagPrefix="def" Namespace="DataEntryFramework.Old" %>

<asp:Content ID="Content1" ContentPlaceHolderID="oBodyPlaceHolder" runat="server">
						<A href="edst3_ados_wps_lookup.aspx">Back to Main ADOS page (Click here to enter 
							other ADOS modules.)</A>
						<def:dataentrycontroller id="DataEntryController1" runat="server" ShowScoreButton="True" VerifiedField="verified"
							PrimaryKeyField="adoswps_pk" MeasureName="EDST3 ADOS WPS Module 4" LookupTextBox1LabelText="EDS ID:"
							LookupTextBox2Visible="False" LookupField1="edsid" DatabaseTable="edst3_ados_wps" StudyMeasID="192" ondoscore="DataEntryController1_DoScore"></def:dataentrycontroller><br>
						<div class="divDataEntryFields">
							<table>
								<tr>
									<td>
										<table class="tblinsert" id="table_insert">
											<tr>
												<td><def:datafieldcontrol id="edsid" runat="server" DatabaseField="edsid" FieldTextBoxTabIndex="2" FieldLabelText="edsid"
														IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="True"
														IsInsertField="True" FieldDataType="INT" FieldLabelWidth="100px"></def:datafieldcontrol></td>
											</tr>
											<tr>
												<td><def:datafieldcontrol id="ADOSdate" runat="server" DatabaseField="ADOSdate" FieldTextBoxTabIndex="3" FieldLabelText="ADOSdate"
														IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="True"
														IsInsertField="True" FieldDataType="DATE" FormatString="{0:d}" FieldLabelWidth="100px"></def:datafieldcontrol></td>
											</tr>
											<tr>
												<td><def:datafieldcontrol id="ADOSclin" runat="server" DatabaseField="ADOSclin" FieldTextBoxTabIndex="4" FieldLabelText="ADOSclin"
														IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="True"
														IsInsertField="True" FieldDataType="TEXT" FieldLabelWidth="100px"></def:datafieldcontrol></td>
											</tr>
										</table>
									</td>
									<td>
										<table class="tblreadonly" id="table_readonly">
											<tr>
												<td><def:datafieldcontrol id="ADOScom" runat="server" DatabaseField="ADOScom" FieldTextBoxTabIndex="38" FieldLabelText="Communication Total:"
														IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="INT" FieldLabelWidth="200px"></def:datafieldcontrol></td>
											</tr>
											<tr>
												<td><def:datafieldcontrol id="ADOSsoc" runat="server" DatabaseField="ADOSsoc" FieldTextBoxTabIndex="39" FieldLabelText="Social Impairments Total:"
														IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="INT" FieldLabelWidth="200px"></def:datafieldcontrol></td>
											</tr>
											<tr>
												<td><def:datafieldcontrol id="ADOStot" runat="server" DatabaseField="ADOStot" FieldTextBoxTabIndex="40" FieldLabelText="Comm. + Social:"
														IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="INT" FieldLabelWidth="200px"></def:datafieldcontrol></td>
											</tr>
											<tr>
												<td><def:datafieldcontrol id="ADOSCtot" runat="server" DatabaseField="ADOSCtot" FieldTextBoxTabIndex="41"
														FieldLabelText="Play:" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False"
														IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" FieldLabelWidth="200px"></def:datafieldcontrol></td>
											</tr>
											<tr>
												<td><def:datafieldcontrol id="ADOSDtot" runat="server" DatabaseField="ADOSDtot" FieldTextBoxTabIndex="42"
														FieldLabelText="Stereotyped Behav. Restricted Interests:" IsDoubleEntryField="False" IsReadOnly="True"
														IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False"
														FieldDataType="INT" FieldLabelWidth="200px"></def:datafieldcontrol></td>
											</tr>
											<tr>
												<td><def:datafieldcontrol id="ADOSdx" runat="server" DatabaseField="ADOSdx" FieldTextBoxTabIndex="43" FieldLabelText="ADOS diagnosis:"
														IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="TEXT" FieldLabelWidth="200px"></def:datafieldcontrol></td>
											</tr>
										</table>
									</td>
								</tr>
							</table>
							<br>
							<table class="tblentry" id="table_entry">
								<tr>
									<td width="342"><def:datafieldcontrol id="ADOS01" runat="server" DatabaseField="ADOS01" FieldTextBoxTabIndex="6" FieldLabelText="A1. Overall level of non-achoed lang"
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,3,9" FieldLabelWidth="200px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
									<td><def:datafieldcontrol id="ADOS16" runat="server" DatabaseField="ADOS16" FieldTextBoxTabIndex="21" FieldLabelText="B6. Empathy"
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,3,9" FieldLabelWidth="200px" FieldTextBoxWidth="40px"
											FieldLabelCssClass="boldfieldlabel"></def:datafieldcontrol></td>
								</tr>
								<tr>
									<td width="342"><def:datafieldcontrol id="ADOS02" runat="server" DatabaseField="ADOS02" FieldTextBoxTabIndex="7" FieldLabelText="A2. Speech abnormalities"
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,7,8,9" FieldLabelWidth="200px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
									<td><def:datafieldcontrol id="ADOS17" runat="server" DatabaseField="ADOS17" FieldTextBoxTabIndex="22" FieldLabelText="B7. Insight"
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,3,9" FieldLabelWidth="200px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
								</tr>
								<tr>
									<td width="342"><def:datafieldcontrol id="ADOS03" runat="server" DatabaseField="ADOS03" FieldTextBoxTabIndex="8" FieldLabelText="A3. Echolalia"
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,3,9" FieldLabelWidth="200px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
									<td><def:datafieldcontrol id="ADOS18" runat="server" DatabaseField="ADOS18" FieldTextBoxTabIndex="23" FieldLabelText="B8. Responsibility"
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9" FieldLabelWidth="200px" FieldTextBoxWidth="40px"
											FieldLabelCssClass="boldfieldlabel"></def:datafieldcontrol></td>
								</tr>
								<tr>
									<td width="342"><def:datafieldcontrol id="ADOS04" runat="server" DatabaseField="ADOS04" FieldTextBoxTabIndex="9" FieldLabelText="A4. Stereotyped, idiosyncratic words"
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,3,9" FieldLabelWidth="200px" FieldTextBoxWidth="40px"
											FieldLabelCssClass="boldfieldlabel"></def:datafieldcontrol></td>
									<td><def:datafieldcontrol id="ADOS19" runat="server" DatabaseField="ADOS19" FieldTextBoxTabIndex="24" FieldLabelText="B9. Quality of social overtures"
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,3,9" FieldLabelWidth="200px" FieldTextBoxWidth="40px"
											FieldLabelCssClass="boldfieldlabel"></def:datafieldcontrol></td>
								</tr>
								<tr>
									<td width="342"><def:datafieldcontrol id="ADOS05" runat="server" DatabaseField="ADOS05" FieldTextBoxTabIndex="10" FieldLabelText="A5. Offers information"
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9" FieldLabelWidth="200px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
									<td><def:datafieldcontrol id="ADOS20" runat="server" DatabaseField="ADOS20" FieldTextBoxTabIndex="25" FieldLabelText="B10.  Quality of social response"
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,3,9" FieldLabelWidth="200px" FieldTextBoxWidth="40px"
											FieldLabelCssClass="boldfieldlabel"></def:datafieldcontrol></td>
								</tr>
								<tr>
									<td width="342"><def:datafieldcontrol id="ADOS06" runat="server" DatabaseField="ADOS06" FieldTextBoxTabIndex="11" FieldLabelText="A6. Asks for information"
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,3,9" FieldLabelWidth="200px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
									<td><def:datafieldcontrol id="ADOS21" runat="server" DatabaseField="ADOS21" FieldTextBoxTabIndex="26" FieldLabelText="B11. Amt of reciprocal social communication"
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,3,9" FieldLabelWidth="200px" FieldTextBoxWidth="40px"
											FieldLabelCssClass="boldfieldlabel"></def:datafieldcontrol></td>
								</tr>
								<tr>
									<td width="342"><def:datafieldcontrol id="ADOS07" runat="server" DatabaseField="ADOS07" FieldTextBoxTabIndex="12" FieldLabelText="A7. Reporting events out of context"
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,3,9" FieldLabelWidth="200px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
									<td><def:datafieldcontrol id="ADOS22" runat="server" DatabaseField="ADOS22" FieldTextBoxTabIndex="27" FieldLabelText="B12. Overall quality of rapport"
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,3,9" FieldLabelWidth="200px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
								</tr>
								<tr>
									<td width="342"><def:datafieldcontrol id="ADOS08" runat="server" DatabaseField="ADOS08" FieldTextBoxTabIndex="13" FieldLabelText="A8. Conversation"
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,3,9" FieldLabelWidth="200px" FieldTextBoxWidth="40px"
											FieldLabelCssClass="boldfieldlabel"></def:datafieldcontrol></td>
									<td><def:datafieldcontrol id="ADOS23" runat="server" DatabaseField="ADOS23" FieldTextBoxTabIndex="28" FieldLabelText="C1. Imagination/creativity"
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,3,9" FieldLabelWidth="200px" FieldTextBoxWidth="40px"
											FieldLabelCssClass="boldfieldlabel"></def:datafieldcontrol></td>
								</tr>
								<tr>
									<td width="342"><def:datafieldcontrol id="ADOS09" runat="server" DatabaseField="ADOS09" FieldTextBoxTabIndex="14" FieldLabelText="A9. Descriptive gestures"
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,3,8" FieldLabelWidth="200px" FieldTextBoxWidth="40px"
											FieldLabelCssClass="boldfieldlabel"></def:datafieldcontrol></td>
									<td><def:datafieldcontrol id="ADOS24" runat="server" DatabaseField="ADOS24" FieldTextBoxTabIndex="29" FieldLabelText="D1. Unusual sensory interest"
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9" FieldLabelWidth="200px" FieldTextBoxWidth="40px"
											FieldLabelCssClass="boldfieldlabel"></def:datafieldcontrol></td>
								</tr>
								<tr>
									<td width="342"><def:datafieldcontrol id="ADOS10" runat="server" DatabaseField="ADOS10" FieldTextBoxTabIndex="15" FieldLabelText="A10. Emphatic, emotional gestures"
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,3,8" FieldLabelWidth="200px" FieldTextBoxWidth="40px"
											FieldLabelCssClass="boldfieldlabel"></def:datafieldcontrol></td>
									<td><def:datafieldcontrol id="ADOS25" runat="server" DatabaseField="ADOS25" FieldTextBoxTabIndex="30" FieldLabelText="D2. Hand and finger mannerisms"
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9" FieldLabelWidth="200px" FieldTextBoxWidth="40px"
											FieldLabelCssClass="boldfieldlabel"></def:datafieldcontrol></td>
								</tr>
								<tr>
									<td width="342"><def:datafieldcontrol id="ADOS11" runat="server" DatabaseField="ADOS11" FieldTextBoxTabIndex="16" FieldLabelText="B1. Unusual eye contact"
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="0,2,9" FieldLabelWidth="200px" FieldTextBoxWidth="40px" FieldLabelCssClass="boldfieldlabel"></def:datafieldcontrol></td>
									<td><def:datafieldcontrol id="ADOS26" runat="server" DatabaseField="ADOS26" FieldTextBoxTabIndex="31" FieldLabelText="D3. Self-Injurious behavior"
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9" FieldLabelWidth="200px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
								</tr>
								<tr>
									<td width="342"><def:datafieldcontrol id="ADOS12" runat="server" DatabaseField="ADOS12" FieldTextBoxTabIndex="17" FieldLabelText="B2. Facial expressions directed to others"
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9" FieldLabelWidth="200px" FieldTextBoxWidth="40px"
											FieldLabelCssClass="boldfieldlabel"></def:datafieldcontrol></td>
									<td><def:datafieldcontrol id="ADOS27" runat="server" DatabaseField="ADOS27" FieldTextBoxTabIndex="32" FieldLabelText="D4. Excessive interest to unusual/specific topics"
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,3,9" FieldLabelWidth="200px" FieldTextBoxWidth="40px"
											FieldLabelCssClass="boldfieldlabel"></def:datafieldcontrol></td>
								</tr>
								<tr>
									<td width="342"><def:datafieldcontrol id="ADOS13" runat="server" DatabaseField="ADOS13" FieldTextBoxTabIndex="18" FieldLabelText="B3. Lang production and linked nonverbal behav"
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,7,8,9" FieldLabelWidth="200px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
									<td><def:datafieldcontrol id="ADOS28" runat="server" DatabaseField="ADOS28" FieldTextBoxTabIndex="33" FieldLabelText="D5. Compulsions or rituals"
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9" FieldLabelWidth="200px" FieldTextBoxWidth="40px"
											FieldLabelCssClass="boldfieldlabel"></def:datafieldcontrol></td>
								</tr>
								<tr>
									<td width="342"><def:datafieldcontrol id="ADOS14" runat="server" DatabaseField="ADOS14" FieldTextBoxTabIndex="19" FieldLabelText="B4. Shared enjoyment"
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,8,9" FieldLabelWidth="200px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
									<td><def:datafieldcontrol id="ADOS29" runat="server" DatabaseField="ADOS29" FieldTextBoxTabIndex="34" FieldLabelText="E1. Overactivity"
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,7,9" FieldLabelWidth="200px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
								</tr>
								<tr>
									<td width="342"><def:datafieldcontrol id="ADOS15" runat="server" DatabaseField="ADOS15" FieldTextBoxTabIndex="20" FieldLabelText="B5. Communication of own affect"
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,3,9" FieldLabelWidth="200px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
									<td><def:datafieldcontrol id="ADOS30" runat="server" DatabaseField="ADOS30" FieldTextBoxTabIndex="35" FieldLabelText="E2. Tantrums, aggress, neg beh."
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9" FieldLabelWidth="200px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
								</tr>
								<tr>
									<td width="342"></td>
									<td><def:datafieldcontrol id="ADOS31" runat="server" DatabaseField="ADOS31" FieldTextBoxTabIndex="36" FieldLabelText="E3.  Anxiety"
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9" FieldLabelWidth="200px" FieldTextBoxWidth="40px"></def:datafieldcontrol></td>
								</tr>
							</table>
							<br>
							<br>
							<table>
								<tr>
									<td><def:datafieldcontrol id="created" runat="server" DatabaseField="created" FieldTextBoxTabIndex="49" FieldLabelText="created"
											IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="DATE"></def:datafieldcontrol></td>
								</tr>
								<tr>
									<td><def:datafieldcontrol id="createdBy" runat="server" DatabaseField="createdBy" FieldTextBoxTabIndex="50"
											FieldLabelText="createdBy" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT"></def:datafieldcontrol></td>
								</tr>
								<tr>
									<td><def:datafieldcontrol id="updated" runat="server" DatabaseField="updated" FieldTextBoxTabIndex="51" FieldLabelText="updated"
											IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="DATE"></def:datafieldcontrol></td>
								</tr>
								<tr>
									<td><def:datafieldcontrol id="updatedBy" runat="server" DatabaseField="updatedBy" FieldTextBoxTabIndex="52"
											FieldLabelText="updatedBy" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT"></def:datafieldcontrol></td>
								</tr>
								<tr>
									<td><def:datafieldcontrol id="adoswps_pk" runat="server" DatabaseField="adoswps_pk" FieldTextBoxTabIndex="53"
											FieldLabelText="adoswps_pk" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT"></def:datafieldcontrol></td>
								</tr>
								<tr>
									<td><def:datafieldcontrol id="ADOSmod" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="ADOSmod"
											FieldTextBoxTabIndex="54" DatabaseField="ADOSmod"></def:datafieldcontrol></td>
								</tr>
							</table>
						</div>
					</asp:Content>
