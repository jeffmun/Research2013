<%@ Page language="c#" Inherits="GenericDataEntryForms.cyto.cyto" CodeFile="cyto.aspx.cs"  MasterPageFile="~/UWAC.master" %>
<%@ Register TagPrefix="def" Namespace="DataEntryFramework" %>

<asp:Content ID="Content1" ContentPlaceHolderID="oBodyPlaceHolder" runat="server">
						<def:dataentrycontroller id="DataEntryController1" runat="server" LookupField1DataType="TEXT" ShowScoreButton="False"
							VerifiedField="verified" PrimaryKeyField="cy_pk" MeasureName="Cytogenetics Rating" LookupTextBox1LabelText="Subject ID:"
							LookupTextBox2Visible="False" LookupField1="id" DatabaseTable="all_cyto" AllowedStudyMeasures="146"></def:dataentrycontroller>
						<table id="table_insert" class="layout">
							<tr>
								<td><def:datafieldcontrol id="ID" runat="server" FieldDataType="TEXT" IsInsertField="True" IsInsertValueRequired="True"
										IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="ID"
										FieldTextBoxTabIndex="2" DatabaseField="ID" FieldLabelWidth="80px" FieldTextBoxWidth="80px"></def:datafieldcontrol>
								</td>
							</tr>
						</table>
						<asp:Panel Runat="server" ID="mainPanel">
							<TABLE class="layout">
								<TR>
									<TD>
										<def:datafieldcontrol id="cyClin" runat="server" DatabaseField="cyClin" FieldTextBoxTabIndex="5" FieldLabelText="Clin"
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="TEXT" FieldLabelWidth="80px" FieldTextBoxWidth="80px"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="cyDate" runat="server" DatabaseField="cyDate" FieldTextBoxTabIndex="6" FieldLabelText="Date"
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="DATE" FieldLabelWidth="80px" FieldTextBoxWidth="80px" FormatString="{0:d}"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="cyYesNo" runat="server" DatabaseField="cyYesNo" FieldTextBoxTabIndex="7" FieldLabelText="Cyto (1=YES,0=NO,9=Missing)"
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" FieldLabelWidth="80px" FieldTextBoxWidth="40px" ValidList="0,1,9"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
							<BR>
							<TABLE class="grid">
								<TR>
									<TD class="heading">Family Member</TD>
									<TD class="heading">ASD</TD>
									<TD class="heading">MR</TD>
									<TD class="heading">Physical<BR>
										Anomaly</TD>
								<TR>
									<TD class="heading">Mother</TD>
									<TD>
										<def:datafieldcontrol id="cyMoASD" runat="server" DatabaseField="cyMoASD" FieldTextBoxTabIndex="10" FieldLabelText="cyMoASD"
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" FieldTextBoxWidth="40px" ShowFieldLabel="False" FieldTextBoxTextMode="SingleLine"
											FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="cyMoMR" runat="server" DatabaseField="cyMoMR" FieldTextBoxTabIndex="10" FieldLabelText="cyMoMR"
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" FieldTextBoxWidth="40px" ShowFieldLabel="False" FieldTextBoxTextMode="SingleLine"
											FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="cyMoPA" runat="server" DatabaseField="cyMoPA" FieldTextBoxTabIndex="10" FieldLabelText="cyMoPA"
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" FieldTextBoxWidth="40px" ShowFieldLabel="False" FieldTextBoxTextMode="SingleLine"
											FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
								<TR>
									<TD class="heading">Mother's Family</TD>
									<TD>
										<def:datafieldcontrol id="cyMoFASD" runat="server" DatabaseField="cyMoFASD" FieldTextBoxTabIndex="10"
											FieldLabelText="cyMoFASD" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" FieldTextBoxWidth="40px"
											ShowFieldLabel="False" FieldTextBoxTextMode="SingleLine" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="cyMoFMR" runat="server" DatabaseField="cyMoFMR" FieldTextBoxTabIndex="10" FieldLabelText="cyMoFMR"
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" FieldTextBoxWidth="40px" ShowFieldLabel="False" FieldTextBoxTextMode="SingleLine"
											FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="cyMoFPA" runat="server" DatabaseField="cyMoFPA" FieldTextBoxTabIndex="10" FieldLabelText="cyMoFPA"
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" FieldTextBoxWidth="40px" ShowFieldLabel="False" FieldTextBoxTextMode="SingleLine"
											FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
								<TR>
									<TD class="heading">Father</TD>
									<TD>
										<def:datafieldcontrol id="cyFaASD" runat="server" DatabaseField="cyFaASD" FieldTextBoxTabIndex="10" FieldLabelText="cyFaASD"
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" FieldTextBoxWidth="40px" ShowFieldLabel="False" FieldTextBoxTextMode="SingleLine"
											FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="cyFaMR" runat="server" DatabaseField="cyFaMR" FieldTextBoxTabIndex="10" FieldLabelText="cyFaMR"
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" FieldTextBoxWidth="40px" ShowFieldLabel="False" FieldTextBoxTextMode="SingleLine"
											FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="cyFaPA" runat="server" DatabaseField="cyFaPA" FieldTextBoxTabIndex="10" FieldLabelText="cyFaPA"
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" FieldTextBoxWidth="40px" ShowFieldLabel="False" FieldTextBoxTextMode="SingleLine"
											FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
								<TR>
									<TD class="heading">Father's Family</TD>
									<TD>
										<def:datafieldcontrol id="cyFaFASD" runat="server" DatabaseField="cyFaFASD" FieldTextBoxTabIndex="10"
											FieldLabelText="cyFaFASD" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" FieldTextBoxWidth="40px"
											ShowFieldLabel="False" FieldTextBoxTextMode="SingleLine" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="cyFaFMR" runat="server" DatabaseField="cyFaFMR" FieldTextBoxTabIndex="10" FieldLabelText="cyFaFMR"
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" FieldTextBoxWidth="40px" ShowFieldLabel="False" FieldTextBoxTextMode="SingleLine"
											FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="cyFaFPA" runat="server" DatabaseField="cyFaFPA" FieldTextBoxTabIndex="10" FieldLabelText="cyFaFPA"
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" FieldTextBoxWidth="40px" ShowFieldLabel="False" FieldTextBoxTextMode="SingleLine"
											FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
								<TR>
									<TD class="heading">Proband #1</TD>
									<TD>
										<def:datafieldcontrol id="cyPr1ASD" runat="server" DatabaseField="cyPr1ASD" FieldTextBoxTabIndex="10"
											FieldLabelText="cyPr1ASD" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" FieldTextBoxWidth="40px"
											ShowFieldLabel="False" FieldTextBoxTextMode="SingleLine" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="cyPr1MR" runat="server" DatabaseField="cyPr1MR" FieldTextBoxTabIndex="10" FieldLabelText="cyPr1MR"
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" FieldTextBoxWidth="40px" ShowFieldLabel="False" FieldTextBoxTextMode="SingleLine"
											FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="cyPr1PA" runat="server" DatabaseField="cyPr1PA" FieldTextBoxTabIndex="10" FieldLabelText="cyPr1PA"
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" FieldTextBoxWidth="40px" ShowFieldLabel="False" FieldTextBoxTextMode="SingleLine"
											FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
								<TR>
									<TD class="heading">Proband #2</TD>
									<TD>
										<def:datafieldcontrol id="cyPr2ASD" runat="server" DatabaseField="cyPr2ASD" FieldTextBoxTabIndex="10"
											FieldLabelText="cyPr2ASD" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" FieldTextBoxWidth="40px"
											ShowFieldLabel="False" FieldTextBoxTextMode="SingleLine" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="cyPr2MR" runat="server" DatabaseField="cyPr2MR" FieldTextBoxTabIndex="10" FieldLabelText="cyPr2MR"
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" FieldTextBoxWidth="40px" ShowFieldLabel="False" FieldTextBoxTextMode="SingleLine"
											FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="cyPr2PA" runat="server" DatabaseField="cyPr2PA" FieldTextBoxTabIndex="10" FieldLabelText="cyPr2PA"
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" FieldTextBoxWidth="40px" ShowFieldLabel="False" FieldTextBoxTextMode="SingleLine"
											FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
								<TR>
									<TD class="heading">Siblings</TD>
									<TD>
										<def:datafieldcontrol id="cySibASD" runat="server" DatabaseField="cySibASD" FieldTextBoxTabIndex="10"
											FieldLabelText="cySibASD" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" FieldTextBoxWidth="40px"
											ShowFieldLabel="False" FieldTextBoxTextMode="SingleLine" FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="cySibMR" runat="server" DatabaseField="cySibMR" FieldTextBoxTabIndex="10" FieldLabelText="cySibMR"
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" FieldTextBoxWidth="40px" ShowFieldLabel="False" FieldTextBoxTextMode="SingleLine"
											FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="cySibPA" runat="server" DatabaseField="cySibPA" FieldTextBoxTabIndex="10" FieldLabelText="cySibPA"
											IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" FieldTextBoxWidth="40px" ShowFieldLabel="False" FieldTextBoxTextMode="SingleLine"
											FieldTextBoxTextDefault="0"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
							<TABLE class="layout">
								<TR>
									<TD>
										<def:datafieldcontrol id="cyCmnt" runat="server" DatabaseField="cyCmnt" FieldTextBoxTabIndex="29" FieldLabelText="Comments"
											IsDoubleEntryField="False" IsReadOnly="False" IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="TEXT" FieldLabelWidth="80px" FieldTextBoxWidth="200px" FieldTextBoxTextMode="MultiLine"
											FieldTextBoxMaxLength="400" FieldTextBoxHeight="150px"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
							<BR>
							<TABLE class="layout" id="table_readonly">
								<TR>
									<TD>
										<def:datafieldcontrol id="created" runat="server" DatabaseField="created" FieldTextBoxTabIndex="31" FieldLabelText="created"
											IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="DATE" FieldLabelWidth="80px" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="createdBy" runat="server" DatabaseField="createdBy" FieldTextBoxTabIndex="32"
											FieldLabelText="createdBy" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT" FieldLabelWidth="80px"
											RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="updated" runat="server" DatabaseField="updated" FieldTextBoxTabIndex="33" FieldLabelText="updated"
											IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False" IsEntryField="False" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="DATE" FieldLabelWidth="80px" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="updatedBy" runat="server" DatabaseField="updatedBy" FieldTextBoxTabIndex="34"
											FieldLabelText="updatedBy" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT" FieldLabelWidth="80px"
											RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
						</asp:Panel>
					</asp:Content>
