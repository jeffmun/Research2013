<%@ Page language="c#" Inherits="GenericDataEntryForms.bpass.bpass" CodeFile="bpass.aspx.cs"  MasterPageFile="~/UWAC.master" %>

<%@ Register TagPrefix="def" Namespace="DataEntryFramework" %>
<asp:Content ID="Content1" ContentPlaceHolderID="oBodyPlaceHolder" runat="server">
						<def:dataentrycontroller id="DataEntryController1" runat="server" LookupColumnHeaders="Measure,id,indexnum,clin,test date,rel. date"
							LookupColumns="studymeasname,id,indexnum,bpclin,bpdate{0:d},reliabilitydatedone{0:d}" LookupTextBox2LabelText="Indexnum"
							LookupField1DataType="TEXT" ShowScoreButton="False" VerifiedField="verified" PrimaryKeyField="bpass_pk"
							MeasureName="BPASS" LookupTextBox1LabelText="Subject ID:" LookupTextBox2Visible="False" LookupField1="id"
							DatabaseTable="all_bpass" AllowedStudyMeasures="110,127,243,300,303,305,663,924,1979,2078,2665"></def:dataentrycontroller>
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
								<td>
									<def:datafieldcontrol id="BPASDATE" runat="server" FieldTextBoxWidth="80px" FieldLabelWidth="80px" DatabaseField="BPDATE"
										FieldTextBoxTabIndex="3" FieldLabelText="BPASS Date" IsDoubleEntryField="False" IsReadOnly="False"
										IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="True"
										FieldDataType="DATE" FormatString="{0:d}" DESIGNTIMEDRAGDROP="20"></def:datafieldcontrol></td>
							</tr>
							<tr>
								<td>
									<def:datafieldcontrol id="BPASclin" runat="server" FieldTextBoxWidth="80px" FieldLabelWidth="80px" DatabaseField="BPclin"
										FieldTextBoxTabIndex="4" FieldLabelText="Clinician" IsDoubleEntryField="False" IsReadOnly="False"
										IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="True"
										FieldDataType="TEXT" DESIGNTIMEDRAGDROP="23"></def:datafieldcontrol></td>
							</tr>
							<TR>
								<TD><def:datafieldcontrol id="BPobsdate" runat="server" FieldDataType="DATE" IsInsertField="True" IsInsertValueRequired="False"
										IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="BPASS OBS Date"
										FieldTextBoxTabIndex="4" DatabaseField="BPobsdate" FieldLabelWidth="80px" FieldTextBoxWidth="80px"
										FormatString="{0:d}"></def:datafieldcontrol></TD>
							</TR>
							<TR>
								<TD><def:datafieldcontrol id="Datafieldcontrol4" runat="server" FieldDataType="TEXT" IsInsertField="True"
										IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False"
										IsDoubleEntryField="False" FieldLabelText="OBS Clinician" FieldTextBoxTabIndex="4" DatabaseField="BPobsclin"
										FieldLabelWidth="80px" FieldTextBoxWidth="80px"></def:datafieldcontrol></TD>
							</TR>
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
													<def:datafieldcontrol id="BPAS02" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="200px" DatabaseField="BPASS01"
														FieldTextBoxTabIndex="6" FieldLabelText="1. Sociability with peers" IsDoubleEntryField="True" IsReadOnly="False"
														IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
														FieldDataType="INT" ValidList="1,2,3,4,5,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD height="30">
													<def:datafieldcontrol id="BPAS03" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="200px" DatabaseField="BPASS02"
														FieldTextBoxTabIndex="7" FieldLabelText="2. Sociability in groups" IsDoubleEntryField="True" IsReadOnly="False"
														IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
														FieldDataType="INT" ValidList="1,2,3,4,5,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="BPAS04" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="200px" DatabaseField="BPASS03"
														FieldTextBoxTabIndex="8" FieldLabelText="3. Interests" IsDoubleEntryField="True" IsReadOnly="False"
														IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
														FieldDataType="INT" ValidList="1,2,3,4,5,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="BPAS05" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="200px" DatabaseField="BPASS04"
														FieldTextBoxTabIndex="9" FieldLabelText="4. Flexibility in schedule and routine" IsDoubleEntryField="True"
														IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
														FieldDataType="INT" ValidList="1,2,3,4,5,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="BPAS07" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="200px" DatabaseField="BPASS05"
														FieldTextBoxTabIndex="11" FieldLabelText="5. Flexibility in physical environment" IsDoubleEntryField="True"
														IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
														FieldDataType="INT" ValidList="1,2,3,4,5,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="BPAS08" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="200px" DatabaseField="BPASS06"
														FieldTextBoxTabIndex="12" FieldLabelText="6. Anxiety" IsDoubleEntryField="True" IsReadOnly="False"
														IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
														FieldDataType="INT" ValidList="1,2,3,4,5,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="BPAS09" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="200px" DatabaseField="BPASS07"
														FieldTextBoxTabIndex="13" FieldLabelText="7. Sensitivity to environment" IsDoubleEntryField="True"
														IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
														FieldDataType="INT" ValidList="1,2,3,4,5,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="BPAS10" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="200px" DatabaseField="BPASS08"
														FieldTextBoxTabIndex="13" FieldLabelText="8. NV beh: Eye gaze" IsDoubleEntryField="True" IsReadOnly="False"
														IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
														FieldDataType="FLOAT" ValidList="1,2,3,4,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="BPAS11" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="200px" DatabaseField="BPASS09"
														FieldTextBoxTabIndex="13" FieldLabelText="9. Social smiling" IsDoubleEntryField="True" IsReadOnly="False"
														IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
														FieldDataType="FLOAT" ValidList="1,2,3,4,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="BPAS12" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="200px" DatabaseField="BPASS10"
														FieldTextBoxTabIndex="13" FieldLabelText="10. Facial expressions" IsDoubleEntryField="True" IsReadOnly="False"
														IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
														FieldDataType="FLOAT" ValidList="1,2,3,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="BPAS13" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="200px" DatabaseField="BPASS11"
														FieldTextBoxTabIndex="13" FieldLabelText="11. Detail in conversation" IsDoubleEntryField="True" IsReadOnly="False"
														IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
														FieldDataType="FLOAT" ValidList="1,2,3,4,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="BPAS14" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="200px" DatabaseField="BPASS12"
														FieldTextBoxTabIndex="13" FieldLabelText="12. Sensitivity to Listener" IsDoubleEntryField="True" IsReadOnly="False"
														IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
														FieldDataType="FLOAT" ValidList="1,2,3,4,9"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="BPAS16" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="200px" DatabaseField="BPASS13"
														FieldTextBoxTabIndex="13" FieldLabelText="13. Prosody" IsDoubleEntryField="True" IsReadOnly="False"
														IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
														FieldDataType="FLOAT" ValidList="1,2,3,4,9" DESIGNTIMEDRAGDROP="280"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="BPAScmnt" runat="server" FieldTextBoxWidth="200px" FieldLabelWidth="100px" DatabaseField="BPcmnt"
														FieldTextBoxTabIndex="13" FieldLabelText="BPASS Comments" IsDoubleEntryField="False" IsReadOnly="False"
														IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
														FieldDataType="TEXT" FieldTextBoxMaxLength="100" FieldTextBoxHeight="150px" FieldTextBoxTextMode="MultiLine"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="BPASObscmnt" runat="server" FieldTextBoxWidth="200px" FieldLabelWidth="100px"
														DatabaseField="BPobscmnt" FieldTextBoxTabIndex="13" FieldLabelText="BPASS OBS Comments" IsDoubleEntryField="False"
														IsReadOnly="False" IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="TEXT" FieldTextBoxMaxLength="100" FieldTextBoxHeight="150px"
														FieldTextBoxTextMode="MultiLine"></def:datafieldcontrol></TD>
											</TR>
										</TABLE>
									</TD>
									<TD style="vertical-align:top">
										<TABLE class="grid">
											<TR>
												<TD class="heading">Reliability Only</TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="reliabilityDateDone" runat="server" FieldTextBoxWidth="80px" FieldLabelWidth="80px"
														DatabaseField="reliabilityDateDone" FieldTextBoxTabIndex="13" FieldLabelText="BPASS Reliability Date (Leave blank if not entering a reliability)"
														IsDoubleEntryField="False" IsReadOnly="False" IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="DATE" FormatString="{0:d}"></def:datafieldcontrol><BR>
												</TD>
											</TR>
											<TR>
												<TD>
													<def:datafieldcontrol id="Datafieldcontrol1" runat="server" FieldTextBoxWidth="80px" FieldLabelWidth="80px"
														DatabaseField="reliabilityDateDone_obs" FieldTextBoxTabIndex="13" FieldLabelText="BPASS OBS Reliability Date (Leave blank if not entering a reliability)"
														IsDoubleEntryField="False" IsReadOnly="False" IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False"
														IsInsertField="False" FieldDataType="DATE" FormatString="{0:d}"></def:datafieldcontrol></TD>
											</TR>
										</TABLE>
										<TABLE>
											<TR>
												<TD>SOC</TD>
												<TD>
													<def:datafieldcontrol id="BPsoc" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="200px" DatabaseField="BPsoc"
														FieldTextBoxTabIndex="11" FieldLabelText="BPSoc" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
														IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="FLOAT" FormatString="{0:f}"
														ShowFieldLabel="False" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>EXPR</TD>
												<TD>
													<def:datafieldcontrol id="BPexpr" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="200px" DatabaseField="BPexpr"
														FieldTextBoxTabIndex="11" FieldLabelText="BPexpr" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
														IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="FLOAT" FormatString="{0:f}"
														ShowFieldLabel="False" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>CONV</TD>
												<TD>
													<def:datafieldcontrol id="BPconv" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="200px" DatabaseField="BPconv"
														FieldTextBoxTabIndex="11" FieldLabelText="BPconv" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
														IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="FLOAT" FormatString="{0:f}"
														ShowFieldLabel="False" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
											</TR>
											<TR>
												<TD>REST</TD>
												<TD>
													<def:datafieldcontrol id="BPrest" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="200px" DatabaseField="BPrest"
														FieldTextBoxTabIndex="11" FieldLabelText="BPrest" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
														IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="FLOAT" FormatString="{0:f}"
														DESIGNTIMEDRAGDROP="501" ShowFieldLabel="False" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
											</TR>
										</TABLE>
										<def:datafieldcontrol id="Datafieldcontrol2" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="100px"
											DatabaseField="BPscoremsg" FieldTextBoxTabIndex="11" FieldLabelText="Score Message:" IsDoubleEntryField="False"
											IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="TEXT" RenderReadOnlyAsDiv="True"></def:datafieldcontrol><BR>
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
