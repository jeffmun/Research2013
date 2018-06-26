<%@ Page language="c#" Inherits="GenericDataEntryForms.PegboardTest.PegboardTest" CodeFile="PegboardTest.aspx.cs"  MasterPageFile="~/UWAC.master" %>

<%@ Register TagPrefix="def" Namespace="DataEntryFramework" %>
<asp:Content ID="Content1" ContentPlaceHolderID="oBodyPlaceHolder" runat="server">
						<def:dataentrycontroller id="DataEntryController1" runat="server" DatabaseTable="ALL_PegboardTest" LookupField1="id"
							LookupTextBox2Visible="False" LookupTextBox1LabelText="Subject ID:" MeasureName="Pegboard Test" PrimaryKeyField="pt_pk"
							VerifiedField="verified" LookupField1DataType="TEXT"
							AllowedStudyMeasures="645,692,693"></def:dataentrycontroller>
						<table class="layout">
							<tr>
								<td>
									<def:datafieldcontrol id="id" runat="server" FieldDataType="TEXT" IsInsertField="True" IsInsertValueRequired="True"
										IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="ID"
										FieldTextBoxTabIndex="2" DatabaseField="id" FieldLabelWidth="80px" FieldTextBoxWidth="80px"></def:datafieldcontrol></td>
							</tr>
							<tr>
								<td>
									<def:datafieldcontrol id="ptdate" runat="server" FieldDataType="DATE" IsInsertField="False" IsInsertValueRequired="False"
										IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="Date"
										FieldTextBoxTabIndex="5" DatabaseField="ptdate" FormatString="{0:d}" FieldLabelWidth="80px" FieldTextBoxWidth="80px"></def:datafieldcontrol></td>
							</tr>
							<tr>
								<td>
									<def:datafieldcontrol id="ptexp" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
										IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="Experimenter"
										FieldTextBoxTabIndex="6" DatabaseField="ptexp" FieldLabelWidth="80px" FieldTextBoxWidth="80px"></def:datafieldcontrol></td>
							</tr>
						</table>
						<asp:Panel ID="mainPanel" Runat="server">
							<def:datafieldcontrol id="ptDomHnd" runat="server" FieldTextBoxWidth="40px" DatabaseField="ptDomHnd" FieldTextBoxTabIndex="7"
								FieldLabelText="Dominant Hand (R=Right, L=Left)" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
								IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT" FieldTextBoxMaxLength="1"
								ValidList="R,L"></def:datafieldcontrol>
							<BR>
							<TABLE class="grid">
								<TR>
									<TD></TD>
									<TD class="heading">DH-1</TD>
									<TD class="heading">DH-2</TD>
									<TD class="heading">DH-3</TD>
									<TD class="heading">NDH-4</TD>
								</TR>
								<TR>
									<TD class="heading">Score</TD>
									<TD>
										<def:datafieldcontrol id="ptDH1" runat="server" FieldTextBoxWidth="60px" DatabaseField="ptDH1" FieldTextBoxTabIndex="8"
											FieldLabelText="ptDH1" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False" IsEntryField="True"
											IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="ptDH2" runat="server" FieldTextBoxWidth="60px" DatabaseField="ptDH2" FieldTextBoxTabIndex="10"
											FieldLabelText="ptDH2" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False" IsEntryField="True"
											IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="ptDH3" runat="server" FieldTextBoxWidth="60px" DatabaseField="ptDH3" FieldTextBoxTabIndex="12"
											FieldLabelText="ptDH3" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False" IsEntryField="True"
											IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="ptNDH4" runat="server" FieldTextBoxWidth="60px" DatabaseField="ptNDH4" FieldTextBoxTabIndex="14"
											FieldLabelText="ptNDH4" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD class="heading">Validity<BR>
										(1=valid, 2=questionable, 3=invalid)</TD>
									<TD>
										<def:datafieldcontrol id="ptDH1v" runat="server" FieldTextBoxWidth="60px" DatabaseField="ptDH1v" FieldTextBoxTabIndex="9"
											FieldLabelText="ptDH1v" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="ptDH2v" runat="server" FieldTextBoxWidth="60px" DatabaseField="ptDH2v" FieldTextBoxTabIndex="11"
											FieldLabelText="ptDH2v" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="ptDH3v" runat="server" FieldTextBoxWidth="60px" DatabaseField="ptDH3v" FieldTextBoxTabIndex="13"
											FieldLabelText="ptDH3v" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="ptNDH4v" runat="server" FieldTextBoxWidth="60px" DatabaseField="ptNDH4v" FieldTextBoxTabIndex="15"
											FieldLabelText="ptNDH4v" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
							<BR>
							<BR>
							<TABLE class="grid">
								<TR>
									<TD></TD>
									<TD class="heading">AE</TD>
									<TD class="heading">SS</TD>
									<TD class="heading">Percentile</TD>
								</TR>
								<TR>
									<TD class="heading">DH</TD>
									<TD>
										<def:datafieldcontrol id="ptAEDHt" runat="server" FieldTextBoxWidth="60px" DatabaseField="ptAEDHt" FieldTextBoxTabIndex="16"
											FieldLabelText="ptAEDHt" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="ptSSDH" runat="server" FieldTextBoxWidth="60px" DatabaseField="ptSSDH" FieldTextBoxTabIndex="18"
											FieldLabelText="ptSSDH" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="ptPerDHt" runat="server" FieldTextBoxWidth="60px" DatabaseField="ptPerDHt" FieldTextBoxTabIndex="20"
											FieldLabelText="ptPerDHt" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD class="heading">NDH</TD>
									<TD>
										<def:datafieldcontrol id="ptAENDHt" runat="server" FieldTextBoxWidth="60px" DatabaseField="ptAENDHt" FieldTextBoxTabIndex="17"
											FieldLabelText="ptAENDHt" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="ptSSNDH" runat="server" FieldTextBoxWidth="60px" DatabaseField="ptSSNDH" FieldTextBoxTabIndex="19"
											FieldLabelText="ptSSNDH" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ShowFieldLabel="False"></def:datafieldcontrol></TD>
									<TD>
										<def:datafieldcontrol id="ptPerNDHt" runat="server" FieldTextBoxWidth="60px" DatabaseField="ptPerNDHt"
											FieldTextBoxTabIndex="21" FieldLabelText="ptPerNDHt" IsDoubleEntryField="True" IsReadOnly="False"
											IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="TEXT" ShowFieldLabel="False"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
							<BR>
							<BR>
							<TABLE class="layout">
								<TR>
									<TD>
										<def:datafieldcontrol id="created" runat="server" FieldLabelWidth="80px" DatabaseField="created" FieldTextBoxTabIndex="32"
											FieldLabelText="created" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="DATE" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="createdBy" runat="server" FieldLabelWidth="80px" DatabaseField="createdBy" FieldTextBoxTabIndex="33"
											FieldLabelText="createdBy" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="updated" runat="server" FieldLabelWidth="80px" DatabaseField="updated" FieldTextBoxTabIndex="34"
											FieldLabelText="updated" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="DATE" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="updatedBy" runat="server" FieldLabelWidth="80px" DatabaseField="updatedBy" FieldTextBoxTabIndex="35"
											FieldLabelText="updatedBy" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
						</asp:Panel>
					</asp:Content>
