<%@ Page language="c#" Inherits="FEINDataEntryForms.fein_le_CommunityDiag" CodeFile="fein_le_CommunityDiag.aspx.cs"  MasterPageFile="~/UWAC.master" %>
<%@ Register TagPrefix="def" Namespace="DataEntryFramework.Old" %>

<asp:Content ID="Content1" ContentPlaceHolderID="oBodyPlaceHolder" runat="server">
						<def:dataentrycontroller id="DataEntryController1" runat="server" LookupField1="id" VerifiedField="verified"
							PrimaryKeyField="pk" MeasureName="FEIN Community Diagnosis" LookupTextBox2Visible="False" LookupTextBox1LabelText="FEIN ID:"
							DatabaseTable="fein_le_communitydiag" LookupField1DataType="TEXT" ShowScoreButton="False" StudyMeasID="674"></def:dataentrycontroller>
						<table id="table_insert" class="layout">
							<tr>
								<td><def:datafieldcontrol id="id" runat="server" FieldDataType="TEXT" IsInsertField="True" IsInsertValueRequired="True"
										IsEntryField="False" IsEntryValueRequired="False" IsReadOnly="False" IsDoubleEntryField="False" FieldLabelText="FEIN ID"
										FieldTextBoxTabIndex="2" DatabaseField="id" FieldTextBoxWidth="80px" FieldLabelWidth="80px"></def:datafieldcontrol>
								</td>
							</tr>
						</table>
						<br>
						<asp:Panel ID="mainPanel" Runat="server">
							<TABLE class="grid">
								<TR>
									<TD>0=No, 1=Yes, 9=Unknown/Missing<BR>
										<def:datafieldcontrol id="CDADOS" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="40px" DatabaseField="CDADOS"
											FieldTextBoxTabIndex="3" FieldLabelText="ADOS" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>0=No, 1=Yes, 9=Unknown/Missing<BR>
										<def:datafieldcontrol id="CDADI" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="40px" DatabaseField="CDADI"
											FieldTextBoxTabIndex="4" FieldLabelText="ADI" IsDoubleEntryField="True" IsReadOnly="False" IsEntryValueRequired="True"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="INT" ValidList="0,1,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>1=Psychologist<BR>
										2=Psychiatrist<BR>
										3=Pediatrician<BR>
										4=Neurologist<BR>
										5=Physician<BR>
										6=Multi-Disciplinary<BR>
										9=Unknown/Missing<BR>
										<def:datafieldcontrol id="CDDIAGN" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="40px" DatabaseField="CDDIAGN"
											FieldTextBoxTabIndex="5" FieldLabelText="Diagnostician" IsDoubleEntryField="True" IsReadOnly="False"
											IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="1,2,3,4,5,6,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>0=No, 1=Yes, 9=Unknown/Missing<BR>
										<def:datafieldcontrol id="CDDSMC" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="40px" DatabaseField="CDDSMC"
											FieldTextBoxTabIndex="6" FieldLabelText="DSM-IV Criteria" IsDoubleEntryField="True" IsReadOnly="False"
											IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="0,1,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>1=Autism<BR>
										2=PDD<BR>
										3=Aspergers<BR>
										4=ASD<BR>
										5=Other(see notes)<BR>
										9=Unknown/Missing<BR>
										<def:datafieldcontrol id="Datafieldcontrol1" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="40px"
											DatabaseField="CDDIAG" FieldTextBoxTabIndex="7" FieldLabelText="Diagnosis" IsDoubleEntryField="True"
											IsReadOnly="False" IsEntryValueRequired="True" IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False"
											FieldDataType="INT" ValidList="1,2,3,4,5,9"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="CDNOTES" runat="server" FieldLabelWidth="80px" FieldTextBoxWidth="300px" DatabaseField="CDNOTES"
											FieldTextBoxTabIndex="7" FieldLabelText="Notes" IsDoubleEntryField="False" IsReadOnly="False" IsEntryValueRequired="False"
											IsEntryField="True" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT" FieldTextBoxHeight="200px"
											FieldTextBoxTextMode="MultiLine" FieldTextBoxMaxLength="255"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
							<BR>
							<TABLE class="layout">
								<TR>
									<TD>
										<def:datafieldcontrol id="created" runat="server" FieldLabelWidth="80px" DatabaseField="created" FieldTextBoxTabIndex="9"
											FieldLabelText="created" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="DATE" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="createdBy" runat="server" FieldLabelWidth="80px" DatabaseField="createdBy" FieldTextBoxTabIndex="10"
											FieldLabelText="createdBy" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="updated" runat="server" FieldLabelWidth="80px" DatabaseField="updated" FieldTextBoxTabIndex="11"
											FieldLabelText="updated" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="DATE" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
								<TR>
									<TD>
										<def:datafieldcontrol id="updatedBy" runat="server" FieldLabelWidth="80px" DatabaseField="updatedBy" FieldTextBoxTabIndex="12"
											FieldLabelText="updatedBy" IsDoubleEntryField="False" IsReadOnly="True" IsEntryValueRequired="False"
											IsEntryField="False" IsInsertValueRequired="False" IsInsertField="False" FieldDataType="TEXT" RenderReadOnlyAsDiv="True"></def:datafieldcontrol></TD>
								</TR>
							</TABLE>
						</asp:Panel>
					</asp:Content>
