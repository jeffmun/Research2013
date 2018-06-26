<%@ Page language="c#" Inherits="gen_bpas.gen_bpas" CodeFile="gen_bpas.aspx.cs"  MasterPageFile="~/UWAC.master" %>
<%@ Register TagPrefix="def" Namespace="DataEntryFramework.Old" %>

<asp:Content ID="Content1" ContentPlaceHolderID="oBodyPlaceHolder" runat="server">
						<def:dataentrycontroller id="DataEntryController1" runat="server" StudyMeasID="127" MeasureName="GEN BPASS"
							VerifiedField="verified" PrimaryKeyField="bpas_pk" LookupTextBox1LabelText="GEN ID:" LookupTextBox2Visible="False"
							LookupField1="indid" DatabaseTable="gen_bpas"  ></def:dataentrycontroller>
						<table class="layout" id="table_insert">
							<tr>
								<td><def:datafieldcontrol id="INDID" runat="server" FieldTextBoxWidth="80px" FieldLabelWidth="80px" DatabaseField="INDID"
										FieldTextBoxTabIndex="2" FieldLabelText="GEN ID" IsDoubleEntryField="False" IsReadOnly="False" IsEntryValueRequired="False"
										IsEntryField="False" IsInsertValueRequired="True" IsInsertField="True" FieldDataType="INT"></def:datafieldcontrol></td>
							</tr>
							<tr>
								<td><def:datafieldcontrol id="BPASDATE" runat="server" FieldTextBoxWidth="80px" FieldLabelWidth="80px" DatabaseField="BPASDATE"
										FieldTextBoxTabIndex="3" FieldLabelText="Date" IsDoubleEntryField="False" IsReadOnly="False" IsEntryValueRequired="True"
										IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="DATE" FormatString="{0:d}"></def:datafieldcontrol></td>
							</tr>
							<tr>
								<td><def:datafieldcontrol id="BPASclin" runat="server" FieldTextBoxWidth="80px" FieldLabelWidth="80px" DatabaseField="BPASclin"
										FieldTextBoxTabIndex="4" FieldLabelText="Clinician" IsDoubleEntryField="False" IsReadOnly="False"
										IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
										FieldDataType="TEXT"></def:datafieldcontrol></td>
							</tr>
						</table>
						<asp:panel id="mainPanel" Runat="server">
							<BR>
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
									<TD height="30">
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
										<def:datafieldcontrol id="BPASREL" runat="server" FieldTextBoxWidth="30px" FieldLabelWidth="200px" DatabaseField="BPASREL"
											FieldTextBoxTabIndex="14" FieldLabelText="Reliability (0=NO, 1=YES)" IsDoubleEntryField="False" IsReadOnly="False"
											IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="0,1"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="BPAScmnt" runat="server" FieldTextBoxWidth="200px" FieldLabelWidth="200px" DatabaseField="BPAScmnt"
											FieldTextBoxTabIndex="15" FieldLabelText="Comments" IsDoubleEntryField="False" IsReadOnly="False"
											IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="TEXT" FieldTextBoxMaxLength="100" FieldTextBoxHeight="150px" FieldTextBoxTextMode="MultiLine"></def:datafieldcontrol></TD>
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
