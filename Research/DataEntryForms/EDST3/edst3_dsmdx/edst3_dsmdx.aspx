
<%@ Register TagPrefix="def" Namespace="DataEntryFramework.Old" %>
<%@ Page language="c#" Inherits="edst3_dsmdx.edst3_dsmdx" CodeFile="edst3_dsmdx.aspx.cs"  MasterPageFile="~/UWAC.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="oBodyPlaceHolder" runat="server">
						<def:dataentrycontroller id="DataEntryController1" runat="server" DatabaseTable="edst3_dsmdx" LookupField1="edsid"
							LookupTextBox1LabelText="EDS ID:" LookupTextBox2Visible="False" MeasureName="EDST3 DSMdx" PrimaryKeyField="dsmdx_pk"
							VerifiedField="verified" StudyMeasID="307"></def:dataentrycontroller>
						<table id="table_insert" class="layout">
							<tr>
								<td><def:datafieldcontrol id="EDSID" runat="server" FieldDataType="INT" IsInsertField="True" IsInsertValueRequired="True"
										IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="EDS ID"
										FieldTextBoxTabIndex="1" DatabaseField="EDSID" FieldLabelWidth="80px" FieldTextBoxWidth="80px"></def:datafieldcontrol>
								</td>
							</tr>
							<tr>
								<td><def:datafieldcontrol id="dsmclin" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
										IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="Clinician"
										FieldTextBoxTabIndex="2" DatabaseField="dsmclin" FieldLabelWidth="80px" FieldTextBoxWidth="80px"></def:datafieldcontrol>
								</td>
							</tr>
						</table>
						<asp:Panel Runat="server" ID="mainPanel">
							<P>Enter 1 for a checked or endorsed symptom. Enter 0 for blanks or symptoms not 
								endorsed. Use 8 for N/A.</P>
							<TABLE class="grid" id="table_entry">
								<TR>
									<TD class="heading">A. Social</TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="dsmsoc1" runat="server" FieldTextBoxWidth="40px" FieldLabelWidth="300px" DatabaseField="dsmsoc1"
											FieldTextBoxTabIndex="3" FieldLabelText="a. Impaired nonverbals " IsDoubleEntryField="True" IsReadOnly="False"
											IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="0,1,8"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="dsmsoc2" runat="server" FieldTextBoxWidth="40px" FieldLabelWidth="300px" DatabaseField="dsmsoc2"
											FieldTextBoxTabIndex="4" FieldLabelText="b. Lack of peer relations " IsDoubleEntryField="True" IsReadOnly="False"
											IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="0,1,8"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="dsmsoc3" runat="server" FieldTextBoxWidth="40px" FieldLabelWidth="300px" DatabaseField="dsmsoc3"
											FieldTextBoxTabIndex="5" FieldLabelText="c. Lack of shared enjoyment " IsDoubleEntryField="True" IsReadOnly="False"
											IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="0,1,8"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="dsmsoc4" runat="server" FieldTextBoxWidth="40px" FieldLabelWidth="300px" DatabaseField="dsmsoc4"
											FieldTextBoxTabIndex="6" FieldLabelText="d. Lack of social/emotional  reciprocity " IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="0,1,8"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
							<BR>
							<TABLE class="grid">
								<TR>
									<TD class="heading">B. Communication</TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="dsmcom1" runat="server" FieldTextBoxWidth="40px" FieldLabelWidth="300px" DatabaseField="dsmcom1"
											FieldTextBoxTabIndex="7" FieldLabelText="a. Delay in language, no compensation " IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="0,1,8"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="dsmcom2" runat="server" FieldTextBoxWidth="40px" FieldLabelWidth="300px" DatabaseField="dsmcom2"
											FieldTextBoxTabIndex="8" FieldLabelText="b. Impaired conversation " IsDoubleEntryField="True" IsReadOnly="False"
											IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="0,1,8"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="dsmcom3" runat="server" FieldTextBoxWidth="40px" FieldLabelWidth="300px" DatabaseField="dsmcom3"
											FieldTextBoxTabIndex="9" FieldLabelText="c. Sterotyped, repetitive language" IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="0,1,8"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="dsmcom4" runat="server" FieldTextBoxWidth="40px" FieldLabelWidth="300px" DatabaseField="dsmcom4"
											FieldTextBoxTabIndex="10" FieldLabelText="d. Impaired pretend play " IsDoubleEntryField="True" IsReadOnly="False"
											IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="0,1,8"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
							<BR>
							<TABLE class="grid">
								<TR>
									<TD class="heading">C. Restricted, repetitive, stereotyped patterns</TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="dsmrep1" runat="server" FieldTextBoxWidth="40px" FieldLabelWidth="300px" DatabaseField="dsmrep1"
											FieldTextBoxTabIndex="11" FieldLabelText="a. Preccupation, restricted interest " IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="0,1,8"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="dsmrep2" runat="server" FieldTextBoxWidth="40px" FieldLabelWidth="300px" DatabaseField="dsmrep2"
											FieldTextBoxTabIndex="12" FieldLabelText="b. Inflexible routines/rituals " IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="0,1,8"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="dsmrep3" runat="server" FieldTextBoxWidth="40px" FieldLabelWidth="300px" DatabaseField="dsmrep3"
											FieldTextBoxTabIndex="13" FieldLabelText="c. Stereotyped motor movements" IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="0,1,8"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="dsmrep4" runat="server" FieldTextBoxWidth="40px" FieldLabelWidth="300px" DatabaseField="dsmrep4"
											FieldTextBoxTabIndex="14" FieldLabelText="d. Preoccupation with parts of objects" IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="0,1,8"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
							<BR>
							<TABLE class="grid">
								<TR>
									<TD class="heading">1 = Autism<BR>
										2 = Asperger's<BR>
										3 = PDD-NOS<BR>
										4 = No Dx<BR>
										9 = Missing<BR>
									</TD>
									<TD>
										<def:datafieldcontrol id="dsmdx" runat="server" FieldTextBoxWidth="40px" FieldLabelWidth="100px" DatabaseField="dsmdx"
											FieldTextBoxTabIndex="15" FieldLabelText="DSM Clinical Dx" IsDoubleEntryField="True" IsReadOnly="False"
											IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
							<TABLE>
								<TR>
									<TD>
										<def:datafieldcontrol id="dsmcmnt" runat="server" FieldTextBoxWidth="200px" FieldLabelWidth="100px" DatabaseField="dsmcmnt"
											FieldTextBoxTabIndex="16" FieldLabelText="Comment" IsDoubleEntryField="False" IsReadOnly="False" IsEntryValueRequired="False"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT" FieldTextBoxMaxLength="255"
											FieldTextBoxHeight="150px" FieldTextBoxTextMode="MultiLine"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
							<BR>
							<TABLE class="grid">
								<TR>
									<TD class="heading">0=Y, 1= NO, 9=missing</TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="dsmchng" runat="server" FieldTextBoxWidth="40px" FieldLabelWidth="300px" DatabaseField="dsmchng"
											FieldTextBoxTabIndex="17" FieldLabelText="a. improvement from T1 and/or T2" IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="0,1,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="dsmhf" runat="server" FieldTextBoxWidth="40px" FieldLabelWidth="300px" DatabaseField="dsmhf"
											FieldTextBoxTabIndex="18" FieldLabelText="b. child is high functioning" IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="0,1,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="dsmoffsp" runat="server" FieldTextBoxWidth="40px" FieldLabelWidth="300px" DatabaseField="dsmoffsp"
											FieldTextBoxTabIndex="19" FieldLabelText="c. child is off spectrum" IsDoubleEntryField="True" IsReadOnly="False"
											IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="0,1,9"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
							<BR>
							<TABLE class="layout" id="table_readonly">
								<TR>
									<TD>
										<def:datafieldcontrol id="created" runat="server" FieldLabelWidth="80px" DatabaseField="created" FieldTextBoxTabIndex="24"
											FieldLabelText="created" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="DATE" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="createdBy" runat="server" FieldLabelWidth="80px" DatabaseField="createdBy" FieldTextBoxTabIndex="25"
											FieldLabelText="createdBy" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="updated" runat="server" FieldLabelWidth="80px" DatabaseField="updated" FieldTextBoxTabIndex="26"
											FieldLabelText="updated" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="DATE" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="updatedBy" runat="server" FieldLabelWidth="80px" DatabaseField="updatedBy" FieldTextBoxTabIndex="27"
											FieldLabelText="updatedBy" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
						</asp:Panel>
					</asp:Content>
