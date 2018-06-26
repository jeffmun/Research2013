<%@ Page language="c#" Inherits="face_PsychHx.face_PsychHx" CodeFile="face_PsychHx.aspx.cs"  MasterPageFile="~/UWAC.master" %>
<%@ Register TagPrefix="def" Namespace="DataEntryFramework.Old" %>

<asp:Content ID="Content1" ContentPlaceHolderID="oBodyPlaceHolder" runat="server">
						<def:dataentrycontroller id="DataEntryController1" runat="server" LookupField1DataType="TEXT" VerifiedField="verified"
							PrimaryKeyField="phx_pk" MeasureName="FACE Psych Hx" LookupTextBox1LabelText="FACE ID:" LookupTextBox2Visible="False"
							LookupField1="faceid" DatabaseTable="face_psychhx" StudyMeasID="412"></def:dataentrycontroller>
						<table class="layout" id="table_insert">
							<tr>
								<td><def:datafieldcontrol id="faceid" runat="server" FieldDataType="TEXT" IsInsertField="True" IsInsertValueRequired="True"
										IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="FACE ID"
										FieldTextBoxTabIndex="2" DatabaseField="faceid" FieldTextBoxWidth="80px" FieldLabelWidth="80px" RegExDescription="FACE ID must  look like FACE###"
										RegEx="^[F][A][C][E][0-9][0-9][0-9]$"></def:datafieldcontrol></td>
							</tr>
							<tr>
								<td><def:datafieldcontrol id="phxdate" runat="server" FieldDataType="DATE" IsInsertField="False" IsInsertValueRequired="False"
										IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="Date"
										FieldTextBoxTabIndex="3" DatabaseField="phxdate" FieldLabelWidth="80px" FieldTextBoxWidth="80px" FormatString="{0:d}"></def:datafieldcontrol>
								</td>
							</tr>
							<tr>
								<td><def:datafieldcontrol id="phxclin" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
										IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="Interviewer"
										FieldTextBoxTabIndex="4" DatabaseField="phxclin" FieldLabelWidth="80px" FieldTextBoxWidth="80px"></def:datafieldcontrol>
								</td>
							</tr>
						</table>
						<br>
						<asp:Panel Runat="server" ID="mainPanel">
							<TABLE class="grid" id="table_entry">
								<TR>
									<TD class="heading">Use 999 for missing</TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="phx26" runat="server" FieldTextBoxWidth="50px" DatabaseField="phx26" FieldTextBoxTabIndex="5"
											FieldLabelText="26. Lang delay" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,7,8,999"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="phx27" runat="server" FieldTextBoxWidth="50px" DatabaseField="phx27" FieldTextBoxTabIndex="6"
											FieldLabelText="27. Mental retardation" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,3,4,7,8,9,999"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="phx28" runat="server" FieldTextBoxWidth="50px" DatabaseField="phx28" FieldTextBoxTabIndex="7"
											FieldLabelText="28. Cause of MR" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,3,7,8,9,999"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="phx29" runat="server" FieldTextBoxWidth="50px" DatabaseField="phx29" FieldTextBoxTabIndex="8"
											FieldLabelText="29. Reading retardation" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,7,8,9,999"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="phx29a1" runat="server" FieldTextBoxWidth="50px" DatabaseField="phx29a1" FieldTextBoxTabIndex="9"
											FieldLabelText="29a1. LD - math" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,7,8,9,999"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="phx29a2" runat="server" FieldTextBoxWidth="50px" DatabaseField="phx29a2" FieldTextBoxTabIndex="10"
											FieldLabelText="29a2. LD - Spelling" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,7,8,9,999"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="phx29a3" runat="server" FieldTextBoxWidth="50px" DatabaseField="phx29a3" FieldTextBoxTabIndex="11"
											FieldLabelText="29a3. LD - Writing" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,7,8,9,999"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="phx29b" runat="server" FieldTextBoxWidth="50px" DatabaseField="phx29b" FieldTextBoxTabIndex="12"
											FieldLabelText="29b. Lang artic difficulties" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,8,999"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="phx54" runat="server" FieldTextBoxWidth="50px" DatabaseField="phx54" FieldTextBoxTabIndex="13"
											FieldLabelText="54. Psych disorder screen" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,3,8,9,999"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="phx55" runat="server" FieldTextBoxWidth="50px" DatabaseField="phx55" FieldTextBoxTabIndex="14"
											FieldLabelText="55. Alcohol abuse" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,3,8,9,999"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="phx56" runat="server" FieldTextBoxWidth="50px" DatabaseField="phx56" FieldTextBoxTabIndex="15"
											FieldLabelText="56. Drug abuse" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,3,8,9,999"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="phx57" runat="server" FieldTextBoxWidth="50px" DatabaseField="phx57" FieldTextBoxTabIndex="16"
											FieldLabelText="57. Depression" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,3,5,7,8,9,999"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD><B>777=N/A, 888=Whole Life/Chronic, 999=Missing/Blank</B><BR>
										<def:datafieldcontrol id="phx571" runat="server" RegEx="^([0-9]|[1-9][0-9]|777|888|999)$" RegExDescription="Value must be between 0 and 99, 777, 888, or 999"
											FieldTextBoxWidth="50px" DatabaseField="phx571" FieldTextBoxTabIndex="17" FieldLabelText="571. Depression (# of episodes) Enter 888 for whole life"
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD><B>777=N/A, 888=Whole Life/Chronic, 999=Missing/Blank</B><BR>
										<def:datafieldcontrol id="phx572" runat="server" RegEx="^([0-9]|[1-9][0-9]|777|888|999)$" RegExDescription="Value must be between 0 and 99, 777, 888, or 999"
											FieldTextBoxWidth="50px" DatabaseField="phx572" FieldTextBoxTabIndex="18" FieldLabelText="572. Depression (# of episodes since 2nd disabled child)"
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="phx57a" runat="server" FieldTextBoxWidth="50px" DatabaseField="phx57a" FieldTextBoxTabIndex="19"
											FieldLabelText="57a. Anxiety" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,3,5,7,8,9,999"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD><B>777=N/A, 888=Whole Life/Chronic, 999=Missing/Blank</B><BR>
										<def:datafieldcontrol id="phx57a1" runat="server" RegEx="^([0-9]|[1-9][0-9]|[1-2][0-9][0-9]|777|888|999)$"
											RegExDescription="Value must be between 0 and 299, 777, 888, or 999" FieldTextBoxWidth="50px" DatabaseField="phx57a1"
											FieldTextBoxTabIndex="20" FieldLabelText="57a1. Anxiety (# of months of sxs) Enter 888 for whole life"
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD><B>777=N/A, 888=Whole Life/Chronic, 999=Missing/Blank</B><BR>
										<def:datafieldcontrol id="phx57a2" runat="server" RegEx="^([0-9]|[1-9][0-9]|[1-2][0-9][0-9]|777|888|999)$"
											RegExDescription="Value must be between 0 and 299, 777, 888, or 999" FieldTextBoxWidth="50px" DatabaseField="phx57a2"
											FieldTextBoxTabIndex="21" FieldLabelText="57a2. Anxiety (# of months of sxs since 2nd disabled child)"
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="phx58" runat="server" RegEx="^([0-9]|[1-9][0-9]|[1-2][0-9][0-9]|999)$" RegExDescription="Value must be between 0 and 299 or 999"
											FieldTextBoxWidth="50px" DatabaseField="phx58" FieldTextBoxTabIndex="22" FieldLabelText="58. Affective disorder summary"
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="phx59" runat="server" FieldTextBoxWidth="50px" DatabaseField="phx59" FieldTextBoxTabIndex="23"
											FieldLabelText="59. Bipolar disorder" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,3,5,8,9,999"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="phx60" runat="server" FieldTextBoxWidth="50px" DatabaseField="phx60" FieldTextBoxTabIndex="24"
											FieldLabelText="60. Schizophrenia" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,3,5,8,9,999"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="phx61" runat="server" FieldTextBoxWidth="50px" DatabaseField="phx61" FieldTextBoxTabIndex="25"
											FieldLabelText="61. ADHD" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,5,8,9,999"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="phx62" runat="server" FieldTextBoxWidth="50px" DatabaseField="phx62" FieldTextBoxTabIndex="26"
											FieldLabelText="62. Oppositional Defiant Disorder" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,5,8,9,999"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="phx63" runat="server" FieldTextBoxWidth="50px" DatabaseField="phx63" FieldTextBoxTabIndex="27"
											FieldLabelText="63. Conduct Disorder" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,3,5,8,9,999"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="phx64" runat="server" FieldTextBoxWidth="50px" DatabaseField="phx64" FieldTextBoxTabIndex="28"
											FieldLabelText="64. Obsessive-Compulsive Disorder" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,3,5,8,9,999"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="phx65" runat="server" FieldTextBoxWidth="50px" DatabaseField="phx65" FieldTextBoxTabIndex="29"
											FieldLabelText="65. Tics" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,9,999"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="phx67" runat="server" FieldTextBoxWidth="50px" DatabaseField="phx67" FieldTextBoxTabIndex="30"
											FieldLabelText="67. Quality of information" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,8,9,999"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="phxcmnt" runat="server" FieldTextBoxWidth="200px" DatabaseField="phxcmnt" FieldTextBoxTabIndex="32"
											FieldLabelText="Comments" IsDoubleEntryField="False" IsReadOnly="False" IsEntryValueRequired="False"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT" FieldTextBoxMaxLength="100"
											FieldTextBoxTextMode="MultiLine" FieldTextBoxHeight="150px"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
							<BR>
							<TABLE class="layout" id="table_readonly">
								<TR>
									<TD>
										<def:datafieldcontrol id="created" runat="server" FieldLabelWidth="80px" DatabaseField="created" FieldTextBoxTabIndex="34"
											FieldLabelText="created" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="DATE" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="createdBy" runat="server" FieldLabelWidth="80px" DatabaseField="createdBy" FieldTextBoxTabIndex="35"
											FieldLabelText="createdBy" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="updated" runat="server" FieldLabelWidth="80px" DatabaseField="updated" FieldTextBoxTabIndex="36"
											FieldLabelText="updated" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="DATE" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="updatedBy" runat="server" FieldLabelWidth="80px" DatabaseField="updatedBy" FieldTextBoxTabIndex="37"
											FieldLabelText="updatedBy" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
						</asp:Panel>
					</asp:Content>
