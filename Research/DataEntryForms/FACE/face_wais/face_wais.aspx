
<%@ Register TagPrefix="def" Namespace="DataEntryFramework.Old" %>
<%@ Page language="c#" Inherits="face_wais.face_wais" CodeFile="face_wais.aspx.cs"  MasterPageFile="~/UWAC.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="oBodyPlaceHolder" runat="server">
						<def:dataentrycontroller id="DataEntryController1" runat="server" ShowScoreButton="True" LookupField1DataType="TEXT"
							DatabaseTable="FACE_WechslerIQ" LookupTextBox1LabelText="FACE ID:" LookupTextBox2Visible="False" MeasureName="FACE WAIS-III"
							PrimaryKeyField="IQnum" VerifiedField="verified" LookupField1="id" StudyMeasID="378" ondoscore="DataEntryController1_DoScore"></def:dataentrycontroller>
						<table>
							<tr>
								<td style="vertical-align:top">
									<table class="tblinsert" id="layout">
										<tr>
											<td>FACE ID</td>
											<td><def:datafieldcontrol id="INDID" runat="server" DatabaseField="ID" FieldTextBoxTabIndex="2" FieldLabelText="FACE ID"
													IsDoubleEntryField="False" IsReadOnly="False" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="True"
													IsInsertField="True" FieldDataType="TEXT" FieldTextBoxWidth="100px" ShowFieldLabel="False" FieldLabelWidth="100px"
													RegEx="^[F][A][C][E][0-9][0-9][0-9]$" RegExDescription="FACE ID must  look like FACE###"></def:datafieldcontrol></td>
										</tr>
										<tr>
											<td>IQ Date</td>
											<td><def:datafieldcontrol id="iqdate" tabIndex="3" runat="server" DatabaseField="iqdate" FieldTextBoxTabIndex="4"
													FieldLabelText="iqdate" IsDoubleEntryField="false" IsReadOnly="False" IsEntryValueRequired="True"
													IsEntryField="True" IsInsertValueRequired="True" IsInsertField="True" FieldDataType="DATE" FieldTextBoxWidth="100px"
													ShowFieldLabel="False" FormatString="{0:d}"></def:datafieldcontrol></td>
										</tr>
										<tr>
											<td>Clinician</td>
											<td><def:datafieldcontrol id="iqclin" tabIndex="4" runat="server" DatabaseField="iqclin" FieldTextBoxTabIndex="6"
													FieldLabelText="iqclin" IsDoubleEntryField="False" IsReadOnly="False" IsEntryValueRequired="True"
													IsEntryField="True" IsInsertValueRequired="True" IsInsertField="True" FieldDataType="TEXT" FieldTextBoxWidth="100px"
													ShowFieldLabel="False"></def:datafieldcontrol></td>
										</tr>
									</table>
								</td>
								<td style="vertical-align:top">
									<table class="layout">
										<tr>
											<td><def:datafieldcontrol id="iqdob" runat="server" DatabaseField="iqdob" FieldTextBoxTabIndex="5" FieldLabelText="DOB:"
													IsDoubleEntryField="false" IsReadOnly="True" IsEntryValueRequired="false" IsEntryField="false" IsInsertValueRequired="False"
													IsInsertField="False" FieldDataType="DATE" RenderReadOnlyAsDiv="True" FieldLabelWidth="80px" FormatString="{0:d}"></def:datafieldcontrol></td>
										</tr>
										<tr>
											<td><def:datafieldcontrol id="IQagemos" runat="server" DatabaseField="IQagemos" FieldTextBoxTabIndex="24"
													FieldLabelText="Age:" IsDoubleEntryField="false" IsReadOnly="True" IsEntryValueRequired="false" IsEntryField="false"
													IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" FieldTextBoxWidth="100px"
													RenderReadOnlyAsDiv="True" FieldLabelWidth="80px"></def:datafieldcontrol></td>
										</tr>
										<tr>
											<td><def:datafieldcontrol id="IQage" runat="server" DatabaseField="IQage" FieldTextBoxTabIndex="23" FieldLabelText="Age (y:m):"
													IsDoubleEntryField="false" IsReadOnly="True" IsEntryValueRequired="false" IsEntryField="false" IsInsertValueRequired="False"
													IsInsertField="False" FieldDataType="TEXT" FieldTextBoxWidth="100px" RenderReadOnlyAsDiv="True" FieldLabelWidth="80px"></def:datafieldcontrol></td>
										</tr>
										<tr>
											<td><def:datafieldcontrol id="NormTabl" runat="server" DatabaseField="NormTabl" FieldTextBoxTabIndex="22"
													FieldLabelText="Norm Table:" IsDoubleEntryField="false" IsReadOnly="True" IsEntryValueRequired="false"
													IsEntryField="false" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT" FieldTextBoxWidth="100px"
													RenderReadOnlyAsDiv="True" FieldLabelWidth="80px"></def:datafieldcontrol></td>
										</tr>
									</table>
								</td>
							</tr>
						</table>
						<def:datafieldcontrol id="iqtest" runat="server" DatabaseField="iqtest" FieldTextBoxTabIndex="7" FieldLabelText="IQ Test"
							IsDoubleEntryField="False" IsReadOnly="False" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="True"
							IsInsertField="True" FieldDataType="TEXT" FieldTextBoxCssClass="hideme" FieldTextBoxWidth="100px"
							ShowFieldLabel="False" FieldLabelWidth="100px" ValidList="WAIS-III" FieldTextBoxTextDefault="WAIS-III"></def:datafieldcontrol>
						<asp:panel id="mainPanel" runat="server">
							<TABLE>
								<TR>
									<TD>
										<DIV style="BORDER-RIGHT: black 1px solid; BORDER-TOP: black 1px solid; BORDER-LEFT: black 1px solid; WIDTH: 400px; BORDER-BOTTOM: black 1px solid; POSITION: relative; HEIGHT: 210px; BACKGROUND-COLOR: gainsboro">
											<TABLE>
												<TR>
													<TD width="120"><FONT color="blue">Use -999 for missing</FONT></TD>
													<TD width="60"><B>Raw score</B></TD>
													<TD width="60"><B>Scaled score</B></TD>
													<TD width="60"><B>Age Equiv</B></TD>
												</TR>
											</TABLE>
											<TABLE id="tblvoc">
												<TR>
													<TD width="120"><B>Vocabulary</B></TD>
													<TD width="60">
														<def:datafieldcontrol id="vocraw" runat="server" RegExDescription="Value must be between 0-66 or -999"
															RegEx="^([0-9]|[1-5][0-9]|6[0-6]|-999)$" ShowFieldLabel="False" FieldTextBoxWidth="40px" FieldDataType="INT"
															IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
															IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="vocraw" FieldTextBoxTabIndex="8" DatabaseField="vocraw"></def:datafieldcontrol></TD>
													<TD width="60">
														<def:datafieldcontrol id="vocss" runat="server" ShowFieldLabel="False" FieldTextBoxWidth="40px" FieldDataType="INT"
															IsInsertField="False" IsInsertValueRequired="False" IsEntryField="False" IsEntryValueRequired="false"
															IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="vocss" FieldTextBoxTabIndex="12" DatabaseField="vocss"
															RenderReadOnlyAsDiv="True" Width="120px"></def:datafieldcontrol></TD>
													<TD width="60">
														<def:datafieldcontrol id="vocaetxt" runat="server" ShowFieldLabel="False" FieldTextBoxWidth="40px" FieldDataType="TEXT"
															IsInsertField="False" IsInsertValueRequired="False" IsEntryField="False" IsEntryValueRequired="false"
															IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="vocaetxt" FieldTextBoxTabIndex="48" DatabaseField="vocaetxt"
															RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
												</TR>
											</TABLE>
											<TABLE id="tblbd">
												<TR>
													<TD width="120"><B>Block Design</B></TD>
													<TD width="60">
														<def:datafieldcontrol id="bdraw" runat="server" RegExDescription="Value must be between 0-68 or -999"
															RegEx="^([0-9]|[1-5][0-9]|6[0-8]|-999)$" ShowFieldLabel="False" FieldTextBoxWidth="40px" FieldDataType="INT"
															IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
															IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="bdraw" FieldTextBoxTabIndex="9" DatabaseField="bdraw"></def:datafieldcontrol></TD>
													<TD width="60">
														<def:datafieldcontrol id="bdss" runat="server" ShowFieldLabel="False" FieldTextBoxWidth="40px" FieldDataType="INT"
															IsInsertField="False" IsInsertValueRequired="False" IsEntryField="False" IsEntryValueRequired="false"
															IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="bdss" FieldTextBoxTabIndex="14" DatabaseField="bdss"
															RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
													<TD width="60">
														<def:datafieldcontrol id="bdaetxt" runat="server" ShowFieldLabel="False" FieldTextBoxWidth="40px" FieldDataType="TEXT"
															IsInsertField="False" IsInsertValueRequired="False" IsEntryField="False" IsEntryValueRequired="false"
															IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="bdaetxt" FieldTextBoxTabIndex="50" DatabaseField="bdaetxt"
															RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
												</TR>
											</TABLE>
											<TABLE id="tblcomp">
												<TR>
													<TD width="120"><B>Comprehension</B></TD>
													<TD width="60">
														<def:datafieldcontrol id="compraw" runat="server" RegExDescription="Value must be between 0-33 or -999"
															RegEx="^([0-9]|[1-2][0-9]|3[0-3]|-999)$" ShowFieldLabel="False" FieldTextBoxWidth="40px" FieldDataType="INT"
															IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
															IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="compraw" FieldTextBoxTabIndex="10" DatabaseField="compraw"></def:datafieldcontrol></TD>
													<TD width="60">
														<def:datafieldcontrol id="compss" runat="server" ShowFieldLabel="False" FieldTextBoxWidth="40px" FieldDataType="INT"
															IsInsertField="False" IsInsertValueRequired="False" IsEntryField="False" IsEntryValueRequired="false"
															IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="compss" FieldTextBoxTabIndex="13" DatabaseField="compss"
															RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
													<TD width="60">
														<P>
															<def:datafieldcontrol id="compaetxt" runat="server" ShowFieldLabel="False" FieldTextBoxWidth="40px" FieldDataType="TEXT"
																IsInsertField="False" IsInsertValueRequired="False" IsEntryField="False" IsEntryValueRequired="false"
																IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="compaetxt" FieldTextBoxTabIndex="49"
																DatabaseField="compaetxt" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></P>
													</TD>
												</TR>
											</TABLE>
											<TABLE id="tbloa">
												<TR>
													<TD width="120"><B>Object Assembly</B></TD>
													<TD width="60">
														<def:datafieldcontrol id="oaraw" runat="server" RegExDescription="Value must be between 0-52 or -999"
															RegEx="^([0-9]|[1-4][0-9]|5[0-2]|-999)$" ShowFieldLabel="False" FieldTextBoxWidth="40px" FieldDataType="INT"
															IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
															IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="oaraw" FieldTextBoxTabIndex="11" DatabaseField="oaraw"></def:datafieldcontrol></TD>
													<TD width="60">
														<def:datafieldcontrol id="oass" runat="server" ShowFieldLabel="False" FieldTextBoxWidth="40px" FieldDataType="INT"
															IsInsertField="False" IsInsertValueRequired="False" IsEntryField="False" IsEntryValueRequired="false"
															IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="oass" FieldTextBoxTabIndex="15" DatabaseField="oass"
															RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
													<TD width="60">
														<def:datafieldcontrol id="oaaetxt" runat="server" ShowFieldLabel="False" FieldTextBoxWidth="40px" FieldDataType="TEXT"
															IsInsertField="False" IsInsertValueRequired="False" IsEntryField="False" IsEntryValueRequired="false"
															IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="oaaetxt" FieldTextBoxTabIndex="51" DatabaseField="oaaetxt"
															RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
												</TR>
											</TABLE>
										</DIV>
									</TD>
									<TD>
										<TABLE class="grid" id="table_entry" style="BACKGROUND-COLOR: gainsboro">
											<TR>
												<TD>Full Scale IQ:</TD>
												<TD>
													<def:datafieldcontrol id="wfsiq" runat="server" FieldLabelWidth="110px" ShowFieldLabel="False" FieldDataType="INT"
														IsInsertField="False" IsInsertValueRequired="False" IsEntryField="false" IsEntryValueRequired="false"
														IsReadOnly="True" IsDoubleEntryField="false" FieldLabelText="Full Scale IQ:" FieldTextBoxTabIndex="16"
														DatabaseField="wfsiq" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>Verbal IQ:</TD>
												<TD>
													<def:datafieldcontrol id="wviq" runat="server" FieldLabelWidth="110px" ShowFieldLabel="False" FieldDataType="INT"
														IsInsertField="False" IsInsertValueRequired="False" IsEntryField="false" IsEntryValueRequired="false"
														IsReadOnly="True" IsDoubleEntryField="false" FieldLabelText="Verbal IQ:" FieldTextBoxTabIndex="17"
														DatabaseField="wviq" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>Performance IQ:</TD>
												<TD>
													<def:datafieldcontrol id="wpiq" runat="server" FieldLabelWidth="110px" ShowFieldLabel="False" FieldDataType="INT"
														IsInsertField="False" IsInsertValueRequired="False" IsEntryField="false" IsEntryValueRequired="false"
														IsReadOnly="True" IsDoubleEntryField="false" FieldLabelText="Performance IQ:" FieldTextBoxTabIndex="18"
														DatabaseField="wpiq" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
											</TR>
										</TABLE>
									</TD>
								</TR>
							</TABLE>
							<TABLE class="layout">
								<TR>
									<TD>
										<def:datafieldcontrol id="IQvld" tabIndex="20" runat="server" FieldLabelWidth="150px" FieldTextBoxWidth="30px"
											FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True"
											IsReadOnly="False" IsDoubleEntryField="false" FieldLabelText="Validity (1=valid, 2=Questionnable, 3=Invalid)"
											FieldTextBoxTabIndex="19" DatabaseField="IQvld" ValidList="1,2,3"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="IQcmnt" tabIndex="21" runat="server" FieldLabelWidth="150px" FieldTextBoxWidth="200px"
											FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="false"
											IsReadOnly="False" IsDoubleEntryField="false" FieldLabelText="Comments" FieldTextBoxTabIndex="21"
											DatabaseField="IQcmnt" FieldTextBoxTextMode="MultiLine" FieldTextBoxHeight="80px"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
							<BR>
							<def:datafieldcontrol id="Scored" runat="server" FieldLabelWidth="100px" FieldDataType="TEXT" IsInsertField="False"
								IsInsertValueRequired="False" IsEntryField="false" IsEntryValueRequired="false" IsReadOnly="True"
								IsDoubleEntryField="false" FieldLabelText="Scored:" FieldTextBoxTabIndex="52" DatabaseField="Scored"
								RenderReadOnlyAsDiv="True"></def:datafieldcontrol>
							<BR>
							<TABLE class="layout" id="table_readonly">
								<TR>
									<TD>
										<def:datafieldcontrol id="created" runat="server" FieldLabelWidth="80px" FieldDataType="DATE" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True"
											IsDoubleEntryField="False" FieldLabelText="created" FieldTextBoxTabIndex="70" DatabaseField="created"
											RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="createdBy" runat="server" FieldLabelWidth="80px" FieldDataType="TEXT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True"
											IsDoubleEntryField="False" FieldLabelText="createdBy" FieldTextBoxTabIndex="71" DatabaseField="createdBy"
											RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="updated" runat="server" FieldLabelWidth="80px" FieldDataType="DATE" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True"
											IsDoubleEntryField="False" FieldLabelText="updated" FieldTextBoxTabIndex="72" DatabaseField="updated"
											RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="updatedBy" runat="server" FieldLabelWidth="80px" FieldDataType="TEXT" IsInsertField="False"
											IsInsertValueRequired="False" IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True"
											IsDoubleEntryField="False" FieldLabelText="updatedBy" FieldTextBoxTabIndex="73" DatabaseField="updatedBy"
											RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
						</asp:panel></asp:Content>
