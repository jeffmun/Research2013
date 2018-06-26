
<%@ Register TagPrefix="def" Namespace="DataEntryFramework" %>
<%@ Page language="c#" Inherits="GenericDataEntryForms.bpas.bpas" CodeFile="bpas.aspx.cs"  MasterPageFile="~/UWAC.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="oBodyPlaceHolder" runat="server">
						<def:dataentrycontroller id="DataEntryController1" runat="server" LookupColumnHeaders="Measure,id,indexnum,clin,test date,rel. date"
							LookupColumns="studymeasname,id,indexnum,bpasclin,bpasdate{0:d},reliabilitydatedone{0:d}" LookupTextBox2LabelText="Indexnum"
							LookupField1DataType="TEXT" ShowScoreButton="False" VerifiedField="verified" PrimaryKeyField="bpas_pk"
							MeasureName="BPASS" LookupTextBox1LabelText="Subject ID:" LookupTextBox2Visible="False" LookupField1="id"
							DatabaseTable="all_bpas" AllowedStudyMeasures="110,127,243,300,303,305,663,924,1979"></def:dataentrycontroller>
						<table class="layout" id="table_insert">
							<tr>
								<td><def:datafieldcontrol id="INDID" runat="server" FieldDataType="TEXT" IsInsertField="True" IsInsertValueRequired="True"
										IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="ID"
										FieldTextBoxTabIndex="2" DatabaseField="id" FieldLabelWidth="80px" FieldTextBoxWidth="80px"></def:datafieldcontrol></td>
							</tr>
							<tr>
								<td><def:datafieldcontrol id="indexnum" runat="server" FieldDataType="INT" IsInsertField="True" IsInsertValueRequired="True"
										IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="Indexnum"
										FieldTextBoxTabIndex="2" DatabaseField="indexnum" FieldLabelWidth="80px" FieldTextBoxWidth="80px"></def:datafieldcontrol></td>
							</tr>
							<tr>
								<td><def:datafieldcontrol id="BPASDATE" runat="server" FieldDataType="DATE" IsInsertField="True" IsInsertValueRequired="True"
										IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="BPASS Date"
										FieldTextBoxTabIndex="3" DatabaseField="BPASDATE" FieldLabelWidth="80px" FieldTextBoxWidth="80px"
										FormatString="{0:d}"></def:datafieldcontrol></td>
							</tr>
							<tr>
								<td><def:datafieldcontrol id="BPASclin" runat="server" FieldDataType="TEXT" IsInsertField="True" IsInsertValueRequired="True"
										IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="Clinician"
										FieldTextBoxTabIndex="4" DatabaseField="BPASclin" FieldLabelWidth="80px" FieldTextBoxWidth="80px"></def:datafieldcontrol></td>
							</tr>
						</table>
						<asp:panel id="mainPanel" Runat="server">
							<TABLE class="layout">
								<TR>
									<TD>
										<TABLE class="grid" id="table_entry">
											<TR>
												<TD class="heading">Use 9 for missing.</TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="BPAS02" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="200px" DatabaseField="BPAS02"
														FieldTextBoxTabIndex="6" FieldLabelText="1. Sociability with peers" IsDoubleEntryField="True" IsReadOnly="False"
														IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
														FieldDataType="INT" ValidList="1,2,3,4,5,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD style="height: 30px">
													<def:datafieldcontrol id="BPAS03" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="200px" DatabaseField="BPAS03"
														FieldTextBoxTabIndex="7" FieldLabelText="2. Sociability in groups" IsDoubleEntryField="True" IsReadOnly="False"
														IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
														FieldDataType="INT" ValidList="1,2,3,4,5,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="BPAS04" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="200px" DatabaseField="BPAS04"
														FieldTextBoxTabIndex="8" FieldLabelText="3. Interests" IsDoubleEntryField="True" IsReadOnly="False"
														IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
														FieldDataType="INT" ValidList="1,2,3,4,5,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="BPAS05" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="200px" DatabaseField="BPAS05"
														FieldTextBoxTabIndex="9" FieldLabelText="4. Flexibility in schedule and routine" IsDoubleEntryField="True"
														IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
														FieldDataType="INT" ValidList="1,2,3,4,5,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="BPAS07" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="200px" DatabaseField="BPAS07"
														FieldTextBoxTabIndex="11" FieldLabelText="5. Flexibility in physical environment" IsDoubleEntryField="True"
														IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
														FieldDataType="INT" ValidList="1,2,3,4,5,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="BPAS08" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="200px" DatabaseField="BPAS08"
														FieldTextBoxTabIndex="12" FieldLabelText="6. Anxiety" IsDoubleEntryField="True" IsReadOnly="False"
														IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
														FieldDataType="INT" ValidList="1,2,3,4,5,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="BPAS09" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="200px" DatabaseField="BPAS09"
														FieldTextBoxTabIndex="13" FieldLabelText="7. Sensitivity to environment" IsDoubleEntryField="True"
														IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
														FieldDataType="INT" ValidList="1,2,3,4,5,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="BPAScmnt" runat="server" FieldTextBoxWidth="200px" FieldLabelWidth="200px" DatabaseField="BPAScmnt"
														FieldTextBoxTabIndex="15" FieldLabelText="Comments" IsDoubleEntryField="False" IsReadOnly="False"
														IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
														FieldDataType="TEXT" FieldTextBoxMaxLength="100" FieldTextBoxHeight="150px" FieldTextBoxTextMode="MultiLine"></def:datafieldcontrol></TD>
											</TR>
										</TABLE>
									</TD>
									<TD style="vertical-align:top">
										<TABLE class="grid">
											<TR>
												<TD>
													<def:datafieldcontrol id="BPAStape" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="200px" DatabaseField="BPAStape"
														FieldTextBoxTabIndex="16" FieldLabelText="1=Live, 2=Tape, 8=N/A, 9=Missing/Unknown" IsDoubleEntryField="True"
														IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
														FieldDataType="INT" ValidList="1,2,8,9" FieldTextBoxTextDefault="8"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD class="heading">Reliability Only</TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="reliabilityDateDone" runat="server" FieldTextBoxWidth="80px" FieldLabelWidth="80px"
														DatabaseField="reliabilityDateDone" FieldTextBoxTabIndex="16" FieldLabelText="Reliability Date (Leave blank if not entering a reliability)"
														IsDoubleEntryField="False" IsReadOnly="False" IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="DATE" FormatString="{0:d}"></def:datafieldcontrol><BR>
												</TD>
											</TR>
										</TABLE>
										<BR>
										<TABLE class="grid">
											<TR>
												<TD class="heading">Blind BPASS Only</TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="BPASbrat" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="200px" DatabaseField="BPASbrat"
														FieldTextBoxTabIndex="16" FieldLabelText="Blindness Rating (0=Blind, 1=Questionable, 2=Not Blind, 8=N/A, 9=Missing/Unknown)"
														IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="INT" ValidList="0,1,2,8,9" FieldTextBoxTextDefault="8"></def:datafieldcontrol></TD>
											</TR>
										</TABLE>
									</TD>
								</TR>
							</TABLE>
							<BR>
							<TABLE class="layout" id="table_readonly">
								<TR>
									<TD>
										<def:datafieldcontrol id="created" runat="server" FieldLabelWidth="80px" DatabaseField="created" FieldTextBoxTabIndex="17"
											FieldLabelText="created" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="DATE" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="createdBy" runat="server" FieldLabelWidth="80px" DatabaseField="createdBy" FieldTextBoxTabIndex="18"
											FieldLabelText="createdBy" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="updated" runat="server" FieldLabelWidth="80px" DatabaseField="updated" FieldTextBoxTabIndex="19"
											FieldLabelText="updated" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="DATE" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="updatedBy" runat="server" FieldLabelWidth="80px" DatabaseField="updatedBy" FieldTextBoxTabIndex="20"
											FieldLabelText="updatedBy" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
						</asp:panel></asp:Content>
