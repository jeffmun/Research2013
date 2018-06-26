<%@ Register TagPrefix="def" Namespace="DataEntryFramework.Old" %>

<%@ Page language="c#" Inherits="tap_dsmdx.tap_dsmdx" CodeFile="tap_dsmdx.aspx.cs"  MasterPageFile="~/UWAC.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="oBodyPlaceHolder" runat="server">
						<def:dataentrycontroller id="DataEntryController1" runat="server" DatabaseTable="tap_dsmdx" LookupField1="tapid"
							LookupTextBox1LabelText="TAP ID:" LookupTextBox2Visible="False" MeasureName="TAP DSMdx" PrimaryKeyField="dsmdx_pk"
							VerifiedField="verified" LookupField1DataType="TEXT" LookupField2DataType="TEXT" StudyMeasID="340"></def:dataentrycontroller><br/>
						<table id="table_insert" class="layout">
							<tr>
								<td><def:datafieldcontrol id="EDSID" runat="server" FieldDataType="TEXT" IsInsertField="True" IsInsertValueRequired="True"
										IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="TAP ID"
										FieldTextBoxTabIndex="1" DatabaseField="tapid" RegEx="^[T][A][P][0-9][0-9][0-9]$" RegExDescription="TAP ID must  look like TAP###"
										FieldLabelWidth="80px" FieldTextBoxWidth="80px"></def:datafieldcontrol>
								</td>
							</tr>
							<tr>
								<td><def:datafieldcontrol id="Datafieldcontrol1" runat="server" FieldDataType="DATE" IsInsertField="False"
										IsInsertValueRequired="False" IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="False"
										FieldLabelText="Date" FieldTextBoxTabIndex="2" DatabaseField="dsmdate" FieldLabelWidth="80px" FieldTextBoxWidth="80px"
										FormatString="{0:d}"></def:datafieldcontrol>
								</td>
							</tr>
							<tr>
								<td><def:datafieldcontrol id="dsmclin" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
										IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="Clinician"
										FieldTextBoxTabIndex="2" DatabaseField="dsmclin" FieldLabelWidth="80px" FieldTextBoxWidth="80px"></def:datafieldcontrol>
								</td>
							</tr>
						</table>
						<asp:panel id="mainPanel" runat="server">
							<P>Enter 1 for a checked or endorsed symptom. Enter 0 for blanks or symptoms not 
								endorsed. (0=NO, 1=YES)
							</P>
							<TABLE class="grid" id="grid">
								<TR>
									<TD class="heading">A. Social</TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="dsmsoc1" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="300px" DatabaseField="dsmsoc1"
											FieldTextBoxTabIndex="3" FieldLabelText="a.  Impaired nonverbals" IsDoubleEntryField="True" IsReadOnly="False"
											IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="0,1"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="dsmsoc2" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="300px" DatabaseField="dsmsoc2"
											FieldTextBoxTabIndex="4" FieldLabelText="b.  Lack of peer relations" IsDoubleEntryField="True" IsReadOnly="False"
											IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="0,1"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="dsmsoc3" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="300px" DatabaseField="dsmsoc3"
											FieldTextBoxTabIndex="5" FieldLabelText="c.  Lack of shared enjoyment" IsDoubleEntryField="True" IsReadOnly="False"
											IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="0,1"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="dsmsoc4" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="300px" DatabaseField="dsmsoc4"
											FieldTextBoxTabIndex="6" FieldLabelText="d.  Lack of social/emot reciprocity" IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="0,1"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
							<br/>
							<TABLE class="grid">
								<TR>
									<TD class="heading">B. Communication</TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="dsmcom1" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="300px" DatabaseField="dsmcom1"
											FieldTextBoxTabIndex="7" FieldLabelText="a.  Delay in lang, no compensation" IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="0,1"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="dsmcom2" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="300px" DatabaseField="dsmcom2"
											FieldTextBoxTabIndex="8" FieldLabelText="b.  Impaired conversation" IsDoubleEntryField="True" IsReadOnly="False"
											IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="0,1"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="dsmcom3" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="300px" DatabaseField="dsmcom3"
											FieldTextBoxTabIndex="9" FieldLabelText="c.  Sterotyped, repet lang" IsDoubleEntryField="True" IsReadOnly="False"
											IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="0,1"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="dsmcom4" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="300px" DatabaseField="dsmcom4"
											FieldTextBoxTabIndex="10" FieldLabelText="d.  Impaired pretend play" IsDoubleEntryField="True" IsReadOnly="False"
											IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="0,1"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
							<br/>
							<TABLE class="grid">
								<TR>
									<TD class="heading">C. Restricted, repetitive, stereotyped patterns.</TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="dsmrep1" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="300px" DatabaseField="dsmrep1"
											FieldTextBoxTabIndex="11" FieldLabelText="a.  Preccupation, restricted interest" IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="0,1"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="dsmrep2" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="300px" DatabaseField="dsmrep2"
											FieldTextBoxTabIndex="12" FieldLabelText="b.  Inflexible routines/rituals" IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="0,1"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="dsmrep3" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="300px" DatabaseField="dsmrep3"
											FieldTextBoxTabIndex="13" FieldLabelText="c.  Stereotyped motor movts" IsDoubleEntryField="True" IsReadOnly="False"
											IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="0,1"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="dsmrep4" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="300px" DatabaseField="dsmrep4"
											FieldTextBoxTabIndex="14" FieldLabelText="d.  Preoccupation w/ parts of objs" IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="0,1"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
							<br/>
							<TABLE>
								<TR>
									<TD>1 = Autism<br/>
										2 = PDD-NOS<br/>
										3 = No Dx<br/>
										9 = Missing<br/>
										<def:datafieldcontrol id="dsmdx" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="100px" DatabaseField="dsmdx"
											FieldTextBoxTabIndex="15" FieldLabelText="DSM Clinical Dx" IsDoubleEntryField="True" IsReadOnly="False"
											IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="1,2,3,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="dsmcmnt" runat="server" FieldTextBoxWidth="200px" FieldLabelWidth="100px" DatabaseField="dsmcmnt"
											FieldTextBoxTabIndex="16" FieldLabelText="Comment" IsDoubleEntryField="False" IsReadOnly="False" IsEntryValueRequired="False"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT" FieldTextBoxHeight="150px"
											FieldTextBoxTextMode="MultiLine" FieldTextBoxMaxLength="255"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
							<br/>
							<TABLE class="layout" id="table_readonly">
								<TR>
									<TD>
										<def:datafieldcontrol id="created" runat="server" DatabaseField="created" FieldTextBoxTabIndex="24" FieldLabelText="created"
											IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="DATE" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="createdBy" runat="server" DatabaseField="createdBy" FieldTextBoxTabIndex="25"
											FieldLabelText="createdBy" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="updated" runat="server" DatabaseField="updated" FieldTextBoxTabIndex="26" FieldLabelText="updated"
											IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="DATE" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="updatedBy" runat="server" DatabaseField="updatedBy" FieldTextBoxTabIndex="27"
											FieldLabelText="updatedBy" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
						</asp:panel>
					</asp:Content>
