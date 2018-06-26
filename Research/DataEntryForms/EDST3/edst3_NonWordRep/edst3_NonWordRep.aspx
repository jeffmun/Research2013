<%@ Page language="c#" Inherits="edst3_NonWordRep.edst3_NonWordRep" CodeFile="edst3_NonWordRep.aspx.cs"  MasterPageFile="~/UWAC.master" %>

<%@ Register TagPrefix="def" Namespace="DataEntryFramework.Old" %>
<asp:Content ID="Content1" ContentPlaceHolderID="oBodyPlaceHolder" runat="server">
						<def:dataentrycontroller id="DataEntryController1" runat="server" VerifiedField="verified" PrimaryKeyField="nr_pk"
							MeasureName="EDST3 Nonword Repetition" LookupTextBox1LabelText="EDS ID:" LookupTextBox2Visible="False"
							LookupField1="edsid" DatabaseTable="edst3_NonwordRep"></def:dataentrycontroller>
						<table id="table_insert" class="layout">
							<tr>
								<td><def:datafieldcontrol id="edsid" runat="server" FieldDataType="INT" IsInsertField="True" IsInsertValueRequired="True"
										IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="EDS ID"
										FieldTextBoxTabIndex="2" DatabaseField="edsid" FieldLabelWidth="80px" FieldTextBoxWidth="60px"></def:datafieldcontrol>
								</td>
							</tr>
							<tr>
								<td><def:datafieldcontrol id="CTOPdate" runat="server" FieldDataType="DATE" IsInsertField="False" IsInsertValueRequired="False"
										IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="Test Date"
										FieldTextBoxTabIndex="3" DatabaseField="CTOPdate" FieldLabelWidth="80px" FieldTextBoxWidth="60px"
										FormatString="{0:d}"></def:datafieldcontrol>
								</td>
							</tr>
							<tr>
								<td><def:datafieldcontrol id="CTOPclin" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
										IsEntryField="True" IsEntryValueRequired="True" IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="Clinician"
										FieldTextBoxTabIndex="4" DatabaseField="CTOPclin" FieldLabelWidth="80px" FieldTextBoxWidth="60px"></def:datafieldcontrol>
								</td>
							</tr>
						</table>
						<br/>
						<asp:Panel Runat="server" ID="mainPanel">
							<TABLE class="grid" id="table_entry">
								<TR>
									<TD>
										<def:datafieldcontrol id="NR_raw" runat="server" DatabaseField="NR_raw" FieldTextBoxTabIndex="5" FieldLabelText="Total Raw Score (use -99 for missing)"
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" FieldLabelWidth="250px" FieldTextBoxWidth="30px" RegEx="^([0-9]|1[0-8]|-99)$"
											RegExDescription="Value must be between 0 and 18 or -99"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="CTOPvld" runat="server" DatabaseField="CTOPvld" FieldTextBoxTabIndex="6" FieldLabelText="Validity (1=valid, 2=Questionable, 3=Invalid)"
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" FieldLabelWidth="250px" FieldTextBoxWidth="30px" ValidList="1,2,3"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="CTOPcmnt" runat="server" DatabaseField="CTOPcmnt" FieldTextBoxTabIndex="7" FieldLabelText="Comments"
											IsDoubleEntryField="False" IsReadOnly="False" IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="TEXT" FieldLabelWidth="80px" FieldTextBoxWidth="200px" FieldTextBoxMaxLength="100"
											FieldTextBoxTextMode="MultiLine" FieldTextBoxHeight="150px"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
							<br/>
							<TABLE class="layout" id="table_readonly">
								<TR>
									<TD>
										<def:datafieldcontrol id="created" runat="server" DatabaseField="created" FieldTextBoxTabIndex="9" FieldLabelText="created"
											IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="DATE" FieldLabelWidth="80px" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="createdBy" runat="server" DatabaseField="createdBy" FieldTextBoxTabIndex="10"
											FieldLabelText="createdBy" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT" FieldLabelWidth="80px"
											RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="updated" runat="server" DatabaseField="updated" FieldTextBoxTabIndex="11" FieldLabelText="updated"
											IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="DATE" FieldLabelWidth="80px" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="updatedBy" runat="server" DatabaseField="updatedBy" FieldTextBoxTabIndex="12"
											FieldLabelText="updatedBy" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT" FieldLabelWidth="80px"
											RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
						</asp:Panel>
					</asp:Content>
