<%@ Page language="c#" Inherits="gen_wms.gen_wms" CodeFile="gen_wms.aspx.cs"  MasterPageFile="~/UWAC.master" %>
<%@ Register TagPrefix="def" Namespace="DataEntryFramework.Old" %>

<asp:Content ID="Content1" ContentPlaceHolderID="oBodyPlaceHolder" runat="server">
						<def:dataentrycontroller id="DataEntryController1" runat="server" DatabaseTable="gen_wms" LookupField1="indid"
							LookupTextBox2Visible="False" LookupTextBox1LabelText="GEN ID:" MeasureName="GEN WMS" PrimaryKeyField="wms_pk"
							VerifiedField="verified" StudyMeasID="129"></def:dataentrycontroller>
						<table id="table_insert" class="layout">
							<tr>
								<td><def:datafieldcontrol id="indid" runat="server" FieldDataType="INT" IsInsertField="True" IsInsertValueRequired="True"
										IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="GEN ID"
										FieldTextBoxTabIndex="2" DatabaseField="indid" FieldTextBoxWidth="80px" FieldLabelWidth="80px" MinVal="1"
										MaxVal="99999"></def:datafieldcontrol>
								</td>
							</tr>
							<tr>
								<td><def:datafieldcontrol id="wmsdate" runat="server" FieldDataType="DATE" IsInsertField="False" IsInsertValueRequired="False"
										IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="Date"
										FieldTextBoxTabIndex="3" DatabaseField="wmsdate" FieldTextBoxWidth="80px" FieldLabelWidth="80px" FormatString="{0:d}"></def:datafieldcontrol>
								</td>
							</tr>
							<tr>
								<td><def:datafieldcontrol id="wmsclin" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
										IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="Clinician"
										FieldTextBoxTabIndex="5" DatabaseField="wmsclin" FieldTextBoxWidth="80px" FieldLabelWidth="80px"></def:datafieldcontrol>
								</td>
							</tr>
						</table>
						<br>
						<asp:Panel Runat="server" ID="mainPanel">
							<TABLE class="grid">
								<TR>
									<TD>Enter -99 if missing or<BR>
										not administered.</TD>
									<TD class="heading">Raw Score</TD>
									<TD class="heading">Scaled Score</TD>
								</TR>
								<TR>
									<TD class="heading">WMS Faces I (Immed.)</TD>
									<TD>
										<def:datafieldcontrol id="wmsraw1" runat="server" FieldTextBoxWidth="40px" DatabaseField="wmsraw1" FieldTextBoxTabIndex="6"
											FieldLabelText="cmsraw1" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ShowFieldLabel="False"
											RegEx="^([0-9]|[1-3][0-9]|4[0-8]|-99)$" RegExDescription="Value must be between 0 and 48 or -99"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="wmsss1" runat="server" DatabaseField="wmsss1" FieldTextBoxTabIndex="8" FieldLabelText="cmsss1"
											IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ShowFieldLabel="False" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD class="heading">WMS Faces II (Delayed)</TD>
									<TD>
										<def:datafieldcontrol id="wmsraw2" runat="server" FieldTextBoxWidth="40px" DatabaseField="wmsraw2" FieldTextBoxTabIndex="7"
											FieldLabelText="cmsraw2" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ShowFieldLabel="False"
											RegEx="^([0-9]|[1-3][0-9]|4[0-8]|-99)$" RegExDescription="Value must be between 0 and 48 or -99"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="wmsss2" runat="server" DatabaseField="wmsss2" FieldTextBoxTabIndex="9" FieldLabelText="cmsss2"
											IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ShowFieldLabel="False" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD colSpan="3">
										<def:datafieldcontrol id="wmsageyr" runat="server" DatabaseField="wmsageyr" FieldTextBoxTabIndex="4" FieldLabelText="Age (years):"
											IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
							<BR>
							<TABLE class="grid" id="table_entry">
								<TR>
									<TD>
										<def:datafieldcontrol id="wmsvld" runat="server" FieldTextBoxWidth="30px" DatabaseField="wmsvld" FieldTextBoxTabIndex="11"
											FieldLabelText="Validity (1=Yes, 2=Yes, w/probs, 3=No, Invalid)" IsDoubleEntryField="True" IsReadOnly="False"
											IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="1,2,3"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="wmscmnt" runat="server" FieldTextBoxWidth="200px" DatabaseField="wmscmnt" FieldTextBoxTabIndex="12"
											FieldLabelText="WMS Data comments:" IsDoubleEntryField="False" IsReadOnly="False" IsEntryValueRequired="False"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT" FieldTextBoxTextMode="MultiLine"
											FieldTextBoxHeight="150px"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
							<BR>
							<TABLE class="layout" id="table_readonly">
								<TR>
									<TD>
										<def:datafieldcontrol id="created" runat="server" FieldLabelWidth="80px" DatabaseField="created" FieldTextBoxTabIndex="14"
											FieldLabelText="created" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="DATE" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="createdBy" runat="server" FieldLabelWidth="80px" DatabaseField="createdBy" FieldTextBoxTabIndex="15"
											FieldLabelText="createdBy" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="updated" runat="server" FieldLabelWidth="80px" DatabaseField="updated" FieldTextBoxTabIndex="16"
											FieldLabelText="updated" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="DATE" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="updatedBy" runat="server" FieldLabelWidth="80px" DatabaseField="updatedBy" FieldTextBoxTabIndex="17"
											FieldLabelText="updatedBy" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
						</asp:Panel>
					</asp:Content>
