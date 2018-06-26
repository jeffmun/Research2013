<%@ Register TagPrefix="def" Namespace="DataEntryFramework.Old" %>

<%@ Page language="c#" Inherits="edst3_bpas.edst3_bpas" CodeFile="edst3_bpas.aspx.cs"  MasterPageFile="~/UWAC.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="oBodyPlaceHolder" runat="server">
						<def:dataentrycontroller id="DataEntryController1" runat="server" DatabaseTable="edst3_bpas" LookupField1="edsid"
							LookupTextBox2Visible="False" LookupTextBox1LabelText="EDS ID:" PrimaryKeyField="bpas_pk" VerifiedField="verified"
							MeasureName="EDST3 BPASS" StudyMeasID="336"></def:dataentrycontroller>
						<table id="table_insert" class="layout">
							<tr>
								<td><def:datafieldcontrol id="EDSID" runat="server" FieldDataType="INT" IsInsertField="True" IsInsertValueRequired="True"
										IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="EDS ID"
										FieldTextBoxTabIndex="1" DatabaseField="EDSID" FieldTextBoxWidth="60px" FieldLabelWidth="60px"></def:datafieldcontrol>
								</td>
							</tr>
							<tr>
								<td height="27"><def:datafieldcontrol id="BPASDATE" runat="server" FieldDataType="DATE" IsInsertField="False" IsInsertValueRequired="False"
										IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="Date"
										FieldTextBoxTabIndex="2" DatabaseField="BPASDATE" FormatString="{0:d}" FieldTextBoxWidth="60px" FieldLabelWidth="60px"></def:datafieldcontrol>
								</td>
							</tr>
							<tr>
								<td><def:datafieldcontrol id="BPASclin" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
										IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="Clinician"
										FieldTextBoxTabIndex="3" DatabaseField="BPASclin" FieldTextBoxWidth="60px" FieldLabelWidth="60px"></def:datafieldcontrol>
								</td>
							</tr>
						</table>
						<br>
						<asp:Panel Runat="server" ID="mainPanel">
							<TABLE class="grid" id="table_entry">
								<TR>
									<TD class="heading">Use 9 for missing/blank.</TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="BPAS01" runat="server" FieldTextBoxWidth="30px" DatabaseField="BPAS01" FieldTextBoxTabIndex="4"
											FieldLabelText="1: Sociability with Peers" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="BPAS02" runat="server" FieldTextBoxWidth="30px" DatabaseField="BPAS02" FieldTextBoxTabIndex="5"
											FieldLabelText="2: Sociability in Groups" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="BPAS03" runat="server" FieldTextBoxWidth="30px" DatabaseField="BPAS03" FieldTextBoxTabIndex="6"
											FieldLabelText="3: Interests" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="BPAS04" runat="server" FieldTextBoxWidth="30px" DatabaseField="BPAS04" FieldTextBoxTabIndex="7"
											FieldLabelText="4: Flexibility in Schedule and Routine" IsDoubleEntryField="True" IsReadOnly="False"
											IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="1,2,3,4,5,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="BPAS05" runat="server" FieldTextBoxWidth="30px" DatabaseField="BPAS05" FieldTextBoxTabIndex="8"
											FieldLabelText="5: Flexibility in Physical Environment" IsDoubleEntryField="True" IsReadOnly="False"
											IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="1,2,3,4,5,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="BPAS06" runat="server" FieldTextBoxWidth="30px" DatabaseField="BPAS06" FieldTextBoxTabIndex="9"
											FieldLabelText="6: Anxiety" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,5,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="BPAS07" runat="server" FieldTextBoxWidth="30px" DatabaseField="BPAS07" FieldTextBoxTabIndex="10"
											FieldLabelText="7:  Sensitivity to Environment" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="1,2,3,4,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="BPASREL" runat="server" FieldTextBoxWidth="30px" DatabaseField="BPASREL" FieldTextBoxTabIndex="11"
											FieldLabelText="Reliability? (0=N, 1=Y)" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="BPAScmnt" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="200px" DatabaseField="BPAScmnt"
											FieldTextBoxTabIndex="12" FieldLabelText="Comments" IsDoubleEntryField="False" IsReadOnly="False"
											IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="TEXT" FieldTextBoxMaxLength="255" FieldTextBoxTextMode="MultiLine" FieldTextBoxHeight="150px"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
							<BR>
							<TABLE class="layout" id="table_readonly">
								<TR>
									<TD>
										<def:datafieldcontrol id="created" runat="server" FieldTextBoxWidth="150px" DatabaseField="created" FieldTextBoxTabIndex="14"
											FieldLabelText="created" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="DATE" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="createdBy" runat="server" FieldTextBoxWidth="150px" DatabaseField="createdBy"
											FieldTextBoxTabIndex="15" FieldLabelText="createdBy" IsDoubleEntryField="False" IsReadOnly="True"
											IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="TEXT" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="updated" runat="server" FieldTextBoxWidth="150px" DatabaseField="updated" FieldTextBoxTabIndex="16"
											FieldLabelText="updated" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="DATE" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="updatedBy" runat="server" FieldTextBoxWidth="150px" DatabaseField="updatedBy"
											FieldTextBoxTabIndex="17" FieldLabelText="updatedBy" IsDoubleEntryField="False" IsReadOnly="True"
											IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="TEXT" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
						</asp:Panel>
					</asp:Content>
