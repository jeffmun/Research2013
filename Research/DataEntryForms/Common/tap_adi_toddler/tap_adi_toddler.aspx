<%@ Page language="c#" Inherits="GenericDataEntryForms.tap_adi_toddler.tap_adi_toddler" CodeFile="tap_adi_toddler.aspx.cs"  MasterPageFile="~/UWAC.master" %>
<%@ Register TagPrefix="def" Namespace="DataEntryFramework" %>

<asp:Content ID="Content1" ContentPlaceHolderID="oBodyPlaceHolder" runat="server">
						<def:dataentrycontroller id="DataEntryController1" runat="server" LookupField1DataType="TEXT" ShowScoreButton="True"
							VerifiedField="verified" PrimaryKeyField="adi_toddler_pk" MeasureName="Toddler ADI" LookupTextBox1LabelText="Subject ID:"
							LookupTextBox2Visible="False" LookupField1="id" DatabaseTable="ALL_tap_adi_toddler" 
							AllowedStudyMeasures="432,522,952,1503,1796,1807,1879,1880,2328"
							LastScoredDateField="scored" LastUpdatedDateField="updated" ondoscore="DataEntryController1_DoScore"></def:dataentrycontroller>
						<asp:HyperLink id="hlnkReport" runat="server" Target="_blank">Click to View Scoring Summary (opens in new window)</asp:HyperLink><br>
						<br>
						<table class="layout" id="table_insert">
							<tr>
						        <!-- RegEx="^[T][A][P][0-9][0-9][0-9]$" RegExDescription="TAP ID must  look like TAP###" -->
								<td><def:datafieldcontrol id="id" runat="server" 
										DatabaseField="id" FieldTextBoxTabIndex="5" FieldLabelText="Subject ID" IsDoubleEntryField="False"
										IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="True" IsInsertField="True"
										FieldDataType="TEXT" FieldTextBoxWidth="50px" FieldLabelWidth="200px"></def:datafieldcontrol></td>
							</tr>
							<tr>
								<td><def:datafieldcontrol id="Adinf" runat="server" DatabaseField="Adinf" FieldTextBoxTabIndex="7" FieldLabelText="Informant  (0=mom, 1=dad, 2=other caregiver, 3=combination, 4=sibling, 5=other) "
										IsDoubleEntryField="False" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="True"
										IsInsertField="True" FieldDataType="INT" FieldTextBoxWidth="50px" ValidList="0,1,2,3,4,5,9" FieldLabelWidth="200px"></def:datafieldcontrol></td>
							</tr>
							<tr>
								<td><def:datafieldcontrol id="Addate" runat="server" DatabaseField="Addate" FieldTextBoxTabIndex="8" FieldLabelText="Date of interview (mm/dd/yy)"
										IsDoubleEntryField="False" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="True"
										IsInsertField="True" FieldDataType="DATE" FieldTextBoxWidth="100px" FormatString="{0:d}" FieldLabelWidth="200px"></def:datafieldcontrol></td>
							</tr>
							<tr>
								<td><def:datafieldcontrol id="Adint" runat="server" DatabaseField="Adint" FieldTextBoxTabIndex="17" FieldLabelText="Interviewer initials"
										IsDoubleEntryField="False" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="True"
										IsInsertField="True" FieldDataType="TEXT" FieldTextBoxWidth="50px" FieldLabelWidth="200px"></def:datafieldcontrol></td>
							</tr>
							<tr>
								<td>
									<def:datafieldcontrol id="reliabilityDateDone" runat="server" FieldLabelWidth="150px" FieldTextBoxWidth="80px"
										FieldDataType="DATE" IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False"
										IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="Reliability Date (Leave blank if not entering a reliability)"
										FieldTextBoxTabIndex="17" DatabaseField="reliabilityDateDone" FormatString="{0:d}"></def:datafieldcontrol></td>
							</tr>
						</table>
						<br>
						<asp:panel id="mainPanel" runat="server">
							<TABLE>
								<TR>
									<TD style="vertical-align:top" style="width: 465px">
										<TABLE class="layout" id="table_entry">
											<TR>
												<TD>
													<def:datafieldcontrol id="AD002" runat="server" FieldTextBoxWidth="50px" FieldDataType="INT" IsInsertField="False"
														IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
														FieldLabelText="2. Age when parents first noticed that something was not quite right (months)" FieldTextBoxTabIndex="19"
														DatabaseField="AD002" RegExDescription="Must be between 0-48 or 991,992,996,997,998,999" RegEx="^([0-9]|[1-3][0-9]|4[0-8]|991|992|996|997|998|999)$"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD height="29">
													<def:datafieldcontrol id="AD003a" runat="server" FieldTextBoxWidth="50px" FieldDataType="INT" IsInsertField="False"
														IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
														FieldLabelText="3A." FieldTextBoxTabIndex="21" DatabaseField="AD003a" ValidList="0,1,2,3,4,5,6,7,8,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD003b" runat="server" FieldTextBoxWidth="50px" FieldDataType="INT" IsInsertField="False"
														IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
														FieldLabelText="3B." FieldTextBoxTabIndex="22" DatabaseField="AD003b" ValidList="0,1,2,3,4,5,6,7,8,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD003c" runat="server" FieldTextBoxWidth="50px" FieldDataType="INT" IsInsertField="False"
														IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
														FieldLabelText="3C." FieldTextBoxTabIndex="23" DatabaseField="AD003c" ValidList="0,1,2,3,4,5,6,7,8,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD003d" runat="server" FieldTextBoxWidth="50px" FieldDataType="INT" IsInsertField="False"
														IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
														FieldLabelText="3D." FieldTextBoxTabIndex="24" DatabaseField="AD003d" ValidList="0,1,2,3,4,5,6,7,8,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD004" runat="server" FieldTextBoxWidth="50px" FieldDataType="INT" IsInsertField="False"
														IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
														FieldLabelText="4. Age (in months) when parents first noticed social or communication difficulties"
														FieldTextBoxTabIndex="25" DatabaseField="AD004" RegExDescription="Must be between 0-48 or 991,992,996,997,998,999"
														RegEx="^([0-9]|[1-3][0-9]|4[0-8]|991|992|996|997|998|999)$"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD005" runat="server" FieldTextBoxWidth="50px" FieldDataType="INT" IsInsertField="False"
														IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
														FieldLabelText="5.&#9;Onset as perceived in hindsight" FieldTextBoxTabIndex="26" DatabaseField="AD005"
														ValidList="0,1,2,3,4,5,7,8,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD006" runat="server" FieldTextBoxWidth="50px" FieldDataType="INT" IsInsertField="False"
														IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
														FieldLabelText="6. First sat unaided on flat surface (months)" FieldTextBoxTabIndex="27" DatabaseField="AD006"
														RegExDescription="Must be between 0-48 or 995,996,997,998,999" RegEx="^([0-9]|[1-3][0-9]|4[0-8]|995|996|997|998|999)$"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD007" runat="server" FieldTextBoxWidth="50px" FieldDataType="INT" IsInsertField="False"
														IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
														FieldLabelText="7. First walked unaided (months)" FieldTextBoxTabIndex="28" DatabaseField="AD007"
														RegExDescription="Must be between 0-48 or 995,996,997,998,999" RegEx="^([0-9]|[1-3][0-9]|4[0-8]|995|996|997|998|999)$"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD008" runat="server" FieldTextBoxWidth="50px" FieldDataType="INT" IsInsertField="False"
														IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
														FieldLabelText="8. Acquisition of bladder control: daytime" FieldTextBoxTabIndex="29" DatabaseField="AD008"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD009" runat="server" FieldTextBoxWidth="50px" FieldDataType="INT" IsInsertField="False"
														IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
														FieldLabelText="9. Acquisition of bladder control: nighttime (months)" FieldTextBoxTabIndex="30" DatabaseField="AD009"
														RegExDescription="Must be between 0-48 or 993,994,995,996,997,998,999" RegEx="^([0-9]|[1-3][0-9]|4[0-8]|993|994|995|996|997|998|999)$"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD010" runat="server" FieldTextBoxWidth="50px" FieldDataType="INT" IsInsertField="False"
														IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
														FieldLabelText="10. Acquisition of bowel control (months)" FieldTextBoxTabIndex="31" DatabaseField="AD010"
														RegExDescription="Must be between 0-48 or 993,994,995,996,997,998,999" RegEx="^([0-9]|[1-3][0-9]|4[0-8]|993|994|995|996|997|998|999)$"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD011cu" runat="server" FieldTextBoxWidth="50px" FieldDataType="INT" IsInsertField="False"
														IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
														FieldLabelText="11. Usual mode of communication" FieldTextBoxTabIndex="32" DatabaseField="AD011cu"
														ValidList="0,1,2,3,4,7,8,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD012CU" runat="server" FieldTextBoxWidth="50px" FieldDataType="INT" IsInsertField="False"
														IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
														FieldLabelText="12. Use of other’s body to communicate (CURRENT)" FieldTextBoxTabIndex="34" DatabaseField="AD012CU"
														ValidList="0,1,2,3,8,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD012EV" runat="server" FieldTextBoxWidth="50px" FieldDataType="INT" IsInsertField="False"
														IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
														FieldLabelText="12. Use of other’s body to communicate (EVER)" FieldTextBoxTabIndex="35" DatabaseField="AD012EV"
														ValidList="0,1,2,3,8,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD013CU" runat="server" FieldTextBoxWidth="50px" FieldDataType="INT" IsInsertField="False"
														IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
														FieldLabelText="13.&#9;Social Chat/Vocalization" FieldTextBoxTabIndex="36" DatabaseField="AD013CU"
														ValidList="0,1,2,3,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD014CU" runat="server" FieldTextBoxWidth="50px" FieldDataType="INT" IsInsertField="False"
														IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
														FieldLabelText="14. Form of Current Non-Speech Vocalization " FieldTextBoxTabIndex="37" DatabaseField="AD014CU"
														ValidList="0,1,2,3,8,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD015" runat="server" FieldTextBoxWidth="50px" FieldDataType="INT" IsInsertField="False"
														IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
														FieldLabelText="15. &#9;Babbling as an Infant" FieldTextBoxTabIndex="38" DatabaseField="AD015" ValidList="0,1,2,3,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD016" runat="server" FieldTextBoxWidth="50px" FieldDataType="INT" IsInsertField="False"
														IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
														FieldLabelText="16. Age of first single words (months)" FieldTextBoxTabIndex="39" DatabaseField="AD016"
														RegExDescription="Must be between 0-48 or 994,996,997,998,999" RegEx="^([0-9]|[1-3][0-9]|4[0-8]|994|996|997|998|999)$"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD017" runat="server" FieldTextBoxWidth="50px" FieldDataType="INT" IsInsertField="False"
														IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
														FieldLabelText="17. Current number of words (in the last week)" FieldTextBoxTabIndex="40" DatabaseField="AD017"
														MaxVal="100"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD018cu" runat="server" FieldTextBoxWidth="50px" FieldDataType="INT" IsInsertField="False"
														IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
														FieldLabelText="18. Utterance length for non-echoed speech" FieldTextBoxTabIndex="41" DatabaseField="AD018cu"
														ValidList="0,1,8,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD019CU" runat="server" FieldTextBoxWidth="50px" FieldDataType="INT" IsInsertField="False"
														IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
														FieldLabelText="19.  Complexity of non-echoed utterances" FieldTextBoxTabIndex="42" DatabaseField="AD019CU"
														ValidList="0,1,2,8,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD020" runat="server" FieldTextBoxWidth="50px" FieldDataType="INT" IsInsertField="False"
														IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
														FieldLabelText="20.  Age of first phrases (if ever used)" FieldTextBoxTabIndex="43" DatabaseField="AD020"
														RegExDescription="Must be between 0-48 or 994,996,997,999" RegEx="^([0-9]|[1-3][0-9]|4[0-8]|994|996|997|999)$"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD021CU" runat="server" FieldTextBoxWidth="50px" FieldDataType="INT" IsInsertField="False"
														IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
														FieldLabelText="21.  Overall level of language" FieldTextBoxTabIndex="44" DatabaseField="AD021CU"
														ValidList="0,1,2,9" CallOnBlur="tap_adi_toddler_onBlur"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD022cu" runat="server" FieldTextBoxWidth="50px" FieldDataType="INT" IsInsertField="False"
														IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
														FieldLabelText="22. Current communicative speech" FieldTextBoxTabIndex="45" DatabaseField="AD022cu"
														ValidList="0,1,2,3,8,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD023cu" runat="server" FieldTextBoxWidth="50px" FieldDataType="INT" IsInsertField="False"
														IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
														FieldLabelText="23.  Comprehension of simple language " FieldTextBoxTabIndex="47" DatabaseField="AD023cu"
														ValidList="0,1,2,3,4,8,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD024ev" runat="server" FieldTextBoxWidth="50px" FieldDataType="INT" IsInsertField="False"
														IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
														FieldLabelText="24.&#9;Loss of language skills&#9;" FieldTextBoxTabIndex="48" DatabaseField="AD024ev"
														ValidList="0,1,2,8,9" CallOnBlur="tap_adi_toddler_onBlur"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD025ev" runat="server" FieldTextBoxWidth="50px" FieldDataType="INT" IsInsertField="False"
														IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
														FieldLabelText="25.&#9;Level of communicative language before loss" FieldTextBoxTabIndex="49" DatabaseField="AD025ev"
														ValidList="0,1,2,3,8,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD026" runat="server" FieldTextBoxWidth="50px" FieldDataType="INT" IsInsertField="False"
														IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
														FieldLabelText="26.&#9;Loss of cooing " FieldTextBoxTabIndex="51" DatabaseField="AD026" ValidList="0,1,2,8,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD027" runat="server" FieldTextBoxWidth="50px" FieldDataType="INT" IsInsertField="False"
														IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
														FieldLabelText="27.&#9;Loss of vocalizations" FieldTextBoxTabIndex="52" DatabaseField="AD027" ValidList="0,1,2,8,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD028" runat="server" FieldTextBoxWidth="50px" FieldDataType="INT" IsInsertField="False"
														IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
														FieldLabelText="28.&#9;Loss of speech-like babbling" FieldTextBoxTabIndex="53" DatabaseField="AD028"
														ValidList="0,1,2,8,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD029" runat="server" FieldTextBoxWidth="50px" FieldDataType="INT" IsInsertField="False"
														IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
														FieldLabelText="29.&#9;Loss of vocal imitation" FieldTextBoxTabIndex="54" DatabaseField="AD029" ValidList="0,1,2,8,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD030" runat="server" FieldTextBoxWidth="50px" FieldDataType="INT" IsInsertField="False"
														IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
														FieldLabelText="30.&#9;Loss of spontaneous use of at least 3 meaningful words" FieldTextBoxTabIndex="55"
														DatabaseField="AD030" ValidList="0,1,2,8,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD031" runat="server" FieldTextBoxWidth="50px" FieldDataType="INT" IsInsertField="False"
														IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
														FieldLabelText="31.&#9;Loss of communicative intent" FieldTextBoxTabIndex="56" DatabaseField="AD031"
														ValidList="0,1,2,8,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD032" runat="server" FieldTextBoxWidth="50px" FieldDataType="INT" IsInsertField="False"
														IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
														FieldLabelText="32.&#9;Loss of syntactical skills (grammar)" FieldTextBoxTabIndex="57" DatabaseField="AD032"
														ValidList="0,1,2,8,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD033" runat="server" FieldTextBoxWidth="50px" FieldDataType="INT" IsInsertField="False"
														IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
														FieldLabelText="33.&#9;Loss of articulation (pronunciation)" FieldTextBoxTabIndex="58" DatabaseField="AD033"
														ValidList="0,1,2,8,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD034" runat="server" FieldTextBoxWidth="50px" FieldDataType="INT" IsInsertField="False"
														IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
														FieldLabelText="34. Age when main loss of language skills first apparent (months)" FieldTextBoxTabIndex="60"
														DatabaseField="AD034" RegExDescription="Must be between 0-48 or 998,999" RegEx="^([0-9]|[1-3][0-9]|4[0-8]|998|999)$"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD035EV" runat="server" FieldTextBoxWidth="50px" FieldDataType="INT" IsInsertField="False"
														IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
														FieldLabelText="35.   Association of loss of language with physical illness" FieldTextBoxTabIndex="61"
														DatabaseField="AD035EV" ValidList="0,1,2,8,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD036EV" runat="server" FieldTextBoxWidth="50px" FieldDataType="INT" IsInsertField="False"
														IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
														FieldLabelText="36. Gradual or sudden loss" FieldTextBoxTabIndex="62" DatabaseField="AD036EV" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD037" runat="server" FieldTextBoxWidth="50px" FieldDataType="INT" IsInsertField="False"
														IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
														FieldLabelText="37.  Age when language skills began to come back (months)" FieldTextBoxTabIndex="63"
														DatabaseField="AD037" RegExDescription="Must be between 0-48 or 993,994,998,999" RegEx="^([0-9]|[1-3][0-9]|4[0-8]|993|994|998|999)$"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD038" runat="server" FieldTextBoxWidth="50px" FieldDataType="INT" IsInsertField="False"
														IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
														FieldLabelText="38.&#9;  Regain of same level before loss" FieldTextBoxTabIndex="64" DatabaseField="AD038"
														ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD039EV" runat="server" FieldTextBoxWidth="50px" FieldDataType="INT" IsInsertField="False"
														IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
														FieldLabelText="39.&#9;Loss of skills (skill must be lost for at least 1 month)" FieldTextBoxTabIndex="65"
														DatabaseField="AD039EV" ValidList="0,1,2,8,9" CallOnBlur="tap_adi_toddler_onBlur"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD040EV" runat="server" FieldTextBoxWidth="50px" FieldDataType="INT" IsInsertField="False"
														IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
														FieldLabelText="40.&#9;Purposive hand movements " FieldTextBoxTabIndex="66" DatabaseField="AD040EV"
														ValidList="0,1,2,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD041EV" runat="server" FieldTextBoxWidth="50px" FieldDataType="INT" IsInsertField="False"
														IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
														FieldLabelText="41.&#9;Motor skills (Posture, gait, coordination)" FieldTextBoxTabIndex="67" DatabaseField="AD041EV"
														ValidList="0,1,2,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD042EV" runat="server" FieldTextBoxWidth="50px" FieldDataType="INT" IsInsertField="False"
														IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
														FieldLabelText="42.&#9;Self-help skills" FieldTextBoxTabIndex="68" DatabaseField="AD042EV" ValidList="0,1,2,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD043EV" runat="server" FieldTextBoxWidth="50px" FieldDataType="INT" IsInsertField="False"
														IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
														FieldLabelText="43.&#9;Constructive or imaginative play" FieldTextBoxTabIndex="69" DatabaseField="AD043EV"
														ValidList="0,1,2,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD044EV" runat="server" FieldTextBoxWidth="50px" FieldDataType="INT" IsInsertField="False"
														IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
														FieldLabelText="44. Social engagement and responsiveness " FieldTextBoxTabIndex="70" DatabaseField="AD044EV"
														ValidList="0,1,2,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD045EV" runat="server" FieldTextBoxWidth="50px" FieldDataType="INT" IsInsertField="False"
														IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
														FieldLabelText="45.&#9;Curiosity or alertness " FieldTextBoxTabIndex="70" DatabaseField="AD045EV"
														ValidList="0,1,2,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD046mo" runat="server" FieldTextBoxWidth="50px" FieldDataType="INT" IsInsertField="False"
														IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
														FieldLabelText="46. Age when main loss of skill first apparent (months)" FieldTextBoxTabIndex="72"
														DatabaseField="AD046mo" RegExDescription="Must be between 0-48 or 998,999" RegEx="^([0-9]|[1-3][0-9]|4[0-8]|998|999)$"></def:datafieldcontrol></TD>
											</TR>
										</TABLE>
										<P>
											<TABLE class="grid">
												<TR>
													<TD class="heading" width="150">47. Skill</TD>
													<TD class="heading" width="100">Had skill before 24 months</TD>
													<TD class="heading" width="100">Stopped using the skill for a month or more before 36 months</TD>
													<TD class="heading">Can do now</TD>
													<TD class="heading">Never had</TD>
												</TR>
												<TR>
													<TD class="heading" width="150">Respond to name</TD>
													<TD width="100">
														<def:datafieldcontrol id="AD047_1A" runat="server" FieldTextBoxWidth="50px" FieldDataType="INT" IsInsertField="False"
															IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
															FieldLabelText="AD047_1A" FieldTextBoxTabIndex="73" DatabaseField="AD047_1A" ValidList="0,1,8,9" ShowFieldLabel="False"></def:datafieldcontrol></TD>
													<TD width="100">
														<def:datafieldcontrol id="AD047_2A" runat="server" FieldTextBoxWidth="50px" FieldDataType="INT" IsInsertField="False"
															IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
															FieldLabelText="AD047_2A" FieldTextBoxTabIndex="85" DatabaseField="AD047_2A" ValidList="0,1,8,9" ShowFieldLabel="False"></def:datafieldcontrol></TD>
													<TD>
														<def:datafieldcontrol id="AD047_3A" runat="server" FieldTextBoxWidth="50px" FieldDataType="INT" IsInsertField="False"
															IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
															FieldLabelText="AD047_3A" FieldTextBoxTabIndex="97" DatabaseField="AD047_3A" ValidList="0,1,8,9" ShowFieldLabel="False"></def:datafieldcontrol></TD>
													<TD>
														<def:datafieldcontrol id="AD047_4A" runat="server" FieldTextBoxWidth="50px" FieldDataType="INT" IsInsertField="False"
															IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
															FieldLabelText="AD047_4A" FieldTextBoxTabIndex="109" DatabaseField="AD047_4A" ValidList="0,1,8,9"
															ShowFieldLabel="False"></def:datafieldcontrol></TD>
												</TR>
												<TR>
													<TD class="heading" width="150">Maintain eye contact</TD>
													<TD width="100">
														<def:datafieldcontrol id="AD047_1B" runat="server" FieldTextBoxWidth="50px" FieldDataType="INT" IsInsertField="False"
															IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
															FieldLabelText="AD047_1B" FieldTextBoxTabIndex="74" DatabaseField="AD047_1B" ValidList="0,1,8,9" ShowFieldLabel="False"></def:datafieldcontrol></TD>
													<TD width="100">
														<def:datafieldcontrol id="AD047_2B" runat="server" FieldTextBoxWidth="50px" FieldDataType="INT" IsInsertField="False"
															IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
															FieldLabelText="AD047_2B" FieldTextBoxTabIndex="86" DatabaseField="AD047_2B" ValidList="0,1,8,9" ShowFieldLabel="False"></def:datafieldcontrol></TD>
													<TD>
														<def:datafieldcontrol id="AD047_3B" runat="server" FieldTextBoxWidth="50px" FieldDataType="INT" IsInsertField="False"
															IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
															FieldLabelText="AD047_3B" FieldTextBoxTabIndex="98" DatabaseField="AD047_3B" ValidList="0,1,8,9" ShowFieldLabel="False"></def:datafieldcontrol></TD>
													<TD>
														<def:datafieldcontrol id="AD047_4B" runat="server" FieldTextBoxWidth="50px" FieldDataType="INT" IsInsertField="False"
															IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
															FieldLabelText="AD047_4B" FieldTextBoxTabIndex="110" DatabaseField="AD047_4B" ValidList="0,1,8,9"
															ShowFieldLabel="False"></def:datafieldcontrol></TD>
												</TR>
												<TR>
													<TD class="heading" width="150">Respond to parent smile</TD>
													<TD width="100">
														<def:datafieldcontrol id="AD047_1C" runat="server" FieldTextBoxWidth="50px" FieldDataType="INT" IsInsertField="False"
															IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
															FieldLabelText="AD047_1C" FieldTextBoxTabIndex="75" DatabaseField="AD047_1C" ValidList="0,1,8,9" ShowFieldLabel="False"></def:datafieldcontrol></TD>
													<TD width="100">
														<def:datafieldcontrol id="AD047_2C" runat="server" FieldTextBoxWidth="50px" FieldDataType="INT" IsInsertField="False"
															IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
															FieldLabelText="AD047_2C" FieldTextBoxTabIndex="87" DatabaseField="AD047_2C" ValidList="0,1,8,9" ShowFieldLabel="False"></def:datafieldcontrol></TD>
													<TD>
														<def:datafieldcontrol id="AD047_3C" runat="server" FieldTextBoxWidth="50px" FieldDataType="INT" IsInsertField="False"
															IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
															FieldLabelText="AD047_3C" FieldTextBoxTabIndex="99" DatabaseField="AD047_3C" ValidList="0,1,8,9" ShowFieldLabel="False"></def:datafieldcontrol></TD>
													<TD>
														<def:datafieldcontrol id="AD047_4C" runat="server" FieldTextBoxWidth="50px" FieldDataType="INT" IsInsertField="False"
															IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
															FieldLabelText="AD047_4C" FieldTextBoxTabIndex="111" DatabaseField="AD047_4C" ValidList="0,1,8,9"
															ShowFieldLabel="False"></def:datafieldcontrol></TD>
												</TR>
												<TR>
													<TD class="heading" width="150">Babble</TD>
													<TD width="100">
														<def:datafieldcontrol id="AD047_1D" runat="server" FieldTextBoxWidth="50px" FieldDataType="INT" IsInsertField="False"
															IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
															FieldLabelText="AD047_1D" FieldTextBoxTabIndex="76" DatabaseField="AD047_1D" ValidList="0,1,8,9" ShowFieldLabel="False"></def:datafieldcontrol></TD>
													<TD width="100">
														<def:datafieldcontrol id="AD047_2D" runat="server" FieldTextBoxWidth="50px" FieldDataType="INT" IsInsertField="False"
															IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
															FieldLabelText="AD047_2D" FieldTextBoxTabIndex="88" DatabaseField="AD047_2D" ValidList="0,1,8,9" ShowFieldLabel="False"></def:datafieldcontrol></TD>
													<TD>
														<def:datafieldcontrol id="AD047_3D" runat="server" FieldTextBoxWidth="50px" FieldDataType="INT" IsInsertField="False"
															IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
															FieldLabelText="AD047_3D" FieldTextBoxTabIndex="100" DatabaseField="AD047_3D" ValidList="0,1,8,9"
															ShowFieldLabel="False"></def:datafieldcontrol></TD>
													<TD>
														<def:datafieldcontrol id="AD047_4D" runat="server" FieldTextBoxWidth="50px" FieldDataType="INT" IsInsertField="False"
															IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
															FieldLabelText="AD047_4D" FieldTextBoxTabIndex="112" DatabaseField="AD047_4D" ValidList="0,1,8,9"
															ShowFieldLabel="False"></def:datafieldcontrol></TD>
												</TR>
												<TR>
													<TD class="heading" width="150">Respond to smiles of others</TD>
													<TD width="100">
														<def:datafieldcontrol id="AD047_1E" runat="server" FieldTextBoxWidth="50px" FieldDataType="INT" IsInsertField="False"
															IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
															FieldLabelText="AD047_1E" FieldTextBoxTabIndex="77" DatabaseField="AD047_1E" ValidList="0,1,8,9" ShowFieldLabel="False"></def:datafieldcontrol></TD>
													<TD width="100">
														<def:datafieldcontrol id="AD047_2E" runat="server" FieldTextBoxWidth="50px" FieldDataType="INT" IsInsertField="False"
															IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
															FieldLabelText="AD047_2E" FieldTextBoxTabIndex="89" DatabaseField="AD047_2E" ValidList="0,1,8,9" ShowFieldLabel="False"></def:datafieldcontrol></TD>
													<TD>
														<def:datafieldcontrol id="AD047_3E" runat="server" FieldTextBoxWidth="50px" FieldDataType="INT" IsInsertField="False"
															IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
															FieldLabelText="AD047_3E" FieldTextBoxTabIndex="101" DatabaseField="AD047_3E" ValidList="0,1,8,9"
															ShowFieldLabel="False"></def:datafieldcontrol></TD>
													<TD>
														<def:datafieldcontrol id="AD047_4E" runat="server" FieldTextBoxWidth="50px" FieldDataType="INT" IsInsertField="False"
															IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
															FieldLabelText="AD047_4E" FieldTextBoxTabIndex="113" DatabaseField="AD047_4E" ValidList="0,1,8,9"
															ShowFieldLabel="False"></def:datafieldcontrol></TD>
												</TR>
												<TR>
													<TD class="heading" width="150">Play Peek-a-boo</TD>
													<TD width="100">
														<def:datafieldcontrol id="AD047_1F" runat="server" FieldTextBoxWidth="50px" FieldDataType="INT" IsInsertField="False"
															IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
															FieldLabelText="AD047_1F" FieldTextBoxTabIndex="78" DatabaseField="AD047_1F" ValidList="0,1,8,9" ShowFieldLabel="False"></def:datafieldcontrol></TD>
													<TD width="100">
														<def:datafieldcontrol id="AD047_2F" runat="server" FieldTextBoxWidth="50px" FieldDataType="INT" IsInsertField="False"
															IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
															FieldLabelText="AD047_2F" FieldTextBoxTabIndex="90" DatabaseField="AD047_2F" ValidList="0,1,8,9" ShowFieldLabel="False"></def:datafieldcontrol></TD>
													<TD>
														<def:datafieldcontrol id="AD047_3F" runat="server" FieldTextBoxWidth="50px" FieldDataType="INT" IsInsertField="False"
															IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
															FieldLabelText="AD047_3F" FieldTextBoxTabIndex="102" DatabaseField="AD047_3F" ValidList="0,1,8,9"
															ShowFieldLabel="False"></def:datafieldcontrol></TD>
													<TD>
														<def:datafieldcontrol id="AD047_4F" runat="server" FieldTextBoxWidth="50px" FieldDataType="INT" IsInsertField="False"
															IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
															FieldLabelText="AD047_4F" FieldTextBoxTabIndex="114" DatabaseField="AD047_4F" ValidList="0,1,8,9"
															ShowFieldLabel="False"></def:datafieldcontrol></TD>
												</TR>
												<TR>
													<TD class="heading" width="150">Say or understand “Uh oh”*</TD>
													<TD width="100">
														<def:datafieldcontrol id="AD047_1G" runat="server" FieldTextBoxWidth="50px" FieldDataType="INT" IsInsertField="False"
															IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
															FieldLabelText="AD047_1G" FieldTextBoxTabIndex="79" DatabaseField="AD047_1G" ValidList="0,1,8,9" ShowFieldLabel="False"></def:datafieldcontrol></TD>
													<TD width="100">
														<def:datafieldcontrol id="AD047_2G" runat="server" FieldTextBoxWidth="50px" FieldDataType="INT" IsInsertField="False"
															IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
															FieldLabelText="AD047_2G" FieldTextBoxTabIndex="91" DatabaseField="AD047_2G" ValidList="0,1,8,9" ShowFieldLabel="False"></def:datafieldcontrol></TD>
													<TD>
														<def:datafieldcontrol id="AD047_3G" runat="server" FieldTextBoxWidth="50px" FieldDataType="INT" IsInsertField="False"
															IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
															FieldLabelText="AD047_3G" FieldTextBoxTabIndex="103" DatabaseField="AD047_3G" ValidList="0,1,8,9"
															ShowFieldLabel="False"></def:datafieldcontrol></TD>
													<TD>
														<def:datafieldcontrol id="AD047_4G" runat="server" FieldTextBoxWidth="50px" FieldDataType="INT" IsInsertField="False"
															IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
															FieldLabelText="AD047_4G" FieldTextBoxTabIndex="115" DatabaseField="AD047_4G" ValidList="0,1,8,9"
															ShowFieldLabel="False"></def:datafieldcontrol></TD>
												</TR>
												<TR>
													<TD class="heading" width="150">Say or understand “Mommy”*</TD>
													<TD width="100">
														<def:datafieldcontrol id="AD047_1H" runat="server" FieldTextBoxWidth="50px" FieldDataType="INT" IsInsertField="False"
															IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
															FieldLabelText="AD047_1H" FieldTextBoxTabIndex="80" DatabaseField="AD047_1H" ValidList="0,1,8,9" ShowFieldLabel="False"></def:datafieldcontrol></TD>
													<TD width="100">
														<def:datafieldcontrol id="AD047_2H" runat="server" FieldTextBoxWidth="50px" FieldDataType="INT" IsInsertField="False"
															IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
															FieldLabelText="AD047_2H" FieldTextBoxTabIndex="92" DatabaseField="AD047_2H" ValidList="0,1,8,9" ShowFieldLabel="False"></def:datafieldcontrol></TD>
													<TD>
														<def:datafieldcontrol id="AD047_3H" runat="server" FieldTextBoxWidth="50px" FieldDataType="INT" IsInsertField="False"
															IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
															FieldLabelText="AD047_3H" FieldTextBoxTabIndex="104" DatabaseField="AD047_3H" ValidList="0,1,8,9"
															ShowFieldLabel="False"></def:datafieldcontrol></TD>
													<TD>
														<def:datafieldcontrol id="AD047_4H" runat="server" FieldTextBoxWidth="50px" FieldDataType="INT" IsInsertField="False"
															IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
															FieldLabelText="AD047_4H" FieldTextBoxTabIndex="116" DatabaseField="AD047_4H" ValidList="0,1,8,9"
															ShowFieldLabel="False"></def:datafieldcontrol></TD>
												</TR>
												<TR>
													<TD class="heading" width="150">React to “There’s Mommy/Daddy”</TD>
													<TD width="100">
														<def:datafieldcontrol id="AD047_1I" runat="server" FieldTextBoxWidth="50px" FieldDataType="INT" IsInsertField="False"
															IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
															FieldLabelText="AD047_1I" FieldTextBoxTabIndex="81" DatabaseField="AD047_1I" ValidList="0,1,8,9" ShowFieldLabel="False"></def:datafieldcontrol></TD>
													<TD width="100">
														<def:datafieldcontrol id="AD047_2I" runat="server" FieldTextBoxWidth="50px" FieldDataType="INT" IsInsertField="False"
															IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
															FieldLabelText="AD047_2I" FieldTextBoxTabIndex="93" DatabaseField="AD047_2I" ValidList="0,1,8,9" ShowFieldLabel="False"></def:datafieldcontrol></TD>
													<TD>
														<def:datafieldcontrol id="AD047_3I" runat="server" FieldTextBoxWidth="50px" FieldDataType="INT" IsInsertField="False"
															IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
															FieldLabelText="AD047_3I" FieldTextBoxTabIndex="105" DatabaseField="AD047_3I" ValidList="0,1,8,9"
															ShowFieldLabel="False"></def:datafieldcontrol></TD>
													<TD>
														<def:datafieldcontrol id="AD047_4I" runat="server" FieldTextBoxWidth="50px" FieldDataType="INT" IsInsertField="False"
															IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
															FieldLabelText="AD047_4I" FieldTextBoxTabIndex="117" DatabaseField="AD047_4I" ValidList="0,1,8,9"
															ShowFieldLabel="False"></def:datafieldcontrol></TD>
												</TR>
												<TR>
													<TD class="heading" width="150">Say or understand “Hi”*</TD>
													<TD width="100">
														<def:datafieldcontrol id="AD047_1J" runat="server" FieldTextBoxWidth="50px" FieldDataType="INT" IsInsertField="False"
															IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
															FieldLabelText="AD047_1J" FieldTextBoxTabIndex="82" DatabaseField="AD047_1J" ValidList="0,1,8,9" ShowFieldLabel="False"></def:datafieldcontrol></TD>
													<TD width="100">
														<def:datafieldcontrol id="AD047_2J" runat="server" FieldTextBoxWidth="50px" FieldDataType="INT" IsInsertField="False"
															IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
															FieldLabelText="AD047_2J" FieldTextBoxTabIndex="94" DatabaseField="AD047_2J" ValidList="0,1,8,9" ShowFieldLabel="False"></def:datafieldcontrol></TD>
													<TD>
														<def:datafieldcontrol id="AD047_3J" runat="server" FieldTextBoxWidth="50px" FieldDataType="INT" IsInsertField="False"
															IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
															FieldLabelText="AD047_3J" FieldTextBoxTabIndex="106" DatabaseField="AD047_3J" ValidList="0,1,8,9"
															ShowFieldLabel="False"></def:datafieldcontrol></TD>
													<TD>
														<def:datafieldcontrol id="AD047_4J" runat="server" FieldTextBoxWidth="50px" FieldDataType="INT" IsInsertField="False"
															IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
															FieldLabelText="AD047_4J" FieldTextBoxTabIndex="118" DatabaseField="AD047_4J" ValidList="0,1,8,9"
															ShowFieldLabel="False"></def:datafieldcontrol></TD>
												</TR>
												<TR>
													<TD class="heading" width="150">Understand “Come here/Come on”*</TD>
													<TD width="100">
														<def:datafieldcontrol id="AD047_1K" runat="server" FieldTextBoxWidth="50px" FieldDataType="INT" IsInsertField="False"
															IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
															FieldLabelText="AD047_1K" FieldTextBoxTabIndex="83" DatabaseField="AD047_1K" ValidList="0,1,8,9" ShowFieldLabel="False"></def:datafieldcontrol></TD>
													<TD width="100">
														<def:datafieldcontrol id="AD047_2K" runat="server" FieldTextBoxWidth="50px" FieldDataType="INT" IsInsertField="False"
															IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
															FieldLabelText="AD047_2K" FieldTextBoxTabIndex="95" DatabaseField="AD047_2K" ValidList="0,1,8,9" ShowFieldLabel="False"></def:datafieldcontrol></TD>
													<TD>
														<def:datafieldcontrol id="AD047_3K" runat="server" FieldTextBoxWidth="50px" FieldDataType="INT" IsInsertField="False"
															IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
															FieldLabelText="AD047_3K" FieldTextBoxTabIndex="107" DatabaseField="AD047_3K" ValidList="0,1,8,9"
															ShowFieldLabel="False"></def:datafieldcontrol></TD>
													<TD>
														<def:datafieldcontrol id="AD047_4K" runat="server" FieldTextBoxWidth="50px" FieldDataType="INT" IsInsertField="False"
															IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
															FieldLabelText="AD047_4K" FieldTextBoxTabIndex="119" DatabaseField="AD047_4K" ValidList="0,1,8,9"
															ShowFieldLabel="False"></def:datafieldcontrol></TD>
												</TR>
												<TR>
													<TD class="heading" width="150">Understand “Look/Look here”</TD>
													<TD width="100">
														<def:datafieldcontrol id="AD047_1L" runat="server" FieldTextBoxWidth="50px" FieldDataType="INT" IsInsertField="False"
															IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
															FieldLabelText="AD047_1L" FieldTextBoxTabIndex="84" DatabaseField="AD047_1L" ValidList="0,1,8,9" ShowFieldLabel="False"></def:datafieldcontrol></TD>
													<TD width="100">
														<def:datafieldcontrol id="AD047_2L" runat="server" FieldTextBoxWidth="50px" FieldDataType="INT" IsInsertField="False"
															IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
															FieldLabelText="AD047_2L" FieldTextBoxTabIndex="96" DatabaseField="AD047_2L" ValidList="0,1,8,9" ShowFieldLabel="False"></def:datafieldcontrol></TD>
													<TD>
														<def:datafieldcontrol id="AD047_3L" runat="server" FieldTextBoxWidth="50px" FieldDataType="INT" IsInsertField="False"
															IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
															FieldLabelText="AD047_3L" FieldTextBoxTabIndex="108" DatabaseField="AD047_3L" ValidList="0,1,8,9"
															ShowFieldLabel="False"></def:datafieldcontrol></TD>
													<TD>
														<def:datafieldcontrol id="AD047_4L" runat="server" FieldTextBoxWidth="50px" FieldDataType="INT" IsInsertField="False"
															IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
															FieldLabelText="AD047_4L" FieldTextBoxTabIndex="120" DatabaseField="AD047_4L" ValidList="0,1,8,9"
															ShowFieldLabel="False"></def:datafieldcontrol></TD>
												</TR>
											</TABLE>
										</P>
										<TABLE>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD048EV" runat="server" FieldTextBoxWidth="50px" FieldDataType="INT" IsInsertField="False"
														IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
														FieldLabelText="48.&#9;Association of loss of skills with physical illness" FieldTextBoxTabIndex="121"
														DatabaseField="AD048EV" ValidList="0,1,2,8,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD049mo" runat="server" FieldTextBoxWidth="50px" FieldDataType="INT" IsInsertField="False"
														IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
														FieldLabelText="49. Age when skills began to return (months)" FieldTextBoxTabIndex="122" DatabaseField="AD049mo"
														RegExDescription="Must be between 0-48 or 993,994,998,999" RegEx="^([0-9]|[1-3][0-9]|4[0-8]|993|994|998|999)$"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD050cu" runat="server" FieldTextBoxWidth="50px" FieldDataType="INT" IsInsertField="False"
														IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
														FieldLabelText="50. Pointing to express interest" FieldTextBoxTabIndex="123" DatabaseField="AD050cu"
														ValidList="0,1,2,8,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD051cu" runat="server" FieldTextBoxWidth="50px" FieldDataType="INT" IsInsertField="False"
														IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
														FieldLabelText="51.&#9;Nodding" FieldTextBoxTabIndex="124" DatabaseField="AD051cu" ValidList="0,1,2,8,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD052cu" runat="server" FieldTextBoxWidth="50px" FieldDataType="INT" IsInsertField="False"
														IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
														FieldLabelText="52.&#9;Head shaking" FieldTextBoxTabIndex="125" DatabaseField="AD052cu" ValidList="0,1,2,8,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD053cu" runat="server" FieldTextBoxWidth="50px" FieldDataType="INT" IsInsertField="False"
														IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
														FieldLabelText="53.   Conventional/instrumental gestures" FieldTextBoxTabIndex="126" DatabaseField="AD053cu"
														ValidList="0,1,2,3,8,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD054cu" runat="server" FieldTextBoxWidth="50px" FieldDataType="INT" IsInsertField="False"
														IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
														FieldLabelText="54.  Understanding gestures " FieldTextBoxTabIndex="127" DatabaseField="AD054cu" ValidList="0,1,2,3,8,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD055cu" runat="server" FieldTextBoxWidth="50px" FieldDataType="INT" IsInsertField="False"
														IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
														FieldLabelText="55.&#9;Attention to voice" FieldTextBoxTabIndex="128" DatabaseField="AD055cu" ValidList="0,1,2,3,8,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD056cu" runat="server" FieldTextBoxWidth="50px" FieldDataType="INT" IsInsertField="False"
														IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
														FieldLabelText="56.&#9;Spontaneous imitation of actions" FieldTextBoxTabIndex="129" DatabaseField="AD056cu"
														ValidList="0,1,2,3,8,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD057cu" runat="server" FieldTextBoxWidth="50px" FieldDataType="INT" IsInsertField="False"
														IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
														FieldLabelText="57.&#9;Elicited vocal imitation" FieldTextBoxTabIndex="130" DatabaseField="AD057cu"
														ValidList="0,1,2,3,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD058cu" runat="server" FieldTextBoxWidth="50px" FieldDataType="INT" IsInsertField="False"
														IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
														FieldLabelText="58. Articulation/pronunciation " FieldTextBoxTabIndex="131" DatabaseField="AD058cu"
														ValidList="0,1,2,3,8,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD059cu" runat="server" FieldTextBoxWidth="50px" FieldDataType="INT" IsInsertField="False"
														IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
														FieldLabelText="59.&#9;Stereotyped utterances and delayed echolalia" FieldTextBoxTabIndex="132" DatabaseField="AD059cu"
														ValidList="0,1,2,3,8,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD060cu" runat="server" FieldTextBoxWidth="50px" FieldDataType="INT" IsInsertField="False"
														IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
														FieldLabelText="60.&#9;Inappropriate questions or statements" FieldTextBoxTabIndex="133" DatabaseField="AD060cu"
														ValidList="0,1,2,3,8,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD061cu" runat="server" FieldTextBoxWidth="50px" FieldDataType="INT" IsInsertField="False"
														IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
														FieldLabelText="61.&#9;Pronominal reversal" FieldTextBoxTabIndex="134" DatabaseField="AD061cu" ValidList="0,1,2,3,7,8,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD height="30">
													<def:datafieldcontrol id="AD062cu" runat="server" FieldTextBoxWidth="50px" FieldDataType="INT" IsInsertField="False"
														IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
														FieldLabelText="62.&#9;Neologisms/idiosyncratic language" FieldTextBoxTabIndex="135" DatabaseField="AD062cu"
														ValidList="0,1,2,8,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD063cu" runat="server" FieldTextBoxWidth="50px" FieldDataType="INT" IsInsertField="False"
														IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
														FieldLabelText="63.&#9;Verbal rituals" FieldTextBoxTabIndex="136" DatabaseField="AD063cu" ValidList="0,1,2,3,8,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD064cu" runat="server" FieldTextBoxWidth="50px" FieldDataType="INT" IsInsertField="False"
														IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
														FieldLabelText="64. Intonation/volume/rhythm/rate" FieldTextBoxTabIndex="137" DatabaseField="AD064cu"
														ValidList="0,1,2,8,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD065cu" runat="server" FieldTextBoxWidth="50px" FieldDataType="INT" IsInsertField="False"
														IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
														FieldLabelText="65.&#9;Reciprocal conversation (at whatever verbal level of complexity possible)"
														FieldTextBoxTabIndex="138" DatabaseField="AD065cu" ValidList="0,1,2,8,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD066cu" runat="server" FieldTextBoxWidth="50px" FieldDataType="INT" IsInsertField="False"
														IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
														FieldLabelText="66.&#9;Direct gaze" FieldTextBoxTabIndex="139" DatabaseField="AD066cu" ValidList="0,1,2,3,8,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD067cu" runat="server" FieldTextBoxWidth="50px" FieldDataType="INT" IsInsertField="False"
														IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
														FieldLabelText="67.  Social smiling" FieldTextBoxTabIndex="140" DatabaseField="AD067cu" ValidList="0,1,2,3,8,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD068mcu" runat="server" FieldTextBoxWidth="50px" FieldDataType="INT" IsInsertField="False"
														IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
														FieldLabelText="68.   Greeting (MOTHER)" FieldTextBoxTabIndex="141" DatabaseField="AD068mcu" ValidList="0,1,2,3,8,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD068fcu" runat="server" FieldTextBoxWidth="50px" FieldDataType="INT" IsInsertField="False"
														IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
														FieldLabelText="68.   Greeting (FATHER)" FieldTextBoxTabIndex="142" DatabaseField="AD068fcu" ValidList="0,1,2,3,8,9"
														FieldTextBoxTextDefault="9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD068ocu" runat="server" FieldTextBoxWidth="50px" FieldDataType="INT" IsInsertField="False"
														IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
														FieldLabelText="68.   Greeting (OTHER)" FieldTextBoxTabIndex="143" DatabaseField="AD068ocu" ValidList="0,1,2,3,8,9"
														FieldTextBoxTextDefault="9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD069cu" runat="server" FieldTextBoxWidth="50px" FieldDataType="INT" IsInsertField="False"
														IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
														FieldLabelText="69.&#9;Showing and directing attention" FieldTextBoxTabIndex="144" DatabaseField="AD069cu"
														ValidList="0,1,2,3,8,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD070cu" runat="server" FieldTextBoxWidth="50px" FieldDataType="INT" IsInsertField="False"
														IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
														FieldLabelText="70.&#9;Offering to share" FieldTextBoxTabIndex="145" DatabaseField="AD070cu" ValidList="0,1,2,3,8,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD071cu" runat="server" FieldTextBoxWidth="50px" FieldDataType="INT" IsInsertField="False"
														IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
														FieldLabelText="71.&#9; Seeking to share her/his enjoyment with others" FieldTextBoxTabIndex="146"
														DatabaseField="AD071cu" ValidList="0,1,2,8,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD072cu" runat="server" FieldTextBoxWidth="50px" FieldDataType="INT" IsInsertField="False"
														IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
														FieldLabelText="72.  Sharing others' pleasure and excitement" FieldTextBoxTabIndex="147" DatabaseField="AD072cu"
														ValidList="0,1,2,3,8,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD073cu" runat="server" FieldTextBoxWidth="50px" FieldDataType="INT" IsInsertField="False"
														IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
														FieldLabelText="73. Offering comfort" FieldTextBoxTabIndex="148" DatabaseField="AD073cu" ValidList="0,1,2,3,8,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD074mcu" runat="server" FieldTextBoxWidth="50px" FieldDataType="INT" IsInsertField="False"
														IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
														FieldLabelText="74.  Coming for comfort (MOTHER)" FieldTextBoxTabIndex="149" DatabaseField="AD074mcu"
														ValidList="0,1,2,3,8,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD074fcu" runat="server" FieldTextBoxWidth="50px" FieldDataType="INT" IsInsertField="False"
														IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
														FieldLabelText="74.  Coming for comfort (FATHER)" FieldTextBoxTabIndex="150" DatabaseField="AD074fcu"
														ValidList="0,1,2,3,8,9" FieldTextBoxTextDefault="9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD074ocu" runat="server" FieldTextBoxWidth="50px" FieldDataType="INT" IsInsertField="False"
														IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
														FieldLabelText="74.  Coming for comfort (OTHER)" FieldTextBoxTabIndex="151" DatabaseField="AD074ocu"
														ValidList="0,1,2,3,8,9" FieldTextBoxTextDefault="9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD075cu" runat="server" FieldTextBoxWidth="50px" FieldDataType="INT" IsInsertField="False"
														IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
														FieldLabelText="75.&#9;Quality of social overtures" FieldTextBoxTabIndex="153" DatabaseField="AD075cu"
														ValidList="0,1,2,3,8,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD076cu" runat="server" FieldTextBoxWidth="50px" FieldDataType="INT" IsInsertField="False"
														IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
														FieldLabelText="76.&#9;Range of facial expressions used to communicate" FieldTextBoxTabIndex="154"
														DatabaseField="AD076cu" ValidList="0,1,2,3,8,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD height="31">
													<def:datafieldcontrol id="AD077cu" runat="server" FieldTextBoxWidth="50px" FieldDataType="INT" IsInsertField="False"
														IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
														FieldLabelText="77.  Inappropriate facial expressions" FieldTextBoxTabIndex="155" DatabaseField="AD077cu"
														ValidList="0,1,2,8,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD078cu" runat="server" FieldTextBoxWidth="50px" FieldDataType="INT" IsInsertField="False"
														IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
														FieldLabelText="78.  Social crying  (CRYING MUST HAVE TEARS TO BE SCORED)" FieldTextBoxTabIndex="156"
														DatabaseField="AD078cu" ValidList="0,1,2,5,6,7,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD079cu" runat="server" FieldTextBoxWidth="50px" FieldDataType="INT" IsInsertField="False"
														IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
														FieldLabelText="79.  Response to pain" FieldTextBoxTabIndex="157" DatabaseField="AD079cu" ValidList="0,1,2,5,6,7,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD height="32">
													<def:datafieldcontrol id="AD080cu" runat="server" FieldTextBoxWidth="50px" FieldDataType="INT" IsInsertField="False"
														IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
														FieldLabelText="80. Appropriateness of social responses" FieldTextBoxTabIndex="158" DatabaseField="AD080cu"
														ValidList="0,1,2,3,8,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD081cu" runat="server" FieldTextBoxWidth="50px" FieldDataType="INT" IsInsertField="False"
														IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
														FieldLabelText="81.  Arms up to be lifted " FieldTextBoxTabIndex="159" DatabaseField="AD081cu" ValidList="0,1,2,3,8,9"></def:datafieldcontrol></TD>
											</TR>
										</TABLE>
										<BR>
										<TABLE class="grid">
											<TR>
												<TD class="heading" colSpan="3">82. Cuddliness</TD>
											</TR>
											<TR>
												<TD></TD>
												<TD class="heading">CURRENT</TD>
												<TD class="heading">AS INFANT(6 MO.)</TD>
											</TR>
											<TR>
												<TD class="heading">MOTHER</TD>
												<TD>
													<def:datafieldcontrol id="AD082mcu" runat="server" FieldTextBoxWidth="50px" FieldDataType="INT" IsInsertField="False"
														IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
														FieldLabelText="82.  Cuddliness (MOTHER )" FieldTextBoxTabIndex="160" DatabaseField="AD082mcu" ValidList="0,1,2,3,9"
														ShowFieldLabel="False"></def:datafieldcontrol></TD>
												<TD>
													<def:datafieldcontrol id="AD082min" runat="server" FieldTextBoxWidth="50px" FieldDataType="INT" IsInsertField="False"
														IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
														FieldLabelText="82.  Cuddliness (MOTHER AS INFANT)" FieldTextBoxTabIndex="161" DatabaseField="AD082min"
														ValidList="0,1,2,3,9" ShowFieldLabel="False"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD class="heading">FATHER</TD>
												<TD>
													<def:datafieldcontrol id="AD082fcu" runat="server" FieldTextBoxWidth="50px" FieldDataType="INT" IsInsertField="False"
														IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
														FieldLabelText="AD082fcu" FieldTextBoxTabIndex="162" DatabaseField="AD082fcu" ValidList="0,1,2,3,9"
														ShowFieldLabel="False" FieldTextBoxTextDefault="9"></def:datafieldcontrol></TD>
												<TD>
													<def:datafieldcontrol id="AD082fin" runat="server" FieldTextBoxWidth="50px" FieldDataType="INT" IsInsertField="False"
														IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
														FieldLabelText="AD082fin" FieldTextBoxTabIndex="163" DatabaseField="AD082fin" ValidList="0,1,2,3,9"
														ShowFieldLabel="False" FieldTextBoxTextDefault="9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD class="heading">OTHER</TD>
												<TD>
													<def:datafieldcontrol id="AD082ocu" runat="server" FieldTextBoxWidth="50px" FieldDataType="INT" IsInsertField="False"
														IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
														FieldLabelText="AD082ocu" FieldTextBoxTabIndex="164" DatabaseField="AD082ocu" ValidList="0,1,2,3,9"
														ShowFieldLabel="False" FieldTextBoxTextDefault="9"></def:datafieldcontrol></TD>
												<TD>
													<def:datafieldcontrol id="AD082oin" runat="server" FieldTextBoxWidth="50px" FieldDataType="INT" IsInsertField="False"
														IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
														FieldLabelText="AD082oin" FieldTextBoxTabIndex="165" DatabaseField="AD082oin" ValidList="0,1,2,3,9"
														ShowFieldLabel="False" FieldTextBoxTextDefault="9"></def:datafieldcontrol></TD>
											</TR>
										</TABLE>
									</TD>
									<TD style="vertical-align:top">
										<TABLE>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD083mcu" runat="server" FieldTextBoxWidth="50px" FieldDataType="INT" IsInsertField="False"
														IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
														FieldLabelText="83.  Affection (MOTHER)" FieldTextBoxTabIndex="168" DatabaseField="AD083mcu" ValidList="0,1,2,3,7,8,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD083fcu" runat="server" FieldTextBoxWidth="50px" FieldDataType="INT" IsInsertField="False"
														IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
														FieldLabelText="83.  Affection (FATHER)" FieldTextBoxTabIndex="169" DatabaseField="AD083fcu" ValidList="0,1,2,3,7,8,9"
														FieldTextBoxTextDefault="9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD083ocu" runat="server" FieldTextBoxWidth="50px" FieldDataType="INT" IsInsertField="False"
														IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
														FieldLabelText="83.  Affection (OTHER)" FieldTextBoxTabIndex="170" DatabaseField="AD083ocu" ValidList="0,1,2,3,7,8,9"
														FieldTextBoxTextDefault="9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD084cu" runat="server" FieldTextBoxWidth="50px" FieldDataType="INT" IsInsertField="False"
														IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
														FieldLabelText="84.  Discrimination (CURRENT)" FieldTextBoxTabIndex="172" DatabaseField="AD084cu"
														ValidList="0,1,2,3,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD084tm" runat="server" FieldTextBoxWidth="50px" FieldDataType="INT" IsInsertField="False"
														IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
														FieldLabelText="84.  Discrimination (TYPICAL AT 12 MONTHS)" FieldTextBoxTabIndex="173" DatabaseField="AD084tm"
														ValidList="0,1,2,3,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD085mcu" runat="server" FieldTextBoxWidth="50px" FieldDataType="INT" IsInsertField="False"
														IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
														FieldLabelText="85.  Secure Base (MOTHER)" FieldTextBoxTabIndex="174" DatabaseField="AD085mcu" ValidList="0,1,2,3,7,8,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD085fcu" runat="server" FieldTextBoxWidth="50px" FieldDataType="INT" IsInsertField="False"
														IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
														FieldLabelText="85.  Secure Base (FATHER)" FieldTextBoxTabIndex="175" DatabaseField="AD085fcu" ValidList="0,1,2,3,7,8,9"
														FieldTextBoxTextDefault="9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD085ocu" runat="server" FieldTextBoxWidth="50px" FieldDataType="INT" IsInsertField="False"
														IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
														FieldLabelText="85.  Secure Base (OTHER)" FieldTextBoxTabIndex="176" DatabaseField="AD085ocu" ValidList="0,1,2,3,7,8,9"
														FieldTextBoxTextDefault="9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD086mcu" runat="server" FieldTextBoxWidth="50px" FieldDataType="INT" IsInsertField="False"
														IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
														FieldLabelText="86.  Separation Anxiety (MOTHER)" FieldTextBoxTabIndex="178" DatabaseField="AD086mcu"
														ValidList="0,1,2,7,8,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD086fcu" runat="server" FieldTextBoxWidth="50px" FieldDataType="INT" IsInsertField="False"
														IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
														FieldLabelText="86.  Separation Anxiety (FATHER)" FieldTextBoxTabIndex="179" DatabaseField="AD086fcu"
														ValidList="0,1,2,7,8,9" FieldTextBoxTextDefault="9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD086ocu" runat="server" FieldTextBoxWidth="50px" FieldDataType="INT" IsInsertField="False"
														IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
														FieldLabelText="86.  Separation Anxiety (OTHER)" FieldTextBoxTabIndex="180" DatabaseField="AD086ocu"
														ValidList="0,1,2,7,8,9" FieldTextBoxTextDefault="9"></def:datafieldcontrol></TD>
											</TR>
										</TABLE>
										<TABLE>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD087cu" runat="server" FieldTextBoxWidth="50px" FieldDataType="INT" IsInsertField="False"
														IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
														FieldLabelText="87. Functional Play with Toys" FieldTextBoxTabIndex="190" DatabaseField="AD087cu"
														ValidList="0,1,2,3,8,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD088cu" runat="server" FieldTextBoxWidth="50px" FieldDataType="INT" IsInsertField="False"
														IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
														FieldLabelText="88.&#9;  Imaginative Play" FieldTextBoxTabIndex="191" DatabaseField="AD088cu" ValidList="0,1,2,3,8,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD089cu" runat="server" FieldTextBoxWidth="50px" FieldDataType="INT" IsInsertField="False"
														IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
														FieldLabelText="89.  Initiation of appropriate activities" FieldTextBoxTabIndex="192" DatabaseField="AD089cu"
														ValidList="0,1,2,3,8,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD090cu" runat="server" FieldTextBoxWidth="50px" FieldDataType="INT" IsInsertField="False"
														IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
														FieldLabelText="90.&#9;Imitative social play" FieldTextBoxTabIndex="193" DatabaseField="AD090cu" ValidList="0,1,2,3,8,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD091cu" runat="server" FieldTextBoxWidth="50px" FieldDataType="INT" IsInsertField="False"
														IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
														FieldLabelText="91.&#9;Interest in children" FieldTextBoxTabIndex="194" DatabaseField="AD091cu" ValidList="0,1,2,3,8,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD092cu" runat="server" FieldTextBoxWidth="50px" FieldDataType="INT" IsInsertField="False"
														IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
														FieldLabelText="92.&#9;Response to approaches of other children" FieldTextBoxTabIndex="195" DatabaseField="AD092cu"
														ValidList="0,1,2,3,8,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD093cu" runat="server" FieldTextBoxWidth="50px" FieldDataType="INT" IsInsertField="False"
														IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
														FieldLabelText="93. Unusual preoccupations (CURRENT)" FieldTextBoxTabIndex="196" DatabaseField="AD093cu"
														ValidList="0,1,2,3,8,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD093ev" runat="server" FieldTextBoxWidth="50px" FieldDataType="INT" IsInsertField="False"
														IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
														FieldLabelText="93. Unusual preoccupations (EVER)" FieldTextBoxTabIndex="197" DatabaseField="AD093ev"
														ValidList="0,1,2,3,8,9" CallOnBlur="tap_adi_toddler_onBlur"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD093mo" runat="server" FieldTextBoxWidth="50px" FieldDataType="INT" IsInsertField="False"
														IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
														FieldLabelText="93. Unusual preoccupations (AGE OF ONSET) (months)" FieldTextBoxTabIndex="198" DatabaseField="AD093mo"
														RegExDescription="Must be between 0-48 or 999" RegEx="^([0-9]|[1-3][0-9]|4[0-8]|999)$"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD094cu" runat="server" FieldTextBoxWidth="50px" FieldDataType="INT" IsInsertField="False"
														IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
														FieldLabelText="94. Circumscribed interests (CURRENT)" FieldTextBoxTabIndex="199" DatabaseField="AD094cu"
														ValidList="0,1,2,3,8,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD094ev" runat="server" FieldTextBoxWidth="50px" FieldDataType="INT" IsInsertField="False"
														IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
														FieldLabelText="94. Circumscribed interests (EVER)" FieldTextBoxTabIndex="200" DatabaseField="AD094ev"
														ValidList="0,1,2,3,8,9" CallOnBlur="tap_adi_toddler_onBlur"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD094mo" runat="server" FieldTextBoxWidth="50px" FieldDataType="INT" IsInsertField="False"
														IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
														FieldLabelText="94. Circumscribed interests (AGE OF ONSET) (months)" FieldTextBoxTabIndex="201" DatabaseField="AD094mo"
														RegExDescription="Must be between 0-48 or 999" RegEx="^([0-9]|[1-3][0-9]|4[0-8]|999)$"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD095cu" runat="server" FieldTextBoxWidth="50px" FieldDataType="INT" IsInsertField="False"
														IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
														FieldLabelText="95. Repetitive use of objects or interest in parts of objects (CURRENT)" FieldTextBoxTabIndex="202"
														DatabaseField="AD095cu" ValidList="0,1,2,3,7,8,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD095ev" runat="server" FieldTextBoxWidth="50px" FieldDataType="INT" IsInsertField="False"
														IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
														FieldLabelText="95. Repetitive use of objects or interest in parts of objects (EVER)" FieldTextBoxTabIndex="203"
														DatabaseField="AD095ev" ValidList="0,1,2,3,7,8,9" CallOnBlur="tap_adi_toddler_onBlur"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD095mo" runat="server" FieldTextBoxWidth="50px" FieldDataType="INT" IsInsertField="False"
														IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
														FieldLabelText="95. Repetitive use of objects or interest in parts of objects (AGE OF ONSET) (months)"
														FieldTextBoxTabIndex="204" DatabaseField="AD095mo" RegExDescription="Must be between 0-48 or 999"
														RegEx="^([0-9]|[1-3][0-9]|4[0-8]|999)$"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD096cu" runat="server" FieldTextBoxWidth="50px" FieldDataType="INT" IsInsertField="False"
														IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
														FieldLabelText="96. Compulsions/rituals (CURRENT)" FieldTextBoxTabIndex="205" DatabaseField="AD096cu"
														ValidList="0,1,2,3,8,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD096ev" runat="server" FieldTextBoxWidth="50px" FieldDataType="INT" IsInsertField="False"
														IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
														FieldLabelText="96. Compulsions/rituals (EVER)" FieldTextBoxTabIndex="206" DatabaseField="AD096ev"
														ValidList="0,1,2,3,8,9" CallOnBlur="tap_adi_toddler_onBlur"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD096mo" runat="server" FieldTextBoxWidth="50px" FieldDataType="INT" IsInsertField="False"
														IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
														FieldLabelText="96. Compulsions/rituals (AGE OF ONSET) (months)" FieldTextBoxTabIndex="207" DatabaseField="AD096mo"
														RegExDescription="Must be between 0-48 or 999" RegEx="^([0-9]|[1-3][0-9]|4[0-8]|999)$"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD097cu" runat="server" FieldTextBoxWidth="50px" FieldDataType="INT" IsInsertField="False"
														IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
														FieldLabelText="97. Unusual sensory interests (CURRENT)" FieldTextBoxTabIndex="208" DatabaseField="AD097cu"
														ValidList="0,1,2,8,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD097ev" runat="server" FieldTextBoxWidth="50px" FieldDataType="INT" IsInsertField="False"
														IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
														FieldLabelText="97. Unusual sensory interests (EVER)" FieldTextBoxTabIndex="209" DatabaseField="AD097ev"
														ValidList="0,1,2,8,9" CallOnBlur="tap_adi_toddler_onBlur"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD097mo" runat="server" FieldTextBoxWidth="50px" FieldDataType="INT" IsInsertField="False"
														IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
														FieldLabelText="97. Unusual sensory interests (AGE OF ONSET) (months)" FieldTextBoxTabIndex="210"
														DatabaseField="AD097mo" RegExDescription="Must be between 0-48 or 999" RegEx="^([0-9]|[1-3][0-9]|4[0-8]|999)$"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD098cu" runat="server" FieldTextBoxWidth="50px" FieldDataType="INT" IsInsertField="False"
														IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
														FieldLabelText="98. Undue general sensitivity to noise (CURRENT)" FieldTextBoxTabIndex="211" DatabaseField="AD098cu"
														ValidList="0,1,2,3,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD098ev" runat="server" FieldTextBoxWidth="50px" FieldDataType="INT" IsInsertField="False"
														IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
														FieldLabelText="98. Undue general sensitivity to noise (EVER)" FieldTextBoxTabIndex="212" DatabaseField="AD098ev"
														ValidList="0,1,2,3,9" CallOnBlur="tap_adi_toddler_onBlur"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD098mo" runat="server" FieldTextBoxWidth="50px" FieldDataType="INT" IsInsertField="False"
														IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
														FieldLabelText="98. Undue general sensitivity to noise (AGE OF ONSET) (months)" FieldTextBoxTabIndex="213"
														DatabaseField="AD098mo" RegExDescription="Must be between 0-48 or 999" RegEx="^([0-9]|[1-3][0-9]|4[0-8]|999)$"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD099cu" runat="server" FieldTextBoxWidth="50px" FieldDataType="INT" IsInsertField="False"
														IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
														FieldLabelText="99. Abnormal, idiosyncratic, negative response to specific sensory stimuli (CURRENT)"
														FieldTextBoxTabIndex="214" DatabaseField="AD099cu"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD099ev" runat="server" FieldTextBoxWidth="50px" FieldDataType="INT" IsInsertField="False"
														IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
														FieldLabelText="99. Abnormal, idiosyncratic, negative response to specific sensory stimuli (EVER)"
														FieldTextBoxTabIndex="215" DatabaseField="AD099ev" CallOnBlur="tap_adi_toddler_onBlur"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD099mo" runat="server" FieldTextBoxWidth="50px" FieldDataType="INT" IsInsertField="False"
														IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
														FieldLabelText="99. Abnormal, idiosyncratic, negative response to specific sensory stimuli (AGE OF ONSET) (months)"
														FieldTextBoxTabIndex="216" DatabaseField="AD099mo" RegExDescription="Must be between 0-48 or 999"
														RegEx="^([0-9]|[1-3][0-9]|4[0-8]|999)$"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD100cu" runat="server" FieldTextBoxWidth="50px" FieldDataType="INT" IsInsertField="False"
														IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
														FieldLabelText="100.  Unusual Fears (CURRENT)" FieldTextBoxTabIndex="217" DatabaseField="AD100cu"
														ValidList="0,1,2,3,7,8,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD100ev" runat="server" FieldTextBoxWidth="50px" FieldDataType="INT" IsInsertField="False"
														IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
														FieldLabelText="100.  Unusual Fears (EVER)" FieldTextBoxTabIndex="218" DatabaseField="AD100ev" ValidList="0,1,2,3,7,8,9"
														CallOnBlur="tap_adi_toddler_onBlur"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD100mo" runat="server" FieldTextBoxWidth="50px" FieldDataType="INT" IsInsertField="False"
														IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
														FieldLabelText="100.  Unusual Fears (AGE OF ONSET) (months)" FieldTextBoxTabIndex="219" DatabaseField="AD100mo"
														RegExDescription="Must be between 0-48 or 999" RegEx="^([0-9]|[1-3][0-9]|4[0-8]|999)$"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD101cu" runat="server" FieldTextBoxWidth="50px" FieldDataType="INT" IsInsertField="False"
														IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
														FieldLabelText="101.  Difficulties with minor changes in child’s own routines or personal environment (CURRENT)"
														FieldTextBoxTabIndex="220" DatabaseField="AD101cu" ValidList="0,1,2,3,8,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD101ev" runat="server" FieldTextBoxWidth="50px" FieldDataType="INT" IsInsertField="False"
														IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
														FieldLabelText="101.  Difficulties with minor changes in child’s own routines or personal environment (EVER)"
														FieldTextBoxTabIndex="221" DatabaseField="AD101ev" ValidList="0,1,2,3,8,9" CallOnBlur="tap_adi_toddler_onBlur"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD101mo" runat="server" FieldTextBoxWidth="50px" FieldDataType="INT" IsInsertField="False"
														IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
														FieldLabelText="101.  Difficulties with minor changes in child’s own routines or personal environment (AGE OF ONSET) (months)"
														FieldTextBoxTabIndex="222" DatabaseField="AD101mo" RegExDescription="Must be between 0-48 or 999"
														RegEx="^([0-9]|[1-3][0-9]|4[0-8]|999)$"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD102cu" runat="server" FieldTextBoxWidth="50px" FieldDataType="INT" IsInsertField="False"
														IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
														FieldLabelText="102.  Resistance to trivial changes in the environment (CURRENT)" FieldTextBoxTabIndex="223"
														DatabaseField="AD102cu" ValidList="0,1,2,3,8,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD102ev" runat="server" FieldTextBoxWidth="50px" FieldDataType="INT" IsInsertField="False"
														IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
														FieldLabelText="102.  Resistance to trivial changes in the environment (EVER)" FieldTextBoxTabIndex="224"
														DatabaseField="AD102ev" ValidList="0,1,2,3,8,9" CallOnBlur="tap_adi_toddler_onBlur"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD height="47">
													<def:datafieldcontrol id="AD102mo" runat="server" FieldTextBoxWidth="50px" FieldDataType="INT" IsInsertField="False"
														IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
														FieldLabelText="102.  Resistance to trivial changes in the environment (AGE OF ONSET) (months)" FieldTextBoxTabIndex="225"
														DatabaseField="AD102mo" RegExDescription="Must be between 0-48 or 999" RegEx="^([0-9]|[1-3][0-9]|4[0-8]|999)$"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD103cu" runat="server" FieldTextBoxWidth="50px" FieldDataType="INT" IsInsertField="False"
														IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
														FieldLabelText="103.  Unusual attachment to objects (CURRENT)" FieldTextBoxTabIndex="226" DatabaseField="AD103cu"
														ValidList="0,1,2,3,7,8,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD103ev" runat="server" FieldTextBoxWidth="50px" FieldDataType="INT" IsInsertField="False"
														IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
														FieldLabelText="103.  Unusual attachment to objects (EVER)" FieldTextBoxTabIndex="227" DatabaseField="AD103ev"
														ValidList="0,1,2,3,7,8,9" CallOnBlur="tap_adi_toddler_onBlur"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD103mo" runat="server" FieldTextBoxWidth="50px" FieldDataType="INT" IsInsertField="False"
														IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
														FieldLabelText="103.  Unusual attachment to objects (AGE OF ONSET) (months)" FieldTextBoxTabIndex="228"
														DatabaseField="AD103mo" RegExDescription="Must be between 0-48 or 999" RegEx="^([0-9]|[1-3][0-9]|4[0-8]|999)$"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD104cu" runat="server" FieldTextBoxWidth="50px" FieldDataType="INT" IsInsertField="False"
														IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
														FieldLabelText="104.  Hand and finger mannerisms (CURRENT)" FieldTextBoxTabIndex="229" DatabaseField="AD104cu"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD104ev" runat="server" FieldTextBoxWidth="50px" FieldDataType="INT" IsInsertField="False"
														IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
														FieldLabelText="104.  Hand and finger mannerisms (EVER)" FieldTextBoxTabIndex="230" DatabaseField="AD104ev"
														CallOnBlur="tap_adi_toddler_onBlur"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD104mo" runat="server" FieldTextBoxWidth="50px" FieldDataType="INT" IsInsertField="False"
														IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
														FieldLabelText="104.  Hand and finger mannerisms (AGE OF ONSET) (months)" FieldTextBoxTabIndex="231"
														DatabaseField="AD104mo" RegExDescription="Must be between 0-48 or 999" RegEx="^([0-9]|[1-3][0-9]|4[0-8]|999)$"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD105cu" runat="server" FieldTextBoxWidth="50px" FieldDataType="INT" IsInsertField="False"
														IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
														FieldLabelText="105.  Midline hand movements (CURRENT)" FieldTextBoxTabIndex="232" DatabaseField="AD105cu"
														ValidList="0,1,2,8,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD105ev" runat="server" FieldTextBoxWidth="50px" FieldDataType="INT" IsInsertField="False"
														IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
														FieldLabelText="105.  Midline hand movements (EVER)" FieldTextBoxTabIndex="233" DatabaseField="AD105ev"
														ValidList="0,1,2,8,9" CallOnBlur="tap_adi_toddler_onBlur"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD105mo" runat="server" FieldTextBoxWidth="50px" FieldDataType="INT" IsInsertField="False"
														IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
														FieldLabelText="105.  Midline hand movements (AGE OF ONSET) (months)" FieldTextBoxTabIndex="234" DatabaseField="AD105mo"
														RegExDescription="Must be between 0-48 or 999" RegEx="^([0-9]|[1-3][0-9]|4[0-8]|999)$"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD106cu" runat="server" FieldTextBoxWidth="50px" FieldDataType="INT" IsInsertField="False"
														IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
														FieldLabelText="106.  Other complex mannerisms or stereotyped body movements (CURRENT)" FieldTextBoxTabIndex="235"
														DatabaseField="AD106cu" ValidList="0,1,2,3,8,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD106ev" runat="server" FieldTextBoxWidth="50px" FieldDataType="INT" IsInsertField="False"
														IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
														FieldLabelText="106.  Other complex mannerisms or stereotyped body movements (EVER)" FieldTextBoxTabIndex="236"
														DatabaseField="AD106ev" ValidList="0,1,2,3,8,9" CallOnBlur="tap_adi_toddler_onBlur"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD106mo" runat="server" FieldTextBoxWidth="50px" FieldDataType="INT" IsInsertField="False"
														IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
														FieldLabelText="106.  Other complex mannerisms or stereotyped body movements (AGE OF ONSET) (months)"
														FieldTextBoxTabIndex="237" DatabaseField="AD106mo" RegExDescription="Must be between 0-48 or 999"
														RegEx="^([0-9]|[1-3][0-9]|4[0-8]|999)$"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD107cu" runat="server" FieldTextBoxWidth="50px" FieldDataType="INT" IsInsertField="False"
														IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
														FieldLabelText="107.  Rocking (CURRENT)" FieldTextBoxTabIndex="238" DatabaseField="AD107cu" ValidList="0,1,2,3,8,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD107ev" runat="server" FieldTextBoxWidth="50px" FieldDataType="INT" IsInsertField="False"
														IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
														FieldLabelText="107.  Rocking (EVER)" FieldTextBoxTabIndex="239" DatabaseField="AD107ev" ValidList="0,1,2,3,8,9"
														CallOnBlur="tap_adi_toddler_onBlur"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD107mo" runat="server" FieldTextBoxWidth="50px" FieldDataType="INT" IsInsertField="False"
														IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
														FieldLabelText="107.  Rocking (AGE OF ONSET) (months)" FieldTextBoxTabIndex="240" DatabaseField="AD107mo"
														RegExDescription="Must be between 0-48 or 999" RegEx="^([0-9]|[1-3][0-9]|4[0-8]|999)$"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD108cu" runat="server" FieldTextBoxWidth="50px" FieldDataType="INT" IsInsertField="False"
														IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
														FieldLabelText="108.  Gait (CURRENT)" FieldTextBoxTabIndex="241" DatabaseField="AD108cu" ValidList="0,1,2,3,7,8,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD108ev" runat="server" FieldTextBoxWidth="50px" FieldDataType="INT" IsInsertField="False"
														IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
														FieldLabelText="108.  Gait (EVER)" FieldTextBoxTabIndex="242" DatabaseField="AD108ev" ValidList="0,1,2,3,7,8,9"
														CallOnBlur="tap_adi_toddler_onBlur"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD108mo" runat="server" FieldTextBoxWidth="50px" FieldDataType="INT" IsInsertField="False"
														IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
														FieldLabelText="108.  Gait (AGE OF ONSET) (months)" FieldTextBoxTabIndex="243" DatabaseField="AD108mo"
														RegExDescription="Must be between 0-48 or 999" RegEx="^([0-9]|[1-3][0-9]|4[0-8]|999)$"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD109cu" runat="server" FieldTextBoxWidth="50px" FieldDataType="INT" IsInsertField="False"
														IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
														FieldLabelText="109.  Aggression toward caregivers or family members (CURRENT)" FieldTextBoxTabIndex="244"
														DatabaseField="AD109cu" ValidList="0,1,2,3,8,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD109ev" runat="server" FieldTextBoxWidth="50px" FieldDataType="INT" IsInsertField="False"
														IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
														FieldLabelText="109.  Aggression toward caregivers or family members (EVER)" FieldTextBoxTabIndex="245"
														DatabaseField="AD109ev" ValidList="0,1,2,3,8,9" CallOnBlur="tap_adi_toddler_onBlur"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD109mo" runat="server" FieldTextBoxWidth="50px" FieldDataType="INT" IsInsertField="False"
														IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
														FieldLabelText="109.  Aggression toward caregivers or family members (AGE OF ONSET) (months)" FieldTextBoxTabIndex="246"
														DatabaseField="AD109mo" RegExDescription="Must be between 0-48 or 999" RegEx="^([0-9]|[1-3][0-9]|4[0-8]|999)$"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD110cu" runat="server" FieldTextBoxWidth="50px" FieldDataType="INT" IsInsertField="False"
														IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
														FieldLabelText="110.   Aggression toward noncaregivers or nonfamily members (CURRENT)" FieldTextBoxTabIndex="247"
														DatabaseField="AD110cu" ValidList="0,1,2,3,8,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD110ev" runat="server" FieldTextBoxWidth="50px" FieldDataType="INT" IsInsertField="False"
														IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
														FieldLabelText="110.   Aggression toward noncaregivers or nonfamily members (EVER)" FieldTextBoxTabIndex="248"
														DatabaseField="AD110ev" ValidList="0,1,2,3,8,9" CallOnBlur="tap_adi_toddler_onBlur"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD110mo" runat="server" FieldTextBoxWidth="50px" FieldDataType="INT" IsInsertField="False"
														IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
														FieldLabelText="110.   Aggression toward noncaregivers or nonfamily members (AGE OF ONSET) (months)"
														FieldTextBoxTabIndex="249" DatabaseField="AD110mo" RegExDescription="Must be between 0-48 or 999"
														RegEx="^([0-9]|[1-3][0-9]|4[0-8]|999)$"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD111cu" runat="server" FieldTextBoxWidth="50px" FieldDataType="INT" IsInsertField="False"
														IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
														FieldLabelText="111.  Self-injury (CURRENT)" FieldTextBoxTabIndex="250" DatabaseField="AD111cu" ValidList="0,1,2,3,8,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD111ev" runat="server" FieldTextBoxWidth="50px" FieldDataType="INT" IsInsertField="False"
														IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
														FieldLabelText="111.  Self-injury (EVER)" FieldTextBoxTabIndex="251" DatabaseField="AD111ev" ValidList="0,1,2,3,8,9"
														CallOnBlur="tap_adi_toddler_onBlur"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD111mo" runat="server" FieldTextBoxWidth="50px" FieldDataType="INT" IsInsertField="False"
														IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
														FieldLabelText="111.  Self-injury (AGE OF ONSET) (months)" FieldTextBoxTabIndex="252" DatabaseField="AD111mo"
														RegExDescription="Must be between 0-48 or 999" RegEx="^([0-9]|[1-3][0-9]|4[0-8]|999)$"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD112cu" runat="server" FieldTextBoxWidth="50px" FieldDataType="INT" IsInsertField="False"
														IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
														FieldLabelText="112.  Hyperventilation (CURRENT)" FieldTextBoxTabIndex="253" DatabaseField="AD112cu"
														ValidList="0,1,2,8,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD112ev" runat="server" FieldTextBoxWidth="50px" FieldDataType="INT" IsInsertField="False"
														IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
														FieldLabelText="112.  Hyperventilation (EVER)" FieldTextBoxTabIndex="254" DatabaseField="AD112ev"
														ValidList="0,1,2,8,9" CallOnBlur="tap_adi_toddler_onBlur"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD112mo" runat="server" FieldTextBoxWidth="50px" FieldDataType="INT" IsInsertField="False"
														IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
														FieldLabelText="112.  Hyperventilation (AGE OF ONSET) (months)" FieldTextBoxTabIndex="255" DatabaseField="AD112mo"
														RegExDescription="Must be between 0-48 or 999" RegEx="^([0-9]|[1-3][0-9]|4[0-8]|999)$"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD113cu" runat="server" FieldTextBoxWidth="50px" FieldDataType="INT" IsInsertField="False"
														IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
														FieldLabelText="113.  Faints/fits/blackouts (CURRENT)" FieldTextBoxTabIndex="256" DatabaseField="AD113cu"
														ValidList="0,1,2,7,8,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD113ev" runat="server" FieldTextBoxWidth="50px" FieldDataType="INT" IsInsertField="False"
														IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
														FieldLabelText="113.  Faints/fits/blackouts (EVER)" FieldTextBoxTabIndex="257" DatabaseField="AD113ev"
														ValidList="0,1,2,7,8,9" CallOnBlur="tap_adi_toddler_onBlur"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD113mo" runat="server" FieldTextBoxWidth="50px" FieldDataType="INT" IsInsertField="False"
														IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
														FieldLabelText="113.  Faints/fits/blackouts (AGE OF ONSET) (months)" FieldTextBoxTabIndex="258" DatabaseField="AD113mo"
														RegExDescription="Must be between 0-48 or 999" RegEx="^([0-9]|[1-3][0-9]|4[0-8]|999)$"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD114cu" runat="server" FieldTextBoxWidth="50px" FieldDataType="INT" IsInsertField="False"
														IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
														FieldLabelText="114.  Overactivity at home and elsewhere (CURRENT)" FieldTextBoxTabIndex="259" DatabaseField="AD114cu"
														ValidList="0,1,2,3,8,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD114ev" runat="server" FieldTextBoxWidth="50px" FieldDataType="INT" IsInsertField="False"
														IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
														FieldLabelText="114.  Overactivity at home and elsewhere (EVER)" FieldTextBoxTabIndex="260" DatabaseField="AD114ev"
														ValidList="0,1,2,3,8,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD115cu" runat="server" FieldTextBoxWidth="50px" FieldDataType="INT" IsInsertField="False"
														IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
														FieldLabelText="115.  Problems getting child to bed (CURRENT)" FieldTextBoxTabIndex="261" DatabaseField="AD115cu"
														ValidList="0,1,2,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD115ev" runat="server" FieldTextBoxWidth="50px" FieldDataType="INT" IsInsertField="False"
														IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
														FieldLabelText="115.  Problems getting child to bed (EVER)" FieldTextBoxTabIndex="262" DatabaseField="AD115ev"
														ValidList="0,1,2,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD116cu" runat="server" FieldTextBoxWidth="50px" FieldDataType="INT" IsInsertField="False"
														IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
														FieldLabelText="116.  Problems with sleeping (CURRENT)" FieldTextBoxTabIndex="263" DatabaseField="AD116cu"
														ValidList="0,1,2,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD116ev" runat="server" FieldTextBoxWidth="50px" FieldDataType="INT" IsInsertField="False"
														IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
														FieldLabelText="116.  Problems with sleeping (EVER)" FieldTextBoxTabIndex="264" DatabaseField="AD116ev"
														ValidList="0,1,2,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD117cu" runat="server" FieldTextBoxWidth="50px" FieldDataType="INT" IsInsertField="False"
														IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
														FieldLabelText="117.  Tantrums (CURRENT)" FieldTextBoxTabIndex="265" DatabaseField="AD117cu" ValidList="0,1,2,3,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD117ev" runat="server" FieldTextBoxWidth="50px" FieldDataType="INT" IsInsertField="False"
														IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
														FieldLabelText="117.  Tantrums (EVER)" FieldTextBoxTabIndex="266" DatabaseField="AD117ev" ValidList="0,1,2,3,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD118cu" runat="server" FieldTextBoxWidth="50px" FieldDataType="INT" IsInsertField="False"
														IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
														FieldLabelText="118.  Eating" FieldTextBoxTabIndex="267" DatabaseField="AD118cu" ValidList="0,1,2,3,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD119cu" runat="server" FieldTextBoxWidth="50px" FieldDataType="INT" IsInsertField="False"
														IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
														FieldLabelText="119.  Fine-motor coordination" FieldTextBoxTabIndex="268" DatabaseField="AD119cu"
														ValidList="0,1,2,8,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD120cu" runat="server" FieldTextBoxWidth="50px" FieldDataType="INT" IsInsertField="False"
														IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
														FieldLabelText="120.  Gross-motor coordination" FieldTextBoxTabIndex="269" DatabaseField="AD120cu"
														ValidList="0,1,2,8,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD121" runat="server" FieldTextBoxWidth="50px" FieldDataType="INT" IsInsertField="False"
														IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
														FieldLabelText="121.  Age when abnormality first evident" FieldTextBoxTabIndex="270" DatabaseField="AD121"
														ValidList="0,1,2,3,4,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD122mo" runat="server" FieldTextBoxWidth="50px" FieldDataType="INT" IsInsertField="False"
														IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
														FieldLabelText="122.  Interviewer’s judgment on age when developmental abnormalities probably first manifest  (months)"
														FieldTextBoxTabIndex="271" DatabaseField="AD122mo" RegExDescription="Must be between 0-48 or 999"
														RegEx="^([0-9]|[1-3][0-9]|4[0-8]|999)$"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD123cu" runat="server" FieldTextBoxWidth="50px" FieldDataType="INT" IsInsertField="False"
														IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
														FieldLabelText="123. Visuospatial ability (CURRENT)" FieldTextBoxTabIndex="272" DatabaseField="AD123cu"
														ValidList="0,1,2,8,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD123ev" runat="server" FieldTextBoxWidth="50px" FieldDataType="INT" IsInsertField="False"
														IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
														FieldLabelText="123. Visuospatial ability (EVER)" FieldTextBoxTabIndex="273" DatabaseField="AD123ev"
														ValidList="0,1,2,8,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD124cu" runat="server" FieldTextBoxWidth="50px" FieldDataType="INT" IsInsertField="False"
														IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
														FieldLabelText="124. Memory skill (CURRENT)" FieldTextBoxTabIndex="274" DatabaseField="AD124cu" ValidList="0,1,2,8,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD124ev" runat="server" FieldTextBoxWidth="50px" FieldDataType="INT" IsInsertField="False"
														IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
														FieldLabelText="124. Memory skill (EVER)" FieldTextBoxTabIndex="275" DatabaseField="AD124ev" ValidList="0,1,2,8,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD125cu" runat="server" FieldTextBoxWidth="50px" FieldDataType="INT" IsInsertField="False"
														IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
														FieldLabelText="125. Music (CURRENT)" FieldTextBoxTabIndex="276" DatabaseField="AD125cu" ValidList="0,1,2,8,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD125ev" runat="server" FieldTextBoxWidth="50px" FieldDataType="INT" IsInsertField="False"
														IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
														FieldLabelText="125. Music (EVER)" FieldTextBoxTabIndex="277" DatabaseField="AD125ev" ValidList="0,1,2,8,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD126cu" runat="server" FieldTextBoxWidth="50px" FieldDataType="INT" IsInsertField="False"
														IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
														FieldLabelText="126. Letter recognition (CURRENT)" FieldTextBoxTabIndex="278" DatabaseField="AD126cu"
														ValidList="0,1,2,8,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD126ev" runat="server" FieldTextBoxWidth="50px" FieldDataType="INT" IsInsertField="False"
														IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
														FieldLabelText="126. Letter recognition (EVER)" FieldTextBoxTabIndex="279" DatabaseField="AD126ev"
														ValidList="0,1,2,8,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD127cu" runat="server" FieldTextBoxWidth="50px" FieldDataType="INT" IsInsertField="False"
														IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
														FieldLabelText="127. Drawing skill (CURRENT)" FieldTextBoxTabIndex="280" DatabaseField="AD127cu" ValidList="0,1,2,8,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD127ev" runat="server" FieldTextBoxWidth="50px" FieldDataType="INT" IsInsertField="False"
														IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
														FieldLabelText="127. Drawing skill (EVER)" FieldTextBoxTabIndex="281" DatabaseField="AD127ev" ValidList="0,1,2,8,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD128cu" runat="server" FieldTextBoxWidth="50px" FieldDataType="INT" IsInsertField="False"
														IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
														FieldLabelText="128. Counting (CURRENT)" FieldTextBoxTabIndex="282" DatabaseField="AD128cu" ValidList="0,1,2,8,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD128ev" runat="server" FieldTextBoxWidth="50px" FieldDataType="INT" IsInsertField="False"
														IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
														FieldLabelText="128. Counting (EVER)" FieldTextBoxTabIndex="283" DatabaseField="AD128ev" ValidList="0,1,2,8,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD129cu" runat="server" FieldTextBoxWidth="50px" FieldDataType="INT" IsInsertField="False"
														IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
														FieldLabelText="129. Manual dexterity (CURRENT)" FieldTextBoxTabIndex="284" DatabaseField="AD129cu"
														ValidList="0,1,2,8,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="AD129ev" runat="server" FieldTextBoxWidth="50px" FieldDataType="INT" IsInsertField="False"
														IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True"
														FieldLabelText="129. Manual dexterity (EVER)" FieldTextBoxTabIndex="285" DatabaseField="AD129ev" ValidList="0,1,2,8,9"></def:datafieldcontrol></TD>
											</TR>
										</TABLE>
									</TD>
								</TR>
							</TABLE>
						</asp:panel><br>
						<table class="layout" id="table_readonly">
							<tr>
								<td><def:datafieldcontrol id="created" runat="server" DatabaseField="created" FieldTextBoxTabIndex="382" FieldLabelText="created"
										IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
										IsInsertField="False" FieldDataType="DATE" FieldLabelWidth="80px" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></td>
							</tr>
							<tr>
								<td><def:datafieldcontrol id="createdBy" runat="server" DatabaseField="createdBy" FieldTextBoxTabIndex="383"
										FieldLabelText="createdBy" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
										IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT" FieldLabelWidth="80px"
										RenderReadOnlyAsDiv="True"></def:datafieldcontrol></td>
							</tr>
							<tr>
								<td><def:datafieldcontrol id="updated" runat="server" DatabaseField="updated" FieldTextBoxTabIndex="384" FieldLabelText="updated"
										IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
										IsInsertField="False" FieldDataType="DATE" FieldLabelWidth="80px" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></td>
							</tr>
							<tr>
								<td><def:datafieldcontrol id="updatedBy" runat="server" DatabaseField="updatedBy" FieldTextBoxTabIndex="385"
										FieldLabelText="updatedBy" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
										IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT" FieldLabelWidth="80px"
										RenderReadOnlyAsDiv="True"></def:datafieldcontrol></td>
							</tr>
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
						</table>
					</asp:Content>
