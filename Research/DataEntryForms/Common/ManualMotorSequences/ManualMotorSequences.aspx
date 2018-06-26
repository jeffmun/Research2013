<%@ Register TagPrefix="def" Namespace="DataEntryFramework" %>

<%@ Page language="c#" Inherits="GenericDataEntryForms.ManualMotorSequences.ManualMotorSequences" CodeFile="ManualMotorSequences.aspx.cs"  MasterPageFile="~/UWAC.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="oBodyPlaceHolder" runat="server">
						<def:dataentrycontroller id="DataEntryController1" runat="server" DatabaseTable="ALL_ManualMotorSequences"
							LookupField1="id" LookupTextBox2Visible="False" LookupTextBox1LabelText="Subject ID:" MeasureName="Nepsy-Manual Motor Sequences"
							PrimaryKeyField="mms_pk" VerifiedField="verified" LookupField1DataType="TEXT" AllowedStudyMeasures="720"></def:dataentrycontroller>
						<table id="table_insert" class="layout">
							<tr>
								<td><def:datafieldcontrol id="id" runat="server" FieldDataType="TEXT" IsInsertField="True" IsInsertValueRequired="True"
										IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="ID"
										FieldTextBoxTabIndex="2" DatabaseField="id" FieldLabelWidth="80px" FieldTextBoxWidth="80px"></def:datafieldcontrol>
								</td>
							</tr>
							<tr>
								<td><def:datafieldcontrol id="mmsdate" runat="server" FieldDataType="DATE" IsInsertField="False" IsInsertValueRequired="False"
										IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="True" FieldLabelText="Date"
										FieldTextBoxTabIndex="5" DatabaseField="mmsdate" FormatString="{0:d}" FieldLabelWidth="80px" FieldTextBoxWidth="80px"></def:datafieldcontrol>
								</td>
							</tr>
							<tr>
								<td><def:datafieldcontrol id="mmsexp" runat="server" FieldDataType="TEXT" IsInsertField="False" IsInsertValueRequired="False"
										IsEntryField="True" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="Experimenter"
										FieldTextBoxTabIndex="6" DatabaseField="mmsexp" FieldLabelWidth="80px" FieldTextBoxWidth="80px"></def:datafieldcontrol>
								</td>
							</tr>
						</table>
						<br>
						<asp:Panel ID="mainPanel" Runat="server">
							<TABLE class="layout" id="table_entry">
								<TR>
									<TD>
										<def:datafieldcontrol id="mmsTS" runat="server" FieldTextBoxWidth="60px" FieldLabelWidth="100px" DatabaseField="mmsTS"
											FieldTextBoxTabIndex="7" FieldLabelText="Total Score" IsDoubleEntryField="True" IsReadOnly="False"
											IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="mmsPERt" runat="server" FieldTextBoxWidth="60px" FieldLabelWidth="100px" DatabaseField="mmsPERt"
											FieldTextBoxTabIndex="9" FieldLabelText="Percentile" IsDoubleEntryField="True" IsReadOnly="False"
											IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="TEXT" DESIGNTIMEDRAGDROP="87" FieldTextBoxMaxLength="10"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="mmsCLS" runat="server" FieldTextBoxWidth="150px" FieldLabelWidth="100px" DatabaseField="mmsCLS"
											FieldTextBoxTabIndex="9" FieldLabelText="Classification" IsDoubleEntryField="True" IsReadOnly="False"
											IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="TEXT" FieldTextBoxMaxLength="50"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD><B>(0=NO, 1=YES, 9=Missing)</B></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="mmsQo" runat="server" FieldTextBoxWidth="40px" FieldLabelWidth="150px" DatabaseField="mmsQo"
											FieldTextBoxTabIndex="10" FieldLabelText="Qualitative Observations" IsDoubleEntryField="True" IsReadOnly="False"
											IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="0,1,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="mmsO" runat="server" FieldTextBoxWidth="40px" FieldLabelWidth="150px" DatabaseField="mmsO"
											FieldTextBoxTabIndex="11" FieldLabelText="Overflow" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="False"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="mmsP" runat="server" FieldTextBoxWidth="40px" FieldLabelWidth="150px" DatabaseField="mmsP"
											FieldTextBoxTabIndex="12" FieldLabelText="Perseveration" IsDoubleEntryField="True" IsReadOnly="False"
											IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="0,1,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="mmsLAM" runat="server" FieldTextBoxWidth="40px" FieldLabelWidth="150px" DatabaseField="mmsLAM"
											FieldTextBoxTabIndex="13" FieldLabelText="Loss of asym. Movement" IsDoubleEntryField="True" IsReadOnly="False"
											IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="0,1,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="mmsBM" runat="server" FieldTextBoxWidth="40px" FieldLabelWidth="150px" DatabaseField="mmsBM"
											FieldTextBoxTabIndex="14" FieldLabelText="Body Movement" IsDoubleEntryField="True" IsReadOnly="False"
											IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="0,1,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="mmsFT" runat="server" FieldTextBoxWidth="40px" FieldLabelWidth="150px" DatabaseField="mmsFT"
											FieldTextBoxTabIndex="15" FieldLabelText="Forceful Tapping" IsDoubleEntryField="True" IsReadOnly="False"
											IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="0,1,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="mmsvalid" runat="server" FieldTextBoxWidth="40px" FieldLabelWidth="250px" DatabaseField="mmsvalid"
											FieldTextBoxTabIndex="16" FieldLabelText="Validity (1=valid, 2=questionable, 3=invalid)" IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="False" IsEntryField="True" IsInsertValueRequired="False"
											IsInsertField="False" FieldDataType="INT" ValidList="1,2,3"></def:datafieldcontrol></TD>
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
