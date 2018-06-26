
<%@ Register TagPrefix="def" Namespace="DataEntryFramework" %>
<%@ Page language="c#" Inherits="GenericDataEntryForms.reel.reel3" CodeFile="reel3.aspx.cs"  MasterPageFile="~/UWAC.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="oBodyPlaceHolder" runat="server">
						<def:dataentrycontroller id="DataEntryController1" runat="server" LookupField1DataType="TEXT" ShowScoreButton="True"
							VerifiedField="verified" PrimaryKeyField="reel_pk" MeasureName="REEL-3" LookupTextBox1LabelText="Subject ID:"
							LookupTextBox2Visible="False" LookupField1="id" DatabaseTable="all_reel3" AllowedStudyMeasures="562"
							LastScoredDateField="scored" LastUpdatedDateField="updated" ondoscore="DataEntryController1_DoScore"></def:dataentrycontroller>
						<table id="table_insert" class="layout">
							<tr>
								<td><def:datafieldcontrol id="id" runat="server" FieldDataType="TEXT" IsInsertField="True" IsInsertValueRequired="True"
										IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="ID"
										FieldTextBoxTabIndex="2" DatabaseField="id" FieldTextBoxWidth="80px" FieldLabelWidth="80px"></def:datafieldcontrol>
								</td>
							</tr>
						</table>
						<asp:Panel Runat="server" ID="mainPanel">
							<TABLE class="layout" id="table_entry">
								<TR>
									<TD>
										<def:datafieldcontrol id="rlclin" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="80px" DatabaseField="rlclin"
											FieldTextBoxTabIndex="3" FieldLabelText="Examiner" IsDoubleEntryField="False" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="rldate" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="80px" DatabaseField="rldate"
											FieldTextBoxTabIndex="4" FieldLabelText="Test Date" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="DATE" FormatString="{0:d}"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="rldob" runat="server" FieldLabelWidth="80px" DatabaseField="rldob" FieldTextBoxTabIndex="7"
											FieldLabelText="DOB:" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False"
											IsInsertValueRequired="False" IsInsertField="False" FieldDataType="DATE" FormatString="{0:d}" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="rlagem" runat="server" FieldLabelWidth="80px" DatabaseField="rlagem" FieldTextBoxTabIndex="8"
											FieldLabelText="Age (mos):" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="rlageym" runat="server" FieldLabelWidth="80px" DatabaseField="rlageym" FieldTextBoxTabIndex="9"
											FieldLabelText="Age (YM):" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT" RenderReadOnlyAsDiv="True"
											DESIGNTIMEDRAGDROP="17"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
							<BR>
							<TABLE class="grid">
								<TR>
									<TD>Use 999 for Missing</TD>
									<TD class="heading">Raw Score</TD>
									<TD class="heading">Age Equiv.</TD>
									<TD class="heading">Ability Score</TD>
									<TD class="heading">%ile Rank</TD>
								</TR>
								<TR>
									<TD class="heading">Expressive Language</TD>
									<TD>
										<def:datafieldcontrol id="rlexraw" runat="server" FieldTextBoxWidth="40px" DatabaseField="rlexraw" FieldTextBoxTabIndex="5"
											FieldLabelText="rlexraw" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ShowFieldLabel="False"
											RegEx="^([0-9]|[1-5][0-9]|6[0-6]|999)$" RegExDescription="Value must be between 0 and 66 or 999"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="rlexae" runat="server" DatabaseField="rlexae" FieldTextBoxTabIndex="17" FieldLabelText="rlexae"
											IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="rlexabst" runat="server" DatabaseField="rlexabst" FieldTextBoxTabIndex="19"
											FieldLabelText="rlexabst" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT" RenderReadOnlyAsDiv="True"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="rlexpctt" runat="server" DatabaseField="rlexpctt" FieldTextBoxTabIndex="21"
											FieldLabelText="rlexpctt" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT" RenderReadOnlyAsDiv="True"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD class="heading">Receptive Language</TD>
									<TD>
										<def:datafieldcontrol id="rlreraw" runat="server" FieldTextBoxWidth="40px" DatabaseField="rlreraw" FieldTextBoxTabIndex="6"
											FieldLabelText="rlreraw" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ShowFieldLabel="False"
											RegEx="^([0-9]|[1-5][0-9]|6[0-6]|999)$" RegExDescription="Value must be between 0 and 66 or 999"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="rlreae" runat="server" DatabaseField="rlreae" FieldTextBoxTabIndex="11" FieldLabelText="rlreae"
											IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="rlreabst" runat="server" DatabaseField="rlreabst" FieldTextBoxTabIndex="13"
											FieldLabelText="rlreabst" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT" RenderReadOnlyAsDiv="True"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="rlrepctt" runat="server" DatabaseField="rlrepctt" FieldTextBoxTabIndex="15"
											FieldLabelText="rlrepctt" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT" RenderReadOnlyAsDiv="True"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD class="heading" colSpan="3">Sum of Receptive and Expressive Ability Scores =
									</TD>
									<TD>
										<def:datafieldcontrol id="rlabsum" runat="server" DatabaseField="rlabsum" FieldTextBoxTabIndex="22" FieldLabelText="rlabsum"
											IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD></TD>
								</TR>
								<TR>
									<TD class="heading" colSpan="3">Language Ability Score</TD>
									<TD>
										<def:datafieldcontrol id="rllngab" runat="server" DatabaseField="rllngab" FieldTextBoxTabIndex="23" FieldLabelText="rllngab"
											IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" RenderReadOnlyAsDiv="True" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="rllngpctt" runat="server" DatabaseField="rllngpctt" FieldTextBoxTabIndex="25"
											FieldLabelText="rllngpctt" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT" RenderReadOnlyAsDiv="True"
											ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
							<def:datafieldcontrol id="scoremsg" runat="server" FieldLabelWidth="100px" DatabaseField="scoremsg" FieldTextBoxTabIndex="9"
								FieldLabelText="Scoring Status:" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
								IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT" RenderReadOnlyAsDiv="True"></def:datafieldcontrol>
							<BR>
							<TABLE class="layout" id="table_readonly">
								<TR>
									<TD>
										<def:datafieldcontrol id="Datafieldcontrol2" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="40px"
											DatabaseField="validity" FieldTextBoxTabIndex="7" FieldLabelText="Validity (1=valid, 2=Questionable, 3=Invalid)"
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="1,2,3"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="Datafieldcontrol1" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="200px"
											DatabaseField="rlcmt" FieldTextBoxTabIndex="8" FieldLabelText="Comments" IsDoubleEntryField="False"
											IsReadOnly="False" IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="TEXT" FieldTextBoxMaxLength="200" FieldTextBoxTextMode="MultiLine"
											FieldTextBoxHeight="150px"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
							<BR>
							<TABLE class="layout">
								<TR>
									<TD>
										<def:datafieldcontrol id="created" runat="server" FieldLabelWidth="80px" DatabaseField="created" FieldTextBoxTabIndex="27"
											FieldLabelText="created" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="DATE" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="createdBy" runat="server" FieldLabelWidth="80px" DatabaseField="createdBy" FieldTextBoxTabIndex="28"
											FieldLabelText="createdBy" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="updated" runat="server" FieldLabelWidth="80px" DatabaseField="updated" FieldTextBoxTabIndex="29"
											FieldLabelText="updated" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="DATE" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="updatedBy" runat="server" FieldLabelWidth="80px" DatabaseField="updatedBy" FieldTextBoxTabIndex="30"
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
