<%@ Page language="c#" Inherits="GenericDataEntryForms.bpasobs.bpasobs" CodeFile="bpasobs.aspx.cs"  MasterPageFile="~/UWAC.master" %>
<%@ Register TagPrefix="def" Namespace="DataEntryFramework" %>

<asp:Content ID="Content1" ContentPlaceHolderID="oBodyPlaceHolder" runat="server">
						<def:dataentrycontroller id="DataEntryController1" runat="server" ShowReliabilityButton="True" LookupField2="indexnum"
							LookupTextBox2LabelText="Indexnum" DatabaseTable="all_bpasobs"
							LookupField1="id" LookupTextBox2Visible="False" LookupTextBox1LabelText="Subject ID:" MeasureName="BPASS Obs"
							PrimaryKeyField="bpasobs_pk" VerifiedField="verified" ShowScoreButton="False" LookupField1DataType="TEXT"
							AllowedStudyMeasures="244,301,664,672,673,925,2027,2886"
							LookupColumns="studymeasname,id,indexnum,BPASObsclin,bpasobsdate{0:d},reliabilitydatedone{0:d}" LookupColumnHeaders="Measure,ID,Indexnum,Clin,Test Date, Rel. Date"></def:dataentrycontroller>
						<table class="layout" id="table_insert">
							<tr>
								<td><def:datafieldcontrol id="INDID" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="80px" DatabaseField="ID"
										FieldTextBoxTabIndex="2" FieldLabelText="ID" IsDoubleEntryField="False" IsReadOnly="False" IsEntryValueRequired="False"
										IsEntryField="False" IsInsertValueRequired="True" IsInsertField="True" FieldDataType="TEXT"></def:datafieldcontrol></td>
							</tr>
							<tr>
								<td><def:datafieldcontrol id="indexnum" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="80px" DatabaseField="indexnum"
										FieldTextBoxTabIndex="2" FieldLabelText="Indexnum" IsDoubleEntryField="False" IsReadOnly="False" IsEntryValueRequired="False"
										IsEntryField="False" IsInsertValueRequired="True" IsInsertField="True" FieldDataType="INT"></def:datafieldcontrol></td>
							</tr>
							<tr>
								<td><def:datafieldcontrol id="BPASObsDATE" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="80px"
										DatabaseField="BPASObsDATE" FieldTextBoxTabIndex="3" FieldLabelText="BPASS Date" IsDoubleEntryField="False"
										IsReadOnly="False" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="True"
										IsInsertField="True" FieldDataType="DATE" FormatString="{0:d}"></def:datafieldcontrol></td>
							</tr>
							<tr>
								<td><def:datafieldcontrol id="BPASObsclin" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="80px"
										DatabaseField="BPASObsclin" FieldTextBoxTabIndex="4" FieldLabelText="Clinician" IsDoubleEntryField="False"
										IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="True" IsInsertField="True"
										FieldDataType="TEXT"></def:datafieldcontrol></td>
							</tr>
						</table>
						<br>
						<asp:Panel Runat="server" ID="mainPanel">
							<TABLE class="layout">
								<TR>
									<TD>
										<TABLE class="grid" id="table_entry">
											<TR>
												<TD class="heading">Use 9 for missing.</TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="BPAS10" runat="server" FieldDataType="FLOAT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="8. NV beh: Eye gaze"
														FieldTextBoxTabIndex="5" DatabaseField="BPAS10" FieldTextBoxWidth="30px" FieldLabelWidth="200px" ValidList="1,2,3,4,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="BPAS11" runat="server" FieldDataType="FLOAT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="9. Social smiling"
														FieldTextBoxTabIndex="6" DatabaseField="BPAS11" FieldTextBoxWidth="30px" FieldLabelWidth="200px" ValidList="1,2,3,4,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="BPAS12" runat="server" FieldDataType="FLOAT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="10. Facial expressions"
														FieldTextBoxTabIndex="7" DatabaseField="BPAS12" FieldTextBoxWidth="30px" FieldLabelWidth="200px" ValidList="1,2,3,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="BPAS13" runat="server" FieldDataType="FLOAT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="11. Detail in conversation"
														FieldTextBoxTabIndex="8" DatabaseField="BPAS13" FieldTextBoxWidth="30px" FieldLabelWidth="200px" ValidList="1,2,3,4,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="BPAS14" runat="server" FieldDataType="FLOAT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="12. Sensitivity to Listener"
														FieldTextBoxTabIndex="9" DatabaseField="BPAS14" FieldTextBoxWidth="30px" FieldLabelWidth="200px" ValidList="1,2,3,4,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="BPAS16" runat="server" FieldDataType="FLOAT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="13. Prosody"
														FieldTextBoxTabIndex="11" DatabaseField="BPAS16" FieldTextBoxWidth="30px" FieldLabelWidth="200px"
														ValidList="1,2,3,4,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="BPASObscmnt" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="Comments"
														FieldTextBoxTabIndex="13" DatabaseField="BPASObscmnt" FieldTextBoxWidth="200px" FieldTextBoxMaxLength="100"
														FieldTextBoxTextMode="MultiLine" FieldTextBoxHeight="150px"></def:datafieldcontrol></TD>
											</TR>
										</TABLE>
									</TD>
									<TD style="vertical-align:top">
										<TABLE class="grid">
											<TR>
												<TD>
													<def:datafieldcontrol id="BPAStape" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="1=Live, 2=Tape, 8=N/A, 9=Missing/Unknown"
														FieldTextBoxTabIndex="13" DatabaseField="BPAStape" FieldTextBoxWidth="30px" FieldLabelWidth="200px"
														ValidList="1,2,8,9" FieldTextBoxTextDefault="8"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD></TD>
											</TR>
											<TR>
												<TD class="heading">Reliability Only</TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="reliabilityDateDone" runat="server" FieldDataType="DATE" IsInsertField="False"
														IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
														IsDoubleEntryField="False" FieldLabelText="Reliability Date (Leave blank if not entering a reliability)"
														FieldTextBoxTabIndex="14" DatabaseField="reliabilityDateDone" FieldTextBoxWidth="80px" FieldLabelWidth="80px"
														FormatString="{0:d}"></def:datafieldcontrol></TD>
											</TR>
										</TABLE>
										<TABLE class="grid">
											<TR>
												<TD class="heading">Blind BPASS Only</TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="BPASbrat" runat="server" FieldDataType="INT" IsInsertField="False" IsInsertValueRequired="False"
														IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="Blindness Rating (0=Blind, 1=Questionable, 2=Not Blind, 8=N/A, 9=Missing/Unknown)"
														FieldTextBoxTabIndex="16" DatabaseField="BPASbrat" FieldTextBoxWidth="30px" FieldLabelWidth="200px"
														ValidList="0,1,2,8,9" FieldTextBoxTextDefault="8"></def:datafieldcontrol></TD>
											</TR>
										</TABLE>
									</TD>
								</TR>
							</TABLE>
							<BR>
							<TABLE class="layout" id="table_readonly">
								<TR>
									<TD>
										<def:datafieldcontrol id="created" runat="server" FieldDataType="DATE" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="created"
											FieldTextBoxTabIndex="15" DatabaseField="created" FieldLabelWidth="80px" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="createdBy" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="createdBy"
											FieldTextBoxTabIndex="16" DatabaseField="createdBy" FieldLabelWidth="80px" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="updated" runat="server" FieldDataType="DATE" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="updated"
											FieldTextBoxTabIndex="17" DatabaseField="updated" FieldLabelWidth="80px" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="updatedBy" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
											IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="True" IsDoubleEntryField="False" FieldLabelText="updatedBy"
											FieldTextBoxTabIndex="18" DatabaseField="updatedBy" FieldLabelWidth="80px" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
						</asp:Panel></asp:Content>
